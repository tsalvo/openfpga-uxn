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
-- Submodules: 70
entity step_gpu_0CLK_57094e53 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 is_active_drawing_area : in unsigned(0 downto 0);
 is_vram_write : in unsigned(0 downto 0);
 vram_write_layer : in unsigned(0 downto 0);
 vram_address : in unsigned(31 downto 0);
 vram_value : in unsigned(1 downto 0);
 return_output : out gpu_step_result_t);
end step_gpu_0CLK_57094e53;
architecture arch of step_gpu_0CLK_57094e53 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal result : gpu_step_result_t := (
color => to_unsigned(0, 2),
is_active_fill => to_unsigned(0, 1))
;
signal vram_code : unsigned(3 downto 0) := to_unsigned(0, 4);
signal adjusted_vram_address : unsigned(31 downto 0) := to_unsigned(0, 32);
signal fill_pixels_remaining : unsigned(31 downto 0) := to_unsigned(0, 32);
signal fill_x0 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal fill_y0 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal fill_x1 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal fill_y1 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal fill_color : unsigned(1 downto 0) := to_unsigned(0, 2);
signal is_fill_active : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_fill_left : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_fill_top : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_fill_pixel : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_fill_pixel0 : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_fill_pixel1 : unsigned(0 downto 0) := to_unsigned(0, 1);
signal fill_layer : unsigned(0 downto 0) := to_unsigned(0, 1);
signal fill_isect_l : unsigned(0 downto 0) := to_unsigned(0, 1);
signal fill_isect_r : unsigned(0 downto 0) := to_unsigned(0, 1);
signal fill_isect_t : unsigned(0 downto 0) := to_unsigned(0, 1);
signal fill_isect_b : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_fill_code : unsigned(0 downto 0) := to_unsigned(0, 1);
signal fg_pixel_color : unsigned(1 downto 0) := to_unsigned(0, 2);
signal bg_pixel_color : unsigned(1 downto 0) := to_unsigned(0, 2);
signal pixel_counter : unsigned(31 downto 0) := to_unsigned(0, 32);
signal x : unsigned(15 downto 0) := to_unsigned(0, 16);
signal y : unsigned(15 downto 0) := to_unsigned(0, 16);
signal REG_COMB_result : gpu_step_result_t;
signal REG_COMB_vram_code : unsigned(3 downto 0);
signal REG_COMB_adjusted_vram_address : unsigned(31 downto 0);
signal REG_COMB_fill_pixels_remaining : unsigned(31 downto 0);
signal REG_COMB_fill_x0 : unsigned(15 downto 0);
signal REG_COMB_fill_y0 : unsigned(15 downto 0);
signal REG_COMB_fill_x1 : unsigned(15 downto 0);
signal REG_COMB_fill_y1 : unsigned(15 downto 0);
signal REG_COMB_fill_color : unsigned(1 downto 0);
signal REG_COMB_is_fill_active : unsigned(0 downto 0);
signal REG_COMB_is_fill_left : unsigned(0 downto 0);
signal REG_COMB_is_fill_top : unsigned(0 downto 0);
signal REG_COMB_is_fill_pixel : unsigned(0 downto 0);
signal REG_COMB_is_fill_pixel0 : unsigned(0 downto 0);
signal REG_COMB_is_fill_pixel1 : unsigned(0 downto 0);
signal REG_COMB_fill_layer : unsigned(0 downto 0);
signal REG_COMB_fill_isect_l : unsigned(0 downto 0);
signal REG_COMB_fill_isect_r : unsigned(0 downto 0);
signal REG_COMB_fill_isect_t : unsigned(0 downto 0);
signal REG_COMB_fill_isect_b : unsigned(0 downto 0);
signal REG_COMB_is_fill_code : unsigned(0 downto 0);
signal REG_COMB_fg_pixel_color : unsigned(1 downto 0);
signal REG_COMB_bg_pixel_color : unsigned(1 downto 0);
signal REG_COMB_pixel_counter : unsigned(31 downto 0);
signal REG_COMB_x : unsigned(15 downto 0);
signal REG_COMB_y : unsigned(15 downto 0);

-- Each function instance gets signals
-- BIN_OP_GT[uxn_c_l121_c26_d52f]
signal BIN_OP_GT_uxn_c_l121_c26_d52f_left : unsigned(31 downto 0);
signal BIN_OP_GT_uxn_c_l121_c26_d52f_right : unsigned(17 downto 0);
signal BIN_OP_GT_uxn_c_l121_c26_d52f_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l121_c26_ff0d]
signal MUX_uxn_c_l121_c26_ff0d_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l121_c26_ff0d_iftrue : unsigned(31 downto 0);
signal MUX_uxn_c_l121_c26_ff0d_iffalse : unsigned(31 downto 0);
signal MUX_uxn_c_l121_c26_ff0d_return_output : unsigned(31 downto 0);

-- CONST_SR_28[uxn_c_l122_c24_c0a0]
signal CONST_SR_28_uxn_c_l122_c24_c0a0_x : unsigned(31 downto 0);
signal CONST_SR_28_uxn_c_l122_c24_c0a0_return_output : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_c_l123_c17_3a1a]
signal BIN_OP_EQ_uxn_c_l123_c17_3a1a_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l123_c17_3a1a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l123_c17_3a1a_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l123_c17_52ea]
signal MUX_uxn_c_l123_c17_52ea_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l123_c17_52ea_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l123_c17_52ea_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l123_c17_52ea_return_output : unsigned(0 downto 0);

-- BIN_OP_DIV[uxn_c_l124_c6_e67f]
signal BIN_OP_DIV_uxn_c_l124_c6_e67f_left : unsigned(31 downto 0);
signal BIN_OP_DIV_uxn_c_l124_c6_e67f_right : unsigned(8 downto 0);
signal BIN_OP_DIV_uxn_c_l124_c6_e67f_return_output : unsigned(31 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_c_l125_c23_9c14]
signal BIN_OP_INFERRED_MULT_uxn_c_l125_c23_9c14_left : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_c_l125_c23_9c14_right : unsigned(8 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_c_l125_c23_9c14_return_output : unsigned(24 downto 0);

-- BIN_OP_MINUS[uxn_c_l125_c6_3c47]
signal BIN_OP_MINUS_uxn_c_l125_c6_3c47_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_uxn_c_l125_c6_3c47_right : unsigned(24 downto 0);
signal BIN_OP_MINUS_uxn_c_l125_c6_3c47_return_output : unsigned(31 downto 0);

-- UNARY_OP_NOT[uxn_c_l128_c22_dbee]
signal UNARY_OP_NOT_uxn_c_l128_c22_dbee_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l128_c22_dbee_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l128_c6_5560]
signal BIN_OP_AND_uxn_c_l128_c6_5560_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l128_c6_5560_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l128_c6_5560_return_output : unsigned(0 downto 0);

-- fill_x0_MUX[uxn_c_l128_c2_0b70]
signal fill_x0_MUX_uxn_c_l128_c2_0b70_cond : unsigned(0 downto 0);
signal fill_x0_MUX_uxn_c_l128_c2_0b70_iftrue : unsigned(15 downto 0);
signal fill_x0_MUX_uxn_c_l128_c2_0b70_iffalse : unsigned(15 downto 0);
signal fill_x0_MUX_uxn_c_l128_c2_0b70_return_output : unsigned(15 downto 0);

-- fill_x1_MUX[uxn_c_l128_c2_0b70]
signal fill_x1_MUX_uxn_c_l128_c2_0b70_cond : unsigned(0 downto 0);
signal fill_x1_MUX_uxn_c_l128_c2_0b70_iftrue : unsigned(15 downto 0);
signal fill_x1_MUX_uxn_c_l128_c2_0b70_iffalse : unsigned(15 downto 0);
signal fill_x1_MUX_uxn_c_l128_c2_0b70_return_output : unsigned(15 downto 0);

-- fill_layer_MUX[uxn_c_l128_c2_0b70]
signal fill_layer_MUX_uxn_c_l128_c2_0b70_cond : unsigned(0 downto 0);
signal fill_layer_MUX_uxn_c_l128_c2_0b70_iftrue : unsigned(0 downto 0);
signal fill_layer_MUX_uxn_c_l128_c2_0b70_iffalse : unsigned(0 downto 0);
signal fill_layer_MUX_uxn_c_l128_c2_0b70_return_output : unsigned(0 downto 0);

-- is_fill_top_MUX[uxn_c_l128_c2_0b70]
signal is_fill_top_MUX_uxn_c_l128_c2_0b70_cond : unsigned(0 downto 0);
signal is_fill_top_MUX_uxn_c_l128_c2_0b70_iftrue : unsigned(0 downto 0);
signal is_fill_top_MUX_uxn_c_l128_c2_0b70_iffalse : unsigned(0 downto 0);
signal is_fill_top_MUX_uxn_c_l128_c2_0b70_return_output : unsigned(0 downto 0);

-- fill_y1_MUX[uxn_c_l128_c2_0b70]
signal fill_y1_MUX_uxn_c_l128_c2_0b70_cond : unsigned(0 downto 0);
signal fill_y1_MUX_uxn_c_l128_c2_0b70_iftrue : unsigned(15 downto 0);
signal fill_y1_MUX_uxn_c_l128_c2_0b70_iffalse : unsigned(15 downto 0);
signal fill_y1_MUX_uxn_c_l128_c2_0b70_return_output : unsigned(15 downto 0);

-- fill_y0_MUX[uxn_c_l128_c2_0b70]
signal fill_y0_MUX_uxn_c_l128_c2_0b70_cond : unsigned(0 downto 0);
signal fill_y0_MUX_uxn_c_l128_c2_0b70_iftrue : unsigned(15 downto 0);
signal fill_y0_MUX_uxn_c_l128_c2_0b70_iffalse : unsigned(15 downto 0);
signal fill_y0_MUX_uxn_c_l128_c2_0b70_return_output : unsigned(15 downto 0);

-- fill_pixels_remaining_MUX[uxn_c_l128_c2_0b70]
signal fill_pixels_remaining_MUX_uxn_c_l128_c2_0b70_cond : unsigned(0 downto 0);
signal fill_pixels_remaining_MUX_uxn_c_l128_c2_0b70_iftrue : unsigned(31 downto 0);
signal fill_pixels_remaining_MUX_uxn_c_l128_c2_0b70_iffalse : unsigned(31 downto 0);
signal fill_pixels_remaining_MUX_uxn_c_l128_c2_0b70_return_output : unsigned(31 downto 0);

-- is_fill_left_MUX[uxn_c_l128_c2_0b70]
signal is_fill_left_MUX_uxn_c_l128_c2_0b70_cond : unsigned(0 downto 0);
signal is_fill_left_MUX_uxn_c_l128_c2_0b70_iftrue : unsigned(0 downto 0);
signal is_fill_left_MUX_uxn_c_l128_c2_0b70_iffalse : unsigned(0 downto 0);
signal is_fill_left_MUX_uxn_c_l128_c2_0b70_return_output : unsigned(0 downto 0);

-- fill_color_MUX[uxn_c_l128_c2_0b70]
signal fill_color_MUX_uxn_c_l128_c2_0b70_cond : unsigned(0 downto 0);
signal fill_color_MUX_uxn_c_l128_c2_0b70_iftrue : unsigned(1 downto 0);
signal fill_color_MUX_uxn_c_l128_c2_0b70_iffalse : unsigned(1 downto 0);
signal fill_color_MUX_uxn_c_l128_c2_0b70_return_output : unsigned(1 downto 0);

-- CONST_SR_20[uxn_c_l130_c18_42b3]
signal CONST_SR_20_uxn_c_l130_c18_42b3_x : unsigned(31 downto 0);
signal CONST_SR_20_uxn_c_l130_c18_42b3_return_output : unsigned(31 downto 0);

-- CONST_SR_21[uxn_c_l131_c17_4a10]
signal CONST_SR_21_uxn_c_l131_c17_4a10_x : unsigned(31 downto 0);
signal CONST_SR_21_uxn_c_l131_c17_4a10_return_output : unsigned(31 downto 0);

-- BIN_OP_AND[uxn_c_l132_c27_3dcb]
signal BIN_OP_AND_uxn_c_l132_c27_3dcb_left : unsigned(31 downto 0);
signal BIN_OP_AND_uxn_c_l132_c27_3dcb_right : unsigned(17 downto 0);
signal BIN_OP_AND_uxn_c_l132_c27_3dcb_return_output : unsigned(31 downto 0);

-- BIN_OP_DIV[uxn_c_l133_c13_bacd]
signal BIN_OP_DIV_uxn_c_l133_c13_bacd_left : unsigned(31 downto 0);
signal BIN_OP_DIV_uxn_c_l133_c13_bacd_right : unsigned(8 downto 0);
signal BIN_OP_DIV_uxn_c_l133_c13_bacd_return_output : unsigned(31 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_c_l134_c38_814c]
signal BIN_OP_INFERRED_MULT_uxn_c_l134_c38_814c_left : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_c_l134_c38_814c_right : unsigned(8 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_c_l134_c38_814c_return_output : unsigned(24 downto 0);

-- BIN_OP_MINUS[uxn_c_l134_c13_f57d]
signal BIN_OP_MINUS_uxn_c_l134_c13_f57d_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_uxn_c_l134_c13_f57d_right : unsigned(24 downto 0);
signal BIN_OP_MINUS_uxn_c_l134_c13_f57d_return_output : unsigned(31 downto 0);

-- MUX[uxn_c_l135_c13_a6a1]
signal MUX_uxn_c_l135_c13_a6a1_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l135_c13_a6a1_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l135_c13_a6a1_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l135_c13_a6a1_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l136_c13_4d0e]
signal MUX_uxn_c_l136_c13_4d0e_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l136_c13_4d0e_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l136_c13_4d0e_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l136_c13_4d0e_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l137_c13_51bd]
signal MUX_uxn_c_l137_c13_51bd_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l137_c13_51bd_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l137_c13_51bd_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l137_c13_51bd_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l138_c13_b4ab]
signal MUX_uxn_c_l138_c13_b4ab_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l138_c13_b4ab_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l138_c13_b4ab_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l138_c13_b4ab_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l144_c19_8ec9]
signal BIN_OP_EQ_uxn_c_l144_c19_8ec9_left : unsigned(31 downto 0);
signal BIN_OP_EQ_uxn_c_l144_c19_8ec9_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l144_c19_8ec9_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l144_c19_41aa]
signal MUX_uxn_c_l144_c19_41aa_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l144_c19_41aa_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l144_c19_41aa_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l144_c19_41aa_return_output : unsigned(0 downto 0);

-- BIN_OP_GT[uxn_c_l146_c17_580d]
signal BIN_OP_GT_uxn_c_l146_c17_580d_left : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_c_l146_c17_580d_right : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_c_l146_c17_580d_return_output : unsigned(0 downto 0);

-- BIN_OP_LT[uxn_c_l147_c17_291a]
signal BIN_OP_LT_uxn_c_l147_c17_291a_left : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_c_l147_c17_291a_right : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_c_l147_c17_291a_return_output : unsigned(0 downto 0);

-- BIN_OP_GT[uxn_c_l148_c17_ed21]
signal BIN_OP_GT_uxn_c_l148_c17_ed21_left : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_c_l148_c17_ed21_right : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_c_l148_c17_ed21_return_output : unsigned(0 downto 0);

-- BIN_OP_LT[uxn_c_l149_c17_83b1]
signal BIN_OP_LT_uxn_c_l149_c17_83b1_left : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_c_l149_c17_83b1_right : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_c_l149_c17_83b1_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l151_c18_360f]
signal BIN_OP_AND_uxn_c_l151_c18_360f_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l151_c18_360f_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l151_c18_360f_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l151_c18_3112]
signal BIN_OP_AND_uxn_c_l151_c18_3112_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l151_c18_3112_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l151_c18_3112_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l151_c18_7f9a]
signal BIN_OP_AND_uxn_c_l151_c18_7f9a_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l151_c18_7f9a_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l151_c18_7f9a_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l151_c18_59b8]
signal BIN_OP_AND_uxn_c_l151_c18_59b8_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l151_c18_59b8_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l151_c18_59b8_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_c_l152_c37_4d4e]
signal UNARY_OP_NOT_uxn_c_l152_c37_4d4e_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l152_c37_4d4e_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l152_c19_9ac1]
signal BIN_OP_AND_uxn_c_l152_c19_9ac1_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l152_c19_9ac1_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l152_c19_9ac1_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l153_c19_a880]
signal BIN_OP_AND_uxn_c_l153_c19_a880_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l153_c19_a880_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l153_c19_a880_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l157_c37_3512]
signal MUX_uxn_c_l157_c37_3512_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l157_c37_3512_iftrue : unsigned(31 downto 0);
signal MUX_uxn_c_l157_c37_3512_iffalse : unsigned(31 downto 0);
signal MUX_uxn_c_l157_c37_3512_return_output : unsigned(31 downto 0);

-- MUX[uxn_c_l157_c3_193e]
signal MUX_uxn_c_l157_c3_193e_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l157_c3_193e_iftrue : unsigned(31 downto 0);
signal MUX_uxn_c_l157_c3_193e_iffalse : unsigned(31 downto 0);
signal MUX_uxn_c_l157_c3_193e_return_output : unsigned(31 downto 0);

-- MUX[uxn_c_l158_c3_4d4b]
signal MUX_uxn_c_l158_c3_4d4b_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l158_c3_4d4b_iftrue : unsigned(1 downto 0);
signal MUX_uxn_c_l158_c3_4d4b_iffalse : unsigned(1 downto 0);
signal MUX_uxn_c_l158_c3_4d4b_return_output : unsigned(1 downto 0);

