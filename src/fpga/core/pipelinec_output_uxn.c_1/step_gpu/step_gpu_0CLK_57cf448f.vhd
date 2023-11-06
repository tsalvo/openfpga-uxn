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
-- BIN_OP_GT[uxn_c_l126_c26_7732]
signal BIN_OP_GT_uxn_c_l126_c26_7732_left : unsigned(31 downto 0);
signal BIN_OP_GT_uxn_c_l126_c26_7732_right : unsigned(17 downto 0);
signal BIN_OP_GT_uxn_c_l126_c26_7732_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l126_c26_78dd]
signal MUX_uxn_c_l126_c26_78dd_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l126_c26_78dd_iftrue : unsigned(31 downto 0);
signal MUX_uxn_c_l126_c26_78dd_iffalse : unsigned(31 downto 0);
signal MUX_uxn_c_l126_c26_78dd_return_output : unsigned(31 downto 0);

-- CONST_SR_28[uxn_c_l127_c24_7066]
signal CONST_SR_28_uxn_c_l127_c24_7066_x : unsigned(31 downto 0);
signal CONST_SR_28_uxn_c_l127_c24_7066_return_output : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_c_l128_c17_ea4b]
signal BIN_OP_EQ_uxn_c_l128_c17_ea4b_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l128_c17_ea4b_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l128_c17_ea4b_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l128_c17_1e1d]
signal MUX_uxn_c_l128_c17_1e1d_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l128_c17_1e1d_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l128_c17_1e1d_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l128_c17_1e1d_return_output : unsigned(0 downto 0);

-- BIN_OP_DIV[uxn_c_l129_c6_8b80]
signal BIN_OP_DIV_uxn_c_l129_c6_8b80_left : unsigned(31 downto 0);
signal BIN_OP_DIV_uxn_c_l129_c6_8b80_right : unsigned(8 downto 0);
signal BIN_OP_DIV_uxn_c_l129_c6_8b80_return_output : unsigned(31 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_c_l130_c23_6f80]
signal BIN_OP_INFERRED_MULT_uxn_c_l130_c23_6f80_left : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_c_l130_c23_6f80_right : unsigned(8 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_c_l130_c23_6f80_return_output : unsigned(24 downto 0);

-- BIN_OP_MINUS[uxn_c_l130_c6_4327]
signal BIN_OP_MINUS_uxn_c_l130_c6_4327_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_uxn_c_l130_c6_4327_right : unsigned(24 downto 0);
signal BIN_OP_MINUS_uxn_c_l130_c6_4327_return_output : unsigned(31 downto 0);

-- UNARY_OP_NOT[uxn_c_l133_c22_2281]
signal UNARY_OP_NOT_uxn_c_l133_c22_2281_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l133_c22_2281_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l133_c6_bd9a]
signal BIN_OP_AND_uxn_c_l133_c6_bd9a_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l133_c6_bd9a_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l133_c6_bd9a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l133_c1_bc14]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l133_c1_bc14_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l133_c1_bc14_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l133_c1_bc14_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l133_c1_bc14_return_output : unsigned(0 downto 0);

-- is_fill_left_MUX[uxn_c_l133_c2_bbc1]
signal is_fill_left_MUX_uxn_c_l133_c2_bbc1_cond : unsigned(0 downto 0);
signal is_fill_left_MUX_uxn_c_l133_c2_bbc1_iftrue : unsigned(0 downto 0);
signal is_fill_left_MUX_uxn_c_l133_c2_bbc1_iffalse : unsigned(0 downto 0);
signal is_fill_left_MUX_uxn_c_l133_c2_bbc1_return_output : unsigned(0 downto 0);

-- fill_layer_MUX[uxn_c_l133_c2_bbc1]
signal fill_layer_MUX_uxn_c_l133_c2_bbc1_cond : unsigned(0 downto 0);
signal fill_layer_MUX_uxn_c_l133_c2_bbc1_iftrue : unsigned(0 downto 0);
signal fill_layer_MUX_uxn_c_l133_c2_bbc1_iffalse : unsigned(0 downto 0);
signal fill_layer_MUX_uxn_c_l133_c2_bbc1_return_output : unsigned(0 downto 0);

-- fill_color_MUX[uxn_c_l133_c2_bbc1]
signal fill_color_MUX_uxn_c_l133_c2_bbc1_cond : unsigned(0 downto 0);
signal fill_color_MUX_uxn_c_l133_c2_bbc1_iftrue : unsigned(1 downto 0);
signal fill_color_MUX_uxn_c_l133_c2_bbc1_iffalse : unsigned(1 downto 0);
signal fill_color_MUX_uxn_c_l133_c2_bbc1_return_output : unsigned(1 downto 0);

-- fill_pixels_remaining_MUX[uxn_c_l133_c2_bbc1]
signal fill_pixels_remaining_MUX_uxn_c_l133_c2_bbc1_cond : unsigned(0 downto 0);
signal fill_pixels_remaining_MUX_uxn_c_l133_c2_bbc1_iftrue : unsigned(31 downto 0);
signal fill_pixels_remaining_MUX_uxn_c_l133_c2_bbc1_iffalse : unsigned(31 downto 0);
signal fill_pixels_remaining_MUX_uxn_c_l133_c2_bbc1_return_output : unsigned(31 downto 0);

-- fill_x1_MUX[uxn_c_l133_c2_bbc1]
signal fill_x1_MUX_uxn_c_l133_c2_bbc1_cond : unsigned(0 downto 0);
signal fill_x1_MUX_uxn_c_l133_c2_bbc1_iftrue : unsigned(15 downto 0);
signal fill_x1_MUX_uxn_c_l133_c2_bbc1_iffalse : unsigned(15 downto 0);
signal fill_x1_MUX_uxn_c_l133_c2_bbc1_return_output : unsigned(15 downto 0);

-- fill_y1_MUX[uxn_c_l133_c2_bbc1]
signal fill_y1_MUX_uxn_c_l133_c2_bbc1_cond : unsigned(0 downto 0);
signal fill_y1_MUX_uxn_c_l133_c2_bbc1_iftrue : unsigned(15 downto 0);
signal fill_y1_MUX_uxn_c_l133_c2_bbc1_iffalse : unsigned(15 downto 0);
signal fill_y1_MUX_uxn_c_l133_c2_bbc1_return_output : unsigned(15 downto 0);

-- fill_y0_MUX[uxn_c_l133_c2_bbc1]
signal fill_y0_MUX_uxn_c_l133_c2_bbc1_cond : unsigned(0 downto 0);
signal fill_y0_MUX_uxn_c_l133_c2_bbc1_iftrue : unsigned(15 downto 0);
signal fill_y0_MUX_uxn_c_l133_c2_bbc1_iffalse : unsigned(15 downto 0);
signal fill_y0_MUX_uxn_c_l133_c2_bbc1_return_output : unsigned(15 downto 0);

-- is_fill_top_MUX[uxn_c_l133_c2_bbc1]
signal is_fill_top_MUX_uxn_c_l133_c2_bbc1_cond : unsigned(0 downto 0);
signal is_fill_top_MUX_uxn_c_l133_c2_bbc1_iftrue : unsigned(0 downto 0);
signal is_fill_top_MUX_uxn_c_l133_c2_bbc1_iffalse : unsigned(0 downto 0);
signal is_fill_top_MUX_uxn_c_l133_c2_bbc1_return_output : unsigned(0 downto 0);

-- fill_x0_MUX[uxn_c_l133_c2_bbc1]
signal fill_x0_MUX_uxn_c_l133_c2_bbc1_cond : unsigned(0 downto 0);
signal fill_x0_MUX_uxn_c_l133_c2_bbc1_iftrue : unsigned(15 downto 0);
signal fill_x0_MUX_uxn_c_l133_c2_bbc1_iffalse : unsigned(15 downto 0);
signal fill_x0_MUX_uxn_c_l133_c2_bbc1_return_output : unsigned(15 downto 0);

-- CONST_SR_20[uxn_c_l135_c18_b74d]
signal CONST_SR_20_uxn_c_l135_c18_b74d_x : unsigned(31 downto 0);
signal CONST_SR_20_uxn_c_l135_c18_b74d_return_output : unsigned(31 downto 0);

-- CONST_SR_21[uxn_c_l136_c17_fc88]
signal CONST_SR_21_uxn_c_l136_c17_fc88_x : unsigned(31 downto 0);
signal CONST_SR_21_uxn_c_l136_c17_fc88_return_output : unsigned(31 downto 0);

-- BIN_OP_AND[uxn_c_l137_c27_deb1]
signal BIN_OP_AND_uxn_c_l137_c27_deb1_left : unsigned(31 downto 0);
signal BIN_OP_AND_uxn_c_l137_c27_deb1_right : unsigned(17 downto 0);
signal BIN_OP_AND_uxn_c_l137_c27_deb1_return_output : unsigned(31 downto 0);

-- BIN_OP_DIV[uxn_c_l138_c13_2724]
signal BIN_OP_DIV_uxn_c_l138_c13_2724_left : unsigned(31 downto 0);
signal BIN_OP_DIV_uxn_c_l138_c13_2724_right : unsigned(8 downto 0);
signal BIN_OP_DIV_uxn_c_l138_c13_2724_return_output : unsigned(31 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_c_l139_c38_5d0c]
signal BIN_OP_INFERRED_MULT_uxn_c_l139_c38_5d0c_left : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_c_l139_c38_5d0c_right : unsigned(8 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_c_l139_c38_5d0c_return_output : unsigned(24 downto 0);

-- BIN_OP_MINUS[uxn_c_l139_c13_c939]
signal BIN_OP_MINUS_uxn_c_l139_c13_c939_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_uxn_c_l139_c13_c939_right : unsigned(24 downto 0);
signal BIN_OP_MINUS_uxn_c_l139_c13_c939_return_output : unsigned(31 downto 0);

-- MUX[uxn_c_l140_c13_98c1]
signal MUX_uxn_c_l140_c13_98c1_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l140_c13_98c1_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l140_c13_98c1_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l140_c13_98c1_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l141_c13_97f1]
signal MUX_uxn_c_l141_c13_97f1_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l141_c13_97f1_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l141_c13_97f1_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l141_c13_97f1_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l142_c13_c3e3]
signal MUX_uxn_c_l142_c13_c3e3_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l142_c13_c3e3_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l142_c13_c3e3_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l142_c13_c3e3_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l143_c13_bbc3]
signal MUX_uxn_c_l143_c13_bbc3_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l143_c13_bbc3_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l143_c13_bbc3_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l143_c13_bbc3_return_output : unsigned(15 downto 0);

-- printf_uxn_c_l147_c3_482a[uxn_c_l147_c3_482a]
signal printf_uxn_c_l147_c3_482a_uxn_c_l147_c3_482a_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_c_l147_c3_482a_uxn_c_l147_c3_482a_arg0 : unsigned(31 downto 0);
signal printf_uxn_c_l147_c3_482a_uxn_c_l147_c3_482a_arg1 : unsigned(31 downto 0);
signal printf_uxn_c_l147_c3_482a_uxn_c_l147_c3_482a_arg2 : unsigned(31 downto 0);
signal printf_uxn_c_l147_c3_482a_uxn_c_l147_c3_482a_arg3 : unsigned(31 downto 0);
signal printf_uxn_c_l147_c3_482a_uxn_c_l147_c3_482a_arg4 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_c_l150_c19_97ce]
signal BIN_OP_EQ_uxn_c_l150_c19_97ce_left : unsigned(31 downto 0);
signal BIN_OP_EQ_uxn_c_l150_c19_97ce_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l150_c19_97ce_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l150_c19_adb2]
signal MUX_uxn_c_l150_c19_adb2_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l150_c19_adb2_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l150_c19_adb2_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l150_c19_adb2_return_output : unsigned(0 downto 0);

-- BIN_OP_GT[uxn_c_l152_c17_bb5e]
signal BIN_OP_GT_uxn_c_l152_c17_bb5e_left : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_c_l152_c17_bb5e_right : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_c_l152_c17_bb5e_return_output : unsigned(0 downto 0);

-- BIN_OP_LT[uxn_c_l153_c17_7565]
signal BIN_OP_LT_uxn_c_l153_c17_7565_left : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_c_l153_c17_7565_right : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_c_l153_c17_7565_return_output : unsigned(0 downto 0);

-- BIN_OP_GT[uxn_c_l154_c17_6a03]
signal BIN_OP_GT_uxn_c_l154_c17_6a03_left : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_c_l154_c17_6a03_right : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_c_l154_c17_6a03_return_output : unsigned(0 downto 0);

-- BIN_OP_LT[uxn_c_l155_c17_5d64]
signal BIN_OP_LT_uxn_c_l155_c17_5d64_left : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_c_l155_c17_5d64_right : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_c_l155_c17_5d64_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l157_c18_e0a0]
signal BIN_OP_AND_uxn_c_l157_c18_e0a0_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l157_c18_e0a0_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l157_c18_e0a0_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l157_c18_f6be]
signal BIN_OP_AND_uxn_c_l157_c18_f6be_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l157_c18_f6be_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l157_c18_f6be_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l157_c18_37d5]
signal BIN_OP_AND_uxn_c_l157_c18_37d5_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l157_c18_37d5_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l157_c18_37d5_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l157_c18_66df]
signal BIN_OP_AND_uxn_c_l157_c18_66df_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l157_c18_66df_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l157_c18_66df_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_c_l158_c37_7cf2]
signal UNARY_OP_NOT_uxn_c_l158_c37_7cf2_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l158_c37_7cf2_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l158_c19_3764]
signal BIN_OP_AND_uxn_c_l158_c19_3764_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l158_c19_3764_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l158_c19_3764_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l159_c19_fb6a]
signal BIN_OP_AND_uxn_c_l159_c19_fb6a_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l159_c19_fb6a_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l159_c19_fb6a_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l163_c37_efa7]
signal MUX_uxn_c_l163_c37_efa7_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l163_c37_efa7_iftrue : unsigned(31 downto 0);
signal MUX_uxn_c_l163_c37_efa7_iffalse : unsigned(31 downto 0);
signal MUX_uxn_c_l163_c37_efa7_return_output : unsigned(31 downto 0);

-- MUX[uxn_c_l163_c3_9d1e]
signal MUX_uxn_c_l163_c3_9d1e_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l163_c3_9d1e_iftrue : unsigned(31 downto 0);
signal MUX_uxn_c_l163_c3_9d1e_iffalse : unsigned(31 downto 0);
signal MUX_uxn_c_l163_c3_9d1e_return_output : unsigned(31 downto 0);

-- MUX[uxn_c_l164_c3_fd98]
signal MUX_uxn_c_l164_c3_fd98_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l164_c3_fd98_iftrue : unsigned(1 downto 0);
signal MUX_uxn_c_l164_c3_fd98_iffalse : unsigned(1 downto 0);
signal MUX_uxn_c_l164_c3_fd98_return_output : unsigned(1 downto 0);

-- UNARY_OP_NOT[uxn_c_l165_c57_8e60]
signal UNARY_OP_NOT_uxn_c_l165_c57_8e60_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l165_c57_8e60_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l165_c22_115c]
signal BIN_OP_AND_uxn_c_l165_c22_115c_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l165_c22_115c_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l165_c22_115c_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_c_l165_c3_74f3]
signal BIN_OP_OR_uxn_c_l165_c3_74f3_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l165_c3_74f3_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l165_c3_74f3_return_output : unsigned(0 downto 0);

-- bg_vram_update[uxn_c_l161_c19_e18d]
signal bg_vram_update_uxn_c_l161_c19_e18d_CLOCK_ENABLE : unsigned(0 downto 0);
signal bg_vram_update_uxn_c_l161_c19_e18d_read_address : unsigned(31 downto 0);
signal bg_vram_update_uxn_c_l161_c19_e18d_write_address : unsigned(31 downto 0);
signal bg_vram_update_uxn_c_l161_c19_e18d_write_value : unsigned(1 downto 0);
signal bg_vram_update_uxn_c_l161_c19_e18d_write_enable : unsigned(0 downto 0);
signal bg_vram_update_uxn_c_l161_c19_e18d_return_output : unsigned(1 downto 0);

-- MUX[uxn_c_l170_c37_886b]
signal MUX_uxn_c_l170_c37_886b_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l170_c37_886b_iftrue : unsigned(31 downto 0);
signal MUX_uxn_c_l170_c37_886b_iffalse : unsigned(31 downto 0);
signal MUX_uxn_c_l170_c37_886b_return_output : unsigned(31 downto 0);

-- MUX[uxn_c_l170_c3_644e]
signal MUX_uxn_c_l170_c3_644e_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l170_c3_644e_iftrue : unsigned(31 downto 0);
signal MUX_uxn_c_l170_c3_644e_iffalse : unsigned(31 downto 0);
signal MUX_uxn_c_l170_c3_644e_return_output : unsigned(31 downto 0);

-- MUX[uxn_c_l171_c3_5b03]
signal MUX_uxn_c_l171_c3_5b03_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l171_c3_5b03_iftrue : unsigned(1 downto 0);
signal MUX_uxn_c_l171_c3_5b03_iffalse : unsigned(1 downto 0);
signal MUX_uxn_c_l171_c3_5b03_return_output : unsigned(1 downto 0);

-- BIN_OP_AND[uxn_c_l172_c22_238d]
signal BIN_OP_AND_uxn_c_l172_c22_238d_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l172_c22_238d_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l172_c22_238d_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_c_l172_c3_e2e6]
signal BIN_OP_OR_uxn_c_l172_c3_e2e6_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l172_c3_e2e6_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l172_c3_e2e6_return_output : unsigned(0 downto 0);

-- fg_vram_update[uxn_c_l168_c19_2c6d]
signal fg_vram_update_uxn_c_l168_c19_2c6d_CLOCK_ENABLE : unsigned(0 downto 0);
signal fg_vram_update_uxn_c_l168_c19_2c6d_read_address : unsigned(31 downto 0);
signal fg_vram_update_uxn_c_l168_c19_2c6d_write_address : unsigned(31 downto 0);
signal fg_vram_update_uxn_c_l168_c19_2c6d_write_value : unsigned(1 downto 0);
signal fg_vram_update_uxn_c_l168_c19_2c6d_write_enable : unsigned(0 downto 0);
signal fg_vram_update_uxn_c_l168_c19_2c6d_return_output : unsigned(1 downto 0);

