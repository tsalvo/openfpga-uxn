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
-- BIN_OP_GT[uxn_c_l118_c26_c9f7]
signal BIN_OP_GT_uxn_c_l118_c26_c9f7_left : unsigned(31 downto 0);
signal BIN_OP_GT_uxn_c_l118_c26_c9f7_right : unsigned(17 downto 0);
signal BIN_OP_GT_uxn_c_l118_c26_c9f7_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l118_c26_b840]
signal MUX_uxn_c_l118_c26_b840_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l118_c26_b840_iftrue : unsigned(31 downto 0);
signal MUX_uxn_c_l118_c26_b840_iffalse : unsigned(31 downto 0);
signal MUX_uxn_c_l118_c26_b840_return_output : unsigned(31 downto 0);

-- CONST_SR_28[uxn_c_l119_c24_c152]
signal CONST_SR_28_uxn_c_l119_c24_c152_x : unsigned(31 downto 0);
signal CONST_SR_28_uxn_c_l119_c24_c152_return_output : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_c_l120_c17_7739]
signal BIN_OP_EQ_uxn_c_l120_c17_7739_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l120_c17_7739_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l120_c17_7739_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l120_c17_8fd5]
signal MUX_uxn_c_l120_c17_8fd5_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l120_c17_8fd5_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l120_c17_8fd5_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l120_c17_8fd5_return_output : unsigned(0 downto 0);

-- BIN_OP_DIV[uxn_c_l121_c6_96ec]
signal BIN_OP_DIV_uxn_c_l121_c6_96ec_left : unsigned(31 downto 0);
signal BIN_OP_DIV_uxn_c_l121_c6_96ec_right : unsigned(8 downto 0);
signal BIN_OP_DIV_uxn_c_l121_c6_96ec_return_output : unsigned(31 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_c_l122_c23_6456]
signal BIN_OP_INFERRED_MULT_uxn_c_l122_c23_6456_left : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_c_l122_c23_6456_right : unsigned(8 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_c_l122_c23_6456_return_output : unsigned(24 downto 0);

-- BIN_OP_MINUS[uxn_c_l122_c6_3c3e]
signal BIN_OP_MINUS_uxn_c_l122_c6_3c3e_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_uxn_c_l122_c6_3c3e_right : unsigned(24 downto 0);
signal BIN_OP_MINUS_uxn_c_l122_c6_3c3e_return_output : unsigned(31 downto 0);

-- UNARY_OP_NOT[uxn_c_l125_c22_505d]
signal UNARY_OP_NOT_uxn_c_l125_c22_505d_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l125_c22_505d_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l125_c6_4a6f]
signal BIN_OP_AND_uxn_c_l125_c6_4a6f_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l125_c6_4a6f_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l125_c6_4a6f_return_output : unsigned(0 downto 0);

-- fill_x1_MUX[uxn_c_l125_c2_5c01]
signal fill_x1_MUX_uxn_c_l125_c2_5c01_cond : unsigned(0 downto 0);
signal fill_x1_MUX_uxn_c_l125_c2_5c01_iftrue : unsigned(15 downto 0);
signal fill_x1_MUX_uxn_c_l125_c2_5c01_iffalse : unsigned(15 downto 0);
signal fill_x1_MUX_uxn_c_l125_c2_5c01_return_output : unsigned(15 downto 0);

-- fill_color_MUX[uxn_c_l125_c2_5c01]
signal fill_color_MUX_uxn_c_l125_c2_5c01_cond : unsigned(0 downto 0);
signal fill_color_MUX_uxn_c_l125_c2_5c01_iftrue : unsigned(1 downto 0);
signal fill_color_MUX_uxn_c_l125_c2_5c01_iffalse : unsigned(1 downto 0);
signal fill_color_MUX_uxn_c_l125_c2_5c01_return_output : unsigned(1 downto 0);

-- is_fill_top_MUX[uxn_c_l125_c2_5c01]
signal is_fill_top_MUX_uxn_c_l125_c2_5c01_cond : unsigned(0 downto 0);
signal is_fill_top_MUX_uxn_c_l125_c2_5c01_iftrue : unsigned(0 downto 0);
signal is_fill_top_MUX_uxn_c_l125_c2_5c01_iffalse : unsigned(0 downto 0);
signal is_fill_top_MUX_uxn_c_l125_c2_5c01_return_output : unsigned(0 downto 0);

-- fill_y0_MUX[uxn_c_l125_c2_5c01]
signal fill_y0_MUX_uxn_c_l125_c2_5c01_cond : unsigned(0 downto 0);
signal fill_y0_MUX_uxn_c_l125_c2_5c01_iftrue : unsigned(15 downto 0);
signal fill_y0_MUX_uxn_c_l125_c2_5c01_iffalse : unsigned(15 downto 0);
signal fill_y0_MUX_uxn_c_l125_c2_5c01_return_output : unsigned(15 downto 0);

-- fill_x0_MUX[uxn_c_l125_c2_5c01]
signal fill_x0_MUX_uxn_c_l125_c2_5c01_cond : unsigned(0 downto 0);
signal fill_x0_MUX_uxn_c_l125_c2_5c01_iftrue : unsigned(15 downto 0);
signal fill_x0_MUX_uxn_c_l125_c2_5c01_iffalse : unsigned(15 downto 0);
signal fill_x0_MUX_uxn_c_l125_c2_5c01_return_output : unsigned(15 downto 0);

-- fill_pixels_remaining_MUX[uxn_c_l125_c2_5c01]
signal fill_pixels_remaining_MUX_uxn_c_l125_c2_5c01_cond : unsigned(0 downto 0);
signal fill_pixels_remaining_MUX_uxn_c_l125_c2_5c01_iftrue : unsigned(31 downto 0);
signal fill_pixels_remaining_MUX_uxn_c_l125_c2_5c01_iffalse : unsigned(31 downto 0);
signal fill_pixels_remaining_MUX_uxn_c_l125_c2_5c01_return_output : unsigned(31 downto 0);

-- fill_y1_MUX[uxn_c_l125_c2_5c01]
signal fill_y1_MUX_uxn_c_l125_c2_5c01_cond : unsigned(0 downto 0);
signal fill_y1_MUX_uxn_c_l125_c2_5c01_iftrue : unsigned(15 downto 0);
signal fill_y1_MUX_uxn_c_l125_c2_5c01_iffalse : unsigned(15 downto 0);
signal fill_y1_MUX_uxn_c_l125_c2_5c01_return_output : unsigned(15 downto 0);

-- fill_layer_MUX[uxn_c_l125_c2_5c01]
signal fill_layer_MUX_uxn_c_l125_c2_5c01_cond : unsigned(0 downto 0);
signal fill_layer_MUX_uxn_c_l125_c2_5c01_iftrue : unsigned(0 downto 0);
signal fill_layer_MUX_uxn_c_l125_c2_5c01_iffalse : unsigned(0 downto 0);
signal fill_layer_MUX_uxn_c_l125_c2_5c01_return_output : unsigned(0 downto 0);

-- is_fill_left_MUX[uxn_c_l125_c2_5c01]
signal is_fill_left_MUX_uxn_c_l125_c2_5c01_cond : unsigned(0 downto 0);
signal is_fill_left_MUX_uxn_c_l125_c2_5c01_iftrue : unsigned(0 downto 0);
signal is_fill_left_MUX_uxn_c_l125_c2_5c01_iffalse : unsigned(0 downto 0);
signal is_fill_left_MUX_uxn_c_l125_c2_5c01_return_output : unsigned(0 downto 0);

-- CONST_SR_20[uxn_c_l127_c18_fab0]
signal CONST_SR_20_uxn_c_l127_c18_fab0_x : unsigned(31 downto 0);
signal CONST_SR_20_uxn_c_l127_c18_fab0_return_output : unsigned(31 downto 0);

-- CONST_SR_21[uxn_c_l128_c17_b0d4]
signal CONST_SR_21_uxn_c_l128_c17_b0d4_x : unsigned(31 downto 0);
signal CONST_SR_21_uxn_c_l128_c17_b0d4_return_output : unsigned(31 downto 0);

-- BIN_OP_AND[uxn_c_l129_c27_0c3c]
signal BIN_OP_AND_uxn_c_l129_c27_0c3c_left : unsigned(31 downto 0);
signal BIN_OP_AND_uxn_c_l129_c27_0c3c_right : unsigned(17 downto 0);
signal BIN_OP_AND_uxn_c_l129_c27_0c3c_return_output : unsigned(31 downto 0);

-- BIN_OP_DIV[uxn_c_l130_c13_2faf]
signal BIN_OP_DIV_uxn_c_l130_c13_2faf_left : unsigned(31 downto 0);
signal BIN_OP_DIV_uxn_c_l130_c13_2faf_right : unsigned(8 downto 0);
signal BIN_OP_DIV_uxn_c_l130_c13_2faf_return_output : unsigned(31 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_c_l131_c38_28b9]
signal BIN_OP_INFERRED_MULT_uxn_c_l131_c38_28b9_left : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_c_l131_c38_28b9_right : unsigned(8 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_c_l131_c38_28b9_return_output : unsigned(24 downto 0);

-- BIN_OP_MINUS[uxn_c_l131_c13_2269]
signal BIN_OP_MINUS_uxn_c_l131_c13_2269_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_uxn_c_l131_c13_2269_right : unsigned(24 downto 0);
signal BIN_OP_MINUS_uxn_c_l131_c13_2269_return_output : unsigned(31 downto 0);

-- MUX[uxn_c_l132_c13_ad8b]
signal MUX_uxn_c_l132_c13_ad8b_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l132_c13_ad8b_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l132_c13_ad8b_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l132_c13_ad8b_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l133_c13_485b]
signal MUX_uxn_c_l133_c13_485b_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l133_c13_485b_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l133_c13_485b_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l133_c13_485b_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l134_c13_840d]
signal MUX_uxn_c_l134_c13_840d_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l134_c13_840d_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l134_c13_840d_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l134_c13_840d_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l135_c13_f84f]
signal MUX_uxn_c_l135_c13_f84f_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l135_c13_f84f_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l135_c13_f84f_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l135_c13_f84f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l141_c19_6a11]
signal BIN_OP_EQ_uxn_c_l141_c19_6a11_left : unsigned(31 downto 0);
signal BIN_OP_EQ_uxn_c_l141_c19_6a11_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l141_c19_6a11_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l141_c19_2890]
signal MUX_uxn_c_l141_c19_2890_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l141_c19_2890_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l141_c19_2890_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l141_c19_2890_return_output : unsigned(0 downto 0);

-- BIN_OP_GT[uxn_c_l143_c17_e1fa]
signal BIN_OP_GT_uxn_c_l143_c17_e1fa_left : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_c_l143_c17_e1fa_right : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_c_l143_c17_e1fa_return_output : unsigned(0 downto 0);

-- BIN_OP_LT[uxn_c_l144_c17_26bd]
signal BIN_OP_LT_uxn_c_l144_c17_26bd_left : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_c_l144_c17_26bd_right : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_c_l144_c17_26bd_return_output : unsigned(0 downto 0);

-- BIN_OP_GT[uxn_c_l145_c17_cd28]
signal BIN_OP_GT_uxn_c_l145_c17_cd28_left : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_c_l145_c17_cd28_right : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_c_l145_c17_cd28_return_output : unsigned(0 downto 0);

-- BIN_OP_LT[uxn_c_l146_c17_5268]
signal BIN_OP_LT_uxn_c_l146_c17_5268_left : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_c_l146_c17_5268_right : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_c_l146_c17_5268_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l148_c18_b543]
signal BIN_OP_AND_uxn_c_l148_c18_b543_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l148_c18_b543_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l148_c18_b543_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l148_c18_3fd4]
signal BIN_OP_AND_uxn_c_l148_c18_3fd4_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l148_c18_3fd4_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l148_c18_3fd4_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l148_c18_bc5d]
signal BIN_OP_AND_uxn_c_l148_c18_bc5d_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l148_c18_bc5d_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l148_c18_bc5d_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l148_c18_5643]
signal BIN_OP_AND_uxn_c_l148_c18_5643_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l148_c18_5643_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l148_c18_5643_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_c_l149_c37_5825]
signal UNARY_OP_NOT_uxn_c_l149_c37_5825_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l149_c37_5825_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l149_c19_6569]
signal BIN_OP_AND_uxn_c_l149_c19_6569_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l149_c19_6569_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l149_c19_6569_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l150_c19_5bbe]
signal BIN_OP_AND_uxn_c_l150_c19_5bbe_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l150_c19_5bbe_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l150_c19_5bbe_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l154_c37_1089]
signal MUX_uxn_c_l154_c37_1089_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l154_c37_1089_iftrue : unsigned(31 downto 0);
signal MUX_uxn_c_l154_c37_1089_iffalse : unsigned(31 downto 0);
signal MUX_uxn_c_l154_c37_1089_return_output : unsigned(31 downto 0);

-- MUX[uxn_c_l154_c3_0dca]
signal MUX_uxn_c_l154_c3_0dca_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l154_c3_0dca_iftrue : unsigned(31 downto 0);
signal MUX_uxn_c_l154_c3_0dca_iffalse : unsigned(31 downto 0);
signal MUX_uxn_c_l154_c3_0dca_return_output : unsigned(31 downto 0);

-- MUX[uxn_c_l155_c3_3195]
signal MUX_uxn_c_l155_c3_3195_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l155_c3_3195_iftrue : unsigned(1 downto 0);
signal MUX_uxn_c_l155_c3_3195_iffalse : unsigned(1 downto 0);
signal MUX_uxn_c_l155_c3_3195_return_output : unsigned(1 downto 0);

-- UNARY_OP_NOT[uxn_c_l156_c57_0aea]
signal UNARY_OP_NOT_uxn_c_l156_c57_0aea_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l156_c57_0aea_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l156_c22_7890]
signal BIN_OP_AND_uxn_c_l156_c22_7890_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l156_c22_7890_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l156_c22_7890_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_c_l156_c3_89b7]
signal BIN_OP_OR_uxn_c_l156_c3_89b7_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l156_c3_89b7_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l156_c3_89b7_return_output : unsigned(0 downto 0);

-- bg_vram_update[uxn_c_l152_c19_75ed]
signal bg_vram_update_uxn_c_l152_c19_75ed_CLOCK_ENABLE : unsigned(0 downto 0);
signal bg_vram_update_uxn_c_l152_c19_75ed_read_address : unsigned(31 downto 0);
signal bg_vram_update_uxn_c_l152_c19_75ed_write_address : unsigned(31 downto 0);
signal bg_vram_update_uxn_c_l152_c19_75ed_write_value : unsigned(1 downto 0);
signal bg_vram_update_uxn_c_l152_c19_75ed_write_enable : unsigned(0 downto 0);
signal bg_vram_update_uxn_c_l152_c19_75ed_return_output : unsigned(1 downto 0);

-- MUX[uxn_c_l161_c37_151d]
signal MUX_uxn_c_l161_c37_151d_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l161_c37_151d_iftrue : unsigned(31 downto 0);
signal MUX_uxn_c_l161_c37_151d_iffalse : unsigned(31 downto 0);
signal MUX_uxn_c_l161_c37_151d_return_output : unsigned(31 downto 0);

-- MUX[uxn_c_l161_c3_5a30]
signal MUX_uxn_c_l161_c3_5a30_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l161_c3_5a30_iftrue : unsigned(31 downto 0);
signal MUX_uxn_c_l161_c3_5a30_iffalse : unsigned(31 downto 0);
signal MUX_uxn_c_l161_c3_5a30_return_output : unsigned(31 downto 0);

-- MUX[uxn_c_l162_c3_1c73]
signal MUX_uxn_c_l162_c3_1c73_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l162_c3_1c73_iftrue : unsigned(1 downto 0);
signal MUX_uxn_c_l162_c3_1c73_iffalse : unsigned(1 downto 0);
signal MUX_uxn_c_l162_c3_1c73_return_output : unsigned(1 downto 0);

-- BIN_OP_AND[uxn_c_l163_c22_7441]
signal BIN_OP_AND_uxn_c_l163_c22_7441_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l163_c22_7441_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l163_c22_7441_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_c_l163_c3_d632]
signal BIN_OP_OR_uxn_c_l163_c3_d632_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l163_c3_d632_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l163_c3_d632_return_output : unsigned(0 downto 0);

