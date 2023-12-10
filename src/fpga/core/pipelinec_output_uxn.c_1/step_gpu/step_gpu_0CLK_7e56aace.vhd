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
-- Submodules: 67
entity step_gpu_0CLK_7e56aace is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 is_active_drawing_area : in unsigned(0 downto 0);
 is_vram_write : in unsigned(0 downto 0);
 vram_write_layer : in unsigned(0 downto 0);
 vram_address : in unsigned(15 downto 0);
 vram_value : in unsigned(7 downto 0);
 return_output : out gpu_step_result_t);
end step_gpu_0CLK_7e56aace;
architecture arch of step_gpu_0CLK_7e56aace is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal result : gpu_step_result_t := (
color => to_unsigned(0, 2),
is_active_fill => to_unsigned(0, 1),
is_new_frame => to_unsigned(0, 1))
;
signal adjusted_vram_address : unsigned(15 downto 0) := to_unsigned(0, 16);
signal fill_pixels_remaining : unsigned(15 downto 0) := to_unsigned(0, 16);
signal fill_x0 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal fill_y0 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal fill_x1 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal fill_y1 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal fill_color : unsigned(1 downto 0) := to_unsigned(0, 2);
signal is_fill_active : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_fill_left : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_fill_top : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_fill_pixel0 : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_fill_pixel1 : unsigned(0 downto 0) := to_unsigned(0, 1);
signal fill_layer : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_fill_code : unsigned(0 downto 0) := to_unsigned(0, 1);
signal fg_pixel_color : unsigned(1 downto 0) := to_unsigned(0, 2);
signal bg_pixel_color : unsigned(1 downto 0) := to_unsigned(0, 2);
signal pixel_counter : unsigned(15 downto 0) := to_unsigned(0, 16);
signal x : unsigned(15 downto 0) := to_unsigned(0, 16);
signal y : unsigned(15 downto 0) := to_unsigned(0, 16);
signal REG_COMB_result : gpu_step_result_t;
signal REG_COMB_adjusted_vram_address : unsigned(15 downto 0);
signal REG_COMB_fill_pixels_remaining : unsigned(15 downto 0);
signal REG_COMB_fill_x0 : unsigned(15 downto 0);
signal REG_COMB_fill_y0 : unsigned(15 downto 0);
signal REG_COMB_fill_x1 : unsigned(15 downto 0);
signal REG_COMB_fill_y1 : unsigned(15 downto 0);
signal REG_COMB_fill_color : unsigned(1 downto 0);
signal REG_COMB_is_fill_active : unsigned(0 downto 0);
signal REG_COMB_is_fill_left : unsigned(0 downto 0);
signal REG_COMB_is_fill_top : unsigned(0 downto 0);
signal REG_COMB_is_fill_pixel0 : unsigned(0 downto 0);
signal REG_COMB_is_fill_pixel1 : unsigned(0 downto 0);
signal REG_COMB_fill_layer : unsigned(0 downto 0);
signal REG_COMB_is_fill_code : unsigned(0 downto 0);
signal REG_COMB_fg_pixel_color : unsigned(1 downto 0);
signal REG_COMB_bg_pixel_color : unsigned(1 downto 0);
signal REG_COMB_pixel_counter : unsigned(15 downto 0);
signal REG_COMB_x : unsigned(15 downto 0);
signal REG_COMB_y : unsigned(15 downto 0);

-- Each function instance gets signals
-- CONST_SR_4[uxn_c_l129_c44_8b18]
signal CONST_SR_4_uxn_c_l129_c44_8b18_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_c_l129_c44_8b18_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_c_l129_c17_c3d1]
signal BIN_OP_AND_uxn_c_l129_c17_c3d1_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l129_c17_c3d1_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l129_c17_c3d1_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_c_l132_c22_cdaa]
signal UNARY_OP_NOT_uxn_c_l132_c22_cdaa_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l132_c22_cdaa_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l132_c6_566b]
signal BIN_OP_AND_uxn_c_l132_c6_566b_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l132_c6_566b_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l132_c6_566b_return_output : unsigned(0 downto 0);

-- is_fill_top_MUX[uxn_c_l132_c2_d7c9]
signal is_fill_top_MUX_uxn_c_l132_c2_d7c9_cond : unsigned(0 downto 0);
signal is_fill_top_MUX_uxn_c_l132_c2_d7c9_iftrue : unsigned(0 downto 0);
signal is_fill_top_MUX_uxn_c_l132_c2_d7c9_iffalse : unsigned(0 downto 0);
signal is_fill_top_MUX_uxn_c_l132_c2_d7c9_return_output : unsigned(0 downto 0);

-- fill_y0_MUX[uxn_c_l132_c2_d7c9]
signal fill_y0_MUX_uxn_c_l132_c2_d7c9_cond : unsigned(0 downto 0);
signal fill_y0_MUX_uxn_c_l132_c2_d7c9_iftrue : unsigned(15 downto 0);
signal fill_y0_MUX_uxn_c_l132_c2_d7c9_iffalse : unsigned(15 downto 0);
signal fill_y0_MUX_uxn_c_l132_c2_d7c9_return_output : unsigned(15 downto 0);

-- fill_x1_MUX[uxn_c_l132_c2_d7c9]
signal fill_x1_MUX_uxn_c_l132_c2_d7c9_cond : unsigned(0 downto 0);
signal fill_x1_MUX_uxn_c_l132_c2_d7c9_iftrue : unsigned(15 downto 0);
signal fill_x1_MUX_uxn_c_l132_c2_d7c9_iffalse : unsigned(15 downto 0);
signal fill_x1_MUX_uxn_c_l132_c2_d7c9_return_output : unsigned(15 downto 0);

-- fill_color_MUX[uxn_c_l132_c2_d7c9]
signal fill_color_MUX_uxn_c_l132_c2_d7c9_cond : unsigned(0 downto 0);
signal fill_color_MUX_uxn_c_l132_c2_d7c9_iftrue : unsigned(1 downto 0);
signal fill_color_MUX_uxn_c_l132_c2_d7c9_iffalse : unsigned(1 downto 0);
signal fill_color_MUX_uxn_c_l132_c2_d7c9_return_output : unsigned(1 downto 0);

-- y_MUX[uxn_c_l132_c2_d7c9]
signal y_MUX_uxn_c_l132_c2_d7c9_cond : unsigned(0 downto 0);
signal y_MUX_uxn_c_l132_c2_d7c9_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_c_l132_c2_d7c9_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_c_l132_c2_d7c9_return_output : unsigned(15 downto 0);

-- fill_x0_MUX[uxn_c_l132_c2_d7c9]
signal fill_x0_MUX_uxn_c_l132_c2_d7c9_cond : unsigned(0 downto 0);
signal fill_x0_MUX_uxn_c_l132_c2_d7c9_iftrue : unsigned(15 downto 0);
signal fill_x0_MUX_uxn_c_l132_c2_d7c9_iffalse : unsigned(15 downto 0);
signal fill_x0_MUX_uxn_c_l132_c2_d7c9_return_output : unsigned(15 downto 0);

-- is_fill_active_MUX[uxn_c_l132_c2_d7c9]
signal is_fill_active_MUX_uxn_c_l132_c2_d7c9_cond : unsigned(0 downto 0);
signal is_fill_active_MUX_uxn_c_l132_c2_d7c9_iftrue : unsigned(0 downto 0);
signal is_fill_active_MUX_uxn_c_l132_c2_d7c9_iffalse : unsigned(0 downto 0);
signal is_fill_active_MUX_uxn_c_l132_c2_d7c9_return_output : unsigned(0 downto 0);

-- fill_y1_MUX[uxn_c_l132_c2_d7c9]
signal fill_y1_MUX_uxn_c_l132_c2_d7c9_cond : unsigned(0 downto 0);
signal fill_y1_MUX_uxn_c_l132_c2_d7c9_iftrue : unsigned(15 downto 0);
signal fill_y1_MUX_uxn_c_l132_c2_d7c9_iffalse : unsigned(15 downto 0);
signal fill_y1_MUX_uxn_c_l132_c2_d7c9_return_output : unsigned(15 downto 0);

-- fill_layer_MUX[uxn_c_l132_c2_d7c9]
signal fill_layer_MUX_uxn_c_l132_c2_d7c9_cond : unsigned(0 downto 0);
signal fill_layer_MUX_uxn_c_l132_c2_d7c9_iftrue : unsigned(0 downto 0);
signal fill_layer_MUX_uxn_c_l132_c2_d7c9_iffalse : unsigned(0 downto 0);
signal fill_layer_MUX_uxn_c_l132_c2_d7c9_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_c_l132_c2_d7c9]
signal x_MUX_uxn_c_l132_c2_d7c9_cond : unsigned(0 downto 0);
signal x_MUX_uxn_c_l132_c2_d7c9_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_c_l132_c2_d7c9_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_c_l132_c2_d7c9_return_output : unsigned(15 downto 0);

-- fill_pixels_remaining_MUX[uxn_c_l132_c2_d7c9]
signal fill_pixels_remaining_MUX_uxn_c_l132_c2_d7c9_cond : unsigned(0 downto 0);
signal fill_pixels_remaining_MUX_uxn_c_l132_c2_d7c9_iftrue : unsigned(15 downto 0);
signal fill_pixels_remaining_MUX_uxn_c_l132_c2_d7c9_iffalse : unsigned(15 downto 0);
signal fill_pixels_remaining_MUX_uxn_c_l132_c2_d7c9_return_output : unsigned(15 downto 0);

-- CONST_SR_2[uxn_c_l134_c17_140c]
signal CONST_SR_2_uxn_c_l134_c17_140c_x : unsigned(7 downto 0);
signal CONST_SR_2_uxn_c_l134_c17_140c_return_output : unsigned(7 downto 0);

-- CONST_SR_3[uxn_c_l135_c18_56c2]
signal CONST_SR_3_uxn_c_l135_c18_56c2_x : unsigned(7 downto 0);
signal CONST_SR_3_uxn_c_l135_c18_56c2_return_output : unsigned(7 downto 0);

-- BIN_OP_DIV[uxn_c_l136_c13_e21d]
signal BIN_OP_DIV_uxn_c_l136_c13_e21d_left : unsigned(15 downto 0);
signal BIN_OP_DIV_uxn_c_l136_c13_e21d_right : unsigned(8 downto 0);
signal BIN_OP_DIV_uxn_c_l136_c13_e21d_return_output : unsigned(15 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_c_l137_c29_ee31]
signal BIN_OP_INFERRED_MULT_uxn_c_l137_c29_ee31_left : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_c_l137_c29_ee31_right : unsigned(8 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_c_l137_c29_ee31_return_output : unsigned(24 downto 0);

-- BIN_OP_MINUS[uxn_c_l137_c13_092b]
signal BIN_OP_MINUS_uxn_c_l137_c13_092b_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_c_l137_c13_092b_right : unsigned(24 downto 0);
signal BIN_OP_MINUS_uxn_c_l137_c13_092b_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l138_c13_f424]
signal MUX_uxn_c_l138_c13_f424_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l138_c13_f424_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l138_c13_f424_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l138_c13_f424_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l139_c13_32a9]
signal MUX_uxn_c_l139_c13_32a9_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l139_c13_32a9_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l139_c13_32a9_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l139_c13_32a9_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l140_c13_4af7]
signal MUX_uxn_c_l140_c13_4af7_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l140_c13_4af7_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l140_c13_4af7_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l140_c13_4af7_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l141_c13_8fc9]
signal MUX_uxn_c_l141_c13_8fc9_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l141_c13_8fc9_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l141_c13_8fc9_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l141_c13_8fc9_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_c_l144_c28_080d]
signal BIN_OP_MINUS_uxn_c_l144_c28_080d_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_c_l144_c28_080d_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_c_l144_c28_080d_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_c_l144_c28_0745]
signal BIN_OP_PLUS_uxn_c_l144_c28_0745_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l144_c28_0745_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l144_c28_0745_return_output : unsigned(16 downto 0);

-- BIN_OP_MINUS[uxn_c_l144_c54_f366]
signal BIN_OP_MINUS_uxn_c_l144_c54_f366_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_c_l144_c54_f366_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_c_l144_c54_f366_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_c_l144_c54_fabc]
signal BIN_OP_PLUS_uxn_c_l144_c54_fabc_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l144_c54_fabc_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l144_c54_fabc_return_output : unsigned(16 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_c_l144_c28_7c6d]
signal BIN_OP_INFERRED_MULT_uxn_c_l144_c28_7c6d_left : unsigned(16 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_c_l144_c28_7c6d_right : unsigned(16 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_c_l144_c28_7c6d_return_output : unsigned(33 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_c_l152_c45_9a0b]
signal BIN_OP_INFERRED_MULT_uxn_c_l152_c45_9a0b_left : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_c_l152_c45_9a0b_right : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_c_l152_c45_9a0b_return_output : unsigned(31 downto 0);

-- BIN_OP_PLUS[uxn_c_l152_c45_12f1]
signal BIN_OP_PLUS_uxn_c_l152_c45_12f1_left : unsigned(31 downto 0);
signal BIN_OP_PLUS_uxn_c_l152_c45_12f1_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l152_c45_12f1_return_output : unsigned(32 downto 0);

-- MUX[uxn_c_l152_c26_06b8]
signal MUX_uxn_c_l152_c26_06b8_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l152_c26_06b8_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l152_c26_06b8_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l152_c26_06b8_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l154_c18_c2bd]
signal BIN_OP_EQ_uxn_c_l154_c18_c2bd_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l154_c18_c2bd_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l154_c18_c2bd_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l154_c18_f71d]
signal MUX_uxn_c_l154_c18_f71d_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l154_c18_f71d_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l154_c18_f71d_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l154_c18_f71d_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l155_c22_a54e]
signal BIN_OP_PLUS_uxn_c_l155_c22_a54e_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l155_c22_a54e_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l155_c22_a54e_return_output : unsigned(16 downto 0);

-- MUX[uxn_c_l155_c6_0188]
signal MUX_uxn_c_l155_c6_0188_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l155_c6_0188_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l155_c6_0188_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l155_c6_0188_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_c_l156_c31_3d3e]
signal BIN_OP_PLUS_uxn_c_l156_c31_3d3e_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l156_c31_3d3e_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l156_c31_3d3e_return_output : unsigned(16 downto 0);

-- MUX[uxn_c_l156_c6_1c0b]
signal MUX_uxn_c_l156_c6_1c0b_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l156_c6_1c0b_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l156_c6_1c0b_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l156_c6_1c0b_return_output : unsigned(15 downto 0);

-- UNARY_OP_NOT[uxn_c_l158_c38_d02b]
signal UNARY_OP_NOT_uxn_c_l158_c38_d02b_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l158_c38_d02b_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l158_c19_d071]
signal BIN_OP_AND_uxn_c_l158_c19_d071_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l158_c19_d071_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l158_c19_d071_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l159_c19_f461]
signal BIN_OP_AND_uxn_c_l159_c19_f461_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l159_c19_f461_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l159_c19_f461_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l164_c3_b13c]
signal MUX_uxn_c_l164_c3_b13c_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l164_c3_b13c_iftrue : unsigned(1 downto 0);
signal MUX_uxn_c_l164_c3_b13c_iffalse : unsigned(1 downto 0);
signal MUX_uxn_c_l164_c3_b13c_return_output : unsigned(1 downto 0);

-- UNARY_OP_NOT[uxn_c_l165_c57_69cc]
signal UNARY_OP_NOT_uxn_c_l165_c57_69cc_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l165_c57_69cc_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l165_c22_1c1b]
signal BIN_OP_AND_uxn_c_l165_c22_1c1b_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l165_c22_1c1b_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l165_c22_1c1b_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_c_l165_c3_be18]
signal BIN_OP_OR_uxn_c_l165_c3_be18_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l165_c3_be18_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l165_c3_be18_return_output : unsigned(0 downto 0);

