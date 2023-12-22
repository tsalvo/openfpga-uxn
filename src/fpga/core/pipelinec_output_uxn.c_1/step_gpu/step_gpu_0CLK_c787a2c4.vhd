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
-- Submodules: 66
entity step_gpu_0CLK_c787a2c4 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 is_active_drawing_area : in unsigned(0 downto 0);
 is_vram_write : in unsigned(0 downto 0);
 vram_write_layer : in unsigned(0 downto 0);
 vram_address : in unsigned(15 downto 0);
 vram_value : in unsigned(7 downto 0);
 return_output : out gpu_step_result_t);
end step_gpu_0CLK_c787a2c4;
architecture arch of step_gpu_0CLK_c787a2c4 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal fill_pixels_remaining : unsigned(15 downto 0) := to_unsigned(0, 16);
signal fill_x0 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal fill_y0 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal fill_x1 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal fill_y1 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal fill_color : unsigned(1 downto 0) := to_unsigned(0, 2);
signal is_fill_active : unsigned(0 downto 0) := to_unsigned(0, 1);
signal fill_layer : unsigned(0 downto 0) := to_unsigned(0, 1);
signal pixel_counter : unsigned(15 downto 0) := to_unsigned(0, 16);
signal x : unsigned(15 downto 0) := to_unsigned(0, 16);
signal y : unsigned(15 downto 0) := to_unsigned(0, 16);
signal REG_COMB_fill_pixels_remaining : unsigned(15 downto 0);
signal REG_COMB_fill_x0 : unsigned(15 downto 0);
signal REG_COMB_fill_y0 : unsigned(15 downto 0);
signal REG_COMB_fill_x1 : unsigned(15 downto 0);
signal REG_COMB_fill_y1 : unsigned(15 downto 0);
signal REG_COMB_fill_color : unsigned(1 downto 0);
signal REG_COMB_is_fill_active : unsigned(0 downto 0);
signal REG_COMB_fill_layer : unsigned(0 downto 0);
signal REG_COMB_pixel_counter : unsigned(15 downto 0);
signal REG_COMB_x : unsigned(15 downto 0);
signal REG_COMB_y : unsigned(15 downto 0);

-- Each function instance gets signals
-- CONST_SR_4[uxn_c_l126_c52_6832]
signal CONST_SR_4_uxn_c_l126_c52_6832_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_c_l126_c52_6832_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_c_l126_c25_cd45]
signal BIN_OP_AND_uxn_c_l126_c25_cd45_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l126_c25_cd45_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l126_c25_cd45_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_c_l129_c22_44ac]
signal UNARY_OP_NOT_uxn_c_l129_c22_44ac_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l129_c22_44ac_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l129_c6_3d4c]
signal BIN_OP_AND_uxn_c_l129_c6_3d4c_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l129_c6_3d4c_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l129_c6_3d4c_return_output : unsigned(0 downto 0);

-- fill_color_MUX[uxn_c_l129_c2_21fb]
signal fill_color_MUX_uxn_c_l129_c2_21fb_cond : unsigned(0 downto 0);
signal fill_color_MUX_uxn_c_l129_c2_21fb_iftrue : unsigned(1 downto 0);
signal fill_color_MUX_uxn_c_l129_c2_21fb_iffalse : unsigned(1 downto 0);
signal fill_color_MUX_uxn_c_l129_c2_21fb_return_output : unsigned(1 downto 0);

-- y_MUX[uxn_c_l129_c2_21fb]
signal y_MUX_uxn_c_l129_c2_21fb_cond : unsigned(0 downto 0);
signal y_MUX_uxn_c_l129_c2_21fb_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_c_l129_c2_21fb_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_c_l129_c2_21fb_return_output : unsigned(15 downto 0);

-- fill_layer_MUX[uxn_c_l129_c2_21fb]
signal fill_layer_MUX_uxn_c_l129_c2_21fb_cond : unsigned(0 downto 0);
signal fill_layer_MUX_uxn_c_l129_c2_21fb_iftrue : unsigned(0 downto 0);
signal fill_layer_MUX_uxn_c_l129_c2_21fb_iffalse : unsigned(0 downto 0);
signal fill_layer_MUX_uxn_c_l129_c2_21fb_return_output : unsigned(0 downto 0);

-- fill_y1_MUX[uxn_c_l129_c2_21fb]
signal fill_y1_MUX_uxn_c_l129_c2_21fb_cond : unsigned(0 downto 0);
signal fill_y1_MUX_uxn_c_l129_c2_21fb_iftrue : unsigned(15 downto 0);
signal fill_y1_MUX_uxn_c_l129_c2_21fb_iffalse : unsigned(15 downto 0);
signal fill_y1_MUX_uxn_c_l129_c2_21fb_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_c_l129_c2_21fb]
signal x_MUX_uxn_c_l129_c2_21fb_cond : unsigned(0 downto 0);
signal x_MUX_uxn_c_l129_c2_21fb_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_c_l129_c2_21fb_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_c_l129_c2_21fb_return_output : unsigned(15 downto 0);

-- fill_pixels_remaining_MUX[uxn_c_l129_c2_21fb]
signal fill_pixels_remaining_MUX_uxn_c_l129_c2_21fb_cond : unsigned(0 downto 0);
signal fill_pixels_remaining_MUX_uxn_c_l129_c2_21fb_iftrue : unsigned(15 downto 0);
signal fill_pixels_remaining_MUX_uxn_c_l129_c2_21fb_iffalse : unsigned(15 downto 0);
signal fill_pixels_remaining_MUX_uxn_c_l129_c2_21fb_return_output : unsigned(15 downto 0);

-- is_fill_active_MUX[uxn_c_l129_c2_21fb]
signal is_fill_active_MUX_uxn_c_l129_c2_21fb_cond : unsigned(0 downto 0);
signal is_fill_active_MUX_uxn_c_l129_c2_21fb_iftrue : unsigned(0 downto 0);
signal is_fill_active_MUX_uxn_c_l129_c2_21fb_iffalse : unsigned(0 downto 0);
signal is_fill_active_MUX_uxn_c_l129_c2_21fb_return_output : unsigned(0 downto 0);

-- fill_y0_MUX[uxn_c_l129_c2_21fb]
signal fill_y0_MUX_uxn_c_l129_c2_21fb_cond : unsigned(0 downto 0);
signal fill_y0_MUX_uxn_c_l129_c2_21fb_iftrue : unsigned(15 downto 0);
signal fill_y0_MUX_uxn_c_l129_c2_21fb_iffalse : unsigned(15 downto 0);
signal fill_y0_MUX_uxn_c_l129_c2_21fb_return_output : unsigned(15 downto 0);

-- fill_x1_MUX[uxn_c_l129_c2_21fb]
signal fill_x1_MUX_uxn_c_l129_c2_21fb_cond : unsigned(0 downto 0);
signal fill_x1_MUX_uxn_c_l129_c2_21fb_iftrue : unsigned(15 downto 0);
signal fill_x1_MUX_uxn_c_l129_c2_21fb_iffalse : unsigned(15 downto 0);
signal fill_x1_MUX_uxn_c_l129_c2_21fb_return_output : unsigned(15 downto 0);

-- fill_x0_MUX[uxn_c_l129_c2_21fb]
signal fill_x0_MUX_uxn_c_l129_c2_21fb_cond : unsigned(0 downto 0);
signal fill_x0_MUX_uxn_c_l129_c2_21fb_iftrue : unsigned(15 downto 0);
signal fill_x0_MUX_uxn_c_l129_c2_21fb_iffalse : unsigned(15 downto 0);
signal fill_x0_MUX_uxn_c_l129_c2_21fb_return_output : unsigned(15 downto 0);

-- CONST_SR_2[uxn_c_l131_c25_0fea]
signal CONST_SR_2_uxn_c_l131_c25_0fea_x : unsigned(7 downto 0);
signal CONST_SR_2_uxn_c_l131_c25_0fea_return_output : unsigned(7 downto 0);

-- CONST_SR_3[uxn_c_l132_c26_7a4c]
signal CONST_SR_3_uxn_c_l132_c26_7a4c_x : unsigned(7 downto 0);
signal CONST_SR_3_uxn_c_l132_c26_7a4c_return_output : unsigned(7 downto 0);

-- BIN_OP_DIV[uxn_c_l133_c13_f413]
signal BIN_OP_DIV_uxn_c_l133_c13_f413_left : unsigned(15 downto 0);
signal BIN_OP_DIV_uxn_c_l133_c13_f413_right : unsigned(8 downto 0);
signal BIN_OP_DIV_uxn_c_l133_c13_f413_return_output : unsigned(15 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_c_l134_c29_f94b]
signal BIN_OP_INFERRED_MULT_uxn_c_l134_c29_f94b_left : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_c_l134_c29_f94b_right : unsigned(8 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_c_l134_c29_f94b_return_output : unsigned(24 downto 0);

-- BIN_OP_MINUS[uxn_c_l134_c13_ca33]
signal BIN_OP_MINUS_uxn_c_l134_c13_ca33_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_c_l134_c13_ca33_right : unsigned(24 downto 0);
signal BIN_OP_MINUS_uxn_c_l134_c13_ca33_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l135_c13_51e4]
signal MUX_uxn_c_l135_c13_51e4_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l135_c13_51e4_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l135_c13_51e4_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l135_c13_51e4_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l136_c13_7212]
signal MUX_uxn_c_l136_c13_7212_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l136_c13_7212_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l136_c13_7212_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l136_c13_7212_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l137_c13_1413]
signal MUX_uxn_c_l137_c13_1413_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l137_c13_1413_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l137_c13_1413_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l137_c13_1413_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l138_c13_5c03]
signal MUX_uxn_c_l138_c13_5c03_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l138_c13_5c03_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l138_c13_5c03_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l138_c13_5c03_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_c_l141_c28_8b04]
signal BIN_OP_MINUS_uxn_c_l141_c28_8b04_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_c_l141_c28_8b04_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_c_l141_c28_8b04_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_c_l141_c28_0acc]
signal BIN_OP_PLUS_uxn_c_l141_c28_0acc_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l141_c28_0acc_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l141_c28_0acc_return_output : unsigned(16 downto 0);

-- BIN_OP_MINUS[uxn_c_l141_c54_3aee]
signal BIN_OP_MINUS_uxn_c_l141_c54_3aee_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_c_l141_c54_3aee_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_c_l141_c54_3aee_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_c_l141_c54_a9f8]
signal BIN_OP_PLUS_uxn_c_l141_c54_a9f8_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l141_c54_a9f8_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l141_c54_a9f8_return_output : unsigned(16 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_c_l141_c28_f55d]
signal BIN_OP_INFERRED_MULT_uxn_c_l141_c28_f55d_left : unsigned(16 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_c_l141_c28_f55d_right : unsigned(16 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_c_l141_c28_f55d_return_output : unsigned(33 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_c_l149_c54_0830]
signal BIN_OP_INFERRED_MULT_uxn_c_l149_c54_0830_left : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_c_l149_c54_0830_right : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_c_l149_c54_0830_return_output : unsigned(31 downto 0);

-- BIN_OP_PLUS[uxn_c_l149_c54_1a6c]
signal BIN_OP_PLUS_uxn_c_l149_c54_1a6c_left : unsigned(31 downto 0);
signal BIN_OP_PLUS_uxn_c_l149_c54_1a6c_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l149_c54_1a6c_return_output : unsigned(32 downto 0);

-- MUX[uxn_c_l149_c35_6c41]
signal MUX_uxn_c_l149_c35_6c41_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l149_c35_6c41_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l149_c35_6c41_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l149_c35_6c41_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l151_c29_c23f]
signal BIN_OP_EQ_uxn_c_l151_c29_c23f_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l151_c29_c23f_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l151_c29_c23f_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l151_c29_be88]
signal MUX_uxn_c_l151_c29_be88_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l151_c29_be88_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l151_c29_be88_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l151_c29_be88_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l152_c25_060b]
signal BIN_OP_PLUS_uxn_c_l152_c25_060b_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l152_c25_060b_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l152_c25_060b_return_output : unsigned(16 downto 0);

-- MUX[uxn_c_l152_c6_4b3e]
signal MUX_uxn_c_l152_c6_4b3e_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l152_c6_4b3e_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l152_c6_4b3e_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l152_c6_4b3e_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_c_l153_c34_74c3]
signal BIN_OP_PLUS_uxn_c_l153_c34_74c3_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l153_c34_74c3_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l153_c34_74c3_return_output : unsigned(16 downto 0);

-- MUX[uxn_c_l153_c6_2797]
signal MUX_uxn_c_l153_c6_2797_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l153_c6_2797_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l153_c6_2797_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l153_c6_2797_return_output : unsigned(15 downto 0);

-- UNARY_OP_NOT[uxn_c_l155_c46_cf0c]
signal UNARY_OP_NOT_uxn_c_l155_c46_cf0c_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l155_c46_cf0c_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l155_c27_0d31]
signal BIN_OP_AND_uxn_c_l155_c27_0d31_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l155_c27_0d31_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l155_c27_0d31_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l156_c27_8aaf]
signal BIN_OP_AND_uxn_c_l156_c27_8aaf_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l156_c27_8aaf_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l156_c27_8aaf_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l161_c3_b555]
signal MUX_uxn_c_l161_c3_b555_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l161_c3_b555_iftrue : unsigned(1 downto 0);
signal MUX_uxn_c_l161_c3_b555_iffalse : unsigned(1 downto 0);
signal MUX_uxn_c_l161_c3_b555_return_output : unsigned(1 downto 0);

-- UNARY_OP_NOT[uxn_c_l162_c57_8206]
signal UNARY_OP_NOT_uxn_c_l162_c57_8206_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l162_c57_8206_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l162_c22_9452]
signal BIN_OP_AND_uxn_c_l162_c22_9452_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l162_c22_9452_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l162_c22_9452_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_c_l162_c3_870e]
signal BIN_OP_OR_uxn_c_l162_c3_870e_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l162_c3_870e_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l162_c3_870e_return_output : unsigned(0 downto 0);

-- bg_vram_update[uxn_c_l158_c27_ad56]
signal bg_vram_update_uxn_c_l158_c27_ad56_CLOCK_ENABLE : unsigned(0 downto 0);
signal bg_vram_update_uxn_c_l158_c27_ad56_read_address : unsigned(15 downto 0);
signal bg_vram_update_uxn_c_l158_c27_ad56_write_address : unsigned(15 downto 0);
signal bg_vram_update_uxn_c_l158_c27_ad56_write_value : unsigned(1 downto 0);
signal bg_vram_update_uxn_c_l158_c27_ad56_write_enable : unsigned(0 downto 0);
signal bg_vram_update_uxn_c_l158_c27_ad56_return_output : unsigned(1 downto 0);