-- fg_vram_update[uxn_c_l159_c19_ce04]
signal fg_vram_update_uxn_c_l159_c19_ce04_CLOCK_ENABLE : unsigned(0 downto 0);
signal fg_vram_update_uxn_c_l159_c19_ce04_read_address : unsigned(31 downto 0);
signal fg_vram_update_uxn_c_l159_c19_ce04_write_address : unsigned(31 downto 0);
signal fg_vram_update_uxn_c_l159_c19_ce04_write_value : unsigned(1 downto 0);
signal fg_vram_update_uxn_c_l159_c19_ce04_write_enable : unsigned(0 downto 0);
signal fg_vram_update_uxn_c_l159_c19_ce04_return_output : unsigned(1 downto 0);

-- BIN_OP_EQ[uxn_c_l167_c6_5f1d]
signal BIN_OP_EQ_uxn_c_l167_c6_5f1d_left : unsigned(31 downto 0);
signal BIN_OP_EQ_uxn_c_l167_c6_5f1d_right : unsigned(17 downto 0);
signal BIN_OP_EQ_uxn_c_l167_c6_5f1d_return_output : unsigned(0 downto 0);

-- fill_pixels_remaining_MUX[uxn_c_l167_c2_233c]
signal fill_pixels_remaining_MUX_uxn_c_l167_c2_233c_cond : unsigned(0 downto 0);
signal fill_pixels_remaining_MUX_uxn_c_l167_c2_233c_iftrue : unsigned(31 downto 0);
signal fill_pixels_remaining_MUX_uxn_c_l167_c2_233c_iffalse : unsigned(31 downto 0);
signal fill_pixels_remaining_MUX_uxn_c_l167_c2_233c_return_output : unsigned(31 downto 0);

-- pixel_counter_MUX[uxn_c_l167_c2_233c]
signal pixel_counter_MUX_uxn_c_l167_c2_233c_cond : unsigned(0 downto 0);
signal pixel_counter_MUX_uxn_c_l167_c2_233c_iftrue : unsigned(31 downto 0);
signal pixel_counter_MUX_uxn_c_l167_c2_233c_iffalse : unsigned(31 downto 0);
signal pixel_counter_MUX_uxn_c_l167_c2_233c_return_output : unsigned(31 downto 0);

-- fill_pixels_remaining_MUX[uxn_c_l169_c9_5846]
signal fill_pixels_remaining_MUX_uxn_c_l169_c9_5846_cond : unsigned(0 downto 0);
signal fill_pixels_remaining_MUX_uxn_c_l169_c9_5846_iftrue : unsigned(31 downto 0);
signal fill_pixels_remaining_MUX_uxn_c_l169_c9_5846_iffalse : unsigned(31 downto 0);
signal fill_pixels_remaining_MUX_uxn_c_l169_c9_5846_return_output : unsigned(31 downto 0);

-- pixel_counter_MUX[uxn_c_l169_c9_5846]
signal pixel_counter_MUX_uxn_c_l169_c9_5846_cond : unsigned(0 downto 0);
signal pixel_counter_MUX_uxn_c_l169_c9_5846_iftrue : unsigned(31 downto 0);
signal pixel_counter_MUX_uxn_c_l169_c9_5846_iffalse : unsigned(31 downto 0);
signal pixel_counter_MUX_uxn_c_l169_c9_5846_return_output : unsigned(31 downto 0);

-- BIN_OP_PLUS[uxn_c_l170_c3_e918]
signal BIN_OP_PLUS_uxn_c_l170_c3_e918_left : unsigned(31 downto 0);
signal BIN_OP_PLUS_uxn_c_l170_c3_e918_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l170_c3_e918_return_output : unsigned(32 downto 0);

-- BIN_OP_EQ[uxn_c_l171_c27_63df]
signal BIN_OP_EQ_uxn_c_l171_c27_63df_left : unsigned(31 downto 0);
signal BIN_OP_EQ_uxn_c_l171_c27_63df_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l171_c27_63df_return_output : unsigned(0 downto 0);

-- BIN_OP_MINUS[uxn_c_l171_c60_b9e6]
signal BIN_OP_MINUS_uxn_c_l171_c60_b9e6_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_uxn_c_l171_c60_b9e6_right : unsigned(0 downto 0);
signal BIN_OP_MINUS_uxn_c_l171_c60_b9e6_return_output : unsigned(31 downto 0);

-- MUX[uxn_c_l171_c27_8ce9]
signal MUX_uxn_c_l171_c27_8ce9_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l171_c27_8ce9_iftrue : unsigned(31 downto 0);
signal MUX_uxn_c_l171_c27_8ce9_iffalse : unsigned(31 downto 0);
signal MUX_uxn_c_l171_c27_8ce9_return_output : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_c_l174_c17_8388]
signal BIN_OP_EQ_uxn_c_l174_c17_8388_left : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l174_c17_8388_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l174_c17_8388_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l174_c17_5acb]
signal MUX_uxn_c_l174_c17_5acb_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l174_c17_5acb_iftrue : unsigned(1 downto 0);
signal MUX_uxn_c_l174_c17_5acb_iffalse : unsigned(1 downto 0);
signal MUX_uxn_c_l174_c17_5acb_return_output : unsigned(1 downto 0);

-- UNARY_OP_NOT_uint1_t_uxn_c_l156_l163_DUPLICATE_3726
signal UNARY_OP_NOT_uint1_t_uxn_c_l156_l163_DUPLICATE_3726_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uint1_t_uxn_c_l156_l163_DUPLICATE_3726_return_output : unsigned(0 downto 0);

-- BIN_OP_AND_uint1_t_uint1_t_uxn_c_l163_l156_DUPLICATE_1f57
signal BIN_OP_AND_uint1_t_uint1_t_uxn_c_l163_l156_DUPLICATE_1f57_left : unsigned(0 downto 0);
signal BIN_OP_AND_uint1_t_uint1_t_uxn_c_l163_l156_DUPLICATE_1f57_right : unsigned(0 downto 0);
signal BIN_OP_AND_uint1_t_uint1_t_uxn_c_l163_l156_DUPLICATE_1f57_return_output : unsigned(0 downto 0);

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
-- BIN_OP_GT_uxn_c_l118_c26_c9f7
BIN_OP_GT_uxn_c_l118_c26_c9f7 : entity work.BIN_OP_GT_uint32_t_uint18_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_c_l118_c26_c9f7_left,
BIN_OP_GT_uxn_c_l118_c26_c9f7_right,
BIN_OP_GT_uxn_c_l118_c26_c9f7_return_output);

-- MUX_uxn_c_l118_c26_b840
MUX_uxn_c_l118_c26_b840 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
MUX_uxn_c_l118_c26_b840_cond,
MUX_uxn_c_l118_c26_b840_iftrue,
MUX_uxn_c_l118_c26_b840_iffalse,
MUX_uxn_c_l118_c26_b840_return_output);

-- CONST_SR_28_uxn_c_l119_c24_c152
CONST_SR_28_uxn_c_l119_c24_c152 : entity work.CONST_SR_28_uint32_t_0CLK_de264c78 port map (
CONST_SR_28_uxn_c_l119_c24_c152_x,
CONST_SR_28_uxn_c_l119_c24_c152_return_output);

-- BIN_OP_EQ_uxn_c_l120_c17_7739
BIN_OP_EQ_uxn_c_l120_c17_7739 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l120_c17_7739_left,
BIN_OP_EQ_uxn_c_l120_c17_7739_right,
BIN_OP_EQ_uxn_c_l120_c17_7739_return_output);

-- MUX_uxn_c_l120_c17_8fd5
MUX_uxn_c_l120_c17_8fd5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l120_c17_8fd5_cond,
MUX_uxn_c_l120_c17_8fd5_iftrue,
MUX_uxn_c_l120_c17_8fd5_iffalse,
MUX_uxn_c_l120_c17_8fd5_return_output);

-- BIN_OP_DIV_uxn_c_l121_c6_96ec
BIN_OP_DIV_uxn_c_l121_c6_96ec : entity work.BIN_OP_DIV_uint32_t_uint9_t_0CLK_422b4ffb port map (
BIN_OP_DIV_uxn_c_l121_c6_96ec_left,
BIN_OP_DIV_uxn_c_l121_c6_96ec_right,
BIN_OP_DIV_uxn_c_l121_c6_96ec_return_output);

-- BIN_OP_INFERRED_MULT_uxn_c_l122_c23_6456
BIN_OP_INFERRED_MULT_uxn_c_l122_c23_6456 : entity work.BIN_OP_INFERRED_MULT_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_c_l122_c23_6456_left,
BIN_OP_INFERRED_MULT_uxn_c_l122_c23_6456_right,
BIN_OP_INFERRED_MULT_uxn_c_l122_c23_6456_return_output);

-- BIN_OP_MINUS_uxn_c_l122_c6_3c3e
BIN_OP_MINUS_uxn_c_l122_c6_3c3e : entity work.BIN_OP_MINUS_uint32_t_uint25_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l122_c6_3c3e_left,
BIN_OP_MINUS_uxn_c_l122_c6_3c3e_right,
BIN_OP_MINUS_uxn_c_l122_c6_3c3e_return_output);

-- UNARY_OP_NOT_uxn_c_l125_c22_505d
UNARY_OP_NOT_uxn_c_l125_c22_505d : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l125_c22_505d_expr,
UNARY_OP_NOT_uxn_c_l125_c22_505d_return_output);

-- BIN_OP_AND_uxn_c_l125_c6_4a6f
BIN_OP_AND_uxn_c_l125_c6_4a6f : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l125_c6_4a6f_left,
BIN_OP_AND_uxn_c_l125_c6_4a6f_right,
BIN_OP_AND_uxn_c_l125_c6_4a6f_return_output);

-- fill_x1_MUX_uxn_c_l125_c2_5c01
fill_x1_MUX_uxn_c_l125_c2_5c01 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_x1_MUX_uxn_c_l125_c2_5c01_cond,
fill_x1_MUX_uxn_c_l125_c2_5c01_iftrue,
fill_x1_MUX_uxn_c_l125_c2_5c01_iffalse,
fill_x1_MUX_uxn_c_l125_c2_5c01_return_output);

-- fill_color_MUX_uxn_c_l125_c2_5c01
fill_color_MUX_uxn_c_l125_c2_5c01 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
fill_color_MUX_uxn_c_l125_c2_5c01_cond,
fill_color_MUX_uxn_c_l125_c2_5c01_iftrue,
fill_color_MUX_uxn_c_l125_c2_5c01_iffalse,
fill_color_MUX_uxn_c_l125_c2_5c01_return_output);

-- is_fill_top_MUX_uxn_c_l125_c2_5c01
is_fill_top_MUX_uxn_c_l125_c2_5c01 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_top_MUX_uxn_c_l125_c2_5c01_cond,
is_fill_top_MUX_uxn_c_l125_c2_5c01_iftrue,
is_fill_top_MUX_uxn_c_l125_c2_5c01_iffalse,
is_fill_top_MUX_uxn_c_l125_c2_5c01_return_output);

-- fill_y0_MUX_uxn_c_l125_c2_5c01
fill_y0_MUX_uxn_c_l125_c2_5c01 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_y0_MUX_uxn_c_l125_c2_5c01_cond,
fill_y0_MUX_uxn_c_l125_c2_5c01_iftrue,
fill_y0_MUX_uxn_c_l125_c2_5c01_iffalse,
fill_y0_MUX_uxn_c_l125_c2_5c01_return_output);

-- fill_x0_MUX_uxn_c_l125_c2_5c01
fill_x0_MUX_uxn_c_l125_c2_5c01 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_x0_MUX_uxn_c_l125_c2_5c01_cond,
fill_x0_MUX_uxn_c_l125_c2_5c01_iftrue,
fill_x0_MUX_uxn_c_l125_c2_5c01_iffalse,
fill_x0_MUX_uxn_c_l125_c2_5c01_return_output);

-- fill_pixels_remaining_MUX_uxn_c_l125_c2_5c01
fill_pixels_remaining_MUX_uxn_c_l125_c2_5c01 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
fill_pixels_remaining_MUX_uxn_c_l125_c2_5c01_cond,
fill_pixels_remaining_MUX_uxn_c_l125_c2_5c01_iftrue,
fill_pixels_remaining_MUX_uxn_c_l125_c2_5c01_iffalse,
fill_pixels_remaining_MUX_uxn_c_l125_c2_5c01_return_output);

-- fill_y1_MUX_uxn_c_l125_c2_5c01
fill_y1_MUX_uxn_c_l125_c2_5c01 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_y1_MUX_uxn_c_l125_c2_5c01_cond,
fill_y1_MUX_uxn_c_l125_c2_5c01_iftrue,
fill_y1_MUX_uxn_c_l125_c2_5c01_iffalse,
fill_y1_MUX_uxn_c_l125_c2_5c01_return_output);

-- fill_layer_MUX_uxn_c_l125_c2_5c01
fill_layer_MUX_uxn_c_l125_c2_5c01 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
fill_layer_MUX_uxn_c_l125_c2_5c01_cond,
fill_layer_MUX_uxn_c_l125_c2_5c01_iftrue,
fill_layer_MUX_uxn_c_l125_c2_5c01_iffalse,
fill_layer_MUX_uxn_c_l125_c2_5c01_return_output);

-- is_fill_left_MUX_uxn_c_l125_c2_5c01
is_fill_left_MUX_uxn_c_l125_c2_5c01 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_left_MUX_uxn_c_l125_c2_5c01_cond,
is_fill_left_MUX_uxn_c_l125_c2_5c01_iftrue,
is_fill_left_MUX_uxn_c_l125_c2_5c01_iffalse,
is_fill_left_MUX_uxn_c_l125_c2_5c01_return_output);

-- CONST_SR_20_uxn_c_l127_c18_fab0
CONST_SR_20_uxn_c_l127_c18_fab0 : entity work.CONST_SR_20_uint32_t_0CLK_de264c78 port map (
CONST_SR_20_uxn_c_l127_c18_fab0_x,
CONST_SR_20_uxn_c_l127_c18_fab0_return_output);

-- CONST_SR_21_uxn_c_l128_c17_b0d4
CONST_SR_21_uxn_c_l128_c17_b0d4 : entity work.CONST_SR_21_uint32_t_0CLK_de264c78 port map (
CONST_SR_21_uxn_c_l128_c17_b0d4_x,
CONST_SR_21_uxn_c_l128_c17_b0d4_return_output);

-- BIN_OP_AND_uxn_c_l129_c27_0c3c
BIN_OP_AND_uxn_c_l129_c27_0c3c : entity work.BIN_OP_AND_uint32_t_uint18_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l129_c27_0c3c_left,
BIN_OP_AND_uxn_c_l129_c27_0c3c_right,
BIN_OP_AND_uxn_c_l129_c27_0c3c_return_output);

-- BIN_OP_DIV_uxn_c_l130_c13_2faf
BIN_OP_DIV_uxn_c_l130_c13_2faf : entity work.BIN_OP_DIV_uint32_t_uint9_t_0CLK_422b4ffb port map (
BIN_OP_DIV_uxn_c_l130_c13_2faf_left,
BIN_OP_DIV_uxn_c_l130_c13_2faf_right,
BIN_OP_DIV_uxn_c_l130_c13_2faf_return_output);

-- BIN_OP_INFERRED_MULT_uxn_c_l131_c38_28b9
BIN_OP_INFERRED_MULT_uxn_c_l131_c38_28b9 : entity work.BIN_OP_INFERRED_MULT_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_c_l131_c38_28b9_left,
BIN_OP_INFERRED_MULT_uxn_c_l131_c38_28b9_right,
BIN_OP_INFERRED_MULT_uxn_c_l131_c38_28b9_return_output);

-- BIN_OP_MINUS_uxn_c_l131_c13_2269
BIN_OP_MINUS_uxn_c_l131_c13_2269 : entity work.BIN_OP_MINUS_uint32_t_uint25_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l131_c13_2269_left,
BIN_OP_MINUS_uxn_c_l131_c13_2269_right,
BIN_OP_MINUS_uxn_c_l131_c13_2269_return_output);

-- MUX_uxn_c_l132_c13_ad8b
MUX_uxn_c_l132_c13_ad8b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l132_c13_ad8b_cond,
MUX_uxn_c_l132_c13_ad8b_iftrue,
MUX_uxn_c_l132_c13_ad8b_iffalse,
MUX_uxn_c_l132_c13_ad8b_return_output);

-- MUX_uxn_c_l133_c13_485b
MUX_uxn_c_l133_c13_485b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l133_c13_485b_cond,
MUX_uxn_c_l133_c13_485b_iftrue,
MUX_uxn_c_l133_c13_485b_iffalse,
MUX_uxn_c_l133_c13_485b_return_output);

