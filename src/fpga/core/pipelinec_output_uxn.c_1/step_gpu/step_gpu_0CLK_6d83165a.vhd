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
-- CONST_SR_4[uxn_c_l126_c52_e270]
signal CONST_SR_4_uxn_c_l126_c52_e270_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_c_l126_c52_e270_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_c_l126_c25_0157]
signal BIN_OP_AND_uxn_c_l126_c25_0157_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l126_c25_0157_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l126_c25_0157_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_c_l129_c22_74ff]
signal UNARY_OP_NOT_uxn_c_l129_c22_74ff_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l129_c22_74ff_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l129_c6_b384]
signal BIN_OP_AND_uxn_c_l129_c6_b384_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l129_c6_b384_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l129_c6_b384_return_output : unsigned(0 downto 0);

-- is_fill_active_MUX[uxn_c_l129_c2_1159]
signal is_fill_active_MUX_uxn_c_l129_c2_1159_cond : unsigned(0 downto 0);
signal is_fill_active_MUX_uxn_c_l129_c2_1159_iftrue : unsigned(0 downto 0);
signal is_fill_active_MUX_uxn_c_l129_c2_1159_iffalse : unsigned(0 downto 0);
signal is_fill_active_MUX_uxn_c_l129_c2_1159_return_output : unsigned(0 downto 0);

-- is_fill_top_MUX[uxn_c_l129_c2_1159]
signal is_fill_top_MUX_uxn_c_l129_c2_1159_cond : unsigned(0 downto 0);
signal is_fill_top_MUX_uxn_c_l129_c2_1159_iftrue : unsigned(0 downto 0);
signal is_fill_top_MUX_uxn_c_l129_c2_1159_iffalse : unsigned(0 downto 0);
signal is_fill_top_MUX_uxn_c_l129_c2_1159_return_output : unsigned(0 downto 0);

-- fill_y0_MUX[uxn_c_l129_c2_1159]
signal fill_y0_MUX_uxn_c_l129_c2_1159_cond : unsigned(0 downto 0);
signal fill_y0_MUX_uxn_c_l129_c2_1159_iftrue : unsigned(15 downto 0);
signal fill_y0_MUX_uxn_c_l129_c2_1159_iffalse : unsigned(15 downto 0);
signal fill_y0_MUX_uxn_c_l129_c2_1159_return_output : unsigned(15 downto 0);

-- fill_y1_MUX[uxn_c_l129_c2_1159]
signal fill_y1_MUX_uxn_c_l129_c2_1159_cond : unsigned(0 downto 0);
signal fill_y1_MUX_uxn_c_l129_c2_1159_iftrue : unsigned(15 downto 0);
signal fill_y1_MUX_uxn_c_l129_c2_1159_iffalse : unsigned(15 downto 0);
signal fill_y1_MUX_uxn_c_l129_c2_1159_return_output : unsigned(15 downto 0);

-- fill_layer_MUX[uxn_c_l129_c2_1159]
signal fill_layer_MUX_uxn_c_l129_c2_1159_cond : unsigned(0 downto 0);
signal fill_layer_MUX_uxn_c_l129_c2_1159_iftrue : unsigned(0 downto 0);
signal fill_layer_MUX_uxn_c_l129_c2_1159_iffalse : unsigned(0 downto 0);
signal fill_layer_MUX_uxn_c_l129_c2_1159_return_output : unsigned(0 downto 0);

-- fill_x0_MUX[uxn_c_l129_c2_1159]
signal fill_x0_MUX_uxn_c_l129_c2_1159_cond : unsigned(0 downto 0);
signal fill_x0_MUX_uxn_c_l129_c2_1159_iftrue : unsigned(15 downto 0);
signal fill_x0_MUX_uxn_c_l129_c2_1159_iffalse : unsigned(15 downto 0);
signal fill_x0_MUX_uxn_c_l129_c2_1159_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_c_l129_c2_1159]
signal x_MUX_uxn_c_l129_c2_1159_cond : unsigned(0 downto 0);
signal x_MUX_uxn_c_l129_c2_1159_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_c_l129_c2_1159_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_c_l129_c2_1159_return_output : unsigned(15 downto 0);

-- fill_color_MUX[uxn_c_l129_c2_1159]
signal fill_color_MUX_uxn_c_l129_c2_1159_cond : unsigned(0 downto 0);
signal fill_color_MUX_uxn_c_l129_c2_1159_iftrue : unsigned(1 downto 0);
signal fill_color_MUX_uxn_c_l129_c2_1159_iffalse : unsigned(1 downto 0);
signal fill_color_MUX_uxn_c_l129_c2_1159_return_output : unsigned(1 downto 0);

-- y_MUX[uxn_c_l129_c2_1159]
signal y_MUX_uxn_c_l129_c2_1159_cond : unsigned(0 downto 0);
signal y_MUX_uxn_c_l129_c2_1159_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_c_l129_c2_1159_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_c_l129_c2_1159_return_output : unsigned(15 downto 0);

-- is_fill_left_MUX[uxn_c_l129_c2_1159]
signal is_fill_left_MUX_uxn_c_l129_c2_1159_cond : unsigned(0 downto 0);
signal is_fill_left_MUX_uxn_c_l129_c2_1159_iftrue : unsigned(0 downto 0);
signal is_fill_left_MUX_uxn_c_l129_c2_1159_iffalse : unsigned(0 downto 0);
signal is_fill_left_MUX_uxn_c_l129_c2_1159_return_output : unsigned(0 downto 0);

-- fill_x1_MUX[uxn_c_l129_c2_1159]
signal fill_x1_MUX_uxn_c_l129_c2_1159_cond : unsigned(0 downto 0);
signal fill_x1_MUX_uxn_c_l129_c2_1159_iftrue : unsigned(15 downto 0);
signal fill_x1_MUX_uxn_c_l129_c2_1159_iffalse : unsigned(15 downto 0);
signal fill_x1_MUX_uxn_c_l129_c2_1159_return_output : unsigned(15 downto 0);

-- CONST_SR_2[uxn_c_l131_c20_57b4]
signal CONST_SR_2_uxn_c_l131_c20_57b4_x : unsigned(7 downto 0);
signal CONST_SR_2_uxn_c_l131_c20_57b4_return_output : unsigned(7 downto 0);

-- CONST_SR_3[uxn_c_l132_c18_8204]
signal CONST_SR_3_uxn_c_l132_c18_8204_x : unsigned(7 downto 0);
signal CONST_SR_3_uxn_c_l132_c18_8204_return_output : unsigned(7 downto 0);

-- MUX[uxn_c_l133_c13_b149]
signal MUX_uxn_c_l133_c13_b149_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l133_c13_b149_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l133_c13_b149_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l133_c13_b149_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_c_l134_c28_428c]
signal BIN_OP_AND_uxn_c_l134_c28_428c_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l134_c28_428c_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l134_c28_428c_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l134_c13_d4be]
signal MUX_uxn_c_l134_c13_d4be_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l134_c13_d4be_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l134_c13_d4be_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l134_c13_d4be_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l135_c13_ba7f]
signal MUX_uxn_c_l135_c13_ba7f_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l135_c13_ba7f_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l135_c13_ba7f_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l135_c13_ba7f_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_c_l136_c32_7a7b]
signal BIN_OP_AND_uxn_c_l136_c32_7a7b_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l136_c32_7a7b_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l136_c32_7a7b_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l136_c13_cbaa]
signal MUX_uxn_c_l136_c13_cbaa_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l136_c13_cbaa_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l136_c13_cbaa_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l136_c13_cbaa_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_c_l146_c54_a4eb]
signal CONST_SL_8_uxn_c_l146_c54_a4eb_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_c_l146_c54_a4eb_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_c_l146_c54_75a8]
signal BIN_OP_PLUS_uxn_c_l146_c54_75a8_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l146_c54_75a8_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l146_c54_75a8_return_output : unsigned(16 downto 0);

-- MUX[uxn_c_l146_c35_55b5]
signal MUX_uxn_c_l146_c35_55b5_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l146_c35_55b5_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l146_c35_55b5_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l146_c35_55b5_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l148_c21_4b52]
signal BIN_OP_EQ_uxn_c_l148_c21_4b52_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l148_c21_4b52_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l148_c21_4b52_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l148_c21_36ee]
signal MUX_uxn_c_l148_c21_36ee_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l148_c21_36ee_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l148_c21_36ee_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l148_c21_36ee_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l149_c22_0d5e]
signal BIN_OP_EQ_uxn_c_l149_c22_0d5e_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l149_c22_0d5e_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l149_c22_0d5e_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l149_c22_c409]
signal MUX_uxn_c_l149_c22_c409_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l149_c22_c409_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l149_c22_c409_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l149_c22_c409_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l150_c25_6e2c]
signal BIN_OP_PLUS_uxn_c_l150_c25_6e2c_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l150_c25_6e2c_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l150_c25_6e2c_return_output : unsigned(16 downto 0);

-- MUX[uxn_c_l150_c6_343a]
signal MUX_uxn_c_l150_c6_343a_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l150_c6_343a_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l150_c6_343a_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l150_c6_343a_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_c_l151_c34_ea3e]
signal BIN_OP_PLUS_uxn_c_l151_c34_ea3e_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l151_c34_ea3e_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l151_c34_ea3e_return_output : unsigned(16 downto 0);

-- MUX[uxn_c_l151_c6_4a06]
signal MUX_uxn_c_l151_c6_4a06_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l151_c6_4a06_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l151_c6_4a06_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l151_c6_4a06_return_output : unsigned(15 downto 0);

-- UNARY_OP_NOT[uxn_c_l153_c46_45ff]
signal UNARY_OP_NOT_uxn_c_l153_c46_45ff_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l153_c46_45ff_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l153_c27_d321]
signal BIN_OP_AND_uxn_c_l153_c27_d321_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l153_c27_d321_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l153_c27_d321_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l154_c27_4f34]
signal BIN_OP_AND_uxn_c_l154_c27_4f34_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l154_c27_4f34_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l154_c27_4f34_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l159_c3_27c4]
signal MUX_uxn_c_l159_c3_27c4_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l159_c3_27c4_iftrue : unsigned(1 downto 0);
signal MUX_uxn_c_l159_c3_27c4_iffalse : unsigned(1 downto 0);
signal MUX_uxn_c_l159_c3_27c4_return_output : unsigned(1 downto 0);

-- UNARY_OP_NOT[uxn_c_l160_c57_790d]
signal UNARY_OP_NOT_uxn_c_l160_c57_790d_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l160_c57_790d_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l160_c22_9dbd]
signal BIN_OP_AND_uxn_c_l160_c22_9dbd_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l160_c22_9dbd_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l160_c22_9dbd_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_c_l160_c3_0239]
signal BIN_OP_OR_uxn_c_l160_c3_0239_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l160_c3_0239_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l160_c3_0239_return_output : unsigned(0 downto 0);

-- bg_vram_update[uxn_c_l156_c27_1810]
signal bg_vram_update_uxn_c_l156_c27_1810_CLOCK_ENABLE : unsigned(0 downto 0);
signal bg_vram_update_uxn_c_l156_c27_1810_read_address : unsigned(15 downto 0);
signal bg_vram_update_uxn_c_l156_c27_1810_write_address : unsigned(15 downto 0);
signal bg_vram_update_uxn_c_l156_c27_1810_write_value : unsigned(1 downto 0);
signal bg_vram_update_uxn_c_l156_c27_1810_write_enable : unsigned(0 downto 0);
signal bg_vram_update_uxn_c_l156_c27_1810_return_output : unsigned(1 downto 0);

-- MUX[uxn_c_l166_c3_c0f9]
signal MUX_uxn_c_l166_c3_c0f9_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l166_c3_c0f9_iftrue : unsigned(1 downto 0);
signal MUX_uxn_c_l166_c3_c0f9_iffalse : unsigned(1 downto 0);
signal MUX_uxn_c_l166_c3_c0f9_return_output : unsigned(1 downto 0);

-- BIN_OP_AND[uxn_c_l167_c22_70b9]
signal BIN_OP_AND_uxn_c_l167_c22_70b9_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l167_c22_70b9_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l167_c22_70b9_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_c_l167_c3_1377]
signal BIN_OP_OR_uxn_c_l167_c3_1377_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l167_c3_1377_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l167_c3_1377_return_output : unsigned(0 downto 0);

-- fg_vram_update[uxn_c_l163_c27_9980]
signal fg_vram_update_uxn_c_l163_c27_9980_CLOCK_ENABLE : unsigned(0 downto 0);
signal fg_vram_update_uxn_c_l163_c27_9980_read_address : unsigned(15 downto 0);
signal fg_vram_update_uxn_c_l163_c27_9980_write_address : unsigned(15 downto 0);
signal fg_vram_update_uxn_c_l163_c27_9980_write_value : unsigned(1 downto 0);
signal fg_vram_update_uxn_c_l163_c27_9980_write_enable : unsigned(0 downto 0);
signal fg_vram_update_uxn_c_l163_c27_9980_return_output : unsigned(1 downto 0);

