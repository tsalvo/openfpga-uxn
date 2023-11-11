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
-- Submodules: 74
entity step_gpu_0CLK_57cf448f is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 is_active_drawing_area : in unsigned(0 downto 0);
 is_vram_write : in unsigned(0 downto 0);
 vram_write_layer : in unsigned(0 downto 0);
 vram_address : in unsigned(31 downto 0);
 vram_value : in unsigned(1 downto 0);
 return_output : out gpu_step_result_t);
end step_gpu_0CLK_57cf448f;
architecture arch of step_gpu_0CLK_57cf448f is
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
-- BIN_OP_GT[uxn_c_l126_c26_8160]
signal BIN_OP_GT_uxn_c_l126_c26_8160_left : unsigned(31 downto 0);
signal BIN_OP_GT_uxn_c_l126_c26_8160_right : unsigned(17 downto 0);
signal BIN_OP_GT_uxn_c_l126_c26_8160_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l126_c26_fc2d]
signal MUX_uxn_c_l126_c26_fc2d_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l126_c26_fc2d_iftrue : unsigned(31 downto 0);
signal MUX_uxn_c_l126_c26_fc2d_iffalse : unsigned(31 downto 0);
signal MUX_uxn_c_l126_c26_fc2d_return_output : unsigned(31 downto 0);

-- CONST_SR_28[uxn_c_l127_c24_6955]
signal CONST_SR_28_uxn_c_l127_c24_6955_x : unsigned(31 downto 0);
signal CONST_SR_28_uxn_c_l127_c24_6955_return_output : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_c_l128_c17_4b2e]
signal BIN_OP_EQ_uxn_c_l128_c17_4b2e_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l128_c17_4b2e_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l128_c17_4b2e_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l128_c17_6b93]
signal MUX_uxn_c_l128_c17_6b93_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l128_c17_6b93_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l128_c17_6b93_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l128_c17_6b93_return_output : unsigned(0 downto 0);

-- BIN_OP_DIV[uxn_c_l129_c6_2979]
signal BIN_OP_DIV_uxn_c_l129_c6_2979_left : unsigned(31 downto 0);
signal BIN_OP_DIV_uxn_c_l129_c6_2979_right : unsigned(8 downto 0);
signal BIN_OP_DIV_uxn_c_l129_c6_2979_return_output : unsigned(31 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_c_l130_c23_7611]
signal BIN_OP_INFERRED_MULT_uxn_c_l130_c23_7611_left : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_c_l130_c23_7611_right : unsigned(8 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_c_l130_c23_7611_return_output : unsigned(24 downto 0);

-- BIN_OP_MINUS[uxn_c_l130_c6_222f]
signal BIN_OP_MINUS_uxn_c_l130_c6_222f_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_uxn_c_l130_c6_222f_right : unsigned(24 downto 0);
signal BIN_OP_MINUS_uxn_c_l130_c6_222f_return_output : unsigned(31 downto 0);

-- UNARY_OP_NOT[uxn_c_l133_c22_810a]
signal UNARY_OP_NOT_uxn_c_l133_c22_810a_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l133_c22_810a_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l133_c6_f0b5]
signal BIN_OP_AND_uxn_c_l133_c6_f0b5_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l133_c6_f0b5_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l133_c6_f0b5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l133_c1_74f4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l133_c1_74f4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l133_c1_74f4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l133_c1_74f4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l133_c1_74f4_return_output : unsigned(0 downto 0);

-- fill_y0_MUX[uxn_c_l133_c2_07a1]
signal fill_y0_MUX_uxn_c_l133_c2_07a1_cond : unsigned(0 downto 0);
signal fill_y0_MUX_uxn_c_l133_c2_07a1_iftrue : unsigned(15 downto 0);
signal fill_y0_MUX_uxn_c_l133_c2_07a1_iffalse : unsigned(15 downto 0);
signal fill_y0_MUX_uxn_c_l133_c2_07a1_return_output : unsigned(15 downto 0);

-- is_fill_left_MUX[uxn_c_l133_c2_07a1]
signal is_fill_left_MUX_uxn_c_l133_c2_07a1_cond : unsigned(0 downto 0);
signal is_fill_left_MUX_uxn_c_l133_c2_07a1_iftrue : unsigned(0 downto 0);
signal is_fill_left_MUX_uxn_c_l133_c2_07a1_iffalse : unsigned(0 downto 0);
signal is_fill_left_MUX_uxn_c_l133_c2_07a1_return_output : unsigned(0 downto 0);

-- fill_layer_MUX[uxn_c_l133_c2_07a1]
signal fill_layer_MUX_uxn_c_l133_c2_07a1_cond : unsigned(0 downto 0);
signal fill_layer_MUX_uxn_c_l133_c2_07a1_iftrue : unsigned(0 downto 0);
signal fill_layer_MUX_uxn_c_l133_c2_07a1_iffalse : unsigned(0 downto 0);
signal fill_layer_MUX_uxn_c_l133_c2_07a1_return_output : unsigned(0 downto 0);

-- fill_y1_MUX[uxn_c_l133_c2_07a1]
signal fill_y1_MUX_uxn_c_l133_c2_07a1_cond : unsigned(0 downto 0);
signal fill_y1_MUX_uxn_c_l133_c2_07a1_iftrue : unsigned(15 downto 0);
signal fill_y1_MUX_uxn_c_l133_c2_07a1_iffalse : unsigned(15 downto 0);
signal fill_y1_MUX_uxn_c_l133_c2_07a1_return_output : unsigned(15 downto 0);

-- fill_color_MUX[uxn_c_l133_c2_07a1]
signal fill_color_MUX_uxn_c_l133_c2_07a1_cond : unsigned(0 downto 0);
signal fill_color_MUX_uxn_c_l133_c2_07a1_iftrue : unsigned(1 downto 0);
signal fill_color_MUX_uxn_c_l133_c2_07a1_iffalse : unsigned(1 downto 0);
signal fill_color_MUX_uxn_c_l133_c2_07a1_return_output : unsigned(1 downto 0);

-- fill_x1_MUX[uxn_c_l133_c2_07a1]
signal fill_x1_MUX_uxn_c_l133_c2_07a1_cond : unsigned(0 downto 0);
signal fill_x1_MUX_uxn_c_l133_c2_07a1_iftrue : unsigned(15 downto 0);
signal fill_x1_MUX_uxn_c_l133_c2_07a1_iffalse : unsigned(15 downto 0);
signal fill_x1_MUX_uxn_c_l133_c2_07a1_return_output : unsigned(15 downto 0);

-- is_fill_top_MUX[uxn_c_l133_c2_07a1]
signal is_fill_top_MUX_uxn_c_l133_c2_07a1_cond : unsigned(0 downto 0);
signal is_fill_top_MUX_uxn_c_l133_c2_07a1_iftrue : unsigned(0 downto 0);
signal is_fill_top_MUX_uxn_c_l133_c2_07a1_iffalse : unsigned(0 downto 0);
signal is_fill_top_MUX_uxn_c_l133_c2_07a1_return_output : unsigned(0 downto 0);

-- fill_x0_MUX[uxn_c_l133_c2_07a1]
signal fill_x0_MUX_uxn_c_l133_c2_07a1_cond : unsigned(0 downto 0);
signal fill_x0_MUX_uxn_c_l133_c2_07a1_iftrue : unsigned(15 downto 0);
signal fill_x0_MUX_uxn_c_l133_c2_07a1_iffalse : unsigned(15 downto 0);
signal fill_x0_MUX_uxn_c_l133_c2_07a1_return_output : unsigned(15 downto 0);

-- fill_pixels_remaining_MUX[uxn_c_l133_c2_07a1]
signal fill_pixels_remaining_MUX_uxn_c_l133_c2_07a1_cond : unsigned(0 downto 0);
signal fill_pixels_remaining_MUX_uxn_c_l133_c2_07a1_iftrue : unsigned(31 downto 0);
signal fill_pixels_remaining_MUX_uxn_c_l133_c2_07a1_iffalse : unsigned(31 downto 0);
signal fill_pixels_remaining_MUX_uxn_c_l133_c2_07a1_return_output : unsigned(31 downto 0);

-- CONST_SR_20[uxn_c_l135_c18_07a3]
signal CONST_SR_20_uxn_c_l135_c18_07a3_x : unsigned(31 downto 0);
signal CONST_SR_20_uxn_c_l135_c18_07a3_return_output : unsigned(31 downto 0);

-- CONST_SR_21[uxn_c_l136_c17_d016]
signal CONST_SR_21_uxn_c_l136_c17_d016_x : unsigned(31 downto 0);
signal CONST_SR_21_uxn_c_l136_c17_d016_return_output : unsigned(31 downto 0);

-- BIN_OP_AND[uxn_c_l137_c27_c1fa]
signal BIN_OP_AND_uxn_c_l137_c27_c1fa_left : unsigned(31 downto 0);
signal BIN_OP_AND_uxn_c_l137_c27_c1fa_right : unsigned(17 downto 0);
signal BIN_OP_AND_uxn_c_l137_c27_c1fa_return_output : unsigned(31 downto 0);

-- BIN_OP_DIV[uxn_c_l138_c13_ba87]
signal BIN_OP_DIV_uxn_c_l138_c13_ba87_left : unsigned(31 downto 0);
signal BIN_OP_DIV_uxn_c_l138_c13_ba87_right : unsigned(8 downto 0);
signal BIN_OP_DIV_uxn_c_l138_c13_ba87_return_output : unsigned(31 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_c_l139_c38_3105]
signal BIN_OP_INFERRED_MULT_uxn_c_l139_c38_3105_left : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_c_l139_c38_3105_right : unsigned(8 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_c_l139_c38_3105_return_output : unsigned(24 downto 0);

-- BIN_OP_MINUS[uxn_c_l139_c13_1ad2]
signal BIN_OP_MINUS_uxn_c_l139_c13_1ad2_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_uxn_c_l139_c13_1ad2_right : unsigned(24 downto 0);
signal BIN_OP_MINUS_uxn_c_l139_c13_1ad2_return_output : unsigned(31 downto 0);

-- MUX[uxn_c_l140_c13_7735]
signal MUX_uxn_c_l140_c13_7735_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l140_c13_7735_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l140_c13_7735_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l140_c13_7735_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l141_c13_c778]
signal MUX_uxn_c_l141_c13_c778_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l141_c13_c778_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l141_c13_c778_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l141_c13_c778_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l142_c13_8bcc]
signal MUX_uxn_c_l142_c13_8bcc_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l142_c13_8bcc_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l142_c13_8bcc_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l142_c13_8bcc_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l143_c13_4255]
signal MUX_uxn_c_l143_c13_4255_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l143_c13_4255_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l143_c13_4255_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l143_c13_4255_return_output : unsigned(15 downto 0);

-- printf_uxn_c_l147_c3_705b[uxn_c_l147_c3_705b]
signal printf_uxn_c_l147_c3_705b_uxn_c_l147_c3_705b_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_c_l147_c3_705b_uxn_c_l147_c3_705b_arg0 : unsigned(31 downto 0);
signal printf_uxn_c_l147_c3_705b_uxn_c_l147_c3_705b_arg1 : unsigned(31 downto 0);
signal printf_uxn_c_l147_c3_705b_uxn_c_l147_c3_705b_arg2 : unsigned(31 downto 0);
signal printf_uxn_c_l147_c3_705b_uxn_c_l147_c3_705b_arg3 : unsigned(31 downto 0);
signal printf_uxn_c_l147_c3_705b_uxn_c_l147_c3_705b_arg4 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_c_l150_c19_90ba]
signal BIN_OP_EQ_uxn_c_l150_c19_90ba_left : unsigned(31 downto 0);
signal BIN_OP_EQ_uxn_c_l150_c19_90ba_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l150_c19_90ba_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l150_c19_bddb]
signal MUX_uxn_c_l150_c19_bddb_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l150_c19_bddb_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l150_c19_bddb_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l150_c19_bddb_return_output : unsigned(0 downto 0);

-- BIN_OP_GT[uxn_c_l152_c17_6b27]
signal BIN_OP_GT_uxn_c_l152_c17_6b27_left : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_c_l152_c17_6b27_right : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_c_l152_c17_6b27_return_output : unsigned(0 downto 0);

-- BIN_OP_LT[uxn_c_l153_c17_0eea]
signal BIN_OP_LT_uxn_c_l153_c17_0eea_left : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_c_l153_c17_0eea_right : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_c_l153_c17_0eea_return_output : unsigned(0 downto 0);

-- BIN_OP_GT[uxn_c_l154_c17_5b56]
signal BIN_OP_GT_uxn_c_l154_c17_5b56_left : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_c_l154_c17_5b56_right : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_c_l154_c17_5b56_return_output : unsigned(0 downto 0);

-- BIN_OP_LT[uxn_c_l155_c17_617a]
signal BIN_OP_LT_uxn_c_l155_c17_617a_left : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_c_l155_c17_617a_right : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_c_l155_c17_617a_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l157_c18_5fb6]
signal BIN_OP_AND_uxn_c_l157_c18_5fb6_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l157_c18_5fb6_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l157_c18_5fb6_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l157_c18_a00c]
signal BIN_OP_AND_uxn_c_l157_c18_a00c_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l157_c18_a00c_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l157_c18_a00c_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l157_c18_3daf]
signal BIN_OP_AND_uxn_c_l157_c18_3daf_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l157_c18_3daf_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l157_c18_3daf_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l157_c18_9edb]
signal BIN_OP_AND_uxn_c_l157_c18_9edb_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l157_c18_9edb_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l157_c18_9edb_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_c_l158_c37_5c24]
signal UNARY_OP_NOT_uxn_c_l158_c37_5c24_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l158_c37_5c24_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l158_c19_4422]
signal BIN_OP_AND_uxn_c_l158_c19_4422_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l158_c19_4422_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l158_c19_4422_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l159_c19_6747]
signal BIN_OP_AND_uxn_c_l159_c19_6747_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l159_c19_6747_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l159_c19_6747_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l163_c37_b5e5]
signal MUX_uxn_c_l163_c37_b5e5_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l163_c37_b5e5_iftrue : unsigned(31 downto 0);
signal MUX_uxn_c_l163_c37_b5e5_iffalse : unsigned(31 downto 0);
signal MUX_uxn_c_l163_c37_b5e5_return_output : unsigned(31 downto 0);

-- MUX[uxn_c_l163_c3_9512]
signal MUX_uxn_c_l163_c3_9512_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l163_c3_9512_iftrue : unsigned(31 downto 0);
signal MUX_uxn_c_l163_c3_9512_iffalse : unsigned(31 downto 0);
signal MUX_uxn_c_l163_c3_9512_return_output : unsigned(31 downto 0);

-- MUX[uxn_c_l164_c3_501a]
signal MUX_uxn_c_l164_c3_501a_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l164_c3_501a_iftrue : unsigned(1 downto 0);
signal MUX_uxn_c_l164_c3_501a_iffalse : unsigned(1 downto 0);
signal MUX_uxn_c_l164_c3_501a_return_output : unsigned(1 downto 0);

-- UNARY_OP_NOT[uxn_c_l165_c57_07ca]
signal UNARY_OP_NOT_uxn_c_l165_c57_07ca_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l165_c57_07ca_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l165_c22_675d]
signal BIN_OP_AND_uxn_c_l165_c22_675d_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l165_c22_675d_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l165_c22_675d_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_c_l165_c3_621f]
signal BIN_OP_OR_uxn_c_l165_c3_621f_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l165_c3_621f_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l165_c3_621f_return_output : unsigned(0 downto 0);

-- bg_vram_update[uxn_c_l161_c19_e744]
signal bg_vram_update_uxn_c_l161_c19_e744_CLOCK_ENABLE : unsigned(0 downto 0);
signal bg_vram_update_uxn_c_l161_c19_e744_read_address : unsigned(31 downto 0);
signal bg_vram_update_uxn_c_l161_c19_e744_write_address : unsigned(31 downto 0);
signal bg_vram_update_uxn_c_l161_c19_e744_write_value : unsigned(1 downto 0);
signal bg_vram_update_uxn_c_l161_c19_e744_write_enable : unsigned(0 downto 0);
signal bg_vram_update_uxn_c_l161_c19_e744_return_output : unsigned(1 downto 0);

-- MUX[uxn_c_l170_c37_4a70]
signal MUX_uxn_c_l170_c37_4a70_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l170_c37_4a70_iftrue : unsigned(31 downto 0);
signal MUX_uxn_c_l170_c37_4a70_iffalse : unsigned(31 downto 0);
signal MUX_uxn_c_l170_c37_4a70_return_output : unsigned(31 downto 0);

-- MUX[uxn_c_l170_c3_0ef5]
signal MUX_uxn_c_l170_c3_0ef5_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l170_c3_0ef5_iftrue : unsigned(31 downto 0);
signal MUX_uxn_c_l170_c3_0ef5_iffalse : unsigned(31 downto 0);
signal MUX_uxn_c_l170_c3_0ef5_return_output : unsigned(31 downto 0);

-- MUX[uxn_c_l171_c3_3323]
signal MUX_uxn_c_l171_c3_3323_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l171_c3_3323_iftrue : unsigned(1 downto 0);
signal MUX_uxn_c_l171_c3_3323_iffalse : unsigned(1 downto 0);
signal MUX_uxn_c_l171_c3_3323_return_output : unsigned(1 downto 0);

-- BIN_OP_AND[uxn_c_l172_c22_7473]
signal BIN_OP_AND_uxn_c_l172_c22_7473_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l172_c22_7473_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l172_c22_7473_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_c_l172_c3_0b4b]
signal BIN_OP_OR_uxn_c_l172_c3_0b4b_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l172_c3_0b4b_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l172_c3_0b4b_return_output : unsigned(0 downto 0);

-- fg_vram_update[uxn_c_l168_c19_f063]
signal fg_vram_update_uxn_c_l168_c19_f063_CLOCK_ENABLE : unsigned(0 downto 0);
signal fg_vram_update_uxn_c_l168_c19_f063_read_address : unsigned(31 downto 0);
signal fg_vram_update_uxn_c_l168_c19_f063_write_address : unsigned(31 downto 0);
signal fg_vram_update_uxn_c_l168_c19_f063_write_value : unsigned(1 downto 0);
signal fg_vram_update_uxn_c_l168_c19_f063_write_enable : unsigned(0 downto 0);
signal fg_vram_update_uxn_c_l168_c19_f063_return_output : unsigned(1 downto 0);