-- MUX_uxn_c_l134_c13_840d
MUX_uxn_c_l134_c13_840d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l134_c13_840d_cond,
MUX_uxn_c_l134_c13_840d_iftrue,
MUX_uxn_c_l134_c13_840d_iffalse,
MUX_uxn_c_l134_c13_840d_return_output);

-- MUX_uxn_c_l135_c13_f84f
MUX_uxn_c_l135_c13_f84f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l135_c13_f84f_cond,
MUX_uxn_c_l135_c13_f84f_iftrue,
MUX_uxn_c_l135_c13_f84f_iffalse,
MUX_uxn_c_l135_c13_f84f_return_output);

-- BIN_OP_EQ_uxn_c_l141_c19_6a11
BIN_OP_EQ_uxn_c_l141_c19_6a11 : entity work.BIN_OP_EQ_uint32_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l141_c19_6a11_left,
BIN_OP_EQ_uxn_c_l141_c19_6a11_right,
BIN_OP_EQ_uxn_c_l141_c19_6a11_return_output);

-- MUX_uxn_c_l141_c19_2890
MUX_uxn_c_l141_c19_2890 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l141_c19_2890_cond,
MUX_uxn_c_l141_c19_2890_iftrue,
MUX_uxn_c_l141_c19_2890_iffalse,
MUX_uxn_c_l141_c19_2890_return_output);

-- BIN_OP_GT_uxn_c_l143_c17_e1fa
BIN_OP_GT_uxn_c_l143_c17_e1fa : entity work.BIN_OP_GT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_c_l143_c17_e1fa_left,
BIN_OP_GT_uxn_c_l143_c17_e1fa_right,
BIN_OP_GT_uxn_c_l143_c17_e1fa_return_output);

-- BIN_OP_LT_uxn_c_l144_c17_26bd
BIN_OP_LT_uxn_c_l144_c17_26bd : entity work.BIN_OP_LT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_LT_uxn_c_l144_c17_26bd_left,
BIN_OP_LT_uxn_c_l144_c17_26bd_right,
BIN_OP_LT_uxn_c_l144_c17_26bd_return_output);

-- BIN_OP_GT_uxn_c_l145_c17_cd28
BIN_OP_GT_uxn_c_l145_c17_cd28 : entity work.BIN_OP_GT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_c_l145_c17_cd28_left,
BIN_OP_GT_uxn_c_l145_c17_cd28_right,
BIN_OP_GT_uxn_c_l145_c17_cd28_return_output);

-- BIN_OP_LT_uxn_c_l146_c17_5268
BIN_OP_LT_uxn_c_l146_c17_5268 : entity work.BIN_OP_LT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_LT_uxn_c_l146_c17_5268_left,
BIN_OP_LT_uxn_c_l146_c17_5268_right,
BIN_OP_LT_uxn_c_l146_c17_5268_return_output);

-- BIN_OP_AND_uxn_c_l148_c18_b543
BIN_OP_AND_uxn_c_l148_c18_b543 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l148_c18_b543_left,
BIN_OP_AND_uxn_c_l148_c18_b543_right,
BIN_OP_AND_uxn_c_l148_c18_b543_return_output);

-- BIN_OP_AND_uxn_c_l148_c18_3fd4
BIN_OP_AND_uxn_c_l148_c18_3fd4 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l148_c18_3fd4_left,
BIN_OP_AND_uxn_c_l148_c18_3fd4_right,
BIN_OP_AND_uxn_c_l148_c18_3fd4_return_output);

-- BIN_OP_AND_uxn_c_l148_c18_bc5d
BIN_OP_AND_uxn_c_l148_c18_bc5d : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l148_c18_bc5d_left,
BIN_OP_AND_uxn_c_l148_c18_bc5d_right,
BIN_OP_AND_uxn_c_l148_c18_bc5d_return_output);

-- BIN_OP_AND_uxn_c_l148_c18_5643
BIN_OP_AND_uxn_c_l148_c18_5643 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l148_c18_5643_left,
BIN_OP_AND_uxn_c_l148_c18_5643_right,
BIN_OP_AND_uxn_c_l148_c18_5643_return_output);

-- UNARY_OP_NOT_uxn_c_l149_c37_5825
UNARY_OP_NOT_uxn_c_l149_c37_5825 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l149_c37_5825_expr,
UNARY_OP_NOT_uxn_c_l149_c37_5825_return_output);

-- BIN_OP_AND_uxn_c_l149_c19_6569
BIN_OP_AND_uxn_c_l149_c19_6569 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l149_c19_6569_left,
BIN_OP_AND_uxn_c_l149_c19_6569_right,
BIN_OP_AND_uxn_c_l149_c19_6569_return_output);

-- BIN_OP_AND_uxn_c_l150_c19_5bbe
BIN_OP_AND_uxn_c_l150_c19_5bbe : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l150_c19_5bbe_left,
BIN_OP_AND_uxn_c_l150_c19_5bbe_right,
BIN_OP_AND_uxn_c_l150_c19_5bbe_return_output);

-- MUX_uxn_c_l154_c37_1089
MUX_uxn_c_l154_c37_1089 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
MUX_uxn_c_l154_c37_1089_cond,
MUX_uxn_c_l154_c37_1089_iftrue,
MUX_uxn_c_l154_c37_1089_iffalse,
MUX_uxn_c_l154_c37_1089_return_output);

-- MUX_uxn_c_l154_c3_0dca
MUX_uxn_c_l154_c3_0dca : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
MUX_uxn_c_l154_c3_0dca_cond,
MUX_uxn_c_l154_c3_0dca_iftrue,
MUX_uxn_c_l154_c3_0dca_iffalse,
MUX_uxn_c_l154_c3_0dca_return_output);

-- MUX_uxn_c_l155_c3_3195
MUX_uxn_c_l155_c3_3195 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
MUX_uxn_c_l155_c3_3195_cond,
MUX_uxn_c_l155_c3_3195_iftrue,
MUX_uxn_c_l155_c3_3195_iffalse,
MUX_uxn_c_l155_c3_3195_return_output);

-- UNARY_OP_NOT_uxn_c_l156_c57_0aea
UNARY_OP_NOT_uxn_c_l156_c57_0aea : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l156_c57_0aea_expr,
UNARY_OP_NOT_uxn_c_l156_c57_0aea_return_output);

-- BIN_OP_AND_uxn_c_l156_c22_7890
BIN_OP_AND_uxn_c_l156_c22_7890 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l156_c22_7890_left,
BIN_OP_AND_uxn_c_l156_c22_7890_right,
BIN_OP_AND_uxn_c_l156_c22_7890_return_output);

-- BIN_OP_OR_uxn_c_l156_c3_89b7
BIN_OP_OR_uxn_c_l156_c3_89b7 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l156_c3_89b7_left,
BIN_OP_OR_uxn_c_l156_c3_89b7_right,
BIN_OP_OR_uxn_c_l156_c3_89b7_return_output);

-- bg_vram_update_uxn_c_l152_c19_75ed
bg_vram_update_uxn_c_l152_c19_75ed : entity work.bg_vram_update_0CLK_b45f1687 port map (
clk,
bg_vram_update_uxn_c_l152_c19_75ed_CLOCK_ENABLE,
bg_vram_update_uxn_c_l152_c19_75ed_read_address,
bg_vram_update_uxn_c_l152_c19_75ed_write_address,
bg_vram_update_uxn_c_l152_c19_75ed_write_value,
bg_vram_update_uxn_c_l152_c19_75ed_write_enable,
bg_vram_update_uxn_c_l152_c19_75ed_return_output);

-- MUX_uxn_c_l161_c37_151d
MUX_uxn_c_l161_c37_151d : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
MUX_uxn_c_l161_c37_151d_cond,
MUX_uxn_c_l161_c37_151d_iftrue,
MUX_uxn_c_l161_c37_151d_iffalse,
MUX_uxn_c_l161_c37_151d_return_output);

-- MUX_uxn_c_l161_c3_5a30
MUX_uxn_c_l161_c3_5a30 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
MUX_uxn_c_l161_c3_5a30_cond,
MUX_uxn_c_l161_c3_5a30_iftrue,
MUX_uxn_c_l161_c3_5a30_iffalse,
MUX_uxn_c_l161_c3_5a30_return_output);

-- MUX_uxn_c_l162_c3_1c73
MUX_uxn_c_l162_c3_1c73 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
MUX_uxn_c_l162_c3_1c73_cond,
MUX_uxn_c_l162_c3_1c73_iftrue,
MUX_uxn_c_l162_c3_1c73_iffalse,
MUX_uxn_c_l162_c3_1c73_return_output);

-- BIN_OP_AND_uxn_c_l163_c22_7441
BIN_OP_AND_uxn_c_l163_c22_7441 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l163_c22_7441_left,
BIN_OP_AND_uxn_c_l163_c22_7441_right,
BIN_OP_AND_uxn_c_l163_c22_7441_return_output);

-- BIN_OP_OR_uxn_c_l163_c3_d632
BIN_OP_OR_uxn_c_l163_c3_d632 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l163_c3_d632_left,
BIN_OP_OR_uxn_c_l163_c3_d632_right,
BIN_OP_OR_uxn_c_l163_c3_d632_return_output);

-- fg_vram_update_uxn_c_l159_c19_ce04
fg_vram_update_uxn_c_l159_c19_ce04 : entity work.fg_vram_update_0CLK_b45f1687 port map (
clk,
fg_vram_update_uxn_c_l159_c19_ce04_CLOCK_ENABLE,
fg_vram_update_uxn_c_l159_c19_ce04_read_address,
fg_vram_update_uxn_c_l159_c19_ce04_write_address,
fg_vram_update_uxn_c_l159_c19_ce04_write_value,
fg_vram_update_uxn_c_l159_c19_ce04_write_enable,
fg_vram_update_uxn_c_l159_c19_ce04_return_output);

-- BIN_OP_EQ_uxn_c_l167_c6_5f1d
BIN_OP_EQ_uxn_c_l167_c6_5f1d : entity work.BIN_OP_EQ_uint32_t_uint18_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l167_c6_5f1d_left,
BIN_OP_EQ_uxn_c_l167_c6_5f1d_right,
BIN_OP_EQ_uxn_c_l167_c6_5f1d_return_output);

-- fill_pixels_remaining_MUX_uxn_c_l167_c2_233c
fill_pixels_remaining_MUX_uxn_c_l167_c2_233c : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
fill_pixels_remaining_MUX_uxn_c_l167_c2_233c_cond,
fill_pixels_remaining_MUX_uxn_c_l167_c2_233c_iftrue,
fill_pixels_remaining_MUX_uxn_c_l167_c2_233c_iffalse,
fill_pixels_remaining_MUX_uxn_c_l167_c2_233c_return_output);

-- pixel_counter_MUX_uxn_c_l167_c2_233c
pixel_counter_MUX_uxn_c_l167_c2_233c : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
pixel_counter_MUX_uxn_c_l167_c2_233c_cond,
pixel_counter_MUX_uxn_c_l167_c2_233c_iftrue,
pixel_counter_MUX_uxn_c_l167_c2_233c_iffalse,
pixel_counter_MUX_uxn_c_l167_c2_233c_return_output);

-- fill_pixels_remaining_MUX_uxn_c_l169_c9_5846
fill_pixels_remaining_MUX_uxn_c_l169_c9_5846 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
fill_pixels_remaining_MUX_uxn_c_l169_c9_5846_cond,
fill_pixels_remaining_MUX_uxn_c_l169_c9_5846_iftrue,
fill_pixels_remaining_MUX_uxn_c_l169_c9_5846_iffalse,
fill_pixels_remaining_MUX_uxn_c_l169_c9_5846_return_output);

-- pixel_counter_MUX_uxn_c_l169_c9_5846
pixel_counter_MUX_uxn_c_l169_c9_5846 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
pixel_counter_MUX_uxn_c_l169_c9_5846_cond,
pixel_counter_MUX_uxn_c_l169_c9_5846_iftrue,
pixel_counter_MUX_uxn_c_l169_c9_5846_iffalse,
pixel_counter_MUX_uxn_c_l169_c9_5846_return_output);

-- BIN_OP_PLUS_uxn_c_l170_c3_e918
BIN_OP_PLUS_uxn_c_l170_c3_e918 : entity work.BIN_OP_PLUS_uint32_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l170_c3_e918_left,
BIN_OP_PLUS_uxn_c_l170_c3_e918_right,
BIN_OP_PLUS_uxn_c_l170_c3_e918_return_output);

-- BIN_OP_EQ_uxn_c_l171_c27_63df
BIN_OP_EQ_uxn_c_l171_c27_63df : entity work.BIN_OP_EQ_uint32_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l171_c27_63df_left,
BIN_OP_EQ_uxn_c_l171_c27_63df_right,
BIN_OP_EQ_uxn_c_l171_c27_63df_return_output);

-- BIN_OP_MINUS_uxn_c_l171_c60_b9e6
BIN_OP_MINUS_uxn_c_l171_c60_b9e6 : entity work.BIN_OP_MINUS_uint32_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l171_c60_b9e6_left,
BIN_OP_MINUS_uxn_c_l171_c60_b9e6_right,
BIN_OP_MINUS_uxn_c_l171_c60_b9e6_return_output);

-- MUX_uxn_c_l171_c27_8ce9
MUX_uxn_c_l171_c27_8ce9 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
MUX_uxn_c_l171_c27_8ce9_cond,
MUX_uxn_c_l171_c27_8ce9_iftrue,
MUX_uxn_c_l171_c27_8ce9_iffalse,
MUX_uxn_c_l171_c27_8ce9_return_output);

-- BIN_OP_EQ_uxn_c_l174_c17_8388
BIN_OP_EQ_uxn_c_l174_c17_8388 : entity work.BIN_OP_EQ_uint2_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l174_c17_8388_left,
BIN_OP_EQ_uxn_c_l174_c17_8388_right,
BIN_OP_EQ_uxn_c_l174_c17_8388_return_output);

-- MUX_uxn_c_l174_c17_5acb
MUX_uxn_c_l174_c17_5acb : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
MUX_uxn_c_l174_c17_5acb_cond,
MUX_uxn_c_l174_c17_5acb_iftrue,
MUX_uxn_c_l174_c17_5acb_iffalse,
MUX_uxn_c_l174_c17_5acb_return_output);

-- UNARY_OP_NOT_uint1_t_uxn_c_l156_l163_DUPLICATE_3726
UNARY_OP_NOT_uint1_t_uxn_c_l156_l163_DUPLICATE_3726 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uint1_t_uxn_c_l156_l163_DUPLICATE_3726_expr,
UNARY_OP_NOT_uint1_t_uxn_c_l156_l163_DUPLICATE_3726_return_output);