-- BIN_OP_EQ[uxn_c_l176_c6_3921]
signal BIN_OP_EQ_uxn_c_l176_c6_3921_left : unsigned(31 downto 0);
signal BIN_OP_EQ_uxn_c_l176_c6_3921_right : unsigned(17 downto 0);
signal BIN_OP_EQ_uxn_c_l176_c6_3921_return_output : unsigned(0 downto 0);

-- pixel_counter_MUX[uxn_c_l176_c2_de08]
signal pixel_counter_MUX_uxn_c_l176_c2_de08_cond : unsigned(0 downto 0);
signal pixel_counter_MUX_uxn_c_l176_c2_de08_iftrue : unsigned(31 downto 0);
signal pixel_counter_MUX_uxn_c_l176_c2_de08_iffalse : unsigned(31 downto 0);
signal pixel_counter_MUX_uxn_c_l176_c2_de08_return_output : unsigned(31 downto 0);

-- fill_pixels_remaining_MUX[uxn_c_l176_c2_de08]
signal fill_pixels_remaining_MUX_uxn_c_l176_c2_de08_cond : unsigned(0 downto 0);
signal fill_pixels_remaining_MUX_uxn_c_l176_c2_de08_iftrue : unsigned(31 downto 0);
signal fill_pixels_remaining_MUX_uxn_c_l176_c2_de08_iffalse : unsigned(31 downto 0);
signal fill_pixels_remaining_MUX_uxn_c_l176_c2_de08_return_output : unsigned(31 downto 0);

-- result_is_new_frame_MUX[uxn_c_l176_c2_de08]
signal result_is_new_frame_MUX_uxn_c_l176_c2_de08_cond : unsigned(0 downto 0);
signal result_is_new_frame_MUX_uxn_c_l176_c2_de08_iftrue : unsigned(0 downto 0);
signal result_is_new_frame_MUX_uxn_c_l176_c2_de08_iffalse : unsigned(0 downto 0);
signal result_is_new_frame_MUX_uxn_c_l176_c2_de08_return_output : unsigned(0 downto 0);

-- pixel_counter_MUX[uxn_c_l179_c9_df78]
signal pixel_counter_MUX_uxn_c_l179_c9_df78_cond : unsigned(0 downto 0);
signal pixel_counter_MUX_uxn_c_l179_c9_df78_iftrue : unsigned(31 downto 0);
signal pixel_counter_MUX_uxn_c_l179_c9_df78_iffalse : unsigned(31 downto 0);
signal pixel_counter_MUX_uxn_c_l179_c9_df78_return_output : unsigned(31 downto 0);

-- fill_pixels_remaining_MUX[uxn_c_l179_c9_df78]
signal fill_pixels_remaining_MUX_uxn_c_l179_c9_df78_cond : unsigned(0 downto 0);
signal fill_pixels_remaining_MUX_uxn_c_l179_c9_df78_iftrue : unsigned(31 downto 0);
signal fill_pixels_remaining_MUX_uxn_c_l179_c9_df78_iffalse : unsigned(31 downto 0);
signal fill_pixels_remaining_MUX_uxn_c_l179_c9_df78_return_output : unsigned(31 downto 0);

-- result_is_new_frame_MUX[uxn_c_l179_c9_df78]
signal result_is_new_frame_MUX_uxn_c_l179_c9_df78_cond : unsigned(0 downto 0);
signal result_is_new_frame_MUX_uxn_c_l179_c9_df78_iftrue : unsigned(0 downto 0);
signal result_is_new_frame_MUX_uxn_c_l179_c9_df78_iffalse : unsigned(0 downto 0);
signal result_is_new_frame_MUX_uxn_c_l179_c9_df78_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l181_c3_3a72]
signal BIN_OP_PLUS_uxn_c_l181_c3_3a72_left : unsigned(31 downto 0);
signal BIN_OP_PLUS_uxn_c_l181_c3_3a72_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l181_c3_3a72_return_output : unsigned(32 downto 0);

-- BIN_OP_EQ[uxn_c_l182_c27_56a6]
signal BIN_OP_EQ_uxn_c_l182_c27_56a6_left : unsigned(31 downto 0);
signal BIN_OP_EQ_uxn_c_l182_c27_56a6_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l182_c27_56a6_return_output : unsigned(0 downto 0);

-- BIN_OP_MINUS[uxn_c_l182_c60_c649]
signal BIN_OP_MINUS_uxn_c_l182_c60_c649_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_uxn_c_l182_c60_c649_right : unsigned(0 downto 0);
signal BIN_OP_MINUS_uxn_c_l182_c60_c649_return_output : unsigned(31 downto 0);

-- MUX[uxn_c_l182_c27_9d8f]
signal MUX_uxn_c_l182_c27_9d8f_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l182_c27_9d8f_iftrue : unsigned(31 downto 0);
signal MUX_uxn_c_l182_c27_9d8f_iffalse : unsigned(31 downto 0);
signal MUX_uxn_c_l182_c27_9d8f_return_output : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_c_l185_c17_dc11]
signal BIN_OP_EQ_uxn_c_l185_c17_dc11_left : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l185_c17_dc11_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l185_c17_dc11_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l185_c17_a869]
signal MUX_uxn_c_l185_c17_a869_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l185_c17_a869_iftrue : unsigned(1 downto 0);
signal MUX_uxn_c_l185_c17_a869_iffalse : unsigned(1 downto 0);
signal MUX_uxn_c_l185_c17_a869_return_output : unsigned(1 downto 0);

-- UNARY_OP_NOT_uint1_t_uxn_c_l172_l165_DUPLICATE_8568
signal UNARY_OP_NOT_uint1_t_uxn_c_l172_l165_DUPLICATE_8568_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uint1_t_uxn_c_l172_l165_DUPLICATE_8568_return_output : unsigned(0 downto 0);

-- BIN_OP_AND_uint1_t_uint1_t_uxn_c_l172_l165_DUPLICATE_0cc0
signal BIN_OP_AND_uint1_t_uint1_t_uxn_c_l172_l165_DUPLICATE_0cc0_left : unsigned(0 downto 0);
signal BIN_OP_AND_uint1_t_uint1_t_uxn_c_l172_l165_DUPLICATE_0cc0_right : unsigned(0 downto 0);
signal BIN_OP_AND_uint1_t_uint1_t_uxn_c_l172_l165_DUPLICATE_0cc0_return_output : unsigned(0 downto 0);

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
-- BIN_OP_GT_uxn_c_l126_c26_7732
BIN_OP_GT_uxn_c_l126_c26_7732 : entity work.BIN_OP_GT_uint32_t_uint18_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_c_l126_c26_7732_left,
BIN_OP_GT_uxn_c_l126_c26_7732_right,
BIN_OP_GT_uxn_c_l126_c26_7732_return_output);

-- MUX_uxn_c_l126_c26_78dd
MUX_uxn_c_l126_c26_78dd : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
MUX_uxn_c_l126_c26_78dd_cond,
MUX_uxn_c_l126_c26_78dd_iftrue,
MUX_uxn_c_l126_c26_78dd_iffalse,
MUX_uxn_c_l126_c26_78dd_return_output);

-- CONST_SR_28_uxn_c_l127_c24_7066
CONST_SR_28_uxn_c_l127_c24_7066 : entity work.CONST_SR_28_uint32_t_0CLK_de264c78 port map (
CONST_SR_28_uxn_c_l127_c24_7066_x,
CONST_SR_28_uxn_c_l127_c24_7066_return_output);

-- BIN_OP_EQ_uxn_c_l128_c17_ea4b
BIN_OP_EQ_uxn_c_l128_c17_ea4b : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l128_c17_ea4b_left,
BIN_OP_EQ_uxn_c_l128_c17_ea4b_right,
BIN_OP_EQ_uxn_c_l128_c17_ea4b_return_output);

-- MUX_uxn_c_l128_c17_1e1d
MUX_uxn_c_l128_c17_1e1d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l128_c17_1e1d_cond,
MUX_uxn_c_l128_c17_1e1d_iftrue,
MUX_uxn_c_l128_c17_1e1d_iffalse,
MUX_uxn_c_l128_c17_1e1d_return_output);

-- BIN_OP_DIV_uxn_c_l129_c6_8b80
BIN_OP_DIV_uxn_c_l129_c6_8b80 : entity work.BIN_OP_DIV_uint32_t_uint9_t_0CLK_422b4ffb port map (
BIN_OP_DIV_uxn_c_l129_c6_8b80_left,
BIN_OP_DIV_uxn_c_l129_c6_8b80_right,
BIN_OP_DIV_uxn_c_l129_c6_8b80_return_output);

-- BIN_OP_INFERRED_MULT_uxn_c_l130_c23_6f80
BIN_OP_INFERRED_MULT_uxn_c_l130_c23_6f80 : entity work.BIN_OP_INFERRED_MULT_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_c_l130_c23_6f80_left,
BIN_OP_INFERRED_MULT_uxn_c_l130_c23_6f80_right,
BIN_OP_INFERRED_MULT_uxn_c_l130_c23_6f80_return_output);

-- BIN_OP_MINUS_uxn_c_l130_c6_4327
BIN_OP_MINUS_uxn_c_l130_c6_4327 : entity work.BIN_OP_MINUS_uint32_t_uint25_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l130_c6_4327_left,
BIN_OP_MINUS_uxn_c_l130_c6_4327_right,
BIN_OP_MINUS_uxn_c_l130_c6_4327_return_output);

-- UNARY_OP_NOT_uxn_c_l133_c22_2281
UNARY_OP_NOT_uxn_c_l133_c22_2281 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l133_c22_2281_expr,
UNARY_OP_NOT_uxn_c_l133_c22_2281_return_output);

-- BIN_OP_AND_uxn_c_l133_c6_bd9a
BIN_OP_AND_uxn_c_l133_c6_bd9a : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l133_c6_bd9a_left,
BIN_OP_AND_uxn_c_l133_c6_bd9a_right,
BIN_OP_AND_uxn_c_l133_c6_bd9a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l133_c1_bc14
TRUE_CLOCK_ENABLE_MUX_uxn_c_l133_c1_bc14 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l133_c1_bc14_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l133_c1_bc14_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l133_c1_bc14_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l133_c1_bc14_return_output);

-- is_fill_left_MUX_uxn_c_l133_c2_bbc1
is_fill_left_MUX_uxn_c_l133_c2_bbc1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_left_MUX_uxn_c_l133_c2_bbc1_cond,
is_fill_left_MUX_uxn_c_l133_c2_bbc1_iftrue,
is_fill_left_MUX_uxn_c_l133_c2_bbc1_iffalse,
is_fill_left_MUX_uxn_c_l133_c2_bbc1_return_output);

-- fill_layer_MUX_uxn_c_l133_c2_bbc1
fill_layer_MUX_uxn_c_l133_c2_bbc1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
fill_layer_MUX_uxn_c_l133_c2_bbc1_cond,
fill_layer_MUX_uxn_c_l133_c2_bbc1_iftrue,
fill_layer_MUX_uxn_c_l133_c2_bbc1_iffalse,
fill_layer_MUX_uxn_c_l133_c2_bbc1_return_output);

-- fill_color_MUX_uxn_c_l133_c2_bbc1
fill_color_MUX_uxn_c_l133_c2_bbc1 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
fill_color_MUX_uxn_c_l133_c2_bbc1_cond,
fill_color_MUX_uxn_c_l133_c2_bbc1_iftrue,
fill_color_MUX_uxn_c_l133_c2_bbc1_iffalse,
fill_color_MUX_uxn_c_l133_c2_bbc1_return_output);

-- fill_pixels_remaining_MUX_uxn_c_l133_c2_bbc1
fill_pixels_remaining_MUX_uxn_c_l133_c2_bbc1 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
fill_pixels_remaining_MUX_uxn_c_l133_c2_bbc1_cond,
fill_pixels_remaining_MUX_uxn_c_l133_c2_bbc1_iftrue,
fill_pixels_remaining_MUX_uxn_c_l133_c2_bbc1_iffalse,
fill_pixels_remaining_MUX_uxn_c_l133_c2_bbc1_return_output);

-- fill_x1_MUX_uxn_c_l133_c2_bbc1
fill_x1_MUX_uxn_c_l133_c2_bbc1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_x1_MUX_uxn_c_l133_c2_bbc1_cond,
fill_x1_MUX_uxn_c_l133_c2_bbc1_iftrue,
fill_x1_MUX_uxn_c_l133_c2_bbc1_iffalse,
fill_x1_MUX_uxn_c_l133_c2_bbc1_return_output);

-- fill_y1_MUX_uxn_c_l133_c2_bbc1
fill_y1_MUX_uxn_c_l133_c2_bbc1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_y1_MUX_uxn_c_l133_c2_bbc1_cond,
fill_y1_MUX_uxn_c_l133_c2_bbc1_iftrue,
fill_y1_MUX_uxn_c_l133_c2_bbc1_iffalse,
fill_y1_MUX_uxn_c_l133_c2_bbc1_return_output);

-- fill_y0_MUX_uxn_c_l133_c2_bbc1
fill_y0_MUX_uxn_c_l133_c2_bbc1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_y0_MUX_uxn_c_l133_c2_bbc1_cond,
fill_y0_MUX_uxn_c_l133_c2_bbc1_iftrue,
fill_y0_MUX_uxn_c_l133_c2_bbc1_iffalse,
fill_y0_MUX_uxn_c_l133_c2_bbc1_return_output);

-- is_fill_top_MUX_uxn_c_l133_c2_bbc1
is_fill_top_MUX_uxn_c_l133_c2_bbc1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_top_MUX_uxn_c_l133_c2_bbc1_cond,
is_fill_top_MUX_uxn_c_l133_c2_bbc1_iftrue,
is_fill_top_MUX_uxn_c_l133_c2_bbc1_iffalse,
is_fill_top_MUX_uxn_c_l133_c2_bbc1_return_output);

-- fill_x0_MUX_uxn_c_l133_c2_bbc1
fill_x0_MUX_uxn_c_l133_c2_bbc1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_x0_MUX_uxn_c_l133_c2_bbc1_cond,
fill_x0_MUX_uxn_c_l133_c2_bbc1_iftrue,
fill_x0_MUX_uxn_c_l133_c2_bbc1_iffalse,
fill_x0_MUX_uxn_c_l133_c2_bbc1_return_output);

-- CONST_SR_20_uxn_c_l135_c18_b74d
CONST_SR_20_uxn_c_l135_c18_b74d : entity work.CONST_SR_20_uint32_t_0CLK_de264c78 port map (
CONST_SR_20_uxn_c_l135_c18_b74d_x,
CONST_SR_20_uxn_c_l135_c18_b74d_return_output);

-- CONST_SR_21_uxn_c_l136_c17_fc88
CONST_SR_21_uxn_c_l136_c17_fc88 : entity work.CONST_SR_21_uint32_t_0CLK_de264c78 port map (
CONST_SR_21_uxn_c_l136_c17_fc88_x,
CONST_SR_21_uxn_c_l136_c17_fc88_return_output);

-- BIN_OP_AND_uxn_c_l137_c27_deb1
BIN_OP_AND_uxn_c_l137_c27_deb1 : entity work.BIN_OP_AND_uint32_t_uint18_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l137_c27_deb1_left,
BIN_OP_AND_uxn_c_l137_c27_deb1_right,
BIN_OP_AND_uxn_c_l137_c27_deb1_return_output);

-- BIN_OP_DIV_uxn_c_l138_c13_2724
BIN_OP_DIV_uxn_c_l138_c13_2724 : entity work.BIN_OP_DIV_uint32_t_uint9_t_0CLK_422b4ffb port map (
BIN_OP_DIV_uxn_c_l138_c13_2724_left,
BIN_OP_DIV_uxn_c_l138_c13_2724_right,
BIN_OP_DIV_uxn_c_l138_c13_2724_return_output);

-- BIN_OP_INFERRED_MULT_uxn_c_l139_c38_5d0c
BIN_OP_INFERRED_MULT_uxn_c_l139_c38_5d0c : entity work.BIN_OP_INFERRED_MULT_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_c_l139_c38_5d0c_left,
BIN_OP_INFERRED_MULT_uxn_c_l139_c38_5d0c_right,
BIN_OP_INFERRED_MULT_uxn_c_l139_c38_5d0c_return_output);

-- BIN_OP_MINUS_uxn_c_l139_c13_c939
BIN_OP_MINUS_uxn_c_l139_c13_c939 : entity work.BIN_OP_MINUS_uint32_t_uint25_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l139_c13_c939_left,
BIN_OP_MINUS_uxn_c_l139_c13_c939_right,
BIN_OP_MINUS_uxn_c_l139_c13_c939_return_output);

-- MUX_uxn_c_l140_c13_98c1
MUX_uxn_c_l140_c13_98c1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l140_c13_98c1_cond,
MUX_uxn_c_l140_c13_98c1_iftrue,
MUX_uxn_c_l140_c13_98c1_iffalse,
MUX_uxn_c_l140_c13_98c1_return_output);

-- MUX_uxn_c_l141_c13_97f1
MUX_uxn_c_l141_c13_97f1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l141_c13_97f1_cond,
MUX_uxn_c_l141_c13_97f1_iftrue,
MUX_uxn_c_l141_c13_97f1_iffalse,
MUX_uxn_c_l141_c13_97f1_return_output);

-- MUX_uxn_c_l142_c13_c3e3
MUX_uxn_c_l142_c13_c3e3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l142_c13_c3e3_cond,
MUX_uxn_c_l142_c13_c3e3_iftrue,
MUX_uxn_c_l142_c13_c3e3_iffalse,
MUX_uxn_c_l142_c13_c3e3_return_output);

-- MUX_uxn_c_l143_c13_bbc3
MUX_uxn_c_l143_c13_bbc3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l143_c13_bbc3_cond,
MUX_uxn_c_l143_c13_bbc3_iftrue,
MUX_uxn_c_l143_c13_bbc3_iffalse,
MUX_uxn_c_l143_c13_bbc3_return_output);