-- MUX[uxn_c_l168_c3_c168]
signal MUX_uxn_c_l168_c3_c168_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l168_c3_c168_iftrue : unsigned(1 downto 0);
signal MUX_uxn_c_l168_c3_c168_iffalse : unsigned(1 downto 0);
signal MUX_uxn_c_l168_c3_c168_return_output : unsigned(1 downto 0);

-- BIN_OP_AND[uxn_c_l169_c22_4521]
signal BIN_OP_AND_uxn_c_l169_c22_4521_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l169_c22_4521_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l169_c22_4521_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_c_l169_c3_1298]
signal BIN_OP_OR_uxn_c_l169_c3_1298_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l169_c3_1298_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l169_c3_1298_return_output : unsigned(0 downto 0);

-- fg_vram_update[uxn_c_l165_c27_8a12]
signal fg_vram_update_uxn_c_l165_c27_8a12_CLOCK_ENABLE : unsigned(0 downto 0);
signal fg_vram_update_uxn_c_l165_c27_8a12_read_address : unsigned(15 downto 0);
signal fg_vram_update_uxn_c_l165_c27_8a12_write_address : unsigned(15 downto 0);
signal fg_vram_update_uxn_c_l165_c27_8a12_write_value : unsigned(1 downto 0);
signal fg_vram_update_uxn_c_l165_c27_8a12_write_enable : unsigned(0 downto 0);
signal fg_vram_update_uxn_c_l165_c27_8a12_return_output : unsigned(1 downto 0);

-- BIN_OP_MINUS[uxn_c_l172_c43_1197]
signal BIN_OP_MINUS_uxn_c_l172_c43_1197_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_c_l172_c43_1197_right : unsigned(0 downto 0);
signal BIN_OP_MINUS_uxn_c_l172_c43_1197_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l172_c26_badd]
signal MUX_uxn_c_l172_c26_badd_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l172_c26_badd_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l172_c26_badd_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l172_c26_badd_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l173_c19_9bde]
signal BIN_OP_EQ_uxn_c_l173_c19_9bde_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l173_c19_9bde_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l173_c19_9bde_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l173_c19_81a5]
signal MUX_uxn_c_l173_c19_81a5_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l173_c19_81a5_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l173_c19_81a5_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l173_c19_81a5_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l174_c19_e1a2]
signal BIN_OP_EQ_uxn_c_l174_c19_e1a2_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l174_c19_e1a2_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l174_c19_e1a2_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l174_c76_8bf1]
signal BIN_OP_PLUS_uxn_c_l174_c76_8bf1_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l174_c76_8bf1_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l174_c76_8bf1_return_output : unsigned(16 downto 0);

-- MUX[uxn_c_l174_c50_b617]
signal MUX_uxn_c_l174_c50_b617_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l174_c50_b617_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l174_c50_b617_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l174_c50_b617_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l174_c19_a4db]
signal MUX_uxn_c_l174_c19_a4db_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l174_c19_a4db_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l174_c19_a4db_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l174_c19_a4db_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l175_c25_2f41]
signal BIN_OP_EQ_uxn_c_l175_c25_2f41_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l175_c25_2f41_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l175_c25_2f41_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l175_c25_3226]
signal MUX_uxn_c_l175_c25_3226_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l175_c25_3226_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l175_c25_3226_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l175_c25_3226_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l176_c17_8e5b]
signal BIN_OP_EQ_uxn_c_l176_c17_8e5b_left : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l176_c17_8e5b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l176_c17_8e5b_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l176_c17_970b]
signal MUX_uxn_c_l176_c17_970b_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l176_c17_970b_iftrue : unsigned(1 downto 0);
signal MUX_uxn_c_l176_c17_970b_iffalse : unsigned(1 downto 0);
signal MUX_uxn_c_l176_c17_970b_return_output : unsigned(1 downto 0);

-- UNARY_OP_NOT_uint1_t_uxn_c_l162_l169_DUPLICATE_e099
signal UNARY_OP_NOT_uint1_t_uxn_c_l162_l169_DUPLICATE_e099_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uint1_t_uxn_c_l162_l169_DUPLICATE_e099_return_output : unsigned(0 downto 0);

-- BIN_OP_AND_uint1_t_uint1_t_uxn_c_l162_l169_DUPLICATE_8822
signal BIN_OP_AND_uint1_t_uint1_t_uxn_c_l162_l169_DUPLICATE_8822_left : unsigned(0 downto 0);
signal BIN_OP_AND_uint1_t_uint1_t_uxn_c_l162_l169_DUPLICATE_8822_right : unsigned(0 downto 0);
signal BIN_OP_AND_uint1_t_uint1_t_uxn_c_l162_l169_DUPLICATE_8822_return_output : unsigned(0 downto 0);

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
-- CONST_SR_4_uxn_c_l126_c52_6832
CONST_SR_4_uxn_c_l126_c52_6832 : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_c_l126_c52_6832_x,
CONST_SR_4_uxn_c_l126_c52_6832_return_output);

-- BIN_OP_AND_uxn_c_l126_c25_cd45
BIN_OP_AND_uxn_c_l126_c25_cd45 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l126_c25_cd45_left,
BIN_OP_AND_uxn_c_l126_c25_cd45_right,
BIN_OP_AND_uxn_c_l126_c25_cd45_return_output);

-- UNARY_OP_NOT_uxn_c_l129_c22_44ac
UNARY_OP_NOT_uxn_c_l129_c22_44ac : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l129_c22_44ac_expr,
UNARY_OP_NOT_uxn_c_l129_c22_44ac_return_output);

-- BIN_OP_AND_uxn_c_l129_c6_3d4c
BIN_OP_AND_uxn_c_l129_c6_3d4c : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l129_c6_3d4c_left,
BIN_OP_AND_uxn_c_l129_c6_3d4c_right,
BIN_OP_AND_uxn_c_l129_c6_3d4c_return_output);

-- fill_color_MUX_uxn_c_l129_c2_21fb
fill_color_MUX_uxn_c_l129_c2_21fb : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
fill_color_MUX_uxn_c_l129_c2_21fb_cond,
fill_color_MUX_uxn_c_l129_c2_21fb_iftrue,
fill_color_MUX_uxn_c_l129_c2_21fb_iffalse,
fill_color_MUX_uxn_c_l129_c2_21fb_return_output);

-- y_MUX_uxn_c_l129_c2_21fb
y_MUX_uxn_c_l129_c2_21fb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_c_l129_c2_21fb_cond,
y_MUX_uxn_c_l129_c2_21fb_iftrue,
y_MUX_uxn_c_l129_c2_21fb_iffalse,
y_MUX_uxn_c_l129_c2_21fb_return_output);

-- fill_layer_MUX_uxn_c_l129_c2_21fb
fill_layer_MUX_uxn_c_l129_c2_21fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
fill_layer_MUX_uxn_c_l129_c2_21fb_cond,
fill_layer_MUX_uxn_c_l129_c2_21fb_iftrue,
fill_layer_MUX_uxn_c_l129_c2_21fb_iffalse,
fill_layer_MUX_uxn_c_l129_c2_21fb_return_output);

-- fill_y1_MUX_uxn_c_l129_c2_21fb
fill_y1_MUX_uxn_c_l129_c2_21fb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_y1_MUX_uxn_c_l129_c2_21fb_cond,
fill_y1_MUX_uxn_c_l129_c2_21fb_iftrue,
fill_y1_MUX_uxn_c_l129_c2_21fb_iffalse,
fill_y1_MUX_uxn_c_l129_c2_21fb_return_output);

-- x_MUX_uxn_c_l129_c2_21fb
x_MUX_uxn_c_l129_c2_21fb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_c_l129_c2_21fb_cond,
x_MUX_uxn_c_l129_c2_21fb_iftrue,
x_MUX_uxn_c_l129_c2_21fb_iffalse,
x_MUX_uxn_c_l129_c2_21fb_return_output);

-- fill_pixels_remaining_MUX_uxn_c_l129_c2_21fb
fill_pixels_remaining_MUX_uxn_c_l129_c2_21fb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_pixels_remaining_MUX_uxn_c_l129_c2_21fb_cond,
fill_pixels_remaining_MUX_uxn_c_l129_c2_21fb_iftrue,
fill_pixels_remaining_MUX_uxn_c_l129_c2_21fb_iffalse,
fill_pixels_remaining_MUX_uxn_c_l129_c2_21fb_return_output);

-- is_fill_active_MUX_uxn_c_l129_c2_21fb
is_fill_active_MUX_uxn_c_l129_c2_21fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_active_MUX_uxn_c_l129_c2_21fb_cond,
is_fill_active_MUX_uxn_c_l129_c2_21fb_iftrue,
is_fill_active_MUX_uxn_c_l129_c2_21fb_iffalse,
is_fill_active_MUX_uxn_c_l129_c2_21fb_return_output);

-- fill_y0_MUX_uxn_c_l129_c2_21fb
fill_y0_MUX_uxn_c_l129_c2_21fb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_y0_MUX_uxn_c_l129_c2_21fb_cond,
fill_y0_MUX_uxn_c_l129_c2_21fb_iftrue,
fill_y0_MUX_uxn_c_l129_c2_21fb_iffalse,
fill_y0_MUX_uxn_c_l129_c2_21fb_return_output);

-- fill_x1_MUX_uxn_c_l129_c2_21fb
fill_x1_MUX_uxn_c_l129_c2_21fb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_x1_MUX_uxn_c_l129_c2_21fb_cond,
fill_x1_MUX_uxn_c_l129_c2_21fb_iftrue,
fill_x1_MUX_uxn_c_l129_c2_21fb_iffalse,
fill_x1_MUX_uxn_c_l129_c2_21fb_return_output);

-- fill_x0_MUX_uxn_c_l129_c2_21fb
fill_x0_MUX_uxn_c_l129_c2_21fb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_x0_MUX_uxn_c_l129_c2_21fb_cond,
fill_x0_MUX_uxn_c_l129_c2_21fb_iftrue,
fill_x0_MUX_uxn_c_l129_c2_21fb_iffalse,
fill_x0_MUX_uxn_c_l129_c2_21fb_return_output);

-- CONST_SR_2_uxn_c_l131_c25_0fea
CONST_SR_2_uxn_c_l131_c25_0fea : entity work.CONST_SR_2_uint8_t_0CLK_de264c78 port map (
CONST_SR_2_uxn_c_l131_c25_0fea_x,
CONST_SR_2_uxn_c_l131_c25_0fea_return_output);

-- CONST_SR_3_uxn_c_l132_c26_7a4c
CONST_SR_3_uxn_c_l132_c26_7a4c : entity work.CONST_SR_3_uint8_t_0CLK_de264c78 port map (
CONST_SR_3_uxn_c_l132_c26_7a4c_x,
CONST_SR_3_uxn_c_l132_c26_7a4c_return_output);

-- BIN_OP_DIV_uxn_c_l133_c13_f413
BIN_OP_DIV_uxn_c_l133_c13_f413 : entity work.BIN_OP_DIV_uint16_t_uint9_t_0CLK_2b0015ee port map (
BIN_OP_DIV_uxn_c_l133_c13_f413_left,
BIN_OP_DIV_uxn_c_l133_c13_f413_right,
BIN_OP_DIV_uxn_c_l133_c13_f413_return_output);

-- BIN_OP_INFERRED_MULT_uxn_c_l134_c29_f94b
BIN_OP_INFERRED_MULT_uxn_c_l134_c29_f94b : entity work.BIN_OP_INFERRED_MULT_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_c_l134_c29_f94b_left,
BIN_OP_INFERRED_MULT_uxn_c_l134_c29_f94b_right,
BIN_OP_INFERRED_MULT_uxn_c_l134_c29_f94b_return_output);

-- BIN_OP_MINUS_uxn_c_l134_c13_ca33
BIN_OP_MINUS_uxn_c_l134_c13_ca33 : entity work.BIN_OP_MINUS_uint16_t_uint25_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l134_c13_ca33_left,
BIN_OP_MINUS_uxn_c_l134_c13_ca33_right,
BIN_OP_MINUS_uxn_c_l134_c13_ca33_return_output);

-- MUX_uxn_c_l135_c13_51e4
MUX_uxn_c_l135_c13_51e4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l135_c13_51e4_cond,
MUX_uxn_c_l135_c13_51e4_iftrue,
MUX_uxn_c_l135_c13_51e4_iffalse,
MUX_uxn_c_l135_c13_51e4_return_output);

-- MUX_uxn_c_l136_c13_7212
MUX_uxn_c_l136_c13_7212 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l136_c13_7212_cond,
MUX_uxn_c_l136_c13_7212_iftrue,
MUX_uxn_c_l136_c13_7212_iffalse,
MUX_uxn_c_l136_c13_7212_return_output);

-- MUX_uxn_c_l137_c13_1413
MUX_uxn_c_l137_c13_1413 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l137_c13_1413_cond,
MUX_uxn_c_l137_c13_1413_iftrue,
MUX_uxn_c_l137_c13_1413_iffalse,
MUX_uxn_c_l137_c13_1413_return_output);

-- MUX_uxn_c_l138_c13_5c03
MUX_uxn_c_l138_c13_5c03 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l138_c13_5c03_cond,
MUX_uxn_c_l138_c13_5c03_iftrue,
MUX_uxn_c_l138_c13_5c03_iffalse,
MUX_uxn_c_l138_c13_5c03_return_output);

-- BIN_OP_MINUS_uxn_c_l141_c28_8b04
BIN_OP_MINUS_uxn_c_l141_c28_8b04 : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l141_c28_8b04_left,
BIN_OP_MINUS_uxn_c_l141_c28_8b04_right,
BIN_OP_MINUS_uxn_c_l141_c28_8b04_return_output);

-- BIN_OP_PLUS_uxn_c_l141_c28_0acc
BIN_OP_PLUS_uxn_c_l141_c28_0acc : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l141_c28_0acc_left,
BIN_OP_PLUS_uxn_c_l141_c28_0acc_right,
BIN_OP_PLUS_uxn_c_l141_c28_0acc_return_output);

-- BIN_OP_MINUS_uxn_c_l141_c54_3aee
BIN_OP_MINUS_uxn_c_l141_c54_3aee : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l141_c54_3aee_left,
BIN_OP_MINUS_uxn_c_l141_c54_3aee_right,
BIN_OP_MINUS_uxn_c_l141_c54_3aee_return_output);

-- BIN_OP_PLUS_uxn_c_l141_c54_a9f8
BIN_OP_PLUS_uxn_c_l141_c54_a9f8 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l141_c54_a9f8_left,
BIN_OP_PLUS_uxn_c_l141_c54_a9f8_right,
BIN_OP_PLUS_uxn_c_l141_c54_a9f8_return_output);

