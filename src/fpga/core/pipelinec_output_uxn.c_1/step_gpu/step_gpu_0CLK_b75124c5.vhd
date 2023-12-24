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
-- Submodules: 66
entity step_gpu_0CLK_b75124c5 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 is_active_drawing_area : in unsigned(0 downto 0);
 is_vram_write : in unsigned(0 downto 0);
 vram_write_layer : in unsigned(0 downto 0);
 vram_address : in unsigned(15 downto 0);
 vram_value : in unsigned(7 downto 0);
 return_output : out gpu_step_result_t);
end step_gpu_0CLK_b75124c5;
architecture arch of step_gpu_0CLK_b75124c5 is
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
signal fill_pixels_remaining : unsigned(15 downto 0) := to_unsigned(0, 16);
signal fill_x0 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal fill_y0 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal fill_x1 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal fill_y1 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal fill_color : unsigned(1 downto 0) := to_unsigned(0, 2);
signal is_fill_active : unsigned(0 downto 0) := to_unsigned(0, 1);
signal fill_layer : unsigned(0 downto 0) := to_unsigned(0, 1);
signal pixel_counter : unsigned(15 downto 0) := to_unsigned(0, 16);
signal x : unsigned(15 downto 0) := to_unsigned(0, 16);
signal y : unsigned(15 downto 0) := to_unsigned(0, 16);
signal REG_COMB_result : gpu_step_result_t;
signal REG_COMB_fill_pixels_remaining : unsigned(15 downto 0);
signal REG_COMB_fill_x0 : unsigned(15 downto 0);
signal REG_COMB_fill_y0 : unsigned(15 downto 0);
signal REG_COMB_fill_x1 : unsigned(15 downto 0);
signal REG_COMB_fill_y1 : unsigned(15 downto 0);
signal REG_COMB_fill_color : unsigned(1 downto 0);
signal REG_COMB_is_fill_active : unsigned(0 downto 0);
signal REG_COMB_fill_layer : unsigned(0 downto 0);
signal REG_COMB_pixel_counter : unsigned(15 downto 0);
signal REG_COMB_x : unsigned(15 downto 0);
signal REG_COMB_y : unsigned(15 downto 0);

-- Each function instance gets signals
-- CONST_SR_4[uxn_c_l127_c52_7697]
signal CONST_SR_4_uxn_c_l127_c52_7697_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_c_l127_c52_7697_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_c_l127_c25_8913]
signal BIN_OP_AND_uxn_c_l127_c25_8913_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l127_c25_8913_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l127_c25_8913_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_c_l130_c22_d1aa]
signal UNARY_OP_NOT_uxn_c_l130_c22_d1aa_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l130_c22_d1aa_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l130_c6_84d2]
signal BIN_OP_AND_uxn_c_l130_c6_84d2_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l130_c6_84d2_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l130_c6_84d2_return_output : unsigned(0 downto 0);

-- fill_x1_MUX[uxn_c_l130_c2_9699]
signal fill_x1_MUX_uxn_c_l130_c2_9699_cond : unsigned(0 downto 0);
signal fill_x1_MUX_uxn_c_l130_c2_9699_iftrue : unsigned(15 downto 0);
signal fill_x1_MUX_uxn_c_l130_c2_9699_iffalse : unsigned(15 downto 0);
signal fill_x1_MUX_uxn_c_l130_c2_9699_return_output : unsigned(15 downto 0);

-- is_fill_active_MUX[uxn_c_l130_c2_9699]
signal is_fill_active_MUX_uxn_c_l130_c2_9699_cond : unsigned(0 downto 0);
signal is_fill_active_MUX_uxn_c_l130_c2_9699_iftrue : unsigned(0 downto 0);
signal is_fill_active_MUX_uxn_c_l130_c2_9699_iffalse : unsigned(0 downto 0);
signal is_fill_active_MUX_uxn_c_l130_c2_9699_return_output : unsigned(0 downto 0);

-- fill_y1_MUX[uxn_c_l130_c2_9699]
signal fill_y1_MUX_uxn_c_l130_c2_9699_cond : unsigned(0 downto 0);
signal fill_y1_MUX_uxn_c_l130_c2_9699_iftrue : unsigned(15 downto 0);
signal fill_y1_MUX_uxn_c_l130_c2_9699_iffalse : unsigned(15 downto 0);
signal fill_y1_MUX_uxn_c_l130_c2_9699_return_output : unsigned(15 downto 0);

-- fill_layer_MUX[uxn_c_l130_c2_9699]
signal fill_layer_MUX_uxn_c_l130_c2_9699_cond : unsigned(0 downto 0);
signal fill_layer_MUX_uxn_c_l130_c2_9699_iftrue : unsigned(0 downto 0);
signal fill_layer_MUX_uxn_c_l130_c2_9699_iffalse : unsigned(0 downto 0);
signal fill_layer_MUX_uxn_c_l130_c2_9699_return_output : unsigned(0 downto 0);

-- fill_pixels_remaining_MUX[uxn_c_l130_c2_9699]
signal fill_pixels_remaining_MUX_uxn_c_l130_c2_9699_cond : unsigned(0 downto 0);
signal fill_pixels_remaining_MUX_uxn_c_l130_c2_9699_iftrue : unsigned(15 downto 0);
signal fill_pixels_remaining_MUX_uxn_c_l130_c2_9699_iffalse : unsigned(15 downto 0);
signal fill_pixels_remaining_MUX_uxn_c_l130_c2_9699_return_output : unsigned(15 downto 0);

-- y_MUX[uxn_c_l130_c2_9699]
signal y_MUX_uxn_c_l130_c2_9699_cond : unsigned(0 downto 0);
signal y_MUX_uxn_c_l130_c2_9699_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_c_l130_c2_9699_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_c_l130_c2_9699_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_c_l130_c2_9699]
signal x_MUX_uxn_c_l130_c2_9699_cond : unsigned(0 downto 0);
signal x_MUX_uxn_c_l130_c2_9699_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_c_l130_c2_9699_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_c_l130_c2_9699_return_output : unsigned(15 downto 0);

-- fill_y0_MUX[uxn_c_l130_c2_9699]
signal fill_y0_MUX_uxn_c_l130_c2_9699_cond : unsigned(0 downto 0);
signal fill_y0_MUX_uxn_c_l130_c2_9699_iftrue : unsigned(15 downto 0);
signal fill_y0_MUX_uxn_c_l130_c2_9699_iffalse : unsigned(15 downto 0);
signal fill_y0_MUX_uxn_c_l130_c2_9699_return_output : unsigned(15 downto 0);

-- fill_x0_MUX[uxn_c_l130_c2_9699]
signal fill_x0_MUX_uxn_c_l130_c2_9699_cond : unsigned(0 downto 0);
signal fill_x0_MUX_uxn_c_l130_c2_9699_iftrue : unsigned(15 downto 0);
signal fill_x0_MUX_uxn_c_l130_c2_9699_iffalse : unsigned(15 downto 0);
signal fill_x0_MUX_uxn_c_l130_c2_9699_return_output : unsigned(15 downto 0);

-- fill_color_MUX[uxn_c_l130_c2_9699]
signal fill_color_MUX_uxn_c_l130_c2_9699_cond : unsigned(0 downto 0);
signal fill_color_MUX_uxn_c_l130_c2_9699_iftrue : unsigned(1 downto 0);
signal fill_color_MUX_uxn_c_l130_c2_9699_iffalse : unsigned(1 downto 0);
signal fill_color_MUX_uxn_c_l130_c2_9699_return_output : unsigned(1 downto 0);

-- CONST_SR_2[uxn_c_l132_c25_1bf1]
signal CONST_SR_2_uxn_c_l132_c25_1bf1_x : unsigned(7 downto 0);
signal CONST_SR_2_uxn_c_l132_c25_1bf1_return_output : unsigned(7 downto 0);

-- CONST_SR_3[uxn_c_l133_c26_a649]
signal CONST_SR_3_uxn_c_l133_c26_a649_x : unsigned(7 downto 0);
signal CONST_SR_3_uxn_c_l133_c26_a649_return_output : unsigned(7 downto 0);

-- MUX[uxn_c_l134_c13_684c]
signal MUX_uxn_c_l134_c13_684c_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l134_c13_684c_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l134_c13_684c_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l134_c13_684c_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_c_l135_c28_94c0]
signal BIN_OP_AND_uxn_c_l135_c28_94c0_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l135_c28_94c0_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l135_c28_94c0_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l135_c13_fd46]
signal MUX_uxn_c_l135_c13_fd46_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l135_c13_fd46_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l135_c13_fd46_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l135_c13_fd46_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l136_c13_60c5]
signal MUX_uxn_c_l136_c13_60c5_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l136_c13_60c5_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l136_c13_60c5_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l136_c13_60c5_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_c_l137_c32_4e45]
signal BIN_OP_AND_uxn_c_l137_c32_4e45_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l137_c32_4e45_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l137_c32_4e45_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l137_c13_01ff]
signal MUX_uxn_c_l137_c13_01ff_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l137_c13_01ff_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l137_c13_01ff_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l137_c13_01ff_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_c_l140_c28_a79e]
signal BIN_OP_MINUS_uxn_c_l140_c28_a79e_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_c_l140_c28_a79e_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_c_l140_c28_a79e_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_c_l140_c28_80e4]
signal BIN_OP_PLUS_uxn_c_l140_c28_80e4_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l140_c28_80e4_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l140_c28_80e4_return_output : unsigned(16 downto 0);

-- BIN_OP_MINUS[uxn_c_l140_c54_aace]
signal BIN_OP_MINUS_uxn_c_l140_c54_aace_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_c_l140_c54_aace_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_c_l140_c54_aace_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_c_l140_c54_8c61]
signal BIN_OP_PLUS_uxn_c_l140_c54_8c61_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l140_c54_8c61_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l140_c54_8c61_return_output : unsigned(16 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_c_l140_c28_f0b7]
signal BIN_OP_INFERRED_MULT_uxn_c_l140_c28_f0b7_left : unsigned(16 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_c_l140_c28_f0b7_right : unsigned(16 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_c_l140_c28_f0b7_return_output : unsigned(33 downto 0);

-- CONST_SL_8[uxn_c_l148_c54_5296]
signal CONST_SL_8_uxn_c_l148_c54_5296_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_c_l148_c54_5296_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_c_l148_c54_e310]
signal BIN_OP_PLUS_uxn_c_l148_c54_e310_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l148_c54_e310_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l148_c54_e310_return_output : unsigned(16 downto 0);

-- MUX[uxn_c_l148_c35_ea55]
signal MUX_uxn_c_l148_c35_ea55_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l148_c35_ea55_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l148_c35_ea55_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l148_c35_ea55_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l150_c29_2607]
signal BIN_OP_EQ_uxn_c_l150_c29_2607_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l150_c29_2607_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l150_c29_2607_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l150_c29_d5fc]
signal MUX_uxn_c_l150_c29_d5fc_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l150_c29_d5fc_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l150_c29_d5fc_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l150_c29_d5fc_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l151_c25_9b91]
signal BIN_OP_PLUS_uxn_c_l151_c25_9b91_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l151_c25_9b91_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l151_c25_9b91_return_output : unsigned(16 downto 0);

-- MUX[uxn_c_l151_c6_850d]
signal MUX_uxn_c_l151_c6_850d_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l151_c6_850d_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l151_c6_850d_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l151_c6_850d_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_c_l152_c34_adac]
signal BIN_OP_PLUS_uxn_c_l152_c34_adac_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l152_c34_adac_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l152_c34_adac_return_output : unsigned(16 downto 0);

-- MUX[uxn_c_l152_c6_8886]
signal MUX_uxn_c_l152_c6_8886_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l152_c6_8886_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l152_c6_8886_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l152_c6_8886_return_output : unsigned(15 downto 0);

-- UNARY_OP_NOT[uxn_c_l154_c46_207c]
signal UNARY_OP_NOT_uxn_c_l154_c46_207c_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l154_c46_207c_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l154_c27_240f]
signal BIN_OP_AND_uxn_c_l154_c27_240f_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l154_c27_240f_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l154_c27_240f_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l155_c27_b47b]
signal BIN_OP_AND_uxn_c_l155_c27_b47b_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l155_c27_b47b_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l155_c27_b47b_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l160_c3_17a8]
signal MUX_uxn_c_l160_c3_17a8_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l160_c3_17a8_iftrue : unsigned(1 downto 0);
signal MUX_uxn_c_l160_c3_17a8_iffalse : unsigned(1 downto 0);
signal MUX_uxn_c_l160_c3_17a8_return_output : unsigned(1 downto 0);

-- UNARY_OP_NOT[uxn_c_l161_c57_1731]
signal UNARY_OP_NOT_uxn_c_l161_c57_1731_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l161_c57_1731_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l161_c22_2200]
signal BIN_OP_AND_uxn_c_l161_c22_2200_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l161_c22_2200_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l161_c22_2200_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_c_l161_c3_2de8]
signal BIN_OP_OR_uxn_c_l161_c3_2de8_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l161_c3_2de8_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l161_c3_2de8_return_output : unsigned(0 downto 0);

-- bg_vram_update[uxn_c_l157_c27_cb58]
signal bg_vram_update_uxn_c_l157_c27_cb58_CLOCK_ENABLE : unsigned(0 downto 0);
signal bg_vram_update_uxn_c_l157_c27_cb58_read_address : unsigned(15 downto 0);
signal bg_vram_update_uxn_c_l157_c27_cb58_write_address : unsigned(15 downto 0);
signal bg_vram_update_uxn_c_l157_c27_cb58_write_value : unsigned(1 downto 0);
signal bg_vram_update_uxn_c_l157_c27_cb58_write_enable : unsigned(0 downto 0);
signal bg_vram_update_uxn_c_l157_c27_cb58_return_output : unsigned(1 downto 0);

-- MUX[uxn_c_l167_c3_e75d]
signal MUX_uxn_c_l167_c3_e75d_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l167_c3_e75d_iftrue : unsigned(1 downto 0);
signal MUX_uxn_c_l167_c3_e75d_iffalse : unsigned(1 downto 0);
signal MUX_uxn_c_l167_c3_e75d_return_output : unsigned(1 downto 0);

-- BIN_OP_AND[uxn_c_l168_c22_5fc0]
signal BIN_OP_AND_uxn_c_l168_c22_5fc0_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l168_c22_5fc0_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l168_c22_5fc0_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_c_l168_c3_544c]
signal BIN_OP_OR_uxn_c_l168_c3_544c_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l168_c3_544c_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l168_c3_544c_return_output : unsigned(0 downto 0);

