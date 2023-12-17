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
-- Submodules: 197
entity screen_deo_0CLK_3ae755fd is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 device_port : in unsigned(3 downto 0);
 phase : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out device_out_result_t);
end screen_deo_0CLK_3ae755fd;
architecture arch of screen_deo_0CLK_3ae755fd is
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
-- BIN_OP_EQ[uxn_device_h_l88_c6_57f5]
signal BIN_OP_EQ_uxn_device_h_l88_c6_57f5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l88_c6_57f5_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l88_c6_57f5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l101_c7_ddd9]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_ddd9_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_ddd9_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_ddd9_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_ddd9_return_output : unsigned(0 downto 0);

-- layer_MUX[uxn_device_h_l88_c2_7de5]
signal layer_MUX_uxn_device_h_l88_c2_7de5_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l88_c2_7de5_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l88_c2_7de5_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l88_c2_7de5_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_device_h_l88_c2_7de5]
signal tmp8_MUX_uxn_device_h_l88_c2_7de5_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l88_c2_7de5_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l88_c2_7de5_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l88_c2_7de5_return_output : unsigned(7 downto 0);

-- is_drawing_port_MUX[uxn_device_h_l88_c2_7de5]
signal is_drawing_port_MUX_uxn_device_h_l88_c2_7de5_cond : unsigned(0 downto 0);
signal is_drawing_port_MUX_uxn_device_h_l88_c2_7de5_iftrue : unsigned(0 downto 0);
signal is_drawing_port_MUX_uxn_device_h_l88_c2_7de5_iffalse : unsigned(0 downto 0);
signal is_drawing_port_MUX_uxn_device_h_l88_c2_7de5_return_output : unsigned(0 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l88_c2_7de5]
signal ctrl_mode_MUX_uxn_device_h_l88_c2_7de5_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l88_c2_7de5_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l88_c2_7de5_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l88_c2_7de5_return_output : unsigned(0 downto 0);

-- flip_y_MUX[uxn_device_h_l88_c2_7de5]
signal flip_y_MUX_uxn_device_h_l88_c2_7de5_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l88_c2_7de5_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l88_c2_7de5_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l88_c2_7de5_return_output : unsigned(0 downto 0);

-- is_pixel_port_MUX[uxn_device_h_l88_c2_7de5]
signal is_pixel_port_MUX_uxn_device_h_l88_c2_7de5_cond : unsigned(0 downto 0);
signal is_pixel_port_MUX_uxn_device_h_l88_c2_7de5_iftrue : unsigned(0 downto 0);
signal is_pixel_port_MUX_uxn_device_h_l88_c2_7de5_iffalse : unsigned(0 downto 0);
signal is_pixel_port_MUX_uxn_device_h_l88_c2_7de5_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l88_c2_7de5]
signal color_MUX_uxn_device_h_l88_c2_7de5_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l88_c2_7de5_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l88_c2_7de5_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l88_c2_7de5_return_output : unsigned(3 downto 0);

-- ctrl_MUX[uxn_device_h_l88_c2_7de5]
signal ctrl_MUX_uxn_device_h_l88_c2_7de5_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l88_c2_7de5_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l88_c2_7de5_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l88_c2_7de5_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l88_c2_7de5]
signal y_MUX_uxn_device_h_l88_c2_7de5_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l88_c2_7de5_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l88_c2_7de5_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l88_c2_7de5_return_output : unsigned(15 downto 0);

-- is_sprite_port_MUX[uxn_device_h_l88_c2_7de5]
signal is_sprite_port_MUX_uxn_device_h_l88_c2_7de5_cond : unsigned(0 downto 0);
signal is_sprite_port_MUX_uxn_device_h_l88_c2_7de5_iftrue : unsigned(0 downto 0);
signal is_sprite_port_MUX_uxn_device_h_l88_c2_7de5_iffalse : unsigned(0 downto 0);
signal is_sprite_port_MUX_uxn_device_h_l88_c2_7de5_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l88_c2_7de5]
signal ram_addr_MUX_uxn_device_h_l88_c2_7de5_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l88_c2_7de5_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l88_c2_7de5_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l88_c2_7de5_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_device_h_l88_c2_7de5]
signal result_MUX_uxn_device_h_l88_c2_7de5_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l88_c2_7de5_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l88_c2_7de5_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l88_c2_7de5_return_output : device_out_result_t;

-- auto_advance_MUX[uxn_device_h_l88_c2_7de5]
signal auto_advance_MUX_uxn_device_h_l88_c2_7de5_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l88_c2_7de5_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l88_c2_7de5_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l88_c2_7de5_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l88_c2_7de5]
signal x_MUX_uxn_device_h_l88_c2_7de5_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l88_c2_7de5_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l88_c2_7de5_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l88_c2_7de5_return_output : unsigned(15 downto 0);

-- flip_x_MUX[uxn_device_h_l88_c2_7de5]
signal flip_x_MUX_uxn_device_h_l88_c2_7de5_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l88_c2_7de5_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l88_c2_7de5_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l88_c2_7de5_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l89_c19_cd0f]
signal BIN_OP_EQ_uxn_device_h_l89_c19_cd0f_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l89_c19_cd0f_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l89_c19_cd0f_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l89_c19_23eb]
signal MUX_uxn_device_h_l89_c19_23eb_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l89_c19_23eb_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l89_c19_23eb_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l89_c19_23eb_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l90_c20_324b]
signal BIN_OP_EQ_uxn_device_h_l90_c20_324b_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l90_c20_324b_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l90_c20_324b_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l90_c20_342e]
signal MUX_uxn_device_h_l90_c20_342e_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l90_c20_342e_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l90_c20_342e_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l90_c20_342e_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_device_h_l91_c21_a2f8]
signal BIN_OP_OR_uxn_device_h_l91_c21_a2f8_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_device_h_l91_c21_a2f8_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_device_h_l91_c21_a2f8_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l94_c3_e2e9]
signal result_device_ram_address_MUX_uxn_device_h_l94_c3_e2e9_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l94_c3_e2e9_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l94_c3_e2e9_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l94_c3_e2e9_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l94_c3_e2e9]
signal result_is_deo_done_MUX_uxn_device_h_l94_c3_e2e9_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l94_c3_e2e9_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l94_c3_e2e9_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l94_c3_e2e9_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l95_c32_0a7c]
signal MUX_uxn_device_h_l95_c32_0a7c_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l95_c32_0a7c_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l95_c32_0a7c_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l95_c32_0a7c_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l101_c11_f9e0]
signal BIN_OP_EQ_uxn_device_h_l101_c11_f9e0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l101_c11_f9e0_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l101_c11_f9e0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l104_c7_6998]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_6998_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_6998_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_6998_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_6998_return_output : unsigned(0 downto 0);

-- layer_MUX[uxn_device_h_l101_c7_ddd9]
signal layer_MUX_uxn_device_h_l101_c7_ddd9_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l101_c7_ddd9_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l101_c7_ddd9_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l101_c7_ddd9_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_device_h_l101_c7_ddd9]
signal tmp8_MUX_uxn_device_h_l101_c7_ddd9_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l101_c7_ddd9_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l101_c7_ddd9_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l101_c7_ddd9_return_output : unsigned(7 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l101_c7_ddd9]
signal ctrl_mode_MUX_uxn_device_h_l101_c7_ddd9_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l101_c7_ddd9_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l101_c7_ddd9_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l101_c7_ddd9_return_output : unsigned(0 downto 0);

-- flip_y_MUX[uxn_device_h_l101_c7_ddd9]
signal flip_y_MUX_uxn_device_h_l101_c7_ddd9_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l101_c7_ddd9_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l101_c7_ddd9_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l101_c7_ddd9_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l101_c7_ddd9]
signal color_MUX_uxn_device_h_l101_c7_ddd9_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l101_c7_ddd9_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l101_c7_ddd9_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l101_c7_ddd9_return_output : unsigned(3 downto 0);

-- ctrl_MUX[uxn_device_h_l101_c7_ddd9]
signal ctrl_MUX_uxn_device_h_l101_c7_ddd9_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l101_c7_ddd9_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l101_c7_ddd9_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l101_c7_ddd9_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l101_c7_ddd9]
signal y_MUX_uxn_device_h_l101_c7_ddd9_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l101_c7_ddd9_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l101_c7_ddd9_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l101_c7_ddd9_return_output : unsigned(15 downto 0);

-- ram_addr_MUX[uxn_device_h_l101_c7_ddd9]
signal ram_addr_MUX_uxn_device_h_l101_c7_ddd9_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l101_c7_ddd9_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l101_c7_ddd9_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l101_c7_ddd9_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_device_h_l101_c7_ddd9]
signal result_MUX_uxn_device_h_l101_c7_ddd9_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l101_c7_ddd9_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l101_c7_ddd9_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l101_c7_ddd9_return_output : device_out_result_t;

-- auto_advance_MUX[uxn_device_h_l101_c7_ddd9]
signal auto_advance_MUX_uxn_device_h_l101_c7_ddd9_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l101_c7_ddd9_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l101_c7_ddd9_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l101_c7_ddd9_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l101_c7_ddd9]
signal x_MUX_uxn_device_h_l101_c7_ddd9_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l101_c7_ddd9_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l101_c7_ddd9_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l101_c7_ddd9_return_output : unsigned(15 downto 0);

-- flip_x_MUX[uxn_device_h_l101_c7_ddd9]
signal flip_x_MUX_uxn_device_h_l101_c7_ddd9_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l101_c7_ddd9_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l101_c7_ddd9_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l101_c7_ddd9_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l104_c11_5630]
signal BIN_OP_EQ_uxn_device_h_l104_c11_5630_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l104_c11_5630_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l104_c11_5630_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l113_c7_7203]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_7203_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_7203_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_7203_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_7203_return_output : unsigned(0 downto 0);

-- layer_MUX[uxn_device_h_l104_c7_6998]
signal layer_MUX_uxn_device_h_l104_c7_6998_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l104_c7_6998_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l104_c7_6998_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l104_c7_6998_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_device_h_l104_c7_6998]
signal tmp8_MUX_uxn_device_h_l104_c7_6998_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l104_c7_6998_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l104_c7_6998_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l104_c7_6998_return_output : unsigned(7 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l104_c7_6998]
signal ctrl_mode_MUX_uxn_device_h_l104_c7_6998_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l104_c7_6998_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l104_c7_6998_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l104_c7_6998_return_output : unsigned(0 downto 0);

-- flip_y_MUX[uxn_device_h_l104_c7_6998]
signal flip_y_MUX_uxn_device_h_l104_c7_6998_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l104_c7_6998_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l104_c7_6998_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l104_c7_6998_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l104_c7_6998]
signal color_MUX_uxn_device_h_l104_c7_6998_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l104_c7_6998_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l104_c7_6998_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l104_c7_6998_return_output : unsigned(3 downto 0);

-- ctrl_MUX[uxn_device_h_l104_c7_6998]
signal ctrl_MUX_uxn_device_h_l104_c7_6998_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l104_c7_6998_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l104_c7_6998_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l104_c7_6998_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l104_c7_6998]
signal y_MUX_uxn_device_h_l104_c7_6998_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l104_c7_6998_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l104_c7_6998_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l104_c7_6998_return_output : unsigned(15 downto 0);

-- ram_addr_MUX[uxn_device_h_l104_c7_6998]
signal ram_addr_MUX_uxn_device_h_l104_c7_6998_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l104_c7_6998_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l104_c7_6998_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l104_c7_6998_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_device_h_l104_c7_6998]
signal result_MUX_uxn_device_h_l104_c7_6998_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l104_c7_6998_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l104_c7_6998_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l104_c7_6998_return_output : device_out_result_t;

-- auto_advance_MUX[uxn_device_h_l104_c7_6998]
signal auto_advance_MUX_uxn_device_h_l104_c7_6998_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l104_c7_6998_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l104_c7_6998_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l104_c7_6998_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l104_c7_6998]
signal x_MUX_uxn_device_h_l104_c7_6998_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l104_c7_6998_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l104_c7_6998_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l104_c7_6998_return_output : unsigned(15 downto 0);

-- flip_x_MUX[uxn_device_h_l104_c7_6998]
signal flip_x_MUX_uxn_device_h_l104_c7_6998_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l104_c7_6998_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l104_c7_6998_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l104_c7_6998_return_output : unsigned(0 downto 0);

-- CONST_SR_7[uxn_device_h_l107_c25_6c47]
signal CONST_SR_7_uxn_device_h_l107_c25_6c47_x : unsigned(7 downto 0);
signal CONST_SR_7_uxn_device_h_l107_c25_6c47_return_output : unsigned(7 downto 0);

-- CONST_SR_6[uxn_device_h_l108_c21_d5e2]
signal CONST_SR_6_uxn_device_h_l108_c21_d5e2_x : unsigned(7 downto 0);
signal CONST_SR_6_uxn_device_h_l108_c21_d5e2_return_output : unsigned(7 downto 0);

-- CONST_SR_5[uxn_device_h_l109_c22_18e8]
signal CONST_SR_5_uxn_device_h_l109_c22_18e8_x : unsigned(7 downto 0);
signal CONST_SR_5_uxn_device_h_l109_c22_18e8_return_output : unsigned(7 downto 0);

-- CONST_SR_4[uxn_device_h_l110_c22_e45c]
signal CONST_SR_4_uxn_device_h_l110_c22_e45c_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_device_h_l110_c22_e45c_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l113_c11_f4fd]
signal BIN_OP_EQ_uxn_device_h_l113_c11_f4fd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l113_c11_f4fd_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l113_c11_f4fd_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l118_c7_7b60]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c7_7b60_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c7_7b60_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c7_7b60_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c7_7b60_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_device_h_l113_c7_7203]
signal tmp8_MUX_uxn_device_h_l113_c7_7203_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l113_c7_7203_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l113_c7_7203_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l113_c7_7203_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l113_c7_7203]
signal y_MUX_uxn_device_h_l113_c7_7203_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l113_c7_7203_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l113_c7_7203_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l113_c7_7203_return_output : unsigned(15 downto 0);

-- ram_addr_MUX[uxn_device_h_l113_c7_7203]
signal ram_addr_MUX_uxn_device_h_l113_c7_7203_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l113_c7_7203_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l113_c7_7203_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l113_c7_7203_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_device_h_l113_c7_7203]
signal result_MUX_uxn_device_h_l113_c7_7203_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l113_c7_7203_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l113_c7_7203_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l113_c7_7203_return_output : device_out_result_t;

-- auto_advance_MUX[uxn_device_h_l113_c7_7203]
signal auto_advance_MUX_uxn_device_h_l113_c7_7203_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l113_c7_7203_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l113_c7_7203_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l113_c7_7203_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l113_c7_7203]
signal x_MUX_uxn_device_h_l113_c7_7203_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l113_c7_7203_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l113_c7_7203_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l113_c7_7203_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l118_c11_05f2]
signal BIN_OP_EQ_uxn_device_h_l118_c11_05f2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l118_c11_05f2_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l118_c11_05f2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l122_c7_9b61]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l122_c7_9b61_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l122_c7_9b61_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l122_c7_9b61_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l122_c7_9b61_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_device_h_l118_c7_7b60]
signal tmp8_MUX_uxn_device_h_l118_c7_7b60_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l118_c7_7b60_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l118_c7_7b60_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l118_c7_7b60_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l118_c7_7b60]
signal y_MUX_uxn_device_h_l118_c7_7b60_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l118_c7_7b60_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l118_c7_7b60_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l118_c7_7b60_return_output : unsigned(15 downto 0);

-- ram_addr_MUX[uxn_device_h_l118_c7_7b60]
signal ram_addr_MUX_uxn_device_h_l118_c7_7b60_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l118_c7_7b60_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l118_c7_7b60_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l118_c7_7b60_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_device_h_l118_c7_7b60]
signal result_MUX_uxn_device_h_l118_c7_7b60_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l118_c7_7b60_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l118_c7_7b60_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l118_c7_7b60_return_output : device_out_result_t;

-- auto_advance_MUX[uxn_device_h_l118_c7_7b60]
signal auto_advance_MUX_uxn_device_h_l118_c7_7b60_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l118_c7_7b60_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l118_c7_7b60_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l118_c7_7b60_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l118_c7_7b60]
signal x_MUX_uxn_device_h_l118_c7_7b60_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l118_c7_7b60_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l118_c7_7b60_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l118_c7_7b60_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_device_h_l119_c3_07a8]
signal BIN_OP_OR_uxn_device_h_l119_c3_07a8_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l119_c3_07a8_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l119_c3_07a8_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l122_c11_7545]
signal BIN_OP_EQ_uxn_device_h_l122_c11_7545_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l122_c11_7545_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l122_c11_7545_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l127_c7_6d1f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l127_c7_6d1f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l127_c7_6d1f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l127_c7_6d1f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l127_c7_6d1f_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_device_h_l122_c7_9b61]
signal tmp8_MUX_uxn_device_h_l122_c7_9b61_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l122_c7_9b61_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l122_c7_9b61_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l122_c7_9b61_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l122_c7_9b61]
signal y_MUX_uxn_device_h_l122_c7_9b61_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l122_c7_9b61_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l122_c7_9b61_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l122_c7_9b61_return_output : unsigned(15 downto 0);

-- ram_addr_MUX[uxn_device_h_l122_c7_9b61]
signal ram_addr_MUX_uxn_device_h_l122_c7_9b61_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l122_c7_9b61_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l122_c7_9b61_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l122_c7_9b61_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_device_h_l122_c7_9b61]
signal result_MUX_uxn_device_h_l122_c7_9b61_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l122_c7_9b61_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l122_c7_9b61_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l122_c7_9b61_return_output : device_out_result_t;

-- auto_advance_MUX[uxn_device_h_l122_c7_9b61]
signal auto_advance_MUX_uxn_device_h_l122_c7_9b61_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l122_c7_9b61_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l122_c7_9b61_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l122_c7_9b61_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l122_c7_9b61]
signal x_MUX_uxn_device_h_l122_c7_9b61_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l122_c7_9b61_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l122_c7_9b61_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l122_c7_9b61_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l127_c11_05dc]
signal BIN_OP_EQ_uxn_device_h_l127_c11_05dc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l127_c11_05dc_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l127_c11_05dc_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l148_c7_1e53]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l148_c7_1e53_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l148_c7_1e53_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l148_c7_1e53_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l148_c7_1e53_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_device_h_l127_c7_6d1f]
signal tmp8_MUX_uxn_device_h_l127_c7_6d1f_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l127_c7_6d1f_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l127_c7_6d1f_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l127_c7_6d1f_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l127_c7_6d1f]
signal y_MUX_uxn_device_h_l127_c7_6d1f_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l127_c7_6d1f_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l127_c7_6d1f_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l127_c7_6d1f_return_output : unsigned(15 downto 0);

-- ram_addr_MUX[uxn_device_h_l127_c7_6d1f]
signal ram_addr_MUX_uxn_device_h_l127_c7_6d1f_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l127_c7_6d1f_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l127_c7_6d1f_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l127_c7_6d1f_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_device_h_l127_c7_6d1f]
signal result_MUX_uxn_device_h_l127_c7_6d1f_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l127_c7_6d1f_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l127_c7_6d1f_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l127_c7_6d1f_return_output : device_out_result_t;

-- auto_advance_MUX[uxn_device_h_l127_c7_6d1f]
signal auto_advance_MUX_uxn_device_h_l127_c7_6d1f_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l127_c7_6d1f_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l127_c7_6d1f_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l127_c7_6d1f_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l127_c7_6d1f]
signal x_MUX_uxn_device_h_l127_c7_6d1f_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l127_c7_6d1f_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l127_c7_6d1f_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l127_c7_6d1f_return_output : unsigned(15 downto 0);

-- tmp8_MUX[uxn_device_h_l128_c3_00c7]
signal tmp8_MUX_uxn_device_h_l128_c3_00c7_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l128_c3_00c7_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l128_c3_00c7_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l128_c3_00c7_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l128_c3_00c7]
signal y_MUX_uxn_device_h_l128_c3_00c7_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l128_c3_00c7_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l128_c3_00c7_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l128_c3_00c7_return_output : unsigned(15 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l128_c3_00c7]
signal result_is_deo_done_MUX_uxn_device_h_l128_c3_00c7_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l128_c3_00c7_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l128_c3_00c7_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l128_c3_00c7_return_output : unsigned(0 downto 0);

-- result_u16_addr_MUX[uxn_device_h_l128_c3_00c7]
signal result_u16_addr_MUX_uxn_device_h_l128_c3_00c7_cond : unsigned(0 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l128_c3_00c7_iftrue : unsigned(15 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l128_c3_00c7_iffalse : unsigned(15 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l128_c3_00c7_return_output : unsigned(15 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l128_c3_00c7]
signal result_is_vram_write_MUX_uxn_device_h_l128_c3_00c7_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l128_c3_00c7_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l128_c3_00c7_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l128_c3_00c7_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l128_c3_00c7]
signal result_u8_value_MUX_uxn_device_h_l128_c3_00c7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l128_c3_00c7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l128_c3_00c7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l128_c3_00c7_return_output : unsigned(7 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l128_c3_00c7]
signal result_vram_write_layer_MUX_uxn_device_h_l128_c3_00c7_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l128_c3_00c7_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l128_c3_00c7_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l128_c3_00c7_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l128_c3_00c7]
signal result_device_ram_address_MUX_uxn_device_h_l128_c3_00c7_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l128_c3_00c7_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l128_c3_00c7_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l128_c3_00c7_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_device_h_l131_c11_3ecd]
signal BIN_OP_AND_uxn_device_h_l131_c11_3ecd_left : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_device_h_l131_c11_3ecd_right : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_device_h_l131_c11_3ecd_return_output : unsigned(3 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_device_h_l132_c23_1320]
signal BIN_OP_INFERRED_MULT_uxn_device_h_l132_c23_1320_left : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l132_c23_1320_right : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l132_c23_1320_return_output : unsigned(31 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l132_c23_aafd]
signal BIN_OP_PLUS_uxn_device_h_l132_c23_aafd_left : unsigned(31 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l132_c23_aafd_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l132_c23_aafd_return_output : unsigned(32 downto 0);

-- tmp8_MUX[uxn_device_h_l135_c4_5997]
signal tmp8_MUX_uxn_device_h_l135_c4_5997_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l135_c4_5997_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l135_c4_5997_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l135_c4_5997_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l135_c4_5997]
signal result_is_deo_done_MUX_uxn_device_h_l135_c4_5997_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l135_c4_5997_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l135_c4_5997_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l135_c4_5997_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l136_c13_fc00]
signal MUX_uxn_device_h_l136_c13_fc00_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l136_c13_fc00_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l136_c13_fc00_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l136_c13_fc00_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_device_h_l136_c5_2489]
signal BIN_OP_OR_uxn_device_h_l136_c5_2489_left : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_device_h_l136_c5_2489_right : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_device_h_l136_c5_2489_return_output : unsigned(7 downto 0);

-- MUX[uxn_device_h_l137_c13_2d37]
signal MUX_uxn_device_h_l137_c13_2d37_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l137_c13_2d37_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l137_c13_2d37_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l137_c13_2d37_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_device_h_l137_c5_ed9d]
signal BIN_OP_OR_uxn_device_h_l137_c5_ed9d_left : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_device_h_l137_c5_ed9d_right : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_device_h_l137_c5_ed9d_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l148_c11_eb07]
signal BIN_OP_EQ_uxn_device_h_l148_c11_eb07_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l148_c11_eb07_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l148_c11_eb07_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l166_c7_2eca]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l166_c7_2eca_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l166_c7_2eca_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l166_c7_2eca_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l166_c7_2eca_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l148_c7_1e53]
signal ram_addr_MUX_uxn_device_h_l148_c7_1e53_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l148_c7_1e53_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l148_c7_1e53_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l148_c7_1e53_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_device_h_l148_c7_1e53]
signal result_MUX_uxn_device_h_l148_c7_1e53_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l148_c7_1e53_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l148_c7_1e53_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l148_c7_1e53_return_output : device_out_result_t;

-- auto_advance_MUX[uxn_device_h_l148_c7_1e53]
signal auto_advance_MUX_uxn_device_h_l148_c7_1e53_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l148_c7_1e53_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l148_c7_1e53_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l148_c7_1e53_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l148_c7_1e53]
signal x_MUX_uxn_device_h_l148_c7_1e53_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l148_c7_1e53_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l148_c7_1e53_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l148_c7_1e53_return_output : unsigned(15 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l149_c3_14dc]
signal result_is_vram_write_MUX_uxn_device_h_l149_c3_14dc_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l149_c3_14dc_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l149_c3_14dc_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l149_c3_14dc_return_output : unsigned(0 downto 0);

-- result_u16_addr_MUX[uxn_device_h_l149_c3_14dc]
signal result_u16_addr_MUX_uxn_device_h_l149_c3_14dc_cond : unsigned(0 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l149_c3_14dc_iftrue : unsigned(15 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l149_c3_14dc_iffalse : unsigned(15 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l149_c3_14dc_return_output : unsigned(15 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l149_c3_14dc]
signal result_device_ram_address_MUX_uxn_device_h_l149_c3_14dc_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l149_c3_14dc_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l149_c3_14dc_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l149_c3_14dc_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l149_c3_14dc]
signal result_u8_value_MUX_uxn_device_h_l149_c3_14dc_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l149_c3_14dc_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l149_c3_14dc_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l149_c3_14dc_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l149_c3_14dc]
signal result_is_device_ram_write_MUX_uxn_device_h_l149_c3_14dc_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l149_c3_14dc_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l149_c3_14dc_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l149_c3_14dc_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l149_c3_14dc]
signal auto_advance_MUX_uxn_device_h_l149_c3_14dc_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l149_c3_14dc_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l149_c3_14dc_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l149_c3_14dc_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l149_c3_14dc]
signal x_MUX_uxn_device_h_l149_c3_14dc_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l149_c3_14dc_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l149_c3_14dc_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l149_c3_14dc_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_device_h_l154_c8_ae17]
signal BIN_OP_AND_uxn_device_h_l154_c8_ae17_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l154_c8_ae17_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l154_c8_ae17_return_output : unsigned(7 downto 0);

-- BIN_OP_NEQ[uxn_device_h_l154_c8_b0da]
signal BIN_OP_NEQ_uxn_device_h_l154_c8_b0da_left : unsigned(7 downto 0);
signal BIN_OP_NEQ_uxn_device_h_l154_c8_b0da_right : unsigned(0 downto 0);
signal BIN_OP_NEQ_uxn_device_h_l154_c8_b0da_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l154_c4_357e]
signal result_u8_value_MUX_uxn_device_h_l154_c4_357e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l154_c4_357e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l154_c4_357e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l154_c4_357e_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l154_c4_357e]
signal result_device_ram_address_MUX_uxn_device_h_l154_c4_357e_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l154_c4_357e_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l154_c4_357e_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l154_c4_357e_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l154_c4_357e]
signal result_is_device_ram_write_MUX_uxn_device_h_l154_c4_357e_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l154_c4_357e_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l154_c4_357e_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l154_c4_357e_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l154_c4_357e]
signal x_MUX_uxn_device_h_l154_c4_357e_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l154_c4_357e_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l154_c4_357e_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l154_c4_357e_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l155_c5_7320]
signal BIN_OP_PLUS_uxn_device_h_l155_c5_7320_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l155_c5_7320_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l155_c5_7320_return_output : unsigned(16 downto 0);

-- CONST_SR_8[uxn_device_h_l158_c33_edf3]
signal CONST_SR_8_uxn_device_h_l158_c33_edf3_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_device_h_l158_c33_edf3_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l166_c11_fd8a]
signal BIN_OP_EQ_uxn_device_h_l166_c11_fd8a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l166_c11_fd8a_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l166_c11_fd8a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l179_c7_8b67]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l179_c7_8b67_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l179_c7_8b67_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l179_c7_8b67_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l179_c7_8b67_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l166_c7_2eca]
signal ram_addr_MUX_uxn_device_h_l166_c7_2eca_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l166_c7_2eca_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l166_c7_2eca_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l166_c7_2eca_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_device_h_l166_c7_2eca]
signal result_MUX_uxn_device_h_l166_c7_2eca_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l166_c7_2eca_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l166_c7_2eca_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l166_c7_2eca_return_output : device_out_result_t;

-- ram_addr_MUX[uxn_device_h_l167_c3_d4a4]
signal ram_addr_MUX_uxn_device_h_l167_c3_d4a4_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l167_c3_d4a4_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l167_c3_d4a4_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l167_c3_d4a4_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_device_h_l167_c3_d4a4]
signal result_u8_value_MUX_uxn_device_h_l167_c3_d4a4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l167_c3_d4a4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l167_c3_d4a4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l167_c3_d4a4_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l167_c3_d4a4]
signal result_device_ram_address_MUX_uxn_device_h_l167_c3_d4a4_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l167_c3_d4a4_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l167_c3_d4a4_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l167_c3_d4a4_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l167_c3_d4a4]
signal result_is_device_ram_write_MUX_uxn_device_h_l167_c3_d4a4_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l167_c3_d4a4_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l167_c3_d4a4_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l167_c3_d4a4_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_device_h_l168_c8_ed49]
signal BIN_OP_AND_uxn_device_h_l168_c8_ed49_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l168_c8_ed49_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l168_c8_ed49_return_output : unsigned(7 downto 0);

-- BIN_OP_NEQ[uxn_device_h_l168_c8_07d4]
signal BIN_OP_NEQ_uxn_device_h_l168_c8_07d4_left : unsigned(7 downto 0);
signal BIN_OP_NEQ_uxn_device_h_l168_c8_07d4_right : unsigned(0 downto 0);
signal BIN_OP_NEQ_uxn_device_h_l168_c8_07d4_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l168_c4_8e3f]
signal result_u8_value_MUX_uxn_device_h_l168_c4_8e3f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l168_c4_8e3f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l168_c4_8e3f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l168_c4_8e3f_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l168_c4_8e3f]
signal result_device_ram_address_MUX_uxn_device_h_l168_c4_8e3f_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l168_c4_8e3f_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l168_c4_8e3f_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l168_c4_8e3f_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l168_c4_8e3f]
signal result_is_device_ram_write_MUX_uxn_device_h_l168_c4_8e3f_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l168_c4_8e3f_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l168_c4_8e3f_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l168_c4_8e3f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l179_c11_c3d6]
signal BIN_OP_EQ_uxn_device_h_l179_c11_c3d6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l179_c11_c3d6_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l179_c11_c3d6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l191_c7_cd63]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l191_c7_cd63_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l191_c7_cd63_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l191_c7_cd63_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l191_c7_cd63_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l179_c7_8b67]
signal ram_addr_MUX_uxn_device_h_l179_c7_8b67_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l179_c7_8b67_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l179_c7_8b67_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l179_c7_8b67_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_device_h_l179_c7_8b67]
signal result_MUX_uxn_device_h_l179_c7_8b67_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l179_c7_8b67_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l179_c7_8b67_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l179_c7_8b67_return_output : device_out_result_t;

-- ram_addr_MUX[uxn_device_h_l180_c3_80c6]
signal ram_addr_MUX_uxn_device_h_l180_c3_80c6_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l180_c3_80c6_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l180_c3_80c6_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l180_c3_80c6_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_device_h_l180_c3_80c6]
signal result_u8_value_MUX_uxn_device_h_l180_c3_80c6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l180_c3_80c6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l180_c3_80c6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l180_c3_80c6_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l180_c3_80c6]
signal result_device_ram_address_MUX_uxn_device_h_l180_c3_80c6_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l180_c3_80c6_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l180_c3_80c6_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l180_c3_80c6_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l180_c3_80c6]
signal result_is_device_ram_write_MUX_uxn_device_h_l180_c3_80c6_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l180_c3_80c6_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l180_c3_80c6_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l180_c3_80c6_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_device_h_l181_c9_40bb]
signal BIN_OP_AND_uxn_device_h_l181_c9_40bb_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l181_c9_40bb_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l181_c9_40bb_return_output : unsigned(7 downto 0);

-- BIN_OP_NEQ[uxn_device_h_l181_c9_8f6a]
signal BIN_OP_NEQ_uxn_device_h_l181_c9_8f6a_left : unsigned(7 downto 0);
signal BIN_OP_NEQ_uxn_device_h_l181_c9_8f6a_right : unsigned(0 downto 0);
signal BIN_OP_NEQ_uxn_device_h_l181_c9_8f6a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l181_c4_d009]
signal result_u8_value_MUX_uxn_device_h_l181_c4_d009_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l181_c4_d009_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l181_c4_d009_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l181_c4_d009_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l181_c4_d009]
signal result_device_ram_address_MUX_uxn_device_h_l181_c4_d009_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l181_c4_d009_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l181_c4_d009_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l181_c4_d009_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l181_c4_d009]
signal result_is_device_ram_write_MUX_uxn_device_h_l181_c4_d009_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l181_c4_d009_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l181_c4_d009_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l181_c4_d009_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_device_h_l184_c33_ae1a]
signal CONST_SR_8_uxn_device_h_l184_c33_ae1a_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_device_h_l184_c33_ae1a_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_device_h_l188_c4_cc12]
signal BIN_OP_OR_uxn_device_h_l188_c4_cc12_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l188_c4_cc12_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l188_c4_cc12_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l191_c11_be1b]
signal BIN_OP_EQ_uxn_device_h_l191_c11_be1b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l191_c11_be1b_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l191_c11_be1b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l200_c1_2e5f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l200_c1_2e5f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l200_c1_2e5f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l200_c1_2e5f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l200_c1_2e5f_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l191_c7_cd63]
signal result_MUX_uxn_device_h_l191_c7_cd63_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l191_c7_cd63_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l191_c7_cd63_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l191_c7_cd63_return_output : device_out_result_t;

-- result_u8_value_MUX[uxn_device_h_l192_c3_f6d1]
signal result_u8_value_MUX_uxn_device_h_l192_c3_f6d1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l192_c3_f6d1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l192_c3_f6d1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l192_c3_f6d1_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l192_c3_f6d1]
signal result_device_ram_address_MUX_uxn_device_h_l192_c3_f6d1_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l192_c3_f6d1_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l192_c3_f6d1_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l192_c3_f6d1_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l192_c3_f6d1]
signal result_is_device_ram_write_MUX_uxn_device_h_l192_c3_f6d1_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l192_c3_f6d1_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l192_c3_f6d1_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l192_c3_f6d1_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_device_h_l193_c9_369e]
signal BIN_OP_AND_uxn_device_h_l193_c9_369e_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l193_c9_369e_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l193_c9_369e_return_output : unsigned(7 downto 0);

-- BIN_OP_NEQ[uxn_device_h_l193_c9_2a63]
signal BIN_OP_NEQ_uxn_device_h_l193_c9_2a63_left : unsigned(7 downto 0);
signal BIN_OP_NEQ_uxn_device_h_l193_c9_2a63_right : unsigned(0 downto 0);
signal BIN_OP_NEQ_uxn_device_h_l193_c9_2a63_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l193_c4_da12]
signal result_u8_value_MUX_uxn_device_h_l193_c4_da12_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l193_c4_da12_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l193_c4_da12_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l193_c4_da12_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l193_c4_da12]
signal result_device_ram_address_MUX_uxn_device_h_l193_c4_da12_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l193_c4_da12_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l193_c4_da12_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l193_c4_da12_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l193_c4_da12]
signal result_is_device_ram_write_MUX_uxn_device_h_l193_c4_da12_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l193_c4_da12_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l193_c4_da12_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l193_c4_da12_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l201_c1_c523]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_c523_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_c523_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_c523_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_c523_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l201_c3_2947]
signal result_MUX_uxn_device_h_l201_c3_2947_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l201_c3_2947_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l201_c3_2947_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l201_c3_2947_return_output : device_out_result_t;

