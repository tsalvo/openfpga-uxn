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
-- Submodules: 71
entity step_gpu_0CLK_6b96c5f3 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 is_active_drawing_area : in unsigned(0 downto 0);
 is_vram_write : in unsigned(0 downto 0);
 vram_write_layer : in unsigned(0 downto 0);
 vram_address : in unsigned(23 downto 0);
 vram_value : in unsigned(1 downto 0);
 return_output : out gpu_step_result_t);
end step_gpu_0CLK_6b96c5f3;
architecture arch of step_gpu_0CLK_6b96c5f3 is
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
signal adjusted_vram_address : unsigned(23 downto 0) := to_unsigned(0, 24);
signal fill_pixels_remaining : unsigned(23 downto 0) := to_unsigned(0, 24);
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
signal pixel_counter : unsigned(17 downto 0) := to_unsigned(0, 18);
signal x : unsigned(15 downto 0) := to_unsigned(0, 16);
signal y : unsigned(15 downto 0) := to_unsigned(0, 16);
signal REG_COMB_result : gpu_step_result_t;
signal REG_COMB_vram_code : unsigned(3 downto 0);
signal REG_COMB_adjusted_vram_address : unsigned(23 downto 0);
signal REG_COMB_fill_pixels_remaining : unsigned(23 downto 0);
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
signal REG_COMB_pixel_counter : unsigned(17 downto 0);
signal REG_COMB_x : unsigned(15 downto 0);
signal REG_COMB_y : unsigned(15 downto 0);

-- Each function instance gets signals
-- CONST_SR_20[uxn_c_l126_c24_959a]
signal CONST_SR_20_uxn_c_l126_c24_959a_x : unsigned(23 downto 0);
signal CONST_SR_20_uxn_c_l126_c24_959a_return_output : unsigned(23 downto 0);

-- BIN_OP_EQ[uxn_c_l127_c17_3068]
signal BIN_OP_EQ_uxn_c_l127_c17_3068_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l127_c17_3068_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l127_c17_3068_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l127_c17_87bc]
signal MUX_uxn_c_l127_c17_87bc_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l127_c17_87bc_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l127_c17_87bc_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l127_c17_87bc_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_c_l130_c22_746b]
signal UNARY_OP_NOT_uxn_c_l130_c22_746b_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l130_c22_746b_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l130_c6_8ef3]
signal BIN_OP_AND_uxn_c_l130_c6_8ef3_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l130_c6_8ef3_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l130_c6_8ef3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l130_c1_22ec]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l130_c1_22ec_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l130_c1_22ec_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l130_c1_22ec_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l130_c1_22ec_return_output : unsigned(0 downto 0);

-- is_fill_active_MUX[uxn_c_l130_c2_ecdf]
signal is_fill_active_MUX_uxn_c_l130_c2_ecdf_cond : unsigned(0 downto 0);
signal is_fill_active_MUX_uxn_c_l130_c2_ecdf_iftrue : unsigned(0 downto 0);
signal is_fill_active_MUX_uxn_c_l130_c2_ecdf_iffalse : unsigned(0 downto 0);
signal is_fill_active_MUX_uxn_c_l130_c2_ecdf_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_c_l130_c2_ecdf]
signal y_MUX_uxn_c_l130_c2_ecdf_cond : unsigned(0 downto 0);
signal y_MUX_uxn_c_l130_c2_ecdf_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_c_l130_c2_ecdf_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_c_l130_c2_ecdf_return_output : unsigned(15 downto 0);

-- fill_x0_MUX[uxn_c_l130_c2_ecdf]
signal fill_x0_MUX_uxn_c_l130_c2_ecdf_cond : unsigned(0 downto 0);
signal fill_x0_MUX_uxn_c_l130_c2_ecdf_iftrue : unsigned(15 downto 0);
signal fill_x0_MUX_uxn_c_l130_c2_ecdf_iffalse : unsigned(15 downto 0);
signal fill_x0_MUX_uxn_c_l130_c2_ecdf_return_output : unsigned(15 downto 0);

-- fill_layer_MUX[uxn_c_l130_c2_ecdf]
signal fill_layer_MUX_uxn_c_l130_c2_ecdf_cond : unsigned(0 downto 0);
signal fill_layer_MUX_uxn_c_l130_c2_ecdf_iftrue : unsigned(0 downto 0);
signal fill_layer_MUX_uxn_c_l130_c2_ecdf_iffalse : unsigned(0 downto 0);
signal fill_layer_MUX_uxn_c_l130_c2_ecdf_return_output : unsigned(0 downto 0);

-- fill_x1_MUX[uxn_c_l130_c2_ecdf]
signal fill_x1_MUX_uxn_c_l130_c2_ecdf_cond : unsigned(0 downto 0);
signal fill_x1_MUX_uxn_c_l130_c2_ecdf_iftrue : unsigned(15 downto 0);
signal fill_x1_MUX_uxn_c_l130_c2_ecdf_iffalse : unsigned(15 downto 0);
signal fill_x1_MUX_uxn_c_l130_c2_ecdf_return_output : unsigned(15 downto 0);

-- fill_y1_MUX[uxn_c_l130_c2_ecdf]
signal fill_y1_MUX_uxn_c_l130_c2_ecdf_cond : unsigned(0 downto 0);
signal fill_y1_MUX_uxn_c_l130_c2_ecdf_iftrue : unsigned(15 downto 0);
signal fill_y1_MUX_uxn_c_l130_c2_ecdf_iffalse : unsigned(15 downto 0);
signal fill_y1_MUX_uxn_c_l130_c2_ecdf_return_output : unsigned(15 downto 0);

-- is_fill_top_MUX[uxn_c_l130_c2_ecdf]
signal is_fill_top_MUX_uxn_c_l130_c2_ecdf_cond : unsigned(0 downto 0);
signal is_fill_top_MUX_uxn_c_l130_c2_ecdf_iftrue : unsigned(0 downto 0);
signal is_fill_top_MUX_uxn_c_l130_c2_ecdf_iffalse : unsigned(0 downto 0);
signal is_fill_top_MUX_uxn_c_l130_c2_ecdf_return_output : unsigned(0 downto 0);

-- fill_y0_MUX[uxn_c_l130_c2_ecdf]
signal fill_y0_MUX_uxn_c_l130_c2_ecdf_cond : unsigned(0 downto 0);
signal fill_y0_MUX_uxn_c_l130_c2_ecdf_iftrue : unsigned(15 downto 0);
signal fill_y0_MUX_uxn_c_l130_c2_ecdf_iffalse : unsigned(15 downto 0);
signal fill_y0_MUX_uxn_c_l130_c2_ecdf_return_output : unsigned(15 downto 0);

-- fill_color_MUX[uxn_c_l130_c2_ecdf]
signal fill_color_MUX_uxn_c_l130_c2_ecdf_cond : unsigned(0 downto 0);
signal fill_color_MUX_uxn_c_l130_c2_ecdf_iftrue : unsigned(1 downto 0);
signal fill_color_MUX_uxn_c_l130_c2_ecdf_iffalse : unsigned(1 downto 0);
signal fill_color_MUX_uxn_c_l130_c2_ecdf_return_output : unsigned(1 downto 0);

-- x_MUX[uxn_c_l130_c2_ecdf]
signal x_MUX_uxn_c_l130_c2_ecdf_cond : unsigned(0 downto 0);
signal x_MUX_uxn_c_l130_c2_ecdf_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_c_l130_c2_ecdf_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_c_l130_c2_ecdf_return_output : unsigned(15 downto 0);

-- fill_pixels_remaining_MUX[uxn_c_l130_c2_ecdf]
signal fill_pixels_remaining_MUX_uxn_c_l130_c2_ecdf_cond : unsigned(0 downto 0);
signal fill_pixels_remaining_MUX_uxn_c_l130_c2_ecdf_iftrue : unsigned(23 downto 0);
signal fill_pixels_remaining_MUX_uxn_c_l130_c2_ecdf_iffalse : unsigned(23 downto 0);
signal fill_pixels_remaining_MUX_uxn_c_l130_c2_ecdf_return_output : unsigned(23 downto 0);

-- CONST_SR_19[uxn_c_l132_c17_afc6]
signal CONST_SR_19_uxn_c_l132_c17_afc6_x : unsigned(23 downto 0);
signal CONST_SR_19_uxn_c_l132_c17_afc6_return_output : unsigned(23 downto 0);

-- CONST_SR_18[uxn_c_l133_c18_9093]
signal CONST_SR_18_uxn_c_l133_c18_9093_x : unsigned(23 downto 0);
signal CONST_SR_18_uxn_c_l133_c18_9093_return_output : unsigned(23 downto 0);

-- BIN_OP_AND[uxn_c_l134_c27_6ab5]
signal BIN_OP_AND_uxn_c_l134_c27_6ab5_left : unsigned(23 downto 0);
signal BIN_OP_AND_uxn_c_l134_c27_6ab5_right : unsigned(17 downto 0);
signal BIN_OP_AND_uxn_c_l134_c27_6ab5_return_output : unsigned(23 downto 0);

-- BIN_OP_DIV[uxn_c_l135_c13_4268]
signal BIN_OP_DIV_uxn_c_l135_c13_4268_left : unsigned(23 downto 0);
signal BIN_OP_DIV_uxn_c_l135_c13_4268_right : unsigned(8 downto 0);
signal BIN_OP_DIV_uxn_c_l135_c13_4268_return_output : unsigned(23 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_c_l136_c38_db87]
signal BIN_OP_INFERRED_MULT_uxn_c_l136_c38_db87_left : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_c_l136_c38_db87_right : unsigned(8 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_c_l136_c38_db87_return_output : unsigned(24 downto 0);

-- BIN_OP_MINUS[uxn_c_l136_c13_4d9d]
signal BIN_OP_MINUS_uxn_c_l136_c13_4d9d_left : unsigned(23 downto 0);
signal BIN_OP_MINUS_uxn_c_l136_c13_4d9d_right : unsigned(24 downto 0);
signal BIN_OP_MINUS_uxn_c_l136_c13_4d9d_return_output : unsigned(23 downto 0);

-- MUX[uxn_c_l137_c13_452c]
signal MUX_uxn_c_l137_c13_452c_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l137_c13_452c_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l137_c13_452c_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l137_c13_452c_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l138_c13_c906]
signal MUX_uxn_c_l138_c13_c906_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l138_c13_c906_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l138_c13_c906_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l138_c13_c906_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l139_c13_8149]
signal MUX_uxn_c_l139_c13_8149_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l139_c13_8149_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l139_c13_8149_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l139_c13_8149_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l140_c13_b5b9]
signal MUX_uxn_c_l140_c13_b5b9_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l140_c13_b5b9_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l140_c13_b5b9_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l140_c13_b5b9_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_c_l143_c28_bb3b]
signal BIN_OP_MINUS_uxn_c_l143_c28_bb3b_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_c_l143_c28_bb3b_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_c_l143_c28_bb3b_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_c_l143_c50_7f67]
signal BIN_OP_MINUS_uxn_c_l143_c50_7f67_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_c_l143_c50_7f67_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_c_l143_c50_7f67_return_output : unsigned(15 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_c_l143_c28_31f3]
signal BIN_OP_INFERRED_MULT_uxn_c_l143_c28_31f3_left : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_c_l143_c28_31f3_right : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_c_l143_c28_31f3_return_output : unsigned(31 downto 0);

-- printf_uxn_c_l146_c3_21e4[uxn_c_l146_c3_21e4]
signal printf_uxn_c_l146_c3_21e4_uxn_c_l146_c3_21e4_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_c_l146_c3_21e4_uxn_c_l146_c3_21e4_arg0 : unsigned(31 downto 0);
signal printf_uxn_c_l146_c3_21e4_uxn_c_l146_c3_21e4_arg1 : unsigned(31 downto 0);
signal printf_uxn_c_l146_c3_21e4_uxn_c_l146_c3_21e4_arg2 : unsigned(31 downto 0);
signal printf_uxn_c_l146_c3_21e4_uxn_c_l146_c3_21e4_arg3 : unsigned(31 downto 0);
signal printf_uxn_c_l146_c3_21e4_uxn_c_l146_c3_21e4_arg4 : unsigned(31 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_c_l149_c45_0f72]
signal BIN_OP_INFERRED_MULT_uxn_c_l149_c45_0f72_left : unsigned(23 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_c_l149_c45_0f72_right : unsigned(23 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_c_l149_c45_0f72_return_output : unsigned(47 downto 0);

-- BIN_OP_PLUS[uxn_c_l149_c45_4c60]
signal BIN_OP_PLUS_uxn_c_l149_c45_4c60_left : unsigned(47 downto 0);
signal BIN_OP_PLUS_uxn_c_l149_c45_4c60_right : unsigned(23 downto 0);
signal BIN_OP_PLUS_uxn_c_l149_c45_4c60_return_output : unsigned(48 downto 0);

-- BIN_OP_AND[uxn_c_l149_c100_80b5]
signal BIN_OP_AND_uxn_c_l149_c100_80b5_left : unsigned(23 downto 0);
signal BIN_OP_AND_uxn_c_l149_c100_80b5_right : unsigned(17 downto 0);
signal BIN_OP_AND_uxn_c_l149_c100_80b5_return_output : unsigned(23 downto 0);

-- MUX[uxn_c_l149_c26_6e3c]
signal MUX_uxn_c_l149_c26_6e3c_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l149_c26_6e3c_iftrue : unsigned(23 downto 0);
signal MUX_uxn_c_l149_c26_6e3c_iffalse : unsigned(23 downto 0);
signal MUX_uxn_c_l149_c26_6e3c_return_output : unsigned(23 downto 0);

-- BIN_OP_EQ[uxn_c_l151_c18_f3b5]
signal BIN_OP_EQ_uxn_c_l151_c18_f3b5_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l151_c18_f3b5_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l151_c18_f3b5_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l151_c18_0896]
signal MUX_uxn_c_l151_c18_0896_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l151_c18_0896_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l151_c18_0896_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l151_c18_0896_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l152_c22_8d8a]
signal BIN_OP_PLUS_uxn_c_l152_c22_8d8a_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l152_c22_8d8a_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l152_c22_8d8a_return_output : unsigned(16 downto 0);

-- MUX[uxn_c_l152_c6_e650]
signal MUX_uxn_c_l152_c6_e650_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l152_c6_e650_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l152_c6_e650_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l152_c6_e650_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_c_l153_c31_c235]
signal BIN_OP_PLUS_uxn_c_l153_c31_c235_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l153_c31_c235_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l153_c31_c235_return_output : unsigned(16 downto 0);

-- MUX[uxn_c_l153_c6_b4de]
signal MUX_uxn_c_l153_c6_b4de_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l153_c6_b4de_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l153_c6_b4de_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l153_c6_b4de_return_output : unsigned(15 downto 0);

-- UNARY_OP_NOT[uxn_c_l155_c38_108a]
signal UNARY_OP_NOT_uxn_c_l155_c38_108a_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l155_c38_108a_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l155_c19_4ddb]
signal BIN_OP_AND_uxn_c_l155_c19_4ddb_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l155_c19_4ddb_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l155_c19_4ddb_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l156_c19_aa24]
signal BIN_OP_AND_uxn_c_l156_c19_aa24_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l156_c19_aa24_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l156_c19_aa24_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l161_c3_e2e9]
signal MUX_uxn_c_l161_c3_e2e9_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l161_c3_e2e9_iftrue : unsigned(1 downto 0);
signal MUX_uxn_c_l161_c3_e2e9_iffalse : unsigned(1 downto 0);
signal MUX_uxn_c_l161_c3_e2e9_return_output : unsigned(1 downto 0);

-- UNARY_OP_NOT[uxn_c_l162_c57_329f]
signal UNARY_OP_NOT_uxn_c_l162_c57_329f_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l162_c57_329f_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l162_c22_aafd]
signal BIN_OP_AND_uxn_c_l162_c22_aafd_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l162_c22_aafd_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l162_c22_aafd_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_c_l162_c3_aba4]
signal BIN_OP_OR_uxn_c_l162_c3_aba4_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l162_c3_aba4_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l162_c3_aba4_return_output : unsigned(0 downto 0);

-- bg_vram_update[uxn_c_l158_c19_b0fe]
signal bg_vram_update_uxn_c_l158_c19_b0fe_CLOCK_ENABLE : unsigned(0 downto 0);
signal bg_vram_update_uxn_c_l158_c19_b0fe_read_address : unsigned(23 downto 0);
signal bg_vram_update_uxn_c_l158_c19_b0fe_write_address : unsigned(23 downto 0);
signal bg_vram_update_uxn_c_l158_c19_b0fe_write_value : unsigned(1 downto 0);
signal bg_vram_update_uxn_c_l158_c19_b0fe_write_enable : unsigned(0 downto 0);
signal bg_vram_update_uxn_c_l158_c19_b0fe_return_output : unsigned(1 downto 0);

