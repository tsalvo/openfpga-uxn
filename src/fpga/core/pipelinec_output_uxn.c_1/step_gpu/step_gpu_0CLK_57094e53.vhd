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
-- BIN_OP_GT[uxn_c_l112_c26_d2ec]
signal BIN_OP_GT_uxn_c_l112_c26_d2ec_left : unsigned(31 downto 0);
signal BIN_OP_GT_uxn_c_l112_c26_d2ec_right : unsigned(17 downto 0);
signal BIN_OP_GT_uxn_c_l112_c26_d2ec_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l112_c26_ae14]
signal MUX_uxn_c_l112_c26_ae14_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l112_c26_ae14_iftrue : unsigned(31 downto 0);
signal MUX_uxn_c_l112_c26_ae14_iffalse : unsigned(31 downto 0);
signal MUX_uxn_c_l112_c26_ae14_return_output : unsigned(31 downto 0);

-- CONST_SR_28[uxn_c_l113_c24_e4f3]
signal CONST_SR_28_uxn_c_l113_c24_e4f3_x : unsigned(31 downto 0);
signal CONST_SR_28_uxn_c_l113_c24_e4f3_return_output : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_c_l114_c17_4089]
signal BIN_OP_EQ_uxn_c_l114_c17_4089_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l114_c17_4089_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l114_c17_4089_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l114_c17_bf00]
signal MUX_uxn_c_l114_c17_bf00_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l114_c17_bf00_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l114_c17_bf00_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l114_c17_bf00_return_output : unsigned(0 downto 0);

-- BIN_OP_DIV[uxn_c_l115_c6_6b6b]
signal BIN_OP_DIV_uxn_c_l115_c6_6b6b_left : unsigned(31 downto 0);
signal BIN_OP_DIV_uxn_c_l115_c6_6b6b_right : unsigned(8 downto 0);
signal BIN_OP_DIV_uxn_c_l115_c6_6b6b_return_output : unsigned(31 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_c_l116_c23_f760]
signal BIN_OP_INFERRED_MULT_uxn_c_l116_c23_f760_left : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_c_l116_c23_f760_right : unsigned(8 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_c_l116_c23_f760_return_output : unsigned(24 downto 0);

-- BIN_OP_MINUS[uxn_c_l116_c6_678c]
signal BIN_OP_MINUS_uxn_c_l116_c6_678c_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_uxn_c_l116_c6_678c_right : unsigned(24 downto 0);
signal BIN_OP_MINUS_uxn_c_l116_c6_678c_return_output : unsigned(31 downto 0);

-- UNARY_OP_NOT[uxn_c_l119_c22_c1ba]
signal UNARY_OP_NOT_uxn_c_l119_c22_c1ba_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l119_c22_c1ba_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l119_c6_da4f]
signal BIN_OP_AND_uxn_c_l119_c6_da4f_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l119_c6_da4f_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l119_c6_da4f_return_output : unsigned(0 downto 0);

-- fill_x1_MUX[uxn_c_l119_c2_040d]
signal fill_x1_MUX_uxn_c_l119_c2_040d_cond : unsigned(0 downto 0);
signal fill_x1_MUX_uxn_c_l119_c2_040d_iftrue : unsigned(15 downto 0);
signal fill_x1_MUX_uxn_c_l119_c2_040d_iffalse : unsigned(15 downto 0);
signal fill_x1_MUX_uxn_c_l119_c2_040d_return_output : unsigned(15 downto 0);

-- fill_pixels_remaining_MUX[uxn_c_l119_c2_040d]
signal fill_pixels_remaining_MUX_uxn_c_l119_c2_040d_cond : unsigned(0 downto 0);
signal fill_pixels_remaining_MUX_uxn_c_l119_c2_040d_iftrue : unsigned(31 downto 0);
signal fill_pixels_remaining_MUX_uxn_c_l119_c2_040d_iffalse : unsigned(31 downto 0);
signal fill_pixels_remaining_MUX_uxn_c_l119_c2_040d_return_output : unsigned(31 downto 0);

-- is_fill_top_MUX[uxn_c_l119_c2_040d]
signal is_fill_top_MUX_uxn_c_l119_c2_040d_cond : unsigned(0 downto 0);
signal is_fill_top_MUX_uxn_c_l119_c2_040d_iftrue : unsigned(0 downto 0);
signal is_fill_top_MUX_uxn_c_l119_c2_040d_iffalse : unsigned(0 downto 0);
signal is_fill_top_MUX_uxn_c_l119_c2_040d_return_output : unsigned(0 downto 0);

-- fill_x0_MUX[uxn_c_l119_c2_040d]
signal fill_x0_MUX_uxn_c_l119_c2_040d_cond : unsigned(0 downto 0);
signal fill_x0_MUX_uxn_c_l119_c2_040d_iftrue : unsigned(15 downto 0);
signal fill_x0_MUX_uxn_c_l119_c2_040d_iffalse : unsigned(15 downto 0);
signal fill_x0_MUX_uxn_c_l119_c2_040d_return_output : unsigned(15 downto 0);

-- is_fill_left_MUX[uxn_c_l119_c2_040d]
signal is_fill_left_MUX_uxn_c_l119_c2_040d_cond : unsigned(0 downto 0);
signal is_fill_left_MUX_uxn_c_l119_c2_040d_iftrue : unsigned(0 downto 0);
signal is_fill_left_MUX_uxn_c_l119_c2_040d_iffalse : unsigned(0 downto 0);
signal is_fill_left_MUX_uxn_c_l119_c2_040d_return_output : unsigned(0 downto 0);

-- fill_layer_MUX[uxn_c_l119_c2_040d]
signal fill_layer_MUX_uxn_c_l119_c2_040d_cond : unsigned(0 downto 0);
signal fill_layer_MUX_uxn_c_l119_c2_040d_iftrue : unsigned(0 downto 0);
signal fill_layer_MUX_uxn_c_l119_c2_040d_iffalse : unsigned(0 downto 0);
signal fill_layer_MUX_uxn_c_l119_c2_040d_return_output : unsigned(0 downto 0);

-- fill_y0_MUX[uxn_c_l119_c2_040d]
signal fill_y0_MUX_uxn_c_l119_c2_040d_cond : unsigned(0 downto 0);
signal fill_y0_MUX_uxn_c_l119_c2_040d_iftrue : unsigned(15 downto 0);
signal fill_y0_MUX_uxn_c_l119_c2_040d_iffalse : unsigned(15 downto 0);
signal fill_y0_MUX_uxn_c_l119_c2_040d_return_output : unsigned(15 downto 0);

-- fill_y1_MUX[uxn_c_l119_c2_040d]
signal fill_y1_MUX_uxn_c_l119_c2_040d_cond : unsigned(0 downto 0);
signal fill_y1_MUX_uxn_c_l119_c2_040d_iftrue : unsigned(15 downto 0);
signal fill_y1_MUX_uxn_c_l119_c2_040d_iffalse : unsigned(15 downto 0);
signal fill_y1_MUX_uxn_c_l119_c2_040d_return_output : unsigned(15 downto 0);

-- fill_color_MUX[uxn_c_l119_c2_040d]
signal fill_color_MUX_uxn_c_l119_c2_040d_cond : unsigned(0 downto 0);
signal fill_color_MUX_uxn_c_l119_c2_040d_iftrue : unsigned(1 downto 0);
signal fill_color_MUX_uxn_c_l119_c2_040d_iffalse : unsigned(1 downto 0);
signal fill_color_MUX_uxn_c_l119_c2_040d_return_output : unsigned(1 downto 0);

-- CONST_SR_20[uxn_c_l121_c18_a36f]
signal CONST_SR_20_uxn_c_l121_c18_a36f_x : unsigned(31 downto 0);
signal CONST_SR_20_uxn_c_l121_c18_a36f_return_output : unsigned(31 downto 0);

-- CONST_SR_21[uxn_c_l122_c17_9d6e]
signal CONST_SR_21_uxn_c_l122_c17_9d6e_x : unsigned(31 downto 0);
signal CONST_SR_21_uxn_c_l122_c17_9d6e_return_output : unsigned(31 downto 0);

-- BIN_OP_AND[uxn_c_l123_c27_ed0e]
signal BIN_OP_AND_uxn_c_l123_c27_ed0e_left : unsigned(31 downto 0);
signal BIN_OP_AND_uxn_c_l123_c27_ed0e_right : unsigned(17 downto 0);
signal BIN_OP_AND_uxn_c_l123_c27_ed0e_return_output : unsigned(31 downto 0);

-- BIN_OP_DIV[uxn_c_l124_c13_def2]
signal BIN_OP_DIV_uxn_c_l124_c13_def2_left : unsigned(31 downto 0);
signal BIN_OP_DIV_uxn_c_l124_c13_def2_right : unsigned(8 downto 0);
signal BIN_OP_DIV_uxn_c_l124_c13_def2_return_output : unsigned(31 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_c_l125_c38_417a]
signal BIN_OP_INFERRED_MULT_uxn_c_l125_c38_417a_left : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_c_l125_c38_417a_right : unsigned(8 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_c_l125_c38_417a_return_output : unsigned(24 downto 0);

-- BIN_OP_MINUS[uxn_c_l125_c13_ce2f]
signal BIN_OP_MINUS_uxn_c_l125_c13_ce2f_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_uxn_c_l125_c13_ce2f_right : unsigned(24 downto 0);
signal BIN_OP_MINUS_uxn_c_l125_c13_ce2f_return_output : unsigned(31 downto 0);

-- MUX[uxn_c_l126_c13_876b]
signal MUX_uxn_c_l126_c13_876b_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l126_c13_876b_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l126_c13_876b_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l126_c13_876b_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l127_c13_5e6c]
signal MUX_uxn_c_l127_c13_5e6c_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l127_c13_5e6c_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l127_c13_5e6c_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l127_c13_5e6c_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l128_c13_19f3]
signal MUX_uxn_c_l128_c13_19f3_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l128_c13_19f3_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l128_c13_19f3_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l128_c13_19f3_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l129_c13_a0f6]
signal MUX_uxn_c_l129_c13_a0f6_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l129_c13_a0f6_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l129_c13_a0f6_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l129_c13_a0f6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l135_c19_9029]
signal BIN_OP_EQ_uxn_c_l135_c19_9029_left : unsigned(31 downto 0);
signal BIN_OP_EQ_uxn_c_l135_c19_9029_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l135_c19_9029_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l135_c19_72e8]
signal MUX_uxn_c_l135_c19_72e8_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l135_c19_72e8_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l135_c19_72e8_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l135_c19_72e8_return_output : unsigned(0 downto 0);

-- BIN_OP_GT[uxn_c_l137_c17_2249]
signal BIN_OP_GT_uxn_c_l137_c17_2249_left : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_c_l137_c17_2249_right : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_c_l137_c17_2249_return_output : unsigned(0 downto 0);

-- BIN_OP_LT[uxn_c_l138_c17_96af]
signal BIN_OP_LT_uxn_c_l138_c17_96af_left : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_c_l138_c17_96af_right : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_c_l138_c17_96af_return_output : unsigned(0 downto 0);

-- BIN_OP_GT[uxn_c_l139_c17_11c2]
signal BIN_OP_GT_uxn_c_l139_c17_11c2_left : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_c_l139_c17_11c2_right : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_c_l139_c17_11c2_return_output : unsigned(0 downto 0);

-- BIN_OP_LT[uxn_c_l140_c17_c710]
signal BIN_OP_LT_uxn_c_l140_c17_c710_left : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_c_l140_c17_c710_right : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_c_l140_c17_c710_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l142_c18_7758]
signal BIN_OP_AND_uxn_c_l142_c18_7758_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l142_c18_7758_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l142_c18_7758_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l142_c18_94a5]
signal BIN_OP_AND_uxn_c_l142_c18_94a5_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l142_c18_94a5_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l142_c18_94a5_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l142_c18_387c]
signal BIN_OP_AND_uxn_c_l142_c18_387c_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l142_c18_387c_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l142_c18_387c_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l142_c18_7f2c]
signal BIN_OP_AND_uxn_c_l142_c18_7f2c_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l142_c18_7f2c_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l142_c18_7f2c_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_c_l143_c37_336a]
signal UNARY_OP_NOT_uxn_c_l143_c37_336a_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l143_c37_336a_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l143_c19_3077]
signal BIN_OP_AND_uxn_c_l143_c19_3077_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l143_c19_3077_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l143_c19_3077_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l144_c19_3d48]
signal BIN_OP_AND_uxn_c_l144_c19_3d48_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l144_c19_3d48_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l144_c19_3d48_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l148_c37_5fe0]
signal MUX_uxn_c_l148_c37_5fe0_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l148_c37_5fe0_iftrue : unsigned(31 downto 0);
signal MUX_uxn_c_l148_c37_5fe0_iffalse : unsigned(31 downto 0);
signal MUX_uxn_c_l148_c37_5fe0_return_output : unsigned(31 downto 0);

-- MUX[uxn_c_l148_c3_0d39]
signal MUX_uxn_c_l148_c3_0d39_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l148_c3_0d39_iftrue : unsigned(31 downto 0);
signal MUX_uxn_c_l148_c3_0d39_iffalse : unsigned(31 downto 0);
signal MUX_uxn_c_l148_c3_0d39_return_output : unsigned(31 downto 0);

-- MUX[uxn_c_l149_c3_348a]
signal MUX_uxn_c_l149_c3_348a_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l149_c3_348a_iftrue : unsigned(1 downto 0);
signal MUX_uxn_c_l149_c3_348a_iffalse : unsigned(1 downto 0);
signal MUX_uxn_c_l149_c3_348a_return_output : unsigned(1 downto 0);

-- UNARY_OP_NOT[uxn_c_l150_c57_e815]
signal UNARY_OP_NOT_uxn_c_l150_c57_e815_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l150_c57_e815_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l150_c22_e5fa]
signal BIN_OP_AND_uxn_c_l150_c22_e5fa_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l150_c22_e5fa_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l150_c22_e5fa_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_c_l150_c3_126b]
signal BIN_OP_OR_uxn_c_l150_c3_126b_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l150_c3_126b_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l150_c3_126b_return_output : unsigned(0 downto 0);

-- bg_vram_update[uxn_c_l146_c19_c372]
signal bg_vram_update_uxn_c_l146_c19_c372_CLOCK_ENABLE : unsigned(0 downto 0);
signal bg_vram_update_uxn_c_l146_c19_c372_read_address : unsigned(31 downto 0);
signal bg_vram_update_uxn_c_l146_c19_c372_write_address : unsigned(31 downto 0);
signal bg_vram_update_uxn_c_l146_c19_c372_write_value : unsigned(1 downto 0);
signal bg_vram_update_uxn_c_l146_c19_c372_write_enable : unsigned(0 downto 0);
signal bg_vram_update_uxn_c_l146_c19_c372_return_output : unsigned(1 downto 0);

-- MUX[uxn_c_l155_c37_4246]
signal MUX_uxn_c_l155_c37_4246_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l155_c37_4246_iftrue : unsigned(31 downto 0);
signal MUX_uxn_c_l155_c37_4246_iffalse : unsigned(31 downto 0);
signal MUX_uxn_c_l155_c37_4246_return_output : unsigned(31 downto 0);

-- MUX[uxn_c_l155_c3_5278]
signal MUX_uxn_c_l155_c3_5278_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l155_c3_5278_iftrue : unsigned(31 downto 0);
signal MUX_uxn_c_l155_c3_5278_iffalse : unsigned(31 downto 0);
signal MUX_uxn_c_l155_c3_5278_return_output : unsigned(31 downto 0);

-- MUX[uxn_c_l156_c3_eabd]
signal MUX_uxn_c_l156_c3_eabd_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l156_c3_eabd_iftrue : unsigned(1 downto 0);
signal MUX_uxn_c_l156_c3_eabd_iffalse : unsigned(1 downto 0);
signal MUX_uxn_c_l156_c3_eabd_return_output : unsigned(1 downto 0);

-- BIN_OP_AND[uxn_c_l157_c22_a2bb]
signal BIN_OP_AND_uxn_c_l157_c22_a2bb_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l157_c22_a2bb_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l157_c22_a2bb_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_c_l157_c3_1b7f]
signal BIN_OP_OR_uxn_c_l157_c3_1b7f_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l157_c3_1b7f_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l157_c3_1b7f_return_output : unsigned(0 downto 0);

