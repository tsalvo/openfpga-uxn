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
-- Submodules: 63
entity step_gpu_0CLK_6d83165a is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 is_active_drawing_area : in unsigned(0 downto 0);
 is_vram_write : in unsigned(0 downto 0);
 vram_write_layer : in unsigned(0 downto 0);
 vram_address : in unsigned(15 downto 0);
 vram_value : in unsigned(7 downto 0);
 return_output : out gpu_step_result_t);
end step_gpu_0CLK_6d83165a;
architecture arch of step_gpu_0CLK_6d83165a is
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
signal fill_x0 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal fill_y0 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal fill_x1 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal fill_y1 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal fill_color : unsigned(1 downto 0) := to_unsigned(0, 2);
signal is_new_fill_row : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_last_fill_col : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_fill_active : unsigned(0 downto 0) := to_unsigned(0, 1);
signal fill_layer : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_fill_top : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_fill_left : unsigned(0 downto 0) := to_unsigned(0, 1);
signal pixel_counter : unsigned(15 downto 0) := to_unsigned(0, 16);
signal x : unsigned(15 downto 0) := to_unsigned(0, 16);
signal y : unsigned(15 downto 0) := to_unsigned(0, 16);
signal REG_COMB_result : gpu_step_result_t;
signal REG_COMB_fill_x0 : unsigned(15 downto 0);
signal REG_COMB_fill_y0 : unsigned(15 downto 0);
signal REG_COMB_fill_x1 : unsigned(15 downto 0);
signal REG_COMB_fill_y1 : unsigned(15 downto 0);
signal REG_COMB_fill_color : unsigned(1 downto 0);
signal REG_COMB_is_new_fill_row : unsigned(0 downto 0);
signal REG_COMB_is_last_fill_col : unsigned(0 downto 0);
signal REG_COMB_is_fill_active : unsigned(0 downto 0);
signal REG_COMB_fill_layer : unsigned(0 downto 0);
signal REG_COMB_is_fill_top : unsigned(0 downto 0);
signal REG_COMB_is_fill_left : unsigned(0 downto 0);
signal REG_COMB_pixel_counter : unsigned(15 downto 0);
signal REG_COMB_x : unsigned(15 downto 0);
signal REG_COMB_y : unsigned(15 downto 0);

-- Each function instance gets signals
-- CONST_SR_4[uxn_c_l126_c52_f3f4]
signal CONST_SR_4_uxn_c_l126_c52_f3f4_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_c_l126_c52_f3f4_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_c_l126_c25_3809]
signal BIN_OP_AND_uxn_c_l126_c25_3809_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l126_c25_3809_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l126_c25_3809_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_c_l129_c22_44e6]
signal UNARY_OP_NOT_uxn_c_l129_c22_44e6_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l129_c22_44e6_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l129_c6_fc94]
signal BIN_OP_AND_uxn_c_l129_c6_fc94_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l129_c6_fc94_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l129_c6_fc94_return_output : unsigned(0 downto 0);

-- is_fill_active_MUX[uxn_c_l129_c2_226b]
signal is_fill_active_MUX_uxn_c_l129_c2_226b_cond : unsigned(0 downto 0);
signal is_fill_active_MUX_uxn_c_l129_c2_226b_iftrue : unsigned(0 downto 0);
signal is_fill_active_MUX_uxn_c_l129_c2_226b_iffalse : unsigned(0 downto 0);
signal is_fill_active_MUX_uxn_c_l129_c2_226b_return_output : unsigned(0 downto 0);

-- fill_y0_MUX[uxn_c_l129_c2_226b]
signal fill_y0_MUX_uxn_c_l129_c2_226b_cond : unsigned(0 downto 0);
signal fill_y0_MUX_uxn_c_l129_c2_226b_iftrue : unsigned(15 downto 0);
signal fill_y0_MUX_uxn_c_l129_c2_226b_iffalse : unsigned(15 downto 0);
signal fill_y0_MUX_uxn_c_l129_c2_226b_return_output : unsigned(15 downto 0);

-- is_fill_left_MUX[uxn_c_l129_c2_226b]
signal is_fill_left_MUX_uxn_c_l129_c2_226b_cond : unsigned(0 downto 0);
signal is_fill_left_MUX_uxn_c_l129_c2_226b_iftrue : unsigned(0 downto 0);
signal is_fill_left_MUX_uxn_c_l129_c2_226b_iffalse : unsigned(0 downto 0);
signal is_fill_left_MUX_uxn_c_l129_c2_226b_return_output : unsigned(0 downto 0);

-- fill_color_MUX[uxn_c_l129_c2_226b]
signal fill_color_MUX_uxn_c_l129_c2_226b_cond : unsigned(0 downto 0);
signal fill_color_MUX_uxn_c_l129_c2_226b_iftrue : unsigned(1 downto 0);
signal fill_color_MUX_uxn_c_l129_c2_226b_iffalse : unsigned(1 downto 0);
signal fill_color_MUX_uxn_c_l129_c2_226b_return_output : unsigned(1 downto 0);

-- fill_layer_MUX[uxn_c_l129_c2_226b]
signal fill_layer_MUX_uxn_c_l129_c2_226b_cond : unsigned(0 downto 0);
signal fill_layer_MUX_uxn_c_l129_c2_226b_iftrue : unsigned(0 downto 0);
signal fill_layer_MUX_uxn_c_l129_c2_226b_iffalse : unsigned(0 downto 0);
signal fill_layer_MUX_uxn_c_l129_c2_226b_return_output : unsigned(0 downto 0);

-- fill_y1_MUX[uxn_c_l129_c2_226b]
signal fill_y1_MUX_uxn_c_l129_c2_226b_cond : unsigned(0 downto 0);
signal fill_y1_MUX_uxn_c_l129_c2_226b_iftrue : unsigned(15 downto 0);
signal fill_y1_MUX_uxn_c_l129_c2_226b_iffalse : unsigned(15 downto 0);
signal fill_y1_MUX_uxn_c_l129_c2_226b_return_output : unsigned(15 downto 0);

-- y_MUX[uxn_c_l129_c2_226b]
signal y_MUX_uxn_c_l129_c2_226b_cond : unsigned(0 downto 0);
signal y_MUX_uxn_c_l129_c2_226b_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_c_l129_c2_226b_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_c_l129_c2_226b_return_output : unsigned(15 downto 0);

-- fill_x0_MUX[uxn_c_l129_c2_226b]
signal fill_x0_MUX_uxn_c_l129_c2_226b_cond : unsigned(0 downto 0);
signal fill_x0_MUX_uxn_c_l129_c2_226b_iftrue : unsigned(15 downto 0);
signal fill_x0_MUX_uxn_c_l129_c2_226b_iffalse : unsigned(15 downto 0);
signal fill_x0_MUX_uxn_c_l129_c2_226b_return_output : unsigned(15 downto 0);

-- fill_x1_MUX[uxn_c_l129_c2_226b]
signal fill_x1_MUX_uxn_c_l129_c2_226b_cond : unsigned(0 downto 0);
signal fill_x1_MUX_uxn_c_l129_c2_226b_iftrue : unsigned(15 downto 0);
signal fill_x1_MUX_uxn_c_l129_c2_226b_iffalse : unsigned(15 downto 0);
signal fill_x1_MUX_uxn_c_l129_c2_226b_return_output : unsigned(15 downto 0);

-- is_fill_top_MUX[uxn_c_l129_c2_226b]
signal is_fill_top_MUX_uxn_c_l129_c2_226b_cond : unsigned(0 downto 0);
signal is_fill_top_MUX_uxn_c_l129_c2_226b_iftrue : unsigned(0 downto 0);
signal is_fill_top_MUX_uxn_c_l129_c2_226b_iffalse : unsigned(0 downto 0);
signal is_fill_top_MUX_uxn_c_l129_c2_226b_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_c_l129_c2_226b]
signal x_MUX_uxn_c_l129_c2_226b_cond : unsigned(0 downto 0);
signal x_MUX_uxn_c_l129_c2_226b_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_c_l129_c2_226b_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_c_l129_c2_226b_return_output : unsigned(15 downto 0);

-- CONST_SR_2[uxn_c_l131_c20_dbf1]
signal CONST_SR_2_uxn_c_l131_c20_dbf1_x : unsigned(7 downto 0);
signal CONST_SR_2_uxn_c_l131_c20_dbf1_return_output : unsigned(7 downto 0);

-- CONST_SR_3[uxn_c_l132_c18_48d6]
signal CONST_SR_3_uxn_c_l132_c18_48d6_x : unsigned(7 downto 0);
signal CONST_SR_3_uxn_c_l132_c18_48d6_return_output : unsigned(7 downto 0);

-- MUX[uxn_c_l133_c13_7d82]
signal MUX_uxn_c_l133_c13_7d82_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l133_c13_7d82_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l133_c13_7d82_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l133_c13_7d82_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_c_l134_c28_d4ae]
signal BIN_OP_AND_uxn_c_l134_c28_d4ae_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l134_c28_d4ae_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l134_c28_d4ae_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l134_c13_72b2]
signal MUX_uxn_c_l134_c13_72b2_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l134_c13_72b2_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l134_c13_72b2_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l134_c13_72b2_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l135_c13_9fce]
signal MUX_uxn_c_l135_c13_9fce_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l135_c13_9fce_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l135_c13_9fce_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l135_c13_9fce_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_c_l136_c32_1850]
signal BIN_OP_AND_uxn_c_l136_c32_1850_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l136_c32_1850_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l136_c32_1850_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l136_c13_5559]
signal MUX_uxn_c_l136_c13_5559_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l136_c13_5559_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l136_c13_5559_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l136_c13_5559_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_c_l146_c54_33d8]
signal CONST_SL_8_uxn_c_l146_c54_33d8_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_c_l146_c54_33d8_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_c_l146_c54_77f5]
signal BIN_OP_PLUS_uxn_c_l146_c54_77f5_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l146_c54_77f5_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l146_c54_77f5_return_output : unsigned(16 downto 0);

-- MUX[uxn_c_l146_c35_8062]
signal MUX_uxn_c_l146_c35_8062_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l146_c35_8062_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l146_c35_8062_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l146_c35_8062_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l148_c21_daa2]
signal BIN_OP_EQ_uxn_c_l148_c21_daa2_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l148_c21_daa2_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l148_c21_daa2_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l148_c21_1804]
signal MUX_uxn_c_l148_c21_1804_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l148_c21_1804_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l148_c21_1804_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l148_c21_1804_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l149_c22_5bbb]
signal BIN_OP_EQ_uxn_c_l149_c22_5bbb_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l149_c22_5bbb_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l149_c22_5bbb_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l149_c22_b936]
signal MUX_uxn_c_l149_c22_b936_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l149_c22_b936_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l149_c22_b936_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l149_c22_b936_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l150_c25_8d31]
signal BIN_OP_PLUS_uxn_c_l150_c25_8d31_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l150_c25_8d31_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l150_c25_8d31_return_output : unsigned(16 downto 0);

-- MUX[uxn_c_l150_c6_ca2e]
signal MUX_uxn_c_l150_c6_ca2e_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l150_c6_ca2e_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l150_c6_ca2e_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l150_c6_ca2e_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_c_l151_c34_c0fc]
signal BIN_OP_PLUS_uxn_c_l151_c34_c0fc_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l151_c34_c0fc_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l151_c34_c0fc_return_output : unsigned(16 downto 0);

-- MUX[uxn_c_l151_c6_c4dc]
signal MUX_uxn_c_l151_c6_c4dc_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l151_c6_c4dc_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l151_c6_c4dc_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l151_c6_c4dc_return_output : unsigned(15 downto 0);

-- UNARY_OP_NOT[uxn_c_l153_c46_7808]
signal UNARY_OP_NOT_uxn_c_l153_c46_7808_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l153_c46_7808_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l153_c27_c008]
signal BIN_OP_AND_uxn_c_l153_c27_c008_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l153_c27_c008_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l153_c27_c008_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l154_c27_4bd4]
signal BIN_OP_AND_uxn_c_l154_c27_4bd4_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l154_c27_4bd4_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l154_c27_4bd4_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l159_c3_cedd]
signal MUX_uxn_c_l159_c3_cedd_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l159_c3_cedd_iftrue : unsigned(1 downto 0);
signal MUX_uxn_c_l159_c3_cedd_iffalse : unsigned(1 downto 0);
signal MUX_uxn_c_l159_c3_cedd_return_output : unsigned(1 downto 0);

-- UNARY_OP_NOT[uxn_c_l160_c57_f1ec]
signal UNARY_OP_NOT_uxn_c_l160_c57_f1ec_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l160_c57_f1ec_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l160_c22_4b60]
signal BIN_OP_AND_uxn_c_l160_c22_4b60_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l160_c22_4b60_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l160_c22_4b60_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_c_l160_c3_1f64]
signal BIN_OP_OR_uxn_c_l160_c3_1f64_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l160_c3_1f64_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l160_c3_1f64_return_output : unsigned(0 downto 0);

-- bg_vram_update[uxn_c_l156_c27_8950]
signal bg_vram_update_uxn_c_l156_c27_8950_CLOCK_ENABLE : unsigned(0 downto 0);
signal bg_vram_update_uxn_c_l156_c27_8950_read_address : unsigned(15 downto 0);
signal bg_vram_update_uxn_c_l156_c27_8950_write_address : unsigned(15 downto 0);
signal bg_vram_update_uxn_c_l156_c27_8950_write_value : unsigned(1 downto 0);
signal bg_vram_update_uxn_c_l156_c27_8950_write_enable : unsigned(0 downto 0);
signal bg_vram_update_uxn_c_l156_c27_8950_return_output : unsigned(1 downto 0);

-- MUX[uxn_c_l166_c3_c07d]
signal MUX_uxn_c_l166_c3_c07d_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l166_c3_c07d_iftrue : unsigned(1 downto 0);
signal MUX_uxn_c_l166_c3_c07d_iffalse : unsigned(1 downto 0);
signal MUX_uxn_c_l166_c3_c07d_return_output : unsigned(1 downto 0);