-- MUX[uxn_c_l168_c3_c5a0]
signal MUX_uxn_c_l168_c3_c5a0_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l168_c3_c5a0_iftrue : unsigned(1 downto 0);
signal MUX_uxn_c_l168_c3_c5a0_iffalse : unsigned(1 downto 0);
signal MUX_uxn_c_l168_c3_c5a0_return_output : unsigned(1 downto 0);

-- BIN_OP_AND[uxn_c_l169_c22_1f5d]
signal BIN_OP_AND_uxn_c_l169_c22_1f5d_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l169_c22_1f5d_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l169_c22_1f5d_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_c_l169_c3_6a0f]
signal BIN_OP_OR_uxn_c_l169_c3_6a0f_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l169_c3_6a0f_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l169_c3_6a0f_return_output : unsigned(0 downto 0);

-- fg_vram_update[uxn_c_l165_c19_cbce]
signal fg_vram_update_uxn_c_l165_c19_cbce_CLOCK_ENABLE : unsigned(0 downto 0);
signal fg_vram_update_uxn_c_l165_c19_cbce_read_address : unsigned(23 downto 0);
signal fg_vram_update_uxn_c_l165_c19_cbce_write_address : unsigned(23 downto 0);
signal fg_vram_update_uxn_c_l165_c19_cbce_write_value : unsigned(1 downto 0);
signal fg_vram_update_uxn_c_l165_c19_cbce_write_enable : unsigned(0 downto 0);
signal fg_vram_update_uxn_c_l165_c19_cbce_return_output : unsigned(1 downto 0);

-- BIN_OP_MINUS[uxn_c_l172_c43_e889]
signal BIN_OP_MINUS_uxn_c_l172_c43_e889_left : unsigned(23 downto 0);
signal BIN_OP_MINUS_uxn_c_l172_c43_e889_right : unsigned(0 downto 0);
signal BIN_OP_MINUS_uxn_c_l172_c43_e889_return_output : unsigned(23 downto 0);

-- MUX[uxn_c_l172_c26_e62a]
signal MUX_uxn_c_l172_c26_e62a_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l172_c26_e62a_iftrue : unsigned(23 downto 0);
signal MUX_uxn_c_l172_c26_e62a_iffalse : unsigned(23 downto 0);
signal MUX_uxn_c_l172_c26_e62a_return_output : unsigned(23 downto 0);

-- BIN_OP_EQ[uxn_c_l173_c19_fb64]
signal BIN_OP_EQ_uxn_c_l173_c19_fb64_left : unsigned(23 downto 0);
signal BIN_OP_EQ_uxn_c_l173_c19_fb64_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l173_c19_fb64_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l173_c19_a1d7]
signal MUX_uxn_c_l173_c19_a1d7_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l173_c19_a1d7_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l173_c19_a1d7_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l173_c19_a1d7_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l174_c19_8050]
signal BIN_OP_EQ_uxn_c_l174_c19_8050_left : unsigned(17 downto 0);
signal BIN_OP_EQ_uxn_c_l174_c19_8050_right : unsigned(17 downto 0);
signal BIN_OP_EQ_uxn_c_l174_c19_8050_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l174_c77_bcbb]
signal BIN_OP_PLUS_uxn_c_l174_c77_bcbb_left : unsigned(17 downto 0);
signal BIN_OP_PLUS_uxn_c_l174_c77_bcbb_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l174_c77_bcbb_return_output : unsigned(18 downto 0);

-- MUX[uxn_c_l174_c51_4198]
signal MUX_uxn_c_l174_c51_4198_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l174_c51_4198_iftrue : unsigned(17 downto 0);
signal MUX_uxn_c_l174_c51_4198_iffalse : unsigned(17 downto 0);
signal MUX_uxn_c_l174_c51_4198_return_output : unsigned(17 downto 0);

-- MUX[uxn_c_l174_c19_50aa]
signal MUX_uxn_c_l174_c19_50aa_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l174_c19_50aa_iftrue : unsigned(17 downto 0);
signal MUX_uxn_c_l174_c19_50aa_iffalse : unsigned(17 downto 0);
signal MUX_uxn_c_l174_c19_50aa_return_output : unsigned(17 downto 0);

-- BIN_OP_EQ[uxn_c_l175_c25_94ac]
signal BIN_OP_EQ_uxn_c_l175_c25_94ac_left : unsigned(17 downto 0);
signal BIN_OP_EQ_uxn_c_l175_c25_94ac_right : unsigned(17 downto 0);
signal BIN_OP_EQ_uxn_c_l175_c25_94ac_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l175_c25_d68d]
signal MUX_uxn_c_l175_c25_d68d_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l175_c25_d68d_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l175_c25_d68d_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l175_c25_d68d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l176_c17_075e]
signal BIN_OP_EQ_uxn_c_l176_c17_075e_left : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l176_c17_075e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l176_c17_075e_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l176_c17_a75e]
signal MUX_uxn_c_l176_c17_a75e_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l176_c17_a75e_iftrue : unsigned(1 downto 0);
signal MUX_uxn_c_l176_c17_a75e_iffalse : unsigned(1 downto 0);
signal MUX_uxn_c_l176_c17_a75e_return_output : unsigned(1 downto 0);

-- UNARY_OP_NOT_uint1_t_uxn_c_l162_l169_DUPLICATE_57ec
signal UNARY_OP_NOT_uint1_t_uxn_c_l162_l169_DUPLICATE_57ec_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uint1_t_uxn_c_l162_l169_DUPLICATE_57ec_return_output : unsigned(0 downto 0);

-- BIN_OP_AND_uint1_t_uint1_t_uxn_c_l169_l162_DUPLICATE_22d2
signal BIN_OP_AND_uint1_t_uint1_t_uxn_c_l169_l162_DUPLICATE_22d2_left : unsigned(0 downto 0);
signal BIN_OP_AND_uint1_t_uint1_t_uxn_c_l169_l162_DUPLICATE_22d2_right : unsigned(0 downto 0);
signal BIN_OP_AND_uint1_t_uint1_t_uxn_c_l169_l162_DUPLICATE_22d2_return_output : unsigned(0 downto 0);

function CAST_TO_uint4_t_uint24_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(23 downto 0);
  variable return_output : unsigned(3 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,4)));
    return return_output;
end function;

function CAST_TO_uint24_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(23 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,24)));
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
-- CONST_SR_20_uxn_c_l126_c24_959a
CONST_SR_20_uxn_c_l126_c24_959a : entity work.CONST_SR_20_uint24_t_0CLK_de264c78 port map (
CONST_SR_20_uxn_c_l126_c24_959a_x,
CONST_SR_20_uxn_c_l126_c24_959a_return_output);

-- BIN_OP_EQ_uxn_c_l127_c17_3068
BIN_OP_EQ_uxn_c_l127_c17_3068 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l127_c17_3068_left,
BIN_OP_EQ_uxn_c_l127_c17_3068_right,
BIN_OP_EQ_uxn_c_l127_c17_3068_return_output);

-- MUX_uxn_c_l127_c17_87bc
MUX_uxn_c_l127_c17_87bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l127_c17_87bc_cond,
MUX_uxn_c_l127_c17_87bc_iftrue,
MUX_uxn_c_l127_c17_87bc_iffalse,
MUX_uxn_c_l127_c17_87bc_return_output);

-- UNARY_OP_NOT_uxn_c_l130_c22_746b
UNARY_OP_NOT_uxn_c_l130_c22_746b : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l130_c22_746b_expr,
UNARY_OP_NOT_uxn_c_l130_c22_746b_return_output);

-- BIN_OP_AND_uxn_c_l130_c6_8ef3
BIN_OP_AND_uxn_c_l130_c6_8ef3 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l130_c6_8ef3_left,
BIN_OP_AND_uxn_c_l130_c6_8ef3_right,
BIN_OP_AND_uxn_c_l130_c6_8ef3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l130_c1_22ec
TRUE_CLOCK_ENABLE_MUX_uxn_c_l130_c1_22ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l130_c1_22ec_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l130_c1_22ec_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l130_c1_22ec_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l130_c1_22ec_return_output);

-- is_fill_active_MUX_uxn_c_l130_c2_ecdf
is_fill_active_MUX_uxn_c_l130_c2_ecdf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_active_MUX_uxn_c_l130_c2_ecdf_cond,
is_fill_active_MUX_uxn_c_l130_c2_ecdf_iftrue,
is_fill_active_MUX_uxn_c_l130_c2_ecdf_iffalse,
is_fill_active_MUX_uxn_c_l130_c2_ecdf_return_output);

-- y_MUX_uxn_c_l130_c2_ecdf
y_MUX_uxn_c_l130_c2_ecdf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_c_l130_c2_ecdf_cond,
y_MUX_uxn_c_l130_c2_ecdf_iftrue,
y_MUX_uxn_c_l130_c2_ecdf_iffalse,
y_MUX_uxn_c_l130_c2_ecdf_return_output);

-- fill_x0_MUX_uxn_c_l130_c2_ecdf
fill_x0_MUX_uxn_c_l130_c2_ecdf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_x0_MUX_uxn_c_l130_c2_ecdf_cond,
fill_x0_MUX_uxn_c_l130_c2_ecdf_iftrue,
fill_x0_MUX_uxn_c_l130_c2_ecdf_iffalse,
fill_x0_MUX_uxn_c_l130_c2_ecdf_return_output);

-- fill_layer_MUX_uxn_c_l130_c2_ecdf
fill_layer_MUX_uxn_c_l130_c2_ecdf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
fill_layer_MUX_uxn_c_l130_c2_ecdf_cond,
fill_layer_MUX_uxn_c_l130_c2_ecdf_iftrue,
fill_layer_MUX_uxn_c_l130_c2_ecdf_iffalse,
fill_layer_MUX_uxn_c_l130_c2_ecdf_return_output);

-- fill_x1_MUX_uxn_c_l130_c2_ecdf
fill_x1_MUX_uxn_c_l130_c2_ecdf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_x1_MUX_uxn_c_l130_c2_ecdf_cond,
fill_x1_MUX_uxn_c_l130_c2_ecdf_iftrue,
fill_x1_MUX_uxn_c_l130_c2_ecdf_iffalse,
fill_x1_MUX_uxn_c_l130_c2_ecdf_return_output);

-- fill_y1_MUX_uxn_c_l130_c2_ecdf
fill_y1_MUX_uxn_c_l130_c2_ecdf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_y1_MUX_uxn_c_l130_c2_ecdf_cond,
fill_y1_MUX_uxn_c_l130_c2_ecdf_iftrue,
fill_y1_MUX_uxn_c_l130_c2_ecdf_iffalse,
fill_y1_MUX_uxn_c_l130_c2_ecdf_return_output);

-- is_fill_top_MUX_uxn_c_l130_c2_ecdf
is_fill_top_MUX_uxn_c_l130_c2_ecdf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_top_MUX_uxn_c_l130_c2_ecdf_cond,
is_fill_top_MUX_uxn_c_l130_c2_ecdf_iftrue,
is_fill_top_MUX_uxn_c_l130_c2_ecdf_iffalse,
is_fill_top_MUX_uxn_c_l130_c2_ecdf_return_output);

-- fill_y0_MUX_uxn_c_l130_c2_ecdf
fill_y0_MUX_uxn_c_l130_c2_ecdf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_y0_MUX_uxn_c_l130_c2_ecdf_cond,
fill_y0_MUX_uxn_c_l130_c2_ecdf_iftrue,
fill_y0_MUX_uxn_c_l130_c2_ecdf_iffalse,
fill_y0_MUX_uxn_c_l130_c2_ecdf_return_output);

-- fill_color_MUX_uxn_c_l130_c2_ecdf
fill_color_MUX_uxn_c_l130_c2_ecdf : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
fill_color_MUX_uxn_c_l130_c2_ecdf_cond,
fill_color_MUX_uxn_c_l130_c2_ecdf_iftrue,
fill_color_MUX_uxn_c_l130_c2_ecdf_iffalse,
fill_color_MUX_uxn_c_l130_c2_ecdf_return_output);

-- x_MUX_uxn_c_l130_c2_ecdf
x_MUX_uxn_c_l130_c2_ecdf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_c_l130_c2_ecdf_cond,
x_MUX_uxn_c_l130_c2_ecdf_iftrue,
x_MUX_uxn_c_l130_c2_ecdf_iffalse,
x_MUX_uxn_c_l130_c2_ecdf_return_output);

-- fill_pixels_remaining_MUX_uxn_c_l130_c2_ecdf
fill_pixels_remaining_MUX_uxn_c_l130_c2_ecdf : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
fill_pixels_remaining_MUX_uxn_c_l130_c2_ecdf_cond,
fill_pixels_remaining_MUX_uxn_c_l130_c2_ecdf_iftrue,
fill_pixels_remaining_MUX_uxn_c_l130_c2_ecdf_iffalse,
fill_pixels_remaining_MUX_uxn_c_l130_c2_ecdf_return_output);

-- CONST_SR_19_uxn_c_l132_c17_afc6
CONST_SR_19_uxn_c_l132_c17_afc6 : entity work.CONST_SR_19_uint24_t_0CLK_de264c78 port map (
CONST_SR_19_uxn_c_l132_c17_afc6_x,
CONST_SR_19_uxn_c_l132_c17_afc6_return_output);

-- CONST_SR_18_uxn_c_l133_c18_9093
CONST_SR_18_uxn_c_l133_c18_9093 : entity work.CONST_SR_18_uint24_t_0CLK_de264c78 port map (
CONST_SR_18_uxn_c_l133_c18_9093_x,
CONST_SR_18_uxn_c_l133_c18_9093_return_output);

-- BIN_OP_AND_uxn_c_l134_c27_6ab5
BIN_OP_AND_uxn_c_l134_c27_6ab5 : entity work.BIN_OP_AND_uint24_t_uint18_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l134_c27_6ab5_left,
BIN_OP_AND_uxn_c_l134_c27_6ab5_right,
BIN_OP_AND_uxn_c_l134_c27_6ab5_return_output);

-- BIN_OP_DIV_uxn_c_l135_c13_4268
BIN_OP_DIV_uxn_c_l135_c13_4268 : entity work.BIN_OP_DIV_uint24_t_uint9_t_0CLK_1051b6f1 port map (
BIN_OP_DIV_uxn_c_l135_c13_4268_left,
BIN_OP_DIV_uxn_c_l135_c13_4268_right,
BIN_OP_DIV_uxn_c_l135_c13_4268_return_output);

-- BIN_OP_INFERRED_MULT_uxn_c_l136_c38_db87
BIN_OP_INFERRED_MULT_uxn_c_l136_c38_db87 : entity work.BIN_OP_INFERRED_MULT_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_c_l136_c38_db87_left,
BIN_OP_INFERRED_MULT_uxn_c_l136_c38_db87_right,
BIN_OP_INFERRED_MULT_uxn_c_l136_c38_db87_return_output);

-- BIN_OP_MINUS_uxn_c_l136_c13_4d9d
BIN_OP_MINUS_uxn_c_l136_c13_4d9d : entity work.BIN_OP_MINUS_uint24_t_uint25_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l136_c13_4d9d_left,
BIN_OP_MINUS_uxn_c_l136_c13_4d9d_right,
BIN_OP_MINUS_uxn_c_l136_c13_4d9d_return_output);

-- MUX_uxn_c_l137_c13_452c
MUX_uxn_c_l137_c13_452c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l137_c13_452c_cond,
MUX_uxn_c_l137_c13_452c_iftrue,
MUX_uxn_c_l137_c13_452c_iffalse,
MUX_uxn_c_l137_c13_452c_return_output);

-- MUX_uxn_c_l138_c13_c906
MUX_uxn_c_l138_c13_c906 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l138_c13_c906_cond,
MUX_uxn_c_l138_c13_c906_iftrue,
MUX_uxn_c_l138_c13_c906_iffalse,
MUX_uxn_c_l138_c13_c906_return_output);

-- MUX_uxn_c_l139_c13_8149
MUX_uxn_c_l139_c13_8149 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l139_c13_8149_cond,
MUX_uxn_c_l139_c13_8149_iftrue,
MUX_uxn_c_l139_c13_8149_iffalse,
MUX_uxn_c_l139_c13_8149_return_output);

