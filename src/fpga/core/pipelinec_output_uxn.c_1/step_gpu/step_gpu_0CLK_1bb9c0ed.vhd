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
-- CONST_SR_28[uxn_c_l126_c24_8518]
signal CONST_SR_28_uxn_c_l126_c24_8518_x : unsigned(31 downto 0);
signal CONST_SR_28_uxn_c_l126_c24_8518_return_output : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_c_l127_c17_b9d8]
signal BIN_OP_EQ_uxn_c_l127_c17_b9d8_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l127_c17_b9d8_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l127_c17_b9d8_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l127_c17_614b]
signal MUX_uxn_c_l127_c17_614b_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l127_c17_614b_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l127_c17_614b_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l127_c17_614b_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_c_l130_c22_a720]
signal UNARY_OP_NOT_uxn_c_l130_c22_a720_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l130_c22_a720_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l130_c6_38ac]
signal BIN_OP_AND_uxn_c_l130_c6_38ac_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l130_c6_38ac_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l130_c6_38ac_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l130_c1_9fd4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l130_c1_9fd4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l130_c1_9fd4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l130_c1_9fd4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l130_c1_9fd4_return_output : unsigned(0 downto 0);

-- fill_x1_MUX[uxn_c_l130_c2_0242]
signal fill_x1_MUX_uxn_c_l130_c2_0242_cond : unsigned(0 downto 0);
signal fill_x1_MUX_uxn_c_l130_c2_0242_iftrue : unsigned(15 downto 0);
signal fill_x1_MUX_uxn_c_l130_c2_0242_iffalse : unsigned(15 downto 0);
signal fill_x1_MUX_uxn_c_l130_c2_0242_return_output : unsigned(15 downto 0);

-- fill_x0_MUX[uxn_c_l130_c2_0242]
signal fill_x0_MUX_uxn_c_l130_c2_0242_cond : unsigned(0 downto 0);
signal fill_x0_MUX_uxn_c_l130_c2_0242_iftrue : unsigned(15 downto 0);
signal fill_x0_MUX_uxn_c_l130_c2_0242_iffalse : unsigned(15 downto 0);
signal fill_x0_MUX_uxn_c_l130_c2_0242_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_c_l130_c2_0242]
signal x_MUX_uxn_c_l130_c2_0242_cond : unsigned(0 downto 0);
signal x_MUX_uxn_c_l130_c2_0242_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_c_l130_c2_0242_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_c_l130_c2_0242_return_output : unsigned(15 downto 0);

-- is_fill_top_MUX[uxn_c_l130_c2_0242]
signal is_fill_top_MUX_uxn_c_l130_c2_0242_cond : unsigned(0 downto 0);
signal is_fill_top_MUX_uxn_c_l130_c2_0242_iftrue : unsigned(0 downto 0);
signal is_fill_top_MUX_uxn_c_l130_c2_0242_iffalse : unsigned(0 downto 0);
signal is_fill_top_MUX_uxn_c_l130_c2_0242_return_output : unsigned(0 downto 0);

-- fill_layer_MUX[uxn_c_l130_c2_0242]
signal fill_layer_MUX_uxn_c_l130_c2_0242_cond : unsigned(0 downto 0);
signal fill_layer_MUX_uxn_c_l130_c2_0242_iftrue : unsigned(0 downto 0);
signal fill_layer_MUX_uxn_c_l130_c2_0242_iffalse : unsigned(0 downto 0);
signal fill_layer_MUX_uxn_c_l130_c2_0242_return_output : unsigned(0 downto 0);

-- is_fill_active_MUX[uxn_c_l130_c2_0242]
signal is_fill_active_MUX_uxn_c_l130_c2_0242_cond : unsigned(0 downto 0);
signal is_fill_active_MUX_uxn_c_l130_c2_0242_iftrue : unsigned(0 downto 0);
signal is_fill_active_MUX_uxn_c_l130_c2_0242_iffalse : unsigned(0 downto 0);
signal is_fill_active_MUX_uxn_c_l130_c2_0242_return_output : unsigned(0 downto 0);

-- fill_y1_MUX[uxn_c_l130_c2_0242]
signal fill_y1_MUX_uxn_c_l130_c2_0242_cond : unsigned(0 downto 0);
signal fill_y1_MUX_uxn_c_l130_c2_0242_iftrue : unsigned(15 downto 0);
signal fill_y1_MUX_uxn_c_l130_c2_0242_iffalse : unsigned(15 downto 0);
signal fill_y1_MUX_uxn_c_l130_c2_0242_return_output : unsigned(15 downto 0);

-- fill_color_MUX[uxn_c_l130_c2_0242]
signal fill_color_MUX_uxn_c_l130_c2_0242_cond : unsigned(0 downto 0);
signal fill_color_MUX_uxn_c_l130_c2_0242_iftrue : unsigned(1 downto 0);
signal fill_color_MUX_uxn_c_l130_c2_0242_iffalse : unsigned(1 downto 0);
signal fill_color_MUX_uxn_c_l130_c2_0242_return_output : unsigned(1 downto 0);

-- y_MUX[uxn_c_l130_c2_0242]
signal y_MUX_uxn_c_l130_c2_0242_cond : unsigned(0 downto 0);
signal y_MUX_uxn_c_l130_c2_0242_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_c_l130_c2_0242_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_c_l130_c2_0242_return_output : unsigned(15 downto 0);

-- fill_pixels_remaining_MUX[uxn_c_l130_c2_0242]
signal fill_pixels_remaining_MUX_uxn_c_l130_c2_0242_cond : unsigned(0 downto 0);
signal fill_pixels_remaining_MUX_uxn_c_l130_c2_0242_iftrue : unsigned(31 downto 0);
signal fill_pixels_remaining_MUX_uxn_c_l130_c2_0242_iffalse : unsigned(31 downto 0);
signal fill_pixels_remaining_MUX_uxn_c_l130_c2_0242_return_output : unsigned(31 downto 0);

-- fill_y0_MUX[uxn_c_l130_c2_0242]
signal fill_y0_MUX_uxn_c_l130_c2_0242_cond : unsigned(0 downto 0);
signal fill_y0_MUX_uxn_c_l130_c2_0242_iftrue : unsigned(15 downto 0);
signal fill_y0_MUX_uxn_c_l130_c2_0242_iffalse : unsigned(15 downto 0);
signal fill_y0_MUX_uxn_c_l130_c2_0242_return_output : unsigned(15 downto 0);

-- CONST_SR_20[uxn_c_l132_c18_4966]
signal CONST_SR_20_uxn_c_l132_c18_4966_x : unsigned(31 downto 0);
signal CONST_SR_20_uxn_c_l132_c18_4966_return_output : unsigned(31 downto 0);

-- CONST_SR_21[uxn_c_l133_c17_728c]
signal CONST_SR_21_uxn_c_l133_c17_728c_x : unsigned(31 downto 0);
signal CONST_SR_21_uxn_c_l133_c17_728c_return_output : unsigned(31 downto 0);

-- BIN_OP_AND[uxn_c_l134_c27_ad8c]
signal BIN_OP_AND_uxn_c_l134_c27_ad8c_left : unsigned(31 downto 0);
signal BIN_OP_AND_uxn_c_l134_c27_ad8c_right : unsigned(17 downto 0);
signal BIN_OP_AND_uxn_c_l134_c27_ad8c_return_output : unsigned(31 downto 0);

-- BIN_OP_DIV[uxn_c_l135_c13_12ff]
signal BIN_OP_DIV_uxn_c_l135_c13_12ff_left : unsigned(31 downto 0);
signal BIN_OP_DIV_uxn_c_l135_c13_12ff_right : unsigned(8 downto 0);
signal BIN_OP_DIV_uxn_c_l135_c13_12ff_return_output : unsigned(31 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_c_l136_c38_8b08]
signal BIN_OP_INFERRED_MULT_uxn_c_l136_c38_8b08_left : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_c_l136_c38_8b08_right : unsigned(8 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_c_l136_c38_8b08_return_output : unsigned(24 downto 0);

-- BIN_OP_MINUS[uxn_c_l136_c13_775a]
signal BIN_OP_MINUS_uxn_c_l136_c13_775a_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_uxn_c_l136_c13_775a_right : unsigned(24 downto 0);
signal BIN_OP_MINUS_uxn_c_l136_c13_775a_return_output : unsigned(31 downto 0);

-- MUX[uxn_c_l137_c13_36ea]
signal MUX_uxn_c_l137_c13_36ea_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l137_c13_36ea_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l137_c13_36ea_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l137_c13_36ea_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l138_c13_07bb]
signal MUX_uxn_c_l138_c13_07bb_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l138_c13_07bb_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l138_c13_07bb_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l138_c13_07bb_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l139_c13_d52b]
signal MUX_uxn_c_l139_c13_d52b_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l139_c13_d52b_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l139_c13_d52b_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l139_c13_d52b_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l140_c13_ba83]
signal MUX_uxn_c_l140_c13_ba83_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l140_c13_ba83_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l140_c13_ba83_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l140_c13_ba83_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_c_l143_c28_9ac0]
signal BIN_OP_MINUS_uxn_c_l143_c28_9ac0_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_c_l143_c28_9ac0_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_c_l143_c28_9ac0_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_c_l143_c50_6e4d]
signal BIN_OP_MINUS_uxn_c_l143_c50_6e4d_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_c_l143_c50_6e4d_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_c_l143_c50_6e4d_return_output : unsigned(15 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_c_l143_c28_1e64]
signal BIN_OP_INFERRED_MULT_uxn_c_l143_c28_1e64_left : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_c_l143_c28_1e64_right : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_c_l143_c28_1e64_return_output : unsigned(31 downto 0);

-- printf_uxn_c_l146_c3_6f7c[uxn_c_l146_c3_6f7c]
signal printf_uxn_c_l146_c3_6f7c_uxn_c_l146_c3_6f7c_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_c_l146_c3_6f7c_uxn_c_l146_c3_6f7c_arg0 : unsigned(31 downto 0);
signal printf_uxn_c_l146_c3_6f7c_uxn_c_l146_c3_6f7c_arg1 : unsigned(31 downto 0);
signal printf_uxn_c_l146_c3_6f7c_uxn_c_l146_c3_6f7c_arg2 : unsigned(31 downto 0);
signal printf_uxn_c_l146_c3_6f7c_uxn_c_l146_c3_6f7c_arg3 : unsigned(31 downto 0);
signal printf_uxn_c_l146_c3_6f7c_uxn_c_l146_c3_6f7c_arg4 : unsigned(31 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_c_l149_c45_b69d]
signal BIN_OP_INFERRED_MULT_uxn_c_l149_c45_b69d_left : unsigned(31 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_c_l149_c45_b69d_right : unsigned(31 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_c_l149_c45_b69d_return_output : unsigned(63 downto 0);

-- BIN_OP_PLUS[uxn_c_l149_c45_a1df]
signal BIN_OP_PLUS_uxn_c_l149_c45_a1df_left : unsigned(63 downto 0);
signal BIN_OP_PLUS_uxn_c_l149_c45_a1df_right : unsigned(31 downto 0);
signal BIN_OP_PLUS_uxn_c_l149_c45_a1df_return_output : unsigned(64 downto 0);

-- BIN_OP_AND[uxn_c_l149_c99_ad57]
signal BIN_OP_AND_uxn_c_l149_c99_ad57_left : unsigned(31 downto 0);
signal BIN_OP_AND_uxn_c_l149_c99_ad57_right : unsigned(17 downto 0);
signal BIN_OP_AND_uxn_c_l149_c99_ad57_return_output : unsigned(31 downto 0);

-- MUX[uxn_c_l149_c26_92b4]
signal MUX_uxn_c_l149_c26_92b4_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l149_c26_92b4_iftrue : unsigned(31 downto 0);
signal MUX_uxn_c_l149_c26_92b4_iffalse : unsigned(31 downto 0);
signal MUX_uxn_c_l149_c26_92b4_return_output : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_c_l151_c18_1d24]
signal BIN_OP_EQ_uxn_c_l151_c18_1d24_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l151_c18_1d24_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l151_c18_1d24_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l151_c18_a19a]
signal MUX_uxn_c_l151_c18_a19a_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l151_c18_a19a_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l151_c18_a19a_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l151_c18_a19a_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l152_c22_fd9e]
signal BIN_OP_PLUS_uxn_c_l152_c22_fd9e_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l152_c22_fd9e_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l152_c22_fd9e_return_output : unsigned(16 downto 0);

-- MUX[uxn_c_l152_c6_7663]
signal MUX_uxn_c_l152_c6_7663_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l152_c6_7663_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l152_c6_7663_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l152_c6_7663_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_c_l153_c31_6321]
signal BIN_OP_PLUS_uxn_c_l153_c31_6321_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l153_c31_6321_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l153_c31_6321_return_output : unsigned(16 downto 0);

-- MUX[uxn_c_l153_c6_afd9]
signal MUX_uxn_c_l153_c6_afd9_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l153_c6_afd9_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l153_c6_afd9_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l153_c6_afd9_return_output : unsigned(15 downto 0);

-- UNARY_OP_NOT[uxn_c_l155_c38_6929]
signal UNARY_OP_NOT_uxn_c_l155_c38_6929_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l155_c38_6929_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l155_c19_d727]
signal BIN_OP_AND_uxn_c_l155_c19_d727_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l155_c19_d727_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l155_c19_d727_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l156_c19_607b]
signal BIN_OP_AND_uxn_c_l156_c19_607b_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l156_c19_607b_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l156_c19_607b_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l161_c3_f586]
signal MUX_uxn_c_l161_c3_f586_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l161_c3_f586_iftrue : unsigned(1 downto 0);
signal MUX_uxn_c_l161_c3_f586_iffalse : unsigned(1 downto 0);
signal MUX_uxn_c_l161_c3_f586_return_output : unsigned(1 downto 0);

-- UNARY_OP_NOT[uxn_c_l162_c57_57d0]
signal UNARY_OP_NOT_uxn_c_l162_c57_57d0_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l162_c57_57d0_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l162_c22_3b54]
signal BIN_OP_AND_uxn_c_l162_c22_3b54_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l162_c22_3b54_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l162_c22_3b54_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_c_l162_c3_6426]
signal BIN_OP_OR_uxn_c_l162_c3_6426_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l162_c3_6426_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l162_c3_6426_return_output : unsigned(0 downto 0);

-- bg_vram_update[uxn_c_l158_c19_442b]
signal bg_vram_update_uxn_c_l158_c19_442b_CLOCK_ENABLE : unsigned(0 downto 0);
signal bg_vram_update_uxn_c_l158_c19_442b_read_address : unsigned(31 downto 0);
signal bg_vram_update_uxn_c_l158_c19_442b_write_address : unsigned(31 downto 0);
signal bg_vram_update_uxn_c_l158_c19_442b_write_value : unsigned(1 downto 0);
signal bg_vram_update_uxn_c_l158_c19_442b_write_enable : unsigned(0 downto 0);
signal bg_vram_update_uxn_c_l158_c19_442b_return_output : unsigned(1 downto 0);

-- MUX[uxn_c_l168_c3_4137]
signal MUX_uxn_c_l168_c3_4137_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l168_c3_4137_iftrue : unsigned(1 downto 0);
signal MUX_uxn_c_l168_c3_4137_iffalse : unsigned(1 downto 0);
signal MUX_uxn_c_l168_c3_4137_return_output : unsigned(1 downto 0);

-- BIN_OP_AND[uxn_c_l169_c22_ad2f]
signal BIN_OP_AND_uxn_c_l169_c22_ad2f_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l169_c22_ad2f_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l169_c22_ad2f_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_c_l169_c3_7aa2]
signal BIN_OP_OR_uxn_c_l169_c3_7aa2_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l169_c3_7aa2_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l169_c3_7aa2_return_output : unsigned(0 downto 0);