-- BIN_OP_EQ[uxn_c_l176_c6_72a7]
signal BIN_OP_EQ_uxn_c_l176_c6_72a7_left : unsigned(31 downto 0);
signal BIN_OP_EQ_uxn_c_l176_c6_72a7_right : unsigned(17 downto 0);
signal BIN_OP_EQ_uxn_c_l176_c6_72a7_return_output : unsigned(0 downto 0);

-- result_is_new_frame_MUX[uxn_c_l176_c2_2f39]
signal result_is_new_frame_MUX_uxn_c_l176_c2_2f39_cond : unsigned(0 downto 0);
signal result_is_new_frame_MUX_uxn_c_l176_c2_2f39_iftrue : unsigned(0 downto 0);
signal result_is_new_frame_MUX_uxn_c_l176_c2_2f39_iffalse : unsigned(0 downto 0);
signal result_is_new_frame_MUX_uxn_c_l176_c2_2f39_return_output : unsigned(0 downto 0);

-- pixel_counter_MUX[uxn_c_l176_c2_2f39]
signal pixel_counter_MUX_uxn_c_l176_c2_2f39_cond : unsigned(0 downto 0);
signal pixel_counter_MUX_uxn_c_l176_c2_2f39_iftrue : unsigned(31 downto 0);
signal pixel_counter_MUX_uxn_c_l176_c2_2f39_iffalse : unsigned(31 downto 0);
signal pixel_counter_MUX_uxn_c_l176_c2_2f39_return_output : unsigned(31 downto 0);

-- fill_pixels_remaining_MUX[uxn_c_l176_c2_2f39]
signal fill_pixels_remaining_MUX_uxn_c_l176_c2_2f39_cond : unsigned(0 downto 0);
signal fill_pixels_remaining_MUX_uxn_c_l176_c2_2f39_iftrue : unsigned(31 downto 0);
signal fill_pixels_remaining_MUX_uxn_c_l176_c2_2f39_iffalse : unsigned(31 downto 0);
signal fill_pixels_remaining_MUX_uxn_c_l176_c2_2f39_return_output : unsigned(31 downto 0);

-- result_is_new_frame_MUX[uxn_c_l179_c9_a1da]
signal result_is_new_frame_MUX_uxn_c_l179_c9_a1da_cond : unsigned(0 downto 0);
signal result_is_new_frame_MUX_uxn_c_l179_c9_a1da_iftrue : unsigned(0 downto 0);
signal result_is_new_frame_MUX_uxn_c_l179_c9_a1da_iffalse : unsigned(0 downto 0);
signal result_is_new_frame_MUX_uxn_c_l179_c9_a1da_return_output : unsigned(0 downto 0);

-- pixel_counter_MUX[uxn_c_l179_c9_a1da]
signal pixel_counter_MUX_uxn_c_l179_c9_a1da_cond : unsigned(0 downto 0);
signal pixel_counter_MUX_uxn_c_l179_c9_a1da_iftrue : unsigned(31 downto 0);
signal pixel_counter_MUX_uxn_c_l179_c9_a1da_iffalse : unsigned(31 downto 0);
signal pixel_counter_MUX_uxn_c_l179_c9_a1da_return_output : unsigned(31 downto 0);

-- fill_pixels_remaining_MUX[uxn_c_l179_c9_a1da]
signal fill_pixels_remaining_MUX_uxn_c_l179_c9_a1da_cond : unsigned(0 downto 0);
signal fill_pixels_remaining_MUX_uxn_c_l179_c9_a1da_iftrue : unsigned(31 downto 0);
signal fill_pixels_remaining_MUX_uxn_c_l179_c9_a1da_iffalse : unsigned(31 downto 0);
signal fill_pixels_remaining_MUX_uxn_c_l179_c9_a1da_return_output : unsigned(31 downto 0);

-- BIN_OP_PLUS[uxn_c_l181_c3_d407]
signal BIN_OP_PLUS_uxn_c_l181_c3_d407_left : unsigned(31 downto 0);
signal BIN_OP_PLUS_uxn_c_l181_c3_d407_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l181_c3_d407_return_output : unsigned(32 downto 0);

-- BIN_OP_EQ[uxn_c_l182_c27_d45e]
signal BIN_OP_EQ_uxn_c_l182_c27_d45e_left : unsigned(31 downto 0);
signal BIN_OP_EQ_uxn_c_l182_c27_d45e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l182_c27_d45e_return_output : unsigned(0 downto 0);

-- BIN_OP_MINUS[uxn_c_l182_c60_46c5]
signal BIN_OP_MINUS_uxn_c_l182_c60_46c5_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_uxn_c_l182_c60_46c5_right : unsigned(0 downto 0);
signal BIN_OP_MINUS_uxn_c_l182_c60_46c5_return_output : unsigned(31 downto 0);

-- MUX[uxn_c_l182_c27_dffd]
signal MUX_uxn_c_l182_c27_dffd_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l182_c27_dffd_iftrue : unsigned(31 downto 0);
signal MUX_uxn_c_l182_c27_dffd_iffalse : unsigned(31 downto 0);
signal MUX_uxn_c_l182_c27_dffd_return_output : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_c_l185_c17_2ff2]
signal BIN_OP_EQ_uxn_c_l185_c17_2ff2_left : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l185_c17_2ff2_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l185_c17_2ff2_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l185_c17_27d3]
signal MUX_uxn_c_l185_c17_27d3_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l185_c17_27d3_iftrue : unsigned(1 downto 0);
signal MUX_uxn_c_l185_c17_27d3_iffalse : unsigned(1 downto 0);
signal MUX_uxn_c_l185_c17_27d3_return_output : unsigned(1 downto 0);

-- UNARY_OP_NOT_uint1_t_uxn_c_l172_l165_DUPLICATE_69ad
signal UNARY_OP_NOT_uint1_t_uxn_c_l172_l165_DUPLICATE_69ad_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uint1_t_uxn_c_l172_l165_DUPLICATE_69ad_return_output : unsigned(0 downto 0);

-- BIN_OP_AND_uint1_t_uint1_t_uxn_c_l172_l165_DUPLICATE_8dfe
signal BIN_OP_AND_uint1_t_uint1_t_uxn_c_l172_l165_DUPLICATE_8dfe_left : unsigned(0 downto 0);
signal BIN_OP_AND_uint1_t_uint1_t_uxn_c_l172_l165_DUPLICATE_8dfe_right : unsigned(0 downto 0);
signal BIN_OP_AND_uint1_t_uint1_t_uxn_c_l172_l165_DUPLICATE_8dfe_return_output : unsigned(0 downto 0);

function CAST_TO_uint4_t_uint32_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(31 downto 0);
  variable return_output : unsigned(3 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,4)));
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
-- BIN_OP_GT_uxn_c_l126_c26_8160
BIN_OP_GT_uxn_c_l126_c26_8160 : entity work.BIN_OP_GT_uint32_t_uint18_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_c_l126_c26_8160_left,
BIN_OP_GT_uxn_c_l126_c26_8160_right,
BIN_OP_GT_uxn_c_l126_c26_8160_return_output);

-- MUX_uxn_c_l126_c26_fc2d
MUX_uxn_c_l126_c26_fc2d : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
MUX_uxn_c_l126_c26_fc2d_cond,
MUX_uxn_c_l126_c26_fc2d_iftrue,
MUX_uxn_c_l126_c26_fc2d_iffalse,
MUX_uxn_c_l126_c26_fc2d_return_output);

-- CONST_SR_28_uxn_c_l127_c24_6955
CONST_SR_28_uxn_c_l127_c24_6955 : entity work.CONST_SR_28_uint32_t_0CLK_de264c78 port map (
CONST_SR_28_uxn_c_l127_c24_6955_x,
CONST_SR_28_uxn_c_l127_c24_6955_return_output);

-- BIN_OP_EQ_uxn_c_l128_c17_4b2e
BIN_OP_EQ_uxn_c_l128_c17_4b2e : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l128_c17_4b2e_left,
BIN_OP_EQ_uxn_c_l128_c17_4b2e_right,
BIN_OP_EQ_uxn_c_l128_c17_4b2e_return_output);

-- MUX_uxn_c_l128_c17_6b93
MUX_uxn_c_l128_c17_6b93 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l128_c17_6b93_cond,
MUX_uxn_c_l128_c17_6b93_iftrue,
MUX_uxn_c_l128_c17_6b93_iffalse,
MUX_uxn_c_l128_c17_6b93_return_output);

-- BIN_OP_DIV_uxn_c_l129_c6_2979
BIN_OP_DIV_uxn_c_l129_c6_2979 : entity work.BIN_OP_DIV_uint32_t_uint9_t_0CLK_422b4ffb port map (
BIN_OP_DIV_uxn_c_l129_c6_2979_left,
BIN_OP_DIV_uxn_c_l129_c6_2979_right,
BIN_OP_DIV_uxn_c_l129_c6_2979_return_output);

-- BIN_OP_INFERRED_MULT_uxn_c_l130_c23_7611
BIN_OP_INFERRED_MULT_uxn_c_l130_c23_7611 : entity work.BIN_OP_INFERRED_MULT_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_c_l130_c23_7611_left,
BIN_OP_INFERRED_MULT_uxn_c_l130_c23_7611_right,
BIN_OP_INFERRED_MULT_uxn_c_l130_c23_7611_return_output);

-- BIN_OP_MINUS_uxn_c_l130_c6_222f
BIN_OP_MINUS_uxn_c_l130_c6_222f : entity work.BIN_OP_MINUS_uint32_t_uint25_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l130_c6_222f_left,
BIN_OP_MINUS_uxn_c_l130_c6_222f_right,
BIN_OP_MINUS_uxn_c_l130_c6_222f_return_output);

-- UNARY_OP_NOT_uxn_c_l133_c22_810a
UNARY_OP_NOT_uxn_c_l133_c22_810a : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l133_c22_810a_expr,
UNARY_OP_NOT_uxn_c_l133_c22_810a_return_output);

-- BIN_OP_AND_uxn_c_l133_c6_f0b5
BIN_OP_AND_uxn_c_l133_c6_f0b5 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l133_c6_f0b5_left,
BIN_OP_AND_uxn_c_l133_c6_f0b5_right,
BIN_OP_AND_uxn_c_l133_c6_f0b5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l133_c1_74f4
TRUE_CLOCK_ENABLE_MUX_uxn_c_l133_c1_74f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l133_c1_74f4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l133_c1_74f4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l133_c1_74f4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l133_c1_74f4_return_output);

-- fill_y0_MUX_uxn_c_l133_c2_07a1
fill_y0_MUX_uxn_c_l133_c2_07a1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_y0_MUX_uxn_c_l133_c2_07a1_cond,
fill_y0_MUX_uxn_c_l133_c2_07a1_iftrue,
fill_y0_MUX_uxn_c_l133_c2_07a1_iffalse,
fill_y0_MUX_uxn_c_l133_c2_07a1_return_output);

-- is_fill_left_MUX_uxn_c_l133_c2_07a1
is_fill_left_MUX_uxn_c_l133_c2_07a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_left_MUX_uxn_c_l133_c2_07a1_cond,
is_fill_left_MUX_uxn_c_l133_c2_07a1_iftrue,
is_fill_left_MUX_uxn_c_l133_c2_07a1_iffalse,
is_fill_left_MUX_uxn_c_l133_c2_07a1_return_output);

-- fill_layer_MUX_uxn_c_l133_c2_07a1
fill_layer_MUX_uxn_c_l133_c2_07a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
fill_layer_MUX_uxn_c_l133_c2_07a1_cond,
fill_layer_MUX_uxn_c_l133_c2_07a1_iftrue,
fill_layer_MUX_uxn_c_l133_c2_07a1_iffalse,
fill_layer_MUX_uxn_c_l133_c2_07a1_return_output);

-- fill_y1_MUX_uxn_c_l133_c2_07a1
fill_y1_MUX_uxn_c_l133_c2_07a1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_y1_MUX_uxn_c_l133_c2_07a1_cond,
fill_y1_MUX_uxn_c_l133_c2_07a1_iftrue,
fill_y1_MUX_uxn_c_l133_c2_07a1_iffalse,
fill_y1_MUX_uxn_c_l133_c2_07a1_return_output);

-- fill_color_MUX_uxn_c_l133_c2_07a1
fill_color_MUX_uxn_c_l133_c2_07a1 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
fill_color_MUX_uxn_c_l133_c2_07a1_cond,
fill_color_MUX_uxn_c_l133_c2_07a1_iftrue,
fill_color_MUX_uxn_c_l133_c2_07a1_iffalse,
fill_color_MUX_uxn_c_l133_c2_07a1_return_output);

-- fill_x1_MUX_uxn_c_l133_c2_07a1
fill_x1_MUX_uxn_c_l133_c2_07a1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_x1_MUX_uxn_c_l133_c2_07a1_cond,
fill_x1_MUX_uxn_c_l133_c2_07a1_iftrue,
fill_x1_MUX_uxn_c_l133_c2_07a1_iffalse,
fill_x1_MUX_uxn_c_l133_c2_07a1_return_output);

-- is_fill_top_MUX_uxn_c_l133_c2_07a1
is_fill_top_MUX_uxn_c_l133_c2_07a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_top_MUX_uxn_c_l133_c2_07a1_cond,
is_fill_top_MUX_uxn_c_l133_c2_07a1_iftrue,
is_fill_top_MUX_uxn_c_l133_c2_07a1_iffalse,
is_fill_top_MUX_uxn_c_l133_c2_07a1_return_output);

-- fill_x0_MUX_uxn_c_l133_c2_07a1
fill_x0_MUX_uxn_c_l133_c2_07a1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_x0_MUX_uxn_c_l133_c2_07a1_cond,
fill_x0_MUX_uxn_c_l133_c2_07a1_iftrue,
fill_x0_MUX_uxn_c_l133_c2_07a1_iffalse,
fill_x0_MUX_uxn_c_l133_c2_07a1_return_output);

-- fill_pixels_remaining_MUX_uxn_c_l133_c2_07a1
fill_pixels_remaining_MUX_uxn_c_l133_c2_07a1 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
fill_pixels_remaining_MUX_uxn_c_l133_c2_07a1_cond,
fill_pixels_remaining_MUX_uxn_c_l133_c2_07a1_iftrue,
fill_pixels_remaining_MUX_uxn_c_l133_c2_07a1_iffalse,
fill_pixels_remaining_MUX_uxn_c_l133_c2_07a1_return_output);

-- CONST_SR_20_uxn_c_l135_c18_07a3
CONST_SR_20_uxn_c_l135_c18_07a3 : entity work.CONST_SR_20_uint32_t_0CLK_de264c78 port map (
CONST_SR_20_uxn_c_l135_c18_07a3_x,
CONST_SR_20_uxn_c_l135_c18_07a3_return_output);

-- CONST_SR_21_uxn_c_l136_c17_d016
CONST_SR_21_uxn_c_l136_c17_d016 : entity work.CONST_SR_21_uint32_t_0CLK_de264c78 port map (
CONST_SR_21_uxn_c_l136_c17_d016_x,
CONST_SR_21_uxn_c_l136_c17_d016_return_output);

-- BIN_OP_AND_uxn_c_l137_c27_c1fa
BIN_OP_AND_uxn_c_l137_c27_c1fa : entity work.BIN_OP_AND_uint32_t_uint18_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l137_c27_c1fa_left,
BIN_OP_AND_uxn_c_l137_c27_c1fa_right,
BIN_OP_AND_uxn_c_l137_c27_c1fa_return_output);

-- BIN_OP_DIV_uxn_c_l138_c13_ba87
BIN_OP_DIV_uxn_c_l138_c13_ba87 : entity work.BIN_OP_DIV_uint32_t_uint9_t_0CLK_422b4ffb port map (
BIN_OP_DIV_uxn_c_l138_c13_ba87_left,
BIN_OP_DIV_uxn_c_l138_c13_ba87_right,
BIN_OP_DIV_uxn_c_l138_c13_ba87_return_output);

-- BIN_OP_INFERRED_MULT_uxn_c_l139_c38_3105
BIN_OP_INFERRED_MULT_uxn_c_l139_c38_3105 : entity work.BIN_OP_INFERRED_MULT_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_c_l139_c38_3105_left,
BIN_OP_INFERRED_MULT_uxn_c_l139_c38_3105_right,
BIN_OP_INFERRED_MULT_uxn_c_l139_c38_3105_return_output);

-- BIN_OP_MINUS_uxn_c_l139_c13_1ad2
BIN_OP_MINUS_uxn_c_l139_c13_1ad2 : entity work.BIN_OP_MINUS_uint32_t_uint25_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l139_c13_1ad2_left,
BIN_OP_MINUS_uxn_c_l139_c13_1ad2_right,
BIN_OP_MINUS_uxn_c_l139_c13_1ad2_return_output);

-- MUX_uxn_c_l140_c13_7735
MUX_uxn_c_l140_c13_7735 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l140_c13_7735_cond,
MUX_uxn_c_l140_c13_7735_iftrue,
MUX_uxn_c_l140_c13_7735_iffalse,
MUX_uxn_c_l140_c13_7735_return_output);

-- MUX_uxn_c_l141_c13_c778
MUX_uxn_c_l141_c13_c778 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l141_c13_c778_cond,
MUX_uxn_c_l141_c13_c778_iftrue,
MUX_uxn_c_l141_c13_c778_iffalse,
MUX_uxn_c_l141_c13_c778_return_output);

-- MUX_uxn_c_l142_c13_8bcc
MUX_uxn_c_l142_c13_8bcc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l142_c13_8bcc_cond,
MUX_uxn_c_l142_c13_8bcc_iftrue,
MUX_uxn_c_l142_c13_8bcc_iffalse,
MUX_uxn_c_l142_c13_8bcc_return_output);

