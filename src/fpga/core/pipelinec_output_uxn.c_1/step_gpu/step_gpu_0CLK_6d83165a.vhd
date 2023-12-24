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
-- CONST_SR_4[uxn_c_l126_c52_7578]
signal CONST_SR_4_uxn_c_l126_c52_7578_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_c_l126_c52_7578_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_c_l126_c25_8df1]
signal BIN_OP_AND_uxn_c_l126_c25_8df1_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l126_c25_8df1_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l126_c25_8df1_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_c_l129_c22_3827]
signal UNARY_OP_NOT_uxn_c_l129_c22_3827_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l129_c22_3827_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l129_c6_a3e3]
signal BIN_OP_AND_uxn_c_l129_c6_a3e3_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l129_c6_a3e3_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l129_c6_a3e3_return_output : unsigned(0 downto 0);

-- fill_y0_MUX[uxn_c_l129_c2_a5ed]
signal fill_y0_MUX_uxn_c_l129_c2_a5ed_cond : unsigned(0 downto 0);
signal fill_y0_MUX_uxn_c_l129_c2_a5ed_iftrue : unsigned(15 downto 0);
signal fill_y0_MUX_uxn_c_l129_c2_a5ed_iffalse : unsigned(15 downto 0);
signal fill_y0_MUX_uxn_c_l129_c2_a5ed_return_output : unsigned(15 downto 0);

-- fill_x1_MUX[uxn_c_l129_c2_a5ed]
signal fill_x1_MUX_uxn_c_l129_c2_a5ed_cond : unsigned(0 downto 0);
signal fill_x1_MUX_uxn_c_l129_c2_a5ed_iftrue : unsigned(15 downto 0);
signal fill_x1_MUX_uxn_c_l129_c2_a5ed_iffalse : unsigned(15 downto 0);
signal fill_x1_MUX_uxn_c_l129_c2_a5ed_return_output : unsigned(15 downto 0);

-- fill_y1_MUX[uxn_c_l129_c2_a5ed]
signal fill_y1_MUX_uxn_c_l129_c2_a5ed_cond : unsigned(0 downto 0);
signal fill_y1_MUX_uxn_c_l129_c2_a5ed_iftrue : unsigned(15 downto 0);
signal fill_y1_MUX_uxn_c_l129_c2_a5ed_iffalse : unsigned(15 downto 0);
signal fill_y1_MUX_uxn_c_l129_c2_a5ed_return_output : unsigned(15 downto 0);

-- fill_color_MUX[uxn_c_l129_c2_a5ed]
signal fill_color_MUX_uxn_c_l129_c2_a5ed_cond : unsigned(0 downto 0);
signal fill_color_MUX_uxn_c_l129_c2_a5ed_iftrue : unsigned(1 downto 0);
signal fill_color_MUX_uxn_c_l129_c2_a5ed_iffalse : unsigned(1 downto 0);
signal fill_color_MUX_uxn_c_l129_c2_a5ed_return_output : unsigned(1 downto 0);

-- y_MUX[uxn_c_l129_c2_a5ed]
signal y_MUX_uxn_c_l129_c2_a5ed_cond : unsigned(0 downto 0);
signal y_MUX_uxn_c_l129_c2_a5ed_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_c_l129_c2_a5ed_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_c_l129_c2_a5ed_return_output : unsigned(15 downto 0);

-- fill_x0_MUX[uxn_c_l129_c2_a5ed]
signal fill_x0_MUX_uxn_c_l129_c2_a5ed_cond : unsigned(0 downto 0);
signal fill_x0_MUX_uxn_c_l129_c2_a5ed_iftrue : unsigned(15 downto 0);
signal fill_x0_MUX_uxn_c_l129_c2_a5ed_iffalse : unsigned(15 downto 0);
signal fill_x0_MUX_uxn_c_l129_c2_a5ed_return_output : unsigned(15 downto 0);

-- is_fill_active_MUX[uxn_c_l129_c2_a5ed]
signal is_fill_active_MUX_uxn_c_l129_c2_a5ed_cond : unsigned(0 downto 0);
signal is_fill_active_MUX_uxn_c_l129_c2_a5ed_iftrue : unsigned(0 downto 0);
signal is_fill_active_MUX_uxn_c_l129_c2_a5ed_iffalse : unsigned(0 downto 0);
signal is_fill_active_MUX_uxn_c_l129_c2_a5ed_return_output : unsigned(0 downto 0);

-- is_fill_top_MUX[uxn_c_l129_c2_a5ed]
signal is_fill_top_MUX_uxn_c_l129_c2_a5ed_cond : unsigned(0 downto 0);
signal is_fill_top_MUX_uxn_c_l129_c2_a5ed_iftrue : unsigned(0 downto 0);
signal is_fill_top_MUX_uxn_c_l129_c2_a5ed_iffalse : unsigned(0 downto 0);
signal is_fill_top_MUX_uxn_c_l129_c2_a5ed_return_output : unsigned(0 downto 0);

-- fill_layer_MUX[uxn_c_l129_c2_a5ed]
signal fill_layer_MUX_uxn_c_l129_c2_a5ed_cond : unsigned(0 downto 0);
signal fill_layer_MUX_uxn_c_l129_c2_a5ed_iftrue : unsigned(0 downto 0);
signal fill_layer_MUX_uxn_c_l129_c2_a5ed_iffalse : unsigned(0 downto 0);
signal fill_layer_MUX_uxn_c_l129_c2_a5ed_return_output : unsigned(0 downto 0);

-- is_fill_left_MUX[uxn_c_l129_c2_a5ed]
signal is_fill_left_MUX_uxn_c_l129_c2_a5ed_cond : unsigned(0 downto 0);
signal is_fill_left_MUX_uxn_c_l129_c2_a5ed_iftrue : unsigned(0 downto 0);
signal is_fill_left_MUX_uxn_c_l129_c2_a5ed_iffalse : unsigned(0 downto 0);
signal is_fill_left_MUX_uxn_c_l129_c2_a5ed_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_c_l129_c2_a5ed]
signal x_MUX_uxn_c_l129_c2_a5ed_cond : unsigned(0 downto 0);
signal x_MUX_uxn_c_l129_c2_a5ed_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_c_l129_c2_a5ed_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_c_l129_c2_a5ed_return_output : unsigned(15 downto 0);

-- CONST_SR_2[uxn_c_l131_c20_5f5f]
signal CONST_SR_2_uxn_c_l131_c20_5f5f_x : unsigned(7 downto 0);
signal CONST_SR_2_uxn_c_l131_c20_5f5f_return_output : unsigned(7 downto 0);

-- CONST_SR_3[uxn_c_l132_c18_f6e7]
signal CONST_SR_3_uxn_c_l132_c18_f6e7_x : unsigned(7 downto 0);
signal CONST_SR_3_uxn_c_l132_c18_f6e7_return_output : unsigned(7 downto 0);

-- MUX[uxn_c_l133_c13_5b62]
signal MUX_uxn_c_l133_c13_5b62_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l133_c13_5b62_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l133_c13_5b62_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l133_c13_5b62_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_c_l134_c28_6042]
signal BIN_OP_AND_uxn_c_l134_c28_6042_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l134_c28_6042_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l134_c28_6042_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l134_c13_65ca]
signal MUX_uxn_c_l134_c13_65ca_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l134_c13_65ca_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l134_c13_65ca_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l134_c13_65ca_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l135_c13_affa]
signal MUX_uxn_c_l135_c13_affa_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l135_c13_affa_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l135_c13_affa_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l135_c13_affa_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_c_l136_c32_36a2]
signal BIN_OP_AND_uxn_c_l136_c32_36a2_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l136_c32_36a2_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l136_c32_36a2_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l136_c13_041b]
signal MUX_uxn_c_l136_c13_041b_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l136_c13_041b_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l136_c13_041b_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l136_c13_041b_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_c_l146_c54_4256]
signal CONST_SL_8_uxn_c_l146_c54_4256_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_c_l146_c54_4256_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_c_l146_c54_171a]
signal BIN_OP_PLUS_uxn_c_l146_c54_171a_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l146_c54_171a_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l146_c54_171a_return_output : unsigned(16 downto 0);

-- MUX[uxn_c_l146_c35_49fa]
signal MUX_uxn_c_l146_c35_49fa_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l146_c35_49fa_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l146_c35_49fa_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l146_c35_49fa_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l148_c21_bff5]
signal BIN_OP_EQ_uxn_c_l148_c21_bff5_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l148_c21_bff5_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l148_c21_bff5_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l148_c21_7ed1]
signal MUX_uxn_c_l148_c21_7ed1_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l148_c21_7ed1_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l148_c21_7ed1_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l148_c21_7ed1_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l149_c22_10c0]
signal BIN_OP_EQ_uxn_c_l149_c22_10c0_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l149_c22_10c0_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l149_c22_10c0_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l149_c22_a21e]
signal MUX_uxn_c_l149_c22_a21e_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l149_c22_a21e_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l149_c22_a21e_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l149_c22_a21e_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l150_c25_5f53]
signal BIN_OP_PLUS_uxn_c_l150_c25_5f53_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l150_c25_5f53_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l150_c25_5f53_return_output : unsigned(16 downto 0);

-- MUX[uxn_c_l150_c6_2754]
signal MUX_uxn_c_l150_c6_2754_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l150_c6_2754_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l150_c6_2754_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l150_c6_2754_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_c_l151_c34_07c4]
signal BIN_OP_PLUS_uxn_c_l151_c34_07c4_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l151_c34_07c4_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l151_c34_07c4_return_output : unsigned(16 downto 0);

-- MUX[uxn_c_l151_c6_f7f0]
signal MUX_uxn_c_l151_c6_f7f0_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l151_c6_f7f0_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l151_c6_f7f0_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l151_c6_f7f0_return_output : unsigned(15 downto 0);

-- UNARY_OP_NOT[uxn_c_l153_c46_7452]
signal UNARY_OP_NOT_uxn_c_l153_c46_7452_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l153_c46_7452_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l153_c27_e25b]
signal BIN_OP_AND_uxn_c_l153_c27_e25b_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l153_c27_e25b_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l153_c27_e25b_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l154_c27_1a7e]
signal BIN_OP_AND_uxn_c_l154_c27_1a7e_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l154_c27_1a7e_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l154_c27_1a7e_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l159_c3_82b7]
signal MUX_uxn_c_l159_c3_82b7_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l159_c3_82b7_iftrue : unsigned(1 downto 0);
signal MUX_uxn_c_l159_c3_82b7_iffalse : unsigned(1 downto 0);
signal MUX_uxn_c_l159_c3_82b7_return_output : unsigned(1 downto 0);

-- UNARY_OP_NOT[uxn_c_l160_c57_9561]
signal UNARY_OP_NOT_uxn_c_l160_c57_9561_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l160_c57_9561_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l160_c22_77a8]
signal BIN_OP_AND_uxn_c_l160_c22_77a8_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l160_c22_77a8_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l160_c22_77a8_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_c_l160_c3_38ed]
signal BIN_OP_OR_uxn_c_l160_c3_38ed_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l160_c3_38ed_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l160_c3_38ed_return_output : unsigned(0 downto 0);

-- bg_vram_update[uxn_c_l156_c27_b8ef]
signal bg_vram_update_uxn_c_l156_c27_b8ef_CLOCK_ENABLE : unsigned(0 downto 0);
signal bg_vram_update_uxn_c_l156_c27_b8ef_read_address : unsigned(15 downto 0);
signal bg_vram_update_uxn_c_l156_c27_b8ef_write_address : unsigned(15 downto 0);
signal bg_vram_update_uxn_c_l156_c27_b8ef_write_value : unsigned(1 downto 0);
signal bg_vram_update_uxn_c_l156_c27_b8ef_write_enable : unsigned(0 downto 0);
signal bg_vram_update_uxn_c_l156_c27_b8ef_return_output : unsigned(1 downto 0);

-- MUX[uxn_c_l166_c3_1ad6]
signal MUX_uxn_c_l166_c3_1ad6_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l166_c3_1ad6_iftrue : unsigned(1 downto 0);
signal MUX_uxn_c_l166_c3_1ad6_iffalse : unsigned(1 downto 0);
signal MUX_uxn_c_l166_c3_1ad6_return_output : unsigned(1 downto 0);

-- BIN_OP_AND[uxn_c_l167_c22_b8e9]
signal BIN_OP_AND_uxn_c_l167_c22_b8e9_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l167_c22_b8e9_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l167_c22_b8e9_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_c_l167_c3_977a]
signal BIN_OP_OR_uxn_c_l167_c3_977a_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l167_c3_977a_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l167_c3_977a_return_output : unsigned(0 downto 0);

-- fg_vram_update[uxn_c_l163_c27_a092]
signal fg_vram_update_uxn_c_l163_c27_a092_CLOCK_ENABLE : unsigned(0 downto 0);
signal fg_vram_update_uxn_c_l163_c27_a092_read_address : unsigned(15 downto 0);
signal fg_vram_update_uxn_c_l163_c27_a092_write_address : unsigned(15 downto 0);
signal fg_vram_update_uxn_c_l163_c27_a092_write_value : unsigned(1 downto 0);
signal fg_vram_update_uxn_c_l163_c27_a092_write_enable : unsigned(0 downto 0);
signal fg_vram_update_uxn_c_l163_c27_a092_return_output : unsigned(1 downto 0);