-- BIN_OP_MINUS[uxn_device_h_l202_c58_fd83]
signal BIN_OP_MINUS_uxn_device_h_l202_c58_fd83_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l202_c58_fd83_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l202_c58_fd83_return_output : unsigned(7 downto 0);

-- screen_blit[uxn_device_h_l202_c46_90b0]
signal screen_blit_uxn_device_h_l202_c46_90b0_CLOCK_ENABLE : unsigned(0 downto 0);
signal screen_blit_uxn_device_h_l202_c46_90b0_phase : unsigned(7 downto 0);
signal screen_blit_uxn_device_h_l202_c46_90b0_ctrl : unsigned(7 downto 0);
signal screen_blit_uxn_device_h_l202_c46_90b0_auto_advance : unsigned(7 downto 0);
signal screen_blit_uxn_device_h_l202_c46_90b0_x : unsigned(15 downto 0);
signal screen_blit_uxn_device_h_l202_c46_90b0_y : unsigned(15 downto 0);
signal screen_blit_uxn_device_h_l202_c46_90b0_ram_addr : unsigned(15 downto 0);
signal screen_blit_uxn_device_h_l202_c46_90b0_previous_ram_read : unsigned(7 downto 0);
signal screen_blit_uxn_device_h_l202_c46_90b0_return_output : screen_blit_result_t;

-- CONST_SL_8_uint16_t_uxn_device_h_l176_l124_l115_DUPLICATE_ef81
signal CONST_SL_8_uint16_t_uxn_device_h_l176_l124_l115_DUPLICATE_ef81_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_device_h_l176_l124_l115_DUPLICATE_ef81_return_output : unsigned(15 downto 0);

-- BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l144_l130_DUPLICATE_bfc9
signal BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l144_l130_DUPLICATE_bfc9_left : unsigned(15 downto 0);
signal BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l144_l130_DUPLICATE_bfc9_right : unsigned(15 downto 0);
signal BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l144_l130_DUPLICATE_bfc9_return_output : unsigned(15 downto 0);

-- CONST_SR_1_uint8_t_uxn_device_h_l193_l181_DUPLICATE_a566
signal CONST_SR_1_uint8_t_uxn_device_h_l193_l181_DUPLICATE_a566_x : unsigned(7 downto 0);
signal CONST_SR_1_uint8_t_uxn_device_h_l193_l181_DUPLICATE_a566_return_output : unsigned(7 downto 0);

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

function CONST_REF_RD_device_out_result_t_device_out_result_t_67b7( ref_toks_0 : device_out_result_t;
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
      base.u16_addr := ref_toks_2;
      base.is_vram_write := ref_toks_3;
      base.u8_value := ref_toks_4;
      base.vram_write_layer := ref_toks_5;
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

function CONST_REF_RD_device_out_result_t_device_out_result_t_0eea( ref_toks_0 : device_out_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned) return device_out_result_t is
 
  variable base : device_out_result_t; 
  variable return_output : device_out_result_t;
begin
      base := ref_toks_0;
      base.is_vram_write := ref_toks_1;
      base.u16_addr := ref_toks_2;
      base.device_ram_address := ref_toks_3;
      base.u8_value := ref_toks_4;
      base.is_device_ram_write := ref_toks_5;

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
-- BIN_OP_EQ_uxn_device_h_l88_c6_57f5
BIN_OP_EQ_uxn_device_h_l88_c6_57f5 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l88_c6_57f5_left,
BIN_OP_EQ_uxn_device_h_l88_c6_57f5_right,
BIN_OP_EQ_uxn_device_h_l88_c6_57f5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_ddd9
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_ddd9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_ddd9_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_ddd9_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_ddd9_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_ddd9_return_output);

-- layer_MUX_uxn_device_h_l88_c2_7de5
layer_MUX_uxn_device_h_l88_c2_7de5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l88_c2_7de5_cond,
layer_MUX_uxn_device_h_l88_c2_7de5_iftrue,
layer_MUX_uxn_device_h_l88_c2_7de5_iffalse,
layer_MUX_uxn_device_h_l88_c2_7de5_return_output);

-- tmp8_MUX_uxn_device_h_l88_c2_7de5
tmp8_MUX_uxn_device_h_l88_c2_7de5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l88_c2_7de5_cond,
tmp8_MUX_uxn_device_h_l88_c2_7de5_iftrue,
tmp8_MUX_uxn_device_h_l88_c2_7de5_iffalse,
tmp8_MUX_uxn_device_h_l88_c2_7de5_return_output);

-- is_drawing_port_MUX_uxn_device_h_l88_c2_7de5
is_drawing_port_MUX_uxn_device_h_l88_c2_7de5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_drawing_port_MUX_uxn_device_h_l88_c2_7de5_cond,
is_drawing_port_MUX_uxn_device_h_l88_c2_7de5_iftrue,
is_drawing_port_MUX_uxn_device_h_l88_c2_7de5_iffalse,
is_drawing_port_MUX_uxn_device_h_l88_c2_7de5_return_output);

-- ctrl_mode_MUX_uxn_device_h_l88_c2_7de5
ctrl_mode_MUX_uxn_device_h_l88_c2_7de5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l88_c2_7de5_cond,
ctrl_mode_MUX_uxn_device_h_l88_c2_7de5_iftrue,
ctrl_mode_MUX_uxn_device_h_l88_c2_7de5_iffalse,
ctrl_mode_MUX_uxn_device_h_l88_c2_7de5_return_output);

-- flip_y_MUX_uxn_device_h_l88_c2_7de5
flip_y_MUX_uxn_device_h_l88_c2_7de5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l88_c2_7de5_cond,
flip_y_MUX_uxn_device_h_l88_c2_7de5_iftrue,
flip_y_MUX_uxn_device_h_l88_c2_7de5_iffalse,
flip_y_MUX_uxn_device_h_l88_c2_7de5_return_output);

-- is_pixel_port_MUX_uxn_device_h_l88_c2_7de5
is_pixel_port_MUX_uxn_device_h_l88_c2_7de5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_pixel_port_MUX_uxn_device_h_l88_c2_7de5_cond,
is_pixel_port_MUX_uxn_device_h_l88_c2_7de5_iftrue,
is_pixel_port_MUX_uxn_device_h_l88_c2_7de5_iffalse,
is_pixel_port_MUX_uxn_device_h_l88_c2_7de5_return_output);

-- color_MUX_uxn_device_h_l88_c2_7de5
color_MUX_uxn_device_h_l88_c2_7de5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l88_c2_7de5_cond,
color_MUX_uxn_device_h_l88_c2_7de5_iftrue,
color_MUX_uxn_device_h_l88_c2_7de5_iffalse,
color_MUX_uxn_device_h_l88_c2_7de5_return_output);

-- ctrl_MUX_uxn_device_h_l88_c2_7de5
ctrl_MUX_uxn_device_h_l88_c2_7de5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l88_c2_7de5_cond,
ctrl_MUX_uxn_device_h_l88_c2_7de5_iftrue,
ctrl_MUX_uxn_device_h_l88_c2_7de5_iffalse,
ctrl_MUX_uxn_device_h_l88_c2_7de5_return_output);

-- y_MUX_uxn_device_h_l88_c2_7de5
y_MUX_uxn_device_h_l88_c2_7de5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l88_c2_7de5_cond,
y_MUX_uxn_device_h_l88_c2_7de5_iftrue,
y_MUX_uxn_device_h_l88_c2_7de5_iffalse,
y_MUX_uxn_device_h_l88_c2_7de5_return_output);

-- is_sprite_port_MUX_uxn_device_h_l88_c2_7de5
is_sprite_port_MUX_uxn_device_h_l88_c2_7de5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_sprite_port_MUX_uxn_device_h_l88_c2_7de5_cond,
is_sprite_port_MUX_uxn_device_h_l88_c2_7de5_iftrue,
is_sprite_port_MUX_uxn_device_h_l88_c2_7de5_iffalse,
is_sprite_port_MUX_uxn_device_h_l88_c2_7de5_return_output);

-- ram_addr_MUX_uxn_device_h_l88_c2_7de5
ram_addr_MUX_uxn_device_h_l88_c2_7de5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l88_c2_7de5_cond,
ram_addr_MUX_uxn_device_h_l88_c2_7de5_iftrue,
ram_addr_MUX_uxn_device_h_l88_c2_7de5_iffalse,
ram_addr_MUX_uxn_device_h_l88_c2_7de5_return_output);

-- result_MUX_uxn_device_h_l88_c2_7de5
result_MUX_uxn_device_h_l88_c2_7de5 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l88_c2_7de5_cond,
result_MUX_uxn_device_h_l88_c2_7de5_iftrue,
result_MUX_uxn_device_h_l88_c2_7de5_iffalse,
result_MUX_uxn_device_h_l88_c2_7de5_return_output);

-- auto_advance_MUX_uxn_device_h_l88_c2_7de5
auto_advance_MUX_uxn_device_h_l88_c2_7de5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l88_c2_7de5_cond,
auto_advance_MUX_uxn_device_h_l88_c2_7de5_iftrue,
auto_advance_MUX_uxn_device_h_l88_c2_7de5_iffalse,
auto_advance_MUX_uxn_device_h_l88_c2_7de5_return_output);

-- x_MUX_uxn_device_h_l88_c2_7de5
x_MUX_uxn_device_h_l88_c2_7de5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l88_c2_7de5_cond,
x_MUX_uxn_device_h_l88_c2_7de5_iftrue,
x_MUX_uxn_device_h_l88_c2_7de5_iffalse,
x_MUX_uxn_device_h_l88_c2_7de5_return_output);

-- flip_x_MUX_uxn_device_h_l88_c2_7de5
flip_x_MUX_uxn_device_h_l88_c2_7de5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l88_c2_7de5_cond,
flip_x_MUX_uxn_device_h_l88_c2_7de5_iftrue,
flip_x_MUX_uxn_device_h_l88_c2_7de5_iffalse,
flip_x_MUX_uxn_device_h_l88_c2_7de5_return_output);

-- BIN_OP_EQ_uxn_device_h_l89_c19_cd0f
BIN_OP_EQ_uxn_device_h_l89_c19_cd0f : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l89_c19_cd0f_left,
BIN_OP_EQ_uxn_device_h_l89_c19_cd0f_right,
BIN_OP_EQ_uxn_device_h_l89_c19_cd0f_return_output);

-- MUX_uxn_device_h_l89_c19_23eb
MUX_uxn_device_h_l89_c19_23eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l89_c19_23eb_cond,
MUX_uxn_device_h_l89_c19_23eb_iftrue,
MUX_uxn_device_h_l89_c19_23eb_iffalse,
MUX_uxn_device_h_l89_c19_23eb_return_output);

-- BIN_OP_EQ_uxn_device_h_l90_c20_324b
BIN_OP_EQ_uxn_device_h_l90_c20_324b : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l90_c20_324b_left,
BIN_OP_EQ_uxn_device_h_l90_c20_324b_right,
BIN_OP_EQ_uxn_device_h_l90_c20_324b_return_output);

-- MUX_uxn_device_h_l90_c20_342e
MUX_uxn_device_h_l90_c20_342e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l90_c20_342e_cond,
MUX_uxn_device_h_l90_c20_342e_iftrue,
MUX_uxn_device_h_l90_c20_342e_iffalse,
MUX_uxn_device_h_l90_c20_342e_return_output);

-- BIN_OP_OR_uxn_device_h_l91_c21_a2f8
BIN_OP_OR_uxn_device_h_l91_c21_a2f8 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l91_c21_a2f8_left,
BIN_OP_OR_uxn_device_h_l91_c21_a2f8_right,
BIN_OP_OR_uxn_device_h_l91_c21_a2f8_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l94_c3_e2e9
result_device_ram_address_MUX_uxn_device_h_l94_c3_e2e9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l94_c3_e2e9_cond,
result_device_ram_address_MUX_uxn_device_h_l94_c3_e2e9_iftrue,
result_device_ram_address_MUX_uxn_device_h_l94_c3_e2e9_iffalse,
result_device_ram_address_MUX_uxn_device_h_l94_c3_e2e9_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l94_c3_e2e9
result_is_deo_done_MUX_uxn_device_h_l94_c3_e2e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l94_c3_e2e9_cond,
result_is_deo_done_MUX_uxn_device_h_l94_c3_e2e9_iftrue,
result_is_deo_done_MUX_uxn_device_h_l94_c3_e2e9_iffalse,
result_is_deo_done_MUX_uxn_device_h_l94_c3_e2e9_return_output);

-- MUX_uxn_device_h_l95_c32_0a7c
MUX_uxn_device_h_l95_c32_0a7c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l95_c32_0a7c_cond,
MUX_uxn_device_h_l95_c32_0a7c_iftrue,
MUX_uxn_device_h_l95_c32_0a7c_iffalse,
MUX_uxn_device_h_l95_c32_0a7c_return_output);

-- BIN_OP_EQ_uxn_device_h_l101_c11_f9e0
BIN_OP_EQ_uxn_device_h_l101_c11_f9e0 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l101_c11_f9e0_left,
BIN_OP_EQ_uxn_device_h_l101_c11_f9e0_right,
BIN_OP_EQ_uxn_device_h_l101_c11_f9e0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_6998
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_6998 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_6998_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_6998_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_6998_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_6998_return_output);

-- layer_MUX_uxn_device_h_l101_c7_ddd9
layer_MUX_uxn_device_h_l101_c7_ddd9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l101_c7_ddd9_cond,
layer_MUX_uxn_device_h_l101_c7_ddd9_iftrue,
layer_MUX_uxn_device_h_l101_c7_ddd9_iffalse,
layer_MUX_uxn_device_h_l101_c7_ddd9_return_output);

-- tmp8_MUX_uxn_device_h_l101_c7_ddd9
tmp8_MUX_uxn_device_h_l101_c7_ddd9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l101_c7_ddd9_cond,
tmp8_MUX_uxn_device_h_l101_c7_ddd9_iftrue,
tmp8_MUX_uxn_device_h_l101_c7_ddd9_iffalse,
tmp8_MUX_uxn_device_h_l101_c7_ddd9_return_output);

-- ctrl_mode_MUX_uxn_device_h_l101_c7_ddd9
ctrl_mode_MUX_uxn_device_h_l101_c7_ddd9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l101_c7_ddd9_cond,
ctrl_mode_MUX_uxn_device_h_l101_c7_ddd9_iftrue,
ctrl_mode_MUX_uxn_device_h_l101_c7_ddd9_iffalse,
ctrl_mode_MUX_uxn_device_h_l101_c7_ddd9_return_output);

-- flip_y_MUX_uxn_device_h_l101_c7_ddd9
flip_y_MUX_uxn_device_h_l101_c7_ddd9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l101_c7_ddd9_cond,
flip_y_MUX_uxn_device_h_l101_c7_ddd9_iftrue,
flip_y_MUX_uxn_device_h_l101_c7_ddd9_iffalse,
flip_y_MUX_uxn_device_h_l101_c7_ddd9_return_output);

-- color_MUX_uxn_device_h_l101_c7_ddd9
color_MUX_uxn_device_h_l101_c7_ddd9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l101_c7_ddd9_cond,
color_MUX_uxn_device_h_l101_c7_ddd9_iftrue,
color_MUX_uxn_device_h_l101_c7_ddd9_iffalse,
color_MUX_uxn_device_h_l101_c7_ddd9_return_output);

-- ctrl_MUX_uxn_device_h_l101_c7_ddd9
ctrl_MUX_uxn_device_h_l101_c7_ddd9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l101_c7_ddd9_cond,
ctrl_MUX_uxn_device_h_l101_c7_ddd9_iftrue,
ctrl_MUX_uxn_device_h_l101_c7_ddd9_iffalse,
ctrl_MUX_uxn_device_h_l101_c7_ddd9_return_output);

-- y_MUX_uxn_device_h_l101_c7_ddd9
y_MUX_uxn_device_h_l101_c7_ddd9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l101_c7_ddd9_cond,
y_MUX_uxn_device_h_l101_c7_ddd9_iftrue,
y_MUX_uxn_device_h_l101_c7_ddd9_iffalse,
y_MUX_uxn_device_h_l101_c7_ddd9_return_output);

-- ram_addr_MUX_uxn_device_h_l101_c7_ddd9
ram_addr_MUX_uxn_device_h_l101_c7_ddd9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l101_c7_ddd9_cond,
ram_addr_MUX_uxn_device_h_l101_c7_ddd9_iftrue,
ram_addr_MUX_uxn_device_h_l101_c7_ddd9_iffalse,
ram_addr_MUX_uxn_device_h_l101_c7_ddd9_return_output);

-- result_MUX_uxn_device_h_l101_c7_ddd9
result_MUX_uxn_device_h_l101_c7_ddd9 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l101_c7_ddd9_cond,
result_MUX_uxn_device_h_l101_c7_ddd9_iftrue,
result_MUX_uxn_device_h_l101_c7_ddd9_iffalse,
result_MUX_uxn_device_h_l101_c7_ddd9_return_output);

-- auto_advance_MUX_uxn_device_h_l101_c7_ddd9
auto_advance_MUX_uxn_device_h_l101_c7_ddd9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l101_c7_ddd9_cond,
auto_advance_MUX_uxn_device_h_l101_c7_ddd9_iftrue,
auto_advance_MUX_uxn_device_h_l101_c7_ddd9_iffalse,
auto_advance_MUX_uxn_device_h_l101_c7_ddd9_return_output);

-- x_MUX_uxn_device_h_l101_c7_ddd9
x_MUX_uxn_device_h_l101_c7_ddd9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l101_c7_ddd9_cond,
x_MUX_uxn_device_h_l101_c7_ddd9_iftrue,
x_MUX_uxn_device_h_l101_c7_ddd9_iffalse,
x_MUX_uxn_device_h_l101_c7_ddd9_return_output);

-- flip_x_MUX_uxn_device_h_l101_c7_ddd9
flip_x_MUX_uxn_device_h_l101_c7_ddd9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l101_c7_ddd9_cond,
flip_x_MUX_uxn_device_h_l101_c7_ddd9_iftrue,
flip_x_MUX_uxn_device_h_l101_c7_ddd9_iffalse,
flip_x_MUX_uxn_device_h_l101_c7_ddd9_return_output);

-- BIN_OP_EQ_uxn_device_h_l104_c11_5630
BIN_OP_EQ_uxn_device_h_l104_c11_5630 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l104_c11_5630_left,
BIN_OP_EQ_uxn_device_h_l104_c11_5630_right,
BIN_OP_EQ_uxn_device_h_l104_c11_5630_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_7203
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_7203 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_7203_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_7203_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_7203_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_7203_return_output);

-- layer_MUX_uxn_device_h_l104_c7_6998
layer_MUX_uxn_device_h_l104_c7_6998 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l104_c7_6998_cond,
layer_MUX_uxn_device_h_l104_c7_6998_iftrue,
layer_MUX_uxn_device_h_l104_c7_6998_iffalse,
layer_MUX_uxn_device_h_l104_c7_6998_return_output);

-- tmp8_MUX_uxn_device_h_l104_c7_6998
tmp8_MUX_uxn_device_h_l104_c7_6998 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l104_c7_6998_cond,
tmp8_MUX_uxn_device_h_l104_c7_6998_iftrue,
tmp8_MUX_uxn_device_h_l104_c7_6998_iffalse,
tmp8_MUX_uxn_device_h_l104_c7_6998_return_output);

-- ctrl_mode_MUX_uxn_device_h_l104_c7_6998
ctrl_mode_MUX_uxn_device_h_l104_c7_6998 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l104_c7_6998_cond,
ctrl_mode_MUX_uxn_device_h_l104_c7_6998_iftrue,
ctrl_mode_MUX_uxn_device_h_l104_c7_6998_iffalse,
ctrl_mode_MUX_uxn_device_h_l104_c7_6998_return_output);

-- flip_y_MUX_uxn_device_h_l104_c7_6998
flip_y_MUX_uxn_device_h_l104_c7_6998 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l104_c7_6998_cond,
flip_y_MUX_uxn_device_h_l104_c7_6998_iftrue,
flip_y_MUX_uxn_device_h_l104_c7_6998_iffalse,
flip_y_MUX_uxn_device_h_l104_c7_6998_return_output);

-- color_MUX_uxn_device_h_l104_c7_6998
color_MUX_uxn_device_h_l104_c7_6998 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l104_c7_6998_cond,
color_MUX_uxn_device_h_l104_c7_6998_iftrue,
color_MUX_uxn_device_h_l104_c7_6998_iffalse,
color_MUX_uxn_device_h_l104_c7_6998_return_output);

-- ctrl_MUX_uxn_device_h_l104_c7_6998
ctrl_MUX_uxn_device_h_l104_c7_6998 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l104_c7_6998_cond,
ctrl_MUX_uxn_device_h_l104_c7_6998_iftrue,
ctrl_MUX_uxn_device_h_l104_c7_6998_iffalse,
ctrl_MUX_uxn_device_h_l104_c7_6998_return_output);

-- y_MUX_uxn_device_h_l104_c7_6998
y_MUX_uxn_device_h_l104_c7_6998 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l104_c7_6998_cond,
y_MUX_uxn_device_h_l104_c7_6998_iftrue,
y_MUX_uxn_device_h_l104_c7_6998_iffalse,
y_MUX_uxn_device_h_l104_c7_6998_return_output);

-- ram_addr_MUX_uxn_device_h_l104_c7_6998
ram_addr_MUX_uxn_device_h_l104_c7_6998 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l104_c7_6998_cond,
ram_addr_MUX_uxn_device_h_l104_c7_6998_iftrue,
ram_addr_MUX_uxn_device_h_l104_c7_6998_iffalse,
ram_addr_MUX_uxn_device_h_l104_c7_6998_return_output);

-- result_MUX_uxn_device_h_l104_c7_6998
result_MUX_uxn_device_h_l104_c7_6998 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l104_c7_6998_cond,
result_MUX_uxn_device_h_l104_c7_6998_iftrue,
result_MUX_uxn_device_h_l104_c7_6998_iffalse,
result_MUX_uxn_device_h_l104_c7_6998_return_output);

-- auto_advance_MUX_uxn_device_h_l104_c7_6998
auto_advance_MUX_uxn_device_h_l104_c7_6998 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l104_c7_6998_cond,
auto_advance_MUX_uxn_device_h_l104_c7_6998_iftrue,
auto_advance_MUX_uxn_device_h_l104_c7_6998_iffalse,
auto_advance_MUX_uxn_device_h_l104_c7_6998_return_output);

-- x_MUX_uxn_device_h_l104_c7_6998
x_MUX_uxn_device_h_l104_c7_6998 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l104_c7_6998_cond,
x_MUX_uxn_device_h_l104_c7_6998_iftrue,
x_MUX_uxn_device_h_l104_c7_6998_iffalse,
x_MUX_uxn_device_h_l104_c7_6998_return_output);

-- flip_x_MUX_uxn_device_h_l104_c7_6998
flip_x_MUX_uxn_device_h_l104_c7_6998 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l104_c7_6998_cond,
flip_x_MUX_uxn_device_h_l104_c7_6998_iftrue,
flip_x_MUX_uxn_device_h_l104_c7_6998_iffalse,
flip_x_MUX_uxn_device_h_l104_c7_6998_return_output);

-- CONST_SR_7_uxn_device_h_l107_c25_6c47
CONST_SR_7_uxn_device_h_l107_c25_6c47 : entity work.CONST_SR_7_uint8_t_0CLK_de264c78 port map (
CONST_SR_7_uxn_device_h_l107_c25_6c47_x,
CONST_SR_7_uxn_device_h_l107_c25_6c47_return_output);

-- CONST_SR_6_uxn_device_h_l108_c21_d5e2
CONST_SR_6_uxn_device_h_l108_c21_d5e2 : entity work.CONST_SR_6_uint8_t_0CLK_de264c78 port map (
CONST_SR_6_uxn_device_h_l108_c21_d5e2_x,
CONST_SR_6_uxn_device_h_l108_c21_d5e2_return_output);

-- CONST_SR_5_uxn_device_h_l109_c22_18e8
CONST_SR_5_uxn_device_h_l109_c22_18e8 : entity work.CONST_SR_5_uint8_t_0CLK_de264c78 port map (
CONST_SR_5_uxn_device_h_l109_c22_18e8_x,
CONST_SR_5_uxn_device_h_l109_c22_18e8_return_output);

-- CONST_SR_4_uxn_device_h_l110_c22_e45c
CONST_SR_4_uxn_device_h_l110_c22_e45c : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_device_h_l110_c22_e45c_x,
CONST_SR_4_uxn_device_h_l110_c22_e45c_return_output);

-- BIN_OP_EQ_uxn_device_h_l113_c11_f4fd
BIN_OP_EQ_uxn_device_h_l113_c11_f4fd : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l113_c11_f4fd_left,
BIN_OP_EQ_uxn_device_h_l113_c11_f4fd_right,
BIN_OP_EQ_uxn_device_h_l113_c11_f4fd_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c7_7b60
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c7_7b60 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c7_7b60_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c7_7b60_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c7_7b60_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c7_7b60_return_output);

-- tmp8_MUX_uxn_device_h_l113_c7_7203
tmp8_MUX_uxn_device_h_l113_c7_7203 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l113_c7_7203_cond,
tmp8_MUX_uxn_device_h_l113_c7_7203_iftrue,
tmp8_MUX_uxn_device_h_l113_c7_7203_iffalse,
tmp8_MUX_uxn_device_h_l113_c7_7203_return_output);

-- y_MUX_uxn_device_h_l113_c7_7203
y_MUX_uxn_device_h_l113_c7_7203 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l113_c7_7203_cond,
y_MUX_uxn_device_h_l113_c7_7203_iftrue,
y_MUX_uxn_device_h_l113_c7_7203_iffalse,
y_MUX_uxn_device_h_l113_c7_7203_return_output);

-- ram_addr_MUX_uxn_device_h_l113_c7_7203
ram_addr_MUX_uxn_device_h_l113_c7_7203 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l113_c7_7203_cond,
ram_addr_MUX_uxn_device_h_l113_c7_7203_iftrue,
ram_addr_MUX_uxn_device_h_l113_c7_7203_iffalse,
ram_addr_MUX_uxn_device_h_l113_c7_7203_return_output);

-- result_MUX_uxn_device_h_l113_c7_7203
result_MUX_uxn_device_h_l113_c7_7203 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l113_c7_7203_cond,
result_MUX_uxn_device_h_l113_c7_7203_iftrue,
result_MUX_uxn_device_h_l113_c7_7203_iffalse,
result_MUX_uxn_device_h_l113_c7_7203_return_output);

-- auto_advance_MUX_uxn_device_h_l113_c7_7203
auto_advance_MUX_uxn_device_h_l113_c7_7203 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l113_c7_7203_cond,
auto_advance_MUX_uxn_device_h_l113_c7_7203_iftrue,
auto_advance_MUX_uxn_device_h_l113_c7_7203_iffalse,
auto_advance_MUX_uxn_device_h_l113_c7_7203_return_output);

-- x_MUX_uxn_device_h_l113_c7_7203
x_MUX_uxn_device_h_l113_c7_7203 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l113_c7_7203_cond,
x_MUX_uxn_device_h_l113_c7_7203_iftrue,
x_MUX_uxn_device_h_l113_c7_7203_iffalse,
x_MUX_uxn_device_h_l113_c7_7203_return_output);

-- BIN_OP_EQ_uxn_device_h_l118_c11_05f2
BIN_OP_EQ_uxn_device_h_l118_c11_05f2 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l118_c11_05f2_left,
BIN_OP_EQ_uxn_device_h_l118_c11_05f2_right,
BIN_OP_EQ_uxn_device_h_l118_c11_05f2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l122_c7_9b61
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l122_c7_9b61 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l122_c7_9b61_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l122_c7_9b61_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l122_c7_9b61_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l122_c7_9b61_return_output);

-- tmp8_MUX_uxn_device_h_l118_c7_7b60
tmp8_MUX_uxn_device_h_l118_c7_7b60 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l118_c7_7b60_cond,
tmp8_MUX_uxn_device_h_l118_c7_7b60_iftrue,
tmp8_MUX_uxn_device_h_l118_c7_7b60_iffalse,
tmp8_MUX_uxn_device_h_l118_c7_7b60_return_output);

-- y_MUX_uxn_device_h_l118_c7_7b60
y_MUX_uxn_device_h_l118_c7_7b60 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l118_c7_7b60_cond,
y_MUX_uxn_device_h_l118_c7_7b60_iftrue,
y_MUX_uxn_device_h_l118_c7_7b60_iffalse,
y_MUX_uxn_device_h_l118_c7_7b60_return_output);

-- ram_addr_MUX_uxn_device_h_l118_c7_7b60
ram_addr_MUX_uxn_device_h_l118_c7_7b60 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l118_c7_7b60_cond,
ram_addr_MUX_uxn_device_h_l118_c7_7b60_iftrue,
ram_addr_MUX_uxn_device_h_l118_c7_7b60_iffalse,
ram_addr_MUX_uxn_device_h_l118_c7_7b60_return_output);

-- result_MUX_uxn_device_h_l118_c7_7b60
result_MUX_uxn_device_h_l118_c7_7b60 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l118_c7_7b60_cond,
result_MUX_uxn_device_h_l118_c7_7b60_iftrue,
result_MUX_uxn_device_h_l118_c7_7b60_iffalse,
result_MUX_uxn_device_h_l118_c7_7b60_return_output);

-- auto_advance_MUX_uxn_device_h_l118_c7_7b60
auto_advance_MUX_uxn_device_h_l118_c7_7b60 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l118_c7_7b60_cond,
auto_advance_MUX_uxn_device_h_l118_c7_7b60_iftrue,
auto_advance_MUX_uxn_device_h_l118_c7_7b60_iffalse,
auto_advance_MUX_uxn_device_h_l118_c7_7b60_return_output);

-- x_MUX_uxn_device_h_l118_c7_7b60
x_MUX_uxn_device_h_l118_c7_7b60 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l118_c7_7b60_cond,
x_MUX_uxn_device_h_l118_c7_7b60_iftrue,
x_MUX_uxn_device_h_l118_c7_7b60_iffalse,
x_MUX_uxn_device_h_l118_c7_7b60_return_output);

-- BIN_OP_OR_uxn_device_h_l119_c3_07a8
BIN_OP_OR_uxn_device_h_l119_c3_07a8 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l119_c3_07a8_left,
BIN_OP_OR_uxn_device_h_l119_c3_07a8_right,
BIN_OP_OR_uxn_device_h_l119_c3_07a8_return_output);

-- BIN_OP_EQ_uxn_device_h_l122_c11_7545
BIN_OP_EQ_uxn_device_h_l122_c11_7545 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l122_c11_7545_left,
BIN_OP_EQ_uxn_device_h_l122_c11_7545_right,
BIN_OP_EQ_uxn_device_h_l122_c11_7545_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l127_c7_6d1f
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l127_c7_6d1f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l127_c7_6d1f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l127_c7_6d1f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l127_c7_6d1f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l127_c7_6d1f_return_output);

-- tmp8_MUX_uxn_device_h_l122_c7_9b61
tmp8_MUX_uxn_device_h_l122_c7_9b61 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l122_c7_9b61_cond,
tmp8_MUX_uxn_device_h_l122_c7_9b61_iftrue,
tmp8_MUX_uxn_device_h_l122_c7_9b61_iffalse,
tmp8_MUX_uxn_device_h_l122_c7_9b61_return_output);

-- y_MUX_uxn_device_h_l122_c7_9b61
y_MUX_uxn_device_h_l122_c7_9b61 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l122_c7_9b61_cond,
y_MUX_uxn_device_h_l122_c7_9b61_iftrue,
y_MUX_uxn_device_h_l122_c7_9b61_iffalse,
y_MUX_uxn_device_h_l122_c7_9b61_return_output);

-- ram_addr_MUX_uxn_device_h_l122_c7_9b61
ram_addr_MUX_uxn_device_h_l122_c7_9b61 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l122_c7_9b61_cond,
ram_addr_MUX_uxn_device_h_l122_c7_9b61_iftrue,
ram_addr_MUX_uxn_device_h_l122_c7_9b61_iffalse,
ram_addr_MUX_uxn_device_h_l122_c7_9b61_return_output);

-- result_MUX_uxn_device_h_l122_c7_9b61
result_MUX_uxn_device_h_l122_c7_9b61 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l122_c7_9b61_cond,
result_MUX_uxn_device_h_l122_c7_9b61_iftrue,
result_MUX_uxn_device_h_l122_c7_9b61_iffalse,
result_MUX_uxn_device_h_l122_c7_9b61_return_output);

-- auto_advance_MUX_uxn_device_h_l122_c7_9b61
auto_advance_MUX_uxn_device_h_l122_c7_9b61 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l122_c7_9b61_cond,
auto_advance_MUX_uxn_device_h_l122_c7_9b61_iftrue,
auto_advance_MUX_uxn_device_h_l122_c7_9b61_iffalse,
auto_advance_MUX_uxn_device_h_l122_c7_9b61_return_output);

-- x_MUX_uxn_device_h_l122_c7_9b61
x_MUX_uxn_device_h_l122_c7_9b61 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l122_c7_9b61_cond,
x_MUX_uxn_device_h_l122_c7_9b61_iftrue,
x_MUX_uxn_device_h_l122_c7_9b61_iffalse,
x_MUX_uxn_device_h_l122_c7_9b61_return_output);

-- BIN_OP_EQ_uxn_device_h_l127_c11_05dc
BIN_OP_EQ_uxn_device_h_l127_c11_05dc : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l127_c11_05dc_left,
BIN_OP_EQ_uxn_device_h_l127_c11_05dc_right,
BIN_OP_EQ_uxn_device_h_l127_c11_05dc_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l148_c7_1e53
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l148_c7_1e53 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l148_c7_1e53_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l148_c7_1e53_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l148_c7_1e53_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l148_c7_1e53_return_output);

-- tmp8_MUX_uxn_device_h_l127_c7_6d1f
tmp8_MUX_uxn_device_h_l127_c7_6d1f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l127_c7_6d1f_cond,
tmp8_MUX_uxn_device_h_l127_c7_6d1f_iftrue,
tmp8_MUX_uxn_device_h_l127_c7_6d1f_iffalse,
tmp8_MUX_uxn_device_h_l127_c7_6d1f_return_output);

-- y_MUX_uxn_device_h_l127_c7_6d1f
y_MUX_uxn_device_h_l127_c7_6d1f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l127_c7_6d1f_cond,
y_MUX_uxn_device_h_l127_c7_6d1f_iftrue,
y_MUX_uxn_device_h_l127_c7_6d1f_iffalse,
y_MUX_uxn_device_h_l127_c7_6d1f_return_output);

-- ram_addr_MUX_uxn_device_h_l127_c7_6d1f
ram_addr_MUX_uxn_device_h_l127_c7_6d1f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l127_c7_6d1f_cond,
ram_addr_MUX_uxn_device_h_l127_c7_6d1f_iftrue,
ram_addr_MUX_uxn_device_h_l127_c7_6d1f_iffalse,
ram_addr_MUX_uxn_device_h_l127_c7_6d1f_return_output);

-- result_MUX_uxn_device_h_l127_c7_6d1f
result_MUX_uxn_device_h_l127_c7_6d1f : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l127_c7_6d1f_cond,
result_MUX_uxn_device_h_l127_c7_6d1f_iftrue,
result_MUX_uxn_device_h_l127_c7_6d1f_iffalse,
result_MUX_uxn_device_h_l127_c7_6d1f_return_output);