-- BIN_OP_AND[uxn_c_l167_c22_c15f]
signal BIN_OP_AND_uxn_c_l167_c22_c15f_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l167_c22_c15f_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l167_c22_c15f_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_c_l167_c3_4a43]
signal BIN_OP_OR_uxn_c_l167_c3_4a43_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l167_c3_4a43_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l167_c3_4a43_return_output : unsigned(0 downto 0);

-- fg_vram_update[uxn_c_l163_c27_ba53]
signal fg_vram_update_uxn_c_l163_c27_ba53_CLOCK_ENABLE : unsigned(0 downto 0);
signal fg_vram_update_uxn_c_l163_c27_ba53_read_address : unsigned(15 downto 0);
signal fg_vram_update_uxn_c_l163_c27_ba53_write_address : unsigned(15 downto 0);
signal fg_vram_update_uxn_c_l163_c27_ba53_write_value : unsigned(1 downto 0);
signal fg_vram_update_uxn_c_l163_c27_ba53_write_enable : unsigned(0 downto 0);
signal fg_vram_update_uxn_c_l163_c27_ba53_return_output : unsigned(1 downto 0);

-- BIN_OP_AND[uxn_c_l170_c38_df52]
signal BIN_OP_AND_uxn_c_l170_c38_df52_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l170_c38_df52_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l170_c38_df52_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_c_l170_c38_08b2]
signal UNARY_OP_NOT_uxn_c_l170_c38_08b2_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l170_c38_08b2_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l170_c19_0341]
signal MUX_uxn_c_l170_c19_0341_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l170_c19_0341_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l170_c19_0341_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l170_c19_0341_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l171_c19_a940]
signal BIN_OP_EQ_uxn_c_l171_c19_a940_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l171_c19_a940_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l171_c19_a940_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l171_c76_09e6]
signal BIN_OP_PLUS_uxn_c_l171_c76_09e6_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l171_c76_09e6_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l171_c76_09e6_return_output : unsigned(16 downto 0);

-- MUX[uxn_c_l171_c50_108c]
signal MUX_uxn_c_l171_c50_108c_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l171_c50_108c_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l171_c50_108c_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l171_c50_108c_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l171_c19_6c9e]
signal MUX_uxn_c_l171_c19_6c9e_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l171_c19_6c9e_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l171_c19_6c9e_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l171_c19_6c9e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l172_c25_718a]
signal BIN_OP_EQ_uxn_c_l172_c25_718a_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l172_c25_718a_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l172_c25_718a_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l172_c25_904d]
signal MUX_uxn_c_l172_c25_904d_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l172_c25_904d_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l172_c25_904d_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l172_c25_904d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l173_c17_5770]
signal BIN_OP_EQ_uxn_c_l173_c17_5770_left : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l173_c17_5770_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l173_c17_5770_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l173_c17_d13c]
signal MUX_uxn_c_l173_c17_d13c_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l173_c17_d13c_iftrue : unsigned(1 downto 0);
signal MUX_uxn_c_l173_c17_d13c_iffalse : unsigned(1 downto 0);
signal MUX_uxn_c_l173_c17_d13c_return_output : unsigned(1 downto 0);

-- CONST_SR_8_uint16_t_uxn_c_l135_l133_DUPLICATE_195f
signal CONST_SR_8_uint16_t_uxn_c_l135_l133_DUPLICATE_195f_x : unsigned(15 downto 0);
signal CONST_SR_8_uint16_t_uxn_c_l135_l133_DUPLICATE_195f_return_output : unsigned(15 downto 0);

-- UNARY_OP_NOT_uint1_t_uxn_c_l160_l167_DUPLICATE_2cde
signal UNARY_OP_NOT_uint1_t_uxn_c_l160_l167_DUPLICATE_2cde_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uint1_t_uxn_c_l160_l167_DUPLICATE_2cde_return_output : unsigned(0 downto 0);

-- BIN_OP_AND_uint1_t_uint1_t_uxn_c_l160_l167_DUPLICATE_d99f
signal BIN_OP_AND_uint1_t_uint1_t_uxn_c_l160_l167_DUPLICATE_d99f_left : unsigned(0 downto 0);
signal BIN_OP_AND_uint1_t_uint1_t_uxn_c_l160_l167_DUPLICATE_d99f_right : unsigned(0 downto 0);
signal BIN_OP_AND_uint1_t_uint1_t_uxn_c_l160_l167_DUPLICATE_d99f_return_output : unsigned(0 downto 0);

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
-- CONST_SR_4_uxn_c_l126_c52_f3f4
CONST_SR_4_uxn_c_l126_c52_f3f4 : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_c_l126_c52_f3f4_x,
CONST_SR_4_uxn_c_l126_c52_f3f4_return_output);

-- BIN_OP_AND_uxn_c_l126_c25_3809
BIN_OP_AND_uxn_c_l126_c25_3809 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l126_c25_3809_left,
BIN_OP_AND_uxn_c_l126_c25_3809_right,
BIN_OP_AND_uxn_c_l126_c25_3809_return_output);

-- UNARY_OP_NOT_uxn_c_l129_c22_44e6
UNARY_OP_NOT_uxn_c_l129_c22_44e6 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l129_c22_44e6_expr,
UNARY_OP_NOT_uxn_c_l129_c22_44e6_return_output);

-- BIN_OP_AND_uxn_c_l129_c6_fc94
BIN_OP_AND_uxn_c_l129_c6_fc94 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l129_c6_fc94_left,
BIN_OP_AND_uxn_c_l129_c6_fc94_right,
BIN_OP_AND_uxn_c_l129_c6_fc94_return_output);

-- is_fill_active_MUX_uxn_c_l129_c2_226b
is_fill_active_MUX_uxn_c_l129_c2_226b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_active_MUX_uxn_c_l129_c2_226b_cond,
is_fill_active_MUX_uxn_c_l129_c2_226b_iftrue,
is_fill_active_MUX_uxn_c_l129_c2_226b_iffalse,
is_fill_active_MUX_uxn_c_l129_c2_226b_return_output);

-- fill_y0_MUX_uxn_c_l129_c2_226b
fill_y0_MUX_uxn_c_l129_c2_226b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_y0_MUX_uxn_c_l129_c2_226b_cond,
fill_y0_MUX_uxn_c_l129_c2_226b_iftrue,
fill_y0_MUX_uxn_c_l129_c2_226b_iffalse,
fill_y0_MUX_uxn_c_l129_c2_226b_return_output);

-- is_fill_left_MUX_uxn_c_l129_c2_226b
is_fill_left_MUX_uxn_c_l129_c2_226b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_left_MUX_uxn_c_l129_c2_226b_cond,
is_fill_left_MUX_uxn_c_l129_c2_226b_iftrue,
is_fill_left_MUX_uxn_c_l129_c2_226b_iffalse,
is_fill_left_MUX_uxn_c_l129_c2_226b_return_output);

-- fill_color_MUX_uxn_c_l129_c2_226b
fill_color_MUX_uxn_c_l129_c2_226b : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
fill_color_MUX_uxn_c_l129_c2_226b_cond,
fill_color_MUX_uxn_c_l129_c2_226b_iftrue,
fill_color_MUX_uxn_c_l129_c2_226b_iffalse,
fill_color_MUX_uxn_c_l129_c2_226b_return_output);

-- fill_layer_MUX_uxn_c_l129_c2_226b
fill_layer_MUX_uxn_c_l129_c2_226b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
fill_layer_MUX_uxn_c_l129_c2_226b_cond,
fill_layer_MUX_uxn_c_l129_c2_226b_iftrue,
fill_layer_MUX_uxn_c_l129_c2_226b_iffalse,
fill_layer_MUX_uxn_c_l129_c2_226b_return_output);

-- fill_y1_MUX_uxn_c_l129_c2_226b
fill_y1_MUX_uxn_c_l129_c2_226b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_y1_MUX_uxn_c_l129_c2_226b_cond,
fill_y1_MUX_uxn_c_l129_c2_226b_iftrue,
fill_y1_MUX_uxn_c_l129_c2_226b_iffalse,
fill_y1_MUX_uxn_c_l129_c2_226b_return_output);

-- y_MUX_uxn_c_l129_c2_226b
y_MUX_uxn_c_l129_c2_226b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_c_l129_c2_226b_cond,
y_MUX_uxn_c_l129_c2_226b_iftrue,
y_MUX_uxn_c_l129_c2_226b_iffalse,
y_MUX_uxn_c_l129_c2_226b_return_output);

-- fill_x0_MUX_uxn_c_l129_c2_226b
fill_x0_MUX_uxn_c_l129_c2_226b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_x0_MUX_uxn_c_l129_c2_226b_cond,
fill_x0_MUX_uxn_c_l129_c2_226b_iftrue,
fill_x0_MUX_uxn_c_l129_c2_226b_iffalse,
fill_x0_MUX_uxn_c_l129_c2_226b_return_output);

-- fill_x1_MUX_uxn_c_l129_c2_226b
fill_x1_MUX_uxn_c_l129_c2_226b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_x1_MUX_uxn_c_l129_c2_226b_cond,
fill_x1_MUX_uxn_c_l129_c2_226b_iftrue,
fill_x1_MUX_uxn_c_l129_c2_226b_iffalse,
fill_x1_MUX_uxn_c_l129_c2_226b_return_output);

-- is_fill_top_MUX_uxn_c_l129_c2_226b
is_fill_top_MUX_uxn_c_l129_c2_226b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_top_MUX_uxn_c_l129_c2_226b_cond,
is_fill_top_MUX_uxn_c_l129_c2_226b_iftrue,
is_fill_top_MUX_uxn_c_l129_c2_226b_iffalse,
is_fill_top_MUX_uxn_c_l129_c2_226b_return_output);

-- x_MUX_uxn_c_l129_c2_226b
x_MUX_uxn_c_l129_c2_226b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_c_l129_c2_226b_cond,
x_MUX_uxn_c_l129_c2_226b_iftrue,
x_MUX_uxn_c_l129_c2_226b_iffalse,
x_MUX_uxn_c_l129_c2_226b_return_output);

-- CONST_SR_2_uxn_c_l131_c20_dbf1
CONST_SR_2_uxn_c_l131_c20_dbf1 : entity work.CONST_SR_2_uint8_t_0CLK_de264c78 port map (
CONST_SR_2_uxn_c_l131_c20_dbf1_x,
CONST_SR_2_uxn_c_l131_c20_dbf1_return_output);

-- CONST_SR_3_uxn_c_l132_c18_48d6
CONST_SR_3_uxn_c_l132_c18_48d6 : entity work.CONST_SR_3_uint8_t_0CLK_de264c78 port map (
CONST_SR_3_uxn_c_l132_c18_48d6_x,
CONST_SR_3_uxn_c_l132_c18_48d6_return_output);

-- MUX_uxn_c_l133_c13_7d82
MUX_uxn_c_l133_c13_7d82 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l133_c13_7d82_cond,
MUX_uxn_c_l133_c13_7d82_iftrue,
MUX_uxn_c_l133_c13_7d82_iffalse,
MUX_uxn_c_l133_c13_7d82_return_output);

-- BIN_OP_AND_uxn_c_l134_c28_d4ae
BIN_OP_AND_uxn_c_l134_c28_d4ae : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l134_c28_d4ae_left,
BIN_OP_AND_uxn_c_l134_c28_d4ae_right,
BIN_OP_AND_uxn_c_l134_c28_d4ae_return_output);

-- MUX_uxn_c_l134_c13_72b2
MUX_uxn_c_l134_c13_72b2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l134_c13_72b2_cond,
MUX_uxn_c_l134_c13_72b2_iftrue,
MUX_uxn_c_l134_c13_72b2_iffalse,
MUX_uxn_c_l134_c13_72b2_return_output);

-- MUX_uxn_c_l135_c13_9fce
MUX_uxn_c_l135_c13_9fce : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l135_c13_9fce_cond,
MUX_uxn_c_l135_c13_9fce_iftrue,
MUX_uxn_c_l135_c13_9fce_iffalse,
MUX_uxn_c_l135_c13_9fce_return_output);

-- BIN_OP_AND_uxn_c_l136_c32_1850
BIN_OP_AND_uxn_c_l136_c32_1850 : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l136_c32_1850_left,
BIN_OP_AND_uxn_c_l136_c32_1850_right,
BIN_OP_AND_uxn_c_l136_c32_1850_return_output);

-- MUX_uxn_c_l136_c13_5559
MUX_uxn_c_l136_c13_5559 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l136_c13_5559_cond,
MUX_uxn_c_l136_c13_5559_iftrue,
MUX_uxn_c_l136_c13_5559_iffalse,
MUX_uxn_c_l136_c13_5559_return_output);

-- CONST_SL_8_uxn_c_l146_c54_33d8
CONST_SL_8_uxn_c_l146_c54_33d8 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l146_c54_33d8_x,
CONST_SL_8_uxn_c_l146_c54_33d8_return_output);

-- BIN_OP_PLUS_uxn_c_l146_c54_77f5
BIN_OP_PLUS_uxn_c_l146_c54_77f5 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l146_c54_77f5_left,
BIN_OP_PLUS_uxn_c_l146_c54_77f5_right,
BIN_OP_PLUS_uxn_c_l146_c54_77f5_return_output);

-- MUX_uxn_c_l146_c35_8062
MUX_uxn_c_l146_c35_8062 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l146_c35_8062_cond,
MUX_uxn_c_l146_c35_8062_iftrue,
MUX_uxn_c_l146_c35_8062_iffalse,
MUX_uxn_c_l146_c35_8062_return_output);

-- BIN_OP_EQ_uxn_c_l148_c21_daa2
BIN_OP_EQ_uxn_c_l148_c21_daa2 : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l148_c21_daa2_left,
BIN_OP_EQ_uxn_c_l148_c21_daa2_right,
BIN_OP_EQ_uxn_c_l148_c21_daa2_return_output);