-- BIN_OP_AND[uxn_c_l170_c38_628b]
signal BIN_OP_AND_uxn_c_l170_c38_628b_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l170_c38_628b_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l170_c38_628b_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_c_l170_c38_3853]
signal UNARY_OP_NOT_uxn_c_l170_c38_3853_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l170_c38_3853_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l170_c19_ee4c]
signal MUX_uxn_c_l170_c19_ee4c_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l170_c19_ee4c_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l170_c19_ee4c_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l170_c19_ee4c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l171_c19_c06e]
signal BIN_OP_EQ_uxn_c_l171_c19_c06e_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l171_c19_c06e_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l171_c19_c06e_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l171_c76_39c3]
signal BIN_OP_PLUS_uxn_c_l171_c76_39c3_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l171_c76_39c3_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l171_c76_39c3_return_output : unsigned(16 downto 0);

-- MUX[uxn_c_l171_c50_3ee3]
signal MUX_uxn_c_l171_c50_3ee3_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l171_c50_3ee3_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l171_c50_3ee3_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l171_c50_3ee3_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l171_c19_644d]
signal MUX_uxn_c_l171_c19_644d_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l171_c19_644d_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l171_c19_644d_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l171_c19_644d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l172_c25_b088]
signal BIN_OP_EQ_uxn_c_l172_c25_b088_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l172_c25_b088_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l172_c25_b088_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l172_c25_d227]
signal MUX_uxn_c_l172_c25_d227_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l172_c25_d227_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l172_c25_d227_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l172_c25_d227_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l173_c17_acd6]
signal BIN_OP_EQ_uxn_c_l173_c17_acd6_left : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l173_c17_acd6_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l173_c17_acd6_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l173_c17_551e]
signal MUX_uxn_c_l173_c17_551e_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l173_c17_551e_iftrue : unsigned(1 downto 0);
signal MUX_uxn_c_l173_c17_551e_iffalse : unsigned(1 downto 0);
signal MUX_uxn_c_l173_c17_551e_return_output : unsigned(1 downto 0);

-- CONST_SR_8_uint16_t_uxn_c_l133_l135_DUPLICATE_351a
signal CONST_SR_8_uint16_t_uxn_c_l133_l135_DUPLICATE_351a_x : unsigned(15 downto 0);
signal CONST_SR_8_uint16_t_uxn_c_l133_l135_DUPLICATE_351a_return_output : unsigned(15 downto 0);

-- UNARY_OP_NOT_uint1_t_uxn_c_l160_l167_DUPLICATE_64bd
signal UNARY_OP_NOT_uint1_t_uxn_c_l160_l167_DUPLICATE_64bd_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uint1_t_uxn_c_l160_l167_DUPLICATE_64bd_return_output : unsigned(0 downto 0);

-- BIN_OP_AND_uint1_t_uint1_t_uxn_c_l160_l167_DUPLICATE_4326
signal BIN_OP_AND_uint1_t_uint1_t_uxn_c_l160_l167_DUPLICATE_4326_left : unsigned(0 downto 0);
signal BIN_OP_AND_uint1_t_uint1_t_uxn_c_l160_l167_DUPLICATE_4326_right : unsigned(0 downto 0);
signal BIN_OP_AND_uint1_t_uint1_t_uxn_c_l160_l167_DUPLICATE_4326_return_output : unsigned(0 downto 0);

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
-- CONST_SR_4_uxn_c_l126_c52_7578
CONST_SR_4_uxn_c_l126_c52_7578 : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_c_l126_c52_7578_x,
CONST_SR_4_uxn_c_l126_c52_7578_return_output);

-- BIN_OP_AND_uxn_c_l126_c25_8df1
BIN_OP_AND_uxn_c_l126_c25_8df1 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l126_c25_8df1_left,
BIN_OP_AND_uxn_c_l126_c25_8df1_right,
BIN_OP_AND_uxn_c_l126_c25_8df1_return_output);

-- UNARY_OP_NOT_uxn_c_l129_c22_3827
UNARY_OP_NOT_uxn_c_l129_c22_3827 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l129_c22_3827_expr,
UNARY_OP_NOT_uxn_c_l129_c22_3827_return_output);

-- BIN_OP_AND_uxn_c_l129_c6_a3e3
BIN_OP_AND_uxn_c_l129_c6_a3e3 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l129_c6_a3e3_left,
BIN_OP_AND_uxn_c_l129_c6_a3e3_right,
BIN_OP_AND_uxn_c_l129_c6_a3e3_return_output);

-- fill_y0_MUX_uxn_c_l129_c2_a5ed
fill_y0_MUX_uxn_c_l129_c2_a5ed : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_y0_MUX_uxn_c_l129_c2_a5ed_cond,
fill_y0_MUX_uxn_c_l129_c2_a5ed_iftrue,
fill_y0_MUX_uxn_c_l129_c2_a5ed_iffalse,
fill_y0_MUX_uxn_c_l129_c2_a5ed_return_output);

-- fill_x1_MUX_uxn_c_l129_c2_a5ed
fill_x1_MUX_uxn_c_l129_c2_a5ed : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_x1_MUX_uxn_c_l129_c2_a5ed_cond,
fill_x1_MUX_uxn_c_l129_c2_a5ed_iftrue,
fill_x1_MUX_uxn_c_l129_c2_a5ed_iffalse,
fill_x1_MUX_uxn_c_l129_c2_a5ed_return_output);

-- fill_y1_MUX_uxn_c_l129_c2_a5ed
fill_y1_MUX_uxn_c_l129_c2_a5ed : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_y1_MUX_uxn_c_l129_c2_a5ed_cond,
fill_y1_MUX_uxn_c_l129_c2_a5ed_iftrue,
fill_y1_MUX_uxn_c_l129_c2_a5ed_iffalse,
fill_y1_MUX_uxn_c_l129_c2_a5ed_return_output);

-- fill_color_MUX_uxn_c_l129_c2_a5ed
fill_color_MUX_uxn_c_l129_c2_a5ed : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
fill_color_MUX_uxn_c_l129_c2_a5ed_cond,
fill_color_MUX_uxn_c_l129_c2_a5ed_iftrue,
fill_color_MUX_uxn_c_l129_c2_a5ed_iffalse,
fill_color_MUX_uxn_c_l129_c2_a5ed_return_output);

-- y_MUX_uxn_c_l129_c2_a5ed
y_MUX_uxn_c_l129_c2_a5ed : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_c_l129_c2_a5ed_cond,
y_MUX_uxn_c_l129_c2_a5ed_iftrue,
y_MUX_uxn_c_l129_c2_a5ed_iffalse,
y_MUX_uxn_c_l129_c2_a5ed_return_output);

-- fill_x0_MUX_uxn_c_l129_c2_a5ed
fill_x0_MUX_uxn_c_l129_c2_a5ed : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_x0_MUX_uxn_c_l129_c2_a5ed_cond,
fill_x0_MUX_uxn_c_l129_c2_a5ed_iftrue,
fill_x0_MUX_uxn_c_l129_c2_a5ed_iffalse,
fill_x0_MUX_uxn_c_l129_c2_a5ed_return_output);

-- is_fill_active_MUX_uxn_c_l129_c2_a5ed
is_fill_active_MUX_uxn_c_l129_c2_a5ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_active_MUX_uxn_c_l129_c2_a5ed_cond,
is_fill_active_MUX_uxn_c_l129_c2_a5ed_iftrue,
is_fill_active_MUX_uxn_c_l129_c2_a5ed_iffalse,
is_fill_active_MUX_uxn_c_l129_c2_a5ed_return_output);

-- is_fill_top_MUX_uxn_c_l129_c2_a5ed
is_fill_top_MUX_uxn_c_l129_c2_a5ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_top_MUX_uxn_c_l129_c2_a5ed_cond,
is_fill_top_MUX_uxn_c_l129_c2_a5ed_iftrue,
is_fill_top_MUX_uxn_c_l129_c2_a5ed_iffalse,
is_fill_top_MUX_uxn_c_l129_c2_a5ed_return_output);

-- fill_layer_MUX_uxn_c_l129_c2_a5ed
fill_layer_MUX_uxn_c_l129_c2_a5ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
fill_layer_MUX_uxn_c_l129_c2_a5ed_cond,
fill_layer_MUX_uxn_c_l129_c2_a5ed_iftrue,
fill_layer_MUX_uxn_c_l129_c2_a5ed_iffalse,
fill_layer_MUX_uxn_c_l129_c2_a5ed_return_output);

-- is_fill_left_MUX_uxn_c_l129_c2_a5ed
is_fill_left_MUX_uxn_c_l129_c2_a5ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_left_MUX_uxn_c_l129_c2_a5ed_cond,
is_fill_left_MUX_uxn_c_l129_c2_a5ed_iftrue,
is_fill_left_MUX_uxn_c_l129_c2_a5ed_iffalse,
is_fill_left_MUX_uxn_c_l129_c2_a5ed_return_output);

-- x_MUX_uxn_c_l129_c2_a5ed
x_MUX_uxn_c_l129_c2_a5ed : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_c_l129_c2_a5ed_cond,
x_MUX_uxn_c_l129_c2_a5ed_iftrue,
x_MUX_uxn_c_l129_c2_a5ed_iffalse,
x_MUX_uxn_c_l129_c2_a5ed_return_output);

-- CONST_SR_2_uxn_c_l131_c20_5f5f
CONST_SR_2_uxn_c_l131_c20_5f5f : entity work.CONST_SR_2_uint8_t_0CLK_de264c78 port map (
CONST_SR_2_uxn_c_l131_c20_5f5f_x,
CONST_SR_2_uxn_c_l131_c20_5f5f_return_output);

-- CONST_SR_3_uxn_c_l132_c18_f6e7
CONST_SR_3_uxn_c_l132_c18_f6e7 : entity work.CONST_SR_3_uint8_t_0CLK_de264c78 port map (
CONST_SR_3_uxn_c_l132_c18_f6e7_x,
CONST_SR_3_uxn_c_l132_c18_f6e7_return_output);

-- MUX_uxn_c_l133_c13_5b62
MUX_uxn_c_l133_c13_5b62 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l133_c13_5b62_cond,
MUX_uxn_c_l133_c13_5b62_iftrue,
MUX_uxn_c_l133_c13_5b62_iffalse,
MUX_uxn_c_l133_c13_5b62_return_output);

-- BIN_OP_AND_uxn_c_l134_c28_6042
BIN_OP_AND_uxn_c_l134_c28_6042 : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l134_c28_6042_left,
BIN_OP_AND_uxn_c_l134_c28_6042_right,
BIN_OP_AND_uxn_c_l134_c28_6042_return_output);

-- MUX_uxn_c_l134_c13_65ca
MUX_uxn_c_l134_c13_65ca : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l134_c13_65ca_cond,
MUX_uxn_c_l134_c13_65ca_iftrue,
MUX_uxn_c_l134_c13_65ca_iffalse,
MUX_uxn_c_l134_c13_65ca_return_output);

-- MUX_uxn_c_l135_c13_affa
MUX_uxn_c_l135_c13_affa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l135_c13_affa_cond,
MUX_uxn_c_l135_c13_affa_iftrue,
MUX_uxn_c_l135_c13_affa_iffalse,
MUX_uxn_c_l135_c13_affa_return_output);

-- BIN_OP_AND_uxn_c_l136_c32_36a2
BIN_OP_AND_uxn_c_l136_c32_36a2 : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l136_c32_36a2_left,
BIN_OP_AND_uxn_c_l136_c32_36a2_right,
BIN_OP_AND_uxn_c_l136_c32_36a2_return_output);

-- MUX_uxn_c_l136_c13_041b
MUX_uxn_c_l136_c13_041b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l136_c13_041b_cond,
MUX_uxn_c_l136_c13_041b_iftrue,
MUX_uxn_c_l136_c13_041b_iffalse,
MUX_uxn_c_l136_c13_041b_return_output);

-- CONST_SL_8_uxn_c_l146_c54_4256
CONST_SL_8_uxn_c_l146_c54_4256 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l146_c54_4256_x,
CONST_SL_8_uxn_c_l146_c54_4256_return_output);

-- BIN_OP_PLUS_uxn_c_l146_c54_171a
BIN_OP_PLUS_uxn_c_l146_c54_171a : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l146_c54_171a_left,
BIN_OP_PLUS_uxn_c_l146_c54_171a_right,
BIN_OP_PLUS_uxn_c_l146_c54_171a_return_output);

-- MUX_uxn_c_l146_c35_49fa
MUX_uxn_c_l146_c35_49fa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l146_c35_49fa_cond,
MUX_uxn_c_l146_c35_49fa_iftrue,
MUX_uxn_c_l146_c35_49fa_iffalse,
MUX_uxn_c_l146_c35_49fa_return_output);

-- BIN_OP_EQ_uxn_c_l148_c21_bff5
BIN_OP_EQ_uxn_c_l148_c21_bff5 : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l148_c21_bff5_left,
BIN_OP_EQ_uxn_c_l148_c21_bff5_right,
BIN_OP_EQ_uxn_c_l148_c21_bff5_return_output);

-- MUX_uxn_c_l148_c21_7ed1
MUX_uxn_c_l148_c21_7ed1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l148_c21_7ed1_cond,
MUX_uxn_c_l148_c21_7ed1_iftrue,
MUX_uxn_c_l148_c21_7ed1_iffalse,
MUX_uxn_c_l148_c21_7ed1_return_output);

-- BIN_OP_EQ_uxn_c_l149_c22_10c0
BIN_OP_EQ_uxn_c_l149_c22_10c0 : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l149_c22_10c0_left,
BIN_OP_EQ_uxn_c_l149_c22_10c0_right,
BIN_OP_EQ_uxn_c_l149_c22_10c0_return_output);