-- fg_vram_update[uxn_c_l153_c19_2755]
signal fg_vram_update_uxn_c_l153_c19_2755_CLOCK_ENABLE : unsigned(0 downto 0);
signal fg_vram_update_uxn_c_l153_c19_2755_read_address : unsigned(31 downto 0);
signal fg_vram_update_uxn_c_l153_c19_2755_write_address : unsigned(31 downto 0);
signal fg_vram_update_uxn_c_l153_c19_2755_write_value : unsigned(1 downto 0);
signal fg_vram_update_uxn_c_l153_c19_2755_write_enable : unsigned(0 downto 0);
signal fg_vram_update_uxn_c_l153_c19_2755_return_output : unsigned(1 downto 0);

-- BIN_OP_EQ[uxn_c_l161_c6_4ddc]
signal BIN_OP_EQ_uxn_c_l161_c6_4ddc_left : unsigned(31 downto 0);
signal BIN_OP_EQ_uxn_c_l161_c6_4ddc_right : unsigned(17 downto 0);
signal BIN_OP_EQ_uxn_c_l161_c6_4ddc_return_output : unsigned(0 downto 0);

-- pixel_counter_MUX[uxn_c_l161_c2_60dd]
signal pixel_counter_MUX_uxn_c_l161_c2_60dd_cond : unsigned(0 downto 0);
signal pixel_counter_MUX_uxn_c_l161_c2_60dd_iftrue : unsigned(31 downto 0);
signal pixel_counter_MUX_uxn_c_l161_c2_60dd_iffalse : unsigned(31 downto 0);
signal pixel_counter_MUX_uxn_c_l161_c2_60dd_return_output : unsigned(31 downto 0);

-- fill_pixels_remaining_MUX[uxn_c_l161_c2_60dd]
signal fill_pixels_remaining_MUX_uxn_c_l161_c2_60dd_cond : unsigned(0 downto 0);
signal fill_pixels_remaining_MUX_uxn_c_l161_c2_60dd_iftrue : unsigned(31 downto 0);
signal fill_pixels_remaining_MUX_uxn_c_l161_c2_60dd_iffalse : unsigned(31 downto 0);
signal fill_pixels_remaining_MUX_uxn_c_l161_c2_60dd_return_output : unsigned(31 downto 0);

-- pixel_counter_MUX[uxn_c_l163_c9_6f5c]
signal pixel_counter_MUX_uxn_c_l163_c9_6f5c_cond : unsigned(0 downto 0);
signal pixel_counter_MUX_uxn_c_l163_c9_6f5c_iftrue : unsigned(31 downto 0);
signal pixel_counter_MUX_uxn_c_l163_c9_6f5c_iffalse : unsigned(31 downto 0);
signal pixel_counter_MUX_uxn_c_l163_c9_6f5c_return_output : unsigned(31 downto 0);

-- fill_pixels_remaining_MUX[uxn_c_l163_c9_6f5c]
signal fill_pixels_remaining_MUX_uxn_c_l163_c9_6f5c_cond : unsigned(0 downto 0);
signal fill_pixels_remaining_MUX_uxn_c_l163_c9_6f5c_iftrue : unsigned(31 downto 0);
signal fill_pixels_remaining_MUX_uxn_c_l163_c9_6f5c_iffalse : unsigned(31 downto 0);
signal fill_pixels_remaining_MUX_uxn_c_l163_c9_6f5c_return_output : unsigned(31 downto 0);

-- BIN_OP_PLUS[uxn_c_l164_c3_b1e2]
signal BIN_OP_PLUS_uxn_c_l164_c3_b1e2_left : unsigned(31 downto 0);
signal BIN_OP_PLUS_uxn_c_l164_c3_b1e2_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l164_c3_b1e2_return_output : unsigned(32 downto 0);

-- BIN_OP_EQ[uxn_c_l165_c27_0081]
signal BIN_OP_EQ_uxn_c_l165_c27_0081_left : unsigned(31 downto 0);
signal BIN_OP_EQ_uxn_c_l165_c27_0081_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l165_c27_0081_return_output : unsigned(0 downto 0);

-- BIN_OP_MINUS[uxn_c_l165_c60_c313]
signal BIN_OP_MINUS_uxn_c_l165_c60_c313_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_uxn_c_l165_c60_c313_right : unsigned(0 downto 0);
signal BIN_OP_MINUS_uxn_c_l165_c60_c313_return_output : unsigned(31 downto 0);

-- MUX[uxn_c_l165_c27_1f4b]
signal MUX_uxn_c_l165_c27_1f4b_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l165_c27_1f4b_iftrue : unsigned(31 downto 0);
signal MUX_uxn_c_l165_c27_1f4b_iffalse : unsigned(31 downto 0);
signal MUX_uxn_c_l165_c27_1f4b_return_output : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_c_l168_c17_0f65]
signal BIN_OP_EQ_uxn_c_l168_c17_0f65_left : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l168_c17_0f65_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l168_c17_0f65_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l168_c17_91b9]
signal MUX_uxn_c_l168_c17_91b9_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l168_c17_91b9_iftrue : unsigned(1 downto 0);
signal MUX_uxn_c_l168_c17_91b9_iffalse : unsigned(1 downto 0);
signal MUX_uxn_c_l168_c17_91b9_return_output : unsigned(1 downto 0);

-- UNARY_OP_NOT_uint1_t_uxn_c_l157_l150_DUPLICATE_30fb
signal UNARY_OP_NOT_uint1_t_uxn_c_l157_l150_DUPLICATE_30fb_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uint1_t_uxn_c_l157_l150_DUPLICATE_30fb_return_output : unsigned(0 downto 0);

-- BIN_OP_AND_uint1_t_uint1_t_uxn_c_l150_l157_DUPLICATE_caa2
signal BIN_OP_AND_uint1_t_uint1_t_uxn_c_l150_l157_DUPLICATE_caa2_left : unsigned(0 downto 0);
signal BIN_OP_AND_uint1_t_uint1_t_uxn_c_l150_l157_DUPLICATE_caa2_right : unsigned(0 downto 0);
signal BIN_OP_AND_uint1_t_uint1_t_uxn_c_l150_l157_DUPLICATE_caa2_return_output : unsigned(0 downto 0);

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
-- BIN_OP_GT_uxn_c_l112_c26_d2ec
BIN_OP_GT_uxn_c_l112_c26_d2ec : entity work.BIN_OP_GT_uint32_t_uint18_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_c_l112_c26_d2ec_left,
BIN_OP_GT_uxn_c_l112_c26_d2ec_right,
BIN_OP_GT_uxn_c_l112_c26_d2ec_return_output);

-- MUX_uxn_c_l112_c26_ae14
MUX_uxn_c_l112_c26_ae14 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
MUX_uxn_c_l112_c26_ae14_cond,
MUX_uxn_c_l112_c26_ae14_iftrue,
MUX_uxn_c_l112_c26_ae14_iffalse,
MUX_uxn_c_l112_c26_ae14_return_output);

-- CONST_SR_28_uxn_c_l113_c24_e4f3
CONST_SR_28_uxn_c_l113_c24_e4f3 : entity work.CONST_SR_28_uint32_t_0CLK_de264c78 port map (
CONST_SR_28_uxn_c_l113_c24_e4f3_x,
CONST_SR_28_uxn_c_l113_c24_e4f3_return_output);

-- BIN_OP_EQ_uxn_c_l114_c17_4089
BIN_OP_EQ_uxn_c_l114_c17_4089 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l114_c17_4089_left,
BIN_OP_EQ_uxn_c_l114_c17_4089_right,
BIN_OP_EQ_uxn_c_l114_c17_4089_return_output);

-- MUX_uxn_c_l114_c17_bf00
MUX_uxn_c_l114_c17_bf00 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l114_c17_bf00_cond,
MUX_uxn_c_l114_c17_bf00_iftrue,
MUX_uxn_c_l114_c17_bf00_iffalse,
MUX_uxn_c_l114_c17_bf00_return_output);

-- BIN_OP_DIV_uxn_c_l115_c6_6b6b
BIN_OP_DIV_uxn_c_l115_c6_6b6b : entity work.BIN_OP_DIV_uint32_t_uint9_t_0CLK_422b4ffb port map (
BIN_OP_DIV_uxn_c_l115_c6_6b6b_left,
BIN_OP_DIV_uxn_c_l115_c6_6b6b_right,
BIN_OP_DIV_uxn_c_l115_c6_6b6b_return_output);

-- BIN_OP_INFERRED_MULT_uxn_c_l116_c23_f760
BIN_OP_INFERRED_MULT_uxn_c_l116_c23_f760 : entity work.BIN_OP_INFERRED_MULT_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_c_l116_c23_f760_left,
BIN_OP_INFERRED_MULT_uxn_c_l116_c23_f760_right,
BIN_OP_INFERRED_MULT_uxn_c_l116_c23_f760_return_output);

-- BIN_OP_MINUS_uxn_c_l116_c6_678c
BIN_OP_MINUS_uxn_c_l116_c6_678c : entity work.BIN_OP_MINUS_uint32_t_uint25_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l116_c6_678c_left,
BIN_OP_MINUS_uxn_c_l116_c6_678c_right,
BIN_OP_MINUS_uxn_c_l116_c6_678c_return_output);

-- UNARY_OP_NOT_uxn_c_l119_c22_c1ba
UNARY_OP_NOT_uxn_c_l119_c22_c1ba : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l119_c22_c1ba_expr,
UNARY_OP_NOT_uxn_c_l119_c22_c1ba_return_output);

-- BIN_OP_AND_uxn_c_l119_c6_da4f
BIN_OP_AND_uxn_c_l119_c6_da4f : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l119_c6_da4f_left,
BIN_OP_AND_uxn_c_l119_c6_da4f_right,
BIN_OP_AND_uxn_c_l119_c6_da4f_return_output);

-- fill_x1_MUX_uxn_c_l119_c2_040d
fill_x1_MUX_uxn_c_l119_c2_040d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_x1_MUX_uxn_c_l119_c2_040d_cond,
fill_x1_MUX_uxn_c_l119_c2_040d_iftrue,
fill_x1_MUX_uxn_c_l119_c2_040d_iffalse,
fill_x1_MUX_uxn_c_l119_c2_040d_return_output);

-- fill_pixels_remaining_MUX_uxn_c_l119_c2_040d
fill_pixels_remaining_MUX_uxn_c_l119_c2_040d : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
fill_pixels_remaining_MUX_uxn_c_l119_c2_040d_cond,
fill_pixels_remaining_MUX_uxn_c_l119_c2_040d_iftrue,
fill_pixels_remaining_MUX_uxn_c_l119_c2_040d_iffalse,
fill_pixels_remaining_MUX_uxn_c_l119_c2_040d_return_output);

-- is_fill_top_MUX_uxn_c_l119_c2_040d
is_fill_top_MUX_uxn_c_l119_c2_040d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_top_MUX_uxn_c_l119_c2_040d_cond,
is_fill_top_MUX_uxn_c_l119_c2_040d_iftrue,
is_fill_top_MUX_uxn_c_l119_c2_040d_iffalse,
is_fill_top_MUX_uxn_c_l119_c2_040d_return_output);

-- fill_x0_MUX_uxn_c_l119_c2_040d
fill_x0_MUX_uxn_c_l119_c2_040d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_x0_MUX_uxn_c_l119_c2_040d_cond,
fill_x0_MUX_uxn_c_l119_c2_040d_iftrue,
fill_x0_MUX_uxn_c_l119_c2_040d_iffalse,
fill_x0_MUX_uxn_c_l119_c2_040d_return_output);

-- is_fill_left_MUX_uxn_c_l119_c2_040d
is_fill_left_MUX_uxn_c_l119_c2_040d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_left_MUX_uxn_c_l119_c2_040d_cond,
is_fill_left_MUX_uxn_c_l119_c2_040d_iftrue,
is_fill_left_MUX_uxn_c_l119_c2_040d_iffalse,
is_fill_left_MUX_uxn_c_l119_c2_040d_return_output);

-- fill_layer_MUX_uxn_c_l119_c2_040d
fill_layer_MUX_uxn_c_l119_c2_040d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
fill_layer_MUX_uxn_c_l119_c2_040d_cond,
fill_layer_MUX_uxn_c_l119_c2_040d_iftrue,
fill_layer_MUX_uxn_c_l119_c2_040d_iffalse,
fill_layer_MUX_uxn_c_l119_c2_040d_return_output);

-- fill_y0_MUX_uxn_c_l119_c2_040d
fill_y0_MUX_uxn_c_l119_c2_040d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_y0_MUX_uxn_c_l119_c2_040d_cond,
fill_y0_MUX_uxn_c_l119_c2_040d_iftrue,
fill_y0_MUX_uxn_c_l119_c2_040d_iffalse,
fill_y0_MUX_uxn_c_l119_c2_040d_return_output);

-- fill_y1_MUX_uxn_c_l119_c2_040d
fill_y1_MUX_uxn_c_l119_c2_040d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_y1_MUX_uxn_c_l119_c2_040d_cond,
fill_y1_MUX_uxn_c_l119_c2_040d_iftrue,
fill_y1_MUX_uxn_c_l119_c2_040d_iffalse,
fill_y1_MUX_uxn_c_l119_c2_040d_return_output);

-- fill_color_MUX_uxn_c_l119_c2_040d
fill_color_MUX_uxn_c_l119_c2_040d : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
fill_color_MUX_uxn_c_l119_c2_040d_cond,
fill_color_MUX_uxn_c_l119_c2_040d_iftrue,
fill_color_MUX_uxn_c_l119_c2_040d_iffalse,
fill_color_MUX_uxn_c_l119_c2_040d_return_output);

-- CONST_SR_20_uxn_c_l121_c18_a36f
CONST_SR_20_uxn_c_l121_c18_a36f : entity work.CONST_SR_20_uint32_t_0CLK_de264c78 port map (
CONST_SR_20_uxn_c_l121_c18_a36f_x,
CONST_SR_20_uxn_c_l121_c18_a36f_return_output);

-- CONST_SR_21_uxn_c_l122_c17_9d6e
CONST_SR_21_uxn_c_l122_c17_9d6e : entity work.CONST_SR_21_uint32_t_0CLK_de264c78 port map (
CONST_SR_21_uxn_c_l122_c17_9d6e_x,
CONST_SR_21_uxn_c_l122_c17_9d6e_return_output);

-- BIN_OP_AND_uxn_c_l123_c27_ed0e
BIN_OP_AND_uxn_c_l123_c27_ed0e : entity work.BIN_OP_AND_uint32_t_uint18_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l123_c27_ed0e_left,
BIN_OP_AND_uxn_c_l123_c27_ed0e_right,
BIN_OP_AND_uxn_c_l123_c27_ed0e_return_output);

-- BIN_OP_DIV_uxn_c_l124_c13_def2
BIN_OP_DIV_uxn_c_l124_c13_def2 : entity work.BIN_OP_DIV_uint32_t_uint9_t_0CLK_422b4ffb port map (
BIN_OP_DIV_uxn_c_l124_c13_def2_left,
BIN_OP_DIV_uxn_c_l124_c13_def2_right,
BIN_OP_DIV_uxn_c_l124_c13_def2_return_output);

-- BIN_OP_INFERRED_MULT_uxn_c_l125_c38_417a
BIN_OP_INFERRED_MULT_uxn_c_l125_c38_417a : entity work.BIN_OP_INFERRED_MULT_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_c_l125_c38_417a_left,
BIN_OP_INFERRED_MULT_uxn_c_l125_c38_417a_right,
BIN_OP_INFERRED_MULT_uxn_c_l125_c38_417a_return_output);

-- BIN_OP_MINUS_uxn_c_l125_c13_ce2f
BIN_OP_MINUS_uxn_c_l125_c13_ce2f : entity work.BIN_OP_MINUS_uint32_t_uint25_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l125_c13_ce2f_left,
BIN_OP_MINUS_uxn_c_l125_c13_ce2f_right,
BIN_OP_MINUS_uxn_c_l125_c13_ce2f_return_output);

-- MUX_uxn_c_l126_c13_876b
MUX_uxn_c_l126_c13_876b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l126_c13_876b_cond,
MUX_uxn_c_l126_c13_876b_iftrue,
MUX_uxn_c_l126_c13_876b_iffalse,
MUX_uxn_c_l126_c13_876b_return_output);

-- MUX_uxn_c_l127_c13_5e6c
MUX_uxn_c_l127_c13_5e6c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l127_c13_5e6c_cond,
MUX_uxn_c_l127_c13_5e6c_iftrue,
MUX_uxn_c_l127_c13_5e6c_iffalse,
MUX_uxn_c_l127_c13_5e6c_return_output);

