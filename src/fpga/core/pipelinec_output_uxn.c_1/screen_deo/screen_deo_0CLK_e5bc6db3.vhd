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
-- BIN_OP_EQ[uxn_device_h_l88_c6_ed31]
signal BIN_OP_EQ_uxn_device_h_l88_c6_ed31_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l88_c6_ed31_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l88_c6_ed31_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l101_c7_1756]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_1756_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_1756_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_1756_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_1756_return_output : unsigned(0 downto 0);

-- is_pixel_port_MUX[uxn_device_h_l88_c2_6371]
signal is_pixel_port_MUX_uxn_device_h_l88_c2_6371_cond : unsigned(0 downto 0);
signal is_pixel_port_MUX_uxn_device_h_l88_c2_6371_iftrue : unsigned(0 downto 0);
signal is_pixel_port_MUX_uxn_device_h_l88_c2_6371_iffalse : unsigned(0 downto 0);
signal is_pixel_port_MUX_uxn_device_h_l88_c2_6371_return_output : unsigned(0 downto 0);

-- layer_MUX[uxn_device_h_l88_c2_6371]
signal layer_MUX_uxn_device_h_l88_c2_6371_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l88_c2_6371_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l88_c2_6371_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l88_c2_6371_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l88_c2_6371]
signal color_MUX_uxn_device_h_l88_c2_6371_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l88_c2_6371_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l88_c2_6371_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l88_c2_6371_return_output : unsigned(3 downto 0);

-- ctrl_MUX[uxn_device_h_l88_c2_6371]
signal ctrl_MUX_uxn_device_h_l88_c2_6371_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l88_c2_6371_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l88_c2_6371_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l88_c2_6371_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l88_c2_6371]
signal y_MUX_uxn_device_h_l88_c2_6371_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l88_c2_6371_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l88_c2_6371_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l88_c2_6371_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l88_c2_6371]
signal auto_advance_MUX_uxn_device_h_l88_c2_6371_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l88_c2_6371_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l88_c2_6371_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l88_c2_6371_return_output : unsigned(7 downto 0);

-- flip_y_MUX[uxn_device_h_l88_c2_6371]
signal flip_y_MUX_uxn_device_h_l88_c2_6371_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l88_c2_6371_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l88_c2_6371_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l88_c2_6371_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l88_c2_6371]
signal ram_addr_MUX_uxn_device_h_l88_c2_6371_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l88_c2_6371_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l88_c2_6371_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l88_c2_6371_return_output : unsigned(15 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l88_c2_6371]
signal ctrl_mode_MUX_uxn_device_h_l88_c2_6371_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l88_c2_6371_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l88_c2_6371_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l88_c2_6371_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l88_c2_6371]
signal result_MUX_uxn_device_h_l88_c2_6371_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l88_c2_6371_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l88_c2_6371_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l88_c2_6371_return_output : device_out_result_t;

-- is_drawing_port_MUX[uxn_device_h_l88_c2_6371]
signal is_drawing_port_MUX_uxn_device_h_l88_c2_6371_cond : unsigned(0 downto 0);
signal is_drawing_port_MUX_uxn_device_h_l88_c2_6371_iftrue : unsigned(0 downto 0);
signal is_drawing_port_MUX_uxn_device_h_l88_c2_6371_iffalse : unsigned(0 downto 0);
signal is_drawing_port_MUX_uxn_device_h_l88_c2_6371_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l88_c2_6371]
signal x_MUX_uxn_device_h_l88_c2_6371_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l88_c2_6371_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l88_c2_6371_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l88_c2_6371_return_output : unsigned(15 downto 0);

-- flip_x_MUX[uxn_device_h_l88_c2_6371]
signal flip_x_MUX_uxn_device_h_l88_c2_6371_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l88_c2_6371_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l88_c2_6371_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l88_c2_6371_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_device_h_l88_c2_6371]
signal tmp8_MUX_uxn_device_h_l88_c2_6371_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l88_c2_6371_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l88_c2_6371_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l88_c2_6371_return_output : unsigned(7 downto 0);

-- is_sprite_port_MUX[uxn_device_h_l88_c2_6371]
signal is_sprite_port_MUX_uxn_device_h_l88_c2_6371_cond : unsigned(0 downto 0);
signal is_sprite_port_MUX_uxn_device_h_l88_c2_6371_iftrue : unsigned(0 downto 0);
signal is_sprite_port_MUX_uxn_device_h_l88_c2_6371_iffalse : unsigned(0 downto 0);
signal is_sprite_port_MUX_uxn_device_h_l88_c2_6371_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l89_c19_e190]
signal BIN_OP_EQ_uxn_device_h_l89_c19_e190_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l89_c19_e190_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l89_c19_e190_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l89_c19_dc46]
signal MUX_uxn_device_h_l89_c19_dc46_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l89_c19_dc46_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l89_c19_dc46_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l89_c19_dc46_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l90_c20_bdd7]
signal BIN_OP_EQ_uxn_device_h_l90_c20_bdd7_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l90_c20_bdd7_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l90_c20_bdd7_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l90_c20_fd90]
signal MUX_uxn_device_h_l90_c20_fd90_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l90_c20_fd90_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l90_c20_fd90_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l90_c20_fd90_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_device_h_l91_c21_788d]
signal BIN_OP_OR_uxn_device_h_l91_c21_788d_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_device_h_l91_c21_788d_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_device_h_l91_c21_788d_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l94_c3_12f4]
signal result_is_deo_done_MUX_uxn_device_h_l94_c3_12f4_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l94_c3_12f4_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l94_c3_12f4_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l94_c3_12f4_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l94_c3_12f4]
signal result_device_ram_address_MUX_uxn_device_h_l94_c3_12f4_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l94_c3_12f4_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l94_c3_12f4_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l94_c3_12f4_return_output : unsigned(7 downto 0);

-- MUX[uxn_device_h_l95_c32_9049]
signal MUX_uxn_device_h_l95_c32_9049_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l95_c32_9049_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l95_c32_9049_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l95_c32_9049_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l101_c11_4ff7]
signal BIN_OP_EQ_uxn_device_h_l101_c11_4ff7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l101_c11_4ff7_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l101_c11_4ff7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l106_c7_97b2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_97b2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_97b2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_97b2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_97b2_return_output : unsigned(0 downto 0);

-- layer_MUX[uxn_device_h_l101_c7_1756]
signal layer_MUX_uxn_device_h_l101_c7_1756_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l101_c7_1756_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l101_c7_1756_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l101_c7_1756_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l101_c7_1756]
signal color_MUX_uxn_device_h_l101_c7_1756_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l101_c7_1756_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l101_c7_1756_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l101_c7_1756_return_output : unsigned(3 downto 0);

-- ctrl_MUX[uxn_device_h_l101_c7_1756]
signal ctrl_MUX_uxn_device_h_l101_c7_1756_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l101_c7_1756_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l101_c7_1756_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l101_c7_1756_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l101_c7_1756]
signal y_MUX_uxn_device_h_l101_c7_1756_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l101_c7_1756_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l101_c7_1756_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l101_c7_1756_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l101_c7_1756]
signal auto_advance_MUX_uxn_device_h_l101_c7_1756_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l101_c7_1756_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l101_c7_1756_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l101_c7_1756_return_output : unsigned(7 downto 0);

-- flip_y_MUX[uxn_device_h_l101_c7_1756]
signal flip_y_MUX_uxn_device_h_l101_c7_1756_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l101_c7_1756_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l101_c7_1756_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l101_c7_1756_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l101_c7_1756]
signal ram_addr_MUX_uxn_device_h_l101_c7_1756_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l101_c7_1756_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l101_c7_1756_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l101_c7_1756_return_output : unsigned(15 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l101_c7_1756]
signal ctrl_mode_MUX_uxn_device_h_l101_c7_1756_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l101_c7_1756_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l101_c7_1756_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l101_c7_1756_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l101_c7_1756]
signal result_MUX_uxn_device_h_l101_c7_1756_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l101_c7_1756_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l101_c7_1756_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l101_c7_1756_return_output : device_out_result_t;

-- x_MUX[uxn_device_h_l101_c7_1756]
signal x_MUX_uxn_device_h_l101_c7_1756_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l101_c7_1756_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l101_c7_1756_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l101_c7_1756_return_output : unsigned(15 downto 0);

-- flip_x_MUX[uxn_device_h_l101_c7_1756]
signal flip_x_MUX_uxn_device_h_l101_c7_1756_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l101_c7_1756_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l101_c7_1756_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l101_c7_1756_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_device_h_l101_c7_1756]
signal tmp8_MUX_uxn_device_h_l101_c7_1756_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l101_c7_1756_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l101_c7_1756_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l101_c7_1756_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l102_c3_5212]
signal result_device_ram_address_MUX_uxn_device_h_l102_c3_5212_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l102_c3_5212_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l102_c3_5212_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l102_c3_5212_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l106_c11_ada2]
signal BIN_OP_EQ_uxn_device_h_l106_c11_ada2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l106_c11_ada2_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l106_c11_ada2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l117_c7_c075]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_c075_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_c075_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_c075_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_c075_return_output : unsigned(0 downto 0);

-- layer_MUX[uxn_device_h_l106_c7_97b2]
signal layer_MUX_uxn_device_h_l106_c7_97b2_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l106_c7_97b2_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l106_c7_97b2_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l106_c7_97b2_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l106_c7_97b2]
signal color_MUX_uxn_device_h_l106_c7_97b2_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l106_c7_97b2_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l106_c7_97b2_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l106_c7_97b2_return_output : unsigned(3 downto 0);

-- ctrl_MUX[uxn_device_h_l106_c7_97b2]
signal ctrl_MUX_uxn_device_h_l106_c7_97b2_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l106_c7_97b2_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l106_c7_97b2_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l106_c7_97b2_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l106_c7_97b2]
signal y_MUX_uxn_device_h_l106_c7_97b2_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l106_c7_97b2_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l106_c7_97b2_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l106_c7_97b2_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l106_c7_97b2]
signal auto_advance_MUX_uxn_device_h_l106_c7_97b2_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l106_c7_97b2_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l106_c7_97b2_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l106_c7_97b2_return_output : unsigned(7 downto 0);

-- flip_y_MUX[uxn_device_h_l106_c7_97b2]
signal flip_y_MUX_uxn_device_h_l106_c7_97b2_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l106_c7_97b2_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l106_c7_97b2_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l106_c7_97b2_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l106_c7_97b2]
signal ram_addr_MUX_uxn_device_h_l106_c7_97b2_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l106_c7_97b2_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l106_c7_97b2_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l106_c7_97b2_return_output : unsigned(15 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l106_c7_97b2]
signal ctrl_mode_MUX_uxn_device_h_l106_c7_97b2_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l106_c7_97b2_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l106_c7_97b2_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l106_c7_97b2_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l106_c7_97b2]
signal result_MUX_uxn_device_h_l106_c7_97b2_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l106_c7_97b2_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l106_c7_97b2_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l106_c7_97b2_return_output : device_out_result_t;

-- x_MUX[uxn_device_h_l106_c7_97b2]
signal x_MUX_uxn_device_h_l106_c7_97b2_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l106_c7_97b2_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l106_c7_97b2_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l106_c7_97b2_return_output : unsigned(15 downto 0);

-- flip_x_MUX[uxn_device_h_l106_c7_97b2]
signal flip_x_MUX_uxn_device_h_l106_c7_97b2_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l106_c7_97b2_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l106_c7_97b2_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l106_c7_97b2_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_device_h_l106_c7_97b2]
signal tmp8_MUX_uxn_device_h_l106_c7_97b2_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l106_c7_97b2_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l106_c7_97b2_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l106_c7_97b2_return_output : unsigned(7 downto 0);

-- layer_MUX[uxn_device_h_l107_c3_47ef]
signal layer_MUX_uxn_device_h_l107_c3_47ef_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l107_c3_47ef_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l107_c3_47ef_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l107_c3_47ef_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l107_c3_47ef]
signal color_MUX_uxn_device_h_l107_c3_47ef_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l107_c3_47ef_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l107_c3_47ef_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l107_c3_47ef_return_output : unsigned(3 downto 0);

-- ctrl_MUX[uxn_device_h_l107_c3_47ef]
signal ctrl_MUX_uxn_device_h_l107_c3_47ef_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l107_c3_47ef_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l107_c3_47ef_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l107_c3_47ef_return_output : unsigned(7 downto 0);

-- flip_y_MUX[uxn_device_h_l107_c3_47ef]
signal flip_y_MUX_uxn_device_h_l107_c3_47ef_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l107_c3_47ef_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l107_c3_47ef_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l107_c3_47ef_return_output : unsigned(0 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l107_c3_47ef]
signal ctrl_mode_MUX_uxn_device_h_l107_c3_47ef_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l107_c3_47ef_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l107_c3_47ef_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l107_c3_47ef_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l107_c3_47ef]
signal result_device_ram_address_MUX_uxn_device_h_l107_c3_47ef_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l107_c3_47ef_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l107_c3_47ef_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l107_c3_47ef_return_output : unsigned(7 downto 0);

-- flip_x_MUX[uxn_device_h_l107_c3_47ef]
signal flip_x_MUX_uxn_device_h_l107_c3_47ef_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l107_c3_47ef_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l107_c3_47ef_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l107_c3_47ef_return_output : unsigned(0 downto 0);

-- CONST_SR_7[uxn_device_h_l110_c26_38da]
signal CONST_SR_7_uxn_device_h_l110_c26_38da_x : unsigned(7 downto 0);
signal CONST_SR_7_uxn_device_h_l110_c26_38da_return_output : unsigned(7 downto 0);

-- CONST_SR_6[uxn_device_h_l111_c22_e222]
signal CONST_SR_6_uxn_device_h_l111_c22_e222_x : unsigned(7 downto 0);
signal CONST_SR_6_uxn_device_h_l111_c22_e222_return_output : unsigned(7 downto 0);

-- CONST_SR_5[uxn_device_h_l112_c23_3397]
signal CONST_SR_5_uxn_device_h_l112_c23_3397_x : unsigned(7 downto 0);
signal CONST_SR_5_uxn_device_h_l112_c23_3397_return_output : unsigned(7 downto 0);

-- CONST_SR_4[uxn_device_h_l113_c23_4519]
signal CONST_SR_4_uxn_device_h_l113_c23_4519_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_device_h_l113_c23_4519_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l117_c11_79df]
signal BIN_OP_EQ_uxn_device_h_l117_c11_79df_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l117_c11_79df_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l117_c11_79df_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l124_c7_63d6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_63d6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_63d6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_63d6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_63d6_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l117_c7_c075]
signal y_MUX_uxn_device_h_l117_c7_c075_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l117_c7_c075_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l117_c7_c075_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l117_c7_c075_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l117_c7_c075]
signal auto_advance_MUX_uxn_device_h_l117_c7_c075_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l117_c7_c075_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l117_c7_c075_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l117_c7_c075_return_output : unsigned(7 downto 0);

-- ram_addr_MUX[uxn_device_h_l117_c7_c075]
signal ram_addr_MUX_uxn_device_h_l117_c7_c075_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l117_c7_c075_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l117_c7_c075_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l117_c7_c075_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_device_h_l117_c7_c075]
signal result_MUX_uxn_device_h_l117_c7_c075_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l117_c7_c075_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l117_c7_c075_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l117_c7_c075_return_output : device_out_result_t;

-- x_MUX[uxn_device_h_l117_c7_c075]
signal x_MUX_uxn_device_h_l117_c7_c075_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l117_c7_c075_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l117_c7_c075_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l117_c7_c075_return_output : unsigned(15 downto 0);

-- tmp8_MUX[uxn_device_h_l117_c7_c075]
signal tmp8_MUX_uxn_device_h_l117_c7_c075_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l117_c7_c075_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l117_c7_c075_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l117_c7_c075_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l118_c3_5393]
signal result_device_ram_address_MUX_uxn_device_h_l118_c3_5393_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l118_c3_5393_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l118_c3_5393_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l118_c3_5393_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l118_c3_5393]
signal x_MUX_uxn_device_h_l118_c3_5393_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l118_c3_5393_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l118_c3_5393_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l118_c3_5393_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l124_c11_93f9]
signal BIN_OP_EQ_uxn_device_h_l124_c11_93f9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l124_c11_93f9_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l124_c11_93f9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l130_c7_7bb6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_7bb6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_7bb6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_7bb6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_7bb6_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l124_c7_63d6]
signal y_MUX_uxn_device_h_l124_c7_63d6_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l124_c7_63d6_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l124_c7_63d6_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l124_c7_63d6_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l124_c7_63d6]
signal auto_advance_MUX_uxn_device_h_l124_c7_63d6_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l124_c7_63d6_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l124_c7_63d6_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l124_c7_63d6_return_output : unsigned(7 downto 0);

-- ram_addr_MUX[uxn_device_h_l124_c7_63d6]
signal ram_addr_MUX_uxn_device_h_l124_c7_63d6_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l124_c7_63d6_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l124_c7_63d6_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l124_c7_63d6_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_device_h_l124_c7_63d6]
signal result_MUX_uxn_device_h_l124_c7_63d6_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l124_c7_63d6_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l124_c7_63d6_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l124_c7_63d6_return_output : device_out_result_t;

-- x_MUX[uxn_device_h_l124_c7_63d6]
signal x_MUX_uxn_device_h_l124_c7_63d6_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l124_c7_63d6_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l124_c7_63d6_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l124_c7_63d6_return_output : unsigned(15 downto 0);

-- tmp8_MUX[uxn_device_h_l124_c7_63d6]
signal tmp8_MUX_uxn_device_h_l124_c7_63d6_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l124_c7_63d6_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l124_c7_63d6_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l124_c7_63d6_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l125_c3_43f8]
signal result_device_ram_address_MUX_uxn_device_h_l125_c3_43f8_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l125_c3_43f8_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l125_c3_43f8_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l125_c3_43f8_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l125_c3_43f8]
signal x_MUX_uxn_device_h_l125_c3_43f8_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l125_c3_43f8_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l125_c3_43f8_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l125_c3_43f8_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_device_h_l126_c4_0212]
signal BIN_OP_OR_uxn_device_h_l126_c4_0212_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l126_c4_0212_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l126_c4_0212_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l130_c11_db22]
signal BIN_OP_EQ_uxn_device_h_l130_c11_db22_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l130_c11_db22_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l130_c11_db22_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l137_c7_1fcf]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_1fcf_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_1fcf_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_1fcf_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_1fcf_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l130_c7_7bb6]
signal y_MUX_uxn_device_h_l130_c7_7bb6_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l130_c7_7bb6_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l130_c7_7bb6_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l130_c7_7bb6_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l130_c7_7bb6]
signal auto_advance_MUX_uxn_device_h_l130_c7_7bb6_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l130_c7_7bb6_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l130_c7_7bb6_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l130_c7_7bb6_return_output : unsigned(7 downto 0);

-- ram_addr_MUX[uxn_device_h_l130_c7_7bb6]
signal ram_addr_MUX_uxn_device_h_l130_c7_7bb6_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l130_c7_7bb6_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l130_c7_7bb6_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l130_c7_7bb6_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_device_h_l130_c7_7bb6]
signal result_MUX_uxn_device_h_l130_c7_7bb6_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l130_c7_7bb6_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l130_c7_7bb6_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l130_c7_7bb6_return_output : device_out_result_t;

-- x_MUX[uxn_device_h_l130_c7_7bb6]
signal x_MUX_uxn_device_h_l130_c7_7bb6_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l130_c7_7bb6_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l130_c7_7bb6_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l130_c7_7bb6_return_output : unsigned(15 downto 0);

-- tmp8_MUX[uxn_device_h_l130_c7_7bb6]
signal tmp8_MUX_uxn_device_h_l130_c7_7bb6_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l130_c7_7bb6_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l130_c7_7bb6_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l130_c7_7bb6_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l131_c3_e626]
signal y_MUX_uxn_device_h_l131_c3_e626_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l131_c3_e626_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l131_c3_e626_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l131_c3_e626_return_output : unsigned(15 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l131_c3_e626]
signal result_device_ram_address_MUX_uxn_device_h_l131_c3_e626_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l131_c3_e626_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l131_c3_e626_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l131_c3_e626_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l137_c11_ce3c]
signal BIN_OP_EQ_uxn_device_h_l137_c11_ce3c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l137_c11_ce3c_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l137_c11_ce3c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l157_c7_8256]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l157_c7_8256_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l157_c7_8256_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l157_c7_8256_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l157_c7_8256_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l137_c7_1fcf]
signal y_MUX_uxn_device_h_l137_c7_1fcf_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l137_c7_1fcf_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l137_c7_1fcf_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l137_c7_1fcf_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l137_c7_1fcf]
signal auto_advance_MUX_uxn_device_h_l137_c7_1fcf_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l137_c7_1fcf_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l137_c7_1fcf_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l137_c7_1fcf_return_output : unsigned(7 downto 0);

-- ram_addr_MUX[uxn_device_h_l137_c7_1fcf]
signal ram_addr_MUX_uxn_device_h_l137_c7_1fcf_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l137_c7_1fcf_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l137_c7_1fcf_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l137_c7_1fcf_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_device_h_l137_c7_1fcf]
signal result_MUX_uxn_device_h_l137_c7_1fcf_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l137_c7_1fcf_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l137_c7_1fcf_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l137_c7_1fcf_return_output : device_out_result_t;

-- x_MUX[uxn_device_h_l137_c7_1fcf]
signal x_MUX_uxn_device_h_l137_c7_1fcf_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l137_c7_1fcf_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l137_c7_1fcf_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l137_c7_1fcf_return_output : unsigned(15 downto 0);

-- tmp8_MUX[uxn_device_h_l137_c7_1fcf]
signal tmp8_MUX_uxn_device_h_l137_c7_1fcf_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l137_c7_1fcf_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l137_c7_1fcf_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l137_c7_1fcf_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l138_c3_3093]
signal y_MUX_uxn_device_h_l138_c3_3093_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l138_c3_3093_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l138_c3_3093_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l138_c3_3093_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_device_h_l138_c3_3093]
signal result_u8_value_MUX_uxn_device_h_l138_c3_3093_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l138_c3_3093_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l138_c3_3093_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l138_c3_3093_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l138_c3_3093]
signal result_device_ram_address_MUX_uxn_device_h_l138_c3_3093_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l138_c3_3093_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l138_c3_3093_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l138_c3_3093_return_output : unsigned(7 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l138_c3_3093]
signal result_vram_write_layer_MUX_uxn_device_h_l138_c3_3093_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l138_c3_3093_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l138_c3_3093_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l138_c3_3093_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l138_c3_3093]
signal result_is_vram_write_MUX_uxn_device_h_l138_c3_3093_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l138_c3_3093_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l138_c3_3093_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l138_c3_3093_return_output : unsigned(0 downto 0);

-- result_u16_addr_MUX[uxn_device_h_l138_c3_3093]
signal result_u16_addr_MUX_uxn_device_h_l138_c3_3093_cond : unsigned(0 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l138_c3_3093_iftrue : unsigned(15 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l138_c3_3093_iffalse : unsigned(15 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l138_c3_3093_return_output : unsigned(15 downto 0);

-- tmp8_MUX[uxn_device_h_l138_c3_3093]
signal tmp8_MUX_uxn_device_h_l138_c3_3093_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l138_c3_3093_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l138_c3_3093_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l138_c3_3093_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_device_h_l141_c11_e808]
signal BIN_OP_AND_uxn_device_h_l141_c11_e808_left : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_device_h_l141_c11_e808_right : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_device_h_l141_c11_e808_return_output : unsigned(3 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_device_h_l142_c23_431d]
signal BIN_OP_INFERRED_MULT_uxn_device_h_l142_c23_431d_left : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l142_c23_431d_right : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l142_c23_431d_return_output : unsigned(31 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l142_c23_d3c0]
signal BIN_OP_PLUS_uxn_device_h_l142_c23_d3c0_left : unsigned(31 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l142_c23_d3c0_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l142_c23_d3c0_return_output : unsigned(32 downto 0);

-- tmp8_MUX[uxn_device_h_l145_c4_f761]
signal tmp8_MUX_uxn_device_h_l145_c4_f761_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l145_c4_f761_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l145_c4_f761_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l145_c4_f761_return_output : unsigned(7 downto 0);

-- MUX[uxn_device_h_l146_c13_4e7b]
signal MUX_uxn_device_h_l146_c13_4e7b_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l146_c13_4e7b_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l146_c13_4e7b_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l146_c13_4e7b_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_device_h_l146_c5_36a8]
signal BIN_OP_OR_uxn_device_h_l146_c5_36a8_left : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_device_h_l146_c5_36a8_right : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_device_h_l146_c5_36a8_return_output : unsigned(7 downto 0);

-- MUX[uxn_device_h_l147_c13_0f55]
signal MUX_uxn_device_h_l147_c13_0f55_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l147_c13_0f55_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l147_c13_0f55_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l147_c13_0f55_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_device_h_l147_c5_fb66]
signal BIN_OP_OR_uxn_device_h_l147_c5_fb66_left : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_device_h_l147_c5_fb66_right : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_device_h_l147_c5_fb66_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l152_c8_7000]
signal y_MUX_uxn_device_h_l152_c8_7000_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l152_c8_7000_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l152_c8_7000_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l152_c8_7000_return_output : unsigned(15 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l152_c8_7000]
signal result_device_ram_address_MUX_uxn_device_h_l152_c8_7000_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l152_c8_7000_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l152_c8_7000_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l152_c8_7000_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l157_c11_7a8b]
signal BIN_OP_EQ_uxn_device_h_l157_c11_7a8b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l157_c11_7a8b_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l157_c11_7a8b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l179_c7_23a6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l179_c7_23a6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l179_c7_23a6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l179_c7_23a6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l179_c7_23a6_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l157_c7_8256]
signal auto_advance_MUX_uxn_device_h_l157_c7_8256_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l157_c7_8256_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l157_c7_8256_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l157_c7_8256_return_output : unsigned(7 downto 0);

-- ram_addr_MUX[uxn_device_h_l157_c7_8256]
signal ram_addr_MUX_uxn_device_h_l157_c7_8256_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l157_c7_8256_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l157_c7_8256_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l157_c7_8256_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_device_h_l157_c7_8256]
signal result_MUX_uxn_device_h_l157_c7_8256_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l157_c7_8256_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l157_c7_8256_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l157_c7_8256_return_output : device_out_result_t;

-- x_MUX[uxn_device_h_l157_c7_8256]
signal x_MUX_uxn_device_h_l157_c7_8256_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l157_c7_8256_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l157_c7_8256_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l157_c7_8256_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l158_c3_2a1e]
signal auto_advance_MUX_uxn_device_h_l158_c3_2a1e_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l158_c3_2a1e_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l158_c3_2a1e_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l158_c3_2a1e_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l158_c3_2a1e]
signal result_u8_value_MUX_uxn_device_h_l158_c3_2a1e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l158_c3_2a1e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l158_c3_2a1e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l158_c3_2a1e_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l158_c3_2a1e]
signal result_device_ram_address_MUX_uxn_device_h_l158_c3_2a1e_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l158_c3_2a1e_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l158_c3_2a1e_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l158_c3_2a1e_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l158_c3_2a1e]
signal result_is_deo_done_MUX_uxn_device_h_l158_c3_2a1e_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l158_c3_2a1e_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l158_c3_2a1e_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l158_c3_2a1e_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l158_c3_2a1e]
signal result_is_device_ram_write_MUX_uxn_device_h_l158_c3_2a1e_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l158_c3_2a1e_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l158_c3_2a1e_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l158_c3_2a1e_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l158_c3_2a1e]
signal result_is_vram_write_MUX_uxn_device_h_l158_c3_2a1e_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l158_c3_2a1e_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l158_c3_2a1e_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l158_c3_2a1e_return_output : unsigned(0 downto 0);

-- result_u16_addr_MUX[uxn_device_h_l158_c3_2a1e]
signal result_u16_addr_MUX_uxn_device_h_l158_c3_2a1e_cond : unsigned(0 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l158_c3_2a1e_iftrue : unsigned(15 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l158_c3_2a1e_iffalse : unsigned(15 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l158_c3_2a1e_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l158_c3_2a1e]
signal x_MUX_uxn_device_h_l158_c3_2a1e_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l158_c3_2a1e_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l158_c3_2a1e_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l158_c3_2a1e_return_output : unsigned(15 downto 0);

-- UNARY_OP_NOT[uxn_device_h_l163_c9_88b8]
signal UNARY_OP_NOT_uxn_device_h_l163_c9_88b8_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_device_h_l163_c9_88b8_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l163_c4_8d15]
signal result_is_deo_done_MUX_uxn_device_h_l163_c4_8d15_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l163_c4_8d15_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l163_c4_8d15_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l163_c4_8d15_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l163_c4_8d15]
signal result_is_device_ram_write_MUX_uxn_device_h_l163_c4_8d15_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l163_c4_8d15_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l163_c4_8d15_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l163_c4_8d15_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l163_c4_8d15]
signal result_u8_value_MUX_uxn_device_h_l163_c4_8d15_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l163_c4_8d15_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l163_c4_8d15_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l163_c4_8d15_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l163_c4_8d15]
signal result_device_ram_address_MUX_uxn_device_h_l163_c4_8d15_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l163_c4_8d15_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l163_c4_8d15_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l163_c4_8d15_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l163_c4_8d15]
signal x_MUX_uxn_device_h_l163_c4_8d15_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l163_c4_8d15_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l163_c4_8d15_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l163_c4_8d15_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_device_h_l164_c9_1a84]
signal BIN_OP_AND_uxn_device_h_l164_c9_1a84_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l164_c9_1a84_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l164_c9_1a84_return_output : unsigned(7 downto 0);

-- BIN_OP_NEQ[uxn_device_h_l164_c9_0470]
signal BIN_OP_NEQ_uxn_device_h_l164_c9_0470_left : unsigned(7 downto 0);
signal BIN_OP_NEQ_uxn_device_h_l164_c9_0470_right : unsigned(0 downto 0);
signal BIN_OP_NEQ_uxn_device_h_l164_c9_0470_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l164_c5_ec39]
signal result_is_device_ram_write_MUX_uxn_device_h_l164_c5_ec39_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l164_c5_ec39_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l164_c5_ec39_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l164_c5_ec39_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l164_c5_ec39]
signal result_u8_value_MUX_uxn_device_h_l164_c5_ec39_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l164_c5_ec39_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l164_c5_ec39_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l164_c5_ec39_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l164_c5_ec39]
signal result_device_ram_address_MUX_uxn_device_h_l164_c5_ec39_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l164_c5_ec39_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l164_c5_ec39_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l164_c5_ec39_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l164_c5_ec39]
signal x_MUX_uxn_device_h_l164_c5_ec39_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l164_c5_ec39_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l164_c5_ec39_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l164_c5_ec39_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l165_c6_3010]
signal BIN_OP_PLUS_uxn_device_h_l165_c6_3010_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l165_c6_3010_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l165_c6_3010_return_output : unsigned(16 downto 0);

-- CONST_SR_8[uxn_device_h_l168_c34_b539]
signal CONST_SR_8_uxn_device_h_l168_c34_b539_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_device_h_l168_c34_b539_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l174_c8_9300]
signal auto_advance_MUX_uxn_device_h_l174_c8_9300_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l174_c8_9300_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l174_c8_9300_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l174_c8_9300_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l174_c8_9300]
signal result_device_ram_address_MUX_uxn_device_h_l174_c8_9300_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l174_c8_9300_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l174_c8_9300_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l174_c8_9300_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l179_c11_3971]
signal BIN_OP_EQ_uxn_device_h_l179_c11_3971_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l179_c11_3971_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l179_c11_3971_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l192_c7_f8ff]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_f8ff_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_f8ff_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_f8ff_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_f8ff_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l179_c7_23a6]
signal ram_addr_MUX_uxn_device_h_l179_c7_23a6_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l179_c7_23a6_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l179_c7_23a6_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l179_c7_23a6_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_device_h_l179_c7_23a6]
signal result_MUX_uxn_device_h_l179_c7_23a6_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l179_c7_23a6_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l179_c7_23a6_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l179_c7_23a6_return_output : device_out_result_t;

-- ram_addr_MUX[uxn_device_h_l180_c3_431f]
signal ram_addr_MUX_uxn_device_h_l180_c3_431f_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l180_c3_431f_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l180_c3_431f_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l180_c3_431f_return_output : unsigned(15 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l180_c3_431f]
signal result_is_device_ram_write_MUX_uxn_device_h_l180_c3_431f_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l180_c3_431f_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l180_c3_431f_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l180_c3_431f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l180_c3_431f]
signal result_u8_value_MUX_uxn_device_h_l180_c3_431f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l180_c3_431f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l180_c3_431f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l180_c3_431f_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l180_c3_431f]
signal result_device_ram_address_MUX_uxn_device_h_l180_c3_431f_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l180_c3_431f_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l180_c3_431f_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l180_c3_431f_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_device_h_l181_c8_71c3]
signal BIN_OP_AND_uxn_device_h_l181_c8_71c3_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l181_c8_71c3_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l181_c8_71c3_return_output : unsigned(7 downto 0);

-- BIN_OP_NEQ[uxn_device_h_l181_c8_cf7f]
signal BIN_OP_NEQ_uxn_device_h_l181_c8_cf7f_left : unsigned(7 downto 0);
signal BIN_OP_NEQ_uxn_device_h_l181_c8_cf7f_right : unsigned(0 downto 0);
signal BIN_OP_NEQ_uxn_device_h_l181_c8_cf7f_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l181_c4_8670]
signal result_is_device_ram_write_MUX_uxn_device_h_l181_c4_8670_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l181_c4_8670_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l181_c4_8670_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l181_c4_8670_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l181_c4_8670]
signal result_u8_value_MUX_uxn_device_h_l181_c4_8670_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l181_c4_8670_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l181_c4_8670_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l181_c4_8670_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l181_c4_8670]
signal result_device_ram_address_MUX_uxn_device_h_l181_c4_8670_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l181_c4_8670_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l181_c4_8670_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l181_c4_8670_return_output : unsigned(7 downto 0);

-- ram_addr_MUX[uxn_device_h_l187_c8_3a68]
signal ram_addr_MUX_uxn_device_h_l187_c8_3a68_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l187_c8_3a68_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l187_c8_3a68_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l187_c8_3a68_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l192_c11_c3ed]
signal BIN_OP_EQ_uxn_device_h_l192_c11_c3ed_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l192_c11_c3ed_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l192_c11_c3ed_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l204_c7_8d42]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c7_8d42_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c7_8d42_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c7_8d42_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c7_8d42_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l192_c7_f8ff]
signal ram_addr_MUX_uxn_device_h_l192_c7_f8ff_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l192_c7_f8ff_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l192_c7_f8ff_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l192_c7_f8ff_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_device_h_l192_c7_f8ff]
signal result_MUX_uxn_device_h_l192_c7_f8ff_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l192_c7_f8ff_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l192_c7_f8ff_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l192_c7_f8ff_return_output : device_out_result_t;

-- ram_addr_MUX[uxn_device_h_l193_c3_532b]
signal ram_addr_MUX_uxn_device_h_l193_c3_532b_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l193_c3_532b_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l193_c3_532b_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l193_c3_532b_return_output : unsigned(15 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l193_c3_532b]
signal result_is_device_ram_write_MUX_uxn_device_h_l193_c3_532b_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l193_c3_532b_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l193_c3_532b_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l193_c3_532b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l193_c3_532b]
signal result_u8_value_MUX_uxn_device_h_l193_c3_532b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l193_c3_532b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l193_c3_532b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l193_c3_532b_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l193_c3_532b]
signal result_device_ram_address_MUX_uxn_device_h_l193_c3_532b_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l193_c3_532b_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l193_c3_532b_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l193_c3_532b_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_device_h_l194_c9_dc22]
signal BIN_OP_AND_uxn_device_h_l194_c9_dc22_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l194_c9_dc22_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l194_c9_dc22_return_output : unsigned(7 downto 0);

-- BIN_OP_NEQ[uxn_device_h_l194_c9_bab2]
signal BIN_OP_NEQ_uxn_device_h_l194_c9_bab2_left : unsigned(7 downto 0);
signal BIN_OP_NEQ_uxn_device_h_l194_c9_bab2_right : unsigned(0 downto 0);
signal BIN_OP_NEQ_uxn_device_h_l194_c9_bab2_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l194_c4_1fab]
signal result_is_device_ram_write_MUX_uxn_device_h_l194_c4_1fab_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l194_c4_1fab_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l194_c4_1fab_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l194_c4_1fab_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l194_c4_1fab]
signal result_u8_value_MUX_uxn_device_h_l194_c4_1fab_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l194_c4_1fab_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l194_c4_1fab_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l194_c4_1fab_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l194_c4_1fab]
signal result_device_ram_address_MUX_uxn_device_h_l194_c4_1fab_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l194_c4_1fab_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l194_c4_1fab_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l194_c4_1fab_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_device_h_l197_c33_0a9c]
signal CONST_SR_8_uxn_device_h_l197_c33_0a9c_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_device_h_l197_c33_0a9c_return_output : unsigned(15 downto 0);

-- ram_addr_MUX[uxn_device_h_l200_c8_4bb9]
signal ram_addr_MUX_uxn_device_h_l200_c8_4bb9_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l200_c8_4bb9_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l200_c8_4bb9_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l200_c8_4bb9_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_device_h_l201_c4_3fcf]
signal BIN_OP_OR_uxn_device_h_l201_c4_3fcf_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l201_c4_3fcf_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l201_c4_3fcf_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l204_c11_d6f6]
signal BIN_OP_EQ_uxn_device_h_l204_c11_d6f6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l204_c11_d6f6_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l204_c11_d6f6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l213_c1_599e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l213_c1_599e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l213_c1_599e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l213_c1_599e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l213_c1_599e_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l204_c7_8d42]
signal result_MUX_uxn_device_h_l204_c7_8d42_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l204_c7_8d42_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l204_c7_8d42_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l204_c7_8d42_return_output : device_out_result_t;

-- result_is_device_ram_write_MUX[uxn_device_h_l205_c3_0106]
signal result_is_device_ram_write_MUX_uxn_device_h_l205_c3_0106_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l205_c3_0106_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l205_c3_0106_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l205_c3_0106_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l205_c3_0106]
signal result_u8_value_MUX_uxn_device_h_l205_c3_0106_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l205_c3_0106_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l205_c3_0106_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l205_c3_0106_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l205_c3_0106]
signal result_device_ram_address_MUX_uxn_device_h_l205_c3_0106_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l205_c3_0106_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l205_c3_0106_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l205_c3_0106_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_device_h_l206_c9_4a95]
signal BIN_OP_AND_uxn_device_h_l206_c9_4a95_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l206_c9_4a95_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l206_c9_4a95_return_output : unsigned(7 downto 0);

-- BIN_OP_NEQ[uxn_device_h_l206_c9_aa5c]
signal BIN_OP_NEQ_uxn_device_h_l206_c9_aa5c_left : unsigned(7 downto 0);
signal BIN_OP_NEQ_uxn_device_h_l206_c9_aa5c_right : unsigned(0 downto 0);
signal BIN_OP_NEQ_uxn_device_h_l206_c9_aa5c_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l206_c4_3d77]
signal result_is_device_ram_write_MUX_uxn_device_h_l206_c4_3d77_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l206_c4_3d77_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l206_c4_3d77_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l206_c4_3d77_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l206_c4_3d77]
signal result_u8_value_MUX_uxn_device_h_l206_c4_3d77_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l206_c4_3d77_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l206_c4_3d77_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l206_c4_3d77_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l206_c4_3d77]
signal result_device_ram_address_MUX_uxn_device_h_l206_c4_3d77_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l206_c4_3d77_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l206_c4_3d77_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l206_c4_3d77_return_output : unsigned(7 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l214_c1_213a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c1_213a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c1_213a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c1_213a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c1_213a_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l214_c3_6bd1]
signal result_MUX_uxn_device_h_l214_c3_6bd1_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l214_c3_6bd1_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l214_c3_6bd1_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l214_c3_6bd1_return_output : device_out_result_t;

-- BIN_OP_MINUS[uxn_device_h_l215_c58_8bcc]
signal BIN_OP_MINUS_uxn_device_h_l215_c58_8bcc_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l215_c58_8bcc_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l215_c58_8bcc_return_output : unsigned(7 downto 0);

-- screen_blit[uxn_device_h_l215_c46_64ef]
signal screen_blit_uxn_device_h_l215_c46_64ef_CLOCK_ENABLE : unsigned(0 downto 0);
signal screen_blit_uxn_device_h_l215_c46_64ef_phase : unsigned(7 downto 0);
signal screen_blit_uxn_device_h_l215_c46_64ef_ctrl : unsigned(7 downto 0);
signal screen_blit_uxn_device_h_l215_c46_64ef_auto_advance : unsigned(7 downto 0);
signal screen_blit_uxn_device_h_l215_c46_64ef_x : unsigned(15 downto 0);
signal screen_blit_uxn_device_h_l215_c46_64ef_y : unsigned(15 downto 0);
signal screen_blit_uxn_device_h_l215_c46_64ef_ram_addr : unsigned(15 downto 0);
signal screen_blit_uxn_device_h_l215_c46_64ef_previous_ram_read : unsigned(7 downto 0);
signal screen_blit_uxn_device_h_l215_c46_64ef_return_output : screen_blit_result_t;

-- CONST_SL_8_uint16_t_uxn_device_h_l189_l120_l133_DUPLICATE_5d8e
signal CONST_SL_8_uint16_t_uxn_device_h_l189_l120_l133_DUPLICATE_5d8e_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_device_h_l189_l120_l133_DUPLICATE_5d8e_return_output : unsigned(15 downto 0);

-- BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l153_l140_DUPLICATE_d8fa
signal BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l153_l140_DUPLICATE_d8fa_left : unsigned(15 downto 0);
signal BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l153_l140_DUPLICATE_d8fa_right : unsigned(15 downto 0);
signal BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l153_l140_DUPLICATE_d8fa_return_output : unsigned(15 downto 0);

-- CONST_SR_1_uint8_t_uxn_device_h_l194_l206_DUPLICATE_8149
signal CONST_SR_1_uint8_t_uxn_device_h_l194_l206_DUPLICATE_8149_x : unsigned(7 downto 0);
signal CONST_SR_1_uint8_t_uxn_device_h_l194_l206_DUPLICATE_8149_return_output : unsigned(7 downto 0);

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

function CONST_REF_RD_device_out_result_t_device_out_result_t_8eaa( ref_toks_0 : device_out_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned) return device_out_result_t is
 
  variable base : device_out_result_t; 
  variable return_output : device_out_result_t;
begin
      base := ref_toks_0;
      base.u8_value := ref_toks_1;
      base.device_ram_address := ref_toks_2;
      base.vram_write_layer := ref_toks_3;
      base.is_vram_write := ref_toks_4;
      base.u16_addr := ref_toks_5;

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

function CONST_REF_RD_device_out_result_t_device_out_result_t_df12( ref_toks_0 : device_out_result_t;
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
      base.is_deo_done := ref_toks_3;
      base.is_device_ram_write := ref_toks_4;
      base.is_vram_write := ref_toks_5;
      base.u16_addr := ref_toks_6;

      return_output := base;
      return return_output; 
end function;

function CONST_REF_RD_device_out_result_t_device_out_result_t_96e4( ref_toks_0 : device_out_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned) return device_out_result_t is
 
  variable base : device_out_result_t; 
  variable return_output : device_out_result_t;
begin
      base := ref_toks_0;
      base.is_device_ram_write := ref_toks_1;
      base.u8_value := ref_toks_2;
      base.device_ram_address := ref_toks_3;

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
-- BIN_OP_EQ_uxn_device_h_l88_c6_ed31
BIN_OP_EQ_uxn_device_h_l88_c6_ed31 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l88_c6_ed31_left,
BIN_OP_EQ_uxn_device_h_l88_c6_ed31_right,
BIN_OP_EQ_uxn_device_h_l88_c6_ed31_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_1756
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_1756 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_1756_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_1756_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_1756_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_1756_return_output);

-- is_pixel_port_MUX_uxn_device_h_l88_c2_6371
is_pixel_port_MUX_uxn_device_h_l88_c2_6371 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_pixel_port_MUX_uxn_device_h_l88_c2_6371_cond,
is_pixel_port_MUX_uxn_device_h_l88_c2_6371_iftrue,
is_pixel_port_MUX_uxn_device_h_l88_c2_6371_iffalse,
is_pixel_port_MUX_uxn_device_h_l88_c2_6371_return_output);

-- layer_MUX_uxn_device_h_l88_c2_6371
layer_MUX_uxn_device_h_l88_c2_6371 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l88_c2_6371_cond,
layer_MUX_uxn_device_h_l88_c2_6371_iftrue,
layer_MUX_uxn_device_h_l88_c2_6371_iffalse,
layer_MUX_uxn_device_h_l88_c2_6371_return_output);

-- color_MUX_uxn_device_h_l88_c2_6371
color_MUX_uxn_device_h_l88_c2_6371 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l88_c2_6371_cond,
color_MUX_uxn_device_h_l88_c2_6371_iftrue,
color_MUX_uxn_device_h_l88_c2_6371_iffalse,
color_MUX_uxn_device_h_l88_c2_6371_return_output);

-- ctrl_MUX_uxn_device_h_l88_c2_6371
ctrl_MUX_uxn_device_h_l88_c2_6371 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l88_c2_6371_cond,
ctrl_MUX_uxn_device_h_l88_c2_6371_iftrue,
ctrl_MUX_uxn_device_h_l88_c2_6371_iffalse,
ctrl_MUX_uxn_device_h_l88_c2_6371_return_output);

-- y_MUX_uxn_device_h_l88_c2_6371
y_MUX_uxn_device_h_l88_c2_6371 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l88_c2_6371_cond,
y_MUX_uxn_device_h_l88_c2_6371_iftrue,
y_MUX_uxn_device_h_l88_c2_6371_iffalse,
y_MUX_uxn_device_h_l88_c2_6371_return_output);

-- auto_advance_MUX_uxn_device_h_l88_c2_6371
auto_advance_MUX_uxn_device_h_l88_c2_6371 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l88_c2_6371_cond,
auto_advance_MUX_uxn_device_h_l88_c2_6371_iftrue,
auto_advance_MUX_uxn_device_h_l88_c2_6371_iffalse,
auto_advance_MUX_uxn_device_h_l88_c2_6371_return_output);

-- flip_y_MUX_uxn_device_h_l88_c2_6371
flip_y_MUX_uxn_device_h_l88_c2_6371 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l88_c2_6371_cond,
flip_y_MUX_uxn_device_h_l88_c2_6371_iftrue,
flip_y_MUX_uxn_device_h_l88_c2_6371_iffalse,
flip_y_MUX_uxn_device_h_l88_c2_6371_return_output);

-- ram_addr_MUX_uxn_device_h_l88_c2_6371
ram_addr_MUX_uxn_device_h_l88_c2_6371 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l88_c2_6371_cond,
ram_addr_MUX_uxn_device_h_l88_c2_6371_iftrue,
ram_addr_MUX_uxn_device_h_l88_c2_6371_iffalse,
ram_addr_MUX_uxn_device_h_l88_c2_6371_return_output);

-- ctrl_mode_MUX_uxn_device_h_l88_c2_6371
ctrl_mode_MUX_uxn_device_h_l88_c2_6371 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l88_c2_6371_cond,
ctrl_mode_MUX_uxn_device_h_l88_c2_6371_iftrue,
ctrl_mode_MUX_uxn_device_h_l88_c2_6371_iffalse,
ctrl_mode_MUX_uxn_device_h_l88_c2_6371_return_output);

-- result_MUX_uxn_device_h_l88_c2_6371
result_MUX_uxn_device_h_l88_c2_6371 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l88_c2_6371_cond,
result_MUX_uxn_device_h_l88_c2_6371_iftrue,
result_MUX_uxn_device_h_l88_c2_6371_iffalse,
result_MUX_uxn_device_h_l88_c2_6371_return_output);

-- is_drawing_port_MUX_uxn_device_h_l88_c2_6371
is_drawing_port_MUX_uxn_device_h_l88_c2_6371 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_drawing_port_MUX_uxn_device_h_l88_c2_6371_cond,
is_drawing_port_MUX_uxn_device_h_l88_c2_6371_iftrue,
is_drawing_port_MUX_uxn_device_h_l88_c2_6371_iffalse,
is_drawing_port_MUX_uxn_device_h_l88_c2_6371_return_output);

-- x_MUX_uxn_device_h_l88_c2_6371
x_MUX_uxn_device_h_l88_c2_6371 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l88_c2_6371_cond,
x_MUX_uxn_device_h_l88_c2_6371_iftrue,
x_MUX_uxn_device_h_l88_c2_6371_iffalse,
x_MUX_uxn_device_h_l88_c2_6371_return_output);

-- flip_x_MUX_uxn_device_h_l88_c2_6371
flip_x_MUX_uxn_device_h_l88_c2_6371 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l88_c2_6371_cond,
flip_x_MUX_uxn_device_h_l88_c2_6371_iftrue,
flip_x_MUX_uxn_device_h_l88_c2_6371_iffalse,
flip_x_MUX_uxn_device_h_l88_c2_6371_return_output);

-- tmp8_MUX_uxn_device_h_l88_c2_6371
tmp8_MUX_uxn_device_h_l88_c2_6371 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l88_c2_6371_cond,
tmp8_MUX_uxn_device_h_l88_c2_6371_iftrue,
tmp8_MUX_uxn_device_h_l88_c2_6371_iffalse,
tmp8_MUX_uxn_device_h_l88_c2_6371_return_output);

-- is_sprite_port_MUX_uxn_device_h_l88_c2_6371
is_sprite_port_MUX_uxn_device_h_l88_c2_6371 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_sprite_port_MUX_uxn_device_h_l88_c2_6371_cond,
is_sprite_port_MUX_uxn_device_h_l88_c2_6371_iftrue,
is_sprite_port_MUX_uxn_device_h_l88_c2_6371_iffalse,
is_sprite_port_MUX_uxn_device_h_l88_c2_6371_return_output);

-- BIN_OP_EQ_uxn_device_h_l89_c19_e190
BIN_OP_EQ_uxn_device_h_l89_c19_e190 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l89_c19_e190_left,
BIN_OP_EQ_uxn_device_h_l89_c19_e190_right,
BIN_OP_EQ_uxn_device_h_l89_c19_e190_return_output);

-- MUX_uxn_device_h_l89_c19_dc46
MUX_uxn_device_h_l89_c19_dc46 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l89_c19_dc46_cond,
MUX_uxn_device_h_l89_c19_dc46_iftrue,
MUX_uxn_device_h_l89_c19_dc46_iffalse,
MUX_uxn_device_h_l89_c19_dc46_return_output);

-- BIN_OP_EQ_uxn_device_h_l90_c20_bdd7
BIN_OP_EQ_uxn_device_h_l90_c20_bdd7 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l90_c20_bdd7_left,
BIN_OP_EQ_uxn_device_h_l90_c20_bdd7_right,
BIN_OP_EQ_uxn_device_h_l90_c20_bdd7_return_output);

-- MUX_uxn_device_h_l90_c20_fd90
MUX_uxn_device_h_l90_c20_fd90 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l90_c20_fd90_cond,
MUX_uxn_device_h_l90_c20_fd90_iftrue,
MUX_uxn_device_h_l90_c20_fd90_iffalse,
MUX_uxn_device_h_l90_c20_fd90_return_output);

-- BIN_OP_OR_uxn_device_h_l91_c21_788d
BIN_OP_OR_uxn_device_h_l91_c21_788d : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l91_c21_788d_left,
BIN_OP_OR_uxn_device_h_l91_c21_788d_right,
BIN_OP_OR_uxn_device_h_l91_c21_788d_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l94_c3_12f4
result_is_deo_done_MUX_uxn_device_h_l94_c3_12f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l94_c3_12f4_cond,
result_is_deo_done_MUX_uxn_device_h_l94_c3_12f4_iftrue,
result_is_deo_done_MUX_uxn_device_h_l94_c3_12f4_iffalse,
result_is_deo_done_MUX_uxn_device_h_l94_c3_12f4_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l94_c3_12f4
result_device_ram_address_MUX_uxn_device_h_l94_c3_12f4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l94_c3_12f4_cond,
result_device_ram_address_MUX_uxn_device_h_l94_c3_12f4_iftrue,
result_device_ram_address_MUX_uxn_device_h_l94_c3_12f4_iffalse,
result_device_ram_address_MUX_uxn_device_h_l94_c3_12f4_return_output);

-- MUX_uxn_device_h_l95_c32_9049
MUX_uxn_device_h_l95_c32_9049 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l95_c32_9049_cond,
MUX_uxn_device_h_l95_c32_9049_iftrue,
MUX_uxn_device_h_l95_c32_9049_iffalse,
MUX_uxn_device_h_l95_c32_9049_return_output);

-- BIN_OP_EQ_uxn_device_h_l101_c11_4ff7
BIN_OP_EQ_uxn_device_h_l101_c11_4ff7 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l101_c11_4ff7_left,
BIN_OP_EQ_uxn_device_h_l101_c11_4ff7_right,
BIN_OP_EQ_uxn_device_h_l101_c11_4ff7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_97b2
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_97b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_97b2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_97b2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_97b2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_97b2_return_output);

-- layer_MUX_uxn_device_h_l101_c7_1756
layer_MUX_uxn_device_h_l101_c7_1756 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l101_c7_1756_cond,
layer_MUX_uxn_device_h_l101_c7_1756_iftrue,
layer_MUX_uxn_device_h_l101_c7_1756_iffalse,
layer_MUX_uxn_device_h_l101_c7_1756_return_output);

-- color_MUX_uxn_device_h_l101_c7_1756
color_MUX_uxn_device_h_l101_c7_1756 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l101_c7_1756_cond,
color_MUX_uxn_device_h_l101_c7_1756_iftrue,
color_MUX_uxn_device_h_l101_c7_1756_iffalse,
color_MUX_uxn_device_h_l101_c7_1756_return_output);

-- ctrl_MUX_uxn_device_h_l101_c7_1756
ctrl_MUX_uxn_device_h_l101_c7_1756 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l101_c7_1756_cond,
ctrl_MUX_uxn_device_h_l101_c7_1756_iftrue,
ctrl_MUX_uxn_device_h_l101_c7_1756_iffalse,
ctrl_MUX_uxn_device_h_l101_c7_1756_return_output);

-- y_MUX_uxn_device_h_l101_c7_1756
y_MUX_uxn_device_h_l101_c7_1756 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l101_c7_1756_cond,
y_MUX_uxn_device_h_l101_c7_1756_iftrue,
y_MUX_uxn_device_h_l101_c7_1756_iffalse,
y_MUX_uxn_device_h_l101_c7_1756_return_output);

-- auto_advance_MUX_uxn_device_h_l101_c7_1756
auto_advance_MUX_uxn_device_h_l101_c7_1756 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l101_c7_1756_cond,
auto_advance_MUX_uxn_device_h_l101_c7_1756_iftrue,
auto_advance_MUX_uxn_device_h_l101_c7_1756_iffalse,
auto_advance_MUX_uxn_device_h_l101_c7_1756_return_output);

-- flip_y_MUX_uxn_device_h_l101_c7_1756
flip_y_MUX_uxn_device_h_l101_c7_1756 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l101_c7_1756_cond,
flip_y_MUX_uxn_device_h_l101_c7_1756_iftrue,
flip_y_MUX_uxn_device_h_l101_c7_1756_iffalse,
flip_y_MUX_uxn_device_h_l101_c7_1756_return_output);

-- ram_addr_MUX_uxn_device_h_l101_c7_1756
ram_addr_MUX_uxn_device_h_l101_c7_1756 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l101_c7_1756_cond,
ram_addr_MUX_uxn_device_h_l101_c7_1756_iftrue,
ram_addr_MUX_uxn_device_h_l101_c7_1756_iffalse,
ram_addr_MUX_uxn_device_h_l101_c7_1756_return_output);

-- ctrl_mode_MUX_uxn_device_h_l101_c7_1756
ctrl_mode_MUX_uxn_device_h_l101_c7_1756 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l101_c7_1756_cond,
ctrl_mode_MUX_uxn_device_h_l101_c7_1756_iftrue,
ctrl_mode_MUX_uxn_device_h_l101_c7_1756_iffalse,
ctrl_mode_MUX_uxn_device_h_l101_c7_1756_return_output);

-- result_MUX_uxn_device_h_l101_c7_1756
result_MUX_uxn_device_h_l101_c7_1756 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l101_c7_1756_cond,
result_MUX_uxn_device_h_l101_c7_1756_iftrue,
result_MUX_uxn_device_h_l101_c7_1756_iffalse,
result_MUX_uxn_device_h_l101_c7_1756_return_output);

-- x_MUX_uxn_device_h_l101_c7_1756
x_MUX_uxn_device_h_l101_c7_1756 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l101_c7_1756_cond,
x_MUX_uxn_device_h_l101_c7_1756_iftrue,
x_MUX_uxn_device_h_l101_c7_1756_iffalse,
x_MUX_uxn_device_h_l101_c7_1756_return_output);

-- flip_x_MUX_uxn_device_h_l101_c7_1756
flip_x_MUX_uxn_device_h_l101_c7_1756 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l101_c7_1756_cond,
flip_x_MUX_uxn_device_h_l101_c7_1756_iftrue,
flip_x_MUX_uxn_device_h_l101_c7_1756_iffalse,
flip_x_MUX_uxn_device_h_l101_c7_1756_return_output);

-- tmp8_MUX_uxn_device_h_l101_c7_1756
tmp8_MUX_uxn_device_h_l101_c7_1756 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l101_c7_1756_cond,
tmp8_MUX_uxn_device_h_l101_c7_1756_iftrue,
tmp8_MUX_uxn_device_h_l101_c7_1756_iffalse,
tmp8_MUX_uxn_device_h_l101_c7_1756_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l102_c3_5212
result_device_ram_address_MUX_uxn_device_h_l102_c3_5212 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l102_c3_5212_cond,
result_device_ram_address_MUX_uxn_device_h_l102_c3_5212_iftrue,
result_device_ram_address_MUX_uxn_device_h_l102_c3_5212_iffalse,
result_device_ram_address_MUX_uxn_device_h_l102_c3_5212_return_output);

-- BIN_OP_EQ_uxn_device_h_l106_c11_ada2
BIN_OP_EQ_uxn_device_h_l106_c11_ada2 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l106_c11_ada2_left,
BIN_OP_EQ_uxn_device_h_l106_c11_ada2_right,
BIN_OP_EQ_uxn_device_h_l106_c11_ada2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_c075
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_c075 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_c075_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_c075_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_c075_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_c075_return_output);

-- layer_MUX_uxn_device_h_l106_c7_97b2
layer_MUX_uxn_device_h_l106_c7_97b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l106_c7_97b2_cond,
layer_MUX_uxn_device_h_l106_c7_97b2_iftrue,
layer_MUX_uxn_device_h_l106_c7_97b2_iffalse,
layer_MUX_uxn_device_h_l106_c7_97b2_return_output);

-- color_MUX_uxn_device_h_l106_c7_97b2
color_MUX_uxn_device_h_l106_c7_97b2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l106_c7_97b2_cond,
color_MUX_uxn_device_h_l106_c7_97b2_iftrue,
color_MUX_uxn_device_h_l106_c7_97b2_iffalse,
color_MUX_uxn_device_h_l106_c7_97b2_return_output);

-- ctrl_MUX_uxn_device_h_l106_c7_97b2
ctrl_MUX_uxn_device_h_l106_c7_97b2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l106_c7_97b2_cond,
ctrl_MUX_uxn_device_h_l106_c7_97b2_iftrue,
ctrl_MUX_uxn_device_h_l106_c7_97b2_iffalse,
ctrl_MUX_uxn_device_h_l106_c7_97b2_return_output);

-- y_MUX_uxn_device_h_l106_c7_97b2
y_MUX_uxn_device_h_l106_c7_97b2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l106_c7_97b2_cond,
y_MUX_uxn_device_h_l106_c7_97b2_iftrue,
y_MUX_uxn_device_h_l106_c7_97b2_iffalse,
y_MUX_uxn_device_h_l106_c7_97b2_return_output);

-- auto_advance_MUX_uxn_device_h_l106_c7_97b2
auto_advance_MUX_uxn_device_h_l106_c7_97b2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l106_c7_97b2_cond,
auto_advance_MUX_uxn_device_h_l106_c7_97b2_iftrue,
auto_advance_MUX_uxn_device_h_l106_c7_97b2_iffalse,
auto_advance_MUX_uxn_device_h_l106_c7_97b2_return_output);

-- flip_y_MUX_uxn_device_h_l106_c7_97b2
flip_y_MUX_uxn_device_h_l106_c7_97b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l106_c7_97b2_cond,
flip_y_MUX_uxn_device_h_l106_c7_97b2_iftrue,
flip_y_MUX_uxn_device_h_l106_c7_97b2_iffalse,
flip_y_MUX_uxn_device_h_l106_c7_97b2_return_output);

-- ram_addr_MUX_uxn_device_h_l106_c7_97b2
ram_addr_MUX_uxn_device_h_l106_c7_97b2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l106_c7_97b2_cond,
ram_addr_MUX_uxn_device_h_l106_c7_97b2_iftrue,
ram_addr_MUX_uxn_device_h_l106_c7_97b2_iffalse,
ram_addr_MUX_uxn_device_h_l106_c7_97b2_return_output);

-- ctrl_mode_MUX_uxn_device_h_l106_c7_97b2
ctrl_mode_MUX_uxn_device_h_l106_c7_97b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l106_c7_97b2_cond,
ctrl_mode_MUX_uxn_device_h_l106_c7_97b2_iftrue,
ctrl_mode_MUX_uxn_device_h_l106_c7_97b2_iffalse,
ctrl_mode_MUX_uxn_device_h_l106_c7_97b2_return_output);

-- result_MUX_uxn_device_h_l106_c7_97b2
result_MUX_uxn_device_h_l106_c7_97b2 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l106_c7_97b2_cond,
result_MUX_uxn_device_h_l106_c7_97b2_iftrue,
result_MUX_uxn_device_h_l106_c7_97b2_iffalse,
result_MUX_uxn_device_h_l106_c7_97b2_return_output);

-- x_MUX_uxn_device_h_l106_c7_97b2
x_MUX_uxn_device_h_l106_c7_97b2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l106_c7_97b2_cond,
x_MUX_uxn_device_h_l106_c7_97b2_iftrue,
x_MUX_uxn_device_h_l106_c7_97b2_iffalse,
x_MUX_uxn_device_h_l106_c7_97b2_return_output);

-- flip_x_MUX_uxn_device_h_l106_c7_97b2
flip_x_MUX_uxn_device_h_l106_c7_97b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l106_c7_97b2_cond,
flip_x_MUX_uxn_device_h_l106_c7_97b2_iftrue,
flip_x_MUX_uxn_device_h_l106_c7_97b2_iffalse,
flip_x_MUX_uxn_device_h_l106_c7_97b2_return_output);

-- tmp8_MUX_uxn_device_h_l106_c7_97b2
tmp8_MUX_uxn_device_h_l106_c7_97b2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l106_c7_97b2_cond,
tmp8_MUX_uxn_device_h_l106_c7_97b2_iftrue,
tmp8_MUX_uxn_device_h_l106_c7_97b2_iffalse,
tmp8_MUX_uxn_device_h_l106_c7_97b2_return_output);

-- layer_MUX_uxn_device_h_l107_c3_47ef
layer_MUX_uxn_device_h_l107_c3_47ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l107_c3_47ef_cond,
layer_MUX_uxn_device_h_l107_c3_47ef_iftrue,
layer_MUX_uxn_device_h_l107_c3_47ef_iffalse,
layer_MUX_uxn_device_h_l107_c3_47ef_return_output);

-- color_MUX_uxn_device_h_l107_c3_47ef
color_MUX_uxn_device_h_l107_c3_47ef : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l107_c3_47ef_cond,
color_MUX_uxn_device_h_l107_c3_47ef_iftrue,
color_MUX_uxn_device_h_l107_c3_47ef_iffalse,
color_MUX_uxn_device_h_l107_c3_47ef_return_output);

-- ctrl_MUX_uxn_device_h_l107_c3_47ef
ctrl_MUX_uxn_device_h_l107_c3_47ef : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l107_c3_47ef_cond,
ctrl_MUX_uxn_device_h_l107_c3_47ef_iftrue,
ctrl_MUX_uxn_device_h_l107_c3_47ef_iffalse,
ctrl_MUX_uxn_device_h_l107_c3_47ef_return_output);

-- flip_y_MUX_uxn_device_h_l107_c3_47ef
flip_y_MUX_uxn_device_h_l107_c3_47ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l107_c3_47ef_cond,
flip_y_MUX_uxn_device_h_l107_c3_47ef_iftrue,
flip_y_MUX_uxn_device_h_l107_c3_47ef_iffalse,
flip_y_MUX_uxn_device_h_l107_c3_47ef_return_output);

-- ctrl_mode_MUX_uxn_device_h_l107_c3_47ef
ctrl_mode_MUX_uxn_device_h_l107_c3_47ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l107_c3_47ef_cond,
ctrl_mode_MUX_uxn_device_h_l107_c3_47ef_iftrue,
ctrl_mode_MUX_uxn_device_h_l107_c3_47ef_iffalse,
ctrl_mode_MUX_uxn_device_h_l107_c3_47ef_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l107_c3_47ef
result_device_ram_address_MUX_uxn_device_h_l107_c3_47ef : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l107_c3_47ef_cond,
result_device_ram_address_MUX_uxn_device_h_l107_c3_47ef_iftrue,
result_device_ram_address_MUX_uxn_device_h_l107_c3_47ef_iffalse,
result_device_ram_address_MUX_uxn_device_h_l107_c3_47ef_return_output);

-- flip_x_MUX_uxn_device_h_l107_c3_47ef
flip_x_MUX_uxn_device_h_l107_c3_47ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l107_c3_47ef_cond,
flip_x_MUX_uxn_device_h_l107_c3_47ef_iftrue,
flip_x_MUX_uxn_device_h_l107_c3_47ef_iffalse,
flip_x_MUX_uxn_device_h_l107_c3_47ef_return_output);

-- CONST_SR_7_uxn_device_h_l110_c26_38da
CONST_SR_7_uxn_device_h_l110_c26_38da : entity work.CONST_SR_7_uint8_t_0CLK_de264c78 port map (
CONST_SR_7_uxn_device_h_l110_c26_38da_x,
CONST_SR_7_uxn_device_h_l110_c26_38da_return_output);

-- CONST_SR_6_uxn_device_h_l111_c22_e222
CONST_SR_6_uxn_device_h_l111_c22_e222 : entity work.CONST_SR_6_uint8_t_0CLK_de264c78 port map (
CONST_SR_6_uxn_device_h_l111_c22_e222_x,
CONST_SR_6_uxn_device_h_l111_c22_e222_return_output);

-- CONST_SR_5_uxn_device_h_l112_c23_3397
CONST_SR_5_uxn_device_h_l112_c23_3397 : entity work.CONST_SR_5_uint8_t_0CLK_de264c78 port map (
CONST_SR_5_uxn_device_h_l112_c23_3397_x,
CONST_SR_5_uxn_device_h_l112_c23_3397_return_output);

-- CONST_SR_4_uxn_device_h_l113_c23_4519
CONST_SR_4_uxn_device_h_l113_c23_4519 : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_device_h_l113_c23_4519_x,
CONST_SR_4_uxn_device_h_l113_c23_4519_return_output);

-- BIN_OP_EQ_uxn_device_h_l117_c11_79df
BIN_OP_EQ_uxn_device_h_l117_c11_79df : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l117_c11_79df_left,
BIN_OP_EQ_uxn_device_h_l117_c11_79df_right,
BIN_OP_EQ_uxn_device_h_l117_c11_79df_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_63d6
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_63d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_63d6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_63d6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_63d6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_63d6_return_output);

-- y_MUX_uxn_device_h_l117_c7_c075
y_MUX_uxn_device_h_l117_c7_c075 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l117_c7_c075_cond,
y_MUX_uxn_device_h_l117_c7_c075_iftrue,
y_MUX_uxn_device_h_l117_c7_c075_iffalse,
y_MUX_uxn_device_h_l117_c7_c075_return_output);

-- auto_advance_MUX_uxn_device_h_l117_c7_c075
auto_advance_MUX_uxn_device_h_l117_c7_c075 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l117_c7_c075_cond,
auto_advance_MUX_uxn_device_h_l117_c7_c075_iftrue,
auto_advance_MUX_uxn_device_h_l117_c7_c075_iffalse,
auto_advance_MUX_uxn_device_h_l117_c7_c075_return_output);

-- ram_addr_MUX_uxn_device_h_l117_c7_c075
ram_addr_MUX_uxn_device_h_l117_c7_c075 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l117_c7_c075_cond,
ram_addr_MUX_uxn_device_h_l117_c7_c075_iftrue,
ram_addr_MUX_uxn_device_h_l117_c7_c075_iffalse,
ram_addr_MUX_uxn_device_h_l117_c7_c075_return_output);

-- result_MUX_uxn_device_h_l117_c7_c075
result_MUX_uxn_device_h_l117_c7_c075 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l117_c7_c075_cond,
result_MUX_uxn_device_h_l117_c7_c075_iftrue,
result_MUX_uxn_device_h_l117_c7_c075_iffalse,
result_MUX_uxn_device_h_l117_c7_c075_return_output);

-- x_MUX_uxn_device_h_l117_c7_c075
x_MUX_uxn_device_h_l117_c7_c075 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l117_c7_c075_cond,
x_MUX_uxn_device_h_l117_c7_c075_iftrue,
x_MUX_uxn_device_h_l117_c7_c075_iffalse,
x_MUX_uxn_device_h_l117_c7_c075_return_output);

-- tmp8_MUX_uxn_device_h_l117_c7_c075
tmp8_MUX_uxn_device_h_l117_c7_c075 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l117_c7_c075_cond,
tmp8_MUX_uxn_device_h_l117_c7_c075_iftrue,
tmp8_MUX_uxn_device_h_l117_c7_c075_iffalse,
tmp8_MUX_uxn_device_h_l117_c7_c075_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l118_c3_5393
result_device_ram_address_MUX_uxn_device_h_l118_c3_5393 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l118_c3_5393_cond,
result_device_ram_address_MUX_uxn_device_h_l118_c3_5393_iftrue,
result_device_ram_address_MUX_uxn_device_h_l118_c3_5393_iffalse,
result_device_ram_address_MUX_uxn_device_h_l118_c3_5393_return_output);

-- x_MUX_uxn_device_h_l118_c3_5393
x_MUX_uxn_device_h_l118_c3_5393 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l118_c3_5393_cond,
x_MUX_uxn_device_h_l118_c3_5393_iftrue,
x_MUX_uxn_device_h_l118_c3_5393_iffalse,
x_MUX_uxn_device_h_l118_c3_5393_return_output);

-- BIN_OP_EQ_uxn_device_h_l124_c11_93f9
BIN_OP_EQ_uxn_device_h_l124_c11_93f9 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l124_c11_93f9_left,
BIN_OP_EQ_uxn_device_h_l124_c11_93f9_right,
BIN_OP_EQ_uxn_device_h_l124_c11_93f9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_7bb6
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_7bb6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_7bb6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_7bb6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_7bb6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_7bb6_return_output);

-- y_MUX_uxn_device_h_l124_c7_63d6
y_MUX_uxn_device_h_l124_c7_63d6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l124_c7_63d6_cond,
y_MUX_uxn_device_h_l124_c7_63d6_iftrue,
y_MUX_uxn_device_h_l124_c7_63d6_iffalse,
y_MUX_uxn_device_h_l124_c7_63d6_return_output);

-- auto_advance_MUX_uxn_device_h_l124_c7_63d6
auto_advance_MUX_uxn_device_h_l124_c7_63d6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l124_c7_63d6_cond,
auto_advance_MUX_uxn_device_h_l124_c7_63d6_iftrue,
auto_advance_MUX_uxn_device_h_l124_c7_63d6_iffalse,
auto_advance_MUX_uxn_device_h_l124_c7_63d6_return_output);

-- ram_addr_MUX_uxn_device_h_l124_c7_63d6
ram_addr_MUX_uxn_device_h_l124_c7_63d6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l124_c7_63d6_cond,
ram_addr_MUX_uxn_device_h_l124_c7_63d6_iftrue,
ram_addr_MUX_uxn_device_h_l124_c7_63d6_iffalse,
ram_addr_MUX_uxn_device_h_l124_c7_63d6_return_output);

-- result_MUX_uxn_device_h_l124_c7_63d6
result_MUX_uxn_device_h_l124_c7_63d6 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l124_c7_63d6_cond,
result_MUX_uxn_device_h_l124_c7_63d6_iftrue,
result_MUX_uxn_device_h_l124_c7_63d6_iffalse,
result_MUX_uxn_device_h_l124_c7_63d6_return_output);

-- x_MUX_uxn_device_h_l124_c7_63d6
x_MUX_uxn_device_h_l124_c7_63d6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l124_c7_63d6_cond,
x_MUX_uxn_device_h_l124_c7_63d6_iftrue,
x_MUX_uxn_device_h_l124_c7_63d6_iffalse,
x_MUX_uxn_device_h_l124_c7_63d6_return_output);

-- tmp8_MUX_uxn_device_h_l124_c7_63d6
tmp8_MUX_uxn_device_h_l124_c7_63d6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l124_c7_63d6_cond,
tmp8_MUX_uxn_device_h_l124_c7_63d6_iftrue,
tmp8_MUX_uxn_device_h_l124_c7_63d6_iffalse,
tmp8_MUX_uxn_device_h_l124_c7_63d6_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l125_c3_43f8
result_device_ram_address_MUX_uxn_device_h_l125_c3_43f8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l125_c3_43f8_cond,
result_device_ram_address_MUX_uxn_device_h_l125_c3_43f8_iftrue,
result_device_ram_address_MUX_uxn_device_h_l125_c3_43f8_iffalse,
result_device_ram_address_MUX_uxn_device_h_l125_c3_43f8_return_output);

-- x_MUX_uxn_device_h_l125_c3_43f8
x_MUX_uxn_device_h_l125_c3_43f8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l125_c3_43f8_cond,
x_MUX_uxn_device_h_l125_c3_43f8_iftrue,
x_MUX_uxn_device_h_l125_c3_43f8_iffalse,
x_MUX_uxn_device_h_l125_c3_43f8_return_output);

-- BIN_OP_OR_uxn_device_h_l126_c4_0212
BIN_OP_OR_uxn_device_h_l126_c4_0212 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l126_c4_0212_left,
BIN_OP_OR_uxn_device_h_l126_c4_0212_right,
BIN_OP_OR_uxn_device_h_l126_c4_0212_return_output);

-- BIN_OP_EQ_uxn_device_h_l130_c11_db22
BIN_OP_EQ_uxn_device_h_l130_c11_db22 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l130_c11_db22_left,
BIN_OP_EQ_uxn_device_h_l130_c11_db22_right,
BIN_OP_EQ_uxn_device_h_l130_c11_db22_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_1fcf
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_1fcf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_1fcf_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_1fcf_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_1fcf_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_1fcf_return_output);

-- y_MUX_uxn_device_h_l130_c7_7bb6
y_MUX_uxn_device_h_l130_c7_7bb6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l130_c7_7bb6_cond,
y_MUX_uxn_device_h_l130_c7_7bb6_iftrue,
y_MUX_uxn_device_h_l130_c7_7bb6_iffalse,
y_MUX_uxn_device_h_l130_c7_7bb6_return_output);

-- auto_advance_MUX_uxn_device_h_l130_c7_7bb6
auto_advance_MUX_uxn_device_h_l130_c7_7bb6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l130_c7_7bb6_cond,
auto_advance_MUX_uxn_device_h_l130_c7_7bb6_iftrue,
auto_advance_MUX_uxn_device_h_l130_c7_7bb6_iffalse,
auto_advance_MUX_uxn_device_h_l130_c7_7bb6_return_output);

-- ram_addr_MUX_uxn_device_h_l130_c7_7bb6
ram_addr_MUX_uxn_device_h_l130_c7_7bb6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l130_c7_7bb6_cond,
ram_addr_MUX_uxn_device_h_l130_c7_7bb6_iftrue,
ram_addr_MUX_uxn_device_h_l130_c7_7bb6_iffalse,
ram_addr_MUX_uxn_device_h_l130_c7_7bb6_return_output);

-- result_MUX_uxn_device_h_l130_c7_7bb6
result_MUX_uxn_device_h_l130_c7_7bb6 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l130_c7_7bb6_cond,
result_MUX_uxn_device_h_l130_c7_7bb6_iftrue,
result_MUX_uxn_device_h_l130_c7_7bb6_iffalse,
result_MUX_uxn_device_h_l130_c7_7bb6_return_output);

-- x_MUX_uxn_device_h_l130_c7_7bb6
x_MUX_uxn_device_h_l130_c7_7bb6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l130_c7_7bb6_cond,
x_MUX_uxn_device_h_l130_c7_7bb6_iftrue,
x_MUX_uxn_device_h_l130_c7_7bb6_iffalse,
x_MUX_uxn_device_h_l130_c7_7bb6_return_output);

-- tmp8_MUX_uxn_device_h_l130_c7_7bb6
tmp8_MUX_uxn_device_h_l130_c7_7bb6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l130_c7_7bb6_cond,
tmp8_MUX_uxn_device_h_l130_c7_7bb6_iftrue,
tmp8_MUX_uxn_device_h_l130_c7_7bb6_iffalse,
tmp8_MUX_uxn_device_h_l130_c7_7bb6_return_output);

-- y_MUX_uxn_device_h_l131_c3_e626
y_MUX_uxn_device_h_l131_c3_e626 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l131_c3_e626_cond,
y_MUX_uxn_device_h_l131_c3_e626_iftrue,
y_MUX_uxn_device_h_l131_c3_e626_iffalse,
y_MUX_uxn_device_h_l131_c3_e626_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l131_c3_e626
result_device_ram_address_MUX_uxn_device_h_l131_c3_e626 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l131_c3_e626_cond,
result_device_ram_address_MUX_uxn_device_h_l131_c3_e626_iftrue,
result_device_ram_address_MUX_uxn_device_h_l131_c3_e626_iffalse,
result_device_ram_address_MUX_uxn_device_h_l131_c3_e626_return_output);

-- BIN_OP_EQ_uxn_device_h_l137_c11_ce3c
BIN_OP_EQ_uxn_device_h_l137_c11_ce3c : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l137_c11_ce3c_left,
BIN_OP_EQ_uxn_device_h_l137_c11_ce3c_right,
BIN_OP_EQ_uxn_device_h_l137_c11_ce3c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l157_c7_8256
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l157_c7_8256 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l157_c7_8256_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l157_c7_8256_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l157_c7_8256_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l157_c7_8256_return_output);

-- y_MUX_uxn_device_h_l137_c7_1fcf
y_MUX_uxn_device_h_l137_c7_1fcf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l137_c7_1fcf_cond,
y_MUX_uxn_device_h_l137_c7_1fcf_iftrue,
y_MUX_uxn_device_h_l137_c7_1fcf_iffalse,
y_MUX_uxn_device_h_l137_c7_1fcf_return_output);

-- auto_advance_MUX_uxn_device_h_l137_c7_1fcf
auto_advance_MUX_uxn_device_h_l137_c7_1fcf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l137_c7_1fcf_cond,
auto_advance_MUX_uxn_device_h_l137_c7_1fcf_iftrue,
auto_advance_MUX_uxn_device_h_l137_c7_1fcf_iffalse,
auto_advance_MUX_uxn_device_h_l137_c7_1fcf_return_output);

-- ram_addr_MUX_uxn_device_h_l137_c7_1fcf
ram_addr_MUX_uxn_device_h_l137_c7_1fcf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l137_c7_1fcf_cond,
ram_addr_MUX_uxn_device_h_l137_c7_1fcf_iftrue,
ram_addr_MUX_uxn_device_h_l137_c7_1fcf_iffalse,
ram_addr_MUX_uxn_device_h_l137_c7_1fcf_return_output);

-- result_MUX_uxn_device_h_l137_c7_1fcf
result_MUX_uxn_device_h_l137_c7_1fcf : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l137_c7_1fcf_cond,
result_MUX_uxn_device_h_l137_c7_1fcf_iftrue,
result_MUX_uxn_device_h_l137_c7_1fcf_iffalse,
result_MUX_uxn_device_h_l137_c7_1fcf_return_output);

-- x_MUX_uxn_device_h_l137_c7_1fcf
x_MUX_uxn_device_h_l137_c7_1fcf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l137_c7_1fcf_cond,
x_MUX_uxn_device_h_l137_c7_1fcf_iftrue,
x_MUX_uxn_device_h_l137_c7_1fcf_iffalse,
x_MUX_uxn_device_h_l137_c7_1fcf_return_output);

-- tmp8_MUX_uxn_device_h_l137_c7_1fcf
tmp8_MUX_uxn_device_h_l137_c7_1fcf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l137_c7_1fcf_cond,
tmp8_MUX_uxn_device_h_l137_c7_1fcf_iftrue,
tmp8_MUX_uxn_device_h_l137_c7_1fcf_iffalse,
tmp8_MUX_uxn_device_h_l137_c7_1fcf_return_output);

-- y_MUX_uxn_device_h_l138_c3_3093
y_MUX_uxn_device_h_l138_c3_3093 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l138_c3_3093_cond,
y_MUX_uxn_device_h_l138_c3_3093_iftrue,
y_MUX_uxn_device_h_l138_c3_3093_iffalse,
y_MUX_uxn_device_h_l138_c3_3093_return_output);

-- result_u8_value_MUX_uxn_device_h_l138_c3_3093
result_u8_value_MUX_uxn_device_h_l138_c3_3093 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l138_c3_3093_cond,
result_u8_value_MUX_uxn_device_h_l138_c3_3093_iftrue,
result_u8_value_MUX_uxn_device_h_l138_c3_3093_iffalse,
result_u8_value_MUX_uxn_device_h_l138_c3_3093_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l138_c3_3093
result_device_ram_address_MUX_uxn_device_h_l138_c3_3093 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l138_c3_3093_cond,
result_device_ram_address_MUX_uxn_device_h_l138_c3_3093_iftrue,
result_device_ram_address_MUX_uxn_device_h_l138_c3_3093_iffalse,
result_device_ram_address_MUX_uxn_device_h_l138_c3_3093_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l138_c3_3093
result_vram_write_layer_MUX_uxn_device_h_l138_c3_3093 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l138_c3_3093_cond,
result_vram_write_layer_MUX_uxn_device_h_l138_c3_3093_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l138_c3_3093_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l138_c3_3093_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l138_c3_3093
result_is_vram_write_MUX_uxn_device_h_l138_c3_3093 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l138_c3_3093_cond,
result_is_vram_write_MUX_uxn_device_h_l138_c3_3093_iftrue,
result_is_vram_write_MUX_uxn_device_h_l138_c3_3093_iffalse,
result_is_vram_write_MUX_uxn_device_h_l138_c3_3093_return_output);

-- result_u16_addr_MUX_uxn_device_h_l138_c3_3093
result_u16_addr_MUX_uxn_device_h_l138_c3_3093 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_addr_MUX_uxn_device_h_l138_c3_3093_cond,
result_u16_addr_MUX_uxn_device_h_l138_c3_3093_iftrue,
result_u16_addr_MUX_uxn_device_h_l138_c3_3093_iffalse,
result_u16_addr_MUX_uxn_device_h_l138_c3_3093_return_output);

-- tmp8_MUX_uxn_device_h_l138_c3_3093
tmp8_MUX_uxn_device_h_l138_c3_3093 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l138_c3_3093_cond,
tmp8_MUX_uxn_device_h_l138_c3_3093_iftrue,
tmp8_MUX_uxn_device_h_l138_c3_3093_iffalse,
tmp8_MUX_uxn_device_h_l138_c3_3093_return_output);

-- BIN_OP_AND_uxn_device_h_l141_c11_e808
BIN_OP_AND_uxn_device_h_l141_c11_e808 : entity work.BIN_OP_AND_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l141_c11_e808_left,
BIN_OP_AND_uxn_device_h_l141_c11_e808_right,
BIN_OP_AND_uxn_device_h_l141_c11_e808_return_output);

-- BIN_OP_INFERRED_MULT_uxn_device_h_l142_c23_431d
BIN_OP_INFERRED_MULT_uxn_device_h_l142_c23_431d : entity work.BIN_OP_INFERRED_MULT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_device_h_l142_c23_431d_left,
BIN_OP_INFERRED_MULT_uxn_device_h_l142_c23_431d_right,
BIN_OP_INFERRED_MULT_uxn_device_h_l142_c23_431d_return_output);

-- BIN_OP_PLUS_uxn_device_h_l142_c23_d3c0
BIN_OP_PLUS_uxn_device_h_l142_c23_d3c0 : entity work.BIN_OP_PLUS_uint32_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l142_c23_d3c0_left,
BIN_OP_PLUS_uxn_device_h_l142_c23_d3c0_right,
BIN_OP_PLUS_uxn_device_h_l142_c23_d3c0_return_output);

-- tmp8_MUX_uxn_device_h_l145_c4_f761
tmp8_MUX_uxn_device_h_l145_c4_f761 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l145_c4_f761_cond,
tmp8_MUX_uxn_device_h_l145_c4_f761_iftrue,
tmp8_MUX_uxn_device_h_l145_c4_f761_iffalse,
tmp8_MUX_uxn_device_h_l145_c4_f761_return_output);

-- MUX_uxn_device_h_l146_c13_4e7b
MUX_uxn_device_h_l146_c13_4e7b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l146_c13_4e7b_cond,
MUX_uxn_device_h_l146_c13_4e7b_iftrue,
MUX_uxn_device_h_l146_c13_4e7b_iffalse,
MUX_uxn_device_h_l146_c13_4e7b_return_output);

-- BIN_OP_OR_uxn_device_h_l146_c5_36a8
BIN_OP_OR_uxn_device_h_l146_c5_36a8 : entity work.BIN_OP_OR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l146_c5_36a8_left,
BIN_OP_OR_uxn_device_h_l146_c5_36a8_right,
BIN_OP_OR_uxn_device_h_l146_c5_36a8_return_output);

-- MUX_uxn_device_h_l147_c13_0f55
MUX_uxn_device_h_l147_c13_0f55 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l147_c13_0f55_cond,
MUX_uxn_device_h_l147_c13_0f55_iftrue,
MUX_uxn_device_h_l147_c13_0f55_iffalse,
MUX_uxn_device_h_l147_c13_0f55_return_output);

-- BIN_OP_OR_uxn_device_h_l147_c5_fb66
BIN_OP_OR_uxn_device_h_l147_c5_fb66 : entity work.BIN_OP_OR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l147_c5_fb66_left,
BIN_OP_OR_uxn_device_h_l147_c5_fb66_right,
BIN_OP_OR_uxn_device_h_l147_c5_fb66_return_output);

-- y_MUX_uxn_device_h_l152_c8_7000
y_MUX_uxn_device_h_l152_c8_7000 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l152_c8_7000_cond,
y_MUX_uxn_device_h_l152_c8_7000_iftrue,
y_MUX_uxn_device_h_l152_c8_7000_iffalse,
y_MUX_uxn_device_h_l152_c8_7000_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l152_c8_7000
result_device_ram_address_MUX_uxn_device_h_l152_c8_7000 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l152_c8_7000_cond,
result_device_ram_address_MUX_uxn_device_h_l152_c8_7000_iftrue,
result_device_ram_address_MUX_uxn_device_h_l152_c8_7000_iffalse,
result_device_ram_address_MUX_uxn_device_h_l152_c8_7000_return_output);

-- BIN_OP_EQ_uxn_device_h_l157_c11_7a8b
BIN_OP_EQ_uxn_device_h_l157_c11_7a8b : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l157_c11_7a8b_left,
BIN_OP_EQ_uxn_device_h_l157_c11_7a8b_right,
BIN_OP_EQ_uxn_device_h_l157_c11_7a8b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l179_c7_23a6
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l179_c7_23a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l179_c7_23a6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l179_c7_23a6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l179_c7_23a6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l179_c7_23a6_return_output);

-- auto_advance_MUX_uxn_device_h_l157_c7_8256
auto_advance_MUX_uxn_device_h_l157_c7_8256 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l157_c7_8256_cond,
auto_advance_MUX_uxn_device_h_l157_c7_8256_iftrue,
auto_advance_MUX_uxn_device_h_l157_c7_8256_iffalse,
auto_advance_MUX_uxn_device_h_l157_c7_8256_return_output);

-- ram_addr_MUX_uxn_device_h_l157_c7_8256
ram_addr_MUX_uxn_device_h_l157_c7_8256 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l157_c7_8256_cond,
ram_addr_MUX_uxn_device_h_l157_c7_8256_iftrue,
ram_addr_MUX_uxn_device_h_l157_c7_8256_iffalse,
ram_addr_MUX_uxn_device_h_l157_c7_8256_return_output);

-- result_MUX_uxn_device_h_l157_c7_8256
result_MUX_uxn_device_h_l157_c7_8256 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l157_c7_8256_cond,
result_MUX_uxn_device_h_l157_c7_8256_iftrue,
result_MUX_uxn_device_h_l157_c7_8256_iffalse,
result_MUX_uxn_device_h_l157_c7_8256_return_output);

-- x_MUX_uxn_device_h_l157_c7_8256
x_MUX_uxn_device_h_l157_c7_8256 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l157_c7_8256_cond,
x_MUX_uxn_device_h_l157_c7_8256_iftrue,
x_MUX_uxn_device_h_l157_c7_8256_iffalse,
x_MUX_uxn_device_h_l157_c7_8256_return_output);

-- auto_advance_MUX_uxn_device_h_l158_c3_2a1e
auto_advance_MUX_uxn_device_h_l158_c3_2a1e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l158_c3_2a1e_cond,
auto_advance_MUX_uxn_device_h_l158_c3_2a1e_iftrue,
auto_advance_MUX_uxn_device_h_l158_c3_2a1e_iffalse,
auto_advance_MUX_uxn_device_h_l158_c3_2a1e_return_output);

-- result_u8_value_MUX_uxn_device_h_l158_c3_2a1e
result_u8_value_MUX_uxn_device_h_l158_c3_2a1e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l158_c3_2a1e_cond,
result_u8_value_MUX_uxn_device_h_l158_c3_2a1e_iftrue,
result_u8_value_MUX_uxn_device_h_l158_c3_2a1e_iffalse,
result_u8_value_MUX_uxn_device_h_l158_c3_2a1e_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l158_c3_2a1e
result_device_ram_address_MUX_uxn_device_h_l158_c3_2a1e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l158_c3_2a1e_cond,
result_device_ram_address_MUX_uxn_device_h_l158_c3_2a1e_iftrue,
result_device_ram_address_MUX_uxn_device_h_l158_c3_2a1e_iffalse,
result_device_ram_address_MUX_uxn_device_h_l158_c3_2a1e_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l158_c3_2a1e
result_is_deo_done_MUX_uxn_device_h_l158_c3_2a1e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l158_c3_2a1e_cond,
result_is_deo_done_MUX_uxn_device_h_l158_c3_2a1e_iftrue,
result_is_deo_done_MUX_uxn_device_h_l158_c3_2a1e_iffalse,
result_is_deo_done_MUX_uxn_device_h_l158_c3_2a1e_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l158_c3_2a1e
result_is_device_ram_write_MUX_uxn_device_h_l158_c3_2a1e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l158_c3_2a1e_cond,
result_is_device_ram_write_MUX_uxn_device_h_l158_c3_2a1e_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l158_c3_2a1e_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l158_c3_2a1e_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l158_c3_2a1e
result_is_vram_write_MUX_uxn_device_h_l158_c3_2a1e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l158_c3_2a1e_cond,
result_is_vram_write_MUX_uxn_device_h_l158_c3_2a1e_iftrue,
result_is_vram_write_MUX_uxn_device_h_l158_c3_2a1e_iffalse,
result_is_vram_write_MUX_uxn_device_h_l158_c3_2a1e_return_output);

-- result_u16_addr_MUX_uxn_device_h_l158_c3_2a1e
result_u16_addr_MUX_uxn_device_h_l158_c3_2a1e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_addr_MUX_uxn_device_h_l158_c3_2a1e_cond,
result_u16_addr_MUX_uxn_device_h_l158_c3_2a1e_iftrue,
result_u16_addr_MUX_uxn_device_h_l158_c3_2a1e_iffalse,
result_u16_addr_MUX_uxn_device_h_l158_c3_2a1e_return_output);

-- x_MUX_uxn_device_h_l158_c3_2a1e
x_MUX_uxn_device_h_l158_c3_2a1e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l158_c3_2a1e_cond,
x_MUX_uxn_device_h_l158_c3_2a1e_iftrue,
x_MUX_uxn_device_h_l158_c3_2a1e_iffalse,
x_MUX_uxn_device_h_l158_c3_2a1e_return_output);

-- UNARY_OP_NOT_uxn_device_h_l163_c9_88b8
UNARY_OP_NOT_uxn_device_h_l163_c9_88b8 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_device_h_l163_c9_88b8_expr,
UNARY_OP_NOT_uxn_device_h_l163_c9_88b8_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l163_c4_8d15
result_is_deo_done_MUX_uxn_device_h_l163_c4_8d15 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l163_c4_8d15_cond,
result_is_deo_done_MUX_uxn_device_h_l163_c4_8d15_iftrue,
result_is_deo_done_MUX_uxn_device_h_l163_c4_8d15_iffalse,
result_is_deo_done_MUX_uxn_device_h_l163_c4_8d15_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l163_c4_8d15
result_is_device_ram_write_MUX_uxn_device_h_l163_c4_8d15 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l163_c4_8d15_cond,
result_is_device_ram_write_MUX_uxn_device_h_l163_c4_8d15_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l163_c4_8d15_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l163_c4_8d15_return_output);

-- result_u8_value_MUX_uxn_device_h_l163_c4_8d15
result_u8_value_MUX_uxn_device_h_l163_c4_8d15 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l163_c4_8d15_cond,
result_u8_value_MUX_uxn_device_h_l163_c4_8d15_iftrue,
result_u8_value_MUX_uxn_device_h_l163_c4_8d15_iffalse,
result_u8_value_MUX_uxn_device_h_l163_c4_8d15_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l163_c4_8d15
result_device_ram_address_MUX_uxn_device_h_l163_c4_8d15 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l163_c4_8d15_cond,
result_device_ram_address_MUX_uxn_device_h_l163_c4_8d15_iftrue,
result_device_ram_address_MUX_uxn_device_h_l163_c4_8d15_iffalse,
result_device_ram_address_MUX_uxn_device_h_l163_c4_8d15_return_output);

-- x_MUX_uxn_device_h_l163_c4_8d15
x_MUX_uxn_device_h_l163_c4_8d15 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l163_c4_8d15_cond,
x_MUX_uxn_device_h_l163_c4_8d15_iftrue,
x_MUX_uxn_device_h_l163_c4_8d15_iffalse,
x_MUX_uxn_device_h_l163_c4_8d15_return_output);

-- BIN_OP_AND_uxn_device_h_l164_c9_1a84
BIN_OP_AND_uxn_device_h_l164_c9_1a84 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l164_c9_1a84_left,
BIN_OP_AND_uxn_device_h_l164_c9_1a84_right,
BIN_OP_AND_uxn_device_h_l164_c9_1a84_return_output);

-- BIN_OP_NEQ_uxn_device_h_l164_c9_0470
BIN_OP_NEQ_uxn_device_h_l164_c9_0470 : entity work.BIN_OP_NEQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_NEQ_uxn_device_h_l164_c9_0470_left,
BIN_OP_NEQ_uxn_device_h_l164_c9_0470_right,
BIN_OP_NEQ_uxn_device_h_l164_c9_0470_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l164_c5_ec39
result_is_device_ram_write_MUX_uxn_device_h_l164_c5_ec39 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l164_c5_ec39_cond,
result_is_device_ram_write_MUX_uxn_device_h_l164_c5_ec39_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l164_c5_ec39_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l164_c5_ec39_return_output);

-- result_u8_value_MUX_uxn_device_h_l164_c5_ec39
result_u8_value_MUX_uxn_device_h_l164_c5_ec39 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l164_c5_ec39_cond,
result_u8_value_MUX_uxn_device_h_l164_c5_ec39_iftrue,
result_u8_value_MUX_uxn_device_h_l164_c5_ec39_iffalse,
result_u8_value_MUX_uxn_device_h_l164_c5_ec39_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l164_c5_ec39
result_device_ram_address_MUX_uxn_device_h_l164_c5_ec39 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l164_c5_ec39_cond,
result_device_ram_address_MUX_uxn_device_h_l164_c5_ec39_iftrue,
result_device_ram_address_MUX_uxn_device_h_l164_c5_ec39_iffalse,
result_device_ram_address_MUX_uxn_device_h_l164_c5_ec39_return_output);

-- x_MUX_uxn_device_h_l164_c5_ec39
x_MUX_uxn_device_h_l164_c5_ec39 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l164_c5_ec39_cond,
x_MUX_uxn_device_h_l164_c5_ec39_iftrue,
x_MUX_uxn_device_h_l164_c5_ec39_iffalse,
x_MUX_uxn_device_h_l164_c5_ec39_return_output);

-- BIN_OP_PLUS_uxn_device_h_l165_c6_3010
BIN_OP_PLUS_uxn_device_h_l165_c6_3010 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l165_c6_3010_left,
BIN_OP_PLUS_uxn_device_h_l165_c6_3010_right,
BIN_OP_PLUS_uxn_device_h_l165_c6_3010_return_output);

-- CONST_SR_8_uxn_device_h_l168_c34_b539
CONST_SR_8_uxn_device_h_l168_c34_b539 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_device_h_l168_c34_b539_x,
CONST_SR_8_uxn_device_h_l168_c34_b539_return_output);

-- auto_advance_MUX_uxn_device_h_l174_c8_9300
auto_advance_MUX_uxn_device_h_l174_c8_9300 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l174_c8_9300_cond,
auto_advance_MUX_uxn_device_h_l174_c8_9300_iftrue,
auto_advance_MUX_uxn_device_h_l174_c8_9300_iffalse,
auto_advance_MUX_uxn_device_h_l174_c8_9300_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l174_c8_9300
result_device_ram_address_MUX_uxn_device_h_l174_c8_9300 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l174_c8_9300_cond,
result_device_ram_address_MUX_uxn_device_h_l174_c8_9300_iftrue,
result_device_ram_address_MUX_uxn_device_h_l174_c8_9300_iffalse,
result_device_ram_address_MUX_uxn_device_h_l174_c8_9300_return_output);

-- BIN_OP_EQ_uxn_device_h_l179_c11_3971
BIN_OP_EQ_uxn_device_h_l179_c11_3971 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l179_c11_3971_left,
BIN_OP_EQ_uxn_device_h_l179_c11_3971_right,
BIN_OP_EQ_uxn_device_h_l179_c11_3971_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_f8ff
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_f8ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_f8ff_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_f8ff_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_f8ff_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_f8ff_return_output);

-- ram_addr_MUX_uxn_device_h_l179_c7_23a6
ram_addr_MUX_uxn_device_h_l179_c7_23a6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l179_c7_23a6_cond,
ram_addr_MUX_uxn_device_h_l179_c7_23a6_iftrue,
ram_addr_MUX_uxn_device_h_l179_c7_23a6_iffalse,
ram_addr_MUX_uxn_device_h_l179_c7_23a6_return_output);

-- result_MUX_uxn_device_h_l179_c7_23a6
result_MUX_uxn_device_h_l179_c7_23a6 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l179_c7_23a6_cond,
result_MUX_uxn_device_h_l179_c7_23a6_iftrue,
result_MUX_uxn_device_h_l179_c7_23a6_iffalse,
result_MUX_uxn_device_h_l179_c7_23a6_return_output);

-- ram_addr_MUX_uxn_device_h_l180_c3_431f
ram_addr_MUX_uxn_device_h_l180_c3_431f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l180_c3_431f_cond,
ram_addr_MUX_uxn_device_h_l180_c3_431f_iftrue,
ram_addr_MUX_uxn_device_h_l180_c3_431f_iffalse,
ram_addr_MUX_uxn_device_h_l180_c3_431f_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l180_c3_431f
result_is_device_ram_write_MUX_uxn_device_h_l180_c3_431f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l180_c3_431f_cond,
result_is_device_ram_write_MUX_uxn_device_h_l180_c3_431f_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l180_c3_431f_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l180_c3_431f_return_output);

-- result_u8_value_MUX_uxn_device_h_l180_c3_431f
result_u8_value_MUX_uxn_device_h_l180_c3_431f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l180_c3_431f_cond,
result_u8_value_MUX_uxn_device_h_l180_c3_431f_iftrue,
result_u8_value_MUX_uxn_device_h_l180_c3_431f_iffalse,
result_u8_value_MUX_uxn_device_h_l180_c3_431f_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l180_c3_431f
result_device_ram_address_MUX_uxn_device_h_l180_c3_431f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l180_c3_431f_cond,
result_device_ram_address_MUX_uxn_device_h_l180_c3_431f_iftrue,
result_device_ram_address_MUX_uxn_device_h_l180_c3_431f_iffalse,
result_device_ram_address_MUX_uxn_device_h_l180_c3_431f_return_output);

-- BIN_OP_AND_uxn_device_h_l181_c8_71c3
BIN_OP_AND_uxn_device_h_l181_c8_71c3 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l181_c8_71c3_left,
BIN_OP_AND_uxn_device_h_l181_c8_71c3_right,
BIN_OP_AND_uxn_device_h_l181_c8_71c3_return_output);

-- BIN_OP_NEQ_uxn_device_h_l181_c8_cf7f
BIN_OP_NEQ_uxn_device_h_l181_c8_cf7f : entity work.BIN_OP_NEQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_NEQ_uxn_device_h_l181_c8_cf7f_left,
BIN_OP_NEQ_uxn_device_h_l181_c8_cf7f_right,
BIN_OP_NEQ_uxn_device_h_l181_c8_cf7f_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l181_c4_8670
result_is_device_ram_write_MUX_uxn_device_h_l181_c4_8670 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l181_c4_8670_cond,
result_is_device_ram_write_MUX_uxn_device_h_l181_c4_8670_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l181_c4_8670_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l181_c4_8670_return_output);

-- result_u8_value_MUX_uxn_device_h_l181_c4_8670
result_u8_value_MUX_uxn_device_h_l181_c4_8670 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l181_c4_8670_cond,
result_u8_value_MUX_uxn_device_h_l181_c4_8670_iftrue,
result_u8_value_MUX_uxn_device_h_l181_c4_8670_iffalse,
result_u8_value_MUX_uxn_device_h_l181_c4_8670_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l181_c4_8670
result_device_ram_address_MUX_uxn_device_h_l181_c4_8670 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l181_c4_8670_cond,
result_device_ram_address_MUX_uxn_device_h_l181_c4_8670_iftrue,
result_device_ram_address_MUX_uxn_device_h_l181_c4_8670_iffalse,
result_device_ram_address_MUX_uxn_device_h_l181_c4_8670_return_output);

-- ram_addr_MUX_uxn_device_h_l187_c8_3a68
ram_addr_MUX_uxn_device_h_l187_c8_3a68 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l187_c8_3a68_cond,
ram_addr_MUX_uxn_device_h_l187_c8_3a68_iftrue,
ram_addr_MUX_uxn_device_h_l187_c8_3a68_iffalse,
ram_addr_MUX_uxn_device_h_l187_c8_3a68_return_output);

-- BIN_OP_EQ_uxn_device_h_l192_c11_c3ed
BIN_OP_EQ_uxn_device_h_l192_c11_c3ed : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l192_c11_c3ed_left,
BIN_OP_EQ_uxn_device_h_l192_c11_c3ed_right,
BIN_OP_EQ_uxn_device_h_l192_c11_c3ed_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c7_8d42
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c7_8d42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c7_8d42_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c7_8d42_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c7_8d42_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c7_8d42_return_output);

-- ram_addr_MUX_uxn_device_h_l192_c7_f8ff
ram_addr_MUX_uxn_device_h_l192_c7_f8ff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l192_c7_f8ff_cond,
ram_addr_MUX_uxn_device_h_l192_c7_f8ff_iftrue,
ram_addr_MUX_uxn_device_h_l192_c7_f8ff_iffalse,
ram_addr_MUX_uxn_device_h_l192_c7_f8ff_return_output);

-- result_MUX_uxn_device_h_l192_c7_f8ff
result_MUX_uxn_device_h_l192_c7_f8ff : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l192_c7_f8ff_cond,
result_MUX_uxn_device_h_l192_c7_f8ff_iftrue,
result_MUX_uxn_device_h_l192_c7_f8ff_iffalse,
result_MUX_uxn_device_h_l192_c7_f8ff_return_output);

-- ram_addr_MUX_uxn_device_h_l193_c3_532b
ram_addr_MUX_uxn_device_h_l193_c3_532b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l193_c3_532b_cond,
ram_addr_MUX_uxn_device_h_l193_c3_532b_iftrue,
ram_addr_MUX_uxn_device_h_l193_c3_532b_iffalse,
ram_addr_MUX_uxn_device_h_l193_c3_532b_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l193_c3_532b
result_is_device_ram_write_MUX_uxn_device_h_l193_c3_532b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l193_c3_532b_cond,
result_is_device_ram_write_MUX_uxn_device_h_l193_c3_532b_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l193_c3_532b_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l193_c3_532b_return_output);

-- result_u8_value_MUX_uxn_device_h_l193_c3_532b
result_u8_value_MUX_uxn_device_h_l193_c3_532b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l193_c3_532b_cond,
result_u8_value_MUX_uxn_device_h_l193_c3_532b_iftrue,
result_u8_value_MUX_uxn_device_h_l193_c3_532b_iffalse,
result_u8_value_MUX_uxn_device_h_l193_c3_532b_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l193_c3_532b
result_device_ram_address_MUX_uxn_device_h_l193_c3_532b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l193_c3_532b_cond,
result_device_ram_address_MUX_uxn_device_h_l193_c3_532b_iftrue,
result_device_ram_address_MUX_uxn_device_h_l193_c3_532b_iffalse,
result_device_ram_address_MUX_uxn_device_h_l193_c3_532b_return_output);

-- BIN_OP_AND_uxn_device_h_l194_c9_dc22
BIN_OP_AND_uxn_device_h_l194_c9_dc22 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l194_c9_dc22_left,
BIN_OP_AND_uxn_device_h_l194_c9_dc22_right,
BIN_OP_AND_uxn_device_h_l194_c9_dc22_return_output);

-- BIN_OP_NEQ_uxn_device_h_l194_c9_bab2
BIN_OP_NEQ_uxn_device_h_l194_c9_bab2 : entity work.BIN_OP_NEQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_NEQ_uxn_device_h_l194_c9_bab2_left,
BIN_OP_NEQ_uxn_device_h_l194_c9_bab2_right,
BIN_OP_NEQ_uxn_device_h_l194_c9_bab2_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l194_c4_1fab
result_is_device_ram_write_MUX_uxn_device_h_l194_c4_1fab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l194_c4_1fab_cond,
result_is_device_ram_write_MUX_uxn_device_h_l194_c4_1fab_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l194_c4_1fab_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l194_c4_1fab_return_output);

-- result_u8_value_MUX_uxn_device_h_l194_c4_1fab
result_u8_value_MUX_uxn_device_h_l194_c4_1fab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l194_c4_1fab_cond,
result_u8_value_MUX_uxn_device_h_l194_c4_1fab_iftrue,
result_u8_value_MUX_uxn_device_h_l194_c4_1fab_iffalse,
result_u8_value_MUX_uxn_device_h_l194_c4_1fab_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l194_c4_1fab
result_device_ram_address_MUX_uxn_device_h_l194_c4_1fab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l194_c4_1fab_cond,
result_device_ram_address_MUX_uxn_device_h_l194_c4_1fab_iftrue,
result_device_ram_address_MUX_uxn_device_h_l194_c4_1fab_iffalse,
result_device_ram_address_MUX_uxn_device_h_l194_c4_1fab_return_output);

-- CONST_SR_8_uxn_device_h_l197_c33_0a9c
CONST_SR_8_uxn_device_h_l197_c33_0a9c : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_device_h_l197_c33_0a9c_x,
CONST_SR_8_uxn_device_h_l197_c33_0a9c_return_output);

-- ram_addr_MUX_uxn_device_h_l200_c8_4bb9
ram_addr_MUX_uxn_device_h_l200_c8_4bb9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l200_c8_4bb9_cond,
ram_addr_MUX_uxn_device_h_l200_c8_4bb9_iftrue,
ram_addr_MUX_uxn_device_h_l200_c8_4bb9_iffalse,
ram_addr_MUX_uxn_device_h_l200_c8_4bb9_return_output);

-- BIN_OP_OR_uxn_device_h_l201_c4_3fcf
BIN_OP_OR_uxn_device_h_l201_c4_3fcf : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l201_c4_3fcf_left,
BIN_OP_OR_uxn_device_h_l201_c4_3fcf_right,
BIN_OP_OR_uxn_device_h_l201_c4_3fcf_return_output);

-- BIN_OP_EQ_uxn_device_h_l204_c11_d6f6
BIN_OP_EQ_uxn_device_h_l204_c11_d6f6 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l204_c11_d6f6_left,
BIN_OP_EQ_uxn_device_h_l204_c11_d6f6_right,
BIN_OP_EQ_uxn_device_h_l204_c11_d6f6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l213_c1_599e
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l213_c1_599e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l213_c1_599e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l213_c1_599e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l213_c1_599e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l213_c1_599e_return_output);

-- result_MUX_uxn_device_h_l204_c7_8d42
result_MUX_uxn_device_h_l204_c7_8d42 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l204_c7_8d42_cond,
result_MUX_uxn_device_h_l204_c7_8d42_iftrue,
result_MUX_uxn_device_h_l204_c7_8d42_iffalse,
result_MUX_uxn_device_h_l204_c7_8d42_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l205_c3_0106
result_is_device_ram_write_MUX_uxn_device_h_l205_c3_0106 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l205_c3_0106_cond,
result_is_device_ram_write_MUX_uxn_device_h_l205_c3_0106_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l205_c3_0106_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l205_c3_0106_return_output);

-- result_u8_value_MUX_uxn_device_h_l205_c3_0106
result_u8_value_MUX_uxn_device_h_l205_c3_0106 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l205_c3_0106_cond,
result_u8_value_MUX_uxn_device_h_l205_c3_0106_iftrue,
result_u8_value_MUX_uxn_device_h_l205_c3_0106_iffalse,
result_u8_value_MUX_uxn_device_h_l205_c3_0106_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l205_c3_0106
result_device_ram_address_MUX_uxn_device_h_l205_c3_0106 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l205_c3_0106_cond,
result_device_ram_address_MUX_uxn_device_h_l205_c3_0106_iftrue,
result_device_ram_address_MUX_uxn_device_h_l205_c3_0106_iffalse,
result_device_ram_address_MUX_uxn_device_h_l205_c3_0106_return_output);

-- BIN_OP_AND_uxn_device_h_l206_c9_4a95
BIN_OP_AND_uxn_device_h_l206_c9_4a95 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l206_c9_4a95_left,
BIN_OP_AND_uxn_device_h_l206_c9_4a95_right,
BIN_OP_AND_uxn_device_h_l206_c9_4a95_return_output);

-- BIN_OP_NEQ_uxn_device_h_l206_c9_aa5c
BIN_OP_NEQ_uxn_device_h_l206_c9_aa5c : entity work.BIN_OP_NEQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_NEQ_uxn_device_h_l206_c9_aa5c_left,
BIN_OP_NEQ_uxn_device_h_l206_c9_aa5c_right,
BIN_OP_NEQ_uxn_device_h_l206_c9_aa5c_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l206_c4_3d77
result_is_device_ram_write_MUX_uxn_device_h_l206_c4_3d77 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l206_c4_3d77_cond,
result_is_device_ram_write_MUX_uxn_device_h_l206_c4_3d77_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l206_c4_3d77_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l206_c4_3d77_return_output);

-- result_u8_value_MUX_uxn_device_h_l206_c4_3d77
result_u8_value_MUX_uxn_device_h_l206_c4_3d77 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l206_c4_3d77_cond,
result_u8_value_MUX_uxn_device_h_l206_c4_3d77_iftrue,
result_u8_value_MUX_uxn_device_h_l206_c4_3d77_iffalse,
result_u8_value_MUX_uxn_device_h_l206_c4_3d77_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l206_c4_3d77
result_device_ram_address_MUX_uxn_device_h_l206_c4_3d77 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l206_c4_3d77_cond,
result_device_ram_address_MUX_uxn_device_h_l206_c4_3d77_iftrue,
result_device_ram_address_MUX_uxn_device_h_l206_c4_3d77_iffalse,
result_device_ram_address_MUX_uxn_device_h_l206_c4_3d77_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c1_213a
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c1_213a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c1_213a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c1_213a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c1_213a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c1_213a_return_output);

-- result_MUX_uxn_device_h_l214_c3_6bd1
result_MUX_uxn_device_h_l214_c3_6bd1 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l214_c3_6bd1_cond,
result_MUX_uxn_device_h_l214_c3_6bd1_iftrue,
result_MUX_uxn_device_h_l214_c3_6bd1_iffalse,
result_MUX_uxn_device_h_l214_c3_6bd1_return_output);

-- BIN_OP_MINUS_uxn_device_h_l215_c58_8bcc
BIN_OP_MINUS_uxn_device_h_l215_c58_8bcc : entity work.BIN_OP_MINUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l215_c58_8bcc_left,
BIN_OP_MINUS_uxn_device_h_l215_c58_8bcc_right,
BIN_OP_MINUS_uxn_device_h_l215_c58_8bcc_return_output);

-- screen_blit_uxn_device_h_l215_c46_64ef
screen_blit_uxn_device_h_l215_c46_64ef : entity work.screen_blit_0CLK_89be7393 port map (
clk,
screen_blit_uxn_device_h_l215_c46_64ef_CLOCK_ENABLE,
screen_blit_uxn_device_h_l215_c46_64ef_phase,
screen_blit_uxn_device_h_l215_c46_64ef_ctrl,
screen_blit_uxn_device_h_l215_c46_64ef_auto_advance,
screen_blit_uxn_device_h_l215_c46_64ef_x,
screen_blit_uxn_device_h_l215_c46_64ef_y,
screen_blit_uxn_device_h_l215_c46_64ef_ram_addr,
screen_blit_uxn_device_h_l215_c46_64ef_previous_ram_read,
screen_blit_uxn_device_h_l215_c46_64ef_return_output);

-- CONST_SL_8_uint16_t_uxn_device_h_l189_l120_l133_DUPLICATE_5d8e
CONST_SL_8_uint16_t_uxn_device_h_l189_l120_l133_DUPLICATE_5d8e : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_device_h_l189_l120_l133_DUPLICATE_5d8e_x,
CONST_SL_8_uint16_t_uxn_device_h_l189_l120_l133_DUPLICATE_5d8e_return_output);

-- BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l153_l140_DUPLICATE_d8fa
BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l153_l140_DUPLICATE_d8fa : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l153_l140_DUPLICATE_d8fa_left,
BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l153_l140_DUPLICATE_d8fa_right,
BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l153_l140_DUPLICATE_d8fa_return_output);

-- CONST_SR_1_uint8_t_uxn_device_h_l194_l206_DUPLICATE_8149
CONST_SR_1_uint8_t_uxn_device_h_l194_l206_DUPLICATE_8149 : entity work.CONST_SR_1_uint8_t_0CLK_de264c78 port map (
CONST_SR_1_uint8_t_uxn_device_h_l194_l206_DUPLICATE_8149_x,
CONST_SR_1_uint8_t_uxn_device_h_l194_l206_DUPLICATE_8149_return_output);



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
 BIN_OP_EQ_uxn_device_h_l88_c6_ed31_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_1756_return_output,
 is_pixel_port_MUX_uxn_device_h_l88_c2_6371_return_output,
 layer_MUX_uxn_device_h_l88_c2_6371_return_output,
 color_MUX_uxn_device_h_l88_c2_6371_return_output,
 ctrl_MUX_uxn_device_h_l88_c2_6371_return_output,
 y_MUX_uxn_device_h_l88_c2_6371_return_output,
 auto_advance_MUX_uxn_device_h_l88_c2_6371_return_output,
 flip_y_MUX_uxn_device_h_l88_c2_6371_return_output,
 ram_addr_MUX_uxn_device_h_l88_c2_6371_return_output,
 ctrl_mode_MUX_uxn_device_h_l88_c2_6371_return_output,
 result_MUX_uxn_device_h_l88_c2_6371_return_output,
 is_drawing_port_MUX_uxn_device_h_l88_c2_6371_return_output,
 x_MUX_uxn_device_h_l88_c2_6371_return_output,
 flip_x_MUX_uxn_device_h_l88_c2_6371_return_output,
 tmp8_MUX_uxn_device_h_l88_c2_6371_return_output,
 is_sprite_port_MUX_uxn_device_h_l88_c2_6371_return_output,
 BIN_OP_EQ_uxn_device_h_l89_c19_e190_return_output,
 MUX_uxn_device_h_l89_c19_dc46_return_output,
 BIN_OP_EQ_uxn_device_h_l90_c20_bdd7_return_output,
 MUX_uxn_device_h_l90_c20_fd90_return_output,
 BIN_OP_OR_uxn_device_h_l91_c21_788d_return_output,
 result_is_deo_done_MUX_uxn_device_h_l94_c3_12f4_return_output,
 result_device_ram_address_MUX_uxn_device_h_l94_c3_12f4_return_output,
 MUX_uxn_device_h_l95_c32_9049_return_output,
 BIN_OP_EQ_uxn_device_h_l101_c11_4ff7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_97b2_return_output,
 layer_MUX_uxn_device_h_l101_c7_1756_return_output,
 color_MUX_uxn_device_h_l101_c7_1756_return_output,
 ctrl_MUX_uxn_device_h_l101_c7_1756_return_output,
 y_MUX_uxn_device_h_l101_c7_1756_return_output,
 auto_advance_MUX_uxn_device_h_l101_c7_1756_return_output,
 flip_y_MUX_uxn_device_h_l101_c7_1756_return_output,
 ram_addr_MUX_uxn_device_h_l101_c7_1756_return_output,
 ctrl_mode_MUX_uxn_device_h_l101_c7_1756_return_output,
 result_MUX_uxn_device_h_l101_c7_1756_return_output,
 x_MUX_uxn_device_h_l101_c7_1756_return_output,
 flip_x_MUX_uxn_device_h_l101_c7_1756_return_output,
 tmp8_MUX_uxn_device_h_l101_c7_1756_return_output,
 result_device_ram_address_MUX_uxn_device_h_l102_c3_5212_return_output,
 BIN_OP_EQ_uxn_device_h_l106_c11_ada2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_c075_return_output,
 layer_MUX_uxn_device_h_l106_c7_97b2_return_output,
 color_MUX_uxn_device_h_l106_c7_97b2_return_output,
 ctrl_MUX_uxn_device_h_l106_c7_97b2_return_output,
 y_MUX_uxn_device_h_l106_c7_97b2_return_output,
 auto_advance_MUX_uxn_device_h_l106_c7_97b2_return_output,
 flip_y_MUX_uxn_device_h_l106_c7_97b2_return_output,
 ram_addr_MUX_uxn_device_h_l106_c7_97b2_return_output,
 ctrl_mode_MUX_uxn_device_h_l106_c7_97b2_return_output,
 result_MUX_uxn_device_h_l106_c7_97b2_return_output,
 x_MUX_uxn_device_h_l106_c7_97b2_return_output,
 flip_x_MUX_uxn_device_h_l106_c7_97b2_return_output,
 tmp8_MUX_uxn_device_h_l106_c7_97b2_return_output,
 layer_MUX_uxn_device_h_l107_c3_47ef_return_output,
 color_MUX_uxn_device_h_l107_c3_47ef_return_output,
 ctrl_MUX_uxn_device_h_l107_c3_47ef_return_output,
 flip_y_MUX_uxn_device_h_l107_c3_47ef_return_output,
 ctrl_mode_MUX_uxn_device_h_l107_c3_47ef_return_output,
 result_device_ram_address_MUX_uxn_device_h_l107_c3_47ef_return_output,
 flip_x_MUX_uxn_device_h_l107_c3_47ef_return_output,
 CONST_SR_7_uxn_device_h_l110_c26_38da_return_output,
 CONST_SR_6_uxn_device_h_l111_c22_e222_return_output,
 CONST_SR_5_uxn_device_h_l112_c23_3397_return_output,
 CONST_SR_4_uxn_device_h_l113_c23_4519_return_output,
 BIN_OP_EQ_uxn_device_h_l117_c11_79df_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_63d6_return_output,
 y_MUX_uxn_device_h_l117_c7_c075_return_output,
 auto_advance_MUX_uxn_device_h_l117_c7_c075_return_output,
 ram_addr_MUX_uxn_device_h_l117_c7_c075_return_output,
 result_MUX_uxn_device_h_l117_c7_c075_return_output,
 x_MUX_uxn_device_h_l117_c7_c075_return_output,
 tmp8_MUX_uxn_device_h_l117_c7_c075_return_output,
 result_device_ram_address_MUX_uxn_device_h_l118_c3_5393_return_output,
 x_MUX_uxn_device_h_l118_c3_5393_return_output,
 BIN_OP_EQ_uxn_device_h_l124_c11_93f9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_7bb6_return_output,
 y_MUX_uxn_device_h_l124_c7_63d6_return_output,
 auto_advance_MUX_uxn_device_h_l124_c7_63d6_return_output,
 ram_addr_MUX_uxn_device_h_l124_c7_63d6_return_output,
 result_MUX_uxn_device_h_l124_c7_63d6_return_output,
 x_MUX_uxn_device_h_l124_c7_63d6_return_output,
 tmp8_MUX_uxn_device_h_l124_c7_63d6_return_output,
 result_device_ram_address_MUX_uxn_device_h_l125_c3_43f8_return_output,
 x_MUX_uxn_device_h_l125_c3_43f8_return_output,
 BIN_OP_OR_uxn_device_h_l126_c4_0212_return_output,
 BIN_OP_EQ_uxn_device_h_l130_c11_db22_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_1fcf_return_output,
 y_MUX_uxn_device_h_l130_c7_7bb6_return_output,
 auto_advance_MUX_uxn_device_h_l130_c7_7bb6_return_output,
 ram_addr_MUX_uxn_device_h_l130_c7_7bb6_return_output,
 result_MUX_uxn_device_h_l130_c7_7bb6_return_output,
 x_MUX_uxn_device_h_l130_c7_7bb6_return_output,
 tmp8_MUX_uxn_device_h_l130_c7_7bb6_return_output,
 y_MUX_uxn_device_h_l131_c3_e626_return_output,
 result_device_ram_address_MUX_uxn_device_h_l131_c3_e626_return_output,
 BIN_OP_EQ_uxn_device_h_l137_c11_ce3c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l157_c7_8256_return_output,
 y_MUX_uxn_device_h_l137_c7_1fcf_return_output,
 auto_advance_MUX_uxn_device_h_l137_c7_1fcf_return_output,
 ram_addr_MUX_uxn_device_h_l137_c7_1fcf_return_output,
 result_MUX_uxn_device_h_l137_c7_1fcf_return_output,
 x_MUX_uxn_device_h_l137_c7_1fcf_return_output,
 tmp8_MUX_uxn_device_h_l137_c7_1fcf_return_output,
 y_MUX_uxn_device_h_l138_c3_3093_return_output,
 result_u8_value_MUX_uxn_device_h_l138_c3_3093_return_output,
 result_device_ram_address_MUX_uxn_device_h_l138_c3_3093_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l138_c3_3093_return_output,
 result_is_vram_write_MUX_uxn_device_h_l138_c3_3093_return_output,
 result_u16_addr_MUX_uxn_device_h_l138_c3_3093_return_output,
 tmp8_MUX_uxn_device_h_l138_c3_3093_return_output,
 BIN_OP_AND_uxn_device_h_l141_c11_e808_return_output,
 BIN_OP_INFERRED_MULT_uxn_device_h_l142_c23_431d_return_output,
 BIN_OP_PLUS_uxn_device_h_l142_c23_d3c0_return_output,
 tmp8_MUX_uxn_device_h_l145_c4_f761_return_output,
 MUX_uxn_device_h_l146_c13_4e7b_return_output,
 BIN_OP_OR_uxn_device_h_l146_c5_36a8_return_output,
 MUX_uxn_device_h_l147_c13_0f55_return_output,
 BIN_OP_OR_uxn_device_h_l147_c5_fb66_return_output,
 y_MUX_uxn_device_h_l152_c8_7000_return_output,
 result_device_ram_address_MUX_uxn_device_h_l152_c8_7000_return_output,
 BIN_OP_EQ_uxn_device_h_l157_c11_7a8b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l179_c7_23a6_return_output,
 auto_advance_MUX_uxn_device_h_l157_c7_8256_return_output,
 ram_addr_MUX_uxn_device_h_l157_c7_8256_return_output,
 result_MUX_uxn_device_h_l157_c7_8256_return_output,
 x_MUX_uxn_device_h_l157_c7_8256_return_output,
 auto_advance_MUX_uxn_device_h_l158_c3_2a1e_return_output,
 result_u8_value_MUX_uxn_device_h_l158_c3_2a1e_return_output,
 result_device_ram_address_MUX_uxn_device_h_l158_c3_2a1e_return_output,
 result_is_deo_done_MUX_uxn_device_h_l158_c3_2a1e_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l158_c3_2a1e_return_output,
 result_is_vram_write_MUX_uxn_device_h_l158_c3_2a1e_return_output,
 result_u16_addr_MUX_uxn_device_h_l158_c3_2a1e_return_output,
 x_MUX_uxn_device_h_l158_c3_2a1e_return_output,
 UNARY_OP_NOT_uxn_device_h_l163_c9_88b8_return_output,
 result_is_deo_done_MUX_uxn_device_h_l163_c4_8d15_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l163_c4_8d15_return_output,
 result_u8_value_MUX_uxn_device_h_l163_c4_8d15_return_output,
 result_device_ram_address_MUX_uxn_device_h_l163_c4_8d15_return_output,
 x_MUX_uxn_device_h_l163_c4_8d15_return_output,
 BIN_OP_AND_uxn_device_h_l164_c9_1a84_return_output,
 BIN_OP_NEQ_uxn_device_h_l164_c9_0470_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l164_c5_ec39_return_output,
 result_u8_value_MUX_uxn_device_h_l164_c5_ec39_return_output,
 result_device_ram_address_MUX_uxn_device_h_l164_c5_ec39_return_output,
 x_MUX_uxn_device_h_l164_c5_ec39_return_output,
 BIN_OP_PLUS_uxn_device_h_l165_c6_3010_return_output,
 CONST_SR_8_uxn_device_h_l168_c34_b539_return_output,
 auto_advance_MUX_uxn_device_h_l174_c8_9300_return_output,
 result_device_ram_address_MUX_uxn_device_h_l174_c8_9300_return_output,
 BIN_OP_EQ_uxn_device_h_l179_c11_3971_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_f8ff_return_output,
 ram_addr_MUX_uxn_device_h_l179_c7_23a6_return_output,
 result_MUX_uxn_device_h_l179_c7_23a6_return_output,
 ram_addr_MUX_uxn_device_h_l180_c3_431f_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l180_c3_431f_return_output,
 result_u8_value_MUX_uxn_device_h_l180_c3_431f_return_output,
 result_device_ram_address_MUX_uxn_device_h_l180_c3_431f_return_output,
 BIN_OP_AND_uxn_device_h_l181_c8_71c3_return_output,
 BIN_OP_NEQ_uxn_device_h_l181_c8_cf7f_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l181_c4_8670_return_output,
 result_u8_value_MUX_uxn_device_h_l181_c4_8670_return_output,
 result_device_ram_address_MUX_uxn_device_h_l181_c4_8670_return_output,
 ram_addr_MUX_uxn_device_h_l187_c8_3a68_return_output,
 BIN_OP_EQ_uxn_device_h_l192_c11_c3ed_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c7_8d42_return_output,
 ram_addr_MUX_uxn_device_h_l192_c7_f8ff_return_output,
 result_MUX_uxn_device_h_l192_c7_f8ff_return_output,
 ram_addr_MUX_uxn_device_h_l193_c3_532b_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l193_c3_532b_return_output,
 result_u8_value_MUX_uxn_device_h_l193_c3_532b_return_output,
 result_device_ram_address_MUX_uxn_device_h_l193_c3_532b_return_output,
 BIN_OP_AND_uxn_device_h_l194_c9_dc22_return_output,
 BIN_OP_NEQ_uxn_device_h_l194_c9_bab2_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l194_c4_1fab_return_output,
 result_u8_value_MUX_uxn_device_h_l194_c4_1fab_return_output,
 result_device_ram_address_MUX_uxn_device_h_l194_c4_1fab_return_output,
 CONST_SR_8_uxn_device_h_l197_c33_0a9c_return_output,
 ram_addr_MUX_uxn_device_h_l200_c8_4bb9_return_output,
 BIN_OP_OR_uxn_device_h_l201_c4_3fcf_return_output,
 BIN_OP_EQ_uxn_device_h_l204_c11_d6f6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l213_c1_599e_return_output,
 result_MUX_uxn_device_h_l204_c7_8d42_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l205_c3_0106_return_output,
 result_u8_value_MUX_uxn_device_h_l205_c3_0106_return_output,
 result_device_ram_address_MUX_uxn_device_h_l205_c3_0106_return_output,
 BIN_OP_AND_uxn_device_h_l206_c9_4a95_return_output,
 BIN_OP_NEQ_uxn_device_h_l206_c9_aa5c_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l206_c4_3d77_return_output,
 result_u8_value_MUX_uxn_device_h_l206_c4_3d77_return_output,
 result_device_ram_address_MUX_uxn_device_h_l206_c4_3d77_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c1_213a_return_output,
 result_MUX_uxn_device_h_l214_c3_6bd1_return_output,
 BIN_OP_MINUS_uxn_device_h_l215_c58_8bcc_return_output,
 screen_blit_uxn_device_h_l215_c46_64ef_return_output,
 CONST_SL_8_uint16_t_uxn_device_h_l189_l120_l133_DUPLICATE_5d8e_return_output,
 BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l153_l140_DUPLICATE_d8fa_return_output,
 CONST_SR_1_uint8_t_uxn_device_h_l194_l206_DUPLICATE_8149_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : device_out_result_t;
 variable VAR_device_port : unsigned(3 downto 0);
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l88_c6_ed31_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l88_c6_ed31_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l88_c6_ed31_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_1756_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_1756_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_1756_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_1756_iffalse : unsigned(0 downto 0);
 variable VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_6371_iftrue : unsigned(0 downto 0);
 variable VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_6371_iffalse : unsigned(0 downto 0);
 variable VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_6371_return_output : unsigned(0 downto 0);
 variable VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_6371_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l88_c2_6371_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l88_c2_6371_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l101_c7_1756_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l88_c2_6371_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l88_c2_6371_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l88_c2_6371_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l88_c2_6371_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l101_c7_1756_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l88_c2_6371_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l88_c2_6371_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l88_c2_6371_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l88_c2_6371_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l101_c7_1756_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l88_c2_6371_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l88_c2_6371_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l88_c2_6371_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l88_c2_6371_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l101_c7_1756_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l88_c2_6371_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l88_c2_6371_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l88_c2_6371_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l88_c2_6371_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l101_c7_1756_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l88_c2_6371_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l88_c2_6371_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l88_c2_6371_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l88_c2_6371_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l101_c7_1756_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l88_c2_6371_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l88_c2_6371_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l88_c2_6371_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l88_c2_6371_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l101_c7_1756_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l88_c2_6371_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l88_c2_6371_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_6371_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_6371_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_1756_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_6371_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_6371_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l88_c2_6371_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_34f0_uxn_device_h_l88_c2_6371_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l88_c2_6371_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l101_c7_1756_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l88_c2_6371_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l88_c2_6371_cond : unsigned(0 downto 0);
 variable VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_6371_iftrue : unsigned(0 downto 0);
 variable VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_6371_iffalse : unsigned(0 downto 0);
 variable VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_6371_return_output : unsigned(0 downto 0);
 variable VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_6371_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l88_c2_6371_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l88_c2_6371_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l101_c7_1756_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l88_c2_6371_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l88_c2_6371_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l88_c2_6371_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l88_c2_6371_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l101_c7_1756_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l88_c2_6371_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l88_c2_6371_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l88_c2_6371_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l88_c2_6371_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l101_c7_1756_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l88_c2_6371_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l88_c2_6371_cond : unsigned(0 downto 0);
 variable VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_6371_iftrue : unsigned(0 downto 0);
 variable VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_6371_iffalse : unsigned(0 downto 0);
 variable VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_6371_return_output : unsigned(0 downto 0);
 variable VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_6371_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l89_c19_dc46_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l89_c19_e190_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l89_c19_e190_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l89_c19_e190_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l89_c19_dc46_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l89_c19_dc46_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l89_c19_dc46_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l90_c20_fd90_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l90_c20_bdd7_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l90_c20_bdd7_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l90_c20_bdd7_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l90_c20_fd90_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l90_c20_fd90_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l90_c20_fd90_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l91_c21_788d_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l91_c21_788d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l91_c21_788d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_12f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_12f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_12f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_12f4_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_12f4_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_12f4_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_12f4_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_12f4_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l95_c32_9049_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l95_c32_9049_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l95_c32_9049_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l95_c32_9049_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l101_c11_4ff7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l101_c11_4ff7_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l101_c11_4ff7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_97b2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_97b2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_97b2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_97b2_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l101_c7_1756_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l101_c7_1756_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l106_c7_97b2_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l101_c7_1756_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l101_c7_1756_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l101_c7_1756_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l106_c7_97b2_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l101_c7_1756_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l101_c7_1756_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l101_c7_1756_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l106_c7_97b2_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l101_c7_1756_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l101_c7_1756_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l101_c7_1756_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l106_c7_97b2_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l101_c7_1756_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l101_c7_1756_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l101_c7_1756_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l106_c7_97b2_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l101_c7_1756_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l101_c7_1756_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l101_c7_1756_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l106_c7_97b2_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l101_c7_1756_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l101_c7_1756_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l101_c7_1756_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l106_c7_97b2_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l101_c7_1756_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_1756_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_1756_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l106_c7_97b2_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_1756_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l101_c7_1756_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l101_c7_1756_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l101_c7_1756_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l106_c7_97b2_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l101_c7_1756_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l101_c7_1756_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l101_c7_1756_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l106_c7_97b2_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l101_c7_1756_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l101_c7_1756_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l101_c7_1756_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l106_c7_97b2_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l101_c7_1756_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l101_c7_1756_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l101_c7_1756_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l106_c7_97b2_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l101_c7_1756_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_5212_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_5212_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_5212_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_5212_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l106_c11_ada2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l106_c11_ada2_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l106_c11_ada2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_c075_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_c075_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_c075_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_c075_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l106_c7_97b2_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l107_c3_47ef_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l106_c7_97b2_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l106_c7_97b2_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l106_c7_97b2_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l107_c3_47ef_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l106_c7_97b2_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l106_c7_97b2_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l106_c7_97b2_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l107_c3_47ef_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l106_c7_97b2_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l106_c7_97b2_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l106_c7_97b2_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l106_c7_97b2_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l117_c7_c075_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l106_c7_97b2_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l106_c7_97b2_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l106_c7_97b2_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l117_c7_c075_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l106_c7_97b2_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l106_c7_97b2_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l107_c3_47ef_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l106_c7_97b2_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l106_c7_97b2_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l106_c7_97b2_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l106_c7_97b2_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l117_c7_c075_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l106_c7_97b2_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l106_c7_97b2_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l107_c3_47ef_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l106_c7_97b2_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l106_c7_97b2_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l106_c7_97b2_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l106_c7_97b2_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l106_c7_97b2_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l117_c7_c075_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l106_c7_97b2_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l106_c7_97b2_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l106_c7_97b2_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l117_c7_c075_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l106_c7_97b2_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l106_c7_97b2_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l107_c3_47ef_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l106_c7_97b2_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l106_c7_97b2_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l106_c7_97b2_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l106_c7_97b2_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l117_c7_c075_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l106_c7_97b2_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l107_c3_47ef_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l107_c3_47ef_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l107_c3_47ef_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l107_c3_47ef_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l107_c3_47ef_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l107_c3_47ef_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l107_c3_47ef_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l107_c3_47ef_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l107_c3_47ef_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l107_c3_47ef_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l107_c3_47ef_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l107_c3_47ef_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l107_c3_47ef_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l107_c3_47ef_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l107_c3_47ef_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l107_c3_47ef_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l107_c3_47ef_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l107_c3_47ef_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l107_c3_47ef_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l107_c3_47ef_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l107_c3_47ef_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l107_c3_47ef_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_device_h_l109_c12_7f69_return_output : unsigned(3 downto 0);
 variable VAR_CONST_SR_7_uxn_device_h_l110_c26_38da_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_7_uxn_device_h_l110_c26_38da_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l110_c16_b71b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_6_uxn_device_h_l111_c22_e222_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_6_uxn_device_h_l111_c22_e222_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l111_c12_2f4d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_5_uxn_device_h_l112_c23_3397_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_5_uxn_device_h_l112_c23_3397_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l112_c13_1eab_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_4_uxn_device_h_l113_c23_4519_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_device_h_l113_c23_4519_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l113_c13_84a2_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l117_c11_79df_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l117_c11_79df_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l117_c11_79df_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_63d6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_63d6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_63d6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_63d6_iffalse : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l117_c7_c075_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l117_c7_c075_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l124_c7_63d6_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l117_c7_c075_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l117_c7_c075_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l117_c7_c075_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l124_c7_63d6_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l117_c7_c075_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l117_c7_c075_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l117_c7_c075_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l124_c7_63d6_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l117_c7_c075_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l117_c7_c075_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l117_c7_c075_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l117_c7_c075_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l124_c7_63d6_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l117_c7_c075_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l117_c7_c075_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l118_c3_5393_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l117_c7_c075_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l124_c7_63d6_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l117_c7_c075_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l117_c7_c075_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l117_c7_c075_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l124_c7_63d6_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l117_c7_c075_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l118_c3_5393_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l118_c3_5393_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l118_c3_5393_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l118_c3_5393_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l118_c3_5393_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l118_c3_5393_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l118_c3_5393_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l124_c11_93f9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l124_c11_93f9_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l124_c11_93f9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_7bb6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_7bb6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_7bb6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_7bb6_iffalse : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l124_c7_63d6_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l124_c7_63d6_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l130_c7_7bb6_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l124_c7_63d6_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l124_c7_63d6_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l124_c7_63d6_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l130_c7_7bb6_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l124_c7_63d6_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l124_c7_63d6_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l124_c7_63d6_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l130_c7_7bb6_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l124_c7_63d6_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l124_c7_63d6_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l124_c7_63d6_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l124_c7_63d6_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l130_c7_7bb6_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l124_c7_63d6_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l124_c7_63d6_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l125_c3_43f8_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l124_c7_63d6_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l130_c7_7bb6_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l124_c7_63d6_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l124_c7_63d6_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l124_c7_63d6_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l130_c7_7bb6_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l124_c7_63d6_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_43f8_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_43f8_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_43f8_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_43f8_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l125_c3_43f8_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l125_c3_43f8_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l125_c3_43f8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l126_c4_0212_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l126_c4_0212_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l126_c4_0212_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l130_c11_db22_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l130_c11_db22_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l130_c11_db22_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_1fcf_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_1fcf_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_1fcf_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_1fcf_iffalse : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l130_c7_7bb6_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l131_c3_e626_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l130_c7_7bb6_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l137_c7_1fcf_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l130_c7_7bb6_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l130_c7_7bb6_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l130_c7_7bb6_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l137_c7_1fcf_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l130_c7_7bb6_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l130_c7_7bb6_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l130_c7_7bb6_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l137_c7_1fcf_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l130_c7_7bb6_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l130_c7_7bb6_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l130_c7_7bb6_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l130_c7_7bb6_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l137_c7_1fcf_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l130_c7_7bb6_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l130_c7_7bb6_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l130_c7_7bb6_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l137_c7_1fcf_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l130_c7_7bb6_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l130_c7_7bb6_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l130_c7_7bb6_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l137_c7_1fcf_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l130_c7_7bb6_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l131_c3_e626_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l131_c3_e626_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l131_c3_e626_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l131_c3_e626_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l131_c3_e626_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l131_c3_e626_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l131_c3_e626_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l137_c11_ce3c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l137_c11_ce3c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l137_c11_ce3c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l157_c7_8256_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l157_c7_8256_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l157_c7_8256_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l157_c7_8256_iffalse : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l137_c7_1fcf_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l138_c3_3093_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l137_c7_1fcf_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l137_c7_1fcf_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l137_c7_1fcf_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l137_c7_1fcf_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l157_c7_8256_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l137_c7_1fcf_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l137_c7_1fcf_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l137_c7_1fcf_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l157_c7_8256_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l137_c7_1fcf_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l137_c7_1fcf_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_8eaa_uxn_device_h_l137_c7_1fcf_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l137_c7_1fcf_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l157_c7_8256_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l137_c7_1fcf_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l137_c7_1fcf_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l137_c7_1fcf_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l157_c7_8256_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l137_c7_1fcf_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l137_c7_1fcf_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l138_c3_3093_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l137_c7_1fcf_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l137_c7_1fcf_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l138_c3_3093_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l138_c3_3093_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l152_c8_7000_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l138_c3_3093_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l138_c3_3093_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l138_c3_3093_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l138_c3_3093_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l138_c3_3093_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l138_c3_3093_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l139_c4_c10c : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l138_c3_3093_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l152_c8_7000_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l138_c3_3093_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l138_c3_3093_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l138_c3_3093_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l138_c3_3093_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l138_c3_3093_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l138_c3_3093_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l138_c3_3093_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l138_c3_3093_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l138_c3_3093_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l138_c3_3093_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l138_c3_3093_cond : unsigned(0 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l138_c3_3093_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_addr_uxn_device_h_l142_c4_d936 : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l138_c3_3093_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l138_c3_3093_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l138_c3_3093_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l138_c3_3093_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l145_c4_f761_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l138_c3_3093_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l138_c3_3093_cond : unsigned(0 downto 0);
 variable VAR_tmp8_uxn_device_h_l141_c4_08bc : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l141_c11_e808_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l141_c11_e808_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l141_c11_e808_return_output : unsigned(3 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l142_c23_431d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l142_c23_431d_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l142_c23_431d_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l142_c23_d3c0_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l142_c23_d3c0_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l142_c23_d3c0_return_output : unsigned(32 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l145_c4_f761_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l145_c4_f761_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l145_c4_f761_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l146_c5_36a8_left : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l146_c13_4e7b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l146_c13_4e7b_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l146_c13_4e7b_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l146_c13_4e7b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l146_c5_36a8_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l146_c5_36a8_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l147_c5_fb66_left : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l147_c13_0f55_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l147_c13_0f55_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l147_c13_0f55_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l147_c13_0f55_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l147_c5_fb66_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l147_c5_fb66_return_output : unsigned(7 downto 0);
 variable VAR_y_MUX_uxn_device_h_l152_c8_7000_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l152_c8_7000_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l152_c8_7000_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l152_c8_7000_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l152_c8_7000_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l152_c8_7000_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l157_c11_7a8b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l157_c11_7a8b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l157_c11_7a8b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l179_c7_23a6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l179_c7_23a6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l179_c7_23a6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l179_c7_23a6_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l157_c7_8256_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l158_c3_2a1e_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l157_c7_8256_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l157_c7_8256_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l157_c7_8256_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l157_c7_8256_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l179_c7_23a6_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l157_c7_8256_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l157_c7_8256_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_df12_uxn_device_h_l157_c7_8256_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l157_c7_8256_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l179_c7_23a6_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l157_c7_8256_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l157_c7_8256_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l158_c3_2a1e_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l157_c7_8256_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l157_c7_8256_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l158_c3_2a1e_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l158_c3_2a1e_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l174_c8_9300_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l158_c3_2a1e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l158_c3_2a1e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l163_c4_8d15_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l158_c3_2a1e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l158_c3_2a1e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l158_c3_2a1e_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l158_c3_2a1e_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l163_c4_8d15_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l158_c3_2a1e_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l174_c8_9300_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l158_c3_2a1e_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l158_c3_2a1e_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l158_c3_2a1e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l163_c4_8d15_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l158_c3_2a1e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l158_c3_2a1e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l158_c3_2a1e_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l158_c3_2a1e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l163_c4_8d15_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l158_c3_2a1e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l158_c3_2a1e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l158_c3_2a1e_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l158_c3_2a1e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l158_c3_2a1e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l158_c3_2a1e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l158_c3_2a1e_cond : unsigned(0 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l158_c3_2a1e_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_addr_uxn_device_h_l161_c4_b6fa : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l158_c3_2a1e_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l158_c3_2a1e_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l158_c3_2a1e_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l158_c3_2a1e_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l163_c4_8d15_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l158_c3_2a1e_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l158_c3_2a1e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_uxn_device_h_l162_c4_28c8 : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_device_h_l163_c9_88b8_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_device_h_l163_c9_88b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l163_c4_8d15_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l163_c4_8d15_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l163_c4_8d15_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l163_c4_8d15_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l164_c5_ec39_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l163_c4_8d15_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l163_c4_8d15_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l163_c4_8d15_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l164_c5_ec39_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l163_c4_8d15_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l163_c4_8d15_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l163_c4_8d15_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l164_c5_ec39_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l163_c4_8d15_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l163_c4_8d15_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l163_c4_8d15_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l164_c5_ec39_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l163_c4_8d15_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l163_c4_8d15_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l164_c9_1a84_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l164_c9_1a84_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l164_c9_1a84_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_device_h_l164_c9_0470_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_device_h_l164_c9_0470_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_device_h_l164_c9_0470_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l164_c5_ec39_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l164_c5_ec39_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l164_c5_ec39_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l164_c5_ec39_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l164_c5_ec39_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l164_c5_ec39_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l164_c5_ec39_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l164_c5_ec39_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l164_c5_ec39_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l164_c5_ec39_iftrue : unsigned(15 downto 0);
 variable VAR_x_uxn_device_h_l165_c6_14d7 : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l164_c5_ec39_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l164_c5_ec39_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l165_c6_3010_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l165_c6_3010_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l165_c6_3010_return_output : unsigned(16 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l168_c34_b539_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l168_c34_b539_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l168_c24_d9aa_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l174_c8_9300_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l174_c8_9300_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l174_c8_9300_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l174_c8_9300_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l174_c8_9300_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l174_c8_9300_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l179_c11_3971_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l179_c11_3971_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l179_c11_3971_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_f8ff_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_f8ff_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_f8ff_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_f8ff_iffalse : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l179_c7_23a6_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l180_c3_431f_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l179_c7_23a6_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l192_c7_f8ff_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l179_c7_23a6_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l179_c7_23a6_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_96e4_uxn_device_h_l179_c7_23a6_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l179_c7_23a6_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l192_c7_f8ff_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l179_c7_23a6_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l180_c3_431f_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l180_c3_431f_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l187_c8_3a68_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l180_c3_431f_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l180_c3_431f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l181_c4_8670_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l180_c3_431f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l180_c3_431f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l180_c3_431f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l180_c3_431f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l181_c4_8670_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l180_c3_431f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l180_c3_431f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l180_c3_431f_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l180_c3_431f_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l181_c4_8670_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l180_c3_431f_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l180_c3_431f_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l180_c3_431f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l181_c8_71c3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l181_c8_71c3_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l181_c8_71c3_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_device_h_l181_c8_cf7f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_device_h_l181_c8_cf7f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_device_h_l181_c8_cf7f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l181_c4_8670_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l181_c4_8670_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l181_c4_8670_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l181_c4_8670_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l181_c4_8670_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l181_c4_8670_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l181_c4_8670_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l181_c4_8670_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l181_c4_8670_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l184_c23_a641_return_output : unsigned(7 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l187_c8_3a68_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l187_c8_3a68_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l187_c8_3a68_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l192_c11_c3ed_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l192_c11_c3ed_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l192_c11_c3ed_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c7_8d42_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c7_8d42_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c7_8d42_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c7_8d42_iffalse : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l192_c7_f8ff_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l193_c3_532b_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l192_c7_f8ff_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l192_c7_f8ff_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l192_c7_f8ff_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_96e4_uxn_device_h_l192_c7_f8ff_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l192_c7_f8ff_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l204_c7_8d42_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l192_c7_f8ff_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l193_c3_532b_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l193_c3_532b_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l200_c8_4bb9_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l193_c3_532b_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c3_532b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l194_c4_1fab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c3_532b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c3_532b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c3_532b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l193_c3_532b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l194_c4_1fab_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l193_c3_532b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l193_c3_532b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l193_c3_532b_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l193_c3_532b_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l194_c4_1fab_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l193_c3_532b_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l193_c3_532b_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l193_c3_532b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l194_c9_dc22_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l194_c9_dc22_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l194_c9_dc22_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_device_h_l194_c9_bab2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_device_h_l194_c9_bab2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_device_h_l194_c9_bab2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l194_c4_1fab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l194_c4_1fab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l194_c4_1fab_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l194_c4_1fab_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l194_c4_1fab_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l194_c4_1fab_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l194_c4_1fab_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l194_c4_1fab_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l194_c4_1fab_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l197_c33_0a9c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l197_c33_0a9c_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l197_c23_f4be_return_output : unsigned(7 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l200_c8_4bb9_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l200_c8_4bb9_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l200_c8_4bb9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l201_c4_3fcf_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l201_c4_3fcf_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l201_c4_3fcf_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l204_c11_d6f6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l204_c11_d6f6_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l204_c11_d6f6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l213_c1_599e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l213_c1_599e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l213_c1_599e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l213_c1_599e_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l204_c7_8d42_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_96e4_uxn_device_h_l204_c7_8d42_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l204_c7_8d42_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l214_c3_6bd1_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l204_c7_8d42_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l205_c3_0106_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l206_c4_3d77_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l205_c3_0106_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l205_c3_0106_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l205_c3_0106_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l205_c3_0106_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l206_c4_3d77_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l205_c3_0106_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l205_c3_0106_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l205_c3_0106_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l205_c3_0106_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l206_c4_3d77_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l205_c3_0106_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l205_c3_0106_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l205_c3_0106_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l206_c9_4a95_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l206_c9_4a95_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l206_c9_4a95_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_device_h_l206_c9_aa5c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_device_h_l206_c9_aa5c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_device_h_l206_c9_aa5c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l206_c4_3d77_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l206_c4_3d77_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l206_c4_3d77_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l206_c4_3d77_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l206_c4_3d77_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l206_c4_3d77_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l206_c4_3d77_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l206_c4_3d77_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l206_c4_3d77_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l209_c23_4cdd_return_output : unsigned(7 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c1_213a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c1_213a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c1_213a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c1_213a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l214_c3_6bd1_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_a3ba_uxn_device_h_l214_c3_6bd1_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l214_c3_6bd1_iffalse : device_out_result_t;
 variable VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_d321_uxn_device_h_l214_c3_6bd1_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l214_c3_6bd1_cond : unsigned(0 downto 0);
 variable VAR_screen_blit_result : screen_blit_result_t;
 variable VAR_screen_blit_uxn_device_h_l215_c46_64ef_phase : unsigned(7 downto 0);
 variable VAR_screen_blit_uxn_device_h_l215_c46_64ef_ctrl : unsigned(7 downto 0);
 variable VAR_screen_blit_uxn_device_h_l215_c46_64ef_auto_advance : unsigned(7 downto 0);
 variable VAR_screen_blit_uxn_device_h_l215_c46_64ef_x : unsigned(15 downto 0);
 variable VAR_screen_blit_uxn_device_h_l215_c46_64ef_y : unsigned(15 downto 0);
 variable VAR_screen_blit_uxn_device_h_l215_c46_64ef_ram_addr : unsigned(15 downto 0);
 variable VAR_screen_blit_uxn_device_h_l215_c46_64ef_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l215_c58_8bcc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l215_c58_8bcc_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l215_c58_8bcc_return_output : unsigned(7 downto 0);
 variable VAR_screen_blit_uxn_device_h_l215_c46_64ef_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_screen_blit_uxn_device_h_l215_c46_64ef_return_output : screen_blit_result_t;
 variable VAR_result_device_ram_address_uxn_device_h_l217_c4_eaa4 : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d_uxn_device_h_l218_c27_1770_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_screen_blit_result_t_u16_addr_d41d_uxn_device_h_l219_c22_803b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_vram_write_layer_d41d_uxn_device_h_l220_c30_c147_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_screen_blit_result_t_u8_value_d41d_uxn_device_h_l221_c22_c130_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l222_c25_594e_return_output : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l225_c4_33b5 : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l180_l131_l118_l193_l164_l194_l152_l206_l102_l125_l107_l205_l174_l94_l163_l181_DUPLICATE_0a45_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l140_l153_l132_l188_l119_l201_l126_DUPLICATE_1417_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_device_h_l189_l120_l133_DUPLICATE_5d8e_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_device_h_l189_l120_l133_DUPLICATE_5d8e_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l153_l140_DUPLICATE_d8fa_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l153_l140_DUPLICATE_d8fa_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l153_l140_DUPLICATE_d8fa_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l180_l193_l194_l206_l138_l205_l158_l181_DUPLICATE_ff57_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l138_l158_DUPLICATE_b083_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_device_h_l138_l158_DUPLICATE_1f4e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l180_l193_l164_l194_l206_l205_l163_l158_l181_DUPLICATE_67dc_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l163_l158_DUPLICATE_0078_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_1_uint8_t_uxn_device_h_l194_l206_DUPLICATE_8149_x : unsigned(7 downto 0);
 variable VAR_CONST_SR_1_uint8_t_uxn_device_h_l194_l206_DUPLICATE_8149_return_output : unsigned(7 downto 0);
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
     VAR_BIN_OP_EQ_uxn_device_h_l204_c11_d6f6_right := to_unsigned(10, 8);
     VAR_BIN_OP_NEQ_uxn_device_h_l206_c9_aa5c_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l192_c11_c3ed_right := to_unsigned(9, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l157_c11_7a8b_right := to_unsigned(7, 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l174_c8_9300_iftrue := to_unsigned(45, 8);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l194_c4_1fab_iftrue := to_unsigned(1, 1);
     VAR_result_device_ram_address_MUX_uxn_device_h_l206_c4_3d77_iftrue := to_unsigned(43, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_1fcf_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_device_h_l164_c9_1a84_right := to_unsigned(1, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l213_c1_599e_iftrue := to_unsigned(0, 1);
     VAR_result_u8_value_uxn_device_h_l162_c4_28c8 := resize(to_unsigned(0, 1), 8);
     VAR_result_u8_value_MUX_uxn_device_h_l163_c4_8d15_iffalse := VAR_result_u8_value_uxn_device_h_l162_c4_28c8;
     VAR_result_u8_value_MUX_uxn_device_h_l164_c5_ec39_iffalse := VAR_result_u8_value_uxn_device_h_l162_c4_28c8;
     VAR_BIN_OP_AND_uxn_device_h_l206_c9_4a95_right := to_unsigned(1, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c1_213a_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_1756_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l101_c11_4ff7_right := to_unsigned(1, 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l164_c5_ec39_iftrue := to_unsigned(40, 8);
     VAR_result_is_deo_done_MUX_uxn_device_h_l163_c4_8d15_iffalse := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l146_c13_4e7b_iftrue := to_unsigned(24, 8);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l206_c4_3d77_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_MINUS_uxn_device_h_l215_c58_8bcc_right := to_unsigned(11, 8);
     VAR_BIN_OP_NEQ_uxn_device_h_l194_c9_bab2_right := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_device_h_l181_c8_71c3_right := to_unsigned(1, 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l152_c8_7000_iftrue := to_unsigned(44, 8);
     VAR_result_device_ram_address_uxn_device_h_l225_c4_33b5 := resize(to_unsigned(0, 1), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l181_c4_8670_iftrue := to_unsigned(41, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_63d6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l89_c19_e190_right := to_unsigned(14, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_97b2_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_43f8_iftrue := to_unsigned(43, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l157_c7_8256_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l106_c11_ada2_right := to_unsigned(2, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_f8ff_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l89_c19_dc46_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l89_c19_dc46_iffalse := to_unsigned(0, 1);
     VAR_result_device_ram_address_MUX_uxn_device_h_l194_c4_1fab_iftrue := to_unsigned(42, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l179_c7_23a6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_NEQ_uxn_device_h_l181_c8_cf7f_right := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_device_h_l165_c6_3010_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l88_c6_ed31_right := to_unsigned(0, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l124_c11_93f9_right := to_unsigned(4, 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l118_c3_5393_iftrue := to_unsigned(42, 8);
     VAR_BIN_OP_AND_uxn_device_h_l141_c11_e808_right := to_unsigned(3, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l137_c11_ce3c_right := to_unsigned(6, 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l131_c3_e626_iftrue := to_unsigned(38, 8);
     VAR_result_device_ram_address_uxn_device_h_l217_c4_eaa4 := resize(to_unsigned(0, 1), 8);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l181_c4_8670_iftrue := to_unsigned(1, 1);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l164_c5_ec39_iftrue := to_unsigned(1, 1);
     VAR_result_is_vram_write_MUX_uxn_device_h_l158_c3_2a1e_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_MUX_uxn_device_h_l107_c3_47ef_iftrue := to_unsigned(41, 8);
     VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_12f4_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l95_c32_9049_iffalse := to_unsigned(47, 8);
     VAR_MUX_uxn_device_h_l90_c20_fd90_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_device_h_l194_c9_dc22_right := to_unsigned(1, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_c075_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l90_c20_bdd7_right := to_unsigned(15, 4);
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l142_c23_431d_right := to_unsigned(260, 16);
     VAR_MUX_uxn_device_h_l90_c20_fd90_iffalse := to_unsigned(0, 1);
     VAR_result_u16_addr_uxn_device_h_l161_c4_b6fa := resize(to_unsigned(0, 1), 16);
     VAR_result_u16_addr_MUX_uxn_device_h_l158_c3_2a1e_iftrue := VAR_result_u16_addr_uxn_device_h_l161_c4_b6fa;
     VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_5212_iftrue := to_unsigned(40, 8);
     VAR_MUX_uxn_device_h_l147_c13_0f55_iffalse := to_unsigned(0, 8);
     VAR_MUX_uxn_device_h_l95_c32_9049_iftrue := to_unsigned(46, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l179_c11_3971_right := to_unsigned(8, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_7bb6_iftrue := to_unsigned(0, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_12f4_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l117_c11_79df_right := to_unsigned(3, 8);
     VAR_result_device_ram_address_uxn_device_h_l139_c4_c10c := resize(to_unsigned(0, 1), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l138_c3_3093_iftrue := VAR_result_device_ram_address_uxn_device_h_l139_c4_c10c;
     VAR_BIN_OP_EQ_uxn_device_h_l130_c11_db22_right := to_unsigned(5, 8);
     VAR_MUX_uxn_device_h_l147_c13_0f55_iftrue := to_unsigned(4, 8);
     VAR_result_is_vram_write_MUX_uxn_device_h_l138_c3_3093_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c7_8d42_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_NEQ_uxn_device_h_l164_c9_0470_right := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l146_c13_4e7b_iffalse := to_unsigned(16, 8);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_1756_iffalse := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_device_h_l181_c8_71c3_left := auto_advance;
     VAR_CONST_SR_1_uint8_t_uxn_device_h_l194_l206_DUPLICATE_8149_x := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l101_c7_1756_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l106_c7_97b2_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l117_c7_c075_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l124_c7_63d6_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l130_c7_7bb6_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l137_c7_1fcf_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l157_c7_8256_iffalse := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l174_c8_9300_iffalse := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l88_c2_6371_iftrue := auto_advance;
     VAR_screen_blit_uxn_device_h_l215_c46_64ef_auto_advance := auto_advance;
     VAR_BIN_OP_AND_uxn_device_h_l141_c11_e808_left := color;
     VAR_color_MUX_uxn_device_h_l101_c7_1756_iftrue := color;
     VAR_color_MUX_uxn_device_h_l106_c7_97b2_iffalse := color;
     VAR_color_MUX_uxn_device_h_l107_c3_47ef_iffalse := color;
     VAR_color_MUX_uxn_device_h_l88_c2_6371_iftrue := color;
     VAR_ctrl_MUX_uxn_device_h_l101_c7_1756_iftrue := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l106_c7_97b2_iffalse := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l107_c3_47ef_iffalse := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l88_c2_6371_iftrue := ctrl;
     VAR_screen_blit_uxn_device_h_l215_c46_64ef_ctrl := ctrl;
     VAR_UNARY_OP_NOT_uxn_device_h_l163_c9_88b8_expr := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_1756_iftrue := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l106_c7_97b2_iffalse := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l107_c3_47ef_iffalse := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_6371_iftrue := ctrl_mode;
     VAR_tmp8_MUX_uxn_device_h_l145_c4_f761_cond := ctrl_mode;
     VAR_BIN_OP_EQ_uxn_device_h_l89_c19_e190_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l90_c20_bdd7_left := VAR_device_port;
     VAR_MUX_uxn_device_h_l146_c13_4e7b_cond := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l101_c7_1756_iftrue := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l106_c7_97b2_iffalse := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l107_c3_47ef_iffalse := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l88_c2_6371_iftrue := flip_x;
     VAR_MUX_uxn_device_h_l147_c13_0f55_cond := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l101_c7_1756_iftrue := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l106_c7_97b2_iffalse := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l107_c3_47ef_iffalse := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l88_c2_6371_iftrue := flip_y;
     VAR_color_MUX_uxn_device_h_l107_c3_47ef_cond := is_drawing_port;
     VAR_ctrl_MUX_uxn_device_h_l107_c3_47ef_cond := is_drawing_port;
     VAR_ctrl_mode_MUX_uxn_device_h_l107_c3_47ef_cond := is_drawing_port;
     VAR_flip_x_MUX_uxn_device_h_l107_c3_47ef_cond := is_drawing_port;
     VAR_flip_y_MUX_uxn_device_h_l107_c3_47ef_cond := is_drawing_port;
     VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_6371_iffalse := is_drawing_port;
     VAR_layer_MUX_uxn_device_h_l107_c3_47ef_cond := is_drawing_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_5212_cond := is_drawing_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l107_c3_47ef_cond := is_drawing_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l118_c3_5393_cond := is_drawing_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_43f8_cond := is_drawing_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l131_c3_e626_cond := is_drawing_port;
     VAR_x_MUX_uxn_device_h_l118_c3_5393_cond := is_drawing_port;
     VAR_x_MUX_uxn_device_h_l125_c3_43f8_cond := is_drawing_port;
     VAR_y_MUX_uxn_device_h_l131_c3_e626_cond := is_drawing_port;
     VAR_auto_advance_MUX_uxn_device_h_l158_c3_2a1e_cond := is_pixel_port;
     VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_6371_iffalse := is_pixel_port;
     VAR_ram_addr_MUX_uxn_device_h_l180_c3_431f_cond := is_pixel_port;
     VAR_ram_addr_MUX_uxn_device_h_l193_c3_532b_cond := is_pixel_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l138_c3_3093_cond := is_pixel_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l158_c3_2a1e_cond := is_pixel_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l180_c3_431f_cond := is_pixel_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l193_c3_532b_cond := is_pixel_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l205_c3_0106_cond := is_pixel_port;
     VAR_result_is_deo_done_MUX_uxn_device_h_l158_c3_2a1e_cond := is_pixel_port;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l158_c3_2a1e_cond := is_pixel_port;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l180_c3_431f_cond := is_pixel_port;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c3_532b_cond := is_pixel_port;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l205_c3_0106_cond := is_pixel_port;
     VAR_result_is_vram_write_MUX_uxn_device_h_l138_c3_3093_cond := is_pixel_port;
     VAR_result_is_vram_write_MUX_uxn_device_h_l158_c3_2a1e_cond := is_pixel_port;
     VAR_result_u16_addr_MUX_uxn_device_h_l138_c3_3093_cond := is_pixel_port;
     VAR_result_u16_addr_MUX_uxn_device_h_l158_c3_2a1e_cond := is_pixel_port;
     VAR_result_u8_value_MUX_uxn_device_h_l138_c3_3093_cond := is_pixel_port;
     VAR_result_u8_value_MUX_uxn_device_h_l158_c3_2a1e_cond := is_pixel_port;
     VAR_result_u8_value_MUX_uxn_device_h_l180_c3_431f_cond := is_pixel_port;
     VAR_result_u8_value_MUX_uxn_device_h_l193_c3_532b_cond := is_pixel_port;
     VAR_result_u8_value_MUX_uxn_device_h_l205_c3_0106_cond := is_pixel_port;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l138_c3_3093_cond := is_pixel_port;
     VAR_tmp8_MUX_uxn_device_h_l138_c3_3093_cond := is_pixel_port;
     VAR_x_MUX_uxn_device_h_l158_c3_2a1e_cond := is_pixel_port;
     VAR_y_MUX_uxn_device_h_l138_c3_3093_cond := is_pixel_port;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c1_213a_cond := is_sprite_port;
     VAR_auto_advance_MUX_uxn_device_h_l174_c8_9300_cond := is_sprite_port;
     VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_6371_iffalse := is_sprite_port;
     VAR_ram_addr_MUX_uxn_device_h_l187_c8_3a68_cond := is_sprite_port;
     VAR_ram_addr_MUX_uxn_device_h_l200_c8_4bb9_cond := is_sprite_port;
     VAR_result_MUX_uxn_device_h_l214_c3_6bd1_cond := is_sprite_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l152_c8_7000_cond := is_sprite_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l174_c8_9300_cond := is_sprite_port;
     VAR_y_MUX_uxn_device_h_l152_c8_7000_cond := is_sprite_port;
     VAR_layer_MUX_uxn_device_h_l101_c7_1756_iftrue := layer;
     VAR_layer_MUX_uxn_device_h_l106_c7_97b2_iffalse := layer;
     VAR_layer_MUX_uxn_device_h_l107_c3_47ef_iffalse := layer;
     VAR_layer_MUX_uxn_device_h_l88_c2_6371_iftrue := layer;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l138_c3_3093_iftrue := layer;
     VAR_BIN_OP_EQ_uxn_device_h_l101_c11_4ff7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l106_c11_ada2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l117_c11_79df_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l124_c11_93f9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l130_c11_db22_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l137_c11_ce3c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l157_c11_7a8b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l179_c11_3971_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l192_c11_c3ed_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l204_c11_d6f6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l88_c6_ed31_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_device_h_l215_c58_8bcc_left := VAR_phase;
     VAR_BIN_OP_AND_uxn_device_h_l164_c9_1a84_left := VAR_previous_device_ram_read;
     VAR_CONST_SR_4_uxn_device_h_l113_c23_4519_x := VAR_previous_device_ram_read;
     VAR_CONST_SR_5_uxn_device_h_l112_c23_3397_x := VAR_previous_device_ram_read;
     VAR_CONST_SR_6_uxn_device_h_l111_c22_e222_x := VAR_previous_device_ram_read;
     VAR_CONST_SR_7_uxn_device_h_l110_c26_38da_x := VAR_previous_device_ram_read;
     VAR_auto_advance_MUX_uxn_device_h_l158_c3_2a1e_iftrue := VAR_previous_device_ram_read;
     VAR_auto_advance_MUX_uxn_device_h_l174_c8_9300_iftrue := VAR_previous_device_ram_read;
     VAR_ctrl_MUX_uxn_device_h_l107_c3_47ef_iftrue := VAR_previous_device_ram_read;
     VAR_screen_blit_uxn_device_h_l215_c46_64ef_previous_ram_read := VAR_previous_ram_read;
     VAR_BIN_OP_OR_uxn_device_h_l201_c4_3fcf_left := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l101_c7_1756_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l106_c7_97b2_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l117_c7_c075_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l124_c7_63d6_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l130_c7_7bb6_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l137_c7_1fcf_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l157_c7_8256_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l180_c3_431f_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l187_c8_3a68_iffalse := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l192_c7_f8ff_iffalse := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l193_c3_532b_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l200_c8_4bb9_iffalse := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l88_c2_6371_iftrue := ram_addr;
     VAR_screen_blit_uxn_device_h_l215_c46_64ef_ram_addr := ram_addr;
     VAR_tmp8_MUX_uxn_device_h_l101_c7_1756_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l106_c7_97b2_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l117_c7_c075_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l124_c7_63d6_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l130_c7_7bb6_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l137_c7_1fcf_iffalse := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l138_c3_3093_iffalse := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l88_c2_6371_iftrue := tmp8;
     VAR_BIN_OP_OR_uxn_device_h_l126_c4_0212_left := x;
     VAR_BIN_OP_PLUS_uxn_device_h_l142_c23_d3c0_right := x;
     VAR_BIN_OP_PLUS_uxn_device_h_l165_c6_3010_left := x;
     VAR_screen_blit_uxn_device_h_l215_c46_64ef_x := x;
     VAR_x_MUX_uxn_device_h_l101_c7_1756_iftrue := x;
     VAR_x_MUX_uxn_device_h_l106_c7_97b2_iftrue := x;
     VAR_x_MUX_uxn_device_h_l118_c3_5393_iffalse := x;
     VAR_x_MUX_uxn_device_h_l125_c3_43f8_iffalse := x;
     VAR_x_MUX_uxn_device_h_l130_c7_7bb6_iftrue := x;
     VAR_x_MUX_uxn_device_h_l137_c7_1fcf_iftrue := x;
     VAR_x_MUX_uxn_device_h_l157_c7_8256_iffalse := x;
     VAR_x_MUX_uxn_device_h_l158_c3_2a1e_iffalse := x;
     VAR_x_MUX_uxn_device_h_l163_c4_8d15_iffalse := x;
     VAR_x_MUX_uxn_device_h_l164_c5_ec39_iffalse := x;
     VAR_x_MUX_uxn_device_h_l88_c2_6371_iftrue := x;
     VAR_BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l153_l140_DUPLICATE_d8fa_left := y;
     VAR_CONST_SR_8_uxn_device_h_l197_c33_0a9c_x := y;
     VAR_screen_blit_uxn_device_h_l215_c46_64ef_y := y;
     VAR_y_MUX_uxn_device_h_l101_c7_1756_iftrue := y;
     VAR_y_MUX_uxn_device_h_l106_c7_97b2_iftrue := y;
     VAR_y_MUX_uxn_device_h_l117_c7_c075_iftrue := y;
     VAR_y_MUX_uxn_device_h_l124_c7_63d6_iftrue := y;
     VAR_y_MUX_uxn_device_h_l131_c3_e626_iffalse := y;
     VAR_y_MUX_uxn_device_h_l137_c7_1fcf_iffalse := y;
     VAR_y_MUX_uxn_device_h_l152_c8_7000_iffalse := y;
     VAR_y_MUX_uxn_device_h_l88_c2_6371_iftrue := y;
     -- BIN_OP_EQ[uxn_device_h_l130_c11_db22] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l130_c11_db22_left <= VAR_BIN_OP_EQ_uxn_device_h_l130_c11_db22_left;
     BIN_OP_EQ_uxn_device_h_l130_c11_db22_right <= VAR_BIN_OP_EQ_uxn_device_h_l130_c11_db22_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l130_c11_db22_return_output := BIN_OP_EQ_uxn_device_h_l130_c11_db22_return_output;

     -- CONST_SR_8[uxn_device_h_l197_c33_0a9c] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_device_h_l197_c33_0a9c_x <= VAR_CONST_SR_8_uxn_device_h_l197_c33_0a9c_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_device_h_l197_c33_0a9c_return_output := CONST_SR_8_uxn_device_h_l197_c33_0a9c_return_output;

     -- BIN_OP_EQ[uxn_device_h_l179_c11_3971] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l179_c11_3971_left <= VAR_BIN_OP_EQ_uxn_device_h_l179_c11_3971_left;
     BIN_OP_EQ_uxn_device_h_l179_c11_3971_right <= VAR_BIN_OP_EQ_uxn_device_h_l179_c11_3971_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l179_c11_3971_return_output := BIN_OP_EQ_uxn_device_h_l179_c11_3971_return_output;

     -- auto_advance_MUX[uxn_device_h_l174_c8_9300] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l174_c8_9300_cond <= VAR_auto_advance_MUX_uxn_device_h_l174_c8_9300_cond;
     auto_advance_MUX_uxn_device_h_l174_c8_9300_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l174_c8_9300_iftrue;
     auto_advance_MUX_uxn_device_h_l174_c8_9300_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l174_c8_9300_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l174_c8_9300_return_output := auto_advance_MUX_uxn_device_h_l174_c8_9300_return_output;

     -- CONST_SR_4[uxn_device_h_l113_c23_4519] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_device_h_l113_c23_4519_x <= VAR_CONST_SR_4_uxn_device_h_l113_c23_4519_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_device_h_l113_c23_4519_return_output := CONST_SR_4_uxn_device_h_l113_c23_4519_return_output;

     -- MUX[uxn_device_h_l147_c13_0f55] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l147_c13_0f55_cond <= VAR_MUX_uxn_device_h_l147_c13_0f55_cond;
     MUX_uxn_device_h_l147_c13_0f55_iftrue <= VAR_MUX_uxn_device_h_l147_c13_0f55_iftrue;
     MUX_uxn_device_h_l147_c13_0f55_iffalse <= VAR_MUX_uxn_device_h_l147_c13_0f55_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l147_c13_0f55_return_output := MUX_uxn_device_h_l147_c13_0f55_return_output;

     -- BIN_OP_AND[uxn_device_h_l181_c8_71c3] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l181_c8_71c3_left <= VAR_BIN_OP_AND_uxn_device_h_l181_c8_71c3_left;
     BIN_OP_AND_uxn_device_h_l181_c8_71c3_right <= VAR_BIN_OP_AND_uxn_device_h_l181_c8_71c3_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l181_c8_71c3_return_output := BIN_OP_AND_uxn_device_h_l181_c8_71c3_return_output;

     -- BIN_OP_EQ[uxn_device_h_l117_c11_79df] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l117_c11_79df_left <= VAR_BIN_OP_EQ_uxn_device_h_l117_c11_79df_left;
     BIN_OP_EQ_uxn_device_h_l117_c11_79df_right <= VAR_BIN_OP_EQ_uxn_device_h_l117_c11_79df_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l117_c11_79df_return_output := BIN_OP_EQ_uxn_device_h_l117_c11_79df_return_output;

     -- result_vram_write_layer_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d[uxn_device_h_l138_c3_3093] LATENCY=0
     VAR_result_vram_write_layer_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l138_c3_3093_return_output := result.vram_write_layer;

     -- CAST_TO_uint4_t[uxn_device_h_l109_c12_7f69] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_device_h_l109_c12_7f69_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_previous_device_ram_read);

     -- UNARY_OP_NOT[uxn_device_h_l163_c9_88b8] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_device_h_l163_c9_88b8_expr <= VAR_UNARY_OP_NOT_uxn_device_h_l163_c9_88b8_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_device_h_l163_c9_88b8_return_output := UNARY_OP_NOT_uxn_device_h_l163_c9_88b8_return_output;

     -- BIN_OP_MINUS[uxn_device_h_l215_c58_8bcc] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l215_c58_8bcc_left <= VAR_BIN_OP_MINUS_uxn_device_h_l215_c58_8bcc_left;
     BIN_OP_MINUS_uxn_device_h_l215_c58_8bcc_right <= VAR_BIN_OP_MINUS_uxn_device_h_l215_c58_8bcc_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l215_c58_8bcc_return_output := BIN_OP_MINUS_uxn_device_h_l215_c58_8bcc_return_output;

     -- CONST_SR_6[uxn_device_h_l111_c22_e222] LATENCY=0
     -- Inputs
     CONST_SR_6_uxn_device_h_l111_c22_e222_x <= VAR_CONST_SR_6_uxn_device_h_l111_c22_e222_x;
     -- Outputs
     VAR_CONST_SR_6_uxn_device_h_l111_c22_e222_return_output := CONST_SR_6_uxn_device_h_l111_c22_e222_return_output;

     -- MUX[uxn_device_h_l146_c13_4e7b] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l146_c13_4e7b_cond <= VAR_MUX_uxn_device_h_l146_c13_4e7b_cond;
     MUX_uxn_device_h_l146_c13_4e7b_iftrue <= VAR_MUX_uxn_device_h_l146_c13_4e7b_iftrue;
     MUX_uxn_device_h_l146_c13_4e7b_iffalse <= VAR_MUX_uxn_device_h_l146_c13_4e7b_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l146_c13_4e7b_return_output := MUX_uxn_device_h_l146_c13_4e7b_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_device_h_l140_l153_l132_l188_l119_l201_l126_DUPLICATE_1417 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l140_l153_l132_l188_l119_l201_l126_DUPLICATE_1417_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_device_ram_read);

     -- BIN_OP_PLUS[uxn_device_h_l165_c6_3010] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l165_c6_3010_left <= VAR_BIN_OP_PLUS_uxn_device_h_l165_c6_3010_left;
     BIN_OP_PLUS_uxn_device_h_l165_c6_3010_right <= VAR_BIN_OP_PLUS_uxn_device_h_l165_c6_3010_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l165_c6_3010_return_output := BIN_OP_PLUS_uxn_device_h_l165_c6_3010_return_output;

     -- BIN_OP_EQ[uxn_device_h_l124_c11_93f9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l124_c11_93f9_left <= VAR_BIN_OP_EQ_uxn_device_h_l124_c11_93f9_left;
     BIN_OP_EQ_uxn_device_h_l124_c11_93f9_right <= VAR_BIN_OP_EQ_uxn_device_h_l124_c11_93f9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l124_c11_93f9_return_output := BIN_OP_EQ_uxn_device_h_l124_c11_93f9_return_output;

     -- BIN_OP_AND[uxn_device_h_l141_c11_e808] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l141_c11_e808_left <= VAR_BIN_OP_AND_uxn_device_h_l141_c11_e808_left;
     BIN_OP_AND_uxn_device_h_l141_c11_e808_right <= VAR_BIN_OP_AND_uxn_device_h_l141_c11_e808_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l141_c11_e808_return_output := BIN_OP_AND_uxn_device_h_l141_c11_e808_return_output;

     -- BIN_OP_EQ[uxn_device_h_l192_c11_c3ed] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l192_c11_c3ed_left <= VAR_BIN_OP_EQ_uxn_device_h_l192_c11_c3ed_left;
     BIN_OP_EQ_uxn_device_h_l192_c11_c3ed_right <= VAR_BIN_OP_EQ_uxn_device_h_l192_c11_c3ed_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l192_c11_c3ed_return_output := BIN_OP_EQ_uxn_device_h_l192_c11_c3ed_return_output;

     -- CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l180_l193_l194_l206_l138_l205_l158_l181_DUPLICATE_ff57 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l180_l193_l194_l206_l138_l205_l158_l181_DUPLICATE_ff57_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_device_h_l157_c11_7a8b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l157_c11_7a8b_left <= VAR_BIN_OP_EQ_uxn_device_h_l157_c11_7a8b_left;
     BIN_OP_EQ_uxn_device_h_l157_c11_7a8b_right <= VAR_BIN_OP_EQ_uxn_device_h_l157_c11_7a8b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l157_c11_7a8b_return_output := BIN_OP_EQ_uxn_device_h_l157_c11_7a8b_return_output;

     -- BIN_OP_EQ[uxn_device_h_l106_c11_ada2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l106_c11_ada2_left <= VAR_BIN_OP_EQ_uxn_device_h_l106_c11_ada2_left;
     BIN_OP_EQ_uxn_device_h_l106_c11_ada2_right <= VAR_BIN_OP_EQ_uxn_device_h_l106_c11_ada2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l106_c11_ada2_return_output := BIN_OP_EQ_uxn_device_h_l106_c11_ada2_return_output;

     -- CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_device_h_l138_l158_DUPLICATE_1f4e LATENCY=0
     VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_device_h_l138_l158_DUPLICATE_1f4e_return_output := result.u16_addr;

     -- CAST_TO_uint8_t[uxn_device_h_l209_c23_4cdd] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l209_c23_4cdd_return_output := CAST_TO_uint8_t_uint16_t(
     y);

     -- CAST_TO_uint8_t[uxn_device_h_l184_c23_a641] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l184_c23_a641_return_output := CAST_TO_uint8_t_uint16_t(
     x);

     -- CONST_SR_1_uint8_t_uxn_device_h_l194_l206_DUPLICATE_8149 LATENCY=0
     -- Inputs
     CONST_SR_1_uint8_t_uxn_device_h_l194_l206_DUPLICATE_8149_x <= VAR_CONST_SR_1_uint8_t_uxn_device_h_l194_l206_DUPLICATE_8149_x;
     -- Outputs
     VAR_CONST_SR_1_uint8_t_uxn_device_h_l194_l206_DUPLICATE_8149_return_output := CONST_SR_1_uint8_t_uxn_device_h_l194_l206_DUPLICATE_8149_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l138_l158_DUPLICATE_b083 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l138_l158_DUPLICATE_b083_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_device_h_l90_c20_bdd7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l90_c20_bdd7_left <= VAR_BIN_OP_EQ_uxn_device_h_l90_c20_bdd7_left;
     BIN_OP_EQ_uxn_device_h_l90_c20_bdd7_right <= VAR_BIN_OP_EQ_uxn_device_h_l90_c20_bdd7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l90_c20_bdd7_return_output := BIN_OP_EQ_uxn_device_h_l90_c20_bdd7_return_output;

     -- CONST_SR_5[uxn_device_h_l112_c23_3397] LATENCY=0
     -- Inputs
     CONST_SR_5_uxn_device_h_l112_c23_3397_x <= VAR_CONST_SR_5_uxn_device_h_l112_c23_3397_x;
     -- Outputs
     VAR_CONST_SR_5_uxn_device_h_l112_c23_3397_return_output := CONST_SR_5_uxn_device_h_l112_c23_3397_return_output;

     -- BIN_OP_EQ[uxn_device_h_l89_c19_e190] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l89_c19_e190_left <= VAR_BIN_OP_EQ_uxn_device_h_l89_c19_e190_left;
     BIN_OP_EQ_uxn_device_h_l89_c19_e190_right <= VAR_BIN_OP_EQ_uxn_device_h_l89_c19_e190_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l89_c19_e190_return_output := BIN_OP_EQ_uxn_device_h_l89_c19_e190_return_output;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l180_l131_l118_l193_l164_l194_l152_l206_l102_l125_l107_l205_l174_l94_l163_l181_DUPLICATE_0a45 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l180_l131_l118_l193_l164_l194_l152_l206_l102_l125_l107_l205_l174_l94_l163_l181_DUPLICATE_0a45_return_output := result.device_ram_address;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l163_l158_DUPLICATE_0078 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l163_l158_DUPLICATE_0078_return_output := result.is_deo_done;

     -- BIN_OP_EQ[uxn_device_h_l137_c11_ce3c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l137_c11_ce3c_left <= VAR_BIN_OP_EQ_uxn_device_h_l137_c11_ce3c_left;
     BIN_OP_EQ_uxn_device_h_l137_c11_ce3c_right <= VAR_BIN_OP_EQ_uxn_device_h_l137_c11_ce3c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l137_c11_ce3c_return_output := BIN_OP_EQ_uxn_device_h_l137_c11_ce3c_return_output;

     -- BIN_OP_EQ[uxn_device_h_l101_c11_4ff7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l101_c11_4ff7_left <= VAR_BIN_OP_EQ_uxn_device_h_l101_c11_4ff7_left;
     BIN_OP_EQ_uxn_device_h_l101_c11_4ff7_right <= VAR_BIN_OP_EQ_uxn_device_h_l101_c11_4ff7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l101_c11_4ff7_return_output := BIN_OP_EQ_uxn_device_h_l101_c11_4ff7_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l180_l193_l164_l194_l206_l205_l163_l158_l181_DUPLICATE_67dc LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l180_l193_l164_l194_l206_l205_l163_l158_l181_DUPLICATE_67dc_return_output := result.is_device_ram_write;

     -- ctrl_MUX[uxn_device_h_l107_c3_47ef] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l107_c3_47ef_cond <= VAR_ctrl_MUX_uxn_device_h_l107_c3_47ef_cond;
     ctrl_MUX_uxn_device_h_l107_c3_47ef_iftrue <= VAR_ctrl_MUX_uxn_device_h_l107_c3_47ef_iftrue;
     ctrl_MUX_uxn_device_h_l107_c3_47ef_iffalse <= VAR_ctrl_MUX_uxn_device_h_l107_c3_47ef_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l107_c3_47ef_return_output := ctrl_MUX_uxn_device_h_l107_c3_47ef_return_output;

     -- result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_d321[uxn_device_h_l214_c3_6bd1] LATENCY=0
     VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_d321_uxn_device_h_l214_c3_6bd1_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_d321(
     result,
     to_unsigned(0, 1),
     VAR_result_device_ram_address_uxn_device_h_l225_c4_33b5,
     to_unsigned(1, 1));

     -- BIN_OP_EQ[uxn_device_h_l88_c6_ed31] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l88_c6_ed31_left <= VAR_BIN_OP_EQ_uxn_device_h_l88_c6_ed31_left;
     BIN_OP_EQ_uxn_device_h_l88_c6_ed31_right <= VAR_BIN_OP_EQ_uxn_device_h_l88_c6_ed31_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l88_c6_ed31_return_output := BIN_OP_EQ_uxn_device_h_l88_c6_ed31_return_output;

     -- BIN_OP_AND[uxn_device_h_l164_c9_1a84] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l164_c9_1a84_left <= VAR_BIN_OP_AND_uxn_device_h_l164_c9_1a84_left;
     BIN_OP_AND_uxn_device_h_l164_c9_1a84_right <= VAR_BIN_OP_AND_uxn_device_h_l164_c9_1a84_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l164_c9_1a84_return_output := BIN_OP_AND_uxn_device_h_l164_c9_1a84_return_output;

     -- CONST_SR_7[uxn_device_h_l110_c26_38da] LATENCY=0
     -- Inputs
     CONST_SR_7_uxn_device_h_l110_c26_38da_x <= VAR_CONST_SR_7_uxn_device_h_l110_c26_38da_x;
     -- Outputs
     VAR_CONST_SR_7_uxn_device_h_l110_c26_38da_return_output := CONST_SR_7_uxn_device_h_l110_c26_38da_return_output;

     -- BIN_OP_EQ[uxn_device_h_l204_c11_d6f6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l204_c11_d6f6_left <= VAR_BIN_OP_EQ_uxn_device_h_l204_c11_d6f6_left;
     BIN_OP_EQ_uxn_device_h_l204_c11_d6f6_right <= VAR_BIN_OP_EQ_uxn_device_h_l204_c11_d6f6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l204_c11_d6f6_return_output := BIN_OP_EQ_uxn_device_h_l204_c11_d6f6_return_output;

     -- Submodule level 1
     VAR_tmp8_uxn_device_h_l141_c4_08bc := resize(VAR_BIN_OP_AND_uxn_device_h_l141_c11_e808_return_output, 8);
     VAR_BIN_OP_NEQ_uxn_device_h_l164_c9_0470_left := VAR_BIN_OP_AND_uxn_device_h_l164_c9_1a84_return_output;
     VAR_BIN_OP_NEQ_uxn_device_h_l181_c8_cf7f_left := VAR_BIN_OP_AND_uxn_device_h_l181_c8_71c3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_97b2_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_4ff7_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l101_c7_1756_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_4ff7_return_output;
     VAR_color_MUX_uxn_device_h_l101_c7_1756_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_4ff7_return_output;
     VAR_ctrl_MUX_uxn_device_h_l101_c7_1756_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_4ff7_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_1756_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_4ff7_return_output;
     VAR_flip_x_MUX_uxn_device_h_l101_c7_1756_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_4ff7_return_output;
     VAR_flip_y_MUX_uxn_device_h_l101_c7_1756_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_4ff7_return_output;
     VAR_layer_MUX_uxn_device_h_l101_c7_1756_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_4ff7_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l101_c7_1756_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_4ff7_return_output;
     VAR_result_MUX_uxn_device_h_l101_c7_1756_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_4ff7_return_output;
     VAR_tmp8_MUX_uxn_device_h_l101_c7_1756_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_4ff7_return_output;
     VAR_x_MUX_uxn_device_h_l101_c7_1756_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_4ff7_return_output;
     VAR_y_MUX_uxn_device_h_l101_c7_1756_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_4ff7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_c075_cond := VAR_BIN_OP_EQ_uxn_device_h_l106_c11_ada2_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l106_c7_97b2_cond := VAR_BIN_OP_EQ_uxn_device_h_l106_c11_ada2_return_output;
     VAR_color_MUX_uxn_device_h_l106_c7_97b2_cond := VAR_BIN_OP_EQ_uxn_device_h_l106_c11_ada2_return_output;
     VAR_ctrl_MUX_uxn_device_h_l106_c7_97b2_cond := VAR_BIN_OP_EQ_uxn_device_h_l106_c11_ada2_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l106_c7_97b2_cond := VAR_BIN_OP_EQ_uxn_device_h_l106_c11_ada2_return_output;
     VAR_flip_x_MUX_uxn_device_h_l106_c7_97b2_cond := VAR_BIN_OP_EQ_uxn_device_h_l106_c11_ada2_return_output;
     VAR_flip_y_MUX_uxn_device_h_l106_c7_97b2_cond := VAR_BIN_OP_EQ_uxn_device_h_l106_c11_ada2_return_output;
     VAR_layer_MUX_uxn_device_h_l106_c7_97b2_cond := VAR_BIN_OP_EQ_uxn_device_h_l106_c11_ada2_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l106_c7_97b2_cond := VAR_BIN_OP_EQ_uxn_device_h_l106_c11_ada2_return_output;
     VAR_result_MUX_uxn_device_h_l106_c7_97b2_cond := VAR_BIN_OP_EQ_uxn_device_h_l106_c11_ada2_return_output;
     VAR_tmp8_MUX_uxn_device_h_l106_c7_97b2_cond := VAR_BIN_OP_EQ_uxn_device_h_l106_c11_ada2_return_output;
     VAR_x_MUX_uxn_device_h_l106_c7_97b2_cond := VAR_BIN_OP_EQ_uxn_device_h_l106_c11_ada2_return_output;
     VAR_y_MUX_uxn_device_h_l106_c7_97b2_cond := VAR_BIN_OP_EQ_uxn_device_h_l106_c11_ada2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_63d6_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c11_79df_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l117_c7_c075_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c11_79df_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l117_c7_c075_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c11_79df_return_output;
     VAR_result_MUX_uxn_device_h_l117_c7_c075_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c11_79df_return_output;
     VAR_tmp8_MUX_uxn_device_h_l117_c7_c075_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c11_79df_return_output;
     VAR_x_MUX_uxn_device_h_l117_c7_c075_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c11_79df_return_output;
     VAR_y_MUX_uxn_device_h_l117_c7_c075_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c11_79df_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_7bb6_cond := VAR_BIN_OP_EQ_uxn_device_h_l124_c11_93f9_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l124_c7_63d6_cond := VAR_BIN_OP_EQ_uxn_device_h_l124_c11_93f9_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l124_c7_63d6_cond := VAR_BIN_OP_EQ_uxn_device_h_l124_c11_93f9_return_output;
     VAR_result_MUX_uxn_device_h_l124_c7_63d6_cond := VAR_BIN_OP_EQ_uxn_device_h_l124_c11_93f9_return_output;
     VAR_tmp8_MUX_uxn_device_h_l124_c7_63d6_cond := VAR_BIN_OP_EQ_uxn_device_h_l124_c11_93f9_return_output;
     VAR_x_MUX_uxn_device_h_l124_c7_63d6_cond := VAR_BIN_OP_EQ_uxn_device_h_l124_c11_93f9_return_output;
     VAR_y_MUX_uxn_device_h_l124_c7_63d6_cond := VAR_BIN_OP_EQ_uxn_device_h_l124_c11_93f9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_1fcf_cond := VAR_BIN_OP_EQ_uxn_device_h_l130_c11_db22_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l130_c7_7bb6_cond := VAR_BIN_OP_EQ_uxn_device_h_l130_c11_db22_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l130_c7_7bb6_cond := VAR_BIN_OP_EQ_uxn_device_h_l130_c11_db22_return_output;
     VAR_result_MUX_uxn_device_h_l130_c7_7bb6_cond := VAR_BIN_OP_EQ_uxn_device_h_l130_c11_db22_return_output;
     VAR_tmp8_MUX_uxn_device_h_l130_c7_7bb6_cond := VAR_BIN_OP_EQ_uxn_device_h_l130_c11_db22_return_output;
     VAR_x_MUX_uxn_device_h_l130_c7_7bb6_cond := VAR_BIN_OP_EQ_uxn_device_h_l130_c11_db22_return_output;
     VAR_y_MUX_uxn_device_h_l130_c7_7bb6_cond := VAR_BIN_OP_EQ_uxn_device_h_l130_c11_db22_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l157_c7_8256_cond := VAR_BIN_OP_EQ_uxn_device_h_l137_c11_ce3c_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l137_c7_1fcf_cond := VAR_BIN_OP_EQ_uxn_device_h_l137_c11_ce3c_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l137_c7_1fcf_cond := VAR_BIN_OP_EQ_uxn_device_h_l137_c11_ce3c_return_output;
     VAR_result_MUX_uxn_device_h_l137_c7_1fcf_cond := VAR_BIN_OP_EQ_uxn_device_h_l137_c11_ce3c_return_output;
     VAR_tmp8_MUX_uxn_device_h_l137_c7_1fcf_cond := VAR_BIN_OP_EQ_uxn_device_h_l137_c11_ce3c_return_output;
     VAR_x_MUX_uxn_device_h_l137_c7_1fcf_cond := VAR_BIN_OP_EQ_uxn_device_h_l137_c11_ce3c_return_output;
     VAR_y_MUX_uxn_device_h_l137_c7_1fcf_cond := VAR_BIN_OP_EQ_uxn_device_h_l137_c11_ce3c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l179_c7_23a6_cond := VAR_BIN_OP_EQ_uxn_device_h_l157_c11_7a8b_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l157_c7_8256_cond := VAR_BIN_OP_EQ_uxn_device_h_l157_c11_7a8b_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l157_c7_8256_cond := VAR_BIN_OP_EQ_uxn_device_h_l157_c11_7a8b_return_output;
     VAR_result_MUX_uxn_device_h_l157_c7_8256_cond := VAR_BIN_OP_EQ_uxn_device_h_l157_c11_7a8b_return_output;
     VAR_x_MUX_uxn_device_h_l157_c7_8256_cond := VAR_BIN_OP_EQ_uxn_device_h_l157_c11_7a8b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_f8ff_cond := VAR_BIN_OP_EQ_uxn_device_h_l179_c11_3971_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l179_c7_23a6_cond := VAR_BIN_OP_EQ_uxn_device_h_l179_c11_3971_return_output;
     VAR_result_MUX_uxn_device_h_l179_c7_23a6_cond := VAR_BIN_OP_EQ_uxn_device_h_l179_c11_3971_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c7_8d42_cond := VAR_BIN_OP_EQ_uxn_device_h_l192_c11_c3ed_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l192_c7_f8ff_cond := VAR_BIN_OP_EQ_uxn_device_h_l192_c11_c3ed_return_output;
     VAR_result_MUX_uxn_device_h_l192_c7_f8ff_cond := VAR_BIN_OP_EQ_uxn_device_h_l192_c11_c3ed_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l213_c1_599e_cond := VAR_BIN_OP_EQ_uxn_device_h_l204_c11_d6f6_return_output;
     VAR_result_MUX_uxn_device_h_l204_c7_8d42_cond := VAR_BIN_OP_EQ_uxn_device_h_l204_c11_d6f6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_1756_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_ed31_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l88_c2_6371_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_ed31_return_output;
     VAR_color_MUX_uxn_device_h_l88_c2_6371_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_ed31_return_output;
     VAR_ctrl_MUX_uxn_device_h_l88_c2_6371_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_ed31_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_6371_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_ed31_return_output;
     VAR_flip_x_MUX_uxn_device_h_l88_c2_6371_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_ed31_return_output;
     VAR_flip_y_MUX_uxn_device_h_l88_c2_6371_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_ed31_return_output;
     VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_6371_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_ed31_return_output;
     VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_6371_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_ed31_return_output;
     VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_6371_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_ed31_return_output;
     VAR_layer_MUX_uxn_device_h_l88_c2_6371_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_ed31_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l88_c2_6371_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_ed31_return_output;
     VAR_result_MUX_uxn_device_h_l88_c2_6371_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_ed31_return_output;
     VAR_tmp8_MUX_uxn_device_h_l88_c2_6371_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_ed31_return_output;
     VAR_x_MUX_uxn_device_h_l88_c2_6371_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_ed31_return_output;
     VAR_y_MUX_uxn_device_h_l88_c2_6371_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_ed31_return_output;
     VAR_MUX_uxn_device_h_l89_c19_dc46_cond := VAR_BIN_OP_EQ_uxn_device_h_l89_c19_e190_return_output;
     VAR_MUX_uxn_device_h_l90_c20_fd90_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c20_bdd7_return_output;
     VAR_screen_blit_uxn_device_h_l215_c46_64ef_phase := VAR_BIN_OP_MINUS_uxn_device_h_l215_c58_8bcc_return_output;
     VAR_x_uxn_device_h_l165_c6_14d7 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l165_c6_3010_return_output, 16);
     VAR_BIN_OP_OR_uxn_device_h_l126_c4_0212_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l140_l153_l132_l188_l119_l201_l126_DUPLICATE_1417_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l201_c4_3fcf_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l140_l153_l132_l188_l119_l201_l126_DUPLICATE_1417_return_output;
     VAR_BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l153_l140_DUPLICATE_d8fa_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l140_l153_l132_l188_l119_l201_l126_DUPLICATE_1417_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_device_h_l189_l120_l133_DUPLICATE_5d8e_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l140_l153_l132_l188_l119_l201_l126_DUPLICATE_1417_return_output;
     VAR_color_MUX_uxn_device_h_l107_c3_47ef_iftrue := VAR_CAST_TO_uint4_t_uxn_device_h_l109_c12_7f69_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l181_c4_8670_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l184_c23_a641_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l206_c4_3d77_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l209_c23_4cdd_return_output;
     VAR_result_u16_addr_MUX_uxn_device_h_l138_c3_3093_iffalse := VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_device_h_l138_l158_DUPLICATE_1f4e_return_output;
     VAR_result_u16_addr_MUX_uxn_device_h_l158_c3_2a1e_iffalse := VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_device_h_l138_l158_DUPLICATE_1f4e_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l158_c3_2a1e_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l163_l158_DUPLICATE_0078_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l163_c4_8d15_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l163_l158_DUPLICATE_0078_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l158_c3_2a1e_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l180_l193_l164_l194_l206_l205_l163_l158_l181_DUPLICATE_67dc_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l163_c4_8d15_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l180_l193_l164_l194_l206_l205_l163_l158_l181_DUPLICATE_67dc_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l164_c5_ec39_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l180_l193_l164_l194_l206_l205_l163_l158_l181_DUPLICATE_67dc_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l180_c3_431f_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l180_l193_l164_l194_l206_l205_l163_l158_l181_DUPLICATE_67dc_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l181_c4_8670_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l180_l193_l164_l194_l206_l205_l163_l158_l181_DUPLICATE_67dc_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c3_532b_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l180_l193_l164_l194_l206_l205_l163_l158_l181_DUPLICATE_67dc_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l194_c4_1fab_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l180_l193_l164_l194_l206_l205_l163_l158_l181_DUPLICATE_67dc_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l205_c3_0106_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l180_l193_l164_l194_l206_l205_l163_l158_l181_DUPLICATE_67dc_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l206_c4_3d77_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l180_l193_l164_l194_l206_l205_l163_l158_l181_DUPLICATE_67dc_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l138_c3_3093_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l138_l158_DUPLICATE_b083_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l158_c3_2a1e_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l138_l158_DUPLICATE_b083_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_5212_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l180_l131_l118_l193_l164_l194_l152_l206_l102_l125_l107_l205_l174_l94_l163_l181_DUPLICATE_0a45_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l107_c3_47ef_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l180_l131_l118_l193_l164_l194_l152_l206_l102_l125_l107_l205_l174_l94_l163_l181_DUPLICATE_0a45_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l118_c3_5393_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l180_l131_l118_l193_l164_l194_l152_l206_l102_l125_l107_l205_l174_l94_l163_l181_DUPLICATE_0a45_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_43f8_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l180_l131_l118_l193_l164_l194_l152_l206_l102_l125_l107_l205_l174_l94_l163_l181_DUPLICATE_0a45_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l131_c3_e626_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l180_l131_l118_l193_l164_l194_l152_l206_l102_l125_l107_l205_l174_l94_l163_l181_DUPLICATE_0a45_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l152_c8_7000_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l180_l131_l118_l193_l164_l194_l152_l206_l102_l125_l107_l205_l174_l94_l163_l181_DUPLICATE_0a45_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l163_c4_8d15_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l180_l131_l118_l193_l164_l194_l152_l206_l102_l125_l107_l205_l174_l94_l163_l181_DUPLICATE_0a45_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l164_c5_ec39_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l180_l131_l118_l193_l164_l194_l152_l206_l102_l125_l107_l205_l174_l94_l163_l181_DUPLICATE_0a45_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l174_c8_9300_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l180_l131_l118_l193_l164_l194_l152_l206_l102_l125_l107_l205_l174_l94_l163_l181_DUPLICATE_0a45_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l180_c3_431f_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l180_l131_l118_l193_l164_l194_l152_l206_l102_l125_l107_l205_l174_l94_l163_l181_DUPLICATE_0a45_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l181_c4_8670_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l180_l131_l118_l193_l164_l194_l152_l206_l102_l125_l107_l205_l174_l94_l163_l181_DUPLICATE_0a45_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l193_c3_532b_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l180_l131_l118_l193_l164_l194_l152_l206_l102_l125_l107_l205_l174_l94_l163_l181_DUPLICATE_0a45_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l194_c4_1fab_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l180_l131_l118_l193_l164_l194_l152_l206_l102_l125_l107_l205_l174_l94_l163_l181_DUPLICATE_0a45_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l205_c3_0106_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l180_l131_l118_l193_l164_l194_l152_l206_l102_l125_l107_l205_l174_l94_l163_l181_DUPLICATE_0a45_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l206_c4_3d77_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l180_l131_l118_l193_l164_l194_l152_l206_l102_l125_l107_l205_l174_l94_l163_l181_DUPLICATE_0a45_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_12f4_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l180_l131_l118_l193_l164_l194_l152_l206_l102_l125_l107_l205_l174_l94_l163_l181_DUPLICATE_0a45_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l138_c3_3093_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l180_l193_l194_l206_l138_l205_l158_l181_DUPLICATE_ff57_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l158_c3_2a1e_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l180_l193_l194_l206_l138_l205_l158_l181_DUPLICATE_ff57_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l180_c3_431f_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l180_l193_l194_l206_l138_l205_l158_l181_DUPLICATE_ff57_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l181_c4_8670_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l180_l193_l194_l206_l138_l205_l158_l181_DUPLICATE_ff57_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l193_c3_532b_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l180_l193_l194_l206_l138_l205_l158_l181_DUPLICATE_ff57_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l194_c4_1fab_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l180_l193_l194_l206_l138_l205_l158_l181_DUPLICATE_ff57_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l205_c3_0106_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l180_l193_l194_l206_l138_l205_l158_l181_DUPLICATE_ff57_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l206_c4_3d77_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l180_l193_l194_l206_l138_l205_l158_l181_DUPLICATE_ff57_return_output;
     VAR_BIN_OP_AND_uxn_device_h_l194_c9_dc22_left := VAR_CONST_SR_1_uint8_t_uxn_device_h_l194_l206_DUPLICATE_8149_return_output;
     VAR_BIN_OP_AND_uxn_device_h_l206_c9_4a95_left := VAR_CONST_SR_1_uint8_t_uxn_device_h_l194_l206_DUPLICATE_8149_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l146_c5_36a8_right := VAR_MUX_uxn_device_h_l146_c13_4e7b_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l147_c5_fb66_right := VAR_MUX_uxn_device_h_l147_c13_0f55_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l163_c4_8d15_cond := VAR_UNARY_OP_NOT_uxn_device_h_l163_c9_88b8_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l163_c4_8d15_cond := VAR_UNARY_OP_NOT_uxn_device_h_l163_c9_88b8_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l163_c4_8d15_cond := VAR_UNARY_OP_NOT_uxn_device_h_l163_c9_88b8_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l163_c4_8d15_cond := VAR_UNARY_OP_NOT_uxn_device_h_l163_c9_88b8_return_output;
     VAR_x_MUX_uxn_device_h_l163_c4_8d15_cond := VAR_UNARY_OP_NOT_uxn_device_h_l163_c9_88b8_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l158_c3_2a1e_iffalse := VAR_auto_advance_MUX_uxn_device_h_l174_c8_9300_return_output;
     VAR_ctrl_MUX_uxn_device_h_l106_c7_97b2_iftrue := VAR_ctrl_MUX_uxn_device_h_l107_c3_47ef_return_output;
     VAR_result_MUX_uxn_device_h_l214_c3_6bd1_iffalse := VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_d321_uxn_device_h_l214_c3_6bd1_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l138_c3_3093_iffalse := VAR_result_vram_write_layer_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l138_c3_3093_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l146_c5_36a8_left := VAR_tmp8_uxn_device_h_l141_c4_08bc;
     VAR_tmp8_MUX_uxn_device_h_l145_c4_f761_iffalse := VAR_tmp8_uxn_device_h_l141_c4_08bc;
     VAR_CONST_SR_8_uxn_device_h_l168_c34_b539_x := VAR_x_uxn_device_h_l165_c6_14d7;
     VAR_x_MUX_uxn_device_h_l164_c5_ec39_iftrue := VAR_x_uxn_device_h_l165_c6_14d7;
     -- CAST_TO_uint8_t[uxn_device_h_l197_c23_f4be] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l197_c23_f4be_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_device_h_l197_c33_0a9c_return_output);

     -- result_device_ram_address_MUX[uxn_device_h_l118_c3_5393] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l118_c3_5393_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l118_c3_5393_cond;
     result_device_ram_address_MUX_uxn_device_h_l118_c3_5393_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l118_c3_5393_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l118_c3_5393_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l118_c3_5393_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l118_c3_5393_return_output := result_device_ram_address_MUX_uxn_device_h_l118_c3_5393_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l125_c3_43f8] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l125_c3_43f8_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_43f8_cond;
     result_device_ram_address_MUX_uxn_device_h_l125_c3_43f8_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_43f8_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l125_c3_43f8_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_43f8_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_43f8_return_output := result_device_ram_address_MUX_uxn_device_h_l125_c3_43f8_return_output;

     -- CAST_TO_uint1_t[uxn_device_h_l110_c16_b71b] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l110_c16_b71b_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_7_uxn_device_h_l110_c26_38da_return_output);

     -- result_u16_addr_MUX[uxn_device_h_l158_c3_2a1e] LATENCY=0
     -- Inputs
     result_u16_addr_MUX_uxn_device_h_l158_c3_2a1e_cond <= VAR_result_u16_addr_MUX_uxn_device_h_l158_c3_2a1e_cond;
     result_u16_addr_MUX_uxn_device_h_l158_c3_2a1e_iftrue <= VAR_result_u16_addr_MUX_uxn_device_h_l158_c3_2a1e_iftrue;
     result_u16_addr_MUX_uxn_device_h_l158_c3_2a1e_iffalse <= VAR_result_u16_addr_MUX_uxn_device_h_l158_c3_2a1e_iffalse;
     -- Outputs
     VAR_result_u16_addr_MUX_uxn_device_h_l158_c3_2a1e_return_output := result_u16_addr_MUX_uxn_device_h_l158_c3_2a1e_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l163_c4_8d15] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l163_c4_8d15_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l163_c4_8d15_cond;
     result_is_deo_done_MUX_uxn_device_h_l163_c4_8d15_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l163_c4_8d15_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l163_c4_8d15_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l163_c4_8d15_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l163_c4_8d15_return_output := result_is_deo_done_MUX_uxn_device_h_l163_c4_8d15_return_output;

     -- BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l153_l140_DUPLICATE_d8fa LATENCY=0
     -- Inputs
     BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l153_l140_DUPLICATE_d8fa_left <= VAR_BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l153_l140_DUPLICATE_d8fa_left;
     BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l153_l140_DUPLICATE_d8fa_right <= VAR_BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l153_l140_DUPLICATE_d8fa_right;
     -- Outputs
     VAR_BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l153_l140_DUPLICATE_d8fa_return_output := BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l153_l140_DUPLICATE_d8fa_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l174_c8_9300] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l174_c8_9300_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l174_c8_9300_cond;
     result_device_ram_address_MUX_uxn_device_h_l174_c8_9300_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l174_c8_9300_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l174_c8_9300_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l174_c8_9300_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l174_c8_9300_return_output := result_device_ram_address_MUX_uxn_device_h_l174_c8_9300_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l101_c7_1756] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_1756_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_1756_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_1756_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_1756_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_1756_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_1756_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_1756_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_1756_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l107_c3_47ef] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l107_c3_47ef_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l107_c3_47ef_cond;
     result_device_ram_address_MUX_uxn_device_h_l107_c3_47ef_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l107_c3_47ef_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l107_c3_47ef_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l107_c3_47ef_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l107_c3_47ef_return_output := result_device_ram_address_MUX_uxn_device_h_l107_c3_47ef_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l131_c3_e626] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l131_c3_e626_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l131_c3_e626_cond;
     result_device_ram_address_MUX_uxn_device_h_l131_c3_e626_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l131_c3_e626_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l131_c3_e626_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l131_c3_e626_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l131_c3_e626_return_output := result_device_ram_address_MUX_uxn_device_h_l131_c3_e626_return_output;

     -- auto_advance_MUX[uxn_device_h_l158_c3_2a1e] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l158_c3_2a1e_cond <= VAR_auto_advance_MUX_uxn_device_h_l158_c3_2a1e_cond;
     auto_advance_MUX_uxn_device_h_l158_c3_2a1e_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l158_c3_2a1e_iftrue;
     auto_advance_MUX_uxn_device_h_l158_c3_2a1e_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l158_c3_2a1e_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l158_c3_2a1e_return_output := auto_advance_MUX_uxn_device_h_l158_c3_2a1e_return_output;

     -- BIN_OP_OR[uxn_device_h_l146_c5_36a8] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l146_c5_36a8_left <= VAR_BIN_OP_OR_uxn_device_h_l146_c5_36a8_left;
     BIN_OP_OR_uxn_device_h_l146_c5_36a8_right <= VAR_BIN_OP_OR_uxn_device_h_l146_c5_36a8_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l146_c5_36a8_return_output := BIN_OP_OR_uxn_device_h_l146_c5_36a8_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l152_c8_7000] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l152_c8_7000_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l152_c8_7000_cond;
     result_device_ram_address_MUX_uxn_device_h_l152_c8_7000_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l152_c8_7000_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l152_c8_7000_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l152_c8_7000_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l152_c8_7000_return_output := result_device_ram_address_MUX_uxn_device_h_l152_c8_7000_return_output;

     -- CAST_TO_uint1_t[uxn_device_h_l113_c13_84a2] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l113_c13_84a2_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_4_uxn_device_h_l113_c23_4519_return_output);

     -- BIN_OP_NEQ[uxn_device_h_l181_c8_cf7f] LATENCY=0
     -- Inputs
     BIN_OP_NEQ_uxn_device_h_l181_c8_cf7f_left <= VAR_BIN_OP_NEQ_uxn_device_h_l181_c8_cf7f_left;
     BIN_OP_NEQ_uxn_device_h_l181_c8_cf7f_right <= VAR_BIN_OP_NEQ_uxn_device_h_l181_c8_cf7f_right;
     -- Outputs
     VAR_BIN_OP_NEQ_uxn_device_h_l181_c8_cf7f_return_output := BIN_OP_NEQ_uxn_device_h_l181_c8_cf7f_return_output;

     -- CONST_SR_8[uxn_device_h_l168_c34_b539] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_device_h_l168_c34_b539_x <= VAR_CONST_SR_8_uxn_device_h_l168_c34_b539_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_device_h_l168_c34_b539_return_output := CONST_SR_8_uxn_device_h_l168_c34_b539_return_output;

     -- color_MUX[uxn_device_h_l107_c3_47ef] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l107_c3_47ef_cond <= VAR_color_MUX_uxn_device_h_l107_c3_47ef_cond;
     color_MUX_uxn_device_h_l107_c3_47ef_iftrue <= VAR_color_MUX_uxn_device_h_l107_c3_47ef_iftrue;
     color_MUX_uxn_device_h_l107_c3_47ef_iffalse <= VAR_color_MUX_uxn_device_h_l107_c3_47ef_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l107_c3_47ef_return_output := color_MUX_uxn_device_h_l107_c3_47ef_return_output;

     -- CAST_TO_uint1_t[uxn_device_h_l111_c12_2f4d] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l111_c12_2f4d_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_6_uxn_device_h_l111_c22_e222_return_output);

     -- BIN_OP_AND[uxn_device_h_l206_c9_4a95] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l206_c9_4a95_left <= VAR_BIN_OP_AND_uxn_device_h_l206_c9_4a95_left;
     BIN_OP_AND_uxn_device_h_l206_c9_4a95_right <= VAR_BIN_OP_AND_uxn_device_h_l206_c9_4a95_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l206_c9_4a95_return_output := BIN_OP_AND_uxn_device_h_l206_c9_4a95_return_output;

     -- result_vram_write_layer_MUX[uxn_device_h_l138_c3_3093] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l138_c3_3093_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l138_c3_3093_cond;
     result_vram_write_layer_MUX_uxn_device_h_l138_c3_3093_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l138_c3_3093_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l138_c3_3093_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l138_c3_3093_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l138_c3_3093_return_output := result_vram_write_layer_MUX_uxn_device_h_l138_c3_3093_return_output;

     -- MUX[uxn_device_h_l90_c20_fd90] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l90_c20_fd90_cond <= VAR_MUX_uxn_device_h_l90_c20_fd90_cond;
     MUX_uxn_device_h_l90_c20_fd90_iftrue <= VAR_MUX_uxn_device_h_l90_c20_fd90_iftrue;
     MUX_uxn_device_h_l90_c20_fd90_iffalse <= VAR_MUX_uxn_device_h_l90_c20_fd90_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l90_c20_fd90_return_output := MUX_uxn_device_h_l90_c20_fd90_return_output;

     -- CAST_TO_uint1_t[uxn_device_h_l112_c13_1eab] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l112_c13_1eab_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_5_uxn_device_h_l112_c23_3397_return_output);

     -- result_device_ram_address_MUX[uxn_device_h_l102_c3_5212] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l102_c3_5212_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_5212_cond;
     result_device_ram_address_MUX_uxn_device_h_l102_c3_5212_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_5212_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l102_c3_5212_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_5212_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_5212_return_output := result_device_ram_address_MUX_uxn_device_h_l102_c3_5212_return_output;

     -- MUX[uxn_device_h_l89_c19_dc46] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l89_c19_dc46_cond <= VAR_MUX_uxn_device_h_l89_c19_dc46_cond;
     MUX_uxn_device_h_l89_c19_dc46_iftrue <= VAR_MUX_uxn_device_h_l89_c19_dc46_iftrue;
     MUX_uxn_device_h_l89_c19_dc46_iffalse <= VAR_MUX_uxn_device_h_l89_c19_dc46_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l89_c19_dc46_return_output := MUX_uxn_device_h_l89_c19_dc46_return_output;

     -- BIN_OP_NEQ[uxn_device_h_l164_c9_0470] LATENCY=0
     -- Inputs
     BIN_OP_NEQ_uxn_device_h_l164_c9_0470_left <= VAR_BIN_OP_NEQ_uxn_device_h_l164_c9_0470_left;
     BIN_OP_NEQ_uxn_device_h_l164_c9_0470_right <= VAR_BIN_OP_NEQ_uxn_device_h_l164_c9_0470_right;
     -- Outputs
     VAR_BIN_OP_NEQ_uxn_device_h_l164_c9_0470_return_output := BIN_OP_NEQ_uxn_device_h_l164_c9_0470_return_output;

     -- BIN_OP_OR[uxn_device_h_l126_c4_0212] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l126_c4_0212_left <= VAR_BIN_OP_OR_uxn_device_h_l126_c4_0212_left;
     BIN_OP_OR_uxn_device_h_l126_c4_0212_right <= VAR_BIN_OP_OR_uxn_device_h_l126_c4_0212_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l126_c4_0212_return_output := BIN_OP_OR_uxn_device_h_l126_c4_0212_return_output;

     -- BIN_OP_OR[uxn_device_h_l201_c4_3fcf] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l201_c4_3fcf_left <= VAR_BIN_OP_OR_uxn_device_h_l201_c4_3fcf_left;
     BIN_OP_OR_uxn_device_h_l201_c4_3fcf_right <= VAR_BIN_OP_OR_uxn_device_h_l201_c4_3fcf_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l201_c4_3fcf_return_output := BIN_OP_OR_uxn_device_h_l201_c4_3fcf_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l138_c3_3093] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l138_c3_3093_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l138_c3_3093_cond;
     result_is_vram_write_MUX_uxn_device_h_l138_c3_3093_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l138_c3_3093_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l138_c3_3093_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l138_c3_3093_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l138_c3_3093_return_output := result_is_vram_write_MUX_uxn_device_h_l138_c3_3093_return_output;

     -- CONST_SL_8_uint16_t_uxn_device_h_l189_l120_l133_DUPLICATE_5d8e LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_device_h_l189_l120_l133_DUPLICATE_5d8e_x <= VAR_CONST_SL_8_uint16_t_uxn_device_h_l189_l120_l133_DUPLICATE_5d8e_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_device_h_l189_l120_l133_DUPLICATE_5d8e_return_output := CONST_SL_8_uint16_t_uxn_device_h_l189_l120_l133_DUPLICATE_5d8e_return_output;

     -- ctrl_MUX[uxn_device_h_l106_c7_97b2] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l106_c7_97b2_cond <= VAR_ctrl_MUX_uxn_device_h_l106_c7_97b2_cond;
     ctrl_MUX_uxn_device_h_l106_c7_97b2_iftrue <= VAR_ctrl_MUX_uxn_device_h_l106_c7_97b2_iftrue;
     ctrl_MUX_uxn_device_h_l106_c7_97b2_iffalse <= VAR_ctrl_MUX_uxn_device_h_l106_c7_97b2_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l106_c7_97b2_return_output := ctrl_MUX_uxn_device_h_l106_c7_97b2_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l158_c3_2a1e] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l158_c3_2a1e_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l158_c3_2a1e_cond;
     result_is_vram_write_MUX_uxn_device_h_l158_c3_2a1e_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l158_c3_2a1e_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l158_c3_2a1e_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l158_c3_2a1e_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l158_c3_2a1e_return_output := result_is_vram_write_MUX_uxn_device_h_l158_c3_2a1e_return_output;

     -- BIN_OP_AND[uxn_device_h_l194_c9_dc22] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l194_c9_dc22_left <= VAR_BIN_OP_AND_uxn_device_h_l194_c9_dc22_left;
     BIN_OP_AND_uxn_device_h_l194_c9_dc22_right <= VAR_BIN_OP_AND_uxn_device_h_l194_c9_dc22_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l194_c9_dc22_return_output := BIN_OP_AND_uxn_device_h_l194_c9_dc22_return_output;

     -- Submodule level 2
     VAR_BIN_OP_NEQ_uxn_device_h_l194_c9_bab2_left := VAR_BIN_OP_AND_uxn_device_h_l194_c9_dc22_return_output;
     VAR_BIN_OP_NEQ_uxn_device_h_l206_c9_aa5c_left := VAR_BIN_OP_AND_uxn_device_h_l206_c9_4a95_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l164_c5_ec39_cond := VAR_BIN_OP_NEQ_uxn_device_h_l164_c9_0470_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l164_c5_ec39_cond := VAR_BIN_OP_NEQ_uxn_device_h_l164_c9_0470_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l164_c5_ec39_cond := VAR_BIN_OP_NEQ_uxn_device_h_l164_c9_0470_return_output;
     VAR_x_MUX_uxn_device_h_l164_c5_ec39_cond := VAR_BIN_OP_NEQ_uxn_device_h_l164_c9_0470_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l181_c4_8670_cond := VAR_BIN_OP_NEQ_uxn_device_h_l181_c8_cf7f_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l181_c4_8670_cond := VAR_BIN_OP_NEQ_uxn_device_h_l181_c8_cf7f_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l181_c4_8670_cond := VAR_BIN_OP_NEQ_uxn_device_h_l181_c8_cf7f_return_output;
     VAR_x_MUX_uxn_device_h_l125_c3_43f8_iftrue := VAR_BIN_OP_OR_uxn_device_h_l126_c4_0212_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l147_c5_fb66_left := VAR_BIN_OP_OR_uxn_device_h_l146_c5_36a8_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l200_c8_4bb9_iftrue := VAR_BIN_OP_OR_uxn_device_h_l201_c4_3fcf_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l142_c23_431d_left := VAR_BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l153_l140_DUPLICATE_d8fa_return_output;
     VAR_y_MUX_uxn_device_h_l138_c3_3093_iftrue := VAR_BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l153_l140_DUPLICATE_d8fa_return_output;
     VAR_y_MUX_uxn_device_h_l152_c8_7000_iftrue := VAR_BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l153_l140_DUPLICATE_d8fa_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l107_c3_47ef_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l110_c16_b71b_return_output;
     VAR_layer_MUX_uxn_device_h_l107_c3_47ef_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l111_c12_2f4d_return_output;
     VAR_flip_y_MUX_uxn_device_h_l107_c3_47ef_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l112_c13_1eab_return_output;
     VAR_flip_x_MUX_uxn_device_h_l107_c3_47ef_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l113_c13_84a2_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l194_c4_1fab_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l197_c23_f4be_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l187_c8_3a68_iftrue := VAR_CONST_SL_8_uint16_t_uxn_device_h_l189_l120_l133_DUPLICATE_5d8e_return_output;
     VAR_x_MUX_uxn_device_h_l118_c3_5393_iftrue := VAR_CONST_SL_8_uint16_t_uxn_device_h_l189_l120_l133_DUPLICATE_5d8e_return_output;
     VAR_y_MUX_uxn_device_h_l131_c3_e626_iftrue := VAR_CONST_SL_8_uint16_t_uxn_device_h_l189_l120_l133_DUPLICATE_5d8e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_97b2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_1756_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l91_c21_788d_left := VAR_MUX_uxn_device_h_l89_c19_dc46_return_output;
     VAR_MUX_uxn_device_h_l95_c32_9049_cond := VAR_MUX_uxn_device_h_l89_c19_dc46_return_output;
     VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_6371_iftrue := VAR_MUX_uxn_device_h_l89_c19_dc46_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l91_c21_788d_right := VAR_MUX_uxn_device_h_l90_c20_fd90_return_output;
     VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_6371_iftrue := VAR_MUX_uxn_device_h_l90_c20_fd90_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l157_c7_8256_iftrue := VAR_auto_advance_MUX_uxn_device_h_l158_c3_2a1e_return_output;
     VAR_color_MUX_uxn_device_h_l106_c7_97b2_iftrue := VAR_color_MUX_uxn_device_h_l107_c3_47ef_return_output;
     VAR_ctrl_MUX_uxn_device_h_l101_c7_1756_iffalse := VAR_ctrl_MUX_uxn_device_h_l106_c7_97b2_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l138_c3_3093_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l152_c8_7000_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l158_c3_2a1e_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l174_c8_9300_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l158_c3_2a1e_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l163_c4_8d15_return_output;
     -- color_MUX[uxn_device_h_l106_c7_97b2] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l106_c7_97b2_cond <= VAR_color_MUX_uxn_device_h_l106_c7_97b2_cond;
     color_MUX_uxn_device_h_l106_c7_97b2_iftrue <= VAR_color_MUX_uxn_device_h_l106_c7_97b2_iftrue;
     color_MUX_uxn_device_h_l106_c7_97b2_iffalse <= VAR_color_MUX_uxn_device_h_l106_c7_97b2_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l106_c7_97b2_return_output := color_MUX_uxn_device_h_l106_c7_97b2_return_output;

     -- x_MUX[uxn_device_h_l164_c5_ec39] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l164_c5_ec39_cond <= VAR_x_MUX_uxn_device_h_l164_c5_ec39_cond;
     x_MUX_uxn_device_h_l164_c5_ec39_iftrue <= VAR_x_MUX_uxn_device_h_l164_c5_ec39_iftrue;
     x_MUX_uxn_device_h_l164_c5_ec39_iffalse <= VAR_x_MUX_uxn_device_h_l164_c5_ec39_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l164_c5_ec39_return_output := x_MUX_uxn_device_h_l164_c5_ec39_return_output;

     -- flip_x_MUX[uxn_device_h_l107_c3_47ef] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l107_c3_47ef_cond <= VAR_flip_x_MUX_uxn_device_h_l107_c3_47ef_cond;
     flip_x_MUX_uxn_device_h_l107_c3_47ef_iftrue <= VAR_flip_x_MUX_uxn_device_h_l107_c3_47ef_iftrue;
     flip_x_MUX_uxn_device_h_l107_c3_47ef_iffalse <= VAR_flip_x_MUX_uxn_device_h_l107_c3_47ef_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l107_c3_47ef_return_output := flip_x_MUX_uxn_device_h_l107_c3_47ef_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_device_h_l142_c23_431d] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_device_h_l142_c23_431d_left <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l142_c23_431d_left;
     BIN_OP_INFERRED_MULT_uxn_device_h_l142_c23_431d_right <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l142_c23_431d_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l142_c23_431d_return_output := BIN_OP_INFERRED_MULT_uxn_device_h_l142_c23_431d_return_output;

     -- y_MUX[uxn_device_h_l152_c8_7000] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l152_c8_7000_cond <= VAR_y_MUX_uxn_device_h_l152_c8_7000_cond;
     y_MUX_uxn_device_h_l152_c8_7000_iftrue <= VAR_y_MUX_uxn_device_h_l152_c8_7000_iftrue;
     y_MUX_uxn_device_h_l152_c8_7000_iffalse <= VAR_y_MUX_uxn_device_h_l152_c8_7000_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l152_c8_7000_return_output := y_MUX_uxn_device_h_l152_c8_7000_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l107_c3_47ef] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l107_c3_47ef_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l107_c3_47ef_cond;
     ctrl_mode_MUX_uxn_device_h_l107_c3_47ef_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l107_c3_47ef_iftrue;
     ctrl_mode_MUX_uxn_device_h_l107_c3_47ef_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l107_c3_47ef_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l107_c3_47ef_return_output := ctrl_mode_MUX_uxn_device_h_l107_c3_47ef_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l164_c5_ec39] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l164_c5_ec39_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l164_c5_ec39_cond;
     result_device_ram_address_MUX_uxn_device_h_l164_c5_ec39_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l164_c5_ec39_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l164_c5_ec39_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l164_c5_ec39_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l164_c5_ec39_return_output := result_device_ram_address_MUX_uxn_device_h_l164_c5_ec39_return_output;

     -- BIN_OP_NEQ[uxn_device_h_l206_c9_aa5c] LATENCY=0
     -- Inputs
     BIN_OP_NEQ_uxn_device_h_l206_c9_aa5c_left <= VAR_BIN_OP_NEQ_uxn_device_h_l206_c9_aa5c_left;
     BIN_OP_NEQ_uxn_device_h_l206_c9_aa5c_right <= VAR_BIN_OP_NEQ_uxn_device_h_l206_c9_aa5c_right;
     -- Outputs
     VAR_BIN_OP_NEQ_uxn_device_h_l206_c9_aa5c_return_output := BIN_OP_NEQ_uxn_device_h_l206_c9_aa5c_return_output;

     -- x_MUX[uxn_device_h_l118_c3_5393] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l118_c3_5393_cond <= VAR_x_MUX_uxn_device_h_l118_c3_5393_cond;
     x_MUX_uxn_device_h_l118_c3_5393_iftrue <= VAR_x_MUX_uxn_device_h_l118_c3_5393_iftrue;
     x_MUX_uxn_device_h_l118_c3_5393_iffalse <= VAR_x_MUX_uxn_device_h_l118_c3_5393_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l118_c3_5393_return_output := x_MUX_uxn_device_h_l118_c3_5393_return_output;

     -- layer_MUX[uxn_device_h_l107_c3_47ef] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l107_c3_47ef_cond <= VAR_layer_MUX_uxn_device_h_l107_c3_47ef_cond;
     layer_MUX_uxn_device_h_l107_c3_47ef_iftrue <= VAR_layer_MUX_uxn_device_h_l107_c3_47ef_iftrue;
     layer_MUX_uxn_device_h_l107_c3_47ef_iffalse <= VAR_layer_MUX_uxn_device_h_l107_c3_47ef_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l107_c3_47ef_return_output := layer_MUX_uxn_device_h_l107_c3_47ef_return_output;

     -- BIN_OP_OR[uxn_device_h_l147_c5_fb66] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l147_c5_fb66_left <= VAR_BIN_OP_OR_uxn_device_h_l147_c5_fb66_left;
     BIN_OP_OR_uxn_device_h_l147_c5_fb66_right <= VAR_BIN_OP_OR_uxn_device_h_l147_c5_fb66_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l147_c5_fb66_return_output := BIN_OP_OR_uxn_device_h_l147_c5_fb66_return_output;

     -- CAST_TO_uint8_t[uxn_device_h_l168_c24_d9aa] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l168_c24_d9aa_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_device_h_l168_c34_b539_return_output);

     -- result_is_deo_done_MUX[uxn_device_h_l158_c3_2a1e] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l158_c3_2a1e_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l158_c3_2a1e_cond;
     result_is_deo_done_MUX_uxn_device_h_l158_c3_2a1e_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l158_c3_2a1e_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l158_c3_2a1e_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l158_c3_2a1e_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l158_c3_2a1e_return_output := result_is_deo_done_MUX_uxn_device_h_l158_c3_2a1e_return_output;

     -- flip_y_MUX[uxn_device_h_l107_c3_47ef] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l107_c3_47ef_cond <= VAR_flip_y_MUX_uxn_device_h_l107_c3_47ef_cond;
     flip_y_MUX_uxn_device_h_l107_c3_47ef_iftrue <= VAR_flip_y_MUX_uxn_device_h_l107_c3_47ef_iftrue;
     flip_y_MUX_uxn_device_h_l107_c3_47ef_iffalse <= VAR_flip_y_MUX_uxn_device_h_l107_c3_47ef_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l107_c3_47ef_return_output := flip_y_MUX_uxn_device_h_l107_c3_47ef_return_output;

     -- auto_advance_MUX[uxn_device_h_l157_c7_8256] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l157_c7_8256_cond <= VAR_auto_advance_MUX_uxn_device_h_l157_c7_8256_cond;
     auto_advance_MUX_uxn_device_h_l157_c7_8256_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l157_c7_8256_iftrue;
     auto_advance_MUX_uxn_device_h_l157_c7_8256_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l157_c7_8256_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l157_c7_8256_return_output := auto_advance_MUX_uxn_device_h_l157_c7_8256_return_output;

     -- MUX[uxn_device_h_l95_c32_9049] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l95_c32_9049_cond <= VAR_MUX_uxn_device_h_l95_c32_9049_cond;
     MUX_uxn_device_h_l95_c32_9049_iftrue <= VAR_MUX_uxn_device_h_l95_c32_9049_iftrue;
     MUX_uxn_device_h_l95_c32_9049_iffalse <= VAR_MUX_uxn_device_h_l95_c32_9049_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l95_c32_9049_return_output := MUX_uxn_device_h_l95_c32_9049_return_output;

     -- BIN_OP_OR[uxn_device_h_l91_c21_788d] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l91_c21_788d_left <= VAR_BIN_OP_OR_uxn_device_h_l91_c21_788d_left;
     BIN_OP_OR_uxn_device_h_l91_c21_788d_right <= VAR_BIN_OP_OR_uxn_device_h_l91_c21_788d_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l91_c21_788d_return_output := BIN_OP_OR_uxn_device_h_l91_c21_788d_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l106_c7_97b2] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l106_c7_97b2_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     VAR_result_device_ram_address_MUX_uxn_device_h_l107_c3_47ef_return_output);

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l130_c7_7bb6] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l130_c7_7bb6_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     VAR_result_device_ram_address_MUX_uxn_device_h_l131_c3_e626_return_output);

     -- ram_addr_MUX[uxn_device_h_l200_c8_4bb9] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l200_c8_4bb9_cond <= VAR_ram_addr_MUX_uxn_device_h_l200_c8_4bb9_cond;
     ram_addr_MUX_uxn_device_h_l200_c8_4bb9_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l200_c8_4bb9_iftrue;
     ram_addr_MUX_uxn_device_h_l200_c8_4bb9_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l200_c8_4bb9_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l200_c8_4bb9_return_output := ram_addr_MUX_uxn_device_h_l200_c8_4bb9_return_output;

     -- is_sprite_port_MUX[uxn_device_h_l88_c2_6371] LATENCY=0
     -- Inputs
     is_sprite_port_MUX_uxn_device_h_l88_c2_6371_cond <= VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_6371_cond;
     is_sprite_port_MUX_uxn_device_h_l88_c2_6371_iftrue <= VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_6371_iftrue;
     is_sprite_port_MUX_uxn_device_h_l88_c2_6371_iffalse <= VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_6371_iffalse;
     -- Outputs
     VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_6371_return_output := is_sprite_port_MUX_uxn_device_h_l88_c2_6371_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l181_c4_8670] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l181_c4_8670_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l181_c4_8670_cond;
     result_device_ram_address_MUX_uxn_device_h_l181_c4_8670_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l181_c4_8670_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l181_c4_8670_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l181_c4_8670_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l181_c4_8670_return_output := result_device_ram_address_MUX_uxn_device_h_l181_c4_8670_return_output;

     -- ctrl_MUX[uxn_device_h_l101_c7_1756] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l101_c7_1756_cond <= VAR_ctrl_MUX_uxn_device_h_l101_c7_1756_cond;
     ctrl_MUX_uxn_device_h_l101_c7_1756_iftrue <= VAR_ctrl_MUX_uxn_device_h_l101_c7_1756_iftrue;
     ctrl_MUX_uxn_device_h_l101_c7_1756_iffalse <= VAR_ctrl_MUX_uxn_device_h_l101_c7_1756_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l101_c7_1756_return_output := ctrl_MUX_uxn_device_h_l101_c7_1756_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l117_c7_c075] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l117_c7_c075_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     VAR_result_device_ram_address_MUX_uxn_device_h_l118_c3_5393_return_output);

     -- result_is_device_ram_write_MUX[uxn_device_h_l164_c5_ec39] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l164_c5_ec39_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l164_c5_ec39_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l164_c5_ec39_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l164_c5_ec39_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l164_c5_ec39_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l164_c5_ec39_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l164_c5_ec39_return_output := result_is_device_ram_write_MUX_uxn_device_h_l164_c5_ec39_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l106_c7_97b2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_97b2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_97b2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_97b2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_97b2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_97b2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_97b2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_97b2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_97b2_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l101_c7_1756] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l101_c7_1756_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_5212_return_output);

     -- BIN_OP_NEQ[uxn_device_h_l194_c9_bab2] LATENCY=0
     -- Inputs
     BIN_OP_NEQ_uxn_device_h_l194_c9_bab2_left <= VAR_BIN_OP_NEQ_uxn_device_h_l194_c9_bab2_left;
     BIN_OP_NEQ_uxn_device_h_l194_c9_bab2_right <= VAR_BIN_OP_NEQ_uxn_device_h_l194_c9_bab2_right;
     -- Outputs
     VAR_BIN_OP_NEQ_uxn_device_h_l194_c9_bab2_return_output := BIN_OP_NEQ_uxn_device_h_l194_c9_bab2_return_output;

     -- ram_addr_MUX[uxn_device_h_l187_c8_3a68] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l187_c8_3a68_cond <= VAR_ram_addr_MUX_uxn_device_h_l187_c8_3a68_cond;
     ram_addr_MUX_uxn_device_h_l187_c8_3a68_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l187_c8_3a68_iftrue;
     ram_addr_MUX_uxn_device_h_l187_c8_3a68_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l187_c8_3a68_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l187_c8_3a68_return_output := ram_addr_MUX_uxn_device_h_l187_c8_3a68_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l124_c7_63d6] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l124_c7_63d6_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_43f8_return_output);

     -- result_device_ram_address_MUX[uxn_device_h_l138_c3_3093] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l138_c3_3093_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l138_c3_3093_cond;
     result_device_ram_address_MUX_uxn_device_h_l138_c3_3093_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l138_c3_3093_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l138_c3_3093_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l138_c3_3093_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l138_c3_3093_return_output := result_device_ram_address_MUX_uxn_device_h_l138_c3_3093_return_output;

     -- result_u8_value_MUX[uxn_device_h_l181_c4_8670] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l181_c4_8670_cond <= VAR_result_u8_value_MUX_uxn_device_h_l181_c4_8670_cond;
     result_u8_value_MUX_uxn_device_h_l181_c4_8670_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l181_c4_8670_iftrue;
     result_u8_value_MUX_uxn_device_h_l181_c4_8670_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l181_c4_8670_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l181_c4_8670_return_output := result_u8_value_MUX_uxn_device_h_l181_c4_8670_return_output;

     -- y_MUX[uxn_device_h_l131_c3_e626] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l131_c3_e626_cond <= VAR_y_MUX_uxn_device_h_l131_c3_e626_cond;
     y_MUX_uxn_device_h_l131_c3_e626_iftrue <= VAR_y_MUX_uxn_device_h_l131_c3_e626_iftrue;
     y_MUX_uxn_device_h_l131_c3_e626_iffalse <= VAR_y_MUX_uxn_device_h_l131_c3_e626_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l131_c3_e626_return_output := y_MUX_uxn_device_h_l131_c3_e626_return_output;

     -- x_MUX[uxn_device_h_l125_c3_43f8] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l125_c3_43f8_cond <= VAR_x_MUX_uxn_device_h_l125_c3_43f8_cond;
     x_MUX_uxn_device_h_l125_c3_43f8_iftrue <= VAR_x_MUX_uxn_device_h_l125_c3_43f8_iftrue;
     x_MUX_uxn_device_h_l125_c3_43f8_iffalse <= VAR_x_MUX_uxn_device_h_l125_c3_43f8_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l125_c3_43f8_return_output := x_MUX_uxn_device_h_l125_c3_43f8_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l181_c4_8670] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l181_c4_8670_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l181_c4_8670_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l181_c4_8670_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l181_c4_8670_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l181_c4_8670_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l181_c4_8670_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l181_c4_8670_return_output := result_is_device_ram_write_MUX_uxn_device_h_l181_c4_8670_return_output;

     -- is_pixel_port_MUX[uxn_device_h_l88_c2_6371] LATENCY=0
     -- Inputs
     is_pixel_port_MUX_uxn_device_h_l88_c2_6371_cond <= VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_6371_cond;
     is_pixel_port_MUX_uxn_device_h_l88_c2_6371_iftrue <= VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_6371_iftrue;
     is_pixel_port_MUX_uxn_device_h_l88_c2_6371_iffalse <= VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_6371_iffalse;
     -- Outputs
     VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_6371_return_output := is_pixel_port_MUX_uxn_device_h_l88_c2_6371_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_device_h_l142_c23_d3c0_left := VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l142_c23_431d_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l194_c4_1fab_cond := VAR_BIN_OP_NEQ_uxn_device_h_l194_c9_bab2_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l194_c4_1fab_cond := VAR_BIN_OP_NEQ_uxn_device_h_l194_c9_bab2_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l194_c4_1fab_cond := VAR_BIN_OP_NEQ_uxn_device_h_l194_c9_bab2_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l206_c4_3d77_cond := VAR_BIN_OP_NEQ_uxn_device_h_l206_c9_aa5c_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l206_c4_3d77_cond := VAR_BIN_OP_NEQ_uxn_device_h_l206_c9_aa5c_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l206_c4_3d77_cond := VAR_BIN_OP_NEQ_uxn_device_h_l206_c9_aa5c_return_output;
     VAR_tmp8_MUX_uxn_device_h_l145_c4_f761_iftrue := VAR_BIN_OP_OR_uxn_device_h_l147_c5_fb66_return_output;
     VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_6371_iftrue := VAR_BIN_OP_OR_uxn_device_h_l91_c21_788d_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_12f4_cond := VAR_BIN_OP_OR_uxn_device_h_l91_c21_788d_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_12f4_cond := VAR_BIN_OP_OR_uxn_device_h_l91_c21_788d_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l164_c5_ec39_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l168_c24_d9aa_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_c075_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_97b2_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_12f4_iftrue := VAR_MUX_uxn_device_h_l95_c32_9049_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l137_c7_1fcf_iffalse := VAR_auto_advance_MUX_uxn_device_h_l157_c7_8256_return_output;
     VAR_color_MUX_uxn_device_h_l101_c7_1756_iffalse := VAR_color_MUX_uxn_device_h_l106_c7_97b2_return_output;
     VAR_ctrl_MUX_uxn_device_h_l88_c2_6371_iffalse := VAR_ctrl_MUX_uxn_device_h_l101_c7_1756_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l106_c7_97b2_iftrue := VAR_ctrl_mode_MUX_uxn_device_h_l107_c3_47ef_return_output;
     VAR_flip_x_MUX_uxn_device_h_l106_c7_97b2_iftrue := VAR_flip_x_MUX_uxn_device_h_l107_c3_47ef_return_output;
     VAR_flip_y_MUX_uxn_device_h_l106_c7_97b2_iftrue := VAR_flip_y_MUX_uxn_device_h_l107_c3_47ef_return_output;
     REG_VAR_is_pixel_port := VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_6371_return_output;
     REG_VAR_is_sprite_port := VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_6371_return_output;
     VAR_layer_MUX_uxn_device_h_l106_c7_97b2_iftrue := VAR_layer_MUX_uxn_device_h_l107_c3_47ef_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l180_c3_431f_iffalse := VAR_ram_addr_MUX_uxn_device_h_l187_c8_3a68_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l193_c3_532b_iffalse := VAR_ram_addr_MUX_uxn_device_h_l200_c8_4bb9_return_output;
     VAR_result_MUX_uxn_device_h_l101_c7_1756_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l101_c7_1756_return_output;
     VAR_result_MUX_uxn_device_h_l106_c7_97b2_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l106_c7_97b2_return_output;
     VAR_result_MUX_uxn_device_h_l117_c7_c075_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l117_c7_c075_return_output;
     VAR_result_MUX_uxn_device_h_l124_c7_63d6_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l124_c7_63d6_return_output;
     VAR_result_MUX_uxn_device_h_l130_c7_7bb6_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l130_c7_7bb6_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l163_c4_8d15_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l164_c5_ec39_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l180_c3_431f_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l181_c4_8670_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l163_c4_8d15_iftrue := VAR_result_is_device_ram_write_MUX_uxn_device_h_l164_c5_ec39_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l180_c3_431f_iftrue := VAR_result_is_device_ram_write_MUX_uxn_device_h_l181_c4_8670_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l180_c3_431f_iftrue := VAR_result_u8_value_MUX_uxn_device_h_l181_c4_8670_return_output;
     VAR_x_MUX_uxn_device_h_l117_c7_c075_iftrue := VAR_x_MUX_uxn_device_h_l118_c3_5393_return_output;
     VAR_x_MUX_uxn_device_h_l124_c7_63d6_iftrue := VAR_x_MUX_uxn_device_h_l125_c3_43f8_return_output;
     VAR_x_MUX_uxn_device_h_l163_c4_8d15_iftrue := VAR_x_MUX_uxn_device_h_l164_c5_ec39_return_output;
     VAR_y_MUX_uxn_device_h_l130_c7_7bb6_iftrue := VAR_y_MUX_uxn_device_h_l131_c3_e626_return_output;
     VAR_y_MUX_uxn_device_h_l138_c3_3093_iffalse := VAR_y_MUX_uxn_device_h_l152_c8_7000_return_output;
     -- flip_x_MUX[uxn_device_h_l106_c7_97b2] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l106_c7_97b2_cond <= VAR_flip_x_MUX_uxn_device_h_l106_c7_97b2_cond;
     flip_x_MUX_uxn_device_h_l106_c7_97b2_iftrue <= VAR_flip_x_MUX_uxn_device_h_l106_c7_97b2_iftrue;
     flip_x_MUX_uxn_device_h_l106_c7_97b2_iffalse <= VAR_flip_x_MUX_uxn_device_h_l106_c7_97b2_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l106_c7_97b2_return_output := flip_x_MUX_uxn_device_h_l106_c7_97b2_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l94_c3_12f4] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l94_c3_12f4_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_12f4_cond;
     result_device_ram_address_MUX_uxn_device_h_l94_c3_12f4_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_12f4_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l94_c3_12f4_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_12f4_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_12f4_return_output := result_device_ram_address_MUX_uxn_device_h_l94_c3_12f4_return_output;

     -- result_u8_value_MUX[uxn_device_h_l180_c3_431f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l180_c3_431f_cond <= VAR_result_u8_value_MUX_uxn_device_h_l180_c3_431f_cond;
     result_u8_value_MUX_uxn_device_h_l180_c3_431f_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l180_c3_431f_iftrue;
     result_u8_value_MUX_uxn_device_h_l180_c3_431f_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l180_c3_431f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l180_c3_431f_return_output := result_u8_value_MUX_uxn_device_h_l180_c3_431f_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l194_c4_1fab] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l194_c4_1fab_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l194_c4_1fab_cond;
     result_device_ram_address_MUX_uxn_device_h_l194_c4_1fab_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l194_c4_1fab_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l194_c4_1fab_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l194_c4_1fab_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l194_c4_1fab_return_output := result_device_ram_address_MUX_uxn_device_h_l194_c4_1fab_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l163_c4_8d15] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l163_c4_8d15_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l163_c4_8d15_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l163_c4_8d15_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l163_c4_8d15_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l163_c4_8d15_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l163_c4_8d15_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l163_c4_8d15_return_output := result_is_device_ram_write_MUX_uxn_device_h_l163_c4_8d15_return_output;

     -- layer_MUX[uxn_device_h_l106_c7_97b2] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l106_c7_97b2_cond <= VAR_layer_MUX_uxn_device_h_l106_c7_97b2_cond;
     layer_MUX_uxn_device_h_l106_c7_97b2_iftrue <= VAR_layer_MUX_uxn_device_h_l106_c7_97b2_iftrue;
     layer_MUX_uxn_device_h_l106_c7_97b2_iffalse <= VAR_layer_MUX_uxn_device_h_l106_c7_97b2_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l106_c7_97b2_return_output := layer_MUX_uxn_device_h_l106_c7_97b2_return_output;

     -- ram_addr_MUX[uxn_device_h_l193_c3_532b] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l193_c3_532b_cond <= VAR_ram_addr_MUX_uxn_device_h_l193_c3_532b_cond;
     ram_addr_MUX_uxn_device_h_l193_c3_532b_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l193_c3_532b_iftrue;
     ram_addr_MUX_uxn_device_h_l193_c3_532b_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l193_c3_532b_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l193_c3_532b_return_output := ram_addr_MUX_uxn_device_h_l193_c3_532b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l117_c7_c075] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_c075_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_c075_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_c075_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_c075_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_c075_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_c075_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_c075_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_c075_return_output;

     -- is_drawing_port_MUX[uxn_device_h_l88_c2_6371] LATENCY=0
     -- Inputs
     is_drawing_port_MUX_uxn_device_h_l88_c2_6371_cond <= VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_6371_cond;
     is_drawing_port_MUX_uxn_device_h_l88_c2_6371_iftrue <= VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_6371_iftrue;
     is_drawing_port_MUX_uxn_device_h_l88_c2_6371_iffalse <= VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_6371_iffalse;
     -- Outputs
     VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_6371_return_output := is_drawing_port_MUX_uxn_device_h_l88_c2_6371_return_output;

     -- tmp8_MUX[uxn_device_h_l145_c4_f761] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l145_c4_f761_cond <= VAR_tmp8_MUX_uxn_device_h_l145_c4_f761_cond;
     tmp8_MUX_uxn_device_h_l145_c4_f761_iftrue <= VAR_tmp8_MUX_uxn_device_h_l145_c4_f761_iftrue;
     tmp8_MUX_uxn_device_h_l145_c4_f761_iffalse <= VAR_tmp8_MUX_uxn_device_h_l145_c4_f761_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l145_c4_f761_return_output := tmp8_MUX_uxn_device_h_l145_c4_f761_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l163_c4_8d15] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l163_c4_8d15_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l163_c4_8d15_cond;
     result_device_ram_address_MUX_uxn_device_h_l163_c4_8d15_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l163_c4_8d15_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l163_c4_8d15_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l163_c4_8d15_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l163_c4_8d15_return_output := result_device_ram_address_MUX_uxn_device_h_l163_c4_8d15_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l94_c3_12f4] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l94_c3_12f4_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_12f4_cond;
     result_is_deo_done_MUX_uxn_device_h_l94_c3_12f4_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_12f4_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l94_c3_12f4_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_12f4_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_12f4_return_output := result_is_deo_done_MUX_uxn_device_h_l94_c3_12f4_return_output;

     -- y_MUX[uxn_device_h_l138_c3_3093] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l138_c3_3093_cond <= VAR_y_MUX_uxn_device_h_l138_c3_3093_cond;
     y_MUX_uxn_device_h_l138_c3_3093_iftrue <= VAR_y_MUX_uxn_device_h_l138_c3_3093_iftrue;
     y_MUX_uxn_device_h_l138_c3_3093_iffalse <= VAR_y_MUX_uxn_device_h_l138_c3_3093_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l138_c3_3093_return_output := y_MUX_uxn_device_h_l138_c3_3093_return_output;

     -- result_u8_value_MUX[uxn_device_h_l164_c5_ec39] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l164_c5_ec39_cond <= VAR_result_u8_value_MUX_uxn_device_h_l164_c5_ec39_cond;
     result_u8_value_MUX_uxn_device_h_l164_c5_ec39_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l164_c5_ec39_iftrue;
     result_u8_value_MUX_uxn_device_h_l164_c5_ec39_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l164_c5_ec39_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l164_c5_ec39_return_output := result_u8_value_MUX_uxn_device_h_l164_c5_ec39_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l142_c23_d3c0] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l142_c23_d3c0_left <= VAR_BIN_OP_PLUS_uxn_device_h_l142_c23_d3c0_left;
     BIN_OP_PLUS_uxn_device_h_l142_c23_d3c0_right <= VAR_BIN_OP_PLUS_uxn_device_h_l142_c23_d3c0_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l142_c23_d3c0_return_output := BIN_OP_PLUS_uxn_device_h_l142_c23_d3c0_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l180_c3_431f] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l180_c3_431f_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l180_c3_431f_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l180_c3_431f_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l180_c3_431f_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l180_c3_431f_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l180_c3_431f_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l180_c3_431f_return_output := result_is_device_ram_write_MUX_uxn_device_h_l180_c3_431f_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l206_c4_3d77] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l206_c4_3d77_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l206_c4_3d77_cond;
     result_device_ram_address_MUX_uxn_device_h_l206_c4_3d77_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l206_c4_3d77_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l206_c4_3d77_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l206_c4_3d77_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l206_c4_3d77_return_output := result_device_ram_address_MUX_uxn_device_h_l206_c4_3d77_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l180_c3_431f] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l180_c3_431f_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l180_c3_431f_cond;
     result_device_ram_address_MUX_uxn_device_h_l180_c3_431f_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l180_c3_431f_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l180_c3_431f_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l180_c3_431f_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l180_c3_431f_return_output := result_device_ram_address_MUX_uxn_device_h_l180_c3_431f_return_output;

     -- x_MUX[uxn_device_h_l163_c4_8d15] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l163_c4_8d15_cond <= VAR_x_MUX_uxn_device_h_l163_c4_8d15_cond;
     x_MUX_uxn_device_h_l163_c4_8d15_iftrue <= VAR_x_MUX_uxn_device_h_l163_c4_8d15_iftrue;
     x_MUX_uxn_device_h_l163_c4_8d15_iffalse <= VAR_x_MUX_uxn_device_h_l163_c4_8d15_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l163_c4_8d15_return_output := x_MUX_uxn_device_h_l163_c4_8d15_return_output;

     -- ctrl_MUX[uxn_device_h_l88_c2_6371] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l88_c2_6371_cond <= VAR_ctrl_MUX_uxn_device_h_l88_c2_6371_cond;
     ctrl_MUX_uxn_device_h_l88_c2_6371_iftrue <= VAR_ctrl_MUX_uxn_device_h_l88_c2_6371_iftrue;
     ctrl_MUX_uxn_device_h_l88_c2_6371_iffalse <= VAR_ctrl_MUX_uxn_device_h_l88_c2_6371_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l88_c2_6371_return_output := ctrl_MUX_uxn_device_h_l88_c2_6371_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l106_c7_97b2] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l106_c7_97b2_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l106_c7_97b2_cond;
     ctrl_mode_MUX_uxn_device_h_l106_c7_97b2_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l106_c7_97b2_iftrue;
     ctrl_mode_MUX_uxn_device_h_l106_c7_97b2_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l106_c7_97b2_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l106_c7_97b2_return_output := ctrl_mode_MUX_uxn_device_h_l106_c7_97b2_return_output;

     -- flip_y_MUX[uxn_device_h_l106_c7_97b2] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l106_c7_97b2_cond <= VAR_flip_y_MUX_uxn_device_h_l106_c7_97b2_cond;
     flip_y_MUX_uxn_device_h_l106_c7_97b2_iftrue <= VAR_flip_y_MUX_uxn_device_h_l106_c7_97b2_iftrue;
     flip_y_MUX_uxn_device_h_l106_c7_97b2_iffalse <= VAR_flip_y_MUX_uxn_device_h_l106_c7_97b2_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l106_c7_97b2_return_output := flip_y_MUX_uxn_device_h_l106_c7_97b2_return_output;

     -- result_u8_value_MUX[uxn_device_h_l206_c4_3d77] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l206_c4_3d77_cond <= VAR_result_u8_value_MUX_uxn_device_h_l206_c4_3d77_cond;
     result_u8_value_MUX_uxn_device_h_l206_c4_3d77_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l206_c4_3d77_iftrue;
     result_u8_value_MUX_uxn_device_h_l206_c4_3d77_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l206_c4_3d77_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l206_c4_3d77_return_output := result_u8_value_MUX_uxn_device_h_l206_c4_3d77_return_output;

     -- ram_addr_MUX[uxn_device_h_l180_c3_431f] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l180_c3_431f_cond <= VAR_ram_addr_MUX_uxn_device_h_l180_c3_431f_cond;
     ram_addr_MUX_uxn_device_h_l180_c3_431f_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l180_c3_431f_iftrue;
     ram_addr_MUX_uxn_device_h_l180_c3_431f_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l180_c3_431f_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l180_c3_431f_return_output := ram_addr_MUX_uxn_device_h_l180_c3_431f_return_output;

     -- color_MUX[uxn_device_h_l101_c7_1756] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l101_c7_1756_cond <= VAR_color_MUX_uxn_device_h_l101_c7_1756_cond;
     color_MUX_uxn_device_h_l101_c7_1756_iftrue <= VAR_color_MUX_uxn_device_h_l101_c7_1756_iftrue;
     color_MUX_uxn_device_h_l101_c7_1756_iffalse <= VAR_color_MUX_uxn_device_h_l101_c7_1756_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l101_c7_1756_return_output := color_MUX_uxn_device_h_l101_c7_1756_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l206_c4_3d77] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l206_c4_3d77_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l206_c4_3d77_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l206_c4_3d77_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l206_c4_3d77_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l206_c4_3d77_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l206_c4_3d77_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l206_c4_3d77_return_output := result_is_device_ram_write_MUX_uxn_device_h_l206_c4_3d77_return_output;

     -- auto_advance_MUX[uxn_device_h_l137_c7_1fcf] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l137_c7_1fcf_cond <= VAR_auto_advance_MUX_uxn_device_h_l137_c7_1fcf_cond;
     auto_advance_MUX_uxn_device_h_l137_c7_1fcf_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l137_c7_1fcf_iftrue;
     auto_advance_MUX_uxn_device_h_l137_c7_1fcf_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l137_c7_1fcf_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l137_c7_1fcf_return_output := auto_advance_MUX_uxn_device_h_l137_c7_1fcf_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l194_c4_1fab] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l194_c4_1fab_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l194_c4_1fab_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l194_c4_1fab_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l194_c4_1fab_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l194_c4_1fab_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l194_c4_1fab_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l194_c4_1fab_return_output := result_is_device_ram_write_MUX_uxn_device_h_l194_c4_1fab_return_output;

     -- result_u8_value_MUX[uxn_device_h_l194_c4_1fab] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l194_c4_1fab_cond <= VAR_result_u8_value_MUX_uxn_device_h_l194_c4_1fab_cond;
     result_u8_value_MUX_uxn_device_h_l194_c4_1fab_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l194_c4_1fab_iftrue;
     result_u8_value_MUX_uxn_device_h_l194_c4_1fab_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l194_c4_1fab_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l194_c4_1fab_return_output := result_u8_value_MUX_uxn_device_h_l194_c4_1fab_return_output;

     -- Submodule level 4
     VAR_result_u16_addr_uxn_device_h_l142_c4_d936 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l142_c23_d3c0_return_output, 16);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_63d6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_c075_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l130_c7_7bb6_iffalse := VAR_auto_advance_MUX_uxn_device_h_l137_c7_1fcf_return_output;
     VAR_color_MUX_uxn_device_h_l88_c2_6371_iffalse := VAR_color_MUX_uxn_device_h_l101_c7_1756_return_output;
     REG_VAR_ctrl := VAR_ctrl_MUX_uxn_device_h_l88_c2_6371_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_1756_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l106_c7_97b2_return_output;
     VAR_flip_x_MUX_uxn_device_h_l101_c7_1756_iffalse := VAR_flip_x_MUX_uxn_device_h_l106_c7_97b2_return_output;
     VAR_flip_y_MUX_uxn_device_h_l101_c7_1756_iffalse := VAR_flip_y_MUX_uxn_device_h_l106_c7_97b2_return_output;
     REG_VAR_is_drawing_port := VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_6371_return_output;
     VAR_layer_MUX_uxn_device_h_l101_c7_1756_iffalse := VAR_layer_MUX_uxn_device_h_l106_c7_97b2_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l179_c7_23a6_iftrue := VAR_ram_addr_MUX_uxn_device_h_l180_c3_431f_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l192_c7_f8ff_iftrue := VAR_ram_addr_MUX_uxn_device_h_l193_c3_532b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l158_c3_2a1e_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l163_c4_8d15_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l193_c3_532b_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l194_c4_1fab_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l205_c3_0106_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l206_c4_3d77_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l158_c3_2a1e_iftrue := VAR_result_is_device_ram_write_MUX_uxn_device_h_l163_c4_8d15_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c3_532b_iftrue := VAR_result_is_device_ram_write_MUX_uxn_device_h_l194_c4_1fab_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l205_c3_0106_iftrue := VAR_result_is_device_ram_write_MUX_uxn_device_h_l206_c4_3d77_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l163_c4_8d15_iftrue := VAR_result_u8_value_MUX_uxn_device_h_l164_c5_ec39_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l193_c3_532b_iftrue := VAR_result_u8_value_MUX_uxn_device_h_l194_c4_1fab_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l205_c3_0106_iftrue := VAR_result_u8_value_MUX_uxn_device_h_l206_c4_3d77_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l138_c3_3093_iftrue := VAR_tmp8_MUX_uxn_device_h_l145_c4_f761_return_output;
     VAR_tmp8_MUX_uxn_device_h_l138_c3_3093_iftrue := VAR_tmp8_MUX_uxn_device_h_l145_c4_f761_return_output;
     VAR_x_MUX_uxn_device_h_l158_c3_2a1e_iftrue := VAR_x_MUX_uxn_device_h_l163_c4_8d15_return_output;
     VAR_y_MUX_uxn_device_h_l137_c7_1fcf_iftrue := VAR_y_MUX_uxn_device_h_l138_c3_3093_return_output;
     VAR_result_u16_addr_MUX_uxn_device_h_l138_c3_3093_iftrue := VAR_result_u16_addr_uxn_device_h_l142_c4_d936;
     -- result_device_ram_address_MUX[uxn_device_h_l158_c3_2a1e] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l158_c3_2a1e_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l158_c3_2a1e_cond;
     result_device_ram_address_MUX_uxn_device_h_l158_c3_2a1e_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l158_c3_2a1e_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l158_c3_2a1e_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l158_c3_2a1e_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l158_c3_2a1e_return_output := result_device_ram_address_MUX_uxn_device_h_l158_c3_2a1e_return_output;

     -- color_MUX[uxn_device_h_l88_c2_6371] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l88_c2_6371_cond <= VAR_color_MUX_uxn_device_h_l88_c2_6371_cond;
     color_MUX_uxn_device_h_l88_c2_6371_iftrue <= VAR_color_MUX_uxn_device_h_l88_c2_6371_iftrue;
     color_MUX_uxn_device_h_l88_c2_6371_iffalse <= VAR_color_MUX_uxn_device_h_l88_c2_6371_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l88_c2_6371_return_output := color_MUX_uxn_device_h_l88_c2_6371_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l158_c3_2a1e] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l158_c3_2a1e_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l158_c3_2a1e_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l158_c3_2a1e_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l158_c3_2a1e_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l158_c3_2a1e_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l158_c3_2a1e_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l158_c3_2a1e_return_output := result_is_device_ram_write_MUX_uxn_device_h_l158_c3_2a1e_return_output;

     -- flip_y_MUX[uxn_device_h_l101_c7_1756] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l101_c7_1756_cond <= VAR_flip_y_MUX_uxn_device_h_l101_c7_1756_cond;
     flip_y_MUX_uxn_device_h_l101_c7_1756_iftrue <= VAR_flip_y_MUX_uxn_device_h_l101_c7_1756_iftrue;
     flip_y_MUX_uxn_device_h_l101_c7_1756_iffalse <= VAR_flip_y_MUX_uxn_device_h_l101_c7_1756_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l101_c7_1756_return_output := flip_y_MUX_uxn_device_h_l101_c7_1756_return_output;

     -- x_MUX[uxn_device_h_l158_c3_2a1e] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l158_c3_2a1e_cond <= VAR_x_MUX_uxn_device_h_l158_c3_2a1e_cond;
     x_MUX_uxn_device_h_l158_c3_2a1e_iftrue <= VAR_x_MUX_uxn_device_h_l158_c3_2a1e_iftrue;
     x_MUX_uxn_device_h_l158_c3_2a1e_iffalse <= VAR_x_MUX_uxn_device_h_l158_c3_2a1e_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l158_c3_2a1e_return_output := x_MUX_uxn_device_h_l158_c3_2a1e_return_output;

     -- layer_MUX[uxn_device_h_l101_c7_1756] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l101_c7_1756_cond <= VAR_layer_MUX_uxn_device_h_l101_c7_1756_cond;
     layer_MUX_uxn_device_h_l101_c7_1756_iftrue <= VAR_layer_MUX_uxn_device_h_l101_c7_1756_iftrue;
     layer_MUX_uxn_device_h_l101_c7_1756_iffalse <= VAR_layer_MUX_uxn_device_h_l101_c7_1756_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l101_c7_1756_return_output := layer_MUX_uxn_device_h_l101_c7_1756_return_output;

     -- result_u8_value_MUX[uxn_device_h_l193_c3_532b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l193_c3_532b_cond <= VAR_result_u8_value_MUX_uxn_device_h_l193_c3_532b_cond;
     result_u8_value_MUX_uxn_device_h_l193_c3_532b_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l193_c3_532b_iftrue;
     result_u8_value_MUX_uxn_device_h_l193_c3_532b_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l193_c3_532b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l193_c3_532b_return_output := result_u8_value_MUX_uxn_device_h_l193_c3_532b_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_96e4[uxn_device_h_l179_c7_23a6] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_96e4_uxn_device_h_l179_c7_23a6_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_96e4(
     result,
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l180_c3_431f_return_output,
     VAR_result_u8_value_MUX_uxn_device_h_l180_c3_431f_return_output,
     VAR_result_device_ram_address_MUX_uxn_device_h_l180_c3_431f_return_output);

     -- result_u8_value_MUX[uxn_device_h_l163_c4_8d15] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l163_c4_8d15_cond <= VAR_result_u8_value_MUX_uxn_device_h_l163_c4_8d15_cond;
     result_u8_value_MUX_uxn_device_h_l163_c4_8d15_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l163_c4_8d15_iftrue;
     result_u8_value_MUX_uxn_device_h_l163_c4_8d15_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l163_c4_8d15_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l163_c4_8d15_return_output := result_u8_value_MUX_uxn_device_h_l163_c4_8d15_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l193_c3_532b] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l193_c3_532b_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l193_c3_532b_cond;
     result_device_ram_address_MUX_uxn_device_h_l193_c3_532b_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l193_c3_532b_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l193_c3_532b_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l193_c3_532b_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l193_c3_532b_return_output := result_device_ram_address_MUX_uxn_device_h_l193_c3_532b_return_output;

     -- ram_addr_MUX[uxn_device_h_l192_c7_f8ff] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l192_c7_f8ff_cond <= VAR_ram_addr_MUX_uxn_device_h_l192_c7_f8ff_cond;
     ram_addr_MUX_uxn_device_h_l192_c7_f8ff_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l192_c7_f8ff_iftrue;
     ram_addr_MUX_uxn_device_h_l192_c7_f8ff_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l192_c7_f8ff_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l192_c7_f8ff_return_output := ram_addr_MUX_uxn_device_h_l192_c7_f8ff_return_output;

     -- flip_x_MUX[uxn_device_h_l101_c7_1756] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l101_c7_1756_cond <= VAR_flip_x_MUX_uxn_device_h_l101_c7_1756_cond;
     flip_x_MUX_uxn_device_h_l101_c7_1756_iftrue <= VAR_flip_x_MUX_uxn_device_h_l101_c7_1756_iftrue;
     flip_x_MUX_uxn_device_h_l101_c7_1756_iffalse <= VAR_flip_x_MUX_uxn_device_h_l101_c7_1756_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l101_c7_1756_return_output := flip_x_MUX_uxn_device_h_l101_c7_1756_return_output;

     -- result_u16_addr_MUX[uxn_device_h_l138_c3_3093] LATENCY=0
     -- Inputs
     result_u16_addr_MUX_uxn_device_h_l138_c3_3093_cond <= VAR_result_u16_addr_MUX_uxn_device_h_l138_c3_3093_cond;
     result_u16_addr_MUX_uxn_device_h_l138_c3_3093_iftrue <= VAR_result_u16_addr_MUX_uxn_device_h_l138_c3_3093_iftrue;
     result_u16_addr_MUX_uxn_device_h_l138_c3_3093_iffalse <= VAR_result_u16_addr_MUX_uxn_device_h_l138_c3_3093_iffalse;
     -- Outputs
     VAR_result_u16_addr_MUX_uxn_device_h_l138_c3_3093_return_output := result_u16_addr_MUX_uxn_device_h_l138_c3_3093_return_output;

     -- y_MUX[uxn_device_h_l137_c7_1fcf] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l137_c7_1fcf_cond <= VAR_y_MUX_uxn_device_h_l137_c7_1fcf_cond;
     y_MUX_uxn_device_h_l137_c7_1fcf_iftrue <= VAR_y_MUX_uxn_device_h_l137_c7_1fcf_iftrue;
     y_MUX_uxn_device_h_l137_c7_1fcf_iffalse <= VAR_y_MUX_uxn_device_h_l137_c7_1fcf_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l137_c7_1fcf_return_output := y_MUX_uxn_device_h_l137_c7_1fcf_return_output;

     -- result_u8_value_MUX[uxn_device_h_l205_c3_0106] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l205_c3_0106_cond <= VAR_result_u8_value_MUX_uxn_device_h_l205_c3_0106_cond;
     result_u8_value_MUX_uxn_device_h_l205_c3_0106_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l205_c3_0106_iftrue;
     result_u8_value_MUX_uxn_device_h_l205_c3_0106_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l205_c3_0106_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l205_c3_0106_return_output := result_u8_value_MUX_uxn_device_h_l205_c3_0106_return_output;

     -- tmp8_MUX[uxn_device_h_l138_c3_3093] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l138_c3_3093_cond <= VAR_tmp8_MUX_uxn_device_h_l138_c3_3093_cond;
     tmp8_MUX_uxn_device_h_l138_c3_3093_iftrue <= VAR_tmp8_MUX_uxn_device_h_l138_c3_3093_iftrue;
     tmp8_MUX_uxn_device_h_l138_c3_3093_iffalse <= VAR_tmp8_MUX_uxn_device_h_l138_c3_3093_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l138_c3_3093_return_output := tmp8_MUX_uxn_device_h_l138_c3_3093_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l205_c3_0106] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l205_c3_0106_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l205_c3_0106_cond;
     result_device_ram_address_MUX_uxn_device_h_l205_c3_0106_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l205_c3_0106_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l205_c3_0106_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l205_c3_0106_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l205_c3_0106_return_output := result_device_ram_address_MUX_uxn_device_h_l205_c3_0106_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l205_c3_0106] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l205_c3_0106_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l205_c3_0106_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l205_c3_0106_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l205_c3_0106_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l205_c3_0106_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l205_c3_0106_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l205_c3_0106_return_output := result_is_device_ram_write_MUX_uxn_device_h_l205_c3_0106_return_output;

     -- auto_advance_MUX[uxn_device_h_l130_c7_7bb6] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l130_c7_7bb6_cond <= VAR_auto_advance_MUX_uxn_device_h_l130_c7_7bb6_cond;
     auto_advance_MUX_uxn_device_h_l130_c7_7bb6_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l130_c7_7bb6_iftrue;
     auto_advance_MUX_uxn_device_h_l130_c7_7bb6_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l130_c7_7bb6_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l130_c7_7bb6_return_output := auto_advance_MUX_uxn_device_h_l130_c7_7bb6_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l101_c7_1756] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l101_c7_1756_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_1756_cond;
     ctrl_mode_MUX_uxn_device_h_l101_c7_1756_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_1756_iftrue;
     ctrl_mode_MUX_uxn_device_h_l101_c7_1756_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_1756_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_1756_return_output := ctrl_mode_MUX_uxn_device_h_l101_c7_1756_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l193_c3_532b] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l193_c3_532b_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c3_532b_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l193_c3_532b_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c3_532b_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l193_c3_532b_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c3_532b_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c3_532b_return_output := result_is_device_ram_write_MUX_uxn_device_h_l193_c3_532b_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_34f0[uxn_device_h_l88_c2_6371] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_34f0_uxn_device_h_l88_c2_6371_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_34f0(
     result,
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_12f4_return_output,
     VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_12f4_return_output);

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l124_c7_63d6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_63d6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_63d6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_63d6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_63d6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_63d6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_63d6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_63d6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_63d6_return_output;

     -- result_u8_value_MUX[uxn_device_h_l138_c3_3093] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l138_c3_3093_cond <= VAR_result_u8_value_MUX_uxn_device_h_l138_c3_3093_cond;
     result_u8_value_MUX_uxn_device_h_l138_c3_3093_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l138_c3_3093_iftrue;
     result_u8_value_MUX_uxn_device_h_l138_c3_3093_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l138_c3_3093_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l138_c3_3093_return_output := result_u8_value_MUX_uxn_device_h_l138_c3_3093_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_7bb6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_63d6_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l124_c7_63d6_iffalse := VAR_auto_advance_MUX_uxn_device_h_l130_c7_7bb6_return_output;
     REG_VAR_color := VAR_color_MUX_uxn_device_h_l88_c2_6371_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_6371_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_1756_return_output;
     VAR_flip_x_MUX_uxn_device_h_l88_c2_6371_iffalse := VAR_flip_x_MUX_uxn_device_h_l101_c7_1756_return_output;
     VAR_flip_y_MUX_uxn_device_h_l88_c2_6371_iffalse := VAR_flip_y_MUX_uxn_device_h_l101_c7_1756_return_output;
     VAR_layer_MUX_uxn_device_h_l88_c2_6371_iffalse := VAR_layer_MUX_uxn_device_h_l101_c7_1756_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l179_c7_23a6_iffalse := VAR_ram_addr_MUX_uxn_device_h_l192_c7_f8ff_return_output;
     VAR_result_MUX_uxn_device_h_l88_c2_6371_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_34f0_uxn_device_h_l88_c2_6371_return_output;
     VAR_result_MUX_uxn_device_h_l179_c7_23a6_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_96e4_uxn_device_h_l179_c7_23a6_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l158_c3_2a1e_iftrue := VAR_result_u8_value_MUX_uxn_device_h_l163_c4_8d15_return_output;
     VAR_tmp8_MUX_uxn_device_h_l137_c7_1fcf_iftrue := VAR_tmp8_MUX_uxn_device_h_l138_c3_3093_return_output;
     VAR_x_MUX_uxn_device_h_l157_c7_8256_iftrue := VAR_x_MUX_uxn_device_h_l158_c3_2a1e_return_output;
     VAR_y_MUX_uxn_device_h_l130_c7_7bb6_iffalse := VAR_y_MUX_uxn_device_h_l137_c7_1fcf_return_output;
     -- tmp8_MUX[uxn_device_h_l137_c7_1fcf] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l137_c7_1fcf_cond <= VAR_tmp8_MUX_uxn_device_h_l137_c7_1fcf_cond;
     tmp8_MUX_uxn_device_h_l137_c7_1fcf_iftrue <= VAR_tmp8_MUX_uxn_device_h_l137_c7_1fcf_iftrue;
     tmp8_MUX_uxn_device_h_l137_c7_1fcf_iffalse <= VAR_tmp8_MUX_uxn_device_h_l137_c7_1fcf_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l137_c7_1fcf_return_output := tmp8_MUX_uxn_device_h_l137_c7_1fcf_return_output;

     -- y_MUX[uxn_device_h_l130_c7_7bb6] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l130_c7_7bb6_cond <= VAR_y_MUX_uxn_device_h_l130_c7_7bb6_cond;
     y_MUX_uxn_device_h_l130_c7_7bb6_iftrue <= VAR_y_MUX_uxn_device_h_l130_c7_7bb6_iftrue;
     y_MUX_uxn_device_h_l130_c7_7bb6_iffalse <= VAR_y_MUX_uxn_device_h_l130_c7_7bb6_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l130_c7_7bb6_return_output := y_MUX_uxn_device_h_l130_c7_7bb6_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l130_c7_7bb6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_7bb6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_7bb6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_7bb6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_7bb6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_7bb6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_7bb6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_7bb6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_7bb6_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l88_c2_6371] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l88_c2_6371_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_6371_cond;
     ctrl_mode_MUX_uxn_device_h_l88_c2_6371_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_6371_iftrue;
     ctrl_mode_MUX_uxn_device_h_l88_c2_6371_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_6371_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_6371_return_output := ctrl_mode_MUX_uxn_device_h_l88_c2_6371_return_output;

     -- x_MUX[uxn_device_h_l157_c7_8256] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l157_c7_8256_cond <= VAR_x_MUX_uxn_device_h_l157_c7_8256_cond;
     x_MUX_uxn_device_h_l157_c7_8256_iftrue <= VAR_x_MUX_uxn_device_h_l157_c7_8256_iftrue;
     x_MUX_uxn_device_h_l157_c7_8256_iffalse <= VAR_x_MUX_uxn_device_h_l157_c7_8256_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l157_c7_8256_return_output := x_MUX_uxn_device_h_l157_c7_8256_return_output;

     -- flip_y_MUX[uxn_device_h_l88_c2_6371] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l88_c2_6371_cond <= VAR_flip_y_MUX_uxn_device_h_l88_c2_6371_cond;
     flip_y_MUX_uxn_device_h_l88_c2_6371_iftrue <= VAR_flip_y_MUX_uxn_device_h_l88_c2_6371_iftrue;
     flip_y_MUX_uxn_device_h_l88_c2_6371_iffalse <= VAR_flip_y_MUX_uxn_device_h_l88_c2_6371_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l88_c2_6371_return_output := flip_y_MUX_uxn_device_h_l88_c2_6371_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_96e4[uxn_device_h_l204_c7_8d42] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_96e4_uxn_device_h_l204_c7_8d42_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_96e4(
     result,
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l205_c3_0106_return_output,
     VAR_result_u8_value_MUX_uxn_device_h_l205_c3_0106_return_output,
     VAR_result_device_ram_address_MUX_uxn_device_h_l205_c3_0106_return_output);

     -- result_u8_value_MUX[uxn_device_h_l158_c3_2a1e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l158_c3_2a1e_cond <= VAR_result_u8_value_MUX_uxn_device_h_l158_c3_2a1e_cond;
     result_u8_value_MUX_uxn_device_h_l158_c3_2a1e_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l158_c3_2a1e_iftrue;
     result_u8_value_MUX_uxn_device_h_l158_c3_2a1e_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l158_c3_2a1e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l158_c3_2a1e_return_output := result_u8_value_MUX_uxn_device_h_l158_c3_2a1e_return_output;

     -- auto_advance_MUX[uxn_device_h_l124_c7_63d6] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l124_c7_63d6_cond <= VAR_auto_advance_MUX_uxn_device_h_l124_c7_63d6_cond;
     auto_advance_MUX_uxn_device_h_l124_c7_63d6_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l124_c7_63d6_iftrue;
     auto_advance_MUX_uxn_device_h_l124_c7_63d6_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l124_c7_63d6_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l124_c7_63d6_return_output := auto_advance_MUX_uxn_device_h_l124_c7_63d6_return_output;

     -- layer_MUX[uxn_device_h_l88_c2_6371] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l88_c2_6371_cond <= VAR_layer_MUX_uxn_device_h_l88_c2_6371_cond;
     layer_MUX_uxn_device_h_l88_c2_6371_iftrue <= VAR_layer_MUX_uxn_device_h_l88_c2_6371_iftrue;
     layer_MUX_uxn_device_h_l88_c2_6371_iffalse <= VAR_layer_MUX_uxn_device_h_l88_c2_6371_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l88_c2_6371_return_output := layer_MUX_uxn_device_h_l88_c2_6371_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_8eaa[uxn_device_h_l137_c7_1fcf] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_8eaa_uxn_device_h_l137_c7_1fcf_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_8eaa(
     result,
     VAR_result_u8_value_MUX_uxn_device_h_l138_c3_3093_return_output,
     VAR_result_device_ram_address_MUX_uxn_device_h_l138_c3_3093_return_output,
     VAR_result_vram_write_layer_MUX_uxn_device_h_l138_c3_3093_return_output,
     VAR_result_is_vram_write_MUX_uxn_device_h_l138_c3_3093_return_output,
     VAR_result_u16_addr_MUX_uxn_device_h_l138_c3_3093_return_output);

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_96e4[uxn_device_h_l192_c7_f8ff] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_96e4_uxn_device_h_l192_c7_f8ff_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_96e4(
     result,
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c3_532b_return_output,
     VAR_result_u8_value_MUX_uxn_device_h_l193_c3_532b_return_output,
     VAR_result_device_ram_address_MUX_uxn_device_h_l193_c3_532b_return_output);

     -- flip_x_MUX[uxn_device_h_l88_c2_6371] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l88_c2_6371_cond <= VAR_flip_x_MUX_uxn_device_h_l88_c2_6371_cond;
     flip_x_MUX_uxn_device_h_l88_c2_6371_iftrue <= VAR_flip_x_MUX_uxn_device_h_l88_c2_6371_iftrue;
     flip_x_MUX_uxn_device_h_l88_c2_6371_iffalse <= VAR_flip_x_MUX_uxn_device_h_l88_c2_6371_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l88_c2_6371_return_output := flip_x_MUX_uxn_device_h_l88_c2_6371_return_output;

     -- ram_addr_MUX[uxn_device_h_l179_c7_23a6] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l179_c7_23a6_cond <= VAR_ram_addr_MUX_uxn_device_h_l179_c7_23a6_cond;
     ram_addr_MUX_uxn_device_h_l179_c7_23a6_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l179_c7_23a6_iftrue;
     ram_addr_MUX_uxn_device_h_l179_c7_23a6_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l179_c7_23a6_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l179_c7_23a6_return_output := ram_addr_MUX_uxn_device_h_l179_c7_23a6_return_output;

     -- Submodule level 6
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_1fcf_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_7bb6_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l117_c7_c075_iffalse := VAR_auto_advance_MUX_uxn_device_h_l124_c7_63d6_return_output;
     REG_VAR_ctrl_mode := VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_6371_return_output;
     REG_VAR_flip_x := VAR_flip_x_MUX_uxn_device_h_l88_c2_6371_return_output;
     REG_VAR_flip_y := VAR_flip_y_MUX_uxn_device_h_l88_c2_6371_return_output;
     REG_VAR_layer := VAR_layer_MUX_uxn_device_h_l88_c2_6371_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l157_c7_8256_iffalse := VAR_ram_addr_MUX_uxn_device_h_l179_c7_23a6_return_output;
     VAR_result_MUX_uxn_device_h_l137_c7_1fcf_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_8eaa_uxn_device_h_l137_c7_1fcf_return_output;
     VAR_result_MUX_uxn_device_h_l192_c7_f8ff_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_96e4_uxn_device_h_l192_c7_f8ff_return_output;
     VAR_result_MUX_uxn_device_h_l204_c7_8d42_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_96e4_uxn_device_h_l204_c7_8d42_return_output;
     VAR_tmp8_MUX_uxn_device_h_l130_c7_7bb6_iffalse := VAR_tmp8_MUX_uxn_device_h_l137_c7_1fcf_return_output;
     VAR_x_MUX_uxn_device_h_l137_c7_1fcf_iffalse := VAR_x_MUX_uxn_device_h_l157_c7_8256_return_output;
     VAR_y_MUX_uxn_device_h_l124_c7_63d6_iffalse := VAR_y_MUX_uxn_device_h_l130_c7_7bb6_return_output;
     -- auto_advance_MUX[uxn_device_h_l117_c7_c075] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l117_c7_c075_cond <= VAR_auto_advance_MUX_uxn_device_h_l117_c7_c075_cond;
     auto_advance_MUX_uxn_device_h_l117_c7_c075_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l117_c7_c075_iftrue;
     auto_advance_MUX_uxn_device_h_l117_c7_c075_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l117_c7_c075_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l117_c7_c075_return_output := auto_advance_MUX_uxn_device_h_l117_c7_c075_return_output;

     -- x_MUX[uxn_device_h_l137_c7_1fcf] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l137_c7_1fcf_cond <= VAR_x_MUX_uxn_device_h_l137_c7_1fcf_cond;
     x_MUX_uxn_device_h_l137_c7_1fcf_iftrue <= VAR_x_MUX_uxn_device_h_l137_c7_1fcf_iftrue;
     x_MUX_uxn_device_h_l137_c7_1fcf_iffalse <= VAR_x_MUX_uxn_device_h_l137_c7_1fcf_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l137_c7_1fcf_return_output := x_MUX_uxn_device_h_l137_c7_1fcf_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_df12[uxn_device_h_l157_c7_8256] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_df12_uxn_device_h_l157_c7_8256_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_df12(
     result,
     VAR_result_u8_value_MUX_uxn_device_h_l158_c3_2a1e_return_output,
     VAR_result_device_ram_address_MUX_uxn_device_h_l158_c3_2a1e_return_output,
     VAR_result_is_deo_done_MUX_uxn_device_h_l158_c3_2a1e_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l158_c3_2a1e_return_output,
     VAR_result_is_vram_write_MUX_uxn_device_h_l158_c3_2a1e_return_output,
     VAR_result_u16_addr_MUX_uxn_device_h_l158_c3_2a1e_return_output);

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l137_c7_1fcf] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_1fcf_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_1fcf_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_1fcf_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_1fcf_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_1fcf_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_1fcf_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_1fcf_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_1fcf_return_output;

     -- ram_addr_MUX[uxn_device_h_l157_c7_8256] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l157_c7_8256_cond <= VAR_ram_addr_MUX_uxn_device_h_l157_c7_8256_cond;
     ram_addr_MUX_uxn_device_h_l157_c7_8256_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l157_c7_8256_iftrue;
     ram_addr_MUX_uxn_device_h_l157_c7_8256_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l157_c7_8256_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l157_c7_8256_return_output := ram_addr_MUX_uxn_device_h_l157_c7_8256_return_output;

     -- y_MUX[uxn_device_h_l124_c7_63d6] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l124_c7_63d6_cond <= VAR_y_MUX_uxn_device_h_l124_c7_63d6_cond;
     y_MUX_uxn_device_h_l124_c7_63d6_iftrue <= VAR_y_MUX_uxn_device_h_l124_c7_63d6_iftrue;
     y_MUX_uxn_device_h_l124_c7_63d6_iffalse <= VAR_y_MUX_uxn_device_h_l124_c7_63d6_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l124_c7_63d6_return_output := y_MUX_uxn_device_h_l124_c7_63d6_return_output;

     -- tmp8_MUX[uxn_device_h_l130_c7_7bb6] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l130_c7_7bb6_cond <= VAR_tmp8_MUX_uxn_device_h_l130_c7_7bb6_cond;
     tmp8_MUX_uxn_device_h_l130_c7_7bb6_iftrue <= VAR_tmp8_MUX_uxn_device_h_l130_c7_7bb6_iftrue;
     tmp8_MUX_uxn_device_h_l130_c7_7bb6_iffalse <= VAR_tmp8_MUX_uxn_device_h_l130_c7_7bb6_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l130_c7_7bb6_return_output := tmp8_MUX_uxn_device_h_l130_c7_7bb6_return_output;

     -- Submodule level 7
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l157_c7_8256_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_1fcf_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l106_c7_97b2_iffalse := VAR_auto_advance_MUX_uxn_device_h_l117_c7_c075_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l137_c7_1fcf_iffalse := VAR_ram_addr_MUX_uxn_device_h_l157_c7_8256_return_output;
     VAR_result_MUX_uxn_device_h_l157_c7_8256_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_df12_uxn_device_h_l157_c7_8256_return_output;
     VAR_tmp8_MUX_uxn_device_h_l124_c7_63d6_iffalse := VAR_tmp8_MUX_uxn_device_h_l130_c7_7bb6_return_output;
     VAR_x_MUX_uxn_device_h_l130_c7_7bb6_iffalse := VAR_x_MUX_uxn_device_h_l137_c7_1fcf_return_output;
     VAR_y_MUX_uxn_device_h_l117_c7_c075_iffalse := VAR_y_MUX_uxn_device_h_l124_c7_63d6_return_output;
     -- x_MUX[uxn_device_h_l130_c7_7bb6] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l130_c7_7bb6_cond <= VAR_x_MUX_uxn_device_h_l130_c7_7bb6_cond;
     x_MUX_uxn_device_h_l130_c7_7bb6_iftrue <= VAR_x_MUX_uxn_device_h_l130_c7_7bb6_iftrue;
     x_MUX_uxn_device_h_l130_c7_7bb6_iffalse <= VAR_x_MUX_uxn_device_h_l130_c7_7bb6_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l130_c7_7bb6_return_output := x_MUX_uxn_device_h_l130_c7_7bb6_return_output;

     -- auto_advance_MUX[uxn_device_h_l106_c7_97b2] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l106_c7_97b2_cond <= VAR_auto_advance_MUX_uxn_device_h_l106_c7_97b2_cond;
     auto_advance_MUX_uxn_device_h_l106_c7_97b2_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l106_c7_97b2_iftrue;
     auto_advance_MUX_uxn_device_h_l106_c7_97b2_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l106_c7_97b2_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l106_c7_97b2_return_output := auto_advance_MUX_uxn_device_h_l106_c7_97b2_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l157_c7_8256] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l157_c7_8256_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l157_c7_8256_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l157_c7_8256_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l157_c7_8256_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l157_c7_8256_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l157_c7_8256_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l157_c7_8256_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l157_c7_8256_return_output;

     -- ram_addr_MUX[uxn_device_h_l137_c7_1fcf] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l137_c7_1fcf_cond <= VAR_ram_addr_MUX_uxn_device_h_l137_c7_1fcf_cond;
     ram_addr_MUX_uxn_device_h_l137_c7_1fcf_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l137_c7_1fcf_iftrue;
     ram_addr_MUX_uxn_device_h_l137_c7_1fcf_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l137_c7_1fcf_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l137_c7_1fcf_return_output := ram_addr_MUX_uxn_device_h_l137_c7_1fcf_return_output;

     -- tmp8_MUX[uxn_device_h_l124_c7_63d6] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l124_c7_63d6_cond <= VAR_tmp8_MUX_uxn_device_h_l124_c7_63d6_cond;
     tmp8_MUX_uxn_device_h_l124_c7_63d6_iftrue <= VAR_tmp8_MUX_uxn_device_h_l124_c7_63d6_iftrue;
     tmp8_MUX_uxn_device_h_l124_c7_63d6_iffalse <= VAR_tmp8_MUX_uxn_device_h_l124_c7_63d6_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l124_c7_63d6_return_output := tmp8_MUX_uxn_device_h_l124_c7_63d6_return_output;

     -- y_MUX[uxn_device_h_l117_c7_c075] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l117_c7_c075_cond <= VAR_y_MUX_uxn_device_h_l117_c7_c075_cond;
     y_MUX_uxn_device_h_l117_c7_c075_iftrue <= VAR_y_MUX_uxn_device_h_l117_c7_c075_iftrue;
     y_MUX_uxn_device_h_l117_c7_c075_iffalse <= VAR_y_MUX_uxn_device_h_l117_c7_c075_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l117_c7_c075_return_output := y_MUX_uxn_device_h_l117_c7_c075_return_output;

     -- Submodule level 8
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l179_c7_23a6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l157_c7_8256_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l101_c7_1756_iffalse := VAR_auto_advance_MUX_uxn_device_h_l106_c7_97b2_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l130_c7_7bb6_iffalse := VAR_ram_addr_MUX_uxn_device_h_l137_c7_1fcf_return_output;
     VAR_tmp8_MUX_uxn_device_h_l117_c7_c075_iffalse := VAR_tmp8_MUX_uxn_device_h_l124_c7_63d6_return_output;
     VAR_x_MUX_uxn_device_h_l124_c7_63d6_iffalse := VAR_x_MUX_uxn_device_h_l130_c7_7bb6_return_output;
     VAR_y_MUX_uxn_device_h_l106_c7_97b2_iffalse := VAR_y_MUX_uxn_device_h_l117_c7_c075_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l179_c7_23a6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l179_c7_23a6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l179_c7_23a6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l179_c7_23a6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l179_c7_23a6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l179_c7_23a6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l179_c7_23a6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l179_c7_23a6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l179_c7_23a6_return_output;

     -- auto_advance_MUX[uxn_device_h_l101_c7_1756] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l101_c7_1756_cond <= VAR_auto_advance_MUX_uxn_device_h_l101_c7_1756_cond;
     auto_advance_MUX_uxn_device_h_l101_c7_1756_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l101_c7_1756_iftrue;
     auto_advance_MUX_uxn_device_h_l101_c7_1756_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l101_c7_1756_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l101_c7_1756_return_output := auto_advance_MUX_uxn_device_h_l101_c7_1756_return_output;

     -- x_MUX[uxn_device_h_l124_c7_63d6] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l124_c7_63d6_cond <= VAR_x_MUX_uxn_device_h_l124_c7_63d6_cond;
     x_MUX_uxn_device_h_l124_c7_63d6_iftrue <= VAR_x_MUX_uxn_device_h_l124_c7_63d6_iftrue;
     x_MUX_uxn_device_h_l124_c7_63d6_iffalse <= VAR_x_MUX_uxn_device_h_l124_c7_63d6_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l124_c7_63d6_return_output := x_MUX_uxn_device_h_l124_c7_63d6_return_output;

     -- ram_addr_MUX[uxn_device_h_l130_c7_7bb6] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l130_c7_7bb6_cond <= VAR_ram_addr_MUX_uxn_device_h_l130_c7_7bb6_cond;
     ram_addr_MUX_uxn_device_h_l130_c7_7bb6_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l130_c7_7bb6_iftrue;
     ram_addr_MUX_uxn_device_h_l130_c7_7bb6_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l130_c7_7bb6_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l130_c7_7bb6_return_output := ram_addr_MUX_uxn_device_h_l130_c7_7bb6_return_output;

     -- y_MUX[uxn_device_h_l106_c7_97b2] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l106_c7_97b2_cond <= VAR_y_MUX_uxn_device_h_l106_c7_97b2_cond;
     y_MUX_uxn_device_h_l106_c7_97b2_iftrue <= VAR_y_MUX_uxn_device_h_l106_c7_97b2_iftrue;
     y_MUX_uxn_device_h_l106_c7_97b2_iffalse <= VAR_y_MUX_uxn_device_h_l106_c7_97b2_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l106_c7_97b2_return_output := y_MUX_uxn_device_h_l106_c7_97b2_return_output;

     -- tmp8_MUX[uxn_device_h_l117_c7_c075] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l117_c7_c075_cond <= VAR_tmp8_MUX_uxn_device_h_l117_c7_c075_cond;
     tmp8_MUX_uxn_device_h_l117_c7_c075_iftrue <= VAR_tmp8_MUX_uxn_device_h_l117_c7_c075_iftrue;
     tmp8_MUX_uxn_device_h_l117_c7_c075_iffalse <= VAR_tmp8_MUX_uxn_device_h_l117_c7_c075_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l117_c7_c075_return_output := tmp8_MUX_uxn_device_h_l117_c7_c075_return_output;

     -- Submodule level 9
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_f8ff_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l179_c7_23a6_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l88_c2_6371_iffalse := VAR_auto_advance_MUX_uxn_device_h_l101_c7_1756_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l124_c7_63d6_iffalse := VAR_ram_addr_MUX_uxn_device_h_l130_c7_7bb6_return_output;
     VAR_tmp8_MUX_uxn_device_h_l106_c7_97b2_iffalse := VAR_tmp8_MUX_uxn_device_h_l117_c7_c075_return_output;
     VAR_x_MUX_uxn_device_h_l117_c7_c075_iffalse := VAR_x_MUX_uxn_device_h_l124_c7_63d6_return_output;
     VAR_y_MUX_uxn_device_h_l101_c7_1756_iffalse := VAR_y_MUX_uxn_device_h_l106_c7_97b2_return_output;
     -- x_MUX[uxn_device_h_l117_c7_c075] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l117_c7_c075_cond <= VAR_x_MUX_uxn_device_h_l117_c7_c075_cond;
     x_MUX_uxn_device_h_l117_c7_c075_iftrue <= VAR_x_MUX_uxn_device_h_l117_c7_c075_iftrue;
     x_MUX_uxn_device_h_l117_c7_c075_iffalse <= VAR_x_MUX_uxn_device_h_l117_c7_c075_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l117_c7_c075_return_output := x_MUX_uxn_device_h_l117_c7_c075_return_output;

     -- y_MUX[uxn_device_h_l101_c7_1756] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l101_c7_1756_cond <= VAR_y_MUX_uxn_device_h_l101_c7_1756_cond;
     y_MUX_uxn_device_h_l101_c7_1756_iftrue <= VAR_y_MUX_uxn_device_h_l101_c7_1756_iftrue;
     y_MUX_uxn_device_h_l101_c7_1756_iffalse <= VAR_y_MUX_uxn_device_h_l101_c7_1756_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l101_c7_1756_return_output := y_MUX_uxn_device_h_l101_c7_1756_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l192_c7_f8ff] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_f8ff_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_f8ff_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_f8ff_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_f8ff_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_f8ff_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_f8ff_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_f8ff_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_f8ff_return_output;

     -- auto_advance_MUX[uxn_device_h_l88_c2_6371] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l88_c2_6371_cond <= VAR_auto_advance_MUX_uxn_device_h_l88_c2_6371_cond;
     auto_advance_MUX_uxn_device_h_l88_c2_6371_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l88_c2_6371_iftrue;
     auto_advance_MUX_uxn_device_h_l88_c2_6371_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l88_c2_6371_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l88_c2_6371_return_output := auto_advance_MUX_uxn_device_h_l88_c2_6371_return_output;

     -- tmp8_MUX[uxn_device_h_l106_c7_97b2] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l106_c7_97b2_cond <= VAR_tmp8_MUX_uxn_device_h_l106_c7_97b2_cond;
     tmp8_MUX_uxn_device_h_l106_c7_97b2_iftrue <= VAR_tmp8_MUX_uxn_device_h_l106_c7_97b2_iftrue;
     tmp8_MUX_uxn_device_h_l106_c7_97b2_iffalse <= VAR_tmp8_MUX_uxn_device_h_l106_c7_97b2_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l106_c7_97b2_return_output := tmp8_MUX_uxn_device_h_l106_c7_97b2_return_output;

     -- ram_addr_MUX[uxn_device_h_l124_c7_63d6] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l124_c7_63d6_cond <= VAR_ram_addr_MUX_uxn_device_h_l124_c7_63d6_cond;
     ram_addr_MUX_uxn_device_h_l124_c7_63d6_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l124_c7_63d6_iftrue;
     ram_addr_MUX_uxn_device_h_l124_c7_63d6_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l124_c7_63d6_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l124_c7_63d6_return_output := ram_addr_MUX_uxn_device_h_l124_c7_63d6_return_output;

     -- Submodule level 10
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c7_8d42_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_f8ff_return_output;
     REG_VAR_auto_advance := VAR_auto_advance_MUX_uxn_device_h_l88_c2_6371_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l117_c7_c075_iffalse := VAR_ram_addr_MUX_uxn_device_h_l124_c7_63d6_return_output;
     VAR_tmp8_MUX_uxn_device_h_l101_c7_1756_iffalse := VAR_tmp8_MUX_uxn_device_h_l106_c7_97b2_return_output;
     VAR_x_MUX_uxn_device_h_l106_c7_97b2_iffalse := VAR_x_MUX_uxn_device_h_l117_c7_c075_return_output;
     VAR_y_MUX_uxn_device_h_l88_c2_6371_iffalse := VAR_y_MUX_uxn_device_h_l101_c7_1756_return_output;
     -- tmp8_MUX[uxn_device_h_l101_c7_1756] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l101_c7_1756_cond <= VAR_tmp8_MUX_uxn_device_h_l101_c7_1756_cond;
     tmp8_MUX_uxn_device_h_l101_c7_1756_iftrue <= VAR_tmp8_MUX_uxn_device_h_l101_c7_1756_iftrue;
     tmp8_MUX_uxn_device_h_l101_c7_1756_iffalse <= VAR_tmp8_MUX_uxn_device_h_l101_c7_1756_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l101_c7_1756_return_output := tmp8_MUX_uxn_device_h_l101_c7_1756_return_output;

     -- y_MUX[uxn_device_h_l88_c2_6371] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l88_c2_6371_cond <= VAR_y_MUX_uxn_device_h_l88_c2_6371_cond;
     y_MUX_uxn_device_h_l88_c2_6371_iftrue <= VAR_y_MUX_uxn_device_h_l88_c2_6371_iftrue;
     y_MUX_uxn_device_h_l88_c2_6371_iffalse <= VAR_y_MUX_uxn_device_h_l88_c2_6371_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l88_c2_6371_return_output := y_MUX_uxn_device_h_l88_c2_6371_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l204_c7_8d42] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c7_8d42_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c7_8d42_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c7_8d42_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c7_8d42_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c7_8d42_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c7_8d42_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c7_8d42_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c7_8d42_return_output;

     -- x_MUX[uxn_device_h_l106_c7_97b2] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l106_c7_97b2_cond <= VAR_x_MUX_uxn_device_h_l106_c7_97b2_cond;
     x_MUX_uxn_device_h_l106_c7_97b2_iftrue <= VAR_x_MUX_uxn_device_h_l106_c7_97b2_iftrue;
     x_MUX_uxn_device_h_l106_c7_97b2_iffalse <= VAR_x_MUX_uxn_device_h_l106_c7_97b2_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l106_c7_97b2_return_output := x_MUX_uxn_device_h_l106_c7_97b2_return_output;

     -- ram_addr_MUX[uxn_device_h_l117_c7_c075] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l117_c7_c075_cond <= VAR_ram_addr_MUX_uxn_device_h_l117_c7_c075_cond;
     ram_addr_MUX_uxn_device_h_l117_c7_c075_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l117_c7_c075_iftrue;
     ram_addr_MUX_uxn_device_h_l117_c7_c075_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l117_c7_c075_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l117_c7_c075_return_output := ram_addr_MUX_uxn_device_h_l117_c7_c075_return_output;

     -- Submodule level 11
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l213_c1_599e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c7_8d42_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l106_c7_97b2_iffalse := VAR_ram_addr_MUX_uxn_device_h_l117_c7_c075_return_output;
     VAR_tmp8_MUX_uxn_device_h_l88_c2_6371_iffalse := VAR_tmp8_MUX_uxn_device_h_l101_c7_1756_return_output;
     VAR_x_MUX_uxn_device_h_l101_c7_1756_iffalse := VAR_x_MUX_uxn_device_h_l106_c7_97b2_return_output;
     REG_VAR_y := VAR_y_MUX_uxn_device_h_l88_c2_6371_return_output;
     -- x_MUX[uxn_device_h_l101_c7_1756] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l101_c7_1756_cond <= VAR_x_MUX_uxn_device_h_l101_c7_1756_cond;
     x_MUX_uxn_device_h_l101_c7_1756_iftrue <= VAR_x_MUX_uxn_device_h_l101_c7_1756_iftrue;
     x_MUX_uxn_device_h_l101_c7_1756_iffalse <= VAR_x_MUX_uxn_device_h_l101_c7_1756_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l101_c7_1756_return_output := x_MUX_uxn_device_h_l101_c7_1756_return_output;

     -- ram_addr_MUX[uxn_device_h_l106_c7_97b2] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l106_c7_97b2_cond <= VAR_ram_addr_MUX_uxn_device_h_l106_c7_97b2_cond;
     ram_addr_MUX_uxn_device_h_l106_c7_97b2_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l106_c7_97b2_iftrue;
     ram_addr_MUX_uxn_device_h_l106_c7_97b2_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l106_c7_97b2_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l106_c7_97b2_return_output := ram_addr_MUX_uxn_device_h_l106_c7_97b2_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l213_c1_599e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l213_c1_599e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l213_c1_599e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l213_c1_599e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l213_c1_599e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l213_c1_599e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l213_c1_599e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l213_c1_599e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l213_c1_599e_return_output;

     -- tmp8_MUX[uxn_device_h_l88_c2_6371] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l88_c2_6371_cond <= VAR_tmp8_MUX_uxn_device_h_l88_c2_6371_cond;
     tmp8_MUX_uxn_device_h_l88_c2_6371_iftrue <= VAR_tmp8_MUX_uxn_device_h_l88_c2_6371_iftrue;
     tmp8_MUX_uxn_device_h_l88_c2_6371_iffalse <= VAR_tmp8_MUX_uxn_device_h_l88_c2_6371_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l88_c2_6371_return_output := tmp8_MUX_uxn_device_h_l88_c2_6371_return_output;

     -- Submodule level 12
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c1_213a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l213_c1_599e_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l101_c7_1756_iffalse := VAR_ram_addr_MUX_uxn_device_h_l106_c7_97b2_return_output;
     REG_VAR_tmp8 := VAR_tmp8_MUX_uxn_device_h_l88_c2_6371_return_output;
     VAR_x_MUX_uxn_device_h_l88_c2_6371_iffalse := VAR_x_MUX_uxn_device_h_l101_c7_1756_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l214_c1_213a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c1_213a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c1_213a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c1_213a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c1_213a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c1_213a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c1_213a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c1_213a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c1_213a_return_output;

     -- x_MUX[uxn_device_h_l88_c2_6371] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l88_c2_6371_cond <= VAR_x_MUX_uxn_device_h_l88_c2_6371_cond;
     x_MUX_uxn_device_h_l88_c2_6371_iftrue <= VAR_x_MUX_uxn_device_h_l88_c2_6371_iftrue;
     x_MUX_uxn_device_h_l88_c2_6371_iffalse <= VAR_x_MUX_uxn_device_h_l88_c2_6371_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l88_c2_6371_return_output := x_MUX_uxn_device_h_l88_c2_6371_return_output;

     -- ram_addr_MUX[uxn_device_h_l101_c7_1756] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l101_c7_1756_cond <= VAR_ram_addr_MUX_uxn_device_h_l101_c7_1756_cond;
     ram_addr_MUX_uxn_device_h_l101_c7_1756_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l101_c7_1756_iftrue;
     ram_addr_MUX_uxn_device_h_l101_c7_1756_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l101_c7_1756_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l101_c7_1756_return_output := ram_addr_MUX_uxn_device_h_l101_c7_1756_return_output;

     -- Submodule level 13
     VAR_screen_blit_uxn_device_h_l215_c46_64ef_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c1_213a_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l88_c2_6371_iffalse := VAR_ram_addr_MUX_uxn_device_h_l101_c7_1756_return_output;
     REG_VAR_x := VAR_x_MUX_uxn_device_h_l88_c2_6371_return_output;
     -- screen_blit[uxn_device_h_l215_c46_64ef] LATENCY=0
     -- Clock enable
     screen_blit_uxn_device_h_l215_c46_64ef_CLOCK_ENABLE <= VAR_screen_blit_uxn_device_h_l215_c46_64ef_CLOCK_ENABLE;
     -- Inputs
     screen_blit_uxn_device_h_l215_c46_64ef_phase <= VAR_screen_blit_uxn_device_h_l215_c46_64ef_phase;
     screen_blit_uxn_device_h_l215_c46_64ef_ctrl <= VAR_screen_blit_uxn_device_h_l215_c46_64ef_ctrl;
     screen_blit_uxn_device_h_l215_c46_64ef_auto_advance <= VAR_screen_blit_uxn_device_h_l215_c46_64ef_auto_advance;
     screen_blit_uxn_device_h_l215_c46_64ef_x <= VAR_screen_blit_uxn_device_h_l215_c46_64ef_x;
     screen_blit_uxn_device_h_l215_c46_64ef_y <= VAR_screen_blit_uxn_device_h_l215_c46_64ef_y;
     screen_blit_uxn_device_h_l215_c46_64ef_ram_addr <= VAR_screen_blit_uxn_device_h_l215_c46_64ef_ram_addr;
     screen_blit_uxn_device_h_l215_c46_64ef_previous_ram_read <= VAR_screen_blit_uxn_device_h_l215_c46_64ef_previous_ram_read;
     -- Outputs
     VAR_screen_blit_uxn_device_h_l215_c46_64ef_return_output := screen_blit_uxn_device_h_l215_c46_64ef_return_output;

     -- ram_addr_MUX[uxn_device_h_l88_c2_6371] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l88_c2_6371_cond <= VAR_ram_addr_MUX_uxn_device_h_l88_c2_6371_cond;
     ram_addr_MUX_uxn_device_h_l88_c2_6371_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l88_c2_6371_iftrue;
     ram_addr_MUX_uxn_device_h_l88_c2_6371_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l88_c2_6371_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l88_c2_6371_return_output := ram_addr_MUX_uxn_device_h_l88_c2_6371_return_output;

     -- Submodule level 14
     REG_VAR_ram_addr := VAR_ram_addr_MUX_uxn_device_h_l88_c2_6371_return_output;
     -- CONST_REF_RD_uint1_t_screen_blit_result_t_vram_write_layer_d41d[uxn_device_h_l220_c30_c147] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_vram_write_layer_d41d_uxn_device_h_l220_c30_c147_return_output := VAR_screen_blit_uxn_device_h_l215_c46_64ef_return_output.vram_write_layer;

     -- CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d[uxn_device_h_l222_c25_594e] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l222_c25_594e_return_output := VAR_screen_blit_uxn_device_h_l215_c46_64ef_return_output.is_blit_done;

     -- CONST_REF_RD_uint16_t_screen_blit_result_t_u16_addr_d41d[uxn_device_h_l219_c22_803b] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_screen_blit_result_t_u16_addr_d41d_uxn_device_h_l219_c22_803b_return_output := VAR_screen_blit_uxn_device_h_l215_c46_64ef_return_output.u16_addr;

     -- CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d[uxn_device_h_l218_c27_1770] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d_uxn_device_h_l218_c27_1770_return_output := VAR_screen_blit_uxn_device_h_l215_c46_64ef_return_output.is_vram_write;

     -- CONST_REF_RD_uint8_t_screen_blit_result_t_u8_value_d41d[uxn_device_h_l221_c22_c130] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_screen_blit_result_t_u8_value_d41d_uxn_device_h_l221_c22_c130_return_output := VAR_screen_blit_uxn_device_h_l215_c46_64ef_return_output.u8_value;

     -- Submodule level 15
     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_a3ba[uxn_device_h_l214_c3_6bd1] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_a3ba_uxn_device_h_l214_c3_6bd1_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_a3ba(
     to_unsigned(0, 1),
     VAR_result_device_ram_address_uxn_device_h_l217_c4_eaa4,
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d_uxn_device_h_l218_c27_1770_return_output,
     VAR_CONST_REF_RD_uint16_t_screen_blit_result_t_u16_addr_d41d_uxn_device_h_l219_c22_803b_return_output,
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_vram_write_layer_d41d_uxn_device_h_l220_c30_c147_return_output,
     VAR_CONST_REF_RD_uint8_t_screen_blit_result_t_u8_value_d41d_uxn_device_h_l221_c22_c130_return_output,
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l222_c25_594e_return_output);

     -- Submodule level 16
     VAR_result_MUX_uxn_device_h_l214_c3_6bd1_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_a3ba_uxn_device_h_l214_c3_6bd1_return_output;
     -- result_MUX[uxn_device_h_l214_c3_6bd1] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l214_c3_6bd1_cond <= VAR_result_MUX_uxn_device_h_l214_c3_6bd1_cond;
     result_MUX_uxn_device_h_l214_c3_6bd1_iftrue <= VAR_result_MUX_uxn_device_h_l214_c3_6bd1_iftrue;
     result_MUX_uxn_device_h_l214_c3_6bd1_iffalse <= VAR_result_MUX_uxn_device_h_l214_c3_6bd1_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l214_c3_6bd1_return_output := result_MUX_uxn_device_h_l214_c3_6bd1_return_output;

     -- Submodule level 17
     VAR_result_MUX_uxn_device_h_l204_c7_8d42_iffalse := VAR_result_MUX_uxn_device_h_l214_c3_6bd1_return_output;
     -- result_MUX[uxn_device_h_l204_c7_8d42] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l204_c7_8d42_cond <= VAR_result_MUX_uxn_device_h_l204_c7_8d42_cond;
     result_MUX_uxn_device_h_l204_c7_8d42_iftrue <= VAR_result_MUX_uxn_device_h_l204_c7_8d42_iftrue;
     result_MUX_uxn_device_h_l204_c7_8d42_iffalse <= VAR_result_MUX_uxn_device_h_l204_c7_8d42_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l204_c7_8d42_return_output := result_MUX_uxn_device_h_l204_c7_8d42_return_output;

     -- Submodule level 18
     VAR_result_MUX_uxn_device_h_l192_c7_f8ff_iffalse := VAR_result_MUX_uxn_device_h_l204_c7_8d42_return_output;
     -- result_MUX[uxn_device_h_l192_c7_f8ff] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l192_c7_f8ff_cond <= VAR_result_MUX_uxn_device_h_l192_c7_f8ff_cond;
     result_MUX_uxn_device_h_l192_c7_f8ff_iftrue <= VAR_result_MUX_uxn_device_h_l192_c7_f8ff_iftrue;
     result_MUX_uxn_device_h_l192_c7_f8ff_iffalse <= VAR_result_MUX_uxn_device_h_l192_c7_f8ff_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l192_c7_f8ff_return_output := result_MUX_uxn_device_h_l192_c7_f8ff_return_output;

     -- Submodule level 19
     VAR_result_MUX_uxn_device_h_l179_c7_23a6_iffalse := VAR_result_MUX_uxn_device_h_l192_c7_f8ff_return_output;
     -- result_MUX[uxn_device_h_l179_c7_23a6] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l179_c7_23a6_cond <= VAR_result_MUX_uxn_device_h_l179_c7_23a6_cond;
     result_MUX_uxn_device_h_l179_c7_23a6_iftrue <= VAR_result_MUX_uxn_device_h_l179_c7_23a6_iftrue;
     result_MUX_uxn_device_h_l179_c7_23a6_iffalse <= VAR_result_MUX_uxn_device_h_l179_c7_23a6_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l179_c7_23a6_return_output := result_MUX_uxn_device_h_l179_c7_23a6_return_output;

     -- Submodule level 20
     VAR_result_MUX_uxn_device_h_l157_c7_8256_iffalse := VAR_result_MUX_uxn_device_h_l179_c7_23a6_return_output;
     -- result_MUX[uxn_device_h_l157_c7_8256] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l157_c7_8256_cond <= VAR_result_MUX_uxn_device_h_l157_c7_8256_cond;
     result_MUX_uxn_device_h_l157_c7_8256_iftrue <= VAR_result_MUX_uxn_device_h_l157_c7_8256_iftrue;
     result_MUX_uxn_device_h_l157_c7_8256_iffalse <= VAR_result_MUX_uxn_device_h_l157_c7_8256_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l157_c7_8256_return_output := result_MUX_uxn_device_h_l157_c7_8256_return_output;

     -- Submodule level 21
     VAR_result_MUX_uxn_device_h_l137_c7_1fcf_iffalse := VAR_result_MUX_uxn_device_h_l157_c7_8256_return_output;
     -- result_MUX[uxn_device_h_l137_c7_1fcf] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l137_c7_1fcf_cond <= VAR_result_MUX_uxn_device_h_l137_c7_1fcf_cond;
     result_MUX_uxn_device_h_l137_c7_1fcf_iftrue <= VAR_result_MUX_uxn_device_h_l137_c7_1fcf_iftrue;
     result_MUX_uxn_device_h_l137_c7_1fcf_iffalse <= VAR_result_MUX_uxn_device_h_l137_c7_1fcf_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l137_c7_1fcf_return_output := result_MUX_uxn_device_h_l137_c7_1fcf_return_output;

     -- Submodule level 22
     VAR_result_MUX_uxn_device_h_l130_c7_7bb6_iffalse := VAR_result_MUX_uxn_device_h_l137_c7_1fcf_return_output;
     -- result_MUX[uxn_device_h_l130_c7_7bb6] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l130_c7_7bb6_cond <= VAR_result_MUX_uxn_device_h_l130_c7_7bb6_cond;
     result_MUX_uxn_device_h_l130_c7_7bb6_iftrue <= VAR_result_MUX_uxn_device_h_l130_c7_7bb6_iftrue;
     result_MUX_uxn_device_h_l130_c7_7bb6_iffalse <= VAR_result_MUX_uxn_device_h_l130_c7_7bb6_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l130_c7_7bb6_return_output := result_MUX_uxn_device_h_l130_c7_7bb6_return_output;

     -- Submodule level 23
     VAR_result_MUX_uxn_device_h_l124_c7_63d6_iffalse := VAR_result_MUX_uxn_device_h_l130_c7_7bb6_return_output;
     -- result_MUX[uxn_device_h_l124_c7_63d6] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l124_c7_63d6_cond <= VAR_result_MUX_uxn_device_h_l124_c7_63d6_cond;
     result_MUX_uxn_device_h_l124_c7_63d6_iftrue <= VAR_result_MUX_uxn_device_h_l124_c7_63d6_iftrue;
     result_MUX_uxn_device_h_l124_c7_63d6_iffalse <= VAR_result_MUX_uxn_device_h_l124_c7_63d6_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l124_c7_63d6_return_output := result_MUX_uxn_device_h_l124_c7_63d6_return_output;

     -- Submodule level 24
     VAR_result_MUX_uxn_device_h_l117_c7_c075_iffalse := VAR_result_MUX_uxn_device_h_l124_c7_63d6_return_output;
     -- result_MUX[uxn_device_h_l117_c7_c075] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l117_c7_c075_cond <= VAR_result_MUX_uxn_device_h_l117_c7_c075_cond;
     result_MUX_uxn_device_h_l117_c7_c075_iftrue <= VAR_result_MUX_uxn_device_h_l117_c7_c075_iftrue;
     result_MUX_uxn_device_h_l117_c7_c075_iffalse <= VAR_result_MUX_uxn_device_h_l117_c7_c075_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l117_c7_c075_return_output := result_MUX_uxn_device_h_l117_c7_c075_return_output;

     -- Submodule level 25
     VAR_result_MUX_uxn_device_h_l106_c7_97b2_iffalse := VAR_result_MUX_uxn_device_h_l117_c7_c075_return_output;
     -- result_MUX[uxn_device_h_l106_c7_97b2] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l106_c7_97b2_cond <= VAR_result_MUX_uxn_device_h_l106_c7_97b2_cond;
     result_MUX_uxn_device_h_l106_c7_97b2_iftrue <= VAR_result_MUX_uxn_device_h_l106_c7_97b2_iftrue;
     result_MUX_uxn_device_h_l106_c7_97b2_iffalse <= VAR_result_MUX_uxn_device_h_l106_c7_97b2_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l106_c7_97b2_return_output := result_MUX_uxn_device_h_l106_c7_97b2_return_output;

     -- Submodule level 26
     VAR_result_MUX_uxn_device_h_l101_c7_1756_iffalse := VAR_result_MUX_uxn_device_h_l106_c7_97b2_return_output;
     -- result_MUX[uxn_device_h_l101_c7_1756] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l101_c7_1756_cond <= VAR_result_MUX_uxn_device_h_l101_c7_1756_cond;
     result_MUX_uxn_device_h_l101_c7_1756_iftrue <= VAR_result_MUX_uxn_device_h_l101_c7_1756_iftrue;
     result_MUX_uxn_device_h_l101_c7_1756_iffalse <= VAR_result_MUX_uxn_device_h_l101_c7_1756_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l101_c7_1756_return_output := result_MUX_uxn_device_h_l101_c7_1756_return_output;

     -- Submodule level 27
     VAR_result_MUX_uxn_device_h_l88_c2_6371_iffalse := VAR_result_MUX_uxn_device_h_l101_c7_1756_return_output;
     -- result_MUX[uxn_device_h_l88_c2_6371] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l88_c2_6371_cond <= VAR_result_MUX_uxn_device_h_l88_c2_6371_cond;
     result_MUX_uxn_device_h_l88_c2_6371_iftrue <= VAR_result_MUX_uxn_device_h_l88_c2_6371_iftrue;
     result_MUX_uxn_device_h_l88_c2_6371_iffalse <= VAR_result_MUX_uxn_device_h_l88_c2_6371_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l88_c2_6371_return_output := result_MUX_uxn_device_h_l88_c2_6371_return_output;

     -- Submodule level 28
     REG_VAR_result := VAR_result_MUX_uxn_device_h_l88_c2_6371_return_output;
     VAR_return_output := VAR_result_MUX_uxn_device_h_l88_c2_6371_return_output;
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