-- MUX_uxn_c_l149_c22_a21e
MUX_uxn_c_l149_c22_a21e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l149_c22_a21e_cond,
MUX_uxn_c_l149_c22_a21e_iftrue,
MUX_uxn_c_l149_c22_a21e_iffalse,
MUX_uxn_c_l149_c22_a21e_return_output);

-- BIN_OP_PLUS_uxn_c_l150_c25_5f53
BIN_OP_PLUS_uxn_c_l150_c25_5f53 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l150_c25_5f53_left,
BIN_OP_PLUS_uxn_c_l150_c25_5f53_right,
BIN_OP_PLUS_uxn_c_l150_c25_5f53_return_output);

-- MUX_uxn_c_l150_c6_2754
MUX_uxn_c_l150_c6_2754 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l150_c6_2754_cond,
MUX_uxn_c_l150_c6_2754_iftrue,
MUX_uxn_c_l150_c6_2754_iffalse,
MUX_uxn_c_l150_c6_2754_return_output);

-- BIN_OP_PLUS_uxn_c_l151_c34_07c4
BIN_OP_PLUS_uxn_c_l151_c34_07c4 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l151_c34_07c4_left,
BIN_OP_PLUS_uxn_c_l151_c34_07c4_right,
BIN_OP_PLUS_uxn_c_l151_c34_07c4_return_output);

-- MUX_uxn_c_l151_c6_f7f0
MUX_uxn_c_l151_c6_f7f0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l151_c6_f7f0_cond,
MUX_uxn_c_l151_c6_f7f0_iftrue,
MUX_uxn_c_l151_c6_f7f0_iffalse,
MUX_uxn_c_l151_c6_f7f0_return_output);

-- UNARY_OP_NOT_uxn_c_l153_c46_7452
UNARY_OP_NOT_uxn_c_l153_c46_7452 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l153_c46_7452_expr,
UNARY_OP_NOT_uxn_c_l153_c46_7452_return_output);

-- BIN_OP_AND_uxn_c_l153_c27_e25b
BIN_OP_AND_uxn_c_l153_c27_e25b : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l153_c27_e25b_left,
BIN_OP_AND_uxn_c_l153_c27_e25b_right,
BIN_OP_AND_uxn_c_l153_c27_e25b_return_output);

-- BIN_OP_AND_uxn_c_l154_c27_1a7e
BIN_OP_AND_uxn_c_l154_c27_1a7e : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l154_c27_1a7e_left,
BIN_OP_AND_uxn_c_l154_c27_1a7e_right,
BIN_OP_AND_uxn_c_l154_c27_1a7e_return_output);

-- MUX_uxn_c_l159_c3_82b7
MUX_uxn_c_l159_c3_82b7 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
MUX_uxn_c_l159_c3_82b7_cond,
MUX_uxn_c_l159_c3_82b7_iftrue,
MUX_uxn_c_l159_c3_82b7_iffalse,
MUX_uxn_c_l159_c3_82b7_return_output);

-- UNARY_OP_NOT_uxn_c_l160_c57_9561
UNARY_OP_NOT_uxn_c_l160_c57_9561 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l160_c57_9561_expr,
UNARY_OP_NOT_uxn_c_l160_c57_9561_return_output);

-- BIN_OP_AND_uxn_c_l160_c22_77a8
BIN_OP_AND_uxn_c_l160_c22_77a8 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l160_c22_77a8_left,
BIN_OP_AND_uxn_c_l160_c22_77a8_right,
BIN_OP_AND_uxn_c_l160_c22_77a8_return_output);

-- BIN_OP_OR_uxn_c_l160_c3_38ed
BIN_OP_OR_uxn_c_l160_c3_38ed : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l160_c3_38ed_left,
BIN_OP_OR_uxn_c_l160_c3_38ed_right,
BIN_OP_OR_uxn_c_l160_c3_38ed_return_output);

-- bg_vram_update_uxn_c_l156_c27_b8ef
bg_vram_update_uxn_c_l156_c27_b8ef : entity work.bg_vram_update_0CLK_6f2c5aad port map (
clk,
bg_vram_update_uxn_c_l156_c27_b8ef_CLOCK_ENABLE,
bg_vram_update_uxn_c_l156_c27_b8ef_read_address,
bg_vram_update_uxn_c_l156_c27_b8ef_write_address,
bg_vram_update_uxn_c_l156_c27_b8ef_write_value,
bg_vram_update_uxn_c_l156_c27_b8ef_write_enable,
bg_vram_update_uxn_c_l156_c27_b8ef_return_output);

-- MUX_uxn_c_l166_c3_1ad6
MUX_uxn_c_l166_c3_1ad6 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
MUX_uxn_c_l166_c3_1ad6_cond,
MUX_uxn_c_l166_c3_1ad6_iftrue,
MUX_uxn_c_l166_c3_1ad6_iffalse,
MUX_uxn_c_l166_c3_1ad6_return_output);

-- BIN_OP_AND_uxn_c_l167_c22_b8e9
BIN_OP_AND_uxn_c_l167_c22_b8e9 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l167_c22_b8e9_left,
BIN_OP_AND_uxn_c_l167_c22_b8e9_right,
BIN_OP_AND_uxn_c_l167_c22_b8e9_return_output);

-- BIN_OP_OR_uxn_c_l167_c3_977a
BIN_OP_OR_uxn_c_l167_c3_977a : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l167_c3_977a_left,
BIN_OP_OR_uxn_c_l167_c3_977a_right,
BIN_OP_OR_uxn_c_l167_c3_977a_return_output);

-- fg_vram_update_uxn_c_l163_c27_a092
fg_vram_update_uxn_c_l163_c27_a092 : entity work.fg_vram_update_0CLK_6f2c5aad port map (
clk,
fg_vram_update_uxn_c_l163_c27_a092_CLOCK_ENABLE,
fg_vram_update_uxn_c_l163_c27_a092_read_address,
fg_vram_update_uxn_c_l163_c27_a092_write_address,
fg_vram_update_uxn_c_l163_c27_a092_write_value,
fg_vram_update_uxn_c_l163_c27_a092_write_enable,
fg_vram_update_uxn_c_l163_c27_a092_return_output);

-- BIN_OP_AND_uxn_c_l170_c38_628b
BIN_OP_AND_uxn_c_l170_c38_628b : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l170_c38_628b_left,
BIN_OP_AND_uxn_c_l170_c38_628b_right,
BIN_OP_AND_uxn_c_l170_c38_628b_return_output);

-- UNARY_OP_NOT_uxn_c_l170_c38_3853
UNARY_OP_NOT_uxn_c_l170_c38_3853 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l170_c38_3853_expr,
UNARY_OP_NOT_uxn_c_l170_c38_3853_return_output);

-- MUX_uxn_c_l170_c19_ee4c
MUX_uxn_c_l170_c19_ee4c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l170_c19_ee4c_cond,
MUX_uxn_c_l170_c19_ee4c_iftrue,
MUX_uxn_c_l170_c19_ee4c_iffalse,
MUX_uxn_c_l170_c19_ee4c_return_output);

-- BIN_OP_EQ_uxn_c_l171_c19_c06e
BIN_OP_EQ_uxn_c_l171_c19_c06e : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l171_c19_c06e_left,
BIN_OP_EQ_uxn_c_l171_c19_c06e_right,
BIN_OP_EQ_uxn_c_l171_c19_c06e_return_output);

-- BIN_OP_PLUS_uxn_c_l171_c76_39c3
BIN_OP_PLUS_uxn_c_l171_c76_39c3 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l171_c76_39c3_left,
BIN_OP_PLUS_uxn_c_l171_c76_39c3_right,
BIN_OP_PLUS_uxn_c_l171_c76_39c3_return_output);

-- MUX_uxn_c_l171_c50_3ee3
MUX_uxn_c_l171_c50_3ee3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l171_c50_3ee3_cond,
MUX_uxn_c_l171_c50_3ee3_iftrue,
MUX_uxn_c_l171_c50_3ee3_iffalse,
MUX_uxn_c_l171_c50_3ee3_return_output);

-- MUX_uxn_c_l171_c19_644d
MUX_uxn_c_l171_c19_644d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l171_c19_644d_cond,
MUX_uxn_c_l171_c19_644d_iftrue,
MUX_uxn_c_l171_c19_644d_iffalse,
MUX_uxn_c_l171_c19_644d_return_output);

-- BIN_OP_EQ_uxn_c_l172_c25_b088
BIN_OP_EQ_uxn_c_l172_c25_b088 : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l172_c25_b088_left,
BIN_OP_EQ_uxn_c_l172_c25_b088_right,
BIN_OP_EQ_uxn_c_l172_c25_b088_return_output);

-- MUX_uxn_c_l172_c25_d227
MUX_uxn_c_l172_c25_d227 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l172_c25_d227_cond,
MUX_uxn_c_l172_c25_d227_iftrue,
MUX_uxn_c_l172_c25_d227_iffalse,
MUX_uxn_c_l172_c25_d227_return_output);

-- BIN_OP_EQ_uxn_c_l173_c17_acd6
BIN_OP_EQ_uxn_c_l173_c17_acd6 : entity work.BIN_OP_EQ_uint2_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l173_c17_acd6_left,
BIN_OP_EQ_uxn_c_l173_c17_acd6_right,
BIN_OP_EQ_uxn_c_l173_c17_acd6_return_output);

-- MUX_uxn_c_l173_c17_551e
MUX_uxn_c_l173_c17_551e : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
MUX_uxn_c_l173_c17_551e_cond,
MUX_uxn_c_l173_c17_551e_iftrue,
MUX_uxn_c_l173_c17_551e_iffalse,
MUX_uxn_c_l173_c17_551e_return_output);

-- CONST_SR_8_uint16_t_uxn_c_l133_l135_DUPLICATE_351a
CONST_SR_8_uint16_t_uxn_c_l133_l135_DUPLICATE_351a : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uint16_t_uxn_c_l133_l135_DUPLICATE_351a_x,
CONST_SR_8_uint16_t_uxn_c_l133_l135_DUPLICATE_351a_return_output);

-- UNARY_OP_NOT_uint1_t_uxn_c_l160_l167_DUPLICATE_64bd
UNARY_OP_NOT_uint1_t_uxn_c_l160_l167_DUPLICATE_64bd : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uint1_t_uxn_c_l160_l167_DUPLICATE_64bd_expr,
UNARY_OP_NOT_uint1_t_uxn_c_l160_l167_DUPLICATE_64bd_return_output);

