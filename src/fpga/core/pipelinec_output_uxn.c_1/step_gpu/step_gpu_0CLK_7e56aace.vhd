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
-- Submodules: 67
entity step_gpu_0CLK_7e56aace is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 is_active_drawing_area : in unsigned(0 downto 0);
 is_vram_write : in unsigned(0 downto 0);
 vram_write_layer : in unsigned(0 downto 0);
 vram_address : in unsigned(15 downto 0);
 vram_value : in unsigned(7 downto 0);
 return_output : out gpu_step_result_t);
end step_gpu_0CLK_7e56aace;
architecture arch of step_gpu_0CLK_7e56aace is
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
signal adjusted_vram_address : unsigned(15 downto 0) := to_unsigned(0, 16);
signal fill_pixels_remaining : unsigned(15 downto 0) := to_unsigned(0, 16);
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
signal pixel_counter : unsigned(15 downto 0) := to_unsigned(0, 16);
signal x : unsigned(15 downto 0) := to_unsigned(0, 16);
signal y : unsigned(15 downto 0) := to_unsigned(0, 16);
signal REG_COMB_result : gpu_step_result_t;
signal REG_COMB_adjusted_vram_address : unsigned(15 downto 0);
signal REG_COMB_fill_pixels_remaining : unsigned(15 downto 0);
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
signal REG_COMB_pixel_counter : unsigned(15 downto 0);
signal REG_COMB_x : unsigned(15 downto 0);
signal REG_COMB_y : unsigned(15 downto 0);

-- Each function instance gets signals
-- CONST_SR_4[uxn_c_l129_c44_fe30]
signal CONST_SR_4_uxn_c_l129_c44_fe30_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_c_l129_c44_fe30_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_c_l129_c17_dc7e]
signal BIN_OP_AND_uxn_c_l129_c17_dc7e_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l129_c17_dc7e_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l129_c17_dc7e_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_c_l132_c22_3a88]
signal UNARY_OP_NOT_uxn_c_l132_c22_3a88_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l132_c22_3a88_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l132_c6_1fef]
signal BIN_OP_AND_uxn_c_l132_c6_1fef_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l132_c6_1fef_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l132_c6_1fef_return_output : unsigned(0 downto 0);

-- is_fill_active_MUX[uxn_c_l132_c2_8574]
signal is_fill_active_MUX_uxn_c_l132_c2_8574_cond : unsigned(0 downto 0);
signal is_fill_active_MUX_uxn_c_l132_c2_8574_iftrue : unsigned(0 downto 0);
signal is_fill_active_MUX_uxn_c_l132_c2_8574_iffalse : unsigned(0 downto 0);
signal is_fill_active_MUX_uxn_c_l132_c2_8574_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_c_l132_c2_8574]
signal y_MUX_uxn_c_l132_c2_8574_cond : unsigned(0 downto 0);
signal y_MUX_uxn_c_l132_c2_8574_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_c_l132_c2_8574_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_c_l132_c2_8574_return_output : unsigned(15 downto 0);

-- fill_pixels_remaining_MUX[uxn_c_l132_c2_8574]
signal fill_pixels_remaining_MUX_uxn_c_l132_c2_8574_cond : unsigned(0 downto 0);
signal fill_pixels_remaining_MUX_uxn_c_l132_c2_8574_iftrue : unsigned(15 downto 0);
signal fill_pixels_remaining_MUX_uxn_c_l132_c2_8574_iffalse : unsigned(15 downto 0);
signal fill_pixels_remaining_MUX_uxn_c_l132_c2_8574_return_output : unsigned(15 downto 0);

-- fill_y0_MUX[uxn_c_l132_c2_8574]
signal fill_y0_MUX_uxn_c_l132_c2_8574_cond : unsigned(0 downto 0);
signal fill_y0_MUX_uxn_c_l132_c2_8574_iftrue : unsigned(15 downto 0);
signal fill_y0_MUX_uxn_c_l132_c2_8574_iffalse : unsigned(15 downto 0);
signal fill_y0_MUX_uxn_c_l132_c2_8574_return_output : unsigned(15 downto 0);

-- fill_y1_MUX[uxn_c_l132_c2_8574]
signal fill_y1_MUX_uxn_c_l132_c2_8574_cond : unsigned(0 downto 0);
signal fill_y1_MUX_uxn_c_l132_c2_8574_iftrue : unsigned(15 downto 0);
signal fill_y1_MUX_uxn_c_l132_c2_8574_iffalse : unsigned(15 downto 0);
signal fill_y1_MUX_uxn_c_l132_c2_8574_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_c_l132_c2_8574]
signal x_MUX_uxn_c_l132_c2_8574_cond : unsigned(0 downto 0);
signal x_MUX_uxn_c_l132_c2_8574_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_c_l132_c2_8574_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_c_l132_c2_8574_return_output : unsigned(15 downto 0);

-- fill_x0_MUX[uxn_c_l132_c2_8574]
signal fill_x0_MUX_uxn_c_l132_c2_8574_cond : unsigned(0 downto 0);
signal fill_x0_MUX_uxn_c_l132_c2_8574_iftrue : unsigned(15 downto 0);
signal fill_x0_MUX_uxn_c_l132_c2_8574_iffalse : unsigned(15 downto 0);
signal fill_x0_MUX_uxn_c_l132_c2_8574_return_output : unsigned(15 downto 0);

-- fill_x1_MUX[uxn_c_l132_c2_8574]
signal fill_x1_MUX_uxn_c_l132_c2_8574_cond : unsigned(0 downto 0);
signal fill_x1_MUX_uxn_c_l132_c2_8574_iftrue : unsigned(15 downto 0);
signal fill_x1_MUX_uxn_c_l132_c2_8574_iffalse : unsigned(15 downto 0);
signal fill_x1_MUX_uxn_c_l132_c2_8574_return_output : unsigned(15 downto 0);

-- fill_color_MUX[uxn_c_l132_c2_8574]
signal fill_color_MUX_uxn_c_l132_c2_8574_cond : unsigned(0 downto 0);
signal fill_color_MUX_uxn_c_l132_c2_8574_iftrue : unsigned(1 downto 0);
signal fill_color_MUX_uxn_c_l132_c2_8574_iffalse : unsigned(1 downto 0);
signal fill_color_MUX_uxn_c_l132_c2_8574_return_output : unsigned(1 downto 0);

-- is_fill_top_MUX[uxn_c_l132_c2_8574]
signal is_fill_top_MUX_uxn_c_l132_c2_8574_cond : unsigned(0 downto 0);
signal is_fill_top_MUX_uxn_c_l132_c2_8574_iftrue : unsigned(0 downto 0);
signal is_fill_top_MUX_uxn_c_l132_c2_8574_iffalse : unsigned(0 downto 0);
signal is_fill_top_MUX_uxn_c_l132_c2_8574_return_output : unsigned(0 downto 0);

-- fill_layer_MUX[uxn_c_l132_c2_8574]
signal fill_layer_MUX_uxn_c_l132_c2_8574_cond : unsigned(0 downto 0);
signal fill_layer_MUX_uxn_c_l132_c2_8574_iftrue : unsigned(0 downto 0);
signal fill_layer_MUX_uxn_c_l132_c2_8574_iffalse : unsigned(0 downto 0);
signal fill_layer_MUX_uxn_c_l132_c2_8574_return_output : unsigned(0 downto 0);

-- CONST_SR_2[uxn_c_l134_c17_42bc]
signal CONST_SR_2_uxn_c_l134_c17_42bc_x : unsigned(7 downto 0);
signal CONST_SR_2_uxn_c_l134_c17_42bc_return_output : unsigned(7 downto 0);

-- CONST_SR_3[uxn_c_l135_c18_75e4]
signal CONST_SR_3_uxn_c_l135_c18_75e4_x : unsigned(7 downto 0);
signal CONST_SR_3_uxn_c_l135_c18_75e4_return_output : unsigned(7 downto 0);

-- BIN_OP_DIV[uxn_c_l136_c13_33a4]
signal BIN_OP_DIV_uxn_c_l136_c13_33a4_left : unsigned(15 downto 0);
signal BIN_OP_DIV_uxn_c_l136_c13_33a4_right : unsigned(8 downto 0);
signal BIN_OP_DIV_uxn_c_l136_c13_33a4_return_output : unsigned(15 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_c_l137_c29_c0f2]
signal BIN_OP_INFERRED_MULT_uxn_c_l137_c29_c0f2_left : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_c_l137_c29_c0f2_right : unsigned(8 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_c_l137_c29_c0f2_return_output : unsigned(24 downto 0);

-- BIN_OP_MINUS[uxn_c_l137_c13_8441]
signal BIN_OP_MINUS_uxn_c_l137_c13_8441_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_c_l137_c13_8441_right : unsigned(24 downto 0);
signal BIN_OP_MINUS_uxn_c_l137_c13_8441_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l138_c13_94c4]
signal MUX_uxn_c_l138_c13_94c4_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l138_c13_94c4_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l138_c13_94c4_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l138_c13_94c4_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l139_c13_5dd9]
signal MUX_uxn_c_l139_c13_5dd9_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l139_c13_5dd9_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l139_c13_5dd9_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l139_c13_5dd9_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l140_c13_2842]
signal MUX_uxn_c_l140_c13_2842_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l140_c13_2842_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l140_c13_2842_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l140_c13_2842_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l141_c13_a0ee]
signal MUX_uxn_c_l141_c13_a0ee_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l141_c13_a0ee_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l141_c13_a0ee_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l141_c13_a0ee_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_c_l144_c28_4948]
signal BIN_OP_MINUS_uxn_c_l144_c28_4948_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_c_l144_c28_4948_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_c_l144_c28_4948_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_c_l144_c28_2bd7]
signal BIN_OP_PLUS_uxn_c_l144_c28_2bd7_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l144_c28_2bd7_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l144_c28_2bd7_return_output : unsigned(16 downto 0);

-- BIN_OP_MINUS[uxn_c_l144_c54_fef7]
signal BIN_OP_MINUS_uxn_c_l144_c54_fef7_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_c_l144_c54_fef7_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_c_l144_c54_fef7_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_c_l144_c54_5871]
signal BIN_OP_PLUS_uxn_c_l144_c54_5871_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l144_c54_5871_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l144_c54_5871_return_output : unsigned(16 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_c_l144_c28_31ce]
signal BIN_OP_INFERRED_MULT_uxn_c_l144_c28_31ce_left : unsigned(16 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_c_l144_c28_31ce_right : unsigned(16 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_c_l144_c28_31ce_return_output : unsigned(33 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_c_l152_c45_854e]
signal BIN_OP_INFERRED_MULT_uxn_c_l152_c45_854e_left : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_c_l152_c45_854e_right : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_c_l152_c45_854e_return_output : unsigned(31 downto 0);

-- BIN_OP_PLUS[uxn_c_l152_c45_1b28]
signal BIN_OP_PLUS_uxn_c_l152_c45_1b28_left : unsigned(31 downto 0);
signal BIN_OP_PLUS_uxn_c_l152_c45_1b28_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l152_c45_1b28_return_output : unsigned(32 downto 0);

-- MUX[uxn_c_l152_c26_d61c]
signal MUX_uxn_c_l152_c26_d61c_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l152_c26_d61c_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l152_c26_d61c_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l152_c26_d61c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l154_c18_a013]
signal BIN_OP_EQ_uxn_c_l154_c18_a013_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l154_c18_a013_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l154_c18_a013_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l154_c18_fb32]
signal MUX_uxn_c_l154_c18_fb32_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l154_c18_fb32_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l154_c18_fb32_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l154_c18_fb32_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l155_c22_287c]
signal BIN_OP_PLUS_uxn_c_l155_c22_287c_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l155_c22_287c_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l155_c22_287c_return_output : unsigned(16 downto 0);

-- MUX[uxn_c_l155_c6_3ba3]
signal MUX_uxn_c_l155_c6_3ba3_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l155_c6_3ba3_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l155_c6_3ba3_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l155_c6_3ba3_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_c_l156_c31_6c2e]
signal BIN_OP_PLUS_uxn_c_l156_c31_6c2e_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l156_c31_6c2e_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l156_c31_6c2e_return_output : unsigned(16 downto 0);

-- MUX[uxn_c_l156_c6_e29c]
signal MUX_uxn_c_l156_c6_e29c_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l156_c6_e29c_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l156_c6_e29c_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l156_c6_e29c_return_output : unsigned(15 downto 0);

-- UNARY_OP_NOT[uxn_c_l158_c38_5ef6]
signal UNARY_OP_NOT_uxn_c_l158_c38_5ef6_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l158_c38_5ef6_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l158_c19_1b9f]
signal BIN_OP_AND_uxn_c_l158_c19_1b9f_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l158_c19_1b9f_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l158_c19_1b9f_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l159_c19_5de0]
signal BIN_OP_AND_uxn_c_l159_c19_5de0_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l159_c19_5de0_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l159_c19_5de0_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l164_c3_fa12]
signal MUX_uxn_c_l164_c3_fa12_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l164_c3_fa12_iftrue : unsigned(1 downto 0);
signal MUX_uxn_c_l164_c3_fa12_iffalse : unsigned(1 downto 0);
signal MUX_uxn_c_l164_c3_fa12_return_output : unsigned(1 downto 0);

-- UNARY_OP_NOT[uxn_c_l165_c57_3c01]
signal UNARY_OP_NOT_uxn_c_l165_c57_3c01_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l165_c57_3c01_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l165_c22_479b]
signal BIN_OP_AND_uxn_c_l165_c22_479b_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l165_c22_479b_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l165_c22_479b_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_c_l165_c3_caa7]
signal BIN_OP_OR_uxn_c_l165_c3_caa7_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l165_c3_caa7_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l165_c3_caa7_return_output : unsigned(0 downto 0);

-- bg_vram_update[uxn_c_l161_c19_0a9c]
signal bg_vram_update_uxn_c_l161_c19_0a9c_CLOCK_ENABLE : unsigned(0 downto 0);
signal bg_vram_update_uxn_c_l161_c19_0a9c_read_address : unsigned(15 downto 0);
signal bg_vram_update_uxn_c_l161_c19_0a9c_write_address : unsigned(15 downto 0);
signal bg_vram_update_uxn_c_l161_c19_0a9c_write_value : unsigned(1 downto 0);
signal bg_vram_update_uxn_c_l161_c19_0a9c_write_enable : unsigned(0 downto 0);
signal bg_vram_update_uxn_c_l161_c19_0a9c_return_output : unsigned(1 downto 0);