-- fg_vram_update[uxn_c_l164_c27_0d64]
signal fg_vram_update_uxn_c_l164_c27_0d64_CLOCK_ENABLE : unsigned(0 downto 0);
signal fg_vram_update_uxn_c_l164_c27_0d64_read_address : unsigned(15 downto 0);
signal fg_vram_update_uxn_c_l164_c27_0d64_write_address : unsigned(15 downto 0);
signal fg_vram_update_uxn_c_l164_c27_0d64_write_value : unsigned(1 downto 0);
signal fg_vram_update_uxn_c_l164_c27_0d64_write_enable : unsigned(0 downto 0);
signal fg_vram_update_uxn_c_l164_c27_0d64_return_output : unsigned(1 downto 0);

-- BIN_OP_MINUS[uxn_c_l171_c43_1f82]
signal BIN_OP_MINUS_uxn_c_l171_c43_1f82_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_c_l171_c43_1f82_right : unsigned(0 downto 0);
signal BIN_OP_MINUS_uxn_c_l171_c43_1f82_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l171_c26_4fce]
signal MUX_uxn_c_l171_c26_4fce_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l171_c26_4fce_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l171_c26_4fce_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l171_c26_4fce_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l172_c19_e669]
signal BIN_OP_EQ_uxn_c_l172_c19_e669_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l172_c19_e669_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l172_c19_e669_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l172_c19_7602]
signal MUX_uxn_c_l172_c19_7602_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l172_c19_7602_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l172_c19_7602_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l172_c19_7602_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l173_c19_f702]
signal BIN_OP_EQ_uxn_c_l173_c19_f702_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l173_c19_f702_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l173_c19_f702_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l173_c76_d5e3]
signal BIN_OP_PLUS_uxn_c_l173_c76_d5e3_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l173_c76_d5e3_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l173_c76_d5e3_return_output : unsigned(16 downto 0);

-- MUX[uxn_c_l173_c50_2ade]
signal MUX_uxn_c_l173_c50_2ade_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l173_c50_2ade_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l173_c50_2ade_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l173_c50_2ade_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l173_c19_ea5e]
signal MUX_uxn_c_l173_c19_ea5e_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l173_c19_ea5e_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l173_c19_ea5e_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l173_c19_ea5e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l174_c25_5c42]
signal BIN_OP_EQ_uxn_c_l174_c25_5c42_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l174_c25_5c42_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l174_c25_5c42_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l174_c25_17dd]
signal MUX_uxn_c_l174_c25_17dd_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l174_c25_17dd_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l174_c25_17dd_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l174_c25_17dd_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l175_c17_3feb]
signal BIN_OP_EQ_uxn_c_l175_c17_3feb_left : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l175_c17_3feb_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l175_c17_3feb_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l175_c17_22a0]
signal MUX_uxn_c_l175_c17_22a0_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l175_c17_22a0_iftrue : unsigned(1 downto 0);
signal MUX_uxn_c_l175_c17_22a0_iffalse : unsigned(1 downto 0);
signal MUX_uxn_c_l175_c17_22a0_return_output : unsigned(1 downto 0);

-- CONST_SR_8_uint16_t_uxn_c_l136_l134_DUPLICATE_827a
signal CONST_SR_8_uint16_t_uxn_c_l136_l134_DUPLICATE_827a_x : unsigned(15 downto 0);
signal CONST_SR_8_uint16_t_uxn_c_l136_l134_DUPLICATE_827a_return_output : unsigned(15 downto 0);

-- UNARY_OP_NOT_uint1_t_uxn_c_l168_l161_DUPLICATE_de01
signal UNARY_OP_NOT_uint1_t_uxn_c_l168_l161_DUPLICATE_de01_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uint1_t_uxn_c_l168_l161_DUPLICATE_de01_return_output : unsigned(0 downto 0);

-- BIN_OP_AND_uint1_t_uint1_t_uxn_c_l161_l168_DUPLICATE_5117
signal BIN_OP_AND_uint1_t_uint1_t_uxn_c_l161_l168_DUPLICATE_5117_left : unsigned(0 downto 0);
signal BIN_OP_AND_uint1_t_uint1_t_uxn_c_l161_l168_DUPLICATE_5117_right : unsigned(0 downto 0);
signal BIN_OP_AND_uint1_t_uint1_t_uxn_c_l161_l168_DUPLICATE_5117_return_output : unsigned(0 downto 0);

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
-- CONST_SR_4_uxn_c_l127_c52_7697
CONST_SR_4_uxn_c_l127_c52_7697 : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_c_l127_c52_7697_x,
CONST_SR_4_uxn_c_l127_c52_7697_return_output);

-- BIN_OP_AND_uxn_c_l127_c25_8913
BIN_OP_AND_uxn_c_l127_c25_8913 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l127_c25_8913_left,
BIN_OP_AND_uxn_c_l127_c25_8913_right,
BIN_OP_AND_uxn_c_l127_c25_8913_return_output);

-- UNARY_OP_NOT_uxn_c_l130_c22_d1aa
UNARY_OP_NOT_uxn_c_l130_c22_d1aa : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l130_c22_d1aa_expr,
UNARY_OP_NOT_uxn_c_l130_c22_d1aa_return_output);

-- BIN_OP_AND_uxn_c_l130_c6_84d2
BIN_OP_AND_uxn_c_l130_c6_84d2 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l130_c6_84d2_left,
BIN_OP_AND_uxn_c_l130_c6_84d2_right,
BIN_OP_AND_uxn_c_l130_c6_84d2_return_output);

-- fill_x1_MUX_uxn_c_l130_c2_9699
fill_x1_MUX_uxn_c_l130_c2_9699 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_x1_MUX_uxn_c_l130_c2_9699_cond,
fill_x1_MUX_uxn_c_l130_c2_9699_iftrue,
fill_x1_MUX_uxn_c_l130_c2_9699_iffalse,
fill_x1_MUX_uxn_c_l130_c2_9699_return_output);

-- is_fill_active_MUX_uxn_c_l130_c2_9699
is_fill_active_MUX_uxn_c_l130_c2_9699 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_active_MUX_uxn_c_l130_c2_9699_cond,
is_fill_active_MUX_uxn_c_l130_c2_9699_iftrue,
is_fill_active_MUX_uxn_c_l130_c2_9699_iffalse,
is_fill_active_MUX_uxn_c_l130_c2_9699_return_output);

-- fill_y1_MUX_uxn_c_l130_c2_9699
fill_y1_MUX_uxn_c_l130_c2_9699 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_y1_MUX_uxn_c_l130_c2_9699_cond,
fill_y1_MUX_uxn_c_l130_c2_9699_iftrue,
fill_y1_MUX_uxn_c_l130_c2_9699_iffalse,
fill_y1_MUX_uxn_c_l130_c2_9699_return_output);

-- fill_layer_MUX_uxn_c_l130_c2_9699
fill_layer_MUX_uxn_c_l130_c2_9699 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
fill_layer_MUX_uxn_c_l130_c2_9699_cond,
fill_layer_MUX_uxn_c_l130_c2_9699_iftrue,
fill_layer_MUX_uxn_c_l130_c2_9699_iffalse,
fill_layer_MUX_uxn_c_l130_c2_9699_return_output);

-- fill_pixels_remaining_MUX_uxn_c_l130_c2_9699
fill_pixels_remaining_MUX_uxn_c_l130_c2_9699 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_pixels_remaining_MUX_uxn_c_l130_c2_9699_cond,
fill_pixels_remaining_MUX_uxn_c_l130_c2_9699_iftrue,
fill_pixels_remaining_MUX_uxn_c_l130_c2_9699_iffalse,
fill_pixels_remaining_MUX_uxn_c_l130_c2_9699_return_output);

-- y_MUX_uxn_c_l130_c2_9699
y_MUX_uxn_c_l130_c2_9699 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_c_l130_c2_9699_cond,
y_MUX_uxn_c_l130_c2_9699_iftrue,
y_MUX_uxn_c_l130_c2_9699_iffalse,
y_MUX_uxn_c_l130_c2_9699_return_output);

-- x_MUX_uxn_c_l130_c2_9699
x_MUX_uxn_c_l130_c2_9699 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_c_l130_c2_9699_cond,
x_MUX_uxn_c_l130_c2_9699_iftrue,
x_MUX_uxn_c_l130_c2_9699_iffalse,
x_MUX_uxn_c_l130_c2_9699_return_output);

-- fill_y0_MUX_uxn_c_l130_c2_9699
fill_y0_MUX_uxn_c_l130_c2_9699 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_y0_MUX_uxn_c_l130_c2_9699_cond,
fill_y0_MUX_uxn_c_l130_c2_9699_iftrue,
fill_y0_MUX_uxn_c_l130_c2_9699_iffalse,
fill_y0_MUX_uxn_c_l130_c2_9699_return_output);

-- fill_x0_MUX_uxn_c_l130_c2_9699
fill_x0_MUX_uxn_c_l130_c2_9699 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_x0_MUX_uxn_c_l130_c2_9699_cond,
fill_x0_MUX_uxn_c_l130_c2_9699_iftrue,
fill_x0_MUX_uxn_c_l130_c2_9699_iffalse,
fill_x0_MUX_uxn_c_l130_c2_9699_return_output);

-- fill_color_MUX_uxn_c_l130_c2_9699
fill_color_MUX_uxn_c_l130_c2_9699 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
fill_color_MUX_uxn_c_l130_c2_9699_cond,
fill_color_MUX_uxn_c_l130_c2_9699_iftrue,
fill_color_MUX_uxn_c_l130_c2_9699_iffalse,
fill_color_MUX_uxn_c_l130_c2_9699_return_output);

-- CONST_SR_2_uxn_c_l132_c25_1bf1
CONST_SR_2_uxn_c_l132_c25_1bf1 : entity work.CONST_SR_2_uint8_t_0CLK_de264c78 port map (
CONST_SR_2_uxn_c_l132_c25_1bf1_x,
CONST_SR_2_uxn_c_l132_c25_1bf1_return_output);

-- CONST_SR_3_uxn_c_l133_c26_a649
CONST_SR_3_uxn_c_l133_c26_a649 : entity work.CONST_SR_3_uint8_t_0CLK_de264c78 port map (
CONST_SR_3_uxn_c_l133_c26_a649_x,
CONST_SR_3_uxn_c_l133_c26_a649_return_output);

-- MUX_uxn_c_l134_c13_684c
MUX_uxn_c_l134_c13_684c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l134_c13_684c_cond,
MUX_uxn_c_l134_c13_684c_iftrue,
MUX_uxn_c_l134_c13_684c_iffalse,
MUX_uxn_c_l134_c13_684c_return_output);

-- BIN_OP_AND_uxn_c_l135_c28_94c0
BIN_OP_AND_uxn_c_l135_c28_94c0 : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l135_c28_94c0_left,
BIN_OP_AND_uxn_c_l135_c28_94c0_right,
BIN_OP_AND_uxn_c_l135_c28_94c0_return_output);

-- MUX_uxn_c_l135_c13_fd46
MUX_uxn_c_l135_c13_fd46 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l135_c13_fd46_cond,
MUX_uxn_c_l135_c13_fd46_iftrue,
MUX_uxn_c_l135_c13_fd46_iffalse,
MUX_uxn_c_l135_c13_fd46_return_output);

-- MUX_uxn_c_l136_c13_60c5
MUX_uxn_c_l136_c13_60c5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l136_c13_60c5_cond,
MUX_uxn_c_l136_c13_60c5_iftrue,
MUX_uxn_c_l136_c13_60c5_iffalse,
MUX_uxn_c_l136_c13_60c5_return_output);

-- BIN_OP_AND_uxn_c_l137_c32_4e45
BIN_OP_AND_uxn_c_l137_c32_4e45 : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l137_c32_4e45_left,
BIN_OP_AND_uxn_c_l137_c32_4e45_right,
BIN_OP_AND_uxn_c_l137_c32_4e45_return_output);

-- MUX_uxn_c_l137_c13_01ff
MUX_uxn_c_l137_c13_01ff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l137_c13_01ff_cond,
MUX_uxn_c_l137_c13_01ff_iftrue,
MUX_uxn_c_l137_c13_01ff_iffalse,
MUX_uxn_c_l137_c13_01ff_return_output);

-- BIN_OP_MINUS_uxn_c_l140_c28_a79e
BIN_OP_MINUS_uxn_c_l140_c28_a79e : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l140_c28_a79e_left,
BIN_OP_MINUS_uxn_c_l140_c28_a79e_right,
BIN_OP_MINUS_uxn_c_l140_c28_a79e_return_output);

-- BIN_OP_PLUS_uxn_c_l140_c28_80e4
BIN_OP_PLUS_uxn_c_l140_c28_80e4 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l140_c28_80e4_left,
BIN_OP_PLUS_uxn_c_l140_c28_80e4_right,
BIN_OP_PLUS_uxn_c_l140_c28_80e4_return_output);

-- BIN_OP_MINUS_uxn_c_l140_c54_aace
BIN_OP_MINUS_uxn_c_l140_c54_aace : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l140_c54_aace_left,
BIN_OP_MINUS_uxn_c_l140_c54_aace_right,
BIN_OP_MINUS_uxn_c_l140_c54_aace_return_output);

-- BIN_OP_PLUS_uxn_c_l140_c54_8c61
BIN_OP_PLUS_uxn_c_l140_c54_8c61 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l140_c54_8c61_left,
BIN_OP_PLUS_uxn_c_l140_c54_8c61_right,
BIN_OP_PLUS_uxn_c_l140_c54_8c61_return_output);

-- BIN_OP_INFERRED_MULT_uxn_c_l140_c28_f0b7
BIN_OP_INFERRED_MULT_uxn_c_l140_c28_f0b7 : entity work.BIN_OP_INFERRED_MULT_uint17_t_uint17_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_c_l140_c28_f0b7_left,
BIN_OP_INFERRED_MULT_uxn_c_l140_c28_f0b7_right,
BIN_OP_INFERRED_MULT_uxn_c_l140_c28_f0b7_return_output);

-- CONST_SL_8_uxn_c_l148_c54_5296
CONST_SL_8_uxn_c_l148_c54_5296 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l148_c54_5296_x,
CONST_SL_8_uxn_c_l148_c54_5296_return_output);