-- BIN_OP_AND_uint1_t_uint1_t_uxn_c_l160_l167_DUPLICATE_4326
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l160_l167_DUPLICATE_4326 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l160_l167_DUPLICATE_4326_left,
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l160_l167_DUPLICATE_4326_right,
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l160_l167_DUPLICATE_4326_return_output);



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
 CONST_SR_4_uxn_c_l126_c52_7578_return_output,
 BIN_OP_AND_uxn_c_l126_c25_8df1_return_output,
 UNARY_OP_NOT_uxn_c_l129_c22_3827_return_output,
 BIN_OP_AND_uxn_c_l129_c6_a3e3_return_output,
 fill_y0_MUX_uxn_c_l129_c2_a5ed_return_output,
 fill_x1_MUX_uxn_c_l129_c2_a5ed_return_output,
 fill_y1_MUX_uxn_c_l129_c2_a5ed_return_output,
 fill_color_MUX_uxn_c_l129_c2_a5ed_return_output,
 y_MUX_uxn_c_l129_c2_a5ed_return_output,
 fill_x0_MUX_uxn_c_l129_c2_a5ed_return_output,
 is_fill_active_MUX_uxn_c_l129_c2_a5ed_return_output,
 is_fill_top_MUX_uxn_c_l129_c2_a5ed_return_output,
 fill_layer_MUX_uxn_c_l129_c2_a5ed_return_output,
 is_fill_left_MUX_uxn_c_l129_c2_a5ed_return_output,
 x_MUX_uxn_c_l129_c2_a5ed_return_output,
 CONST_SR_2_uxn_c_l131_c20_5f5f_return_output,
 CONST_SR_3_uxn_c_l132_c18_f6e7_return_output,
 MUX_uxn_c_l133_c13_5b62_return_output,
 BIN_OP_AND_uxn_c_l134_c28_6042_return_output,
 MUX_uxn_c_l134_c13_65ca_return_output,
 MUX_uxn_c_l135_c13_affa_return_output,
 BIN_OP_AND_uxn_c_l136_c32_36a2_return_output,
 MUX_uxn_c_l136_c13_041b_return_output,
 CONST_SL_8_uxn_c_l146_c54_4256_return_output,
 BIN_OP_PLUS_uxn_c_l146_c54_171a_return_output,
 MUX_uxn_c_l146_c35_49fa_return_output,
 BIN_OP_EQ_uxn_c_l148_c21_bff5_return_output,
 MUX_uxn_c_l148_c21_7ed1_return_output,
 BIN_OP_EQ_uxn_c_l149_c22_10c0_return_output,
 MUX_uxn_c_l149_c22_a21e_return_output,
 BIN_OP_PLUS_uxn_c_l150_c25_5f53_return_output,
 MUX_uxn_c_l150_c6_2754_return_output,
 BIN_OP_PLUS_uxn_c_l151_c34_07c4_return_output,
 MUX_uxn_c_l151_c6_f7f0_return_output,
 UNARY_OP_NOT_uxn_c_l153_c46_7452_return_output,
 BIN_OP_AND_uxn_c_l153_c27_e25b_return_output,
 BIN_OP_AND_uxn_c_l154_c27_1a7e_return_output,
 MUX_uxn_c_l159_c3_82b7_return_output,
 UNARY_OP_NOT_uxn_c_l160_c57_9561_return_output,
 BIN_OP_AND_uxn_c_l160_c22_77a8_return_output,
 BIN_OP_OR_uxn_c_l160_c3_38ed_return_output,
 bg_vram_update_uxn_c_l156_c27_b8ef_return_output,
 MUX_uxn_c_l166_c3_1ad6_return_output,
 BIN_OP_AND_uxn_c_l167_c22_b8e9_return_output,
 BIN_OP_OR_uxn_c_l167_c3_977a_return_output,
 fg_vram_update_uxn_c_l163_c27_a092_return_output,
 BIN_OP_AND_uxn_c_l170_c38_628b_return_output,
 UNARY_OP_NOT_uxn_c_l170_c38_3853_return_output,
 MUX_uxn_c_l170_c19_ee4c_return_output,
 BIN_OP_EQ_uxn_c_l171_c19_c06e_return_output,
 BIN_OP_PLUS_uxn_c_l171_c76_39c3_return_output,
 MUX_uxn_c_l171_c50_3ee3_return_output,
 MUX_uxn_c_l171_c19_644d_return_output,
 BIN_OP_EQ_uxn_c_l172_c25_b088_return_output,
 MUX_uxn_c_l172_c25_d227_return_output,
 BIN_OP_EQ_uxn_c_l173_c17_acd6_return_output,
 MUX_uxn_c_l173_c17_551e_return_output,
 CONST_SR_8_uint16_t_uxn_c_l133_l135_DUPLICATE_351a_return_output,
 UNARY_OP_NOT_uint1_t_uxn_c_l160_l167_DUPLICATE_64bd_return_output,
 BIN_OP_AND_uint1_t_uint1_t_uxn_c_l160_l167_DUPLICATE_4326_return_output)
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
 variable VAR_BIN_OP_AND_uxn_c_l126_c25_8df1_left : unsigned(0 downto 0);
 variable VAR_CONST_SR_4_uxn_c_l126_c52_7578_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_c_l126_c52_7578_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_c_l126_c42_d152_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l126_c25_8df1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l126_c25_8df1_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l129_c6_a3e3_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l129_c22_3827_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l129_c22_3827_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l129_c6_a3e3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l129_c6_a3e3_return_output : unsigned(0 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l129_c2_a5ed_iftrue : unsigned(15 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l129_c2_a5ed_iffalse : unsigned(15 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l129_c2_a5ed_return_output : unsigned(15 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l129_c2_a5ed_cond : unsigned(0 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l129_c2_a5ed_iftrue : unsigned(15 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l129_c2_a5ed_iffalse : unsigned(15 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l129_c2_a5ed_return_output : unsigned(15 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l129_c2_a5ed_cond : unsigned(0 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l129_c2_a5ed_iftrue : unsigned(15 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l129_c2_a5ed_iffalse : unsigned(15 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l129_c2_a5ed_return_output : unsigned(15 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l129_c2_a5ed_cond : unsigned(0 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l129_c2_a5ed_iftrue : unsigned(1 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l129_c2_a5ed_iffalse : unsigned(1 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l129_c2_a5ed_return_output : unsigned(1 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l129_c2_a5ed_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_c_l129_c2_a5ed_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_c_l129_c2_a5ed_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_c_l129_c2_a5ed_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_c_l129_c2_a5ed_cond : unsigned(0 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l129_c2_a5ed_iftrue : unsigned(15 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l129_c2_a5ed_iffalse : unsigned(15 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l129_c2_a5ed_return_output : unsigned(15 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l129_c2_a5ed_cond : unsigned(0 downto 0);
 variable VAR_is_fill_active_MUX_uxn_c_l129_c2_a5ed_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_active_MUX_uxn_c_l129_c2_a5ed_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_active_MUX_uxn_c_l129_c2_a5ed_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_active_MUX_uxn_c_l129_c2_a5ed_cond : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l129_c2_a5ed_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_top_uxn_c_l131_c6_a27c : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l129_c2_a5ed_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l129_c2_a5ed_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l129_c2_a5ed_cond : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l129_c2_a5ed_iftrue : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l129_c2_a5ed_iffalse : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l129_c2_a5ed_return_output : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l129_c2_a5ed_cond : unsigned(0 downto 0);
 variable VAR_is_fill_left_MUX_uxn_c_l129_c2_a5ed_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_left_uxn_c_l132_c3_b7a8 : unsigned(0 downto 0);
 variable VAR_is_fill_left_MUX_uxn_c_l129_c2_a5ed_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_left_MUX_uxn_c_l129_c2_a5ed_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_left_MUX_uxn_c_l129_c2_a5ed_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_c_l129_c2_a5ed_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_c_l129_c2_a5ed_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_c_l129_c2_a5ed_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_c_l129_c2_a5ed_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_2_uxn_c_l131_c20_5f5f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_2_uxn_c_l131_c20_5f5f_x : unsigned(7 downto 0);
 variable VAR_CONST_SR_3_uxn_c_l132_c18_f6e7_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_3_uxn_c_l132_c18_f6e7_x : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l133_c13_5b62_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l133_c13_5b62_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l133_c13_5b62_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l133_c13_5b62_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l134_c13_65ca_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l134_c13_65ca_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l134_c13_65ca_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l134_c28_6042_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l134_c28_6042_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l134_c28_6042_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l134_c13_65ca_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l135_c13_affa_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l135_c13_affa_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l135_c13_affa_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l135_c13_affa_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l136_c13_041b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l136_c13_041b_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l136_c13_041b_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l136_c32_36a2_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l136_c32_36a2_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l136_c32_36a2_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l136_c13_041b_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint2_t_uxn_c_l138_c16_4eff_return_output : unsigned(1 downto 0);
 variable VAR_adjusted_vram_address : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l146_c35_49fa_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l146_c35_49fa_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l146_c35_49fa_iffalse : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l146_c54_4256_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l146_c54_171a_left : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l146_c54_4256_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l146_c54_171a_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l146_c54_171a_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l146_c35_49fa_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l148_c21_7ed1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l148_c21_bff5_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l148_c21_bff5_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l148_c21_bff5_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l148_c21_7ed1_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l148_c21_7ed1_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l148_c21_7ed1_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l149_c22_a21e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l149_c22_10c0_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l149_c22_10c0_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l149_c22_10c0_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l149_c22_a21e_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l149_c22_a21e_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l149_c22_a21e_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l150_c6_2754_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l150_c6_2754_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l150_c6_2754_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l150_c25_5f53_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l150_c25_5f53_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l150_c25_5f53_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l150_c6_2754_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l151_c6_f7f0_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l151_c6_f7f0_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l151_c6_f7f0_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l151_c34_07c4_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l151_c34_07c4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l151_c34_07c4_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l151_c6_f7f0_return_output : unsigned(15 downto 0);
 variable VAR_is_fill_pixel0 : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l153_c27_e25b_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l153_c46_7452_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l153_c46_7452_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l153_c27_e25b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l153_c27_e25b_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_pixel1 : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l154_c27_1a7e_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l154_c27_1a7e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l154_c27_1a7e_return_output : unsigned(0 downto 0);
 variable VAR_bg_pixel_color : unsigned(1 downto 0);
 variable VAR_bg_vram_update_uxn_c_l156_c27_b8ef_read_address : unsigned(15 downto 0);
 variable VAR_bg_vram_update_uxn_c_l156_c27_b8ef_write_address : unsigned(15 downto 0);
 variable VAR_bg_vram_update_uxn_c_l156_c27_b8ef_write_value : unsigned(1 downto 0);
 variable VAR_bg_vram_update_uxn_c_l156_c27_b8ef_write_enable : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l159_c3_82b7_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l159_c3_82b7_iftrue : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l159_c3_82b7_iffalse : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l159_c3_82b7_return_output : unsigned(1 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l160_c3_38ed_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l160_c22_77a8_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l160_c57_9561_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l160_c57_9561_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l160_c22_77a8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l160_c22_77a8_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l160_c3_38ed_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l160_c3_38ed_return_output : unsigned(0 downto 0);
 variable VAR_bg_vram_update_uxn_c_l156_c27_b8ef_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_bg_vram_update_uxn_c_l156_c27_b8ef_return_output : unsigned(1 downto 0);
 variable VAR_fg_pixel_color : unsigned(1 downto 0);
 variable VAR_fg_vram_update_uxn_c_l163_c27_a092_read_address : unsigned(15 downto 0);
 variable VAR_fg_vram_update_uxn_c_l163_c27_a092_write_address : unsigned(15 downto 0);
 variable VAR_fg_vram_update_uxn_c_l163_c27_a092_write_value : unsigned(1 downto 0);
 variable VAR_fg_vram_update_uxn_c_l163_c27_a092_write_enable : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l166_c3_1ad6_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l166_c3_1ad6_iftrue : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l166_c3_1ad6_iffalse : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l166_c3_1ad6_return_output : unsigned(1 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l167_c3_977a_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l167_c22_b8e9_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l167_c22_b8e9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l167_c22_b8e9_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l167_c3_977a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l167_c3_977a_return_output : unsigned(0 downto 0);
 variable VAR_fg_vram_update_uxn_c_l163_c27_a092_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_fg_vram_update_uxn_c_l163_c27_a092_return_output : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l170_c19_ee4c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l170_c19_ee4c_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l170_c19_ee4c_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l170_c38_628b_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l170_c38_628b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l170_c38_628b_return_output : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l170_c38_3853_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l170_c38_3853_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l170_c19_ee4c_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l171_c19_644d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l171_c19_c06e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l171_c19_c06e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l171_c19_c06e_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l171_c19_644d_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l171_c19_644d_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l171_c50_3ee3_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l171_c50_3ee3_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l171_c50_3ee3_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l171_c76_39c3_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l171_c76_39c3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l171_c76_39c3_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l171_c50_3ee3_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l171_c19_644d_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l172_c25_d227_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l172_c25_b088_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l172_c25_b088_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l172_c25_b088_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l172_c25_d227_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l172_c25_d227_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l172_c25_d227_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l173_c17_551e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l173_c17_acd6_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l173_c17_acd6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l173_c17_acd6_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l173_c17_551e_iftrue : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l173_c17_551e_iffalse : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l173_c17_551e_return_output : unsigned(1 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_c_l133_l135_DUPLICATE_351a_x : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_c_l133_l135_DUPLICATE_351a_return_output : unsigned(15 downto 0);
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_c_l160_l167_DUPLICATE_64bd_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_c_l160_l167_DUPLICATE_64bd_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l160_l167_DUPLICATE_4326_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l160_l167_DUPLICATE_4326_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l160_l167_DUPLICATE_4326_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_269d_uxn_c_l115_l176_DUPLICATE_9a4a_return_output : gpu_step_result_t;
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
     VAR_MUX_uxn_c_l172_c25_d227_iffalse := to_unsigned(0, 1);
     VAR_is_fill_active_MUX_uxn_c_l129_c2_a5ed_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l170_c19_ee4c_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l171_c19_644d_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_MUX_uxn_c_l135_c13_affa_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_MUX_uxn_c_l149_c22_a21e_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_c_l150_c25_5f53_right := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l136_c13_041b_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_BIN_OP_AND_uxn_c_l134_c28_6042_right := to_unsigned(255, 16);
     VAR_BIN_OP_PLUS_uxn_c_l171_c76_39c3_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_c_l151_c34_07c4_right := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l148_c21_7ed1_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l172_c25_b088_right := to_unsigned(61439, 16);
     VAR_BIN_OP_EQ_uxn_c_l171_c19_c06e_right := to_unsigned(61439, 16);
     VAR_MUX_uxn_c_l172_c25_d227_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l133_c13_5b62_iffalse := resize(to_unsigned(239, 8), 16);
     VAR_BIN_OP_AND_uxn_c_l136_c32_36a2_right := to_unsigned(255, 16);
     VAR_BIN_OP_EQ_uxn_c_l173_c17_acd6_right := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l149_c22_a21e_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l134_c13_65ca_iffalse := resize(to_unsigned(255, 8), 16);
     VAR_MUX_uxn_c_l148_c21_7ed1_iffalse := to_unsigned(0, 1);

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
     VAR_bg_vram_update_uxn_c_l156_c27_b8ef_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_fg_vram_update_uxn_c_l163_c27_a092_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_fill_color_MUX_uxn_c_l129_c2_a5ed_iffalse := fill_color;
     VAR_fill_layer_MUX_uxn_c_l129_c2_a5ed_iffalse := fill_layer;
     VAR_fill_x0_MUX_uxn_c_l129_c2_a5ed_iffalse := fill_x0;
     VAR_fill_x1_MUX_uxn_c_l129_c2_a5ed_iffalse := fill_x1;
     VAR_fill_y0_MUX_uxn_c_l129_c2_a5ed_iffalse := fill_y0;
     VAR_fill_y1_MUX_uxn_c_l129_c2_a5ed_iffalse := fill_y1;
     VAR_MUX_uxn_c_l171_c50_3ee3_cond := VAR_is_active_drawing_area;
     VAR_UNARY_OP_NOT_uxn_c_l129_c22_3827_expr := is_fill_active;
     VAR_is_fill_active_MUX_uxn_c_l129_c2_a5ed_iffalse := is_fill_active;
     VAR_is_fill_left_MUX_uxn_c_l129_c2_a5ed_iffalse := is_fill_left;
     VAR_is_fill_top_MUX_uxn_c_l129_c2_a5ed_iffalse := is_fill_top;
     VAR_BIN_OP_AND_uxn_c_l126_c25_8df1_left := VAR_is_vram_write;
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l160_l167_DUPLICATE_4326_right := VAR_is_vram_write;
     VAR_BIN_OP_EQ_uxn_c_l171_c19_c06e_left := pixel_counter;
     VAR_BIN_OP_PLUS_uxn_c_l171_c76_39c3_left := pixel_counter;
     VAR_MUX_uxn_c_l171_c50_3ee3_iffalse := pixel_counter;
     VAR_bg_vram_update_uxn_c_l156_c27_b8ef_read_address := pixel_counter;
     VAR_fg_vram_update_uxn_c_l163_c27_a092_read_address := pixel_counter;
     VAR_BIN_OP_AND_uxn_c_l134_c28_6042_left := VAR_vram_address;
     VAR_BIN_OP_AND_uxn_c_l136_c32_36a2_left := VAR_vram_address;
     VAR_CONST_SR_8_uint16_t_uxn_c_l133_l135_DUPLICATE_351a_x := VAR_vram_address;
     VAR_MUX_uxn_c_l146_c35_49fa_iffalse := VAR_vram_address;
     VAR_CONST_SR_2_uxn_c_l131_c20_5f5f_x := VAR_vram_value;
     VAR_CONST_SR_3_uxn_c_l132_c18_f6e7_x := VAR_vram_value;
     VAR_CONST_SR_4_uxn_c_l126_c52_7578_x := VAR_vram_value;
     VAR_MUX_uxn_c_l159_c3_82b7_iffalse := resize(VAR_vram_value, 2);
     VAR_MUX_uxn_c_l166_c3_1ad6_iffalse := resize(VAR_vram_value, 2);
     VAR_BIN_OP_AND_uxn_c_l167_c22_b8e9_right := VAR_vram_write_layer;
     VAR_UNARY_OP_NOT_uxn_c_l160_c57_9561_expr := VAR_vram_write_layer;
     VAR_fill_layer_MUX_uxn_c_l129_c2_a5ed_iftrue := VAR_vram_write_layer;
     VAR_x_MUX_uxn_c_l129_c2_a5ed_iffalse := x;
     VAR_y_MUX_uxn_c_l129_c2_a5ed_iffalse := y;
     -- UNARY_OP_NOT[uxn_c_l129_c22_3827] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l129_c22_3827_expr <= VAR_UNARY_OP_NOT_uxn_c_l129_c22_3827_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l129_c22_3827_return_output := UNARY_OP_NOT_uxn_c_l129_c22_3827_return_output;

     -- CONST_SR_3[uxn_c_l132_c18_f6e7] LATENCY=0
     -- Inputs
     CONST_SR_3_uxn_c_l132_c18_f6e7_x <= VAR_CONST_SR_3_uxn_c_l132_c18_f6e7_x;
     -- Outputs
     VAR_CONST_SR_3_uxn_c_l132_c18_f6e7_return_output := CONST_SR_3_uxn_c_l132_c18_f6e7_return_output;

     -- BIN_OP_PLUS[uxn_c_l171_c76_39c3] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l171_c76_39c3_left <= VAR_BIN_OP_PLUS_uxn_c_l171_c76_39c3_left;
     BIN_OP_PLUS_uxn_c_l171_c76_39c3_right <= VAR_BIN_OP_PLUS_uxn_c_l171_c76_39c3_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l171_c76_39c3_return_output := BIN_OP_PLUS_uxn_c_l171_c76_39c3_return_output;

     -- CONST_SR_4[uxn_c_l126_c52_7578] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_c_l126_c52_7578_x <= VAR_CONST_SR_4_uxn_c_l126_c52_7578_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_c_l126_c52_7578_return_output := CONST_SR_4_uxn_c_l126_c52_7578_return_output;

     -- UNARY_OP_NOT[uxn_c_l160_c57_9561] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l160_c57_9561_expr <= VAR_UNARY_OP_NOT_uxn_c_l160_c57_9561_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l160_c57_9561_return_output := UNARY_OP_NOT_uxn_c_l160_c57_9561_return_output;

     -- BIN_OP_EQ[uxn_c_l171_c19_c06e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l171_c19_c06e_left <= VAR_BIN_OP_EQ_uxn_c_l171_c19_c06e_left;
     BIN_OP_EQ_uxn_c_l171_c19_c06e_right <= VAR_BIN_OP_EQ_uxn_c_l171_c19_c06e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l171_c19_c06e_return_output := BIN_OP_EQ_uxn_c_l171_c19_c06e_return_output;

     -- BIN_OP_AND[uxn_c_l136_c32_36a2] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l136_c32_36a2_left <= VAR_BIN_OP_AND_uxn_c_l136_c32_36a2_left;
     BIN_OP_AND_uxn_c_l136_c32_36a2_right <= VAR_BIN_OP_AND_uxn_c_l136_c32_36a2_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l136_c32_36a2_return_output := BIN_OP_AND_uxn_c_l136_c32_36a2_return_output;

     -- BIN_OP_AND[uxn_c_l134_c28_6042] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l134_c28_6042_left <= VAR_BIN_OP_AND_uxn_c_l134_c28_6042_left;
     BIN_OP_AND_uxn_c_l134_c28_6042_right <= VAR_BIN_OP_AND_uxn_c_l134_c28_6042_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l134_c28_6042_return_output := BIN_OP_AND_uxn_c_l134_c28_6042_return_output;

     -- CONST_SR_2[uxn_c_l131_c20_5f5f] LATENCY=0
     -- Inputs
     CONST_SR_2_uxn_c_l131_c20_5f5f_x <= VAR_CONST_SR_2_uxn_c_l131_c20_5f5f_x;
     -- Outputs
     VAR_CONST_SR_2_uxn_c_l131_c20_5f5f_return_output := CONST_SR_2_uxn_c_l131_c20_5f5f_return_output;

     -- CONST_SR_8_uint16_t_uxn_c_l133_l135_DUPLICATE_351a LATENCY=0
     -- Inputs
     CONST_SR_8_uint16_t_uxn_c_l133_l135_DUPLICATE_351a_x <= VAR_CONST_SR_8_uint16_t_uxn_c_l133_l135_DUPLICATE_351a_x;
     -- Outputs
     VAR_CONST_SR_8_uint16_t_uxn_c_l133_l135_DUPLICATE_351a_return_output := CONST_SR_8_uint16_t_uxn_c_l133_l135_DUPLICATE_351a_return_output;

     -- CAST_TO_uint2_t[uxn_c_l138_c16_4eff] LATENCY=0
     VAR_CAST_TO_uint2_t_uxn_c_l138_c16_4eff_return_output := CAST_TO_uint2_t_uint8_t(
     VAR_vram_value);

     -- Submodule level 1
     VAR_MUX_uxn_c_l134_c13_65ca_iftrue := VAR_BIN_OP_AND_uxn_c_l134_c28_6042_return_output;
     VAR_MUX_uxn_c_l136_c13_041b_iffalse := VAR_BIN_OP_AND_uxn_c_l136_c32_36a2_return_output;
     VAR_MUX_uxn_c_l171_c19_644d_cond := VAR_BIN_OP_EQ_uxn_c_l171_c19_c06e_return_output;
     VAR_MUX_uxn_c_l171_c50_3ee3_iftrue := resize(VAR_BIN_OP_PLUS_uxn_c_l171_c76_39c3_return_output, 16);
     VAR_fill_color_MUX_uxn_c_l129_c2_a5ed_iftrue := VAR_CAST_TO_uint2_t_uxn_c_l138_c16_4eff_return_output;
     VAR_is_fill_top_uxn_c_l131_c6_a27c := resize(VAR_CONST_SR_2_uxn_c_l131_c20_5f5f_return_output, 1);
     VAR_is_fill_left_uxn_c_l132_c3_b7a8 := resize(VAR_CONST_SR_3_uxn_c_l132_c18_f6e7_return_output, 1);
     VAR_MUX_uxn_c_l133_c13_5b62_iftrue := VAR_CONST_SR_8_uint16_t_uxn_c_l133_l135_DUPLICATE_351a_return_output;
     VAR_MUX_uxn_c_l135_c13_affa_iffalse := VAR_CONST_SR_8_uint16_t_uxn_c_l133_l135_DUPLICATE_351a_return_output;
     VAR_BIN_OP_AND_uxn_c_l129_c6_a3e3_right := VAR_UNARY_OP_NOT_uxn_c_l129_c22_3827_return_output;
     VAR_BIN_OP_AND_uxn_c_l160_c22_77a8_right := VAR_UNARY_OP_NOT_uxn_c_l160_c57_9561_return_output;
     VAR_MUX_uxn_c_l134_c13_65ca_cond := VAR_is_fill_left_uxn_c_l132_c3_b7a8;
     VAR_MUX_uxn_c_l136_c13_041b_cond := VAR_is_fill_left_uxn_c_l132_c3_b7a8;
     VAR_is_fill_left_MUX_uxn_c_l129_c2_a5ed_iftrue := VAR_is_fill_left_uxn_c_l132_c3_b7a8;
     VAR_MUX_uxn_c_l133_c13_5b62_cond := VAR_is_fill_top_uxn_c_l131_c6_a27c;
     VAR_MUX_uxn_c_l135_c13_affa_cond := VAR_is_fill_top_uxn_c_l131_c6_a27c;
     VAR_is_fill_top_MUX_uxn_c_l129_c2_a5ed_iftrue := VAR_is_fill_top_uxn_c_l131_c6_a27c;
     -- MUX[uxn_c_l134_c13_65ca] LATENCY=0
     -- Inputs
     MUX_uxn_c_l134_c13_65ca_cond <= VAR_MUX_uxn_c_l134_c13_65ca_cond;
     MUX_uxn_c_l134_c13_65ca_iftrue <= VAR_MUX_uxn_c_l134_c13_65ca_iftrue;
     MUX_uxn_c_l134_c13_65ca_iffalse <= VAR_MUX_uxn_c_l134_c13_65ca_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l134_c13_65ca_return_output := MUX_uxn_c_l134_c13_65ca_return_output;

     -- MUX[uxn_c_l171_c50_3ee3] LATENCY=0
     -- Inputs
     MUX_uxn_c_l171_c50_3ee3_cond <= VAR_MUX_uxn_c_l171_c50_3ee3_cond;
     MUX_uxn_c_l171_c50_3ee3_iftrue <= VAR_MUX_uxn_c_l171_c50_3ee3_iftrue;
     MUX_uxn_c_l171_c50_3ee3_iffalse <= VAR_MUX_uxn_c_l171_c50_3ee3_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l171_c50_3ee3_return_output := MUX_uxn_c_l171_c50_3ee3_return_output;

     -- CAST_TO_uint1_t[uxn_c_l126_c42_d152] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_c_l126_c42_d152_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_4_uxn_c_l126_c52_7578_return_output);

     -- MUX[uxn_c_l135_c13_affa] LATENCY=0
     -- Inputs
     MUX_uxn_c_l135_c13_affa_cond <= VAR_MUX_uxn_c_l135_c13_affa_cond;
     MUX_uxn_c_l135_c13_affa_iftrue <= VAR_MUX_uxn_c_l135_c13_affa_iftrue;
     MUX_uxn_c_l135_c13_affa_iffalse <= VAR_MUX_uxn_c_l135_c13_affa_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l135_c13_affa_return_output := MUX_uxn_c_l135_c13_affa_return_output;

     -- MUX[uxn_c_l136_c13_041b] LATENCY=0
     -- Inputs
     MUX_uxn_c_l136_c13_041b_cond <= VAR_MUX_uxn_c_l136_c13_041b_cond;
     MUX_uxn_c_l136_c13_041b_iftrue <= VAR_MUX_uxn_c_l136_c13_041b_iftrue;
     MUX_uxn_c_l136_c13_041b_iffalse <= VAR_MUX_uxn_c_l136_c13_041b_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l136_c13_041b_return_output := MUX_uxn_c_l136_c13_041b_return_output;

     -- MUX[uxn_c_l133_c13_5b62] LATENCY=0
     -- Inputs
     MUX_uxn_c_l133_c13_5b62_cond <= VAR_MUX_uxn_c_l133_c13_5b62_cond;
     MUX_uxn_c_l133_c13_5b62_iftrue <= VAR_MUX_uxn_c_l133_c13_5b62_iftrue;
     MUX_uxn_c_l133_c13_5b62_iffalse <= VAR_MUX_uxn_c_l133_c13_5b62_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l133_c13_5b62_return_output := MUX_uxn_c_l133_c13_5b62_return_output;

     -- Submodule level 2
     VAR_BIN_OP_AND_uxn_c_l126_c25_8df1_right := VAR_CAST_TO_uint1_t_uxn_c_l126_c42_d152_return_output;
     VAR_fill_y1_MUX_uxn_c_l129_c2_a5ed_iftrue := VAR_MUX_uxn_c_l133_c13_5b62_return_output;
     VAR_fill_x1_MUX_uxn_c_l129_c2_a5ed_iftrue := VAR_MUX_uxn_c_l134_c13_65ca_return_output;
     VAR_fill_y0_MUX_uxn_c_l129_c2_a5ed_iftrue := VAR_MUX_uxn_c_l135_c13_affa_return_output;
     VAR_y_MUX_uxn_c_l129_c2_a5ed_iftrue := VAR_MUX_uxn_c_l135_c13_affa_return_output;
     VAR_fill_x0_MUX_uxn_c_l129_c2_a5ed_iftrue := VAR_MUX_uxn_c_l136_c13_041b_return_output;
     VAR_x_MUX_uxn_c_l129_c2_a5ed_iftrue := VAR_MUX_uxn_c_l136_c13_041b_return_output;
     VAR_MUX_uxn_c_l171_c19_644d_iffalse := VAR_MUX_uxn_c_l171_c50_3ee3_return_output;
     -- BIN_OP_AND[uxn_c_l126_c25_8df1] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l126_c25_8df1_left <= VAR_BIN_OP_AND_uxn_c_l126_c25_8df1_left;
     BIN_OP_AND_uxn_c_l126_c25_8df1_right <= VAR_BIN_OP_AND_uxn_c_l126_c25_8df1_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l126_c25_8df1_return_output := BIN_OP_AND_uxn_c_l126_c25_8df1_return_output;

     -- MUX[uxn_c_l171_c19_644d] LATENCY=0
     -- Inputs
     MUX_uxn_c_l171_c19_644d_cond <= VAR_MUX_uxn_c_l171_c19_644d_cond;
     MUX_uxn_c_l171_c19_644d_iftrue <= VAR_MUX_uxn_c_l171_c19_644d_iftrue;
     MUX_uxn_c_l171_c19_644d_iffalse <= VAR_MUX_uxn_c_l171_c19_644d_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l171_c19_644d_return_output := MUX_uxn_c_l171_c19_644d_return_output;

     -- Submodule level 3
     VAR_BIN_OP_AND_uxn_c_l129_c6_a3e3_left := VAR_BIN_OP_AND_uxn_c_l126_c25_8df1_return_output;
     VAR_BIN_OP_EQ_uxn_c_l172_c25_b088_left := VAR_MUX_uxn_c_l171_c19_644d_return_output;
     REG_VAR_pixel_counter := VAR_MUX_uxn_c_l171_c19_644d_return_output;
     -- BIN_OP_EQ[uxn_c_l172_c25_b088] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l172_c25_b088_left <= VAR_BIN_OP_EQ_uxn_c_l172_c25_b088_left;
     BIN_OP_EQ_uxn_c_l172_c25_b088_right <= VAR_BIN_OP_EQ_uxn_c_l172_c25_b088_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l172_c25_b088_return_output := BIN_OP_EQ_uxn_c_l172_c25_b088_return_output;

     -- BIN_OP_AND[uxn_c_l129_c6_a3e3] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l129_c6_a3e3_left <= VAR_BIN_OP_AND_uxn_c_l129_c6_a3e3_left;
     BIN_OP_AND_uxn_c_l129_c6_a3e3_right <= VAR_BIN_OP_AND_uxn_c_l129_c6_a3e3_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l129_c6_a3e3_return_output := BIN_OP_AND_uxn_c_l129_c6_a3e3_return_output;

     -- Submodule level 4
     VAR_fill_color_MUX_uxn_c_l129_c2_a5ed_cond := VAR_BIN_OP_AND_uxn_c_l129_c6_a3e3_return_output;
     VAR_fill_layer_MUX_uxn_c_l129_c2_a5ed_cond := VAR_BIN_OP_AND_uxn_c_l129_c6_a3e3_return_output;
     VAR_fill_x0_MUX_uxn_c_l129_c2_a5ed_cond := VAR_BIN_OP_AND_uxn_c_l129_c6_a3e3_return_output;
     VAR_fill_x1_MUX_uxn_c_l129_c2_a5ed_cond := VAR_BIN_OP_AND_uxn_c_l129_c6_a3e3_return_output;
     VAR_fill_y0_MUX_uxn_c_l129_c2_a5ed_cond := VAR_BIN_OP_AND_uxn_c_l129_c6_a3e3_return_output;
     VAR_fill_y1_MUX_uxn_c_l129_c2_a5ed_cond := VAR_BIN_OP_AND_uxn_c_l129_c6_a3e3_return_output;
     VAR_is_fill_active_MUX_uxn_c_l129_c2_a5ed_cond := VAR_BIN_OP_AND_uxn_c_l129_c6_a3e3_return_output;
     VAR_is_fill_left_MUX_uxn_c_l129_c2_a5ed_cond := VAR_BIN_OP_AND_uxn_c_l129_c6_a3e3_return_output;
     VAR_is_fill_top_MUX_uxn_c_l129_c2_a5ed_cond := VAR_BIN_OP_AND_uxn_c_l129_c6_a3e3_return_output;
     VAR_x_MUX_uxn_c_l129_c2_a5ed_cond := VAR_BIN_OP_AND_uxn_c_l129_c6_a3e3_return_output;
     VAR_y_MUX_uxn_c_l129_c2_a5ed_cond := VAR_BIN_OP_AND_uxn_c_l129_c6_a3e3_return_output;
     VAR_MUX_uxn_c_l172_c25_d227_cond := VAR_BIN_OP_EQ_uxn_c_l172_c25_b088_return_output;
     -- fill_x0_MUX[uxn_c_l129_c2_a5ed] LATENCY=0
     -- Inputs
     fill_x0_MUX_uxn_c_l129_c2_a5ed_cond <= VAR_fill_x0_MUX_uxn_c_l129_c2_a5ed_cond;
     fill_x0_MUX_uxn_c_l129_c2_a5ed_iftrue <= VAR_fill_x0_MUX_uxn_c_l129_c2_a5ed_iftrue;
     fill_x0_MUX_uxn_c_l129_c2_a5ed_iffalse <= VAR_fill_x0_MUX_uxn_c_l129_c2_a5ed_iffalse;
     -- Outputs
     VAR_fill_x0_MUX_uxn_c_l129_c2_a5ed_return_output := fill_x0_MUX_uxn_c_l129_c2_a5ed_return_output;

     -- fill_y0_MUX[uxn_c_l129_c2_a5ed] LATENCY=0
     -- Inputs
     fill_y0_MUX_uxn_c_l129_c2_a5ed_cond <= VAR_fill_y0_MUX_uxn_c_l129_c2_a5ed_cond;
     fill_y0_MUX_uxn_c_l129_c2_a5ed_iftrue <= VAR_fill_y0_MUX_uxn_c_l129_c2_a5ed_iftrue;
     fill_y0_MUX_uxn_c_l129_c2_a5ed_iffalse <= VAR_fill_y0_MUX_uxn_c_l129_c2_a5ed_iffalse;
     -- Outputs
     VAR_fill_y0_MUX_uxn_c_l129_c2_a5ed_return_output := fill_y0_MUX_uxn_c_l129_c2_a5ed_return_output;

     -- fill_color_MUX[uxn_c_l129_c2_a5ed] LATENCY=0
     -- Inputs
     fill_color_MUX_uxn_c_l129_c2_a5ed_cond <= VAR_fill_color_MUX_uxn_c_l129_c2_a5ed_cond;
     fill_color_MUX_uxn_c_l129_c2_a5ed_iftrue <= VAR_fill_color_MUX_uxn_c_l129_c2_a5ed_iftrue;
     fill_color_MUX_uxn_c_l129_c2_a5ed_iffalse <= VAR_fill_color_MUX_uxn_c_l129_c2_a5ed_iffalse;
     -- Outputs
     VAR_fill_color_MUX_uxn_c_l129_c2_a5ed_return_output := fill_color_MUX_uxn_c_l129_c2_a5ed_return_output;

     -- y_MUX[uxn_c_l129_c2_a5ed] LATENCY=0
     -- Inputs
     y_MUX_uxn_c_l129_c2_a5ed_cond <= VAR_y_MUX_uxn_c_l129_c2_a5ed_cond;
     y_MUX_uxn_c_l129_c2_a5ed_iftrue <= VAR_y_MUX_uxn_c_l129_c2_a5ed_iftrue;
     y_MUX_uxn_c_l129_c2_a5ed_iffalse <= VAR_y_MUX_uxn_c_l129_c2_a5ed_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_c_l129_c2_a5ed_return_output := y_MUX_uxn_c_l129_c2_a5ed_return_output;

     -- is_fill_active_MUX[uxn_c_l129_c2_a5ed] LATENCY=0
     -- Inputs
     is_fill_active_MUX_uxn_c_l129_c2_a5ed_cond <= VAR_is_fill_active_MUX_uxn_c_l129_c2_a5ed_cond;
     is_fill_active_MUX_uxn_c_l129_c2_a5ed_iftrue <= VAR_is_fill_active_MUX_uxn_c_l129_c2_a5ed_iftrue;
     is_fill_active_MUX_uxn_c_l129_c2_a5ed_iffalse <= VAR_is_fill_active_MUX_uxn_c_l129_c2_a5ed_iffalse;
     -- Outputs
     VAR_is_fill_active_MUX_uxn_c_l129_c2_a5ed_return_output := is_fill_active_MUX_uxn_c_l129_c2_a5ed_return_output;

     -- fill_layer_MUX[uxn_c_l129_c2_a5ed] LATENCY=0
     -- Inputs
     fill_layer_MUX_uxn_c_l129_c2_a5ed_cond <= VAR_fill_layer_MUX_uxn_c_l129_c2_a5ed_cond;
     fill_layer_MUX_uxn_c_l129_c2_a5ed_iftrue <= VAR_fill_layer_MUX_uxn_c_l129_c2_a5ed_iftrue;
     fill_layer_MUX_uxn_c_l129_c2_a5ed_iffalse <= VAR_fill_layer_MUX_uxn_c_l129_c2_a5ed_iffalse;
     -- Outputs
     VAR_fill_layer_MUX_uxn_c_l129_c2_a5ed_return_output := fill_layer_MUX_uxn_c_l129_c2_a5ed_return_output;

     -- is_fill_top_MUX[uxn_c_l129_c2_a5ed] LATENCY=0
     -- Inputs
     is_fill_top_MUX_uxn_c_l129_c2_a5ed_cond <= VAR_is_fill_top_MUX_uxn_c_l129_c2_a5ed_cond;
     is_fill_top_MUX_uxn_c_l129_c2_a5ed_iftrue <= VAR_is_fill_top_MUX_uxn_c_l129_c2_a5ed_iftrue;
     is_fill_top_MUX_uxn_c_l129_c2_a5ed_iffalse <= VAR_is_fill_top_MUX_uxn_c_l129_c2_a5ed_iffalse;
     -- Outputs
     VAR_is_fill_top_MUX_uxn_c_l129_c2_a5ed_return_output := is_fill_top_MUX_uxn_c_l129_c2_a5ed_return_output;

     -- fill_y1_MUX[uxn_c_l129_c2_a5ed] LATENCY=0
     -- Inputs
     fill_y1_MUX_uxn_c_l129_c2_a5ed_cond <= VAR_fill_y1_MUX_uxn_c_l129_c2_a5ed_cond;
     fill_y1_MUX_uxn_c_l129_c2_a5ed_iftrue <= VAR_fill_y1_MUX_uxn_c_l129_c2_a5ed_iftrue;
     fill_y1_MUX_uxn_c_l129_c2_a5ed_iffalse <= VAR_fill_y1_MUX_uxn_c_l129_c2_a5ed_iffalse;
     -- Outputs
     VAR_fill_y1_MUX_uxn_c_l129_c2_a5ed_return_output := fill_y1_MUX_uxn_c_l129_c2_a5ed_return_output;

     -- MUX[uxn_c_l172_c25_d227] LATENCY=0
     -- Inputs
     MUX_uxn_c_l172_c25_d227_cond <= VAR_MUX_uxn_c_l172_c25_d227_cond;
     MUX_uxn_c_l172_c25_d227_iftrue <= VAR_MUX_uxn_c_l172_c25_d227_iftrue;
     MUX_uxn_c_l172_c25_d227_iffalse <= VAR_MUX_uxn_c_l172_c25_d227_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l172_c25_d227_return_output := MUX_uxn_c_l172_c25_d227_return_output;

     -- x_MUX[uxn_c_l129_c2_a5ed] LATENCY=0
     -- Inputs
     x_MUX_uxn_c_l129_c2_a5ed_cond <= VAR_x_MUX_uxn_c_l129_c2_a5ed_cond;
     x_MUX_uxn_c_l129_c2_a5ed_iftrue <= VAR_x_MUX_uxn_c_l129_c2_a5ed_iftrue;
     x_MUX_uxn_c_l129_c2_a5ed_iffalse <= VAR_x_MUX_uxn_c_l129_c2_a5ed_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_c_l129_c2_a5ed_return_output := x_MUX_uxn_c_l129_c2_a5ed_return_output;

     -- is_fill_left_MUX[uxn_c_l129_c2_a5ed] LATENCY=0
     -- Inputs
     is_fill_left_MUX_uxn_c_l129_c2_a5ed_cond <= VAR_is_fill_left_MUX_uxn_c_l129_c2_a5ed_cond;
     is_fill_left_MUX_uxn_c_l129_c2_a5ed_iftrue <= VAR_is_fill_left_MUX_uxn_c_l129_c2_a5ed_iftrue;
     is_fill_left_MUX_uxn_c_l129_c2_a5ed_iffalse <= VAR_is_fill_left_MUX_uxn_c_l129_c2_a5ed_iffalse;
     -- Outputs
     VAR_is_fill_left_MUX_uxn_c_l129_c2_a5ed_return_output := is_fill_left_MUX_uxn_c_l129_c2_a5ed_return_output;

     -- fill_x1_MUX[uxn_c_l129_c2_a5ed] LATENCY=0
     -- Inputs
     fill_x1_MUX_uxn_c_l129_c2_a5ed_cond <= VAR_fill_x1_MUX_uxn_c_l129_c2_a5ed_cond;
     fill_x1_MUX_uxn_c_l129_c2_a5ed_iftrue <= VAR_fill_x1_MUX_uxn_c_l129_c2_a5ed_iftrue;
     fill_x1_MUX_uxn_c_l129_c2_a5ed_iffalse <= VAR_fill_x1_MUX_uxn_c_l129_c2_a5ed_iffalse;
     -- Outputs
     VAR_fill_x1_MUX_uxn_c_l129_c2_a5ed_return_output := fill_x1_MUX_uxn_c_l129_c2_a5ed_return_output;

     -- Submodule level 5
     VAR_MUX_uxn_c_l159_c3_82b7_iftrue := VAR_fill_color_MUX_uxn_c_l129_c2_a5ed_return_output;
     VAR_MUX_uxn_c_l166_c3_1ad6_iftrue := VAR_fill_color_MUX_uxn_c_l129_c2_a5ed_return_output;
     REG_VAR_fill_color := VAR_fill_color_MUX_uxn_c_l129_c2_a5ed_return_output;
     VAR_BIN_OP_AND_uxn_c_l154_c27_1a7e_right := VAR_fill_layer_MUX_uxn_c_l129_c2_a5ed_return_output;
     VAR_UNARY_OP_NOT_uxn_c_l153_c46_7452_expr := VAR_fill_layer_MUX_uxn_c_l129_c2_a5ed_return_output;
     REG_VAR_fill_layer := VAR_fill_layer_MUX_uxn_c_l129_c2_a5ed_return_output;
     VAR_MUX_uxn_c_l151_c6_f7f0_iftrue := VAR_fill_x0_MUX_uxn_c_l129_c2_a5ed_return_output;
     REG_VAR_fill_x0 := VAR_fill_x0_MUX_uxn_c_l129_c2_a5ed_return_output;
     VAR_BIN_OP_EQ_uxn_c_l148_c21_bff5_right := VAR_fill_x1_MUX_uxn_c_l129_c2_a5ed_return_output;
     REG_VAR_fill_x1 := VAR_fill_x1_MUX_uxn_c_l129_c2_a5ed_return_output;
     REG_VAR_fill_y0 := VAR_fill_y0_MUX_uxn_c_l129_c2_a5ed_return_output;
     VAR_BIN_OP_EQ_uxn_c_l149_c22_10c0_right := VAR_fill_y1_MUX_uxn_c_l129_c2_a5ed_return_output;
     REG_VAR_fill_y1 := VAR_fill_y1_MUX_uxn_c_l129_c2_a5ed_return_output;
     VAR_BIN_OP_AND_uxn_c_l153_c27_e25b_left := VAR_is_fill_active_MUX_uxn_c_l129_c2_a5ed_return_output;
     VAR_BIN_OP_AND_uxn_c_l154_c27_1a7e_left := VAR_is_fill_active_MUX_uxn_c_l129_c2_a5ed_return_output;
     VAR_MUX_uxn_c_l146_c35_49fa_cond := VAR_is_fill_active_MUX_uxn_c_l129_c2_a5ed_return_output;
     VAR_MUX_uxn_c_l170_c19_ee4c_cond := VAR_is_fill_active_MUX_uxn_c_l129_c2_a5ed_return_output;
     VAR_UNARY_OP_NOT_uint1_t_uxn_c_l160_l167_DUPLICATE_64bd_expr := VAR_is_fill_active_MUX_uxn_c_l129_c2_a5ed_return_output;
     REG_VAR_is_fill_left := VAR_is_fill_left_MUX_uxn_c_l129_c2_a5ed_return_output;
     REG_VAR_is_fill_top := VAR_is_fill_top_MUX_uxn_c_l129_c2_a5ed_return_output;
     VAR_BIN_OP_EQ_uxn_c_l148_c21_bff5_left := VAR_x_MUX_uxn_c_l129_c2_a5ed_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l146_c54_171a_right := VAR_x_MUX_uxn_c_l129_c2_a5ed_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l151_c34_07c4_left := VAR_x_MUX_uxn_c_l129_c2_a5ed_return_output;
     VAR_BIN_OP_EQ_uxn_c_l149_c22_10c0_left := VAR_y_MUX_uxn_c_l129_c2_a5ed_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l150_c25_5f53_left := VAR_y_MUX_uxn_c_l129_c2_a5ed_return_output;
     VAR_CONST_SL_8_uxn_c_l146_c54_4256_x := VAR_y_MUX_uxn_c_l129_c2_a5ed_return_output;
     VAR_MUX_uxn_c_l150_c6_2754_iffalse := VAR_y_MUX_uxn_c_l129_c2_a5ed_return_output;
     -- BIN_OP_AND[uxn_c_l154_c27_1a7e] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l154_c27_1a7e_left <= VAR_BIN_OP_AND_uxn_c_l154_c27_1a7e_left;
     BIN_OP_AND_uxn_c_l154_c27_1a7e_right <= VAR_BIN_OP_AND_uxn_c_l154_c27_1a7e_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l154_c27_1a7e_return_output := BIN_OP_AND_uxn_c_l154_c27_1a7e_return_output;

     -- BIN_OP_PLUS[uxn_c_l151_c34_07c4] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l151_c34_07c4_left <= VAR_BIN_OP_PLUS_uxn_c_l151_c34_07c4_left;
     BIN_OP_PLUS_uxn_c_l151_c34_07c4_right <= VAR_BIN_OP_PLUS_uxn_c_l151_c34_07c4_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l151_c34_07c4_return_output := BIN_OP_PLUS_uxn_c_l151_c34_07c4_return_output;

     -- UNARY_OP_NOT[uxn_c_l153_c46_7452] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l153_c46_7452_expr <= VAR_UNARY_OP_NOT_uxn_c_l153_c46_7452_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l153_c46_7452_return_output := UNARY_OP_NOT_uxn_c_l153_c46_7452_return_output;

     -- UNARY_OP_NOT_uint1_t_uxn_c_l160_l167_DUPLICATE_64bd LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uint1_t_uxn_c_l160_l167_DUPLICATE_64bd_expr <= VAR_UNARY_OP_NOT_uint1_t_uxn_c_l160_l167_DUPLICATE_64bd_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uint1_t_uxn_c_l160_l167_DUPLICATE_64bd_return_output := UNARY_OP_NOT_uint1_t_uxn_c_l160_l167_DUPLICATE_64bd_return_output;

     -- BIN_OP_EQ[uxn_c_l149_c22_10c0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l149_c22_10c0_left <= VAR_BIN_OP_EQ_uxn_c_l149_c22_10c0_left;
     BIN_OP_EQ_uxn_c_l149_c22_10c0_right <= VAR_BIN_OP_EQ_uxn_c_l149_c22_10c0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l149_c22_10c0_return_output := BIN_OP_EQ_uxn_c_l149_c22_10c0_return_output;

     -- BIN_OP_EQ[uxn_c_l148_c21_bff5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l148_c21_bff5_left <= VAR_BIN_OP_EQ_uxn_c_l148_c21_bff5_left;
     BIN_OP_EQ_uxn_c_l148_c21_bff5_right <= VAR_BIN_OP_EQ_uxn_c_l148_c21_bff5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l148_c21_bff5_return_output := BIN_OP_EQ_uxn_c_l148_c21_bff5_return_output;

     -- BIN_OP_PLUS[uxn_c_l150_c25_5f53] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l150_c25_5f53_left <= VAR_BIN_OP_PLUS_uxn_c_l150_c25_5f53_left;
     BIN_OP_PLUS_uxn_c_l150_c25_5f53_right <= VAR_BIN_OP_PLUS_uxn_c_l150_c25_5f53_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l150_c25_5f53_return_output := BIN_OP_PLUS_uxn_c_l150_c25_5f53_return_output;

     -- CONST_SL_8[uxn_c_l146_c54_4256] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l146_c54_4256_x <= VAR_CONST_SL_8_uxn_c_l146_c54_4256_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l146_c54_4256_return_output := CONST_SL_8_uxn_c_l146_c54_4256_return_output;

     -- Submodule level 6
     VAR_BIN_OP_OR_uxn_c_l167_c3_977a_left := VAR_BIN_OP_AND_uxn_c_l154_c27_1a7e_return_output;
     VAR_MUX_uxn_c_l166_c3_1ad6_cond := VAR_BIN_OP_AND_uxn_c_l154_c27_1a7e_return_output;
     VAR_MUX_uxn_c_l148_c21_7ed1_cond := VAR_BIN_OP_EQ_uxn_c_l148_c21_bff5_return_output;
     VAR_MUX_uxn_c_l149_c22_a21e_cond := VAR_BIN_OP_EQ_uxn_c_l149_c22_10c0_return_output;
     VAR_MUX_uxn_c_l150_c6_2754_iftrue := resize(VAR_BIN_OP_PLUS_uxn_c_l150_c25_5f53_return_output, 16);
     VAR_MUX_uxn_c_l151_c6_f7f0_iffalse := resize(VAR_BIN_OP_PLUS_uxn_c_l151_c34_07c4_return_output, 16);
     VAR_BIN_OP_PLUS_uxn_c_l146_c54_171a_left := VAR_CONST_SL_8_uxn_c_l146_c54_4256_return_output;
     VAR_BIN_OP_AND_uxn_c_l153_c27_e25b_right := VAR_UNARY_OP_NOT_uxn_c_l153_c46_7452_return_output;
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l160_l167_DUPLICATE_4326_left := VAR_UNARY_OP_NOT_uint1_t_uxn_c_l160_l167_DUPLICATE_64bd_return_output;
     -- MUX[uxn_c_l149_c22_a21e] LATENCY=0
     -- Inputs
     MUX_uxn_c_l149_c22_a21e_cond <= VAR_MUX_uxn_c_l149_c22_a21e_cond;
     MUX_uxn_c_l149_c22_a21e_iftrue <= VAR_MUX_uxn_c_l149_c22_a21e_iftrue;
     MUX_uxn_c_l149_c22_a21e_iffalse <= VAR_MUX_uxn_c_l149_c22_a21e_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l149_c22_a21e_return_output := MUX_uxn_c_l149_c22_a21e_return_output;

     -- MUX[uxn_c_l166_c3_1ad6] LATENCY=0
     -- Inputs
     MUX_uxn_c_l166_c3_1ad6_cond <= VAR_MUX_uxn_c_l166_c3_1ad6_cond;
     MUX_uxn_c_l166_c3_1ad6_iftrue <= VAR_MUX_uxn_c_l166_c3_1ad6_iftrue;
     MUX_uxn_c_l166_c3_1ad6_iffalse <= VAR_MUX_uxn_c_l166_c3_1ad6_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l166_c3_1ad6_return_output := MUX_uxn_c_l166_c3_1ad6_return_output;

     -- BIN_OP_AND_uint1_t_uint1_t_uxn_c_l160_l167_DUPLICATE_4326 LATENCY=0
     -- Inputs
     BIN_OP_AND_uint1_t_uint1_t_uxn_c_l160_l167_DUPLICATE_4326_left <= VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l160_l167_DUPLICATE_4326_left;
     BIN_OP_AND_uint1_t_uint1_t_uxn_c_l160_l167_DUPLICATE_4326_right <= VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l160_l167_DUPLICATE_4326_right;
     -- Outputs
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l160_l167_DUPLICATE_4326_return_output := BIN_OP_AND_uint1_t_uint1_t_uxn_c_l160_l167_DUPLICATE_4326_return_output;

     -- MUX[uxn_c_l148_c21_7ed1] LATENCY=0
     -- Inputs
     MUX_uxn_c_l148_c21_7ed1_cond <= VAR_MUX_uxn_c_l148_c21_7ed1_cond;
     MUX_uxn_c_l148_c21_7ed1_iftrue <= VAR_MUX_uxn_c_l148_c21_7ed1_iftrue;
     MUX_uxn_c_l148_c21_7ed1_iffalse <= VAR_MUX_uxn_c_l148_c21_7ed1_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l148_c21_7ed1_return_output := MUX_uxn_c_l148_c21_7ed1_return_output;

     -- BIN_OP_PLUS[uxn_c_l146_c54_171a] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l146_c54_171a_left <= VAR_BIN_OP_PLUS_uxn_c_l146_c54_171a_left;
     BIN_OP_PLUS_uxn_c_l146_c54_171a_right <= VAR_BIN_OP_PLUS_uxn_c_l146_c54_171a_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l146_c54_171a_return_output := BIN_OP_PLUS_uxn_c_l146_c54_171a_return_output;

     -- BIN_OP_AND[uxn_c_l153_c27_e25b] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l153_c27_e25b_left <= VAR_BIN_OP_AND_uxn_c_l153_c27_e25b_left;
     BIN_OP_AND_uxn_c_l153_c27_e25b_right <= VAR_BIN_OP_AND_uxn_c_l153_c27_e25b_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l153_c27_e25b_return_output := BIN_OP_AND_uxn_c_l153_c27_e25b_return_output;

     -- Submodule level 7
     VAR_BIN_OP_OR_uxn_c_l160_c3_38ed_left := VAR_BIN_OP_AND_uxn_c_l153_c27_e25b_return_output;
     VAR_MUX_uxn_c_l159_c3_82b7_cond := VAR_BIN_OP_AND_uxn_c_l153_c27_e25b_return_output;
     VAR_BIN_OP_AND_uxn_c_l160_c22_77a8_left := VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l160_l167_DUPLICATE_4326_return_output;
     VAR_BIN_OP_AND_uxn_c_l167_c22_b8e9_left := VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l160_l167_DUPLICATE_4326_return_output;
     VAR_MUX_uxn_c_l146_c35_49fa_iftrue := resize(VAR_BIN_OP_PLUS_uxn_c_l146_c54_171a_return_output, 16);
     VAR_BIN_OP_AND_uxn_c_l170_c38_628b_left := VAR_MUX_uxn_c_l148_c21_7ed1_return_output;
     VAR_MUX_uxn_c_l150_c6_2754_cond := VAR_MUX_uxn_c_l148_c21_7ed1_return_output;
     VAR_MUX_uxn_c_l151_c6_f7f0_cond := VAR_MUX_uxn_c_l148_c21_7ed1_return_output;
     REG_VAR_is_new_fill_row := VAR_MUX_uxn_c_l148_c21_7ed1_return_output;
     VAR_BIN_OP_AND_uxn_c_l170_c38_628b_right := VAR_MUX_uxn_c_l149_c22_a21e_return_output;
     REG_VAR_is_last_fill_col := VAR_MUX_uxn_c_l149_c22_a21e_return_output;
     VAR_fg_vram_update_uxn_c_l163_c27_a092_write_value := VAR_MUX_uxn_c_l166_c3_1ad6_return_output;
     -- BIN_OP_AND[uxn_c_l160_c22_77a8] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l160_c22_77a8_left <= VAR_BIN_OP_AND_uxn_c_l160_c22_77a8_left;
     BIN_OP_AND_uxn_c_l160_c22_77a8_right <= VAR_BIN_OP_AND_uxn_c_l160_c22_77a8_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l160_c22_77a8_return_output := BIN_OP_AND_uxn_c_l160_c22_77a8_return_output;

     -- MUX[uxn_c_l159_c3_82b7] LATENCY=0
     -- Inputs
     MUX_uxn_c_l159_c3_82b7_cond <= VAR_MUX_uxn_c_l159_c3_82b7_cond;
     MUX_uxn_c_l159_c3_82b7_iftrue <= VAR_MUX_uxn_c_l159_c3_82b7_iftrue;
     MUX_uxn_c_l159_c3_82b7_iffalse <= VAR_MUX_uxn_c_l159_c3_82b7_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l159_c3_82b7_return_output := MUX_uxn_c_l159_c3_82b7_return_output;

     -- MUX[uxn_c_l151_c6_f7f0] LATENCY=0
     -- Inputs
     MUX_uxn_c_l151_c6_f7f0_cond <= VAR_MUX_uxn_c_l151_c6_f7f0_cond;
     MUX_uxn_c_l151_c6_f7f0_iftrue <= VAR_MUX_uxn_c_l151_c6_f7f0_iftrue;
     MUX_uxn_c_l151_c6_f7f0_iffalse <= VAR_MUX_uxn_c_l151_c6_f7f0_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l151_c6_f7f0_return_output := MUX_uxn_c_l151_c6_f7f0_return_output;

     -- BIN_OP_AND[uxn_c_l167_c22_b8e9] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l167_c22_b8e9_left <= VAR_BIN_OP_AND_uxn_c_l167_c22_b8e9_left;
     BIN_OP_AND_uxn_c_l167_c22_b8e9_right <= VAR_BIN_OP_AND_uxn_c_l167_c22_b8e9_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l167_c22_b8e9_return_output := BIN_OP_AND_uxn_c_l167_c22_b8e9_return_output;

     -- BIN_OP_AND[uxn_c_l170_c38_628b] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l170_c38_628b_left <= VAR_BIN_OP_AND_uxn_c_l170_c38_628b_left;
     BIN_OP_AND_uxn_c_l170_c38_628b_right <= VAR_BIN_OP_AND_uxn_c_l170_c38_628b_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l170_c38_628b_return_output := BIN_OP_AND_uxn_c_l170_c38_628b_return_output;

     -- MUX[uxn_c_l150_c6_2754] LATENCY=0
     -- Inputs
     MUX_uxn_c_l150_c6_2754_cond <= VAR_MUX_uxn_c_l150_c6_2754_cond;
     MUX_uxn_c_l150_c6_2754_iftrue <= VAR_MUX_uxn_c_l150_c6_2754_iftrue;
     MUX_uxn_c_l150_c6_2754_iffalse <= VAR_MUX_uxn_c_l150_c6_2754_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l150_c6_2754_return_output := MUX_uxn_c_l150_c6_2754_return_output;

     -- MUX[uxn_c_l146_c35_49fa] LATENCY=0
     -- Inputs
     MUX_uxn_c_l146_c35_49fa_cond <= VAR_MUX_uxn_c_l146_c35_49fa_cond;
     MUX_uxn_c_l146_c35_49fa_iftrue <= VAR_MUX_uxn_c_l146_c35_49fa_iftrue;
     MUX_uxn_c_l146_c35_49fa_iffalse <= VAR_MUX_uxn_c_l146_c35_49fa_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l146_c35_49fa_return_output := MUX_uxn_c_l146_c35_49fa_return_output;

     -- Submodule level 8
     VAR_BIN_OP_OR_uxn_c_l160_c3_38ed_right := VAR_BIN_OP_AND_uxn_c_l160_c22_77a8_return_output;
     VAR_BIN_OP_OR_uxn_c_l167_c3_977a_right := VAR_BIN_OP_AND_uxn_c_l167_c22_b8e9_return_output;
     VAR_UNARY_OP_NOT_uxn_c_l170_c38_3853_expr := VAR_BIN_OP_AND_uxn_c_l170_c38_628b_return_output;
     VAR_bg_vram_update_uxn_c_l156_c27_b8ef_write_address := VAR_MUX_uxn_c_l146_c35_49fa_return_output;
     VAR_fg_vram_update_uxn_c_l163_c27_a092_write_address := VAR_MUX_uxn_c_l146_c35_49fa_return_output;
     REG_VAR_y := VAR_MUX_uxn_c_l150_c6_2754_return_output;
     REG_VAR_x := VAR_MUX_uxn_c_l151_c6_f7f0_return_output;
     VAR_bg_vram_update_uxn_c_l156_c27_b8ef_write_value := VAR_MUX_uxn_c_l159_c3_82b7_return_output;
     -- BIN_OP_OR[uxn_c_l160_c3_38ed] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l160_c3_38ed_left <= VAR_BIN_OP_OR_uxn_c_l160_c3_38ed_left;
     BIN_OP_OR_uxn_c_l160_c3_38ed_right <= VAR_BIN_OP_OR_uxn_c_l160_c3_38ed_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l160_c3_38ed_return_output := BIN_OP_OR_uxn_c_l160_c3_38ed_return_output;

     -- BIN_OP_OR[uxn_c_l167_c3_977a] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l167_c3_977a_left <= VAR_BIN_OP_OR_uxn_c_l167_c3_977a_left;
     BIN_OP_OR_uxn_c_l167_c3_977a_right <= VAR_BIN_OP_OR_uxn_c_l167_c3_977a_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l167_c3_977a_return_output := BIN_OP_OR_uxn_c_l167_c3_977a_return_output;

     -- UNARY_OP_NOT[uxn_c_l170_c38_3853] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l170_c38_3853_expr <= VAR_UNARY_OP_NOT_uxn_c_l170_c38_3853_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l170_c38_3853_return_output := UNARY_OP_NOT_uxn_c_l170_c38_3853_return_output;

     -- Submodule level 9
     VAR_bg_vram_update_uxn_c_l156_c27_b8ef_write_enable := VAR_BIN_OP_OR_uxn_c_l160_c3_38ed_return_output;
     VAR_fg_vram_update_uxn_c_l163_c27_a092_write_enable := VAR_BIN_OP_OR_uxn_c_l167_c3_977a_return_output;
     VAR_MUX_uxn_c_l170_c19_ee4c_iftrue := VAR_UNARY_OP_NOT_uxn_c_l170_c38_3853_return_output;
     -- bg_vram_update[uxn_c_l156_c27_b8ef] LATENCY=0
     -- Clock enable
     bg_vram_update_uxn_c_l156_c27_b8ef_CLOCK_ENABLE <= VAR_bg_vram_update_uxn_c_l156_c27_b8ef_CLOCK_ENABLE;
     -- Inputs
     bg_vram_update_uxn_c_l156_c27_b8ef_read_address <= VAR_bg_vram_update_uxn_c_l156_c27_b8ef_read_address;
     bg_vram_update_uxn_c_l156_c27_b8ef_write_address <= VAR_bg_vram_update_uxn_c_l156_c27_b8ef_write_address;
     bg_vram_update_uxn_c_l156_c27_b8ef_write_value <= VAR_bg_vram_update_uxn_c_l156_c27_b8ef_write_value;
     bg_vram_update_uxn_c_l156_c27_b8ef_write_enable <= VAR_bg_vram_update_uxn_c_l156_c27_b8ef_write_enable;
     -- Outputs
     VAR_bg_vram_update_uxn_c_l156_c27_b8ef_return_output := bg_vram_update_uxn_c_l156_c27_b8ef_return_output;

     -- MUX[uxn_c_l170_c19_ee4c] LATENCY=0
     -- Inputs
     MUX_uxn_c_l170_c19_ee4c_cond <= VAR_MUX_uxn_c_l170_c19_ee4c_cond;
     MUX_uxn_c_l170_c19_ee4c_iftrue <= VAR_MUX_uxn_c_l170_c19_ee4c_iftrue;
     MUX_uxn_c_l170_c19_ee4c_iffalse <= VAR_MUX_uxn_c_l170_c19_ee4c_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l170_c19_ee4c_return_output := MUX_uxn_c_l170_c19_ee4c_return_output;

     -- fg_vram_update[uxn_c_l163_c27_a092] LATENCY=0
     -- Clock enable
     fg_vram_update_uxn_c_l163_c27_a092_CLOCK_ENABLE <= VAR_fg_vram_update_uxn_c_l163_c27_a092_CLOCK_ENABLE;
     -- Inputs
     fg_vram_update_uxn_c_l163_c27_a092_read_address <= VAR_fg_vram_update_uxn_c_l163_c27_a092_read_address;
     fg_vram_update_uxn_c_l163_c27_a092_write_address <= VAR_fg_vram_update_uxn_c_l163_c27_a092_write_address;
     fg_vram_update_uxn_c_l163_c27_a092_write_value <= VAR_fg_vram_update_uxn_c_l163_c27_a092_write_value;
     fg_vram_update_uxn_c_l163_c27_a092_write_enable <= VAR_fg_vram_update_uxn_c_l163_c27_a092_write_enable;
     -- Outputs
     VAR_fg_vram_update_uxn_c_l163_c27_a092_return_output := fg_vram_update_uxn_c_l163_c27_a092_return_output;

     -- Submodule level 10
     REG_VAR_is_fill_active := VAR_MUX_uxn_c_l170_c19_ee4c_return_output;
     VAR_MUX_uxn_c_l173_c17_551e_iftrue := VAR_bg_vram_update_uxn_c_l156_c27_b8ef_return_output;
     VAR_BIN_OP_EQ_uxn_c_l173_c17_acd6_left := VAR_fg_vram_update_uxn_c_l163_c27_a092_return_output;
     VAR_MUX_uxn_c_l173_c17_551e_iffalse := VAR_fg_vram_update_uxn_c_l163_c27_a092_return_output;
     -- BIN_OP_EQ[uxn_c_l173_c17_acd6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l173_c17_acd6_left <= VAR_BIN_OP_EQ_uxn_c_l173_c17_acd6_left;
     BIN_OP_EQ_uxn_c_l173_c17_acd6_right <= VAR_BIN_OP_EQ_uxn_c_l173_c17_acd6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l173_c17_acd6_return_output := BIN_OP_EQ_uxn_c_l173_c17_acd6_return_output;

     -- Submodule level 11
     VAR_MUX_uxn_c_l173_c17_551e_cond := VAR_BIN_OP_EQ_uxn_c_l173_c17_acd6_return_output;
     -- MUX[uxn_c_l173_c17_551e] LATENCY=0
     -- Inputs
     MUX_uxn_c_l173_c17_551e_cond <= VAR_MUX_uxn_c_l173_c17_551e_cond;
     MUX_uxn_c_l173_c17_551e_iftrue <= VAR_MUX_uxn_c_l173_c17_551e_iftrue;
     MUX_uxn_c_l173_c17_551e_iffalse <= VAR_MUX_uxn_c_l173_c17_551e_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l173_c17_551e_return_output := MUX_uxn_c_l173_c17_551e_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_269d_uxn_c_l115_l176_DUPLICATE_9a4a LATENCY=0
     VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_269d_uxn_c_l115_l176_DUPLICATE_9a4a_return_output := CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_269d(
     VAR_MUX_uxn_c_l172_c25_d227_return_output,
     VAR_MUX_uxn_c_l173_c17_551e_return_output,
     VAR_MUX_uxn_c_l170_c19_ee4c_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_269d_uxn_c_l115_l176_DUPLICATE_9a4a_return_output;
     VAR_return_output := VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_269d_uxn_c_l115_l176_DUPLICATE_9a4a_return_output;
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