-- MUX_uxn_c_l140_c13_b5b9
MUX_uxn_c_l140_c13_b5b9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l140_c13_b5b9_cond,
MUX_uxn_c_l140_c13_b5b9_iftrue,
MUX_uxn_c_l140_c13_b5b9_iffalse,
MUX_uxn_c_l140_c13_b5b9_return_output);

-- BIN_OP_MINUS_uxn_c_l143_c28_bb3b
BIN_OP_MINUS_uxn_c_l143_c28_bb3b : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l143_c28_bb3b_left,
BIN_OP_MINUS_uxn_c_l143_c28_bb3b_right,
BIN_OP_MINUS_uxn_c_l143_c28_bb3b_return_output);

-- BIN_OP_MINUS_uxn_c_l143_c50_7f67
BIN_OP_MINUS_uxn_c_l143_c50_7f67 : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l143_c50_7f67_left,
BIN_OP_MINUS_uxn_c_l143_c50_7f67_right,
BIN_OP_MINUS_uxn_c_l143_c50_7f67_return_output);

-- BIN_OP_INFERRED_MULT_uxn_c_l143_c28_31f3
BIN_OP_INFERRED_MULT_uxn_c_l143_c28_31f3 : entity work.BIN_OP_INFERRED_MULT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_c_l143_c28_31f3_left,
BIN_OP_INFERRED_MULT_uxn_c_l143_c28_31f3_right,
BIN_OP_INFERRED_MULT_uxn_c_l143_c28_31f3_return_output);

-- printf_uxn_c_l146_c3_21e4_uxn_c_l146_c3_21e4
printf_uxn_c_l146_c3_21e4_uxn_c_l146_c3_21e4 : entity work.printf_uxn_c_l146_c3_21e4_0CLK_de264c78 port map (
printf_uxn_c_l146_c3_21e4_uxn_c_l146_c3_21e4_CLOCK_ENABLE,
printf_uxn_c_l146_c3_21e4_uxn_c_l146_c3_21e4_arg0,
printf_uxn_c_l146_c3_21e4_uxn_c_l146_c3_21e4_arg1,
printf_uxn_c_l146_c3_21e4_uxn_c_l146_c3_21e4_arg2,
printf_uxn_c_l146_c3_21e4_uxn_c_l146_c3_21e4_arg3,
printf_uxn_c_l146_c3_21e4_uxn_c_l146_c3_21e4_arg4);

-- BIN_OP_INFERRED_MULT_uxn_c_l149_c45_0f72
BIN_OP_INFERRED_MULT_uxn_c_l149_c45_0f72 : entity work.BIN_OP_INFERRED_MULT_uint24_t_uint24_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_c_l149_c45_0f72_left,
BIN_OP_INFERRED_MULT_uxn_c_l149_c45_0f72_right,
BIN_OP_INFERRED_MULT_uxn_c_l149_c45_0f72_return_output);

-- BIN_OP_PLUS_uxn_c_l149_c45_4c60
BIN_OP_PLUS_uxn_c_l149_c45_4c60 : entity work.BIN_OP_PLUS_uint48_t_uint24_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l149_c45_4c60_left,
BIN_OP_PLUS_uxn_c_l149_c45_4c60_right,
BIN_OP_PLUS_uxn_c_l149_c45_4c60_return_output);

-- BIN_OP_AND_uxn_c_l149_c100_80b5
BIN_OP_AND_uxn_c_l149_c100_80b5 : entity work.BIN_OP_AND_uint24_t_uint18_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l149_c100_80b5_left,
BIN_OP_AND_uxn_c_l149_c100_80b5_right,
BIN_OP_AND_uxn_c_l149_c100_80b5_return_output);

-- MUX_uxn_c_l149_c26_6e3c
MUX_uxn_c_l149_c26_6e3c : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
MUX_uxn_c_l149_c26_6e3c_cond,
MUX_uxn_c_l149_c26_6e3c_iftrue,
MUX_uxn_c_l149_c26_6e3c_iffalse,
MUX_uxn_c_l149_c26_6e3c_return_output);

-- BIN_OP_EQ_uxn_c_l151_c18_f3b5
BIN_OP_EQ_uxn_c_l151_c18_f3b5 : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l151_c18_f3b5_left,
BIN_OP_EQ_uxn_c_l151_c18_f3b5_right,
BIN_OP_EQ_uxn_c_l151_c18_f3b5_return_output);

-- MUX_uxn_c_l151_c18_0896
MUX_uxn_c_l151_c18_0896 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l151_c18_0896_cond,
MUX_uxn_c_l151_c18_0896_iftrue,
MUX_uxn_c_l151_c18_0896_iffalse,
MUX_uxn_c_l151_c18_0896_return_output);

-- BIN_OP_PLUS_uxn_c_l152_c22_8d8a
BIN_OP_PLUS_uxn_c_l152_c22_8d8a : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l152_c22_8d8a_left,
BIN_OP_PLUS_uxn_c_l152_c22_8d8a_right,
BIN_OP_PLUS_uxn_c_l152_c22_8d8a_return_output);

-- MUX_uxn_c_l152_c6_e650
MUX_uxn_c_l152_c6_e650 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l152_c6_e650_cond,
MUX_uxn_c_l152_c6_e650_iftrue,
MUX_uxn_c_l152_c6_e650_iffalse,
MUX_uxn_c_l152_c6_e650_return_output);

-- BIN_OP_PLUS_uxn_c_l153_c31_c235
BIN_OP_PLUS_uxn_c_l153_c31_c235 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l153_c31_c235_left,
BIN_OP_PLUS_uxn_c_l153_c31_c235_right,
BIN_OP_PLUS_uxn_c_l153_c31_c235_return_output);

-- MUX_uxn_c_l153_c6_b4de
MUX_uxn_c_l153_c6_b4de : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l153_c6_b4de_cond,
MUX_uxn_c_l153_c6_b4de_iftrue,
MUX_uxn_c_l153_c6_b4de_iffalse,
MUX_uxn_c_l153_c6_b4de_return_output);

-- UNARY_OP_NOT_uxn_c_l155_c38_108a
UNARY_OP_NOT_uxn_c_l155_c38_108a : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l155_c38_108a_expr,
UNARY_OP_NOT_uxn_c_l155_c38_108a_return_output);

-- BIN_OP_AND_uxn_c_l155_c19_4ddb
BIN_OP_AND_uxn_c_l155_c19_4ddb : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l155_c19_4ddb_left,
BIN_OP_AND_uxn_c_l155_c19_4ddb_right,
BIN_OP_AND_uxn_c_l155_c19_4ddb_return_output);

-- BIN_OP_AND_uxn_c_l156_c19_aa24
BIN_OP_AND_uxn_c_l156_c19_aa24 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l156_c19_aa24_left,
BIN_OP_AND_uxn_c_l156_c19_aa24_right,
BIN_OP_AND_uxn_c_l156_c19_aa24_return_output);

-- MUX_uxn_c_l161_c3_e2e9
MUX_uxn_c_l161_c3_e2e9 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
MUX_uxn_c_l161_c3_e2e9_cond,
MUX_uxn_c_l161_c3_e2e9_iftrue,
MUX_uxn_c_l161_c3_e2e9_iffalse,
MUX_uxn_c_l161_c3_e2e9_return_output);

-- UNARY_OP_NOT_uxn_c_l162_c57_329f
UNARY_OP_NOT_uxn_c_l162_c57_329f : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l162_c57_329f_expr,
UNARY_OP_NOT_uxn_c_l162_c57_329f_return_output);

-- BIN_OP_AND_uxn_c_l162_c22_aafd
BIN_OP_AND_uxn_c_l162_c22_aafd : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l162_c22_aafd_left,
BIN_OP_AND_uxn_c_l162_c22_aafd_right,
BIN_OP_AND_uxn_c_l162_c22_aafd_return_output);

-- BIN_OP_OR_uxn_c_l162_c3_aba4
BIN_OP_OR_uxn_c_l162_c3_aba4 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l162_c3_aba4_left,
BIN_OP_OR_uxn_c_l162_c3_aba4_right,
BIN_OP_OR_uxn_c_l162_c3_aba4_return_output);

-- bg_vram_update_uxn_c_l158_c19_b0fe
bg_vram_update_uxn_c_l158_c19_b0fe : entity work.bg_vram_update_0CLK_6f2c5aad port map (
clk,
bg_vram_update_uxn_c_l158_c19_b0fe_CLOCK_ENABLE,
bg_vram_update_uxn_c_l158_c19_b0fe_read_address,
bg_vram_update_uxn_c_l158_c19_b0fe_write_address,
bg_vram_update_uxn_c_l158_c19_b0fe_write_value,
bg_vram_update_uxn_c_l158_c19_b0fe_write_enable,
bg_vram_update_uxn_c_l158_c19_b0fe_return_output);

-- MUX_uxn_c_l168_c3_c5a0
MUX_uxn_c_l168_c3_c5a0 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
MUX_uxn_c_l168_c3_c5a0_cond,
MUX_uxn_c_l168_c3_c5a0_iftrue,
MUX_uxn_c_l168_c3_c5a0_iffalse,
MUX_uxn_c_l168_c3_c5a0_return_output);

-- BIN_OP_AND_uxn_c_l169_c22_1f5d
BIN_OP_AND_uxn_c_l169_c22_1f5d : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l169_c22_1f5d_left,
BIN_OP_AND_uxn_c_l169_c22_1f5d_right,
BIN_OP_AND_uxn_c_l169_c22_1f5d_return_output);

-- BIN_OP_OR_uxn_c_l169_c3_6a0f
BIN_OP_OR_uxn_c_l169_c3_6a0f : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l169_c3_6a0f_left,
BIN_OP_OR_uxn_c_l169_c3_6a0f_right,
BIN_OP_OR_uxn_c_l169_c3_6a0f_return_output);

-- fg_vram_update_uxn_c_l165_c19_cbce
fg_vram_update_uxn_c_l165_c19_cbce : entity work.fg_vram_update_0CLK_6f2c5aad port map (
clk,
fg_vram_update_uxn_c_l165_c19_cbce_CLOCK_ENABLE,
fg_vram_update_uxn_c_l165_c19_cbce_read_address,
fg_vram_update_uxn_c_l165_c19_cbce_write_address,
fg_vram_update_uxn_c_l165_c19_cbce_write_value,
fg_vram_update_uxn_c_l165_c19_cbce_write_enable,
fg_vram_update_uxn_c_l165_c19_cbce_return_output);

-- BIN_OP_MINUS_uxn_c_l172_c43_e889
BIN_OP_MINUS_uxn_c_l172_c43_e889 : entity work.BIN_OP_MINUS_uint24_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l172_c43_e889_left,
BIN_OP_MINUS_uxn_c_l172_c43_e889_right,
BIN_OP_MINUS_uxn_c_l172_c43_e889_return_output);

-- MUX_uxn_c_l172_c26_e62a
MUX_uxn_c_l172_c26_e62a : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
MUX_uxn_c_l172_c26_e62a_cond,
MUX_uxn_c_l172_c26_e62a_iftrue,
MUX_uxn_c_l172_c26_e62a_iffalse,
MUX_uxn_c_l172_c26_e62a_return_output);

-- BIN_OP_EQ_uxn_c_l173_c19_fb64
BIN_OP_EQ_uxn_c_l173_c19_fb64 : entity work.BIN_OP_EQ_uint24_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l173_c19_fb64_left,
BIN_OP_EQ_uxn_c_l173_c19_fb64_right,
BIN_OP_EQ_uxn_c_l173_c19_fb64_return_output);

-- MUX_uxn_c_l173_c19_a1d7
MUX_uxn_c_l173_c19_a1d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l173_c19_a1d7_cond,
MUX_uxn_c_l173_c19_a1d7_iftrue,
MUX_uxn_c_l173_c19_a1d7_iffalse,
MUX_uxn_c_l173_c19_a1d7_return_output);

-- BIN_OP_EQ_uxn_c_l174_c19_8050
BIN_OP_EQ_uxn_c_l174_c19_8050 : entity work.BIN_OP_EQ_uint18_t_uint18_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l174_c19_8050_left,
BIN_OP_EQ_uxn_c_l174_c19_8050_right,
BIN_OP_EQ_uxn_c_l174_c19_8050_return_output);

-- BIN_OP_PLUS_uxn_c_l174_c77_bcbb
BIN_OP_PLUS_uxn_c_l174_c77_bcbb : entity work.BIN_OP_PLUS_uint18_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l174_c77_bcbb_left,
BIN_OP_PLUS_uxn_c_l174_c77_bcbb_right,
BIN_OP_PLUS_uxn_c_l174_c77_bcbb_return_output);

-- MUX_uxn_c_l174_c51_4198
MUX_uxn_c_l174_c51_4198 : entity work.MUX_uint1_t_uint18_t_uint18_t_0CLK_de264c78 port map (
MUX_uxn_c_l174_c51_4198_cond,
MUX_uxn_c_l174_c51_4198_iftrue,
MUX_uxn_c_l174_c51_4198_iffalse,
MUX_uxn_c_l174_c51_4198_return_output);

-- MUX_uxn_c_l174_c19_50aa
MUX_uxn_c_l174_c19_50aa : entity work.MUX_uint1_t_uint18_t_uint18_t_0CLK_de264c78 port map (
MUX_uxn_c_l174_c19_50aa_cond,
MUX_uxn_c_l174_c19_50aa_iftrue,
MUX_uxn_c_l174_c19_50aa_iffalse,
MUX_uxn_c_l174_c19_50aa_return_output);

-- BIN_OP_EQ_uxn_c_l175_c25_94ac
BIN_OP_EQ_uxn_c_l175_c25_94ac : entity work.BIN_OP_EQ_uint18_t_uint18_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l175_c25_94ac_left,
BIN_OP_EQ_uxn_c_l175_c25_94ac_right,
BIN_OP_EQ_uxn_c_l175_c25_94ac_return_output);

-- MUX_uxn_c_l175_c25_d68d
MUX_uxn_c_l175_c25_d68d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l175_c25_d68d_cond,
MUX_uxn_c_l175_c25_d68d_iftrue,
MUX_uxn_c_l175_c25_d68d_iffalse,
MUX_uxn_c_l175_c25_d68d_return_output);

-- BIN_OP_EQ_uxn_c_l176_c17_075e
BIN_OP_EQ_uxn_c_l176_c17_075e : entity work.BIN_OP_EQ_uint2_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l176_c17_075e_left,
BIN_OP_EQ_uxn_c_l176_c17_075e_right,
BIN_OP_EQ_uxn_c_l176_c17_075e_return_output);

-- MUX_uxn_c_l176_c17_a75e
MUX_uxn_c_l176_c17_a75e : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
MUX_uxn_c_l176_c17_a75e_cond,
MUX_uxn_c_l176_c17_a75e_iftrue,
MUX_uxn_c_l176_c17_a75e_iffalse,
MUX_uxn_c_l176_c17_a75e_return_output);

-- UNARY_OP_NOT_uint1_t_uxn_c_l162_l169_DUPLICATE_57ec
UNARY_OP_NOT_uint1_t_uxn_c_l162_l169_DUPLICATE_57ec : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uint1_t_uxn_c_l162_l169_DUPLICATE_57ec_expr,
UNARY_OP_NOT_uint1_t_uxn_c_l162_l169_DUPLICATE_57ec_return_output);