-- MUX_uxn_c_l128_c13_19f3
MUX_uxn_c_l128_c13_19f3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l128_c13_19f3_cond,
MUX_uxn_c_l128_c13_19f3_iftrue,
MUX_uxn_c_l128_c13_19f3_iffalse,
MUX_uxn_c_l128_c13_19f3_return_output);

-- MUX_uxn_c_l129_c13_a0f6
MUX_uxn_c_l129_c13_a0f6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l129_c13_a0f6_cond,
MUX_uxn_c_l129_c13_a0f6_iftrue,
MUX_uxn_c_l129_c13_a0f6_iffalse,
MUX_uxn_c_l129_c13_a0f6_return_output);

-- BIN_OP_EQ_uxn_c_l135_c19_9029
BIN_OP_EQ_uxn_c_l135_c19_9029 : entity work.BIN_OP_EQ_uint32_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l135_c19_9029_left,
BIN_OP_EQ_uxn_c_l135_c19_9029_right,
BIN_OP_EQ_uxn_c_l135_c19_9029_return_output);

-- MUX_uxn_c_l135_c19_72e8
MUX_uxn_c_l135_c19_72e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l135_c19_72e8_cond,
MUX_uxn_c_l135_c19_72e8_iftrue,
MUX_uxn_c_l135_c19_72e8_iffalse,
MUX_uxn_c_l135_c19_72e8_return_output);

-- BIN_OP_GT_uxn_c_l137_c17_2249
BIN_OP_GT_uxn_c_l137_c17_2249 : entity work.BIN_OP_GT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_c_l137_c17_2249_left,
BIN_OP_GT_uxn_c_l137_c17_2249_right,
BIN_OP_GT_uxn_c_l137_c17_2249_return_output);

-- BIN_OP_LT_uxn_c_l138_c17_96af
BIN_OP_LT_uxn_c_l138_c17_96af : entity work.BIN_OP_LT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_LT_uxn_c_l138_c17_96af_left,
BIN_OP_LT_uxn_c_l138_c17_96af_right,
BIN_OP_LT_uxn_c_l138_c17_96af_return_output);

-- BIN_OP_GT_uxn_c_l139_c17_11c2
BIN_OP_GT_uxn_c_l139_c17_11c2 : entity work.BIN_OP_GT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_c_l139_c17_11c2_left,
BIN_OP_GT_uxn_c_l139_c17_11c2_right,
BIN_OP_GT_uxn_c_l139_c17_11c2_return_output);

-- BIN_OP_LT_uxn_c_l140_c17_c710
BIN_OP_LT_uxn_c_l140_c17_c710 : entity work.BIN_OP_LT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_LT_uxn_c_l140_c17_c710_left,
BIN_OP_LT_uxn_c_l140_c17_c710_right,
BIN_OP_LT_uxn_c_l140_c17_c710_return_output);

-- BIN_OP_AND_uxn_c_l142_c18_7758
BIN_OP_AND_uxn_c_l142_c18_7758 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l142_c18_7758_left,
BIN_OP_AND_uxn_c_l142_c18_7758_right,
BIN_OP_AND_uxn_c_l142_c18_7758_return_output);

-- BIN_OP_AND_uxn_c_l142_c18_94a5
BIN_OP_AND_uxn_c_l142_c18_94a5 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l142_c18_94a5_left,
BIN_OP_AND_uxn_c_l142_c18_94a5_right,
BIN_OP_AND_uxn_c_l142_c18_94a5_return_output);

-- BIN_OP_AND_uxn_c_l142_c18_387c
BIN_OP_AND_uxn_c_l142_c18_387c : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l142_c18_387c_left,
BIN_OP_AND_uxn_c_l142_c18_387c_right,
BIN_OP_AND_uxn_c_l142_c18_387c_return_output);

-- BIN_OP_AND_uxn_c_l142_c18_7f2c
BIN_OP_AND_uxn_c_l142_c18_7f2c : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l142_c18_7f2c_left,
BIN_OP_AND_uxn_c_l142_c18_7f2c_right,
BIN_OP_AND_uxn_c_l142_c18_7f2c_return_output);

-- UNARY_OP_NOT_uxn_c_l143_c37_336a
UNARY_OP_NOT_uxn_c_l143_c37_336a : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l143_c37_336a_expr,
UNARY_OP_NOT_uxn_c_l143_c37_336a_return_output);

-- BIN_OP_AND_uxn_c_l143_c19_3077
BIN_OP_AND_uxn_c_l143_c19_3077 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l143_c19_3077_left,
BIN_OP_AND_uxn_c_l143_c19_3077_right,
BIN_OP_AND_uxn_c_l143_c19_3077_return_output);

-- BIN_OP_AND_uxn_c_l144_c19_3d48
BIN_OP_AND_uxn_c_l144_c19_3d48 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l144_c19_3d48_left,
BIN_OP_AND_uxn_c_l144_c19_3d48_right,
BIN_OP_AND_uxn_c_l144_c19_3d48_return_output);

-- MUX_uxn_c_l148_c37_5fe0
MUX_uxn_c_l148_c37_5fe0 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
MUX_uxn_c_l148_c37_5fe0_cond,
MUX_uxn_c_l148_c37_5fe0_iftrue,
MUX_uxn_c_l148_c37_5fe0_iffalse,
MUX_uxn_c_l148_c37_5fe0_return_output);

-- MUX_uxn_c_l148_c3_0d39
MUX_uxn_c_l148_c3_0d39 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
MUX_uxn_c_l148_c3_0d39_cond,
MUX_uxn_c_l148_c3_0d39_iftrue,
MUX_uxn_c_l148_c3_0d39_iffalse,
MUX_uxn_c_l148_c3_0d39_return_output);

-- MUX_uxn_c_l149_c3_348a
MUX_uxn_c_l149_c3_348a : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
MUX_uxn_c_l149_c3_348a_cond,
MUX_uxn_c_l149_c3_348a_iftrue,
MUX_uxn_c_l149_c3_348a_iffalse,
MUX_uxn_c_l149_c3_348a_return_output);

-- UNARY_OP_NOT_uxn_c_l150_c57_e815
UNARY_OP_NOT_uxn_c_l150_c57_e815 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l150_c57_e815_expr,
UNARY_OP_NOT_uxn_c_l150_c57_e815_return_output);

-- BIN_OP_AND_uxn_c_l150_c22_e5fa
BIN_OP_AND_uxn_c_l150_c22_e5fa : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l150_c22_e5fa_left,
BIN_OP_AND_uxn_c_l150_c22_e5fa_right,
BIN_OP_AND_uxn_c_l150_c22_e5fa_return_output);

-- BIN_OP_OR_uxn_c_l150_c3_126b
BIN_OP_OR_uxn_c_l150_c3_126b : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l150_c3_126b_left,
BIN_OP_OR_uxn_c_l150_c3_126b_right,
BIN_OP_OR_uxn_c_l150_c3_126b_return_output);

-- bg_vram_update_uxn_c_l146_c19_c372
bg_vram_update_uxn_c_l146_c19_c372 : entity work.bg_vram_update_0CLK_b45f1687 port map (
clk,
bg_vram_update_uxn_c_l146_c19_c372_CLOCK_ENABLE,
bg_vram_update_uxn_c_l146_c19_c372_read_address,
bg_vram_update_uxn_c_l146_c19_c372_write_address,
bg_vram_update_uxn_c_l146_c19_c372_write_value,
bg_vram_update_uxn_c_l146_c19_c372_write_enable,
bg_vram_update_uxn_c_l146_c19_c372_return_output);

-- MUX_uxn_c_l155_c37_4246
MUX_uxn_c_l155_c37_4246 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
MUX_uxn_c_l155_c37_4246_cond,
MUX_uxn_c_l155_c37_4246_iftrue,
MUX_uxn_c_l155_c37_4246_iffalse,
MUX_uxn_c_l155_c37_4246_return_output);

-- MUX_uxn_c_l155_c3_5278
MUX_uxn_c_l155_c3_5278 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
MUX_uxn_c_l155_c3_5278_cond,
MUX_uxn_c_l155_c3_5278_iftrue,
MUX_uxn_c_l155_c3_5278_iffalse,
MUX_uxn_c_l155_c3_5278_return_output);

-- MUX_uxn_c_l156_c3_eabd
MUX_uxn_c_l156_c3_eabd : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
MUX_uxn_c_l156_c3_eabd_cond,
MUX_uxn_c_l156_c3_eabd_iftrue,
MUX_uxn_c_l156_c3_eabd_iffalse,
MUX_uxn_c_l156_c3_eabd_return_output);

-- BIN_OP_AND_uxn_c_l157_c22_a2bb
BIN_OP_AND_uxn_c_l157_c22_a2bb : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l157_c22_a2bb_left,
BIN_OP_AND_uxn_c_l157_c22_a2bb_right,
BIN_OP_AND_uxn_c_l157_c22_a2bb_return_output);

-- BIN_OP_OR_uxn_c_l157_c3_1b7f
BIN_OP_OR_uxn_c_l157_c3_1b7f : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l157_c3_1b7f_left,
BIN_OP_OR_uxn_c_l157_c3_1b7f_right,
BIN_OP_OR_uxn_c_l157_c3_1b7f_return_output);

-- fg_vram_update_uxn_c_l153_c19_2755
fg_vram_update_uxn_c_l153_c19_2755 : entity work.fg_vram_update_0CLK_b45f1687 port map (
clk,
fg_vram_update_uxn_c_l153_c19_2755_CLOCK_ENABLE,
fg_vram_update_uxn_c_l153_c19_2755_read_address,
fg_vram_update_uxn_c_l153_c19_2755_write_address,
fg_vram_update_uxn_c_l153_c19_2755_write_value,
fg_vram_update_uxn_c_l153_c19_2755_write_enable,
fg_vram_update_uxn_c_l153_c19_2755_return_output);

-- BIN_OP_EQ_uxn_c_l161_c6_4ddc
BIN_OP_EQ_uxn_c_l161_c6_4ddc : entity work.BIN_OP_EQ_uint32_t_uint18_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l161_c6_4ddc_left,
BIN_OP_EQ_uxn_c_l161_c6_4ddc_right,
BIN_OP_EQ_uxn_c_l161_c6_4ddc_return_output);

-- pixel_counter_MUX_uxn_c_l161_c2_60dd
pixel_counter_MUX_uxn_c_l161_c2_60dd : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
pixel_counter_MUX_uxn_c_l161_c2_60dd_cond,
pixel_counter_MUX_uxn_c_l161_c2_60dd_iftrue,
pixel_counter_MUX_uxn_c_l161_c2_60dd_iffalse,
pixel_counter_MUX_uxn_c_l161_c2_60dd_return_output);

-- fill_pixels_remaining_MUX_uxn_c_l161_c2_60dd
fill_pixels_remaining_MUX_uxn_c_l161_c2_60dd : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
fill_pixels_remaining_MUX_uxn_c_l161_c2_60dd_cond,
fill_pixels_remaining_MUX_uxn_c_l161_c2_60dd_iftrue,
fill_pixels_remaining_MUX_uxn_c_l161_c2_60dd_iffalse,
fill_pixels_remaining_MUX_uxn_c_l161_c2_60dd_return_output);

-- pixel_counter_MUX_uxn_c_l163_c9_6f5c
pixel_counter_MUX_uxn_c_l163_c9_6f5c : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
pixel_counter_MUX_uxn_c_l163_c9_6f5c_cond,
pixel_counter_MUX_uxn_c_l163_c9_6f5c_iftrue,
pixel_counter_MUX_uxn_c_l163_c9_6f5c_iffalse,
pixel_counter_MUX_uxn_c_l163_c9_6f5c_return_output);

-- fill_pixels_remaining_MUX_uxn_c_l163_c9_6f5c
fill_pixels_remaining_MUX_uxn_c_l163_c9_6f5c : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
fill_pixels_remaining_MUX_uxn_c_l163_c9_6f5c_cond,
fill_pixels_remaining_MUX_uxn_c_l163_c9_6f5c_iftrue,
fill_pixels_remaining_MUX_uxn_c_l163_c9_6f5c_iffalse,
fill_pixels_remaining_MUX_uxn_c_l163_c9_6f5c_return_output);

-- BIN_OP_PLUS_uxn_c_l164_c3_b1e2
BIN_OP_PLUS_uxn_c_l164_c3_b1e2 : entity work.BIN_OP_PLUS_uint32_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l164_c3_b1e2_left,
BIN_OP_PLUS_uxn_c_l164_c3_b1e2_right,
BIN_OP_PLUS_uxn_c_l164_c3_b1e2_return_output);

-- BIN_OP_EQ_uxn_c_l165_c27_0081
BIN_OP_EQ_uxn_c_l165_c27_0081 : entity work.BIN_OP_EQ_uint32_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l165_c27_0081_left,
BIN_OP_EQ_uxn_c_l165_c27_0081_right,
BIN_OP_EQ_uxn_c_l165_c27_0081_return_output);

-- BIN_OP_MINUS_uxn_c_l165_c60_c313
BIN_OP_MINUS_uxn_c_l165_c60_c313 : entity work.BIN_OP_MINUS_uint32_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l165_c60_c313_left,
BIN_OP_MINUS_uxn_c_l165_c60_c313_right,
BIN_OP_MINUS_uxn_c_l165_c60_c313_return_output);

-- MUX_uxn_c_l165_c27_1f4b
MUX_uxn_c_l165_c27_1f4b : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
MUX_uxn_c_l165_c27_1f4b_cond,
MUX_uxn_c_l165_c27_1f4b_iftrue,
MUX_uxn_c_l165_c27_1f4b_iffalse,
MUX_uxn_c_l165_c27_1f4b_return_output);

-- BIN_OP_EQ_uxn_c_l168_c17_0f65
BIN_OP_EQ_uxn_c_l168_c17_0f65 : entity work.BIN_OP_EQ_uint2_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l168_c17_0f65_left,
BIN_OP_EQ_uxn_c_l168_c17_0f65_right,
BIN_OP_EQ_uxn_c_l168_c17_0f65_return_output);

-- MUX_uxn_c_l168_c17_91b9
MUX_uxn_c_l168_c17_91b9 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
MUX_uxn_c_l168_c17_91b9_cond,
MUX_uxn_c_l168_c17_91b9_iftrue,
MUX_uxn_c_l168_c17_91b9_iffalse,
MUX_uxn_c_l168_c17_91b9_return_output);

-- UNARY_OP_NOT_uint1_t_uxn_c_l157_l150_DUPLICATE_30fb
UNARY_OP_NOT_uint1_t_uxn_c_l157_l150_DUPLICATE_30fb : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uint1_t_uxn_c_l157_l150_DUPLICATE_30fb_expr,
UNARY_OP_NOT_uint1_t_uxn_c_l157_l150_DUPLICATE_30fb_return_output);