-- BIN_OP_INFERRED_MULT_uxn_c_l141_c28_f55d
BIN_OP_INFERRED_MULT_uxn_c_l141_c28_f55d : entity work.BIN_OP_INFERRED_MULT_uint17_t_uint17_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_c_l141_c28_f55d_left,
BIN_OP_INFERRED_MULT_uxn_c_l141_c28_f55d_right,
BIN_OP_INFERRED_MULT_uxn_c_l141_c28_f55d_return_output);

-- BIN_OP_INFERRED_MULT_uxn_c_l149_c54_0830
BIN_OP_INFERRED_MULT_uxn_c_l149_c54_0830 : entity work.BIN_OP_INFERRED_MULT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_c_l149_c54_0830_left,
BIN_OP_INFERRED_MULT_uxn_c_l149_c54_0830_right,
BIN_OP_INFERRED_MULT_uxn_c_l149_c54_0830_return_output);

-- BIN_OP_PLUS_uxn_c_l149_c54_1a6c
BIN_OP_PLUS_uxn_c_l149_c54_1a6c : entity work.BIN_OP_PLUS_uint32_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l149_c54_1a6c_left,
BIN_OP_PLUS_uxn_c_l149_c54_1a6c_right,
BIN_OP_PLUS_uxn_c_l149_c54_1a6c_return_output);

-- MUX_uxn_c_l149_c35_6c41
MUX_uxn_c_l149_c35_6c41 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l149_c35_6c41_cond,
MUX_uxn_c_l149_c35_6c41_iftrue,
MUX_uxn_c_l149_c35_6c41_iffalse,
MUX_uxn_c_l149_c35_6c41_return_output);

-- BIN_OP_EQ_uxn_c_l151_c29_c23f
BIN_OP_EQ_uxn_c_l151_c29_c23f : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l151_c29_c23f_left,
BIN_OP_EQ_uxn_c_l151_c29_c23f_right,
BIN_OP_EQ_uxn_c_l151_c29_c23f_return_output);

-- MUX_uxn_c_l151_c29_be88
MUX_uxn_c_l151_c29_be88 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l151_c29_be88_cond,
MUX_uxn_c_l151_c29_be88_iftrue,
MUX_uxn_c_l151_c29_be88_iffalse,
MUX_uxn_c_l151_c29_be88_return_output);

-- BIN_OP_PLUS_uxn_c_l152_c25_060b
BIN_OP_PLUS_uxn_c_l152_c25_060b : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l152_c25_060b_left,
BIN_OP_PLUS_uxn_c_l152_c25_060b_right,
BIN_OP_PLUS_uxn_c_l152_c25_060b_return_output);

-- MUX_uxn_c_l152_c6_4b3e
MUX_uxn_c_l152_c6_4b3e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l152_c6_4b3e_cond,
MUX_uxn_c_l152_c6_4b3e_iftrue,
MUX_uxn_c_l152_c6_4b3e_iffalse,
MUX_uxn_c_l152_c6_4b3e_return_output);

-- BIN_OP_PLUS_uxn_c_l153_c34_74c3
BIN_OP_PLUS_uxn_c_l153_c34_74c3 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l153_c34_74c3_left,
BIN_OP_PLUS_uxn_c_l153_c34_74c3_right,
BIN_OP_PLUS_uxn_c_l153_c34_74c3_return_output);

-- MUX_uxn_c_l153_c6_2797
MUX_uxn_c_l153_c6_2797 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l153_c6_2797_cond,
MUX_uxn_c_l153_c6_2797_iftrue,
MUX_uxn_c_l153_c6_2797_iffalse,
MUX_uxn_c_l153_c6_2797_return_output);

-- UNARY_OP_NOT_uxn_c_l155_c46_cf0c
UNARY_OP_NOT_uxn_c_l155_c46_cf0c : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l155_c46_cf0c_expr,
UNARY_OP_NOT_uxn_c_l155_c46_cf0c_return_output);

-- BIN_OP_AND_uxn_c_l155_c27_0d31
BIN_OP_AND_uxn_c_l155_c27_0d31 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l155_c27_0d31_left,
BIN_OP_AND_uxn_c_l155_c27_0d31_right,
BIN_OP_AND_uxn_c_l155_c27_0d31_return_output);

-- BIN_OP_AND_uxn_c_l156_c27_8aaf
BIN_OP_AND_uxn_c_l156_c27_8aaf : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l156_c27_8aaf_left,
BIN_OP_AND_uxn_c_l156_c27_8aaf_right,
BIN_OP_AND_uxn_c_l156_c27_8aaf_return_output);

-- MUX_uxn_c_l161_c3_b555
MUX_uxn_c_l161_c3_b555 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
MUX_uxn_c_l161_c3_b555_cond,
MUX_uxn_c_l161_c3_b555_iftrue,
MUX_uxn_c_l161_c3_b555_iffalse,
MUX_uxn_c_l161_c3_b555_return_output);

-- UNARY_OP_NOT_uxn_c_l162_c57_8206
UNARY_OP_NOT_uxn_c_l162_c57_8206 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l162_c57_8206_expr,
UNARY_OP_NOT_uxn_c_l162_c57_8206_return_output);

-- BIN_OP_AND_uxn_c_l162_c22_9452
BIN_OP_AND_uxn_c_l162_c22_9452 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l162_c22_9452_left,
BIN_OP_AND_uxn_c_l162_c22_9452_right,
BIN_OP_AND_uxn_c_l162_c22_9452_return_output);

-- BIN_OP_OR_uxn_c_l162_c3_870e
BIN_OP_OR_uxn_c_l162_c3_870e : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l162_c3_870e_left,
BIN_OP_OR_uxn_c_l162_c3_870e_right,
BIN_OP_OR_uxn_c_l162_c3_870e_return_output);

-- bg_vram_update_uxn_c_l158_c27_ad56
bg_vram_update_uxn_c_l158_c27_ad56 : entity work.bg_vram_update_0CLK_6f2c5aad port map (
clk,
bg_vram_update_uxn_c_l158_c27_ad56_CLOCK_ENABLE,
bg_vram_update_uxn_c_l158_c27_ad56_read_address,
bg_vram_update_uxn_c_l158_c27_ad56_write_address,
bg_vram_update_uxn_c_l158_c27_ad56_write_value,
bg_vram_update_uxn_c_l158_c27_ad56_write_enable,
bg_vram_update_uxn_c_l158_c27_ad56_return_output);

-- MUX_uxn_c_l168_c3_c168
MUX_uxn_c_l168_c3_c168 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
MUX_uxn_c_l168_c3_c168_cond,
MUX_uxn_c_l168_c3_c168_iftrue,
MUX_uxn_c_l168_c3_c168_iffalse,
MUX_uxn_c_l168_c3_c168_return_output);

-- BIN_OP_AND_uxn_c_l169_c22_4521
BIN_OP_AND_uxn_c_l169_c22_4521 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l169_c22_4521_left,
BIN_OP_AND_uxn_c_l169_c22_4521_right,
BIN_OP_AND_uxn_c_l169_c22_4521_return_output);

-- BIN_OP_OR_uxn_c_l169_c3_1298
BIN_OP_OR_uxn_c_l169_c3_1298 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l169_c3_1298_left,
BIN_OP_OR_uxn_c_l169_c3_1298_right,
BIN_OP_OR_uxn_c_l169_c3_1298_return_output);

-- fg_vram_update_uxn_c_l165_c27_8a12
fg_vram_update_uxn_c_l165_c27_8a12 : entity work.fg_vram_update_0CLK_6f2c5aad port map (
clk,
fg_vram_update_uxn_c_l165_c27_8a12_CLOCK_ENABLE,
fg_vram_update_uxn_c_l165_c27_8a12_read_address,
fg_vram_update_uxn_c_l165_c27_8a12_write_address,
fg_vram_update_uxn_c_l165_c27_8a12_write_value,
fg_vram_update_uxn_c_l165_c27_8a12_write_enable,
fg_vram_update_uxn_c_l165_c27_8a12_return_output);

-- BIN_OP_MINUS_uxn_c_l172_c43_1197
BIN_OP_MINUS_uxn_c_l172_c43_1197 : entity work.BIN_OP_MINUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l172_c43_1197_left,
BIN_OP_MINUS_uxn_c_l172_c43_1197_right,
BIN_OP_MINUS_uxn_c_l172_c43_1197_return_output);

-- MUX_uxn_c_l172_c26_badd
MUX_uxn_c_l172_c26_badd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l172_c26_badd_cond,
MUX_uxn_c_l172_c26_badd_iftrue,
MUX_uxn_c_l172_c26_badd_iffalse,
MUX_uxn_c_l172_c26_badd_return_output);

-- BIN_OP_EQ_uxn_c_l173_c19_9bde
BIN_OP_EQ_uxn_c_l173_c19_9bde : entity work.BIN_OP_EQ_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l173_c19_9bde_left,
BIN_OP_EQ_uxn_c_l173_c19_9bde_right,
BIN_OP_EQ_uxn_c_l173_c19_9bde_return_output);

-- MUX_uxn_c_l173_c19_81a5
MUX_uxn_c_l173_c19_81a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l173_c19_81a5_cond,
MUX_uxn_c_l173_c19_81a5_iftrue,
MUX_uxn_c_l173_c19_81a5_iffalse,
MUX_uxn_c_l173_c19_81a5_return_output);

-- BIN_OP_EQ_uxn_c_l174_c19_e1a2
BIN_OP_EQ_uxn_c_l174_c19_e1a2 : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l174_c19_e1a2_left,
BIN_OP_EQ_uxn_c_l174_c19_e1a2_right,
BIN_OP_EQ_uxn_c_l174_c19_e1a2_return_output);

-- BIN_OP_PLUS_uxn_c_l174_c76_8bf1
BIN_OP_PLUS_uxn_c_l174_c76_8bf1 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l174_c76_8bf1_left,
BIN_OP_PLUS_uxn_c_l174_c76_8bf1_right,
BIN_OP_PLUS_uxn_c_l174_c76_8bf1_return_output);

-- MUX_uxn_c_l174_c50_b617
MUX_uxn_c_l174_c50_b617 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l174_c50_b617_cond,
MUX_uxn_c_l174_c50_b617_iftrue,
MUX_uxn_c_l174_c50_b617_iffalse,
MUX_uxn_c_l174_c50_b617_return_output);

-- MUX_uxn_c_l174_c19_a4db
MUX_uxn_c_l174_c19_a4db : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l174_c19_a4db_cond,
MUX_uxn_c_l174_c19_a4db_iftrue,
MUX_uxn_c_l174_c19_a4db_iffalse,
MUX_uxn_c_l174_c19_a4db_return_output);

-- BIN_OP_EQ_uxn_c_l175_c25_2f41
BIN_OP_EQ_uxn_c_l175_c25_2f41 : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l175_c25_2f41_left,
BIN_OP_EQ_uxn_c_l175_c25_2f41_right,
BIN_OP_EQ_uxn_c_l175_c25_2f41_return_output);

-- MUX_uxn_c_l175_c25_3226
MUX_uxn_c_l175_c25_3226 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l175_c25_3226_cond,
MUX_uxn_c_l175_c25_3226_iftrue,
MUX_uxn_c_l175_c25_3226_iffalse,
MUX_uxn_c_l175_c25_3226_return_output);

-- BIN_OP_EQ_uxn_c_l176_c17_8e5b
BIN_OP_EQ_uxn_c_l176_c17_8e5b : entity work.BIN_OP_EQ_uint2_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l176_c17_8e5b_left,
BIN_OP_EQ_uxn_c_l176_c17_8e5b_right,
BIN_OP_EQ_uxn_c_l176_c17_8e5b_return_output);

-- MUX_uxn_c_l176_c17_970b
MUX_uxn_c_l176_c17_970b : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
MUX_uxn_c_l176_c17_970b_cond,
MUX_uxn_c_l176_c17_970b_iftrue,
MUX_uxn_c_l176_c17_970b_iffalse,
MUX_uxn_c_l176_c17_970b_return_output);

-- UNARY_OP_NOT_uint1_t_uxn_c_l162_l169_DUPLICATE_e099
UNARY_OP_NOT_uint1_t_uxn_c_l162_l169_DUPLICATE_e099 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uint1_t_uxn_c_l162_l169_DUPLICATE_e099_expr,
UNARY_OP_NOT_uint1_t_uxn_c_l162_l169_DUPLICATE_e099_return_output);

