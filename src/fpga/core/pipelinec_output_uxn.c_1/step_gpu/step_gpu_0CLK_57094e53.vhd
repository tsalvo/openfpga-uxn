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
-- -- use ieee.float_pkg.all;
use work.c_structs_pkg.all;
-- Submodules: 70
entity step_gpu_0CLK_57094e53 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 is_active_drawing_area : in unsigned(0 downto 0);
 is_vram_write : in unsigned(0 downto 0);
 vram_write_layer : in unsigned(0 downto 0);
 vram_address : in unsigned(31 downto 0);
 vram_value : in unsigned(1 downto 0);
 return_output : out gpu_step_result_t);
end step_gpu_0CLK_57094e53;
architecture arch of step_gpu_0CLK_57094e53 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal result : gpu_step_result_t := (
color => to_unsigned(0, 2),
is_active_fill => to_unsigned(0, 1))
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
-- BIN_OP_GT[uxn_c_l119_c26_de19]
signal BIN_OP_GT_uxn_c_l119_c26_de19_left : unsigned(31 downto 0);
signal BIN_OP_GT_uxn_c_l119_c26_de19_right : unsigned(17 downto 0);
signal BIN_OP_GT_uxn_c_l119_c26_de19_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l119_c26_f9ae]
signal MUX_uxn_c_l119_c26_f9ae_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l119_c26_f9ae_iftrue : unsigned(31 downto 0);
signal MUX_uxn_c_l119_c26_f9ae_iffalse : unsigned(31 downto 0);
signal MUX_uxn_c_l119_c26_f9ae_return_output : unsigned(31 downto 0);

-- CONST_SR_28[uxn_c_l120_c24_94b7]
signal CONST_SR_28_uxn_c_l120_c24_94b7_x : unsigned(31 downto 0);
signal CONST_SR_28_uxn_c_l120_c24_94b7_return_output : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_c_l121_c17_7783]
signal BIN_OP_EQ_uxn_c_l121_c17_7783_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l121_c17_7783_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l121_c17_7783_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l121_c17_8ed4]
signal MUX_uxn_c_l121_c17_8ed4_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l121_c17_8ed4_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l121_c17_8ed4_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l121_c17_8ed4_return_output : unsigned(0 downto 0);

-- BIN_OP_DIV[uxn_c_l122_c6_eacc]
signal BIN_OP_DIV_uxn_c_l122_c6_eacc_left : unsigned(31 downto 0);
signal BIN_OP_DIV_uxn_c_l122_c6_eacc_right : unsigned(8 downto 0);
signal BIN_OP_DIV_uxn_c_l122_c6_eacc_return_output : unsigned(31 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_c_l123_c23_2fbc]
signal BIN_OP_INFERRED_MULT_uxn_c_l123_c23_2fbc_left : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_c_l123_c23_2fbc_right : unsigned(8 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_c_l123_c23_2fbc_return_output : unsigned(24 downto 0);

-- BIN_OP_MINUS[uxn_c_l123_c6_4590]
signal BIN_OP_MINUS_uxn_c_l123_c6_4590_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_uxn_c_l123_c6_4590_right : unsigned(24 downto 0);
signal BIN_OP_MINUS_uxn_c_l123_c6_4590_return_output : unsigned(31 downto 0);

-- UNARY_OP_NOT[uxn_c_l126_c22_afde]
signal UNARY_OP_NOT_uxn_c_l126_c22_afde_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l126_c22_afde_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l126_c6_25c8]
signal BIN_OP_AND_uxn_c_l126_c6_25c8_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l126_c6_25c8_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l126_c6_25c8_return_output : unsigned(0 downto 0);

-- fill_x0_MUX[uxn_c_l126_c2_8fe6]
signal fill_x0_MUX_uxn_c_l126_c2_8fe6_cond : unsigned(0 downto 0);
signal fill_x0_MUX_uxn_c_l126_c2_8fe6_iftrue : unsigned(15 downto 0);
signal fill_x0_MUX_uxn_c_l126_c2_8fe6_iffalse : unsigned(15 downto 0);
signal fill_x0_MUX_uxn_c_l126_c2_8fe6_return_output : unsigned(15 downto 0);

-- fill_color_MUX[uxn_c_l126_c2_8fe6]
signal fill_color_MUX_uxn_c_l126_c2_8fe6_cond : unsigned(0 downto 0);
signal fill_color_MUX_uxn_c_l126_c2_8fe6_iftrue : unsigned(1 downto 0);
signal fill_color_MUX_uxn_c_l126_c2_8fe6_iffalse : unsigned(1 downto 0);
signal fill_color_MUX_uxn_c_l126_c2_8fe6_return_output : unsigned(1 downto 0);

-- is_fill_top_MUX[uxn_c_l126_c2_8fe6]
signal is_fill_top_MUX_uxn_c_l126_c2_8fe6_cond : unsigned(0 downto 0);
signal is_fill_top_MUX_uxn_c_l126_c2_8fe6_iftrue : unsigned(0 downto 0);
signal is_fill_top_MUX_uxn_c_l126_c2_8fe6_iffalse : unsigned(0 downto 0);
signal is_fill_top_MUX_uxn_c_l126_c2_8fe6_return_output : unsigned(0 downto 0);

-- fill_x1_MUX[uxn_c_l126_c2_8fe6]
signal fill_x1_MUX_uxn_c_l126_c2_8fe6_cond : unsigned(0 downto 0);
signal fill_x1_MUX_uxn_c_l126_c2_8fe6_iftrue : unsigned(15 downto 0);
signal fill_x1_MUX_uxn_c_l126_c2_8fe6_iffalse : unsigned(15 downto 0);
signal fill_x1_MUX_uxn_c_l126_c2_8fe6_return_output : unsigned(15 downto 0);

-- fill_y1_MUX[uxn_c_l126_c2_8fe6]
signal fill_y1_MUX_uxn_c_l126_c2_8fe6_cond : unsigned(0 downto 0);
signal fill_y1_MUX_uxn_c_l126_c2_8fe6_iftrue : unsigned(15 downto 0);
signal fill_y1_MUX_uxn_c_l126_c2_8fe6_iffalse : unsigned(15 downto 0);
signal fill_y1_MUX_uxn_c_l126_c2_8fe6_return_output : unsigned(15 downto 0);

-- is_fill_left_MUX[uxn_c_l126_c2_8fe6]
signal is_fill_left_MUX_uxn_c_l126_c2_8fe6_cond : unsigned(0 downto 0);
signal is_fill_left_MUX_uxn_c_l126_c2_8fe6_iftrue : unsigned(0 downto 0);
signal is_fill_left_MUX_uxn_c_l126_c2_8fe6_iffalse : unsigned(0 downto 0);
signal is_fill_left_MUX_uxn_c_l126_c2_8fe6_return_output : unsigned(0 downto 0);

-- fill_y0_MUX[uxn_c_l126_c2_8fe6]
signal fill_y0_MUX_uxn_c_l126_c2_8fe6_cond : unsigned(0 downto 0);
signal fill_y0_MUX_uxn_c_l126_c2_8fe6_iftrue : unsigned(15 downto 0);
signal fill_y0_MUX_uxn_c_l126_c2_8fe6_iffalse : unsigned(15 downto 0);
signal fill_y0_MUX_uxn_c_l126_c2_8fe6_return_output : unsigned(15 downto 0);

-- fill_pixels_remaining_MUX[uxn_c_l126_c2_8fe6]
signal fill_pixels_remaining_MUX_uxn_c_l126_c2_8fe6_cond : unsigned(0 downto 0);
signal fill_pixels_remaining_MUX_uxn_c_l126_c2_8fe6_iftrue : unsigned(31 downto 0);
signal fill_pixels_remaining_MUX_uxn_c_l126_c2_8fe6_iffalse : unsigned(31 downto 0);
signal fill_pixels_remaining_MUX_uxn_c_l126_c2_8fe6_return_output : unsigned(31 downto 0);

-- fill_layer_MUX[uxn_c_l126_c2_8fe6]
signal fill_layer_MUX_uxn_c_l126_c2_8fe6_cond : unsigned(0 downto 0);
signal fill_layer_MUX_uxn_c_l126_c2_8fe6_iftrue : unsigned(0 downto 0);
signal fill_layer_MUX_uxn_c_l126_c2_8fe6_iffalse : unsigned(0 downto 0);
signal fill_layer_MUX_uxn_c_l126_c2_8fe6_return_output : unsigned(0 downto 0);

-- CONST_SR_20[uxn_c_l128_c18_b15c]
signal CONST_SR_20_uxn_c_l128_c18_b15c_x : unsigned(31 downto 0);
signal CONST_SR_20_uxn_c_l128_c18_b15c_return_output : unsigned(31 downto 0);

-- CONST_SR_21[uxn_c_l129_c17_ecf7]
signal CONST_SR_21_uxn_c_l129_c17_ecf7_x : unsigned(31 downto 0);
signal CONST_SR_21_uxn_c_l129_c17_ecf7_return_output : unsigned(31 downto 0);

-- BIN_OP_AND[uxn_c_l130_c27_5860]
signal BIN_OP_AND_uxn_c_l130_c27_5860_left : unsigned(31 downto 0);
signal BIN_OP_AND_uxn_c_l130_c27_5860_right : unsigned(17 downto 0);
signal BIN_OP_AND_uxn_c_l130_c27_5860_return_output : unsigned(31 downto 0);

-- BIN_OP_DIV[uxn_c_l131_c13_0eaa]
signal BIN_OP_DIV_uxn_c_l131_c13_0eaa_left : unsigned(31 downto 0);
signal BIN_OP_DIV_uxn_c_l131_c13_0eaa_right : unsigned(8 downto 0);
signal BIN_OP_DIV_uxn_c_l131_c13_0eaa_return_output : unsigned(31 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_c_l132_c38_1f7a]
signal BIN_OP_INFERRED_MULT_uxn_c_l132_c38_1f7a_left : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_c_l132_c38_1f7a_right : unsigned(8 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_c_l132_c38_1f7a_return_output : unsigned(24 downto 0);

-- BIN_OP_MINUS[uxn_c_l132_c13_55c6]
signal BIN_OP_MINUS_uxn_c_l132_c13_55c6_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_uxn_c_l132_c13_55c6_right : unsigned(24 downto 0);
signal BIN_OP_MINUS_uxn_c_l132_c13_55c6_return_output : unsigned(31 downto 0);

-- MUX[uxn_c_l133_c13_f7ea]
signal MUX_uxn_c_l133_c13_f7ea_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l133_c13_f7ea_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l133_c13_f7ea_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l133_c13_f7ea_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l134_c13_902c]
signal MUX_uxn_c_l134_c13_902c_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l134_c13_902c_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l134_c13_902c_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l134_c13_902c_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l135_c13_fa57]
signal MUX_uxn_c_l135_c13_fa57_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l135_c13_fa57_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l135_c13_fa57_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l135_c13_fa57_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l136_c13_e4f6]
signal MUX_uxn_c_l136_c13_e4f6_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l136_c13_e4f6_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l136_c13_e4f6_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l136_c13_e4f6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l142_c19_1b94]
signal BIN_OP_EQ_uxn_c_l142_c19_1b94_left : unsigned(31 downto 0);
signal BIN_OP_EQ_uxn_c_l142_c19_1b94_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l142_c19_1b94_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l142_c19_1c39]
signal MUX_uxn_c_l142_c19_1c39_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l142_c19_1c39_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l142_c19_1c39_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l142_c19_1c39_return_output : unsigned(0 downto 0);

-- BIN_OP_GT[uxn_c_l144_c17_eb96]
signal BIN_OP_GT_uxn_c_l144_c17_eb96_left : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_c_l144_c17_eb96_right : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_c_l144_c17_eb96_return_output : unsigned(0 downto 0);

-- BIN_OP_LT[uxn_c_l145_c17_8673]
signal BIN_OP_LT_uxn_c_l145_c17_8673_left : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_c_l145_c17_8673_right : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_c_l145_c17_8673_return_output : unsigned(0 downto 0);

-- BIN_OP_GT[uxn_c_l146_c17_f2f9]
signal BIN_OP_GT_uxn_c_l146_c17_f2f9_left : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_c_l146_c17_f2f9_right : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_c_l146_c17_f2f9_return_output : unsigned(0 downto 0);

-- BIN_OP_LT[uxn_c_l147_c17_648c]
signal BIN_OP_LT_uxn_c_l147_c17_648c_left : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_c_l147_c17_648c_right : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_c_l147_c17_648c_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l149_c18_2f0d]
signal BIN_OP_AND_uxn_c_l149_c18_2f0d_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l149_c18_2f0d_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l149_c18_2f0d_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l149_c18_53c1]
signal BIN_OP_AND_uxn_c_l149_c18_53c1_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l149_c18_53c1_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l149_c18_53c1_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l149_c18_d9ee]
signal BIN_OP_AND_uxn_c_l149_c18_d9ee_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l149_c18_d9ee_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l149_c18_d9ee_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l149_c18_ca70]
signal BIN_OP_AND_uxn_c_l149_c18_ca70_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l149_c18_ca70_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l149_c18_ca70_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_c_l150_c37_ef67]
signal UNARY_OP_NOT_uxn_c_l150_c37_ef67_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l150_c37_ef67_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l150_c19_88bc]
signal BIN_OP_AND_uxn_c_l150_c19_88bc_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l150_c19_88bc_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l150_c19_88bc_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l151_c19_6cca]
signal BIN_OP_AND_uxn_c_l151_c19_6cca_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l151_c19_6cca_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l151_c19_6cca_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l155_c37_beb5]
signal MUX_uxn_c_l155_c37_beb5_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l155_c37_beb5_iftrue : unsigned(31 downto 0);
signal MUX_uxn_c_l155_c37_beb5_iffalse : unsigned(31 downto 0);
signal MUX_uxn_c_l155_c37_beb5_return_output : unsigned(31 downto 0);

-- MUX[uxn_c_l155_c3_063f]
signal MUX_uxn_c_l155_c3_063f_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l155_c3_063f_iftrue : unsigned(31 downto 0);
signal MUX_uxn_c_l155_c3_063f_iffalse : unsigned(31 downto 0);
signal MUX_uxn_c_l155_c3_063f_return_output : unsigned(31 downto 0);

-- MUX[uxn_c_l156_c3_25f1]
signal MUX_uxn_c_l156_c3_25f1_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l156_c3_25f1_iftrue : unsigned(1 downto 0);
signal MUX_uxn_c_l156_c3_25f1_iffalse : unsigned(1 downto 0);
signal MUX_uxn_c_l156_c3_25f1_return_output : unsigned(1 downto 0);

-- UNARY_OP_NOT[uxn_c_l157_c57_4dc4]
signal UNARY_OP_NOT_uxn_c_l157_c57_4dc4_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l157_c57_4dc4_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l157_c22_7ece]
signal BIN_OP_AND_uxn_c_l157_c22_7ece_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l157_c22_7ece_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l157_c22_7ece_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_c_l157_c3_6600]
signal BIN_OP_OR_uxn_c_l157_c3_6600_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l157_c3_6600_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l157_c3_6600_return_output : unsigned(0 downto 0);

-- bg_vram_update[uxn_c_l153_c19_75bb]
signal bg_vram_update_uxn_c_l153_c19_75bb_CLOCK_ENABLE : unsigned(0 downto 0);
signal bg_vram_update_uxn_c_l153_c19_75bb_read_address : unsigned(31 downto 0);
signal bg_vram_update_uxn_c_l153_c19_75bb_write_address : unsigned(31 downto 0);
signal bg_vram_update_uxn_c_l153_c19_75bb_write_value : unsigned(1 downto 0);
signal bg_vram_update_uxn_c_l153_c19_75bb_write_enable : unsigned(0 downto 0);
signal bg_vram_update_uxn_c_l153_c19_75bb_return_output : unsigned(1 downto 0);

-- MUX[uxn_c_l162_c37_1152]
signal MUX_uxn_c_l162_c37_1152_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l162_c37_1152_iftrue : unsigned(31 downto 0);
signal MUX_uxn_c_l162_c37_1152_iffalse : unsigned(31 downto 0);
signal MUX_uxn_c_l162_c37_1152_return_output : unsigned(31 downto 0);

-- MUX[uxn_c_l162_c3_e46d]
signal MUX_uxn_c_l162_c3_e46d_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l162_c3_e46d_iftrue : unsigned(31 downto 0);
signal MUX_uxn_c_l162_c3_e46d_iffalse : unsigned(31 downto 0);
signal MUX_uxn_c_l162_c3_e46d_return_output : unsigned(31 downto 0);

-- MUX[uxn_c_l163_c3_3fd8]
signal MUX_uxn_c_l163_c3_3fd8_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l163_c3_3fd8_iftrue : unsigned(1 downto 0);
signal MUX_uxn_c_l163_c3_3fd8_iffalse : unsigned(1 downto 0);
signal MUX_uxn_c_l163_c3_3fd8_return_output : unsigned(1 downto 0);

