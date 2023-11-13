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
entity step_gpu_0CLK_1bb9c0ed is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 is_active_drawing_area : in unsigned(0 downto 0);
 is_vram_write : in unsigned(0 downto 0);
 vram_write_layer : in unsigned(0 downto 0);
 vram_address : in unsigned(31 downto 0);
 vram_value : in unsigned(1 downto 0);
 return_output : out gpu_step_result_t);
end step_gpu_0CLK_1bb9c0ed;
architecture arch of step_gpu_0CLK_1bb9c0ed is
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
signal is_fill_pixel0 : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_fill_pixel1 : unsigned(0 downto 0) := to_unsigned(0, 1);
signal fill_layer : unsigned(0 downto 0) := to_unsigned(0, 1);
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
signal REG_COMB_is_fill_pixel0 : unsigned(0 downto 0);
signal REG_COMB_is_fill_pixel1 : unsigned(0 downto 0);
signal REG_COMB_fill_layer : unsigned(0 downto 0);
signal REG_COMB_is_fill_code : unsigned(0 downto 0);
signal REG_COMB_fg_pixel_color : unsigned(1 downto 0);
signal REG_COMB_bg_pixel_color : unsigned(1 downto 0);
signal REG_COMB_pixel_counter : unsigned(31 downto 0);
signal REG_COMB_x : unsigned(15 downto 0);
signal REG_COMB_y : unsigned(15 downto 0);

-- Each function instance gets signals
-- CONST_SR_28[uxn_c_l126_c24_6a7b]
signal CONST_SR_28_uxn_c_l126_c24_6a7b_x : unsigned(31 downto 0);
signal CONST_SR_28_uxn_c_l126_c24_6a7b_return_output : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_c_l127_c17_5bde]
signal BIN_OP_EQ_uxn_c_l127_c17_5bde_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l127_c17_5bde_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l127_c17_5bde_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l127_c17_9300]
signal MUX_uxn_c_l127_c17_9300_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l127_c17_9300_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l127_c17_9300_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l127_c17_9300_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_c_l130_c22_d57c]
signal UNARY_OP_NOT_uxn_c_l130_c22_d57c_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l130_c22_d57c_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l130_c6_c684]
signal BIN_OP_AND_uxn_c_l130_c6_c684_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l130_c6_c684_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l130_c6_c684_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l130_c1_f943]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l130_c1_f943_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l130_c1_f943_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l130_c1_f943_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l130_c1_f943_return_output : unsigned(0 downto 0);

-- is_fill_top_MUX[uxn_c_l130_c2_e932]
signal is_fill_top_MUX_uxn_c_l130_c2_e932_cond : unsigned(0 downto 0);
signal is_fill_top_MUX_uxn_c_l130_c2_e932_iftrue : unsigned(0 downto 0);
signal is_fill_top_MUX_uxn_c_l130_c2_e932_iffalse : unsigned(0 downto 0);
signal is_fill_top_MUX_uxn_c_l130_c2_e932_return_output : unsigned(0 downto 0);

-- fill_layer_MUX[uxn_c_l130_c2_e932]
signal fill_layer_MUX_uxn_c_l130_c2_e932_cond : unsigned(0 downto 0);
signal fill_layer_MUX_uxn_c_l130_c2_e932_iftrue : unsigned(0 downto 0);
signal fill_layer_MUX_uxn_c_l130_c2_e932_iffalse : unsigned(0 downto 0);
signal fill_layer_MUX_uxn_c_l130_c2_e932_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_c_l130_c2_e932]
signal x_MUX_uxn_c_l130_c2_e932_cond : unsigned(0 downto 0);
signal x_MUX_uxn_c_l130_c2_e932_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_c_l130_c2_e932_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_c_l130_c2_e932_return_output : unsigned(15 downto 0);

-- fill_y0_MUX[uxn_c_l130_c2_e932]
signal fill_y0_MUX_uxn_c_l130_c2_e932_cond : unsigned(0 downto 0);
signal fill_y0_MUX_uxn_c_l130_c2_e932_iftrue : unsigned(15 downto 0);
signal fill_y0_MUX_uxn_c_l130_c2_e932_iffalse : unsigned(15 downto 0);
signal fill_y0_MUX_uxn_c_l130_c2_e932_return_output : unsigned(15 downto 0);

-- fill_pixels_remaining_MUX[uxn_c_l130_c2_e932]
signal fill_pixels_remaining_MUX_uxn_c_l130_c2_e932_cond : unsigned(0 downto 0);
signal fill_pixels_remaining_MUX_uxn_c_l130_c2_e932_iftrue : unsigned(31 downto 0);
signal fill_pixels_remaining_MUX_uxn_c_l130_c2_e932_iffalse : unsigned(31 downto 0);
signal fill_pixels_remaining_MUX_uxn_c_l130_c2_e932_return_output : unsigned(31 downto 0);

-- fill_x0_MUX[uxn_c_l130_c2_e932]
signal fill_x0_MUX_uxn_c_l130_c2_e932_cond : unsigned(0 downto 0);
signal fill_x0_MUX_uxn_c_l130_c2_e932_iftrue : unsigned(15 downto 0);
signal fill_x0_MUX_uxn_c_l130_c2_e932_iffalse : unsigned(15 downto 0);
signal fill_x0_MUX_uxn_c_l130_c2_e932_return_output : unsigned(15 downto 0);

-- fill_y1_MUX[uxn_c_l130_c2_e932]
signal fill_y1_MUX_uxn_c_l130_c2_e932_cond : unsigned(0 downto 0);
signal fill_y1_MUX_uxn_c_l130_c2_e932_iftrue : unsigned(15 downto 0);
signal fill_y1_MUX_uxn_c_l130_c2_e932_iffalse : unsigned(15 downto 0);
signal fill_y1_MUX_uxn_c_l130_c2_e932_return_output : unsigned(15 downto 0);

-- y_MUX[uxn_c_l130_c2_e932]
signal y_MUX_uxn_c_l130_c2_e932_cond : unsigned(0 downto 0);
signal y_MUX_uxn_c_l130_c2_e932_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_c_l130_c2_e932_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_c_l130_c2_e932_return_output : unsigned(15 downto 0);

-- fill_x1_MUX[uxn_c_l130_c2_e932]
signal fill_x1_MUX_uxn_c_l130_c2_e932_cond : unsigned(0 downto 0);
signal fill_x1_MUX_uxn_c_l130_c2_e932_iftrue : unsigned(15 downto 0);
signal fill_x1_MUX_uxn_c_l130_c2_e932_iffalse : unsigned(15 downto 0);
signal fill_x1_MUX_uxn_c_l130_c2_e932_return_output : unsigned(15 downto 0);

-- is_fill_active_MUX[uxn_c_l130_c2_e932]
signal is_fill_active_MUX_uxn_c_l130_c2_e932_cond : unsigned(0 downto 0);
signal is_fill_active_MUX_uxn_c_l130_c2_e932_iftrue : unsigned(0 downto 0);
signal is_fill_active_MUX_uxn_c_l130_c2_e932_iffalse : unsigned(0 downto 0);
signal is_fill_active_MUX_uxn_c_l130_c2_e932_return_output : unsigned(0 downto 0);

-- fill_color_MUX[uxn_c_l130_c2_e932]
signal fill_color_MUX_uxn_c_l130_c2_e932_cond : unsigned(0 downto 0);
signal fill_color_MUX_uxn_c_l130_c2_e932_iftrue : unsigned(1 downto 0);
signal fill_color_MUX_uxn_c_l130_c2_e932_iffalse : unsigned(1 downto 0);
signal fill_color_MUX_uxn_c_l130_c2_e932_return_output : unsigned(1 downto 0);

-- CONST_SR_20[uxn_c_l132_c18_8718]
signal CONST_SR_20_uxn_c_l132_c18_8718_x : unsigned(31 downto 0);
signal CONST_SR_20_uxn_c_l132_c18_8718_return_output : unsigned(31 downto 0);

-- CONST_SR_21[uxn_c_l133_c17_11b3]
signal CONST_SR_21_uxn_c_l133_c17_11b3_x : unsigned(31 downto 0);
signal CONST_SR_21_uxn_c_l133_c17_11b3_return_output : unsigned(31 downto 0);

-- BIN_OP_AND[uxn_c_l134_c27_750c]
signal BIN_OP_AND_uxn_c_l134_c27_750c_left : unsigned(31 downto 0);
signal BIN_OP_AND_uxn_c_l134_c27_750c_right : unsigned(17 downto 0);
signal BIN_OP_AND_uxn_c_l134_c27_750c_return_output : unsigned(31 downto 0);

-- BIN_OP_DIV[uxn_c_l135_c13_338a]
signal BIN_OP_DIV_uxn_c_l135_c13_338a_left : unsigned(31 downto 0);
signal BIN_OP_DIV_uxn_c_l135_c13_338a_right : unsigned(8 downto 0);
signal BIN_OP_DIV_uxn_c_l135_c13_338a_return_output : unsigned(31 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_c_l136_c38_de0a]
signal BIN_OP_INFERRED_MULT_uxn_c_l136_c38_de0a_left : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_c_l136_c38_de0a_right : unsigned(8 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_c_l136_c38_de0a_return_output : unsigned(24 downto 0);

-- BIN_OP_MINUS[uxn_c_l136_c13_3245]
signal BIN_OP_MINUS_uxn_c_l136_c13_3245_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_uxn_c_l136_c13_3245_right : unsigned(24 downto 0);
signal BIN_OP_MINUS_uxn_c_l136_c13_3245_return_output : unsigned(31 downto 0);

-- MUX[uxn_c_l137_c13_822a]
signal MUX_uxn_c_l137_c13_822a_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l137_c13_822a_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l137_c13_822a_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l137_c13_822a_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l138_c13_879c]
signal MUX_uxn_c_l138_c13_879c_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l138_c13_879c_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l138_c13_879c_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l138_c13_879c_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l139_c13_2f14]
signal MUX_uxn_c_l139_c13_2f14_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l139_c13_2f14_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l139_c13_2f14_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l139_c13_2f14_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l140_c13_ffba]
signal MUX_uxn_c_l140_c13_ffba_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l140_c13_ffba_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l140_c13_ffba_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l140_c13_ffba_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_c_l143_c28_eb27]
signal BIN_OP_MINUS_uxn_c_l143_c28_eb27_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_c_l143_c28_eb27_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_c_l143_c28_eb27_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_c_l143_c50_a47d]
signal BIN_OP_MINUS_uxn_c_l143_c50_a47d_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_c_l143_c50_a47d_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_c_l143_c50_a47d_return_output : unsigned(15 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_c_l143_c28_5206]
signal BIN_OP_INFERRED_MULT_uxn_c_l143_c28_5206_left : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_c_l143_c28_5206_right : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_c_l143_c28_5206_return_output : unsigned(31 downto 0);

-- printf_uxn_c_l146_c3_a19b[uxn_c_l146_c3_a19b]
signal printf_uxn_c_l146_c3_a19b_uxn_c_l146_c3_a19b_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_c_l146_c3_a19b_uxn_c_l146_c3_a19b_arg0 : unsigned(31 downto 0);
signal printf_uxn_c_l146_c3_a19b_uxn_c_l146_c3_a19b_arg1 : unsigned(31 downto 0);
signal printf_uxn_c_l146_c3_a19b_uxn_c_l146_c3_a19b_arg2 : unsigned(31 downto 0);
signal printf_uxn_c_l146_c3_a19b_uxn_c_l146_c3_a19b_arg3 : unsigned(31 downto 0);
signal printf_uxn_c_l146_c3_a19b_uxn_c_l146_c3_a19b_arg4 : unsigned(31 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_c_l149_c45_eda1]
signal BIN_OP_INFERRED_MULT_uxn_c_l149_c45_eda1_left : unsigned(31 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_c_l149_c45_eda1_right : unsigned(31 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_c_l149_c45_eda1_return_output : unsigned(63 downto 0);

-- BIN_OP_PLUS[uxn_c_l149_c45_6d9c]
signal BIN_OP_PLUS_uxn_c_l149_c45_6d9c_left : unsigned(63 downto 0);
signal BIN_OP_PLUS_uxn_c_l149_c45_6d9c_right : unsigned(31 downto 0);
signal BIN_OP_PLUS_uxn_c_l149_c45_6d9c_return_output : unsigned(64 downto 0);

-- BIN_OP_AND[uxn_c_l149_c99_41e8]
signal BIN_OP_AND_uxn_c_l149_c99_41e8_left : unsigned(31 downto 0);
signal BIN_OP_AND_uxn_c_l149_c99_41e8_right : unsigned(17 downto 0);
signal BIN_OP_AND_uxn_c_l149_c99_41e8_return_output : unsigned(31 downto 0);

-- MUX[uxn_c_l149_c26_e213]
signal MUX_uxn_c_l149_c26_e213_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l149_c26_e213_iftrue : unsigned(31 downto 0);
signal MUX_uxn_c_l149_c26_e213_iffalse : unsigned(31 downto 0);
signal MUX_uxn_c_l149_c26_e213_return_output : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_c_l151_c18_2077]
signal BIN_OP_EQ_uxn_c_l151_c18_2077_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l151_c18_2077_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l151_c18_2077_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l151_c18_6d57]
signal MUX_uxn_c_l151_c18_6d57_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l151_c18_6d57_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l151_c18_6d57_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l151_c18_6d57_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l152_c22_375e]
signal BIN_OP_PLUS_uxn_c_l152_c22_375e_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l152_c22_375e_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l152_c22_375e_return_output : unsigned(16 downto 0);

-- MUX[uxn_c_l152_c6_f23a]
signal MUX_uxn_c_l152_c6_f23a_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l152_c6_f23a_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l152_c6_f23a_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l152_c6_f23a_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_c_l153_c31_fd1d]
signal BIN_OP_PLUS_uxn_c_l153_c31_fd1d_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l153_c31_fd1d_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l153_c31_fd1d_return_output : unsigned(16 downto 0);

-- MUX[uxn_c_l153_c6_600d]
signal MUX_uxn_c_l153_c6_600d_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l153_c6_600d_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l153_c6_600d_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l153_c6_600d_return_output : unsigned(15 downto 0);

-- UNARY_OP_NOT[uxn_c_l155_c38_155e]
signal UNARY_OP_NOT_uxn_c_l155_c38_155e_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l155_c38_155e_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l155_c19_710f]
signal BIN_OP_AND_uxn_c_l155_c19_710f_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l155_c19_710f_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l155_c19_710f_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l156_c19_0e6b]
signal BIN_OP_AND_uxn_c_l156_c19_0e6b_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l156_c19_0e6b_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l156_c19_0e6b_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l161_c3_4142]
signal MUX_uxn_c_l161_c3_4142_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l161_c3_4142_iftrue : unsigned(1 downto 0);
signal MUX_uxn_c_l161_c3_4142_iffalse : unsigned(1 downto 0);
signal MUX_uxn_c_l161_c3_4142_return_output : unsigned(1 downto 0);

-- UNARY_OP_NOT[uxn_c_l162_c57_d11f]
signal UNARY_OP_NOT_uxn_c_l162_c57_d11f_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l162_c57_d11f_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l162_c22_441c]
signal BIN_OP_AND_uxn_c_l162_c22_441c_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l162_c22_441c_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l162_c22_441c_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_c_l162_c3_4a05]
signal BIN_OP_OR_uxn_c_l162_c3_4a05_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l162_c3_4a05_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l162_c3_4a05_return_output : unsigned(0 downto 0);

-- bg_vram_update[uxn_c_l158_c19_e875]
signal bg_vram_update_uxn_c_l158_c19_e875_CLOCK_ENABLE : unsigned(0 downto 0);
signal bg_vram_update_uxn_c_l158_c19_e875_read_address : unsigned(31 downto 0);
signal bg_vram_update_uxn_c_l158_c19_e875_write_address : unsigned(31 downto 0);
signal bg_vram_update_uxn_c_l158_c19_e875_write_value : unsigned(1 downto 0);
signal bg_vram_update_uxn_c_l158_c19_e875_write_enable : unsigned(0 downto 0);
signal bg_vram_update_uxn_c_l158_c19_e875_return_output : unsigned(1 downto 0);