-- BIN_OP_AND[uxn_c_l170_c38_be6e]
signal BIN_OP_AND_uxn_c_l170_c38_be6e_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l170_c38_be6e_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l170_c38_be6e_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_c_l170_c38_7d75]
signal UNARY_OP_NOT_uxn_c_l170_c38_7d75_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l170_c38_7d75_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l170_c19_fed1]
signal MUX_uxn_c_l170_c19_fed1_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l170_c19_fed1_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l170_c19_fed1_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l170_c19_fed1_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l171_c19_f9f4]
signal BIN_OP_EQ_uxn_c_l171_c19_f9f4_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l171_c19_f9f4_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l171_c19_f9f4_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l171_c76_a184]
signal BIN_OP_PLUS_uxn_c_l171_c76_a184_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l171_c76_a184_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l171_c76_a184_return_output : unsigned(16 downto 0);

-- MUX[uxn_c_l171_c50_fa83]
signal MUX_uxn_c_l171_c50_fa83_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l171_c50_fa83_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l171_c50_fa83_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l171_c50_fa83_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l171_c19_7d13]
signal MUX_uxn_c_l171_c19_7d13_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l171_c19_7d13_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l171_c19_7d13_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l171_c19_7d13_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l172_c25_2222]
signal BIN_OP_EQ_uxn_c_l172_c25_2222_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l172_c25_2222_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l172_c25_2222_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l172_c25_dad8]
signal MUX_uxn_c_l172_c25_dad8_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l172_c25_dad8_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l172_c25_dad8_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l172_c25_dad8_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l173_c17_28a1]
signal BIN_OP_EQ_uxn_c_l173_c17_28a1_left : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l173_c17_28a1_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l173_c17_28a1_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l173_c17_0ac1]
signal MUX_uxn_c_l173_c17_0ac1_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l173_c17_0ac1_iftrue : unsigned(1 downto 0);
signal MUX_uxn_c_l173_c17_0ac1_iffalse : unsigned(1 downto 0);
signal MUX_uxn_c_l173_c17_0ac1_return_output : unsigned(1 downto 0);

-- CONST_SR_8_uint16_t_uxn_c_l133_l135_DUPLICATE_8c61
signal CONST_SR_8_uint16_t_uxn_c_l133_l135_DUPLICATE_8c61_x : unsigned(15 downto 0);
signal CONST_SR_8_uint16_t_uxn_c_l133_l135_DUPLICATE_8c61_return_output : unsigned(15 downto 0);

-- UNARY_OP_NOT_uint1_t_uxn_c_l160_l167_DUPLICATE_0822
signal UNARY_OP_NOT_uint1_t_uxn_c_l160_l167_DUPLICATE_0822_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uint1_t_uxn_c_l160_l167_DUPLICATE_0822_return_output : unsigned(0 downto 0);

-- BIN_OP_AND_uint1_t_uint1_t_uxn_c_l160_l167_DUPLICATE_d5e1
signal BIN_OP_AND_uint1_t_uint1_t_uxn_c_l160_l167_DUPLICATE_d5e1_left : unsigned(0 downto 0);
signal BIN_OP_AND_uint1_t_uint1_t_uxn_c_l160_l167_DUPLICATE_d5e1_right : unsigned(0 downto 0);
signal BIN_OP_AND_uint1_t_uint1_t_uxn_c_l160_l167_DUPLICATE_d5e1_return_output : unsigned(0 downto 0);

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
-- CONST_SR_4_uxn_c_l126_c52_e270
CONST_SR_4_uxn_c_l126_c52_e270 : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_c_l126_c52_e270_x,
CONST_SR_4_uxn_c_l126_c52_e270_return_output);

-- BIN_OP_AND_uxn_c_l126_c25_0157
BIN_OP_AND_uxn_c_l126_c25_0157 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l126_c25_0157_left,
BIN_OP_AND_uxn_c_l126_c25_0157_right,
BIN_OP_AND_uxn_c_l126_c25_0157_return_output);

-- UNARY_OP_NOT_uxn_c_l129_c22_74ff
UNARY_OP_NOT_uxn_c_l129_c22_74ff : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l129_c22_74ff_expr,
UNARY_OP_NOT_uxn_c_l129_c22_74ff_return_output);

-- BIN_OP_AND_uxn_c_l129_c6_b384
BIN_OP_AND_uxn_c_l129_c6_b384 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l129_c6_b384_left,
BIN_OP_AND_uxn_c_l129_c6_b384_right,
BIN_OP_AND_uxn_c_l129_c6_b384_return_output);

-- is_fill_active_MUX_uxn_c_l129_c2_1159
is_fill_active_MUX_uxn_c_l129_c2_1159 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_active_MUX_uxn_c_l129_c2_1159_cond,
is_fill_active_MUX_uxn_c_l129_c2_1159_iftrue,
is_fill_active_MUX_uxn_c_l129_c2_1159_iffalse,
is_fill_active_MUX_uxn_c_l129_c2_1159_return_output);

-- is_fill_top_MUX_uxn_c_l129_c2_1159
is_fill_top_MUX_uxn_c_l129_c2_1159 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_top_MUX_uxn_c_l129_c2_1159_cond,
is_fill_top_MUX_uxn_c_l129_c2_1159_iftrue,
is_fill_top_MUX_uxn_c_l129_c2_1159_iffalse,
is_fill_top_MUX_uxn_c_l129_c2_1159_return_output);

-- fill_y0_MUX_uxn_c_l129_c2_1159
fill_y0_MUX_uxn_c_l129_c2_1159 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_y0_MUX_uxn_c_l129_c2_1159_cond,
fill_y0_MUX_uxn_c_l129_c2_1159_iftrue,
fill_y0_MUX_uxn_c_l129_c2_1159_iffalse,
fill_y0_MUX_uxn_c_l129_c2_1159_return_output);

-- fill_y1_MUX_uxn_c_l129_c2_1159
fill_y1_MUX_uxn_c_l129_c2_1159 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_y1_MUX_uxn_c_l129_c2_1159_cond,
fill_y1_MUX_uxn_c_l129_c2_1159_iftrue,
fill_y1_MUX_uxn_c_l129_c2_1159_iffalse,
fill_y1_MUX_uxn_c_l129_c2_1159_return_output);

-- fill_layer_MUX_uxn_c_l129_c2_1159
fill_layer_MUX_uxn_c_l129_c2_1159 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
fill_layer_MUX_uxn_c_l129_c2_1159_cond,
fill_layer_MUX_uxn_c_l129_c2_1159_iftrue,
fill_layer_MUX_uxn_c_l129_c2_1159_iffalse,
fill_layer_MUX_uxn_c_l129_c2_1159_return_output);

-- fill_x0_MUX_uxn_c_l129_c2_1159
fill_x0_MUX_uxn_c_l129_c2_1159 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_x0_MUX_uxn_c_l129_c2_1159_cond,
fill_x0_MUX_uxn_c_l129_c2_1159_iftrue,
fill_x0_MUX_uxn_c_l129_c2_1159_iffalse,
fill_x0_MUX_uxn_c_l129_c2_1159_return_output);

-- x_MUX_uxn_c_l129_c2_1159
x_MUX_uxn_c_l129_c2_1159 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_c_l129_c2_1159_cond,
x_MUX_uxn_c_l129_c2_1159_iftrue,
x_MUX_uxn_c_l129_c2_1159_iffalse,
x_MUX_uxn_c_l129_c2_1159_return_output);

-- fill_color_MUX_uxn_c_l129_c2_1159
fill_color_MUX_uxn_c_l129_c2_1159 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
fill_color_MUX_uxn_c_l129_c2_1159_cond,
fill_color_MUX_uxn_c_l129_c2_1159_iftrue,
fill_color_MUX_uxn_c_l129_c2_1159_iffalse,
fill_color_MUX_uxn_c_l129_c2_1159_return_output);

-- y_MUX_uxn_c_l129_c2_1159
y_MUX_uxn_c_l129_c2_1159 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_c_l129_c2_1159_cond,
y_MUX_uxn_c_l129_c2_1159_iftrue,
y_MUX_uxn_c_l129_c2_1159_iffalse,
y_MUX_uxn_c_l129_c2_1159_return_output);

-- is_fill_left_MUX_uxn_c_l129_c2_1159
is_fill_left_MUX_uxn_c_l129_c2_1159 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_left_MUX_uxn_c_l129_c2_1159_cond,
is_fill_left_MUX_uxn_c_l129_c2_1159_iftrue,
is_fill_left_MUX_uxn_c_l129_c2_1159_iffalse,
is_fill_left_MUX_uxn_c_l129_c2_1159_return_output);

-- fill_x1_MUX_uxn_c_l129_c2_1159
fill_x1_MUX_uxn_c_l129_c2_1159 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_x1_MUX_uxn_c_l129_c2_1159_cond,
fill_x1_MUX_uxn_c_l129_c2_1159_iftrue,
fill_x1_MUX_uxn_c_l129_c2_1159_iffalse,
fill_x1_MUX_uxn_c_l129_c2_1159_return_output);

-- CONST_SR_2_uxn_c_l131_c20_57b4
CONST_SR_2_uxn_c_l131_c20_57b4 : entity work.CONST_SR_2_uint8_t_0CLK_de264c78 port map (
CONST_SR_2_uxn_c_l131_c20_57b4_x,
CONST_SR_2_uxn_c_l131_c20_57b4_return_output);

-- CONST_SR_3_uxn_c_l132_c18_8204
CONST_SR_3_uxn_c_l132_c18_8204 : entity work.CONST_SR_3_uint8_t_0CLK_de264c78 port map (
CONST_SR_3_uxn_c_l132_c18_8204_x,
CONST_SR_3_uxn_c_l132_c18_8204_return_output);

-- MUX_uxn_c_l133_c13_b149
MUX_uxn_c_l133_c13_b149 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l133_c13_b149_cond,
MUX_uxn_c_l133_c13_b149_iftrue,
MUX_uxn_c_l133_c13_b149_iffalse,
MUX_uxn_c_l133_c13_b149_return_output);

-- BIN_OP_AND_uxn_c_l134_c28_428c
BIN_OP_AND_uxn_c_l134_c28_428c : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l134_c28_428c_left,
BIN_OP_AND_uxn_c_l134_c28_428c_right,
BIN_OP_AND_uxn_c_l134_c28_428c_return_output);

-- MUX_uxn_c_l134_c13_d4be
MUX_uxn_c_l134_c13_d4be : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l134_c13_d4be_cond,
MUX_uxn_c_l134_c13_d4be_iftrue,
MUX_uxn_c_l134_c13_d4be_iffalse,
MUX_uxn_c_l134_c13_d4be_return_output);

-- MUX_uxn_c_l135_c13_ba7f
MUX_uxn_c_l135_c13_ba7f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l135_c13_ba7f_cond,
MUX_uxn_c_l135_c13_ba7f_iftrue,
MUX_uxn_c_l135_c13_ba7f_iffalse,
MUX_uxn_c_l135_c13_ba7f_return_output);

-- BIN_OP_AND_uxn_c_l136_c32_7a7b
BIN_OP_AND_uxn_c_l136_c32_7a7b : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l136_c32_7a7b_left,
BIN_OP_AND_uxn_c_l136_c32_7a7b_right,
BIN_OP_AND_uxn_c_l136_c32_7a7b_return_output);

-- MUX_uxn_c_l136_c13_cbaa
MUX_uxn_c_l136_c13_cbaa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l136_c13_cbaa_cond,
MUX_uxn_c_l136_c13_cbaa_iftrue,
MUX_uxn_c_l136_c13_cbaa_iffalse,
MUX_uxn_c_l136_c13_cbaa_return_output);

-- CONST_SL_8_uxn_c_l146_c54_a4eb
CONST_SL_8_uxn_c_l146_c54_a4eb : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l146_c54_a4eb_x,
CONST_SL_8_uxn_c_l146_c54_a4eb_return_output);

-- BIN_OP_PLUS_uxn_c_l146_c54_75a8
BIN_OP_PLUS_uxn_c_l146_c54_75a8 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l146_c54_75a8_left,
BIN_OP_PLUS_uxn_c_l146_c54_75a8_right,
BIN_OP_PLUS_uxn_c_l146_c54_75a8_return_output);

-- MUX_uxn_c_l146_c35_55b5
MUX_uxn_c_l146_c35_55b5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l146_c35_55b5_cond,
MUX_uxn_c_l146_c35_55b5_iftrue,
MUX_uxn_c_l146_c35_55b5_iffalse,
MUX_uxn_c_l146_c35_55b5_return_output);

-- BIN_OP_EQ_uxn_c_l148_c21_4b52
BIN_OP_EQ_uxn_c_l148_c21_4b52 : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l148_c21_4b52_left,
BIN_OP_EQ_uxn_c_l148_c21_4b52_right,
BIN_OP_EQ_uxn_c_l148_c21_4b52_return_output);

-- MUX_uxn_c_l148_c21_36ee
MUX_uxn_c_l148_c21_36ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l148_c21_36ee_cond,
MUX_uxn_c_l148_c21_36ee_iftrue,
MUX_uxn_c_l148_c21_36ee_iffalse,
MUX_uxn_c_l148_c21_36ee_return_output);

-- BIN_OP_EQ_uxn_c_l149_c22_0d5e
BIN_OP_EQ_uxn_c_l149_c22_0d5e : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l149_c22_0d5e_left,
BIN_OP_EQ_uxn_c_l149_c22_0d5e_right,
BIN_OP_EQ_uxn_c_l149_c22_0d5e_return_output);

