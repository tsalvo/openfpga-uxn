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
entity step_gpu_0CLK_c787a2c4 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 is_active_drawing_area : in unsigned(0 downto 0);
 is_vram_write : in unsigned(0 downto 0);
 vram_write_layer : in unsigned(0 downto 0);
 vram_address : in unsigned(15 downto 0);
 vram_value : in unsigned(7 downto 0);
 return_output : out gpu_step_result_t);
end step_gpu_0CLK_c787a2c4;
architecture arch of step_gpu_0CLK_c787a2c4 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
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
-- CONST_SR_4[uxn_c_l126_c52_a113]
signal CONST_SR_4_uxn_c_l126_c52_a113_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_c_l126_c52_a113_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_c_l126_c25_67be]
signal BIN_OP_AND_uxn_c_l126_c25_67be_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l126_c25_67be_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l126_c25_67be_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_c_l129_c22_5f7a]
signal UNARY_OP_NOT_uxn_c_l129_c22_5f7a_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l129_c22_5f7a_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l129_c6_576b]
signal BIN_OP_AND_uxn_c_l129_c6_576b_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l129_c6_576b_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l129_c6_576b_return_output : unsigned(0 downto 0);

-- fill_y1_MUX[uxn_c_l129_c2_7d06]
signal fill_y1_MUX_uxn_c_l129_c2_7d06_cond : unsigned(0 downto 0);
signal fill_y1_MUX_uxn_c_l129_c2_7d06_iftrue : unsigned(15 downto 0);
signal fill_y1_MUX_uxn_c_l129_c2_7d06_iffalse : unsigned(15 downto 0);
signal fill_y1_MUX_uxn_c_l129_c2_7d06_return_output : unsigned(15 downto 0);

-- is_fill_active_MUX[uxn_c_l129_c2_7d06]
signal is_fill_active_MUX_uxn_c_l129_c2_7d06_cond : unsigned(0 downto 0);
signal is_fill_active_MUX_uxn_c_l129_c2_7d06_iftrue : unsigned(0 downto 0);
signal is_fill_active_MUX_uxn_c_l129_c2_7d06_iffalse : unsigned(0 downto 0);
signal is_fill_active_MUX_uxn_c_l129_c2_7d06_return_output : unsigned(0 downto 0);

-- fill_pixels_remaining_MUX[uxn_c_l129_c2_7d06]
signal fill_pixels_remaining_MUX_uxn_c_l129_c2_7d06_cond : unsigned(0 downto 0);
signal fill_pixels_remaining_MUX_uxn_c_l129_c2_7d06_iftrue : unsigned(15 downto 0);
signal fill_pixels_remaining_MUX_uxn_c_l129_c2_7d06_iffalse : unsigned(15 downto 0);
signal fill_pixels_remaining_MUX_uxn_c_l129_c2_7d06_return_output : unsigned(15 downto 0);

-- fill_color_MUX[uxn_c_l129_c2_7d06]
signal fill_color_MUX_uxn_c_l129_c2_7d06_cond : unsigned(0 downto 0);
signal fill_color_MUX_uxn_c_l129_c2_7d06_iftrue : unsigned(1 downto 0);
signal fill_color_MUX_uxn_c_l129_c2_7d06_iffalse : unsigned(1 downto 0);
signal fill_color_MUX_uxn_c_l129_c2_7d06_return_output : unsigned(1 downto 0);

-- y_MUX[uxn_c_l129_c2_7d06]
signal y_MUX_uxn_c_l129_c2_7d06_cond : unsigned(0 downto 0);
signal y_MUX_uxn_c_l129_c2_7d06_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_c_l129_c2_7d06_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_c_l129_c2_7d06_return_output : unsigned(15 downto 0);

-- fill_y0_MUX[uxn_c_l129_c2_7d06]
signal fill_y0_MUX_uxn_c_l129_c2_7d06_cond : unsigned(0 downto 0);
signal fill_y0_MUX_uxn_c_l129_c2_7d06_iftrue : unsigned(15 downto 0);
signal fill_y0_MUX_uxn_c_l129_c2_7d06_iffalse : unsigned(15 downto 0);
signal fill_y0_MUX_uxn_c_l129_c2_7d06_return_output : unsigned(15 downto 0);

-- fill_x0_MUX[uxn_c_l129_c2_7d06]
signal fill_x0_MUX_uxn_c_l129_c2_7d06_cond : unsigned(0 downto 0);
signal fill_x0_MUX_uxn_c_l129_c2_7d06_iftrue : unsigned(15 downto 0);
signal fill_x0_MUX_uxn_c_l129_c2_7d06_iffalse : unsigned(15 downto 0);
signal fill_x0_MUX_uxn_c_l129_c2_7d06_return_output : unsigned(15 downto 0);

-- fill_x1_MUX[uxn_c_l129_c2_7d06]
signal fill_x1_MUX_uxn_c_l129_c2_7d06_cond : unsigned(0 downto 0);
signal fill_x1_MUX_uxn_c_l129_c2_7d06_iftrue : unsigned(15 downto 0);
signal fill_x1_MUX_uxn_c_l129_c2_7d06_iffalse : unsigned(15 downto 0);
signal fill_x1_MUX_uxn_c_l129_c2_7d06_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_c_l129_c2_7d06]
signal x_MUX_uxn_c_l129_c2_7d06_cond : unsigned(0 downto 0);
signal x_MUX_uxn_c_l129_c2_7d06_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_c_l129_c2_7d06_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_c_l129_c2_7d06_return_output : unsigned(15 downto 0);

-- fill_layer_MUX[uxn_c_l129_c2_7d06]
signal fill_layer_MUX_uxn_c_l129_c2_7d06_cond : unsigned(0 downto 0);
signal fill_layer_MUX_uxn_c_l129_c2_7d06_iftrue : unsigned(0 downto 0);
signal fill_layer_MUX_uxn_c_l129_c2_7d06_iffalse : unsigned(0 downto 0);
signal fill_layer_MUX_uxn_c_l129_c2_7d06_return_output : unsigned(0 downto 0);

-- CONST_SR_2[uxn_c_l131_c25_3cde]
signal CONST_SR_2_uxn_c_l131_c25_3cde_x : unsigned(7 downto 0);
signal CONST_SR_2_uxn_c_l131_c25_3cde_return_output : unsigned(7 downto 0);

-- CONST_SR_3[uxn_c_l132_c26_c68b]
signal CONST_SR_3_uxn_c_l132_c26_c68b_x : unsigned(7 downto 0);
signal CONST_SR_3_uxn_c_l132_c26_c68b_return_output : unsigned(7 downto 0);

-- BIN_OP_DIV[uxn_c_l133_c13_a27e]
signal BIN_OP_DIV_uxn_c_l133_c13_a27e_left : unsigned(15 downto 0);
signal BIN_OP_DIV_uxn_c_l133_c13_a27e_right : unsigned(8 downto 0);
signal BIN_OP_DIV_uxn_c_l133_c13_a27e_return_output : unsigned(15 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_c_l134_c29_2db1]
signal BIN_OP_INFERRED_MULT_uxn_c_l134_c29_2db1_left : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_c_l134_c29_2db1_right : unsigned(8 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_c_l134_c29_2db1_return_output : unsigned(24 downto 0);

-- BIN_OP_MINUS[uxn_c_l134_c13_22c1]
signal BIN_OP_MINUS_uxn_c_l134_c13_22c1_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_c_l134_c13_22c1_right : unsigned(24 downto 0);
signal BIN_OP_MINUS_uxn_c_l134_c13_22c1_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l135_c13_6184]
signal MUX_uxn_c_l135_c13_6184_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l135_c13_6184_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l135_c13_6184_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l135_c13_6184_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l136_c13_d407]
signal MUX_uxn_c_l136_c13_d407_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l136_c13_d407_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l136_c13_d407_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l136_c13_d407_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l137_c13_8f64]
signal MUX_uxn_c_l137_c13_8f64_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l137_c13_8f64_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l137_c13_8f64_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l137_c13_8f64_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l138_c13_7415]
signal MUX_uxn_c_l138_c13_7415_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l138_c13_7415_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l138_c13_7415_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l138_c13_7415_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_c_l141_c28_17ee]
signal BIN_OP_MINUS_uxn_c_l141_c28_17ee_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_c_l141_c28_17ee_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_c_l141_c28_17ee_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_c_l141_c28_fc95]
signal BIN_OP_PLUS_uxn_c_l141_c28_fc95_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l141_c28_fc95_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l141_c28_fc95_return_output : unsigned(16 downto 0);

-- BIN_OP_MINUS[uxn_c_l141_c54_63ba]
signal BIN_OP_MINUS_uxn_c_l141_c54_63ba_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_c_l141_c54_63ba_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_c_l141_c54_63ba_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_c_l141_c54_fc23]
signal BIN_OP_PLUS_uxn_c_l141_c54_fc23_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l141_c54_fc23_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l141_c54_fc23_return_output : unsigned(16 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_c_l141_c28_7dcb]
signal BIN_OP_INFERRED_MULT_uxn_c_l141_c28_7dcb_left : unsigned(16 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_c_l141_c28_7dcb_right : unsigned(16 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_c_l141_c28_7dcb_return_output : unsigned(33 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_c_l149_c54_3c4e]
signal BIN_OP_INFERRED_MULT_uxn_c_l149_c54_3c4e_left : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_c_l149_c54_3c4e_right : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_c_l149_c54_3c4e_return_output : unsigned(31 downto 0);

-- BIN_OP_PLUS[uxn_c_l149_c54_4f55]
signal BIN_OP_PLUS_uxn_c_l149_c54_4f55_left : unsigned(31 downto 0);
signal BIN_OP_PLUS_uxn_c_l149_c54_4f55_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l149_c54_4f55_return_output : unsigned(32 downto 0);

-- MUX[uxn_c_l149_c35_1d2f]
signal MUX_uxn_c_l149_c35_1d2f_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l149_c35_1d2f_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l149_c35_1d2f_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l149_c35_1d2f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l151_c29_8b60]
signal BIN_OP_EQ_uxn_c_l151_c29_8b60_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l151_c29_8b60_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l151_c29_8b60_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l151_c29_339f]
signal MUX_uxn_c_l151_c29_339f_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l151_c29_339f_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l151_c29_339f_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l151_c29_339f_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l152_c25_efaa]
signal BIN_OP_PLUS_uxn_c_l152_c25_efaa_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l152_c25_efaa_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l152_c25_efaa_return_output : unsigned(16 downto 0);

-- MUX[uxn_c_l152_c6_d938]
signal MUX_uxn_c_l152_c6_d938_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l152_c6_d938_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l152_c6_d938_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l152_c6_d938_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_c_l153_c34_4e7a]
signal BIN_OP_PLUS_uxn_c_l153_c34_4e7a_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l153_c34_4e7a_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l153_c34_4e7a_return_output : unsigned(16 downto 0);

-- MUX[uxn_c_l153_c6_80ee]
signal MUX_uxn_c_l153_c6_80ee_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l153_c6_80ee_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l153_c6_80ee_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l153_c6_80ee_return_output : unsigned(15 downto 0);

-- UNARY_OP_NOT[uxn_c_l155_c46_7cef]
signal UNARY_OP_NOT_uxn_c_l155_c46_7cef_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l155_c46_7cef_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l155_c27_406c]
signal BIN_OP_AND_uxn_c_l155_c27_406c_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l155_c27_406c_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l155_c27_406c_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l156_c27_6951]
signal BIN_OP_AND_uxn_c_l156_c27_6951_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l156_c27_6951_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l156_c27_6951_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l161_c3_1dbd]
signal MUX_uxn_c_l161_c3_1dbd_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l161_c3_1dbd_iftrue : unsigned(1 downto 0);
signal MUX_uxn_c_l161_c3_1dbd_iffalse : unsigned(1 downto 0);
signal MUX_uxn_c_l161_c3_1dbd_return_output : unsigned(1 downto 0);

-- UNARY_OP_NOT[uxn_c_l162_c57_e86b]
signal UNARY_OP_NOT_uxn_c_l162_c57_e86b_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l162_c57_e86b_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l162_c22_5959]
signal BIN_OP_AND_uxn_c_l162_c22_5959_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l162_c22_5959_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l162_c22_5959_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_c_l162_c3_1a0e]
signal BIN_OP_OR_uxn_c_l162_c3_1a0e_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l162_c3_1a0e_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l162_c3_1a0e_return_output : unsigned(0 downto 0);

-- bg_vram_update[uxn_c_l158_c27_60ac]
signal bg_vram_update_uxn_c_l158_c27_60ac_CLOCK_ENABLE : unsigned(0 downto 0);
signal bg_vram_update_uxn_c_l158_c27_60ac_read_address : unsigned(15 downto 0);
signal bg_vram_update_uxn_c_l158_c27_60ac_write_address : unsigned(15 downto 0);
signal bg_vram_update_uxn_c_l158_c27_60ac_write_value : unsigned(1 downto 0);
signal bg_vram_update_uxn_c_l158_c27_60ac_write_enable : unsigned(0 downto 0);
signal bg_vram_update_uxn_c_l158_c27_60ac_return_output : unsigned(1 downto 0);

-- MUX[uxn_c_l168_c3_4759]
signal MUX_uxn_c_l168_c3_4759_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l168_c3_4759_iftrue : unsigned(1 downto 0);
signal MUX_uxn_c_l168_c3_4759_iffalse : unsigned(1 downto 0);
signal MUX_uxn_c_l168_c3_4759_return_output : unsigned(1 downto 0);

-- BIN_OP_AND[uxn_c_l169_c22_6bb1]
signal BIN_OP_AND_uxn_c_l169_c22_6bb1_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l169_c22_6bb1_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l169_c22_6bb1_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_c_l169_c3_49fa]
signal BIN_OP_OR_uxn_c_l169_c3_49fa_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l169_c3_49fa_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l169_c3_49fa_return_output : unsigned(0 downto 0);