-- MUX[uxn_c_l171_c3_18c9]
signal MUX_uxn_c_l171_c3_18c9_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l171_c3_18c9_iftrue : unsigned(1 downto 0);
signal MUX_uxn_c_l171_c3_18c9_iffalse : unsigned(1 downto 0);
signal MUX_uxn_c_l171_c3_18c9_return_output : unsigned(1 downto 0);

-- BIN_OP_AND[uxn_c_l172_c22_6539]
signal BIN_OP_AND_uxn_c_l172_c22_6539_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l172_c22_6539_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l172_c22_6539_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_c_l172_c3_f6a2]
signal BIN_OP_OR_uxn_c_l172_c3_f6a2_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l172_c3_f6a2_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l172_c3_f6a2_return_output : unsigned(0 downto 0);

-- fg_vram_update[uxn_c_l168_c19_2417]
signal fg_vram_update_uxn_c_l168_c19_2417_CLOCK_ENABLE : unsigned(0 downto 0);
signal fg_vram_update_uxn_c_l168_c19_2417_read_address : unsigned(15 downto 0);
signal fg_vram_update_uxn_c_l168_c19_2417_write_address : unsigned(15 downto 0);
signal fg_vram_update_uxn_c_l168_c19_2417_write_value : unsigned(1 downto 0);
signal fg_vram_update_uxn_c_l168_c19_2417_write_enable : unsigned(0 downto 0);
signal fg_vram_update_uxn_c_l168_c19_2417_return_output : unsigned(1 downto 0);

-- BIN_OP_MINUS[uxn_c_l175_c43_b5e5]
signal BIN_OP_MINUS_uxn_c_l175_c43_b5e5_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_c_l175_c43_b5e5_right : unsigned(0 downto 0);
signal BIN_OP_MINUS_uxn_c_l175_c43_b5e5_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l175_c26_f10c]
signal MUX_uxn_c_l175_c26_f10c_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l175_c26_f10c_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l175_c26_f10c_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l175_c26_f10c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l176_c19_f9a5]
signal BIN_OP_EQ_uxn_c_l176_c19_f9a5_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l176_c19_f9a5_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l176_c19_f9a5_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l176_c19_92eb]
signal MUX_uxn_c_l176_c19_92eb_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l176_c19_92eb_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l176_c19_92eb_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l176_c19_92eb_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l177_c19_c19a]
signal BIN_OP_EQ_uxn_c_l177_c19_c19a_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l177_c19_c19a_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l177_c19_c19a_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l177_c76_18a0]
signal BIN_OP_PLUS_uxn_c_l177_c76_18a0_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l177_c76_18a0_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l177_c76_18a0_return_output : unsigned(16 downto 0);

-- MUX[uxn_c_l177_c50_9e5f]
signal MUX_uxn_c_l177_c50_9e5f_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l177_c50_9e5f_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l177_c50_9e5f_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l177_c50_9e5f_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l177_c19_5195]
signal MUX_uxn_c_l177_c19_5195_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l177_c19_5195_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l177_c19_5195_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l177_c19_5195_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l178_c25_6432]
signal BIN_OP_EQ_uxn_c_l178_c25_6432_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l178_c25_6432_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l178_c25_6432_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l178_c25_c6a4]
signal MUX_uxn_c_l178_c25_c6a4_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l178_c25_c6a4_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l178_c25_c6a4_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l178_c25_c6a4_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l179_c17_55be]
signal BIN_OP_EQ_uxn_c_l179_c17_55be_left : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l179_c17_55be_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l179_c17_55be_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l179_c17_1079]
signal MUX_uxn_c_l179_c17_1079_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l179_c17_1079_iftrue : unsigned(1 downto 0);
signal MUX_uxn_c_l179_c17_1079_iffalse : unsigned(1 downto 0);
signal MUX_uxn_c_l179_c17_1079_return_output : unsigned(1 downto 0);

-- UNARY_OP_NOT_uint1_t_uxn_c_l165_l172_DUPLICATE_6d86
signal UNARY_OP_NOT_uint1_t_uxn_c_l165_l172_DUPLICATE_6d86_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uint1_t_uxn_c_l165_l172_DUPLICATE_6d86_return_output : unsigned(0 downto 0);

-- BIN_OP_AND_uint1_t_uint1_t_uxn_c_l172_l165_DUPLICATE_0941
signal BIN_OP_AND_uint1_t_uint1_t_uxn_c_l172_l165_DUPLICATE_0941_left : unsigned(0 downto 0);
signal BIN_OP_AND_uint1_t_uint1_t_uxn_c_l172_l165_DUPLICATE_0941_right : unsigned(0 downto 0);
signal BIN_OP_AND_uint1_t_uint1_t_uxn_c_l172_l165_DUPLICATE_0941_return_output : unsigned(0 downto 0);

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
-- CONST_SR_4_uxn_c_l129_c44_fe30
CONST_SR_4_uxn_c_l129_c44_fe30 : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_c_l129_c44_fe30_x,
CONST_SR_4_uxn_c_l129_c44_fe30_return_output);

-- BIN_OP_AND_uxn_c_l129_c17_dc7e
BIN_OP_AND_uxn_c_l129_c17_dc7e : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l129_c17_dc7e_left,
BIN_OP_AND_uxn_c_l129_c17_dc7e_right,
BIN_OP_AND_uxn_c_l129_c17_dc7e_return_output);

-- UNARY_OP_NOT_uxn_c_l132_c22_3a88
UNARY_OP_NOT_uxn_c_l132_c22_3a88 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l132_c22_3a88_expr,
UNARY_OP_NOT_uxn_c_l132_c22_3a88_return_output);

-- BIN_OP_AND_uxn_c_l132_c6_1fef
BIN_OP_AND_uxn_c_l132_c6_1fef : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l132_c6_1fef_left,
BIN_OP_AND_uxn_c_l132_c6_1fef_right,
BIN_OP_AND_uxn_c_l132_c6_1fef_return_output);

-- is_fill_active_MUX_uxn_c_l132_c2_8574
is_fill_active_MUX_uxn_c_l132_c2_8574 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_active_MUX_uxn_c_l132_c2_8574_cond,
is_fill_active_MUX_uxn_c_l132_c2_8574_iftrue,
is_fill_active_MUX_uxn_c_l132_c2_8574_iffalse,
is_fill_active_MUX_uxn_c_l132_c2_8574_return_output);

-- y_MUX_uxn_c_l132_c2_8574
y_MUX_uxn_c_l132_c2_8574 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_c_l132_c2_8574_cond,
y_MUX_uxn_c_l132_c2_8574_iftrue,
y_MUX_uxn_c_l132_c2_8574_iffalse,
y_MUX_uxn_c_l132_c2_8574_return_output);

-- fill_pixels_remaining_MUX_uxn_c_l132_c2_8574
fill_pixels_remaining_MUX_uxn_c_l132_c2_8574 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_pixels_remaining_MUX_uxn_c_l132_c2_8574_cond,
fill_pixels_remaining_MUX_uxn_c_l132_c2_8574_iftrue,
fill_pixels_remaining_MUX_uxn_c_l132_c2_8574_iffalse,
fill_pixels_remaining_MUX_uxn_c_l132_c2_8574_return_output);

-- fill_y0_MUX_uxn_c_l132_c2_8574
fill_y0_MUX_uxn_c_l132_c2_8574 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_y0_MUX_uxn_c_l132_c2_8574_cond,
fill_y0_MUX_uxn_c_l132_c2_8574_iftrue,
fill_y0_MUX_uxn_c_l132_c2_8574_iffalse,
fill_y0_MUX_uxn_c_l132_c2_8574_return_output);

-- fill_y1_MUX_uxn_c_l132_c2_8574
fill_y1_MUX_uxn_c_l132_c2_8574 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_y1_MUX_uxn_c_l132_c2_8574_cond,
fill_y1_MUX_uxn_c_l132_c2_8574_iftrue,
fill_y1_MUX_uxn_c_l132_c2_8574_iffalse,
fill_y1_MUX_uxn_c_l132_c2_8574_return_output);

-- x_MUX_uxn_c_l132_c2_8574
x_MUX_uxn_c_l132_c2_8574 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_c_l132_c2_8574_cond,
x_MUX_uxn_c_l132_c2_8574_iftrue,
x_MUX_uxn_c_l132_c2_8574_iffalse,
x_MUX_uxn_c_l132_c2_8574_return_output);

-- fill_x0_MUX_uxn_c_l132_c2_8574
fill_x0_MUX_uxn_c_l132_c2_8574 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_x0_MUX_uxn_c_l132_c2_8574_cond,
fill_x0_MUX_uxn_c_l132_c2_8574_iftrue,
fill_x0_MUX_uxn_c_l132_c2_8574_iffalse,
fill_x0_MUX_uxn_c_l132_c2_8574_return_output);

-- fill_x1_MUX_uxn_c_l132_c2_8574
fill_x1_MUX_uxn_c_l132_c2_8574 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_x1_MUX_uxn_c_l132_c2_8574_cond,
fill_x1_MUX_uxn_c_l132_c2_8574_iftrue,
fill_x1_MUX_uxn_c_l132_c2_8574_iffalse,
fill_x1_MUX_uxn_c_l132_c2_8574_return_output);

-- fill_color_MUX_uxn_c_l132_c2_8574
fill_color_MUX_uxn_c_l132_c2_8574 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
fill_color_MUX_uxn_c_l132_c2_8574_cond,
fill_color_MUX_uxn_c_l132_c2_8574_iftrue,
fill_color_MUX_uxn_c_l132_c2_8574_iffalse,
fill_color_MUX_uxn_c_l132_c2_8574_return_output);

-- is_fill_top_MUX_uxn_c_l132_c2_8574
is_fill_top_MUX_uxn_c_l132_c2_8574 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_top_MUX_uxn_c_l132_c2_8574_cond,
is_fill_top_MUX_uxn_c_l132_c2_8574_iftrue,
is_fill_top_MUX_uxn_c_l132_c2_8574_iffalse,
is_fill_top_MUX_uxn_c_l132_c2_8574_return_output);

-- fill_layer_MUX_uxn_c_l132_c2_8574
fill_layer_MUX_uxn_c_l132_c2_8574 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
fill_layer_MUX_uxn_c_l132_c2_8574_cond,
fill_layer_MUX_uxn_c_l132_c2_8574_iftrue,
fill_layer_MUX_uxn_c_l132_c2_8574_iffalse,
fill_layer_MUX_uxn_c_l132_c2_8574_return_output);

-- CONST_SR_2_uxn_c_l134_c17_42bc
CONST_SR_2_uxn_c_l134_c17_42bc : entity work.CONST_SR_2_uint8_t_0CLK_de264c78 port map (
CONST_SR_2_uxn_c_l134_c17_42bc_x,
CONST_SR_2_uxn_c_l134_c17_42bc_return_output);

-- CONST_SR_3_uxn_c_l135_c18_75e4
CONST_SR_3_uxn_c_l135_c18_75e4 : entity work.CONST_SR_3_uint8_t_0CLK_de264c78 port map (
CONST_SR_3_uxn_c_l135_c18_75e4_x,
CONST_SR_3_uxn_c_l135_c18_75e4_return_output);

-- BIN_OP_DIV_uxn_c_l136_c13_33a4
BIN_OP_DIV_uxn_c_l136_c13_33a4 : entity work.BIN_OP_DIV_uint16_t_uint9_t_0CLK_2b0015ee port map (
BIN_OP_DIV_uxn_c_l136_c13_33a4_left,
BIN_OP_DIV_uxn_c_l136_c13_33a4_right,
BIN_OP_DIV_uxn_c_l136_c13_33a4_return_output);

-- BIN_OP_INFERRED_MULT_uxn_c_l137_c29_c0f2
BIN_OP_INFERRED_MULT_uxn_c_l137_c29_c0f2 : entity work.BIN_OP_INFERRED_MULT_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_c_l137_c29_c0f2_left,
BIN_OP_INFERRED_MULT_uxn_c_l137_c29_c0f2_right,
BIN_OP_INFERRED_MULT_uxn_c_l137_c29_c0f2_return_output);

-- BIN_OP_MINUS_uxn_c_l137_c13_8441
BIN_OP_MINUS_uxn_c_l137_c13_8441 : entity work.BIN_OP_MINUS_uint16_t_uint25_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l137_c13_8441_left,
BIN_OP_MINUS_uxn_c_l137_c13_8441_right,
BIN_OP_MINUS_uxn_c_l137_c13_8441_return_output);

-- MUX_uxn_c_l138_c13_94c4
MUX_uxn_c_l138_c13_94c4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l138_c13_94c4_cond,
MUX_uxn_c_l138_c13_94c4_iftrue,
MUX_uxn_c_l138_c13_94c4_iffalse,
MUX_uxn_c_l138_c13_94c4_return_output);

-- MUX_uxn_c_l139_c13_5dd9
MUX_uxn_c_l139_c13_5dd9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l139_c13_5dd9_cond,
MUX_uxn_c_l139_c13_5dd9_iftrue,
MUX_uxn_c_l139_c13_5dd9_iffalse,
MUX_uxn_c_l139_c13_5dd9_return_output);

-- MUX_uxn_c_l140_c13_2842
MUX_uxn_c_l140_c13_2842 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l140_c13_2842_cond,
MUX_uxn_c_l140_c13_2842_iftrue,
MUX_uxn_c_l140_c13_2842_iffalse,
MUX_uxn_c_l140_c13_2842_return_output);

-- MUX_uxn_c_l141_c13_a0ee
MUX_uxn_c_l141_c13_a0ee : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l141_c13_a0ee_cond,
MUX_uxn_c_l141_c13_a0ee_iftrue,
MUX_uxn_c_l141_c13_a0ee_iffalse,
MUX_uxn_c_l141_c13_a0ee_return_output);

-- BIN_OP_MINUS_uxn_c_l144_c28_4948
BIN_OP_MINUS_uxn_c_l144_c28_4948 : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l144_c28_4948_left,
BIN_OP_MINUS_uxn_c_l144_c28_4948_right,
BIN_OP_MINUS_uxn_c_l144_c28_4948_return_output);

-- BIN_OP_PLUS_uxn_c_l144_c28_2bd7
BIN_OP_PLUS_uxn_c_l144_c28_2bd7 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l144_c28_2bd7_left,
BIN_OP_PLUS_uxn_c_l144_c28_2bd7_right,
BIN_OP_PLUS_uxn_c_l144_c28_2bd7_return_output);

-- BIN_OP_MINUS_uxn_c_l144_c54_fef7
BIN_OP_MINUS_uxn_c_l144_c54_fef7 : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l144_c54_fef7_left,
BIN_OP_MINUS_uxn_c_l144_c54_fef7_right,
BIN_OP_MINUS_uxn_c_l144_c54_fef7_return_output);