-- bg_vram_update[uxn_c_l161_c19_ec32]
signal bg_vram_update_uxn_c_l161_c19_ec32_CLOCK_ENABLE : unsigned(0 downto 0);
signal bg_vram_update_uxn_c_l161_c19_ec32_read_address : unsigned(15 downto 0);
signal bg_vram_update_uxn_c_l161_c19_ec32_write_address : unsigned(15 downto 0);
signal bg_vram_update_uxn_c_l161_c19_ec32_write_value : unsigned(1 downto 0);
signal bg_vram_update_uxn_c_l161_c19_ec32_write_enable : unsigned(0 downto 0);
signal bg_vram_update_uxn_c_l161_c19_ec32_return_output : unsigned(1 downto 0);

-- MUX[uxn_c_l171_c3_769b]
signal MUX_uxn_c_l171_c3_769b_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l171_c3_769b_iftrue : unsigned(1 downto 0);
signal MUX_uxn_c_l171_c3_769b_iffalse : unsigned(1 downto 0);
signal MUX_uxn_c_l171_c3_769b_return_output : unsigned(1 downto 0);

-- BIN_OP_AND[uxn_c_l172_c22_0c76]
signal BIN_OP_AND_uxn_c_l172_c22_0c76_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l172_c22_0c76_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l172_c22_0c76_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_c_l172_c3_6336]
signal BIN_OP_OR_uxn_c_l172_c3_6336_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l172_c3_6336_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l172_c3_6336_return_output : unsigned(0 downto 0);

-- fg_vram_update[uxn_c_l168_c19_3773]
signal fg_vram_update_uxn_c_l168_c19_3773_CLOCK_ENABLE : unsigned(0 downto 0);
signal fg_vram_update_uxn_c_l168_c19_3773_read_address : unsigned(15 downto 0);
signal fg_vram_update_uxn_c_l168_c19_3773_write_address : unsigned(15 downto 0);
signal fg_vram_update_uxn_c_l168_c19_3773_write_value : unsigned(1 downto 0);
signal fg_vram_update_uxn_c_l168_c19_3773_write_enable : unsigned(0 downto 0);
signal fg_vram_update_uxn_c_l168_c19_3773_return_output : unsigned(1 downto 0);

-- BIN_OP_MINUS[uxn_c_l175_c43_a106]
signal BIN_OP_MINUS_uxn_c_l175_c43_a106_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_c_l175_c43_a106_right : unsigned(0 downto 0);
signal BIN_OP_MINUS_uxn_c_l175_c43_a106_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l175_c26_3d49]
signal MUX_uxn_c_l175_c26_3d49_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l175_c26_3d49_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l175_c26_3d49_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l175_c26_3d49_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l176_c19_a706]
signal BIN_OP_EQ_uxn_c_l176_c19_a706_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l176_c19_a706_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l176_c19_a706_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l176_c19_b09d]
signal MUX_uxn_c_l176_c19_b09d_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l176_c19_b09d_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l176_c19_b09d_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l176_c19_b09d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l177_c19_a937]
signal BIN_OP_EQ_uxn_c_l177_c19_a937_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l177_c19_a937_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l177_c19_a937_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l177_c76_cb16]
signal BIN_OP_PLUS_uxn_c_l177_c76_cb16_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l177_c76_cb16_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l177_c76_cb16_return_output : unsigned(16 downto 0);

-- MUX[uxn_c_l177_c50_158b]
signal MUX_uxn_c_l177_c50_158b_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l177_c50_158b_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l177_c50_158b_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l177_c50_158b_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l177_c19_3daa]
signal MUX_uxn_c_l177_c19_3daa_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l177_c19_3daa_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l177_c19_3daa_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l177_c19_3daa_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l178_c25_2f7a]
signal BIN_OP_EQ_uxn_c_l178_c25_2f7a_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l178_c25_2f7a_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l178_c25_2f7a_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l178_c25_bc61]
signal MUX_uxn_c_l178_c25_bc61_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l178_c25_bc61_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l178_c25_bc61_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l178_c25_bc61_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l179_c17_3f1c]
signal BIN_OP_EQ_uxn_c_l179_c17_3f1c_left : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l179_c17_3f1c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l179_c17_3f1c_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l179_c17_7282]
signal MUX_uxn_c_l179_c17_7282_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l179_c17_7282_iftrue : unsigned(1 downto 0);
signal MUX_uxn_c_l179_c17_7282_iffalse : unsigned(1 downto 0);
signal MUX_uxn_c_l179_c17_7282_return_output : unsigned(1 downto 0);

-- UNARY_OP_NOT_uint1_t_uxn_c_l165_l172_DUPLICATE_a58a
signal UNARY_OP_NOT_uint1_t_uxn_c_l165_l172_DUPLICATE_a58a_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uint1_t_uxn_c_l165_l172_DUPLICATE_a58a_return_output : unsigned(0 downto 0);

-- BIN_OP_AND_uint1_t_uint1_t_uxn_c_l172_l165_DUPLICATE_039f
signal BIN_OP_AND_uint1_t_uint1_t_uxn_c_l172_l165_DUPLICATE_039f_left : unsigned(0 downto 0);
signal BIN_OP_AND_uint1_t_uint1_t_uxn_c_l172_l165_DUPLICATE_039f_right : unsigned(0 downto 0);
signal BIN_OP_AND_uint1_t_uint1_t_uxn_c_l172_l165_DUPLICATE_039f_return_output : unsigned(0 downto 0);

function CAST_TO_uint1_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(0 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,1)));
    return return_output;
end function;

function CAST_TO_uint2_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(1 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,2)));
    return return_output;
end function;

function CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_269d( ref_toks_0 : unsigned;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned) return gpu_step_result_t is
 
  variable base : gpu_step_result_t; 
  variable return_output : gpu_step_result_t;
begin
      base.is_new_frame := ref_toks_0;
      base.color := ref_toks_1;
      base.is_active_fill := ref_toks_2;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- CONST_SR_4_uxn_c_l129_c44_8b18
CONST_SR_4_uxn_c_l129_c44_8b18 : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_c_l129_c44_8b18_x,
CONST_SR_4_uxn_c_l129_c44_8b18_return_output);

-- BIN_OP_AND_uxn_c_l129_c17_c3d1
BIN_OP_AND_uxn_c_l129_c17_c3d1 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l129_c17_c3d1_left,
BIN_OP_AND_uxn_c_l129_c17_c3d1_right,
BIN_OP_AND_uxn_c_l129_c17_c3d1_return_output);

-- UNARY_OP_NOT_uxn_c_l132_c22_cdaa
UNARY_OP_NOT_uxn_c_l132_c22_cdaa : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l132_c22_cdaa_expr,
UNARY_OP_NOT_uxn_c_l132_c22_cdaa_return_output);

-- BIN_OP_AND_uxn_c_l132_c6_566b
BIN_OP_AND_uxn_c_l132_c6_566b : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l132_c6_566b_left,
BIN_OP_AND_uxn_c_l132_c6_566b_right,
BIN_OP_AND_uxn_c_l132_c6_566b_return_output);

-- is_fill_top_MUX_uxn_c_l132_c2_d7c9
is_fill_top_MUX_uxn_c_l132_c2_d7c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_top_MUX_uxn_c_l132_c2_d7c9_cond,
is_fill_top_MUX_uxn_c_l132_c2_d7c9_iftrue,
is_fill_top_MUX_uxn_c_l132_c2_d7c9_iffalse,
is_fill_top_MUX_uxn_c_l132_c2_d7c9_return_output);

-- fill_y0_MUX_uxn_c_l132_c2_d7c9
fill_y0_MUX_uxn_c_l132_c2_d7c9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_y0_MUX_uxn_c_l132_c2_d7c9_cond,
fill_y0_MUX_uxn_c_l132_c2_d7c9_iftrue,
fill_y0_MUX_uxn_c_l132_c2_d7c9_iffalse,
fill_y0_MUX_uxn_c_l132_c2_d7c9_return_output);

-- fill_x1_MUX_uxn_c_l132_c2_d7c9
fill_x1_MUX_uxn_c_l132_c2_d7c9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_x1_MUX_uxn_c_l132_c2_d7c9_cond,
fill_x1_MUX_uxn_c_l132_c2_d7c9_iftrue,
fill_x1_MUX_uxn_c_l132_c2_d7c9_iffalse,
fill_x1_MUX_uxn_c_l132_c2_d7c9_return_output);

-- fill_color_MUX_uxn_c_l132_c2_d7c9
fill_color_MUX_uxn_c_l132_c2_d7c9 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
fill_color_MUX_uxn_c_l132_c2_d7c9_cond,
fill_color_MUX_uxn_c_l132_c2_d7c9_iftrue,
fill_color_MUX_uxn_c_l132_c2_d7c9_iffalse,
fill_color_MUX_uxn_c_l132_c2_d7c9_return_output);

-- y_MUX_uxn_c_l132_c2_d7c9
y_MUX_uxn_c_l132_c2_d7c9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_c_l132_c2_d7c9_cond,
y_MUX_uxn_c_l132_c2_d7c9_iftrue,
y_MUX_uxn_c_l132_c2_d7c9_iffalse,
y_MUX_uxn_c_l132_c2_d7c9_return_output);

-- fill_x0_MUX_uxn_c_l132_c2_d7c9
fill_x0_MUX_uxn_c_l132_c2_d7c9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_x0_MUX_uxn_c_l132_c2_d7c9_cond,
fill_x0_MUX_uxn_c_l132_c2_d7c9_iftrue,
fill_x0_MUX_uxn_c_l132_c2_d7c9_iffalse,
fill_x0_MUX_uxn_c_l132_c2_d7c9_return_output);

-- is_fill_active_MUX_uxn_c_l132_c2_d7c9
is_fill_active_MUX_uxn_c_l132_c2_d7c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_active_MUX_uxn_c_l132_c2_d7c9_cond,
is_fill_active_MUX_uxn_c_l132_c2_d7c9_iftrue,
is_fill_active_MUX_uxn_c_l132_c2_d7c9_iffalse,
is_fill_active_MUX_uxn_c_l132_c2_d7c9_return_output);

-- fill_y1_MUX_uxn_c_l132_c2_d7c9
fill_y1_MUX_uxn_c_l132_c2_d7c9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_y1_MUX_uxn_c_l132_c2_d7c9_cond,
fill_y1_MUX_uxn_c_l132_c2_d7c9_iftrue,
fill_y1_MUX_uxn_c_l132_c2_d7c9_iffalse,
fill_y1_MUX_uxn_c_l132_c2_d7c9_return_output);

-- fill_layer_MUX_uxn_c_l132_c2_d7c9
fill_layer_MUX_uxn_c_l132_c2_d7c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
fill_layer_MUX_uxn_c_l132_c2_d7c9_cond,
fill_layer_MUX_uxn_c_l132_c2_d7c9_iftrue,
fill_layer_MUX_uxn_c_l132_c2_d7c9_iffalse,
fill_layer_MUX_uxn_c_l132_c2_d7c9_return_output);

-- x_MUX_uxn_c_l132_c2_d7c9
x_MUX_uxn_c_l132_c2_d7c9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_c_l132_c2_d7c9_cond,
x_MUX_uxn_c_l132_c2_d7c9_iftrue,
x_MUX_uxn_c_l132_c2_d7c9_iffalse,
x_MUX_uxn_c_l132_c2_d7c9_return_output);

-- fill_pixels_remaining_MUX_uxn_c_l132_c2_d7c9
fill_pixels_remaining_MUX_uxn_c_l132_c2_d7c9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_pixels_remaining_MUX_uxn_c_l132_c2_d7c9_cond,
fill_pixels_remaining_MUX_uxn_c_l132_c2_d7c9_iftrue,
fill_pixels_remaining_MUX_uxn_c_l132_c2_d7c9_iffalse,
fill_pixels_remaining_MUX_uxn_c_l132_c2_d7c9_return_output);

-- CONST_SR_2_uxn_c_l134_c17_140c
CONST_SR_2_uxn_c_l134_c17_140c : entity work.CONST_SR_2_uint8_t_0CLK_de264c78 port map (
CONST_SR_2_uxn_c_l134_c17_140c_x,
CONST_SR_2_uxn_c_l134_c17_140c_return_output);

-- CONST_SR_3_uxn_c_l135_c18_56c2
CONST_SR_3_uxn_c_l135_c18_56c2 : entity work.CONST_SR_3_uint8_t_0CLK_de264c78 port map (
CONST_SR_3_uxn_c_l135_c18_56c2_x,
CONST_SR_3_uxn_c_l135_c18_56c2_return_output);

-- BIN_OP_DIV_uxn_c_l136_c13_e21d
BIN_OP_DIV_uxn_c_l136_c13_e21d : entity work.BIN_OP_DIV_uint16_t_uint9_t_0CLK_2b0015ee port map (
BIN_OP_DIV_uxn_c_l136_c13_e21d_left,
BIN_OP_DIV_uxn_c_l136_c13_e21d_right,
BIN_OP_DIV_uxn_c_l136_c13_e21d_return_output);

-- BIN_OP_INFERRED_MULT_uxn_c_l137_c29_ee31
BIN_OP_INFERRED_MULT_uxn_c_l137_c29_ee31 : entity work.BIN_OP_INFERRED_MULT_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_c_l137_c29_ee31_left,
BIN_OP_INFERRED_MULT_uxn_c_l137_c29_ee31_right,
BIN_OP_INFERRED_MULT_uxn_c_l137_c29_ee31_return_output);

-- BIN_OP_MINUS_uxn_c_l137_c13_092b
BIN_OP_MINUS_uxn_c_l137_c13_092b : entity work.BIN_OP_MINUS_uint16_t_uint25_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l137_c13_092b_left,
BIN_OP_MINUS_uxn_c_l137_c13_092b_right,
BIN_OP_MINUS_uxn_c_l137_c13_092b_return_output);

-- MUX_uxn_c_l138_c13_f424
MUX_uxn_c_l138_c13_f424 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l138_c13_f424_cond,
MUX_uxn_c_l138_c13_f424_iftrue,
MUX_uxn_c_l138_c13_f424_iffalse,
MUX_uxn_c_l138_c13_f424_return_output);

-- MUX_uxn_c_l139_c13_32a9
MUX_uxn_c_l139_c13_32a9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l139_c13_32a9_cond,
MUX_uxn_c_l139_c13_32a9_iftrue,
MUX_uxn_c_l139_c13_32a9_iffalse,
MUX_uxn_c_l139_c13_32a9_return_output);

-- MUX_uxn_c_l140_c13_4af7
MUX_uxn_c_l140_c13_4af7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l140_c13_4af7_cond,
MUX_uxn_c_l140_c13_4af7_iftrue,
MUX_uxn_c_l140_c13_4af7_iffalse,
MUX_uxn_c_l140_c13_4af7_return_output);

-- MUX_uxn_c_l141_c13_8fc9
MUX_uxn_c_l141_c13_8fc9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l141_c13_8fc9_cond,
MUX_uxn_c_l141_c13_8fc9_iftrue,
MUX_uxn_c_l141_c13_8fc9_iffalse,
MUX_uxn_c_l141_c13_8fc9_return_output);

-- BIN_OP_MINUS_uxn_c_l144_c28_080d
BIN_OP_MINUS_uxn_c_l144_c28_080d : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l144_c28_080d_left,
BIN_OP_MINUS_uxn_c_l144_c28_080d_right,
BIN_OP_MINUS_uxn_c_l144_c28_080d_return_output);

-- BIN_OP_PLUS_uxn_c_l144_c28_0745
BIN_OP_PLUS_uxn_c_l144_c28_0745 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l144_c28_0745_left,
BIN_OP_PLUS_uxn_c_l144_c28_0745_right,
BIN_OP_PLUS_uxn_c_l144_c28_0745_return_output);