-- fg_vram_update[uxn_c_l165_c27_13c9]
signal fg_vram_update_uxn_c_l165_c27_13c9_CLOCK_ENABLE : unsigned(0 downto 0);
signal fg_vram_update_uxn_c_l165_c27_13c9_read_address : unsigned(15 downto 0);
signal fg_vram_update_uxn_c_l165_c27_13c9_write_address : unsigned(15 downto 0);
signal fg_vram_update_uxn_c_l165_c27_13c9_write_value : unsigned(1 downto 0);
signal fg_vram_update_uxn_c_l165_c27_13c9_write_enable : unsigned(0 downto 0);
signal fg_vram_update_uxn_c_l165_c27_13c9_return_output : unsigned(1 downto 0);

-- BIN_OP_MINUS[uxn_c_l172_c43_5c05]
signal BIN_OP_MINUS_uxn_c_l172_c43_5c05_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_c_l172_c43_5c05_right : unsigned(0 downto 0);
signal BIN_OP_MINUS_uxn_c_l172_c43_5c05_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l172_c26_7a68]
signal MUX_uxn_c_l172_c26_7a68_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l172_c26_7a68_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l172_c26_7a68_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l172_c26_7a68_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l173_c19_c682]
signal BIN_OP_EQ_uxn_c_l173_c19_c682_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l173_c19_c682_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l173_c19_c682_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l173_c19_25ba]
signal MUX_uxn_c_l173_c19_25ba_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l173_c19_25ba_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l173_c19_25ba_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l173_c19_25ba_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l174_c19_947f]
signal BIN_OP_EQ_uxn_c_l174_c19_947f_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l174_c19_947f_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l174_c19_947f_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l174_c76_7864]
signal BIN_OP_PLUS_uxn_c_l174_c76_7864_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l174_c76_7864_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l174_c76_7864_return_output : unsigned(16 downto 0);

-- MUX[uxn_c_l174_c50_b02c]
signal MUX_uxn_c_l174_c50_b02c_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l174_c50_b02c_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l174_c50_b02c_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l174_c50_b02c_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l174_c19_8fd4]
signal MUX_uxn_c_l174_c19_8fd4_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l174_c19_8fd4_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l174_c19_8fd4_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l174_c19_8fd4_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l175_c25_6dca]
signal BIN_OP_EQ_uxn_c_l175_c25_6dca_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l175_c25_6dca_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l175_c25_6dca_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l175_c25_30ef]
signal MUX_uxn_c_l175_c25_30ef_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l175_c25_30ef_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l175_c25_30ef_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l175_c25_30ef_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l176_c17_364a]
signal BIN_OP_EQ_uxn_c_l176_c17_364a_left : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l176_c17_364a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l176_c17_364a_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l176_c17_58e0]
signal MUX_uxn_c_l176_c17_58e0_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l176_c17_58e0_iftrue : unsigned(1 downto 0);
signal MUX_uxn_c_l176_c17_58e0_iffalse : unsigned(1 downto 0);
signal MUX_uxn_c_l176_c17_58e0_return_output : unsigned(1 downto 0);

-- UNARY_OP_NOT_uint1_t_uxn_c_l169_l162_DUPLICATE_fe08
signal UNARY_OP_NOT_uint1_t_uxn_c_l169_l162_DUPLICATE_fe08_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uint1_t_uxn_c_l169_l162_DUPLICATE_fe08_return_output : unsigned(0 downto 0);

-- BIN_OP_AND_uint1_t_uint1_t_uxn_c_l162_l169_DUPLICATE_0eed
signal BIN_OP_AND_uint1_t_uint1_t_uxn_c_l162_l169_DUPLICATE_0eed_left : unsigned(0 downto 0);
signal BIN_OP_AND_uint1_t_uint1_t_uxn_c_l162_l169_DUPLICATE_0eed_right : unsigned(0 downto 0);
signal BIN_OP_AND_uint1_t_uint1_t_uxn_c_l162_l169_DUPLICATE_0eed_return_output : unsigned(0 downto 0);

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
-- CONST_SR_4_uxn_c_l126_c52_a113
CONST_SR_4_uxn_c_l126_c52_a113 : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_c_l126_c52_a113_x,
CONST_SR_4_uxn_c_l126_c52_a113_return_output);

-- BIN_OP_AND_uxn_c_l126_c25_67be
BIN_OP_AND_uxn_c_l126_c25_67be : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l126_c25_67be_left,
BIN_OP_AND_uxn_c_l126_c25_67be_right,
BIN_OP_AND_uxn_c_l126_c25_67be_return_output);

-- UNARY_OP_NOT_uxn_c_l129_c22_5f7a
UNARY_OP_NOT_uxn_c_l129_c22_5f7a : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l129_c22_5f7a_expr,
UNARY_OP_NOT_uxn_c_l129_c22_5f7a_return_output);

-- BIN_OP_AND_uxn_c_l129_c6_576b
BIN_OP_AND_uxn_c_l129_c6_576b : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l129_c6_576b_left,
BIN_OP_AND_uxn_c_l129_c6_576b_right,
BIN_OP_AND_uxn_c_l129_c6_576b_return_output);

-- fill_y1_MUX_uxn_c_l129_c2_7d06
fill_y1_MUX_uxn_c_l129_c2_7d06 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_y1_MUX_uxn_c_l129_c2_7d06_cond,
fill_y1_MUX_uxn_c_l129_c2_7d06_iftrue,
fill_y1_MUX_uxn_c_l129_c2_7d06_iffalse,
fill_y1_MUX_uxn_c_l129_c2_7d06_return_output);

-- is_fill_active_MUX_uxn_c_l129_c2_7d06
is_fill_active_MUX_uxn_c_l129_c2_7d06 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_active_MUX_uxn_c_l129_c2_7d06_cond,
is_fill_active_MUX_uxn_c_l129_c2_7d06_iftrue,
is_fill_active_MUX_uxn_c_l129_c2_7d06_iffalse,
is_fill_active_MUX_uxn_c_l129_c2_7d06_return_output);

-- fill_pixels_remaining_MUX_uxn_c_l129_c2_7d06
fill_pixels_remaining_MUX_uxn_c_l129_c2_7d06 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_pixels_remaining_MUX_uxn_c_l129_c2_7d06_cond,
fill_pixels_remaining_MUX_uxn_c_l129_c2_7d06_iftrue,
fill_pixels_remaining_MUX_uxn_c_l129_c2_7d06_iffalse,
fill_pixels_remaining_MUX_uxn_c_l129_c2_7d06_return_output);

-- fill_color_MUX_uxn_c_l129_c2_7d06
fill_color_MUX_uxn_c_l129_c2_7d06 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
fill_color_MUX_uxn_c_l129_c2_7d06_cond,
fill_color_MUX_uxn_c_l129_c2_7d06_iftrue,
fill_color_MUX_uxn_c_l129_c2_7d06_iffalse,
fill_color_MUX_uxn_c_l129_c2_7d06_return_output);

-- y_MUX_uxn_c_l129_c2_7d06
y_MUX_uxn_c_l129_c2_7d06 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_c_l129_c2_7d06_cond,
y_MUX_uxn_c_l129_c2_7d06_iftrue,
y_MUX_uxn_c_l129_c2_7d06_iffalse,
y_MUX_uxn_c_l129_c2_7d06_return_output);

-- fill_y0_MUX_uxn_c_l129_c2_7d06
fill_y0_MUX_uxn_c_l129_c2_7d06 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_y0_MUX_uxn_c_l129_c2_7d06_cond,
fill_y0_MUX_uxn_c_l129_c2_7d06_iftrue,
fill_y0_MUX_uxn_c_l129_c2_7d06_iffalse,
fill_y0_MUX_uxn_c_l129_c2_7d06_return_output);

-- fill_x0_MUX_uxn_c_l129_c2_7d06
fill_x0_MUX_uxn_c_l129_c2_7d06 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_x0_MUX_uxn_c_l129_c2_7d06_cond,
fill_x0_MUX_uxn_c_l129_c2_7d06_iftrue,
fill_x0_MUX_uxn_c_l129_c2_7d06_iffalse,
fill_x0_MUX_uxn_c_l129_c2_7d06_return_output);

-- fill_x1_MUX_uxn_c_l129_c2_7d06
fill_x1_MUX_uxn_c_l129_c2_7d06 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_x1_MUX_uxn_c_l129_c2_7d06_cond,
fill_x1_MUX_uxn_c_l129_c2_7d06_iftrue,
fill_x1_MUX_uxn_c_l129_c2_7d06_iffalse,
fill_x1_MUX_uxn_c_l129_c2_7d06_return_output);

-- x_MUX_uxn_c_l129_c2_7d06
x_MUX_uxn_c_l129_c2_7d06 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_c_l129_c2_7d06_cond,
x_MUX_uxn_c_l129_c2_7d06_iftrue,
x_MUX_uxn_c_l129_c2_7d06_iffalse,
x_MUX_uxn_c_l129_c2_7d06_return_output);

-- fill_layer_MUX_uxn_c_l129_c2_7d06
fill_layer_MUX_uxn_c_l129_c2_7d06 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
fill_layer_MUX_uxn_c_l129_c2_7d06_cond,
fill_layer_MUX_uxn_c_l129_c2_7d06_iftrue,
fill_layer_MUX_uxn_c_l129_c2_7d06_iffalse,
fill_layer_MUX_uxn_c_l129_c2_7d06_return_output);

-- CONST_SR_2_uxn_c_l131_c25_3cde
CONST_SR_2_uxn_c_l131_c25_3cde : entity work.CONST_SR_2_uint8_t_0CLK_de264c78 port map (
CONST_SR_2_uxn_c_l131_c25_3cde_x,
CONST_SR_2_uxn_c_l131_c25_3cde_return_output);

-- CONST_SR_3_uxn_c_l132_c26_c68b
CONST_SR_3_uxn_c_l132_c26_c68b : entity work.CONST_SR_3_uint8_t_0CLK_de264c78 port map (
CONST_SR_3_uxn_c_l132_c26_c68b_x,
CONST_SR_3_uxn_c_l132_c26_c68b_return_output);

-- BIN_OP_DIV_uxn_c_l133_c13_a27e
BIN_OP_DIV_uxn_c_l133_c13_a27e : entity work.BIN_OP_DIV_uint16_t_uint9_t_0CLK_2b0015ee port map (
BIN_OP_DIV_uxn_c_l133_c13_a27e_left,
BIN_OP_DIV_uxn_c_l133_c13_a27e_right,
BIN_OP_DIV_uxn_c_l133_c13_a27e_return_output);

-- BIN_OP_INFERRED_MULT_uxn_c_l134_c29_2db1
BIN_OP_INFERRED_MULT_uxn_c_l134_c29_2db1 : entity work.BIN_OP_INFERRED_MULT_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_c_l134_c29_2db1_left,
BIN_OP_INFERRED_MULT_uxn_c_l134_c29_2db1_right,
BIN_OP_INFERRED_MULT_uxn_c_l134_c29_2db1_return_output);

-- BIN_OP_MINUS_uxn_c_l134_c13_22c1
BIN_OP_MINUS_uxn_c_l134_c13_22c1 : entity work.BIN_OP_MINUS_uint16_t_uint25_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l134_c13_22c1_left,
BIN_OP_MINUS_uxn_c_l134_c13_22c1_right,
BIN_OP_MINUS_uxn_c_l134_c13_22c1_return_output);

-- MUX_uxn_c_l135_c13_6184
MUX_uxn_c_l135_c13_6184 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l135_c13_6184_cond,
MUX_uxn_c_l135_c13_6184_iftrue,
MUX_uxn_c_l135_c13_6184_iffalse,
MUX_uxn_c_l135_c13_6184_return_output);

-- MUX_uxn_c_l136_c13_d407
MUX_uxn_c_l136_c13_d407 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l136_c13_d407_cond,
MUX_uxn_c_l136_c13_d407_iftrue,
MUX_uxn_c_l136_c13_d407_iffalse,
MUX_uxn_c_l136_c13_d407_return_output);

-- MUX_uxn_c_l137_c13_8f64
MUX_uxn_c_l137_c13_8f64 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l137_c13_8f64_cond,
MUX_uxn_c_l137_c13_8f64_iftrue,
MUX_uxn_c_l137_c13_8f64_iffalse,
MUX_uxn_c_l137_c13_8f64_return_output);

-- MUX_uxn_c_l138_c13_7415
MUX_uxn_c_l138_c13_7415 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l138_c13_7415_cond,
MUX_uxn_c_l138_c13_7415_iftrue,
MUX_uxn_c_l138_c13_7415_iffalse,
MUX_uxn_c_l138_c13_7415_return_output);

-- BIN_OP_MINUS_uxn_c_l141_c28_17ee
BIN_OP_MINUS_uxn_c_l141_c28_17ee : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l141_c28_17ee_left,
BIN_OP_MINUS_uxn_c_l141_c28_17ee_right,
BIN_OP_MINUS_uxn_c_l141_c28_17ee_return_output);

-- BIN_OP_PLUS_uxn_c_l141_c28_fc95
BIN_OP_PLUS_uxn_c_l141_c28_fc95 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l141_c28_fc95_left,
BIN_OP_PLUS_uxn_c_l141_c28_fc95_right,
BIN_OP_PLUS_uxn_c_l141_c28_fc95_return_output);

-- BIN_OP_MINUS_uxn_c_l141_c54_63ba
BIN_OP_MINUS_uxn_c_l141_c54_63ba : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l141_c54_63ba_left,
BIN_OP_MINUS_uxn_c_l141_c54_63ba_right,
BIN_OP_MINUS_uxn_c_l141_c54_63ba_return_output);

-- BIN_OP_PLUS_uxn_c_l141_c54_fc23
BIN_OP_PLUS_uxn_c_l141_c54_fc23 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l141_c54_fc23_left,
BIN_OP_PLUS_uxn_c_l141_c54_fc23_right,
BIN_OP_PLUS_uxn_c_l141_c54_fc23_return_output);

-- BIN_OP_INFERRED_MULT_uxn_c_l141_c28_7dcb
BIN_OP_INFERRED_MULT_uxn_c_l141_c28_7dcb : entity work.BIN_OP_INFERRED_MULT_uint17_t_uint17_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_c_l141_c28_7dcb_left,
BIN_OP_INFERRED_MULT_uxn_c_l141_c28_7dcb_right,
BIN_OP_INFERRED_MULT_uxn_c_l141_c28_7dcb_return_output);

