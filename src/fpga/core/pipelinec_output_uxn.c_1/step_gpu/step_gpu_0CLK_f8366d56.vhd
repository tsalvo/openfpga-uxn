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
entity step_gpu_0CLK_f8366d56 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 is_active_drawing_area : in unsigned(0 downto 0);
 is_vram_write : in unsigned(0 downto 0);
 vram_write_layer : in unsigned(0 downto 0);
 vram_address : in unsigned(23 downto 0);
 vram_value : in unsigned(1 downto 0);
 return_output : out gpu_step_result_t);
end step_gpu_0CLK_f8366d56;
architecture arch of step_gpu_0CLK_f8366d56 is
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
-- CONST_SR_20[uxn_c_l132_c24_d4a5]
signal CONST_SR_20_uxn_c_l132_c24_d4a5_x : unsigned(23 downto 0);
signal CONST_SR_20_uxn_c_l132_c24_d4a5_return_output : unsigned(23 downto 0);

-- BIN_OP_EQ[uxn_c_l133_c17_8e45]
signal BIN_OP_EQ_uxn_c_l133_c17_8e45_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l133_c17_8e45_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l133_c17_8e45_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l133_c17_8508]
signal MUX_uxn_c_l133_c17_8508_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l133_c17_8508_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l133_c17_8508_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l133_c17_8508_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_c_l136_c22_4cd0]
signal UNARY_OP_NOT_uxn_c_l136_c22_4cd0_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l136_c22_4cd0_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l136_c6_5d8e]
signal BIN_OP_AND_uxn_c_l136_c6_5d8e_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l136_c6_5d8e_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l136_c6_5d8e_return_output : unsigned(0 downto 0);

-- fill_y0_MUX[uxn_c_l136_c2_3b4f]
signal fill_y0_MUX_uxn_c_l136_c2_3b4f_cond : unsigned(0 downto 0);
signal fill_y0_MUX_uxn_c_l136_c2_3b4f_iftrue : unsigned(15 downto 0);
signal fill_y0_MUX_uxn_c_l136_c2_3b4f_iffalse : unsigned(15 downto 0);
signal fill_y0_MUX_uxn_c_l136_c2_3b4f_return_output : unsigned(15 downto 0);

-- fill_color_MUX[uxn_c_l136_c2_3b4f]
signal fill_color_MUX_uxn_c_l136_c2_3b4f_cond : unsigned(0 downto 0);
signal fill_color_MUX_uxn_c_l136_c2_3b4f_iftrue : unsigned(1 downto 0);
signal fill_color_MUX_uxn_c_l136_c2_3b4f_iffalse : unsigned(1 downto 0);
signal fill_color_MUX_uxn_c_l136_c2_3b4f_return_output : unsigned(1 downto 0);

-- fill_pixels_remaining_MUX[uxn_c_l136_c2_3b4f]
signal fill_pixels_remaining_MUX_uxn_c_l136_c2_3b4f_cond : unsigned(0 downto 0);
signal fill_pixels_remaining_MUX_uxn_c_l136_c2_3b4f_iftrue : unsigned(23 downto 0);
signal fill_pixels_remaining_MUX_uxn_c_l136_c2_3b4f_iffalse : unsigned(23 downto 0);
signal fill_pixels_remaining_MUX_uxn_c_l136_c2_3b4f_return_output : unsigned(23 downto 0);

-- fill_y1_MUX[uxn_c_l136_c2_3b4f]
signal fill_y1_MUX_uxn_c_l136_c2_3b4f_cond : unsigned(0 downto 0);
signal fill_y1_MUX_uxn_c_l136_c2_3b4f_iftrue : unsigned(15 downto 0);
signal fill_y1_MUX_uxn_c_l136_c2_3b4f_iffalse : unsigned(15 downto 0);
signal fill_y1_MUX_uxn_c_l136_c2_3b4f_return_output : unsigned(15 downto 0);

-- fill_x0_MUX[uxn_c_l136_c2_3b4f]
signal fill_x0_MUX_uxn_c_l136_c2_3b4f_cond : unsigned(0 downto 0);
signal fill_x0_MUX_uxn_c_l136_c2_3b4f_iftrue : unsigned(15 downto 0);
signal fill_x0_MUX_uxn_c_l136_c2_3b4f_iffalse : unsigned(15 downto 0);
signal fill_x0_MUX_uxn_c_l136_c2_3b4f_return_output : unsigned(15 downto 0);

-- is_fill_top_MUX[uxn_c_l136_c2_3b4f]
signal is_fill_top_MUX_uxn_c_l136_c2_3b4f_cond : unsigned(0 downto 0);
signal is_fill_top_MUX_uxn_c_l136_c2_3b4f_iftrue : unsigned(0 downto 0);
signal is_fill_top_MUX_uxn_c_l136_c2_3b4f_iffalse : unsigned(0 downto 0);
signal is_fill_top_MUX_uxn_c_l136_c2_3b4f_return_output : unsigned(0 downto 0);

-- is_fill_active_MUX[uxn_c_l136_c2_3b4f]
signal is_fill_active_MUX_uxn_c_l136_c2_3b4f_cond : unsigned(0 downto 0);
signal is_fill_active_MUX_uxn_c_l136_c2_3b4f_iftrue : unsigned(0 downto 0);
signal is_fill_active_MUX_uxn_c_l136_c2_3b4f_iffalse : unsigned(0 downto 0);
signal is_fill_active_MUX_uxn_c_l136_c2_3b4f_return_output : unsigned(0 downto 0);

-- fill_layer_MUX[uxn_c_l136_c2_3b4f]
signal fill_layer_MUX_uxn_c_l136_c2_3b4f_cond : unsigned(0 downto 0);
signal fill_layer_MUX_uxn_c_l136_c2_3b4f_iftrue : unsigned(0 downto 0);
signal fill_layer_MUX_uxn_c_l136_c2_3b4f_iffalse : unsigned(0 downto 0);
signal fill_layer_MUX_uxn_c_l136_c2_3b4f_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_c_l136_c2_3b4f]
signal y_MUX_uxn_c_l136_c2_3b4f_cond : unsigned(0 downto 0);
signal y_MUX_uxn_c_l136_c2_3b4f_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_c_l136_c2_3b4f_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_c_l136_c2_3b4f_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_c_l136_c2_3b4f]
signal x_MUX_uxn_c_l136_c2_3b4f_cond : unsigned(0 downto 0);
signal x_MUX_uxn_c_l136_c2_3b4f_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_c_l136_c2_3b4f_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_c_l136_c2_3b4f_return_output : unsigned(15 downto 0);

-- fill_x1_MUX[uxn_c_l136_c2_3b4f]
signal fill_x1_MUX_uxn_c_l136_c2_3b4f_cond : unsigned(0 downto 0);
signal fill_x1_MUX_uxn_c_l136_c2_3b4f_iftrue : unsigned(15 downto 0);
signal fill_x1_MUX_uxn_c_l136_c2_3b4f_iffalse : unsigned(15 downto 0);
signal fill_x1_MUX_uxn_c_l136_c2_3b4f_return_output : unsigned(15 downto 0);

-- CONST_SR_19[uxn_c_l138_c17_cd60]
signal CONST_SR_19_uxn_c_l138_c17_cd60_x : unsigned(23 downto 0);
signal CONST_SR_19_uxn_c_l138_c17_cd60_return_output : unsigned(23 downto 0);

-- CONST_SR_18[uxn_c_l139_c18_0d65]
signal CONST_SR_18_uxn_c_l139_c18_0d65_x : unsigned(23 downto 0);
signal CONST_SR_18_uxn_c_l139_c18_0d65_return_output : unsigned(23 downto 0);

-- BIN_OP_AND[uxn_c_l140_c27_e4e9]
signal BIN_OP_AND_uxn_c_l140_c27_e4e9_left : unsigned(23 downto 0);
signal BIN_OP_AND_uxn_c_l140_c27_e4e9_right : unsigned(23 downto 0);
signal BIN_OP_AND_uxn_c_l140_c27_e4e9_return_output : unsigned(23 downto 0);

-- BIN_OP_DIV[uxn_c_l141_c13_fb94]
signal BIN_OP_DIV_uxn_c_l141_c13_fb94_left : unsigned(23 downto 0);
signal BIN_OP_DIV_uxn_c_l141_c13_fb94_right : unsigned(8 downto 0);
signal BIN_OP_DIV_uxn_c_l141_c13_fb94_return_output : unsigned(23 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_c_l142_c38_63d1]
signal BIN_OP_INFERRED_MULT_uxn_c_l142_c38_63d1_left : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_c_l142_c38_63d1_right : unsigned(8 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_c_l142_c38_63d1_return_output : unsigned(24 downto 0);

-- BIN_OP_MINUS[uxn_c_l142_c13_8c9b]
signal BIN_OP_MINUS_uxn_c_l142_c13_8c9b_left : unsigned(23 downto 0);
signal BIN_OP_MINUS_uxn_c_l142_c13_8c9b_right : unsigned(24 downto 0);
signal BIN_OP_MINUS_uxn_c_l142_c13_8c9b_return_output : unsigned(23 downto 0);

-- MUX[uxn_c_l143_c13_b554]
signal MUX_uxn_c_l143_c13_b554_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l143_c13_b554_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l143_c13_b554_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l143_c13_b554_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l144_c13_12c1]
signal MUX_uxn_c_l144_c13_12c1_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l144_c13_12c1_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l144_c13_12c1_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l144_c13_12c1_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l145_c13_778d]
signal MUX_uxn_c_l145_c13_778d_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l145_c13_778d_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l145_c13_778d_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l145_c13_778d_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l146_c13_45b2]
signal MUX_uxn_c_l146_c13_45b2_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l146_c13_45b2_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l146_c13_45b2_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l146_c13_45b2_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_c_l149_c28_4085]
signal BIN_OP_MINUS_uxn_c_l149_c28_4085_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_c_l149_c28_4085_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_c_l149_c28_4085_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_c_l149_c28_abae]
signal BIN_OP_PLUS_uxn_c_l149_c28_abae_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l149_c28_abae_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l149_c28_abae_return_output : unsigned(16 downto 0);

-- BIN_OP_MINUS[uxn_c_l149_c54_13cf]
signal BIN_OP_MINUS_uxn_c_l149_c54_13cf_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_c_l149_c54_13cf_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_c_l149_c54_13cf_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_c_l149_c54_5a60]
signal BIN_OP_PLUS_uxn_c_l149_c54_5a60_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l149_c54_5a60_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l149_c54_5a60_return_output : unsigned(16 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_c_l149_c28_0b13]
signal BIN_OP_INFERRED_MULT_uxn_c_l149_c28_0b13_left : unsigned(16 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_c_l149_c28_0b13_right : unsigned(16 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_c_l149_c28_0b13_return_output : unsigned(33 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_c_l157_c45_5d73]
signal BIN_OP_INFERRED_MULT_uxn_c_l157_c45_5d73_left : unsigned(23 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_c_l157_c45_5d73_right : unsigned(23 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_c_l157_c45_5d73_return_output : unsigned(47 downto 0);

-- BIN_OP_PLUS[uxn_c_l157_c45_9792]
signal BIN_OP_PLUS_uxn_c_l157_c45_9792_left : unsigned(47 downto 0);
signal BIN_OP_PLUS_uxn_c_l157_c45_9792_right : unsigned(23 downto 0);
signal BIN_OP_PLUS_uxn_c_l157_c45_9792_return_output : unsigned(48 downto 0);

-- BIN_OP_AND[uxn_c_l157_c100_a3c1]
signal BIN_OP_AND_uxn_c_l157_c100_a3c1_left : unsigned(23 downto 0);
signal BIN_OP_AND_uxn_c_l157_c100_a3c1_right : unsigned(23 downto 0);
signal BIN_OP_AND_uxn_c_l157_c100_a3c1_return_output : unsigned(23 downto 0);

-- MUX[uxn_c_l157_c26_3bb0]
signal MUX_uxn_c_l157_c26_3bb0_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l157_c26_3bb0_iftrue : unsigned(23 downto 0);
signal MUX_uxn_c_l157_c26_3bb0_iffalse : unsigned(23 downto 0);
signal MUX_uxn_c_l157_c26_3bb0_return_output : unsigned(23 downto 0);

-- BIN_OP_EQ[uxn_c_l159_c18_6f3e]
signal BIN_OP_EQ_uxn_c_l159_c18_6f3e_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l159_c18_6f3e_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l159_c18_6f3e_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l159_c18_3508]
signal MUX_uxn_c_l159_c18_3508_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l159_c18_3508_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l159_c18_3508_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l159_c18_3508_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l160_c22_8c12]
signal BIN_OP_PLUS_uxn_c_l160_c22_8c12_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l160_c22_8c12_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l160_c22_8c12_return_output : unsigned(16 downto 0);

-- MUX[uxn_c_l160_c6_f848]
signal MUX_uxn_c_l160_c6_f848_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l160_c6_f848_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l160_c6_f848_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l160_c6_f848_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_c_l161_c31_af50]
signal BIN_OP_PLUS_uxn_c_l161_c31_af50_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l161_c31_af50_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l161_c31_af50_return_output : unsigned(16 downto 0);

-- MUX[uxn_c_l161_c6_e20b]
signal MUX_uxn_c_l161_c6_e20b_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l161_c6_e20b_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l161_c6_e20b_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l161_c6_e20b_return_output : unsigned(15 downto 0);

-- UNARY_OP_NOT[uxn_c_l163_c38_9f1c]
signal UNARY_OP_NOT_uxn_c_l163_c38_9f1c_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l163_c38_9f1c_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l163_c19_50e3]
signal BIN_OP_AND_uxn_c_l163_c19_50e3_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l163_c19_50e3_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l163_c19_50e3_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l164_c19_78ef]
signal BIN_OP_AND_uxn_c_l164_c19_78ef_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l164_c19_78ef_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l164_c19_78ef_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l169_c3_000b]
signal MUX_uxn_c_l169_c3_000b_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l169_c3_000b_iftrue : unsigned(1 downto 0);
signal MUX_uxn_c_l169_c3_000b_iffalse : unsigned(1 downto 0);
signal MUX_uxn_c_l169_c3_000b_return_output : unsigned(1 downto 0);

-- UNARY_OP_NOT[uxn_c_l170_c57_9fbb]
signal UNARY_OP_NOT_uxn_c_l170_c57_9fbb_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l170_c57_9fbb_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l170_c22_4ccb]
signal BIN_OP_AND_uxn_c_l170_c22_4ccb_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l170_c22_4ccb_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l170_c22_4ccb_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_c_l170_c3_5559]
signal BIN_OP_OR_uxn_c_l170_c3_5559_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l170_c3_5559_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l170_c3_5559_return_output : unsigned(0 downto 0);

-- bg_vram_update[uxn_c_l166_c19_4254]
signal bg_vram_update_uxn_c_l166_c19_4254_CLOCK_ENABLE : unsigned(0 downto 0);
signal bg_vram_update_uxn_c_l166_c19_4254_read_address : unsigned(23 downto 0);
signal bg_vram_update_uxn_c_l166_c19_4254_write_address : unsigned(23 downto 0);
signal bg_vram_update_uxn_c_l166_c19_4254_write_value : unsigned(1 downto 0);
signal bg_vram_update_uxn_c_l166_c19_4254_write_enable : unsigned(0 downto 0);
signal bg_vram_update_uxn_c_l166_c19_4254_return_output : unsigned(1 downto 0);

-- MUX[uxn_c_l176_c3_68a1]
signal MUX_uxn_c_l176_c3_68a1_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l176_c3_68a1_iftrue : unsigned(1 downto 0);
signal MUX_uxn_c_l176_c3_68a1_iffalse : unsigned(1 downto 0);
signal MUX_uxn_c_l176_c3_68a1_return_output : unsigned(1 downto 0);