-- MUX_uxn_c_l148_c21_1804
MUX_uxn_c_l148_c21_1804 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l148_c21_1804_cond,
MUX_uxn_c_l148_c21_1804_iftrue,
MUX_uxn_c_l148_c21_1804_iffalse,
MUX_uxn_c_l148_c21_1804_return_output);

-- BIN_OP_EQ_uxn_c_l149_c22_5bbb
BIN_OP_EQ_uxn_c_l149_c22_5bbb : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l149_c22_5bbb_left,
BIN_OP_EQ_uxn_c_l149_c22_5bbb_right,
BIN_OP_EQ_uxn_c_l149_c22_5bbb_return_output);

-- MUX_uxn_c_l149_c22_b936
MUX_uxn_c_l149_c22_b936 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l149_c22_b936_cond,
MUX_uxn_c_l149_c22_b936_iftrue,
MUX_uxn_c_l149_c22_b936_iffalse,
MUX_uxn_c_l149_c22_b936_return_output);

-- BIN_OP_PLUS_uxn_c_l150_c25_8d31
BIN_OP_PLUS_uxn_c_l150_c25_8d31 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l150_c25_8d31_left,
BIN_OP_PLUS_uxn_c_l150_c25_8d31_right,
BIN_OP_PLUS_uxn_c_l150_c25_8d31_return_output);

-- MUX_uxn_c_l150_c6_ca2e
MUX_uxn_c_l150_c6_ca2e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l150_c6_ca2e_cond,
MUX_uxn_c_l150_c6_ca2e_iftrue,
MUX_uxn_c_l150_c6_ca2e_iffalse,
MUX_uxn_c_l150_c6_ca2e_return_output);

-- BIN_OP_PLUS_uxn_c_l151_c34_c0fc
BIN_OP_PLUS_uxn_c_l151_c34_c0fc : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l151_c34_c0fc_left,
BIN_OP_PLUS_uxn_c_l151_c34_c0fc_right,
BIN_OP_PLUS_uxn_c_l151_c34_c0fc_return_output);

-- MUX_uxn_c_l151_c6_c4dc
MUX_uxn_c_l151_c6_c4dc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l151_c6_c4dc_cond,
MUX_uxn_c_l151_c6_c4dc_iftrue,
MUX_uxn_c_l151_c6_c4dc_iffalse,
MUX_uxn_c_l151_c6_c4dc_return_output);

-- UNARY_OP_NOT_uxn_c_l153_c46_7808
UNARY_OP_NOT_uxn_c_l153_c46_7808 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l153_c46_7808_expr,
UNARY_OP_NOT_uxn_c_l153_c46_7808_return_output);

-- BIN_OP_AND_uxn_c_l153_c27_c008
BIN_OP_AND_uxn_c_l153_c27_c008 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l153_c27_c008_left,
BIN_OP_AND_uxn_c_l153_c27_c008_right,
BIN_OP_AND_uxn_c_l153_c27_c008_return_output);

-- BIN_OP_AND_uxn_c_l154_c27_4bd4
BIN_OP_AND_uxn_c_l154_c27_4bd4 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l154_c27_4bd4_left,
BIN_OP_AND_uxn_c_l154_c27_4bd4_right,
BIN_OP_AND_uxn_c_l154_c27_4bd4_return_output);

-- MUX_uxn_c_l159_c3_cedd
MUX_uxn_c_l159_c3_cedd : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
MUX_uxn_c_l159_c3_cedd_cond,
MUX_uxn_c_l159_c3_cedd_iftrue,
MUX_uxn_c_l159_c3_cedd_iffalse,
MUX_uxn_c_l159_c3_cedd_return_output);

-- UNARY_OP_NOT_uxn_c_l160_c57_f1ec
UNARY_OP_NOT_uxn_c_l160_c57_f1ec : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l160_c57_f1ec_expr,
UNARY_OP_NOT_uxn_c_l160_c57_f1ec_return_output);

-- BIN_OP_AND_uxn_c_l160_c22_4b60
BIN_OP_AND_uxn_c_l160_c22_4b60 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l160_c22_4b60_left,
BIN_OP_AND_uxn_c_l160_c22_4b60_right,
BIN_OP_AND_uxn_c_l160_c22_4b60_return_output);

-- BIN_OP_OR_uxn_c_l160_c3_1f64
BIN_OP_OR_uxn_c_l160_c3_1f64 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l160_c3_1f64_left,
BIN_OP_OR_uxn_c_l160_c3_1f64_right,
BIN_OP_OR_uxn_c_l160_c3_1f64_return_output);

-- bg_vram_update_uxn_c_l156_c27_8950
bg_vram_update_uxn_c_l156_c27_8950 : entity work.bg_vram_update_0CLK_6f2c5aad port map (
clk,
bg_vram_update_uxn_c_l156_c27_8950_CLOCK_ENABLE,
bg_vram_update_uxn_c_l156_c27_8950_read_address,
bg_vram_update_uxn_c_l156_c27_8950_write_address,
bg_vram_update_uxn_c_l156_c27_8950_write_value,
bg_vram_update_uxn_c_l156_c27_8950_write_enable,
bg_vram_update_uxn_c_l156_c27_8950_return_output);

-- MUX_uxn_c_l166_c3_c07d
MUX_uxn_c_l166_c3_c07d : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
MUX_uxn_c_l166_c3_c07d_cond,
MUX_uxn_c_l166_c3_c07d_iftrue,
MUX_uxn_c_l166_c3_c07d_iffalse,
MUX_uxn_c_l166_c3_c07d_return_output);

-- BIN_OP_AND_uxn_c_l167_c22_c15f
BIN_OP_AND_uxn_c_l167_c22_c15f : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l167_c22_c15f_left,
BIN_OP_AND_uxn_c_l167_c22_c15f_right,
BIN_OP_AND_uxn_c_l167_c22_c15f_return_output);

-- BIN_OP_OR_uxn_c_l167_c3_4a43
BIN_OP_OR_uxn_c_l167_c3_4a43 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l167_c3_4a43_left,
BIN_OP_OR_uxn_c_l167_c3_4a43_right,
BIN_OP_OR_uxn_c_l167_c3_4a43_return_output);

-- fg_vram_update_uxn_c_l163_c27_ba53
fg_vram_update_uxn_c_l163_c27_ba53 : entity work.fg_vram_update_0CLK_6f2c5aad port map (
clk,
fg_vram_update_uxn_c_l163_c27_ba53_CLOCK_ENABLE,
fg_vram_update_uxn_c_l163_c27_ba53_read_address,
fg_vram_update_uxn_c_l163_c27_ba53_write_address,
fg_vram_update_uxn_c_l163_c27_ba53_write_value,
fg_vram_update_uxn_c_l163_c27_ba53_write_enable,
fg_vram_update_uxn_c_l163_c27_ba53_return_output);

-- BIN_OP_AND_uxn_c_l170_c38_df52
BIN_OP_AND_uxn_c_l170_c38_df52 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l170_c38_df52_left,
BIN_OP_AND_uxn_c_l170_c38_df52_right,
BIN_OP_AND_uxn_c_l170_c38_df52_return_output);

-- UNARY_OP_NOT_uxn_c_l170_c38_08b2
UNARY_OP_NOT_uxn_c_l170_c38_08b2 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l170_c38_08b2_expr,
UNARY_OP_NOT_uxn_c_l170_c38_08b2_return_output);

-- MUX_uxn_c_l170_c19_0341
MUX_uxn_c_l170_c19_0341 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l170_c19_0341_cond,
MUX_uxn_c_l170_c19_0341_iftrue,
MUX_uxn_c_l170_c19_0341_iffalse,
MUX_uxn_c_l170_c19_0341_return_output);

-- BIN_OP_EQ_uxn_c_l171_c19_a940
BIN_OP_EQ_uxn_c_l171_c19_a940 : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l171_c19_a940_left,
BIN_OP_EQ_uxn_c_l171_c19_a940_right,
BIN_OP_EQ_uxn_c_l171_c19_a940_return_output);

-- BIN_OP_PLUS_uxn_c_l171_c76_09e6
BIN_OP_PLUS_uxn_c_l171_c76_09e6 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l171_c76_09e6_left,
BIN_OP_PLUS_uxn_c_l171_c76_09e6_right,
BIN_OP_PLUS_uxn_c_l171_c76_09e6_return_output);

-- MUX_uxn_c_l171_c50_108c
MUX_uxn_c_l171_c50_108c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l171_c50_108c_cond,
MUX_uxn_c_l171_c50_108c_iftrue,
MUX_uxn_c_l171_c50_108c_iffalse,
MUX_uxn_c_l171_c50_108c_return_output);

-- MUX_uxn_c_l171_c19_6c9e
MUX_uxn_c_l171_c19_6c9e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l171_c19_6c9e_cond,
MUX_uxn_c_l171_c19_6c9e_iftrue,
MUX_uxn_c_l171_c19_6c9e_iffalse,
MUX_uxn_c_l171_c19_6c9e_return_output);

-- BIN_OP_EQ_uxn_c_l172_c25_718a
BIN_OP_EQ_uxn_c_l172_c25_718a : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l172_c25_718a_left,
BIN_OP_EQ_uxn_c_l172_c25_718a_right,
BIN_OP_EQ_uxn_c_l172_c25_718a_return_output);

-- MUX_uxn_c_l172_c25_904d
MUX_uxn_c_l172_c25_904d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l172_c25_904d_cond,
MUX_uxn_c_l172_c25_904d_iftrue,
MUX_uxn_c_l172_c25_904d_iffalse,
MUX_uxn_c_l172_c25_904d_return_output);

-- BIN_OP_EQ_uxn_c_l173_c17_5770
BIN_OP_EQ_uxn_c_l173_c17_5770 : entity work.BIN_OP_EQ_uint2_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l173_c17_5770_left,
BIN_OP_EQ_uxn_c_l173_c17_5770_right,
BIN_OP_EQ_uxn_c_l173_c17_5770_return_output);

-- MUX_uxn_c_l173_c17_d13c
MUX_uxn_c_l173_c17_d13c : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
MUX_uxn_c_l173_c17_d13c_cond,
MUX_uxn_c_l173_c17_d13c_iftrue,
MUX_uxn_c_l173_c17_d13c_iffalse,
MUX_uxn_c_l173_c17_d13c_return_output);

-- CONST_SR_8_uint16_t_uxn_c_l135_l133_DUPLICATE_195f
CONST_SR_8_uint16_t_uxn_c_l135_l133_DUPLICATE_195f : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uint16_t_uxn_c_l135_l133_DUPLICATE_195f_x,
CONST_SR_8_uint16_t_uxn_c_l135_l133_DUPLICATE_195f_return_output);

-- UNARY_OP_NOT_uint1_t_uxn_c_l160_l167_DUPLICATE_2cde
UNARY_OP_NOT_uint1_t_uxn_c_l160_l167_DUPLICATE_2cde : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uint1_t_uxn_c_l160_l167_DUPLICATE_2cde_expr,
UNARY_OP_NOT_uint1_t_uxn_c_l160_l167_DUPLICATE_2cde_return_output);