-- BIN_OP_PLUS_uxn_c_l148_c54_e310
BIN_OP_PLUS_uxn_c_l148_c54_e310 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l148_c54_e310_left,
BIN_OP_PLUS_uxn_c_l148_c54_e310_right,
BIN_OP_PLUS_uxn_c_l148_c54_e310_return_output);

-- MUX_uxn_c_l148_c35_ea55
MUX_uxn_c_l148_c35_ea55 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l148_c35_ea55_cond,
MUX_uxn_c_l148_c35_ea55_iftrue,
MUX_uxn_c_l148_c35_ea55_iffalse,
MUX_uxn_c_l148_c35_ea55_return_output);

-- BIN_OP_EQ_uxn_c_l150_c29_2607
BIN_OP_EQ_uxn_c_l150_c29_2607 : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l150_c29_2607_left,
BIN_OP_EQ_uxn_c_l150_c29_2607_right,
BIN_OP_EQ_uxn_c_l150_c29_2607_return_output);

-- MUX_uxn_c_l150_c29_d5fc
MUX_uxn_c_l150_c29_d5fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l150_c29_d5fc_cond,
MUX_uxn_c_l150_c29_d5fc_iftrue,
MUX_uxn_c_l150_c29_d5fc_iffalse,
MUX_uxn_c_l150_c29_d5fc_return_output);

-- BIN_OP_PLUS_uxn_c_l151_c25_9b91
BIN_OP_PLUS_uxn_c_l151_c25_9b91 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l151_c25_9b91_left,
BIN_OP_PLUS_uxn_c_l151_c25_9b91_right,
BIN_OP_PLUS_uxn_c_l151_c25_9b91_return_output);

-- MUX_uxn_c_l151_c6_850d
MUX_uxn_c_l151_c6_850d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l151_c6_850d_cond,
MUX_uxn_c_l151_c6_850d_iftrue,
MUX_uxn_c_l151_c6_850d_iffalse,
MUX_uxn_c_l151_c6_850d_return_output);

-- BIN_OP_PLUS_uxn_c_l152_c34_adac
BIN_OP_PLUS_uxn_c_l152_c34_adac : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l152_c34_adac_left,
BIN_OP_PLUS_uxn_c_l152_c34_adac_right,
BIN_OP_PLUS_uxn_c_l152_c34_adac_return_output);

-- MUX_uxn_c_l152_c6_8886
MUX_uxn_c_l152_c6_8886 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l152_c6_8886_cond,
MUX_uxn_c_l152_c6_8886_iftrue,
MUX_uxn_c_l152_c6_8886_iffalse,
MUX_uxn_c_l152_c6_8886_return_output);

-- UNARY_OP_NOT_uxn_c_l154_c46_207c
UNARY_OP_NOT_uxn_c_l154_c46_207c : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l154_c46_207c_expr,
UNARY_OP_NOT_uxn_c_l154_c46_207c_return_output);

-- BIN_OP_AND_uxn_c_l154_c27_240f
BIN_OP_AND_uxn_c_l154_c27_240f : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l154_c27_240f_left,
BIN_OP_AND_uxn_c_l154_c27_240f_right,
BIN_OP_AND_uxn_c_l154_c27_240f_return_output);

-- BIN_OP_AND_uxn_c_l155_c27_b47b
BIN_OP_AND_uxn_c_l155_c27_b47b : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l155_c27_b47b_left,
BIN_OP_AND_uxn_c_l155_c27_b47b_right,
BIN_OP_AND_uxn_c_l155_c27_b47b_return_output);

-- MUX_uxn_c_l160_c3_17a8
MUX_uxn_c_l160_c3_17a8 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
MUX_uxn_c_l160_c3_17a8_cond,
MUX_uxn_c_l160_c3_17a8_iftrue,
MUX_uxn_c_l160_c3_17a8_iffalse,
MUX_uxn_c_l160_c3_17a8_return_output);

-- UNARY_OP_NOT_uxn_c_l161_c57_1731
UNARY_OP_NOT_uxn_c_l161_c57_1731 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l161_c57_1731_expr,
UNARY_OP_NOT_uxn_c_l161_c57_1731_return_output);

-- BIN_OP_AND_uxn_c_l161_c22_2200
BIN_OP_AND_uxn_c_l161_c22_2200 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l161_c22_2200_left,
BIN_OP_AND_uxn_c_l161_c22_2200_right,
BIN_OP_AND_uxn_c_l161_c22_2200_return_output);

-- BIN_OP_OR_uxn_c_l161_c3_2de8
BIN_OP_OR_uxn_c_l161_c3_2de8 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l161_c3_2de8_left,
BIN_OP_OR_uxn_c_l161_c3_2de8_right,
BIN_OP_OR_uxn_c_l161_c3_2de8_return_output);

-- bg_vram_update_uxn_c_l157_c27_cb58
bg_vram_update_uxn_c_l157_c27_cb58 : entity work.bg_vram_update_0CLK_6f2c5aad port map (
clk,
bg_vram_update_uxn_c_l157_c27_cb58_CLOCK_ENABLE,
bg_vram_update_uxn_c_l157_c27_cb58_read_address,
bg_vram_update_uxn_c_l157_c27_cb58_write_address,
bg_vram_update_uxn_c_l157_c27_cb58_write_value,
bg_vram_update_uxn_c_l157_c27_cb58_write_enable,
bg_vram_update_uxn_c_l157_c27_cb58_return_output);

-- MUX_uxn_c_l167_c3_e75d
MUX_uxn_c_l167_c3_e75d : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
MUX_uxn_c_l167_c3_e75d_cond,
MUX_uxn_c_l167_c3_e75d_iftrue,
MUX_uxn_c_l167_c3_e75d_iffalse,
MUX_uxn_c_l167_c3_e75d_return_output);

-- BIN_OP_AND_uxn_c_l168_c22_5fc0
BIN_OP_AND_uxn_c_l168_c22_5fc0 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l168_c22_5fc0_left,
BIN_OP_AND_uxn_c_l168_c22_5fc0_right,
BIN_OP_AND_uxn_c_l168_c22_5fc0_return_output);

-- BIN_OP_OR_uxn_c_l168_c3_544c
BIN_OP_OR_uxn_c_l168_c3_544c : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l168_c3_544c_left,
BIN_OP_OR_uxn_c_l168_c3_544c_right,
BIN_OP_OR_uxn_c_l168_c3_544c_return_output);

-- fg_vram_update_uxn_c_l164_c27_0d64
fg_vram_update_uxn_c_l164_c27_0d64 : entity work.fg_vram_update_0CLK_6f2c5aad port map (
clk,
fg_vram_update_uxn_c_l164_c27_0d64_CLOCK_ENABLE,
fg_vram_update_uxn_c_l164_c27_0d64_read_address,
fg_vram_update_uxn_c_l164_c27_0d64_write_address,
fg_vram_update_uxn_c_l164_c27_0d64_write_value,
fg_vram_update_uxn_c_l164_c27_0d64_write_enable,
fg_vram_update_uxn_c_l164_c27_0d64_return_output);

-- BIN_OP_MINUS_uxn_c_l171_c43_1f82
BIN_OP_MINUS_uxn_c_l171_c43_1f82 : entity work.BIN_OP_MINUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l171_c43_1f82_left,
BIN_OP_MINUS_uxn_c_l171_c43_1f82_right,
BIN_OP_MINUS_uxn_c_l171_c43_1f82_return_output);

-- MUX_uxn_c_l171_c26_4fce
MUX_uxn_c_l171_c26_4fce : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l171_c26_4fce_cond,
MUX_uxn_c_l171_c26_4fce_iftrue,
MUX_uxn_c_l171_c26_4fce_iffalse,
MUX_uxn_c_l171_c26_4fce_return_output);

-- BIN_OP_EQ_uxn_c_l172_c19_e669
BIN_OP_EQ_uxn_c_l172_c19_e669 : entity work.BIN_OP_EQ_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l172_c19_e669_left,
BIN_OP_EQ_uxn_c_l172_c19_e669_right,
BIN_OP_EQ_uxn_c_l172_c19_e669_return_output);

-- MUX_uxn_c_l172_c19_7602
MUX_uxn_c_l172_c19_7602 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l172_c19_7602_cond,
MUX_uxn_c_l172_c19_7602_iftrue,
MUX_uxn_c_l172_c19_7602_iffalse,
MUX_uxn_c_l172_c19_7602_return_output);

-- BIN_OP_EQ_uxn_c_l173_c19_f702
BIN_OP_EQ_uxn_c_l173_c19_f702 : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l173_c19_f702_left,
BIN_OP_EQ_uxn_c_l173_c19_f702_right,
BIN_OP_EQ_uxn_c_l173_c19_f702_return_output);

-- BIN_OP_PLUS_uxn_c_l173_c76_d5e3
BIN_OP_PLUS_uxn_c_l173_c76_d5e3 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l173_c76_d5e3_left,
BIN_OP_PLUS_uxn_c_l173_c76_d5e3_right,
BIN_OP_PLUS_uxn_c_l173_c76_d5e3_return_output);

-- MUX_uxn_c_l173_c50_2ade
MUX_uxn_c_l173_c50_2ade : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l173_c50_2ade_cond,
MUX_uxn_c_l173_c50_2ade_iftrue,
MUX_uxn_c_l173_c50_2ade_iffalse,
MUX_uxn_c_l173_c50_2ade_return_output);

-- MUX_uxn_c_l173_c19_ea5e
MUX_uxn_c_l173_c19_ea5e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l173_c19_ea5e_cond,
MUX_uxn_c_l173_c19_ea5e_iftrue,
MUX_uxn_c_l173_c19_ea5e_iffalse,
MUX_uxn_c_l173_c19_ea5e_return_output);

-- BIN_OP_EQ_uxn_c_l174_c25_5c42
BIN_OP_EQ_uxn_c_l174_c25_5c42 : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l174_c25_5c42_left,
BIN_OP_EQ_uxn_c_l174_c25_5c42_right,
BIN_OP_EQ_uxn_c_l174_c25_5c42_return_output);

-- MUX_uxn_c_l174_c25_17dd
MUX_uxn_c_l174_c25_17dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l174_c25_17dd_cond,
MUX_uxn_c_l174_c25_17dd_iftrue,
MUX_uxn_c_l174_c25_17dd_iffalse,
MUX_uxn_c_l174_c25_17dd_return_output);

-- BIN_OP_EQ_uxn_c_l175_c17_3feb
BIN_OP_EQ_uxn_c_l175_c17_3feb : entity work.BIN_OP_EQ_uint2_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l175_c17_3feb_left,
BIN_OP_EQ_uxn_c_l175_c17_3feb_right,
BIN_OP_EQ_uxn_c_l175_c17_3feb_return_output);

-- MUX_uxn_c_l175_c17_22a0
MUX_uxn_c_l175_c17_22a0 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
MUX_uxn_c_l175_c17_22a0_cond,
MUX_uxn_c_l175_c17_22a0_iftrue,
MUX_uxn_c_l175_c17_22a0_iffalse,
MUX_uxn_c_l175_c17_22a0_return_output);

-- CONST_SR_8_uint16_t_uxn_c_l136_l134_DUPLICATE_827a
CONST_SR_8_uint16_t_uxn_c_l136_l134_DUPLICATE_827a : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uint16_t_uxn_c_l136_l134_DUPLICATE_827a_x,
CONST_SR_8_uint16_t_uxn_c_l136_l134_DUPLICATE_827a_return_output);

-- UNARY_OP_NOT_uint1_t_uxn_c_l168_l161_DUPLICATE_de01
UNARY_OP_NOT_uint1_t_uxn_c_l168_l161_DUPLICATE_de01 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uint1_t_uxn_c_l168_l161_DUPLICATE_de01_expr,
UNARY_OP_NOT_uint1_t_uxn_c_l168_l161_DUPLICATE_de01_return_output);