-- BIN_OP_AND[uxn_c_l177_c22_73bf]
signal BIN_OP_AND_uxn_c_l177_c22_73bf_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l177_c22_73bf_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l177_c22_73bf_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_c_l177_c3_f0fc]
signal BIN_OP_OR_uxn_c_l177_c3_f0fc_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l177_c3_f0fc_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l177_c3_f0fc_return_output : unsigned(0 downto 0);

-- fg_vram_update[uxn_c_l173_c19_2348]
signal fg_vram_update_uxn_c_l173_c19_2348_CLOCK_ENABLE : unsigned(0 downto 0);
signal fg_vram_update_uxn_c_l173_c19_2348_read_address : unsigned(23 downto 0);
signal fg_vram_update_uxn_c_l173_c19_2348_write_address : unsigned(23 downto 0);
signal fg_vram_update_uxn_c_l173_c19_2348_write_value : unsigned(1 downto 0);
signal fg_vram_update_uxn_c_l173_c19_2348_write_enable : unsigned(0 downto 0);
signal fg_vram_update_uxn_c_l173_c19_2348_return_output : unsigned(1 downto 0);

-- BIN_OP_MINUS[uxn_c_l180_c43_3b74]
signal BIN_OP_MINUS_uxn_c_l180_c43_3b74_left : unsigned(23 downto 0);
signal BIN_OP_MINUS_uxn_c_l180_c43_3b74_right : unsigned(0 downto 0);
signal BIN_OP_MINUS_uxn_c_l180_c43_3b74_return_output : unsigned(23 downto 0);

-- MUX[uxn_c_l180_c26_8094]
signal MUX_uxn_c_l180_c26_8094_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l180_c26_8094_iftrue : unsigned(23 downto 0);
signal MUX_uxn_c_l180_c26_8094_iffalse : unsigned(23 downto 0);
signal MUX_uxn_c_l180_c26_8094_return_output : unsigned(23 downto 0);

-- BIN_OP_EQ[uxn_c_l181_c19_eb1d]
signal BIN_OP_EQ_uxn_c_l181_c19_eb1d_left : unsigned(23 downto 0);
signal BIN_OP_EQ_uxn_c_l181_c19_eb1d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l181_c19_eb1d_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l181_c19_78b6]
signal MUX_uxn_c_l181_c19_78b6_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l181_c19_78b6_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l181_c19_78b6_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l181_c19_78b6_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l182_c19_49c8]
signal BIN_OP_EQ_uxn_c_l182_c19_49c8_left : unsigned(17 downto 0);
signal BIN_OP_EQ_uxn_c_l182_c19_49c8_right : unsigned(16 downto 0);
signal BIN_OP_EQ_uxn_c_l182_c19_49c8_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l182_c76_14df]
signal BIN_OP_PLUS_uxn_c_l182_c76_14df_left : unsigned(17 downto 0);
signal BIN_OP_PLUS_uxn_c_l182_c76_14df_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l182_c76_14df_return_output : unsigned(18 downto 0);

-- MUX[uxn_c_l182_c50_8472]
signal MUX_uxn_c_l182_c50_8472_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l182_c50_8472_iftrue : unsigned(17 downto 0);
signal MUX_uxn_c_l182_c50_8472_iffalse : unsigned(17 downto 0);
signal MUX_uxn_c_l182_c50_8472_return_output : unsigned(17 downto 0);

-- MUX[uxn_c_l182_c19_3c16]
signal MUX_uxn_c_l182_c19_3c16_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l182_c19_3c16_iftrue : unsigned(17 downto 0);
signal MUX_uxn_c_l182_c19_3c16_iffalse : unsigned(17 downto 0);
signal MUX_uxn_c_l182_c19_3c16_return_output : unsigned(17 downto 0);

-- BIN_OP_EQ[uxn_c_l183_c25_5f05]
signal BIN_OP_EQ_uxn_c_l183_c25_5f05_left : unsigned(17 downto 0);
signal BIN_OP_EQ_uxn_c_l183_c25_5f05_right : unsigned(16 downto 0);
signal BIN_OP_EQ_uxn_c_l183_c25_5f05_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l183_c25_8de0]
signal MUX_uxn_c_l183_c25_8de0_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l183_c25_8de0_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l183_c25_8de0_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l183_c25_8de0_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l184_c17_6469]
signal BIN_OP_EQ_uxn_c_l184_c17_6469_left : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l184_c17_6469_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l184_c17_6469_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l184_c17_1120]
signal MUX_uxn_c_l184_c17_1120_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l184_c17_1120_iftrue : unsigned(1 downto 0);
signal MUX_uxn_c_l184_c17_1120_iffalse : unsigned(1 downto 0);
signal MUX_uxn_c_l184_c17_1120_return_output : unsigned(1 downto 0);

-- UNARY_OP_NOT_uint1_t_uxn_c_l170_l177_DUPLICATE_24df
signal UNARY_OP_NOT_uint1_t_uxn_c_l170_l177_DUPLICATE_24df_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uint1_t_uxn_c_l170_l177_DUPLICATE_24df_return_output : unsigned(0 downto 0);

-- BIN_OP_AND_uint1_t_uint1_t_uxn_c_l170_l177_DUPLICATE_d702
signal BIN_OP_AND_uint1_t_uint1_t_uxn_c_l170_l177_DUPLICATE_d702_left : unsigned(0 downto 0);
signal BIN_OP_AND_uint1_t_uint1_t_uxn_c_l170_l177_DUPLICATE_d702_right : unsigned(0 downto 0);
signal BIN_OP_AND_uint1_t_uint1_t_uxn_c_l170_l177_DUPLICATE_d702_return_output : unsigned(0 downto 0);

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
-- CONST_SR_20_uxn_c_l132_c24_d4a5
CONST_SR_20_uxn_c_l132_c24_d4a5 : entity work.CONST_SR_20_uint24_t_0CLK_de264c78 port map (
CONST_SR_20_uxn_c_l132_c24_d4a5_x,
CONST_SR_20_uxn_c_l132_c24_d4a5_return_output);

-- BIN_OP_EQ_uxn_c_l133_c17_8e45
BIN_OP_EQ_uxn_c_l133_c17_8e45 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l133_c17_8e45_left,
BIN_OP_EQ_uxn_c_l133_c17_8e45_right,
BIN_OP_EQ_uxn_c_l133_c17_8e45_return_output);

-- MUX_uxn_c_l133_c17_8508
MUX_uxn_c_l133_c17_8508 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l133_c17_8508_cond,
MUX_uxn_c_l133_c17_8508_iftrue,
MUX_uxn_c_l133_c17_8508_iffalse,
MUX_uxn_c_l133_c17_8508_return_output);

-- UNARY_OP_NOT_uxn_c_l136_c22_4cd0
UNARY_OP_NOT_uxn_c_l136_c22_4cd0 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l136_c22_4cd0_expr,
UNARY_OP_NOT_uxn_c_l136_c22_4cd0_return_output);

-- BIN_OP_AND_uxn_c_l136_c6_5d8e
BIN_OP_AND_uxn_c_l136_c6_5d8e : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l136_c6_5d8e_left,
BIN_OP_AND_uxn_c_l136_c6_5d8e_right,
BIN_OP_AND_uxn_c_l136_c6_5d8e_return_output);

-- fill_y0_MUX_uxn_c_l136_c2_3b4f
fill_y0_MUX_uxn_c_l136_c2_3b4f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_y0_MUX_uxn_c_l136_c2_3b4f_cond,
fill_y0_MUX_uxn_c_l136_c2_3b4f_iftrue,
fill_y0_MUX_uxn_c_l136_c2_3b4f_iffalse,
fill_y0_MUX_uxn_c_l136_c2_3b4f_return_output);

-- fill_color_MUX_uxn_c_l136_c2_3b4f
fill_color_MUX_uxn_c_l136_c2_3b4f : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
fill_color_MUX_uxn_c_l136_c2_3b4f_cond,
fill_color_MUX_uxn_c_l136_c2_3b4f_iftrue,
fill_color_MUX_uxn_c_l136_c2_3b4f_iffalse,
fill_color_MUX_uxn_c_l136_c2_3b4f_return_output);

-- fill_pixels_remaining_MUX_uxn_c_l136_c2_3b4f
fill_pixels_remaining_MUX_uxn_c_l136_c2_3b4f : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
fill_pixels_remaining_MUX_uxn_c_l136_c2_3b4f_cond,
fill_pixels_remaining_MUX_uxn_c_l136_c2_3b4f_iftrue,
fill_pixels_remaining_MUX_uxn_c_l136_c2_3b4f_iffalse,
fill_pixels_remaining_MUX_uxn_c_l136_c2_3b4f_return_output);

-- fill_y1_MUX_uxn_c_l136_c2_3b4f
fill_y1_MUX_uxn_c_l136_c2_3b4f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_y1_MUX_uxn_c_l136_c2_3b4f_cond,
fill_y1_MUX_uxn_c_l136_c2_3b4f_iftrue,
fill_y1_MUX_uxn_c_l136_c2_3b4f_iffalse,
fill_y1_MUX_uxn_c_l136_c2_3b4f_return_output);

-- fill_x0_MUX_uxn_c_l136_c2_3b4f
fill_x0_MUX_uxn_c_l136_c2_3b4f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_x0_MUX_uxn_c_l136_c2_3b4f_cond,
fill_x0_MUX_uxn_c_l136_c2_3b4f_iftrue,
fill_x0_MUX_uxn_c_l136_c2_3b4f_iffalse,
fill_x0_MUX_uxn_c_l136_c2_3b4f_return_output);

-- is_fill_top_MUX_uxn_c_l136_c2_3b4f
is_fill_top_MUX_uxn_c_l136_c2_3b4f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_top_MUX_uxn_c_l136_c2_3b4f_cond,
is_fill_top_MUX_uxn_c_l136_c2_3b4f_iftrue,
is_fill_top_MUX_uxn_c_l136_c2_3b4f_iffalse,
is_fill_top_MUX_uxn_c_l136_c2_3b4f_return_output);

-- is_fill_active_MUX_uxn_c_l136_c2_3b4f
is_fill_active_MUX_uxn_c_l136_c2_3b4f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_active_MUX_uxn_c_l136_c2_3b4f_cond,
is_fill_active_MUX_uxn_c_l136_c2_3b4f_iftrue,
is_fill_active_MUX_uxn_c_l136_c2_3b4f_iffalse,
is_fill_active_MUX_uxn_c_l136_c2_3b4f_return_output);

-- fill_layer_MUX_uxn_c_l136_c2_3b4f
fill_layer_MUX_uxn_c_l136_c2_3b4f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
fill_layer_MUX_uxn_c_l136_c2_3b4f_cond,
fill_layer_MUX_uxn_c_l136_c2_3b4f_iftrue,
fill_layer_MUX_uxn_c_l136_c2_3b4f_iffalse,
fill_layer_MUX_uxn_c_l136_c2_3b4f_return_output);

-- y_MUX_uxn_c_l136_c2_3b4f
y_MUX_uxn_c_l136_c2_3b4f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_c_l136_c2_3b4f_cond,
y_MUX_uxn_c_l136_c2_3b4f_iftrue,
y_MUX_uxn_c_l136_c2_3b4f_iffalse,
y_MUX_uxn_c_l136_c2_3b4f_return_output);

-- x_MUX_uxn_c_l136_c2_3b4f
x_MUX_uxn_c_l136_c2_3b4f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_c_l136_c2_3b4f_cond,
x_MUX_uxn_c_l136_c2_3b4f_iftrue,
x_MUX_uxn_c_l136_c2_3b4f_iffalse,
x_MUX_uxn_c_l136_c2_3b4f_return_output);

-- fill_x1_MUX_uxn_c_l136_c2_3b4f
fill_x1_MUX_uxn_c_l136_c2_3b4f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_x1_MUX_uxn_c_l136_c2_3b4f_cond,
fill_x1_MUX_uxn_c_l136_c2_3b4f_iftrue,
fill_x1_MUX_uxn_c_l136_c2_3b4f_iffalse,
fill_x1_MUX_uxn_c_l136_c2_3b4f_return_output);

-- CONST_SR_19_uxn_c_l138_c17_cd60
CONST_SR_19_uxn_c_l138_c17_cd60 : entity work.CONST_SR_19_uint24_t_0CLK_de264c78 port map (
CONST_SR_19_uxn_c_l138_c17_cd60_x,
CONST_SR_19_uxn_c_l138_c17_cd60_return_output);

-- CONST_SR_18_uxn_c_l139_c18_0d65
CONST_SR_18_uxn_c_l139_c18_0d65 : entity work.CONST_SR_18_uint24_t_0CLK_de264c78 port map (
CONST_SR_18_uxn_c_l139_c18_0d65_x,
CONST_SR_18_uxn_c_l139_c18_0d65_return_output);

-- BIN_OP_AND_uxn_c_l140_c27_e4e9
BIN_OP_AND_uxn_c_l140_c27_e4e9 : entity work.BIN_OP_AND_uint24_t_uint24_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l140_c27_e4e9_left,
BIN_OP_AND_uxn_c_l140_c27_e4e9_right,
BIN_OP_AND_uxn_c_l140_c27_e4e9_return_output);

-- BIN_OP_DIV_uxn_c_l141_c13_fb94
BIN_OP_DIV_uxn_c_l141_c13_fb94 : entity work.BIN_OP_DIV_uint24_t_uint9_t_0CLK_1051b6f1 port map (
BIN_OP_DIV_uxn_c_l141_c13_fb94_left,
BIN_OP_DIV_uxn_c_l141_c13_fb94_right,
BIN_OP_DIV_uxn_c_l141_c13_fb94_return_output);

-- BIN_OP_INFERRED_MULT_uxn_c_l142_c38_63d1
BIN_OP_INFERRED_MULT_uxn_c_l142_c38_63d1 : entity work.BIN_OP_INFERRED_MULT_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_c_l142_c38_63d1_left,
BIN_OP_INFERRED_MULT_uxn_c_l142_c38_63d1_right,
BIN_OP_INFERRED_MULT_uxn_c_l142_c38_63d1_return_output);

-- BIN_OP_MINUS_uxn_c_l142_c13_8c9b
BIN_OP_MINUS_uxn_c_l142_c13_8c9b : entity work.BIN_OP_MINUS_uint24_t_uint25_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l142_c13_8c9b_left,
BIN_OP_MINUS_uxn_c_l142_c13_8c9b_right,
BIN_OP_MINUS_uxn_c_l142_c13_8c9b_return_output);

-- MUX_uxn_c_l143_c13_b554
MUX_uxn_c_l143_c13_b554 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l143_c13_b554_cond,
MUX_uxn_c_l143_c13_b554_iftrue,
MUX_uxn_c_l143_c13_b554_iffalse,
MUX_uxn_c_l143_c13_b554_return_output);

-- MUX_uxn_c_l144_c13_12c1
MUX_uxn_c_l144_c13_12c1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l144_c13_12c1_cond,
MUX_uxn_c_l144_c13_12c1_iftrue,
MUX_uxn_c_l144_c13_12c1_iffalse,
MUX_uxn_c_l144_c13_12c1_return_output);

-- MUX_uxn_c_l145_c13_778d
MUX_uxn_c_l145_c13_778d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l145_c13_778d_cond,
MUX_uxn_c_l145_c13_778d_iftrue,
MUX_uxn_c_l145_c13_778d_iffalse,
MUX_uxn_c_l145_c13_778d_return_output);

-- MUX_uxn_c_l146_c13_45b2
MUX_uxn_c_l146_c13_45b2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l146_c13_45b2_cond,
MUX_uxn_c_l146_c13_45b2_iftrue,
MUX_uxn_c_l146_c13_45b2_iffalse,
MUX_uxn_c_l146_c13_45b2_return_output);

-- BIN_OP_MINUS_uxn_c_l149_c28_4085
BIN_OP_MINUS_uxn_c_l149_c28_4085 : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l149_c28_4085_left,
BIN_OP_MINUS_uxn_c_l149_c28_4085_right,
BIN_OP_MINUS_uxn_c_l149_c28_4085_return_output);

