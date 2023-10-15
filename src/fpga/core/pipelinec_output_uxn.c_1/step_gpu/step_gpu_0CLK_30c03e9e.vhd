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
-- -- use ieee.float_pkg.all;
use work.c_structs_pkg.all;
-- Submodules: 72
entity step_gpu_0CLK_30c03e9e is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 is_active_drawing_area : in unsigned(0 downto 0);
 is_vram_write : in unsigned(0 downto 0);
 vram_write_layer : in unsigned(0 downto 0);
 vram_address : in unsigned(31 downto 0);
 vram_value : in unsigned(1 downto 0);
 return_output : out gpu_step_result_t);
end step_gpu_0CLK_30c03e9e;
architecture arch of step_gpu_0CLK_30c03e9e is
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
-- BIN_OP_GT[uxn_c_l124_c26_6a8b]
signal BIN_OP_GT_uxn_c_l124_c26_6a8b_left : unsigned(31 downto 0);
signal BIN_OP_GT_uxn_c_l124_c26_6a8b_right : unsigned(17 downto 0);
signal BIN_OP_GT_uxn_c_l124_c26_6a8b_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l124_c26_191c]
signal MUX_uxn_c_l124_c26_191c_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l124_c26_191c_iftrue : unsigned(31 downto 0);
signal MUX_uxn_c_l124_c26_191c_iffalse : unsigned(31 downto 0);
signal MUX_uxn_c_l124_c26_191c_return_output : unsigned(31 downto 0);

-- CONST_SR_28[uxn_c_l125_c24_c795]
signal CONST_SR_28_uxn_c_l125_c24_c795_x : unsigned(31 downto 0);
signal CONST_SR_28_uxn_c_l125_c24_c795_return_output : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_c_l126_c17_064d]
signal BIN_OP_EQ_uxn_c_l126_c17_064d_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l126_c17_064d_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l126_c17_064d_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l126_c17_e5cb]
signal MUX_uxn_c_l126_c17_e5cb_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l126_c17_e5cb_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l126_c17_e5cb_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l126_c17_e5cb_return_output : unsigned(0 downto 0);

-- BIN_OP_DIV[uxn_c_l127_c6_11f5]
signal BIN_OP_DIV_uxn_c_l127_c6_11f5_left : unsigned(31 downto 0);
signal BIN_OP_DIV_uxn_c_l127_c6_11f5_right : unsigned(8 downto 0);
signal BIN_OP_DIV_uxn_c_l127_c6_11f5_return_output : unsigned(31 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_c_l128_c23_8844]
signal BIN_OP_INFERRED_MULT_uxn_c_l128_c23_8844_left : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_c_l128_c23_8844_right : unsigned(8 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_c_l128_c23_8844_return_output : unsigned(24 downto 0);

-- BIN_OP_MINUS[uxn_c_l128_c6_421d]
signal BIN_OP_MINUS_uxn_c_l128_c6_421d_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_uxn_c_l128_c6_421d_right : unsigned(24 downto 0);
signal BIN_OP_MINUS_uxn_c_l128_c6_421d_return_output : unsigned(31 downto 0);

-- UNARY_OP_NOT[uxn_c_l131_c22_1cbb]
signal UNARY_OP_NOT_uxn_c_l131_c22_1cbb_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l131_c22_1cbb_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l131_c6_da9e]
signal BIN_OP_AND_uxn_c_l131_c6_da9e_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l131_c6_da9e_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l131_c6_da9e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l131_c1_f61a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l131_c1_f61a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l131_c1_f61a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l131_c1_f61a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l131_c1_f61a_return_output : unsigned(0 downto 0);

-- fill_layer_MUX[uxn_c_l131_c2_973e]
signal fill_layer_MUX_uxn_c_l131_c2_973e_cond : unsigned(0 downto 0);
signal fill_layer_MUX_uxn_c_l131_c2_973e_iftrue : unsigned(0 downto 0);
signal fill_layer_MUX_uxn_c_l131_c2_973e_iffalse : unsigned(0 downto 0);
signal fill_layer_MUX_uxn_c_l131_c2_973e_return_output : unsigned(0 downto 0);

-- fill_x0_MUX[uxn_c_l131_c2_973e]
signal fill_x0_MUX_uxn_c_l131_c2_973e_cond : unsigned(0 downto 0);
signal fill_x0_MUX_uxn_c_l131_c2_973e_iftrue : unsigned(15 downto 0);
signal fill_x0_MUX_uxn_c_l131_c2_973e_iffalse : unsigned(15 downto 0);
signal fill_x0_MUX_uxn_c_l131_c2_973e_return_output : unsigned(15 downto 0);

-- fill_x1_MUX[uxn_c_l131_c2_973e]
signal fill_x1_MUX_uxn_c_l131_c2_973e_cond : unsigned(0 downto 0);
signal fill_x1_MUX_uxn_c_l131_c2_973e_iftrue : unsigned(15 downto 0);
signal fill_x1_MUX_uxn_c_l131_c2_973e_iffalse : unsigned(15 downto 0);
signal fill_x1_MUX_uxn_c_l131_c2_973e_return_output : unsigned(15 downto 0);

-- is_fill_left_MUX[uxn_c_l131_c2_973e]
signal is_fill_left_MUX_uxn_c_l131_c2_973e_cond : unsigned(0 downto 0);
signal is_fill_left_MUX_uxn_c_l131_c2_973e_iftrue : unsigned(0 downto 0);
signal is_fill_left_MUX_uxn_c_l131_c2_973e_iffalse : unsigned(0 downto 0);
signal is_fill_left_MUX_uxn_c_l131_c2_973e_return_output : unsigned(0 downto 0);

-- is_fill_top_MUX[uxn_c_l131_c2_973e]
signal is_fill_top_MUX_uxn_c_l131_c2_973e_cond : unsigned(0 downto 0);
signal is_fill_top_MUX_uxn_c_l131_c2_973e_iftrue : unsigned(0 downto 0);
signal is_fill_top_MUX_uxn_c_l131_c2_973e_iffalse : unsigned(0 downto 0);
signal is_fill_top_MUX_uxn_c_l131_c2_973e_return_output : unsigned(0 downto 0);

-- fill_pixels_remaining_MUX[uxn_c_l131_c2_973e]
signal fill_pixels_remaining_MUX_uxn_c_l131_c2_973e_cond : unsigned(0 downto 0);
signal fill_pixels_remaining_MUX_uxn_c_l131_c2_973e_iftrue : unsigned(31 downto 0);
signal fill_pixels_remaining_MUX_uxn_c_l131_c2_973e_iffalse : unsigned(31 downto 0);
signal fill_pixels_remaining_MUX_uxn_c_l131_c2_973e_return_output : unsigned(31 downto 0);

-- fill_y1_MUX[uxn_c_l131_c2_973e]
signal fill_y1_MUX_uxn_c_l131_c2_973e_cond : unsigned(0 downto 0);
signal fill_y1_MUX_uxn_c_l131_c2_973e_iftrue : unsigned(15 downto 0);
signal fill_y1_MUX_uxn_c_l131_c2_973e_iffalse : unsigned(15 downto 0);
signal fill_y1_MUX_uxn_c_l131_c2_973e_return_output : unsigned(15 downto 0);

-- fill_color_MUX[uxn_c_l131_c2_973e]
signal fill_color_MUX_uxn_c_l131_c2_973e_cond : unsigned(0 downto 0);
signal fill_color_MUX_uxn_c_l131_c2_973e_iftrue : unsigned(1 downto 0);
signal fill_color_MUX_uxn_c_l131_c2_973e_iffalse : unsigned(1 downto 0);
signal fill_color_MUX_uxn_c_l131_c2_973e_return_output : unsigned(1 downto 0);

-- fill_y0_MUX[uxn_c_l131_c2_973e]
signal fill_y0_MUX_uxn_c_l131_c2_973e_cond : unsigned(0 downto 0);
signal fill_y0_MUX_uxn_c_l131_c2_973e_iftrue : unsigned(15 downto 0);
signal fill_y0_MUX_uxn_c_l131_c2_973e_iffalse : unsigned(15 downto 0);
signal fill_y0_MUX_uxn_c_l131_c2_973e_return_output : unsigned(15 downto 0);

-- CONST_SR_20[uxn_c_l133_c18_3bfc]
signal CONST_SR_20_uxn_c_l133_c18_3bfc_x : unsigned(31 downto 0);
signal CONST_SR_20_uxn_c_l133_c18_3bfc_return_output : unsigned(31 downto 0);

-- CONST_SR_21[uxn_c_l134_c17_e011]
signal CONST_SR_21_uxn_c_l134_c17_e011_x : unsigned(31 downto 0);
signal CONST_SR_21_uxn_c_l134_c17_e011_return_output : unsigned(31 downto 0);

-- BIN_OP_AND[uxn_c_l135_c27_9bdd]
signal BIN_OP_AND_uxn_c_l135_c27_9bdd_left : unsigned(31 downto 0);
signal BIN_OP_AND_uxn_c_l135_c27_9bdd_right : unsigned(17 downto 0);
signal BIN_OP_AND_uxn_c_l135_c27_9bdd_return_output : unsigned(31 downto 0);

-- BIN_OP_DIV[uxn_c_l136_c13_1cd6]
signal BIN_OP_DIV_uxn_c_l136_c13_1cd6_left : unsigned(31 downto 0);
signal BIN_OP_DIV_uxn_c_l136_c13_1cd6_right : unsigned(8 downto 0);
signal BIN_OP_DIV_uxn_c_l136_c13_1cd6_return_output : unsigned(31 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_c_l137_c38_d763]
signal BIN_OP_INFERRED_MULT_uxn_c_l137_c38_d763_left : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_c_l137_c38_d763_right : unsigned(8 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_c_l137_c38_d763_return_output : unsigned(24 downto 0);

-- BIN_OP_MINUS[uxn_c_l137_c13_622e]
signal BIN_OP_MINUS_uxn_c_l137_c13_622e_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_uxn_c_l137_c13_622e_right : unsigned(24 downto 0);
signal BIN_OP_MINUS_uxn_c_l137_c13_622e_return_output : unsigned(31 downto 0);

-- MUX[uxn_c_l138_c13_24dd]
signal MUX_uxn_c_l138_c13_24dd_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l138_c13_24dd_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l138_c13_24dd_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l138_c13_24dd_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l139_c13_c5f6]
signal MUX_uxn_c_l139_c13_c5f6_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l139_c13_c5f6_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l139_c13_c5f6_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l139_c13_c5f6_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l140_c13_6184]
signal MUX_uxn_c_l140_c13_6184_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l140_c13_6184_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l140_c13_6184_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l140_c13_6184_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l141_c13_772d]
signal MUX_uxn_c_l141_c13_772d_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l141_c13_772d_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l141_c13_772d_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l141_c13_772d_return_output : unsigned(15 downto 0);

-- printf_uxn_c_l145_c3_22c2[uxn_c_l145_c3_22c2]
signal printf_uxn_c_l145_c3_22c2_uxn_c_l145_c3_22c2_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_c_l145_c3_22c2_uxn_c_l145_c3_22c2_arg0 : unsigned(31 downto 0);
signal printf_uxn_c_l145_c3_22c2_uxn_c_l145_c3_22c2_arg1 : unsigned(31 downto 0);
signal printf_uxn_c_l145_c3_22c2_uxn_c_l145_c3_22c2_arg2 : unsigned(31 downto 0);
signal printf_uxn_c_l145_c3_22c2_uxn_c_l145_c3_22c2_arg3 : unsigned(31 downto 0);
signal printf_uxn_c_l145_c3_22c2_uxn_c_l145_c3_22c2_arg4 : unsigned(31 downto 0);
signal printf_uxn_c_l145_c3_22c2_uxn_c_l145_c3_22c2_arg5 : unsigned(31 downto 0);
signal printf_uxn_c_l145_c3_22c2_uxn_c_l145_c3_22c2_arg6 : unsigned(31 downto 0);
signal printf_uxn_c_l145_c3_22c2_uxn_c_l145_c3_22c2_arg7 : unsigned(31 downto 0);
signal printf_uxn_c_l145_c3_22c2_uxn_c_l145_c3_22c2_arg8 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_c_l148_c19_a4da]
signal BIN_OP_EQ_uxn_c_l148_c19_a4da_left : unsigned(31 downto 0);
signal BIN_OP_EQ_uxn_c_l148_c19_a4da_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l148_c19_a4da_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l148_c19_575e]
signal MUX_uxn_c_l148_c19_575e_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l148_c19_575e_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l148_c19_575e_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l148_c19_575e_return_output : unsigned(0 downto 0);

-- BIN_OP_GT[uxn_c_l150_c17_4e77]
signal BIN_OP_GT_uxn_c_l150_c17_4e77_left : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_c_l150_c17_4e77_right : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_c_l150_c17_4e77_return_output : unsigned(0 downto 0);

-- BIN_OP_LT[uxn_c_l151_c17_2f5b]
signal BIN_OP_LT_uxn_c_l151_c17_2f5b_left : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_c_l151_c17_2f5b_right : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_c_l151_c17_2f5b_return_output : unsigned(0 downto 0);

-- BIN_OP_GT[uxn_c_l152_c17_06fa]
signal BIN_OP_GT_uxn_c_l152_c17_06fa_left : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_c_l152_c17_06fa_right : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_c_l152_c17_06fa_return_output : unsigned(0 downto 0);

-- BIN_OP_LT[uxn_c_l153_c17_1b15]
signal BIN_OP_LT_uxn_c_l153_c17_1b15_left : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_c_l153_c17_1b15_right : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_c_l153_c17_1b15_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l155_c18_ecab]
signal BIN_OP_AND_uxn_c_l155_c18_ecab_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l155_c18_ecab_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l155_c18_ecab_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l155_c18_21b3]
signal BIN_OP_AND_uxn_c_l155_c18_21b3_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l155_c18_21b3_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l155_c18_21b3_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l155_c18_713d]
signal BIN_OP_AND_uxn_c_l155_c18_713d_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l155_c18_713d_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l155_c18_713d_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l155_c18_c301]
signal BIN_OP_AND_uxn_c_l155_c18_c301_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l155_c18_c301_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l155_c18_c301_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_c_l156_c37_99d5]
signal UNARY_OP_NOT_uxn_c_l156_c37_99d5_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l156_c37_99d5_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l156_c19_b9f7]
signal BIN_OP_AND_uxn_c_l156_c19_b9f7_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l156_c19_b9f7_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l156_c19_b9f7_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l157_c19_a93e]
signal BIN_OP_AND_uxn_c_l157_c19_a93e_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l157_c19_a93e_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l157_c19_a93e_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l165_c37_66ba]
signal MUX_uxn_c_l165_c37_66ba_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l165_c37_66ba_iftrue : unsigned(31 downto 0);
signal MUX_uxn_c_l165_c37_66ba_iffalse : unsigned(31 downto 0);
signal MUX_uxn_c_l165_c37_66ba_return_output : unsigned(31 downto 0);

-- MUX[uxn_c_l165_c3_c8c1]
signal MUX_uxn_c_l165_c3_c8c1_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l165_c3_c8c1_iftrue : unsigned(31 downto 0);
signal MUX_uxn_c_l165_c3_c8c1_iffalse : unsigned(31 downto 0);
signal MUX_uxn_c_l165_c3_c8c1_return_output : unsigned(31 downto 0);

-- MUX[uxn_c_l166_c3_4f32]
signal MUX_uxn_c_l166_c3_4f32_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l166_c3_4f32_iftrue : unsigned(1 downto 0);
signal MUX_uxn_c_l166_c3_4f32_iffalse : unsigned(1 downto 0);
signal MUX_uxn_c_l166_c3_4f32_return_output : unsigned(1 downto 0);

-- UNARY_OP_NOT[uxn_c_l167_c57_d7fe]
signal UNARY_OP_NOT_uxn_c_l167_c57_d7fe_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l167_c57_d7fe_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l167_c22_edef]
signal BIN_OP_AND_uxn_c_l167_c22_edef_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l167_c22_edef_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l167_c22_edef_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_c_l167_c3_79bc]
signal BIN_OP_OR_uxn_c_l167_c3_79bc_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l167_c3_79bc_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l167_c3_79bc_return_output : unsigned(0 downto 0);

-- bg_vram_update[uxn_c_l163_c19_498a]
signal bg_vram_update_uxn_c_l163_c19_498a_CLOCK_ENABLE : unsigned(0 downto 0);
signal bg_vram_update_uxn_c_l163_c19_498a_read_address : unsigned(31 downto 0);
signal bg_vram_update_uxn_c_l163_c19_498a_write_address : unsigned(31 downto 0);
signal bg_vram_update_uxn_c_l163_c19_498a_write_value : unsigned(1 downto 0);
signal bg_vram_update_uxn_c_l163_c19_498a_write_enable : unsigned(0 downto 0);
signal bg_vram_update_uxn_c_l163_c19_498a_return_output : unsigned(1 downto 0);

-- MUX[uxn_c_l172_c37_0567]
signal MUX_uxn_c_l172_c37_0567_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l172_c37_0567_iftrue : unsigned(31 downto 0);
signal MUX_uxn_c_l172_c37_0567_iffalse : unsigned(31 downto 0);
signal MUX_uxn_c_l172_c37_0567_return_output : unsigned(31 downto 0);

-- MUX[uxn_c_l172_c3_d071]
signal MUX_uxn_c_l172_c3_d071_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l172_c3_d071_iftrue : unsigned(31 downto 0);
signal MUX_uxn_c_l172_c3_d071_iffalse : unsigned(31 downto 0);
signal MUX_uxn_c_l172_c3_d071_return_output : unsigned(31 downto 0);