-- BIN_OP_AND_uint1_t_uint1_t_uxn_c_l150_l157_DUPLICATE_caa2
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l150_l157_DUPLICATE_caa2 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l150_l157_DUPLICATE_caa2_left,
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l150_l157_DUPLICATE_caa2_right,
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l150_l157_DUPLICATE_caa2_return_output);



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
 BIN_OP_GT_uxn_c_l112_c26_d2ec_return_output,
 MUX_uxn_c_l112_c26_ae14_return_output,
 CONST_SR_28_uxn_c_l113_c24_e4f3_return_output,
 BIN_OP_EQ_uxn_c_l114_c17_4089_return_output,
 MUX_uxn_c_l114_c17_bf00_return_output,
 BIN_OP_DIV_uxn_c_l115_c6_6b6b_return_output,
 BIN_OP_INFERRED_MULT_uxn_c_l116_c23_f760_return_output,
 BIN_OP_MINUS_uxn_c_l116_c6_678c_return_output,
 UNARY_OP_NOT_uxn_c_l119_c22_c1ba_return_output,
 BIN_OP_AND_uxn_c_l119_c6_da4f_return_output,
 fill_x1_MUX_uxn_c_l119_c2_040d_return_output,
 fill_pixels_remaining_MUX_uxn_c_l119_c2_040d_return_output,
 is_fill_top_MUX_uxn_c_l119_c2_040d_return_output,
 fill_x0_MUX_uxn_c_l119_c2_040d_return_output,
 is_fill_left_MUX_uxn_c_l119_c2_040d_return_output,
 fill_layer_MUX_uxn_c_l119_c2_040d_return_output,
 fill_y0_MUX_uxn_c_l119_c2_040d_return_output,
 fill_y1_MUX_uxn_c_l119_c2_040d_return_output,
 fill_color_MUX_uxn_c_l119_c2_040d_return_output,
 CONST_SR_20_uxn_c_l121_c18_a36f_return_output,
 CONST_SR_21_uxn_c_l122_c17_9d6e_return_output,
 BIN_OP_AND_uxn_c_l123_c27_ed0e_return_output,
 BIN_OP_DIV_uxn_c_l124_c13_def2_return_output,
 BIN_OP_INFERRED_MULT_uxn_c_l125_c38_417a_return_output,
 BIN_OP_MINUS_uxn_c_l125_c13_ce2f_return_output,
 MUX_uxn_c_l126_c13_876b_return_output,
 MUX_uxn_c_l127_c13_5e6c_return_output,
 MUX_uxn_c_l128_c13_19f3_return_output,
 MUX_uxn_c_l129_c13_a0f6_return_output,
 BIN_OP_EQ_uxn_c_l135_c19_9029_return_output,
 MUX_uxn_c_l135_c19_72e8_return_output,
 BIN_OP_GT_uxn_c_l137_c17_2249_return_output,
 BIN_OP_LT_uxn_c_l138_c17_96af_return_output,
 BIN_OP_GT_uxn_c_l139_c17_11c2_return_output,
 BIN_OP_LT_uxn_c_l140_c17_c710_return_output,
 BIN_OP_AND_uxn_c_l142_c18_7758_return_output,
 BIN_OP_AND_uxn_c_l142_c18_94a5_return_output,
 BIN_OP_AND_uxn_c_l142_c18_387c_return_output,
 BIN_OP_AND_uxn_c_l142_c18_7f2c_return_output,
 UNARY_OP_NOT_uxn_c_l143_c37_336a_return_output,
 BIN_OP_AND_uxn_c_l143_c19_3077_return_output,
 BIN_OP_AND_uxn_c_l144_c19_3d48_return_output,
 MUX_uxn_c_l148_c37_5fe0_return_output,
 MUX_uxn_c_l148_c3_0d39_return_output,
 MUX_uxn_c_l149_c3_348a_return_output,
 UNARY_OP_NOT_uxn_c_l150_c57_e815_return_output,
 BIN_OP_AND_uxn_c_l150_c22_e5fa_return_output,
 BIN_OP_OR_uxn_c_l150_c3_126b_return_output,
 bg_vram_update_uxn_c_l146_c19_c372_return_output,
 MUX_uxn_c_l155_c37_4246_return_output,
 MUX_uxn_c_l155_c3_5278_return_output,
 MUX_uxn_c_l156_c3_eabd_return_output,
 BIN_OP_AND_uxn_c_l157_c22_a2bb_return_output,
 BIN_OP_OR_uxn_c_l157_c3_1b7f_return_output,
 fg_vram_update_uxn_c_l153_c19_2755_return_output,
 BIN_OP_EQ_uxn_c_l161_c6_4ddc_return_output,
 pixel_counter_MUX_uxn_c_l161_c2_60dd_return_output,
 fill_pixels_remaining_MUX_uxn_c_l161_c2_60dd_return_output,
 pixel_counter_MUX_uxn_c_l163_c9_6f5c_return_output,
 fill_pixels_remaining_MUX_uxn_c_l163_c9_6f5c_return_output,
 BIN_OP_PLUS_uxn_c_l164_c3_b1e2_return_output,
 BIN_OP_EQ_uxn_c_l165_c27_0081_return_output,
 BIN_OP_MINUS_uxn_c_l165_c60_c313_return_output,
 MUX_uxn_c_l165_c27_1f4b_return_output,
 BIN_OP_EQ_uxn_c_l168_c17_0f65_return_output,
 MUX_uxn_c_l168_c17_91b9_return_output,
 UNARY_OP_NOT_uint1_t_uxn_c_l157_l150_DUPLICATE_30fb_return_output,
 BIN_OP_AND_uint1_t_uint1_t_uxn_c_l150_l157_DUPLICATE_caa2_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : gpu_step_result_t;
 variable VAR_is_active_drawing_area : unsigned(0 downto 0);
 variable VAR_is_vram_write : unsigned(0 downto 0);
 variable VAR_vram_write_layer : unsigned(0 downto 0);
 variable VAR_vram_address : unsigned(31 downto 0);
 variable VAR_vram_value : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l112_c26_ae14_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l112_c26_ae14_iftrue : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l112_c26_ae14_iffalse : unsigned(31 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l112_c26_d2ec_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l112_c26_d2ec_right : unsigned(17 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l112_c26_d2ec_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l112_c26_ae14_return_output : unsigned(31 downto 0);
 variable VAR_CONST_SR_28_uxn_c_l113_c24_e4f3_return_output : unsigned(31 downto 0);
 variable VAR_CONST_SR_28_uxn_c_l113_c24_e4f3_x : unsigned(31 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_c_l113_c14_1d32_return_output : unsigned(3 downto 0);
 variable VAR_MUX_uxn_c_l114_c17_bf00_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l114_c17_bf00_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l114_c17_bf00_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l114_c17_4089_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l114_c17_4089_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l114_c17_4089_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l114_c17_bf00_return_output : unsigned(0 downto 0);
 variable VAR_y_uxn_c_l115_c2_7171 : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_c_l115_c6_6b6b_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_DIV_uxn_c_l115_c6_6b6b_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_DIV_uxn_c_l115_c6_6b6b_return_output : unsigned(31 downto 0);
 variable VAR_x_uxn_c_l116_c2_4f9d : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l116_c6_678c_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l116_c23_f760_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l116_c23_f760_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l116_c23_f760_return_output : unsigned(24 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l116_c6_678c_right : unsigned(24 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l116_c6_678c_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l119_c6_da4f_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l119_c22_c1ba_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l119_c22_c1ba_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l119_c6_da4f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l119_c6_da4f_return_output : unsigned(0 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l119_c2_040d_iftrue : unsigned(15 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l119_c2_040d_iffalse : unsigned(15 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l119_c2_040d_return_output : unsigned(15 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l119_c2_040d_cond : unsigned(0 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l119_c2_040d_iftrue : unsigned(31 downto 0);
 variable VAR_fill_pixels_remaining_uxn_c_l132_c3_aa7f : unsigned(31 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l119_c2_040d_iffalse : unsigned(31 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l119_c2_040d_return_output : unsigned(31 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l119_c2_040d_cond : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l119_c2_040d_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_top_uxn_c_l122_c3_d0a2 : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l119_c2_040d_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l119_c2_040d_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l119_c2_040d_cond : unsigned(0 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l119_c2_040d_iftrue : unsigned(15 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l119_c2_040d_iffalse : unsigned(15 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l119_c2_040d_return_output : unsigned(15 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l119_c2_040d_cond : unsigned(0 downto 0);
 variable VAR_is_fill_left_MUX_uxn_c_l119_c2_040d_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_left_uxn_c_l121_c3_7446 : unsigned(0 downto 0);
 variable VAR_is_fill_left_MUX_uxn_c_l119_c2_040d_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_left_MUX_uxn_c_l119_c2_040d_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_left_MUX_uxn_c_l119_c2_040d_cond : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l119_c2_040d_iftrue : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l119_c2_040d_iffalse : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l119_c2_040d_return_output : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l119_c2_040d_cond : unsigned(0 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l119_c2_040d_iftrue : unsigned(15 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l119_c2_040d_iffalse : unsigned(15 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l119_c2_040d_return_output : unsigned(15 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l119_c2_040d_cond : unsigned(0 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l119_c2_040d_iftrue : unsigned(15 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l119_c2_040d_iffalse : unsigned(15 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l119_c2_040d_return_output : unsigned(15 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l119_c2_040d_cond : unsigned(0 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l119_c2_040d_iftrue : unsigned(1 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l119_c2_040d_iffalse : unsigned(1 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l119_c2_040d_return_output : unsigned(1 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l119_c2_040d_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_20_uxn_c_l121_c18_a36f_return_output : unsigned(31 downto 0);
 variable VAR_CONST_SR_20_uxn_c_l121_c18_a36f_x : unsigned(31 downto 0);
 variable VAR_CONST_SR_21_uxn_c_l122_c17_9d6e_return_output : unsigned(31 downto 0);
 variable VAR_CONST_SR_21_uxn_c_l122_c17_9d6e_x : unsigned(31 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l123_c27_ed0e_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l123_c27_ed0e_right : unsigned(17 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l123_c27_ed0e_return_output : unsigned(31 downto 0);
 variable VAR_fill_y0_uxn_c_l124_c3_2330 : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_c_l124_c13_def2_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_DIV_uxn_c_l124_c13_def2_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_DIV_uxn_c_l124_c13_def2_return_output : unsigned(31 downto 0);
 variable VAR_fill_x0_uxn_c_l125_c3_95ec : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l125_c13_ce2f_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l125_c38_417a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l125_c38_417a_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l125_c38_417a_return_output : unsigned(24 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l125_c13_ce2f_right : unsigned(24 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l125_c13_ce2f_return_output : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l126_c13_876b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l126_c13_876b_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l126_c13_876b_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l126_c13_876b_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l127_c13_5e6c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l127_c13_5e6c_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l127_c13_5e6c_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l127_c13_5e6c_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l128_c13_19f3_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l128_c13_19f3_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l128_c13_19f3_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l128_c13_19f3_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l129_c13_a0f6_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l129_c13_a0f6_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l129_c13_a0f6_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l129_c13_a0f6_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l135_c19_72e8_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l135_c19_72e8_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l135_c19_72e8_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l135_c19_9029_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l135_c19_9029_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l135_c19_9029_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l135_c19_72e8_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l137_c17_2249_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l137_c17_2249_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l137_c17_2249_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_LT_uxn_c_l138_c17_96af_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_c_l138_c17_96af_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_c_l138_c17_96af_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l139_c17_11c2_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l139_c17_11c2_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l139_c17_11c2_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_LT_uxn_c_l140_c17_c710_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_c_l140_c17_c710_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_c_l140_c17_c710_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l142_c18_7758_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l142_c18_7758_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l142_c18_7758_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l142_c18_94a5_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l142_c18_94a5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l142_c18_94a5_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l142_c18_387c_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l142_c18_387c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l142_c18_387c_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l142_c18_7f2c_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l142_c18_7f2c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l142_c18_7f2c_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l143_c19_3077_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l143_c37_336a_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l143_c37_336a_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l143_c19_3077_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l143_c19_3077_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l144_c19_3d48_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l144_c19_3d48_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l144_c19_3d48_return_output : unsigned(0 downto 0);
 variable VAR_bg_vram_update_uxn_c_l146_c19_c372_read_address : unsigned(31 downto 0);
 variable VAR_bg_vram_update_uxn_c_l146_c19_c372_write_address : unsigned(31 downto 0);
 variable VAR_bg_vram_update_uxn_c_l146_c19_c372_write_value : unsigned(1 downto 0);
 variable VAR_bg_vram_update_uxn_c_l146_c19_c372_write_enable : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l148_c3_0d39_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l148_c3_0d39_iftrue : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l148_c3_0d39_iffalse : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l148_c37_5fe0_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l148_c37_5fe0_iftrue : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l148_c37_5fe0_iffalse : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l148_c37_5fe0_return_output : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l148_c3_0d39_return_output : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l149_c3_348a_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l149_c3_348a_iftrue : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l149_c3_348a_iffalse : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l149_c3_348a_return_output : unsigned(1 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l150_c3_126b_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l150_c22_e5fa_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l150_c57_e815_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l150_c57_e815_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l150_c22_e5fa_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l150_c22_e5fa_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l150_c3_126b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l150_c3_126b_return_output : unsigned(0 downto 0);
 variable VAR_bg_vram_update_uxn_c_l146_c19_c372_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_bg_vram_update_uxn_c_l146_c19_c372_return_output : unsigned(1 downto 0);
 variable VAR_fg_vram_update_uxn_c_l153_c19_2755_read_address : unsigned(31 downto 0);
 variable VAR_fg_vram_update_uxn_c_l153_c19_2755_write_address : unsigned(31 downto 0);
 variable VAR_fg_vram_update_uxn_c_l153_c19_2755_write_value : unsigned(1 downto 0);
 variable VAR_fg_vram_update_uxn_c_l153_c19_2755_write_enable : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l155_c3_5278_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l155_c3_5278_iftrue : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l155_c3_5278_iffalse : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l155_c37_4246_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l155_c37_4246_iftrue : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l155_c37_4246_iffalse : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l155_c37_4246_return_output : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l155_c3_5278_return_output : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l156_c3_eabd_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l156_c3_eabd_iftrue : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l156_c3_eabd_iffalse : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l156_c3_eabd_return_output : unsigned(1 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l157_c3_1b7f_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l157_c22_a2bb_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l157_c22_a2bb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l157_c22_a2bb_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l157_c3_1b7f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l157_c3_1b7f_return_output : unsigned(0 downto 0);
 variable VAR_fg_vram_update_uxn_c_l153_c19_2755_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_fg_vram_update_uxn_c_l153_c19_2755_return_output : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l161_c6_4ddc_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l161_c6_4ddc_right : unsigned(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l161_c6_4ddc_return_output : unsigned(0 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l161_c2_60dd_iftrue : unsigned(31 downto 0);
 variable VAR_pixel_counter_uxn_c_l162_c3_3d3b : unsigned(31 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l161_c2_60dd_iffalse : unsigned(31 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l163_c9_6f5c_return_output : unsigned(31 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l161_c2_60dd_return_output : unsigned(31 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l161_c2_60dd_cond : unsigned(0 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l161_c2_60dd_iftrue : unsigned(31 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l161_c2_60dd_iffalse : unsigned(31 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l163_c9_6f5c_return_output : unsigned(31 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l161_c2_60dd_return_output : unsigned(31 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l161_c2_60dd_cond : unsigned(0 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l163_c9_6f5c_iftrue : unsigned(31 downto 0);
 variable VAR_pixel_counter_uxn_c_l164_c3_8f49 : unsigned(31 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l163_c9_6f5c_iffalse : unsigned(31 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l163_c9_6f5c_cond : unsigned(0 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l163_c9_6f5c_iftrue : unsigned(31 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l163_c9_6f5c_iffalse : unsigned(31 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l163_c9_6f5c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l164_c3_b1e2_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l164_c3_b1e2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l164_c3_b1e2_return_output : unsigned(32 downto 0);
 variable VAR_MUX_uxn_c_l165_c27_1f4b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l165_c27_1f4b_iftrue : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l165_c27_1f4b_iffalse : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l165_c27_0081_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l165_c27_0081_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l165_c27_0081_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l165_c60_c313_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l165_c60_c313_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l165_c60_c313_return_output : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l165_c27_1f4b_return_output : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l168_c17_91b9_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l168_c17_91b9_iftrue : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l168_c17_91b9_iffalse : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l168_c17_0f65_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l168_c17_0f65_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l168_c17_0f65_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l168_c17_91b9_return_output : unsigned(1 downto 0);
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_c_l157_l150_DUPLICATE_30fb_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_c_l157_l150_DUPLICATE_30fb_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l150_l157_DUPLICATE_caa2_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l150_l157_DUPLICATE_caa2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l150_l157_DUPLICATE_caa2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_6984_uxn_c_l97_l171_DUPLICATE_f349_return_output : gpu_step_result_t;
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
     VAR_MUX_uxn_c_l165_c27_1f4b_iftrue := resize(to_unsigned(0, 1), 32);
     VAR_MUX_uxn_c_l129_c13_a0f6_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_BIN_OP_GT_uxn_c_l112_c26_d2ec_right := to_unsigned(143999, 18);
     VAR_MUX_uxn_c_l112_c26_ae14_iftrue := resize(to_unsigned(0, 1), 32);
     VAR_fill_pixels_remaining_uxn_c_l132_c3_aa7f := resize(to_unsigned(143999, 18), 32);
     VAR_fill_pixels_remaining_MUX_uxn_c_l119_c2_040d_iftrue := VAR_fill_pixels_remaining_uxn_c_l132_c3_aa7f;
     VAR_MUX_uxn_c_l148_c37_5fe0_iftrue := resize(to_unsigned(0, 1), 32);
     VAR_BIN_OP_DIV_uxn_c_l124_c13_def2_right := to_unsigned(400, 9);
     VAR_BIN_OP_EQ_uxn_c_l161_c6_4ddc_right := to_unsigned(143999, 18);
     VAR_MUX_uxn_c_l126_c13_876b_iffalse := resize(to_unsigned(359, 9), 16);
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l125_c38_417a_right := to_unsigned(400, 9);
     VAR_pixel_counter_uxn_c_l162_c3_3d3b := resize(to_unsigned(0, 1), 32);
     VAR_pixel_counter_MUX_uxn_c_l161_c2_60dd_iftrue := VAR_pixel_counter_uxn_c_l162_c3_3d3b;
     VAR_BIN_OP_MINUS_uxn_c_l165_c60_c313_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l165_c27_0081_right := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_c_l123_c27_ed0e_right := to_unsigned(262143, 18);
     VAR_MUX_uxn_c_l155_c37_4246_iftrue := resize(to_unsigned(0, 1), 32);
     VAR_MUX_uxn_c_l114_c17_bf00_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l135_c19_72e8_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_c_l164_c3_b1e2_right := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l135_c19_72e8_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l114_c17_bf00_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l127_c13_5e6c_iffalse := resize(to_unsigned(399, 9), 16);
     VAR_BIN_OP_DIV_uxn_c_l115_c6_6b6b_right := to_unsigned(400, 9);
     VAR_MUX_uxn_c_l128_c13_19f3_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_BIN_OP_EQ_uxn_c_l114_c17_4089_right := to_unsigned(15, 4);
     VAR_BIN_OP_EQ_uxn_c_l168_c17_0f65_right := to_unsigned(0, 1);
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l116_c23_f760_right := to_unsigned(400, 9);
     VAR_BIN_OP_EQ_uxn_c_l135_c19_9029_right := to_unsigned(0, 1);

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
     VAR_bg_vram_update_uxn_c_l146_c19_c372_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_fg_vram_update_uxn_c_l153_c19_2755_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_fill_color_MUX_uxn_c_l119_c2_040d_iffalse := fill_color;
     VAR_fill_layer_MUX_uxn_c_l119_c2_040d_iffalse := fill_layer;
     VAR_fill_pixels_remaining_MUX_uxn_c_l119_c2_040d_iffalse := fill_pixels_remaining;
     VAR_fill_x0_MUX_uxn_c_l119_c2_040d_iffalse := fill_x0;
     VAR_fill_x1_MUX_uxn_c_l119_c2_040d_iffalse := fill_x1;
     VAR_fill_y0_MUX_uxn_c_l119_c2_040d_iffalse := fill_y0;
     VAR_fill_y1_MUX_uxn_c_l119_c2_040d_iffalse := fill_y1;
     VAR_fill_pixels_remaining_MUX_uxn_c_l163_c9_6f5c_cond := VAR_is_active_drawing_area;
     VAR_pixel_counter_MUX_uxn_c_l163_c9_6f5c_cond := VAR_is_active_drawing_area;
     VAR_UNARY_OP_NOT_uxn_c_l119_c22_c1ba_expr := is_fill_active;
     VAR_is_fill_left_MUX_uxn_c_l119_c2_040d_iffalse := is_fill_left;
     VAR_is_fill_top_MUX_uxn_c_l119_c2_040d_iffalse := is_fill_top;
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l150_l157_DUPLICATE_caa2_right := VAR_is_vram_write;
     VAR_BIN_OP_DIV_uxn_c_l115_c6_6b6b_left := pixel_counter;
     VAR_BIN_OP_EQ_uxn_c_l161_c6_4ddc_left := pixel_counter;
     VAR_BIN_OP_MINUS_uxn_c_l116_c6_678c_left := pixel_counter;
     VAR_BIN_OP_PLUS_uxn_c_l164_c3_b1e2_left := pixel_counter;
     VAR_MUX_uxn_c_l148_c3_0d39_iftrue := pixel_counter;
     VAR_MUX_uxn_c_l155_c3_5278_iftrue := pixel_counter;
     VAR_bg_vram_update_uxn_c_l146_c19_c372_read_address := pixel_counter;
     VAR_fg_vram_update_uxn_c_l153_c19_2755_read_address := pixel_counter;
     VAR_pixel_counter_MUX_uxn_c_l163_c9_6f5c_iffalse := pixel_counter;
     VAR_BIN_OP_AND_uxn_c_l123_c27_ed0e_left := VAR_vram_address;
     VAR_BIN_OP_GT_uxn_c_l112_c26_d2ec_left := VAR_vram_address;
     VAR_CONST_SR_20_uxn_c_l121_c18_a36f_x := VAR_vram_address;
     VAR_CONST_SR_21_uxn_c_l122_c17_9d6e_x := VAR_vram_address;
     VAR_CONST_SR_28_uxn_c_l113_c24_e4f3_x := VAR_vram_address;
     VAR_MUX_uxn_c_l112_c26_ae14_iffalse := VAR_vram_address;
     VAR_MUX_uxn_c_l149_c3_348a_iffalse := VAR_vram_value;
     VAR_MUX_uxn_c_l156_c3_eabd_iffalse := VAR_vram_value;
     VAR_fill_color_MUX_uxn_c_l119_c2_040d_iftrue := VAR_vram_value;
     VAR_BIN_OP_AND_uxn_c_l157_c22_a2bb_right := VAR_vram_write_layer;
     VAR_UNARY_OP_NOT_uxn_c_l150_c57_e815_expr := VAR_vram_write_layer;
     VAR_fill_layer_MUX_uxn_c_l119_c2_040d_iftrue := VAR_vram_write_layer;
     -- CONST_SR_21[uxn_c_l122_c17_9d6e] LATENCY=0
     -- Inputs
     CONST_SR_21_uxn_c_l122_c17_9d6e_x <= VAR_CONST_SR_21_uxn_c_l122_c17_9d6e_x;
     -- Outputs
     VAR_CONST_SR_21_uxn_c_l122_c17_9d6e_return_output := CONST_SR_21_uxn_c_l122_c17_9d6e_return_output;

     -- BIN_OP_GT[uxn_c_l112_c26_d2ec] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_c_l112_c26_d2ec_left <= VAR_BIN_OP_GT_uxn_c_l112_c26_d2ec_left;
     BIN_OP_GT_uxn_c_l112_c26_d2ec_right <= VAR_BIN_OP_GT_uxn_c_l112_c26_d2ec_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_c_l112_c26_d2ec_return_output := BIN_OP_GT_uxn_c_l112_c26_d2ec_return_output;

     -- UNARY_OP_NOT[uxn_c_l150_c57_e815] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l150_c57_e815_expr <= VAR_UNARY_OP_NOT_uxn_c_l150_c57_e815_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l150_c57_e815_return_output := UNARY_OP_NOT_uxn_c_l150_c57_e815_return_output;

     -- BIN_OP_AND[uxn_c_l123_c27_ed0e] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l123_c27_ed0e_left <= VAR_BIN_OP_AND_uxn_c_l123_c27_ed0e_left;
     BIN_OP_AND_uxn_c_l123_c27_ed0e_right <= VAR_BIN_OP_AND_uxn_c_l123_c27_ed0e_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l123_c27_ed0e_return_output := BIN_OP_AND_uxn_c_l123_c27_ed0e_return_output;

     -- BIN_OP_EQ[uxn_c_l161_c6_4ddc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l161_c6_4ddc_left <= VAR_BIN_OP_EQ_uxn_c_l161_c6_4ddc_left;
     BIN_OP_EQ_uxn_c_l161_c6_4ddc_right <= VAR_BIN_OP_EQ_uxn_c_l161_c6_4ddc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l161_c6_4ddc_return_output := BIN_OP_EQ_uxn_c_l161_c6_4ddc_return_output;

     -- UNARY_OP_NOT[uxn_c_l119_c22_c1ba] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l119_c22_c1ba_expr <= VAR_UNARY_OP_NOT_uxn_c_l119_c22_c1ba_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l119_c22_c1ba_return_output := UNARY_OP_NOT_uxn_c_l119_c22_c1ba_return_output;

     -- BIN_OP_PLUS[uxn_c_l164_c3_b1e2] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l164_c3_b1e2_left <= VAR_BIN_OP_PLUS_uxn_c_l164_c3_b1e2_left;
     BIN_OP_PLUS_uxn_c_l164_c3_b1e2_right <= VAR_BIN_OP_PLUS_uxn_c_l164_c3_b1e2_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l164_c3_b1e2_return_output := BIN_OP_PLUS_uxn_c_l164_c3_b1e2_return_output;

     -- BIN_OP_DIV[uxn_c_l115_c6_6b6b] LATENCY=0
     -- Inputs
     BIN_OP_DIV_uxn_c_l115_c6_6b6b_left <= VAR_BIN_OP_DIV_uxn_c_l115_c6_6b6b_left;
     BIN_OP_DIV_uxn_c_l115_c6_6b6b_right <= VAR_BIN_OP_DIV_uxn_c_l115_c6_6b6b_right;
     -- Outputs
     VAR_BIN_OP_DIV_uxn_c_l115_c6_6b6b_return_output := BIN_OP_DIV_uxn_c_l115_c6_6b6b_return_output;

     -- CONST_SR_20[uxn_c_l121_c18_a36f] LATENCY=0
     -- Inputs
     CONST_SR_20_uxn_c_l121_c18_a36f_x <= VAR_CONST_SR_20_uxn_c_l121_c18_a36f_x;
     -- Outputs
     VAR_CONST_SR_20_uxn_c_l121_c18_a36f_return_output := CONST_SR_20_uxn_c_l121_c18_a36f_return_output;

     -- CONST_SR_28[uxn_c_l113_c24_e4f3] LATENCY=0
     -- Inputs
     CONST_SR_28_uxn_c_l113_c24_e4f3_x <= VAR_CONST_SR_28_uxn_c_l113_c24_e4f3_x;
     -- Outputs
     VAR_CONST_SR_28_uxn_c_l113_c24_e4f3_return_output := CONST_SR_28_uxn_c_l113_c24_e4f3_return_output;

     -- Submodule level 1
     VAR_BIN_OP_DIV_uxn_c_l124_c13_def2_left := VAR_BIN_OP_AND_uxn_c_l123_c27_ed0e_return_output;
     VAR_BIN_OP_MINUS_uxn_c_l125_c13_ce2f_left := VAR_BIN_OP_AND_uxn_c_l123_c27_ed0e_return_output;
     VAR_y_uxn_c_l115_c2_7171 := resize(VAR_BIN_OP_DIV_uxn_c_l115_c6_6b6b_return_output, 16);
     VAR_fill_pixels_remaining_MUX_uxn_c_l161_c2_60dd_cond := VAR_BIN_OP_EQ_uxn_c_l161_c6_4ddc_return_output;
     VAR_pixel_counter_MUX_uxn_c_l161_c2_60dd_cond := VAR_BIN_OP_EQ_uxn_c_l161_c6_4ddc_return_output;
     VAR_MUX_uxn_c_l112_c26_ae14_cond := VAR_BIN_OP_GT_uxn_c_l112_c26_d2ec_return_output;
     VAR_pixel_counter_uxn_c_l164_c3_8f49 := resize(VAR_BIN_OP_PLUS_uxn_c_l164_c3_b1e2_return_output, 32);
     VAR_is_fill_left_uxn_c_l121_c3_7446 := resize(VAR_CONST_SR_20_uxn_c_l121_c18_a36f_return_output, 1);
     VAR_is_fill_top_uxn_c_l122_c3_d0a2 := resize(VAR_CONST_SR_21_uxn_c_l122_c17_9d6e_return_output, 1);
     VAR_BIN_OP_AND_uxn_c_l119_c6_da4f_right := VAR_UNARY_OP_NOT_uxn_c_l119_c22_c1ba_return_output;
     VAR_BIN_OP_AND_uxn_c_l150_c22_e5fa_right := VAR_UNARY_OP_NOT_uxn_c_l150_c57_e815_return_output;
     VAR_MUX_uxn_c_l127_c13_5e6c_cond := VAR_is_fill_left_uxn_c_l121_c3_7446;
     VAR_MUX_uxn_c_l129_c13_a0f6_cond := VAR_is_fill_left_uxn_c_l121_c3_7446;
     VAR_is_fill_left_MUX_uxn_c_l119_c2_040d_iftrue := VAR_is_fill_left_uxn_c_l121_c3_7446;
     VAR_MUX_uxn_c_l126_c13_876b_cond := VAR_is_fill_top_uxn_c_l122_c3_d0a2;
     VAR_MUX_uxn_c_l128_c13_19f3_cond := VAR_is_fill_top_uxn_c_l122_c3_d0a2;
     VAR_is_fill_top_MUX_uxn_c_l119_c2_040d_iftrue := VAR_is_fill_top_uxn_c_l122_c3_d0a2;
     VAR_pixel_counter_MUX_uxn_c_l163_c9_6f5c_iftrue := VAR_pixel_counter_uxn_c_l164_c3_8f49;
     VAR_BIN_OP_GT_uxn_c_l139_c17_11c2_left := VAR_y_uxn_c_l115_c2_7171;
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l116_c23_f760_left := VAR_y_uxn_c_l115_c2_7171;
     VAR_BIN_OP_LT_uxn_c_l140_c17_c710_left := VAR_y_uxn_c_l115_c2_7171;
     REG_VAR_y := VAR_y_uxn_c_l115_c2_7171;
     -- BIN_OP_INFERRED_MULT[uxn_c_l116_c23_f760] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_c_l116_c23_f760_left <= VAR_BIN_OP_INFERRED_MULT_uxn_c_l116_c23_f760_left;
     BIN_OP_INFERRED_MULT_uxn_c_l116_c23_f760_right <= VAR_BIN_OP_INFERRED_MULT_uxn_c_l116_c23_f760_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l116_c23_f760_return_output := BIN_OP_INFERRED_MULT_uxn_c_l116_c23_f760_return_output;

     -- BIN_OP_DIV[uxn_c_l124_c13_def2] LATENCY=0
     -- Inputs
     BIN_OP_DIV_uxn_c_l124_c13_def2_left <= VAR_BIN_OP_DIV_uxn_c_l124_c13_def2_left;
     BIN_OP_DIV_uxn_c_l124_c13_def2_right <= VAR_BIN_OP_DIV_uxn_c_l124_c13_def2_right;
     -- Outputs
     VAR_BIN_OP_DIV_uxn_c_l124_c13_def2_return_output := BIN_OP_DIV_uxn_c_l124_c13_def2_return_output;

     -- pixel_counter_MUX[uxn_c_l163_c9_6f5c] LATENCY=0
     -- Inputs
     pixel_counter_MUX_uxn_c_l163_c9_6f5c_cond <= VAR_pixel_counter_MUX_uxn_c_l163_c9_6f5c_cond;
     pixel_counter_MUX_uxn_c_l163_c9_6f5c_iftrue <= VAR_pixel_counter_MUX_uxn_c_l163_c9_6f5c_iftrue;
     pixel_counter_MUX_uxn_c_l163_c9_6f5c_iffalse <= VAR_pixel_counter_MUX_uxn_c_l163_c9_6f5c_iffalse;
     -- Outputs
     VAR_pixel_counter_MUX_uxn_c_l163_c9_6f5c_return_output := pixel_counter_MUX_uxn_c_l163_c9_6f5c_return_output;

     -- MUX[uxn_c_l112_c26_ae14] LATENCY=0
     -- Inputs
     MUX_uxn_c_l112_c26_ae14_cond <= VAR_MUX_uxn_c_l112_c26_ae14_cond;
     MUX_uxn_c_l112_c26_ae14_iftrue <= VAR_MUX_uxn_c_l112_c26_ae14_iftrue;
     MUX_uxn_c_l112_c26_ae14_iffalse <= VAR_MUX_uxn_c_l112_c26_ae14_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l112_c26_ae14_return_output := MUX_uxn_c_l112_c26_ae14_return_output;

     -- CAST_TO_uint4_t[uxn_c_l113_c14_1d32] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_c_l113_c14_1d32_return_output := CAST_TO_uint4_t_uint32_t(
     VAR_CONST_SR_28_uxn_c_l113_c24_e4f3_return_output);

     -- Submodule level 2
     VAR_fill_y0_uxn_c_l124_c3_2330 := resize(VAR_BIN_OP_DIV_uxn_c_l124_c13_def2_return_output, 16);
     VAR_BIN_OP_MINUS_uxn_c_l116_c6_678c_right := VAR_BIN_OP_INFERRED_MULT_uxn_c_l116_c23_f760_return_output;
     VAR_BIN_OP_EQ_uxn_c_l114_c17_4089_left := VAR_CAST_TO_uint4_t_uxn_c_l113_c14_1d32_return_output;
     REG_VAR_vram_code := VAR_CAST_TO_uint4_t_uxn_c_l113_c14_1d32_return_output;
     VAR_MUX_uxn_c_l148_c37_5fe0_iffalse := VAR_MUX_uxn_c_l112_c26_ae14_return_output;
     VAR_MUX_uxn_c_l155_c37_4246_iffalse := VAR_MUX_uxn_c_l112_c26_ae14_return_output;
     REG_VAR_adjusted_vram_address := VAR_MUX_uxn_c_l112_c26_ae14_return_output;
     VAR_pixel_counter_MUX_uxn_c_l161_c2_60dd_iffalse := VAR_pixel_counter_MUX_uxn_c_l163_c9_6f5c_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l125_c38_417a_left := VAR_fill_y0_uxn_c_l124_c3_2330;
     VAR_MUX_uxn_c_l126_c13_876b_iftrue := VAR_fill_y0_uxn_c_l124_c3_2330;
     VAR_MUX_uxn_c_l128_c13_19f3_iffalse := VAR_fill_y0_uxn_c_l124_c3_2330;
     -- MUX[uxn_c_l126_c13_876b] LATENCY=0
     -- Inputs
     MUX_uxn_c_l126_c13_876b_cond <= VAR_MUX_uxn_c_l126_c13_876b_cond;
     MUX_uxn_c_l126_c13_876b_iftrue <= VAR_MUX_uxn_c_l126_c13_876b_iftrue;
     MUX_uxn_c_l126_c13_876b_iffalse <= VAR_MUX_uxn_c_l126_c13_876b_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l126_c13_876b_return_output := MUX_uxn_c_l126_c13_876b_return_output;

     -- BIN_OP_EQ[uxn_c_l114_c17_4089] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l114_c17_4089_left <= VAR_BIN_OP_EQ_uxn_c_l114_c17_4089_left;
     BIN_OP_EQ_uxn_c_l114_c17_4089_right <= VAR_BIN_OP_EQ_uxn_c_l114_c17_4089_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l114_c17_4089_return_output := BIN_OP_EQ_uxn_c_l114_c17_4089_return_output;

     -- pixel_counter_MUX[uxn_c_l161_c2_60dd] LATENCY=0
     -- Inputs
     pixel_counter_MUX_uxn_c_l161_c2_60dd_cond <= VAR_pixel_counter_MUX_uxn_c_l161_c2_60dd_cond;
     pixel_counter_MUX_uxn_c_l161_c2_60dd_iftrue <= VAR_pixel_counter_MUX_uxn_c_l161_c2_60dd_iftrue;
     pixel_counter_MUX_uxn_c_l161_c2_60dd_iffalse <= VAR_pixel_counter_MUX_uxn_c_l161_c2_60dd_iffalse;
     -- Outputs
     VAR_pixel_counter_MUX_uxn_c_l161_c2_60dd_return_output := pixel_counter_MUX_uxn_c_l161_c2_60dd_return_output;

     -- BIN_OP_MINUS[uxn_c_l116_c6_678c] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l116_c6_678c_left <= VAR_BIN_OP_MINUS_uxn_c_l116_c6_678c_left;
     BIN_OP_MINUS_uxn_c_l116_c6_678c_right <= VAR_BIN_OP_MINUS_uxn_c_l116_c6_678c_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l116_c6_678c_return_output := BIN_OP_MINUS_uxn_c_l116_c6_678c_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_c_l125_c38_417a] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_c_l125_c38_417a_left <= VAR_BIN_OP_INFERRED_MULT_uxn_c_l125_c38_417a_left;
     BIN_OP_INFERRED_MULT_uxn_c_l125_c38_417a_right <= VAR_BIN_OP_INFERRED_MULT_uxn_c_l125_c38_417a_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l125_c38_417a_return_output := BIN_OP_INFERRED_MULT_uxn_c_l125_c38_417a_return_output;

     -- MUX[uxn_c_l128_c13_19f3] LATENCY=0
     -- Inputs
     MUX_uxn_c_l128_c13_19f3_cond <= VAR_MUX_uxn_c_l128_c13_19f3_cond;
     MUX_uxn_c_l128_c13_19f3_iftrue <= VAR_MUX_uxn_c_l128_c13_19f3_iftrue;
     MUX_uxn_c_l128_c13_19f3_iffalse <= VAR_MUX_uxn_c_l128_c13_19f3_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l128_c13_19f3_return_output := MUX_uxn_c_l128_c13_19f3_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_c_l114_c17_bf00_cond := VAR_BIN_OP_EQ_uxn_c_l114_c17_4089_return_output;
     VAR_BIN_OP_MINUS_uxn_c_l125_c13_ce2f_right := VAR_BIN_OP_INFERRED_MULT_uxn_c_l125_c38_417a_return_output;
     VAR_x_uxn_c_l116_c2_4f9d := resize(VAR_BIN_OP_MINUS_uxn_c_l116_c6_678c_return_output, 16);
     VAR_fill_y1_MUX_uxn_c_l119_c2_040d_iftrue := VAR_MUX_uxn_c_l126_c13_876b_return_output;
     VAR_fill_y0_MUX_uxn_c_l119_c2_040d_iftrue := VAR_MUX_uxn_c_l128_c13_19f3_return_output;
     REG_VAR_pixel_counter := VAR_pixel_counter_MUX_uxn_c_l161_c2_60dd_return_output;
     VAR_BIN_OP_GT_uxn_c_l137_c17_2249_left := VAR_x_uxn_c_l116_c2_4f9d;
     VAR_BIN_OP_LT_uxn_c_l138_c17_96af_left := VAR_x_uxn_c_l116_c2_4f9d;
     REG_VAR_x := VAR_x_uxn_c_l116_c2_4f9d;
     -- MUX[uxn_c_l114_c17_bf00] LATENCY=0
     -- Inputs
     MUX_uxn_c_l114_c17_bf00_cond <= VAR_MUX_uxn_c_l114_c17_bf00_cond;
     MUX_uxn_c_l114_c17_bf00_iftrue <= VAR_MUX_uxn_c_l114_c17_bf00_iftrue;
     MUX_uxn_c_l114_c17_bf00_iffalse <= VAR_MUX_uxn_c_l114_c17_bf00_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l114_c17_bf00_return_output := MUX_uxn_c_l114_c17_bf00_return_output;

     -- BIN_OP_MINUS[uxn_c_l125_c13_ce2f] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l125_c13_ce2f_left <= VAR_BIN_OP_MINUS_uxn_c_l125_c13_ce2f_left;
     BIN_OP_MINUS_uxn_c_l125_c13_ce2f_right <= VAR_BIN_OP_MINUS_uxn_c_l125_c13_ce2f_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l125_c13_ce2f_return_output := BIN_OP_MINUS_uxn_c_l125_c13_ce2f_return_output;

     -- Submodule level 4
     VAR_fill_x0_uxn_c_l125_c3_95ec := resize(VAR_BIN_OP_MINUS_uxn_c_l125_c13_ce2f_return_output, 16);
     VAR_BIN_OP_AND_uxn_c_l119_c6_da4f_left := VAR_MUX_uxn_c_l114_c17_bf00_return_output;
     REG_VAR_is_fill_code := VAR_MUX_uxn_c_l114_c17_bf00_return_output;
     VAR_MUX_uxn_c_l127_c13_5e6c_iftrue := VAR_fill_x0_uxn_c_l125_c3_95ec;
     VAR_MUX_uxn_c_l129_c13_a0f6_iffalse := VAR_fill_x0_uxn_c_l125_c3_95ec;
     -- MUX[uxn_c_l127_c13_5e6c] LATENCY=0
     -- Inputs
     MUX_uxn_c_l127_c13_5e6c_cond <= VAR_MUX_uxn_c_l127_c13_5e6c_cond;
     MUX_uxn_c_l127_c13_5e6c_iftrue <= VAR_MUX_uxn_c_l127_c13_5e6c_iftrue;
     MUX_uxn_c_l127_c13_5e6c_iffalse <= VAR_MUX_uxn_c_l127_c13_5e6c_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l127_c13_5e6c_return_output := MUX_uxn_c_l127_c13_5e6c_return_output;

     -- MUX[uxn_c_l129_c13_a0f6] LATENCY=0
     -- Inputs
     MUX_uxn_c_l129_c13_a0f6_cond <= VAR_MUX_uxn_c_l129_c13_a0f6_cond;
     MUX_uxn_c_l129_c13_a0f6_iftrue <= VAR_MUX_uxn_c_l129_c13_a0f6_iftrue;
     MUX_uxn_c_l129_c13_a0f6_iffalse <= VAR_MUX_uxn_c_l129_c13_a0f6_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l129_c13_a0f6_return_output := MUX_uxn_c_l129_c13_a0f6_return_output;

     -- BIN_OP_AND[uxn_c_l119_c6_da4f] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l119_c6_da4f_left <= VAR_BIN_OP_AND_uxn_c_l119_c6_da4f_left;
     BIN_OP_AND_uxn_c_l119_c6_da4f_right <= VAR_BIN_OP_AND_uxn_c_l119_c6_da4f_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l119_c6_da4f_return_output := BIN_OP_AND_uxn_c_l119_c6_da4f_return_output;

     -- Submodule level 5
     VAR_fill_color_MUX_uxn_c_l119_c2_040d_cond := VAR_BIN_OP_AND_uxn_c_l119_c6_da4f_return_output;
     VAR_fill_layer_MUX_uxn_c_l119_c2_040d_cond := VAR_BIN_OP_AND_uxn_c_l119_c6_da4f_return_output;
     VAR_fill_pixels_remaining_MUX_uxn_c_l119_c2_040d_cond := VAR_BIN_OP_AND_uxn_c_l119_c6_da4f_return_output;
     VAR_fill_x0_MUX_uxn_c_l119_c2_040d_cond := VAR_BIN_OP_AND_uxn_c_l119_c6_da4f_return_output;
     VAR_fill_x1_MUX_uxn_c_l119_c2_040d_cond := VAR_BIN_OP_AND_uxn_c_l119_c6_da4f_return_output;
     VAR_fill_y0_MUX_uxn_c_l119_c2_040d_cond := VAR_BIN_OP_AND_uxn_c_l119_c6_da4f_return_output;
     VAR_fill_y1_MUX_uxn_c_l119_c2_040d_cond := VAR_BIN_OP_AND_uxn_c_l119_c6_da4f_return_output;
     VAR_is_fill_left_MUX_uxn_c_l119_c2_040d_cond := VAR_BIN_OP_AND_uxn_c_l119_c6_da4f_return_output;
     VAR_is_fill_top_MUX_uxn_c_l119_c2_040d_cond := VAR_BIN_OP_AND_uxn_c_l119_c6_da4f_return_output;
     VAR_fill_x1_MUX_uxn_c_l119_c2_040d_iftrue := VAR_MUX_uxn_c_l127_c13_5e6c_return_output;
     VAR_fill_x0_MUX_uxn_c_l119_c2_040d_iftrue := VAR_MUX_uxn_c_l129_c13_a0f6_return_output;
     -- fill_x0_MUX[uxn_c_l119_c2_040d] LATENCY=0
     -- Inputs
     fill_x0_MUX_uxn_c_l119_c2_040d_cond <= VAR_fill_x0_MUX_uxn_c_l119_c2_040d_cond;
     fill_x0_MUX_uxn_c_l119_c2_040d_iftrue <= VAR_fill_x0_MUX_uxn_c_l119_c2_040d_iftrue;
     fill_x0_MUX_uxn_c_l119_c2_040d_iffalse <= VAR_fill_x0_MUX_uxn_c_l119_c2_040d_iffalse;
     -- Outputs
     VAR_fill_x0_MUX_uxn_c_l119_c2_040d_return_output := fill_x0_MUX_uxn_c_l119_c2_040d_return_output;

     -- fill_layer_MUX[uxn_c_l119_c2_040d] LATENCY=0
     -- Inputs
     fill_layer_MUX_uxn_c_l119_c2_040d_cond <= VAR_fill_layer_MUX_uxn_c_l119_c2_040d_cond;
     fill_layer_MUX_uxn_c_l119_c2_040d_iftrue <= VAR_fill_layer_MUX_uxn_c_l119_c2_040d_iftrue;
     fill_layer_MUX_uxn_c_l119_c2_040d_iffalse <= VAR_fill_layer_MUX_uxn_c_l119_c2_040d_iffalse;
     -- Outputs
     VAR_fill_layer_MUX_uxn_c_l119_c2_040d_return_output := fill_layer_MUX_uxn_c_l119_c2_040d_return_output;

     -- is_fill_top_MUX[uxn_c_l119_c2_040d] LATENCY=0
     -- Inputs
     is_fill_top_MUX_uxn_c_l119_c2_040d_cond <= VAR_is_fill_top_MUX_uxn_c_l119_c2_040d_cond;
     is_fill_top_MUX_uxn_c_l119_c2_040d_iftrue <= VAR_is_fill_top_MUX_uxn_c_l119_c2_040d_iftrue;
     is_fill_top_MUX_uxn_c_l119_c2_040d_iffalse <= VAR_is_fill_top_MUX_uxn_c_l119_c2_040d_iffalse;
     -- Outputs
     VAR_is_fill_top_MUX_uxn_c_l119_c2_040d_return_output := is_fill_top_MUX_uxn_c_l119_c2_040d_return_output;

     -- fill_y1_MUX[uxn_c_l119_c2_040d] LATENCY=0
     -- Inputs
     fill_y1_MUX_uxn_c_l119_c2_040d_cond <= VAR_fill_y1_MUX_uxn_c_l119_c2_040d_cond;
     fill_y1_MUX_uxn_c_l119_c2_040d_iftrue <= VAR_fill_y1_MUX_uxn_c_l119_c2_040d_iftrue;
     fill_y1_MUX_uxn_c_l119_c2_040d_iffalse <= VAR_fill_y1_MUX_uxn_c_l119_c2_040d_iffalse;
     -- Outputs
     VAR_fill_y1_MUX_uxn_c_l119_c2_040d_return_output := fill_y1_MUX_uxn_c_l119_c2_040d_return_output;

     -- fill_pixels_remaining_MUX[uxn_c_l119_c2_040d] LATENCY=0
     -- Inputs
     fill_pixels_remaining_MUX_uxn_c_l119_c2_040d_cond <= VAR_fill_pixels_remaining_MUX_uxn_c_l119_c2_040d_cond;
     fill_pixels_remaining_MUX_uxn_c_l119_c2_040d_iftrue <= VAR_fill_pixels_remaining_MUX_uxn_c_l119_c2_040d_iftrue;
     fill_pixels_remaining_MUX_uxn_c_l119_c2_040d_iffalse <= VAR_fill_pixels_remaining_MUX_uxn_c_l119_c2_040d_iffalse;
     -- Outputs
     VAR_fill_pixels_remaining_MUX_uxn_c_l119_c2_040d_return_output := fill_pixels_remaining_MUX_uxn_c_l119_c2_040d_return_output;

     -- is_fill_left_MUX[uxn_c_l119_c2_040d] LATENCY=0
     -- Inputs
     is_fill_left_MUX_uxn_c_l119_c2_040d_cond <= VAR_is_fill_left_MUX_uxn_c_l119_c2_040d_cond;
     is_fill_left_MUX_uxn_c_l119_c2_040d_iftrue <= VAR_is_fill_left_MUX_uxn_c_l119_c2_040d_iftrue;
     is_fill_left_MUX_uxn_c_l119_c2_040d_iffalse <= VAR_is_fill_left_MUX_uxn_c_l119_c2_040d_iffalse;
     -- Outputs
     VAR_is_fill_left_MUX_uxn_c_l119_c2_040d_return_output := is_fill_left_MUX_uxn_c_l119_c2_040d_return_output;

     -- fill_color_MUX[uxn_c_l119_c2_040d] LATENCY=0
     -- Inputs
     fill_color_MUX_uxn_c_l119_c2_040d_cond <= VAR_fill_color_MUX_uxn_c_l119_c2_040d_cond;
     fill_color_MUX_uxn_c_l119_c2_040d_iftrue <= VAR_fill_color_MUX_uxn_c_l119_c2_040d_iftrue;
     fill_color_MUX_uxn_c_l119_c2_040d_iffalse <= VAR_fill_color_MUX_uxn_c_l119_c2_040d_iffalse;
     -- Outputs
     VAR_fill_color_MUX_uxn_c_l119_c2_040d_return_output := fill_color_MUX_uxn_c_l119_c2_040d_return_output;

     -- fill_y0_MUX[uxn_c_l119_c2_040d] LATENCY=0
     -- Inputs
     fill_y0_MUX_uxn_c_l119_c2_040d_cond <= VAR_fill_y0_MUX_uxn_c_l119_c2_040d_cond;
     fill_y0_MUX_uxn_c_l119_c2_040d_iftrue <= VAR_fill_y0_MUX_uxn_c_l119_c2_040d_iftrue;
     fill_y0_MUX_uxn_c_l119_c2_040d_iffalse <= VAR_fill_y0_MUX_uxn_c_l119_c2_040d_iffalse;
     -- Outputs
     VAR_fill_y0_MUX_uxn_c_l119_c2_040d_return_output := fill_y0_MUX_uxn_c_l119_c2_040d_return_output;

     -- fill_x1_MUX[uxn_c_l119_c2_040d] LATENCY=0
     -- Inputs
     fill_x1_MUX_uxn_c_l119_c2_040d_cond <= VAR_fill_x1_MUX_uxn_c_l119_c2_040d_cond;
     fill_x1_MUX_uxn_c_l119_c2_040d_iftrue <= VAR_fill_x1_MUX_uxn_c_l119_c2_040d_iftrue;
     fill_x1_MUX_uxn_c_l119_c2_040d_iffalse <= VAR_fill_x1_MUX_uxn_c_l119_c2_040d_iffalse;
     -- Outputs
     VAR_fill_x1_MUX_uxn_c_l119_c2_040d_return_output := fill_x1_MUX_uxn_c_l119_c2_040d_return_output;

     -- Submodule level 6
     VAR_MUX_uxn_c_l149_c3_348a_iftrue := VAR_fill_color_MUX_uxn_c_l119_c2_040d_return_output;
     VAR_MUX_uxn_c_l156_c3_eabd_iftrue := VAR_fill_color_MUX_uxn_c_l119_c2_040d_return_output;
     REG_VAR_fill_color := VAR_fill_color_MUX_uxn_c_l119_c2_040d_return_output;
     VAR_BIN_OP_AND_uxn_c_l144_c19_3d48_right := VAR_fill_layer_MUX_uxn_c_l119_c2_040d_return_output;
     VAR_UNARY_OP_NOT_uxn_c_l143_c37_336a_expr := VAR_fill_layer_MUX_uxn_c_l119_c2_040d_return_output;
     REG_VAR_fill_layer := VAR_fill_layer_MUX_uxn_c_l119_c2_040d_return_output;
     VAR_BIN_OP_EQ_uxn_c_l135_c19_9029_left := VAR_fill_pixels_remaining_MUX_uxn_c_l119_c2_040d_return_output;
     VAR_BIN_OP_EQ_uxn_c_l165_c27_0081_left := VAR_fill_pixels_remaining_MUX_uxn_c_l119_c2_040d_return_output;
     VAR_BIN_OP_MINUS_uxn_c_l165_c60_c313_left := VAR_fill_pixels_remaining_MUX_uxn_c_l119_c2_040d_return_output;
     VAR_fill_pixels_remaining_MUX_uxn_c_l161_c2_60dd_iftrue := VAR_fill_pixels_remaining_MUX_uxn_c_l119_c2_040d_return_output;
     VAR_fill_pixels_remaining_MUX_uxn_c_l163_c9_6f5c_iffalse := VAR_fill_pixels_remaining_MUX_uxn_c_l119_c2_040d_return_output;
     VAR_BIN_OP_GT_uxn_c_l137_c17_2249_right := VAR_fill_x0_MUX_uxn_c_l119_c2_040d_return_output;
     REG_VAR_fill_x0 := VAR_fill_x0_MUX_uxn_c_l119_c2_040d_return_output;
     VAR_BIN_OP_LT_uxn_c_l138_c17_96af_right := VAR_fill_x1_MUX_uxn_c_l119_c2_040d_return_output;
     REG_VAR_fill_x1 := VAR_fill_x1_MUX_uxn_c_l119_c2_040d_return_output;
     VAR_BIN_OP_GT_uxn_c_l139_c17_11c2_right := VAR_fill_y0_MUX_uxn_c_l119_c2_040d_return_output;
     REG_VAR_fill_y0 := VAR_fill_y0_MUX_uxn_c_l119_c2_040d_return_output;
     VAR_BIN_OP_LT_uxn_c_l140_c17_c710_right := VAR_fill_y1_MUX_uxn_c_l119_c2_040d_return_output;
     REG_VAR_fill_y1 := VAR_fill_y1_MUX_uxn_c_l119_c2_040d_return_output;
     REG_VAR_is_fill_left := VAR_is_fill_left_MUX_uxn_c_l119_c2_040d_return_output;
     REG_VAR_is_fill_top := VAR_is_fill_top_MUX_uxn_c_l119_c2_040d_return_output;
     -- BIN_OP_LT[uxn_c_l138_c17_96af] LATENCY=0
     -- Inputs
     BIN_OP_LT_uxn_c_l138_c17_96af_left <= VAR_BIN_OP_LT_uxn_c_l138_c17_96af_left;
     BIN_OP_LT_uxn_c_l138_c17_96af_right <= VAR_BIN_OP_LT_uxn_c_l138_c17_96af_right;
     -- Outputs
     VAR_BIN_OP_LT_uxn_c_l138_c17_96af_return_output := BIN_OP_LT_uxn_c_l138_c17_96af_return_output;

     -- BIN_OP_LT[uxn_c_l140_c17_c710] LATENCY=0
     -- Inputs
     BIN_OP_LT_uxn_c_l140_c17_c710_left <= VAR_BIN_OP_LT_uxn_c_l140_c17_c710_left;
     BIN_OP_LT_uxn_c_l140_c17_c710_right <= VAR_BIN_OP_LT_uxn_c_l140_c17_c710_right;
     -- Outputs
     VAR_BIN_OP_LT_uxn_c_l140_c17_c710_return_output := BIN_OP_LT_uxn_c_l140_c17_c710_return_output;

     -- BIN_OP_EQ[uxn_c_l165_c27_0081] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l165_c27_0081_left <= VAR_BIN_OP_EQ_uxn_c_l165_c27_0081_left;
     BIN_OP_EQ_uxn_c_l165_c27_0081_right <= VAR_BIN_OP_EQ_uxn_c_l165_c27_0081_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l165_c27_0081_return_output := BIN_OP_EQ_uxn_c_l165_c27_0081_return_output;

     -- BIN_OP_EQ[uxn_c_l135_c19_9029] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l135_c19_9029_left <= VAR_BIN_OP_EQ_uxn_c_l135_c19_9029_left;
     BIN_OP_EQ_uxn_c_l135_c19_9029_right <= VAR_BIN_OP_EQ_uxn_c_l135_c19_9029_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l135_c19_9029_return_output := BIN_OP_EQ_uxn_c_l135_c19_9029_return_output;

     -- BIN_OP_GT[uxn_c_l137_c17_2249] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_c_l137_c17_2249_left <= VAR_BIN_OP_GT_uxn_c_l137_c17_2249_left;
     BIN_OP_GT_uxn_c_l137_c17_2249_right <= VAR_BIN_OP_GT_uxn_c_l137_c17_2249_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_c_l137_c17_2249_return_output := BIN_OP_GT_uxn_c_l137_c17_2249_return_output;

     -- BIN_OP_MINUS[uxn_c_l165_c60_c313] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l165_c60_c313_left <= VAR_BIN_OP_MINUS_uxn_c_l165_c60_c313_left;
     BIN_OP_MINUS_uxn_c_l165_c60_c313_right <= VAR_BIN_OP_MINUS_uxn_c_l165_c60_c313_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l165_c60_c313_return_output := BIN_OP_MINUS_uxn_c_l165_c60_c313_return_output;

     -- UNARY_OP_NOT[uxn_c_l143_c37_336a] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l143_c37_336a_expr <= VAR_UNARY_OP_NOT_uxn_c_l143_c37_336a_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l143_c37_336a_return_output := UNARY_OP_NOT_uxn_c_l143_c37_336a_return_output;

     -- BIN_OP_GT[uxn_c_l139_c17_11c2] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_c_l139_c17_11c2_left <= VAR_BIN_OP_GT_uxn_c_l139_c17_11c2_left;
     BIN_OP_GT_uxn_c_l139_c17_11c2_right <= VAR_BIN_OP_GT_uxn_c_l139_c17_11c2_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_c_l139_c17_11c2_return_output := BIN_OP_GT_uxn_c_l139_c17_11c2_return_output;

     -- Submodule level 7
     VAR_MUX_uxn_c_l135_c19_72e8_cond := VAR_BIN_OP_EQ_uxn_c_l135_c19_9029_return_output;
     VAR_MUX_uxn_c_l165_c27_1f4b_cond := VAR_BIN_OP_EQ_uxn_c_l165_c27_0081_return_output;
     VAR_BIN_OP_AND_uxn_c_l142_c18_7758_right := VAR_BIN_OP_GT_uxn_c_l137_c17_2249_return_output;
     REG_VAR_fill_isect_l := VAR_BIN_OP_GT_uxn_c_l137_c17_2249_return_output;
     VAR_BIN_OP_AND_uxn_c_l142_c18_387c_right := VAR_BIN_OP_GT_uxn_c_l139_c17_11c2_return_output;
     REG_VAR_fill_isect_t := VAR_BIN_OP_GT_uxn_c_l139_c17_11c2_return_output;
     VAR_BIN_OP_AND_uxn_c_l142_c18_94a5_right := VAR_BIN_OP_LT_uxn_c_l138_c17_96af_return_output;
     REG_VAR_fill_isect_r := VAR_BIN_OP_LT_uxn_c_l138_c17_96af_return_output;
     VAR_BIN_OP_AND_uxn_c_l142_c18_7f2c_right := VAR_BIN_OP_LT_uxn_c_l140_c17_c710_return_output;
     REG_VAR_fill_isect_b := VAR_BIN_OP_LT_uxn_c_l140_c17_c710_return_output;
     VAR_MUX_uxn_c_l165_c27_1f4b_iffalse := VAR_BIN_OP_MINUS_uxn_c_l165_c60_c313_return_output;
     VAR_BIN_OP_AND_uxn_c_l143_c19_3077_right := VAR_UNARY_OP_NOT_uxn_c_l143_c37_336a_return_output;
     -- MUX[uxn_c_l165_c27_1f4b] LATENCY=0
     -- Inputs
     MUX_uxn_c_l165_c27_1f4b_cond <= VAR_MUX_uxn_c_l165_c27_1f4b_cond;
     MUX_uxn_c_l165_c27_1f4b_iftrue <= VAR_MUX_uxn_c_l165_c27_1f4b_iftrue;
     MUX_uxn_c_l165_c27_1f4b_iffalse <= VAR_MUX_uxn_c_l165_c27_1f4b_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l165_c27_1f4b_return_output := MUX_uxn_c_l165_c27_1f4b_return_output;

     -- MUX[uxn_c_l135_c19_72e8] LATENCY=0
     -- Inputs
     MUX_uxn_c_l135_c19_72e8_cond <= VAR_MUX_uxn_c_l135_c19_72e8_cond;
     MUX_uxn_c_l135_c19_72e8_iftrue <= VAR_MUX_uxn_c_l135_c19_72e8_iftrue;
     MUX_uxn_c_l135_c19_72e8_iffalse <= VAR_MUX_uxn_c_l135_c19_72e8_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l135_c19_72e8_return_output := MUX_uxn_c_l135_c19_72e8_return_output;

     -- Submodule level 8
     VAR_BIN_OP_AND_uxn_c_l142_c18_7758_left := VAR_MUX_uxn_c_l135_c19_72e8_return_output;
     VAR_MUX_uxn_c_l148_c37_5fe0_cond := VAR_MUX_uxn_c_l135_c19_72e8_return_output;
     VAR_MUX_uxn_c_l155_c37_4246_cond := VAR_MUX_uxn_c_l135_c19_72e8_return_output;
     VAR_UNARY_OP_NOT_uint1_t_uxn_c_l157_l150_DUPLICATE_30fb_expr := VAR_MUX_uxn_c_l135_c19_72e8_return_output;
     REG_VAR_is_fill_active := VAR_MUX_uxn_c_l135_c19_72e8_return_output;
     VAR_fill_pixels_remaining_MUX_uxn_c_l163_c9_6f5c_iftrue := VAR_MUX_uxn_c_l165_c27_1f4b_return_output;
     -- BIN_OP_AND[uxn_c_l142_c18_7758] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l142_c18_7758_left <= VAR_BIN_OP_AND_uxn_c_l142_c18_7758_left;
     BIN_OP_AND_uxn_c_l142_c18_7758_right <= VAR_BIN_OP_AND_uxn_c_l142_c18_7758_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l142_c18_7758_return_output := BIN_OP_AND_uxn_c_l142_c18_7758_return_output;

     -- UNARY_OP_NOT_uint1_t_uxn_c_l157_l150_DUPLICATE_30fb LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uint1_t_uxn_c_l157_l150_DUPLICATE_30fb_expr <= VAR_UNARY_OP_NOT_uint1_t_uxn_c_l157_l150_DUPLICATE_30fb_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uint1_t_uxn_c_l157_l150_DUPLICATE_30fb_return_output := UNARY_OP_NOT_uint1_t_uxn_c_l157_l150_DUPLICATE_30fb_return_output;

     -- MUX[uxn_c_l155_c37_4246] LATENCY=0
     -- Inputs
     MUX_uxn_c_l155_c37_4246_cond <= VAR_MUX_uxn_c_l155_c37_4246_cond;
     MUX_uxn_c_l155_c37_4246_iftrue <= VAR_MUX_uxn_c_l155_c37_4246_iftrue;
     MUX_uxn_c_l155_c37_4246_iffalse <= VAR_MUX_uxn_c_l155_c37_4246_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l155_c37_4246_return_output := MUX_uxn_c_l155_c37_4246_return_output;

     -- fill_pixels_remaining_MUX[uxn_c_l163_c9_6f5c] LATENCY=0
     -- Inputs
     fill_pixels_remaining_MUX_uxn_c_l163_c9_6f5c_cond <= VAR_fill_pixels_remaining_MUX_uxn_c_l163_c9_6f5c_cond;
     fill_pixels_remaining_MUX_uxn_c_l163_c9_6f5c_iftrue <= VAR_fill_pixels_remaining_MUX_uxn_c_l163_c9_6f5c_iftrue;
     fill_pixels_remaining_MUX_uxn_c_l163_c9_6f5c_iffalse <= VAR_fill_pixels_remaining_MUX_uxn_c_l163_c9_6f5c_iffalse;
     -- Outputs
     VAR_fill_pixels_remaining_MUX_uxn_c_l163_c9_6f5c_return_output := fill_pixels_remaining_MUX_uxn_c_l163_c9_6f5c_return_output;

     -- MUX[uxn_c_l148_c37_5fe0] LATENCY=0
     -- Inputs
     MUX_uxn_c_l148_c37_5fe0_cond <= VAR_MUX_uxn_c_l148_c37_5fe0_cond;
     MUX_uxn_c_l148_c37_5fe0_iftrue <= VAR_MUX_uxn_c_l148_c37_5fe0_iftrue;
     MUX_uxn_c_l148_c37_5fe0_iffalse <= VAR_MUX_uxn_c_l148_c37_5fe0_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l148_c37_5fe0_return_output := MUX_uxn_c_l148_c37_5fe0_return_output;

     -- Submodule level 9
     VAR_BIN_OP_AND_uxn_c_l142_c18_94a5_left := VAR_BIN_OP_AND_uxn_c_l142_c18_7758_return_output;
     VAR_MUX_uxn_c_l148_c3_0d39_iffalse := VAR_MUX_uxn_c_l148_c37_5fe0_return_output;
     VAR_MUX_uxn_c_l155_c3_5278_iffalse := VAR_MUX_uxn_c_l155_c37_4246_return_output;
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l150_l157_DUPLICATE_caa2_left := VAR_UNARY_OP_NOT_uint1_t_uxn_c_l157_l150_DUPLICATE_30fb_return_output;
     VAR_fill_pixels_remaining_MUX_uxn_c_l161_c2_60dd_iffalse := VAR_fill_pixels_remaining_MUX_uxn_c_l163_c9_6f5c_return_output;
     -- BIN_OP_AND[uxn_c_l142_c18_94a5] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l142_c18_94a5_left <= VAR_BIN_OP_AND_uxn_c_l142_c18_94a5_left;
     BIN_OP_AND_uxn_c_l142_c18_94a5_right <= VAR_BIN_OP_AND_uxn_c_l142_c18_94a5_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l142_c18_94a5_return_output := BIN_OP_AND_uxn_c_l142_c18_94a5_return_output;

     -- BIN_OP_AND_uint1_t_uint1_t_uxn_c_l150_l157_DUPLICATE_caa2 LATENCY=0
     -- Inputs
     BIN_OP_AND_uint1_t_uint1_t_uxn_c_l150_l157_DUPLICATE_caa2_left <= VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l150_l157_DUPLICATE_caa2_left;
     BIN_OP_AND_uint1_t_uint1_t_uxn_c_l150_l157_DUPLICATE_caa2_right <= VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l150_l157_DUPLICATE_caa2_right;
     -- Outputs
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l150_l157_DUPLICATE_caa2_return_output := BIN_OP_AND_uint1_t_uint1_t_uxn_c_l150_l157_DUPLICATE_caa2_return_output;

     -- fill_pixels_remaining_MUX[uxn_c_l161_c2_60dd] LATENCY=0
     -- Inputs
     fill_pixels_remaining_MUX_uxn_c_l161_c2_60dd_cond <= VAR_fill_pixels_remaining_MUX_uxn_c_l161_c2_60dd_cond;
     fill_pixels_remaining_MUX_uxn_c_l161_c2_60dd_iftrue <= VAR_fill_pixels_remaining_MUX_uxn_c_l161_c2_60dd_iftrue;
     fill_pixels_remaining_MUX_uxn_c_l161_c2_60dd_iffalse <= VAR_fill_pixels_remaining_MUX_uxn_c_l161_c2_60dd_iffalse;
     -- Outputs
     VAR_fill_pixels_remaining_MUX_uxn_c_l161_c2_60dd_return_output := fill_pixels_remaining_MUX_uxn_c_l161_c2_60dd_return_output;

     -- Submodule level 10
     VAR_BIN_OP_AND_uxn_c_l142_c18_387c_left := VAR_BIN_OP_AND_uxn_c_l142_c18_94a5_return_output;
     VAR_BIN_OP_AND_uxn_c_l150_c22_e5fa_left := VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l150_l157_DUPLICATE_caa2_return_output;
     VAR_BIN_OP_AND_uxn_c_l157_c22_a2bb_left := VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l150_l157_DUPLICATE_caa2_return_output;
     REG_VAR_fill_pixels_remaining := VAR_fill_pixels_remaining_MUX_uxn_c_l161_c2_60dd_return_output;
     -- BIN_OP_AND[uxn_c_l157_c22_a2bb] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l157_c22_a2bb_left <= VAR_BIN_OP_AND_uxn_c_l157_c22_a2bb_left;
     BIN_OP_AND_uxn_c_l157_c22_a2bb_right <= VAR_BIN_OP_AND_uxn_c_l157_c22_a2bb_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l157_c22_a2bb_return_output := BIN_OP_AND_uxn_c_l157_c22_a2bb_return_output;

     -- BIN_OP_AND[uxn_c_l142_c18_387c] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l142_c18_387c_left <= VAR_BIN_OP_AND_uxn_c_l142_c18_387c_left;
     BIN_OP_AND_uxn_c_l142_c18_387c_right <= VAR_BIN_OP_AND_uxn_c_l142_c18_387c_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l142_c18_387c_return_output := BIN_OP_AND_uxn_c_l142_c18_387c_return_output;

     -- BIN_OP_AND[uxn_c_l150_c22_e5fa] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l150_c22_e5fa_left <= VAR_BIN_OP_AND_uxn_c_l150_c22_e5fa_left;
     BIN_OP_AND_uxn_c_l150_c22_e5fa_right <= VAR_BIN_OP_AND_uxn_c_l150_c22_e5fa_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l150_c22_e5fa_return_output := BIN_OP_AND_uxn_c_l150_c22_e5fa_return_output;

     -- Submodule level 11
     VAR_BIN_OP_AND_uxn_c_l142_c18_7f2c_left := VAR_BIN_OP_AND_uxn_c_l142_c18_387c_return_output;
     VAR_BIN_OP_OR_uxn_c_l150_c3_126b_right := VAR_BIN_OP_AND_uxn_c_l150_c22_e5fa_return_output;
     VAR_BIN_OP_OR_uxn_c_l157_c3_1b7f_right := VAR_BIN_OP_AND_uxn_c_l157_c22_a2bb_return_output;
     -- BIN_OP_AND[uxn_c_l142_c18_7f2c] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l142_c18_7f2c_left <= VAR_BIN_OP_AND_uxn_c_l142_c18_7f2c_left;
     BIN_OP_AND_uxn_c_l142_c18_7f2c_right <= VAR_BIN_OP_AND_uxn_c_l142_c18_7f2c_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l142_c18_7f2c_return_output := BIN_OP_AND_uxn_c_l142_c18_7f2c_return_output;

     -- Submodule level 12
     VAR_BIN_OP_AND_uxn_c_l143_c19_3077_left := VAR_BIN_OP_AND_uxn_c_l142_c18_7f2c_return_output;
     VAR_BIN_OP_AND_uxn_c_l144_c19_3d48_left := VAR_BIN_OP_AND_uxn_c_l142_c18_7f2c_return_output;
     REG_VAR_is_fill_pixel := VAR_BIN_OP_AND_uxn_c_l142_c18_7f2c_return_output;
     -- BIN_OP_AND[uxn_c_l143_c19_3077] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l143_c19_3077_left <= VAR_BIN_OP_AND_uxn_c_l143_c19_3077_left;
     BIN_OP_AND_uxn_c_l143_c19_3077_right <= VAR_BIN_OP_AND_uxn_c_l143_c19_3077_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l143_c19_3077_return_output := BIN_OP_AND_uxn_c_l143_c19_3077_return_output;

     -- BIN_OP_AND[uxn_c_l144_c19_3d48] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l144_c19_3d48_left <= VAR_BIN_OP_AND_uxn_c_l144_c19_3d48_left;
     BIN_OP_AND_uxn_c_l144_c19_3d48_right <= VAR_BIN_OP_AND_uxn_c_l144_c19_3d48_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l144_c19_3d48_return_output := BIN_OP_AND_uxn_c_l144_c19_3d48_return_output;

     -- Submodule level 13
     VAR_BIN_OP_OR_uxn_c_l150_c3_126b_left := VAR_BIN_OP_AND_uxn_c_l143_c19_3077_return_output;
     VAR_MUX_uxn_c_l148_c3_0d39_cond := VAR_BIN_OP_AND_uxn_c_l143_c19_3077_return_output;
     VAR_MUX_uxn_c_l149_c3_348a_cond := VAR_BIN_OP_AND_uxn_c_l143_c19_3077_return_output;
     REG_VAR_is_fill_pixel0 := VAR_BIN_OP_AND_uxn_c_l143_c19_3077_return_output;
     VAR_BIN_OP_OR_uxn_c_l157_c3_1b7f_left := VAR_BIN_OP_AND_uxn_c_l144_c19_3d48_return_output;
     VAR_MUX_uxn_c_l155_c3_5278_cond := VAR_BIN_OP_AND_uxn_c_l144_c19_3d48_return_output;
     VAR_MUX_uxn_c_l156_c3_eabd_cond := VAR_BIN_OP_AND_uxn_c_l144_c19_3d48_return_output;
     REG_VAR_is_fill_pixel1 := VAR_BIN_OP_AND_uxn_c_l144_c19_3d48_return_output;
     -- BIN_OP_OR[uxn_c_l150_c3_126b] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l150_c3_126b_left <= VAR_BIN_OP_OR_uxn_c_l150_c3_126b_left;
     BIN_OP_OR_uxn_c_l150_c3_126b_right <= VAR_BIN_OP_OR_uxn_c_l150_c3_126b_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l150_c3_126b_return_output := BIN_OP_OR_uxn_c_l150_c3_126b_return_output;

     -- MUX[uxn_c_l156_c3_eabd] LATENCY=0
     -- Inputs
     MUX_uxn_c_l156_c3_eabd_cond <= VAR_MUX_uxn_c_l156_c3_eabd_cond;
     MUX_uxn_c_l156_c3_eabd_iftrue <= VAR_MUX_uxn_c_l156_c3_eabd_iftrue;
     MUX_uxn_c_l156_c3_eabd_iffalse <= VAR_MUX_uxn_c_l156_c3_eabd_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l156_c3_eabd_return_output := MUX_uxn_c_l156_c3_eabd_return_output;

     -- MUX[uxn_c_l149_c3_348a] LATENCY=0
     -- Inputs
     MUX_uxn_c_l149_c3_348a_cond <= VAR_MUX_uxn_c_l149_c3_348a_cond;
     MUX_uxn_c_l149_c3_348a_iftrue <= VAR_MUX_uxn_c_l149_c3_348a_iftrue;
     MUX_uxn_c_l149_c3_348a_iffalse <= VAR_MUX_uxn_c_l149_c3_348a_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l149_c3_348a_return_output := MUX_uxn_c_l149_c3_348a_return_output;

     -- MUX[uxn_c_l148_c3_0d39] LATENCY=0
     -- Inputs
     MUX_uxn_c_l148_c3_0d39_cond <= VAR_MUX_uxn_c_l148_c3_0d39_cond;
     MUX_uxn_c_l148_c3_0d39_iftrue <= VAR_MUX_uxn_c_l148_c3_0d39_iftrue;
     MUX_uxn_c_l148_c3_0d39_iffalse <= VAR_MUX_uxn_c_l148_c3_0d39_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l148_c3_0d39_return_output := MUX_uxn_c_l148_c3_0d39_return_output;

     -- BIN_OP_OR[uxn_c_l157_c3_1b7f] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l157_c3_1b7f_left <= VAR_BIN_OP_OR_uxn_c_l157_c3_1b7f_left;
     BIN_OP_OR_uxn_c_l157_c3_1b7f_right <= VAR_BIN_OP_OR_uxn_c_l157_c3_1b7f_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l157_c3_1b7f_return_output := BIN_OP_OR_uxn_c_l157_c3_1b7f_return_output;

     -- MUX[uxn_c_l155_c3_5278] LATENCY=0
     -- Inputs
     MUX_uxn_c_l155_c3_5278_cond <= VAR_MUX_uxn_c_l155_c3_5278_cond;
     MUX_uxn_c_l155_c3_5278_iftrue <= VAR_MUX_uxn_c_l155_c3_5278_iftrue;
     MUX_uxn_c_l155_c3_5278_iffalse <= VAR_MUX_uxn_c_l155_c3_5278_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l155_c3_5278_return_output := MUX_uxn_c_l155_c3_5278_return_output;

     -- Submodule level 14
     VAR_bg_vram_update_uxn_c_l146_c19_c372_write_enable := VAR_BIN_OP_OR_uxn_c_l150_c3_126b_return_output;
     VAR_fg_vram_update_uxn_c_l153_c19_2755_write_enable := VAR_BIN_OP_OR_uxn_c_l157_c3_1b7f_return_output;
     VAR_bg_vram_update_uxn_c_l146_c19_c372_write_address := VAR_MUX_uxn_c_l148_c3_0d39_return_output;
     VAR_bg_vram_update_uxn_c_l146_c19_c372_write_value := VAR_MUX_uxn_c_l149_c3_348a_return_output;
     VAR_fg_vram_update_uxn_c_l153_c19_2755_write_address := VAR_MUX_uxn_c_l155_c3_5278_return_output;
     VAR_fg_vram_update_uxn_c_l153_c19_2755_write_value := VAR_MUX_uxn_c_l156_c3_eabd_return_output;
     -- bg_vram_update[uxn_c_l146_c19_c372] LATENCY=0
     -- Clock enable
     bg_vram_update_uxn_c_l146_c19_c372_CLOCK_ENABLE <= VAR_bg_vram_update_uxn_c_l146_c19_c372_CLOCK_ENABLE;
     -- Inputs
     bg_vram_update_uxn_c_l146_c19_c372_read_address <= VAR_bg_vram_update_uxn_c_l146_c19_c372_read_address;
     bg_vram_update_uxn_c_l146_c19_c372_write_address <= VAR_bg_vram_update_uxn_c_l146_c19_c372_write_address;
     bg_vram_update_uxn_c_l146_c19_c372_write_value <= VAR_bg_vram_update_uxn_c_l146_c19_c372_write_value;
     bg_vram_update_uxn_c_l146_c19_c372_write_enable <= VAR_bg_vram_update_uxn_c_l146_c19_c372_write_enable;
     -- Outputs
     VAR_bg_vram_update_uxn_c_l146_c19_c372_return_output := bg_vram_update_uxn_c_l146_c19_c372_return_output;

     -- fg_vram_update[uxn_c_l153_c19_2755] LATENCY=0
     -- Clock enable
     fg_vram_update_uxn_c_l153_c19_2755_CLOCK_ENABLE <= VAR_fg_vram_update_uxn_c_l153_c19_2755_CLOCK_ENABLE;
     -- Inputs
     fg_vram_update_uxn_c_l153_c19_2755_read_address <= VAR_fg_vram_update_uxn_c_l153_c19_2755_read_address;
     fg_vram_update_uxn_c_l153_c19_2755_write_address <= VAR_fg_vram_update_uxn_c_l153_c19_2755_write_address;
     fg_vram_update_uxn_c_l153_c19_2755_write_value <= VAR_fg_vram_update_uxn_c_l153_c19_2755_write_value;
     fg_vram_update_uxn_c_l153_c19_2755_write_enable <= VAR_fg_vram_update_uxn_c_l153_c19_2755_write_enable;
     -- Outputs
     VAR_fg_vram_update_uxn_c_l153_c19_2755_return_output := fg_vram_update_uxn_c_l153_c19_2755_return_output;

     -- Submodule level 15
     VAR_MUX_uxn_c_l168_c17_91b9_iftrue := VAR_bg_vram_update_uxn_c_l146_c19_c372_return_output;
     REG_VAR_bg_pixel_color := VAR_bg_vram_update_uxn_c_l146_c19_c372_return_output;
     VAR_BIN_OP_EQ_uxn_c_l168_c17_0f65_left := VAR_fg_vram_update_uxn_c_l153_c19_2755_return_output;
     VAR_MUX_uxn_c_l168_c17_91b9_iffalse := VAR_fg_vram_update_uxn_c_l153_c19_2755_return_output;
     REG_VAR_fg_pixel_color := VAR_fg_vram_update_uxn_c_l153_c19_2755_return_output;
     -- BIN_OP_EQ[uxn_c_l168_c17_0f65] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l168_c17_0f65_left <= VAR_BIN_OP_EQ_uxn_c_l168_c17_0f65_left;
     BIN_OP_EQ_uxn_c_l168_c17_0f65_right <= VAR_BIN_OP_EQ_uxn_c_l168_c17_0f65_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l168_c17_0f65_return_output := BIN_OP_EQ_uxn_c_l168_c17_0f65_return_output;

     -- Submodule level 16
     VAR_MUX_uxn_c_l168_c17_91b9_cond := VAR_BIN_OP_EQ_uxn_c_l168_c17_0f65_return_output;
     -- MUX[uxn_c_l168_c17_91b9] LATENCY=0
     -- Inputs
     MUX_uxn_c_l168_c17_91b9_cond <= VAR_MUX_uxn_c_l168_c17_91b9_cond;
     MUX_uxn_c_l168_c17_91b9_iftrue <= VAR_MUX_uxn_c_l168_c17_91b9_iftrue;
     MUX_uxn_c_l168_c17_91b9_iffalse <= VAR_MUX_uxn_c_l168_c17_91b9_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l168_c17_91b9_return_output := MUX_uxn_c_l168_c17_91b9_return_output;

     -- Submodule level 17
     -- CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_6984_uxn_c_l97_l171_DUPLICATE_f349 LATENCY=0
     VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_6984_uxn_c_l97_l171_DUPLICATE_f349_return_output := CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_6984(
     VAR_MUX_uxn_c_l168_c17_91b9_return_output,
     VAR_MUX_uxn_c_l135_c19_72e8_return_output);

     -- Submodule level 18
     REG_VAR_result := VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_6984_uxn_c_l97_l171_DUPLICATE_f349_return_output;
     VAR_return_output := VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_6984_uxn_c_l97_l171_DUPLICATE_f349_return_output;
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