-- BIN_OP_PLUS_uxn_c_l149_c28_abae
BIN_OP_PLUS_uxn_c_l149_c28_abae : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l149_c28_abae_left,
BIN_OP_PLUS_uxn_c_l149_c28_abae_right,
BIN_OP_PLUS_uxn_c_l149_c28_abae_return_output);

-- BIN_OP_MINUS_uxn_c_l149_c54_13cf
BIN_OP_MINUS_uxn_c_l149_c54_13cf : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l149_c54_13cf_left,
BIN_OP_MINUS_uxn_c_l149_c54_13cf_right,
BIN_OP_MINUS_uxn_c_l149_c54_13cf_return_output);

-- BIN_OP_PLUS_uxn_c_l149_c54_5a60
BIN_OP_PLUS_uxn_c_l149_c54_5a60 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l149_c54_5a60_left,
BIN_OP_PLUS_uxn_c_l149_c54_5a60_right,
BIN_OP_PLUS_uxn_c_l149_c54_5a60_return_output);

-- BIN_OP_INFERRED_MULT_uxn_c_l149_c28_0b13
BIN_OP_INFERRED_MULT_uxn_c_l149_c28_0b13 : entity work.BIN_OP_INFERRED_MULT_uint17_t_uint17_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_c_l149_c28_0b13_left,
BIN_OP_INFERRED_MULT_uxn_c_l149_c28_0b13_right,
BIN_OP_INFERRED_MULT_uxn_c_l149_c28_0b13_return_output);

-- BIN_OP_INFERRED_MULT_uxn_c_l157_c45_5d73
BIN_OP_INFERRED_MULT_uxn_c_l157_c45_5d73 : entity work.BIN_OP_INFERRED_MULT_uint24_t_uint24_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_c_l157_c45_5d73_left,
BIN_OP_INFERRED_MULT_uxn_c_l157_c45_5d73_right,
BIN_OP_INFERRED_MULT_uxn_c_l157_c45_5d73_return_output);

-- BIN_OP_PLUS_uxn_c_l157_c45_9792
BIN_OP_PLUS_uxn_c_l157_c45_9792 : entity work.BIN_OP_PLUS_uint48_t_uint24_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l157_c45_9792_left,
BIN_OP_PLUS_uxn_c_l157_c45_9792_right,
BIN_OP_PLUS_uxn_c_l157_c45_9792_return_output);

-- BIN_OP_AND_uxn_c_l157_c100_a3c1
BIN_OP_AND_uxn_c_l157_c100_a3c1 : entity work.BIN_OP_AND_uint24_t_uint24_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l157_c100_a3c1_left,
BIN_OP_AND_uxn_c_l157_c100_a3c1_right,
BIN_OP_AND_uxn_c_l157_c100_a3c1_return_output);

-- MUX_uxn_c_l157_c26_3bb0
MUX_uxn_c_l157_c26_3bb0 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
MUX_uxn_c_l157_c26_3bb0_cond,
MUX_uxn_c_l157_c26_3bb0_iftrue,
MUX_uxn_c_l157_c26_3bb0_iffalse,
MUX_uxn_c_l157_c26_3bb0_return_output);

-- BIN_OP_EQ_uxn_c_l159_c18_6f3e
BIN_OP_EQ_uxn_c_l159_c18_6f3e : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l159_c18_6f3e_left,
BIN_OP_EQ_uxn_c_l159_c18_6f3e_right,
BIN_OP_EQ_uxn_c_l159_c18_6f3e_return_output);

-- MUX_uxn_c_l159_c18_3508
MUX_uxn_c_l159_c18_3508 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l159_c18_3508_cond,
MUX_uxn_c_l159_c18_3508_iftrue,
MUX_uxn_c_l159_c18_3508_iffalse,
MUX_uxn_c_l159_c18_3508_return_output);

-- BIN_OP_PLUS_uxn_c_l160_c22_8c12
BIN_OP_PLUS_uxn_c_l160_c22_8c12 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l160_c22_8c12_left,
BIN_OP_PLUS_uxn_c_l160_c22_8c12_right,
BIN_OP_PLUS_uxn_c_l160_c22_8c12_return_output);

-- MUX_uxn_c_l160_c6_f848
MUX_uxn_c_l160_c6_f848 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l160_c6_f848_cond,
MUX_uxn_c_l160_c6_f848_iftrue,
MUX_uxn_c_l160_c6_f848_iffalse,
MUX_uxn_c_l160_c6_f848_return_output);

-- BIN_OP_PLUS_uxn_c_l161_c31_af50
BIN_OP_PLUS_uxn_c_l161_c31_af50 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l161_c31_af50_left,
BIN_OP_PLUS_uxn_c_l161_c31_af50_right,
BIN_OP_PLUS_uxn_c_l161_c31_af50_return_output);

-- MUX_uxn_c_l161_c6_e20b
MUX_uxn_c_l161_c6_e20b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l161_c6_e20b_cond,
MUX_uxn_c_l161_c6_e20b_iftrue,
MUX_uxn_c_l161_c6_e20b_iffalse,
MUX_uxn_c_l161_c6_e20b_return_output);

-- UNARY_OP_NOT_uxn_c_l163_c38_9f1c
UNARY_OP_NOT_uxn_c_l163_c38_9f1c : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l163_c38_9f1c_expr,
UNARY_OP_NOT_uxn_c_l163_c38_9f1c_return_output);

-- BIN_OP_AND_uxn_c_l163_c19_50e3
BIN_OP_AND_uxn_c_l163_c19_50e3 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l163_c19_50e3_left,
BIN_OP_AND_uxn_c_l163_c19_50e3_right,
BIN_OP_AND_uxn_c_l163_c19_50e3_return_output);

-- BIN_OP_AND_uxn_c_l164_c19_78ef
BIN_OP_AND_uxn_c_l164_c19_78ef : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l164_c19_78ef_left,
BIN_OP_AND_uxn_c_l164_c19_78ef_right,
BIN_OP_AND_uxn_c_l164_c19_78ef_return_output);

-- MUX_uxn_c_l169_c3_000b
MUX_uxn_c_l169_c3_000b : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
MUX_uxn_c_l169_c3_000b_cond,
MUX_uxn_c_l169_c3_000b_iftrue,
MUX_uxn_c_l169_c3_000b_iffalse,
MUX_uxn_c_l169_c3_000b_return_output);

-- UNARY_OP_NOT_uxn_c_l170_c57_9fbb
UNARY_OP_NOT_uxn_c_l170_c57_9fbb : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l170_c57_9fbb_expr,
UNARY_OP_NOT_uxn_c_l170_c57_9fbb_return_output);

-- BIN_OP_AND_uxn_c_l170_c22_4ccb
BIN_OP_AND_uxn_c_l170_c22_4ccb : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l170_c22_4ccb_left,
BIN_OP_AND_uxn_c_l170_c22_4ccb_right,
BIN_OP_AND_uxn_c_l170_c22_4ccb_return_output);

-- BIN_OP_OR_uxn_c_l170_c3_5559
BIN_OP_OR_uxn_c_l170_c3_5559 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l170_c3_5559_left,
BIN_OP_OR_uxn_c_l170_c3_5559_right,
BIN_OP_OR_uxn_c_l170_c3_5559_return_output);

-- bg_vram_update_uxn_c_l166_c19_4254
bg_vram_update_uxn_c_l166_c19_4254 : entity work.bg_vram_update_0CLK_6f2c5aad port map (
clk,
bg_vram_update_uxn_c_l166_c19_4254_CLOCK_ENABLE,
bg_vram_update_uxn_c_l166_c19_4254_read_address,
bg_vram_update_uxn_c_l166_c19_4254_write_address,
bg_vram_update_uxn_c_l166_c19_4254_write_value,
bg_vram_update_uxn_c_l166_c19_4254_write_enable,
bg_vram_update_uxn_c_l166_c19_4254_return_output);

-- MUX_uxn_c_l176_c3_68a1
MUX_uxn_c_l176_c3_68a1 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
MUX_uxn_c_l176_c3_68a1_cond,
MUX_uxn_c_l176_c3_68a1_iftrue,
MUX_uxn_c_l176_c3_68a1_iffalse,
MUX_uxn_c_l176_c3_68a1_return_output);

-- BIN_OP_AND_uxn_c_l177_c22_73bf
BIN_OP_AND_uxn_c_l177_c22_73bf : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l177_c22_73bf_left,
BIN_OP_AND_uxn_c_l177_c22_73bf_right,
BIN_OP_AND_uxn_c_l177_c22_73bf_return_output);

-- BIN_OP_OR_uxn_c_l177_c3_f0fc
BIN_OP_OR_uxn_c_l177_c3_f0fc : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l177_c3_f0fc_left,
BIN_OP_OR_uxn_c_l177_c3_f0fc_right,
BIN_OP_OR_uxn_c_l177_c3_f0fc_return_output);

-- fg_vram_update_uxn_c_l173_c19_2348
fg_vram_update_uxn_c_l173_c19_2348 : entity work.fg_vram_update_0CLK_6f2c5aad port map (
clk,
fg_vram_update_uxn_c_l173_c19_2348_CLOCK_ENABLE,
fg_vram_update_uxn_c_l173_c19_2348_read_address,
fg_vram_update_uxn_c_l173_c19_2348_write_address,
fg_vram_update_uxn_c_l173_c19_2348_write_value,
fg_vram_update_uxn_c_l173_c19_2348_write_enable,
fg_vram_update_uxn_c_l173_c19_2348_return_output);

-- BIN_OP_MINUS_uxn_c_l180_c43_3b74
BIN_OP_MINUS_uxn_c_l180_c43_3b74 : entity work.BIN_OP_MINUS_uint24_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l180_c43_3b74_left,
BIN_OP_MINUS_uxn_c_l180_c43_3b74_right,
BIN_OP_MINUS_uxn_c_l180_c43_3b74_return_output);

-- MUX_uxn_c_l180_c26_8094
MUX_uxn_c_l180_c26_8094 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
MUX_uxn_c_l180_c26_8094_cond,
MUX_uxn_c_l180_c26_8094_iftrue,
MUX_uxn_c_l180_c26_8094_iffalse,
MUX_uxn_c_l180_c26_8094_return_output);

-- BIN_OP_EQ_uxn_c_l181_c19_eb1d
BIN_OP_EQ_uxn_c_l181_c19_eb1d : entity work.BIN_OP_EQ_uint24_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l181_c19_eb1d_left,
BIN_OP_EQ_uxn_c_l181_c19_eb1d_right,
BIN_OP_EQ_uxn_c_l181_c19_eb1d_return_output);

-- MUX_uxn_c_l181_c19_78b6
MUX_uxn_c_l181_c19_78b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l181_c19_78b6_cond,
MUX_uxn_c_l181_c19_78b6_iftrue,
MUX_uxn_c_l181_c19_78b6_iffalse,
MUX_uxn_c_l181_c19_78b6_return_output);

-- BIN_OP_EQ_uxn_c_l182_c19_49c8
BIN_OP_EQ_uxn_c_l182_c19_49c8 : entity work.BIN_OP_EQ_uint18_t_uint17_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l182_c19_49c8_left,
BIN_OP_EQ_uxn_c_l182_c19_49c8_right,
BIN_OP_EQ_uxn_c_l182_c19_49c8_return_output);

-- BIN_OP_PLUS_uxn_c_l182_c76_14df
BIN_OP_PLUS_uxn_c_l182_c76_14df : entity work.BIN_OP_PLUS_uint18_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l182_c76_14df_left,
BIN_OP_PLUS_uxn_c_l182_c76_14df_right,
BIN_OP_PLUS_uxn_c_l182_c76_14df_return_output);

-- MUX_uxn_c_l182_c50_8472
MUX_uxn_c_l182_c50_8472 : entity work.MUX_uint1_t_uint18_t_uint18_t_0CLK_de264c78 port map (
MUX_uxn_c_l182_c50_8472_cond,
MUX_uxn_c_l182_c50_8472_iftrue,
MUX_uxn_c_l182_c50_8472_iffalse,
MUX_uxn_c_l182_c50_8472_return_output);

-- MUX_uxn_c_l182_c19_3c16
MUX_uxn_c_l182_c19_3c16 : entity work.MUX_uint1_t_uint18_t_uint18_t_0CLK_de264c78 port map (
MUX_uxn_c_l182_c19_3c16_cond,
MUX_uxn_c_l182_c19_3c16_iftrue,
MUX_uxn_c_l182_c19_3c16_iffalse,
MUX_uxn_c_l182_c19_3c16_return_output);

-- BIN_OP_EQ_uxn_c_l183_c25_5f05
BIN_OP_EQ_uxn_c_l183_c25_5f05 : entity work.BIN_OP_EQ_uint18_t_uint17_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l183_c25_5f05_left,
BIN_OP_EQ_uxn_c_l183_c25_5f05_right,
BIN_OP_EQ_uxn_c_l183_c25_5f05_return_output);

-- MUX_uxn_c_l183_c25_8de0
MUX_uxn_c_l183_c25_8de0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l183_c25_8de0_cond,
MUX_uxn_c_l183_c25_8de0_iftrue,
MUX_uxn_c_l183_c25_8de0_iffalse,
MUX_uxn_c_l183_c25_8de0_return_output);

-- BIN_OP_EQ_uxn_c_l184_c17_6469
BIN_OP_EQ_uxn_c_l184_c17_6469 : entity work.BIN_OP_EQ_uint2_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l184_c17_6469_left,
BIN_OP_EQ_uxn_c_l184_c17_6469_right,
BIN_OP_EQ_uxn_c_l184_c17_6469_return_output);

-- MUX_uxn_c_l184_c17_1120
MUX_uxn_c_l184_c17_1120 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
MUX_uxn_c_l184_c17_1120_cond,
MUX_uxn_c_l184_c17_1120_iftrue,
MUX_uxn_c_l184_c17_1120_iffalse,
MUX_uxn_c_l184_c17_1120_return_output);

-- UNARY_OP_NOT_uint1_t_uxn_c_l170_l177_DUPLICATE_24df
UNARY_OP_NOT_uint1_t_uxn_c_l170_l177_DUPLICATE_24df : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uint1_t_uxn_c_l170_l177_DUPLICATE_24df_expr,
UNARY_OP_NOT_uint1_t_uxn_c_l170_l177_DUPLICATE_24df_return_output);