-- BIN_OP_AND_uint1_t_uint1_t_uxn_c_l160_l167_DUPLICATE_d99f
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l160_l167_DUPLICATE_d99f : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l160_l167_DUPLICATE_d99f_left,
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l160_l167_DUPLICATE_d99f_right,
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l160_l167_DUPLICATE_d99f_return_output);



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
 fill_x0,
 fill_y0,
 fill_x1,
 fill_y1,
 fill_color,
 is_new_fill_row,
 is_last_fill_col,
 is_fill_active,
 fill_layer,
 is_fill_top,
 is_fill_left,
 pixel_counter,
 x,
 y,
 -- All submodule outputs
 CONST_SR_4_uxn_c_l126_c52_f3f4_return_output,
 BIN_OP_AND_uxn_c_l126_c25_3809_return_output,
 UNARY_OP_NOT_uxn_c_l129_c22_44e6_return_output,
 BIN_OP_AND_uxn_c_l129_c6_fc94_return_output,
 is_fill_active_MUX_uxn_c_l129_c2_226b_return_output,
 fill_y0_MUX_uxn_c_l129_c2_226b_return_output,
 is_fill_left_MUX_uxn_c_l129_c2_226b_return_output,
 fill_color_MUX_uxn_c_l129_c2_226b_return_output,
 fill_layer_MUX_uxn_c_l129_c2_226b_return_output,
 fill_y1_MUX_uxn_c_l129_c2_226b_return_output,
 y_MUX_uxn_c_l129_c2_226b_return_output,
 fill_x0_MUX_uxn_c_l129_c2_226b_return_output,
 fill_x1_MUX_uxn_c_l129_c2_226b_return_output,
 is_fill_top_MUX_uxn_c_l129_c2_226b_return_output,
 x_MUX_uxn_c_l129_c2_226b_return_output,
 CONST_SR_2_uxn_c_l131_c20_dbf1_return_output,
 CONST_SR_3_uxn_c_l132_c18_48d6_return_output,
 MUX_uxn_c_l133_c13_7d82_return_output,
 BIN_OP_AND_uxn_c_l134_c28_d4ae_return_output,
 MUX_uxn_c_l134_c13_72b2_return_output,
 MUX_uxn_c_l135_c13_9fce_return_output,
 BIN_OP_AND_uxn_c_l136_c32_1850_return_output,
 MUX_uxn_c_l136_c13_5559_return_output,
 CONST_SL_8_uxn_c_l146_c54_33d8_return_output,
 BIN_OP_PLUS_uxn_c_l146_c54_77f5_return_output,
 MUX_uxn_c_l146_c35_8062_return_output,
 BIN_OP_EQ_uxn_c_l148_c21_daa2_return_output,
 MUX_uxn_c_l148_c21_1804_return_output,
 BIN_OP_EQ_uxn_c_l149_c22_5bbb_return_output,
 MUX_uxn_c_l149_c22_b936_return_output,
 BIN_OP_PLUS_uxn_c_l150_c25_8d31_return_output,
 MUX_uxn_c_l150_c6_ca2e_return_output,
 BIN_OP_PLUS_uxn_c_l151_c34_c0fc_return_output,
 MUX_uxn_c_l151_c6_c4dc_return_output,
 UNARY_OP_NOT_uxn_c_l153_c46_7808_return_output,
 BIN_OP_AND_uxn_c_l153_c27_c008_return_output,
 BIN_OP_AND_uxn_c_l154_c27_4bd4_return_output,
 MUX_uxn_c_l159_c3_cedd_return_output,
 UNARY_OP_NOT_uxn_c_l160_c57_f1ec_return_output,
 BIN_OP_AND_uxn_c_l160_c22_4b60_return_output,
 BIN_OP_OR_uxn_c_l160_c3_1f64_return_output,
 bg_vram_update_uxn_c_l156_c27_8950_return_output,
 MUX_uxn_c_l166_c3_c07d_return_output,
 BIN_OP_AND_uxn_c_l167_c22_c15f_return_output,
 BIN_OP_OR_uxn_c_l167_c3_4a43_return_output,
 fg_vram_update_uxn_c_l163_c27_ba53_return_output,
 BIN_OP_AND_uxn_c_l170_c38_df52_return_output,
 UNARY_OP_NOT_uxn_c_l170_c38_08b2_return_output,
 MUX_uxn_c_l170_c19_0341_return_output,
 BIN_OP_EQ_uxn_c_l171_c19_a940_return_output,
 BIN_OP_PLUS_uxn_c_l171_c76_09e6_return_output,
 MUX_uxn_c_l171_c50_108c_return_output,
 MUX_uxn_c_l171_c19_6c9e_return_output,
 BIN_OP_EQ_uxn_c_l172_c25_718a_return_output,
 MUX_uxn_c_l172_c25_904d_return_output,
 BIN_OP_EQ_uxn_c_l173_c17_5770_return_output,
 MUX_uxn_c_l173_c17_d13c_return_output,
 CONST_SR_8_uint16_t_uxn_c_l135_l133_DUPLICATE_195f_return_output,
 UNARY_OP_NOT_uint1_t_uxn_c_l160_l167_DUPLICATE_2cde_return_output,
 BIN_OP_AND_uint1_t_uint1_t_uxn_c_l160_l167_DUPLICATE_d99f_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : gpu_step_result_t;
 variable VAR_is_active_drawing_area : unsigned(0 downto 0);
 variable VAR_is_vram_write : unsigned(0 downto 0);
 variable VAR_vram_write_layer : unsigned(0 downto 0);
 variable VAR_vram_address : unsigned(15 downto 0);
 variable VAR_vram_value : unsigned(7 downto 0);
 variable VAR_is_fill_code : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l126_c25_3809_left : unsigned(0 downto 0);
 variable VAR_CONST_SR_4_uxn_c_l126_c52_f3f4_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_c_l126_c52_f3f4_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_c_l126_c42_bfb9_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l126_c25_3809_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l126_c25_3809_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l129_c6_fc94_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l129_c22_44e6_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l129_c22_44e6_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l129_c6_fc94_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l129_c6_fc94_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_active_MUX_uxn_c_l129_c2_226b_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_active_MUX_uxn_c_l129_c2_226b_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_active_MUX_uxn_c_l129_c2_226b_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_active_MUX_uxn_c_l129_c2_226b_cond : unsigned(0 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l129_c2_226b_iftrue : unsigned(15 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l129_c2_226b_iffalse : unsigned(15 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l129_c2_226b_return_output : unsigned(15 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l129_c2_226b_cond : unsigned(0 downto 0);
 variable VAR_is_fill_left_MUX_uxn_c_l129_c2_226b_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_left_uxn_c_l132_c3_1875 : unsigned(0 downto 0);
 variable VAR_is_fill_left_MUX_uxn_c_l129_c2_226b_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_left_MUX_uxn_c_l129_c2_226b_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_left_MUX_uxn_c_l129_c2_226b_cond : unsigned(0 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l129_c2_226b_iftrue : unsigned(1 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l129_c2_226b_iffalse : unsigned(1 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l129_c2_226b_return_output : unsigned(1 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l129_c2_226b_cond : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l129_c2_226b_iftrue : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l129_c2_226b_iffalse : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l129_c2_226b_return_output : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l129_c2_226b_cond : unsigned(0 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l129_c2_226b_iftrue : unsigned(15 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l129_c2_226b_iffalse : unsigned(15 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l129_c2_226b_return_output : unsigned(15 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l129_c2_226b_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_c_l129_c2_226b_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_c_l129_c2_226b_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_c_l129_c2_226b_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_c_l129_c2_226b_cond : unsigned(0 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l129_c2_226b_iftrue : unsigned(15 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l129_c2_226b_iffalse : unsigned(15 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l129_c2_226b_return_output : unsigned(15 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l129_c2_226b_cond : unsigned(0 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l129_c2_226b_iftrue : unsigned(15 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l129_c2_226b_iffalse : unsigned(15 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l129_c2_226b_return_output : unsigned(15 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l129_c2_226b_cond : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l129_c2_226b_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_top_uxn_c_l131_c6_cd17 : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l129_c2_226b_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l129_c2_226b_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l129_c2_226b_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_c_l129_c2_226b_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_c_l129_c2_226b_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_c_l129_c2_226b_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_c_l129_c2_226b_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_2_uxn_c_l131_c20_dbf1_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_2_uxn_c_l131_c20_dbf1_x : unsigned(7 downto 0);
 variable VAR_CONST_SR_3_uxn_c_l132_c18_48d6_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_3_uxn_c_l132_c18_48d6_x : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l133_c13_7d82_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l133_c13_7d82_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l133_c13_7d82_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l133_c13_7d82_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l134_c13_72b2_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l134_c13_72b2_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l134_c13_72b2_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l134_c28_d4ae_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l134_c28_d4ae_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l134_c28_d4ae_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l134_c13_72b2_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l135_c13_9fce_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l135_c13_9fce_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l135_c13_9fce_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l135_c13_9fce_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l136_c13_5559_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l136_c13_5559_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l136_c13_5559_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l136_c32_1850_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l136_c32_1850_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l136_c32_1850_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l136_c13_5559_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint2_t_uxn_c_l138_c16_ee5d_return_output : unsigned(1 downto 0);
 variable VAR_adjusted_vram_address : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l146_c35_8062_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l146_c35_8062_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l146_c35_8062_iffalse : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l146_c54_33d8_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l146_c54_77f5_left : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l146_c54_33d8_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l146_c54_77f5_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l146_c54_77f5_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l146_c35_8062_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l148_c21_1804_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l148_c21_daa2_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l148_c21_daa2_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l148_c21_daa2_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l148_c21_1804_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l148_c21_1804_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l148_c21_1804_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l149_c22_b936_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l149_c22_5bbb_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l149_c22_5bbb_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l149_c22_5bbb_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l149_c22_b936_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l149_c22_b936_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l149_c22_b936_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l150_c6_ca2e_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l150_c6_ca2e_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l150_c6_ca2e_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l150_c25_8d31_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l150_c25_8d31_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l150_c25_8d31_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l150_c6_ca2e_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l151_c6_c4dc_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l151_c6_c4dc_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l151_c6_c4dc_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l151_c34_c0fc_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l151_c34_c0fc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l151_c34_c0fc_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l151_c6_c4dc_return_output : unsigned(15 downto 0);
 variable VAR_is_fill_pixel0 : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l153_c27_c008_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l153_c46_7808_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l153_c46_7808_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l153_c27_c008_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l153_c27_c008_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_pixel1 : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l154_c27_4bd4_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l154_c27_4bd4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l154_c27_4bd4_return_output : unsigned(0 downto 0);
 variable VAR_bg_pixel_color : unsigned(1 downto 0);
 variable VAR_bg_vram_update_uxn_c_l156_c27_8950_read_address : unsigned(15 downto 0);
 variable VAR_bg_vram_update_uxn_c_l156_c27_8950_write_address : unsigned(15 downto 0);
 variable VAR_bg_vram_update_uxn_c_l156_c27_8950_write_value : unsigned(1 downto 0);
 variable VAR_bg_vram_update_uxn_c_l156_c27_8950_write_enable : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l159_c3_cedd_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l159_c3_cedd_iftrue : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l159_c3_cedd_iffalse : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l159_c3_cedd_return_output : unsigned(1 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l160_c3_1f64_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l160_c22_4b60_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l160_c57_f1ec_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l160_c57_f1ec_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l160_c22_4b60_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l160_c22_4b60_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l160_c3_1f64_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l160_c3_1f64_return_output : unsigned(0 downto 0);
 variable VAR_bg_vram_update_uxn_c_l156_c27_8950_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_bg_vram_update_uxn_c_l156_c27_8950_return_output : unsigned(1 downto 0);
 variable VAR_fg_pixel_color : unsigned(1 downto 0);
 variable VAR_fg_vram_update_uxn_c_l163_c27_ba53_read_address : unsigned(15 downto 0);
 variable VAR_fg_vram_update_uxn_c_l163_c27_ba53_write_address : unsigned(15 downto 0);
 variable VAR_fg_vram_update_uxn_c_l163_c27_ba53_write_value : unsigned(1 downto 0);
 variable VAR_fg_vram_update_uxn_c_l163_c27_ba53_write_enable : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l166_c3_c07d_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l166_c3_c07d_iftrue : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l166_c3_c07d_iffalse : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l166_c3_c07d_return_output : unsigned(1 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l167_c3_4a43_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l167_c22_c15f_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l167_c22_c15f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l167_c22_c15f_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l167_c3_4a43_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l167_c3_4a43_return_output : unsigned(0 downto 0);
 variable VAR_fg_vram_update_uxn_c_l163_c27_ba53_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_fg_vram_update_uxn_c_l163_c27_ba53_return_output : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l170_c19_0341_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l170_c19_0341_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l170_c19_0341_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l170_c38_df52_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l170_c38_df52_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l170_c38_df52_return_output : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l170_c38_08b2_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l170_c38_08b2_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l170_c19_0341_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l171_c19_6c9e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l171_c19_a940_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l171_c19_a940_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l171_c19_a940_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l171_c19_6c9e_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l171_c19_6c9e_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l171_c50_108c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l171_c50_108c_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l171_c50_108c_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l171_c76_09e6_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l171_c76_09e6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l171_c76_09e6_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l171_c50_108c_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l171_c19_6c9e_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l172_c25_904d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l172_c25_718a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l172_c25_718a_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l172_c25_718a_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l172_c25_904d_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l172_c25_904d_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l172_c25_904d_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l173_c17_d13c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l173_c17_5770_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l173_c17_5770_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l173_c17_5770_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l173_c17_d13c_iftrue : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l173_c17_d13c_iffalse : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l173_c17_d13c_return_output : unsigned(1 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_c_l135_l133_DUPLICATE_195f_x : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_c_l135_l133_DUPLICATE_195f_return_output : unsigned(15 downto 0);
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_c_l160_l167_DUPLICATE_2cde_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_c_l160_l167_DUPLICATE_2cde_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l160_l167_DUPLICATE_d99f_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l160_l167_DUPLICATE_d99f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l160_l167_DUPLICATE_d99f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_269d_uxn_c_l176_l115_DUPLICATE_ecbe_return_output : gpu_step_result_t;
 -- State registers comb logic variables
variable REG_VAR_result : gpu_step_result_t;
variable REG_VAR_fill_x0 : unsigned(15 downto 0);
variable REG_VAR_fill_y0 : unsigned(15 downto 0);
variable REG_VAR_fill_x1 : unsigned(15 downto 0);
variable REG_VAR_fill_y1 : unsigned(15 downto 0);
variable REG_VAR_fill_color : unsigned(1 downto 0);
variable REG_VAR_is_new_fill_row : unsigned(0 downto 0);
variable REG_VAR_is_last_fill_col : unsigned(0 downto 0);
variable REG_VAR_is_fill_active : unsigned(0 downto 0);
variable REG_VAR_fill_layer : unsigned(0 downto 0);
variable REG_VAR_is_fill_top : unsigned(0 downto 0);
variable REG_VAR_is_fill_left : unsigned(0 downto 0);
variable REG_VAR_pixel_counter : unsigned(15 downto 0);
variable REG_VAR_x : unsigned(15 downto 0);
variable REG_VAR_y : unsigned(15 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_result := result;
  REG_VAR_fill_x0 := fill_x0;
  REG_VAR_fill_y0 := fill_y0;
  REG_VAR_fill_x1 := fill_x1;
  REG_VAR_fill_y1 := fill_y1;
  REG_VAR_fill_color := fill_color;
  REG_VAR_is_new_fill_row := is_new_fill_row;
  REG_VAR_is_last_fill_col := is_last_fill_col;
  REG_VAR_is_fill_active := is_fill_active;
  REG_VAR_fill_layer := fill_layer;
  REG_VAR_is_fill_top := is_fill_top;
  REG_VAR_is_fill_left := is_fill_left;
  REG_VAR_pixel_counter := pixel_counter;
  REG_VAR_x := x;
  REG_VAR_y := y;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_PLUS_uxn_c_l150_c25_8d31_right := to_unsigned(1, 1);
     VAR_is_fill_active_MUX_uxn_c_l129_c2_226b_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l172_c25_904d_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l133_c13_7d82_iffalse := resize(to_unsigned(239, 8), 16);
     VAR_BIN_OP_EQ_uxn_c_l172_c25_718a_right := to_unsigned(61439, 16);
     VAR_BIN_OP_AND_uxn_c_l136_c32_1850_right := to_unsigned(255, 16);
     VAR_MUX_uxn_c_l135_c13_9fce_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_MUX_uxn_c_l170_c19_0341_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_c_l171_c76_09e6_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l173_c17_5770_right := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l148_c21_1804_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l134_c13_72b2_iffalse := resize(to_unsigned(255, 8), 16);
     VAR_BIN_OP_PLUS_uxn_c_l151_c34_c0fc_right := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l148_c21_1804_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l149_c22_b936_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l172_c25_904d_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l171_c19_6c9e_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_MUX_uxn_c_l149_c22_b936_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l171_c19_a940_right := to_unsigned(61439, 16);
     VAR_BIN_OP_AND_uxn_c_l134_c28_d4ae_right := to_unsigned(255, 16);
     VAR_MUX_uxn_c_l136_c13_5559_iftrue := resize(to_unsigned(0, 1), 16);

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
     VAR_bg_vram_update_uxn_c_l156_c27_8950_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_fg_vram_update_uxn_c_l163_c27_ba53_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_fill_color_MUX_uxn_c_l129_c2_226b_iffalse := fill_color;
     VAR_fill_layer_MUX_uxn_c_l129_c2_226b_iffalse := fill_layer;
     VAR_fill_x0_MUX_uxn_c_l129_c2_226b_iffalse := fill_x0;
     VAR_fill_x1_MUX_uxn_c_l129_c2_226b_iffalse := fill_x1;
     VAR_fill_y0_MUX_uxn_c_l129_c2_226b_iffalse := fill_y0;
     VAR_fill_y1_MUX_uxn_c_l129_c2_226b_iffalse := fill_y1;
     VAR_MUX_uxn_c_l171_c50_108c_cond := VAR_is_active_drawing_area;
     VAR_UNARY_OP_NOT_uxn_c_l129_c22_44e6_expr := is_fill_active;
     VAR_is_fill_active_MUX_uxn_c_l129_c2_226b_iffalse := is_fill_active;
     VAR_is_fill_left_MUX_uxn_c_l129_c2_226b_iffalse := is_fill_left;
     VAR_is_fill_top_MUX_uxn_c_l129_c2_226b_iffalse := is_fill_top;
     VAR_BIN_OP_AND_uxn_c_l126_c25_3809_left := VAR_is_vram_write;
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l160_l167_DUPLICATE_d99f_right := VAR_is_vram_write;
     VAR_BIN_OP_EQ_uxn_c_l171_c19_a940_left := pixel_counter;
     VAR_BIN_OP_PLUS_uxn_c_l171_c76_09e6_left := pixel_counter;
     VAR_MUX_uxn_c_l171_c50_108c_iffalse := pixel_counter;
     VAR_bg_vram_update_uxn_c_l156_c27_8950_read_address := pixel_counter;
     VAR_fg_vram_update_uxn_c_l163_c27_ba53_read_address := pixel_counter;
     VAR_BIN_OP_AND_uxn_c_l134_c28_d4ae_left := VAR_vram_address;
     VAR_BIN_OP_AND_uxn_c_l136_c32_1850_left := VAR_vram_address;
     VAR_CONST_SR_8_uint16_t_uxn_c_l135_l133_DUPLICATE_195f_x := VAR_vram_address;
     VAR_MUX_uxn_c_l146_c35_8062_iffalse := VAR_vram_address;
     VAR_CONST_SR_2_uxn_c_l131_c20_dbf1_x := VAR_vram_value;
     VAR_CONST_SR_3_uxn_c_l132_c18_48d6_x := VAR_vram_value;
     VAR_CONST_SR_4_uxn_c_l126_c52_f3f4_x := VAR_vram_value;
     VAR_MUX_uxn_c_l159_c3_cedd_iffalse := resize(VAR_vram_value, 2);
     VAR_MUX_uxn_c_l166_c3_c07d_iffalse := resize(VAR_vram_value, 2);
     VAR_BIN_OP_AND_uxn_c_l167_c22_c15f_right := VAR_vram_write_layer;
     VAR_UNARY_OP_NOT_uxn_c_l160_c57_f1ec_expr := VAR_vram_write_layer;
     VAR_fill_layer_MUX_uxn_c_l129_c2_226b_iftrue := VAR_vram_write_layer;
     VAR_x_MUX_uxn_c_l129_c2_226b_iffalse := x;
     VAR_y_MUX_uxn_c_l129_c2_226b_iffalse := y;
     -- UNARY_OP_NOT[uxn_c_l160_c57_f1ec] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l160_c57_f1ec_expr <= VAR_UNARY_OP_NOT_uxn_c_l160_c57_f1ec_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l160_c57_f1ec_return_output := UNARY_OP_NOT_uxn_c_l160_c57_f1ec_return_output;

     -- UNARY_OP_NOT[uxn_c_l129_c22_44e6] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l129_c22_44e6_expr <= VAR_UNARY_OP_NOT_uxn_c_l129_c22_44e6_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l129_c22_44e6_return_output := UNARY_OP_NOT_uxn_c_l129_c22_44e6_return_output;

     -- CONST_SR_2[uxn_c_l131_c20_dbf1] LATENCY=0
     -- Inputs
     CONST_SR_2_uxn_c_l131_c20_dbf1_x <= VAR_CONST_SR_2_uxn_c_l131_c20_dbf1_x;
     -- Outputs
     VAR_CONST_SR_2_uxn_c_l131_c20_dbf1_return_output := CONST_SR_2_uxn_c_l131_c20_dbf1_return_output;

     -- CONST_SR_8_uint16_t_uxn_c_l135_l133_DUPLICATE_195f LATENCY=0
     -- Inputs
     CONST_SR_8_uint16_t_uxn_c_l135_l133_DUPLICATE_195f_x <= VAR_CONST_SR_8_uint16_t_uxn_c_l135_l133_DUPLICATE_195f_x;
     -- Outputs
     VAR_CONST_SR_8_uint16_t_uxn_c_l135_l133_DUPLICATE_195f_return_output := CONST_SR_8_uint16_t_uxn_c_l135_l133_DUPLICATE_195f_return_output;

     -- CONST_SR_3[uxn_c_l132_c18_48d6] LATENCY=0
     -- Inputs
     CONST_SR_3_uxn_c_l132_c18_48d6_x <= VAR_CONST_SR_3_uxn_c_l132_c18_48d6_x;
     -- Outputs
     VAR_CONST_SR_3_uxn_c_l132_c18_48d6_return_output := CONST_SR_3_uxn_c_l132_c18_48d6_return_output;

     -- BIN_OP_AND[uxn_c_l134_c28_d4ae] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l134_c28_d4ae_left <= VAR_BIN_OP_AND_uxn_c_l134_c28_d4ae_left;
     BIN_OP_AND_uxn_c_l134_c28_d4ae_right <= VAR_BIN_OP_AND_uxn_c_l134_c28_d4ae_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l134_c28_d4ae_return_output := BIN_OP_AND_uxn_c_l134_c28_d4ae_return_output;

     -- BIN_OP_AND[uxn_c_l136_c32_1850] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l136_c32_1850_left <= VAR_BIN_OP_AND_uxn_c_l136_c32_1850_left;
     BIN_OP_AND_uxn_c_l136_c32_1850_right <= VAR_BIN_OP_AND_uxn_c_l136_c32_1850_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l136_c32_1850_return_output := BIN_OP_AND_uxn_c_l136_c32_1850_return_output;

     -- BIN_OP_EQ[uxn_c_l171_c19_a940] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l171_c19_a940_left <= VAR_BIN_OP_EQ_uxn_c_l171_c19_a940_left;
     BIN_OP_EQ_uxn_c_l171_c19_a940_right <= VAR_BIN_OP_EQ_uxn_c_l171_c19_a940_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l171_c19_a940_return_output := BIN_OP_EQ_uxn_c_l171_c19_a940_return_output;

     -- BIN_OP_PLUS[uxn_c_l171_c76_09e6] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l171_c76_09e6_left <= VAR_BIN_OP_PLUS_uxn_c_l171_c76_09e6_left;
     BIN_OP_PLUS_uxn_c_l171_c76_09e6_right <= VAR_BIN_OP_PLUS_uxn_c_l171_c76_09e6_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l171_c76_09e6_return_output := BIN_OP_PLUS_uxn_c_l171_c76_09e6_return_output;

     -- CAST_TO_uint2_t[uxn_c_l138_c16_ee5d] LATENCY=0
     VAR_CAST_TO_uint2_t_uxn_c_l138_c16_ee5d_return_output := CAST_TO_uint2_t_uint8_t(
     VAR_vram_value);

     -- CONST_SR_4[uxn_c_l126_c52_f3f4] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_c_l126_c52_f3f4_x <= VAR_CONST_SR_4_uxn_c_l126_c52_f3f4_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_c_l126_c52_f3f4_return_output := CONST_SR_4_uxn_c_l126_c52_f3f4_return_output;

     -- Submodule level 1
     VAR_MUX_uxn_c_l134_c13_72b2_iftrue := VAR_BIN_OP_AND_uxn_c_l134_c28_d4ae_return_output;
     VAR_MUX_uxn_c_l136_c13_5559_iffalse := VAR_BIN_OP_AND_uxn_c_l136_c32_1850_return_output;
     VAR_MUX_uxn_c_l171_c19_6c9e_cond := VAR_BIN_OP_EQ_uxn_c_l171_c19_a940_return_output;
     VAR_MUX_uxn_c_l171_c50_108c_iftrue := resize(VAR_BIN_OP_PLUS_uxn_c_l171_c76_09e6_return_output, 16);
     VAR_fill_color_MUX_uxn_c_l129_c2_226b_iftrue := VAR_CAST_TO_uint2_t_uxn_c_l138_c16_ee5d_return_output;
     VAR_is_fill_top_uxn_c_l131_c6_cd17 := resize(VAR_CONST_SR_2_uxn_c_l131_c20_dbf1_return_output, 1);
     VAR_is_fill_left_uxn_c_l132_c3_1875 := resize(VAR_CONST_SR_3_uxn_c_l132_c18_48d6_return_output, 1);
     VAR_MUX_uxn_c_l133_c13_7d82_iftrue := VAR_CONST_SR_8_uint16_t_uxn_c_l135_l133_DUPLICATE_195f_return_output;
     VAR_MUX_uxn_c_l135_c13_9fce_iffalse := VAR_CONST_SR_8_uint16_t_uxn_c_l135_l133_DUPLICATE_195f_return_output;
     VAR_BIN_OP_AND_uxn_c_l129_c6_fc94_right := VAR_UNARY_OP_NOT_uxn_c_l129_c22_44e6_return_output;
     VAR_BIN_OP_AND_uxn_c_l160_c22_4b60_right := VAR_UNARY_OP_NOT_uxn_c_l160_c57_f1ec_return_output;
     VAR_MUX_uxn_c_l134_c13_72b2_cond := VAR_is_fill_left_uxn_c_l132_c3_1875;
     VAR_MUX_uxn_c_l136_c13_5559_cond := VAR_is_fill_left_uxn_c_l132_c3_1875;
     VAR_is_fill_left_MUX_uxn_c_l129_c2_226b_iftrue := VAR_is_fill_left_uxn_c_l132_c3_1875;
     VAR_MUX_uxn_c_l133_c13_7d82_cond := VAR_is_fill_top_uxn_c_l131_c6_cd17;
     VAR_MUX_uxn_c_l135_c13_9fce_cond := VAR_is_fill_top_uxn_c_l131_c6_cd17;
     VAR_is_fill_top_MUX_uxn_c_l129_c2_226b_iftrue := VAR_is_fill_top_uxn_c_l131_c6_cd17;
     -- MUX[uxn_c_l135_c13_9fce] LATENCY=0
     -- Inputs
     MUX_uxn_c_l135_c13_9fce_cond <= VAR_MUX_uxn_c_l135_c13_9fce_cond;
     MUX_uxn_c_l135_c13_9fce_iftrue <= VAR_MUX_uxn_c_l135_c13_9fce_iftrue;
     MUX_uxn_c_l135_c13_9fce_iffalse <= VAR_MUX_uxn_c_l135_c13_9fce_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l135_c13_9fce_return_output := MUX_uxn_c_l135_c13_9fce_return_output;

     -- MUX[uxn_c_l134_c13_72b2] LATENCY=0
     -- Inputs
     MUX_uxn_c_l134_c13_72b2_cond <= VAR_MUX_uxn_c_l134_c13_72b2_cond;
     MUX_uxn_c_l134_c13_72b2_iftrue <= VAR_MUX_uxn_c_l134_c13_72b2_iftrue;
     MUX_uxn_c_l134_c13_72b2_iffalse <= VAR_MUX_uxn_c_l134_c13_72b2_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l134_c13_72b2_return_output := MUX_uxn_c_l134_c13_72b2_return_output;

     -- MUX[uxn_c_l171_c50_108c] LATENCY=0
     -- Inputs
     MUX_uxn_c_l171_c50_108c_cond <= VAR_MUX_uxn_c_l171_c50_108c_cond;
     MUX_uxn_c_l171_c50_108c_iftrue <= VAR_MUX_uxn_c_l171_c50_108c_iftrue;
     MUX_uxn_c_l171_c50_108c_iffalse <= VAR_MUX_uxn_c_l171_c50_108c_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l171_c50_108c_return_output := MUX_uxn_c_l171_c50_108c_return_output;

     -- CAST_TO_uint1_t[uxn_c_l126_c42_bfb9] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_c_l126_c42_bfb9_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_4_uxn_c_l126_c52_f3f4_return_output);

     -- MUX[uxn_c_l133_c13_7d82] LATENCY=0
     -- Inputs
     MUX_uxn_c_l133_c13_7d82_cond <= VAR_MUX_uxn_c_l133_c13_7d82_cond;
     MUX_uxn_c_l133_c13_7d82_iftrue <= VAR_MUX_uxn_c_l133_c13_7d82_iftrue;
     MUX_uxn_c_l133_c13_7d82_iffalse <= VAR_MUX_uxn_c_l133_c13_7d82_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l133_c13_7d82_return_output := MUX_uxn_c_l133_c13_7d82_return_output;

     -- MUX[uxn_c_l136_c13_5559] LATENCY=0
     -- Inputs
     MUX_uxn_c_l136_c13_5559_cond <= VAR_MUX_uxn_c_l136_c13_5559_cond;
     MUX_uxn_c_l136_c13_5559_iftrue <= VAR_MUX_uxn_c_l136_c13_5559_iftrue;
     MUX_uxn_c_l136_c13_5559_iffalse <= VAR_MUX_uxn_c_l136_c13_5559_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l136_c13_5559_return_output := MUX_uxn_c_l136_c13_5559_return_output;

     -- Submodule level 2
     VAR_BIN_OP_AND_uxn_c_l126_c25_3809_right := VAR_CAST_TO_uint1_t_uxn_c_l126_c42_bfb9_return_output;
     VAR_fill_y1_MUX_uxn_c_l129_c2_226b_iftrue := VAR_MUX_uxn_c_l133_c13_7d82_return_output;
     VAR_fill_x1_MUX_uxn_c_l129_c2_226b_iftrue := VAR_MUX_uxn_c_l134_c13_72b2_return_output;
     VAR_fill_y0_MUX_uxn_c_l129_c2_226b_iftrue := VAR_MUX_uxn_c_l135_c13_9fce_return_output;
     VAR_y_MUX_uxn_c_l129_c2_226b_iftrue := VAR_MUX_uxn_c_l135_c13_9fce_return_output;
     VAR_fill_x0_MUX_uxn_c_l129_c2_226b_iftrue := VAR_MUX_uxn_c_l136_c13_5559_return_output;
     VAR_x_MUX_uxn_c_l129_c2_226b_iftrue := VAR_MUX_uxn_c_l136_c13_5559_return_output;
     VAR_MUX_uxn_c_l171_c19_6c9e_iffalse := VAR_MUX_uxn_c_l171_c50_108c_return_output;
     -- BIN_OP_AND[uxn_c_l126_c25_3809] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l126_c25_3809_left <= VAR_BIN_OP_AND_uxn_c_l126_c25_3809_left;
     BIN_OP_AND_uxn_c_l126_c25_3809_right <= VAR_BIN_OP_AND_uxn_c_l126_c25_3809_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l126_c25_3809_return_output := BIN_OP_AND_uxn_c_l126_c25_3809_return_output;

     -- MUX[uxn_c_l171_c19_6c9e] LATENCY=0
     -- Inputs
     MUX_uxn_c_l171_c19_6c9e_cond <= VAR_MUX_uxn_c_l171_c19_6c9e_cond;
     MUX_uxn_c_l171_c19_6c9e_iftrue <= VAR_MUX_uxn_c_l171_c19_6c9e_iftrue;
     MUX_uxn_c_l171_c19_6c9e_iffalse <= VAR_MUX_uxn_c_l171_c19_6c9e_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l171_c19_6c9e_return_output := MUX_uxn_c_l171_c19_6c9e_return_output;

     -- Submodule level 3
     VAR_BIN_OP_AND_uxn_c_l129_c6_fc94_left := VAR_BIN_OP_AND_uxn_c_l126_c25_3809_return_output;
     VAR_BIN_OP_EQ_uxn_c_l172_c25_718a_left := VAR_MUX_uxn_c_l171_c19_6c9e_return_output;
     REG_VAR_pixel_counter := VAR_MUX_uxn_c_l171_c19_6c9e_return_output;
     -- BIN_OP_EQ[uxn_c_l172_c25_718a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l172_c25_718a_left <= VAR_BIN_OP_EQ_uxn_c_l172_c25_718a_left;
     BIN_OP_EQ_uxn_c_l172_c25_718a_right <= VAR_BIN_OP_EQ_uxn_c_l172_c25_718a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l172_c25_718a_return_output := BIN_OP_EQ_uxn_c_l172_c25_718a_return_output;

     -- BIN_OP_AND[uxn_c_l129_c6_fc94] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l129_c6_fc94_left <= VAR_BIN_OP_AND_uxn_c_l129_c6_fc94_left;
     BIN_OP_AND_uxn_c_l129_c6_fc94_right <= VAR_BIN_OP_AND_uxn_c_l129_c6_fc94_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l129_c6_fc94_return_output := BIN_OP_AND_uxn_c_l129_c6_fc94_return_output;

     -- Submodule level 4
     VAR_fill_color_MUX_uxn_c_l129_c2_226b_cond := VAR_BIN_OP_AND_uxn_c_l129_c6_fc94_return_output;
     VAR_fill_layer_MUX_uxn_c_l129_c2_226b_cond := VAR_BIN_OP_AND_uxn_c_l129_c6_fc94_return_output;
     VAR_fill_x0_MUX_uxn_c_l129_c2_226b_cond := VAR_BIN_OP_AND_uxn_c_l129_c6_fc94_return_output;
     VAR_fill_x1_MUX_uxn_c_l129_c2_226b_cond := VAR_BIN_OP_AND_uxn_c_l129_c6_fc94_return_output;
     VAR_fill_y0_MUX_uxn_c_l129_c2_226b_cond := VAR_BIN_OP_AND_uxn_c_l129_c6_fc94_return_output;
     VAR_fill_y1_MUX_uxn_c_l129_c2_226b_cond := VAR_BIN_OP_AND_uxn_c_l129_c6_fc94_return_output;
     VAR_is_fill_active_MUX_uxn_c_l129_c2_226b_cond := VAR_BIN_OP_AND_uxn_c_l129_c6_fc94_return_output;
     VAR_is_fill_left_MUX_uxn_c_l129_c2_226b_cond := VAR_BIN_OP_AND_uxn_c_l129_c6_fc94_return_output;
     VAR_is_fill_top_MUX_uxn_c_l129_c2_226b_cond := VAR_BIN_OP_AND_uxn_c_l129_c6_fc94_return_output;
     VAR_x_MUX_uxn_c_l129_c2_226b_cond := VAR_BIN_OP_AND_uxn_c_l129_c6_fc94_return_output;
     VAR_y_MUX_uxn_c_l129_c2_226b_cond := VAR_BIN_OP_AND_uxn_c_l129_c6_fc94_return_output;
     VAR_MUX_uxn_c_l172_c25_904d_cond := VAR_BIN_OP_EQ_uxn_c_l172_c25_718a_return_output;
     -- fill_y1_MUX[uxn_c_l129_c2_226b] LATENCY=0
     -- Inputs
     fill_y1_MUX_uxn_c_l129_c2_226b_cond <= VAR_fill_y1_MUX_uxn_c_l129_c2_226b_cond;
     fill_y1_MUX_uxn_c_l129_c2_226b_iftrue <= VAR_fill_y1_MUX_uxn_c_l129_c2_226b_iftrue;
     fill_y1_MUX_uxn_c_l129_c2_226b_iffalse <= VAR_fill_y1_MUX_uxn_c_l129_c2_226b_iffalse;
     -- Outputs
     VAR_fill_y1_MUX_uxn_c_l129_c2_226b_return_output := fill_y1_MUX_uxn_c_l129_c2_226b_return_output;

     -- fill_layer_MUX[uxn_c_l129_c2_226b] LATENCY=0
     -- Inputs
     fill_layer_MUX_uxn_c_l129_c2_226b_cond <= VAR_fill_layer_MUX_uxn_c_l129_c2_226b_cond;
     fill_layer_MUX_uxn_c_l129_c2_226b_iftrue <= VAR_fill_layer_MUX_uxn_c_l129_c2_226b_iftrue;
     fill_layer_MUX_uxn_c_l129_c2_226b_iffalse <= VAR_fill_layer_MUX_uxn_c_l129_c2_226b_iffalse;
     -- Outputs
     VAR_fill_layer_MUX_uxn_c_l129_c2_226b_return_output := fill_layer_MUX_uxn_c_l129_c2_226b_return_output;

     -- y_MUX[uxn_c_l129_c2_226b] LATENCY=0
     -- Inputs
     y_MUX_uxn_c_l129_c2_226b_cond <= VAR_y_MUX_uxn_c_l129_c2_226b_cond;
     y_MUX_uxn_c_l129_c2_226b_iftrue <= VAR_y_MUX_uxn_c_l129_c2_226b_iftrue;
     y_MUX_uxn_c_l129_c2_226b_iffalse <= VAR_y_MUX_uxn_c_l129_c2_226b_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_c_l129_c2_226b_return_output := y_MUX_uxn_c_l129_c2_226b_return_output;

     -- fill_y0_MUX[uxn_c_l129_c2_226b] LATENCY=0
     -- Inputs
     fill_y0_MUX_uxn_c_l129_c2_226b_cond <= VAR_fill_y0_MUX_uxn_c_l129_c2_226b_cond;
     fill_y0_MUX_uxn_c_l129_c2_226b_iftrue <= VAR_fill_y0_MUX_uxn_c_l129_c2_226b_iftrue;
     fill_y0_MUX_uxn_c_l129_c2_226b_iffalse <= VAR_fill_y0_MUX_uxn_c_l129_c2_226b_iffalse;
     -- Outputs
     VAR_fill_y0_MUX_uxn_c_l129_c2_226b_return_output := fill_y0_MUX_uxn_c_l129_c2_226b_return_output;

     -- fill_color_MUX[uxn_c_l129_c2_226b] LATENCY=0
     -- Inputs
     fill_color_MUX_uxn_c_l129_c2_226b_cond <= VAR_fill_color_MUX_uxn_c_l129_c2_226b_cond;
     fill_color_MUX_uxn_c_l129_c2_226b_iftrue <= VAR_fill_color_MUX_uxn_c_l129_c2_226b_iftrue;
     fill_color_MUX_uxn_c_l129_c2_226b_iffalse <= VAR_fill_color_MUX_uxn_c_l129_c2_226b_iffalse;
     -- Outputs
     VAR_fill_color_MUX_uxn_c_l129_c2_226b_return_output := fill_color_MUX_uxn_c_l129_c2_226b_return_output;

     -- fill_x1_MUX[uxn_c_l129_c2_226b] LATENCY=0
     -- Inputs
     fill_x1_MUX_uxn_c_l129_c2_226b_cond <= VAR_fill_x1_MUX_uxn_c_l129_c2_226b_cond;
     fill_x1_MUX_uxn_c_l129_c2_226b_iftrue <= VAR_fill_x1_MUX_uxn_c_l129_c2_226b_iftrue;
     fill_x1_MUX_uxn_c_l129_c2_226b_iffalse <= VAR_fill_x1_MUX_uxn_c_l129_c2_226b_iffalse;
     -- Outputs
     VAR_fill_x1_MUX_uxn_c_l129_c2_226b_return_output := fill_x1_MUX_uxn_c_l129_c2_226b_return_output;

     -- is_fill_top_MUX[uxn_c_l129_c2_226b] LATENCY=0
     -- Inputs
     is_fill_top_MUX_uxn_c_l129_c2_226b_cond <= VAR_is_fill_top_MUX_uxn_c_l129_c2_226b_cond;
     is_fill_top_MUX_uxn_c_l129_c2_226b_iftrue <= VAR_is_fill_top_MUX_uxn_c_l129_c2_226b_iftrue;
     is_fill_top_MUX_uxn_c_l129_c2_226b_iffalse <= VAR_is_fill_top_MUX_uxn_c_l129_c2_226b_iffalse;
     -- Outputs
     VAR_is_fill_top_MUX_uxn_c_l129_c2_226b_return_output := is_fill_top_MUX_uxn_c_l129_c2_226b_return_output;

     -- MUX[uxn_c_l172_c25_904d] LATENCY=0
     -- Inputs
     MUX_uxn_c_l172_c25_904d_cond <= VAR_MUX_uxn_c_l172_c25_904d_cond;
     MUX_uxn_c_l172_c25_904d_iftrue <= VAR_MUX_uxn_c_l172_c25_904d_iftrue;
     MUX_uxn_c_l172_c25_904d_iffalse <= VAR_MUX_uxn_c_l172_c25_904d_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l172_c25_904d_return_output := MUX_uxn_c_l172_c25_904d_return_output;

     -- x_MUX[uxn_c_l129_c2_226b] LATENCY=0
     -- Inputs
     x_MUX_uxn_c_l129_c2_226b_cond <= VAR_x_MUX_uxn_c_l129_c2_226b_cond;
     x_MUX_uxn_c_l129_c2_226b_iftrue <= VAR_x_MUX_uxn_c_l129_c2_226b_iftrue;
     x_MUX_uxn_c_l129_c2_226b_iffalse <= VAR_x_MUX_uxn_c_l129_c2_226b_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_c_l129_c2_226b_return_output := x_MUX_uxn_c_l129_c2_226b_return_output;

     -- fill_x0_MUX[uxn_c_l129_c2_226b] LATENCY=0
     -- Inputs
     fill_x0_MUX_uxn_c_l129_c2_226b_cond <= VAR_fill_x0_MUX_uxn_c_l129_c2_226b_cond;
     fill_x0_MUX_uxn_c_l129_c2_226b_iftrue <= VAR_fill_x0_MUX_uxn_c_l129_c2_226b_iftrue;
     fill_x0_MUX_uxn_c_l129_c2_226b_iffalse <= VAR_fill_x0_MUX_uxn_c_l129_c2_226b_iffalse;
     -- Outputs
     VAR_fill_x0_MUX_uxn_c_l129_c2_226b_return_output := fill_x0_MUX_uxn_c_l129_c2_226b_return_output;

     -- is_fill_left_MUX[uxn_c_l129_c2_226b] LATENCY=0
     -- Inputs
     is_fill_left_MUX_uxn_c_l129_c2_226b_cond <= VAR_is_fill_left_MUX_uxn_c_l129_c2_226b_cond;
     is_fill_left_MUX_uxn_c_l129_c2_226b_iftrue <= VAR_is_fill_left_MUX_uxn_c_l129_c2_226b_iftrue;
     is_fill_left_MUX_uxn_c_l129_c2_226b_iffalse <= VAR_is_fill_left_MUX_uxn_c_l129_c2_226b_iffalse;
     -- Outputs
     VAR_is_fill_left_MUX_uxn_c_l129_c2_226b_return_output := is_fill_left_MUX_uxn_c_l129_c2_226b_return_output;

     -- is_fill_active_MUX[uxn_c_l129_c2_226b] LATENCY=0
     -- Inputs
     is_fill_active_MUX_uxn_c_l129_c2_226b_cond <= VAR_is_fill_active_MUX_uxn_c_l129_c2_226b_cond;
     is_fill_active_MUX_uxn_c_l129_c2_226b_iftrue <= VAR_is_fill_active_MUX_uxn_c_l129_c2_226b_iftrue;
     is_fill_active_MUX_uxn_c_l129_c2_226b_iffalse <= VAR_is_fill_active_MUX_uxn_c_l129_c2_226b_iffalse;
     -- Outputs
     VAR_is_fill_active_MUX_uxn_c_l129_c2_226b_return_output := is_fill_active_MUX_uxn_c_l129_c2_226b_return_output;

     -- Submodule level 5
     VAR_MUX_uxn_c_l159_c3_cedd_iftrue := VAR_fill_color_MUX_uxn_c_l129_c2_226b_return_output;
     VAR_MUX_uxn_c_l166_c3_c07d_iftrue := VAR_fill_color_MUX_uxn_c_l129_c2_226b_return_output;
     REG_VAR_fill_color := VAR_fill_color_MUX_uxn_c_l129_c2_226b_return_output;
     VAR_BIN_OP_AND_uxn_c_l154_c27_4bd4_right := VAR_fill_layer_MUX_uxn_c_l129_c2_226b_return_output;
     VAR_UNARY_OP_NOT_uxn_c_l153_c46_7808_expr := VAR_fill_layer_MUX_uxn_c_l129_c2_226b_return_output;
     REG_VAR_fill_layer := VAR_fill_layer_MUX_uxn_c_l129_c2_226b_return_output;
     VAR_MUX_uxn_c_l151_c6_c4dc_iftrue := VAR_fill_x0_MUX_uxn_c_l129_c2_226b_return_output;
     REG_VAR_fill_x0 := VAR_fill_x0_MUX_uxn_c_l129_c2_226b_return_output;
     VAR_BIN_OP_EQ_uxn_c_l148_c21_daa2_right := VAR_fill_x1_MUX_uxn_c_l129_c2_226b_return_output;
     REG_VAR_fill_x1 := VAR_fill_x1_MUX_uxn_c_l129_c2_226b_return_output;
     REG_VAR_fill_y0 := VAR_fill_y0_MUX_uxn_c_l129_c2_226b_return_output;
     VAR_BIN_OP_EQ_uxn_c_l149_c22_5bbb_right := VAR_fill_y1_MUX_uxn_c_l129_c2_226b_return_output;
     REG_VAR_fill_y1 := VAR_fill_y1_MUX_uxn_c_l129_c2_226b_return_output;
     VAR_BIN_OP_AND_uxn_c_l153_c27_c008_left := VAR_is_fill_active_MUX_uxn_c_l129_c2_226b_return_output;
     VAR_BIN_OP_AND_uxn_c_l154_c27_4bd4_left := VAR_is_fill_active_MUX_uxn_c_l129_c2_226b_return_output;
     VAR_MUX_uxn_c_l146_c35_8062_cond := VAR_is_fill_active_MUX_uxn_c_l129_c2_226b_return_output;
     VAR_MUX_uxn_c_l170_c19_0341_cond := VAR_is_fill_active_MUX_uxn_c_l129_c2_226b_return_output;
     VAR_UNARY_OP_NOT_uint1_t_uxn_c_l160_l167_DUPLICATE_2cde_expr := VAR_is_fill_active_MUX_uxn_c_l129_c2_226b_return_output;
     REG_VAR_is_fill_left := VAR_is_fill_left_MUX_uxn_c_l129_c2_226b_return_output;
     REG_VAR_is_fill_top := VAR_is_fill_top_MUX_uxn_c_l129_c2_226b_return_output;
     VAR_BIN_OP_EQ_uxn_c_l148_c21_daa2_left := VAR_x_MUX_uxn_c_l129_c2_226b_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l146_c54_77f5_right := VAR_x_MUX_uxn_c_l129_c2_226b_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l151_c34_c0fc_left := VAR_x_MUX_uxn_c_l129_c2_226b_return_output;
     VAR_BIN_OP_EQ_uxn_c_l149_c22_5bbb_left := VAR_y_MUX_uxn_c_l129_c2_226b_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l150_c25_8d31_left := VAR_y_MUX_uxn_c_l129_c2_226b_return_output;
     VAR_CONST_SL_8_uxn_c_l146_c54_33d8_x := VAR_y_MUX_uxn_c_l129_c2_226b_return_output;
     VAR_MUX_uxn_c_l150_c6_ca2e_iffalse := VAR_y_MUX_uxn_c_l129_c2_226b_return_output;
     -- BIN_OP_EQ[uxn_c_l149_c22_5bbb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l149_c22_5bbb_left <= VAR_BIN_OP_EQ_uxn_c_l149_c22_5bbb_left;
     BIN_OP_EQ_uxn_c_l149_c22_5bbb_right <= VAR_BIN_OP_EQ_uxn_c_l149_c22_5bbb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l149_c22_5bbb_return_output := BIN_OP_EQ_uxn_c_l149_c22_5bbb_return_output;

     -- UNARY_OP_NOT[uxn_c_l153_c46_7808] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l153_c46_7808_expr <= VAR_UNARY_OP_NOT_uxn_c_l153_c46_7808_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l153_c46_7808_return_output := UNARY_OP_NOT_uxn_c_l153_c46_7808_return_output;

     -- BIN_OP_PLUS[uxn_c_l151_c34_c0fc] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l151_c34_c0fc_left <= VAR_BIN_OP_PLUS_uxn_c_l151_c34_c0fc_left;
     BIN_OP_PLUS_uxn_c_l151_c34_c0fc_right <= VAR_BIN_OP_PLUS_uxn_c_l151_c34_c0fc_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l151_c34_c0fc_return_output := BIN_OP_PLUS_uxn_c_l151_c34_c0fc_return_output;

     -- BIN_OP_PLUS[uxn_c_l150_c25_8d31] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l150_c25_8d31_left <= VAR_BIN_OP_PLUS_uxn_c_l150_c25_8d31_left;
     BIN_OP_PLUS_uxn_c_l150_c25_8d31_right <= VAR_BIN_OP_PLUS_uxn_c_l150_c25_8d31_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l150_c25_8d31_return_output := BIN_OP_PLUS_uxn_c_l150_c25_8d31_return_output;

     -- CONST_SL_8[uxn_c_l146_c54_33d8] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l146_c54_33d8_x <= VAR_CONST_SL_8_uxn_c_l146_c54_33d8_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l146_c54_33d8_return_output := CONST_SL_8_uxn_c_l146_c54_33d8_return_output;

     -- BIN_OP_AND[uxn_c_l154_c27_4bd4] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l154_c27_4bd4_left <= VAR_BIN_OP_AND_uxn_c_l154_c27_4bd4_left;
     BIN_OP_AND_uxn_c_l154_c27_4bd4_right <= VAR_BIN_OP_AND_uxn_c_l154_c27_4bd4_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l154_c27_4bd4_return_output := BIN_OP_AND_uxn_c_l154_c27_4bd4_return_output;

     -- BIN_OP_EQ[uxn_c_l148_c21_daa2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l148_c21_daa2_left <= VAR_BIN_OP_EQ_uxn_c_l148_c21_daa2_left;
     BIN_OP_EQ_uxn_c_l148_c21_daa2_right <= VAR_BIN_OP_EQ_uxn_c_l148_c21_daa2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l148_c21_daa2_return_output := BIN_OP_EQ_uxn_c_l148_c21_daa2_return_output;

     -- UNARY_OP_NOT_uint1_t_uxn_c_l160_l167_DUPLICATE_2cde LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uint1_t_uxn_c_l160_l167_DUPLICATE_2cde_expr <= VAR_UNARY_OP_NOT_uint1_t_uxn_c_l160_l167_DUPLICATE_2cde_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uint1_t_uxn_c_l160_l167_DUPLICATE_2cde_return_output := UNARY_OP_NOT_uint1_t_uxn_c_l160_l167_DUPLICATE_2cde_return_output;

     -- Submodule level 6
     VAR_BIN_OP_OR_uxn_c_l167_c3_4a43_left := VAR_BIN_OP_AND_uxn_c_l154_c27_4bd4_return_output;
     VAR_MUX_uxn_c_l166_c3_c07d_cond := VAR_BIN_OP_AND_uxn_c_l154_c27_4bd4_return_output;
     VAR_MUX_uxn_c_l148_c21_1804_cond := VAR_BIN_OP_EQ_uxn_c_l148_c21_daa2_return_output;
     VAR_MUX_uxn_c_l149_c22_b936_cond := VAR_BIN_OP_EQ_uxn_c_l149_c22_5bbb_return_output;
     VAR_MUX_uxn_c_l150_c6_ca2e_iftrue := resize(VAR_BIN_OP_PLUS_uxn_c_l150_c25_8d31_return_output, 16);
     VAR_MUX_uxn_c_l151_c6_c4dc_iffalse := resize(VAR_BIN_OP_PLUS_uxn_c_l151_c34_c0fc_return_output, 16);
     VAR_BIN_OP_PLUS_uxn_c_l146_c54_77f5_left := VAR_CONST_SL_8_uxn_c_l146_c54_33d8_return_output;
     VAR_BIN_OP_AND_uxn_c_l153_c27_c008_right := VAR_UNARY_OP_NOT_uxn_c_l153_c46_7808_return_output;
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l160_l167_DUPLICATE_d99f_left := VAR_UNARY_OP_NOT_uint1_t_uxn_c_l160_l167_DUPLICATE_2cde_return_output;
     -- BIN_OP_AND[uxn_c_l153_c27_c008] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l153_c27_c008_left <= VAR_BIN_OP_AND_uxn_c_l153_c27_c008_left;
     BIN_OP_AND_uxn_c_l153_c27_c008_right <= VAR_BIN_OP_AND_uxn_c_l153_c27_c008_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l153_c27_c008_return_output := BIN_OP_AND_uxn_c_l153_c27_c008_return_output;

     -- MUX[uxn_c_l166_c3_c07d] LATENCY=0
     -- Inputs
     MUX_uxn_c_l166_c3_c07d_cond <= VAR_MUX_uxn_c_l166_c3_c07d_cond;
     MUX_uxn_c_l166_c3_c07d_iftrue <= VAR_MUX_uxn_c_l166_c3_c07d_iftrue;
     MUX_uxn_c_l166_c3_c07d_iffalse <= VAR_MUX_uxn_c_l166_c3_c07d_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l166_c3_c07d_return_output := MUX_uxn_c_l166_c3_c07d_return_output;

     -- BIN_OP_AND_uint1_t_uint1_t_uxn_c_l160_l167_DUPLICATE_d99f LATENCY=0
     -- Inputs
     BIN_OP_AND_uint1_t_uint1_t_uxn_c_l160_l167_DUPLICATE_d99f_left <= VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l160_l167_DUPLICATE_d99f_left;
     BIN_OP_AND_uint1_t_uint1_t_uxn_c_l160_l167_DUPLICATE_d99f_right <= VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l160_l167_DUPLICATE_d99f_right;
     -- Outputs
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l160_l167_DUPLICATE_d99f_return_output := BIN_OP_AND_uint1_t_uint1_t_uxn_c_l160_l167_DUPLICATE_d99f_return_output;

     -- MUX[uxn_c_l149_c22_b936] LATENCY=0
     -- Inputs
     MUX_uxn_c_l149_c22_b936_cond <= VAR_MUX_uxn_c_l149_c22_b936_cond;
     MUX_uxn_c_l149_c22_b936_iftrue <= VAR_MUX_uxn_c_l149_c22_b936_iftrue;
     MUX_uxn_c_l149_c22_b936_iffalse <= VAR_MUX_uxn_c_l149_c22_b936_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l149_c22_b936_return_output := MUX_uxn_c_l149_c22_b936_return_output;

     -- BIN_OP_PLUS[uxn_c_l146_c54_77f5] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l146_c54_77f5_left <= VAR_BIN_OP_PLUS_uxn_c_l146_c54_77f5_left;
     BIN_OP_PLUS_uxn_c_l146_c54_77f5_right <= VAR_BIN_OP_PLUS_uxn_c_l146_c54_77f5_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l146_c54_77f5_return_output := BIN_OP_PLUS_uxn_c_l146_c54_77f5_return_output;

     -- MUX[uxn_c_l148_c21_1804] LATENCY=0
     -- Inputs
     MUX_uxn_c_l148_c21_1804_cond <= VAR_MUX_uxn_c_l148_c21_1804_cond;
     MUX_uxn_c_l148_c21_1804_iftrue <= VAR_MUX_uxn_c_l148_c21_1804_iftrue;
     MUX_uxn_c_l148_c21_1804_iffalse <= VAR_MUX_uxn_c_l148_c21_1804_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l148_c21_1804_return_output := MUX_uxn_c_l148_c21_1804_return_output;

     -- Submodule level 7
     VAR_BIN_OP_OR_uxn_c_l160_c3_1f64_left := VAR_BIN_OP_AND_uxn_c_l153_c27_c008_return_output;
     VAR_MUX_uxn_c_l159_c3_cedd_cond := VAR_BIN_OP_AND_uxn_c_l153_c27_c008_return_output;
     VAR_BIN_OP_AND_uxn_c_l160_c22_4b60_left := VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l160_l167_DUPLICATE_d99f_return_output;
     VAR_BIN_OP_AND_uxn_c_l167_c22_c15f_left := VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l160_l167_DUPLICATE_d99f_return_output;
     VAR_MUX_uxn_c_l146_c35_8062_iftrue := resize(VAR_BIN_OP_PLUS_uxn_c_l146_c54_77f5_return_output, 16);
     VAR_BIN_OP_AND_uxn_c_l170_c38_df52_left := VAR_MUX_uxn_c_l148_c21_1804_return_output;
     VAR_MUX_uxn_c_l150_c6_ca2e_cond := VAR_MUX_uxn_c_l148_c21_1804_return_output;
     VAR_MUX_uxn_c_l151_c6_c4dc_cond := VAR_MUX_uxn_c_l148_c21_1804_return_output;
     REG_VAR_is_new_fill_row := VAR_MUX_uxn_c_l148_c21_1804_return_output;
     VAR_BIN_OP_AND_uxn_c_l170_c38_df52_right := VAR_MUX_uxn_c_l149_c22_b936_return_output;
     REG_VAR_is_last_fill_col := VAR_MUX_uxn_c_l149_c22_b936_return_output;
     VAR_fg_vram_update_uxn_c_l163_c27_ba53_write_value := VAR_MUX_uxn_c_l166_c3_c07d_return_output;
     -- MUX[uxn_c_l159_c3_cedd] LATENCY=0
     -- Inputs
     MUX_uxn_c_l159_c3_cedd_cond <= VAR_MUX_uxn_c_l159_c3_cedd_cond;
     MUX_uxn_c_l159_c3_cedd_iftrue <= VAR_MUX_uxn_c_l159_c3_cedd_iftrue;
     MUX_uxn_c_l159_c3_cedd_iffalse <= VAR_MUX_uxn_c_l159_c3_cedd_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l159_c3_cedd_return_output := MUX_uxn_c_l159_c3_cedd_return_output;

     -- MUX[uxn_c_l151_c6_c4dc] LATENCY=0
     -- Inputs
     MUX_uxn_c_l151_c6_c4dc_cond <= VAR_MUX_uxn_c_l151_c6_c4dc_cond;
     MUX_uxn_c_l151_c6_c4dc_iftrue <= VAR_MUX_uxn_c_l151_c6_c4dc_iftrue;
     MUX_uxn_c_l151_c6_c4dc_iffalse <= VAR_MUX_uxn_c_l151_c6_c4dc_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l151_c6_c4dc_return_output := MUX_uxn_c_l151_c6_c4dc_return_output;

     -- BIN_OP_AND[uxn_c_l170_c38_df52] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l170_c38_df52_left <= VAR_BIN_OP_AND_uxn_c_l170_c38_df52_left;
     BIN_OP_AND_uxn_c_l170_c38_df52_right <= VAR_BIN_OP_AND_uxn_c_l170_c38_df52_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l170_c38_df52_return_output := BIN_OP_AND_uxn_c_l170_c38_df52_return_output;

     -- BIN_OP_AND[uxn_c_l167_c22_c15f] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l167_c22_c15f_left <= VAR_BIN_OP_AND_uxn_c_l167_c22_c15f_left;
     BIN_OP_AND_uxn_c_l167_c22_c15f_right <= VAR_BIN_OP_AND_uxn_c_l167_c22_c15f_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l167_c22_c15f_return_output := BIN_OP_AND_uxn_c_l167_c22_c15f_return_output;

     -- BIN_OP_AND[uxn_c_l160_c22_4b60] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l160_c22_4b60_left <= VAR_BIN_OP_AND_uxn_c_l160_c22_4b60_left;
     BIN_OP_AND_uxn_c_l160_c22_4b60_right <= VAR_BIN_OP_AND_uxn_c_l160_c22_4b60_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l160_c22_4b60_return_output := BIN_OP_AND_uxn_c_l160_c22_4b60_return_output;

     -- MUX[uxn_c_l146_c35_8062] LATENCY=0
     -- Inputs
     MUX_uxn_c_l146_c35_8062_cond <= VAR_MUX_uxn_c_l146_c35_8062_cond;
     MUX_uxn_c_l146_c35_8062_iftrue <= VAR_MUX_uxn_c_l146_c35_8062_iftrue;
     MUX_uxn_c_l146_c35_8062_iffalse <= VAR_MUX_uxn_c_l146_c35_8062_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l146_c35_8062_return_output := MUX_uxn_c_l146_c35_8062_return_output;

     -- MUX[uxn_c_l150_c6_ca2e] LATENCY=0
     -- Inputs
     MUX_uxn_c_l150_c6_ca2e_cond <= VAR_MUX_uxn_c_l150_c6_ca2e_cond;
     MUX_uxn_c_l150_c6_ca2e_iftrue <= VAR_MUX_uxn_c_l150_c6_ca2e_iftrue;
     MUX_uxn_c_l150_c6_ca2e_iffalse <= VAR_MUX_uxn_c_l150_c6_ca2e_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l150_c6_ca2e_return_output := MUX_uxn_c_l150_c6_ca2e_return_output;

     -- Submodule level 8
     VAR_BIN_OP_OR_uxn_c_l160_c3_1f64_right := VAR_BIN_OP_AND_uxn_c_l160_c22_4b60_return_output;
     VAR_BIN_OP_OR_uxn_c_l167_c3_4a43_right := VAR_BIN_OP_AND_uxn_c_l167_c22_c15f_return_output;
     VAR_UNARY_OP_NOT_uxn_c_l170_c38_08b2_expr := VAR_BIN_OP_AND_uxn_c_l170_c38_df52_return_output;
     VAR_bg_vram_update_uxn_c_l156_c27_8950_write_address := VAR_MUX_uxn_c_l146_c35_8062_return_output;
     VAR_fg_vram_update_uxn_c_l163_c27_ba53_write_address := VAR_MUX_uxn_c_l146_c35_8062_return_output;
     REG_VAR_y := VAR_MUX_uxn_c_l150_c6_ca2e_return_output;
     REG_VAR_x := VAR_MUX_uxn_c_l151_c6_c4dc_return_output;
     VAR_bg_vram_update_uxn_c_l156_c27_8950_write_value := VAR_MUX_uxn_c_l159_c3_cedd_return_output;
     -- UNARY_OP_NOT[uxn_c_l170_c38_08b2] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l170_c38_08b2_expr <= VAR_UNARY_OP_NOT_uxn_c_l170_c38_08b2_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l170_c38_08b2_return_output := UNARY_OP_NOT_uxn_c_l170_c38_08b2_return_output;

     -- BIN_OP_OR[uxn_c_l167_c3_4a43] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l167_c3_4a43_left <= VAR_BIN_OP_OR_uxn_c_l167_c3_4a43_left;
     BIN_OP_OR_uxn_c_l167_c3_4a43_right <= VAR_BIN_OP_OR_uxn_c_l167_c3_4a43_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l167_c3_4a43_return_output := BIN_OP_OR_uxn_c_l167_c3_4a43_return_output;

     -- BIN_OP_OR[uxn_c_l160_c3_1f64] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l160_c3_1f64_left <= VAR_BIN_OP_OR_uxn_c_l160_c3_1f64_left;
     BIN_OP_OR_uxn_c_l160_c3_1f64_right <= VAR_BIN_OP_OR_uxn_c_l160_c3_1f64_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l160_c3_1f64_return_output := BIN_OP_OR_uxn_c_l160_c3_1f64_return_output;

     -- Submodule level 9
     VAR_bg_vram_update_uxn_c_l156_c27_8950_write_enable := VAR_BIN_OP_OR_uxn_c_l160_c3_1f64_return_output;
     VAR_fg_vram_update_uxn_c_l163_c27_ba53_write_enable := VAR_BIN_OP_OR_uxn_c_l167_c3_4a43_return_output;
     VAR_MUX_uxn_c_l170_c19_0341_iftrue := VAR_UNARY_OP_NOT_uxn_c_l170_c38_08b2_return_output;
     -- MUX[uxn_c_l170_c19_0341] LATENCY=0
     -- Inputs
     MUX_uxn_c_l170_c19_0341_cond <= VAR_MUX_uxn_c_l170_c19_0341_cond;
     MUX_uxn_c_l170_c19_0341_iftrue <= VAR_MUX_uxn_c_l170_c19_0341_iftrue;
     MUX_uxn_c_l170_c19_0341_iffalse <= VAR_MUX_uxn_c_l170_c19_0341_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l170_c19_0341_return_output := MUX_uxn_c_l170_c19_0341_return_output;

     -- fg_vram_update[uxn_c_l163_c27_ba53] LATENCY=0
     -- Clock enable
     fg_vram_update_uxn_c_l163_c27_ba53_CLOCK_ENABLE <= VAR_fg_vram_update_uxn_c_l163_c27_ba53_CLOCK_ENABLE;
     -- Inputs
     fg_vram_update_uxn_c_l163_c27_ba53_read_address <= VAR_fg_vram_update_uxn_c_l163_c27_ba53_read_address;
     fg_vram_update_uxn_c_l163_c27_ba53_write_address <= VAR_fg_vram_update_uxn_c_l163_c27_ba53_write_address;
     fg_vram_update_uxn_c_l163_c27_ba53_write_value <= VAR_fg_vram_update_uxn_c_l163_c27_ba53_write_value;
     fg_vram_update_uxn_c_l163_c27_ba53_write_enable <= VAR_fg_vram_update_uxn_c_l163_c27_ba53_write_enable;
     -- Outputs
     VAR_fg_vram_update_uxn_c_l163_c27_ba53_return_output := fg_vram_update_uxn_c_l163_c27_ba53_return_output;

     -- bg_vram_update[uxn_c_l156_c27_8950] LATENCY=0
     -- Clock enable
     bg_vram_update_uxn_c_l156_c27_8950_CLOCK_ENABLE <= VAR_bg_vram_update_uxn_c_l156_c27_8950_CLOCK_ENABLE;
     -- Inputs
     bg_vram_update_uxn_c_l156_c27_8950_read_address <= VAR_bg_vram_update_uxn_c_l156_c27_8950_read_address;
     bg_vram_update_uxn_c_l156_c27_8950_write_address <= VAR_bg_vram_update_uxn_c_l156_c27_8950_write_address;
     bg_vram_update_uxn_c_l156_c27_8950_write_value <= VAR_bg_vram_update_uxn_c_l156_c27_8950_write_value;
     bg_vram_update_uxn_c_l156_c27_8950_write_enable <= VAR_bg_vram_update_uxn_c_l156_c27_8950_write_enable;
     -- Outputs
     VAR_bg_vram_update_uxn_c_l156_c27_8950_return_output := bg_vram_update_uxn_c_l156_c27_8950_return_output;

     -- Submodule level 10
     REG_VAR_is_fill_active := VAR_MUX_uxn_c_l170_c19_0341_return_output;
     VAR_MUX_uxn_c_l173_c17_d13c_iftrue := VAR_bg_vram_update_uxn_c_l156_c27_8950_return_output;
     VAR_BIN_OP_EQ_uxn_c_l173_c17_5770_left := VAR_fg_vram_update_uxn_c_l163_c27_ba53_return_output;
     VAR_MUX_uxn_c_l173_c17_d13c_iffalse := VAR_fg_vram_update_uxn_c_l163_c27_ba53_return_output;
     -- BIN_OP_EQ[uxn_c_l173_c17_5770] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l173_c17_5770_left <= VAR_BIN_OP_EQ_uxn_c_l173_c17_5770_left;
     BIN_OP_EQ_uxn_c_l173_c17_5770_right <= VAR_BIN_OP_EQ_uxn_c_l173_c17_5770_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l173_c17_5770_return_output := BIN_OP_EQ_uxn_c_l173_c17_5770_return_output;

     -- Submodule level 11
     VAR_MUX_uxn_c_l173_c17_d13c_cond := VAR_BIN_OP_EQ_uxn_c_l173_c17_5770_return_output;
     -- MUX[uxn_c_l173_c17_d13c] LATENCY=0
     -- Inputs
     MUX_uxn_c_l173_c17_d13c_cond <= VAR_MUX_uxn_c_l173_c17_d13c_cond;
     MUX_uxn_c_l173_c17_d13c_iftrue <= VAR_MUX_uxn_c_l173_c17_d13c_iftrue;
     MUX_uxn_c_l173_c17_d13c_iffalse <= VAR_MUX_uxn_c_l173_c17_d13c_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l173_c17_d13c_return_output := MUX_uxn_c_l173_c17_d13c_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_269d_uxn_c_l176_l115_DUPLICATE_ecbe LATENCY=0
     VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_269d_uxn_c_l176_l115_DUPLICATE_ecbe_return_output := CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_269d(
     VAR_MUX_uxn_c_l172_c25_904d_return_output,
     VAR_MUX_uxn_c_l173_c17_d13c_return_output,
     VAR_MUX_uxn_c_l170_c19_0341_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_269d_uxn_c_l176_l115_DUPLICATE_ecbe_return_output;
     VAR_return_output := VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_269d_uxn_c_l176_l115_DUPLICATE_ecbe_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_result <= REG_VAR_result;
REG_COMB_fill_x0 <= REG_VAR_fill_x0;
REG_COMB_fill_y0 <= REG_VAR_fill_y0;
REG_COMB_fill_x1 <= REG_VAR_fill_x1;
REG_COMB_fill_y1 <= REG_VAR_fill_y1;
REG_COMB_fill_color <= REG_VAR_fill_color;
REG_COMB_is_new_fill_row <= REG_VAR_is_new_fill_row;
REG_COMB_is_last_fill_col <= REG_VAR_is_last_fill_col;
REG_COMB_is_fill_active <= REG_VAR_is_fill_active;
REG_COMB_fill_layer <= REG_VAR_fill_layer;
REG_COMB_is_fill_top <= REG_VAR_is_fill_top;
REG_COMB_is_fill_left <= REG_VAR_is_fill_left;
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
     fill_x0 <= REG_COMB_fill_x0;
     fill_y0 <= REG_COMB_fill_y0;
     fill_x1 <= REG_COMB_fill_x1;
     fill_y1 <= REG_COMB_fill_y1;
     fill_color <= REG_COMB_fill_color;
     is_new_fill_row <= REG_COMB_is_new_fill_row;
     is_last_fill_col <= REG_COMB_is_last_fill_col;
     is_fill_active <= REG_COMB_is_fill_active;
     fill_layer <= REG_COMB_fill_layer;
     is_fill_top <= REG_COMB_is_fill_top;
     is_fill_left <= REG_COMB_is_fill_left;
     pixel_counter <= REG_COMB_pixel_counter;
     x <= REG_COMB_x;
     y <= REG_COMB_y;
 end if;
 end if;
end process;

end arch;