-- BIN_OP_AND[uxn_c_l164_c22_a524]
signal BIN_OP_AND_uxn_c_l164_c22_a524_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l164_c22_a524_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l164_c22_a524_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_c_l164_c3_c1cb]
signal BIN_OP_OR_uxn_c_l164_c3_c1cb_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l164_c3_c1cb_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l164_c3_c1cb_return_output : unsigned(0 downto 0);

-- fg_vram_update[uxn_c_l160_c19_97d2]
signal fg_vram_update_uxn_c_l160_c19_97d2_CLOCK_ENABLE : unsigned(0 downto 0);
signal fg_vram_update_uxn_c_l160_c19_97d2_read_address : unsigned(31 downto 0);
signal fg_vram_update_uxn_c_l160_c19_97d2_write_address : unsigned(31 downto 0);
signal fg_vram_update_uxn_c_l160_c19_97d2_write_value : unsigned(1 downto 0);
signal fg_vram_update_uxn_c_l160_c19_97d2_write_enable : unsigned(0 downto 0);
signal fg_vram_update_uxn_c_l160_c19_97d2_return_output : unsigned(1 downto 0);

-- BIN_OP_EQ[uxn_c_l168_c6_9331]
signal BIN_OP_EQ_uxn_c_l168_c6_9331_left : unsigned(31 downto 0);
signal BIN_OP_EQ_uxn_c_l168_c6_9331_right : unsigned(17 downto 0);
signal BIN_OP_EQ_uxn_c_l168_c6_9331_return_output : unsigned(0 downto 0);

-- pixel_counter_MUX[uxn_c_l168_c2_7916]
signal pixel_counter_MUX_uxn_c_l168_c2_7916_cond : unsigned(0 downto 0);
signal pixel_counter_MUX_uxn_c_l168_c2_7916_iftrue : unsigned(31 downto 0);
signal pixel_counter_MUX_uxn_c_l168_c2_7916_iffalse : unsigned(31 downto 0);
signal pixel_counter_MUX_uxn_c_l168_c2_7916_return_output : unsigned(31 downto 0);

-- fill_pixels_remaining_MUX[uxn_c_l168_c2_7916]
signal fill_pixels_remaining_MUX_uxn_c_l168_c2_7916_cond : unsigned(0 downto 0);
signal fill_pixels_remaining_MUX_uxn_c_l168_c2_7916_iftrue : unsigned(31 downto 0);
signal fill_pixels_remaining_MUX_uxn_c_l168_c2_7916_iffalse : unsigned(31 downto 0);
signal fill_pixels_remaining_MUX_uxn_c_l168_c2_7916_return_output : unsigned(31 downto 0);

-- pixel_counter_MUX[uxn_c_l170_c9_5f1d]
signal pixel_counter_MUX_uxn_c_l170_c9_5f1d_cond : unsigned(0 downto 0);
signal pixel_counter_MUX_uxn_c_l170_c9_5f1d_iftrue : unsigned(31 downto 0);
signal pixel_counter_MUX_uxn_c_l170_c9_5f1d_iffalse : unsigned(31 downto 0);
signal pixel_counter_MUX_uxn_c_l170_c9_5f1d_return_output : unsigned(31 downto 0);

-- fill_pixels_remaining_MUX[uxn_c_l170_c9_5f1d]
signal fill_pixels_remaining_MUX_uxn_c_l170_c9_5f1d_cond : unsigned(0 downto 0);
signal fill_pixels_remaining_MUX_uxn_c_l170_c9_5f1d_iftrue : unsigned(31 downto 0);
signal fill_pixels_remaining_MUX_uxn_c_l170_c9_5f1d_iffalse : unsigned(31 downto 0);
signal fill_pixels_remaining_MUX_uxn_c_l170_c9_5f1d_return_output : unsigned(31 downto 0);

-- BIN_OP_PLUS[uxn_c_l171_c3_5c3a]
signal BIN_OP_PLUS_uxn_c_l171_c3_5c3a_left : unsigned(31 downto 0);
signal BIN_OP_PLUS_uxn_c_l171_c3_5c3a_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l171_c3_5c3a_return_output : unsigned(32 downto 0);

-- BIN_OP_EQ[uxn_c_l172_c27_0a47]
signal BIN_OP_EQ_uxn_c_l172_c27_0a47_left : unsigned(31 downto 0);
signal BIN_OP_EQ_uxn_c_l172_c27_0a47_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l172_c27_0a47_return_output : unsigned(0 downto 0);

-- BIN_OP_MINUS[uxn_c_l172_c60_b6c2]
signal BIN_OP_MINUS_uxn_c_l172_c60_b6c2_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_uxn_c_l172_c60_b6c2_right : unsigned(0 downto 0);
signal BIN_OP_MINUS_uxn_c_l172_c60_b6c2_return_output : unsigned(31 downto 0);

-- MUX[uxn_c_l172_c27_90c2]
signal MUX_uxn_c_l172_c27_90c2_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l172_c27_90c2_iftrue : unsigned(31 downto 0);
signal MUX_uxn_c_l172_c27_90c2_iffalse : unsigned(31 downto 0);
signal MUX_uxn_c_l172_c27_90c2_return_output : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_c_l175_c17_a2da]
signal BIN_OP_EQ_uxn_c_l175_c17_a2da_left : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l175_c17_a2da_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l175_c17_a2da_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l175_c17_0e53]
signal MUX_uxn_c_l175_c17_0e53_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l175_c17_0e53_iftrue : unsigned(1 downto 0);
signal MUX_uxn_c_l175_c17_0e53_iffalse : unsigned(1 downto 0);
signal MUX_uxn_c_l175_c17_0e53_return_output : unsigned(1 downto 0);

-- UNARY_OP_NOT_uint1_t_uxn_c_l157_l164_DUPLICATE_b1ef
signal UNARY_OP_NOT_uint1_t_uxn_c_l157_l164_DUPLICATE_b1ef_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uint1_t_uxn_c_l157_l164_DUPLICATE_b1ef_return_output : unsigned(0 downto 0);

-- BIN_OP_AND_uint1_t_uint1_t_uxn_c_l164_l157_DUPLICATE_fb4c
signal BIN_OP_AND_uint1_t_uint1_t_uxn_c_l164_l157_DUPLICATE_fb4c_left : unsigned(0 downto 0);
signal BIN_OP_AND_uint1_t_uint1_t_uxn_c_l164_l157_DUPLICATE_fb4c_right : unsigned(0 downto 0);
signal BIN_OP_AND_uint1_t_uint1_t_uxn_c_l164_l157_DUPLICATE_fb4c_return_output : unsigned(0 downto 0);

function CAST_TO_uint4_t_uint32_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(31 downto 0);
  variable return_output : unsigned(3 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,4)));
    return return_output;
end function;

function CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_6984( ref_toks_0 : unsigned;
 ref_toks_1 : unsigned) return gpu_step_result_t is
 
  variable base : gpu_step_result_t; 
  variable return_output : gpu_step_result_t;
begin
      base.color := ref_toks_0;
      base.is_active_fill := ref_toks_1;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_GT_uxn_c_l119_c26_de19
BIN_OP_GT_uxn_c_l119_c26_de19 : entity work.BIN_OP_GT_uint32_t_uint18_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_c_l119_c26_de19_left,
BIN_OP_GT_uxn_c_l119_c26_de19_right,
BIN_OP_GT_uxn_c_l119_c26_de19_return_output);

-- MUX_uxn_c_l119_c26_f9ae
MUX_uxn_c_l119_c26_f9ae : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
MUX_uxn_c_l119_c26_f9ae_cond,
MUX_uxn_c_l119_c26_f9ae_iftrue,
MUX_uxn_c_l119_c26_f9ae_iffalse,
MUX_uxn_c_l119_c26_f9ae_return_output);

-- CONST_SR_28_uxn_c_l120_c24_94b7
CONST_SR_28_uxn_c_l120_c24_94b7 : entity work.CONST_SR_28_uint32_t_0CLK_de264c78 port map (
CONST_SR_28_uxn_c_l120_c24_94b7_x,
CONST_SR_28_uxn_c_l120_c24_94b7_return_output);

-- BIN_OP_EQ_uxn_c_l121_c17_7783
BIN_OP_EQ_uxn_c_l121_c17_7783 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l121_c17_7783_left,
BIN_OP_EQ_uxn_c_l121_c17_7783_right,
BIN_OP_EQ_uxn_c_l121_c17_7783_return_output);

-- MUX_uxn_c_l121_c17_8ed4
MUX_uxn_c_l121_c17_8ed4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l121_c17_8ed4_cond,
MUX_uxn_c_l121_c17_8ed4_iftrue,
MUX_uxn_c_l121_c17_8ed4_iffalse,
MUX_uxn_c_l121_c17_8ed4_return_output);

-- BIN_OP_DIV_uxn_c_l122_c6_eacc
BIN_OP_DIV_uxn_c_l122_c6_eacc : entity work.BIN_OP_DIV_uint32_t_uint9_t_0CLK_422b4ffb port map (
BIN_OP_DIV_uxn_c_l122_c6_eacc_left,
BIN_OP_DIV_uxn_c_l122_c6_eacc_right,
BIN_OP_DIV_uxn_c_l122_c6_eacc_return_output);

-- BIN_OP_INFERRED_MULT_uxn_c_l123_c23_2fbc
BIN_OP_INFERRED_MULT_uxn_c_l123_c23_2fbc : entity work.BIN_OP_INFERRED_MULT_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_c_l123_c23_2fbc_left,
BIN_OP_INFERRED_MULT_uxn_c_l123_c23_2fbc_right,
BIN_OP_INFERRED_MULT_uxn_c_l123_c23_2fbc_return_output);

-- BIN_OP_MINUS_uxn_c_l123_c6_4590
BIN_OP_MINUS_uxn_c_l123_c6_4590 : entity work.BIN_OP_MINUS_uint32_t_uint25_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l123_c6_4590_left,
BIN_OP_MINUS_uxn_c_l123_c6_4590_right,
BIN_OP_MINUS_uxn_c_l123_c6_4590_return_output);

-- UNARY_OP_NOT_uxn_c_l126_c22_afde
UNARY_OP_NOT_uxn_c_l126_c22_afde : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l126_c22_afde_expr,
UNARY_OP_NOT_uxn_c_l126_c22_afde_return_output);

-- BIN_OP_AND_uxn_c_l126_c6_25c8
BIN_OP_AND_uxn_c_l126_c6_25c8 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l126_c6_25c8_left,
BIN_OP_AND_uxn_c_l126_c6_25c8_right,
BIN_OP_AND_uxn_c_l126_c6_25c8_return_output);

-- fill_x0_MUX_uxn_c_l126_c2_8fe6
fill_x0_MUX_uxn_c_l126_c2_8fe6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_x0_MUX_uxn_c_l126_c2_8fe6_cond,
fill_x0_MUX_uxn_c_l126_c2_8fe6_iftrue,
fill_x0_MUX_uxn_c_l126_c2_8fe6_iffalse,
fill_x0_MUX_uxn_c_l126_c2_8fe6_return_output);

-- fill_color_MUX_uxn_c_l126_c2_8fe6
fill_color_MUX_uxn_c_l126_c2_8fe6 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
fill_color_MUX_uxn_c_l126_c2_8fe6_cond,
fill_color_MUX_uxn_c_l126_c2_8fe6_iftrue,
fill_color_MUX_uxn_c_l126_c2_8fe6_iffalse,
fill_color_MUX_uxn_c_l126_c2_8fe6_return_output);

-- is_fill_top_MUX_uxn_c_l126_c2_8fe6
is_fill_top_MUX_uxn_c_l126_c2_8fe6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_top_MUX_uxn_c_l126_c2_8fe6_cond,
is_fill_top_MUX_uxn_c_l126_c2_8fe6_iftrue,
is_fill_top_MUX_uxn_c_l126_c2_8fe6_iffalse,
is_fill_top_MUX_uxn_c_l126_c2_8fe6_return_output);

-- fill_x1_MUX_uxn_c_l126_c2_8fe6
fill_x1_MUX_uxn_c_l126_c2_8fe6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_x1_MUX_uxn_c_l126_c2_8fe6_cond,
fill_x1_MUX_uxn_c_l126_c2_8fe6_iftrue,
fill_x1_MUX_uxn_c_l126_c2_8fe6_iffalse,
fill_x1_MUX_uxn_c_l126_c2_8fe6_return_output);

-- fill_y1_MUX_uxn_c_l126_c2_8fe6
fill_y1_MUX_uxn_c_l126_c2_8fe6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_y1_MUX_uxn_c_l126_c2_8fe6_cond,
fill_y1_MUX_uxn_c_l126_c2_8fe6_iftrue,
fill_y1_MUX_uxn_c_l126_c2_8fe6_iffalse,
fill_y1_MUX_uxn_c_l126_c2_8fe6_return_output);

-- is_fill_left_MUX_uxn_c_l126_c2_8fe6
is_fill_left_MUX_uxn_c_l126_c2_8fe6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_left_MUX_uxn_c_l126_c2_8fe6_cond,
is_fill_left_MUX_uxn_c_l126_c2_8fe6_iftrue,
is_fill_left_MUX_uxn_c_l126_c2_8fe6_iffalse,
is_fill_left_MUX_uxn_c_l126_c2_8fe6_return_output);

-- fill_y0_MUX_uxn_c_l126_c2_8fe6
fill_y0_MUX_uxn_c_l126_c2_8fe6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_y0_MUX_uxn_c_l126_c2_8fe6_cond,
fill_y0_MUX_uxn_c_l126_c2_8fe6_iftrue,
fill_y0_MUX_uxn_c_l126_c2_8fe6_iffalse,
fill_y0_MUX_uxn_c_l126_c2_8fe6_return_output);

-- fill_pixels_remaining_MUX_uxn_c_l126_c2_8fe6
fill_pixels_remaining_MUX_uxn_c_l126_c2_8fe6 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
fill_pixels_remaining_MUX_uxn_c_l126_c2_8fe6_cond,
fill_pixels_remaining_MUX_uxn_c_l126_c2_8fe6_iftrue,
fill_pixels_remaining_MUX_uxn_c_l126_c2_8fe6_iffalse,
fill_pixels_remaining_MUX_uxn_c_l126_c2_8fe6_return_output);

-- fill_layer_MUX_uxn_c_l126_c2_8fe6
fill_layer_MUX_uxn_c_l126_c2_8fe6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
fill_layer_MUX_uxn_c_l126_c2_8fe6_cond,
fill_layer_MUX_uxn_c_l126_c2_8fe6_iftrue,
fill_layer_MUX_uxn_c_l126_c2_8fe6_iffalse,
fill_layer_MUX_uxn_c_l126_c2_8fe6_return_output);

-- CONST_SR_20_uxn_c_l128_c18_b15c
CONST_SR_20_uxn_c_l128_c18_b15c : entity work.CONST_SR_20_uint32_t_0CLK_de264c78 port map (
CONST_SR_20_uxn_c_l128_c18_b15c_x,
CONST_SR_20_uxn_c_l128_c18_b15c_return_output);

-- CONST_SR_21_uxn_c_l129_c17_ecf7
CONST_SR_21_uxn_c_l129_c17_ecf7 : entity work.CONST_SR_21_uint32_t_0CLK_de264c78 port map (
CONST_SR_21_uxn_c_l129_c17_ecf7_x,
CONST_SR_21_uxn_c_l129_c17_ecf7_return_output);

-- BIN_OP_AND_uxn_c_l130_c27_5860
BIN_OP_AND_uxn_c_l130_c27_5860 : entity work.BIN_OP_AND_uint32_t_uint18_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l130_c27_5860_left,
BIN_OP_AND_uxn_c_l130_c27_5860_right,
BIN_OP_AND_uxn_c_l130_c27_5860_return_output);

-- BIN_OP_DIV_uxn_c_l131_c13_0eaa
BIN_OP_DIV_uxn_c_l131_c13_0eaa : entity work.BIN_OP_DIV_uint32_t_uint9_t_0CLK_422b4ffb port map (
BIN_OP_DIV_uxn_c_l131_c13_0eaa_left,
BIN_OP_DIV_uxn_c_l131_c13_0eaa_right,
BIN_OP_DIV_uxn_c_l131_c13_0eaa_return_output);

-- BIN_OP_INFERRED_MULT_uxn_c_l132_c38_1f7a
BIN_OP_INFERRED_MULT_uxn_c_l132_c38_1f7a : entity work.BIN_OP_INFERRED_MULT_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_c_l132_c38_1f7a_left,
BIN_OP_INFERRED_MULT_uxn_c_l132_c38_1f7a_right,
BIN_OP_INFERRED_MULT_uxn_c_l132_c38_1f7a_return_output);