-- BIN_OP_AND_uint1_t_uint1_t_uxn_c_l170_l177_DUPLICATE_d702
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l170_l177_DUPLICATE_d702 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l170_l177_DUPLICATE_d702_left,
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l170_l177_DUPLICATE_d702_right,
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l170_l177_DUPLICATE_d702_return_output);



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
 CONST_SR_20_uxn_c_l132_c24_d4a5_return_output,
 BIN_OP_EQ_uxn_c_l133_c17_8e45_return_output,
 MUX_uxn_c_l133_c17_8508_return_output,
 UNARY_OP_NOT_uxn_c_l136_c22_4cd0_return_output,
 BIN_OP_AND_uxn_c_l136_c6_5d8e_return_output,
 fill_y0_MUX_uxn_c_l136_c2_3b4f_return_output,
 fill_color_MUX_uxn_c_l136_c2_3b4f_return_output,
 fill_pixels_remaining_MUX_uxn_c_l136_c2_3b4f_return_output,
 fill_y1_MUX_uxn_c_l136_c2_3b4f_return_output,
 fill_x0_MUX_uxn_c_l136_c2_3b4f_return_output,
 is_fill_top_MUX_uxn_c_l136_c2_3b4f_return_output,
 is_fill_active_MUX_uxn_c_l136_c2_3b4f_return_output,
 fill_layer_MUX_uxn_c_l136_c2_3b4f_return_output,
 y_MUX_uxn_c_l136_c2_3b4f_return_output,
 x_MUX_uxn_c_l136_c2_3b4f_return_output,
 fill_x1_MUX_uxn_c_l136_c2_3b4f_return_output,
 CONST_SR_19_uxn_c_l138_c17_cd60_return_output,
 CONST_SR_18_uxn_c_l139_c18_0d65_return_output,
 BIN_OP_AND_uxn_c_l140_c27_e4e9_return_output,
 BIN_OP_DIV_uxn_c_l141_c13_fb94_return_output,
 BIN_OP_INFERRED_MULT_uxn_c_l142_c38_63d1_return_output,
 BIN_OP_MINUS_uxn_c_l142_c13_8c9b_return_output,
 MUX_uxn_c_l143_c13_b554_return_output,
 MUX_uxn_c_l144_c13_12c1_return_output,
 MUX_uxn_c_l145_c13_778d_return_output,
 MUX_uxn_c_l146_c13_45b2_return_output,
 BIN_OP_MINUS_uxn_c_l149_c28_4085_return_output,
 BIN_OP_PLUS_uxn_c_l149_c28_abae_return_output,
 BIN_OP_MINUS_uxn_c_l149_c54_13cf_return_output,
 BIN_OP_PLUS_uxn_c_l149_c54_5a60_return_output,
 BIN_OP_INFERRED_MULT_uxn_c_l149_c28_0b13_return_output,
 BIN_OP_INFERRED_MULT_uxn_c_l157_c45_5d73_return_output,
 BIN_OP_PLUS_uxn_c_l157_c45_9792_return_output,
 BIN_OP_AND_uxn_c_l157_c100_a3c1_return_output,
 MUX_uxn_c_l157_c26_3bb0_return_output,
 BIN_OP_EQ_uxn_c_l159_c18_6f3e_return_output,
 MUX_uxn_c_l159_c18_3508_return_output,
 BIN_OP_PLUS_uxn_c_l160_c22_8c12_return_output,
 MUX_uxn_c_l160_c6_f848_return_output,
 BIN_OP_PLUS_uxn_c_l161_c31_af50_return_output,
 MUX_uxn_c_l161_c6_e20b_return_output,
 UNARY_OP_NOT_uxn_c_l163_c38_9f1c_return_output,
 BIN_OP_AND_uxn_c_l163_c19_50e3_return_output,
 BIN_OP_AND_uxn_c_l164_c19_78ef_return_output,
 MUX_uxn_c_l169_c3_000b_return_output,
 UNARY_OP_NOT_uxn_c_l170_c57_9fbb_return_output,
 BIN_OP_AND_uxn_c_l170_c22_4ccb_return_output,
 BIN_OP_OR_uxn_c_l170_c3_5559_return_output,
 bg_vram_update_uxn_c_l166_c19_4254_return_output,
 MUX_uxn_c_l176_c3_68a1_return_output,
 BIN_OP_AND_uxn_c_l177_c22_73bf_return_output,
 BIN_OP_OR_uxn_c_l177_c3_f0fc_return_output,
 fg_vram_update_uxn_c_l173_c19_2348_return_output,
 BIN_OP_MINUS_uxn_c_l180_c43_3b74_return_output,
 MUX_uxn_c_l180_c26_8094_return_output,
 BIN_OP_EQ_uxn_c_l181_c19_eb1d_return_output,
 MUX_uxn_c_l181_c19_78b6_return_output,
 BIN_OP_EQ_uxn_c_l182_c19_49c8_return_output,
 BIN_OP_PLUS_uxn_c_l182_c76_14df_return_output,
 MUX_uxn_c_l182_c50_8472_return_output,
 MUX_uxn_c_l182_c19_3c16_return_output,
 BIN_OP_EQ_uxn_c_l183_c25_5f05_return_output,
 MUX_uxn_c_l183_c25_8de0_return_output,
 BIN_OP_EQ_uxn_c_l184_c17_6469_return_output,
 MUX_uxn_c_l184_c17_1120_return_output,
 UNARY_OP_NOT_uint1_t_uxn_c_l170_l177_DUPLICATE_24df_return_output,
 BIN_OP_AND_uint1_t_uint1_t_uxn_c_l170_l177_DUPLICATE_d702_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : gpu_step_result_t;
 variable VAR_is_active_drawing_area : unsigned(0 downto 0);
 variable VAR_is_vram_write : unsigned(0 downto 0);
 variable VAR_vram_write_layer : unsigned(0 downto 0);
 variable VAR_vram_address : unsigned(23 downto 0);
 variable VAR_vram_value : unsigned(1 downto 0);
 variable VAR_CONST_SR_20_uxn_c_l132_c24_d4a5_return_output : unsigned(23 downto 0);
 variable VAR_CONST_SR_20_uxn_c_l132_c24_d4a5_x : unsigned(23 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_c_l132_c14_5cfc_return_output : unsigned(3 downto 0);
 variable VAR_MUX_uxn_c_l133_c17_8508_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l133_c17_8e45_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l133_c17_8e45_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l133_c17_8e45_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l133_c17_8508_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l133_c17_8508_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l133_c17_8508_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l136_c6_5d8e_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l136_c22_4cd0_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l136_c22_4cd0_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l136_c6_5d8e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l136_c6_5d8e_return_output : unsigned(0 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l136_c2_3b4f_iftrue : unsigned(15 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l136_c2_3b4f_iffalse : unsigned(15 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l136_c2_3b4f_return_output : unsigned(15 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l136_c2_3b4f_cond : unsigned(0 downto 0);
 variable VAR_is_fill_left_uxn_c_l139_c3_bcd1 : unsigned(0 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l136_c2_3b4f_iftrue : unsigned(1 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l136_c2_3b4f_iffalse : unsigned(1 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l136_c2_3b4f_return_output : unsigned(1 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l136_c2_3b4f_cond : unsigned(0 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l136_c2_3b4f_iftrue : unsigned(23 downto 0);
 variable VAR_fill_pixels_remaining_uxn_c_l149_c3_60cb : unsigned(23 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l136_c2_3b4f_iffalse : unsigned(23 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l136_c2_3b4f_return_output : unsigned(23 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l136_c2_3b4f_cond : unsigned(0 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l136_c2_3b4f_iftrue : unsigned(15 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l136_c2_3b4f_iffalse : unsigned(15 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l136_c2_3b4f_return_output : unsigned(15 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l136_c2_3b4f_cond : unsigned(0 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l136_c2_3b4f_iftrue : unsigned(15 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l136_c2_3b4f_iffalse : unsigned(15 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l136_c2_3b4f_return_output : unsigned(15 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l136_c2_3b4f_cond : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l136_c2_3b4f_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_top_uxn_c_l138_c3_2d67 : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l136_c2_3b4f_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l136_c2_3b4f_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l136_c2_3b4f_cond : unsigned(0 downto 0);
 variable VAR_is_fill_active_MUX_uxn_c_l136_c2_3b4f_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_active_MUX_uxn_c_l136_c2_3b4f_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_active_MUX_uxn_c_l136_c2_3b4f_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_active_MUX_uxn_c_l136_c2_3b4f_cond : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l136_c2_3b4f_iftrue : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l136_c2_3b4f_iffalse : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l136_c2_3b4f_return_output : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l136_c2_3b4f_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_c_l136_c2_3b4f_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_c_l136_c2_3b4f_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_c_l136_c2_3b4f_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_c_l136_c2_3b4f_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_c_l136_c2_3b4f_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_c_l136_c2_3b4f_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_c_l136_c2_3b4f_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_c_l136_c2_3b4f_cond : unsigned(0 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l136_c2_3b4f_iftrue : unsigned(15 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l136_c2_3b4f_iffalse : unsigned(15 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l136_c2_3b4f_return_output : unsigned(15 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l136_c2_3b4f_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_19_uxn_c_l138_c17_cd60_return_output : unsigned(23 downto 0);
 variable VAR_CONST_SR_19_uxn_c_l138_c17_cd60_x : unsigned(23 downto 0);
 variable VAR_CONST_SR_18_uxn_c_l139_c18_0d65_return_output : unsigned(23 downto 0);
 variable VAR_CONST_SR_18_uxn_c_l139_c18_0d65_x : unsigned(23 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l140_c27_e4e9_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l140_c27_e4e9_right : unsigned(23 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l140_c27_e4e9_return_output : unsigned(23 downto 0);
 variable VAR_fill_y0_uxn_c_l141_c3_5fc0 : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_c_l141_c13_fb94_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_DIV_uxn_c_l141_c13_fb94_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_DIV_uxn_c_l141_c13_fb94_return_output : unsigned(23 downto 0);
 variable VAR_fill_x0_uxn_c_l142_c3_80b4 : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l142_c13_8c9b_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l142_c38_63d1_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l142_c38_63d1_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l142_c38_63d1_return_output : unsigned(24 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l142_c13_8c9b_right : unsigned(24 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l142_c13_8c9b_return_output : unsigned(23 downto 0);
 variable VAR_MUX_uxn_c_l143_c13_b554_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l143_c13_b554_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l143_c13_b554_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l143_c13_b554_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l144_c13_12c1_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l144_c13_12c1_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l144_c13_12c1_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l144_c13_12c1_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l145_c13_778d_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l145_c13_778d_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l145_c13_778d_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l145_c13_778d_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l146_c13_45b2_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l146_c13_45b2_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l146_c13_45b2_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l146_c13_45b2_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l149_c28_4085_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l149_c28_4085_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l149_c28_4085_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l149_c28_abae_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l149_c28_abae_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l149_c28_abae_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l149_c28_0b13_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l149_c54_13cf_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l149_c54_13cf_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l149_c54_13cf_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l149_c54_5a60_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l149_c54_5a60_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l149_c54_5a60_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l149_c28_0b13_right : unsigned(16 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l149_c28_0b13_return_output : unsigned(33 downto 0);
 variable VAR_MUX_uxn_c_l157_c26_3bb0_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l157_c26_3bb0_iftrue : unsigned(23 downto 0);
 variable VAR_MUX_uxn_c_l157_c26_3bb0_iffalse : unsigned(23 downto 0);
 variable VAR_CAST_TO_uint24_t_uxn_c_l157_c45_cc2e_return_output : unsigned(23 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l157_c45_5d73_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l157_c45_5d73_right : unsigned(23 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l157_c45_5d73_return_output : unsigned(47 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l157_c45_9792_left : unsigned(47 downto 0);
 variable VAR_CAST_TO_uint24_t_uxn_c_l157_c81_345b_return_output : unsigned(23 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l157_c45_9792_right : unsigned(23 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l157_c45_9792_return_output : unsigned(48 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l157_c100_a3c1_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l157_c100_a3c1_right : unsigned(23 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l157_c100_a3c1_return_output : unsigned(23 downto 0);
 variable VAR_MUX_uxn_c_l157_c26_3bb0_return_output : unsigned(23 downto 0);
 variable VAR_MUX_uxn_c_l159_c18_3508_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l159_c18_6f3e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l159_c18_6f3e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l159_c18_6f3e_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l159_c18_3508_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l159_c18_3508_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l159_c18_3508_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l160_c6_f848_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l160_c6_f848_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l160_c6_f848_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l160_c22_8c12_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l160_c22_8c12_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l160_c22_8c12_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l160_c6_f848_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l161_c6_e20b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l161_c6_e20b_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l161_c6_e20b_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l161_c31_af50_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l161_c31_af50_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l161_c31_af50_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l161_c6_e20b_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l163_c19_50e3_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l163_c38_9f1c_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l163_c38_9f1c_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l163_c19_50e3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l163_c19_50e3_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l164_c19_78ef_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l164_c19_78ef_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l164_c19_78ef_return_output : unsigned(0 downto 0);
 variable VAR_bg_vram_update_uxn_c_l166_c19_4254_read_address : unsigned(23 downto 0);
 variable VAR_bg_vram_update_uxn_c_l166_c19_4254_write_address : unsigned(23 downto 0);
 variable VAR_bg_vram_update_uxn_c_l166_c19_4254_write_value : unsigned(1 downto 0);
 variable VAR_bg_vram_update_uxn_c_l166_c19_4254_write_enable : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l169_c3_000b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l169_c3_000b_iftrue : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l169_c3_000b_iffalse : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l169_c3_000b_return_output : unsigned(1 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l170_c3_5559_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l170_c22_4ccb_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l170_c57_9fbb_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l170_c57_9fbb_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l170_c22_4ccb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l170_c22_4ccb_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l170_c3_5559_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l170_c3_5559_return_output : unsigned(0 downto 0);
 variable VAR_bg_vram_update_uxn_c_l166_c19_4254_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_bg_vram_update_uxn_c_l166_c19_4254_return_output : unsigned(1 downto 0);
 variable VAR_fg_vram_update_uxn_c_l173_c19_2348_read_address : unsigned(23 downto 0);
 variable VAR_fg_vram_update_uxn_c_l173_c19_2348_write_address : unsigned(23 downto 0);
 variable VAR_fg_vram_update_uxn_c_l173_c19_2348_write_value : unsigned(1 downto 0);
 variable VAR_fg_vram_update_uxn_c_l173_c19_2348_write_enable : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l176_c3_68a1_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l176_c3_68a1_iftrue : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l176_c3_68a1_iffalse : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l176_c3_68a1_return_output : unsigned(1 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l177_c3_f0fc_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l177_c22_73bf_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l177_c22_73bf_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l177_c22_73bf_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l177_c3_f0fc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l177_c3_f0fc_return_output : unsigned(0 downto 0);
 variable VAR_fg_vram_update_uxn_c_l173_c19_2348_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_fg_vram_update_uxn_c_l173_c19_2348_return_output : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l180_c26_8094_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l180_c26_8094_iftrue : unsigned(23 downto 0);
 variable VAR_MUX_uxn_c_l180_c26_8094_iffalse : unsigned(23 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l180_c43_3b74_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l180_c43_3b74_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l180_c43_3b74_return_output : unsigned(23 downto 0);
 variable VAR_MUX_uxn_c_l180_c26_8094_return_output : unsigned(23 downto 0);
 variable VAR_MUX_uxn_c_l181_c19_78b6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l181_c19_eb1d_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l181_c19_eb1d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l181_c19_eb1d_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l181_c19_78b6_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l181_c19_78b6_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l181_c19_78b6_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l182_c19_3c16_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l182_c19_49c8_left : unsigned(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l182_c19_49c8_right : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l182_c19_49c8_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l182_c19_3c16_iftrue : unsigned(17 downto 0);
 variable VAR_MUX_uxn_c_l182_c19_3c16_iffalse : unsigned(17 downto 0);
 variable VAR_MUX_uxn_c_l182_c50_8472_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l182_c50_8472_iftrue : unsigned(17 downto 0);
 variable VAR_MUX_uxn_c_l182_c50_8472_iffalse : unsigned(17 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l182_c76_14df_left : unsigned(17 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l182_c76_14df_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l182_c76_14df_return_output : unsigned(18 downto 0);
 variable VAR_MUX_uxn_c_l182_c50_8472_return_output : unsigned(17 downto 0);
 variable VAR_MUX_uxn_c_l182_c19_3c16_return_output : unsigned(17 downto 0);
 variable VAR_MUX_uxn_c_l183_c25_8de0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l183_c25_5f05_left : unsigned(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l183_c25_5f05_right : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l183_c25_5f05_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l183_c25_8de0_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l183_c25_8de0_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l183_c25_8de0_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l184_c17_1120_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l184_c17_6469_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l184_c17_6469_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l184_c17_6469_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l184_c17_1120_iftrue : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l184_c17_1120_iffalse : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l184_c17_1120_return_output : unsigned(1 downto 0);
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_c_l170_l177_DUPLICATE_24df_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_c_l170_l177_DUPLICATE_24df_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l170_l177_DUPLICATE_d702_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l170_l177_DUPLICATE_d702_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l170_l177_DUPLICATE_d702_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_269d_uxn_c_l187_l117_DUPLICATE_fe86_return_output : gpu_step_result_t;
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
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l142_c38_63d1_right := to_unsigned(320, 9);
     VAR_MUX_uxn_c_l145_c13_778d_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l157_c45_5d73_right := to_unsigned(320, 24);
     VAR_BIN_OP_AND_uxn_c_l157_c100_a3c1_right := to_unsigned(262143, 24);
     VAR_is_fill_active_MUX_uxn_c_l136_c2_3b4f_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l159_c18_3508_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l183_c25_8de0_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_c_l182_c76_14df_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l184_c17_6469_right := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l182_c19_3c16_iftrue := resize(to_unsigned(0, 1), 18);
     VAR_MUX_uxn_c_l181_c19_78b6_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l181_c19_eb1d_right := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_c_l149_c54_5a60_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l133_c17_8e45_right := to_unsigned(15, 4);
     VAR_BIN_OP_DIV_uxn_c_l141_c13_fb94_right := to_unsigned(320, 9);
     VAR_MUX_uxn_c_l159_c18_3508_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l144_c13_12c1_iffalse := resize(to_unsigned(319, 9), 16);
     VAR_MUX_uxn_c_l180_c26_8094_iffalse := resize(to_unsigned(0, 1), 24);
     VAR_BIN_OP_EQ_uxn_c_l182_c19_49c8_right := to_unsigned(92159, 17);
     VAR_BIN_OP_PLUS_uxn_c_l160_c22_8c12_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l183_c25_5f05_right := to_unsigned(92159, 17);
     VAR_MUX_uxn_c_l146_c13_45b2_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_BIN_OP_PLUS_uxn_c_l161_c31_af50_right := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_c_l140_c27_e4e9_right := to_unsigned(262143, 24);
     VAR_MUX_uxn_c_l143_c13_b554_iffalse := resize(to_unsigned(287, 9), 16);
     VAR_MUX_uxn_c_l133_c17_8508_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l181_c19_78b6_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l133_c17_8508_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l183_c25_8de0_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_c_l149_c28_abae_right := to_unsigned(1, 1);
     VAR_BIN_OP_MINUS_uxn_c_l180_c43_3b74_right := to_unsigned(1, 1);

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
     VAR_bg_vram_update_uxn_c_l166_c19_4254_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_fg_vram_update_uxn_c_l173_c19_2348_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_fill_color_MUX_uxn_c_l136_c2_3b4f_iffalse := fill_color;
     VAR_fill_layer_MUX_uxn_c_l136_c2_3b4f_iffalse := fill_layer;
     VAR_fill_pixels_remaining_MUX_uxn_c_l136_c2_3b4f_iffalse := fill_pixels_remaining;
     VAR_fill_x0_MUX_uxn_c_l136_c2_3b4f_iffalse := fill_x0;
     VAR_fill_x1_MUX_uxn_c_l136_c2_3b4f_iffalse := fill_x1;
     VAR_fill_y0_MUX_uxn_c_l136_c2_3b4f_iffalse := fill_y0;
     VAR_fill_y1_MUX_uxn_c_l136_c2_3b4f_iffalse := fill_y1;
     VAR_MUX_uxn_c_l182_c50_8472_cond := VAR_is_active_drawing_area;
     VAR_UNARY_OP_NOT_uxn_c_l136_c22_4cd0_expr := is_fill_active;
     VAR_is_fill_active_MUX_uxn_c_l136_c2_3b4f_iffalse := is_fill_active;
     VAR_is_fill_top_MUX_uxn_c_l136_c2_3b4f_iffalse := is_fill_top;
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l170_l177_DUPLICATE_d702_right := VAR_is_vram_write;
     VAR_BIN_OP_EQ_uxn_c_l182_c19_49c8_left := pixel_counter;
     VAR_BIN_OP_PLUS_uxn_c_l182_c76_14df_left := pixel_counter;
     VAR_MUX_uxn_c_l182_c50_8472_iffalse := pixel_counter;
     VAR_bg_vram_update_uxn_c_l166_c19_4254_read_address := resize(pixel_counter, 24);
     VAR_fg_vram_update_uxn_c_l173_c19_2348_read_address := resize(pixel_counter, 24);
     VAR_BIN_OP_AND_uxn_c_l140_c27_e4e9_left := VAR_vram_address;
     VAR_BIN_OP_AND_uxn_c_l157_c100_a3c1_left := VAR_vram_address;
     VAR_CONST_SR_18_uxn_c_l139_c18_0d65_x := VAR_vram_address;
     VAR_CONST_SR_19_uxn_c_l138_c17_cd60_x := VAR_vram_address;
     VAR_CONST_SR_20_uxn_c_l132_c24_d4a5_x := VAR_vram_address;
     VAR_MUX_uxn_c_l169_c3_000b_iffalse := VAR_vram_value;
     VAR_MUX_uxn_c_l176_c3_68a1_iffalse := VAR_vram_value;
     VAR_fill_color_MUX_uxn_c_l136_c2_3b4f_iftrue := VAR_vram_value;
     VAR_BIN_OP_AND_uxn_c_l177_c22_73bf_right := VAR_vram_write_layer;
     VAR_UNARY_OP_NOT_uxn_c_l170_c57_9fbb_expr := VAR_vram_write_layer;
     VAR_fill_layer_MUX_uxn_c_l136_c2_3b4f_iftrue := VAR_vram_write_layer;
     VAR_x_MUX_uxn_c_l136_c2_3b4f_iffalse := x;
     VAR_y_MUX_uxn_c_l136_c2_3b4f_iffalse := y;
     -- CONST_SR_19[uxn_c_l138_c17_cd60] LATENCY=0
     -- Inputs
     CONST_SR_19_uxn_c_l138_c17_cd60_x <= VAR_CONST_SR_19_uxn_c_l138_c17_cd60_x;
     -- Outputs
     VAR_CONST_SR_19_uxn_c_l138_c17_cd60_return_output := CONST_SR_19_uxn_c_l138_c17_cd60_return_output;

     -- CONST_SR_20[uxn_c_l132_c24_d4a5] LATENCY=0
     -- Inputs
     CONST_SR_20_uxn_c_l132_c24_d4a5_x <= VAR_CONST_SR_20_uxn_c_l132_c24_d4a5_x;
     -- Outputs
     VAR_CONST_SR_20_uxn_c_l132_c24_d4a5_return_output := CONST_SR_20_uxn_c_l132_c24_d4a5_return_output;

     -- CONST_SR_18[uxn_c_l139_c18_0d65] LATENCY=0
     -- Inputs
     CONST_SR_18_uxn_c_l139_c18_0d65_x <= VAR_CONST_SR_18_uxn_c_l139_c18_0d65_x;
     -- Outputs
     VAR_CONST_SR_18_uxn_c_l139_c18_0d65_return_output := CONST_SR_18_uxn_c_l139_c18_0d65_return_output;

     -- UNARY_OP_NOT[uxn_c_l136_c22_4cd0] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l136_c22_4cd0_expr <= VAR_UNARY_OP_NOT_uxn_c_l136_c22_4cd0_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l136_c22_4cd0_return_output := UNARY_OP_NOT_uxn_c_l136_c22_4cd0_return_output;

     -- BIN_OP_EQ[uxn_c_l182_c19_49c8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l182_c19_49c8_left <= VAR_BIN_OP_EQ_uxn_c_l182_c19_49c8_left;
     BIN_OP_EQ_uxn_c_l182_c19_49c8_right <= VAR_BIN_OP_EQ_uxn_c_l182_c19_49c8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l182_c19_49c8_return_output := BIN_OP_EQ_uxn_c_l182_c19_49c8_return_output;

     -- BIN_OP_AND[uxn_c_l157_c100_a3c1] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l157_c100_a3c1_left <= VAR_BIN_OP_AND_uxn_c_l157_c100_a3c1_left;
     BIN_OP_AND_uxn_c_l157_c100_a3c1_right <= VAR_BIN_OP_AND_uxn_c_l157_c100_a3c1_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l157_c100_a3c1_return_output := BIN_OP_AND_uxn_c_l157_c100_a3c1_return_output;

     -- UNARY_OP_NOT[uxn_c_l170_c57_9fbb] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l170_c57_9fbb_expr <= VAR_UNARY_OP_NOT_uxn_c_l170_c57_9fbb_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l170_c57_9fbb_return_output := UNARY_OP_NOT_uxn_c_l170_c57_9fbb_return_output;

     -- BIN_OP_PLUS[uxn_c_l182_c76_14df] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l182_c76_14df_left <= VAR_BIN_OP_PLUS_uxn_c_l182_c76_14df_left;
     BIN_OP_PLUS_uxn_c_l182_c76_14df_right <= VAR_BIN_OP_PLUS_uxn_c_l182_c76_14df_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l182_c76_14df_return_output := BIN_OP_PLUS_uxn_c_l182_c76_14df_return_output;

     -- BIN_OP_AND[uxn_c_l140_c27_e4e9] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l140_c27_e4e9_left <= VAR_BIN_OP_AND_uxn_c_l140_c27_e4e9_left;
     BIN_OP_AND_uxn_c_l140_c27_e4e9_right <= VAR_BIN_OP_AND_uxn_c_l140_c27_e4e9_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l140_c27_e4e9_return_output := BIN_OP_AND_uxn_c_l140_c27_e4e9_return_output;

     -- Submodule level 1
     VAR_BIN_OP_DIV_uxn_c_l141_c13_fb94_left := VAR_BIN_OP_AND_uxn_c_l140_c27_e4e9_return_output;
     VAR_BIN_OP_MINUS_uxn_c_l142_c13_8c9b_left := VAR_BIN_OP_AND_uxn_c_l140_c27_e4e9_return_output;
     VAR_MUX_uxn_c_l157_c26_3bb0_iffalse := VAR_BIN_OP_AND_uxn_c_l157_c100_a3c1_return_output;
     VAR_MUX_uxn_c_l182_c19_3c16_cond := VAR_BIN_OP_EQ_uxn_c_l182_c19_49c8_return_output;
     VAR_MUX_uxn_c_l182_c50_8472_iftrue := resize(VAR_BIN_OP_PLUS_uxn_c_l182_c76_14df_return_output, 18);
     VAR_is_fill_left_uxn_c_l139_c3_bcd1 := resize(VAR_CONST_SR_18_uxn_c_l139_c18_0d65_return_output, 1);
     VAR_is_fill_top_uxn_c_l138_c3_2d67 := resize(VAR_CONST_SR_19_uxn_c_l138_c17_cd60_return_output, 1);
     VAR_BIN_OP_AND_uxn_c_l136_c6_5d8e_right := VAR_UNARY_OP_NOT_uxn_c_l136_c22_4cd0_return_output;
     VAR_BIN_OP_AND_uxn_c_l170_c22_4ccb_right := VAR_UNARY_OP_NOT_uxn_c_l170_c57_9fbb_return_output;
     VAR_MUX_uxn_c_l144_c13_12c1_cond := VAR_is_fill_left_uxn_c_l139_c3_bcd1;
     VAR_MUX_uxn_c_l146_c13_45b2_cond := VAR_is_fill_left_uxn_c_l139_c3_bcd1;
     VAR_MUX_uxn_c_l143_c13_b554_cond := VAR_is_fill_top_uxn_c_l138_c3_2d67;
     VAR_MUX_uxn_c_l145_c13_778d_cond := VAR_is_fill_top_uxn_c_l138_c3_2d67;
     VAR_is_fill_top_MUX_uxn_c_l136_c2_3b4f_iftrue := VAR_is_fill_top_uxn_c_l138_c3_2d67;
     -- CAST_TO_uint4_t[uxn_c_l132_c14_5cfc] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_c_l132_c14_5cfc_return_output := CAST_TO_uint4_t_uint24_t(
     VAR_CONST_SR_20_uxn_c_l132_c24_d4a5_return_output);

     -- MUX[uxn_c_l182_c50_8472] LATENCY=0
     -- Inputs
     MUX_uxn_c_l182_c50_8472_cond <= VAR_MUX_uxn_c_l182_c50_8472_cond;
     MUX_uxn_c_l182_c50_8472_iftrue <= VAR_MUX_uxn_c_l182_c50_8472_iftrue;
     MUX_uxn_c_l182_c50_8472_iffalse <= VAR_MUX_uxn_c_l182_c50_8472_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l182_c50_8472_return_output := MUX_uxn_c_l182_c50_8472_return_output;

     -- BIN_OP_DIV[uxn_c_l141_c13_fb94] LATENCY=0
     -- Inputs
     BIN_OP_DIV_uxn_c_l141_c13_fb94_left <= VAR_BIN_OP_DIV_uxn_c_l141_c13_fb94_left;
     BIN_OP_DIV_uxn_c_l141_c13_fb94_right <= VAR_BIN_OP_DIV_uxn_c_l141_c13_fb94_right;
     -- Outputs
     VAR_BIN_OP_DIV_uxn_c_l141_c13_fb94_return_output := BIN_OP_DIV_uxn_c_l141_c13_fb94_return_output;

     -- Submodule level 2
     VAR_fill_y0_uxn_c_l141_c3_5fc0 := resize(VAR_BIN_OP_DIV_uxn_c_l141_c13_fb94_return_output, 16);
     VAR_BIN_OP_EQ_uxn_c_l133_c17_8e45_left := VAR_CAST_TO_uint4_t_uxn_c_l132_c14_5cfc_return_output;
     REG_VAR_vram_code := VAR_CAST_TO_uint4_t_uxn_c_l132_c14_5cfc_return_output;
     VAR_MUX_uxn_c_l182_c19_3c16_iffalse := VAR_MUX_uxn_c_l182_c50_8472_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l142_c38_63d1_left := VAR_fill_y0_uxn_c_l141_c3_5fc0;
     VAR_MUX_uxn_c_l143_c13_b554_iftrue := VAR_fill_y0_uxn_c_l141_c3_5fc0;
     VAR_MUX_uxn_c_l145_c13_778d_iffalse := VAR_fill_y0_uxn_c_l141_c3_5fc0;
     -- MUX[uxn_c_l145_c13_778d] LATENCY=0
     -- Inputs
     MUX_uxn_c_l145_c13_778d_cond <= VAR_MUX_uxn_c_l145_c13_778d_cond;
     MUX_uxn_c_l145_c13_778d_iftrue <= VAR_MUX_uxn_c_l145_c13_778d_iftrue;
     MUX_uxn_c_l145_c13_778d_iffalse <= VAR_MUX_uxn_c_l145_c13_778d_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l145_c13_778d_return_output := MUX_uxn_c_l145_c13_778d_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_c_l142_c38_63d1] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_c_l142_c38_63d1_left <= VAR_BIN_OP_INFERRED_MULT_uxn_c_l142_c38_63d1_left;
     BIN_OP_INFERRED_MULT_uxn_c_l142_c38_63d1_right <= VAR_BIN_OP_INFERRED_MULT_uxn_c_l142_c38_63d1_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l142_c38_63d1_return_output := BIN_OP_INFERRED_MULT_uxn_c_l142_c38_63d1_return_output;

     -- MUX[uxn_c_l143_c13_b554] LATENCY=0
     -- Inputs
     MUX_uxn_c_l143_c13_b554_cond <= VAR_MUX_uxn_c_l143_c13_b554_cond;
     MUX_uxn_c_l143_c13_b554_iftrue <= VAR_MUX_uxn_c_l143_c13_b554_iftrue;
     MUX_uxn_c_l143_c13_b554_iffalse <= VAR_MUX_uxn_c_l143_c13_b554_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l143_c13_b554_return_output := MUX_uxn_c_l143_c13_b554_return_output;

     -- BIN_OP_EQ[uxn_c_l133_c17_8e45] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l133_c17_8e45_left <= VAR_BIN_OP_EQ_uxn_c_l133_c17_8e45_left;
     BIN_OP_EQ_uxn_c_l133_c17_8e45_right <= VAR_BIN_OP_EQ_uxn_c_l133_c17_8e45_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l133_c17_8e45_return_output := BIN_OP_EQ_uxn_c_l133_c17_8e45_return_output;

     -- MUX[uxn_c_l182_c19_3c16] LATENCY=0
     -- Inputs
     MUX_uxn_c_l182_c19_3c16_cond <= VAR_MUX_uxn_c_l182_c19_3c16_cond;
     MUX_uxn_c_l182_c19_3c16_iftrue <= VAR_MUX_uxn_c_l182_c19_3c16_iftrue;
     MUX_uxn_c_l182_c19_3c16_iffalse <= VAR_MUX_uxn_c_l182_c19_3c16_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l182_c19_3c16_return_output := MUX_uxn_c_l182_c19_3c16_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_c_l133_c17_8508_cond := VAR_BIN_OP_EQ_uxn_c_l133_c17_8e45_return_output;
     VAR_BIN_OP_MINUS_uxn_c_l142_c13_8c9b_right := VAR_BIN_OP_INFERRED_MULT_uxn_c_l142_c38_63d1_return_output;
     VAR_BIN_OP_MINUS_uxn_c_l149_c54_13cf_left := VAR_MUX_uxn_c_l143_c13_b554_return_output;
     VAR_fill_y1_MUX_uxn_c_l136_c2_3b4f_iftrue := VAR_MUX_uxn_c_l143_c13_b554_return_output;
     VAR_BIN_OP_MINUS_uxn_c_l149_c54_13cf_right := VAR_MUX_uxn_c_l145_c13_778d_return_output;
     VAR_fill_y0_MUX_uxn_c_l136_c2_3b4f_iftrue := VAR_MUX_uxn_c_l145_c13_778d_return_output;
     VAR_y_MUX_uxn_c_l136_c2_3b4f_iftrue := VAR_MUX_uxn_c_l145_c13_778d_return_output;
     VAR_BIN_OP_EQ_uxn_c_l183_c25_5f05_left := VAR_MUX_uxn_c_l182_c19_3c16_return_output;
     REG_VAR_pixel_counter := VAR_MUX_uxn_c_l182_c19_3c16_return_output;
     -- MUX[uxn_c_l133_c17_8508] LATENCY=0
     -- Inputs
     MUX_uxn_c_l133_c17_8508_cond <= VAR_MUX_uxn_c_l133_c17_8508_cond;
     MUX_uxn_c_l133_c17_8508_iftrue <= VAR_MUX_uxn_c_l133_c17_8508_iftrue;
     MUX_uxn_c_l133_c17_8508_iffalse <= VAR_MUX_uxn_c_l133_c17_8508_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l133_c17_8508_return_output := MUX_uxn_c_l133_c17_8508_return_output;

     -- BIN_OP_MINUS[uxn_c_l149_c54_13cf] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l149_c54_13cf_left <= VAR_BIN_OP_MINUS_uxn_c_l149_c54_13cf_left;
     BIN_OP_MINUS_uxn_c_l149_c54_13cf_right <= VAR_BIN_OP_MINUS_uxn_c_l149_c54_13cf_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l149_c54_13cf_return_output := BIN_OP_MINUS_uxn_c_l149_c54_13cf_return_output;

     -- BIN_OP_MINUS[uxn_c_l142_c13_8c9b] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l142_c13_8c9b_left <= VAR_BIN_OP_MINUS_uxn_c_l142_c13_8c9b_left;
     BIN_OP_MINUS_uxn_c_l142_c13_8c9b_right <= VAR_BIN_OP_MINUS_uxn_c_l142_c13_8c9b_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l142_c13_8c9b_return_output := BIN_OP_MINUS_uxn_c_l142_c13_8c9b_return_output;

     -- BIN_OP_EQ[uxn_c_l183_c25_5f05] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l183_c25_5f05_left <= VAR_BIN_OP_EQ_uxn_c_l183_c25_5f05_left;
     BIN_OP_EQ_uxn_c_l183_c25_5f05_right <= VAR_BIN_OP_EQ_uxn_c_l183_c25_5f05_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l183_c25_5f05_return_output := BIN_OP_EQ_uxn_c_l183_c25_5f05_return_output;

     -- Submodule level 4
     VAR_MUX_uxn_c_l183_c25_8de0_cond := VAR_BIN_OP_EQ_uxn_c_l183_c25_5f05_return_output;
     VAR_fill_x0_uxn_c_l142_c3_80b4 := resize(VAR_BIN_OP_MINUS_uxn_c_l142_c13_8c9b_return_output, 16);
     VAR_BIN_OP_PLUS_uxn_c_l149_c54_5a60_left := VAR_BIN_OP_MINUS_uxn_c_l149_c54_13cf_return_output;
     VAR_BIN_OP_AND_uxn_c_l136_c6_5d8e_left := VAR_MUX_uxn_c_l133_c17_8508_return_output;
     REG_VAR_is_fill_code := VAR_MUX_uxn_c_l133_c17_8508_return_output;
     VAR_MUX_uxn_c_l144_c13_12c1_iftrue := VAR_fill_x0_uxn_c_l142_c3_80b4;
     VAR_MUX_uxn_c_l146_c13_45b2_iffalse := VAR_fill_x0_uxn_c_l142_c3_80b4;
     -- BIN_OP_PLUS[uxn_c_l149_c54_5a60] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l149_c54_5a60_left <= VAR_BIN_OP_PLUS_uxn_c_l149_c54_5a60_left;
     BIN_OP_PLUS_uxn_c_l149_c54_5a60_right <= VAR_BIN_OP_PLUS_uxn_c_l149_c54_5a60_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l149_c54_5a60_return_output := BIN_OP_PLUS_uxn_c_l149_c54_5a60_return_output;

     -- MUX[uxn_c_l146_c13_45b2] LATENCY=0
     -- Inputs
     MUX_uxn_c_l146_c13_45b2_cond <= VAR_MUX_uxn_c_l146_c13_45b2_cond;
     MUX_uxn_c_l146_c13_45b2_iftrue <= VAR_MUX_uxn_c_l146_c13_45b2_iftrue;
     MUX_uxn_c_l146_c13_45b2_iffalse <= VAR_MUX_uxn_c_l146_c13_45b2_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l146_c13_45b2_return_output := MUX_uxn_c_l146_c13_45b2_return_output;

     -- MUX[uxn_c_l144_c13_12c1] LATENCY=0
     -- Inputs
     MUX_uxn_c_l144_c13_12c1_cond <= VAR_MUX_uxn_c_l144_c13_12c1_cond;
     MUX_uxn_c_l144_c13_12c1_iftrue <= VAR_MUX_uxn_c_l144_c13_12c1_iftrue;
     MUX_uxn_c_l144_c13_12c1_iffalse <= VAR_MUX_uxn_c_l144_c13_12c1_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l144_c13_12c1_return_output := MUX_uxn_c_l144_c13_12c1_return_output;

     -- MUX[uxn_c_l183_c25_8de0] LATENCY=0
     -- Inputs
     MUX_uxn_c_l183_c25_8de0_cond <= VAR_MUX_uxn_c_l183_c25_8de0_cond;
     MUX_uxn_c_l183_c25_8de0_iftrue <= VAR_MUX_uxn_c_l183_c25_8de0_iftrue;
     MUX_uxn_c_l183_c25_8de0_iffalse <= VAR_MUX_uxn_c_l183_c25_8de0_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l183_c25_8de0_return_output := MUX_uxn_c_l183_c25_8de0_return_output;

     -- BIN_OP_AND[uxn_c_l136_c6_5d8e] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l136_c6_5d8e_left <= VAR_BIN_OP_AND_uxn_c_l136_c6_5d8e_left;
     BIN_OP_AND_uxn_c_l136_c6_5d8e_right <= VAR_BIN_OP_AND_uxn_c_l136_c6_5d8e_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l136_c6_5d8e_return_output := BIN_OP_AND_uxn_c_l136_c6_5d8e_return_output;

     -- Submodule level 5
     VAR_fill_color_MUX_uxn_c_l136_c2_3b4f_cond := VAR_BIN_OP_AND_uxn_c_l136_c6_5d8e_return_output;
     VAR_fill_layer_MUX_uxn_c_l136_c2_3b4f_cond := VAR_BIN_OP_AND_uxn_c_l136_c6_5d8e_return_output;
     VAR_fill_pixels_remaining_MUX_uxn_c_l136_c2_3b4f_cond := VAR_BIN_OP_AND_uxn_c_l136_c6_5d8e_return_output;
     VAR_fill_x0_MUX_uxn_c_l136_c2_3b4f_cond := VAR_BIN_OP_AND_uxn_c_l136_c6_5d8e_return_output;
     VAR_fill_x1_MUX_uxn_c_l136_c2_3b4f_cond := VAR_BIN_OP_AND_uxn_c_l136_c6_5d8e_return_output;
     VAR_fill_y0_MUX_uxn_c_l136_c2_3b4f_cond := VAR_BIN_OP_AND_uxn_c_l136_c6_5d8e_return_output;
     VAR_fill_y1_MUX_uxn_c_l136_c2_3b4f_cond := VAR_BIN_OP_AND_uxn_c_l136_c6_5d8e_return_output;
     VAR_is_fill_active_MUX_uxn_c_l136_c2_3b4f_cond := VAR_BIN_OP_AND_uxn_c_l136_c6_5d8e_return_output;
     VAR_is_fill_top_MUX_uxn_c_l136_c2_3b4f_cond := VAR_BIN_OP_AND_uxn_c_l136_c6_5d8e_return_output;
     VAR_x_MUX_uxn_c_l136_c2_3b4f_cond := VAR_BIN_OP_AND_uxn_c_l136_c6_5d8e_return_output;
     VAR_y_MUX_uxn_c_l136_c2_3b4f_cond := VAR_BIN_OP_AND_uxn_c_l136_c6_5d8e_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l149_c28_0b13_right := VAR_BIN_OP_PLUS_uxn_c_l149_c54_5a60_return_output;
     VAR_BIN_OP_MINUS_uxn_c_l149_c28_4085_left := VAR_MUX_uxn_c_l144_c13_12c1_return_output;
     VAR_fill_x1_MUX_uxn_c_l136_c2_3b4f_iftrue := VAR_MUX_uxn_c_l144_c13_12c1_return_output;
     VAR_BIN_OP_MINUS_uxn_c_l149_c28_4085_right := VAR_MUX_uxn_c_l146_c13_45b2_return_output;
     VAR_fill_x0_MUX_uxn_c_l136_c2_3b4f_iftrue := VAR_MUX_uxn_c_l146_c13_45b2_return_output;
     VAR_x_MUX_uxn_c_l136_c2_3b4f_iftrue := VAR_MUX_uxn_c_l146_c13_45b2_return_output;
     -- BIN_OP_MINUS[uxn_c_l149_c28_4085] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l149_c28_4085_left <= VAR_BIN_OP_MINUS_uxn_c_l149_c28_4085_left;
     BIN_OP_MINUS_uxn_c_l149_c28_4085_right <= VAR_BIN_OP_MINUS_uxn_c_l149_c28_4085_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l149_c28_4085_return_output := BIN_OP_MINUS_uxn_c_l149_c28_4085_return_output;

     -- x_MUX[uxn_c_l136_c2_3b4f] LATENCY=0
     -- Inputs
     x_MUX_uxn_c_l136_c2_3b4f_cond <= VAR_x_MUX_uxn_c_l136_c2_3b4f_cond;
     x_MUX_uxn_c_l136_c2_3b4f_iftrue <= VAR_x_MUX_uxn_c_l136_c2_3b4f_iftrue;
     x_MUX_uxn_c_l136_c2_3b4f_iffalse <= VAR_x_MUX_uxn_c_l136_c2_3b4f_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_c_l136_c2_3b4f_return_output := x_MUX_uxn_c_l136_c2_3b4f_return_output;

     -- is_fill_active_MUX[uxn_c_l136_c2_3b4f] LATENCY=0
     -- Inputs
     is_fill_active_MUX_uxn_c_l136_c2_3b4f_cond <= VAR_is_fill_active_MUX_uxn_c_l136_c2_3b4f_cond;
     is_fill_active_MUX_uxn_c_l136_c2_3b4f_iftrue <= VAR_is_fill_active_MUX_uxn_c_l136_c2_3b4f_iftrue;
     is_fill_active_MUX_uxn_c_l136_c2_3b4f_iffalse <= VAR_is_fill_active_MUX_uxn_c_l136_c2_3b4f_iffalse;
     -- Outputs
     VAR_is_fill_active_MUX_uxn_c_l136_c2_3b4f_return_output := is_fill_active_MUX_uxn_c_l136_c2_3b4f_return_output;

     -- fill_x0_MUX[uxn_c_l136_c2_3b4f] LATENCY=0
     -- Inputs
     fill_x0_MUX_uxn_c_l136_c2_3b4f_cond <= VAR_fill_x0_MUX_uxn_c_l136_c2_3b4f_cond;
     fill_x0_MUX_uxn_c_l136_c2_3b4f_iftrue <= VAR_fill_x0_MUX_uxn_c_l136_c2_3b4f_iftrue;
     fill_x0_MUX_uxn_c_l136_c2_3b4f_iffalse <= VAR_fill_x0_MUX_uxn_c_l136_c2_3b4f_iffalse;
     -- Outputs
     VAR_fill_x0_MUX_uxn_c_l136_c2_3b4f_return_output := fill_x0_MUX_uxn_c_l136_c2_3b4f_return_output;

     -- y_MUX[uxn_c_l136_c2_3b4f] LATENCY=0
     -- Inputs
     y_MUX_uxn_c_l136_c2_3b4f_cond <= VAR_y_MUX_uxn_c_l136_c2_3b4f_cond;
     y_MUX_uxn_c_l136_c2_3b4f_iftrue <= VAR_y_MUX_uxn_c_l136_c2_3b4f_iftrue;
     y_MUX_uxn_c_l136_c2_3b4f_iffalse <= VAR_y_MUX_uxn_c_l136_c2_3b4f_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_c_l136_c2_3b4f_return_output := y_MUX_uxn_c_l136_c2_3b4f_return_output;

     -- fill_y0_MUX[uxn_c_l136_c2_3b4f] LATENCY=0
     -- Inputs
     fill_y0_MUX_uxn_c_l136_c2_3b4f_cond <= VAR_fill_y0_MUX_uxn_c_l136_c2_3b4f_cond;
     fill_y0_MUX_uxn_c_l136_c2_3b4f_iftrue <= VAR_fill_y0_MUX_uxn_c_l136_c2_3b4f_iftrue;
     fill_y0_MUX_uxn_c_l136_c2_3b4f_iffalse <= VAR_fill_y0_MUX_uxn_c_l136_c2_3b4f_iffalse;
     -- Outputs
     VAR_fill_y0_MUX_uxn_c_l136_c2_3b4f_return_output := fill_y0_MUX_uxn_c_l136_c2_3b4f_return_output;

     -- fill_layer_MUX[uxn_c_l136_c2_3b4f] LATENCY=0
     -- Inputs
     fill_layer_MUX_uxn_c_l136_c2_3b4f_cond <= VAR_fill_layer_MUX_uxn_c_l136_c2_3b4f_cond;
     fill_layer_MUX_uxn_c_l136_c2_3b4f_iftrue <= VAR_fill_layer_MUX_uxn_c_l136_c2_3b4f_iftrue;
     fill_layer_MUX_uxn_c_l136_c2_3b4f_iffalse <= VAR_fill_layer_MUX_uxn_c_l136_c2_3b4f_iffalse;
     -- Outputs
     VAR_fill_layer_MUX_uxn_c_l136_c2_3b4f_return_output := fill_layer_MUX_uxn_c_l136_c2_3b4f_return_output;

     -- fill_y1_MUX[uxn_c_l136_c2_3b4f] LATENCY=0
     -- Inputs
     fill_y1_MUX_uxn_c_l136_c2_3b4f_cond <= VAR_fill_y1_MUX_uxn_c_l136_c2_3b4f_cond;
     fill_y1_MUX_uxn_c_l136_c2_3b4f_iftrue <= VAR_fill_y1_MUX_uxn_c_l136_c2_3b4f_iftrue;
     fill_y1_MUX_uxn_c_l136_c2_3b4f_iffalse <= VAR_fill_y1_MUX_uxn_c_l136_c2_3b4f_iffalse;
     -- Outputs
     VAR_fill_y1_MUX_uxn_c_l136_c2_3b4f_return_output := fill_y1_MUX_uxn_c_l136_c2_3b4f_return_output;

     -- fill_color_MUX[uxn_c_l136_c2_3b4f] LATENCY=0
     -- Inputs
     fill_color_MUX_uxn_c_l136_c2_3b4f_cond <= VAR_fill_color_MUX_uxn_c_l136_c2_3b4f_cond;
     fill_color_MUX_uxn_c_l136_c2_3b4f_iftrue <= VAR_fill_color_MUX_uxn_c_l136_c2_3b4f_iftrue;
     fill_color_MUX_uxn_c_l136_c2_3b4f_iffalse <= VAR_fill_color_MUX_uxn_c_l136_c2_3b4f_iffalse;
     -- Outputs
     VAR_fill_color_MUX_uxn_c_l136_c2_3b4f_return_output := fill_color_MUX_uxn_c_l136_c2_3b4f_return_output;

     -- is_fill_top_MUX[uxn_c_l136_c2_3b4f] LATENCY=0
     -- Inputs
     is_fill_top_MUX_uxn_c_l136_c2_3b4f_cond <= VAR_is_fill_top_MUX_uxn_c_l136_c2_3b4f_cond;
     is_fill_top_MUX_uxn_c_l136_c2_3b4f_iftrue <= VAR_is_fill_top_MUX_uxn_c_l136_c2_3b4f_iftrue;
     is_fill_top_MUX_uxn_c_l136_c2_3b4f_iffalse <= VAR_is_fill_top_MUX_uxn_c_l136_c2_3b4f_iffalse;
     -- Outputs
     VAR_is_fill_top_MUX_uxn_c_l136_c2_3b4f_return_output := is_fill_top_MUX_uxn_c_l136_c2_3b4f_return_output;

     -- fill_x1_MUX[uxn_c_l136_c2_3b4f] LATENCY=0
     -- Inputs
     fill_x1_MUX_uxn_c_l136_c2_3b4f_cond <= VAR_fill_x1_MUX_uxn_c_l136_c2_3b4f_cond;
     fill_x1_MUX_uxn_c_l136_c2_3b4f_iftrue <= VAR_fill_x1_MUX_uxn_c_l136_c2_3b4f_iftrue;
     fill_x1_MUX_uxn_c_l136_c2_3b4f_iffalse <= VAR_fill_x1_MUX_uxn_c_l136_c2_3b4f_iffalse;
     -- Outputs
     VAR_fill_x1_MUX_uxn_c_l136_c2_3b4f_return_output := fill_x1_MUX_uxn_c_l136_c2_3b4f_return_output;

     -- Submodule level 6
     VAR_BIN_OP_PLUS_uxn_c_l149_c28_abae_left := VAR_BIN_OP_MINUS_uxn_c_l149_c28_4085_return_output;
     VAR_MUX_uxn_c_l169_c3_000b_iftrue := VAR_fill_color_MUX_uxn_c_l136_c2_3b4f_return_output;
     VAR_MUX_uxn_c_l176_c3_68a1_iftrue := VAR_fill_color_MUX_uxn_c_l136_c2_3b4f_return_output;
     REG_VAR_fill_color := VAR_fill_color_MUX_uxn_c_l136_c2_3b4f_return_output;
     VAR_BIN_OP_AND_uxn_c_l164_c19_78ef_right := VAR_fill_layer_MUX_uxn_c_l136_c2_3b4f_return_output;
     VAR_UNARY_OP_NOT_uxn_c_l163_c38_9f1c_expr := VAR_fill_layer_MUX_uxn_c_l136_c2_3b4f_return_output;
     REG_VAR_fill_layer := VAR_fill_layer_MUX_uxn_c_l136_c2_3b4f_return_output;
     VAR_MUX_uxn_c_l161_c6_e20b_iftrue := VAR_fill_x0_MUX_uxn_c_l136_c2_3b4f_return_output;
     REG_VAR_fill_x0 := VAR_fill_x0_MUX_uxn_c_l136_c2_3b4f_return_output;
     VAR_BIN_OP_EQ_uxn_c_l159_c18_6f3e_right := VAR_fill_x1_MUX_uxn_c_l136_c2_3b4f_return_output;
     REG_VAR_fill_x1 := VAR_fill_x1_MUX_uxn_c_l136_c2_3b4f_return_output;
     REG_VAR_fill_y0 := VAR_fill_y0_MUX_uxn_c_l136_c2_3b4f_return_output;
     REG_VAR_fill_y1 := VAR_fill_y1_MUX_uxn_c_l136_c2_3b4f_return_output;
     VAR_BIN_OP_AND_uxn_c_l163_c19_50e3_left := VAR_is_fill_active_MUX_uxn_c_l136_c2_3b4f_return_output;
     VAR_BIN_OP_AND_uxn_c_l164_c19_78ef_left := VAR_is_fill_active_MUX_uxn_c_l136_c2_3b4f_return_output;
     VAR_MUX_uxn_c_l157_c26_3bb0_cond := VAR_is_fill_active_MUX_uxn_c_l136_c2_3b4f_return_output;
     VAR_MUX_uxn_c_l180_c26_8094_cond := VAR_is_fill_active_MUX_uxn_c_l136_c2_3b4f_return_output;
     VAR_UNARY_OP_NOT_uint1_t_uxn_c_l170_l177_DUPLICATE_24df_expr := VAR_is_fill_active_MUX_uxn_c_l136_c2_3b4f_return_output;
     REG_VAR_is_fill_top := VAR_is_fill_top_MUX_uxn_c_l136_c2_3b4f_return_output;
     VAR_BIN_OP_EQ_uxn_c_l159_c18_6f3e_left := VAR_x_MUX_uxn_c_l136_c2_3b4f_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l161_c31_af50_left := VAR_x_MUX_uxn_c_l136_c2_3b4f_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l160_c22_8c12_left := VAR_y_MUX_uxn_c_l136_c2_3b4f_return_output;
     VAR_MUX_uxn_c_l160_c6_f848_iffalse := VAR_y_MUX_uxn_c_l136_c2_3b4f_return_output;
     -- BIN_OP_PLUS[uxn_c_l161_c31_af50] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l161_c31_af50_left <= VAR_BIN_OP_PLUS_uxn_c_l161_c31_af50_left;
     BIN_OP_PLUS_uxn_c_l161_c31_af50_right <= VAR_BIN_OP_PLUS_uxn_c_l161_c31_af50_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l161_c31_af50_return_output := BIN_OP_PLUS_uxn_c_l161_c31_af50_return_output;

     -- UNARY_OP_NOT[uxn_c_l163_c38_9f1c] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l163_c38_9f1c_expr <= VAR_UNARY_OP_NOT_uxn_c_l163_c38_9f1c_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l163_c38_9f1c_return_output := UNARY_OP_NOT_uxn_c_l163_c38_9f1c_return_output;

     -- BIN_OP_PLUS[uxn_c_l149_c28_abae] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l149_c28_abae_left <= VAR_BIN_OP_PLUS_uxn_c_l149_c28_abae_left;
     BIN_OP_PLUS_uxn_c_l149_c28_abae_right <= VAR_BIN_OP_PLUS_uxn_c_l149_c28_abae_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l149_c28_abae_return_output := BIN_OP_PLUS_uxn_c_l149_c28_abae_return_output;

     -- BIN_OP_AND[uxn_c_l164_c19_78ef] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l164_c19_78ef_left <= VAR_BIN_OP_AND_uxn_c_l164_c19_78ef_left;
     BIN_OP_AND_uxn_c_l164_c19_78ef_right <= VAR_BIN_OP_AND_uxn_c_l164_c19_78ef_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l164_c19_78ef_return_output := BIN_OP_AND_uxn_c_l164_c19_78ef_return_output;

     -- CAST_TO_uint24_t[uxn_c_l157_c45_cc2e] LATENCY=0
     VAR_CAST_TO_uint24_t_uxn_c_l157_c45_cc2e_return_output := CAST_TO_uint24_t_uint16_t(
     VAR_y_MUX_uxn_c_l136_c2_3b4f_return_output);

     -- BIN_OP_EQ[uxn_c_l159_c18_6f3e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l159_c18_6f3e_left <= VAR_BIN_OP_EQ_uxn_c_l159_c18_6f3e_left;
     BIN_OP_EQ_uxn_c_l159_c18_6f3e_right <= VAR_BIN_OP_EQ_uxn_c_l159_c18_6f3e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l159_c18_6f3e_return_output := BIN_OP_EQ_uxn_c_l159_c18_6f3e_return_output;

     -- UNARY_OP_NOT_uint1_t_uxn_c_l170_l177_DUPLICATE_24df LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uint1_t_uxn_c_l170_l177_DUPLICATE_24df_expr <= VAR_UNARY_OP_NOT_uint1_t_uxn_c_l170_l177_DUPLICATE_24df_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uint1_t_uxn_c_l170_l177_DUPLICATE_24df_return_output := UNARY_OP_NOT_uint1_t_uxn_c_l170_l177_DUPLICATE_24df_return_output;

     -- BIN_OP_PLUS[uxn_c_l160_c22_8c12] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l160_c22_8c12_left <= VAR_BIN_OP_PLUS_uxn_c_l160_c22_8c12_left;
     BIN_OP_PLUS_uxn_c_l160_c22_8c12_right <= VAR_BIN_OP_PLUS_uxn_c_l160_c22_8c12_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l160_c22_8c12_return_output := BIN_OP_PLUS_uxn_c_l160_c22_8c12_return_output;

     -- CAST_TO_uint24_t[uxn_c_l157_c81_345b] LATENCY=0
     VAR_CAST_TO_uint24_t_uxn_c_l157_c81_345b_return_output := CAST_TO_uint24_t_uint16_t(
     VAR_x_MUX_uxn_c_l136_c2_3b4f_return_output);

     -- Submodule level 7
     VAR_BIN_OP_OR_uxn_c_l177_c3_f0fc_left := VAR_BIN_OP_AND_uxn_c_l164_c19_78ef_return_output;
     VAR_MUX_uxn_c_l176_c3_68a1_cond := VAR_BIN_OP_AND_uxn_c_l164_c19_78ef_return_output;
     REG_VAR_is_fill_pixel1 := VAR_BIN_OP_AND_uxn_c_l164_c19_78ef_return_output;
     VAR_MUX_uxn_c_l159_c18_3508_cond := VAR_BIN_OP_EQ_uxn_c_l159_c18_6f3e_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l149_c28_0b13_left := VAR_BIN_OP_PLUS_uxn_c_l149_c28_abae_return_output;
     VAR_MUX_uxn_c_l160_c6_f848_iftrue := resize(VAR_BIN_OP_PLUS_uxn_c_l160_c22_8c12_return_output, 16);
     VAR_MUX_uxn_c_l161_c6_e20b_iffalse := resize(VAR_BIN_OP_PLUS_uxn_c_l161_c31_af50_return_output, 16);
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l157_c45_5d73_left := VAR_CAST_TO_uint24_t_uxn_c_l157_c45_cc2e_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l157_c45_9792_right := VAR_CAST_TO_uint24_t_uxn_c_l157_c81_345b_return_output;
     VAR_BIN_OP_AND_uxn_c_l163_c19_50e3_right := VAR_UNARY_OP_NOT_uxn_c_l163_c38_9f1c_return_output;
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l170_l177_DUPLICATE_d702_left := VAR_UNARY_OP_NOT_uint1_t_uxn_c_l170_l177_DUPLICATE_24df_return_output;
     -- BIN_OP_INFERRED_MULT[uxn_c_l157_c45_5d73] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_c_l157_c45_5d73_left <= VAR_BIN_OP_INFERRED_MULT_uxn_c_l157_c45_5d73_left;
     BIN_OP_INFERRED_MULT_uxn_c_l157_c45_5d73_right <= VAR_BIN_OP_INFERRED_MULT_uxn_c_l157_c45_5d73_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l157_c45_5d73_return_output := BIN_OP_INFERRED_MULT_uxn_c_l157_c45_5d73_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_c_l149_c28_0b13] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_c_l149_c28_0b13_left <= VAR_BIN_OP_INFERRED_MULT_uxn_c_l149_c28_0b13_left;
     BIN_OP_INFERRED_MULT_uxn_c_l149_c28_0b13_right <= VAR_BIN_OP_INFERRED_MULT_uxn_c_l149_c28_0b13_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l149_c28_0b13_return_output := BIN_OP_INFERRED_MULT_uxn_c_l149_c28_0b13_return_output;

     -- BIN_OP_AND_uint1_t_uint1_t_uxn_c_l170_l177_DUPLICATE_d702 LATENCY=0
     -- Inputs
     BIN_OP_AND_uint1_t_uint1_t_uxn_c_l170_l177_DUPLICATE_d702_left <= VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l170_l177_DUPLICATE_d702_left;
     BIN_OP_AND_uint1_t_uint1_t_uxn_c_l170_l177_DUPLICATE_d702_right <= VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l170_l177_DUPLICATE_d702_right;
     -- Outputs
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l170_l177_DUPLICATE_d702_return_output := BIN_OP_AND_uint1_t_uint1_t_uxn_c_l170_l177_DUPLICATE_d702_return_output;

     -- MUX[uxn_c_l159_c18_3508] LATENCY=0
     -- Inputs
     MUX_uxn_c_l159_c18_3508_cond <= VAR_MUX_uxn_c_l159_c18_3508_cond;
     MUX_uxn_c_l159_c18_3508_iftrue <= VAR_MUX_uxn_c_l159_c18_3508_iftrue;
     MUX_uxn_c_l159_c18_3508_iffalse <= VAR_MUX_uxn_c_l159_c18_3508_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l159_c18_3508_return_output := MUX_uxn_c_l159_c18_3508_return_output;

     -- MUX[uxn_c_l176_c3_68a1] LATENCY=0
     -- Inputs
     MUX_uxn_c_l176_c3_68a1_cond <= VAR_MUX_uxn_c_l176_c3_68a1_cond;
     MUX_uxn_c_l176_c3_68a1_iftrue <= VAR_MUX_uxn_c_l176_c3_68a1_iftrue;
     MUX_uxn_c_l176_c3_68a1_iffalse <= VAR_MUX_uxn_c_l176_c3_68a1_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l176_c3_68a1_return_output := MUX_uxn_c_l176_c3_68a1_return_output;

     -- BIN_OP_AND[uxn_c_l163_c19_50e3] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l163_c19_50e3_left <= VAR_BIN_OP_AND_uxn_c_l163_c19_50e3_left;
     BIN_OP_AND_uxn_c_l163_c19_50e3_right <= VAR_BIN_OP_AND_uxn_c_l163_c19_50e3_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l163_c19_50e3_return_output := BIN_OP_AND_uxn_c_l163_c19_50e3_return_output;

     -- Submodule level 8
     VAR_BIN_OP_OR_uxn_c_l170_c3_5559_left := VAR_BIN_OP_AND_uxn_c_l163_c19_50e3_return_output;
     VAR_MUX_uxn_c_l169_c3_000b_cond := VAR_BIN_OP_AND_uxn_c_l163_c19_50e3_return_output;
     REG_VAR_is_fill_pixel0 := VAR_BIN_OP_AND_uxn_c_l163_c19_50e3_return_output;
     VAR_BIN_OP_AND_uxn_c_l170_c22_4ccb_left := VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l170_l177_DUPLICATE_d702_return_output;
     VAR_BIN_OP_AND_uxn_c_l177_c22_73bf_left := VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l170_l177_DUPLICATE_d702_return_output;
     VAR_fill_pixels_remaining_uxn_c_l149_c3_60cb := resize(VAR_BIN_OP_INFERRED_MULT_uxn_c_l149_c28_0b13_return_output, 24);
     VAR_BIN_OP_PLUS_uxn_c_l157_c45_9792_left := VAR_BIN_OP_INFERRED_MULT_uxn_c_l157_c45_5d73_return_output;
     VAR_MUX_uxn_c_l160_c6_f848_cond := VAR_MUX_uxn_c_l159_c18_3508_return_output;
     VAR_MUX_uxn_c_l161_c6_e20b_cond := VAR_MUX_uxn_c_l159_c18_3508_return_output;
     REG_VAR_is_fill_left := VAR_MUX_uxn_c_l159_c18_3508_return_output;
     VAR_fg_vram_update_uxn_c_l173_c19_2348_write_value := VAR_MUX_uxn_c_l176_c3_68a1_return_output;
     VAR_fill_pixels_remaining_MUX_uxn_c_l136_c2_3b4f_iftrue := VAR_fill_pixels_remaining_uxn_c_l149_c3_60cb;
     -- BIN_OP_AND[uxn_c_l170_c22_4ccb] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l170_c22_4ccb_left <= VAR_BIN_OP_AND_uxn_c_l170_c22_4ccb_left;
     BIN_OP_AND_uxn_c_l170_c22_4ccb_right <= VAR_BIN_OP_AND_uxn_c_l170_c22_4ccb_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l170_c22_4ccb_return_output := BIN_OP_AND_uxn_c_l170_c22_4ccb_return_output;

     -- BIN_OP_AND[uxn_c_l177_c22_73bf] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l177_c22_73bf_left <= VAR_BIN_OP_AND_uxn_c_l177_c22_73bf_left;
     BIN_OP_AND_uxn_c_l177_c22_73bf_right <= VAR_BIN_OP_AND_uxn_c_l177_c22_73bf_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l177_c22_73bf_return_output := BIN_OP_AND_uxn_c_l177_c22_73bf_return_output;

     -- fill_pixels_remaining_MUX[uxn_c_l136_c2_3b4f] LATENCY=0
     -- Inputs
     fill_pixels_remaining_MUX_uxn_c_l136_c2_3b4f_cond <= VAR_fill_pixels_remaining_MUX_uxn_c_l136_c2_3b4f_cond;
     fill_pixels_remaining_MUX_uxn_c_l136_c2_3b4f_iftrue <= VAR_fill_pixels_remaining_MUX_uxn_c_l136_c2_3b4f_iftrue;
     fill_pixels_remaining_MUX_uxn_c_l136_c2_3b4f_iffalse <= VAR_fill_pixels_remaining_MUX_uxn_c_l136_c2_3b4f_iffalse;
     -- Outputs
     VAR_fill_pixels_remaining_MUX_uxn_c_l136_c2_3b4f_return_output := fill_pixels_remaining_MUX_uxn_c_l136_c2_3b4f_return_output;

     -- MUX[uxn_c_l169_c3_000b] LATENCY=0
     -- Inputs
     MUX_uxn_c_l169_c3_000b_cond <= VAR_MUX_uxn_c_l169_c3_000b_cond;
     MUX_uxn_c_l169_c3_000b_iftrue <= VAR_MUX_uxn_c_l169_c3_000b_iftrue;
     MUX_uxn_c_l169_c3_000b_iffalse <= VAR_MUX_uxn_c_l169_c3_000b_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l169_c3_000b_return_output := MUX_uxn_c_l169_c3_000b_return_output;

     -- MUX[uxn_c_l160_c6_f848] LATENCY=0
     -- Inputs
     MUX_uxn_c_l160_c6_f848_cond <= VAR_MUX_uxn_c_l160_c6_f848_cond;
     MUX_uxn_c_l160_c6_f848_iftrue <= VAR_MUX_uxn_c_l160_c6_f848_iftrue;
     MUX_uxn_c_l160_c6_f848_iffalse <= VAR_MUX_uxn_c_l160_c6_f848_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l160_c6_f848_return_output := MUX_uxn_c_l160_c6_f848_return_output;

     -- BIN_OP_PLUS[uxn_c_l157_c45_9792] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l157_c45_9792_left <= VAR_BIN_OP_PLUS_uxn_c_l157_c45_9792_left;
     BIN_OP_PLUS_uxn_c_l157_c45_9792_right <= VAR_BIN_OP_PLUS_uxn_c_l157_c45_9792_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l157_c45_9792_return_output := BIN_OP_PLUS_uxn_c_l157_c45_9792_return_output;

     -- MUX[uxn_c_l161_c6_e20b] LATENCY=0
     -- Inputs
     MUX_uxn_c_l161_c6_e20b_cond <= VAR_MUX_uxn_c_l161_c6_e20b_cond;
     MUX_uxn_c_l161_c6_e20b_iftrue <= VAR_MUX_uxn_c_l161_c6_e20b_iftrue;
     MUX_uxn_c_l161_c6_e20b_iffalse <= VAR_MUX_uxn_c_l161_c6_e20b_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l161_c6_e20b_return_output := MUX_uxn_c_l161_c6_e20b_return_output;

     -- Submodule level 9
     VAR_BIN_OP_OR_uxn_c_l170_c3_5559_right := VAR_BIN_OP_AND_uxn_c_l170_c22_4ccb_return_output;
     VAR_BIN_OP_OR_uxn_c_l177_c3_f0fc_right := VAR_BIN_OP_AND_uxn_c_l177_c22_73bf_return_output;
     VAR_MUX_uxn_c_l157_c26_3bb0_iftrue := resize(VAR_BIN_OP_PLUS_uxn_c_l157_c45_9792_return_output, 24);
     REG_VAR_y := VAR_MUX_uxn_c_l160_c6_f848_return_output;
     REG_VAR_x := VAR_MUX_uxn_c_l161_c6_e20b_return_output;
     VAR_bg_vram_update_uxn_c_l166_c19_4254_write_value := VAR_MUX_uxn_c_l169_c3_000b_return_output;
     VAR_BIN_OP_MINUS_uxn_c_l180_c43_3b74_left := VAR_fill_pixels_remaining_MUX_uxn_c_l136_c2_3b4f_return_output;
     -- MUX[uxn_c_l157_c26_3bb0] LATENCY=0
     -- Inputs
     MUX_uxn_c_l157_c26_3bb0_cond <= VAR_MUX_uxn_c_l157_c26_3bb0_cond;
     MUX_uxn_c_l157_c26_3bb0_iftrue <= VAR_MUX_uxn_c_l157_c26_3bb0_iftrue;
     MUX_uxn_c_l157_c26_3bb0_iffalse <= VAR_MUX_uxn_c_l157_c26_3bb0_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l157_c26_3bb0_return_output := MUX_uxn_c_l157_c26_3bb0_return_output;

     -- BIN_OP_OR[uxn_c_l177_c3_f0fc] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l177_c3_f0fc_left <= VAR_BIN_OP_OR_uxn_c_l177_c3_f0fc_left;
     BIN_OP_OR_uxn_c_l177_c3_f0fc_right <= VAR_BIN_OP_OR_uxn_c_l177_c3_f0fc_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l177_c3_f0fc_return_output := BIN_OP_OR_uxn_c_l177_c3_f0fc_return_output;

     -- BIN_OP_MINUS[uxn_c_l180_c43_3b74] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l180_c43_3b74_left <= VAR_BIN_OP_MINUS_uxn_c_l180_c43_3b74_left;
     BIN_OP_MINUS_uxn_c_l180_c43_3b74_right <= VAR_BIN_OP_MINUS_uxn_c_l180_c43_3b74_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l180_c43_3b74_return_output := BIN_OP_MINUS_uxn_c_l180_c43_3b74_return_output;

     -- BIN_OP_OR[uxn_c_l170_c3_5559] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l170_c3_5559_left <= VAR_BIN_OP_OR_uxn_c_l170_c3_5559_left;
     BIN_OP_OR_uxn_c_l170_c3_5559_right <= VAR_BIN_OP_OR_uxn_c_l170_c3_5559_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l170_c3_5559_return_output := BIN_OP_OR_uxn_c_l170_c3_5559_return_output;

     -- Submodule level 10
     VAR_MUX_uxn_c_l180_c26_8094_iftrue := VAR_BIN_OP_MINUS_uxn_c_l180_c43_3b74_return_output;
     VAR_bg_vram_update_uxn_c_l166_c19_4254_write_enable := VAR_BIN_OP_OR_uxn_c_l170_c3_5559_return_output;
     VAR_fg_vram_update_uxn_c_l173_c19_2348_write_enable := VAR_BIN_OP_OR_uxn_c_l177_c3_f0fc_return_output;
     REG_VAR_adjusted_vram_address := VAR_MUX_uxn_c_l157_c26_3bb0_return_output;
     VAR_bg_vram_update_uxn_c_l166_c19_4254_write_address := VAR_MUX_uxn_c_l157_c26_3bb0_return_output;
     VAR_fg_vram_update_uxn_c_l173_c19_2348_write_address := VAR_MUX_uxn_c_l157_c26_3bb0_return_output;
     -- fg_vram_update[uxn_c_l173_c19_2348] LATENCY=0
     -- Clock enable
     fg_vram_update_uxn_c_l173_c19_2348_CLOCK_ENABLE <= VAR_fg_vram_update_uxn_c_l173_c19_2348_CLOCK_ENABLE;
     -- Inputs
     fg_vram_update_uxn_c_l173_c19_2348_read_address <= VAR_fg_vram_update_uxn_c_l173_c19_2348_read_address;
     fg_vram_update_uxn_c_l173_c19_2348_write_address <= VAR_fg_vram_update_uxn_c_l173_c19_2348_write_address;
     fg_vram_update_uxn_c_l173_c19_2348_write_value <= VAR_fg_vram_update_uxn_c_l173_c19_2348_write_value;
     fg_vram_update_uxn_c_l173_c19_2348_write_enable <= VAR_fg_vram_update_uxn_c_l173_c19_2348_write_enable;
     -- Outputs
     VAR_fg_vram_update_uxn_c_l173_c19_2348_return_output := fg_vram_update_uxn_c_l173_c19_2348_return_output;

     -- bg_vram_update[uxn_c_l166_c19_4254] LATENCY=0
     -- Clock enable
     bg_vram_update_uxn_c_l166_c19_4254_CLOCK_ENABLE <= VAR_bg_vram_update_uxn_c_l166_c19_4254_CLOCK_ENABLE;
     -- Inputs
     bg_vram_update_uxn_c_l166_c19_4254_read_address <= VAR_bg_vram_update_uxn_c_l166_c19_4254_read_address;
     bg_vram_update_uxn_c_l166_c19_4254_write_address <= VAR_bg_vram_update_uxn_c_l166_c19_4254_write_address;
     bg_vram_update_uxn_c_l166_c19_4254_write_value <= VAR_bg_vram_update_uxn_c_l166_c19_4254_write_value;
     bg_vram_update_uxn_c_l166_c19_4254_write_enable <= VAR_bg_vram_update_uxn_c_l166_c19_4254_write_enable;
     -- Outputs
     VAR_bg_vram_update_uxn_c_l166_c19_4254_return_output := bg_vram_update_uxn_c_l166_c19_4254_return_output;

     -- MUX[uxn_c_l180_c26_8094] LATENCY=0
     -- Inputs
     MUX_uxn_c_l180_c26_8094_cond <= VAR_MUX_uxn_c_l180_c26_8094_cond;
     MUX_uxn_c_l180_c26_8094_iftrue <= VAR_MUX_uxn_c_l180_c26_8094_iftrue;
     MUX_uxn_c_l180_c26_8094_iffalse <= VAR_MUX_uxn_c_l180_c26_8094_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l180_c26_8094_return_output := MUX_uxn_c_l180_c26_8094_return_output;

     -- Submodule level 11
     VAR_BIN_OP_EQ_uxn_c_l181_c19_eb1d_left := VAR_MUX_uxn_c_l180_c26_8094_return_output;
     REG_VAR_fill_pixels_remaining := VAR_MUX_uxn_c_l180_c26_8094_return_output;
     VAR_MUX_uxn_c_l184_c17_1120_iftrue := VAR_bg_vram_update_uxn_c_l166_c19_4254_return_output;
     REG_VAR_bg_pixel_color := VAR_bg_vram_update_uxn_c_l166_c19_4254_return_output;
     VAR_BIN_OP_EQ_uxn_c_l184_c17_6469_left := VAR_fg_vram_update_uxn_c_l173_c19_2348_return_output;
     VAR_MUX_uxn_c_l184_c17_1120_iffalse := VAR_fg_vram_update_uxn_c_l173_c19_2348_return_output;
     REG_VAR_fg_pixel_color := VAR_fg_vram_update_uxn_c_l173_c19_2348_return_output;
     -- BIN_OP_EQ[uxn_c_l181_c19_eb1d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l181_c19_eb1d_left <= VAR_BIN_OP_EQ_uxn_c_l181_c19_eb1d_left;
     BIN_OP_EQ_uxn_c_l181_c19_eb1d_right <= VAR_BIN_OP_EQ_uxn_c_l181_c19_eb1d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l181_c19_eb1d_return_output := BIN_OP_EQ_uxn_c_l181_c19_eb1d_return_output;

     -- BIN_OP_EQ[uxn_c_l184_c17_6469] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l184_c17_6469_left <= VAR_BIN_OP_EQ_uxn_c_l184_c17_6469_left;
     BIN_OP_EQ_uxn_c_l184_c17_6469_right <= VAR_BIN_OP_EQ_uxn_c_l184_c17_6469_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l184_c17_6469_return_output := BIN_OP_EQ_uxn_c_l184_c17_6469_return_output;

     -- Submodule level 12
     VAR_MUX_uxn_c_l181_c19_78b6_cond := VAR_BIN_OP_EQ_uxn_c_l181_c19_eb1d_return_output;
     VAR_MUX_uxn_c_l184_c17_1120_cond := VAR_BIN_OP_EQ_uxn_c_l184_c17_6469_return_output;
     -- MUX[uxn_c_l184_c17_1120] LATENCY=0
     -- Inputs
     MUX_uxn_c_l184_c17_1120_cond <= VAR_MUX_uxn_c_l184_c17_1120_cond;
     MUX_uxn_c_l184_c17_1120_iftrue <= VAR_MUX_uxn_c_l184_c17_1120_iftrue;
     MUX_uxn_c_l184_c17_1120_iffalse <= VAR_MUX_uxn_c_l184_c17_1120_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l184_c17_1120_return_output := MUX_uxn_c_l184_c17_1120_return_output;

     -- MUX[uxn_c_l181_c19_78b6] LATENCY=0
     -- Inputs
     MUX_uxn_c_l181_c19_78b6_cond <= VAR_MUX_uxn_c_l181_c19_78b6_cond;
     MUX_uxn_c_l181_c19_78b6_iftrue <= VAR_MUX_uxn_c_l181_c19_78b6_iftrue;
     MUX_uxn_c_l181_c19_78b6_iffalse <= VAR_MUX_uxn_c_l181_c19_78b6_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l181_c19_78b6_return_output := MUX_uxn_c_l181_c19_78b6_return_output;

     -- Submodule level 13
     REG_VAR_is_fill_active := VAR_MUX_uxn_c_l181_c19_78b6_return_output;
     -- CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_269d_uxn_c_l187_l117_DUPLICATE_fe86 LATENCY=0
     VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_269d_uxn_c_l187_l117_DUPLICATE_fe86_return_output := CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_269d(
     VAR_MUX_uxn_c_l183_c25_8de0_return_output,
     VAR_MUX_uxn_c_l184_c17_1120_return_output,
     VAR_MUX_uxn_c_l181_c19_78b6_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_269d_uxn_c_l187_l117_DUPLICATE_fe86_return_output;
     VAR_return_output := VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_269d_uxn_c_l187_l117_DUPLICATE_fe86_return_output;
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