-- MUX[uxn_c_l173_c3_60b3]
signal MUX_uxn_c_l173_c3_60b3_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l173_c3_60b3_iftrue : unsigned(1 downto 0);
signal MUX_uxn_c_l173_c3_60b3_iffalse : unsigned(1 downto 0);
signal MUX_uxn_c_l173_c3_60b3_return_output : unsigned(1 downto 0);

-- BIN_OP_AND[uxn_c_l174_c22_ada2]
signal BIN_OP_AND_uxn_c_l174_c22_ada2_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l174_c22_ada2_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l174_c22_ada2_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_c_l174_c3_f563]
signal BIN_OP_OR_uxn_c_l174_c3_f563_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l174_c3_f563_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l174_c3_f563_return_output : unsigned(0 downto 0);

-- fg_vram_update[uxn_c_l170_c19_8db4]
signal fg_vram_update_uxn_c_l170_c19_8db4_CLOCK_ENABLE : unsigned(0 downto 0);
signal fg_vram_update_uxn_c_l170_c19_8db4_read_address : unsigned(31 downto 0);
signal fg_vram_update_uxn_c_l170_c19_8db4_write_address : unsigned(31 downto 0);
signal fg_vram_update_uxn_c_l170_c19_8db4_write_value : unsigned(1 downto 0);
signal fg_vram_update_uxn_c_l170_c19_8db4_write_enable : unsigned(0 downto 0);
signal fg_vram_update_uxn_c_l170_c19_8db4_return_output : unsigned(1 downto 0);

-- BIN_OP_EQ[uxn_c_l178_c6_c111]
signal BIN_OP_EQ_uxn_c_l178_c6_c111_left : unsigned(31 downto 0);
signal BIN_OP_EQ_uxn_c_l178_c6_c111_right : unsigned(17 downto 0);
signal BIN_OP_EQ_uxn_c_l178_c6_c111_return_output : unsigned(0 downto 0);

-- fill_pixels_remaining_MUX[uxn_c_l178_c2_e14c]
signal fill_pixels_remaining_MUX_uxn_c_l178_c2_e14c_cond : unsigned(0 downto 0);
signal fill_pixels_remaining_MUX_uxn_c_l178_c2_e14c_iftrue : unsigned(31 downto 0);
signal fill_pixels_remaining_MUX_uxn_c_l178_c2_e14c_iffalse : unsigned(31 downto 0);
signal fill_pixels_remaining_MUX_uxn_c_l178_c2_e14c_return_output : unsigned(31 downto 0);

-- pixel_counter_MUX[uxn_c_l178_c2_e14c]
signal pixel_counter_MUX_uxn_c_l178_c2_e14c_cond : unsigned(0 downto 0);
signal pixel_counter_MUX_uxn_c_l178_c2_e14c_iftrue : unsigned(31 downto 0);
signal pixel_counter_MUX_uxn_c_l178_c2_e14c_iffalse : unsigned(31 downto 0);
signal pixel_counter_MUX_uxn_c_l178_c2_e14c_return_output : unsigned(31 downto 0);

-- fill_pixels_remaining_MUX[uxn_c_l180_c9_1e80]
signal fill_pixels_remaining_MUX_uxn_c_l180_c9_1e80_cond : unsigned(0 downto 0);
signal fill_pixels_remaining_MUX_uxn_c_l180_c9_1e80_iftrue : unsigned(31 downto 0);
signal fill_pixels_remaining_MUX_uxn_c_l180_c9_1e80_iffalse : unsigned(31 downto 0);
signal fill_pixels_remaining_MUX_uxn_c_l180_c9_1e80_return_output : unsigned(31 downto 0);

-- pixel_counter_MUX[uxn_c_l180_c9_1e80]
signal pixel_counter_MUX_uxn_c_l180_c9_1e80_cond : unsigned(0 downto 0);
signal pixel_counter_MUX_uxn_c_l180_c9_1e80_iftrue : unsigned(31 downto 0);
signal pixel_counter_MUX_uxn_c_l180_c9_1e80_iffalse : unsigned(31 downto 0);
signal pixel_counter_MUX_uxn_c_l180_c9_1e80_return_output : unsigned(31 downto 0);

-- BIN_OP_PLUS[uxn_c_l181_c3_a06a]
signal BIN_OP_PLUS_uxn_c_l181_c3_a06a_left : unsigned(31 downto 0);
signal BIN_OP_PLUS_uxn_c_l181_c3_a06a_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l181_c3_a06a_return_output : unsigned(32 downto 0);

-- BIN_OP_EQ[uxn_c_l182_c27_ddea]
signal BIN_OP_EQ_uxn_c_l182_c27_ddea_left : unsigned(31 downto 0);
signal BIN_OP_EQ_uxn_c_l182_c27_ddea_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l182_c27_ddea_return_output : unsigned(0 downto 0);

-- BIN_OP_MINUS[uxn_c_l182_c60_e1f3]
signal BIN_OP_MINUS_uxn_c_l182_c60_e1f3_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_uxn_c_l182_c60_e1f3_right : unsigned(0 downto 0);
signal BIN_OP_MINUS_uxn_c_l182_c60_e1f3_return_output : unsigned(31 downto 0);

-- MUX[uxn_c_l182_c27_14eb]
signal MUX_uxn_c_l182_c27_14eb_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l182_c27_14eb_iftrue : unsigned(31 downto 0);
signal MUX_uxn_c_l182_c27_14eb_iffalse : unsigned(31 downto 0);
signal MUX_uxn_c_l182_c27_14eb_return_output : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_c_l185_c17_2531]
signal BIN_OP_EQ_uxn_c_l185_c17_2531_left : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l185_c17_2531_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l185_c17_2531_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l185_c17_37df]
signal MUX_uxn_c_l185_c17_37df_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l185_c17_37df_iftrue : unsigned(1 downto 0);
signal MUX_uxn_c_l185_c17_37df_iffalse : unsigned(1 downto 0);
signal MUX_uxn_c_l185_c17_37df_return_output : unsigned(1 downto 0);

-- UNARY_OP_NOT_uint1_t_uxn_c_l167_l174_DUPLICATE_fcb1
signal UNARY_OP_NOT_uint1_t_uxn_c_l167_l174_DUPLICATE_fcb1_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uint1_t_uxn_c_l167_l174_DUPLICATE_fcb1_return_output : unsigned(0 downto 0);

-- BIN_OP_AND_uint1_t_uint1_t_uxn_c_l174_l167_DUPLICATE_62f0
signal BIN_OP_AND_uint1_t_uint1_t_uxn_c_l174_l167_DUPLICATE_62f0_left : unsigned(0 downto 0);
signal BIN_OP_AND_uint1_t_uint1_t_uxn_c_l174_l167_DUPLICATE_62f0_right : unsigned(0 downto 0);
signal BIN_OP_AND_uint1_t_uint1_t_uxn_c_l174_l167_DUPLICATE_62f0_return_output : unsigned(0 downto 0);

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
-- BIN_OP_GT_uxn_c_l124_c26_6a8b
BIN_OP_GT_uxn_c_l124_c26_6a8b : entity work.BIN_OP_GT_uint32_t_uint18_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_c_l124_c26_6a8b_left,
BIN_OP_GT_uxn_c_l124_c26_6a8b_right,
BIN_OP_GT_uxn_c_l124_c26_6a8b_return_output);

-- MUX_uxn_c_l124_c26_191c
MUX_uxn_c_l124_c26_191c : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
MUX_uxn_c_l124_c26_191c_cond,
MUX_uxn_c_l124_c26_191c_iftrue,
MUX_uxn_c_l124_c26_191c_iffalse,
MUX_uxn_c_l124_c26_191c_return_output);

-- CONST_SR_28_uxn_c_l125_c24_c795
CONST_SR_28_uxn_c_l125_c24_c795 : entity work.CONST_SR_28_uint32_t_0CLK_de264c78 port map (
CONST_SR_28_uxn_c_l125_c24_c795_x,
CONST_SR_28_uxn_c_l125_c24_c795_return_output);

-- BIN_OP_EQ_uxn_c_l126_c17_064d
BIN_OP_EQ_uxn_c_l126_c17_064d : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l126_c17_064d_left,
BIN_OP_EQ_uxn_c_l126_c17_064d_right,
BIN_OP_EQ_uxn_c_l126_c17_064d_return_output);

-- MUX_uxn_c_l126_c17_e5cb
MUX_uxn_c_l126_c17_e5cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l126_c17_e5cb_cond,
MUX_uxn_c_l126_c17_e5cb_iftrue,
MUX_uxn_c_l126_c17_e5cb_iffalse,
MUX_uxn_c_l126_c17_e5cb_return_output);

-- BIN_OP_DIV_uxn_c_l127_c6_11f5
BIN_OP_DIV_uxn_c_l127_c6_11f5 : entity work.BIN_OP_DIV_uint32_t_uint9_t_0CLK_422b4ffb port map (
BIN_OP_DIV_uxn_c_l127_c6_11f5_left,
BIN_OP_DIV_uxn_c_l127_c6_11f5_right,
BIN_OP_DIV_uxn_c_l127_c6_11f5_return_output);

-- BIN_OP_INFERRED_MULT_uxn_c_l128_c23_8844
BIN_OP_INFERRED_MULT_uxn_c_l128_c23_8844 : entity work.BIN_OP_INFERRED_MULT_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_c_l128_c23_8844_left,
BIN_OP_INFERRED_MULT_uxn_c_l128_c23_8844_right,
BIN_OP_INFERRED_MULT_uxn_c_l128_c23_8844_return_output);

-- BIN_OP_MINUS_uxn_c_l128_c6_421d
BIN_OP_MINUS_uxn_c_l128_c6_421d : entity work.BIN_OP_MINUS_uint32_t_uint25_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l128_c6_421d_left,
BIN_OP_MINUS_uxn_c_l128_c6_421d_right,
BIN_OP_MINUS_uxn_c_l128_c6_421d_return_output);

-- UNARY_OP_NOT_uxn_c_l131_c22_1cbb
UNARY_OP_NOT_uxn_c_l131_c22_1cbb : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l131_c22_1cbb_expr,
UNARY_OP_NOT_uxn_c_l131_c22_1cbb_return_output);

-- BIN_OP_AND_uxn_c_l131_c6_da9e
BIN_OP_AND_uxn_c_l131_c6_da9e : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l131_c6_da9e_left,
BIN_OP_AND_uxn_c_l131_c6_da9e_right,
BIN_OP_AND_uxn_c_l131_c6_da9e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l131_c1_f61a
TRUE_CLOCK_ENABLE_MUX_uxn_c_l131_c1_f61a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l131_c1_f61a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l131_c1_f61a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l131_c1_f61a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l131_c1_f61a_return_output);

-- fill_layer_MUX_uxn_c_l131_c2_973e
fill_layer_MUX_uxn_c_l131_c2_973e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
fill_layer_MUX_uxn_c_l131_c2_973e_cond,
fill_layer_MUX_uxn_c_l131_c2_973e_iftrue,
fill_layer_MUX_uxn_c_l131_c2_973e_iffalse,
fill_layer_MUX_uxn_c_l131_c2_973e_return_output);

-- fill_x0_MUX_uxn_c_l131_c2_973e
fill_x0_MUX_uxn_c_l131_c2_973e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_x0_MUX_uxn_c_l131_c2_973e_cond,
fill_x0_MUX_uxn_c_l131_c2_973e_iftrue,
fill_x0_MUX_uxn_c_l131_c2_973e_iffalse,
fill_x0_MUX_uxn_c_l131_c2_973e_return_output);

-- fill_x1_MUX_uxn_c_l131_c2_973e
fill_x1_MUX_uxn_c_l131_c2_973e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_x1_MUX_uxn_c_l131_c2_973e_cond,
fill_x1_MUX_uxn_c_l131_c2_973e_iftrue,
fill_x1_MUX_uxn_c_l131_c2_973e_iffalse,
fill_x1_MUX_uxn_c_l131_c2_973e_return_output);

-- is_fill_left_MUX_uxn_c_l131_c2_973e
is_fill_left_MUX_uxn_c_l131_c2_973e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_left_MUX_uxn_c_l131_c2_973e_cond,
is_fill_left_MUX_uxn_c_l131_c2_973e_iftrue,
is_fill_left_MUX_uxn_c_l131_c2_973e_iffalse,
is_fill_left_MUX_uxn_c_l131_c2_973e_return_output);

-- is_fill_top_MUX_uxn_c_l131_c2_973e
is_fill_top_MUX_uxn_c_l131_c2_973e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_top_MUX_uxn_c_l131_c2_973e_cond,
is_fill_top_MUX_uxn_c_l131_c2_973e_iftrue,
is_fill_top_MUX_uxn_c_l131_c2_973e_iffalse,
is_fill_top_MUX_uxn_c_l131_c2_973e_return_output);

-- fill_pixels_remaining_MUX_uxn_c_l131_c2_973e
fill_pixels_remaining_MUX_uxn_c_l131_c2_973e : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
fill_pixels_remaining_MUX_uxn_c_l131_c2_973e_cond,
fill_pixels_remaining_MUX_uxn_c_l131_c2_973e_iftrue,
fill_pixels_remaining_MUX_uxn_c_l131_c2_973e_iffalse,
fill_pixels_remaining_MUX_uxn_c_l131_c2_973e_return_output);

-- fill_y1_MUX_uxn_c_l131_c2_973e
fill_y1_MUX_uxn_c_l131_c2_973e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_y1_MUX_uxn_c_l131_c2_973e_cond,
fill_y1_MUX_uxn_c_l131_c2_973e_iftrue,
fill_y1_MUX_uxn_c_l131_c2_973e_iffalse,
fill_y1_MUX_uxn_c_l131_c2_973e_return_output);

-- fill_color_MUX_uxn_c_l131_c2_973e
fill_color_MUX_uxn_c_l131_c2_973e : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
fill_color_MUX_uxn_c_l131_c2_973e_cond,
fill_color_MUX_uxn_c_l131_c2_973e_iftrue,
fill_color_MUX_uxn_c_l131_c2_973e_iffalse,
fill_color_MUX_uxn_c_l131_c2_973e_return_output);

-- fill_y0_MUX_uxn_c_l131_c2_973e
fill_y0_MUX_uxn_c_l131_c2_973e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_y0_MUX_uxn_c_l131_c2_973e_cond,
fill_y0_MUX_uxn_c_l131_c2_973e_iftrue,
fill_y0_MUX_uxn_c_l131_c2_973e_iffalse,
fill_y0_MUX_uxn_c_l131_c2_973e_return_output);

-- CONST_SR_20_uxn_c_l133_c18_3bfc
CONST_SR_20_uxn_c_l133_c18_3bfc : entity work.CONST_SR_20_uint32_t_0CLK_de264c78 port map (
CONST_SR_20_uxn_c_l133_c18_3bfc_x,
CONST_SR_20_uxn_c_l133_c18_3bfc_return_output);

-- CONST_SR_21_uxn_c_l134_c17_e011
CONST_SR_21_uxn_c_l134_c17_e011 : entity work.CONST_SR_21_uint32_t_0CLK_de264c78 port map (
CONST_SR_21_uxn_c_l134_c17_e011_x,
CONST_SR_21_uxn_c_l134_c17_e011_return_output);

-- BIN_OP_AND_uxn_c_l135_c27_9bdd
BIN_OP_AND_uxn_c_l135_c27_9bdd : entity work.BIN_OP_AND_uint32_t_uint18_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l135_c27_9bdd_left,
BIN_OP_AND_uxn_c_l135_c27_9bdd_right,
BIN_OP_AND_uxn_c_l135_c27_9bdd_return_output);

-- BIN_OP_DIV_uxn_c_l136_c13_1cd6
BIN_OP_DIV_uxn_c_l136_c13_1cd6 : entity work.BIN_OP_DIV_uint32_t_uint9_t_0CLK_422b4ffb port map (
BIN_OP_DIV_uxn_c_l136_c13_1cd6_left,
BIN_OP_DIV_uxn_c_l136_c13_1cd6_right,
BIN_OP_DIV_uxn_c_l136_c13_1cd6_return_output);

-- BIN_OP_INFERRED_MULT_uxn_c_l137_c38_d763
BIN_OP_INFERRED_MULT_uxn_c_l137_c38_d763 : entity work.BIN_OP_INFERRED_MULT_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_c_l137_c38_d763_left,
BIN_OP_INFERRED_MULT_uxn_c_l137_c38_d763_right,
BIN_OP_INFERRED_MULT_uxn_c_l137_c38_d763_return_output);

-- BIN_OP_MINUS_uxn_c_l137_c13_622e
BIN_OP_MINUS_uxn_c_l137_c13_622e : entity work.BIN_OP_MINUS_uint32_t_uint25_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l137_c13_622e_left,
BIN_OP_MINUS_uxn_c_l137_c13_622e_right,
BIN_OP_MINUS_uxn_c_l137_c13_622e_return_output);

-- MUX_uxn_c_l138_c13_24dd
MUX_uxn_c_l138_c13_24dd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l138_c13_24dd_cond,
MUX_uxn_c_l138_c13_24dd_iftrue,
MUX_uxn_c_l138_c13_24dd_iffalse,
MUX_uxn_c_l138_c13_24dd_return_output);

-- MUX_uxn_c_l139_c13_c5f6
MUX_uxn_c_l139_c13_c5f6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l139_c13_c5f6_cond,
MUX_uxn_c_l139_c13_c5f6_iftrue,
MUX_uxn_c_l139_c13_c5f6_iffalse,
MUX_uxn_c_l139_c13_c5f6_return_output);