-- BIN_OP_INFERRED_MULT_uxn_c_l149_c54_3c4e
BIN_OP_INFERRED_MULT_uxn_c_l149_c54_3c4e : entity work.BIN_OP_INFERRED_MULT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_c_l149_c54_3c4e_left,
BIN_OP_INFERRED_MULT_uxn_c_l149_c54_3c4e_right,
BIN_OP_INFERRED_MULT_uxn_c_l149_c54_3c4e_return_output);

-- BIN_OP_PLUS_uxn_c_l149_c54_4f55
BIN_OP_PLUS_uxn_c_l149_c54_4f55 : entity work.BIN_OP_PLUS_uint32_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l149_c54_4f55_left,
BIN_OP_PLUS_uxn_c_l149_c54_4f55_right,
BIN_OP_PLUS_uxn_c_l149_c54_4f55_return_output);

-- MUX_uxn_c_l149_c35_1d2f
MUX_uxn_c_l149_c35_1d2f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l149_c35_1d2f_cond,
MUX_uxn_c_l149_c35_1d2f_iftrue,
MUX_uxn_c_l149_c35_1d2f_iffalse,
MUX_uxn_c_l149_c35_1d2f_return_output);

-- BIN_OP_EQ_uxn_c_l151_c29_8b60
BIN_OP_EQ_uxn_c_l151_c29_8b60 : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l151_c29_8b60_left,
BIN_OP_EQ_uxn_c_l151_c29_8b60_right,
BIN_OP_EQ_uxn_c_l151_c29_8b60_return_output);

-- MUX_uxn_c_l151_c29_339f
MUX_uxn_c_l151_c29_339f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l151_c29_339f_cond,
MUX_uxn_c_l151_c29_339f_iftrue,
MUX_uxn_c_l151_c29_339f_iffalse,
MUX_uxn_c_l151_c29_339f_return_output);

-- BIN_OP_PLUS_uxn_c_l152_c25_efaa
BIN_OP_PLUS_uxn_c_l152_c25_efaa : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l152_c25_efaa_left,
BIN_OP_PLUS_uxn_c_l152_c25_efaa_right,
BIN_OP_PLUS_uxn_c_l152_c25_efaa_return_output);

-- MUX_uxn_c_l152_c6_d938
MUX_uxn_c_l152_c6_d938 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l152_c6_d938_cond,
MUX_uxn_c_l152_c6_d938_iftrue,
MUX_uxn_c_l152_c6_d938_iffalse,
MUX_uxn_c_l152_c6_d938_return_output);

-- BIN_OP_PLUS_uxn_c_l153_c34_4e7a
BIN_OP_PLUS_uxn_c_l153_c34_4e7a : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l153_c34_4e7a_left,
BIN_OP_PLUS_uxn_c_l153_c34_4e7a_right,
BIN_OP_PLUS_uxn_c_l153_c34_4e7a_return_output);

-- MUX_uxn_c_l153_c6_80ee
MUX_uxn_c_l153_c6_80ee : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l153_c6_80ee_cond,
MUX_uxn_c_l153_c6_80ee_iftrue,
MUX_uxn_c_l153_c6_80ee_iffalse,
MUX_uxn_c_l153_c6_80ee_return_output);

-- UNARY_OP_NOT_uxn_c_l155_c46_7cef
UNARY_OP_NOT_uxn_c_l155_c46_7cef : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l155_c46_7cef_expr,
UNARY_OP_NOT_uxn_c_l155_c46_7cef_return_output);

-- BIN_OP_AND_uxn_c_l155_c27_406c
BIN_OP_AND_uxn_c_l155_c27_406c : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l155_c27_406c_left,
BIN_OP_AND_uxn_c_l155_c27_406c_right,
BIN_OP_AND_uxn_c_l155_c27_406c_return_output);

-- BIN_OP_AND_uxn_c_l156_c27_6951
BIN_OP_AND_uxn_c_l156_c27_6951 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l156_c27_6951_left,
BIN_OP_AND_uxn_c_l156_c27_6951_right,
BIN_OP_AND_uxn_c_l156_c27_6951_return_output);

-- MUX_uxn_c_l161_c3_1dbd
MUX_uxn_c_l161_c3_1dbd : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
MUX_uxn_c_l161_c3_1dbd_cond,
MUX_uxn_c_l161_c3_1dbd_iftrue,
MUX_uxn_c_l161_c3_1dbd_iffalse,
MUX_uxn_c_l161_c3_1dbd_return_output);

-- UNARY_OP_NOT_uxn_c_l162_c57_e86b
UNARY_OP_NOT_uxn_c_l162_c57_e86b : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l162_c57_e86b_expr,
UNARY_OP_NOT_uxn_c_l162_c57_e86b_return_output);

-- BIN_OP_AND_uxn_c_l162_c22_5959
BIN_OP_AND_uxn_c_l162_c22_5959 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l162_c22_5959_left,
BIN_OP_AND_uxn_c_l162_c22_5959_right,
BIN_OP_AND_uxn_c_l162_c22_5959_return_output);

-- BIN_OP_OR_uxn_c_l162_c3_1a0e
BIN_OP_OR_uxn_c_l162_c3_1a0e : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l162_c3_1a0e_left,
BIN_OP_OR_uxn_c_l162_c3_1a0e_right,
BIN_OP_OR_uxn_c_l162_c3_1a0e_return_output);

-- bg_vram_update_uxn_c_l158_c27_60ac
bg_vram_update_uxn_c_l158_c27_60ac : entity work.bg_vram_update_0CLK_6f2c5aad port map (
clk,
bg_vram_update_uxn_c_l158_c27_60ac_CLOCK_ENABLE,
bg_vram_update_uxn_c_l158_c27_60ac_read_address,
bg_vram_update_uxn_c_l158_c27_60ac_write_address,
bg_vram_update_uxn_c_l158_c27_60ac_write_value,
bg_vram_update_uxn_c_l158_c27_60ac_write_enable,
bg_vram_update_uxn_c_l158_c27_60ac_return_output);

-- MUX_uxn_c_l168_c3_4759
MUX_uxn_c_l168_c3_4759 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
MUX_uxn_c_l168_c3_4759_cond,
MUX_uxn_c_l168_c3_4759_iftrue,
MUX_uxn_c_l168_c3_4759_iffalse,
MUX_uxn_c_l168_c3_4759_return_output);

-- BIN_OP_AND_uxn_c_l169_c22_6bb1
BIN_OP_AND_uxn_c_l169_c22_6bb1 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l169_c22_6bb1_left,
BIN_OP_AND_uxn_c_l169_c22_6bb1_right,
BIN_OP_AND_uxn_c_l169_c22_6bb1_return_output);

-- BIN_OP_OR_uxn_c_l169_c3_49fa
BIN_OP_OR_uxn_c_l169_c3_49fa : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l169_c3_49fa_left,
BIN_OP_OR_uxn_c_l169_c3_49fa_right,
BIN_OP_OR_uxn_c_l169_c3_49fa_return_output);

-- fg_vram_update_uxn_c_l165_c27_13c9
fg_vram_update_uxn_c_l165_c27_13c9 : entity work.fg_vram_update_0CLK_6f2c5aad port map (
clk,
fg_vram_update_uxn_c_l165_c27_13c9_CLOCK_ENABLE,
fg_vram_update_uxn_c_l165_c27_13c9_read_address,
fg_vram_update_uxn_c_l165_c27_13c9_write_address,
fg_vram_update_uxn_c_l165_c27_13c9_write_value,
fg_vram_update_uxn_c_l165_c27_13c9_write_enable,
fg_vram_update_uxn_c_l165_c27_13c9_return_output);

-- BIN_OP_MINUS_uxn_c_l172_c43_5c05
BIN_OP_MINUS_uxn_c_l172_c43_5c05 : entity work.BIN_OP_MINUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l172_c43_5c05_left,
BIN_OP_MINUS_uxn_c_l172_c43_5c05_right,
BIN_OP_MINUS_uxn_c_l172_c43_5c05_return_output);

-- MUX_uxn_c_l172_c26_7a68
MUX_uxn_c_l172_c26_7a68 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l172_c26_7a68_cond,
MUX_uxn_c_l172_c26_7a68_iftrue,
MUX_uxn_c_l172_c26_7a68_iffalse,
MUX_uxn_c_l172_c26_7a68_return_output);

-- BIN_OP_EQ_uxn_c_l173_c19_c682
BIN_OP_EQ_uxn_c_l173_c19_c682 : entity work.BIN_OP_EQ_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l173_c19_c682_left,
BIN_OP_EQ_uxn_c_l173_c19_c682_right,
BIN_OP_EQ_uxn_c_l173_c19_c682_return_output);

-- MUX_uxn_c_l173_c19_25ba
MUX_uxn_c_l173_c19_25ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l173_c19_25ba_cond,
MUX_uxn_c_l173_c19_25ba_iftrue,
MUX_uxn_c_l173_c19_25ba_iffalse,
MUX_uxn_c_l173_c19_25ba_return_output);

-- BIN_OP_EQ_uxn_c_l174_c19_947f
BIN_OP_EQ_uxn_c_l174_c19_947f : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l174_c19_947f_left,
BIN_OP_EQ_uxn_c_l174_c19_947f_right,
BIN_OP_EQ_uxn_c_l174_c19_947f_return_output);

-- BIN_OP_PLUS_uxn_c_l174_c76_7864
BIN_OP_PLUS_uxn_c_l174_c76_7864 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l174_c76_7864_left,
BIN_OP_PLUS_uxn_c_l174_c76_7864_right,
BIN_OP_PLUS_uxn_c_l174_c76_7864_return_output);

-- MUX_uxn_c_l174_c50_b02c
MUX_uxn_c_l174_c50_b02c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l174_c50_b02c_cond,
MUX_uxn_c_l174_c50_b02c_iftrue,
MUX_uxn_c_l174_c50_b02c_iffalse,
MUX_uxn_c_l174_c50_b02c_return_output);

-- MUX_uxn_c_l174_c19_8fd4
MUX_uxn_c_l174_c19_8fd4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l174_c19_8fd4_cond,
MUX_uxn_c_l174_c19_8fd4_iftrue,
MUX_uxn_c_l174_c19_8fd4_iffalse,
MUX_uxn_c_l174_c19_8fd4_return_output);

-- BIN_OP_EQ_uxn_c_l175_c25_6dca
BIN_OP_EQ_uxn_c_l175_c25_6dca : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l175_c25_6dca_left,
BIN_OP_EQ_uxn_c_l175_c25_6dca_right,
BIN_OP_EQ_uxn_c_l175_c25_6dca_return_output);

-- MUX_uxn_c_l175_c25_30ef
MUX_uxn_c_l175_c25_30ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l175_c25_30ef_cond,
MUX_uxn_c_l175_c25_30ef_iftrue,
MUX_uxn_c_l175_c25_30ef_iffalse,
MUX_uxn_c_l175_c25_30ef_return_output);

-- BIN_OP_EQ_uxn_c_l176_c17_364a
BIN_OP_EQ_uxn_c_l176_c17_364a : entity work.BIN_OP_EQ_uint2_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l176_c17_364a_left,
BIN_OP_EQ_uxn_c_l176_c17_364a_right,
BIN_OP_EQ_uxn_c_l176_c17_364a_return_output);

-- MUX_uxn_c_l176_c17_58e0
MUX_uxn_c_l176_c17_58e0 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
MUX_uxn_c_l176_c17_58e0_cond,
MUX_uxn_c_l176_c17_58e0_iftrue,
MUX_uxn_c_l176_c17_58e0_iffalse,
MUX_uxn_c_l176_c17_58e0_return_output);

-- UNARY_OP_NOT_uint1_t_uxn_c_l169_l162_DUPLICATE_fe08
UNARY_OP_NOT_uint1_t_uxn_c_l169_l162_DUPLICATE_fe08 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uint1_t_uxn_c_l169_l162_DUPLICATE_fe08_expr,
UNARY_OP_NOT_uint1_t_uxn_c_l169_l162_DUPLICATE_fe08_return_output);