-- MUX_uxn_c_l143_c13_4255
MUX_uxn_c_l143_c13_4255 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l143_c13_4255_cond,
MUX_uxn_c_l143_c13_4255_iftrue,
MUX_uxn_c_l143_c13_4255_iffalse,
MUX_uxn_c_l143_c13_4255_return_output);

-- printf_uxn_c_l147_c3_705b_uxn_c_l147_c3_705b
printf_uxn_c_l147_c3_705b_uxn_c_l147_c3_705b : entity work.printf_uxn_c_l147_c3_705b_0CLK_de264c78 port map (
printf_uxn_c_l147_c3_705b_uxn_c_l147_c3_705b_CLOCK_ENABLE,
printf_uxn_c_l147_c3_705b_uxn_c_l147_c3_705b_arg0,
printf_uxn_c_l147_c3_705b_uxn_c_l147_c3_705b_arg1,
printf_uxn_c_l147_c3_705b_uxn_c_l147_c3_705b_arg2,
printf_uxn_c_l147_c3_705b_uxn_c_l147_c3_705b_arg3,
printf_uxn_c_l147_c3_705b_uxn_c_l147_c3_705b_arg4);

-- BIN_OP_EQ_uxn_c_l150_c19_90ba
BIN_OP_EQ_uxn_c_l150_c19_90ba : entity work.BIN_OP_EQ_uint32_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l150_c19_90ba_left,
BIN_OP_EQ_uxn_c_l150_c19_90ba_right,
BIN_OP_EQ_uxn_c_l150_c19_90ba_return_output);

-- MUX_uxn_c_l150_c19_bddb
MUX_uxn_c_l150_c19_bddb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l150_c19_bddb_cond,
MUX_uxn_c_l150_c19_bddb_iftrue,
MUX_uxn_c_l150_c19_bddb_iffalse,
MUX_uxn_c_l150_c19_bddb_return_output);

-- BIN_OP_GT_uxn_c_l152_c17_6b27
BIN_OP_GT_uxn_c_l152_c17_6b27 : entity work.BIN_OP_GT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_c_l152_c17_6b27_left,
BIN_OP_GT_uxn_c_l152_c17_6b27_right,
BIN_OP_GT_uxn_c_l152_c17_6b27_return_output);

-- BIN_OP_LT_uxn_c_l153_c17_0eea
BIN_OP_LT_uxn_c_l153_c17_0eea : entity work.BIN_OP_LT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_LT_uxn_c_l153_c17_0eea_left,
BIN_OP_LT_uxn_c_l153_c17_0eea_right,
BIN_OP_LT_uxn_c_l153_c17_0eea_return_output);

-- BIN_OP_GT_uxn_c_l154_c17_5b56
BIN_OP_GT_uxn_c_l154_c17_5b56 : entity work.BIN_OP_GT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_c_l154_c17_5b56_left,
BIN_OP_GT_uxn_c_l154_c17_5b56_right,
BIN_OP_GT_uxn_c_l154_c17_5b56_return_output);

-- BIN_OP_LT_uxn_c_l155_c17_617a
BIN_OP_LT_uxn_c_l155_c17_617a : entity work.BIN_OP_LT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_LT_uxn_c_l155_c17_617a_left,
BIN_OP_LT_uxn_c_l155_c17_617a_right,
BIN_OP_LT_uxn_c_l155_c17_617a_return_output);

-- BIN_OP_AND_uxn_c_l157_c18_5fb6
BIN_OP_AND_uxn_c_l157_c18_5fb6 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l157_c18_5fb6_left,
BIN_OP_AND_uxn_c_l157_c18_5fb6_right,
BIN_OP_AND_uxn_c_l157_c18_5fb6_return_output);

-- BIN_OP_AND_uxn_c_l157_c18_a00c
BIN_OP_AND_uxn_c_l157_c18_a00c : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l157_c18_a00c_left,
BIN_OP_AND_uxn_c_l157_c18_a00c_right,
BIN_OP_AND_uxn_c_l157_c18_a00c_return_output);

-- BIN_OP_AND_uxn_c_l157_c18_3daf
BIN_OP_AND_uxn_c_l157_c18_3daf : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l157_c18_3daf_left,
BIN_OP_AND_uxn_c_l157_c18_3daf_right,
BIN_OP_AND_uxn_c_l157_c18_3daf_return_output);

-- BIN_OP_AND_uxn_c_l157_c18_9edb
BIN_OP_AND_uxn_c_l157_c18_9edb : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l157_c18_9edb_left,
BIN_OP_AND_uxn_c_l157_c18_9edb_right,
BIN_OP_AND_uxn_c_l157_c18_9edb_return_output);

-- UNARY_OP_NOT_uxn_c_l158_c37_5c24
UNARY_OP_NOT_uxn_c_l158_c37_5c24 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l158_c37_5c24_expr,
UNARY_OP_NOT_uxn_c_l158_c37_5c24_return_output);

-- BIN_OP_AND_uxn_c_l158_c19_4422
BIN_OP_AND_uxn_c_l158_c19_4422 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l158_c19_4422_left,
BIN_OP_AND_uxn_c_l158_c19_4422_right,
BIN_OP_AND_uxn_c_l158_c19_4422_return_output);

-- BIN_OP_AND_uxn_c_l159_c19_6747
BIN_OP_AND_uxn_c_l159_c19_6747 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l159_c19_6747_left,
BIN_OP_AND_uxn_c_l159_c19_6747_right,
BIN_OP_AND_uxn_c_l159_c19_6747_return_output);

-- MUX_uxn_c_l163_c37_b5e5
MUX_uxn_c_l163_c37_b5e5 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
MUX_uxn_c_l163_c37_b5e5_cond,
MUX_uxn_c_l163_c37_b5e5_iftrue,
MUX_uxn_c_l163_c37_b5e5_iffalse,
MUX_uxn_c_l163_c37_b5e5_return_output);

-- MUX_uxn_c_l163_c3_9512
MUX_uxn_c_l163_c3_9512 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
MUX_uxn_c_l163_c3_9512_cond,
MUX_uxn_c_l163_c3_9512_iftrue,
MUX_uxn_c_l163_c3_9512_iffalse,
MUX_uxn_c_l163_c3_9512_return_output);

-- MUX_uxn_c_l164_c3_501a
MUX_uxn_c_l164_c3_501a : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
MUX_uxn_c_l164_c3_501a_cond,
MUX_uxn_c_l164_c3_501a_iftrue,
MUX_uxn_c_l164_c3_501a_iffalse,
MUX_uxn_c_l164_c3_501a_return_output);

-- UNARY_OP_NOT_uxn_c_l165_c57_07ca
UNARY_OP_NOT_uxn_c_l165_c57_07ca : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l165_c57_07ca_expr,
UNARY_OP_NOT_uxn_c_l165_c57_07ca_return_output);

-- BIN_OP_AND_uxn_c_l165_c22_675d
BIN_OP_AND_uxn_c_l165_c22_675d : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l165_c22_675d_left,
BIN_OP_AND_uxn_c_l165_c22_675d_right,
BIN_OP_AND_uxn_c_l165_c22_675d_return_output);

-- BIN_OP_OR_uxn_c_l165_c3_621f
BIN_OP_OR_uxn_c_l165_c3_621f : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l165_c3_621f_left,
BIN_OP_OR_uxn_c_l165_c3_621f_right,
BIN_OP_OR_uxn_c_l165_c3_621f_return_output);

-- bg_vram_update_uxn_c_l161_c19_e744
bg_vram_update_uxn_c_l161_c19_e744 : entity work.bg_vram_update_0CLK_b45f1687 port map (
clk,
bg_vram_update_uxn_c_l161_c19_e744_CLOCK_ENABLE,
bg_vram_update_uxn_c_l161_c19_e744_read_address,
bg_vram_update_uxn_c_l161_c19_e744_write_address,
bg_vram_update_uxn_c_l161_c19_e744_write_value,
bg_vram_update_uxn_c_l161_c19_e744_write_enable,
bg_vram_update_uxn_c_l161_c19_e744_return_output);

-- MUX_uxn_c_l170_c37_4a70
MUX_uxn_c_l170_c37_4a70 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
MUX_uxn_c_l170_c37_4a70_cond,
MUX_uxn_c_l170_c37_4a70_iftrue,
MUX_uxn_c_l170_c37_4a70_iffalse,
MUX_uxn_c_l170_c37_4a70_return_output);

-- MUX_uxn_c_l170_c3_0ef5
MUX_uxn_c_l170_c3_0ef5 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
MUX_uxn_c_l170_c3_0ef5_cond,
MUX_uxn_c_l170_c3_0ef5_iftrue,
MUX_uxn_c_l170_c3_0ef5_iffalse,
MUX_uxn_c_l170_c3_0ef5_return_output);

-- MUX_uxn_c_l171_c3_3323
MUX_uxn_c_l171_c3_3323 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
MUX_uxn_c_l171_c3_3323_cond,
MUX_uxn_c_l171_c3_3323_iftrue,
MUX_uxn_c_l171_c3_3323_iffalse,
MUX_uxn_c_l171_c3_3323_return_output);

-- BIN_OP_AND_uxn_c_l172_c22_7473
BIN_OP_AND_uxn_c_l172_c22_7473 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l172_c22_7473_left,
BIN_OP_AND_uxn_c_l172_c22_7473_right,
BIN_OP_AND_uxn_c_l172_c22_7473_return_output);

-- BIN_OP_OR_uxn_c_l172_c3_0b4b
BIN_OP_OR_uxn_c_l172_c3_0b4b : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l172_c3_0b4b_left,
BIN_OP_OR_uxn_c_l172_c3_0b4b_right,
BIN_OP_OR_uxn_c_l172_c3_0b4b_return_output);

-- fg_vram_update_uxn_c_l168_c19_f063
fg_vram_update_uxn_c_l168_c19_f063 : entity work.fg_vram_update_0CLK_b45f1687 port map (
clk,
fg_vram_update_uxn_c_l168_c19_f063_CLOCK_ENABLE,
fg_vram_update_uxn_c_l168_c19_f063_read_address,
fg_vram_update_uxn_c_l168_c19_f063_write_address,
fg_vram_update_uxn_c_l168_c19_f063_write_value,
fg_vram_update_uxn_c_l168_c19_f063_write_enable,
fg_vram_update_uxn_c_l168_c19_f063_return_output);

-- BIN_OP_EQ_uxn_c_l176_c6_72a7
BIN_OP_EQ_uxn_c_l176_c6_72a7 : entity work.BIN_OP_EQ_uint32_t_uint18_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l176_c6_72a7_left,
BIN_OP_EQ_uxn_c_l176_c6_72a7_right,
BIN_OP_EQ_uxn_c_l176_c6_72a7_return_output);

-- result_is_new_frame_MUX_uxn_c_l176_c2_2f39
result_is_new_frame_MUX_uxn_c_l176_c2_2f39 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_new_frame_MUX_uxn_c_l176_c2_2f39_cond,
result_is_new_frame_MUX_uxn_c_l176_c2_2f39_iftrue,
result_is_new_frame_MUX_uxn_c_l176_c2_2f39_iffalse,
result_is_new_frame_MUX_uxn_c_l176_c2_2f39_return_output);

-- pixel_counter_MUX_uxn_c_l176_c2_2f39
pixel_counter_MUX_uxn_c_l176_c2_2f39 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
pixel_counter_MUX_uxn_c_l176_c2_2f39_cond,
pixel_counter_MUX_uxn_c_l176_c2_2f39_iftrue,
pixel_counter_MUX_uxn_c_l176_c2_2f39_iffalse,
pixel_counter_MUX_uxn_c_l176_c2_2f39_return_output);

-- fill_pixels_remaining_MUX_uxn_c_l176_c2_2f39
fill_pixels_remaining_MUX_uxn_c_l176_c2_2f39 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
fill_pixels_remaining_MUX_uxn_c_l176_c2_2f39_cond,
fill_pixels_remaining_MUX_uxn_c_l176_c2_2f39_iftrue,
fill_pixels_remaining_MUX_uxn_c_l176_c2_2f39_iffalse,
fill_pixels_remaining_MUX_uxn_c_l176_c2_2f39_return_output);

-- result_is_new_frame_MUX_uxn_c_l179_c9_a1da
result_is_new_frame_MUX_uxn_c_l179_c9_a1da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_new_frame_MUX_uxn_c_l179_c9_a1da_cond,
result_is_new_frame_MUX_uxn_c_l179_c9_a1da_iftrue,
result_is_new_frame_MUX_uxn_c_l179_c9_a1da_iffalse,
result_is_new_frame_MUX_uxn_c_l179_c9_a1da_return_output);

-- pixel_counter_MUX_uxn_c_l179_c9_a1da
pixel_counter_MUX_uxn_c_l179_c9_a1da : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
pixel_counter_MUX_uxn_c_l179_c9_a1da_cond,
pixel_counter_MUX_uxn_c_l179_c9_a1da_iftrue,
pixel_counter_MUX_uxn_c_l179_c9_a1da_iffalse,
pixel_counter_MUX_uxn_c_l179_c9_a1da_return_output);

-- fill_pixels_remaining_MUX_uxn_c_l179_c9_a1da
fill_pixels_remaining_MUX_uxn_c_l179_c9_a1da : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
fill_pixels_remaining_MUX_uxn_c_l179_c9_a1da_cond,
fill_pixels_remaining_MUX_uxn_c_l179_c9_a1da_iftrue,
fill_pixels_remaining_MUX_uxn_c_l179_c9_a1da_iffalse,
fill_pixels_remaining_MUX_uxn_c_l179_c9_a1da_return_output);

-- BIN_OP_PLUS_uxn_c_l181_c3_d407
BIN_OP_PLUS_uxn_c_l181_c3_d407 : entity work.BIN_OP_PLUS_uint32_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l181_c3_d407_left,
BIN_OP_PLUS_uxn_c_l181_c3_d407_right,
BIN_OP_PLUS_uxn_c_l181_c3_d407_return_output);

-- BIN_OP_EQ_uxn_c_l182_c27_d45e
BIN_OP_EQ_uxn_c_l182_c27_d45e : entity work.BIN_OP_EQ_uint32_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l182_c27_d45e_left,
BIN_OP_EQ_uxn_c_l182_c27_d45e_right,
BIN_OP_EQ_uxn_c_l182_c27_d45e_return_output);

-- BIN_OP_MINUS_uxn_c_l182_c60_46c5
BIN_OP_MINUS_uxn_c_l182_c60_46c5 : entity work.BIN_OP_MINUS_uint32_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l182_c60_46c5_left,
BIN_OP_MINUS_uxn_c_l182_c60_46c5_right,
BIN_OP_MINUS_uxn_c_l182_c60_46c5_return_output);

-- MUX_uxn_c_l182_c27_dffd
MUX_uxn_c_l182_c27_dffd : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
MUX_uxn_c_l182_c27_dffd_cond,
MUX_uxn_c_l182_c27_dffd_iftrue,
MUX_uxn_c_l182_c27_dffd_iffalse,
MUX_uxn_c_l182_c27_dffd_return_output);

-- BIN_OP_EQ_uxn_c_l185_c17_2ff2
BIN_OP_EQ_uxn_c_l185_c17_2ff2 : entity work.BIN_OP_EQ_uint2_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l185_c17_2ff2_left,
BIN_OP_EQ_uxn_c_l185_c17_2ff2_right,
BIN_OP_EQ_uxn_c_l185_c17_2ff2_return_output);

-- MUX_uxn_c_l185_c17_27d3
MUX_uxn_c_l185_c17_27d3 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
MUX_uxn_c_l185_c17_27d3_cond,
MUX_uxn_c_l185_c17_27d3_iftrue,
MUX_uxn_c_l185_c17_27d3_iffalse,
MUX_uxn_c_l185_c17_27d3_return_output);

-- UNARY_OP_NOT_uint1_t_uxn_c_l172_l165_DUPLICATE_69ad
UNARY_OP_NOT_uint1_t_uxn_c_l172_l165_DUPLICATE_69ad : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uint1_t_uxn_c_l172_l165_DUPLICATE_69ad_expr,
UNARY_OP_NOT_uint1_t_uxn_c_l172_l165_DUPLICATE_69ad_return_output);