-- auto_advance_MUX_uxn_device_h_l127_c7_6d1f
auto_advance_MUX_uxn_device_h_l127_c7_6d1f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l127_c7_6d1f_cond,
auto_advance_MUX_uxn_device_h_l127_c7_6d1f_iftrue,
auto_advance_MUX_uxn_device_h_l127_c7_6d1f_iffalse,
auto_advance_MUX_uxn_device_h_l127_c7_6d1f_return_output);

-- x_MUX_uxn_device_h_l127_c7_6d1f
x_MUX_uxn_device_h_l127_c7_6d1f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l127_c7_6d1f_cond,
x_MUX_uxn_device_h_l127_c7_6d1f_iftrue,
x_MUX_uxn_device_h_l127_c7_6d1f_iffalse,
x_MUX_uxn_device_h_l127_c7_6d1f_return_output);

-- tmp8_MUX_uxn_device_h_l128_c3_00c7
tmp8_MUX_uxn_device_h_l128_c3_00c7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l128_c3_00c7_cond,
tmp8_MUX_uxn_device_h_l128_c3_00c7_iftrue,
tmp8_MUX_uxn_device_h_l128_c3_00c7_iffalse,
tmp8_MUX_uxn_device_h_l128_c3_00c7_return_output);

-- y_MUX_uxn_device_h_l128_c3_00c7
y_MUX_uxn_device_h_l128_c3_00c7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l128_c3_00c7_cond,
y_MUX_uxn_device_h_l128_c3_00c7_iftrue,
y_MUX_uxn_device_h_l128_c3_00c7_iffalse,
y_MUX_uxn_device_h_l128_c3_00c7_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l128_c3_00c7
result_is_deo_done_MUX_uxn_device_h_l128_c3_00c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l128_c3_00c7_cond,
result_is_deo_done_MUX_uxn_device_h_l128_c3_00c7_iftrue,
result_is_deo_done_MUX_uxn_device_h_l128_c3_00c7_iffalse,
result_is_deo_done_MUX_uxn_device_h_l128_c3_00c7_return_output);

-- result_u16_addr_MUX_uxn_device_h_l128_c3_00c7
result_u16_addr_MUX_uxn_device_h_l128_c3_00c7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_addr_MUX_uxn_device_h_l128_c3_00c7_cond,
result_u16_addr_MUX_uxn_device_h_l128_c3_00c7_iftrue,
result_u16_addr_MUX_uxn_device_h_l128_c3_00c7_iffalse,
result_u16_addr_MUX_uxn_device_h_l128_c3_00c7_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l128_c3_00c7
result_is_vram_write_MUX_uxn_device_h_l128_c3_00c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l128_c3_00c7_cond,
result_is_vram_write_MUX_uxn_device_h_l128_c3_00c7_iftrue,
result_is_vram_write_MUX_uxn_device_h_l128_c3_00c7_iffalse,
result_is_vram_write_MUX_uxn_device_h_l128_c3_00c7_return_output);

-- result_u8_value_MUX_uxn_device_h_l128_c3_00c7
result_u8_value_MUX_uxn_device_h_l128_c3_00c7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l128_c3_00c7_cond,
result_u8_value_MUX_uxn_device_h_l128_c3_00c7_iftrue,
result_u8_value_MUX_uxn_device_h_l128_c3_00c7_iffalse,
result_u8_value_MUX_uxn_device_h_l128_c3_00c7_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l128_c3_00c7
result_vram_write_layer_MUX_uxn_device_h_l128_c3_00c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l128_c3_00c7_cond,
result_vram_write_layer_MUX_uxn_device_h_l128_c3_00c7_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l128_c3_00c7_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l128_c3_00c7_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l128_c3_00c7
result_device_ram_address_MUX_uxn_device_h_l128_c3_00c7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l128_c3_00c7_cond,
result_device_ram_address_MUX_uxn_device_h_l128_c3_00c7_iftrue,
result_device_ram_address_MUX_uxn_device_h_l128_c3_00c7_iffalse,
result_device_ram_address_MUX_uxn_device_h_l128_c3_00c7_return_output);

-- BIN_OP_AND_uxn_device_h_l131_c11_3ecd
BIN_OP_AND_uxn_device_h_l131_c11_3ecd : entity work.BIN_OP_AND_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l131_c11_3ecd_left,
BIN_OP_AND_uxn_device_h_l131_c11_3ecd_right,
BIN_OP_AND_uxn_device_h_l131_c11_3ecd_return_output);

-- BIN_OP_INFERRED_MULT_uxn_device_h_l132_c23_1320
BIN_OP_INFERRED_MULT_uxn_device_h_l132_c23_1320 : entity work.BIN_OP_INFERRED_MULT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_device_h_l132_c23_1320_left,
BIN_OP_INFERRED_MULT_uxn_device_h_l132_c23_1320_right,
BIN_OP_INFERRED_MULT_uxn_device_h_l132_c23_1320_return_output);

-- BIN_OP_PLUS_uxn_device_h_l132_c23_aafd
BIN_OP_PLUS_uxn_device_h_l132_c23_aafd : entity work.BIN_OP_PLUS_uint32_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l132_c23_aafd_left,
BIN_OP_PLUS_uxn_device_h_l132_c23_aafd_right,
BIN_OP_PLUS_uxn_device_h_l132_c23_aafd_return_output);

-- tmp8_MUX_uxn_device_h_l135_c4_5997
tmp8_MUX_uxn_device_h_l135_c4_5997 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l135_c4_5997_cond,
tmp8_MUX_uxn_device_h_l135_c4_5997_iftrue,
tmp8_MUX_uxn_device_h_l135_c4_5997_iffalse,
tmp8_MUX_uxn_device_h_l135_c4_5997_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l135_c4_5997
result_is_deo_done_MUX_uxn_device_h_l135_c4_5997 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l135_c4_5997_cond,
result_is_deo_done_MUX_uxn_device_h_l135_c4_5997_iftrue,
result_is_deo_done_MUX_uxn_device_h_l135_c4_5997_iffalse,
result_is_deo_done_MUX_uxn_device_h_l135_c4_5997_return_output);

-- MUX_uxn_device_h_l136_c13_fc00
MUX_uxn_device_h_l136_c13_fc00 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l136_c13_fc00_cond,
MUX_uxn_device_h_l136_c13_fc00_iftrue,
MUX_uxn_device_h_l136_c13_fc00_iffalse,
MUX_uxn_device_h_l136_c13_fc00_return_output);

-- BIN_OP_OR_uxn_device_h_l136_c5_2489
BIN_OP_OR_uxn_device_h_l136_c5_2489 : entity work.BIN_OP_OR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l136_c5_2489_left,
BIN_OP_OR_uxn_device_h_l136_c5_2489_right,
BIN_OP_OR_uxn_device_h_l136_c5_2489_return_output);

-- MUX_uxn_device_h_l137_c13_2d37
MUX_uxn_device_h_l137_c13_2d37 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l137_c13_2d37_cond,
MUX_uxn_device_h_l137_c13_2d37_iftrue,
MUX_uxn_device_h_l137_c13_2d37_iffalse,
MUX_uxn_device_h_l137_c13_2d37_return_output);

-- BIN_OP_OR_uxn_device_h_l137_c5_ed9d
BIN_OP_OR_uxn_device_h_l137_c5_ed9d : entity work.BIN_OP_OR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l137_c5_ed9d_left,
BIN_OP_OR_uxn_device_h_l137_c5_ed9d_right,
BIN_OP_OR_uxn_device_h_l137_c5_ed9d_return_output);

-- BIN_OP_EQ_uxn_device_h_l148_c11_eb07
BIN_OP_EQ_uxn_device_h_l148_c11_eb07 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l148_c11_eb07_left,
BIN_OP_EQ_uxn_device_h_l148_c11_eb07_right,
BIN_OP_EQ_uxn_device_h_l148_c11_eb07_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l166_c7_2eca
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l166_c7_2eca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l166_c7_2eca_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l166_c7_2eca_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l166_c7_2eca_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l166_c7_2eca_return_output);

-- ram_addr_MUX_uxn_device_h_l148_c7_1e53
ram_addr_MUX_uxn_device_h_l148_c7_1e53 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l148_c7_1e53_cond,
ram_addr_MUX_uxn_device_h_l148_c7_1e53_iftrue,
ram_addr_MUX_uxn_device_h_l148_c7_1e53_iffalse,
ram_addr_MUX_uxn_device_h_l148_c7_1e53_return_output);

-- result_MUX_uxn_device_h_l148_c7_1e53
result_MUX_uxn_device_h_l148_c7_1e53 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l148_c7_1e53_cond,
result_MUX_uxn_device_h_l148_c7_1e53_iftrue,
result_MUX_uxn_device_h_l148_c7_1e53_iffalse,
result_MUX_uxn_device_h_l148_c7_1e53_return_output);

-- auto_advance_MUX_uxn_device_h_l148_c7_1e53
auto_advance_MUX_uxn_device_h_l148_c7_1e53 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l148_c7_1e53_cond,
auto_advance_MUX_uxn_device_h_l148_c7_1e53_iftrue,
auto_advance_MUX_uxn_device_h_l148_c7_1e53_iffalse,
auto_advance_MUX_uxn_device_h_l148_c7_1e53_return_output);

-- x_MUX_uxn_device_h_l148_c7_1e53
x_MUX_uxn_device_h_l148_c7_1e53 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l148_c7_1e53_cond,
x_MUX_uxn_device_h_l148_c7_1e53_iftrue,
x_MUX_uxn_device_h_l148_c7_1e53_iffalse,
x_MUX_uxn_device_h_l148_c7_1e53_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l149_c3_14dc
result_is_vram_write_MUX_uxn_device_h_l149_c3_14dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l149_c3_14dc_cond,
result_is_vram_write_MUX_uxn_device_h_l149_c3_14dc_iftrue,
result_is_vram_write_MUX_uxn_device_h_l149_c3_14dc_iffalse,
result_is_vram_write_MUX_uxn_device_h_l149_c3_14dc_return_output);

-- result_u16_addr_MUX_uxn_device_h_l149_c3_14dc
result_u16_addr_MUX_uxn_device_h_l149_c3_14dc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_addr_MUX_uxn_device_h_l149_c3_14dc_cond,
result_u16_addr_MUX_uxn_device_h_l149_c3_14dc_iftrue,
result_u16_addr_MUX_uxn_device_h_l149_c3_14dc_iffalse,
result_u16_addr_MUX_uxn_device_h_l149_c3_14dc_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l149_c3_14dc
result_device_ram_address_MUX_uxn_device_h_l149_c3_14dc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l149_c3_14dc_cond,
result_device_ram_address_MUX_uxn_device_h_l149_c3_14dc_iftrue,
result_device_ram_address_MUX_uxn_device_h_l149_c3_14dc_iffalse,
result_device_ram_address_MUX_uxn_device_h_l149_c3_14dc_return_output);

-- result_u8_value_MUX_uxn_device_h_l149_c3_14dc
result_u8_value_MUX_uxn_device_h_l149_c3_14dc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l149_c3_14dc_cond,
result_u8_value_MUX_uxn_device_h_l149_c3_14dc_iftrue,
result_u8_value_MUX_uxn_device_h_l149_c3_14dc_iffalse,
result_u8_value_MUX_uxn_device_h_l149_c3_14dc_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l149_c3_14dc
result_is_device_ram_write_MUX_uxn_device_h_l149_c3_14dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l149_c3_14dc_cond,
result_is_device_ram_write_MUX_uxn_device_h_l149_c3_14dc_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l149_c3_14dc_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l149_c3_14dc_return_output);

-- auto_advance_MUX_uxn_device_h_l149_c3_14dc
auto_advance_MUX_uxn_device_h_l149_c3_14dc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l149_c3_14dc_cond,
auto_advance_MUX_uxn_device_h_l149_c3_14dc_iftrue,
auto_advance_MUX_uxn_device_h_l149_c3_14dc_iffalse,
auto_advance_MUX_uxn_device_h_l149_c3_14dc_return_output);

-- x_MUX_uxn_device_h_l149_c3_14dc
x_MUX_uxn_device_h_l149_c3_14dc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l149_c3_14dc_cond,
x_MUX_uxn_device_h_l149_c3_14dc_iftrue,
x_MUX_uxn_device_h_l149_c3_14dc_iffalse,
x_MUX_uxn_device_h_l149_c3_14dc_return_output);

-- BIN_OP_AND_uxn_device_h_l154_c8_ae17
BIN_OP_AND_uxn_device_h_l154_c8_ae17 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l154_c8_ae17_left,
BIN_OP_AND_uxn_device_h_l154_c8_ae17_right,
BIN_OP_AND_uxn_device_h_l154_c8_ae17_return_output);

-- BIN_OP_NEQ_uxn_device_h_l154_c8_b0da
BIN_OP_NEQ_uxn_device_h_l154_c8_b0da : entity work.BIN_OP_NEQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_NEQ_uxn_device_h_l154_c8_b0da_left,
BIN_OP_NEQ_uxn_device_h_l154_c8_b0da_right,
BIN_OP_NEQ_uxn_device_h_l154_c8_b0da_return_output);

-- result_u8_value_MUX_uxn_device_h_l154_c4_357e
result_u8_value_MUX_uxn_device_h_l154_c4_357e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l154_c4_357e_cond,
result_u8_value_MUX_uxn_device_h_l154_c4_357e_iftrue,
result_u8_value_MUX_uxn_device_h_l154_c4_357e_iffalse,
result_u8_value_MUX_uxn_device_h_l154_c4_357e_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l154_c4_357e
result_device_ram_address_MUX_uxn_device_h_l154_c4_357e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l154_c4_357e_cond,
result_device_ram_address_MUX_uxn_device_h_l154_c4_357e_iftrue,
result_device_ram_address_MUX_uxn_device_h_l154_c4_357e_iffalse,
result_device_ram_address_MUX_uxn_device_h_l154_c4_357e_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l154_c4_357e
result_is_device_ram_write_MUX_uxn_device_h_l154_c4_357e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l154_c4_357e_cond,
result_is_device_ram_write_MUX_uxn_device_h_l154_c4_357e_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l154_c4_357e_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l154_c4_357e_return_output);

-- x_MUX_uxn_device_h_l154_c4_357e
x_MUX_uxn_device_h_l154_c4_357e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l154_c4_357e_cond,
x_MUX_uxn_device_h_l154_c4_357e_iftrue,
x_MUX_uxn_device_h_l154_c4_357e_iffalse,
x_MUX_uxn_device_h_l154_c4_357e_return_output);

-- BIN_OP_PLUS_uxn_device_h_l155_c5_7320
BIN_OP_PLUS_uxn_device_h_l155_c5_7320 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l155_c5_7320_left,
BIN_OP_PLUS_uxn_device_h_l155_c5_7320_right,
BIN_OP_PLUS_uxn_device_h_l155_c5_7320_return_output);

-- CONST_SR_8_uxn_device_h_l158_c33_edf3
CONST_SR_8_uxn_device_h_l158_c33_edf3 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_device_h_l158_c33_edf3_x,
CONST_SR_8_uxn_device_h_l158_c33_edf3_return_output);

-- BIN_OP_EQ_uxn_device_h_l166_c11_fd8a
BIN_OP_EQ_uxn_device_h_l166_c11_fd8a : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l166_c11_fd8a_left,
BIN_OP_EQ_uxn_device_h_l166_c11_fd8a_right,
BIN_OP_EQ_uxn_device_h_l166_c11_fd8a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l179_c7_8b67
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l179_c7_8b67 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l179_c7_8b67_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l179_c7_8b67_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l179_c7_8b67_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l179_c7_8b67_return_output);

-- ram_addr_MUX_uxn_device_h_l166_c7_2eca
ram_addr_MUX_uxn_device_h_l166_c7_2eca : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l166_c7_2eca_cond,
ram_addr_MUX_uxn_device_h_l166_c7_2eca_iftrue,
ram_addr_MUX_uxn_device_h_l166_c7_2eca_iffalse,
ram_addr_MUX_uxn_device_h_l166_c7_2eca_return_output);

-- result_MUX_uxn_device_h_l166_c7_2eca
result_MUX_uxn_device_h_l166_c7_2eca : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l166_c7_2eca_cond,
result_MUX_uxn_device_h_l166_c7_2eca_iftrue,
result_MUX_uxn_device_h_l166_c7_2eca_iffalse,
result_MUX_uxn_device_h_l166_c7_2eca_return_output);

-- ram_addr_MUX_uxn_device_h_l167_c3_d4a4
ram_addr_MUX_uxn_device_h_l167_c3_d4a4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l167_c3_d4a4_cond,
ram_addr_MUX_uxn_device_h_l167_c3_d4a4_iftrue,
ram_addr_MUX_uxn_device_h_l167_c3_d4a4_iffalse,
ram_addr_MUX_uxn_device_h_l167_c3_d4a4_return_output);

-- result_u8_value_MUX_uxn_device_h_l167_c3_d4a4
result_u8_value_MUX_uxn_device_h_l167_c3_d4a4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l167_c3_d4a4_cond,
result_u8_value_MUX_uxn_device_h_l167_c3_d4a4_iftrue,
result_u8_value_MUX_uxn_device_h_l167_c3_d4a4_iffalse,
result_u8_value_MUX_uxn_device_h_l167_c3_d4a4_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l167_c3_d4a4
result_device_ram_address_MUX_uxn_device_h_l167_c3_d4a4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l167_c3_d4a4_cond,
result_device_ram_address_MUX_uxn_device_h_l167_c3_d4a4_iftrue,
result_device_ram_address_MUX_uxn_device_h_l167_c3_d4a4_iffalse,
result_device_ram_address_MUX_uxn_device_h_l167_c3_d4a4_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l167_c3_d4a4
result_is_device_ram_write_MUX_uxn_device_h_l167_c3_d4a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l167_c3_d4a4_cond,
result_is_device_ram_write_MUX_uxn_device_h_l167_c3_d4a4_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l167_c3_d4a4_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l167_c3_d4a4_return_output);

-- BIN_OP_AND_uxn_device_h_l168_c8_ed49
BIN_OP_AND_uxn_device_h_l168_c8_ed49 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l168_c8_ed49_left,
BIN_OP_AND_uxn_device_h_l168_c8_ed49_right,
BIN_OP_AND_uxn_device_h_l168_c8_ed49_return_output);

-- BIN_OP_NEQ_uxn_device_h_l168_c8_07d4
BIN_OP_NEQ_uxn_device_h_l168_c8_07d4 : entity work.BIN_OP_NEQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_NEQ_uxn_device_h_l168_c8_07d4_left,
BIN_OP_NEQ_uxn_device_h_l168_c8_07d4_right,
BIN_OP_NEQ_uxn_device_h_l168_c8_07d4_return_output);

-- result_u8_value_MUX_uxn_device_h_l168_c4_8e3f
result_u8_value_MUX_uxn_device_h_l168_c4_8e3f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l168_c4_8e3f_cond,
result_u8_value_MUX_uxn_device_h_l168_c4_8e3f_iftrue,
result_u8_value_MUX_uxn_device_h_l168_c4_8e3f_iffalse,
result_u8_value_MUX_uxn_device_h_l168_c4_8e3f_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l168_c4_8e3f
result_device_ram_address_MUX_uxn_device_h_l168_c4_8e3f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l168_c4_8e3f_cond,
result_device_ram_address_MUX_uxn_device_h_l168_c4_8e3f_iftrue,
result_device_ram_address_MUX_uxn_device_h_l168_c4_8e3f_iffalse,
result_device_ram_address_MUX_uxn_device_h_l168_c4_8e3f_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l168_c4_8e3f
result_is_device_ram_write_MUX_uxn_device_h_l168_c4_8e3f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l168_c4_8e3f_cond,
result_is_device_ram_write_MUX_uxn_device_h_l168_c4_8e3f_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l168_c4_8e3f_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l168_c4_8e3f_return_output);

-- BIN_OP_EQ_uxn_device_h_l179_c11_c3d6
BIN_OP_EQ_uxn_device_h_l179_c11_c3d6 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l179_c11_c3d6_left,
BIN_OP_EQ_uxn_device_h_l179_c11_c3d6_right,
BIN_OP_EQ_uxn_device_h_l179_c11_c3d6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l191_c7_cd63
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l191_c7_cd63 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l191_c7_cd63_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l191_c7_cd63_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l191_c7_cd63_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l191_c7_cd63_return_output);

-- ram_addr_MUX_uxn_device_h_l179_c7_8b67
ram_addr_MUX_uxn_device_h_l179_c7_8b67 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l179_c7_8b67_cond,
ram_addr_MUX_uxn_device_h_l179_c7_8b67_iftrue,
ram_addr_MUX_uxn_device_h_l179_c7_8b67_iffalse,
ram_addr_MUX_uxn_device_h_l179_c7_8b67_return_output);

-- result_MUX_uxn_device_h_l179_c7_8b67
result_MUX_uxn_device_h_l179_c7_8b67 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l179_c7_8b67_cond,
result_MUX_uxn_device_h_l179_c7_8b67_iftrue,
result_MUX_uxn_device_h_l179_c7_8b67_iffalse,
result_MUX_uxn_device_h_l179_c7_8b67_return_output);

-- ram_addr_MUX_uxn_device_h_l180_c3_80c6
ram_addr_MUX_uxn_device_h_l180_c3_80c6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l180_c3_80c6_cond,
ram_addr_MUX_uxn_device_h_l180_c3_80c6_iftrue,
ram_addr_MUX_uxn_device_h_l180_c3_80c6_iffalse,
ram_addr_MUX_uxn_device_h_l180_c3_80c6_return_output);

-- result_u8_value_MUX_uxn_device_h_l180_c3_80c6
result_u8_value_MUX_uxn_device_h_l180_c3_80c6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l180_c3_80c6_cond,
result_u8_value_MUX_uxn_device_h_l180_c3_80c6_iftrue,
result_u8_value_MUX_uxn_device_h_l180_c3_80c6_iffalse,
result_u8_value_MUX_uxn_device_h_l180_c3_80c6_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l180_c3_80c6
result_device_ram_address_MUX_uxn_device_h_l180_c3_80c6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l180_c3_80c6_cond,
result_device_ram_address_MUX_uxn_device_h_l180_c3_80c6_iftrue,
result_device_ram_address_MUX_uxn_device_h_l180_c3_80c6_iffalse,
result_device_ram_address_MUX_uxn_device_h_l180_c3_80c6_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l180_c3_80c6
result_is_device_ram_write_MUX_uxn_device_h_l180_c3_80c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l180_c3_80c6_cond,
result_is_device_ram_write_MUX_uxn_device_h_l180_c3_80c6_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l180_c3_80c6_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l180_c3_80c6_return_output);

-- BIN_OP_AND_uxn_device_h_l181_c9_40bb
BIN_OP_AND_uxn_device_h_l181_c9_40bb : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l181_c9_40bb_left,
BIN_OP_AND_uxn_device_h_l181_c9_40bb_right,
BIN_OP_AND_uxn_device_h_l181_c9_40bb_return_output);

-- BIN_OP_NEQ_uxn_device_h_l181_c9_8f6a
BIN_OP_NEQ_uxn_device_h_l181_c9_8f6a : entity work.BIN_OP_NEQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_NEQ_uxn_device_h_l181_c9_8f6a_left,
BIN_OP_NEQ_uxn_device_h_l181_c9_8f6a_right,
BIN_OP_NEQ_uxn_device_h_l181_c9_8f6a_return_output);

-- result_u8_value_MUX_uxn_device_h_l181_c4_d009
result_u8_value_MUX_uxn_device_h_l181_c4_d009 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l181_c4_d009_cond,
result_u8_value_MUX_uxn_device_h_l181_c4_d009_iftrue,
result_u8_value_MUX_uxn_device_h_l181_c4_d009_iffalse,
result_u8_value_MUX_uxn_device_h_l181_c4_d009_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l181_c4_d009
result_device_ram_address_MUX_uxn_device_h_l181_c4_d009 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l181_c4_d009_cond,
result_device_ram_address_MUX_uxn_device_h_l181_c4_d009_iftrue,
result_device_ram_address_MUX_uxn_device_h_l181_c4_d009_iffalse,
result_device_ram_address_MUX_uxn_device_h_l181_c4_d009_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l181_c4_d009
result_is_device_ram_write_MUX_uxn_device_h_l181_c4_d009 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l181_c4_d009_cond,
result_is_device_ram_write_MUX_uxn_device_h_l181_c4_d009_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l181_c4_d009_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l181_c4_d009_return_output);

-- CONST_SR_8_uxn_device_h_l184_c33_ae1a
CONST_SR_8_uxn_device_h_l184_c33_ae1a : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_device_h_l184_c33_ae1a_x,
CONST_SR_8_uxn_device_h_l184_c33_ae1a_return_output);

-- BIN_OP_OR_uxn_device_h_l188_c4_cc12
BIN_OP_OR_uxn_device_h_l188_c4_cc12 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l188_c4_cc12_left,
BIN_OP_OR_uxn_device_h_l188_c4_cc12_right,
BIN_OP_OR_uxn_device_h_l188_c4_cc12_return_output);

-- BIN_OP_EQ_uxn_device_h_l191_c11_be1b
BIN_OP_EQ_uxn_device_h_l191_c11_be1b : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l191_c11_be1b_left,
BIN_OP_EQ_uxn_device_h_l191_c11_be1b_right,
BIN_OP_EQ_uxn_device_h_l191_c11_be1b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l200_c1_2e5f
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l200_c1_2e5f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l200_c1_2e5f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l200_c1_2e5f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l200_c1_2e5f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l200_c1_2e5f_return_output);

-- result_MUX_uxn_device_h_l191_c7_cd63
result_MUX_uxn_device_h_l191_c7_cd63 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l191_c7_cd63_cond,
result_MUX_uxn_device_h_l191_c7_cd63_iftrue,
result_MUX_uxn_device_h_l191_c7_cd63_iffalse,
result_MUX_uxn_device_h_l191_c7_cd63_return_output);

-- result_u8_value_MUX_uxn_device_h_l192_c3_f6d1
result_u8_value_MUX_uxn_device_h_l192_c3_f6d1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l192_c3_f6d1_cond,
result_u8_value_MUX_uxn_device_h_l192_c3_f6d1_iftrue,
result_u8_value_MUX_uxn_device_h_l192_c3_f6d1_iffalse,
result_u8_value_MUX_uxn_device_h_l192_c3_f6d1_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l192_c3_f6d1
result_device_ram_address_MUX_uxn_device_h_l192_c3_f6d1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l192_c3_f6d1_cond,
result_device_ram_address_MUX_uxn_device_h_l192_c3_f6d1_iftrue,
result_device_ram_address_MUX_uxn_device_h_l192_c3_f6d1_iffalse,
result_device_ram_address_MUX_uxn_device_h_l192_c3_f6d1_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l192_c3_f6d1
result_is_device_ram_write_MUX_uxn_device_h_l192_c3_f6d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l192_c3_f6d1_cond,
result_is_device_ram_write_MUX_uxn_device_h_l192_c3_f6d1_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l192_c3_f6d1_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l192_c3_f6d1_return_output);

-- BIN_OP_AND_uxn_device_h_l193_c9_369e
BIN_OP_AND_uxn_device_h_l193_c9_369e : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l193_c9_369e_left,
BIN_OP_AND_uxn_device_h_l193_c9_369e_right,
BIN_OP_AND_uxn_device_h_l193_c9_369e_return_output);

-- BIN_OP_NEQ_uxn_device_h_l193_c9_2a63
BIN_OP_NEQ_uxn_device_h_l193_c9_2a63 : entity work.BIN_OP_NEQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_NEQ_uxn_device_h_l193_c9_2a63_left,
BIN_OP_NEQ_uxn_device_h_l193_c9_2a63_right,
BIN_OP_NEQ_uxn_device_h_l193_c9_2a63_return_output);

-- result_u8_value_MUX_uxn_device_h_l193_c4_da12
result_u8_value_MUX_uxn_device_h_l193_c4_da12 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l193_c4_da12_cond,
result_u8_value_MUX_uxn_device_h_l193_c4_da12_iftrue,
result_u8_value_MUX_uxn_device_h_l193_c4_da12_iffalse,
result_u8_value_MUX_uxn_device_h_l193_c4_da12_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l193_c4_da12
result_device_ram_address_MUX_uxn_device_h_l193_c4_da12 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l193_c4_da12_cond,
result_device_ram_address_MUX_uxn_device_h_l193_c4_da12_iftrue,
result_device_ram_address_MUX_uxn_device_h_l193_c4_da12_iffalse,
result_device_ram_address_MUX_uxn_device_h_l193_c4_da12_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l193_c4_da12
result_is_device_ram_write_MUX_uxn_device_h_l193_c4_da12 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l193_c4_da12_cond,
result_is_device_ram_write_MUX_uxn_device_h_l193_c4_da12_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l193_c4_da12_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l193_c4_da12_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_c523
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_c523 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_c523_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_c523_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_c523_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_c523_return_output);

-- result_MUX_uxn_device_h_l201_c3_2947
result_MUX_uxn_device_h_l201_c3_2947 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l201_c3_2947_cond,
result_MUX_uxn_device_h_l201_c3_2947_iftrue,
result_MUX_uxn_device_h_l201_c3_2947_iffalse,
result_MUX_uxn_device_h_l201_c3_2947_return_output);

-- BIN_OP_MINUS_uxn_device_h_l202_c58_fd83
BIN_OP_MINUS_uxn_device_h_l202_c58_fd83 : entity work.BIN_OP_MINUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l202_c58_fd83_left,
BIN_OP_MINUS_uxn_device_h_l202_c58_fd83_right,
BIN_OP_MINUS_uxn_device_h_l202_c58_fd83_return_output);

-- screen_blit_uxn_device_h_l202_c46_90b0
screen_blit_uxn_device_h_l202_c46_90b0 : entity work.screen_blit_0CLK_89be7393 port map (
clk,
screen_blit_uxn_device_h_l202_c46_90b0_CLOCK_ENABLE,
screen_blit_uxn_device_h_l202_c46_90b0_phase,
screen_blit_uxn_device_h_l202_c46_90b0_ctrl,
screen_blit_uxn_device_h_l202_c46_90b0_auto_advance,
screen_blit_uxn_device_h_l202_c46_90b0_x,
screen_blit_uxn_device_h_l202_c46_90b0_y,
screen_blit_uxn_device_h_l202_c46_90b0_ram_addr,
screen_blit_uxn_device_h_l202_c46_90b0_previous_ram_read,
screen_blit_uxn_device_h_l202_c46_90b0_return_output);

-- CONST_SL_8_uint16_t_uxn_device_h_l176_l124_l115_DUPLICATE_ef81
CONST_SL_8_uint16_t_uxn_device_h_l176_l124_l115_DUPLICATE_ef81 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_device_h_l176_l124_l115_DUPLICATE_ef81_x,
CONST_SL_8_uint16_t_uxn_device_h_l176_l124_l115_DUPLICATE_ef81_return_output);

-- BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l144_l130_DUPLICATE_bfc9
BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l144_l130_DUPLICATE_bfc9 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l144_l130_DUPLICATE_bfc9_left,
BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l144_l130_DUPLICATE_bfc9_right,
BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l144_l130_DUPLICATE_bfc9_return_output);