-- BIN_OP_MINUS_uxn_c_l144_c54_f366
BIN_OP_MINUS_uxn_c_l144_c54_f366 : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l144_c54_f366_left,
BIN_OP_MINUS_uxn_c_l144_c54_f366_right,
BIN_OP_MINUS_uxn_c_l144_c54_f366_return_output);

-- BIN_OP_PLUS_uxn_c_l144_c54_fabc
BIN_OP_PLUS_uxn_c_l144_c54_fabc : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l144_c54_fabc_left,
BIN_OP_PLUS_uxn_c_l144_c54_fabc_right,
BIN_OP_PLUS_uxn_c_l144_c54_fabc_return_output);

-- BIN_OP_INFERRED_MULT_uxn_c_l144_c28_7c6d
BIN_OP_INFERRED_MULT_uxn_c_l144_c28_7c6d : entity work.BIN_OP_INFERRED_MULT_uint17_t_uint17_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_c_l144_c28_7c6d_left,
BIN_OP_INFERRED_MULT_uxn_c_l144_c28_7c6d_right,
BIN_OP_INFERRED_MULT_uxn_c_l144_c28_7c6d_return_output);

-- BIN_OP_INFERRED_MULT_uxn_c_l152_c45_9a0b
BIN_OP_INFERRED_MULT_uxn_c_l152_c45_9a0b : entity work.BIN_OP_INFERRED_MULT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_c_l152_c45_9a0b_left,
BIN_OP_INFERRED_MULT_uxn_c_l152_c45_9a0b_right,
BIN_OP_INFERRED_MULT_uxn_c_l152_c45_9a0b_return_output);

-- BIN_OP_PLUS_uxn_c_l152_c45_12f1
BIN_OP_PLUS_uxn_c_l152_c45_12f1 : entity work.BIN_OP_PLUS_uint32_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l152_c45_12f1_left,
BIN_OP_PLUS_uxn_c_l152_c45_12f1_right,
BIN_OP_PLUS_uxn_c_l152_c45_12f1_return_output);

-- MUX_uxn_c_l152_c26_06b8
MUX_uxn_c_l152_c26_06b8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l152_c26_06b8_cond,
MUX_uxn_c_l152_c26_06b8_iftrue,
MUX_uxn_c_l152_c26_06b8_iffalse,
MUX_uxn_c_l152_c26_06b8_return_output);

-- BIN_OP_EQ_uxn_c_l154_c18_c2bd
BIN_OP_EQ_uxn_c_l154_c18_c2bd : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l154_c18_c2bd_left,
BIN_OP_EQ_uxn_c_l154_c18_c2bd_right,
BIN_OP_EQ_uxn_c_l154_c18_c2bd_return_output);

-- MUX_uxn_c_l154_c18_f71d
MUX_uxn_c_l154_c18_f71d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l154_c18_f71d_cond,
MUX_uxn_c_l154_c18_f71d_iftrue,
MUX_uxn_c_l154_c18_f71d_iffalse,
MUX_uxn_c_l154_c18_f71d_return_output);

-- BIN_OP_PLUS_uxn_c_l155_c22_a54e
BIN_OP_PLUS_uxn_c_l155_c22_a54e : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l155_c22_a54e_left,
BIN_OP_PLUS_uxn_c_l155_c22_a54e_right,
BIN_OP_PLUS_uxn_c_l155_c22_a54e_return_output);

-- MUX_uxn_c_l155_c6_0188
MUX_uxn_c_l155_c6_0188 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l155_c6_0188_cond,
MUX_uxn_c_l155_c6_0188_iftrue,
MUX_uxn_c_l155_c6_0188_iffalse,
MUX_uxn_c_l155_c6_0188_return_output);

-- BIN_OP_PLUS_uxn_c_l156_c31_3d3e
BIN_OP_PLUS_uxn_c_l156_c31_3d3e : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l156_c31_3d3e_left,
BIN_OP_PLUS_uxn_c_l156_c31_3d3e_right,
BIN_OP_PLUS_uxn_c_l156_c31_3d3e_return_output);

-- MUX_uxn_c_l156_c6_1c0b
MUX_uxn_c_l156_c6_1c0b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l156_c6_1c0b_cond,
MUX_uxn_c_l156_c6_1c0b_iftrue,
MUX_uxn_c_l156_c6_1c0b_iffalse,
MUX_uxn_c_l156_c6_1c0b_return_output);

-- UNARY_OP_NOT_uxn_c_l158_c38_d02b
UNARY_OP_NOT_uxn_c_l158_c38_d02b : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l158_c38_d02b_expr,
UNARY_OP_NOT_uxn_c_l158_c38_d02b_return_output);

-- BIN_OP_AND_uxn_c_l158_c19_d071
BIN_OP_AND_uxn_c_l158_c19_d071 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l158_c19_d071_left,
BIN_OP_AND_uxn_c_l158_c19_d071_right,
BIN_OP_AND_uxn_c_l158_c19_d071_return_output);

-- BIN_OP_AND_uxn_c_l159_c19_f461
BIN_OP_AND_uxn_c_l159_c19_f461 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l159_c19_f461_left,
BIN_OP_AND_uxn_c_l159_c19_f461_right,
BIN_OP_AND_uxn_c_l159_c19_f461_return_output);

-- MUX_uxn_c_l164_c3_b13c
MUX_uxn_c_l164_c3_b13c : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
MUX_uxn_c_l164_c3_b13c_cond,
MUX_uxn_c_l164_c3_b13c_iftrue,
MUX_uxn_c_l164_c3_b13c_iffalse,
MUX_uxn_c_l164_c3_b13c_return_output);

-- UNARY_OP_NOT_uxn_c_l165_c57_69cc
UNARY_OP_NOT_uxn_c_l165_c57_69cc : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l165_c57_69cc_expr,
UNARY_OP_NOT_uxn_c_l165_c57_69cc_return_output);

-- BIN_OP_AND_uxn_c_l165_c22_1c1b
BIN_OP_AND_uxn_c_l165_c22_1c1b : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l165_c22_1c1b_left,
BIN_OP_AND_uxn_c_l165_c22_1c1b_right,
BIN_OP_AND_uxn_c_l165_c22_1c1b_return_output);

-- BIN_OP_OR_uxn_c_l165_c3_be18
BIN_OP_OR_uxn_c_l165_c3_be18 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l165_c3_be18_left,
BIN_OP_OR_uxn_c_l165_c3_be18_right,
BIN_OP_OR_uxn_c_l165_c3_be18_return_output);

-- bg_vram_update_uxn_c_l161_c19_ec32
bg_vram_update_uxn_c_l161_c19_ec32 : entity work.bg_vram_update_0CLK_6f2c5aad port map (
clk,
bg_vram_update_uxn_c_l161_c19_ec32_CLOCK_ENABLE,
bg_vram_update_uxn_c_l161_c19_ec32_read_address,
bg_vram_update_uxn_c_l161_c19_ec32_write_address,
bg_vram_update_uxn_c_l161_c19_ec32_write_value,
bg_vram_update_uxn_c_l161_c19_ec32_write_enable,
bg_vram_update_uxn_c_l161_c19_ec32_return_output);

-- MUX_uxn_c_l171_c3_769b
MUX_uxn_c_l171_c3_769b : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
MUX_uxn_c_l171_c3_769b_cond,
MUX_uxn_c_l171_c3_769b_iftrue,
MUX_uxn_c_l171_c3_769b_iffalse,
MUX_uxn_c_l171_c3_769b_return_output);

-- BIN_OP_AND_uxn_c_l172_c22_0c76
BIN_OP_AND_uxn_c_l172_c22_0c76 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l172_c22_0c76_left,
BIN_OP_AND_uxn_c_l172_c22_0c76_right,
BIN_OP_AND_uxn_c_l172_c22_0c76_return_output);

-- BIN_OP_OR_uxn_c_l172_c3_6336
BIN_OP_OR_uxn_c_l172_c3_6336 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l172_c3_6336_left,
BIN_OP_OR_uxn_c_l172_c3_6336_right,
BIN_OP_OR_uxn_c_l172_c3_6336_return_output);

-- fg_vram_update_uxn_c_l168_c19_3773
fg_vram_update_uxn_c_l168_c19_3773 : entity work.fg_vram_update_0CLK_6f2c5aad port map (
clk,
fg_vram_update_uxn_c_l168_c19_3773_CLOCK_ENABLE,
fg_vram_update_uxn_c_l168_c19_3773_read_address,
fg_vram_update_uxn_c_l168_c19_3773_write_address,
fg_vram_update_uxn_c_l168_c19_3773_write_value,
fg_vram_update_uxn_c_l168_c19_3773_write_enable,
fg_vram_update_uxn_c_l168_c19_3773_return_output);

-- BIN_OP_MINUS_uxn_c_l175_c43_a106
BIN_OP_MINUS_uxn_c_l175_c43_a106 : entity work.BIN_OP_MINUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l175_c43_a106_left,
BIN_OP_MINUS_uxn_c_l175_c43_a106_right,
BIN_OP_MINUS_uxn_c_l175_c43_a106_return_output);

-- MUX_uxn_c_l175_c26_3d49
MUX_uxn_c_l175_c26_3d49 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l175_c26_3d49_cond,
MUX_uxn_c_l175_c26_3d49_iftrue,
MUX_uxn_c_l175_c26_3d49_iffalse,
MUX_uxn_c_l175_c26_3d49_return_output);

-- BIN_OP_EQ_uxn_c_l176_c19_a706
BIN_OP_EQ_uxn_c_l176_c19_a706 : entity work.BIN_OP_EQ_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l176_c19_a706_left,
BIN_OP_EQ_uxn_c_l176_c19_a706_right,
BIN_OP_EQ_uxn_c_l176_c19_a706_return_output);

-- MUX_uxn_c_l176_c19_b09d
MUX_uxn_c_l176_c19_b09d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l176_c19_b09d_cond,
MUX_uxn_c_l176_c19_b09d_iftrue,
MUX_uxn_c_l176_c19_b09d_iffalse,
MUX_uxn_c_l176_c19_b09d_return_output);

-- BIN_OP_EQ_uxn_c_l177_c19_a937
BIN_OP_EQ_uxn_c_l177_c19_a937 : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l177_c19_a937_left,
BIN_OP_EQ_uxn_c_l177_c19_a937_right,
BIN_OP_EQ_uxn_c_l177_c19_a937_return_output);

-- BIN_OP_PLUS_uxn_c_l177_c76_cb16
BIN_OP_PLUS_uxn_c_l177_c76_cb16 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l177_c76_cb16_left,
BIN_OP_PLUS_uxn_c_l177_c76_cb16_right,
BIN_OP_PLUS_uxn_c_l177_c76_cb16_return_output);

-- MUX_uxn_c_l177_c50_158b
MUX_uxn_c_l177_c50_158b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l177_c50_158b_cond,
MUX_uxn_c_l177_c50_158b_iftrue,
MUX_uxn_c_l177_c50_158b_iffalse,
MUX_uxn_c_l177_c50_158b_return_output);

-- MUX_uxn_c_l177_c19_3daa
MUX_uxn_c_l177_c19_3daa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l177_c19_3daa_cond,
MUX_uxn_c_l177_c19_3daa_iftrue,
MUX_uxn_c_l177_c19_3daa_iffalse,
MUX_uxn_c_l177_c19_3daa_return_output);

-- BIN_OP_EQ_uxn_c_l178_c25_2f7a
BIN_OP_EQ_uxn_c_l178_c25_2f7a : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l178_c25_2f7a_left,
BIN_OP_EQ_uxn_c_l178_c25_2f7a_right,
BIN_OP_EQ_uxn_c_l178_c25_2f7a_return_output);

-- MUX_uxn_c_l178_c25_bc61
MUX_uxn_c_l178_c25_bc61 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l178_c25_bc61_cond,
MUX_uxn_c_l178_c25_bc61_iftrue,
MUX_uxn_c_l178_c25_bc61_iffalse,
MUX_uxn_c_l178_c25_bc61_return_output);

-- BIN_OP_EQ_uxn_c_l179_c17_3f1c
BIN_OP_EQ_uxn_c_l179_c17_3f1c : entity work.BIN_OP_EQ_uint2_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l179_c17_3f1c_left,
BIN_OP_EQ_uxn_c_l179_c17_3f1c_right,
BIN_OP_EQ_uxn_c_l179_c17_3f1c_return_output);

-- MUX_uxn_c_l179_c17_7282
MUX_uxn_c_l179_c17_7282 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
MUX_uxn_c_l179_c17_7282_cond,
MUX_uxn_c_l179_c17_7282_iftrue,
MUX_uxn_c_l179_c17_7282_iffalse,
MUX_uxn_c_l179_c17_7282_return_output);

-- UNARY_OP_NOT_uint1_t_uxn_c_l165_l172_DUPLICATE_a58a
UNARY_OP_NOT_uint1_t_uxn_c_l165_l172_DUPLICATE_a58a : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uint1_t_uxn_c_l165_l172_DUPLICATE_a58a_expr,
UNARY_OP_NOT_uint1_t_uxn_c_l165_l172_DUPLICATE_a58a_return_output);