-- MUX[uxn_c_l168_c3_64e6]
signal MUX_uxn_c_l168_c3_64e6_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l168_c3_64e6_iftrue : unsigned(1 downto 0);
signal MUX_uxn_c_l168_c3_64e6_iffalse : unsigned(1 downto 0);
signal MUX_uxn_c_l168_c3_64e6_return_output : unsigned(1 downto 0);

-- BIN_OP_AND[uxn_c_l169_c22_05d3]
signal BIN_OP_AND_uxn_c_l169_c22_05d3_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l169_c22_05d3_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l169_c22_05d3_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_c_l169_c3_da79]
signal BIN_OP_OR_uxn_c_l169_c3_da79_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l169_c3_da79_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l169_c3_da79_return_output : unsigned(0 downto 0);

-- fg_vram_update[uxn_c_l165_c19_66ea]
signal fg_vram_update_uxn_c_l165_c19_66ea_CLOCK_ENABLE : unsigned(0 downto 0);
signal fg_vram_update_uxn_c_l165_c19_66ea_read_address : unsigned(31 downto 0);
signal fg_vram_update_uxn_c_l165_c19_66ea_write_address : unsigned(31 downto 0);
signal fg_vram_update_uxn_c_l165_c19_66ea_write_value : unsigned(1 downto 0);
signal fg_vram_update_uxn_c_l165_c19_66ea_write_enable : unsigned(0 downto 0);
signal fg_vram_update_uxn_c_l165_c19_66ea_return_output : unsigned(1 downto 0);

-- BIN_OP_MINUS[uxn_c_l172_c43_b343]
signal BIN_OP_MINUS_uxn_c_l172_c43_b343_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_uxn_c_l172_c43_b343_right : unsigned(0 downto 0);
signal BIN_OP_MINUS_uxn_c_l172_c43_b343_return_output : unsigned(31 downto 0);

-- MUX[uxn_c_l172_c26_351b]
signal MUX_uxn_c_l172_c26_351b_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l172_c26_351b_iftrue : unsigned(31 downto 0);
signal MUX_uxn_c_l172_c26_351b_iffalse : unsigned(31 downto 0);
signal MUX_uxn_c_l172_c26_351b_return_output : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_c_l173_c19_1300]
signal BIN_OP_EQ_uxn_c_l173_c19_1300_left : unsigned(31 downto 0);
signal BIN_OP_EQ_uxn_c_l173_c19_1300_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l173_c19_1300_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l173_c19_3bbe]
signal MUX_uxn_c_l173_c19_3bbe_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l173_c19_3bbe_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l173_c19_3bbe_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l173_c19_3bbe_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l174_c19_35fe]
signal BIN_OP_EQ_uxn_c_l174_c19_35fe_left : unsigned(31 downto 0);
signal BIN_OP_EQ_uxn_c_l174_c19_35fe_right : unsigned(17 downto 0);
signal BIN_OP_EQ_uxn_c_l174_c19_35fe_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l174_c77_debf]
signal BIN_OP_PLUS_uxn_c_l174_c77_debf_left : unsigned(31 downto 0);
signal BIN_OP_PLUS_uxn_c_l174_c77_debf_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l174_c77_debf_return_output : unsigned(32 downto 0);

-- MUX[uxn_c_l174_c51_2785]
signal MUX_uxn_c_l174_c51_2785_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l174_c51_2785_iftrue : unsigned(31 downto 0);
signal MUX_uxn_c_l174_c51_2785_iffalse : unsigned(31 downto 0);
signal MUX_uxn_c_l174_c51_2785_return_output : unsigned(31 downto 0);

-- MUX[uxn_c_l174_c19_cf51]
signal MUX_uxn_c_l174_c19_cf51_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l174_c19_cf51_iftrue : unsigned(31 downto 0);
signal MUX_uxn_c_l174_c19_cf51_iffalse : unsigned(31 downto 0);
signal MUX_uxn_c_l174_c19_cf51_return_output : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_c_l175_c25_ee47]
signal BIN_OP_EQ_uxn_c_l175_c25_ee47_left : unsigned(31 downto 0);
signal BIN_OP_EQ_uxn_c_l175_c25_ee47_right : unsigned(17 downto 0);
signal BIN_OP_EQ_uxn_c_l175_c25_ee47_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l175_c25_9aa4]
signal MUX_uxn_c_l175_c25_9aa4_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l175_c25_9aa4_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l175_c25_9aa4_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l175_c25_9aa4_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l176_c17_8c68]
signal BIN_OP_EQ_uxn_c_l176_c17_8c68_left : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l176_c17_8c68_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l176_c17_8c68_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l176_c17_edad]
signal MUX_uxn_c_l176_c17_edad_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l176_c17_edad_iftrue : unsigned(1 downto 0);
signal MUX_uxn_c_l176_c17_edad_iffalse : unsigned(1 downto 0);
signal MUX_uxn_c_l176_c17_edad_return_output : unsigned(1 downto 0);

-- UNARY_OP_NOT_uint1_t_uxn_c_l162_l169_DUPLICATE_40b1
signal UNARY_OP_NOT_uint1_t_uxn_c_l162_l169_DUPLICATE_40b1_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uint1_t_uxn_c_l162_l169_DUPLICATE_40b1_return_output : unsigned(0 downto 0);

-- BIN_OP_AND_uint1_t_uint1_t_uxn_c_l169_l162_DUPLICATE_0d92
signal BIN_OP_AND_uint1_t_uint1_t_uxn_c_l169_l162_DUPLICATE_0d92_left : unsigned(0 downto 0);
signal BIN_OP_AND_uint1_t_uint1_t_uxn_c_l169_l162_DUPLICATE_0d92_right : unsigned(0 downto 0);
signal BIN_OP_AND_uint1_t_uint1_t_uxn_c_l169_l162_DUPLICATE_0d92_return_output : unsigned(0 downto 0);

function CAST_TO_uint4_t_uint32_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(31 downto 0);
  variable return_output : unsigned(3 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,4)));
    return return_output;
end function;

function CAST_TO_uint32_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(31 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,32)));
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
-- CONST_SR_28_uxn_c_l126_c24_6a7b
CONST_SR_28_uxn_c_l126_c24_6a7b : entity work.CONST_SR_28_uint32_t_0CLK_de264c78 port map (
CONST_SR_28_uxn_c_l126_c24_6a7b_x,
CONST_SR_28_uxn_c_l126_c24_6a7b_return_output);

-- BIN_OP_EQ_uxn_c_l127_c17_5bde
BIN_OP_EQ_uxn_c_l127_c17_5bde : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l127_c17_5bde_left,
BIN_OP_EQ_uxn_c_l127_c17_5bde_right,
BIN_OP_EQ_uxn_c_l127_c17_5bde_return_output);

-- MUX_uxn_c_l127_c17_9300
MUX_uxn_c_l127_c17_9300 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l127_c17_9300_cond,
MUX_uxn_c_l127_c17_9300_iftrue,
MUX_uxn_c_l127_c17_9300_iffalse,
MUX_uxn_c_l127_c17_9300_return_output);

-- UNARY_OP_NOT_uxn_c_l130_c22_d57c
UNARY_OP_NOT_uxn_c_l130_c22_d57c : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l130_c22_d57c_expr,
UNARY_OP_NOT_uxn_c_l130_c22_d57c_return_output);

-- BIN_OP_AND_uxn_c_l130_c6_c684
BIN_OP_AND_uxn_c_l130_c6_c684 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l130_c6_c684_left,
BIN_OP_AND_uxn_c_l130_c6_c684_right,
BIN_OP_AND_uxn_c_l130_c6_c684_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l130_c1_f943
TRUE_CLOCK_ENABLE_MUX_uxn_c_l130_c1_f943 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l130_c1_f943_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l130_c1_f943_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l130_c1_f943_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l130_c1_f943_return_output);

-- is_fill_top_MUX_uxn_c_l130_c2_e932
is_fill_top_MUX_uxn_c_l130_c2_e932 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_top_MUX_uxn_c_l130_c2_e932_cond,
is_fill_top_MUX_uxn_c_l130_c2_e932_iftrue,
is_fill_top_MUX_uxn_c_l130_c2_e932_iffalse,
is_fill_top_MUX_uxn_c_l130_c2_e932_return_output);

-- fill_layer_MUX_uxn_c_l130_c2_e932
fill_layer_MUX_uxn_c_l130_c2_e932 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
fill_layer_MUX_uxn_c_l130_c2_e932_cond,
fill_layer_MUX_uxn_c_l130_c2_e932_iftrue,
fill_layer_MUX_uxn_c_l130_c2_e932_iffalse,
fill_layer_MUX_uxn_c_l130_c2_e932_return_output);

-- x_MUX_uxn_c_l130_c2_e932
x_MUX_uxn_c_l130_c2_e932 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_c_l130_c2_e932_cond,
x_MUX_uxn_c_l130_c2_e932_iftrue,
x_MUX_uxn_c_l130_c2_e932_iffalse,
x_MUX_uxn_c_l130_c2_e932_return_output);

-- fill_y0_MUX_uxn_c_l130_c2_e932
fill_y0_MUX_uxn_c_l130_c2_e932 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_y0_MUX_uxn_c_l130_c2_e932_cond,
fill_y0_MUX_uxn_c_l130_c2_e932_iftrue,
fill_y0_MUX_uxn_c_l130_c2_e932_iffalse,
fill_y0_MUX_uxn_c_l130_c2_e932_return_output);

-- fill_pixels_remaining_MUX_uxn_c_l130_c2_e932
fill_pixels_remaining_MUX_uxn_c_l130_c2_e932 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
fill_pixels_remaining_MUX_uxn_c_l130_c2_e932_cond,
fill_pixels_remaining_MUX_uxn_c_l130_c2_e932_iftrue,
fill_pixels_remaining_MUX_uxn_c_l130_c2_e932_iffalse,
fill_pixels_remaining_MUX_uxn_c_l130_c2_e932_return_output);

-- fill_x0_MUX_uxn_c_l130_c2_e932
fill_x0_MUX_uxn_c_l130_c2_e932 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_x0_MUX_uxn_c_l130_c2_e932_cond,
fill_x0_MUX_uxn_c_l130_c2_e932_iftrue,
fill_x0_MUX_uxn_c_l130_c2_e932_iffalse,
fill_x0_MUX_uxn_c_l130_c2_e932_return_output);

-- fill_y1_MUX_uxn_c_l130_c2_e932
fill_y1_MUX_uxn_c_l130_c2_e932 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_y1_MUX_uxn_c_l130_c2_e932_cond,
fill_y1_MUX_uxn_c_l130_c2_e932_iftrue,
fill_y1_MUX_uxn_c_l130_c2_e932_iffalse,
fill_y1_MUX_uxn_c_l130_c2_e932_return_output);

-- y_MUX_uxn_c_l130_c2_e932
y_MUX_uxn_c_l130_c2_e932 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_c_l130_c2_e932_cond,
y_MUX_uxn_c_l130_c2_e932_iftrue,
y_MUX_uxn_c_l130_c2_e932_iffalse,
y_MUX_uxn_c_l130_c2_e932_return_output);

-- fill_x1_MUX_uxn_c_l130_c2_e932
fill_x1_MUX_uxn_c_l130_c2_e932 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_x1_MUX_uxn_c_l130_c2_e932_cond,
fill_x1_MUX_uxn_c_l130_c2_e932_iftrue,
fill_x1_MUX_uxn_c_l130_c2_e932_iffalse,
fill_x1_MUX_uxn_c_l130_c2_e932_return_output);

-- is_fill_active_MUX_uxn_c_l130_c2_e932
is_fill_active_MUX_uxn_c_l130_c2_e932 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_active_MUX_uxn_c_l130_c2_e932_cond,
is_fill_active_MUX_uxn_c_l130_c2_e932_iftrue,
is_fill_active_MUX_uxn_c_l130_c2_e932_iffalse,
is_fill_active_MUX_uxn_c_l130_c2_e932_return_output);

-- fill_color_MUX_uxn_c_l130_c2_e932
fill_color_MUX_uxn_c_l130_c2_e932 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
fill_color_MUX_uxn_c_l130_c2_e932_cond,
fill_color_MUX_uxn_c_l130_c2_e932_iftrue,
fill_color_MUX_uxn_c_l130_c2_e932_iffalse,
fill_color_MUX_uxn_c_l130_c2_e932_return_output);

-- CONST_SR_20_uxn_c_l132_c18_8718
CONST_SR_20_uxn_c_l132_c18_8718 : entity work.CONST_SR_20_uint32_t_0CLK_de264c78 port map (
CONST_SR_20_uxn_c_l132_c18_8718_x,
CONST_SR_20_uxn_c_l132_c18_8718_return_output);

-- CONST_SR_21_uxn_c_l133_c17_11b3
CONST_SR_21_uxn_c_l133_c17_11b3 : entity work.CONST_SR_21_uint32_t_0CLK_de264c78 port map (
CONST_SR_21_uxn_c_l133_c17_11b3_x,
CONST_SR_21_uxn_c_l133_c17_11b3_return_output);

-- BIN_OP_AND_uxn_c_l134_c27_750c
BIN_OP_AND_uxn_c_l134_c27_750c : entity work.BIN_OP_AND_uint32_t_uint18_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l134_c27_750c_left,
BIN_OP_AND_uxn_c_l134_c27_750c_right,
BIN_OP_AND_uxn_c_l134_c27_750c_return_output);

-- BIN_OP_DIV_uxn_c_l135_c13_338a
BIN_OP_DIV_uxn_c_l135_c13_338a : entity work.BIN_OP_DIV_uint32_t_uint9_t_0CLK_422b4ffb port map (
BIN_OP_DIV_uxn_c_l135_c13_338a_left,
BIN_OP_DIV_uxn_c_l135_c13_338a_right,
BIN_OP_DIV_uxn_c_l135_c13_338a_return_output);

-- BIN_OP_INFERRED_MULT_uxn_c_l136_c38_de0a
BIN_OP_INFERRED_MULT_uxn_c_l136_c38_de0a : entity work.BIN_OP_INFERRED_MULT_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_c_l136_c38_de0a_left,
BIN_OP_INFERRED_MULT_uxn_c_l136_c38_de0a_right,
BIN_OP_INFERRED_MULT_uxn_c_l136_c38_de0a_return_output);

-- BIN_OP_MINUS_uxn_c_l136_c13_3245
BIN_OP_MINUS_uxn_c_l136_c13_3245 : entity work.BIN_OP_MINUS_uint32_t_uint25_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l136_c13_3245_left,
BIN_OP_MINUS_uxn_c_l136_c13_3245_right,
BIN_OP_MINUS_uxn_c_l136_c13_3245_return_output);

-- MUX_uxn_c_l137_c13_822a
MUX_uxn_c_l137_c13_822a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l137_c13_822a_cond,
MUX_uxn_c_l137_c13_822a_iftrue,
MUX_uxn_c_l137_c13_822a_iffalse,
MUX_uxn_c_l137_c13_822a_return_output);

-- MUX_uxn_c_l138_c13_879c
MUX_uxn_c_l138_c13_879c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l138_c13_879c_cond,
MUX_uxn_c_l138_c13_879c_iftrue,
MUX_uxn_c_l138_c13_879c_iffalse,
MUX_uxn_c_l138_c13_879c_return_output);

-- MUX_uxn_c_l139_c13_2f14
MUX_uxn_c_l139_c13_2f14 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l139_c13_2f14_cond,
MUX_uxn_c_l139_c13_2f14_iftrue,
MUX_uxn_c_l139_c13_2f14_iffalse,
MUX_uxn_c_l139_c13_2f14_return_output);

-- MUX_uxn_c_l140_c13_ffba
MUX_uxn_c_l140_c13_ffba : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l140_c13_ffba_cond,
MUX_uxn_c_l140_c13_ffba_iftrue,
MUX_uxn_c_l140_c13_ffba_iffalse,
MUX_uxn_c_l140_c13_ffba_return_output);