-- BIN_OP_MINUS_uxn_c_l132_c13_55c6
BIN_OP_MINUS_uxn_c_l132_c13_55c6 : entity work.BIN_OP_MINUS_uint32_t_uint25_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l132_c13_55c6_left,
BIN_OP_MINUS_uxn_c_l132_c13_55c6_right,
BIN_OP_MINUS_uxn_c_l132_c13_55c6_return_output);

-- MUX_uxn_c_l133_c13_f7ea
MUX_uxn_c_l133_c13_f7ea : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l133_c13_f7ea_cond,
MUX_uxn_c_l133_c13_f7ea_iftrue,
MUX_uxn_c_l133_c13_f7ea_iffalse,
MUX_uxn_c_l133_c13_f7ea_return_output);

-- MUX_uxn_c_l134_c13_902c
MUX_uxn_c_l134_c13_902c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l134_c13_902c_cond,
MUX_uxn_c_l134_c13_902c_iftrue,
MUX_uxn_c_l134_c13_902c_iffalse,
MUX_uxn_c_l134_c13_902c_return_output);

-- MUX_uxn_c_l135_c13_fa57
MUX_uxn_c_l135_c13_fa57 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l135_c13_fa57_cond,
MUX_uxn_c_l135_c13_fa57_iftrue,
MUX_uxn_c_l135_c13_fa57_iffalse,
MUX_uxn_c_l135_c13_fa57_return_output);

-- MUX_uxn_c_l136_c13_e4f6
MUX_uxn_c_l136_c13_e4f6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l136_c13_e4f6_cond,
MUX_uxn_c_l136_c13_e4f6_iftrue,
MUX_uxn_c_l136_c13_e4f6_iffalse,
MUX_uxn_c_l136_c13_e4f6_return_output);

-- BIN_OP_EQ_uxn_c_l142_c19_1b94
BIN_OP_EQ_uxn_c_l142_c19_1b94 : entity work.BIN_OP_EQ_uint32_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l142_c19_1b94_left,
BIN_OP_EQ_uxn_c_l142_c19_1b94_right,
BIN_OP_EQ_uxn_c_l142_c19_1b94_return_output);

-- MUX_uxn_c_l142_c19_1c39
MUX_uxn_c_l142_c19_1c39 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l142_c19_1c39_cond,
MUX_uxn_c_l142_c19_1c39_iftrue,
MUX_uxn_c_l142_c19_1c39_iffalse,
MUX_uxn_c_l142_c19_1c39_return_output);

-- BIN_OP_GT_uxn_c_l144_c17_eb96
BIN_OP_GT_uxn_c_l144_c17_eb96 : entity work.BIN_OP_GT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_c_l144_c17_eb96_left,
BIN_OP_GT_uxn_c_l144_c17_eb96_right,
BIN_OP_GT_uxn_c_l144_c17_eb96_return_output);

-- BIN_OP_LT_uxn_c_l145_c17_8673
BIN_OP_LT_uxn_c_l145_c17_8673 : entity work.BIN_OP_LT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_LT_uxn_c_l145_c17_8673_left,
BIN_OP_LT_uxn_c_l145_c17_8673_right,
BIN_OP_LT_uxn_c_l145_c17_8673_return_output);

-- BIN_OP_GT_uxn_c_l146_c17_f2f9
BIN_OP_GT_uxn_c_l146_c17_f2f9 : entity work.BIN_OP_GT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_c_l146_c17_f2f9_left,
BIN_OP_GT_uxn_c_l146_c17_f2f9_right,
BIN_OP_GT_uxn_c_l146_c17_f2f9_return_output);

-- BIN_OP_LT_uxn_c_l147_c17_648c
BIN_OP_LT_uxn_c_l147_c17_648c : entity work.BIN_OP_LT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_LT_uxn_c_l147_c17_648c_left,
BIN_OP_LT_uxn_c_l147_c17_648c_right,
BIN_OP_LT_uxn_c_l147_c17_648c_return_output);

-- BIN_OP_AND_uxn_c_l149_c18_2f0d
BIN_OP_AND_uxn_c_l149_c18_2f0d : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l149_c18_2f0d_left,
BIN_OP_AND_uxn_c_l149_c18_2f0d_right,
BIN_OP_AND_uxn_c_l149_c18_2f0d_return_output);

-- BIN_OP_AND_uxn_c_l149_c18_53c1
BIN_OP_AND_uxn_c_l149_c18_53c1 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l149_c18_53c1_left,
BIN_OP_AND_uxn_c_l149_c18_53c1_right,
BIN_OP_AND_uxn_c_l149_c18_53c1_return_output);

-- BIN_OP_AND_uxn_c_l149_c18_d9ee
BIN_OP_AND_uxn_c_l149_c18_d9ee : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l149_c18_d9ee_left,
BIN_OP_AND_uxn_c_l149_c18_d9ee_right,
BIN_OP_AND_uxn_c_l149_c18_d9ee_return_output);

-- BIN_OP_AND_uxn_c_l149_c18_ca70
BIN_OP_AND_uxn_c_l149_c18_ca70 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l149_c18_ca70_left,
BIN_OP_AND_uxn_c_l149_c18_ca70_right,
BIN_OP_AND_uxn_c_l149_c18_ca70_return_output);

-- UNARY_OP_NOT_uxn_c_l150_c37_ef67
UNARY_OP_NOT_uxn_c_l150_c37_ef67 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l150_c37_ef67_expr,
UNARY_OP_NOT_uxn_c_l150_c37_ef67_return_output);

-- BIN_OP_AND_uxn_c_l150_c19_88bc
BIN_OP_AND_uxn_c_l150_c19_88bc : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l150_c19_88bc_left,
BIN_OP_AND_uxn_c_l150_c19_88bc_right,
BIN_OP_AND_uxn_c_l150_c19_88bc_return_output);

-- BIN_OP_AND_uxn_c_l151_c19_6cca
BIN_OP_AND_uxn_c_l151_c19_6cca : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l151_c19_6cca_left,
BIN_OP_AND_uxn_c_l151_c19_6cca_right,
BIN_OP_AND_uxn_c_l151_c19_6cca_return_output);

-- MUX_uxn_c_l155_c37_beb5
MUX_uxn_c_l155_c37_beb5 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
MUX_uxn_c_l155_c37_beb5_cond,
MUX_uxn_c_l155_c37_beb5_iftrue,
MUX_uxn_c_l155_c37_beb5_iffalse,
MUX_uxn_c_l155_c37_beb5_return_output);

-- MUX_uxn_c_l155_c3_063f
MUX_uxn_c_l155_c3_063f : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
MUX_uxn_c_l155_c3_063f_cond,
MUX_uxn_c_l155_c3_063f_iftrue,
MUX_uxn_c_l155_c3_063f_iffalse,
MUX_uxn_c_l155_c3_063f_return_output);

-- MUX_uxn_c_l156_c3_25f1
MUX_uxn_c_l156_c3_25f1 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
MUX_uxn_c_l156_c3_25f1_cond,
MUX_uxn_c_l156_c3_25f1_iftrue,
MUX_uxn_c_l156_c3_25f1_iffalse,
MUX_uxn_c_l156_c3_25f1_return_output);

-- UNARY_OP_NOT_uxn_c_l157_c57_4dc4
UNARY_OP_NOT_uxn_c_l157_c57_4dc4 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l157_c57_4dc4_expr,
UNARY_OP_NOT_uxn_c_l157_c57_4dc4_return_output);

-- BIN_OP_AND_uxn_c_l157_c22_7ece
BIN_OP_AND_uxn_c_l157_c22_7ece : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l157_c22_7ece_left,
BIN_OP_AND_uxn_c_l157_c22_7ece_right,
BIN_OP_AND_uxn_c_l157_c22_7ece_return_output);

-- BIN_OP_OR_uxn_c_l157_c3_6600
BIN_OP_OR_uxn_c_l157_c3_6600 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l157_c3_6600_left,
BIN_OP_OR_uxn_c_l157_c3_6600_right,
BIN_OP_OR_uxn_c_l157_c3_6600_return_output);

-- bg_vram_update_uxn_c_l153_c19_75bb
bg_vram_update_uxn_c_l153_c19_75bb : entity work.bg_vram_update_0CLK_b45f1687 port map (
clk,
bg_vram_update_uxn_c_l153_c19_75bb_CLOCK_ENABLE,
bg_vram_update_uxn_c_l153_c19_75bb_read_address,
bg_vram_update_uxn_c_l153_c19_75bb_write_address,
bg_vram_update_uxn_c_l153_c19_75bb_write_value,
bg_vram_update_uxn_c_l153_c19_75bb_write_enable,
bg_vram_update_uxn_c_l153_c19_75bb_return_output);

-- MUX_uxn_c_l162_c37_1152
MUX_uxn_c_l162_c37_1152 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
MUX_uxn_c_l162_c37_1152_cond,
MUX_uxn_c_l162_c37_1152_iftrue,
MUX_uxn_c_l162_c37_1152_iffalse,
MUX_uxn_c_l162_c37_1152_return_output);

-- MUX_uxn_c_l162_c3_e46d
MUX_uxn_c_l162_c3_e46d : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
MUX_uxn_c_l162_c3_e46d_cond,
MUX_uxn_c_l162_c3_e46d_iftrue,
MUX_uxn_c_l162_c3_e46d_iffalse,
MUX_uxn_c_l162_c3_e46d_return_output);

-- MUX_uxn_c_l163_c3_3fd8
MUX_uxn_c_l163_c3_3fd8 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
MUX_uxn_c_l163_c3_3fd8_cond,
MUX_uxn_c_l163_c3_3fd8_iftrue,
MUX_uxn_c_l163_c3_3fd8_iffalse,
MUX_uxn_c_l163_c3_3fd8_return_output);

-- BIN_OP_AND_uxn_c_l164_c22_a524
BIN_OP_AND_uxn_c_l164_c22_a524 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l164_c22_a524_left,
BIN_OP_AND_uxn_c_l164_c22_a524_right,
BIN_OP_AND_uxn_c_l164_c22_a524_return_output);

-- BIN_OP_OR_uxn_c_l164_c3_c1cb
BIN_OP_OR_uxn_c_l164_c3_c1cb : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l164_c3_c1cb_left,
BIN_OP_OR_uxn_c_l164_c3_c1cb_right,
BIN_OP_OR_uxn_c_l164_c3_c1cb_return_output);

-- fg_vram_update_uxn_c_l160_c19_97d2
fg_vram_update_uxn_c_l160_c19_97d2 : entity work.fg_vram_update_0CLK_b45f1687 port map (
clk,
fg_vram_update_uxn_c_l160_c19_97d2_CLOCK_ENABLE,
fg_vram_update_uxn_c_l160_c19_97d2_read_address,
fg_vram_update_uxn_c_l160_c19_97d2_write_address,
fg_vram_update_uxn_c_l160_c19_97d2_write_value,
fg_vram_update_uxn_c_l160_c19_97d2_write_enable,
fg_vram_update_uxn_c_l160_c19_97d2_return_output);

-- BIN_OP_EQ_uxn_c_l168_c6_9331
BIN_OP_EQ_uxn_c_l168_c6_9331 : entity work.BIN_OP_EQ_uint32_t_uint18_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l168_c6_9331_left,
BIN_OP_EQ_uxn_c_l168_c6_9331_right,
BIN_OP_EQ_uxn_c_l168_c6_9331_return_output);

-- pixel_counter_MUX_uxn_c_l168_c2_7916
pixel_counter_MUX_uxn_c_l168_c2_7916 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
pixel_counter_MUX_uxn_c_l168_c2_7916_cond,
pixel_counter_MUX_uxn_c_l168_c2_7916_iftrue,
pixel_counter_MUX_uxn_c_l168_c2_7916_iffalse,
pixel_counter_MUX_uxn_c_l168_c2_7916_return_output);

-- fill_pixels_remaining_MUX_uxn_c_l168_c2_7916
fill_pixels_remaining_MUX_uxn_c_l168_c2_7916 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
fill_pixels_remaining_MUX_uxn_c_l168_c2_7916_cond,
fill_pixels_remaining_MUX_uxn_c_l168_c2_7916_iftrue,
fill_pixels_remaining_MUX_uxn_c_l168_c2_7916_iffalse,
fill_pixels_remaining_MUX_uxn_c_l168_c2_7916_return_output);

-- pixel_counter_MUX_uxn_c_l170_c9_5f1d
pixel_counter_MUX_uxn_c_l170_c9_5f1d : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
pixel_counter_MUX_uxn_c_l170_c9_5f1d_cond,
pixel_counter_MUX_uxn_c_l170_c9_5f1d_iftrue,
pixel_counter_MUX_uxn_c_l170_c9_5f1d_iffalse,
pixel_counter_MUX_uxn_c_l170_c9_5f1d_return_output);

-- fill_pixels_remaining_MUX_uxn_c_l170_c9_5f1d
fill_pixels_remaining_MUX_uxn_c_l170_c9_5f1d : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
fill_pixels_remaining_MUX_uxn_c_l170_c9_5f1d_cond,
fill_pixels_remaining_MUX_uxn_c_l170_c9_5f1d_iftrue,
fill_pixels_remaining_MUX_uxn_c_l170_c9_5f1d_iffalse,
fill_pixels_remaining_MUX_uxn_c_l170_c9_5f1d_return_output);

-- BIN_OP_PLUS_uxn_c_l171_c3_5c3a
BIN_OP_PLUS_uxn_c_l171_c3_5c3a : entity work.BIN_OP_PLUS_uint32_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l171_c3_5c3a_left,
BIN_OP_PLUS_uxn_c_l171_c3_5c3a_right,
BIN_OP_PLUS_uxn_c_l171_c3_5c3a_return_output);

-- BIN_OP_EQ_uxn_c_l172_c27_0a47
BIN_OP_EQ_uxn_c_l172_c27_0a47 : entity work.BIN_OP_EQ_uint32_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l172_c27_0a47_left,
BIN_OP_EQ_uxn_c_l172_c27_0a47_right,
BIN_OP_EQ_uxn_c_l172_c27_0a47_return_output);

-- BIN_OP_MINUS_uxn_c_l172_c60_b6c2
BIN_OP_MINUS_uxn_c_l172_c60_b6c2 : entity work.BIN_OP_MINUS_uint32_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l172_c60_b6c2_left,
BIN_OP_MINUS_uxn_c_l172_c60_b6c2_right,
BIN_OP_MINUS_uxn_c_l172_c60_b6c2_return_output);

-- MUX_uxn_c_l172_c27_90c2
MUX_uxn_c_l172_c27_90c2 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
MUX_uxn_c_l172_c27_90c2_cond,
MUX_uxn_c_l172_c27_90c2_iftrue,
MUX_uxn_c_l172_c27_90c2_iffalse,
MUX_uxn_c_l172_c27_90c2_return_output);

-- BIN_OP_EQ_uxn_c_l175_c17_a2da
BIN_OP_EQ_uxn_c_l175_c17_a2da : entity work.BIN_OP_EQ_uint2_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l175_c17_a2da_left,
BIN_OP_EQ_uxn_c_l175_c17_a2da_right,
BIN_OP_EQ_uxn_c_l175_c17_a2da_return_output);

-- MUX_uxn_c_l175_c17_0e53
MUX_uxn_c_l175_c17_0e53 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
MUX_uxn_c_l175_c17_0e53_cond,
MUX_uxn_c_l175_c17_0e53_iftrue,
MUX_uxn_c_l175_c17_0e53_iffalse,
MUX_uxn_c_l175_c17_0e53_return_output);

-- UNARY_OP_NOT_uint1_t_uxn_c_l157_l164_DUPLICATE_b1ef
UNARY_OP_NOT_uint1_t_uxn_c_l157_l164_DUPLICATE_b1ef : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uint1_t_uxn_c_l157_l164_DUPLICATE_b1ef_expr,
UNARY_OP_NOT_uint1_t_uxn_c_l157_l164_DUPLICATE_b1ef_return_output);