-- BIN_OP_AND_uint1_t_uint1_t_uxn_c_l162_l169_DUPLICATE_8822
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l162_l169_DUPLICATE_8822 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l162_l169_DUPLICATE_8822_left,
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l162_l169_DUPLICATE_8822_right,
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l162_l169_DUPLICATE_8822_return_output);



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
 fill_pixels_remaining,
 fill_x0,
 fill_y0,
 fill_x1,
 fill_y1,
 fill_color,
 is_fill_active,
 fill_layer,
 pixel_counter,
 x,
 y,
 -- All submodule outputs
 CONST_SR_4_uxn_c_l126_c52_6832_return_output,
 BIN_OP_AND_uxn_c_l126_c25_cd45_return_output,
 UNARY_OP_NOT_uxn_c_l129_c22_44ac_return_output,
 BIN_OP_AND_uxn_c_l129_c6_3d4c_return_output,
 fill_color_MUX_uxn_c_l129_c2_21fb_return_output,
 y_MUX_uxn_c_l129_c2_21fb_return_output,
 fill_layer_MUX_uxn_c_l129_c2_21fb_return_output,
 fill_y1_MUX_uxn_c_l129_c2_21fb_return_output,
 x_MUX_uxn_c_l129_c2_21fb_return_output,
 fill_pixels_remaining_MUX_uxn_c_l129_c2_21fb_return_output,
 is_fill_active_MUX_uxn_c_l129_c2_21fb_return_output,
 fill_y0_MUX_uxn_c_l129_c2_21fb_return_output,
 fill_x1_MUX_uxn_c_l129_c2_21fb_return_output,
 fill_x0_MUX_uxn_c_l129_c2_21fb_return_output,
 CONST_SR_2_uxn_c_l131_c25_0fea_return_output,
 CONST_SR_3_uxn_c_l132_c26_7a4c_return_output,
 BIN_OP_DIV_uxn_c_l133_c13_f413_return_output,
 BIN_OP_INFERRED_MULT_uxn_c_l134_c29_f94b_return_output,
 BIN_OP_MINUS_uxn_c_l134_c13_ca33_return_output,
 MUX_uxn_c_l135_c13_51e4_return_output,
 MUX_uxn_c_l136_c13_7212_return_output,
 MUX_uxn_c_l137_c13_1413_return_output,
 MUX_uxn_c_l138_c13_5c03_return_output,
 BIN_OP_MINUS_uxn_c_l141_c28_8b04_return_output,
 BIN_OP_PLUS_uxn_c_l141_c28_0acc_return_output,
 BIN_OP_MINUS_uxn_c_l141_c54_3aee_return_output,
 BIN_OP_PLUS_uxn_c_l141_c54_a9f8_return_output,
 BIN_OP_INFERRED_MULT_uxn_c_l141_c28_f55d_return_output,
 BIN_OP_INFERRED_MULT_uxn_c_l149_c54_0830_return_output,
 BIN_OP_PLUS_uxn_c_l149_c54_1a6c_return_output,
 MUX_uxn_c_l149_c35_6c41_return_output,
 BIN_OP_EQ_uxn_c_l151_c29_c23f_return_output,
 MUX_uxn_c_l151_c29_be88_return_output,
 BIN_OP_PLUS_uxn_c_l152_c25_060b_return_output,
 MUX_uxn_c_l152_c6_4b3e_return_output,
 BIN_OP_PLUS_uxn_c_l153_c34_74c3_return_output,
 MUX_uxn_c_l153_c6_2797_return_output,
 UNARY_OP_NOT_uxn_c_l155_c46_cf0c_return_output,
 BIN_OP_AND_uxn_c_l155_c27_0d31_return_output,
 BIN_OP_AND_uxn_c_l156_c27_8aaf_return_output,
 MUX_uxn_c_l161_c3_b555_return_output,
 UNARY_OP_NOT_uxn_c_l162_c57_8206_return_output,
 BIN_OP_AND_uxn_c_l162_c22_9452_return_output,
 BIN_OP_OR_uxn_c_l162_c3_870e_return_output,
 bg_vram_update_uxn_c_l158_c27_ad56_return_output,
 MUX_uxn_c_l168_c3_c168_return_output,
 BIN_OP_AND_uxn_c_l169_c22_4521_return_output,
 BIN_OP_OR_uxn_c_l169_c3_1298_return_output,
 fg_vram_update_uxn_c_l165_c27_8a12_return_output,
 BIN_OP_MINUS_uxn_c_l172_c43_1197_return_output,
 MUX_uxn_c_l172_c26_badd_return_output,
 BIN_OP_EQ_uxn_c_l173_c19_9bde_return_output,
 MUX_uxn_c_l173_c19_81a5_return_output,
 BIN_OP_EQ_uxn_c_l174_c19_e1a2_return_output,
 BIN_OP_PLUS_uxn_c_l174_c76_8bf1_return_output,
 MUX_uxn_c_l174_c50_b617_return_output,
 MUX_uxn_c_l174_c19_a4db_return_output,
 BIN_OP_EQ_uxn_c_l175_c25_2f41_return_output,
 MUX_uxn_c_l175_c25_3226_return_output,
 BIN_OP_EQ_uxn_c_l176_c17_8e5b_return_output,
 MUX_uxn_c_l176_c17_970b_return_output,
 UNARY_OP_NOT_uint1_t_uxn_c_l162_l169_DUPLICATE_e099_return_output,
 BIN_OP_AND_uint1_t_uint1_t_uxn_c_l162_l169_DUPLICATE_8822_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : gpu_step_result_t;
 variable VAR_is_active_drawing_area : unsigned(0 downto 0);
 variable VAR_is_vram_write : unsigned(0 downto 0);
 variable VAR_vram_write_layer : unsigned(0 downto 0);
 variable VAR_vram_address : unsigned(15 downto 0);
 variable VAR_vram_value : unsigned(7 downto 0);
 variable VAR_result : gpu_step_result_t;
 variable VAR_is_fill_code : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l126_c25_cd45_left : unsigned(0 downto 0);
 variable VAR_CONST_SR_4_uxn_c_l126_c52_6832_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_c_l126_c52_6832_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_c_l126_c42_98db_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l126_c25_cd45_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l126_c25_cd45_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l129_c6_3d4c_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l129_c22_44ac_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l129_c22_44ac_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l129_c6_3d4c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l129_c6_3d4c_return_output : unsigned(0 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l129_c2_21fb_iftrue : unsigned(1 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l129_c2_21fb_iffalse : unsigned(1 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l129_c2_21fb_return_output : unsigned(1 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l129_c2_21fb_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_c_l129_c2_21fb_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_c_l129_c2_21fb_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_c_l129_c2_21fb_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_c_l129_c2_21fb_cond : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l129_c2_21fb_iftrue : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l129_c2_21fb_iffalse : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l129_c2_21fb_return_output : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l129_c2_21fb_cond : unsigned(0 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l129_c2_21fb_iftrue : unsigned(15 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l129_c2_21fb_iffalse : unsigned(15 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l129_c2_21fb_return_output : unsigned(15 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l129_c2_21fb_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_c_l129_c2_21fb_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_c_l129_c2_21fb_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_c_l129_c2_21fb_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_c_l129_c2_21fb_cond : unsigned(0 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l129_c2_21fb_iftrue : unsigned(15 downto 0);
 variable VAR_fill_pixels_remaining_uxn_c_l141_c3_2681 : unsigned(15 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l129_c2_21fb_iffalse : unsigned(15 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l129_c2_21fb_return_output : unsigned(15 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l129_c2_21fb_cond : unsigned(0 downto 0);
 variable VAR_is_fill_active_MUX_uxn_c_l129_c2_21fb_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_active_MUX_uxn_c_l129_c2_21fb_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_active_MUX_uxn_c_l129_c2_21fb_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_active_MUX_uxn_c_l129_c2_21fb_cond : unsigned(0 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l129_c2_21fb_iftrue : unsigned(15 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l129_c2_21fb_iffalse : unsigned(15 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l129_c2_21fb_return_output : unsigned(15 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l129_c2_21fb_cond : unsigned(0 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l129_c2_21fb_iftrue : unsigned(15 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l129_c2_21fb_iffalse : unsigned(15 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l129_c2_21fb_return_output : unsigned(15 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l129_c2_21fb_cond : unsigned(0 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l129_c2_21fb_iftrue : unsigned(15 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l129_c2_21fb_iffalse : unsigned(15 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l129_c2_21fb_return_output : unsigned(15 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l129_c2_21fb_cond : unsigned(0 downto 0);
 variable VAR_is_fill_top : unsigned(0 downto 0);
 variable VAR_is_fill_top_uxn_c_l131_c11_29e1_0 : unsigned(0 downto 0);
 variable VAR_CONST_SR_2_uxn_c_l131_c25_0fea_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_2_uxn_c_l131_c25_0fea_x : unsigned(7 downto 0);
 variable VAR_is_fill_left : unsigned(0 downto 0);
 variable VAR_is_fill_left_uxn_c_l132_c11_209b_0 : unsigned(0 downto 0);
 variable VAR_CONST_SR_3_uxn_c_l132_c26_7a4c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_3_uxn_c_l132_c26_7a4c_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_DIV_uxn_c_l133_c13_f413_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_c_l133_c13_f413_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_DIV_uxn_c_l133_c13_f413_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l134_c13_ca33_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l134_c29_f94b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l134_c29_f94b_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l134_c29_f94b_return_output : unsigned(24 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l134_c13_ca33_right : unsigned(24 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l134_c13_ca33_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l135_c13_51e4_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l135_c13_51e4_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l135_c13_51e4_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l135_c13_51e4_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l136_c13_7212_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l136_c13_7212_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l136_c13_7212_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l136_c13_7212_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l137_c13_1413_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l137_c13_1413_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l137_c13_1413_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l137_c13_1413_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l138_c13_5c03_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l138_c13_5c03_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l138_c13_5c03_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l138_c13_5c03_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint2_t_uxn_c_l140_c16_b63d_return_output : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l141_c28_8b04_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l141_c28_8b04_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l141_c28_8b04_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l141_c28_0acc_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l141_c28_0acc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l141_c28_0acc_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l141_c28_f55d_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l141_c54_3aee_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l141_c54_3aee_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l141_c54_3aee_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l141_c54_a9f8_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l141_c54_a9f8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l141_c54_a9f8_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l141_c28_f55d_right : unsigned(16 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l141_c28_f55d_return_output : unsigned(33 downto 0);
 variable VAR_adjusted_vram_address : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l149_c35_6c41_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l149_c35_6c41_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l149_c35_6c41_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l149_c54_0830_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l149_c54_0830_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l149_c54_0830_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l149_c54_1a6c_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l149_c54_1a6c_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l149_c54_1a6c_return_output : unsigned(32 downto 0);
 variable VAR_MUX_uxn_c_l149_c35_6c41_return_output : unsigned(15 downto 0);
 variable VAR_is_new_fill_row : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l151_c29_be88_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l151_c29_c23f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l151_c29_c23f_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l151_c29_c23f_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l151_c29_be88_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l151_c29_be88_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l151_c29_be88_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l152_c6_4b3e_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l152_c6_4b3e_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l152_c6_4b3e_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l152_c25_060b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l152_c25_060b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l152_c25_060b_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l152_c6_4b3e_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l153_c6_2797_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l153_c6_2797_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l153_c6_2797_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l153_c34_74c3_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l153_c34_74c3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l153_c34_74c3_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l153_c6_2797_return_output : unsigned(15 downto 0);
 variable VAR_is_fill_pixel0 : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l155_c27_0d31_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l155_c46_cf0c_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l155_c46_cf0c_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l155_c27_0d31_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l155_c27_0d31_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_pixel1 : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l156_c27_8aaf_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l156_c27_8aaf_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l156_c27_8aaf_return_output : unsigned(0 downto 0);
 variable VAR_bg_pixel_color : unsigned(1 downto 0);
 variable VAR_bg_vram_update_uxn_c_l158_c27_ad56_read_address : unsigned(15 downto 0);
 variable VAR_bg_vram_update_uxn_c_l158_c27_ad56_write_address : unsigned(15 downto 0);
 variable VAR_bg_vram_update_uxn_c_l158_c27_ad56_write_value : unsigned(1 downto 0);
 variable VAR_bg_vram_update_uxn_c_l158_c27_ad56_write_enable : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l161_c3_b555_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l161_c3_b555_iftrue : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l161_c3_b555_iffalse : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l161_c3_b555_return_output : unsigned(1 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l162_c3_870e_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l162_c22_9452_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l162_c57_8206_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l162_c57_8206_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l162_c22_9452_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l162_c22_9452_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l162_c3_870e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l162_c3_870e_return_output : unsigned(0 downto 0);
 variable VAR_bg_vram_update_uxn_c_l158_c27_ad56_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_bg_vram_update_uxn_c_l158_c27_ad56_return_output : unsigned(1 downto 0);
 variable VAR_fg_pixel_color : unsigned(1 downto 0);
 variable VAR_fg_vram_update_uxn_c_l165_c27_8a12_read_address : unsigned(15 downto 0);
 variable VAR_fg_vram_update_uxn_c_l165_c27_8a12_write_address : unsigned(15 downto 0);
 variable VAR_fg_vram_update_uxn_c_l165_c27_8a12_write_value : unsigned(1 downto 0);
 variable VAR_fg_vram_update_uxn_c_l165_c27_8a12_write_enable : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l168_c3_c168_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l168_c3_c168_iftrue : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l168_c3_c168_iffalse : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l168_c3_c168_return_output : unsigned(1 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l169_c3_1298_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l169_c22_4521_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l169_c22_4521_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l169_c22_4521_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l169_c3_1298_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l169_c3_1298_return_output : unsigned(0 downto 0);
 variable VAR_fg_vram_update_uxn_c_l165_c27_8a12_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_fg_vram_update_uxn_c_l165_c27_8a12_return_output : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l172_c26_badd_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l172_c26_badd_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l172_c26_badd_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l172_c43_1197_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l172_c43_1197_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l172_c43_1197_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l172_c26_badd_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l173_c19_81a5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l173_c19_9bde_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l173_c19_9bde_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l173_c19_9bde_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l173_c19_81a5_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l173_c19_81a5_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l173_c19_81a5_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l174_c19_a4db_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l174_c19_e1a2_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l174_c19_e1a2_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l174_c19_e1a2_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l174_c19_a4db_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l174_c19_a4db_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l174_c50_b617_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l174_c50_b617_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l174_c50_b617_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l174_c76_8bf1_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l174_c76_8bf1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l174_c76_8bf1_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l174_c50_b617_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l174_c19_a4db_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l175_c25_3226_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l175_c25_2f41_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l175_c25_2f41_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l175_c25_2f41_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l175_c25_3226_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l175_c25_3226_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l175_c25_3226_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l176_c17_970b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l176_c17_8e5b_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l176_c17_8e5b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l176_c17_8e5b_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l176_c17_970b_iftrue : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l176_c17_970b_iffalse : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l176_c17_970b_return_output : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_269d_uxn_c_l179_c9_6f92_return_output : gpu_step_result_t;
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_c_l162_l169_DUPLICATE_e099_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_c_l162_l169_DUPLICATE_e099_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l162_l169_DUPLICATE_8822_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l162_l169_DUPLICATE_8822_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l162_l169_DUPLICATE_8822_return_output : unsigned(0 downto 0);
 -- State registers comb logic variables
variable REG_VAR_fill_pixels_remaining : unsigned(15 downto 0);
variable REG_VAR_fill_x0 : unsigned(15 downto 0);
variable REG_VAR_fill_y0 : unsigned(15 downto 0);
variable REG_VAR_fill_x1 : unsigned(15 downto 0);
variable REG_VAR_fill_y1 : unsigned(15 downto 0);
variable REG_VAR_fill_color : unsigned(1 downto 0);
variable REG_VAR_is_fill_active : unsigned(0 downto 0);
variable REG_VAR_fill_layer : unsigned(0 downto 0);
variable REG_VAR_pixel_counter : unsigned(15 downto 0);
variable REG_VAR_x : unsigned(15 downto 0);
variable REG_VAR_y : unsigned(15 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_fill_pixels_remaining := fill_pixels_remaining;
  REG_VAR_fill_x0 := fill_x0;
  REG_VAR_fill_y0 := fill_y0;
  REG_VAR_fill_x1 := fill_x1;
  REG_VAR_fill_y1 := fill_y1;
  REG_VAR_fill_color := fill_color;
  REG_VAR_is_fill_active := is_fill_active;
  REG_VAR_fill_layer := fill_layer;
  REG_VAR_pixel_counter := pixel_counter;
  REG_VAR_x := x;
  REG_VAR_y := y;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_c_l176_c17_8e5b_right := to_unsigned(0, 1);
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l134_c29_f94b_right := to_unsigned(260, 9);
     VAR_MUX_uxn_c_l172_c26_badd_iffalse := resize(to_unsigned(0, 1), 16);
     VAR_BIN_OP_DIV_uxn_c_l133_c13_f413_right := to_unsigned(260, 9);
     VAR_MUX_uxn_c_l175_c25_3226_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l175_c25_2f41_right := to_unsigned(60839, 16);
     VAR_BIN_OP_PLUS_uxn_c_l174_c76_8bf1_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l173_c19_9bde_right := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_c_l153_c34_74c3_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_c_l141_c28_0acc_right := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l173_c19_81a5_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l173_c19_81a5_iffalse := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l136_c13_7212_iffalse := resize(to_unsigned(259, 9), 16);
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l149_c54_0830_right := to_unsigned(260, 16);
     VAR_MUX_uxn_c_l151_c29_be88_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l175_c25_3226_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l135_c13_51e4_iffalse := resize(to_unsigned(233, 8), 16);
     VAR_MUX_uxn_c_l137_c13_1413_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_BIN_OP_PLUS_uxn_c_l152_c25_060b_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_c_l141_c54_a9f8_right := to_unsigned(1, 1);
     VAR_BIN_OP_MINUS_uxn_c_l172_c43_1197_right := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l151_c29_be88_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l138_c13_5c03_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_BIN_OP_EQ_uxn_c_l174_c19_e1a2_right := to_unsigned(60839, 16);
     VAR_MUX_uxn_c_l174_c19_a4db_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_is_fill_active_MUX_uxn_c_l129_c2_21fb_iftrue := to_unsigned(1, 1);

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
     VAR_bg_vram_update_uxn_c_l158_c27_ad56_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_fg_vram_update_uxn_c_l165_c27_8a12_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_fill_color_MUX_uxn_c_l129_c2_21fb_iffalse := fill_color;
     VAR_fill_layer_MUX_uxn_c_l129_c2_21fb_iffalse := fill_layer;
     VAR_fill_pixels_remaining_MUX_uxn_c_l129_c2_21fb_iffalse := fill_pixels_remaining;
     VAR_fill_x0_MUX_uxn_c_l129_c2_21fb_iffalse := fill_x0;
     VAR_fill_x1_MUX_uxn_c_l129_c2_21fb_iffalse := fill_x1;
     VAR_fill_y0_MUX_uxn_c_l129_c2_21fb_iffalse := fill_y0;
     VAR_fill_y1_MUX_uxn_c_l129_c2_21fb_iffalse := fill_y1;
     VAR_MUX_uxn_c_l174_c50_b617_cond := VAR_is_active_drawing_area;
     VAR_UNARY_OP_NOT_uxn_c_l129_c22_44ac_expr := is_fill_active;
     VAR_is_fill_active_MUX_uxn_c_l129_c2_21fb_iffalse := is_fill_active;
     VAR_BIN_OP_AND_uxn_c_l126_c25_cd45_left := VAR_is_vram_write;
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l162_l169_DUPLICATE_8822_right := VAR_is_vram_write;
     VAR_BIN_OP_EQ_uxn_c_l174_c19_e1a2_left := pixel_counter;
     VAR_BIN_OP_PLUS_uxn_c_l174_c76_8bf1_left := pixel_counter;
     VAR_MUX_uxn_c_l174_c50_b617_iffalse := pixel_counter;
     VAR_bg_vram_update_uxn_c_l158_c27_ad56_read_address := pixel_counter;
     VAR_fg_vram_update_uxn_c_l165_c27_8a12_read_address := pixel_counter;
     VAR_BIN_OP_DIV_uxn_c_l133_c13_f413_left := VAR_vram_address;
     VAR_BIN_OP_MINUS_uxn_c_l134_c13_ca33_left := VAR_vram_address;
     VAR_MUX_uxn_c_l149_c35_6c41_iffalse := VAR_vram_address;
     VAR_CONST_SR_2_uxn_c_l131_c25_0fea_x := VAR_vram_value;
     VAR_CONST_SR_3_uxn_c_l132_c26_7a4c_x := VAR_vram_value;
     VAR_CONST_SR_4_uxn_c_l126_c52_6832_x := VAR_vram_value;
     VAR_MUX_uxn_c_l161_c3_b555_iffalse := resize(VAR_vram_value, 2);
     VAR_MUX_uxn_c_l168_c3_c168_iffalse := resize(VAR_vram_value, 2);
     VAR_BIN_OP_AND_uxn_c_l169_c22_4521_right := VAR_vram_write_layer;
     VAR_UNARY_OP_NOT_uxn_c_l162_c57_8206_expr := VAR_vram_write_layer;
     VAR_fill_layer_MUX_uxn_c_l129_c2_21fb_iftrue := VAR_vram_write_layer;
     VAR_x_MUX_uxn_c_l129_c2_21fb_iffalse := x;
     VAR_y_MUX_uxn_c_l129_c2_21fb_iffalse := y;
     -- CONST_SR_4[uxn_c_l126_c52_6832] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_c_l126_c52_6832_x <= VAR_CONST_SR_4_uxn_c_l126_c52_6832_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_c_l126_c52_6832_return_output := CONST_SR_4_uxn_c_l126_c52_6832_return_output;

     -- CONST_SR_2[uxn_c_l131_c25_0fea] LATENCY=0
     -- Inputs
     CONST_SR_2_uxn_c_l131_c25_0fea_x <= VAR_CONST_SR_2_uxn_c_l131_c25_0fea_x;
     -- Outputs
     VAR_CONST_SR_2_uxn_c_l131_c25_0fea_return_output := CONST_SR_2_uxn_c_l131_c25_0fea_return_output;

     -- UNARY_OP_NOT[uxn_c_l162_c57_8206] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l162_c57_8206_expr <= VAR_UNARY_OP_NOT_uxn_c_l162_c57_8206_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l162_c57_8206_return_output := UNARY_OP_NOT_uxn_c_l162_c57_8206_return_output;

     -- BIN_OP_PLUS[uxn_c_l174_c76_8bf1] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l174_c76_8bf1_left <= VAR_BIN_OP_PLUS_uxn_c_l174_c76_8bf1_left;
     BIN_OP_PLUS_uxn_c_l174_c76_8bf1_right <= VAR_BIN_OP_PLUS_uxn_c_l174_c76_8bf1_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l174_c76_8bf1_return_output := BIN_OP_PLUS_uxn_c_l174_c76_8bf1_return_output;

     -- CONST_SR_3[uxn_c_l132_c26_7a4c] LATENCY=0
     -- Inputs
     CONST_SR_3_uxn_c_l132_c26_7a4c_x <= VAR_CONST_SR_3_uxn_c_l132_c26_7a4c_x;
     -- Outputs
     VAR_CONST_SR_3_uxn_c_l132_c26_7a4c_return_output := CONST_SR_3_uxn_c_l132_c26_7a4c_return_output;

     -- BIN_OP_EQ[uxn_c_l174_c19_e1a2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l174_c19_e1a2_left <= VAR_BIN_OP_EQ_uxn_c_l174_c19_e1a2_left;
     BIN_OP_EQ_uxn_c_l174_c19_e1a2_right <= VAR_BIN_OP_EQ_uxn_c_l174_c19_e1a2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l174_c19_e1a2_return_output := BIN_OP_EQ_uxn_c_l174_c19_e1a2_return_output;

     -- BIN_OP_DIV[uxn_c_l133_c13_f413] LATENCY=0
     -- Inputs
     BIN_OP_DIV_uxn_c_l133_c13_f413_left <= VAR_BIN_OP_DIV_uxn_c_l133_c13_f413_left;
     BIN_OP_DIV_uxn_c_l133_c13_f413_right <= VAR_BIN_OP_DIV_uxn_c_l133_c13_f413_right;
     -- Outputs
     VAR_BIN_OP_DIV_uxn_c_l133_c13_f413_return_output := BIN_OP_DIV_uxn_c_l133_c13_f413_return_output;

     -- UNARY_OP_NOT[uxn_c_l129_c22_44ac] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l129_c22_44ac_expr <= VAR_UNARY_OP_NOT_uxn_c_l129_c22_44ac_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l129_c22_44ac_return_output := UNARY_OP_NOT_uxn_c_l129_c22_44ac_return_output;

     -- CAST_TO_uint2_t[uxn_c_l140_c16_b63d] LATENCY=0
     VAR_CAST_TO_uint2_t_uxn_c_l140_c16_b63d_return_output := CAST_TO_uint2_t_uint8_t(
     VAR_vram_value);

     -- Submodule level 1
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l134_c29_f94b_left := VAR_BIN_OP_DIV_uxn_c_l133_c13_f413_return_output;
     VAR_MUX_uxn_c_l135_c13_51e4_iftrue := VAR_BIN_OP_DIV_uxn_c_l133_c13_f413_return_output;
     VAR_MUX_uxn_c_l137_c13_1413_iffalse := VAR_BIN_OP_DIV_uxn_c_l133_c13_f413_return_output;
     VAR_MUX_uxn_c_l174_c19_a4db_cond := VAR_BIN_OP_EQ_uxn_c_l174_c19_e1a2_return_output;
     VAR_MUX_uxn_c_l174_c50_b617_iftrue := resize(VAR_BIN_OP_PLUS_uxn_c_l174_c76_8bf1_return_output, 16);
     VAR_fill_color_MUX_uxn_c_l129_c2_21fb_iftrue := VAR_CAST_TO_uint2_t_uxn_c_l140_c16_b63d_return_output;
     VAR_is_fill_top_uxn_c_l131_c11_29e1_0 := resize(VAR_CONST_SR_2_uxn_c_l131_c25_0fea_return_output, 1);
     VAR_is_fill_left_uxn_c_l132_c11_209b_0 := resize(VAR_CONST_SR_3_uxn_c_l132_c26_7a4c_return_output, 1);
     VAR_BIN_OP_AND_uxn_c_l129_c6_3d4c_right := VAR_UNARY_OP_NOT_uxn_c_l129_c22_44ac_return_output;
     VAR_BIN_OP_AND_uxn_c_l162_c22_9452_right := VAR_UNARY_OP_NOT_uxn_c_l162_c57_8206_return_output;
     VAR_MUX_uxn_c_l136_c13_7212_cond := VAR_is_fill_left_uxn_c_l132_c11_209b_0;
     VAR_MUX_uxn_c_l138_c13_5c03_cond := VAR_is_fill_left_uxn_c_l132_c11_209b_0;
     VAR_MUX_uxn_c_l135_c13_51e4_cond := VAR_is_fill_top_uxn_c_l131_c11_29e1_0;
     VAR_MUX_uxn_c_l137_c13_1413_cond := VAR_is_fill_top_uxn_c_l131_c11_29e1_0;
     -- MUX[uxn_c_l174_c50_b617] LATENCY=0
     -- Inputs
     MUX_uxn_c_l174_c50_b617_cond <= VAR_MUX_uxn_c_l174_c50_b617_cond;
     MUX_uxn_c_l174_c50_b617_iftrue <= VAR_MUX_uxn_c_l174_c50_b617_iftrue;
     MUX_uxn_c_l174_c50_b617_iffalse <= VAR_MUX_uxn_c_l174_c50_b617_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l174_c50_b617_return_output := MUX_uxn_c_l174_c50_b617_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_c_l134_c29_f94b] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_c_l134_c29_f94b_left <= VAR_BIN_OP_INFERRED_MULT_uxn_c_l134_c29_f94b_left;
     BIN_OP_INFERRED_MULT_uxn_c_l134_c29_f94b_right <= VAR_BIN_OP_INFERRED_MULT_uxn_c_l134_c29_f94b_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l134_c29_f94b_return_output := BIN_OP_INFERRED_MULT_uxn_c_l134_c29_f94b_return_output;

     -- MUX[uxn_c_l137_c13_1413] LATENCY=0
     -- Inputs
     MUX_uxn_c_l137_c13_1413_cond <= VAR_MUX_uxn_c_l137_c13_1413_cond;
     MUX_uxn_c_l137_c13_1413_iftrue <= VAR_MUX_uxn_c_l137_c13_1413_iftrue;
     MUX_uxn_c_l137_c13_1413_iffalse <= VAR_MUX_uxn_c_l137_c13_1413_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l137_c13_1413_return_output := MUX_uxn_c_l137_c13_1413_return_output;

     -- MUX[uxn_c_l135_c13_51e4] LATENCY=0
     -- Inputs
     MUX_uxn_c_l135_c13_51e4_cond <= VAR_MUX_uxn_c_l135_c13_51e4_cond;
     MUX_uxn_c_l135_c13_51e4_iftrue <= VAR_MUX_uxn_c_l135_c13_51e4_iftrue;
     MUX_uxn_c_l135_c13_51e4_iffalse <= VAR_MUX_uxn_c_l135_c13_51e4_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l135_c13_51e4_return_output := MUX_uxn_c_l135_c13_51e4_return_output;

     -- CAST_TO_uint1_t[uxn_c_l126_c42_98db] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_c_l126_c42_98db_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_4_uxn_c_l126_c52_6832_return_output);

     -- Submodule level 2
     VAR_BIN_OP_MINUS_uxn_c_l134_c13_ca33_right := VAR_BIN_OP_INFERRED_MULT_uxn_c_l134_c29_f94b_return_output;
     VAR_BIN_OP_AND_uxn_c_l126_c25_cd45_right := VAR_CAST_TO_uint1_t_uxn_c_l126_c42_98db_return_output;
     VAR_BIN_OP_MINUS_uxn_c_l141_c54_3aee_left := VAR_MUX_uxn_c_l135_c13_51e4_return_output;
     VAR_fill_y1_MUX_uxn_c_l129_c2_21fb_iftrue := VAR_MUX_uxn_c_l135_c13_51e4_return_output;
     VAR_BIN_OP_MINUS_uxn_c_l141_c54_3aee_right := VAR_MUX_uxn_c_l137_c13_1413_return_output;
     VAR_fill_y0_MUX_uxn_c_l129_c2_21fb_iftrue := VAR_MUX_uxn_c_l137_c13_1413_return_output;
     VAR_y_MUX_uxn_c_l129_c2_21fb_iftrue := VAR_MUX_uxn_c_l137_c13_1413_return_output;
     VAR_MUX_uxn_c_l174_c19_a4db_iffalse := VAR_MUX_uxn_c_l174_c50_b617_return_output;
     -- BIN_OP_MINUS[uxn_c_l134_c13_ca33] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l134_c13_ca33_left <= VAR_BIN_OP_MINUS_uxn_c_l134_c13_ca33_left;
     BIN_OP_MINUS_uxn_c_l134_c13_ca33_right <= VAR_BIN_OP_MINUS_uxn_c_l134_c13_ca33_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l134_c13_ca33_return_output := BIN_OP_MINUS_uxn_c_l134_c13_ca33_return_output;

     -- MUX[uxn_c_l174_c19_a4db] LATENCY=0
     -- Inputs
     MUX_uxn_c_l174_c19_a4db_cond <= VAR_MUX_uxn_c_l174_c19_a4db_cond;
     MUX_uxn_c_l174_c19_a4db_iftrue <= VAR_MUX_uxn_c_l174_c19_a4db_iftrue;
     MUX_uxn_c_l174_c19_a4db_iffalse <= VAR_MUX_uxn_c_l174_c19_a4db_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l174_c19_a4db_return_output := MUX_uxn_c_l174_c19_a4db_return_output;

     -- BIN_OP_AND[uxn_c_l126_c25_cd45] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l126_c25_cd45_left <= VAR_BIN_OP_AND_uxn_c_l126_c25_cd45_left;
     BIN_OP_AND_uxn_c_l126_c25_cd45_right <= VAR_BIN_OP_AND_uxn_c_l126_c25_cd45_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l126_c25_cd45_return_output := BIN_OP_AND_uxn_c_l126_c25_cd45_return_output;

     -- BIN_OP_MINUS[uxn_c_l141_c54_3aee] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l141_c54_3aee_left <= VAR_BIN_OP_MINUS_uxn_c_l141_c54_3aee_left;
     BIN_OP_MINUS_uxn_c_l141_c54_3aee_right <= VAR_BIN_OP_MINUS_uxn_c_l141_c54_3aee_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l141_c54_3aee_return_output := BIN_OP_MINUS_uxn_c_l141_c54_3aee_return_output;

     -- Submodule level 3
     VAR_BIN_OP_AND_uxn_c_l129_c6_3d4c_left := VAR_BIN_OP_AND_uxn_c_l126_c25_cd45_return_output;
     VAR_MUX_uxn_c_l136_c13_7212_iftrue := VAR_BIN_OP_MINUS_uxn_c_l134_c13_ca33_return_output;
     VAR_MUX_uxn_c_l138_c13_5c03_iffalse := VAR_BIN_OP_MINUS_uxn_c_l134_c13_ca33_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l141_c54_a9f8_left := VAR_BIN_OP_MINUS_uxn_c_l141_c54_3aee_return_output;
     VAR_BIN_OP_EQ_uxn_c_l175_c25_2f41_left := VAR_MUX_uxn_c_l174_c19_a4db_return_output;
     REG_VAR_pixel_counter := VAR_MUX_uxn_c_l174_c19_a4db_return_output;
     -- MUX[uxn_c_l136_c13_7212] LATENCY=0
     -- Inputs
     MUX_uxn_c_l136_c13_7212_cond <= VAR_MUX_uxn_c_l136_c13_7212_cond;
     MUX_uxn_c_l136_c13_7212_iftrue <= VAR_MUX_uxn_c_l136_c13_7212_iftrue;
     MUX_uxn_c_l136_c13_7212_iffalse <= VAR_MUX_uxn_c_l136_c13_7212_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l136_c13_7212_return_output := MUX_uxn_c_l136_c13_7212_return_output;

     -- BIN_OP_PLUS[uxn_c_l141_c54_a9f8] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l141_c54_a9f8_left <= VAR_BIN_OP_PLUS_uxn_c_l141_c54_a9f8_left;
     BIN_OP_PLUS_uxn_c_l141_c54_a9f8_right <= VAR_BIN_OP_PLUS_uxn_c_l141_c54_a9f8_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l141_c54_a9f8_return_output := BIN_OP_PLUS_uxn_c_l141_c54_a9f8_return_output;

     -- BIN_OP_AND[uxn_c_l129_c6_3d4c] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l129_c6_3d4c_left <= VAR_BIN_OP_AND_uxn_c_l129_c6_3d4c_left;
     BIN_OP_AND_uxn_c_l129_c6_3d4c_right <= VAR_BIN_OP_AND_uxn_c_l129_c6_3d4c_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l129_c6_3d4c_return_output := BIN_OP_AND_uxn_c_l129_c6_3d4c_return_output;

     -- MUX[uxn_c_l138_c13_5c03] LATENCY=0
     -- Inputs
     MUX_uxn_c_l138_c13_5c03_cond <= VAR_MUX_uxn_c_l138_c13_5c03_cond;
     MUX_uxn_c_l138_c13_5c03_iftrue <= VAR_MUX_uxn_c_l138_c13_5c03_iftrue;
     MUX_uxn_c_l138_c13_5c03_iffalse <= VAR_MUX_uxn_c_l138_c13_5c03_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l138_c13_5c03_return_output := MUX_uxn_c_l138_c13_5c03_return_output;

     -- BIN_OP_EQ[uxn_c_l175_c25_2f41] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l175_c25_2f41_left <= VAR_BIN_OP_EQ_uxn_c_l175_c25_2f41_left;
     BIN_OP_EQ_uxn_c_l175_c25_2f41_right <= VAR_BIN_OP_EQ_uxn_c_l175_c25_2f41_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l175_c25_2f41_return_output := BIN_OP_EQ_uxn_c_l175_c25_2f41_return_output;

     -- Submodule level 4
     VAR_fill_color_MUX_uxn_c_l129_c2_21fb_cond := VAR_BIN_OP_AND_uxn_c_l129_c6_3d4c_return_output;
     VAR_fill_layer_MUX_uxn_c_l129_c2_21fb_cond := VAR_BIN_OP_AND_uxn_c_l129_c6_3d4c_return_output;
     VAR_fill_pixels_remaining_MUX_uxn_c_l129_c2_21fb_cond := VAR_BIN_OP_AND_uxn_c_l129_c6_3d4c_return_output;
     VAR_fill_x0_MUX_uxn_c_l129_c2_21fb_cond := VAR_BIN_OP_AND_uxn_c_l129_c6_3d4c_return_output;
     VAR_fill_x1_MUX_uxn_c_l129_c2_21fb_cond := VAR_BIN_OP_AND_uxn_c_l129_c6_3d4c_return_output;
     VAR_fill_y0_MUX_uxn_c_l129_c2_21fb_cond := VAR_BIN_OP_AND_uxn_c_l129_c6_3d4c_return_output;
     VAR_fill_y1_MUX_uxn_c_l129_c2_21fb_cond := VAR_BIN_OP_AND_uxn_c_l129_c6_3d4c_return_output;
     VAR_is_fill_active_MUX_uxn_c_l129_c2_21fb_cond := VAR_BIN_OP_AND_uxn_c_l129_c6_3d4c_return_output;
     VAR_x_MUX_uxn_c_l129_c2_21fb_cond := VAR_BIN_OP_AND_uxn_c_l129_c6_3d4c_return_output;
     VAR_y_MUX_uxn_c_l129_c2_21fb_cond := VAR_BIN_OP_AND_uxn_c_l129_c6_3d4c_return_output;
     VAR_MUX_uxn_c_l175_c25_3226_cond := VAR_BIN_OP_EQ_uxn_c_l175_c25_2f41_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l141_c28_f55d_right := VAR_BIN_OP_PLUS_uxn_c_l141_c54_a9f8_return_output;
     VAR_BIN_OP_MINUS_uxn_c_l141_c28_8b04_left := VAR_MUX_uxn_c_l136_c13_7212_return_output;
     VAR_fill_x1_MUX_uxn_c_l129_c2_21fb_iftrue := VAR_MUX_uxn_c_l136_c13_7212_return_output;
     VAR_BIN_OP_MINUS_uxn_c_l141_c28_8b04_right := VAR_MUX_uxn_c_l138_c13_5c03_return_output;
     VAR_fill_x0_MUX_uxn_c_l129_c2_21fb_iftrue := VAR_MUX_uxn_c_l138_c13_5c03_return_output;
     VAR_x_MUX_uxn_c_l129_c2_21fb_iftrue := VAR_MUX_uxn_c_l138_c13_5c03_return_output;
     -- fill_y1_MUX[uxn_c_l129_c2_21fb] LATENCY=0
     -- Inputs
     fill_y1_MUX_uxn_c_l129_c2_21fb_cond <= VAR_fill_y1_MUX_uxn_c_l129_c2_21fb_cond;
     fill_y1_MUX_uxn_c_l129_c2_21fb_iftrue <= VAR_fill_y1_MUX_uxn_c_l129_c2_21fb_iftrue;
     fill_y1_MUX_uxn_c_l129_c2_21fb_iffalse <= VAR_fill_y1_MUX_uxn_c_l129_c2_21fb_iffalse;
     -- Outputs
     VAR_fill_y1_MUX_uxn_c_l129_c2_21fb_return_output := fill_y1_MUX_uxn_c_l129_c2_21fb_return_output;

     -- y_MUX[uxn_c_l129_c2_21fb] LATENCY=0
     -- Inputs
     y_MUX_uxn_c_l129_c2_21fb_cond <= VAR_y_MUX_uxn_c_l129_c2_21fb_cond;
     y_MUX_uxn_c_l129_c2_21fb_iftrue <= VAR_y_MUX_uxn_c_l129_c2_21fb_iftrue;
     y_MUX_uxn_c_l129_c2_21fb_iffalse <= VAR_y_MUX_uxn_c_l129_c2_21fb_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_c_l129_c2_21fb_return_output := y_MUX_uxn_c_l129_c2_21fb_return_output;

     -- fill_x0_MUX[uxn_c_l129_c2_21fb] LATENCY=0
     -- Inputs
     fill_x0_MUX_uxn_c_l129_c2_21fb_cond <= VAR_fill_x0_MUX_uxn_c_l129_c2_21fb_cond;
     fill_x0_MUX_uxn_c_l129_c2_21fb_iftrue <= VAR_fill_x0_MUX_uxn_c_l129_c2_21fb_iftrue;
     fill_x0_MUX_uxn_c_l129_c2_21fb_iffalse <= VAR_fill_x0_MUX_uxn_c_l129_c2_21fb_iffalse;
     -- Outputs
     VAR_fill_x0_MUX_uxn_c_l129_c2_21fb_return_output := fill_x0_MUX_uxn_c_l129_c2_21fb_return_output;

     -- fill_y0_MUX[uxn_c_l129_c2_21fb] LATENCY=0
     -- Inputs
     fill_y0_MUX_uxn_c_l129_c2_21fb_cond <= VAR_fill_y0_MUX_uxn_c_l129_c2_21fb_cond;
     fill_y0_MUX_uxn_c_l129_c2_21fb_iftrue <= VAR_fill_y0_MUX_uxn_c_l129_c2_21fb_iftrue;
     fill_y0_MUX_uxn_c_l129_c2_21fb_iffalse <= VAR_fill_y0_MUX_uxn_c_l129_c2_21fb_iffalse;
     -- Outputs
     VAR_fill_y0_MUX_uxn_c_l129_c2_21fb_return_output := fill_y0_MUX_uxn_c_l129_c2_21fb_return_output;

     -- MUX[uxn_c_l175_c25_3226] LATENCY=0
     -- Inputs
     MUX_uxn_c_l175_c25_3226_cond <= VAR_MUX_uxn_c_l175_c25_3226_cond;
     MUX_uxn_c_l175_c25_3226_iftrue <= VAR_MUX_uxn_c_l175_c25_3226_iftrue;
     MUX_uxn_c_l175_c25_3226_iffalse <= VAR_MUX_uxn_c_l175_c25_3226_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l175_c25_3226_return_output := MUX_uxn_c_l175_c25_3226_return_output;

     -- is_fill_active_MUX[uxn_c_l129_c2_21fb] LATENCY=0
     -- Inputs
     is_fill_active_MUX_uxn_c_l129_c2_21fb_cond <= VAR_is_fill_active_MUX_uxn_c_l129_c2_21fb_cond;
     is_fill_active_MUX_uxn_c_l129_c2_21fb_iftrue <= VAR_is_fill_active_MUX_uxn_c_l129_c2_21fb_iftrue;
     is_fill_active_MUX_uxn_c_l129_c2_21fb_iffalse <= VAR_is_fill_active_MUX_uxn_c_l129_c2_21fb_iffalse;
     -- Outputs
     VAR_is_fill_active_MUX_uxn_c_l129_c2_21fb_return_output := is_fill_active_MUX_uxn_c_l129_c2_21fb_return_output;

     -- fill_layer_MUX[uxn_c_l129_c2_21fb] LATENCY=0
     -- Inputs
     fill_layer_MUX_uxn_c_l129_c2_21fb_cond <= VAR_fill_layer_MUX_uxn_c_l129_c2_21fb_cond;
     fill_layer_MUX_uxn_c_l129_c2_21fb_iftrue <= VAR_fill_layer_MUX_uxn_c_l129_c2_21fb_iftrue;
     fill_layer_MUX_uxn_c_l129_c2_21fb_iffalse <= VAR_fill_layer_MUX_uxn_c_l129_c2_21fb_iffalse;
     -- Outputs
     VAR_fill_layer_MUX_uxn_c_l129_c2_21fb_return_output := fill_layer_MUX_uxn_c_l129_c2_21fb_return_output;

     -- x_MUX[uxn_c_l129_c2_21fb] LATENCY=0
     -- Inputs
     x_MUX_uxn_c_l129_c2_21fb_cond <= VAR_x_MUX_uxn_c_l129_c2_21fb_cond;
     x_MUX_uxn_c_l129_c2_21fb_iftrue <= VAR_x_MUX_uxn_c_l129_c2_21fb_iftrue;
     x_MUX_uxn_c_l129_c2_21fb_iffalse <= VAR_x_MUX_uxn_c_l129_c2_21fb_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_c_l129_c2_21fb_return_output := x_MUX_uxn_c_l129_c2_21fb_return_output;

     -- fill_color_MUX[uxn_c_l129_c2_21fb] LATENCY=0
     -- Inputs
     fill_color_MUX_uxn_c_l129_c2_21fb_cond <= VAR_fill_color_MUX_uxn_c_l129_c2_21fb_cond;
     fill_color_MUX_uxn_c_l129_c2_21fb_iftrue <= VAR_fill_color_MUX_uxn_c_l129_c2_21fb_iftrue;
     fill_color_MUX_uxn_c_l129_c2_21fb_iffalse <= VAR_fill_color_MUX_uxn_c_l129_c2_21fb_iffalse;
     -- Outputs
     VAR_fill_color_MUX_uxn_c_l129_c2_21fb_return_output := fill_color_MUX_uxn_c_l129_c2_21fb_return_output;

     -- fill_x1_MUX[uxn_c_l129_c2_21fb] LATENCY=0
     -- Inputs
     fill_x1_MUX_uxn_c_l129_c2_21fb_cond <= VAR_fill_x1_MUX_uxn_c_l129_c2_21fb_cond;
     fill_x1_MUX_uxn_c_l129_c2_21fb_iftrue <= VAR_fill_x1_MUX_uxn_c_l129_c2_21fb_iftrue;
     fill_x1_MUX_uxn_c_l129_c2_21fb_iffalse <= VAR_fill_x1_MUX_uxn_c_l129_c2_21fb_iffalse;
     -- Outputs
     VAR_fill_x1_MUX_uxn_c_l129_c2_21fb_return_output := fill_x1_MUX_uxn_c_l129_c2_21fb_return_output;

     -- BIN_OP_MINUS[uxn_c_l141_c28_8b04] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l141_c28_8b04_left <= VAR_BIN_OP_MINUS_uxn_c_l141_c28_8b04_left;
     BIN_OP_MINUS_uxn_c_l141_c28_8b04_right <= VAR_BIN_OP_MINUS_uxn_c_l141_c28_8b04_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l141_c28_8b04_return_output := BIN_OP_MINUS_uxn_c_l141_c28_8b04_return_output;

     -- Submodule level 5
     VAR_BIN_OP_PLUS_uxn_c_l141_c28_0acc_left := VAR_BIN_OP_MINUS_uxn_c_l141_c28_8b04_return_output;
     VAR_MUX_uxn_c_l161_c3_b555_iftrue := VAR_fill_color_MUX_uxn_c_l129_c2_21fb_return_output;
     VAR_MUX_uxn_c_l168_c3_c168_iftrue := VAR_fill_color_MUX_uxn_c_l129_c2_21fb_return_output;
     REG_VAR_fill_color := VAR_fill_color_MUX_uxn_c_l129_c2_21fb_return_output;
     VAR_BIN_OP_AND_uxn_c_l156_c27_8aaf_right := VAR_fill_layer_MUX_uxn_c_l129_c2_21fb_return_output;
     VAR_UNARY_OP_NOT_uxn_c_l155_c46_cf0c_expr := VAR_fill_layer_MUX_uxn_c_l129_c2_21fb_return_output;
     REG_VAR_fill_layer := VAR_fill_layer_MUX_uxn_c_l129_c2_21fb_return_output;
     VAR_MUX_uxn_c_l153_c6_2797_iftrue := VAR_fill_x0_MUX_uxn_c_l129_c2_21fb_return_output;
     REG_VAR_fill_x0 := VAR_fill_x0_MUX_uxn_c_l129_c2_21fb_return_output;
     VAR_BIN_OP_EQ_uxn_c_l151_c29_c23f_right := VAR_fill_x1_MUX_uxn_c_l129_c2_21fb_return_output;
     REG_VAR_fill_x1 := VAR_fill_x1_MUX_uxn_c_l129_c2_21fb_return_output;
     REG_VAR_fill_y0 := VAR_fill_y0_MUX_uxn_c_l129_c2_21fb_return_output;
     REG_VAR_fill_y1 := VAR_fill_y1_MUX_uxn_c_l129_c2_21fb_return_output;
     VAR_BIN_OP_AND_uxn_c_l155_c27_0d31_left := VAR_is_fill_active_MUX_uxn_c_l129_c2_21fb_return_output;
     VAR_BIN_OP_AND_uxn_c_l156_c27_8aaf_left := VAR_is_fill_active_MUX_uxn_c_l129_c2_21fb_return_output;
     VAR_MUX_uxn_c_l149_c35_6c41_cond := VAR_is_fill_active_MUX_uxn_c_l129_c2_21fb_return_output;
     VAR_MUX_uxn_c_l172_c26_badd_cond := VAR_is_fill_active_MUX_uxn_c_l129_c2_21fb_return_output;
     VAR_UNARY_OP_NOT_uint1_t_uxn_c_l162_l169_DUPLICATE_e099_expr := VAR_is_fill_active_MUX_uxn_c_l129_c2_21fb_return_output;
     VAR_BIN_OP_EQ_uxn_c_l151_c29_c23f_left := VAR_x_MUX_uxn_c_l129_c2_21fb_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l149_c54_1a6c_right := VAR_x_MUX_uxn_c_l129_c2_21fb_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l153_c34_74c3_left := VAR_x_MUX_uxn_c_l129_c2_21fb_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l149_c54_0830_left := VAR_y_MUX_uxn_c_l129_c2_21fb_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l152_c25_060b_left := VAR_y_MUX_uxn_c_l129_c2_21fb_return_output;
     VAR_MUX_uxn_c_l152_c6_4b3e_iffalse := VAR_y_MUX_uxn_c_l129_c2_21fb_return_output;
     -- UNARY_OP_NOT_uint1_t_uxn_c_l162_l169_DUPLICATE_e099 LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uint1_t_uxn_c_l162_l169_DUPLICATE_e099_expr <= VAR_UNARY_OP_NOT_uint1_t_uxn_c_l162_l169_DUPLICATE_e099_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uint1_t_uxn_c_l162_l169_DUPLICATE_e099_return_output := UNARY_OP_NOT_uint1_t_uxn_c_l162_l169_DUPLICATE_e099_return_output;

     -- BIN_OP_PLUS[uxn_c_l141_c28_0acc] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l141_c28_0acc_left <= VAR_BIN_OP_PLUS_uxn_c_l141_c28_0acc_left;
     BIN_OP_PLUS_uxn_c_l141_c28_0acc_right <= VAR_BIN_OP_PLUS_uxn_c_l141_c28_0acc_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l141_c28_0acc_return_output := BIN_OP_PLUS_uxn_c_l141_c28_0acc_return_output;

     -- UNARY_OP_NOT[uxn_c_l155_c46_cf0c] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l155_c46_cf0c_expr <= VAR_UNARY_OP_NOT_uxn_c_l155_c46_cf0c_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l155_c46_cf0c_return_output := UNARY_OP_NOT_uxn_c_l155_c46_cf0c_return_output;

     -- BIN_OP_PLUS[uxn_c_l152_c25_060b] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l152_c25_060b_left <= VAR_BIN_OP_PLUS_uxn_c_l152_c25_060b_left;
     BIN_OP_PLUS_uxn_c_l152_c25_060b_right <= VAR_BIN_OP_PLUS_uxn_c_l152_c25_060b_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l152_c25_060b_return_output := BIN_OP_PLUS_uxn_c_l152_c25_060b_return_output;

     -- BIN_OP_EQ[uxn_c_l151_c29_c23f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l151_c29_c23f_left <= VAR_BIN_OP_EQ_uxn_c_l151_c29_c23f_left;
     BIN_OP_EQ_uxn_c_l151_c29_c23f_right <= VAR_BIN_OP_EQ_uxn_c_l151_c29_c23f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l151_c29_c23f_return_output := BIN_OP_EQ_uxn_c_l151_c29_c23f_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_c_l149_c54_0830] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_c_l149_c54_0830_left <= VAR_BIN_OP_INFERRED_MULT_uxn_c_l149_c54_0830_left;
     BIN_OP_INFERRED_MULT_uxn_c_l149_c54_0830_right <= VAR_BIN_OP_INFERRED_MULT_uxn_c_l149_c54_0830_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l149_c54_0830_return_output := BIN_OP_INFERRED_MULT_uxn_c_l149_c54_0830_return_output;

     -- BIN_OP_AND[uxn_c_l156_c27_8aaf] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l156_c27_8aaf_left <= VAR_BIN_OP_AND_uxn_c_l156_c27_8aaf_left;
     BIN_OP_AND_uxn_c_l156_c27_8aaf_right <= VAR_BIN_OP_AND_uxn_c_l156_c27_8aaf_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l156_c27_8aaf_return_output := BIN_OP_AND_uxn_c_l156_c27_8aaf_return_output;

     -- BIN_OP_PLUS[uxn_c_l153_c34_74c3] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l153_c34_74c3_left <= VAR_BIN_OP_PLUS_uxn_c_l153_c34_74c3_left;
     BIN_OP_PLUS_uxn_c_l153_c34_74c3_right <= VAR_BIN_OP_PLUS_uxn_c_l153_c34_74c3_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l153_c34_74c3_return_output := BIN_OP_PLUS_uxn_c_l153_c34_74c3_return_output;

     -- Submodule level 6
     VAR_BIN_OP_OR_uxn_c_l169_c3_1298_left := VAR_BIN_OP_AND_uxn_c_l156_c27_8aaf_return_output;
     VAR_MUX_uxn_c_l168_c3_c168_cond := VAR_BIN_OP_AND_uxn_c_l156_c27_8aaf_return_output;
     VAR_MUX_uxn_c_l151_c29_be88_cond := VAR_BIN_OP_EQ_uxn_c_l151_c29_c23f_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l149_c54_1a6c_left := VAR_BIN_OP_INFERRED_MULT_uxn_c_l149_c54_0830_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l141_c28_f55d_left := VAR_BIN_OP_PLUS_uxn_c_l141_c28_0acc_return_output;
     VAR_MUX_uxn_c_l152_c6_4b3e_iftrue := resize(VAR_BIN_OP_PLUS_uxn_c_l152_c25_060b_return_output, 16);
     VAR_MUX_uxn_c_l153_c6_2797_iffalse := resize(VAR_BIN_OP_PLUS_uxn_c_l153_c34_74c3_return_output, 16);
     VAR_BIN_OP_AND_uxn_c_l155_c27_0d31_right := VAR_UNARY_OP_NOT_uxn_c_l155_c46_cf0c_return_output;
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l162_l169_DUPLICATE_8822_left := VAR_UNARY_OP_NOT_uint1_t_uxn_c_l162_l169_DUPLICATE_e099_return_output;
     -- MUX[uxn_c_l151_c29_be88] LATENCY=0
     -- Inputs
     MUX_uxn_c_l151_c29_be88_cond <= VAR_MUX_uxn_c_l151_c29_be88_cond;
     MUX_uxn_c_l151_c29_be88_iftrue <= VAR_MUX_uxn_c_l151_c29_be88_iftrue;
     MUX_uxn_c_l151_c29_be88_iffalse <= VAR_MUX_uxn_c_l151_c29_be88_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l151_c29_be88_return_output := MUX_uxn_c_l151_c29_be88_return_output;

     -- MUX[uxn_c_l168_c3_c168] LATENCY=0
     -- Inputs
     MUX_uxn_c_l168_c3_c168_cond <= VAR_MUX_uxn_c_l168_c3_c168_cond;
     MUX_uxn_c_l168_c3_c168_iftrue <= VAR_MUX_uxn_c_l168_c3_c168_iftrue;
     MUX_uxn_c_l168_c3_c168_iffalse <= VAR_MUX_uxn_c_l168_c3_c168_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l168_c3_c168_return_output := MUX_uxn_c_l168_c3_c168_return_output;

     -- BIN_OP_AND[uxn_c_l155_c27_0d31] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l155_c27_0d31_left <= VAR_BIN_OP_AND_uxn_c_l155_c27_0d31_left;
     BIN_OP_AND_uxn_c_l155_c27_0d31_right <= VAR_BIN_OP_AND_uxn_c_l155_c27_0d31_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l155_c27_0d31_return_output := BIN_OP_AND_uxn_c_l155_c27_0d31_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_c_l141_c28_f55d] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_c_l141_c28_f55d_left <= VAR_BIN_OP_INFERRED_MULT_uxn_c_l141_c28_f55d_left;
     BIN_OP_INFERRED_MULT_uxn_c_l141_c28_f55d_right <= VAR_BIN_OP_INFERRED_MULT_uxn_c_l141_c28_f55d_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l141_c28_f55d_return_output := BIN_OP_INFERRED_MULT_uxn_c_l141_c28_f55d_return_output;

     -- BIN_OP_AND_uint1_t_uint1_t_uxn_c_l162_l169_DUPLICATE_8822 LATENCY=0
     -- Inputs
     BIN_OP_AND_uint1_t_uint1_t_uxn_c_l162_l169_DUPLICATE_8822_left <= VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l162_l169_DUPLICATE_8822_left;
     BIN_OP_AND_uint1_t_uint1_t_uxn_c_l162_l169_DUPLICATE_8822_right <= VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l162_l169_DUPLICATE_8822_right;
     -- Outputs
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l162_l169_DUPLICATE_8822_return_output := BIN_OP_AND_uint1_t_uint1_t_uxn_c_l162_l169_DUPLICATE_8822_return_output;

     -- BIN_OP_PLUS[uxn_c_l149_c54_1a6c] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l149_c54_1a6c_left <= VAR_BIN_OP_PLUS_uxn_c_l149_c54_1a6c_left;
     BIN_OP_PLUS_uxn_c_l149_c54_1a6c_right <= VAR_BIN_OP_PLUS_uxn_c_l149_c54_1a6c_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l149_c54_1a6c_return_output := BIN_OP_PLUS_uxn_c_l149_c54_1a6c_return_output;

     -- Submodule level 7
     VAR_BIN_OP_OR_uxn_c_l162_c3_870e_left := VAR_BIN_OP_AND_uxn_c_l155_c27_0d31_return_output;
     VAR_MUX_uxn_c_l161_c3_b555_cond := VAR_BIN_OP_AND_uxn_c_l155_c27_0d31_return_output;
     VAR_BIN_OP_AND_uxn_c_l162_c22_9452_left := VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l162_l169_DUPLICATE_8822_return_output;
     VAR_BIN_OP_AND_uxn_c_l169_c22_4521_left := VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l162_l169_DUPLICATE_8822_return_output;
     VAR_fill_pixels_remaining_uxn_c_l141_c3_2681 := resize(VAR_BIN_OP_INFERRED_MULT_uxn_c_l141_c28_f55d_return_output, 16);
     VAR_MUX_uxn_c_l149_c35_6c41_iftrue := resize(VAR_BIN_OP_PLUS_uxn_c_l149_c54_1a6c_return_output, 16);
     VAR_MUX_uxn_c_l152_c6_4b3e_cond := VAR_MUX_uxn_c_l151_c29_be88_return_output;
     VAR_MUX_uxn_c_l153_c6_2797_cond := VAR_MUX_uxn_c_l151_c29_be88_return_output;
     VAR_fg_vram_update_uxn_c_l165_c27_8a12_write_value := VAR_MUX_uxn_c_l168_c3_c168_return_output;
     VAR_fill_pixels_remaining_MUX_uxn_c_l129_c2_21fb_iftrue := VAR_fill_pixels_remaining_uxn_c_l141_c3_2681;
     -- MUX[uxn_c_l152_c6_4b3e] LATENCY=0
     -- Inputs
     MUX_uxn_c_l152_c6_4b3e_cond <= VAR_MUX_uxn_c_l152_c6_4b3e_cond;
     MUX_uxn_c_l152_c6_4b3e_iftrue <= VAR_MUX_uxn_c_l152_c6_4b3e_iftrue;
     MUX_uxn_c_l152_c6_4b3e_iffalse <= VAR_MUX_uxn_c_l152_c6_4b3e_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l152_c6_4b3e_return_output := MUX_uxn_c_l152_c6_4b3e_return_output;

     -- fill_pixels_remaining_MUX[uxn_c_l129_c2_21fb] LATENCY=0
     -- Inputs
     fill_pixels_remaining_MUX_uxn_c_l129_c2_21fb_cond <= VAR_fill_pixels_remaining_MUX_uxn_c_l129_c2_21fb_cond;
     fill_pixels_remaining_MUX_uxn_c_l129_c2_21fb_iftrue <= VAR_fill_pixels_remaining_MUX_uxn_c_l129_c2_21fb_iftrue;
     fill_pixels_remaining_MUX_uxn_c_l129_c2_21fb_iffalse <= VAR_fill_pixels_remaining_MUX_uxn_c_l129_c2_21fb_iffalse;
     -- Outputs
     VAR_fill_pixels_remaining_MUX_uxn_c_l129_c2_21fb_return_output := fill_pixels_remaining_MUX_uxn_c_l129_c2_21fb_return_output;

     -- MUX[uxn_c_l153_c6_2797] LATENCY=0
     -- Inputs
     MUX_uxn_c_l153_c6_2797_cond <= VAR_MUX_uxn_c_l153_c6_2797_cond;
     MUX_uxn_c_l153_c6_2797_iftrue <= VAR_MUX_uxn_c_l153_c6_2797_iftrue;
     MUX_uxn_c_l153_c6_2797_iffalse <= VAR_MUX_uxn_c_l153_c6_2797_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l153_c6_2797_return_output := MUX_uxn_c_l153_c6_2797_return_output;

     -- MUX[uxn_c_l161_c3_b555] LATENCY=0
     -- Inputs
     MUX_uxn_c_l161_c3_b555_cond <= VAR_MUX_uxn_c_l161_c3_b555_cond;
     MUX_uxn_c_l161_c3_b555_iftrue <= VAR_MUX_uxn_c_l161_c3_b555_iftrue;
     MUX_uxn_c_l161_c3_b555_iffalse <= VAR_MUX_uxn_c_l161_c3_b555_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l161_c3_b555_return_output := MUX_uxn_c_l161_c3_b555_return_output;

     -- BIN_OP_AND[uxn_c_l169_c22_4521] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l169_c22_4521_left <= VAR_BIN_OP_AND_uxn_c_l169_c22_4521_left;
     BIN_OP_AND_uxn_c_l169_c22_4521_right <= VAR_BIN_OP_AND_uxn_c_l169_c22_4521_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l169_c22_4521_return_output := BIN_OP_AND_uxn_c_l169_c22_4521_return_output;

     -- MUX[uxn_c_l149_c35_6c41] LATENCY=0
     -- Inputs
     MUX_uxn_c_l149_c35_6c41_cond <= VAR_MUX_uxn_c_l149_c35_6c41_cond;
     MUX_uxn_c_l149_c35_6c41_iftrue <= VAR_MUX_uxn_c_l149_c35_6c41_iftrue;
     MUX_uxn_c_l149_c35_6c41_iffalse <= VAR_MUX_uxn_c_l149_c35_6c41_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l149_c35_6c41_return_output := MUX_uxn_c_l149_c35_6c41_return_output;

     -- BIN_OP_AND[uxn_c_l162_c22_9452] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l162_c22_9452_left <= VAR_BIN_OP_AND_uxn_c_l162_c22_9452_left;
     BIN_OP_AND_uxn_c_l162_c22_9452_right <= VAR_BIN_OP_AND_uxn_c_l162_c22_9452_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l162_c22_9452_return_output := BIN_OP_AND_uxn_c_l162_c22_9452_return_output;

     -- Submodule level 8
     VAR_BIN_OP_OR_uxn_c_l162_c3_870e_right := VAR_BIN_OP_AND_uxn_c_l162_c22_9452_return_output;
     VAR_BIN_OP_OR_uxn_c_l169_c3_1298_right := VAR_BIN_OP_AND_uxn_c_l169_c22_4521_return_output;
     VAR_bg_vram_update_uxn_c_l158_c27_ad56_write_address := VAR_MUX_uxn_c_l149_c35_6c41_return_output;
     VAR_fg_vram_update_uxn_c_l165_c27_8a12_write_address := VAR_MUX_uxn_c_l149_c35_6c41_return_output;
     REG_VAR_y := VAR_MUX_uxn_c_l152_c6_4b3e_return_output;
     REG_VAR_x := VAR_MUX_uxn_c_l153_c6_2797_return_output;
     VAR_bg_vram_update_uxn_c_l158_c27_ad56_write_value := VAR_MUX_uxn_c_l161_c3_b555_return_output;
     VAR_BIN_OP_MINUS_uxn_c_l172_c43_1197_left := VAR_fill_pixels_remaining_MUX_uxn_c_l129_c2_21fb_return_output;
     -- BIN_OP_OR[uxn_c_l162_c3_870e] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l162_c3_870e_left <= VAR_BIN_OP_OR_uxn_c_l162_c3_870e_left;
     BIN_OP_OR_uxn_c_l162_c3_870e_right <= VAR_BIN_OP_OR_uxn_c_l162_c3_870e_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l162_c3_870e_return_output := BIN_OP_OR_uxn_c_l162_c3_870e_return_output;

     -- BIN_OP_MINUS[uxn_c_l172_c43_1197] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l172_c43_1197_left <= VAR_BIN_OP_MINUS_uxn_c_l172_c43_1197_left;
     BIN_OP_MINUS_uxn_c_l172_c43_1197_right <= VAR_BIN_OP_MINUS_uxn_c_l172_c43_1197_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l172_c43_1197_return_output := BIN_OP_MINUS_uxn_c_l172_c43_1197_return_output;

     -- BIN_OP_OR[uxn_c_l169_c3_1298] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l169_c3_1298_left <= VAR_BIN_OP_OR_uxn_c_l169_c3_1298_left;
     BIN_OP_OR_uxn_c_l169_c3_1298_right <= VAR_BIN_OP_OR_uxn_c_l169_c3_1298_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l169_c3_1298_return_output := BIN_OP_OR_uxn_c_l169_c3_1298_return_output;

     -- Submodule level 9
     VAR_MUX_uxn_c_l172_c26_badd_iftrue := VAR_BIN_OP_MINUS_uxn_c_l172_c43_1197_return_output;
     VAR_bg_vram_update_uxn_c_l158_c27_ad56_write_enable := VAR_BIN_OP_OR_uxn_c_l162_c3_870e_return_output;
     VAR_fg_vram_update_uxn_c_l165_c27_8a12_write_enable := VAR_BIN_OP_OR_uxn_c_l169_c3_1298_return_output;
     -- MUX[uxn_c_l172_c26_badd] LATENCY=0
     -- Inputs
     MUX_uxn_c_l172_c26_badd_cond <= VAR_MUX_uxn_c_l172_c26_badd_cond;
     MUX_uxn_c_l172_c26_badd_iftrue <= VAR_MUX_uxn_c_l172_c26_badd_iftrue;
     MUX_uxn_c_l172_c26_badd_iffalse <= VAR_MUX_uxn_c_l172_c26_badd_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l172_c26_badd_return_output := MUX_uxn_c_l172_c26_badd_return_output;

     -- bg_vram_update[uxn_c_l158_c27_ad56] LATENCY=0
     -- Clock enable
     bg_vram_update_uxn_c_l158_c27_ad56_CLOCK_ENABLE <= VAR_bg_vram_update_uxn_c_l158_c27_ad56_CLOCK_ENABLE;
     -- Inputs
     bg_vram_update_uxn_c_l158_c27_ad56_read_address <= VAR_bg_vram_update_uxn_c_l158_c27_ad56_read_address;
     bg_vram_update_uxn_c_l158_c27_ad56_write_address <= VAR_bg_vram_update_uxn_c_l158_c27_ad56_write_address;
     bg_vram_update_uxn_c_l158_c27_ad56_write_value <= VAR_bg_vram_update_uxn_c_l158_c27_ad56_write_value;
     bg_vram_update_uxn_c_l158_c27_ad56_write_enable <= VAR_bg_vram_update_uxn_c_l158_c27_ad56_write_enable;
     -- Outputs
     VAR_bg_vram_update_uxn_c_l158_c27_ad56_return_output := bg_vram_update_uxn_c_l158_c27_ad56_return_output;

     -- fg_vram_update[uxn_c_l165_c27_8a12] LATENCY=0
     -- Clock enable
     fg_vram_update_uxn_c_l165_c27_8a12_CLOCK_ENABLE <= VAR_fg_vram_update_uxn_c_l165_c27_8a12_CLOCK_ENABLE;
     -- Inputs
     fg_vram_update_uxn_c_l165_c27_8a12_read_address <= VAR_fg_vram_update_uxn_c_l165_c27_8a12_read_address;
     fg_vram_update_uxn_c_l165_c27_8a12_write_address <= VAR_fg_vram_update_uxn_c_l165_c27_8a12_write_address;
     fg_vram_update_uxn_c_l165_c27_8a12_write_value <= VAR_fg_vram_update_uxn_c_l165_c27_8a12_write_value;
     fg_vram_update_uxn_c_l165_c27_8a12_write_enable <= VAR_fg_vram_update_uxn_c_l165_c27_8a12_write_enable;
     -- Outputs
     VAR_fg_vram_update_uxn_c_l165_c27_8a12_return_output := fg_vram_update_uxn_c_l165_c27_8a12_return_output;

     -- Submodule level 10
     VAR_BIN_OP_EQ_uxn_c_l173_c19_9bde_left := VAR_MUX_uxn_c_l172_c26_badd_return_output;
     REG_VAR_fill_pixels_remaining := VAR_MUX_uxn_c_l172_c26_badd_return_output;
     VAR_MUX_uxn_c_l176_c17_970b_iftrue := VAR_bg_vram_update_uxn_c_l158_c27_ad56_return_output;
     VAR_BIN_OP_EQ_uxn_c_l176_c17_8e5b_left := VAR_fg_vram_update_uxn_c_l165_c27_8a12_return_output;
     VAR_MUX_uxn_c_l176_c17_970b_iffalse := VAR_fg_vram_update_uxn_c_l165_c27_8a12_return_output;
     -- BIN_OP_EQ[uxn_c_l176_c17_8e5b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l176_c17_8e5b_left <= VAR_BIN_OP_EQ_uxn_c_l176_c17_8e5b_left;
     BIN_OP_EQ_uxn_c_l176_c17_8e5b_right <= VAR_BIN_OP_EQ_uxn_c_l176_c17_8e5b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l176_c17_8e5b_return_output := BIN_OP_EQ_uxn_c_l176_c17_8e5b_return_output;

     -- BIN_OP_EQ[uxn_c_l173_c19_9bde] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l173_c19_9bde_left <= VAR_BIN_OP_EQ_uxn_c_l173_c19_9bde_left;
     BIN_OP_EQ_uxn_c_l173_c19_9bde_right <= VAR_BIN_OP_EQ_uxn_c_l173_c19_9bde_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l173_c19_9bde_return_output := BIN_OP_EQ_uxn_c_l173_c19_9bde_return_output;

     -- Submodule level 11
     VAR_MUX_uxn_c_l173_c19_81a5_cond := VAR_BIN_OP_EQ_uxn_c_l173_c19_9bde_return_output;
     VAR_MUX_uxn_c_l176_c17_970b_cond := VAR_BIN_OP_EQ_uxn_c_l176_c17_8e5b_return_output;
     -- MUX[uxn_c_l176_c17_970b] LATENCY=0
     -- Inputs
     MUX_uxn_c_l176_c17_970b_cond <= VAR_MUX_uxn_c_l176_c17_970b_cond;
     MUX_uxn_c_l176_c17_970b_iftrue <= VAR_MUX_uxn_c_l176_c17_970b_iftrue;
     MUX_uxn_c_l176_c17_970b_iffalse <= VAR_MUX_uxn_c_l176_c17_970b_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l176_c17_970b_return_output := MUX_uxn_c_l176_c17_970b_return_output;

     -- MUX[uxn_c_l173_c19_81a5] LATENCY=0
     -- Inputs
     MUX_uxn_c_l173_c19_81a5_cond <= VAR_MUX_uxn_c_l173_c19_81a5_cond;
     MUX_uxn_c_l173_c19_81a5_iftrue <= VAR_MUX_uxn_c_l173_c19_81a5_iftrue;
     MUX_uxn_c_l173_c19_81a5_iffalse <= VAR_MUX_uxn_c_l173_c19_81a5_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l173_c19_81a5_return_output := MUX_uxn_c_l173_c19_81a5_return_output;

     -- Submodule level 12
     REG_VAR_is_fill_active := VAR_MUX_uxn_c_l173_c19_81a5_return_output;
     -- CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_269d[uxn_c_l179_c9_6f92] LATENCY=0
     VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_269d_uxn_c_l179_c9_6f92_return_output := CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_269d(
     VAR_MUX_uxn_c_l175_c25_3226_return_output,
     VAR_MUX_uxn_c_l176_c17_970b_return_output,
     VAR_MUX_uxn_c_l173_c19_81a5_return_output);

     -- Submodule level 13
     VAR_return_output := VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_269d_uxn_c_l179_c9_6f92_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_fill_pixels_remaining <= REG_VAR_fill_pixels_remaining;
REG_COMB_fill_x0 <= REG_VAR_fill_x0;
REG_COMB_fill_y0 <= REG_VAR_fill_y0;
REG_COMB_fill_x1 <= REG_VAR_fill_x1;
REG_COMB_fill_y1 <= REG_VAR_fill_y1;
REG_COMB_fill_color <= REG_VAR_fill_color;
REG_COMB_is_fill_active <= REG_VAR_is_fill_active;
REG_COMB_fill_layer <= REG_VAR_fill_layer;
REG_COMB_pixel_counter <= REG_VAR_pixel_counter;
REG_COMB_x <= REG_VAR_x;
REG_COMB_y <= REG_VAR_y;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     fill_pixels_remaining <= REG_COMB_fill_pixels_remaining;
     fill_x0 <= REG_COMB_fill_x0;
     fill_y0 <= REG_COMB_fill_y0;
     fill_x1 <= REG_COMB_fill_x1;
     fill_y1 <= REG_COMB_fill_y1;
     fill_color <= REG_COMB_fill_color;
     is_fill_active <= REG_COMB_is_fill_active;
     fill_layer <= REG_COMB_fill_layer;
     pixel_counter <= REG_COMB_pixel_counter;
     x <= REG_COMB_x;
     y <= REG_COMB_y;
 end if;
 end if;
end process;

end arch;