-- CONST_SR_1_uint8_t_uxn_device_h_l193_l181_DUPLICATE_a566
CONST_SR_1_uint8_t_uxn_device_h_l193_l181_DUPLICATE_a566 : entity work.CONST_SR_1_uint8_t_0CLK_de264c78 port map (
CONST_SR_1_uint8_t_uxn_device_h_l193_l181_DUPLICATE_a566_x,
CONST_SR_1_uint8_t_uxn_device_h_l193_l181_DUPLICATE_a566_return_output);



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
 BIN_OP_EQ_uxn_device_h_l88_c6_57f5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_ddd9_return_output,
 layer_MUX_uxn_device_h_l88_c2_7de5_return_output,
 tmp8_MUX_uxn_device_h_l88_c2_7de5_return_output,
 is_drawing_port_MUX_uxn_device_h_l88_c2_7de5_return_output,
 ctrl_mode_MUX_uxn_device_h_l88_c2_7de5_return_output,
 flip_y_MUX_uxn_device_h_l88_c2_7de5_return_output,
 is_pixel_port_MUX_uxn_device_h_l88_c2_7de5_return_output,
 color_MUX_uxn_device_h_l88_c2_7de5_return_output,
 ctrl_MUX_uxn_device_h_l88_c2_7de5_return_output,
 y_MUX_uxn_device_h_l88_c2_7de5_return_output,
 is_sprite_port_MUX_uxn_device_h_l88_c2_7de5_return_output,
 ram_addr_MUX_uxn_device_h_l88_c2_7de5_return_output,
 result_MUX_uxn_device_h_l88_c2_7de5_return_output,
 auto_advance_MUX_uxn_device_h_l88_c2_7de5_return_output,
 x_MUX_uxn_device_h_l88_c2_7de5_return_output,
 flip_x_MUX_uxn_device_h_l88_c2_7de5_return_output,
 BIN_OP_EQ_uxn_device_h_l89_c19_cd0f_return_output,
 MUX_uxn_device_h_l89_c19_23eb_return_output,
 BIN_OP_EQ_uxn_device_h_l90_c20_324b_return_output,
 MUX_uxn_device_h_l90_c20_342e_return_output,
 BIN_OP_OR_uxn_device_h_l91_c21_a2f8_return_output,
 result_device_ram_address_MUX_uxn_device_h_l94_c3_e2e9_return_output,
 result_is_deo_done_MUX_uxn_device_h_l94_c3_e2e9_return_output,
 MUX_uxn_device_h_l95_c32_0a7c_return_output,
 BIN_OP_EQ_uxn_device_h_l101_c11_f9e0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_6998_return_output,
 layer_MUX_uxn_device_h_l101_c7_ddd9_return_output,
 tmp8_MUX_uxn_device_h_l101_c7_ddd9_return_output,
 ctrl_mode_MUX_uxn_device_h_l101_c7_ddd9_return_output,
 flip_y_MUX_uxn_device_h_l101_c7_ddd9_return_output,
 color_MUX_uxn_device_h_l101_c7_ddd9_return_output,
 ctrl_MUX_uxn_device_h_l101_c7_ddd9_return_output,
 y_MUX_uxn_device_h_l101_c7_ddd9_return_output,
 ram_addr_MUX_uxn_device_h_l101_c7_ddd9_return_output,
 result_MUX_uxn_device_h_l101_c7_ddd9_return_output,
 auto_advance_MUX_uxn_device_h_l101_c7_ddd9_return_output,
 x_MUX_uxn_device_h_l101_c7_ddd9_return_output,
 flip_x_MUX_uxn_device_h_l101_c7_ddd9_return_output,
 BIN_OP_EQ_uxn_device_h_l104_c11_5630_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_7203_return_output,
 layer_MUX_uxn_device_h_l104_c7_6998_return_output,
 tmp8_MUX_uxn_device_h_l104_c7_6998_return_output,
 ctrl_mode_MUX_uxn_device_h_l104_c7_6998_return_output,
 flip_y_MUX_uxn_device_h_l104_c7_6998_return_output,
 color_MUX_uxn_device_h_l104_c7_6998_return_output,
 ctrl_MUX_uxn_device_h_l104_c7_6998_return_output,
 y_MUX_uxn_device_h_l104_c7_6998_return_output,
 ram_addr_MUX_uxn_device_h_l104_c7_6998_return_output,
 result_MUX_uxn_device_h_l104_c7_6998_return_output,
 auto_advance_MUX_uxn_device_h_l104_c7_6998_return_output,
 x_MUX_uxn_device_h_l104_c7_6998_return_output,
 flip_x_MUX_uxn_device_h_l104_c7_6998_return_output,
 CONST_SR_7_uxn_device_h_l107_c25_6c47_return_output,
 CONST_SR_6_uxn_device_h_l108_c21_d5e2_return_output,
 CONST_SR_5_uxn_device_h_l109_c22_18e8_return_output,
 CONST_SR_4_uxn_device_h_l110_c22_e45c_return_output,
 BIN_OP_EQ_uxn_device_h_l113_c11_f4fd_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c7_7b60_return_output,
 tmp8_MUX_uxn_device_h_l113_c7_7203_return_output,
 y_MUX_uxn_device_h_l113_c7_7203_return_output,
 ram_addr_MUX_uxn_device_h_l113_c7_7203_return_output,
 result_MUX_uxn_device_h_l113_c7_7203_return_output,
 auto_advance_MUX_uxn_device_h_l113_c7_7203_return_output,
 x_MUX_uxn_device_h_l113_c7_7203_return_output,
 BIN_OP_EQ_uxn_device_h_l118_c11_05f2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l122_c7_9b61_return_output,
 tmp8_MUX_uxn_device_h_l118_c7_7b60_return_output,
 y_MUX_uxn_device_h_l118_c7_7b60_return_output,
 ram_addr_MUX_uxn_device_h_l118_c7_7b60_return_output,
 result_MUX_uxn_device_h_l118_c7_7b60_return_output,
 auto_advance_MUX_uxn_device_h_l118_c7_7b60_return_output,
 x_MUX_uxn_device_h_l118_c7_7b60_return_output,
 BIN_OP_OR_uxn_device_h_l119_c3_07a8_return_output,
 BIN_OP_EQ_uxn_device_h_l122_c11_7545_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l127_c7_6d1f_return_output,
 tmp8_MUX_uxn_device_h_l122_c7_9b61_return_output,
 y_MUX_uxn_device_h_l122_c7_9b61_return_output,
 ram_addr_MUX_uxn_device_h_l122_c7_9b61_return_output,
 result_MUX_uxn_device_h_l122_c7_9b61_return_output,
 auto_advance_MUX_uxn_device_h_l122_c7_9b61_return_output,
 x_MUX_uxn_device_h_l122_c7_9b61_return_output,
 BIN_OP_EQ_uxn_device_h_l127_c11_05dc_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l148_c7_1e53_return_output,
 tmp8_MUX_uxn_device_h_l127_c7_6d1f_return_output,
 y_MUX_uxn_device_h_l127_c7_6d1f_return_output,
 ram_addr_MUX_uxn_device_h_l127_c7_6d1f_return_output,
 result_MUX_uxn_device_h_l127_c7_6d1f_return_output,
 auto_advance_MUX_uxn_device_h_l127_c7_6d1f_return_output,
 x_MUX_uxn_device_h_l127_c7_6d1f_return_output,
 tmp8_MUX_uxn_device_h_l128_c3_00c7_return_output,
 y_MUX_uxn_device_h_l128_c3_00c7_return_output,
 result_is_deo_done_MUX_uxn_device_h_l128_c3_00c7_return_output,
 result_u16_addr_MUX_uxn_device_h_l128_c3_00c7_return_output,
 result_is_vram_write_MUX_uxn_device_h_l128_c3_00c7_return_output,
 result_u8_value_MUX_uxn_device_h_l128_c3_00c7_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l128_c3_00c7_return_output,
 result_device_ram_address_MUX_uxn_device_h_l128_c3_00c7_return_output,
 BIN_OP_AND_uxn_device_h_l131_c11_3ecd_return_output,
 BIN_OP_INFERRED_MULT_uxn_device_h_l132_c23_1320_return_output,
 BIN_OP_PLUS_uxn_device_h_l132_c23_aafd_return_output,
 tmp8_MUX_uxn_device_h_l135_c4_5997_return_output,
 result_is_deo_done_MUX_uxn_device_h_l135_c4_5997_return_output,
 MUX_uxn_device_h_l136_c13_fc00_return_output,
 BIN_OP_OR_uxn_device_h_l136_c5_2489_return_output,
 MUX_uxn_device_h_l137_c13_2d37_return_output,
 BIN_OP_OR_uxn_device_h_l137_c5_ed9d_return_output,
 BIN_OP_EQ_uxn_device_h_l148_c11_eb07_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l166_c7_2eca_return_output,
 ram_addr_MUX_uxn_device_h_l148_c7_1e53_return_output,
 result_MUX_uxn_device_h_l148_c7_1e53_return_output,
 auto_advance_MUX_uxn_device_h_l148_c7_1e53_return_output,
 x_MUX_uxn_device_h_l148_c7_1e53_return_output,
 result_is_vram_write_MUX_uxn_device_h_l149_c3_14dc_return_output,
 result_u16_addr_MUX_uxn_device_h_l149_c3_14dc_return_output,
 result_device_ram_address_MUX_uxn_device_h_l149_c3_14dc_return_output,
 result_u8_value_MUX_uxn_device_h_l149_c3_14dc_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l149_c3_14dc_return_output,
 auto_advance_MUX_uxn_device_h_l149_c3_14dc_return_output,
 x_MUX_uxn_device_h_l149_c3_14dc_return_output,
 BIN_OP_AND_uxn_device_h_l154_c8_ae17_return_output,
 BIN_OP_NEQ_uxn_device_h_l154_c8_b0da_return_output,
 result_u8_value_MUX_uxn_device_h_l154_c4_357e_return_output,
 result_device_ram_address_MUX_uxn_device_h_l154_c4_357e_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l154_c4_357e_return_output,
 x_MUX_uxn_device_h_l154_c4_357e_return_output,
 BIN_OP_PLUS_uxn_device_h_l155_c5_7320_return_output,
 CONST_SR_8_uxn_device_h_l158_c33_edf3_return_output,
 BIN_OP_EQ_uxn_device_h_l166_c11_fd8a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l179_c7_8b67_return_output,
 ram_addr_MUX_uxn_device_h_l166_c7_2eca_return_output,
 result_MUX_uxn_device_h_l166_c7_2eca_return_output,
 ram_addr_MUX_uxn_device_h_l167_c3_d4a4_return_output,
 result_u8_value_MUX_uxn_device_h_l167_c3_d4a4_return_output,
 result_device_ram_address_MUX_uxn_device_h_l167_c3_d4a4_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l167_c3_d4a4_return_output,
 BIN_OP_AND_uxn_device_h_l168_c8_ed49_return_output,
 BIN_OP_NEQ_uxn_device_h_l168_c8_07d4_return_output,
 result_u8_value_MUX_uxn_device_h_l168_c4_8e3f_return_output,
 result_device_ram_address_MUX_uxn_device_h_l168_c4_8e3f_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l168_c4_8e3f_return_output,
 BIN_OP_EQ_uxn_device_h_l179_c11_c3d6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l191_c7_cd63_return_output,
 ram_addr_MUX_uxn_device_h_l179_c7_8b67_return_output,
 result_MUX_uxn_device_h_l179_c7_8b67_return_output,
 ram_addr_MUX_uxn_device_h_l180_c3_80c6_return_output,
 result_u8_value_MUX_uxn_device_h_l180_c3_80c6_return_output,
 result_device_ram_address_MUX_uxn_device_h_l180_c3_80c6_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l180_c3_80c6_return_output,
 BIN_OP_AND_uxn_device_h_l181_c9_40bb_return_output,
 BIN_OP_NEQ_uxn_device_h_l181_c9_8f6a_return_output,
 result_u8_value_MUX_uxn_device_h_l181_c4_d009_return_output,
 result_device_ram_address_MUX_uxn_device_h_l181_c4_d009_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l181_c4_d009_return_output,
 CONST_SR_8_uxn_device_h_l184_c33_ae1a_return_output,
 BIN_OP_OR_uxn_device_h_l188_c4_cc12_return_output,
 BIN_OP_EQ_uxn_device_h_l191_c11_be1b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l200_c1_2e5f_return_output,
 result_MUX_uxn_device_h_l191_c7_cd63_return_output,
 result_u8_value_MUX_uxn_device_h_l192_c3_f6d1_return_output,
 result_device_ram_address_MUX_uxn_device_h_l192_c3_f6d1_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l192_c3_f6d1_return_output,
 BIN_OP_AND_uxn_device_h_l193_c9_369e_return_output,
 BIN_OP_NEQ_uxn_device_h_l193_c9_2a63_return_output,
 result_u8_value_MUX_uxn_device_h_l193_c4_da12_return_output,
 result_device_ram_address_MUX_uxn_device_h_l193_c4_da12_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l193_c4_da12_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_c523_return_output,
 result_MUX_uxn_device_h_l201_c3_2947_return_output,
 BIN_OP_MINUS_uxn_device_h_l202_c58_fd83_return_output,
 screen_blit_uxn_device_h_l202_c46_90b0_return_output,
 CONST_SL_8_uint16_t_uxn_device_h_l176_l124_l115_DUPLICATE_ef81_return_output,
 BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l144_l130_DUPLICATE_bfc9_return_output,
 CONST_SR_1_uint8_t_uxn_device_h_l193_l181_DUPLICATE_a566_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : device_out_result_t;
 variable VAR_device_port : unsigned(3 downto 0);
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l88_c6_57f5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l88_c6_57f5_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l88_c6_57f5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_ddd9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_ddd9_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_ddd9_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_ddd9_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l88_c2_7de5_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l88_c2_7de5_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l101_c7_ddd9_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l88_c2_7de5_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l88_c2_7de5_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l88_c2_7de5_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l88_c2_7de5_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l101_c7_ddd9_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l88_c2_7de5_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l88_c2_7de5_cond : unsigned(0 downto 0);
 variable VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_7de5_iftrue : unsigned(0 downto 0);
 variable VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_7de5_iffalse : unsigned(0 downto 0);
 variable VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_7de5_return_output : unsigned(0 downto 0);
 variable VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_7de5_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_7de5_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_7de5_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_ddd9_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_7de5_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_7de5_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l88_c2_7de5_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l88_c2_7de5_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l101_c7_ddd9_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l88_c2_7de5_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l88_c2_7de5_cond : unsigned(0 downto 0);
 variable VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_7de5_iftrue : unsigned(0 downto 0);
 variable VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_7de5_iffalse : unsigned(0 downto 0);
 variable VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_7de5_return_output : unsigned(0 downto 0);
 variable VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_7de5_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l88_c2_7de5_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l88_c2_7de5_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l101_c7_ddd9_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l88_c2_7de5_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l88_c2_7de5_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l88_c2_7de5_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l88_c2_7de5_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l101_c7_ddd9_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l88_c2_7de5_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l88_c2_7de5_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l88_c2_7de5_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l88_c2_7de5_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l101_c7_ddd9_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l88_c2_7de5_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l88_c2_7de5_cond : unsigned(0 downto 0);
 variable VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_7de5_iftrue : unsigned(0 downto 0);
 variable VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_7de5_iffalse : unsigned(0 downto 0);
 variable VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_7de5_return_output : unsigned(0 downto 0);
 variable VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_7de5_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l88_c2_7de5_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l88_c2_7de5_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l101_c7_ddd9_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l88_c2_7de5_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l88_c2_7de5_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l88_c2_7de5_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_56ba_uxn_device_h_l88_c2_7de5_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l88_c2_7de5_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l101_c7_ddd9_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l88_c2_7de5_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l88_c2_7de5_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l88_c2_7de5_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l88_c2_7de5_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l101_c7_ddd9_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l88_c2_7de5_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l88_c2_7de5_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l88_c2_7de5_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l88_c2_7de5_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l101_c7_ddd9_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l88_c2_7de5_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l88_c2_7de5_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l88_c2_7de5_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l88_c2_7de5_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l101_c7_ddd9_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l88_c2_7de5_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l88_c2_7de5_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l89_c19_23eb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l89_c19_cd0f_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l89_c19_cd0f_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l89_c19_cd0f_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l89_c19_23eb_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l89_c19_23eb_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l89_c19_23eb_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l90_c20_342e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l90_c20_324b_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l90_c20_324b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l90_c20_324b_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l90_c20_342e_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l90_c20_342e_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l90_c20_342e_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l91_c21_a2f8_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l91_c21_a2f8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l91_c21_a2f8_return_output : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_e2e9_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_e2e9_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_e2e9_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_e2e9_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_e2e9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_e2e9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_e2e9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_e2e9_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l95_c32_0a7c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l95_c32_0a7c_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l95_c32_0a7c_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l95_c32_0a7c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l101_c11_f9e0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l101_c11_f9e0_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l101_c11_f9e0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_6998_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_6998_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_6998_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_6998_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l101_c7_ddd9_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l101_c7_ddd9_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l104_c7_6998_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l101_c7_ddd9_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l101_c7_ddd9_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l101_c7_ddd9_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l104_c7_6998_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l101_c7_ddd9_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_ddd9_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_ddd9_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l104_c7_6998_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_ddd9_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l101_c7_ddd9_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l101_c7_ddd9_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l104_c7_6998_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l101_c7_ddd9_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l101_c7_ddd9_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l101_c7_ddd9_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l104_c7_6998_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l101_c7_ddd9_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l101_c7_ddd9_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l101_c7_ddd9_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l104_c7_6998_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l101_c7_ddd9_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l101_c7_ddd9_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l101_c7_ddd9_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l104_c7_6998_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l101_c7_ddd9_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l101_c7_ddd9_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l101_c7_ddd9_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l104_c7_6998_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l101_c7_ddd9_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l101_c7_ddd9_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l101_c7_ddd9_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l101_c7_ddd9_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l104_c7_6998_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l101_c7_ddd9_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l101_c7_ddd9_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l101_c7_ddd9_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l104_c7_6998_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l101_c7_ddd9_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l101_c7_ddd9_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l101_c7_ddd9_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l104_c7_6998_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l101_c7_ddd9_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l101_c7_ddd9_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l101_c7_ddd9_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l104_c7_6998_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l101_c7_ddd9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l104_c11_5630_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l104_c11_5630_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l104_c11_5630_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_7203_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_7203_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_7203_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_7203_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l104_c7_6998_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l104_c7_6998_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l104_c7_6998_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l104_c7_6998_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l104_c7_6998_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l113_c7_7203_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l104_c7_6998_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l104_c7_6998_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l104_c7_6998_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l104_c7_6998_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l104_c7_6998_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l104_c7_6998_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l104_c7_6998_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l104_c7_6998_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l104_c7_6998_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l104_c7_6998_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l104_c7_6998_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l104_c7_6998_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l104_c7_6998_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l104_c7_6998_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l104_c7_6998_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l113_c7_7203_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l104_c7_6998_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l104_c7_6998_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l104_c7_6998_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l113_c7_7203_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l104_c7_6998_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l104_c7_6998_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l104_c7_6998_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l104_c7_6998_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l113_c7_7203_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l104_c7_6998_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l104_c7_6998_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l104_c7_6998_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l113_c7_7203_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l104_c7_6998_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l104_c7_6998_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l104_c7_6998_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l113_c7_7203_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l104_c7_6998_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l104_c7_6998_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l104_c7_6998_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l104_c7_6998_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_device_h_l106_c11_16ce_return_output : unsigned(3 downto 0);
 variable VAR_CONST_SR_7_uxn_device_h_l107_c25_6c47_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_7_uxn_device_h_l107_c25_6c47_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l107_c15_6576_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_6_uxn_device_h_l108_c21_d5e2_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_6_uxn_device_h_l108_c21_d5e2_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l108_c11_0cf3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_5_uxn_device_h_l109_c22_18e8_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_5_uxn_device_h_l109_c22_18e8_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l109_c12_1939_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_4_uxn_device_h_l110_c22_e45c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_device_h_l110_c22_e45c_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l110_c12_fb60_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l113_c11_f4fd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l113_c11_f4fd_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l113_c11_f4fd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c7_7b60_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c7_7b60_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c7_7b60_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c7_7b60_iffalse : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l113_c7_7203_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l113_c7_7203_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l118_c7_7b60_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l113_c7_7203_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l113_c7_7203_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l113_c7_7203_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l118_c7_7b60_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l113_c7_7203_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l113_c7_7203_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l113_c7_7203_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l118_c7_7b60_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l113_c7_7203_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l113_c7_7203_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l113_c7_7203_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l113_c7_7203_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l118_c7_7b60_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l113_c7_7203_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l113_c7_7203_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l113_c7_7203_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l118_c7_7b60_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l113_c7_7203_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l113_c7_7203_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l113_c7_7203_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l118_c7_7b60_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l113_c7_7203_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l118_c11_05f2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l118_c11_05f2_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l118_c11_05f2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l122_c7_9b61_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l122_c7_9b61_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l122_c7_9b61_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l122_c7_9b61_iffalse : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l118_c7_7b60_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l118_c7_7b60_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l122_c7_9b61_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l118_c7_7b60_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l118_c7_7b60_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l118_c7_7b60_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l122_c7_9b61_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l118_c7_7b60_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l118_c7_7b60_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l118_c7_7b60_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l122_c7_9b61_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l118_c7_7b60_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l118_c7_7b60_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l118_c7_7b60_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l118_c7_7b60_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l122_c7_9b61_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l118_c7_7b60_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l118_c7_7b60_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l118_c7_7b60_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l122_c7_9b61_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l118_c7_7b60_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l118_c7_7b60_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l118_c7_7b60_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l122_c7_9b61_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l118_c7_7b60_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l119_c3_07a8_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l119_c3_07a8_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l119_c3_07a8_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l122_c11_7545_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l122_c11_7545_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l122_c11_7545_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l127_c7_6d1f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l127_c7_6d1f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l127_c7_6d1f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l127_c7_6d1f_iffalse : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l122_c7_9b61_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l122_c7_9b61_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l127_c7_6d1f_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l122_c7_9b61_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l122_c7_9b61_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l122_c7_9b61_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l127_c7_6d1f_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l122_c7_9b61_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l122_c7_9b61_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l122_c7_9b61_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l127_c7_6d1f_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l122_c7_9b61_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l122_c7_9b61_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l122_c7_9b61_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l122_c7_9b61_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l127_c7_6d1f_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l122_c7_9b61_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l122_c7_9b61_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l122_c7_9b61_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l127_c7_6d1f_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l122_c7_9b61_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l122_c7_9b61_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l122_c7_9b61_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l127_c7_6d1f_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l122_c7_9b61_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l127_c11_05dc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l127_c11_05dc_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l127_c11_05dc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l148_c7_1e53_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l148_c7_1e53_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l148_c7_1e53_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l148_c7_1e53_iffalse : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l127_c7_6d1f_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l128_c3_00c7_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l127_c7_6d1f_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l127_c7_6d1f_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l127_c7_6d1f_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l128_c3_00c7_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l127_c7_6d1f_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l127_c7_6d1f_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l127_c7_6d1f_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l127_c7_6d1f_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l148_c7_1e53_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l127_c7_6d1f_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l127_c7_6d1f_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_67b7_uxn_device_h_l127_c7_6d1f_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l127_c7_6d1f_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l148_c7_1e53_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l127_c7_6d1f_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l127_c7_6d1f_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l127_c7_6d1f_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l148_c7_1e53_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l127_c7_6d1f_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l127_c7_6d1f_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l127_c7_6d1f_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l148_c7_1e53_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l127_c7_6d1f_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l128_c3_00c7_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l135_c4_5997_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l128_c3_00c7_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l128_c3_00c7_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l128_c3_00c7_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l128_c3_00c7_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l128_c3_00c7_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l128_c3_00c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l135_c4_5997_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l128_c3_00c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l128_c3_00c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l128_c3_00c7_cond : unsigned(0 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l128_c3_00c7_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_addr_uxn_device_h_l132_c4_acec : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l128_c3_00c7_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l128_c3_00c7_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l128_c3_00c7_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l128_c3_00c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l128_c3_00c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l128_c3_00c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l128_c3_00c7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l128_c3_00c7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l128_c3_00c7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l128_c3_00c7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l128_c3_00c7_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l128_c3_00c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l128_c3_00c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l128_c3_00c7_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l128_c3_00c7_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l128_c3_00c7_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l128_c3_00c7_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l129_c4_0cb4 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l128_c3_00c7_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l128_c3_00c7_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l128_c3_00c7_cond : unsigned(0 downto 0);
 variable VAR_tmp8_uxn_device_h_l131_c4_581e : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l131_c11_3ecd_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l131_c11_3ecd_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l131_c11_3ecd_return_output : unsigned(3 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l132_c23_1320_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l132_c23_1320_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l132_c23_1320_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l132_c23_aafd_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l132_c23_aafd_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l132_c23_aafd_return_output : unsigned(32 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l135_c4_5997_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l135_c4_5997_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l135_c4_5997_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l135_c4_5997_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l135_c4_5997_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l135_c4_5997_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l136_c5_2489_left : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l136_c13_fc00_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l136_c13_fc00_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l136_c13_fc00_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l136_c13_fc00_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l136_c5_2489_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l136_c5_2489_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l137_c5_ed9d_left : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l137_c13_2d37_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l137_c13_2d37_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l137_c13_2d37_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l137_c13_2d37_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l137_c5_ed9d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l137_c5_ed9d_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l148_c11_eb07_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l148_c11_eb07_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l148_c11_eb07_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l166_c7_2eca_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l166_c7_2eca_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l166_c7_2eca_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l166_c7_2eca_iffalse : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l148_c7_1e53_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l148_c7_1e53_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l166_c7_2eca_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l148_c7_1e53_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l148_c7_1e53_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_0eea_uxn_device_h_l148_c7_1e53_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l148_c7_1e53_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l166_c7_2eca_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l148_c7_1e53_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l148_c7_1e53_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l149_c3_14dc_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l148_c7_1e53_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l148_c7_1e53_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l148_c7_1e53_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l149_c3_14dc_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l148_c7_1e53_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l148_c7_1e53_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l149_c3_14dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l149_c3_14dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l149_c3_14dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l149_c3_14dc_cond : unsigned(0 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l149_c3_14dc_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_addr_uxn_device_h_l152_c4_ad28 : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l149_c3_14dc_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l149_c3_14dc_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l149_c3_14dc_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l149_c3_14dc_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l154_c4_357e_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l149_c3_14dc_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l149_c3_14dc_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l149_c3_14dc_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l149_c3_14dc_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l154_c4_357e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l149_c3_14dc_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l149_c3_14dc_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l149_c3_14dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c3_14dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l154_c4_357e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c3_14dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c3_14dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c3_14dc_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l149_c3_14dc_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l149_c3_14dc_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l149_c3_14dc_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l149_c3_14dc_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l154_c4_357e_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l149_c3_14dc_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l149_c3_14dc_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_uxn_device_h_l153_c4_55c6 : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l154_c8_ae17_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l154_c8_ae17_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l154_c8_ae17_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_device_h_l154_c8_b0da_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_device_h_l154_c8_b0da_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_device_h_l154_c8_b0da_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l154_c4_357e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l154_c4_357e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l154_c4_357e_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l154_c4_357e_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l154_c4_357e_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l154_c4_357e_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l154_c4_357e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l154_c4_357e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l154_c4_357e_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l154_c4_357e_iftrue : unsigned(15 downto 0);
 variable VAR_x_uxn_device_h_l155_c5_9072 : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l154_c4_357e_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l154_c4_357e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l155_c5_7320_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l155_c5_7320_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l155_c5_7320_return_output : unsigned(16 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l158_c33_edf3_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l158_c33_edf3_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l158_c23_a60c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l166_c11_fd8a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l166_c11_fd8a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l166_c11_fd8a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l179_c7_8b67_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l179_c7_8b67_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l179_c7_8b67_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l179_c7_8b67_iffalse : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l166_c7_2eca_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l167_c3_d4a4_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l166_c7_2eca_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l179_c7_8b67_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l166_c7_2eca_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l166_c7_2eca_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_4bef_uxn_device_h_l166_c7_2eca_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l166_c7_2eca_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l179_c7_8b67_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l166_c7_2eca_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l167_c3_d4a4_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l167_c3_d4a4_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l167_c3_d4a4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l167_c3_d4a4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l168_c4_8e3f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l167_c3_d4a4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l167_c3_d4a4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l167_c3_d4a4_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l167_c3_d4a4_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l168_c4_8e3f_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l167_c3_d4a4_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l167_c3_d4a4_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l167_c3_d4a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l167_c3_d4a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l168_c4_8e3f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l167_c3_d4a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l167_c3_d4a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l167_c3_d4a4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l168_c8_ed49_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l168_c8_ed49_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l168_c8_ed49_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_device_h_l168_c8_07d4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_device_h_l168_c8_07d4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_device_h_l168_c8_07d4_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l168_c4_8e3f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l168_c4_8e3f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l168_c4_8e3f_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l168_c4_8e3f_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l168_c4_8e3f_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l168_c4_8e3f_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l168_c4_8e3f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l168_c4_8e3f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l168_c4_8e3f_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l171_c23_b011_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l179_c11_c3d6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l179_c11_c3d6_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l179_c11_c3d6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l191_c7_cd63_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l191_c7_cd63_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l191_c7_cd63_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l191_c7_cd63_iffalse : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l179_c7_8b67_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l180_c3_80c6_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l179_c7_8b67_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l179_c7_8b67_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l179_c7_8b67_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_4bef_uxn_device_h_l179_c7_8b67_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l179_c7_8b67_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l191_c7_cd63_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l179_c7_8b67_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l180_c3_80c6_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l180_c3_80c6_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l180_c3_80c6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l180_c3_80c6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l181_c4_d009_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l180_c3_80c6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l180_c3_80c6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l180_c3_80c6_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l180_c3_80c6_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l181_c4_d009_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l180_c3_80c6_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l180_c3_80c6_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l180_c3_80c6_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l180_c3_80c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l181_c4_d009_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l180_c3_80c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l180_c3_80c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l180_c3_80c6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l181_c9_40bb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l181_c9_40bb_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l181_c9_40bb_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_device_h_l181_c9_8f6a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_device_h_l181_c9_8f6a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_device_h_l181_c9_8f6a_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l181_c4_d009_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l181_c4_d009_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l181_c4_d009_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l181_c4_d009_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l181_c4_d009_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l181_c4_d009_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l181_c4_d009_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l181_c4_d009_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l181_c4_d009_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l184_c33_ae1a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l184_c33_ae1a_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l184_c23_ff43_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l188_c4_cc12_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l188_c4_cc12_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l188_c4_cc12_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l191_c11_be1b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l191_c11_be1b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l191_c11_be1b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l200_c1_2e5f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l200_c1_2e5f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l200_c1_2e5f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l200_c1_2e5f_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l191_c7_cd63_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_4bef_uxn_device_h_l191_c7_cd63_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l191_c7_cd63_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l201_c3_2947_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l191_c7_cd63_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l192_c3_f6d1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l193_c4_da12_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l192_c3_f6d1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l192_c3_f6d1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l192_c3_f6d1_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l192_c3_f6d1_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l193_c4_da12_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l192_c3_f6d1_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l192_c3_f6d1_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l192_c3_f6d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l192_c3_f6d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c4_da12_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l192_c3_f6d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l192_c3_f6d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l192_c3_f6d1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l193_c9_369e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l193_c9_369e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l193_c9_369e_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_device_h_l193_c9_2a63_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_device_h_l193_c9_2a63_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_device_h_l193_c9_2a63_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l193_c4_da12_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l193_c4_da12_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l193_c4_da12_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l193_c4_da12_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l193_c4_da12_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l193_c4_da12_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c4_da12_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c4_da12_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c4_da12_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l196_c23_b39c_return_output : unsigned(7 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_c523_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_c523_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_c523_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_c523_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l201_c3_2947_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_a3ba_uxn_device_h_l201_c3_2947_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l201_c3_2947_iffalse : device_out_result_t;
 variable VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_d321_uxn_device_h_l201_c3_2947_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l201_c3_2947_cond : unsigned(0 downto 0);
 variable VAR_screen_blit_result : screen_blit_result_t;
 variable VAR_screen_blit_uxn_device_h_l202_c46_90b0_phase : unsigned(7 downto 0);
 variable VAR_screen_blit_uxn_device_h_l202_c46_90b0_ctrl : unsigned(7 downto 0);
 variable VAR_screen_blit_uxn_device_h_l202_c46_90b0_auto_advance : unsigned(7 downto 0);
 variable VAR_screen_blit_uxn_device_h_l202_c46_90b0_x : unsigned(15 downto 0);
 variable VAR_screen_blit_uxn_device_h_l202_c46_90b0_y : unsigned(15 downto 0);
 variable VAR_screen_blit_uxn_device_h_l202_c46_90b0_ram_addr : unsigned(15 downto 0);
 variable VAR_screen_blit_uxn_device_h_l202_c46_90b0_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l202_c58_fd83_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l202_c58_fd83_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l202_c58_fd83_return_output : unsigned(7 downto 0);
 variable VAR_screen_blit_uxn_device_h_l202_c46_90b0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_screen_blit_uxn_device_h_l202_c46_90b0_return_output : screen_blit_result_t;
 variable VAR_result_device_ram_address_uxn_device_h_l204_c4_1114 : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d_uxn_device_h_l205_c27_bef8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_screen_blit_result_t_u16_addr_d41d_uxn_device_h_l206_c22_1ec9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_vram_write_layer_d41d_uxn_device_h_l207_c30_5975_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_screen_blit_result_t_u8_value_d41d_uxn_device_h_l208_c22_e56c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l209_c25_3ac1_return_output : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l212_c4_23f7 : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l154_l167_l168_l180_l94_l193_l181_l192_DUPLICATE_2af0_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l114_l123_l119_l144_l175_l188_l130_DUPLICATE_4177_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_device_h_l176_l124_l115_DUPLICATE_ef81_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_device_h_l176_l124_l115_DUPLICATE_ef81_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l144_l130_DUPLICATE_bfc9_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l144_l130_DUPLICATE_bfc9_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l144_l130_DUPLICATE_bfc9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l135_l128_DUPLICATE_0e85_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_device_h_l128_l149_DUPLICATE_cfba_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l128_l149_DUPLICATE_72ff_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l149_l167_l168_l180_l193_l181_l128_l192_DUPLICATE_7928_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l149_l154_l167_l168_l180_l193_l181_l192_DUPLICATE_11f3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_1_uint8_t_uxn_device_h_l193_l181_DUPLICATE_a566_x : unsigned(7 downto 0);
 variable VAR_CONST_SR_1_uint8_t_uxn_device_h_l193_l181_DUPLICATE_a566_return_output : unsigned(7 downto 0);
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
     VAR_MUX_uxn_device_h_l90_c20_342e_iftrue := to_unsigned(1, 1);
     VAR_result_device_ram_address_MUX_uxn_device_h_l154_c4_357e_iftrue := to_unsigned(40, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l122_c7_9b61_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l191_c11_be1b_right := to_unsigned(10, 8);
     VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_e2e9_iffalse := to_unsigned(1, 1);
     VAR_result_device_ram_address_MUX_uxn_device_h_l193_c4_da12_iftrue := to_unsigned(43, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c7_7b60_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l132_c23_1320_right := to_unsigned(260, 16);
     VAR_result_device_ram_address_MUX_uxn_device_h_l181_c4_d009_iftrue := to_unsigned(42, 8);
     VAR_MUX_uxn_device_h_l137_c13_2d37_iftrue := to_unsigned(4, 8);
     VAR_BIN_OP_PLUS_uxn_device_h_l155_c5_7320_right := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l179_c7_8b67_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l129_c4_0cb4 := resize(to_unsigned(0, 1), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l128_c3_00c7_iftrue := VAR_result_device_ram_address_uxn_device_h_l129_c4_0cb4;
     VAR_result_is_vram_write_MUX_uxn_device_h_l128_c3_00c7_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_ddd9_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l166_c11_fd8a_right := to_unsigned(8, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l101_c11_f9e0_right := to_unsigned(1, 8);
     VAR_result_is_deo_done_MUX_uxn_device_h_l135_c4_5997_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l136_c13_fc00_iffalse := to_unsigned(16, 8);
     VAR_BIN_OP_NEQ_uxn_device_h_l193_c9_2a63_right := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_device_h_l168_c8_ed49_right := to_unsigned(1, 8);
     VAR_MUX_uxn_device_h_l136_c13_fc00_iftrue := to_unsigned(24, 8);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l154_c4_357e_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_device_h_l193_c9_369e_right := to_unsigned(1, 8);
     VAR_result_u8_value_uxn_device_h_l153_c4_55c6 := resize(to_unsigned(0, 1), 8);
     VAR_result_u8_value_MUX_uxn_device_h_l154_c4_357e_iffalse := VAR_result_u8_value_uxn_device_h_l153_c4_55c6;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l168_c4_8e3f_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_device_h_l154_c8_ae17_right := to_unsigned(1, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l191_c7_cd63_iftrue := to_unsigned(0, 1);
     VAR_result_u16_addr_uxn_device_h_l152_c4_ad28 := resize(to_unsigned(0, 1), 16);
     VAR_result_u16_addr_MUX_uxn_device_h_l149_c3_14dc_iftrue := VAR_result_u16_addr_uxn_device_h_l152_c4_ad28;
     VAR_BIN_OP_EQ_uxn_device_h_l127_c11_05dc_right := to_unsigned(6, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l88_c6_57f5_right := to_unsigned(0, 8);
     VAR_BIN_OP_MINUS_uxn_device_h_l202_c58_fd83_right := to_unsigned(11, 8);
     VAR_MUX_uxn_device_h_l89_c19_23eb_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l104_c11_5630_right := to_unsigned(2, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l118_c11_05f2_right := to_unsigned(4, 8);
     VAR_BIN_OP_NEQ_uxn_device_h_l181_c9_8f6a_right := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l89_c19_23eb_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l179_c11_c3d6_right := to_unsigned(9, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_6998_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l137_c13_2d37_iffalse := to_unsigned(0, 8);
     VAR_MUX_uxn_device_h_l95_c32_0a7c_iffalse := to_unsigned(47, 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l128_c3_00c7_iffalse := to_unsigned(44, 8);
     VAR_result_is_vram_write_MUX_uxn_device_h_l149_c3_14dc_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l90_c20_342e_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_c523_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_device_h_l181_c9_40bb_right := to_unsigned(1, 8);
     VAR_BIN_OP_NEQ_uxn_device_h_l154_c8_b0da_right := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_device_h_l131_c11_3ecd_right := to_unsigned(3, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l166_c7_2eca_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_MUX_uxn_device_h_l168_c4_8e3f_iftrue := to_unsigned(41, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_7203_iftrue := to_unsigned(0, 1);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l181_c4_d009_iftrue := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l212_c4_23f7 := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_device_h_l90_c20_324b_right := to_unsigned(15, 4);
     VAR_BIN_OP_NEQ_uxn_device_h_l168_c8_07d4_right := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l95_c32_0a7c_iftrue := to_unsigned(46, 8);
     VAR_result_device_ram_address_uxn_device_h_l204_c4_1114 := resize(to_unsigned(0, 1), 8);
     VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_e2e9_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l122_c11_7545_right := to_unsigned(5, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l148_c11_eb07_right := to_unsigned(7, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l127_c7_6d1f_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_MUX_uxn_device_h_l149_c3_14dc_iffalse := to_unsigned(45, 8);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c4_da12_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l89_c19_cd0f_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l113_c11_f4fd_right := to_unsigned(3, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l200_c1_2e5f_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l148_c7_1e53_iftrue := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_ddd9_iffalse := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_device_h_l168_c8_ed49_left := auto_advance;
     VAR_CONST_SR_1_uint8_t_uxn_device_h_l193_l181_DUPLICATE_a566_x := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l101_c7_ddd9_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l104_c7_6998_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l113_c7_7203_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l118_c7_7b60_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l122_c7_9b61_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l127_c7_6d1f_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l148_c7_1e53_iffalse := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l88_c2_7de5_iftrue := auto_advance;
     VAR_screen_blit_uxn_device_h_l202_c46_90b0_auto_advance := auto_advance;
     VAR_BIN_OP_AND_uxn_device_h_l131_c11_3ecd_left := color;
     VAR_color_MUX_uxn_device_h_l101_c7_ddd9_iftrue := color;
     VAR_color_MUX_uxn_device_h_l104_c7_6998_iffalse := color;
     VAR_color_MUX_uxn_device_h_l88_c2_7de5_iftrue := color;
     VAR_ctrl_MUX_uxn_device_h_l101_c7_ddd9_iftrue := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l104_c7_6998_iffalse := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l88_c2_7de5_iftrue := ctrl;
     VAR_screen_blit_uxn_device_h_l202_c46_90b0_ctrl := ctrl;
     VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_ddd9_iftrue := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l104_c7_6998_iffalse := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_7de5_iftrue := ctrl_mode;
     VAR_result_is_deo_done_MUX_uxn_device_h_l135_c4_5997_cond := ctrl_mode;
     VAR_tmp8_MUX_uxn_device_h_l135_c4_5997_cond := ctrl_mode;
     VAR_BIN_OP_EQ_uxn_device_h_l89_c19_cd0f_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l90_c20_324b_left := VAR_device_port;
     VAR_MUX_uxn_device_h_l136_c13_fc00_cond := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l101_c7_ddd9_iftrue := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l104_c7_6998_iffalse := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l88_c2_7de5_iftrue := flip_x;
     VAR_MUX_uxn_device_h_l137_c13_2d37_cond := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l101_c7_ddd9_iftrue := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l104_c7_6998_iffalse := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l88_c2_7de5_iftrue := flip_y;
     VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_7de5_iffalse := is_drawing_port;
     VAR_auto_advance_MUX_uxn_device_h_l149_c3_14dc_cond := is_pixel_port;
     VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_7de5_iffalse := is_pixel_port;
     VAR_ram_addr_MUX_uxn_device_h_l167_c3_d4a4_cond := is_pixel_port;
     VAR_ram_addr_MUX_uxn_device_h_l180_c3_80c6_cond := is_pixel_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l128_c3_00c7_cond := is_pixel_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l149_c3_14dc_cond := is_pixel_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l167_c3_d4a4_cond := is_pixel_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l180_c3_80c6_cond := is_pixel_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l192_c3_f6d1_cond := is_pixel_port;
     VAR_result_is_deo_done_MUX_uxn_device_h_l128_c3_00c7_cond := is_pixel_port;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c3_14dc_cond := is_pixel_port;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l167_c3_d4a4_cond := is_pixel_port;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l180_c3_80c6_cond := is_pixel_port;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l192_c3_f6d1_cond := is_pixel_port;
     VAR_result_is_vram_write_MUX_uxn_device_h_l128_c3_00c7_cond := is_pixel_port;
     VAR_result_is_vram_write_MUX_uxn_device_h_l149_c3_14dc_cond := is_pixel_port;
     VAR_result_u16_addr_MUX_uxn_device_h_l128_c3_00c7_cond := is_pixel_port;
     VAR_result_u16_addr_MUX_uxn_device_h_l149_c3_14dc_cond := is_pixel_port;
     VAR_result_u8_value_MUX_uxn_device_h_l128_c3_00c7_cond := is_pixel_port;
     VAR_result_u8_value_MUX_uxn_device_h_l149_c3_14dc_cond := is_pixel_port;
     VAR_result_u8_value_MUX_uxn_device_h_l167_c3_d4a4_cond := is_pixel_port;
     VAR_result_u8_value_MUX_uxn_device_h_l180_c3_80c6_cond := is_pixel_port;
     VAR_result_u8_value_MUX_uxn_device_h_l192_c3_f6d1_cond := is_pixel_port;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l128_c3_00c7_cond := is_pixel_port;
     VAR_tmp8_MUX_uxn_device_h_l128_c3_00c7_cond := is_pixel_port;
     VAR_x_MUX_uxn_device_h_l149_c3_14dc_cond := is_pixel_port;
     VAR_y_MUX_uxn_device_h_l128_c3_00c7_cond := is_pixel_port;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_c523_cond := is_sprite_port;
     VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_7de5_iffalse := is_sprite_port;
     VAR_result_MUX_uxn_device_h_l201_c3_2947_cond := is_sprite_port;
     VAR_layer_MUX_uxn_device_h_l101_c7_ddd9_iftrue := layer;
     VAR_layer_MUX_uxn_device_h_l104_c7_6998_iffalse := layer;
     VAR_layer_MUX_uxn_device_h_l88_c2_7de5_iftrue := layer;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l128_c3_00c7_iftrue := layer;
     VAR_BIN_OP_EQ_uxn_device_h_l101_c11_f9e0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l104_c11_5630_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l113_c11_f4fd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l118_c11_05f2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l122_c11_7545_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l127_c11_05dc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l148_c11_eb07_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l166_c11_fd8a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l179_c11_c3d6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l191_c11_be1b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l88_c6_57f5_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_device_h_l202_c58_fd83_left := VAR_phase;
     VAR_BIN_OP_AND_uxn_device_h_l154_c8_ae17_left := VAR_previous_device_ram_read;
     VAR_CONST_SR_4_uxn_device_h_l110_c22_e45c_x := VAR_previous_device_ram_read;
     VAR_CONST_SR_5_uxn_device_h_l109_c22_18e8_x := VAR_previous_device_ram_read;
     VAR_CONST_SR_6_uxn_device_h_l108_c21_d5e2_x := VAR_previous_device_ram_read;
     VAR_CONST_SR_7_uxn_device_h_l107_c25_6c47_x := VAR_previous_device_ram_read;
     VAR_auto_advance_MUX_uxn_device_h_l149_c3_14dc_iffalse := VAR_previous_device_ram_read;
     VAR_auto_advance_MUX_uxn_device_h_l149_c3_14dc_iftrue := VAR_previous_device_ram_read;
     VAR_ctrl_MUX_uxn_device_h_l104_c7_6998_iftrue := VAR_previous_device_ram_read;
     VAR_screen_blit_uxn_device_h_l202_c46_90b0_previous_ram_read := VAR_previous_ram_read;
     VAR_BIN_OP_OR_uxn_device_h_l188_c4_cc12_left := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l101_c7_ddd9_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l104_c7_6998_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l113_c7_7203_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l118_c7_7b60_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l122_c7_9b61_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l127_c7_6d1f_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l148_c7_1e53_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l167_c3_d4a4_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l179_c7_8b67_iffalse := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l180_c3_80c6_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l88_c2_7de5_iftrue := ram_addr;
     VAR_screen_blit_uxn_device_h_l202_c46_90b0_ram_addr := ram_addr;
     VAR_tmp8_MUX_uxn_device_h_l101_c7_ddd9_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l104_c7_6998_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l113_c7_7203_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l118_c7_7b60_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l122_c7_9b61_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l127_c7_6d1f_iffalse := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l128_c3_00c7_iffalse := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l88_c2_7de5_iftrue := tmp8;
     VAR_BIN_OP_OR_uxn_device_h_l119_c3_07a8_left := x;
     VAR_BIN_OP_PLUS_uxn_device_h_l132_c23_aafd_right := x;
     VAR_BIN_OP_PLUS_uxn_device_h_l155_c5_7320_left := x;
     VAR_screen_blit_uxn_device_h_l202_c46_90b0_x := x;
     VAR_x_MUX_uxn_device_h_l101_c7_ddd9_iftrue := x;
     VAR_x_MUX_uxn_device_h_l104_c7_6998_iftrue := x;
     VAR_x_MUX_uxn_device_h_l122_c7_9b61_iftrue := x;
     VAR_x_MUX_uxn_device_h_l127_c7_6d1f_iftrue := x;
     VAR_x_MUX_uxn_device_h_l148_c7_1e53_iffalse := x;
     VAR_x_MUX_uxn_device_h_l149_c3_14dc_iffalse := x;
     VAR_x_MUX_uxn_device_h_l154_c4_357e_iffalse := x;
     VAR_x_MUX_uxn_device_h_l88_c2_7de5_iftrue := x;
     VAR_BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l144_l130_DUPLICATE_bfc9_left := y;
     VAR_CONST_SR_8_uxn_device_h_l184_c33_ae1a_x := y;
     VAR_screen_blit_uxn_device_h_l202_c46_90b0_y := y;
     VAR_y_MUX_uxn_device_h_l101_c7_ddd9_iftrue := y;
     VAR_y_MUX_uxn_device_h_l104_c7_6998_iftrue := y;
     VAR_y_MUX_uxn_device_h_l113_c7_7203_iftrue := y;
     VAR_y_MUX_uxn_device_h_l118_c7_7b60_iftrue := y;
     VAR_y_MUX_uxn_device_h_l127_c7_6d1f_iffalse := y;
     VAR_y_MUX_uxn_device_h_l88_c2_7de5_iftrue := y;
     -- CONST_SR_4[uxn_device_h_l110_c22_e45c] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_device_h_l110_c22_e45c_x <= VAR_CONST_SR_4_uxn_device_h_l110_c22_e45c_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_device_h_l110_c22_e45c_return_output := CONST_SR_4_uxn_device_h_l110_c22_e45c_return_output;

     -- BIN_OP_EQ[uxn_device_h_l90_c20_324b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l90_c20_324b_left <= VAR_BIN_OP_EQ_uxn_device_h_l90_c20_324b_left;
     BIN_OP_EQ_uxn_device_h_l90_c20_324b_right <= VAR_BIN_OP_EQ_uxn_device_h_l90_c20_324b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l90_c20_324b_return_output := BIN_OP_EQ_uxn_device_h_l90_c20_324b_return_output;

     -- BIN_OP_EQ[uxn_device_h_l89_c19_cd0f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l89_c19_cd0f_left <= VAR_BIN_OP_EQ_uxn_device_h_l89_c19_cd0f_left;
     BIN_OP_EQ_uxn_device_h_l89_c19_cd0f_right <= VAR_BIN_OP_EQ_uxn_device_h_l89_c19_cd0f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l89_c19_cd0f_return_output := BIN_OP_EQ_uxn_device_h_l89_c19_cd0f_return_output;

     -- BIN_OP_EQ[uxn_device_h_l101_c11_f9e0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l101_c11_f9e0_left <= VAR_BIN_OP_EQ_uxn_device_h_l101_c11_f9e0_left;
     BIN_OP_EQ_uxn_device_h_l101_c11_f9e0_right <= VAR_BIN_OP_EQ_uxn_device_h_l101_c11_f9e0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l101_c11_f9e0_return_output := BIN_OP_EQ_uxn_device_h_l101_c11_f9e0_return_output;

     -- CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_device_h_l128_l149_DUPLICATE_cfba LATENCY=0
     VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_device_h_l128_l149_DUPLICATE_cfba_return_output := result.u16_addr;

     -- CAST_TO_uint8_t[uxn_device_h_l196_c23_b39c] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l196_c23_b39c_return_output := CAST_TO_uint8_t_uint16_t(
     y);

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l118_c7_7b60] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l118_c7_7b60_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     to_unsigned(43, 8));

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l128_l149_DUPLICATE_72ff LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l128_l149_DUPLICATE_72ff_return_output := result.is_vram_write;

     -- BIN_OP_AND[uxn_device_h_l154_c8_ae17] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l154_c8_ae17_left <= VAR_BIN_OP_AND_uxn_device_h_l154_c8_ae17_left;
     BIN_OP_AND_uxn_device_h_l154_c8_ae17_right <= VAR_BIN_OP_AND_uxn_device_h_l154_c8_ae17_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l154_c8_ae17_return_output := BIN_OP_AND_uxn_device_h_l154_c8_ae17_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l155_c5_7320] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l155_c5_7320_left <= VAR_BIN_OP_PLUS_uxn_device_h_l155_c5_7320_left;
     BIN_OP_PLUS_uxn_device_h_l155_c5_7320_right <= VAR_BIN_OP_PLUS_uxn_device_h_l155_c5_7320_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l155_c5_7320_return_output := BIN_OP_PLUS_uxn_device_h_l155_c5_7320_return_output;

     -- BIN_OP_EQ[uxn_device_h_l127_c11_05dc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l127_c11_05dc_left <= VAR_BIN_OP_EQ_uxn_device_h_l127_c11_05dc_left;
     BIN_OP_EQ_uxn_device_h_l127_c11_05dc_right <= VAR_BIN_OP_EQ_uxn_device_h_l127_c11_05dc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l127_c11_05dc_return_output := BIN_OP_EQ_uxn_device_h_l127_c11_05dc_return_output;

     -- CAST_TO_uint4_t[uxn_device_h_l106_c11_16ce] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_device_h_l106_c11_16ce_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_previous_device_ram_read);

     -- BIN_OP_EQ[uxn_device_h_l118_c11_05f2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l118_c11_05f2_left <= VAR_BIN_OP_EQ_uxn_device_h_l118_c11_05f2_left;
     BIN_OP_EQ_uxn_device_h_l118_c11_05f2_right <= VAR_BIN_OP_EQ_uxn_device_h_l118_c11_05f2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l118_c11_05f2_return_output := BIN_OP_EQ_uxn_device_h_l118_c11_05f2_return_output;

     -- BIN_OP_AND[uxn_device_h_l131_c11_3ecd] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l131_c11_3ecd_left <= VAR_BIN_OP_AND_uxn_device_h_l131_c11_3ecd_left;
     BIN_OP_AND_uxn_device_h_l131_c11_3ecd_right <= VAR_BIN_OP_AND_uxn_device_h_l131_c11_3ecd_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l131_c11_3ecd_return_output := BIN_OP_AND_uxn_device_h_l131_c11_3ecd_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l113_c7_7203] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l113_c7_7203_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     to_unsigned(42, 8));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l104_c7_6998] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l104_c7_6998_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     to_unsigned(41, 8));

     -- BIN_OP_EQ[uxn_device_h_l179_c11_c3d6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l179_c11_c3d6_left <= VAR_BIN_OP_EQ_uxn_device_h_l179_c11_c3d6_left;
     BIN_OP_EQ_uxn_device_h_l179_c11_c3d6_right <= VAR_BIN_OP_EQ_uxn_device_h_l179_c11_c3d6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l179_c11_c3d6_return_output := BIN_OP_EQ_uxn_device_h_l179_c11_c3d6_return_output;

     -- BIN_OP_EQ[uxn_device_h_l191_c11_be1b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l191_c11_be1b_left <= VAR_BIN_OP_EQ_uxn_device_h_l191_c11_be1b_left;
     BIN_OP_EQ_uxn_device_h_l191_c11_be1b_right <= VAR_BIN_OP_EQ_uxn_device_h_l191_c11_be1b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l191_c11_be1b_return_output := BIN_OP_EQ_uxn_device_h_l191_c11_be1b_return_output;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l154_l167_l168_l180_l94_l193_l181_l192_DUPLICATE_2af0 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l154_l167_l168_l180_l94_l193_l181_l192_DUPLICATE_2af0_return_output := result.device_ram_address;

     -- BIN_OP_EQ[uxn_device_h_l104_c11_5630] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l104_c11_5630_left <= VAR_BIN_OP_EQ_uxn_device_h_l104_c11_5630_left;
     BIN_OP_EQ_uxn_device_h_l104_c11_5630_right <= VAR_BIN_OP_EQ_uxn_device_h_l104_c11_5630_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l104_c11_5630_return_output := BIN_OP_EQ_uxn_device_h_l104_c11_5630_return_output;

     -- BIN_OP_AND[uxn_device_h_l168_c8_ed49] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l168_c8_ed49_left <= VAR_BIN_OP_AND_uxn_device_h_l168_c8_ed49_left;
     BIN_OP_AND_uxn_device_h_l168_c8_ed49_right <= VAR_BIN_OP_AND_uxn_device_h_l168_c8_ed49_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l168_c8_ed49_return_output := BIN_OP_AND_uxn_device_h_l168_c8_ed49_return_output;

     -- BIN_OP_EQ[uxn_device_h_l113_c11_f4fd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l113_c11_f4fd_left <= VAR_BIN_OP_EQ_uxn_device_h_l113_c11_f4fd_left;
     BIN_OP_EQ_uxn_device_h_l113_c11_f4fd_right <= VAR_BIN_OP_EQ_uxn_device_h_l113_c11_f4fd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l113_c11_f4fd_return_output := BIN_OP_EQ_uxn_device_h_l113_c11_f4fd_return_output;

     -- result_vram_write_layer_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d[uxn_device_h_l128_c3_00c7] LATENCY=0
     VAR_result_vram_write_layer_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l128_c3_00c7_return_output := result.vram_write_layer;

     -- CONST_SR_6[uxn_device_h_l108_c21_d5e2] LATENCY=0
     -- Inputs
     CONST_SR_6_uxn_device_h_l108_c21_d5e2_x <= VAR_CONST_SR_6_uxn_device_h_l108_c21_d5e2_x;
     -- Outputs
     VAR_CONST_SR_6_uxn_device_h_l108_c21_d5e2_return_output := CONST_SR_6_uxn_device_h_l108_c21_d5e2_return_output;

     -- BIN_OP_EQ[uxn_device_h_l122_c11_7545] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l122_c11_7545_left <= VAR_BIN_OP_EQ_uxn_device_h_l122_c11_7545_left;
     BIN_OP_EQ_uxn_device_h_l122_c11_7545_right <= VAR_BIN_OP_EQ_uxn_device_h_l122_c11_7545_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l122_c11_7545_return_output := BIN_OP_EQ_uxn_device_h_l122_c11_7545_return_output;

     -- MUX[uxn_device_h_l137_c13_2d37] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l137_c13_2d37_cond <= VAR_MUX_uxn_device_h_l137_c13_2d37_cond;
     MUX_uxn_device_h_l137_c13_2d37_iftrue <= VAR_MUX_uxn_device_h_l137_c13_2d37_iftrue;
     MUX_uxn_device_h_l137_c13_2d37_iffalse <= VAR_MUX_uxn_device_h_l137_c13_2d37_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l137_c13_2d37_return_output := MUX_uxn_device_h_l137_c13_2d37_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_device_h_l114_l123_l119_l144_l175_l188_l130_DUPLICATE_4177 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l114_l123_l119_l144_l175_l188_l130_DUPLICATE_4177_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_device_ram_read);

     -- result_device_ram_address_MUX[uxn_device_h_l128_c3_00c7] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l128_c3_00c7_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l128_c3_00c7_cond;
     result_device_ram_address_MUX_uxn_device_h_l128_c3_00c7_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l128_c3_00c7_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l128_c3_00c7_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l128_c3_00c7_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l128_c3_00c7_return_output := result_device_ram_address_MUX_uxn_device_h_l128_c3_00c7_return_output;

     -- CONST_SR_8[uxn_device_h_l184_c33_ae1a] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_device_h_l184_c33_ae1a_x <= VAR_CONST_SR_8_uxn_device_h_l184_c33_ae1a_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_device_h_l184_c33_ae1a_return_output := CONST_SR_8_uxn_device_h_l184_c33_ae1a_return_output;

     -- CONST_SR_5[uxn_device_h_l109_c22_18e8] LATENCY=0
     -- Inputs
     CONST_SR_5_uxn_device_h_l109_c22_18e8_x <= VAR_CONST_SR_5_uxn_device_h_l109_c22_18e8_x;
     -- Outputs
     VAR_CONST_SR_5_uxn_device_h_l109_c22_18e8_return_output := CONST_SR_5_uxn_device_h_l109_c22_18e8_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l101_c7_ddd9] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l101_c7_ddd9_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     to_unsigned(40, 8));

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l135_l128_DUPLICATE_0e85 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l135_l128_DUPLICATE_0e85_return_output := result.is_deo_done;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l149_l154_l167_l168_l180_l193_l181_l192_DUPLICATE_11f3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l149_l154_l167_l168_l180_l193_l181_l192_DUPLICATE_11f3_return_output := result.is_device_ram_write;

     -- BIN_OP_EQ[uxn_device_h_l166_c11_fd8a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l166_c11_fd8a_left <= VAR_BIN_OP_EQ_uxn_device_h_l166_c11_fd8a_left;
     BIN_OP_EQ_uxn_device_h_l166_c11_fd8a_right <= VAR_BIN_OP_EQ_uxn_device_h_l166_c11_fd8a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l166_c11_fd8a_return_output := BIN_OP_EQ_uxn_device_h_l166_c11_fd8a_return_output;

     -- CONST_SR_7[uxn_device_h_l107_c25_6c47] LATENCY=0
     -- Inputs
     CONST_SR_7_uxn_device_h_l107_c25_6c47_x <= VAR_CONST_SR_7_uxn_device_h_l107_c25_6c47_x;
     -- Outputs
     VAR_CONST_SR_7_uxn_device_h_l107_c25_6c47_return_output := CONST_SR_7_uxn_device_h_l107_c25_6c47_return_output;

     -- CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l149_l167_l168_l180_l193_l181_l128_l192_DUPLICATE_7928 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l149_l167_l168_l180_l193_l181_l128_l192_DUPLICATE_7928_return_output := result.u8_value;

     -- CONST_SR_1_uint8_t_uxn_device_h_l193_l181_DUPLICATE_a566 LATENCY=0
     -- Inputs
     CONST_SR_1_uint8_t_uxn_device_h_l193_l181_DUPLICATE_a566_x <= VAR_CONST_SR_1_uint8_t_uxn_device_h_l193_l181_DUPLICATE_a566_x;
     -- Outputs
     VAR_CONST_SR_1_uint8_t_uxn_device_h_l193_l181_DUPLICATE_a566_return_output := CONST_SR_1_uint8_t_uxn_device_h_l193_l181_DUPLICATE_a566_return_output;

     -- auto_advance_MUX[uxn_device_h_l149_c3_14dc] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l149_c3_14dc_cond <= VAR_auto_advance_MUX_uxn_device_h_l149_c3_14dc_cond;
     auto_advance_MUX_uxn_device_h_l149_c3_14dc_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l149_c3_14dc_iftrue;
     auto_advance_MUX_uxn_device_h_l149_c3_14dc_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l149_c3_14dc_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l149_c3_14dc_return_output := auto_advance_MUX_uxn_device_h_l149_c3_14dc_return_output;

     -- result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_d321[uxn_device_h_l201_c3_2947] LATENCY=0
     VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_d321_uxn_device_h_l201_c3_2947_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_d321(
     result,
     to_unsigned(0, 1),
     VAR_result_device_ram_address_uxn_device_h_l212_c4_23f7,
     to_unsigned(1, 1));

     -- BIN_OP_MINUS[uxn_device_h_l202_c58_fd83] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l202_c58_fd83_left <= VAR_BIN_OP_MINUS_uxn_device_h_l202_c58_fd83_left;
     BIN_OP_MINUS_uxn_device_h_l202_c58_fd83_right <= VAR_BIN_OP_MINUS_uxn_device_h_l202_c58_fd83_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l202_c58_fd83_return_output := BIN_OP_MINUS_uxn_device_h_l202_c58_fd83_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l122_c7_9b61] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l122_c7_9b61_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     to_unsigned(38, 8));

     -- BIN_OP_EQ[uxn_device_h_l88_c6_57f5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l88_c6_57f5_left <= VAR_BIN_OP_EQ_uxn_device_h_l88_c6_57f5_left;
     BIN_OP_EQ_uxn_device_h_l88_c6_57f5_right <= VAR_BIN_OP_EQ_uxn_device_h_l88_c6_57f5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l88_c6_57f5_return_output := BIN_OP_EQ_uxn_device_h_l88_c6_57f5_return_output;

     -- MUX[uxn_device_h_l136_c13_fc00] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l136_c13_fc00_cond <= VAR_MUX_uxn_device_h_l136_c13_fc00_cond;
     MUX_uxn_device_h_l136_c13_fc00_iftrue <= VAR_MUX_uxn_device_h_l136_c13_fc00_iftrue;
     MUX_uxn_device_h_l136_c13_fc00_iffalse <= VAR_MUX_uxn_device_h_l136_c13_fc00_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l136_c13_fc00_return_output := MUX_uxn_device_h_l136_c13_fc00_return_output;

     -- BIN_OP_EQ[uxn_device_h_l148_c11_eb07] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l148_c11_eb07_left <= VAR_BIN_OP_EQ_uxn_device_h_l148_c11_eb07_left;
     BIN_OP_EQ_uxn_device_h_l148_c11_eb07_right <= VAR_BIN_OP_EQ_uxn_device_h_l148_c11_eb07_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l148_c11_eb07_return_output := BIN_OP_EQ_uxn_device_h_l148_c11_eb07_return_output;

     -- CAST_TO_uint8_t[uxn_device_h_l171_c23_b011] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l171_c23_b011_return_output := CAST_TO_uint8_t_uint16_t(
     x);

     -- Submodule level 1
     VAR_tmp8_uxn_device_h_l131_c4_581e := resize(VAR_BIN_OP_AND_uxn_device_h_l131_c11_3ecd_return_output, 8);
     VAR_BIN_OP_NEQ_uxn_device_h_l154_c8_b0da_left := VAR_BIN_OP_AND_uxn_device_h_l154_c8_ae17_return_output;
     VAR_BIN_OP_NEQ_uxn_device_h_l168_c8_07d4_left := VAR_BIN_OP_AND_uxn_device_h_l168_c8_ed49_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_6998_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_f9e0_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l101_c7_ddd9_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_f9e0_return_output;
     VAR_color_MUX_uxn_device_h_l101_c7_ddd9_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_f9e0_return_output;
     VAR_ctrl_MUX_uxn_device_h_l101_c7_ddd9_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_f9e0_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_ddd9_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_f9e0_return_output;
     VAR_flip_x_MUX_uxn_device_h_l101_c7_ddd9_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_f9e0_return_output;
     VAR_flip_y_MUX_uxn_device_h_l101_c7_ddd9_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_f9e0_return_output;
     VAR_layer_MUX_uxn_device_h_l101_c7_ddd9_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_f9e0_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l101_c7_ddd9_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_f9e0_return_output;
     VAR_result_MUX_uxn_device_h_l101_c7_ddd9_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_f9e0_return_output;
     VAR_tmp8_MUX_uxn_device_h_l101_c7_ddd9_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_f9e0_return_output;
     VAR_x_MUX_uxn_device_h_l101_c7_ddd9_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_f9e0_return_output;
     VAR_y_MUX_uxn_device_h_l101_c7_ddd9_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_f9e0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_7203_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_5630_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l104_c7_6998_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_5630_return_output;
     VAR_color_MUX_uxn_device_h_l104_c7_6998_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_5630_return_output;
     VAR_ctrl_MUX_uxn_device_h_l104_c7_6998_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_5630_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l104_c7_6998_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_5630_return_output;
     VAR_flip_x_MUX_uxn_device_h_l104_c7_6998_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_5630_return_output;
     VAR_flip_y_MUX_uxn_device_h_l104_c7_6998_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_5630_return_output;
     VAR_layer_MUX_uxn_device_h_l104_c7_6998_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_5630_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l104_c7_6998_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_5630_return_output;
     VAR_result_MUX_uxn_device_h_l104_c7_6998_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_5630_return_output;
     VAR_tmp8_MUX_uxn_device_h_l104_c7_6998_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_5630_return_output;
     VAR_x_MUX_uxn_device_h_l104_c7_6998_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_5630_return_output;
     VAR_y_MUX_uxn_device_h_l104_c7_6998_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_5630_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c7_7b60_cond := VAR_BIN_OP_EQ_uxn_device_h_l113_c11_f4fd_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l113_c7_7203_cond := VAR_BIN_OP_EQ_uxn_device_h_l113_c11_f4fd_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l113_c7_7203_cond := VAR_BIN_OP_EQ_uxn_device_h_l113_c11_f4fd_return_output;
     VAR_result_MUX_uxn_device_h_l113_c7_7203_cond := VAR_BIN_OP_EQ_uxn_device_h_l113_c11_f4fd_return_output;
     VAR_tmp8_MUX_uxn_device_h_l113_c7_7203_cond := VAR_BIN_OP_EQ_uxn_device_h_l113_c11_f4fd_return_output;
     VAR_x_MUX_uxn_device_h_l113_c7_7203_cond := VAR_BIN_OP_EQ_uxn_device_h_l113_c11_f4fd_return_output;
     VAR_y_MUX_uxn_device_h_l113_c7_7203_cond := VAR_BIN_OP_EQ_uxn_device_h_l113_c11_f4fd_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l122_c7_9b61_cond := VAR_BIN_OP_EQ_uxn_device_h_l118_c11_05f2_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l118_c7_7b60_cond := VAR_BIN_OP_EQ_uxn_device_h_l118_c11_05f2_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l118_c7_7b60_cond := VAR_BIN_OP_EQ_uxn_device_h_l118_c11_05f2_return_output;
     VAR_result_MUX_uxn_device_h_l118_c7_7b60_cond := VAR_BIN_OP_EQ_uxn_device_h_l118_c11_05f2_return_output;
     VAR_tmp8_MUX_uxn_device_h_l118_c7_7b60_cond := VAR_BIN_OP_EQ_uxn_device_h_l118_c11_05f2_return_output;
     VAR_x_MUX_uxn_device_h_l118_c7_7b60_cond := VAR_BIN_OP_EQ_uxn_device_h_l118_c11_05f2_return_output;
     VAR_y_MUX_uxn_device_h_l118_c7_7b60_cond := VAR_BIN_OP_EQ_uxn_device_h_l118_c11_05f2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l127_c7_6d1f_cond := VAR_BIN_OP_EQ_uxn_device_h_l122_c11_7545_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l122_c7_9b61_cond := VAR_BIN_OP_EQ_uxn_device_h_l122_c11_7545_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l122_c7_9b61_cond := VAR_BIN_OP_EQ_uxn_device_h_l122_c11_7545_return_output;
     VAR_result_MUX_uxn_device_h_l122_c7_9b61_cond := VAR_BIN_OP_EQ_uxn_device_h_l122_c11_7545_return_output;
     VAR_tmp8_MUX_uxn_device_h_l122_c7_9b61_cond := VAR_BIN_OP_EQ_uxn_device_h_l122_c11_7545_return_output;
     VAR_x_MUX_uxn_device_h_l122_c7_9b61_cond := VAR_BIN_OP_EQ_uxn_device_h_l122_c11_7545_return_output;
     VAR_y_MUX_uxn_device_h_l122_c7_9b61_cond := VAR_BIN_OP_EQ_uxn_device_h_l122_c11_7545_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l148_c7_1e53_cond := VAR_BIN_OP_EQ_uxn_device_h_l127_c11_05dc_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l127_c7_6d1f_cond := VAR_BIN_OP_EQ_uxn_device_h_l127_c11_05dc_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l127_c7_6d1f_cond := VAR_BIN_OP_EQ_uxn_device_h_l127_c11_05dc_return_output;
     VAR_result_MUX_uxn_device_h_l127_c7_6d1f_cond := VAR_BIN_OP_EQ_uxn_device_h_l127_c11_05dc_return_output;
     VAR_tmp8_MUX_uxn_device_h_l127_c7_6d1f_cond := VAR_BIN_OP_EQ_uxn_device_h_l127_c11_05dc_return_output;
     VAR_x_MUX_uxn_device_h_l127_c7_6d1f_cond := VAR_BIN_OP_EQ_uxn_device_h_l127_c11_05dc_return_output;
     VAR_y_MUX_uxn_device_h_l127_c7_6d1f_cond := VAR_BIN_OP_EQ_uxn_device_h_l127_c11_05dc_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l166_c7_2eca_cond := VAR_BIN_OP_EQ_uxn_device_h_l148_c11_eb07_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l148_c7_1e53_cond := VAR_BIN_OP_EQ_uxn_device_h_l148_c11_eb07_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l148_c7_1e53_cond := VAR_BIN_OP_EQ_uxn_device_h_l148_c11_eb07_return_output;
     VAR_result_MUX_uxn_device_h_l148_c7_1e53_cond := VAR_BIN_OP_EQ_uxn_device_h_l148_c11_eb07_return_output;
     VAR_x_MUX_uxn_device_h_l148_c7_1e53_cond := VAR_BIN_OP_EQ_uxn_device_h_l148_c11_eb07_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l179_c7_8b67_cond := VAR_BIN_OP_EQ_uxn_device_h_l166_c11_fd8a_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l166_c7_2eca_cond := VAR_BIN_OP_EQ_uxn_device_h_l166_c11_fd8a_return_output;
     VAR_result_MUX_uxn_device_h_l166_c7_2eca_cond := VAR_BIN_OP_EQ_uxn_device_h_l166_c11_fd8a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l191_c7_cd63_cond := VAR_BIN_OP_EQ_uxn_device_h_l179_c11_c3d6_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l179_c7_8b67_cond := VAR_BIN_OP_EQ_uxn_device_h_l179_c11_c3d6_return_output;
     VAR_result_MUX_uxn_device_h_l179_c7_8b67_cond := VAR_BIN_OP_EQ_uxn_device_h_l179_c11_c3d6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l200_c1_2e5f_cond := VAR_BIN_OP_EQ_uxn_device_h_l191_c11_be1b_return_output;
     VAR_result_MUX_uxn_device_h_l191_c7_cd63_cond := VAR_BIN_OP_EQ_uxn_device_h_l191_c11_be1b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_ddd9_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_57f5_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l88_c2_7de5_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_57f5_return_output;
     VAR_color_MUX_uxn_device_h_l88_c2_7de5_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_57f5_return_output;
     VAR_ctrl_MUX_uxn_device_h_l88_c2_7de5_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_57f5_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_7de5_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_57f5_return_output;
     VAR_flip_x_MUX_uxn_device_h_l88_c2_7de5_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_57f5_return_output;
     VAR_flip_y_MUX_uxn_device_h_l88_c2_7de5_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_57f5_return_output;
     VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_7de5_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_57f5_return_output;
     VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_7de5_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_57f5_return_output;
     VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_7de5_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_57f5_return_output;
     VAR_layer_MUX_uxn_device_h_l88_c2_7de5_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_57f5_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l88_c2_7de5_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_57f5_return_output;
     VAR_result_MUX_uxn_device_h_l88_c2_7de5_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_57f5_return_output;
     VAR_tmp8_MUX_uxn_device_h_l88_c2_7de5_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_57f5_return_output;
     VAR_x_MUX_uxn_device_h_l88_c2_7de5_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_57f5_return_output;
     VAR_y_MUX_uxn_device_h_l88_c2_7de5_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_57f5_return_output;
     VAR_MUX_uxn_device_h_l89_c19_23eb_cond := VAR_BIN_OP_EQ_uxn_device_h_l89_c19_cd0f_return_output;
     VAR_MUX_uxn_device_h_l90_c20_342e_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c20_324b_return_output;
     VAR_screen_blit_uxn_device_h_l202_c46_90b0_phase := VAR_BIN_OP_MINUS_uxn_device_h_l202_c58_fd83_return_output;
     VAR_x_uxn_device_h_l155_c5_9072 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l155_c5_7320_return_output, 16);
     VAR_BIN_OP_OR_uxn_device_h_l119_c3_07a8_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l114_l123_l119_l144_l175_l188_l130_DUPLICATE_4177_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l188_c4_cc12_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l114_l123_l119_l144_l175_l188_l130_DUPLICATE_4177_return_output;
     VAR_BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l144_l130_DUPLICATE_bfc9_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l114_l123_l119_l144_l175_l188_l130_DUPLICATE_4177_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_device_h_l176_l124_l115_DUPLICATE_ef81_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l114_l123_l119_l144_l175_l188_l130_DUPLICATE_4177_return_output;
     VAR_color_MUX_uxn_device_h_l104_c7_6998_iftrue := VAR_CAST_TO_uint4_t_uxn_device_h_l106_c11_16ce_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l168_c4_8e3f_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l171_c23_b011_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l193_c4_da12_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l196_c23_b39c_return_output;
     VAR_result_u16_addr_MUX_uxn_device_h_l128_c3_00c7_iffalse := VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_device_h_l128_l149_DUPLICATE_cfba_return_output;
     VAR_result_u16_addr_MUX_uxn_device_h_l149_c3_14dc_iffalse := VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_device_h_l128_l149_DUPLICATE_cfba_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l128_c3_00c7_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l135_l128_DUPLICATE_0e85_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l135_c4_5997_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l135_l128_DUPLICATE_0e85_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c3_14dc_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l149_l154_l167_l168_l180_l193_l181_l192_DUPLICATE_11f3_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l154_c4_357e_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l149_l154_l167_l168_l180_l193_l181_l192_DUPLICATE_11f3_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l167_c3_d4a4_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l149_l154_l167_l168_l180_l193_l181_l192_DUPLICATE_11f3_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l168_c4_8e3f_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l149_l154_l167_l168_l180_l193_l181_l192_DUPLICATE_11f3_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l180_c3_80c6_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l149_l154_l167_l168_l180_l193_l181_l192_DUPLICATE_11f3_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l181_c4_d009_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l149_l154_l167_l168_l180_l193_l181_l192_DUPLICATE_11f3_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l192_c3_f6d1_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l149_l154_l167_l168_l180_l193_l181_l192_DUPLICATE_11f3_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c4_da12_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l149_l154_l167_l168_l180_l193_l181_l192_DUPLICATE_11f3_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l128_c3_00c7_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l128_l149_DUPLICATE_72ff_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l149_c3_14dc_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l128_l149_DUPLICATE_72ff_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l154_c4_357e_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l154_l167_l168_l180_l94_l193_l181_l192_DUPLICATE_2af0_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l167_c3_d4a4_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l154_l167_l168_l180_l94_l193_l181_l192_DUPLICATE_2af0_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l168_c4_8e3f_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l154_l167_l168_l180_l94_l193_l181_l192_DUPLICATE_2af0_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l180_c3_80c6_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l154_l167_l168_l180_l94_l193_l181_l192_DUPLICATE_2af0_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l181_c4_d009_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l154_l167_l168_l180_l94_l193_l181_l192_DUPLICATE_2af0_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l192_c3_f6d1_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l154_l167_l168_l180_l94_l193_l181_l192_DUPLICATE_2af0_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l193_c4_da12_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l154_l167_l168_l180_l94_l193_l181_l192_DUPLICATE_2af0_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_e2e9_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l154_l167_l168_l180_l94_l193_l181_l192_DUPLICATE_2af0_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l128_c3_00c7_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l149_l167_l168_l180_l193_l181_l128_l192_DUPLICATE_7928_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l149_c3_14dc_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l149_l167_l168_l180_l193_l181_l128_l192_DUPLICATE_7928_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l167_c3_d4a4_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l149_l167_l168_l180_l193_l181_l128_l192_DUPLICATE_7928_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l168_c4_8e3f_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l149_l167_l168_l180_l193_l181_l128_l192_DUPLICATE_7928_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l180_c3_80c6_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l149_l167_l168_l180_l193_l181_l128_l192_DUPLICATE_7928_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l181_c4_d009_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l149_l167_l168_l180_l193_l181_l128_l192_DUPLICATE_7928_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l192_c3_f6d1_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l149_l167_l168_l180_l193_l181_l128_l192_DUPLICATE_7928_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l193_c4_da12_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l149_l167_l168_l180_l193_l181_l128_l192_DUPLICATE_7928_return_output;
     VAR_BIN_OP_AND_uxn_device_h_l181_c9_40bb_left := VAR_CONST_SR_1_uint8_t_uxn_device_h_l193_l181_DUPLICATE_a566_return_output;
     VAR_BIN_OP_AND_uxn_device_h_l193_c9_369e_left := VAR_CONST_SR_1_uint8_t_uxn_device_h_l193_l181_DUPLICATE_a566_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l136_c5_2489_right := VAR_MUX_uxn_device_h_l136_c13_fc00_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l137_c5_ed9d_right := VAR_MUX_uxn_device_h_l137_c13_2d37_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l148_c7_1e53_iftrue := VAR_auto_advance_MUX_uxn_device_h_l149_c3_14dc_return_output;
     VAR_result_MUX_uxn_device_h_l201_c3_2947_iffalse := VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_d321_uxn_device_h_l201_c3_2947_return_output;
     VAR_result_MUX_uxn_device_h_l101_c7_ddd9_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l101_c7_ddd9_return_output;
     VAR_result_MUX_uxn_device_h_l104_c7_6998_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l104_c7_6998_return_output;
     VAR_result_MUX_uxn_device_h_l113_c7_7203_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l113_c7_7203_return_output;
     VAR_result_MUX_uxn_device_h_l118_c7_7b60_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l118_c7_7b60_return_output;
     VAR_result_MUX_uxn_device_h_l122_c7_9b61_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l122_c7_9b61_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l128_c3_00c7_iffalse := VAR_result_vram_write_layer_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l128_c3_00c7_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l136_c5_2489_left := VAR_tmp8_uxn_device_h_l131_c4_581e;
     VAR_tmp8_MUX_uxn_device_h_l135_c4_5997_iffalse := VAR_tmp8_uxn_device_h_l131_c4_581e;
     VAR_CONST_SR_8_uxn_device_h_l158_c33_edf3_x := VAR_x_uxn_device_h_l155_c5_9072;
     VAR_x_MUX_uxn_device_h_l154_c4_357e_iftrue := VAR_x_uxn_device_h_l155_c5_9072;
     -- result_is_vram_write_MUX[uxn_device_h_l149_c3_14dc] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l149_c3_14dc_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l149_c3_14dc_cond;
     result_is_vram_write_MUX_uxn_device_h_l149_c3_14dc_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l149_c3_14dc_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l149_c3_14dc_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l149_c3_14dc_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l149_c3_14dc_return_output := result_is_vram_write_MUX_uxn_device_h_l149_c3_14dc_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l128_c3_00c7] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l128_c3_00c7_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l128_c3_00c7_cond;
     result_is_vram_write_MUX_uxn_device_h_l128_c3_00c7_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l128_c3_00c7_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l128_c3_00c7_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l128_c3_00c7_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l128_c3_00c7_return_output := result_is_vram_write_MUX_uxn_device_h_l128_c3_00c7_return_output;

     -- CAST_TO_uint8_t[uxn_device_h_l184_c23_ff43] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l184_c23_ff43_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_device_h_l184_c33_ae1a_return_output);

     -- auto_advance_MUX[uxn_device_h_l148_c7_1e53] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l148_c7_1e53_cond <= VAR_auto_advance_MUX_uxn_device_h_l148_c7_1e53_cond;
     auto_advance_MUX_uxn_device_h_l148_c7_1e53_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l148_c7_1e53_iftrue;
     auto_advance_MUX_uxn_device_h_l148_c7_1e53_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l148_c7_1e53_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l148_c7_1e53_return_output := auto_advance_MUX_uxn_device_h_l148_c7_1e53_return_output;

     -- BIN_OP_NEQ[uxn_device_h_l154_c8_b0da] LATENCY=0
     -- Inputs
     BIN_OP_NEQ_uxn_device_h_l154_c8_b0da_left <= VAR_BIN_OP_NEQ_uxn_device_h_l154_c8_b0da_left;
     BIN_OP_NEQ_uxn_device_h_l154_c8_b0da_right <= VAR_BIN_OP_NEQ_uxn_device_h_l154_c8_b0da_right;
     -- Outputs
     VAR_BIN_OP_NEQ_uxn_device_h_l154_c8_b0da_return_output := BIN_OP_NEQ_uxn_device_h_l154_c8_b0da_return_output;

     -- BIN_OP_AND[uxn_device_h_l193_c9_369e] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l193_c9_369e_left <= VAR_BIN_OP_AND_uxn_device_h_l193_c9_369e_left;
     BIN_OP_AND_uxn_device_h_l193_c9_369e_right <= VAR_BIN_OP_AND_uxn_device_h_l193_c9_369e_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l193_c9_369e_return_output := BIN_OP_AND_uxn_device_h_l193_c9_369e_return_output;

     -- CAST_TO_uint1_t[uxn_device_h_l110_c12_fb60] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l110_c12_fb60_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_4_uxn_device_h_l110_c22_e45c_return_output);

     -- CONST_SR_8[uxn_device_h_l158_c33_edf3] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_device_h_l158_c33_edf3_x <= VAR_CONST_SR_8_uxn_device_h_l158_c33_edf3_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_device_h_l158_c33_edf3_return_output := CONST_SR_8_uxn_device_h_l158_c33_edf3_return_output;

     -- ctrl_MUX[uxn_device_h_l104_c7_6998] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l104_c7_6998_cond <= VAR_ctrl_MUX_uxn_device_h_l104_c7_6998_cond;
     ctrl_MUX_uxn_device_h_l104_c7_6998_iftrue <= VAR_ctrl_MUX_uxn_device_h_l104_c7_6998_iftrue;
     ctrl_MUX_uxn_device_h_l104_c7_6998_iffalse <= VAR_ctrl_MUX_uxn_device_h_l104_c7_6998_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l104_c7_6998_return_output := ctrl_MUX_uxn_device_h_l104_c7_6998_return_output;

     -- BIN_OP_OR[uxn_device_h_l136_c5_2489] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l136_c5_2489_left <= VAR_BIN_OP_OR_uxn_device_h_l136_c5_2489_left;
     BIN_OP_OR_uxn_device_h_l136_c5_2489_right <= VAR_BIN_OP_OR_uxn_device_h_l136_c5_2489_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l136_c5_2489_return_output := BIN_OP_OR_uxn_device_h_l136_c5_2489_return_output;

     -- BIN_OP_OR[uxn_device_h_l119_c3_07a8] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l119_c3_07a8_left <= VAR_BIN_OP_OR_uxn_device_h_l119_c3_07a8_left;
     BIN_OP_OR_uxn_device_h_l119_c3_07a8_right <= VAR_BIN_OP_OR_uxn_device_h_l119_c3_07a8_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l119_c3_07a8_return_output := BIN_OP_OR_uxn_device_h_l119_c3_07a8_return_output;

     -- CAST_TO_uint1_t[uxn_device_h_l108_c11_0cf3] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l108_c11_0cf3_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_6_uxn_device_h_l108_c21_d5e2_return_output);

     -- color_MUX[uxn_device_h_l104_c7_6998] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l104_c7_6998_cond <= VAR_color_MUX_uxn_device_h_l104_c7_6998_cond;
     color_MUX_uxn_device_h_l104_c7_6998_iftrue <= VAR_color_MUX_uxn_device_h_l104_c7_6998_iftrue;
     color_MUX_uxn_device_h_l104_c7_6998_iffalse <= VAR_color_MUX_uxn_device_h_l104_c7_6998_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l104_c7_6998_return_output := color_MUX_uxn_device_h_l104_c7_6998_return_output;

     -- result_u16_addr_MUX[uxn_device_h_l149_c3_14dc] LATENCY=0
     -- Inputs
     result_u16_addr_MUX_uxn_device_h_l149_c3_14dc_cond <= VAR_result_u16_addr_MUX_uxn_device_h_l149_c3_14dc_cond;
     result_u16_addr_MUX_uxn_device_h_l149_c3_14dc_iftrue <= VAR_result_u16_addr_MUX_uxn_device_h_l149_c3_14dc_iftrue;
     result_u16_addr_MUX_uxn_device_h_l149_c3_14dc_iffalse <= VAR_result_u16_addr_MUX_uxn_device_h_l149_c3_14dc_iffalse;
     -- Outputs
     VAR_result_u16_addr_MUX_uxn_device_h_l149_c3_14dc_return_output := result_u16_addr_MUX_uxn_device_h_l149_c3_14dc_return_output;

     -- BIN_OP_OR[uxn_device_h_l188_c4_cc12] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l188_c4_cc12_left <= VAR_BIN_OP_OR_uxn_device_h_l188_c4_cc12_left;
     BIN_OP_OR_uxn_device_h_l188_c4_cc12_right <= VAR_BIN_OP_OR_uxn_device_h_l188_c4_cc12_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l188_c4_cc12_return_output := BIN_OP_OR_uxn_device_h_l188_c4_cc12_return_output;

     -- MUX[uxn_device_h_l89_c19_23eb] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l89_c19_23eb_cond <= VAR_MUX_uxn_device_h_l89_c19_23eb_cond;
     MUX_uxn_device_h_l89_c19_23eb_iftrue <= VAR_MUX_uxn_device_h_l89_c19_23eb_iftrue;
     MUX_uxn_device_h_l89_c19_23eb_iffalse <= VAR_MUX_uxn_device_h_l89_c19_23eb_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l89_c19_23eb_return_output := MUX_uxn_device_h_l89_c19_23eb_return_output;

     -- CAST_TO_uint1_t[uxn_device_h_l109_c12_1939] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l109_c12_1939_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_5_uxn_device_h_l109_c22_18e8_return_output);

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l101_c7_ddd9] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_ddd9_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_ddd9_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_ddd9_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_ddd9_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_ddd9_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_ddd9_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_ddd9_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_ddd9_return_output;

     -- BIN_OP_AND[uxn_device_h_l181_c9_40bb] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l181_c9_40bb_left <= VAR_BIN_OP_AND_uxn_device_h_l181_c9_40bb_left;
     BIN_OP_AND_uxn_device_h_l181_c9_40bb_right <= VAR_BIN_OP_AND_uxn_device_h_l181_c9_40bb_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l181_c9_40bb_return_output := BIN_OP_AND_uxn_device_h_l181_c9_40bb_return_output;

     -- result_vram_write_layer_MUX[uxn_device_h_l128_c3_00c7] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l128_c3_00c7_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l128_c3_00c7_cond;
     result_vram_write_layer_MUX_uxn_device_h_l128_c3_00c7_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l128_c3_00c7_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l128_c3_00c7_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l128_c3_00c7_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l128_c3_00c7_return_output := result_vram_write_layer_MUX_uxn_device_h_l128_c3_00c7_return_output;

     -- BIN_OP_NEQ[uxn_device_h_l168_c8_07d4] LATENCY=0
     -- Inputs
     BIN_OP_NEQ_uxn_device_h_l168_c8_07d4_left <= VAR_BIN_OP_NEQ_uxn_device_h_l168_c8_07d4_left;
     BIN_OP_NEQ_uxn_device_h_l168_c8_07d4_right <= VAR_BIN_OP_NEQ_uxn_device_h_l168_c8_07d4_right;
     -- Outputs
     VAR_BIN_OP_NEQ_uxn_device_h_l168_c8_07d4_return_output := BIN_OP_NEQ_uxn_device_h_l168_c8_07d4_return_output;

     -- CONST_SL_8_uint16_t_uxn_device_h_l176_l124_l115_DUPLICATE_ef81 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_device_h_l176_l124_l115_DUPLICATE_ef81_x <= VAR_CONST_SL_8_uint16_t_uxn_device_h_l176_l124_l115_DUPLICATE_ef81_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_device_h_l176_l124_l115_DUPLICATE_ef81_return_output := CONST_SL_8_uint16_t_uxn_device_h_l176_l124_l115_DUPLICATE_ef81_return_output;

     -- MUX[uxn_device_h_l90_c20_342e] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l90_c20_342e_cond <= VAR_MUX_uxn_device_h_l90_c20_342e_cond;
     MUX_uxn_device_h_l90_c20_342e_iftrue <= VAR_MUX_uxn_device_h_l90_c20_342e_iftrue;
     MUX_uxn_device_h_l90_c20_342e_iffalse <= VAR_MUX_uxn_device_h_l90_c20_342e_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l90_c20_342e_return_output := MUX_uxn_device_h_l90_c20_342e_return_output;

     -- BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l144_l130_DUPLICATE_bfc9 LATENCY=0
     -- Inputs
     BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l144_l130_DUPLICATE_bfc9_left <= VAR_BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l144_l130_DUPLICATE_bfc9_left;
     BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l144_l130_DUPLICATE_bfc9_right <= VAR_BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l144_l130_DUPLICATE_bfc9_right;
     -- Outputs
     VAR_BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l144_l130_DUPLICATE_bfc9_return_output := BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l144_l130_DUPLICATE_bfc9_return_output;

     -- CAST_TO_uint1_t[uxn_device_h_l107_c15_6576] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l107_c15_6576_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_7_uxn_device_h_l107_c25_6c47_return_output);

     -- result_is_deo_done_MUX[uxn_device_h_l135_c4_5997] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l135_c4_5997_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l135_c4_5997_cond;
     result_is_deo_done_MUX_uxn_device_h_l135_c4_5997_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l135_c4_5997_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l135_c4_5997_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l135_c4_5997_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l135_c4_5997_return_output := result_is_deo_done_MUX_uxn_device_h_l135_c4_5997_return_output;

     -- Submodule level 2
     VAR_BIN_OP_NEQ_uxn_device_h_l181_c9_8f6a_left := VAR_BIN_OP_AND_uxn_device_h_l181_c9_40bb_return_output;
     VAR_BIN_OP_NEQ_uxn_device_h_l193_c9_2a63_left := VAR_BIN_OP_AND_uxn_device_h_l193_c9_369e_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l154_c4_357e_cond := VAR_BIN_OP_NEQ_uxn_device_h_l154_c8_b0da_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l154_c4_357e_cond := VAR_BIN_OP_NEQ_uxn_device_h_l154_c8_b0da_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l154_c4_357e_cond := VAR_BIN_OP_NEQ_uxn_device_h_l154_c8_b0da_return_output;
     VAR_x_MUX_uxn_device_h_l154_c4_357e_cond := VAR_BIN_OP_NEQ_uxn_device_h_l154_c8_b0da_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l168_c4_8e3f_cond := VAR_BIN_OP_NEQ_uxn_device_h_l168_c8_07d4_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l168_c4_8e3f_cond := VAR_BIN_OP_NEQ_uxn_device_h_l168_c8_07d4_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l168_c4_8e3f_cond := VAR_BIN_OP_NEQ_uxn_device_h_l168_c8_07d4_return_output;
     VAR_x_MUX_uxn_device_h_l118_c7_7b60_iftrue := VAR_BIN_OP_OR_uxn_device_h_l119_c3_07a8_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l137_c5_ed9d_left := VAR_BIN_OP_OR_uxn_device_h_l136_c5_2489_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l180_c3_80c6_iffalse := VAR_BIN_OP_OR_uxn_device_h_l188_c4_cc12_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l132_c23_1320_left := VAR_BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l144_l130_DUPLICATE_bfc9_return_output;
     VAR_y_MUX_uxn_device_h_l128_c3_00c7_iffalse := VAR_BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l144_l130_DUPLICATE_bfc9_return_output;
     VAR_y_MUX_uxn_device_h_l128_c3_00c7_iftrue := VAR_BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l144_l130_DUPLICATE_bfc9_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l104_c7_6998_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l107_c15_6576_return_output;
     VAR_layer_MUX_uxn_device_h_l104_c7_6998_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l108_c11_0cf3_return_output;
     VAR_flip_y_MUX_uxn_device_h_l104_c7_6998_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l109_c12_1939_return_output;
     VAR_flip_x_MUX_uxn_device_h_l104_c7_6998_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l110_c12_fb60_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l181_c4_d009_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l184_c23_ff43_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l167_c3_d4a4_iffalse := VAR_CONST_SL_8_uint16_t_uxn_device_h_l176_l124_l115_DUPLICATE_ef81_return_output;
     VAR_x_MUX_uxn_device_h_l113_c7_7203_iftrue := VAR_CONST_SL_8_uint16_t_uxn_device_h_l176_l124_l115_DUPLICATE_ef81_return_output;
     VAR_y_MUX_uxn_device_h_l122_c7_9b61_iftrue := VAR_CONST_SL_8_uint16_t_uxn_device_h_l176_l124_l115_DUPLICATE_ef81_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_6998_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_ddd9_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l91_c21_a2f8_left := VAR_MUX_uxn_device_h_l89_c19_23eb_return_output;
     VAR_MUX_uxn_device_h_l95_c32_0a7c_cond := VAR_MUX_uxn_device_h_l89_c19_23eb_return_output;
     VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_7de5_iftrue := VAR_MUX_uxn_device_h_l89_c19_23eb_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l91_c21_a2f8_right := VAR_MUX_uxn_device_h_l90_c20_342e_return_output;
     VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_7de5_iftrue := VAR_MUX_uxn_device_h_l90_c20_342e_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l127_c7_6d1f_iffalse := VAR_auto_advance_MUX_uxn_device_h_l148_c7_1e53_return_output;
     VAR_color_MUX_uxn_device_h_l101_c7_ddd9_iffalse := VAR_color_MUX_uxn_device_h_l104_c7_6998_return_output;
     VAR_ctrl_MUX_uxn_device_h_l101_c7_ddd9_iffalse := VAR_ctrl_MUX_uxn_device_h_l104_c7_6998_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l128_c3_00c7_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l135_c4_5997_return_output;
     -- BIN_OP_OR[uxn_device_h_l91_c21_a2f8] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l91_c21_a2f8_left <= VAR_BIN_OP_OR_uxn_device_h_l91_c21_a2f8_left;
     BIN_OP_OR_uxn_device_h_l91_c21_a2f8_right <= VAR_BIN_OP_OR_uxn_device_h_l91_c21_a2f8_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l91_c21_a2f8_return_output := BIN_OP_OR_uxn_device_h_l91_c21_a2f8_return_output;

     -- BIN_OP_OR[uxn_device_h_l137_c5_ed9d] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l137_c5_ed9d_left <= VAR_BIN_OP_OR_uxn_device_h_l137_c5_ed9d_left;
     BIN_OP_OR_uxn_device_h_l137_c5_ed9d_right <= VAR_BIN_OP_OR_uxn_device_h_l137_c5_ed9d_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l137_c5_ed9d_return_output := BIN_OP_OR_uxn_device_h_l137_c5_ed9d_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_device_h_l132_c23_1320] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_device_h_l132_c23_1320_left <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l132_c23_1320_left;
     BIN_OP_INFERRED_MULT_uxn_device_h_l132_c23_1320_right <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l132_c23_1320_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l132_c23_1320_return_output := BIN_OP_INFERRED_MULT_uxn_device_h_l132_c23_1320_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l154_c4_357e] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l154_c4_357e_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l154_c4_357e_cond;
     result_device_ram_address_MUX_uxn_device_h_l154_c4_357e_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l154_c4_357e_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l154_c4_357e_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l154_c4_357e_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l154_c4_357e_return_output := result_device_ram_address_MUX_uxn_device_h_l154_c4_357e_return_output;

     -- auto_advance_MUX[uxn_device_h_l127_c7_6d1f] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l127_c7_6d1f_cond <= VAR_auto_advance_MUX_uxn_device_h_l127_c7_6d1f_cond;
     auto_advance_MUX_uxn_device_h_l127_c7_6d1f_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l127_c7_6d1f_iftrue;
     auto_advance_MUX_uxn_device_h_l127_c7_6d1f_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l127_c7_6d1f_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l127_c7_6d1f_return_output := auto_advance_MUX_uxn_device_h_l127_c7_6d1f_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l168_c4_8e3f] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l168_c4_8e3f_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l168_c4_8e3f_cond;
     result_device_ram_address_MUX_uxn_device_h_l168_c4_8e3f_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l168_c4_8e3f_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l168_c4_8e3f_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l168_c4_8e3f_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l168_c4_8e3f_return_output := result_device_ram_address_MUX_uxn_device_h_l168_c4_8e3f_return_output;

     -- y_MUX[uxn_device_h_l128_c3_00c7] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l128_c3_00c7_cond <= VAR_y_MUX_uxn_device_h_l128_c3_00c7_cond;
     y_MUX_uxn_device_h_l128_c3_00c7_iftrue <= VAR_y_MUX_uxn_device_h_l128_c3_00c7_iftrue;
     y_MUX_uxn_device_h_l128_c3_00c7_iffalse <= VAR_y_MUX_uxn_device_h_l128_c3_00c7_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l128_c3_00c7_return_output := y_MUX_uxn_device_h_l128_c3_00c7_return_output;

     -- CAST_TO_uint8_t[uxn_device_h_l158_c23_a60c] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l158_c23_a60c_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_device_h_l158_c33_edf3_return_output);

     -- flip_x_MUX[uxn_device_h_l104_c7_6998] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l104_c7_6998_cond <= VAR_flip_x_MUX_uxn_device_h_l104_c7_6998_cond;
     flip_x_MUX_uxn_device_h_l104_c7_6998_iftrue <= VAR_flip_x_MUX_uxn_device_h_l104_c7_6998_iftrue;
     flip_x_MUX_uxn_device_h_l104_c7_6998_iffalse <= VAR_flip_x_MUX_uxn_device_h_l104_c7_6998_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l104_c7_6998_return_output := flip_x_MUX_uxn_device_h_l104_c7_6998_return_output;

     -- BIN_OP_NEQ[uxn_device_h_l193_c9_2a63] LATENCY=0
     -- Inputs
     BIN_OP_NEQ_uxn_device_h_l193_c9_2a63_left <= VAR_BIN_OP_NEQ_uxn_device_h_l193_c9_2a63_left;
     BIN_OP_NEQ_uxn_device_h_l193_c9_2a63_right <= VAR_BIN_OP_NEQ_uxn_device_h_l193_c9_2a63_right;
     -- Outputs
     VAR_BIN_OP_NEQ_uxn_device_h_l193_c9_2a63_return_output := BIN_OP_NEQ_uxn_device_h_l193_c9_2a63_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l104_c7_6998] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_6998_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_6998_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_6998_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_6998_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_6998_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_6998_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_6998_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_6998_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l168_c4_8e3f] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l168_c4_8e3f_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l168_c4_8e3f_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l168_c4_8e3f_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l168_c4_8e3f_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l168_c4_8e3f_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l168_c4_8e3f_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l168_c4_8e3f_return_output := result_is_device_ram_write_MUX_uxn_device_h_l168_c4_8e3f_return_output;

     -- flip_y_MUX[uxn_device_h_l104_c7_6998] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l104_c7_6998_cond <= VAR_flip_y_MUX_uxn_device_h_l104_c7_6998_cond;
     flip_y_MUX_uxn_device_h_l104_c7_6998_iftrue <= VAR_flip_y_MUX_uxn_device_h_l104_c7_6998_iftrue;
     flip_y_MUX_uxn_device_h_l104_c7_6998_iffalse <= VAR_flip_y_MUX_uxn_device_h_l104_c7_6998_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l104_c7_6998_return_output := flip_y_MUX_uxn_device_h_l104_c7_6998_return_output;

     -- color_MUX[uxn_device_h_l101_c7_ddd9] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l101_c7_ddd9_cond <= VAR_color_MUX_uxn_device_h_l101_c7_ddd9_cond;
     color_MUX_uxn_device_h_l101_c7_ddd9_iftrue <= VAR_color_MUX_uxn_device_h_l101_c7_ddd9_iftrue;
     color_MUX_uxn_device_h_l101_c7_ddd9_iffalse <= VAR_color_MUX_uxn_device_h_l101_c7_ddd9_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l101_c7_ddd9_return_output := color_MUX_uxn_device_h_l101_c7_ddd9_return_output;

     -- BIN_OP_NEQ[uxn_device_h_l181_c9_8f6a] LATENCY=0
     -- Inputs
     BIN_OP_NEQ_uxn_device_h_l181_c9_8f6a_left <= VAR_BIN_OP_NEQ_uxn_device_h_l181_c9_8f6a_left;
     BIN_OP_NEQ_uxn_device_h_l181_c9_8f6a_right <= VAR_BIN_OP_NEQ_uxn_device_h_l181_c9_8f6a_right;
     -- Outputs
     VAR_BIN_OP_NEQ_uxn_device_h_l181_c9_8f6a_return_output := BIN_OP_NEQ_uxn_device_h_l181_c9_8f6a_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l128_c3_00c7] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l128_c3_00c7_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l128_c3_00c7_cond;
     result_is_deo_done_MUX_uxn_device_h_l128_c3_00c7_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l128_c3_00c7_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l128_c3_00c7_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l128_c3_00c7_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l128_c3_00c7_return_output := result_is_deo_done_MUX_uxn_device_h_l128_c3_00c7_return_output;

     -- ram_addr_MUX[uxn_device_h_l167_c3_d4a4] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l167_c3_d4a4_cond <= VAR_ram_addr_MUX_uxn_device_h_l167_c3_d4a4_cond;
     ram_addr_MUX_uxn_device_h_l167_c3_d4a4_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l167_c3_d4a4_iftrue;
     ram_addr_MUX_uxn_device_h_l167_c3_d4a4_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l167_c3_d4a4_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l167_c3_d4a4_return_output := ram_addr_MUX_uxn_device_h_l167_c3_d4a4_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l154_c4_357e] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l154_c4_357e_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l154_c4_357e_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l154_c4_357e_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l154_c4_357e_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l154_c4_357e_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l154_c4_357e_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l154_c4_357e_return_output := result_is_device_ram_write_MUX_uxn_device_h_l154_c4_357e_return_output;

     -- layer_MUX[uxn_device_h_l104_c7_6998] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l104_c7_6998_cond <= VAR_layer_MUX_uxn_device_h_l104_c7_6998_cond;
     layer_MUX_uxn_device_h_l104_c7_6998_iftrue <= VAR_layer_MUX_uxn_device_h_l104_c7_6998_iftrue;
     layer_MUX_uxn_device_h_l104_c7_6998_iffalse <= VAR_layer_MUX_uxn_device_h_l104_c7_6998_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l104_c7_6998_return_output := layer_MUX_uxn_device_h_l104_c7_6998_return_output;

     -- MUX[uxn_device_h_l95_c32_0a7c] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l95_c32_0a7c_cond <= VAR_MUX_uxn_device_h_l95_c32_0a7c_cond;
     MUX_uxn_device_h_l95_c32_0a7c_iftrue <= VAR_MUX_uxn_device_h_l95_c32_0a7c_iftrue;
     MUX_uxn_device_h_l95_c32_0a7c_iffalse <= VAR_MUX_uxn_device_h_l95_c32_0a7c_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l95_c32_0a7c_return_output := MUX_uxn_device_h_l95_c32_0a7c_return_output;

     -- result_u8_value_MUX[uxn_device_h_l168_c4_8e3f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l168_c4_8e3f_cond <= VAR_result_u8_value_MUX_uxn_device_h_l168_c4_8e3f_cond;
     result_u8_value_MUX_uxn_device_h_l168_c4_8e3f_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l168_c4_8e3f_iftrue;
     result_u8_value_MUX_uxn_device_h_l168_c4_8e3f_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l168_c4_8e3f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l168_c4_8e3f_return_output := result_u8_value_MUX_uxn_device_h_l168_c4_8e3f_return_output;

     -- ctrl_MUX[uxn_device_h_l101_c7_ddd9] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l101_c7_ddd9_cond <= VAR_ctrl_MUX_uxn_device_h_l101_c7_ddd9_cond;
     ctrl_MUX_uxn_device_h_l101_c7_ddd9_iftrue <= VAR_ctrl_MUX_uxn_device_h_l101_c7_ddd9_iftrue;
     ctrl_MUX_uxn_device_h_l101_c7_ddd9_iffalse <= VAR_ctrl_MUX_uxn_device_h_l101_c7_ddd9_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l101_c7_ddd9_return_output := ctrl_MUX_uxn_device_h_l101_c7_ddd9_return_output;

     -- x_MUX[uxn_device_h_l154_c4_357e] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l154_c4_357e_cond <= VAR_x_MUX_uxn_device_h_l154_c4_357e_cond;
     x_MUX_uxn_device_h_l154_c4_357e_iftrue <= VAR_x_MUX_uxn_device_h_l154_c4_357e_iftrue;
     x_MUX_uxn_device_h_l154_c4_357e_iffalse <= VAR_x_MUX_uxn_device_h_l154_c4_357e_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l154_c4_357e_return_output := x_MUX_uxn_device_h_l154_c4_357e_return_output;

     -- is_sprite_port_MUX[uxn_device_h_l88_c2_7de5] LATENCY=0
     -- Inputs
     is_sprite_port_MUX_uxn_device_h_l88_c2_7de5_cond <= VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_7de5_cond;
     is_sprite_port_MUX_uxn_device_h_l88_c2_7de5_iftrue <= VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_7de5_iftrue;
     is_sprite_port_MUX_uxn_device_h_l88_c2_7de5_iffalse <= VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_7de5_iffalse;
     -- Outputs
     VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_7de5_return_output := is_sprite_port_MUX_uxn_device_h_l88_c2_7de5_return_output;

     -- is_pixel_port_MUX[uxn_device_h_l88_c2_7de5] LATENCY=0
     -- Inputs
     is_pixel_port_MUX_uxn_device_h_l88_c2_7de5_cond <= VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_7de5_cond;
     is_pixel_port_MUX_uxn_device_h_l88_c2_7de5_iftrue <= VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_7de5_iftrue;
     is_pixel_port_MUX_uxn_device_h_l88_c2_7de5_iffalse <= VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_7de5_iffalse;
     -- Outputs
     VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_7de5_return_output := is_pixel_port_MUX_uxn_device_h_l88_c2_7de5_return_output;

     -- ram_addr_MUX[uxn_device_h_l180_c3_80c6] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l180_c3_80c6_cond <= VAR_ram_addr_MUX_uxn_device_h_l180_c3_80c6_cond;
     ram_addr_MUX_uxn_device_h_l180_c3_80c6_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l180_c3_80c6_iftrue;
     ram_addr_MUX_uxn_device_h_l180_c3_80c6_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l180_c3_80c6_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l180_c3_80c6_return_output := ram_addr_MUX_uxn_device_h_l180_c3_80c6_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l104_c7_6998] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l104_c7_6998_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l104_c7_6998_cond;
     ctrl_mode_MUX_uxn_device_h_l104_c7_6998_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l104_c7_6998_iftrue;
     ctrl_mode_MUX_uxn_device_h_l104_c7_6998_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l104_c7_6998_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l104_c7_6998_return_output := ctrl_mode_MUX_uxn_device_h_l104_c7_6998_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_device_h_l132_c23_aafd_left := VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l132_c23_1320_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l181_c4_d009_cond := VAR_BIN_OP_NEQ_uxn_device_h_l181_c9_8f6a_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l181_c4_d009_cond := VAR_BIN_OP_NEQ_uxn_device_h_l181_c9_8f6a_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l181_c4_d009_cond := VAR_BIN_OP_NEQ_uxn_device_h_l181_c9_8f6a_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l193_c4_da12_cond := VAR_BIN_OP_NEQ_uxn_device_h_l193_c9_2a63_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c4_da12_cond := VAR_BIN_OP_NEQ_uxn_device_h_l193_c9_2a63_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l193_c4_da12_cond := VAR_BIN_OP_NEQ_uxn_device_h_l193_c9_2a63_return_output;
     VAR_tmp8_MUX_uxn_device_h_l135_c4_5997_iftrue := VAR_BIN_OP_OR_uxn_device_h_l137_c5_ed9d_return_output;
     VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_7de5_iftrue := VAR_BIN_OP_OR_uxn_device_h_l91_c21_a2f8_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_e2e9_cond := VAR_BIN_OP_OR_uxn_device_h_l91_c21_a2f8_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_e2e9_cond := VAR_BIN_OP_OR_uxn_device_h_l91_c21_a2f8_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l154_c4_357e_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l158_c23_a60c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_7203_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_6998_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_e2e9_iftrue := VAR_MUX_uxn_device_h_l95_c32_0a7c_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l122_c7_9b61_iffalse := VAR_auto_advance_MUX_uxn_device_h_l127_c7_6d1f_return_output;
     VAR_color_MUX_uxn_device_h_l88_c2_7de5_iffalse := VAR_color_MUX_uxn_device_h_l101_c7_ddd9_return_output;
     VAR_ctrl_MUX_uxn_device_h_l88_c2_7de5_iffalse := VAR_ctrl_MUX_uxn_device_h_l101_c7_ddd9_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_ddd9_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l104_c7_6998_return_output;
     VAR_flip_x_MUX_uxn_device_h_l101_c7_ddd9_iffalse := VAR_flip_x_MUX_uxn_device_h_l104_c7_6998_return_output;
     VAR_flip_y_MUX_uxn_device_h_l101_c7_ddd9_iffalse := VAR_flip_y_MUX_uxn_device_h_l104_c7_6998_return_output;
     REG_VAR_is_pixel_port := VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_7de5_return_output;
     REG_VAR_is_sprite_port := VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_7de5_return_output;
     VAR_layer_MUX_uxn_device_h_l101_c7_ddd9_iffalse := VAR_layer_MUX_uxn_device_h_l104_c7_6998_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l166_c7_2eca_iftrue := VAR_ram_addr_MUX_uxn_device_h_l167_c3_d4a4_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l179_c7_8b67_iftrue := VAR_ram_addr_MUX_uxn_device_h_l180_c3_80c6_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l149_c3_14dc_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l154_c4_357e_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l167_c3_d4a4_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l168_c4_8e3f_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c3_14dc_iftrue := VAR_result_is_device_ram_write_MUX_uxn_device_h_l154_c4_357e_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l167_c3_d4a4_iftrue := VAR_result_is_device_ram_write_MUX_uxn_device_h_l168_c4_8e3f_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l167_c3_d4a4_iftrue := VAR_result_u8_value_MUX_uxn_device_h_l168_c4_8e3f_return_output;
     VAR_x_MUX_uxn_device_h_l149_c3_14dc_iftrue := VAR_x_MUX_uxn_device_h_l154_c4_357e_return_output;
     VAR_y_MUX_uxn_device_h_l127_c7_6d1f_iftrue := VAR_y_MUX_uxn_device_h_l128_c3_00c7_return_output;
     -- result_is_device_ram_write_MUX[uxn_device_h_l193_c4_da12] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l193_c4_da12_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c4_da12_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l193_c4_da12_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c4_da12_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l193_c4_da12_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c4_da12_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c4_da12_return_output := result_is_device_ram_write_MUX_uxn_device_h_l193_c4_da12_return_output;

     -- layer_MUX[uxn_device_h_l101_c7_ddd9] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l101_c7_ddd9_cond <= VAR_layer_MUX_uxn_device_h_l101_c7_ddd9_cond;
     layer_MUX_uxn_device_h_l101_c7_ddd9_iftrue <= VAR_layer_MUX_uxn_device_h_l101_c7_ddd9_iftrue;
     layer_MUX_uxn_device_h_l101_c7_ddd9_iffalse <= VAR_layer_MUX_uxn_device_h_l101_c7_ddd9_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l101_c7_ddd9_return_output := layer_MUX_uxn_device_h_l101_c7_ddd9_return_output;

     -- y_MUX[uxn_device_h_l127_c7_6d1f] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l127_c7_6d1f_cond <= VAR_y_MUX_uxn_device_h_l127_c7_6d1f_cond;
     y_MUX_uxn_device_h_l127_c7_6d1f_iftrue <= VAR_y_MUX_uxn_device_h_l127_c7_6d1f_iftrue;
     y_MUX_uxn_device_h_l127_c7_6d1f_iffalse <= VAR_y_MUX_uxn_device_h_l127_c7_6d1f_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l127_c7_6d1f_return_output := y_MUX_uxn_device_h_l127_c7_6d1f_return_output;

     -- ram_addr_MUX[uxn_device_h_l179_c7_8b67] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l179_c7_8b67_cond <= VAR_ram_addr_MUX_uxn_device_h_l179_c7_8b67_cond;
     ram_addr_MUX_uxn_device_h_l179_c7_8b67_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l179_c7_8b67_iftrue;
     ram_addr_MUX_uxn_device_h_l179_c7_8b67_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l179_c7_8b67_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l179_c7_8b67_return_output := ram_addr_MUX_uxn_device_h_l179_c7_8b67_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l132_c23_aafd] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l132_c23_aafd_left <= VAR_BIN_OP_PLUS_uxn_device_h_l132_c23_aafd_left;
     BIN_OP_PLUS_uxn_device_h_l132_c23_aafd_right <= VAR_BIN_OP_PLUS_uxn_device_h_l132_c23_aafd_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l132_c23_aafd_return_output := BIN_OP_PLUS_uxn_device_h_l132_c23_aafd_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l167_c3_d4a4] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l167_c3_d4a4_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l167_c3_d4a4_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l167_c3_d4a4_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l167_c3_d4a4_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l167_c3_d4a4_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l167_c3_d4a4_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l167_c3_d4a4_return_output := result_is_device_ram_write_MUX_uxn_device_h_l167_c3_d4a4_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l149_c3_14dc] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l149_c3_14dc_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l149_c3_14dc_cond;
     result_device_ram_address_MUX_uxn_device_h_l149_c3_14dc_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l149_c3_14dc_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l149_c3_14dc_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l149_c3_14dc_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l149_c3_14dc_return_output := result_device_ram_address_MUX_uxn_device_h_l149_c3_14dc_return_output;

     -- result_u8_value_MUX[uxn_device_h_l154_c4_357e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l154_c4_357e_cond <= VAR_result_u8_value_MUX_uxn_device_h_l154_c4_357e_cond;
     result_u8_value_MUX_uxn_device_h_l154_c4_357e_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l154_c4_357e_iftrue;
     result_u8_value_MUX_uxn_device_h_l154_c4_357e_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l154_c4_357e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l154_c4_357e_return_output := result_u8_value_MUX_uxn_device_h_l154_c4_357e_return_output;

     -- result_u8_value_MUX[uxn_device_h_l167_c3_d4a4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l167_c3_d4a4_cond <= VAR_result_u8_value_MUX_uxn_device_h_l167_c3_d4a4_cond;
     result_u8_value_MUX_uxn_device_h_l167_c3_d4a4_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l167_c3_d4a4_iftrue;
     result_u8_value_MUX_uxn_device_h_l167_c3_d4a4_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l167_c3_d4a4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l167_c3_d4a4_return_output := result_u8_value_MUX_uxn_device_h_l167_c3_d4a4_return_output;

     -- auto_advance_MUX[uxn_device_h_l122_c7_9b61] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l122_c7_9b61_cond <= VAR_auto_advance_MUX_uxn_device_h_l122_c7_9b61_cond;
     auto_advance_MUX_uxn_device_h_l122_c7_9b61_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l122_c7_9b61_iftrue;
     auto_advance_MUX_uxn_device_h_l122_c7_9b61_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l122_c7_9b61_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l122_c7_9b61_return_output := auto_advance_MUX_uxn_device_h_l122_c7_9b61_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l113_c7_7203] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_7203_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_7203_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_7203_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_7203_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_7203_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_7203_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_7203_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_7203_return_output;

     -- x_MUX[uxn_device_h_l149_c3_14dc] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l149_c3_14dc_cond <= VAR_x_MUX_uxn_device_h_l149_c3_14dc_cond;
     x_MUX_uxn_device_h_l149_c3_14dc_iftrue <= VAR_x_MUX_uxn_device_h_l149_c3_14dc_iftrue;
     x_MUX_uxn_device_h_l149_c3_14dc_iffalse <= VAR_x_MUX_uxn_device_h_l149_c3_14dc_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l149_c3_14dc_return_output := x_MUX_uxn_device_h_l149_c3_14dc_return_output;

     -- tmp8_MUX[uxn_device_h_l135_c4_5997] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l135_c4_5997_cond <= VAR_tmp8_MUX_uxn_device_h_l135_c4_5997_cond;
     tmp8_MUX_uxn_device_h_l135_c4_5997_iftrue <= VAR_tmp8_MUX_uxn_device_h_l135_c4_5997_iftrue;
     tmp8_MUX_uxn_device_h_l135_c4_5997_iffalse <= VAR_tmp8_MUX_uxn_device_h_l135_c4_5997_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l135_c4_5997_return_output := tmp8_MUX_uxn_device_h_l135_c4_5997_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l94_c3_e2e9] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l94_c3_e2e9_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_e2e9_cond;
     result_device_ram_address_MUX_uxn_device_h_l94_c3_e2e9_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_e2e9_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l94_c3_e2e9_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_e2e9_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_e2e9_return_output := result_device_ram_address_MUX_uxn_device_h_l94_c3_e2e9_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l181_c4_d009] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l181_c4_d009_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l181_c4_d009_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l181_c4_d009_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l181_c4_d009_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l181_c4_d009_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l181_c4_d009_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l181_c4_d009_return_output := result_is_device_ram_write_MUX_uxn_device_h_l181_c4_d009_return_output;

     -- ctrl_MUX[uxn_device_h_l88_c2_7de5] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l88_c2_7de5_cond <= VAR_ctrl_MUX_uxn_device_h_l88_c2_7de5_cond;
     ctrl_MUX_uxn_device_h_l88_c2_7de5_iftrue <= VAR_ctrl_MUX_uxn_device_h_l88_c2_7de5_iftrue;
     ctrl_MUX_uxn_device_h_l88_c2_7de5_iffalse <= VAR_ctrl_MUX_uxn_device_h_l88_c2_7de5_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l88_c2_7de5_return_output := ctrl_MUX_uxn_device_h_l88_c2_7de5_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l101_c7_ddd9] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l101_c7_ddd9_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_ddd9_cond;
     ctrl_mode_MUX_uxn_device_h_l101_c7_ddd9_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_ddd9_iftrue;
     ctrl_mode_MUX_uxn_device_h_l101_c7_ddd9_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_ddd9_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_ddd9_return_output := ctrl_mode_MUX_uxn_device_h_l101_c7_ddd9_return_output;

     -- flip_y_MUX[uxn_device_h_l101_c7_ddd9] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l101_c7_ddd9_cond <= VAR_flip_y_MUX_uxn_device_h_l101_c7_ddd9_cond;
     flip_y_MUX_uxn_device_h_l101_c7_ddd9_iftrue <= VAR_flip_y_MUX_uxn_device_h_l101_c7_ddd9_iftrue;
     flip_y_MUX_uxn_device_h_l101_c7_ddd9_iffalse <= VAR_flip_y_MUX_uxn_device_h_l101_c7_ddd9_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l101_c7_ddd9_return_output := flip_y_MUX_uxn_device_h_l101_c7_ddd9_return_output;

     -- flip_x_MUX[uxn_device_h_l101_c7_ddd9] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l101_c7_ddd9_cond <= VAR_flip_x_MUX_uxn_device_h_l101_c7_ddd9_cond;
     flip_x_MUX_uxn_device_h_l101_c7_ddd9_iftrue <= VAR_flip_x_MUX_uxn_device_h_l101_c7_ddd9_iftrue;
     flip_x_MUX_uxn_device_h_l101_c7_ddd9_iffalse <= VAR_flip_x_MUX_uxn_device_h_l101_c7_ddd9_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l101_c7_ddd9_return_output := flip_x_MUX_uxn_device_h_l101_c7_ddd9_return_output;

     -- is_drawing_port_MUX[uxn_device_h_l88_c2_7de5] LATENCY=0
     -- Inputs
     is_drawing_port_MUX_uxn_device_h_l88_c2_7de5_cond <= VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_7de5_cond;
     is_drawing_port_MUX_uxn_device_h_l88_c2_7de5_iftrue <= VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_7de5_iftrue;
     is_drawing_port_MUX_uxn_device_h_l88_c2_7de5_iffalse <= VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_7de5_iffalse;
     -- Outputs
     VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_7de5_return_output := is_drawing_port_MUX_uxn_device_h_l88_c2_7de5_return_output;

     -- result_u8_value_MUX[uxn_device_h_l181_c4_d009] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l181_c4_d009_cond <= VAR_result_u8_value_MUX_uxn_device_h_l181_c4_d009_cond;
     result_u8_value_MUX_uxn_device_h_l181_c4_d009_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l181_c4_d009_iftrue;
     result_u8_value_MUX_uxn_device_h_l181_c4_d009_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l181_c4_d009_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l181_c4_d009_return_output := result_u8_value_MUX_uxn_device_h_l181_c4_d009_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l94_c3_e2e9] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l94_c3_e2e9_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_e2e9_cond;
     result_is_deo_done_MUX_uxn_device_h_l94_c3_e2e9_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_e2e9_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l94_c3_e2e9_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_e2e9_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_e2e9_return_output := result_is_deo_done_MUX_uxn_device_h_l94_c3_e2e9_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l167_c3_d4a4] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l167_c3_d4a4_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l167_c3_d4a4_cond;
     result_device_ram_address_MUX_uxn_device_h_l167_c3_d4a4_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l167_c3_d4a4_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l167_c3_d4a4_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l167_c3_d4a4_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l167_c3_d4a4_return_output := result_device_ram_address_MUX_uxn_device_h_l167_c3_d4a4_return_output;

     -- color_MUX[uxn_device_h_l88_c2_7de5] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l88_c2_7de5_cond <= VAR_color_MUX_uxn_device_h_l88_c2_7de5_cond;
     color_MUX_uxn_device_h_l88_c2_7de5_iftrue <= VAR_color_MUX_uxn_device_h_l88_c2_7de5_iftrue;
     color_MUX_uxn_device_h_l88_c2_7de5_iffalse <= VAR_color_MUX_uxn_device_h_l88_c2_7de5_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l88_c2_7de5_return_output := color_MUX_uxn_device_h_l88_c2_7de5_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l149_c3_14dc] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l149_c3_14dc_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c3_14dc_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l149_c3_14dc_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c3_14dc_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l149_c3_14dc_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c3_14dc_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c3_14dc_return_output := result_is_device_ram_write_MUX_uxn_device_h_l149_c3_14dc_return_output;

     -- result_u8_value_MUX[uxn_device_h_l193_c4_da12] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l193_c4_da12_cond <= VAR_result_u8_value_MUX_uxn_device_h_l193_c4_da12_cond;
     result_u8_value_MUX_uxn_device_h_l193_c4_da12_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l193_c4_da12_iftrue;
     result_u8_value_MUX_uxn_device_h_l193_c4_da12_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l193_c4_da12_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l193_c4_da12_return_output := result_u8_value_MUX_uxn_device_h_l193_c4_da12_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l193_c4_da12] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l193_c4_da12_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l193_c4_da12_cond;
     result_device_ram_address_MUX_uxn_device_h_l193_c4_da12_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l193_c4_da12_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l193_c4_da12_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l193_c4_da12_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l193_c4_da12_return_output := result_device_ram_address_MUX_uxn_device_h_l193_c4_da12_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l181_c4_d009] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l181_c4_d009_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l181_c4_d009_cond;
     result_device_ram_address_MUX_uxn_device_h_l181_c4_d009_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l181_c4_d009_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l181_c4_d009_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l181_c4_d009_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l181_c4_d009_return_output := result_device_ram_address_MUX_uxn_device_h_l181_c4_d009_return_output;

     -- Submodule level 4
     VAR_result_u16_addr_uxn_device_h_l132_c4_acec := resize(VAR_BIN_OP_PLUS_uxn_device_h_l132_c23_aafd_return_output, 16);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c7_7b60_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_7203_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l118_c7_7b60_iffalse := VAR_auto_advance_MUX_uxn_device_h_l122_c7_9b61_return_output;
     REG_VAR_color := VAR_color_MUX_uxn_device_h_l88_c2_7de5_return_output;
     REG_VAR_ctrl := VAR_ctrl_MUX_uxn_device_h_l88_c2_7de5_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_7de5_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_ddd9_return_output;
     VAR_flip_x_MUX_uxn_device_h_l88_c2_7de5_iffalse := VAR_flip_x_MUX_uxn_device_h_l101_c7_ddd9_return_output;
     VAR_flip_y_MUX_uxn_device_h_l88_c2_7de5_iffalse := VAR_flip_y_MUX_uxn_device_h_l101_c7_ddd9_return_output;
     REG_VAR_is_drawing_port := VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_7de5_return_output;
     VAR_layer_MUX_uxn_device_h_l88_c2_7de5_iffalse := VAR_layer_MUX_uxn_device_h_l101_c7_ddd9_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l166_c7_2eca_iffalse := VAR_ram_addr_MUX_uxn_device_h_l179_c7_8b67_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l180_c3_80c6_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l181_c4_d009_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l192_c3_f6d1_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l193_c4_da12_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l180_c3_80c6_iftrue := VAR_result_is_device_ram_write_MUX_uxn_device_h_l181_c4_d009_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l192_c3_f6d1_iftrue := VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c4_da12_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l149_c3_14dc_iftrue := VAR_result_u8_value_MUX_uxn_device_h_l154_c4_357e_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l180_c3_80c6_iftrue := VAR_result_u8_value_MUX_uxn_device_h_l181_c4_d009_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l192_c3_f6d1_iftrue := VAR_result_u8_value_MUX_uxn_device_h_l193_c4_da12_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l128_c3_00c7_iftrue := VAR_tmp8_MUX_uxn_device_h_l135_c4_5997_return_output;
     VAR_tmp8_MUX_uxn_device_h_l128_c3_00c7_iftrue := VAR_tmp8_MUX_uxn_device_h_l135_c4_5997_return_output;
     VAR_x_MUX_uxn_device_h_l148_c7_1e53_iftrue := VAR_x_MUX_uxn_device_h_l149_c3_14dc_return_output;
     VAR_y_MUX_uxn_device_h_l122_c7_9b61_iffalse := VAR_y_MUX_uxn_device_h_l127_c7_6d1f_return_output;
     VAR_result_u16_addr_MUX_uxn_device_h_l128_c3_00c7_iftrue := VAR_result_u16_addr_uxn_device_h_l132_c4_acec;
     -- flip_x_MUX[uxn_device_h_l88_c2_7de5] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l88_c2_7de5_cond <= VAR_flip_x_MUX_uxn_device_h_l88_c2_7de5_cond;
     flip_x_MUX_uxn_device_h_l88_c2_7de5_iftrue <= VAR_flip_x_MUX_uxn_device_h_l88_c2_7de5_iftrue;
     flip_x_MUX_uxn_device_h_l88_c2_7de5_iffalse <= VAR_flip_x_MUX_uxn_device_h_l88_c2_7de5_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l88_c2_7de5_return_output := flip_x_MUX_uxn_device_h_l88_c2_7de5_return_output;

     -- layer_MUX[uxn_device_h_l88_c2_7de5] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l88_c2_7de5_cond <= VAR_layer_MUX_uxn_device_h_l88_c2_7de5_cond;
     layer_MUX_uxn_device_h_l88_c2_7de5_iftrue <= VAR_layer_MUX_uxn_device_h_l88_c2_7de5_iftrue;
     layer_MUX_uxn_device_h_l88_c2_7de5_iffalse <= VAR_layer_MUX_uxn_device_h_l88_c2_7de5_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l88_c2_7de5_return_output := layer_MUX_uxn_device_h_l88_c2_7de5_return_output;

     -- result_u8_value_MUX[uxn_device_h_l128_c3_00c7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l128_c3_00c7_cond <= VAR_result_u8_value_MUX_uxn_device_h_l128_c3_00c7_cond;
     result_u8_value_MUX_uxn_device_h_l128_c3_00c7_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l128_c3_00c7_iftrue;
     result_u8_value_MUX_uxn_device_h_l128_c3_00c7_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l128_c3_00c7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l128_c3_00c7_return_output := result_u8_value_MUX_uxn_device_h_l128_c3_00c7_return_output;

     -- ram_addr_MUX[uxn_device_h_l166_c7_2eca] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l166_c7_2eca_cond <= VAR_ram_addr_MUX_uxn_device_h_l166_c7_2eca_cond;
     ram_addr_MUX_uxn_device_h_l166_c7_2eca_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l166_c7_2eca_iftrue;
     ram_addr_MUX_uxn_device_h_l166_c7_2eca_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l166_c7_2eca_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l166_c7_2eca_return_output := ram_addr_MUX_uxn_device_h_l166_c7_2eca_return_output;

     -- result_u16_addr_MUX[uxn_device_h_l128_c3_00c7] LATENCY=0
     -- Inputs
     result_u16_addr_MUX_uxn_device_h_l128_c3_00c7_cond <= VAR_result_u16_addr_MUX_uxn_device_h_l128_c3_00c7_cond;
     result_u16_addr_MUX_uxn_device_h_l128_c3_00c7_iftrue <= VAR_result_u16_addr_MUX_uxn_device_h_l128_c3_00c7_iftrue;
     result_u16_addr_MUX_uxn_device_h_l128_c3_00c7_iffalse <= VAR_result_u16_addr_MUX_uxn_device_h_l128_c3_00c7_iffalse;
     -- Outputs
     VAR_result_u16_addr_MUX_uxn_device_h_l128_c3_00c7_return_output := result_u16_addr_MUX_uxn_device_h_l128_c3_00c7_return_output;

     -- auto_advance_MUX[uxn_device_h_l118_c7_7b60] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l118_c7_7b60_cond <= VAR_auto_advance_MUX_uxn_device_h_l118_c7_7b60_cond;
     auto_advance_MUX_uxn_device_h_l118_c7_7b60_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l118_c7_7b60_iftrue;
     auto_advance_MUX_uxn_device_h_l118_c7_7b60_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l118_c7_7b60_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l118_c7_7b60_return_output := auto_advance_MUX_uxn_device_h_l118_c7_7b60_return_output;

     -- y_MUX[uxn_device_h_l122_c7_9b61] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l122_c7_9b61_cond <= VAR_y_MUX_uxn_device_h_l122_c7_9b61_cond;
     y_MUX_uxn_device_h_l122_c7_9b61_iftrue <= VAR_y_MUX_uxn_device_h_l122_c7_9b61_iftrue;
     y_MUX_uxn_device_h_l122_c7_9b61_iffalse <= VAR_y_MUX_uxn_device_h_l122_c7_9b61_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l122_c7_9b61_return_output := y_MUX_uxn_device_h_l122_c7_9b61_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_56ba[uxn_device_h_l88_c2_7de5] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_56ba_uxn_device_h_l88_c2_7de5_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_56ba(
     result,
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_e2e9_return_output,
     VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_e2e9_return_output);

     -- result_device_ram_address_MUX[uxn_device_h_l192_c3_f6d1] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l192_c3_f6d1_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l192_c3_f6d1_cond;
     result_device_ram_address_MUX_uxn_device_h_l192_c3_f6d1_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l192_c3_f6d1_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l192_c3_f6d1_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l192_c3_f6d1_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l192_c3_f6d1_return_output := result_device_ram_address_MUX_uxn_device_h_l192_c3_f6d1_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l192_c3_f6d1] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l192_c3_f6d1_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l192_c3_f6d1_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l192_c3_f6d1_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l192_c3_f6d1_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l192_c3_f6d1_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l192_c3_f6d1_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l192_c3_f6d1_return_output := result_is_device_ram_write_MUX_uxn_device_h_l192_c3_f6d1_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l118_c7_7b60] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c7_7b60_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c7_7b60_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c7_7b60_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c7_7b60_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c7_7b60_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c7_7b60_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c7_7b60_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c7_7b60_return_output;

     -- x_MUX[uxn_device_h_l148_c7_1e53] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l148_c7_1e53_cond <= VAR_x_MUX_uxn_device_h_l148_c7_1e53_cond;
     x_MUX_uxn_device_h_l148_c7_1e53_iftrue <= VAR_x_MUX_uxn_device_h_l148_c7_1e53_iftrue;
     x_MUX_uxn_device_h_l148_c7_1e53_iffalse <= VAR_x_MUX_uxn_device_h_l148_c7_1e53_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l148_c7_1e53_return_output := x_MUX_uxn_device_h_l148_c7_1e53_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l180_c3_80c6] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l180_c3_80c6_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l180_c3_80c6_cond;
     result_device_ram_address_MUX_uxn_device_h_l180_c3_80c6_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l180_c3_80c6_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l180_c3_80c6_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l180_c3_80c6_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l180_c3_80c6_return_output := result_device_ram_address_MUX_uxn_device_h_l180_c3_80c6_return_output;

     -- flip_y_MUX[uxn_device_h_l88_c2_7de5] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l88_c2_7de5_cond <= VAR_flip_y_MUX_uxn_device_h_l88_c2_7de5_cond;
     flip_y_MUX_uxn_device_h_l88_c2_7de5_iftrue <= VAR_flip_y_MUX_uxn_device_h_l88_c2_7de5_iftrue;
     flip_y_MUX_uxn_device_h_l88_c2_7de5_iffalse <= VAR_flip_y_MUX_uxn_device_h_l88_c2_7de5_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l88_c2_7de5_return_output := flip_y_MUX_uxn_device_h_l88_c2_7de5_return_output;

     -- tmp8_MUX[uxn_device_h_l128_c3_00c7] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l128_c3_00c7_cond <= VAR_tmp8_MUX_uxn_device_h_l128_c3_00c7_cond;
     tmp8_MUX_uxn_device_h_l128_c3_00c7_iftrue <= VAR_tmp8_MUX_uxn_device_h_l128_c3_00c7_iftrue;
     tmp8_MUX_uxn_device_h_l128_c3_00c7_iffalse <= VAR_tmp8_MUX_uxn_device_h_l128_c3_00c7_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l128_c3_00c7_return_output := tmp8_MUX_uxn_device_h_l128_c3_00c7_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l88_c2_7de5] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l88_c2_7de5_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_7de5_cond;
     ctrl_mode_MUX_uxn_device_h_l88_c2_7de5_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_7de5_iftrue;
     ctrl_mode_MUX_uxn_device_h_l88_c2_7de5_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_7de5_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_7de5_return_output := ctrl_mode_MUX_uxn_device_h_l88_c2_7de5_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_4bef[uxn_device_h_l166_c7_2eca] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_4bef_uxn_device_h_l166_c7_2eca_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_4bef(
     result,
     VAR_result_u8_value_MUX_uxn_device_h_l167_c3_d4a4_return_output,
     VAR_result_device_ram_address_MUX_uxn_device_h_l167_c3_d4a4_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l167_c3_d4a4_return_output);

     -- result_is_device_ram_write_MUX[uxn_device_h_l180_c3_80c6] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l180_c3_80c6_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l180_c3_80c6_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l180_c3_80c6_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l180_c3_80c6_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l180_c3_80c6_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l180_c3_80c6_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l180_c3_80c6_return_output := result_is_device_ram_write_MUX_uxn_device_h_l180_c3_80c6_return_output;

     -- result_u8_value_MUX[uxn_device_h_l192_c3_f6d1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l192_c3_f6d1_cond <= VAR_result_u8_value_MUX_uxn_device_h_l192_c3_f6d1_cond;
     result_u8_value_MUX_uxn_device_h_l192_c3_f6d1_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l192_c3_f6d1_iftrue;
     result_u8_value_MUX_uxn_device_h_l192_c3_f6d1_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l192_c3_f6d1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l192_c3_f6d1_return_output := result_u8_value_MUX_uxn_device_h_l192_c3_f6d1_return_output;

     -- result_u8_value_MUX[uxn_device_h_l180_c3_80c6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l180_c3_80c6_cond <= VAR_result_u8_value_MUX_uxn_device_h_l180_c3_80c6_cond;
     result_u8_value_MUX_uxn_device_h_l180_c3_80c6_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l180_c3_80c6_iftrue;
     result_u8_value_MUX_uxn_device_h_l180_c3_80c6_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l180_c3_80c6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l180_c3_80c6_return_output := result_u8_value_MUX_uxn_device_h_l180_c3_80c6_return_output;

     -- result_u8_value_MUX[uxn_device_h_l149_c3_14dc] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l149_c3_14dc_cond <= VAR_result_u8_value_MUX_uxn_device_h_l149_c3_14dc_cond;
     result_u8_value_MUX_uxn_device_h_l149_c3_14dc_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l149_c3_14dc_iftrue;
     result_u8_value_MUX_uxn_device_h_l149_c3_14dc_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l149_c3_14dc_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l149_c3_14dc_return_output := result_u8_value_MUX_uxn_device_h_l149_c3_14dc_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l122_c7_9b61_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c7_7b60_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l113_c7_7203_iffalse := VAR_auto_advance_MUX_uxn_device_h_l118_c7_7b60_return_output;
     REG_VAR_ctrl_mode := VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_7de5_return_output;
     REG_VAR_flip_x := VAR_flip_x_MUX_uxn_device_h_l88_c2_7de5_return_output;
     REG_VAR_flip_y := VAR_flip_y_MUX_uxn_device_h_l88_c2_7de5_return_output;
     REG_VAR_layer := VAR_layer_MUX_uxn_device_h_l88_c2_7de5_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l148_c7_1e53_iffalse := VAR_ram_addr_MUX_uxn_device_h_l166_c7_2eca_return_output;
     VAR_result_MUX_uxn_device_h_l166_c7_2eca_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_4bef_uxn_device_h_l166_c7_2eca_return_output;
     VAR_result_MUX_uxn_device_h_l88_c2_7de5_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_56ba_uxn_device_h_l88_c2_7de5_return_output;
     VAR_tmp8_MUX_uxn_device_h_l127_c7_6d1f_iftrue := VAR_tmp8_MUX_uxn_device_h_l128_c3_00c7_return_output;
     VAR_x_MUX_uxn_device_h_l127_c7_6d1f_iffalse := VAR_x_MUX_uxn_device_h_l148_c7_1e53_return_output;
     VAR_y_MUX_uxn_device_h_l118_c7_7b60_iffalse := VAR_y_MUX_uxn_device_h_l122_c7_9b61_return_output;
     -- tmp8_MUX[uxn_device_h_l127_c7_6d1f] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l127_c7_6d1f_cond <= VAR_tmp8_MUX_uxn_device_h_l127_c7_6d1f_cond;
     tmp8_MUX_uxn_device_h_l127_c7_6d1f_iftrue <= VAR_tmp8_MUX_uxn_device_h_l127_c7_6d1f_iftrue;
     tmp8_MUX_uxn_device_h_l127_c7_6d1f_iffalse <= VAR_tmp8_MUX_uxn_device_h_l127_c7_6d1f_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l127_c7_6d1f_return_output := tmp8_MUX_uxn_device_h_l127_c7_6d1f_return_output;

     -- auto_advance_MUX[uxn_device_h_l113_c7_7203] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l113_c7_7203_cond <= VAR_auto_advance_MUX_uxn_device_h_l113_c7_7203_cond;
     auto_advance_MUX_uxn_device_h_l113_c7_7203_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l113_c7_7203_iftrue;
     auto_advance_MUX_uxn_device_h_l113_c7_7203_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l113_c7_7203_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l113_c7_7203_return_output := auto_advance_MUX_uxn_device_h_l113_c7_7203_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_4bef[uxn_device_h_l191_c7_cd63] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_4bef_uxn_device_h_l191_c7_cd63_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_4bef(
     result,
     VAR_result_u8_value_MUX_uxn_device_h_l192_c3_f6d1_return_output,
     VAR_result_device_ram_address_MUX_uxn_device_h_l192_c3_f6d1_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l192_c3_f6d1_return_output);

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_67b7[uxn_device_h_l127_c7_6d1f] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_67b7_uxn_device_h_l127_c7_6d1f_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_67b7(
     result,
     VAR_result_is_deo_done_MUX_uxn_device_h_l128_c3_00c7_return_output,
     VAR_result_u16_addr_MUX_uxn_device_h_l128_c3_00c7_return_output,
     VAR_result_is_vram_write_MUX_uxn_device_h_l128_c3_00c7_return_output,
     VAR_result_u8_value_MUX_uxn_device_h_l128_c3_00c7_return_output,
     VAR_result_vram_write_layer_MUX_uxn_device_h_l128_c3_00c7_return_output,
     VAR_result_device_ram_address_MUX_uxn_device_h_l128_c3_00c7_return_output);

     -- x_MUX[uxn_device_h_l127_c7_6d1f] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l127_c7_6d1f_cond <= VAR_x_MUX_uxn_device_h_l127_c7_6d1f_cond;
     x_MUX_uxn_device_h_l127_c7_6d1f_iftrue <= VAR_x_MUX_uxn_device_h_l127_c7_6d1f_iftrue;
     x_MUX_uxn_device_h_l127_c7_6d1f_iffalse <= VAR_x_MUX_uxn_device_h_l127_c7_6d1f_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l127_c7_6d1f_return_output := x_MUX_uxn_device_h_l127_c7_6d1f_return_output;

     -- ram_addr_MUX[uxn_device_h_l148_c7_1e53] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l148_c7_1e53_cond <= VAR_ram_addr_MUX_uxn_device_h_l148_c7_1e53_cond;
     ram_addr_MUX_uxn_device_h_l148_c7_1e53_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l148_c7_1e53_iftrue;
     ram_addr_MUX_uxn_device_h_l148_c7_1e53_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l148_c7_1e53_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l148_c7_1e53_return_output := ram_addr_MUX_uxn_device_h_l148_c7_1e53_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_4bef[uxn_device_h_l179_c7_8b67] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_4bef_uxn_device_h_l179_c7_8b67_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_4bef(
     result,
     VAR_result_u8_value_MUX_uxn_device_h_l180_c3_80c6_return_output,
     VAR_result_device_ram_address_MUX_uxn_device_h_l180_c3_80c6_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l180_c3_80c6_return_output);

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_0eea[uxn_device_h_l148_c7_1e53] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_0eea_uxn_device_h_l148_c7_1e53_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_0eea(
     result,
     VAR_result_is_vram_write_MUX_uxn_device_h_l149_c3_14dc_return_output,
     VAR_result_u16_addr_MUX_uxn_device_h_l149_c3_14dc_return_output,
     VAR_result_device_ram_address_MUX_uxn_device_h_l149_c3_14dc_return_output,
     VAR_result_u8_value_MUX_uxn_device_h_l149_c3_14dc_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c3_14dc_return_output);

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l122_c7_9b61] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l122_c7_9b61_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l122_c7_9b61_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l122_c7_9b61_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l122_c7_9b61_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l122_c7_9b61_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l122_c7_9b61_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l122_c7_9b61_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l122_c7_9b61_return_output;

     -- y_MUX[uxn_device_h_l118_c7_7b60] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l118_c7_7b60_cond <= VAR_y_MUX_uxn_device_h_l118_c7_7b60_cond;
     y_MUX_uxn_device_h_l118_c7_7b60_iftrue <= VAR_y_MUX_uxn_device_h_l118_c7_7b60_iftrue;
     y_MUX_uxn_device_h_l118_c7_7b60_iffalse <= VAR_y_MUX_uxn_device_h_l118_c7_7b60_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l118_c7_7b60_return_output := y_MUX_uxn_device_h_l118_c7_7b60_return_output;

     -- Submodule level 6
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l127_c7_6d1f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l122_c7_9b61_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l104_c7_6998_iffalse := VAR_auto_advance_MUX_uxn_device_h_l113_c7_7203_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l127_c7_6d1f_iffalse := VAR_ram_addr_MUX_uxn_device_h_l148_c7_1e53_return_output;
     VAR_result_MUX_uxn_device_h_l148_c7_1e53_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_0eea_uxn_device_h_l148_c7_1e53_return_output;
     VAR_result_MUX_uxn_device_h_l179_c7_8b67_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_4bef_uxn_device_h_l179_c7_8b67_return_output;
     VAR_result_MUX_uxn_device_h_l191_c7_cd63_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_4bef_uxn_device_h_l191_c7_cd63_return_output;
     VAR_result_MUX_uxn_device_h_l127_c7_6d1f_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_67b7_uxn_device_h_l127_c7_6d1f_return_output;
     VAR_tmp8_MUX_uxn_device_h_l122_c7_9b61_iffalse := VAR_tmp8_MUX_uxn_device_h_l127_c7_6d1f_return_output;
     VAR_x_MUX_uxn_device_h_l122_c7_9b61_iffalse := VAR_x_MUX_uxn_device_h_l127_c7_6d1f_return_output;
     VAR_y_MUX_uxn_device_h_l113_c7_7203_iffalse := VAR_y_MUX_uxn_device_h_l118_c7_7b60_return_output;
     -- ram_addr_MUX[uxn_device_h_l127_c7_6d1f] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l127_c7_6d1f_cond <= VAR_ram_addr_MUX_uxn_device_h_l127_c7_6d1f_cond;
     ram_addr_MUX_uxn_device_h_l127_c7_6d1f_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l127_c7_6d1f_iftrue;
     ram_addr_MUX_uxn_device_h_l127_c7_6d1f_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l127_c7_6d1f_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l127_c7_6d1f_return_output := ram_addr_MUX_uxn_device_h_l127_c7_6d1f_return_output;

     -- auto_advance_MUX[uxn_device_h_l104_c7_6998] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l104_c7_6998_cond <= VAR_auto_advance_MUX_uxn_device_h_l104_c7_6998_cond;
     auto_advance_MUX_uxn_device_h_l104_c7_6998_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l104_c7_6998_iftrue;
     auto_advance_MUX_uxn_device_h_l104_c7_6998_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l104_c7_6998_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l104_c7_6998_return_output := auto_advance_MUX_uxn_device_h_l104_c7_6998_return_output;

     -- tmp8_MUX[uxn_device_h_l122_c7_9b61] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l122_c7_9b61_cond <= VAR_tmp8_MUX_uxn_device_h_l122_c7_9b61_cond;
     tmp8_MUX_uxn_device_h_l122_c7_9b61_iftrue <= VAR_tmp8_MUX_uxn_device_h_l122_c7_9b61_iftrue;
     tmp8_MUX_uxn_device_h_l122_c7_9b61_iffalse <= VAR_tmp8_MUX_uxn_device_h_l122_c7_9b61_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l122_c7_9b61_return_output := tmp8_MUX_uxn_device_h_l122_c7_9b61_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l127_c7_6d1f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l127_c7_6d1f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l127_c7_6d1f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l127_c7_6d1f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l127_c7_6d1f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l127_c7_6d1f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l127_c7_6d1f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l127_c7_6d1f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l127_c7_6d1f_return_output;

     -- y_MUX[uxn_device_h_l113_c7_7203] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l113_c7_7203_cond <= VAR_y_MUX_uxn_device_h_l113_c7_7203_cond;
     y_MUX_uxn_device_h_l113_c7_7203_iftrue <= VAR_y_MUX_uxn_device_h_l113_c7_7203_iftrue;
     y_MUX_uxn_device_h_l113_c7_7203_iffalse <= VAR_y_MUX_uxn_device_h_l113_c7_7203_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l113_c7_7203_return_output := y_MUX_uxn_device_h_l113_c7_7203_return_output;

     -- x_MUX[uxn_device_h_l122_c7_9b61] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l122_c7_9b61_cond <= VAR_x_MUX_uxn_device_h_l122_c7_9b61_cond;
     x_MUX_uxn_device_h_l122_c7_9b61_iftrue <= VAR_x_MUX_uxn_device_h_l122_c7_9b61_iftrue;
     x_MUX_uxn_device_h_l122_c7_9b61_iffalse <= VAR_x_MUX_uxn_device_h_l122_c7_9b61_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l122_c7_9b61_return_output := x_MUX_uxn_device_h_l122_c7_9b61_return_output;

     -- Submodule level 7
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l148_c7_1e53_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l127_c7_6d1f_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l101_c7_ddd9_iffalse := VAR_auto_advance_MUX_uxn_device_h_l104_c7_6998_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l122_c7_9b61_iffalse := VAR_ram_addr_MUX_uxn_device_h_l127_c7_6d1f_return_output;
     VAR_tmp8_MUX_uxn_device_h_l118_c7_7b60_iffalse := VAR_tmp8_MUX_uxn_device_h_l122_c7_9b61_return_output;
     VAR_x_MUX_uxn_device_h_l118_c7_7b60_iffalse := VAR_x_MUX_uxn_device_h_l122_c7_9b61_return_output;
     VAR_y_MUX_uxn_device_h_l104_c7_6998_iffalse := VAR_y_MUX_uxn_device_h_l113_c7_7203_return_output;
     -- auto_advance_MUX[uxn_device_h_l101_c7_ddd9] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l101_c7_ddd9_cond <= VAR_auto_advance_MUX_uxn_device_h_l101_c7_ddd9_cond;
     auto_advance_MUX_uxn_device_h_l101_c7_ddd9_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l101_c7_ddd9_iftrue;
     auto_advance_MUX_uxn_device_h_l101_c7_ddd9_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l101_c7_ddd9_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l101_c7_ddd9_return_output := auto_advance_MUX_uxn_device_h_l101_c7_ddd9_return_output;

     -- y_MUX[uxn_device_h_l104_c7_6998] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l104_c7_6998_cond <= VAR_y_MUX_uxn_device_h_l104_c7_6998_cond;
     y_MUX_uxn_device_h_l104_c7_6998_iftrue <= VAR_y_MUX_uxn_device_h_l104_c7_6998_iftrue;
     y_MUX_uxn_device_h_l104_c7_6998_iffalse <= VAR_y_MUX_uxn_device_h_l104_c7_6998_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l104_c7_6998_return_output := y_MUX_uxn_device_h_l104_c7_6998_return_output;

     -- ram_addr_MUX[uxn_device_h_l122_c7_9b61] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l122_c7_9b61_cond <= VAR_ram_addr_MUX_uxn_device_h_l122_c7_9b61_cond;
     ram_addr_MUX_uxn_device_h_l122_c7_9b61_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l122_c7_9b61_iftrue;
     ram_addr_MUX_uxn_device_h_l122_c7_9b61_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l122_c7_9b61_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l122_c7_9b61_return_output := ram_addr_MUX_uxn_device_h_l122_c7_9b61_return_output;

     -- tmp8_MUX[uxn_device_h_l118_c7_7b60] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l118_c7_7b60_cond <= VAR_tmp8_MUX_uxn_device_h_l118_c7_7b60_cond;
     tmp8_MUX_uxn_device_h_l118_c7_7b60_iftrue <= VAR_tmp8_MUX_uxn_device_h_l118_c7_7b60_iftrue;
     tmp8_MUX_uxn_device_h_l118_c7_7b60_iffalse <= VAR_tmp8_MUX_uxn_device_h_l118_c7_7b60_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l118_c7_7b60_return_output := tmp8_MUX_uxn_device_h_l118_c7_7b60_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l148_c7_1e53] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l148_c7_1e53_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l148_c7_1e53_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l148_c7_1e53_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l148_c7_1e53_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l148_c7_1e53_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l148_c7_1e53_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l148_c7_1e53_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l148_c7_1e53_return_output;

     -- x_MUX[uxn_device_h_l118_c7_7b60] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l118_c7_7b60_cond <= VAR_x_MUX_uxn_device_h_l118_c7_7b60_cond;
     x_MUX_uxn_device_h_l118_c7_7b60_iftrue <= VAR_x_MUX_uxn_device_h_l118_c7_7b60_iftrue;
     x_MUX_uxn_device_h_l118_c7_7b60_iffalse <= VAR_x_MUX_uxn_device_h_l118_c7_7b60_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l118_c7_7b60_return_output := x_MUX_uxn_device_h_l118_c7_7b60_return_output;

     -- Submodule level 8
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l166_c7_2eca_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l148_c7_1e53_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l88_c2_7de5_iffalse := VAR_auto_advance_MUX_uxn_device_h_l101_c7_ddd9_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l118_c7_7b60_iffalse := VAR_ram_addr_MUX_uxn_device_h_l122_c7_9b61_return_output;
     VAR_tmp8_MUX_uxn_device_h_l113_c7_7203_iffalse := VAR_tmp8_MUX_uxn_device_h_l118_c7_7b60_return_output;
     VAR_x_MUX_uxn_device_h_l113_c7_7203_iffalse := VAR_x_MUX_uxn_device_h_l118_c7_7b60_return_output;
     VAR_y_MUX_uxn_device_h_l101_c7_ddd9_iffalse := VAR_y_MUX_uxn_device_h_l104_c7_6998_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l166_c7_2eca] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l166_c7_2eca_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l166_c7_2eca_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l166_c7_2eca_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l166_c7_2eca_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l166_c7_2eca_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l166_c7_2eca_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l166_c7_2eca_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l166_c7_2eca_return_output;

     -- x_MUX[uxn_device_h_l113_c7_7203] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l113_c7_7203_cond <= VAR_x_MUX_uxn_device_h_l113_c7_7203_cond;
     x_MUX_uxn_device_h_l113_c7_7203_iftrue <= VAR_x_MUX_uxn_device_h_l113_c7_7203_iftrue;
     x_MUX_uxn_device_h_l113_c7_7203_iffalse <= VAR_x_MUX_uxn_device_h_l113_c7_7203_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l113_c7_7203_return_output := x_MUX_uxn_device_h_l113_c7_7203_return_output;

     -- ram_addr_MUX[uxn_device_h_l118_c7_7b60] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l118_c7_7b60_cond <= VAR_ram_addr_MUX_uxn_device_h_l118_c7_7b60_cond;
     ram_addr_MUX_uxn_device_h_l118_c7_7b60_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l118_c7_7b60_iftrue;
     ram_addr_MUX_uxn_device_h_l118_c7_7b60_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l118_c7_7b60_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l118_c7_7b60_return_output := ram_addr_MUX_uxn_device_h_l118_c7_7b60_return_output;

     -- y_MUX[uxn_device_h_l101_c7_ddd9] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l101_c7_ddd9_cond <= VAR_y_MUX_uxn_device_h_l101_c7_ddd9_cond;
     y_MUX_uxn_device_h_l101_c7_ddd9_iftrue <= VAR_y_MUX_uxn_device_h_l101_c7_ddd9_iftrue;
     y_MUX_uxn_device_h_l101_c7_ddd9_iffalse <= VAR_y_MUX_uxn_device_h_l101_c7_ddd9_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l101_c7_ddd9_return_output := y_MUX_uxn_device_h_l101_c7_ddd9_return_output;

     -- tmp8_MUX[uxn_device_h_l113_c7_7203] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l113_c7_7203_cond <= VAR_tmp8_MUX_uxn_device_h_l113_c7_7203_cond;
     tmp8_MUX_uxn_device_h_l113_c7_7203_iftrue <= VAR_tmp8_MUX_uxn_device_h_l113_c7_7203_iftrue;
     tmp8_MUX_uxn_device_h_l113_c7_7203_iffalse <= VAR_tmp8_MUX_uxn_device_h_l113_c7_7203_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l113_c7_7203_return_output := tmp8_MUX_uxn_device_h_l113_c7_7203_return_output;

     -- auto_advance_MUX[uxn_device_h_l88_c2_7de5] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l88_c2_7de5_cond <= VAR_auto_advance_MUX_uxn_device_h_l88_c2_7de5_cond;
     auto_advance_MUX_uxn_device_h_l88_c2_7de5_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l88_c2_7de5_iftrue;
     auto_advance_MUX_uxn_device_h_l88_c2_7de5_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l88_c2_7de5_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l88_c2_7de5_return_output := auto_advance_MUX_uxn_device_h_l88_c2_7de5_return_output;

     -- Submodule level 9
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l179_c7_8b67_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l166_c7_2eca_return_output;
     REG_VAR_auto_advance := VAR_auto_advance_MUX_uxn_device_h_l88_c2_7de5_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l113_c7_7203_iffalse := VAR_ram_addr_MUX_uxn_device_h_l118_c7_7b60_return_output;
     VAR_tmp8_MUX_uxn_device_h_l104_c7_6998_iffalse := VAR_tmp8_MUX_uxn_device_h_l113_c7_7203_return_output;
     VAR_x_MUX_uxn_device_h_l104_c7_6998_iffalse := VAR_x_MUX_uxn_device_h_l113_c7_7203_return_output;
     VAR_y_MUX_uxn_device_h_l88_c2_7de5_iffalse := VAR_y_MUX_uxn_device_h_l101_c7_ddd9_return_output;
     -- tmp8_MUX[uxn_device_h_l104_c7_6998] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l104_c7_6998_cond <= VAR_tmp8_MUX_uxn_device_h_l104_c7_6998_cond;
     tmp8_MUX_uxn_device_h_l104_c7_6998_iftrue <= VAR_tmp8_MUX_uxn_device_h_l104_c7_6998_iftrue;
     tmp8_MUX_uxn_device_h_l104_c7_6998_iffalse <= VAR_tmp8_MUX_uxn_device_h_l104_c7_6998_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l104_c7_6998_return_output := tmp8_MUX_uxn_device_h_l104_c7_6998_return_output;

     -- y_MUX[uxn_device_h_l88_c2_7de5] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l88_c2_7de5_cond <= VAR_y_MUX_uxn_device_h_l88_c2_7de5_cond;
     y_MUX_uxn_device_h_l88_c2_7de5_iftrue <= VAR_y_MUX_uxn_device_h_l88_c2_7de5_iftrue;
     y_MUX_uxn_device_h_l88_c2_7de5_iffalse <= VAR_y_MUX_uxn_device_h_l88_c2_7de5_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l88_c2_7de5_return_output := y_MUX_uxn_device_h_l88_c2_7de5_return_output;

     -- ram_addr_MUX[uxn_device_h_l113_c7_7203] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l113_c7_7203_cond <= VAR_ram_addr_MUX_uxn_device_h_l113_c7_7203_cond;
     ram_addr_MUX_uxn_device_h_l113_c7_7203_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l113_c7_7203_iftrue;
     ram_addr_MUX_uxn_device_h_l113_c7_7203_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l113_c7_7203_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l113_c7_7203_return_output := ram_addr_MUX_uxn_device_h_l113_c7_7203_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l179_c7_8b67] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l179_c7_8b67_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l179_c7_8b67_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l179_c7_8b67_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l179_c7_8b67_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l179_c7_8b67_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l179_c7_8b67_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l179_c7_8b67_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l179_c7_8b67_return_output;

     -- x_MUX[uxn_device_h_l104_c7_6998] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l104_c7_6998_cond <= VAR_x_MUX_uxn_device_h_l104_c7_6998_cond;
     x_MUX_uxn_device_h_l104_c7_6998_iftrue <= VAR_x_MUX_uxn_device_h_l104_c7_6998_iftrue;
     x_MUX_uxn_device_h_l104_c7_6998_iffalse <= VAR_x_MUX_uxn_device_h_l104_c7_6998_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l104_c7_6998_return_output := x_MUX_uxn_device_h_l104_c7_6998_return_output;

     -- Submodule level 10
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l191_c7_cd63_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l179_c7_8b67_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l104_c7_6998_iffalse := VAR_ram_addr_MUX_uxn_device_h_l113_c7_7203_return_output;
     VAR_tmp8_MUX_uxn_device_h_l101_c7_ddd9_iffalse := VAR_tmp8_MUX_uxn_device_h_l104_c7_6998_return_output;
     VAR_x_MUX_uxn_device_h_l101_c7_ddd9_iffalse := VAR_x_MUX_uxn_device_h_l104_c7_6998_return_output;
     REG_VAR_y := VAR_y_MUX_uxn_device_h_l88_c2_7de5_return_output;
     -- ram_addr_MUX[uxn_device_h_l104_c7_6998] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l104_c7_6998_cond <= VAR_ram_addr_MUX_uxn_device_h_l104_c7_6998_cond;
     ram_addr_MUX_uxn_device_h_l104_c7_6998_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l104_c7_6998_iftrue;
     ram_addr_MUX_uxn_device_h_l104_c7_6998_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l104_c7_6998_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l104_c7_6998_return_output := ram_addr_MUX_uxn_device_h_l104_c7_6998_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l191_c7_cd63] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l191_c7_cd63_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l191_c7_cd63_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l191_c7_cd63_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l191_c7_cd63_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l191_c7_cd63_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l191_c7_cd63_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l191_c7_cd63_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l191_c7_cd63_return_output;

     -- tmp8_MUX[uxn_device_h_l101_c7_ddd9] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l101_c7_ddd9_cond <= VAR_tmp8_MUX_uxn_device_h_l101_c7_ddd9_cond;
     tmp8_MUX_uxn_device_h_l101_c7_ddd9_iftrue <= VAR_tmp8_MUX_uxn_device_h_l101_c7_ddd9_iftrue;
     tmp8_MUX_uxn_device_h_l101_c7_ddd9_iffalse <= VAR_tmp8_MUX_uxn_device_h_l101_c7_ddd9_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l101_c7_ddd9_return_output := tmp8_MUX_uxn_device_h_l101_c7_ddd9_return_output;

     -- x_MUX[uxn_device_h_l101_c7_ddd9] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l101_c7_ddd9_cond <= VAR_x_MUX_uxn_device_h_l101_c7_ddd9_cond;
     x_MUX_uxn_device_h_l101_c7_ddd9_iftrue <= VAR_x_MUX_uxn_device_h_l101_c7_ddd9_iftrue;
     x_MUX_uxn_device_h_l101_c7_ddd9_iffalse <= VAR_x_MUX_uxn_device_h_l101_c7_ddd9_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l101_c7_ddd9_return_output := x_MUX_uxn_device_h_l101_c7_ddd9_return_output;

     -- Submodule level 11
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l200_c1_2e5f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l191_c7_cd63_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l101_c7_ddd9_iffalse := VAR_ram_addr_MUX_uxn_device_h_l104_c7_6998_return_output;
     VAR_tmp8_MUX_uxn_device_h_l88_c2_7de5_iffalse := VAR_tmp8_MUX_uxn_device_h_l101_c7_ddd9_return_output;
     VAR_x_MUX_uxn_device_h_l88_c2_7de5_iffalse := VAR_x_MUX_uxn_device_h_l101_c7_ddd9_return_output;
     -- tmp8_MUX[uxn_device_h_l88_c2_7de5] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l88_c2_7de5_cond <= VAR_tmp8_MUX_uxn_device_h_l88_c2_7de5_cond;
     tmp8_MUX_uxn_device_h_l88_c2_7de5_iftrue <= VAR_tmp8_MUX_uxn_device_h_l88_c2_7de5_iftrue;
     tmp8_MUX_uxn_device_h_l88_c2_7de5_iffalse <= VAR_tmp8_MUX_uxn_device_h_l88_c2_7de5_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l88_c2_7de5_return_output := tmp8_MUX_uxn_device_h_l88_c2_7de5_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l200_c1_2e5f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l200_c1_2e5f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l200_c1_2e5f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l200_c1_2e5f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l200_c1_2e5f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l200_c1_2e5f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l200_c1_2e5f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l200_c1_2e5f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l200_c1_2e5f_return_output;

     -- ram_addr_MUX[uxn_device_h_l101_c7_ddd9] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l101_c7_ddd9_cond <= VAR_ram_addr_MUX_uxn_device_h_l101_c7_ddd9_cond;
     ram_addr_MUX_uxn_device_h_l101_c7_ddd9_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l101_c7_ddd9_iftrue;
     ram_addr_MUX_uxn_device_h_l101_c7_ddd9_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l101_c7_ddd9_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l101_c7_ddd9_return_output := ram_addr_MUX_uxn_device_h_l101_c7_ddd9_return_output;

     -- x_MUX[uxn_device_h_l88_c2_7de5] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l88_c2_7de5_cond <= VAR_x_MUX_uxn_device_h_l88_c2_7de5_cond;
     x_MUX_uxn_device_h_l88_c2_7de5_iftrue <= VAR_x_MUX_uxn_device_h_l88_c2_7de5_iftrue;
     x_MUX_uxn_device_h_l88_c2_7de5_iffalse <= VAR_x_MUX_uxn_device_h_l88_c2_7de5_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l88_c2_7de5_return_output := x_MUX_uxn_device_h_l88_c2_7de5_return_output;

     -- Submodule level 12
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_c523_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l200_c1_2e5f_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l88_c2_7de5_iffalse := VAR_ram_addr_MUX_uxn_device_h_l101_c7_ddd9_return_output;
     REG_VAR_tmp8 := VAR_tmp8_MUX_uxn_device_h_l88_c2_7de5_return_output;
     REG_VAR_x := VAR_x_MUX_uxn_device_h_l88_c2_7de5_return_output;
     -- ram_addr_MUX[uxn_device_h_l88_c2_7de5] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l88_c2_7de5_cond <= VAR_ram_addr_MUX_uxn_device_h_l88_c2_7de5_cond;
     ram_addr_MUX_uxn_device_h_l88_c2_7de5_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l88_c2_7de5_iftrue;
     ram_addr_MUX_uxn_device_h_l88_c2_7de5_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l88_c2_7de5_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l88_c2_7de5_return_output := ram_addr_MUX_uxn_device_h_l88_c2_7de5_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l201_c1_c523] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_c523_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_c523_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_c523_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_c523_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_c523_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_c523_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_c523_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_c523_return_output;

     -- Submodule level 13
     VAR_screen_blit_uxn_device_h_l202_c46_90b0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_c523_return_output;
     REG_VAR_ram_addr := VAR_ram_addr_MUX_uxn_device_h_l88_c2_7de5_return_output;
     -- screen_blit[uxn_device_h_l202_c46_90b0] LATENCY=0
     -- Clock enable
     screen_blit_uxn_device_h_l202_c46_90b0_CLOCK_ENABLE <= VAR_screen_blit_uxn_device_h_l202_c46_90b0_CLOCK_ENABLE;
     -- Inputs
     screen_blit_uxn_device_h_l202_c46_90b0_phase <= VAR_screen_blit_uxn_device_h_l202_c46_90b0_phase;
     screen_blit_uxn_device_h_l202_c46_90b0_ctrl <= VAR_screen_blit_uxn_device_h_l202_c46_90b0_ctrl;
     screen_blit_uxn_device_h_l202_c46_90b0_auto_advance <= VAR_screen_blit_uxn_device_h_l202_c46_90b0_auto_advance;
     screen_blit_uxn_device_h_l202_c46_90b0_x <= VAR_screen_blit_uxn_device_h_l202_c46_90b0_x;
     screen_blit_uxn_device_h_l202_c46_90b0_y <= VAR_screen_blit_uxn_device_h_l202_c46_90b0_y;
     screen_blit_uxn_device_h_l202_c46_90b0_ram_addr <= VAR_screen_blit_uxn_device_h_l202_c46_90b0_ram_addr;
     screen_blit_uxn_device_h_l202_c46_90b0_previous_ram_read <= VAR_screen_blit_uxn_device_h_l202_c46_90b0_previous_ram_read;
     -- Outputs
     VAR_screen_blit_uxn_device_h_l202_c46_90b0_return_output := screen_blit_uxn_device_h_l202_c46_90b0_return_output;

     -- Submodule level 14
     -- CONST_REF_RD_uint16_t_screen_blit_result_t_u16_addr_d41d[uxn_device_h_l206_c22_1ec9] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_screen_blit_result_t_u16_addr_d41d_uxn_device_h_l206_c22_1ec9_return_output := VAR_screen_blit_uxn_device_h_l202_c46_90b0_return_output.u16_addr;

     -- CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d[uxn_device_h_l205_c27_bef8] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d_uxn_device_h_l205_c27_bef8_return_output := VAR_screen_blit_uxn_device_h_l202_c46_90b0_return_output.is_vram_write;

     -- CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d[uxn_device_h_l209_c25_3ac1] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l209_c25_3ac1_return_output := VAR_screen_blit_uxn_device_h_l202_c46_90b0_return_output.is_blit_done;

     -- CONST_REF_RD_uint8_t_screen_blit_result_t_u8_value_d41d[uxn_device_h_l208_c22_e56c] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_screen_blit_result_t_u8_value_d41d_uxn_device_h_l208_c22_e56c_return_output := VAR_screen_blit_uxn_device_h_l202_c46_90b0_return_output.u8_value;

     -- CONST_REF_RD_uint1_t_screen_blit_result_t_vram_write_layer_d41d[uxn_device_h_l207_c30_5975] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_vram_write_layer_d41d_uxn_device_h_l207_c30_5975_return_output := VAR_screen_blit_uxn_device_h_l202_c46_90b0_return_output.vram_write_layer;

     -- Submodule level 15
     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_a3ba[uxn_device_h_l201_c3_2947] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_a3ba_uxn_device_h_l201_c3_2947_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_a3ba(
     to_unsigned(0, 1),
     VAR_result_device_ram_address_uxn_device_h_l204_c4_1114,
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d_uxn_device_h_l205_c27_bef8_return_output,
     VAR_CONST_REF_RD_uint16_t_screen_blit_result_t_u16_addr_d41d_uxn_device_h_l206_c22_1ec9_return_output,
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_vram_write_layer_d41d_uxn_device_h_l207_c30_5975_return_output,
     VAR_CONST_REF_RD_uint8_t_screen_blit_result_t_u8_value_d41d_uxn_device_h_l208_c22_e56c_return_output,
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l209_c25_3ac1_return_output);

     -- Submodule level 16
     VAR_result_MUX_uxn_device_h_l201_c3_2947_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_a3ba_uxn_device_h_l201_c3_2947_return_output;
     -- result_MUX[uxn_device_h_l201_c3_2947] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l201_c3_2947_cond <= VAR_result_MUX_uxn_device_h_l201_c3_2947_cond;
     result_MUX_uxn_device_h_l201_c3_2947_iftrue <= VAR_result_MUX_uxn_device_h_l201_c3_2947_iftrue;
     result_MUX_uxn_device_h_l201_c3_2947_iffalse <= VAR_result_MUX_uxn_device_h_l201_c3_2947_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l201_c3_2947_return_output := result_MUX_uxn_device_h_l201_c3_2947_return_output;

     -- Submodule level 17
     VAR_result_MUX_uxn_device_h_l191_c7_cd63_iffalse := VAR_result_MUX_uxn_device_h_l201_c3_2947_return_output;
     -- result_MUX[uxn_device_h_l191_c7_cd63] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l191_c7_cd63_cond <= VAR_result_MUX_uxn_device_h_l191_c7_cd63_cond;
     result_MUX_uxn_device_h_l191_c7_cd63_iftrue <= VAR_result_MUX_uxn_device_h_l191_c7_cd63_iftrue;
     result_MUX_uxn_device_h_l191_c7_cd63_iffalse <= VAR_result_MUX_uxn_device_h_l191_c7_cd63_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l191_c7_cd63_return_output := result_MUX_uxn_device_h_l191_c7_cd63_return_output;

     -- Submodule level 18
     VAR_result_MUX_uxn_device_h_l179_c7_8b67_iffalse := VAR_result_MUX_uxn_device_h_l191_c7_cd63_return_output;
     -- result_MUX[uxn_device_h_l179_c7_8b67] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l179_c7_8b67_cond <= VAR_result_MUX_uxn_device_h_l179_c7_8b67_cond;
     result_MUX_uxn_device_h_l179_c7_8b67_iftrue <= VAR_result_MUX_uxn_device_h_l179_c7_8b67_iftrue;
     result_MUX_uxn_device_h_l179_c7_8b67_iffalse <= VAR_result_MUX_uxn_device_h_l179_c7_8b67_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l179_c7_8b67_return_output := result_MUX_uxn_device_h_l179_c7_8b67_return_output;

     -- Submodule level 19
     VAR_result_MUX_uxn_device_h_l166_c7_2eca_iffalse := VAR_result_MUX_uxn_device_h_l179_c7_8b67_return_output;
     -- result_MUX[uxn_device_h_l166_c7_2eca] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l166_c7_2eca_cond <= VAR_result_MUX_uxn_device_h_l166_c7_2eca_cond;
     result_MUX_uxn_device_h_l166_c7_2eca_iftrue <= VAR_result_MUX_uxn_device_h_l166_c7_2eca_iftrue;
     result_MUX_uxn_device_h_l166_c7_2eca_iffalse <= VAR_result_MUX_uxn_device_h_l166_c7_2eca_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l166_c7_2eca_return_output := result_MUX_uxn_device_h_l166_c7_2eca_return_output;

     -- Submodule level 20
     VAR_result_MUX_uxn_device_h_l148_c7_1e53_iffalse := VAR_result_MUX_uxn_device_h_l166_c7_2eca_return_output;
     -- result_MUX[uxn_device_h_l148_c7_1e53] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l148_c7_1e53_cond <= VAR_result_MUX_uxn_device_h_l148_c7_1e53_cond;
     result_MUX_uxn_device_h_l148_c7_1e53_iftrue <= VAR_result_MUX_uxn_device_h_l148_c7_1e53_iftrue;
     result_MUX_uxn_device_h_l148_c7_1e53_iffalse <= VAR_result_MUX_uxn_device_h_l148_c7_1e53_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l148_c7_1e53_return_output := result_MUX_uxn_device_h_l148_c7_1e53_return_output;

     -- Submodule level 21
     VAR_result_MUX_uxn_device_h_l127_c7_6d1f_iffalse := VAR_result_MUX_uxn_device_h_l148_c7_1e53_return_output;
     -- result_MUX[uxn_device_h_l127_c7_6d1f] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l127_c7_6d1f_cond <= VAR_result_MUX_uxn_device_h_l127_c7_6d1f_cond;
     result_MUX_uxn_device_h_l127_c7_6d1f_iftrue <= VAR_result_MUX_uxn_device_h_l127_c7_6d1f_iftrue;
     result_MUX_uxn_device_h_l127_c7_6d1f_iffalse <= VAR_result_MUX_uxn_device_h_l127_c7_6d1f_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l127_c7_6d1f_return_output := result_MUX_uxn_device_h_l127_c7_6d1f_return_output;

     -- Submodule level 22
     VAR_result_MUX_uxn_device_h_l122_c7_9b61_iffalse := VAR_result_MUX_uxn_device_h_l127_c7_6d1f_return_output;
     -- result_MUX[uxn_device_h_l122_c7_9b61] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l122_c7_9b61_cond <= VAR_result_MUX_uxn_device_h_l122_c7_9b61_cond;
     result_MUX_uxn_device_h_l122_c7_9b61_iftrue <= VAR_result_MUX_uxn_device_h_l122_c7_9b61_iftrue;
     result_MUX_uxn_device_h_l122_c7_9b61_iffalse <= VAR_result_MUX_uxn_device_h_l122_c7_9b61_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l122_c7_9b61_return_output := result_MUX_uxn_device_h_l122_c7_9b61_return_output;

     -- Submodule level 23
     VAR_result_MUX_uxn_device_h_l118_c7_7b60_iffalse := VAR_result_MUX_uxn_device_h_l122_c7_9b61_return_output;
     -- result_MUX[uxn_device_h_l118_c7_7b60] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l118_c7_7b60_cond <= VAR_result_MUX_uxn_device_h_l118_c7_7b60_cond;
     result_MUX_uxn_device_h_l118_c7_7b60_iftrue <= VAR_result_MUX_uxn_device_h_l118_c7_7b60_iftrue;
     result_MUX_uxn_device_h_l118_c7_7b60_iffalse <= VAR_result_MUX_uxn_device_h_l118_c7_7b60_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l118_c7_7b60_return_output := result_MUX_uxn_device_h_l118_c7_7b60_return_output;

     -- Submodule level 24
     VAR_result_MUX_uxn_device_h_l113_c7_7203_iffalse := VAR_result_MUX_uxn_device_h_l118_c7_7b60_return_output;
     -- result_MUX[uxn_device_h_l113_c7_7203] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l113_c7_7203_cond <= VAR_result_MUX_uxn_device_h_l113_c7_7203_cond;
     result_MUX_uxn_device_h_l113_c7_7203_iftrue <= VAR_result_MUX_uxn_device_h_l113_c7_7203_iftrue;
     result_MUX_uxn_device_h_l113_c7_7203_iffalse <= VAR_result_MUX_uxn_device_h_l113_c7_7203_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l113_c7_7203_return_output := result_MUX_uxn_device_h_l113_c7_7203_return_output;

     -- Submodule level 25
     VAR_result_MUX_uxn_device_h_l104_c7_6998_iffalse := VAR_result_MUX_uxn_device_h_l113_c7_7203_return_output;
     -- result_MUX[uxn_device_h_l104_c7_6998] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l104_c7_6998_cond <= VAR_result_MUX_uxn_device_h_l104_c7_6998_cond;
     result_MUX_uxn_device_h_l104_c7_6998_iftrue <= VAR_result_MUX_uxn_device_h_l104_c7_6998_iftrue;
     result_MUX_uxn_device_h_l104_c7_6998_iffalse <= VAR_result_MUX_uxn_device_h_l104_c7_6998_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l104_c7_6998_return_output := result_MUX_uxn_device_h_l104_c7_6998_return_output;

     -- Submodule level 26
     VAR_result_MUX_uxn_device_h_l101_c7_ddd9_iffalse := VAR_result_MUX_uxn_device_h_l104_c7_6998_return_output;
     -- result_MUX[uxn_device_h_l101_c7_ddd9] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l101_c7_ddd9_cond <= VAR_result_MUX_uxn_device_h_l101_c7_ddd9_cond;
     result_MUX_uxn_device_h_l101_c7_ddd9_iftrue <= VAR_result_MUX_uxn_device_h_l101_c7_ddd9_iftrue;
     result_MUX_uxn_device_h_l101_c7_ddd9_iffalse <= VAR_result_MUX_uxn_device_h_l101_c7_ddd9_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l101_c7_ddd9_return_output := result_MUX_uxn_device_h_l101_c7_ddd9_return_output;

     -- Submodule level 27
     VAR_result_MUX_uxn_device_h_l88_c2_7de5_iffalse := VAR_result_MUX_uxn_device_h_l101_c7_ddd9_return_output;
     -- result_MUX[uxn_device_h_l88_c2_7de5] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l88_c2_7de5_cond <= VAR_result_MUX_uxn_device_h_l88_c2_7de5_cond;
     result_MUX_uxn_device_h_l88_c2_7de5_iftrue <= VAR_result_MUX_uxn_device_h_l88_c2_7de5_iftrue;
     result_MUX_uxn_device_h_l88_c2_7de5_iffalse <= VAR_result_MUX_uxn_device_h_l88_c2_7de5_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l88_c2_7de5_return_output := result_MUX_uxn_device_h_l88_c2_7de5_return_output;

     -- Submodule level 28
     REG_VAR_result := VAR_result_MUX_uxn_device_h_l88_c2_7de5_return_output;
     VAR_return_output := VAR_result_MUX_uxn_device_h_l88_c2_7de5_return_output;
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