-- MUX_uxn_c_l140_c13_6184
MUX_uxn_c_l140_c13_6184 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l140_c13_6184_cond,
MUX_uxn_c_l140_c13_6184_iftrue,
MUX_uxn_c_l140_c13_6184_iffalse,
MUX_uxn_c_l140_c13_6184_return_output);

-- MUX_uxn_c_l141_c13_772d
MUX_uxn_c_l141_c13_772d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l141_c13_772d_cond,
MUX_uxn_c_l141_c13_772d_iftrue,
MUX_uxn_c_l141_c13_772d_iffalse,
MUX_uxn_c_l141_c13_772d_return_output);

-- printf_uxn_c_l145_c3_22c2_uxn_c_l145_c3_22c2
printf_uxn_c_l145_c3_22c2_uxn_c_l145_c3_22c2 : entity work.printf_uxn_c_l145_c3_22c2_0CLK_de264c78 port map (
printf_uxn_c_l145_c3_22c2_uxn_c_l145_c3_22c2_CLOCK_ENABLE,
printf_uxn_c_l145_c3_22c2_uxn_c_l145_c3_22c2_arg0,
printf_uxn_c_l145_c3_22c2_uxn_c_l145_c3_22c2_arg1,
printf_uxn_c_l145_c3_22c2_uxn_c_l145_c3_22c2_arg2,
printf_uxn_c_l145_c3_22c2_uxn_c_l145_c3_22c2_arg3,
printf_uxn_c_l145_c3_22c2_uxn_c_l145_c3_22c2_arg4,
printf_uxn_c_l145_c3_22c2_uxn_c_l145_c3_22c2_arg5,
printf_uxn_c_l145_c3_22c2_uxn_c_l145_c3_22c2_arg6,
printf_uxn_c_l145_c3_22c2_uxn_c_l145_c3_22c2_arg7,
printf_uxn_c_l145_c3_22c2_uxn_c_l145_c3_22c2_arg8);

-- BIN_OP_EQ_uxn_c_l148_c19_a4da
BIN_OP_EQ_uxn_c_l148_c19_a4da : entity work.BIN_OP_EQ_uint32_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l148_c19_a4da_left,
BIN_OP_EQ_uxn_c_l148_c19_a4da_right,
BIN_OP_EQ_uxn_c_l148_c19_a4da_return_output);

-- MUX_uxn_c_l148_c19_575e
MUX_uxn_c_l148_c19_575e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l148_c19_575e_cond,
MUX_uxn_c_l148_c19_575e_iftrue,
MUX_uxn_c_l148_c19_575e_iffalse,
MUX_uxn_c_l148_c19_575e_return_output);

-- BIN_OP_GT_uxn_c_l150_c17_4e77
BIN_OP_GT_uxn_c_l150_c17_4e77 : entity work.BIN_OP_GT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_c_l150_c17_4e77_left,
BIN_OP_GT_uxn_c_l150_c17_4e77_right,
BIN_OP_GT_uxn_c_l150_c17_4e77_return_output);

-- BIN_OP_LT_uxn_c_l151_c17_2f5b
BIN_OP_LT_uxn_c_l151_c17_2f5b : entity work.BIN_OP_LT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_LT_uxn_c_l151_c17_2f5b_left,
BIN_OP_LT_uxn_c_l151_c17_2f5b_right,
BIN_OP_LT_uxn_c_l151_c17_2f5b_return_output);

-- BIN_OP_GT_uxn_c_l152_c17_06fa
BIN_OP_GT_uxn_c_l152_c17_06fa : entity work.BIN_OP_GT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_c_l152_c17_06fa_left,
BIN_OP_GT_uxn_c_l152_c17_06fa_right,
BIN_OP_GT_uxn_c_l152_c17_06fa_return_output);

-- BIN_OP_LT_uxn_c_l153_c17_1b15
BIN_OP_LT_uxn_c_l153_c17_1b15 : entity work.BIN_OP_LT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_LT_uxn_c_l153_c17_1b15_left,
BIN_OP_LT_uxn_c_l153_c17_1b15_right,
BIN_OP_LT_uxn_c_l153_c17_1b15_return_output);

-- BIN_OP_AND_uxn_c_l155_c18_ecab
BIN_OP_AND_uxn_c_l155_c18_ecab : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l155_c18_ecab_left,
BIN_OP_AND_uxn_c_l155_c18_ecab_right,
BIN_OP_AND_uxn_c_l155_c18_ecab_return_output);

-- BIN_OP_AND_uxn_c_l155_c18_21b3
BIN_OP_AND_uxn_c_l155_c18_21b3 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l155_c18_21b3_left,
BIN_OP_AND_uxn_c_l155_c18_21b3_right,
BIN_OP_AND_uxn_c_l155_c18_21b3_return_output);

-- BIN_OP_AND_uxn_c_l155_c18_713d
BIN_OP_AND_uxn_c_l155_c18_713d : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l155_c18_713d_left,
BIN_OP_AND_uxn_c_l155_c18_713d_right,
BIN_OP_AND_uxn_c_l155_c18_713d_return_output);

-- BIN_OP_AND_uxn_c_l155_c18_c301
BIN_OP_AND_uxn_c_l155_c18_c301 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l155_c18_c301_left,
BIN_OP_AND_uxn_c_l155_c18_c301_right,
BIN_OP_AND_uxn_c_l155_c18_c301_return_output);

-- UNARY_OP_NOT_uxn_c_l156_c37_99d5
UNARY_OP_NOT_uxn_c_l156_c37_99d5 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l156_c37_99d5_expr,
UNARY_OP_NOT_uxn_c_l156_c37_99d5_return_output);

-- BIN_OP_AND_uxn_c_l156_c19_b9f7
BIN_OP_AND_uxn_c_l156_c19_b9f7 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l156_c19_b9f7_left,
BIN_OP_AND_uxn_c_l156_c19_b9f7_right,
BIN_OP_AND_uxn_c_l156_c19_b9f7_return_output);

-- BIN_OP_AND_uxn_c_l157_c19_a93e
BIN_OP_AND_uxn_c_l157_c19_a93e : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l157_c19_a93e_left,
BIN_OP_AND_uxn_c_l157_c19_a93e_right,
BIN_OP_AND_uxn_c_l157_c19_a93e_return_output);

-- MUX_uxn_c_l165_c37_66ba
MUX_uxn_c_l165_c37_66ba : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
MUX_uxn_c_l165_c37_66ba_cond,
MUX_uxn_c_l165_c37_66ba_iftrue,
MUX_uxn_c_l165_c37_66ba_iffalse,
MUX_uxn_c_l165_c37_66ba_return_output);

-- MUX_uxn_c_l165_c3_c8c1
MUX_uxn_c_l165_c3_c8c1 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
MUX_uxn_c_l165_c3_c8c1_cond,
MUX_uxn_c_l165_c3_c8c1_iftrue,
MUX_uxn_c_l165_c3_c8c1_iffalse,
MUX_uxn_c_l165_c3_c8c1_return_output);

-- MUX_uxn_c_l166_c3_4f32
MUX_uxn_c_l166_c3_4f32 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
MUX_uxn_c_l166_c3_4f32_cond,
MUX_uxn_c_l166_c3_4f32_iftrue,
MUX_uxn_c_l166_c3_4f32_iffalse,
MUX_uxn_c_l166_c3_4f32_return_output);

-- UNARY_OP_NOT_uxn_c_l167_c57_d7fe
UNARY_OP_NOT_uxn_c_l167_c57_d7fe : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l167_c57_d7fe_expr,
UNARY_OP_NOT_uxn_c_l167_c57_d7fe_return_output);

-- BIN_OP_AND_uxn_c_l167_c22_edef
BIN_OP_AND_uxn_c_l167_c22_edef : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l167_c22_edef_left,
BIN_OP_AND_uxn_c_l167_c22_edef_right,
BIN_OP_AND_uxn_c_l167_c22_edef_return_output);

-- BIN_OP_OR_uxn_c_l167_c3_79bc
BIN_OP_OR_uxn_c_l167_c3_79bc : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l167_c3_79bc_left,
BIN_OP_OR_uxn_c_l167_c3_79bc_right,
BIN_OP_OR_uxn_c_l167_c3_79bc_return_output);

-- bg_vram_update_uxn_c_l163_c19_498a
bg_vram_update_uxn_c_l163_c19_498a : entity work.bg_vram_update_0CLK_b45f1687 port map (
clk,
bg_vram_update_uxn_c_l163_c19_498a_CLOCK_ENABLE,
bg_vram_update_uxn_c_l163_c19_498a_read_address,
bg_vram_update_uxn_c_l163_c19_498a_write_address,
bg_vram_update_uxn_c_l163_c19_498a_write_value,
bg_vram_update_uxn_c_l163_c19_498a_write_enable,
bg_vram_update_uxn_c_l163_c19_498a_return_output);

-- MUX_uxn_c_l172_c37_0567
MUX_uxn_c_l172_c37_0567 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
MUX_uxn_c_l172_c37_0567_cond,
MUX_uxn_c_l172_c37_0567_iftrue,
MUX_uxn_c_l172_c37_0567_iffalse,
MUX_uxn_c_l172_c37_0567_return_output);

-- MUX_uxn_c_l172_c3_d071
MUX_uxn_c_l172_c3_d071 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
MUX_uxn_c_l172_c3_d071_cond,
MUX_uxn_c_l172_c3_d071_iftrue,
MUX_uxn_c_l172_c3_d071_iffalse,
MUX_uxn_c_l172_c3_d071_return_output);

-- MUX_uxn_c_l173_c3_60b3
MUX_uxn_c_l173_c3_60b3 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
MUX_uxn_c_l173_c3_60b3_cond,
MUX_uxn_c_l173_c3_60b3_iftrue,
MUX_uxn_c_l173_c3_60b3_iffalse,
MUX_uxn_c_l173_c3_60b3_return_output);

-- BIN_OP_AND_uxn_c_l174_c22_ada2
BIN_OP_AND_uxn_c_l174_c22_ada2 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l174_c22_ada2_left,
BIN_OP_AND_uxn_c_l174_c22_ada2_right,
BIN_OP_AND_uxn_c_l174_c22_ada2_return_output);

-- BIN_OP_OR_uxn_c_l174_c3_f563
BIN_OP_OR_uxn_c_l174_c3_f563 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l174_c3_f563_left,
BIN_OP_OR_uxn_c_l174_c3_f563_right,
BIN_OP_OR_uxn_c_l174_c3_f563_return_output);

-- fg_vram_update_uxn_c_l170_c19_8db4
fg_vram_update_uxn_c_l170_c19_8db4 : entity work.fg_vram_update_0CLK_b45f1687 port map (
clk,
fg_vram_update_uxn_c_l170_c19_8db4_CLOCK_ENABLE,
fg_vram_update_uxn_c_l170_c19_8db4_read_address,
fg_vram_update_uxn_c_l170_c19_8db4_write_address,
fg_vram_update_uxn_c_l170_c19_8db4_write_value,
fg_vram_update_uxn_c_l170_c19_8db4_write_enable,
fg_vram_update_uxn_c_l170_c19_8db4_return_output);

-- BIN_OP_EQ_uxn_c_l178_c6_c111
BIN_OP_EQ_uxn_c_l178_c6_c111 : entity work.BIN_OP_EQ_uint32_t_uint18_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l178_c6_c111_left,
BIN_OP_EQ_uxn_c_l178_c6_c111_right,
BIN_OP_EQ_uxn_c_l178_c6_c111_return_output);

-- fill_pixels_remaining_MUX_uxn_c_l178_c2_e14c
fill_pixels_remaining_MUX_uxn_c_l178_c2_e14c : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
fill_pixels_remaining_MUX_uxn_c_l178_c2_e14c_cond,
fill_pixels_remaining_MUX_uxn_c_l178_c2_e14c_iftrue,
fill_pixels_remaining_MUX_uxn_c_l178_c2_e14c_iffalse,
fill_pixels_remaining_MUX_uxn_c_l178_c2_e14c_return_output);

-- pixel_counter_MUX_uxn_c_l178_c2_e14c
pixel_counter_MUX_uxn_c_l178_c2_e14c : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
pixel_counter_MUX_uxn_c_l178_c2_e14c_cond,
pixel_counter_MUX_uxn_c_l178_c2_e14c_iftrue,
pixel_counter_MUX_uxn_c_l178_c2_e14c_iffalse,
pixel_counter_MUX_uxn_c_l178_c2_e14c_return_output);

-- fill_pixels_remaining_MUX_uxn_c_l180_c9_1e80
fill_pixels_remaining_MUX_uxn_c_l180_c9_1e80 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
fill_pixels_remaining_MUX_uxn_c_l180_c9_1e80_cond,
fill_pixels_remaining_MUX_uxn_c_l180_c9_1e80_iftrue,
fill_pixels_remaining_MUX_uxn_c_l180_c9_1e80_iffalse,
fill_pixels_remaining_MUX_uxn_c_l180_c9_1e80_return_output);

-- pixel_counter_MUX_uxn_c_l180_c9_1e80
pixel_counter_MUX_uxn_c_l180_c9_1e80 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
pixel_counter_MUX_uxn_c_l180_c9_1e80_cond,
pixel_counter_MUX_uxn_c_l180_c9_1e80_iftrue,
pixel_counter_MUX_uxn_c_l180_c9_1e80_iffalse,
pixel_counter_MUX_uxn_c_l180_c9_1e80_return_output);

-- BIN_OP_PLUS_uxn_c_l181_c3_a06a
BIN_OP_PLUS_uxn_c_l181_c3_a06a : entity work.BIN_OP_PLUS_uint32_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l181_c3_a06a_left,
BIN_OP_PLUS_uxn_c_l181_c3_a06a_right,
BIN_OP_PLUS_uxn_c_l181_c3_a06a_return_output);

-- BIN_OP_EQ_uxn_c_l182_c27_ddea
BIN_OP_EQ_uxn_c_l182_c27_ddea : entity work.BIN_OP_EQ_uint32_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l182_c27_ddea_left,
BIN_OP_EQ_uxn_c_l182_c27_ddea_right,
BIN_OP_EQ_uxn_c_l182_c27_ddea_return_output);

-- BIN_OP_MINUS_uxn_c_l182_c60_e1f3
BIN_OP_MINUS_uxn_c_l182_c60_e1f3 : entity work.BIN_OP_MINUS_uint32_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l182_c60_e1f3_left,
BIN_OP_MINUS_uxn_c_l182_c60_e1f3_right,
BIN_OP_MINUS_uxn_c_l182_c60_e1f3_return_output);

-- MUX_uxn_c_l182_c27_14eb
MUX_uxn_c_l182_c27_14eb : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
MUX_uxn_c_l182_c27_14eb_cond,
MUX_uxn_c_l182_c27_14eb_iftrue,
MUX_uxn_c_l182_c27_14eb_iffalse,
MUX_uxn_c_l182_c27_14eb_return_output);

-- BIN_OP_EQ_uxn_c_l185_c17_2531
BIN_OP_EQ_uxn_c_l185_c17_2531 : entity work.BIN_OP_EQ_uint2_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l185_c17_2531_left,
BIN_OP_EQ_uxn_c_l185_c17_2531_right,
BIN_OP_EQ_uxn_c_l185_c17_2531_return_output);

-- MUX_uxn_c_l185_c17_37df
MUX_uxn_c_l185_c17_37df : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
MUX_uxn_c_l185_c17_37df_cond,
MUX_uxn_c_l185_c17_37df_iftrue,
MUX_uxn_c_l185_c17_37df_iffalse,
MUX_uxn_c_l185_c17_37df_return_output);

-- UNARY_OP_NOT_uint1_t_uxn_c_l167_l174_DUPLICATE_fcb1
UNARY_OP_NOT_uint1_t_uxn_c_l167_l174_DUPLICATE_fcb1 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uint1_t_uxn_c_l167_l174_DUPLICATE_fcb1_expr,
UNARY_OP_NOT_uint1_t_uxn_c_l167_l174_DUPLICATE_fcb1_return_output);