-- UNARY_OP_NOT[uxn_c_l159_c57_40ff]
signal UNARY_OP_NOT_uxn_c_l159_c57_40ff_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l159_c57_40ff_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l159_c22_a84d]
signal BIN_OP_AND_uxn_c_l159_c22_a84d_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l159_c22_a84d_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l159_c22_a84d_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_c_l159_c3_f5d5]
signal BIN_OP_OR_uxn_c_l159_c3_f5d5_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l159_c3_f5d5_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l159_c3_f5d5_return_output : unsigned(0 downto 0);

-- bg_vram_update[uxn_c_l155_c19_b903]
signal bg_vram_update_uxn_c_l155_c19_b903_CLOCK_ENABLE : unsigned(0 downto 0);
signal bg_vram_update_uxn_c_l155_c19_b903_read_address : unsigned(31 downto 0);
signal bg_vram_update_uxn_c_l155_c19_b903_write_address : unsigned(31 downto 0);
signal bg_vram_update_uxn_c_l155_c19_b903_write_value : unsigned(1 downto 0);
signal bg_vram_update_uxn_c_l155_c19_b903_write_enable : unsigned(0 downto 0);
signal bg_vram_update_uxn_c_l155_c19_b903_return_output : unsigned(1 downto 0);

-- MUX[uxn_c_l164_c37_f239]
signal MUX_uxn_c_l164_c37_f239_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l164_c37_f239_iftrue : unsigned(31 downto 0);
signal MUX_uxn_c_l164_c37_f239_iffalse : unsigned(31 downto 0);
signal MUX_uxn_c_l164_c37_f239_return_output : unsigned(31 downto 0);

-- MUX[uxn_c_l164_c3_b2cf]
signal MUX_uxn_c_l164_c3_b2cf_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l164_c3_b2cf_iftrue : unsigned(31 downto 0);
signal MUX_uxn_c_l164_c3_b2cf_iffalse : unsigned(31 downto 0);
signal MUX_uxn_c_l164_c3_b2cf_return_output : unsigned(31 downto 0);

-- MUX[uxn_c_l165_c3_f996]
signal MUX_uxn_c_l165_c3_f996_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l165_c3_f996_iftrue : unsigned(1 downto 0);
signal MUX_uxn_c_l165_c3_f996_iffalse : unsigned(1 downto 0);
signal MUX_uxn_c_l165_c3_f996_return_output : unsigned(1 downto 0);

-- BIN_OP_AND[uxn_c_l166_c22_dc99]
signal BIN_OP_AND_uxn_c_l166_c22_dc99_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l166_c22_dc99_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l166_c22_dc99_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_c_l166_c3_7af1]
signal BIN_OP_OR_uxn_c_l166_c3_7af1_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l166_c3_7af1_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l166_c3_7af1_return_output : unsigned(0 downto 0);

-- fg_vram_update[uxn_c_l162_c19_9eff]
signal fg_vram_update_uxn_c_l162_c19_9eff_CLOCK_ENABLE : unsigned(0 downto 0);
signal fg_vram_update_uxn_c_l162_c19_9eff_read_address : unsigned(31 downto 0);
signal fg_vram_update_uxn_c_l162_c19_9eff_write_address : unsigned(31 downto 0);
signal fg_vram_update_uxn_c_l162_c19_9eff_write_value : unsigned(1 downto 0);
signal fg_vram_update_uxn_c_l162_c19_9eff_write_enable : unsigned(0 downto 0);
signal fg_vram_update_uxn_c_l162_c19_9eff_return_output : unsigned(1 downto 0);

-- BIN_OP_EQ[uxn_c_l170_c6_77ca]
signal BIN_OP_EQ_uxn_c_l170_c6_77ca_left : unsigned(31 downto 0);
signal BIN_OP_EQ_uxn_c_l170_c6_77ca_right : unsigned(17 downto 0);
signal BIN_OP_EQ_uxn_c_l170_c6_77ca_return_output : unsigned(0 downto 0);

-- pixel_counter_MUX[uxn_c_l170_c2_f6e8]
signal pixel_counter_MUX_uxn_c_l170_c2_f6e8_cond : unsigned(0 downto 0);
signal pixel_counter_MUX_uxn_c_l170_c2_f6e8_iftrue : unsigned(31 downto 0);
signal pixel_counter_MUX_uxn_c_l170_c2_f6e8_iffalse : unsigned(31 downto 0);
signal pixel_counter_MUX_uxn_c_l170_c2_f6e8_return_output : unsigned(31 downto 0);

-- fill_pixels_remaining_MUX[uxn_c_l170_c2_f6e8]
signal fill_pixels_remaining_MUX_uxn_c_l170_c2_f6e8_cond : unsigned(0 downto 0);
signal fill_pixels_remaining_MUX_uxn_c_l170_c2_f6e8_iftrue : unsigned(31 downto 0);
signal fill_pixels_remaining_MUX_uxn_c_l170_c2_f6e8_iffalse : unsigned(31 downto 0);
signal fill_pixels_remaining_MUX_uxn_c_l170_c2_f6e8_return_output : unsigned(31 downto 0);

-- pixel_counter_MUX[uxn_c_l172_c9_f573]
signal pixel_counter_MUX_uxn_c_l172_c9_f573_cond : unsigned(0 downto 0);
signal pixel_counter_MUX_uxn_c_l172_c9_f573_iftrue : unsigned(31 downto 0);
signal pixel_counter_MUX_uxn_c_l172_c9_f573_iffalse : unsigned(31 downto 0);
signal pixel_counter_MUX_uxn_c_l172_c9_f573_return_output : unsigned(31 downto 0);

-- fill_pixels_remaining_MUX[uxn_c_l172_c9_f573]
signal fill_pixels_remaining_MUX_uxn_c_l172_c9_f573_cond : unsigned(0 downto 0);
signal fill_pixels_remaining_MUX_uxn_c_l172_c9_f573_iftrue : unsigned(31 downto 0);
signal fill_pixels_remaining_MUX_uxn_c_l172_c9_f573_iffalse : unsigned(31 downto 0);
signal fill_pixels_remaining_MUX_uxn_c_l172_c9_f573_return_output : unsigned(31 downto 0);

-- BIN_OP_PLUS[uxn_c_l173_c3_b586]
signal BIN_OP_PLUS_uxn_c_l173_c3_b586_left : unsigned(31 downto 0);
signal BIN_OP_PLUS_uxn_c_l173_c3_b586_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l173_c3_b586_return_output : unsigned(32 downto 0);

-- BIN_OP_EQ[uxn_c_l174_c27_df5f]
signal BIN_OP_EQ_uxn_c_l174_c27_df5f_left : unsigned(31 downto 0);
signal BIN_OP_EQ_uxn_c_l174_c27_df5f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l174_c27_df5f_return_output : unsigned(0 downto 0);

-- BIN_OP_MINUS[uxn_c_l174_c60_5029]
signal BIN_OP_MINUS_uxn_c_l174_c60_5029_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_uxn_c_l174_c60_5029_right : unsigned(0 downto 0);
signal BIN_OP_MINUS_uxn_c_l174_c60_5029_return_output : unsigned(31 downto 0);

-- MUX[uxn_c_l174_c27_42eb]
signal MUX_uxn_c_l174_c27_42eb_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l174_c27_42eb_iftrue : unsigned(31 downto 0);
signal MUX_uxn_c_l174_c27_42eb_iffalse : unsigned(31 downto 0);
signal MUX_uxn_c_l174_c27_42eb_return_output : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_c_l177_c17_73f6]
signal BIN_OP_EQ_uxn_c_l177_c17_73f6_left : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l177_c17_73f6_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l177_c17_73f6_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l177_c17_8e24]
signal MUX_uxn_c_l177_c17_8e24_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l177_c17_8e24_iftrue : unsigned(1 downto 0);
signal MUX_uxn_c_l177_c17_8e24_iffalse : unsigned(1 downto 0);
signal MUX_uxn_c_l177_c17_8e24_return_output : unsigned(1 downto 0);

-- UNARY_OP_NOT_uint1_t_uxn_c_l159_l166_DUPLICATE_16d9
signal UNARY_OP_NOT_uint1_t_uxn_c_l159_l166_DUPLICATE_16d9_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uint1_t_uxn_c_l159_l166_DUPLICATE_16d9_return_output : unsigned(0 downto 0);

-- BIN_OP_AND_uint1_t_uint1_t_uxn_c_l166_l159_DUPLICATE_0d27
signal BIN_OP_AND_uint1_t_uint1_t_uxn_c_l166_l159_DUPLICATE_0d27_left : unsigned(0 downto 0);
signal BIN_OP_AND_uint1_t_uint1_t_uxn_c_l166_l159_DUPLICATE_0d27_right : unsigned(0 downto 0);
signal BIN_OP_AND_uint1_t_uint1_t_uxn_c_l166_l159_DUPLICATE_0d27_return_output : unsigned(0 downto 0);

function CAST_TO_uint4_t_uint32_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(31 downto 0);
  variable return_output : unsigned(3 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,4)));
    return return_output;
end function;

function CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_6984( ref_toks_0 : unsigned;
 ref_toks_1 : unsigned) return gpu_step_result_t is
 
  variable base : gpu_step_result_t; 
  variable return_output : gpu_step_result_t;
begin
      base.color := ref_toks_0;
      base.is_active_fill := ref_toks_1;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_GT_uxn_c_l121_c26_d52f
BIN_OP_GT_uxn_c_l121_c26_d52f : entity work.BIN_OP_GT_uint32_t_uint18_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_c_l121_c26_d52f_left,
BIN_OP_GT_uxn_c_l121_c26_d52f_right,
BIN_OP_GT_uxn_c_l121_c26_d52f_return_output);

-- MUX_uxn_c_l121_c26_ff0d
MUX_uxn_c_l121_c26_ff0d : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
MUX_uxn_c_l121_c26_ff0d_cond,
MUX_uxn_c_l121_c26_ff0d_iftrue,
MUX_uxn_c_l121_c26_ff0d_iffalse,
MUX_uxn_c_l121_c26_ff0d_return_output);

-- CONST_SR_28_uxn_c_l122_c24_c0a0
CONST_SR_28_uxn_c_l122_c24_c0a0 : entity work.CONST_SR_28_uint32_t_0CLK_de264c78 port map (
CONST_SR_28_uxn_c_l122_c24_c0a0_x,
CONST_SR_28_uxn_c_l122_c24_c0a0_return_output);

-- BIN_OP_EQ_uxn_c_l123_c17_3a1a
BIN_OP_EQ_uxn_c_l123_c17_3a1a : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l123_c17_3a1a_left,
BIN_OP_EQ_uxn_c_l123_c17_3a1a_right,
BIN_OP_EQ_uxn_c_l123_c17_3a1a_return_output);

-- MUX_uxn_c_l123_c17_52ea
MUX_uxn_c_l123_c17_52ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l123_c17_52ea_cond,
MUX_uxn_c_l123_c17_52ea_iftrue,
MUX_uxn_c_l123_c17_52ea_iffalse,
MUX_uxn_c_l123_c17_52ea_return_output);

-- BIN_OP_DIV_uxn_c_l124_c6_e67f
BIN_OP_DIV_uxn_c_l124_c6_e67f : entity work.BIN_OP_DIV_uint32_t_uint9_t_0CLK_422b4ffb port map (
BIN_OP_DIV_uxn_c_l124_c6_e67f_left,
BIN_OP_DIV_uxn_c_l124_c6_e67f_right,
BIN_OP_DIV_uxn_c_l124_c6_e67f_return_output);

-- BIN_OP_INFERRED_MULT_uxn_c_l125_c23_9c14
BIN_OP_INFERRED_MULT_uxn_c_l125_c23_9c14 : entity work.BIN_OP_INFERRED_MULT_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_c_l125_c23_9c14_left,
BIN_OP_INFERRED_MULT_uxn_c_l125_c23_9c14_right,
BIN_OP_INFERRED_MULT_uxn_c_l125_c23_9c14_return_output);

-- BIN_OP_MINUS_uxn_c_l125_c6_3c47
BIN_OP_MINUS_uxn_c_l125_c6_3c47 : entity work.BIN_OP_MINUS_uint32_t_uint25_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l125_c6_3c47_left,
BIN_OP_MINUS_uxn_c_l125_c6_3c47_right,
BIN_OP_MINUS_uxn_c_l125_c6_3c47_return_output);

-- UNARY_OP_NOT_uxn_c_l128_c22_dbee
UNARY_OP_NOT_uxn_c_l128_c22_dbee : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l128_c22_dbee_expr,
UNARY_OP_NOT_uxn_c_l128_c22_dbee_return_output);

-- BIN_OP_AND_uxn_c_l128_c6_5560
BIN_OP_AND_uxn_c_l128_c6_5560 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l128_c6_5560_left,
BIN_OP_AND_uxn_c_l128_c6_5560_right,
BIN_OP_AND_uxn_c_l128_c6_5560_return_output);

-- fill_x0_MUX_uxn_c_l128_c2_0b70
fill_x0_MUX_uxn_c_l128_c2_0b70 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_x0_MUX_uxn_c_l128_c2_0b70_cond,
fill_x0_MUX_uxn_c_l128_c2_0b70_iftrue,
fill_x0_MUX_uxn_c_l128_c2_0b70_iffalse,
fill_x0_MUX_uxn_c_l128_c2_0b70_return_output);

-- fill_x1_MUX_uxn_c_l128_c2_0b70
fill_x1_MUX_uxn_c_l128_c2_0b70 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_x1_MUX_uxn_c_l128_c2_0b70_cond,
fill_x1_MUX_uxn_c_l128_c2_0b70_iftrue,
fill_x1_MUX_uxn_c_l128_c2_0b70_iffalse,
fill_x1_MUX_uxn_c_l128_c2_0b70_return_output);

-- fill_layer_MUX_uxn_c_l128_c2_0b70
fill_layer_MUX_uxn_c_l128_c2_0b70 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
fill_layer_MUX_uxn_c_l128_c2_0b70_cond,
fill_layer_MUX_uxn_c_l128_c2_0b70_iftrue,
fill_layer_MUX_uxn_c_l128_c2_0b70_iffalse,
fill_layer_MUX_uxn_c_l128_c2_0b70_return_output);

-- is_fill_top_MUX_uxn_c_l128_c2_0b70
is_fill_top_MUX_uxn_c_l128_c2_0b70 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_top_MUX_uxn_c_l128_c2_0b70_cond,
is_fill_top_MUX_uxn_c_l128_c2_0b70_iftrue,
is_fill_top_MUX_uxn_c_l128_c2_0b70_iffalse,
is_fill_top_MUX_uxn_c_l128_c2_0b70_return_output);

-- fill_y1_MUX_uxn_c_l128_c2_0b70
fill_y1_MUX_uxn_c_l128_c2_0b70 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_y1_MUX_uxn_c_l128_c2_0b70_cond,
fill_y1_MUX_uxn_c_l128_c2_0b70_iftrue,
fill_y1_MUX_uxn_c_l128_c2_0b70_iffalse,
fill_y1_MUX_uxn_c_l128_c2_0b70_return_output);

-- fill_y0_MUX_uxn_c_l128_c2_0b70
fill_y0_MUX_uxn_c_l128_c2_0b70 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_y0_MUX_uxn_c_l128_c2_0b70_cond,
fill_y0_MUX_uxn_c_l128_c2_0b70_iftrue,
fill_y0_MUX_uxn_c_l128_c2_0b70_iffalse,
fill_y0_MUX_uxn_c_l128_c2_0b70_return_output);

-- fill_pixels_remaining_MUX_uxn_c_l128_c2_0b70
fill_pixels_remaining_MUX_uxn_c_l128_c2_0b70 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
fill_pixels_remaining_MUX_uxn_c_l128_c2_0b70_cond,
fill_pixels_remaining_MUX_uxn_c_l128_c2_0b70_iftrue,
fill_pixels_remaining_MUX_uxn_c_l128_c2_0b70_iffalse,
fill_pixels_remaining_MUX_uxn_c_l128_c2_0b70_return_output);

-- is_fill_left_MUX_uxn_c_l128_c2_0b70
is_fill_left_MUX_uxn_c_l128_c2_0b70 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_left_MUX_uxn_c_l128_c2_0b70_cond,
is_fill_left_MUX_uxn_c_l128_c2_0b70_iftrue,
is_fill_left_MUX_uxn_c_l128_c2_0b70_iffalse,
is_fill_left_MUX_uxn_c_l128_c2_0b70_return_output);

-- fill_color_MUX_uxn_c_l128_c2_0b70
fill_color_MUX_uxn_c_l128_c2_0b70 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
fill_color_MUX_uxn_c_l128_c2_0b70_cond,
fill_color_MUX_uxn_c_l128_c2_0b70_iftrue,
fill_color_MUX_uxn_c_l128_c2_0b70_iffalse,
fill_color_MUX_uxn_c_l128_c2_0b70_return_output);

-- CONST_SR_20_uxn_c_l130_c18_42b3
CONST_SR_20_uxn_c_l130_c18_42b3 : entity work.CONST_SR_20_uint32_t_0CLK_de264c78 port map (
CONST_SR_20_uxn_c_l130_c18_42b3_x,
CONST_SR_20_uxn_c_l130_c18_42b3_return_output);

-- CONST_SR_21_uxn_c_l131_c17_4a10
CONST_SR_21_uxn_c_l131_c17_4a10 : entity work.CONST_SR_21_uint32_t_0CLK_de264c78 port map (
CONST_SR_21_uxn_c_l131_c17_4a10_x,
CONST_SR_21_uxn_c_l131_c17_4a10_return_output);