-- BIN_OP_AND_uint1_t_uint1_t_uxn_c_l161_l168_DUPLICATE_5117
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l161_l168_DUPLICATE_5117 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l161_l168_DUPLICATE_5117_left,
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l161_l168_DUPLICATE_5117_right,
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l161_l168_DUPLICATE_5117_return_output);



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
 fill_pixels_remaining,
 fill_x0,
 fill_y0,
 fill_x1,
 fill_y1,
 fill_color,
 is_fill_active,
 fill_layer,
 pixel_counter,
 x,
 y,
 -- All submodule outputs
 CONST_SR_4_uxn_c_l127_c52_7697_return_output,
 BIN_OP_AND_uxn_c_l127_c25_8913_return_output,
 UNARY_OP_NOT_uxn_c_l130_c22_d1aa_return_output,
 BIN_OP_AND_uxn_c_l130_c6_84d2_return_output,
 fill_x1_MUX_uxn_c_l130_c2_9699_return_output,
 is_fill_active_MUX_uxn_c_l130_c2_9699_return_output,
 fill_y1_MUX_uxn_c_l130_c2_9699_return_output,
 fill_layer_MUX_uxn_c_l130_c2_9699_return_output,
 fill_pixels_remaining_MUX_uxn_c_l130_c2_9699_return_output,
 y_MUX_uxn_c_l130_c2_9699_return_output,
 x_MUX_uxn_c_l130_c2_9699_return_output,
 fill_y0_MUX_uxn_c_l130_c2_9699_return_output,
 fill_x0_MUX_uxn_c_l130_c2_9699_return_output,
 fill_color_MUX_uxn_c_l130_c2_9699_return_output,
 CONST_SR_2_uxn_c_l132_c25_1bf1_return_output,
 CONST_SR_3_uxn_c_l133_c26_a649_return_output,
 MUX_uxn_c_l134_c13_684c_return_output,
 BIN_OP_AND_uxn_c_l135_c28_94c0_return_output,
 MUX_uxn_c_l135_c13_fd46_return_output,
 MUX_uxn_c_l136_c13_60c5_return_output,
 BIN_OP_AND_uxn_c_l137_c32_4e45_return_output,
 MUX_uxn_c_l137_c13_01ff_return_output,
 BIN_OP_MINUS_uxn_c_l140_c28_a79e_return_output,
 BIN_OP_PLUS_uxn_c_l140_c28_80e4_return_output,
 BIN_OP_MINUS_uxn_c_l140_c54_aace_return_output,
 BIN_OP_PLUS_uxn_c_l140_c54_8c61_return_output,
 BIN_OP_INFERRED_MULT_uxn_c_l140_c28_f0b7_return_output,
 CONST_SL_8_uxn_c_l148_c54_5296_return_output,
 BIN_OP_PLUS_uxn_c_l148_c54_e310_return_output,
 MUX_uxn_c_l148_c35_ea55_return_output,
 BIN_OP_EQ_uxn_c_l150_c29_2607_return_output,
 MUX_uxn_c_l150_c29_d5fc_return_output,
 BIN_OP_PLUS_uxn_c_l151_c25_9b91_return_output,
 MUX_uxn_c_l151_c6_850d_return_output,
 BIN_OP_PLUS_uxn_c_l152_c34_adac_return_output,
 MUX_uxn_c_l152_c6_8886_return_output,
 UNARY_OP_NOT_uxn_c_l154_c46_207c_return_output,
 BIN_OP_AND_uxn_c_l154_c27_240f_return_output,
 BIN_OP_AND_uxn_c_l155_c27_b47b_return_output,
 MUX_uxn_c_l160_c3_17a8_return_output,
 UNARY_OP_NOT_uxn_c_l161_c57_1731_return_output,
 BIN_OP_AND_uxn_c_l161_c22_2200_return_output,
 BIN_OP_OR_uxn_c_l161_c3_2de8_return_output,
 bg_vram_update_uxn_c_l157_c27_cb58_return_output,
 MUX_uxn_c_l167_c3_e75d_return_output,
 BIN_OP_AND_uxn_c_l168_c22_5fc0_return_output,
 BIN_OP_OR_uxn_c_l168_c3_544c_return_output,
 fg_vram_update_uxn_c_l164_c27_0d64_return_output,
 BIN_OP_MINUS_uxn_c_l171_c43_1f82_return_output,
 MUX_uxn_c_l171_c26_4fce_return_output,
 BIN_OP_EQ_uxn_c_l172_c19_e669_return_output,
 MUX_uxn_c_l172_c19_7602_return_output,
 BIN_OP_EQ_uxn_c_l173_c19_f702_return_output,
 BIN_OP_PLUS_uxn_c_l173_c76_d5e3_return_output,
 MUX_uxn_c_l173_c50_2ade_return_output,
 MUX_uxn_c_l173_c19_ea5e_return_output,
 BIN_OP_EQ_uxn_c_l174_c25_5c42_return_output,
 MUX_uxn_c_l174_c25_17dd_return_output,
 BIN_OP_EQ_uxn_c_l175_c17_3feb_return_output,
 MUX_uxn_c_l175_c17_22a0_return_output,
 CONST_SR_8_uint16_t_uxn_c_l136_l134_DUPLICATE_827a_return_output,
 UNARY_OP_NOT_uint1_t_uxn_c_l168_l161_DUPLICATE_de01_return_output,
 BIN_OP_AND_uint1_t_uint1_t_uxn_c_l161_l168_DUPLICATE_5117_return_output)
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
 variable VAR_BIN_OP_AND_uxn_c_l127_c25_8913_left : unsigned(0 downto 0);
 variable VAR_CONST_SR_4_uxn_c_l127_c52_7697_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_c_l127_c52_7697_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_c_l127_c42_fe05_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l127_c25_8913_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l127_c25_8913_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l130_c6_84d2_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l130_c22_d1aa_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l130_c22_d1aa_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l130_c6_84d2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l130_c6_84d2_return_output : unsigned(0 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l130_c2_9699_iftrue : unsigned(15 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l130_c2_9699_iffalse : unsigned(15 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l130_c2_9699_return_output : unsigned(15 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l130_c2_9699_cond : unsigned(0 downto 0);
 variable VAR_is_fill_active_MUX_uxn_c_l130_c2_9699_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_active_MUX_uxn_c_l130_c2_9699_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_active_MUX_uxn_c_l130_c2_9699_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_active_MUX_uxn_c_l130_c2_9699_cond : unsigned(0 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l130_c2_9699_iftrue : unsigned(15 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l130_c2_9699_iffalse : unsigned(15 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l130_c2_9699_return_output : unsigned(15 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l130_c2_9699_cond : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l130_c2_9699_iftrue : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l130_c2_9699_iffalse : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l130_c2_9699_return_output : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l130_c2_9699_cond : unsigned(0 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l130_c2_9699_iftrue : unsigned(15 downto 0);
 variable VAR_fill_pixels_remaining_uxn_c_l140_c3_3bc8 : unsigned(15 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l130_c2_9699_iffalse : unsigned(15 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l130_c2_9699_return_output : unsigned(15 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l130_c2_9699_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_c_l130_c2_9699_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_c_l130_c2_9699_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_c_l130_c2_9699_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_c_l130_c2_9699_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_c_l130_c2_9699_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_c_l130_c2_9699_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_c_l130_c2_9699_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_c_l130_c2_9699_cond : unsigned(0 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l130_c2_9699_iftrue : unsigned(15 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l130_c2_9699_iffalse : unsigned(15 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l130_c2_9699_return_output : unsigned(15 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l130_c2_9699_cond : unsigned(0 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l130_c2_9699_iftrue : unsigned(15 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l130_c2_9699_iffalse : unsigned(15 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l130_c2_9699_return_output : unsigned(15 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l130_c2_9699_cond : unsigned(0 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l130_c2_9699_iftrue : unsigned(1 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l130_c2_9699_iffalse : unsigned(1 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l130_c2_9699_return_output : unsigned(1 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l130_c2_9699_cond : unsigned(0 downto 0);
 variable VAR_is_fill_top : unsigned(0 downto 0);
 variable VAR_is_fill_top_uxn_c_l132_c11_3107_0 : unsigned(0 downto 0);
 variable VAR_CONST_SR_2_uxn_c_l132_c25_1bf1_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_2_uxn_c_l132_c25_1bf1_x : unsigned(7 downto 0);
 variable VAR_is_fill_left : unsigned(0 downto 0);
 variable VAR_is_fill_left_uxn_c_l133_c11_6d1d_0 : unsigned(0 downto 0);
 variable VAR_CONST_SR_3_uxn_c_l133_c26_a649_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_3_uxn_c_l133_c26_a649_x : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l134_c13_684c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l134_c13_684c_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l134_c13_684c_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l134_c13_684c_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l135_c13_fd46_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l135_c13_fd46_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l135_c13_fd46_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l135_c28_94c0_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l135_c28_94c0_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l135_c28_94c0_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l135_c13_fd46_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l136_c13_60c5_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l136_c13_60c5_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l136_c13_60c5_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l136_c13_60c5_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l137_c13_01ff_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l137_c13_01ff_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l137_c13_01ff_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l137_c32_4e45_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l137_c32_4e45_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l137_c32_4e45_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l137_c13_01ff_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint2_t_uxn_c_l139_c16_407c_return_output : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l140_c28_a79e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l140_c28_a79e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l140_c28_a79e_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l140_c28_80e4_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l140_c28_80e4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l140_c28_80e4_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l140_c28_f0b7_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l140_c54_aace_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l140_c54_aace_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l140_c54_aace_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l140_c54_8c61_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l140_c54_8c61_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l140_c54_8c61_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l140_c28_f0b7_right : unsigned(16 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l140_c28_f0b7_return_output : unsigned(33 downto 0);
 variable VAR_adjusted_vram_address : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l148_c35_ea55_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l148_c35_ea55_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l148_c35_ea55_iffalse : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l148_c54_5296_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l148_c54_e310_left : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l148_c54_5296_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l148_c54_e310_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l148_c54_e310_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l148_c35_ea55_return_output : unsigned(15 downto 0);
 variable VAR_is_new_fill_row : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l150_c29_d5fc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l150_c29_2607_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l150_c29_2607_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l150_c29_2607_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l150_c29_d5fc_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l150_c29_d5fc_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l150_c29_d5fc_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l151_c6_850d_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l151_c6_850d_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l151_c6_850d_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l151_c25_9b91_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l151_c25_9b91_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l151_c25_9b91_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l151_c6_850d_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l152_c6_8886_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l152_c6_8886_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l152_c6_8886_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l152_c34_adac_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l152_c34_adac_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l152_c34_adac_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l152_c6_8886_return_output : unsigned(15 downto 0);
 variable VAR_is_fill_pixel0 : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l154_c27_240f_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l154_c46_207c_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l154_c46_207c_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l154_c27_240f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l154_c27_240f_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_pixel1 : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l155_c27_b47b_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l155_c27_b47b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l155_c27_b47b_return_output : unsigned(0 downto 0);
 variable VAR_bg_pixel_color : unsigned(1 downto 0);
 variable VAR_bg_vram_update_uxn_c_l157_c27_cb58_read_address : unsigned(15 downto 0);
 variable VAR_bg_vram_update_uxn_c_l157_c27_cb58_write_address : unsigned(15 downto 0);
 variable VAR_bg_vram_update_uxn_c_l157_c27_cb58_write_value : unsigned(1 downto 0);
 variable VAR_bg_vram_update_uxn_c_l157_c27_cb58_write_enable : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l160_c3_17a8_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l160_c3_17a8_iftrue : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l160_c3_17a8_iffalse : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l160_c3_17a8_return_output : unsigned(1 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l161_c3_2de8_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l161_c22_2200_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l161_c57_1731_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l161_c57_1731_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l161_c22_2200_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l161_c22_2200_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l161_c3_2de8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l161_c3_2de8_return_output : unsigned(0 downto 0);
 variable VAR_bg_vram_update_uxn_c_l157_c27_cb58_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_bg_vram_update_uxn_c_l157_c27_cb58_return_output : unsigned(1 downto 0);
 variable VAR_fg_pixel_color : unsigned(1 downto 0);
 variable VAR_fg_vram_update_uxn_c_l164_c27_0d64_read_address : unsigned(15 downto 0);
 variable VAR_fg_vram_update_uxn_c_l164_c27_0d64_write_address : unsigned(15 downto 0);
 variable VAR_fg_vram_update_uxn_c_l164_c27_0d64_write_value : unsigned(1 downto 0);
 variable VAR_fg_vram_update_uxn_c_l164_c27_0d64_write_enable : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l167_c3_e75d_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l167_c3_e75d_iftrue : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l167_c3_e75d_iffalse : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l167_c3_e75d_return_output : unsigned(1 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l168_c3_544c_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l168_c22_5fc0_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l168_c22_5fc0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l168_c22_5fc0_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l168_c3_544c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l168_c3_544c_return_output : unsigned(0 downto 0);
 variable VAR_fg_vram_update_uxn_c_l164_c27_0d64_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_fg_vram_update_uxn_c_l164_c27_0d64_return_output : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l171_c26_4fce_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l171_c26_4fce_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l171_c26_4fce_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l171_c43_1f82_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l171_c43_1f82_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l171_c43_1f82_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l171_c26_4fce_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l172_c19_7602_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l172_c19_e669_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l172_c19_e669_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l172_c19_e669_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l172_c19_7602_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l172_c19_7602_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l172_c19_7602_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l173_c19_ea5e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l173_c19_f702_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l173_c19_f702_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l173_c19_f702_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l173_c19_ea5e_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l173_c19_ea5e_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l173_c50_2ade_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l173_c50_2ade_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l173_c50_2ade_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l173_c76_d5e3_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l173_c76_d5e3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l173_c76_d5e3_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l173_c50_2ade_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l173_c19_ea5e_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l174_c25_17dd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l174_c25_5c42_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l174_c25_5c42_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l174_c25_5c42_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l174_c25_17dd_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l174_c25_17dd_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l174_c25_17dd_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l175_c17_22a0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l175_c17_3feb_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l175_c17_3feb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l175_c17_3feb_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l175_c17_22a0_iftrue : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l175_c17_22a0_iffalse : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l175_c17_22a0_return_output : unsigned(1 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_c_l136_l134_DUPLICATE_827a_x : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_c_l136_l134_DUPLICATE_827a_return_output : unsigned(15 downto 0);
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_c_l168_l161_DUPLICATE_de01_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_c_l168_l161_DUPLICATE_de01_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l161_l168_DUPLICATE_5117_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l161_l168_DUPLICATE_5117_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l161_l168_DUPLICATE_5117_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_269d_uxn_c_l115_l178_DUPLICATE_d8f0_return_output : gpu_step_result_t;
 -- State registers comb logic variables
variable REG_VAR_result : gpu_step_result_t;
variable REG_VAR_fill_pixels_remaining : unsigned(15 downto 0);
variable REG_VAR_fill_x0 : unsigned(15 downto 0);
variable REG_VAR_fill_y0 : unsigned(15 downto 0);
variable REG_VAR_fill_x1 : unsigned(15 downto 0);
variable REG_VAR_fill_y1 : unsigned(15 downto 0);
variable REG_VAR_fill_color : unsigned(1 downto 0);
variable REG_VAR_is_fill_active : unsigned(0 downto 0);
variable REG_VAR_fill_layer : unsigned(0 downto 0);
variable REG_VAR_pixel_counter : unsigned(15 downto 0);
variable REG_VAR_x : unsigned(15 downto 0);
variable REG_VAR_y : unsigned(15 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_result := result;
  REG_VAR_fill_pixels_remaining := fill_pixels_remaining;
  REG_VAR_fill_x0 := fill_x0;
  REG_VAR_fill_y0 := fill_y0;
  REG_VAR_fill_x1 := fill_x1;
  REG_VAR_fill_y1 := fill_y1;
  REG_VAR_fill_color := fill_color;
  REG_VAR_is_fill_active := is_fill_active;
  REG_VAR_fill_layer := fill_layer;
  REG_VAR_pixel_counter := pixel_counter;
  REG_VAR_x := x;
  REG_VAR_y := y;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_AND_uxn_c_l135_c28_94c0_right := to_unsigned(255, 16);
     VAR_MUX_uxn_c_l136_c13_60c5_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_BIN_OP_EQ_uxn_c_l173_c19_f702_right := to_unsigned(61439, 16);
     VAR_MUX_uxn_c_l135_c13_fd46_iffalse := resize(to_unsigned(255, 8), 16);
     VAR_BIN_OP_EQ_uxn_c_l175_c17_3feb_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l172_c19_e669_right := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l150_c29_d5fc_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_c_l151_c25_9b91_right := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l171_c26_4fce_iffalse := resize(to_unsigned(0, 1), 16);
     VAR_MUX_uxn_c_l137_c13_01ff_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_MUX_uxn_c_l172_c19_7602_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_c_l140_c54_8c61_right := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l173_c19_ea5e_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_MUX_uxn_c_l174_c25_17dd_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_c_l137_c32_4e45_right := to_unsigned(255, 16);
     VAR_BIN_OP_EQ_uxn_c_l174_c25_5c42_right := to_unsigned(61439, 16);
     VAR_MUX_uxn_c_l172_c19_7602_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l150_c29_d5fc_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_c_l173_c76_d5e3_right := to_unsigned(1, 1);
     VAR_BIN_OP_MINUS_uxn_c_l171_c43_1f82_right := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l134_c13_684c_iffalse := resize(to_unsigned(239, 8), 16);
     VAR_BIN_OP_PLUS_uxn_c_l152_c34_adac_right := to_unsigned(1, 1);
     VAR_is_fill_active_MUX_uxn_c_l130_c2_9699_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_c_l140_c28_80e4_right := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l174_c25_17dd_iftrue := to_unsigned(1, 1);

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
     VAR_bg_vram_update_uxn_c_l157_c27_cb58_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_fg_vram_update_uxn_c_l164_c27_0d64_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_fill_color_MUX_uxn_c_l130_c2_9699_iffalse := fill_color;
     VAR_fill_layer_MUX_uxn_c_l130_c2_9699_iffalse := fill_layer;
     VAR_fill_pixels_remaining_MUX_uxn_c_l130_c2_9699_iffalse := fill_pixels_remaining;
     VAR_fill_x0_MUX_uxn_c_l130_c2_9699_iffalse := fill_x0;
     VAR_fill_x1_MUX_uxn_c_l130_c2_9699_iffalse := fill_x1;
     VAR_fill_y0_MUX_uxn_c_l130_c2_9699_iffalse := fill_y0;
     VAR_fill_y1_MUX_uxn_c_l130_c2_9699_iffalse := fill_y1;
     VAR_MUX_uxn_c_l173_c50_2ade_cond := VAR_is_active_drawing_area;
     VAR_UNARY_OP_NOT_uxn_c_l130_c22_d1aa_expr := is_fill_active;
     VAR_is_fill_active_MUX_uxn_c_l130_c2_9699_iffalse := is_fill_active;
     VAR_BIN_OP_AND_uxn_c_l127_c25_8913_left := VAR_is_vram_write;
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l161_l168_DUPLICATE_5117_right := VAR_is_vram_write;
     VAR_BIN_OP_EQ_uxn_c_l173_c19_f702_left := pixel_counter;
     VAR_BIN_OP_PLUS_uxn_c_l173_c76_d5e3_left := pixel_counter;
     VAR_MUX_uxn_c_l173_c50_2ade_iffalse := pixel_counter;
     VAR_bg_vram_update_uxn_c_l157_c27_cb58_read_address := pixel_counter;
     VAR_fg_vram_update_uxn_c_l164_c27_0d64_read_address := pixel_counter;
     VAR_BIN_OP_AND_uxn_c_l135_c28_94c0_left := VAR_vram_address;
     VAR_BIN_OP_AND_uxn_c_l137_c32_4e45_left := VAR_vram_address;
     VAR_CONST_SR_8_uint16_t_uxn_c_l136_l134_DUPLICATE_827a_x := VAR_vram_address;
     VAR_MUX_uxn_c_l148_c35_ea55_iffalse := VAR_vram_address;
     VAR_CONST_SR_2_uxn_c_l132_c25_1bf1_x := VAR_vram_value;
     VAR_CONST_SR_3_uxn_c_l133_c26_a649_x := VAR_vram_value;
     VAR_CONST_SR_4_uxn_c_l127_c52_7697_x := VAR_vram_value;
     VAR_MUX_uxn_c_l160_c3_17a8_iffalse := resize(VAR_vram_value, 2);
     VAR_MUX_uxn_c_l167_c3_e75d_iffalse := resize(VAR_vram_value, 2);
     VAR_BIN_OP_AND_uxn_c_l168_c22_5fc0_right := VAR_vram_write_layer;
     VAR_UNARY_OP_NOT_uxn_c_l161_c57_1731_expr := VAR_vram_write_layer;
     VAR_fill_layer_MUX_uxn_c_l130_c2_9699_iftrue := VAR_vram_write_layer;
     VAR_x_MUX_uxn_c_l130_c2_9699_iffalse := x;
     VAR_y_MUX_uxn_c_l130_c2_9699_iffalse := y;
     -- BIN_OP_PLUS[uxn_c_l173_c76_d5e3] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l173_c76_d5e3_left <= VAR_BIN_OP_PLUS_uxn_c_l173_c76_d5e3_left;
     BIN_OP_PLUS_uxn_c_l173_c76_d5e3_right <= VAR_BIN_OP_PLUS_uxn_c_l173_c76_d5e3_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l173_c76_d5e3_return_output := BIN_OP_PLUS_uxn_c_l173_c76_d5e3_return_output;

     -- CONST_SR_8_uint16_t_uxn_c_l136_l134_DUPLICATE_827a LATENCY=0
     -- Inputs
     CONST_SR_8_uint16_t_uxn_c_l136_l134_DUPLICATE_827a_x <= VAR_CONST_SR_8_uint16_t_uxn_c_l136_l134_DUPLICATE_827a_x;
     -- Outputs
     VAR_CONST_SR_8_uint16_t_uxn_c_l136_l134_DUPLICATE_827a_return_output := CONST_SR_8_uint16_t_uxn_c_l136_l134_DUPLICATE_827a_return_output;

     -- UNARY_OP_NOT[uxn_c_l130_c22_d1aa] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l130_c22_d1aa_expr <= VAR_UNARY_OP_NOT_uxn_c_l130_c22_d1aa_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l130_c22_d1aa_return_output := UNARY_OP_NOT_uxn_c_l130_c22_d1aa_return_output;

     -- UNARY_OP_NOT[uxn_c_l161_c57_1731] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l161_c57_1731_expr <= VAR_UNARY_OP_NOT_uxn_c_l161_c57_1731_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l161_c57_1731_return_output := UNARY_OP_NOT_uxn_c_l161_c57_1731_return_output;

     -- BIN_OP_EQ[uxn_c_l173_c19_f702] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l173_c19_f702_left <= VAR_BIN_OP_EQ_uxn_c_l173_c19_f702_left;
     BIN_OP_EQ_uxn_c_l173_c19_f702_right <= VAR_BIN_OP_EQ_uxn_c_l173_c19_f702_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l173_c19_f702_return_output := BIN_OP_EQ_uxn_c_l173_c19_f702_return_output;

     -- BIN_OP_AND[uxn_c_l135_c28_94c0] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l135_c28_94c0_left <= VAR_BIN_OP_AND_uxn_c_l135_c28_94c0_left;
     BIN_OP_AND_uxn_c_l135_c28_94c0_right <= VAR_BIN_OP_AND_uxn_c_l135_c28_94c0_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l135_c28_94c0_return_output := BIN_OP_AND_uxn_c_l135_c28_94c0_return_output;

     -- CONST_SR_3[uxn_c_l133_c26_a649] LATENCY=0
     -- Inputs
     CONST_SR_3_uxn_c_l133_c26_a649_x <= VAR_CONST_SR_3_uxn_c_l133_c26_a649_x;
     -- Outputs
     VAR_CONST_SR_3_uxn_c_l133_c26_a649_return_output := CONST_SR_3_uxn_c_l133_c26_a649_return_output;

     -- CONST_SR_4[uxn_c_l127_c52_7697] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_c_l127_c52_7697_x <= VAR_CONST_SR_4_uxn_c_l127_c52_7697_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_c_l127_c52_7697_return_output := CONST_SR_4_uxn_c_l127_c52_7697_return_output;

     -- BIN_OP_AND[uxn_c_l137_c32_4e45] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l137_c32_4e45_left <= VAR_BIN_OP_AND_uxn_c_l137_c32_4e45_left;
     BIN_OP_AND_uxn_c_l137_c32_4e45_right <= VAR_BIN_OP_AND_uxn_c_l137_c32_4e45_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l137_c32_4e45_return_output := BIN_OP_AND_uxn_c_l137_c32_4e45_return_output;

     -- CONST_SR_2[uxn_c_l132_c25_1bf1] LATENCY=0
     -- Inputs
     CONST_SR_2_uxn_c_l132_c25_1bf1_x <= VAR_CONST_SR_2_uxn_c_l132_c25_1bf1_x;
     -- Outputs
     VAR_CONST_SR_2_uxn_c_l132_c25_1bf1_return_output := CONST_SR_2_uxn_c_l132_c25_1bf1_return_output;

     -- CAST_TO_uint2_t[uxn_c_l139_c16_407c] LATENCY=0
     VAR_CAST_TO_uint2_t_uxn_c_l139_c16_407c_return_output := CAST_TO_uint2_t_uint8_t(
     VAR_vram_value);

     -- Submodule level 1
     VAR_MUX_uxn_c_l135_c13_fd46_iftrue := VAR_BIN_OP_AND_uxn_c_l135_c28_94c0_return_output;
     VAR_MUX_uxn_c_l137_c13_01ff_iffalse := VAR_BIN_OP_AND_uxn_c_l137_c32_4e45_return_output;
     VAR_MUX_uxn_c_l173_c19_ea5e_cond := VAR_BIN_OP_EQ_uxn_c_l173_c19_f702_return_output;
     VAR_MUX_uxn_c_l173_c50_2ade_iftrue := resize(VAR_BIN_OP_PLUS_uxn_c_l173_c76_d5e3_return_output, 16);
     VAR_fill_color_MUX_uxn_c_l130_c2_9699_iftrue := VAR_CAST_TO_uint2_t_uxn_c_l139_c16_407c_return_output;
     VAR_is_fill_top_uxn_c_l132_c11_3107_0 := resize(VAR_CONST_SR_2_uxn_c_l132_c25_1bf1_return_output, 1);
     VAR_is_fill_left_uxn_c_l133_c11_6d1d_0 := resize(VAR_CONST_SR_3_uxn_c_l133_c26_a649_return_output, 1);
     VAR_MUX_uxn_c_l134_c13_684c_iftrue := VAR_CONST_SR_8_uint16_t_uxn_c_l136_l134_DUPLICATE_827a_return_output;
     VAR_MUX_uxn_c_l136_c13_60c5_iffalse := VAR_CONST_SR_8_uint16_t_uxn_c_l136_l134_DUPLICATE_827a_return_output;
     VAR_BIN_OP_AND_uxn_c_l130_c6_84d2_right := VAR_UNARY_OP_NOT_uxn_c_l130_c22_d1aa_return_output;
     VAR_BIN_OP_AND_uxn_c_l161_c22_2200_right := VAR_UNARY_OP_NOT_uxn_c_l161_c57_1731_return_output;
     VAR_MUX_uxn_c_l135_c13_fd46_cond := VAR_is_fill_left_uxn_c_l133_c11_6d1d_0;
     VAR_MUX_uxn_c_l137_c13_01ff_cond := VAR_is_fill_left_uxn_c_l133_c11_6d1d_0;
     VAR_MUX_uxn_c_l134_c13_684c_cond := VAR_is_fill_top_uxn_c_l132_c11_3107_0;
     VAR_MUX_uxn_c_l136_c13_60c5_cond := VAR_is_fill_top_uxn_c_l132_c11_3107_0;
     -- MUX[uxn_c_l136_c13_60c5] LATENCY=0
     -- Inputs
     MUX_uxn_c_l136_c13_60c5_cond <= VAR_MUX_uxn_c_l136_c13_60c5_cond;
     MUX_uxn_c_l136_c13_60c5_iftrue <= VAR_MUX_uxn_c_l136_c13_60c5_iftrue;
     MUX_uxn_c_l136_c13_60c5_iffalse <= VAR_MUX_uxn_c_l136_c13_60c5_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l136_c13_60c5_return_output := MUX_uxn_c_l136_c13_60c5_return_output;

     -- MUX[uxn_c_l173_c50_2ade] LATENCY=0
     -- Inputs
     MUX_uxn_c_l173_c50_2ade_cond <= VAR_MUX_uxn_c_l173_c50_2ade_cond;
     MUX_uxn_c_l173_c50_2ade_iftrue <= VAR_MUX_uxn_c_l173_c50_2ade_iftrue;
     MUX_uxn_c_l173_c50_2ade_iffalse <= VAR_MUX_uxn_c_l173_c50_2ade_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l173_c50_2ade_return_output := MUX_uxn_c_l173_c50_2ade_return_output;

     -- MUX[uxn_c_l134_c13_684c] LATENCY=0
     -- Inputs
     MUX_uxn_c_l134_c13_684c_cond <= VAR_MUX_uxn_c_l134_c13_684c_cond;
     MUX_uxn_c_l134_c13_684c_iftrue <= VAR_MUX_uxn_c_l134_c13_684c_iftrue;
     MUX_uxn_c_l134_c13_684c_iffalse <= VAR_MUX_uxn_c_l134_c13_684c_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l134_c13_684c_return_output := MUX_uxn_c_l134_c13_684c_return_output;

     -- MUX[uxn_c_l135_c13_fd46] LATENCY=0
     -- Inputs
     MUX_uxn_c_l135_c13_fd46_cond <= VAR_MUX_uxn_c_l135_c13_fd46_cond;
     MUX_uxn_c_l135_c13_fd46_iftrue <= VAR_MUX_uxn_c_l135_c13_fd46_iftrue;
     MUX_uxn_c_l135_c13_fd46_iffalse <= VAR_MUX_uxn_c_l135_c13_fd46_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l135_c13_fd46_return_output := MUX_uxn_c_l135_c13_fd46_return_output;

     -- CAST_TO_uint1_t[uxn_c_l127_c42_fe05] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_c_l127_c42_fe05_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_4_uxn_c_l127_c52_7697_return_output);

     -- MUX[uxn_c_l137_c13_01ff] LATENCY=0
     -- Inputs
     MUX_uxn_c_l137_c13_01ff_cond <= VAR_MUX_uxn_c_l137_c13_01ff_cond;
     MUX_uxn_c_l137_c13_01ff_iftrue <= VAR_MUX_uxn_c_l137_c13_01ff_iftrue;
     MUX_uxn_c_l137_c13_01ff_iffalse <= VAR_MUX_uxn_c_l137_c13_01ff_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l137_c13_01ff_return_output := MUX_uxn_c_l137_c13_01ff_return_output;

     -- Submodule level 2
     VAR_BIN_OP_AND_uxn_c_l127_c25_8913_right := VAR_CAST_TO_uint1_t_uxn_c_l127_c42_fe05_return_output;
     VAR_BIN_OP_MINUS_uxn_c_l140_c54_aace_left := VAR_MUX_uxn_c_l134_c13_684c_return_output;
     VAR_fill_y1_MUX_uxn_c_l130_c2_9699_iftrue := VAR_MUX_uxn_c_l134_c13_684c_return_output;
     VAR_BIN_OP_MINUS_uxn_c_l140_c28_a79e_left := VAR_MUX_uxn_c_l135_c13_fd46_return_output;
     VAR_fill_x1_MUX_uxn_c_l130_c2_9699_iftrue := VAR_MUX_uxn_c_l135_c13_fd46_return_output;
     VAR_BIN_OP_MINUS_uxn_c_l140_c54_aace_right := VAR_MUX_uxn_c_l136_c13_60c5_return_output;
     VAR_fill_y0_MUX_uxn_c_l130_c2_9699_iftrue := VAR_MUX_uxn_c_l136_c13_60c5_return_output;
     VAR_y_MUX_uxn_c_l130_c2_9699_iftrue := VAR_MUX_uxn_c_l136_c13_60c5_return_output;
     VAR_BIN_OP_MINUS_uxn_c_l140_c28_a79e_right := VAR_MUX_uxn_c_l137_c13_01ff_return_output;
     VAR_fill_x0_MUX_uxn_c_l130_c2_9699_iftrue := VAR_MUX_uxn_c_l137_c13_01ff_return_output;
     VAR_x_MUX_uxn_c_l130_c2_9699_iftrue := VAR_MUX_uxn_c_l137_c13_01ff_return_output;
     VAR_MUX_uxn_c_l173_c19_ea5e_iffalse := VAR_MUX_uxn_c_l173_c50_2ade_return_output;
     -- MUX[uxn_c_l173_c19_ea5e] LATENCY=0
     -- Inputs
     MUX_uxn_c_l173_c19_ea5e_cond <= VAR_MUX_uxn_c_l173_c19_ea5e_cond;
     MUX_uxn_c_l173_c19_ea5e_iftrue <= VAR_MUX_uxn_c_l173_c19_ea5e_iftrue;
     MUX_uxn_c_l173_c19_ea5e_iffalse <= VAR_MUX_uxn_c_l173_c19_ea5e_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l173_c19_ea5e_return_output := MUX_uxn_c_l173_c19_ea5e_return_output;

     -- BIN_OP_MINUS[uxn_c_l140_c54_aace] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l140_c54_aace_left <= VAR_BIN_OP_MINUS_uxn_c_l140_c54_aace_left;
     BIN_OP_MINUS_uxn_c_l140_c54_aace_right <= VAR_BIN_OP_MINUS_uxn_c_l140_c54_aace_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l140_c54_aace_return_output := BIN_OP_MINUS_uxn_c_l140_c54_aace_return_output;

     -- BIN_OP_AND[uxn_c_l127_c25_8913] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l127_c25_8913_left <= VAR_BIN_OP_AND_uxn_c_l127_c25_8913_left;
     BIN_OP_AND_uxn_c_l127_c25_8913_right <= VAR_BIN_OP_AND_uxn_c_l127_c25_8913_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l127_c25_8913_return_output := BIN_OP_AND_uxn_c_l127_c25_8913_return_output;

     -- BIN_OP_MINUS[uxn_c_l140_c28_a79e] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l140_c28_a79e_left <= VAR_BIN_OP_MINUS_uxn_c_l140_c28_a79e_left;
     BIN_OP_MINUS_uxn_c_l140_c28_a79e_right <= VAR_BIN_OP_MINUS_uxn_c_l140_c28_a79e_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l140_c28_a79e_return_output := BIN_OP_MINUS_uxn_c_l140_c28_a79e_return_output;

     -- Submodule level 3
     VAR_BIN_OP_AND_uxn_c_l130_c6_84d2_left := VAR_BIN_OP_AND_uxn_c_l127_c25_8913_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l140_c28_80e4_left := VAR_BIN_OP_MINUS_uxn_c_l140_c28_a79e_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l140_c54_8c61_left := VAR_BIN_OP_MINUS_uxn_c_l140_c54_aace_return_output;
     VAR_BIN_OP_EQ_uxn_c_l174_c25_5c42_left := VAR_MUX_uxn_c_l173_c19_ea5e_return_output;
     REG_VAR_pixel_counter := VAR_MUX_uxn_c_l173_c19_ea5e_return_output;
     -- BIN_OP_EQ[uxn_c_l174_c25_5c42] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l174_c25_5c42_left <= VAR_BIN_OP_EQ_uxn_c_l174_c25_5c42_left;
     BIN_OP_EQ_uxn_c_l174_c25_5c42_right <= VAR_BIN_OP_EQ_uxn_c_l174_c25_5c42_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l174_c25_5c42_return_output := BIN_OP_EQ_uxn_c_l174_c25_5c42_return_output;

     -- BIN_OP_AND[uxn_c_l130_c6_84d2] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l130_c6_84d2_left <= VAR_BIN_OP_AND_uxn_c_l130_c6_84d2_left;
     BIN_OP_AND_uxn_c_l130_c6_84d2_right <= VAR_BIN_OP_AND_uxn_c_l130_c6_84d2_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l130_c6_84d2_return_output := BIN_OP_AND_uxn_c_l130_c6_84d2_return_output;

     -- BIN_OP_PLUS[uxn_c_l140_c28_80e4] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l140_c28_80e4_left <= VAR_BIN_OP_PLUS_uxn_c_l140_c28_80e4_left;
     BIN_OP_PLUS_uxn_c_l140_c28_80e4_right <= VAR_BIN_OP_PLUS_uxn_c_l140_c28_80e4_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l140_c28_80e4_return_output := BIN_OP_PLUS_uxn_c_l140_c28_80e4_return_output;

     -- BIN_OP_PLUS[uxn_c_l140_c54_8c61] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l140_c54_8c61_left <= VAR_BIN_OP_PLUS_uxn_c_l140_c54_8c61_left;
     BIN_OP_PLUS_uxn_c_l140_c54_8c61_right <= VAR_BIN_OP_PLUS_uxn_c_l140_c54_8c61_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l140_c54_8c61_return_output := BIN_OP_PLUS_uxn_c_l140_c54_8c61_return_output;

     -- Submodule level 4
     VAR_fill_color_MUX_uxn_c_l130_c2_9699_cond := VAR_BIN_OP_AND_uxn_c_l130_c6_84d2_return_output;
     VAR_fill_layer_MUX_uxn_c_l130_c2_9699_cond := VAR_BIN_OP_AND_uxn_c_l130_c6_84d2_return_output;
     VAR_fill_pixels_remaining_MUX_uxn_c_l130_c2_9699_cond := VAR_BIN_OP_AND_uxn_c_l130_c6_84d2_return_output;
     VAR_fill_x0_MUX_uxn_c_l130_c2_9699_cond := VAR_BIN_OP_AND_uxn_c_l130_c6_84d2_return_output;
     VAR_fill_x1_MUX_uxn_c_l130_c2_9699_cond := VAR_BIN_OP_AND_uxn_c_l130_c6_84d2_return_output;
     VAR_fill_y0_MUX_uxn_c_l130_c2_9699_cond := VAR_BIN_OP_AND_uxn_c_l130_c6_84d2_return_output;
     VAR_fill_y1_MUX_uxn_c_l130_c2_9699_cond := VAR_BIN_OP_AND_uxn_c_l130_c6_84d2_return_output;
     VAR_is_fill_active_MUX_uxn_c_l130_c2_9699_cond := VAR_BIN_OP_AND_uxn_c_l130_c6_84d2_return_output;
     VAR_x_MUX_uxn_c_l130_c2_9699_cond := VAR_BIN_OP_AND_uxn_c_l130_c6_84d2_return_output;
     VAR_y_MUX_uxn_c_l130_c2_9699_cond := VAR_BIN_OP_AND_uxn_c_l130_c6_84d2_return_output;
     VAR_MUX_uxn_c_l174_c25_17dd_cond := VAR_BIN_OP_EQ_uxn_c_l174_c25_5c42_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l140_c28_f0b7_left := VAR_BIN_OP_PLUS_uxn_c_l140_c28_80e4_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l140_c28_f0b7_right := VAR_BIN_OP_PLUS_uxn_c_l140_c54_8c61_return_output;
     -- fill_layer_MUX[uxn_c_l130_c2_9699] LATENCY=0
     -- Inputs
     fill_layer_MUX_uxn_c_l130_c2_9699_cond <= VAR_fill_layer_MUX_uxn_c_l130_c2_9699_cond;
     fill_layer_MUX_uxn_c_l130_c2_9699_iftrue <= VAR_fill_layer_MUX_uxn_c_l130_c2_9699_iftrue;
     fill_layer_MUX_uxn_c_l130_c2_9699_iffalse <= VAR_fill_layer_MUX_uxn_c_l130_c2_9699_iffalse;
     -- Outputs
     VAR_fill_layer_MUX_uxn_c_l130_c2_9699_return_output := fill_layer_MUX_uxn_c_l130_c2_9699_return_output;

     -- fill_y0_MUX[uxn_c_l130_c2_9699] LATENCY=0
     -- Inputs
     fill_y0_MUX_uxn_c_l130_c2_9699_cond <= VAR_fill_y0_MUX_uxn_c_l130_c2_9699_cond;
     fill_y0_MUX_uxn_c_l130_c2_9699_iftrue <= VAR_fill_y0_MUX_uxn_c_l130_c2_9699_iftrue;
     fill_y0_MUX_uxn_c_l130_c2_9699_iffalse <= VAR_fill_y0_MUX_uxn_c_l130_c2_9699_iffalse;
     -- Outputs
     VAR_fill_y0_MUX_uxn_c_l130_c2_9699_return_output := fill_y0_MUX_uxn_c_l130_c2_9699_return_output;

     -- fill_color_MUX[uxn_c_l130_c2_9699] LATENCY=0
     -- Inputs
     fill_color_MUX_uxn_c_l130_c2_9699_cond <= VAR_fill_color_MUX_uxn_c_l130_c2_9699_cond;
     fill_color_MUX_uxn_c_l130_c2_9699_iftrue <= VAR_fill_color_MUX_uxn_c_l130_c2_9699_iftrue;
     fill_color_MUX_uxn_c_l130_c2_9699_iffalse <= VAR_fill_color_MUX_uxn_c_l130_c2_9699_iffalse;
     -- Outputs
     VAR_fill_color_MUX_uxn_c_l130_c2_9699_return_output := fill_color_MUX_uxn_c_l130_c2_9699_return_output;

     -- y_MUX[uxn_c_l130_c2_9699] LATENCY=0
     -- Inputs
     y_MUX_uxn_c_l130_c2_9699_cond <= VAR_y_MUX_uxn_c_l130_c2_9699_cond;
     y_MUX_uxn_c_l130_c2_9699_iftrue <= VAR_y_MUX_uxn_c_l130_c2_9699_iftrue;
     y_MUX_uxn_c_l130_c2_9699_iffalse <= VAR_y_MUX_uxn_c_l130_c2_9699_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_c_l130_c2_9699_return_output := y_MUX_uxn_c_l130_c2_9699_return_output;

     -- x_MUX[uxn_c_l130_c2_9699] LATENCY=0
     -- Inputs
     x_MUX_uxn_c_l130_c2_9699_cond <= VAR_x_MUX_uxn_c_l130_c2_9699_cond;
     x_MUX_uxn_c_l130_c2_9699_iftrue <= VAR_x_MUX_uxn_c_l130_c2_9699_iftrue;
     x_MUX_uxn_c_l130_c2_9699_iffalse <= VAR_x_MUX_uxn_c_l130_c2_9699_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_c_l130_c2_9699_return_output := x_MUX_uxn_c_l130_c2_9699_return_output;

     -- fill_x1_MUX[uxn_c_l130_c2_9699] LATENCY=0
     -- Inputs
     fill_x1_MUX_uxn_c_l130_c2_9699_cond <= VAR_fill_x1_MUX_uxn_c_l130_c2_9699_cond;
     fill_x1_MUX_uxn_c_l130_c2_9699_iftrue <= VAR_fill_x1_MUX_uxn_c_l130_c2_9699_iftrue;
     fill_x1_MUX_uxn_c_l130_c2_9699_iffalse <= VAR_fill_x1_MUX_uxn_c_l130_c2_9699_iffalse;
     -- Outputs
     VAR_fill_x1_MUX_uxn_c_l130_c2_9699_return_output := fill_x1_MUX_uxn_c_l130_c2_9699_return_output;

     -- fill_y1_MUX[uxn_c_l130_c2_9699] LATENCY=0
     -- Inputs
     fill_y1_MUX_uxn_c_l130_c2_9699_cond <= VAR_fill_y1_MUX_uxn_c_l130_c2_9699_cond;
     fill_y1_MUX_uxn_c_l130_c2_9699_iftrue <= VAR_fill_y1_MUX_uxn_c_l130_c2_9699_iftrue;
     fill_y1_MUX_uxn_c_l130_c2_9699_iffalse <= VAR_fill_y1_MUX_uxn_c_l130_c2_9699_iffalse;
     -- Outputs
     VAR_fill_y1_MUX_uxn_c_l130_c2_9699_return_output := fill_y1_MUX_uxn_c_l130_c2_9699_return_output;

     -- MUX[uxn_c_l174_c25_17dd] LATENCY=0
     -- Inputs
     MUX_uxn_c_l174_c25_17dd_cond <= VAR_MUX_uxn_c_l174_c25_17dd_cond;
     MUX_uxn_c_l174_c25_17dd_iftrue <= VAR_MUX_uxn_c_l174_c25_17dd_iftrue;
     MUX_uxn_c_l174_c25_17dd_iffalse <= VAR_MUX_uxn_c_l174_c25_17dd_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l174_c25_17dd_return_output := MUX_uxn_c_l174_c25_17dd_return_output;

     -- is_fill_active_MUX[uxn_c_l130_c2_9699] LATENCY=0
     -- Inputs
     is_fill_active_MUX_uxn_c_l130_c2_9699_cond <= VAR_is_fill_active_MUX_uxn_c_l130_c2_9699_cond;
     is_fill_active_MUX_uxn_c_l130_c2_9699_iftrue <= VAR_is_fill_active_MUX_uxn_c_l130_c2_9699_iftrue;
     is_fill_active_MUX_uxn_c_l130_c2_9699_iffalse <= VAR_is_fill_active_MUX_uxn_c_l130_c2_9699_iffalse;
     -- Outputs
     VAR_is_fill_active_MUX_uxn_c_l130_c2_9699_return_output := is_fill_active_MUX_uxn_c_l130_c2_9699_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_c_l140_c28_f0b7] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_c_l140_c28_f0b7_left <= VAR_BIN_OP_INFERRED_MULT_uxn_c_l140_c28_f0b7_left;
     BIN_OP_INFERRED_MULT_uxn_c_l140_c28_f0b7_right <= VAR_BIN_OP_INFERRED_MULT_uxn_c_l140_c28_f0b7_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l140_c28_f0b7_return_output := BIN_OP_INFERRED_MULT_uxn_c_l140_c28_f0b7_return_output;

     -- fill_x0_MUX[uxn_c_l130_c2_9699] LATENCY=0
     -- Inputs
     fill_x0_MUX_uxn_c_l130_c2_9699_cond <= VAR_fill_x0_MUX_uxn_c_l130_c2_9699_cond;
     fill_x0_MUX_uxn_c_l130_c2_9699_iftrue <= VAR_fill_x0_MUX_uxn_c_l130_c2_9699_iftrue;
     fill_x0_MUX_uxn_c_l130_c2_9699_iffalse <= VAR_fill_x0_MUX_uxn_c_l130_c2_9699_iffalse;
     -- Outputs
     VAR_fill_x0_MUX_uxn_c_l130_c2_9699_return_output := fill_x0_MUX_uxn_c_l130_c2_9699_return_output;

     -- Submodule level 5
     VAR_fill_pixels_remaining_uxn_c_l140_c3_3bc8 := resize(VAR_BIN_OP_INFERRED_MULT_uxn_c_l140_c28_f0b7_return_output, 16);
     VAR_MUX_uxn_c_l160_c3_17a8_iftrue := VAR_fill_color_MUX_uxn_c_l130_c2_9699_return_output;
     VAR_MUX_uxn_c_l167_c3_e75d_iftrue := VAR_fill_color_MUX_uxn_c_l130_c2_9699_return_output;
     REG_VAR_fill_color := VAR_fill_color_MUX_uxn_c_l130_c2_9699_return_output;
     VAR_BIN_OP_AND_uxn_c_l155_c27_b47b_right := VAR_fill_layer_MUX_uxn_c_l130_c2_9699_return_output;
     VAR_UNARY_OP_NOT_uxn_c_l154_c46_207c_expr := VAR_fill_layer_MUX_uxn_c_l130_c2_9699_return_output;
     REG_VAR_fill_layer := VAR_fill_layer_MUX_uxn_c_l130_c2_9699_return_output;
     VAR_MUX_uxn_c_l152_c6_8886_iftrue := VAR_fill_x0_MUX_uxn_c_l130_c2_9699_return_output;
     REG_VAR_fill_x0 := VAR_fill_x0_MUX_uxn_c_l130_c2_9699_return_output;
     VAR_BIN_OP_EQ_uxn_c_l150_c29_2607_right := VAR_fill_x1_MUX_uxn_c_l130_c2_9699_return_output;
     REG_VAR_fill_x1 := VAR_fill_x1_MUX_uxn_c_l130_c2_9699_return_output;
     REG_VAR_fill_y0 := VAR_fill_y0_MUX_uxn_c_l130_c2_9699_return_output;
     REG_VAR_fill_y1 := VAR_fill_y1_MUX_uxn_c_l130_c2_9699_return_output;
     VAR_BIN_OP_AND_uxn_c_l154_c27_240f_left := VAR_is_fill_active_MUX_uxn_c_l130_c2_9699_return_output;
     VAR_BIN_OP_AND_uxn_c_l155_c27_b47b_left := VAR_is_fill_active_MUX_uxn_c_l130_c2_9699_return_output;
     VAR_MUX_uxn_c_l148_c35_ea55_cond := VAR_is_fill_active_MUX_uxn_c_l130_c2_9699_return_output;
     VAR_MUX_uxn_c_l171_c26_4fce_cond := VAR_is_fill_active_MUX_uxn_c_l130_c2_9699_return_output;
     VAR_UNARY_OP_NOT_uint1_t_uxn_c_l168_l161_DUPLICATE_de01_expr := VAR_is_fill_active_MUX_uxn_c_l130_c2_9699_return_output;
     VAR_BIN_OP_EQ_uxn_c_l150_c29_2607_left := VAR_x_MUX_uxn_c_l130_c2_9699_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l148_c54_e310_right := VAR_x_MUX_uxn_c_l130_c2_9699_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l152_c34_adac_left := VAR_x_MUX_uxn_c_l130_c2_9699_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l151_c25_9b91_left := VAR_y_MUX_uxn_c_l130_c2_9699_return_output;
     VAR_CONST_SL_8_uxn_c_l148_c54_5296_x := VAR_y_MUX_uxn_c_l130_c2_9699_return_output;
     VAR_MUX_uxn_c_l151_c6_850d_iffalse := VAR_y_MUX_uxn_c_l130_c2_9699_return_output;
     VAR_fill_pixels_remaining_MUX_uxn_c_l130_c2_9699_iftrue := VAR_fill_pixels_remaining_uxn_c_l140_c3_3bc8;
     -- BIN_OP_AND[uxn_c_l155_c27_b47b] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l155_c27_b47b_left <= VAR_BIN_OP_AND_uxn_c_l155_c27_b47b_left;
     BIN_OP_AND_uxn_c_l155_c27_b47b_right <= VAR_BIN_OP_AND_uxn_c_l155_c27_b47b_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l155_c27_b47b_return_output := BIN_OP_AND_uxn_c_l155_c27_b47b_return_output;

     -- BIN_OP_PLUS[uxn_c_l152_c34_adac] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l152_c34_adac_left <= VAR_BIN_OP_PLUS_uxn_c_l152_c34_adac_left;
     BIN_OP_PLUS_uxn_c_l152_c34_adac_right <= VAR_BIN_OP_PLUS_uxn_c_l152_c34_adac_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l152_c34_adac_return_output := BIN_OP_PLUS_uxn_c_l152_c34_adac_return_output;

     -- BIN_OP_PLUS[uxn_c_l151_c25_9b91] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l151_c25_9b91_left <= VAR_BIN_OP_PLUS_uxn_c_l151_c25_9b91_left;
     BIN_OP_PLUS_uxn_c_l151_c25_9b91_right <= VAR_BIN_OP_PLUS_uxn_c_l151_c25_9b91_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l151_c25_9b91_return_output := BIN_OP_PLUS_uxn_c_l151_c25_9b91_return_output;

     -- BIN_OP_EQ[uxn_c_l150_c29_2607] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l150_c29_2607_left <= VAR_BIN_OP_EQ_uxn_c_l150_c29_2607_left;
     BIN_OP_EQ_uxn_c_l150_c29_2607_right <= VAR_BIN_OP_EQ_uxn_c_l150_c29_2607_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l150_c29_2607_return_output := BIN_OP_EQ_uxn_c_l150_c29_2607_return_output;

     -- UNARY_OP_NOT_uint1_t_uxn_c_l168_l161_DUPLICATE_de01 LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uint1_t_uxn_c_l168_l161_DUPLICATE_de01_expr <= VAR_UNARY_OP_NOT_uint1_t_uxn_c_l168_l161_DUPLICATE_de01_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uint1_t_uxn_c_l168_l161_DUPLICATE_de01_return_output := UNARY_OP_NOT_uint1_t_uxn_c_l168_l161_DUPLICATE_de01_return_output;

     -- UNARY_OP_NOT[uxn_c_l154_c46_207c] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l154_c46_207c_expr <= VAR_UNARY_OP_NOT_uxn_c_l154_c46_207c_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l154_c46_207c_return_output := UNARY_OP_NOT_uxn_c_l154_c46_207c_return_output;

     -- fill_pixels_remaining_MUX[uxn_c_l130_c2_9699] LATENCY=0
     -- Inputs
     fill_pixels_remaining_MUX_uxn_c_l130_c2_9699_cond <= VAR_fill_pixels_remaining_MUX_uxn_c_l130_c2_9699_cond;
     fill_pixels_remaining_MUX_uxn_c_l130_c2_9699_iftrue <= VAR_fill_pixels_remaining_MUX_uxn_c_l130_c2_9699_iftrue;
     fill_pixels_remaining_MUX_uxn_c_l130_c2_9699_iffalse <= VAR_fill_pixels_remaining_MUX_uxn_c_l130_c2_9699_iffalse;
     -- Outputs
     VAR_fill_pixels_remaining_MUX_uxn_c_l130_c2_9699_return_output := fill_pixels_remaining_MUX_uxn_c_l130_c2_9699_return_output;

     -- CONST_SL_8[uxn_c_l148_c54_5296] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l148_c54_5296_x <= VAR_CONST_SL_8_uxn_c_l148_c54_5296_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l148_c54_5296_return_output := CONST_SL_8_uxn_c_l148_c54_5296_return_output;

     -- Submodule level 6
     VAR_BIN_OP_OR_uxn_c_l168_c3_544c_left := VAR_BIN_OP_AND_uxn_c_l155_c27_b47b_return_output;
     VAR_MUX_uxn_c_l167_c3_e75d_cond := VAR_BIN_OP_AND_uxn_c_l155_c27_b47b_return_output;
     VAR_MUX_uxn_c_l150_c29_d5fc_cond := VAR_BIN_OP_EQ_uxn_c_l150_c29_2607_return_output;
     VAR_MUX_uxn_c_l151_c6_850d_iftrue := resize(VAR_BIN_OP_PLUS_uxn_c_l151_c25_9b91_return_output, 16);
     VAR_MUX_uxn_c_l152_c6_8886_iffalse := resize(VAR_BIN_OP_PLUS_uxn_c_l152_c34_adac_return_output, 16);
     VAR_BIN_OP_PLUS_uxn_c_l148_c54_e310_left := VAR_CONST_SL_8_uxn_c_l148_c54_5296_return_output;
     VAR_BIN_OP_AND_uxn_c_l154_c27_240f_right := VAR_UNARY_OP_NOT_uxn_c_l154_c46_207c_return_output;
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l161_l168_DUPLICATE_5117_left := VAR_UNARY_OP_NOT_uint1_t_uxn_c_l168_l161_DUPLICATE_de01_return_output;
     VAR_BIN_OP_MINUS_uxn_c_l171_c43_1f82_left := VAR_fill_pixels_remaining_MUX_uxn_c_l130_c2_9699_return_output;
     -- MUX[uxn_c_l150_c29_d5fc] LATENCY=0
     -- Inputs
     MUX_uxn_c_l150_c29_d5fc_cond <= VAR_MUX_uxn_c_l150_c29_d5fc_cond;
     MUX_uxn_c_l150_c29_d5fc_iftrue <= VAR_MUX_uxn_c_l150_c29_d5fc_iftrue;
     MUX_uxn_c_l150_c29_d5fc_iffalse <= VAR_MUX_uxn_c_l150_c29_d5fc_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l150_c29_d5fc_return_output := MUX_uxn_c_l150_c29_d5fc_return_output;

     -- BIN_OP_AND[uxn_c_l154_c27_240f] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l154_c27_240f_left <= VAR_BIN_OP_AND_uxn_c_l154_c27_240f_left;
     BIN_OP_AND_uxn_c_l154_c27_240f_right <= VAR_BIN_OP_AND_uxn_c_l154_c27_240f_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l154_c27_240f_return_output := BIN_OP_AND_uxn_c_l154_c27_240f_return_output;

     -- MUX[uxn_c_l167_c3_e75d] LATENCY=0
     -- Inputs
     MUX_uxn_c_l167_c3_e75d_cond <= VAR_MUX_uxn_c_l167_c3_e75d_cond;
     MUX_uxn_c_l167_c3_e75d_iftrue <= VAR_MUX_uxn_c_l167_c3_e75d_iftrue;
     MUX_uxn_c_l167_c3_e75d_iffalse <= VAR_MUX_uxn_c_l167_c3_e75d_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l167_c3_e75d_return_output := MUX_uxn_c_l167_c3_e75d_return_output;

     -- BIN_OP_PLUS[uxn_c_l148_c54_e310] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l148_c54_e310_left <= VAR_BIN_OP_PLUS_uxn_c_l148_c54_e310_left;
     BIN_OP_PLUS_uxn_c_l148_c54_e310_right <= VAR_BIN_OP_PLUS_uxn_c_l148_c54_e310_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l148_c54_e310_return_output := BIN_OP_PLUS_uxn_c_l148_c54_e310_return_output;

     -- BIN_OP_AND_uint1_t_uint1_t_uxn_c_l161_l168_DUPLICATE_5117 LATENCY=0
     -- Inputs
     BIN_OP_AND_uint1_t_uint1_t_uxn_c_l161_l168_DUPLICATE_5117_left <= VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l161_l168_DUPLICATE_5117_left;
     BIN_OP_AND_uint1_t_uint1_t_uxn_c_l161_l168_DUPLICATE_5117_right <= VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l161_l168_DUPLICATE_5117_right;
     -- Outputs
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l161_l168_DUPLICATE_5117_return_output := BIN_OP_AND_uint1_t_uint1_t_uxn_c_l161_l168_DUPLICATE_5117_return_output;

     -- BIN_OP_MINUS[uxn_c_l171_c43_1f82] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l171_c43_1f82_left <= VAR_BIN_OP_MINUS_uxn_c_l171_c43_1f82_left;
     BIN_OP_MINUS_uxn_c_l171_c43_1f82_right <= VAR_BIN_OP_MINUS_uxn_c_l171_c43_1f82_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l171_c43_1f82_return_output := BIN_OP_MINUS_uxn_c_l171_c43_1f82_return_output;

     -- Submodule level 7
     VAR_BIN_OP_OR_uxn_c_l161_c3_2de8_left := VAR_BIN_OP_AND_uxn_c_l154_c27_240f_return_output;
     VAR_MUX_uxn_c_l160_c3_17a8_cond := VAR_BIN_OP_AND_uxn_c_l154_c27_240f_return_output;
     VAR_BIN_OP_AND_uxn_c_l161_c22_2200_left := VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l161_l168_DUPLICATE_5117_return_output;
     VAR_BIN_OP_AND_uxn_c_l168_c22_5fc0_left := VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l161_l168_DUPLICATE_5117_return_output;
     VAR_MUX_uxn_c_l171_c26_4fce_iftrue := VAR_BIN_OP_MINUS_uxn_c_l171_c43_1f82_return_output;
     VAR_MUX_uxn_c_l148_c35_ea55_iftrue := resize(VAR_BIN_OP_PLUS_uxn_c_l148_c54_e310_return_output, 16);
     VAR_MUX_uxn_c_l151_c6_850d_cond := VAR_MUX_uxn_c_l150_c29_d5fc_return_output;
     VAR_MUX_uxn_c_l152_c6_8886_cond := VAR_MUX_uxn_c_l150_c29_d5fc_return_output;
     VAR_fg_vram_update_uxn_c_l164_c27_0d64_write_value := VAR_MUX_uxn_c_l167_c3_e75d_return_output;
     -- BIN_OP_AND[uxn_c_l168_c22_5fc0] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l168_c22_5fc0_left <= VAR_BIN_OP_AND_uxn_c_l168_c22_5fc0_left;
     BIN_OP_AND_uxn_c_l168_c22_5fc0_right <= VAR_BIN_OP_AND_uxn_c_l168_c22_5fc0_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l168_c22_5fc0_return_output := BIN_OP_AND_uxn_c_l168_c22_5fc0_return_output;

     -- MUX[uxn_c_l151_c6_850d] LATENCY=0
     -- Inputs
     MUX_uxn_c_l151_c6_850d_cond <= VAR_MUX_uxn_c_l151_c6_850d_cond;
     MUX_uxn_c_l151_c6_850d_iftrue <= VAR_MUX_uxn_c_l151_c6_850d_iftrue;
     MUX_uxn_c_l151_c6_850d_iffalse <= VAR_MUX_uxn_c_l151_c6_850d_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l151_c6_850d_return_output := MUX_uxn_c_l151_c6_850d_return_output;

     -- MUX[uxn_c_l160_c3_17a8] LATENCY=0
     -- Inputs
     MUX_uxn_c_l160_c3_17a8_cond <= VAR_MUX_uxn_c_l160_c3_17a8_cond;
     MUX_uxn_c_l160_c3_17a8_iftrue <= VAR_MUX_uxn_c_l160_c3_17a8_iftrue;
     MUX_uxn_c_l160_c3_17a8_iffalse <= VAR_MUX_uxn_c_l160_c3_17a8_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l160_c3_17a8_return_output := MUX_uxn_c_l160_c3_17a8_return_output;

     -- MUX[uxn_c_l171_c26_4fce] LATENCY=0
     -- Inputs
     MUX_uxn_c_l171_c26_4fce_cond <= VAR_MUX_uxn_c_l171_c26_4fce_cond;
     MUX_uxn_c_l171_c26_4fce_iftrue <= VAR_MUX_uxn_c_l171_c26_4fce_iftrue;
     MUX_uxn_c_l171_c26_4fce_iffalse <= VAR_MUX_uxn_c_l171_c26_4fce_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l171_c26_4fce_return_output := MUX_uxn_c_l171_c26_4fce_return_output;

     -- BIN_OP_AND[uxn_c_l161_c22_2200] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l161_c22_2200_left <= VAR_BIN_OP_AND_uxn_c_l161_c22_2200_left;
     BIN_OP_AND_uxn_c_l161_c22_2200_right <= VAR_BIN_OP_AND_uxn_c_l161_c22_2200_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l161_c22_2200_return_output := BIN_OP_AND_uxn_c_l161_c22_2200_return_output;

     -- MUX[uxn_c_l148_c35_ea55] LATENCY=0
     -- Inputs
     MUX_uxn_c_l148_c35_ea55_cond <= VAR_MUX_uxn_c_l148_c35_ea55_cond;
     MUX_uxn_c_l148_c35_ea55_iftrue <= VAR_MUX_uxn_c_l148_c35_ea55_iftrue;
     MUX_uxn_c_l148_c35_ea55_iffalse <= VAR_MUX_uxn_c_l148_c35_ea55_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l148_c35_ea55_return_output := MUX_uxn_c_l148_c35_ea55_return_output;

     -- MUX[uxn_c_l152_c6_8886] LATENCY=0
     -- Inputs
     MUX_uxn_c_l152_c6_8886_cond <= VAR_MUX_uxn_c_l152_c6_8886_cond;
     MUX_uxn_c_l152_c6_8886_iftrue <= VAR_MUX_uxn_c_l152_c6_8886_iftrue;
     MUX_uxn_c_l152_c6_8886_iffalse <= VAR_MUX_uxn_c_l152_c6_8886_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l152_c6_8886_return_output := MUX_uxn_c_l152_c6_8886_return_output;

     -- Submodule level 8
     VAR_BIN_OP_OR_uxn_c_l161_c3_2de8_right := VAR_BIN_OP_AND_uxn_c_l161_c22_2200_return_output;
     VAR_BIN_OP_OR_uxn_c_l168_c3_544c_right := VAR_BIN_OP_AND_uxn_c_l168_c22_5fc0_return_output;
     VAR_bg_vram_update_uxn_c_l157_c27_cb58_write_address := VAR_MUX_uxn_c_l148_c35_ea55_return_output;
     VAR_fg_vram_update_uxn_c_l164_c27_0d64_write_address := VAR_MUX_uxn_c_l148_c35_ea55_return_output;
     REG_VAR_y := VAR_MUX_uxn_c_l151_c6_850d_return_output;
     REG_VAR_x := VAR_MUX_uxn_c_l152_c6_8886_return_output;
     VAR_bg_vram_update_uxn_c_l157_c27_cb58_write_value := VAR_MUX_uxn_c_l160_c3_17a8_return_output;
     VAR_BIN_OP_EQ_uxn_c_l172_c19_e669_left := VAR_MUX_uxn_c_l171_c26_4fce_return_output;
     REG_VAR_fill_pixels_remaining := VAR_MUX_uxn_c_l171_c26_4fce_return_output;
     -- BIN_OP_OR[uxn_c_l161_c3_2de8] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l161_c3_2de8_left <= VAR_BIN_OP_OR_uxn_c_l161_c3_2de8_left;
     BIN_OP_OR_uxn_c_l161_c3_2de8_right <= VAR_BIN_OP_OR_uxn_c_l161_c3_2de8_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l161_c3_2de8_return_output := BIN_OP_OR_uxn_c_l161_c3_2de8_return_output;

     -- BIN_OP_EQ[uxn_c_l172_c19_e669] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l172_c19_e669_left <= VAR_BIN_OP_EQ_uxn_c_l172_c19_e669_left;
     BIN_OP_EQ_uxn_c_l172_c19_e669_right <= VAR_BIN_OP_EQ_uxn_c_l172_c19_e669_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l172_c19_e669_return_output := BIN_OP_EQ_uxn_c_l172_c19_e669_return_output;

     -- BIN_OP_OR[uxn_c_l168_c3_544c] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l168_c3_544c_left <= VAR_BIN_OP_OR_uxn_c_l168_c3_544c_left;
     BIN_OP_OR_uxn_c_l168_c3_544c_right <= VAR_BIN_OP_OR_uxn_c_l168_c3_544c_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l168_c3_544c_return_output := BIN_OP_OR_uxn_c_l168_c3_544c_return_output;

     -- Submodule level 9
     VAR_MUX_uxn_c_l172_c19_7602_cond := VAR_BIN_OP_EQ_uxn_c_l172_c19_e669_return_output;
     VAR_bg_vram_update_uxn_c_l157_c27_cb58_write_enable := VAR_BIN_OP_OR_uxn_c_l161_c3_2de8_return_output;
     VAR_fg_vram_update_uxn_c_l164_c27_0d64_write_enable := VAR_BIN_OP_OR_uxn_c_l168_c3_544c_return_output;
     -- fg_vram_update[uxn_c_l164_c27_0d64] LATENCY=0
     -- Clock enable
     fg_vram_update_uxn_c_l164_c27_0d64_CLOCK_ENABLE <= VAR_fg_vram_update_uxn_c_l164_c27_0d64_CLOCK_ENABLE;
     -- Inputs
     fg_vram_update_uxn_c_l164_c27_0d64_read_address <= VAR_fg_vram_update_uxn_c_l164_c27_0d64_read_address;
     fg_vram_update_uxn_c_l164_c27_0d64_write_address <= VAR_fg_vram_update_uxn_c_l164_c27_0d64_write_address;
     fg_vram_update_uxn_c_l164_c27_0d64_write_value <= VAR_fg_vram_update_uxn_c_l164_c27_0d64_write_value;
     fg_vram_update_uxn_c_l164_c27_0d64_write_enable <= VAR_fg_vram_update_uxn_c_l164_c27_0d64_write_enable;
     -- Outputs
     VAR_fg_vram_update_uxn_c_l164_c27_0d64_return_output := fg_vram_update_uxn_c_l164_c27_0d64_return_output;

     -- MUX[uxn_c_l172_c19_7602] LATENCY=0
     -- Inputs
     MUX_uxn_c_l172_c19_7602_cond <= VAR_MUX_uxn_c_l172_c19_7602_cond;
     MUX_uxn_c_l172_c19_7602_iftrue <= VAR_MUX_uxn_c_l172_c19_7602_iftrue;
     MUX_uxn_c_l172_c19_7602_iffalse <= VAR_MUX_uxn_c_l172_c19_7602_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l172_c19_7602_return_output := MUX_uxn_c_l172_c19_7602_return_output;

     -- bg_vram_update[uxn_c_l157_c27_cb58] LATENCY=0
     -- Clock enable
     bg_vram_update_uxn_c_l157_c27_cb58_CLOCK_ENABLE <= VAR_bg_vram_update_uxn_c_l157_c27_cb58_CLOCK_ENABLE;
     -- Inputs
     bg_vram_update_uxn_c_l157_c27_cb58_read_address <= VAR_bg_vram_update_uxn_c_l157_c27_cb58_read_address;
     bg_vram_update_uxn_c_l157_c27_cb58_write_address <= VAR_bg_vram_update_uxn_c_l157_c27_cb58_write_address;
     bg_vram_update_uxn_c_l157_c27_cb58_write_value <= VAR_bg_vram_update_uxn_c_l157_c27_cb58_write_value;
     bg_vram_update_uxn_c_l157_c27_cb58_write_enable <= VAR_bg_vram_update_uxn_c_l157_c27_cb58_write_enable;
     -- Outputs
     VAR_bg_vram_update_uxn_c_l157_c27_cb58_return_output := bg_vram_update_uxn_c_l157_c27_cb58_return_output;

     -- Submodule level 10
     REG_VAR_is_fill_active := VAR_MUX_uxn_c_l172_c19_7602_return_output;
     VAR_MUX_uxn_c_l175_c17_22a0_iftrue := VAR_bg_vram_update_uxn_c_l157_c27_cb58_return_output;
     VAR_BIN_OP_EQ_uxn_c_l175_c17_3feb_left := VAR_fg_vram_update_uxn_c_l164_c27_0d64_return_output;
     VAR_MUX_uxn_c_l175_c17_22a0_iffalse := VAR_fg_vram_update_uxn_c_l164_c27_0d64_return_output;
     -- BIN_OP_EQ[uxn_c_l175_c17_3feb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l175_c17_3feb_left <= VAR_BIN_OP_EQ_uxn_c_l175_c17_3feb_left;
     BIN_OP_EQ_uxn_c_l175_c17_3feb_right <= VAR_BIN_OP_EQ_uxn_c_l175_c17_3feb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l175_c17_3feb_return_output := BIN_OP_EQ_uxn_c_l175_c17_3feb_return_output;

     -- Submodule level 11
     VAR_MUX_uxn_c_l175_c17_22a0_cond := VAR_BIN_OP_EQ_uxn_c_l175_c17_3feb_return_output;
     -- MUX[uxn_c_l175_c17_22a0] LATENCY=0
     -- Inputs
     MUX_uxn_c_l175_c17_22a0_cond <= VAR_MUX_uxn_c_l175_c17_22a0_cond;
     MUX_uxn_c_l175_c17_22a0_iftrue <= VAR_MUX_uxn_c_l175_c17_22a0_iftrue;
     MUX_uxn_c_l175_c17_22a0_iffalse <= VAR_MUX_uxn_c_l175_c17_22a0_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l175_c17_22a0_return_output := MUX_uxn_c_l175_c17_22a0_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_269d_uxn_c_l115_l178_DUPLICATE_d8f0 LATENCY=0
     VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_269d_uxn_c_l115_l178_DUPLICATE_d8f0_return_output := CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_269d(
     VAR_MUX_uxn_c_l174_c25_17dd_return_output,
     VAR_MUX_uxn_c_l175_c17_22a0_return_output,
     VAR_MUX_uxn_c_l172_c19_7602_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_269d_uxn_c_l115_l178_DUPLICATE_d8f0_return_output;
     VAR_return_output := VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_269d_uxn_c_l115_l178_DUPLICATE_d8f0_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_result <= REG_VAR_result;
REG_COMB_fill_pixels_remaining <= REG_VAR_fill_pixels_remaining;
REG_COMB_fill_x0 <= REG_VAR_fill_x0;
REG_COMB_fill_y0 <= REG_VAR_fill_y0;
REG_COMB_fill_x1 <= REG_VAR_fill_x1;
REG_COMB_fill_y1 <= REG_VAR_fill_y1;
REG_COMB_fill_color <= REG_VAR_fill_color;
REG_COMB_is_fill_active <= REG_VAR_is_fill_active;
REG_COMB_fill_layer <= REG_VAR_fill_layer;
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
     fill_pixels_remaining <= REG_COMB_fill_pixels_remaining;
     fill_x0 <= REG_COMB_fill_x0;
     fill_y0 <= REG_COMB_fill_y0;
     fill_x1 <= REG_COMB_fill_x1;
     fill_y1 <= REG_COMB_fill_y1;
     fill_color <= REG_COMB_fill_color;
     is_fill_active <= REG_COMB_is_fill_active;
     fill_layer <= REG_COMB_fill_layer;
     pixel_counter <= REG_COMB_pixel_counter;
     x <= REG_COMB_x;
     y <= REG_COMB_y;
 end if;
 end if;
end process;

end arch;