-- BIN_OP_AND_uint1_t_uint1_t_uxn_c_l162_l169_DUPLICATE_0eed
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l162_l169_DUPLICATE_0eed : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l162_l169_DUPLICATE_0eed_left,
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l162_l169_DUPLICATE_0eed_right,
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l162_l169_DUPLICATE_0eed_return_output);



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
 CONST_SR_4_uxn_c_l126_c52_a113_return_output,
 BIN_OP_AND_uxn_c_l126_c25_67be_return_output,
 UNARY_OP_NOT_uxn_c_l129_c22_5f7a_return_output,
 BIN_OP_AND_uxn_c_l129_c6_576b_return_output,
 fill_y1_MUX_uxn_c_l129_c2_7d06_return_output,
 is_fill_active_MUX_uxn_c_l129_c2_7d06_return_output,
 fill_pixels_remaining_MUX_uxn_c_l129_c2_7d06_return_output,
 fill_color_MUX_uxn_c_l129_c2_7d06_return_output,
 y_MUX_uxn_c_l129_c2_7d06_return_output,
 fill_y0_MUX_uxn_c_l129_c2_7d06_return_output,
 fill_x0_MUX_uxn_c_l129_c2_7d06_return_output,
 fill_x1_MUX_uxn_c_l129_c2_7d06_return_output,
 x_MUX_uxn_c_l129_c2_7d06_return_output,
 fill_layer_MUX_uxn_c_l129_c2_7d06_return_output,
 CONST_SR_2_uxn_c_l131_c25_3cde_return_output,
 CONST_SR_3_uxn_c_l132_c26_c68b_return_output,
 BIN_OP_DIV_uxn_c_l133_c13_a27e_return_output,
 BIN_OP_INFERRED_MULT_uxn_c_l134_c29_2db1_return_output,
 BIN_OP_MINUS_uxn_c_l134_c13_22c1_return_output,
 MUX_uxn_c_l135_c13_6184_return_output,
 MUX_uxn_c_l136_c13_d407_return_output,
 MUX_uxn_c_l137_c13_8f64_return_output,
 MUX_uxn_c_l138_c13_7415_return_output,
 BIN_OP_MINUS_uxn_c_l141_c28_17ee_return_output,
 BIN_OP_PLUS_uxn_c_l141_c28_fc95_return_output,
 BIN_OP_MINUS_uxn_c_l141_c54_63ba_return_output,
 BIN_OP_PLUS_uxn_c_l141_c54_fc23_return_output,
 BIN_OP_INFERRED_MULT_uxn_c_l141_c28_7dcb_return_output,
 BIN_OP_INFERRED_MULT_uxn_c_l149_c54_3c4e_return_output,
 BIN_OP_PLUS_uxn_c_l149_c54_4f55_return_output,
 MUX_uxn_c_l149_c35_1d2f_return_output,
 BIN_OP_EQ_uxn_c_l151_c29_8b60_return_output,
 MUX_uxn_c_l151_c29_339f_return_output,
 BIN_OP_PLUS_uxn_c_l152_c25_efaa_return_output,
 MUX_uxn_c_l152_c6_d938_return_output,
 BIN_OP_PLUS_uxn_c_l153_c34_4e7a_return_output,
 MUX_uxn_c_l153_c6_80ee_return_output,
 UNARY_OP_NOT_uxn_c_l155_c46_7cef_return_output,
 BIN_OP_AND_uxn_c_l155_c27_406c_return_output,
 BIN_OP_AND_uxn_c_l156_c27_6951_return_output,
 MUX_uxn_c_l161_c3_1dbd_return_output,
 UNARY_OP_NOT_uxn_c_l162_c57_e86b_return_output,
 BIN_OP_AND_uxn_c_l162_c22_5959_return_output,
 BIN_OP_OR_uxn_c_l162_c3_1a0e_return_output,
 bg_vram_update_uxn_c_l158_c27_60ac_return_output,
 MUX_uxn_c_l168_c3_4759_return_output,
 BIN_OP_AND_uxn_c_l169_c22_6bb1_return_output,
 BIN_OP_OR_uxn_c_l169_c3_49fa_return_output,
 fg_vram_update_uxn_c_l165_c27_13c9_return_output,
 BIN_OP_MINUS_uxn_c_l172_c43_5c05_return_output,
 MUX_uxn_c_l172_c26_7a68_return_output,
 BIN_OP_EQ_uxn_c_l173_c19_c682_return_output,
 MUX_uxn_c_l173_c19_25ba_return_output,
 BIN_OP_EQ_uxn_c_l174_c19_947f_return_output,
 BIN_OP_PLUS_uxn_c_l174_c76_7864_return_output,
 MUX_uxn_c_l174_c50_b02c_return_output,
 MUX_uxn_c_l174_c19_8fd4_return_output,
 BIN_OP_EQ_uxn_c_l175_c25_6dca_return_output,
 MUX_uxn_c_l175_c25_30ef_return_output,
 BIN_OP_EQ_uxn_c_l176_c17_364a_return_output,
 MUX_uxn_c_l176_c17_58e0_return_output,
 UNARY_OP_NOT_uint1_t_uxn_c_l169_l162_DUPLICATE_fe08_return_output,
 BIN_OP_AND_uint1_t_uint1_t_uxn_c_l162_l169_DUPLICATE_0eed_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : gpu_step_result_t;
 variable VAR_is_active_drawing_area : unsigned(0 downto 0);
 variable VAR_is_vram_write : unsigned(0 downto 0);
 variable VAR_vram_write_layer : unsigned(0 downto 0);
 variable VAR_vram_address : unsigned(15 downto 0);
 variable VAR_vram_value : unsigned(7 downto 0);
 variable VAR_result : gpu_step_result_t;
 variable VAR_is_fill_code : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l126_c25_67be_left : unsigned(0 downto 0);
 variable VAR_CONST_SR_4_uxn_c_l126_c52_a113_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_c_l126_c52_a113_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_c_l126_c42_dfe5_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l126_c25_67be_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l126_c25_67be_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l129_c6_576b_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l129_c22_5f7a_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l129_c22_5f7a_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l129_c6_576b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l129_c6_576b_return_output : unsigned(0 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l129_c2_7d06_iftrue : unsigned(15 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l129_c2_7d06_iffalse : unsigned(15 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l129_c2_7d06_return_output : unsigned(15 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l129_c2_7d06_cond : unsigned(0 downto 0);
 variable VAR_is_fill_active_MUX_uxn_c_l129_c2_7d06_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_active_MUX_uxn_c_l129_c2_7d06_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_active_MUX_uxn_c_l129_c2_7d06_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_active_MUX_uxn_c_l129_c2_7d06_cond : unsigned(0 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l129_c2_7d06_iftrue : unsigned(15 downto 0);
 variable VAR_fill_pixels_remaining_uxn_c_l141_c3_6a59 : unsigned(15 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l129_c2_7d06_iffalse : unsigned(15 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l129_c2_7d06_return_output : unsigned(15 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l129_c2_7d06_cond : unsigned(0 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l129_c2_7d06_iftrue : unsigned(1 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l129_c2_7d06_iffalse : unsigned(1 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l129_c2_7d06_return_output : unsigned(1 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l129_c2_7d06_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_c_l129_c2_7d06_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_c_l129_c2_7d06_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_c_l129_c2_7d06_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_c_l129_c2_7d06_cond : unsigned(0 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l129_c2_7d06_iftrue : unsigned(15 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l129_c2_7d06_iffalse : unsigned(15 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l129_c2_7d06_return_output : unsigned(15 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l129_c2_7d06_cond : unsigned(0 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l129_c2_7d06_iftrue : unsigned(15 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l129_c2_7d06_iffalse : unsigned(15 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l129_c2_7d06_return_output : unsigned(15 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l129_c2_7d06_cond : unsigned(0 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l129_c2_7d06_iftrue : unsigned(15 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l129_c2_7d06_iffalse : unsigned(15 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l129_c2_7d06_return_output : unsigned(15 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l129_c2_7d06_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_c_l129_c2_7d06_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_c_l129_c2_7d06_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_c_l129_c2_7d06_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_c_l129_c2_7d06_cond : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l129_c2_7d06_iftrue : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l129_c2_7d06_iffalse : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l129_c2_7d06_return_output : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l129_c2_7d06_cond : unsigned(0 downto 0);
 variable VAR_is_fill_top : unsigned(0 downto 0);
 variable VAR_is_fill_top_uxn_c_l131_c11_6e49_0 : unsigned(0 downto 0);
 variable VAR_CONST_SR_2_uxn_c_l131_c25_3cde_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_2_uxn_c_l131_c25_3cde_x : unsigned(7 downto 0);
 variable VAR_is_fill_left : unsigned(0 downto 0);
 variable VAR_is_fill_left_uxn_c_l132_c11_74c7_0 : unsigned(0 downto 0);
 variable VAR_CONST_SR_3_uxn_c_l132_c26_c68b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_3_uxn_c_l132_c26_c68b_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_DIV_uxn_c_l133_c13_a27e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_c_l133_c13_a27e_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_DIV_uxn_c_l133_c13_a27e_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l134_c13_22c1_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l134_c29_2db1_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l134_c29_2db1_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l134_c29_2db1_return_output : unsigned(24 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l134_c13_22c1_right : unsigned(24 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l134_c13_22c1_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l135_c13_6184_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l135_c13_6184_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l135_c13_6184_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l135_c13_6184_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l136_c13_d407_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l136_c13_d407_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l136_c13_d407_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l136_c13_d407_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l137_c13_8f64_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l137_c13_8f64_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l137_c13_8f64_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l137_c13_8f64_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l138_c13_7415_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l138_c13_7415_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l138_c13_7415_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l138_c13_7415_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint2_t_uxn_c_l140_c16_b4e4_return_output : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l141_c28_17ee_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l141_c28_17ee_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l141_c28_17ee_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l141_c28_fc95_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l141_c28_fc95_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l141_c28_fc95_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l141_c28_7dcb_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l141_c54_63ba_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l141_c54_63ba_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l141_c54_63ba_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l141_c54_fc23_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l141_c54_fc23_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l141_c54_fc23_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l141_c28_7dcb_right : unsigned(16 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l141_c28_7dcb_return_output : unsigned(33 downto 0);
 variable VAR_adjusted_vram_address : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l149_c35_1d2f_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l149_c35_1d2f_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l149_c35_1d2f_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l149_c54_3c4e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l149_c54_3c4e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l149_c54_3c4e_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l149_c54_4f55_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l149_c54_4f55_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l149_c54_4f55_return_output : unsigned(32 downto 0);
 variable VAR_MUX_uxn_c_l149_c35_1d2f_return_output : unsigned(15 downto 0);
 variable VAR_is_new_fill_row : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l151_c29_339f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l151_c29_8b60_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l151_c29_8b60_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l151_c29_8b60_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l151_c29_339f_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l151_c29_339f_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l151_c29_339f_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l152_c6_d938_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l152_c6_d938_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l152_c6_d938_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l152_c25_efaa_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l152_c25_efaa_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l152_c25_efaa_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l152_c6_d938_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l153_c6_80ee_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l153_c6_80ee_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l153_c6_80ee_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l153_c34_4e7a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l153_c34_4e7a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l153_c34_4e7a_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l153_c6_80ee_return_output : unsigned(15 downto 0);
 variable VAR_is_fill_pixel0 : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l155_c27_406c_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l155_c46_7cef_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l155_c46_7cef_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l155_c27_406c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l155_c27_406c_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_pixel1 : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l156_c27_6951_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l156_c27_6951_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l156_c27_6951_return_output : unsigned(0 downto 0);
 variable VAR_bg_pixel_color : unsigned(1 downto 0);
 variable VAR_bg_vram_update_uxn_c_l158_c27_60ac_read_address : unsigned(15 downto 0);
 variable VAR_bg_vram_update_uxn_c_l158_c27_60ac_write_address : unsigned(15 downto 0);
 variable VAR_bg_vram_update_uxn_c_l158_c27_60ac_write_value : unsigned(1 downto 0);
 variable VAR_bg_vram_update_uxn_c_l158_c27_60ac_write_enable : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l161_c3_1dbd_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l161_c3_1dbd_iftrue : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l161_c3_1dbd_iffalse : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l161_c3_1dbd_return_output : unsigned(1 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l162_c3_1a0e_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l162_c22_5959_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l162_c57_e86b_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l162_c57_e86b_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l162_c22_5959_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l162_c22_5959_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l162_c3_1a0e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l162_c3_1a0e_return_output : unsigned(0 downto 0);
 variable VAR_bg_vram_update_uxn_c_l158_c27_60ac_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_bg_vram_update_uxn_c_l158_c27_60ac_return_output : unsigned(1 downto 0);
 variable VAR_fg_pixel_color : unsigned(1 downto 0);
 variable VAR_fg_vram_update_uxn_c_l165_c27_13c9_read_address : unsigned(15 downto 0);
 variable VAR_fg_vram_update_uxn_c_l165_c27_13c9_write_address : unsigned(15 downto 0);
 variable VAR_fg_vram_update_uxn_c_l165_c27_13c9_write_value : unsigned(1 downto 0);
 variable VAR_fg_vram_update_uxn_c_l165_c27_13c9_write_enable : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l168_c3_4759_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l168_c3_4759_iftrue : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l168_c3_4759_iffalse : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l168_c3_4759_return_output : unsigned(1 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l169_c3_49fa_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l169_c22_6bb1_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l169_c22_6bb1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l169_c22_6bb1_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l169_c3_49fa_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l169_c3_49fa_return_output : unsigned(0 downto 0);
 variable VAR_fg_vram_update_uxn_c_l165_c27_13c9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_fg_vram_update_uxn_c_l165_c27_13c9_return_output : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l172_c26_7a68_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l172_c26_7a68_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l172_c26_7a68_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l172_c43_5c05_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l172_c43_5c05_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l172_c43_5c05_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l172_c26_7a68_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l173_c19_25ba_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l173_c19_c682_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l173_c19_c682_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l173_c19_c682_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l173_c19_25ba_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l173_c19_25ba_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l173_c19_25ba_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l174_c19_8fd4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l174_c19_947f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l174_c19_947f_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l174_c19_947f_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l174_c19_8fd4_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l174_c19_8fd4_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l174_c50_b02c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l174_c50_b02c_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l174_c50_b02c_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l174_c76_7864_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l174_c76_7864_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l174_c76_7864_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l174_c50_b02c_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l174_c19_8fd4_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l175_c25_30ef_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l175_c25_6dca_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l175_c25_6dca_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l175_c25_6dca_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l175_c25_30ef_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l175_c25_30ef_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l175_c25_30ef_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l176_c17_58e0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l176_c17_364a_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l176_c17_364a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l176_c17_364a_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l176_c17_58e0_iftrue : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l176_c17_58e0_iffalse : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l176_c17_58e0_return_output : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_269d_uxn_c_l179_c9_efb2_return_output : gpu_step_result_t;
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_c_l169_l162_DUPLICATE_fe08_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_c_l169_l162_DUPLICATE_fe08_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l162_l169_DUPLICATE_0eed_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l162_l169_DUPLICATE_0eed_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l162_l169_DUPLICATE_0eed_return_output : unsigned(0 downto 0);
 -- State registers comb logic variables
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
     VAR_MUX_uxn_c_l172_c26_7a68_iffalse := resize(to_unsigned(0, 1), 16);
     VAR_MUX_uxn_c_l173_c19_25ba_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_c_l141_c28_fc95_right := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l175_c25_30ef_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l134_c29_2db1_right := to_unsigned(260, 9);
     VAR_MUX_uxn_c_l174_c19_8fd4_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_BIN_OP_EQ_uxn_c_l175_c25_6dca_right := to_unsigned(60839, 16);
     VAR_is_fill_active_MUX_uxn_c_l129_c2_7d06_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l136_c13_d407_iffalse := resize(to_unsigned(259, 9), 16);
     VAR_MUX_uxn_c_l138_c13_7415_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_BIN_OP_EQ_uxn_c_l174_c19_947f_right := to_unsigned(60839, 16);
     VAR_MUX_uxn_c_l137_c13_8f64_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_MUX_uxn_c_l173_c19_25ba_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l151_c29_339f_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_DIV_uxn_c_l133_c13_a27e_right := to_unsigned(260, 9);
     VAR_MUX_uxn_c_l135_c13_6184_iffalse := resize(to_unsigned(233, 8), 16);
     VAR_MUX_uxn_c_l151_c29_339f_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_c_l152_c25_efaa_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l173_c19_c682_right := to_unsigned(0, 1);
     VAR_BIN_OP_MINUS_uxn_c_l172_c43_5c05_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_c_l141_c54_fc23_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_c_l174_c76_7864_right := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l175_c25_30ef_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l176_c17_364a_right := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_c_l153_c34_4e7a_right := to_unsigned(1, 1);
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l149_c54_3c4e_right := to_unsigned(260, 16);

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
     VAR_bg_vram_update_uxn_c_l158_c27_60ac_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_fg_vram_update_uxn_c_l165_c27_13c9_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_fill_color_MUX_uxn_c_l129_c2_7d06_iffalse := fill_color;
     VAR_fill_layer_MUX_uxn_c_l129_c2_7d06_iffalse := fill_layer;
     VAR_fill_pixels_remaining_MUX_uxn_c_l129_c2_7d06_iffalse := fill_pixels_remaining;
     VAR_fill_x0_MUX_uxn_c_l129_c2_7d06_iffalse := fill_x0;
     VAR_fill_x1_MUX_uxn_c_l129_c2_7d06_iffalse := fill_x1;
     VAR_fill_y0_MUX_uxn_c_l129_c2_7d06_iffalse := fill_y0;
     VAR_fill_y1_MUX_uxn_c_l129_c2_7d06_iffalse := fill_y1;
     VAR_MUX_uxn_c_l174_c50_b02c_cond := VAR_is_active_drawing_area;
     VAR_UNARY_OP_NOT_uxn_c_l129_c22_5f7a_expr := is_fill_active;
     VAR_is_fill_active_MUX_uxn_c_l129_c2_7d06_iffalse := is_fill_active;
     VAR_BIN_OP_AND_uxn_c_l126_c25_67be_left := VAR_is_vram_write;
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l162_l169_DUPLICATE_0eed_right := VAR_is_vram_write;
     VAR_BIN_OP_EQ_uxn_c_l174_c19_947f_left := pixel_counter;
     VAR_BIN_OP_PLUS_uxn_c_l174_c76_7864_left := pixel_counter;
     VAR_MUX_uxn_c_l174_c50_b02c_iffalse := pixel_counter;
     VAR_bg_vram_update_uxn_c_l158_c27_60ac_read_address := pixel_counter;
     VAR_fg_vram_update_uxn_c_l165_c27_13c9_read_address := pixel_counter;
     VAR_BIN_OP_DIV_uxn_c_l133_c13_a27e_left := VAR_vram_address;
     VAR_BIN_OP_MINUS_uxn_c_l134_c13_22c1_left := VAR_vram_address;
     VAR_MUX_uxn_c_l149_c35_1d2f_iffalse := VAR_vram_address;
     VAR_CONST_SR_2_uxn_c_l131_c25_3cde_x := VAR_vram_value;
     VAR_CONST_SR_3_uxn_c_l132_c26_c68b_x := VAR_vram_value;
     VAR_CONST_SR_4_uxn_c_l126_c52_a113_x := VAR_vram_value;
     VAR_MUX_uxn_c_l161_c3_1dbd_iffalse := resize(VAR_vram_value, 2);
     VAR_MUX_uxn_c_l168_c3_4759_iffalse := resize(VAR_vram_value, 2);
     VAR_BIN_OP_AND_uxn_c_l169_c22_6bb1_right := VAR_vram_write_layer;
     VAR_UNARY_OP_NOT_uxn_c_l162_c57_e86b_expr := VAR_vram_write_layer;
     VAR_fill_layer_MUX_uxn_c_l129_c2_7d06_iftrue := VAR_vram_write_layer;
     VAR_x_MUX_uxn_c_l129_c2_7d06_iffalse := x;
     VAR_y_MUX_uxn_c_l129_c2_7d06_iffalse := y;
     -- BIN_OP_PLUS[uxn_c_l174_c76_7864] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l174_c76_7864_left <= VAR_BIN_OP_PLUS_uxn_c_l174_c76_7864_left;
     BIN_OP_PLUS_uxn_c_l174_c76_7864_right <= VAR_BIN_OP_PLUS_uxn_c_l174_c76_7864_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l174_c76_7864_return_output := BIN_OP_PLUS_uxn_c_l174_c76_7864_return_output;

     -- CONST_SR_4[uxn_c_l126_c52_a113] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_c_l126_c52_a113_x <= VAR_CONST_SR_4_uxn_c_l126_c52_a113_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_c_l126_c52_a113_return_output := CONST_SR_4_uxn_c_l126_c52_a113_return_output;

     -- UNARY_OP_NOT[uxn_c_l162_c57_e86b] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l162_c57_e86b_expr <= VAR_UNARY_OP_NOT_uxn_c_l162_c57_e86b_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l162_c57_e86b_return_output := UNARY_OP_NOT_uxn_c_l162_c57_e86b_return_output;

     -- CONST_SR_2[uxn_c_l131_c25_3cde] LATENCY=0
     -- Inputs
     CONST_SR_2_uxn_c_l131_c25_3cde_x <= VAR_CONST_SR_2_uxn_c_l131_c25_3cde_x;
     -- Outputs
     VAR_CONST_SR_2_uxn_c_l131_c25_3cde_return_output := CONST_SR_2_uxn_c_l131_c25_3cde_return_output;

     -- UNARY_OP_NOT[uxn_c_l129_c22_5f7a] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l129_c22_5f7a_expr <= VAR_UNARY_OP_NOT_uxn_c_l129_c22_5f7a_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l129_c22_5f7a_return_output := UNARY_OP_NOT_uxn_c_l129_c22_5f7a_return_output;

     -- CONST_SR_3[uxn_c_l132_c26_c68b] LATENCY=0
     -- Inputs
     CONST_SR_3_uxn_c_l132_c26_c68b_x <= VAR_CONST_SR_3_uxn_c_l132_c26_c68b_x;
     -- Outputs
     VAR_CONST_SR_3_uxn_c_l132_c26_c68b_return_output := CONST_SR_3_uxn_c_l132_c26_c68b_return_output;

     -- BIN_OP_DIV[uxn_c_l133_c13_a27e] LATENCY=0
     -- Inputs
     BIN_OP_DIV_uxn_c_l133_c13_a27e_left <= VAR_BIN_OP_DIV_uxn_c_l133_c13_a27e_left;
     BIN_OP_DIV_uxn_c_l133_c13_a27e_right <= VAR_BIN_OP_DIV_uxn_c_l133_c13_a27e_right;
     -- Outputs
     VAR_BIN_OP_DIV_uxn_c_l133_c13_a27e_return_output := BIN_OP_DIV_uxn_c_l133_c13_a27e_return_output;

     -- CAST_TO_uint2_t[uxn_c_l140_c16_b4e4] LATENCY=0
     VAR_CAST_TO_uint2_t_uxn_c_l140_c16_b4e4_return_output := CAST_TO_uint2_t_uint8_t(
     VAR_vram_value);

     -- BIN_OP_EQ[uxn_c_l174_c19_947f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l174_c19_947f_left <= VAR_BIN_OP_EQ_uxn_c_l174_c19_947f_left;
     BIN_OP_EQ_uxn_c_l174_c19_947f_right <= VAR_BIN_OP_EQ_uxn_c_l174_c19_947f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l174_c19_947f_return_output := BIN_OP_EQ_uxn_c_l174_c19_947f_return_output;

     -- Submodule level 1
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l134_c29_2db1_left := VAR_BIN_OP_DIV_uxn_c_l133_c13_a27e_return_output;
     VAR_MUX_uxn_c_l135_c13_6184_iftrue := VAR_BIN_OP_DIV_uxn_c_l133_c13_a27e_return_output;
     VAR_MUX_uxn_c_l137_c13_8f64_iffalse := VAR_BIN_OP_DIV_uxn_c_l133_c13_a27e_return_output;
     VAR_MUX_uxn_c_l174_c19_8fd4_cond := VAR_BIN_OP_EQ_uxn_c_l174_c19_947f_return_output;
     VAR_MUX_uxn_c_l174_c50_b02c_iftrue := resize(VAR_BIN_OP_PLUS_uxn_c_l174_c76_7864_return_output, 16);
     VAR_fill_color_MUX_uxn_c_l129_c2_7d06_iftrue := VAR_CAST_TO_uint2_t_uxn_c_l140_c16_b4e4_return_output;
     VAR_is_fill_top_uxn_c_l131_c11_6e49_0 := resize(VAR_CONST_SR_2_uxn_c_l131_c25_3cde_return_output, 1);
     VAR_is_fill_left_uxn_c_l132_c11_74c7_0 := resize(VAR_CONST_SR_3_uxn_c_l132_c26_c68b_return_output, 1);
     VAR_BIN_OP_AND_uxn_c_l129_c6_576b_right := VAR_UNARY_OP_NOT_uxn_c_l129_c22_5f7a_return_output;
     VAR_BIN_OP_AND_uxn_c_l162_c22_5959_right := VAR_UNARY_OP_NOT_uxn_c_l162_c57_e86b_return_output;
     VAR_MUX_uxn_c_l136_c13_d407_cond := VAR_is_fill_left_uxn_c_l132_c11_74c7_0;
     VAR_MUX_uxn_c_l138_c13_7415_cond := VAR_is_fill_left_uxn_c_l132_c11_74c7_0;
     VAR_MUX_uxn_c_l135_c13_6184_cond := VAR_is_fill_top_uxn_c_l131_c11_6e49_0;
     VAR_MUX_uxn_c_l137_c13_8f64_cond := VAR_is_fill_top_uxn_c_l131_c11_6e49_0;
     -- MUX[uxn_c_l174_c50_b02c] LATENCY=0
     -- Inputs
     MUX_uxn_c_l174_c50_b02c_cond <= VAR_MUX_uxn_c_l174_c50_b02c_cond;
     MUX_uxn_c_l174_c50_b02c_iftrue <= VAR_MUX_uxn_c_l174_c50_b02c_iftrue;
     MUX_uxn_c_l174_c50_b02c_iffalse <= VAR_MUX_uxn_c_l174_c50_b02c_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l174_c50_b02c_return_output := MUX_uxn_c_l174_c50_b02c_return_output;

     -- MUX[uxn_c_l137_c13_8f64] LATENCY=0
     -- Inputs
     MUX_uxn_c_l137_c13_8f64_cond <= VAR_MUX_uxn_c_l137_c13_8f64_cond;
     MUX_uxn_c_l137_c13_8f64_iftrue <= VAR_MUX_uxn_c_l137_c13_8f64_iftrue;
     MUX_uxn_c_l137_c13_8f64_iffalse <= VAR_MUX_uxn_c_l137_c13_8f64_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l137_c13_8f64_return_output := MUX_uxn_c_l137_c13_8f64_return_output;

     -- MUX[uxn_c_l135_c13_6184] LATENCY=0
     -- Inputs
     MUX_uxn_c_l135_c13_6184_cond <= VAR_MUX_uxn_c_l135_c13_6184_cond;
     MUX_uxn_c_l135_c13_6184_iftrue <= VAR_MUX_uxn_c_l135_c13_6184_iftrue;
     MUX_uxn_c_l135_c13_6184_iffalse <= VAR_MUX_uxn_c_l135_c13_6184_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l135_c13_6184_return_output := MUX_uxn_c_l135_c13_6184_return_output;

     -- CAST_TO_uint1_t[uxn_c_l126_c42_dfe5] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_c_l126_c42_dfe5_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_4_uxn_c_l126_c52_a113_return_output);

     -- BIN_OP_INFERRED_MULT[uxn_c_l134_c29_2db1] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_c_l134_c29_2db1_left <= VAR_BIN_OP_INFERRED_MULT_uxn_c_l134_c29_2db1_left;
     BIN_OP_INFERRED_MULT_uxn_c_l134_c29_2db1_right <= VAR_BIN_OP_INFERRED_MULT_uxn_c_l134_c29_2db1_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l134_c29_2db1_return_output := BIN_OP_INFERRED_MULT_uxn_c_l134_c29_2db1_return_output;

     -- Submodule level 2
     VAR_BIN_OP_MINUS_uxn_c_l134_c13_22c1_right := VAR_BIN_OP_INFERRED_MULT_uxn_c_l134_c29_2db1_return_output;
     VAR_BIN_OP_AND_uxn_c_l126_c25_67be_right := VAR_CAST_TO_uint1_t_uxn_c_l126_c42_dfe5_return_output;
     VAR_BIN_OP_MINUS_uxn_c_l141_c54_63ba_left := VAR_MUX_uxn_c_l135_c13_6184_return_output;
     VAR_fill_y1_MUX_uxn_c_l129_c2_7d06_iftrue := VAR_MUX_uxn_c_l135_c13_6184_return_output;
     VAR_BIN_OP_MINUS_uxn_c_l141_c54_63ba_right := VAR_MUX_uxn_c_l137_c13_8f64_return_output;
     VAR_fill_y0_MUX_uxn_c_l129_c2_7d06_iftrue := VAR_MUX_uxn_c_l137_c13_8f64_return_output;
     VAR_y_MUX_uxn_c_l129_c2_7d06_iftrue := VAR_MUX_uxn_c_l137_c13_8f64_return_output;
     VAR_MUX_uxn_c_l174_c19_8fd4_iffalse := VAR_MUX_uxn_c_l174_c50_b02c_return_output;
     -- BIN_OP_AND[uxn_c_l126_c25_67be] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l126_c25_67be_left <= VAR_BIN_OP_AND_uxn_c_l126_c25_67be_left;
     BIN_OP_AND_uxn_c_l126_c25_67be_right <= VAR_BIN_OP_AND_uxn_c_l126_c25_67be_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l126_c25_67be_return_output := BIN_OP_AND_uxn_c_l126_c25_67be_return_output;

     -- MUX[uxn_c_l174_c19_8fd4] LATENCY=0
     -- Inputs
     MUX_uxn_c_l174_c19_8fd4_cond <= VAR_MUX_uxn_c_l174_c19_8fd4_cond;
     MUX_uxn_c_l174_c19_8fd4_iftrue <= VAR_MUX_uxn_c_l174_c19_8fd4_iftrue;
     MUX_uxn_c_l174_c19_8fd4_iffalse <= VAR_MUX_uxn_c_l174_c19_8fd4_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l174_c19_8fd4_return_output := MUX_uxn_c_l174_c19_8fd4_return_output;

     -- BIN_OP_MINUS[uxn_c_l134_c13_22c1] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l134_c13_22c1_left <= VAR_BIN_OP_MINUS_uxn_c_l134_c13_22c1_left;
     BIN_OP_MINUS_uxn_c_l134_c13_22c1_right <= VAR_BIN_OP_MINUS_uxn_c_l134_c13_22c1_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l134_c13_22c1_return_output := BIN_OP_MINUS_uxn_c_l134_c13_22c1_return_output;

     -- BIN_OP_MINUS[uxn_c_l141_c54_63ba] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l141_c54_63ba_left <= VAR_BIN_OP_MINUS_uxn_c_l141_c54_63ba_left;
     BIN_OP_MINUS_uxn_c_l141_c54_63ba_right <= VAR_BIN_OP_MINUS_uxn_c_l141_c54_63ba_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l141_c54_63ba_return_output := BIN_OP_MINUS_uxn_c_l141_c54_63ba_return_output;

     -- Submodule level 3
     VAR_BIN_OP_AND_uxn_c_l129_c6_576b_left := VAR_BIN_OP_AND_uxn_c_l126_c25_67be_return_output;
     VAR_MUX_uxn_c_l136_c13_d407_iftrue := VAR_BIN_OP_MINUS_uxn_c_l134_c13_22c1_return_output;
     VAR_MUX_uxn_c_l138_c13_7415_iffalse := VAR_BIN_OP_MINUS_uxn_c_l134_c13_22c1_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l141_c54_fc23_left := VAR_BIN_OP_MINUS_uxn_c_l141_c54_63ba_return_output;
     VAR_BIN_OP_EQ_uxn_c_l175_c25_6dca_left := VAR_MUX_uxn_c_l174_c19_8fd4_return_output;
     REG_VAR_pixel_counter := VAR_MUX_uxn_c_l174_c19_8fd4_return_output;
     -- BIN_OP_AND[uxn_c_l129_c6_576b] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l129_c6_576b_left <= VAR_BIN_OP_AND_uxn_c_l129_c6_576b_left;
     BIN_OP_AND_uxn_c_l129_c6_576b_right <= VAR_BIN_OP_AND_uxn_c_l129_c6_576b_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l129_c6_576b_return_output := BIN_OP_AND_uxn_c_l129_c6_576b_return_output;

     -- BIN_OP_EQ[uxn_c_l175_c25_6dca] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l175_c25_6dca_left <= VAR_BIN_OP_EQ_uxn_c_l175_c25_6dca_left;
     BIN_OP_EQ_uxn_c_l175_c25_6dca_right <= VAR_BIN_OP_EQ_uxn_c_l175_c25_6dca_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l175_c25_6dca_return_output := BIN_OP_EQ_uxn_c_l175_c25_6dca_return_output;

     -- BIN_OP_PLUS[uxn_c_l141_c54_fc23] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l141_c54_fc23_left <= VAR_BIN_OP_PLUS_uxn_c_l141_c54_fc23_left;
     BIN_OP_PLUS_uxn_c_l141_c54_fc23_right <= VAR_BIN_OP_PLUS_uxn_c_l141_c54_fc23_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l141_c54_fc23_return_output := BIN_OP_PLUS_uxn_c_l141_c54_fc23_return_output;

     -- MUX[uxn_c_l136_c13_d407] LATENCY=0
     -- Inputs
     MUX_uxn_c_l136_c13_d407_cond <= VAR_MUX_uxn_c_l136_c13_d407_cond;
     MUX_uxn_c_l136_c13_d407_iftrue <= VAR_MUX_uxn_c_l136_c13_d407_iftrue;
     MUX_uxn_c_l136_c13_d407_iffalse <= VAR_MUX_uxn_c_l136_c13_d407_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l136_c13_d407_return_output := MUX_uxn_c_l136_c13_d407_return_output;

     -- MUX[uxn_c_l138_c13_7415] LATENCY=0
     -- Inputs
     MUX_uxn_c_l138_c13_7415_cond <= VAR_MUX_uxn_c_l138_c13_7415_cond;
     MUX_uxn_c_l138_c13_7415_iftrue <= VAR_MUX_uxn_c_l138_c13_7415_iftrue;
     MUX_uxn_c_l138_c13_7415_iffalse <= VAR_MUX_uxn_c_l138_c13_7415_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l138_c13_7415_return_output := MUX_uxn_c_l138_c13_7415_return_output;

     -- Submodule level 4
     VAR_fill_color_MUX_uxn_c_l129_c2_7d06_cond := VAR_BIN_OP_AND_uxn_c_l129_c6_576b_return_output;
     VAR_fill_layer_MUX_uxn_c_l129_c2_7d06_cond := VAR_BIN_OP_AND_uxn_c_l129_c6_576b_return_output;
     VAR_fill_pixels_remaining_MUX_uxn_c_l129_c2_7d06_cond := VAR_BIN_OP_AND_uxn_c_l129_c6_576b_return_output;
     VAR_fill_x0_MUX_uxn_c_l129_c2_7d06_cond := VAR_BIN_OP_AND_uxn_c_l129_c6_576b_return_output;
     VAR_fill_x1_MUX_uxn_c_l129_c2_7d06_cond := VAR_BIN_OP_AND_uxn_c_l129_c6_576b_return_output;
     VAR_fill_y0_MUX_uxn_c_l129_c2_7d06_cond := VAR_BIN_OP_AND_uxn_c_l129_c6_576b_return_output;
     VAR_fill_y1_MUX_uxn_c_l129_c2_7d06_cond := VAR_BIN_OP_AND_uxn_c_l129_c6_576b_return_output;
     VAR_is_fill_active_MUX_uxn_c_l129_c2_7d06_cond := VAR_BIN_OP_AND_uxn_c_l129_c6_576b_return_output;
     VAR_x_MUX_uxn_c_l129_c2_7d06_cond := VAR_BIN_OP_AND_uxn_c_l129_c6_576b_return_output;
     VAR_y_MUX_uxn_c_l129_c2_7d06_cond := VAR_BIN_OP_AND_uxn_c_l129_c6_576b_return_output;
     VAR_MUX_uxn_c_l175_c25_30ef_cond := VAR_BIN_OP_EQ_uxn_c_l175_c25_6dca_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l141_c28_7dcb_right := VAR_BIN_OP_PLUS_uxn_c_l141_c54_fc23_return_output;
     VAR_BIN_OP_MINUS_uxn_c_l141_c28_17ee_left := VAR_MUX_uxn_c_l136_c13_d407_return_output;
     VAR_fill_x1_MUX_uxn_c_l129_c2_7d06_iftrue := VAR_MUX_uxn_c_l136_c13_d407_return_output;
     VAR_BIN_OP_MINUS_uxn_c_l141_c28_17ee_right := VAR_MUX_uxn_c_l138_c13_7415_return_output;
     VAR_fill_x0_MUX_uxn_c_l129_c2_7d06_iftrue := VAR_MUX_uxn_c_l138_c13_7415_return_output;
     VAR_x_MUX_uxn_c_l129_c2_7d06_iftrue := VAR_MUX_uxn_c_l138_c13_7415_return_output;
     -- fill_layer_MUX[uxn_c_l129_c2_7d06] LATENCY=0
     -- Inputs
     fill_layer_MUX_uxn_c_l129_c2_7d06_cond <= VAR_fill_layer_MUX_uxn_c_l129_c2_7d06_cond;
     fill_layer_MUX_uxn_c_l129_c2_7d06_iftrue <= VAR_fill_layer_MUX_uxn_c_l129_c2_7d06_iftrue;
     fill_layer_MUX_uxn_c_l129_c2_7d06_iffalse <= VAR_fill_layer_MUX_uxn_c_l129_c2_7d06_iffalse;
     -- Outputs
     VAR_fill_layer_MUX_uxn_c_l129_c2_7d06_return_output := fill_layer_MUX_uxn_c_l129_c2_7d06_return_output;

     -- x_MUX[uxn_c_l129_c2_7d06] LATENCY=0
     -- Inputs
     x_MUX_uxn_c_l129_c2_7d06_cond <= VAR_x_MUX_uxn_c_l129_c2_7d06_cond;
     x_MUX_uxn_c_l129_c2_7d06_iftrue <= VAR_x_MUX_uxn_c_l129_c2_7d06_iftrue;
     x_MUX_uxn_c_l129_c2_7d06_iffalse <= VAR_x_MUX_uxn_c_l129_c2_7d06_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_c_l129_c2_7d06_return_output := x_MUX_uxn_c_l129_c2_7d06_return_output;

     -- BIN_OP_MINUS[uxn_c_l141_c28_17ee] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l141_c28_17ee_left <= VAR_BIN_OP_MINUS_uxn_c_l141_c28_17ee_left;
     BIN_OP_MINUS_uxn_c_l141_c28_17ee_right <= VAR_BIN_OP_MINUS_uxn_c_l141_c28_17ee_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l141_c28_17ee_return_output := BIN_OP_MINUS_uxn_c_l141_c28_17ee_return_output;

     -- MUX[uxn_c_l175_c25_30ef] LATENCY=0
     -- Inputs
     MUX_uxn_c_l175_c25_30ef_cond <= VAR_MUX_uxn_c_l175_c25_30ef_cond;
     MUX_uxn_c_l175_c25_30ef_iftrue <= VAR_MUX_uxn_c_l175_c25_30ef_iftrue;
     MUX_uxn_c_l175_c25_30ef_iffalse <= VAR_MUX_uxn_c_l175_c25_30ef_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l175_c25_30ef_return_output := MUX_uxn_c_l175_c25_30ef_return_output;

     -- fill_x1_MUX[uxn_c_l129_c2_7d06] LATENCY=0
     -- Inputs
     fill_x1_MUX_uxn_c_l129_c2_7d06_cond <= VAR_fill_x1_MUX_uxn_c_l129_c2_7d06_cond;
     fill_x1_MUX_uxn_c_l129_c2_7d06_iftrue <= VAR_fill_x1_MUX_uxn_c_l129_c2_7d06_iftrue;
     fill_x1_MUX_uxn_c_l129_c2_7d06_iffalse <= VAR_fill_x1_MUX_uxn_c_l129_c2_7d06_iffalse;
     -- Outputs
     VAR_fill_x1_MUX_uxn_c_l129_c2_7d06_return_output := fill_x1_MUX_uxn_c_l129_c2_7d06_return_output;

     -- fill_y0_MUX[uxn_c_l129_c2_7d06] LATENCY=0
     -- Inputs
     fill_y0_MUX_uxn_c_l129_c2_7d06_cond <= VAR_fill_y0_MUX_uxn_c_l129_c2_7d06_cond;
     fill_y0_MUX_uxn_c_l129_c2_7d06_iftrue <= VAR_fill_y0_MUX_uxn_c_l129_c2_7d06_iftrue;
     fill_y0_MUX_uxn_c_l129_c2_7d06_iffalse <= VAR_fill_y0_MUX_uxn_c_l129_c2_7d06_iffalse;
     -- Outputs
     VAR_fill_y0_MUX_uxn_c_l129_c2_7d06_return_output := fill_y0_MUX_uxn_c_l129_c2_7d06_return_output;

     -- fill_x0_MUX[uxn_c_l129_c2_7d06] LATENCY=0
     -- Inputs
     fill_x0_MUX_uxn_c_l129_c2_7d06_cond <= VAR_fill_x0_MUX_uxn_c_l129_c2_7d06_cond;
     fill_x0_MUX_uxn_c_l129_c2_7d06_iftrue <= VAR_fill_x0_MUX_uxn_c_l129_c2_7d06_iftrue;
     fill_x0_MUX_uxn_c_l129_c2_7d06_iffalse <= VAR_fill_x0_MUX_uxn_c_l129_c2_7d06_iffalse;
     -- Outputs
     VAR_fill_x0_MUX_uxn_c_l129_c2_7d06_return_output := fill_x0_MUX_uxn_c_l129_c2_7d06_return_output;

     -- y_MUX[uxn_c_l129_c2_7d06] LATENCY=0
     -- Inputs
     y_MUX_uxn_c_l129_c2_7d06_cond <= VAR_y_MUX_uxn_c_l129_c2_7d06_cond;
     y_MUX_uxn_c_l129_c2_7d06_iftrue <= VAR_y_MUX_uxn_c_l129_c2_7d06_iftrue;
     y_MUX_uxn_c_l129_c2_7d06_iffalse <= VAR_y_MUX_uxn_c_l129_c2_7d06_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_c_l129_c2_7d06_return_output := y_MUX_uxn_c_l129_c2_7d06_return_output;

     -- fill_y1_MUX[uxn_c_l129_c2_7d06] LATENCY=0
     -- Inputs
     fill_y1_MUX_uxn_c_l129_c2_7d06_cond <= VAR_fill_y1_MUX_uxn_c_l129_c2_7d06_cond;
     fill_y1_MUX_uxn_c_l129_c2_7d06_iftrue <= VAR_fill_y1_MUX_uxn_c_l129_c2_7d06_iftrue;
     fill_y1_MUX_uxn_c_l129_c2_7d06_iffalse <= VAR_fill_y1_MUX_uxn_c_l129_c2_7d06_iffalse;
     -- Outputs
     VAR_fill_y1_MUX_uxn_c_l129_c2_7d06_return_output := fill_y1_MUX_uxn_c_l129_c2_7d06_return_output;

     -- is_fill_active_MUX[uxn_c_l129_c2_7d06] LATENCY=0
     -- Inputs
     is_fill_active_MUX_uxn_c_l129_c2_7d06_cond <= VAR_is_fill_active_MUX_uxn_c_l129_c2_7d06_cond;
     is_fill_active_MUX_uxn_c_l129_c2_7d06_iftrue <= VAR_is_fill_active_MUX_uxn_c_l129_c2_7d06_iftrue;
     is_fill_active_MUX_uxn_c_l129_c2_7d06_iffalse <= VAR_is_fill_active_MUX_uxn_c_l129_c2_7d06_iffalse;
     -- Outputs
     VAR_is_fill_active_MUX_uxn_c_l129_c2_7d06_return_output := is_fill_active_MUX_uxn_c_l129_c2_7d06_return_output;

     -- fill_color_MUX[uxn_c_l129_c2_7d06] LATENCY=0
     -- Inputs
     fill_color_MUX_uxn_c_l129_c2_7d06_cond <= VAR_fill_color_MUX_uxn_c_l129_c2_7d06_cond;
     fill_color_MUX_uxn_c_l129_c2_7d06_iftrue <= VAR_fill_color_MUX_uxn_c_l129_c2_7d06_iftrue;
     fill_color_MUX_uxn_c_l129_c2_7d06_iffalse <= VAR_fill_color_MUX_uxn_c_l129_c2_7d06_iffalse;
     -- Outputs
     VAR_fill_color_MUX_uxn_c_l129_c2_7d06_return_output := fill_color_MUX_uxn_c_l129_c2_7d06_return_output;

     -- Submodule level 5
     VAR_BIN_OP_PLUS_uxn_c_l141_c28_fc95_left := VAR_BIN_OP_MINUS_uxn_c_l141_c28_17ee_return_output;
     VAR_MUX_uxn_c_l161_c3_1dbd_iftrue := VAR_fill_color_MUX_uxn_c_l129_c2_7d06_return_output;
     VAR_MUX_uxn_c_l168_c3_4759_iftrue := VAR_fill_color_MUX_uxn_c_l129_c2_7d06_return_output;
     REG_VAR_fill_color := VAR_fill_color_MUX_uxn_c_l129_c2_7d06_return_output;
     VAR_BIN_OP_AND_uxn_c_l156_c27_6951_right := VAR_fill_layer_MUX_uxn_c_l129_c2_7d06_return_output;
     VAR_UNARY_OP_NOT_uxn_c_l155_c46_7cef_expr := VAR_fill_layer_MUX_uxn_c_l129_c2_7d06_return_output;
     REG_VAR_fill_layer := VAR_fill_layer_MUX_uxn_c_l129_c2_7d06_return_output;
     VAR_MUX_uxn_c_l153_c6_80ee_iftrue := VAR_fill_x0_MUX_uxn_c_l129_c2_7d06_return_output;
     REG_VAR_fill_x0 := VAR_fill_x0_MUX_uxn_c_l129_c2_7d06_return_output;
     VAR_BIN_OP_EQ_uxn_c_l151_c29_8b60_right := VAR_fill_x1_MUX_uxn_c_l129_c2_7d06_return_output;
     REG_VAR_fill_x1 := VAR_fill_x1_MUX_uxn_c_l129_c2_7d06_return_output;
     REG_VAR_fill_y0 := VAR_fill_y0_MUX_uxn_c_l129_c2_7d06_return_output;
     REG_VAR_fill_y1 := VAR_fill_y1_MUX_uxn_c_l129_c2_7d06_return_output;
     VAR_BIN_OP_AND_uxn_c_l155_c27_406c_left := VAR_is_fill_active_MUX_uxn_c_l129_c2_7d06_return_output;
     VAR_BIN_OP_AND_uxn_c_l156_c27_6951_left := VAR_is_fill_active_MUX_uxn_c_l129_c2_7d06_return_output;
     VAR_MUX_uxn_c_l149_c35_1d2f_cond := VAR_is_fill_active_MUX_uxn_c_l129_c2_7d06_return_output;
     VAR_MUX_uxn_c_l172_c26_7a68_cond := VAR_is_fill_active_MUX_uxn_c_l129_c2_7d06_return_output;
     VAR_UNARY_OP_NOT_uint1_t_uxn_c_l169_l162_DUPLICATE_fe08_expr := VAR_is_fill_active_MUX_uxn_c_l129_c2_7d06_return_output;
     VAR_BIN_OP_EQ_uxn_c_l151_c29_8b60_left := VAR_x_MUX_uxn_c_l129_c2_7d06_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l149_c54_4f55_right := VAR_x_MUX_uxn_c_l129_c2_7d06_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l153_c34_4e7a_left := VAR_x_MUX_uxn_c_l129_c2_7d06_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l149_c54_3c4e_left := VAR_y_MUX_uxn_c_l129_c2_7d06_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l152_c25_efaa_left := VAR_y_MUX_uxn_c_l129_c2_7d06_return_output;
     VAR_MUX_uxn_c_l152_c6_d938_iffalse := VAR_y_MUX_uxn_c_l129_c2_7d06_return_output;
     -- BIN_OP_AND[uxn_c_l156_c27_6951] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l156_c27_6951_left <= VAR_BIN_OP_AND_uxn_c_l156_c27_6951_left;
     BIN_OP_AND_uxn_c_l156_c27_6951_right <= VAR_BIN_OP_AND_uxn_c_l156_c27_6951_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l156_c27_6951_return_output := BIN_OP_AND_uxn_c_l156_c27_6951_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_c_l149_c54_3c4e] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_c_l149_c54_3c4e_left <= VAR_BIN_OP_INFERRED_MULT_uxn_c_l149_c54_3c4e_left;
     BIN_OP_INFERRED_MULT_uxn_c_l149_c54_3c4e_right <= VAR_BIN_OP_INFERRED_MULT_uxn_c_l149_c54_3c4e_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l149_c54_3c4e_return_output := BIN_OP_INFERRED_MULT_uxn_c_l149_c54_3c4e_return_output;

     -- BIN_OP_EQ[uxn_c_l151_c29_8b60] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l151_c29_8b60_left <= VAR_BIN_OP_EQ_uxn_c_l151_c29_8b60_left;
     BIN_OP_EQ_uxn_c_l151_c29_8b60_right <= VAR_BIN_OP_EQ_uxn_c_l151_c29_8b60_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l151_c29_8b60_return_output := BIN_OP_EQ_uxn_c_l151_c29_8b60_return_output;

     -- BIN_OP_PLUS[uxn_c_l141_c28_fc95] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l141_c28_fc95_left <= VAR_BIN_OP_PLUS_uxn_c_l141_c28_fc95_left;
     BIN_OP_PLUS_uxn_c_l141_c28_fc95_right <= VAR_BIN_OP_PLUS_uxn_c_l141_c28_fc95_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l141_c28_fc95_return_output := BIN_OP_PLUS_uxn_c_l141_c28_fc95_return_output;

     -- UNARY_OP_NOT[uxn_c_l155_c46_7cef] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l155_c46_7cef_expr <= VAR_UNARY_OP_NOT_uxn_c_l155_c46_7cef_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l155_c46_7cef_return_output := UNARY_OP_NOT_uxn_c_l155_c46_7cef_return_output;

     -- BIN_OP_PLUS[uxn_c_l152_c25_efaa] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l152_c25_efaa_left <= VAR_BIN_OP_PLUS_uxn_c_l152_c25_efaa_left;
     BIN_OP_PLUS_uxn_c_l152_c25_efaa_right <= VAR_BIN_OP_PLUS_uxn_c_l152_c25_efaa_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l152_c25_efaa_return_output := BIN_OP_PLUS_uxn_c_l152_c25_efaa_return_output;

     -- BIN_OP_PLUS[uxn_c_l153_c34_4e7a] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l153_c34_4e7a_left <= VAR_BIN_OP_PLUS_uxn_c_l153_c34_4e7a_left;
     BIN_OP_PLUS_uxn_c_l153_c34_4e7a_right <= VAR_BIN_OP_PLUS_uxn_c_l153_c34_4e7a_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l153_c34_4e7a_return_output := BIN_OP_PLUS_uxn_c_l153_c34_4e7a_return_output;

     -- UNARY_OP_NOT_uint1_t_uxn_c_l169_l162_DUPLICATE_fe08 LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uint1_t_uxn_c_l169_l162_DUPLICATE_fe08_expr <= VAR_UNARY_OP_NOT_uint1_t_uxn_c_l169_l162_DUPLICATE_fe08_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uint1_t_uxn_c_l169_l162_DUPLICATE_fe08_return_output := UNARY_OP_NOT_uint1_t_uxn_c_l169_l162_DUPLICATE_fe08_return_output;

     -- Submodule level 6
     VAR_BIN_OP_OR_uxn_c_l169_c3_49fa_left := VAR_BIN_OP_AND_uxn_c_l156_c27_6951_return_output;
     VAR_MUX_uxn_c_l168_c3_4759_cond := VAR_BIN_OP_AND_uxn_c_l156_c27_6951_return_output;
     VAR_MUX_uxn_c_l151_c29_339f_cond := VAR_BIN_OP_EQ_uxn_c_l151_c29_8b60_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l149_c54_4f55_left := VAR_BIN_OP_INFERRED_MULT_uxn_c_l149_c54_3c4e_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l141_c28_7dcb_left := VAR_BIN_OP_PLUS_uxn_c_l141_c28_fc95_return_output;
     VAR_MUX_uxn_c_l152_c6_d938_iftrue := resize(VAR_BIN_OP_PLUS_uxn_c_l152_c25_efaa_return_output, 16);
     VAR_MUX_uxn_c_l153_c6_80ee_iffalse := resize(VAR_BIN_OP_PLUS_uxn_c_l153_c34_4e7a_return_output, 16);
     VAR_BIN_OP_AND_uxn_c_l155_c27_406c_right := VAR_UNARY_OP_NOT_uxn_c_l155_c46_7cef_return_output;
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l162_l169_DUPLICATE_0eed_left := VAR_UNARY_OP_NOT_uint1_t_uxn_c_l169_l162_DUPLICATE_fe08_return_output;
     -- BIN_OP_PLUS[uxn_c_l149_c54_4f55] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l149_c54_4f55_left <= VAR_BIN_OP_PLUS_uxn_c_l149_c54_4f55_left;
     BIN_OP_PLUS_uxn_c_l149_c54_4f55_right <= VAR_BIN_OP_PLUS_uxn_c_l149_c54_4f55_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l149_c54_4f55_return_output := BIN_OP_PLUS_uxn_c_l149_c54_4f55_return_output;

     -- MUX[uxn_c_l168_c3_4759] LATENCY=0
     -- Inputs
     MUX_uxn_c_l168_c3_4759_cond <= VAR_MUX_uxn_c_l168_c3_4759_cond;
     MUX_uxn_c_l168_c3_4759_iftrue <= VAR_MUX_uxn_c_l168_c3_4759_iftrue;
     MUX_uxn_c_l168_c3_4759_iffalse <= VAR_MUX_uxn_c_l168_c3_4759_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l168_c3_4759_return_output := MUX_uxn_c_l168_c3_4759_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_c_l141_c28_7dcb] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_c_l141_c28_7dcb_left <= VAR_BIN_OP_INFERRED_MULT_uxn_c_l141_c28_7dcb_left;
     BIN_OP_INFERRED_MULT_uxn_c_l141_c28_7dcb_right <= VAR_BIN_OP_INFERRED_MULT_uxn_c_l141_c28_7dcb_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l141_c28_7dcb_return_output := BIN_OP_INFERRED_MULT_uxn_c_l141_c28_7dcb_return_output;

     -- BIN_OP_AND_uint1_t_uint1_t_uxn_c_l162_l169_DUPLICATE_0eed LATENCY=0
     -- Inputs
     BIN_OP_AND_uint1_t_uint1_t_uxn_c_l162_l169_DUPLICATE_0eed_left <= VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l162_l169_DUPLICATE_0eed_left;
     BIN_OP_AND_uint1_t_uint1_t_uxn_c_l162_l169_DUPLICATE_0eed_right <= VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l162_l169_DUPLICATE_0eed_right;
     -- Outputs
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l162_l169_DUPLICATE_0eed_return_output := BIN_OP_AND_uint1_t_uint1_t_uxn_c_l162_l169_DUPLICATE_0eed_return_output;

     -- BIN_OP_AND[uxn_c_l155_c27_406c] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l155_c27_406c_left <= VAR_BIN_OP_AND_uxn_c_l155_c27_406c_left;
     BIN_OP_AND_uxn_c_l155_c27_406c_right <= VAR_BIN_OP_AND_uxn_c_l155_c27_406c_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l155_c27_406c_return_output := BIN_OP_AND_uxn_c_l155_c27_406c_return_output;

     -- MUX[uxn_c_l151_c29_339f] LATENCY=0
     -- Inputs
     MUX_uxn_c_l151_c29_339f_cond <= VAR_MUX_uxn_c_l151_c29_339f_cond;
     MUX_uxn_c_l151_c29_339f_iftrue <= VAR_MUX_uxn_c_l151_c29_339f_iftrue;
     MUX_uxn_c_l151_c29_339f_iffalse <= VAR_MUX_uxn_c_l151_c29_339f_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l151_c29_339f_return_output := MUX_uxn_c_l151_c29_339f_return_output;

     -- Submodule level 7
     VAR_BIN_OP_OR_uxn_c_l162_c3_1a0e_left := VAR_BIN_OP_AND_uxn_c_l155_c27_406c_return_output;
     VAR_MUX_uxn_c_l161_c3_1dbd_cond := VAR_BIN_OP_AND_uxn_c_l155_c27_406c_return_output;
     VAR_BIN_OP_AND_uxn_c_l162_c22_5959_left := VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l162_l169_DUPLICATE_0eed_return_output;
     VAR_BIN_OP_AND_uxn_c_l169_c22_6bb1_left := VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l162_l169_DUPLICATE_0eed_return_output;
     VAR_fill_pixels_remaining_uxn_c_l141_c3_6a59 := resize(VAR_BIN_OP_INFERRED_MULT_uxn_c_l141_c28_7dcb_return_output, 16);
     VAR_MUX_uxn_c_l149_c35_1d2f_iftrue := resize(VAR_BIN_OP_PLUS_uxn_c_l149_c54_4f55_return_output, 16);
     VAR_MUX_uxn_c_l152_c6_d938_cond := VAR_MUX_uxn_c_l151_c29_339f_return_output;
     VAR_MUX_uxn_c_l153_c6_80ee_cond := VAR_MUX_uxn_c_l151_c29_339f_return_output;
     VAR_fg_vram_update_uxn_c_l165_c27_13c9_write_value := VAR_MUX_uxn_c_l168_c3_4759_return_output;
     VAR_fill_pixels_remaining_MUX_uxn_c_l129_c2_7d06_iftrue := VAR_fill_pixels_remaining_uxn_c_l141_c3_6a59;
     -- BIN_OP_AND[uxn_c_l162_c22_5959] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l162_c22_5959_left <= VAR_BIN_OP_AND_uxn_c_l162_c22_5959_left;
     BIN_OP_AND_uxn_c_l162_c22_5959_right <= VAR_BIN_OP_AND_uxn_c_l162_c22_5959_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l162_c22_5959_return_output := BIN_OP_AND_uxn_c_l162_c22_5959_return_output;

     -- MUX[uxn_c_l149_c35_1d2f] LATENCY=0
     -- Inputs
     MUX_uxn_c_l149_c35_1d2f_cond <= VAR_MUX_uxn_c_l149_c35_1d2f_cond;
     MUX_uxn_c_l149_c35_1d2f_iftrue <= VAR_MUX_uxn_c_l149_c35_1d2f_iftrue;
     MUX_uxn_c_l149_c35_1d2f_iffalse <= VAR_MUX_uxn_c_l149_c35_1d2f_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l149_c35_1d2f_return_output := MUX_uxn_c_l149_c35_1d2f_return_output;

     -- MUX[uxn_c_l152_c6_d938] LATENCY=0
     -- Inputs
     MUX_uxn_c_l152_c6_d938_cond <= VAR_MUX_uxn_c_l152_c6_d938_cond;
     MUX_uxn_c_l152_c6_d938_iftrue <= VAR_MUX_uxn_c_l152_c6_d938_iftrue;
     MUX_uxn_c_l152_c6_d938_iffalse <= VAR_MUX_uxn_c_l152_c6_d938_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l152_c6_d938_return_output := MUX_uxn_c_l152_c6_d938_return_output;

     -- BIN_OP_AND[uxn_c_l169_c22_6bb1] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l169_c22_6bb1_left <= VAR_BIN_OP_AND_uxn_c_l169_c22_6bb1_left;
     BIN_OP_AND_uxn_c_l169_c22_6bb1_right <= VAR_BIN_OP_AND_uxn_c_l169_c22_6bb1_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l169_c22_6bb1_return_output := BIN_OP_AND_uxn_c_l169_c22_6bb1_return_output;

     -- fill_pixels_remaining_MUX[uxn_c_l129_c2_7d06] LATENCY=0
     -- Inputs
     fill_pixels_remaining_MUX_uxn_c_l129_c2_7d06_cond <= VAR_fill_pixels_remaining_MUX_uxn_c_l129_c2_7d06_cond;
     fill_pixels_remaining_MUX_uxn_c_l129_c2_7d06_iftrue <= VAR_fill_pixels_remaining_MUX_uxn_c_l129_c2_7d06_iftrue;
     fill_pixels_remaining_MUX_uxn_c_l129_c2_7d06_iffalse <= VAR_fill_pixels_remaining_MUX_uxn_c_l129_c2_7d06_iffalse;
     -- Outputs
     VAR_fill_pixels_remaining_MUX_uxn_c_l129_c2_7d06_return_output := fill_pixels_remaining_MUX_uxn_c_l129_c2_7d06_return_output;

     -- MUX[uxn_c_l161_c3_1dbd] LATENCY=0
     -- Inputs
     MUX_uxn_c_l161_c3_1dbd_cond <= VAR_MUX_uxn_c_l161_c3_1dbd_cond;
     MUX_uxn_c_l161_c3_1dbd_iftrue <= VAR_MUX_uxn_c_l161_c3_1dbd_iftrue;
     MUX_uxn_c_l161_c3_1dbd_iffalse <= VAR_MUX_uxn_c_l161_c3_1dbd_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l161_c3_1dbd_return_output := MUX_uxn_c_l161_c3_1dbd_return_output;

     -- MUX[uxn_c_l153_c6_80ee] LATENCY=0
     -- Inputs
     MUX_uxn_c_l153_c6_80ee_cond <= VAR_MUX_uxn_c_l153_c6_80ee_cond;
     MUX_uxn_c_l153_c6_80ee_iftrue <= VAR_MUX_uxn_c_l153_c6_80ee_iftrue;
     MUX_uxn_c_l153_c6_80ee_iffalse <= VAR_MUX_uxn_c_l153_c6_80ee_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l153_c6_80ee_return_output := MUX_uxn_c_l153_c6_80ee_return_output;

     -- Submodule level 8
     VAR_BIN_OP_OR_uxn_c_l162_c3_1a0e_right := VAR_BIN_OP_AND_uxn_c_l162_c22_5959_return_output;
     VAR_BIN_OP_OR_uxn_c_l169_c3_49fa_right := VAR_BIN_OP_AND_uxn_c_l169_c22_6bb1_return_output;
     VAR_bg_vram_update_uxn_c_l158_c27_60ac_write_address := VAR_MUX_uxn_c_l149_c35_1d2f_return_output;
     VAR_fg_vram_update_uxn_c_l165_c27_13c9_write_address := VAR_MUX_uxn_c_l149_c35_1d2f_return_output;
     REG_VAR_y := VAR_MUX_uxn_c_l152_c6_d938_return_output;
     REG_VAR_x := VAR_MUX_uxn_c_l153_c6_80ee_return_output;
     VAR_bg_vram_update_uxn_c_l158_c27_60ac_write_value := VAR_MUX_uxn_c_l161_c3_1dbd_return_output;
     VAR_BIN_OP_MINUS_uxn_c_l172_c43_5c05_left := VAR_fill_pixels_remaining_MUX_uxn_c_l129_c2_7d06_return_output;
     -- BIN_OP_OR[uxn_c_l169_c3_49fa] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l169_c3_49fa_left <= VAR_BIN_OP_OR_uxn_c_l169_c3_49fa_left;
     BIN_OP_OR_uxn_c_l169_c3_49fa_right <= VAR_BIN_OP_OR_uxn_c_l169_c3_49fa_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l169_c3_49fa_return_output := BIN_OP_OR_uxn_c_l169_c3_49fa_return_output;

     -- BIN_OP_OR[uxn_c_l162_c3_1a0e] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l162_c3_1a0e_left <= VAR_BIN_OP_OR_uxn_c_l162_c3_1a0e_left;
     BIN_OP_OR_uxn_c_l162_c3_1a0e_right <= VAR_BIN_OP_OR_uxn_c_l162_c3_1a0e_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l162_c3_1a0e_return_output := BIN_OP_OR_uxn_c_l162_c3_1a0e_return_output;

     -- BIN_OP_MINUS[uxn_c_l172_c43_5c05] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l172_c43_5c05_left <= VAR_BIN_OP_MINUS_uxn_c_l172_c43_5c05_left;
     BIN_OP_MINUS_uxn_c_l172_c43_5c05_right <= VAR_BIN_OP_MINUS_uxn_c_l172_c43_5c05_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l172_c43_5c05_return_output := BIN_OP_MINUS_uxn_c_l172_c43_5c05_return_output;

     -- Submodule level 9
     VAR_MUX_uxn_c_l172_c26_7a68_iftrue := VAR_BIN_OP_MINUS_uxn_c_l172_c43_5c05_return_output;
     VAR_bg_vram_update_uxn_c_l158_c27_60ac_write_enable := VAR_BIN_OP_OR_uxn_c_l162_c3_1a0e_return_output;
     VAR_fg_vram_update_uxn_c_l165_c27_13c9_write_enable := VAR_BIN_OP_OR_uxn_c_l169_c3_49fa_return_output;
     -- MUX[uxn_c_l172_c26_7a68] LATENCY=0
     -- Inputs
     MUX_uxn_c_l172_c26_7a68_cond <= VAR_MUX_uxn_c_l172_c26_7a68_cond;
     MUX_uxn_c_l172_c26_7a68_iftrue <= VAR_MUX_uxn_c_l172_c26_7a68_iftrue;
     MUX_uxn_c_l172_c26_7a68_iffalse <= VAR_MUX_uxn_c_l172_c26_7a68_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l172_c26_7a68_return_output := MUX_uxn_c_l172_c26_7a68_return_output;

     -- bg_vram_update[uxn_c_l158_c27_60ac] LATENCY=0
     -- Clock enable
     bg_vram_update_uxn_c_l158_c27_60ac_CLOCK_ENABLE <= VAR_bg_vram_update_uxn_c_l158_c27_60ac_CLOCK_ENABLE;
     -- Inputs
     bg_vram_update_uxn_c_l158_c27_60ac_read_address <= VAR_bg_vram_update_uxn_c_l158_c27_60ac_read_address;
     bg_vram_update_uxn_c_l158_c27_60ac_write_address <= VAR_bg_vram_update_uxn_c_l158_c27_60ac_write_address;
     bg_vram_update_uxn_c_l158_c27_60ac_write_value <= VAR_bg_vram_update_uxn_c_l158_c27_60ac_write_value;
     bg_vram_update_uxn_c_l158_c27_60ac_write_enable <= VAR_bg_vram_update_uxn_c_l158_c27_60ac_write_enable;
     -- Outputs
     VAR_bg_vram_update_uxn_c_l158_c27_60ac_return_output := bg_vram_update_uxn_c_l158_c27_60ac_return_output;

     -- fg_vram_update[uxn_c_l165_c27_13c9] LATENCY=0
     -- Clock enable
     fg_vram_update_uxn_c_l165_c27_13c9_CLOCK_ENABLE <= VAR_fg_vram_update_uxn_c_l165_c27_13c9_CLOCK_ENABLE;
     -- Inputs
     fg_vram_update_uxn_c_l165_c27_13c9_read_address <= VAR_fg_vram_update_uxn_c_l165_c27_13c9_read_address;
     fg_vram_update_uxn_c_l165_c27_13c9_write_address <= VAR_fg_vram_update_uxn_c_l165_c27_13c9_write_address;
     fg_vram_update_uxn_c_l165_c27_13c9_write_value <= VAR_fg_vram_update_uxn_c_l165_c27_13c9_write_value;
     fg_vram_update_uxn_c_l165_c27_13c9_write_enable <= VAR_fg_vram_update_uxn_c_l165_c27_13c9_write_enable;
     -- Outputs
     VAR_fg_vram_update_uxn_c_l165_c27_13c9_return_output := fg_vram_update_uxn_c_l165_c27_13c9_return_output;

     -- Submodule level 10
     VAR_BIN_OP_EQ_uxn_c_l173_c19_c682_left := VAR_MUX_uxn_c_l172_c26_7a68_return_output;
     REG_VAR_fill_pixels_remaining := VAR_MUX_uxn_c_l172_c26_7a68_return_output;
     VAR_MUX_uxn_c_l176_c17_58e0_iftrue := VAR_bg_vram_update_uxn_c_l158_c27_60ac_return_output;
     VAR_BIN_OP_EQ_uxn_c_l176_c17_364a_left := VAR_fg_vram_update_uxn_c_l165_c27_13c9_return_output;
     VAR_MUX_uxn_c_l176_c17_58e0_iffalse := VAR_fg_vram_update_uxn_c_l165_c27_13c9_return_output;
     -- BIN_OP_EQ[uxn_c_l173_c19_c682] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l173_c19_c682_left <= VAR_BIN_OP_EQ_uxn_c_l173_c19_c682_left;
     BIN_OP_EQ_uxn_c_l173_c19_c682_right <= VAR_BIN_OP_EQ_uxn_c_l173_c19_c682_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l173_c19_c682_return_output := BIN_OP_EQ_uxn_c_l173_c19_c682_return_output;

     -- BIN_OP_EQ[uxn_c_l176_c17_364a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l176_c17_364a_left <= VAR_BIN_OP_EQ_uxn_c_l176_c17_364a_left;
     BIN_OP_EQ_uxn_c_l176_c17_364a_right <= VAR_BIN_OP_EQ_uxn_c_l176_c17_364a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l176_c17_364a_return_output := BIN_OP_EQ_uxn_c_l176_c17_364a_return_output;

     -- Submodule level 11
     VAR_MUX_uxn_c_l173_c19_25ba_cond := VAR_BIN_OP_EQ_uxn_c_l173_c19_c682_return_output;
     VAR_MUX_uxn_c_l176_c17_58e0_cond := VAR_BIN_OP_EQ_uxn_c_l176_c17_364a_return_output;
     -- MUX[uxn_c_l176_c17_58e0] LATENCY=0
     -- Inputs
     MUX_uxn_c_l176_c17_58e0_cond <= VAR_MUX_uxn_c_l176_c17_58e0_cond;
     MUX_uxn_c_l176_c17_58e0_iftrue <= VAR_MUX_uxn_c_l176_c17_58e0_iftrue;
     MUX_uxn_c_l176_c17_58e0_iffalse <= VAR_MUX_uxn_c_l176_c17_58e0_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l176_c17_58e0_return_output := MUX_uxn_c_l176_c17_58e0_return_output;

     -- MUX[uxn_c_l173_c19_25ba] LATENCY=0
     -- Inputs
     MUX_uxn_c_l173_c19_25ba_cond <= VAR_MUX_uxn_c_l173_c19_25ba_cond;
     MUX_uxn_c_l173_c19_25ba_iftrue <= VAR_MUX_uxn_c_l173_c19_25ba_iftrue;
     MUX_uxn_c_l173_c19_25ba_iffalse <= VAR_MUX_uxn_c_l173_c19_25ba_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l173_c19_25ba_return_output := MUX_uxn_c_l173_c19_25ba_return_output;

     -- Submodule level 12
     REG_VAR_is_fill_active := VAR_MUX_uxn_c_l173_c19_25ba_return_output;
     -- CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_269d[uxn_c_l179_c9_efb2] LATENCY=0
     VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_269d_uxn_c_l179_c9_efb2_return_output := CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_269d(
     VAR_MUX_uxn_c_l175_c25_30ef_return_output,
     VAR_MUX_uxn_c_l176_c17_58e0_return_output,
     VAR_MUX_uxn_c_l173_c19_25ba_return_output);

     -- Submodule level 13
     VAR_return_output := VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_269d_uxn_c_l179_c9_efb2_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
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