-- BIN_OP_AND_uxn_c_l132_c27_3dcb
BIN_OP_AND_uxn_c_l132_c27_3dcb : entity work.BIN_OP_AND_uint32_t_uint18_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l132_c27_3dcb_left,
BIN_OP_AND_uxn_c_l132_c27_3dcb_right,
BIN_OP_AND_uxn_c_l132_c27_3dcb_return_output);

-- BIN_OP_DIV_uxn_c_l133_c13_bacd
BIN_OP_DIV_uxn_c_l133_c13_bacd : entity work.BIN_OP_DIV_uint32_t_uint9_t_0CLK_422b4ffb port map (
BIN_OP_DIV_uxn_c_l133_c13_bacd_left,
BIN_OP_DIV_uxn_c_l133_c13_bacd_right,
BIN_OP_DIV_uxn_c_l133_c13_bacd_return_output);

-- BIN_OP_INFERRED_MULT_uxn_c_l134_c38_814c
BIN_OP_INFERRED_MULT_uxn_c_l134_c38_814c : entity work.BIN_OP_INFERRED_MULT_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_c_l134_c38_814c_left,
BIN_OP_INFERRED_MULT_uxn_c_l134_c38_814c_right,
BIN_OP_INFERRED_MULT_uxn_c_l134_c38_814c_return_output);

-- BIN_OP_MINUS_uxn_c_l134_c13_f57d
BIN_OP_MINUS_uxn_c_l134_c13_f57d : entity work.BIN_OP_MINUS_uint32_t_uint25_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l134_c13_f57d_left,
BIN_OP_MINUS_uxn_c_l134_c13_f57d_right,
BIN_OP_MINUS_uxn_c_l134_c13_f57d_return_output);

-- MUX_uxn_c_l135_c13_a6a1
MUX_uxn_c_l135_c13_a6a1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l135_c13_a6a1_cond,
MUX_uxn_c_l135_c13_a6a1_iftrue,
MUX_uxn_c_l135_c13_a6a1_iffalse,
MUX_uxn_c_l135_c13_a6a1_return_output);

-- MUX_uxn_c_l136_c13_4d0e
MUX_uxn_c_l136_c13_4d0e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l136_c13_4d0e_cond,
MUX_uxn_c_l136_c13_4d0e_iftrue,
MUX_uxn_c_l136_c13_4d0e_iffalse,
MUX_uxn_c_l136_c13_4d0e_return_output);

-- MUX_uxn_c_l137_c13_51bd
MUX_uxn_c_l137_c13_51bd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l137_c13_51bd_cond,
MUX_uxn_c_l137_c13_51bd_iftrue,
MUX_uxn_c_l137_c13_51bd_iffalse,
MUX_uxn_c_l137_c13_51bd_return_output);

-- MUX_uxn_c_l138_c13_b4ab
MUX_uxn_c_l138_c13_b4ab : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l138_c13_b4ab_cond,
MUX_uxn_c_l138_c13_b4ab_iftrue,
MUX_uxn_c_l138_c13_b4ab_iffalse,
MUX_uxn_c_l138_c13_b4ab_return_output);

-- BIN_OP_EQ_uxn_c_l144_c19_8ec9
BIN_OP_EQ_uxn_c_l144_c19_8ec9 : entity work.BIN_OP_EQ_uint32_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l144_c19_8ec9_left,
BIN_OP_EQ_uxn_c_l144_c19_8ec9_right,
BIN_OP_EQ_uxn_c_l144_c19_8ec9_return_output);

-- MUX_uxn_c_l144_c19_41aa
MUX_uxn_c_l144_c19_41aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l144_c19_41aa_cond,
MUX_uxn_c_l144_c19_41aa_iftrue,
MUX_uxn_c_l144_c19_41aa_iffalse,
MUX_uxn_c_l144_c19_41aa_return_output);

-- BIN_OP_GT_uxn_c_l146_c17_580d
BIN_OP_GT_uxn_c_l146_c17_580d : entity work.BIN_OP_GT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_c_l146_c17_580d_left,
BIN_OP_GT_uxn_c_l146_c17_580d_right,
BIN_OP_GT_uxn_c_l146_c17_580d_return_output);

-- BIN_OP_LT_uxn_c_l147_c17_291a
BIN_OP_LT_uxn_c_l147_c17_291a : entity work.BIN_OP_LT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_LT_uxn_c_l147_c17_291a_left,
BIN_OP_LT_uxn_c_l147_c17_291a_right,
BIN_OP_LT_uxn_c_l147_c17_291a_return_output);

-- BIN_OP_GT_uxn_c_l148_c17_ed21
BIN_OP_GT_uxn_c_l148_c17_ed21 : entity work.BIN_OP_GT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_c_l148_c17_ed21_left,
BIN_OP_GT_uxn_c_l148_c17_ed21_right,
BIN_OP_GT_uxn_c_l148_c17_ed21_return_output);

-- BIN_OP_LT_uxn_c_l149_c17_83b1
BIN_OP_LT_uxn_c_l149_c17_83b1 : entity work.BIN_OP_LT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_LT_uxn_c_l149_c17_83b1_left,
BIN_OP_LT_uxn_c_l149_c17_83b1_right,
BIN_OP_LT_uxn_c_l149_c17_83b1_return_output);

-- BIN_OP_AND_uxn_c_l151_c18_360f
BIN_OP_AND_uxn_c_l151_c18_360f : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l151_c18_360f_left,
BIN_OP_AND_uxn_c_l151_c18_360f_right,
BIN_OP_AND_uxn_c_l151_c18_360f_return_output);

-- BIN_OP_AND_uxn_c_l151_c18_3112
BIN_OP_AND_uxn_c_l151_c18_3112 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l151_c18_3112_left,
BIN_OP_AND_uxn_c_l151_c18_3112_right,
BIN_OP_AND_uxn_c_l151_c18_3112_return_output);

-- BIN_OP_AND_uxn_c_l151_c18_7f9a
BIN_OP_AND_uxn_c_l151_c18_7f9a : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l151_c18_7f9a_left,
BIN_OP_AND_uxn_c_l151_c18_7f9a_right,
BIN_OP_AND_uxn_c_l151_c18_7f9a_return_output);

-- BIN_OP_AND_uxn_c_l151_c18_59b8
BIN_OP_AND_uxn_c_l151_c18_59b8 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l151_c18_59b8_left,
BIN_OP_AND_uxn_c_l151_c18_59b8_right,
BIN_OP_AND_uxn_c_l151_c18_59b8_return_output);

-- UNARY_OP_NOT_uxn_c_l152_c37_4d4e
UNARY_OP_NOT_uxn_c_l152_c37_4d4e : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l152_c37_4d4e_expr,
UNARY_OP_NOT_uxn_c_l152_c37_4d4e_return_output);

-- BIN_OP_AND_uxn_c_l152_c19_9ac1
BIN_OP_AND_uxn_c_l152_c19_9ac1 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l152_c19_9ac1_left,
BIN_OP_AND_uxn_c_l152_c19_9ac1_right,
BIN_OP_AND_uxn_c_l152_c19_9ac1_return_output);

-- BIN_OP_AND_uxn_c_l153_c19_a880
BIN_OP_AND_uxn_c_l153_c19_a880 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l153_c19_a880_left,
BIN_OP_AND_uxn_c_l153_c19_a880_right,
BIN_OP_AND_uxn_c_l153_c19_a880_return_output);

-- MUX_uxn_c_l157_c37_3512
MUX_uxn_c_l157_c37_3512 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
MUX_uxn_c_l157_c37_3512_cond,
MUX_uxn_c_l157_c37_3512_iftrue,
MUX_uxn_c_l157_c37_3512_iffalse,
MUX_uxn_c_l157_c37_3512_return_output);

-- MUX_uxn_c_l157_c3_193e
MUX_uxn_c_l157_c3_193e : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
MUX_uxn_c_l157_c3_193e_cond,
MUX_uxn_c_l157_c3_193e_iftrue,
MUX_uxn_c_l157_c3_193e_iffalse,
MUX_uxn_c_l157_c3_193e_return_output);

-- MUX_uxn_c_l158_c3_4d4b
MUX_uxn_c_l158_c3_4d4b : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
MUX_uxn_c_l158_c3_4d4b_cond,
MUX_uxn_c_l158_c3_4d4b_iftrue,
MUX_uxn_c_l158_c3_4d4b_iffalse,
MUX_uxn_c_l158_c3_4d4b_return_output);

-- UNARY_OP_NOT_uxn_c_l159_c57_40ff
UNARY_OP_NOT_uxn_c_l159_c57_40ff : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l159_c57_40ff_expr,
UNARY_OP_NOT_uxn_c_l159_c57_40ff_return_output);

-- BIN_OP_AND_uxn_c_l159_c22_a84d
BIN_OP_AND_uxn_c_l159_c22_a84d : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l159_c22_a84d_left,
BIN_OP_AND_uxn_c_l159_c22_a84d_right,
BIN_OP_AND_uxn_c_l159_c22_a84d_return_output);

-- BIN_OP_OR_uxn_c_l159_c3_f5d5
BIN_OP_OR_uxn_c_l159_c3_f5d5 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l159_c3_f5d5_left,
BIN_OP_OR_uxn_c_l159_c3_f5d5_right,
BIN_OP_OR_uxn_c_l159_c3_f5d5_return_output);

-- bg_vram_update_uxn_c_l155_c19_b903
bg_vram_update_uxn_c_l155_c19_b903 : entity work.bg_vram_update_0CLK_b45f1687 port map (
clk,
bg_vram_update_uxn_c_l155_c19_b903_CLOCK_ENABLE,
bg_vram_update_uxn_c_l155_c19_b903_read_address,
bg_vram_update_uxn_c_l155_c19_b903_write_address,
bg_vram_update_uxn_c_l155_c19_b903_write_value,
bg_vram_update_uxn_c_l155_c19_b903_write_enable,
bg_vram_update_uxn_c_l155_c19_b903_return_output);

-- MUX_uxn_c_l164_c37_f239
MUX_uxn_c_l164_c37_f239 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
MUX_uxn_c_l164_c37_f239_cond,
MUX_uxn_c_l164_c37_f239_iftrue,
MUX_uxn_c_l164_c37_f239_iffalse,
MUX_uxn_c_l164_c37_f239_return_output);

-- MUX_uxn_c_l164_c3_b2cf
MUX_uxn_c_l164_c3_b2cf : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
MUX_uxn_c_l164_c3_b2cf_cond,
MUX_uxn_c_l164_c3_b2cf_iftrue,
MUX_uxn_c_l164_c3_b2cf_iffalse,
MUX_uxn_c_l164_c3_b2cf_return_output);

-- MUX_uxn_c_l165_c3_f996
MUX_uxn_c_l165_c3_f996 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
MUX_uxn_c_l165_c3_f996_cond,
MUX_uxn_c_l165_c3_f996_iftrue,
MUX_uxn_c_l165_c3_f996_iffalse,
MUX_uxn_c_l165_c3_f996_return_output);

-- BIN_OP_AND_uxn_c_l166_c22_dc99
BIN_OP_AND_uxn_c_l166_c22_dc99 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l166_c22_dc99_left,
BIN_OP_AND_uxn_c_l166_c22_dc99_right,
BIN_OP_AND_uxn_c_l166_c22_dc99_return_output);

-- BIN_OP_OR_uxn_c_l166_c3_7af1
BIN_OP_OR_uxn_c_l166_c3_7af1 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l166_c3_7af1_left,
BIN_OP_OR_uxn_c_l166_c3_7af1_right,
BIN_OP_OR_uxn_c_l166_c3_7af1_return_output);

-- fg_vram_update_uxn_c_l162_c19_9eff
fg_vram_update_uxn_c_l162_c19_9eff : entity work.fg_vram_update_0CLK_b45f1687 port map (
clk,
fg_vram_update_uxn_c_l162_c19_9eff_CLOCK_ENABLE,
fg_vram_update_uxn_c_l162_c19_9eff_read_address,
fg_vram_update_uxn_c_l162_c19_9eff_write_address,
fg_vram_update_uxn_c_l162_c19_9eff_write_value,
fg_vram_update_uxn_c_l162_c19_9eff_write_enable,
fg_vram_update_uxn_c_l162_c19_9eff_return_output);

-- BIN_OP_EQ_uxn_c_l170_c6_77ca
BIN_OP_EQ_uxn_c_l170_c6_77ca : entity work.BIN_OP_EQ_uint32_t_uint18_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l170_c6_77ca_left,
BIN_OP_EQ_uxn_c_l170_c6_77ca_right,
BIN_OP_EQ_uxn_c_l170_c6_77ca_return_output);

-- pixel_counter_MUX_uxn_c_l170_c2_f6e8
pixel_counter_MUX_uxn_c_l170_c2_f6e8 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
pixel_counter_MUX_uxn_c_l170_c2_f6e8_cond,
pixel_counter_MUX_uxn_c_l170_c2_f6e8_iftrue,
pixel_counter_MUX_uxn_c_l170_c2_f6e8_iffalse,
pixel_counter_MUX_uxn_c_l170_c2_f6e8_return_output);

-- fill_pixels_remaining_MUX_uxn_c_l170_c2_f6e8
fill_pixels_remaining_MUX_uxn_c_l170_c2_f6e8 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
fill_pixels_remaining_MUX_uxn_c_l170_c2_f6e8_cond,
fill_pixels_remaining_MUX_uxn_c_l170_c2_f6e8_iftrue,
fill_pixels_remaining_MUX_uxn_c_l170_c2_f6e8_iffalse,
fill_pixels_remaining_MUX_uxn_c_l170_c2_f6e8_return_output);

-- pixel_counter_MUX_uxn_c_l172_c9_f573
pixel_counter_MUX_uxn_c_l172_c9_f573 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
pixel_counter_MUX_uxn_c_l172_c9_f573_cond,
pixel_counter_MUX_uxn_c_l172_c9_f573_iftrue,
pixel_counter_MUX_uxn_c_l172_c9_f573_iffalse,
pixel_counter_MUX_uxn_c_l172_c9_f573_return_output);

-- fill_pixels_remaining_MUX_uxn_c_l172_c9_f573
fill_pixels_remaining_MUX_uxn_c_l172_c9_f573 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
fill_pixels_remaining_MUX_uxn_c_l172_c9_f573_cond,
fill_pixels_remaining_MUX_uxn_c_l172_c9_f573_iftrue,
fill_pixels_remaining_MUX_uxn_c_l172_c9_f573_iffalse,
fill_pixels_remaining_MUX_uxn_c_l172_c9_f573_return_output);

-- BIN_OP_PLUS_uxn_c_l173_c3_b586
BIN_OP_PLUS_uxn_c_l173_c3_b586 : entity work.BIN_OP_PLUS_uint32_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l173_c3_b586_left,
BIN_OP_PLUS_uxn_c_l173_c3_b586_right,
BIN_OP_PLUS_uxn_c_l173_c3_b586_return_output);

-- BIN_OP_EQ_uxn_c_l174_c27_df5f
BIN_OP_EQ_uxn_c_l174_c27_df5f : entity work.BIN_OP_EQ_uint32_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l174_c27_df5f_left,
BIN_OP_EQ_uxn_c_l174_c27_df5f_right,
BIN_OP_EQ_uxn_c_l174_c27_df5f_return_output);

-- BIN_OP_MINUS_uxn_c_l174_c60_5029
BIN_OP_MINUS_uxn_c_l174_c60_5029 : entity work.BIN_OP_MINUS_uint32_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l174_c60_5029_left,
BIN_OP_MINUS_uxn_c_l174_c60_5029_right,
BIN_OP_MINUS_uxn_c_l174_c60_5029_return_output);

-- MUX_uxn_c_l174_c27_42eb
MUX_uxn_c_l174_c27_42eb : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
MUX_uxn_c_l174_c27_42eb_cond,
MUX_uxn_c_l174_c27_42eb_iftrue,
MUX_uxn_c_l174_c27_42eb_iffalse,
MUX_uxn_c_l174_c27_42eb_return_output);

-- BIN_OP_EQ_uxn_c_l177_c17_73f6
BIN_OP_EQ_uxn_c_l177_c17_73f6 : entity work.BIN_OP_EQ_uint2_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l177_c17_73f6_left,
BIN_OP_EQ_uxn_c_l177_c17_73f6_right,
BIN_OP_EQ_uxn_c_l177_c17_73f6_return_output);

-- MUX_uxn_c_l177_c17_8e24
MUX_uxn_c_l177_c17_8e24 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
MUX_uxn_c_l177_c17_8e24_cond,
MUX_uxn_c_l177_c17_8e24_iftrue,
MUX_uxn_c_l177_c17_8e24_iffalse,
MUX_uxn_c_l177_c17_8e24_return_output);

-- UNARY_OP_NOT_uint1_t_uxn_c_l159_l166_DUPLICATE_16d9
UNARY_OP_NOT_uint1_t_uxn_c_l159_l166_DUPLICATE_16d9 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uint1_t_uxn_c_l159_l166_DUPLICATE_16d9_expr,
UNARY_OP_NOT_uint1_t_uxn_c_l159_l166_DUPLICATE_16d9_return_output);