-- MUX_uxn_c_l149_c22_c409
MUX_uxn_c_l149_c22_c409 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l149_c22_c409_cond,
MUX_uxn_c_l149_c22_c409_iftrue,
MUX_uxn_c_l149_c22_c409_iffalse,
MUX_uxn_c_l149_c22_c409_return_output);

-- BIN_OP_PLUS_uxn_c_l150_c25_6e2c
BIN_OP_PLUS_uxn_c_l150_c25_6e2c : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l150_c25_6e2c_left,
BIN_OP_PLUS_uxn_c_l150_c25_6e2c_right,
BIN_OP_PLUS_uxn_c_l150_c25_6e2c_return_output);

-- MUX_uxn_c_l150_c6_343a
MUX_uxn_c_l150_c6_343a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l150_c6_343a_cond,
MUX_uxn_c_l150_c6_343a_iftrue,
MUX_uxn_c_l150_c6_343a_iffalse,
MUX_uxn_c_l150_c6_343a_return_output);

-- BIN_OP_PLUS_uxn_c_l151_c34_ea3e
BIN_OP_PLUS_uxn_c_l151_c34_ea3e : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l151_c34_ea3e_left,
BIN_OP_PLUS_uxn_c_l151_c34_ea3e_right,
BIN_OP_PLUS_uxn_c_l151_c34_ea3e_return_output);

-- MUX_uxn_c_l151_c6_4a06
MUX_uxn_c_l151_c6_4a06 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l151_c6_4a06_cond,
MUX_uxn_c_l151_c6_4a06_iftrue,
MUX_uxn_c_l151_c6_4a06_iffalse,
MUX_uxn_c_l151_c6_4a06_return_output);

-- UNARY_OP_NOT_uxn_c_l153_c46_45ff
UNARY_OP_NOT_uxn_c_l153_c46_45ff : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l153_c46_45ff_expr,
UNARY_OP_NOT_uxn_c_l153_c46_45ff_return_output);

-- BIN_OP_AND_uxn_c_l153_c27_d321
BIN_OP_AND_uxn_c_l153_c27_d321 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l153_c27_d321_left,
BIN_OP_AND_uxn_c_l153_c27_d321_right,
BIN_OP_AND_uxn_c_l153_c27_d321_return_output);

-- BIN_OP_AND_uxn_c_l154_c27_4f34
BIN_OP_AND_uxn_c_l154_c27_4f34 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l154_c27_4f34_left,
BIN_OP_AND_uxn_c_l154_c27_4f34_right,
BIN_OP_AND_uxn_c_l154_c27_4f34_return_output);

-- MUX_uxn_c_l159_c3_27c4
MUX_uxn_c_l159_c3_27c4 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
MUX_uxn_c_l159_c3_27c4_cond,
MUX_uxn_c_l159_c3_27c4_iftrue,
MUX_uxn_c_l159_c3_27c4_iffalse,
MUX_uxn_c_l159_c3_27c4_return_output);

-- UNARY_OP_NOT_uxn_c_l160_c57_790d
UNARY_OP_NOT_uxn_c_l160_c57_790d : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l160_c57_790d_expr,
UNARY_OP_NOT_uxn_c_l160_c57_790d_return_output);

-- BIN_OP_AND_uxn_c_l160_c22_9dbd
BIN_OP_AND_uxn_c_l160_c22_9dbd : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l160_c22_9dbd_left,
BIN_OP_AND_uxn_c_l160_c22_9dbd_right,
BIN_OP_AND_uxn_c_l160_c22_9dbd_return_output);

-- BIN_OP_OR_uxn_c_l160_c3_0239
BIN_OP_OR_uxn_c_l160_c3_0239 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l160_c3_0239_left,
BIN_OP_OR_uxn_c_l160_c3_0239_right,
BIN_OP_OR_uxn_c_l160_c3_0239_return_output);

-- bg_vram_update_uxn_c_l156_c27_1810
bg_vram_update_uxn_c_l156_c27_1810 : entity work.bg_vram_update_0CLK_6f2c5aad port map (
clk,
bg_vram_update_uxn_c_l156_c27_1810_CLOCK_ENABLE,
bg_vram_update_uxn_c_l156_c27_1810_read_address,
bg_vram_update_uxn_c_l156_c27_1810_write_address,
bg_vram_update_uxn_c_l156_c27_1810_write_value,
bg_vram_update_uxn_c_l156_c27_1810_write_enable,
bg_vram_update_uxn_c_l156_c27_1810_return_output);

-- MUX_uxn_c_l166_c3_c0f9
MUX_uxn_c_l166_c3_c0f9 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
MUX_uxn_c_l166_c3_c0f9_cond,
MUX_uxn_c_l166_c3_c0f9_iftrue,
MUX_uxn_c_l166_c3_c0f9_iffalse,
MUX_uxn_c_l166_c3_c0f9_return_output);

-- BIN_OP_AND_uxn_c_l167_c22_70b9
BIN_OP_AND_uxn_c_l167_c22_70b9 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l167_c22_70b9_left,
BIN_OP_AND_uxn_c_l167_c22_70b9_right,
BIN_OP_AND_uxn_c_l167_c22_70b9_return_output);

-- BIN_OP_OR_uxn_c_l167_c3_1377
BIN_OP_OR_uxn_c_l167_c3_1377 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l167_c3_1377_left,
BIN_OP_OR_uxn_c_l167_c3_1377_right,
BIN_OP_OR_uxn_c_l167_c3_1377_return_output);

-- fg_vram_update_uxn_c_l163_c27_9980
fg_vram_update_uxn_c_l163_c27_9980 : entity work.fg_vram_update_0CLK_6f2c5aad port map (
clk,
fg_vram_update_uxn_c_l163_c27_9980_CLOCK_ENABLE,
fg_vram_update_uxn_c_l163_c27_9980_read_address,
fg_vram_update_uxn_c_l163_c27_9980_write_address,
fg_vram_update_uxn_c_l163_c27_9980_write_value,
fg_vram_update_uxn_c_l163_c27_9980_write_enable,
fg_vram_update_uxn_c_l163_c27_9980_return_output);

-- BIN_OP_AND_uxn_c_l170_c38_be6e
BIN_OP_AND_uxn_c_l170_c38_be6e : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l170_c38_be6e_left,
BIN_OP_AND_uxn_c_l170_c38_be6e_right,
BIN_OP_AND_uxn_c_l170_c38_be6e_return_output);

-- UNARY_OP_NOT_uxn_c_l170_c38_7d75
UNARY_OP_NOT_uxn_c_l170_c38_7d75 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l170_c38_7d75_expr,
UNARY_OP_NOT_uxn_c_l170_c38_7d75_return_output);

-- MUX_uxn_c_l170_c19_fed1
MUX_uxn_c_l170_c19_fed1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l170_c19_fed1_cond,
MUX_uxn_c_l170_c19_fed1_iftrue,
MUX_uxn_c_l170_c19_fed1_iffalse,
MUX_uxn_c_l170_c19_fed1_return_output);

-- BIN_OP_EQ_uxn_c_l171_c19_f9f4
BIN_OP_EQ_uxn_c_l171_c19_f9f4 : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l171_c19_f9f4_left,
BIN_OP_EQ_uxn_c_l171_c19_f9f4_right,
BIN_OP_EQ_uxn_c_l171_c19_f9f4_return_output);

-- BIN_OP_PLUS_uxn_c_l171_c76_a184
BIN_OP_PLUS_uxn_c_l171_c76_a184 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l171_c76_a184_left,
BIN_OP_PLUS_uxn_c_l171_c76_a184_right,
BIN_OP_PLUS_uxn_c_l171_c76_a184_return_output);

-- MUX_uxn_c_l171_c50_fa83
MUX_uxn_c_l171_c50_fa83 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l171_c50_fa83_cond,
MUX_uxn_c_l171_c50_fa83_iftrue,
MUX_uxn_c_l171_c50_fa83_iffalse,
MUX_uxn_c_l171_c50_fa83_return_output);

-- MUX_uxn_c_l171_c19_7d13
MUX_uxn_c_l171_c19_7d13 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l171_c19_7d13_cond,
MUX_uxn_c_l171_c19_7d13_iftrue,
MUX_uxn_c_l171_c19_7d13_iffalse,
MUX_uxn_c_l171_c19_7d13_return_output);

-- BIN_OP_EQ_uxn_c_l172_c25_2222
BIN_OP_EQ_uxn_c_l172_c25_2222 : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l172_c25_2222_left,
BIN_OP_EQ_uxn_c_l172_c25_2222_right,
BIN_OP_EQ_uxn_c_l172_c25_2222_return_output);

-- MUX_uxn_c_l172_c25_dad8
MUX_uxn_c_l172_c25_dad8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l172_c25_dad8_cond,
MUX_uxn_c_l172_c25_dad8_iftrue,
MUX_uxn_c_l172_c25_dad8_iffalse,
MUX_uxn_c_l172_c25_dad8_return_output);

-- BIN_OP_EQ_uxn_c_l173_c17_28a1
BIN_OP_EQ_uxn_c_l173_c17_28a1 : entity work.BIN_OP_EQ_uint2_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l173_c17_28a1_left,
BIN_OP_EQ_uxn_c_l173_c17_28a1_right,
BIN_OP_EQ_uxn_c_l173_c17_28a1_return_output);

-- MUX_uxn_c_l173_c17_0ac1
MUX_uxn_c_l173_c17_0ac1 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
MUX_uxn_c_l173_c17_0ac1_cond,
MUX_uxn_c_l173_c17_0ac1_iftrue,
MUX_uxn_c_l173_c17_0ac1_iffalse,
MUX_uxn_c_l173_c17_0ac1_return_output);

-- CONST_SR_8_uint16_t_uxn_c_l133_l135_DUPLICATE_8c61
CONST_SR_8_uint16_t_uxn_c_l133_l135_DUPLICATE_8c61 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uint16_t_uxn_c_l133_l135_DUPLICATE_8c61_x,
CONST_SR_8_uint16_t_uxn_c_l133_l135_DUPLICATE_8c61_return_output);

-- UNARY_OP_NOT_uint1_t_uxn_c_l160_l167_DUPLICATE_0822
UNARY_OP_NOT_uint1_t_uxn_c_l160_l167_DUPLICATE_0822 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uint1_t_uxn_c_l160_l167_DUPLICATE_0822_expr,
UNARY_OP_NOT_uint1_t_uxn_c_l160_l167_DUPLICATE_0822_return_output);