-- BIN_OP_PLUS_uxn_c_l144_c54_5871
BIN_OP_PLUS_uxn_c_l144_c54_5871 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l144_c54_5871_left,
BIN_OP_PLUS_uxn_c_l144_c54_5871_right,
BIN_OP_PLUS_uxn_c_l144_c54_5871_return_output);

-- BIN_OP_INFERRED_MULT_uxn_c_l144_c28_31ce
BIN_OP_INFERRED_MULT_uxn_c_l144_c28_31ce : entity work.BIN_OP_INFERRED_MULT_uint17_t_uint17_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_c_l144_c28_31ce_left,
BIN_OP_INFERRED_MULT_uxn_c_l144_c28_31ce_right,
BIN_OP_INFERRED_MULT_uxn_c_l144_c28_31ce_return_output);

-- BIN_OP_INFERRED_MULT_uxn_c_l152_c45_854e
BIN_OP_INFERRED_MULT_uxn_c_l152_c45_854e : entity work.BIN_OP_INFERRED_MULT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_c_l152_c45_854e_left,
BIN_OP_INFERRED_MULT_uxn_c_l152_c45_854e_right,
BIN_OP_INFERRED_MULT_uxn_c_l152_c45_854e_return_output);

-- BIN_OP_PLUS_uxn_c_l152_c45_1b28
BIN_OP_PLUS_uxn_c_l152_c45_1b28 : entity work.BIN_OP_PLUS_uint32_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l152_c45_1b28_left,
BIN_OP_PLUS_uxn_c_l152_c45_1b28_right,
BIN_OP_PLUS_uxn_c_l152_c45_1b28_return_output);

-- MUX_uxn_c_l152_c26_d61c
MUX_uxn_c_l152_c26_d61c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l152_c26_d61c_cond,
MUX_uxn_c_l152_c26_d61c_iftrue,
MUX_uxn_c_l152_c26_d61c_iffalse,
MUX_uxn_c_l152_c26_d61c_return_output);

-- BIN_OP_EQ_uxn_c_l154_c18_a013
BIN_OP_EQ_uxn_c_l154_c18_a013 : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l154_c18_a013_left,
BIN_OP_EQ_uxn_c_l154_c18_a013_right,
BIN_OP_EQ_uxn_c_l154_c18_a013_return_output);

-- MUX_uxn_c_l154_c18_fb32
MUX_uxn_c_l154_c18_fb32 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l154_c18_fb32_cond,
MUX_uxn_c_l154_c18_fb32_iftrue,
MUX_uxn_c_l154_c18_fb32_iffalse,
MUX_uxn_c_l154_c18_fb32_return_output);

-- BIN_OP_PLUS_uxn_c_l155_c22_287c
BIN_OP_PLUS_uxn_c_l155_c22_287c : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l155_c22_287c_left,
BIN_OP_PLUS_uxn_c_l155_c22_287c_right,
BIN_OP_PLUS_uxn_c_l155_c22_287c_return_output);

-- MUX_uxn_c_l155_c6_3ba3
MUX_uxn_c_l155_c6_3ba3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l155_c6_3ba3_cond,
MUX_uxn_c_l155_c6_3ba3_iftrue,
MUX_uxn_c_l155_c6_3ba3_iffalse,
MUX_uxn_c_l155_c6_3ba3_return_output);

-- BIN_OP_PLUS_uxn_c_l156_c31_6c2e
BIN_OP_PLUS_uxn_c_l156_c31_6c2e : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l156_c31_6c2e_left,
BIN_OP_PLUS_uxn_c_l156_c31_6c2e_right,
BIN_OP_PLUS_uxn_c_l156_c31_6c2e_return_output);

-- MUX_uxn_c_l156_c6_e29c
MUX_uxn_c_l156_c6_e29c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l156_c6_e29c_cond,
MUX_uxn_c_l156_c6_e29c_iftrue,
MUX_uxn_c_l156_c6_e29c_iffalse,
MUX_uxn_c_l156_c6_e29c_return_output);

-- UNARY_OP_NOT_uxn_c_l158_c38_5ef6
UNARY_OP_NOT_uxn_c_l158_c38_5ef6 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l158_c38_5ef6_expr,
UNARY_OP_NOT_uxn_c_l158_c38_5ef6_return_output);

-- BIN_OP_AND_uxn_c_l158_c19_1b9f
BIN_OP_AND_uxn_c_l158_c19_1b9f : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l158_c19_1b9f_left,
BIN_OP_AND_uxn_c_l158_c19_1b9f_right,
BIN_OP_AND_uxn_c_l158_c19_1b9f_return_output);

-- BIN_OP_AND_uxn_c_l159_c19_5de0
BIN_OP_AND_uxn_c_l159_c19_5de0 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l159_c19_5de0_left,
BIN_OP_AND_uxn_c_l159_c19_5de0_right,
BIN_OP_AND_uxn_c_l159_c19_5de0_return_output);

-- MUX_uxn_c_l164_c3_fa12
MUX_uxn_c_l164_c3_fa12 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
MUX_uxn_c_l164_c3_fa12_cond,
MUX_uxn_c_l164_c3_fa12_iftrue,
MUX_uxn_c_l164_c3_fa12_iffalse,
MUX_uxn_c_l164_c3_fa12_return_output);

-- UNARY_OP_NOT_uxn_c_l165_c57_3c01
UNARY_OP_NOT_uxn_c_l165_c57_3c01 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l165_c57_3c01_expr,
UNARY_OP_NOT_uxn_c_l165_c57_3c01_return_output);

-- BIN_OP_AND_uxn_c_l165_c22_479b
BIN_OP_AND_uxn_c_l165_c22_479b : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l165_c22_479b_left,
BIN_OP_AND_uxn_c_l165_c22_479b_right,
BIN_OP_AND_uxn_c_l165_c22_479b_return_output);

-- BIN_OP_OR_uxn_c_l165_c3_caa7
BIN_OP_OR_uxn_c_l165_c3_caa7 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l165_c3_caa7_left,
BIN_OP_OR_uxn_c_l165_c3_caa7_right,
BIN_OP_OR_uxn_c_l165_c3_caa7_return_output);

-- bg_vram_update_uxn_c_l161_c19_0a9c
bg_vram_update_uxn_c_l161_c19_0a9c : entity work.bg_vram_update_0CLK_6f2c5aad port map (
clk,
bg_vram_update_uxn_c_l161_c19_0a9c_CLOCK_ENABLE,
bg_vram_update_uxn_c_l161_c19_0a9c_read_address,
bg_vram_update_uxn_c_l161_c19_0a9c_write_address,
bg_vram_update_uxn_c_l161_c19_0a9c_write_value,
bg_vram_update_uxn_c_l161_c19_0a9c_write_enable,
bg_vram_update_uxn_c_l161_c19_0a9c_return_output);

-- MUX_uxn_c_l171_c3_18c9
MUX_uxn_c_l171_c3_18c9 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
MUX_uxn_c_l171_c3_18c9_cond,
MUX_uxn_c_l171_c3_18c9_iftrue,
MUX_uxn_c_l171_c3_18c9_iffalse,
MUX_uxn_c_l171_c3_18c9_return_output);

-- BIN_OP_AND_uxn_c_l172_c22_6539
BIN_OP_AND_uxn_c_l172_c22_6539 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l172_c22_6539_left,
BIN_OP_AND_uxn_c_l172_c22_6539_right,
BIN_OP_AND_uxn_c_l172_c22_6539_return_output);

-- BIN_OP_OR_uxn_c_l172_c3_f6a2
BIN_OP_OR_uxn_c_l172_c3_f6a2 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l172_c3_f6a2_left,
BIN_OP_OR_uxn_c_l172_c3_f6a2_right,
BIN_OP_OR_uxn_c_l172_c3_f6a2_return_output);

-- fg_vram_update_uxn_c_l168_c19_2417
fg_vram_update_uxn_c_l168_c19_2417 : entity work.fg_vram_update_0CLK_6f2c5aad port map (
clk,
fg_vram_update_uxn_c_l168_c19_2417_CLOCK_ENABLE,
fg_vram_update_uxn_c_l168_c19_2417_read_address,
fg_vram_update_uxn_c_l168_c19_2417_write_address,
fg_vram_update_uxn_c_l168_c19_2417_write_value,
fg_vram_update_uxn_c_l168_c19_2417_write_enable,
fg_vram_update_uxn_c_l168_c19_2417_return_output);

-- BIN_OP_MINUS_uxn_c_l175_c43_b5e5
BIN_OP_MINUS_uxn_c_l175_c43_b5e5 : entity work.BIN_OP_MINUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l175_c43_b5e5_left,
BIN_OP_MINUS_uxn_c_l175_c43_b5e5_right,
BIN_OP_MINUS_uxn_c_l175_c43_b5e5_return_output);

-- MUX_uxn_c_l175_c26_f10c
MUX_uxn_c_l175_c26_f10c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l175_c26_f10c_cond,
MUX_uxn_c_l175_c26_f10c_iftrue,
MUX_uxn_c_l175_c26_f10c_iffalse,
MUX_uxn_c_l175_c26_f10c_return_output);

-- BIN_OP_EQ_uxn_c_l176_c19_f9a5
BIN_OP_EQ_uxn_c_l176_c19_f9a5 : entity work.BIN_OP_EQ_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l176_c19_f9a5_left,
BIN_OP_EQ_uxn_c_l176_c19_f9a5_right,
BIN_OP_EQ_uxn_c_l176_c19_f9a5_return_output);

-- MUX_uxn_c_l176_c19_92eb
MUX_uxn_c_l176_c19_92eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l176_c19_92eb_cond,
MUX_uxn_c_l176_c19_92eb_iftrue,
MUX_uxn_c_l176_c19_92eb_iffalse,
MUX_uxn_c_l176_c19_92eb_return_output);

-- BIN_OP_EQ_uxn_c_l177_c19_c19a
BIN_OP_EQ_uxn_c_l177_c19_c19a : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l177_c19_c19a_left,
BIN_OP_EQ_uxn_c_l177_c19_c19a_right,
BIN_OP_EQ_uxn_c_l177_c19_c19a_return_output);

-- BIN_OP_PLUS_uxn_c_l177_c76_18a0
BIN_OP_PLUS_uxn_c_l177_c76_18a0 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l177_c76_18a0_left,
BIN_OP_PLUS_uxn_c_l177_c76_18a0_right,
BIN_OP_PLUS_uxn_c_l177_c76_18a0_return_output);

-- MUX_uxn_c_l177_c50_9e5f
MUX_uxn_c_l177_c50_9e5f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l177_c50_9e5f_cond,
MUX_uxn_c_l177_c50_9e5f_iftrue,
MUX_uxn_c_l177_c50_9e5f_iffalse,
MUX_uxn_c_l177_c50_9e5f_return_output);

-- MUX_uxn_c_l177_c19_5195
MUX_uxn_c_l177_c19_5195 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l177_c19_5195_cond,
MUX_uxn_c_l177_c19_5195_iftrue,
MUX_uxn_c_l177_c19_5195_iffalse,
MUX_uxn_c_l177_c19_5195_return_output);

-- BIN_OP_EQ_uxn_c_l178_c25_6432
BIN_OP_EQ_uxn_c_l178_c25_6432 : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l178_c25_6432_left,
BIN_OP_EQ_uxn_c_l178_c25_6432_right,
BIN_OP_EQ_uxn_c_l178_c25_6432_return_output);

-- MUX_uxn_c_l178_c25_c6a4
MUX_uxn_c_l178_c25_c6a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l178_c25_c6a4_cond,
MUX_uxn_c_l178_c25_c6a4_iftrue,
MUX_uxn_c_l178_c25_c6a4_iffalse,
MUX_uxn_c_l178_c25_c6a4_return_output);

-- BIN_OP_EQ_uxn_c_l179_c17_55be
BIN_OP_EQ_uxn_c_l179_c17_55be : entity work.BIN_OP_EQ_uint2_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l179_c17_55be_left,
BIN_OP_EQ_uxn_c_l179_c17_55be_right,
BIN_OP_EQ_uxn_c_l179_c17_55be_return_output);

-- MUX_uxn_c_l179_c17_1079
MUX_uxn_c_l179_c17_1079 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
MUX_uxn_c_l179_c17_1079_cond,
MUX_uxn_c_l179_c17_1079_iftrue,
MUX_uxn_c_l179_c17_1079_iffalse,
MUX_uxn_c_l179_c17_1079_return_output);

-- UNARY_OP_NOT_uint1_t_uxn_c_l165_l172_DUPLICATE_6d86
UNARY_OP_NOT_uint1_t_uxn_c_l165_l172_DUPLICATE_6d86 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uint1_t_uxn_c_l165_l172_DUPLICATE_6d86_expr,
UNARY_OP_NOT_uint1_t_uxn_c_l165_l172_DUPLICATE_6d86_return_output);