-- BIN_OP_MINUS_uxn_c_l143_c28_eb27
BIN_OP_MINUS_uxn_c_l143_c28_eb27 : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l143_c28_eb27_left,
BIN_OP_MINUS_uxn_c_l143_c28_eb27_right,
BIN_OP_MINUS_uxn_c_l143_c28_eb27_return_output);

-- BIN_OP_MINUS_uxn_c_l143_c50_a47d
BIN_OP_MINUS_uxn_c_l143_c50_a47d : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l143_c50_a47d_left,
BIN_OP_MINUS_uxn_c_l143_c50_a47d_right,
BIN_OP_MINUS_uxn_c_l143_c50_a47d_return_output);

-- BIN_OP_INFERRED_MULT_uxn_c_l143_c28_5206
BIN_OP_INFERRED_MULT_uxn_c_l143_c28_5206 : entity work.BIN_OP_INFERRED_MULT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_c_l143_c28_5206_left,
BIN_OP_INFERRED_MULT_uxn_c_l143_c28_5206_right,
BIN_OP_INFERRED_MULT_uxn_c_l143_c28_5206_return_output);

-- printf_uxn_c_l146_c3_a19b_uxn_c_l146_c3_a19b
printf_uxn_c_l146_c3_a19b_uxn_c_l146_c3_a19b : entity work.printf_uxn_c_l146_c3_a19b_0CLK_de264c78 port map (
printf_uxn_c_l146_c3_a19b_uxn_c_l146_c3_a19b_CLOCK_ENABLE,
printf_uxn_c_l146_c3_a19b_uxn_c_l146_c3_a19b_arg0,
printf_uxn_c_l146_c3_a19b_uxn_c_l146_c3_a19b_arg1,
printf_uxn_c_l146_c3_a19b_uxn_c_l146_c3_a19b_arg2,
printf_uxn_c_l146_c3_a19b_uxn_c_l146_c3_a19b_arg3,
printf_uxn_c_l146_c3_a19b_uxn_c_l146_c3_a19b_arg4);

-- BIN_OP_INFERRED_MULT_uxn_c_l149_c45_eda1
BIN_OP_INFERRED_MULT_uxn_c_l149_c45_eda1 : entity work.BIN_OP_INFERRED_MULT_uint32_t_uint32_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_c_l149_c45_eda1_left,
BIN_OP_INFERRED_MULT_uxn_c_l149_c45_eda1_right,
BIN_OP_INFERRED_MULT_uxn_c_l149_c45_eda1_return_output);

-- BIN_OP_PLUS_uxn_c_l149_c45_6d9c
BIN_OP_PLUS_uxn_c_l149_c45_6d9c : entity work.BIN_OP_PLUS_uint64_t_uint32_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l149_c45_6d9c_left,
BIN_OP_PLUS_uxn_c_l149_c45_6d9c_right,
BIN_OP_PLUS_uxn_c_l149_c45_6d9c_return_output);

-- BIN_OP_AND_uxn_c_l149_c99_41e8
BIN_OP_AND_uxn_c_l149_c99_41e8 : entity work.BIN_OP_AND_uint32_t_uint18_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l149_c99_41e8_left,
BIN_OP_AND_uxn_c_l149_c99_41e8_right,
BIN_OP_AND_uxn_c_l149_c99_41e8_return_output);

-- MUX_uxn_c_l149_c26_e213
MUX_uxn_c_l149_c26_e213 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
MUX_uxn_c_l149_c26_e213_cond,
MUX_uxn_c_l149_c26_e213_iftrue,
MUX_uxn_c_l149_c26_e213_iffalse,
MUX_uxn_c_l149_c26_e213_return_output);

-- BIN_OP_EQ_uxn_c_l151_c18_2077
BIN_OP_EQ_uxn_c_l151_c18_2077 : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l151_c18_2077_left,
BIN_OP_EQ_uxn_c_l151_c18_2077_right,
BIN_OP_EQ_uxn_c_l151_c18_2077_return_output);

-- MUX_uxn_c_l151_c18_6d57
MUX_uxn_c_l151_c18_6d57 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l151_c18_6d57_cond,
MUX_uxn_c_l151_c18_6d57_iftrue,
MUX_uxn_c_l151_c18_6d57_iffalse,
MUX_uxn_c_l151_c18_6d57_return_output);

-- BIN_OP_PLUS_uxn_c_l152_c22_375e
BIN_OP_PLUS_uxn_c_l152_c22_375e : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l152_c22_375e_left,
BIN_OP_PLUS_uxn_c_l152_c22_375e_right,
BIN_OP_PLUS_uxn_c_l152_c22_375e_return_output);

-- MUX_uxn_c_l152_c6_f23a
MUX_uxn_c_l152_c6_f23a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l152_c6_f23a_cond,
MUX_uxn_c_l152_c6_f23a_iftrue,
MUX_uxn_c_l152_c6_f23a_iffalse,
MUX_uxn_c_l152_c6_f23a_return_output);

-- BIN_OP_PLUS_uxn_c_l153_c31_fd1d
BIN_OP_PLUS_uxn_c_l153_c31_fd1d : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l153_c31_fd1d_left,
BIN_OP_PLUS_uxn_c_l153_c31_fd1d_right,
BIN_OP_PLUS_uxn_c_l153_c31_fd1d_return_output);

-- MUX_uxn_c_l153_c6_600d
MUX_uxn_c_l153_c6_600d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l153_c6_600d_cond,
MUX_uxn_c_l153_c6_600d_iftrue,
MUX_uxn_c_l153_c6_600d_iffalse,
MUX_uxn_c_l153_c6_600d_return_output);

-- UNARY_OP_NOT_uxn_c_l155_c38_155e
UNARY_OP_NOT_uxn_c_l155_c38_155e : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l155_c38_155e_expr,
UNARY_OP_NOT_uxn_c_l155_c38_155e_return_output);

-- BIN_OP_AND_uxn_c_l155_c19_710f
BIN_OP_AND_uxn_c_l155_c19_710f : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l155_c19_710f_left,
BIN_OP_AND_uxn_c_l155_c19_710f_right,
BIN_OP_AND_uxn_c_l155_c19_710f_return_output);

-- BIN_OP_AND_uxn_c_l156_c19_0e6b
BIN_OP_AND_uxn_c_l156_c19_0e6b : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l156_c19_0e6b_left,
BIN_OP_AND_uxn_c_l156_c19_0e6b_right,
BIN_OP_AND_uxn_c_l156_c19_0e6b_return_output);

-- MUX_uxn_c_l161_c3_4142
MUX_uxn_c_l161_c3_4142 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
MUX_uxn_c_l161_c3_4142_cond,
MUX_uxn_c_l161_c3_4142_iftrue,
MUX_uxn_c_l161_c3_4142_iffalse,
MUX_uxn_c_l161_c3_4142_return_output);

-- UNARY_OP_NOT_uxn_c_l162_c57_d11f
UNARY_OP_NOT_uxn_c_l162_c57_d11f : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l162_c57_d11f_expr,
UNARY_OP_NOT_uxn_c_l162_c57_d11f_return_output);

-- BIN_OP_AND_uxn_c_l162_c22_441c
BIN_OP_AND_uxn_c_l162_c22_441c : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l162_c22_441c_left,
BIN_OP_AND_uxn_c_l162_c22_441c_right,
BIN_OP_AND_uxn_c_l162_c22_441c_return_output);

-- BIN_OP_OR_uxn_c_l162_c3_4a05
BIN_OP_OR_uxn_c_l162_c3_4a05 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l162_c3_4a05_left,
BIN_OP_OR_uxn_c_l162_c3_4a05_right,
BIN_OP_OR_uxn_c_l162_c3_4a05_return_output);

-- bg_vram_update_uxn_c_l158_c19_e875
bg_vram_update_uxn_c_l158_c19_e875 : entity work.bg_vram_update_0CLK_b45f1687 port map (
clk,
bg_vram_update_uxn_c_l158_c19_e875_CLOCK_ENABLE,
bg_vram_update_uxn_c_l158_c19_e875_read_address,
bg_vram_update_uxn_c_l158_c19_e875_write_address,
bg_vram_update_uxn_c_l158_c19_e875_write_value,
bg_vram_update_uxn_c_l158_c19_e875_write_enable,
bg_vram_update_uxn_c_l158_c19_e875_return_output);

-- MUX_uxn_c_l168_c3_64e6
MUX_uxn_c_l168_c3_64e6 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
MUX_uxn_c_l168_c3_64e6_cond,
MUX_uxn_c_l168_c3_64e6_iftrue,
MUX_uxn_c_l168_c3_64e6_iffalse,
MUX_uxn_c_l168_c3_64e6_return_output);

-- BIN_OP_AND_uxn_c_l169_c22_05d3
BIN_OP_AND_uxn_c_l169_c22_05d3 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l169_c22_05d3_left,
BIN_OP_AND_uxn_c_l169_c22_05d3_right,
BIN_OP_AND_uxn_c_l169_c22_05d3_return_output);

-- BIN_OP_OR_uxn_c_l169_c3_da79
BIN_OP_OR_uxn_c_l169_c3_da79 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l169_c3_da79_left,
BIN_OP_OR_uxn_c_l169_c3_da79_right,
BIN_OP_OR_uxn_c_l169_c3_da79_return_output);

-- fg_vram_update_uxn_c_l165_c19_66ea
fg_vram_update_uxn_c_l165_c19_66ea : entity work.fg_vram_update_0CLK_b45f1687 port map (
clk,
fg_vram_update_uxn_c_l165_c19_66ea_CLOCK_ENABLE,
fg_vram_update_uxn_c_l165_c19_66ea_read_address,
fg_vram_update_uxn_c_l165_c19_66ea_write_address,
fg_vram_update_uxn_c_l165_c19_66ea_write_value,
fg_vram_update_uxn_c_l165_c19_66ea_write_enable,
fg_vram_update_uxn_c_l165_c19_66ea_return_output);

-- BIN_OP_MINUS_uxn_c_l172_c43_b343
BIN_OP_MINUS_uxn_c_l172_c43_b343 : entity work.BIN_OP_MINUS_uint32_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l172_c43_b343_left,
BIN_OP_MINUS_uxn_c_l172_c43_b343_right,
BIN_OP_MINUS_uxn_c_l172_c43_b343_return_output);

-- MUX_uxn_c_l172_c26_351b
MUX_uxn_c_l172_c26_351b : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
MUX_uxn_c_l172_c26_351b_cond,
MUX_uxn_c_l172_c26_351b_iftrue,
MUX_uxn_c_l172_c26_351b_iffalse,
MUX_uxn_c_l172_c26_351b_return_output);

-- BIN_OP_EQ_uxn_c_l173_c19_1300
BIN_OP_EQ_uxn_c_l173_c19_1300 : entity work.BIN_OP_EQ_uint32_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l173_c19_1300_left,
BIN_OP_EQ_uxn_c_l173_c19_1300_right,
BIN_OP_EQ_uxn_c_l173_c19_1300_return_output);

-- MUX_uxn_c_l173_c19_3bbe
MUX_uxn_c_l173_c19_3bbe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l173_c19_3bbe_cond,
MUX_uxn_c_l173_c19_3bbe_iftrue,
MUX_uxn_c_l173_c19_3bbe_iffalse,
MUX_uxn_c_l173_c19_3bbe_return_output);

-- BIN_OP_EQ_uxn_c_l174_c19_35fe
BIN_OP_EQ_uxn_c_l174_c19_35fe : entity work.BIN_OP_EQ_uint32_t_uint18_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l174_c19_35fe_left,
BIN_OP_EQ_uxn_c_l174_c19_35fe_right,
BIN_OP_EQ_uxn_c_l174_c19_35fe_return_output);

-- BIN_OP_PLUS_uxn_c_l174_c77_debf
BIN_OP_PLUS_uxn_c_l174_c77_debf : entity work.BIN_OP_PLUS_uint32_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l174_c77_debf_left,
BIN_OP_PLUS_uxn_c_l174_c77_debf_right,
BIN_OP_PLUS_uxn_c_l174_c77_debf_return_output);

-- MUX_uxn_c_l174_c51_2785
MUX_uxn_c_l174_c51_2785 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
MUX_uxn_c_l174_c51_2785_cond,
MUX_uxn_c_l174_c51_2785_iftrue,
MUX_uxn_c_l174_c51_2785_iffalse,
MUX_uxn_c_l174_c51_2785_return_output);

-- MUX_uxn_c_l174_c19_cf51
MUX_uxn_c_l174_c19_cf51 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
MUX_uxn_c_l174_c19_cf51_cond,
MUX_uxn_c_l174_c19_cf51_iftrue,
MUX_uxn_c_l174_c19_cf51_iffalse,
MUX_uxn_c_l174_c19_cf51_return_output);

-- BIN_OP_EQ_uxn_c_l175_c25_ee47
BIN_OP_EQ_uxn_c_l175_c25_ee47 : entity work.BIN_OP_EQ_uint32_t_uint18_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l175_c25_ee47_left,
BIN_OP_EQ_uxn_c_l175_c25_ee47_right,
BIN_OP_EQ_uxn_c_l175_c25_ee47_return_output);

-- MUX_uxn_c_l175_c25_9aa4
MUX_uxn_c_l175_c25_9aa4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l175_c25_9aa4_cond,
MUX_uxn_c_l175_c25_9aa4_iftrue,
MUX_uxn_c_l175_c25_9aa4_iffalse,
MUX_uxn_c_l175_c25_9aa4_return_output);

-- BIN_OP_EQ_uxn_c_l176_c17_8c68
BIN_OP_EQ_uxn_c_l176_c17_8c68 : entity work.BIN_OP_EQ_uint2_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l176_c17_8c68_left,
BIN_OP_EQ_uxn_c_l176_c17_8c68_right,
BIN_OP_EQ_uxn_c_l176_c17_8c68_return_output);

-- MUX_uxn_c_l176_c17_edad
MUX_uxn_c_l176_c17_edad : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
MUX_uxn_c_l176_c17_edad_cond,
MUX_uxn_c_l176_c17_edad_iftrue,
MUX_uxn_c_l176_c17_edad_iffalse,
MUX_uxn_c_l176_c17_edad_return_output);

-- UNARY_OP_NOT_uint1_t_uxn_c_l162_l169_DUPLICATE_40b1
UNARY_OP_NOT_uint1_t_uxn_c_l162_l169_DUPLICATE_40b1 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uint1_t_uxn_c_l162_l169_DUPLICATE_40b1_expr,
UNARY_OP_NOT_uint1_t_uxn_c_l162_l169_DUPLICATE_40b1_return_output);