-- BIN_OP_AND_uint1_t_uint1_t_uxn_c_l174_l167_DUPLICATE_62f0
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l174_l167_DUPLICATE_62f0 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l174_l167_DUPLICATE_62f0_left,
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l174_l167_DUPLICATE_62f0_right,
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l174_l167_DUPLICATE_62f0_return_output);



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
 BIN_OP_GT_uxn_c_l124_c26_6a8b_return_output,
 MUX_uxn_c_l124_c26_191c_return_output,
 CONST_SR_28_uxn_c_l125_c24_c795_return_output,
 BIN_OP_EQ_uxn_c_l126_c17_064d_return_output,
 MUX_uxn_c_l126_c17_e5cb_return_output,
 BIN_OP_DIV_uxn_c_l127_c6_11f5_return_output,
 BIN_OP_INFERRED_MULT_uxn_c_l128_c23_8844_return_output,
 BIN_OP_MINUS_uxn_c_l128_c6_421d_return_output,
 UNARY_OP_NOT_uxn_c_l131_c22_1cbb_return_output,
 BIN_OP_AND_uxn_c_l131_c6_da9e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l131_c1_f61a_return_output,
 fill_layer_MUX_uxn_c_l131_c2_973e_return_output,
 fill_x0_MUX_uxn_c_l131_c2_973e_return_output,
 fill_x1_MUX_uxn_c_l131_c2_973e_return_output,
 is_fill_left_MUX_uxn_c_l131_c2_973e_return_output,
 is_fill_top_MUX_uxn_c_l131_c2_973e_return_output,
 fill_pixels_remaining_MUX_uxn_c_l131_c2_973e_return_output,
 fill_y1_MUX_uxn_c_l131_c2_973e_return_output,
 fill_color_MUX_uxn_c_l131_c2_973e_return_output,
 fill_y0_MUX_uxn_c_l131_c2_973e_return_output,
 CONST_SR_20_uxn_c_l133_c18_3bfc_return_output,
 CONST_SR_21_uxn_c_l134_c17_e011_return_output,
 BIN_OP_AND_uxn_c_l135_c27_9bdd_return_output,
 BIN_OP_DIV_uxn_c_l136_c13_1cd6_return_output,
 BIN_OP_INFERRED_MULT_uxn_c_l137_c38_d763_return_output,
 BIN_OP_MINUS_uxn_c_l137_c13_622e_return_output,
 MUX_uxn_c_l138_c13_24dd_return_output,
 MUX_uxn_c_l139_c13_c5f6_return_output,
 MUX_uxn_c_l140_c13_6184_return_output,
 MUX_uxn_c_l141_c13_772d_return_output,
 BIN_OP_EQ_uxn_c_l148_c19_a4da_return_output,
 MUX_uxn_c_l148_c19_575e_return_output,
 BIN_OP_GT_uxn_c_l150_c17_4e77_return_output,
 BIN_OP_LT_uxn_c_l151_c17_2f5b_return_output,
 BIN_OP_GT_uxn_c_l152_c17_06fa_return_output,
 BIN_OP_LT_uxn_c_l153_c17_1b15_return_output,
 BIN_OP_AND_uxn_c_l155_c18_ecab_return_output,
 BIN_OP_AND_uxn_c_l155_c18_21b3_return_output,
 BIN_OP_AND_uxn_c_l155_c18_713d_return_output,
 BIN_OP_AND_uxn_c_l155_c18_c301_return_output,
 UNARY_OP_NOT_uxn_c_l156_c37_99d5_return_output,
 BIN_OP_AND_uxn_c_l156_c19_b9f7_return_output,
 BIN_OP_AND_uxn_c_l157_c19_a93e_return_output,
 MUX_uxn_c_l165_c37_66ba_return_output,
 MUX_uxn_c_l165_c3_c8c1_return_output,
 MUX_uxn_c_l166_c3_4f32_return_output,
 UNARY_OP_NOT_uxn_c_l167_c57_d7fe_return_output,
 BIN_OP_AND_uxn_c_l167_c22_edef_return_output,
 BIN_OP_OR_uxn_c_l167_c3_79bc_return_output,
 bg_vram_update_uxn_c_l163_c19_498a_return_output,
 MUX_uxn_c_l172_c37_0567_return_output,
 MUX_uxn_c_l172_c3_d071_return_output,
 MUX_uxn_c_l173_c3_60b3_return_output,
 BIN_OP_AND_uxn_c_l174_c22_ada2_return_output,
 BIN_OP_OR_uxn_c_l174_c3_f563_return_output,
 fg_vram_update_uxn_c_l170_c19_8db4_return_output,
 BIN_OP_EQ_uxn_c_l178_c6_c111_return_output,
 fill_pixels_remaining_MUX_uxn_c_l178_c2_e14c_return_output,
 pixel_counter_MUX_uxn_c_l178_c2_e14c_return_output,
 fill_pixels_remaining_MUX_uxn_c_l180_c9_1e80_return_output,
 pixel_counter_MUX_uxn_c_l180_c9_1e80_return_output,
 BIN_OP_PLUS_uxn_c_l181_c3_a06a_return_output,
 BIN_OP_EQ_uxn_c_l182_c27_ddea_return_output,
 BIN_OP_MINUS_uxn_c_l182_c60_e1f3_return_output,
 MUX_uxn_c_l182_c27_14eb_return_output,
 BIN_OP_EQ_uxn_c_l185_c17_2531_return_output,
 MUX_uxn_c_l185_c17_37df_return_output,
 UNARY_OP_NOT_uint1_t_uxn_c_l167_l174_DUPLICATE_fcb1_return_output,
 BIN_OP_AND_uint1_t_uint1_t_uxn_c_l174_l167_DUPLICATE_62f0_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : gpu_step_result_t;
 variable VAR_is_active_drawing_area : unsigned(0 downto 0);
 variable VAR_is_vram_write : unsigned(0 downto 0);
 variable VAR_vram_write_layer : unsigned(0 downto 0);
 variable VAR_vram_address : unsigned(31 downto 0);
 variable VAR_vram_value : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l124_c26_191c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l124_c26_191c_iftrue : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l124_c26_191c_iffalse : unsigned(31 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l124_c26_6a8b_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l124_c26_6a8b_right : unsigned(17 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l124_c26_6a8b_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l124_c26_191c_return_output : unsigned(31 downto 0);
 variable VAR_CONST_SR_28_uxn_c_l125_c24_c795_return_output : unsigned(31 downto 0);
 variable VAR_CONST_SR_28_uxn_c_l125_c24_c795_x : unsigned(31 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_c_l125_c14_e882_return_output : unsigned(3 downto 0);
 variable VAR_MUX_uxn_c_l126_c17_e5cb_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l126_c17_e5cb_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l126_c17_e5cb_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l126_c17_064d_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l126_c17_064d_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l126_c17_064d_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l126_c17_e5cb_return_output : unsigned(0 downto 0);
 variable VAR_y_uxn_c_l127_c2_b301 : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_c_l127_c6_11f5_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_DIV_uxn_c_l127_c6_11f5_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_DIV_uxn_c_l127_c6_11f5_return_output : unsigned(31 downto 0);
 variable VAR_x_uxn_c_l128_c2_a60b : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l128_c6_421d_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l128_c23_8844_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l128_c23_8844_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l128_c23_8844_return_output : unsigned(24 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l128_c6_421d_right : unsigned(24 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l128_c6_421d_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l131_c6_da9e_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l131_c22_1cbb_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l131_c22_1cbb_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l131_c6_da9e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l131_c6_da9e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l131_c1_f61a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l131_c1_f61a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l131_c1_f61a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l131_c1_f61a_iffalse : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l131_c2_973e_iftrue : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l131_c2_973e_iffalse : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l131_c2_973e_return_output : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l131_c2_973e_cond : unsigned(0 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l131_c2_973e_iftrue : unsigned(15 downto 0);
 variable VAR_fill_x0_uxn_c_l141_c3_fef9 : unsigned(15 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l131_c2_973e_iffalse : unsigned(15 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l131_c2_973e_return_output : unsigned(15 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l131_c2_973e_cond : unsigned(0 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l131_c2_973e_iftrue : unsigned(15 downto 0);
 variable VAR_fill_x1_uxn_c_l139_c3_a4dc : unsigned(15 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l131_c2_973e_iffalse : unsigned(15 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l131_c2_973e_return_output : unsigned(15 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l131_c2_973e_cond : unsigned(0 downto 0);
 variable VAR_is_fill_left_MUX_uxn_c_l131_c2_973e_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_left_uxn_c_l133_c3_b6fa : unsigned(0 downto 0);
 variable VAR_is_fill_left_MUX_uxn_c_l131_c2_973e_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_left_MUX_uxn_c_l131_c2_973e_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_left_MUX_uxn_c_l131_c2_973e_cond : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l131_c2_973e_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_top_uxn_c_l134_c3_8480 : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l131_c2_973e_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l131_c2_973e_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l131_c2_973e_cond : unsigned(0 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l131_c2_973e_iftrue : unsigned(31 downto 0);
 variable VAR_fill_pixels_remaining_uxn_c_l144_c3_d196 : unsigned(31 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l131_c2_973e_iffalse : unsigned(31 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l131_c2_973e_return_output : unsigned(31 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l131_c2_973e_cond : unsigned(0 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l131_c2_973e_iftrue : unsigned(15 downto 0);
 variable VAR_fill_y1_uxn_c_l138_c3_b520 : unsigned(15 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l131_c2_973e_iffalse : unsigned(15 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l131_c2_973e_return_output : unsigned(15 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l131_c2_973e_cond : unsigned(0 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l131_c2_973e_iftrue : unsigned(1 downto 0);
 variable VAR_fill_color_uxn_c_l143_c3_16a0 : unsigned(1 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l131_c2_973e_iffalse : unsigned(1 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l131_c2_973e_return_output : unsigned(1 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l131_c2_973e_cond : unsigned(0 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l131_c2_973e_iftrue : unsigned(15 downto 0);
 variable VAR_fill_y0_uxn_c_l140_c3_2309 : unsigned(15 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l131_c2_973e_iffalse : unsigned(15 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l131_c2_973e_return_output : unsigned(15 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l131_c2_973e_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_20_uxn_c_l133_c18_3bfc_return_output : unsigned(31 downto 0);
 variable VAR_CONST_SR_20_uxn_c_l133_c18_3bfc_x : unsigned(31 downto 0);
 variable VAR_CONST_SR_21_uxn_c_l134_c17_e011_return_output : unsigned(31 downto 0);
 variable VAR_CONST_SR_21_uxn_c_l134_c17_e011_x : unsigned(31 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l135_c27_9bdd_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l135_c27_9bdd_right : unsigned(17 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l135_c27_9bdd_return_output : unsigned(31 downto 0);
 variable VAR_fill_y0_uxn_c_l136_c3_e04a : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_c_l136_c13_1cd6_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_DIV_uxn_c_l136_c13_1cd6_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_DIV_uxn_c_l136_c13_1cd6_return_output : unsigned(31 downto 0);
 variable VAR_fill_x0_uxn_c_l137_c3_5ba7 : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l137_c13_622e_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l137_c38_d763_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l137_c38_d763_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l137_c38_d763_return_output : unsigned(24 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l137_c13_622e_right : unsigned(24 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l137_c13_622e_return_output : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l138_c13_24dd_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l138_c13_24dd_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l138_c13_24dd_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l138_c13_24dd_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l139_c13_c5f6_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l139_c13_c5f6_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l139_c13_c5f6_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l139_c13_c5f6_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l140_c13_6184_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l140_c13_6184_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l140_c13_6184_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l140_c13_6184_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l141_c13_772d_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l141_c13_772d_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l141_c13_772d_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l141_c13_772d_return_output : unsigned(15 downto 0);
 variable VAR_printf_uxn_c_l145_c3_22c2_uxn_c_l145_c3_22c2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l145_c3_22c2_uxn_c_l145_c3_22c2_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l145_c3_22c2_uxn_c_l145_c3_22c2_arg1 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l145_c3_22c2_uxn_c_l145_c3_22c2_arg2 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l145_c3_22c2_uxn_c_l145_c3_22c2_arg3 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l145_c3_22c2_uxn_c_l145_c3_22c2_arg4 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l145_c3_22c2_uxn_c_l145_c3_22c2_arg5 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l145_c3_22c2_uxn_c_l145_c3_22c2_arg6 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l145_c3_22c2_uxn_c_l145_c3_22c2_arg7 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l145_c3_22c2_uxn_c_l145_c3_22c2_arg8 : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l148_c19_575e_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l148_c19_575e_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l148_c19_575e_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l148_c19_a4da_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l148_c19_a4da_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l148_c19_a4da_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l148_c19_575e_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l150_c17_4e77_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l150_c17_4e77_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l150_c17_4e77_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_LT_uxn_c_l151_c17_2f5b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_c_l151_c17_2f5b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_c_l151_c17_2f5b_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l152_c17_06fa_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l152_c17_06fa_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l152_c17_06fa_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_LT_uxn_c_l153_c17_1b15_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_c_l153_c17_1b15_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_c_l153_c17_1b15_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l155_c18_ecab_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l155_c18_ecab_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l155_c18_ecab_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l155_c18_21b3_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l155_c18_21b3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l155_c18_21b3_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l155_c18_713d_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l155_c18_713d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l155_c18_713d_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l155_c18_c301_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l155_c18_c301_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l155_c18_c301_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l156_c19_b9f7_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l156_c37_99d5_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l156_c37_99d5_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l156_c19_b9f7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l156_c19_b9f7_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l157_c19_a93e_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l157_c19_a93e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l157_c19_a93e_return_output : unsigned(0 downto 0);
 variable VAR_bg_vram_update_uxn_c_l163_c19_498a_read_address : unsigned(31 downto 0);
 variable VAR_bg_vram_update_uxn_c_l163_c19_498a_write_address : unsigned(31 downto 0);
 variable VAR_bg_vram_update_uxn_c_l163_c19_498a_write_value : unsigned(1 downto 0);
 variable VAR_bg_vram_update_uxn_c_l163_c19_498a_write_enable : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l165_c3_c8c1_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l165_c3_c8c1_iftrue : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l165_c3_c8c1_iffalse : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l165_c37_66ba_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l165_c37_66ba_iftrue : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l165_c37_66ba_iffalse : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l165_c37_66ba_return_output : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l165_c3_c8c1_return_output : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l166_c3_4f32_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l166_c3_4f32_iftrue : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l166_c3_4f32_iffalse : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l166_c3_4f32_return_output : unsigned(1 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l167_c3_79bc_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l167_c22_edef_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l167_c57_d7fe_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l167_c57_d7fe_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l167_c22_edef_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l167_c22_edef_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l167_c3_79bc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l167_c3_79bc_return_output : unsigned(0 downto 0);
 variable VAR_bg_vram_update_uxn_c_l163_c19_498a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_bg_vram_update_uxn_c_l163_c19_498a_return_output : unsigned(1 downto 0);
 variable VAR_fg_vram_update_uxn_c_l170_c19_8db4_read_address : unsigned(31 downto 0);
 variable VAR_fg_vram_update_uxn_c_l170_c19_8db4_write_address : unsigned(31 downto 0);
 variable VAR_fg_vram_update_uxn_c_l170_c19_8db4_write_value : unsigned(1 downto 0);
 variable VAR_fg_vram_update_uxn_c_l170_c19_8db4_write_enable : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l172_c3_d071_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l172_c3_d071_iftrue : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l172_c3_d071_iffalse : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l172_c37_0567_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l172_c37_0567_iftrue : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l172_c37_0567_iffalse : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l172_c37_0567_return_output : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l172_c3_d071_return_output : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l173_c3_60b3_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l173_c3_60b3_iftrue : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l173_c3_60b3_iffalse : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l173_c3_60b3_return_output : unsigned(1 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l174_c3_f563_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l174_c22_ada2_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l174_c22_ada2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l174_c22_ada2_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l174_c3_f563_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l174_c3_f563_return_output : unsigned(0 downto 0);
 variable VAR_fg_vram_update_uxn_c_l170_c19_8db4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_fg_vram_update_uxn_c_l170_c19_8db4_return_output : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l178_c6_c111_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l178_c6_c111_right : unsigned(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l178_c6_c111_return_output : unsigned(0 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l178_c2_e14c_iftrue : unsigned(31 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l178_c2_e14c_iffalse : unsigned(31 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l180_c9_1e80_return_output : unsigned(31 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l178_c2_e14c_return_output : unsigned(31 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l178_c2_e14c_cond : unsigned(0 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l178_c2_e14c_iftrue : unsigned(31 downto 0);
 variable VAR_pixel_counter_uxn_c_l179_c3_c3eb : unsigned(31 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l178_c2_e14c_iffalse : unsigned(31 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l180_c9_1e80_return_output : unsigned(31 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l178_c2_e14c_return_output : unsigned(31 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l178_c2_e14c_cond : unsigned(0 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l180_c9_1e80_iftrue : unsigned(31 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l180_c9_1e80_iffalse : unsigned(31 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l180_c9_1e80_cond : unsigned(0 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l180_c9_1e80_iftrue : unsigned(31 downto 0);
 variable VAR_pixel_counter_uxn_c_l181_c3_e8b4 : unsigned(31 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l180_c9_1e80_iffalse : unsigned(31 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l180_c9_1e80_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l181_c3_a06a_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l181_c3_a06a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l181_c3_a06a_return_output : unsigned(32 downto 0);
 variable VAR_MUX_uxn_c_l182_c27_14eb_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l182_c27_14eb_iftrue : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l182_c27_14eb_iffalse : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l182_c27_ddea_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l182_c27_ddea_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l182_c27_ddea_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l182_c60_e1f3_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l182_c60_e1f3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l182_c60_e1f3_return_output : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l182_c27_14eb_return_output : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l185_c17_37df_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l185_c17_37df_iftrue : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l185_c17_37df_iffalse : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l185_c17_2531_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l185_c17_2531_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l185_c17_2531_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l185_c17_37df_return_output : unsigned(1 downto 0);
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_c_l167_l174_DUPLICATE_fcb1_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_c_l167_l174_DUPLICATE_fcb1_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l174_l167_DUPLICATE_62f0_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l174_l167_DUPLICATE_62f0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l174_l167_DUPLICATE_62f0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_6984_uxn_c_l188_l109_DUPLICATE_5bd3_return_output : gpu_step_result_t;
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
     VAR_BIN_OP_AND_uxn_c_l135_c27_9bdd_right := to_unsigned(262143, 18);
     VAR_MUX_uxn_c_l124_c26_191c_iftrue := resize(to_unsigned(0, 1), 32);
     VAR_BIN_OP_EQ_uxn_c_l148_c19_a4da_right := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l141_c13_772d_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_MUX_uxn_c_l126_c17_e5cb_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_DIV_uxn_c_l127_c6_11f5_right := to_unsigned(400, 9);
     VAR_MUX_uxn_c_l138_c13_24dd_iffalse := resize(to_unsigned(359, 9), 16);
     VAR_BIN_OP_GT_uxn_c_l124_c26_6a8b_right := to_unsigned(143999, 18);
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l128_c23_8844_right := to_unsigned(400, 9);
     VAR_BIN_OP_EQ_uxn_c_l178_c6_c111_right := to_unsigned(143999, 18);
     VAR_MUX_uxn_c_l182_c27_14eb_iftrue := resize(to_unsigned(0, 1), 32);
     VAR_MUX_uxn_c_l165_c37_66ba_iftrue := resize(to_unsigned(0, 1), 32);
     VAR_BIN_OP_DIV_uxn_c_l136_c13_1cd6_right := to_unsigned(400, 9);
     VAR_MUX_uxn_c_l148_c19_575e_iftrue := to_unsigned(0, 1);
     VAR_fill_pixels_remaining_uxn_c_l144_c3_d196 := resize(to_unsigned(143999, 18), 32);
     VAR_fill_pixels_remaining_MUX_uxn_c_l131_c2_973e_iftrue := VAR_fill_pixels_remaining_uxn_c_l144_c3_d196;
     VAR_MUX_uxn_c_l172_c37_0567_iftrue := resize(to_unsigned(0, 1), 32);
     VAR_BIN_OP_PLUS_uxn_c_l181_c3_a06a_right := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l131_c1_f61a_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l137_c38_d763_right := to_unsigned(400, 9);
     VAR_BIN_OP_EQ_uxn_c_l185_c17_2531_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l182_c27_ddea_right := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l126_c17_e5cb_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l148_c19_575e_iffalse := to_unsigned(1, 1);
     VAR_pixel_counter_uxn_c_l179_c3_c3eb := resize(to_unsigned(0, 1), 32);
     VAR_pixel_counter_MUX_uxn_c_l178_c2_e14c_iftrue := VAR_pixel_counter_uxn_c_l179_c3_c3eb;
     VAR_MUX_uxn_c_l140_c13_6184_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_BIN_OP_MINUS_uxn_c_l182_c60_e1f3_right := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l139_c13_c5f6_iffalse := resize(to_unsigned(399, 9), 16);
     VAR_BIN_OP_EQ_uxn_c_l126_c17_064d_right := to_unsigned(15, 4);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l131_c1_f61a_iftrue := VAR_CLOCK_ENABLE;
     VAR_bg_vram_update_uxn_c_l163_c19_498a_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_fg_vram_update_uxn_c_l170_c19_8db4_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_fill_color_MUX_uxn_c_l131_c2_973e_iffalse := fill_color;
     VAR_fill_layer_MUX_uxn_c_l131_c2_973e_iffalse := fill_layer;
     VAR_fill_pixels_remaining_MUX_uxn_c_l131_c2_973e_iffalse := fill_pixels_remaining;
     VAR_fill_x0_MUX_uxn_c_l131_c2_973e_iffalse := fill_x0;
     VAR_fill_x1_MUX_uxn_c_l131_c2_973e_iffalse := fill_x1;
     VAR_fill_y0_MUX_uxn_c_l131_c2_973e_iffalse := fill_y0;
     VAR_fill_y1_MUX_uxn_c_l131_c2_973e_iffalse := fill_y1;
     VAR_fill_pixels_remaining_MUX_uxn_c_l180_c9_1e80_cond := VAR_is_active_drawing_area;
     VAR_pixel_counter_MUX_uxn_c_l180_c9_1e80_cond := VAR_is_active_drawing_area;
     VAR_UNARY_OP_NOT_uxn_c_l131_c22_1cbb_expr := is_fill_active;
     VAR_is_fill_left_MUX_uxn_c_l131_c2_973e_iffalse := is_fill_left;
     VAR_is_fill_top_MUX_uxn_c_l131_c2_973e_iffalse := is_fill_top;
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l174_l167_DUPLICATE_62f0_right := VAR_is_vram_write;
     VAR_BIN_OP_DIV_uxn_c_l127_c6_11f5_left := pixel_counter;
     VAR_BIN_OP_EQ_uxn_c_l178_c6_c111_left := pixel_counter;
     VAR_BIN_OP_MINUS_uxn_c_l128_c6_421d_left := pixel_counter;
     VAR_BIN_OP_PLUS_uxn_c_l181_c3_a06a_left := pixel_counter;
     VAR_MUX_uxn_c_l165_c3_c8c1_iftrue := pixel_counter;
     VAR_MUX_uxn_c_l172_c3_d071_iftrue := pixel_counter;
     VAR_bg_vram_update_uxn_c_l163_c19_498a_read_address := pixel_counter;
     VAR_fg_vram_update_uxn_c_l170_c19_8db4_read_address := pixel_counter;
     VAR_pixel_counter_MUX_uxn_c_l180_c9_1e80_iffalse := pixel_counter;
     VAR_BIN_OP_AND_uxn_c_l135_c27_9bdd_left := VAR_vram_address;
     VAR_BIN_OP_GT_uxn_c_l124_c26_6a8b_left := VAR_vram_address;
     VAR_CONST_SR_20_uxn_c_l133_c18_3bfc_x := VAR_vram_address;
     VAR_CONST_SR_21_uxn_c_l134_c17_e011_x := VAR_vram_address;
     VAR_CONST_SR_28_uxn_c_l125_c24_c795_x := VAR_vram_address;
     VAR_MUX_uxn_c_l124_c26_191c_iffalse := VAR_vram_address;
     VAR_printf_uxn_c_l145_c3_22c2_uxn_c_l145_c3_22c2_arg6 := VAR_vram_address;
     VAR_MUX_uxn_c_l166_c3_4f32_iffalse := VAR_vram_value;
     VAR_MUX_uxn_c_l173_c3_60b3_iffalse := VAR_vram_value;
     VAR_fill_color_uxn_c_l143_c3_16a0 := VAR_vram_value;
     VAR_BIN_OP_AND_uxn_c_l174_c22_ada2_right := VAR_vram_write_layer;
     VAR_UNARY_OP_NOT_uxn_c_l167_c57_d7fe_expr := VAR_vram_write_layer;
     VAR_fill_layer_MUX_uxn_c_l131_c2_973e_iftrue := VAR_vram_write_layer;
     VAR_printf_uxn_c_l145_c3_22c2_uxn_c_l145_c3_22c2_arg4 := resize(VAR_vram_write_layer, 32);
     VAR_fill_color_MUX_uxn_c_l131_c2_973e_iftrue := VAR_fill_color_uxn_c_l143_c3_16a0;
     VAR_printf_uxn_c_l145_c3_22c2_uxn_c_l145_c3_22c2_arg5 := resize(VAR_fill_color_uxn_c_l143_c3_16a0, 32);
     -- BIN_OP_EQ[uxn_c_l178_c6_c111] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l178_c6_c111_left <= VAR_BIN_OP_EQ_uxn_c_l178_c6_c111_left;
     BIN_OP_EQ_uxn_c_l178_c6_c111_right <= VAR_BIN_OP_EQ_uxn_c_l178_c6_c111_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l178_c6_c111_return_output := BIN_OP_EQ_uxn_c_l178_c6_c111_return_output;

     -- CONST_SR_21[uxn_c_l134_c17_e011] LATENCY=0
     -- Inputs
     CONST_SR_21_uxn_c_l134_c17_e011_x <= VAR_CONST_SR_21_uxn_c_l134_c17_e011_x;
     -- Outputs
     VAR_CONST_SR_21_uxn_c_l134_c17_e011_return_output := CONST_SR_21_uxn_c_l134_c17_e011_return_output;

     -- BIN_OP_PLUS[uxn_c_l181_c3_a06a] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l181_c3_a06a_left <= VAR_BIN_OP_PLUS_uxn_c_l181_c3_a06a_left;
     BIN_OP_PLUS_uxn_c_l181_c3_a06a_right <= VAR_BIN_OP_PLUS_uxn_c_l181_c3_a06a_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l181_c3_a06a_return_output := BIN_OP_PLUS_uxn_c_l181_c3_a06a_return_output;

     -- UNARY_OP_NOT[uxn_c_l131_c22_1cbb] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l131_c22_1cbb_expr <= VAR_UNARY_OP_NOT_uxn_c_l131_c22_1cbb_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l131_c22_1cbb_return_output := UNARY_OP_NOT_uxn_c_l131_c22_1cbb_return_output;

     -- BIN_OP_AND[uxn_c_l135_c27_9bdd] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l135_c27_9bdd_left <= VAR_BIN_OP_AND_uxn_c_l135_c27_9bdd_left;
     BIN_OP_AND_uxn_c_l135_c27_9bdd_right <= VAR_BIN_OP_AND_uxn_c_l135_c27_9bdd_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l135_c27_9bdd_return_output := BIN_OP_AND_uxn_c_l135_c27_9bdd_return_output;

     -- BIN_OP_GT[uxn_c_l124_c26_6a8b] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_c_l124_c26_6a8b_left <= VAR_BIN_OP_GT_uxn_c_l124_c26_6a8b_left;
     BIN_OP_GT_uxn_c_l124_c26_6a8b_right <= VAR_BIN_OP_GT_uxn_c_l124_c26_6a8b_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_c_l124_c26_6a8b_return_output := BIN_OP_GT_uxn_c_l124_c26_6a8b_return_output;

     -- CONST_SR_28[uxn_c_l125_c24_c795] LATENCY=0
     -- Inputs
     CONST_SR_28_uxn_c_l125_c24_c795_x <= VAR_CONST_SR_28_uxn_c_l125_c24_c795_x;
     -- Outputs
     VAR_CONST_SR_28_uxn_c_l125_c24_c795_return_output := CONST_SR_28_uxn_c_l125_c24_c795_return_output;

     -- BIN_OP_DIV[uxn_c_l127_c6_11f5] LATENCY=0
     -- Inputs
     BIN_OP_DIV_uxn_c_l127_c6_11f5_left <= VAR_BIN_OP_DIV_uxn_c_l127_c6_11f5_left;
     BIN_OP_DIV_uxn_c_l127_c6_11f5_right <= VAR_BIN_OP_DIV_uxn_c_l127_c6_11f5_right;
     -- Outputs
     VAR_BIN_OP_DIV_uxn_c_l127_c6_11f5_return_output := BIN_OP_DIV_uxn_c_l127_c6_11f5_return_output;

     -- UNARY_OP_NOT[uxn_c_l167_c57_d7fe] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l167_c57_d7fe_expr <= VAR_UNARY_OP_NOT_uxn_c_l167_c57_d7fe_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l167_c57_d7fe_return_output := UNARY_OP_NOT_uxn_c_l167_c57_d7fe_return_output;

     -- CONST_SR_20[uxn_c_l133_c18_3bfc] LATENCY=0
     -- Inputs
     CONST_SR_20_uxn_c_l133_c18_3bfc_x <= VAR_CONST_SR_20_uxn_c_l133_c18_3bfc_x;
     -- Outputs
     VAR_CONST_SR_20_uxn_c_l133_c18_3bfc_return_output := CONST_SR_20_uxn_c_l133_c18_3bfc_return_output;

     -- Submodule level 1
     VAR_BIN_OP_DIV_uxn_c_l136_c13_1cd6_left := VAR_BIN_OP_AND_uxn_c_l135_c27_9bdd_return_output;
     VAR_BIN_OP_MINUS_uxn_c_l137_c13_622e_left := VAR_BIN_OP_AND_uxn_c_l135_c27_9bdd_return_output;
     VAR_y_uxn_c_l127_c2_b301 := resize(VAR_BIN_OP_DIV_uxn_c_l127_c6_11f5_return_output, 16);
     VAR_fill_pixels_remaining_MUX_uxn_c_l178_c2_e14c_cond := VAR_BIN_OP_EQ_uxn_c_l178_c6_c111_return_output;
     VAR_pixel_counter_MUX_uxn_c_l178_c2_e14c_cond := VAR_BIN_OP_EQ_uxn_c_l178_c6_c111_return_output;
     VAR_MUX_uxn_c_l124_c26_191c_cond := VAR_BIN_OP_GT_uxn_c_l124_c26_6a8b_return_output;
     VAR_pixel_counter_uxn_c_l181_c3_e8b4 := resize(VAR_BIN_OP_PLUS_uxn_c_l181_c3_a06a_return_output, 32);
     VAR_is_fill_left_uxn_c_l133_c3_b6fa := resize(VAR_CONST_SR_20_uxn_c_l133_c18_3bfc_return_output, 1);
     VAR_is_fill_top_uxn_c_l134_c3_8480 := resize(VAR_CONST_SR_21_uxn_c_l134_c17_e011_return_output, 1);
     VAR_BIN_OP_AND_uxn_c_l131_c6_da9e_right := VAR_UNARY_OP_NOT_uxn_c_l131_c22_1cbb_return_output;
     VAR_BIN_OP_AND_uxn_c_l167_c22_edef_right := VAR_UNARY_OP_NOT_uxn_c_l167_c57_d7fe_return_output;
     VAR_MUX_uxn_c_l139_c13_c5f6_cond := VAR_is_fill_left_uxn_c_l133_c3_b6fa;
     VAR_MUX_uxn_c_l141_c13_772d_cond := VAR_is_fill_left_uxn_c_l133_c3_b6fa;
     VAR_is_fill_left_MUX_uxn_c_l131_c2_973e_iftrue := VAR_is_fill_left_uxn_c_l133_c3_b6fa;
     VAR_printf_uxn_c_l145_c3_22c2_uxn_c_l145_c3_22c2_arg7 := resize(VAR_is_fill_left_uxn_c_l133_c3_b6fa, 32);
     VAR_MUX_uxn_c_l138_c13_24dd_cond := VAR_is_fill_top_uxn_c_l134_c3_8480;
     VAR_MUX_uxn_c_l140_c13_6184_cond := VAR_is_fill_top_uxn_c_l134_c3_8480;
     VAR_is_fill_top_MUX_uxn_c_l131_c2_973e_iftrue := VAR_is_fill_top_uxn_c_l134_c3_8480;
     VAR_printf_uxn_c_l145_c3_22c2_uxn_c_l145_c3_22c2_arg8 := resize(VAR_is_fill_top_uxn_c_l134_c3_8480, 32);
     VAR_pixel_counter_MUX_uxn_c_l180_c9_1e80_iftrue := VAR_pixel_counter_uxn_c_l181_c3_e8b4;
     VAR_BIN_OP_GT_uxn_c_l152_c17_06fa_left := VAR_y_uxn_c_l127_c2_b301;
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l128_c23_8844_left := VAR_y_uxn_c_l127_c2_b301;
     VAR_BIN_OP_LT_uxn_c_l153_c17_1b15_left := VAR_y_uxn_c_l127_c2_b301;
     REG_VAR_y := VAR_y_uxn_c_l127_c2_b301;
     -- CAST_TO_uint4_t[uxn_c_l125_c14_e882] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_c_l125_c14_e882_return_output := CAST_TO_uint4_t_uint32_t(
     VAR_CONST_SR_28_uxn_c_l125_c24_c795_return_output);

     -- MUX[uxn_c_l124_c26_191c] LATENCY=0
     -- Inputs
     MUX_uxn_c_l124_c26_191c_cond <= VAR_MUX_uxn_c_l124_c26_191c_cond;
     MUX_uxn_c_l124_c26_191c_iftrue <= VAR_MUX_uxn_c_l124_c26_191c_iftrue;
     MUX_uxn_c_l124_c26_191c_iffalse <= VAR_MUX_uxn_c_l124_c26_191c_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l124_c26_191c_return_output := MUX_uxn_c_l124_c26_191c_return_output;

     -- pixel_counter_MUX[uxn_c_l180_c9_1e80] LATENCY=0
     -- Inputs
     pixel_counter_MUX_uxn_c_l180_c9_1e80_cond <= VAR_pixel_counter_MUX_uxn_c_l180_c9_1e80_cond;
     pixel_counter_MUX_uxn_c_l180_c9_1e80_iftrue <= VAR_pixel_counter_MUX_uxn_c_l180_c9_1e80_iftrue;
     pixel_counter_MUX_uxn_c_l180_c9_1e80_iffalse <= VAR_pixel_counter_MUX_uxn_c_l180_c9_1e80_iffalse;
     -- Outputs
     VAR_pixel_counter_MUX_uxn_c_l180_c9_1e80_return_output := pixel_counter_MUX_uxn_c_l180_c9_1e80_return_output;

     -- BIN_OP_DIV[uxn_c_l136_c13_1cd6] LATENCY=0
     -- Inputs
     BIN_OP_DIV_uxn_c_l136_c13_1cd6_left <= VAR_BIN_OP_DIV_uxn_c_l136_c13_1cd6_left;
     BIN_OP_DIV_uxn_c_l136_c13_1cd6_right <= VAR_BIN_OP_DIV_uxn_c_l136_c13_1cd6_right;
     -- Outputs
     VAR_BIN_OP_DIV_uxn_c_l136_c13_1cd6_return_output := BIN_OP_DIV_uxn_c_l136_c13_1cd6_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_c_l128_c23_8844] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_c_l128_c23_8844_left <= VAR_BIN_OP_INFERRED_MULT_uxn_c_l128_c23_8844_left;
     BIN_OP_INFERRED_MULT_uxn_c_l128_c23_8844_right <= VAR_BIN_OP_INFERRED_MULT_uxn_c_l128_c23_8844_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l128_c23_8844_return_output := BIN_OP_INFERRED_MULT_uxn_c_l128_c23_8844_return_output;

     -- Submodule level 2
     VAR_fill_y0_uxn_c_l136_c3_e04a := resize(VAR_BIN_OP_DIV_uxn_c_l136_c13_1cd6_return_output, 16);
     VAR_BIN_OP_MINUS_uxn_c_l128_c6_421d_right := VAR_BIN_OP_INFERRED_MULT_uxn_c_l128_c23_8844_return_output;
     VAR_BIN_OP_EQ_uxn_c_l126_c17_064d_left := VAR_CAST_TO_uint4_t_uxn_c_l125_c14_e882_return_output;
     REG_VAR_vram_code := VAR_CAST_TO_uint4_t_uxn_c_l125_c14_e882_return_output;
     VAR_MUX_uxn_c_l165_c37_66ba_iffalse := VAR_MUX_uxn_c_l124_c26_191c_return_output;
     VAR_MUX_uxn_c_l172_c37_0567_iffalse := VAR_MUX_uxn_c_l124_c26_191c_return_output;
     REG_VAR_adjusted_vram_address := VAR_MUX_uxn_c_l124_c26_191c_return_output;
     VAR_pixel_counter_MUX_uxn_c_l178_c2_e14c_iffalse := VAR_pixel_counter_MUX_uxn_c_l180_c9_1e80_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l137_c38_d763_left := VAR_fill_y0_uxn_c_l136_c3_e04a;
     VAR_MUX_uxn_c_l138_c13_24dd_iftrue := VAR_fill_y0_uxn_c_l136_c3_e04a;
     VAR_MUX_uxn_c_l140_c13_6184_iffalse := VAR_fill_y0_uxn_c_l136_c3_e04a;
     -- MUX[uxn_c_l140_c13_6184] LATENCY=0
     -- Inputs
     MUX_uxn_c_l140_c13_6184_cond <= VAR_MUX_uxn_c_l140_c13_6184_cond;
     MUX_uxn_c_l140_c13_6184_iftrue <= VAR_MUX_uxn_c_l140_c13_6184_iftrue;
     MUX_uxn_c_l140_c13_6184_iffalse <= VAR_MUX_uxn_c_l140_c13_6184_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l140_c13_6184_return_output := MUX_uxn_c_l140_c13_6184_return_output;

     -- BIN_OP_EQ[uxn_c_l126_c17_064d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l126_c17_064d_left <= VAR_BIN_OP_EQ_uxn_c_l126_c17_064d_left;
     BIN_OP_EQ_uxn_c_l126_c17_064d_right <= VAR_BIN_OP_EQ_uxn_c_l126_c17_064d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l126_c17_064d_return_output := BIN_OP_EQ_uxn_c_l126_c17_064d_return_output;

     -- MUX[uxn_c_l138_c13_24dd] LATENCY=0
     -- Inputs
     MUX_uxn_c_l138_c13_24dd_cond <= VAR_MUX_uxn_c_l138_c13_24dd_cond;
     MUX_uxn_c_l138_c13_24dd_iftrue <= VAR_MUX_uxn_c_l138_c13_24dd_iftrue;
     MUX_uxn_c_l138_c13_24dd_iffalse <= VAR_MUX_uxn_c_l138_c13_24dd_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l138_c13_24dd_return_output := MUX_uxn_c_l138_c13_24dd_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_c_l137_c38_d763] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_c_l137_c38_d763_left <= VAR_BIN_OP_INFERRED_MULT_uxn_c_l137_c38_d763_left;
     BIN_OP_INFERRED_MULT_uxn_c_l137_c38_d763_right <= VAR_BIN_OP_INFERRED_MULT_uxn_c_l137_c38_d763_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l137_c38_d763_return_output := BIN_OP_INFERRED_MULT_uxn_c_l137_c38_d763_return_output;

     -- pixel_counter_MUX[uxn_c_l178_c2_e14c] LATENCY=0
     -- Inputs
     pixel_counter_MUX_uxn_c_l178_c2_e14c_cond <= VAR_pixel_counter_MUX_uxn_c_l178_c2_e14c_cond;
     pixel_counter_MUX_uxn_c_l178_c2_e14c_iftrue <= VAR_pixel_counter_MUX_uxn_c_l178_c2_e14c_iftrue;
     pixel_counter_MUX_uxn_c_l178_c2_e14c_iffalse <= VAR_pixel_counter_MUX_uxn_c_l178_c2_e14c_iffalse;
     -- Outputs
     VAR_pixel_counter_MUX_uxn_c_l178_c2_e14c_return_output := pixel_counter_MUX_uxn_c_l178_c2_e14c_return_output;

     -- BIN_OP_MINUS[uxn_c_l128_c6_421d] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l128_c6_421d_left <= VAR_BIN_OP_MINUS_uxn_c_l128_c6_421d_left;
     BIN_OP_MINUS_uxn_c_l128_c6_421d_right <= VAR_BIN_OP_MINUS_uxn_c_l128_c6_421d_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l128_c6_421d_return_output := BIN_OP_MINUS_uxn_c_l128_c6_421d_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_c_l126_c17_e5cb_cond := VAR_BIN_OP_EQ_uxn_c_l126_c17_064d_return_output;
     VAR_BIN_OP_MINUS_uxn_c_l137_c13_622e_right := VAR_BIN_OP_INFERRED_MULT_uxn_c_l137_c38_d763_return_output;
     VAR_x_uxn_c_l128_c2_a60b := resize(VAR_BIN_OP_MINUS_uxn_c_l128_c6_421d_return_output, 16);
     VAR_fill_y1_uxn_c_l138_c3_b520 := VAR_MUX_uxn_c_l138_c13_24dd_return_output;
     VAR_fill_y0_uxn_c_l140_c3_2309 := VAR_MUX_uxn_c_l140_c13_6184_return_output;
     REG_VAR_pixel_counter := VAR_pixel_counter_MUX_uxn_c_l178_c2_e14c_return_output;
     VAR_fill_y0_MUX_uxn_c_l131_c2_973e_iftrue := VAR_fill_y0_uxn_c_l140_c3_2309;
     VAR_printf_uxn_c_l145_c3_22c2_uxn_c_l145_c3_22c2_arg1 := resize(VAR_fill_y0_uxn_c_l140_c3_2309, 32);
     VAR_fill_y1_MUX_uxn_c_l131_c2_973e_iftrue := VAR_fill_y1_uxn_c_l138_c3_b520;
     VAR_printf_uxn_c_l145_c3_22c2_uxn_c_l145_c3_22c2_arg3 := resize(VAR_fill_y1_uxn_c_l138_c3_b520, 32);
     VAR_BIN_OP_GT_uxn_c_l150_c17_4e77_left := VAR_x_uxn_c_l128_c2_a60b;
     VAR_BIN_OP_LT_uxn_c_l151_c17_2f5b_left := VAR_x_uxn_c_l128_c2_a60b;
     REG_VAR_x := VAR_x_uxn_c_l128_c2_a60b;
     -- MUX[uxn_c_l126_c17_e5cb] LATENCY=0
     -- Inputs
     MUX_uxn_c_l126_c17_e5cb_cond <= VAR_MUX_uxn_c_l126_c17_e5cb_cond;
     MUX_uxn_c_l126_c17_e5cb_iftrue <= VAR_MUX_uxn_c_l126_c17_e5cb_iftrue;
     MUX_uxn_c_l126_c17_e5cb_iffalse <= VAR_MUX_uxn_c_l126_c17_e5cb_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l126_c17_e5cb_return_output := MUX_uxn_c_l126_c17_e5cb_return_output;

     -- BIN_OP_MINUS[uxn_c_l137_c13_622e] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l137_c13_622e_left <= VAR_BIN_OP_MINUS_uxn_c_l137_c13_622e_left;
     BIN_OP_MINUS_uxn_c_l137_c13_622e_right <= VAR_BIN_OP_MINUS_uxn_c_l137_c13_622e_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l137_c13_622e_return_output := BIN_OP_MINUS_uxn_c_l137_c13_622e_return_output;

     -- Submodule level 4
     VAR_fill_x0_uxn_c_l137_c3_5ba7 := resize(VAR_BIN_OP_MINUS_uxn_c_l137_c13_622e_return_output, 16);
     VAR_BIN_OP_AND_uxn_c_l131_c6_da9e_left := VAR_MUX_uxn_c_l126_c17_e5cb_return_output;
     REG_VAR_is_fill_code := VAR_MUX_uxn_c_l126_c17_e5cb_return_output;
     VAR_MUX_uxn_c_l139_c13_c5f6_iftrue := VAR_fill_x0_uxn_c_l137_c3_5ba7;
     VAR_MUX_uxn_c_l141_c13_772d_iffalse := VAR_fill_x0_uxn_c_l137_c3_5ba7;
     -- MUX[uxn_c_l141_c13_772d] LATENCY=0
     -- Inputs
     MUX_uxn_c_l141_c13_772d_cond <= VAR_MUX_uxn_c_l141_c13_772d_cond;
     MUX_uxn_c_l141_c13_772d_iftrue <= VAR_MUX_uxn_c_l141_c13_772d_iftrue;
     MUX_uxn_c_l141_c13_772d_iffalse <= VAR_MUX_uxn_c_l141_c13_772d_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l141_c13_772d_return_output := MUX_uxn_c_l141_c13_772d_return_output;

     -- BIN_OP_AND[uxn_c_l131_c6_da9e] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l131_c6_da9e_left <= VAR_BIN_OP_AND_uxn_c_l131_c6_da9e_left;
     BIN_OP_AND_uxn_c_l131_c6_da9e_right <= VAR_BIN_OP_AND_uxn_c_l131_c6_da9e_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l131_c6_da9e_return_output := BIN_OP_AND_uxn_c_l131_c6_da9e_return_output;

     -- MUX[uxn_c_l139_c13_c5f6] LATENCY=0
     -- Inputs
     MUX_uxn_c_l139_c13_c5f6_cond <= VAR_MUX_uxn_c_l139_c13_c5f6_cond;
     MUX_uxn_c_l139_c13_c5f6_iftrue <= VAR_MUX_uxn_c_l139_c13_c5f6_iftrue;
     MUX_uxn_c_l139_c13_c5f6_iffalse <= VAR_MUX_uxn_c_l139_c13_c5f6_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l139_c13_c5f6_return_output := MUX_uxn_c_l139_c13_c5f6_return_output;

     -- Submodule level 5
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l131_c1_f61a_cond := VAR_BIN_OP_AND_uxn_c_l131_c6_da9e_return_output;
     VAR_fill_color_MUX_uxn_c_l131_c2_973e_cond := VAR_BIN_OP_AND_uxn_c_l131_c6_da9e_return_output;
     VAR_fill_layer_MUX_uxn_c_l131_c2_973e_cond := VAR_BIN_OP_AND_uxn_c_l131_c6_da9e_return_output;
     VAR_fill_pixels_remaining_MUX_uxn_c_l131_c2_973e_cond := VAR_BIN_OP_AND_uxn_c_l131_c6_da9e_return_output;
     VAR_fill_x0_MUX_uxn_c_l131_c2_973e_cond := VAR_BIN_OP_AND_uxn_c_l131_c6_da9e_return_output;
     VAR_fill_x1_MUX_uxn_c_l131_c2_973e_cond := VAR_BIN_OP_AND_uxn_c_l131_c6_da9e_return_output;
     VAR_fill_y0_MUX_uxn_c_l131_c2_973e_cond := VAR_BIN_OP_AND_uxn_c_l131_c6_da9e_return_output;
     VAR_fill_y1_MUX_uxn_c_l131_c2_973e_cond := VAR_BIN_OP_AND_uxn_c_l131_c6_da9e_return_output;
     VAR_is_fill_left_MUX_uxn_c_l131_c2_973e_cond := VAR_BIN_OP_AND_uxn_c_l131_c6_da9e_return_output;
     VAR_is_fill_top_MUX_uxn_c_l131_c2_973e_cond := VAR_BIN_OP_AND_uxn_c_l131_c6_da9e_return_output;
     VAR_fill_x1_uxn_c_l139_c3_a4dc := VAR_MUX_uxn_c_l139_c13_c5f6_return_output;
     VAR_fill_x0_uxn_c_l141_c3_fef9 := VAR_MUX_uxn_c_l141_c13_772d_return_output;
     VAR_fill_x0_MUX_uxn_c_l131_c2_973e_iftrue := VAR_fill_x0_uxn_c_l141_c3_fef9;
     VAR_printf_uxn_c_l145_c3_22c2_uxn_c_l145_c3_22c2_arg0 := resize(VAR_fill_x0_uxn_c_l141_c3_fef9, 32);
     VAR_fill_x1_MUX_uxn_c_l131_c2_973e_iftrue := VAR_fill_x1_uxn_c_l139_c3_a4dc;
     VAR_printf_uxn_c_l145_c3_22c2_uxn_c_l145_c3_22c2_arg2 := resize(VAR_fill_x1_uxn_c_l139_c3_a4dc, 32);
     -- fill_y1_MUX[uxn_c_l131_c2_973e] LATENCY=0
     -- Inputs
     fill_y1_MUX_uxn_c_l131_c2_973e_cond <= VAR_fill_y1_MUX_uxn_c_l131_c2_973e_cond;
     fill_y1_MUX_uxn_c_l131_c2_973e_iftrue <= VAR_fill_y1_MUX_uxn_c_l131_c2_973e_iftrue;
     fill_y1_MUX_uxn_c_l131_c2_973e_iffalse <= VAR_fill_y1_MUX_uxn_c_l131_c2_973e_iffalse;
     -- Outputs
     VAR_fill_y1_MUX_uxn_c_l131_c2_973e_return_output := fill_y1_MUX_uxn_c_l131_c2_973e_return_output;

     -- fill_x0_MUX[uxn_c_l131_c2_973e] LATENCY=0
     -- Inputs
     fill_x0_MUX_uxn_c_l131_c2_973e_cond <= VAR_fill_x0_MUX_uxn_c_l131_c2_973e_cond;
     fill_x0_MUX_uxn_c_l131_c2_973e_iftrue <= VAR_fill_x0_MUX_uxn_c_l131_c2_973e_iftrue;
     fill_x0_MUX_uxn_c_l131_c2_973e_iffalse <= VAR_fill_x0_MUX_uxn_c_l131_c2_973e_iffalse;
     -- Outputs
     VAR_fill_x0_MUX_uxn_c_l131_c2_973e_return_output := fill_x0_MUX_uxn_c_l131_c2_973e_return_output;

     -- fill_pixels_remaining_MUX[uxn_c_l131_c2_973e] LATENCY=0
     -- Inputs
     fill_pixels_remaining_MUX_uxn_c_l131_c2_973e_cond <= VAR_fill_pixels_remaining_MUX_uxn_c_l131_c2_973e_cond;
     fill_pixels_remaining_MUX_uxn_c_l131_c2_973e_iftrue <= VAR_fill_pixels_remaining_MUX_uxn_c_l131_c2_973e_iftrue;
     fill_pixels_remaining_MUX_uxn_c_l131_c2_973e_iffalse <= VAR_fill_pixels_remaining_MUX_uxn_c_l131_c2_973e_iffalse;
     -- Outputs
     VAR_fill_pixels_remaining_MUX_uxn_c_l131_c2_973e_return_output := fill_pixels_remaining_MUX_uxn_c_l131_c2_973e_return_output;

     -- fill_color_MUX[uxn_c_l131_c2_973e] LATENCY=0
     -- Inputs
     fill_color_MUX_uxn_c_l131_c2_973e_cond <= VAR_fill_color_MUX_uxn_c_l131_c2_973e_cond;
     fill_color_MUX_uxn_c_l131_c2_973e_iftrue <= VAR_fill_color_MUX_uxn_c_l131_c2_973e_iftrue;
     fill_color_MUX_uxn_c_l131_c2_973e_iffalse <= VAR_fill_color_MUX_uxn_c_l131_c2_973e_iffalse;
     -- Outputs
     VAR_fill_color_MUX_uxn_c_l131_c2_973e_return_output := fill_color_MUX_uxn_c_l131_c2_973e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l131_c1_f61a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l131_c1_f61a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l131_c1_f61a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l131_c1_f61a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l131_c1_f61a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l131_c1_f61a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l131_c1_f61a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l131_c1_f61a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l131_c1_f61a_return_output;

     -- fill_x1_MUX[uxn_c_l131_c2_973e] LATENCY=0
     -- Inputs
     fill_x1_MUX_uxn_c_l131_c2_973e_cond <= VAR_fill_x1_MUX_uxn_c_l131_c2_973e_cond;
     fill_x1_MUX_uxn_c_l131_c2_973e_iftrue <= VAR_fill_x1_MUX_uxn_c_l131_c2_973e_iftrue;
     fill_x1_MUX_uxn_c_l131_c2_973e_iffalse <= VAR_fill_x1_MUX_uxn_c_l131_c2_973e_iffalse;
     -- Outputs
     VAR_fill_x1_MUX_uxn_c_l131_c2_973e_return_output := fill_x1_MUX_uxn_c_l131_c2_973e_return_output;

     -- is_fill_top_MUX[uxn_c_l131_c2_973e] LATENCY=0
     -- Inputs
     is_fill_top_MUX_uxn_c_l131_c2_973e_cond <= VAR_is_fill_top_MUX_uxn_c_l131_c2_973e_cond;
     is_fill_top_MUX_uxn_c_l131_c2_973e_iftrue <= VAR_is_fill_top_MUX_uxn_c_l131_c2_973e_iftrue;
     is_fill_top_MUX_uxn_c_l131_c2_973e_iffalse <= VAR_is_fill_top_MUX_uxn_c_l131_c2_973e_iffalse;
     -- Outputs
     VAR_is_fill_top_MUX_uxn_c_l131_c2_973e_return_output := is_fill_top_MUX_uxn_c_l131_c2_973e_return_output;

     -- fill_y0_MUX[uxn_c_l131_c2_973e] LATENCY=0
     -- Inputs
     fill_y0_MUX_uxn_c_l131_c2_973e_cond <= VAR_fill_y0_MUX_uxn_c_l131_c2_973e_cond;
     fill_y0_MUX_uxn_c_l131_c2_973e_iftrue <= VAR_fill_y0_MUX_uxn_c_l131_c2_973e_iftrue;
     fill_y0_MUX_uxn_c_l131_c2_973e_iffalse <= VAR_fill_y0_MUX_uxn_c_l131_c2_973e_iffalse;
     -- Outputs
     VAR_fill_y0_MUX_uxn_c_l131_c2_973e_return_output := fill_y0_MUX_uxn_c_l131_c2_973e_return_output;

     -- is_fill_left_MUX[uxn_c_l131_c2_973e] LATENCY=0
     -- Inputs
     is_fill_left_MUX_uxn_c_l131_c2_973e_cond <= VAR_is_fill_left_MUX_uxn_c_l131_c2_973e_cond;
     is_fill_left_MUX_uxn_c_l131_c2_973e_iftrue <= VAR_is_fill_left_MUX_uxn_c_l131_c2_973e_iftrue;
     is_fill_left_MUX_uxn_c_l131_c2_973e_iffalse <= VAR_is_fill_left_MUX_uxn_c_l131_c2_973e_iffalse;
     -- Outputs
     VAR_is_fill_left_MUX_uxn_c_l131_c2_973e_return_output := is_fill_left_MUX_uxn_c_l131_c2_973e_return_output;

     -- fill_layer_MUX[uxn_c_l131_c2_973e] LATENCY=0
     -- Inputs
     fill_layer_MUX_uxn_c_l131_c2_973e_cond <= VAR_fill_layer_MUX_uxn_c_l131_c2_973e_cond;
     fill_layer_MUX_uxn_c_l131_c2_973e_iftrue <= VAR_fill_layer_MUX_uxn_c_l131_c2_973e_iftrue;
     fill_layer_MUX_uxn_c_l131_c2_973e_iffalse <= VAR_fill_layer_MUX_uxn_c_l131_c2_973e_iffalse;
     -- Outputs
     VAR_fill_layer_MUX_uxn_c_l131_c2_973e_return_output := fill_layer_MUX_uxn_c_l131_c2_973e_return_output;

     -- Submodule level 6
     VAR_printf_uxn_c_l145_c3_22c2_uxn_c_l145_c3_22c2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l131_c1_f61a_return_output;
     VAR_MUX_uxn_c_l166_c3_4f32_iftrue := VAR_fill_color_MUX_uxn_c_l131_c2_973e_return_output;
     VAR_MUX_uxn_c_l173_c3_60b3_iftrue := VAR_fill_color_MUX_uxn_c_l131_c2_973e_return_output;
     REG_VAR_fill_color := VAR_fill_color_MUX_uxn_c_l131_c2_973e_return_output;
     VAR_BIN_OP_AND_uxn_c_l157_c19_a93e_right := VAR_fill_layer_MUX_uxn_c_l131_c2_973e_return_output;
     VAR_UNARY_OP_NOT_uxn_c_l156_c37_99d5_expr := VAR_fill_layer_MUX_uxn_c_l131_c2_973e_return_output;
     REG_VAR_fill_layer := VAR_fill_layer_MUX_uxn_c_l131_c2_973e_return_output;
     VAR_BIN_OP_EQ_uxn_c_l148_c19_a4da_left := VAR_fill_pixels_remaining_MUX_uxn_c_l131_c2_973e_return_output;
     VAR_BIN_OP_EQ_uxn_c_l182_c27_ddea_left := VAR_fill_pixels_remaining_MUX_uxn_c_l131_c2_973e_return_output;
     VAR_BIN_OP_MINUS_uxn_c_l182_c60_e1f3_left := VAR_fill_pixels_remaining_MUX_uxn_c_l131_c2_973e_return_output;
     VAR_fill_pixels_remaining_MUX_uxn_c_l178_c2_e14c_iftrue := VAR_fill_pixels_remaining_MUX_uxn_c_l131_c2_973e_return_output;
     VAR_fill_pixels_remaining_MUX_uxn_c_l180_c9_1e80_iffalse := VAR_fill_pixels_remaining_MUX_uxn_c_l131_c2_973e_return_output;
     VAR_BIN_OP_GT_uxn_c_l150_c17_4e77_right := VAR_fill_x0_MUX_uxn_c_l131_c2_973e_return_output;
     REG_VAR_fill_x0 := VAR_fill_x0_MUX_uxn_c_l131_c2_973e_return_output;
     VAR_BIN_OP_LT_uxn_c_l151_c17_2f5b_right := VAR_fill_x1_MUX_uxn_c_l131_c2_973e_return_output;
     REG_VAR_fill_x1 := VAR_fill_x1_MUX_uxn_c_l131_c2_973e_return_output;
     VAR_BIN_OP_GT_uxn_c_l152_c17_06fa_right := VAR_fill_y0_MUX_uxn_c_l131_c2_973e_return_output;
     REG_VAR_fill_y0 := VAR_fill_y0_MUX_uxn_c_l131_c2_973e_return_output;
     VAR_BIN_OP_LT_uxn_c_l153_c17_1b15_right := VAR_fill_y1_MUX_uxn_c_l131_c2_973e_return_output;
     REG_VAR_fill_y1 := VAR_fill_y1_MUX_uxn_c_l131_c2_973e_return_output;
     REG_VAR_is_fill_left := VAR_is_fill_left_MUX_uxn_c_l131_c2_973e_return_output;
     REG_VAR_is_fill_top := VAR_is_fill_top_MUX_uxn_c_l131_c2_973e_return_output;
     -- printf_uxn_c_l145_c3_22c2[uxn_c_l145_c3_22c2] LATENCY=0
     -- Clock enable
     printf_uxn_c_l145_c3_22c2_uxn_c_l145_c3_22c2_CLOCK_ENABLE <= VAR_printf_uxn_c_l145_c3_22c2_uxn_c_l145_c3_22c2_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_c_l145_c3_22c2_uxn_c_l145_c3_22c2_arg0 <= VAR_printf_uxn_c_l145_c3_22c2_uxn_c_l145_c3_22c2_arg0;
     printf_uxn_c_l145_c3_22c2_uxn_c_l145_c3_22c2_arg1 <= VAR_printf_uxn_c_l145_c3_22c2_uxn_c_l145_c3_22c2_arg1;
     printf_uxn_c_l145_c3_22c2_uxn_c_l145_c3_22c2_arg2 <= VAR_printf_uxn_c_l145_c3_22c2_uxn_c_l145_c3_22c2_arg2;
     printf_uxn_c_l145_c3_22c2_uxn_c_l145_c3_22c2_arg3 <= VAR_printf_uxn_c_l145_c3_22c2_uxn_c_l145_c3_22c2_arg3;
     printf_uxn_c_l145_c3_22c2_uxn_c_l145_c3_22c2_arg4 <= VAR_printf_uxn_c_l145_c3_22c2_uxn_c_l145_c3_22c2_arg4;
     printf_uxn_c_l145_c3_22c2_uxn_c_l145_c3_22c2_arg5 <= VAR_printf_uxn_c_l145_c3_22c2_uxn_c_l145_c3_22c2_arg5;
     printf_uxn_c_l145_c3_22c2_uxn_c_l145_c3_22c2_arg6 <= VAR_printf_uxn_c_l145_c3_22c2_uxn_c_l145_c3_22c2_arg6;
     printf_uxn_c_l145_c3_22c2_uxn_c_l145_c3_22c2_arg7 <= VAR_printf_uxn_c_l145_c3_22c2_uxn_c_l145_c3_22c2_arg7;
     printf_uxn_c_l145_c3_22c2_uxn_c_l145_c3_22c2_arg8 <= VAR_printf_uxn_c_l145_c3_22c2_uxn_c_l145_c3_22c2_arg8;
     -- Outputs

     -- BIN_OP_MINUS[uxn_c_l182_c60_e1f3] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l182_c60_e1f3_left <= VAR_BIN_OP_MINUS_uxn_c_l182_c60_e1f3_left;
     BIN_OP_MINUS_uxn_c_l182_c60_e1f3_right <= VAR_BIN_OP_MINUS_uxn_c_l182_c60_e1f3_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l182_c60_e1f3_return_output := BIN_OP_MINUS_uxn_c_l182_c60_e1f3_return_output;

     -- BIN_OP_LT[uxn_c_l151_c17_2f5b] LATENCY=0
     -- Inputs
     BIN_OP_LT_uxn_c_l151_c17_2f5b_left <= VAR_BIN_OP_LT_uxn_c_l151_c17_2f5b_left;
     BIN_OP_LT_uxn_c_l151_c17_2f5b_right <= VAR_BIN_OP_LT_uxn_c_l151_c17_2f5b_right;
     -- Outputs
     VAR_BIN_OP_LT_uxn_c_l151_c17_2f5b_return_output := BIN_OP_LT_uxn_c_l151_c17_2f5b_return_output;

     -- BIN_OP_EQ[uxn_c_l182_c27_ddea] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l182_c27_ddea_left <= VAR_BIN_OP_EQ_uxn_c_l182_c27_ddea_left;
     BIN_OP_EQ_uxn_c_l182_c27_ddea_right <= VAR_BIN_OP_EQ_uxn_c_l182_c27_ddea_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l182_c27_ddea_return_output := BIN_OP_EQ_uxn_c_l182_c27_ddea_return_output;

     -- BIN_OP_GT[uxn_c_l150_c17_4e77] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_c_l150_c17_4e77_left <= VAR_BIN_OP_GT_uxn_c_l150_c17_4e77_left;
     BIN_OP_GT_uxn_c_l150_c17_4e77_right <= VAR_BIN_OP_GT_uxn_c_l150_c17_4e77_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_c_l150_c17_4e77_return_output := BIN_OP_GT_uxn_c_l150_c17_4e77_return_output;

     -- BIN_OP_GT[uxn_c_l152_c17_06fa] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_c_l152_c17_06fa_left <= VAR_BIN_OP_GT_uxn_c_l152_c17_06fa_left;
     BIN_OP_GT_uxn_c_l152_c17_06fa_right <= VAR_BIN_OP_GT_uxn_c_l152_c17_06fa_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_c_l152_c17_06fa_return_output := BIN_OP_GT_uxn_c_l152_c17_06fa_return_output;

     -- BIN_OP_LT[uxn_c_l153_c17_1b15] LATENCY=0
     -- Inputs
     BIN_OP_LT_uxn_c_l153_c17_1b15_left <= VAR_BIN_OP_LT_uxn_c_l153_c17_1b15_left;
     BIN_OP_LT_uxn_c_l153_c17_1b15_right <= VAR_BIN_OP_LT_uxn_c_l153_c17_1b15_right;
     -- Outputs
     VAR_BIN_OP_LT_uxn_c_l153_c17_1b15_return_output := BIN_OP_LT_uxn_c_l153_c17_1b15_return_output;

     -- UNARY_OP_NOT[uxn_c_l156_c37_99d5] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l156_c37_99d5_expr <= VAR_UNARY_OP_NOT_uxn_c_l156_c37_99d5_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l156_c37_99d5_return_output := UNARY_OP_NOT_uxn_c_l156_c37_99d5_return_output;

     -- BIN_OP_EQ[uxn_c_l148_c19_a4da] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l148_c19_a4da_left <= VAR_BIN_OP_EQ_uxn_c_l148_c19_a4da_left;
     BIN_OP_EQ_uxn_c_l148_c19_a4da_right <= VAR_BIN_OP_EQ_uxn_c_l148_c19_a4da_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l148_c19_a4da_return_output := BIN_OP_EQ_uxn_c_l148_c19_a4da_return_output;

     -- Submodule level 7
     VAR_MUX_uxn_c_l148_c19_575e_cond := VAR_BIN_OP_EQ_uxn_c_l148_c19_a4da_return_output;
     VAR_MUX_uxn_c_l182_c27_14eb_cond := VAR_BIN_OP_EQ_uxn_c_l182_c27_ddea_return_output;
     VAR_BIN_OP_AND_uxn_c_l155_c18_ecab_right := VAR_BIN_OP_GT_uxn_c_l150_c17_4e77_return_output;
     REG_VAR_fill_isect_l := VAR_BIN_OP_GT_uxn_c_l150_c17_4e77_return_output;
     VAR_BIN_OP_AND_uxn_c_l155_c18_713d_right := VAR_BIN_OP_GT_uxn_c_l152_c17_06fa_return_output;
     REG_VAR_fill_isect_t := VAR_BIN_OP_GT_uxn_c_l152_c17_06fa_return_output;
     VAR_BIN_OP_AND_uxn_c_l155_c18_21b3_right := VAR_BIN_OP_LT_uxn_c_l151_c17_2f5b_return_output;
     REG_VAR_fill_isect_r := VAR_BIN_OP_LT_uxn_c_l151_c17_2f5b_return_output;
     VAR_BIN_OP_AND_uxn_c_l155_c18_c301_right := VAR_BIN_OP_LT_uxn_c_l153_c17_1b15_return_output;
     REG_VAR_fill_isect_b := VAR_BIN_OP_LT_uxn_c_l153_c17_1b15_return_output;
     VAR_MUX_uxn_c_l182_c27_14eb_iffalse := VAR_BIN_OP_MINUS_uxn_c_l182_c60_e1f3_return_output;
     VAR_BIN_OP_AND_uxn_c_l156_c19_b9f7_right := VAR_UNARY_OP_NOT_uxn_c_l156_c37_99d5_return_output;
     -- MUX[uxn_c_l148_c19_575e] LATENCY=0
     -- Inputs
     MUX_uxn_c_l148_c19_575e_cond <= VAR_MUX_uxn_c_l148_c19_575e_cond;
     MUX_uxn_c_l148_c19_575e_iftrue <= VAR_MUX_uxn_c_l148_c19_575e_iftrue;
     MUX_uxn_c_l148_c19_575e_iffalse <= VAR_MUX_uxn_c_l148_c19_575e_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l148_c19_575e_return_output := MUX_uxn_c_l148_c19_575e_return_output;

     -- MUX[uxn_c_l182_c27_14eb] LATENCY=0
     -- Inputs
     MUX_uxn_c_l182_c27_14eb_cond <= VAR_MUX_uxn_c_l182_c27_14eb_cond;
     MUX_uxn_c_l182_c27_14eb_iftrue <= VAR_MUX_uxn_c_l182_c27_14eb_iftrue;
     MUX_uxn_c_l182_c27_14eb_iffalse <= VAR_MUX_uxn_c_l182_c27_14eb_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l182_c27_14eb_return_output := MUX_uxn_c_l182_c27_14eb_return_output;

     -- Submodule level 8
     VAR_BIN_OP_AND_uxn_c_l155_c18_ecab_left := VAR_MUX_uxn_c_l148_c19_575e_return_output;
     VAR_MUX_uxn_c_l165_c37_66ba_cond := VAR_MUX_uxn_c_l148_c19_575e_return_output;
     VAR_MUX_uxn_c_l172_c37_0567_cond := VAR_MUX_uxn_c_l148_c19_575e_return_output;
     VAR_UNARY_OP_NOT_uint1_t_uxn_c_l167_l174_DUPLICATE_fcb1_expr := VAR_MUX_uxn_c_l148_c19_575e_return_output;
     REG_VAR_is_fill_active := VAR_MUX_uxn_c_l148_c19_575e_return_output;
     VAR_fill_pixels_remaining_MUX_uxn_c_l180_c9_1e80_iftrue := VAR_MUX_uxn_c_l182_c27_14eb_return_output;
     -- MUX[uxn_c_l172_c37_0567] LATENCY=0
     -- Inputs
     MUX_uxn_c_l172_c37_0567_cond <= VAR_MUX_uxn_c_l172_c37_0567_cond;
     MUX_uxn_c_l172_c37_0567_iftrue <= VAR_MUX_uxn_c_l172_c37_0567_iftrue;
     MUX_uxn_c_l172_c37_0567_iffalse <= VAR_MUX_uxn_c_l172_c37_0567_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l172_c37_0567_return_output := MUX_uxn_c_l172_c37_0567_return_output;

     -- UNARY_OP_NOT_uint1_t_uxn_c_l167_l174_DUPLICATE_fcb1 LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uint1_t_uxn_c_l167_l174_DUPLICATE_fcb1_expr <= VAR_UNARY_OP_NOT_uint1_t_uxn_c_l167_l174_DUPLICATE_fcb1_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uint1_t_uxn_c_l167_l174_DUPLICATE_fcb1_return_output := UNARY_OP_NOT_uint1_t_uxn_c_l167_l174_DUPLICATE_fcb1_return_output;

     -- MUX[uxn_c_l165_c37_66ba] LATENCY=0
     -- Inputs
     MUX_uxn_c_l165_c37_66ba_cond <= VAR_MUX_uxn_c_l165_c37_66ba_cond;
     MUX_uxn_c_l165_c37_66ba_iftrue <= VAR_MUX_uxn_c_l165_c37_66ba_iftrue;
     MUX_uxn_c_l165_c37_66ba_iffalse <= VAR_MUX_uxn_c_l165_c37_66ba_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l165_c37_66ba_return_output := MUX_uxn_c_l165_c37_66ba_return_output;

     -- fill_pixels_remaining_MUX[uxn_c_l180_c9_1e80] LATENCY=0
     -- Inputs
     fill_pixels_remaining_MUX_uxn_c_l180_c9_1e80_cond <= VAR_fill_pixels_remaining_MUX_uxn_c_l180_c9_1e80_cond;
     fill_pixels_remaining_MUX_uxn_c_l180_c9_1e80_iftrue <= VAR_fill_pixels_remaining_MUX_uxn_c_l180_c9_1e80_iftrue;
     fill_pixels_remaining_MUX_uxn_c_l180_c9_1e80_iffalse <= VAR_fill_pixels_remaining_MUX_uxn_c_l180_c9_1e80_iffalse;
     -- Outputs
     VAR_fill_pixels_remaining_MUX_uxn_c_l180_c9_1e80_return_output := fill_pixels_remaining_MUX_uxn_c_l180_c9_1e80_return_output;

     -- BIN_OP_AND[uxn_c_l155_c18_ecab] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l155_c18_ecab_left <= VAR_BIN_OP_AND_uxn_c_l155_c18_ecab_left;
     BIN_OP_AND_uxn_c_l155_c18_ecab_right <= VAR_BIN_OP_AND_uxn_c_l155_c18_ecab_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l155_c18_ecab_return_output := BIN_OP_AND_uxn_c_l155_c18_ecab_return_output;

     -- Submodule level 9
     VAR_BIN_OP_AND_uxn_c_l155_c18_21b3_left := VAR_BIN_OP_AND_uxn_c_l155_c18_ecab_return_output;
     VAR_MUX_uxn_c_l165_c3_c8c1_iffalse := VAR_MUX_uxn_c_l165_c37_66ba_return_output;
     VAR_MUX_uxn_c_l172_c3_d071_iffalse := VAR_MUX_uxn_c_l172_c37_0567_return_output;
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l174_l167_DUPLICATE_62f0_left := VAR_UNARY_OP_NOT_uint1_t_uxn_c_l167_l174_DUPLICATE_fcb1_return_output;
     VAR_fill_pixels_remaining_MUX_uxn_c_l178_c2_e14c_iffalse := VAR_fill_pixels_remaining_MUX_uxn_c_l180_c9_1e80_return_output;
     -- BIN_OP_AND[uxn_c_l155_c18_21b3] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l155_c18_21b3_left <= VAR_BIN_OP_AND_uxn_c_l155_c18_21b3_left;
     BIN_OP_AND_uxn_c_l155_c18_21b3_right <= VAR_BIN_OP_AND_uxn_c_l155_c18_21b3_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l155_c18_21b3_return_output := BIN_OP_AND_uxn_c_l155_c18_21b3_return_output;

     -- BIN_OP_AND_uint1_t_uint1_t_uxn_c_l174_l167_DUPLICATE_62f0 LATENCY=0
     -- Inputs
     BIN_OP_AND_uint1_t_uint1_t_uxn_c_l174_l167_DUPLICATE_62f0_left <= VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l174_l167_DUPLICATE_62f0_left;
     BIN_OP_AND_uint1_t_uint1_t_uxn_c_l174_l167_DUPLICATE_62f0_right <= VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l174_l167_DUPLICATE_62f0_right;
     -- Outputs
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l174_l167_DUPLICATE_62f0_return_output := BIN_OP_AND_uint1_t_uint1_t_uxn_c_l174_l167_DUPLICATE_62f0_return_output;

     -- fill_pixels_remaining_MUX[uxn_c_l178_c2_e14c] LATENCY=0
     -- Inputs
     fill_pixels_remaining_MUX_uxn_c_l178_c2_e14c_cond <= VAR_fill_pixels_remaining_MUX_uxn_c_l178_c2_e14c_cond;
     fill_pixels_remaining_MUX_uxn_c_l178_c2_e14c_iftrue <= VAR_fill_pixels_remaining_MUX_uxn_c_l178_c2_e14c_iftrue;
     fill_pixels_remaining_MUX_uxn_c_l178_c2_e14c_iffalse <= VAR_fill_pixels_remaining_MUX_uxn_c_l178_c2_e14c_iffalse;
     -- Outputs
     VAR_fill_pixels_remaining_MUX_uxn_c_l178_c2_e14c_return_output := fill_pixels_remaining_MUX_uxn_c_l178_c2_e14c_return_output;

     -- Submodule level 10
     VAR_BIN_OP_AND_uxn_c_l155_c18_713d_left := VAR_BIN_OP_AND_uxn_c_l155_c18_21b3_return_output;
     VAR_BIN_OP_AND_uxn_c_l167_c22_edef_left := VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l174_l167_DUPLICATE_62f0_return_output;
     VAR_BIN_OP_AND_uxn_c_l174_c22_ada2_left := VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l174_l167_DUPLICATE_62f0_return_output;
     REG_VAR_fill_pixels_remaining := VAR_fill_pixels_remaining_MUX_uxn_c_l178_c2_e14c_return_output;
     -- BIN_OP_AND[uxn_c_l174_c22_ada2] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l174_c22_ada2_left <= VAR_BIN_OP_AND_uxn_c_l174_c22_ada2_left;
     BIN_OP_AND_uxn_c_l174_c22_ada2_right <= VAR_BIN_OP_AND_uxn_c_l174_c22_ada2_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l174_c22_ada2_return_output := BIN_OP_AND_uxn_c_l174_c22_ada2_return_output;

     -- BIN_OP_AND[uxn_c_l167_c22_edef] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l167_c22_edef_left <= VAR_BIN_OP_AND_uxn_c_l167_c22_edef_left;
     BIN_OP_AND_uxn_c_l167_c22_edef_right <= VAR_BIN_OP_AND_uxn_c_l167_c22_edef_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l167_c22_edef_return_output := BIN_OP_AND_uxn_c_l167_c22_edef_return_output;

     -- BIN_OP_AND[uxn_c_l155_c18_713d] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l155_c18_713d_left <= VAR_BIN_OP_AND_uxn_c_l155_c18_713d_left;
     BIN_OP_AND_uxn_c_l155_c18_713d_right <= VAR_BIN_OP_AND_uxn_c_l155_c18_713d_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l155_c18_713d_return_output := BIN_OP_AND_uxn_c_l155_c18_713d_return_output;

     -- Submodule level 11
     VAR_BIN_OP_AND_uxn_c_l155_c18_c301_left := VAR_BIN_OP_AND_uxn_c_l155_c18_713d_return_output;
     VAR_BIN_OP_OR_uxn_c_l167_c3_79bc_right := VAR_BIN_OP_AND_uxn_c_l167_c22_edef_return_output;
     VAR_BIN_OP_OR_uxn_c_l174_c3_f563_right := VAR_BIN_OP_AND_uxn_c_l174_c22_ada2_return_output;
     -- BIN_OP_AND[uxn_c_l155_c18_c301] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l155_c18_c301_left <= VAR_BIN_OP_AND_uxn_c_l155_c18_c301_left;
     BIN_OP_AND_uxn_c_l155_c18_c301_right <= VAR_BIN_OP_AND_uxn_c_l155_c18_c301_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l155_c18_c301_return_output := BIN_OP_AND_uxn_c_l155_c18_c301_return_output;

     -- Submodule level 12
     VAR_BIN_OP_AND_uxn_c_l156_c19_b9f7_left := VAR_BIN_OP_AND_uxn_c_l155_c18_c301_return_output;
     VAR_BIN_OP_AND_uxn_c_l157_c19_a93e_left := VAR_BIN_OP_AND_uxn_c_l155_c18_c301_return_output;
     REG_VAR_is_fill_pixel := VAR_BIN_OP_AND_uxn_c_l155_c18_c301_return_output;
     -- BIN_OP_AND[uxn_c_l156_c19_b9f7] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l156_c19_b9f7_left <= VAR_BIN_OP_AND_uxn_c_l156_c19_b9f7_left;
     BIN_OP_AND_uxn_c_l156_c19_b9f7_right <= VAR_BIN_OP_AND_uxn_c_l156_c19_b9f7_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l156_c19_b9f7_return_output := BIN_OP_AND_uxn_c_l156_c19_b9f7_return_output;

     -- BIN_OP_AND[uxn_c_l157_c19_a93e] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l157_c19_a93e_left <= VAR_BIN_OP_AND_uxn_c_l157_c19_a93e_left;
     BIN_OP_AND_uxn_c_l157_c19_a93e_right <= VAR_BIN_OP_AND_uxn_c_l157_c19_a93e_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l157_c19_a93e_return_output := BIN_OP_AND_uxn_c_l157_c19_a93e_return_output;

     -- Submodule level 13
     VAR_BIN_OP_OR_uxn_c_l167_c3_79bc_left := VAR_BIN_OP_AND_uxn_c_l156_c19_b9f7_return_output;
     VAR_MUX_uxn_c_l165_c3_c8c1_cond := VAR_BIN_OP_AND_uxn_c_l156_c19_b9f7_return_output;
     VAR_MUX_uxn_c_l166_c3_4f32_cond := VAR_BIN_OP_AND_uxn_c_l156_c19_b9f7_return_output;
     REG_VAR_is_fill_pixel0 := VAR_BIN_OP_AND_uxn_c_l156_c19_b9f7_return_output;
     VAR_BIN_OP_OR_uxn_c_l174_c3_f563_left := VAR_BIN_OP_AND_uxn_c_l157_c19_a93e_return_output;
     VAR_MUX_uxn_c_l172_c3_d071_cond := VAR_BIN_OP_AND_uxn_c_l157_c19_a93e_return_output;
     VAR_MUX_uxn_c_l173_c3_60b3_cond := VAR_BIN_OP_AND_uxn_c_l157_c19_a93e_return_output;
     REG_VAR_is_fill_pixel1 := VAR_BIN_OP_AND_uxn_c_l157_c19_a93e_return_output;
     -- BIN_OP_OR[uxn_c_l174_c3_f563] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l174_c3_f563_left <= VAR_BIN_OP_OR_uxn_c_l174_c3_f563_left;
     BIN_OP_OR_uxn_c_l174_c3_f563_right <= VAR_BIN_OP_OR_uxn_c_l174_c3_f563_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l174_c3_f563_return_output := BIN_OP_OR_uxn_c_l174_c3_f563_return_output;

     -- MUX[uxn_c_l172_c3_d071] LATENCY=0
     -- Inputs
     MUX_uxn_c_l172_c3_d071_cond <= VAR_MUX_uxn_c_l172_c3_d071_cond;
     MUX_uxn_c_l172_c3_d071_iftrue <= VAR_MUX_uxn_c_l172_c3_d071_iftrue;
     MUX_uxn_c_l172_c3_d071_iffalse <= VAR_MUX_uxn_c_l172_c3_d071_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l172_c3_d071_return_output := MUX_uxn_c_l172_c3_d071_return_output;

     -- MUX[uxn_c_l166_c3_4f32] LATENCY=0
     -- Inputs
     MUX_uxn_c_l166_c3_4f32_cond <= VAR_MUX_uxn_c_l166_c3_4f32_cond;
     MUX_uxn_c_l166_c3_4f32_iftrue <= VAR_MUX_uxn_c_l166_c3_4f32_iftrue;
     MUX_uxn_c_l166_c3_4f32_iffalse <= VAR_MUX_uxn_c_l166_c3_4f32_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l166_c3_4f32_return_output := MUX_uxn_c_l166_c3_4f32_return_output;

     -- MUX[uxn_c_l165_c3_c8c1] LATENCY=0
     -- Inputs
     MUX_uxn_c_l165_c3_c8c1_cond <= VAR_MUX_uxn_c_l165_c3_c8c1_cond;
     MUX_uxn_c_l165_c3_c8c1_iftrue <= VAR_MUX_uxn_c_l165_c3_c8c1_iftrue;
     MUX_uxn_c_l165_c3_c8c1_iffalse <= VAR_MUX_uxn_c_l165_c3_c8c1_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l165_c3_c8c1_return_output := MUX_uxn_c_l165_c3_c8c1_return_output;

     -- MUX[uxn_c_l173_c3_60b3] LATENCY=0
     -- Inputs
     MUX_uxn_c_l173_c3_60b3_cond <= VAR_MUX_uxn_c_l173_c3_60b3_cond;
     MUX_uxn_c_l173_c3_60b3_iftrue <= VAR_MUX_uxn_c_l173_c3_60b3_iftrue;
     MUX_uxn_c_l173_c3_60b3_iffalse <= VAR_MUX_uxn_c_l173_c3_60b3_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l173_c3_60b3_return_output := MUX_uxn_c_l173_c3_60b3_return_output;

     -- BIN_OP_OR[uxn_c_l167_c3_79bc] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l167_c3_79bc_left <= VAR_BIN_OP_OR_uxn_c_l167_c3_79bc_left;
     BIN_OP_OR_uxn_c_l167_c3_79bc_right <= VAR_BIN_OP_OR_uxn_c_l167_c3_79bc_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l167_c3_79bc_return_output := BIN_OP_OR_uxn_c_l167_c3_79bc_return_output;

     -- Submodule level 14
     VAR_bg_vram_update_uxn_c_l163_c19_498a_write_enable := VAR_BIN_OP_OR_uxn_c_l167_c3_79bc_return_output;
     VAR_fg_vram_update_uxn_c_l170_c19_8db4_write_enable := VAR_BIN_OP_OR_uxn_c_l174_c3_f563_return_output;
     VAR_bg_vram_update_uxn_c_l163_c19_498a_write_address := VAR_MUX_uxn_c_l165_c3_c8c1_return_output;
     VAR_bg_vram_update_uxn_c_l163_c19_498a_write_value := VAR_MUX_uxn_c_l166_c3_4f32_return_output;
     VAR_fg_vram_update_uxn_c_l170_c19_8db4_write_address := VAR_MUX_uxn_c_l172_c3_d071_return_output;
     VAR_fg_vram_update_uxn_c_l170_c19_8db4_write_value := VAR_MUX_uxn_c_l173_c3_60b3_return_output;
     -- fg_vram_update[uxn_c_l170_c19_8db4] LATENCY=0
     -- Clock enable
     fg_vram_update_uxn_c_l170_c19_8db4_CLOCK_ENABLE <= VAR_fg_vram_update_uxn_c_l170_c19_8db4_CLOCK_ENABLE;
     -- Inputs
     fg_vram_update_uxn_c_l170_c19_8db4_read_address <= VAR_fg_vram_update_uxn_c_l170_c19_8db4_read_address;
     fg_vram_update_uxn_c_l170_c19_8db4_write_address <= VAR_fg_vram_update_uxn_c_l170_c19_8db4_write_address;
     fg_vram_update_uxn_c_l170_c19_8db4_write_value <= VAR_fg_vram_update_uxn_c_l170_c19_8db4_write_value;
     fg_vram_update_uxn_c_l170_c19_8db4_write_enable <= VAR_fg_vram_update_uxn_c_l170_c19_8db4_write_enable;
     -- Outputs
     VAR_fg_vram_update_uxn_c_l170_c19_8db4_return_output := fg_vram_update_uxn_c_l170_c19_8db4_return_output;

     -- bg_vram_update[uxn_c_l163_c19_498a] LATENCY=0
     -- Clock enable
     bg_vram_update_uxn_c_l163_c19_498a_CLOCK_ENABLE <= VAR_bg_vram_update_uxn_c_l163_c19_498a_CLOCK_ENABLE;
     -- Inputs
     bg_vram_update_uxn_c_l163_c19_498a_read_address <= VAR_bg_vram_update_uxn_c_l163_c19_498a_read_address;
     bg_vram_update_uxn_c_l163_c19_498a_write_address <= VAR_bg_vram_update_uxn_c_l163_c19_498a_write_address;
     bg_vram_update_uxn_c_l163_c19_498a_write_value <= VAR_bg_vram_update_uxn_c_l163_c19_498a_write_value;
     bg_vram_update_uxn_c_l163_c19_498a_write_enable <= VAR_bg_vram_update_uxn_c_l163_c19_498a_write_enable;
     -- Outputs
     VAR_bg_vram_update_uxn_c_l163_c19_498a_return_output := bg_vram_update_uxn_c_l163_c19_498a_return_output;

     -- Submodule level 15
     VAR_MUX_uxn_c_l185_c17_37df_iftrue := VAR_bg_vram_update_uxn_c_l163_c19_498a_return_output;
     REG_VAR_bg_pixel_color := VAR_bg_vram_update_uxn_c_l163_c19_498a_return_output;
     VAR_BIN_OP_EQ_uxn_c_l185_c17_2531_left := VAR_fg_vram_update_uxn_c_l170_c19_8db4_return_output;
     VAR_MUX_uxn_c_l185_c17_37df_iffalse := VAR_fg_vram_update_uxn_c_l170_c19_8db4_return_output;
     REG_VAR_fg_pixel_color := VAR_fg_vram_update_uxn_c_l170_c19_8db4_return_output;
     -- BIN_OP_EQ[uxn_c_l185_c17_2531] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l185_c17_2531_left <= VAR_BIN_OP_EQ_uxn_c_l185_c17_2531_left;
     BIN_OP_EQ_uxn_c_l185_c17_2531_right <= VAR_BIN_OP_EQ_uxn_c_l185_c17_2531_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l185_c17_2531_return_output := BIN_OP_EQ_uxn_c_l185_c17_2531_return_output;

     -- Submodule level 16
     VAR_MUX_uxn_c_l185_c17_37df_cond := VAR_BIN_OP_EQ_uxn_c_l185_c17_2531_return_output;
     -- MUX[uxn_c_l185_c17_37df] LATENCY=0
     -- Inputs
     MUX_uxn_c_l185_c17_37df_cond <= VAR_MUX_uxn_c_l185_c17_37df_cond;
     MUX_uxn_c_l185_c17_37df_iftrue <= VAR_MUX_uxn_c_l185_c17_37df_iftrue;
     MUX_uxn_c_l185_c17_37df_iffalse <= VAR_MUX_uxn_c_l185_c17_37df_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l185_c17_37df_return_output := MUX_uxn_c_l185_c17_37df_return_output;

     -- Submodule level 17
     -- CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_6984_uxn_c_l188_l109_DUPLICATE_5bd3 LATENCY=0
     VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_6984_uxn_c_l188_l109_DUPLICATE_5bd3_return_output := CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_6984(
     VAR_MUX_uxn_c_l185_c17_37df_return_output,
     VAR_MUX_uxn_c_l148_c19_575e_return_output);

     -- Submodule level 18
     REG_VAR_result := VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_6984_uxn_c_l188_l109_DUPLICATE_5bd3_return_output;
     VAR_return_output := VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_6984_uxn_c_l188_l109_DUPLICATE_5bd3_return_output;
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