-- fg_vram_update[uxn_c_l165_c19_2037]
signal fg_vram_update_uxn_c_l165_c19_2037_CLOCK_ENABLE : unsigned(0 downto 0);
signal fg_vram_update_uxn_c_l165_c19_2037_read_address : unsigned(31 downto 0);
signal fg_vram_update_uxn_c_l165_c19_2037_write_address : unsigned(31 downto 0);
signal fg_vram_update_uxn_c_l165_c19_2037_write_value : unsigned(1 downto 0);
signal fg_vram_update_uxn_c_l165_c19_2037_write_enable : unsigned(0 downto 0);
signal fg_vram_update_uxn_c_l165_c19_2037_return_output : unsigned(1 downto 0);

-- BIN_OP_MINUS[uxn_c_l172_c43_9a92]
signal BIN_OP_MINUS_uxn_c_l172_c43_9a92_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_uxn_c_l172_c43_9a92_right : unsigned(0 downto 0);
signal BIN_OP_MINUS_uxn_c_l172_c43_9a92_return_output : unsigned(31 downto 0);

-- MUX[uxn_c_l172_c26_3402]
signal MUX_uxn_c_l172_c26_3402_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l172_c26_3402_iftrue : unsigned(31 downto 0);
signal MUX_uxn_c_l172_c26_3402_iffalse : unsigned(31 downto 0);
signal MUX_uxn_c_l172_c26_3402_return_output : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_c_l173_c19_47ad]
signal BIN_OP_EQ_uxn_c_l173_c19_47ad_left : unsigned(31 downto 0);
signal BIN_OP_EQ_uxn_c_l173_c19_47ad_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l173_c19_47ad_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l173_c19_ed87]
signal MUX_uxn_c_l173_c19_ed87_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l173_c19_ed87_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l173_c19_ed87_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l173_c19_ed87_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l174_c19_180b]
signal BIN_OP_EQ_uxn_c_l174_c19_180b_left : unsigned(31 downto 0);
signal BIN_OP_EQ_uxn_c_l174_c19_180b_right : unsigned(17 downto 0);
signal BIN_OP_EQ_uxn_c_l174_c19_180b_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l174_c77_393a]
signal BIN_OP_PLUS_uxn_c_l174_c77_393a_left : unsigned(31 downto 0);
signal BIN_OP_PLUS_uxn_c_l174_c77_393a_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l174_c77_393a_return_output : unsigned(32 downto 0);

-- MUX[uxn_c_l174_c51_14c9]
signal MUX_uxn_c_l174_c51_14c9_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l174_c51_14c9_iftrue : unsigned(31 downto 0);
signal MUX_uxn_c_l174_c51_14c9_iffalse : unsigned(31 downto 0);
signal MUX_uxn_c_l174_c51_14c9_return_output : unsigned(31 downto 0);

-- MUX[uxn_c_l174_c19_b556]
signal MUX_uxn_c_l174_c19_b556_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l174_c19_b556_iftrue : unsigned(31 downto 0);
signal MUX_uxn_c_l174_c19_b556_iffalse : unsigned(31 downto 0);
signal MUX_uxn_c_l174_c19_b556_return_output : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_c_l175_c25_52f3]
signal BIN_OP_EQ_uxn_c_l175_c25_52f3_left : unsigned(31 downto 0);
signal BIN_OP_EQ_uxn_c_l175_c25_52f3_right : unsigned(17 downto 0);
signal BIN_OP_EQ_uxn_c_l175_c25_52f3_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l175_c25_4827]
signal MUX_uxn_c_l175_c25_4827_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l175_c25_4827_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l175_c25_4827_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l175_c25_4827_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l176_c17_2bb5]
signal BIN_OP_EQ_uxn_c_l176_c17_2bb5_left : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l176_c17_2bb5_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l176_c17_2bb5_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l176_c17_5d07]
signal MUX_uxn_c_l176_c17_5d07_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l176_c17_5d07_iftrue : unsigned(1 downto 0);
signal MUX_uxn_c_l176_c17_5d07_iffalse : unsigned(1 downto 0);
signal MUX_uxn_c_l176_c17_5d07_return_output : unsigned(1 downto 0);

-- UNARY_OP_NOT_uint1_t_uxn_c_l162_l169_DUPLICATE_fb79
signal UNARY_OP_NOT_uint1_t_uxn_c_l162_l169_DUPLICATE_fb79_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uint1_t_uxn_c_l162_l169_DUPLICATE_fb79_return_output : unsigned(0 downto 0);

-- BIN_OP_AND_uint1_t_uint1_t_uxn_c_l169_l162_DUPLICATE_72e0
signal BIN_OP_AND_uint1_t_uint1_t_uxn_c_l169_l162_DUPLICATE_72e0_left : unsigned(0 downto 0);
signal BIN_OP_AND_uint1_t_uint1_t_uxn_c_l169_l162_DUPLICATE_72e0_right : unsigned(0 downto 0);
signal BIN_OP_AND_uint1_t_uint1_t_uxn_c_l169_l162_DUPLICATE_72e0_return_output : unsigned(0 downto 0);

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
-- CONST_SR_28_uxn_c_l126_c24_8518
CONST_SR_28_uxn_c_l126_c24_8518 : entity work.CONST_SR_28_uint32_t_0CLK_de264c78 port map (
CONST_SR_28_uxn_c_l126_c24_8518_x,
CONST_SR_28_uxn_c_l126_c24_8518_return_output);

-- BIN_OP_EQ_uxn_c_l127_c17_b9d8
BIN_OP_EQ_uxn_c_l127_c17_b9d8 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l127_c17_b9d8_left,
BIN_OP_EQ_uxn_c_l127_c17_b9d8_right,
BIN_OP_EQ_uxn_c_l127_c17_b9d8_return_output);

-- MUX_uxn_c_l127_c17_614b
MUX_uxn_c_l127_c17_614b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l127_c17_614b_cond,
MUX_uxn_c_l127_c17_614b_iftrue,
MUX_uxn_c_l127_c17_614b_iffalse,
MUX_uxn_c_l127_c17_614b_return_output);

-- UNARY_OP_NOT_uxn_c_l130_c22_a720
UNARY_OP_NOT_uxn_c_l130_c22_a720 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l130_c22_a720_expr,
UNARY_OP_NOT_uxn_c_l130_c22_a720_return_output);

-- BIN_OP_AND_uxn_c_l130_c6_38ac
BIN_OP_AND_uxn_c_l130_c6_38ac : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l130_c6_38ac_left,
BIN_OP_AND_uxn_c_l130_c6_38ac_right,
BIN_OP_AND_uxn_c_l130_c6_38ac_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l130_c1_9fd4
TRUE_CLOCK_ENABLE_MUX_uxn_c_l130_c1_9fd4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l130_c1_9fd4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l130_c1_9fd4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l130_c1_9fd4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l130_c1_9fd4_return_output);

-- fill_x1_MUX_uxn_c_l130_c2_0242
fill_x1_MUX_uxn_c_l130_c2_0242 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_x1_MUX_uxn_c_l130_c2_0242_cond,
fill_x1_MUX_uxn_c_l130_c2_0242_iftrue,
fill_x1_MUX_uxn_c_l130_c2_0242_iffalse,
fill_x1_MUX_uxn_c_l130_c2_0242_return_output);

-- fill_x0_MUX_uxn_c_l130_c2_0242
fill_x0_MUX_uxn_c_l130_c2_0242 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_x0_MUX_uxn_c_l130_c2_0242_cond,
fill_x0_MUX_uxn_c_l130_c2_0242_iftrue,
fill_x0_MUX_uxn_c_l130_c2_0242_iffalse,
fill_x0_MUX_uxn_c_l130_c2_0242_return_output);

-- x_MUX_uxn_c_l130_c2_0242
x_MUX_uxn_c_l130_c2_0242 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_c_l130_c2_0242_cond,
x_MUX_uxn_c_l130_c2_0242_iftrue,
x_MUX_uxn_c_l130_c2_0242_iffalse,
x_MUX_uxn_c_l130_c2_0242_return_output);

-- is_fill_top_MUX_uxn_c_l130_c2_0242
is_fill_top_MUX_uxn_c_l130_c2_0242 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_top_MUX_uxn_c_l130_c2_0242_cond,
is_fill_top_MUX_uxn_c_l130_c2_0242_iftrue,
is_fill_top_MUX_uxn_c_l130_c2_0242_iffalse,
is_fill_top_MUX_uxn_c_l130_c2_0242_return_output);

-- fill_layer_MUX_uxn_c_l130_c2_0242
fill_layer_MUX_uxn_c_l130_c2_0242 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
fill_layer_MUX_uxn_c_l130_c2_0242_cond,
fill_layer_MUX_uxn_c_l130_c2_0242_iftrue,
fill_layer_MUX_uxn_c_l130_c2_0242_iffalse,
fill_layer_MUX_uxn_c_l130_c2_0242_return_output);

-- is_fill_active_MUX_uxn_c_l130_c2_0242
is_fill_active_MUX_uxn_c_l130_c2_0242 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_active_MUX_uxn_c_l130_c2_0242_cond,
is_fill_active_MUX_uxn_c_l130_c2_0242_iftrue,
is_fill_active_MUX_uxn_c_l130_c2_0242_iffalse,
is_fill_active_MUX_uxn_c_l130_c2_0242_return_output);

-- fill_y1_MUX_uxn_c_l130_c2_0242
fill_y1_MUX_uxn_c_l130_c2_0242 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_y1_MUX_uxn_c_l130_c2_0242_cond,
fill_y1_MUX_uxn_c_l130_c2_0242_iftrue,
fill_y1_MUX_uxn_c_l130_c2_0242_iffalse,
fill_y1_MUX_uxn_c_l130_c2_0242_return_output);

-- fill_color_MUX_uxn_c_l130_c2_0242
fill_color_MUX_uxn_c_l130_c2_0242 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
fill_color_MUX_uxn_c_l130_c2_0242_cond,
fill_color_MUX_uxn_c_l130_c2_0242_iftrue,
fill_color_MUX_uxn_c_l130_c2_0242_iffalse,
fill_color_MUX_uxn_c_l130_c2_0242_return_output);

-- y_MUX_uxn_c_l130_c2_0242
y_MUX_uxn_c_l130_c2_0242 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_c_l130_c2_0242_cond,
y_MUX_uxn_c_l130_c2_0242_iftrue,
y_MUX_uxn_c_l130_c2_0242_iffalse,
y_MUX_uxn_c_l130_c2_0242_return_output);

-- fill_pixels_remaining_MUX_uxn_c_l130_c2_0242
fill_pixels_remaining_MUX_uxn_c_l130_c2_0242 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
fill_pixels_remaining_MUX_uxn_c_l130_c2_0242_cond,
fill_pixels_remaining_MUX_uxn_c_l130_c2_0242_iftrue,
fill_pixels_remaining_MUX_uxn_c_l130_c2_0242_iffalse,
fill_pixels_remaining_MUX_uxn_c_l130_c2_0242_return_output);

-- fill_y0_MUX_uxn_c_l130_c2_0242
fill_y0_MUX_uxn_c_l130_c2_0242 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_y0_MUX_uxn_c_l130_c2_0242_cond,
fill_y0_MUX_uxn_c_l130_c2_0242_iftrue,
fill_y0_MUX_uxn_c_l130_c2_0242_iffalse,
fill_y0_MUX_uxn_c_l130_c2_0242_return_output);

-- CONST_SR_20_uxn_c_l132_c18_4966
CONST_SR_20_uxn_c_l132_c18_4966 : entity work.CONST_SR_20_uint32_t_0CLK_de264c78 port map (
CONST_SR_20_uxn_c_l132_c18_4966_x,
CONST_SR_20_uxn_c_l132_c18_4966_return_output);

-- CONST_SR_21_uxn_c_l133_c17_728c
CONST_SR_21_uxn_c_l133_c17_728c : entity work.CONST_SR_21_uint32_t_0CLK_de264c78 port map (
CONST_SR_21_uxn_c_l133_c17_728c_x,
CONST_SR_21_uxn_c_l133_c17_728c_return_output);

-- BIN_OP_AND_uxn_c_l134_c27_ad8c
BIN_OP_AND_uxn_c_l134_c27_ad8c : entity work.BIN_OP_AND_uint32_t_uint18_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l134_c27_ad8c_left,
BIN_OP_AND_uxn_c_l134_c27_ad8c_right,
BIN_OP_AND_uxn_c_l134_c27_ad8c_return_output);

-- BIN_OP_DIV_uxn_c_l135_c13_12ff
BIN_OP_DIV_uxn_c_l135_c13_12ff : entity work.BIN_OP_DIV_uint32_t_uint9_t_0CLK_422b4ffb port map (
BIN_OP_DIV_uxn_c_l135_c13_12ff_left,
BIN_OP_DIV_uxn_c_l135_c13_12ff_right,
BIN_OP_DIV_uxn_c_l135_c13_12ff_return_output);

-- BIN_OP_INFERRED_MULT_uxn_c_l136_c38_8b08
BIN_OP_INFERRED_MULT_uxn_c_l136_c38_8b08 : entity work.BIN_OP_INFERRED_MULT_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_c_l136_c38_8b08_left,
BIN_OP_INFERRED_MULT_uxn_c_l136_c38_8b08_right,
BIN_OP_INFERRED_MULT_uxn_c_l136_c38_8b08_return_output);

-- BIN_OP_MINUS_uxn_c_l136_c13_775a
BIN_OP_MINUS_uxn_c_l136_c13_775a : entity work.BIN_OP_MINUS_uint32_t_uint25_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l136_c13_775a_left,
BIN_OP_MINUS_uxn_c_l136_c13_775a_right,
BIN_OP_MINUS_uxn_c_l136_c13_775a_return_output);

-- MUX_uxn_c_l137_c13_36ea
MUX_uxn_c_l137_c13_36ea : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l137_c13_36ea_cond,
MUX_uxn_c_l137_c13_36ea_iftrue,
MUX_uxn_c_l137_c13_36ea_iffalse,
MUX_uxn_c_l137_c13_36ea_return_output);

-- MUX_uxn_c_l138_c13_07bb
MUX_uxn_c_l138_c13_07bb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l138_c13_07bb_cond,
MUX_uxn_c_l138_c13_07bb_iftrue,
MUX_uxn_c_l138_c13_07bb_iffalse,
MUX_uxn_c_l138_c13_07bb_return_output);

-- MUX_uxn_c_l139_c13_d52b
MUX_uxn_c_l139_c13_d52b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l139_c13_d52b_cond,
MUX_uxn_c_l139_c13_d52b_iftrue,
MUX_uxn_c_l139_c13_d52b_iffalse,
MUX_uxn_c_l139_c13_d52b_return_output);

-- MUX_uxn_c_l140_c13_ba83
MUX_uxn_c_l140_c13_ba83 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l140_c13_ba83_cond,
MUX_uxn_c_l140_c13_ba83_iftrue,
MUX_uxn_c_l140_c13_ba83_iffalse,
MUX_uxn_c_l140_c13_ba83_return_output);

-- BIN_OP_MINUS_uxn_c_l143_c28_9ac0
BIN_OP_MINUS_uxn_c_l143_c28_9ac0 : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l143_c28_9ac0_left,
BIN_OP_MINUS_uxn_c_l143_c28_9ac0_right,
BIN_OP_MINUS_uxn_c_l143_c28_9ac0_return_output);

-- BIN_OP_MINUS_uxn_c_l143_c50_6e4d
BIN_OP_MINUS_uxn_c_l143_c50_6e4d : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l143_c50_6e4d_left,
BIN_OP_MINUS_uxn_c_l143_c50_6e4d_right,
BIN_OP_MINUS_uxn_c_l143_c50_6e4d_return_output);

-- BIN_OP_INFERRED_MULT_uxn_c_l143_c28_1e64
BIN_OP_INFERRED_MULT_uxn_c_l143_c28_1e64 : entity work.BIN_OP_INFERRED_MULT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_c_l143_c28_1e64_left,
BIN_OP_INFERRED_MULT_uxn_c_l143_c28_1e64_right,
BIN_OP_INFERRED_MULT_uxn_c_l143_c28_1e64_return_output);