-- BIN_OP_AND_uint1_t_uint1_t_uxn_c_l172_l165_DUPLICATE_039f
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l172_l165_DUPLICATE_039f : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l172_l165_DUPLICATE_039f_left,
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l172_l165_DUPLICATE_039f_right,
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l172_l165_DUPLICATE_039f_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 is_active_drawing_area,
 is_vram_write,
 vram_write_layer,
 vram_address,
 vram_value,
 -- Registers
 result,
 adjusted_vram_address,
 fill_pixels_remaining,
 fill_x0,
 fill_y0,
 fill_x1,
 fill_y1,
 fill_color,
 is_fill_active,
 is_fill_left,
 is_fill_top,
 is_fill_pixel0,
 is_fill_pixel1,
 fill_layer,
 is_fill_code,
 fg_pixel_color,
 bg_pixel_color,
 pixel_counter,
 x,
 y,
 -- All submodule outputs
 CONST_SR_4_uxn_c_l129_c44_8b18_return_output,
 BIN_OP_AND_uxn_c_l129_c17_c3d1_return_output,
 UNARY_OP_NOT_uxn_c_l132_c22_cdaa_return_output,
 BIN_OP_AND_uxn_c_l132_c6_566b_return_output,
 is_fill_top_MUX_uxn_c_l132_c2_d7c9_return_output,
 fill_y0_MUX_uxn_c_l132_c2_d7c9_return_output,
 fill_x1_MUX_uxn_c_l132_c2_d7c9_return_output,
 fill_color_MUX_uxn_c_l132_c2_d7c9_return_output,
 y_MUX_uxn_c_l132_c2_d7c9_return_output,
 fill_x0_MUX_uxn_c_l132_c2_d7c9_return_output,
 is_fill_active_MUX_uxn_c_l132_c2_d7c9_return_output,
 fill_y1_MUX_uxn_c_l132_c2_d7c9_return_output,
 fill_layer_MUX_uxn_c_l132_c2_d7c9_return_output,
 x_MUX_uxn_c_l132_c2_d7c9_return_output,
 fill_pixels_remaining_MUX_uxn_c_l132_c2_d7c9_return_output,
 CONST_SR_2_uxn_c_l134_c17_140c_return_output,
 CONST_SR_3_uxn_c_l135_c18_56c2_return_output,
 BIN_OP_DIV_uxn_c_l136_c13_e21d_return_output,
 BIN_OP_INFERRED_MULT_uxn_c_l137_c29_ee31_return_output,
 BIN_OP_MINUS_uxn_c_l137_c13_092b_return_output,
 MUX_uxn_c_l138_c13_f424_return_output,
 MUX_uxn_c_l139_c13_32a9_return_output,
 MUX_uxn_c_l140_c13_4af7_return_output,
 MUX_uxn_c_l141_c13_8fc9_return_output,
 BIN_OP_MINUS_uxn_c_l144_c28_080d_return_output,
 BIN_OP_PLUS_uxn_c_l144_c28_0745_return_output,
 BIN_OP_MINUS_uxn_c_l144_c54_f366_return_output,
 BIN_OP_PLUS_uxn_c_l144_c54_fabc_return_output,
 BIN_OP_INFERRED_MULT_uxn_c_l144_c28_7c6d_return_output,
 BIN_OP_INFERRED_MULT_uxn_c_l152_c45_9a0b_return_output,
 BIN_OP_PLUS_uxn_c_l152_c45_12f1_return_output,
 MUX_uxn_c_l152_c26_06b8_return_output,
 BIN_OP_EQ_uxn_c_l154_c18_c2bd_return_output,
 MUX_uxn_c_l154_c18_f71d_return_output,
 BIN_OP_PLUS_uxn_c_l155_c22_a54e_return_output,
 MUX_uxn_c_l155_c6_0188_return_output,
 BIN_OP_PLUS_uxn_c_l156_c31_3d3e_return_output,
 MUX_uxn_c_l156_c6_1c0b_return_output,
 UNARY_OP_NOT_uxn_c_l158_c38_d02b_return_output,
 BIN_OP_AND_uxn_c_l158_c19_d071_return_output,
 BIN_OP_AND_uxn_c_l159_c19_f461_return_output,
 MUX_uxn_c_l164_c3_b13c_return_output,
 UNARY_OP_NOT_uxn_c_l165_c57_69cc_return_output,
 BIN_OP_AND_uxn_c_l165_c22_1c1b_return_output,
 BIN_OP_OR_uxn_c_l165_c3_be18_return_output,
 bg_vram_update_uxn_c_l161_c19_ec32_return_output,
 MUX_uxn_c_l171_c3_769b_return_output,
 BIN_OP_AND_uxn_c_l172_c22_0c76_return_output,
 BIN_OP_OR_uxn_c_l172_c3_6336_return_output,
 fg_vram_update_uxn_c_l168_c19_3773_return_output,
 BIN_OP_MINUS_uxn_c_l175_c43_a106_return_output,
 MUX_uxn_c_l175_c26_3d49_return_output,
 BIN_OP_EQ_uxn_c_l176_c19_a706_return_output,
 MUX_uxn_c_l176_c19_b09d_return_output,
 BIN_OP_EQ_uxn_c_l177_c19_a937_return_output,
 BIN_OP_PLUS_uxn_c_l177_c76_cb16_return_output,
 MUX_uxn_c_l177_c50_158b_return_output,
 MUX_uxn_c_l177_c19_3daa_return_output,
 BIN_OP_EQ_uxn_c_l178_c25_2f7a_return_output,
 MUX_uxn_c_l178_c25_bc61_return_output,
 BIN_OP_EQ_uxn_c_l179_c17_3f1c_return_output,
 MUX_uxn_c_l179_c17_7282_return_output,
 UNARY_OP_NOT_uint1_t_uxn_c_l165_l172_DUPLICATE_a58a_return_output,
 BIN_OP_AND_uint1_t_uint1_t_uxn_c_l172_l165_DUPLICATE_039f_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : gpu_step_result_t;
 variable VAR_is_active_drawing_area : unsigned(0 downto 0);
 variable VAR_is_vram_write : unsigned(0 downto 0);
 variable VAR_vram_write_layer : unsigned(0 downto 0);
 variable VAR_vram_address : unsigned(15 downto 0);
 variable VAR_vram_value : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l129_c17_c3d1_left : unsigned(0 downto 0);
 variable VAR_CONST_SR_4_uxn_c_l129_c44_8b18_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_c_l129_c44_8b18_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_c_l129_c34_01d6_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l129_c17_c3d1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l129_c17_c3d1_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l132_c6_566b_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l132_c22_cdaa_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l132_c22_cdaa_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l132_c6_566b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l132_c6_566b_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_left_uxn_c_l135_c3_50e5 : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l132_c2_d7c9_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_top_uxn_c_l134_c3_cfc6 : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l132_c2_d7c9_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l132_c2_d7c9_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l132_c2_d7c9_cond : unsigned(0 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l132_c2_d7c9_iftrue : unsigned(15 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l132_c2_d7c9_iffalse : unsigned(15 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l132_c2_d7c9_return_output : unsigned(15 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l132_c2_d7c9_cond : unsigned(0 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l132_c2_d7c9_iftrue : unsigned(15 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l132_c2_d7c9_iffalse : unsigned(15 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l132_c2_d7c9_return_output : unsigned(15 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l132_c2_d7c9_cond : unsigned(0 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l132_c2_d7c9_iftrue : unsigned(1 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l132_c2_d7c9_iffalse : unsigned(1 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l132_c2_d7c9_return_output : unsigned(1 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l132_c2_d7c9_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_c_l132_c2_d7c9_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_c_l132_c2_d7c9_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_c_l132_c2_d7c9_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_c_l132_c2_d7c9_cond : unsigned(0 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l132_c2_d7c9_iftrue : unsigned(15 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l132_c2_d7c9_iffalse : unsigned(15 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l132_c2_d7c9_return_output : unsigned(15 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l132_c2_d7c9_cond : unsigned(0 downto 0);
 variable VAR_is_fill_active_MUX_uxn_c_l132_c2_d7c9_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_active_MUX_uxn_c_l132_c2_d7c9_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_active_MUX_uxn_c_l132_c2_d7c9_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_active_MUX_uxn_c_l132_c2_d7c9_cond : unsigned(0 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l132_c2_d7c9_iftrue : unsigned(15 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l132_c2_d7c9_iffalse : unsigned(15 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l132_c2_d7c9_return_output : unsigned(15 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l132_c2_d7c9_cond : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l132_c2_d7c9_iftrue : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l132_c2_d7c9_iffalse : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l132_c2_d7c9_return_output : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l132_c2_d7c9_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_c_l132_c2_d7c9_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_c_l132_c2_d7c9_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_c_l132_c2_d7c9_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_c_l132_c2_d7c9_cond : unsigned(0 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l132_c2_d7c9_iftrue : unsigned(15 downto 0);
 variable VAR_fill_pixels_remaining_uxn_c_l144_c3_f6c9 : unsigned(15 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l132_c2_d7c9_iffalse : unsigned(15 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l132_c2_d7c9_return_output : unsigned(15 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l132_c2_d7c9_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_2_uxn_c_l134_c17_140c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_2_uxn_c_l134_c17_140c_x : unsigned(7 downto 0);
 variable VAR_CONST_SR_3_uxn_c_l135_c18_56c2_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_3_uxn_c_l135_c18_56c2_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_DIV_uxn_c_l136_c13_e21d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_c_l136_c13_e21d_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_DIV_uxn_c_l136_c13_e21d_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l137_c13_092b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l137_c29_ee31_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l137_c29_ee31_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l137_c29_ee31_return_output : unsigned(24 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l137_c13_092b_right : unsigned(24 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l137_c13_092b_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l138_c13_f424_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l138_c13_f424_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l138_c13_f424_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l138_c13_f424_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l139_c13_32a9_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l139_c13_32a9_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l139_c13_32a9_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l139_c13_32a9_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l140_c13_4af7_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l140_c13_4af7_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l140_c13_4af7_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l140_c13_4af7_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l141_c13_8fc9_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l141_c13_8fc9_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l141_c13_8fc9_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l141_c13_8fc9_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint2_t_uxn_c_l143_c16_ba7f_return_output : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l144_c28_080d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l144_c28_080d_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l144_c28_080d_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l144_c28_0745_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l144_c28_0745_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l144_c28_0745_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l144_c28_7c6d_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l144_c54_f366_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l144_c54_f366_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l144_c54_f366_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l144_c54_fabc_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l144_c54_fabc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l144_c54_fabc_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l144_c28_7c6d_right : unsigned(16 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l144_c28_7c6d_return_output : unsigned(33 downto 0);
 variable VAR_MUX_uxn_c_l152_c26_06b8_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l152_c26_06b8_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l152_c26_06b8_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l152_c45_9a0b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l152_c45_9a0b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l152_c45_9a0b_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l152_c45_12f1_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l152_c45_12f1_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l152_c45_12f1_return_output : unsigned(32 downto 0);
 variable VAR_MUX_uxn_c_l152_c26_06b8_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l154_c18_f71d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l154_c18_c2bd_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l154_c18_c2bd_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l154_c18_c2bd_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l154_c18_f71d_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l154_c18_f71d_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l154_c18_f71d_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l155_c6_0188_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l155_c6_0188_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l155_c6_0188_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l155_c22_a54e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l155_c22_a54e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l155_c22_a54e_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l155_c6_0188_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l156_c6_1c0b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l156_c6_1c0b_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l156_c6_1c0b_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l156_c31_3d3e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l156_c31_3d3e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l156_c31_3d3e_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l156_c6_1c0b_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l158_c19_d071_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l158_c38_d02b_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l158_c38_d02b_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l158_c19_d071_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l158_c19_d071_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l159_c19_f461_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l159_c19_f461_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l159_c19_f461_return_output : unsigned(0 downto 0);
 variable VAR_bg_vram_update_uxn_c_l161_c19_ec32_read_address : unsigned(15 downto 0);
 variable VAR_bg_vram_update_uxn_c_l161_c19_ec32_write_address : unsigned(15 downto 0);
 variable VAR_bg_vram_update_uxn_c_l161_c19_ec32_write_value : unsigned(1 downto 0);
 variable VAR_bg_vram_update_uxn_c_l161_c19_ec32_write_enable : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l164_c3_b13c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l164_c3_b13c_iftrue : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l164_c3_b13c_iffalse : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l164_c3_b13c_return_output : unsigned(1 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l165_c3_be18_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l165_c22_1c1b_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l165_c57_69cc_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l165_c57_69cc_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l165_c22_1c1b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l165_c22_1c1b_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l165_c3_be18_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l165_c3_be18_return_output : unsigned(0 downto 0);
 variable VAR_bg_vram_update_uxn_c_l161_c19_ec32_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_bg_vram_update_uxn_c_l161_c19_ec32_return_output : unsigned(1 downto 0);
 variable VAR_fg_vram_update_uxn_c_l168_c19_3773_read_address : unsigned(15 downto 0);
 variable VAR_fg_vram_update_uxn_c_l168_c19_3773_write_address : unsigned(15 downto 0);
 variable VAR_fg_vram_update_uxn_c_l168_c19_3773_write_value : unsigned(1 downto 0);
 variable VAR_fg_vram_update_uxn_c_l168_c19_3773_write_enable : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l171_c3_769b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l171_c3_769b_iftrue : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l171_c3_769b_iffalse : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l171_c3_769b_return_output : unsigned(1 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l172_c3_6336_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l172_c22_0c76_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l172_c22_0c76_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l172_c22_0c76_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l172_c3_6336_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l172_c3_6336_return_output : unsigned(0 downto 0);
 variable VAR_fg_vram_update_uxn_c_l168_c19_3773_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_fg_vram_update_uxn_c_l168_c19_3773_return_output : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l175_c26_3d49_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l175_c26_3d49_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l175_c26_3d49_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l175_c43_a106_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l175_c43_a106_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l175_c43_a106_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l175_c26_3d49_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l176_c19_b09d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l176_c19_a706_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l176_c19_a706_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l176_c19_a706_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l176_c19_b09d_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l176_c19_b09d_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l176_c19_b09d_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l177_c19_3daa_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l177_c19_a937_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l177_c19_a937_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l177_c19_a937_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l177_c19_3daa_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l177_c19_3daa_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l177_c50_158b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l177_c50_158b_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l177_c50_158b_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l177_c76_cb16_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l177_c76_cb16_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l177_c76_cb16_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l177_c50_158b_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l177_c19_3daa_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l178_c25_bc61_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l178_c25_2f7a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l178_c25_2f7a_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l178_c25_2f7a_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l178_c25_bc61_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l178_c25_bc61_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l178_c25_bc61_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l179_c17_7282_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l179_c17_3f1c_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l179_c17_3f1c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l179_c17_3f1c_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l179_c17_7282_iftrue : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l179_c17_7282_iffalse : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l179_c17_7282_return_output : unsigned(1 downto 0);
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_c_l165_l172_DUPLICATE_a58a_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_c_l165_l172_DUPLICATE_a58a_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l172_l165_DUPLICATE_039f_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l172_l165_DUPLICATE_039f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l172_l165_DUPLICATE_039f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_269d_uxn_c_l182_l115_DUPLICATE_e7de_return_output : gpu_step_result_t;
 -- State registers comb logic variables
variable REG_VAR_result : gpu_step_result_t;
variable REG_VAR_adjusted_vram_address : unsigned(15 downto 0);
variable REG_VAR_fill_pixels_remaining : unsigned(15 downto 0);
variable REG_VAR_fill_x0 : unsigned(15 downto 0);
variable REG_VAR_fill_y0 : unsigned(15 downto 0);
variable REG_VAR_fill_x1 : unsigned(15 downto 0);
variable REG_VAR_fill_y1 : unsigned(15 downto 0);
variable REG_VAR_fill_color : unsigned(1 downto 0);
variable REG_VAR_is_fill_active : unsigned(0 downto 0);
variable REG_VAR_is_fill_left : unsigned(0 downto 0);
variable REG_VAR_is_fill_top : unsigned(0 downto 0);
variable REG_VAR_is_fill_pixel0 : unsigned(0 downto 0);
variable REG_VAR_is_fill_pixel1 : unsigned(0 downto 0);
variable REG_VAR_fill_layer : unsigned(0 downto 0);
variable REG_VAR_is_fill_code : unsigned(0 downto 0);
variable REG_VAR_fg_pixel_color : unsigned(1 downto 0);
variable REG_VAR_bg_pixel_color : unsigned(1 downto 0);
variable REG_VAR_pixel_counter : unsigned(15 downto 0);
variable REG_VAR_x : unsigned(15 downto 0);
variable REG_VAR_y : unsigned(15 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_result := result;
  REG_VAR_adjusted_vram_address := adjusted_vram_address;
  REG_VAR_fill_pixels_remaining := fill_pixels_remaining;
  REG_VAR_fill_x0 := fill_x0;
  REG_VAR_fill_y0 := fill_y0;
  REG_VAR_fill_x1 := fill_x1;
  REG_VAR_fill_y1 := fill_y1;
  REG_VAR_fill_color := fill_color;
  REG_VAR_is_fill_active := is_fill_active;
  REG_VAR_is_fill_left := is_fill_left;
  REG_VAR_is_fill_top := is_fill_top;
  REG_VAR_is_fill_pixel0 := is_fill_pixel0;
  REG_VAR_is_fill_pixel1 := is_fill_pixel1;
  REG_VAR_fill_layer := fill_layer;
  REG_VAR_is_fill_code := is_fill_code;
  REG_VAR_fg_pixel_color := fg_pixel_color;
  REG_VAR_bg_pixel_color := bg_pixel_color;
  REG_VAR_pixel_counter := pixel_counter;
  REG_VAR_x := x;
  REG_VAR_y := y;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_MUX_uxn_c_l154_c18_f71d_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l138_c13_f424_iffalse := resize(to_unsigned(233, 8), 16);
     VAR_BIN_OP_MINUS_uxn_c_l175_c43_a106_right := to_unsigned(1, 1);
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l137_c29_ee31_right := to_unsigned(260, 9);
     VAR_BIN_OP_EQ_uxn_c_l176_c19_a706_right := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l140_c13_4af7_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_BIN_OP_EQ_uxn_c_l179_c17_3f1c_right := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_c_l155_c22_a54e_right := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l139_c13_32a9_iffalse := resize(to_unsigned(259, 9), 16);
     VAR_MUX_uxn_c_l154_c18_f71d_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l177_c19_a937_right := to_unsigned(60839, 16);
     VAR_MUX_uxn_c_l177_c19_3daa_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_BIN_OP_PLUS_uxn_c_l177_c76_cb16_right := to_unsigned(1, 1);
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l152_c45_9a0b_right := to_unsigned(260, 16);
     VAR_BIN_OP_PLUS_uxn_c_l156_c31_3d3e_right := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l178_c25_bc61_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_c_l144_c54_fabc_right := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l175_c26_3d49_iffalse := resize(to_unsigned(0, 1), 16);
     VAR_BIN_OP_PLUS_uxn_c_l144_c28_0745_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l178_c25_2f7a_right := to_unsigned(60839, 16);
     VAR_BIN_OP_DIV_uxn_c_l136_c13_e21d_right := to_unsigned(260, 9);
     VAR_MUX_uxn_c_l178_c25_bc61_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l176_c19_b09d_iftrue := to_unsigned(0, 1);
     VAR_is_fill_active_MUX_uxn_c_l132_c2_d7c9_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l141_c13_8fc9_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_MUX_uxn_c_l176_c19_b09d_iffalse := to_unsigned(1, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_is_active_drawing_area := is_active_drawing_area;
     VAR_is_vram_write := is_vram_write;
     VAR_vram_write_layer := vram_write_layer;
     VAR_vram_address := vram_address;
     VAR_vram_value := vram_value;

     -- Submodule level 0
     VAR_bg_vram_update_uxn_c_l161_c19_ec32_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_fg_vram_update_uxn_c_l168_c19_3773_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_fill_color_MUX_uxn_c_l132_c2_d7c9_iffalse := fill_color;
     VAR_fill_layer_MUX_uxn_c_l132_c2_d7c9_iffalse := fill_layer;
     VAR_fill_pixels_remaining_MUX_uxn_c_l132_c2_d7c9_iffalse := fill_pixels_remaining;
     VAR_fill_x0_MUX_uxn_c_l132_c2_d7c9_iffalse := fill_x0;
     VAR_fill_x1_MUX_uxn_c_l132_c2_d7c9_iffalse := fill_x1;
     VAR_fill_y0_MUX_uxn_c_l132_c2_d7c9_iffalse := fill_y0;
     VAR_fill_y1_MUX_uxn_c_l132_c2_d7c9_iffalse := fill_y1;
     VAR_MUX_uxn_c_l177_c50_158b_cond := VAR_is_active_drawing_area;
     VAR_UNARY_OP_NOT_uxn_c_l132_c22_cdaa_expr := is_fill_active;
     VAR_is_fill_active_MUX_uxn_c_l132_c2_d7c9_iffalse := is_fill_active;
     VAR_is_fill_top_MUX_uxn_c_l132_c2_d7c9_iffalse := is_fill_top;
     VAR_BIN_OP_AND_uxn_c_l129_c17_c3d1_left := VAR_is_vram_write;
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l172_l165_DUPLICATE_039f_right := VAR_is_vram_write;
     VAR_BIN_OP_EQ_uxn_c_l177_c19_a937_left := pixel_counter;
     VAR_BIN_OP_PLUS_uxn_c_l177_c76_cb16_left := pixel_counter;
     VAR_MUX_uxn_c_l177_c50_158b_iffalse := pixel_counter;
     VAR_bg_vram_update_uxn_c_l161_c19_ec32_read_address := pixel_counter;
     VAR_fg_vram_update_uxn_c_l168_c19_3773_read_address := pixel_counter;
     VAR_BIN_OP_DIV_uxn_c_l136_c13_e21d_left := VAR_vram_address;
     VAR_BIN_OP_MINUS_uxn_c_l137_c13_092b_left := VAR_vram_address;
     VAR_MUX_uxn_c_l152_c26_06b8_iffalse := VAR_vram_address;
     VAR_CONST_SR_2_uxn_c_l134_c17_140c_x := VAR_vram_value;
     VAR_CONST_SR_3_uxn_c_l135_c18_56c2_x := VAR_vram_value;
     VAR_CONST_SR_4_uxn_c_l129_c44_8b18_x := VAR_vram_value;
     VAR_MUX_uxn_c_l164_c3_b13c_iffalse := resize(VAR_vram_value, 2);
     VAR_MUX_uxn_c_l171_c3_769b_iffalse := resize(VAR_vram_value, 2);
     VAR_BIN_OP_AND_uxn_c_l172_c22_0c76_right := VAR_vram_write_layer;
     VAR_UNARY_OP_NOT_uxn_c_l165_c57_69cc_expr := VAR_vram_write_layer;
     VAR_fill_layer_MUX_uxn_c_l132_c2_d7c9_iftrue := VAR_vram_write_layer;
     VAR_x_MUX_uxn_c_l132_c2_d7c9_iffalse := x;
     VAR_y_MUX_uxn_c_l132_c2_d7c9_iffalse := y;
     -- BIN_OP_EQ[uxn_c_l177_c19_a937] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l177_c19_a937_left <= VAR_BIN_OP_EQ_uxn_c_l177_c19_a937_left;
     BIN_OP_EQ_uxn_c_l177_c19_a937_right <= VAR_BIN_OP_EQ_uxn_c_l177_c19_a937_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l177_c19_a937_return_output := BIN_OP_EQ_uxn_c_l177_c19_a937_return_output;

     -- UNARY_OP_NOT[uxn_c_l132_c22_cdaa] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l132_c22_cdaa_expr <= VAR_UNARY_OP_NOT_uxn_c_l132_c22_cdaa_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l132_c22_cdaa_return_output := UNARY_OP_NOT_uxn_c_l132_c22_cdaa_return_output;

     -- CONST_SR_3[uxn_c_l135_c18_56c2] LATENCY=0
     -- Inputs
     CONST_SR_3_uxn_c_l135_c18_56c2_x <= VAR_CONST_SR_3_uxn_c_l135_c18_56c2_x;
     -- Outputs
     VAR_CONST_SR_3_uxn_c_l135_c18_56c2_return_output := CONST_SR_3_uxn_c_l135_c18_56c2_return_output;

     -- BIN_OP_DIV[uxn_c_l136_c13_e21d] LATENCY=0
     -- Inputs
     BIN_OP_DIV_uxn_c_l136_c13_e21d_left <= VAR_BIN_OP_DIV_uxn_c_l136_c13_e21d_left;
     BIN_OP_DIV_uxn_c_l136_c13_e21d_right <= VAR_BIN_OP_DIV_uxn_c_l136_c13_e21d_right;
     -- Outputs
     VAR_BIN_OP_DIV_uxn_c_l136_c13_e21d_return_output := BIN_OP_DIV_uxn_c_l136_c13_e21d_return_output;

     -- UNARY_OP_NOT[uxn_c_l165_c57_69cc] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l165_c57_69cc_expr <= VAR_UNARY_OP_NOT_uxn_c_l165_c57_69cc_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l165_c57_69cc_return_output := UNARY_OP_NOT_uxn_c_l165_c57_69cc_return_output;

     -- CAST_TO_uint2_t[uxn_c_l143_c16_ba7f] LATENCY=0
     VAR_CAST_TO_uint2_t_uxn_c_l143_c16_ba7f_return_output := CAST_TO_uint2_t_uint8_t(
     VAR_vram_value);

     -- CONST_SR_2[uxn_c_l134_c17_140c] LATENCY=0
     -- Inputs
     CONST_SR_2_uxn_c_l134_c17_140c_x <= VAR_CONST_SR_2_uxn_c_l134_c17_140c_x;
     -- Outputs
     VAR_CONST_SR_2_uxn_c_l134_c17_140c_return_output := CONST_SR_2_uxn_c_l134_c17_140c_return_output;

     -- CONST_SR_4[uxn_c_l129_c44_8b18] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_c_l129_c44_8b18_x <= VAR_CONST_SR_4_uxn_c_l129_c44_8b18_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_c_l129_c44_8b18_return_output := CONST_SR_4_uxn_c_l129_c44_8b18_return_output;

     -- BIN_OP_PLUS[uxn_c_l177_c76_cb16] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l177_c76_cb16_left <= VAR_BIN_OP_PLUS_uxn_c_l177_c76_cb16_left;
     BIN_OP_PLUS_uxn_c_l177_c76_cb16_right <= VAR_BIN_OP_PLUS_uxn_c_l177_c76_cb16_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l177_c76_cb16_return_output := BIN_OP_PLUS_uxn_c_l177_c76_cb16_return_output;

     -- Submodule level 1
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l137_c29_ee31_left := VAR_BIN_OP_DIV_uxn_c_l136_c13_e21d_return_output;
     VAR_MUX_uxn_c_l138_c13_f424_iftrue := VAR_BIN_OP_DIV_uxn_c_l136_c13_e21d_return_output;
     VAR_MUX_uxn_c_l140_c13_4af7_iffalse := VAR_BIN_OP_DIV_uxn_c_l136_c13_e21d_return_output;
     VAR_MUX_uxn_c_l177_c19_3daa_cond := VAR_BIN_OP_EQ_uxn_c_l177_c19_a937_return_output;
     VAR_MUX_uxn_c_l177_c50_158b_iftrue := resize(VAR_BIN_OP_PLUS_uxn_c_l177_c76_cb16_return_output, 16);
     VAR_fill_color_MUX_uxn_c_l132_c2_d7c9_iftrue := VAR_CAST_TO_uint2_t_uxn_c_l143_c16_ba7f_return_output;
     VAR_is_fill_top_uxn_c_l134_c3_cfc6 := resize(VAR_CONST_SR_2_uxn_c_l134_c17_140c_return_output, 1);
     VAR_is_fill_left_uxn_c_l135_c3_50e5 := resize(VAR_CONST_SR_3_uxn_c_l135_c18_56c2_return_output, 1);
     VAR_BIN_OP_AND_uxn_c_l132_c6_566b_right := VAR_UNARY_OP_NOT_uxn_c_l132_c22_cdaa_return_output;
     VAR_BIN_OP_AND_uxn_c_l165_c22_1c1b_right := VAR_UNARY_OP_NOT_uxn_c_l165_c57_69cc_return_output;
     VAR_MUX_uxn_c_l139_c13_32a9_cond := VAR_is_fill_left_uxn_c_l135_c3_50e5;
     VAR_MUX_uxn_c_l141_c13_8fc9_cond := VAR_is_fill_left_uxn_c_l135_c3_50e5;
     VAR_MUX_uxn_c_l138_c13_f424_cond := VAR_is_fill_top_uxn_c_l134_c3_cfc6;
     VAR_MUX_uxn_c_l140_c13_4af7_cond := VAR_is_fill_top_uxn_c_l134_c3_cfc6;
     VAR_is_fill_top_MUX_uxn_c_l132_c2_d7c9_iftrue := VAR_is_fill_top_uxn_c_l134_c3_cfc6;
     -- BIN_OP_INFERRED_MULT[uxn_c_l137_c29_ee31] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_c_l137_c29_ee31_left <= VAR_BIN_OP_INFERRED_MULT_uxn_c_l137_c29_ee31_left;
     BIN_OP_INFERRED_MULT_uxn_c_l137_c29_ee31_right <= VAR_BIN_OP_INFERRED_MULT_uxn_c_l137_c29_ee31_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l137_c29_ee31_return_output := BIN_OP_INFERRED_MULT_uxn_c_l137_c29_ee31_return_output;

     -- CAST_TO_uint1_t[uxn_c_l129_c34_01d6] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_c_l129_c34_01d6_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_4_uxn_c_l129_c44_8b18_return_output);

     -- MUX[uxn_c_l138_c13_f424] LATENCY=0
     -- Inputs
     MUX_uxn_c_l138_c13_f424_cond <= VAR_MUX_uxn_c_l138_c13_f424_cond;
     MUX_uxn_c_l138_c13_f424_iftrue <= VAR_MUX_uxn_c_l138_c13_f424_iftrue;
     MUX_uxn_c_l138_c13_f424_iffalse <= VAR_MUX_uxn_c_l138_c13_f424_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l138_c13_f424_return_output := MUX_uxn_c_l138_c13_f424_return_output;

     -- MUX[uxn_c_l140_c13_4af7] LATENCY=0
     -- Inputs
     MUX_uxn_c_l140_c13_4af7_cond <= VAR_MUX_uxn_c_l140_c13_4af7_cond;
     MUX_uxn_c_l140_c13_4af7_iftrue <= VAR_MUX_uxn_c_l140_c13_4af7_iftrue;
     MUX_uxn_c_l140_c13_4af7_iffalse <= VAR_MUX_uxn_c_l140_c13_4af7_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l140_c13_4af7_return_output := MUX_uxn_c_l140_c13_4af7_return_output;

     -- MUX[uxn_c_l177_c50_158b] LATENCY=0
     -- Inputs
     MUX_uxn_c_l177_c50_158b_cond <= VAR_MUX_uxn_c_l177_c50_158b_cond;
     MUX_uxn_c_l177_c50_158b_iftrue <= VAR_MUX_uxn_c_l177_c50_158b_iftrue;
     MUX_uxn_c_l177_c50_158b_iffalse <= VAR_MUX_uxn_c_l177_c50_158b_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l177_c50_158b_return_output := MUX_uxn_c_l177_c50_158b_return_output;

     -- Submodule level 2
     VAR_BIN_OP_MINUS_uxn_c_l137_c13_092b_right := VAR_BIN_OP_INFERRED_MULT_uxn_c_l137_c29_ee31_return_output;
     VAR_BIN_OP_AND_uxn_c_l129_c17_c3d1_right := VAR_CAST_TO_uint1_t_uxn_c_l129_c34_01d6_return_output;
     VAR_BIN_OP_MINUS_uxn_c_l144_c54_f366_left := VAR_MUX_uxn_c_l138_c13_f424_return_output;
     VAR_fill_y1_MUX_uxn_c_l132_c2_d7c9_iftrue := VAR_MUX_uxn_c_l138_c13_f424_return_output;
     VAR_BIN_OP_MINUS_uxn_c_l144_c54_f366_right := VAR_MUX_uxn_c_l140_c13_4af7_return_output;
     VAR_fill_y0_MUX_uxn_c_l132_c2_d7c9_iftrue := VAR_MUX_uxn_c_l140_c13_4af7_return_output;
     VAR_y_MUX_uxn_c_l132_c2_d7c9_iftrue := VAR_MUX_uxn_c_l140_c13_4af7_return_output;
     VAR_MUX_uxn_c_l177_c19_3daa_iffalse := VAR_MUX_uxn_c_l177_c50_158b_return_output;
     -- BIN_OP_MINUS[uxn_c_l144_c54_f366] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l144_c54_f366_left <= VAR_BIN_OP_MINUS_uxn_c_l144_c54_f366_left;
     BIN_OP_MINUS_uxn_c_l144_c54_f366_right <= VAR_BIN_OP_MINUS_uxn_c_l144_c54_f366_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l144_c54_f366_return_output := BIN_OP_MINUS_uxn_c_l144_c54_f366_return_output;

     -- MUX[uxn_c_l177_c19_3daa] LATENCY=0
     -- Inputs
     MUX_uxn_c_l177_c19_3daa_cond <= VAR_MUX_uxn_c_l177_c19_3daa_cond;
     MUX_uxn_c_l177_c19_3daa_iftrue <= VAR_MUX_uxn_c_l177_c19_3daa_iftrue;
     MUX_uxn_c_l177_c19_3daa_iffalse <= VAR_MUX_uxn_c_l177_c19_3daa_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l177_c19_3daa_return_output := MUX_uxn_c_l177_c19_3daa_return_output;

     -- BIN_OP_AND[uxn_c_l129_c17_c3d1] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l129_c17_c3d1_left <= VAR_BIN_OP_AND_uxn_c_l129_c17_c3d1_left;
     BIN_OP_AND_uxn_c_l129_c17_c3d1_right <= VAR_BIN_OP_AND_uxn_c_l129_c17_c3d1_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l129_c17_c3d1_return_output := BIN_OP_AND_uxn_c_l129_c17_c3d1_return_output;

     -- BIN_OP_MINUS[uxn_c_l137_c13_092b] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l137_c13_092b_left <= VAR_BIN_OP_MINUS_uxn_c_l137_c13_092b_left;
     BIN_OP_MINUS_uxn_c_l137_c13_092b_right <= VAR_BIN_OP_MINUS_uxn_c_l137_c13_092b_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l137_c13_092b_return_output := BIN_OP_MINUS_uxn_c_l137_c13_092b_return_output;

     -- Submodule level 3
     VAR_BIN_OP_AND_uxn_c_l132_c6_566b_left := VAR_BIN_OP_AND_uxn_c_l129_c17_c3d1_return_output;
     REG_VAR_is_fill_code := VAR_BIN_OP_AND_uxn_c_l129_c17_c3d1_return_output;
     VAR_MUX_uxn_c_l139_c13_32a9_iftrue := VAR_BIN_OP_MINUS_uxn_c_l137_c13_092b_return_output;
     VAR_MUX_uxn_c_l141_c13_8fc9_iffalse := VAR_BIN_OP_MINUS_uxn_c_l137_c13_092b_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l144_c54_fabc_left := VAR_BIN_OP_MINUS_uxn_c_l144_c54_f366_return_output;
     VAR_BIN_OP_EQ_uxn_c_l178_c25_2f7a_left := VAR_MUX_uxn_c_l177_c19_3daa_return_output;
     REG_VAR_pixel_counter := VAR_MUX_uxn_c_l177_c19_3daa_return_output;
     -- BIN_OP_EQ[uxn_c_l178_c25_2f7a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l178_c25_2f7a_left <= VAR_BIN_OP_EQ_uxn_c_l178_c25_2f7a_left;
     BIN_OP_EQ_uxn_c_l178_c25_2f7a_right <= VAR_BIN_OP_EQ_uxn_c_l178_c25_2f7a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l178_c25_2f7a_return_output := BIN_OP_EQ_uxn_c_l178_c25_2f7a_return_output;

     -- BIN_OP_AND[uxn_c_l132_c6_566b] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l132_c6_566b_left <= VAR_BIN_OP_AND_uxn_c_l132_c6_566b_left;
     BIN_OP_AND_uxn_c_l132_c6_566b_right <= VAR_BIN_OP_AND_uxn_c_l132_c6_566b_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l132_c6_566b_return_output := BIN_OP_AND_uxn_c_l132_c6_566b_return_output;

     -- MUX[uxn_c_l139_c13_32a9] LATENCY=0
     -- Inputs
     MUX_uxn_c_l139_c13_32a9_cond <= VAR_MUX_uxn_c_l139_c13_32a9_cond;
     MUX_uxn_c_l139_c13_32a9_iftrue <= VAR_MUX_uxn_c_l139_c13_32a9_iftrue;
     MUX_uxn_c_l139_c13_32a9_iffalse <= VAR_MUX_uxn_c_l139_c13_32a9_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l139_c13_32a9_return_output := MUX_uxn_c_l139_c13_32a9_return_output;

     -- MUX[uxn_c_l141_c13_8fc9] LATENCY=0
     -- Inputs
     MUX_uxn_c_l141_c13_8fc9_cond <= VAR_MUX_uxn_c_l141_c13_8fc9_cond;
     MUX_uxn_c_l141_c13_8fc9_iftrue <= VAR_MUX_uxn_c_l141_c13_8fc9_iftrue;
     MUX_uxn_c_l141_c13_8fc9_iffalse <= VAR_MUX_uxn_c_l141_c13_8fc9_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l141_c13_8fc9_return_output := MUX_uxn_c_l141_c13_8fc9_return_output;

     -- BIN_OP_PLUS[uxn_c_l144_c54_fabc] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l144_c54_fabc_left <= VAR_BIN_OP_PLUS_uxn_c_l144_c54_fabc_left;
     BIN_OP_PLUS_uxn_c_l144_c54_fabc_right <= VAR_BIN_OP_PLUS_uxn_c_l144_c54_fabc_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l144_c54_fabc_return_output := BIN_OP_PLUS_uxn_c_l144_c54_fabc_return_output;

     -- Submodule level 4
     VAR_fill_color_MUX_uxn_c_l132_c2_d7c9_cond := VAR_BIN_OP_AND_uxn_c_l132_c6_566b_return_output;
     VAR_fill_layer_MUX_uxn_c_l132_c2_d7c9_cond := VAR_BIN_OP_AND_uxn_c_l132_c6_566b_return_output;
     VAR_fill_pixels_remaining_MUX_uxn_c_l132_c2_d7c9_cond := VAR_BIN_OP_AND_uxn_c_l132_c6_566b_return_output;
     VAR_fill_x0_MUX_uxn_c_l132_c2_d7c9_cond := VAR_BIN_OP_AND_uxn_c_l132_c6_566b_return_output;
     VAR_fill_x1_MUX_uxn_c_l132_c2_d7c9_cond := VAR_BIN_OP_AND_uxn_c_l132_c6_566b_return_output;
     VAR_fill_y0_MUX_uxn_c_l132_c2_d7c9_cond := VAR_BIN_OP_AND_uxn_c_l132_c6_566b_return_output;
     VAR_fill_y1_MUX_uxn_c_l132_c2_d7c9_cond := VAR_BIN_OP_AND_uxn_c_l132_c6_566b_return_output;
     VAR_is_fill_active_MUX_uxn_c_l132_c2_d7c9_cond := VAR_BIN_OP_AND_uxn_c_l132_c6_566b_return_output;
     VAR_is_fill_top_MUX_uxn_c_l132_c2_d7c9_cond := VAR_BIN_OP_AND_uxn_c_l132_c6_566b_return_output;
     VAR_x_MUX_uxn_c_l132_c2_d7c9_cond := VAR_BIN_OP_AND_uxn_c_l132_c6_566b_return_output;
     VAR_y_MUX_uxn_c_l132_c2_d7c9_cond := VAR_BIN_OP_AND_uxn_c_l132_c6_566b_return_output;
     VAR_MUX_uxn_c_l178_c25_bc61_cond := VAR_BIN_OP_EQ_uxn_c_l178_c25_2f7a_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l144_c28_7c6d_right := VAR_BIN_OP_PLUS_uxn_c_l144_c54_fabc_return_output;
     VAR_BIN_OP_MINUS_uxn_c_l144_c28_080d_left := VAR_MUX_uxn_c_l139_c13_32a9_return_output;
     VAR_fill_x1_MUX_uxn_c_l132_c2_d7c9_iftrue := VAR_MUX_uxn_c_l139_c13_32a9_return_output;
     VAR_BIN_OP_MINUS_uxn_c_l144_c28_080d_right := VAR_MUX_uxn_c_l141_c13_8fc9_return_output;
     VAR_fill_x0_MUX_uxn_c_l132_c2_d7c9_iftrue := VAR_MUX_uxn_c_l141_c13_8fc9_return_output;
     VAR_x_MUX_uxn_c_l132_c2_d7c9_iftrue := VAR_MUX_uxn_c_l141_c13_8fc9_return_output;
     -- fill_y0_MUX[uxn_c_l132_c2_d7c9] LATENCY=0
     -- Inputs
     fill_y0_MUX_uxn_c_l132_c2_d7c9_cond <= VAR_fill_y0_MUX_uxn_c_l132_c2_d7c9_cond;
     fill_y0_MUX_uxn_c_l132_c2_d7c9_iftrue <= VAR_fill_y0_MUX_uxn_c_l132_c2_d7c9_iftrue;
     fill_y0_MUX_uxn_c_l132_c2_d7c9_iffalse <= VAR_fill_y0_MUX_uxn_c_l132_c2_d7c9_iffalse;
     -- Outputs
     VAR_fill_y0_MUX_uxn_c_l132_c2_d7c9_return_output := fill_y0_MUX_uxn_c_l132_c2_d7c9_return_output;

     -- x_MUX[uxn_c_l132_c2_d7c9] LATENCY=0
     -- Inputs
     x_MUX_uxn_c_l132_c2_d7c9_cond <= VAR_x_MUX_uxn_c_l132_c2_d7c9_cond;
     x_MUX_uxn_c_l132_c2_d7c9_iftrue <= VAR_x_MUX_uxn_c_l132_c2_d7c9_iftrue;
     x_MUX_uxn_c_l132_c2_d7c9_iffalse <= VAR_x_MUX_uxn_c_l132_c2_d7c9_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_c_l132_c2_d7c9_return_output := x_MUX_uxn_c_l132_c2_d7c9_return_output;

     -- y_MUX[uxn_c_l132_c2_d7c9] LATENCY=0
     -- Inputs
     y_MUX_uxn_c_l132_c2_d7c9_cond <= VAR_y_MUX_uxn_c_l132_c2_d7c9_cond;
     y_MUX_uxn_c_l132_c2_d7c9_iftrue <= VAR_y_MUX_uxn_c_l132_c2_d7c9_iftrue;
     y_MUX_uxn_c_l132_c2_d7c9_iffalse <= VAR_y_MUX_uxn_c_l132_c2_d7c9_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_c_l132_c2_d7c9_return_output := y_MUX_uxn_c_l132_c2_d7c9_return_output;

     -- MUX[uxn_c_l178_c25_bc61] LATENCY=0
     -- Inputs
     MUX_uxn_c_l178_c25_bc61_cond <= VAR_MUX_uxn_c_l178_c25_bc61_cond;
     MUX_uxn_c_l178_c25_bc61_iftrue <= VAR_MUX_uxn_c_l178_c25_bc61_iftrue;
     MUX_uxn_c_l178_c25_bc61_iffalse <= VAR_MUX_uxn_c_l178_c25_bc61_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l178_c25_bc61_return_output := MUX_uxn_c_l178_c25_bc61_return_output;

     -- is_fill_active_MUX[uxn_c_l132_c2_d7c9] LATENCY=0
     -- Inputs
     is_fill_active_MUX_uxn_c_l132_c2_d7c9_cond <= VAR_is_fill_active_MUX_uxn_c_l132_c2_d7c9_cond;
     is_fill_active_MUX_uxn_c_l132_c2_d7c9_iftrue <= VAR_is_fill_active_MUX_uxn_c_l132_c2_d7c9_iftrue;
     is_fill_active_MUX_uxn_c_l132_c2_d7c9_iffalse <= VAR_is_fill_active_MUX_uxn_c_l132_c2_d7c9_iffalse;
     -- Outputs
     VAR_is_fill_active_MUX_uxn_c_l132_c2_d7c9_return_output := is_fill_active_MUX_uxn_c_l132_c2_d7c9_return_output;

     -- fill_x1_MUX[uxn_c_l132_c2_d7c9] LATENCY=0
     -- Inputs
     fill_x1_MUX_uxn_c_l132_c2_d7c9_cond <= VAR_fill_x1_MUX_uxn_c_l132_c2_d7c9_cond;
     fill_x1_MUX_uxn_c_l132_c2_d7c9_iftrue <= VAR_fill_x1_MUX_uxn_c_l132_c2_d7c9_iftrue;
     fill_x1_MUX_uxn_c_l132_c2_d7c9_iffalse <= VAR_fill_x1_MUX_uxn_c_l132_c2_d7c9_iffalse;
     -- Outputs
     VAR_fill_x1_MUX_uxn_c_l132_c2_d7c9_return_output := fill_x1_MUX_uxn_c_l132_c2_d7c9_return_output;

     -- fill_layer_MUX[uxn_c_l132_c2_d7c9] LATENCY=0
     -- Inputs
     fill_layer_MUX_uxn_c_l132_c2_d7c9_cond <= VAR_fill_layer_MUX_uxn_c_l132_c2_d7c9_cond;
     fill_layer_MUX_uxn_c_l132_c2_d7c9_iftrue <= VAR_fill_layer_MUX_uxn_c_l132_c2_d7c9_iftrue;
     fill_layer_MUX_uxn_c_l132_c2_d7c9_iffalse <= VAR_fill_layer_MUX_uxn_c_l132_c2_d7c9_iffalse;
     -- Outputs
     VAR_fill_layer_MUX_uxn_c_l132_c2_d7c9_return_output := fill_layer_MUX_uxn_c_l132_c2_d7c9_return_output;

     -- is_fill_top_MUX[uxn_c_l132_c2_d7c9] LATENCY=0
     -- Inputs
     is_fill_top_MUX_uxn_c_l132_c2_d7c9_cond <= VAR_is_fill_top_MUX_uxn_c_l132_c2_d7c9_cond;
     is_fill_top_MUX_uxn_c_l132_c2_d7c9_iftrue <= VAR_is_fill_top_MUX_uxn_c_l132_c2_d7c9_iftrue;
     is_fill_top_MUX_uxn_c_l132_c2_d7c9_iffalse <= VAR_is_fill_top_MUX_uxn_c_l132_c2_d7c9_iffalse;
     -- Outputs
     VAR_is_fill_top_MUX_uxn_c_l132_c2_d7c9_return_output := is_fill_top_MUX_uxn_c_l132_c2_d7c9_return_output;

     -- BIN_OP_MINUS[uxn_c_l144_c28_080d] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l144_c28_080d_left <= VAR_BIN_OP_MINUS_uxn_c_l144_c28_080d_left;
     BIN_OP_MINUS_uxn_c_l144_c28_080d_right <= VAR_BIN_OP_MINUS_uxn_c_l144_c28_080d_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l144_c28_080d_return_output := BIN_OP_MINUS_uxn_c_l144_c28_080d_return_output;

     -- fill_x0_MUX[uxn_c_l132_c2_d7c9] LATENCY=0
     -- Inputs
     fill_x0_MUX_uxn_c_l132_c2_d7c9_cond <= VAR_fill_x0_MUX_uxn_c_l132_c2_d7c9_cond;
     fill_x0_MUX_uxn_c_l132_c2_d7c9_iftrue <= VAR_fill_x0_MUX_uxn_c_l132_c2_d7c9_iftrue;
     fill_x0_MUX_uxn_c_l132_c2_d7c9_iffalse <= VAR_fill_x0_MUX_uxn_c_l132_c2_d7c9_iffalse;
     -- Outputs
     VAR_fill_x0_MUX_uxn_c_l132_c2_d7c9_return_output := fill_x0_MUX_uxn_c_l132_c2_d7c9_return_output;

     -- fill_color_MUX[uxn_c_l132_c2_d7c9] LATENCY=0
     -- Inputs
     fill_color_MUX_uxn_c_l132_c2_d7c9_cond <= VAR_fill_color_MUX_uxn_c_l132_c2_d7c9_cond;
     fill_color_MUX_uxn_c_l132_c2_d7c9_iftrue <= VAR_fill_color_MUX_uxn_c_l132_c2_d7c9_iftrue;
     fill_color_MUX_uxn_c_l132_c2_d7c9_iffalse <= VAR_fill_color_MUX_uxn_c_l132_c2_d7c9_iffalse;
     -- Outputs
     VAR_fill_color_MUX_uxn_c_l132_c2_d7c9_return_output := fill_color_MUX_uxn_c_l132_c2_d7c9_return_output;

     -- fill_y1_MUX[uxn_c_l132_c2_d7c9] LATENCY=0
     -- Inputs
     fill_y1_MUX_uxn_c_l132_c2_d7c9_cond <= VAR_fill_y1_MUX_uxn_c_l132_c2_d7c9_cond;
     fill_y1_MUX_uxn_c_l132_c2_d7c9_iftrue <= VAR_fill_y1_MUX_uxn_c_l132_c2_d7c9_iftrue;
     fill_y1_MUX_uxn_c_l132_c2_d7c9_iffalse <= VAR_fill_y1_MUX_uxn_c_l132_c2_d7c9_iffalse;
     -- Outputs
     VAR_fill_y1_MUX_uxn_c_l132_c2_d7c9_return_output := fill_y1_MUX_uxn_c_l132_c2_d7c9_return_output;

     -- Submodule level 5
     VAR_BIN_OP_PLUS_uxn_c_l144_c28_0745_left := VAR_BIN_OP_MINUS_uxn_c_l144_c28_080d_return_output;
     VAR_MUX_uxn_c_l164_c3_b13c_iftrue := VAR_fill_color_MUX_uxn_c_l132_c2_d7c9_return_output;
     VAR_MUX_uxn_c_l171_c3_769b_iftrue := VAR_fill_color_MUX_uxn_c_l132_c2_d7c9_return_output;
     REG_VAR_fill_color := VAR_fill_color_MUX_uxn_c_l132_c2_d7c9_return_output;
     VAR_BIN_OP_AND_uxn_c_l159_c19_f461_right := VAR_fill_layer_MUX_uxn_c_l132_c2_d7c9_return_output;
     VAR_UNARY_OP_NOT_uxn_c_l158_c38_d02b_expr := VAR_fill_layer_MUX_uxn_c_l132_c2_d7c9_return_output;
     REG_VAR_fill_layer := VAR_fill_layer_MUX_uxn_c_l132_c2_d7c9_return_output;
     VAR_MUX_uxn_c_l156_c6_1c0b_iftrue := VAR_fill_x0_MUX_uxn_c_l132_c2_d7c9_return_output;
     REG_VAR_fill_x0 := VAR_fill_x0_MUX_uxn_c_l132_c2_d7c9_return_output;
     VAR_BIN_OP_EQ_uxn_c_l154_c18_c2bd_right := VAR_fill_x1_MUX_uxn_c_l132_c2_d7c9_return_output;
     REG_VAR_fill_x1 := VAR_fill_x1_MUX_uxn_c_l132_c2_d7c9_return_output;
     REG_VAR_fill_y0 := VAR_fill_y0_MUX_uxn_c_l132_c2_d7c9_return_output;
     REG_VAR_fill_y1 := VAR_fill_y1_MUX_uxn_c_l132_c2_d7c9_return_output;
     VAR_BIN_OP_AND_uxn_c_l158_c19_d071_left := VAR_is_fill_active_MUX_uxn_c_l132_c2_d7c9_return_output;
     VAR_BIN_OP_AND_uxn_c_l159_c19_f461_left := VAR_is_fill_active_MUX_uxn_c_l132_c2_d7c9_return_output;
     VAR_MUX_uxn_c_l152_c26_06b8_cond := VAR_is_fill_active_MUX_uxn_c_l132_c2_d7c9_return_output;
     VAR_MUX_uxn_c_l175_c26_3d49_cond := VAR_is_fill_active_MUX_uxn_c_l132_c2_d7c9_return_output;
     VAR_UNARY_OP_NOT_uint1_t_uxn_c_l165_l172_DUPLICATE_a58a_expr := VAR_is_fill_active_MUX_uxn_c_l132_c2_d7c9_return_output;
     REG_VAR_is_fill_top := VAR_is_fill_top_MUX_uxn_c_l132_c2_d7c9_return_output;
     VAR_BIN_OP_EQ_uxn_c_l154_c18_c2bd_left := VAR_x_MUX_uxn_c_l132_c2_d7c9_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l152_c45_12f1_right := VAR_x_MUX_uxn_c_l132_c2_d7c9_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l156_c31_3d3e_left := VAR_x_MUX_uxn_c_l132_c2_d7c9_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l152_c45_9a0b_left := VAR_y_MUX_uxn_c_l132_c2_d7c9_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l155_c22_a54e_left := VAR_y_MUX_uxn_c_l132_c2_d7c9_return_output;
     VAR_MUX_uxn_c_l155_c6_0188_iffalse := VAR_y_MUX_uxn_c_l132_c2_d7c9_return_output;
     -- BIN_OP_INFERRED_MULT[uxn_c_l152_c45_9a0b] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_c_l152_c45_9a0b_left <= VAR_BIN_OP_INFERRED_MULT_uxn_c_l152_c45_9a0b_left;
     BIN_OP_INFERRED_MULT_uxn_c_l152_c45_9a0b_right <= VAR_BIN_OP_INFERRED_MULT_uxn_c_l152_c45_9a0b_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l152_c45_9a0b_return_output := BIN_OP_INFERRED_MULT_uxn_c_l152_c45_9a0b_return_output;

     -- BIN_OP_AND[uxn_c_l159_c19_f461] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l159_c19_f461_left <= VAR_BIN_OP_AND_uxn_c_l159_c19_f461_left;
     BIN_OP_AND_uxn_c_l159_c19_f461_right <= VAR_BIN_OP_AND_uxn_c_l159_c19_f461_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l159_c19_f461_return_output := BIN_OP_AND_uxn_c_l159_c19_f461_return_output;

     -- UNARY_OP_NOT[uxn_c_l158_c38_d02b] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l158_c38_d02b_expr <= VAR_UNARY_OP_NOT_uxn_c_l158_c38_d02b_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l158_c38_d02b_return_output := UNARY_OP_NOT_uxn_c_l158_c38_d02b_return_output;

     -- UNARY_OP_NOT_uint1_t_uxn_c_l165_l172_DUPLICATE_a58a LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uint1_t_uxn_c_l165_l172_DUPLICATE_a58a_expr <= VAR_UNARY_OP_NOT_uint1_t_uxn_c_l165_l172_DUPLICATE_a58a_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uint1_t_uxn_c_l165_l172_DUPLICATE_a58a_return_output := UNARY_OP_NOT_uint1_t_uxn_c_l165_l172_DUPLICATE_a58a_return_output;

     -- BIN_OP_PLUS[uxn_c_l155_c22_a54e] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l155_c22_a54e_left <= VAR_BIN_OP_PLUS_uxn_c_l155_c22_a54e_left;
     BIN_OP_PLUS_uxn_c_l155_c22_a54e_right <= VAR_BIN_OP_PLUS_uxn_c_l155_c22_a54e_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l155_c22_a54e_return_output := BIN_OP_PLUS_uxn_c_l155_c22_a54e_return_output;

     -- BIN_OP_EQ[uxn_c_l154_c18_c2bd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l154_c18_c2bd_left <= VAR_BIN_OP_EQ_uxn_c_l154_c18_c2bd_left;
     BIN_OP_EQ_uxn_c_l154_c18_c2bd_right <= VAR_BIN_OP_EQ_uxn_c_l154_c18_c2bd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l154_c18_c2bd_return_output := BIN_OP_EQ_uxn_c_l154_c18_c2bd_return_output;

     -- BIN_OP_PLUS[uxn_c_l144_c28_0745] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l144_c28_0745_left <= VAR_BIN_OP_PLUS_uxn_c_l144_c28_0745_left;
     BIN_OP_PLUS_uxn_c_l144_c28_0745_right <= VAR_BIN_OP_PLUS_uxn_c_l144_c28_0745_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l144_c28_0745_return_output := BIN_OP_PLUS_uxn_c_l144_c28_0745_return_output;

     -- BIN_OP_PLUS[uxn_c_l156_c31_3d3e] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l156_c31_3d3e_left <= VAR_BIN_OP_PLUS_uxn_c_l156_c31_3d3e_left;
     BIN_OP_PLUS_uxn_c_l156_c31_3d3e_right <= VAR_BIN_OP_PLUS_uxn_c_l156_c31_3d3e_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l156_c31_3d3e_return_output := BIN_OP_PLUS_uxn_c_l156_c31_3d3e_return_output;

     -- Submodule level 6
     VAR_BIN_OP_OR_uxn_c_l172_c3_6336_left := VAR_BIN_OP_AND_uxn_c_l159_c19_f461_return_output;
     VAR_MUX_uxn_c_l171_c3_769b_cond := VAR_BIN_OP_AND_uxn_c_l159_c19_f461_return_output;
     REG_VAR_is_fill_pixel1 := VAR_BIN_OP_AND_uxn_c_l159_c19_f461_return_output;
     VAR_MUX_uxn_c_l154_c18_f71d_cond := VAR_BIN_OP_EQ_uxn_c_l154_c18_c2bd_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l152_c45_12f1_left := VAR_BIN_OP_INFERRED_MULT_uxn_c_l152_c45_9a0b_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l144_c28_7c6d_left := VAR_BIN_OP_PLUS_uxn_c_l144_c28_0745_return_output;
     VAR_MUX_uxn_c_l155_c6_0188_iftrue := resize(VAR_BIN_OP_PLUS_uxn_c_l155_c22_a54e_return_output, 16);
     VAR_MUX_uxn_c_l156_c6_1c0b_iffalse := resize(VAR_BIN_OP_PLUS_uxn_c_l156_c31_3d3e_return_output, 16);
     VAR_BIN_OP_AND_uxn_c_l158_c19_d071_right := VAR_UNARY_OP_NOT_uxn_c_l158_c38_d02b_return_output;
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l172_l165_DUPLICATE_039f_left := VAR_UNARY_OP_NOT_uint1_t_uxn_c_l165_l172_DUPLICATE_a58a_return_output;
     -- BIN_OP_INFERRED_MULT[uxn_c_l144_c28_7c6d] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_c_l144_c28_7c6d_left <= VAR_BIN_OP_INFERRED_MULT_uxn_c_l144_c28_7c6d_left;
     BIN_OP_INFERRED_MULT_uxn_c_l144_c28_7c6d_right <= VAR_BIN_OP_INFERRED_MULT_uxn_c_l144_c28_7c6d_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l144_c28_7c6d_return_output := BIN_OP_INFERRED_MULT_uxn_c_l144_c28_7c6d_return_output;

     -- BIN_OP_AND[uxn_c_l158_c19_d071] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l158_c19_d071_left <= VAR_BIN_OP_AND_uxn_c_l158_c19_d071_left;
     BIN_OP_AND_uxn_c_l158_c19_d071_right <= VAR_BIN_OP_AND_uxn_c_l158_c19_d071_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l158_c19_d071_return_output := BIN_OP_AND_uxn_c_l158_c19_d071_return_output;

     -- MUX[uxn_c_l154_c18_f71d] LATENCY=0
     -- Inputs
     MUX_uxn_c_l154_c18_f71d_cond <= VAR_MUX_uxn_c_l154_c18_f71d_cond;
     MUX_uxn_c_l154_c18_f71d_iftrue <= VAR_MUX_uxn_c_l154_c18_f71d_iftrue;
     MUX_uxn_c_l154_c18_f71d_iffalse <= VAR_MUX_uxn_c_l154_c18_f71d_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l154_c18_f71d_return_output := MUX_uxn_c_l154_c18_f71d_return_output;

     -- BIN_OP_PLUS[uxn_c_l152_c45_12f1] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l152_c45_12f1_left <= VAR_BIN_OP_PLUS_uxn_c_l152_c45_12f1_left;
     BIN_OP_PLUS_uxn_c_l152_c45_12f1_right <= VAR_BIN_OP_PLUS_uxn_c_l152_c45_12f1_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l152_c45_12f1_return_output := BIN_OP_PLUS_uxn_c_l152_c45_12f1_return_output;

     -- MUX[uxn_c_l171_c3_769b] LATENCY=0
     -- Inputs
     MUX_uxn_c_l171_c3_769b_cond <= VAR_MUX_uxn_c_l171_c3_769b_cond;
     MUX_uxn_c_l171_c3_769b_iftrue <= VAR_MUX_uxn_c_l171_c3_769b_iftrue;
     MUX_uxn_c_l171_c3_769b_iffalse <= VAR_MUX_uxn_c_l171_c3_769b_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l171_c3_769b_return_output := MUX_uxn_c_l171_c3_769b_return_output;

     -- BIN_OP_AND_uint1_t_uint1_t_uxn_c_l172_l165_DUPLICATE_039f LATENCY=0
     -- Inputs
     BIN_OP_AND_uint1_t_uint1_t_uxn_c_l172_l165_DUPLICATE_039f_left <= VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l172_l165_DUPLICATE_039f_left;
     BIN_OP_AND_uint1_t_uint1_t_uxn_c_l172_l165_DUPLICATE_039f_right <= VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l172_l165_DUPLICATE_039f_right;
     -- Outputs
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l172_l165_DUPLICATE_039f_return_output := BIN_OP_AND_uint1_t_uint1_t_uxn_c_l172_l165_DUPLICATE_039f_return_output;

     -- Submodule level 7
     VAR_BIN_OP_OR_uxn_c_l165_c3_be18_left := VAR_BIN_OP_AND_uxn_c_l158_c19_d071_return_output;
     VAR_MUX_uxn_c_l164_c3_b13c_cond := VAR_BIN_OP_AND_uxn_c_l158_c19_d071_return_output;
     REG_VAR_is_fill_pixel0 := VAR_BIN_OP_AND_uxn_c_l158_c19_d071_return_output;
     VAR_BIN_OP_AND_uxn_c_l165_c22_1c1b_left := VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l172_l165_DUPLICATE_039f_return_output;
     VAR_BIN_OP_AND_uxn_c_l172_c22_0c76_left := VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l172_l165_DUPLICATE_039f_return_output;
     VAR_fill_pixels_remaining_uxn_c_l144_c3_f6c9 := resize(VAR_BIN_OP_INFERRED_MULT_uxn_c_l144_c28_7c6d_return_output, 16);
     VAR_MUX_uxn_c_l152_c26_06b8_iftrue := resize(VAR_BIN_OP_PLUS_uxn_c_l152_c45_12f1_return_output, 16);
     VAR_MUX_uxn_c_l155_c6_0188_cond := VAR_MUX_uxn_c_l154_c18_f71d_return_output;
     VAR_MUX_uxn_c_l156_c6_1c0b_cond := VAR_MUX_uxn_c_l154_c18_f71d_return_output;
     REG_VAR_is_fill_left := VAR_MUX_uxn_c_l154_c18_f71d_return_output;
     VAR_fg_vram_update_uxn_c_l168_c19_3773_write_value := VAR_MUX_uxn_c_l171_c3_769b_return_output;
     VAR_fill_pixels_remaining_MUX_uxn_c_l132_c2_d7c9_iftrue := VAR_fill_pixels_remaining_uxn_c_l144_c3_f6c9;
     -- MUX[uxn_c_l152_c26_06b8] LATENCY=0
     -- Inputs
     MUX_uxn_c_l152_c26_06b8_cond <= VAR_MUX_uxn_c_l152_c26_06b8_cond;
     MUX_uxn_c_l152_c26_06b8_iftrue <= VAR_MUX_uxn_c_l152_c26_06b8_iftrue;
     MUX_uxn_c_l152_c26_06b8_iffalse <= VAR_MUX_uxn_c_l152_c26_06b8_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l152_c26_06b8_return_output := MUX_uxn_c_l152_c26_06b8_return_output;

     -- MUX[uxn_c_l164_c3_b13c] LATENCY=0
     -- Inputs
     MUX_uxn_c_l164_c3_b13c_cond <= VAR_MUX_uxn_c_l164_c3_b13c_cond;
     MUX_uxn_c_l164_c3_b13c_iftrue <= VAR_MUX_uxn_c_l164_c3_b13c_iftrue;
     MUX_uxn_c_l164_c3_b13c_iffalse <= VAR_MUX_uxn_c_l164_c3_b13c_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l164_c3_b13c_return_output := MUX_uxn_c_l164_c3_b13c_return_output;

     -- MUX[uxn_c_l156_c6_1c0b] LATENCY=0
     -- Inputs
     MUX_uxn_c_l156_c6_1c0b_cond <= VAR_MUX_uxn_c_l156_c6_1c0b_cond;
     MUX_uxn_c_l156_c6_1c0b_iftrue <= VAR_MUX_uxn_c_l156_c6_1c0b_iftrue;
     MUX_uxn_c_l156_c6_1c0b_iffalse <= VAR_MUX_uxn_c_l156_c6_1c0b_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l156_c6_1c0b_return_output := MUX_uxn_c_l156_c6_1c0b_return_output;

     -- MUX[uxn_c_l155_c6_0188] LATENCY=0
     -- Inputs
     MUX_uxn_c_l155_c6_0188_cond <= VAR_MUX_uxn_c_l155_c6_0188_cond;
     MUX_uxn_c_l155_c6_0188_iftrue <= VAR_MUX_uxn_c_l155_c6_0188_iftrue;
     MUX_uxn_c_l155_c6_0188_iffalse <= VAR_MUX_uxn_c_l155_c6_0188_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l155_c6_0188_return_output := MUX_uxn_c_l155_c6_0188_return_output;

     -- BIN_OP_AND[uxn_c_l172_c22_0c76] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l172_c22_0c76_left <= VAR_BIN_OP_AND_uxn_c_l172_c22_0c76_left;
     BIN_OP_AND_uxn_c_l172_c22_0c76_right <= VAR_BIN_OP_AND_uxn_c_l172_c22_0c76_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l172_c22_0c76_return_output := BIN_OP_AND_uxn_c_l172_c22_0c76_return_output;

     -- fill_pixels_remaining_MUX[uxn_c_l132_c2_d7c9] LATENCY=0
     -- Inputs
     fill_pixels_remaining_MUX_uxn_c_l132_c2_d7c9_cond <= VAR_fill_pixels_remaining_MUX_uxn_c_l132_c2_d7c9_cond;
     fill_pixels_remaining_MUX_uxn_c_l132_c2_d7c9_iftrue <= VAR_fill_pixels_remaining_MUX_uxn_c_l132_c2_d7c9_iftrue;
     fill_pixels_remaining_MUX_uxn_c_l132_c2_d7c9_iffalse <= VAR_fill_pixels_remaining_MUX_uxn_c_l132_c2_d7c9_iffalse;
     -- Outputs
     VAR_fill_pixels_remaining_MUX_uxn_c_l132_c2_d7c9_return_output := fill_pixels_remaining_MUX_uxn_c_l132_c2_d7c9_return_output;

     -- BIN_OP_AND[uxn_c_l165_c22_1c1b] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l165_c22_1c1b_left <= VAR_BIN_OP_AND_uxn_c_l165_c22_1c1b_left;
     BIN_OP_AND_uxn_c_l165_c22_1c1b_right <= VAR_BIN_OP_AND_uxn_c_l165_c22_1c1b_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l165_c22_1c1b_return_output := BIN_OP_AND_uxn_c_l165_c22_1c1b_return_output;

     -- Submodule level 8
     VAR_BIN_OP_OR_uxn_c_l165_c3_be18_right := VAR_BIN_OP_AND_uxn_c_l165_c22_1c1b_return_output;
     VAR_BIN_OP_OR_uxn_c_l172_c3_6336_right := VAR_BIN_OP_AND_uxn_c_l172_c22_0c76_return_output;
     REG_VAR_adjusted_vram_address := VAR_MUX_uxn_c_l152_c26_06b8_return_output;
     VAR_bg_vram_update_uxn_c_l161_c19_ec32_write_address := VAR_MUX_uxn_c_l152_c26_06b8_return_output;
     VAR_fg_vram_update_uxn_c_l168_c19_3773_write_address := VAR_MUX_uxn_c_l152_c26_06b8_return_output;
     REG_VAR_y := VAR_MUX_uxn_c_l155_c6_0188_return_output;
     REG_VAR_x := VAR_MUX_uxn_c_l156_c6_1c0b_return_output;
     VAR_bg_vram_update_uxn_c_l161_c19_ec32_write_value := VAR_MUX_uxn_c_l164_c3_b13c_return_output;
     VAR_BIN_OP_MINUS_uxn_c_l175_c43_a106_left := VAR_fill_pixels_remaining_MUX_uxn_c_l132_c2_d7c9_return_output;
     -- BIN_OP_OR[uxn_c_l172_c3_6336] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l172_c3_6336_left <= VAR_BIN_OP_OR_uxn_c_l172_c3_6336_left;
     BIN_OP_OR_uxn_c_l172_c3_6336_right <= VAR_BIN_OP_OR_uxn_c_l172_c3_6336_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l172_c3_6336_return_output := BIN_OP_OR_uxn_c_l172_c3_6336_return_output;

     -- BIN_OP_MINUS[uxn_c_l175_c43_a106] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l175_c43_a106_left <= VAR_BIN_OP_MINUS_uxn_c_l175_c43_a106_left;
     BIN_OP_MINUS_uxn_c_l175_c43_a106_right <= VAR_BIN_OP_MINUS_uxn_c_l175_c43_a106_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l175_c43_a106_return_output := BIN_OP_MINUS_uxn_c_l175_c43_a106_return_output;

     -- BIN_OP_OR[uxn_c_l165_c3_be18] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l165_c3_be18_left <= VAR_BIN_OP_OR_uxn_c_l165_c3_be18_left;
     BIN_OP_OR_uxn_c_l165_c3_be18_right <= VAR_BIN_OP_OR_uxn_c_l165_c3_be18_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l165_c3_be18_return_output := BIN_OP_OR_uxn_c_l165_c3_be18_return_output;

     -- Submodule level 9
     VAR_MUX_uxn_c_l175_c26_3d49_iftrue := VAR_BIN_OP_MINUS_uxn_c_l175_c43_a106_return_output;
     VAR_bg_vram_update_uxn_c_l161_c19_ec32_write_enable := VAR_BIN_OP_OR_uxn_c_l165_c3_be18_return_output;
     VAR_fg_vram_update_uxn_c_l168_c19_3773_write_enable := VAR_BIN_OP_OR_uxn_c_l172_c3_6336_return_output;
     -- MUX[uxn_c_l175_c26_3d49] LATENCY=0
     -- Inputs
     MUX_uxn_c_l175_c26_3d49_cond <= VAR_MUX_uxn_c_l175_c26_3d49_cond;
     MUX_uxn_c_l175_c26_3d49_iftrue <= VAR_MUX_uxn_c_l175_c26_3d49_iftrue;
     MUX_uxn_c_l175_c26_3d49_iffalse <= VAR_MUX_uxn_c_l175_c26_3d49_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l175_c26_3d49_return_output := MUX_uxn_c_l175_c26_3d49_return_output;

     -- fg_vram_update[uxn_c_l168_c19_3773] LATENCY=0
     -- Clock enable
     fg_vram_update_uxn_c_l168_c19_3773_CLOCK_ENABLE <= VAR_fg_vram_update_uxn_c_l168_c19_3773_CLOCK_ENABLE;
     -- Inputs
     fg_vram_update_uxn_c_l168_c19_3773_read_address <= VAR_fg_vram_update_uxn_c_l168_c19_3773_read_address;
     fg_vram_update_uxn_c_l168_c19_3773_write_address <= VAR_fg_vram_update_uxn_c_l168_c19_3773_write_address;
     fg_vram_update_uxn_c_l168_c19_3773_write_value <= VAR_fg_vram_update_uxn_c_l168_c19_3773_write_value;
     fg_vram_update_uxn_c_l168_c19_3773_write_enable <= VAR_fg_vram_update_uxn_c_l168_c19_3773_write_enable;
     -- Outputs
     VAR_fg_vram_update_uxn_c_l168_c19_3773_return_output := fg_vram_update_uxn_c_l168_c19_3773_return_output;

     -- bg_vram_update[uxn_c_l161_c19_ec32] LATENCY=0
     -- Clock enable
     bg_vram_update_uxn_c_l161_c19_ec32_CLOCK_ENABLE <= VAR_bg_vram_update_uxn_c_l161_c19_ec32_CLOCK_ENABLE;
     -- Inputs
     bg_vram_update_uxn_c_l161_c19_ec32_read_address <= VAR_bg_vram_update_uxn_c_l161_c19_ec32_read_address;
     bg_vram_update_uxn_c_l161_c19_ec32_write_address <= VAR_bg_vram_update_uxn_c_l161_c19_ec32_write_address;
     bg_vram_update_uxn_c_l161_c19_ec32_write_value <= VAR_bg_vram_update_uxn_c_l161_c19_ec32_write_value;
     bg_vram_update_uxn_c_l161_c19_ec32_write_enable <= VAR_bg_vram_update_uxn_c_l161_c19_ec32_write_enable;
     -- Outputs
     VAR_bg_vram_update_uxn_c_l161_c19_ec32_return_output := bg_vram_update_uxn_c_l161_c19_ec32_return_output;

     -- Submodule level 10
     VAR_BIN_OP_EQ_uxn_c_l176_c19_a706_left := VAR_MUX_uxn_c_l175_c26_3d49_return_output;
     REG_VAR_fill_pixels_remaining := VAR_MUX_uxn_c_l175_c26_3d49_return_output;
     VAR_MUX_uxn_c_l179_c17_7282_iftrue := VAR_bg_vram_update_uxn_c_l161_c19_ec32_return_output;
     REG_VAR_bg_pixel_color := VAR_bg_vram_update_uxn_c_l161_c19_ec32_return_output;
     VAR_BIN_OP_EQ_uxn_c_l179_c17_3f1c_left := VAR_fg_vram_update_uxn_c_l168_c19_3773_return_output;
     VAR_MUX_uxn_c_l179_c17_7282_iffalse := VAR_fg_vram_update_uxn_c_l168_c19_3773_return_output;
     REG_VAR_fg_pixel_color := VAR_fg_vram_update_uxn_c_l168_c19_3773_return_output;
     -- BIN_OP_EQ[uxn_c_l179_c17_3f1c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l179_c17_3f1c_left <= VAR_BIN_OP_EQ_uxn_c_l179_c17_3f1c_left;
     BIN_OP_EQ_uxn_c_l179_c17_3f1c_right <= VAR_BIN_OP_EQ_uxn_c_l179_c17_3f1c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l179_c17_3f1c_return_output := BIN_OP_EQ_uxn_c_l179_c17_3f1c_return_output;

     -- BIN_OP_EQ[uxn_c_l176_c19_a706] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l176_c19_a706_left <= VAR_BIN_OP_EQ_uxn_c_l176_c19_a706_left;
     BIN_OP_EQ_uxn_c_l176_c19_a706_right <= VAR_BIN_OP_EQ_uxn_c_l176_c19_a706_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l176_c19_a706_return_output := BIN_OP_EQ_uxn_c_l176_c19_a706_return_output;

     -- Submodule level 11
     VAR_MUX_uxn_c_l176_c19_b09d_cond := VAR_BIN_OP_EQ_uxn_c_l176_c19_a706_return_output;
     VAR_MUX_uxn_c_l179_c17_7282_cond := VAR_BIN_OP_EQ_uxn_c_l179_c17_3f1c_return_output;
     -- MUX[uxn_c_l179_c17_7282] LATENCY=0
     -- Inputs
     MUX_uxn_c_l179_c17_7282_cond <= VAR_MUX_uxn_c_l179_c17_7282_cond;
     MUX_uxn_c_l179_c17_7282_iftrue <= VAR_MUX_uxn_c_l179_c17_7282_iftrue;
     MUX_uxn_c_l179_c17_7282_iffalse <= VAR_MUX_uxn_c_l179_c17_7282_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l179_c17_7282_return_output := MUX_uxn_c_l179_c17_7282_return_output;

     -- MUX[uxn_c_l176_c19_b09d] LATENCY=0
     -- Inputs
     MUX_uxn_c_l176_c19_b09d_cond <= VAR_MUX_uxn_c_l176_c19_b09d_cond;
     MUX_uxn_c_l176_c19_b09d_iftrue <= VAR_MUX_uxn_c_l176_c19_b09d_iftrue;
     MUX_uxn_c_l176_c19_b09d_iffalse <= VAR_MUX_uxn_c_l176_c19_b09d_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l176_c19_b09d_return_output := MUX_uxn_c_l176_c19_b09d_return_output;

     -- Submodule level 12
     REG_VAR_is_fill_active := VAR_MUX_uxn_c_l176_c19_b09d_return_output;
     -- CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_269d_uxn_c_l182_l115_DUPLICATE_e7de LATENCY=0
     VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_269d_uxn_c_l182_l115_DUPLICATE_e7de_return_output := CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_269d(
     VAR_MUX_uxn_c_l178_c25_bc61_return_output,
     VAR_MUX_uxn_c_l179_c17_7282_return_output,
     VAR_MUX_uxn_c_l176_c19_b09d_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_269d_uxn_c_l182_l115_DUPLICATE_e7de_return_output;
     VAR_return_output := VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_269d_uxn_c_l182_l115_DUPLICATE_e7de_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_result <= REG_VAR_result;
REG_COMB_adjusted_vram_address <= REG_VAR_adjusted_vram_address;
REG_COMB_fill_pixels_remaining <= REG_VAR_fill_pixels_remaining;
REG_COMB_fill_x0 <= REG_VAR_fill_x0;
REG_COMB_fill_y0 <= REG_VAR_fill_y0;
REG_COMB_fill_x1 <= REG_VAR_fill_x1;
REG_COMB_fill_y1 <= REG_VAR_fill_y1;
REG_COMB_fill_color <= REG_VAR_fill_color;
REG_COMB_is_fill_active <= REG_VAR_is_fill_active;
REG_COMB_is_fill_left <= REG_VAR_is_fill_left;
REG_COMB_is_fill_top <= REG_VAR_is_fill_top;
REG_COMB_is_fill_pixel0 <= REG_VAR_is_fill_pixel0;
REG_COMB_is_fill_pixel1 <= REG_VAR_is_fill_pixel1;
REG_COMB_fill_layer <= REG_VAR_fill_layer;
REG_COMB_is_fill_code <= REG_VAR_is_fill_code;
REG_COMB_fg_pixel_color <= REG_VAR_fg_pixel_color;
REG_COMB_bg_pixel_color <= REG_VAR_bg_pixel_color;
REG_COMB_pixel_counter <= REG_VAR_pixel_counter;
REG_COMB_x <= REG_VAR_x;
REG_COMB_y <= REG_VAR_y;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     result <= REG_COMB_result;
     adjusted_vram_address <= REG_COMB_adjusted_vram_address;
     fill_pixels_remaining <= REG_COMB_fill_pixels_remaining;
     fill_x0 <= REG_COMB_fill_x0;
     fill_y0 <= REG_COMB_fill_y0;
     fill_x1 <= REG_COMB_fill_x1;
     fill_y1 <= REG_COMB_fill_y1;
     fill_color <= REG_COMB_fill_color;
     is_fill_active <= REG_COMB_is_fill_active;
     is_fill_left <= REG_COMB_is_fill_left;
     is_fill_top <= REG_COMB_is_fill_top;
     is_fill_pixel0 <= REG_COMB_is_fill_pixel0;
     is_fill_pixel1 <= REG_COMB_is_fill_pixel1;
     fill_layer <= REG_COMB_fill_layer;
     is_fill_code <= REG_COMB_is_fill_code;
     fg_pixel_color <= REG_COMB_fg_pixel_color;
     bg_pixel_color <= REG_COMB_bg_pixel_color;
     pixel_counter <= REG_COMB_pixel_counter;
     x <= REG_COMB_x;
     y <= REG_COMB_y;
 end if;
 end if;
end process;

end arch;