-- BIN_OP_AND_uint1_t_uint1_t_uxn_c_l172_l165_DUPLICATE_0941
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l172_l165_DUPLICATE_0941 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l172_l165_DUPLICATE_0941_left,
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l172_l165_DUPLICATE_0941_right,
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l172_l165_DUPLICATE_0941_return_output);



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
 CONST_SR_4_uxn_c_l129_c44_fe30_return_output,
 BIN_OP_AND_uxn_c_l129_c17_dc7e_return_output,
 UNARY_OP_NOT_uxn_c_l132_c22_3a88_return_output,
 BIN_OP_AND_uxn_c_l132_c6_1fef_return_output,
 is_fill_active_MUX_uxn_c_l132_c2_8574_return_output,
 y_MUX_uxn_c_l132_c2_8574_return_output,
 fill_pixels_remaining_MUX_uxn_c_l132_c2_8574_return_output,
 fill_y0_MUX_uxn_c_l132_c2_8574_return_output,
 fill_y1_MUX_uxn_c_l132_c2_8574_return_output,
 x_MUX_uxn_c_l132_c2_8574_return_output,
 fill_x0_MUX_uxn_c_l132_c2_8574_return_output,
 fill_x1_MUX_uxn_c_l132_c2_8574_return_output,
 fill_color_MUX_uxn_c_l132_c2_8574_return_output,
 is_fill_top_MUX_uxn_c_l132_c2_8574_return_output,
 fill_layer_MUX_uxn_c_l132_c2_8574_return_output,
 CONST_SR_2_uxn_c_l134_c17_42bc_return_output,
 CONST_SR_3_uxn_c_l135_c18_75e4_return_output,
 BIN_OP_DIV_uxn_c_l136_c13_33a4_return_output,
 BIN_OP_INFERRED_MULT_uxn_c_l137_c29_c0f2_return_output,
 BIN_OP_MINUS_uxn_c_l137_c13_8441_return_output,
 MUX_uxn_c_l138_c13_94c4_return_output,
 MUX_uxn_c_l139_c13_5dd9_return_output,
 MUX_uxn_c_l140_c13_2842_return_output,
 MUX_uxn_c_l141_c13_a0ee_return_output,
 BIN_OP_MINUS_uxn_c_l144_c28_4948_return_output,
 BIN_OP_PLUS_uxn_c_l144_c28_2bd7_return_output,
 BIN_OP_MINUS_uxn_c_l144_c54_fef7_return_output,
 BIN_OP_PLUS_uxn_c_l144_c54_5871_return_output,
 BIN_OP_INFERRED_MULT_uxn_c_l144_c28_31ce_return_output,
 BIN_OP_INFERRED_MULT_uxn_c_l152_c45_854e_return_output,
 BIN_OP_PLUS_uxn_c_l152_c45_1b28_return_output,
 MUX_uxn_c_l152_c26_d61c_return_output,
 BIN_OP_EQ_uxn_c_l154_c18_a013_return_output,
 MUX_uxn_c_l154_c18_fb32_return_output,
 BIN_OP_PLUS_uxn_c_l155_c22_287c_return_output,
 MUX_uxn_c_l155_c6_3ba3_return_output,
 BIN_OP_PLUS_uxn_c_l156_c31_6c2e_return_output,
 MUX_uxn_c_l156_c6_e29c_return_output,
 UNARY_OP_NOT_uxn_c_l158_c38_5ef6_return_output,
 BIN_OP_AND_uxn_c_l158_c19_1b9f_return_output,
 BIN_OP_AND_uxn_c_l159_c19_5de0_return_output,
 MUX_uxn_c_l164_c3_fa12_return_output,
 UNARY_OP_NOT_uxn_c_l165_c57_3c01_return_output,
 BIN_OP_AND_uxn_c_l165_c22_479b_return_output,
 BIN_OP_OR_uxn_c_l165_c3_caa7_return_output,
 bg_vram_update_uxn_c_l161_c19_0a9c_return_output,
 MUX_uxn_c_l171_c3_18c9_return_output,
 BIN_OP_AND_uxn_c_l172_c22_6539_return_output,
 BIN_OP_OR_uxn_c_l172_c3_f6a2_return_output,
 fg_vram_update_uxn_c_l168_c19_2417_return_output,
 BIN_OP_MINUS_uxn_c_l175_c43_b5e5_return_output,
 MUX_uxn_c_l175_c26_f10c_return_output,
 BIN_OP_EQ_uxn_c_l176_c19_f9a5_return_output,
 MUX_uxn_c_l176_c19_92eb_return_output,
 BIN_OP_EQ_uxn_c_l177_c19_c19a_return_output,
 BIN_OP_PLUS_uxn_c_l177_c76_18a0_return_output,
 MUX_uxn_c_l177_c50_9e5f_return_output,
 MUX_uxn_c_l177_c19_5195_return_output,
 BIN_OP_EQ_uxn_c_l178_c25_6432_return_output,
 MUX_uxn_c_l178_c25_c6a4_return_output,
 BIN_OP_EQ_uxn_c_l179_c17_55be_return_output,
 MUX_uxn_c_l179_c17_1079_return_output,
 UNARY_OP_NOT_uint1_t_uxn_c_l165_l172_DUPLICATE_6d86_return_output,
 BIN_OP_AND_uint1_t_uint1_t_uxn_c_l172_l165_DUPLICATE_0941_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : gpu_step_result_t;
 variable VAR_is_active_drawing_area : unsigned(0 downto 0);
 variable VAR_is_vram_write : unsigned(0 downto 0);
 variable VAR_vram_write_layer : unsigned(0 downto 0);
 variable VAR_vram_address : unsigned(15 downto 0);
 variable VAR_vram_value : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l129_c17_dc7e_left : unsigned(0 downto 0);
 variable VAR_CONST_SR_4_uxn_c_l129_c44_fe30_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_c_l129_c44_fe30_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_c_l129_c34_25ec_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l129_c17_dc7e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l129_c17_dc7e_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l132_c6_1fef_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l132_c22_3a88_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l132_c22_3a88_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l132_c6_1fef_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l132_c6_1fef_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_active_MUX_uxn_c_l132_c2_8574_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_active_MUX_uxn_c_l132_c2_8574_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_active_MUX_uxn_c_l132_c2_8574_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_active_MUX_uxn_c_l132_c2_8574_cond : unsigned(0 downto 0);
 variable VAR_is_fill_left_uxn_c_l135_c3_04a2 : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_c_l132_c2_8574_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_c_l132_c2_8574_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_c_l132_c2_8574_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_c_l132_c2_8574_cond : unsigned(0 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l132_c2_8574_iftrue : unsigned(15 downto 0);
 variable VAR_fill_pixels_remaining_uxn_c_l144_c3_d32a : unsigned(15 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l132_c2_8574_iffalse : unsigned(15 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l132_c2_8574_return_output : unsigned(15 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l132_c2_8574_cond : unsigned(0 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l132_c2_8574_iftrue : unsigned(15 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l132_c2_8574_iffalse : unsigned(15 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l132_c2_8574_return_output : unsigned(15 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l132_c2_8574_cond : unsigned(0 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l132_c2_8574_iftrue : unsigned(15 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l132_c2_8574_iffalse : unsigned(15 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l132_c2_8574_return_output : unsigned(15 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l132_c2_8574_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_c_l132_c2_8574_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_c_l132_c2_8574_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_c_l132_c2_8574_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_c_l132_c2_8574_cond : unsigned(0 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l132_c2_8574_iftrue : unsigned(15 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l132_c2_8574_iffalse : unsigned(15 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l132_c2_8574_return_output : unsigned(15 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l132_c2_8574_cond : unsigned(0 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l132_c2_8574_iftrue : unsigned(15 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l132_c2_8574_iffalse : unsigned(15 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l132_c2_8574_return_output : unsigned(15 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l132_c2_8574_cond : unsigned(0 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l132_c2_8574_iftrue : unsigned(1 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l132_c2_8574_iffalse : unsigned(1 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l132_c2_8574_return_output : unsigned(1 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l132_c2_8574_cond : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l132_c2_8574_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_top_uxn_c_l134_c3_8c89 : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l132_c2_8574_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l132_c2_8574_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l132_c2_8574_cond : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l132_c2_8574_iftrue : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l132_c2_8574_iffalse : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l132_c2_8574_return_output : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l132_c2_8574_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_2_uxn_c_l134_c17_42bc_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_2_uxn_c_l134_c17_42bc_x : unsigned(7 downto 0);
 variable VAR_CONST_SR_3_uxn_c_l135_c18_75e4_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_3_uxn_c_l135_c18_75e4_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_DIV_uxn_c_l136_c13_33a4_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_c_l136_c13_33a4_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_DIV_uxn_c_l136_c13_33a4_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l137_c13_8441_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l137_c29_c0f2_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l137_c29_c0f2_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l137_c29_c0f2_return_output : unsigned(24 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l137_c13_8441_right : unsigned(24 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l137_c13_8441_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l138_c13_94c4_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l138_c13_94c4_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l138_c13_94c4_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l138_c13_94c4_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l139_c13_5dd9_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l139_c13_5dd9_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l139_c13_5dd9_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l139_c13_5dd9_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l140_c13_2842_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l140_c13_2842_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l140_c13_2842_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l140_c13_2842_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l141_c13_a0ee_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l141_c13_a0ee_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l141_c13_a0ee_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l141_c13_a0ee_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint2_t_uxn_c_l143_c16_f89f_return_output : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l144_c28_4948_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l144_c28_4948_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l144_c28_4948_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l144_c28_2bd7_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l144_c28_2bd7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l144_c28_2bd7_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l144_c28_31ce_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l144_c54_fef7_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l144_c54_fef7_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l144_c54_fef7_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l144_c54_5871_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l144_c54_5871_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l144_c54_5871_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l144_c28_31ce_right : unsigned(16 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l144_c28_31ce_return_output : unsigned(33 downto 0);
 variable VAR_MUX_uxn_c_l152_c26_d61c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l152_c26_d61c_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l152_c26_d61c_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l152_c45_854e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l152_c45_854e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l152_c45_854e_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l152_c45_1b28_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l152_c45_1b28_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l152_c45_1b28_return_output : unsigned(32 downto 0);
 variable VAR_MUX_uxn_c_l152_c26_d61c_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l154_c18_fb32_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l154_c18_a013_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l154_c18_a013_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l154_c18_a013_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l154_c18_fb32_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l154_c18_fb32_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l154_c18_fb32_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l155_c6_3ba3_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l155_c6_3ba3_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l155_c6_3ba3_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l155_c22_287c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l155_c22_287c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l155_c22_287c_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l155_c6_3ba3_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l156_c6_e29c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l156_c6_e29c_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l156_c6_e29c_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l156_c31_6c2e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l156_c31_6c2e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l156_c31_6c2e_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l156_c6_e29c_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l158_c19_1b9f_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l158_c38_5ef6_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l158_c38_5ef6_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l158_c19_1b9f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l158_c19_1b9f_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l159_c19_5de0_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l159_c19_5de0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l159_c19_5de0_return_output : unsigned(0 downto 0);
 variable VAR_bg_vram_update_uxn_c_l161_c19_0a9c_read_address : unsigned(15 downto 0);
 variable VAR_bg_vram_update_uxn_c_l161_c19_0a9c_write_address : unsigned(15 downto 0);
 variable VAR_bg_vram_update_uxn_c_l161_c19_0a9c_write_value : unsigned(1 downto 0);
 variable VAR_bg_vram_update_uxn_c_l161_c19_0a9c_write_enable : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l164_c3_fa12_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l164_c3_fa12_iftrue : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l164_c3_fa12_iffalse : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l164_c3_fa12_return_output : unsigned(1 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l165_c3_caa7_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l165_c22_479b_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l165_c57_3c01_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l165_c57_3c01_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l165_c22_479b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l165_c22_479b_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l165_c3_caa7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l165_c3_caa7_return_output : unsigned(0 downto 0);
 variable VAR_bg_vram_update_uxn_c_l161_c19_0a9c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_bg_vram_update_uxn_c_l161_c19_0a9c_return_output : unsigned(1 downto 0);
 variable VAR_fg_vram_update_uxn_c_l168_c19_2417_read_address : unsigned(15 downto 0);
 variable VAR_fg_vram_update_uxn_c_l168_c19_2417_write_address : unsigned(15 downto 0);
 variable VAR_fg_vram_update_uxn_c_l168_c19_2417_write_value : unsigned(1 downto 0);
 variable VAR_fg_vram_update_uxn_c_l168_c19_2417_write_enable : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l171_c3_18c9_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l171_c3_18c9_iftrue : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l171_c3_18c9_iffalse : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l171_c3_18c9_return_output : unsigned(1 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l172_c3_f6a2_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l172_c22_6539_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l172_c22_6539_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l172_c22_6539_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l172_c3_f6a2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l172_c3_f6a2_return_output : unsigned(0 downto 0);
 variable VAR_fg_vram_update_uxn_c_l168_c19_2417_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_fg_vram_update_uxn_c_l168_c19_2417_return_output : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l175_c26_f10c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l175_c26_f10c_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l175_c26_f10c_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l175_c43_b5e5_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l175_c43_b5e5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l175_c43_b5e5_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l175_c26_f10c_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l176_c19_92eb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l176_c19_f9a5_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l176_c19_f9a5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l176_c19_f9a5_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l176_c19_92eb_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l176_c19_92eb_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l176_c19_92eb_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l177_c19_5195_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l177_c19_c19a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l177_c19_c19a_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l177_c19_c19a_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l177_c19_5195_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l177_c19_5195_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l177_c50_9e5f_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l177_c50_9e5f_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l177_c50_9e5f_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l177_c76_18a0_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l177_c76_18a0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l177_c76_18a0_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l177_c50_9e5f_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l177_c19_5195_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l178_c25_c6a4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l178_c25_6432_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l178_c25_6432_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l178_c25_6432_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l178_c25_c6a4_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l178_c25_c6a4_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l178_c25_c6a4_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l179_c17_1079_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l179_c17_55be_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l179_c17_55be_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l179_c17_55be_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l179_c17_1079_iftrue : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l179_c17_1079_iffalse : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l179_c17_1079_return_output : unsigned(1 downto 0);
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_c_l165_l172_DUPLICATE_6d86_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_c_l165_l172_DUPLICATE_6d86_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l172_l165_DUPLICATE_0941_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l172_l165_DUPLICATE_0941_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l172_l165_DUPLICATE_0941_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_269d_uxn_c_l115_l182_DUPLICATE_9ad6_return_output : gpu_step_result_t;
 -- State registers comb logic variables
variable REG_VAR_result : gpu_step_result_t;
variable REG_VAR_adjusted_vram_address : unsigned(15 downto 0);
variable REG_VAR_fill_pixels_remaining : unsigned(15 downto 0);
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
variable REG_VAR_pixel_counter : unsigned(15 downto 0);
variable REG_VAR_x : unsigned(15 downto 0);
variable REG_VAR_y : unsigned(15 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_result := result;
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
     VAR_MUX_uxn_c_l154_c18_fb32_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l152_c45_854e_right := to_unsigned(260, 16);
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l137_c29_c0f2_right := to_unsigned(260, 9);
     VAR_MUX_uxn_c_l139_c13_5dd9_iffalse := resize(to_unsigned(259, 9), 16);
     VAR_MUX_uxn_c_l175_c26_f10c_iffalse := resize(to_unsigned(0, 1), 16);
     VAR_MUX_uxn_c_l178_c25_c6a4_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l176_c19_f9a5_right := to_unsigned(0, 1);
     VAR_is_fill_active_MUX_uxn_c_l132_c2_8574_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_c_l177_c76_18a0_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_c_l144_c54_5871_right := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l177_c19_5195_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_BIN_OP_PLUS_uxn_c_l144_c28_2bd7_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_c_l156_c31_6c2e_right := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l140_c13_2842_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_BIN_OP_PLUS_uxn_c_l155_c22_287c_right := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l154_c18_fb32_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l177_c19_c19a_right := to_unsigned(60839, 16);
     VAR_MUX_uxn_c_l176_c19_92eb_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_DIV_uxn_c_l136_c13_33a4_right := to_unsigned(260, 9);
     VAR_BIN_OP_MINUS_uxn_c_l175_c43_b5e5_right := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l178_c25_c6a4_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l179_c17_55be_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l178_c25_6432_right := to_unsigned(60839, 16);
     VAR_MUX_uxn_c_l138_c13_94c4_iffalse := resize(to_unsigned(233, 8), 16);
     VAR_MUX_uxn_c_l141_c13_a0ee_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_MUX_uxn_c_l176_c19_92eb_iffalse := to_unsigned(1, 1);

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
     VAR_bg_vram_update_uxn_c_l161_c19_0a9c_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_fg_vram_update_uxn_c_l168_c19_2417_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_fill_color_MUX_uxn_c_l132_c2_8574_iffalse := fill_color;
     VAR_fill_layer_MUX_uxn_c_l132_c2_8574_iffalse := fill_layer;
     VAR_fill_pixels_remaining_MUX_uxn_c_l132_c2_8574_iffalse := fill_pixels_remaining;
     VAR_fill_x0_MUX_uxn_c_l132_c2_8574_iffalse := fill_x0;
     VAR_fill_x1_MUX_uxn_c_l132_c2_8574_iffalse := fill_x1;
     VAR_fill_y0_MUX_uxn_c_l132_c2_8574_iffalse := fill_y0;
     VAR_fill_y1_MUX_uxn_c_l132_c2_8574_iffalse := fill_y1;
     VAR_MUX_uxn_c_l177_c50_9e5f_cond := VAR_is_active_drawing_area;
     VAR_UNARY_OP_NOT_uxn_c_l132_c22_3a88_expr := is_fill_active;
     VAR_is_fill_active_MUX_uxn_c_l132_c2_8574_iffalse := is_fill_active;
     VAR_is_fill_top_MUX_uxn_c_l132_c2_8574_iffalse := is_fill_top;
     VAR_BIN_OP_AND_uxn_c_l129_c17_dc7e_left := VAR_is_vram_write;
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l172_l165_DUPLICATE_0941_right := VAR_is_vram_write;
     VAR_BIN_OP_EQ_uxn_c_l177_c19_c19a_left := pixel_counter;
     VAR_BIN_OP_PLUS_uxn_c_l177_c76_18a0_left := pixel_counter;
     VAR_MUX_uxn_c_l177_c50_9e5f_iffalse := pixel_counter;
     VAR_bg_vram_update_uxn_c_l161_c19_0a9c_read_address := pixel_counter;
     VAR_fg_vram_update_uxn_c_l168_c19_2417_read_address := pixel_counter;
     VAR_BIN_OP_DIV_uxn_c_l136_c13_33a4_left := VAR_vram_address;
     VAR_BIN_OP_MINUS_uxn_c_l137_c13_8441_left := VAR_vram_address;
     VAR_MUX_uxn_c_l152_c26_d61c_iffalse := VAR_vram_address;
     VAR_CONST_SR_2_uxn_c_l134_c17_42bc_x := VAR_vram_value;
     VAR_CONST_SR_3_uxn_c_l135_c18_75e4_x := VAR_vram_value;
     VAR_CONST_SR_4_uxn_c_l129_c44_fe30_x := VAR_vram_value;
     VAR_MUX_uxn_c_l164_c3_fa12_iffalse := resize(VAR_vram_value, 2);
     VAR_MUX_uxn_c_l171_c3_18c9_iffalse := resize(VAR_vram_value, 2);
     VAR_BIN_OP_AND_uxn_c_l172_c22_6539_right := VAR_vram_write_layer;
     VAR_UNARY_OP_NOT_uxn_c_l165_c57_3c01_expr := VAR_vram_write_layer;
     VAR_fill_layer_MUX_uxn_c_l132_c2_8574_iftrue := VAR_vram_write_layer;
     VAR_x_MUX_uxn_c_l132_c2_8574_iffalse := x;
     VAR_y_MUX_uxn_c_l132_c2_8574_iffalse := y;
     -- BIN_OP_DIV[uxn_c_l136_c13_33a4] LATENCY=0
     -- Inputs
     BIN_OP_DIV_uxn_c_l136_c13_33a4_left <= VAR_BIN_OP_DIV_uxn_c_l136_c13_33a4_left;
     BIN_OP_DIV_uxn_c_l136_c13_33a4_right <= VAR_BIN_OP_DIV_uxn_c_l136_c13_33a4_right;
     -- Outputs
     VAR_BIN_OP_DIV_uxn_c_l136_c13_33a4_return_output := BIN_OP_DIV_uxn_c_l136_c13_33a4_return_output;

     -- BIN_OP_EQ[uxn_c_l177_c19_c19a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l177_c19_c19a_left <= VAR_BIN_OP_EQ_uxn_c_l177_c19_c19a_left;
     BIN_OP_EQ_uxn_c_l177_c19_c19a_right <= VAR_BIN_OP_EQ_uxn_c_l177_c19_c19a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l177_c19_c19a_return_output := BIN_OP_EQ_uxn_c_l177_c19_c19a_return_output;

     -- CONST_SR_2[uxn_c_l134_c17_42bc] LATENCY=0
     -- Inputs
     CONST_SR_2_uxn_c_l134_c17_42bc_x <= VAR_CONST_SR_2_uxn_c_l134_c17_42bc_x;
     -- Outputs
     VAR_CONST_SR_2_uxn_c_l134_c17_42bc_return_output := CONST_SR_2_uxn_c_l134_c17_42bc_return_output;

     -- CONST_SR_4[uxn_c_l129_c44_fe30] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_c_l129_c44_fe30_x <= VAR_CONST_SR_4_uxn_c_l129_c44_fe30_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_c_l129_c44_fe30_return_output := CONST_SR_4_uxn_c_l129_c44_fe30_return_output;

     -- UNARY_OP_NOT[uxn_c_l132_c22_3a88] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l132_c22_3a88_expr <= VAR_UNARY_OP_NOT_uxn_c_l132_c22_3a88_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l132_c22_3a88_return_output := UNARY_OP_NOT_uxn_c_l132_c22_3a88_return_output;

     -- CONST_SR_3[uxn_c_l135_c18_75e4] LATENCY=0
     -- Inputs
     CONST_SR_3_uxn_c_l135_c18_75e4_x <= VAR_CONST_SR_3_uxn_c_l135_c18_75e4_x;
     -- Outputs
     VAR_CONST_SR_3_uxn_c_l135_c18_75e4_return_output := CONST_SR_3_uxn_c_l135_c18_75e4_return_output;

     -- CAST_TO_uint2_t[uxn_c_l143_c16_f89f] LATENCY=0
     VAR_CAST_TO_uint2_t_uxn_c_l143_c16_f89f_return_output := CAST_TO_uint2_t_uint8_t(
     VAR_vram_value);

     -- BIN_OP_PLUS[uxn_c_l177_c76_18a0] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l177_c76_18a0_left <= VAR_BIN_OP_PLUS_uxn_c_l177_c76_18a0_left;
     BIN_OP_PLUS_uxn_c_l177_c76_18a0_right <= VAR_BIN_OP_PLUS_uxn_c_l177_c76_18a0_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l177_c76_18a0_return_output := BIN_OP_PLUS_uxn_c_l177_c76_18a0_return_output;

     -- UNARY_OP_NOT[uxn_c_l165_c57_3c01] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l165_c57_3c01_expr <= VAR_UNARY_OP_NOT_uxn_c_l165_c57_3c01_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l165_c57_3c01_return_output := UNARY_OP_NOT_uxn_c_l165_c57_3c01_return_output;

     -- Submodule level 1
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l137_c29_c0f2_left := VAR_BIN_OP_DIV_uxn_c_l136_c13_33a4_return_output;
     VAR_MUX_uxn_c_l138_c13_94c4_iftrue := VAR_BIN_OP_DIV_uxn_c_l136_c13_33a4_return_output;
     VAR_MUX_uxn_c_l140_c13_2842_iffalse := VAR_BIN_OP_DIV_uxn_c_l136_c13_33a4_return_output;
     VAR_MUX_uxn_c_l177_c19_5195_cond := VAR_BIN_OP_EQ_uxn_c_l177_c19_c19a_return_output;
     VAR_MUX_uxn_c_l177_c50_9e5f_iftrue := resize(VAR_BIN_OP_PLUS_uxn_c_l177_c76_18a0_return_output, 16);
     VAR_fill_color_MUX_uxn_c_l132_c2_8574_iftrue := VAR_CAST_TO_uint2_t_uxn_c_l143_c16_f89f_return_output;
     VAR_is_fill_top_uxn_c_l134_c3_8c89 := resize(VAR_CONST_SR_2_uxn_c_l134_c17_42bc_return_output, 1);
     VAR_is_fill_left_uxn_c_l135_c3_04a2 := resize(VAR_CONST_SR_3_uxn_c_l135_c18_75e4_return_output, 1);
     VAR_BIN_OP_AND_uxn_c_l132_c6_1fef_right := VAR_UNARY_OP_NOT_uxn_c_l132_c22_3a88_return_output;
     VAR_BIN_OP_AND_uxn_c_l165_c22_479b_right := VAR_UNARY_OP_NOT_uxn_c_l165_c57_3c01_return_output;
     VAR_MUX_uxn_c_l139_c13_5dd9_cond := VAR_is_fill_left_uxn_c_l135_c3_04a2;
     VAR_MUX_uxn_c_l141_c13_a0ee_cond := VAR_is_fill_left_uxn_c_l135_c3_04a2;
     VAR_MUX_uxn_c_l138_c13_94c4_cond := VAR_is_fill_top_uxn_c_l134_c3_8c89;
     VAR_MUX_uxn_c_l140_c13_2842_cond := VAR_is_fill_top_uxn_c_l134_c3_8c89;
     VAR_is_fill_top_MUX_uxn_c_l132_c2_8574_iftrue := VAR_is_fill_top_uxn_c_l134_c3_8c89;
     -- BIN_OP_INFERRED_MULT[uxn_c_l137_c29_c0f2] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_c_l137_c29_c0f2_left <= VAR_BIN_OP_INFERRED_MULT_uxn_c_l137_c29_c0f2_left;
     BIN_OP_INFERRED_MULT_uxn_c_l137_c29_c0f2_right <= VAR_BIN_OP_INFERRED_MULT_uxn_c_l137_c29_c0f2_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l137_c29_c0f2_return_output := BIN_OP_INFERRED_MULT_uxn_c_l137_c29_c0f2_return_output;

     -- CAST_TO_uint1_t[uxn_c_l129_c34_25ec] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_c_l129_c34_25ec_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_4_uxn_c_l129_c44_fe30_return_output);

     -- MUX[uxn_c_l140_c13_2842] LATENCY=0
     -- Inputs
     MUX_uxn_c_l140_c13_2842_cond <= VAR_MUX_uxn_c_l140_c13_2842_cond;
     MUX_uxn_c_l140_c13_2842_iftrue <= VAR_MUX_uxn_c_l140_c13_2842_iftrue;
     MUX_uxn_c_l140_c13_2842_iffalse <= VAR_MUX_uxn_c_l140_c13_2842_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l140_c13_2842_return_output := MUX_uxn_c_l140_c13_2842_return_output;

     -- MUX[uxn_c_l138_c13_94c4] LATENCY=0
     -- Inputs
     MUX_uxn_c_l138_c13_94c4_cond <= VAR_MUX_uxn_c_l138_c13_94c4_cond;
     MUX_uxn_c_l138_c13_94c4_iftrue <= VAR_MUX_uxn_c_l138_c13_94c4_iftrue;
     MUX_uxn_c_l138_c13_94c4_iffalse <= VAR_MUX_uxn_c_l138_c13_94c4_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l138_c13_94c4_return_output := MUX_uxn_c_l138_c13_94c4_return_output;

     -- MUX[uxn_c_l177_c50_9e5f] LATENCY=0
     -- Inputs
     MUX_uxn_c_l177_c50_9e5f_cond <= VAR_MUX_uxn_c_l177_c50_9e5f_cond;
     MUX_uxn_c_l177_c50_9e5f_iftrue <= VAR_MUX_uxn_c_l177_c50_9e5f_iftrue;
     MUX_uxn_c_l177_c50_9e5f_iffalse <= VAR_MUX_uxn_c_l177_c50_9e5f_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l177_c50_9e5f_return_output := MUX_uxn_c_l177_c50_9e5f_return_output;

     -- Submodule level 2
     VAR_BIN_OP_MINUS_uxn_c_l137_c13_8441_right := VAR_BIN_OP_INFERRED_MULT_uxn_c_l137_c29_c0f2_return_output;
     VAR_BIN_OP_AND_uxn_c_l129_c17_dc7e_right := VAR_CAST_TO_uint1_t_uxn_c_l129_c34_25ec_return_output;
     VAR_BIN_OP_MINUS_uxn_c_l144_c54_fef7_left := VAR_MUX_uxn_c_l138_c13_94c4_return_output;
     VAR_fill_y1_MUX_uxn_c_l132_c2_8574_iftrue := VAR_MUX_uxn_c_l138_c13_94c4_return_output;
     VAR_BIN_OP_MINUS_uxn_c_l144_c54_fef7_right := VAR_MUX_uxn_c_l140_c13_2842_return_output;
     VAR_fill_y0_MUX_uxn_c_l132_c2_8574_iftrue := VAR_MUX_uxn_c_l140_c13_2842_return_output;
     VAR_y_MUX_uxn_c_l132_c2_8574_iftrue := VAR_MUX_uxn_c_l140_c13_2842_return_output;
     VAR_MUX_uxn_c_l177_c19_5195_iffalse := VAR_MUX_uxn_c_l177_c50_9e5f_return_output;
     -- BIN_OP_MINUS[uxn_c_l137_c13_8441] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l137_c13_8441_left <= VAR_BIN_OP_MINUS_uxn_c_l137_c13_8441_left;
     BIN_OP_MINUS_uxn_c_l137_c13_8441_right <= VAR_BIN_OP_MINUS_uxn_c_l137_c13_8441_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l137_c13_8441_return_output := BIN_OP_MINUS_uxn_c_l137_c13_8441_return_output;

     -- MUX[uxn_c_l177_c19_5195] LATENCY=0
     -- Inputs
     MUX_uxn_c_l177_c19_5195_cond <= VAR_MUX_uxn_c_l177_c19_5195_cond;
     MUX_uxn_c_l177_c19_5195_iftrue <= VAR_MUX_uxn_c_l177_c19_5195_iftrue;
     MUX_uxn_c_l177_c19_5195_iffalse <= VAR_MUX_uxn_c_l177_c19_5195_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l177_c19_5195_return_output := MUX_uxn_c_l177_c19_5195_return_output;

     -- BIN_OP_AND[uxn_c_l129_c17_dc7e] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l129_c17_dc7e_left <= VAR_BIN_OP_AND_uxn_c_l129_c17_dc7e_left;
     BIN_OP_AND_uxn_c_l129_c17_dc7e_right <= VAR_BIN_OP_AND_uxn_c_l129_c17_dc7e_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l129_c17_dc7e_return_output := BIN_OP_AND_uxn_c_l129_c17_dc7e_return_output;

     -- BIN_OP_MINUS[uxn_c_l144_c54_fef7] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l144_c54_fef7_left <= VAR_BIN_OP_MINUS_uxn_c_l144_c54_fef7_left;
     BIN_OP_MINUS_uxn_c_l144_c54_fef7_right <= VAR_BIN_OP_MINUS_uxn_c_l144_c54_fef7_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l144_c54_fef7_return_output := BIN_OP_MINUS_uxn_c_l144_c54_fef7_return_output;

     -- Submodule level 3
     VAR_BIN_OP_AND_uxn_c_l132_c6_1fef_left := VAR_BIN_OP_AND_uxn_c_l129_c17_dc7e_return_output;
     REG_VAR_is_fill_code := VAR_BIN_OP_AND_uxn_c_l129_c17_dc7e_return_output;
     VAR_MUX_uxn_c_l139_c13_5dd9_iftrue := VAR_BIN_OP_MINUS_uxn_c_l137_c13_8441_return_output;
     VAR_MUX_uxn_c_l141_c13_a0ee_iffalse := VAR_BIN_OP_MINUS_uxn_c_l137_c13_8441_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l144_c54_5871_left := VAR_BIN_OP_MINUS_uxn_c_l144_c54_fef7_return_output;
     VAR_BIN_OP_EQ_uxn_c_l178_c25_6432_left := VAR_MUX_uxn_c_l177_c19_5195_return_output;
     REG_VAR_pixel_counter := VAR_MUX_uxn_c_l177_c19_5195_return_output;
     -- BIN_OP_AND[uxn_c_l132_c6_1fef] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l132_c6_1fef_left <= VAR_BIN_OP_AND_uxn_c_l132_c6_1fef_left;
     BIN_OP_AND_uxn_c_l132_c6_1fef_right <= VAR_BIN_OP_AND_uxn_c_l132_c6_1fef_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l132_c6_1fef_return_output := BIN_OP_AND_uxn_c_l132_c6_1fef_return_output;

     -- BIN_OP_PLUS[uxn_c_l144_c54_5871] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l144_c54_5871_left <= VAR_BIN_OP_PLUS_uxn_c_l144_c54_5871_left;
     BIN_OP_PLUS_uxn_c_l144_c54_5871_right <= VAR_BIN_OP_PLUS_uxn_c_l144_c54_5871_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l144_c54_5871_return_output := BIN_OP_PLUS_uxn_c_l144_c54_5871_return_output;

     -- BIN_OP_EQ[uxn_c_l178_c25_6432] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l178_c25_6432_left <= VAR_BIN_OP_EQ_uxn_c_l178_c25_6432_left;
     BIN_OP_EQ_uxn_c_l178_c25_6432_right <= VAR_BIN_OP_EQ_uxn_c_l178_c25_6432_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l178_c25_6432_return_output := BIN_OP_EQ_uxn_c_l178_c25_6432_return_output;

     -- MUX[uxn_c_l139_c13_5dd9] LATENCY=0
     -- Inputs
     MUX_uxn_c_l139_c13_5dd9_cond <= VAR_MUX_uxn_c_l139_c13_5dd9_cond;
     MUX_uxn_c_l139_c13_5dd9_iftrue <= VAR_MUX_uxn_c_l139_c13_5dd9_iftrue;
     MUX_uxn_c_l139_c13_5dd9_iffalse <= VAR_MUX_uxn_c_l139_c13_5dd9_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l139_c13_5dd9_return_output := MUX_uxn_c_l139_c13_5dd9_return_output;

     -- MUX[uxn_c_l141_c13_a0ee] LATENCY=0
     -- Inputs
     MUX_uxn_c_l141_c13_a0ee_cond <= VAR_MUX_uxn_c_l141_c13_a0ee_cond;
     MUX_uxn_c_l141_c13_a0ee_iftrue <= VAR_MUX_uxn_c_l141_c13_a0ee_iftrue;
     MUX_uxn_c_l141_c13_a0ee_iffalse <= VAR_MUX_uxn_c_l141_c13_a0ee_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l141_c13_a0ee_return_output := MUX_uxn_c_l141_c13_a0ee_return_output;

     -- Submodule level 4
     VAR_fill_color_MUX_uxn_c_l132_c2_8574_cond := VAR_BIN_OP_AND_uxn_c_l132_c6_1fef_return_output;
     VAR_fill_layer_MUX_uxn_c_l132_c2_8574_cond := VAR_BIN_OP_AND_uxn_c_l132_c6_1fef_return_output;
     VAR_fill_pixels_remaining_MUX_uxn_c_l132_c2_8574_cond := VAR_BIN_OP_AND_uxn_c_l132_c6_1fef_return_output;
     VAR_fill_x0_MUX_uxn_c_l132_c2_8574_cond := VAR_BIN_OP_AND_uxn_c_l132_c6_1fef_return_output;
     VAR_fill_x1_MUX_uxn_c_l132_c2_8574_cond := VAR_BIN_OP_AND_uxn_c_l132_c6_1fef_return_output;
     VAR_fill_y0_MUX_uxn_c_l132_c2_8574_cond := VAR_BIN_OP_AND_uxn_c_l132_c6_1fef_return_output;
     VAR_fill_y1_MUX_uxn_c_l132_c2_8574_cond := VAR_BIN_OP_AND_uxn_c_l132_c6_1fef_return_output;
     VAR_is_fill_active_MUX_uxn_c_l132_c2_8574_cond := VAR_BIN_OP_AND_uxn_c_l132_c6_1fef_return_output;
     VAR_is_fill_top_MUX_uxn_c_l132_c2_8574_cond := VAR_BIN_OP_AND_uxn_c_l132_c6_1fef_return_output;
     VAR_x_MUX_uxn_c_l132_c2_8574_cond := VAR_BIN_OP_AND_uxn_c_l132_c6_1fef_return_output;
     VAR_y_MUX_uxn_c_l132_c2_8574_cond := VAR_BIN_OP_AND_uxn_c_l132_c6_1fef_return_output;
     VAR_MUX_uxn_c_l178_c25_c6a4_cond := VAR_BIN_OP_EQ_uxn_c_l178_c25_6432_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l144_c28_31ce_right := VAR_BIN_OP_PLUS_uxn_c_l144_c54_5871_return_output;
     VAR_BIN_OP_MINUS_uxn_c_l144_c28_4948_left := VAR_MUX_uxn_c_l139_c13_5dd9_return_output;
     VAR_fill_x1_MUX_uxn_c_l132_c2_8574_iftrue := VAR_MUX_uxn_c_l139_c13_5dd9_return_output;
     VAR_BIN_OP_MINUS_uxn_c_l144_c28_4948_right := VAR_MUX_uxn_c_l141_c13_a0ee_return_output;
     VAR_fill_x0_MUX_uxn_c_l132_c2_8574_iftrue := VAR_MUX_uxn_c_l141_c13_a0ee_return_output;
     VAR_x_MUX_uxn_c_l132_c2_8574_iftrue := VAR_MUX_uxn_c_l141_c13_a0ee_return_output;
     -- fill_y0_MUX[uxn_c_l132_c2_8574] LATENCY=0
     -- Inputs
     fill_y0_MUX_uxn_c_l132_c2_8574_cond <= VAR_fill_y0_MUX_uxn_c_l132_c2_8574_cond;
     fill_y0_MUX_uxn_c_l132_c2_8574_iftrue <= VAR_fill_y0_MUX_uxn_c_l132_c2_8574_iftrue;
     fill_y0_MUX_uxn_c_l132_c2_8574_iffalse <= VAR_fill_y0_MUX_uxn_c_l132_c2_8574_iffalse;
     -- Outputs
     VAR_fill_y0_MUX_uxn_c_l132_c2_8574_return_output := fill_y0_MUX_uxn_c_l132_c2_8574_return_output;

     -- fill_x1_MUX[uxn_c_l132_c2_8574] LATENCY=0
     -- Inputs
     fill_x1_MUX_uxn_c_l132_c2_8574_cond <= VAR_fill_x1_MUX_uxn_c_l132_c2_8574_cond;
     fill_x1_MUX_uxn_c_l132_c2_8574_iftrue <= VAR_fill_x1_MUX_uxn_c_l132_c2_8574_iftrue;
     fill_x1_MUX_uxn_c_l132_c2_8574_iffalse <= VAR_fill_x1_MUX_uxn_c_l132_c2_8574_iffalse;
     -- Outputs
     VAR_fill_x1_MUX_uxn_c_l132_c2_8574_return_output := fill_x1_MUX_uxn_c_l132_c2_8574_return_output;

     -- fill_y1_MUX[uxn_c_l132_c2_8574] LATENCY=0
     -- Inputs
     fill_y1_MUX_uxn_c_l132_c2_8574_cond <= VAR_fill_y1_MUX_uxn_c_l132_c2_8574_cond;
     fill_y1_MUX_uxn_c_l132_c2_8574_iftrue <= VAR_fill_y1_MUX_uxn_c_l132_c2_8574_iftrue;
     fill_y1_MUX_uxn_c_l132_c2_8574_iffalse <= VAR_fill_y1_MUX_uxn_c_l132_c2_8574_iffalse;
     -- Outputs
     VAR_fill_y1_MUX_uxn_c_l132_c2_8574_return_output := fill_y1_MUX_uxn_c_l132_c2_8574_return_output;

     -- x_MUX[uxn_c_l132_c2_8574] LATENCY=0
     -- Inputs
     x_MUX_uxn_c_l132_c2_8574_cond <= VAR_x_MUX_uxn_c_l132_c2_8574_cond;
     x_MUX_uxn_c_l132_c2_8574_iftrue <= VAR_x_MUX_uxn_c_l132_c2_8574_iftrue;
     x_MUX_uxn_c_l132_c2_8574_iffalse <= VAR_x_MUX_uxn_c_l132_c2_8574_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_c_l132_c2_8574_return_output := x_MUX_uxn_c_l132_c2_8574_return_output;

     -- BIN_OP_MINUS[uxn_c_l144_c28_4948] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l144_c28_4948_left <= VAR_BIN_OP_MINUS_uxn_c_l144_c28_4948_left;
     BIN_OP_MINUS_uxn_c_l144_c28_4948_right <= VAR_BIN_OP_MINUS_uxn_c_l144_c28_4948_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l144_c28_4948_return_output := BIN_OP_MINUS_uxn_c_l144_c28_4948_return_output;

     -- fill_color_MUX[uxn_c_l132_c2_8574] LATENCY=0
     -- Inputs
     fill_color_MUX_uxn_c_l132_c2_8574_cond <= VAR_fill_color_MUX_uxn_c_l132_c2_8574_cond;
     fill_color_MUX_uxn_c_l132_c2_8574_iftrue <= VAR_fill_color_MUX_uxn_c_l132_c2_8574_iftrue;
     fill_color_MUX_uxn_c_l132_c2_8574_iffalse <= VAR_fill_color_MUX_uxn_c_l132_c2_8574_iffalse;
     -- Outputs
     VAR_fill_color_MUX_uxn_c_l132_c2_8574_return_output := fill_color_MUX_uxn_c_l132_c2_8574_return_output;

     -- is_fill_top_MUX[uxn_c_l132_c2_8574] LATENCY=0
     -- Inputs
     is_fill_top_MUX_uxn_c_l132_c2_8574_cond <= VAR_is_fill_top_MUX_uxn_c_l132_c2_8574_cond;
     is_fill_top_MUX_uxn_c_l132_c2_8574_iftrue <= VAR_is_fill_top_MUX_uxn_c_l132_c2_8574_iftrue;
     is_fill_top_MUX_uxn_c_l132_c2_8574_iffalse <= VAR_is_fill_top_MUX_uxn_c_l132_c2_8574_iffalse;
     -- Outputs
     VAR_is_fill_top_MUX_uxn_c_l132_c2_8574_return_output := is_fill_top_MUX_uxn_c_l132_c2_8574_return_output;

     -- fill_layer_MUX[uxn_c_l132_c2_8574] LATENCY=0
     -- Inputs
     fill_layer_MUX_uxn_c_l132_c2_8574_cond <= VAR_fill_layer_MUX_uxn_c_l132_c2_8574_cond;
     fill_layer_MUX_uxn_c_l132_c2_8574_iftrue <= VAR_fill_layer_MUX_uxn_c_l132_c2_8574_iftrue;
     fill_layer_MUX_uxn_c_l132_c2_8574_iffalse <= VAR_fill_layer_MUX_uxn_c_l132_c2_8574_iffalse;
     -- Outputs
     VAR_fill_layer_MUX_uxn_c_l132_c2_8574_return_output := fill_layer_MUX_uxn_c_l132_c2_8574_return_output;

     -- fill_x0_MUX[uxn_c_l132_c2_8574] LATENCY=0
     -- Inputs
     fill_x0_MUX_uxn_c_l132_c2_8574_cond <= VAR_fill_x0_MUX_uxn_c_l132_c2_8574_cond;
     fill_x0_MUX_uxn_c_l132_c2_8574_iftrue <= VAR_fill_x0_MUX_uxn_c_l132_c2_8574_iftrue;
     fill_x0_MUX_uxn_c_l132_c2_8574_iffalse <= VAR_fill_x0_MUX_uxn_c_l132_c2_8574_iffalse;
     -- Outputs
     VAR_fill_x0_MUX_uxn_c_l132_c2_8574_return_output := fill_x0_MUX_uxn_c_l132_c2_8574_return_output;

     -- is_fill_active_MUX[uxn_c_l132_c2_8574] LATENCY=0
     -- Inputs
     is_fill_active_MUX_uxn_c_l132_c2_8574_cond <= VAR_is_fill_active_MUX_uxn_c_l132_c2_8574_cond;
     is_fill_active_MUX_uxn_c_l132_c2_8574_iftrue <= VAR_is_fill_active_MUX_uxn_c_l132_c2_8574_iftrue;
     is_fill_active_MUX_uxn_c_l132_c2_8574_iffalse <= VAR_is_fill_active_MUX_uxn_c_l132_c2_8574_iffalse;
     -- Outputs
     VAR_is_fill_active_MUX_uxn_c_l132_c2_8574_return_output := is_fill_active_MUX_uxn_c_l132_c2_8574_return_output;

     -- MUX[uxn_c_l178_c25_c6a4] LATENCY=0
     -- Inputs
     MUX_uxn_c_l178_c25_c6a4_cond <= VAR_MUX_uxn_c_l178_c25_c6a4_cond;
     MUX_uxn_c_l178_c25_c6a4_iftrue <= VAR_MUX_uxn_c_l178_c25_c6a4_iftrue;
     MUX_uxn_c_l178_c25_c6a4_iffalse <= VAR_MUX_uxn_c_l178_c25_c6a4_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l178_c25_c6a4_return_output := MUX_uxn_c_l178_c25_c6a4_return_output;

     -- y_MUX[uxn_c_l132_c2_8574] LATENCY=0
     -- Inputs
     y_MUX_uxn_c_l132_c2_8574_cond <= VAR_y_MUX_uxn_c_l132_c2_8574_cond;
     y_MUX_uxn_c_l132_c2_8574_iftrue <= VAR_y_MUX_uxn_c_l132_c2_8574_iftrue;
     y_MUX_uxn_c_l132_c2_8574_iffalse <= VAR_y_MUX_uxn_c_l132_c2_8574_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_c_l132_c2_8574_return_output := y_MUX_uxn_c_l132_c2_8574_return_output;

     -- Submodule level 5
     VAR_BIN_OP_PLUS_uxn_c_l144_c28_2bd7_left := VAR_BIN_OP_MINUS_uxn_c_l144_c28_4948_return_output;
     VAR_MUX_uxn_c_l164_c3_fa12_iftrue := VAR_fill_color_MUX_uxn_c_l132_c2_8574_return_output;
     VAR_MUX_uxn_c_l171_c3_18c9_iftrue := VAR_fill_color_MUX_uxn_c_l132_c2_8574_return_output;
     REG_VAR_fill_color := VAR_fill_color_MUX_uxn_c_l132_c2_8574_return_output;
     VAR_BIN_OP_AND_uxn_c_l159_c19_5de0_right := VAR_fill_layer_MUX_uxn_c_l132_c2_8574_return_output;
     VAR_UNARY_OP_NOT_uxn_c_l158_c38_5ef6_expr := VAR_fill_layer_MUX_uxn_c_l132_c2_8574_return_output;
     REG_VAR_fill_layer := VAR_fill_layer_MUX_uxn_c_l132_c2_8574_return_output;
     VAR_MUX_uxn_c_l156_c6_e29c_iftrue := VAR_fill_x0_MUX_uxn_c_l132_c2_8574_return_output;
     REG_VAR_fill_x0 := VAR_fill_x0_MUX_uxn_c_l132_c2_8574_return_output;
     VAR_BIN_OP_EQ_uxn_c_l154_c18_a013_right := VAR_fill_x1_MUX_uxn_c_l132_c2_8574_return_output;
     REG_VAR_fill_x1 := VAR_fill_x1_MUX_uxn_c_l132_c2_8574_return_output;
     REG_VAR_fill_y0 := VAR_fill_y0_MUX_uxn_c_l132_c2_8574_return_output;
     REG_VAR_fill_y1 := VAR_fill_y1_MUX_uxn_c_l132_c2_8574_return_output;
     VAR_BIN_OP_AND_uxn_c_l158_c19_1b9f_left := VAR_is_fill_active_MUX_uxn_c_l132_c2_8574_return_output;
     VAR_BIN_OP_AND_uxn_c_l159_c19_5de0_left := VAR_is_fill_active_MUX_uxn_c_l132_c2_8574_return_output;
     VAR_MUX_uxn_c_l152_c26_d61c_cond := VAR_is_fill_active_MUX_uxn_c_l132_c2_8574_return_output;
     VAR_MUX_uxn_c_l175_c26_f10c_cond := VAR_is_fill_active_MUX_uxn_c_l132_c2_8574_return_output;
     VAR_UNARY_OP_NOT_uint1_t_uxn_c_l165_l172_DUPLICATE_6d86_expr := VAR_is_fill_active_MUX_uxn_c_l132_c2_8574_return_output;
     REG_VAR_is_fill_top := VAR_is_fill_top_MUX_uxn_c_l132_c2_8574_return_output;
     VAR_BIN_OP_EQ_uxn_c_l154_c18_a013_left := VAR_x_MUX_uxn_c_l132_c2_8574_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l152_c45_1b28_right := VAR_x_MUX_uxn_c_l132_c2_8574_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l156_c31_6c2e_left := VAR_x_MUX_uxn_c_l132_c2_8574_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l152_c45_854e_left := VAR_y_MUX_uxn_c_l132_c2_8574_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l155_c22_287c_left := VAR_y_MUX_uxn_c_l132_c2_8574_return_output;
     VAR_MUX_uxn_c_l155_c6_3ba3_iffalse := VAR_y_MUX_uxn_c_l132_c2_8574_return_output;
     -- UNARY_OP_NOT[uxn_c_l158_c38_5ef6] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l158_c38_5ef6_expr <= VAR_UNARY_OP_NOT_uxn_c_l158_c38_5ef6_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l158_c38_5ef6_return_output := UNARY_OP_NOT_uxn_c_l158_c38_5ef6_return_output;

     -- BIN_OP_EQ[uxn_c_l154_c18_a013] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l154_c18_a013_left <= VAR_BIN_OP_EQ_uxn_c_l154_c18_a013_left;
     BIN_OP_EQ_uxn_c_l154_c18_a013_right <= VAR_BIN_OP_EQ_uxn_c_l154_c18_a013_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l154_c18_a013_return_output := BIN_OP_EQ_uxn_c_l154_c18_a013_return_output;

     -- BIN_OP_PLUS[uxn_c_l144_c28_2bd7] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l144_c28_2bd7_left <= VAR_BIN_OP_PLUS_uxn_c_l144_c28_2bd7_left;
     BIN_OP_PLUS_uxn_c_l144_c28_2bd7_right <= VAR_BIN_OP_PLUS_uxn_c_l144_c28_2bd7_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l144_c28_2bd7_return_output := BIN_OP_PLUS_uxn_c_l144_c28_2bd7_return_output;

     -- BIN_OP_PLUS[uxn_c_l156_c31_6c2e] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l156_c31_6c2e_left <= VAR_BIN_OP_PLUS_uxn_c_l156_c31_6c2e_left;
     BIN_OP_PLUS_uxn_c_l156_c31_6c2e_right <= VAR_BIN_OP_PLUS_uxn_c_l156_c31_6c2e_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l156_c31_6c2e_return_output := BIN_OP_PLUS_uxn_c_l156_c31_6c2e_return_output;

     -- BIN_OP_PLUS[uxn_c_l155_c22_287c] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l155_c22_287c_left <= VAR_BIN_OP_PLUS_uxn_c_l155_c22_287c_left;
     BIN_OP_PLUS_uxn_c_l155_c22_287c_right <= VAR_BIN_OP_PLUS_uxn_c_l155_c22_287c_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l155_c22_287c_return_output := BIN_OP_PLUS_uxn_c_l155_c22_287c_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_c_l152_c45_854e] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_c_l152_c45_854e_left <= VAR_BIN_OP_INFERRED_MULT_uxn_c_l152_c45_854e_left;
     BIN_OP_INFERRED_MULT_uxn_c_l152_c45_854e_right <= VAR_BIN_OP_INFERRED_MULT_uxn_c_l152_c45_854e_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l152_c45_854e_return_output := BIN_OP_INFERRED_MULT_uxn_c_l152_c45_854e_return_output;

     -- BIN_OP_AND[uxn_c_l159_c19_5de0] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l159_c19_5de0_left <= VAR_BIN_OP_AND_uxn_c_l159_c19_5de0_left;
     BIN_OP_AND_uxn_c_l159_c19_5de0_right <= VAR_BIN_OP_AND_uxn_c_l159_c19_5de0_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l159_c19_5de0_return_output := BIN_OP_AND_uxn_c_l159_c19_5de0_return_output;

     -- UNARY_OP_NOT_uint1_t_uxn_c_l165_l172_DUPLICATE_6d86 LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uint1_t_uxn_c_l165_l172_DUPLICATE_6d86_expr <= VAR_UNARY_OP_NOT_uint1_t_uxn_c_l165_l172_DUPLICATE_6d86_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uint1_t_uxn_c_l165_l172_DUPLICATE_6d86_return_output := UNARY_OP_NOT_uint1_t_uxn_c_l165_l172_DUPLICATE_6d86_return_output;

     -- Submodule level 6
     VAR_BIN_OP_OR_uxn_c_l172_c3_f6a2_left := VAR_BIN_OP_AND_uxn_c_l159_c19_5de0_return_output;
     VAR_MUX_uxn_c_l171_c3_18c9_cond := VAR_BIN_OP_AND_uxn_c_l159_c19_5de0_return_output;
     REG_VAR_is_fill_pixel1 := VAR_BIN_OP_AND_uxn_c_l159_c19_5de0_return_output;
     VAR_MUX_uxn_c_l154_c18_fb32_cond := VAR_BIN_OP_EQ_uxn_c_l154_c18_a013_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l152_c45_1b28_left := VAR_BIN_OP_INFERRED_MULT_uxn_c_l152_c45_854e_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l144_c28_31ce_left := VAR_BIN_OP_PLUS_uxn_c_l144_c28_2bd7_return_output;
     VAR_MUX_uxn_c_l155_c6_3ba3_iftrue := resize(VAR_BIN_OP_PLUS_uxn_c_l155_c22_287c_return_output, 16);
     VAR_MUX_uxn_c_l156_c6_e29c_iffalse := resize(VAR_BIN_OP_PLUS_uxn_c_l156_c31_6c2e_return_output, 16);
     VAR_BIN_OP_AND_uxn_c_l158_c19_1b9f_right := VAR_UNARY_OP_NOT_uxn_c_l158_c38_5ef6_return_output;
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l172_l165_DUPLICATE_0941_left := VAR_UNARY_OP_NOT_uint1_t_uxn_c_l165_l172_DUPLICATE_6d86_return_output;
     -- BIN_OP_AND_uint1_t_uint1_t_uxn_c_l172_l165_DUPLICATE_0941 LATENCY=0
     -- Inputs
     BIN_OP_AND_uint1_t_uint1_t_uxn_c_l172_l165_DUPLICATE_0941_left <= VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l172_l165_DUPLICATE_0941_left;
     BIN_OP_AND_uint1_t_uint1_t_uxn_c_l172_l165_DUPLICATE_0941_right <= VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l172_l165_DUPLICATE_0941_right;
     -- Outputs
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l172_l165_DUPLICATE_0941_return_output := BIN_OP_AND_uint1_t_uint1_t_uxn_c_l172_l165_DUPLICATE_0941_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_c_l144_c28_31ce] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_c_l144_c28_31ce_left <= VAR_BIN_OP_INFERRED_MULT_uxn_c_l144_c28_31ce_left;
     BIN_OP_INFERRED_MULT_uxn_c_l144_c28_31ce_right <= VAR_BIN_OP_INFERRED_MULT_uxn_c_l144_c28_31ce_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l144_c28_31ce_return_output := BIN_OP_INFERRED_MULT_uxn_c_l144_c28_31ce_return_output;

     -- BIN_OP_PLUS[uxn_c_l152_c45_1b28] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l152_c45_1b28_left <= VAR_BIN_OP_PLUS_uxn_c_l152_c45_1b28_left;
     BIN_OP_PLUS_uxn_c_l152_c45_1b28_right <= VAR_BIN_OP_PLUS_uxn_c_l152_c45_1b28_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l152_c45_1b28_return_output := BIN_OP_PLUS_uxn_c_l152_c45_1b28_return_output;

     -- MUX[uxn_c_l171_c3_18c9] LATENCY=0
     -- Inputs
     MUX_uxn_c_l171_c3_18c9_cond <= VAR_MUX_uxn_c_l171_c3_18c9_cond;
     MUX_uxn_c_l171_c3_18c9_iftrue <= VAR_MUX_uxn_c_l171_c3_18c9_iftrue;
     MUX_uxn_c_l171_c3_18c9_iffalse <= VAR_MUX_uxn_c_l171_c3_18c9_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l171_c3_18c9_return_output := MUX_uxn_c_l171_c3_18c9_return_output;

     -- BIN_OP_AND[uxn_c_l158_c19_1b9f] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l158_c19_1b9f_left <= VAR_BIN_OP_AND_uxn_c_l158_c19_1b9f_left;
     BIN_OP_AND_uxn_c_l158_c19_1b9f_right <= VAR_BIN_OP_AND_uxn_c_l158_c19_1b9f_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l158_c19_1b9f_return_output := BIN_OP_AND_uxn_c_l158_c19_1b9f_return_output;

     -- MUX[uxn_c_l154_c18_fb32] LATENCY=0
     -- Inputs
     MUX_uxn_c_l154_c18_fb32_cond <= VAR_MUX_uxn_c_l154_c18_fb32_cond;
     MUX_uxn_c_l154_c18_fb32_iftrue <= VAR_MUX_uxn_c_l154_c18_fb32_iftrue;
     MUX_uxn_c_l154_c18_fb32_iffalse <= VAR_MUX_uxn_c_l154_c18_fb32_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l154_c18_fb32_return_output := MUX_uxn_c_l154_c18_fb32_return_output;

     -- Submodule level 7
     VAR_BIN_OP_OR_uxn_c_l165_c3_caa7_left := VAR_BIN_OP_AND_uxn_c_l158_c19_1b9f_return_output;
     VAR_MUX_uxn_c_l164_c3_fa12_cond := VAR_BIN_OP_AND_uxn_c_l158_c19_1b9f_return_output;
     REG_VAR_is_fill_pixel0 := VAR_BIN_OP_AND_uxn_c_l158_c19_1b9f_return_output;
     VAR_BIN_OP_AND_uxn_c_l165_c22_479b_left := VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l172_l165_DUPLICATE_0941_return_output;
     VAR_BIN_OP_AND_uxn_c_l172_c22_6539_left := VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l172_l165_DUPLICATE_0941_return_output;
     VAR_fill_pixels_remaining_uxn_c_l144_c3_d32a := resize(VAR_BIN_OP_INFERRED_MULT_uxn_c_l144_c28_31ce_return_output, 16);
     VAR_MUX_uxn_c_l152_c26_d61c_iftrue := resize(VAR_BIN_OP_PLUS_uxn_c_l152_c45_1b28_return_output, 16);
     VAR_MUX_uxn_c_l155_c6_3ba3_cond := VAR_MUX_uxn_c_l154_c18_fb32_return_output;
     VAR_MUX_uxn_c_l156_c6_e29c_cond := VAR_MUX_uxn_c_l154_c18_fb32_return_output;
     REG_VAR_is_fill_left := VAR_MUX_uxn_c_l154_c18_fb32_return_output;
     VAR_fg_vram_update_uxn_c_l168_c19_2417_write_value := VAR_MUX_uxn_c_l171_c3_18c9_return_output;
     VAR_fill_pixels_remaining_MUX_uxn_c_l132_c2_8574_iftrue := VAR_fill_pixels_remaining_uxn_c_l144_c3_d32a;
     -- MUX[uxn_c_l164_c3_fa12] LATENCY=0
     -- Inputs
     MUX_uxn_c_l164_c3_fa12_cond <= VAR_MUX_uxn_c_l164_c3_fa12_cond;
     MUX_uxn_c_l164_c3_fa12_iftrue <= VAR_MUX_uxn_c_l164_c3_fa12_iftrue;
     MUX_uxn_c_l164_c3_fa12_iffalse <= VAR_MUX_uxn_c_l164_c3_fa12_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l164_c3_fa12_return_output := MUX_uxn_c_l164_c3_fa12_return_output;

     -- BIN_OP_AND[uxn_c_l165_c22_479b] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l165_c22_479b_left <= VAR_BIN_OP_AND_uxn_c_l165_c22_479b_left;
     BIN_OP_AND_uxn_c_l165_c22_479b_right <= VAR_BIN_OP_AND_uxn_c_l165_c22_479b_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l165_c22_479b_return_output := BIN_OP_AND_uxn_c_l165_c22_479b_return_output;

     -- MUX[uxn_c_l152_c26_d61c] LATENCY=0
     -- Inputs
     MUX_uxn_c_l152_c26_d61c_cond <= VAR_MUX_uxn_c_l152_c26_d61c_cond;
     MUX_uxn_c_l152_c26_d61c_iftrue <= VAR_MUX_uxn_c_l152_c26_d61c_iftrue;
     MUX_uxn_c_l152_c26_d61c_iffalse <= VAR_MUX_uxn_c_l152_c26_d61c_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l152_c26_d61c_return_output := MUX_uxn_c_l152_c26_d61c_return_output;

     -- MUX[uxn_c_l155_c6_3ba3] LATENCY=0
     -- Inputs
     MUX_uxn_c_l155_c6_3ba3_cond <= VAR_MUX_uxn_c_l155_c6_3ba3_cond;
     MUX_uxn_c_l155_c6_3ba3_iftrue <= VAR_MUX_uxn_c_l155_c6_3ba3_iftrue;
     MUX_uxn_c_l155_c6_3ba3_iffalse <= VAR_MUX_uxn_c_l155_c6_3ba3_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l155_c6_3ba3_return_output := MUX_uxn_c_l155_c6_3ba3_return_output;

     -- BIN_OP_AND[uxn_c_l172_c22_6539] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l172_c22_6539_left <= VAR_BIN_OP_AND_uxn_c_l172_c22_6539_left;
     BIN_OP_AND_uxn_c_l172_c22_6539_right <= VAR_BIN_OP_AND_uxn_c_l172_c22_6539_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l172_c22_6539_return_output := BIN_OP_AND_uxn_c_l172_c22_6539_return_output;

     -- MUX[uxn_c_l156_c6_e29c] LATENCY=0
     -- Inputs
     MUX_uxn_c_l156_c6_e29c_cond <= VAR_MUX_uxn_c_l156_c6_e29c_cond;
     MUX_uxn_c_l156_c6_e29c_iftrue <= VAR_MUX_uxn_c_l156_c6_e29c_iftrue;
     MUX_uxn_c_l156_c6_e29c_iffalse <= VAR_MUX_uxn_c_l156_c6_e29c_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l156_c6_e29c_return_output := MUX_uxn_c_l156_c6_e29c_return_output;

     -- fill_pixels_remaining_MUX[uxn_c_l132_c2_8574] LATENCY=0
     -- Inputs
     fill_pixels_remaining_MUX_uxn_c_l132_c2_8574_cond <= VAR_fill_pixels_remaining_MUX_uxn_c_l132_c2_8574_cond;
     fill_pixels_remaining_MUX_uxn_c_l132_c2_8574_iftrue <= VAR_fill_pixels_remaining_MUX_uxn_c_l132_c2_8574_iftrue;
     fill_pixels_remaining_MUX_uxn_c_l132_c2_8574_iffalse <= VAR_fill_pixels_remaining_MUX_uxn_c_l132_c2_8574_iffalse;
     -- Outputs
     VAR_fill_pixels_remaining_MUX_uxn_c_l132_c2_8574_return_output := fill_pixels_remaining_MUX_uxn_c_l132_c2_8574_return_output;

     -- Submodule level 8
     VAR_BIN_OP_OR_uxn_c_l165_c3_caa7_right := VAR_BIN_OP_AND_uxn_c_l165_c22_479b_return_output;
     VAR_BIN_OP_OR_uxn_c_l172_c3_f6a2_right := VAR_BIN_OP_AND_uxn_c_l172_c22_6539_return_output;
     REG_VAR_adjusted_vram_address := VAR_MUX_uxn_c_l152_c26_d61c_return_output;
     VAR_bg_vram_update_uxn_c_l161_c19_0a9c_write_address := VAR_MUX_uxn_c_l152_c26_d61c_return_output;
     VAR_fg_vram_update_uxn_c_l168_c19_2417_write_address := VAR_MUX_uxn_c_l152_c26_d61c_return_output;
     REG_VAR_y := VAR_MUX_uxn_c_l155_c6_3ba3_return_output;
     REG_VAR_x := VAR_MUX_uxn_c_l156_c6_e29c_return_output;
     VAR_bg_vram_update_uxn_c_l161_c19_0a9c_write_value := VAR_MUX_uxn_c_l164_c3_fa12_return_output;
     VAR_BIN_OP_MINUS_uxn_c_l175_c43_b5e5_left := VAR_fill_pixels_remaining_MUX_uxn_c_l132_c2_8574_return_output;
     -- BIN_OP_OR[uxn_c_l165_c3_caa7] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l165_c3_caa7_left <= VAR_BIN_OP_OR_uxn_c_l165_c3_caa7_left;
     BIN_OP_OR_uxn_c_l165_c3_caa7_right <= VAR_BIN_OP_OR_uxn_c_l165_c3_caa7_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l165_c3_caa7_return_output := BIN_OP_OR_uxn_c_l165_c3_caa7_return_output;

     -- BIN_OP_OR[uxn_c_l172_c3_f6a2] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l172_c3_f6a2_left <= VAR_BIN_OP_OR_uxn_c_l172_c3_f6a2_left;
     BIN_OP_OR_uxn_c_l172_c3_f6a2_right <= VAR_BIN_OP_OR_uxn_c_l172_c3_f6a2_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l172_c3_f6a2_return_output := BIN_OP_OR_uxn_c_l172_c3_f6a2_return_output;

     -- BIN_OP_MINUS[uxn_c_l175_c43_b5e5] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l175_c43_b5e5_left <= VAR_BIN_OP_MINUS_uxn_c_l175_c43_b5e5_left;
     BIN_OP_MINUS_uxn_c_l175_c43_b5e5_right <= VAR_BIN_OP_MINUS_uxn_c_l175_c43_b5e5_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l175_c43_b5e5_return_output := BIN_OP_MINUS_uxn_c_l175_c43_b5e5_return_output;

     -- Submodule level 9
     VAR_MUX_uxn_c_l175_c26_f10c_iftrue := VAR_BIN_OP_MINUS_uxn_c_l175_c43_b5e5_return_output;
     VAR_bg_vram_update_uxn_c_l161_c19_0a9c_write_enable := VAR_BIN_OP_OR_uxn_c_l165_c3_caa7_return_output;
     VAR_fg_vram_update_uxn_c_l168_c19_2417_write_enable := VAR_BIN_OP_OR_uxn_c_l172_c3_f6a2_return_output;
     -- fg_vram_update[uxn_c_l168_c19_2417] LATENCY=0
     -- Clock enable
     fg_vram_update_uxn_c_l168_c19_2417_CLOCK_ENABLE <= VAR_fg_vram_update_uxn_c_l168_c19_2417_CLOCK_ENABLE;
     -- Inputs
     fg_vram_update_uxn_c_l168_c19_2417_read_address <= VAR_fg_vram_update_uxn_c_l168_c19_2417_read_address;
     fg_vram_update_uxn_c_l168_c19_2417_write_address <= VAR_fg_vram_update_uxn_c_l168_c19_2417_write_address;
     fg_vram_update_uxn_c_l168_c19_2417_write_value <= VAR_fg_vram_update_uxn_c_l168_c19_2417_write_value;
     fg_vram_update_uxn_c_l168_c19_2417_write_enable <= VAR_fg_vram_update_uxn_c_l168_c19_2417_write_enable;
     -- Outputs
     VAR_fg_vram_update_uxn_c_l168_c19_2417_return_output := fg_vram_update_uxn_c_l168_c19_2417_return_output;

     -- MUX[uxn_c_l175_c26_f10c] LATENCY=0
     -- Inputs
     MUX_uxn_c_l175_c26_f10c_cond <= VAR_MUX_uxn_c_l175_c26_f10c_cond;
     MUX_uxn_c_l175_c26_f10c_iftrue <= VAR_MUX_uxn_c_l175_c26_f10c_iftrue;
     MUX_uxn_c_l175_c26_f10c_iffalse <= VAR_MUX_uxn_c_l175_c26_f10c_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l175_c26_f10c_return_output := MUX_uxn_c_l175_c26_f10c_return_output;

     -- bg_vram_update[uxn_c_l161_c19_0a9c] LATENCY=0
     -- Clock enable
     bg_vram_update_uxn_c_l161_c19_0a9c_CLOCK_ENABLE <= VAR_bg_vram_update_uxn_c_l161_c19_0a9c_CLOCK_ENABLE;
     -- Inputs
     bg_vram_update_uxn_c_l161_c19_0a9c_read_address <= VAR_bg_vram_update_uxn_c_l161_c19_0a9c_read_address;
     bg_vram_update_uxn_c_l161_c19_0a9c_write_address <= VAR_bg_vram_update_uxn_c_l161_c19_0a9c_write_address;
     bg_vram_update_uxn_c_l161_c19_0a9c_write_value <= VAR_bg_vram_update_uxn_c_l161_c19_0a9c_write_value;
     bg_vram_update_uxn_c_l161_c19_0a9c_write_enable <= VAR_bg_vram_update_uxn_c_l161_c19_0a9c_write_enable;
     -- Outputs
     VAR_bg_vram_update_uxn_c_l161_c19_0a9c_return_output := bg_vram_update_uxn_c_l161_c19_0a9c_return_output;

     -- Submodule level 10
     VAR_BIN_OP_EQ_uxn_c_l176_c19_f9a5_left := VAR_MUX_uxn_c_l175_c26_f10c_return_output;
     REG_VAR_fill_pixels_remaining := VAR_MUX_uxn_c_l175_c26_f10c_return_output;
     VAR_MUX_uxn_c_l179_c17_1079_iftrue := VAR_bg_vram_update_uxn_c_l161_c19_0a9c_return_output;
     REG_VAR_bg_pixel_color := VAR_bg_vram_update_uxn_c_l161_c19_0a9c_return_output;
     VAR_BIN_OP_EQ_uxn_c_l179_c17_55be_left := VAR_fg_vram_update_uxn_c_l168_c19_2417_return_output;
     VAR_MUX_uxn_c_l179_c17_1079_iffalse := VAR_fg_vram_update_uxn_c_l168_c19_2417_return_output;
     REG_VAR_fg_pixel_color := VAR_fg_vram_update_uxn_c_l168_c19_2417_return_output;
     -- BIN_OP_EQ[uxn_c_l176_c19_f9a5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l176_c19_f9a5_left <= VAR_BIN_OP_EQ_uxn_c_l176_c19_f9a5_left;
     BIN_OP_EQ_uxn_c_l176_c19_f9a5_right <= VAR_BIN_OP_EQ_uxn_c_l176_c19_f9a5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l176_c19_f9a5_return_output := BIN_OP_EQ_uxn_c_l176_c19_f9a5_return_output;

     -- BIN_OP_EQ[uxn_c_l179_c17_55be] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l179_c17_55be_left <= VAR_BIN_OP_EQ_uxn_c_l179_c17_55be_left;
     BIN_OP_EQ_uxn_c_l179_c17_55be_right <= VAR_BIN_OP_EQ_uxn_c_l179_c17_55be_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l179_c17_55be_return_output := BIN_OP_EQ_uxn_c_l179_c17_55be_return_output;

     -- Submodule level 11
     VAR_MUX_uxn_c_l176_c19_92eb_cond := VAR_BIN_OP_EQ_uxn_c_l176_c19_f9a5_return_output;
     VAR_MUX_uxn_c_l179_c17_1079_cond := VAR_BIN_OP_EQ_uxn_c_l179_c17_55be_return_output;
     -- MUX[uxn_c_l176_c19_92eb] LATENCY=0
     -- Inputs
     MUX_uxn_c_l176_c19_92eb_cond <= VAR_MUX_uxn_c_l176_c19_92eb_cond;
     MUX_uxn_c_l176_c19_92eb_iftrue <= VAR_MUX_uxn_c_l176_c19_92eb_iftrue;
     MUX_uxn_c_l176_c19_92eb_iffalse <= VAR_MUX_uxn_c_l176_c19_92eb_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l176_c19_92eb_return_output := MUX_uxn_c_l176_c19_92eb_return_output;

     -- MUX[uxn_c_l179_c17_1079] LATENCY=0
     -- Inputs
     MUX_uxn_c_l179_c17_1079_cond <= VAR_MUX_uxn_c_l179_c17_1079_cond;
     MUX_uxn_c_l179_c17_1079_iftrue <= VAR_MUX_uxn_c_l179_c17_1079_iftrue;
     MUX_uxn_c_l179_c17_1079_iffalse <= VAR_MUX_uxn_c_l179_c17_1079_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l179_c17_1079_return_output := MUX_uxn_c_l179_c17_1079_return_output;

     -- Submodule level 12
     REG_VAR_is_fill_active := VAR_MUX_uxn_c_l176_c19_92eb_return_output;
     -- CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_269d_uxn_c_l115_l182_DUPLICATE_9ad6 LATENCY=0
     VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_269d_uxn_c_l115_l182_DUPLICATE_9ad6_return_output := CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_269d(
     VAR_MUX_uxn_c_l178_c25_c6a4_return_output,
     VAR_MUX_uxn_c_l179_c17_1079_return_output,
     VAR_MUX_uxn_c_l176_c19_92eb_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_269d_uxn_c_l115_l182_DUPLICATE_9ad6_return_output;
     VAR_return_output := VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_269d_uxn_c_l115_l182_DUPLICATE_9ad6_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_result <= REG_VAR_result;
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