-- printf_uxn_c_l146_c3_6f7c_uxn_c_l146_c3_6f7c
printf_uxn_c_l146_c3_6f7c_uxn_c_l146_c3_6f7c : entity work.printf_uxn_c_l146_c3_6f7c_0CLK_de264c78 port map (
printf_uxn_c_l146_c3_6f7c_uxn_c_l146_c3_6f7c_CLOCK_ENABLE,
printf_uxn_c_l146_c3_6f7c_uxn_c_l146_c3_6f7c_arg0,
printf_uxn_c_l146_c3_6f7c_uxn_c_l146_c3_6f7c_arg1,
printf_uxn_c_l146_c3_6f7c_uxn_c_l146_c3_6f7c_arg2,
printf_uxn_c_l146_c3_6f7c_uxn_c_l146_c3_6f7c_arg3,
printf_uxn_c_l146_c3_6f7c_uxn_c_l146_c3_6f7c_arg4);

-- BIN_OP_INFERRED_MULT_uxn_c_l149_c45_b69d
BIN_OP_INFERRED_MULT_uxn_c_l149_c45_b69d : entity work.BIN_OP_INFERRED_MULT_uint32_t_uint32_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_c_l149_c45_b69d_left,
BIN_OP_INFERRED_MULT_uxn_c_l149_c45_b69d_right,
BIN_OP_INFERRED_MULT_uxn_c_l149_c45_b69d_return_output);

-- BIN_OP_PLUS_uxn_c_l149_c45_a1df
BIN_OP_PLUS_uxn_c_l149_c45_a1df : entity work.BIN_OP_PLUS_uint64_t_uint32_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l149_c45_a1df_left,
BIN_OP_PLUS_uxn_c_l149_c45_a1df_right,
BIN_OP_PLUS_uxn_c_l149_c45_a1df_return_output);

-- BIN_OP_AND_uxn_c_l149_c99_ad57
BIN_OP_AND_uxn_c_l149_c99_ad57 : entity work.BIN_OP_AND_uint32_t_uint18_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l149_c99_ad57_left,
BIN_OP_AND_uxn_c_l149_c99_ad57_right,
BIN_OP_AND_uxn_c_l149_c99_ad57_return_output);

-- MUX_uxn_c_l149_c26_92b4
MUX_uxn_c_l149_c26_92b4 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
MUX_uxn_c_l149_c26_92b4_cond,
MUX_uxn_c_l149_c26_92b4_iftrue,
MUX_uxn_c_l149_c26_92b4_iffalse,
MUX_uxn_c_l149_c26_92b4_return_output);

-- BIN_OP_EQ_uxn_c_l151_c18_1d24
BIN_OP_EQ_uxn_c_l151_c18_1d24 : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l151_c18_1d24_left,
BIN_OP_EQ_uxn_c_l151_c18_1d24_right,
BIN_OP_EQ_uxn_c_l151_c18_1d24_return_output);

-- MUX_uxn_c_l151_c18_a19a
MUX_uxn_c_l151_c18_a19a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l151_c18_a19a_cond,
MUX_uxn_c_l151_c18_a19a_iftrue,
MUX_uxn_c_l151_c18_a19a_iffalse,
MUX_uxn_c_l151_c18_a19a_return_output);

-- BIN_OP_PLUS_uxn_c_l152_c22_fd9e
BIN_OP_PLUS_uxn_c_l152_c22_fd9e : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l152_c22_fd9e_left,
BIN_OP_PLUS_uxn_c_l152_c22_fd9e_right,
BIN_OP_PLUS_uxn_c_l152_c22_fd9e_return_output);

-- MUX_uxn_c_l152_c6_7663
MUX_uxn_c_l152_c6_7663 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l152_c6_7663_cond,
MUX_uxn_c_l152_c6_7663_iftrue,
MUX_uxn_c_l152_c6_7663_iffalse,
MUX_uxn_c_l152_c6_7663_return_output);

-- BIN_OP_PLUS_uxn_c_l153_c31_6321
BIN_OP_PLUS_uxn_c_l153_c31_6321 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l153_c31_6321_left,
BIN_OP_PLUS_uxn_c_l153_c31_6321_right,
BIN_OP_PLUS_uxn_c_l153_c31_6321_return_output);

-- MUX_uxn_c_l153_c6_afd9
MUX_uxn_c_l153_c6_afd9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l153_c6_afd9_cond,
MUX_uxn_c_l153_c6_afd9_iftrue,
MUX_uxn_c_l153_c6_afd9_iffalse,
MUX_uxn_c_l153_c6_afd9_return_output);

-- UNARY_OP_NOT_uxn_c_l155_c38_6929
UNARY_OP_NOT_uxn_c_l155_c38_6929 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l155_c38_6929_expr,
UNARY_OP_NOT_uxn_c_l155_c38_6929_return_output);

-- BIN_OP_AND_uxn_c_l155_c19_d727
BIN_OP_AND_uxn_c_l155_c19_d727 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l155_c19_d727_left,
BIN_OP_AND_uxn_c_l155_c19_d727_right,
BIN_OP_AND_uxn_c_l155_c19_d727_return_output);

-- BIN_OP_AND_uxn_c_l156_c19_607b
BIN_OP_AND_uxn_c_l156_c19_607b : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l156_c19_607b_left,
BIN_OP_AND_uxn_c_l156_c19_607b_right,
BIN_OP_AND_uxn_c_l156_c19_607b_return_output);

-- MUX_uxn_c_l161_c3_f586
MUX_uxn_c_l161_c3_f586 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
MUX_uxn_c_l161_c3_f586_cond,
MUX_uxn_c_l161_c3_f586_iftrue,
MUX_uxn_c_l161_c3_f586_iffalse,
MUX_uxn_c_l161_c3_f586_return_output);

-- UNARY_OP_NOT_uxn_c_l162_c57_57d0
UNARY_OP_NOT_uxn_c_l162_c57_57d0 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l162_c57_57d0_expr,
UNARY_OP_NOT_uxn_c_l162_c57_57d0_return_output);

-- BIN_OP_AND_uxn_c_l162_c22_3b54
BIN_OP_AND_uxn_c_l162_c22_3b54 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l162_c22_3b54_left,
BIN_OP_AND_uxn_c_l162_c22_3b54_right,
BIN_OP_AND_uxn_c_l162_c22_3b54_return_output);

-- BIN_OP_OR_uxn_c_l162_c3_6426
BIN_OP_OR_uxn_c_l162_c3_6426 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l162_c3_6426_left,
BIN_OP_OR_uxn_c_l162_c3_6426_right,
BIN_OP_OR_uxn_c_l162_c3_6426_return_output);

-- bg_vram_update_uxn_c_l158_c19_442b
bg_vram_update_uxn_c_l158_c19_442b : entity work.bg_vram_update_0CLK_b45f1687 port map (
clk,
bg_vram_update_uxn_c_l158_c19_442b_CLOCK_ENABLE,
bg_vram_update_uxn_c_l158_c19_442b_read_address,
bg_vram_update_uxn_c_l158_c19_442b_write_address,
bg_vram_update_uxn_c_l158_c19_442b_write_value,
bg_vram_update_uxn_c_l158_c19_442b_write_enable,
bg_vram_update_uxn_c_l158_c19_442b_return_output);

-- MUX_uxn_c_l168_c3_4137
MUX_uxn_c_l168_c3_4137 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
MUX_uxn_c_l168_c3_4137_cond,
MUX_uxn_c_l168_c3_4137_iftrue,
MUX_uxn_c_l168_c3_4137_iffalse,
MUX_uxn_c_l168_c3_4137_return_output);

-- BIN_OP_AND_uxn_c_l169_c22_ad2f
BIN_OP_AND_uxn_c_l169_c22_ad2f : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l169_c22_ad2f_left,
BIN_OP_AND_uxn_c_l169_c22_ad2f_right,
BIN_OP_AND_uxn_c_l169_c22_ad2f_return_output);

-- BIN_OP_OR_uxn_c_l169_c3_7aa2
BIN_OP_OR_uxn_c_l169_c3_7aa2 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l169_c3_7aa2_left,
BIN_OP_OR_uxn_c_l169_c3_7aa2_right,
BIN_OP_OR_uxn_c_l169_c3_7aa2_return_output);

-- fg_vram_update_uxn_c_l165_c19_2037
fg_vram_update_uxn_c_l165_c19_2037 : entity work.fg_vram_update_0CLK_b45f1687 port map (
clk,
fg_vram_update_uxn_c_l165_c19_2037_CLOCK_ENABLE,
fg_vram_update_uxn_c_l165_c19_2037_read_address,
fg_vram_update_uxn_c_l165_c19_2037_write_address,
fg_vram_update_uxn_c_l165_c19_2037_write_value,
fg_vram_update_uxn_c_l165_c19_2037_write_enable,
fg_vram_update_uxn_c_l165_c19_2037_return_output);

-- BIN_OP_MINUS_uxn_c_l172_c43_9a92
BIN_OP_MINUS_uxn_c_l172_c43_9a92 : entity work.BIN_OP_MINUS_uint32_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l172_c43_9a92_left,
BIN_OP_MINUS_uxn_c_l172_c43_9a92_right,
BIN_OP_MINUS_uxn_c_l172_c43_9a92_return_output);

-- MUX_uxn_c_l172_c26_3402
MUX_uxn_c_l172_c26_3402 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
MUX_uxn_c_l172_c26_3402_cond,
MUX_uxn_c_l172_c26_3402_iftrue,
MUX_uxn_c_l172_c26_3402_iffalse,
MUX_uxn_c_l172_c26_3402_return_output);

-- BIN_OP_EQ_uxn_c_l173_c19_47ad
BIN_OP_EQ_uxn_c_l173_c19_47ad : entity work.BIN_OP_EQ_uint32_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l173_c19_47ad_left,
BIN_OP_EQ_uxn_c_l173_c19_47ad_right,
BIN_OP_EQ_uxn_c_l173_c19_47ad_return_output);

-- MUX_uxn_c_l173_c19_ed87
MUX_uxn_c_l173_c19_ed87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l173_c19_ed87_cond,
MUX_uxn_c_l173_c19_ed87_iftrue,
MUX_uxn_c_l173_c19_ed87_iffalse,
MUX_uxn_c_l173_c19_ed87_return_output);

-- BIN_OP_EQ_uxn_c_l174_c19_180b
BIN_OP_EQ_uxn_c_l174_c19_180b : entity work.BIN_OP_EQ_uint32_t_uint18_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l174_c19_180b_left,
BIN_OP_EQ_uxn_c_l174_c19_180b_right,
BIN_OP_EQ_uxn_c_l174_c19_180b_return_output);

-- BIN_OP_PLUS_uxn_c_l174_c77_393a
BIN_OP_PLUS_uxn_c_l174_c77_393a : entity work.BIN_OP_PLUS_uint32_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l174_c77_393a_left,
BIN_OP_PLUS_uxn_c_l174_c77_393a_right,
BIN_OP_PLUS_uxn_c_l174_c77_393a_return_output);

-- MUX_uxn_c_l174_c51_14c9
MUX_uxn_c_l174_c51_14c9 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
MUX_uxn_c_l174_c51_14c9_cond,
MUX_uxn_c_l174_c51_14c9_iftrue,
MUX_uxn_c_l174_c51_14c9_iffalse,
MUX_uxn_c_l174_c51_14c9_return_output);

-- MUX_uxn_c_l174_c19_b556
MUX_uxn_c_l174_c19_b556 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
MUX_uxn_c_l174_c19_b556_cond,
MUX_uxn_c_l174_c19_b556_iftrue,
MUX_uxn_c_l174_c19_b556_iffalse,
MUX_uxn_c_l174_c19_b556_return_output);

-- BIN_OP_EQ_uxn_c_l175_c25_52f3
BIN_OP_EQ_uxn_c_l175_c25_52f3 : entity work.BIN_OP_EQ_uint32_t_uint18_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l175_c25_52f3_left,
BIN_OP_EQ_uxn_c_l175_c25_52f3_right,
BIN_OP_EQ_uxn_c_l175_c25_52f3_return_output);

-- MUX_uxn_c_l175_c25_4827
MUX_uxn_c_l175_c25_4827 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l175_c25_4827_cond,
MUX_uxn_c_l175_c25_4827_iftrue,
MUX_uxn_c_l175_c25_4827_iffalse,
MUX_uxn_c_l175_c25_4827_return_output);

-- BIN_OP_EQ_uxn_c_l176_c17_2bb5
BIN_OP_EQ_uxn_c_l176_c17_2bb5 : entity work.BIN_OP_EQ_uint2_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l176_c17_2bb5_left,
BIN_OP_EQ_uxn_c_l176_c17_2bb5_right,
BIN_OP_EQ_uxn_c_l176_c17_2bb5_return_output);

-- MUX_uxn_c_l176_c17_5d07
MUX_uxn_c_l176_c17_5d07 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
MUX_uxn_c_l176_c17_5d07_cond,
MUX_uxn_c_l176_c17_5d07_iftrue,
MUX_uxn_c_l176_c17_5d07_iffalse,
MUX_uxn_c_l176_c17_5d07_return_output);

-- UNARY_OP_NOT_uint1_t_uxn_c_l162_l169_DUPLICATE_fb79
UNARY_OP_NOT_uint1_t_uxn_c_l162_l169_DUPLICATE_fb79 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uint1_t_uxn_c_l162_l169_DUPLICATE_fb79_expr,
UNARY_OP_NOT_uint1_t_uxn_c_l162_l169_DUPLICATE_fb79_return_output);