-- printf_uxn_c_l147_c3_482a_uxn_c_l147_c3_482a
printf_uxn_c_l147_c3_482a_uxn_c_l147_c3_482a : entity work.printf_uxn_c_l147_c3_482a_0CLK_de264c78 port map (
printf_uxn_c_l147_c3_482a_uxn_c_l147_c3_482a_CLOCK_ENABLE,
printf_uxn_c_l147_c3_482a_uxn_c_l147_c3_482a_arg0,
printf_uxn_c_l147_c3_482a_uxn_c_l147_c3_482a_arg1,
printf_uxn_c_l147_c3_482a_uxn_c_l147_c3_482a_arg2,
printf_uxn_c_l147_c3_482a_uxn_c_l147_c3_482a_arg3,
printf_uxn_c_l147_c3_482a_uxn_c_l147_c3_482a_arg4);

-- BIN_OP_EQ_uxn_c_l150_c19_97ce
BIN_OP_EQ_uxn_c_l150_c19_97ce : entity work.BIN_OP_EQ_uint32_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l150_c19_97ce_left,
BIN_OP_EQ_uxn_c_l150_c19_97ce_right,
BIN_OP_EQ_uxn_c_l150_c19_97ce_return_output);

-- MUX_uxn_c_l150_c19_adb2
MUX_uxn_c_l150_c19_adb2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l150_c19_adb2_cond,
MUX_uxn_c_l150_c19_adb2_iftrue,
MUX_uxn_c_l150_c19_adb2_iffalse,
MUX_uxn_c_l150_c19_adb2_return_output);

-- BIN_OP_GT_uxn_c_l152_c17_bb5e
BIN_OP_GT_uxn_c_l152_c17_bb5e : entity work.BIN_OP_GT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_c_l152_c17_bb5e_left,
BIN_OP_GT_uxn_c_l152_c17_bb5e_right,
BIN_OP_GT_uxn_c_l152_c17_bb5e_return_output);

-- BIN_OP_LT_uxn_c_l153_c17_7565
BIN_OP_LT_uxn_c_l153_c17_7565 : entity work.BIN_OP_LT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_LT_uxn_c_l153_c17_7565_left,
BIN_OP_LT_uxn_c_l153_c17_7565_right,
BIN_OP_LT_uxn_c_l153_c17_7565_return_output);

-- BIN_OP_GT_uxn_c_l154_c17_6a03
BIN_OP_GT_uxn_c_l154_c17_6a03 : entity work.BIN_OP_GT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_c_l154_c17_6a03_left,
BIN_OP_GT_uxn_c_l154_c17_6a03_right,
BIN_OP_GT_uxn_c_l154_c17_6a03_return_output);

-- BIN_OP_LT_uxn_c_l155_c17_5d64
BIN_OP_LT_uxn_c_l155_c17_5d64 : entity work.BIN_OP_LT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_LT_uxn_c_l155_c17_5d64_left,
BIN_OP_LT_uxn_c_l155_c17_5d64_right,
BIN_OP_LT_uxn_c_l155_c17_5d64_return_output);

-- BIN_OP_AND_uxn_c_l157_c18_e0a0
BIN_OP_AND_uxn_c_l157_c18_e0a0 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l157_c18_e0a0_left,
BIN_OP_AND_uxn_c_l157_c18_e0a0_right,
BIN_OP_AND_uxn_c_l157_c18_e0a0_return_output);

-- BIN_OP_AND_uxn_c_l157_c18_f6be
BIN_OP_AND_uxn_c_l157_c18_f6be : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l157_c18_f6be_left,
BIN_OP_AND_uxn_c_l157_c18_f6be_right,
BIN_OP_AND_uxn_c_l157_c18_f6be_return_output);

-- BIN_OP_AND_uxn_c_l157_c18_37d5
BIN_OP_AND_uxn_c_l157_c18_37d5 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l157_c18_37d5_left,
BIN_OP_AND_uxn_c_l157_c18_37d5_right,
BIN_OP_AND_uxn_c_l157_c18_37d5_return_output);

-- BIN_OP_AND_uxn_c_l157_c18_66df
BIN_OP_AND_uxn_c_l157_c18_66df : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l157_c18_66df_left,
BIN_OP_AND_uxn_c_l157_c18_66df_right,
BIN_OP_AND_uxn_c_l157_c18_66df_return_output);

-- UNARY_OP_NOT_uxn_c_l158_c37_7cf2
UNARY_OP_NOT_uxn_c_l158_c37_7cf2 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l158_c37_7cf2_expr,
UNARY_OP_NOT_uxn_c_l158_c37_7cf2_return_output);

-- BIN_OP_AND_uxn_c_l158_c19_3764
BIN_OP_AND_uxn_c_l158_c19_3764 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l158_c19_3764_left,
BIN_OP_AND_uxn_c_l158_c19_3764_right,
BIN_OP_AND_uxn_c_l158_c19_3764_return_output);

-- BIN_OP_AND_uxn_c_l159_c19_fb6a
BIN_OP_AND_uxn_c_l159_c19_fb6a : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l159_c19_fb6a_left,
BIN_OP_AND_uxn_c_l159_c19_fb6a_right,
BIN_OP_AND_uxn_c_l159_c19_fb6a_return_output);

-- MUX_uxn_c_l163_c37_efa7
MUX_uxn_c_l163_c37_efa7 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
MUX_uxn_c_l163_c37_efa7_cond,
MUX_uxn_c_l163_c37_efa7_iftrue,
MUX_uxn_c_l163_c37_efa7_iffalse,
MUX_uxn_c_l163_c37_efa7_return_output);

-- MUX_uxn_c_l163_c3_9d1e
MUX_uxn_c_l163_c3_9d1e : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
MUX_uxn_c_l163_c3_9d1e_cond,
MUX_uxn_c_l163_c3_9d1e_iftrue,
MUX_uxn_c_l163_c3_9d1e_iffalse,
MUX_uxn_c_l163_c3_9d1e_return_output);

-- MUX_uxn_c_l164_c3_fd98
MUX_uxn_c_l164_c3_fd98 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
MUX_uxn_c_l164_c3_fd98_cond,
MUX_uxn_c_l164_c3_fd98_iftrue,
MUX_uxn_c_l164_c3_fd98_iffalse,
MUX_uxn_c_l164_c3_fd98_return_output);

-- UNARY_OP_NOT_uxn_c_l165_c57_8e60
UNARY_OP_NOT_uxn_c_l165_c57_8e60 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l165_c57_8e60_expr,
UNARY_OP_NOT_uxn_c_l165_c57_8e60_return_output);

-- BIN_OP_AND_uxn_c_l165_c22_115c
BIN_OP_AND_uxn_c_l165_c22_115c : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l165_c22_115c_left,
BIN_OP_AND_uxn_c_l165_c22_115c_right,
BIN_OP_AND_uxn_c_l165_c22_115c_return_output);

-- BIN_OP_OR_uxn_c_l165_c3_74f3
BIN_OP_OR_uxn_c_l165_c3_74f3 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l165_c3_74f3_left,
BIN_OP_OR_uxn_c_l165_c3_74f3_right,
BIN_OP_OR_uxn_c_l165_c3_74f3_return_output);

-- bg_vram_update_uxn_c_l161_c19_e18d
bg_vram_update_uxn_c_l161_c19_e18d : entity work.bg_vram_update_0CLK_b45f1687 port map (
clk,
bg_vram_update_uxn_c_l161_c19_e18d_CLOCK_ENABLE,
bg_vram_update_uxn_c_l161_c19_e18d_read_address,
bg_vram_update_uxn_c_l161_c19_e18d_write_address,
bg_vram_update_uxn_c_l161_c19_e18d_write_value,
bg_vram_update_uxn_c_l161_c19_e18d_write_enable,
bg_vram_update_uxn_c_l161_c19_e18d_return_output);

-- MUX_uxn_c_l170_c37_886b
MUX_uxn_c_l170_c37_886b : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
MUX_uxn_c_l170_c37_886b_cond,
MUX_uxn_c_l170_c37_886b_iftrue,
MUX_uxn_c_l170_c37_886b_iffalse,
MUX_uxn_c_l170_c37_886b_return_output);

-- MUX_uxn_c_l170_c3_644e
MUX_uxn_c_l170_c3_644e : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
MUX_uxn_c_l170_c3_644e_cond,
MUX_uxn_c_l170_c3_644e_iftrue,
MUX_uxn_c_l170_c3_644e_iffalse,
MUX_uxn_c_l170_c3_644e_return_output);

-- MUX_uxn_c_l171_c3_5b03
MUX_uxn_c_l171_c3_5b03 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
MUX_uxn_c_l171_c3_5b03_cond,
MUX_uxn_c_l171_c3_5b03_iftrue,
MUX_uxn_c_l171_c3_5b03_iffalse,
MUX_uxn_c_l171_c3_5b03_return_output);

-- BIN_OP_AND_uxn_c_l172_c22_238d
BIN_OP_AND_uxn_c_l172_c22_238d : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l172_c22_238d_left,
BIN_OP_AND_uxn_c_l172_c22_238d_right,
BIN_OP_AND_uxn_c_l172_c22_238d_return_output);

-- BIN_OP_OR_uxn_c_l172_c3_e2e6
BIN_OP_OR_uxn_c_l172_c3_e2e6 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l172_c3_e2e6_left,
BIN_OP_OR_uxn_c_l172_c3_e2e6_right,
BIN_OP_OR_uxn_c_l172_c3_e2e6_return_output);

-- fg_vram_update_uxn_c_l168_c19_2c6d
fg_vram_update_uxn_c_l168_c19_2c6d : entity work.fg_vram_update_0CLK_b45f1687 port map (
clk,
fg_vram_update_uxn_c_l168_c19_2c6d_CLOCK_ENABLE,
fg_vram_update_uxn_c_l168_c19_2c6d_read_address,
fg_vram_update_uxn_c_l168_c19_2c6d_write_address,
fg_vram_update_uxn_c_l168_c19_2c6d_write_value,
fg_vram_update_uxn_c_l168_c19_2c6d_write_enable,
fg_vram_update_uxn_c_l168_c19_2c6d_return_output);

-- BIN_OP_EQ_uxn_c_l176_c6_3921
BIN_OP_EQ_uxn_c_l176_c6_3921 : entity work.BIN_OP_EQ_uint32_t_uint18_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l176_c6_3921_left,
BIN_OP_EQ_uxn_c_l176_c6_3921_right,
BIN_OP_EQ_uxn_c_l176_c6_3921_return_output);

-- pixel_counter_MUX_uxn_c_l176_c2_de08
pixel_counter_MUX_uxn_c_l176_c2_de08 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
pixel_counter_MUX_uxn_c_l176_c2_de08_cond,
pixel_counter_MUX_uxn_c_l176_c2_de08_iftrue,
pixel_counter_MUX_uxn_c_l176_c2_de08_iffalse,
pixel_counter_MUX_uxn_c_l176_c2_de08_return_output);

-- fill_pixels_remaining_MUX_uxn_c_l176_c2_de08
fill_pixels_remaining_MUX_uxn_c_l176_c2_de08 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
fill_pixels_remaining_MUX_uxn_c_l176_c2_de08_cond,
fill_pixels_remaining_MUX_uxn_c_l176_c2_de08_iftrue,
fill_pixels_remaining_MUX_uxn_c_l176_c2_de08_iffalse,
fill_pixels_remaining_MUX_uxn_c_l176_c2_de08_return_output);

-- result_is_new_frame_MUX_uxn_c_l176_c2_de08
result_is_new_frame_MUX_uxn_c_l176_c2_de08 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_new_frame_MUX_uxn_c_l176_c2_de08_cond,
result_is_new_frame_MUX_uxn_c_l176_c2_de08_iftrue,
result_is_new_frame_MUX_uxn_c_l176_c2_de08_iffalse,
result_is_new_frame_MUX_uxn_c_l176_c2_de08_return_output);

-- pixel_counter_MUX_uxn_c_l179_c9_df78
pixel_counter_MUX_uxn_c_l179_c9_df78 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
pixel_counter_MUX_uxn_c_l179_c9_df78_cond,
pixel_counter_MUX_uxn_c_l179_c9_df78_iftrue,
pixel_counter_MUX_uxn_c_l179_c9_df78_iffalse,
pixel_counter_MUX_uxn_c_l179_c9_df78_return_output);

-- fill_pixels_remaining_MUX_uxn_c_l179_c9_df78
fill_pixels_remaining_MUX_uxn_c_l179_c9_df78 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
fill_pixels_remaining_MUX_uxn_c_l179_c9_df78_cond,
fill_pixels_remaining_MUX_uxn_c_l179_c9_df78_iftrue,
fill_pixels_remaining_MUX_uxn_c_l179_c9_df78_iffalse,
fill_pixels_remaining_MUX_uxn_c_l179_c9_df78_return_output);

-- result_is_new_frame_MUX_uxn_c_l179_c9_df78
result_is_new_frame_MUX_uxn_c_l179_c9_df78 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_new_frame_MUX_uxn_c_l179_c9_df78_cond,
result_is_new_frame_MUX_uxn_c_l179_c9_df78_iftrue,
result_is_new_frame_MUX_uxn_c_l179_c9_df78_iffalse,
result_is_new_frame_MUX_uxn_c_l179_c9_df78_return_output);

-- BIN_OP_PLUS_uxn_c_l181_c3_3a72
BIN_OP_PLUS_uxn_c_l181_c3_3a72 : entity work.BIN_OP_PLUS_uint32_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l181_c3_3a72_left,
BIN_OP_PLUS_uxn_c_l181_c3_3a72_right,
BIN_OP_PLUS_uxn_c_l181_c3_3a72_return_output);

-- BIN_OP_EQ_uxn_c_l182_c27_56a6
BIN_OP_EQ_uxn_c_l182_c27_56a6 : entity work.BIN_OP_EQ_uint32_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l182_c27_56a6_left,
BIN_OP_EQ_uxn_c_l182_c27_56a6_right,
BIN_OP_EQ_uxn_c_l182_c27_56a6_return_output);

-- BIN_OP_MINUS_uxn_c_l182_c60_c649
BIN_OP_MINUS_uxn_c_l182_c60_c649 : entity work.BIN_OP_MINUS_uint32_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l182_c60_c649_left,
BIN_OP_MINUS_uxn_c_l182_c60_c649_right,
BIN_OP_MINUS_uxn_c_l182_c60_c649_return_output);

-- MUX_uxn_c_l182_c27_9d8f
MUX_uxn_c_l182_c27_9d8f : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
MUX_uxn_c_l182_c27_9d8f_cond,
MUX_uxn_c_l182_c27_9d8f_iftrue,
MUX_uxn_c_l182_c27_9d8f_iffalse,
MUX_uxn_c_l182_c27_9d8f_return_output);

-- BIN_OP_EQ_uxn_c_l185_c17_dc11
BIN_OP_EQ_uxn_c_l185_c17_dc11 : entity work.BIN_OP_EQ_uint2_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l185_c17_dc11_left,
BIN_OP_EQ_uxn_c_l185_c17_dc11_right,
BIN_OP_EQ_uxn_c_l185_c17_dc11_return_output);

-- MUX_uxn_c_l185_c17_a869
MUX_uxn_c_l185_c17_a869 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
MUX_uxn_c_l185_c17_a869_cond,
MUX_uxn_c_l185_c17_a869_iftrue,
MUX_uxn_c_l185_c17_a869_iffalse,
MUX_uxn_c_l185_c17_a869_return_output);

-- UNARY_OP_NOT_uint1_t_uxn_c_l172_l165_DUPLICATE_8568
UNARY_OP_NOT_uint1_t_uxn_c_l172_l165_DUPLICATE_8568 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uint1_t_uxn_c_l172_l165_DUPLICATE_8568_expr,
UNARY_OP_NOT_uint1_t_uxn_c_l172_l165_DUPLICATE_8568_return_output);