-- BIN_OP_AND_uint1_t_uint1_t_uxn_c_l169_l162_DUPLICATE_0d92
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l169_l162_DUPLICATE_0d92 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l169_l162_DUPLICATE_0d92_left,
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l169_l162_DUPLICATE_0d92_right,
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l169_l162_DUPLICATE_0d92_return_output);



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
 CONST_SR_28_uxn_c_l126_c24_6a7b_return_output,
 BIN_OP_EQ_uxn_c_l127_c17_5bde_return_output,
 MUX_uxn_c_l127_c17_9300_return_output,
 UNARY_OP_NOT_uxn_c_l130_c22_d57c_return_output,
 BIN_OP_AND_uxn_c_l130_c6_c684_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l130_c1_f943_return_output,
 is_fill_top_MUX_uxn_c_l130_c2_e932_return_output,
 fill_layer_MUX_uxn_c_l130_c2_e932_return_output,
 x_MUX_uxn_c_l130_c2_e932_return_output,
 fill_y0_MUX_uxn_c_l130_c2_e932_return_output,
 fill_pixels_remaining_MUX_uxn_c_l130_c2_e932_return_output,
 fill_x0_MUX_uxn_c_l130_c2_e932_return_output,
 fill_y1_MUX_uxn_c_l130_c2_e932_return_output,
 y_MUX_uxn_c_l130_c2_e932_return_output,
 fill_x1_MUX_uxn_c_l130_c2_e932_return_output,
 is_fill_active_MUX_uxn_c_l130_c2_e932_return_output,
 fill_color_MUX_uxn_c_l130_c2_e932_return_output,
 CONST_SR_20_uxn_c_l132_c18_8718_return_output,
 CONST_SR_21_uxn_c_l133_c17_11b3_return_output,
 BIN_OP_AND_uxn_c_l134_c27_750c_return_output,
 BIN_OP_DIV_uxn_c_l135_c13_338a_return_output,
 BIN_OP_INFERRED_MULT_uxn_c_l136_c38_de0a_return_output,
 BIN_OP_MINUS_uxn_c_l136_c13_3245_return_output,
 MUX_uxn_c_l137_c13_822a_return_output,
 MUX_uxn_c_l138_c13_879c_return_output,
 MUX_uxn_c_l139_c13_2f14_return_output,
 MUX_uxn_c_l140_c13_ffba_return_output,
 BIN_OP_MINUS_uxn_c_l143_c28_eb27_return_output,
 BIN_OP_MINUS_uxn_c_l143_c50_a47d_return_output,
 BIN_OP_INFERRED_MULT_uxn_c_l143_c28_5206_return_output,
 BIN_OP_INFERRED_MULT_uxn_c_l149_c45_eda1_return_output,
 BIN_OP_PLUS_uxn_c_l149_c45_6d9c_return_output,
 BIN_OP_AND_uxn_c_l149_c99_41e8_return_output,
 MUX_uxn_c_l149_c26_e213_return_output,
 BIN_OP_EQ_uxn_c_l151_c18_2077_return_output,
 MUX_uxn_c_l151_c18_6d57_return_output,
 BIN_OP_PLUS_uxn_c_l152_c22_375e_return_output,
 MUX_uxn_c_l152_c6_f23a_return_output,
 BIN_OP_PLUS_uxn_c_l153_c31_fd1d_return_output,
 MUX_uxn_c_l153_c6_600d_return_output,
 UNARY_OP_NOT_uxn_c_l155_c38_155e_return_output,
 BIN_OP_AND_uxn_c_l155_c19_710f_return_output,
 BIN_OP_AND_uxn_c_l156_c19_0e6b_return_output,
 MUX_uxn_c_l161_c3_4142_return_output,
 UNARY_OP_NOT_uxn_c_l162_c57_d11f_return_output,
 BIN_OP_AND_uxn_c_l162_c22_441c_return_output,
 BIN_OP_OR_uxn_c_l162_c3_4a05_return_output,
 bg_vram_update_uxn_c_l158_c19_e875_return_output,
 MUX_uxn_c_l168_c3_64e6_return_output,
 BIN_OP_AND_uxn_c_l169_c22_05d3_return_output,
 BIN_OP_OR_uxn_c_l169_c3_da79_return_output,
 fg_vram_update_uxn_c_l165_c19_66ea_return_output,
 BIN_OP_MINUS_uxn_c_l172_c43_b343_return_output,
 MUX_uxn_c_l172_c26_351b_return_output,
 BIN_OP_EQ_uxn_c_l173_c19_1300_return_output,
 MUX_uxn_c_l173_c19_3bbe_return_output,
 BIN_OP_EQ_uxn_c_l174_c19_35fe_return_output,
 BIN_OP_PLUS_uxn_c_l174_c77_debf_return_output,
 MUX_uxn_c_l174_c51_2785_return_output,
 MUX_uxn_c_l174_c19_cf51_return_output,
 BIN_OP_EQ_uxn_c_l175_c25_ee47_return_output,
 MUX_uxn_c_l175_c25_9aa4_return_output,
 BIN_OP_EQ_uxn_c_l176_c17_8c68_return_output,
 MUX_uxn_c_l176_c17_edad_return_output,
 UNARY_OP_NOT_uint1_t_uxn_c_l162_l169_DUPLICATE_40b1_return_output,
 BIN_OP_AND_uint1_t_uint1_t_uxn_c_l169_l162_DUPLICATE_0d92_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : gpu_step_result_t;
 variable VAR_is_active_drawing_area : unsigned(0 downto 0);
 variable VAR_is_vram_write : unsigned(0 downto 0);
 variable VAR_vram_write_layer : unsigned(0 downto 0);
 variable VAR_vram_address : unsigned(31 downto 0);
 variable VAR_vram_value : unsigned(1 downto 0);
 variable VAR_CONST_SR_28_uxn_c_l126_c24_6a7b_return_output : unsigned(31 downto 0);
 variable VAR_CONST_SR_28_uxn_c_l126_c24_6a7b_x : unsigned(31 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_c_l126_c14_13f4_return_output : unsigned(3 downto 0);
 variable VAR_MUX_uxn_c_l127_c17_9300_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l127_c17_9300_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l127_c17_9300_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l127_c17_5bde_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l127_c17_5bde_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l127_c17_5bde_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l127_c17_9300_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l130_c6_c684_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l130_c22_d57c_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l130_c22_d57c_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l130_c6_c684_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l130_c6_c684_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l130_c1_f943_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l130_c1_f943_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l130_c1_f943_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l130_c1_f943_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l130_c2_e932_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_top_uxn_c_l133_c3_c62d : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l130_c2_e932_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l130_c2_e932_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l130_c2_e932_cond : unsigned(0 downto 0);
 variable VAR_is_fill_left_uxn_c_l132_c3_02a5 : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l130_c2_e932_iftrue : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l130_c2_e932_iffalse : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l130_c2_e932_return_output : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l130_c2_e932_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_c_l130_c2_e932_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_c_l130_c2_e932_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_c_l130_c2_e932_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_c_l130_c2_e932_cond : unsigned(0 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l130_c2_e932_iftrue : unsigned(15 downto 0);
 variable VAR_fill_y0_uxn_c_l139_c3_2b0e : unsigned(15 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l130_c2_e932_iffalse : unsigned(15 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l130_c2_e932_return_output : unsigned(15 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l130_c2_e932_cond : unsigned(0 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l130_c2_e932_iftrue : unsigned(31 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l130_c2_e932_iffalse : unsigned(31 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l130_c2_e932_return_output : unsigned(31 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l130_c2_e932_cond : unsigned(0 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l130_c2_e932_iftrue : unsigned(15 downto 0);
 variable VAR_fill_x0_uxn_c_l140_c3_e396 : unsigned(15 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l130_c2_e932_iffalse : unsigned(15 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l130_c2_e932_return_output : unsigned(15 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l130_c2_e932_cond : unsigned(0 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l130_c2_e932_iftrue : unsigned(15 downto 0);
 variable VAR_fill_y1_uxn_c_l137_c3_00d4 : unsigned(15 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l130_c2_e932_iffalse : unsigned(15 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l130_c2_e932_return_output : unsigned(15 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l130_c2_e932_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_c_l130_c2_e932_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_c_l130_c2_e932_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_c_l130_c2_e932_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_c_l130_c2_e932_cond : unsigned(0 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l130_c2_e932_iftrue : unsigned(15 downto 0);
 variable VAR_fill_x1_uxn_c_l138_c3_7b97 : unsigned(15 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l130_c2_e932_iffalse : unsigned(15 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l130_c2_e932_return_output : unsigned(15 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l130_c2_e932_cond : unsigned(0 downto 0);
 variable VAR_is_fill_active_MUX_uxn_c_l130_c2_e932_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_active_MUX_uxn_c_l130_c2_e932_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_active_MUX_uxn_c_l130_c2_e932_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_active_MUX_uxn_c_l130_c2_e932_cond : unsigned(0 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l130_c2_e932_iftrue : unsigned(1 downto 0);
 variable VAR_fill_color_uxn_c_l142_c3_395a : unsigned(1 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l130_c2_e932_iffalse : unsigned(1 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l130_c2_e932_return_output : unsigned(1 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l130_c2_e932_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_20_uxn_c_l132_c18_8718_return_output : unsigned(31 downto 0);
 variable VAR_CONST_SR_20_uxn_c_l132_c18_8718_x : unsigned(31 downto 0);
 variable VAR_CONST_SR_21_uxn_c_l133_c17_11b3_return_output : unsigned(31 downto 0);
 variable VAR_CONST_SR_21_uxn_c_l133_c17_11b3_x : unsigned(31 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l134_c27_750c_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l134_c27_750c_right : unsigned(17 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l134_c27_750c_return_output : unsigned(31 downto 0);
 variable VAR_fill_y0_uxn_c_l135_c3_323b : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_c_l135_c13_338a_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_DIV_uxn_c_l135_c13_338a_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_DIV_uxn_c_l135_c13_338a_return_output : unsigned(31 downto 0);
 variable VAR_fill_x0_uxn_c_l136_c3_1884 : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l136_c13_3245_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l136_c38_de0a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l136_c38_de0a_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l136_c38_de0a_return_output : unsigned(24 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l136_c13_3245_right : unsigned(24 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l136_c13_3245_return_output : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l137_c13_822a_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l137_c13_822a_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l137_c13_822a_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l137_c13_822a_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l138_c13_879c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l138_c13_879c_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l138_c13_879c_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l138_c13_879c_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l139_c13_2f14_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l139_c13_2f14_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l139_c13_2f14_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l139_c13_2f14_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l140_c13_ffba_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l140_c13_ffba_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l140_c13_ffba_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l140_c13_ffba_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l143_c28_eb27_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l143_c28_eb27_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l143_c28_eb27_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l143_c28_5206_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l143_c50_a47d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l143_c50_a47d_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l143_c50_a47d_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l143_c28_5206_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l143_c28_5206_return_output : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l146_c3_a19b_uxn_c_l146_c3_a19b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l146_c3_a19b_uxn_c_l146_c3_a19b_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l146_c3_a19b_uxn_c_l146_c3_a19b_arg1 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l146_c3_a19b_uxn_c_l146_c3_a19b_arg2 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l146_c3_a19b_uxn_c_l146_c3_a19b_arg3 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l146_c3_a19b_uxn_c_l146_c3_a19b_arg4 : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l149_c26_e213_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l149_c26_e213_iftrue : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l149_c26_e213_iffalse : unsigned(31 downto 0);
 variable VAR_CAST_TO_uint32_t_uxn_c_l149_c45_c50c_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l149_c45_eda1_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l149_c45_eda1_right : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l149_c45_eda1_return_output : unsigned(63 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l149_c45_6d9c_left : unsigned(63 downto 0);
 variable VAR_CAST_TO_uint32_t_uxn_c_l149_c81_ecd8_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l149_c45_6d9c_right : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l149_c45_6d9c_return_output : unsigned(64 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l149_c99_41e8_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l149_c99_41e8_right : unsigned(17 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l149_c99_41e8_return_output : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l149_c26_e213_return_output : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l151_c18_6d57_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l151_c18_6d57_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l151_c18_6d57_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l151_c18_2077_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l151_c18_2077_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l151_c18_2077_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l151_c18_6d57_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l152_c6_f23a_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l152_c6_f23a_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l152_c6_f23a_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l152_c22_375e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l152_c22_375e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l152_c22_375e_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l152_c6_f23a_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l153_c6_600d_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l153_c6_600d_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l153_c6_600d_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l153_c31_fd1d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l153_c31_fd1d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l153_c31_fd1d_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l153_c6_600d_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l155_c19_710f_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l155_c38_155e_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l155_c38_155e_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l155_c19_710f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l155_c19_710f_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l156_c19_0e6b_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l156_c19_0e6b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l156_c19_0e6b_return_output : unsigned(0 downto 0);
 variable VAR_bg_vram_update_uxn_c_l158_c19_e875_read_address : unsigned(31 downto 0);
 variable VAR_bg_vram_update_uxn_c_l158_c19_e875_write_address : unsigned(31 downto 0);
 variable VAR_bg_vram_update_uxn_c_l158_c19_e875_write_value : unsigned(1 downto 0);
 variable VAR_bg_vram_update_uxn_c_l158_c19_e875_write_enable : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l161_c3_4142_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l161_c3_4142_iftrue : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l161_c3_4142_iffalse : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l161_c3_4142_return_output : unsigned(1 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l162_c3_4a05_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l162_c22_441c_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l162_c57_d11f_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l162_c57_d11f_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l162_c22_441c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l162_c22_441c_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l162_c3_4a05_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l162_c3_4a05_return_output : unsigned(0 downto 0);
 variable VAR_bg_vram_update_uxn_c_l158_c19_e875_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_bg_vram_update_uxn_c_l158_c19_e875_return_output : unsigned(1 downto 0);
 variable VAR_fg_vram_update_uxn_c_l165_c19_66ea_read_address : unsigned(31 downto 0);
 variable VAR_fg_vram_update_uxn_c_l165_c19_66ea_write_address : unsigned(31 downto 0);
 variable VAR_fg_vram_update_uxn_c_l165_c19_66ea_write_value : unsigned(1 downto 0);
 variable VAR_fg_vram_update_uxn_c_l165_c19_66ea_write_enable : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l168_c3_64e6_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l168_c3_64e6_iftrue : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l168_c3_64e6_iffalse : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l168_c3_64e6_return_output : unsigned(1 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l169_c3_da79_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l169_c22_05d3_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l169_c22_05d3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l169_c22_05d3_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l169_c3_da79_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l169_c3_da79_return_output : unsigned(0 downto 0);
 variable VAR_fg_vram_update_uxn_c_l165_c19_66ea_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_fg_vram_update_uxn_c_l165_c19_66ea_return_output : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l172_c26_351b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l172_c26_351b_iftrue : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l172_c26_351b_iffalse : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l172_c43_b343_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l172_c43_b343_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l172_c43_b343_return_output : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l172_c26_351b_return_output : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l173_c19_3bbe_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l173_c19_3bbe_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l173_c19_3bbe_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l173_c19_1300_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l173_c19_1300_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l173_c19_1300_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l173_c19_3bbe_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l174_c19_cf51_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l174_c19_cf51_iftrue : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l174_c19_cf51_iffalse : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l174_c19_35fe_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l174_c19_35fe_right : unsigned(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l174_c19_35fe_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l174_c51_2785_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l174_c51_2785_iftrue : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l174_c51_2785_iffalse : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l174_c77_debf_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l174_c77_debf_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l174_c77_debf_return_output : unsigned(32 downto 0);
 variable VAR_MUX_uxn_c_l174_c51_2785_return_output : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l174_c19_cf51_return_output : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l175_c25_9aa4_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l175_c25_9aa4_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l175_c25_9aa4_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l175_c25_ee47_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l175_c25_ee47_right : unsigned(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l175_c25_ee47_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l175_c25_9aa4_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l176_c17_edad_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l176_c17_edad_iftrue : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l176_c17_edad_iffalse : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l176_c17_8c68_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l176_c17_8c68_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l176_c17_8c68_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l176_c17_edad_return_output : unsigned(1 downto 0);
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_c_l162_l169_DUPLICATE_40b1_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_c_l162_l169_DUPLICATE_40b1_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l169_l162_DUPLICATE_0d92_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l169_l162_DUPLICATE_0d92_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l169_l162_DUPLICATE_0d92_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_269d_uxn_c_l111_l179_DUPLICATE_a4f1_return_output : gpu_step_result_t;
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
variable REG_VAR_is_fill_pixel0 : unsigned(0 downto 0);
variable REG_VAR_is_fill_pixel1 : unsigned(0 downto 0);
variable REG_VAR_fill_layer : unsigned(0 downto 0);
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
     VAR_MUX_uxn_c_l151_c18_6d57_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l137_c13_822a_iffalse := resize(to_unsigned(359, 9), 16);
     VAR_MUX_uxn_c_l174_c19_cf51_iftrue := resize(to_unsigned(0, 1), 32);
     VAR_MUX_uxn_c_l140_c13_ffba_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_MUX_uxn_c_l175_c25_9aa4_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l127_c17_9300_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l127_c17_9300_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_c_l149_c99_41e8_right := to_unsigned(262143, 18);
     VAR_BIN_OP_AND_uxn_c_l134_c27_750c_right := to_unsigned(262143, 18);
     VAR_BIN_OP_PLUS_uxn_c_l153_c31_fd1d_right := to_unsigned(1, 1);
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l136_c38_de0a_right := to_unsigned(400, 9);
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l149_c45_eda1_right := to_unsigned(400, 32);
     VAR_BIN_OP_EQ_uxn_c_l176_c17_8c68_right := to_unsigned(0, 1);
     VAR_is_fill_active_MUX_uxn_c_l130_c2_e932_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l127_c17_5bde_right := to_unsigned(15, 4);
     VAR_MUX_uxn_c_l173_c19_3bbe_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_MINUS_uxn_c_l172_c43_b343_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_c_l152_c22_375e_right := to_unsigned(1, 1);
     VAR_BIN_OP_DIV_uxn_c_l135_c13_338a_right := to_unsigned(400, 9);
     VAR_MUX_uxn_c_l175_c25_9aa4_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l173_c19_3bbe_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l172_c26_351b_iffalse := resize(to_unsigned(0, 1), 32);
     VAR_BIN_OP_EQ_uxn_c_l174_c19_35fe_right := to_unsigned(143999, 18);
     VAR_MUX_uxn_c_l138_c13_879c_iffalse := resize(to_unsigned(399, 9), 16);
     VAR_MUX_uxn_c_l151_c18_6d57_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l130_c1_f943_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l175_c25_ee47_right := to_unsigned(143999, 18);
     VAR_BIN_OP_PLUS_uxn_c_l174_c77_debf_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l173_c19_1300_right := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l139_c13_2f14_iftrue := resize(to_unsigned(0, 1), 16);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l130_c1_f943_iftrue := VAR_CLOCK_ENABLE;
     VAR_bg_vram_update_uxn_c_l158_c19_e875_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_fg_vram_update_uxn_c_l165_c19_66ea_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_fill_color_MUX_uxn_c_l130_c2_e932_iffalse := fill_color;
     VAR_fill_layer_MUX_uxn_c_l130_c2_e932_iffalse := fill_layer;
     VAR_fill_pixels_remaining_MUX_uxn_c_l130_c2_e932_iffalse := fill_pixels_remaining;
     VAR_fill_x0_MUX_uxn_c_l130_c2_e932_iffalse := fill_x0;
     VAR_fill_x1_MUX_uxn_c_l130_c2_e932_iffalse := fill_x1;
     VAR_fill_y0_MUX_uxn_c_l130_c2_e932_iffalse := fill_y0;
     VAR_fill_y1_MUX_uxn_c_l130_c2_e932_iffalse := fill_y1;
     VAR_MUX_uxn_c_l174_c51_2785_cond := VAR_is_active_drawing_area;
     VAR_UNARY_OP_NOT_uxn_c_l130_c22_d57c_expr := is_fill_active;
     VAR_is_fill_active_MUX_uxn_c_l130_c2_e932_iffalse := is_fill_active;
     VAR_is_fill_top_MUX_uxn_c_l130_c2_e932_iffalse := is_fill_top;
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l169_l162_DUPLICATE_0d92_right := VAR_is_vram_write;
     VAR_BIN_OP_EQ_uxn_c_l174_c19_35fe_left := pixel_counter;
     VAR_BIN_OP_PLUS_uxn_c_l174_c77_debf_left := pixel_counter;
     VAR_MUX_uxn_c_l174_c51_2785_iffalse := pixel_counter;
     VAR_bg_vram_update_uxn_c_l158_c19_e875_read_address := pixel_counter;
     VAR_fg_vram_update_uxn_c_l165_c19_66ea_read_address := pixel_counter;
     VAR_BIN_OP_AND_uxn_c_l134_c27_750c_left := VAR_vram_address;
     VAR_BIN_OP_AND_uxn_c_l149_c99_41e8_left := VAR_vram_address;
     VAR_CONST_SR_20_uxn_c_l132_c18_8718_x := VAR_vram_address;
     VAR_CONST_SR_21_uxn_c_l133_c17_11b3_x := VAR_vram_address;
     VAR_CONST_SR_28_uxn_c_l126_c24_6a7b_x := VAR_vram_address;
     VAR_MUX_uxn_c_l161_c3_4142_iffalse := VAR_vram_value;
     VAR_MUX_uxn_c_l168_c3_64e6_iffalse := VAR_vram_value;
     VAR_fill_color_uxn_c_l142_c3_395a := VAR_vram_value;
     VAR_BIN_OP_AND_uxn_c_l169_c22_05d3_right := VAR_vram_write_layer;
     VAR_UNARY_OP_NOT_uxn_c_l162_c57_d11f_expr := VAR_vram_write_layer;
     VAR_fill_layer_MUX_uxn_c_l130_c2_e932_iftrue := VAR_vram_write_layer;
     VAR_x_MUX_uxn_c_l130_c2_e932_iffalse := x;
     VAR_y_MUX_uxn_c_l130_c2_e932_iffalse := y;
     VAR_fill_color_MUX_uxn_c_l130_c2_e932_iftrue := VAR_fill_color_uxn_c_l142_c3_395a;
     VAR_printf_uxn_c_l146_c3_a19b_uxn_c_l146_c3_a19b_arg4 := resize(VAR_fill_color_uxn_c_l142_c3_395a, 32);
     -- CONST_SR_28[uxn_c_l126_c24_6a7b] LATENCY=0
     -- Inputs
     CONST_SR_28_uxn_c_l126_c24_6a7b_x <= VAR_CONST_SR_28_uxn_c_l126_c24_6a7b_x;
     -- Outputs
     VAR_CONST_SR_28_uxn_c_l126_c24_6a7b_return_output := CONST_SR_28_uxn_c_l126_c24_6a7b_return_output;

     -- CONST_SR_20[uxn_c_l132_c18_8718] LATENCY=0
     -- Inputs
     CONST_SR_20_uxn_c_l132_c18_8718_x <= VAR_CONST_SR_20_uxn_c_l132_c18_8718_x;
     -- Outputs
     VAR_CONST_SR_20_uxn_c_l132_c18_8718_return_output := CONST_SR_20_uxn_c_l132_c18_8718_return_output;

     -- CONST_SR_21[uxn_c_l133_c17_11b3] LATENCY=0
     -- Inputs
     CONST_SR_21_uxn_c_l133_c17_11b3_x <= VAR_CONST_SR_21_uxn_c_l133_c17_11b3_x;
     -- Outputs
     VAR_CONST_SR_21_uxn_c_l133_c17_11b3_return_output := CONST_SR_21_uxn_c_l133_c17_11b3_return_output;

     -- UNARY_OP_NOT[uxn_c_l162_c57_d11f] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l162_c57_d11f_expr <= VAR_UNARY_OP_NOT_uxn_c_l162_c57_d11f_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l162_c57_d11f_return_output := UNARY_OP_NOT_uxn_c_l162_c57_d11f_return_output;

     -- UNARY_OP_NOT[uxn_c_l130_c22_d57c] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l130_c22_d57c_expr <= VAR_UNARY_OP_NOT_uxn_c_l130_c22_d57c_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l130_c22_d57c_return_output := UNARY_OP_NOT_uxn_c_l130_c22_d57c_return_output;

     -- BIN_OP_PLUS[uxn_c_l174_c77_debf] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l174_c77_debf_left <= VAR_BIN_OP_PLUS_uxn_c_l174_c77_debf_left;
     BIN_OP_PLUS_uxn_c_l174_c77_debf_right <= VAR_BIN_OP_PLUS_uxn_c_l174_c77_debf_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l174_c77_debf_return_output := BIN_OP_PLUS_uxn_c_l174_c77_debf_return_output;

     -- BIN_OP_AND[uxn_c_l134_c27_750c] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l134_c27_750c_left <= VAR_BIN_OP_AND_uxn_c_l134_c27_750c_left;
     BIN_OP_AND_uxn_c_l134_c27_750c_right <= VAR_BIN_OP_AND_uxn_c_l134_c27_750c_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l134_c27_750c_return_output := BIN_OP_AND_uxn_c_l134_c27_750c_return_output;

     -- BIN_OP_AND[uxn_c_l149_c99_41e8] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l149_c99_41e8_left <= VAR_BIN_OP_AND_uxn_c_l149_c99_41e8_left;
     BIN_OP_AND_uxn_c_l149_c99_41e8_right <= VAR_BIN_OP_AND_uxn_c_l149_c99_41e8_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l149_c99_41e8_return_output := BIN_OP_AND_uxn_c_l149_c99_41e8_return_output;

     -- BIN_OP_EQ[uxn_c_l174_c19_35fe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l174_c19_35fe_left <= VAR_BIN_OP_EQ_uxn_c_l174_c19_35fe_left;
     BIN_OP_EQ_uxn_c_l174_c19_35fe_right <= VAR_BIN_OP_EQ_uxn_c_l174_c19_35fe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l174_c19_35fe_return_output := BIN_OP_EQ_uxn_c_l174_c19_35fe_return_output;

     -- Submodule level 1
     VAR_BIN_OP_DIV_uxn_c_l135_c13_338a_left := VAR_BIN_OP_AND_uxn_c_l134_c27_750c_return_output;
     VAR_BIN_OP_MINUS_uxn_c_l136_c13_3245_left := VAR_BIN_OP_AND_uxn_c_l134_c27_750c_return_output;
     VAR_MUX_uxn_c_l149_c26_e213_iffalse := VAR_BIN_OP_AND_uxn_c_l149_c99_41e8_return_output;
     VAR_MUX_uxn_c_l174_c19_cf51_cond := VAR_BIN_OP_EQ_uxn_c_l174_c19_35fe_return_output;
     VAR_MUX_uxn_c_l174_c51_2785_iftrue := resize(VAR_BIN_OP_PLUS_uxn_c_l174_c77_debf_return_output, 32);
     VAR_is_fill_left_uxn_c_l132_c3_02a5 := resize(VAR_CONST_SR_20_uxn_c_l132_c18_8718_return_output, 1);
     VAR_is_fill_top_uxn_c_l133_c3_c62d := resize(VAR_CONST_SR_21_uxn_c_l133_c17_11b3_return_output, 1);
     VAR_BIN_OP_AND_uxn_c_l130_c6_c684_right := VAR_UNARY_OP_NOT_uxn_c_l130_c22_d57c_return_output;
     VAR_BIN_OP_AND_uxn_c_l162_c22_441c_right := VAR_UNARY_OP_NOT_uxn_c_l162_c57_d11f_return_output;
     VAR_MUX_uxn_c_l138_c13_879c_cond := VAR_is_fill_left_uxn_c_l132_c3_02a5;
     VAR_MUX_uxn_c_l140_c13_ffba_cond := VAR_is_fill_left_uxn_c_l132_c3_02a5;
     VAR_MUX_uxn_c_l137_c13_822a_cond := VAR_is_fill_top_uxn_c_l133_c3_c62d;
     VAR_MUX_uxn_c_l139_c13_2f14_cond := VAR_is_fill_top_uxn_c_l133_c3_c62d;
     VAR_is_fill_top_MUX_uxn_c_l130_c2_e932_iftrue := VAR_is_fill_top_uxn_c_l133_c3_c62d;
     -- CAST_TO_uint4_t[uxn_c_l126_c14_13f4] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_c_l126_c14_13f4_return_output := CAST_TO_uint4_t_uint32_t(
     VAR_CONST_SR_28_uxn_c_l126_c24_6a7b_return_output);

     -- BIN_OP_DIV[uxn_c_l135_c13_338a] LATENCY=0
     -- Inputs
     BIN_OP_DIV_uxn_c_l135_c13_338a_left <= VAR_BIN_OP_DIV_uxn_c_l135_c13_338a_left;
     BIN_OP_DIV_uxn_c_l135_c13_338a_right <= VAR_BIN_OP_DIV_uxn_c_l135_c13_338a_right;
     -- Outputs
     VAR_BIN_OP_DIV_uxn_c_l135_c13_338a_return_output := BIN_OP_DIV_uxn_c_l135_c13_338a_return_output;

     -- MUX[uxn_c_l174_c51_2785] LATENCY=0
     -- Inputs
     MUX_uxn_c_l174_c51_2785_cond <= VAR_MUX_uxn_c_l174_c51_2785_cond;
     MUX_uxn_c_l174_c51_2785_iftrue <= VAR_MUX_uxn_c_l174_c51_2785_iftrue;
     MUX_uxn_c_l174_c51_2785_iffalse <= VAR_MUX_uxn_c_l174_c51_2785_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l174_c51_2785_return_output := MUX_uxn_c_l174_c51_2785_return_output;

     -- Submodule level 2
     VAR_fill_y0_uxn_c_l135_c3_323b := resize(VAR_BIN_OP_DIV_uxn_c_l135_c13_338a_return_output, 16);
     VAR_BIN_OP_EQ_uxn_c_l127_c17_5bde_left := VAR_CAST_TO_uint4_t_uxn_c_l126_c14_13f4_return_output;
     REG_VAR_vram_code := VAR_CAST_TO_uint4_t_uxn_c_l126_c14_13f4_return_output;
     VAR_MUX_uxn_c_l174_c19_cf51_iffalse := VAR_MUX_uxn_c_l174_c51_2785_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l136_c38_de0a_left := VAR_fill_y0_uxn_c_l135_c3_323b;
     VAR_MUX_uxn_c_l137_c13_822a_iftrue := VAR_fill_y0_uxn_c_l135_c3_323b;
     VAR_MUX_uxn_c_l139_c13_2f14_iffalse := VAR_fill_y0_uxn_c_l135_c3_323b;
     -- MUX[uxn_c_l139_c13_2f14] LATENCY=0
     -- Inputs
     MUX_uxn_c_l139_c13_2f14_cond <= VAR_MUX_uxn_c_l139_c13_2f14_cond;
     MUX_uxn_c_l139_c13_2f14_iftrue <= VAR_MUX_uxn_c_l139_c13_2f14_iftrue;
     MUX_uxn_c_l139_c13_2f14_iffalse <= VAR_MUX_uxn_c_l139_c13_2f14_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l139_c13_2f14_return_output := MUX_uxn_c_l139_c13_2f14_return_output;

     -- BIN_OP_EQ[uxn_c_l127_c17_5bde] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l127_c17_5bde_left <= VAR_BIN_OP_EQ_uxn_c_l127_c17_5bde_left;
     BIN_OP_EQ_uxn_c_l127_c17_5bde_right <= VAR_BIN_OP_EQ_uxn_c_l127_c17_5bde_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l127_c17_5bde_return_output := BIN_OP_EQ_uxn_c_l127_c17_5bde_return_output;

     -- MUX[uxn_c_l137_c13_822a] LATENCY=0
     -- Inputs
     MUX_uxn_c_l137_c13_822a_cond <= VAR_MUX_uxn_c_l137_c13_822a_cond;
     MUX_uxn_c_l137_c13_822a_iftrue <= VAR_MUX_uxn_c_l137_c13_822a_iftrue;
     MUX_uxn_c_l137_c13_822a_iffalse <= VAR_MUX_uxn_c_l137_c13_822a_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l137_c13_822a_return_output := MUX_uxn_c_l137_c13_822a_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_c_l136_c38_de0a] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_c_l136_c38_de0a_left <= VAR_BIN_OP_INFERRED_MULT_uxn_c_l136_c38_de0a_left;
     BIN_OP_INFERRED_MULT_uxn_c_l136_c38_de0a_right <= VAR_BIN_OP_INFERRED_MULT_uxn_c_l136_c38_de0a_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l136_c38_de0a_return_output := BIN_OP_INFERRED_MULT_uxn_c_l136_c38_de0a_return_output;

     -- MUX[uxn_c_l174_c19_cf51] LATENCY=0
     -- Inputs
     MUX_uxn_c_l174_c19_cf51_cond <= VAR_MUX_uxn_c_l174_c19_cf51_cond;
     MUX_uxn_c_l174_c19_cf51_iftrue <= VAR_MUX_uxn_c_l174_c19_cf51_iftrue;
     MUX_uxn_c_l174_c19_cf51_iffalse <= VAR_MUX_uxn_c_l174_c19_cf51_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l174_c19_cf51_return_output := MUX_uxn_c_l174_c19_cf51_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_c_l127_c17_9300_cond := VAR_BIN_OP_EQ_uxn_c_l127_c17_5bde_return_output;
     VAR_BIN_OP_MINUS_uxn_c_l136_c13_3245_right := VAR_BIN_OP_INFERRED_MULT_uxn_c_l136_c38_de0a_return_output;
     VAR_fill_y1_uxn_c_l137_c3_00d4 := VAR_MUX_uxn_c_l137_c13_822a_return_output;
     VAR_fill_y0_uxn_c_l139_c3_2b0e := VAR_MUX_uxn_c_l139_c13_2f14_return_output;
     VAR_BIN_OP_EQ_uxn_c_l175_c25_ee47_left := VAR_MUX_uxn_c_l174_c19_cf51_return_output;
     REG_VAR_pixel_counter := VAR_MUX_uxn_c_l174_c19_cf51_return_output;
     VAR_BIN_OP_MINUS_uxn_c_l143_c50_a47d_right := VAR_fill_y0_uxn_c_l139_c3_2b0e;
     VAR_fill_y0_MUX_uxn_c_l130_c2_e932_iftrue := VAR_fill_y0_uxn_c_l139_c3_2b0e;
     VAR_printf_uxn_c_l146_c3_a19b_uxn_c_l146_c3_a19b_arg1 := resize(VAR_fill_y0_uxn_c_l139_c3_2b0e, 32);
     VAR_y_MUX_uxn_c_l130_c2_e932_iftrue := VAR_fill_y0_uxn_c_l139_c3_2b0e;
     VAR_BIN_OP_MINUS_uxn_c_l143_c50_a47d_left := VAR_fill_y1_uxn_c_l137_c3_00d4;
     VAR_fill_y1_MUX_uxn_c_l130_c2_e932_iftrue := VAR_fill_y1_uxn_c_l137_c3_00d4;
     VAR_printf_uxn_c_l146_c3_a19b_uxn_c_l146_c3_a19b_arg3 := resize(VAR_fill_y1_uxn_c_l137_c3_00d4, 32);
     -- BIN_OP_MINUS[uxn_c_l136_c13_3245] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l136_c13_3245_left <= VAR_BIN_OP_MINUS_uxn_c_l136_c13_3245_left;
     BIN_OP_MINUS_uxn_c_l136_c13_3245_right <= VAR_BIN_OP_MINUS_uxn_c_l136_c13_3245_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l136_c13_3245_return_output := BIN_OP_MINUS_uxn_c_l136_c13_3245_return_output;

     -- BIN_OP_MINUS[uxn_c_l143_c50_a47d] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l143_c50_a47d_left <= VAR_BIN_OP_MINUS_uxn_c_l143_c50_a47d_left;
     BIN_OP_MINUS_uxn_c_l143_c50_a47d_right <= VAR_BIN_OP_MINUS_uxn_c_l143_c50_a47d_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l143_c50_a47d_return_output := BIN_OP_MINUS_uxn_c_l143_c50_a47d_return_output;

     -- BIN_OP_EQ[uxn_c_l175_c25_ee47] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l175_c25_ee47_left <= VAR_BIN_OP_EQ_uxn_c_l175_c25_ee47_left;
     BIN_OP_EQ_uxn_c_l175_c25_ee47_right <= VAR_BIN_OP_EQ_uxn_c_l175_c25_ee47_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l175_c25_ee47_return_output := BIN_OP_EQ_uxn_c_l175_c25_ee47_return_output;

     -- MUX[uxn_c_l127_c17_9300] LATENCY=0
     -- Inputs
     MUX_uxn_c_l127_c17_9300_cond <= VAR_MUX_uxn_c_l127_c17_9300_cond;
     MUX_uxn_c_l127_c17_9300_iftrue <= VAR_MUX_uxn_c_l127_c17_9300_iftrue;
     MUX_uxn_c_l127_c17_9300_iffalse <= VAR_MUX_uxn_c_l127_c17_9300_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l127_c17_9300_return_output := MUX_uxn_c_l127_c17_9300_return_output;

     -- Submodule level 4
     VAR_MUX_uxn_c_l175_c25_9aa4_cond := VAR_BIN_OP_EQ_uxn_c_l175_c25_ee47_return_output;
     VAR_fill_x0_uxn_c_l136_c3_1884 := resize(VAR_BIN_OP_MINUS_uxn_c_l136_c13_3245_return_output, 16);
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l143_c28_5206_right := VAR_BIN_OP_MINUS_uxn_c_l143_c50_a47d_return_output;
     VAR_BIN_OP_AND_uxn_c_l130_c6_c684_left := VAR_MUX_uxn_c_l127_c17_9300_return_output;
     REG_VAR_is_fill_code := VAR_MUX_uxn_c_l127_c17_9300_return_output;
     VAR_MUX_uxn_c_l138_c13_879c_iftrue := VAR_fill_x0_uxn_c_l136_c3_1884;
     VAR_MUX_uxn_c_l140_c13_ffba_iffalse := VAR_fill_x0_uxn_c_l136_c3_1884;
     -- MUX[uxn_c_l138_c13_879c] LATENCY=0
     -- Inputs
     MUX_uxn_c_l138_c13_879c_cond <= VAR_MUX_uxn_c_l138_c13_879c_cond;
     MUX_uxn_c_l138_c13_879c_iftrue <= VAR_MUX_uxn_c_l138_c13_879c_iftrue;
     MUX_uxn_c_l138_c13_879c_iffalse <= VAR_MUX_uxn_c_l138_c13_879c_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l138_c13_879c_return_output := MUX_uxn_c_l138_c13_879c_return_output;

     -- BIN_OP_AND[uxn_c_l130_c6_c684] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l130_c6_c684_left <= VAR_BIN_OP_AND_uxn_c_l130_c6_c684_left;
     BIN_OP_AND_uxn_c_l130_c6_c684_right <= VAR_BIN_OP_AND_uxn_c_l130_c6_c684_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l130_c6_c684_return_output := BIN_OP_AND_uxn_c_l130_c6_c684_return_output;

     -- MUX[uxn_c_l140_c13_ffba] LATENCY=0
     -- Inputs
     MUX_uxn_c_l140_c13_ffba_cond <= VAR_MUX_uxn_c_l140_c13_ffba_cond;
     MUX_uxn_c_l140_c13_ffba_iftrue <= VAR_MUX_uxn_c_l140_c13_ffba_iftrue;
     MUX_uxn_c_l140_c13_ffba_iffalse <= VAR_MUX_uxn_c_l140_c13_ffba_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l140_c13_ffba_return_output := MUX_uxn_c_l140_c13_ffba_return_output;

     -- MUX[uxn_c_l175_c25_9aa4] LATENCY=0
     -- Inputs
     MUX_uxn_c_l175_c25_9aa4_cond <= VAR_MUX_uxn_c_l175_c25_9aa4_cond;
     MUX_uxn_c_l175_c25_9aa4_iftrue <= VAR_MUX_uxn_c_l175_c25_9aa4_iftrue;
     MUX_uxn_c_l175_c25_9aa4_iffalse <= VAR_MUX_uxn_c_l175_c25_9aa4_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l175_c25_9aa4_return_output := MUX_uxn_c_l175_c25_9aa4_return_output;

     -- Submodule level 5
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l130_c1_f943_cond := VAR_BIN_OP_AND_uxn_c_l130_c6_c684_return_output;
     VAR_fill_color_MUX_uxn_c_l130_c2_e932_cond := VAR_BIN_OP_AND_uxn_c_l130_c6_c684_return_output;
     VAR_fill_layer_MUX_uxn_c_l130_c2_e932_cond := VAR_BIN_OP_AND_uxn_c_l130_c6_c684_return_output;
     VAR_fill_pixels_remaining_MUX_uxn_c_l130_c2_e932_cond := VAR_BIN_OP_AND_uxn_c_l130_c6_c684_return_output;
     VAR_fill_x0_MUX_uxn_c_l130_c2_e932_cond := VAR_BIN_OP_AND_uxn_c_l130_c6_c684_return_output;
     VAR_fill_x1_MUX_uxn_c_l130_c2_e932_cond := VAR_BIN_OP_AND_uxn_c_l130_c6_c684_return_output;
     VAR_fill_y0_MUX_uxn_c_l130_c2_e932_cond := VAR_BIN_OP_AND_uxn_c_l130_c6_c684_return_output;
     VAR_fill_y1_MUX_uxn_c_l130_c2_e932_cond := VAR_BIN_OP_AND_uxn_c_l130_c6_c684_return_output;
     VAR_is_fill_active_MUX_uxn_c_l130_c2_e932_cond := VAR_BIN_OP_AND_uxn_c_l130_c6_c684_return_output;
     VAR_is_fill_top_MUX_uxn_c_l130_c2_e932_cond := VAR_BIN_OP_AND_uxn_c_l130_c6_c684_return_output;
     VAR_x_MUX_uxn_c_l130_c2_e932_cond := VAR_BIN_OP_AND_uxn_c_l130_c6_c684_return_output;
     VAR_y_MUX_uxn_c_l130_c2_e932_cond := VAR_BIN_OP_AND_uxn_c_l130_c6_c684_return_output;
     VAR_fill_x1_uxn_c_l138_c3_7b97 := VAR_MUX_uxn_c_l138_c13_879c_return_output;
     VAR_fill_x0_uxn_c_l140_c3_e396 := VAR_MUX_uxn_c_l140_c13_ffba_return_output;
     VAR_BIN_OP_MINUS_uxn_c_l143_c28_eb27_right := VAR_fill_x0_uxn_c_l140_c3_e396;
     VAR_fill_x0_MUX_uxn_c_l130_c2_e932_iftrue := VAR_fill_x0_uxn_c_l140_c3_e396;
     VAR_printf_uxn_c_l146_c3_a19b_uxn_c_l146_c3_a19b_arg0 := resize(VAR_fill_x0_uxn_c_l140_c3_e396, 32);
     VAR_x_MUX_uxn_c_l130_c2_e932_iftrue := VAR_fill_x0_uxn_c_l140_c3_e396;
     VAR_BIN_OP_MINUS_uxn_c_l143_c28_eb27_left := VAR_fill_x1_uxn_c_l138_c3_7b97;
     VAR_fill_x1_MUX_uxn_c_l130_c2_e932_iftrue := VAR_fill_x1_uxn_c_l138_c3_7b97;
     VAR_printf_uxn_c_l146_c3_a19b_uxn_c_l146_c3_a19b_arg2 := resize(VAR_fill_x1_uxn_c_l138_c3_7b97, 32);
     -- y_MUX[uxn_c_l130_c2_e932] LATENCY=0
     -- Inputs
     y_MUX_uxn_c_l130_c2_e932_cond <= VAR_y_MUX_uxn_c_l130_c2_e932_cond;
     y_MUX_uxn_c_l130_c2_e932_iftrue <= VAR_y_MUX_uxn_c_l130_c2_e932_iftrue;
     y_MUX_uxn_c_l130_c2_e932_iffalse <= VAR_y_MUX_uxn_c_l130_c2_e932_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_c_l130_c2_e932_return_output := y_MUX_uxn_c_l130_c2_e932_return_output;

     -- BIN_OP_MINUS[uxn_c_l143_c28_eb27] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l143_c28_eb27_left <= VAR_BIN_OP_MINUS_uxn_c_l143_c28_eb27_left;
     BIN_OP_MINUS_uxn_c_l143_c28_eb27_right <= VAR_BIN_OP_MINUS_uxn_c_l143_c28_eb27_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l143_c28_eb27_return_output := BIN_OP_MINUS_uxn_c_l143_c28_eb27_return_output;

     -- is_fill_top_MUX[uxn_c_l130_c2_e932] LATENCY=0
     -- Inputs
     is_fill_top_MUX_uxn_c_l130_c2_e932_cond <= VAR_is_fill_top_MUX_uxn_c_l130_c2_e932_cond;
     is_fill_top_MUX_uxn_c_l130_c2_e932_iftrue <= VAR_is_fill_top_MUX_uxn_c_l130_c2_e932_iftrue;
     is_fill_top_MUX_uxn_c_l130_c2_e932_iffalse <= VAR_is_fill_top_MUX_uxn_c_l130_c2_e932_iffalse;
     -- Outputs
     VAR_is_fill_top_MUX_uxn_c_l130_c2_e932_return_output := is_fill_top_MUX_uxn_c_l130_c2_e932_return_output;

     -- fill_x0_MUX[uxn_c_l130_c2_e932] LATENCY=0
     -- Inputs
     fill_x0_MUX_uxn_c_l130_c2_e932_cond <= VAR_fill_x0_MUX_uxn_c_l130_c2_e932_cond;
     fill_x0_MUX_uxn_c_l130_c2_e932_iftrue <= VAR_fill_x0_MUX_uxn_c_l130_c2_e932_iftrue;
     fill_x0_MUX_uxn_c_l130_c2_e932_iffalse <= VAR_fill_x0_MUX_uxn_c_l130_c2_e932_iffalse;
     -- Outputs
     VAR_fill_x0_MUX_uxn_c_l130_c2_e932_return_output := fill_x0_MUX_uxn_c_l130_c2_e932_return_output;

     -- x_MUX[uxn_c_l130_c2_e932] LATENCY=0
     -- Inputs
     x_MUX_uxn_c_l130_c2_e932_cond <= VAR_x_MUX_uxn_c_l130_c2_e932_cond;
     x_MUX_uxn_c_l130_c2_e932_iftrue <= VAR_x_MUX_uxn_c_l130_c2_e932_iftrue;
     x_MUX_uxn_c_l130_c2_e932_iffalse <= VAR_x_MUX_uxn_c_l130_c2_e932_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_c_l130_c2_e932_return_output := x_MUX_uxn_c_l130_c2_e932_return_output;

     -- fill_color_MUX[uxn_c_l130_c2_e932] LATENCY=0
     -- Inputs
     fill_color_MUX_uxn_c_l130_c2_e932_cond <= VAR_fill_color_MUX_uxn_c_l130_c2_e932_cond;
     fill_color_MUX_uxn_c_l130_c2_e932_iftrue <= VAR_fill_color_MUX_uxn_c_l130_c2_e932_iftrue;
     fill_color_MUX_uxn_c_l130_c2_e932_iffalse <= VAR_fill_color_MUX_uxn_c_l130_c2_e932_iffalse;
     -- Outputs
     VAR_fill_color_MUX_uxn_c_l130_c2_e932_return_output := fill_color_MUX_uxn_c_l130_c2_e932_return_output;

     -- fill_x1_MUX[uxn_c_l130_c2_e932] LATENCY=0
     -- Inputs
     fill_x1_MUX_uxn_c_l130_c2_e932_cond <= VAR_fill_x1_MUX_uxn_c_l130_c2_e932_cond;
     fill_x1_MUX_uxn_c_l130_c2_e932_iftrue <= VAR_fill_x1_MUX_uxn_c_l130_c2_e932_iftrue;
     fill_x1_MUX_uxn_c_l130_c2_e932_iffalse <= VAR_fill_x1_MUX_uxn_c_l130_c2_e932_iffalse;
     -- Outputs
     VAR_fill_x1_MUX_uxn_c_l130_c2_e932_return_output := fill_x1_MUX_uxn_c_l130_c2_e932_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l130_c1_f943] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l130_c1_f943_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l130_c1_f943_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l130_c1_f943_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l130_c1_f943_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l130_c1_f943_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l130_c1_f943_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l130_c1_f943_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l130_c1_f943_return_output;

     -- is_fill_active_MUX[uxn_c_l130_c2_e932] LATENCY=0
     -- Inputs
     is_fill_active_MUX_uxn_c_l130_c2_e932_cond <= VAR_is_fill_active_MUX_uxn_c_l130_c2_e932_cond;
     is_fill_active_MUX_uxn_c_l130_c2_e932_iftrue <= VAR_is_fill_active_MUX_uxn_c_l130_c2_e932_iftrue;
     is_fill_active_MUX_uxn_c_l130_c2_e932_iffalse <= VAR_is_fill_active_MUX_uxn_c_l130_c2_e932_iffalse;
     -- Outputs
     VAR_is_fill_active_MUX_uxn_c_l130_c2_e932_return_output := is_fill_active_MUX_uxn_c_l130_c2_e932_return_output;

     -- fill_layer_MUX[uxn_c_l130_c2_e932] LATENCY=0
     -- Inputs
     fill_layer_MUX_uxn_c_l130_c2_e932_cond <= VAR_fill_layer_MUX_uxn_c_l130_c2_e932_cond;
     fill_layer_MUX_uxn_c_l130_c2_e932_iftrue <= VAR_fill_layer_MUX_uxn_c_l130_c2_e932_iftrue;
     fill_layer_MUX_uxn_c_l130_c2_e932_iffalse <= VAR_fill_layer_MUX_uxn_c_l130_c2_e932_iffalse;
     -- Outputs
     VAR_fill_layer_MUX_uxn_c_l130_c2_e932_return_output := fill_layer_MUX_uxn_c_l130_c2_e932_return_output;

     -- fill_y1_MUX[uxn_c_l130_c2_e932] LATENCY=0
     -- Inputs
     fill_y1_MUX_uxn_c_l130_c2_e932_cond <= VAR_fill_y1_MUX_uxn_c_l130_c2_e932_cond;
     fill_y1_MUX_uxn_c_l130_c2_e932_iftrue <= VAR_fill_y1_MUX_uxn_c_l130_c2_e932_iftrue;
     fill_y1_MUX_uxn_c_l130_c2_e932_iffalse <= VAR_fill_y1_MUX_uxn_c_l130_c2_e932_iffalse;
     -- Outputs
     VAR_fill_y1_MUX_uxn_c_l130_c2_e932_return_output := fill_y1_MUX_uxn_c_l130_c2_e932_return_output;

     -- fill_y0_MUX[uxn_c_l130_c2_e932] LATENCY=0
     -- Inputs
     fill_y0_MUX_uxn_c_l130_c2_e932_cond <= VAR_fill_y0_MUX_uxn_c_l130_c2_e932_cond;
     fill_y0_MUX_uxn_c_l130_c2_e932_iftrue <= VAR_fill_y0_MUX_uxn_c_l130_c2_e932_iftrue;
     fill_y0_MUX_uxn_c_l130_c2_e932_iffalse <= VAR_fill_y0_MUX_uxn_c_l130_c2_e932_iffalse;
     -- Outputs
     VAR_fill_y0_MUX_uxn_c_l130_c2_e932_return_output := fill_y0_MUX_uxn_c_l130_c2_e932_return_output;

     -- Submodule level 6
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l143_c28_5206_left := VAR_BIN_OP_MINUS_uxn_c_l143_c28_eb27_return_output;
     VAR_printf_uxn_c_l146_c3_a19b_uxn_c_l146_c3_a19b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l130_c1_f943_return_output;
     VAR_MUX_uxn_c_l161_c3_4142_iftrue := VAR_fill_color_MUX_uxn_c_l130_c2_e932_return_output;
     VAR_MUX_uxn_c_l168_c3_64e6_iftrue := VAR_fill_color_MUX_uxn_c_l130_c2_e932_return_output;
     REG_VAR_fill_color := VAR_fill_color_MUX_uxn_c_l130_c2_e932_return_output;
     VAR_BIN_OP_AND_uxn_c_l156_c19_0e6b_right := VAR_fill_layer_MUX_uxn_c_l130_c2_e932_return_output;
     VAR_UNARY_OP_NOT_uxn_c_l155_c38_155e_expr := VAR_fill_layer_MUX_uxn_c_l130_c2_e932_return_output;
     REG_VAR_fill_layer := VAR_fill_layer_MUX_uxn_c_l130_c2_e932_return_output;
     VAR_MUX_uxn_c_l153_c6_600d_iftrue := VAR_fill_x0_MUX_uxn_c_l130_c2_e932_return_output;
     REG_VAR_fill_x0 := VAR_fill_x0_MUX_uxn_c_l130_c2_e932_return_output;
     VAR_BIN_OP_EQ_uxn_c_l151_c18_2077_right := VAR_fill_x1_MUX_uxn_c_l130_c2_e932_return_output;
     REG_VAR_fill_x1 := VAR_fill_x1_MUX_uxn_c_l130_c2_e932_return_output;
     REG_VAR_fill_y0 := VAR_fill_y0_MUX_uxn_c_l130_c2_e932_return_output;
     REG_VAR_fill_y1 := VAR_fill_y1_MUX_uxn_c_l130_c2_e932_return_output;
     VAR_BIN_OP_AND_uxn_c_l155_c19_710f_left := VAR_is_fill_active_MUX_uxn_c_l130_c2_e932_return_output;
     VAR_BIN_OP_AND_uxn_c_l156_c19_0e6b_left := VAR_is_fill_active_MUX_uxn_c_l130_c2_e932_return_output;
     VAR_MUX_uxn_c_l149_c26_e213_cond := VAR_is_fill_active_MUX_uxn_c_l130_c2_e932_return_output;
     VAR_MUX_uxn_c_l172_c26_351b_cond := VAR_is_fill_active_MUX_uxn_c_l130_c2_e932_return_output;
     VAR_UNARY_OP_NOT_uint1_t_uxn_c_l162_l169_DUPLICATE_40b1_expr := VAR_is_fill_active_MUX_uxn_c_l130_c2_e932_return_output;
     REG_VAR_is_fill_top := VAR_is_fill_top_MUX_uxn_c_l130_c2_e932_return_output;
     VAR_BIN_OP_EQ_uxn_c_l151_c18_2077_left := VAR_x_MUX_uxn_c_l130_c2_e932_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l153_c31_fd1d_left := VAR_x_MUX_uxn_c_l130_c2_e932_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l152_c22_375e_left := VAR_y_MUX_uxn_c_l130_c2_e932_return_output;
     VAR_MUX_uxn_c_l152_c6_f23a_iffalse := VAR_y_MUX_uxn_c_l130_c2_e932_return_output;
     -- printf_uxn_c_l146_c3_a19b[uxn_c_l146_c3_a19b] LATENCY=0
     -- Clock enable
     printf_uxn_c_l146_c3_a19b_uxn_c_l146_c3_a19b_CLOCK_ENABLE <= VAR_printf_uxn_c_l146_c3_a19b_uxn_c_l146_c3_a19b_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_c_l146_c3_a19b_uxn_c_l146_c3_a19b_arg0 <= VAR_printf_uxn_c_l146_c3_a19b_uxn_c_l146_c3_a19b_arg0;
     printf_uxn_c_l146_c3_a19b_uxn_c_l146_c3_a19b_arg1 <= VAR_printf_uxn_c_l146_c3_a19b_uxn_c_l146_c3_a19b_arg1;
     printf_uxn_c_l146_c3_a19b_uxn_c_l146_c3_a19b_arg2 <= VAR_printf_uxn_c_l146_c3_a19b_uxn_c_l146_c3_a19b_arg2;
     printf_uxn_c_l146_c3_a19b_uxn_c_l146_c3_a19b_arg3 <= VAR_printf_uxn_c_l146_c3_a19b_uxn_c_l146_c3_a19b_arg3;
     printf_uxn_c_l146_c3_a19b_uxn_c_l146_c3_a19b_arg4 <= VAR_printf_uxn_c_l146_c3_a19b_uxn_c_l146_c3_a19b_arg4;
     -- Outputs

     -- BIN_OP_INFERRED_MULT[uxn_c_l143_c28_5206] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_c_l143_c28_5206_left <= VAR_BIN_OP_INFERRED_MULT_uxn_c_l143_c28_5206_left;
     BIN_OP_INFERRED_MULT_uxn_c_l143_c28_5206_right <= VAR_BIN_OP_INFERRED_MULT_uxn_c_l143_c28_5206_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l143_c28_5206_return_output := BIN_OP_INFERRED_MULT_uxn_c_l143_c28_5206_return_output;

     -- CAST_TO_uint32_t[uxn_c_l149_c45_c50c] LATENCY=0
     VAR_CAST_TO_uint32_t_uxn_c_l149_c45_c50c_return_output := CAST_TO_uint32_t_uint16_t(
     VAR_y_MUX_uxn_c_l130_c2_e932_return_output);

     -- BIN_OP_AND[uxn_c_l156_c19_0e6b] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l156_c19_0e6b_left <= VAR_BIN_OP_AND_uxn_c_l156_c19_0e6b_left;
     BIN_OP_AND_uxn_c_l156_c19_0e6b_right <= VAR_BIN_OP_AND_uxn_c_l156_c19_0e6b_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l156_c19_0e6b_return_output := BIN_OP_AND_uxn_c_l156_c19_0e6b_return_output;

     -- CAST_TO_uint32_t[uxn_c_l149_c81_ecd8] LATENCY=0
     VAR_CAST_TO_uint32_t_uxn_c_l149_c81_ecd8_return_output := CAST_TO_uint32_t_uint16_t(
     VAR_x_MUX_uxn_c_l130_c2_e932_return_output);

     -- BIN_OP_PLUS[uxn_c_l153_c31_fd1d] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l153_c31_fd1d_left <= VAR_BIN_OP_PLUS_uxn_c_l153_c31_fd1d_left;
     BIN_OP_PLUS_uxn_c_l153_c31_fd1d_right <= VAR_BIN_OP_PLUS_uxn_c_l153_c31_fd1d_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l153_c31_fd1d_return_output := BIN_OP_PLUS_uxn_c_l153_c31_fd1d_return_output;

     -- UNARY_OP_NOT[uxn_c_l155_c38_155e] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l155_c38_155e_expr <= VAR_UNARY_OP_NOT_uxn_c_l155_c38_155e_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l155_c38_155e_return_output := UNARY_OP_NOT_uxn_c_l155_c38_155e_return_output;

     -- BIN_OP_PLUS[uxn_c_l152_c22_375e] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l152_c22_375e_left <= VAR_BIN_OP_PLUS_uxn_c_l152_c22_375e_left;
     BIN_OP_PLUS_uxn_c_l152_c22_375e_right <= VAR_BIN_OP_PLUS_uxn_c_l152_c22_375e_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l152_c22_375e_return_output := BIN_OP_PLUS_uxn_c_l152_c22_375e_return_output;

     -- BIN_OP_EQ[uxn_c_l151_c18_2077] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l151_c18_2077_left <= VAR_BIN_OP_EQ_uxn_c_l151_c18_2077_left;
     BIN_OP_EQ_uxn_c_l151_c18_2077_right <= VAR_BIN_OP_EQ_uxn_c_l151_c18_2077_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l151_c18_2077_return_output := BIN_OP_EQ_uxn_c_l151_c18_2077_return_output;

     -- UNARY_OP_NOT_uint1_t_uxn_c_l162_l169_DUPLICATE_40b1 LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uint1_t_uxn_c_l162_l169_DUPLICATE_40b1_expr <= VAR_UNARY_OP_NOT_uint1_t_uxn_c_l162_l169_DUPLICATE_40b1_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uint1_t_uxn_c_l162_l169_DUPLICATE_40b1_return_output := UNARY_OP_NOT_uint1_t_uxn_c_l162_l169_DUPLICATE_40b1_return_output;

     -- Submodule level 7
     VAR_BIN_OP_OR_uxn_c_l169_c3_da79_left := VAR_BIN_OP_AND_uxn_c_l156_c19_0e6b_return_output;
     VAR_MUX_uxn_c_l168_c3_64e6_cond := VAR_BIN_OP_AND_uxn_c_l156_c19_0e6b_return_output;
     REG_VAR_is_fill_pixel1 := VAR_BIN_OP_AND_uxn_c_l156_c19_0e6b_return_output;
     VAR_MUX_uxn_c_l151_c18_6d57_cond := VAR_BIN_OP_EQ_uxn_c_l151_c18_2077_return_output;
     VAR_fill_pixels_remaining_MUX_uxn_c_l130_c2_e932_iftrue := VAR_BIN_OP_INFERRED_MULT_uxn_c_l143_c28_5206_return_output;
     VAR_MUX_uxn_c_l152_c6_f23a_iftrue := resize(VAR_BIN_OP_PLUS_uxn_c_l152_c22_375e_return_output, 16);
     VAR_MUX_uxn_c_l153_c6_600d_iffalse := resize(VAR_BIN_OP_PLUS_uxn_c_l153_c31_fd1d_return_output, 16);
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l149_c45_eda1_left := VAR_CAST_TO_uint32_t_uxn_c_l149_c45_c50c_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l149_c45_6d9c_right := VAR_CAST_TO_uint32_t_uxn_c_l149_c81_ecd8_return_output;
     VAR_BIN_OP_AND_uxn_c_l155_c19_710f_right := VAR_UNARY_OP_NOT_uxn_c_l155_c38_155e_return_output;
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l169_l162_DUPLICATE_0d92_left := VAR_UNARY_OP_NOT_uint1_t_uxn_c_l162_l169_DUPLICATE_40b1_return_output;
     -- MUX[uxn_c_l168_c3_64e6] LATENCY=0
     -- Inputs
     MUX_uxn_c_l168_c3_64e6_cond <= VAR_MUX_uxn_c_l168_c3_64e6_cond;
     MUX_uxn_c_l168_c3_64e6_iftrue <= VAR_MUX_uxn_c_l168_c3_64e6_iftrue;
     MUX_uxn_c_l168_c3_64e6_iffalse <= VAR_MUX_uxn_c_l168_c3_64e6_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l168_c3_64e6_return_output := MUX_uxn_c_l168_c3_64e6_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_c_l149_c45_eda1] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_c_l149_c45_eda1_left <= VAR_BIN_OP_INFERRED_MULT_uxn_c_l149_c45_eda1_left;
     BIN_OP_INFERRED_MULT_uxn_c_l149_c45_eda1_right <= VAR_BIN_OP_INFERRED_MULT_uxn_c_l149_c45_eda1_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l149_c45_eda1_return_output := BIN_OP_INFERRED_MULT_uxn_c_l149_c45_eda1_return_output;

     -- fill_pixels_remaining_MUX[uxn_c_l130_c2_e932] LATENCY=0
     -- Inputs
     fill_pixels_remaining_MUX_uxn_c_l130_c2_e932_cond <= VAR_fill_pixels_remaining_MUX_uxn_c_l130_c2_e932_cond;
     fill_pixels_remaining_MUX_uxn_c_l130_c2_e932_iftrue <= VAR_fill_pixels_remaining_MUX_uxn_c_l130_c2_e932_iftrue;
     fill_pixels_remaining_MUX_uxn_c_l130_c2_e932_iffalse <= VAR_fill_pixels_remaining_MUX_uxn_c_l130_c2_e932_iffalse;
     -- Outputs
     VAR_fill_pixels_remaining_MUX_uxn_c_l130_c2_e932_return_output := fill_pixels_remaining_MUX_uxn_c_l130_c2_e932_return_output;

     -- BIN_OP_AND_uint1_t_uint1_t_uxn_c_l169_l162_DUPLICATE_0d92 LATENCY=0
     -- Inputs
     BIN_OP_AND_uint1_t_uint1_t_uxn_c_l169_l162_DUPLICATE_0d92_left <= VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l169_l162_DUPLICATE_0d92_left;
     BIN_OP_AND_uint1_t_uint1_t_uxn_c_l169_l162_DUPLICATE_0d92_right <= VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l169_l162_DUPLICATE_0d92_right;
     -- Outputs
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l169_l162_DUPLICATE_0d92_return_output := BIN_OP_AND_uint1_t_uint1_t_uxn_c_l169_l162_DUPLICATE_0d92_return_output;

     -- BIN_OP_AND[uxn_c_l155_c19_710f] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l155_c19_710f_left <= VAR_BIN_OP_AND_uxn_c_l155_c19_710f_left;
     BIN_OP_AND_uxn_c_l155_c19_710f_right <= VAR_BIN_OP_AND_uxn_c_l155_c19_710f_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l155_c19_710f_return_output := BIN_OP_AND_uxn_c_l155_c19_710f_return_output;

     -- MUX[uxn_c_l151_c18_6d57] LATENCY=0
     -- Inputs
     MUX_uxn_c_l151_c18_6d57_cond <= VAR_MUX_uxn_c_l151_c18_6d57_cond;
     MUX_uxn_c_l151_c18_6d57_iftrue <= VAR_MUX_uxn_c_l151_c18_6d57_iftrue;
     MUX_uxn_c_l151_c18_6d57_iffalse <= VAR_MUX_uxn_c_l151_c18_6d57_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l151_c18_6d57_return_output := MUX_uxn_c_l151_c18_6d57_return_output;

     -- Submodule level 8
     VAR_BIN_OP_OR_uxn_c_l162_c3_4a05_left := VAR_BIN_OP_AND_uxn_c_l155_c19_710f_return_output;
     VAR_MUX_uxn_c_l161_c3_4142_cond := VAR_BIN_OP_AND_uxn_c_l155_c19_710f_return_output;
     REG_VAR_is_fill_pixel0 := VAR_BIN_OP_AND_uxn_c_l155_c19_710f_return_output;
     VAR_BIN_OP_AND_uxn_c_l162_c22_441c_left := VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l169_l162_DUPLICATE_0d92_return_output;
     VAR_BIN_OP_AND_uxn_c_l169_c22_05d3_left := VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l169_l162_DUPLICATE_0d92_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l149_c45_6d9c_left := VAR_BIN_OP_INFERRED_MULT_uxn_c_l149_c45_eda1_return_output;
     VAR_MUX_uxn_c_l152_c6_f23a_cond := VAR_MUX_uxn_c_l151_c18_6d57_return_output;
     VAR_MUX_uxn_c_l153_c6_600d_cond := VAR_MUX_uxn_c_l151_c18_6d57_return_output;
     REG_VAR_is_fill_left := VAR_MUX_uxn_c_l151_c18_6d57_return_output;
     VAR_fg_vram_update_uxn_c_l165_c19_66ea_write_value := VAR_MUX_uxn_c_l168_c3_64e6_return_output;
     VAR_BIN_OP_MINUS_uxn_c_l172_c43_b343_left := VAR_fill_pixels_remaining_MUX_uxn_c_l130_c2_e932_return_output;
     -- BIN_OP_PLUS[uxn_c_l149_c45_6d9c] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l149_c45_6d9c_left <= VAR_BIN_OP_PLUS_uxn_c_l149_c45_6d9c_left;
     BIN_OP_PLUS_uxn_c_l149_c45_6d9c_right <= VAR_BIN_OP_PLUS_uxn_c_l149_c45_6d9c_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l149_c45_6d9c_return_output := BIN_OP_PLUS_uxn_c_l149_c45_6d9c_return_output;

     -- MUX[uxn_c_l161_c3_4142] LATENCY=0
     -- Inputs
     MUX_uxn_c_l161_c3_4142_cond <= VAR_MUX_uxn_c_l161_c3_4142_cond;
     MUX_uxn_c_l161_c3_4142_iftrue <= VAR_MUX_uxn_c_l161_c3_4142_iftrue;
     MUX_uxn_c_l161_c3_4142_iffalse <= VAR_MUX_uxn_c_l161_c3_4142_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l161_c3_4142_return_output := MUX_uxn_c_l161_c3_4142_return_output;

     -- MUX[uxn_c_l153_c6_600d] LATENCY=0
     -- Inputs
     MUX_uxn_c_l153_c6_600d_cond <= VAR_MUX_uxn_c_l153_c6_600d_cond;
     MUX_uxn_c_l153_c6_600d_iftrue <= VAR_MUX_uxn_c_l153_c6_600d_iftrue;
     MUX_uxn_c_l153_c6_600d_iffalse <= VAR_MUX_uxn_c_l153_c6_600d_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l153_c6_600d_return_output := MUX_uxn_c_l153_c6_600d_return_output;

     -- BIN_OP_MINUS[uxn_c_l172_c43_b343] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l172_c43_b343_left <= VAR_BIN_OP_MINUS_uxn_c_l172_c43_b343_left;
     BIN_OP_MINUS_uxn_c_l172_c43_b343_right <= VAR_BIN_OP_MINUS_uxn_c_l172_c43_b343_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l172_c43_b343_return_output := BIN_OP_MINUS_uxn_c_l172_c43_b343_return_output;

     -- MUX[uxn_c_l152_c6_f23a] LATENCY=0
     -- Inputs
     MUX_uxn_c_l152_c6_f23a_cond <= VAR_MUX_uxn_c_l152_c6_f23a_cond;
     MUX_uxn_c_l152_c6_f23a_iftrue <= VAR_MUX_uxn_c_l152_c6_f23a_iftrue;
     MUX_uxn_c_l152_c6_f23a_iffalse <= VAR_MUX_uxn_c_l152_c6_f23a_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l152_c6_f23a_return_output := MUX_uxn_c_l152_c6_f23a_return_output;

     -- BIN_OP_AND[uxn_c_l169_c22_05d3] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l169_c22_05d3_left <= VAR_BIN_OP_AND_uxn_c_l169_c22_05d3_left;
     BIN_OP_AND_uxn_c_l169_c22_05d3_right <= VAR_BIN_OP_AND_uxn_c_l169_c22_05d3_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l169_c22_05d3_return_output := BIN_OP_AND_uxn_c_l169_c22_05d3_return_output;

     -- BIN_OP_AND[uxn_c_l162_c22_441c] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l162_c22_441c_left <= VAR_BIN_OP_AND_uxn_c_l162_c22_441c_left;
     BIN_OP_AND_uxn_c_l162_c22_441c_right <= VAR_BIN_OP_AND_uxn_c_l162_c22_441c_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l162_c22_441c_return_output := BIN_OP_AND_uxn_c_l162_c22_441c_return_output;

     -- Submodule level 9
     VAR_BIN_OP_OR_uxn_c_l162_c3_4a05_right := VAR_BIN_OP_AND_uxn_c_l162_c22_441c_return_output;
     VAR_BIN_OP_OR_uxn_c_l169_c3_da79_right := VAR_BIN_OP_AND_uxn_c_l169_c22_05d3_return_output;
     VAR_MUX_uxn_c_l172_c26_351b_iftrue := VAR_BIN_OP_MINUS_uxn_c_l172_c43_b343_return_output;
     VAR_MUX_uxn_c_l149_c26_e213_iftrue := resize(VAR_BIN_OP_PLUS_uxn_c_l149_c45_6d9c_return_output, 32);
     REG_VAR_y := VAR_MUX_uxn_c_l152_c6_f23a_return_output;
     REG_VAR_x := VAR_MUX_uxn_c_l153_c6_600d_return_output;
     VAR_bg_vram_update_uxn_c_l158_c19_e875_write_value := VAR_MUX_uxn_c_l161_c3_4142_return_output;
     -- BIN_OP_OR[uxn_c_l169_c3_da79] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l169_c3_da79_left <= VAR_BIN_OP_OR_uxn_c_l169_c3_da79_left;
     BIN_OP_OR_uxn_c_l169_c3_da79_right <= VAR_BIN_OP_OR_uxn_c_l169_c3_da79_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l169_c3_da79_return_output := BIN_OP_OR_uxn_c_l169_c3_da79_return_output;

     -- MUX[uxn_c_l172_c26_351b] LATENCY=0
     -- Inputs
     MUX_uxn_c_l172_c26_351b_cond <= VAR_MUX_uxn_c_l172_c26_351b_cond;
     MUX_uxn_c_l172_c26_351b_iftrue <= VAR_MUX_uxn_c_l172_c26_351b_iftrue;
     MUX_uxn_c_l172_c26_351b_iffalse <= VAR_MUX_uxn_c_l172_c26_351b_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l172_c26_351b_return_output := MUX_uxn_c_l172_c26_351b_return_output;

     -- BIN_OP_OR[uxn_c_l162_c3_4a05] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l162_c3_4a05_left <= VAR_BIN_OP_OR_uxn_c_l162_c3_4a05_left;
     BIN_OP_OR_uxn_c_l162_c3_4a05_right <= VAR_BIN_OP_OR_uxn_c_l162_c3_4a05_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l162_c3_4a05_return_output := BIN_OP_OR_uxn_c_l162_c3_4a05_return_output;

     -- MUX[uxn_c_l149_c26_e213] LATENCY=0
     -- Inputs
     MUX_uxn_c_l149_c26_e213_cond <= VAR_MUX_uxn_c_l149_c26_e213_cond;
     MUX_uxn_c_l149_c26_e213_iftrue <= VAR_MUX_uxn_c_l149_c26_e213_iftrue;
     MUX_uxn_c_l149_c26_e213_iffalse <= VAR_MUX_uxn_c_l149_c26_e213_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l149_c26_e213_return_output := MUX_uxn_c_l149_c26_e213_return_output;

     -- Submodule level 10
     VAR_bg_vram_update_uxn_c_l158_c19_e875_write_enable := VAR_BIN_OP_OR_uxn_c_l162_c3_4a05_return_output;
     VAR_fg_vram_update_uxn_c_l165_c19_66ea_write_enable := VAR_BIN_OP_OR_uxn_c_l169_c3_da79_return_output;
     REG_VAR_adjusted_vram_address := VAR_MUX_uxn_c_l149_c26_e213_return_output;
     VAR_bg_vram_update_uxn_c_l158_c19_e875_write_address := VAR_MUX_uxn_c_l149_c26_e213_return_output;
     VAR_fg_vram_update_uxn_c_l165_c19_66ea_write_address := VAR_MUX_uxn_c_l149_c26_e213_return_output;
     VAR_BIN_OP_EQ_uxn_c_l173_c19_1300_left := VAR_MUX_uxn_c_l172_c26_351b_return_output;
     REG_VAR_fill_pixels_remaining := VAR_MUX_uxn_c_l172_c26_351b_return_output;
     -- BIN_OP_EQ[uxn_c_l173_c19_1300] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l173_c19_1300_left <= VAR_BIN_OP_EQ_uxn_c_l173_c19_1300_left;
     BIN_OP_EQ_uxn_c_l173_c19_1300_right <= VAR_BIN_OP_EQ_uxn_c_l173_c19_1300_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l173_c19_1300_return_output := BIN_OP_EQ_uxn_c_l173_c19_1300_return_output;

     -- bg_vram_update[uxn_c_l158_c19_e875] LATENCY=0
     -- Clock enable
     bg_vram_update_uxn_c_l158_c19_e875_CLOCK_ENABLE <= VAR_bg_vram_update_uxn_c_l158_c19_e875_CLOCK_ENABLE;
     -- Inputs
     bg_vram_update_uxn_c_l158_c19_e875_read_address <= VAR_bg_vram_update_uxn_c_l158_c19_e875_read_address;
     bg_vram_update_uxn_c_l158_c19_e875_write_address <= VAR_bg_vram_update_uxn_c_l158_c19_e875_write_address;
     bg_vram_update_uxn_c_l158_c19_e875_write_value <= VAR_bg_vram_update_uxn_c_l158_c19_e875_write_value;
     bg_vram_update_uxn_c_l158_c19_e875_write_enable <= VAR_bg_vram_update_uxn_c_l158_c19_e875_write_enable;
     -- Outputs
     VAR_bg_vram_update_uxn_c_l158_c19_e875_return_output := bg_vram_update_uxn_c_l158_c19_e875_return_output;

     -- fg_vram_update[uxn_c_l165_c19_66ea] LATENCY=0
     -- Clock enable
     fg_vram_update_uxn_c_l165_c19_66ea_CLOCK_ENABLE <= VAR_fg_vram_update_uxn_c_l165_c19_66ea_CLOCK_ENABLE;
     -- Inputs
     fg_vram_update_uxn_c_l165_c19_66ea_read_address <= VAR_fg_vram_update_uxn_c_l165_c19_66ea_read_address;
     fg_vram_update_uxn_c_l165_c19_66ea_write_address <= VAR_fg_vram_update_uxn_c_l165_c19_66ea_write_address;
     fg_vram_update_uxn_c_l165_c19_66ea_write_value <= VAR_fg_vram_update_uxn_c_l165_c19_66ea_write_value;
     fg_vram_update_uxn_c_l165_c19_66ea_write_enable <= VAR_fg_vram_update_uxn_c_l165_c19_66ea_write_enable;
     -- Outputs
     VAR_fg_vram_update_uxn_c_l165_c19_66ea_return_output := fg_vram_update_uxn_c_l165_c19_66ea_return_output;

     -- Submodule level 11
     VAR_MUX_uxn_c_l173_c19_3bbe_cond := VAR_BIN_OP_EQ_uxn_c_l173_c19_1300_return_output;
     VAR_MUX_uxn_c_l176_c17_edad_iftrue := VAR_bg_vram_update_uxn_c_l158_c19_e875_return_output;
     REG_VAR_bg_pixel_color := VAR_bg_vram_update_uxn_c_l158_c19_e875_return_output;
     VAR_BIN_OP_EQ_uxn_c_l176_c17_8c68_left := VAR_fg_vram_update_uxn_c_l165_c19_66ea_return_output;
     VAR_MUX_uxn_c_l176_c17_edad_iffalse := VAR_fg_vram_update_uxn_c_l165_c19_66ea_return_output;
     REG_VAR_fg_pixel_color := VAR_fg_vram_update_uxn_c_l165_c19_66ea_return_output;
     -- BIN_OP_EQ[uxn_c_l176_c17_8c68] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l176_c17_8c68_left <= VAR_BIN_OP_EQ_uxn_c_l176_c17_8c68_left;
     BIN_OP_EQ_uxn_c_l176_c17_8c68_right <= VAR_BIN_OP_EQ_uxn_c_l176_c17_8c68_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l176_c17_8c68_return_output := BIN_OP_EQ_uxn_c_l176_c17_8c68_return_output;

     -- MUX[uxn_c_l173_c19_3bbe] LATENCY=0
     -- Inputs
     MUX_uxn_c_l173_c19_3bbe_cond <= VAR_MUX_uxn_c_l173_c19_3bbe_cond;
     MUX_uxn_c_l173_c19_3bbe_iftrue <= VAR_MUX_uxn_c_l173_c19_3bbe_iftrue;
     MUX_uxn_c_l173_c19_3bbe_iffalse <= VAR_MUX_uxn_c_l173_c19_3bbe_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l173_c19_3bbe_return_output := MUX_uxn_c_l173_c19_3bbe_return_output;

     -- Submodule level 12
     VAR_MUX_uxn_c_l176_c17_edad_cond := VAR_BIN_OP_EQ_uxn_c_l176_c17_8c68_return_output;
     REG_VAR_is_fill_active := VAR_MUX_uxn_c_l173_c19_3bbe_return_output;
     -- MUX[uxn_c_l176_c17_edad] LATENCY=0
     -- Inputs
     MUX_uxn_c_l176_c17_edad_cond <= VAR_MUX_uxn_c_l176_c17_edad_cond;
     MUX_uxn_c_l176_c17_edad_iftrue <= VAR_MUX_uxn_c_l176_c17_edad_iftrue;
     MUX_uxn_c_l176_c17_edad_iffalse <= VAR_MUX_uxn_c_l176_c17_edad_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l176_c17_edad_return_output := MUX_uxn_c_l176_c17_edad_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_269d_uxn_c_l111_l179_DUPLICATE_a4f1 LATENCY=0
     VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_269d_uxn_c_l111_l179_DUPLICATE_a4f1_return_output := CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_269d(
     VAR_MUX_uxn_c_l175_c25_9aa4_return_output,
     VAR_MUX_uxn_c_l176_c17_edad_return_output,
     VAR_MUX_uxn_c_l173_c19_3bbe_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_269d_uxn_c_l111_l179_DUPLICATE_a4f1_return_output;
     VAR_return_output := VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_269d_uxn_c_l111_l179_DUPLICATE_a4f1_return_output;
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