-- BIN_OP_AND_uint1_t_uint1_t_uxn_c_l163_l156_DUPLICATE_1f57
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l163_l156_DUPLICATE_1f57 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l163_l156_DUPLICATE_1f57_left,
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l163_l156_DUPLICATE_1f57_right,
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l163_l156_DUPLICATE_1f57_return_output);



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
 BIN_OP_GT_uxn_c_l118_c26_c9f7_return_output,
 MUX_uxn_c_l118_c26_b840_return_output,
 CONST_SR_28_uxn_c_l119_c24_c152_return_output,
 BIN_OP_EQ_uxn_c_l120_c17_7739_return_output,
 MUX_uxn_c_l120_c17_8fd5_return_output,
 BIN_OP_DIV_uxn_c_l121_c6_96ec_return_output,
 BIN_OP_INFERRED_MULT_uxn_c_l122_c23_6456_return_output,
 BIN_OP_MINUS_uxn_c_l122_c6_3c3e_return_output,
 UNARY_OP_NOT_uxn_c_l125_c22_505d_return_output,
 BIN_OP_AND_uxn_c_l125_c6_4a6f_return_output,
 fill_x1_MUX_uxn_c_l125_c2_5c01_return_output,
 fill_color_MUX_uxn_c_l125_c2_5c01_return_output,
 is_fill_top_MUX_uxn_c_l125_c2_5c01_return_output,
 fill_y0_MUX_uxn_c_l125_c2_5c01_return_output,
 fill_x0_MUX_uxn_c_l125_c2_5c01_return_output,
 fill_pixels_remaining_MUX_uxn_c_l125_c2_5c01_return_output,
 fill_y1_MUX_uxn_c_l125_c2_5c01_return_output,
 fill_layer_MUX_uxn_c_l125_c2_5c01_return_output,
 is_fill_left_MUX_uxn_c_l125_c2_5c01_return_output,
 CONST_SR_20_uxn_c_l127_c18_fab0_return_output,
 CONST_SR_21_uxn_c_l128_c17_b0d4_return_output,
 BIN_OP_AND_uxn_c_l129_c27_0c3c_return_output,
 BIN_OP_DIV_uxn_c_l130_c13_2faf_return_output,
 BIN_OP_INFERRED_MULT_uxn_c_l131_c38_28b9_return_output,
 BIN_OP_MINUS_uxn_c_l131_c13_2269_return_output,
 MUX_uxn_c_l132_c13_ad8b_return_output,
 MUX_uxn_c_l133_c13_485b_return_output,
 MUX_uxn_c_l134_c13_840d_return_output,
 MUX_uxn_c_l135_c13_f84f_return_output,
 BIN_OP_EQ_uxn_c_l141_c19_6a11_return_output,
 MUX_uxn_c_l141_c19_2890_return_output,
 BIN_OP_GT_uxn_c_l143_c17_e1fa_return_output,
 BIN_OP_LT_uxn_c_l144_c17_26bd_return_output,
 BIN_OP_GT_uxn_c_l145_c17_cd28_return_output,
 BIN_OP_LT_uxn_c_l146_c17_5268_return_output,
 BIN_OP_AND_uxn_c_l148_c18_b543_return_output,
 BIN_OP_AND_uxn_c_l148_c18_3fd4_return_output,
 BIN_OP_AND_uxn_c_l148_c18_bc5d_return_output,
 BIN_OP_AND_uxn_c_l148_c18_5643_return_output,
 UNARY_OP_NOT_uxn_c_l149_c37_5825_return_output,
 BIN_OP_AND_uxn_c_l149_c19_6569_return_output,
 BIN_OP_AND_uxn_c_l150_c19_5bbe_return_output,
 MUX_uxn_c_l154_c37_1089_return_output,
 MUX_uxn_c_l154_c3_0dca_return_output,
 MUX_uxn_c_l155_c3_3195_return_output,
 UNARY_OP_NOT_uxn_c_l156_c57_0aea_return_output,
 BIN_OP_AND_uxn_c_l156_c22_7890_return_output,
 BIN_OP_OR_uxn_c_l156_c3_89b7_return_output,
 bg_vram_update_uxn_c_l152_c19_75ed_return_output,
 MUX_uxn_c_l161_c37_151d_return_output,
 MUX_uxn_c_l161_c3_5a30_return_output,
 MUX_uxn_c_l162_c3_1c73_return_output,
 BIN_OP_AND_uxn_c_l163_c22_7441_return_output,
 BIN_OP_OR_uxn_c_l163_c3_d632_return_output,
 fg_vram_update_uxn_c_l159_c19_ce04_return_output,
 BIN_OP_EQ_uxn_c_l167_c6_5f1d_return_output,
 fill_pixels_remaining_MUX_uxn_c_l167_c2_233c_return_output,
 pixel_counter_MUX_uxn_c_l167_c2_233c_return_output,
 fill_pixels_remaining_MUX_uxn_c_l169_c9_5846_return_output,
 pixel_counter_MUX_uxn_c_l169_c9_5846_return_output,
 BIN_OP_PLUS_uxn_c_l170_c3_e918_return_output,
 BIN_OP_EQ_uxn_c_l171_c27_63df_return_output,
 BIN_OP_MINUS_uxn_c_l171_c60_b9e6_return_output,
 MUX_uxn_c_l171_c27_8ce9_return_output,
 BIN_OP_EQ_uxn_c_l174_c17_8388_return_output,
 MUX_uxn_c_l174_c17_5acb_return_output,
 UNARY_OP_NOT_uint1_t_uxn_c_l156_l163_DUPLICATE_3726_return_output,
 BIN_OP_AND_uint1_t_uint1_t_uxn_c_l163_l156_DUPLICATE_1f57_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : gpu_step_result_t;
 variable VAR_is_active_drawing_area : unsigned(0 downto 0);
 variable VAR_is_vram_write : unsigned(0 downto 0);
 variable VAR_vram_write_layer : unsigned(0 downto 0);
 variable VAR_vram_address : unsigned(31 downto 0);
 variable VAR_vram_value : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l118_c26_b840_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l118_c26_b840_iftrue : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l118_c26_b840_iffalse : unsigned(31 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l118_c26_c9f7_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l118_c26_c9f7_right : unsigned(17 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l118_c26_c9f7_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l118_c26_b840_return_output : unsigned(31 downto 0);
 variable VAR_CONST_SR_28_uxn_c_l119_c24_c152_return_output : unsigned(31 downto 0);
 variable VAR_CONST_SR_28_uxn_c_l119_c24_c152_x : unsigned(31 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_c_l119_c14_eda4_return_output : unsigned(3 downto 0);
 variable VAR_MUX_uxn_c_l120_c17_8fd5_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l120_c17_8fd5_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l120_c17_8fd5_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l120_c17_7739_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l120_c17_7739_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l120_c17_7739_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l120_c17_8fd5_return_output : unsigned(0 downto 0);
 variable VAR_y_uxn_c_l121_c2_556e : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_c_l121_c6_96ec_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_DIV_uxn_c_l121_c6_96ec_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_DIV_uxn_c_l121_c6_96ec_return_output : unsigned(31 downto 0);
 variable VAR_x_uxn_c_l122_c2_5d48 : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l122_c6_3c3e_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l122_c23_6456_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l122_c23_6456_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l122_c23_6456_return_output : unsigned(24 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l122_c6_3c3e_right : unsigned(24 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l122_c6_3c3e_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l125_c6_4a6f_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l125_c22_505d_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l125_c22_505d_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l125_c6_4a6f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l125_c6_4a6f_return_output : unsigned(0 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l125_c2_5c01_iftrue : unsigned(15 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l125_c2_5c01_iffalse : unsigned(15 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l125_c2_5c01_return_output : unsigned(15 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l125_c2_5c01_cond : unsigned(0 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l125_c2_5c01_iftrue : unsigned(1 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l125_c2_5c01_iffalse : unsigned(1 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l125_c2_5c01_return_output : unsigned(1 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l125_c2_5c01_cond : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l125_c2_5c01_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_top_uxn_c_l128_c3_03cd : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l125_c2_5c01_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l125_c2_5c01_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l125_c2_5c01_cond : unsigned(0 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l125_c2_5c01_iftrue : unsigned(15 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l125_c2_5c01_iffalse : unsigned(15 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l125_c2_5c01_return_output : unsigned(15 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l125_c2_5c01_cond : unsigned(0 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l125_c2_5c01_iftrue : unsigned(15 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l125_c2_5c01_iffalse : unsigned(15 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l125_c2_5c01_return_output : unsigned(15 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l125_c2_5c01_cond : unsigned(0 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l125_c2_5c01_iftrue : unsigned(31 downto 0);
 variable VAR_fill_pixels_remaining_uxn_c_l138_c3_61af : unsigned(31 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l125_c2_5c01_iffalse : unsigned(31 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l125_c2_5c01_return_output : unsigned(31 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l125_c2_5c01_cond : unsigned(0 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l125_c2_5c01_iftrue : unsigned(15 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l125_c2_5c01_iffalse : unsigned(15 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l125_c2_5c01_return_output : unsigned(15 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l125_c2_5c01_cond : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l125_c2_5c01_iftrue : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l125_c2_5c01_iffalse : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l125_c2_5c01_return_output : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l125_c2_5c01_cond : unsigned(0 downto 0);
 variable VAR_is_fill_left_MUX_uxn_c_l125_c2_5c01_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_left_uxn_c_l127_c3_3613 : unsigned(0 downto 0);
 variable VAR_is_fill_left_MUX_uxn_c_l125_c2_5c01_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_left_MUX_uxn_c_l125_c2_5c01_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_left_MUX_uxn_c_l125_c2_5c01_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_20_uxn_c_l127_c18_fab0_return_output : unsigned(31 downto 0);
 variable VAR_CONST_SR_20_uxn_c_l127_c18_fab0_x : unsigned(31 downto 0);
 variable VAR_CONST_SR_21_uxn_c_l128_c17_b0d4_return_output : unsigned(31 downto 0);
 variable VAR_CONST_SR_21_uxn_c_l128_c17_b0d4_x : unsigned(31 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l129_c27_0c3c_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l129_c27_0c3c_right : unsigned(17 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l129_c27_0c3c_return_output : unsigned(31 downto 0);
 variable VAR_fill_y0_uxn_c_l130_c3_cf89 : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_c_l130_c13_2faf_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_DIV_uxn_c_l130_c13_2faf_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_DIV_uxn_c_l130_c13_2faf_return_output : unsigned(31 downto 0);
 variable VAR_fill_x0_uxn_c_l131_c3_b0d5 : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l131_c13_2269_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l131_c38_28b9_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l131_c38_28b9_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l131_c38_28b9_return_output : unsigned(24 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l131_c13_2269_right : unsigned(24 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l131_c13_2269_return_output : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l132_c13_ad8b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l132_c13_ad8b_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l132_c13_ad8b_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l132_c13_ad8b_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l133_c13_485b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l133_c13_485b_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l133_c13_485b_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l133_c13_485b_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l134_c13_840d_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l134_c13_840d_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l134_c13_840d_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l134_c13_840d_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l135_c13_f84f_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l135_c13_f84f_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l135_c13_f84f_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l135_c13_f84f_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l141_c19_2890_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l141_c19_2890_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l141_c19_2890_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l141_c19_6a11_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l141_c19_6a11_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l141_c19_6a11_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l141_c19_2890_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l143_c17_e1fa_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l143_c17_e1fa_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l143_c17_e1fa_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_LT_uxn_c_l144_c17_26bd_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_c_l144_c17_26bd_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_c_l144_c17_26bd_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l145_c17_cd28_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l145_c17_cd28_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l145_c17_cd28_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_LT_uxn_c_l146_c17_5268_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_c_l146_c17_5268_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_c_l146_c17_5268_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l148_c18_b543_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l148_c18_b543_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l148_c18_b543_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l148_c18_3fd4_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l148_c18_3fd4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l148_c18_3fd4_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l148_c18_bc5d_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l148_c18_bc5d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l148_c18_bc5d_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l148_c18_5643_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l148_c18_5643_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l148_c18_5643_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l149_c19_6569_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l149_c37_5825_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l149_c37_5825_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l149_c19_6569_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l149_c19_6569_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l150_c19_5bbe_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l150_c19_5bbe_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l150_c19_5bbe_return_output : unsigned(0 downto 0);
 variable VAR_bg_vram_update_uxn_c_l152_c19_75ed_read_address : unsigned(31 downto 0);
 variable VAR_bg_vram_update_uxn_c_l152_c19_75ed_write_address : unsigned(31 downto 0);
 variable VAR_bg_vram_update_uxn_c_l152_c19_75ed_write_value : unsigned(1 downto 0);
 variable VAR_bg_vram_update_uxn_c_l152_c19_75ed_write_enable : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l154_c3_0dca_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l154_c3_0dca_iftrue : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l154_c3_0dca_iffalse : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l154_c37_1089_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l154_c37_1089_iftrue : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l154_c37_1089_iffalse : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l154_c37_1089_return_output : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l154_c3_0dca_return_output : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l155_c3_3195_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l155_c3_3195_iftrue : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l155_c3_3195_iffalse : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l155_c3_3195_return_output : unsigned(1 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l156_c3_89b7_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l156_c22_7890_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l156_c57_0aea_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l156_c57_0aea_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l156_c22_7890_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l156_c22_7890_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l156_c3_89b7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l156_c3_89b7_return_output : unsigned(0 downto 0);
 variable VAR_bg_vram_update_uxn_c_l152_c19_75ed_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_bg_vram_update_uxn_c_l152_c19_75ed_return_output : unsigned(1 downto 0);
 variable VAR_fg_vram_update_uxn_c_l159_c19_ce04_read_address : unsigned(31 downto 0);
 variable VAR_fg_vram_update_uxn_c_l159_c19_ce04_write_address : unsigned(31 downto 0);
 variable VAR_fg_vram_update_uxn_c_l159_c19_ce04_write_value : unsigned(1 downto 0);
 variable VAR_fg_vram_update_uxn_c_l159_c19_ce04_write_enable : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l161_c3_5a30_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l161_c3_5a30_iftrue : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l161_c3_5a30_iffalse : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l161_c37_151d_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l161_c37_151d_iftrue : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l161_c37_151d_iffalse : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l161_c37_151d_return_output : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l161_c3_5a30_return_output : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l162_c3_1c73_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l162_c3_1c73_iftrue : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l162_c3_1c73_iffalse : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l162_c3_1c73_return_output : unsigned(1 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l163_c3_d632_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l163_c22_7441_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l163_c22_7441_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l163_c22_7441_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l163_c3_d632_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l163_c3_d632_return_output : unsigned(0 downto 0);
 variable VAR_fg_vram_update_uxn_c_l159_c19_ce04_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_fg_vram_update_uxn_c_l159_c19_ce04_return_output : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l167_c6_5f1d_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l167_c6_5f1d_right : unsigned(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l167_c6_5f1d_return_output : unsigned(0 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l167_c2_233c_iftrue : unsigned(31 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l167_c2_233c_iffalse : unsigned(31 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l169_c9_5846_return_output : unsigned(31 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l167_c2_233c_return_output : unsigned(31 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l167_c2_233c_cond : unsigned(0 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l167_c2_233c_iftrue : unsigned(31 downto 0);
 variable VAR_pixel_counter_uxn_c_l168_c3_404a : unsigned(31 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l167_c2_233c_iffalse : unsigned(31 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l169_c9_5846_return_output : unsigned(31 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l167_c2_233c_return_output : unsigned(31 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l167_c2_233c_cond : unsigned(0 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l169_c9_5846_iftrue : unsigned(31 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l169_c9_5846_iffalse : unsigned(31 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l169_c9_5846_cond : unsigned(0 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l169_c9_5846_iftrue : unsigned(31 downto 0);
 variable VAR_pixel_counter_uxn_c_l170_c3_d321 : unsigned(31 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l169_c9_5846_iffalse : unsigned(31 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l169_c9_5846_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l170_c3_e918_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l170_c3_e918_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l170_c3_e918_return_output : unsigned(32 downto 0);
 variable VAR_MUX_uxn_c_l171_c27_8ce9_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l171_c27_8ce9_iftrue : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l171_c27_8ce9_iffalse : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l171_c27_63df_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l171_c27_63df_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l171_c27_63df_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l171_c60_b9e6_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l171_c60_b9e6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l171_c60_b9e6_return_output : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l171_c27_8ce9_return_output : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l174_c17_5acb_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l174_c17_5acb_iftrue : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l174_c17_5acb_iffalse : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l174_c17_8388_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l174_c17_8388_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l174_c17_8388_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l174_c17_5acb_return_output : unsigned(1 downto 0);
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_c_l156_l163_DUPLICATE_3726_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_c_l156_l163_DUPLICATE_3726_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l163_l156_DUPLICATE_1f57_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l163_l156_DUPLICATE_1f57_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l163_l156_DUPLICATE_1f57_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_6984_uxn_c_l177_l103_DUPLICATE_3b30_return_output : gpu_step_result_t;
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
     VAR_BIN_OP_GT_uxn_c_l118_c26_c9f7_right := to_unsigned(143999, 18);
     VAR_BIN_OP_MINUS_uxn_c_l171_c60_b9e6_right := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l135_c13_f84f_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_MUX_uxn_c_l161_c37_151d_iftrue := resize(to_unsigned(0, 1), 32);
     VAR_BIN_OP_EQ_uxn_c_l174_c17_8388_right := to_unsigned(0, 1);
     VAR_fill_pixels_remaining_uxn_c_l138_c3_61af := resize(to_unsigned(143999, 18), 32);
     VAR_fill_pixels_remaining_MUX_uxn_c_l125_c2_5c01_iftrue := VAR_fill_pixels_remaining_uxn_c_l138_c3_61af;
     VAR_BIN_OP_EQ_uxn_c_l120_c17_7739_right := to_unsigned(15, 4);
     VAR_BIN_OP_EQ_uxn_c_l167_c6_5f1d_right := to_unsigned(143999, 18);
     VAR_MUX_uxn_c_l141_c19_2890_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_DIV_uxn_c_l130_c13_2faf_right := to_unsigned(400, 9);
     VAR_pixel_counter_uxn_c_l168_c3_404a := resize(to_unsigned(0, 1), 32);
     VAR_pixel_counter_MUX_uxn_c_l167_c2_233c_iftrue := VAR_pixel_counter_uxn_c_l168_c3_404a;
     VAR_BIN_OP_EQ_uxn_c_l141_c19_6a11_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l171_c27_63df_right := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l132_c13_ad8b_iffalse := resize(to_unsigned(359, 9), 16);
     VAR_MUX_uxn_c_l141_c19_2890_iffalse := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l118_c26_b840_iftrue := resize(to_unsigned(0, 1), 32);
     VAR_BIN_OP_PLUS_uxn_c_l170_c3_e918_right := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l120_c17_8fd5_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l134_c13_840d_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_BIN_OP_AND_uxn_c_l129_c27_0c3c_right := to_unsigned(262143, 18);
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l131_c38_28b9_right := to_unsigned(400, 9);
     VAR_MUX_uxn_c_l120_c17_8fd5_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l171_c27_8ce9_iftrue := resize(to_unsigned(0, 1), 32);
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l122_c23_6456_right := to_unsigned(400, 9);
     VAR_BIN_OP_DIV_uxn_c_l121_c6_96ec_right := to_unsigned(400, 9);
     VAR_MUX_uxn_c_l133_c13_485b_iffalse := resize(to_unsigned(399, 9), 16);
     VAR_MUX_uxn_c_l154_c37_1089_iftrue := resize(to_unsigned(0, 1), 32);

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
     VAR_bg_vram_update_uxn_c_l152_c19_75ed_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_fg_vram_update_uxn_c_l159_c19_ce04_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_fill_color_MUX_uxn_c_l125_c2_5c01_iffalse := fill_color;
     VAR_fill_layer_MUX_uxn_c_l125_c2_5c01_iffalse := fill_layer;
     VAR_fill_pixels_remaining_MUX_uxn_c_l125_c2_5c01_iffalse := fill_pixels_remaining;
     VAR_fill_x0_MUX_uxn_c_l125_c2_5c01_iffalse := fill_x0;
     VAR_fill_x1_MUX_uxn_c_l125_c2_5c01_iffalse := fill_x1;
     VAR_fill_y0_MUX_uxn_c_l125_c2_5c01_iffalse := fill_y0;
     VAR_fill_y1_MUX_uxn_c_l125_c2_5c01_iffalse := fill_y1;
     VAR_fill_pixels_remaining_MUX_uxn_c_l169_c9_5846_cond := VAR_is_active_drawing_area;
     VAR_pixel_counter_MUX_uxn_c_l169_c9_5846_cond := VAR_is_active_drawing_area;
     VAR_UNARY_OP_NOT_uxn_c_l125_c22_505d_expr := is_fill_active;
     VAR_is_fill_left_MUX_uxn_c_l125_c2_5c01_iffalse := is_fill_left;
     VAR_is_fill_top_MUX_uxn_c_l125_c2_5c01_iffalse := is_fill_top;
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l163_l156_DUPLICATE_1f57_right := VAR_is_vram_write;
     VAR_BIN_OP_DIV_uxn_c_l121_c6_96ec_left := pixel_counter;
     VAR_BIN_OP_EQ_uxn_c_l167_c6_5f1d_left := pixel_counter;
     VAR_BIN_OP_MINUS_uxn_c_l122_c6_3c3e_left := pixel_counter;
     VAR_BIN_OP_PLUS_uxn_c_l170_c3_e918_left := pixel_counter;
     VAR_MUX_uxn_c_l154_c3_0dca_iftrue := pixel_counter;
     VAR_MUX_uxn_c_l161_c3_5a30_iftrue := pixel_counter;
     VAR_bg_vram_update_uxn_c_l152_c19_75ed_read_address := pixel_counter;
     VAR_fg_vram_update_uxn_c_l159_c19_ce04_read_address := pixel_counter;
     VAR_pixel_counter_MUX_uxn_c_l169_c9_5846_iffalse := pixel_counter;
     VAR_BIN_OP_AND_uxn_c_l129_c27_0c3c_left := VAR_vram_address;
     VAR_BIN_OP_GT_uxn_c_l118_c26_c9f7_left := VAR_vram_address;
     VAR_CONST_SR_20_uxn_c_l127_c18_fab0_x := VAR_vram_address;
     VAR_CONST_SR_21_uxn_c_l128_c17_b0d4_x := VAR_vram_address;
     VAR_CONST_SR_28_uxn_c_l119_c24_c152_x := VAR_vram_address;
     VAR_MUX_uxn_c_l118_c26_b840_iffalse := VAR_vram_address;
     VAR_MUX_uxn_c_l155_c3_3195_iffalse := VAR_vram_value;
     VAR_MUX_uxn_c_l162_c3_1c73_iffalse := VAR_vram_value;
     VAR_fill_color_MUX_uxn_c_l125_c2_5c01_iftrue := VAR_vram_value;
     VAR_BIN_OP_AND_uxn_c_l163_c22_7441_right := VAR_vram_write_layer;
     VAR_UNARY_OP_NOT_uxn_c_l156_c57_0aea_expr := VAR_vram_write_layer;
     VAR_fill_layer_MUX_uxn_c_l125_c2_5c01_iftrue := VAR_vram_write_layer;
     -- BIN_OP_AND[uxn_c_l129_c27_0c3c] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l129_c27_0c3c_left <= VAR_BIN_OP_AND_uxn_c_l129_c27_0c3c_left;
     BIN_OP_AND_uxn_c_l129_c27_0c3c_right <= VAR_BIN_OP_AND_uxn_c_l129_c27_0c3c_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l129_c27_0c3c_return_output := BIN_OP_AND_uxn_c_l129_c27_0c3c_return_output;

     -- CONST_SR_20[uxn_c_l127_c18_fab0] LATENCY=0
     -- Inputs
     CONST_SR_20_uxn_c_l127_c18_fab0_x <= VAR_CONST_SR_20_uxn_c_l127_c18_fab0_x;
     -- Outputs
     VAR_CONST_SR_20_uxn_c_l127_c18_fab0_return_output := CONST_SR_20_uxn_c_l127_c18_fab0_return_output;

     -- BIN_OP_EQ[uxn_c_l167_c6_5f1d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l167_c6_5f1d_left <= VAR_BIN_OP_EQ_uxn_c_l167_c6_5f1d_left;
     BIN_OP_EQ_uxn_c_l167_c6_5f1d_right <= VAR_BIN_OP_EQ_uxn_c_l167_c6_5f1d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l167_c6_5f1d_return_output := BIN_OP_EQ_uxn_c_l167_c6_5f1d_return_output;

     -- CONST_SR_21[uxn_c_l128_c17_b0d4] LATENCY=0
     -- Inputs
     CONST_SR_21_uxn_c_l128_c17_b0d4_x <= VAR_CONST_SR_21_uxn_c_l128_c17_b0d4_x;
     -- Outputs
     VAR_CONST_SR_21_uxn_c_l128_c17_b0d4_return_output := CONST_SR_21_uxn_c_l128_c17_b0d4_return_output;

     -- UNARY_OP_NOT[uxn_c_l125_c22_505d] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l125_c22_505d_expr <= VAR_UNARY_OP_NOT_uxn_c_l125_c22_505d_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l125_c22_505d_return_output := UNARY_OP_NOT_uxn_c_l125_c22_505d_return_output;

     -- BIN_OP_PLUS[uxn_c_l170_c3_e918] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l170_c3_e918_left <= VAR_BIN_OP_PLUS_uxn_c_l170_c3_e918_left;
     BIN_OP_PLUS_uxn_c_l170_c3_e918_right <= VAR_BIN_OP_PLUS_uxn_c_l170_c3_e918_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l170_c3_e918_return_output := BIN_OP_PLUS_uxn_c_l170_c3_e918_return_output;

     -- CONST_SR_28[uxn_c_l119_c24_c152] LATENCY=0
     -- Inputs
     CONST_SR_28_uxn_c_l119_c24_c152_x <= VAR_CONST_SR_28_uxn_c_l119_c24_c152_x;
     -- Outputs
     VAR_CONST_SR_28_uxn_c_l119_c24_c152_return_output := CONST_SR_28_uxn_c_l119_c24_c152_return_output;

     -- BIN_OP_GT[uxn_c_l118_c26_c9f7] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_c_l118_c26_c9f7_left <= VAR_BIN_OP_GT_uxn_c_l118_c26_c9f7_left;
     BIN_OP_GT_uxn_c_l118_c26_c9f7_right <= VAR_BIN_OP_GT_uxn_c_l118_c26_c9f7_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_c_l118_c26_c9f7_return_output := BIN_OP_GT_uxn_c_l118_c26_c9f7_return_output;

     -- BIN_OP_DIV[uxn_c_l121_c6_96ec] LATENCY=0
     -- Inputs
     BIN_OP_DIV_uxn_c_l121_c6_96ec_left <= VAR_BIN_OP_DIV_uxn_c_l121_c6_96ec_left;
     BIN_OP_DIV_uxn_c_l121_c6_96ec_right <= VAR_BIN_OP_DIV_uxn_c_l121_c6_96ec_right;
     -- Outputs
     VAR_BIN_OP_DIV_uxn_c_l121_c6_96ec_return_output := BIN_OP_DIV_uxn_c_l121_c6_96ec_return_output;

     -- UNARY_OP_NOT[uxn_c_l156_c57_0aea] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l156_c57_0aea_expr <= VAR_UNARY_OP_NOT_uxn_c_l156_c57_0aea_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l156_c57_0aea_return_output := UNARY_OP_NOT_uxn_c_l156_c57_0aea_return_output;

     -- Submodule level 1
     VAR_BIN_OP_DIV_uxn_c_l130_c13_2faf_left := VAR_BIN_OP_AND_uxn_c_l129_c27_0c3c_return_output;
     VAR_BIN_OP_MINUS_uxn_c_l131_c13_2269_left := VAR_BIN_OP_AND_uxn_c_l129_c27_0c3c_return_output;
     VAR_y_uxn_c_l121_c2_556e := resize(VAR_BIN_OP_DIV_uxn_c_l121_c6_96ec_return_output, 16);
     VAR_fill_pixels_remaining_MUX_uxn_c_l167_c2_233c_cond := VAR_BIN_OP_EQ_uxn_c_l167_c6_5f1d_return_output;
     VAR_pixel_counter_MUX_uxn_c_l167_c2_233c_cond := VAR_BIN_OP_EQ_uxn_c_l167_c6_5f1d_return_output;
     VAR_MUX_uxn_c_l118_c26_b840_cond := VAR_BIN_OP_GT_uxn_c_l118_c26_c9f7_return_output;
     VAR_pixel_counter_uxn_c_l170_c3_d321 := resize(VAR_BIN_OP_PLUS_uxn_c_l170_c3_e918_return_output, 32);
     VAR_is_fill_left_uxn_c_l127_c3_3613 := resize(VAR_CONST_SR_20_uxn_c_l127_c18_fab0_return_output, 1);
     VAR_is_fill_top_uxn_c_l128_c3_03cd := resize(VAR_CONST_SR_21_uxn_c_l128_c17_b0d4_return_output, 1);
     VAR_BIN_OP_AND_uxn_c_l125_c6_4a6f_right := VAR_UNARY_OP_NOT_uxn_c_l125_c22_505d_return_output;
     VAR_BIN_OP_AND_uxn_c_l156_c22_7890_right := VAR_UNARY_OP_NOT_uxn_c_l156_c57_0aea_return_output;
     VAR_MUX_uxn_c_l133_c13_485b_cond := VAR_is_fill_left_uxn_c_l127_c3_3613;
     VAR_MUX_uxn_c_l135_c13_f84f_cond := VAR_is_fill_left_uxn_c_l127_c3_3613;
     VAR_is_fill_left_MUX_uxn_c_l125_c2_5c01_iftrue := VAR_is_fill_left_uxn_c_l127_c3_3613;
     VAR_MUX_uxn_c_l132_c13_ad8b_cond := VAR_is_fill_top_uxn_c_l128_c3_03cd;
     VAR_MUX_uxn_c_l134_c13_840d_cond := VAR_is_fill_top_uxn_c_l128_c3_03cd;
     VAR_is_fill_top_MUX_uxn_c_l125_c2_5c01_iftrue := VAR_is_fill_top_uxn_c_l128_c3_03cd;
     VAR_pixel_counter_MUX_uxn_c_l169_c9_5846_iftrue := VAR_pixel_counter_uxn_c_l170_c3_d321;
     VAR_BIN_OP_GT_uxn_c_l145_c17_cd28_left := VAR_y_uxn_c_l121_c2_556e;
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l122_c23_6456_left := VAR_y_uxn_c_l121_c2_556e;
     VAR_BIN_OP_LT_uxn_c_l146_c17_5268_left := VAR_y_uxn_c_l121_c2_556e;
     REG_VAR_y := VAR_y_uxn_c_l121_c2_556e;
     -- MUX[uxn_c_l118_c26_b840] LATENCY=0
     -- Inputs
     MUX_uxn_c_l118_c26_b840_cond <= VAR_MUX_uxn_c_l118_c26_b840_cond;
     MUX_uxn_c_l118_c26_b840_iftrue <= VAR_MUX_uxn_c_l118_c26_b840_iftrue;
     MUX_uxn_c_l118_c26_b840_iffalse <= VAR_MUX_uxn_c_l118_c26_b840_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l118_c26_b840_return_output := MUX_uxn_c_l118_c26_b840_return_output;

     -- pixel_counter_MUX[uxn_c_l169_c9_5846] LATENCY=0
     -- Inputs
     pixel_counter_MUX_uxn_c_l169_c9_5846_cond <= VAR_pixel_counter_MUX_uxn_c_l169_c9_5846_cond;
     pixel_counter_MUX_uxn_c_l169_c9_5846_iftrue <= VAR_pixel_counter_MUX_uxn_c_l169_c9_5846_iftrue;
     pixel_counter_MUX_uxn_c_l169_c9_5846_iffalse <= VAR_pixel_counter_MUX_uxn_c_l169_c9_5846_iffalse;
     -- Outputs
     VAR_pixel_counter_MUX_uxn_c_l169_c9_5846_return_output := pixel_counter_MUX_uxn_c_l169_c9_5846_return_output;

     -- BIN_OP_DIV[uxn_c_l130_c13_2faf] LATENCY=0
     -- Inputs
     BIN_OP_DIV_uxn_c_l130_c13_2faf_left <= VAR_BIN_OP_DIV_uxn_c_l130_c13_2faf_left;
     BIN_OP_DIV_uxn_c_l130_c13_2faf_right <= VAR_BIN_OP_DIV_uxn_c_l130_c13_2faf_right;
     -- Outputs
     VAR_BIN_OP_DIV_uxn_c_l130_c13_2faf_return_output := BIN_OP_DIV_uxn_c_l130_c13_2faf_return_output;

     -- CAST_TO_uint4_t[uxn_c_l119_c14_eda4] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_c_l119_c14_eda4_return_output := CAST_TO_uint4_t_uint32_t(
     VAR_CONST_SR_28_uxn_c_l119_c24_c152_return_output);

     -- BIN_OP_INFERRED_MULT[uxn_c_l122_c23_6456] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_c_l122_c23_6456_left <= VAR_BIN_OP_INFERRED_MULT_uxn_c_l122_c23_6456_left;
     BIN_OP_INFERRED_MULT_uxn_c_l122_c23_6456_right <= VAR_BIN_OP_INFERRED_MULT_uxn_c_l122_c23_6456_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l122_c23_6456_return_output := BIN_OP_INFERRED_MULT_uxn_c_l122_c23_6456_return_output;

     -- Submodule level 2
     VAR_fill_y0_uxn_c_l130_c3_cf89 := resize(VAR_BIN_OP_DIV_uxn_c_l130_c13_2faf_return_output, 16);
     VAR_BIN_OP_MINUS_uxn_c_l122_c6_3c3e_right := VAR_BIN_OP_INFERRED_MULT_uxn_c_l122_c23_6456_return_output;
     VAR_BIN_OP_EQ_uxn_c_l120_c17_7739_left := VAR_CAST_TO_uint4_t_uxn_c_l119_c14_eda4_return_output;
     REG_VAR_vram_code := VAR_CAST_TO_uint4_t_uxn_c_l119_c14_eda4_return_output;
     VAR_MUX_uxn_c_l154_c37_1089_iffalse := VAR_MUX_uxn_c_l118_c26_b840_return_output;
     VAR_MUX_uxn_c_l161_c37_151d_iffalse := VAR_MUX_uxn_c_l118_c26_b840_return_output;
     REG_VAR_adjusted_vram_address := VAR_MUX_uxn_c_l118_c26_b840_return_output;
     VAR_pixel_counter_MUX_uxn_c_l167_c2_233c_iffalse := VAR_pixel_counter_MUX_uxn_c_l169_c9_5846_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l131_c38_28b9_left := VAR_fill_y0_uxn_c_l130_c3_cf89;
     VAR_MUX_uxn_c_l132_c13_ad8b_iftrue := VAR_fill_y0_uxn_c_l130_c3_cf89;
     VAR_MUX_uxn_c_l134_c13_840d_iffalse := VAR_fill_y0_uxn_c_l130_c3_cf89;
     -- pixel_counter_MUX[uxn_c_l167_c2_233c] LATENCY=0
     -- Inputs
     pixel_counter_MUX_uxn_c_l167_c2_233c_cond <= VAR_pixel_counter_MUX_uxn_c_l167_c2_233c_cond;
     pixel_counter_MUX_uxn_c_l167_c2_233c_iftrue <= VAR_pixel_counter_MUX_uxn_c_l167_c2_233c_iftrue;
     pixel_counter_MUX_uxn_c_l167_c2_233c_iffalse <= VAR_pixel_counter_MUX_uxn_c_l167_c2_233c_iffalse;
     -- Outputs
     VAR_pixel_counter_MUX_uxn_c_l167_c2_233c_return_output := pixel_counter_MUX_uxn_c_l167_c2_233c_return_output;

     -- BIN_OP_EQ[uxn_c_l120_c17_7739] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l120_c17_7739_left <= VAR_BIN_OP_EQ_uxn_c_l120_c17_7739_left;
     BIN_OP_EQ_uxn_c_l120_c17_7739_right <= VAR_BIN_OP_EQ_uxn_c_l120_c17_7739_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l120_c17_7739_return_output := BIN_OP_EQ_uxn_c_l120_c17_7739_return_output;

     -- MUX[uxn_c_l134_c13_840d] LATENCY=0
     -- Inputs
     MUX_uxn_c_l134_c13_840d_cond <= VAR_MUX_uxn_c_l134_c13_840d_cond;
     MUX_uxn_c_l134_c13_840d_iftrue <= VAR_MUX_uxn_c_l134_c13_840d_iftrue;
     MUX_uxn_c_l134_c13_840d_iffalse <= VAR_MUX_uxn_c_l134_c13_840d_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l134_c13_840d_return_output := MUX_uxn_c_l134_c13_840d_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_c_l131_c38_28b9] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_c_l131_c38_28b9_left <= VAR_BIN_OP_INFERRED_MULT_uxn_c_l131_c38_28b9_left;
     BIN_OP_INFERRED_MULT_uxn_c_l131_c38_28b9_right <= VAR_BIN_OP_INFERRED_MULT_uxn_c_l131_c38_28b9_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l131_c38_28b9_return_output := BIN_OP_INFERRED_MULT_uxn_c_l131_c38_28b9_return_output;

     -- BIN_OP_MINUS[uxn_c_l122_c6_3c3e] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l122_c6_3c3e_left <= VAR_BIN_OP_MINUS_uxn_c_l122_c6_3c3e_left;
     BIN_OP_MINUS_uxn_c_l122_c6_3c3e_right <= VAR_BIN_OP_MINUS_uxn_c_l122_c6_3c3e_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l122_c6_3c3e_return_output := BIN_OP_MINUS_uxn_c_l122_c6_3c3e_return_output;

     -- MUX[uxn_c_l132_c13_ad8b] LATENCY=0
     -- Inputs
     MUX_uxn_c_l132_c13_ad8b_cond <= VAR_MUX_uxn_c_l132_c13_ad8b_cond;
     MUX_uxn_c_l132_c13_ad8b_iftrue <= VAR_MUX_uxn_c_l132_c13_ad8b_iftrue;
     MUX_uxn_c_l132_c13_ad8b_iffalse <= VAR_MUX_uxn_c_l132_c13_ad8b_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l132_c13_ad8b_return_output := MUX_uxn_c_l132_c13_ad8b_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_c_l120_c17_8fd5_cond := VAR_BIN_OP_EQ_uxn_c_l120_c17_7739_return_output;
     VAR_BIN_OP_MINUS_uxn_c_l131_c13_2269_right := VAR_BIN_OP_INFERRED_MULT_uxn_c_l131_c38_28b9_return_output;
     VAR_x_uxn_c_l122_c2_5d48 := resize(VAR_BIN_OP_MINUS_uxn_c_l122_c6_3c3e_return_output, 16);
     VAR_fill_y1_MUX_uxn_c_l125_c2_5c01_iftrue := VAR_MUX_uxn_c_l132_c13_ad8b_return_output;
     VAR_fill_y0_MUX_uxn_c_l125_c2_5c01_iftrue := VAR_MUX_uxn_c_l134_c13_840d_return_output;
     REG_VAR_pixel_counter := VAR_pixel_counter_MUX_uxn_c_l167_c2_233c_return_output;
     VAR_BIN_OP_GT_uxn_c_l143_c17_e1fa_left := VAR_x_uxn_c_l122_c2_5d48;
     VAR_BIN_OP_LT_uxn_c_l144_c17_26bd_left := VAR_x_uxn_c_l122_c2_5d48;
     REG_VAR_x := VAR_x_uxn_c_l122_c2_5d48;
     -- BIN_OP_MINUS[uxn_c_l131_c13_2269] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l131_c13_2269_left <= VAR_BIN_OP_MINUS_uxn_c_l131_c13_2269_left;
     BIN_OP_MINUS_uxn_c_l131_c13_2269_right <= VAR_BIN_OP_MINUS_uxn_c_l131_c13_2269_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l131_c13_2269_return_output := BIN_OP_MINUS_uxn_c_l131_c13_2269_return_output;

     -- MUX[uxn_c_l120_c17_8fd5] LATENCY=0
     -- Inputs
     MUX_uxn_c_l120_c17_8fd5_cond <= VAR_MUX_uxn_c_l120_c17_8fd5_cond;
     MUX_uxn_c_l120_c17_8fd5_iftrue <= VAR_MUX_uxn_c_l120_c17_8fd5_iftrue;
     MUX_uxn_c_l120_c17_8fd5_iffalse <= VAR_MUX_uxn_c_l120_c17_8fd5_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l120_c17_8fd5_return_output := MUX_uxn_c_l120_c17_8fd5_return_output;

     -- Submodule level 4
     VAR_fill_x0_uxn_c_l131_c3_b0d5 := resize(VAR_BIN_OP_MINUS_uxn_c_l131_c13_2269_return_output, 16);
     VAR_BIN_OP_AND_uxn_c_l125_c6_4a6f_left := VAR_MUX_uxn_c_l120_c17_8fd5_return_output;
     REG_VAR_is_fill_code := VAR_MUX_uxn_c_l120_c17_8fd5_return_output;
     VAR_MUX_uxn_c_l133_c13_485b_iftrue := VAR_fill_x0_uxn_c_l131_c3_b0d5;
     VAR_MUX_uxn_c_l135_c13_f84f_iffalse := VAR_fill_x0_uxn_c_l131_c3_b0d5;
     -- MUX[uxn_c_l133_c13_485b] LATENCY=0
     -- Inputs
     MUX_uxn_c_l133_c13_485b_cond <= VAR_MUX_uxn_c_l133_c13_485b_cond;
     MUX_uxn_c_l133_c13_485b_iftrue <= VAR_MUX_uxn_c_l133_c13_485b_iftrue;
     MUX_uxn_c_l133_c13_485b_iffalse <= VAR_MUX_uxn_c_l133_c13_485b_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l133_c13_485b_return_output := MUX_uxn_c_l133_c13_485b_return_output;

     -- MUX[uxn_c_l135_c13_f84f] LATENCY=0
     -- Inputs
     MUX_uxn_c_l135_c13_f84f_cond <= VAR_MUX_uxn_c_l135_c13_f84f_cond;
     MUX_uxn_c_l135_c13_f84f_iftrue <= VAR_MUX_uxn_c_l135_c13_f84f_iftrue;
     MUX_uxn_c_l135_c13_f84f_iffalse <= VAR_MUX_uxn_c_l135_c13_f84f_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l135_c13_f84f_return_output := MUX_uxn_c_l135_c13_f84f_return_output;

     -- BIN_OP_AND[uxn_c_l125_c6_4a6f] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l125_c6_4a6f_left <= VAR_BIN_OP_AND_uxn_c_l125_c6_4a6f_left;
     BIN_OP_AND_uxn_c_l125_c6_4a6f_right <= VAR_BIN_OP_AND_uxn_c_l125_c6_4a6f_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l125_c6_4a6f_return_output := BIN_OP_AND_uxn_c_l125_c6_4a6f_return_output;

     -- Submodule level 5
     VAR_fill_color_MUX_uxn_c_l125_c2_5c01_cond := VAR_BIN_OP_AND_uxn_c_l125_c6_4a6f_return_output;
     VAR_fill_layer_MUX_uxn_c_l125_c2_5c01_cond := VAR_BIN_OP_AND_uxn_c_l125_c6_4a6f_return_output;
     VAR_fill_pixels_remaining_MUX_uxn_c_l125_c2_5c01_cond := VAR_BIN_OP_AND_uxn_c_l125_c6_4a6f_return_output;
     VAR_fill_x0_MUX_uxn_c_l125_c2_5c01_cond := VAR_BIN_OP_AND_uxn_c_l125_c6_4a6f_return_output;
     VAR_fill_x1_MUX_uxn_c_l125_c2_5c01_cond := VAR_BIN_OP_AND_uxn_c_l125_c6_4a6f_return_output;
     VAR_fill_y0_MUX_uxn_c_l125_c2_5c01_cond := VAR_BIN_OP_AND_uxn_c_l125_c6_4a6f_return_output;
     VAR_fill_y1_MUX_uxn_c_l125_c2_5c01_cond := VAR_BIN_OP_AND_uxn_c_l125_c6_4a6f_return_output;
     VAR_is_fill_left_MUX_uxn_c_l125_c2_5c01_cond := VAR_BIN_OP_AND_uxn_c_l125_c6_4a6f_return_output;
     VAR_is_fill_top_MUX_uxn_c_l125_c2_5c01_cond := VAR_BIN_OP_AND_uxn_c_l125_c6_4a6f_return_output;
     VAR_fill_x1_MUX_uxn_c_l125_c2_5c01_iftrue := VAR_MUX_uxn_c_l133_c13_485b_return_output;
     VAR_fill_x0_MUX_uxn_c_l125_c2_5c01_iftrue := VAR_MUX_uxn_c_l135_c13_f84f_return_output;
     -- fill_layer_MUX[uxn_c_l125_c2_5c01] LATENCY=0
     -- Inputs
     fill_layer_MUX_uxn_c_l125_c2_5c01_cond <= VAR_fill_layer_MUX_uxn_c_l125_c2_5c01_cond;
     fill_layer_MUX_uxn_c_l125_c2_5c01_iftrue <= VAR_fill_layer_MUX_uxn_c_l125_c2_5c01_iftrue;
     fill_layer_MUX_uxn_c_l125_c2_5c01_iffalse <= VAR_fill_layer_MUX_uxn_c_l125_c2_5c01_iffalse;
     -- Outputs
     VAR_fill_layer_MUX_uxn_c_l125_c2_5c01_return_output := fill_layer_MUX_uxn_c_l125_c2_5c01_return_output;

     -- is_fill_top_MUX[uxn_c_l125_c2_5c01] LATENCY=0
     -- Inputs
     is_fill_top_MUX_uxn_c_l125_c2_5c01_cond <= VAR_is_fill_top_MUX_uxn_c_l125_c2_5c01_cond;
     is_fill_top_MUX_uxn_c_l125_c2_5c01_iftrue <= VAR_is_fill_top_MUX_uxn_c_l125_c2_5c01_iftrue;
     is_fill_top_MUX_uxn_c_l125_c2_5c01_iffalse <= VAR_is_fill_top_MUX_uxn_c_l125_c2_5c01_iffalse;
     -- Outputs
     VAR_is_fill_top_MUX_uxn_c_l125_c2_5c01_return_output := is_fill_top_MUX_uxn_c_l125_c2_5c01_return_output;

     -- fill_x1_MUX[uxn_c_l125_c2_5c01] LATENCY=0
     -- Inputs
     fill_x1_MUX_uxn_c_l125_c2_5c01_cond <= VAR_fill_x1_MUX_uxn_c_l125_c2_5c01_cond;
     fill_x1_MUX_uxn_c_l125_c2_5c01_iftrue <= VAR_fill_x1_MUX_uxn_c_l125_c2_5c01_iftrue;
     fill_x1_MUX_uxn_c_l125_c2_5c01_iffalse <= VAR_fill_x1_MUX_uxn_c_l125_c2_5c01_iffalse;
     -- Outputs
     VAR_fill_x1_MUX_uxn_c_l125_c2_5c01_return_output := fill_x1_MUX_uxn_c_l125_c2_5c01_return_output;

     -- fill_x0_MUX[uxn_c_l125_c2_5c01] LATENCY=0
     -- Inputs
     fill_x0_MUX_uxn_c_l125_c2_5c01_cond <= VAR_fill_x0_MUX_uxn_c_l125_c2_5c01_cond;
     fill_x0_MUX_uxn_c_l125_c2_5c01_iftrue <= VAR_fill_x0_MUX_uxn_c_l125_c2_5c01_iftrue;
     fill_x0_MUX_uxn_c_l125_c2_5c01_iffalse <= VAR_fill_x0_MUX_uxn_c_l125_c2_5c01_iffalse;
     -- Outputs
     VAR_fill_x0_MUX_uxn_c_l125_c2_5c01_return_output := fill_x0_MUX_uxn_c_l125_c2_5c01_return_output;

     -- fill_y1_MUX[uxn_c_l125_c2_5c01] LATENCY=0
     -- Inputs
     fill_y1_MUX_uxn_c_l125_c2_5c01_cond <= VAR_fill_y1_MUX_uxn_c_l125_c2_5c01_cond;
     fill_y1_MUX_uxn_c_l125_c2_5c01_iftrue <= VAR_fill_y1_MUX_uxn_c_l125_c2_5c01_iftrue;
     fill_y1_MUX_uxn_c_l125_c2_5c01_iffalse <= VAR_fill_y1_MUX_uxn_c_l125_c2_5c01_iffalse;
     -- Outputs
     VAR_fill_y1_MUX_uxn_c_l125_c2_5c01_return_output := fill_y1_MUX_uxn_c_l125_c2_5c01_return_output;

     -- fill_color_MUX[uxn_c_l125_c2_5c01] LATENCY=0
     -- Inputs
     fill_color_MUX_uxn_c_l125_c2_5c01_cond <= VAR_fill_color_MUX_uxn_c_l125_c2_5c01_cond;
     fill_color_MUX_uxn_c_l125_c2_5c01_iftrue <= VAR_fill_color_MUX_uxn_c_l125_c2_5c01_iftrue;
     fill_color_MUX_uxn_c_l125_c2_5c01_iffalse <= VAR_fill_color_MUX_uxn_c_l125_c2_5c01_iffalse;
     -- Outputs
     VAR_fill_color_MUX_uxn_c_l125_c2_5c01_return_output := fill_color_MUX_uxn_c_l125_c2_5c01_return_output;

     -- is_fill_left_MUX[uxn_c_l125_c2_5c01] LATENCY=0
     -- Inputs
     is_fill_left_MUX_uxn_c_l125_c2_5c01_cond <= VAR_is_fill_left_MUX_uxn_c_l125_c2_5c01_cond;
     is_fill_left_MUX_uxn_c_l125_c2_5c01_iftrue <= VAR_is_fill_left_MUX_uxn_c_l125_c2_5c01_iftrue;
     is_fill_left_MUX_uxn_c_l125_c2_5c01_iffalse <= VAR_is_fill_left_MUX_uxn_c_l125_c2_5c01_iffalse;
     -- Outputs
     VAR_is_fill_left_MUX_uxn_c_l125_c2_5c01_return_output := is_fill_left_MUX_uxn_c_l125_c2_5c01_return_output;

     -- fill_pixels_remaining_MUX[uxn_c_l125_c2_5c01] LATENCY=0
     -- Inputs
     fill_pixels_remaining_MUX_uxn_c_l125_c2_5c01_cond <= VAR_fill_pixels_remaining_MUX_uxn_c_l125_c2_5c01_cond;
     fill_pixels_remaining_MUX_uxn_c_l125_c2_5c01_iftrue <= VAR_fill_pixels_remaining_MUX_uxn_c_l125_c2_5c01_iftrue;
     fill_pixels_remaining_MUX_uxn_c_l125_c2_5c01_iffalse <= VAR_fill_pixels_remaining_MUX_uxn_c_l125_c2_5c01_iffalse;
     -- Outputs
     VAR_fill_pixels_remaining_MUX_uxn_c_l125_c2_5c01_return_output := fill_pixels_remaining_MUX_uxn_c_l125_c2_5c01_return_output;

     -- fill_y0_MUX[uxn_c_l125_c2_5c01] LATENCY=0
     -- Inputs
     fill_y0_MUX_uxn_c_l125_c2_5c01_cond <= VAR_fill_y0_MUX_uxn_c_l125_c2_5c01_cond;
     fill_y0_MUX_uxn_c_l125_c2_5c01_iftrue <= VAR_fill_y0_MUX_uxn_c_l125_c2_5c01_iftrue;
     fill_y0_MUX_uxn_c_l125_c2_5c01_iffalse <= VAR_fill_y0_MUX_uxn_c_l125_c2_5c01_iffalse;
     -- Outputs
     VAR_fill_y0_MUX_uxn_c_l125_c2_5c01_return_output := fill_y0_MUX_uxn_c_l125_c2_5c01_return_output;

     -- Submodule level 6
     VAR_MUX_uxn_c_l155_c3_3195_iftrue := VAR_fill_color_MUX_uxn_c_l125_c2_5c01_return_output;
     VAR_MUX_uxn_c_l162_c3_1c73_iftrue := VAR_fill_color_MUX_uxn_c_l125_c2_5c01_return_output;
     REG_VAR_fill_color := VAR_fill_color_MUX_uxn_c_l125_c2_5c01_return_output;
     VAR_BIN_OP_AND_uxn_c_l150_c19_5bbe_right := VAR_fill_layer_MUX_uxn_c_l125_c2_5c01_return_output;
     VAR_UNARY_OP_NOT_uxn_c_l149_c37_5825_expr := VAR_fill_layer_MUX_uxn_c_l125_c2_5c01_return_output;
     REG_VAR_fill_layer := VAR_fill_layer_MUX_uxn_c_l125_c2_5c01_return_output;
     VAR_BIN_OP_EQ_uxn_c_l141_c19_6a11_left := VAR_fill_pixels_remaining_MUX_uxn_c_l125_c2_5c01_return_output;
     VAR_BIN_OP_EQ_uxn_c_l171_c27_63df_left := VAR_fill_pixels_remaining_MUX_uxn_c_l125_c2_5c01_return_output;
     VAR_BIN_OP_MINUS_uxn_c_l171_c60_b9e6_left := VAR_fill_pixels_remaining_MUX_uxn_c_l125_c2_5c01_return_output;
     VAR_fill_pixels_remaining_MUX_uxn_c_l167_c2_233c_iftrue := VAR_fill_pixels_remaining_MUX_uxn_c_l125_c2_5c01_return_output;
     VAR_fill_pixels_remaining_MUX_uxn_c_l169_c9_5846_iffalse := VAR_fill_pixels_remaining_MUX_uxn_c_l125_c2_5c01_return_output;
     VAR_BIN_OP_GT_uxn_c_l143_c17_e1fa_right := VAR_fill_x0_MUX_uxn_c_l125_c2_5c01_return_output;
     REG_VAR_fill_x0 := VAR_fill_x0_MUX_uxn_c_l125_c2_5c01_return_output;
     VAR_BIN_OP_LT_uxn_c_l144_c17_26bd_right := VAR_fill_x1_MUX_uxn_c_l125_c2_5c01_return_output;
     REG_VAR_fill_x1 := VAR_fill_x1_MUX_uxn_c_l125_c2_5c01_return_output;
     VAR_BIN_OP_GT_uxn_c_l145_c17_cd28_right := VAR_fill_y0_MUX_uxn_c_l125_c2_5c01_return_output;
     REG_VAR_fill_y0 := VAR_fill_y0_MUX_uxn_c_l125_c2_5c01_return_output;
     VAR_BIN_OP_LT_uxn_c_l146_c17_5268_right := VAR_fill_y1_MUX_uxn_c_l125_c2_5c01_return_output;
     REG_VAR_fill_y1 := VAR_fill_y1_MUX_uxn_c_l125_c2_5c01_return_output;
     REG_VAR_is_fill_left := VAR_is_fill_left_MUX_uxn_c_l125_c2_5c01_return_output;
     REG_VAR_is_fill_top := VAR_is_fill_top_MUX_uxn_c_l125_c2_5c01_return_output;
     -- BIN_OP_LT[uxn_c_l146_c17_5268] LATENCY=0
     -- Inputs
     BIN_OP_LT_uxn_c_l146_c17_5268_left <= VAR_BIN_OP_LT_uxn_c_l146_c17_5268_left;
     BIN_OP_LT_uxn_c_l146_c17_5268_right <= VAR_BIN_OP_LT_uxn_c_l146_c17_5268_right;
     -- Outputs
     VAR_BIN_OP_LT_uxn_c_l146_c17_5268_return_output := BIN_OP_LT_uxn_c_l146_c17_5268_return_output;

     -- UNARY_OP_NOT[uxn_c_l149_c37_5825] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l149_c37_5825_expr <= VAR_UNARY_OP_NOT_uxn_c_l149_c37_5825_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l149_c37_5825_return_output := UNARY_OP_NOT_uxn_c_l149_c37_5825_return_output;

     -- BIN_OP_LT[uxn_c_l144_c17_26bd] LATENCY=0
     -- Inputs
     BIN_OP_LT_uxn_c_l144_c17_26bd_left <= VAR_BIN_OP_LT_uxn_c_l144_c17_26bd_left;
     BIN_OP_LT_uxn_c_l144_c17_26bd_right <= VAR_BIN_OP_LT_uxn_c_l144_c17_26bd_right;
     -- Outputs
     VAR_BIN_OP_LT_uxn_c_l144_c17_26bd_return_output := BIN_OP_LT_uxn_c_l144_c17_26bd_return_output;

     -- BIN_OP_MINUS[uxn_c_l171_c60_b9e6] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l171_c60_b9e6_left <= VAR_BIN_OP_MINUS_uxn_c_l171_c60_b9e6_left;
     BIN_OP_MINUS_uxn_c_l171_c60_b9e6_right <= VAR_BIN_OP_MINUS_uxn_c_l171_c60_b9e6_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l171_c60_b9e6_return_output := BIN_OP_MINUS_uxn_c_l171_c60_b9e6_return_output;

     -- BIN_OP_EQ[uxn_c_l171_c27_63df] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l171_c27_63df_left <= VAR_BIN_OP_EQ_uxn_c_l171_c27_63df_left;
     BIN_OP_EQ_uxn_c_l171_c27_63df_right <= VAR_BIN_OP_EQ_uxn_c_l171_c27_63df_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l171_c27_63df_return_output := BIN_OP_EQ_uxn_c_l171_c27_63df_return_output;

     -- BIN_OP_EQ[uxn_c_l141_c19_6a11] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l141_c19_6a11_left <= VAR_BIN_OP_EQ_uxn_c_l141_c19_6a11_left;
     BIN_OP_EQ_uxn_c_l141_c19_6a11_right <= VAR_BIN_OP_EQ_uxn_c_l141_c19_6a11_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l141_c19_6a11_return_output := BIN_OP_EQ_uxn_c_l141_c19_6a11_return_output;

     -- BIN_OP_GT[uxn_c_l145_c17_cd28] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_c_l145_c17_cd28_left <= VAR_BIN_OP_GT_uxn_c_l145_c17_cd28_left;
     BIN_OP_GT_uxn_c_l145_c17_cd28_right <= VAR_BIN_OP_GT_uxn_c_l145_c17_cd28_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_c_l145_c17_cd28_return_output := BIN_OP_GT_uxn_c_l145_c17_cd28_return_output;

     -- BIN_OP_GT[uxn_c_l143_c17_e1fa] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_c_l143_c17_e1fa_left <= VAR_BIN_OP_GT_uxn_c_l143_c17_e1fa_left;
     BIN_OP_GT_uxn_c_l143_c17_e1fa_right <= VAR_BIN_OP_GT_uxn_c_l143_c17_e1fa_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_c_l143_c17_e1fa_return_output := BIN_OP_GT_uxn_c_l143_c17_e1fa_return_output;

     -- Submodule level 7
     VAR_MUX_uxn_c_l141_c19_2890_cond := VAR_BIN_OP_EQ_uxn_c_l141_c19_6a11_return_output;
     VAR_MUX_uxn_c_l171_c27_8ce9_cond := VAR_BIN_OP_EQ_uxn_c_l171_c27_63df_return_output;
     VAR_BIN_OP_AND_uxn_c_l148_c18_b543_right := VAR_BIN_OP_GT_uxn_c_l143_c17_e1fa_return_output;
     REG_VAR_fill_isect_l := VAR_BIN_OP_GT_uxn_c_l143_c17_e1fa_return_output;
     VAR_BIN_OP_AND_uxn_c_l148_c18_bc5d_right := VAR_BIN_OP_GT_uxn_c_l145_c17_cd28_return_output;
     REG_VAR_fill_isect_t := VAR_BIN_OP_GT_uxn_c_l145_c17_cd28_return_output;
     VAR_BIN_OP_AND_uxn_c_l148_c18_3fd4_right := VAR_BIN_OP_LT_uxn_c_l144_c17_26bd_return_output;
     REG_VAR_fill_isect_r := VAR_BIN_OP_LT_uxn_c_l144_c17_26bd_return_output;
     VAR_BIN_OP_AND_uxn_c_l148_c18_5643_right := VAR_BIN_OP_LT_uxn_c_l146_c17_5268_return_output;
     REG_VAR_fill_isect_b := VAR_BIN_OP_LT_uxn_c_l146_c17_5268_return_output;
     VAR_MUX_uxn_c_l171_c27_8ce9_iffalse := VAR_BIN_OP_MINUS_uxn_c_l171_c60_b9e6_return_output;
     VAR_BIN_OP_AND_uxn_c_l149_c19_6569_right := VAR_UNARY_OP_NOT_uxn_c_l149_c37_5825_return_output;
     -- MUX[uxn_c_l171_c27_8ce9] LATENCY=0
     -- Inputs
     MUX_uxn_c_l171_c27_8ce9_cond <= VAR_MUX_uxn_c_l171_c27_8ce9_cond;
     MUX_uxn_c_l171_c27_8ce9_iftrue <= VAR_MUX_uxn_c_l171_c27_8ce9_iftrue;
     MUX_uxn_c_l171_c27_8ce9_iffalse <= VAR_MUX_uxn_c_l171_c27_8ce9_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l171_c27_8ce9_return_output := MUX_uxn_c_l171_c27_8ce9_return_output;

     -- MUX[uxn_c_l141_c19_2890] LATENCY=0
     -- Inputs
     MUX_uxn_c_l141_c19_2890_cond <= VAR_MUX_uxn_c_l141_c19_2890_cond;
     MUX_uxn_c_l141_c19_2890_iftrue <= VAR_MUX_uxn_c_l141_c19_2890_iftrue;
     MUX_uxn_c_l141_c19_2890_iffalse <= VAR_MUX_uxn_c_l141_c19_2890_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l141_c19_2890_return_output := MUX_uxn_c_l141_c19_2890_return_output;

     -- Submodule level 8
     VAR_BIN_OP_AND_uxn_c_l148_c18_b543_left := VAR_MUX_uxn_c_l141_c19_2890_return_output;
     VAR_MUX_uxn_c_l154_c37_1089_cond := VAR_MUX_uxn_c_l141_c19_2890_return_output;
     VAR_MUX_uxn_c_l161_c37_151d_cond := VAR_MUX_uxn_c_l141_c19_2890_return_output;
     VAR_UNARY_OP_NOT_uint1_t_uxn_c_l156_l163_DUPLICATE_3726_expr := VAR_MUX_uxn_c_l141_c19_2890_return_output;
     REG_VAR_is_fill_active := VAR_MUX_uxn_c_l141_c19_2890_return_output;
     VAR_fill_pixels_remaining_MUX_uxn_c_l169_c9_5846_iftrue := VAR_MUX_uxn_c_l171_c27_8ce9_return_output;
     -- MUX[uxn_c_l161_c37_151d] LATENCY=0
     -- Inputs
     MUX_uxn_c_l161_c37_151d_cond <= VAR_MUX_uxn_c_l161_c37_151d_cond;
     MUX_uxn_c_l161_c37_151d_iftrue <= VAR_MUX_uxn_c_l161_c37_151d_iftrue;
     MUX_uxn_c_l161_c37_151d_iffalse <= VAR_MUX_uxn_c_l161_c37_151d_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l161_c37_151d_return_output := MUX_uxn_c_l161_c37_151d_return_output;

     -- fill_pixels_remaining_MUX[uxn_c_l169_c9_5846] LATENCY=0
     -- Inputs
     fill_pixels_remaining_MUX_uxn_c_l169_c9_5846_cond <= VAR_fill_pixels_remaining_MUX_uxn_c_l169_c9_5846_cond;
     fill_pixels_remaining_MUX_uxn_c_l169_c9_5846_iftrue <= VAR_fill_pixels_remaining_MUX_uxn_c_l169_c9_5846_iftrue;
     fill_pixels_remaining_MUX_uxn_c_l169_c9_5846_iffalse <= VAR_fill_pixels_remaining_MUX_uxn_c_l169_c9_5846_iffalse;
     -- Outputs
     VAR_fill_pixels_remaining_MUX_uxn_c_l169_c9_5846_return_output := fill_pixels_remaining_MUX_uxn_c_l169_c9_5846_return_output;

     -- MUX[uxn_c_l154_c37_1089] LATENCY=0
     -- Inputs
     MUX_uxn_c_l154_c37_1089_cond <= VAR_MUX_uxn_c_l154_c37_1089_cond;
     MUX_uxn_c_l154_c37_1089_iftrue <= VAR_MUX_uxn_c_l154_c37_1089_iftrue;
     MUX_uxn_c_l154_c37_1089_iffalse <= VAR_MUX_uxn_c_l154_c37_1089_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l154_c37_1089_return_output := MUX_uxn_c_l154_c37_1089_return_output;

     -- BIN_OP_AND[uxn_c_l148_c18_b543] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l148_c18_b543_left <= VAR_BIN_OP_AND_uxn_c_l148_c18_b543_left;
     BIN_OP_AND_uxn_c_l148_c18_b543_right <= VAR_BIN_OP_AND_uxn_c_l148_c18_b543_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l148_c18_b543_return_output := BIN_OP_AND_uxn_c_l148_c18_b543_return_output;

     -- UNARY_OP_NOT_uint1_t_uxn_c_l156_l163_DUPLICATE_3726 LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uint1_t_uxn_c_l156_l163_DUPLICATE_3726_expr <= VAR_UNARY_OP_NOT_uint1_t_uxn_c_l156_l163_DUPLICATE_3726_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uint1_t_uxn_c_l156_l163_DUPLICATE_3726_return_output := UNARY_OP_NOT_uint1_t_uxn_c_l156_l163_DUPLICATE_3726_return_output;

     -- Submodule level 9
     VAR_BIN_OP_AND_uxn_c_l148_c18_3fd4_left := VAR_BIN_OP_AND_uxn_c_l148_c18_b543_return_output;
     VAR_MUX_uxn_c_l154_c3_0dca_iffalse := VAR_MUX_uxn_c_l154_c37_1089_return_output;
     VAR_MUX_uxn_c_l161_c3_5a30_iffalse := VAR_MUX_uxn_c_l161_c37_151d_return_output;
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l163_l156_DUPLICATE_1f57_left := VAR_UNARY_OP_NOT_uint1_t_uxn_c_l156_l163_DUPLICATE_3726_return_output;
     VAR_fill_pixels_remaining_MUX_uxn_c_l167_c2_233c_iffalse := VAR_fill_pixels_remaining_MUX_uxn_c_l169_c9_5846_return_output;
     -- BIN_OP_AND[uxn_c_l148_c18_3fd4] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l148_c18_3fd4_left <= VAR_BIN_OP_AND_uxn_c_l148_c18_3fd4_left;
     BIN_OP_AND_uxn_c_l148_c18_3fd4_right <= VAR_BIN_OP_AND_uxn_c_l148_c18_3fd4_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l148_c18_3fd4_return_output := BIN_OP_AND_uxn_c_l148_c18_3fd4_return_output;

     -- BIN_OP_AND_uint1_t_uint1_t_uxn_c_l163_l156_DUPLICATE_1f57 LATENCY=0
     -- Inputs
     BIN_OP_AND_uint1_t_uint1_t_uxn_c_l163_l156_DUPLICATE_1f57_left <= VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l163_l156_DUPLICATE_1f57_left;
     BIN_OP_AND_uint1_t_uint1_t_uxn_c_l163_l156_DUPLICATE_1f57_right <= VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l163_l156_DUPLICATE_1f57_right;
     -- Outputs
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l163_l156_DUPLICATE_1f57_return_output := BIN_OP_AND_uint1_t_uint1_t_uxn_c_l163_l156_DUPLICATE_1f57_return_output;

     -- fill_pixels_remaining_MUX[uxn_c_l167_c2_233c] LATENCY=0
     -- Inputs
     fill_pixels_remaining_MUX_uxn_c_l167_c2_233c_cond <= VAR_fill_pixels_remaining_MUX_uxn_c_l167_c2_233c_cond;
     fill_pixels_remaining_MUX_uxn_c_l167_c2_233c_iftrue <= VAR_fill_pixels_remaining_MUX_uxn_c_l167_c2_233c_iftrue;
     fill_pixels_remaining_MUX_uxn_c_l167_c2_233c_iffalse <= VAR_fill_pixels_remaining_MUX_uxn_c_l167_c2_233c_iffalse;
     -- Outputs
     VAR_fill_pixels_remaining_MUX_uxn_c_l167_c2_233c_return_output := fill_pixels_remaining_MUX_uxn_c_l167_c2_233c_return_output;

     -- Submodule level 10
     VAR_BIN_OP_AND_uxn_c_l148_c18_bc5d_left := VAR_BIN_OP_AND_uxn_c_l148_c18_3fd4_return_output;
     VAR_BIN_OP_AND_uxn_c_l156_c22_7890_left := VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l163_l156_DUPLICATE_1f57_return_output;
     VAR_BIN_OP_AND_uxn_c_l163_c22_7441_left := VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l163_l156_DUPLICATE_1f57_return_output;
     REG_VAR_fill_pixels_remaining := VAR_fill_pixels_remaining_MUX_uxn_c_l167_c2_233c_return_output;
     -- BIN_OP_AND[uxn_c_l148_c18_bc5d] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l148_c18_bc5d_left <= VAR_BIN_OP_AND_uxn_c_l148_c18_bc5d_left;
     BIN_OP_AND_uxn_c_l148_c18_bc5d_right <= VAR_BIN_OP_AND_uxn_c_l148_c18_bc5d_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l148_c18_bc5d_return_output := BIN_OP_AND_uxn_c_l148_c18_bc5d_return_output;

     -- BIN_OP_AND[uxn_c_l156_c22_7890] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l156_c22_7890_left <= VAR_BIN_OP_AND_uxn_c_l156_c22_7890_left;
     BIN_OP_AND_uxn_c_l156_c22_7890_right <= VAR_BIN_OP_AND_uxn_c_l156_c22_7890_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l156_c22_7890_return_output := BIN_OP_AND_uxn_c_l156_c22_7890_return_output;

     -- BIN_OP_AND[uxn_c_l163_c22_7441] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l163_c22_7441_left <= VAR_BIN_OP_AND_uxn_c_l163_c22_7441_left;
     BIN_OP_AND_uxn_c_l163_c22_7441_right <= VAR_BIN_OP_AND_uxn_c_l163_c22_7441_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l163_c22_7441_return_output := BIN_OP_AND_uxn_c_l163_c22_7441_return_output;

     -- Submodule level 11
     VAR_BIN_OP_AND_uxn_c_l148_c18_5643_left := VAR_BIN_OP_AND_uxn_c_l148_c18_bc5d_return_output;
     VAR_BIN_OP_OR_uxn_c_l156_c3_89b7_right := VAR_BIN_OP_AND_uxn_c_l156_c22_7890_return_output;
     VAR_BIN_OP_OR_uxn_c_l163_c3_d632_right := VAR_BIN_OP_AND_uxn_c_l163_c22_7441_return_output;
     -- BIN_OP_AND[uxn_c_l148_c18_5643] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l148_c18_5643_left <= VAR_BIN_OP_AND_uxn_c_l148_c18_5643_left;
     BIN_OP_AND_uxn_c_l148_c18_5643_right <= VAR_BIN_OP_AND_uxn_c_l148_c18_5643_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l148_c18_5643_return_output := BIN_OP_AND_uxn_c_l148_c18_5643_return_output;

     -- Submodule level 12
     VAR_BIN_OP_AND_uxn_c_l149_c19_6569_left := VAR_BIN_OP_AND_uxn_c_l148_c18_5643_return_output;
     VAR_BIN_OP_AND_uxn_c_l150_c19_5bbe_left := VAR_BIN_OP_AND_uxn_c_l148_c18_5643_return_output;
     REG_VAR_is_fill_pixel := VAR_BIN_OP_AND_uxn_c_l148_c18_5643_return_output;
     -- BIN_OP_AND[uxn_c_l149_c19_6569] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l149_c19_6569_left <= VAR_BIN_OP_AND_uxn_c_l149_c19_6569_left;
     BIN_OP_AND_uxn_c_l149_c19_6569_right <= VAR_BIN_OP_AND_uxn_c_l149_c19_6569_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l149_c19_6569_return_output := BIN_OP_AND_uxn_c_l149_c19_6569_return_output;

     -- BIN_OP_AND[uxn_c_l150_c19_5bbe] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l150_c19_5bbe_left <= VAR_BIN_OP_AND_uxn_c_l150_c19_5bbe_left;
     BIN_OP_AND_uxn_c_l150_c19_5bbe_right <= VAR_BIN_OP_AND_uxn_c_l150_c19_5bbe_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l150_c19_5bbe_return_output := BIN_OP_AND_uxn_c_l150_c19_5bbe_return_output;

     -- Submodule level 13
     VAR_BIN_OP_OR_uxn_c_l156_c3_89b7_left := VAR_BIN_OP_AND_uxn_c_l149_c19_6569_return_output;
     VAR_MUX_uxn_c_l154_c3_0dca_cond := VAR_BIN_OP_AND_uxn_c_l149_c19_6569_return_output;
     VAR_MUX_uxn_c_l155_c3_3195_cond := VAR_BIN_OP_AND_uxn_c_l149_c19_6569_return_output;
     REG_VAR_is_fill_pixel0 := VAR_BIN_OP_AND_uxn_c_l149_c19_6569_return_output;
     VAR_BIN_OP_OR_uxn_c_l163_c3_d632_left := VAR_BIN_OP_AND_uxn_c_l150_c19_5bbe_return_output;
     VAR_MUX_uxn_c_l161_c3_5a30_cond := VAR_BIN_OP_AND_uxn_c_l150_c19_5bbe_return_output;
     VAR_MUX_uxn_c_l162_c3_1c73_cond := VAR_BIN_OP_AND_uxn_c_l150_c19_5bbe_return_output;
     REG_VAR_is_fill_pixel1 := VAR_BIN_OP_AND_uxn_c_l150_c19_5bbe_return_output;
     -- MUX[uxn_c_l155_c3_3195] LATENCY=0
     -- Inputs
     MUX_uxn_c_l155_c3_3195_cond <= VAR_MUX_uxn_c_l155_c3_3195_cond;
     MUX_uxn_c_l155_c3_3195_iftrue <= VAR_MUX_uxn_c_l155_c3_3195_iftrue;
     MUX_uxn_c_l155_c3_3195_iffalse <= VAR_MUX_uxn_c_l155_c3_3195_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l155_c3_3195_return_output := MUX_uxn_c_l155_c3_3195_return_output;

     -- BIN_OP_OR[uxn_c_l156_c3_89b7] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l156_c3_89b7_left <= VAR_BIN_OP_OR_uxn_c_l156_c3_89b7_left;
     BIN_OP_OR_uxn_c_l156_c3_89b7_right <= VAR_BIN_OP_OR_uxn_c_l156_c3_89b7_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l156_c3_89b7_return_output := BIN_OP_OR_uxn_c_l156_c3_89b7_return_output;

     -- BIN_OP_OR[uxn_c_l163_c3_d632] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l163_c3_d632_left <= VAR_BIN_OP_OR_uxn_c_l163_c3_d632_left;
     BIN_OP_OR_uxn_c_l163_c3_d632_right <= VAR_BIN_OP_OR_uxn_c_l163_c3_d632_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l163_c3_d632_return_output := BIN_OP_OR_uxn_c_l163_c3_d632_return_output;

     -- MUX[uxn_c_l154_c3_0dca] LATENCY=0
     -- Inputs
     MUX_uxn_c_l154_c3_0dca_cond <= VAR_MUX_uxn_c_l154_c3_0dca_cond;
     MUX_uxn_c_l154_c3_0dca_iftrue <= VAR_MUX_uxn_c_l154_c3_0dca_iftrue;
     MUX_uxn_c_l154_c3_0dca_iffalse <= VAR_MUX_uxn_c_l154_c3_0dca_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l154_c3_0dca_return_output := MUX_uxn_c_l154_c3_0dca_return_output;

     -- MUX[uxn_c_l161_c3_5a30] LATENCY=0
     -- Inputs
     MUX_uxn_c_l161_c3_5a30_cond <= VAR_MUX_uxn_c_l161_c3_5a30_cond;
     MUX_uxn_c_l161_c3_5a30_iftrue <= VAR_MUX_uxn_c_l161_c3_5a30_iftrue;
     MUX_uxn_c_l161_c3_5a30_iffalse <= VAR_MUX_uxn_c_l161_c3_5a30_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l161_c3_5a30_return_output := MUX_uxn_c_l161_c3_5a30_return_output;

     -- MUX[uxn_c_l162_c3_1c73] LATENCY=0
     -- Inputs
     MUX_uxn_c_l162_c3_1c73_cond <= VAR_MUX_uxn_c_l162_c3_1c73_cond;
     MUX_uxn_c_l162_c3_1c73_iftrue <= VAR_MUX_uxn_c_l162_c3_1c73_iftrue;
     MUX_uxn_c_l162_c3_1c73_iffalse <= VAR_MUX_uxn_c_l162_c3_1c73_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l162_c3_1c73_return_output := MUX_uxn_c_l162_c3_1c73_return_output;

     -- Submodule level 14
     VAR_bg_vram_update_uxn_c_l152_c19_75ed_write_enable := VAR_BIN_OP_OR_uxn_c_l156_c3_89b7_return_output;
     VAR_fg_vram_update_uxn_c_l159_c19_ce04_write_enable := VAR_BIN_OP_OR_uxn_c_l163_c3_d632_return_output;
     VAR_bg_vram_update_uxn_c_l152_c19_75ed_write_address := VAR_MUX_uxn_c_l154_c3_0dca_return_output;
     VAR_bg_vram_update_uxn_c_l152_c19_75ed_write_value := VAR_MUX_uxn_c_l155_c3_3195_return_output;
     VAR_fg_vram_update_uxn_c_l159_c19_ce04_write_address := VAR_MUX_uxn_c_l161_c3_5a30_return_output;
     VAR_fg_vram_update_uxn_c_l159_c19_ce04_write_value := VAR_MUX_uxn_c_l162_c3_1c73_return_output;
     -- fg_vram_update[uxn_c_l159_c19_ce04] LATENCY=0
     -- Clock enable
     fg_vram_update_uxn_c_l159_c19_ce04_CLOCK_ENABLE <= VAR_fg_vram_update_uxn_c_l159_c19_ce04_CLOCK_ENABLE;
     -- Inputs
     fg_vram_update_uxn_c_l159_c19_ce04_read_address <= VAR_fg_vram_update_uxn_c_l159_c19_ce04_read_address;
     fg_vram_update_uxn_c_l159_c19_ce04_write_address <= VAR_fg_vram_update_uxn_c_l159_c19_ce04_write_address;
     fg_vram_update_uxn_c_l159_c19_ce04_write_value <= VAR_fg_vram_update_uxn_c_l159_c19_ce04_write_value;
     fg_vram_update_uxn_c_l159_c19_ce04_write_enable <= VAR_fg_vram_update_uxn_c_l159_c19_ce04_write_enable;
     -- Outputs
     VAR_fg_vram_update_uxn_c_l159_c19_ce04_return_output := fg_vram_update_uxn_c_l159_c19_ce04_return_output;

     -- bg_vram_update[uxn_c_l152_c19_75ed] LATENCY=0
     -- Clock enable
     bg_vram_update_uxn_c_l152_c19_75ed_CLOCK_ENABLE <= VAR_bg_vram_update_uxn_c_l152_c19_75ed_CLOCK_ENABLE;
     -- Inputs
     bg_vram_update_uxn_c_l152_c19_75ed_read_address <= VAR_bg_vram_update_uxn_c_l152_c19_75ed_read_address;
     bg_vram_update_uxn_c_l152_c19_75ed_write_address <= VAR_bg_vram_update_uxn_c_l152_c19_75ed_write_address;
     bg_vram_update_uxn_c_l152_c19_75ed_write_value <= VAR_bg_vram_update_uxn_c_l152_c19_75ed_write_value;
     bg_vram_update_uxn_c_l152_c19_75ed_write_enable <= VAR_bg_vram_update_uxn_c_l152_c19_75ed_write_enable;
     -- Outputs
     VAR_bg_vram_update_uxn_c_l152_c19_75ed_return_output := bg_vram_update_uxn_c_l152_c19_75ed_return_output;

     -- Submodule level 15
     VAR_MUX_uxn_c_l174_c17_5acb_iftrue := VAR_bg_vram_update_uxn_c_l152_c19_75ed_return_output;
     REG_VAR_bg_pixel_color := VAR_bg_vram_update_uxn_c_l152_c19_75ed_return_output;
     VAR_BIN_OP_EQ_uxn_c_l174_c17_8388_left := VAR_fg_vram_update_uxn_c_l159_c19_ce04_return_output;
     VAR_MUX_uxn_c_l174_c17_5acb_iffalse := VAR_fg_vram_update_uxn_c_l159_c19_ce04_return_output;
     REG_VAR_fg_pixel_color := VAR_fg_vram_update_uxn_c_l159_c19_ce04_return_output;
     -- BIN_OP_EQ[uxn_c_l174_c17_8388] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l174_c17_8388_left <= VAR_BIN_OP_EQ_uxn_c_l174_c17_8388_left;
     BIN_OP_EQ_uxn_c_l174_c17_8388_right <= VAR_BIN_OP_EQ_uxn_c_l174_c17_8388_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l174_c17_8388_return_output := BIN_OP_EQ_uxn_c_l174_c17_8388_return_output;

     -- Submodule level 16
     VAR_MUX_uxn_c_l174_c17_5acb_cond := VAR_BIN_OP_EQ_uxn_c_l174_c17_8388_return_output;
     -- MUX[uxn_c_l174_c17_5acb] LATENCY=0
     -- Inputs
     MUX_uxn_c_l174_c17_5acb_cond <= VAR_MUX_uxn_c_l174_c17_5acb_cond;
     MUX_uxn_c_l174_c17_5acb_iftrue <= VAR_MUX_uxn_c_l174_c17_5acb_iftrue;
     MUX_uxn_c_l174_c17_5acb_iffalse <= VAR_MUX_uxn_c_l174_c17_5acb_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l174_c17_5acb_return_output := MUX_uxn_c_l174_c17_5acb_return_output;

     -- Submodule level 17
     -- CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_6984_uxn_c_l177_l103_DUPLICATE_3b30 LATENCY=0
     VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_6984_uxn_c_l177_l103_DUPLICATE_3b30_return_output := CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_6984(
     VAR_MUX_uxn_c_l174_c17_5acb_return_output,
     VAR_MUX_uxn_c_l141_c19_2890_return_output);

     -- Submodule level 18
     REG_VAR_result := VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_6984_uxn_c_l177_l103_DUPLICATE_3b30_return_output;
     VAR_return_output := VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_6984_uxn_c_l177_l103_DUPLICATE_3b30_return_output;
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