-- BIN_OP_AND_uint1_t_uint1_t_uxn_c_l169_l162_DUPLICATE_22d2
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l169_l162_DUPLICATE_22d2 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l169_l162_DUPLICATE_22d2_left,
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l169_l162_DUPLICATE_22d2_right,
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l169_l162_DUPLICATE_22d2_return_output);



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
 CONST_SR_20_uxn_c_l126_c24_959a_return_output,
 BIN_OP_EQ_uxn_c_l127_c17_3068_return_output,
 MUX_uxn_c_l127_c17_87bc_return_output,
 UNARY_OP_NOT_uxn_c_l130_c22_746b_return_output,
 BIN_OP_AND_uxn_c_l130_c6_8ef3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l130_c1_22ec_return_output,
 is_fill_active_MUX_uxn_c_l130_c2_ecdf_return_output,
 y_MUX_uxn_c_l130_c2_ecdf_return_output,
 fill_x0_MUX_uxn_c_l130_c2_ecdf_return_output,
 fill_layer_MUX_uxn_c_l130_c2_ecdf_return_output,
 fill_x1_MUX_uxn_c_l130_c2_ecdf_return_output,
 fill_y1_MUX_uxn_c_l130_c2_ecdf_return_output,
 is_fill_top_MUX_uxn_c_l130_c2_ecdf_return_output,
 fill_y0_MUX_uxn_c_l130_c2_ecdf_return_output,
 fill_color_MUX_uxn_c_l130_c2_ecdf_return_output,
 x_MUX_uxn_c_l130_c2_ecdf_return_output,
 fill_pixels_remaining_MUX_uxn_c_l130_c2_ecdf_return_output,
 CONST_SR_19_uxn_c_l132_c17_afc6_return_output,
 CONST_SR_18_uxn_c_l133_c18_9093_return_output,
 BIN_OP_AND_uxn_c_l134_c27_6ab5_return_output,
 BIN_OP_DIV_uxn_c_l135_c13_4268_return_output,
 BIN_OP_INFERRED_MULT_uxn_c_l136_c38_db87_return_output,
 BIN_OP_MINUS_uxn_c_l136_c13_4d9d_return_output,
 MUX_uxn_c_l137_c13_452c_return_output,
 MUX_uxn_c_l138_c13_c906_return_output,
 MUX_uxn_c_l139_c13_8149_return_output,
 MUX_uxn_c_l140_c13_b5b9_return_output,
 BIN_OP_MINUS_uxn_c_l143_c28_bb3b_return_output,
 BIN_OP_MINUS_uxn_c_l143_c50_7f67_return_output,
 BIN_OP_INFERRED_MULT_uxn_c_l143_c28_31f3_return_output,
 BIN_OP_INFERRED_MULT_uxn_c_l149_c45_0f72_return_output,
 BIN_OP_PLUS_uxn_c_l149_c45_4c60_return_output,
 BIN_OP_AND_uxn_c_l149_c100_80b5_return_output,
 MUX_uxn_c_l149_c26_6e3c_return_output,
 BIN_OP_EQ_uxn_c_l151_c18_f3b5_return_output,
 MUX_uxn_c_l151_c18_0896_return_output,
 BIN_OP_PLUS_uxn_c_l152_c22_8d8a_return_output,
 MUX_uxn_c_l152_c6_e650_return_output,
 BIN_OP_PLUS_uxn_c_l153_c31_c235_return_output,
 MUX_uxn_c_l153_c6_b4de_return_output,
 UNARY_OP_NOT_uxn_c_l155_c38_108a_return_output,
 BIN_OP_AND_uxn_c_l155_c19_4ddb_return_output,
 BIN_OP_AND_uxn_c_l156_c19_aa24_return_output,
 MUX_uxn_c_l161_c3_e2e9_return_output,
 UNARY_OP_NOT_uxn_c_l162_c57_329f_return_output,
 BIN_OP_AND_uxn_c_l162_c22_aafd_return_output,
 BIN_OP_OR_uxn_c_l162_c3_aba4_return_output,
 bg_vram_update_uxn_c_l158_c19_b0fe_return_output,
 MUX_uxn_c_l168_c3_c5a0_return_output,
 BIN_OP_AND_uxn_c_l169_c22_1f5d_return_output,
 BIN_OP_OR_uxn_c_l169_c3_6a0f_return_output,
 fg_vram_update_uxn_c_l165_c19_cbce_return_output,
 BIN_OP_MINUS_uxn_c_l172_c43_e889_return_output,
 MUX_uxn_c_l172_c26_e62a_return_output,
 BIN_OP_EQ_uxn_c_l173_c19_fb64_return_output,
 MUX_uxn_c_l173_c19_a1d7_return_output,
 BIN_OP_EQ_uxn_c_l174_c19_8050_return_output,
 BIN_OP_PLUS_uxn_c_l174_c77_bcbb_return_output,
 MUX_uxn_c_l174_c51_4198_return_output,
 MUX_uxn_c_l174_c19_50aa_return_output,
 BIN_OP_EQ_uxn_c_l175_c25_94ac_return_output,
 MUX_uxn_c_l175_c25_d68d_return_output,
 BIN_OP_EQ_uxn_c_l176_c17_075e_return_output,
 MUX_uxn_c_l176_c17_a75e_return_output,
 UNARY_OP_NOT_uint1_t_uxn_c_l162_l169_DUPLICATE_57ec_return_output,
 BIN_OP_AND_uint1_t_uint1_t_uxn_c_l169_l162_DUPLICATE_22d2_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : gpu_step_result_t;
 variable VAR_is_active_drawing_area : unsigned(0 downto 0);
 variable VAR_is_vram_write : unsigned(0 downto 0);
 variable VAR_vram_write_layer : unsigned(0 downto 0);
 variable VAR_vram_address : unsigned(23 downto 0);
 variable VAR_vram_value : unsigned(1 downto 0);
 variable VAR_CONST_SR_20_uxn_c_l126_c24_959a_return_output : unsigned(23 downto 0);
 variable VAR_CONST_SR_20_uxn_c_l126_c24_959a_x : unsigned(23 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_c_l126_c14_aaee_return_output : unsigned(3 downto 0);
 variable VAR_MUX_uxn_c_l127_c17_87bc_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l127_c17_87bc_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l127_c17_87bc_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l127_c17_3068_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l127_c17_3068_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l127_c17_3068_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l127_c17_87bc_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l130_c6_8ef3_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l130_c22_746b_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l130_c22_746b_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l130_c6_8ef3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l130_c6_8ef3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l130_c1_22ec_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l130_c1_22ec_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l130_c1_22ec_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l130_c1_22ec_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_active_MUX_uxn_c_l130_c2_ecdf_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_active_MUX_uxn_c_l130_c2_ecdf_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_active_MUX_uxn_c_l130_c2_ecdf_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_active_MUX_uxn_c_l130_c2_ecdf_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_c_l130_c2_ecdf_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_c_l130_c2_ecdf_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_c_l130_c2_ecdf_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_c_l130_c2_ecdf_cond : unsigned(0 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l130_c2_ecdf_iftrue : unsigned(15 downto 0);
 variable VAR_fill_x0_uxn_c_l140_c3_47e7 : unsigned(15 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l130_c2_ecdf_iffalse : unsigned(15 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l130_c2_ecdf_return_output : unsigned(15 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l130_c2_ecdf_cond : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l130_c2_ecdf_iftrue : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l130_c2_ecdf_iffalse : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l130_c2_ecdf_return_output : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l130_c2_ecdf_cond : unsigned(0 downto 0);
 variable VAR_is_fill_left_uxn_c_l133_c3_8c71 : unsigned(0 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l130_c2_ecdf_iftrue : unsigned(15 downto 0);
 variable VAR_fill_x1_uxn_c_l138_c3_b763 : unsigned(15 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l130_c2_ecdf_iffalse : unsigned(15 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l130_c2_ecdf_return_output : unsigned(15 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l130_c2_ecdf_cond : unsigned(0 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l130_c2_ecdf_iftrue : unsigned(15 downto 0);
 variable VAR_fill_y1_uxn_c_l137_c3_d14c : unsigned(15 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l130_c2_ecdf_iffalse : unsigned(15 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l130_c2_ecdf_return_output : unsigned(15 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l130_c2_ecdf_cond : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l130_c2_ecdf_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_top_uxn_c_l132_c3_c6e9 : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l130_c2_ecdf_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l130_c2_ecdf_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l130_c2_ecdf_cond : unsigned(0 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l130_c2_ecdf_iftrue : unsigned(15 downto 0);
 variable VAR_fill_y0_uxn_c_l139_c3_9bc4 : unsigned(15 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l130_c2_ecdf_iffalse : unsigned(15 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l130_c2_ecdf_return_output : unsigned(15 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l130_c2_ecdf_cond : unsigned(0 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l130_c2_ecdf_iftrue : unsigned(1 downto 0);
 variable VAR_fill_color_uxn_c_l142_c3_4a25 : unsigned(1 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l130_c2_ecdf_iffalse : unsigned(1 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l130_c2_ecdf_return_output : unsigned(1 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l130_c2_ecdf_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_c_l130_c2_ecdf_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_c_l130_c2_ecdf_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_c_l130_c2_ecdf_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_c_l130_c2_ecdf_cond : unsigned(0 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l130_c2_ecdf_iftrue : unsigned(23 downto 0);
 variable VAR_fill_pixels_remaining_uxn_c_l143_c3_949b : unsigned(23 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l130_c2_ecdf_iffalse : unsigned(23 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l130_c2_ecdf_return_output : unsigned(23 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l130_c2_ecdf_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_19_uxn_c_l132_c17_afc6_return_output : unsigned(23 downto 0);
 variable VAR_CONST_SR_19_uxn_c_l132_c17_afc6_x : unsigned(23 downto 0);
 variable VAR_CONST_SR_18_uxn_c_l133_c18_9093_return_output : unsigned(23 downto 0);
 variable VAR_CONST_SR_18_uxn_c_l133_c18_9093_x : unsigned(23 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l134_c27_6ab5_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l134_c27_6ab5_right : unsigned(17 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l134_c27_6ab5_return_output : unsigned(23 downto 0);
 variable VAR_fill_y0_uxn_c_l135_c3_03cf : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_c_l135_c13_4268_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_DIV_uxn_c_l135_c13_4268_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_DIV_uxn_c_l135_c13_4268_return_output : unsigned(23 downto 0);
 variable VAR_fill_x0_uxn_c_l136_c3_ffbb : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l136_c13_4d9d_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l136_c38_db87_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l136_c38_db87_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l136_c38_db87_return_output : unsigned(24 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l136_c13_4d9d_right : unsigned(24 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l136_c13_4d9d_return_output : unsigned(23 downto 0);
 variable VAR_MUX_uxn_c_l137_c13_452c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l137_c13_452c_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l137_c13_452c_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l137_c13_452c_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l138_c13_c906_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l138_c13_c906_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l138_c13_c906_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l138_c13_c906_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l139_c13_8149_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l139_c13_8149_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l139_c13_8149_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l139_c13_8149_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l140_c13_b5b9_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l140_c13_b5b9_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l140_c13_b5b9_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l140_c13_b5b9_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l143_c28_bb3b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l143_c28_bb3b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l143_c28_bb3b_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l143_c28_31f3_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l143_c50_7f67_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l143_c50_7f67_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l143_c50_7f67_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l143_c28_31f3_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l143_c28_31f3_return_output : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l146_c3_21e4_uxn_c_l146_c3_21e4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l146_c3_21e4_uxn_c_l146_c3_21e4_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l146_c3_21e4_uxn_c_l146_c3_21e4_arg1 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l146_c3_21e4_uxn_c_l146_c3_21e4_arg2 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l146_c3_21e4_uxn_c_l146_c3_21e4_arg3 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l146_c3_21e4_uxn_c_l146_c3_21e4_arg4 : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l149_c26_6e3c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l149_c26_6e3c_iftrue : unsigned(23 downto 0);
 variable VAR_MUX_uxn_c_l149_c26_6e3c_iffalse : unsigned(23 downto 0);
 variable VAR_CAST_TO_uint24_t_uxn_c_l149_c45_1dbb_return_output : unsigned(23 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l149_c45_0f72_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l149_c45_0f72_right : unsigned(23 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l149_c45_0f72_return_output : unsigned(47 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l149_c45_4c60_left : unsigned(47 downto 0);
 variable VAR_CAST_TO_uint24_t_uxn_c_l149_c81_7abb_return_output : unsigned(23 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l149_c45_4c60_right : unsigned(23 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l149_c45_4c60_return_output : unsigned(48 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l149_c100_80b5_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l149_c100_80b5_right : unsigned(17 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l149_c100_80b5_return_output : unsigned(23 downto 0);
 variable VAR_MUX_uxn_c_l149_c26_6e3c_return_output : unsigned(23 downto 0);
 variable VAR_MUX_uxn_c_l151_c18_0896_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l151_c18_0896_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l151_c18_0896_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l151_c18_f3b5_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l151_c18_f3b5_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l151_c18_f3b5_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l151_c18_0896_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l152_c6_e650_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l152_c6_e650_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l152_c6_e650_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l152_c22_8d8a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l152_c22_8d8a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l152_c22_8d8a_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l152_c6_e650_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l153_c6_b4de_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l153_c6_b4de_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l153_c6_b4de_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l153_c31_c235_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l153_c31_c235_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l153_c31_c235_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l153_c6_b4de_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l155_c19_4ddb_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l155_c38_108a_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l155_c38_108a_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l155_c19_4ddb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l155_c19_4ddb_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l156_c19_aa24_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l156_c19_aa24_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l156_c19_aa24_return_output : unsigned(0 downto 0);
 variable VAR_bg_vram_update_uxn_c_l158_c19_b0fe_read_address : unsigned(23 downto 0);
 variable VAR_bg_vram_update_uxn_c_l158_c19_b0fe_write_address : unsigned(23 downto 0);
 variable VAR_bg_vram_update_uxn_c_l158_c19_b0fe_write_value : unsigned(1 downto 0);
 variable VAR_bg_vram_update_uxn_c_l158_c19_b0fe_write_enable : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l161_c3_e2e9_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l161_c3_e2e9_iftrue : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l161_c3_e2e9_iffalse : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l161_c3_e2e9_return_output : unsigned(1 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l162_c3_aba4_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l162_c22_aafd_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l162_c57_329f_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l162_c57_329f_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l162_c22_aafd_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l162_c22_aafd_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l162_c3_aba4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l162_c3_aba4_return_output : unsigned(0 downto 0);
 variable VAR_bg_vram_update_uxn_c_l158_c19_b0fe_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_bg_vram_update_uxn_c_l158_c19_b0fe_return_output : unsigned(1 downto 0);
 variable VAR_fg_vram_update_uxn_c_l165_c19_cbce_read_address : unsigned(23 downto 0);
 variable VAR_fg_vram_update_uxn_c_l165_c19_cbce_write_address : unsigned(23 downto 0);
 variable VAR_fg_vram_update_uxn_c_l165_c19_cbce_write_value : unsigned(1 downto 0);
 variable VAR_fg_vram_update_uxn_c_l165_c19_cbce_write_enable : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l168_c3_c5a0_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l168_c3_c5a0_iftrue : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l168_c3_c5a0_iffalse : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l168_c3_c5a0_return_output : unsigned(1 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l169_c3_6a0f_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l169_c22_1f5d_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l169_c22_1f5d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l169_c22_1f5d_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l169_c3_6a0f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l169_c3_6a0f_return_output : unsigned(0 downto 0);
 variable VAR_fg_vram_update_uxn_c_l165_c19_cbce_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_fg_vram_update_uxn_c_l165_c19_cbce_return_output : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l172_c26_e62a_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l172_c26_e62a_iftrue : unsigned(23 downto 0);
 variable VAR_MUX_uxn_c_l172_c26_e62a_iffalse : unsigned(23 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l172_c43_e889_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l172_c43_e889_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l172_c43_e889_return_output : unsigned(23 downto 0);
 variable VAR_MUX_uxn_c_l172_c26_e62a_return_output : unsigned(23 downto 0);
 variable VAR_MUX_uxn_c_l173_c19_a1d7_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l173_c19_a1d7_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l173_c19_a1d7_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l173_c19_fb64_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l173_c19_fb64_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l173_c19_fb64_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l173_c19_a1d7_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l174_c19_50aa_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l174_c19_50aa_iftrue : unsigned(17 downto 0);
 variable VAR_MUX_uxn_c_l174_c19_50aa_iffalse : unsigned(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l174_c19_8050_left : unsigned(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l174_c19_8050_right : unsigned(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l174_c19_8050_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l174_c51_4198_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l174_c51_4198_iftrue : unsigned(17 downto 0);
 variable VAR_MUX_uxn_c_l174_c51_4198_iffalse : unsigned(17 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l174_c77_bcbb_left : unsigned(17 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l174_c77_bcbb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l174_c77_bcbb_return_output : unsigned(18 downto 0);
 variable VAR_MUX_uxn_c_l174_c51_4198_return_output : unsigned(17 downto 0);
 variable VAR_MUX_uxn_c_l174_c19_50aa_return_output : unsigned(17 downto 0);
 variable VAR_MUX_uxn_c_l175_c25_d68d_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l175_c25_d68d_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l175_c25_d68d_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l175_c25_94ac_left : unsigned(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l175_c25_94ac_right : unsigned(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l175_c25_94ac_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l175_c25_d68d_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l176_c17_a75e_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l176_c17_a75e_iftrue : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l176_c17_a75e_iffalse : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l176_c17_075e_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l176_c17_075e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l176_c17_075e_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l176_c17_a75e_return_output : unsigned(1 downto 0);
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_c_l162_l169_DUPLICATE_57ec_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_c_l162_l169_DUPLICATE_57ec_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l169_l162_DUPLICATE_22d2_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l169_l162_DUPLICATE_22d2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l169_l162_DUPLICATE_22d2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_269d_uxn_c_l179_l111_DUPLICATE_6b7e_return_output : gpu_step_result_t;
 -- State registers comb logic variables
variable REG_VAR_result : gpu_step_result_t;
variable REG_VAR_vram_code : unsigned(3 downto 0);
variable REG_VAR_adjusted_vram_address : unsigned(23 downto 0);
variable REG_VAR_fill_pixels_remaining : unsigned(23 downto 0);
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
variable REG_VAR_pixel_counter : unsigned(17 downto 0);
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
     VAR_MUX_uxn_c_l173_c19_a1d7_iffalse := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l140_c13_b5b9_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_MUX_uxn_c_l137_c13_452c_iffalse := resize(to_unsigned(359, 9), 16);
     VAR_BIN_OP_EQ_uxn_c_l175_c25_94ac_right := to_unsigned(143999, 18);
     VAR_BIN_OP_AND_uxn_c_l134_c27_6ab5_right := to_unsigned(262143, 18);
     VAR_BIN_OP_EQ_uxn_c_l127_c17_3068_right := to_unsigned(15, 4);
     VAR_MUX_uxn_c_l151_c18_0896_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_DIV_uxn_c_l135_c13_4268_right := to_unsigned(400, 9);
     VAR_MUX_uxn_c_l175_c25_d68d_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l138_c13_c906_iffalse := resize(to_unsigned(399, 9), 16);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l130_c1_22ec_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l175_c25_d68d_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_c_l153_c31_c235_right := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_c_l149_c100_80b5_right := to_unsigned(262143, 18);
     VAR_MUX_uxn_c_l174_c19_50aa_iftrue := resize(to_unsigned(0, 1), 18);
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l136_c38_db87_right := to_unsigned(400, 9);
     VAR_BIN_OP_PLUS_uxn_c_l152_c22_8d8a_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_c_l174_c77_bcbb_right := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l127_c17_87bc_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l127_c17_87bc_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_MINUS_uxn_c_l172_c43_e889_right := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l151_c18_0896_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l173_c19_fb64_right := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l173_c19_a1d7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l149_c45_0f72_right := to_unsigned(400, 24);
     VAR_BIN_OP_EQ_uxn_c_l174_c19_8050_right := to_unsigned(143999, 18);
     VAR_BIN_OP_EQ_uxn_c_l176_c17_075e_right := to_unsigned(0, 1);
     VAR_is_fill_active_MUX_uxn_c_l130_c2_ecdf_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l172_c26_e62a_iffalse := resize(to_unsigned(0, 1), 24);
     VAR_MUX_uxn_c_l139_c13_8149_iftrue := resize(to_unsigned(0, 1), 16);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l130_c1_22ec_iftrue := VAR_CLOCK_ENABLE;
     VAR_bg_vram_update_uxn_c_l158_c19_b0fe_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_fg_vram_update_uxn_c_l165_c19_cbce_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_fill_color_MUX_uxn_c_l130_c2_ecdf_iffalse := fill_color;
     VAR_fill_layer_MUX_uxn_c_l130_c2_ecdf_iffalse := fill_layer;
     VAR_fill_pixels_remaining_MUX_uxn_c_l130_c2_ecdf_iffalse := fill_pixels_remaining;
     VAR_fill_x0_MUX_uxn_c_l130_c2_ecdf_iffalse := fill_x0;
     VAR_fill_x1_MUX_uxn_c_l130_c2_ecdf_iffalse := fill_x1;
     VAR_fill_y0_MUX_uxn_c_l130_c2_ecdf_iffalse := fill_y0;
     VAR_fill_y1_MUX_uxn_c_l130_c2_ecdf_iffalse := fill_y1;
     VAR_MUX_uxn_c_l174_c51_4198_cond := VAR_is_active_drawing_area;
     VAR_UNARY_OP_NOT_uxn_c_l130_c22_746b_expr := is_fill_active;
     VAR_is_fill_active_MUX_uxn_c_l130_c2_ecdf_iffalse := is_fill_active;
     VAR_is_fill_top_MUX_uxn_c_l130_c2_ecdf_iffalse := is_fill_top;
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l169_l162_DUPLICATE_22d2_right := VAR_is_vram_write;
     VAR_BIN_OP_EQ_uxn_c_l174_c19_8050_left := pixel_counter;
     VAR_BIN_OP_PLUS_uxn_c_l174_c77_bcbb_left := pixel_counter;
     VAR_MUX_uxn_c_l174_c51_4198_iffalse := pixel_counter;
     VAR_bg_vram_update_uxn_c_l158_c19_b0fe_read_address := resize(pixel_counter, 24);
     VAR_fg_vram_update_uxn_c_l165_c19_cbce_read_address := resize(pixel_counter, 24);
     VAR_BIN_OP_AND_uxn_c_l134_c27_6ab5_left := VAR_vram_address;
     VAR_BIN_OP_AND_uxn_c_l149_c100_80b5_left := VAR_vram_address;
     VAR_CONST_SR_18_uxn_c_l133_c18_9093_x := VAR_vram_address;
     VAR_CONST_SR_19_uxn_c_l132_c17_afc6_x := VAR_vram_address;
     VAR_CONST_SR_20_uxn_c_l126_c24_959a_x := VAR_vram_address;
     VAR_MUX_uxn_c_l161_c3_e2e9_iffalse := VAR_vram_value;
     VAR_MUX_uxn_c_l168_c3_c5a0_iffalse := VAR_vram_value;
     VAR_fill_color_uxn_c_l142_c3_4a25 := VAR_vram_value;
     VAR_BIN_OP_AND_uxn_c_l169_c22_1f5d_right := VAR_vram_write_layer;
     VAR_UNARY_OP_NOT_uxn_c_l162_c57_329f_expr := VAR_vram_write_layer;
     VAR_fill_layer_MUX_uxn_c_l130_c2_ecdf_iftrue := VAR_vram_write_layer;
     VAR_x_MUX_uxn_c_l130_c2_ecdf_iffalse := x;
     VAR_y_MUX_uxn_c_l130_c2_ecdf_iffalse := y;
     VAR_fill_color_MUX_uxn_c_l130_c2_ecdf_iftrue := VAR_fill_color_uxn_c_l142_c3_4a25;
     VAR_printf_uxn_c_l146_c3_21e4_uxn_c_l146_c3_21e4_arg4 := resize(VAR_fill_color_uxn_c_l142_c3_4a25, 32);
     -- CONST_SR_19[uxn_c_l132_c17_afc6] LATENCY=0
     -- Inputs
     CONST_SR_19_uxn_c_l132_c17_afc6_x <= VAR_CONST_SR_19_uxn_c_l132_c17_afc6_x;
     -- Outputs
     VAR_CONST_SR_19_uxn_c_l132_c17_afc6_return_output := CONST_SR_19_uxn_c_l132_c17_afc6_return_output;

     -- UNARY_OP_NOT[uxn_c_l162_c57_329f] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l162_c57_329f_expr <= VAR_UNARY_OP_NOT_uxn_c_l162_c57_329f_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l162_c57_329f_return_output := UNARY_OP_NOT_uxn_c_l162_c57_329f_return_output;

     -- BIN_OP_PLUS[uxn_c_l174_c77_bcbb] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l174_c77_bcbb_left <= VAR_BIN_OP_PLUS_uxn_c_l174_c77_bcbb_left;
     BIN_OP_PLUS_uxn_c_l174_c77_bcbb_right <= VAR_BIN_OP_PLUS_uxn_c_l174_c77_bcbb_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l174_c77_bcbb_return_output := BIN_OP_PLUS_uxn_c_l174_c77_bcbb_return_output;

     -- BIN_OP_AND[uxn_c_l149_c100_80b5] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l149_c100_80b5_left <= VAR_BIN_OP_AND_uxn_c_l149_c100_80b5_left;
     BIN_OP_AND_uxn_c_l149_c100_80b5_right <= VAR_BIN_OP_AND_uxn_c_l149_c100_80b5_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l149_c100_80b5_return_output := BIN_OP_AND_uxn_c_l149_c100_80b5_return_output;

     -- BIN_OP_AND[uxn_c_l134_c27_6ab5] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l134_c27_6ab5_left <= VAR_BIN_OP_AND_uxn_c_l134_c27_6ab5_left;
     BIN_OP_AND_uxn_c_l134_c27_6ab5_right <= VAR_BIN_OP_AND_uxn_c_l134_c27_6ab5_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l134_c27_6ab5_return_output := BIN_OP_AND_uxn_c_l134_c27_6ab5_return_output;

     -- CONST_SR_20[uxn_c_l126_c24_959a] LATENCY=0
     -- Inputs
     CONST_SR_20_uxn_c_l126_c24_959a_x <= VAR_CONST_SR_20_uxn_c_l126_c24_959a_x;
     -- Outputs
     VAR_CONST_SR_20_uxn_c_l126_c24_959a_return_output := CONST_SR_20_uxn_c_l126_c24_959a_return_output;

     -- BIN_OP_EQ[uxn_c_l174_c19_8050] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l174_c19_8050_left <= VAR_BIN_OP_EQ_uxn_c_l174_c19_8050_left;
     BIN_OP_EQ_uxn_c_l174_c19_8050_right <= VAR_BIN_OP_EQ_uxn_c_l174_c19_8050_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l174_c19_8050_return_output := BIN_OP_EQ_uxn_c_l174_c19_8050_return_output;

     -- CONST_SR_18[uxn_c_l133_c18_9093] LATENCY=0
     -- Inputs
     CONST_SR_18_uxn_c_l133_c18_9093_x <= VAR_CONST_SR_18_uxn_c_l133_c18_9093_x;
     -- Outputs
     VAR_CONST_SR_18_uxn_c_l133_c18_9093_return_output := CONST_SR_18_uxn_c_l133_c18_9093_return_output;

     -- UNARY_OP_NOT[uxn_c_l130_c22_746b] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l130_c22_746b_expr <= VAR_UNARY_OP_NOT_uxn_c_l130_c22_746b_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l130_c22_746b_return_output := UNARY_OP_NOT_uxn_c_l130_c22_746b_return_output;

     -- Submodule level 1
     VAR_BIN_OP_DIV_uxn_c_l135_c13_4268_left := VAR_BIN_OP_AND_uxn_c_l134_c27_6ab5_return_output;
     VAR_BIN_OP_MINUS_uxn_c_l136_c13_4d9d_left := VAR_BIN_OP_AND_uxn_c_l134_c27_6ab5_return_output;
     VAR_MUX_uxn_c_l149_c26_6e3c_iffalse := VAR_BIN_OP_AND_uxn_c_l149_c100_80b5_return_output;
     VAR_MUX_uxn_c_l174_c19_50aa_cond := VAR_BIN_OP_EQ_uxn_c_l174_c19_8050_return_output;
     VAR_MUX_uxn_c_l174_c51_4198_iftrue := resize(VAR_BIN_OP_PLUS_uxn_c_l174_c77_bcbb_return_output, 18);
     VAR_is_fill_left_uxn_c_l133_c3_8c71 := resize(VAR_CONST_SR_18_uxn_c_l133_c18_9093_return_output, 1);
     VAR_is_fill_top_uxn_c_l132_c3_c6e9 := resize(VAR_CONST_SR_19_uxn_c_l132_c17_afc6_return_output, 1);
     VAR_BIN_OP_AND_uxn_c_l130_c6_8ef3_right := VAR_UNARY_OP_NOT_uxn_c_l130_c22_746b_return_output;
     VAR_BIN_OP_AND_uxn_c_l162_c22_aafd_right := VAR_UNARY_OP_NOT_uxn_c_l162_c57_329f_return_output;
     VAR_MUX_uxn_c_l138_c13_c906_cond := VAR_is_fill_left_uxn_c_l133_c3_8c71;
     VAR_MUX_uxn_c_l140_c13_b5b9_cond := VAR_is_fill_left_uxn_c_l133_c3_8c71;
     VAR_MUX_uxn_c_l137_c13_452c_cond := VAR_is_fill_top_uxn_c_l132_c3_c6e9;
     VAR_MUX_uxn_c_l139_c13_8149_cond := VAR_is_fill_top_uxn_c_l132_c3_c6e9;
     VAR_is_fill_top_MUX_uxn_c_l130_c2_ecdf_iftrue := VAR_is_fill_top_uxn_c_l132_c3_c6e9;
     -- BIN_OP_DIV[uxn_c_l135_c13_4268] LATENCY=0
     -- Inputs
     BIN_OP_DIV_uxn_c_l135_c13_4268_left <= VAR_BIN_OP_DIV_uxn_c_l135_c13_4268_left;
     BIN_OP_DIV_uxn_c_l135_c13_4268_right <= VAR_BIN_OP_DIV_uxn_c_l135_c13_4268_right;
     -- Outputs
     VAR_BIN_OP_DIV_uxn_c_l135_c13_4268_return_output := BIN_OP_DIV_uxn_c_l135_c13_4268_return_output;

     -- MUX[uxn_c_l174_c51_4198] LATENCY=0
     -- Inputs
     MUX_uxn_c_l174_c51_4198_cond <= VAR_MUX_uxn_c_l174_c51_4198_cond;
     MUX_uxn_c_l174_c51_4198_iftrue <= VAR_MUX_uxn_c_l174_c51_4198_iftrue;
     MUX_uxn_c_l174_c51_4198_iffalse <= VAR_MUX_uxn_c_l174_c51_4198_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l174_c51_4198_return_output := MUX_uxn_c_l174_c51_4198_return_output;

     -- CAST_TO_uint4_t[uxn_c_l126_c14_aaee] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_c_l126_c14_aaee_return_output := CAST_TO_uint4_t_uint24_t(
     VAR_CONST_SR_20_uxn_c_l126_c24_959a_return_output);

     -- Submodule level 2
     VAR_fill_y0_uxn_c_l135_c3_03cf := resize(VAR_BIN_OP_DIV_uxn_c_l135_c13_4268_return_output, 16);
     VAR_BIN_OP_EQ_uxn_c_l127_c17_3068_left := VAR_CAST_TO_uint4_t_uxn_c_l126_c14_aaee_return_output;
     REG_VAR_vram_code := VAR_CAST_TO_uint4_t_uxn_c_l126_c14_aaee_return_output;
     VAR_MUX_uxn_c_l174_c19_50aa_iffalse := VAR_MUX_uxn_c_l174_c51_4198_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l136_c38_db87_left := VAR_fill_y0_uxn_c_l135_c3_03cf;
     VAR_MUX_uxn_c_l137_c13_452c_iftrue := VAR_fill_y0_uxn_c_l135_c3_03cf;
     VAR_MUX_uxn_c_l139_c13_8149_iffalse := VAR_fill_y0_uxn_c_l135_c3_03cf;
     -- MUX[uxn_c_l137_c13_452c] LATENCY=0
     -- Inputs
     MUX_uxn_c_l137_c13_452c_cond <= VAR_MUX_uxn_c_l137_c13_452c_cond;
     MUX_uxn_c_l137_c13_452c_iftrue <= VAR_MUX_uxn_c_l137_c13_452c_iftrue;
     MUX_uxn_c_l137_c13_452c_iffalse <= VAR_MUX_uxn_c_l137_c13_452c_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l137_c13_452c_return_output := MUX_uxn_c_l137_c13_452c_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_c_l136_c38_db87] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_c_l136_c38_db87_left <= VAR_BIN_OP_INFERRED_MULT_uxn_c_l136_c38_db87_left;
     BIN_OP_INFERRED_MULT_uxn_c_l136_c38_db87_right <= VAR_BIN_OP_INFERRED_MULT_uxn_c_l136_c38_db87_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l136_c38_db87_return_output := BIN_OP_INFERRED_MULT_uxn_c_l136_c38_db87_return_output;

     -- MUX[uxn_c_l139_c13_8149] LATENCY=0
     -- Inputs
     MUX_uxn_c_l139_c13_8149_cond <= VAR_MUX_uxn_c_l139_c13_8149_cond;
     MUX_uxn_c_l139_c13_8149_iftrue <= VAR_MUX_uxn_c_l139_c13_8149_iftrue;
     MUX_uxn_c_l139_c13_8149_iffalse <= VAR_MUX_uxn_c_l139_c13_8149_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l139_c13_8149_return_output := MUX_uxn_c_l139_c13_8149_return_output;

     -- BIN_OP_EQ[uxn_c_l127_c17_3068] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l127_c17_3068_left <= VAR_BIN_OP_EQ_uxn_c_l127_c17_3068_left;
     BIN_OP_EQ_uxn_c_l127_c17_3068_right <= VAR_BIN_OP_EQ_uxn_c_l127_c17_3068_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l127_c17_3068_return_output := BIN_OP_EQ_uxn_c_l127_c17_3068_return_output;

     -- MUX[uxn_c_l174_c19_50aa] LATENCY=0
     -- Inputs
     MUX_uxn_c_l174_c19_50aa_cond <= VAR_MUX_uxn_c_l174_c19_50aa_cond;
     MUX_uxn_c_l174_c19_50aa_iftrue <= VAR_MUX_uxn_c_l174_c19_50aa_iftrue;
     MUX_uxn_c_l174_c19_50aa_iffalse <= VAR_MUX_uxn_c_l174_c19_50aa_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l174_c19_50aa_return_output := MUX_uxn_c_l174_c19_50aa_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_c_l127_c17_87bc_cond := VAR_BIN_OP_EQ_uxn_c_l127_c17_3068_return_output;
     VAR_BIN_OP_MINUS_uxn_c_l136_c13_4d9d_right := VAR_BIN_OP_INFERRED_MULT_uxn_c_l136_c38_db87_return_output;
     VAR_fill_y1_uxn_c_l137_c3_d14c := VAR_MUX_uxn_c_l137_c13_452c_return_output;
     VAR_fill_y0_uxn_c_l139_c3_9bc4 := VAR_MUX_uxn_c_l139_c13_8149_return_output;
     VAR_BIN_OP_EQ_uxn_c_l175_c25_94ac_left := VAR_MUX_uxn_c_l174_c19_50aa_return_output;
     REG_VAR_pixel_counter := VAR_MUX_uxn_c_l174_c19_50aa_return_output;
     VAR_BIN_OP_MINUS_uxn_c_l143_c50_7f67_right := VAR_fill_y0_uxn_c_l139_c3_9bc4;
     VAR_fill_y0_MUX_uxn_c_l130_c2_ecdf_iftrue := VAR_fill_y0_uxn_c_l139_c3_9bc4;
     VAR_printf_uxn_c_l146_c3_21e4_uxn_c_l146_c3_21e4_arg1 := resize(VAR_fill_y0_uxn_c_l139_c3_9bc4, 32);
     VAR_y_MUX_uxn_c_l130_c2_ecdf_iftrue := VAR_fill_y0_uxn_c_l139_c3_9bc4;
     VAR_BIN_OP_MINUS_uxn_c_l143_c50_7f67_left := VAR_fill_y1_uxn_c_l137_c3_d14c;
     VAR_fill_y1_MUX_uxn_c_l130_c2_ecdf_iftrue := VAR_fill_y1_uxn_c_l137_c3_d14c;
     VAR_printf_uxn_c_l146_c3_21e4_uxn_c_l146_c3_21e4_arg3 := resize(VAR_fill_y1_uxn_c_l137_c3_d14c, 32);
     -- BIN_OP_MINUS[uxn_c_l143_c50_7f67] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l143_c50_7f67_left <= VAR_BIN_OP_MINUS_uxn_c_l143_c50_7f67_left;
     BIN_OP_MINUS_uxn_c_l143_c50_7f67_right <= VAR_BIN_OP_MINUS_uxn_c_l143_c50_7f67_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l143_c50_7f67_return_output := BIN_OP_MINUS_uxn_c_l143_c50_7f67_return_output;

     -- BIN_OP_MINUS[uxn_c_l136_c13_4d9d] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l136_c13_4d9d_left <= VAR_BIN_OP_MINUS_uxn_c_l136_c13_4d9d_left;
     BIN_OP_MINUS_uxn_c_l136_c13_4d9d_right <= VAR_BIN_OP_MINUS_uxn_c_l136_c13_4d9d_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l136_c13_4d9d_return_output := BIN_OP_MINUS_uxn_c_l136_c13_4d9d_return_output;

     -- MUX[uxn_c_l127_c17_87bc] LATENCY=0
     -- Inputs
     MUX_uxn_c_l127_c17_87bc_cond <= VAR_MUX_uxn_c_l127_c17_87bc_cond;
     MUX_uxn_c_l127_c17_87bc_iftrue <= VAR_MUX_uxn_c_l127_c17_87bc_iftrue;
     MUX_uxn_c_l127_c17_87bc_iffalse <= VAR_MUX_uxn_c_l127_c17_87bc_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l127_c17_87bc_return_output := MUX_uxn_c_l127_c17_87bc_return_output;

     -- BIN_OP_EQ[uxn_c_l175_c25_94ac] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l175_c25_94ac_left <= VAR_BIN_OP_EQ_uxn_c_l175_c25_94ac_left;
     BIN_OP_EQ_uxn_c_l175_c25_94ac_right <= VAR_BIN_OP_EQ_uxn_c_l175_c25_94ac_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l175_c25_94ac_return_output := BIN_OP_EQ_uxn_c_l175_c25_94ac_return_output;

     -- Submodule level 4
     VAR_MUX_uxn_c_l175_c25_d68d_cond := VAR_BIN_OP_EQ_uxn_c_l175_c25_94ac_return_output;
     VAR_fill_x0_uxn_c_l136_c3_ffbb := resize(VAR_BIN_OP_MINUS_uxn_c_l136_c13_4d9d_return_output, 16);
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l143_c28_31f3_right := VAR_BIN_OP_MINUS_uxn_c_l143_c50_7f67_return_output;
     VAR_BIN_OP_AND_uxn_c_l130_c6_8ef3_left := VAR_MUX_uxn_c_l127_c17_87bc_return_output;
     REG_VAR_is_fill_code := VAR_MUX_uxn_c_l127_c17_87bc_return_output;
     VAR_MUX_uxn_c_l138_c13_c906_iftrue := VAR_fill_x0_uxn_c_l136_c3_ffbb;
     VAR_MUX_uxn_c_l140_c13_b5b9_iffalse := VAR_fill_x0_uxn_c_l136_c3_ffbb;
     -- MUX[uxn_c_l175_c25_d68d] LATENCY=0
     -- Inputs
     MUX_uxn_c_l175_c25_d68d_cond <= VAR_MUX_uxn_c_l175_c25_d68d_cond;
     MUX_uxn_c_l175_c25_d68d_iftrue <= VAR_MUX_uxn_c_l175_c25_d68d_iftrue;
     MUX_uxn_c_l175_c25_d68d_iffalse <= VAR_MUX_uxn_c_l175_c25_d68d_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l175_c25_d68d_return_output := MUX_uxn_c_l175_c25_d68d_return_output;

     -- MUX[uxn_c_l140_c13_b5b9] LATENCY=0
     -- Inputs
     MUX_uxn_c_l140_c13_b5b9_cond <= VAR_MUX_uxn_c_l140_c13_b5b9_cond;
     MUX_uxn_c_l140_c13_b5b9_iftrue <= VAR_MUX_uxn_c_l140_c13_b5b9_iftrue;
     MUX_uxn_c_l140_c13_b5b9_iffalse <= VAR_MUX_uxn_c_l140_c13_b5b9_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l140_c13_b5b9_return_output := MUX_uxn_c_l140_c13_b5b9_return_output;

     -- MUX[uxn_c_l138_c13_c906] LATENCY=0
     -- Inputs
     MUX_uxn_c_l138_c13_c906_cond <= VAR_MUX_uxn_c_l138_c13_c906_cond;
     MUX_uxn_c_l138_c13_c906_iftrue <= VAR_MUX_uxn_c_l138_c13_c906_iftrue;
     MUX_uxn_c_l138_c13_c906_iffalse <= VAR_MUX_uxn_c_l138_c13_c906_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l138_c13_c906_return_output := MUX_uxn_c_l138_c13_c906_return_output;

     -- BIN_OP_AND[uxn_c_l130_c6_8ef3] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l130_c6_8ef3_left <= VAR_BIN_OP_AND_uxn_c_l130_c6_8ef3_left;
     BIN_OP_AND_uxn_c_l130_c6_8ef3_right <= VAR_BIN_OP_AND_uxn_c_l130_c6_8ef3_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l130_c6_8ef3_return_output := BIN_OP_AND_uxn_c_l130_c6_8ef3_return_output;

     -- Submodule level 5
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l130_c1_22ec_cond := VAR_BIN_OP_AND_uxn_c_l130_c6_8ef3_return_output;
     VAR_fill_color_MUX_uxn_c_l130_c2_ecdf_cond := VAR_BIN_OP_AND_uxn_c_l130_c6_8ef3_return_output;
     VAR_fill_layer_MUX_uxn_c_l130_c2_ecdf_cond := VAR_BIN_OP_AND_uxn_c_l130_c6_8ef3_return_output;
     VAR_fill_pixels_remaining_MUX_uxn_c_l130_c2_ecdf_cond := VAR_BIN_OP_AND_uxn_c_l130_c6_8ef3_return_output;
     VAR_fill_x0_MUX_uxn_c_l130_c2_ecdf_cond := VAR_BIN_OP_AND_uxn_c_l130_c6_8ef3_return_output;
     VAR_fill_x1_MUX_uxn_c_l130_c2_ecdf_cond := VAR_BIN_OP_AND_uxn_c_l130_c6_8ef3_return_output;
     VAR_fill_y0_MUX_uxn_c_l130_c2_ecdf_cond := VAR_BIN_OP_AND_uxn_c_l130_c6_8ef3_return_output;
     VAR_fill_y1_MUX_uxn_c_l130_c2_ecdf_cond := VAR_BIN_OP_AND_uxn_c_l130_c6_8ef3_return_output;
     VAR_is_fill_active_MUX_uxn_c_l130_c2_ecdf_cond := VAR_BIN_OP_AND_uxn_c_l130_c6_8ef3_return_output;
     VAR_is_fill_top_MUX_uxn_c_l130_c2_ecdf_cond := VAR_BIN_OP_AND_uxn_c_l130_c6_8ef3_return_output;
     VAR_x_MUX_uxn_c_l130_c2_ecdf_cond := VAR_BIN_OP_AND_uxn_c_l130_c6_8ef3_return_output;
     VAR_y_MUX_uxn_c_l130_c2_ecdf_cond := VAR_BIN_OP_AND_uxn_c_l130_c6_8ef3_return_output;
     VAR_fill_x1_uxn_c_l138_c3_b763 := VAR_MUX_uxn_c_l138_c13_c906_return_output;
     VAR_fill_x0_uxn_c_l140_c3_47e7 := VAR_MUX_uxn_c_l140_c13_b5b9_return_output;
     VAR_BIN_OP_MINUS_uxn_c_l143_c28_bb3b_right := VAR_fill_x0_uxn_c_l140_c3_47e7;
     VAR_fill_x0_MUX_uxn_c_l130_c2_ecdf_iftrue := VAR_fill_x0_uxn_c_l140_c3_47e7;
     VAR_printf_uxn_c_l146_c3_21e4_uxn_c_l146_c3_21e4_arg0 := resize(VAR_fill_x0_uxn_c_l140_c3_47e7, 32);
     VAR_x_MUX_uxn_c_l130_c2_ecdf_iftrue := VAR_fill_x0_uxn_c_l140_c3_47e7;
     VAR_BIN_OP_MINUS_uxn_c_l143_c28_bb3b_left := VAR_fill_x1_uxn_c_l138_c3_b763;
     VAR_fill_x1_MUX_uxn_c_l130_c2_ecdf_iftrue := VAR_fill_x1_uxn_c_l138_c3_b763;
     VAR_printf_uxn_c_l146_c3_21e4_uxn_c_l146_c3_21e4_arg2 := resize(VAR_fill_x1_uxn_c_l138_c3_b763, 32);
     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l130_c1_22ec] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l130_c1_22ec_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l130_c1_22ec_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l130_c1_22ec_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l130_c1_22ec_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l130_c1_22ec_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l130_c1_22ec_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l130_c1_22ec_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l130_c1_22ec_return_output;

     -- is_fill_top_MUX[uxn_c_l130_c2_ecdf] LATENCY=0
     -- Inputs
     is_fill_top_MUX_uxn_c_l130_c2_ecdf_cond <= VAR_is_fill_top_MUX_uxn_c_l130_c2_ecdf_cond;
     is_fill_top_MUX_uxn_c_l130_c2_ecdf_iftrue <= VAR_is_fill_top_MUX_uxn_c_l130_c2_ecdf_iftrue;
     is_fill_top_MUX_uxn_c_l130_c2_ecdf_iffalse <= VAR_is_fill_top_MUX_uxn_c_l130_c2_ecdf_iffalse;
     -- Outputs
     VAR_is_fill_top_MUX_uxn_c_l130_c2_ecdf_return_output := is_fill_top_MUX_uxn_c_l130_c2_ecdf_return_output;

     -- fill_y0_MUX[uxn_c_l130_c2_ecdf] LATENCY=0
     -- Inputs
     fill_y0_MUX_uxn_c_l130_c2_ecdf_cond <= VAR_fill_y0_MUX_uxn_c_l130_c2_ecdf_cond;
     fill_y0_MUX_uxn_c_l130_c2_ecdf_iftrue <= VAR_fill_y0_MUX_uxn_c_l130_c2_ecdf_iftrue;
     fill_y0_MUX_uxn_c_l130_c2_ecdf_iffalse <= VAR_fill_y0_MUX_uxn_c_l130_c2_ecdf_iffalse;
     -- Outputs
     VAR_fill_y0_MUX_uxn_c_l130_c2_ecdf_return_output := fill_y0_MUX_uxn_c_l130_c2_ecdf_return_output;

     -- x_MUX[uxn_c_l130_c2_ecdf] LATENCY=0
     -- Inputs
     x_MUX_uxn_c_l130_c2_ecdf_cond <= VAR_x_MUX_uxn_c_l130_c2_ecdf_cond;
     x_MUX_uxn_c_l130_c2_ecdf_iftrue <= VAR_x_MUX_uxn_c_l130_c2_ecdf_iftrue;
     x_MUX_uxn_c_l130_c2_ecdf_iffalse <= VAR_x_MUX_uxn_c_l130_c2_ecdf_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_c_l130_c2_ecdf_return_output := x_MUX_uxn_c_l130_c2_ecdf_return_output;

     -- fill_x1_MUX[uxn_c_l130_c2_ecdf] LATENCY=0
     -- Inputs
     fill_x1_MUX_uxn_c_l130_c2_ecdf_cond <= VAR_fill_x1_MUX_uxn_c_l130_c2_ecdf_cond;
     fill_x1_MUX_uxn_c_l130_c2_ecdf_iftrue <= VAR_fill_x1_MUX_uxn_c_l130_c2_ecdf_iftrue;
     fill_x1_MUX_uxn_c_l130_c2_ecdf_iffalse <= VAR_fill_x1_MUX_uxn_c_l130_c2_ecdf_iffalse;
     -- Outputs
     VAR_fill_x1_MUX_uxn_c_l130_c2_ecdf_return_output := fill_x1_MUX_uxn_c_l130_c2_ecdf_return_output;

     -- is_fill_active_MUX[uxn_c_l130_c2_ecdf] LATENCY=0
     -- Inputs
     is_fill_active_MUX_uxn_c_l130_c2_ecdf_cond <= VAR_is_fill_active_MUX_uxn_c_l130_c2_ecdf_cond;
     is_fill_active_MUX_uxn_c_l130_c2_ecdf_iftrue <= VAR_is_fill_active_MUX_uxn_c_l130_c2_ecdf_iftrue;
     is_fill_active_MUX_uxn_c_l130_c2_ecdf_iffalse <= VAR_is_fill_active_MUX_uxn_c_l130_c2_ecdf_iffalse;
     -- Outputs
     VAR_is_fill_active_MUX_uxn_c_l130_c2_ecdf_return_output := is_fill_active_MUX_uxn_c_l130_c2_ecdf_return_output;

     -- fill_x0_MUX[uxn_c_l130_c2_ecdf] LATENCY=0
     -- Inputs
     fill_x0_MUX_uxn_c_l130_c2_ecdf_cond <= VAR_fill_x0_MUX_uxn_c_l130_c2_ecdf_cond;
     fill_x0_MUX_uxn_c_l130_c2_ecdf_iftrue <= VAR_fill_x0_MUX_uxn_c_l130_c2_ecdf_iftrue;
     fill_x0_MUX_uxn_c_l130_c2_ecdf_iffalse <= VAR_fill_x0_MUX_uxn_c_l130_c2_ecdf_iffalse;
     -- Outputs
     VAR_fill_x0_MUX_uxn_c_l130_c2_ecdf_return_output := fill_x0_MUX_uxn_c_l130_c2_ecdf_return_output;

     -- fill_color_MUX[uxn_c_l130_c2_ecdf] LATENCY=0
     -- Inputs
     fill_color_MUX_uxn_c_l130_c2_ecdf_cond <= VAR_fill_color_MUX_uxn_c_l130_c2_ecdf_cond;
     fill_color_MUX_uxn_c_l130_c2_ecdf_iftrue <= VAR_fill_color_MUX_uxn_c_l130_c2_ecdf_iftrue;
     fill_color_MUX_uxn_c_l130_c2_ecdf_iffalse <= VAR_fill_color_MUX_uxn_c_l130_c2_ecdf_iffalse;
     -- Outputs
     VAR_fill_color_MUX_uxn_c_l130_c2_ecdf_return_output := fill_color_MUX_uxn_c_l130_c2_ecdf_return_output;

     -- fill_y1_MUX[uxn_c_l130_c2_ecdf] LATENCY=0
     -- Inputs
     fill_y1_MUX_uxn_c_l130_c2_ecdf_cond <= VAR_fill_y1_MUX_uxn_c_l130_c2_ecdf_cond;
     fill_y1_MUX_uxn_c_l130_c2_ecdf_iftrue <= VAR_fill_y1_MUX_uxn_c_l130_c2_ecdf_iftrue;
     fill_y1_MUX_uxn_c_l130_c2_ecdf_iffalse <= VAR_fill_y1_MUX_uxn_c_l130_c2_ecdf_iffalse;
     -- Outputs
     VAR_fill_y1_MUX_uxn_c_l130_c2_ecdf_return_output := fill_y1_MUX_uxn_c_l130_c2_ecdf_return_output;

     -- fill_layer_MUX[uxn_c_l130_c2_ecdf] LATENCY=0
     -- Inputs
     fill_layer_MUX_uxn_c_l130_c2_ecdf_cond <= VAR_fill_layer_MUX_uxn_c_l130_c2_ecdf_cond;
     fill_layer_MUX_uxn_c_l130_c2_ecdf_iftrue <= VAR_fill_layer_MUX_uxn_c_l130_c2_ecdf_iftrue;
     fill_layer_MUX_uxn_c_l130_c2_ecdf_iffalse <= VAR_fill_layer_MUX_uxn_c_l130_c2_ecdf_iffalse;
     -- Outputs
     VAR_fill_layer_MUX_uxn_c_l130_c2_ecdf_return_output := fill_layer_MUX_uxn_c_l130_c2_ecdf_return_output;

     -- y_MUX[uxn_c_l130_c2_ecdf] LATENCY=0
     -- Inputs
     y_MUX_uxn_c_l130_c2_ecdf_cond <= VAR_y_MUX_uxn_c_l130_c2_ecdf_cond;
     y_MUX_uxn_c_l130_c2_ecdf_iftrue <= VAR_y_MUX_uxn_c_l130_c2_ecdf_iftrue;
     y_MUX_uxn_c_l130_c2_ecdf_iffalse <= VAR_y_MUX_uxn_c_l130_c2_ecdf_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_c_l130_c2_ecdf_return_output := y_MUX_uxn_c_l130_c2_ecdf_return_output;

     -- BIN_OP_MINUS[uxn_c_l143_c28_bb3b] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l143_c28_bb3b_left <= VAR_BIN_OP_MINUS_uxn_c_l143_c28_bb3b_left;
     BIN_OP_MINUS_uxn_c_l143_c28_bb3b_right <= VAR_BIN_OP_MINUS_uxn_c_l143_c28_bb3b_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l143_c28_bb3b_return_output := BIN_OP_MINUS_uxn_c_l143_c28_bb3b_return_output;

     -- Submodule level 6
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l143_c28_31f3_left := VAR_BIN_OP_MINUS_uxn_c_l143_c28_bb3b_return_output;
     VAR_printf_uxn_c_l146_c3_21e4_uxn_c_l146_c3_21e4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l130_c1_22ec_return_output;
     VAR_MUX_uxn_c_l161_c3_e2e9_iftrue := VAR_fill_color_MUX_uxn_c_l130_c2_ecdf_return_output;
     VAR_MUX_uxn_c_l168_c3_c5a0_iftrue := VAR_fill_color_MUX_uxn_c_l130_c2_ecdf_return_output;
     REG_VAR_fill_color := VAR_fill_color_MUX_uxn_c_l130_c2_ecdf_return_output;
     VAR_BIN_OP_AND_uxn_c_l156_c19_aa24_right := VAR_fill_layer_MUX_uxn_c_l130_c2_ecdf_return_output;
     VAR_UNARY_OP_NOT_uxn_c_l155_c38_108a_expr := VAR_fill_layer_MUX_uxn_c_l130_c2_ecdf_return_output;
     REG_VAR_fill_layer := VAR_fill_layer_MUX_uxn_c_l130_c2_ecdf_return_output;
     VAR_MUX_uxn_c_l153_c6_b4de_iftrue := VAR_fill_x0_MUX_uxn_c_l130_c2_ecdf_return_output;
     REG_VAR_fill_x0 := VAR_fill_x0_MUX_uxn_c_l130_c2_ecdf_return_output;
     VAR_BIN_OP_EQ_uxn_c_l151_c18_f3b5_right := VAR_fill_x1_MUX_uxn_c_l130_c2_ecdf_return_output;
     REG_VAR_fill_x1 := VAR_fill_x1_MUX_uxn_c_l130_c2_ecdf_return_output;
     REG_VAR_fill_y0 := VAR_fill_y0_MUX_uxn_c_l130_c2_ecdf_return_output;
     REG_VAR_fill_y1 := VAR_fill_y1_MUX_uxn_c_l130_c2_ecdf_return_output;
     VAR_BIN_OP_AND_uxn_c_l155_c19_4ddb_left := VAR_is_fill_active_MUX_uxn_c_l130_c2_ecdf_return_output;
     VAR_BIN_OP_AND_uxn_c_l156_c19_aa24_left := VAR_is_fill_active_MUX_uxn_c_l130_c2_ecdf_return_output;
     VAR_MUX_uxn_c_l149_c26_6e3c_cond := VAR_is_fill_active_MUX_uxn_c_l130_c2_ecdf_return_output;
     VAR_MUX_uxn_c_l172_c26_e62a_cond := VAR_is_fill_active_MUX_uxn_c_l130_c2_ecdf_return_output;
     VAR_UNARY_OP_NOT_uint1_t_uxn_c_l162_l169_DUPLICATE_57ec_expr := VAR_is_fill_active_MUX_uxn_c_l130_c2_ecdf_return_output;
     REG_VAR_is_fill_top := VAR_is_fill_top_MUX_uxn_c_l130_c2_ecdf_return_output;
     VAR_BIN_OP_EQ_uxn_c_l151_c18_f3b5_left := VAR_x_MUX_uxn_c_l130_c2_ecdf_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l153_c31_c235_left := VAR_x_MUX_uxn_c_l130_c2_ecdf_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l152_c22_8d8a_left := VAR_y_MUX_uxn_c_l130_c2_ecdf_return_output;
     VAR_MUX_uxn_c_l152_c6_e650_iffalse := VAR_y_MUX_uxn_c_l130_c2_ecdf_return_output;
     -- BIN_OP_AND[uxn_c_l156_c19_aa24] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l156_c19_aa24_left <= VAR_BIN_OP_AND_uxn_c_l156_c19_aa24_left;
     BIN_OP_AND_uxn_c_l156_c19_aa24_right <= VAR_BIN_OP_AND_uxn_c_l156_c19_aa24_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l156_c19_aa24_return_output := BIN_OP_AND_uxn_c_l156_c19_aa24_return_output;

     -- BIN_OP_EQ[uxn_c_l151_c18_f3b5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l151_c18_f3b5_left <= VAR_BIN_OP_EQ_uxn_c_l151_c18_f3b5_left;
     BIN_OP_EQ_uxn_c_l151_c18_f3b5_right <= VAR_BIN_OP_EQ_uxn_c_l151_c18_f3b5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l151_c18_f3b5_return_output := BIN_OP_EQ_uxn_c_l151_c18_f3b5_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_c_l143_c28_31f3] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_c_l143_c28_31f3_left <= VAR_BIN_OP_INFERRED_MULT_uxn_c_l143_c28_31f3_left;
     BIN_OP_INFERRED_MULT_uxn_c_l143_c28_31f3_right <= VAR_BIN_OP_INFERRED_MULT_uxn_c_l143_c28_31f3_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l143_c28_31f3_return_output := BIN_OP_INFERRED_MULT_uxn_c_l143_c28_31f3_return_output;

     -- BIN_OP_PLUS[uxn_c_l153_c31_c235] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l153_c31_c235_left <= VAR_BIN_OP_PLUS_uxn_c_l153_c31_c235_left;
     BIN_OP_PLUS_uxn_c_l153_c31_c235_right <= VAR_BIN_OP_PLUS_uxn_c_l153_c31_c235_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l153_c31_c235_return_output := BIN_OP_PLUS_uxn_c_l153_c31_c235_return_output;

     -- CAST_TO_uint24_t[uxn_c_l149_c81_7abb] LATENCY=0
     VAR_CAST_TO_uint24_t_uxn_c_l149_c81_7abb_return_output := CAST_TO_uint24_t_uint16_t(
     VAR_x_MUX_uxn_c_l130_c2_ecdf_return_output);

     -- BIN_OP_PLUS[uxn_c_l152_c22_8d8a] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l152_c22_8d8a_left <= VAR_BIN_OP_PLUS_uxn_c_l152_c22_8d8a_left;
     BIN_OP_PLUS_uxn_c_l152_c22_8d8a_right <= VAR_BIN_OP_PLUS_uxn_c_l152_c22_8d8a_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l152_c22_8d8a_return_output := BIN_OP_PLUS_uxn_c_l152_c22_8d8a_return_output;

     -- UNARY_OP_NOT_uint1_t_uxn_c_l162_l169_DUPLICATE_57ec LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uint1_t_uxn_c_l162_l169_DUPLICATE_57ec_expr <= VAR_UNARY_OP_NOT_uint1_t_uxn_c_l162_l169_DUPLICATE_57ec_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uint1_t_uxn_c_l162_l169_DUPLICATE_57ec_return_output := UNARY_OP_NOT_uint1_t_uxn_c_l162_l169_DUPLICATE_57ec_return_output;

     -- printf_uxn_c_l146_c3_21e4[uxn_c_l146_c3_21e4] LATENCY=0
     -- Clock enable
     printf_uxn_c_l146_c3_21e4_uxn_c_l146_c3_21e4_CLOCK_ENABLE <= VAR_printf_uxn_c_l146_c3_21e4_uxn_c_l146_c3_21e4_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_c_l146_c3_21e4_uxn_c_l146_c3_21e4_arg0 <= VAR_printf_uxn_c_l146_c3_21e4_uxn_c_l146_c3_21e4_arg0;
     printf_uxn_c_l146_c3_21e4_uxn_c_l146_c3_21e4_arg1 <= VAR_printf_uxn_c_l146_c3_21e4_uxn_c_l146_c3_21e4_arg1;
     printf_uxn_c_l146_c3_21e4_uxn_c_l146_c3_21e4_arg2 <= VAR_printf_uxn_c_l146_c3_21e4_uxn_c_l146_c3_21e4_arg2;
     printf_uxn_c_l146_c3_21e4_uxn_c_l146_c3_21e4_arg3 <= VAR_printf_uxn_c_l146_c3_21e4_uxn_c_l146_c3_21e4_arg3;
     printf_uxn_c_l146_c3_21e4_uxn_c_l146_c3_21e4_arg4 <= VAR_printf_uxn_c_l146_c3_21e4_uxn_c_l146_c3_21e4_arg4;
     -- Outputs

     -- UNARY_OP_NOT[uxn_c_l155_c38_108a] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l155_c38_108a_expr <= VAR_UNARY_OP_NOT_uxn_c_l155_c38_108a_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l155_c38_108a_return_output := UNARY_OP_NOT_uxn_c_l155_c38_108a_return_output;

     -- CAST_TO_uint24_t[uxn_c_l149_c45_1dbb] LATENCY=0
     VAR_CAST_TO_uint24_t_uxn_c_l149_c45_1dbb_return_output := CAST_TO_uint24_t_uint16_t(
     VAR_y_MUX_uxn_c_l130_c2_ecdf_return_output);

     -- Submodule level 7
     VAR_BIN_OP_OR_uxn_c_l169_c3_6a0f_left := VAR_BIN_OP_AND_uxn_c_l156_c19_aa24_return_output;
     VAR_MUX_uxn_c_l168_c3_c5a0_cond := VAR_BIN_OP_AND_uxn_c_l156_c19_aa24_return_output;
     REG_VAR_is_fill_pixel1 := VAR_BIN_OP_AND_uxn_c_l156_c19_aa24_return_output;
     VAR_MUX_uxn_c_l151_c18_0896_cond := VAR_BIN_OP_EQ_uxn_c_l151_c18_f3b5_return_output;
     VAR_fill_pixels_remaining_uxn_c_l143_c3_949b := resize(VAR_BIN_OP_INFERRED_MULT_uxn_c_l143_c28_31f3_return_output, 24);
     VAR_MUX_uxn_c_l152_c6_e650_iftrue := resize(VAR_BIN_OP_PLUS_uxn_c_l152_c22_8d8a_return_output, 16);
     VAR_MUX_uxn_c_l153_c6_b4de_iffalse := resize(VAR_BIN_OP_PLUS_uxn_c_l153_c31_c235_return_output, 16);
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l149_c45_0f72_left := VAR_CAST_TO_uint24_t_uxn_c_l149_c45_1dbb_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l149_c45_4c60_right := VAR_CAST_TO_uint24_t_uxn_c_l149_c81_7abb_return_output;
     VAR_BIN_OP_AND_uxn_c_l155_c19_4ddb_right := VAR_UNARY_OP_NOT_uxn_c_l155_c38_108a_return_output;
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l169_l162_DUPLICATE_22d2_left := VAR_UNARY_OP_NOT_uint1_t_uxn_c_l162_l169_DUPLICATE_57ec_return_output;
     VAR_fill_pixels_remaining_MUX_uxn_c_l130_c2_ecdf_iftrue := VAR_fill_pixels_remaining_uxn_c_l143_c3_949b;
     -- MUX[uxn_c_l168_c3_c5a0] LATENCY=0
     -- Inputs
     MUX_uxn_c_l168_c3_c5a0_cond <= VAR_MUX_uxn_c_l168_c3_c5a0_cond;
     MUX_uxn_c_l168_c3_c5a0_iftrue <= VAR_MUX_uxn_c_l168_c3_c5a0_iftrue;
     MUX_uxn_c_l168_c3_c5a0_iffalse <= VAR_MUX_uxn_c_l168_c3_c5a0_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l168_c3_c5a0_return_output := MUX_uxn_c_l168_c3_c5a0_return_output;

     -- fill_pixels_remaining_MUX[uxn_c_l130_c2_ecdf] LATENCY=0
     -- Inputs
     fill_pixels_remaining_MUX_uxn_c_l130_c2_ecdf_cond <= VAR_fill_pixels_remaining_MUX_uxn_c_l130_c2_ecdf_cond;
     fill_pixels_remaining_MUX_uxn_c_l130_c2_ecdf_iftrue <= VAR_fill_pixels_remaining_MUX_uxn_c_l130_c2_ecdf_iftrue;
     fill_pixels_remaining_MUX_uxn_c_l130_c2_ecdf_iffalse <= VAR_fill_pixels_remaining_MUX_uxn_c_l130_c2_ecdf_iffalse;
     -- Outputs
     VAR_fill_pixels_remaining_MUX_uxn_c_l130_c2_ecdf_return_output := fill_pixels_remaining_MUX_uxn_c_l130_c2_ecdf_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_c_l149_c45_0f72] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_c_l149_c45_0f72_left <= VAR_BIN_OP_INFERRED_MULT_uxn_c_l149_c45_0f72_left;
     BIN_OP_INFERRED_MULT_uxn_c_l149_c45_0f72_right <= VAR_BIN_OP_INFERRED_MULT_uxn_c_l149_c45_0f72_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l149_c45_0f72_return_output := BIN_OP_INFERRED_MULT_uxn_c_l149_c45_0f72_return_output;

     -- BIN_OP_AND_uint1_t_uint1_t_uxn_c_l169_l162_DUPLICATE_22d2 LATENCY=0
     -- Inputs
     BIN_OP_AND_uint1_t_uint1_t_uxn_c_l169_l162_DUPLICATE_22d2_left <= VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l169_l162_DUPLICATE_22d2_left;
     BIN_OP_AND_uint1_t_uint1_t_uxn_c_l169_l162_DUPLICATE_22d2_right <= VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l169_l162_DUPLICATE_22d2_right;
     -- Outputs
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l169_l162_DUPLICATE_22d2_return_output := BIN_OP_AND_uint1_t_uint1_t_uxn_c_l169_l162_DUPLICATE_22d2_return_output;

     -- MUX[uxn_c_l151_c18_0896] LATENCY=0
     -- Inputs
     MUX_uxn_c_l151_c18_0896_cond <= VAR_MUX_uxn_c_l151_c18_0896_cond;
     MUX_uxn_c_l151_c18_0896_iftrue <= VAR_MUX_uxn_c_l151_c18_0896_iftrue;
     MUX_uxn_c_l151_c18_0896_iffalse <= VAR_MUX_uxn_c_l151_c18_0896_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l151_c18_0896_return_output := MUX_uxn_c_l151_c18_0896_return_output;

     -- BIN_OP_AND[uxn_c_l155_c19_4ddb] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l155_c19_4ddb_left <= VAR_BIN_OP_AND_uxn_c_l155_c19_4ddb_left;
     BIN_OP_AND_uxn_c_l155_c19_4ddb_right <= VAR_BIN_OP_AND_uxn_c_l155_c19_4ddb_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l155_c19_4ddb_return_output := BIN_OP_AND_uxn_c_l155_c19_4ddb_return_output;

     -- Submodule level 8
     VAR_BIN_OP_OR_uxn_c_l162_c3_aba4_left := VAR_BIN_OP_AND_uxn_c_l155_c19_4ddb_return_output;
     VAR_MUX_uxn_c_l161_c3_e2e9_cond := VAR_BIN_OP_AND_uxn_c_l155_c19_4ddb_return_output;
     REG_VAR_is_fill_pixel0 := VAR_BIN_OP_AND_uxn_c_l155_c19_4ddb_return_output;
     VAR_BIN_OP_AND_uxn_c_l162_c22_aafd_left := VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l169_l162_DUPLICATE_22d2_return_output;
     VAR_BIN_OP_AND_uxn_c_l169_c22_1f5d_left := VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l169_l162_DUPLICATE_22d2_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l149_c45_4c60_left := VAR_BIN_OP_INFERRED_MULT_uxn_c_l149_c45_0f72_return_output;
     VAR_MUX_uxn_c_l152_c6_e650_cond := VAR_MUX_uxn_c_l151_c18_0896_return_output;
     VAR_MUX_uxn_c_l153_c6_b4de_cond := VAR_MUX_uxn_c_l151_c18_0896_return_output;
     REG_VAR_is_fill_left := VAR_MUX_uxn_c_l151_c18_0896_return_output;
     VAR_fg_vram_update_uxn_c_l165_c19_cbce_write_value := VAR_MUX_uxn_c_l168_c3_c5a0_return_output;
     VAR_BIN_OP_MINUS_uxn_c_l172_c43_e889_left := VAR_fill_pixels_remaining_MUX_uxn_c_l130_c2_ecdf_return_output;
     -- BIN_OP_PLUS[uxn_c_l149_c45_4c60] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l149_c45_4c60_left <= VAR_BIN_OP_PLUS_uxn_c_l149_c45_4c60_left;
     BIN_OP_PLUS_uxn_c_l149_c45_4c60_right <= VAR_BIN_OP_PLUS_uxn_c_l149_c45_4c60_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l149_c45_4c60_return_output := BIN_OP_PLUS_uxn_c_l149_c45_4c60_return_output;

     -- BIN_OP_AND[uxn_c_l169_c22_1f5d] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l169_c22_1f5d_left <= VAR_BIN_OP_AND_uxn_c_l169_c22_1f5d_left;
     BIN_OP_AND_uxn_c_l169_c22_1f5d_right <= VAR_BIN_OP_AND_uxn_c_l169_c22_1f5d_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l169_c22_1f5d_return_output := BIN_OP_AND_uxn_c_l169_c22_1f5d_return_output;

     -- BIN_OP_MINUS[uxn_c_l172_c43_e889] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l172_c43_e889_left <= VAR_BIN_OP_MINUS_uxn_c_l172_c43_e889_left;
     BIN_OP_MINUS_uxn_c_l172_c43_e889_right <= VAR_BIN_OP_MINUS_uxn_c_l172_c43_e889_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l172_c43_e889_return_output := BIN_OP_MINUS_uxn_c_l172_c43_e889_return_output;

     -- BIN_OP_AND[uxn_c_l162_c22_aafd] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l162_c22_aafd_left <= VAR_BIN_OP_AND_uxn_c_l162_c22_aafd_left;
     BIN_OP_AND_uxn_c_l162_c22_aafd_right <= VAR_BIN_OP_AND_uxn_c_l162_c22_aafd_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l162_c22_aafd_return_output := BIN_OP_AND_uxn_c_l162_c22_aafd_return_output;

     -- MUX[uxn_c_l161_c3_e2e9] LATENCY=0
     -- Inputs
     MUX_uxn_c_l161_c3_e2e9_cond <= VAR_MUX_uxn_c_l161_c3_e2e9_cond;
     MUX_uxn_c_l161_c3_e2e9_iftrue <= VAR_MUX_uxn_c_l161_c3_e2e9_iftrue;
     MUX_uxn_c_l161_c3_e2e9_iffalse <= VAR_MUX_uxn_c_l161_c3_e2e9_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l161_c3_e2e9_return_output := MUX_uxn_c_l161_c3_e2e9_return_output;

     -- MUX[uxn_c_l152_c6_e650] LATENCY=0
     -- Inputs
     MUX_uxn_c_l152_c6_e650_cond <= VAR_MUX_uxn_c_l152_c6_e650_cond;
     MUX_uxn_c_l152_c6_e650_iftrue <= VAR_MUX_uxn_c_l152_c6_e650_iftrue;
     MUX_uxn_c_l152_c6_e650_iffalse <= VAR_MUX_uxn_c_l152_c6_e650_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l152_c6_e650_return_output := MUX_uxn_c_l152_c6_e650_return_output;

     -- MUX[uxn_c_l153_c6_b4de] LATENCY=0
     -- Inputs
     MUX_uxn_c_l153_c6_b4de_cond <= VAR_MUX_uxn_c_l153_c6_b4de_cond;
     MUX_uxn_c_l153_c6_b4de_iftrue <= VAR_MUX_uxn_c_l153_c6_b4de_iftrue;
     MUX_uxn_c_l153_c6_b4de_iffalse <= VAR_MUX_uxn_c_l153_c6_b4de_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l153_c6_b4de_return_output := MUX_uxn_c_l153_c6_b4de_return_output;

     -- Submodule level 9
     VAR_BIN_OP_OR_uxn_c_l162_c3_aba4_right := VAR_BIN_OP_AND_uxn_c_l162_c22_aafd_return_output;
     VAR_BIN_OP_OR_uxn_c_l169_c3_6a0f_right := VAR_BIN_OP_AND_uxn_c_l169_c22_1f5d_return_output;
     VAR_MUX_uxn_c_l172_c26_e62a_iftrue := VAR_BIN_OP_MINUS_uxn_c_l172_c43_e889_return_output;
     VAR_MUX_uxn_c_l149_c26_6e3c_iftrue := resize(VAR_BIN_OP_PLUS_uxn_c_l149_c45_4c60_return_output, 24);
     REG_VAR_y := VAR_MUX_uxn_c_l152_c6_e650_return_output;
     REG_VAR_x := VAR_MUX_uxn_c_l153_c6_b4de_return_output;
     VAR_bg_vram_update_uxn_c_l158_c19_b0fe_write_value := VAR_MUX_uxn_c_l161_c3_e2e9_return_output;
     -- MUX[uxn_c_l149_c26_6e3c] LATENCY=0
     -- Inputs
     MUX_uxn_c_l149_c26_6e3c_cond <= VAR_MUX_uxn_c_l149_c26_6e3c_cond;
     MUX_uxn_c_l149_c26_6e3c_iftrue <= VAR_MUX_uxn_c_l149_c26_6e3c_iftrue;
     MUX_uxn_c_l149_c26_6e3c_iffalse <= VAR_MUX_uxn_c_l149_c26_6e3c_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l149_c26_6e3c_return_output := MUX_uxn_c_l149_c26_6e3c_return_output;

     -- BIN_OP_OR[uxn_c_l162_c3_aba4] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l162_c3_aba4_left <= VAR_BIN_OP_OR_uxn_c_l162_c3_aba4_left;
     BIN_OP_OR_uxn_c_l162_c3_aba4_right <= VAR_BIN_OP_OR_uxn_c_l162_c3_aba4_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l162_c3_aba4_return_output := BIN_OP_OR_uxn_c_l162_c3_aba4_return_output;

     -- MUX[uxn_c_l172_c26_e62a] LATENCY=0
     -- Inputs
     MUX_uxn_c_l172_c26_e62a_cond <= VAR_MUX_uxn_c_l172_c26_e62a_cond;
     MUX_uxn_c_l172_c26_e62a_iftrue <= VAR_MUX_uxn_c_l172_c26_e62a_iftrue;
     MUX_uxn_c_l172_c26_e62a_iffalse <= VAR_MUX_uxn_c_l172_c26_e62a_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l172_c26_e62a_return_output := MUX_uxn_c_l172_c26_e62a_return_output;

     -- BIN_OP_OR[uxn_c_l169_c3_6a0f] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l169_c3_6a0f_left <= VAR_BIN_OP_OR_uxn_c_l169_c3_6a0f_left;
     BIN_OP_OR_uxn_c_l169_c3_6a0f_right <= VAR_BIN_OP_OR_uxn_c_l169_c3_6a0f_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l169_c3_6a0f_return_output := BIN_OP_OR_uxn_c_l169_c3_6a0f_return_output;

     -- Submodule level 10
     VAR_bg_vram_update_uxn_c_l158_c19_b0fe_write_enable := VAR_BIN_OP_OR_uxn_c_l162_c3_aba4_return_output;
     VAR_fg_vram_update_uxn_c_l165_c19_cbce_write_enable := VAR_BIN_OP_OR_uxn_c_l169_c3_6a0f_return_output;
     REG_VAR_adjusted_vram_address := VAR_MUX_uxn_c_l149_c26_6e3c_return_output;
     VAR_bg_vram_update_uxn_c_l158_c19_b0fe_write_address := VAR_MUX_uxn_c_l149_c26_6e3c_return_output;
     VAR_fg_vram_update_uxn_c_l165_c19_cbce_write_address := VAR_MUX_uxn_c_l149_c26_6e3c_return_output;
     VAR_BIN_OP_EQ_uxn_c_l173_c19_fb64_left := VAR_MUX_uxn_c_l172_c26_e62a_return_output;
     REG_VAR_fill_pixels_remaining := VAR_MUX_uxn_c_l172_c26_e62a_return_output;
     -- bg_vram_update[uxn_c_l158_c19_b0fe] LATENCY=0
     -- Clock enable
     bg_vram_update_uxn_c_l158_c19_b0fe_CLOCK_ENABLE <= VAR_bg_vram_update_uxn_c_l158_c19_b0fe_CLOCK_ENABLE;
     -- Inputs
     bg_vram_update_uxn_c_l158_c19_b0fe_read_address <= VAR_bg_vram_update_uxn_c_l158_c19_b0fe_read_address;
     bg_vram_update_uxn_c_l158_c19_b0fe_write_address <= VAR_bg_vram_update_uxn_c_l158_c19_b0fe_write_address;
     bg_vram_update_uxn_c_l158_c19_b0fe_write_value <= VAR_bg_vram_update_uxn_c_l158_c19_b0fe_write_value;
     bg_vram_update_uxn_c_l158_c19_b0fe_write_enable <= VAR_bg_vram_update_uxn_c_l158_c19_b0fe_write_enable;
     -- Outputs
     VAR_bg_vram_update_uxn_c_l158_c19_b0fe_return_output := bg_vram_update_uxn_c_l158_c19_b0fe_return_output;

     -- BIN_OP_EQ[uxn_c_l173_c19_fb64] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l173_c19_fb64_left <= VAR_BIN_OP_EQ_uxn_c_l173_c19_fb64_left;
     BIN_OP_EQ_uxn_c_l173_c19_fb64_right <= VAR_BIN_OP_EQ_uxn_c_l173_c19_fb64_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l173_c19_fb64_return_output := BIN_OP_EQ_uxn_c_l173_c19_fb64_return_output;

     -- fg_vram_update[uxn_c_l165_c19_cbce] LATENCY=0
     -- Clock enable
     fg_vram_update_uxn_c_l165_c19_cbce_CLOCK_ENABLE <= VAR_fg_vram_update_uxn_c_l165_c19_cbce_CLOCK_ENABLE;
     -- Inputs
     fg_vram_update_uxn_c_l165_c19_cbce_read_address <= VAR_fg_vram_update_uxn_c_l165_c19_cbce_read_address;
     fg_vram_update_uxn_c_l165_c19_cbce_write_address <= VAR_fg_vram_update_uxn_c_l165_c19_cbce_write_address;
     fg_vram_update_uxn_c_l165_c19_cbce_write_value <= VAR_fg_vram_update_uxn_c_l165_c19_cbce_write_value;
     fg_vram_update_uxn_c_l165_c19_cbce_write_enable <= VAR_fg_vram_update_uxn_c_l165_c19_cbce_write_enable;
     -- Outputs
     VAR_fg_vram_update_uxn_c_l165_c19_cbce_return_output := fg_vram_update_uxn_c_l165_c19_cbce_return_output;

     -- Submodule level 11
     VAR_MUX_uxn_c_l173_c19_a1d7_cond := VAR_BIN_OP_EQ_uxn_c_l173_c19_fb64_return_output;
     VAR_MUX_uxn_c_l176_c17_a75e_iftrue := VAR_bg_vram_update_uxn_c_l158_c19_b0fe_return_output;
     REG_VAR_bg_pixel_color := VAR_bg_vram_update_uxn_c_l158_c19_b0fe_return_output;
     VAR_BIN_OP_EQ_uxn_c_l176_c17_075e_left := VAR_fg_vram_update_uxn_c_l165_c19_cbce_return_output;
     VAR_MUX_uxn_c_l176_c17_a75e_iffalse := VAR_fg_vram_update_uxn_c_l165_c19_cbce_return_output;
     REG_VAR_fg_pixel_color := VAR_fg_vram_update_uxn_c_l165_c19_cbce_return_output;
     -- MUX[uxn_c_l173_c19_a1d7] LATENCY=0
     -- Inputs
     MUX_uxn_c_l173_c19_a1d7_cond <= VAR_MUX_uxn_c_l173_c19_a1d7_cond;
     MUX_uxn_c_l173_c19_a1d7_iftrue <= VAR_MUX_uxn_c_l173_c19_a1d7_iftrue;
     MUX_uxn_c_l173_c19_a1d7_iffalse <= VAR_MUX_uxn_c_l173_c19_a1d7_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l173_c19_a1d7_return_output := MUX_uxn_c_l173_c19_a1d7_return_output;

     -- BIN_OP_EQ[uxn_c_l176_c17_075e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l176_c17_075e_left <= VAR_BIN_OP_EQ_uxn_c_l176_c17_075e_left;
     BIN_OP_EQ_uxn_c_l176_c17_075e_right <= VAR_BIN_OP_EQ_uxn_c_l176_c17_075e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l176_c17_075e_return_output := BIN_OP_EQ_uxn_c_l176_c17_075e_return_output;

     -- Submodule level 12
     VAR_MUX_uxn_c_l176_c17_a75e_cond := VAR_BIN_OP_EQ_uxn_c_l176_c17_075e_return_output;
     REG_VAR_is_fill_active := VAR_MUX_uxn_c_l173_c19_a1d7_return_output;
     -- MUX[uxn_c_l176_c17_a75e] LATENCY=0
     -- Inputs
     MUX_uxn_c_l176_c17_a75e_cond <= VAR_MUX_uxn_c_l176_c17_a75e_cond;
     MUX_uxn_c_l176_c17_a75e_iftrue <= VAR_MUX_uxn_c_l176_c17_a75e_iftrue;
     MUX_uxn_c_l176_c17_a75e_iffalse <= VAR_MUX_uxn_c_l176_c17_a75e_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l176_c17_a75e_return_output := MUX_uxn_c_l176_c17_a75e_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_269d_uxn_c_l179_l111_DUPLICATE_6b7e LATENCY=0
     VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_269d_uxn_c_l179_l111_DUPLICATE_6b7e_return_output := CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_269d(
     VAR_MUX_uxn_c_l175_c25_d68d_return_output,
     VAR_MUX_uxn_c_l176_c17_a75e_return_output,
     VAR_MUX_uxn_c_l173_c19_a1d7_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_269d_uxn_c_l179_l111_DUPLICATE_6b7e_return_output;
     VAR_return_output := VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_269d_uxn_c_l179_l111_DUPLICATE_6b7e_return_output;
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