-- BIN_OP_AND_uint1_t_uint1_t_uxn_c_l166_l159_DUPLICATE_0d27
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l166_l159_DUPLICATE_0d27 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l166_l159_DUPLICATE_0d27_left,
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l166_l159_DUPLICATE_0d27_right,
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l166_l159_DUPLICATE_0d27_return_output);



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
 vram_code,
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
 is_fill_pixel,
 is_fill_pixel0,
 is_fill_pixel1,
 fill_layer,
 fill_isect_l,
 fill_isect_r,
 fill_isect_t,
 fill_isect_b,
 is_fill_code,
 fg_pixel_color,
 bg_pixel_color,
 pixel_counter,
 x,
 y,
 -- All submodule outputs
 BIN_OP_GT_uxn_c_l121_c26_d52f_return_output,
 MUX_uxn_c_l121_c26_ff0d_return_output,
 CONST_SR_28_uxn_c_l122_c24_c0a0_return_output,
 BIN_OP_EQ_uxn_c_l123_c17_3a1a_return_output,
 MUX_uxn_c_l123_c17_52ea_return_output,
 BIN_OP_DIV_uxn_c_l124_c6_e67f_return_output,
 BIN_OP_INFERRED_MULT_uxn_c_l125_c23_9c14_return_output,
 BIN_OP_MINUS_uxn_c_l125_c6_3c47_return_output,
 UNARY_OP_NOT_uxn_c_l128_c22_dbee_return_output,
 BIN_OP_AND_uxn_c_l128_c6_5560_return_output,
 fill_x0_MUX_uxn_c_l128_c2_0b70_return_output,
 fill_x1_MUX_uxn_c_l128_c2_0b70_return_output,
 fill_layer_MUX_uxn_c_l128_c2_0b70_return_output,
 is_fill_top_MUX_uxn_c_l128_c2_0b70_return_output,
 fill_y1_MUX_uxn_c_l128_c2_0b70_return_output,
 fill_y0_MUX_uxn_c_l128_c2_0b70_return_output,
 fill_pixels_remaining_MUX_uxn_c_l128_c2_0b70_return_output,
 is_fill_left_MUX_uxn_c_l128_c2_0b70_return_output,
 fill_color_MUX_uxn_c_l128_c2_0b70_return_output,
 CONST_SR_20_uxn_c_l130_c18_42b3_return_output,
 CONST_SR_21_uxn_c_l131_c17_4a10_return_output,
 BIN_OP_AND_uxn_c_l132_c27_3dcb_return_output,
 BIN_OP_DIV_uxn_c_l133_c13_bacd_return_output,
 BIN_OP_INFERRED_MULT_uxn_c_l134_c38_814c_return_output,
 BIN_OP_MINUS_uxn_c_l134_c13_f57d_return_output,
 MUX_uxn_c_l135_c13_a6a1_return_output,
 MUX_uxn_c_l136_c13_4d0e_return_output,
 MUX_uxn_c_l137_c13_51bd_return_output,
 MUX_uxn_c_l138_c13_b4ab_return_output,
 BIN_OP_EQ_uxn_c_l144_c19_8ec9_return_output,
 MUX_uxn_c_l144_c19_41aa_return_output,
 BIN_OP_GT_uxn_c_l146_c17_580d_return_output,
 BIN_OP_LT_uxn_c_l147_c17_291a_return_output,
 BIN_OP_GT_uxn_c_l148_c17_ed21_return_output,
 BIN_OP_LT_uxn_c_l149_c17_83b1_return_output,
 BIN_OP_AND_uxn_c_l151_c18_360f_return_output,
 BIN_OP_AND_uxn_c_l151_c18_3112_return_output,
 BIN_OP_AND_uxn_c_l151_c18_7f9a_return_output,
 BIN_OP_AND_uxn_c_l151_c18_59b8_return_output,
 UNARY_OP_NOT_uxn_c_l152_c37_4d4e_return_output,
 BIN_OP_AND_uxn_c_l152_c19_9ac1_return_output,
 BIN_OP_AND_uxn_c_l153_c19_a880_return_output,
 MUX_uxn_c_l157_c37_3512_return_output,
 MUX_uxn_c_l157_c3_193e_return_output,
 MUX_uxn_c_l158_c3_4d4b_return_output,
 UNARY_OP_NOT_uxn_c_l159_c57_40ff_return_output,
 BIN_OP_AND_uxn_c_l159_c22_a84d_return_output,
 BIN_OP_OR_uxn_c_l159_c3_f5d5_return_output,
 bg_vram_update_uxn_c_l155_c19_b903_return_output,
 MUX_uxn_c_l164_c37_f239_return_output,
 MUX_uxn_c_l164_c3_b2cf_return_output,
 MUX_uxn_c_l165_c3_f996_return_output,
 BIN_OP_AND_uxn_c_l166_c22_dc99_return_output,
 BIN_OP_OR_uxn_c_l166_c3_7af1_return_output,
 fg_vram_update_uxn_c_l162_c19_9eff_return_output,
 BIN_OP_EQ_uxn_c_l170_c6_77ca_return_output,
 pixel_counter_MUX_uxn_c_l170_c2_f6e8_return_output,
 fill_pixels_remaining_MUX_uxn_c_l170_c2_f6e8_return_output,
 pixel_counter_MUX_uxn_c_l172_c9_f573_return_output,
 fill_pixels_remaining_MUX_uxn_c_l172_c9_f573_return_output,
 BIN_OP_PLUS_uxn_c_l173_c3_b586_return_output,
 BIN_OP_EQ_uxn_c_l174_c27_df5f_return_output,
 BIN_OP_MINUS_uxn_c_l174_c60_5029_return_output,
 MUX_uxn_c_l174_c27_42eb_return_output,
 BIN_OP_EQ_uxn_c_l177_c17_73f6_return_output,
 MUX_uxn_c_l177_c17_8e24_return_output,
 UNARY_OP_NOT_uint1_t_uxn_c_l159_l166_DUPLICATE_16d9_return_output,
 BIN_OP_AND_uint1_t_uint1_t_uxn_c_l166_l159_DUPLICATE_0d27_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : gpu_step_result_t;
 variable VAR_is_active_drawing_area : unsigned(0 downto 0);
 variable VAR_is_vram_write : unsigned(0 downto 0);
 variable VAR_vram_write_layer : unsigned(0 downto 0);
 variable VAR_vram_address : unsigned(31 downto 0);
 variable VAR_vram_value : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l121_c26_ff0d_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l121_c26_ff0d_iftrue : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l121_c26_ff0d_iffalse : unsigned(31 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l121_c26_d52f_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l121_c26_d52f_right : unsigned(17 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l121_c26_d52f_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l121_c26_ff0d_return_output : unsigned(31 downto 0);
 variable VAR_CONST_SR_28_uxn_c_l122_c24_c0a0_return_output : unsigned(31 downto 0);
 variable VAR_CONST_SR_28_uxn_c_l122_c24_c0a0_x : unsigned(31 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_c_l122_c14_84ca_return_output : unsigned(3 downto 0);
 variable VAR_MUX_uxn_c_l123_c17_52ea_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l123_c17_52ea_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l123_c17_52ea_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l123_c17_3a1a_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l123_c17_3a1a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l123_c17_3a1a_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l123_c17_52ea_return_output : unsigned(0 downto 0);
 variable VAR_y_uxn_c_l124_c2_6867 : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_c_l124_c6_e67f_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_DIV_uxn_c_l124_c6_e67f_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_DIV_uxn_c_l124_c6_e67f_return_output : unsigned(31 downto 0);
 variable VAR_x_uxn_c_l125_c2_96e1 : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l125_c6_3c47_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l125_c23_9c14_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l125_c23_9c14_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l125_c23_9c14_return_output : unsigned(24 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l125_c6_3c47_right : unsigned(24 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l125_c6_3c47_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l128_c6_5560_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l128_c22_dbee_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l128_c22_dbee_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l128_c6_5560_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l128_c6_5560_return_output : unsigned(0 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l128_c2_0b70_iftrue : unsigned(15 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l128_c2_0b70_iffalse : unsigned(15 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l128_c2_0b70_return_output : unsigned(15 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l128_c2_0b70_cond : unsigned(0 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l128_c2_0b70_iftrue : unsigned(15 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l128_c2_0b70_iffalse : unsigned(15 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l128_c2_0b70_return_output : unsigned(15 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l128_c2_0b70_cond : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l128_c2_0b70_iftrue : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l128_c2_0b70_iffalse : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l128_c2_0b70_return_output : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l128_c2_0b70_cond : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l128_c2_0b70_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_top_uxn_c_l131_c3_b016 : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l128_c2_0b70_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l128_c2_0b70_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l128_c2_0b70_cond : unsigned(0 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l128_c2_0b70_iftrue : unsigned(15 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l128_c2_0b70_iffalse : unsigned(15 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l128_c2_0b70_return_output : unsigned(15 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l128_c2_0b70_cond : unsigned(0 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l128_c2_0b70_iftrue : unsigned(15 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l128_c2_0b70_iffalse : unsigned(15 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l128_c2_0b70_return_output : unsigned(15 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l128_c2_0b70_cond : unsigned(0 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l128_c2_0b70_iftrue : unsigned(31 downto 0);
 variable VAR_fill_pixels_remaining_uxn_c_l141_c3_12ef : unsigned(31 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l128_c2_0b70_iffalse : unsigned(31 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l128_c2_0b70_return_output : unsigned(31 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l128_c2_0b70_cond : unsigned(0 downto 0);
 variable VAR_is_fill_left_MUX_uxn_c_l128_c2_0b70_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_left_uxn_c_l130_c3_6fb9 : unsigned(0 downto 0);
 variable VAR_is_fill_left_MUX_uxn_c_l128_c2_0b70_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_left_MUX_uxn_c_l128_c2_0b70_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_left_MUX_uxn_c_l128_c2_0b70_cond : unsigned(0 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l128_c2_0b70_iftrue : unsigned(1 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l128_c2_0b70_iffalse : unsigned(1 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l128_c2_0b70_return_output : unsigned(1 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l128_c2_0b70_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_20_uxn_c_l130_c18_42b3_return_output : unsigned(31 downto 0);
 variable VAR_CONST_SR_20_uxn_c_l130_c18_42b3_x : unsigned(31 downto 0);
 variable VAR_CONST_SR_21_uxn_c_l131_c17_4a10_return_output : unsigned(31 downto 0);
 variable VAR_CONST_SR_21_uxn_c_l131_c17_4a10_x : unsigned(31 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l132_c27_3dcb_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l132_c27_3dcb_right : unsigned(17 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l132_c27_3dcb_return_output : unsigned(31 downto 0);
 variable VAR_fill_y0_uxn_c_l133_c3_2826 : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_c_l133_c13_bacd_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_DIV_uxn_c_l133_c13_bacd_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_DIV_uxn_c_l133_c13_bacd_return_output : unsigned(31 downto 0);
 variable VAR_fill_x0_uxn_c_l134_c3_4a16 : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l134_c13_f57d_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l134_c38_814c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l134_c38_814c_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l134_c38_814c_return_output : unsigned(24 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l134_c13_f57d_right : unsigned(24 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l134_c13_f57d_return_output : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l135_c13_a6a1_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l135_c13_a6a1_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l135_c13_a6a1_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l135_c13_a6a1_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l136_c13_4d0e_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l136_c13_4d0e_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l136_c13_4d0e_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l136_c13_4d0e_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l137_c13_51bd_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l137_c13_51bd_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l137_c13_51bd_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l137_c13_51bd_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l138_c13_b4ab_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l138_c13_b4ab_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l138_c13_b4ab_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l138_c13_b4ab_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l144_c19_41aa_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l144_c19_41aa_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l144_c19_41aa_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l144_c19_8ec9_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l144_c19_8ec9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l144_c19_8ec9_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l144_c19_41aa_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l146_c17_580d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l146_c17_580d_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l146_c17_580d_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_LT_uxn_c_l147_c17_291a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_c_l147_c17_291a_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_c_l147_c17_291a_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l148_c17_ed21_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l148_c17_ed21_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l148_c17_ed21_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_LT_uxn_c_l149_c17_83b1_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_c_l149_c17_83b1_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_c_l149_c17_83b1_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l151_c18_360f_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l151_c18_360f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l151_c18_360f_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l151_c18_3112_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l151_c18_3112_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l151_c18_3112_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l151_c18_7f9a_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l151_c18_7f9a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l151_c18_7f9a_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l151_c18_59b8_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l151_c18_59b8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l151_c18_59b8_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l152_c19_9ac1_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l152_c37_4d4e_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l152_c37_4d4e_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l152_c19_9ac1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l152_c19_9ac1_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l153_c19_a880_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l153_c19_a880_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l153_c19_a880_return_output : unsigned(0 downto 0);
 variable VAR_bg_vram_update_uxn_c_l155_c19_b903_read_address : unsigned(31 downto 0);
 variable VAR_bg_vram_update_uxn_c_l155_c19_b903_write_address : unsigned(31 downto 0);
 variable VAR_bg_vram_update_uxn_c_l155_c19_b903_write_value : unsigned(1 downto 0);
 variable VAR_bg_vram_update_uxn_c_l155_c19_b903_write_enable : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l157_c3_193e_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l157_c3_193e_iftrue : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l157_c3_193e_iffalse : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l157_c37_3512_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l157_c37_3512_iftrue : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l157_c37_3512_iffalse : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l157_c37_3512_return_output : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l157_c3_193e_return_output : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l158_c3_4d4b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l158_c3_4d4b_iftrue : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l158_c3_4d4b_iffalse : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l158_c3_4d4b_return_output : unsigned(1 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l159_c3_f5d5_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l159_c22_a84d_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l159_c57_40ff_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l159_c57_40ff_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l159_c22_a84d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l159_c22_a84d_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l159_c3_f5d5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l159_c3_f5d5_return_output : unsigned(0 downto 0);
 variable VAR_bg_vram_update_uxn_c_l155_c19_b903_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_bg_vram_update_uxn_c_l155_c19_b903_return_output : unsigned(1 downto 0);
 variable VAR_fg_vram_update_uxn_c_l162_c19_9eff_read_address : unsigned(31 downto 0);
 variable VAR_fg_vram_update_uxn_c_l162_c19_9eff_write_address : unsigned(31 downto 0);
 variable VAR_fg_vram_update_uxn_c_l162_c19_9eff_write_value : unsigned(1 downto 0);
 variable VAR_fg_vram_update_uxn_c_l162_c19_9eff_write_enable : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l164_c3_b2cf_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l164_c3_b2cf_iftrue : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l164_c3_b2cf_iffalse : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l164_c37_f239_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l164_c37_f239_iftrue : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l164_c37_f239_iffalse : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l164_c37_f239_return_output : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l164_c3_b2cf_return_output : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l165_c3_f996_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l165_c3_f996_iftrue : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l165_c3_f996_iffalse : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l165_c3_f996_return_output : unsigned(1 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l166_c3_7af1_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l166_c22_dc99_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l166_c22_dc99_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l166_c22_dc99_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l166_c3_7af1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l166_c3_7af1_return_output : unsigned(0 downto 0);
 variable VAR_fg_vram_update_uxn_c_l162_c19_9eff_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_fg_vram_update_uxn_c_l162_c19_9eff_return_output : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l170_c6_77ca_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l170_c6_77ca_right : unsigned(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l170_c6_77ca_return_output : unsigned(0 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l170_c2_f6e8_iftrue : unsigned(31 downto 0);
 variable VAR_pixel_counter_uxn_c_l171_c3_d634 : unsigned(31 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l170_c2_f6e8_iffalse : unsigned(31 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l172_c9_f573_return_output : unsigned(31 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l170_c2_f6e8_return_output : unsigned(31 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l170_c2_f6e8_cond : unsigned(0 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l170_c2_f6e8_iftrue : unsigned(31 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l170_c2_f6e8_iffalse : unsigned(31 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l172_c9_f573_return_output : unsigned(31 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l170_c2_f6e8_return_output : unsigned(31 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l170_c2_f6e8_cond : unsigned(0 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l172_c9_f573_iftrue : unsigned(31 downto 0);
 variable VAR_pixel_counter_uxn_c_l173_c3_1c8f : unsigned(31 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l172_c9_f573_iffalse : unsigned(31 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l172_c9_f573_cond : unsigned(0 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l172_c9_f573_iftrue : unsigned(31 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l172_c9_f573_iffalse : unsigned(31 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l172_c9_f573_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l173_c3_b586_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l173_c3_b586_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l173_c3_b586_return_output : unsigned(32 downto 0);
 variable VAR_MUX_uxn_c_l174_c27_42eb_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l174_c27_42eb_iftrue : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l174_c27_42eb_iffalse : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l174_c27_df5f_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l174_c27_df5f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l174_c27_df5f_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l174_c60_5029_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l174_c60_5029_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l174_c60_5029_return_output : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l174_c27_42eb_return_output : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l177_c17_8e24_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l177_c17_8e24_iftrue : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l177_c17_8e24_iffalse : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l177_c17_73f6_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l177_c17_73f6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l177_c17_73f6_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l177_c17_8e24_return_output : unsigned(1 downto 0);
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_c_l159_l166_DUPLICATE_16d9_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_c_l159_l166_DUPLICATE_16d9_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l166_l159_DUPLICATE_0d27_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l166_l159_DUPLICATE_0d27_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l166_l159_DUPLICATE_0d27_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_6984_uxn_c_l180_l106_DUPLICATE_1f6b_return_output : gpu_step_result_t;
 -- State registers comb logic variables
variable REG_VAR_result : gpu_step_result_t;
variable REG_VAR_vram_code : unsigned(3 downto 0);
variable REG_VAR_adjusted_vram_address : unsigned(31 downto 0);
variable REG_VAR_fill_pixels_remaining : unsigned(31 downto 0);
variable REG_VAR_fill_x0 : unsigned(15 downto 0);
variable REG_VAR_fill_y0 : unsigned(15 downto 0);
variable REG_VAR_fill_x1 : unsigned(15 downto 0);
variable REG_VAR_fill_y1 : unsigned(15 downto 0);
variable REG_VAR_fill_color : unsigned(1 downto 0);
variable REG_VAR_is_fill_active : unsigned(0 downto 0);
variable REG_VAR_is_fill_left : unsigned(0 downto 0);
variable REG_VAR_is_fill_top : unsigned(0 downto 0);
variable REG_VAR_is_fill_pixel : unsigned(0 downto 0);
variable REG_VAR_is_fill_pixel0 : unsigned(0 downto 0);
variable REG_VAR_is_fill_pixel1 : unsigned(0 downto 0);
variable REG_VAR_fill_layer : unsigned(0 downto 0);
variable REG_VAR_fill_isect_l : unsigned(0 downto 0);
variable REG_VAR_fill_isect_r : unsigned(0 downto 0);
variable REG_VAR_fill_isect_t : unsigned(0 downto 0);
variable REG_VAR_fill_isect_b : unsigned(0 downto 0);
variable REG_VAR_is_fill_code : unsigned(0 downto 0);
variable REG_VAR_fg_pixel_color : unsigned(1 downto 0);
variable REG_VAR_bg_pixel_color : unsigned(1 downto 0);
variable REG_VAR_pixel_counter : unsigned(31 downto 0);
variable REG_VAR_x : unsigned(15 downto 0);
variable REG_VAR_y : unsigned(15 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_result := result;
  REG_VAR_vram_code := vram_code;
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
  REG_VAR_is_fill_pixel := is_fill_pixel;
  REG_VAR_is_fill_pixel0 := is_fill_pixel0;
  REG_VAR_is_fill_pixel1 := is_fill_pixel1;
  REG_VAR_fill_layer := fill_layer;
  REG_VAR_fill_isect_l := fill_isect_l;
  REG_VAR_fill_isect_r := fill_isect_r;
  REG_VAR_fill_isect_t := fill_isect_t;
  REG_VAR_fill_isect_b := fill_isect_b;
  REG_VAR_is_fill_code := is_fill_code;
  REG_VAR_fg_pixel_color := fg_pixel_color;
  REG_VAR_bg_pixel_color := bg_pixel_color;
  REG_VAR_pixel_counter := pixel_counter;
  REG_VAR_x := x;
  REG_VAR_y := y;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_pixel_counter_uxn_c_l171_c3_d634 := resize(to_unsigned(0, 1), 32);
     VAR_pixel_counter_MUX_uxn_c_l170_c2_f6e8_iftrue := VAR_pixel_counter_uxn_c_l171_c3_d634;
     VAR_MUX_uxn_c_l164_c37_f239_iftrue := resize(to_unsigned(0, 1), 32);
     VAR_BIN_OP_EQ_uxn_c_l177_c17_73f6_right := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l136_c13_4d0e_iffalse := resize(to_unsigned(399, 9), 16);
     VAR_MUX_uxn_c_l144_c19_41aa_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_MINUS_uxn_c_l174_c60_5029_right := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_c_l132_c27_3dcb_right := to_unsigned(262143, 18);
     VAR_BIN_OP_EQ_uxn_c_l174_c27_df5f_right := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_c_l121_c26_d52f_right := to_unsigned(143999, 18);
     VAR_BIN_OP_DIV_uxn_c_l124_c6_e67f_right := to_unsigned(400, 9);
     VAR_BIN_OP_PLUS_uxn_c_l173_c3_b586_right := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l137_c13_51bd_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l125_c23_9c14_right := to_unsigned(400, 9);
     VAR_MUX_uxn_c_l123_c17_52ea_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l121_c26_ff0d_iftrue := resize(to_unsigned(0, 1), 32);
     VAR_BIN_OP_EQ_uxn_c_l144_c19_8ec9_right := to_unsigned(0, 1);
     VAR_BIN_OP_DIV_uxn_c_l133_c13_bacd_right := to_unsigned(400, 9);
     VAR_BIN_OP_EQ_uxn_c_l123_c17_3a1a_right := to_unsigned(15, 4);
     VAR_MUX_uxn_c_l123_c17_52ea_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l174_c27_42eb_iftrue := resize(to_unsigned(0, 1), 32);
     VAR_MUX_uxn_c_l157_c37_3512_iftrue := resize(to_unsigned(0, 1), 32);
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l134_c38_814c_right := to_unsigned(400, 9);
     VAR_MUX_uxn_c_l144_c19_41aa_iffalse := to_unsigned(1, 1);
     VAR_fill_pixels_remaining_uxn_c_l141_c3_12ef := resize(to_unsigned(143999, 18), 32);
     VAR_fill_pixels_remaining_MUX_uxn_c_l128_c2_0b70_iftrue := VAR_fill_pixels_remaining_uxn_c_l141_c3_12ef;
     VAR_MUX_uxn_c_l135_c13_a6a1_iffalse := resize(to_unsigned(359, 9), 16);
     VAR_BIN_OP_EQ_uxn_c_l170_c6_77ca_right := to_unsigned(143999, 18);
     VAR_MUX_uxn_c_l138_c13_b4ab_iftrue := resize(to_unsigned(0, 1), 16);

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
     VAR_bg_vram_update_uxn_c_l155_c19_b903_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_fg_vram_update_uxn_c_l162_c19_9eff_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_fill_color_MUX_uxn_c_l128_c2_0b70_iffalse := fill_color;
     VAR_fill_layer_MUX_uxn_c_l128_c2_0b70_iffalse := fill_layer;
     VAR_fill_pixels_remaining_MUX_uxn_c_l128_c2_0b70_iffalse := fill_pixels_remaining;
     VAR_fill_x0_MUX_uxn_c_l128_c2_0b70_iffalse := fill_x0;
     VAR_fill_x1_MUX_uxn_c_l128_c2_0b70_iffalse := fill_x1;
     VAR_fill_y0_MUX_uxn_c_l128_c2_0b70_iffalse := fill_y0;
     VAR_fill_y1_MUX_uxn_c_l128_c2_0b70_iffalse := fill_y1;
     VAR_fill_pixels_remaining_MUX_uxn_c_l172_c9_f573_cond := VAR_is_active_drawing_area;
     VAR_pixel_counter_MUX_uxn_c_l172_c9_f573_cond := VAR_is_active_drawing_area;
     VAR_UNARY_OP_NOT_uxn_c_l128_c22_dbee_expr := is_fill_active;
     VAR_is_fill_left_MUX_uxn_c_l128_c2_0b70_iffalse := is_fill_left;
     VAR_is_fill_top_MUX_uxn_c_l128_c2_0b70_iffalse := is_fill_top;
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l166_l159_DUPLICATE_0d27_right := VAR_is_vram_write;
     VAR_BIN_OP_DIV_uxn_c_l124_c6_e67f_left := pixel_counter;
     VAR_BIN_OP_EQ_uxn_c_l170_c6_77ca_left := pixel_counter;
     VAR_BIN_OP_MINUS_uxn_c_l125_c6_3c47_left := pixel_counter;
     VAR_BIN_OP_PLUS_uxn_c_l173_c3_b586_left := pixel_counter;
     VAR_MUX_uxn_c_l157_c3_193e_iftrue := pixel_counter;
     VAR_MUX_uxn_c_l164_c3_b2cf_iftrue := pixel_counter;
     VAR_bg_vram_update_uxn_c_l155_c19_b903_read_address := pixel_counter;
     VAR_fg_vram_update_uxn_c_l162_c19_9eff_read_address := pixel_counter;
     VAR_pixel_counter_MUX_uxn_c_l172_c9_f573_iffalse := pixel_counter;
     VAR_BIN_OP_AND_uxn_c_l132_c27_3dcb_left := VAR_vram_address;
     VAR_BIN_OP_GT_uxn_c_l121_c26_d52f_left := VAR_vram_address;
     VAR_CONST_SR_20_uxn_c_l130_c18_42b3_x := VAR_vram_address;
     VAR_CONST_SR_21_uxn_c_l131_c17_4a10_x := VAR_vram_address;
     VAR_CONST_SR_28_uxn_c_l122_c24_c0a0_x := VAR_vram_address;
     VAR_MUX_uxn_c_l121_c26_ff0d_iffalse := VAR_vram_address;
     VAR_MUX_uxn_c_l158_c3_4d4b_iffalse := VAR_vram_value;
     VAR_MUX_uxn_c_l165_c3_f996_iffalse := VAR_vram_value;
     VAR_fill_color_MUX_uxn_c_l128_c2_0b70_iftrue := VAR_vram_value;
     VAR_BIN_OP_AND_uxn_c_l166_c22_dc99_right := VAR_vram_write_layer;
     VAR_UNARY_OP_NOT_uxn_c_l159_c57_40ff_expr := VAR_vram_write_layer;
     VAR_fill_layer_MUX_uxn_c_l128_c2_0b70_iftrue := VAR_vram_write_layer;
     -- CONST_SR_21[uxn_c_l131_c17_4a10] LATENCY=0
     -- Inputs
     CONST_SR_21_uxn_c_l131_c17_4a10_x <= VAR_CONST_SR_21_uxn_c_l131_c17_4a10_x;
     -- Outputs
     VAR_CONST_SR_21_uxn_c_l131_c17_4a10_return_output := CONST_SR_21_uxn_c_l131_c17_4a10_return_output;

     -- BIN_OP_EQ[uxn_c_l170_c6_77ca] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l170_c6_77ca_left <= VAR_BIN_OP_EQ_uxn_c_l170_c6_77ca_left;
     BIN_OP_EQ_uxn_c_l170_c6_77ca_right <= VAR_BIN_OP_EQ_uxn_c_l170_c6_77ca_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l170_c6_77ca_return_output := BIN_OP_EQ_uxn_c_l170_c6_77ca_return_output;

     -- UNARY_OP_NOT[uxn_c_l159_c57_40ff] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l159_c57_40ff_expr <= VAR_UNARY_OP_NOT_uxn_c_l159_c57_40ff_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l159_c57_40ff_return_output := UNARY_OP_NOT_uxn_c_l159_c57_40ff_return_output;

     -- UNARY_OP_NOT[uxn_c_l128_c22_dbee] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l128_c22_dbee_expr <= VAR_UNARY_OP_NOT_uxn_c_l128_c22_dbee_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l128_c22_dbee_return_output := UNARY_OP_NOT_uxn_c_l128_c22_dbee_return_output;

     -- CONST_SR_20[uxn_c_l130_c18_42b3] LATENCY=0
     -- Inputs
     CONST_SR_20_uxn_c_l130_c18_42b3_x <= VAR_CONST_SR_20_uxn_c_l130_c18_42b3_x;
     -- Outputs
     VAR_CONST_SR_20_uxn_c_l130_c18_42b3_return_output := CONST_SR_20_uxn_c_l130_c18_42b3_return_output;

     -- BIN_OP_AND[uxn_c_l132_c27_3dcb] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l132_c27_3dcb_left <= VAR_BIN_OP_AND_uxn_c_l132_c27_3dcb_left;
     BIN_OP_AND_uxn_c_l132_c27_3dcb_right <= VAR_BIN_OP_AND_uxn_c_l132_c27_3dcb_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l132_c27_3dcb_return_output := BIN_OP_AND_uxn_c_l132_c27_3dcb_return_output;

     -- BIN_OP_PLUS[uxn_c_l173_c3_b586] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l173_c3_b586_left <= VAR_BIN_OP_PLUS_uxn_c_l173_c3_b586_left;
     BIN_OP_PLUS_uxn_c_l173_c3_b586_right <= VAR_BIN_OP_PLUS_uxn_c_l173_c3_b586_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l173_c3_b586_return_output := BIN_OP_PLUS_uxn_c_l173_c3_b586_return_output;

     -- CONST_SR_28[uxn_c_l122_c24_c0a0] LATENCY=0
     -- Inputs
     CONST_SR_28_uxn_c_l122_c24_c0a0_x <= VAR_CONST_SR_28_uxn_c_l122_c24_c0a0_x;
     -- Outputs
     VAR_CONST_SR_28_uxn_c_l122_c24_c0a0_return_output := CONST_SR_28_uxn_c_l122_c24_c0a0_return_output;

     -- BIN_OP_DIV[uxn_c_l124_c6_e67f] LATENCY=0
     -- Inputs
     BIN_OP_DIV_uxn_c_l124_c6_e67f_left <= VAR_BIN_OP_DIV_uxn_c_l124_c6_e67f_left;
     BIN_OP_DIV_uxn_c_l124_c6_e67f_right <= VAR_BIN_OP_DIV_uxn_c_l124_c6_e67f_right;
     -- Outputs
     VAR_BIN_OP_DIV_uxn_c_l124_c6_e67f_return_output := BIN_OP_DIV_uxn_c_l124_c6_e67f_return_output;

     -- BIN_OP_GT[uxn_c_l121_c26_d52f] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_c_l121_c26_d52f_left <= VAR_BIN_OP_GT_uxn_c_l121_c26_d52f_left;
     BIN_OP_GT_uxn_c_l121_c26_d52f_right <= VAR_BIN_OP_GT_uxn_c_l121_c26_d52f_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_c_l121_c26_d52f_return_output := BIN_OP_GT_uxn_c_l121_c26_d52f_return_output;

     -- Submodule level 1
     VAR_BIN_OP_DIV_uxn_c_l133_c13_bacd_left := VAR_BIN_OP_AND_uxn_c_l132_c27_3dcb_return_output;
     VAR_BIN_OP_MINUS_uxn_c_l134_c13_f57d_left := VAR_BIN_OP_AND_uxn_c_l132_c27_3dcb_return_output;
     VAR_y_uxn_c_l124_c2_6867 := resize(VAR_BIN_OP_DIV_uxn_c_l124_c6_e67f_return_output, 16);
     VAR_fill_pixels_remaining_MUX_uxn_c_l170_c2_f6e8_cond := VAR_BIN_OP_EQ_uxn_c_l170_c6_77ca_return_output;
     VAR_pixel_counter_MUX_uxn_c_l170_c2_f6e8_cond := VAR_BIN_OP_EQ_uxn_c_l170_c6_77ca_return_output;
     VAR_MUX_uxn_c_l121_c26_ff0d_cond := VAR_BIN_OP_GT_uxn_c_l121_c26_d52f_return_output;
     VAR_pixel_counter_uxn_c_l173_c3_1c8f := resize(VAR_BIN_OP_PLUS_uxn_c_l173_c3_b586_return_output, 32);
     VAR_is_fill_left_uxn_c_l130_c3_6fb9 := resize(VAR_CONST_SR_20_uxn_c_l130_c18_42b3_return_output, 1);
     VAR_is_fill_top_uxn_c_l131_c3_b016 := resize(VAR_CONST_SR_21_uxn_c_l131_c17_4a10_return_output, 1);
     VAR_BIN_OP_AND_uxn_c_l128_c6_5560_right := VAR_UNARY_OP_NOT_uxn_c_l128_c22_dbee_return_output;
     VAR_BIN_OP_AND_uxn_c_l159_c22_a84d_right := VAR_UNARY_OP_NOT_uxn_c_l159_c57_40ff_return_output;
     VAR_MUX_uxn_c_l136_c13_4d0e_cond := VAR_is_fill_left_uxn_c_l130_c3_6fb9;
     VAR_MUX_uxn_c_l138_c13_b4ab_cond := VAR_is_fill_left_uxn_c_l130_c3_6fb9;
     VAR_is_fill_left_MUX_uxn_c_l128_c2_0b70_iftrue := VAR_is_fill_left_uxn_c_l130_c3_6fb9;
     VAR_MUX_uxn_c_l135_c13_a6a1_cond := VAR_is_fill_top_uxn_c_l131_c3_b016;
     VAR_MUX_uxn_c_l137_c13_51bd_cond := VAR_is_fill_top_uxn_c_l131_c3_b016;
     VAR_is_fill_top_MUX_uxn_c_l128_c2_0b70_iftrue := VAR_is_fill_top_uxn_c_l131_c3_b016;
     VAR_pixel_counter_MUX_uxn_c_l172_c9_f573_iftrue := VAR_pixel_counter_uxn_c_l173_c3_1c8f;
     VAR_BIN_OP_GT_uxn_c_l148_c17_ed21_left := VAR_y_uxn_c_l124_c2_6867;
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l125_c23_9c14_left := VAR_y_uxn_c_l124_c2_6867;
     VAR_BIN_OP_LT_uxn_c_l149_c17_83b1_left := VAR_y_uxn_c_l124_c2_6867;
     REG_VAR_y := VAR_y_uxn_c_l124_c2_6867;
     -- pixel_counter_MUX[uxn_c_l172_c9_f573] LATENCY=0
     -- Inputs
     pixel_counter_MUX_uxn_c_l172_c9_f573_cond <= VAR_pixel_counter_MUX_uxn_c_l172_c9_f573_cond;
     pixel_counter_MUX_uxn_c_l172_c9_f573_iftrue <= VAR_pixel_counter_MUX_uxn_c_l172_c9_f573_iftrue;
     pixel_counter_MUX_uxn_c_l172_c9_f573_iffalse <= VAR_pixel_counter_MUX_uxn_c_l172_c9_f573_iffalse;
     -- Outputs
     VAR_pixel_counter_MUX_uxn_c_l172_c9_f573_return_output := pixel_counter_MUX_uxn_c_l172_c9_f573_return_output;

     -- MUX[uxn_c_l121_c26_ff0d] LATENCY=0
     -- Inputs
     MUX_uxn_c_l121_c26_ff0d_cond <= VAR_MUX_uxn_c_l121_c26_ff0d_cond;
     MUX_uxn_c_l121_c26_ff0d_iftrue <= VAR_MUX_uxn_c_l121_c26_ff0d_iftrue;
     MUX_uxn_c_l121_c26_ff0d_iffalse <= VAR_MUX_uxn_c_l121_c26_ff0d_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l121_c26_ff0d_return_output := MUX_uxn_c_l121_c26_ff0d_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_c_l125_c23_9c14] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_c_l125_c23_9c14_left <= VAR_BIN_OP_INFERRED_MULT_uxn_c_l125_c23_9c14_left;
     BIN_OP_INFERRED_MULT_uxn_c_l125_c23_9c14_right <= VAR_BIN_OP_INFERRED_MULT_uxn_c_l125_c23_9c14_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l125_c23_9c14_return_output := BIN_OP_INFERRED_MULT_uxn_c_l125_c23_9c14_return_output;

     -- CAST_TO_uint4_t[uxn_c_l122_c14_84ca] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_c_l122_c14_84ca_return_output := CAST_TO_uint4_t_uint32_t(
     VAR_CONST_SR_28_uxn_c_l122_c24_c0a0_return_output);

     -- BIN_OP_DIV[uxn_c_l133_c13_bacd] LATENCY=0
     -- Inputs
     BIN_OP_DIV_uxn_c_l133_c13_bacd_left <= VAR_BIN_OP_DIV_uxn_c_l133_c13_bacd_left;
     BIN_OP_DIV_uxn_c_l133_c13_bacd_right <= VAR_BIN_OP_DIV_uxn_c_l133_c13_bacd_right;
     -- Outputs
     VAR_BIN_OP_DIV_uxn_c_l133_c13_bacd_return_output := BIN_OP_DIV_uxn_c_l133_c13_bacd_return_output;

     -- Submodule level 2
     VAR_fill_y0_uxn_c_l133_c3_2826 := resize(VAR_BIN_OP_DIV_uxn_c_l133_c13_bacd_return_output, 16);
     VAR_BIN_OP_MINUS_uxn_c_l125_c6_3c47_right := VAR_BIN_OP_INFERRED_MULT_uxn_c_l125_c23_9c14_return_output;
     VAR_BIN_OP_EQ_uxn_c_l123_c17_3a1a_left := VAR_CAST_TO_uint4_t_uxn_c_l122_c14_84ca_return_output;
     REG_VAR_vram_code := VAR_CAST_TO_uint4_t_uxn_c_l122_c14_84ca_return_output;
     VAR_MUX_uxn_c_l157_c37_3512_iffalse := VAR_MUX_uxn_c_l121_c26_ff0d_return_output;
     VAR_MUX_uxn_c_l164_c37_f239_iffalse := VAR_MUX_uxn_c_l121_c26_ff0d_return_output;
     REG_VAR_adjusted_vram_address := VAR_MUX_uxn_c_l121_c26_ff0d_return_output;
     VAR_pixel_counter_MUX_uxn_c_l170_c2_f6e8_iffalse := VAR_pixel_counter_MUX_uxn_c_l172_c9_f573_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l134_c38_814c_left := VAR_fill_y0_uxn_c_l133_c3_2826;
     VAR_MUX_uxn_c_l135_c13_a6a1_iftrue := VAR_fill_y0_uxn_c_l133_c3_2826;
     VAR_MUX_uxn_c_l137_c13_51bd_iffalse := VAR_fill_y0_uxn_c_l133_c3_2826;
     -- BIN_OP_MINUS[uxn_c_l125_c6_3c47] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l125_c6_3c47_left <= VAR_BIN_OP_MINUS_uxn_c_l125_c6_3c47_left;
     BIN_OP_MINUS_uxn_c_l125_c6_3c47_right <= VAR_BIN_OP_MINUS_uxn_c_l125_c6_3c47_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l125_c6_3c47_return_output := BIN_OP_MINUS_uxn_c_l125_c6_3c47_return_output;

     -- MUX[uxn_c_l137_c13_51bd] LATENCY=0
     -- Inputs
     MUX_uxn_c_l137_c13_51bd_cond <= VAR_MUX_uxn_c_l137_c13_51bd_cond;
     MUX_uxn_c_l137_c13_51bd_iftrue <= VAR_MUX_uxn_c_l137_c13_51bd_iftrue;
     MUX_uxn_c_l137_c13_51bd_iffalse <= VAR_MUX_uxn_c_l137_c13_51bd_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l137_c13_51bd_return_output := MUX_uxn_c_l137_c13_51bd_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_c_l134_c38_814c] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_c_l134_c38_814c_left <= VAR_BIN_OP_INFERRED_MULT_uxn_c_l134_c38_814c_left;
     BIN_OP_INFERRED_MULT_uxn_c_l134_c38_814c_right <= VAR_BIN_OP_INFERRED_MULT_uxn_c_l134_c38_814c_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l134_c38_814c_return_output := BIN_OP_INFERRED_MULT_uxn_c_l134_c38_814c_return_output;

     -- pixel_counter_MUX[uxn_c_l170_c2_f6e8] LATENCY=0
     -- Inputs
     pixel_counter_MUX_uxn_c_l170_c2_f6e8_cond <= VAR_pixel_counter_MUX_uxn_c_l170_c2_f6e8_cond;
     pixel_counter_MUX_uxn_c_l170_c2_f6e8_iftrue <= VAR_pixel_counter_MUX_uxn_c_l170_c2_f6e8_iftrue;
     pixel_counter_MUX_uxn_c_l170_c2_f6e8_iffalse <= VAR_pixel_counter_MUX_uxn_c_l170_c2_f6e8_iffalse;
     -- Outputs
     VAR_pixel_counter_MUX_uxn_c_l170_c2_f6e8_return_output := pixel_counter_MUX_uxn_c_l170_c2_f6e8_return_output;

     -- BIN_OP_EQ[uxn_c_l123_c17_3a1a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l123_c17_3a1a_left <= VAR_BIN_OP_EQ_uxn_c_l123_c17_3a1a_left;
     BIN_OP_EQ_uxn_c_l123_c17_3a1a_right <= VAR_BIN_OP_EQ_uxn_c_l123_c17_3a1a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l123_c17_3a1a_return_output := BIN_OP_EQ_uxn_c_l123_c17_3a1a_return_output;

     -- MUX[uxn_c_l135_c13_a6a1] LATENCY=0
     -- Inputs
     MUX_uxn_c_l135_c13_a6a1_cond <= VAR_MUX_uxn_c_l135_c13_a6a1_cond;
     MUX_uxn_c_l135_c13_a6a1_iftrue <= VAR_MUX_uxn_c_l135_c13_a6a1_iftrue;
     MUX_uxn_c_l135_c13_a6a1_iffalse <= VAR_MUX_uxn_c_l135_c13_a6a1_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l135_c13_a6a1_return_output := MUX_uxn_c_l135_c13_a6a1_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_c_l123_c17_52ea_cond := VAR_BIN_OP_EQ_uxn_c_l123_c17_3a1a_return_output;
     VAR_BIN_OP_MINUS_uxn_c_l134_c13_f57d_right := VAR_BIN_OP_INFERRED_MULT_uxn_c_l134_c38_814c_return_output;
     VAR_x_uxn_c_l125_c2_96e1 := resize(VAR_BIN_OP_MINUS_uxn_c_l125_c6_3c47_return_output, 16);
     VAR_fill_y1_MUX_uxn_c_l128_c2_0b70_iftrue := VAR_MUX_uxn_c_l135_c13_a6a1_return_output;
     VAR_fill_y0_MUX_uxn_c_l128_c2_0b70_iftrue := VAR_MUX_uxn_c_l137_c13_51bd_return_output;
     REG_VAR_pixel_counter := VAR_pixel_counter_MUX_uxn_c_l170_c2_f6e8_return_output;
     VAR_BIN_OP_GT_uxn_c_l146_c17_580d_left := VAR_x_uxn_c_l125_c2_96e1;
     VAR_BIN_OP_LT_uxn_c_l147_c17_291a_left := VAR_x_uxn_c_l125_c2_96e1;
     REG_VAR_x := VAR_x_uxn_c_l125_c2_96e1;
     -- MUX[uxn_c_l123_c17_52ea] LATENCY=0
     -- Inputs
     MUX_uxn_c_l123_c17_52ea_cond <= VAR_MUX_uxn_c_l123_c17_52ea_cond;
     MUX_uxn_c_l123_c17_52ea_iftrue <= VAR_MUX_uxn_c_l123_c17_52ea_iftrue;
     MUX_uxn_c_l123_c17_52ea_iffalse <= VAR_MUX_uxn_c_l123_c17_52ea_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l123_c17_52ea_return_output := MUX_uxn_c_l123_c17_52ea_return_output;

     -- BIN_OP_MINUS[uxn_c_l134_c13_f57d] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l134_c13_f57d_left <= VAR_BIN_OP_MINUS_uxn_c_l134_c13_f57d_left;
     BIN_OP_MINUS_uxn_c_l134_c13_f57d_right <= VAR_BIN_OP_MINUS_uxn_c_l134_c13_f57d_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l134_c13_f57d_return_output := BIN_OP_MINUS_uxn_c_l134_c13_f57d_return_output;

     -- Submodule level 4
     VAR_fill_x0_uxn_c_l134_c3_4a16 := resize(VAR_BIN_OP_MINUS_uxn_c_l134_c13_f57d_return_output, 16);
     VAR_BIN_OP_AND_uxn_c_l128_c6_5560_left := VAR_MUX_uxn_c_l123_c17_52ea_return_output;
     REG_VAR_is_fill_code := VAR_MUX_uxn_c_l123_c17_52ea_return_output;
     VAR_MUX_uxn_c_l136_c13_4d0e_iftrue := VAR_fill_x0_uxn_c_l134_c3_4a16;
     VAR_MUX_uxn_c_l138_c13_b4ab_iffalse := VAR_fill_x0_uxn_c_l134_c3_4a16;
     -- MUX[uxn_c_l136_c13_4d0e] LATENCY=0
     -- Inputs
     MUX_uxn_c_l136_c13_4d0e_cond <= VAR_MUX_uxn_c_l136_c13_4d0e_cond;
     MUX_uxn_c_l136_c13_4d0e_iftrue <= VAR_MUX_uxn_c_l136_c13_4d0e_iftrue;
     MUX_uxn_c_l136_c13_4d0e_iffalse <= VAR_MUX_uxn_c_l136_c13_4d0e_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l136_c13_4d0e_return_output := MUX_uxn_c_l136_c13_4d0e_return_output;

     -- BIN_OP_AND[uxn_c_l128_c6_5560] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l128_c6_5560_left <= VAR_BIN_OP_AND_uxn_c_l128_c6_5560_left;
     BIN_OP_AND_uxn_c_l128_c6_5560_right <= VAR_BIN_OP_AND_uxn_c_l128_c6_5560_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l128_c6_5560_return_output := BIN_OP_AND_uxn_c_l128_c6_5560_return_output;

     -- MUX[uxn_c_l138_c13_b4ab] LATENCY=0
     -- Inputs
     MUX_uxn_c_l138_c13_b4ab_cond <= VAR_MUX_uxn_c_l138_c13_b4ab_cond;
     MUX_uxn_c_l138_c13_b4ab_iftrue <= VAR_MUX_uxn_c_l138_c13_b4ab_iftrue;
     MUX_uxn_c_l138_c13_b4ab_iffalse <= VAR_MUX_uxn_c_l138_c13_b4ab_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l138_c13_b4ab_return_output := MUX_uxn_c_l138_c13_b4ab_return_output;

     -- Submodule level 5
     VAR_fill_color_MUX_uxn_c_l128_c2_0b70_cond := VAR_BIN_OP_AND_uxn_c_l128_c6_5560_return_output;
     VAR_fill_layer_MUX_uxn_c_l128_c2_0b70_cond := VAR_BIN_OP_AND_uxn_c_l128_c6_5560_return_output;
     VAR_fill_pixels_remaining_MUX_uxn_c_l128_c2_0b70_cond := VAR_BIN_OP_AND_uxn_c_l128_c6_5560_return_output;
     VAR_fill_x0_MUX_uxn_c_l128_c2_0b70_cond := VAR_BIN_OP_AND_uxn_c_l128_c6_5560_return_output;
     VAR_fill_x1_MUX_uxn_c_l128_c2_0b70_cond := VAR_BIN_OP_AND_uxn_c_l128_c6_5560_return_output;
     VAR_fill_y0_MUX_uxn_c_l128_c2_0b70_cond := VAR_BIN_OP_AND_uxn_c_l128_c6_5560_return_output;
     VAR_fill_y1_MUX_uxn_c_l128_c2_0b70_cond := VAR_BIN_OP_AND_uxn_c_l128_c6_5560_return_output;
     VAR_is_fill_left_MUX_uxn_c_l128_c2_0b70_cond := VAR_BIN_OP_AND_uxn_c_l128_c6_5560_return_output;
     VAR_is_fill_top_MUX_uxn_c_l128_c2_0b70_cond := VAR_BIN_OP_AND_uxn_c_l128_c6_5560_return_output;
     VAR_fill_x1_MUX_uxn_c_l128_c2_0b70_iftrue := VAR_MUX_uxn_c_l136_c13_4d0e_return_output;
     VAR_fill_x0_MUX_uxn_c_l128_c2_0b70_iftrue := VAR_MUX_uxn_c_l138_c13_b4ab_return_output;
     -- fill_y1_MUX[uxn_c_l128_c2_0b70] LATENCY=0
     -- Inputs
     fill_y1_MUX_uxn_c_l128_c2_0b70_cond <= VAR_fill_y1_MUX_uxn_c_l128_c2_0b70_cond;
     fill_y1_MUX_uxn_c_l128_c2_0b70_iftrue <= VAR_fill_y1_MUX_uxn_c_l128_c2_0b70_iftrue;
     fill_y1_MUX_uxn_c_l128_c2_0b70_iffalse <= VAR_fill_y1_MUX_uxn_c_l128_c2_0b70_iffalse;
     -- Outputs
     VAR_fill_y1_MUX_uxn_c_l128_c2_0b70_return_output := fill_y1_MUX_uxn_c_l128_c2_0b70_return_output;

     -- is_fill_left_MUX[uxn_c_l128_c2_0b70] LATENCY=0
     -- Inputs
     is_fill_left_MUX_uxn_c_l128_c2_0b70_cond <= VAR_is_fill_left_MUX_uxn_c_l128_c2_0b70_cond;
     is_fill_left_MUX_uxn_c_l128_c2_0b70_iftrue <= VAR_is_fill_left_MUX_uxn_c_l128_c2_0b70_iftrue;
     is_fill_left_MUX_uxn_c_l128_c2_0b70_iffalse <= VAR_is_fill_left_MUX_uxn_c_l128_c2_0b70_iffalse;
     -- Outputs
     VAR_is_fill_left_MUX_uxn_c_l128_c2_0b70_return_output := is_fill_left_MUX_uxn_c_l128_c2_0b70_return_output;

     -- is_fill_top_MUX[uxn_c_l128_c2_0b70] LATENCY=0
     -- Inputs
     is_fill_top_MUX_uxn_c_l128_c2_0b70_cond <= VAR_is_fill_top_MUX_uxn_c_l128_c2_0b70_cond;
     is_fill_top_MUX_uxn_c_l128_c2_0b70_iftrue <= VAR_is_fill_top_MUX_uxn_c_l128_c2_0b70_iftrue;
     is_fill_top_MUX_uxn_c_l128_c2_0b70_iffalse <= VAR_is_fill_top_MUX_uxn_c_l128_c2_0b70_iffalse;
     -- Outputs
     VAR_is_fill_top_MUX_uxn_c_l128_c2_0b70_return_output := is_fill_top_MUX_uxn_c_l128_c2_0b70_return_output;

     -- fill_layer_MUX[uxn_c_l128_c2_0b70] LATENCY=0
     -- Inputs
     fill_layer_MUX_uxn_c_l128_c2_0b70_cond <= VAR_fill_layer_MUX_uxn_c_l128_c2_0b70_cond;
     fill_layer_MUX_uxn_c_l128_c2_0b70_iftrue <= VAR_fill_layer_MUX_uxn_c_l128_c2_0b70_iftrue;
     fill_layer_MUX_uxn_c_l128_c2_0b70_iffalse <= VAR_fill_layer_MUX_uxn_c_l128_c2_0b70_iffalse;
     -- Outputs
     VAR_fill_layer_MUX_uxn_c_l128_c2_0b70_return_output := fill_layer_MUX_uxn_c_l128_c2_0b70_return_output;

     -- fill_x1_MUX[uxn_c_l128_c2_0b70] LATENCY=0
     -- Inputs
     fill_x1_MUX_uxn_c_l128_c2_0b70_cond <= VAR_fill_x1_MUX_uxn_c_l128_c2_0b70_cond;
     fill_x1_MUX_uxn_c_l128_c2_0b70_iftrue <= VAR_fill_x1_MUX_uxn_c_l128_c2_0b70_iftrue;
     fill_x1_MUX_uxn_c_l128_c2_0b70_iffalse <= VAR_fill_x1_MUX_uxn_c_l128_c2_0b70_iffalse;
     -- Outputs
     VAR_fill_x1_MUX_uxn_c_l128_c2_0b70_return_output := fill_x1_MUX_uxn_c_l128_c2_0b70_return_output;

     -- fill_y0_MUX[uxn_c_l128_c2_0b70] LATENCY=0
     -- Inputs
     fill_y0_MUX_uxn_c_l128_c2_0b70_cond <= VAR_fill_y0_MUX_uxn_c_l128_c2_0b70_cond;
     fill_y0_MUX_uxn_c_l128_c2_0b70_iftrue <= VAR_fill_y0_MUX_uxn_c_l128_c2_0b70_iftrue;
     fill_y0_MUX_uxn_c_l128_c2_0b70_iffalse <= VAR_fill_y0_MUX_uxn_c_l128_c2_0b70_iffalse;
     -- Outputs
     VAR_fill_y0_MUX_uxn_c_l128_c2_0b70_return_output := fill_y0_MUX_uxn_c_l128_c2_0b70_return_output;

     -- fill_color_MUX[uxn_c_l128_c2_0b70] LATENCY=0
     -- Inputs
     fill_color_MUX_uxn_c_l128_c2_0b70_cond <= VAR_fill_color_MUX_uxn_c_l128_c2_0b70_cond;
     fill_color_MUX_uxn_c_l128_c2_0b70_iftrue <= VAR_fill_color_MUX_uxn_c_l128_c2_0b70_iftrue;
     fill_color_MUX_uxn_c_l128_c2_0b70_iffalse <= VAR_fill_color_MUX_uxn_c_l128_c2_0b70_iffalse;
     -- Outputs
     VAR_fill_color_MUX_uxn_c_l128_c2_0b70_return_output := fill_color_MUX_uxn_c_l128_c2_0b70_return_output;

     -- fill_x0_MUX[uxn_c_l128_c2_0b70] LATENCY=0
     -- Inputs
     fill_x0_MUX_uxn_c_l128_c2_0b70_cond <= VAR_fill_x0_MUX_uxn_c_l128_c2_0b70_cond;
     fill_x0_MUX_uxn_c_l128_c2_0b70_iftrue <= VAR_fill_x0_MUX_uxn_c_l128_c2_0b70_iftrue;
     fill_x0_MUX_uxn_c_l128_c2_0b70_iffalse <= VAR_fill_x0_MUX_uxn_c_l128_c2_0b70_iffalse;
     -- Outputs
     VAR_fill_x0_MUX_uxn_c_l128_c2_0b70_return_output := fill_x0_MUX_uxn_c_l128_c2_0b70_return_output;

     -- fill_pixels_remaining_MUX[uxn_c_l128_c2_0b70] LATENCY=0
     -- Inputs
     fill_pixels_remaining_MUX_uxn_c_l128_c2_0b70_cond <= VAR_fill_pixels_remaining_MUX_uxn_c_l128_c2_0b70_cond;
     fill_pixels_remaining_MUX_uxn_c_l128_c2_0b70_iftrue <= VAR_fill_pixels_remaining_MUX_uxn_c_l128_c2_0b70_iftrue;
     fill_pixels_remaining_MUX_uxn_c_l128_c2_0b70_iffalse <= VAR_fill_pixels_remaining_MUX_uxn_c_l128_c2_0b70_iffalse;
     -- Outputs
     VAR_fill_pixels_remaining_MUX_uxn_c_l128_c2_0b70_return_output := fill_pixels_remaining_MUX_uxn_c_l128_c2_0b70_return_output;

     -- Submodule level 6
     VAR_MUX_uxn_c_l158_c3_4d4b_iftrue := VAR_fill_color_MUX_uxn_c_l128_c2_0b70_return_output;
     VAR_MUX_uxn_c_l165_c3_f996_iftrue := VAR_fill_color_MUX_uxn_c_l128_c2_0b70_return_output;
     REG_VAR_fill_color := VAR_fill_color_MUX_uxn_c_l128_c2_0b70_return_output;
     VAR_BIN_OP_AND_uxn_c_l153_c19_a880_right := VAR_fill_layer_MUX_uxn_c_l128_c2_0b70_return_output;
     VAR_UNARY_OP_NOT_uxn_c_l152_c37_4d4e_expr := VAR_fill_layer_MUX_uxn_c_l128_c2_0b70_return_output;
     REG_VAR_fill_layer := VAR_fill_layer_MUX_uxn_c_l128_c2_0b70_return_output;
     VAR_BIN_OP_EQ_uxn_c_l144_c19_8ec9_left := VAR_fill_pixels_remaining_MUX_uxn_c_l128_c2_0b70_return_output;
     VAR_BIN_OP_EQ_uxn_c_l174_c27_df5f_left := VAR_fill_pixels_remaining_MUX_uxn_c_l128_c2_0b70_return_output;
     VAR_BIN_OP_MINUS_uxn_c_l174_c60_5029_left := VAR_fill_pixels_remaining_MUX_uxn_c_l128_c2_0b70_return_output;
     VAR_fill_pixels_remaining_MUX_uxn_c_l170_c2_f6e8_iftrue := VAR_fill_pixels_remaining_MUX_uxn_c_l128_c2_0b70_return_output;
     VAR_fill_pixels_remaining_MUX_uxn_c_l172_c9_f573_iffalse := VAR_fill_pixels_remaining_MUX_uxn_c_l128_c2_0b70_return_output;
     VAR_BIN_OP_GT_uxn_c_l146_c17_580d_right := VAR_fill_x0_MUX_uxn_c_l128_c2_0b70_return_output;
     REG_VAR_fill_x0 := VAR_fill_x0_MUX_uxn_c_l128_c2_0b70_return_output;
     VAR_BIN_OP_LT_uxn_c_l147_c17_291a_right := VAR_fill_x1_MUX_uxn_c_l128_c2_0b70_return_output;
     REG_VAR_fill_x1 := VAR_fill_x1_MUX_uxn_c_l128_c2_0b70_return_output;
     VAR_BIN_OP_GT_uxn_c_l148_c17_ed21_right := VAR_fill_y0_MUX_uxn_c_l128_c2_0b70_return_output;
     REG_VAR_fill_y0 := VAR_fill_y0_MUX_uxn_c_l128_c2_0b70_return_output;
     VAR_BIN_OP_LT_uxn_c_l149_c17_83b1_right := VAR_fill_y1_MUX_uxn_c_l128_c2_0b70_return_output;
     REG_VAR_fill_y1 := VAR_fill_y1_MUX_uxn_c_l128_c2_0b70_return_output;
     REG_VAR_is_fill_left := VAR_is_fill_left_MUX_uxn_c_l128_c2_0b70_return_output;
     REG_VAR_is_fill_top := VAR_is_fill_top_MUX_uxn_c_l128_c2_0b70_return_output;
     -- BIN_OP_EQ[uxn_c_l144_c19_8ec9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l144_c19_8ec9_left <= VAR_BIN_OP_EQ_uxn_c_l144_c19_8ec9_left;
     BIN_OP_EQ_uxn_c_l144_c19_8ec9_right <= VAR_BIN_OP_EQ_uxn_c_l144_c19_8ec9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l144_c19_8ec9_return_output := BIN_OP_EQ_uxn_c_l144_c19_8ec9_return_output;

     -- BIN_OP_GT[uxn_c_l146_c17_580d] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_c_l146_c17_580d_left <= VAR_BIN_OP_GT_uxn_c_l146_c17_580d_left;
     BIN_OP_GT_uxn_c_l146_c17_580d_right <= VAR_BIN_OP_GT_uxn_c_l146_c17_580d_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_c_l146_c17_580d_return_output := BIN_OP_GT_uxn_c_l146_c17_580d_return_output;

     -- BIN_OP_MINUS[uxn_c_l174_c60_5029] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l174_c60_5029_left <= VAR_BIN_OP_MINUS_uxn_c_l174_c60_5029_left;
     BIN_OP_MINUS_uxn_c_l174_c60_5029_right <= VAR_BIN_OP_MINUS_uxn_c_l174_c60_5029_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l174_c60_5029_return_output := BIN_OP_MINUS_uxn_c_l174_c60_5029_return_output;

     -- BIN_OP_LT[uxn_c_l147_c17_291a] LATENCY=0
     -- Inputs
     BIN_OP_LT_uxn_c_l147_c17_291a_left <= VAR_BIN_OP_LT_uxn_c_l147_c17_291a_left;
     BIN_OP_LT_uxn_c_l147_c17_291a_right <= VAR_BIN_OP_LT_uxn_c_l147_c17_291a_right;
     -- Outputs
     VAR_BIN_OP_LT_uxn_c_l147_c17_291a_return_output := BIN_OP_LT_uxn_c_l147_c17_291a_return_output;

     -- BIN_OP_LT[uxn_c_l149_c17_83b1] LATENCY=0
     -- Inputs
     BIN_OP_LT_uxn_c_l149_c17_83b1_left <= VAR_BIN_OP_LT_uxn_c_l149_c17_83b1_left;
     BIN_OP_LT_uxn_c_l149_c17_83b1_right <= VAR_BIN_OP_LT_uxn_c_l149_c17_83b1_right;
     -- Outputs
     VAR_BIN_OP_LT_uxn_c_l149_c17_83b1_return_output := BIN_OP_LT_uxn_c_l149_c17_83b1_return_output;

     -- UNARY_OP_NOT[uxn_c_l152_c37_4d4e] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l152_c37_4d4e_expr <= VAR_UNARY_OP_NOT_uxn_c_l152_c37_4d4e_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l152_c37_4d4e_return_output := UNARY_OP_NOT_uxn_c_l152_c37_4d4e_return_output;

     -- BIN_OP_EQ[uxn_c_l174_c27_df5f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l174_c27_df5f_left <= VAR_BIN_OP_EQ_uxn_c_l174_c27_df5f_left;
     BIN_OP_EQ_uxn_c_l174_c27_df5f_right <= VAR_BIN_OP_EQ_uxn_c_l174_c27_df5f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l174_c27_df5f_return_output := BIN_OP_EQ_uxn_c_l174_c27_df5f_return_output;

     -- BIN_OP_GT[uxn_c_l148_c17_ed21] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_c_l148_c17_ed21_left <= VAR_BIN_OP_GT_uxn_c_l148_c17_ed21_left;
     BIN_OP_GT_uxn_c_l148_c17_ed21_right <= VAR_BIN_OP_GT_uxn_c_l148_c17_ed21_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_c_l148_c17_ed21_return_output := BIN_OP_GT_uxn_c_l148_c17_ed21_return_output;

     -- Submodule level 7
     VAR_MUX_uxn_c_l144_c19_41aa_cond := VAR_BIN_OP_EQ_uxn_c_l144_c19_8ec9_return_output;
     VAR_MUX_uxn_c_l174_c27_42eb_cond := VAR_BIN_OP_EQ_uxn_c_l174_c27_df5f_return_output;
     VAR_BIN_OP_AND_uxn_c_l151_c18_360f_right := VAR_BIN_OP_GT_uxn_c_l146_c17_580d_return_output;
     REG_VAR_fill_isect_l := VAR_BIN_OP_GT_uxn_c_l146_c17_580d_return_output;
     VAR_BIN_OP_AND_uxn_c_l151_c18_7f9a_right := VAR_BIN_OP_GT_uxn_c_l148_c17_ed21_return_output;
     REG_VAR_fill_isect_t := VAR_BIN_OP_GT_uxn_c_l148_c17_ed21_return_output;
     VAR_BIN_OP_AND_uxn_c_l151_c18_3112_right := VAR_BIN_OP_LT_uxn_c_l147_c17_291a_return_output;
     REG_VAR_fill_isect_r := VAR_BIN_OP_LT_uxn_c_l147_c17_291a_return_output;
     VAR_BIN_OP_AND_uxn_c_l151_c18_59b8_right := VAR_BIN_OP_LT_uxn_c_l149_c17_83b1_return_output;
     REG_VAR_fill_isect_b := VAR_BIN_OP_LT_uxn_c_l149_c17_83b1_return_output;
     VAR_MUX_uxn_c_l174_c27_42eb_iffalse := VAR_BIN_OP_MINUS_uxn_c_l174_c60_5029_return_output;
     VAR_BIN_OP_AND_uxn_c_l152_c19_9ac1_right := VAR_UNARY_OP_NOT_uxn_c_l152_c37_4d4e_return_output;
     -- MUX[uxn_c_l174_c27_42eb] LATENCY=0
     -- Inputs
     MUX_uxn_c_l174_c27_42eb_cond <= VAR_MUX_uxn_c_l174_c27_42eb_cond;
     MUX_uxn_c_l174_c27_42eb_iftrue <= VAR_MUX_uxn_c_l174_c27_42eb_iftrue;
     MUX_uxn_c_l174_c27_42eb_iffalse <= VAR_MUX_uxn_c_l174_c27_42eb_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l174_c27_42eb_return_output := MUX_uxn_c_l174_c27_42eb_return_output;

     -- MUX[uxn_c_l144_c19_41aa] LATENCY=0
     -- Inputs
     MUX_uxn_c_l144_c19_41aa_cond <= VAR_MUX_uxn_c_l144_c19_41aa_cond;
     MUX_uxn_c_l144_c19_41aa_iftrue <= VAR_MUX_uxn_c_l144_c19_41aa_iftrue;
     MUX_uxn_c_l144_c19_41aa_iffalse <= VAR_MUX_uxn_c_l144_c19_41aa_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l144_c19_41aa_return_output := MUX_uxn_c_l144_c19_41aa_return_output;

     -- Submodule level 8
     VAR_BIN_OP_AND_uxn_c_l151_c18_360f_left := VAR_MUX_uxn_c_l144_c19_41aa_return_output;
     VAR_MUX_uxn_c_l157_c37_3512_cond := VAR_MUX_uxn_c_l144_c19_41aa_return_output;
     VAR_MUX_uxn_c_l164_c37_f239_cond := VAR_MUX_uxn_c_l144_c19_41aa_return_output;
     VAR_UNARY_OP_NOT_uint1_t_uxn_c_l159_l166_DUPLICATE_16d9_expr := VAR_MUX_uxn_c_l144_c19_41aa_return_output;
     REG_VAR_is_fill_active := VAR_MUX_uxn_c_l144_c19_41aa_return_output;
     VAR_fill_pixels_remaining_MUX_uxn_c_l172_c9_f573_iftrue := VAR_MUX_uxn_c_l174_c27_42eb_return_output;
     -- MUX[uxn_c_l157_c37_3512] LATENCY=0
     -- Inputs
     MUX_uxn_c_l157_c37_3512_cond <= VAR_MUX_uxn_c_l157_c37_3512_cond;
     MUX_uxn_c_l157_c37_3512_iftrue <= VAR_MUX_uxn_c_l157_c37_3512_iftrue;
     MUX_uxn_c_l157_c37_3512_iffalse <= VAR_MUX_uxn_c_l157_c37_3512_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l157_c37_3512_return_output := MUX_uxn_c_l157_c37_3512_return_output;

     -- BIN_OP_AND[uxn_c_l151_c18_360f] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l151_c18_360f_left <= VAR_BIN_OP_AND_uxn_c_l151_c18_360f_left;
     BIN_OP_AND_uxn_c_l151_c18_360f_right <= VAR_BIN_OP_AND_uxn_c_l151_c18_360f_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l151_c18_360f_return_output := BIN_OP_AND_uxn_c_l151_c18_360f_return_output;

     -- UNARY_OP_NOT_uint1_t_uxn_c_l159_l166_DUPLICATE_16d9 LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uint1_t_uxn_c_l159_l166_DUPLICATE_16d9_expr <= VAR_UNARY_OP_NOT_uint1_t_uxn_c_l159_l166_DUPLICATE_16d9_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uint1_t_uxn_c_l159_l166_DUPLICATE_16d9_return_output := UNARY_OP_NOT_uint1_t_uxn_c_l159_l166_DUPLICATE_16d9_return_output;

     -- MUX[uxn_c_l164_c37_f239] LATENCY=0
     -- Inputs
     MUX_uxn_c_l164_c37_f239_cond <= VAR_MUX_uxn_c_l164_c37_f239_cond;
     MUX_uxn_c_l164_c37_f239_iftrue <= VAR_MUX_uxn_c_l164_c37_f239_iftrue;
     MUX_uxn_c_l164_c37_f239_iffalse <= VAR_MUX_uxn_c_l164_c37_f239_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l164_c37_f239_return_output := MUX_uxn_c_l164_c37_f239_return_output;

     -- fill_pixels_remaining_MUX[uxn_c_l172_c9_f573] LATENCY=0
     -- Inputs
     fill_pixels_remaining_MUX_uxn_c_l172_c9_f573_cond <= VAR_fill_pixels_remaining_MUX_uxn_c_l172_c9_f573_cond;
     fill_pixels_remaining_MUX_uxn_c_l172_c9_f573_iftrue <= VAR_fill_pixels_remaining_MUX_uxn_c_l172_c9_f573_iftrue;
     fill_pixels_remaining_MUX_uxn_c_l172_c9_f573_iffalse <= VAR_fill_pixels_remaining_MUX_uxn_c_l172_c9_f573_iffalse;
     -- Outputs
     VAR_fill_pixels_remaining_MUX_uxn_c_l172_c9_f573_return_output := fill_pixels_remaining_MUX_uxn_c_l172_c9_f573_return_output;

     -- Submodule level 9
     VAR_BIN_OP_AND_uxn_c_l151_c18_3112_left := VAR_BIN_OP_AND_uxn_c_l151_c18_360f_return_output;
     VAR_MUX_uxn_c_l157_c3_193e_iffalse := VAR_MUX_uxn_c_l157_c37_3512_return_output;
     VAR_MUX_uxn_c_l164_c3_b2cf_iffalse := VAR_MUX_uxn_c_l164_c37_f239_return_output;
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l166_l159_DUPLICATE_0d27_left := VAR_UNARY_OP_NOT_uint1_t_uxn_c_l159_l166_DUPLICATE_16d9_return_output;
     VAR_fill_pixels_remaining_MUX_uxn_c_l170_c2_f6e8_iffalse := VAR_fill_pixels_remaining_MUX_uxn_c_l172_c9_f573_return_output;
     -- BIN_OP_AND[uxn_c_l151_c18_3112] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l151_c18_3112_left <= VAR_BIN_OP_AND_uxn_c_l151_c18_3112_left;
     BIN_OP_AND_uxn_c_l151_c18_3112_right <= VAR_BIN_OP_AND_uxn_c_l151_c18_3112_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l151_c18_3112_return_output := BIN_OP_AND_uxn_c_l151_c18_3112_return_output;

     -- fill_pixels_remaining_MUX[uxn_c_l170_c2_f6e8] LATENCY=0
     -- Inputs
     fill_pixels_remaining_MUX_uxn_c_l170_c2_f6e8_cond <= VAR_fill_pixels_remaining_MUX_uxn_c_l170_c2_f6e8_cond;
     fill_pixels_remaining_MUX_uxn_c_l170_c2_f6e8_iftrue <= VAR_fill_pixels_remaining_MUX_uxn_c_l170_c2_f6e8_iftrue;
     fill_pixels_remaining_MUX_uxn_c_l170_c2_f6e8_iffalse <= VAR_fill_pixels_remaining_MUX_uxn_c_l170_c2_f6e8_iffalse;
     -- Outputs
     VAR_fill_pixels_remaining_MUX_uxn_c_l170_c2_f6e8_return_output := fill_pixels_remaining_MUX_uxn_c_l170_c2_f6e8_return_output;

     -- BIN_OP_AND_uint1_t_uint1_t_uxn_c_l166_l159_DUPLICATE_0d27 LATENCY=0
     -- Inputs
     BIN_OP_AND_uint1_t_uint1_t_uxn_c_l166_l159_DUPLICATE_0d27_left <= VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l166_l159_DUPLICATE_0d27_left;
     BIN_OP_AND_uint1_t_uint1_t_uxn_c_l166_l159_DUPLICATE_0d27_right <= VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l166_l159_DUPLICATE_0d27_right;
     -- Outputs
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l166_l159_DUPLICATE_0d27_return_output := BIN_OP_AND_uint1_t_uint1_t_uxn_c_l166_l159_DUPLICATE_0d27_return_output;

     -- Submodule level 10
     VAR_BIN_OP_AND_uxn_c_l151_c18_7f9a_left := VAR_BIN_OP_AND_uxn_c_l151_c18_3112_return_output;
     VAR_BIN_OP_AND_uxn_c_l159_c22_a84d_left := VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l166_l159_DUPLICATE_0d27_return_output;
     VAR_BIN_OP_AND_uxn_c_l166_c22_dc99_left := VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l166_l159_DUPLICATE_0d27_return_output;
     REG_VAR_fill_pixels_remaining := VAR_fill_pixels_remaining_MUX_uxn_c_l170_c2_f6e8_return_output;
     -- BIN_OP_AND[uxn_c_l151_c18_7f9a] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l151_c18_7f9a_left <= VAR_BIN_OP_AND_uxn_c_l151_c18_7f9a_left;
     BIN_OP_AND_uxn_c_l151_c18_7f9a_right <= VAR_BIN_OP_AND_uxn_c_l151_c18_7f9a_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l151_c18_7f9a_return_output := BIN_OP_AND_uxn_c_l151_c18_7f9a_return_output;

     -- BIN_OP_AND[uxn_c_l166_c22_dc99] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l166_c22_dc99_left <= VAR_BIN_OP_AND_uxn_c_l166_c22_dc99_left;
     BIN_OP_AND_uxn_c_l166_c22_dc99_right <= VAR_BIN_OP_AND_uxn_c_l166_c22_dc99_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l166_c22_dc99_return_output := BIN_OP_AND_uxn_c_l166_c22_dc99_return_output;

     -- BIN_OP_AND[uxn_c_l159_c22_a84d] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l159_c22_a84d_left <= VAR_BIN_OP_AND_uxn_c_l159_c22_a84d_left;
     BIN_OP_AND_uxn_c_l159_c22_a84d_right <= VAR_BIN_OP_AND_uxn_c_l159_c22_a84d_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l159_c22_a84d_return_output := BIN_OP_AND_uxn_c_l159_c22_a84d_return_output;

     -- Submodule level 11
     VAR_BIN_OP_AND_uxn_c_l151_c18_59b8_left := VAR_BIN_OP_AND_uxn_c_l151_c18_7f9a_return_output;
     VAR_BIN_OP_OR_uxn_c_l159_c3_f5d5_right := VAR_BIN_OP_AND_uxn_c_l159_c22_a84d_return_output;
     VAR_BIN_OP_OR_uxn_c_l166_c3_7af1_right := VAR_BIN_OP_AND_uxn_c_l166_c22_dc99_return_output;
     -- BIN_OP_AND[uxn_c_l151_c18_59b8] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l151_c18_59b8_left <= VAR_BIN_OP_AND_uxn_c_l151_c18_59b8_left;
     BIN_OP_AND_uxn_c_l151_c18_59b8_right <= VAR_BIN_OP_AND_uxn_c_l151_c18_59b8_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l151_c18_59b8_return_output := BIN_OP_AND_uxn_c_l151_c18_59b8_return_output;

     -- Submodule level 12
     VAR_BIN_OP_AND_uxn_c_l152_c19_9ac1_left := VAR_BIN_OP_AND_uxn_c_l151_c18_59b8_return_output;
     VAR_BIN_OP_AND_uxn_c_l153_c19_a880_left := VAR_BIN_OP_AND_uxn_c_l151_c18_59b8_return_output;
     REG_VAR_is_fill_pixel := VAR_BIN_OP_AND_uxn_c_l151_c18_59b8_return_output;
     -- BIN_OP_AND[uxn_c_l152_c19_9ac1] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l152_c19_9ac1_left <= VAR_BIN_OP_AND_uxn_c_l152_c19_9ac1_left;
     BIN_OP_AND_uxn_c_l152_c19_9ac1_right <= VAR_BIN_OP_AND_uxn_c_l152_c19_9ac1_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l152_c19_9ac1_return_output := BIN_OP_AND_uxn_c_l152_c19_9ac1_return_output;

     -- BIN_OP_AND[uxn_c_l153_c19_a880] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l153_c19_a880_left <= VAR_BIN_OP_AND_uxn_c_l153_c19_a880_left;
     BIN_OP_AND_uxn_c_l153_c19_a880_right <= VAR_BIN_OP_AND_uxn_c_l153_c19_a880_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l153_c19_a880_return_output := BIN_OP_AND_uxn_c_l153_c19_a880_return_output;

     -- Submodule level 13
     VAR_BIN_OP_OR_uxn_c_l159_c3_f5d5_left := VAR_BIN_OP_AND_uxn_c_l152_c19_9ac1_return_output;
     VAR_MUX_uxn_c_l157_c3_193e_cond := VAR_BIN_OP_AND_uxn_c_l152_c19_9ac1_return_output;
     VAR_MUX_uxn_c_l158_c3_4d4b_cond := VAR_BIN_OP_AND_uxn_c_l152_c19_9ac1_return_output;
     REG_VAR_is_fill_pixel0 := VAR_BIN_OP_AND_uxn_c_l152_c19_9ac1_return_output;
     VAR_BIN_OP_OR_uxn_c_l166_c3_7af1_left := VAR_BIN_OP_AND_uxn_c_l153_c19_a880_return_output;
     VAR_MUX_uxn_c_l164_c3_b2cf_cond := VAR_BIN_OP_AND_uxn_c_l153_c19_a880_return_output;
     VAR_MUX_uxn_c_l165_c3_f996_cond := VAR_BIN_OP_AND_uxn_c_l153_c19_a880_return_output;
     REG_VAR_is_fill_pixel1 := VAR_BIN_OP_AND_uxn_c_l153_c19_a880_return_output;
     -- MUX[uxn_c_l165_c3_f996] LATENCY=0
     -- Inputs
     MUX_uxn_c_l165_c3_f996_cond <= VAR_MUX_uxn_c_l165_c3_f996_cond;
     MUX_uxn_c_l165_c3_f996_iftrue <= VAR_MUX_uxn_c_l165_c3_f996_iftrue;
     MUX_uxn_c_l165_c3_f996_iffalse <= VAR_MUX_uxn_c_l165_c3_f996_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l165_c3_f996_return_output := MUX_uxn_c_l165_c3_f996_return_output;

     -- BIN_OP_OR[uxn_c_l166_c3_7af1] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l166_c3_7af1_left <= VAR_BIN_OP_OR_uxn_c_l166_c3_7af1_left;
     BIN_OP_OR_uxn_c_l166_c3_7af1_right <= VAR_BIN_OP_OR_uxn_c_l166_c3_7af1_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l166_c3_7af1_return_output := BIN_OP_OR_uxn_c_l166_c3_7af1_return_output;

     -- MUX[uxn_c_l158_c3_4d4b] LATENCY=0
     -- Inputs
     MUX_uxn_c_l158_c3_4d4b_cond <= VAR_MUX_uxn_c_l158_c3_4d4b_cond;
     MUX_uxn_c_l158_c3_4d4b_iftrue <= VAR_MUX_uxn_c_l158_c3_4d4b_iftrue;
     MUX_uxn_c_l158_c3_4d4b_iffalse <= VAR_MUX_uxn_c_l158_c3_4d4b_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l158_c3_4d4b_return_output := MUX_uxn_c_l158_c3_4d4b_return_output;

     -- BIN_OP_OR[uxn_c_l159_c3_f5d5] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l159_c3_f5d5_left <= VAR_BIN_OP_OR_uxn_c_l159_c3_f5d5_left;
     BIN_OP_OR_uxn_c_l159_c3_f5d5_right <= VAR_BIN_OP_OR_uxn_c_l159_c3_f5d5_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l159_c3_f5d5_return_output := BIN_OP_OR_uxn_c_l159_c3_f5d5_return_output;

     -- MUX[uxn_c_l164_c3_b2cf] LATENCY=0
     -- Inputs
     MUX_uxn_c_l164_c3_b2cf_cond <= VAR_MUX_uxn_c_l164_c3_b2cf_cond;
     MUX_uxn_c_l164_c3_b2cf_iftrue <= VAR_MUX_uxn_c_l164_c3_b2cf_iftrue;
     MUX_uxn_c_l164_c3_b2cf_iffalse <= VAR_MUX_uxn_c_l164_c3_b2cf_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l164_c3_b2cf_return_output := MUX_uxn_c_l164_c3_b2cf_return_output;

     -- MUX[uxn_c_l157_c3_193e] LATENCY=0
     -- Inputs
     MUX_uxn_c_l157_c3_193e_cond <= VAR_MUX_uxn_c_l157_c3_193e_cond;
     MUX_uxn_c_l157_c3_193e_iftrue <= VAR_MUX_uxn_c_l157_c3_193e_iftrue;
     MUX_uxn_c_l157_c3_193e_iffalse <= VAR_MUX_uxn_c_l157_c3_193e_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l157_c3_193e_return_output := MUX_uxn_c_l157_c3_193e_return_output;

     -- Submodule level 14
     VAR_bg_vram_update_uxn_c_l155_c19_b903_write_enable := VAR_BIN_OP_OR_uxn_c_l159_c3_f5d5_return_output;
     VAR_fg_vram_update_uxn_c_l162_c19_9eff_write_enable := VAR_BIN_OP_OR_uxn_c_l166_c3_7af1_return_output;
     VAR_bg_vram_update_uxn_c_l155_c19_b903_write_address := VAR_MUX_uxn_c_l157_c3_193e_return_output;
     VAR_bg_vram_update_uxn_c_l155_c19_b903_write_value := VAR_MUX_uxn_c_l158_c3_4d4b_return_output;
     VAR_fg_vram_update_uxn_c_l162_c19_9eff_write_address := VAR_MUX_uxn_c_l164_c3_b2cf_return_output;
     VAR_fg_vram_update_uxn_c_l162_c19_9eff_write_value := VAR_MUX_uxn_c_l165_c3_f996_return_output;
     -- bg_vram_update[uxn_c_l155_c19_b903] LATENCY=0
     -- Clock enable
     bg_vram_update_uxn_c_l155_c19_b903_CLOCK_ENABLE <= VAR_bg_vram_update_uxn_c_l155_c19_b903_CLOCK_ENABLE;
     -- Inputs
     bg_vram_update_uxn_c_l155_c19_b903_read_address <= VAR_bg_vram_update_uxn_c_l155_c19_b903_read_address;
     bg_vram_update_uxn_c_l155_c19_b903_write_address <= VAR_bg_vram_update_uxn_c_l155_c19_b903_write_address;
     bg_vram_update_uxn_c_l155_c19_b903_write_value <= VAR_bg_vram_update_uxn_c_l155_c19_b903_write_value;
     bg_vram_update_uxn_c_l155_c19_b903_write_enable <= VAR_bg_vram_update_uxn_c_l155_c19_b903_write_enable;
     -- Outputs
     VAR_bg_vram_update_uxn_c_l155_c19_b903_return_output := bg_vram_update_uxn_c_l155_c19_b903_return_output;

     -- fg_vram_update[uxn_c_l162_c19_9eff] LATENCY=0
     -- Clock enable
     fg_vram_update_uxn_c_l162_c19_9eff_CLOCK_ENABLE <= VAR_fg_vram_update_uxn_c_l162_c19_9eff_CLOCK_ENABLE;
     -- Inputs
     fg_vram_update_uxn_c_l162_c19_9eff_read_address <= VAR_fg_vram_update_uxn_c_l162_c19_9eff_read_address;
     fg_vram_update_uxn_c_l162_c19_9eff_write_address <= VAR_fg_vram_update_uxn_c_l162_c19_9eff_write_address;
     fg_vram_update_uxn_c_l162_c19_9eff_write_value <= VAR_fg_vram_update_uxn_c_l162_c19_9eff_write_value;
     fg_vram_update_uxn_c_l162_c19_9eff_write_enable <= VAR_fg_vram_update_uxn_c_l162_c19_9eff_write_enable;
     -- Outputs
     VAR_fg_vram_update_uxn_c_l162_c19_9eff_return_output := fg_vram_update_uxn_c_l162_c19_9eff_return_output;

     -- Submodule level 15
     VAR_MUX_uxn_c_l177_c17_8e24_iftrue := VAR_bg_vram_update_uxn_c_l155_c19_b903_return_output;
     REG_VAR_bg_pixel_color := VAR_bg_vram_update_uxn_c_l155_c19_b903_return_output;
     VAR_BIN_OP_EQ_uxn_c_l177_c17_73f6_left := VAR_fg_vram_update_uxn_c_l162_c19_9eff_return_output;
     VAR_MUX_uxn_c_l177_c17_8e24_iffalse := VAR_fg_vram_update_uxn_c_l162_c19_9eff_return_output;
     REG_VAR_fg_pixel_color := VAR_fg_vram_update_uxn_c_l162_c19_9eff_return_output;
     -- BIN_OP_EQ[uxn_c_l177_c17_73f6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l177_c17_73f6_left <= VAR_BIN_OP_EQ_uxn_c_l177_c17_73f6_left;
     BIN_OP_EQ_uxn_c_l177_c17_73f6_right <= VAR_BIN_OP_EQ_uxn_c_l177_c17_73f6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l177_c17_73f6_return_output := BIN_OP_EQ_uxn_c_l177_c17_73f6_return_output;

     -- Submodule level 16
     VAR_MUX_uxn_c_l177_c17_8e24_cond := VAR_BIN_OP_EQ_uxn_c_l177_c17_73f6_return_output;
     -- MUX[uxn_c_l177_c17_8e24] LATENCY=0
     -- Inputs
     MUX_uxn_c_l177_c17_8e24_cond <= VAR_MUX_uxn_c_l177_c17_8e24_cond;
     MUX_uxn_c_l177_c17_8e24_iftrue <= VAR_MUX_uxn_c_l177_c17_8e24_iftrue;
     MUX_uxn_c_l177_c17_8e24_iffalse <= VAR_MUX_uxn_c_l177_c17_8e24_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l177_c17_8e24_return_output := MUX_uxn_c_l177_c17_8e24_return_output;

     -- Submodule level 17
     -- CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_6984_uxn_c_l180_l106_DUPLICATE_1f6b LATENCY=0
     VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_6984_uxn_c_l180_l106_DUPLICATE_1f6b_return_output := CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_6984(
     VAR_MUX_uxn_c_l177_c17_8e24_return_output,
     VAR_MUX_uxn_c_l144_c19_41aa_return_output);

     -- Submodule level 18
     REG_VAR_result := VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_6984_uxn_c_l180_l106_DUPLICATE_1f6b_return_output;
     VAR_return_output := VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_6984_uxn_c_l180_l106_DUPLICATE_1f6b_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_result <= REG_VAR_result;
REG_COMB_vram_code <= REG_VAR_vram_code;
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
REG_COMB_is_fill_pixel <= REG_VAR_is_fill_pixel;
REG_COMB_is_fill_pixel0 <= REG_VAR_is_fill_pixel0;
REG_COMB_is_fill_pixel1 <= REG_VAR_is_fill_pixel1;
REG_COMB_fill_layer <= REG_VAR_fill_layer;
REG_COMB_fill_isect_l <= REG_VAR_fill_isect_l;
REG_COMB_fill_isect_r <= REG_VAR_fill_isect_r;
REG_COMB_fill_isect_t <= REG_VAR_fill_isect_t;
REG_COMB_fill_isect_b <= REG_VAR_fill_isect_b;
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
     vram_code <= REG_COMB_vram_code;
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
     is_fill_pixel <= REG_COMB_is_fill_pixel;
     is_fill_pixel0 <= REG_COMB_is_fill_pixel0;
     is_fill_pixel1 <= REG_COMB_is_fill_pixel1;
     fill_layer <= REG_COMB_fill_layer;
     fill_isect_l <= REG_COMB_fill_isect_l;
     fill_isect_r <= REG_COMB_fill_isect_r;
     fill_isect_t <= REG_COMB_fill_isect_t;
     fill_isect_b <= REG_COMB_fill_isect_b;
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