-- BIN_OP_AND_uint1_t_uint1_t_uxn_c_l169_l162_DUPLICATE_72e0
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l169_l162_DUPLICATE_72e0 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l169_l162_DUPLICATE_72e0_left,
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l169_l162_DUPLICATE_72e0_right,
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l169_l162_DUPLICATE_72e0_return_output);



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
 CONST_SR_28_uxn_c_l126_c24_8518_return_output,
 BIN_OP_EQ_uxn_c_l127_c17_b9d8_return_output,
 MUX_uxn_c_l127_c17_614b_return_output,
 UNARY_OP_NOT_uxn_c_l130_c22_a720_return_output,
 BIN_OP_AND_uxn_c_l130_c6_38ac_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l130_c1_9fd4_return_output,
 fill_x1_MUX_uxn_c_l130_c2_0242_return_output,
 fill_x0_MUX_uxn_c_l130_c2_0242_return_output,
 x_MUX_uxn_c_l130_c2_0242_return_output,
 is_fill_top_MUX_uxn_c_l130_c2_0242_return_output,
 fill_layer_MUX_uxn_c_l130_c2_0242_return_output,
 is_fill_active_MUX_uxn_c_l130_c2_0242_return_output,
 fill_y1_MUX_uxn_c_l130_c2_0242_return_output,
 fill_color_MUX_uxn_c_l130_c2_0242_return_output,
 y_MUX_uxn_c_l130_c2_0242_return_output,
 fill_pixels_remaining_MUX_uxn_c_l130_c2_0242_return_output,
 fill_y0_MUX_uxn_c_l130_c2_0242_return_output,
 CONST_SR_20_uxn_c_l132_c18_4966_return_output,
 CONST_SR_21_uxn_c_l133_c17_728c_return_output,
 BIN_OP_AND_uxn_c_l134_c27_ad8c_return_output,
 BIN_OP_DIV_uxn_c_l135_c13_12ff_return_output,
 BIN_OP_INFERRED_MULT_uxn_c_l136_c38_8b08_return_output,
 BIN_OP_MINUS_uxn_c_l136_c13_775a_return_output,
 MUX_uxn_c_l137_c13_36ea_return_output,
 MUX_uxn_c_l138_c13_07bb_return_output,
 MUX_uxn_c_l139_c13_d52b_return_output,
 MUX_uxn_c_l140_c13_ba83_return_output,
 BIN_OP_MINUS_uxn_c_l143_c28_9ac0_return_output,
 BIN_OP_MINUS_uxn_c_l143_c50_6e4d_return_output,
 BIN_OP_INFERRED_MULT_uxn_c_l143_c28_1e64_return_output,
 BIN_OP_INFERRED_MULT_uxn_c_l149_c45_b69d_return_output,
 BIN_OP_PLUS_uxn_c_l149_c45_a1df_return_output,
 BIN_OP_AND_uxn_c_l149_c99_ad57_return_output,
 MUX_uxn_c_l149_c26_92b4_return_output,
 BIN_OP_EQ_uxn_c_l151_c18_1d24_return_output,
 MUX_uxn_c_l151_c18_a19a_return_output,
 BIN_OP_PLUS_uxn_c_l152_c22_fd9e_return_output,
 MUX_uxn_c_l152_c6_7663_return_output,
 BIN_OP_PLUS_uxn_c_l153_c31_6321_return_output,
 MUX_uxn_c_l153_c6_afd9_return_output,
 UNARY_OP_NOT_uxn_c_l155_c38_6929_return_output,
 BIN_OP_AND_uxn_c_l155_c19_d727_return_output,
 BIN_OP_AND_uxn_c_l156_c19_607b_return_output,
 MUX_uxn_c_l161_c3_f586_return_output,
 UNARY_OP_NOT_uxn_c_l162_c57_57d0_return_output,
 BIN_OP_AND_uxn_c_l162_c22_3b54_return_output,
 BIN_OP_OR_uxn_c_l162_c3_6426_return_output,
 bg_vram_update_uxn_c_l158_c19_442b_return_output,
 MUX_uxn_c_l168_c3_4137_return_output,
 BIN_OP_AND_uxn_c_l169_c22_ad2f_return_output,
 BIN_OP_OR_uxn_c_l169_c3_7aa2_return_output,
 fg_vram_update_uxn_c_l165_c19_2037_return_output,
 BIN_OP_MINUS_uxn_c_l172_c43_9a92_return_output,
 MUX_uxn_c_l172_c26_3402_return_output,
 BIN_OP_EQ_uxn_c_l173_c19_47ad_return_output,
 MUX_uxn_c_l173_c19_ed87_return_output,
 BIN_OP_EQ_uxn_c_l174_c19_180b_return_output,
 BIN_OP_PLUS_uxn_c_l174_c77_393a_return_output,
 MUX_uxn_c_l174_c51_14c9_return_output,
 MUX_uxn_c_l174_c19_b556_return_output,
 BIN_OP_EQ_uxn_c_l175_c25_52f3_return_output,
 MUX_uxn_c_l175_c25_4827_return_output,
 BIN_OP_EQ_uxn_c_l176_c17_2bb5_return_output,
 MUX_uxn_c_l176_c17_5d07_return_output,
 UNARY_OP_NOT_uint1_t_uxn_c_l162_l169_DUPLICATE_fb79_return_output,
 BIN_OP_AND_uint1_t_uint1_t_uxn_c_l169_l162_DUPLICATE_72e0_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : gpu_step_result_t;
 variable VAR_is_active_drawing_area : unsigned(0 downto 0);
 variable VAR_is_vram_write : unsigned(0 downto 0);
 variable VAR_vram_write_layer : unsigned(0 downto 0);
 variable VAR_vram_address : unsigned(31 downto 0);
 variable VAR_vram_value : unsigned(1 downto 0);
 variable VAR_CONST_SR_28_uxn_c_l126_c24_8518_return_output : unsigned(31 downto 0);
 variable VAR_CONST_SR_28_uxn_c_l126_c24_8518_x : unsigned(31 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_c_l126_c14_6c3c_return_output : unsigned(3 downto 0);
 variable VAR_MUX_uxn_c_l127_c17_614b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l127_c17_614b_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l127_c17_614b_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l127_c17_b9d8_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l127_c17_b9d8_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l127_c17_b9d8_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l127_c17_614b_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l130_c6_38ac_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l130_c22_a720_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l130_c22_a720_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l130_c6_38ac_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l130_c6_38ac_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l130_c1_9fd4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l130_c1_9fd4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l130_c1_9fd4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l130_c1_9fd4_iffalse : unsigned(0 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l130_c2_0242_iftrue : unsigned(15 downto 0);
 variable VAR_fill_x1_uxn_c_l138_c3_e780 : unsigned(15 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l130_c2_0242_iffalse : unsigned(15 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l130_c2_0242_return_output : unsigned(15 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l130_c2_0242_cond : unsigned(0 downto 0);
 variable VAR_is_fill_left_uxn_c_l132_c3_82d2 : unsigned(0 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l130_c2_0242_iftrue : unsigned(15 downto 0);
 variable VAR_fill_x0_uxn_c_l140_c3_98be : unsigned(15 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l130_c2_0242_iffalse : unsigned(15 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l130_c2_0242_return_output : unsigned(15 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l130_c2_0242_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_c_l130_c2_0242_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_c_l130_c2_0242_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_c_l130_c2_0242_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_c_l130_c2_0242_cond : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l130_c2_0242_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_top_uxn_c_l133_c3_a5d6 : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l130_c2_0242_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l130_c2_0242_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l130_c2_0242_cond : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l130_c2_0242_iftrue : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l130_c2_0242_iffalse : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l130_c2_0242_return_output : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l130_c2_0242_cond : unsigned(0 downto 0);
 variable VAR_is_fill_active_MUX_uxn_c_l130_c2_0242_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_active_MUX_uxn_c_l130_c2_0242_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_active_MUX_uxn_c_l130_c2_0242_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_active_MUX_uxn_c_l130_c2_0242_cond : unsigned(0 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l130_c2_0242_iftrue : unsigned(15 downto 0);
 variable VAR_fill_y1_uxn_c_l137_c3_18b2 : unsigned(15 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l130_c2_0242_iffalse : unsigned(15 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l130_c2_0242_return_output : unsigned(15 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l130_c2_0242_cond : unsigned(0 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l130_c2_0242_iftrue : unsigned(1 downto 0);
 variable VAR_fill_color_uxn_c_l142_c3_9694 : unsigned(1 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l130_c2_0242_iffalse : unsigned(1 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l130_c2_0242_return_output : unsigned(1 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l130_c2_0242_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_c_l130_c2_0242_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_c_l130_c2_0242_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_c_l130_c2_0242_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_c_l130_c2_0242_cond : unsigned(0 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l130_c2_0242_iftrue : unsigned(31 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l130_c2_0242_iffalse : unsigned(31 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l130_c2_0242_return_output : unsigned(31 downto 0);
 variable VAR_fill_pixels_remaining_MUX_uxn_c_l130_c2_0242_cond : unsigned(0 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l130_c2_0242_iftrue : unsigned(15 downto 0);
 variable VAR_fill_y0_uxn_c_l139_c3_ce52 : unsigned(15 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l130_c2_0242_iffalse : unsigned(15 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l130_c2_0242_return_output : unsigned(15 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l130_c2_0242_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_20_uxn_c_l132_c18_4966_return_output : unsigned(31 downto 0);
 variable VAR_CONST_SR_20_uxn_c_l132_c18_4966_x : unsigned(31 downto 0);
 variable VAR_CONST_SR_21_uxn_c_l133_c17_728c_return_output : unsigned(31 downto 0);
 variable VAR_CONST_SR_21_uxn_c_l133_c17_728c_x : unsigned(31 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l134_c27_ad8c_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l134_c27_ad8c_right : unsigned(17 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l134_c27_ad8c_return_output : unsigned(31 downto 0);
 variable VAR_fill_y0_uxn_c_l135_c3_e56e : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_c_l135_c13_12ff_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_DIV_uxn_c_l135_c13_12ff_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_DIV_uxn_c_l135_c13_12ff_return_output : unsigned(31 downto 0);
 variable VAR_fill_x0_uxn_c_l136_c3_1a14 : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l136_c13_775a_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l136_c38_8b08_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l136_c38_8b08_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l136_c38_8b08_return_output : unsigned(24 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l136_c13_775a_right : unsigned(24 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l136_c13_775a_return_output : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l137_c13_36ea_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l137_c13_36ea_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l137_c13_36ea_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l137_c13_36ea_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l138_c13_07bb_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l138_c13_07bb_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l138_c13_07bb_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l138_c13_07bb_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l139_c13_d52b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l139_c13_d52b_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l139_c13_d52b_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l139_c13_d52b_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l140_c13_ba83_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l140_c13_ba83_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l140_c13_ba83_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l140_c13_ba83_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l143_c28_9ac0_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l143_c28_9ac0_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l143_c28_9ac0_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l143_c28_1e64_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l143_c50_6e4d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l143_c50_6e4d_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l143_c50_6e4d_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l143_c28_1e64_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l143_c28_1e64_return_output : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l146_c3_6f7c_uxn_c_l146_c3_6f7c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l146_c3_6f7c_uxn_c_l146_c3_6f7c_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l146_c3_6f7c_uxn_c_l146_c3_6f7c_arg1 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l146_c3_6f7c_uxn_c_l146_c3_6f7c_arg2 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l146_c3_6f7c_uxn_c_l146_c3_6f7c_arg3 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l146_c3_6f7c_uxn_c_l146_c3_6f7c_arg4 : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l149_c26_92b4_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l149_c26_92b4_iftrue : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l149_c26_92b4_iffalse : unsigned(31 downto 0);
 variable VAR_CAST_TO_uint32_t_uxn_c_l149_c45_83fb_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l149_c45_b69d_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l149_c45_b69d_right : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_c_l149_c45_b69d_return_output : unsigned(63 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l149_c45_a1df_left : unsigned(63 downto 0);
 variable VAR_CAST_TO_uint32_t_uxn_c_l149_c81_21da_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l149_c45_a1df_right : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l149_c45_a1df_return_output : unsigned(64 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l149_c99_ad57_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l149_c99_ad57_right : unsigned(17 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l149_c99_ad57_return_output : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l149_c26_92b4_return_output : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l151_c18_a19a_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l151_c18_a19a_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l151_c18_a19a_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l151_c18_1d24_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l151_c18_1d24_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l151_c18_1d24_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l151_c18_a19a_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l152_c6_7663_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l152_c6_7663_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l152_c6_7663_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l152_c22_fd9e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l152_c22_fd9e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l152_c22_fd9e_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l152_c6_7663_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l153_c6_afd9_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l153_c6_afd9_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l153_c6_afd9_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l153_c31_6321_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l153_c31_6321_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l153_c31_6321_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l153_c6_afd9_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l155_c19_d727_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l155_c38_6929_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l155_c38_6929_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l155_c19_d727_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l155_c19_d727_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l156_c19_607b_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l156_c19_607b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l156_c19_607b_return_output : unsigned(0 downto 0);
 variable VAR_bg_vram_update_uxn_c_l158_c19_442b_read_address : unsigned(31 downto 0);
 variable VAR_bg_vram_update_uxn_c_l158_c19_442b_write_address : unsigned(31 downto 0);
 variable VAR_bg_vram_update_uxn_c_l158_c19_442b_write_value : unsigned(1 downto 0);
 variable VAR_bg_vram_update_uxn_c_l158_c19_442b_write_enable : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l161_c3_f586_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l161_c3_f586_iftrue : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l161_c3_f586_iffalse : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l161_c3_f586_return_output : unsigned(1 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l162_c3_6426_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l162_c22_3b54_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l162_c57_57d0_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l162_c57_57d0_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l162_c22_3b54_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l162_c22_3b54_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l162_c3_6426_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l162_c3_6426_return_output : unsigned(0 downto 0);
 variable VAR_bg_vram_update_uxn_c_l158_c19_442b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_bg_vram_update_uxn_c_l158_c19_442b_return_output : unsigned(1 downto 0);
 variable VAR_fg_vram_update_uxn_c_l165_c19_2037_read_address : unsigned(31 downto 0);
 variable VAR_fg_vram_update_uxn_c_l165_c19_2037_write_address : unsigned(31 downto 0);
 variable VAR_fg_vram_update_uxn_c_l165_c19_2037_write_value : unsigned(1 downto 0);
 variable VAR_fg_vram_update_uxn_c_l165_c19_2037_write_enable : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l168_c3_4137_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l168_c3_4137_iftrue : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l168_c3_4137_iffalse : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l168_c3_4137_return_output : unsigned(1 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l169_c3_7aa2_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l169_c22_ad2f_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l169_c22_ad2f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l169_c22_ad2f_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l169_c3_7aa2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l169_c3_7aa2_return_output : unsigned(0 downto 0);
 variable VAR_fg_vram_update_uxn_c_l165_c19_2037_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_fg_vram_update_uxn_c_l165_c19_2037_return_output : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l172_c26_3402_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l172_c26_3402_iftrue : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l172_c26_3402_iffalse : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l172_c43_9a92_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l172_c43_9a92_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l172_c43_9a92_return_output : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l172_c26_3402_return_output : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l173_c19_ed87_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l173_c19_ed87_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l173_c19_ed87_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l173_c19_47ad_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l173_c19_47ad_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l173_c19_47ad_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l173_c19_ed87_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l174_c19_b556_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l174_c19_b556_iftrue : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l174_c19_b556_iffalse : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l174_c19_180b_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l174_c19_180b_right : unsigned(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l174_c19_180b_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l174_c51_14c9_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l174_c51_14c9_iftrue : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l174_c51_14c9_iffalse : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l174_c77_393a_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l174_c77_393a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l174_c77_393a_return_output : unsigned(32 downto 0);
 variable VAR_MUX_uxn_c_l174_c51_14c9_return_output : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l174_c19_b556_return_output : unsigned(31 downto 0);
 variable VAR_MUX_uxn_c_l175_c25_4827_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l175_c25_4827_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l175_c25_4827_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l175_c25_52f3_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l175_c25_52f3_right : unsigned(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l175_c25_52f3_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l175_c25_4827_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l176_c17_5d07_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l176_c17_5d07_iftrue : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l176_c17_5d07_iffalse : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l176_c17_2bb5_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l176_c17_2bb5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l176_c17_2bb5_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l176_c17_5d07_return_output : unsigned(1 downto 0);
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_c_l162_l169_DUPLICATE_fb79_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_c_l162_l169_DUPLICATE_fb79_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l169_l162_DUPLICATE_72e0_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l169_l162_DUPLICATE_72e0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l169_l162_DUPLICATE_72e0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_269d_uxn_c_l179_l111_DUPLICATE_135b_return_output : gpu_step_result_t;
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
     VAR_MUX_uxn_c_l172_c26_3402_iffalse := resize(to_unsigned(0, 1), 32);
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l149_c45_b69d_right := to_unsigned(400, 32);
     VAR_MUX_uxn_c_l140_c13_ba83_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_BIN_OP_AND_uxn_c_l134_c27_ad8c_right := to_unsigned(262143, 18);
     VAR_BIN_OP_EQ_uxn_c_l176_c17_2bb5_right := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_c_l152_c22_fd9e_right := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l138_c13_07bb_iffalse := resize(to_unsigned(399, 9), 16);
     VAR_MUX_uxn_c_l151_c18_a19a_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l127_c17_b9d8_right := to_unsigned(15, 4);
     VAR_MUX_uxn_c_l175_c25_4827_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l174_c19_b556_iftrue := resize(to_unsigned(0, 1), 32);
     VAR_is_fill_active_MUX_uxn_c_l130_c2_0242_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_c_l153_c31_6321_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l173_c19_47ad_right := to_unsigned(0, 1);
     VAR_BIN_OP_DIV_uxn_c_l135_c13_12ff_right := to_unsigned(400, 9);
     VAR_BIN_OP_PLUS_uxn_c_l174_c77_393a_right := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l173_c19_ed87_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l175_c25_4827_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_c_l149_c99_ad57_right := to_unsigned(262143, 18);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l130_c1_9fd4_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l151_c18_a19a_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_MINUS_uxn_c_l172_c43_9a92_right := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l127_c17_614b_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l173_c19_ed87_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l174_c19_180b_right := to_unsigned(143999, 18);
     VAR_BIN_OP_EQ_uxn_c_l175_c25_52f3_right := to_unsigned(143999, 18);
     VAR_MUX_uxn_c_l139_c13_d52b_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l136_c38_8b08_right := to_unsigned(400, 9);
     VAR_MUX_uxn_c_l137_c13_36ea_iffalse := resize(to_unsigned(359, 9), 16);
     VAR_MUX_uxn_c_l127_c17_614b_iftrue := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l130_c1_9fd4_iftrue := VAR_CLOCK_ENABLE;
     VAR_bg_vram_update_uxn_c_l158_c19_442b_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_fg_vram_update_uxn_c_l165_c19_2037_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_fill_color_MUX_uxn_c_l130_c2_0242_iffalse := fill_color;
     VAR_fill_layer_MUX_uxn_c_l130_c2_0242_iffalse := fill_layer;
     VAR_fill_pixels_remaining_MUX_uxn_c_l130_c2_0242_iffalse := fill_pixels_remaining;
     VAR_fill_x0_MUX_uxn_c_l130_c2_0242_iffalse := fill_x0;
     VAR_fill_x1_MUX_uxn_c_l130_c2_0242_iffalse := fill_x1;
     VAR_fill_y0_MUX_uxn_c_l130_c2_0242_iffalse := fill_y0;
     VAR_fill_y1_MUX_uxn_c_l130_c2_0242_iffalse := fill_y1;
     VAR_MUX_uxn_c_l174_c51_14c9_cond := VAR_is_active_drawing_area;
     VAR_UNARY_OP_NOT_uxn_c_l130_c22_a720_expr := is_fill_active;
     VAR_is_fill_active_MUX_uxn_c_l130_c2_0242_iffalse := is_fill_active;
     VAR_is_fill_top_MUX_uxn_c_l130_c2_0242_iffalse := is_fill_top;
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l169_l162_DUPLICATE_72e0_right := VAR_is_vram_write;
     VAR_BIN_OP_EQ_uxn_c_l174_c19_180b_left := pixel_counter;
     VAR_BIN_OP_PLUS_uxn_c_l174_c77_393a_left := pixel_counter;
     VAR_MUX_uxn_c_l174_c51_14c9_iffalse := pixel_counter;
     VAR_bg_vram_update_uxn_c_l158_c19_442b_read_address := pixel_counter;
     VAR_fg_vram_update_uxn_c_l165_c19_2037_read_address := pixel_counter;
     VAR_BIN_OP_AND_uxn_c_l134_c27_ad8c_left := VAR_vram_address;
     VAR_BIN_OP_AND_uxn_c_l149_c99_ad57_left := VAR_vram_address;
     VAR_CONST_SR_20_uxn_c_l132_c18_4966_x := VAR_vram_address;
     VAR_CONST_SR_21_uxn_c_l133_c17_728c_x := VAR_vram_address;
     VAR_CONST_SR_28_uxn_c_l126_c24_8518_x := VAR_vram_address;
     VAR_MUX_uxn_c_l161_c3_f586_iffalse := VAR_vram_value;
     VAR_MUX_uxn_c_l168_c3_4137_iffalse := VAR_vram_value;
     VAR_fill_color_uxn_c_l142_c3_9694 := VAR_vram_value;
     VAR_BIN_OP_AND_uxn_c_l169_c22_ad2f_right := VAR_vram_write_layer;
     VAR_UNARY_OP_NOT_uxn_c_l162_c57_57d0_expr := VAR_vram_write_layer;
     VAR_fill_layer_MUX_uxn_c_l130_c2_0242_iftrue := VAR_vram_write_layer;
     VAR_x_MUX_uxn_c_l130_c2_0242_iffalse := x;
     VAR_y_MUX_uxn_c_l130_c2_0242_iffalse := y;
     VAR_fill_color_MUX_uxn_c_l130_c2_0242_iftrue := VAR_fill_color_uxn_c_l142_c3_9694;
     VAR_printf_uxn_c_l146_c3_6f7c_uxn_c_l146_c3_6f7c_arg4 := resize(VAR_fill_color_uxn_c_l142_c3_9694, 32);
     -- BIN_OP_PLUS[uxn_c_l174_c77_393a] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l174_c77_393a_left <= VAR_BIN_OP_PLUS_uxn_c_l174_c77_393a_left;
     BIN_OP_PLUS_uxn_c_l174_c77_393a_right <= VAR_BIN_OP_PLUS_uxn_c_l174_c77_393a_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l174_c77_393a_return_output := BIN_OP_PLUS_uxn_c_l174_c77_393a_return_output;

     -- CONST_SR_28[uxn_c_l126_c24_8518] LATENCY=0
     -- Inputs
     CONST_SR_28_uxn_c_l126_c24_8518_x <= VAR_CONST_SR_28_uxn_c_l126_c24_8518_x;
     -- Outputs
     VAR_CONST_SR_28_uxn_c_l126_c24_8518_return_output := CONST_SR_28_uxn_c_l126_c24_8518_return_output;

     -- UNARY_OP_NOT[uxn_c_l162_c57_57d0] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l162_c57_57d0_expr <= VAR_UNARY_OP_NOT_uxn_c_l162_c57_57d0_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l162_c57_57d0_return_output := UNARY_OP_NOT_uxn_c_l162_c57_57d0_return_output;

     -- BIN_OP_AND[uxn_c_l134_c27_ad8c] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l134_c27_ad8c_left <= VAR_BIN_OP_AND_uxn_c_l134_c27_ad8c_left;
     BIN_OP_AND_uxn_c_l134_c27_ad8c_right <= VAR_BIN_OP_AND_uxn_c_l134_c27_ad8c_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l134_c27_ad8c_return_output := BIN_OP_AND_uxn_c_l134_c27_ad8c_return_output;

     -- CONST_SR_20[uxn_c_l132_c18_4966] LATENCY=0
     -- Inputs
     CONST_SR_20_uxn_c_l132_c18_4966_x <= VAR_CONST_SR_20_uxn_c_l132_c18_4966_x;
     -- Outputs
     VAR_CONST_SR_20_uxn_c_l132_c18_4966_return_output := CONST_SR_20_uxn_c_l132_c18_4966_return_output;

     -- CONST_SR_21[uxn_c_l133_c17_728c] LATENCY=0
     -- Inputs
     CONST_SR_21_uxn_c_l133_c17_728c_x <= VAR_CONST_SR_21_uxn_c_l133_c17_728c_x;
     -- Outputs
     VAR_CONST_SR_21_uxn_c_l133_c17_728c_return_output := CONST_SR_21_uxn_c_l133_c17_728c_return_output;

     -- BIN_OP_EQ[uxn_c_l174_c19_180b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l174_c19_180b_left <= VAR_BIN_OP_EQ_uxn_c_l174_c19_180b_left;
     BIN_OP_EQ_uxn_c_l174_c19_180b_right <= VAR_BIN_OP_EQ_uxn_c_l174_c19_180b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l174_c19_180b_return_output := BIN_OP_EQ_uxn_c_l174_c19_180b_return_output;

     -- UNARY_OP_NOT[uxn_c_l130_c22_a720] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l130_c22_a720_expr <= VAR_UNARY_OP_NOT_uxn_c_l130_c22_a720_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l130_c22_a720_return_output := UNARY_OP_NOT_uxn_c_l130_c22_a720_return_output;

     -- BIN_OP_AND[uxn_c_l149_c99_ad57] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l149_c99_ad57_left <= VAR_BIN_OP_AND_uxn_c_l149_c99_ad57_left;
     BIN_OP_AND_uxn_c_l149_c99_ad57_right <= VAR_BIN_OP_AND_uxn_c_l149_c99_ad57_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l149_c99_ad57_return_output := BIN_OP_AND_uxn_c_l149_c99_ad57_return_output;

     -- Submodule level 1
     VAR_BIN_OP_DIV_uxn_c_l135_c13_12ff_left := VAR_BIN_OP_AND_uxn_c_l134_c27_ad8c_return_output;
     VAR_BIN_OP_MINUS_uxn_c_l136_c13_775a_left := VAR_BIN_OP_AND_uxn_c_l134_c27_ad8c_return_output;
     VAR_MUX_uxn_c_l149_c26_92b4_iffalse := VAR_BIN_OP_AND_uxn_c_l149_c99_ad57_return_output;
     VAR_MUX_uxn_c_l174_c19_b556_cond := VAR_BIN_OP_EQ_uxn_c_l174_c19_180b_return_output;
     VAR_MUX_uxn_c_l174_c51_14c9_iftrue := resize(VAR_BIN_OP_PLUS_uxn_c_l174_c77_393a_return_output, 32);
     VAR_is_fill_left_uxn_c_l132_c3_82d2 := resize(VAR_CONST_SR_20_uxn_c_l132_c18_4966_return_output, 1);
     VAR_is_fill_top_uxn_c_l133_c3_a5d6 := resize(VAR_CONST_SR_21_uxn_c_l133_c17_728c_return_output, 1);
     VAR_BIN_OP_AND_uxn_c_l130_c6_38ac_right := VAR_UNARY_OP_NOT_uxn_c_l130_c22_a720_return_output;
     VAR_BIN_OP_AND_uxn_c_l162_c22_3b54_right := VAR_UNARY_OP_NOT_uxn_c_l162_c57_57d0_return_output;
     VAR_MUX_uxn_c_l138_c13_07bb_cond := VAR_is_fill_left_uxn_c_l132_c3_82d2;
     VAR_MUX_uxn_c_l140_c13_ba83_cond := VAR_is_fill_left_uxn_c_l132_c3_82d2;
     VAR_MUX_uxn_c_l137_c13_36ea_cond := VAR_is_fill_top_uxn_c_l133_c3_a5d6;
     VAR_MUX_uxn_c_l139_c13_d52b_cond := VAR_is_fill_top_uxn_c_l133_c3_a5d6;
     VAR_is_fill_top_MUX_uxn_c_l130_c2_0242_iftrue := VAR_is_fill_top_uxn_c_l133_c3_a5d6;
     -- MUX[uxn_c_l174_c51_14c9] LATENCY=0
     -- Inputs
     MUX_uxn_c_l174_c51_14c9_cond <= VAR_MUX_uxn_c_l174_c51_14c9_cond;
     MUX_uxn_c_l174_c51_14c9_iftrue <= VAR_MUX_uxn_c_l174_c51_14c9_iftrue;
     MUX_uxn_c_l174_c51_14c9_iffalse <= VAR_MUX_uxn_c_l174_c51_14c9_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l174_c51_14c9_return_output := MUX_uxn_c_l174_c51_14c9_return_output;

     -- CAST_TO_uint4_t[uxn_c_l126_c14_6c3c] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_c_l126_c14_6c3c_return_output := CAST_TO_uint4_t_uint32_t(
     VAR_CONST_SR_28_uxn_c_l126_c24_8518_return_output);

     -- BIN_OP_DIV[uxn_c_l135_c13_12ff] LATENCY=0
     -- Inputs
     BIN_OP_DIV_uxn_c_l135_c13_12ff_left <= VAR_BIN_OP_DIV_uxn_c_l135_c13_12ff_left;
     BIN_OP_DIV_uxn_c_l135_c13_12ff_right <= VAR_BIN_OP_DIV_uxn_c_l135_c13_12ff_right;
     -- Outputs
     VAR_BIN_OP_DIV_uxn_c_l135_c13_12ff_return_output := BIN_OP_DIV_uxn_c_l135_c13_12ff_return_output;

     -- Submodule level 2
     VAR_fill_y0_uxn_c_l135_c3_e56e := resize(VAR_BIN_OP_DIV_uxn_c_l135_c13_12ff_return_output, 16);
     VAR_BIN_OP_EQ_uxn_c_l127_c17_b9d8_left := VAR_CAST_TO_uint4_t_uxn_c_l126_c14_6c3c_return_output;
     REG_VAR_vram_code := VAR_CAST_TO_uint4_t_uxn_c_l126_c14_6c3c_return_output;
     VAR_MUX_uxn_c_l174_c19_b556_iffalse := VAR_MUX_uxn_c_l174_c51_14c9_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l136_c38_8b08_left := VAR_fill_y0_uxn_c_l135_c3_e56e;
     VAR_MUX_uxn_c_l137_c13_36ea_iftrue := VAR_fill_y0_uxn_c_l135_c3_e56e;
     VAR_MUX_uxn_c_l139_c13_d52b_iffalse := VAR_fill_y0_uxn_c_l135_c3_e56e;
     -- MUX[uxn_c_l137_c13_36ea] LATENCY=0
     -- Inputs
     MUX_uxn_c_l137_c13_36ea_cond <= VAR_MUX_uxn_c_l137_c13_36ea_cond;
     MUX_uxn_c_l137_c13_36ea_iftrue <= VAR_MUX_uxn_c_l137_c13_36ea_iftrue;
     MUX_uxn_c_l137_c13_36ea_iffalse <= VAR_MUX_uxn_c_l137_c13_36ea_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l137_c13_36ea_return_output := MUX_uxn_c_l137_c13_36ea_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_c_l136_c38_8b08] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_c_l136_c38_8b08_left <= VAR_BIN_OP_INFERRED_MULT_uxn_c_l136_c38_8b08_left;
     BIN_OP_INFERRED_MULT_uxn_c_l136_c38_8b08_right <= VAR_BIN_OP_INFERRED_MULT_uxn_c_l136_c38_8b08_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l136_c38_8b08_return_output := BIN_OP_INFERRED_MULT_uxn_c_l136_c38_8b08_return_output;

     -- BIN_OP_EQ[uxn_c_l127_c17_b9d8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l127_c17_b9d8_left <= VAR_BIN_OP_EQ_uxn_c_l127_c17_b9d8_left;
     BIN_OP_EQ_uxn_c_l127_c17_b9d8_right <= VAR_BIN_OP_EQ_uxn_c_l127_c17_b9d8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l127_c17_b9d8_return_output := BIN_OP_EQ_uxn_c_l127_c17_b9d8_return_output;

     -- MUX[uxn_c_l139_c13_d52b] LATENCY=0
     -- Inputs
     MUX_uxn_c_l139_c13_d52b_cond <= VAR_MUX_uxn_c_l139_c13_d52b_cond;
     MUX_uxn_c_l139_c13_d52b_iftrue <= VAR_MUX_uxn_c_l139_c13_d52b_iftrue;
     MUX_uxn_c_l139_c13_d52b_iffalse <= VAR_MUX_uxn_c_l139_c13_d52b_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l139_c13_d52b_return_output := MUX_uxn_c_l139_c13_d52b_return_output;

     -- MUX[uxn_c_l174_c19_b556] LATENCY=0
     -- Inputs
     MUX_uxn_c_l174_c19_b556_cond <= VAR_MUX_uxn_c_l174_c19_b556_cond;
     MUX_uxn_c_l174_c19_b556_iftrue <= VAR_MUX_uxn_c_l174_c19_b556_iftrue;
     MUX_uxn_c_l174_c19_b556_iffalse <= VAR_MUX_uxn_c_l174_c19_b556_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l174_c19_b556_return_output := MUX_uxn_c_l174_c19_b556_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_c_l127_c17_614b_cond := VAR_BIN_OP_EQ_uxn_c_l127_c17_b9d8_return_output;
     VAR_BIN_OP_MINUS_uxn_c_l136_c13_775a_right := VAR_BIN_OP_INFERRED_MULT_uxn_c_l136_c38_8b08_return_output;
     VAR_fill_y1_uxn_c_l137_c3_18b2 := VAR_MUX_uxn_c_l137_c13_36ea_return_output;
     VAR_fill_y0_uxn_c_l139_c3_ce52 := VAR_MUX_uxn_c_l139_c13_d52b_return_output;
     VAR_BIN_OP_EQ_uxn_c_l175_c25_52f3_left := VAR_MUX_uxn_c_l174_c19_b556_return_output;
     REG_VAR_pixel_counter := VAR_MUX_uxn_c_l174_c19_b556_return_output;
     VAR_BIN_OP_MINUS_uxn_c_l143_c50_6e4d_right := VAR_fill_y0_uxn_c_l139_c3_ce52;
     VAR_fill_y0_MUX_uxn_c_l130_c2_0242_iftrue := VAR_fill_y0_uxn_c_l139_c3_ce52;
     VAR_printf_uxn_c_l146_c3_6f7c_uxn_c_l146_c3_6f7c_arg1 := resize(VAR_fill_y0_uxn_c_l139_c3_ce52, 32);
     VAR_y_MUX_uxn_c_l130_c2_0242_iftrue := VAR_fill_y0_uxn_c_l139_c3_ce52;
     VAR_BIN_OP_MINUS_uxn_c_l143_c50_6e4d_left := VAR_fill_y1_uxn_c_l137_c3_18b2;
     VAR_fill_y1_MUX_uxn_c_l130_c2_0242_iftrue := VAR_fill_y1_uxn_c_l137_c3_18b2;
     VAR_printf_uxn_c_l146_c3_6f7c_uxn_c_l146_c3_6f7c_arg3 := resize(VAR_fill_y1_uxn_c_l137_c3_18b2, 32);
     -- BIN_OP_MINUS[uxn_c_l136_c13_775a] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l136_c13_775a_left <= VAR_BIN_OP_MINUS_uxn_c_l136_c13_775a_left;
     BIN_OP_MINUS_uxn_c_l136_c13_775a_right <= VAR_BIN_OP_MINUS_uxn_c_l136_c13_775a_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l136_c13_775a_return_output := BIN_OP_MINUS_uxn_c_l136_c13_775a_return_output;

     -- MUX[uxn_c_l127_c17_614b] LATENCY=0
     -- Inputs
     MUX_uxn_c_l127_c17_614b_cond <= VAR_MUX_uxn_c_l127_c17_614b_cond;
     MUX_uxn_c_l127_c17_614b_iftrue <= VAR_MUX_uxn_c_l127_c17_614b_iftrue;
     MUX_uxn_c_l127_c17_614b_iffalse <= VAR_MUX_uxn_c_l127_c17_614b_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l127_c17_614b_return_output := MUX_uxn_c_l127_c17_614b_return_output;

     -- BIN_OP_EQ[uxn_c_l175_c25_52f3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l175_c25_52f3_left <= VAR_BIN_OP_EQ_uxn_c_l175_c25_52f3_left;
     BIN_OP_EQ_uxn_c_l175_c25_52f3_right <= VAR_BIN_OP_EQ_uxn_c_l175_c25_52f3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l175_c25_52f3_return_output := BIN_OP_EQ_uxn_c_l175_c25_52f3_return_output;

     -- BIN_OP_MINUS[uxn_c_l143_c50_6e4d] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l143_c50_6e4d_left <= VAR_BIN_OP_MINUS_uxn_c_l143_c50_6e4d_left;
     BIN_OP_MINUS_uxn_c_l143_c50_6e4d_right <= VAR_BIN_OP_MINUS_uxn_c_l143_c50_6e4d_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l143_c50_6e4d_return_output := BIN_OP_MINUS_uxn_c_l143_c50_6e4d_return_output;

     -- Submodule level 4
     VAR_MUX_uxn_c_l175_c25_4827_cond := VAR_BIN_OP_EQ_uxn_c_l175_c25_52f3_return_output;
     VAR_fill_x0_uxn_c_l136_c3_1a14 := resize(VAR_BIN_OP_MINUS_uxn_c_l136_c13_775a_return_output, 16);
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l143_c28_1e64_right := VAR_BIN_OP_MINUS_uxn_c_l143_c50_6e4d_return_output;
     VAR_BIN_OP_AND_uxn_c_l130_c6_38ac_left := VAR_MUX_uxn_c_l127_c17_614b_return_output;
     REG_VAR_is_fill_code := VAR_MUX_uxn_c_l127_c17_614b_return_output;
     VAR_MUX_uxn_c_l138_c13_07bb_iftrue := VAR_fill_x0_uxn_c_l136_c3_1a14;
     VAR_MUX_uxn_c_l140_c13_ba83_iffalse := VAR_fill_x0_uxn_c_l136_c3_1a14;
     -- MUX[uxn_c_l175_c25_4827] LATENCY=0
     -- Inputs
     MUX_uxn_c_l175_c25_4827_cond <= VAR_MUX_uxn_c_l175_c25_4827_cond;
     MUX_uxn_c_l175_c25_4827_iftrue <= VAR_MUX_uxn_c_l175_c25_4827_iftrue;
     MUX_uxn_c_l175_c25_4827_iffalse <= VAR_MUX_uxn_c_l175_c25_4827_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l175_c25_4827_return_output := MUX_uxn_c_l175_c25_4827_return_output;

     -- MUX[uxn_c_l140_c13_ba83] LATENCY=0
     -- Inputs
     MUX_uxn_c_l140_c13_ba83_cond <= VAR_MUX_uxn_c_l140_c13_ba83_cond;
     MUX_uxn_c_l140_c13_ba83_iftrue <= VAR_MUX_uxn_c_l140_c13_ba83_iftrue;
     MUX_uxn_c_l140_c13_ba83_iffalse <= VAR_MUX_uxn_c_l140_c13_ba83_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l140_c13_ba83_return_output := MUX_uxn_c_l140_c13_ba83_return_output;

     -- BIN_OP_AND[uxn_c_l130_c6_38ac] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l130_c6_38ac_left <= VAR_BIN_OP_AND_uxn_c_l130_c6_38ac_left;
     BIN_OP_AND_uxn_c_l130_c6_38ac_right <= VAR_BIN_OP_AND_uxn_c_l130_c6_38ac_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l130_c6_38ac_return_output := BIN_OP_AND_uxn_c_l130_c6_38ac_return_output;

     -- MUX[uxn_c_l138_c13_07bb] LATENCY=0
     -- Inputs
     MUX_uxn_c_l138_c13_07bb_cond <= VAR_MUX_uxn_c_l138_c13_07bb_cond;
     MUX_uxn_c_l138_c13_07bb_iftrue <= VAR_MUX_uxn_c_l138_c13_07bb_iftrue;
     MUX_uxn_c_l138_c13_07bb_iffalse <= VAR_MUX_uxn_c_l138_c13_07bb_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l138_c13_07bb_return_output := MUX_uxn_c_l138_c13_07bb_return_output;

     -- Submodule level 5
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l130_c1_9fd4_cond := VAR_BIN_OP_AND_uxn_c_l130_c6_38ac_return_output;
     VAR_fill_color_MUX_uxn_c_l130_c2_0242_cond := VAR_BIN_OP_AND_uxn_c_l130_c6_38ac_return_output;
     VAR_fill_layer_MUX_uxn_c_l130_c2_0242_cond := VAR_BIN_OP_AND_uxn_c_l130_c6_38ac_return_output;
     VAR_fill_pixels_remaining_MUX_uxn_c_l130_c2_0242_cond := VAR_BIN_OP_AND_uxn_c_l130_c6_38ac_return_output;
     VAR_fill_x0_MUX_uxn_c_l130_c2_0242_cond := VAR_BIN_OP_AND_uxn_c_l130_c6_38ac_return_output;
     VAR_fill_x1_MUX_uxn_c_l130_c2_0242_cond := VAR_BIN_OP_AND_uxn_c_l130_c6_38ac_return_output;
     VAR_fill_y0_MUX_uxn_c_l130_c2_0242_cond := VAR_BIN_OP_AND_uxn_c_l130_c6_38ac_return_output;
     VAR_fill_y1_MUX_uxn_c_l130_c2_0242_cond := VAR_BIN_OP_AND_uxn_c_l130_c6_38ac_return_output;
     VAR_is_fill_active_MUX_uxn_c_l130_c2_0242_cond := VAR_BIN_OP_AND_uxn_c_l130_c6_38ac_return_output;
     VAR_is_fill_top_MUX_uxn_c_l130_c2_0242_cond := VAR_BIN_OP_AND_uxn_c_l130_c6_38ac_return_output;
     VAR_x_MUX_uxn_c_l130_c2_0242_cond := VAR_BIN_OP_AND_uxn_c_l130_c6_38ac_return_output;
     VAR_y_MUX_uxn_c_l130_c2_0242_cond := VAR_BIN_OP_AND_uxn_c_l130_c6_38ac_return_output;
     VAR_fill_x1_uxn_c_l138_c3_e780 := VAR_MUX_uxn_c_l138_c13_07bb_return_output;
     VAR_fill_x0_uxn_c_l140_c3_98be := VAR_MUX_uxn_c_l140_c13_ba83_return_output;
     VAR_BIN_OP_MINUS_uxn_c_l143_c28_9ac0_right := VAR_fill_x0_uxn_c_l140_c3_98be;
     VAR_fill_x0_MUX_uxn_c_l130_c2_0242_iftrue := VAR_fill_x0_uxn_c_l140_c3_98be;
     VAR_printf_uxn_c_l146_c3_6f7c_uxn_c_l146_c3_6f7c_arg0 := resize(VAR_fill_x0_uxn_c_l140_c3_98be, 32);
     VAR_x_MUX_uxn_c_l130_c2_0242_iftrue := VAR_fill_x0_uxn_c_l140_c3_98be;
     VAR_BIN_OP_MINUS_uxn_c_l143_c28_9ac0_left := VAR_fill_x1_uxn_c_l138_c3_e780;
     VAR_fill_x1_MUX_uxn_c_l130_c2_0242_iftrue := VAR_fill_x1_uxn_c_l138_c3_e780;
     VAR_printf_uxn_c_l146_c3_6f7c_uxn_c_l146_c3_6f7c_arg2 := resize(VAR_fill_x1_uxn_c_l138_c3_e780, 32);
     -- fill_y1_MUX[uxn_c_l130_c2_0242] LATENCY=0
     -- Inputs
     fill_y1_MUX_uxn_c_l130_c2_0242_cond <= VAR_fill_y1_MUX_uxn_c_l130_c2_0242_cond;
     fill_y1_MUX_uxn_c_l130_c2_0242_iftrue <= VAR_fill_y1_MUX_uxn_c_l130_c2_0242_iftrue;
     fill_y1_MUX_uxn_c_l130_c2_0242_iffalse <= VAR_fill_y1_MUX_uxn_c_l130_c2_0242_iffalse;
     -- Outputs
     VAR_fill_y1_MUX_uxn_c_l130_c2_0242_return_output := fill_y1_MUX_uxn_c_l130_c2_0242_return_output;

     -- y_MUX[uxn_c_l130_c2_0242] LATENCY=0
     -- Inputs
     y_MUX_uxn_c_l130_c2_0242_cond <= VAR_y_MUX_uxn_c_l130_c2_0242_cond;
     y_MUX_uxn_c_l130_c2_0242_iftrue <= VAR_y_MUX_uxn_c_l130_c2_0242_iftrue;
     y_MUX_uxn_c_l130_c2_0242_iffalse <= VAR_y_MUX_uxn_c_l130_c2_0242_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_c_l130_c2_0242_return_output := y_MUX_uxn_c_l130_c2_0242_return_output;

     -- fill_color_MUX[uxn_c_l130_c2_0242] LATENCY=0
     -- Inputs
     fill_color_MUX_uxn_c_l130_c2_0242_cond <= VAR_fill_color_MUX_uxn_c_l130_c2_0242_cond;
     fill_color_MUX_uxn_c_l130_c2_0242_iftrue <= VAR_fill_color_MUX_uxn_c_l130_c2_0242_iftrue;
     fill_color_MUX_uxn_c_l130_c2_0242_iffalse <= VAR_fill_color_MUX_uxn_c_l130_c2_0242_iffalse;
     -- Outputs
     VAR_fill_color_MUX_uxn_c_l130_c2_0242_return_output := fill_color_MUX_uxn_c_l130_c2_0242_return_output;

     -- BIN_OP_MINUS[uxn_c_l143_c28_9ac0] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l143_c28_9ac0_left <= VAR_BIN_OP_MINUS_uxn_c_l143_c28_9ac0_left;
     BIN_OP_MINUS_uxn_c_l143_c28_9ac0_right <= VAR_BIN_OP_MINUS_uxn_c_l143_c28_9ac0_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l143_c28_9ac0_return_output := BIN_OP_MINUS_uxn_c_l143_c28_9ac0_return_output;

     -- fill_layer_MUX[uxn_c_l130_c2_0242] LATENCY=0
     -- Inputs
     fill_layer_MUX_uxn_c_l130_c2_0242_cond <= VAR_fill_layer_MUX_uxn_c_l130_c2_0242_cond;
     fill_layer_MUX_uxn_c_l130_c2_0242_iftrue <= VAR_fill_layer_MUX_uxn_c_l130_c2_0242_iftrue;
     fill_layer_MUX_uxn_c_l130_c2_0242_iffalse <= VAR_fill_layer_MUX_uxn_c_l130_c2_0242_iffalse;
     -- Outputs
     VAR_fill_layer_MUX_uxn_c_l130_c2_0242_return_output := fill_layer_MUX_uxn_c_l130_c2_0242_return_output;

     -- is_fill_active_MUX[uxn_c_l130_c2_0242] LATENCY=0
     -- Inputs
     is_fill_active_MUX_uxn_c_l130_c2_0242_cond <= VAR_is_fill_active_MUX_uxn_c_l130_c2_0242_cond;
     is_fill_active_MUX_uxn_c_l130_c2_0242_iftrue <= VAR_is_fill_active_MUX_uxn_c_l130_c2_0242_iftrue;
     is_fill_active_MUX_uxn_c_l130_c2_0242_iffalse <= VAR_is_fill_active_MUX_uxn_c_l130_c2_0242_iffalse;
     -- Outputs
     VAR_is_fill_active_MUX_uxn_c_l130_c2_0242_return_output := is_fill_active_MUX_uxn_c_l130_c2_0242_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l130_c1_9fd4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l130_c1_9fd4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l130_c1_9fd4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l130_c1_9fd4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l130_c1_9fd4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l130_c1_9fd4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l130_c1_9fd4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l130_c1_9fd4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l130_c1_9fd4_return_output;

     -- fill_y0_MUX[uxn_c_l130_c2_0242] LATENCY=0
     -- Inputs
     fill_y0_MUX_uxn_c_l130_c2_0242_cond <= VAR_fill_y0_MUX_uxn_c_l130_c2_0242_cond;
     fill_y0_MUX_uxn_c_l130_c2_0242_iftrue <= VAR_fill_y0_MUX_uxn_c_l130_c2_0242_iftrue;
     fill_y0_MUX_uxn_c_l130_c2_0242_iffalse <= VAR_fill_y0_MUX_uxn_c_l130_c2_0242_iffalse;
     -- Outputs
     VAR_fill_y0_MUX_uxn_c_l130_c2_0242_return_output := fill_y0_MUX_uxn_c_l130_c2_0242_return_output;

     -- x_MUX[uxn_c_l130_c2_0242] LATENCY=0
     -- Inputs
     x_MUX_uxn_c_l130_c2_0242_cond <= VAR_x_MUX_uxn_c_l130_c2_0242_cond;
     x_MUX_uxn_c_l130_c2_0242_iftrue <= VAR_x_MUX_uxn_c_l130_c2_0242_iftrue;
     x_MUX_uxn_c_l130_c2_0242_iffalse <= VAR_x_MUX_uxn_c_l130_c2_0242_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_c_l130_c2_0242_return_output := x_MUX_uxn_c_l130_c2_0242_return_output;

     -- fill_x0_MUX[uxn_c_l130_c2_0242] LATENCY=0
     -- Inputs
     fill_x0_MUX_uxn_c_l130_c2_0242_cond <= VAR_fill_x0_MUX_uxn_c_l130_c2_0242_cond;
     fill_x0_MUX_uxn_c_l130_c2_0242_iftrue <= VAR_fill_x0_MUX_uxn_c_l130_c2_0242_iftrue;
     fill_x0_MUX_uxn_c_l130_c2_0242_iffalse <= VAR_fill_x0_MUX_uxn_c_l130_c2_0242_iffalse;
     -- Outputs
     VAR_fill_x0_MUX_uxn_c_l130_c2_0242_return_output := fill_x0_MUX_uxn_c_l130_c2_0242_return_output;

     -- is_fill_top_MUX[uxn_c_l130_c2_0242] LATENCY=0
     -- Inputs
     is_fill_top_MUX_uxn_c_l130_c2_0242_cond <= VAR_is_fill_top_MUX_uxn_c_l130_c2_0242_cond;
     is_fill_top_MUX_uxn_c_l130_c2_0242_iftrue <= VAR_is_fill_top_MUX_uxn_c_l130_c2_0242_iftrue;
     is_fill_top_MUX_uxn_c_l130_c2_0242_iffalse <= VAR_is_fill_top_MUX_uxn_c_l130_c2_0242_iffalse;
     -- Outputs
     VAR_is_fill_top_MUX_uxn_c_l130_c2_0242_return_output := is_fill_top_MUX_uxn_c_l130_c2_0242_return_output;

     -- fill_x1_MUX[uxn_c_l130_c2_0242] LATENCY=0
     -- Inputs
     fill_x1_MUX_uxn_c_l130_c2_0242_cond <= VAR_fill_x1_MUX_uxn_c_l130_c2_0242_cond;
     fill_x1_MUX_uxn_c_l130_c2_0242_iftrue <= VAR_fill_x1_MUX_uxn_c_l130_c2_0242_iftrue;
     fill_x1_MUX_uxn_c_l130_c2_0242_iffalse <= VAR_fill_x1_MUX_uxn_c_l130_c2_0242_iffalse;
     -- Outputs
     VAR_fill_x1_MUX_uxn_c_l130_c2_0242_return_output := fill_x1_MUX_uxn_c_l130_c2_0242_return_output;

     -- Submodule level 6
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l143_c28_1e64_left := VAR_BIN_OP_MINUS_uxn_c_l143_c28_9ac0_return_output;
     VAR_printf_uxn_c_l146_c3_6f7c_uxn_c_l146_c3_6f7c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l130_c1_9fd4_return_output;
     VAR_MUX_uxn_c_l161_c3_f586_iftrue := VAR_fill_color_MUX_uxn_c_l130_c2_0242_return_output;
     VAR_MUX_uxn_c_l168_c3_4137_iftrue := VAR_fill_color_MUX_uxn_c_l130_c2_0242_return_output;
     REG_VAR_fill_color := VAR_fill_color_MUX_uxn_c_l130_c2_0242_return_output;
     VAR_BIN_OP_AND_uxn_c_l156_c19_607b_right := VAR_fill_layer_MUX_uxn_c_l130_c2_0242_return_output;
     VAR_UNARY_OP_NOT_uxn_c_l155_c38_6929_expr := VAR_fill_layer_MUX_uxn_c_l130_c2_0242_return_output;
     REG_VAR_fill_layer := VAR_fill_layer_MUX_uxn_c_l130_c2_0242_return_output;
     VAR_MUX_uxn_c_l153_c6_afd9_iftrue := VAR_fill_x0_MUX_uxn_c_l130_c2_0242_return_output;
     REG_VAR_fill_x0 := VAR_fill_x0_MUX_uxn_c_l130_c2_0242_return_output;
     VAR_BIN_OP_EQ_uxn_c_l151_c18_1d24_right := VAR_fill_x1_MUX_uxn_c_l130_c2_0242_return_output;
     REG_VAR_fill_x1 := VAR_fill_x1_MUX_uxn_c_l130_c2_0242_return_output;
     REG_VAR_fill_y0 := VAR_fill_y0_MUX_uxn_c_l130_c2_0242_return_output;
     REG_VAR_fill_y1 := VAR_fill_y1_MUX_uxn_c_l130_c2_0242_return_output;
     VAR_BIN_OP_AND_uxn_c_l155_c19_d727_left := VAR_is_fill_active_MUX_uxn_c_l130_c2_0242_return_output;
     VAR_BIN_OP_AND_uxn_c_l156_c19_607b_left := VAR_is_fill_active_MUX_uxn_c_l130_c2_0242_return_output;
     VAR_MUX_uxn_c_l149_c26_92b4_cond := VAR_is_fill_active_MUX_uxn_c_l130_c2_0242_return_output;
     VAR_MUX_uxn_c_l172_c26_3402_cond := VAR_is_fill_active_MUX_uxn_c_l130_c2_0242_return_output;
     VAR_UNARY_OP_NOT_uint1_t_uxn_c_l162_l169_DUPLICATE_fb79_expr := VAR_is_fill_active_MUX_uxn_c_l130_c2_0242_return_output;
     REG_VAR_is_fill_top := VAR_is_fill_top_MUX_uxn_c_l130_c2_0242_return_output;
     VAR_BIN_OP_EQ_uxn_c_l151_c18_1d24_left := VAR_x_MUX_uxn_c_l130_c2_0242_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l153_c31_6321_left := VAR_x_MUX_uxn_c_l130_c2_0242_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l152_c22_fd9e_left := VAR_y_MUX_uxn_c_l130_c2_0242_return_output;
     VAR_MUX_uxn_c_l152_c6_7663_iffalse := VAR_y_MUX_uxn_c_l130_c2_0242_return_output;
     -- BIN_OP_PLUS[uxn_c_l152_c22_fd9e] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l152_c22_fd9e_left <= VAR_BIN_OP_PLUS_uxn_c_l152_c22_fd9e_left;
     BIN_OP_PLUS_uxn_c_l152_c22_fd9e_right <= VAR_BIN_OP_PLUS_uxn_c_l152_c22_fd9e_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l152_c22_fd9e_return_output := BIN_OP_PLUS_uxn_c_l152_c22_fd9e_return_output;

     -- CAST_TO_uint32_t[uxn_c_l149_c45_83fb] LATENCY=0
     VAR_CAST_TO_uint32_t_uxn_c_l149_c45_83fb_return_output := CAST_TO_uint32_t_uint16_t(
     VAR_y_MUX_uxn_c_l130_c2_0242_return_output);

     -- BIN_OP_PLUS[uxn_c_l153_c31_6321] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l153_c31_6321_left <= VAR_BIN_OP_PLUS_uxn_c_l153_c31_6321_left;
     BIN_OP_PLUS_uxn_c_l153_c31_6321_right <= VAR_BIN_OP_PLUS_uxn_c_l153_c31_6321_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l153_c31_6321_return_output := BIN_OP_PLUS_uxn_c_l153_c31_6321_return_output;

     -- printf_uxn_c_l146_c3_6f7c[uxn_c_l146_c3_6f7c] LATENCY=0
     -- Clock enable
     printf_uxn_c_l146_c3_6f7c_uxn_c_l146_c3_6f7c_CLOCK_ENABLE <= VAR_printf_uxn_c_l146_c3_6f7c_uxn_c_l146_c3_6f7c_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_c_l146_c3_6f7c_uxn_c_l146_c3_6f7c_arg0 <= VAR_printf_uxn_c_l146_c3_6f7c_uxn_c_l146_c3_6f7c_arg0;
     printf_uxn_c_l146_c3_6f7c_uxn_c_l146_c3_6f7c_arg1 <= VAR_printf_uxn_c_l146_c3_6f7c_uxn_c_l146_c3_6f7c_arg1;
     printf_uxn_c_l146_c3_6f7c_uxn_c_l146_c3_6f7c_arg2 <= VAR_printf_uxn_c_l146_c3_6f7c_uxn_c_l146_c3_6f7c_arg2;
     printf_uxn_c_l146_c3_6f7c_uxn_c_l146_c3_6f7c_arg3 <= VAR_printf_uxn_c_l146_c3_6f7c_uxn_c_l146_c3_6f7c_arg3;
     printf_uxn_c_l146_c3_6f7c_uxn_c_l146_c3_6f7c_arg4 <= VAR_printf_uxn_c_l146_c3_6f7c_uxn_c_l146_c3_6f7c_arg4;
     -- Outputs

     -- BIN_OP_AND[uxn_c_l156_c19_607b] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l156_c19_607b_left <= VAR_BIN_OP_AND_uxn_c_l156_c19_607b_left;
     BIN_OP_AND_uxn_c_l156_c19_607b_right <= VAR_BIN_OP_AND_uxn_c_l156_c19_607b_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l156_c19_607b_return_output := BIN_OP_AND_uxn_c_l156_c19_607b_return_output;

     -- BIN_OP_EQ[uxn_c_l151_c18_1d24] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l151_c18_1d24_left <= VAR_BIN_OP_EQ_uxn_c_l151_c18_1d24_left;
     BIN_OP_EQ_uxn_c_l151_c18_1d24_right <= VAR_BIN_OP_EQ_uxn_c_l151_c18_1d24_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l151_c18_1d24_return_output := BIN_OP_EQ_uxn_c_l151_c18_1d24_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_c_l143_c28_1e64] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_c_l143_c28_1e64_left <= VAR_BIN_OP_INFERRED_MULT_uxn_c_l143_c28_1e64_left;
     BIN_OP_INFERRED_MULT_uxn_c_l143_c28_1e64_right <= VAR_BIN_OP_INFERRED_MULT_uxn_c_l143_c28_1e64_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l143_c28_1e64_return_output := BIN_OP_INFERRED_MULT_uxn_c_l143_c28_1e64_return_output;

     -- UNARY_OP_NOT[uxn_c_l155_c38_6929] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l155_c38_6929_expr <= VAR_UNARY_OP_NOT_uxn_c_l155_c38_6929_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l155_c38_6929_return_output := UNARY_OP_NOT_uxn_c_l155_c38_6929_return_output;

     -- UNARY_OP_NOT_uint1_t_uxn_c_l162_l169_DUPLICATE_fb79 LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uint1_t_uxn_c_l162_l169_DUPLICATE_fb79_expr <= VAR_UNARY_OP_NOT_uint1_t_uxn_c_l162_l169_DUPLICATE_fb79_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uint1_t_uxn_c_l162_l169_DUPLICATE_fb79_return_output := UNARY_OP_NOT_uint1_t_uxn_c_l162_l169_DUPLICATE_fb79_return_output;

     -- CAST_TO_uint32_t[uxn_c_l149_c81_21da] LATENCY=0
     VAR_CAST_TO_uint32_t_uxn_c_l149_c81_21da_return_output := CAST_TO_uint32_t_uint16_t(
     VAR_x_MUX_uxn_c_l130_c2_0242_return_output);

     -- Submodule level 7
     VAR_BIN_OP_OR_uxn_c_l169_c3_7aa2_left := VAR_BIN_OP_AND_uxn_c_l156_c19_607b_return_output;
     VAR_MUX_uxn_c_l168_c3_4137_cond := VAR_BIN_OP_AND_uxn_c_l156_c19_607b_return_output;
     REG_VAR_is_fill_pixel1 := VAR_BIN_OP_AND_uxn_c_l156_c19_607b_return_output;
     VAR_MUX_uxn_c_l151_c18_a19a_cond := VAR_BIN_OP_EQ_uxn_c_l151_c18_1d24_return_output;
     VAR_fill_pixels_remaining_MUX_uxn_c_l130_c2_0242_iftrue := VAR_BIN_OP_INFERRED_MULT_uxn_c_l143_c28_1e64_return_output;
     VAR_MUX_uxn_c_l152_c6_7663_iftrue := resize(VAR_BIN_OP_PLUS_uxn_c_l152_c22_fd9e_return_output, 16);
     VAR_MUX_uxn_c_l153_c6_afd9_iffalse := resize(VAR_BIN_OP_PLUS_uxn_c_l153_c31_6321_return_output, 16);
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l149_c45_b69d_left := VAR_CAST_TO_uint32_t_uxn_c_l149_c45_83fb_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l149_c45_a1df_right := VAR_CAST_TO_uint32_t_uxn_c_l149_c81_21da_return_output;
     VAR_BIN_OP_AND_uxn_c_l155_c19_d727_right := VAR_UNARY_OP_NOT_uxn_c_l155_c38_6929_return_output;
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l169_l162_DUPLICATE_72e0_left := VAR_UNARY_OP_NOT_uint1_t_uxn_c_l162_l169_DUPLICATE_fb79_return_output;
     -- BIN_OP_INFERRED_MULT[uxn_c_l149_c45_b69d] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_c_l149_c45_b69d_left <= VAR_BIN_OP_INFERRED_MULT_uxn_c_l149_c45_b69d_left;
     BIN_OP_INFERRED_MULT_uxn_c_l149_c45_b69d_right <= VAR_BIN_OP_INFERRED_MULT_uxn_c_l149_c45_b69d_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_c_l149_c45_b69d_return_output := BIN_OP_INFERRED_MULT_uxn_c_l149_c45_b69d_return_output;

     -- BIN_OP_AND_uint1_t_uint1_t_uxn_c_l169_l162_DUPLICATE_72e0 LATENCY=0
     -- Inputs
     BIN_OP_AND_uint1_t_uint1_t_uxn_c_l169_l162_DUPLICATE_72e0_left <= VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l169_l162_DUPLICATE_72e0_left;
     BIN_OP_AND_uint1_t_uint1_t_uxn_c_l169_l162_DUPLICATE_72e0_right <= VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l169_l162_DUPLICATE_72e0_right;
     -- Outputs
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l169_l162_DUPLICATE_72e0_return_output := BIN_OP_AND_uint1_t_uint1_t_uxn_c_l169_l162_DUPLICATE_72e0_return_output;

     -- MUX[uxn_c_l151_c18_a19a] LATENCY=0
     -- Inputs
     MUX_uxn_c_l151_c18_a19a_cond <= VAR_MUX_uxn_c_l151_c18_a19a_cond;
     MUX_uxn_c_l151_c18_a19a_iftrue <= VAR_MUX_uxn_c_l151_c18_a19a_iftrue;
     MUX_uxn_c_l151_c18_a19a_iffalse <= VAR_MUX_uxn_c_l151_c18_a19a_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l151_c18_a19a_return_output := MUX_uxn_c_l151_c18_a19a_return_output;

     -- MUX[uxn_c_l168_c3_4137] LATENCY=0
     -- Inputs
     MUX_uxn_c_l168_c3_4137_cond <= VAR_MUX_uxn_c_l168_c3_4137_cond;
     MUX_uxn_c_l168_c3_4137_iftrue <= VAR_MUX_uxn_c_l168_c3_4137_iftrue;
     MUX_uxn_c_l168_c3_4137_iffalse <= VAR_MUX_uxn_c_l168_c3_4137_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l168_c3_4137_return_output := MUX_uxn_c_l168_c3_4137_return_output;

     -- BIN_OP_AND[uxn_c_l155_c19_d727] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l155_c19_d727_left <= VAR_BIN_OP_AND_uxn_c_l155_c19_d727_left;
     BIN_OP_AND_uxn_c_l155_c19_d727_right <= VAR_BIN_OP_AND_uxn_c_l155_c19_d727_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l155_c19_d727_return_output := BIN_OP_AND_uxn_c_l155_c19_d727_return_output;

     -- fill_pixels_remaining_MUX[uxn_c_l130_c2_0242] LATENCY=0
     -- Inputs
     fill_pixels_remaining_MUX_uxn_c_l130_c2_0242_cond <= VAR_fill_pixels_remaining_MUX_uxn_c_l130_c2_0242_cond;
     fill_pixels_remaining_MUX_uxn_c_l130_c2_0242_iftrue <= VAR_fill_pixels_remaining_MUX_uxn_c_l130_c2_0242_iftrue;
     fill_pixels_remaining_MUX_uxn_c_l130_c2_0242_iffalse <= VAR_fill_pixels_remaining_MUX_uxn_c_l130_c2_0242_iffalse;
     -- Outputs
     VAR_fill_pixels_remaining_MUX_uxn_c_l130_c2_0242_return_output := fill_pixels_remaining_MUX_uxn_c_l130_c2_0242_return_output;

     -- Submodule level 8
     VAR_BIN_OP_OR_uxn_c_l162_c3_6426_left := VAR_BIN_OP_AND_uxn_c_l155_c19_d727_return_output;
     VAR_MUX_uxn_c_l161_c3_f586_cond := VAR_BIN_OP_AND_uxn_c_l155_c19_d727_return_output;
     REG_VAR_is_fill_pixel0 := VAR_BIN_OP_AND_uxn_c_l155_c19_d727_return_output;
     VAR_BIN_OP_AND_uxn_c_l162_c22_3b54_left := VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l169_l162_DUPLICATE_72e0_return_output;
     VAR_BIN_OP_AND_uxn_c_l169_c22_ad2f_left := VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l169_l162_DUPLICATE_72e0_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l149_c45_a1df_left := VAR_BIN_OP_INFERRED_MULT_uxn_c_l149_c45_b69d_return_output;
     VAR_MUX_uxn_c_l152_c6_7663_cond := VAR_MUX_uxn_c_l151_c18_a19a_return_output;
     VAR_MUX_uxn_c_l153_c6_afd9_cond := VAR_MUX_uxn_c_l151_c18_a19a_return_output;
     REG_VAR_is_fill_left := VAR_MUX_uxn_c_l151_c18_a19a_return_output;
     VAR_fg_vram_update_uxn_c_l165_c19_2037_write_value := VAR_MUX_uxn_c_l168_c3_4137_return_output;
     VAR_BIN_OP_MINUS_uxn_c_l172_c43_9a92_left := VAR_fill_pixels_remaining_MUX_uxn_c_l130_c2_0242_return_output;
     -- MUX[uxn_c_l161_c3_f586] LATENCY=0
     -- Inputs
     MUX_uxn_c_l161_c3_f586_cond <= VAR_MUX_uxn_c_l161_c3_f586_cond;
     MUX_uxn_c_l161_c3_f586_iftrue <= VAR_MUX_uxn_c_l161_c3_f586_iftrue;
     MUX_uxn_c_l161_c3_f586_iffalse <= VAR_MUX_uxn_c_l161_c3_f586_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l161_c3_f586_return_output := MUX_uxn_c_l161_c3_f586_return_output;

     -- MUX[uxn_c_l153_c6_afd9] LATENCY=0
     -- Inputs
     MUX_uxn_c_l153_c6_afd9_cond <= VAR_MUX_uxn_c_l153_c6_afd9_cond;
     MUX_uxn_c_l153_c6_afd9_iftrue <= VAR_MUX_uxn_c_l153_c6_afd9_iftrue;
     MUX_uxn_c_l153_c6_afd9_iffalse <= VAR_MUX_uxn_c_l153_c6_afd9_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l153_c6_afd9_return_output := MUX_uxn_c_l153_c6_afd9_return_output;

     -- BIN_OP_AND[uxn_c_l169_c22_ad2f] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l169_c22_ad2f_left <= VAR_BIN_OP_AND_uxn_c_l169_c22_ad2f_left;
     BIN_OP_AND_uxn_c_l169_c22_ad2f_right <= VAR_BIN_OP_AND_uxn_c_l169_c22_ad2f_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l169_c22_ad2f_return_output := BIN_OP_AND_uxn_c_l169_c22_ad2f_return_output;

     -- BIN_OP_MINUS[uxn_c_l172_c43_9a92] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l172_c43_9a92_left <= VAR_BIN_OP_MINUS_uxn_c_l172_c43_9a92_left;
     BIN_OP_MINUS_uxn_c_l172_c43_9a92_right <= VAR_BIN_OP_MINUS_uxn_c_l172_c43_9a92_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l172_c43_9a92_return_output := BIN_OP_MINUS_uxn_c_l172_c43_9a92_return_output;

     -- BIN_OP_AND[uxn_c_l162_c22_3b54] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l162_c22_3b54_left <= VAR_BIN_OP_AND_uxn_c_l162_c22_3b54_left;
     BIN_OP_AND_uxn_c_l162_c22_3b54_right <= VAR_BIN_OP_AND_uxn_c_l162_c22_3b54_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l162_c22_3b54_return_output := BIN_OP_AND_uxn_c_l162_c22_3b54_return_output;

     -- MUX[uxn_c_l152_c6_7663] LATENCY=0
     -- Inputs
     MUX_uxn_c_l152_c6_7663_cond <= VAR_MUX_uxn_c_l152_c6_7663_cond;
     MUX_uxn_c_l152_c6_7663_iftrue <= VAR_MUX_uxn_c_l152_c6_7663_iftrue;
     MUX_uxn_c_l152_c6_7663_iffalse <= VAR_MUX_uxn_c_l152_c6_7663_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l152_c6_7663_return_output := MUX_uxn_c_l152_c6_7663_return_output;

     -- BIN_OP_PLUS[uxn_c_l149_c45_a1df] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l149_c45_a1df_left <= VAR_BIN_OP_PLUS_uxn_c_l149_c45_a1df_left;
     BIN_OP_PLUS_uxn_c_l149_c45_a1df_right <= VAR_BIN_OP_PLUS_uxn_c_l149_c45_a1df_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l149_c45_a1df_return_output := BIN_OP_PLUS_uxn_c_l149_c45_a1df_return_output;

     -- Submodule level 9
     VAR_BIN_OP_OR_uxn_c_l162_c3_6426_right := VAR_BIN_OP_AND_uxn_c_l162_c22_3b54_return_output;
     VAR_BIN_OP_OR_uxn_c_l169_c3_7aa2_right := VAR_BIN_OP_AND_uxn_c_l169_c22_ad2f_return_output;
     VAR_MUX_uxn_c_l172_c26_3402_iftrue := VAR_BIN_OP_MINUS_uxn_c_l172_c43_9a92_return_output;
     VAR_MUX_uxn_c_l149_c26_92b4_iftrue := resize(VAR_BIN_OP_PLUS_uxn_c_l149_c45_a1df_return_output, 32);
     REG_VAR_y := VAR_MUX_uxn_c_l152_c6_7663_return_output;
     REG_VAR_x := VAR_MUX_uxn_c_l153_c6_afd9_return_output;
     VAR_bg_vram_update_uxn_c_l158_c19_442b_write_value := VAR_MUX_uxn_c_l161_c3_f586_return_output;
     -- BIN_OP_OR[uxn_c_l169_c3_7aa2] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l169_c3_7aa2_left <= VAR_BIN_OP_OR_uxn_c_l169_c3_7aa2_left;
     BIN_OP_OR_uxn_c_l169_c3_7aa2_right <= VAR_BIN_OP_OR_uxn_c_l169_c3_7aa2_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l169_c3_7aa2_return_output := BIN_OP_OR_uxn_c_l169_c3_7aa2_return_output;

     -- MUX[uxn_c_l172_c26_3402] LATENCY=0
     -- Inputs
     MUX_uxn_c_l172_c26_3402_cond <= VAR_MUX_uxn_c_l172_c26_3402_cond;
     MUX_uxn_c_l172_c26_3402_iftrue <= VAR_MUX_uxn_c_l172_c26_3402_iftrue;
     MUX_uxn_c_l172_c26_3402_iffalse <= VAR_MUX_uxn_c_l172_c26_3402_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l172_c26_3402_return_output := MUX_uxn_c_l172_c26_3402_return_output;

     -- BIN_OP_OR[uxn_c_l162_c3_6426] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l162_c3_6426_left <= VAR_BIN_OP_OR_uxn_c_l162_c3_6426_left;
     BIN_OP_OR_uxn_c_l162_c3_6426_right <= VAR_BIN_OP_OR_uxn_c_l162_c3_6426_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l162_c3_6426_return_output := BIN_OP_OR_uxn_c_l162_c3_6426_return_output;

     -- MUX[uxn_c_l149_c26_92b4] LATENCY=0
     -- Inputs
     MUX_uxn_c_l149_c26_92b4_cond <= VAR_MUX_uxn_c_l149_c26_92b4_cond;
     MUX_uxn_c_l149_c26_92b4_iftrue <= VAR_MUX_uxn_c_l149_c26_92b4_iftrue;
     MUX_uxn_c_l149_c26_92b4_iffalse <= VAR_MUX_uxn_c_l149_c26_92b4_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l149_c26_92b4_return_output := MUX_uxn_c_l149_c26_92b4_return_output;

     -- Submodule level 10
     VAR_bg_vram_update_uxn_c_l158_c19_442b_write_enable := VAR_BIN_OP_OR_uxn_c_l162_c3_6426_return_output;
     VAR_fg_vram_update_uxn_c_l165_c19_2037_write_enable := VAR_BIN_OP_OR_uxn_c_l169_c3_7aa2_return_output;
     REG_VAR_adjusted_vram_address := VAR_MUX_uxn_c_l149_c26_92b4_return_output;
     VAR_bg_vram_update_uxn_c_l158_c19_442b_write_address := VAR_MUX_uxn_c_l149_c26_92b4_return_output;
     VAR_fg_vram_update_uxn_c_l165_c19_2037_write_address := VAR_MUX_uxn_c_l149_c26_92b4_return_output;
     VAR_BIN_OP_EQ_uxn_c_l173_c19_47ad_left := VAR_MUX_uxn_c_l172_c26_3402_return_output;
     REG_VAR_fill_pixels_remaining := VAR_MUX_uxn_c_l172_c26_3402_return_output;
     -- bg_vram_update[uxn_c_l158_c19_442b] LATENCY=0
     -- Clock enable
     bg_vram_update_uxn_c_l158_c19_442b_CLOCK_ENABLE <= VAR_bg_vram_update_uxn_c_l158_c19_442b_CLOCK_ENABLE;
     -- Inputs
     bg_vram_update_uxn_c_l158_c19_442b_read_address <= VAR_bg_vram_update_uxn_c_l158_c19_442b_read_address;
     bg_vram_update_uxn_c_l158_c19_442b_write_address <= VAR_bg_vram_update_uxn_c_l158_c19_442b_write_address;
     bg_vram_update_uxn_c_l158_c19_442b_write_value <= VAR_bg_vram_update_uxn_c_l158_c19_442b_write_value;
     bg_vram_update_uxn_c_l158_c19_442b_write_enable <= VAR_bg_vram_update_uxn_c_l158_c19_442b_write_enable;
     -- Outputs
     VAR_bg_vram_update_uxn_c_l158_c19_442b_return_output := bg_vram_update_uxn_c_l158_c19_442b_return_output;

     -- BIN_OP_EQ[uxn_c_l173_c19_47ad] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l173_c19_47ad_left <= VAR_BIN_OP_EQ_uxn_c_l173_c19_47ad_left;
     BIN_OP_EQ_uxn_c_l173_c19_47ad_right <= VAR_BIN_OP_EQ_uxn_c_l173_c19_47ad_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l173_c19_47ad_return_output := BIN_OP_EQ_uxn_c_l173_c19_47ad_return_output;

     -- fg_vram_update[uxn_c_l165_c19_2037] LATENCY=0
     -- Clock enable
     fg_vram_update_uxn_c_l165_c19_2037_CLOCK_ENABLE <= VAR_fg_vram_update_uxn_c_l165_c19_2037_CLOCK_ENABLE;
     -- Inputs
     fg_vram_update_uxn_c_l165_c19_2037_read_address <= VAR_fg_vram_update_uxn_c_l165_c19_2037_read_address;
     fg_vram_update_uxn_c_l165_c19_2037_write_address <= VAR_fg_vram_update_uxn_c_l165_c19_2037_write_address;
     fg_vram_update_uxn_c_l165_c19_2037_write_value <= VAR_fg_vram_update_uxn_c_l165_c19_2037_write_value;
     fg_vram_update_uxn_c_l165_c19_2037_write_enable <= VAR_fg_vram_update_uxn_c_l165_c19_2037_write_enable;
     -- Outputs
     VAR_fg_vram_update_uxn_c_l165_c19_2037_return_output := fg_vram_update_uxn_c_l165_c19_2037_return_output;

     -- Submodule level 11
     VAR_MUX_uxn_c_l173_c19_ed87_cond := VAR_BIN_OP_EQ_uxn_c_l173_c19_47ad_return_output;
     VAR_MUX_uxn_c_l176_c17_5d07_iftrue := VAR_bg_vram_update_uxn_c_l158_c19_442b_return_output;
     REG_VAR_bg_pixel_color := VAR_bg_vram_update_uxn_c_l158_c19_442b_return_output;
     VAR_BIN_OP_EQ_uxn_c_l176_c17_2bb5_left := VAR_fg_vram_update_uxn_c_l165_c19_2037_return_output;
     VAR_MUX_uxn_c_l176_c17_5d07_iffalse := VAR_fg_vram_update_uxn_c_l165_c19_2037_return_output;
     REG_VAR_fg_pixel_color := VAR_fg_vram_update_uxn_c_l165_c19_2037_return_output;
     -- BIN_OP_EQ[uxn_c_l176_c17_2bb5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l176_c17_2bb5_left <= VAR_BIN_OP_EQ_uxn_c_l176_c17_2bb5_left;
     BIN_OP_EQ_uxn_c_l176_c17_2bb5_right <= VAR_BIN_OP_EQ_uxn_c_l176_c17_2bb5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l176_c17_2bb5_return_output := BIN_OP_EQ_uxn_c_l176_c17_2bb5_return_output;

     -- MUX[uxn_c_l173_c19_ed87] LATENCY=0
     -- Inputs
     MUX_uxn_c_l173_c19_ed87_cond <= VAR_MUX_uxn_c_l173_c19_ed87_cond;
     MUX_uxn_c_l173_c19_ed87_iftrue <= VAR_MUX_uxn_c_l173_c19_ed87_iftrue;
     MUX_uxn_c_l173_c19_ed87_iffalse <= VAR_MUX_uxn_c_l173_c19_ed87_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l173_c19_ed87_return_output := MUX_uxn_c_l173_c19_ed87_return_output;

     -- Submodule level 12
     VAR_MUX_uxn_c_l176_c17_5d07_cond := VAR_BIN_OP_EQ_uxn_c_l176_c17_2bb5_return_output;
     REG_VAR_is_fill_active := VAR_MUX_uxn_c_l173_c19_ed87_return_output;
     -- MUX[uxn_c_l176_c17_5d07] LATENCY=0
     -- Inputs
     MUX_uxn_c_l176_c17_5d07_cond <= VAR_MUX_uxn_c_l176_c17_5d07_cond;
     MUX_uxn_c_l176_c17_5d07_iftrue <= VAR_MUX_uxn_c_l176_c17_5d07_iftrue;
     MUX_uxn_c_l176_c17_5d07_iffalse <= VAR_MUX_uxn_c_l176_c17_5d07_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l176_c17_5d07_return_output := MUX_uxn_c_l176_c17_5d07_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_269d_uxn_c_l179_l111_DUPLICATE_135b LATENCY=0
     VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_269d_uxn_c_l179_l111_DUPLICATE_135b_return_output := CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_269d(
     VAR_MUX_uxn_c_l175_c25_4827_return_output,
     VAR_MUX_uxn_c_l176_c17_5d07_return_output,
     VAR_MUX_uxn_c_l173_c19_ed87_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_269d_uxn_c_l179_l111_DUPLICATE_135b_return_output;
     VAR_return_output := VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_269d_uxn_c_l179_l111_DUPLICATE_135b_return_output;
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