-- BIN_OP_AND_uint1_t_uint1_t_uxn_c_l172_l165_DUPLICATE_0cc0
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l172_l165_DUPLICATE_0cc0 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l172_l165_DUPLICATE_0cc0_left,
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l172_l165_DUPLICATE_0cc0_right,
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l172_l165_DUPLICATE_0cc0_return_output);



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
 BIN_OP_GT_uxn_c_l126_c26_7732_return_output,
 MUX_uxn_c_l126_c26_78dd_return_output,
 CONST_SR_28_uxn_c_l127_c24_7066_return_output,
 BIN_OP_EQ_uxn_c_l128_c17_ea4b_return_output,
 MUX_uxn_c_l128_c17_1e1d_return_output,
 BIN_OP_DIV_uxn_c_l129_c6_8b80_return_output,
 BIN_OP_INFERRED_MULT_uxn_c_l130_c23_6f80_return_output,
 BIN_OP_MINUS_uxn_c_l130_c6_4327_return_output,
 UNARY_OP_NOT_uxn_c_l133_c22_2281_return_output,
 BIN_OP_AND_uxn_c_l133_c6_bd9a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l133_c1_bc14_return_output,
 is_fill_left_MUX_uxn_c_l133_c2_bbc1_return_output,
 fill_layer_MUX_uxn_c_l133_c2_bbc1_return_output,
 fill_color_MUX_uxn_c_l133_c2_bbc1_return_output,
 fill_pixels_remaining_MUX_uxn_c_l133_c2_bbc1_return_output,
 fill_x1_MUX_uxn_c_l133_c2_bbc1_return_output,
 fill_y1_MUX_uxn_c_l133_c2_bbc1_return_output,
 fill_y0_MUX_uxn_c_l133_c2_bbc1_return_output,
 is_fill_top_MUX_uxn_c_l133_c2_bbc1_return_output,
 fill_x0_MUX_uxn_c_l133_c2_bbc1_return_output,
 CONST_SR_20_uxn_c_l135_c18_b74d_return_output,
 CONST_SR_21_uxn_c_l136_c17_fc88_return_output,
 BIN_OP_AND_uxn_c_l137_c27_deb1_return_output,
 BIN_OP_DIV_uxn_c_l138_c13_2724_return_output,
 BIN_OP_INFERRED_MULT_uxn_c_l139_c38_5d0c_return_output,
 BIN_OP_MINUS_uxn_c_l139_c13_c939_return_output,
 MUX_uxn_c_l140_c13_98c1_return_output,
 MUX_uxn_c_l141_c13_97f1_return_output,
 MUX_uxn_c_l142_c13_c3e3_return_output,
 MUX_uxn_c_l143_c13_bbc3_return_output,
 BIN_OP_EQ_uxn_c_l150_c19_97ce_return_output,
 MUX_uxn_c_l150_c19_adb2_return_output,
 BIN_OP_GT_uxn_c_l152_c17_bb5e_return_output,
 BIN_OP_LT_uxn_c_l153_c17_7565_return_output,
 BIN_OP_GT_uxn_c_l154_c17_6a03_return_output,
 BIN_OP_LT_uxn_c_l155_c17_5d64_return_output,
 BIN_OP_AND_uxn_c_l157_c18_e0a0_return_output,
 BIN_OP_AND_uxn_c_l157_c18_f6be_return_output,
 BIN_OP_AND_uxn_c_l157_c18_37d5_return_output,
 BIN_OP_AND_uxn_c_l157_c18_66df_return_output,
 UNARY_OP_NOT_uxn_c_l158_c37_7cf2_return_output,
 BIN_OP_AND_uxn_c_l158_c19_3764_return_output,
 BIN_OP_AND_uxn_c_l159_c19_fb6a_return_output,
 MUX_uxn_c_l163_c37_efa7_return_output,
 MUX_uxn_c_l163_c3_9d1e_return_output,
 MUX_uxn_c_l164_c3_fd98_return_output,
 UNARY_OP_NOT_uxn_c_l165_c57_8e60_return_output,
 BIN_OP_AND_uxn_c_l165_c22_115c_return_output,
 BIN_OP_OR_uxn_c_l165_c3_74f3_return_output,
 bg_vram_update_uxn_c_l161_c19_e18d_return_output,
 MUX_uxn_c_l170_c37_886b_return_output,
 MUX_uxn_c_l170_c3_644e_return_output,
 MUX_uxn_c_l171_c3_5b03_return_output,
 BIN_OP_AND_uxn_c_l172_c22_238d_return_output,
 BIN_OP_OR_uxn_c_l172_c3_e2e6_return_output,
 fg_vram_update_uxn_c_l168_c19_2c6d_return_output,
 BIN_OP_EQ_uxn_c_l176_c6_3921_return_output,
 pixel_counter_MUX_uxn_c_l176_c2_de08_return_output,
 fill_pixels_remaining_MUX_uxn_c_l176_c2_de08_return_output,
 result_is_new_frame_MUX_uxn_c_l176_c2_de08_return_output,
 pixel_counter_MUX_uxn_c_l179_c9_df78_return_output,
 fill_pixels_remaining_MUX_uxn_c_l179_c9_df78_return_output,
 result_is_new_frame_MUX_uxn_c_l179_c9_df78_return_output,
 BIN_OP_PLUS_uxn_c_l181_c3_3a72_return_output,
 BIN_OP_EQ_uxn_c_l182_c27_56a6_return_output,
 BIN_OP_MINUS_uxn_c_l182_c60_c649_return_output,
 MUX_uxn_c_l182_c27_9d8f_return_output,
 BIN_OP_EQ_uxn_c_l185_c17_dc11_return_output,
 MUX_uxn_c_l185_c17_a869_return_output,
 UNARY_OP_NOT_uint1_t_uxn_c_l172_l165_DUPLICATE_8568_return_output,
 BIN_OP_AND_uint1_t_uint1_t_uxn_c_l172_l165_DUPLICATE_0cc0_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : gpu_step_result_t;
 variable VAR_is_active_drawing_area : unsigned(0 downto 0);
 variable VAR_is_vram_write : unsigned(0 downto 0);
 variable VAR_vram_write_layer : unsigned(0 downto 0);
 variable VAR_vram_address : unsigned(31 downto 0);
 variable VAR_vram_value : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l126_c26_78dd_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l126_c26_78dd_iftrue : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l126_c26_78dd_iffalse : unsigned(31 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l126_c26_7732_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l126_c26_7732_right : unsigned(17 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l126_c26_7732_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l126_c26_78dd_return_output : unsigned(31 downto 0);
 variable VAR_CONST_SR_28_uxn_c_l127_c24_7066_return_output : unsigned(31 downto 0);
 variable VAR_CONST_SR_28_uxn_c_l127_c24_7066_x : unsigned(31 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_c_l127_c14_2203_return_output : unsigned(3 downto 0);
 variable VAR_MUX_uxn_c_l128_c17_1e1d_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l128_c17_1e1d_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l128_c17_1e1d_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l128_c17_ea4b_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l128_c17_ea4b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l128_c17_ea4b_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l128_c17_1e1d_return_output : unsigned(0 downto 0);
 variable VAR_y_uxn_c_l129_c2_6569 : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_c_l129_c6_8b80_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_DIV_uxn_c_l129_c6_8b80_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_DIV_uxn_c_l129_c6_8b80_return_output : unsigned(31 downto 0);
 variable VAR_x_uxn_c_l130_c2_409b : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l130_c6_4327_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l130_c23_6f80_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l130_c23_6f80_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l130_c23_6f80_return_output : unsigned(24 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l130_c6_4327_right : unsigned(24 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l130_c6_4327_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l133_c6_bd9a_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l133_c22_2281_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l133_c22_2281_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l133_c6_bd9a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l133_c6_bd9a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l133_c1_bc14_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l133_c1_bc14_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l133_c1_bc14_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l133_c1_bc14_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_left_MUX_uxn_c_l133_c2_bbc1_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_left_uxn_c_l135_c3_1f62 : unsigned(0 downto 0);
 variable VAR_is_fill_left_MUX_uxn_c_l133_c2_bbc1_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_left_MUX_uxn_c_l133_c2_bbc1_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_left_MUX_uxn_c_l133_c2_bbc1_cond : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l133_c2_bbc1_iftrue : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l133_c2_bbc1_iffalse : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l133_c2_bbc1_return_output : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l133_c2_bbc1_cond : unsigned(0 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l133_c2_bbc1_iftrue : unsigned(1 downto 0);
 variable VAR_fill_color_uxn_c_l145_c3_1831 : unsigned(1 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l133_c2_bbc1_iffalse : unsigned(1 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l133_c2_bbc1_return_output : unsigned(1 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l133_c2_bbc1_cond : unsigned(0 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l133_c2_bbc1_iftrue : unsigned(31 downto 0);
 variable VAR_fill_pixels_remaining_uxn_c_l146_c3_7a15 : unsigned(31 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l133_c2_bbc1_iffalse : unsigned(31 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l133_c2_bbc1_return_output : unsigned(31 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l133_c2_bbc1_cond : unsigned(0 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l133_c2_bbc1_iftrue : unsigned(15 downto 0);
 variable VAR_fill_x1_uxn_c_l141_c3_7e25 : unsigned(15 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l133_c2_bbc1_iffalse : unsigned(15 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l133_c2_bbc1_return_output : unsigned(15 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l133_c2_bbc1_cond : unsigned(0 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l133_c2_bbc1_iftrue : unsigned(15 downto 0);
 variable VAR_fill_y1_uxn_c_l140_c3_312e : unsigned(15 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l133_c2_bbc1_iffalse : unsigned(15 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l133_c2_bbc1_return_output : unsigned(15 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l133_c2_bbc1_cond : unsigned(0 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l133_c2_bbc1_iftrue : unsigned(15 downto 0);
 variable VAR_fill_y0_uxn_c_l142_c3_cd62 : unsigned(15 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l133_c2_bbc1_iffalse : unsigned(15 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l133_c2_bbc1_return_output : unsigned(15 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l133_c2_bbc1_cond : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l133_c2_bbc1_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_top_uxn_c_l136_c3_b309 : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l133_c2_bbc1_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l133_c2_bbc1_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l133_c2_bbc1_cond : unsigned(0 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l133_c2_bbc1_iftrue : unsigned(15 downto 0);
 variable VAR_fill_x0_uxn_c_l143_c3_cf78 : unsigned(15 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l133_c2_bbc1_iffalse : unsigned(15 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l133_c2_bbc1_return_output : unsigned(15 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l133_c2_bbc1_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_20_uxn_c_l135_c18_b74d_return_output : unsigned(31 downto 0);
 variable VAR_CONST_SR_20_uxn_c_l135_c18_b74d_x : unsigned(31 downto 0);
 variable VAR_CONST_SR_21_uxn_c_l136_c17_fc88_return_output : unsigned(31 downto 0);
 variable VAR_CONST_SR_21_uxn_c_l136_c17_fc88_x : unsigned(31 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l137_c27_deb1_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l137_c27_deb1_right : unsigned(17 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l137_c27_deb1_return_output : unsigned(31 downto 0);
 variable VAR_fill_y0_uxn_c_l138_c3_c105 : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_c_l138_c13_2724_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_DIV_uxn_c_l138_c13_2724_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_DIV_uxn_c_l138_c13_2724_return_output : unsigned(31 downto 0);
 variable VAR_fill_x0_uxn_c_l139_c3_4ce1 : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l139_c13_c939_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l139_c38_5d0c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l139_c38_5d0c_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l139_c38_5d0c_return_output : unsigned(24 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l139_c13_c939_right : unsigned(24 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l139_c13_c939_return_output : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l140_c13_98c1_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l140_c13_98c1_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l140_c13_98c1_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l140_c13_98c1_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l141_c13_97f1_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l141_c13_97f1_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l141_c13_97f1_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l141_c13_97f1_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l142_c13_c3e3_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l142_c13_c3e3_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l142_c13_c3e3_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l142_c13_c3e3_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l143_c13_bbc3_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l143_c13_bbc3_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l143_c13_bbc3_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l143_c13_bbc3_return_output : unsigned(15 downto 0);
 variable VAR_printf_uxn_c_l147_c3_482a_uxn_c_l147_c3_482a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l147_c3_482a_uxn_c_l147_c3_482a_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l147_c3_482a_uxn_c_l147_c3_482a_arg1 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l147_c3_482a_uxn_c_l147_c3_482a_arg2 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l147_c3_482a_uxn_c_l147_c3_482a_arg3 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l147_c3_482a_uxn_c_l147_c3_482a_arg4 : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l150_c19_adb2_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l150_c19_adb2_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l150_c19_adb2_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l150_c19_97ce_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l150_c19_97ce_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l150_c19_97ce_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l150_c19_adb2_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l152_c17_bb5e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l152_c17_bb5e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l152_c17_bb5e_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_LT_uxn_c_l153_c17_7565_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_c_l153_c17_7565_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_c_l153_c17_7565_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l154_c17_6a03_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l154_c17_6a03_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l154_c17_6a03_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_LT_uxn_c_l155_c17_5d64_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_c_l155_c17_5d64_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_c_l155_c17_5d64_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l157_c18_e0a0_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l157_c18_e0a0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l157_c18_e0a0_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l157_c18_f6be_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l157_c18_f6be_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l157_c18_f6be_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l157_c18_37d5_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l157_c18_37d5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l157_c18_37d5_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l157_c18_66df_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l157_c18_66df_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l157_c18_66df_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l158_c19_3764_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l158_c37_7cf2_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l158_c37_7cf2_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l158_c19_3764_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l158_c19_3764_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l159_c19_fb6a_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l159_c19_fb6a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l159_c19_fb6a_return_output : unsigned(0 downto 0);
 variable VAR_bg_vram_update_uxn_c_l161_c19_e18d_read_address : unsigned(31 downto 0);
 variable VAR_bg_vram_update_uxn_c_l161_c19_e18d_write_address : unsigned(31 downto 0);
 variable VAR_bg_vram_update_uxn_c_l161_c19_e18d_write_value : unsigned(1 downto 0);
 variable VAR_bg_vram_update_uxn_c_l161_c19_e18d_write_enable : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l163_c3_9d1e_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l163_c3_9d1e_iftrue : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l163_c3_9d1e_iffalse : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l163_c37_efa7_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l163_c37_efa7_iftrue : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l163_c37_efa7_iffalse : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l163_c37_efa7_return_output : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l163_c3_9d1e_return_output : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l164_c3_fd98_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l164_c3_fd98_iftrue : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l164_c3_fd98_iffalse : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l164_c3_fd98_return_output : unsigned(1 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l165_c3_74f3_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l165_c22_115c_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l165_c57_8e60_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l165_c57_8e60_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l165_c22_115c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l165_c22_115c_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l165_c3_74f3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l165_c3_74f3_return_output : unsigned(0 downto 0);
 variable VAR_bg_vram_update_uxn_c_l161_c19_e18d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_bg_vram_update_uxn_c_l161_c19_e18d_return_output : unsigned(1 downto 0);
 variable VAR_fg_vram_update_uxn_c_l168_c19_2c6d_read_address : unsigned(31 downto 0);
 variable VAR_fg_vram_update_uxn_c_l168_c19_2c6d_write_address : unsigned(31 downto 0);
 variable VAR_fg_vram_update_uxn_c_l168_c19_2c6d_write_value : unsigned(1 downto 0);
 variable VAR_fg_vram_update_uxn_c_l168_c19_2c6d_write_enable : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l170_c3_644e_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l170_c3_644e_iftrue : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l170_c3_644e_iffalse : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l170_c37_886b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l170_c37_886b_iftrue : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l170_c37_886b_iffalse : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l170_c37_886b_return_output : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l170_c3_644e_return_output : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l171_c3_5b03_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l171_c3_5b03_iftrue : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l171_c3_5b03_iffalse : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l171_c3_5b03_return_output : unsigned(1 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l172_c3_e2e6_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l172_c22_238d_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l172_c22_238d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l172_c22_238d_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l172_c3_e2e6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l172_c3_e2e6_return_output : unsigned(0 downto 0);
 variable VAR_fg_vram_update_uxn_c_l168_c19_2c6d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_fg_vram_update_uxn_c_l168_c19_2c6d_return_output : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l176_c6_3921_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l176_c6_3921_right : unsigned(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l176_c6_3921_return_output : unsigned(0 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l176_c2_de08_iftrue : unsigned(31 downto 0);
 variable VAR_pixel_counter_uxn_c_l177_c3_7040 : unsigned(31 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l176_c2_de08_iffalse : unsigned(31 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l179_c9_df78_return_output : unsigned(31 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l176_c2_de08_return_output : unsigned(31 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l176_c2_de08_cond : unsigned(0 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l176_c2_de08_iftrue : unsigned(31 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l176_c2_de08_iffalse : unsigned(31 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l179_c9_df78_return_output : unsigned(31 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l176_c2_de08_return_output : unsigned(31 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l176_c2_de08_cond : unsigned(0 downto 0);
 variable VAR_result_is_new_frame_MUX_uxn_c_l176_c2_de08_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_new_frame_MUX_uxn_c_l176_c2_de08_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_new_frame_MUX_uxn_c_l179_c9_df78_return_output : unsigned(0 downto 0);
 variable VAR_result_is_new_frame_MUX_uxn_c_l176_c2_de08_return_output : unsigned(0 downto 0);
 variable VAR_result_is_new_frame_MUX_uxn_c_l176_c2_de08_cond : unsigned(0 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l179_c9_df78_iftrue : unsigned(31 downto 0);
 variable VAR_pixel_counter_uxn_c_l181_c3_0cc9 : unsigned(31 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l179_c9_df78_iffalse : unsigned(31 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l179_c9_df78_cond : unsigned(0 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l179_c9_df78_iftrue : unsigned(31 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l179_c9_df78_iffalse : unsigned(31 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l179_c9_df78_cond : unsigned(0 downto 0);
 variable VAR_result_is_new_frame_MUX_uxn_c_l179_c9_df78_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_new_frame_MUX_uxn_c_l179_c9_df78_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_new_frame_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_gpu_step_result_t_is_new_frame_d41d_uxn_c_l179_c9_df78_return_output : unsigned(0 downto 0);
 variable VAR_result_is_new_frame_MUX_uxn_c_l179_c9_df78_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l181_c3_3a72_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l181_c3_3a72_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l181_c3_3a72_return_output : unsigned(32 downto 0);
 variable VAR_MUX_uxn_c_l182_c27_9d8f_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l182_c27_9d8f_iftrue : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l182_c27_9d8f_iffalse : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l182_c27_56a6_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l182_c27_56a6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l182_c27_56a6_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l182_c60_c649_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l182_c60_c649_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l182_c60_c649_return_output : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l182_c27_9d8f_return_output : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l185_c17_a869_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l185_c17_a869_iftrue : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l185_c17_a869_iffalse : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l185_c17_dc11_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l185_c17_dc11_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l185_c17_dc11_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l185_c17_a869_return_output : unsigned(1 downto 0);
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_c_l172_l165_DUPLICATE_8568_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_c_l172_l165_DUPLICATE_8568_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l172_l165_DUPLICATE_0cc0_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l172_l165_DUPLICATE_0cc0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l172_l165_DUPLICATE_0cc0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_269d_uxn_c_l188_l111_DUPLICATE_ef9d_return_output : gpu_step_result_t;
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
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l139_c38_5d0c_right := to_unsigned(400, 9);
     VAR_fill_pixels_remaining_uxn_c_l146_c3_7a15 := resize(to_unsigned(143999, 18), 32);
     VAR_fill_pixels_remaining_MUX_uxn_c_l133_c2_bbc1_iftrue := VAR_fill_pixels_remaining_uxn_c_l146_c3_7a15;
     VAR_result_is_new_frame_MUX_uxn_c_l179_c9_df78_iftrue := to_unsigned(0, 1);
     VAR_result_is_new_frame_MUX_uxn_c_l176_c2_de08_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l142_c13_c3e3_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_BIN_OP_EQ_uxn_c_l182_c27_56a6_right := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l143_c13_bbc3_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l130_c23_6f80_right := to_unsigned(400, 9);
     VAR_pixel_counter_uxn_c_l177_c3_7040 := resize(to_unsigned(0, 1), 32);
     VAR_pixel_counter_MUX_uxn_c_l176_c2_de08_iftrue := VAR_pixel_counter_uxn_c_l177_c3_7040;
     VAR_BIN_OP_MINUS_uxn_c_l182_c60_c649_right := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l133_c1_bc14_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l185_c17_dc11_right := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_c_l126_c26_7732_right := to_unsigned(143999, 18);
     VAR_MUX_uxn_c_l150_c19_adb2_iffalse := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l126_c26_78dd_iftrue := resize(to_unsigned(0, 1), 32);
     VAR_MUX_uxn_c_l128_c17_1e1d_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l128_c17_1e1d_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_DIV_uxn_c_l129_c6_8b80_right := to_unsigned(400, 9);
     VAR_MUX_uxn_c_l150_c19_adb2_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l163_c37_efa7_iftrue := resize(to_unsigned(0, 1), 32);
     VAR_BIN_OP_PLUS_uxn_c_l181_c3_3a72_right := to_unsigned(1, 1);
     VAR_BIN_OP_DIV_uxn_c_l138_c13_2724_right := to_unsigned(400, 9);
     VAR_BIN_OP_EQ_uxn_c_l176_c6_3921_right := to_unsigned(143999, 18);
     VAR_MUX_uxn_c_l141_c13_97f1_iffalse := resize(to_unsigned(399, 9), 16);
     VAR_BIN_OP_EQ_uxn_c_l150_c19_97ce_right := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l170_c37_886b_iftrue := resize(to_unsigned(0, 1), 32);
     VAR_BIN_OP_AND_uxn_c_l137_c27_deb1_right := to_unsigned(262143, 18);
     VAR_MUX_uxn_c_l140_c13_98c1_iffalse := resize(to_unsigned(359, 9), 16);
     VAR_MUX_uxn_c_l182_c27_9d8f_iftrue := resize(to_unsigned(0, 1), 32);
     VAR_BIN_OP_EQ_uxn_c_l128_c17_ea4b_right := to_unsigned(15, 4);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l133_c1_bc14_iftrue := VAR_CLOCK_ENABLE;
     VAR_bg_vram_update_uxn_c_l161_c19_e18d_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_fg_vram_update_uxn_c_l168_c19_2c6d_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_fill_color_MUX_uxn_c_l133_c2_bbc1_iffalse := fill_color;
     VAR_fill_layer_MUX_uxn_c_l133_c2_bbc1_iffalse := fill_layer;
     VAR_fill_pixels_remaining_MUX_uxn_c_l133_c2_bbc1_iffalse := fill_pixels_remaining;
     VAR_fill_x0_MUX_uxn_c_l133_c2_bbc1_iffalse := fill_x0;
     VAR_fill_x1_MUX_uxn_c_l133_c2_bbc1_iffalse := fill_x1;
     VAR_fill_y0_MUX_uxn_c_l133_c2_bbc1_iffalse := fill_y0;
     VAR_fill_y1_MUX_uxn_c_l133_c2_bbc1_iffalse := fill_y1;
     VAR_fill_pixels_remaining_MUX_uxn_c_l179_c9_df78_cond := VAR_is_active_drawing_area;
     VAR_pixel_counter_MUX_uxn_c_l179_c9_df78_cond := VAR_is_active_drawing_area;
     VAR_result_is_new_frame_MUX_uxn_c_l179_c9_df78_cond := VAR_is_active_drawing_area;
     VAR_UNARY_OP_NOT_uxn_c_l133_c22_2281_expr := is_fill_active;
     VAR_is_fill_left_MUX_uxn_c_l133_c2_bbc1_iffalse := is_fill_left;
     VAR_is_fill_top_MUX_uxn_c_l133_c2_bbc1_iffalse := is_fill_top;
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l172_l165_DUPLICATE_0cc0_right := VAR_is_vram_write;
     VAR_BIN_OP_DIV_uxn_c_l129_c6_8b80_left := pixel_counter;
     VAR_BIN_OP_EQ_uxn_c_l176_c6_3921_left := pixel_counter;
     VAR_BIN_OP_MINUS_uxn_c_l130_c6_4327_left := pixel_counter;
     VAR_BIN_OP_PLUS_uxn_c_l181_c3_3a72_left := pixel_counter;
     VAR_MUX_uxn_c_l163_c3_9d1e_iftrue := pixel_counter;
     VAR_MUX_uxn_c_l170_c3_644e_iftrue := pixel_counter;
     VAR_bg_vram_update_uxn_c_l161_c19_e18d_read_address := pixel_counter;
     VAR_fg_vram_update_uxn_c_l168_c19_2c6d_read_address := pixel_counter;
     VAR_pixel_counter_MUX_uxn_c_l179_c9_df78_iffalse := pixel_counter;
     VAR_BIN_OP_AND_uxn_c_l137_c27_deb1_left := VAR_vram_address;
     VAR_BIN_OP_GT_uxn_c_l126_c26_7732_left := VAR_vram_address;
     VAR_CONST_SR_20_uxn_c_l135_c18_b74d_x := VAR_vram_address;
     VAR_CONST_SR_21_uxn_c_l136_c17_fc88_x := VAR_vram_address;
     VAR_CONST_SR_28_uxn_c_l127_c24_7066_x := VAR_vram_address;
     VAR_MUX_uxn_c_l126_c26_78dd_iffalse := VAR_vram_address;
     VAR_MUX_uxn_c_l164_c3_fd98_iffalse := VAR_vram_value;
     VAR_MUX_uxn_c_l171_c3_5b03_iffalse := VAR_vram_value;
     VAR_fill_color_uxn_c_l145_c3_1831 := VAR_vram_value;
     VAR_BIN_OP_AND_uxn_c_l172_c22_238d_right := VAR_vram_write_layer;
     VAR_UNARY_OP_NOT_uxn_c_l165_c57_8e60_expr := VAR_vram_write_layer;
     VAR_fill_layer_MUX_uxn_c_l133_c2_bbc1_iftrue := VAR_vram_write_layer;
     VAR_fill_color_MUX_uxn_c_l133_c2_bbc1_iftrue := VAR_fill_color_uxn_c_l145_c3_1831;
     VAR_printf_uxn_c_l147_c3_482a_uxn_c_l147_c3_482a_arg4 := resize(VAR_fill_color_uxn_c_l145_c3_1831, 32);
     -- CONST_SR_20[uxn_c_l135_c18_b74d] LATENCY=0
     -- Inputs
     CONST_SR_20_uxn_c_l135_c18_b74d_x <= VAR_CONST_SR_20_uxn_c_l135_c18_b74d_x;
     -- Outputs
     VAR_CONST_SR_20_uxn_c_l135_c18_b74d_return_output := CONST_SR_20_uxn_c_l135_c18_b74d_return_output;

     -- BIN_OP_DIV[uxn_c_l129_c6_8b80] LATENCY=0
     -- Inputs
     BIN_OP_DIV_uxn_c_l129_c6_8b80_left <= VAR_BIN_OP_DIV_uxn_c_l129_c6_8b80_left;
     BIN_OP_DIV_uxn_c_l129_c6_8b80_right <= VAR_BIN_OP_DIV_uxn_c_l129_c6_8b80_right;
     -- Outputs
     VAR_BIN_OP_DIV_uxn_c_l129_c6_8b80_return_output := BIN_OP_DIV_uxn_c_l129_c6_8b80_return_output;

     -- CONST_SR_21[uxn_c_l136_c17_fc88] LATENCY=0
     -- Inputs
     CONST_SR_21_uxn_c_l136_c17_fc88_x <= VAR_CONST_SR_21_uxn_c_l136_c17_fc88_x;
     -- Outputs
     VAR_CONST_SR_21_uxn_c_l136_c17_fc88_return_output := CONST_SR_21_uxn_c_l136_c17_fc88_return_output;

     -- BIN_OP_GT[uxn_c_l126_c26_7732] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_c_l126_c26_7732_left <= VAR_BIN_OP_GT_uxn_c_l126_c26_7732_left;
     BIN_OP_GT_uxn_c_l126_c26_7732_right <= VAR_BIN_OP_GT_uxn_c_l126_c26_7732_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_c_l126_c26_7732_return_output := BIN_OP_GT_uxn_c_l126_c26_7732_return_output;

     -- BIN_OP_EQ[uxn_c_l176_c6_3921] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l176_c6_3921_left <= VAR_BIN_OP_EQ_uxn_c_l176_c6_3921_left;
     BIN_OP_EQ_uxn_c_l176_c6_3921_right <= VAR_BIN_OP_EQ_uxn_c_l176_c6_3921_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l176_c6_3921_return_output := BIN_OP_EQ_uxn_c_l176_c6_3921_return_output;

     -- UNARY_OP_NOT[uxn_c_l165_c57_8e60] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l165_c57_8e60_expr <= VAR_UNARY_OP_NOT_uxn_c_l165_c57_8e60_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l165_c57_8e60_return_output := UNARY_OP_NOT_uxn_c_l165_c57_8e60_return_output;

     -- UNARY_OP_NOT[uxn_c_l133_c22_2281] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l133_c22_2281_expr <= VAR_UNARY_OP_NOT_uxn_c_l133_c22_2281_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l133_c22_2281_return_output := UNARY_OP_NOT_uxn_c_l133_c22_2281_return_output;

     -- result_is_new_frame_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_gpu_step_result_t_is_new_frame_d41d[uxn_c_l179_c9_df78] LATENCY=0
     VAR_result_is_new_frame_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_gpu_step_result_t_is_new_frame_d41d_uxn_c_l179_c9_df78_return_output := result.is_new_frame;

     -- BIN_OP_PLUS[uxn_c_l181_c3_3a72] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l181_c3_3a72_left <= VAR_BIN_OP_PLUS_uxn_c_l181_c3_3a72_left;
     BIN_OP_PLUS_uxn_c_l181_c3_3a72_right <= VAR_BIN_OP_PLUS_uxn_c_l181_c3_3a72_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l181_c3_3a72_return_output := BIN_OP_PLUS_uxn_c_l181_c3_3a72_return_output;

     -- BIN_OP_AND[uxn_c_l137_c27_deb1] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l137_c27_deb1_left <= VAR_BIN_OP_AND_uxn_c_l137_c27_deb1_left;
     BIN_OP_AND_uxn_c_l137_c27_deb1_right <= VAR_BIN_OP_AND_uxn_c_l137_c27_deb1_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l137_c27_deb1_return_output := BIN_OP_AND_uxn_c_l137_c27_deb1_return_output;

     -- CONST_SR_28[uxn_c_l127_c24_7066] LATENCY=0
     -- Inputs
     CONST_SR_28_uxn_c_l127_c24_7066_x <= VAR_CONST_SR_28_uxn_c_l127_c24_7066_x;
     -- Outputs
     VAR_CONST_SR_28_uxn_c_l127_c24_7066_return_output := CONST_SR_28_uxn_c_l127_c24_7066_return_output;

     -- Submodule level 1
     VAR_BIN_OP_DIV_uxn_c_l138_c13_2724_left := VAR_BIN_OP_AND_uxn_c_l137_c27_deb1_return_output;
     VAR_BIN_OP_MINUS_uxn_c_l139_c13_c939_left := VAR_BIN_OP_AND_uxn_c_l137_c27_deb1_return_output;
     VAR_y_uxn_c_l129_c2_6569 := resize(VAR_BIN_OP_DIV_uxn_c_l129_c6_8b80_return_output, 16);
     VAR_fill_pixels_remaining_MUX_uxn_c_l176_c2_de08_cond := VAR_BIN_OP_EQ_uxn_c_l176_c6_3921_return_output;
     VAR_pixel_counter_MUX_uxn_c_l176_c2_de08_cond := VAR_BIN_OP_EQ_uxn_c_l176_c6_3921_return_output;
     VAR_result_is_new_frame_MUX_uxn_c_l176_c2_de08_cond := VAR_BIN_OP_EQ_uxn_c_l176_c6_3921_return_output;
     VAR_MUX_uxn_c_l126_c26_78dd_cond := VAR_BIN_OP_GT_uxn_c_l126_c26_7732_return_output;
     VAR_pixel_counter_uxn_c_l181_c3_0cc9 := resize(VAR_BIN_OP_PLUS_uxn_c_l181_c3_3a72_return_output, 32);
     VAR_is_fill_left_uxn_c_l135_c3_1f62 := resize(VAR_CONST_SR_20_uxn_c_l135_c18_b74d_return_output, 1);
     VAR_is_fill_top_uxn_c_l136_c3_b309 := resize(VAR_CONST_SR_21_uxn_c_l136_c17_fc88_return_output, 1);
     VAR_BIN_OP_AND_uxn_c_l133_c6_bd9a_right := VAR_UNARY_OP_NOT_uxn_c_l133_c22_2281_return_output;
     VAR_BIN_OP_AND_uxn_c_l165_c22_115c_right := VAR_UNARY_OP_NOT_uxn_c_l165_c57_8e60_return_output;
     VAR_result_is_new_frame_MUX_uxn_c_l179_c9_df78_iffalse := VAR_result_is_new_frame_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_gpu_step_result_t_is_new_frame_d41d_uxn_c_l179_c9_df78_return_output;
     VAR_MUX_uxn_c_l141_c13_97f1_cond := VAR_is_fill_left_uxn_c_l135_c3_1f62;
     VAR_MUX_uxn_c_l143_c13_bbc3_cond := VAR_is_fill_left_uxn_c_l135_c3_1f62;
     VAR_is_fill_left_MUX_uxn_c_l133_c2_bbc1_iftrue := VAR_is_fill_left_uxn_c_l135_c3_1f62;
     VAR_MUX_uxn_c_l140_c13_98c1_cond := VAR_is_fill_top_uxn_c_l136_c3_b309;
     VAR_MUX_uxn_c_l142_c13_c3e3_cond := VAR_is_fill_top_uxn_c_l136_c3_b309;
     VAR_is_fill_top_MUX_uxn_c_l133_c2_bbc1_iftrue := VAR_is_fill_top_uxn_c_l136_c3_b309;
     VAR_pixel_counter_MUX_uxn_c_l179_c9_df78_iftrue := VAR_pixel_counter_uxn_c_l181_c3_0cc9;
     VAR_BIN_OP_GT_uxn_c_l154_c17_6a03_left := VAR_y_uxn_c_l129_c2_6569;
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l130_c23_6f80_left := VAR_y_uxn_c_l129_c2_6569;
     VAR_BIN_OP_LT_uxn_c_l155_c17_5d64_left := VAR_y_uxn_c_l129_c2_6569;
     REG_VAR_y := VAR_y_uxn_c_l129_c2_6569;
     -- BIN_OP_DIV[uxn_c_l138_c13_2724] LATENCY=0
     -- Inputs
     BIN_OP_DIV_uxn_c_l138_c13_2724_left <= VAR_BIN_OP_DIV_uxn_c_l138_c13_2724_left;
     BIN_OP_DIV_uxn_c_l138_c13_2724_right <= VAR_BIN_OP_DIV_uxn_c_l138_c13_2724_right;
     -- Outputs
     VAR_BIN_OP_DIV_uxn_c_l138_c13_2724_return_output := BIN_OP_DIV_uxn_c_l138_c13_2724_return_output;

     -- pixel_counter_MUX[uxn_c_l179_c9_df78] LATENCY=0
     -- Inputs
     pixel_counter_MUX_uxn_c_l179_c9_df78_cond <= VAR_pixel_counter_MUX_uxn_c_l179_c9_df78_cond;
     pixel_counter_MUX_uxn_c_l179_c9_df78_iftrue <= VAR_pixel_counter_MUX_uxn_c_l179_c9_df78_iftrue;
     pixel_counter_MUX_uxn_c_l179_c9_df78_iffalse <= VAR_pixel_counter_MUX_uxn_c_l179_c9_df78_iffalse;
     -- Outputs
     VAR_pixel_counter_MUX_uxn_c_l179_c9_df78_return_output := pixel_counter_MUX_uxn_c_l179_c9_df78_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_c_l130_c23_6f80] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_c_l130_c23_6f80_left <= VAR_BIN_OP_INFERRED_MULT_uxn_c_l130_c23_6f80_left;
     BIN_OP_INFERRED_MULT_uxn_c_l130_c23_6f80_right <= VAR_BIN_OP_INFERRED_MULT_uxn_c_l130_c23_6f80_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l130_c23_6f80_return_output := BIN_OP_INFERRED_MULT_uxn_c_l130_c23_6f80_return_output;

     -- MUX[uxn_c_l126_c26_78dd] LATENCY=0
     -- Inputs
     MUX_uxn_c_l126_c26_78dd_cond <= VAR_MUX_uxn_c_l126_c26_78dd_cond;
     MUX_uxn_c_l126_c26_78dd_iftrue <= VAR_MUX_uxn_c_l126_c26_78dd_iftrue;
     MUX_uxn_c_l126_c26_78dd_iffalse <= VAR_MUX_uxn_c_l126_c26_78dd_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l126_c26_78dd_return_output := MUX_uxn_c_l126_c26_78dd_return_output;

     -- CAST_TO_uint4_t[uxn_c_l127_c14_2203] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_c_l127_c14_2203_return_output := CAST_TO_uint4_t_uint32_t(
     VAR_CONST_SR_28_uxn_c_l127_c24_7066_return_output);

     -- result_is_new_frame_MUX[uxn_c_l179_c9_df78] LATENCY=0
     -- Inputs
     result_is_new_frame_MUX_uxn_c_l179_c9_df78_cond <= VAR_result_is_new_frame_MUX_uxn_c_l179_c9_df78_cond;
     result_is_new_frame_MUX_uxn_c_l179_c9_df78_iftrue <= VAR_result_is_new_frame_MUX_uxn_c_l179_c9_df78_iftrue;
     result_is_new_frame_MUX_uxn_c_l179_c9_df78_iffalse <= VAR_result_is_new_frame_MUX_uxn_c_l179_c9_df78_iffalse;
     -- Outputs
     VAR_result_is_new_frame_MUX_uxn_c_l179_c9_df78_return_output := result_is_new_frame_MUX_uxn_c_l179_c9_df78_return_output;

     -- Submodule level 2
     VAR_fill_y0_uxn_c_l138_c3_c105 := resize(VAR_BIN_OP_DIV_uxn_c_l138_c13_2724_return_output, 16);
     VAR_BIN_OP_MINUS_uxn_c_l130_c6_4327_right := VAR_BIN_OP_INFERRED_MULT_uxn_c_l130_c23_6f80_return_output;
     VAR_BIN_OP_EQ_uxn_c_l128_c17_ea4b_left := VAR_CAST_TO_uint4_t_uxn_c_l127_c14_2203_return_output;
     REG_VAR_vram_code := VAR_CAST_TO_uint4_t_uxn_c_l127_c14_2203_return_output;
     VAR_MUX_uxn_c_l163_c37_efa7_iffalse := VAR_MUX_uxn_c_l126_c26_78dd_return_output;
     VAR_MUX_uxn_c_l170_c37_886b_iffalse := VAR_MUX_uxn_c_l126_c26_78dd_return_output;
     REG_VAR_adjusted_vram_address := VAR_MUX_uxn_c_l126_c26_78dd_return_output;
     VAR_pixel_counter_MUX_uxn_c_l176_c2_de08_iffalse := VAR_pixel_counter_MUX_uxn_c_l179_c9_df78_return_output;
     VAR_result_is_new_frame_MUX_uxn_c_l176_c2_de08_iffalse := VAR_result_is_new_frame_MUX_uxn_c_l179_c9_df78_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l139_c38_5d0c_left := VAR_fill_y0_uxn_c_l138_c3_c105;
     VAR_MUX_uxn_c_l140_c13_98c1_iftrue := VAR_fill_y0_uxn_c_l138_c3_c105;
     VAR_MUX_uxn_c_l142_c13_c3e3_iffalse := VAR_fill_y0_uxn_c_l138_c3_c105;
     -- BIN_OP_INFERRED_MULT[uxn_c_l139_c38_5d0c] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_c_l139_c38_5d0c_left <= VAR_BIN_OP_INFERRED_MULT_uxn_c_l139_c38_5d0c_left;
     BIN_OP_INFERRED_MULT_uxn_c_l139_c38_5d0c_right <= VAR_BIN_OP_INFERRED_MULT_uxn_c_l139_c38_5d0c_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l139_c38_5d0c_return_output := BIN_OP_INFERRED_MULT_uxn_c_l139_c38_5d0c_return_output;

     -- MUX[uxn_c_l142_c13_c3e3] LATENCY=0
     -- Inputs
     MUX_uxn_c_l142_c13_c3e3_cond <= VAR_MUX_uxn_c_l142_c13_c3e3_cond;
     MUX_uxn_c_l142_c13_c3e3_iftrue <= VAR_MUX_uxn_c_l142_c13_c3e3_iftrue;
     MUX_uxn_c_l142_c13_c3e3_iffalse <= VAR_MUX_uxn_c_l142_c13_c3e3_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l142_c13_c3e3_return_output := MUX_uxn_c_l142_c13_c3e3_return_output;

     -- BIN_OP_MINUS[uxn_c_l130_c6_4327] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l130_c6_4327_left <= VAR_BIN_OP_MINUS_uxn_c_l130_c6_4327_left;
     BIN_OP_MINUS_uxn_c_l130_c6_4327_right <= VAR_BIN_OP_MINUS_uxn_c_l130_c6_4327_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l130_c6_4327_return_output := BIN_OP_MINUS_uxn_c_l130_c6_4327_return_output;

     -- result_is_new_frame_MUX[uxn_c_l176_c2_de08] LATENCY=0
     -- Inputs
     result_is_new_frame_MUX_uxn_c_l176_c2_de08_cond <= VAR_result_is_new_frame_MUX_uxn_c_l176_c2_de08_cond;
     result_is_new_frame_MUX_uxn_c_l176_c2_de08_iftrue <= VAR_result_is_new_frame_MUX_uxn_c_l176_c2_de08_iftrue;
     result_is_new_frame_MUX_uxn_c_l176_c2_de08_iffalse <= VAR_result_is_new_frame_MUX_uxn_c_l176_c2_de08_iffalse;
     -- Outputs
     VAR_result_is_new_frame_MUX_uxn_c_l176_c2_de08_return_output := result_is_new_frame_MUX_uxn_c_l176_c2_de08_return_output;

     -- BIN_OP_EQ[uxn_c_l128_c17_ea4b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l128_c17_ea4b_left <= VAR_BIN_OP_EQ_uxn_c_l128_c17_ea4b_left;
     BIN_OP_EQ_uxn_c_l128_c17_ea4b_right <= VAR_BIN_OP_EQ_uxn_c_l128_c17_ea4b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l128_c17_ea4b_return_output := BIN_OP_EQ_uxn_c_l128_c17_ea4b_return_output;

     -- MUX[uxn_c_l140_c13_98c1] LATENCY=0
     -- Inputs
     MUX_uxn_c_l140_c13_98c1_cond <= VAR_MUX_uxn_c_l140_c13_98c1_cond;
     MUX_uxn_c_l140_c13_98c1_iftrue <= VAR_MUX_uxn_c_l140_c13_98c1_iftrue;
     MUX_uxn_c_l140_c13_98c1_iffalse <= VAR_MUX_uxn_c_l140_c13_98c1_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l140_c13_98c1_return_output := MUX_uxn_c_l140_c13_98c1_return_output;

     -- pixel_counter_MUX[uxn_c_l176_c2_de08] LATENCY=0
     -- Inputs
     pixel_counter_MUX_uxn_c_l176_c2_de08_cond <= VAR_pixel_counter_MUX_uxn_c_l176_c2_de08_cond;
     pixel_counter_MUX_uxn_c_l176_c2_de08_iftrue <= VAR_pixel_counter_MUX_uxn_c_l176_c2_de08_iftrue;
     pixel_counter_MUX_uxn_c_l176_c2_de08_iffalse <= VAR_pixel_counter_MUX_uxn_c_l176_c2_de08_iffalse;
     -- Outputs
     VAR_pixel_counter_MUX_uxn_c_l176_c2_de08_return_output := pixel_counter_MUX_uxn_c_l176_c2_de08_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_c_l128_c17_1e1d_cond := VAR_BIN_OP_EQ_uxn_c_l128_c17_ea4b_return_output;
     VAR_BIN_OP_MINUS_uxn_c_l139_c13_c939_right := VAR_BIN_OP_INFERRED_MULT_uxn_c_l139_c38_5d0c_return_output;
     VAR_x_uxn_c_l130_c2_409b := resize(VAR_BIN_OP_MINUS_uxn_c_l130_c6_4327_return_output, 16);
     VAR_fill_y1_uxn_c_l140_c3_312e := VAR_MUX_uxn_c_l140_c13_98c1_return_output;
     VAR_fill_y0_uxn_c_l142_c3_cd62 := VAR_MUX_uxn_c_l142_c13_c3e3_return_output;
     REG_VAR_pixel_counter := VAR_pixel_counter_MUX_uxn_c_l176_c2_de08_return_output;
     VAR_fill_y0_MUX_uxn_c_l133_c2_bbc1_iftrue := VAR_fill_y0_uxn_c_l142_c3_cd62;
     VAR_printf_uxn_c_l147_c3_482a_uxn_c_l147_c3_482a_arg1 := resize(VAR_fill_y0_uxn_c_l142_c3_cd62, 32);
     VAR_fill_y1_MUX_uxn_c_l133_c2_bbc1_iftrue := VAR_fill_y1_uxn_c_l140_c3_312e;
     VAR_printf_uxn_c_l147_c3_482a_uxn_c_l147_c3_482a_arg3 := resize(VAR_fill_y1_uxn_c_l140_c3_312e, 32);
     VAR_BIN_OP_GT_uxn_c_l152_c17_bb5e_left := VAR_x_uxn_c_l130_c2_409b;
     VAR_BIN_OP_LT_uxn_c_l153_c17_7565_left := VAR_x_uxn_c_l130_c2_409b;
     REG_VAR_x := VAR_x_uxn_c_l130_c2_409b;
     -- MUX[uxn_c_l128_c17_1e1d] LATENCY=0
     -- Inputs
     MUX_uxn_c_l128_c17_1e1d_cond <= VAR_MUX_uxn_c_l128_c17_1e1d_cond;
     MUX_uxn_c_l128_c17_1e1d_iftrue <= VAR_MUX_uxn_c_l128_c17_1e1d_iftrue;
     MUX_uxn_c_l128_c17_1e1d_iffalse <= VAR_MUX_uxn_c_l128_c17_1e1d_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l128_c17_1e1d_return_output := MUX_uxn_c_l128_c17_1e1d_return_output;

     -- BIN_OP_MINUS[uxn_c_l139_c13_c939] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l139_c13_c939_left <= VAR_BIN_OP_MINUS_uxn_c_l139_c13_c939_left;
     BIN_OP_MINUS_uxn_c_l139_c13_c939_right <= VAR_BIN_OP_MINUS_uxn_c_l139_c13_c939_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l139_c13_c939_return_output := BIN_OP_MINUS_uxn_c_l139_c13_c939_return_output;

     -- Submodule level 4
     VAR_fill_x0_uxn_c_l139_c3_4ce1 := resize(VAR_BIN_OP_MINUS_uxn_c_l139_c13_c939_return_output, 16);
     VAR_BIN_OP_AND_uxn_c_l133_c6_bd9a_left := VAR_MUX_uxn_c_l128_c17_1e1d_return_output;
     REG_VAR_is_fill_code := VAR_MUX_uxn_c_l128_c17_1e1d_return_output;
     VAR_MUX_uxn_c_l141_c13_97f1_iftrue := VAR_fill_x0_uxn_c_l139_c3_4ce1;
     VAR_MUX_uxn_c_l143_c13_bbc3_iffalse := VAR_fill_x0_uxn_c_l139_c3_4ce1;
     -- MUX[uxn_c_l143_c13_bbc3] LATENCY=0
     -- Inputs
     MUX_uxn_c_l143_c13_bbc3_cond <= VAR_MUX_uxn_c_l143_c13_bbc3_cond;
     MUX_uxn_c_l143_c13_bbc3_iftrue <= VAR_MUX_uxn_c_l143_c13_bbc3_iftrue;
     MUX_uxn_c_l143_c13_bbc3_iffalse <= VAR_MUX_uxn_c_l143_c13_bbc3_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l143_c13_bbc3_return_output := MUX_uxn_c_l143_c13_bbc3_return_output;

     -- BIN_OP_AND[uxn_c_l133_c6_bd9a] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l133_c6_bd9a_left <= VAR_BIN_OP_AND_uxn_c_l133_c6_bd9a_left;
     BIN_OP_AND_uxn_c_l133_c6_bd9a_right <= VAR_BIN_OP_AND_uxn_c_l133_c6_bd9a_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l133_c6_bd9a_return_output := BIN_OP_AND_uxn_c_l133_c6_bd9a_return_output;

     -- MUX[uxn_c_l141_c13_97f1] LATENCY=0
     -- Inputs
     MUX_uxn_c_l141_c13_97f1_cond <= VAR_MUX_uxn_c_l141_c13_97f1_cond;
     MUX_uxn_c_l141_c13_97f1_iftrue <= VAR_MUX_uxn_c_l141_c13_97f1_iftrue;
     MUX_uxn_c_l141_c13_97f1_iffalse <= VAR_MUX_uxn_c_l141_c13_97f1_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l141_c13_97f1_return_output := MUX_uxn_c_l141_c13_97f1_return_output;

     -- Submodule level 5
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l133_c1_bc14_cond := VAR_BIN_OP_AND_uxn_c_l133_c6_bd9a_return_output;
     VAR_fill_color_MUX_uxn_c_l133_c2_bbc1_cond := VAR_BIN_OP_AND_uxn_c_l133_c6_bd9a_return_output;
     VAR_fill_layer_MUX_uxn_c_l133_c2_bbc1_cond := VAR_BIN_OP_AND_uxn_c_l133_c6_bd9a_return_output;
     VAR_fill_pixels_remaining_MUX_uxn_c_l133_c2_bbc1_cond := VAR_BIN_OP_AND_uxn_c_l133_c6_bd9a_return_output;
     VAR_fill_x0_MUX_uxn_c_l133_c2_bbc1_cond := VAR_BIN_OP_AND_uxn_c_l133_c6_bd9a_return_output;
     VAR_fill_x1_MUX_uxn_c_l133_c2_bbc1_cond := VAR_BIN_OP_AND_uxn_c_l133_c6_bd9a_return_output;
     VAR_fill_y0_MUX_uxn_c_l133_c2_bbc1_cond := VAR_BIN_OP_AND_uxn_c_l133_c6_bd9a_return_output;
     VAR_fill_y1_MUX_uxn_c_l133_c2_bbc1_cond := VAR_BIN_OP_AND_uxn_c_l133_c6_bd9a_return_output;
     VAR_is_fill_left_MUX_uxn_c_l133_c2_bbc1_cond := VAR_BIN_OP_AND_uxn_c_l133_c6_bd9a_return_output;
     VAR_is_fill_top_MUX_uxn_c_l133_c2_bbc1_cond := VAR_BIN_OP_AND_uxn_c_l133_c6_bd9a_return_output;
     VAR_fill_x1_uxn_c_l141_c3_7e25 := VAR_MUX_uxn_c_l141_c13_97f1_return_output;
     VAR_fill_x0_uxn_c_l143_c3_cf78 := VAR_MUX_uxn_c_l143_c13_bbc3_return_output;
     VAR_fill_x0_MUX_uxn_c_l133_c2_bbc1_iftrue := VAR_fill_x0_uxn_c_l143_c3_cf78;
     VAR_printf_uxn_c_l147_c3_482a_uxn_c_l147_c3_482a_arg0 := resize(VAR_fill_x0_uxn_c_l143_c3_cf78, 32);
     VAR_fill_x1_MUX_uxn_c_l133_c2_bbc1_iftrue := VAR_fill_x1_uxn_c_l141_c3_7e25;
     VAR_printf_uxn_c_l147_c3_482a_uxn_c_l147_c3_482a_arg2 := resize(VAR_fill_x1_uxn_c_l141_c3_7e25, 32);
     -- fill_y0_MUX[uxn_c_l133_c2_bbc1] LATENCY=0
     -- Inputs
     fill_y0_MUX_uxn_c_l133_c2_bbc1_cond <= VAR_fill_y0_MUX_uxn_c_l133_c2_bbc1_cond;
     fill_y0_MUX_uxn_c_l133_c2_bbc1_iftrue <= VAR_fill_y0_MUX_uxn_c_l133_c2_bbc1_iftrue;
     fill_y0_MUX_uxn_c_l133_c2_bbc1_iffalse <= VAR_fill_y0_MUX_uxn_c_l133_c2_bbc1_iffalse;
     -- Outputs
     VAR_fill_y0_MUX_uxn_c_l133_c2_bbc1_return_output := fill_y0_MUX_uxn_c_l133_c2_bbc1_return_output;

     -- is_fill_top_MUX[uxn_c_l133_c2_bbc1] LATENCY=0
     -- Inputs
     is_fill_top_MUX_uxn_c_l133_c2_bbc1_cond <= VAR_is_fill_top_MUX_uxn_c_l133_c2_bbc1_cond;
     is_fill_top_MUX_uxn_c_l133_c2_bbc1_iftrue <= VAR_is_fill_top_MUX_uxn_c_l133_c2_bbc1_iftrue;
     is_fill_top_MUX_uxn_c_l133_c2_bbc1_iffalse <= VAR_is_fill_top_MUX_uxn_c_l133_c2_bbc1_iffalse;
     -- Outputs
     VAR_is_fill_top_MUX_uxn_c_l133_c2_bbc1_return_output := is_fill_top_MUX_uxn_c_l133_c2_bbc1_return_output;

     -- fill_x0_MUX[uxn_c_l133_c2_bbc1] LATENCY=0
     -- Inputs
     fill_x0_MUX_uxn_c_l133_c2_bbc1_cond <= VAR_fill_x0_MUX_uxn_c_l133_c2_bbc1_cond;
     fill_x0_MUX_uxn_c_l133_c2_bbc1_iftrue <= VAR_fill_x0_MUX_uxn_c_l133_c2_bbc1_iftrue;
     fill_x0_MUX_uxn_c_l133_c2_bbc1_iffalse <= VAR_fill_x0_MUX_uxn_c_l133_c2_bbc1_iffalse;
     -- Outputs
     VAR_fill_x0_MUX_uxn_c_l133_c2_bbc1_return_output := fill_x0_MUX_uxn_c_l133_c2_bbc1_return_output;

     -- fill_y1_MUX[uxn_c_l133_c2_bbc1] LATENCY=0
     -- Inputs
     fill_y1_MUX_uxn_c_l133_c2_bbc1_cond <= VAR_fill_y1_MUX_uxn_c_l133_c2_bbc1_cond;
     fill_y1_MUX_uxn_c_l133_c2_bbc1_iftrue <= VAR_fill_y1_MUX_uxn_c_l133_c2_bbc1_iftrue;
     fill_y1_MUX_uxn_c_l133_c2_bbc1_iffalse <= VAR_fill_y1_MUX_uxn_c_l133_c2_bbc1_iffalse;
     -- Outputs
     VAR_fill_y1_MUX_uxn_c_l133_c2_bbc1_return_output := fill_y1_MUX_uxn_c_l133_c2_bbc1_return_output;

     -- is_fill_left_MUX[uxn_c_l133_c2_bbc1] LATENCY=0
     -- Inputs
     is_fill_left_MUX_uxn_c_l133_c2_bbc1_cond <= VAR_is_fill_left_MUX_uxn_c_l133_c2_bbc1_cond;
     is_fill_left_MUX_uxn_c_l133_c2_bbc1_iftrue <= VAR_is_fill_left_MUX_uxn_c_l133_c2_bbc1_iftrue;
     is_fill_left_MUX_uxn_c_l133_c2_bbc1_iffalse <= VAR_is_fill_left_MUX_uxn_c_l133_c2_bbc1_iffalse;
     -- Outputs
     VAR_is_fill_left_MUX_uxn_c_l133_c2_bbc1_return_output := is_fill_left_MUX_uxn_c_l133_c2_bbc1_return_output;

     -- fill_layer_MUX[uxn_c_l133_c2_bbc1] LATENCY=0
     -- Inputs
     fill_layer_MUX_uxn_c_l133_c2_bbc1_cond <= VAR_fill_layer_MUX_uxn_c_l133_c2_bbc1_cond;
     fill_layer_MUX_uxn_c_l133_c2_bbc1_iftrue <= VAR_fill_layer_MUX_uxn_c_l133_c2_bbc1_iftrue;
     fill_layer_MUX_uxn_c_l133_c2_bbc1_iffalse <= VAR_fill_layer_MUX_uxn_c_l133_c2_bbc1_iffalse;
     -- Outputs
     VAR_fill_layer_MUX_uxn_c_l133_c2_bbc1_return_output := fill_layer_MUX_uxn_c_l133_c2_bbc1_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l133_c1_bc14] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l133_c1_bc14_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l133_c1_bc14_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l133_c1_bc14_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l133_c1_bc14_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l133_c1_bc14_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l133_c1_bc14_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l133_c1_bc14_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l133_c1_bc14_return_output;

     -- fill_color_MUX[uxn_c_l133_c2_bbc1] LATENCY=0
     -- Inputs
     fill_color_MUX_uxn_c_l133_c2_bbc1_cond <= VAR_fill_color_MUX_uxn_c_l133_c2_bbc1_cond;
     fill_color_MUX_uxn_c_l133_c2_bbc1_iftrue <= VAR_fill_color_MUX_uxn_c_l133_c2_bbc1_iftrue;
     fill_color_MUX_uxn_c_l133_c2_bbc1_iffalse <= VAR_fill_color_MUX_uxn_c_l133_c2_bbc1_iffalse;
     -- Outputs
     VAR_fill_color_MUX_uxn_c_l133_c2_bbc1_return_output := fill_color_MUX_uxn_c_l133_c2_bbc1_return_output;

     -- fill_pixels_remaining_MUX[uxn_c_l133_c2_bbc1] LATENCY=0
     -- Inputs
     fill_pixels_remaining_MUX_uxn_c_l133_c2_bbc1_cond <= VAR_fill_pixels_remaining_MUX_uxn_c_l133_c2_bbc1_cond;
     fill_pixels_remaining_MUX_uxn_c_l133_c2_bbc1_iftrue <= VAR_fill_pixels_remaining_MUX_uxn_c_l133_c2_bbc1_iftrue;
     fill_pixels_remaining_MUX_uxn_c_l133_c2_bbc1_iffalse <= VAR_fill_pixels_remaining_MUX_uxn_c_l133_c2_bbc1_iffalse;
     -- Outputs
     VAR_fill_pixels_remaining_MUX_uxn_c_l133_c2_bbc1_return_output := fill_pixels_remaining_MUX_uxn_c_l133_c2_bbc1_return_output;

     -- fill_x1_MUX[uxn_c_l133_c2_bbc1] LATENCY=0
     -- Inputs
     fill_x1_MUX_uxn_c_l133_c2_bbc1_cond <= VAR_fill_x1_MUX_uxn_c_l133_c2_bbc1_cond;
     fill_x1_MUX_uxn_c_l133_c2_bbc1_iftrue <= VAR_fill_x1_MUX_uxn_c_l133_c2_bbc1_iftrue;
     fill_x1_MUX_uxn_c_l133_c2_bbc1_iffalse <= VAR_fill_x1_MUX_uxn_c_l133_c2_bbc1_iffalse;
     -- Outputs
     VAR_fill_x1_MUX_uxn_c_l133_c2_bbc1_return_output := fill_x1_MUX_uxn_c_l133_c2_bbc1_return_output;

     -- Submodule level 6
     VAR_printf_uxn_c_l147_c3_482a_uxn_c_l147_c3_482a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l133_c1_bc14_return_output;
     VAR_MUX_uxn_c_l164_c3_fd98_iftrue := VAR_fill_color_MUX_uxn_c_l133_c2_bbc1_return_output;
     VAR_MUX_uxn_c_l171_c3_5b03_iftrue := VAR_fill_color_MUX_uxn_c_l133_c2_bbc1_return_output;
     REG_VAR_fill_color := VAR_fill_color_MUX_uxn_c_l133_c2_bbc1_return_output;
     VAR_BIN_OP_AND_uxn_c_l159_c19_fb6a_right := VAR_fill_layer_MUX_uxn_c_l133_c2_bbc1_return_output;
     VAR_UNARY_OP_NOT_uxn_c_l158_c37_7cf2_expr := VAR_fill_layer_MUX_uxn_c_l133_c2_bbc1_return_output;
     REG_VAR_fill_layer := VAR_fill_layer_MUX_uxn_c_l133_c2_bbc1_return_output;
     VAR_BIN_OP_EQ_uxn_c_l150_c19_97ce_left := VAR_fill_pixels_remaining_MUX_uxn_c_l133_c2_bbc1_return_output;
     VAR_BIN_OP_EQ_uxn_c_l182_c27_56a6_left := VAR_fill_pixels_remaining_MUX_uxn_c_l133_c2_bbc1_return_output;
     VAR_BIN_OP_MINUS_uxn_c_l182_c60_c649_left := VAR_fill_pixels_remaining_MUX_uxn_c_l133_c2_bbc1_return_output;
     VAR_fill_pixels_remaining_MUX_uxn_c_l176_c2_de08_iftrue := VAR_fill_pixels_remaining_MUX_uxn_c_l133_c2_bbc1_return_output;
     VAR_fill_pixels_remaining_MUX_uxn_c_l179_c9_df78_iffalse := VAR_fill_pixels_remaining_MUX_uxn_c_l133_c2_bbc1_return_output;
     VAR_BIN_OP_GT_uxn_c_l152_c17_bb5e_right := VAR_fill_x0_MUX_uxn_c_l133_c2_bbc1_return_output;
     REG_VAR_fill_x0 := VAR_fill_x0_MUX_uxn_c_l133_c2_bbc1_return_output;
     VAR_BIN_OP_LT_uxn_c_l153_c17_7565_right := VAR_fill_x1_MUX_uxn_c_l133_c2_bbc1_return_output;
     REG_VAR_fill_x1 := VAR_fill_x1_MUX_uxn_c_l133_c2_bbc1_return_output;
     VAR_BIN_OP_GT_uxn_c_l154_c17_6a03_right := VAR_fill_y0_MUX_uxn_c_l133_c2_bbc1_return_output;
     REG_VAR_fill_y0 := VAR_fill_y0_MUX_uxn_c_l133_c2_bbc1_return_output;
     VAR_BIN_OP_LT_uxn_c_l155_c17_5d64_right := VAR_fill_y1_MUX_uxn_c_l133_c2_bbc1_return_output;
     REG_VAR_fill_y1 := VAR_fill_y1_MUX_uxn_c_l133_c2_bbc1_return_output;
     REG_VAR_is_fill_left := VAR_is_fill_left_MUX_uxn_c_l133_c2_bbc1_return_output;
     REG_VAR_is_fill_top := VAR_is_fill_top_MUX_uxn_c_l133_c2_bbc1_return_output;
     -- BIN_OP_GT[uxn_c_l154_c17_6a03] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_c_l154_c17_6a03_left <= VAR_BIN_OP_GT_uxn_c_l154_c17_6a03_left;
     BIN_OP_GT_uxn_c_l154_c17_6a03_right <= VAR_BIN_OP_GT_uxn_c_l154_c17_6a03_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_c_l154_c17_6a03_return_output := BIN_OP_GT_uxn_c_l154_c17_6a03_return_output;

     -- UNARY_OP_NOT[uxn_c_l158_c37_7cf2] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l158_c37_7cf2_expr <= VAR_UNARY_OP_NOT_uxn_c_l158_c37_7cf2_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l158_c37_7cf2_return_output := UNARY_OP_NOT_uxn_c_l158_c37_7cf2_return_output;

     -- printf_uxn_c_l147_c3_482a[uxn_c_l147_c3_482a] LATENCY=0
     -- Clock enable
     printf_uxn_c_l147_c3_482a_uxn_c_l147_c3_482a_CLOCK_ENABLE <= VAR_printf_uxn_c_l147_c3_482a_uxn_c_l147_c3_482a_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_c_l147_c3_482a_uxn_c_l147_c3_482a_arg0 <= VAR_printf_uxn_c_l147_c3_482a_uxn_c_l147_c3_482a_arg0;
     printf_uxn_c_l147_c3_482a_uxn_c_l147_c3_482a_arg1 <= VAR_printf_uxn_c_l147_c3_482a_uxn_c_l147_c3_482a_arg1;
     printf_uxn_c_l147_c3_482a_uxn_c_l147_c3_482a_arg2 <= VAR_printf_uxn_c_l147_c3_482a_uxn_c_l147_c3_482a_arg2;
     printf_uxn_c_l147_c3_482a_uxn_c_l147_c3_482a_arg3 <= VAR_printf_uxn_c_l147_c3_482a_uxn_c_l147_c3_482a_arg3;
     printf_uxn_c_l147_c3_482a_uxn_c_l147_c3_482a_arg4 <= VAR_printf_uxn_c_l147_c3_482a_uxn_c_l147_c3_482a_arg4;
     -- Outputs

     -- BIN_OP_EQ[uxn_c_l150_c19_97ce] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l150_c19_97ce_left <= VAR_BIN_OP_EQ_uxn_c_l150_c19_97ce_left;
     BIN_OP_EQ_uxn_c_l150_c19_97ce_right <= VAR_BIN_OP_EQ_uxn_c_l150_c19_97ce_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l150_c19_97ce_return_output := BIN_OP_EQ_uxn_c_l150_c19_97ce_return_output;

     -- BIN_OP_GT[uxn_c_l152_c17_bb5e] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_c_l152_c17_bb5e_left <= VAR_BIN_OP_GT_uxn_c_l152_c17_bb5e_left;
     BIN_OP_GT_uxn_c_l152_c17_bb5e_right <= VAR_BIN_OP_GT_uxn_c_l152_c17_bb5e_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_c_l152_c17_bb5e_return_output := BIN_OP_GT_uxn_c_l152_c17_bb5e_return_output;

     -- BIN_OP_LT[uxn_c_l153_c17_7565] LATENCY=0
     -- Inputs
     BIN_OP_LT_uxn_c_l153_c17_7565_left <= VAR_BIN_OP_LT_uxn_c_l153_c17_7565_left;
     BIN_OP_LT_uxn_c_l153_c17_7565_right <= VAR_BIN_OP_LT_uxn_c_l153_c17_7565_right;
     -- Outputs
     VAR_BIN_OP_LT_uxn_c_l153_c17_7565_return_output := BIN_OP_LT_uxn_c_l153_c17_7565_return_output;

     -- BIN_OP_EQ[uxn_c_l182_c27_56a6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l182_c27_56a6_left <= VAR_BIN_OP_EQ_uxn_c_l182_c27_56a6_left;
     BIN_OP_EQ_uxn_c_l182_c27_56a6_right <= VAR_BIN_OP_EQ_uxn_c_l182_c27_56a6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l182_c27_56a6_return_output := BIN_OP_EQ_uxn_c_l182_c27_56a6_return_output;

     -- BIN_OP_MINUS[uxn_c_l182_c60_c649] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l182_c60_c649_left <= VAR_BIN_OP_MINUS_uxn_c_l182_c60_c649_left;
     BIN_OP_MINUS_uxn_c_l182_c60_c649_right <= VAR_BIN_OP_MINUS_uxn_c_l182_c60_c649_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l182_c60_c649_return_output := BIN_OP_MINUS_uxn_c_l182_c60_c649_return_output;

     -- BIN_OP_LT[uxn_c_l155_c17_5d64] LATENCY=0
     -- Inputs
     BIN_OP_LT_uxn_c_l155_c17_5d64_left <= VAR_BIN_OP_LT_uxn_c_l155_c17_5d64_left;
     BIN_OP_LT_uxn_c_l155_c17_5d64_right <= VAR_BIN_OP_LT_uxn_c_l155_c17_5d64_right;
     -- Outputs
     VAR_BIN_OP_LT_uxn_c_l155_c17_5d64_return_output := BIN_OP_LT_uxn_c_l155_c17_5d64_return_output;

     -- Submodule level 7
     VAR_MUX_uxn_c_l150_c19_adb2_cond := VAR_BIN_OP_EQ_uxn_c_l150_c19_97ce_return_output;
     VAR_MUX_uxn_c_l182_c27_9d8f_cond := VAR_BIN_OP_EQ_uxn_c_l182_c27_56a6_return_output;
     VAR_BIN_OP_AND_uxn_c_l157_c18_e0a0_right := VAR_BIN_OP_GT_uxn_c_l152_c17_bb5e_return_output;
     REG_VAR_fill_isect_l := VAR_BIN_OP_GT_uxn_c_l152_c17_bb5e_return_output;
     VAR_BIN_OP_AND_uxn_c_l157_c18_37d5_right := VAR_BIN_OP_GT_uxn_c_l154_c17_6a03_return_output;
     REG_VAR_fill_isect_t := VAR_BIN_OP_GT_uxn_c_l154_c17_6a03_return_output;
     VAR_BIN_OP_AND_uxn_c_l157_c18_f6be_right := VAR_BIN_OP_LT_uxn_c_l153_c17_7565_return_output;
     REG_VAR_fill_isect_r := VAR_BIN_OP_LT_uxn_c_l153_c17_7565_return_output;
     VAR_BIN_OP_AND_uxn_c_l157_c18_66df_right := VAR_BIN_OP_LT_uxn_c_l155_c17_5d64_return_output;
     REG_VAR_fill_isect_b := VAR_BIN_OP_LT_uxn_c_l155_c17_5d64_return_output;
     VAR_MUX_uxn_c_l182_c27_9d8f_iffalse := VAR_BIN_OP_MINUS_uxn_c_l182_c60_c649_return_output;
     VAR_BIN_OP_AND_uxn_c_l158_c19_3764_right := VAR_UNARY_OP_NOT_uxn_c_l158_c37_7cf2_return_output;
     -- MUX[uxn_c_l150_c19_adb2] LATENCY=0
     -- Inputs
     MUX_uxn_c_l150_c19_adb2_cond <= VAR_MUX_uxn_c_l150_c19_adb2_cond;
     MUX_uxn_c_l150_c19_adb2_iftrue <= VAR_MUX_uxn_c_l150_c19_adb2_iftrue;
     MUX_uxn_c_l150_c19_adb2_iffalse <= VAR_MUX_uxn_c_l150_c19_adb2_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l150_c19_adb2_return_output := MUX_uxn_c_l150_c19_adb2_return_output;

     -- MUX[uxn_c_l182_c27_9d8f] LATENCY=0
     -- Inputs
     MUX_uxn_c_l182_c27_9d8f_cond <= VAR_MUX_uxn_c_l182_c27_9d8f_cond;
     MUX_uxn_c_l182_c27_9d8f_iftrue <= VAR_MUX_uxn_c_l182_c27_9d8f_iftrue;
     MUX_uxn_c_l182_c27_9d8f_iffalse <= VAR_MUX_uxn_c_l182_c27_9d8f_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l182_c27_9d8f_return_output := MUX_uxn_c_l182_c27_9d8f_return_output;

     -- Submodule level 8
     VAR_BIN_OP_AND_uxn_c_l157_c18_e0a0_left := VAR_MUX_uxn_c_l150_c19_adb2_return_output;
     VAR_MUX_uxn_c_l163_c37_efa7_cond := VAR_MUX_uxn_c_l150_c19_adb2_return_output;
     VAR_MUX_uxn_c_l170_c37_886b_cond := VAR_MUX_uxn_c_l150_c19_adb2_return_output;
     VAR_UNARY_OP_NOT_uint1_t_uxn_c_l172_l165_DUPLICATE_8568_expr := VAR_MUX_uxn_c_l150_c19_adb2_return_output;
     REG_VAR_is_fill_active := VAR_MUX_uxn_c_l150_c19_adb2_return_output;
     VAR_fill_pixels_remaining_MUX_uxn_c_l179_c9_df78_iftrue := VAR_MUX_uxn_c_l182_c27_9d8f_return_output;
     -- fill_pixels_remaining_MUX[uxn_c_l179_c9_df78] LATENCY=0
     -- Inputs
     fill_pixels_remaining_MUX_uxn_c_l179_c9_df78_cond <= VAR_fill_pixels_remaining_MUX_uxn_c_l179_c9_df78_cond;
     fill_pixels_remaining_MUX_uxn_c_l179_c9_df78_iftrue <= VAR_fill_pixels_remaining_MUX_uxn_c_l179_c9_df78_iftrue;
     fill_pixels_remaining_MUX_uxn_c_l179_c9_df78_iffalse <= VAR_fill_pixels_remaining_MUX_uxn_c_l179_c9_df78_iffalse;
     -- Outputs
     VAR_fill_pixels_remaining_MUX_uxn_c_l179_c9_df78_return_output := fill_pixels_remaining_MUX_uxn_c_l179_c9_df78_return_output;

     -- MUX[uxn_c_l170_c37_886b] LATENCY=0
     -- Inputs
     MUX_uxn_c_l170_c37_886b_cond <= VAR_MUX_uxn_c_l170_c37_886b_cond;
     MUX_uxn_c_l170_c37_886b_iftrue <= VAR_MUX_uxn_c_l170_c37_886b_iftrue;
     MUX_uxn_c_l170_c37_886b_iffalse <= VAR_MUX_uxn_c_l170_c37_886b_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l170_c37_886b_return_output := MUX_uxn_c_l170_c37_886b_return_output;

     -- UNARY_OP_NOT_uint1_t_uxn_c_l172_l165_DUPLICATE_8568 LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uint1_t_uxn_c_l172_l165_DUPLICATE_8568_expr <= VAR_UNARY_OP_NOT_uint1_t_uxn_c_l172_l165_DUPLICATE_8568_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uint1_t_uxn_c_l172_l165_DUPLICATE_8568_return_output := UNARY_OP_NOT_uint1_t_uxn_c_l172_l165_DUPLICATE_8568_return_output;

     -- BIN_OP_AND[uxn_c_l157_c18_e0a0] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l157_c18_e0a0_left <= VAR_BIN_OP_AND_uxn_c_l157_c18_e0a0_left;
     BIN_OP_AND_uxn_c_l157_c18_e0a0_right <= VAR_BIN_OP_AND_uxn_c_l157_c18_e0a0_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l157_c18_e0a0_return_output := BIN_OP_AND_uxn_c_l157_c18_e0a0_return_output;

     -- MUX[uxn_c_l163_c37_efa7] LATENCY=0
     -- Inputs
     MUX_uxn_c_l163_c37_efa7_cond <= VAR_MUX_uxn_c_l163_c37_efa7_cond;
     MUX_uxn_c_l163_c37_efa7_iftrue <= VAR_MUX_uxn_c_l163_c37_efa7_iftrue;
     MUX_uxn_c_l163_c37_efa7_iffalse <= VAR_MUX_uxn_c_l163_c37_efa7_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l163_c37_efa7_return_output := MUX_uxn_c_l163_c37_efa7_return_output;

     -- Submodule level 9
     VAR_BIN_OP_AND_uxn_c_l157_c18_f6be_left := VAR_BIN_OP_AND_uxn_c_l157_c18_e0a0_return_output;
     VAR_MUX_uxn_c_l163_c3_9d1e_iffalse := VAR_MUX_uxn_c_l163_c37_efa7_return_output;
     VAR_MUX_uxn_c_l170_c3_644e_iffalse := VAR_MUX_uxn_c_l170_c37_886b_return_output;
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l172_l165_DUPLICATE_0cc0_left := VAR_UNARY_OP_NOT_uint1_t_uxn_c_l172_l165_DUPLICATE_8568_return_output;
     VAR_fill_pixels_remaining_MUX_uxn_c_l176_c2_de08_iffalse := VAR_fill_pixels_remaining_MUX_uxn_c_l179_c9_df78_return_output;
     -- fill_pixels_remaining_MUX[uxn_c_l176_c2_de08] LATENCY=0
     -- Inputs
     fill_pixels_remaining_MUX_uxn_c_l176_c2_de08_cond <= VAR_fill_pixels_remaining_MUX_uxn_c_l176_c2_de08_cond;
     fill_pixels_remaining_MUX_uxn_c_l176_c2_de08_iftrue <= VAR_fill_pixels_remaining_MUX_uxn_c_l176_c2_de08_iftrue;
     fill_pixels_remaining_MUX_uxn_c_l176_c2_de08_iffalse <= VAR_fill_pixels_remaining_MUX_uxn_c_l176_c2_de08_iffalse;
     -- Outputs
     VAR_fill_pixels_remaining_MUX_uxn_c_l176_c2_de08_return_output := fill_pixels_remaining_MUX_uxn_c_l176_c2_de08_return_output;

     -- BIN_OP_AND[uxn_c_l157_c18_f6be] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l157_c18_f6be_left <= VAR_BIN_OP_AND_uxn_c_l157_c18_f6be_left;
     BIN_OP_AND_uxn_c_l157_c18_f6be_right <= VAR_BIN_OP_AND_uxn_c_l157_c18_f6be_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l157_c18_f6be_return_output := BIN_OP_AND_uxn_c_l157_c18_f6be_return_output;

     -- BIN_OP_AND_uint1_t_uint1_t_uxn_c_l172_l165_DUPLICATE_0cc0 LATENCY=0
     -- Inputs
     BIN_OP_AND_uint1_t_uint1_t_uxn_c_l172_l165_DUPLICATE_0cc0_left <= VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l172_l165_DUPLICATE_0cc0_left;
     BIN_OP_AND_uint1_t_uint1_t_uxn_c_l172_l165_DUPLICATE_0cc0_right <= VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l172_l165_DUPLICATE_0cc0_right;
     -- Outputs
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l172_l165_DUPLICATE_0cc0_return_output := BIN_OP_AND_uint1_t_uint1_t_uxn_c_l172_l165_DUPLICATE_0cc0_return_output;

     -- Submodule level 10
     VAR_BIN_OP_AND_uxn_c_l157_c18_37d5_left := VAR_BIN_OP_AND_uxn_c_l157_c18_f6be_return_output;
     VAR_BIN_OP_AND_uxn_c_l165_c22_115c_left := VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l172_l165_DUPLICATE_0cc0_return_output;
     VAR_BIN_OP_AND_uxn_c_l172_c22_238d_left := VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l172_l165_DUPLICATE_0cc0_return_output;
     REG_VAR_fill_pixels_remaining := VAR_fill_pixels_remaining_MUX_uxn_c_l176_c2_de08_return_output;
     -- BIN_OP_AND[uxn_c_l157_c18_37d5] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l157_c18_37d5_left <= VAR_BIN_OP_AND_uxn_c_l157_c18_37d5_left;
     BIN_OP_AND_uxn_c_l157_c18_37d5_right <= VAR_BIN_OP_AND_uxn_c_l157_c18_37d5_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l157_c18_37d5_return_output := BIN_OP_AND_uxn_c_l157_c18_37d5_return_output;

     -- BIN_OP_AND[uxn_c_l172_c22_238d] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l172_c22_238d_left <= VAR_BIN_OP_AND_uxn_c_l172_c22_238d_left;
     BIN_OP_AND_uxn_c_l172_c22_238d_right <= VAR_BIN_OP_AND_uxn_c_l172_c22_238d_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l172_c22_238d_return_output := BIN_OP_AND_uxn_c_l172_c22_238d_return_output;

     -- BIN_OP_AND[uxn_c_l165_c22_115c] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l165_c22_115c_left <= VAR_BIN_OP_AND_uxn_c_l165_c22_115c_left;
     BIN_OP_AND_uxn_c_l165_c22_115c_right <= VAR_BIN_OP_AND_uxn_c_l165_c22_115c_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l165_c22_115c_return_output := BIN_OP_AND_uxn_c_l165_c22_115c_return_output;

     -- Submodule level 11
     VAR_BIN_OP_AND_uxn_c_l157_c18_66df_left := VAR_BIN_OP_AND_uxn_c_l157_c18_37d5_return_output;
     VAR_BIN_OP_OR_uxn_c_l165_c3_74f3_right := VAR_BIN_OP_AND_uxn_c_l165_c22_115c_return_output;
     VAR_BIN_OP_OR_uxn_c_l172_c3_e2e6_right := VAR_BIN_OP_AND_uxn_c_l172_c22_238d_return_output;
     -- BIN_OP_AND[uxn_c_l157_c18_66df] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l157_c18_66df_left <= VAR_BIN_OP_AND_uxn_c_l157_c18_66df_left;
     BIN_OP_AND_uxn_c_l157_c18_66df_right <= VAR_BIN_OP_AND_uxn_c_l157_c18_66df_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l157_c18_66df_return_output := BIN_OP_AND_uxn_c_l157_c18_66df_return_output;

     -- Submodule level 12
     VAR_BIN_OP_AND_uxn_c_l158_c19_3764_left := VAR_BIN_OP_AND_uxn_c_l157_c18_66df_return_output;
     VAR_BIN_OP_AND_uxn_c_l159_c19_fb6a_left := VAR_BIN_OP_AND_uxn_c_l157_c18_66df_return_output;
     REG_VAR_is_fill_pixel := VAR_BIN_OP_AND_uxn_c_l157_c18_66df_return_output;
     -- BIN_OP_AND[uxn_c_l159_c19_fb6a] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l159_c19_fb6a_left <= VAR_BIN_OP_AND_uxn_c_l159_c19_fb6a_left;
     BIN_OP_AND_uxn_c_l159_c19_fb6a_right <= VAR_BIN_OP_AND_uxn_c_l159_c19_fb6a_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l159_c19_fb6a_return_output := BIN_OP_AND_uxn_c_l159_c19_fb6a_return_output;

     -- BIN_OP_AND[uxn_c_l158_c19_3764] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l158_c19_3764_left <= VAR_BIN_OP_AND_uxn_c_l158_c19_3764_left;
     BIN_OP_AND_uxn_c_l158_c19_3764_right <= VAR_BIN_OP_AND_uxn_c_l158_c19_3764_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l158_c19_3764_return_output := BIN_OP_AND_uxn_c_l158_c19_3764_return_output;

     -- Submodule level 13
     VAR_BIN_OP_OR_uxn_c_l165_c3_74f3_left := VAR_BIN_OP_AND_uxn_c_l158_c19_3764_return_output;
     VAR_MUX_uxn_c_l163_c3_9d1e_cond := VAR_BIN_OP_AND_uxn_c_l158_c19_3764_return_output;
     VAR_MUX_uxn_c_l164_c3_fd98_cond := VAR_BIN_OP_AND_uxn_c_l158_c19_3764_return_output;
     REG_VAR_is_fill_pixel0 := VAR_BIN_OP_AND_uxn_c_l158_c19_3764_return_output;
     VAR_BIN_OP_OR_uxn_c_l172_c3_e2e6_left := VAR_BIN_OP_AND_uxn_c_l159_c19_fb6a_return_output;
     VAR_MUX_uxn_c_l170_c3_644e_cond := VAR_BIN_OP_AND_uxn_c_l159_c19_fb6a_return_output;
     VAR_MUX_uxn_c_l171_c3_5b03_cond := VAR_BIN_OP_AND_uxn_c_l159_c19_fb6a_return_output;
     REG_VAR_is_fill_pixel1 := VAR_BIN_OP_AND_uxn_c_l159_c19_fb6a_return_output;
     -- MUX[uxn_c_l163_c3_9d1e] LATENCY=0
     -- Inputs
     MUX_uxn_c_l163_c3_9d1e_cond <= VAR_MUX_uxn_c_l163_c3_9d1e_cond;
     MUX_uxn_c_l163_c3_9d1e_iftrue <= VAR_MUX_uxn_c_l163_c3_9d1e_iftrue;
     MUX_uxn_c_l163_c3_9d1e_iffalse <= VAR_MUX_uxn_c_l163_c3_9d1e_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l163_c3_9d1e_return_output := MUX_uxn_c_l163_c3_9d1e_return_output;

     -- BIN_OP_OR[uxn_c_l172_c3_e2e6] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l172_c3_e2e6_left <= VAR_BIN_OP_OR_uxn_c_l172_c3_e2e6_left;
     BIN_OP_OR_uxn_c_l172_c3_e2e6_right <= VAR_BIN_OP_OR_uxn_c_l172_c3_e2e6_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l172_c3_e2e6_return_output := BIN_OP_OR_uxn_c_l172_c3_e2e6_return_output;

     -- MUX[uxn_c_l171_c3_5b03] LATENCY=0
     -- Inputs
     MUX_uxn_c_l171_c3_5b03_cond <= VAR_MUX_uxn_c_l171_c3_5b03_cond;
     MUX_uxn_c_l171_c3_5b03_iftrue <= VAR_MUX_uxn_c_l171_c3_5b03_iftrue;
     MUX_uxn_c_l171_c3_5b03_iffalse <= VAR_MUX_uxn_c_l171_c3_5b03_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l171_c3_5b03_return_output := MUX_uxn_c_l171_c3_5b03_return_output;

     -- MUX[uxn_c_l164_c3_fd98] LATENCY=0
     -- Inputs
     MUX_uxn_c_l164_c3_fd98_cond <= VAR_MUX_uxn_c_l164_c3_fd98_cond;
     MUX_uxn_c_l164_c3_fd98_iftrue <= VAR_MUX_uxn_c_l164_c3_fd98_iftrue;
     MUX_uxn_c_l164_c3_fd98_iffalse <= VAR_MUX_uxn_c_l164_c3_fd98_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l164_c3_fd98_return_output := MUX_uxn_c_l164_c3_fd98_return_output;

     -- MUX[uxn_c_l170_c3_644e] LATENCY=0
     -- Inputs
     MUX_uxn_c_l170_c3_644e_cond <= VAR_MUX_uxn_c_l170_c3_644e_cond;
     MUX_uxn_c_l170_c3_644e_iftrue <= VAR_MUX_uxn_c_l170_c3_644e_iftrue;
     MUX_uxn_c_l170_c3_644e_iffalse <= VAR_MUX_uxn_c_l170_c3_644e_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l170_c3_644e_return_output := MUX_uxn_c_l170_c3_644e_return_output;

     -- BIN_OP_OR[uxn_c_l165_c3_74f3] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l165_c3_74f3_left <= VAR_BIN_OP_OR_uxn_c_l165_c3_74f3_left;
     BIN_OP_OR_uxn_c_l165_c3_74f3_right <= VAR_BIN_OP_OR_uxn_c_l165_c3_74f3_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l165_c3_74f3_return_output := BIN_OP_OR_uxn_c_l165_c3_74f3_return_output;

     -- Submodule level 14
     VAR_bg_vram_update_uxn_c_l161_c19_e18d_write_enable := VAR_BIN_OP_OR_uxn_c_l165_c3_74f3_return_output;
     VAR_fg_vram_update_uxn_c_l168_c19_2c6d_write_enable := VAR_BIN_OP_OR_uxn_c_l172_c3_e2e6_return_output;
     VAR_bg_vram_update_uxn_c_l161_c19_e18d_write_address := VAR_MUX_uxn_c_l163_c3_9d1e_return_output;
     VAR_bg_vram_update_uxn_c_l161_c19_e18d_write_value := VAR_MUX_uxn_c_l164_c3_fd98_return_output;
     VAR_fg_vram_update_uxn_c_l168_c19_2c6d_write_address := VAR_MUX_uxn_c_l170_c3_644e_return_output;
     VAR_fg_vram_update_uxn_c_l168_c19_2c6d_write_value := VAR_MUX_uxn_c_l171_c3_5b03_return_output;
     -- fg_vram_update[uxn_c_l168_c19_2c6d] LATENCY=0
     -- Clock enable
     fg_vram_update_uxn_c_l168_c19_2c6d_CLOCK_ENABLE <= VAR_fg_vram_update_uxn_c_l168_c19_2c6d_CLOCK_ENABLE;
     -- Inputs
     fg_vram_update_uxn_c_l168_c19_2c6d_read_address <= VAR_fg_vram_update_uxn_c_l168_c19_2c6d_read_address;
     fg_vram_update_uxn_c_l168_c19_2c6d_write_address <= VAR_fg_vram_update_uxn_c_l168_c19_2c6d_write_address;
     fg_vram_update_uxn_c_l168_c19_2c6d_write_value <= VAR_fg_vram_update_uxn_c_l168_c19_2c6d_write_value;
     fg_vram_update_uxn_c_l168_c19_2c6d_write_enable <= VAR_fg_vram_update_uxn_c_l168_c19_2c6d_write_enable;
     -- Outputs
     VAR_fg_vram_update_uxn_c_l168_c19_2c6d_return_output := fg_vram_update_uxn_c_l168_c19_2c6d_return_output;

     -- bg_vram_update[uxn_c_l161_c19_e18d] LATENCY=0
     -- Clock enable
     bg_vram_update_uxn_c_l161_c19_e18d_CLOCK_ENABLE <= VAR_bg_vram_update_uxn_c_l161_c19_e18d_CLOCK_ENABLE;
     -- Inputs
     bg_vram_update_uxn_c_l161_c19_e18d_read_address <= VAR_bg_vram_update_uxn_c_l161_c19_e18d_read_address;
     bg_vram_update_uxn_c_l161_c19_e18d_write_address <= VAR_bg_vram_update_uxn_c_l161_c19_e18d_write_address;
     bg_vram_update_uxn_c_l161_c19_e18d_write_value <= VAR_bg_vram_update_uxn_c_l161_c19_e18d_write_value;
     bg_vram_update_uxn_c_l161_c19_e18d_write_enable <= VAR_bg_vram_update_uxn_c_l161_c19_e18d_write_enable;
     -- Outputs
     VAR_bg_vram_update_uxn_c_l161_c19_e18d_return_output := bg_vram_update_uxn_c_l161_c19_e18d_return_output;

     -- Submodule level 15
     VAR_MUX_uxn_c_l185_c17_a869_iftrue := VAR_bg_vram_update_uxn_c_l161_c19_e18d_return_output;
     REG_VAR_bg_pixel_color := VAR_bg_vram_update_uxn_c_l161_c19_e18d_return_output;
     VAR_BIN_OP_EQ_uxn_c_l185_c17_dc11_left := VAR_fg_vram_update_uxn_c_l168_c19_2c6d_return_output;
     VAR_MUX_uxn_c_l185_c17_a869_iffalse := VAR_fg_vram_update_uxn_c_l168_c19_2c6d_return_output;
     REG_VAR_fg_pixel_color := VAR_fg_vram_update_uxn_c_l168_c19_2c6d_return_output;
     -- BIN_OP_EQ[uxn_c_l185_c17_dc11] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l185_c17_dc11_left <= VAR_BIN_OP_EQ_uxn_c_l185_c17_dc11_left;
     BIN_OP_EQ_uxn_c_l185_c17_dc11_right <= VAR_BIN_OP_EQ_uxn_c_l185_c17_dc11_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l185_c17_dc11_return_output := BIN_OP_EQ_uxn_c_l185_c17_dc11_return_output;

     -- Submodule level 16
     VAR_MUX_uxn_c_l185_c17_a869_cond := VAR_BIN_OP_EQ_uxn_c_l185_c17_dc11_return_output;
     -- MUX[uxn_c_l185_c17_a869] LATENCY=0
     -- Inputs
     MUX_uxn_c_l185_c17_a869_cond <= VAR_MUX_uxn_c_l185_c17_a869_cond;
     MUX_uxn_c_l185_c17_a869_iftrue <= VAR_MUX_uxn_c_l185_c17_a869_iftrue;
     MUX_uxn_c_l185_c17_a869_iffalse <= VAR_MUX_uxn_c_l185_c17_a869_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l185_c17_a869_return_output := MUX_uxn_c_l185_c17_a869_return_output;

     -- Submodule level 17
     -- CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_269d_uxn_c_l188_l111_DUPLICATE_ef9d LATENCY=0
     VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_269d_uxn_c_l188_l111_DUPLICATE_ef9d_return_output := CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_269d(
     VAR_result_is_new_frame_MUX_uxn_c_l176_c2_de08_return_output,
     VAR_MUX_uxn_c_l185_c17_a869_return_output,
     VAR_MUX_uxn_c_l150_c19_adb2_return_output);

     -- Submodule level 18
     REG_VAR_result := VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_269d_uxn_c_l188_l111_DUPLICATE_ef9d_return_output;
     VAR_return_output := VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_269d_uxn_c_l188_l111_DUPLICATE_ef9d_return_output;
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