-- BIN_OP_AND_uint1_t_uint1_t_uxn_c_l160_l167_DUPLICATE_d5e1
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l160_l167_DUPLICATE_d5e1 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l160_l167_DUPLICATE_d5e1_left,
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l160_l167_DUPLICATE_d5e1_right,
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l160_l167_DUPLICATE_d5e1_return_output);



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
 CONST_SR_4_uxn_c_l126_c52_e270_return_output,
 BIN_OP_AND_uxn_c_l126_c25_0157_return_output,
 UNARY_OP_NOT_uxn_c_l129_c22_74ff_return_output,
 BIN_OP_AND_uxn_c_l129_c6_b384_return_output,
 is_fill_active_MUX_uxn_c_l129_c2_1159_return_output,
 is_fill_top_MUX_uxn_c_l129_c2_1159_return_output,
 fill_y0_MUX_uxn_c_l129_c2_1159_return_output,
 fill_y1_MUX_uxn_c_l129_c2_1159_return_output,
 fill_layer_MUX_uxn_c_l129_c2_1159_return_output,
 fill_x0_MUX_uxn_c_l129_c2_1159_return_output,
 x_MUX_uxn_c_l129_c2_1159_return_output,
 fill_color_MUX_uxn_c_l129_c2_1159_return_output,
 y_MUX_uxn_c_l129_c2_1159_return_output,
 is_fill_left_MUX_uxn_c_l129_c2_1159_return_output,
 fill_x1_MUX_uxn_c_l129_c2_1159_return_output,
 CONST_SR_2_uxn_c_l131_c20_57b4_return_output,
 CONST_SR_3_uxn_c_l132_c18_8204_return_output,
 MUX_uxn_c_l133_c13_b149_return_output,
 BIN_OP_AND_uxn_c_l134_c28_428c_return_output,
 MUX_uxn_c_l134_c13_d4be_return_output,
 MUX_uxn_c_l135_c13_ba7f_return_output,
 BIN_OP_AND_uxn_c_l136_c32_7a7b_return_output,
 MUX_uxn_c_l136_c13_cbaa_return_output,
 CONST_SL_8_uxn_c_l146_c54_a4eb_return_output,
 BIN_OP_PLUS_uxn_c_l146_c54_75a8_return_output,
 MUX_uxn_c_l146_c35_55b5_return_output,
 BIN_OP_EQ_uxn_c_l148_c21_4b52_return_output,
 MUX_uxn_c_l148_c21_36ee_return_output,
 BIN_OP_EQ_uxn_c_l149_c22_0d5e_return_output,
 MUX_uxn_c_l149_c22_c409_return_output,
 BIN_OP_PLUS_uxn_c_l150_c25_6e2c_return_output,
 MUX_uxn_c_l150_c6_343a_return_output,
 BIN_OP_PLUS_uxn_c_l151_c34_ea3e_return_output,
 MUX_uxn_c_l151_c6_4a06_return_output,
 UNARY_OP_NOT_uxn_c_l153_c46_45ff_return_output,
 BIN_OP_AND_uxn_c_l153_c27_d321_return_output,
 BIN_OP_AND_uxn_c_l154_c27_4f34_return_output,
 MUX_uxn_c_l159_c3_27c4_return_output,
 UNARY_OP_NOT_uxn_c_l160_c57_790d_return_output,
 BIN_OP_AND_uxn_c_l160_c22_9dbd_return_output,
 BIN_OP_OR_uxn_c_l160_c3_0239_return_output,
 bg_vram_update_uxn_c_l156_c27_1810_return_output,
 MUX_uxn_c_l166_c3_c0f9_return_output,
 BIN_OP_AND_uxn_c_l167_c22_70b9_return_output,
 BIN_OP_OR_uxn_c_l167_c3_1377_return_output,
 fg_vram_update_uxn_c_l163_c27_9980_return_output,
 BIN_OP_AND_uxn_c_l170_c38_be6e_return_output,
 UNARY_OP_NOT_uxn_c_l170_c38_7d75_return_output,
 MUX_uxn_c_l170_c19_fed1_return_output,
 BIN_OP_EQ_uxn_c_l171_c19_f9f4_return_output,
 BIN_OP_PLUS_uxn_c_l171_c76_a184_return_output,
 MUX_uxn_c_l171_c50_fa83_return_output,
 MUX_uxn_c_l171_c19_7d13_return_output,
 BIN_OP_EQ_uxn_c_l172_c25_2222_return_output,
 MUX_uxn_c_l172_c25_dad8_return_output,
 BIN_OP_EQ_uxn_c_l173_c17_28a1_return_output,
 MUX_uxn_c_l173_c17_0ac1_return_output,
 CONST_SR_8_uint16_t_uxn_c_l133_l135_DUPLICATE_8c61_return_output,
 UNARY_OP_NOT_uint1_t_uxn_c_l160_l167_DUPLICATE_0822_return_output,
 BIN_OP_AND_uint1_t_uint1_t_uxn_c_l160_l167_DUPLICATE_d5e1_return_output)
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
 variable VAR_BIN_OP_AND_uxn_c_l126_c25_0157_left : unsigned(0 downto 0);
 variable VAR_CONST_SR_4_uxn_c_l126_c52_e270_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_c_l126_c52_e270_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_c_l126_c42_d24e_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l126_c25_0157_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l126_c25_0157_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l129_c6_b384_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l129_c22_74ff_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l129_c22_74ff_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l129_c6_b384_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l129_c6_b384_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_active_MUX_uxn_c_l129_c2_1159_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_active_MUX_uxn_c_l129_c2_1159_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_active_MUX_uxn_c_l129_c2_1159_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_active_MUX_uxn_c_l129_c2_1159_cond : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l129_c2_1159_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_top_uxn_c_l131_c6_dea3 : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l129_c2_1159_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l129_c2_1159_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l129_c2_1159_cond : unsigned(0 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l129_c2_1159_iftrue : unsigned(15 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l129_c2_1159_iffalse : unsigned(15 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l129_c2_1159_return_output : unsigned(15 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l129_c2_1159_cond : unsigned(0 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l129_c2_1159_iftrue : unsigned(15 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l129_c2_1159_iffalse : unsigned(15 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l129_c2_1159_return_output : unsigned(15 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l129_c2_1159_cond : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l129_c2_1159_iftrue : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l129_c2_1159_iffalse : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l129_c2_1159_return_output : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l129_c2_1159_cond : unsigned(0 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l129_c2_1159_iftrue : unsigned(15 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l129_c2_1159_iffalse : unsigned(15 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l129_c2_1159_return_output : unsigned(15 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l129_c2_1159_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_c_l129_c2_1159_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_c_l129_c2_1159_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_c_l129_c2_1159_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_c_l129_c2_1159_cond : unsigned(0 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l129_c2_1159_iftrue : unsigned(1 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l129_c2_1159_iffalse : unsigned(1 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l129_c2_1159_return_output : unsigned(1 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l129_c2_1159_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_c_l129_c2_1159_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_c_l129_c2_1159_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_c_l129_c2_1159_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_c_l129_c2_1159_cond : unsigned(0 downto 0);
 variable VAR_is_fill_left_MUX_uxn_c_l129_c2_1159_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_left_uxn_c_l132_c3_ff8c : unsigned(0 downto 0);
 variable VAR_is_fill_left_MUX_uxn_c_l129_c2_1159_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_left_MUX_uxn_c_l129_c2_1159_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_left_MUX_uxn_c_l129_c2_1159_cond : unsigned(0 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l129_c2_1159_iftrue : unsigned(15 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l129_c2_1159_iffalse : unsigned(15 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l129_c2_1159_return_output : unsigned(15 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l129_c2_1159_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_2_uxn_c_l131_c20_57b4_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_2_uxn_c_l131_c20_57b4_x : unsigned(7 downto 0);
 variable VAR_CONST_SR_3_uxn_c_l132_c18_8204_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_3_uxn_c_l132_c18_8204_x : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l133_c13_b149_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l133_c13_b149_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l133_c13_b149_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l133_c13_b149_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l134_c13_d4be_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l134_c13_d4be_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l134_c13_d4be_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l134_c28_428c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l134_c28_428c_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l134_c28_428c_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l134_c13_d4be_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l135_c13_ba7f_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l135_c13_ba7f_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l135_c13_ba7f_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l135_c13_ba7f_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l136_c13_cbaa_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l136_c13_cbaa_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l136_c13_cbaa_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l136_c32_7a7b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l136_c32_7a7b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l136_c32_7a7b_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l136_c13_cbaa_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint2_t_uxn_c_l138_c16_820d_return_output : unsigned(1 downto 0);
 variable VAR_adjusted_vram_address : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l146_c35_55b5_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l146_c35_55b5_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l146_c35_55b5_iffalse : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l146_c54_a4eb_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l146_c54_75a8_left : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l146_c54_a4eb_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l146_c54_75a8_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l146_c54_75a8_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l146_c35_55b5_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l148_c21_36ee_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l148_c21_4b52_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l148_c21_4b52_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l148_c21_4b52_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l148_c21_36ee_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l148_c21_36ee_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l148_c21_36ee_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l149_c22_c409_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l149_c22_0d5e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l149_c22_0d5e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l149_c22_0d5e_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l149_c22_c409_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l149_c22_c409_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l149_c22_c409_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l150_c6_343a_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l150_c6_343a_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l150_c6_343a_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l150_c25_6e2c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l150_c25_6e2c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l150_c25_6e2c_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l150_c6_343a_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l151_c6_4a06_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l151_c6_4a06_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l151_c6_4a06_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l151_c34_ea3e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l151_c34_ea3e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l151_c34_ea3e_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l151_c6_4a06_return_output : unsigned(15 downto 0);
 variable VAR_is_fill_pixel0 : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l153_c27_d321_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l153_c46_45ff_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l153_c46_45ff_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l153_c27_d321_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l153_c27_d321_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_pixel1 : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l154_c27_4f34_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l154_c27_4f34_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l154_c27_4f34_return_output : unsigned(0 downto 0);
 variable VAR_bg_pixel_color : unsigned(1 downto 0);
 variable VAR_bg_vram_update_uxn_c_l156_c27_1810_read_address : unsigned(15 downto 0);
 variable VAR_bg_vram_update_uxn_c_l156_c27_1810_write_address : unsigned(15 downto 0);
 variable VAR_bg_vram_update_uxn_c_l156_c27_1810_write_value : unsigned(1 downto 0);
 variable VAR_bg_vram_update_uxn_c_l156_c27_1810_write_enable : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l159_c3_27c4_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l159_c3_27c4_iftrue : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l159_c3_27c4_iffalse : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l159_c3_27c4_return_output : unsigned(1 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l160_c3_0239_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l160_c22_9dbd_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l160_c57_790d_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l160_c57_790d_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l160_c22_9dbd_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l160_c22_9dbd_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l160_c3_0239_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l160_c3_0239_return_output : unsigned(0 downto 0);
 variable VAR_bg_vram_update_uxn_c_l156_c27_1810_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_bg_vram_update_uxn_c_l156_c27_1810_return_output : unsigned(1 downto 0);
 variable VAR_fg_pixel_color : unsigned(1 downto 0);
 variable VAR_fg_vram_update_uxn_c_l163_c27_9980_read_address : unsigned(15 downto 0);
 variable VAR_fg_vram_update_uxn_c_l163_c27_9980_write_address : unsigned(15 downto 0);
 variable VAR_fg_vram_update_uxn_c_l163_c27_9980_write_value : unsigned(1 downto 0);
 variable VAR_fg_vram_update_uxn_c_l163_c27_9980_write_enable : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l166_c3_c0f9_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l166_c3_c0f9_iftrue : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l166_c3_c0f9_iffalse : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l166_c3_c0f9_return_output : unsigned(1 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l167_c3_1377_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l167_c22_70b9_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l167_c22_70b9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l167_c22_70b9_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l167_c3_1377_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l167_c3_1377_return_output : unsigned(0 downto 0);
 variable VAR_fg_vram_update_uxn_c_l163_c27_9980_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_fg_vram_update_uxn_c_l163_c27_9980_return_output : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l170_c19_fed1_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l170_c19_fed1_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l170_c19_fed1_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l170_c38_be6e_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l170_c38_be6e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l170_c38_be6e_return_output : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l170_c38_7d75_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l170_c38_7d75_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l170_c19_fed1_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l171_c19_7d13_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l171_c19_f9f4_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l171_c19_f9f4_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l171_c19_f9f4_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l171_c19_7d13_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l171_c19_7d13_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l171_c50_fa83_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l171_c50_fa83_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l171_c50_fa83_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l171_c76_a184_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l171_c76_a184_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l171_c76_a184_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l171_c50_fa83_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l171_c19_7d13_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l172_c25_dad8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l172_c25_2222_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l172_c25_2222_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l172_c25_2222_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l172_c25_dad8_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l172_c25_dad8_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l172_c25_dad8_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l173_c17_0ac1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l173_c17_28a1_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l173_c17_28a1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l173_c17_28a1_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l173_c17_0ac1_iftrue : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l173_c17_0ac1_iffalse : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l173_c17_0ac1_return_output : unsigned(1 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_c_l133_l135_DUPLICATE_8c61_x : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_c_l133_l135_DUPLICATE_8c61_return_output : unsigned(15 downto 0);
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_c_l160_l167_DUPLICATE_0822_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_c_l160_l167_DUPLICATE_0822_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l160_l167_DUPLICATE_d5e1_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l160_l167_DUPLICATE_d5e1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l160_l167_DUPLICATE_d5e1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_269d_uxn_c_l176_l115_DUPLICATE_1d1f_return_output : gpu_step_result_t;
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
     VAR_BIN_OP_EQ_uxn_c_l172_c25_2222_right := to_unsigned(61439, 16);
     VAR_MUX_uxn_c_l172_c25_dad8_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_c_l171_c76_a184_right := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l171_c19_7d13_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_BIN_OP_PLUS_uxn_c_l151_c34_ea3e_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l171_c19_f9f4_right := to_unsigned(61439, 16);
     VAR_MUX_uxn_c_l148_c21_36ee_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l170_c19_fed1_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l172_c25_dad8_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l136_c13_cbaa_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_MUX_uxn_c_l133_c13_b149_iffalse := resize(to_unsigned(239, 8), 16);
     VAR_BIN_OP_EQ_uxn_c_l173_c17_28a1_right := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l135_c13_ba7f_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_MUX_uxn_c_l149_c22_c409_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l134_c13_d4be_iffalse := resize(to_unsigned(255, 8), 16);
     VAR_is_fill_active_MUX_uxn_c_l129_c2_1159_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l149_c22_c409_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l148_c21_36ee_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_c_l134_c28_428c_right := to_unsigned(255, 16);
     VAR_BIN_OP_AND_uxn_c_l136_c32_7a7b_right := to_unsigned(255, 16);
     VAR_BIN_OP_PLUS_uxn_c_l150_c25_6e2c_right := to_unsigned(1, 1);

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
     VAR_bg_vram_update_uxn_c_l156_c27_1810_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_fg_vram_update_uxn_c_l163_c27_9980_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_fill_color_MUX_uxn_c_l129_c2_1159_iffalse := fill_color;
     VAR_fill_layer_MUX_uxn_c_l129_c2_1159_iffalse := fill_layer;
     VAR_fill_x0_MUX_uxn_c_l129_c2_1159_iffalse := fill_x0;
     VAR_fill_x1_MUX_uxn_c_l129_c2_1159_iffalse := fill_x1;
     VAR_fill_y0_MUX_uxn_c_l129_c2_1159_iffalse := fill_y0;
     VAR_fill_y1_MUX_uxn_c_l129_c2_1159_iffalse := fill_y1;
     VAR_MUX_uxn_c_l171_c50_fa83_cond := VAR_is_active_drawing_area;
     VAR_UNARY_OP_NOT_uxn_c_l129_c22_74ff_expr := is_fill_active;
     VAR_is_fill_active_MUX_uxn_c_l129_c2_1159_iffalse := is_fill_active;
     VAR_is_fill_left_MUX_uxn_c_l129_c2_1159_iffalse := is_fill_left;
     VAR_is_fill_top_MUX_uxn_c_l129_c2_1159_iffalse := is_fill_top;
     VAR_BIN_OP_AND_uxn_c_l126_c25_0157_left := VAR_is_vram_write;
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l160_l167_DUPLICATE_d5e1_right := VAR_is_vram_write;
     VAR_BIN_OP_EQ_uxn_c_l171_c19_f9f4_left := pixel_counter;
     VAR_BIN_OP_PLUS_uxn_c_l171_c76_a184_left := pixel_counter;
     VAR_MUX_uxn_c_l171_c50_fa83_iffalse := pixel_counter;
     VAR_bg_vram_update_uxn_c_l156_c27_1810_read_address := pixel_counter;
     VAR_fg_vram_update_uxn_c_l163_c27_9980_read_address := pixel_counter;
     VAR_BIN_OP_AND_uxn_c_l134_c28_428c_left := VAR_vram_address;
     VAR_BIN_OP_AND_uxn_c_l136_c32_7a7b_left := VAR_vram_address;
     VAR_CONST_SR_8_uint16_t_uxn_c_l133_l135_DUPLICATE_8c61_x := VAR_vram_address;
     VAR_MUX_uxn_c_l146_c35_55b5_iffalse := VAR_vram_address;
     VAR_CONST_SR_2_uxn_c_l131_c20_57b4_x := VAR_vram_value;
     VAR_CONST_SR_3_uxn_c_l132_c18_8204_x := VAR_vram_value;
     VAR_CONST_SR_4_uxn_c_l126_c52_e270_x := VAR_vram_value;
     VAR_MUX_uxn_c_l159_c3_27c4_iffalse := resize(VAR_vram_value, 2);
     VAR_MUX_uxn_c_l166_c3_c0f9_iffalse := resize(VAR_vram_value, 2);
     VAR_BIN_OP_AND_uxn_c_l167_c22_70b9_right := VAR_vram_write_layer;
     VAR_UNARY_OP_NOT_uxn_c_l160_c57_790d_expr := VAR_vram_write_layer;
     VAR_fill_layer_MUX_uxn_c_l129_c2_1159_iftrue := VAR_vram_write_layer;
     VAR_x_MUX_uxn_c_l129_c2_1159_iffalse := x;
     VAR_y_MUX_uxn_c_l129_c2_1159_iffalse := y;
     -- BIN_OP_PLUS[uxn_c_l171_c76_a184] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l171_c76_a184_left <= VAR_BIN_OP_PLUS_uxn_c_l171_c76_a184_left;
     BIN_OP_PLUS_uxn_c_l171_c76_a184_right <= VAR_BIN_OP_PLUS_uxn_c_l171_c76_a184_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l171_c76_a184_return_output := BIN_OP_PLUS_uxn_c_l171_c76_a184_return_output;

     -- BIN_OP_EQ[uxn_c_l171_c19_f9f4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l171_c19_f9f4_left <= VAR_BIN_OP_EQ_uxn_c_l171_c19_f9f4_left;
     BIN_OP_EQ_uxn_c_l171_c19_f9f4_right <= VAR_BIN_OP_EQ_uxn_c_l171_c19_f9f4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l171_c19_f9f4_return_output := BIN_OP_EQ_uxn_c_l171_c19_f9f4_return_output;

     -- UNARY_OP_NOT[uxn_c_l160_c57_790d] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l160_c57_790d_expr <= VAR_UNARY_OP_NOT_uxn_c_l160_c57_790d_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l160_c57_790d_return_output := UNARY_OP_NOT_uxn_c_l160_c57_790d_return_output;

     -- UNARY_OP_NOT[uxn_c_l129_c22_74ff] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l129_c22_74ff_expr <= VAR_UNARY_OP_NOT_uxn_c_l129_c22_74ff_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l129_c22_74ff_return_output := UNARY_OP_NOT_uxn_c_l129_c22_74ff_return_output;

     -- CAST_TO_uint2_t[uxn_c_l138_c16_820d] LATENCY=0
     VAR_CAST_TO_uint2_t_uxn_c_l138_c16_820d_return_output := CAST_TO_uint2_t_uint8_t(
     VAR_vram_value);

     -- BIN_OP_AND[uxn_c_l134_c28_428c] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l134_c28_428c_left <= VAR_BIN_OP_AND_uxn_c_l134_c28_428c_left;
     BIN_OP_AND_uxn_c_l134_c28_428c_right <= VAR_BIN_OP_AND_uxn_c_l134_c28_428c_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l134_c28_428c_return_output := BIN_OP_AND_uxn_c_l134_c28_428c_return_output;

     -- CONST_SR_8_uint16_t_uxn_c_l133_l135_DUPLICATE_8c61 LATENCY=0
     -- Inputs
     CONST_SR_8_uint16_t_uxn_c_l133_l135_DUPLICATE_8c61_x <= VAR_CONST_SR_8_uint16_t_uxn_c_l133_l135_DUPLICATE_8c61_x;
     -- Outputs
     VAR_CONST_SR_8_uint16_t_uxn_c_l133_l135_DUPLICATE_8c61_return_output := CONST_SR_8_uint16_t_uxn_c_l133_l135_DUPLICATE_8c61_return_output;

     -- CONST_SR_4[uxn_c_l126_c52_e270] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_c_l126_c52_e270_x <= VAR_CONST_SR_4_uxn_c_l126_c52_e270_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_c_l126_c52_e270_return_output := CONST_SR_4_uxn_c_l126_c52_e270_return_output;

     -- BIN_OP_AND[uxn_c_l136_c32_7a7b] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l136_c32_7a7b_left <= VAR_BIN_OP_AND_uxn_c_l136_c32_7a7b_left;
     BIN_OP_AND_uxn_c_l136_c32_7a7b_right <= VAR_BIN_OP_AND_uxn_c_l136_c32_7a7b_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l136_c32_7a7b_return_output := BIN_OP_AND_uxn_c_l136_c32_7a7b_return_output;

     -- CONST_SR_3[uxn_c_l132_c18_8204] LATENCY=0
     -- Inputs
     CONST_SR_3_uxn_c_l132_c18_8204_x <= VAR_CONST_SR_3_uxn_c_l132_c18_8204_x;
     -- Outputs
     VAR_CONST_SR_3_uxn_c_l132_c18_8204_return_output := CONST_SR_3_uxn_c_l132_c18_8204_return_output;

     -- CONST_SR_2[uxn_c_l131_c20_57b4] LATENCY=0
     -- Inputs
     CONST_SR_2_uxn_c_l131_c20_57b4_x <= VAR_CONST_SR_2_uxn_c_l131_c20_57b4_x;
     -- Outputs
     VAR_CONST_SR_2_uxn_c_l131_c20_57b4_return_output := CONST_SR_2_uxn_c_l131_c20_57b4_return_output;

     -- Submodule level 1
     VAR_MUX_uxn_c_l134_c13_d4be_iftrue := VAR_BIN_OP_AND_uxn_c_l134_c28_428c_return_output;
     VAR_MUX_uxn_c_l136_c13_cbaa_iffalse := VAR_BIN_OP_AND_uxn_c_l136_c32_7a7b_return_output;
     VAR_MUX_uxn_c_l171_c19_7d13_cond := VAR_BIN_OP_EQ_uxn_c_l171_c19_f9f4_return_output;
     VAR_MUX_uxn_c_l171_c50_fa83_iftrue := resize(VAR_BIN_OP_PLUS_uxn_c_l171_c76_a184_return_output, 16);
     VAR_fill_color_MUX_uxn_c_l129_c2_1159_iftrue := VAR_CAST_TO_uint2_t_uxn_c_l138_c16_820d_return_output;
     VAR_is_fill_top_uxn_c_l131_c6_dea3 := resize(VAR_CONST_SR_2_uxn_c_l131_c20_57b4_return_output, 1);
     VAR_is_fill_left_uxn_c_l132_c3_ff8c := resize(VAR_CONST_SR_3_uxn_c_l132_c18_8204_return_output, 1);
     VAR_MUX_uxn_c_l133_c13_b149_iftrue := VAR_CONST_SR_8_uint16_t_uxn_c_l133_l135_DUPLICATE_8c61_return_output;
     VAR_MUX_uxn_c_l135_c13_ba7f_iffalse := VAR_CONST_SR_8_uint16_t_uxn_c_l133_l135_DUPLICATE_8c61_return_output;
     VAR_BIN_OP_AND_uxn_c_l129_c6_b384_right := VAR_UNARY_OP_NOT_uxn_c_l129_c22_74ff_return_output;
     VAR_BIN_OP_AND_uxn_c_l160_c22_9dbd_right := VAR_UNARY_OP_NOT_uxn_c_l160_c57_790d_return_output;
     VAR_MUX_uxn_c_l134_c13_d4be_cond := VAR_is_fill_left_uxn_c_l132_c3_ff8c;
     VAR_MUX_uxn_c_l136_c13_cbaa_cond := VAR_is_fill_left_uxn_c_l132_c3_ff8c;
     VAR_is_fill_left_MUX_uxn_c_l129_c2_1159_iftrue := VAR_is_fill_left_uxn_c_l132_c3_ff8c;
     VAR_MUX_uxn_c_l133_c13_b149_cond := VAR_is_fill_top_uxn_c_l131_c6_dea3;
     VAR_MUX_uxn_c_l135_c13_ba7f_cond := VAR_is_fill_top_uxn_c_l131_c6_dea3;
     VAR_is_fill_top_MUX_uxn_c_l129_c2_1159_iftrue := VAR_is_fill_top_uxn_c_l131_c6_dea3;
     -- MUX[uxn_c_l135_c13_ba7f] LATENCY=0
     -- Inputs
     MUX_uxn_c_l135_c13_ba7f_cond <= VAR_MUX_uxn_c_l135_c13_ba7f_cond;
     MUX_uxn_c_l135_c13_ba7f_iftrue <= VAR_MUX_uxn_c_l135_c13_ba7f_iftrue;
     MUX_uxn_c_l135_c13_ba7f_iffalse <= VAR_MUX_uxn_c_l135_c13_ba7f_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l135_c13_ba7f_return_output := MUX_uxn_c_l135_c13_ba7f_return_output;

     -- MUX[uxn_c_l134_c13_d4be] LATENCY=0
     -- Inputs
     MUX_uxn_c_l134_c13_d4be_cond <= VAR_MUX_uxn_c_l134_c13_d4be_cond;
     MUX_uxn_c_l134_c13_d4be_iftrue <= VAR_MUX_uxn_c_l134_c13_d4be_iftrue;
     MUX_uxn_c_l134_c13_d4be_iffalse <= VAR_MUX_uxn_c_l134_c13_d4be_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l134_c13_d4be_return_output := MUX_uxn_c_l134_c13_d4be_return_output;

     -- MUX[uxn_c_l136_c13_cbaa] LATENCY=0
     -- Inputs
     MUX_uxn_c_l136_c13_cbaa_cond <= VAR_MUX_uxn_c_l136_c13_cbaa_cond;
     MUX_uxn_c_l136_c13_cbaa_iftrue <= VAR_MUX_uxn_c_l136_c13_cbaa_iftrue;
     MUX_uxn_c_l136_c13_cbaa_iffalse <= VAR_MUX_uxn_c_l136_c13_cbaa_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l136_c13_cbaa_return_output := MUX_uxn_c_l136_c13_cbaa_return_output;

     -- MUX[uxn_c_l171_c50_fa83] LATENCY=0
     -- Inputs
     MUX_uxn_c_l171_c50_fa83_cond <= VAR_MUX_uxn_c_l171_c50_fa83_cond;
     MUX_uxn_c_l171_c50_fa83_iftrue <= VAR_MUX_uxn_c_l171_c50_fa83_iftrue;
     MUX_uxn_c_l171_c50_fa83_iffalse <= VAR_MUX_uxn_c_l171_c50_fa83_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l171_c50_fa83_return_output := MUX_uxn_c_l171_c50_fa83_return_output;

     -- CAST_TO_uint1_t[uxn_c_l126_c42_d24e] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_c_l126_c42_d24e_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_4_uxn_c_l126_c52_e270_return_output);

     -- MUX[uxn_c_l133_c13_b149] LATENCY=0
     -- Inputs
     MUX_uxn_c_l133_c13_b149_cond <= VAR_MUX_uxn_c_l133_c13_b149_cond;
     MUX_uxn_c_l133_c13_b149_iftrue <= VAR_MUX_uxn_c_l133_c13_b149_iftrue;
     MUX_uxn_c_l133_c13_b149_iffalse <= VAR_MUX_uxn_c_l133_c13_b149_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l133_c13_b149_return_output := MUX_uxn_c_l133_c13_b149_return_output;

     -- Submodule level 2
     VAR_BIN_OP_AND_uxn_c_l126_c25_0157_right := VAR_CAST_TO_uint1_t_uxn_c_l126_c42_d24e_return_output;
     VAR_fill_y1_MUX_uxn_c_l129_c2_1159_iftrue := VAR_MUX_uxn_c_l133_c13_b149_return_output;
     VAR_fill_x1_MUX_uxn_c_l129_c2_1159_iftrue := VAR_MUX_uxn_c_l134_c13_d4be_return_output;
     VAR_fill_y0_MUX_uxn_c_l129_c2_1159_iftrue := VAR_MUX_uxn_c_l135_c13_ba7f_return_output;
     VAR_y_MUX_uxn_c_l129_c2_1159_iftrue := VAR_MUX_uxn_c_l135_c13_ba7f_return_output;
     VAR_fill_x0_MUX_uxn_c_l129_c2_1159_iftrue := VAR_MUX_uxn_c_l136_c13_cbaa_return_output;
     VAR_x_MUX_uxn_c_l129_c2_1159_iftrue := VAR_MUX_uxn_c_l136_c13_cbaa_return_output;
     VAR_MUX_uxn_c_l171_c19_7d13_iffalse := VAR_MUX_uxn_c_l171_c50_fa83_return_output;
     -- MUX[uxn_c_l171_c19_7d13] LATENCY=0
     -- Inputs
     MUX_uxn_c_l171_c19_7d13_cond <= VAR_MUX_uxn_c_l171_c19_7d13_cond;
     MUX_uxn_c_l171_c19_7d13_iftrue <= VAR_MUX_uxn_c_l171_c19_7d13_iftrue;
     MUX_uxn_c_l171_c19_7d13_iffalse <= VAR_MUX_uxn_c_l171_c19_7d13_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l171_c19_7d13_return_output := MUX_uxn_c_l171_c19_7d13_return_output;

     -- BIN_OP_AND[uxn_c_l126_c25_0157] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l126_c25_0157_left <= VAR_BIN_OP_AND_uxn_c_l126_c25_0157_left;
     BIN_OP_AND_uxn_c_l126_c25_0157_right <= VAR_BIN_OP_AND_uxn_c_l126_c25_0157_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l126_c25_0157_return_output := BIN_OP_AND_uxn_c_l126_c25_0157_return_output;

     -- Submodule level 3
     VAR_BIN_OP_AND_uxn_c_l129_c6_b384_left := VAR_BIN_OP_AND_uxn_c_l126_c25_0157_return_output;
     VAR_BIN_OP_EQ_uxn_c_l172_c25_2222_left := VAR_MUX_uxn_c_l171_c19_7d13_return_output;
     REG_VAR_pixel_counter := VAR_MUX_uxn_c_l171_c19_7d13_return_output;
     -- BIN_OP_EQ[uxn_c_l172_c25_2222] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l172_c25_2222_left <= VAR_BIN_OP_EQ_uxn_c_l172_c25_2222_left;
     BIN_OP_EQ_uxn_c_l172_c25_2222_right <= VAR_BIN_OP_EQ_uxn_c_l172_c25_2222_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l172_c25_2222_return_output := BIN_OP_EQ_uxn_c_l172_c25_2222_return_output;

     -- BIN_OP_AND[uxn_c_l129_c6_b384] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l129_c6_b384_left <= VAR_BIN_OP_AND_uxn_c_l129_c6_b384_left;
     BIN_OP_AND_uxn_c_l129_c6_b384_right <= VAR_BIN_OP_AND_uxn_c_l129_c6_b384_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l129_c6_b384_return_output := BIN_OP_AND_uxn_c_l129_c6_b384_return_output;

     -- Submodule level 4
     VAR_fill_color_MUX_uxn_c_l129_c2_1159_cond := VAR_BIN_OP_AND_uxn_c_l129_c6_b384_return_output;
     VAR_fill_layer_MUX_uxn_c_l129_c2_1159_cond := VAR_BIN_OP_AND_uxn_c_l129_c6_b384_return_output;
     VAR_fill_x0_MUX_uxn_c_l129_c2_1159_cond := VAR_BIN_OP_AND_uxn_c_l129_c6_b384_return_output;
     VAR_fill_x1_MUX_uxn_c_l129_c2_1159_cond := VAR_BIN_OP_AND_uxn_c_l129_c6_b384_return_output;
     VAR_fill_y0_MUX_uxn_c_l129_c2_1159_cond := VAR_BIN_OP_AND_uxn_c_l129_c6_b384_return_output;
     VAR_fill_y1_MUX_uxn_c_l129_c2_1159_cond := VAR_BIN_OP_AND_uxn_c_l129_c6_b384_return_output;
     VAR_is_fill_active_MUX_uxn_c_l129_c2_1159_cond := VAR_BIN_OP_AND_uxn_c_l129_c6_b384_return_output;
     VAR_is_fill_left_MUX_uxn_c_l129_c2_1159_cond := VAR_BIN_OP_AND_uxn_c_l129_c6_b384_return_output;
     VAR_is_fill_top_MUX_uxn_c_l129_c2_1159_cond := VAR_BIN_OP_AND_uxn_c_l129_c6_b384_return_output;
     VAR_x_MUX_uxn_c_l129_c2_1159_cond := VAR_BIN_OP_AND_uxn_c_l129_c6_b384_return_output;
     VAR_y_MUX_uxn_c_l129_c2_1159_cond := VAR_BIN_OP_AND_uxn_c_l129_c6_b384_return_output;
     VAR_MUX_uxn_c_l172_c25_dad8_cond := VAR_BIN_OP_EQ_uxn_c_l172_c25_2222_return_output;
     -- fill_color_MUX[uxn_c_l129_c2_1159] LATENCY=0
     -- Inputs
     fill_color_MUX_uxn_c_l129_c2_1159_cond <= VAR_fill_color_MUX_uxn_c_l129_c2_1159_cond;
     fill_color_MUX_uxn_c_l129_c2_1159_iftrue <= VAR_fill_color_MUX_uxn_c_l129_c2_1159_iftrue;
     fill_color_MUX_uxn_c_l129_c2_1159_iffalse <= VAR_fill_color_MUX_uxn_c_l129_c2_1159_iffalse;
     -- Outputs
     VAR_fill_color_MUX_uxn_c_l129_c2_1159_return_output := fill_color_MUX_uxn_c_l129_c2_1159_return_output;

     -- is_fill_top_MUX[uxn_c_l129_c2_1159] LATENCY=0
     -- Inputs
     is_fill_top_MUX_uxn_c_l129_c2_1159_cond <= VAR_is_fill_top_MUX_uxn_c_l129_c2_1159_cond;
     is_fill_top_MUX_uxn_c_l129_c2_1159_iftrue <= VAR_is_fill_top_MUX_uxn_c_l129_c2_1159_iftrue;
     is_fill_top_MUX_uxn_c_l129_c2_1159_iffalse <= VAR_is_fill_top_MUX_uxn_c_l129_c2_1159_iffalse;
     -- Outputs
     VAR_is_fill_top_MUX_uxn_c_l129_c2_1159_return_output := is_fill_top_MUX_uxn_c_l129_c2_1159_return_output;

     -- fill_x0_MUX[uxn_c_l129_c2_1159] LATENCY=0
     -- Inputs
     fill_x0_MUX_uxn_c_l129_c2_1159_cond <= VAR_fill_x0_MUX_uxn_c_l129_c2_1159_cond;
     fill_x0_MUX_uxn_c_l129_c2_1159_iftrue <= VAR_fill_x0_MUX_uxn_c_l129_c2_1159_iftrue;
     fill_x0_MUX_uxn_c_l129_c2_1159_iffalse <= VAR_fill_x0_MUX_uxn_c_l129_c2_1159_iffalse;
     -- Outputs
     VAR_fill_x0_MUX_uxn_c_l129_c2_1159_return_output := fill_x0_MUX_uxn_c_l129_c2_1159_return_output;

     -- fill_x1_MUX[uxn_c_l129_c2_1159] LATENCY=0
     -- Inputs
     fill_x1_MUX_uxn_c_l129_c2_1159_cond <= VAR_fill_x1_MUX_uxn_c_l129_c2_1159_cond;
     fill_x1_MUX_uxn_c_l129_c2_1159_iftrue <= VAR_fill_x1_MUX_uxn_c_l129_c2_1159_iftrue;
     fill_x1_MUX_uxn_c_l129_c2_1159_iffalse <= VAR_fill_x1_MUX_uxn_c_l129_c2_1159_iffalse;
     -- Outputs
     VAR_fill_x1_MUX_uxn_c_l129_c2_1159_return_output := fill_x1_MUX_uxn_c_l129_c2_1159_return_output;

     -- is_fill_active_MUX[uxn_c_l129_c2_1159] LATENCY=0
     -- Inputs
     is_fill_active_MUX_uxn_c_l129_c2_1159_cond <= VAR_is_fill_active_MUX_uxn_c_l129_c2_1159_cond;
     is_fill_active_MUX_uxn_c_l129_c2_1159_iftrue <= VAR_is_fill_active_MUX_uxn_c_l129_c2_1159_iftrue;
     is_fill_active_MUX_uxn_c_l129_c2_1159_iffalse <= VAR_is_fill_active_MUX_uxn_c_l129_c2_1159_iffalse;
     -- Outputs
     VAR_is_fill_active_MUX_uxn_c_l129_c2_1159_return_output := is_fill_active_MUX_uxn_c_l129_c2_1159_return_output;

     -- MUX[uxn_c_l172_c25_dad8] LATENCY=0
     -- Inputs
     MUX_uxn_c_l172_c25_dad8_cond <= VAR_MUX_uxn_c_l172_c25_dad8_cond;
     MUX_uxn_c_l172_c25_dad8_iftrue <= VAR_MUX_uxn_c_l172_c25_dad8_iftrue;
     MUX_uxn_c_l172_c25_dad8_iffalse <= VAR_MUX_uxn_c_l172_c25_dad8_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l172_c25_dad8_return_output := MUX_uxn_c_l172_c25_dad8_return_output;

     -- fill_y0_MUX[uxn_c_l129_c2_1159] LATENCY=0
     -- Inputs
     fill_y0_MUX_uxn_c_l129_c2_1159_cond <= VAR_fill_y0_MUX_uxn_c_l129_c2_1159_cond;
     fill_y0_MUX_uxn_c_l129_c2_1159_iftrue <= VAR_fill_y0_MUX_uxn_c_l129_c2_1159_iftrue;
     fill_y0_MUX_uxn_c_l129_c2_1159_iffalse <= VAR_fill_y0_MUX_uxn_c_l129_c2_1159_iffalse;
     -- Outputs
     VAR_fill_y0_MUX_uxn_c_l129_c2_1159_return_output := fill_y0_MUX_uxn_c_l129_c2_1159_return_output;

     -- is_fill_left_MUX[uxn_c_l129_c2_1159] LATENCY=0
     -- Inputs
     is_fill_left_MUX_uxn_c_l129_c2_1159_cond <= VAR_is_fill_left_MUX_uxn_c_l129_c2_1159_cond;
     is_fill_left_MUX_uxn_c_l129_c2_1159_iftrue <= VAR_is_fill_left_MUX_uxn_c_l129_c2_1159_iftrue;
     is_fill_left_MUX_uxn_c_l129_c2_1159_iffalse <= VAR_is_fill_left_MUX_uxn_c_l129_c2_1159_iffalse;
     -- Outputs
     VAR_is_fill_left_MUX_uxn_c_l129_c2_1159_return_output := is_fill_left_MUX_uxn_c_l129_c2_1159_return_output;

     -- fill_layer_MUX[uxn_c_l129_c2_1159] LATENCY=0
     -- Inputs
     fill_layer_MUX_uxn_c_l129_c2_1159_cond <= VAR_fill_layer_MUX_uxn_c_l129_c2_1159_cond;
     fill_layer_MUX_uxn_c_l129_c2_1159_iftrue <= VAR_fill_layer_MUX_uxn_c_l129_c2_1159_iftrue;
     fill_layer_MUX_uxn_c_l129_c2_1159_iffalse <= VAR_fill_layer_MUX_uxn_c_l129_c2_1159_iffalse;
     -- Outputs
     VAR_fill_layer_MUX_uxn_c_l129_c2_1159_return_output := fill_layer_MUX_uxn_c_l129_c2_1159_return_output;

     -- x_MUX[uxn_c_l129_c2_1159] LATENCY=0
     -- Inputs
     x_MUX_uxn_c_l129_c2_1159_cond <= VAR_x_MUX_uxn_c_l129_c2_1159_cond;
     x_MUX_uxn_c_l129_c2_1159_iftrue <= VAR_x_MUX_uxn_c_l129_c2_1159_iftrue;
     x_MUX_uxn_c_l129_c2_1159_iffalse <= VAR_x_MUX_uxn_c_l129_c2_1159_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_c_l129_c2_1159_return_output := x_MUX_uxn_c_l129_c2_1159_return_output;

     -- fill_y1_MUX[uxn_c_l129_c2_1159] LATENCY=0
     -- Inputs
     fill_y1_MUX_uxn_c_l129_c2_1159_cond <= VAR_fill_y1_MUX_uxn_c_l129_c2_1159_cond;
     fill_y1_MUX_uxn_c_l129_c2_1159_iftrue <= VAR_fill_y1_MUX_uxn_c_l129_c2_1159_iftrue;
     fill_y1_MUX_uxn_c_l129_c2_1159_iffalse <= VAR_fill_y1_MUX_uxn_c_l129_c2_1159_iffalse;
     -- Outputs
     VAR_fill_y1_MUX_uxn_c_l129_c2_1159_return_output := fill_y1_MUX_uxn_c_l129_c2_1159_return_output;

     -- y_MUX[uxn_c_l129_c2_1159] LATENCY=0
     -- Inputs
     y_MUX_uxn_c_l129_c2_1159_cond <= VAR_y_MUX_uxn_c_l129_c2_1159_cond;
     y_MUX_uxn_c_l129_c2_1159_iftrue <= VAR_y_MUX_uxn_c_l129_c2_1159_iftrue;
     y_MUX_uxn_c_l129_c2_1159_iffalse <= VAR_y_MUX_uxn_c_l129_c2_1159_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_c_l129_c2_1159_return_output := y_MUX_uxn_c_l129_c2_1159_return_output;

     -- Submodule level 5
     VAR_MUX_uxn_c_l159_c3_27c4_iftrue := VAR_fill_color_MUX_uxn_c_l129_c2_1159_return_output;
     VAR_MUX_uxn_c_l166_c3_c0f9_iftrue := VAR_fill_color_MUX_uxn_c_l129_c2_1159_return_output;
     REG_VAR_fill_color := VAR_fill_color_MUX_uxn_c_l129_c2_1159_return_output;
     VAR_BIN_OP_AND_uxn_c_l154_c27_4f34_right := VAR_fill_layer_MUX_uxn_c_l129_c2_1159_return_output;
     VAR_UNARY_OP_NOT_uxn_c_l153_c46_45ff_expr := VAR_fill_layer_MUX_uxn_c_l129_c2_1159_return_output;
     REG_VAR_fill_layer := VAR_fill_layer_MUX_uxn_c_l129_c2_1159_return_output;
     VAR_MUX_uxn_c_l151_c6_4a06_iftrue := VAR_fill_x0_MUX_uxn_c_l129_c2_1159_return_output;
     REG_VAR_fill_x0 := VAR_fill_x0_MUX_uxn_c_l129_c2_1159_return_output;
     VAR_BIN_OP_EQ_uxn_c_l148_c21_4b52_right := VAR_fill_x1_MUX_uxn_c_l129_c2_1159_return_output;
     REG_VAR_fill_x1 := VAR_fill_x1_MUX_uxn_c_l129_c2_1159_return_output;
     REG_VAR_fill_y0 := VAR_fill_y0_MUX_uxn_c_l129_c2_1159_return_output;
     VAR_BIN_OP_EQ_uxn_c_l149_c22_0d5e_right := VAR_fill_y1_MUX_uxn_c_l129_c2_1159_return_output;
     REG_VAR_fill_y1 := VAR_fill_y1_MUX_uxn_c_l129_c2_1159_return_output;
     VAR_BIN_OP_AND_uxn_c_l153_c27_d321_left := VAR_is_fill_active_MUX_uxn_c_l129_c2_1159_return_output;
     VAR_BIN_OP_AND_uxn_c_l154_c27_4f34_left := VAR_is_fill_active_MUX_uxn_c_l129_c2_1159_return_output;
     VAR_MUX_uxn_c_l146_c35_55b5_cond := VAR_is_fill_active_MUX_uxn_c_l129_c2_1159_return_output;
     VAR_MUX_uxn_c_l170_c19_fed1_cond := VAR_is_fill_active_MUX_uxn_c_l129_c2_1159_return_output;
     VAR_UNARY_OP_NOT_uint1_t_uxn_c_l160_l167_DUPLICATE_0822_expr := VAR_is_fill_active_MUX_uxn_c_l129_c2_1159_return_output;
     REG_VAR_is_fill_left := VAR_is_fill_left_MUX_uxn_c_l129_c2_1159_return_output;
     REG_VAR_is_fill_top := VAR_is_fill_top_MUX_uxn_c_l129_c2_1159_return_output;
     VAR_BIN_OP_EQ_uxn_c_l148_c21_4b52_left := VAR_x_MUX_uxn_c_l129_c2_1159_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l146_c54_75a8_right := VAR_x_MUX_uxn_c_l129_c2_1159_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l151_c34_ea3e_left := VAR_x_MUX_uxn_c_l129_c2_1159_return_output;
     VAR_BIN_OP_EQ_uxn_c_l149_c22_0d5e_left := VAR_y_MUX_uxn_c_l129_c2_1159_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l150_c25_6e2c_left := VAR_y_MUX_uxn_c_l129_c2_1159_return_output;
     VAR_CONST_SL_8_uxn_c_l146_c54_a4eb_x := VAR_y_MUX_uxn_c_l129_c2_1159_return_output;
     VAR_MUX_uxn_c_l150_c6_343a_iffalse := VAR_y_MUX_uxn_c_l129_c2_1159_return_output;
     -- BIN_OP_PLUS[uxn_c_l150_c25_6e2c] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l150_c25_6e2c_left <= VAR_BIN_OP_PLUS_uxn_c_l150_c25_6e2c_left;
     BIN_OP_PLUS_uxn_c_l150_c25_6e2c_right <= VAR_BIN_OP_PLUS_uxn_c_l150_c25_6e2c_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l150_c25_6e2c_return_output := BIN_OP_PLUS_uxn_c_l150_c25_6e2c_return_output;

     -- UNARY_OP_NOT[uxn_c_l153_c46_45ff] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l153_c46_45ff_expr <= VAR_UNARY_OP_NOT_uxn_c_l153_c46_45ff_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l153_c46_45ff_return_output := UNARY_OP_NOT_uxn_c_l153_c46_45ff_return_output;

     -- BIN_OP_AND[uxn_c_l154_c27_4f34] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l154_c27_4f34_left <= VAR_BIN_OP_AND_uxn_c_l154_c27_4f34_left;
     BIN_OP_AND_uxn_c_l154_c27_4f34_right <= VAR_BIN_OP_AND_uxn_c_l154_c27_4f34_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l154_c27_4f34_return_output := BIN_OP_AND_uxn_c_l154_c27_4f34_return_output;

     -- BIN_OP_PLUS[uxn_c_l151_c34_ea3e] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l151_c34_ea3e_left <= VAR_BIN_OP_PLUS_uxn_c_l151_c34_ea3e_left;
     BIN_OP_PLUS_uxn_c_l151_c34_ea3e_right <= VAR_BIN_OP_PLUS_uxn_c_l151_c34_ea3e_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l151_c34_ea3e_return_output := BIN_OP_PLUS_uxn_c_l151_c34_ea3e_return_output;

     -- UNARY_OP_NOT_uint1_t_uxn_c_l160_l167_DUPLICATE_0822 LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uint1_t_uxn_c_l160_l167_DUPLICATE_0822_expr <= VAR_UNARY_OP_NOT_uint1_t_uxn_c_l160_l167_DUPLICATE_0822_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uint1_t_uxn_c_l160_l167_DUPLICATE_0822_return_output := UNARY_OP_NOT_uint1_t_uxn_c_l160_l167_DUPLICATE_0822_return_output;

     -- BIN_OP_EQ[uxn_c_l149_c22_0d5e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l149_c22_0d5e_left <= VAR_BIN_OP_EQ_uxn_c_l149_c22_0d5e_left;
     BIN_OP_EQ_uxn_c_l149_c22_0d5e_right <= VAR_BIN_OP_EQ_uxn_c_l149_c22_0d5e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l149_c22_0d5e_return_output := BIN_OP_EQ_uxn_c_l149_c22_0d5e_return_output;

     -- BIN_OP_EQ[uxn_c_l148_c21_4b52] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l148_c21_4b52_left <= VAR_BIN_OP_EQ_uxn_c_l148_c21_4b52_left;
     BIN_OP_EQ_uxn_c_l148_c21_4b52_right <= VAR_BIN_OP_EQ_uxn_c_l148_c21_4b52_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l148_c21_4b52_return_output := BIN_OP_EQ_uxn_c_l148_c21_4b52_return_output;

     -- CONST_SL_8[uxn_c_l146_c54_a4eb] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l146_c54_a4eb_x <= VAR_CONST_SL_8_uxn_c_l146_c54_a4eb_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l146_c54_a4eb_return_output := CONST_SL_8_uxn_c_l146_c54_a4eb_return_output;

     -- Submodule level 6
     VAR_BIN_OP_OR_uxn_c_l167_c3_1377_left := VAR_BIN_OP_AND_uxn_c_l154_c27_4f34_return_output;
     VAR_MUX_uxn_c_l166_c3_c0f9_cond := VAR_BIN_OP_AND_uxn_c_l154_c27_4f34_return_output;
     VAR_MUX_uxn_c_l148_c21_36ee_cond := VAR_BIN_OP_EQ_uxn_c_l148_c21_4b52_return_output;
     VAR_MUX_uxn_c_l149_c22_c409_cond := VAR_BIN_OP_EQ_uxn_c_l149_c22_0d5e_return_output;
     VAR_MUX_uxn_c_l150_c6_343a_iftrue := resize(VAR_BIN_OP_PLUS_uxn_c_l150_c25_6e2c_return_output, 16);
     VAR_MUX_uxn_c_l151_c6_4a06_iffalse := resize(VAR_BIN_OP_PLUS_uxn_c_l151_c34_ea3e_return_output, 16);
     VAR_BIN_OP_PLUS_uxn_c_l146_c54_75a8_left := VAR_CONST_SL_8_uxn_c_l146_c54_a4eb_return_output;
     VAR_BIN_OP_AND_uxn_c_l153_c27_d321_right := VAR_UNARY_OP_NOT_uxn_c_l153_c46_45ff_return_output;
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l160_l167_DUPLICATE_d5e1_left := VAR_UNARY_OP_NOT_uint1_t_uxn_c_l160_l167_DUPLICATE_0822_return_output;
     -- MUX[uxn_c_l148_c21_36ee] LATENCY=0
     -- Inputs
     MUX_uxn_c_l148_c21_36ee_cond <= VAR_MUX_uxn_c_l148_c21_36ee_cond;
     MUX_uxn_c_l148_c21_36ee_iftrue <= VAR_MUX_uxn_c_l148_c21_36ee_iftrue;
     MUX_uxn_c_l148_c21_36ee_iffalse <= VAR_MUX_uxn_c_l148_c21_36ee_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l148_c21_36ee_return_output := MUX_uxn_c_l148_c21_36ee_return_output;

     -- MUX[uxn_c_l149_c22_c409] LATENCY=0
     -- Inputs
     MUX_uxn_c_l149_c22_c409_cond <= VAR_MUX_uxn_c_l149_c22_c409_cond;
     MUX_uxn_c_l149_c22_c409_iftrue <= VAR_MUX_uxn_c_l149_c22_c409_iftrue;
     MUX_uxn_c_l149_c22_c409_iffalse <= VAR_MUX_uxn_c_l149_c22_c409_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l149_c22_c409_return_output := MUX_uxn_c_l149_c22_c409_return_output;

     -- MUX[uxn_c_l166_c3_c0f9] LATENCY=0
     -- Inputs
     MUX_uxn_c_l166_c3_c0f9_cond <= VAR_MUX_uxn_c_l166_c3_c0f9_cond;
     MUX_uxn_c_l166_c3_c0f9_iftrue <= VAR_MUX_uxn_c_l166_c3_c0f9_iftrue;
     MUX_uxn_c_l166_c3_c0f9_iffalse <= VAR_MUX_uxn_c_l166_c3_c0f9_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l166_c3_c0f9_return_output := MUX_uxn_c_l166_c3_c0f9_return_output;

     -- BIN_OP_AND[uxn_c_l153_c27_d321] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l153_c27_d321_left <= VAR_BIN_OP_AND_uxn_c_l153_c27_d321_left;
     BIN_OP_AND_uxn_c_l153_c27_d321_right <= VAR_BIN_OP_AND_uxn_c_l153_c27_d321_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l153_c27_d321_return_output := BIN_OP_AND_uxn_c_l153_c27_d321_return_output;

     -- BIN_OP_AND_uint1_t_uint1_t_uxn_c_l160_l167_DUPLICATE_d5e1 LATENCY=0
     -- Inputs
     BIN_OP_AND_uint1_t_uint1_t_uxn_c_l160_l167_DUPLICATE_d5e1_left <= VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l160_l167_DUPLICATE_d5e1_left;
     BIN_OP_AND_uint1_t_uint1_t_uxn_c_l160_l167_DUPLICATE_d5e1_right <= VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l160_l167_DUPLICATE_d5e1_right;
     -- Outputs
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l160_l167_DUPLICATE_d5e1_return_output := BIN_OP_AND_uint1_t_uint1_t_uxn_c_l160_l167_DUPLICATE_d5e1_return_output;

     -- BIN_OP_PLUS[uxn_c_l146_c54_75a8] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l146_c54_75a8_left <= VAR_BIN_OP_PLUS_uxn_c_l146_c54_75a8_left;
     BIN_OP_PLUS_uxn_c_l146_c54_75a8_right <= VAR_BIN_OP_PLUS_uxn_c_l146_c54_75a8_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l146_c54_75a8_return_output := BIN_OP_PLUS_uxn_c_l146_c54_75a8_return_output;

     -- Submodule level 7
     VAR_BIN_OP_OR_uxn_c_l160_c3_0239_left := VAR_BIN_OP_AND_uxn_c_l153_c27_d321_return_output;
     VAR_MUX_uxn_c_l159_c3_27c4_cond := VAR_BIN_OP_AND_uxn_c_l153_c27_d321_return_output;
     VAR_BIN_OP_AND_uxn_c_l160_c22_9dbd_left := VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l160_l167_DUPLICATE_d5e1_return_output;
     VAR_BIN_OP_AND_uxn_c_l167_c22_70b9_left := VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l160_l167_DUPLICATE_d5e1_return_output;
     VAR_MUX_uxn_c_l146_c35_55b5_iftrue := resize(VAR_BIN_OP_PLUS_uxn_c_l146_c54_75a8_return_output, 16);
     VAR_BIN_OP_AND_uxn_c_l170_c38_be6e_left := VAR_MUX_uxn_c_l148_c21_36ee_return_output;
     VAR_MUX_uxn_c_l150_c6_343a_cond := VAR_MUX_uxn_c_l148_c21_36ee_return_output;
     VAR_MUX_uxn_c_l151_c6_4a06_cond := VAR_MUX_uxn_c_l148_c21_36ee_return_output;
     REG_VAR_is_new_fill_row := VAR_MUX_uxn_c_l148_c21_36ee_return_output;
     VAR_BIN_OP_AND_uxn_c_l170_c38_be6e_right := VAR_MUX_uxn_c_l149_c22_c409_return_output;
     REG_VAR_is_last_fill_col := VAR_MUX_uxn_c_l149_c22_c409_return_output;
     VAR_fg_vram_update_uxn_c_l163_c27_9980_write_value := VAR_MUX_uxn_c_l166_c3_c0f9_return_output;
     -- MUX[uxn_c_l151_c6_4a06] LATENCY=0
     -- Inputs
     MUX_uxn_c_l151_c6_4a06_cond <= VAR_MUX_uxn_c_l151_c6_4a06_cond;
     MUX_uxn_c_l151_c6_4a06_iftrue <= VAR_MUX_uxn_c_l151_c6_4a06_iftrue;
     MUX_uxn_c_l151_c6_4a06_iffalse <= VAR_MUX_uxn_c_l151_c6_4a06_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l151_c6_4a06_return_output := MUX_uxn_c_l151_c6_4a06_return_output;

     -- BIN_OP_AND[uxn_c_l170_c38_be6e] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l170_c38_be6e_left <= VAR_BIN_OP_AND_uxn_c_l170_c38_be6e_left;
     BIN_OP_AND_uxn_c_l170_c38_be6e_right <= VAR_BIN_OP_AND_uxn_c_l170_c38_be6e_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l170_c38_be6e_return_output := BIN_OP_AND_uxn_c_l170_c38_be6e_return_output;

     -- BIN_OP_AND[uxn_c_l160_c22_9dbd] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l160_c22_9dbd_left <= VAR_BIN_OP_AND_uxn_c_l160_c22_9dbd_left;
     BIN_OP_AND_uxn_c_l160_c22_9dbd_right <= VAR_BIN_OP_AND_uxn_c_l160_c22_9dbd_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l160_c22_9dbd_return_output := BIN_OP_AND_uxn_c_l160_c22_9dbd_return_output;

     -- MUX[uxn_c_l146_c35_55b5] LATENCY=0
     -- Inputs
     MUX_uxn_c_l146_c35_55b5_cond <= VAR_MUX_uxn_c_l146_c35_55b5_cond;
     MUX_uxn_c_l146_c35_55b5_iftrue <= VAR_MUX_uxn_c_l146_c35_55b5_iftrue;
     MUX_uxn_c_l146_c35_55b5_iffalse <= VAR_MUX_uxn_c_l146_c35_55b5_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l146_c35_55b5_return_output := MUX_uxn_c_l146_c35_55b5_return_output;

     -- MUX[uxn_c_l150_c6_343a] LATENCY=0
     -- Inputs
     MUX_uxn_c_l150_c6_343a_cond <= VAR_MUX_uxn_c_l150_c6_343a_cond;
     MUX_uxn_c_l150_c6_343a_iftrue <= VAR_MUX_uxn_c_l150_c6_343a_iftrue;
     MUX_uxn_c_l150_c6_343a_iffalse <= VAR_MUX_uxn_c_l150_c6_343a_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l150_c6_343a_return_output := MUX_uxn_c_l150_c6_343a_return_output;

     -- MUX[uxn_c_l159_c3_27c4] LATENCY=0
     -- Inputs
     MUX_uxn_c_l159_c3_27c4_cond <= VAR_MUX_uxn_c_l159_c3_27c4_cond;
     MUX_uxn_c_l159_c3_27c4_iftrue <= VAR_MUX_uxn_c_l159_c3_27c4_iftrue;
     MUX_uxn_c_l159_c3_27c4_iffalse <= VAR_MUX_uxn_c_l159_c3_27c4_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l159_c3_27c4_return_output := MUX_uxn_c_l159_c3_27c4_return_output;

     -- BIN_OP_AND[uxn_c_l167_c22_70b9] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l167_c22_70b9_left <= VAR_BIN_OP_AND_uxn_c_l167_c22_70b9_left;
     BIN_OP_AND_uxn_c_l167_c22_70b9_right <= VAR_BIN_OP_AND_uxn_c_l167_c22_70b9_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l167_c22_70b9_return_output := BIN_OP_AND_uxn_c_l167_c22_70b9_return_output;

     -- Submodule level 8
     VAR_BIN_OP_OR_uxn_c_l160_c3_0239_right := VAR_BIN_OP_AND_uxn_c_l160_c22_9dbd_return_output;
     VAR_BIN_OP_OR_uxn_c_l167_c3_1377_right := VAR_BIN_OP_AND_uxn_c_l167_c22_70b9_return_output;
     VAR_UNARY_OP_NOT_uxn_c_l170_c38_7d75_expr := VAR_BIN_OP_AND_uxn_c_l170_c38_be6e_return_output;
     VAR_bg_vram_update_uxn_c_l156_c27_1810_write_address := VAR_MUX_uxn_c_l146_c35_55b5_return_output;
     VAR_fg_vram_update_uxn_c_l163_c27_9980_write_address := VAR_MUX_uxn_c_l146_c35_55b5_return_output;
     REG_VAR_y := VAR_MUX_uxn_c_l150_c6_343a_return_output;
     REG_VAR_x := VAR_MUX_uxn_c_l151_c6_4a06_return_output;
     VAR_bg_vram_update_uxn_c_l156_c27_1810_write_value := VAR_MUX_uxn_c_l159_c3_27c4_return_output;
     -- BIN_OP_OR[uxn_c_l160_c3_0239] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l160_c3_0239_left <= VAR_BIN_OP_OR_uxn_c_l160_c3_0239_left;
     BIN_OP_OR_uxn_c_l160_c3_0239_right <= VAR_BIN_OP_OR_uxn_c_l160_c3_0239_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l160_c3_0239_return_output := BIN_OP_OR_uxn_c_l160_c3_0239_return_output;

     -- UNARY_OP_NOT[uxn_c_l170_c38_7d75] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l170_c38_7d75_expr <= VAR_UNARY_OP_NOT_uxn_c_l170_c38_7d75_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l170_c38_7d75_return_output := UNARY_OP_NOT_uxn_c_l170_c38_7d75_return_output;

     -- BIN_OP_OR[uxn_c_l167_c3_1377] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l167_c3_1377_left <= VAR_BIN_OP_OR_uxn_c_l167_c3_1377_left;
     BIN_OP_OR_uxn_c_l167_c3_1377_right <= VAR_BIN_OP_OR_uxn_c_l167_c3_1377_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l167_c3_1377_return_output := BIN_OP_OR_uxn_c_l167_c3_1377_return_output;

     -- Submodule level 9
     VAR_bg_vram_update_uxn_c_l156_c27_1810_write_enable := VAR_BIN_OP_OR_uxn_c_l160_c3_0239_return_output;
     VAR_fg_vram_update_uxn_c_l163_c27_9980_write_enable := VAR_BIN_OP_OR_uxn_c_l167_c3_1377_return_output;
     VAR_MUX_uxn_c_l170_c19_fed1_iftrue := VAR_UNARY_OP_NOT_uxn_c_l170_c38_7d75_return_output;
     -- fg_vram_update[uxn_c_l163_c27_9980] LATENCY=0
     -- Clock enable
     fg_vram_update_uxn_c_l163_c27_9980_CLOCK_ENABLE <= VAR_fg_vram_update_uxn_c_l163_c27_9980_CLOCK_ENABLE;
     -- Inputs
     fg_vram_update_uxn_c_l163_c27_9980_read_address <= VAR_fg_vram_update_uxn_c_l163_c27_9980_read_address;
     fg_vram_update_uxn_c_l163_c27_9980_write_address <= VAR_fg_vram_update_uxn_c_l163_c27_9980_write_address;
     fg_vram_update_uxn_c_l163_c27_9980_write_value <= VAR_fg_vram_update_uxn_c_l163_c27_9980_write_value;
     fg_vram_update_uxn_c_l163_c27_9980_write_enable <= VAR_fg_vram_update_uxn_c_l163_c27_9980_write_enable;
     -- Outputs
     VAR_fg_vram_update_uxn_c_l163_c27_9980_return_output := fg_vram_update_uxn_c_l163_c27_9980_return_output;

     -- MUX[uxn_c_l170_c19_fed1] LATENCY=0
     -- Inputs
     MUX_uxn_c_l170_c19_fed1_cond <= VAR_MUX_uxn_c_l170_c19_fed1_cond;
     MUX_uxn_c_l170_c19_fed1_iftrue <= VAR_MUX_uxn_c_l170_c19_fed1_iftrue;
     MUX_uxn_c_l170_c19_fed1_iffalse <= VAR_MUX_uxn_c_l170_c19_fed1_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l170_c19_fed1_return_output := MUX_uxn_c_l170_c19_fed1_return_output;

     -- bg_vram_update[uxn_c_l156_c27_1810] LATENCY=0
     -- Clock enable
     bg_vram_update_uxn_c_l156_c27_1810_CLOCK_ENABLE <= VAR_bg_vram_update_uxn_c_l156_c27_1810_CLOCK_ENABLE;
     -- Inputs
     bg_vram_update_uxn_c_l156_c27_1810_read_address <= VAR_bg_vram_update_uxn_c_l156_c27_1810_read_address;
     bg_vram_update_uxn_c_l156_c27_1810_write_address <= VAR_bg_vram_update_uxn_c_l156_c27_1810_write_address;
     bg_vram_update_uxn_c_l156_c27_1810_write_value <= VAR_bg_vram_update_uxn_c_l156_c27_1810_write_value;
     bg_vram_update_uxn_c_l156_c27_1810_write_enable <= VAR_bg_vram_update_uxn_c_l156_c27_1810_write_enable;
     -- Outputs
     VAR_bg_vram_update_uxn_c_l156_c27_1810_return_output := bg_vram_update_uxn_c_l156_c27_1810_return_output;

     -- Submodule level 10
     REG_VAR_is_fill_active := VAR_MUX_uxn_c_l170_c19_fed1_return_output;
     VAR_MUX_uxn_c_l173_c17_0ac1_iftrue := VAR_bg_vram_update_uxn_c_l156_c27_1810_return_output;
     VAR_BIN_OP_EQ_uxn_c_l173_c17_28a1_left := VAR_fg_vram_update_uxn_c_l163_c27_9980_return_output;
     VAR_MUX_uxn_c_l173_c17_0ac1_iffalse := VAR_fg_vram_update_uxn_c_l163_c27_9980_return_output;
     -- BIN_OP_EQ[uxn_c_l173_c17_28a1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l173_c17_28a1_left <= VAR_BIN_OP_EQ_uxn_c_l173_c17_28a1_left;
     BIN_OP_EQ_uxn_c_l173_c17_28a1_right <= VAR_BIN_OP_EQ_uxn_c_l173_c17_28a1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l173_c17_28a1_return_output := BIN_OP_EQ_uxn_c_l173_c17_28a1_return_output;

     -- Submodule level 11
     VAR_MUX_uxn_c_l173_c17_0ac1_cond := VAR_BIN_OP_EQ_uxn_c_l173_c17_28a1_return_output;
     -- MUX[uxn_c_l173_c17_0ac1] LATENCY=0
     -- Inputs
     MUX_uxn_c_l173_c17_0ac1_cond <= VAR_MUX_uxn_c_l173_c17_0ac1_cond;
     MUX_uxn_c_l173_c17_0ac1_iftrue <= VAR_MUX_uxn_c_l173_c17_0ac1_iftrue;
     MUX_uxn_c_l173_c17_0ac1_iffalse <= VAR_MUX_uxn_c_l173_c17_0ac1_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l173_c17_0ac1_return_output := MUX_uxn_c_l173_c17_0ac1_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_269d_uxn_c_l176_l115_DUPLICATE_1d1f LATENCY=0
     VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_269d_uxn_c_l176_l115_DUPLICATE_1d1f_return_output := CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_269d(
     VAR_MUX_uxn_c_l172_c25_dad8_return_output,
     VAR_MUX_uxn_c_l173_c17_0ac1_return_output,
     VAR_MUX_uxn_c_l170_c19_fed1_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_269d_uxn_c_l176_l115_DUPLICATE_1d1f_return_output;
     VAR_return_output := VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_269d_uxn_c_l176_l115_DUPLICATE_1d1f_return_output;
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