-- BIN_OP_AND_uint1_t_uint1_t_uxn_c_l172_l165_DUPLICATE_8dfe
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l172_l165_DUPLICATE_8dfe : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l172_l165_DUPLICATE_8dfe_left,
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l172_l165_DUPLICATE_8dfe_right,
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l172_l165_DUPLICATE_8dfe_return_output);



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
 BIN_OP_GT_uxn_c_l126_c26_8160_return_output,
 MUX_uxn_c_l126_c26_fc2d_return_output,
 CONST_SR_28_uxn_c_l127_c24_6955_return_output,
 BIN_OP_EQ_uxn_c_l128_c17_4b2e_return_output,
 MUX_uxn_c_l128_c17_6b93_return_output,
 BIN_OP_DIV_uxn_c_l129_c6_2979_return_output,
 BIN_OP_INFERRED_MULT_uxn_c_l130_c23_7611_return_output,
 BIN_OP_MINUS_uxn_c_l130_c6_222f_return_output,
 UNARY_OP_NOT_uxn_c_l133_c22_810a_return_output,
 BIN_OP_AND_uxn_c_l133_c6_f0b5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l133_c1_74f4_return_output,
 fill_y0_MUX_uxn_c_l133_c2_07a1_return_output,
 is_fill_left_MUX_uxn_c_l133_c2_07a1_return_output,
 fill_layer_MUX_uxn_c_l133_c2_07a1_return_output,
 fill_y1_MUX_uxn_c_l133_c2_07a1_return_output,
 fill_color_MUX_uxn_c_l133_c2_07a1_return_output,
 fill_x1_MUX_uxn_c_l133_c2_07a1_return_output,
 is_fill_top_MUX_uxn_c_l133_c2_07a1_return_output,
 fill_x0_MUX_uxn_c_l133_c2_07a1_return_output,
 fill_pixels_remaining_MUX_uxn_c_l133_c2_07a1_return_output,
 CONST_SR_20_uxn_c_l135_c18_07a3_return_output,
 CONST_SR_21_uxn_c_l136_c17_d016_return_output,
 BIN_OP_AND_uxn_c_l137_c27_c1fa_return_output,
 BIN_OP_DIV_uxn_c_l138_c13_ba87_return_output,
 BIN_OP_INFERRED_MULT_uxn_c_l139_c38_3105_return_output,
 BIN_OP_MINUS_uxn_c_l139_c13_1ad2_return_output,
 MUX_uxn_c_l140_c13_7735_return_output,
 MUX_uxn_c_l141_c13_c778_return_output,
 MUX_uxn_c_l142_c13_8bcc_return_output,
 MUX_uxn_c_l143_c13_4255_return_output,
 BIN_OP_EQ_uxn_c_l150_c19_90ba_return_output,
 MUX_uxn_c_l150_c19_bddb_return_output,
 BIN_OP_GT_uxn_c_l152_c17_6b27_return_output,
 BIN_OP_LT_uxn_c_l153_c17_0eea_return_output,
 BIN_OP_GT_uxn_c_l154_c17_5b56_return_output,
 BIN_OP_LT_uxn_c_l155_c17_617a_return_output,
 BIN_OP_AND_uxn_c_l157_c18_5fb6_return_output,
 BIN_OP_AND_uxn_c_l157_c18_a00c_return_output,
 BIN_OP_AND_uxn_c_l157_c18_3daf_return_output,
 BIN_OP_AND_uxn_c_l157_c18_9edb_return_output,
 UNARY_OP_NOT_uxn_c_l158_c37_5c24_return_output,
 BIN_OP_AND_uxn_c_l158_c19_4422_return_output,
 BIN_OP_AND_uxn_c_l159_c19_6747_return_output,
 MUX_uxn_c_l163_c37_b5e5_return_output,
 MUX_uxn_c_l163_c3_9512_return_output,
 MUX_uxn_c_l164_c3_501a_return_output,
 UNARY_OP_NOT_uxn_c_l165_c57_07ca_return_output,
 BIN_OP_AND_uxn_c_l165_c22_675d_return_output,
 BIN_OP_OR_uxn_c_l165_c3_621f_return_output,
 bg_vram_update_uxn_c_l161_c19_e744_return_output,
 MUX_uxn_c_l170_c37_4a70_return_output,
 MUX_uxn_c_l170_c3_0ef5_return_output,
 MUX_uxn_c_l171_c3_3323_return_output,
 BIN_OP_AND_uxn_c_l172_c22_7473_return_output,
 BIN_OP_OR_uxn_c_l172_c3_0b4b_return_output,
 fg_vram_update_uxn_c_l168_c19_f063_return_output,
 BIN_OP_EQ_uxn_c_l176_c6_72a7_return_output,
 result_is_new_frame_MUX_uxn_c_l176_c2_2f39_return_output,
 pixel_counter_MUX_uxn_c_l176_c2_2f39_return_output,
 fill_pixels_remaining_MUX_uxn_c_l176_c2_2f39_return_output,
 result_is_new_frame_MUX_uxn_c_l179_c9_a1da_return_output,
 pixel_counter_MUX_uxn_c_l179_c9_a1da_return_output,
 fill_pixels_remaining_MUX_uxn_c_l179_c9_a1da_return_output,
 BIN_OP_PLUS_uxn_c_l181_c3_d407_return_output,
 BIN_OP_EQ_uxn_c_l182_c27_d45e_return_output,
 BIN_OP_MINUS_uxn_c_l182_c60_46c5_return_output,
 MUX_uxn_c_l182_c27_dffd_return_output,
 BIN_OP_EQ_uxn_c_l185_c17_2ff2_return_output,
 MUX_uxn_c_l185_c17_27d3_return_output,
 UNARY_OP_NOT_uint1_t_uxn_c_l172_l165_DUPLICATE_69ad_return_output,
 BIN_OP_AND_uint1_t_uint1_t_uxn_c_l172_l165_DUPLICATE_8dfe_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : gpu_step_result_t;
 variable VAR_is_active_drawing_area : unsigned(0 downto 0);
 variable VAR_is_vram_write : unsigned(0 downto 0);
 variable VAR_vram_write_layer : unsigned(0 downto 0);
 variable VAR_vram_address : unsigned(31 downto 0);
 variable VAR_vram_value : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l126_c26_fc2d_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l126_c26_fc2d_iftrue : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l126_c26_fc2d_iffalse : unsigned(31 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l126_c26_8160_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l126_c26_8160_right : unsigned(17 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l126_c26_8160_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l126_c26_fc2d_return_output : unsigned(31 downto 0);
 variable VAR_CONST_SR_28_uxn_c_l127_c24_6955_return_output : unsigned(31 downto 0);
 variable VAR_CONST_SR_28_uxn_c_l127_c24_6955_x : unsigned(31 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_c_l127_c14_4fcc_return_output : unsigned(3 downto 0);
 variable VAR_MUX_uxn_c_l128_c17_6b93_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l128_c17_6b93_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l128_c17_6b93_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l128_c17_4b2e_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l128_c17_4b2e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l128_c17_4b2e_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l128_c17_6b93_return_output : unsigned(0 downto 0);
 variable VAR_y_uxn_c_l129_c2_fe44 : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_c_l129_c6_2979_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_DIV_uxn_c_l129_c6_2979_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_DIV_uxn_c_l129_c6_2979_return_output : unsigned(31 downto 0);
 variable VAR_x_uxn_c_l130_c2_a752 : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l130_c6_222f_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l130_c23_7611_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l130_c23_7611_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l130_c23_7611_return_output : unsigned(24 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l130_c6_222f_right : unsigned(24 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l130_c6_222f_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l133_c6_f0b5_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l133_c22_810a_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l133_c22_810a_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l133_c6_f0b5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l133_c6_f0b5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l133_c1_74f4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l133_c1_74f4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l133_c1_74f4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l133_c1_74f4_iffalse : unsigned(0 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l133_c2_07a1_iftrue : unsigned(15 downto 0);
 variable VAR_fill_y0_uxn_c_l142_c3_45f9 : unsigned(15 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l133_c2_07a1_iffalse : unsigned(15 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l133_c2_07a1_return_output : unsigned(15 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l133_c2_07a1_cond : unsigned(0 downto 0);
 variable VAR_is_fill_left_MUX_uxn_c_l133_c2_07a1_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_left_uxn_c_l135_c3_3c22 : unsigned(0 downto 0);
 variable VAR_is_fill_left_MUX_uxn_c_l133_c2_07a1_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_left_MUX_uxn_c_l133_c2_07a1_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_left_MUX_uxn_c_l133_c2_07a1_cond : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l133_c2_07a1_iftrue : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l133_c2_07a1_iffalse : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l133_c2_07a1_return_output : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l133_c2_07a1_cond : unsigned(0 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l133_c2_07a1_iftrue : unsigned(15 downto 0);
 variable VAR_fill_y1_uxn_c_l140_c3_bc16 : unsigned(15 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l133_c2_07a1_iffalse : unsigned(15 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l133_c2_07a1_return_output : unsigned(15 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l133_c2_07a1_cond : unsigned(0 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l133_c2_07a1_iftrue : unsigned(1 downto 0);
 variable VAR_fill_color_uxn_c_l145_c3_56da : unsigned(1 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l133_c2_07a1_iffalse : unsigned(1 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l133_c2_07a1_return_output : unsigned(1 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l133_c2_07a1_cond : unsigned(0 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l133_c2_07a1_iftrue : unsigned(15 downto 0);
 variable VAR_fill_x1_uxn_c_l141_c3_973d : unsigned(15 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l133_c2_07a1_iffalse : unsigned(15 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l133_c2_07a1_return_output : unsigned(15 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l133_c2_07a1_cond : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l133_c2_07a1_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_top_uxn_c_l136_c3_61c4 : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l133_c2_07a1_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l133_c2_07a1_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l133_c2_07a1_cond : unsigned(0 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l133_c2_07a1_iftrue : unsigned(15 downto 0);
 variable VAR_fill_x0_uxn_c_l143_c3_8ea0 : unsigned(15 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l133_c2_07a1_iffalse : unsigned(15 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l133_c2_07a1_return_output : unsigned(15 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l133_c2_07a1_cond : unsigned(0 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l133_c2_07a1_iftrue : unsigned(31 downto 0);
 variable VAR_fill_pixels_remaining_uxn_c_l146_c3_23c8 : unsigned(31 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l133_c2_07a1_iffalse : unsigned(31 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l133_c2_07a1_return_output : unsigned(31 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l133_c2_07a1_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_20_uxn_c_l135_c18_07a3_return_output : unsigned(31 downto 0);
 variable VAR_CONST_SR_20_uxn_c_l135_c18_07a3_x : unsigned(31 downto 0);
 variable VAR_CONST_SR_21_uxn_c_l136_c17_d016_return_output : unsigned(31 downto 0);
 variable VAR_CONST_SR_21_uxn_c_l136_c17_d016_x : unsigned(31 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l137_c27_c1fa_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l137_c27_c1fa_right : unsigned(17 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l137_c27_c1fa_return_output : unsigned(31 downto 0);
 variable VAR_fill_y0_uxn_c_l138_c3_bee3 : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_c_l138_c13_ba87_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_DIV_uxn_c_l138_c13_ba87_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_DIV_uxn_c_l138_c13_ba87_return_output : unsigned(31 downto 0);
 variable VAR_fill_x0_uxn_c_l139_c3_cd98 : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l139_c13_1ad2_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l139_c38_3105_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l139_c38_3105_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l139_c38_3105_return_output : unsigned(24 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l139_c13_1ad2_right : unsigned(24 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l139_c13_1ad2_return_output : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l140_c13_7735_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l140_c13_7735_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l140_c13_7735_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l140_c13_7735_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l141_c13_c778_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l141_c13_c778_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l141_c13_c778_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l141_c13_c778_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l142_c13_8bcc_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l142_c13_8bcc_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l142_c13_8bcc_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l142_c13_8bcc_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l143_c13_4255_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l143_c13_4255_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l143_c13_4255_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l143_c13_4255_return_output : unsigned(15 downto 0);
 variable VAR_printf_uxn_c_l147_c3_705b_uxn_c_l147_c3_705b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l147_c3_705b_uxn_c_l147_c3_705b_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l147_c3_705b_uxn_c_l147_c3_705b_arg1 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l147_c3_705b_uxn_c_l147_c3_705b_arg2 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l147_c3_705b_uxn_c_l147_c3_705b_arg3 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l147_c3_705b_uxn_c_l147_c3_705b_arg4 : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l150_c19_bddb_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l150_c19_bddb_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l150_c19_bddb_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l150_c19_90ba_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l150_c19_90ba_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l150_c19_90ba_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l150_c19_bddb_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l152_c17_6b27_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l152_c17_6b27_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l152_c17_6b27_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_LT_uxn_c_l153_c17_0eea_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_c_l153_c17_0eea_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_c_l153_c17_0eea_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l154_c17_5b56_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l154_c17_5b56_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l154_c17_5b56_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_LT_uxn_c_l155_c17_617a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_c_l155_c17_617a_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_c_l155_c17_617a_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l157_c18_5fb6_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l157_c18_5fb6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l157_c18_5fb6_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l157_c18_a00c_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l157_c18_a00c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l157_c18_a00c_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l157_c18_3daf_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l157_c18_3daf_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l157_c18_3daf_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l157_c18_9edb_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l157_c18_9edb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l157_c18_9edb_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l158_c19_4422_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l158_c37_5c24_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l158_c37_5c24_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l158_c19_4422_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l158_c19_4422_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l159_c19_6747_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l159_c19_6747_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l159_c19_6747_return_output : unsigned(0 downto 0);
 variable VAR_bg_vram_update_uxn_c_l161_c19_e744_read_address : unsigned(31 downto 0);
 variable VAR_bg_vram_update_uxn_c_l161_c19_e744_write_address : unsigned(31 downto 0);
 variable VAR_bg_vram_update_uxn_c_l161_c19_e744_write_value : unsigned(1 downto 0);
 variable VAR_bg_vram_update_uxn_c_l161_c19_e744_write_enable : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l163_c3_9512_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l163_c3_9512_iftrue : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l163_c3_9512_iffalse : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l163_c37_b5e5_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l163_c37_b5e5_iftrue : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l163_c37_b5e5_iffalse : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l163_c37_b5e5_return_output : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l163_c3_9512_return_output : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l164_c3_501a_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l164_c3_501a_iftrue : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l164_c3_501a_iffalse : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l164_c3_501a_return_output : unsigned(1 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l165_c3_621f_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l165_c22_675d_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l165_c57_07ca_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l165_c57_07ca_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l165_c22_675d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l165_c22_675d_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l165_c3_621f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l165_c3_621f_return_output : unsigned(0 downto 0);
 variable VAR_bg_vram_update_uxn_c_l161_c19_e744_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_bg_vram_update_uxn_c_l161_c19_e744_return_output : unsigned(1 downto 0);
 variable VAR_fg_vram_update_uxn_c_l168_c19_f063_read_address : unsigned(31 downto 0);
 variable VAR_fg_vram_update_uxn_c_l168_c19_f063_write_address : unsigned(31 downto 0);
 variable VAR_fg_vram_update_uxn_c_l168_c19_f063_write_value : unsigned(1 downto 0);
 variable VAR_fg_vram_update_uxn_c_l168_c19_f063_write_enable : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l170_c3_0ef5_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l170_c3_0ef5_iftrue : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l170_c3_0ef5_iffalse : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l170_c37_4a70_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l170_c37_4a70_iftrue : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l170_c37_4a70_iffalse : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l170_c37_4a70_return_output : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l170_c3_0ef5_return_output : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l171_c3_3323_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l171_c3_3323_iftrue : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l171_c3_3323_iffalse : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l171_c3_3323_return_output : unsigned(1 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l172_c3_0b4b_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l172_c22_7473_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l172_c22_7473_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l172_c22_7473_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l172_c3_0b4b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l172_c3_0b4b_return_output : unsigned(0 downto 0);
 variable VAR_fg_vram_update_uxn_c_l168_c19_f063_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_fg_vram_update_uxn_c_l168_c19_f063_return_output : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l176_c6_72a7_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l176_c6_72a7_right : unsigned(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l176_c6_72a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_new_frame_MUX_uxn_c_l176_c2_2f39_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_new_frame_MUX_uxn_c_l176_c2_2f39_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_new_frame_MUX_uxn_c_l179_c9_a1da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_new_frame_MUX_uxn_c_l176_c2_2f39_return_output : unsigned(0 downto 0);
 variable VAR_result_is_new_frame_MUX_uxn_c_l176_c2_2f39_cond : unsigned(0 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l176_c2_2f39_iftrue : unsigned(31 downto 0);
 variable VAR_pixel_counter_uxn_c_l177_c3_d14b : unsigned(31 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l176_c2_2f39_iffalse : unsigned(31 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l179_c9_a1da_return_output : unsigned(31 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l176_c2_2f39_return_output : unsigned(31 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l176_c2_2f39_cond : unsigned(0 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l176_c2_2f39_iftrue : unsigned(31 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l176_c2_2f39_iffalse : unsigned(31 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l179_c9_a1da_return_output : unsigned(31 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l176_c2_2f39_return_output : unsigned(31 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l176_c2_2f39_cond : unsigned(0 downto 0);
 variable VAR_result_is_new_frame_MUX_uxn_c_l179_c9_a1da_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_new_frame_MUX_uxn_c_l179_c9_a1da_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_new_frame_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_gpu_step_result_t_is_new_frame_d41d_uxn_c_l179_c9_a1da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_new_frame_MUX_uxn_c_l179_c9_a1da_cond : unsigned(0 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l179_c9_a1da_iftrue : unsigned(31 downto 0);
 variable VAR_pixel_counter_uxn_c_l181_c3_5ba4 : unsigned(31 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l179_c9_a1da_iffalse : unsigned(31 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l179_c9_a1da_cond : unsigned(0 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l179_c9_a1da_iftrue : unsigned(31 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l179_c9_a1da_iffalse : unsigned(31 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l179_c9_a1da_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l181_c3_d407_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l181_c3_d407_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l181_c3_d407_return_output : unsigned(32 downto 0);
 variable VAR_MUX_uxn_c_l182_c27_dffd_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l182_c27_dffd_iftrue : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l182_c27_dffd_iffalse : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l182_c27_d45e_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l182_c27_d45e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l182_c27_d45e_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l182_c60_46c5_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l182_c60_46c5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l182_c60_46c5_return_output : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l182_c27_dffd_return_output : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l185_c17_27d3_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l185_c17_27d3_iftrue : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l185_c17_27d3_iffalse : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l185_c17_2ff2_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l185_c17_2ff2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l185_c17_2ff2_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l185_c17_27d3_return_output : unsigned(1 downto 0);
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_c_l172_l165_DUPLICATE_69ad_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_c_l172_l165_DUPLICATE_69ad_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l172_l165_DUPLICATE_8dfe_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l172_l165_DUPLICATE_8dfe_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l172_l165_DUPLICATE_8dfe_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_269d_uxn_c_l188_l111_DUPLICATE_750f_return_output : gpu_step_result_t;
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
     VAR_MUX_uxn_c_l128_c17_6b93_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l126_c26_fc2d_iftrue := resize(to_unsigned(0, 1), 32);
     VAR_BIN_OP_MINUS_uxn_c_l182_c60_46c5_right := to_unsigned(1, 1);
     VAR_result_is_new_frame_MUX_uxn_c_l176_c2_2f39_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l170_c37_4a70_iftrue := resize(to_unsigned(0, 1), 32);
     VAR_BIN_OP_PLUS_uxn_c_l181_c3_d407_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l150_c19_90ba_right := to_unsigned(0, 1);
     VAR_fill_pixels_remaining_uxn_c_l146_c3_23c8 := resize(to_unsigned(143999, 18), 32);
     VAR_fill_pixels_remaining_MUX_uxn_c_l133_c2_07a1_iftrue := VAR_fill_pixels_remaining_uxn_c_l146_c3_23c8;
     VAR_MUX_uxn_c_l141_c13_c778_iffalse := resize(to_unsigned(399, 9), 16);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l133_c1_74f4_iffalse := to_unsigned(0, 1);
     VAR_result_is_new_frame_MUX_uxn_c_l179_c9_a1da_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l128_c17_4b2e_right := to_unsigned(15, 4);
     VAR_BIN_OP_AND_uxn_c_l137_c27_c1fa_right := to_unsigned(262143, 18);
     VAR_pixel_counter_uxn_c_l177_c3_d14b := resize(to_unsigned(0, 1), 32);
     VAR_pixel_counter_MUX_uxn_c_l176_c2_2f39_iftrue := VAR_pixel_counter_uxn_c_l177_c3_d14b;
     VAR_MUX_uxn_c_l140_c13_7735_iffalse := resize(to_unsigned(359, 9), 16);
     VAR_MUX_uxn_c_l150_c19_bddb_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l163_c37_b5e5_iftrue := resize(to_unsigned(0, 1), 32);
     VAR_BIN_OP_EQ_uxn_c_l176_c6_72a7_right := to_unsigned(143999, 18);
     VAR_MUX_uxn_c_l182_c27_dffd_iftrue := resize(to_unsigned(0, 1), 32);
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l130_c23_7611_right := to_unsigned(400, 9);
     VAR_MUX_uxn_c_l142_c13_8bcc_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_BIN_OP_EQ_uxn_c_l182_c27_d45e_right := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l143_c13_4255_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l139_c38_3105_right := to_unsigned(400, 9);
     VAR_BIN_OP_EQ_uxn_c_l185_c17_2ff2_right := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_c_l126_c26_8160_right := to_unsigned(143999, 18);
     VAR_BIN_OP_DIV_uxn_c_l138_c13_ba87_right := to_unsigned(400, 9);
     VAR_MUX_uxn_c_l150_c19_bddb_iffalse := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l128_c17_6b93_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_DIV_uxn_c_l129_c6_2979_right := to_unsigned(400, 9);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l133_c1_74f4_iftrue := VAR_CLOCK_ENABLE;
     VAR_bg_vram_update_uxn_c_l161_c19_e744_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_fg_vram_update_uxn_c_l168_c19_f063_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_fill_color_MUX_uxn_c_l133_c2_07a1_iffalse := fill_color;
     VAR_fill_layer_MUX_uxn_c_l133_c2_07a1_iffalse := fill_layer;
     VAR_fill_pixels_remaining_MUX_uxn_c_l133_c2_07a1_iffalse := fill_pixels_remaining;
     VAR_fill_x0_MUX_uxn_c_l133_c2_07a1_iffalse := fill_x0;
     VAR_fill_x1_MUX_uxn_c_l133_c2_07a1_iffalse := fill_x1;
     VAR_fill_y0_MUX_uxn_c_l133_c2_07a1_iffalse := fill_y0;
     VAR_fill_y1_MUX_uxn_c_l133_c2_07a1_iffalse := fill_y1;
     VAR_fill_pixels_remaining_MUX_uxn_c_l179_c9_a1da_cond := VAR_is_active_drawing_area;
     VAR_pixel_counter_MUX_uxn_c_l179_c9_a1da_cond := VAR_is_active_drawing_area;
     VAR_result_is_new_frame_MUX_uxn_c_l179_c9_a1da_cond := VAR_is_active_drawing_area;
     VAR_UNARY_OP_NOT_uxn_c_l133_c22_810a_expr := is_fill_active;
     VAR_is_fill_left_MUX_uxn_c_l133_c2_07a1_iffalse := is_fill_left;
     VAR_is_fill_top_MUX_uxn_c_l133_c2_07a1_iffalse := is_fill_top;
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l172_l165_DUPLICATE_8dfe_right := VAR_is_vram_write;
     VAR_BIN_OP_DIV_uxn_c_l129_c6_2979_left := pixel_counter;
     VAR_BIN_OP_EQ_uxn_c_l176_c6_72a7_left := pixel_counter;
     VAR_BIN_OP_MINUS_uxn_c_l130_c6_222f_left := pixel_counter;
     VAR_BIN_OP_PLUS_uxn_c_l181_c3_d407_left := pixel_counter;
     VAR_MUX_uxn_c_l163_c3_9512_iftrue := pixel_counter;
     VAR_MUX_uxn_c_l170_c3_0ef5_iftrue := pixel_counter;
     VAR_bg_vram_update_uxn_c_l161_c19_e744_read_address := pixel_counter;
     VAR_fg_vram_update_uxn_c_l168_c19_f063_read_address := pixel_counter;
     VAR_pixel_counter_MUX_uxn_c_l179_c9_a1da_iffalse := pixel_counter;
     VAR_BIN_OP_AND_uxn_c_l137_c27_c1fa_left := VAR_vram_address;
     VAR_BIN_OP_GT_uxn_c_l126_c26_8160_left := VAR_vram_address;
     VAR_CONST_SR_20_uxn_c_l135_c18_07a3_x := VAR_vram_address;
     VAR_CONST_SR_21_uxn_c_l136_c17_d016_x := VAR_vram_address;
     VAR_CONST_SR_28_uxn_c_l127_c24_6955_x := VAR_vram_address;
     VAR_MUX_uxn_c_l126_c26_fc2d_iffalse := VAR_vram_address;
     VAR_MUX_uxn_c_l164_c3_501a_iffalse := VAR_vram_value;
     VAR_MUX_uxn_c_l171_c3_3323_iffalse := VAR_vram_value;
     VAR_fill_color_uxn_c_l145_c3_56da := VAR_vram_value;
     VAR_BIN_OP_AND_uxn_c_l172_c22_7473_right := VAR_vram_write_layer;
     VAR_UNARY_OP_NOT_uxn_c_l165_c57_07ca_expr := VAR_vram_write_layer;
     VAR_fill_layer_MUX_uxn_c_l133_c2_07a1_iftrue := VAR_vram_write_layer;
     VAR_fill_color_MUX_uxn_c_l133_c2_07a1_iftrue := VAR_fill_color_uxn_c_l145_c3_56da;
     VAR_printf_uxn_c_l147_c3_705b_uxn_c_l147_c3_705b_arg4 := resize(VAR_fill_color_uxn_c_l145_c3_56da, 32);
     -- result_is_new_frame_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_gpu_step_result_t_is_new_frame_d41d[uxn_c_l179_c9_a1da] LATENCY=0
     VAR_result_is_new_frame_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_gpu_step_result_t_is_new_frame_d41d_uxn_c_l179_c9_a1da_return_output := result.is_new_frame;

     -- BIN_OP_GT[uxn_c_l126_c26_8160] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_c_l126_c26_8160_left <= VAR_BIN_OP_GT_uxn_c_l126_c26_8160_left;
     BIN_OP_GT_uxn_c_l126_c26_8160_right <= VAR_BIN_OP_GT_uxn_c_l126_c26_8160_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_c_l126_c26_8160_return_output := BIN_OP_GT_uxn_c_l126_c26_8160_return_output;

     -- BIN_OP_DIV[uxn_c_l129_c6_2979] LATENCY=0
     -- Inputs
     BIN_OP_DIV_uxn_c_l129_c6_2979_left <= VAR_BIN_OP_DIV_uxn_c_l129_c6_2979_left;
     BIN_OP_DIV_uxn_c_l129_c6_2979_right <= VAR_BIN_OP_DIV_uxn_c_l129_c6_2979_right;
     -- Outputs
     VAR_BIN_OP_DIV_uxn_c_l129_c6_2979_return_output := BIN_OP_DIV_uxn_c_l129_c6_2979_return_output;

     -- CONST_SR_21[uxn_c_l136_c17_d016] LATENCY=0
     -- Inputs
     CONST_SR_21_uxn_c_l136_c17_d016_x <= VAR_CONST_SR_21_uxn_c_l136_c17_d016_x;
     -- Outputs
     VAR_CONST_SR_21_uxn_c_l136_c17_d016_return_output := CONST_SR_21_uxn_c_l136_c17_d016_return_output;

     -- BIN_OP_AND[uxn_c_l137_c27_c1fa] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l137_c27_c1fa_left <= VAR_BIN_OP_AND_uxn_c_l137_c27_c1fa_left;
     BIN_OP_AND_uxn_c_l137_c27_c1fa_right <= VAR_BIN_OP_AND_uxn_c_l137_c27_c1fa_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l137_c27_c1fa_return_output := BIN_OP_AND_uxn_c_l137_c27_c1fa_return_output;

     -- UNARY_OP_NOT[uxn_c_l133_c22_810a] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l133_c22_810a_expr <= VAR_UNARY_OP_NOT_uxn_c_l133_c22_810a_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l133_c22_810a_return_output := UNARY_OP_NOT_uxn_c_l133_c22_810a_return_output;

     -- CONST_SR_28[uxn_c_l127_c24_6955] LATENCY=0
     -- Inputs
     CONST_SR_28_uxn_c_l127_c24_6955_x <= VAR_CONST_SR_28_uxn_c_l127_c24_6955_x;
     -- Outputs
     VAR_CONST_SR_28_uxn_c_l127_c24_6955_return_output := CONST_SR_28_uxn_c_l127_c24_6955_return_output;

     -- CONST_SR_20[uxn_c_l135_c18_07a3] LATENCY=0
     -- Inputs
     CONST_SR_20_uxn_c_l135_c18_07a3_x <= VAR_CONST_SR_20_uxn_c_l135_c18_07a3_x;
     -- Outputs
     VAR_CONST_SR_20_uxn_c_l135_c18_07a3_return_output := CONST_SR_20_uxn_c_l135_c18_07a3_return_output;

     -- UNARY_OP_NOT[uxn_c_l165_c57_07ca] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l165_c57_07ca_expr <= VAR_UNARY_OP_NOT_uxn_c_l165_c57_07ca_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l165_c57_07ca_return_output := UNARY_OP_NOT_uxn_c_l165_c57_07ca_return_output;

     -- BIN_OP_PLUS[uxn_c_l181_c3_d407] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l181_c3_d407_left <= VAR_BIN_OP_PLUS_uxn_c_l181_c3_d407_left;
     BIN_OP_PLUS_uxn_c_l181_c3_d407_right <= VAR_BIN_OP_PLUS_uxn_c_l181_c3_d407_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l181_c3_d407_return_output := BIN_OP_PLUS_uxn_c_l181_c3_d407_return_output;

     -- BIN_OP_EQ[uxn_c_l176_c6_72a7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l176_c6_72a7_left <= VAR_BIN_OP_EQ_uxn_c_l176_c6_72a7_left;
     BIN_OP_EQ_uxn_c_l176_c6_72a7_right <= VAR_BIN_OP_EQ_uxn_c_l176_c6_72a7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l176_c6_72a7_return_output := BIN_OP_EQ_uxn_c_l176_c6_72a7_return_output;

     -- Submodule level 1
     VAR_BIN_OP_DIV_uxn_c_l138_c13_ba87_left := VAR_BIN_OP_AND_uxn_c_l137_c27_c1fa_return_output;
     VAR_BIN_OP_MINUS_uxn_c_l139_c13_1ad2_left := VAR_BIN_OP_AND_uxn_c_l137_c27_c1fa_return_output;
     VAR_y_uxn_c_l129_c2_fe44 := resize(VAR_BIN_OP_DIV_uxn_c_l129_c6_2979_return_output, 16);
     VAR_fill_pixels_remaining_MUX_uxn_c_l176_c2_2f39_cond := VAR_BIN_OP_EQ_uxn_c_l176_c6_72a7_return_output;
     VAR_pixel_counter_MUX_uxn_c_l176_c2_2f39_cond := VAR_BIN_OP_EQ_uxn_c_l176_c6_72a7_return_output;
     VAR_result_is_new_frame_MUX_uxn_c_l176_c2_2f39_cond := VAR_BIN_OP_EQ_uxn_c_l176_c6_72a7_return_output;
     VAR_MUX_uxn_c_l126_c26_fc2d_cond := VAR_BIN_OP_GT_uxn_c_l126_c26_8160_return_output;
     VAR_pixel_counter_uxn_c_l181_c3_5ba4 := resize(VAR_BIN_OP_PLUS_uxn_c_l181_c3_d407_return_output, 32);
     VAR_is_fill_left_uxn_c_l135_c3_3c22 := resize(VAR_CONST_SR_20_uxn_c_l135_c18_07a3_return_output, 1);
     VAR_is_fill_top_uxn_c_l136_c3_61c4 := resize(VAR_CONST_SR_21_uxn_c_l136_c17_d016_return_output, 1);
     VAR_BIN_OP_AND_uxn_c_l133_c6_f0b5_right := VAR_UNARY_OP_NOT_uxn_c_l133_c22_810a_return_output;
     VAR_BIN_OP_AND_uxn_c_l165_c22_675d_right := VAR_UNARY_OP_NOT_uxn_c_l165_c57_07ca_return_output;
     VAR_result_is_new_frame_MUX_uxn_c_l179_c9_a1da_iffalse := VAR_result_is_new_frame_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_gpu_step_result_t_is_new_frame_d41d_uxn_c_l179_c9_a1da_return_output;
     VAR_MUX_uxn_c_l141_c13_c778_cond := VAR_is_fill_left_uxn_c_l135_c3_3c22;
     VAR_MUX_uxn_c_l143_c13_4255_cond := VAR_is_fill_left_uxn_c_l135_c3_3c22;
     VAR_is_fill_left_MUX_uxn_c_l133_c2_07a1_iftrue := VAR_is_fill_left_uxn_c_l135_c3_3c22;
     VAR_MUX_uxn_c_l140_c13_7735_cond := VAR_is_fill_top_uxn_c_l136_c3_61c4;
     VAR_MUX_uxn_c_l142_c13_8bcc_cond := VAR_is_fill_top_uxn_c_l136_c3_61c4;
     VAR_is_fill_top_MUX_uxn_c_l133_c2_07a1_iftrue := VAR_is_fill_top_uxn_c_l136_c3_61c4;
     VAR_pixel_counter_MUX_uxn_c_l179_c9_a1da_iftrue := VAR_pixel_counter_uxn_c_l181_c3_5ba4;
     VAR_BIN_OP_GT_uxn_c_l154_c17_5b56_left := VAR_y_uxn_c_l129_c2_fe44;
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l130_c23_7611_left := VAR_y_uxn_c_l129_c2_fe44;
     VAR_BIN_OP_LT_uxn_c_l155_c17_617a_left := VAR_y_uxn_c_l129_c2_fe44;
     REG_VAR_y := VAR_y_uxn_c_l129_c2_fe44;
     -- pixel_counter_MUX[uxn_c_l179_c9_a1da] LATENCY=0
     -- Inputs
     pixel_counter_MUX_uxn_c_l179_c9_a1da_cond <= VAR_pixel_counter_MUX_uxn_c_l179_c9_a1da_cond;
     pixel_counter_MUX_uxn_c_l179_c9_a1da_iftrue <= VAR_pixel_counter_MUX_uxn_c_l179_c9_a1da_iftrue;
     pixel_counter_MUX_uxn_c_l179_c9_a1da_iffalse <= VAR_pixel_counter_MUX_uxn_c_l179_c9_a1da_iffalse;
     -- Outputs
     VAR_pixel_counter_MUX_uxn_c_l179_c9_a1da_return_output := pixel_counter_MUX_uxn_c_l179_c9_a1da_return_output;

     -- CAST_TO_uint4_t[uxn_c_l127_c14_4fcc] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_c_l127_c14_4fcc_return_output := CAST_TO_uint4_t_uint32_t(
     VAR_CONST_SR_28_uxn_c_l127_c24_6955_return_output);

     -- MUX[uxn_c_l126_c26_fc2d] LATENCY=0
     -- Inputs
     MUX_uxn_c_l126_c26_fc2d_cond <= VAR_MUX_uxn_c_l126_c26_fc2d_cond;
     MUX_uxn_c_l126_c26_fc2d_iftrue <= VAR_MUX_uxn_c_l126_c26_fc2d_iftrue;
     MUX_uxn_c_l126_c26_fc2d_iffalse <= VAR_MUX_uxn_c_l126_c26_fc2d_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l126_c26_fc2d_return_output := MUX_uxn_c_l126_c26_fc2d_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_c_l130_c23_7611] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_c_l130_c23_7611_left <= VAR_BIN_OP_INFERRED_MULT_uxn_c_l130_c23_7611_left;
     BIN_OP_INFERRED_MULT_uxn_c_l130_c23_7611_right <= VAR_BIN_OP_INFERRED_MULT_uxn_c_l130_c23_7611_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l130_c23_7611_return_output := BIN_OP_INFERRED_MULT_uxn_c_l130_c23_7611_return_output;

     -- result_is_new_frame_MUX[uxn_c_l179_c9_a1da] LATENCY=0
     -- Inputs
     result_is_new_frame_MUX_uxn_c_l179_c9_a1da_cond <= VAR_result_is_new_frame_MUX_uxn_c_l179_c9_a1da_cond;
     result_is_new_frame_MUX_uxn_c_l179_c9_a1da_iftrue <= VAR_result_is_new_frame_MUX_uxn_c_l179_c9_a1da_iftrue;
     result_is_new_frame_MUX_uxn_c_l179_c9_a1da_iffalse <= VAR_result_is_new_frame_MUX_uxn_c_l179_c9_a1da_iffalse;
     -- Outputs
     VAR_result_is_new_frame_MUX_uxn_c_l179_c9_a1da_return_output := result_is_new_frame_MUX_uxn_c_l179_c9_a1da_return_output;

     -- BIN_OP_DIV[uxn_c_l138_c13_ba87] LATENCY=0
     -- Inputs
     BIN_OP_DIV_uxn_c_l138_c13_ba87_left <= VAR_BIN_OP_DIV_uxn_c_l138_c13_ba87_left;
     BIN_OP_DIV_uxn_c_l138_c13_ba87_right <= VAR_BIN_OP_DIV_uxn_c_l138_c13_ba87_right;
     -- Outputs
     VAR_BIN_OP_DIV_uxn_c_l138_c13_ba87_return_output := BIN_OP_DIV_uxn_c_l138_c13_ba87_return_output;

     -- Submodule level 2
     VAR_fill_y0_uxn_c_l138_c3_bee3 := resize(VAR_BIN_OP_DIV_uxn_c_l138_c13_ba87_return_output, 16);
     VAR_BIN_OP_MINUS_uxn_c_l130_c6_222f_right := VAR_BIN_OP_INFERRED_MULT_uxn_c_l130_c23_7611_return_output;
     VAR_BIN_OP_EQ_uxn_c_l128_c17_4b2e_left := VAR_CAST_TO_uint4_t_uxn_c_l127_c14_4fcc_return_output;
     REG_VAR_vram_code := VAR_CAST_TO_uint4_t_uxn_c_l127_c14_4fcc_return_output;
     VAR_MUX_uxn_c_l163_c37_b5e5_iffalse := VAR_MUX_uxn_c_l126_c26_fc2d_return_output;
     VAR_MUX_uxn_c_l170_c37_4a70_iffalse := VAR_MUX_uxn_c_l126_c26_fc2d_return_output;
     REG_VAR_adjusted_vram_address := VAR_MUX_uxn_c_l126_c26_fc2d_return_output;
     VAR_pixel_counter_MUX_uxn_c_l176_c2_2f39_iffalse := VAR_pixel_counter_MUX_uxn_c_l179_c9_a1da_return_output;
     VAR_result_is_new_frame_MUX_uxn_c_l176_c2_2f39_iffalse := VAR_result_is_new_frame_MUX_uxn_c_l179_c9_a1da_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l139_c38_3105_left := VAR_fill_y0_uxn_c_l138_c3_bee3;
     VAR_MUX_uxn_c_l140_c13_7735_iftrue := VAR_fill_y0_uxn_c_l138_c3_bee3;
     VAR_MUX_uxn_c_l142_c13_8bcc_iffalse := VAR_fill_y0_uxn_c_l138_c3_bee3;
     -- MUX[uxn_c_l140_c13_7735] LATENCY=0
     -- Inputs
     MUX_uxn_c_l140_c13_7735_cond <= VAR_MUX_uxn_c_l140_c13_7735_cond;
     MUX_uxn_c_l140_c13_7735_iftrue <= VAR_MUX_uxn_c_l140_c13_7735_iftrue;
     MUX_uxn_c_l140_c13_7735_iffalse <= VAR_MUX_uxn_c_l140_c13_7735_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l140_c13_7735_return_output := MUX_uxn_c_l140_c13_7735_return_output;

     -- BIN_OP_EQ[uxn_c_l128_c17_4b2e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l128_c17_4b2e_left <= VAR_BIN_OP_EQ_uxn_c_l128_c17_4b2e_left;
     BIN_OP_EQ_uxn_c_l128_c17_4b2e_right <= VAR_BIN_OP_EQ_uxn_c_l128_c17_4b2e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l128_c17_4b2e_return_output := BIN_OP_EQ_uxn_c_l128_c17_4b2e_return_output;

     -- MUX[uxn_c_l142_c13_8bcc] LATENCY=0
     -- Inputs
     MUX_uxn_c_l142_c13_8bcc_cond <= VAR_MUX_uxn_c_l142_c13_8bcc_cond;
     MUX_uxn_c_l142_c13_8bcc_iftrue <= VAR_MUX_uxn_c_l142_c13_8bcc_iftrue;
     MUX_uxn_c_l142_c13_8bcc_iffalse <= VAR_MUX_uxn_c_l142_c13_8bcc_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l142_c13_8bcc_return_output := MUX_uxn_c_l142_c13_8bcc_return_output;

     -- pixel_counter_MUX[uxn_c_l176_c2_2f39] LATENCY=0
     -- Inputs
     pixel_counter_MUX_uxn_c_l176_c2_2f39_cond <= VAR_pixel_counter_MUX_uxn_c_l176_c2_2f39_cond;
     pixel_counter_MUX_uxn_c_l176_c2_2f39_iftrue <= VAR_pixel_counter_MUX_uxn_c_l176_c2_2f39_iftrue;
     pixel_counter_MUX_uxn_c_l176_c2_2f39_iffalse <= VAR_pixel_counter_MUX_uxn_c_l176_c2_2f39_iffalse;
     -- Outputs
     VAR_pixel_counter_MUX_uxn_c_l176_c2_2f39_return_output := pixel_counter_MUX_uxn_c_l176_c2_2f39_return_output;

     -- BIN_OP_MINUS[uxn_c_l130_c6_222f] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l130_c6_222f_left <= VAR_BIN_OP_MINUS_uxn_c_l130_c6_222f_left;
     BIN_OP_MINUS_uxn_c_l130_c6_222f_right <= VAR_BIN_OP_MINUS_uxn_c_l130_c6_222f_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l130_c6_222f_return_output := BIN_OP_MINUS_uxn_c_l130_c6_222f_return_output;

     -- result_is_new_frame_MUX[uxn_c_l176_c2_2f39] LATENCY=0
     -- Inputs
     result_is_new_frame_MUX_uxn_c_l176_c2_2f39_cond <= VAR_result_is_new_frame_MUX_uxn_c_l176_c2_2f39_cond;
     result_is_new_frame_MUX_uxn_c_l176_c2_2f39_iftrue <= VAR_result_is_new_frame_MUX_uxn_c_l176_c2_2f39_iftrue;
     result_is_new_frame_MUX_uxn_c_l176_c2_2f39_iffalse <= VAR_result_is_new_frame_MUX_uxn_c_l176_c2_2f39_iffalse;
     -- Outputs
     VAR_result_is_new_frame_MUX_uxn_c_l176_c2_2f39_return_output := result_is_new_frame_MUX_uxn_c_l176_c2_2f39_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_c_l139_c38_3105] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_c_l139_c38_3105_left <= VAR_BIN_OP_INFERRED_MULT_uxn_c_l139_c38_3105_left;
     BIN_OP_INFERRED_MULT_uxn_c_l139_c38_3105_right <= VAR_BIN_OP_INFERRED_MULT_uxn_c_l139_c38_3105_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l139_c38_3105_return_output := BIN_OP_INFERRED_MULT_uxn_c_l139_c38_3105_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_c_l128_c17_6b93_cond := VAR_BIN_OP_EQ_uxn_c_l128_c17_4b2e_return_output;
     VAR_BIN_OP_MINUS_uxn_c_l139_c13_1ad2_right := VAR_BIN_OP_INFERRED_MULT_uxn_c_l139_c38_3105_return_output;
     VAR_x_uxn_c_l130_c2_a752 := resize(VAR_BIN_OP_MINUS_uxn_c_l130_c6_222f_return_output, 16);
     VAR_fill_y1_uxn_c_l140_c3_bc16 := VAR_MUX_uxn_c_l140_c13_7735_return_output;
     VAR_fill_y0_uxn_c_l142_c3_45f9 := VAR_MUX_uxn_c_l142_c13_8bcc_return_output;
     REG_VAR_pixel_counter := VAR_pixel_counter_MUX_uxn_c_l176_c2_2f39_return_output;
     VAR_fill_y0_MUX_uxn_c_l133_c2_07a1_iftrue := VAR_fill_y0_uxn_c_l142_c3_45f9;
     VAR_printf_uxn_c_l147_c3_705b_uxn_c_l147_c3_705b_arg1 := resize(VAR_fill_y0_uxn_c_l142_c3_45f9, 32);
     VAR_fill_y1_MUX_uxn_c_l133_c2_07a1_iftrue := VAR_fill_y1_uxn_c_l140_c3_bc16;
     VAR_printf_uxn_c_l147_c3_705b_uxn_c_l147_c3_705b_arg3 := resize(VAR_fill_y1_uxn_c_l140_c3_bc16, 32);
     VAR_BIN_OP_GT_uxn_c_l152_c17_6b27_left := VAR_x_uxn_c_l130_c2_a752;
     VAR_BIN_OP_LT_uxn_c_l153_c17_0eea_left := VAR_x_uxn_c_l130_c2_a752;
     REG_VAR_x := VAR_x_uxn_c_l130_c2_a752;
     -- BIN_OP_MINUS[uxn_c_l139_c13_1ad2] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l139_c13_1ad2_left <= VAR_BIN_OP_MINUS_uxn_c_l139_c13_1ad2_left;
     BIN_OP_MINUS_uxn_c_l139_c13_1ad2_right <= VAR_BIN_OP_MINUS_uxn_c_l139_c13_1ad2_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l139_c13_1ad2_return_output := BIN_OP_MINUS_uxn_c_l139_c13_1ad2_return_output;

     -- MUX[uxn_c_l128_c17_6b93] LATENCY=0
     -- Inputs
     MUX_uxn_c_l128_c17_6b93_cond <= VAR_MUX_uxn_c_l128_c17_6b93_cond;
     MUX_uxn_c_l128_c17_6b93_iftrue <= VAR_MUX_uxn_c_l128_c17_6b93_iftrue;
     MUX_uxn_c_l128_c17_6b93_iffalse <= VAR_MUX_uxn_c_l128_c17_6b93_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l128_c17_6b93_return_output := MUX_uxn_c_l128_c17_6b93_return_output;

     -- Submodule level 4
     VAR_fill_x0_uxn_c_l139_c3_cd98 := resize(VAR_BIN_OP_MINUS_uxn_c_l139_c13_1ad2_return_output, 16);
     VAR_BIN_OP_AND_uxn_c_l133_c6_f0b5_left := VAR_MUX_uxn_c_l128_c17_6b93_return_output;
     REG_VAR_is_fill_code := VAR_MUX_uxn_c_l128_c17_6b93_return_output;
     VAR_MUX_uxn_c_l141_c13_c778_iftrue := VAR_fill_x0_uxn_c_l139_c3_cd98;
     VAR_MUX_uxn_c_l143_c13_4255_iffalse := VAR_fill_x0_uxn_c_l139_c3_cd98;
     -- MUX[uxn_c_l143_c13_4255] LATENCY=0
     -- Inputs
     MUX_uxn_c_l143_c13_4255_cond <= VAR_MUX_uxn_c_l143_c13_4255_cond;
     MUX_uxn_c_l143_c13_4255_iftrue <= VAR_MUX_uxn_c_l143_c13_4255_iftrue;
     MUX_uxn_c_l143_c13_4255_iffalse <= VAR_MUX_uxn_c_l143_c13_4255_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l143_c13_4255_return_output := MUX_uxn_c_l143_c13_4255_return_output;

     -- BIN_OP_AND[uxn_c_l133_c6_f0b5] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l133_c6_f0b5_left <= VAR_BIN_OP_AND_uxn_c_l133_c6_f0b5_left;
     BIN_OP_AND_uxn_c_l133_c6_f0b5_right <= VAR_BIN_OP_AND_uxn_c_l133_c6_f0b5_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l133_c6_f0b5_return_output := BIN_OP_AND_uxn_c_l133_c6_f0b5_return_output;

     -- MUX[uxn_c_l141_c13_c778] LATENCY=0
     -- Inputs
     MUX_uxn_c_l141_c13_c778_cond <= VAR_MUX_uxn_c_l141_c13_c778_cond;
     MUX_uxn_c_l141_c13_c778_iftrue <= VAR_MUX_uxn_c_l141_c13_c778_iftrue;
     MUX_uxn_c_l141_c13_c778_iffalse <= VAR_MUX_uxn_c_l141_c13_c778_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l141_c13_c778_return_output := MUX_uxn_c_l141_c13_c778_return_output;

     -- Submodule level 5
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l133_c1_74f4_cond := VAR_BIN_OP_AND_uxn_c_l133_c6_f0b5_return_output;
     VAR_fill_color_MUX_uxn_c_l133_c2_07a1_cond := VAR_BIN_OP_AND_uxn_c_l133_c6_f0b5_return_output;
     VAR_fill_layer_MUX_uxn_c_l133_c2_07a1_cond := VAR_BIN_OP_AND_uxn_c_l133_c6_f0b5_return_output;
     VAR_fill_pixels_remaining_MUX_uxn_c_l133_c2_07a1_cond := VAR_BIN_OP_AND_uxn_c_l133_c6_f0b5_return_output;
     VAR_fill_x0_MUX_uxn_c_l133_c2_07a1_cond := VAR_BIN_OP_AND_uxn_c_l133_c6_f0b5_return_output;
     VAR_fill_x1_MUX_uxn_c_l133_c2_07a1_cond := VAR_BIN_OP_AND_uxn_c_l133_c6_f0b5_return_output;
     VAR_fill_y0_MUX_uxn_c_l133_c2_07a1_cond := VAR_BIN_OP_AND_uxn_c_l133_c6_f0b5_return_output;
     VAR_fill_y1_MUX_uxn_c_l133_c2_07a1_cond := VAR_BIN_OP_AND_uxn_c_l133_c6_f0b5_return_output;
     VAR_is_fill_left_MUX_uxn_c_l133_c2_07a1_cond := VAR_BIN_OP_AND_uxn_c_l133_c6_f0b5_return_output;
     VAR_is_fill_top_MUX_uxn_c_l133_c2_07a1_cond := VAR_BIN_OP_AND_uxn_c_l133_c6_f0b5_return_output;
     VAR_fill_x1_uxn_c_l141_c3_973d := VAR_MUX_uxn_c_l141_c13_c778_return_output;
     VAR_fill_x0_uxn_c_l143_c3_8ea0 := VAR_MUX_uxn_c_l143_c13_4255_return_output;
     VAR_fill_x0_MUX_uxn_c_l133_c2_07a1_iftrue := VAR_fill_x0_uxn_c_l143_c3_8ea0;
     VAR_printf_uxn_c_l147_c3_705b_uxn_c_l147_c3_705b_arg0 := resize(VAR_fill_x0_uxn_c_l143_c3_8ea0, 32);
     VAR_fill_x1_MUX_uxn_c_l133_c2_07a1_iftrue := VAR_fill_x1_uxn_c_l141_c3_973d;
     VAR_printf_uxn_c_l147_c3_705b_uxn_c_l147_c3_705b_arg2 := resize(VAR_fill_x1_uxn_c_l141_c3_973d, 32);
     -- is_fill_top_MUX[uxn_c_l133_c2_07a1] LATENCY=0
     -- Inputs
     is_fill_top_MUX_uxn_c_l133_c2_07a1_cond <= VAR_is_fill_top_MUX_uxn_c_l133_c2_07a1_cond;
     is_fill_top_MUX_uxn_c_l133_c2_07a1_iftrue <= VAR_is_fill_top_MUX_uxn_c_l133_c2_07a1_iftrue;
     is_fill_top_MUX_uxn_c_l133_c2_07a1_iffalse <= VAR_is_fill_top_MUX_uxn_c_l133_c2_07a1_iffalse;
     -- Outputs
     VAR_is_fill_top_MUX_uxn_c_l133_c2_07a1_return_output := is_fill_top_MUX_uxn_c_l133_c2_07a1_return_output;

     -- fill_x0_MUX[uxn_c_l133_c2_07a1] LATENCY=0
     -- Inputs
     fill_x0_MUX_uxn_c_l133_c2_07a1_cond <= VAR_fill_x0_MUX_uxn_c_l133_c2_07a1_cond;
     fill_x0_MUX_uxn_c_l133_c2_07a1_iftrue <= VAR_fill_x0_MUX_uxn_c_l133_c2_07a1_iftrue;
     fill_x0_MUX_uxn_c_l133_c2_07a1_iffalse <= VAR_fill_x0_MUX_uxn_c_l133_c2_07a1_iffalse;
     -- Outputs
     VAR_fill_x0_MUX_uxn_c_l133_c2_07a1_return_output := fill_x0_MUX_uxn_c_l133_c2_07a1_return_output;

     -- fill_y1_MUX[uxn_c_l133_c2_07a1] LATENCY=0
     -- Inputs
     fill_y1_MUX_uxn_c_l133_c2_07a1_cond <= VAR_fill_y1_MUX_uxn_c_l133_c2_07a1_cond;
     fill_y1_MUX_uxn_c_l133_c2_07a1_iftrue <= VAR_fill_y1_MUX_uxn_c_l133_c2_07a1_iftrue;
     fill_y1_MUX_uxn_c_l133_c2_07a1_iffalse <= VAR_fill_y1_MUX_uxn_c_l133_c2_07a1_iffalse;
     -- Outputs
     VAR_fill_y1_MUX_uxn_c_l133_c2_07a1_return_output := fill_y1_MUX_uxn_c_l133_c2_07a1_return_output;

     -- fill_pixels_remaining_MUX[uxn_c_l133_c2_07a1] LATENCY=0
     -- Inputs
     fill_pixels_remaining_MUX_uxn_c_l133_c2_07a1_cond <= VAR_fill_pixels_remaining_MUX_uxn_c_l133_c2_07a1_cond;
     fill_pixels_remaining_MUX_uxn_c_l133_c2_07a1_iftrue <= VAR_fill_pixels_remaining_MUX_uxn_c_l133_c2_07a1_iftrue;
     fill_pixels_remaining_MUX_uxn_c_l133_c2_07a1_iffalse <= VAR_fill_pixels_remaining_MUX_uxn_c_l133_c2_07a1_iffalse;
     -- Outputs
     VAR_fill_pixels_remaining_MUX_uxn_c_l133_c2_07a1_return_output := fill_pixels_remaining_MUX_uxn_c_l133_c2_07a1_return_output;

     -- fill_x1_MUX[uxn_c_l133_c2_07a1] LATENCY=0
     -- Inputs
     fill_x1_MUX_uxn_c_l133_c2_07a1_cond <= VAR_fill_x1_MUX_uxn_c_l133_c2_07a1_cond;
     fill_x1_MUX_uxn_c_l133_c2_07a1_iftrue <= VAR_fill_x1_MUX_uxn_c_l133_c2_07a1_iftrue;
     fill_x1_MUX_uxn_c_l133_c2_07a1_iffalse <= VAR_fill_x1_MUX_uxn_c_l133_c2_07a1_iffalse;
     -- Outputs
     VAR_fill_x1_MUX_uxn_c_l133_c2_07a1_return_output := fill_x1_MUX_uxn_c_l133_c2_07a1_return_output;

     -- fill_layer_MUX[uxn_c_l133_c2_07a1] LATENCY=0
     -- Inputs
     fill_layer_MUX_uxn_c_l133_c2_07a1_cond <= VAR_fill_layer_MUX_uxn_c_l133_c2_07a1_cond;
     fill_layer_MUX_uxn_c_l133_c2_07a1_iftrue <= VAR_fill_layer_MUX_uxn_c_l133_c2_07a1_iftrue;
     fill_layer_MUX_uxn_c_l133_c2_07a1_iffalse <= VAR_fill_layer_MUX_uxn_c_l133_c2_07a1_iffalse;
     -- Outputs
     VAR_fill_layer_MUX_uxn_c_l133_c2_07a1_return_output := fill_layer_MUX_uxn_c_l133_c2_07a1_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l133_c1_74f4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l133_c1_74f4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l133_c1_74f4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l133_c1_74f4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l133_c1_74f4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l133_c1_74f4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l133_c1_74f4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l133_c1_74f4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l133_c1_74f4_return_output;

     -- is_fill_left_MUX[uxn_c_l133_c2_07a1] LATENCY=0
     -- Inputs
     is_fill_left_MUX_uxn_c_l133_c2_07a1_cond <= VAR_is_fill_left_MUX_uxn_c_l133_c2_07a1_cond;
     is_fill_left_MUX_uxn_c_l133_c2_07a1_iftrue <= VAR_is_fill_left_MUX_uxn_c_l133_c2_07a1_iftrue;
     is_fill_left_MUX_uxn_c_l133_c2_07a1_iffalse <= VAR_is_fill_left_MUX_uxn_c_l133_c2_07a1_iffalse;
     -- Outputs
     VAR_is_fill_left_MUX_uxn_c_l133_c2_07a1_return_output := is_fill_left_MUX_uxn_c_l133_c2_07a1_return_output;

     -- fill_color_MUX[uxn_c_l133_c2_07a1] LATENCY=0
     -- Inputs
     fill_color_MUX_uxn_c_l133_c2_07a1_cond <= VAR_fill_color_MUX_uxn_c_l133_c2_07a1_cond;
     fill_color_MUX_uxn_c_l133_c2_07a1_iftrue <= VAR_fill_color_MUX_uxn_c_l133_c2_07a1_iftrue;
     fill_color_MUX_uxn_c_l133_c2_07a1_iffalse <= VAR_fill_color_MUX_uxn_c_l133_c2_07a1_iffalse;
     -- Outputs
     VAR_fill_color_MUX_uxn_c_l133_c2_07a1_return_output := fill_color_MUX_uxn_c_l133_c2_07a1_return_output;

     -- fill_y0_MUX[uxn_c_l133_c2_07a1] LATENCY=0
     -- Inputs
     fill_y0_MUX_uxn_c_l133_c2_07a1_cond <= VAR_fill_y0_MUX_uxn_c_l133_c2_07a1_cond;
     fill_y0_MUX_uxn_c_l133_c2_07a1_iftrue <= VAR_fill_y0_MUX_uxn_c_l133_c2_07a1_iftrue;
     fill_y0_MUX_uxn_c_l133_c2_07a1_iffalse <= VAR_fill_y0_MUX_uxn_c_l133_c2_07a1_iffalse;
     -- Outputs
     VAR_fill_y0_MUX_uxn_c_l133_c2_07a1_return_output := fill_y0_MUX_uxn_c_l133_c2_07a1_return_output;

     -- Submodule level 6
     VAR_printf_uxn_c_l147_c3_705b_uxn_c_l147_c3_705b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l133_c1_74f4_return_output;
     VAR_MUX_uxn_c_l164_c3_501a_iftrue := VAR_fill_color_MUX_uxn_c_l133_c2_07a1_return_output;
     VAR_MUX_uxn_c_l171_c3_3323_iftrue := VAR_fill_color_MUX_uxn_c_l133_c2_07a1_return_output;
     REG_VAR_fill_color := VAR_fill_color_MUX_uxn_c_l133_c2_07a1_return_output;
     VAR_BIN_OP_AND_uxn_c_l159_c19_6747_right := VAR_fill_layer_MUX_uxn_c_l133_c2_07a1_return_output;
     VAR_UNARY_OP_NOT_uxn_c_l158_c37_5c24_expr := VAR_fill_layer_MUX_uxn_c_l133_c2_07a1_return_output;
     REG_VAR_fill_layer := VAR_fill_layer_MUX_uxn_c_l133_c2_07a1_return_output;
     VAR_BIN_OP_EQ_uxn_c_l150_c19_90ba_left := VAR_fill_pixels_remaining_MUX_uxn_c_l133_c2_07a1_return_output;
     VAR_BIN_OP_EQ_uxn_c_l182_c27_d45e_left := VAR_fill_pixels_remaining_MUX_uxn_c_l133_c2_07a1_return_output;
     VAR_BIN_OP_MINUS_uxn_c_l182_c60_46c5_left := VAR_fill_pixels_remaining_MUX_uxn_c_l133_c2_07a1_return_output;
     VAR_fill_pixels_remaining_MUX_uxn_c_l176_c2_2f39_iftrue := VAR_fill_pixels_remaining_MUX_uxn_c_l133_c2_07a1_return_output;
     VAR_fill_pixels_remaining_MUX_uxn_c_l179_c9_a1da_iffalse := VAR_fill_pixels_remaining_MUX_uxn_c_l133_c2_07a1_return_output;
     VAR_BIN_OP_GT_uxn_c_l152_c17_6b27_right := VAR_fill_x0_MUX_uxn_c_l133_c2_07a1_return_output;
     REG_VAR_fill_x0 := VAR_fill_x0_MUX_uxn_c_l133_c2_07a1_return_output;
     VAR_BIN_OP_LT_uxn_c_l153_c17_0eea_right := VAR_fill_x1_MUX_uxn_c_l133_c2_07a1_return_output;
     REG_VAR_fill_x1 := VAR_fill_x1_MUX_uxn_c_l133_c2_07a1_return_output;
     VAR_BIN_OP_GT_uxn_c_l154_c17_5b56_right := VAR_fill_y0_MUX_uxn_c_l133_c2_07a1_return_output;
     REG_VAR_fill_y0 := VAR_fill_y0_MUX_uxn_c_l133_c2_07a1_return_output;
     VAR_BIN_OP_LT_uxn_c_l155_c17_617a_right := VAR_fill_y1_MUX_uxn_c_l133_c2_07a1_return_output;
     REG_VAR_fill_y1 := VAR_fill_y1_MUX_uxn_c_l133_c2_07a1_return_output;
     REG_VAR_is_fill_left := VAR_is_fill_left_MUX_uxn_c_l133_c2_07a1_return_output;
     REG_VAR_is_fill_top := VAR_is_fill_top_MUX_uxn_c_l133_c2_07a1_return_output;
     -- BIN_OP_GT[uxn_c_l154_c17_5b56] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_c_l154_c17_5b56_left <= VAR_BIN_OP_GT_uxn_c_l154_c17_5b56_left;
     BIN_OP_GT_uxn_c_l154_c17_5b56_right <= VAR_BIN_OP_GT_uxn_c_l154_c17_5b56_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_c_l154_c17_5b56_return_output := BIN_OP_GT_uxn_c_l154_c17_5b56_return_output;

     -- BIN_OP_MINUS[uxn_c_l182_c60_46c5] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l182_c60_46c5_left <= VAR_BIN_OP_MINUS_uxn_c_l182_c60_46c5_left;
     BIN_OP_MINUS_uxn_c_l182_c60_46c5_right <= VAR_BIN_OP_MINUS_uxn_c_l182_c60_46c5_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l182_c60_46c5_return_output := BIN_OP_MINUS_uxn_c_l182_c60_46c5_return_output;

     -- UNARY_OP_NOT[uxn_c_l158_c37_5c24] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l158_c37_5c24_expr <= VAR_UNARY_OP_NOT_uxn_c_l158_c37_5c24_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l158_c37_5c24_return_output := UNARY_OP_NOT_uxn_c_l158_c37_5c24_return_output;

     -- BIN_OP_EQ[uxn_c_l150_c19_90ba] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l150_c19_90ba_left <= VAR_BIN_OP_EQ_uxn_c_l150_c19_90ba_left;
     BIN_OP_EQ_uxn_c_l150_c19_90ba_right <= VAR_BIN_OP_EQ_uxn_c_l150_c19_90ba_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l150_c19_90ba_return_output := BIN_OP_EQ_uxn_c_l150_c19_90ba_return_output;

     -- BIN_OP_GT[uxn_c_l152_c17_6b27] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_c_l152_c17_6b27_left <= VAR_BIN_OP_GT_uxn_c_l152_c17_6b27_left;
     BIN_OP_GT_uxn_c_l152_c17_6b27_right <= VAR_BIN_OP_GT_uxn_c_l152_c17_6b27_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_c_l152_c17_6b27_return_output := BIN_OP_GT_uxn_c_l152_c17_6b27_return_output;

     -- printf_uxn_c_l147_c3_705b[uxn_c_l147_c3_705b] LATENCY=0
     -- Clock enable
     printf_uxn_c_l147_c3_705b_uxn_c_l147_c3_705b_CLOCK_ENABLE <= VAR_printf_uxn_c_l147_c3_705b_uxn_c_l147_c3_705b_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_c_l147_c3_705b_uxn_c_l147_c3_705b_arg0 <= VAR_printf_uxn_c_l147_c3_705b_uxn_c_l147_c3_705b_arg0;
     printf_uxn_c_l147_c3_705b_uxn_c_l147_c3_705b_arg1 <= VAR_printf_uxn_c_l147_c3_705b_uxn_c_l147_c3_705b_arg1;
     printf_uxn_c_l147_c3_705b_uxn_c_l147_c3_705b_arg2 <= VAR_printf_uxn_c_l147_c3_705b_uxn_c_l147_c3_705b_arg2;
     printf_uxn_c_l147_c3_705b_uxn_c_l147_c3_705b_arg3 <= VAR_printf_uxn_c_l147_c3_705b_uxn_c_l147_c3_705b_arg3;
     printf_uxn_c_l147_c3_705b_uxn_c_l147_c3_705b_arg4 <= VAR_printf_uxn_c_l147_c3_705b_uxn_c_l147_c3_705b_arg4;
     -- Outputs

     -- BIN_OP_EQ[uxn_c_l182_c27_d45e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l182_c27_d45e_left <= VAR_BIN_OP_EQ_uxn_c_l182_c27_d45e_left;
     BIN_OP_EQ_uxn_c_l182_c27_d45e_right <= VAR_BIN_OP_EQ_uxn_c_l182_c27_d45e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l182_c27_d45e_return_output := BIN_OP_EQ_uxn_c_l182_c27_d45e_return_output;

     -- BIN_OP_LT[uxn_c_l155_c17_617a] LATENCY=0
     -- Inputs
     BIN_OP_LT_uxn_c_l155_c17_617a_left <= VAR_BIN_OP_LT_uxn_c_l155_c17_617a_left;
     BIN_OP_LT_uxn_c_l155_c17_617a_right <= VAR_BIN_OP_LT_uxn_c_l155_c17_617a_right;
     -- Outputs
     VAR_BIN_OP_LT_uxn_c_l155_c17_617a_return_output := BIN_OP_LT_uxn_c_l155_c17_617a_return_output;

     -- BIN_OP_LT[uxn_c_l153_c17_0eea] LATENCY=0
     -- Inputs
     BIN_OP_LT_uxn_c_l153_c17_0eea_left <= VAR_BIN_OP_LT_uxn_c_l153_c17_0eea_left;
     BIN_OP_LT_uxn_c_l153_c17_0eea_right <= VAR_BIN_OP_LT_uxn_c_l153_c17_0eea_right;
     -- Outputs
     VAR_BIN_OP_LT_uxn_c_l153_c17_0eea_return_output := BIN_OP_LT_uxn_c_l153_c17_0eea_return_output;

     -- Submodule level 7
     VAR_MUX_uxn_c_l150_c19_bddb_cond := VAR_BIN_OP_EQ_uxn_c_l150_c19_90ba_return_output;
     VAR_MUX_uxn_c_l182_c27_dffd_cond := VAR_BIN_OP_EQ_uxn_c_l182_c27_d45e_return_output;
     VAR_BIN_OP_AND_uxn_c_l157_c18_5fb6_right := VAR_BIN_OP_GT_uxn_c_l152_c17_6b27_return_output;
     REG_VAR_fill_isect_l := VAR_BIN_OP_GT_uxn_c_l152_c17_6b27_return_output;
     VAR_BIN_OP_AND_uxn_c_l157_c18_3daf_right := VAR_BIN_OP_GT_uxn_c_l154_c17_5b56_return_output;
     REG_VAR_fill_isect_t := VAR_BIN_OP_GT_uxn_c_l154_c17_5b56_return_output;
     VAR_BIN_OP_AND_uxn_c_l157_c18_a00c_right := VAR_BIN_OP_LT_uxn_c_l153_c17_0eea_return_output;
     REG_VAR_fill_isect_r := VAR_BIN_OP_LT_uxn_c_l153_c17_0eea_return_output;
     VAR_BIN_OP_AND_uxn_c_l157_c18_9edb_right := VAR_BIN_OP_LT_uxn_c_l155_c17_617a_return_output;
     REG_VAR_fill_isect_b := VAR_BIN_OP_LT_uxn_c_l155_c17_617a_return_output;
     VAR_MUX_uxn_c_l182_c27_dffd_iffalse := VAR_BIN_OP_MINUS_uxn_c_l182_c60_46c5_return_output;
     VAR_BIN_OP_AND_uxn_c_l158_c19_4422_right := VAR_UNARY_OP_NOT_uxn_c_l158_c37_5c24_return_output;
     -- MUX[uxn_c_l182_c27_dffd] LATENCY=0
     -- Inputs
     MUX_uxn_c_l182_c27_dffd_cond <= VAR_MUX_uxn_c_l182_c27_dffd_cond;
     MUX_uxn_c_l182_c27_dffd_iftrue <= VAR_MUX_uxn_c_l182_c27_dffd_iftrue;
     MUX_uxn_c_l182_c27_dffd_iffalse <= VAR_MUX_uxn_c_l182_c27_dffd_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l182_c27_dffd_return_output := MUX_uxn_c_l182_c27_dffd_return_output;

     -- MUX[uxn_c_l150_c19_bddb] LATENCY=0
     -- Inputs
     MUX_uxn_c_l150_c19_bddb_cond <= VAR_MUX_uxn_c_l150_c19_bddb_cond;
     MUX_uxn_c_l150_c19_bddb_iftrue <= VAR_MUX_uxn_c_l150_c19_bddb_iftrue;
     MUX_uxn_c_l150_c19_bddb_iffalse <= VAR_MUX_uxn_c_l150_c19_bddb_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l150_c19_bddb_return_output := MUX_uxn_c_l150_c19_bddb_return_output;

     -- Submodule level 8
     VAR_BIN_OP_AND_uxn_c_l157_c18_5fb6_left := VAR_MUX_uxn_c_l150_c19_bddb_return_output;
     VAR_MUX_uxn_c_l163_c37_b5e5_cond := VAR_MUX_uxn_c_l150_c19_bddb_return_output;
     VAR_MUX_uxn_c_l170_c37_4a70_cond := VAR_MUX_uxn_c_l150_c19_bddb_return_output;
     VAR_UNARY_OP_NOT_uint1_t_uxn_c_l172_l165_DUPLICATE_69ad_expr := VAR_MUX_uxn_c_l150_c19_bddb_return_output;
     REG_VAR_is_fill_active := VAR_MUX_uxn_c_l150_c19_bddb_return_output;
     VAR_fill_pixels_remaining_MUX_uxn_c_l179_c9_a1da_iftrue := VAR_MUX_uxn_c_l182_c27_dffd_return_output;
     -- MUX[uxn_c_l163_c37_b5e5] LATENCY=0
     -- Inputs
     MUX_uxn_c_l163_c37_b5e5_cond <= VAR_MUX_uxn_c_l163_c37_b5e5_cond;
     MUX_uxn_c_l163_c37_b5e5_iftrue <= VAR_MUX_uxn_c_l163_c37_b5e5_iftrue;
     MUX_uxn_c_l163_c37_b5e5_iffalse <= VAR_MUX_uxn_c_l163_c37_b5e5_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l163_c37_b5e5_return_output := MUX_uxn_c_l163_c37_b5e5_return_output;

     -- MUX[uxn_c_l170_c37_4a70] LATENCY=0
     -- Inputs
     MUX_uxn_c_l170_c37_4a70_cond <= VAR_MUX_uxn_c_l170_c37_4a70_cond;
     MUX_uxn_c_l170_c37_4a70_iftrue <= VAR_MUX_uxn_c_l170_c37_4a70_iftrue;
     MUX_uxn_c_l170_c37_4a70_iffalse <= VAR_MUX_uxn_c_l170_c37_4a70_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l170_c37_4a70_return_output := MUX_uxn_c_l170_c37_4a70_return_output;

     -- UNARY_OP_NOT_uint1_t_uxn_c_l172_l165_DUPLICATE_69ad LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uint1_t_uxn_c_l172_l165_DUPLICATE_69ad_expr <= VAR_UNARY_OP_NOT_uint1_t_uxn_c_l172_l165_DUPLICATE_69ad_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uint1_t_uxn_c_l172_l165_DUPLICATE_69ad_return_output := UNARY_OP_NOT_uint1_t_uxn_c_l172_l165_DUPLICATE_69ad_return_output;

     -- fill_pixels_remaining_MUX[uxn_c_l179_c9_a1da] LATENCY=0
     -- Inputs
     fill_pixels_remaining_MUX_uxn_c_l179_c9_a1da_cond <= VAR_fill_pixels_remaining_MUX_uxn_c_l179_c9_a1da_cond;
     fill_pixels_remaining_MUX_uxn_c_l179_c9_a1da_iftrue <= VAR_fill_pixels_remaining_MUX_uxn_c_l179_c9_a1da_iftrue;
     fill_pixels_remaining_MUX_uxn_c_l179_c9_a1da_iffalse <= VAR_fill_pixels_remaining_MUX_uxn_c_l179_c9_a1da_iffalse;
     -- Outputs
     VAR_fill_pixels_remaining_MUX_uxn_c_l179_c9_a1da_return_output := fill_pixels_remaining_MUX_uxn_c_l179_c9_a1da_return_output;

     -- BIN_OP_AND[uxn_c_l157_c18_5fb6] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l157_c18_5fb6_left <= VAR_BIN_OP_AND_uxn_c_l157_c18_5fb6_left;
     BIN_OP_AND_uxn_c_l157_c18_5fb6_right <= VAR_BIN_OP_AND_uxn_c_l157_c18_5fb6_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l157_c18_5fb6_return_output := BIN_OP_AND_uxn_c_l157_c18_5fb6_return_output;

     -- Submodule level 9
     VAR_BIN_OP_AND_uxn_c_l157_c18_a00c_left := VAR_BIN_OP_AND_uxn_c_l157_c18_5fb6_return_output;
     VAR_MUX_uxn_c_l163_c3_9512_iffalse := VAR_MUX_uxn_c_l163_c37_b5e5_return_output;
     VAR_MUX_uxn_c_l170_c3_0ef5_iffalse := VAR_MUX_uxn_c_l170_c37_4a70_return_output;
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l172_l165_DUPLICATE_8dfe_left := VAR_UNARY_OP_NOT_uint1_t_uxn_c_l172_l165_DUPLICATE_69ad_return_output;
     VAR_fill_pixels_remaining_MUX_uxn_c_l176_c2_2f39_iffalse := VAR_fill_pixels_remaining_MUX_uxn_c_l179_c9_a1da_return_output;
     -- BIN_OP_AND_uint1_t_uint1_t_uxn_c_l172_l165_DUPLICATE_8dfe LATENCY=0
     -- Inputs
     BIN_OP_AND_uint1_t_uint1_t_uxn_c_l172_l165_DUPLICATE_8dfe_left <= VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l172_l165_DUPLICATE_8dfe_left;
     BIN_OP_AND_uint1_t_uint1_t_uxn_c_l172_l165_DUPLICATE_8dfe_right <= VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l172_l165_DUPLICATE_8dfe_right;
     -- Outputs
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l172_l165_DUPLICATE_8dfe_return_output := BIN_OP_AND_uint1_t_uint1_t_uxn_c_l172_l165_DUPLICATE_8dfe_return_output;

     -- fill_pixels_remaining_MUX[uxn_c_l176_c2_2f39] LATENCY=0
     -- Inputs
     fill_pixels_remaining_MUX_uxn_c_l176_c2_2f39_cond <= VAR_fill_pixels_remaining_MUX_uxn_c_l176_c2_2f39_cond;
     fill_pixels_remaining_MUX_uxn_c_l176_c2_2f39_iftrue <= VAR_fill_pixels_remaining_MUX_uxn_c_l176_c2_2f39_iftrue;
     fill_pixels_remaining_MUX_uxn_c_l176_c2_2f39_iffalse <= VAR_fill_pixels_remaining_MUX_uxn_c_l176_c2_2f39_iffalse;
     -- Outputs
     VAR_fill_pixels_remaining_MUX_uxn_c_l176_c2_2f39_return_output := fill_pixels_remaining_MUX_uxn_c_l176_c2_2f39_return_output;

     -- BIN_OP_AND[uxn_c_l157_c18_a00c] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l157_c18_a00c_left <= VAR_BIN_OP_AND_uxn_c_l157_c18_a00c_left;
     BIN_OP_AND_uxn_c_l157_c18_a00c_right <= VAR_BIN_OP_AND_uxn_c_l157_c18_a00c_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l157_c18_a00c_return_output := BIN_OP_AND_uxn_c_l157_c18_a00c_return_output;

     -- Submodule level 10
     VAR_BIN_OP_AND_uxn_c_l157_c18_3daf_left := VAR_BIN_OP_AND_uxn_c_l157_c18_a00c_return_output;
     VAR_BIN_OP_AND_uxn_c_l165_c22_675d_left := VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l172_l165_DUPLICATE_8dfe_return_output;
     VAR_BIN_OP_AND_uxn_c_l172_c22_7473_left := VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l172_l165_DUPLICATE_8dfe_return_output;
     REG_VAR_fill_pixels_remaining := VAR_fill_pixels_remaining_MUX_uxn_c_l176_c2_2f39_return_output;
     -- BIN_OP_AND[uxn_c_l157_c18_3daf] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l157_c18_3daf_left <= VAR_BIN_OP_AND_uxn_c_l157_c18_3daf_left;
     BIN_OP_AND_uxn_c_l157_c18_3daf_right <= VAR_BIN_OP_AND_uxn_c_l157_c18_3daf_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l157_c18_3daf_return_output := BIN_OP_AND_uxn_c_l157_c18_3daf_return_output;

     -- BIN_OP_AND[uxn_c_l165_c22_675d] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l165_c22_675d_left <= VAR_BIN_OP_AND_uxn_c_l165_c22_675d_left;
     BIN_OP_AND_uxn_c_l165_c22_675d_right <= VAR_BIN_OP_AND_uxn_c_l165_c22_675d_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l165_c22_675d_return_output := BIN_OP_AND_uxn_c_l165_c22_675d_return_output;

     -- BIN_OP_AND[uxn_c_l172_c22_7473] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l172_c22_7473_left <= VAR_BIN_OP_AND_uxn_c_l172_c22_7473_left;
     BIN_OP_AND_uxn_c_l172_c22_7473_right <= VAR_BIN_OP_AND_uxn_c_l172_c22_7473_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l172_c22_7473_return_output := BIN_OP_AND_uxn_c_l172_c22_7473_return_output;

     -- Submodule level 11
     VAR_BIN_OP_AND_uxn_c_l157_c18_9edb_left := VAR_BIN_OP_AND_uxn_c_l157_c18_3daf_return_output;
     VAR_BIN_OP_OR_uxn_c_l165_c3_621f_right := VAR_BIN_OP_AND_uxn_c_l165_c22_675d_return_output;
     VAR_BIN_OP_OR_uxn_c_l172_c3_0b4b_right := VAR_BIN_OP_AND_uxn_c_l172_c22_7473_return_output;
     -- BIN_OP_AND[uxn_c_l157_c18_9edb] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l157_c18_9edb_left <= VAR_BIN_OP_AND_uxn_c_l157_c18_9edb_left;
     BIN_OP_AND_uxn_c_l157_c18_9edb_right <= VAR_BIN_OP_AND_uxn_c_l157_c18_9edb_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l157_c18_9edb_return_output := BIN_OP_AND_uxn_c_l157_c18_9edb_return_output;

     -- Submodule level 12
     VAR_BIN_OP_AND_uxn_c_l158_c19_4422_left := VAR_BIN_OP_AND_uxn_c_l157_c18_9edb_return_output;
     VAR_BIN_OP_AND_uxn_c_l159_c19_6747_left := VAR_BIN_OP_AND_uxn_c_l157_c18_9edb_return_output;
     REG_VAR_is_fill_pixel := VAR_BIN_OP_AND_uxn_c_l157_c18_9edb_return_output;
     -- BIN_OP_AND[uxn_c_l158_c19_4422] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l158_c19_4422_left <= VAR_BIN_OP_AND_uxn_c_l158_c19_4422_left;
     BIN_OP_AND_uxn_c_l158_c19_4422_right <= VAR_BIN_OP_AND_uxn_c_l158_c19_4422_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l158_c19_4422_return_output := BIN_OP_AND_uxn_c_l158_c19_4422_return_output;

     -- BIN_OP_AND[uxn_c_l159_c19_6747] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l159_c19_6747_left <= VAR_BIN_OP_AND_uxn_c_l159_c19_6747_left;
     BIN_OP_AND_uxn_c_l159_c19_6747_right <= VAR_BIN_OP_AND_uxn_c_l159_c19_6747_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l159_c19_6747_return_output := BIN_OP_AND_uxn_c_l159_c19_6747_return_output;

     -- Submodule level 13
     VAR_BIN_OP_OR_uxn_c_l165_c3_621f_left := VAR_BIN_OP_AND_uxn_c_l158_c19_4422_return_output;
     VAR_MUX_uxn_c_l163_c3_9512_cond := VAR_BIN_OP_AND_uxn_c_l158_c19_4422_return_output;
     VAR_MUX_uxn_c_l164_c3_501a_cond := VAR_BIN_OP_AND_uxn_c_l158_c19_4422_return_output;
     REG_VAR_is_fill_pixel0 := VAR_BIN_OP_AND_uxn_c_l158_c19_4422_return_output;
     VAR_BIN_OP_OR_uxn_c_l172_c3_0b4b_left := VAR_BIN_OP_AND_uxn_c_l159_c19_6747_return_output;
     VAR_MUX_uxn_c_l170_c3_0ef5_cond := VAR_BIN_OP_AND_uxn_c_l159_c19_6747_return_output;
     VAR_MUX_uxn_c_l171_c3_3323_cond := VAR_BIN_OP_AND_uxn_c_l159_c19_6747_return_output;
     REG_VAR_is_fill_pixel1 := VAR_BIN_OP_AND_uxn_c_l159_c19_6747_return_output;
     -- MUX[uxn_c_l170_c3_0ef5] LATENCY=0
     -- Inputs
     MUX_uxn_c_l170_c3_0ef5_cond <= VAR_MUX_uxn_c_l170_c3_0ef5_cond;
     MUX_uxn_c_l170_c3_0ef5_iftrue <= VAR_MUX_uxn_c_l170_c3_0ef5_iftrue;
     MUX_uxn_c_l170_c3_0ef5_iffalse <= VAR_MUX_uxn_c_l170_c3_0ef5_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l170_c3_0ef5_return_output := MUX_uxn_c_l170_c3_0ef5_return_output;

     -- BIN_OP_OR[uxn_c_l165_c3_621f] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l165_c3_621f_left <= VAR_BIN_OP_OR_uxn_c_l165_c3_621f_left;
     BIN_OP_OR_uxn_c_l165_c3_621f_right <= VAR_BIN_OP_OR_uxn_c_l165_c3_621f_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l165_c3_621f_return_output := BIN_OP_OR_uxn_c_l165_c3_621f_return_output;

     -- MUX[uxn_c_l171_c3_3323] LATENCY=0
     -- Inputs
     MUX_uxn_c_l171_c3_3323_cond <= VAR_MUX_uxn_c_l171_c3_3323_cond;
     MUX_uxn_c_l171_c3_3323_iftrue <= VAR_MUX_uxn_c_l171_c3_3323_iftrue;
     MUX_uxn_c_l171_c3_3323_iffalse <= VAR_MUX_uxn_c_l171_c3_3323_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l171_c3_3323_return_output := MUX_uxn_c_l171_c3_3323_return_output;

     -- BIN_OP_OR[uxn_c_l172_c3_0b4b] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l172_c3_0b4b_left <= VAR_BIN_OP_OR_uxn_c_l172_c3_0b4b_left;
     BIN_OP_OR_uxn_c_l172_c3_0b4b_right <= VAR_BIN_OP_OR_uxn_c_l172_c3_0b4b_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l172_c3_0b4b_return_output := BIN_OP_OR_uxn_c_l172_c3_0b4b_return_output;

     -- MUX[uxn_c_l164_c3_501a] LATENCY=0
     -- Inputs
     MUX_uxn_c_l164_c3_501a_cond <= VAR_MUX_uxn_c_l164_c3_501a_cond;
     MUX_uxn_c_l164_c3_501a_iftrue <= VAR_MUX_uxn_c_l164_c3_501a_iftrue;
     MUX_uxn_c_l164_c3_501a_iffalse <= VAR_MUX_uxn_c_l164_c3_501a_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l164_c3_501a_return_output := MUX_uxn_c_l164_c3_501a_return_output;

     -- MUX[uxn_c_l163_c3_9512] LATENCY=0
     -- Inputs
     MUX_uxn_c_l163_c3_9512_cond <= VAR_MUX_uxn_c_l163_c3_9512_cond;
     MUX_uxn_c_l163_c3_9512_iftrue <= VAR_MUX_uxn_c_l163_c3_9512_iftrue;
     MUX_uxn_c_l163_c3_9512_iffalse <= VAR_MUX_uxn_c_l163_c3_9512_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l163_c3_9512_return_output := MUX_uxn_c_l163_c3_9512_return_output;

     -- Submodule level 14
     VAR_bg_vram_update_uxn_c_l161_c19_e744_write_enable := VAR_BIN_OP_OR_uxn_c_l165_c3_621f_return_output;
     VAR_fg_vram_update_uxn_c_l168_c19_f063_write_enable := VAR_BIN_OP_OR_uxn_c_l172_c3_0b4b_return_output;
     VAR_bg_vram_update_uxn_c_l161_c19_e744_write_address := VAR_MUX_uxn_c_l163_c3_9512_return_output;
     VAR_bg_vram_update_uxn_c_l161_c19_e744_write_value := VAR_MUX_uxn_c_l164_c3_501a_return_output;
     VAR_fg_vram_update_uxn_c_l168_c19_f063_write_address := VAR_MUX_uxn_c_l170_c3_0ef5_return_output;
     VAR_fg_vram_update_uxn_c_l168_c19_f063_write_value := VAR_MUX_uxn_c_l171_c3_3323_return_output;
     -- bg_vram_update[uxn_c_l161_c19_e744] LATENCY=0
     -- Clock enable
     bg_vram_update_uxn_c_l161_c19_e744_CLOCK_ENABLE <= VAR_bg_vram_update_uxn_c_l161_c19_e744_CLOCK_ENABLE;
     -- Inputs
     bg_vram_update_uxn_c_l161_c19_e744_read_address <= VAR_bg_vram_update_uxn_c_l161_c19_e744_read_address;
     bg_vram_update_uxn_c_l161_c19_e744_write_address <= VAR_bg_vram_update_uxn_c_l161_c19_e744_write_address;
     bg_vram_update_uxn_c_l161_c19_e744_write_value <= VAR_bg_vram_update_uxn_c_l161_c19_e744_write_value;
     bg_vram_update_uxn_c_l161_c19_e744_write_enable <= VAR_bg_vram_update_uxn_c_l161_c19_e744_write_enable;
     -- Outputs
     VAR_bg_vram_update_uxn_c_l161_c19_e744_return_output := bg_vram_update_uxn_c_l161_c19_e744_return_output;

     -- fg_vram_update[uxn_c_l168_c19_f063] LATENCY=0
     -- Clock enable
     fg_vram_update_uxn_c_l168_c19_f063_CLOCK_ENABLE <= VAR_fg_vram_update_uxn_c_l168_c19_f063_CLOCK_ENABLE;
     -- Inputs
     fg_vram_update_uxn_c_l168_c19_f063_read_address <= VAR_fg_vram_update_uxn_c_l168_c19_f063_read_address;
     fg_vram_update_uxn_c_l168_c19_f063_write_address <= VAR_fg_vram_update_uxn_c_l168_c19_f063_write_address;
     fg_vram_update_uxn_c_l168_c19_f063_write_value <= VAR_fg_vram_update_uxn_c_l168_c19_f063_write_value;
     fg_vram_update_uxn_c_l168_c19_f063_write_enable <= VAR_fg_vram_update_uxn_c_l168_c19_f063_write_enable;
     -- Outputs
     VAR_fg_vram_update_uxn_c_l168_c19_f063_return_output := fg_vram_update_uxn_c_l168_c19_f063_return_output;

     -- Submodule level 15
     VAR_MUX_uxn_c_l185_c17_27d3_iftrue := VAR_bg_vram_update_uxn_c_l161_c19_e744_return_output;
     REG_VAR_bg_pixel_color := VAR_bg_vram_update_uxn_c_l161_c19_e744_return_output;
     VAR_BIN_OP_EQ_uxn_c_l185_c17_2ff2_left := VAR_fg_vram_update_uxn_c_l168_c19_f063_return_output;
     VAR_MUX_uxn_c_l185_c17_27d3_iffalse := VAR_fg_vram_update_uxn_c_l168_c19_f063_return_output;
     REG_VAR_fg_pixel_color := VAR_fg_vram_update_uxn_c_l168_c19_f063_return_output;
     -- BIN_OP_EQ[uxn_c_l185_c17_2ff2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l185_c17_2ff2_left <= VAR_BIN_OP_EQ_uxn_c_l185_c17_2ff2_left;
     BIN_OP_EQ_uxn_c_l185_c17_2ff2_right <= VAR_BIN_OP_EQ_uxn_c_l185_c17_2ff2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l185_c17_2ff2_return_output := BIN_OP_EQ_uxn_c_l185_c17_2ff2_return_output;

     -- Submodule level 16
     VAR_MUX_uxn_c_l185_c17_27d3_cond := VAR_BIN_OP_EQ_uxn_c_l185_c17_2ff2_return_output;
     -- MUX[uxn_c_l185_c17_27d3] LATENCY=0
     -- Inputs
     MUX_uxn_c_l185_c17_27d3_cond <= VAR_MUX_uxn_c_l185_c17_27d3_cond;
     MUX_uxn_c_l185_c17_27d3_iftrue <= VAR_MUX_uxn_c_l185_c17_27d3_iftrue;
     MUX_uxn_c_l185_c17_27d3_iffalse <= VAR_MUX_uxn_c_l185_c17_27d3_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l185_c17_27d3_return_output := MUX_uxn_c_l185_c17_27d3_return_output;

     -- Submodule level 17
     -- CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_269d_uxn_c_l188_l111_DUPLICATE_750f LATENCY=0
     VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_269d_uxn_c_l188_l111_DUPLICATE_750f_return_output := CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_269d(
     VAR_result_is_new_frame_MUX_uxn_c_l176_c2_2f39_return_output,
     VAR_MUX_uxn_c_l185_c17_27d3_return_output,
     VAR_MUX_uxn_c_l150_c19_bddb_return_output);

     -- Submodule level 18
     REG_VAR_result := VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_269d_uxn_c_l188_l111_DUPLICATE_750f_return_output;
     VAR_return_output := VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_269d_uxn_c_l188_l111_DUPLICATE_750f_return_output;
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