-- BIN_OP_AND_uint1_t_uint1_t_uxn_c_l164_l157_DUPLICATE_fb4c
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l164_l157_DUPLICATE_fb4c : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l164_l157_DUPLICATE_fb4c_left,
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l164_l157_DUPLICATE_fb4c_right,
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l164_l157_DUPLICATE_fb4c_return_output);



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
 BIN_OP_GT_uxn_c_l119_c26_de19_return_output,
 MUX_uxn_c_l119_c26_f9ae_return_output,
 CONST_SR_28_uxn_c_l120_c24_94b7_return_output,
 BIN_OP_EQ_uxn_c_l121_c17_7783_return_output,
 MUX_uxn_c_l121_c17_8ed4_return_output,
 BIN_OP_DIV_uxn_c_l122_c6_eacc_return_output,
 BIN_OP_INFERRED_MULT_uxn_c_l123_c23_2fbc_return_output,
 BIN_OP_MINUS_uxn_c_l123_c6_4590_return_output,
 UNARY_OP_NOT_uxn_c_l126_c22_afde_return_output,
 BIN_OP_AND_uxn_c_l126_c6_25c8_return_output,
 fill_x0_MUX_uxn_c_l126_c2_8fe6_return_output,
 fill_color_MUX_uxn_c_l126_c2_8fe6_return_output,
 is_fill_top_MUX_uxn_c_l126_c2_8fe6_return_output,
 fill_x1_MUX_uxn_c_l126_c2_8fe6_return_output,
 fill_y1_MUX_uxn_c_l126_c2_8fe6_return_output,
 is_fill_left_MUX_uxn_c_l126_c2_8fe6_return_output,
 fill_y0_MUX_uxn_c_l126_c2_8fe6_return_output,
 fill_pixels_remaining_MUX_uxn_c_l126_c2_8fe6_return_output,
 fill_layer_MUX_uxn_c_l126_c2_8fe6_return_output,
 CONST_SR_20_uxn_c_l128_c18_b15c_return_output,
 CONST_SR_21_uxn_c_l129_c17_ecf7_return_output,
 BIN_OP_AND_uxn_c_l130_c27_5860_return_output,
 BIN_OP_DIV_uxn_c_l131_c13_0eaa_return_output,
 BIN_OP_INFERRED_MULT_uxn_c_l132_c38_1f7a_return_output,
 BIN_OP_MINUS_uxn_c_l132_c13_55c6_return_output,
 MUX_uxn_c_l133_c13_f7ea_return_output,
 MUX_uxn_c_l134_c13_902c_return_output,
 MUX_uxn_c_l135_c13_fa57_return_output,
 MUX_uxn_c_l136_c13_e4f6_return_output,
 BIN_OP_EQ_uxn_c_l142_c19_1b94_return_output,
 MUX_uxn_c_l142_c19_1c39_return_output,
 BIN_OP_GT_uxn_c_l144_c17_eb96_return_output,
 BIN_OP_LT_uxn_c_l145_c17_8673_return_output,
 BIN_OP_GT_uxn_c_l146_c17_f2f9_return_output,
 BIN_OP_LT_uxn_c_l147_c17_648c_return_output,
 BIN_OP_AND_uxn_c_l149_c18_2f0d_return_output,
 BIN_OP_AND_uxn_c_l149_c18_53c1_return_output,
 BIN_OP_AND_uxn_c_l149_c18_d9ee_return_output,
 BIN_OP_AND_uxn_c_l149_c18_ca70_return_output,
 UNARY_OP_NOT_uxn_c_l150_c37_ef67_return_output,
 BIN_OP_AND_uxn_c_l150_c19_88bc_return_output,
 BIN_OP_AND_uxn_c_l151_c19_6cca_return_output,
 MUX_uxn_c_l155_c37_beb5_return_output,
 MUX_uxn_c_l155_c3_063f_return_output,
 MUX_uxn_c_l156_c3_25f1_return_output,
 UNARY_OP_NOT_uxn_c_l157_c57_4dc4_return_output,
 BIN_OP_AND_uxn_c_l157_c22_7ece_return_output,
 BIN_OP_OR_uxn_c_l157_c3_6600_return_output,
 bg_vram_update_uxn_c_l153_c19_75bb_return_output,
 MUX_uxn_c_l162_c37_1152_return_output,
 MUX_uxn_c_l162_c3_e46d_return_output,
 MUX_uxn_c_l163_c3_3fd8_return_output,
 BIN_OP_AND_uxn_c_l164_c22_a524_return_output,
 BIN_OP_OR_uxn_c_l164_c3_c1cb_return_output,
 fg_vram_update_uxn_c_l160_c19_97d2_return_output,
 BIN_OP_EQ_uxn_c_l168_c6_9331_return_output,
 pixel_counter_MUX_uxn_c_l168_c2_7916_return_output,
 fill_pixels_remaining_MUX_uxn_c_l168_c2_7916_return_output,
 pixel_counter_MUX_uxn_c_l170_c9_5f1d_return_output,
 fill_pixels_remaining_MUX_uxn_c_l170_c9_5f1d_return_output,
 BIN_OP_PLUS_uxn_c_l171_c3_5c3a_return_output,
 BIN_OP_EQ_uxn_c_l172_c27_0a47_return_output,
 BIN_OP_MINUS_uxn_c_l172_c60_b6c2_return_output,
 MUX_uxn_c_l172_c27_90c2_return_output,
 BIN_OP_EQ_uxn_c_l175_c17_a2da_return_output,
 MUX_uxn_c_l175_c17_0e53_return_output,
 UNARY_OP_NOT_uint1_t_uxn_c_l157_l164_DUPLICATE_b1ef_return_output,
 BIN_OP_AND_uint1_t_uint1_t_uxn_c_l164_l157_DUPLICATE_fb4c_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : gpu_step_result_t;
 variable VAR_is_active_drawing_area : unsigned(0 downto 0);
 variable VAR_is_vram_write : unsigned(0 downto 0);
 variable VAR_vram_write_layer : unsigned(0 downto 0);
 variable VAR_vram_address : unsigned(31 downto 0);
 variable VAR_vram_value : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l119_c26_f9ae_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l119_c26_f9ae_iftrue : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l119_c26_f9ae_iffalse : unsigned(31 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l119_c26_de19_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l119_c26_de19_right : unsigned(17 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l119_c26_de19_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l119_c26_f9ae_return_output : unsigned(31 downto 0);
 variable VAR_CONST_SR_28_uxn_c_l120_c24_94b7_return_output : unsigned(31 downto 0);
 variable VAR_CONST_SR_28_uxn_c_l120_c24_94b7_x : unsigned(31 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_c_l120_c14_19d7_return_output : unsigned(3 downto 0);
 variable VAR_MUX_uxn_c_l121_c17_8ed4_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l121_c17_8ed4_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l121_c17_8ed4_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l121_c17_7783_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l121_c17_7783_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l121_c17_7783_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l121_c17_8ed4_return_output : unsigned(0 downto 0);
 variable VAR_y_uxn_c_l122_c2_b0c6 : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_c_l122_c6_eacc_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_DIV_uxn_c_l122_c6_eacc_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_DIV_uxn_c_l122_c6_eacc_return_output : unsigned(31 downto 0);
 variable VAR_x_uxn_c_l123_c2_0ebb : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l123_c6_4590_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l123_c23_2fbc_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l123_c23_2fbc_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l123_c23_2fbc_return_output : unsigned(24 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l123_c6_4590_right : unsigned(24 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l123_c6_4590_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l126_c6_25c8_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l126_c22_afde_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l126_c22_afde_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l126_c6_25c8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l126_c6_25c8_return_output : unsigned(0 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l126_c2_8fe6_iftrue : unsigned(15 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l126_c2_8fe6_iffalse : unsigned(15 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l126_c2_8fe6_return_output : unsigned(15 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l126_c2_8fe6_cond : unsigned(0 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l126_c2_8fe6_iftrue : unsigned(1 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l126_c2_8fe6_iffalse : unsigned(1 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l126_c2_8fe6_return_output : unsigned(1 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l126_c2_8fe6_cond : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l126_c2_8fe6_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_top_uxn_c_l129_c3_0c0b : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l126_c2_8fe6_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l126_c2_8fe6_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l126_c2_8fe6_cond : unsigned(0 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l126_c2_8fe6_iftrue : unsigned(15 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l126_c2_8fe6_iffalse : unsigned(15 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l126_c2_8fe6_return_output : unsigned(15 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l126_c2_8fe6_cond : unsigned(0 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l126_c2_8fe6_iftrue : unsigned(15 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l126_c2_8fe6_iffalse : unsigned(15 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l126_c2_8fe6_return_output : unsigned(15 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l126_c2_8fe6_cond : unsigned(0 downto 0);
 variable VAR_is_fill_left_MUX_uxn_c_l126_c2_8fe6_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_left_uxn_c_l128_c3_c3fd : unsigned(0 downto 0);
 variable VAR_is_fill_left_MUX_uxn_c_l126_c2_8fe6_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_left_MUX_uxn_c_l126_c2_8fe6_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_left_MUX_uxn_c_l126_c2_8fe6_cond : unsigned(0 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l126_c2_8fe6_iftrue : unsigned(15 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l126_c2_8fe6_iffalse : unsigned(15 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l126_c2_8fe6_return_output : unsigned(15 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l126_c2_8fe6_cond : unsigned(0 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l126_c2_8fe6_iftrue : unsigned(31 downto 0);
 variable VAR_fill_pixels_remaining_uxn_c_l139_c3_031a : unsigned(31 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l126_c2_8fe6_iffalse : unsigned(31 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l126_c2_8fe6_return_output : unsigned(31 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l126_c2_8fe6_cond : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l126_c2_8fe6_iftrue : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l126_c2_8fe6_iffalse : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l126_c2_8fe6_return_output : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l126_c2_8fe6_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_20_uxn_c_l128_c18_b15c_return_output : unsigned(31 downto 0);
 variable VAR_CONST_SR_20_uxn_c_l128_c18_b15c_x : unsigned(31 downto 0);
 variable VAR_CONST_SR_21_uxn_c_l129_c17_ecf7_return_output : unsigned(31 downto 0);
 variable VAR_CONST_SR_21_uxn_c_l129_c17_ecf7_x : unsigned(31 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l130_c27_5860_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l130_c27_5860_right : unsigned(17 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l130_c27_5860_return_output : unsigned(31 downto 0);
 variable VAR_fill_y0_uxn_c_l131_c3_aa31 : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_c_l131_c13_0eaa_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_DIV_uxn_c_l131_c13_0eaa_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_DIV_uxn_c_l131_c13_0eaa_return_output : unsigned(31 downto 0);
 variable VAR_fill_x0_uxn_c_l132_c3_eb6d : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l132_c13_55c6_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l132_c38_1f7a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l132_c38_1f7a_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l132_c38_1f7a_return_output : unsigned(24 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l132_c13_55c6_right : unsigned(24 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l132_c13_55c6_return_output : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l133_c13_f7ea_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l133_c13_f7ea_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l133_c13_f7ea_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l133_c13_f7ea_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l134_c13_902c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l134_c13_902c_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l134_c13_902c_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l134_c13_902c_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l135_c13_fa57_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l135_c13_fa57_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l135_c13_fa57_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l135_c13_fa57_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l136_c13_e4f6_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l136_c13_e4f6_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l136_c13_e4f6_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l136_c13_e4f6_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l142_c19_1c39_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l142_c19_1c39_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l142_c19_1c39_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l142_c19_1b94_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l142_c19_1b94_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l142_c19_1b94_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l142_c19_1c39_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l144_c17_eb96_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l144_c17_eb96_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l144_c17_eb96_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_LT_uxn_c_l145_c17_8673_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_c_l145_c17_8673_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_c_l145_c17_8673_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l146_c17_f2f9_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l146_c17_f2f9_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l146_c17_f2f9_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_LT_uxn_c_l147_c17_648c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_c_l147_c17_648c_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_c_l147_c17_648c_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l149_c18_2f0d_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l149_c18_2f0d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l149_c18_2f0d_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l149_c18_53c1_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l149_c18_53c1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l149_c18_53c1_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l149_c18_d9ee_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l149_c18_d9ee_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l149_c18_d9ee_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l149_c18_ca70_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l149_c18_ca70_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l149_c18_ca70_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l150_c19_88bc_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l150_c37_ef67_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l150_c37_ef67_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l150_c19_88bc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l150_c19_88bc_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l151_c19_6cca_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l151_c19_6cca_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l151_c19_6cca_return_output : unsigned(0 downto 0);
 variable VAR_bg_vram_update_uxn_c_l153_c19_75bb_read_address : unsigned(31 downto 0);
 variable VAR_bg_vram_update_uxn_c_l153_c19_75bb_write_address : unsigned(31 downto 0);
 variable VAR_bg_vram_update_uxn_c_l153_c19_75bb_write_value : unsigned(1 downto 0);
 variable VAR_bg_vram_update_uxn_c_l153_c19_75bb_write_enable : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l155_c3_063f_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l155_c3_063f_iftrue : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l155_c3_063f_iffalse : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l155_c37_beb5_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l155_c37_beb5_iftrue : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l155_c37_beb5_iffalse : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l155_c37_beb5_return_output : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l155_c3_063f_return_output : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l156_c3_25f1_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l156_c3_25f1_iftrue : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l156_c3_25f1_iffalse : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l156_c3_25f1_return_output : unsigned(1 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l157_c3_6600_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l157_c22_7ece_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l157_c57_4dc4_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l157_c57_4dc4_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l157_c22_7ece_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l157_c22_7ece_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l157_c3_6600_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l157_c3_6600_return_output : unsigned(0 downto 0);
 variable VAR_bg_vram_update_uxn_c_l153_c19_75bb_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_bg_vram_update_uxn_c_l153_c19_75bb_return_output : unsigned(1 downto 0);
 variable VAR_fg_vram_update_uxn_c_l160_c19_97d2_read_address : unsigned(31 downto 0);
 variable VAR_fg_vram_update_uxn_c_l160_c19_97d2_write_address : unsigned(31 downto 0);
 variable VAR_fg_vram_update_uxn_c_l160_c19_97d2_write_value : unsigned(1 downto 0);
 variable VAR_fg_vram_update_uxn_c_l160_c19_97d2_write_enable : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l162_c3_e46d_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l162_c3_e46d_iftrue : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l162_c3_e46d_iffalse : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l162_c37_1152_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l162_c37_1152_iftrue : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l162_c37_1152_iffalse : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l162_c37_1152_return_output : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l162_c3_e46d_return_output : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l163_c3_3fd8_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l163_c3_3fd8_iftrue : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l163_c3_3fd8_iffalse : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l163_c3_3fd8_return_output : unsigned(1 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l164_c3_c1cb_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l164_c22_a524_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l164_c22_a524_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l164_c22_a524_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l164_c3_c1cb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l164_c3_c1cb_return_output : unsigned(0 downto 0);
 variable VAR_fg_vram_update_uxn_c_l160_c19_97d2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_fg_vram_update_uxn_c_l160_c19_97d2_return_output : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l168_c6_9331_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l168_c6_9331_right : unsigned(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l168_c6_9331_return_output : unsigned(0 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l168_c2_7916_iftrue : unsigned(31 downto 0);
 variable VAR_pixel_counter_uxn_c_l169_c3_d82d : unsigned(31 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l168_c2_7916_iffalse : unsigned(31 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l170_c9_5f1d_return_output : unsigned(31 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l168_c2_7916_return_output : unsigned(31 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l168_c2_7916_cond : unsigned(0 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l168_c2_7916_iftrue : unsigned(31 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l168_c2_7916_iffalse : unsigned(31 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l170_c9_5f1d_return_output : unsigned(31 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l168_c2_7916_return_output : unsigned(31 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l168_c2_7916_cond : unsigned(0 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l170_c9_5f1d_iftrue : unsigned(31 downto 0);
 variable VAR_pixel_counter_uxn_c_l171_c3_47ae : unsigned(31 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l170_c9_5f1d_iffalse : unsigned(31 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l170_c9_5f1d_cond : unsigned(0 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l170_c9_5f1d_iftrue : unsigned(31 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l170_c9_5f1d_iffalse : unsigned(31 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l170_c9_5f1d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l171_c3_5c3a_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l171_c3_5c3a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l171_c3_5c3a_return_output : unsigned(32 downto 0);
 variable VAR_MUX_uxn_c_l172_c27_90c2_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l172_c27_90c2_iftrue : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l172_c27_90c2_iffalse : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l172_c27_0a47_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l172_c27_0a47_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l172_c27_0a47_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l172_c60_b6c2_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l172_c60_b6c2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l172_c60_b6c2_return_output : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l172_c27_90c2_return_output : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l175_c17_0e53_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l175_c17_0e53_iftrue : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l175_c17_0e53_iffalse : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l175_c17_a2da_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l175_c17_a2da_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l175_c17_a2da_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l175_c17_0e53_return_output : unsigned(1 downto 0);
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_c_l157_l164_DUPLICATE_b1ef_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_c_l157_l164_DUPLICATE_b1ef_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l164_l157_DUPLICATE_fb4c_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l164_l157_DUPLICATE_fb4c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l164_l157_DUPLICATE_fb4c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_6984_uxn_c_l104_l178_DUPLICATE_ff85_return_output : gpu_step_result_t;
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
     VAR_MUX_uxn_c_l121_c17_8ed4_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l175_c17_a2da_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l121_c17_7783_right := to_unsigned(15, 4);
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l123_c23_2fbc_right := to_unsigned(400, 9);
     VAR_MUX_uxn_c_l121_c17_8ed4_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_DIV_uxn_c_l131_c13_0eaa_right := to_unsigned(400, 9);
     VAR_MUX_uxn_c_l135_c13_fa57_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_BIN_OP_EQ_uxn_c_l172_c27_0a47_right := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l119_c26_f9ae_iftrue := resize(to_unsigned(0, 1), 32);
     VAR_BIN_OP_EQ_uxn_c_l142_c19_1b94_right := to_unsigned(0, 1);
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l132_c38_1f7a_right := to_unsigned(400, 9);
     VAR_fill_pixels_remaining_uxn_c_l139_c3_031a := resize(to_unsigned(143999, 18), 32);
     VAR_fill_pixels_remaining_MUX_uxn_c_l126_c2_8fe6_iftrue := VAR_fill_pixels_remaining_uxn_c_l139_c3_031a;
     VAR_MUX_uxn_c_l142_c19_1c39_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_MINUS_uxn_c_l172_c60_b6c2_right := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l134_c13_902c_iffalse := resize(to_unsigned(399, 9), 16);
     VAR_BIN_OP_PLUS_uxn_c_l171_c3_5c3a_right := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_c_l119_c26_de19_right := to_unsigned(143999, 18);
     VAR_MUX_uxn_c_l172_c27_90c2_iftrue := resize(to_unsigned(0, 1), 32);
     VAR_BIN_OP_DIV_uxn_c_l122_c6_eacc_right := to_unsigned(400, 9);
     VAR_BIN_OP_AND_uxn_c_l130_c27_5860_right := to_unsigned(262143, 18);
     VAR_MUX_uxn_c_l136_c13_e4f6_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_MUX_uxn_c_l142_c19_1c39_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l168_c6_9331_right := to_unsigned(143999, 18);
     VAR_MUX_uxn_c_l155_c37_beb5_iftrue := resize(to_unsigned(0, 1), 32);
     VAR_pixel_counter_uxn_c_l169_c3_d82d := resize(to_unsigned(0, 1), 32);
     VAR_pixel_counter_MUX_uxn_c_l168_c2_7916_iftrue := VAR_pixel_counter_uxn_c_l169_c3_d82d;
     VAR_MUX_uxn_c_l162_c37_1152_iftrue := resize(to_unsigned(0, 1), 32);
     VAR_MUX_uxn_c_l133_c13_f7ea_iffalse := resize(to_unsigned(359, 9), 16);

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
     VAR_bg_vram_update_uxn_c_l153_c19_75bb_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_fg_vram_update_uxn_c_l160_c19_97d2_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_fill_color_MUX_uxn_c_l126_c2_8fe6_iffalse := fill_color;
     VAR_fill_layer_MUX_uxn_c_l126_c2_8fe6_iffalse := fill_layer;
     VAR_fill_pixels_remaining_MUX_uxn_c_l126_c2_8fe6_iffalse := fill_pixels_remaining;
     VAR_fill_x0_MUX_uxn_c_l126_c2_8fe6_iffalse := fill_x0;
     VAR_fill_x1_MUX_uxn_c_l126_c2_8fe6_iffalse := fill_x1;
     VAR_fill_y0_MUX_uxn_c_l126_c2_8fe6_iffalse := fill_y0;
     VAR_fill_y1_MUX_uxn_c_l126_c2_8fe6_iffalse := fill_y1;
     VAR_fill_pixels_remaining_MUX_uxn_c_l170_c9_5f1d_cond := VAR_is_active_drawing_area;
     VAR_pixel_counter_MUX_uxn_c_l170_c9_5f1d_cond := VAR_is_active_drawing_area;
     VAR_UNARY_OP_NOT_uxn_c_l126_c22_afde_expr := is_fill_active;
     VAR_is_fill_left_MUX_uxn_c_l126_c2_8fe6_iffalse := is_fill_left;
     VAR_is_fill_top_MUX_uxn_c_l126_c2_8fe6_iffalse := is_fill_top;
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l164_l157_DUPLICATE_fb4c_right := VAR_is_vram_write;
     VAR_BIN_OP_DIV_uxn_c_l122_c6_eacc_left := pixel_counter;
     VAR_BIN_OP_EQ_uxn_c_l168_c6_9331_left := pixel_counter;
     VAR_BIN_OP_MINUS_uxn_c_l123_c6_4590_left := pixel_counter;
     VAR_BIN_OP_PLUS_uxn_c_l171_c3_5c3a_left := pixel_counter;
     VAR_MUX_uxn_c_l155_c3_063f_iftrue := pixel_counter;
     VAR_MUX_uxn_c_l162_c3_e46d_iftrue := pixel_counter;
     VAR_bg_vram_update_uxn_c_l153_c19_75bb_read_address := pixel_counter;
     VAR_fg_vram_update_uxn_c_l160_c19_97d2_read_address := pixel_counter;
     VAR_pixel_counter_MUX_uxn_c_l170_c9_5f1d_iffalse := pixel_counter;
     VAR_BIN_OP_AND_uxn_c_l130_c27_5860_left := VAR_vram_address;
     VAR_BIN_OP_GT_uxn_c_l119_c26_de19_left := VAR_vram_address;
     VAR_CONST_SR_20_uxn_c_l128_c18_b15c_x := VAR_vram_address;
     VAR_CONST_SR_21_uxn_c_l129_c17_ecf7_x := VAR_vram_address;
     VAR_CONST_SR_28_uxn_c_l120_c24_94b7_x := VAR_vram_address;
     VAR_MUX_uxn_c_l119_c26_f9ae_iffalse := VAR_vram_address;
     VAR_MUX_uxn_c_l156_c3_25f1_iffalse := VAR_vram_value;
     VAR_MUX_uxn_c_l163_c3_3fd8_iffalse := VAR_vram_value;
     VAR_fill_color_MUX_uxn_c_l126_c2_8fe6_iftrue := VAR_vram_value;
     VAR_BIN_OP_AND_uxn_c_l164_c22_a524_right := VAR_vram_write_layer;
     VAR_UNARY_OP_NOT_uxn_c_l157_c57_4dc4_expr := VAR_vram_write_layer;
     VAR_fill_layer_MUX_uxn_c_l126_c2_8fe6_iftrue := VAR_vram_write_layer;
     -- BIN_OP_EQ[uxn_c_l168_c6_9331] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l168_c6_9331_left <= VAR_BIN_OP_EQ_uxn_c_l168_c6_9331_left;
     BIN_OP_EQ_uxn_c_l168_c6_9331_right <= VAR_BIN_OP_EQ_uxn_c_l168_c6_9331_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l168_c6_9331_return_output := BIN_OP_EQ_uxn_c_l168_c6_9331_return_output;

     -- UNARY_OP_NOT[uxn_c_l126_c22_afde] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l126_c22_afde_expr <= VAR_UNARY_OP_NOT_uxn_c_l126_c22_afde_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l126_c22_afde_return_output := UNARY_OP_NOT_uxn_c_l126_c22_afde_return_output;

     -- BIN_OP_AND[uxn_c_l130_c27_5860] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l130_c27_5860_left <= VAR_BIN_OP_AND_uxn_c_l130_c27_5860_left;
     BIN_OP_AND_uxn_c_l130_c27_5860_right <= VAR_BIN_OP_AND_uxn_c_l130_c27_5860_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l130_c27_5860_return_output := BIN_OP_AND_uxn_c_l130_c27_5860_return_output;

     -- BIN_OP_DIV[uxn_c_l122_c6_eacc] LATENCY=0
     -- Inputs
     BIN_OP_DIV_uxn_c_l122_c6_eacc_left <= VAR_BIN_OP_DIV_uxn_c_l122_c6_eacc_left;
     BIN_OP_DIV_uxn_c_l122_c6_eacc_right <= VAR_BIN_OP_DIV_uxn_c_l122_c6_eacc_right;
     -- Outputs
     VAR_BIN_OP_DIV_uxn_c_l122_c6_eacc_return_output := BIN_OP_DIV_uxn_c_l122_c6_eacc_return_output;

     -- BIN_OP_GT[uxn_c_l119_c26_de19] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_c_l119_c26_de19_left <= VAR_BIN_OP_GT_uxn_c_l119_c26_de19_left;
     BIN_OP_GT_uxn_c_l119_c26_de19_right <= VAR_BIN_OP_GT_uxn_c_l119_c26_de19_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_c_l119_c26_de19_return_output := BIN_OP_GT_uxn_c_l119_c26_de19_return_output;

     -- CONST_SR_20[uxn_c_l128_c18_b15c] LATENCY=0
     -- Inputs
     CONST_SR_20_uxn_c_l128_c18_b15c_x <= VAR_CONST_SR_20_uxn_c_l128_c18_b15c_x;
     -- Outputs
     VAR_CONST_SR_20_uxn_c_l128_c18_b15c_return_output := CONST_SR_20_uxn_c_l128_c18_b15c_return_output;

     -- CONST_SR_28[uxn_c_l120_c24_94b7] LATENCY=0
     -- Inputs
     CONST_SR_28_uxn_c_l120_c24_94b7_x <= VAR_CONST_SR_28_uxn_c_l120_c24_94b7_x;
     -- Outputs
     VAR_CONST_SR_28_uxn_c_l120_c24_94b7_return_output := CONST_SR_28_uxn_c_l120_c24_94b7_return_output;

     -- BIN_OP_PLUS[uxn_c_l171_c3_5c3a] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l171_c3_5c3a_left <= VAR_BIN_OP_PLUS_uxn_c_l171_c3_5c3a_left;
     BIN_OP_PLUS_uxn_c_l171_c3_5c3a_right <= VAR_BIN_OP_PLUS_uxn_c_l171_c3_5c3a_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l171_c3_5c3a_return_output := BIN_OP_PLUS_uxn_c_l171_c3_5c3a_return_output;

     -- CONST_SR_21[uxn_c_l129_c17_ecf7] LATENCY=0
     -- Inputs
     CONST_SR_21_uxn_c_l129_c17_ecf7_x <= VAR_CONST_SR_21_uxn_c_l129_c17_ecf7_x;
     -- Outputs
     VAR_CONST_SR_21_uxn_c_l129_c17_ecf7_return_output := CONST_SR_21_uxn_c_l129_c17_ecf7_return_output;

     -- UNARY_OP_NOT[uxn_c_l157_c57_4dc4] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l157_c57_4dc4_expr <= VAR_UNARY_OP_NOT_uxn_c_l157_c57_4dc4_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l157_c57_4dc4_return_output := UNARY_OP_NOT_uxn_c_l157_c57_4dc4_return_output;

     -- Submodule level 1
     VAR_BIN_OP_DIV_uxn_c_l131_c13_0eaa_left := VAR_BIN_OP_AND_uxn_c_l130_c27_5860_return_output;
     VAR_BIN_OP_MINUS_uxn_c_l132_c13_55c6_left := VAR_BIN_OP_AND_uxn_c_l130_c27_5860_return_output;
     VAR_y_uxn_c_l122_c2_b0c6 := resize(VAR_BIN_OP_DIV_uxn_c_l122_c6_eacc_return_output, 16);
     VAR_fill_pixels_remaining_MUX_uxn_c_l168_c2_7916_cond := VAR_BIN_OP_EQ_uxn_c_l168_c6_9331_return_output;
     VAR_pixel_counter_MUX_uxn_c_l168_c2_7916_cond := VAR_BIN_OP_EQ_uxn_c_l168_c6_9331_return_output;
     VAR_MUX_uxn_c_l119_c26_f9ae_cond := VAR_BIN_OP_GT_uxn_c_l119_c26_de19_return_output;
     VAR_pixel_counter_uxn_c_l171_c3_47ae := resize(VAR_BIN_OP_PLUS_uxn_c_l171_c3_5c3a_return_output, 32);
     VAR_is_fill_left_uxn_c_l128_c3_c3fd := resize(VAR_CONST_SR_20_uxn_c_l128_c18_b15c_return_output, 1);
     VAR_is_fill_top_uxn_c_l129_c3_0c0b := resize(VAR_CONST_SR_21_uxn_c_l129_c17_ecf7_return_output, 1);
     VAR_BIN_OP_AND_uxn_c_l126_c6_25c8_right := VAR_UNARY_OP_NOT_uxn_c_l126_c22_afde_return_output;
     VAR_BIN_OP_AND_uxn_c_l157_c22_7ece_right := VAR_UNARY_OP_NOT_uxn_c_l157_c57_4dc4_return_output;
     VAR_MUX_uxn_c_l134_c13_902c_cond := VAR_is_fill_left_uxn_c_l128_c3_c3fd;
     VAR_MUX_uxn_c_l136_c13_e4f6_cond := VAR_is_fill_left_uxn_c_l128_c3_c3fd;
     VAR_is_fill_left_MUX_uxn_c_l126_c2_8fe6_iftrue := VAR_is_fill_left_uxn_c_l128_c3_c3fd;
     VAR_MUX_uxn_c_l133_c13_f7ea_cond := VAR_is_fill_top_uxn_c_l129_c3_0c0b;
     VAR_MUX_uxn_c_l135_c13_fa57_cond := VAR_is_fill_top_uxn_c_l129_c3_0c0b;
     VAR_is_fill_top_MUX_uxn_c_l126_c2_8fe6_iftrue := VAR_is_fill_top_uxn_c_l129_c3_0c0b;
     VAR_pixel_counter_MUX_uxn_c_l170_c9_5f1d_iftrue := VAR_pixel_counter_uxn_c_l171_c3_47ae;
     VAR_BIN_OP_GT_uxn_c_l146_c17_f2f9_left := VAR_y_uxn_c_l122_c2_b0c6;
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l123_c23_2fbc_left := VAR_y_uxn_c_l122_c2_b0c6;
     VAR_BIN_OP_LT_uxn_c_l147_c17_648c_left := VAR_y_uxn_c_l122_c2_b0c6;
     REG_VAR_y := VAR_y_uxn_c_l122_c2_b0c6;
     -- BIN_OP_DIV[uxn_c_l131_c13_0eaa] LATENCY=0
     -- Inputs
     BIN_OP_DIV_uxn_c_l131_c13_0eaa_left <= VAR_BIN_OP_DIV_uxn_c_l131_c13_0eaa_left;
     BIN_OP_DIV_uxn_c_l131_c13_0eaa_right <= VAR_BIN_OP_DIV_uxn_c_l131_c13_0eaa_right;
     -- Outputs
     VAR_BIN_OP_DIV_uxn_c_l131_c13_0eaa_return_output := BIN_OP_DIV_uxn_c_l131_c13_0eaa_return_output;

     -- CAST_TO_uint4_t[uxn_c_l120_c14_19d7] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_c_l120_c14_19d7_return_output := CAST_TO_uint4_t_uint32_t(
     VAR_CONST_SR_28_uxn_c_l120_c24_94b7_return_output);

     -- BIN_OP_INFERRED_MULT[uxn_c_l123_c23_2fbc] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_c_l123_c23_2fbc_left <= VAR_BIN_OP_INFERRED_MULT_uxn_c_l123_c23_2fbc_left;
     BIN_OP_INFERRED_MULT_uxn_c_l123_c23_2fbc_right <= VAR_BIN_OP_INFERRED_MULT_uxn_c_l123_c23_2fbc_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l123_c23_2fbc_return_output := BIN_OP_INFERRED_MULT_uxn_c_l123_c23_2fbc_return_output;

     -- MUX[uxn_c_l119_c26_f9ae] LATENCY=0
     -- Inputs
     MUX_uxn_c_l119_c26_f9ae_cond <= VAR_MUX_uxn_c_l119_c26_f9ae_cond;
     MUX_uxn_c_l119_c26_f9ae_iftrue <= VAR_MUX_uxn_c_l119_c26_f9ae_iftrue;
     MUX_uxn_c_l119_c26_f9ae_iffalse <= VAR_MUX_uxn_c_l119_c26_f9ae_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l119_c26_f9ae_return_output := MUX_uxn_c_l119_c26_f9ae_return_output;

     -- pixel_counter_MUX[uxn_c_l170_c9_5f1d] LATENCY=0
     -- Inputs
     pixel_counter_MUX_uxn_c_l170_c9_5f1d_cond <= VAR_pixel_counter_MUX_uxn_c_l170_c9_5f1d_cond;
     pixel_counter_MUX_uxn_c_l170_c9_5f1d_iftrue <= VAR_pixel_counter_MUX_uxn_c_l170_c9_5f1d_iftrue;
     pixel_counter_MUX_uxn_c_l170_c9_5f1d_iffalse <= VAR_pixel_counter_MUX_uxn_c_l170_c9_5f1d_iffalse;
     -- Outputs
     VAR_pixel_counter_MUX_uxn_c_l170_c9_5f1d_return_output := pixel_counter_MUX_uxn_c_l170_c9_5f1d_return_output;

     -- Submodule level 2
     VAR_fill_y0_uxn_c_l131_c3_aa31 := resize(VAR_BIN_OP_DIV_uxn_c_l131_c13_0eaa_return_output, 16);
     VAR_BIN_OP_MINUS_uxn_c_l123_c6_4590_right := VAR_BIN_OP_INFERRED_MULT_uxn_c_l123_c23_2fbc_return_output;
     VAR_BIN_OP_EQ_uxn_c_l121_c17_7783_left := VAR_CAST_TO_uint4_t_uxn_c_l120_c14_19d7_return_output;
     REG_VAR_vram_code := VAR_CAST_TO_uint4_t_uxn_c_l120_c14_19d7_return_output;
     VAR_MUX_uxn_c_l155_c37_beb5_iffalse := VAR_MUX_uxn_c_l119_c26_f9ae_return_output;
     VAR_MUX_uxn_c_l162_c37_1152_iffalse := VAR_MUX_uxn_c_l119_c26_f9ae_return_output;
     REG_VAR_adjusted_vram_address := VAR_MUX_uxn_c_l119_c26_f9ae_return_output;
     VAR_pixel_counter_MUX_uxn_c_l168_c2_7916_iffalse := VAR_pixel_counter_MUX_uxn_c_l170_c9_5f1d_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l132_c38_1f7a_left := VAR_fill_y0_uxn_c_l131_c3_aa31;
     VAR_MUX_uxn_c_l133_c13_f7ea_iftrue := VAR_fill_y0_uxn_c_l131_c3_aa31;
     VAR_MUX_uxn_c_l135_c13_fa57_iffalse := VAR_fill_y0_uxn_c_l131_c3_aa31;
     -- BIN_OP_EQ[uxn_c_l121_c17_7783] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l121_c17_7783_left <= VAR_BIN_OP_EQ_uxn_c_l121_c17_7783_left;
     BIN_OP_EQ_uxn_c_l121_c17_7783_right <= VAR_BIN_OP_EQ_uxn_c_l121_c17_7783_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l121_c17_7783_return_output := BIN_OP_EQ_uxn_c_l121_c17_7783_return_output;

     -- BIN_OP_MINUS[uxn_c_l123_c6_4590] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l123_c6_4590_left <= VAR_BIN_OP_MINUS_uxn_c_l123_c6_4590_left;
     BIN_OP_MINUS_uxn_c_l123_c6_4590_right <= VAR_BIN_OP_MINUS_uxn_c_l123_c6_4590_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l123_c6_4590_return_output := BIN_OP_MINUS_uxn_c_l123_c6_4590_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_c_l132_c38_1f7a] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_c_l132_c38_1f7a_left <= VAR_BIN_OP_INFERRED_MULT_uxn_c_l132_c38_1f7a_left;
     BIN_OP_INFERRED_MULT_uxn_c_l132_c38_1f7a_right <= VAR_BIN_OP_INFERRED_MULT_uxn_c_l132_c38_1f7a_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l132_c38_1f7a_return_output := BIN_OP_INFERRED_MULT_uxn_c_l132_c38_1f7a_return_output;

     -- MUX[uxn_c_l133_c13_f7ea] LATENCY=0
     -- Inputs
     MUX_uxn_c_l133_c13_f7ea_cond <= VAR_MUX_uxn_c_l133_c13_f7ea_cond;
     MUX_uxn_c_l133_c13_f7ea_iftrue <= VAR_MUX_uxn_c_l133_c13_f7ea_iftrue;
     MUX_uxn_c_l133_c13_f7ea_iffalse <= VAR_MUX_uxn_c_l133_c13_f7ea_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l133_c13_f7ea_return_output := MUX_uxn_c_l133_c13_f7ea_return_output;

     -- MUX[uxn_c_l135_c13_fa57] LATENCY=0
     -- Inputs
     MUX_uxn_c_l135_c13_fa57_cond <= VAR_MUX_uxn_c_l135_c13_fa57_cond;
     MUX_uxn_c_l135_c13_fa57_iftrue <= VAR_MUX_uxn_c_l135_c13_fa57_iftrue;
     MUX_uxn_c_l135_c13_fa57_iffalse <= VAR_MUX_uxn_c_l135_c13_fa57_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l135_c13_fa57_return_output := MUX_uxn_c_l135_c13_fa57_return_output;

     -- pixel_counter_MUX[uxn_c_l168_c2_7916] LATENCY=0
     -- Inputs
     pixel_counter_MUX_uxn_c_l168_c2_7916_cond <= VAR_pixel_counter_MUX_uxn_c_l168_c2_7916_cond;
     pixel_counter_MUX_uxn_c_l168_c2_7916_iftrue <= VAR_pixel_counter_MUX_uxn_c_l168_c2_7916_iftrue;
     pixel_counter_MUX_uxn_c_l168_c2_7916_iffalse <= VAR_pixel_counter_MUX_uxn_c_l168_c2_7916_iffalse;
     -- Outputs
     VAR_pixel_counter_MUX_uxn_c_l168_c2_7916_return_output := pixel_counter_MUX_uxn_c_l168_c2_7916_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_c_l121_c17_8ed4_cond := VAR_BIN_OP_EQ_uxn_c_l121_c17_7783_return_output;
     VAR_BIN_OP_MINUS_uxn_c_l132_c13_55c6_right := VAR_BIN_OP_INFERRED_MULT_uxn_c_l132_c38_1f7a_return_output;
     VAR_x_uxn_c_l123_c2_0ebb := resize(VAR_BIN_OP_MINUS_uxn_c_l123_c6_4590_return_output, 16);
     VAR_fill_y1_MUX_uxn_c_l126_c2_8fe6_iftrue := VAR_MUX_uxn_c_l133_c13_f7ea_return_output;
     VAR_fill_y0_MUX_uxn_c_l126_c2_8fe6_iftrue := VAR_MUX_uxn_c_l135_c13_fa57_return_output;
     REG_VAR_pixel_counter := VAR_pixel_counter_MUX_uxn_c_l168_c2_7916_return_output;
     VAR_BIN_OP_GT_uxn_c_l144_c17_eb96_left := VAR_x_uxn_c_l123_c2_0ebb;
     VAR_BIN_OP_LT_uxn_c_l145_c17_8673_left := VAR_x_uxn_c_l123_c2_0ebb;
     REG_VAR_x := VAR_x_uxn_c_l123_c2_0ebb;
     -- MUX[uxn_c_l121_c17_8ed4] LATENCY=0
     -- Inputs
     MUX_uxn_c_l121_c17_8ed4_cond <= VAR_MUX_uxn_c_l121_c17_8ed4_cond;
     MUX_uxn_c_l121_c17_8ed4_iftrue <= VAR_MUX_uxn_c_l121_c17_8ed4_iftrue;
     MUX_uxn_c_l121_c17_8ed4_iffalse <= VAR_MUX_uxn_c_l121_c17_8ed4_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l121_c17_8ed4_return_output := MUX_uxn_c_l121_c17_8ed4_return_output;

     -- BIN_OP_MINUS[uxn_c_l132_c13_55c6] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l132_c13_55c6_left <= VAR_BIN_OP_MINUS_uxn_c_l132_c13_55c6_left;
     BIN_OP_MINUS_uxn_c_l132_c13_55c6_right <= VAR_BIN_OP_MINUS_uxn_c_l132_c13_55c6_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l132_c13_55c6_return_output := BIN_OP_MINUS_uxn_c_l132_c13_55c6_return_output;

     -- Submodule level 4
     VAR_fill_x0_uxn_c_l132_c3_eb6d := resize(VAR_BIN_OP_MINUS_uxn_c_l132_c13_55c6_return_output, 16);
     VAR_BIN_OP_AND_uxn_c_l126_c6_25c8_left := VAR_MUX_uxn_c_l121_c17_8ed4_return_output;
     REG_VAR_is_fill_code := VAR_MUX_uxn_c_l121_c17_8ed4_return_output;
     VAR_MUX_uxn_c_l134_c13_902c_iftrue := VAR_fill_x0_uxn_c_l132_c3_eb6d;
     VAR_MUX_uxn_c_l136_c13_e4f6_iffalse := VAR_fill_x0_uxn_c_l132_c3_eb6d;
     -- BIN_OP_AND[uxn_c_l126_c6_25c8] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l126_c6_25c8_left <= VAR_BIN_OP_AND_uxn_c_l126_c6_25c8_left;
     BIN_OP_AND_uxn_c_l126_c6_25c8_right <= VAR_BIN_OP_AND_uxn_c_l126_c6_25c8_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l126_c6_25c8_return_output := BIN_OP_AND_uxn_c_l126_c6_25c8_return_output;

     -- MUX[uxn_c_l136_c13_e4f6] LATENCY=0
     -- Inputs
     MUX_uxn_c_l136_c13_e4f6_cond <= VAR_MUX_uxn_c_l136_c13_e4f6_cond;
     MUX_uxn_c_l136_c13_e4f6_iftrue <= VAR_MUX_uxn_c_l136_c13_e4f6_iftrue;
     MUX_uxn_c_l136_c13_e4f6_iffalse <= VAR_MUX_uxn_c_l136_c13_e4f6_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l136_c13_e4f6_return_output := MUX_uxn_c_l136_c13_e4f6_return_output;

     -- MUX[uxn_c_l134_c13_902c] LATENCY=0
     -- Inputs
     MUX_uxn_c_l134_c13_902c_cond <= VAR_MUX_uxn_c_l134_c13_902c_cond;
     MUX_uxn_c_l134_c13_902c_iftrue <= VAR_MUX_uxn_c_l134_c13_902c_iftrue;
     MUX_uxn_c_l134_c13_902c_iffalse <= VAR_MUX_uxn_c_l134_c13_902c_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l134_c13_902c_return_output := MUX_uxn_c_l134_c13_902c_return_output;

     -- Submodule level 5
     VAR_fill_color_MUX_uxn_c_l126_c2_8fe6_cond := VAR_BIN_OP_AND_uxn_c_l126_c6_25c8_return_output;
     VAR_fill_layer_MUX_uxn_c_l126_c2_8fe6_cond := VAR_BIN_OP_AND_uxn_c_l126_c6_25c8_return_output;
     VAR_fill_pixels_remaining_MUX_uxn_c_l126_c2_8fe6_cond := VAR_BIN_OP_AND_uxn_c_l126_c6_25c8_return_output;
     VAR_fill_x0_MUX_uxn_c_l126_c2_8fe6_cond := VAR_BIN_OP_AND_uxn_c_l126_c6_25c8_return_output;
     VAR_fill_x1_MUX_uxn_c_l126_c2_8fe6_cond := VAR_BIN_OP_AND_uxn_c_l126_c6_25c8_return_output;
     VAR_fill_y0_MUX_uxn_c_l126_c2_8fe6_cond := VAR_BIN_OP_AND_uxn_c_l126_c6_25c8_return_output;
     VAR_fill_y1_MUX_uxn_c_l126_c2_8fe6_cond := VAR_BIN_OP_AND_uxn_c_l126_c6_25c8_return_output;
     VAR_is_fill_left_MUX_uxn_c_l126_c2_8fe6_cond := VAR_BIN_OP_AND_uxn_c_l126_c6_25c8_return_output;
     VAR_is_fill_top_MUX_uxn_c_l126_c2_8fe6_cond := VAR_BIN_OP_AND_uxn_c_l126_c6_25c8_return_output;
     VAR_fill_x1_MUX_uxn_c_l126_c2_8fe6_iftrue := VAR_MUX_uxn_c_l134_c13_902c_return_output;
     VAR_fill_x0_MUX_uxn_c_l126_c2_8fe6_iftrue := VAR_MUX_uxn_c_l136_c13_e4f6_return_output;
     -- fill_layer_MUX[uxn_c_l126_c2_8fe6] LATENCY=0
     -- Inputs
     fill_layer_MUX_uxn_c_l126_c2_8fe6_cond <= VAR_fill_layer_MUX_uxn_c_l126_c2_8fe6_cond;
     fill_layer_MUX_uxn_c_l126_c2_8fe6_iftrue <= VAR_fill_layer_MUX_uxn_c_l126_c2_8fe6_iftrue;
     fill_layer_MUX_uxn_c_l126_c2_8fe6_iffalse <= VAR_fill_layer_MUX_uxn_c_l126_c2_8fe6_iffalse;
     -- Outputs
     VAR_fill_layer_MUX_uxn_c_l126_c2_8fe6_return_output := fill_layer_MUX_uxn_c_l126_c2_8fe6_return_output;

     -- fill_y1_MUX[uxn_c_l126_c2_8fe6] LATENCY=0
     -- Inputs
     fill_y1_MUX_uxn_c_l126_c2_8fe6_cond <= VAR_fill_y1_MUX_uxn_c_l126_c2_8fe6_cond;
     fill_y1_MUX_uxn_c_l126_c2_8fe6_iftrue <= VAR_fill_y1_MUX_uxn_c_l126_c2_8fe6_iftrue;
     fill_y1_MUX_uxn_c_l126_c2_8fe6_iffalse <= VAR_fill_y1_MUX_uxn_c_l126_c2_8fe6_iffalse;
     -- Outputs
     VAR_fill_y1_MUX_uxn_c_l126_c2_8fe6_return_output := fill_y1_MUX_uxn_c_l126_c2_8fe6_return_output;

     -- fill_x1_MUX[uxn_c_l126_c2_8fe6] LATENCY=0
     -- Inputs
     fill_x1_MUX_uxn_c_l126_c2_8fe6_cond <= VAR_fill_x1_MUX_uxn_c_l126_c2_8fe6_cond;
     fill_x1_MUX_uxn_c_l126_c2_8fe6_iftrue <= VAR_fill_x1_MUX_uxn_c_l126_c2_8fe6_iftrue;
     fill_x1_MUX_uxn_c_l126_c2_8fe6_iffalse <= VAR_fill_x1_MUX_uxn_c_l126_c2_8fe6_iffalse;
     -- Outputs
     VAR_fill_x1_MUX_uxn_c_l126_c2_8fe6_return_output := fill_x1_MUX_uxn_c_l126_c2_8fe6_return_output;

     -- is_fill_left_MUX[uxn_c_l126_c2_8fe6] LATENCY=0
     -- Inputs
     is_fill_left_MUX_uxn_c_l126_c2_8fe6_cond <= VAR_is_fill_left_MUX_uxn_c_l126_c2_8fe6_cond;
     is_fill_left_MUX_uxn_c_l126_c2_8fe6_iftrue <= VAR_is_fill_left_MUX_uxn_c_l126_c2_8fe6_iftrue;
     is_fill_left_MUX_uxn_c_l126_c2_8fe6_iffalse <= VAR_is_fill_left_MUX_uxn_c_l126_c2_8fe6_iffalse;
     -- Outputs
     VAR_is_fill_left_MUX_uxn_c_l126_c2_8fe6_return_output := is_fill_left_MUX_uxn_c_l126_c2_8fe6_return_output;

     -- fill_x0_MUX[uxn_c_l126_c2_8fe6] LATENCY=0
     -- Inputs
     fill_x0_MUX_uxn_c_l126_c2_8fe6_cond <= VAR_fill_x0_MUX_uxn_c_l126_c2_8fe6_cond;
     fill_x0_MUX_uxn_c_l126_c2_8fe6_iftrue <= VAR_fill_x0_MUX_uxn_c_l126_c2_8fe6_iftrue;
     fill_x0_MUX_uxn_c_l126_c2_8fe6_iffalse <= VAR_fill_x0_MUX_uxn_c_l126_c2_8fe6_iffalse;
     -- Outputs
     VAR_fill_x0_MUX_uxn_c_l126_c2_8fe6_return_output := fill_x0_MUX_uxn_c_l126_c2_8fe6_return_output;

     -- fill_color_MUX[uxn_c_l126_c2_8fe6] LATENCY=0
     -- Inputs
     fill_color_MUX_uxn_c_l126_c2_8fe6_cond <= VAR_fill_color_MUX_uxn_c_l126_c2_8fe6_cond;
     fill_color_MUX_uxn_c_l126_c2_8fe6_iftrue <= VAR_fill_color_MUX_uxn_c_l126_c2_8fe6_iftrue;
     fill_color_MUX_uxn_c_l126_c2_8fe6_iffalse <= VAR_fill_color_MUX_uxn_c_l126_c2_8fe6_iffalse;
     -- Outputs
     VAR_fill_color_MUX_uxn_c_l126_c2_8fe6_return_output := fill_color_MUX_uxn_c_l126_c2_8fe6_return_output;

     -- fill_pixels_remaining_MUX[uxn_c_l126_c2_8fe6] LATENCY=0
     -- Inputs
     fill_pixels_remaining_MUX_uxn_c_l126_c2_8fe6_cond <= VAR_fill_pixels_remaining_MUX_uxn_c_l126_c2_8fe6_cond;
     fill_pixels_remaining_MUX_uxn_c_l126_c2_8fe6_iftrue <= VAR_fill_pixels_remaining_MUX_uxn_c_l126_c2_8fe6_iftrue;
     fill_pixels_remaining_MUX_uxn_c_l126_c2_8fe6_iffalse <= VAR_fill_pixels_remaining_MUX_uxn_c_l126_c2_8fe6_iffalse;
     -- Outputs
     VAR_fill_pixels_remaining_MUX_uxn_c_l126_c2_8fe6_return_output := fill_pixels_remaining_MUX_uxn_c_l126_c2_8fe6_return_output;

     -- fill_y0_MUX[uxn_c_l126_c2_8fe6] LATENCY=0
     -- Inputs
     fill_y0_MUX_uxn_c_l126_c2_8fe6_cond <= VAR_fill_y0_MUX_uxn_c_l126_c2_8fe6_cond;
     fill_y0_MUX_uxn_c_l126_c2_8fe6_iftrue <= VAR_fill_y0_MUX_uxn_c_l126_c2_8fe6_iftrue;
     fill_y0_MUX_uxn_c_l126_c2_8fe6_iffalse <= VAR_fill_y0_MUX_uxn_c_l126_c2_8fe6_iffalse;
     -- Outputs
     VAR_fill_y0_MUX_uxn_c_l126_c2_8fe6_return_output := fill_y0_MUX_uxn_c_l126_c2_8fe6_return_output;

     -- is_fill_top_MUX[uxn_c_l126_c2_8fe6] LATENCY=0
     -- Inputs
     is_fill_top_MUX_uxn_c_l126_c2_8fe6_cond <= VAR_is_fill_top_MUX_uxn_c_l126_c2_8fe6_cond;
     is_fill_top_MUX_uxn_c_l126_c2_8fe6_iftrue <= VAR_is_fill_top_MUX_uxn_c_l126_c2_8fe6_iftrue;
     is_fill_top_MUX_uxn_c_l126_c2_8fe6_iffalse <= VAR_is_fill_top_MUX_uxn_c_l126_c2_8fe6_iffalse;
     -- Outputs
     VAR_is_fill_top_MUX_uxn_c_l126_c2_8fe6_return_output := is_fill_top_MUX_uxn_c_l126_c2_8fe6_return_output;

     -- Submodule level 6
     VAR_MUX_uxn_c_l156_c3_25f1_iftrue := VAR_fill_color_MUX_uxn_c_l126_c2_8fe6_return_output;
     VAR_MUX_uxn_c_l163_c3_3fd8_iftrue := VAR_fill_color_MUX_uxn_c_l126_c2_8fe6_return_output;
     REG_VAR_fill_color := VAR_fill_color_MUX_uxn_c_l126_c2_8fe6_return_output;
     VAR_BIN_OP_AND_uxn_c_l151_c19_6cca_right := VAR_fill_layer_MUX_uxn_c_l126_c2_8fe6_return_output;
     VAR_UNARY_OP_NOT_uxn_c_l150_c37_ef67_expr := VAR_fill_layer_MUX_uxn_c_l126_c2_8fe6_return_output;
     REG_VAR_fill_layer := VAR_fill_layer_MUX_uxn_c_l126_c2_8fe6_return_output;
     VAR_BIN_OP_EQ_uxn_c_l142_c19_1b94_left := VAR_fill_pixels_remaining_MUX_uxn_c_l126_c2_8fe6_return_output;
     VAR_BIN_OP_EQ_uxn_c_l172_c27_0a47_left := VAR_fill_pixels_remaining_MUX_uxn_c_l126_c2_8fe6_return_output;
     VAR_BIN_OP_MINUS_uxn_c_l172_c60_b6c2_left := VAR_fill_pixels_remaining_MUX_uxn_c_l126_c2_8fe6_return_output;
     VAR_fill_pixels_remaining_MUX_uxn_c_l168_c2_7916_iftrue := VAR_fill_pixels_remaining_MUX_uxn_c_l126_c2_8fe6_return_output;
     VAR_fill_pixels_remaining_MUX_uxn_c_l170_c9_5f1d_iffalse := VAR_fill_pixels_remaining_MUX_uxn_c_l126_c2_8fe6_return_output;
     VAR_BIN_OP_GT_uxn_c_l144_c17_eb96_right := VAR_fill_x0_MUX_uxn_c_l126_c2_8fe6_return_output;
     REG_VAR_fill_x0 := VAR_fill_x0_MUX_uxn_c_l126_c2_8fe6_return_output;
     VAR_BIN_OP_LT_uxn_c_l145_c17_8673_right := VAR_fill_x1_MUX_uxn_c_l126_c2_8fe6_return_output;
     REG_VAR_fill_x1 := VAR_fill_x1_MUX_uxn_c_l126_c2_8fe6_return_output;
     VAR_BIN_OP_GT_uxn_c_l146_c17_f2f9_right := VAR_fill_y0_MUX_uxn_c_l126_c2_8fe6_return_output;
     REG_VAR_fill_y0 := VAR_fill_y0_MUX_uxn_c_l126_c2_8fe6_return_output;
     VAR_BIN_OP_LT_uxn_c_l147_c17_648c_right := VAR_fill_y1_MUX_uxn_c_l126_c2_8fe6_return_output;
     REG_VAR_fill_y1 := VAR_fill_y1_MUX_uxn_c_l126_c2_8fe6_return_output;
     REG_VAR_is_fill_left := VAR_is_fill_left_MUX_uxn_c_l126_c2_8fe6_return_output;
     REG_VAR_is_fill_top := VAR_is_fill_top_MUX_uxn_c_l126_c2_8fe6_return_output;
     -- BIN_OP_EQ[uxn_c_l172_c27_0a47] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l172_c27_0a47_left <= VAR_BIN_OP_EQ_uxn_c_l172_c27_0a47_left;
     BIN_OP_EQ_uxn_c_l172_c27_0a47_right <= VAR_BIN_OP_EQ_uxn_c_l172_c27_0a47_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l172_c27_0a47_return_output := BIN_OP_EQ_uxn_c_l172_c27_0a47_return_output;

     -- BIN_OP_LT[uxn_c_l147_c17_648c] LATENCY=0
     -- Inputs
     BIN_OP_LT_uxn_c_l147_c17_648c_left <= VAR_BIN_OP_LT_uxn_c_l147_c17_648c_left;
     BIN_OP_LT_uxn_c_l147_c17_648c_right <= VAR_BIN_OP_LT_uxn_c_l147_c17_648c_right;
     -- Outputs
     VAR_BIN_OP_LT_uxn_c_l147_c17_648c_return_output := BIN_OP_LT_uxn_c_l147_c17_648c_return_output;

     -- UNARY_OP_NOT[uxn_c_l150_c37_ef67] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l150_c37_ef67_expr <= VAR_UNARY_OP_NOT_uxn_c_l150_c37_ef67_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l150_c37_ef67_return_output := UNARY_OP_NOT_uxn_c_l150_c37_ef67_return_output;

     -- BIN_OP_EQ[uxn_c_l142_c19_1b94] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l142_c19_1b94_left <= VAR_BIN_OP_EQ_uxn_c_l142_c19_1b94_left;
     BIN_OP_EQ_uxn_c_l142_c19_1b94_right <= VAR_BIN_OP_EQ_uxn_c_l142_c19_1b94_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l142_c19_1b94_return_output := BIN_OP_EQ_uxn_c_l142_c19_1b94_return_output;

     -- BIN_OP_GT[uxn_c_l144_c17_eb96] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_c_l144_c17_eb96_left <= VAR_BIN_OP_GT_uxn_c_l144_c17_eb96_left;
     BIN_OP_GT_uxn_c_l144_c17_eb96_right <= VAR_BIN_OP_GT_uxn_c_l144_c17_eb96_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_c_l144_c17_eb96_return_output := BIN_OP_GT_uxn_c_l144_c17_eb96_return_output;

     -- BIN_OP_GT[uxn_c_l146_c17_f2f9] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_c_l146_c17_f2f9_left <= VAR_BIN_OP_GT_uxn_c_l146_c17_f2f9_left;
     BIN_OP_GT_uxn_c_l146_c17_f2f9_right <= VAR_BIN_OP_GT_uxn_c_l146_c17_f2f9_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_c_l146_c17_f2f9_return_output := BIN_OP_GT_uxn_c_l146_c17_f2f9_return_output;

     -- BIN_OP_LT[uxn_c_l145_c17_8673] LATENCY=0
     -- Inputs
     BIN_OP_LT_uxn_c_l145_c17_8673_left <= VAR_BIN_OP_LT_uxn_c_l145_c17_8673_left;
     BIN_OP_LT_uxn_c_l145_c17_8673_right <= VAR_BIN_OP_LT_uxn_c_l145_c17_8673_right;
     -- Outputs
     VAR_BIN_OP_LT_uxn_c_l145_c17_8673_return_output := BIN_OP_LT_uxn_c_l145_c17_8673_return_output;

     -- BIN_OP_MINUS[uxn_c_l172_c60_b6c2] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l172_c60_b6c2_left <= VAR_BIN_OP_MINUS_uxn_c_l172_c60_b6c2_left;
     BIN_OP_MINUS_uxn_c_l172_c60_b6c2_right <= VAR_BIN_OP_MINUS_uxn_c_l172_c60_b6c2_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l172_c60_b6c2_return_output := BIN_OP_MINUS_uxn_c_l172_c60_b6c2_return_output;

     -- Submodule level 7
     VAR_MUX_uxn_c_l142_c19_1c39_cond := VAR_BIN_OP_EQ_uxn_c_l142_c19_1b94_return_output;
     VAR_MUX_uxn_c_l172_c27_90c2_cond := VAR_BIN_OP_EQ_uxn_c_l172_c27_0a47_return_output;
     VAR_BIN_OP_AND_uxn_c_l149_c18_2f0d_right := VAR_BIN_OP_GT_uxn_c_l144_c17_eb96_return_output;
     REG_VAR_fill_isect_l := VAR_BIN_OP_GT_uxn_c_l144_c17_eb96_return_output;
     VAR_BIN_OP_AND_uxn_c_l149_c18_d9ee_right := VAR_BIN_OP_GT_uxn_c_l146_c17_f2f9_return_output;
     REG_VAR_fill_isect_t := VAR_BIN_OP_GT_uxn_c_l146_c17_f2f9_return_output;
     VAR_BIN_OP_AND_uxn_c_l149_c18_53c1_right := VAR_BIN_OP_LT_uxn_c_l145_c17_8673_return_output;
     REG_VAR_fill_isect_r := VAR_BIN_OP_LT_uxn_c_l145_c17_8673_return_output;
     VAR_BIN_OP_AND_uxn_c_l149_c18_ca70_right := VAR_BIN_OP_LT_uxn_c_l147_c17_648c_return_output;
     REG_VAR_fill_isect_b := VAR_BIN_OP_LT_uxn_c_l147_c17_648c_return_output;
     VAR_MUX_uxn_c_l172_c27_90c2_iffalse := VAR_BIN_OP_MINUS_uxn_c_l172_c60_b6c2_return_output;
     VAR_BIN_OP_AND_uxn_c_l150_c19_88bc_right := VAR_UNARY_OP_NOT_uxn_c_l150_c37_ef67_return_output;
     -- MUX[uxn_c_l172_c27_90c2] LATENCY=0
     -- Inputs
     MUX_uxn_c_l172_c27_90c2_cond <= VAR_MUX_uxn_c_l172_c27_90c2_cond;
     MUX_uxn_c_l172_c27_90c2_iftrue <= VAR_MUX_uxn_c_l172_c27_90c2_iftrue;
     MUX_uxn_c_l172_c27_90c2_iffalse <= VAR_MUX_uxn_c_l172_c27_90c2_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l172_c27_90c2_return_output := MUX_uxn_c_l172_c27_90c2_return_output;

     -- MUX[uxn_c_l142_c19_1c39] LATENCY=0
     -- Inputs
     MUX_uxn_c_l142_c19_1c39_cond <= VAR_MUX_uxn_c_l142_c19_1c39_cond;
     MUX_uxn_c_l142_c19_1c39_iftrue <= VAR_MUX_uxn_c_l142_c19_1c39_iftrue;
     MUX_uxn_c_l142_c19_1c39_iffalse <= VAR_MUX_uxn_c_l142_c19_1c39_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l142_c19_1c39_return_output := MUX_uxn_c_l142_c19_1c39_return_output;

     -- Submodule level 8
     VAR_BIN_OP_AND_uxn_c_l149_c18_2f0d_left := VAR_MUX_uxn_c_l142_c19_1c39_return_output;
     VAR_MUX_uxn_c_l155_c37_beb5_cond := VAR_MUX_uxn_c_l142_c19_1c39_return_output;
     VAR_MUX_uxn_c_l162_c37_1152_cond := VAR_MUX_uxn_c_l142_c19_1c39_return_output;
     VAR_UNARY_OP_NOT_uint1_t_uxn_c_l157_l164_DUPLICATE_b1ef_expr := VAR_MUX_uxn_c_l142_c19_1c39_return_output;
     REG_VAR_is_fill_active := VAR_MUX_uxn_c_l142_c19_1c39_return_output;
     VAR_fill_pixels_remaining_MUX_uxn_c_l170_c9_5f1d_iftrue := VAR_MUX_uxn_c_l172_c27_90c2_return_output;
     -- MUX[uxn_c_l162_c37_1152] LATENCY=0
     -- Inputs
     MUX_uxn_c_l162_c37_1152_cond <= VAR_MUX_uxn_c_l162_c37_1152_cond;
     MUX_uxn_c_l162_c37_1152_iftrue <= VAR_MUX_uxn_c_l162_c37_1152_iftrue;
     MUX_uxn_c_l162_c37_1152_iffalse <= VAR_MUX_uxn_c_l162_c37_1152_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l162_c37_1152_return_output := MUX_uxn_c_l162_c37_1152_return_output;

     -- UNARY_OP_NOT_uint1_t_uxn_c_l157_l164_DUPLICATE_b1ef LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uint1_t_uxn_c_l157_l164_DUPLICATE_b1ef_expr <= VAR_UNARY_OP_NOT_uint1_t_uxn_c_l157_l164_DUPLICATE_b1ef_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uint1_t_uxn_c_l157_l164_DUPLICATE_b1ef_return_output := UNARY_OP_NOT_uint1_t_uxn_c_l157_l164_DUPLICATE_b1ef_return_output;

     -- BIN_OP_AND[uxn_c_l149_c18_2f0d] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l149_c18_2f0d_left <= VAR_BIN_OP_AND_uxn_c_l149_c18_2f0d_left;
     BIN_OP_AND_uxn_c_l149_c18_2f0d_right <= VAR_BIN_OP_AND_uxn_c_l149_c18_2f0d_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l149_c18_2f0d_return_output := BIN_OP_AND_uxn_c_l149_c18_2f0d_return_output;

     -- MUX[uxn_c_l155_c37_beb5] LATENCY=0
     -- Inputs
     MUX_uxn_c_l155_c37_beb5_cond <= VAR_MUX_uxn_c_l155_c37_beb5_cond;
     MUX_uxn_c_l155_c37_beb5_iftrue <= VAR_MUX_uxn_c_l155_c37_beb5_iftrue;
     MUX_uxn_c_l155_c37_beb5_iffalse <= VAR_MUX_uxn_c_l155_c37_beb5_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l155_c37_beb5_return_output := MUX_uxn_c_l155_c37_beb5_return_output;

     -- fill_pixels_remaining_MUX[uxn_c_l170_c9_5f1d] LATENCY=0
     -- Inputs
     fill_pixels_remaining_MUX_uxn_c_l170_c9_5f1d_cond <= VAR_fill_pixels_remaining_MUX_uxn_c_l170_c9_5f1d_cond;
     fill_pixels_remaining_MUX_uxn_c_l170_c9_5f1d_iftrue <= VAR_fill_pixels_remaining_MUX_uxn_c_l170_c9_5f1d_iftrue;
     fill_pixels_remaining_MUX_uxn_c_l170_c9_5f1d_iffalse <= VAR_fill_pixels_remaining_MUX_uxn_c_l170_c9_5f1d_iffalse;
     -- Outputs
     VAR_fill_pixels_remaining_MUX_uxn_c_l170_c9_5f1d_return_output := fill_pixels_remaining_MUX_uxn_c_l170_c9_5f1d_return_output;

     -- Submodule level 9
     VAR_BIN_OP_AND_uxn_c_l149_c18_53c1_left := VAR_BIN_OP_AND_uxn_c_l149_c18_2f0d_return_output;
     VAR_MUX_uxn_c_l155_c3_063f_iffalse := VAR_MUX_uxn_c_l155_c37_beb5_return_output;
     VAR_MUX_uxn_c_l162_c3_e46d_iffalse := VAR_MUX_uxn_c_l162_c37_1152_return_output;
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l164_l157_DUPLICATE_fb4c_left := VAR_UNARY_OP_NOT_uint1_t_uxn_c_l157_l164_DUPLICATE_b1ef_return_output;
     VAR_fill_pixels_remaining_MUX_uxn_c_l168_c2_7916_iffalse := VAR_fill_pixels_remaining_MUX_uxn_c_l170_c9_5f1d_return_output;
     -- BIN_OP_AND_uint1_t_uint1_t_uxn_c_l164_l157_DUPLICATE_fb4c LATENCY=0
     -- Inputs
     BIN_OP_AND_uint1_t_uint1_t_uxn_c_l164_l157_DUPLICATE_fb4c_left <= VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l164_l157_DUPLICATE_fb4c_left;
     BIN_OP_AND_uint1_t_uint1_t_uxn_c_l164_l157_DUPLICATE_fb4c_right <= VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l164_l157_DUPLICATE_fb4c_right;
     -- Outputs
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l164_l157_DUPLICATE_fb4c_return_output := BIN_OP_AND_uint1_t_uint1_t_uxn_c_l164_l157_DUPLICATE_fb4c_return_output;

     -- fill_pixels_remaining_MUX[uxn_c_l168_c2_7916] LATENCY=0
     -- Inputs
     fill_pixels_remaining_MUX_uxn_c_l168_c2_7916_cond <= VAR_fill_pixels_remaining_MUX_uxn_c_l168_c2_7916_cond;
     fill_pixels_remaining_MUX_uxn_c_l168_c2_7916_iftrue <= VAR_fill_pixels_remaining_MUX_uxn_c_l168_c2_7916_iftrue;
     fill_pixels_remaining_MUX_uxn_c_l168_c2_7916_iffalse <= VAR_fill_pixels_remaining_MUX_uxn_c_l168_c2_7916_iffalse;
     -- Outputs
     VAR_fill_pixels_remaining_MUX_uxn_c_l168_c2_7916_return_output := fill_pixels_remaining_MUX_uxn_c_l168_c2_7916_return_output;

     -- BIN_OP_AND[uxn_c_l149_c18_53c1] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l149_c18_53c1_left <= VAR_BIN_OP_AND_uxn_c_l149_c18_53c1_left;
     BIN_OP_AND_uxn_c_l149_c18_53c1_right <= VAR_BIN_OP_AND_uxn_c_l149_c18_53c1_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l149_c18_53c1_return_output := BIN_OP_AND_uxn_c_l149_c18_53c1_return_output;

     -- Submodule level 10
     VAR_BIN_OP_AND_uxn_c_l149_c18_d9ee_left := VAR_BIN_OP_AND_uxn_c_l149_c18_53c1_return_output;
     VAR_BIN_OP_AND_uxn_c_l157_c22_7ece_left := VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l164_l157_DUPLICATE_fb4c_return_output;
     VAR_BIN_OP_AND_uxn_c_l164_c22_a524_left := VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l164_l157_DUPLICATE_fb4c_return_output;
     REG_VAR_fill_pixels_remaining := VAR_fill_pixels_remaining_MUX_uxn_c_l168_c2_7916_return_output;
     -- BIN_OP_AND[uxn_c_l164_c22_a524] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l164_c22_a524_left <= VAR_BIN_OP_AND_uxn_c_l164_c22_a524_left;
     BIN_OP_AND_uxn_c_l164_c22_a524_right <= VAR_BIN_OP_AND_uxn_c_l164_c22_a524_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l164_c22_a524_return_output := BIN_OP_AND_uxn_c_l164_c22_a524_return_output;

     -- BIN_OP_AND[uxn_c_l149_c18_d9ee] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l149_c18_d9ee_left <= VAR_BIN_OP_AND_uxn_c_l149_c18_d9ee_left;
     BIN_OP_AND_uxn_c_l149_c18_d9ee_right <= VAR_BIN_OP_AND_uxn_c_l149_c18_d9ee_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l149_c18_d9ee_return_output := BIN_OP_AND_uxn_c_l149_c18_d9ee_return_output;

     -- BIN_OP_AND[uxn_c_l157_c22_7ece] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l157_c22_7ece_left <= VAR_BIN_OP_AND_uxn_c_l157_c22_7ece_left;
     BIN_OP_AND_uxn_c_l157_c22_7ece_right <= VAR_BIN_OP_AND_uxn_c_l157_c22_7ece_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l157_c22_7ece_return_output := BIN_OP_AND_uxn_c_l157_c22_7ece_return_output;

     -- Submodule level 11
     VAR_BIN_OP_AND_uxn_c_l149_c18_ca70_left := VAR_BIN_OP_AND_uxn_c_l149_c18_d9ee_return_output;
     VAR_BIN_OP_OR_uxn_c_l157_c3_6600_right := VAR_BIN_OP_AND_uxn_c_l157_c22_7ece_return_output;
     VAR_BIN_OP_OR_uxn_c_l164_c3_c1cb_right := VAR_BIN_OP_AND_uxn_c_l164_c22_a524_return_output;
     -- BIN_OP_AND[uxn_c_l149_c18_ca70] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l149_c18_ca70_left <= VAR_BIN_OP_AND_uxn_c_l149_c18_ca70_left;
     BIN_OP_AND_uxn_c_l149_c18_ca70_right <= VAR_BIN_OP_AND_uxn_c_l149_c18_ca70_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l149_c18_ca70_return_output := BIN_OP_AND_uxn_c_l149_c18_ca70_return_output;

     -- Submodule level 12
     VAR_BIN_OP_AND_uxn_c_l150_c19_88bc_left := VAR_BIN_OP_AND_uxn_c_l149_c18_ca70_return_output;
     VAR_BIN_OP_AND_uxn_c_l151_c19_6cca_left := VAR_BIN_OP_AND_uxn_c_l149_c18_ca70_return_output;
     REG_VAR_is_fill_pixel := VAR_BIN_OP_AND_uxn_c_l149_c18_ca70_return_output;
     -- BIN_OP_AND[uxn_c_l151_c19_6cca] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l151_c19_6cca_left <= VAR_BIN_OP_AND_uxn_c_l151_c19_6cca_left;
     BIN_OP_AND_uxn_c_l151_c19_6cca_right <= VAR_BIN_OP_AND_uxn_c_l151_c19_6cca_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l151_c19_6cca_return_output := BIN_OP_AND_uxn_c_l151_c19_6cca_return_output;

     -- BIN_OP_AND[uxn_c_l150_c19_88bc] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l150_c19_88bc_left <= VAR_BIN_OP_AND_uxn_c_l150_c19_88bc_left;
     BIN_OP_AND_uxn_c_l150_c19_88bc_right <= VAR_BIN_OP_AND_uxn_c_l150_c19_88bc_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l150_c19_88bc_return_output := BIN_OP_AND_uxn_c_l150_c19_88bc_return_output;

     -- Submodule level 13
     VAR_BIN_OP_OR_uxn_c_l157_c3_6600_left := VAR_BIN_OP_AND_uxn_c_l150_c19_88bc_return_output;
     VAR_MUX_uxn_c_l155_c3_063f_cond := VAR_BIN_OP_AND_uxn_c_l150_c19_88bc_return_output;
     VAR_MUX_uxn_c_l156_c3_25f1_cond := VAR_BIN_OP_AND_uxn_c_l150_c19_88bc_return_output;
     REG_VAR_is_fill_pixel0 := VAR_BIN_OP_AND_uxn_c_l150_c19_88bc_return_output;
     VAR_BIN_OP_OR_uxn_c_l164_c3_c1cb_left := VAR_BIN_OP_AND_uxn_c_l151_c19_6cca_return_output;
     VAR_MUX_uxn_c_l162_c3_e46d_cond := VAR_BIN_OP_AND_uxn_c_l151_c19_6cca_return_output;
     VAR_MUX_uxn_c_l163_c3_3fd8_cond := VAR_BIN_OP_AND_uxn_c_l151_c19_6cca_return_output;
     REG_VAR_is_fill_pixel1 := VAR_BIN_OP_AND_uxn_c_l151_c19_6cca_return_output;
     -- MUX[uxn_c_l162_c3_e46d] LATENCY=0
     -- Inputs
     MUX_uxn_c_l162_c3_e46d_cond <= VAR_MUX_uxn_c_l162_c3_e46d_cond;
     MUX_uxn_c_l162_c3_e46d_iftrue <= VAR_MUX_uxn_c_l162_c3_e46d_iftrue;
     MUX_uxn_c_l162_c3_e46d_iffalse <= VAR_MUX_uxn_c_l162_c3_e46d_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l162_c3_e46d_return_output := MUX_uxn_c_l162_c3_e46d_return_output;

     -- BIN_OP_OR[uxn_c_l157_c3_6600] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l157_c3_6600_left <= VAR_BIN_OP_OR_uxn_c_l157_c3_6600_left;
     BIN_OP_OR_uxn_c_l157_c3_6600_right <= VAR_BIN_OP_OR_uxn_c_l157_c3_6600_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l157_c3_6600_return_output := BIN_OP_OR_uxn_c_l157_c3_6600_return_output;

     -- MUX[uxn_c_l156_c3_25f1] LATENCY=0
     -- Inputs
     MUX_uxn_c_l156_c3_25f1_cond <= VAR_MUX_uxn_c_l156_c3_25f1_cond;
     MUX_uxn_c_l156_c3_25f1_iftrue <= VAR_MUX_uxn_c_l156_c3_25f1_iftrue;
     MUX_uxn_c_l156_c3_25f1_iffalse <= VAR_MUX_uxn_c_l156_c3_25f1_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l156_c3_25f1_return_output := MUX_uxn_c_l156_c3_25f1_return_output;

     -- MUX[uxn_c_l163_c3_3fd8] LATENCY=0
     -- Inputs
     MUX_uxn_c_l163_c3_3fd8_cond <= VAR_MUX_uxn_c_l163_c3_3fd8_cond;
     MUX_uxn_c_l163_c3_3fd8_iftrue <= VAR_MUX_uxn_c_l163_c3_3fd8_iftrue;
     MUX_uxn_c_l163_c3_3fd8_iffalse <= VAR_MUX_uxn_c_l163_c3_3fd8_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l163_c3_3fd8_return_output := MUX_uxn_c_l163_c3_3fd8_return_output;

     -- BIN_OP_OR[uxn_c_l164_c3_c1cb] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l164_c3_c1cb_left <= VAR_BIN_OP_OR_uxn_c_l164_c3_c1cb_left;
     BIN_OP_OR_uxn_c_l164_c3_c1cb_right <= VAR_BIN_OP_OR_uxn_c_l164_c3_c1cb_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l164_c3_c1cb_return_output := BIN_OP_OR_uxn_c_l164_c3_c1cb_return_output;

     -- MUX[uxn_c_l155_c3_063f] LATENCY=0
     -- Inputs
     MUX_uxn_c_l155_c3_063f_cond <= VAR_MUX_uxn_c_l155_c3_063f_cond;
     MUX_uxn_c_l155_c3_063f_iftrue <= VAR_MUX_uxn_c_l155_c3_063f_iftrue;
     MUX_uxn_c_l155_c3_063f_iffalse <= VAR_MUX_uxn_c_l155_c3_063f_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l155_c3_063f_return_output := MUX_uxn_c_l155_c3_063f_return_output;

     -- Submodule level 14
     VAR_bg_vram_update_uxn_c_l153_c19_75bb_write_enable := VAR_BIN_OP_OR_uxn_c_l157_c3_6600_return_output;
     VAR_fg_vram_update_uxn_c_l160_c19_97d2_write_enable := VAR_BIN_OP_OR_uxn_c_l164_c3_c1cb_return_output;
     VAR_bg_vram_update_uxn_c_l153_c19_75bb_write_address := VAR_MUX_uxn_c_l155_c3_063f_return_output;
     VAR_bg_vram_update_uxn_c_l153_c19_75bb_write_value := VAR_MUX_uxn_c_l156_c3_25f1_return_output;
     VAR_fg_vram_update_uxn_c_l160_c19_97d2_write_address := VAR_MUX_uxn_c_l162_c3_e46d_return_output;
     VAR_fg_vram_update_uxn_c_l160_c19_97d2_write_value := VAR_MUX_uxn_c_l163_c3_3fd8_return_output;
     -- bg_vram_update[uxn_c_l153_c19_75bb] LATENCY=0
     -- Clock enable
     bg_vram_update_uxn_c_l153_c19_75bb_CLOCK_ENABLE <= VAR_bg_vram_update_uxn_c_l153_c19_75bb_CLOCK_ENABLE;
     -- Inputs
     bg_vram_update_uxn_c_l153_c19_75bb_read_address <= VAR_bg_vram_update_uxn_c_l153_c19_75bb_read_address;
     bg_vram_update_uxn_c_l153_c19_75bb_write_address <= VAR_bg_vram_update_uxn_c_l153_c19_75bb_write_address;
     bg_vram_update_uxn_c_l153_c19_75bb_write_value <= VAR_bg_vram_update_uxn_c_l153_c19_75bb_write_value;
     bg_vram_update_uxn_c_l153_c19_75bb_write_enable <= VAR_bg_vram_update_uxn_c_l153_c19_75bb_write_enable;
     -- Outputs
     VAR_bg_vram_update_uxn_c_l153_c19_75bb_return_output := bg_vram_update_uxn_c_l153_c19_75bb_return_output;

     -- fg_vram_update[uxn_c_l160_c19_97d2] LATENCY=0
     -- Clock enable
     fg_vram_update_uxn_c_l160_c19_97d2_CLOCK_ENABLE <= VAR_fg_vram_update_uxn_c_l160_c19_97d2_CLOCK_ENABLE;
     -- Inputs
     fg_vram_update_uxn_c_l160_c19_97d2_read_address <= VAR_fg_vram_update_uxn_c_l160_c19_97d2_read_address;
     fg_vram_update_uxn_c_l160_c19_97d2_write_address <= VAR_fg_vram_update_uxn_c_l160_c19_97d2_write_address;
     fg_vram_update_uxn_c_l160_c19_97d2_write_value <= VAR_fg_vram_update_uxn_c_l160_c19_97d2_write_value;
     fg_vram_update_uxn_c_l160_c19_97d2_write_enable <= VAR_fg_vram_update_uxn_c_l160_c19_97d2_write_enable;
     -- Outputs
     VAR_fg_vram_update_uxn_c_l160_c19_97d2_return_output := fg_vram_update_uxn_c_l160_c19_97d2_return_output;

     -- Submodule level 15
     VAR_MUX_uxn_c_l175_c17_0e53_iftrue := VAR_bg_vram_update_uxn_c_l153_c19_75bb_return_output;
     REG_VAR_bg_pixel_color := VAR_bg_vram_update_uxn_c_l153_c19_75bb_return_output;
     VAR_BIN_OP_EQ_uxn_c_l175_c17_a2da_left := VAR_fg_vram_update_uxn_c_l160_c19_97d2_return_output;
     VAR_MUX_uxn_c_l175_c17_0e53_iffalse := VAR_fg_vram_update_uxn_c_l160_c19_97d2_return_output;
     REG_VAR_fg_pixel_color := VAR_fg_vram_update_uxn_c_l160_c19_97d2_return_output;
     -- BIN_OP_EQ[uxn_c_l175_c17_a2da] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l175_c17_a2da_left <= VAR_BIN_OP_EQ_uxn_c_l175_c17_a2da_left;
     BIN_OP_EQ_uxn_c_l175_c17_a2da_right <= VAR_BIN_OP_EQ_uxn_c_l175_c17_a2da_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l175_c17_a2da_return_output := BIN_OP_EQ_uxn_c_l175_c17_a2da_return_output;

     -- Submodule level 16
     VAR_MUX_uxn_c_l175_c17_0e53_cond := VAR_BIN_OP_EQ_uxn_c_l175_c17_a2da_return_output;
     -- MUX[uxn_c_l175_c17_0e53] LATENCY=0
     -- Inputs
     MUX_uxn_c_l175_c17_0e53_cond <= VAR_MUX_uxn_c_l175_c17_0e53_cond;
     MUX_uxn_c_l175_c17_0e53_iftrue <= VAR_MUX_uxn_c_l175_c17_0e53_iftrue;
     MUX_uxn_c_l175_c17_0e53_iffalse <= VAR_MUX_uxn_c_l175_c17_0e53_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l175_c17_0e53_return_output := MUX_uxn_c_l175_c17_0e53_return_output;

     -- Submodule level 17
     -- CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_6984_uxn_c_l104_l178_DUPLICATE_ff85 LATENCY=0
     VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_6984_uxn_c_l104_l178_DUPLICATE_ff85_return_output := CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_6984(
     VAR_MUX_uxn_c_l175_c17_0e53_return_output,
     VAR_MUX_uxn_c_l142_c19_1c39_return_output);

     -- Submodule level 18
     REG_VAR_result := VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_6984_uxn_c_l104_l178_DUPLICATE_ff85_return_output;
     VAR_return_output := VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_6984_uxn_c_l104_l178_DUPLICATE_ff85_return_output;
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
