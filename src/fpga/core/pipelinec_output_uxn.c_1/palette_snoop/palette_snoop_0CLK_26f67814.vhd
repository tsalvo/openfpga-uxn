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
-- Submodules: 84
entity palette_snoop_0CLK_26f67814 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 device_ram_address : in unsigned(7 downto 0);
 device_ram_value : in unsigned(7 downto 0);
 is_device_ram_write : in unsigned(0 downto 0);
 gpu_step_color : in unsigned(1 downto 0);
 return_output : out unsigned(15 downto 0));
end palette_snoop_0CLK_26f67814;
architecture arch of palette_snoop_0CLK_26f67814 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal color0 : unsigned(11 downto 0) := to_unsigned(4095, 12);
signal color1 : unsigned(11 downto 0) := to_unsigned(0, 12);
signal color2 : unsigned(11 downto 0) := to_unsigned(2011, 12);
signal color3 : unsigned(11 downto 0) := to_unsigned(3938, 12);
signal color_cmp_0 : unsigned(3 downto 0) := to_unsigned(0, 4);
signal color_cmp_1 : unsigned(3 downto 0) := to_unsigned(0, 4);
signal tmp12 : unsigned(11 downto 0) := to_unsigned(0, 12);
signal result : unsigned(15 downto 0) := to_unsigned(0, 16);
signal REG_COMB_color0 : unsigned(11 downto 0);
signal REG_COMB_color1 : unsigned(11 downto 0);
signal REG_COMB_color2 : unsigned(11 downto 0);
signal REG_COMB_color3 : unsigned(11 downto 0);
signal REG_COMB_color_cmp_0 : unsigned(3 downto 0);
signal REG_COMB_color_cmp_1 : unsigned(3 downto 0);
signal REG_COMB_tmp12 : unsigned(11 downto 0);
signal REG_COMB_result : unsigned(15 downto 0);

-- Each function instance gets signals
-- color3_MUX[uxn_c_l211_c2_89fb]
signal color3_MUX_uxn_c_l211_c2_89fb_cond : unsigned(0 downto 0);
signal color3_MUX_uxn_c_l211_c2_89fb_iftrue : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l211_c2_89fb_iffalse : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l211_c2_89fb_return_output : unsigned(11 downto 0);

-- color1_MUX[uxn_c_l211_c2_89fb]
signal color1_MUX_uxn_c_l211_c2_89fb_cond : unsigned(0 downto 0);
signal color1_MUX_uxn_c_l211_c2_89fb_iftrue : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l211_c2_89fb_iffalse : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l211_c2_89fb_return_output : unsigned(11 downto 0);

-- color2_MUX[uxn_c_l211_c2_89fb]
signal color2_MUX_uxn_c_l211_c2_89fb_cond : unsigned(0 downto 0);
signal color2_MUX_uxn_c_l211_c2_89fb_iftrue : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l211_c2_89fb_iffalse : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l211_c2_89fb_return_output : unsigned(11 downto 0);

-- tmp12_MUX[uxn_c_l211_c2_89fb]
signal tmp12_MUX_uxn_c_l211_c2_89fb_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_c_l211_c2_89fb_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l211_c2_89fb_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l211_c2_89fb_return_output : unsigned(11 downto 0);

-- color_cmp_1_MUX[uxn_c_l211_c2_89fb]
signal color_cmp_1_MUX_uxn_c_l211_c2_89fb_cond : unsigned(0 downto 0);
signal color_cmp_1_MUX_uxn_c_l211_c2_89fb_iftrue : unsigned(3 downto 0);
signal color_cmp_1_MUX_uxn_c_l211_c2_89fb_iffalse : unsigned(3 downto 0);
signal color_cmp_1_MUX_uxn_c_l211_c2_89fb_return_output : unsigned(3 downto 0);

-- color_cmp_0_MUX[uxn_c_l211_c2_89fb]
signal color_cmp_0_MUX_uxn_c_l211_c2_89fb_cond : unsigned(0 downto 0);
signal color_cmp_0_MUX_uxn_c_l211_c2_89fb_iftrue : unsigned(3 downto 0);
signal color_cmp_0_MUX_uxn_c_l211_c2_89fb_iffalse : unsigned(3 downto 0);
signal color_cmp_0_MUX_uxn_c_l211_c2_89fb_return_output : unsigned(3 downto 0);

-- color0_MUX[uxn_c_l211_c2_89fb]
signal color0_MUX_uxn_c_l211_c2_89fb_cond : unsigned(0 downto 0);
signal color0_MUX_uxn_c_l211_c2_89fb_iftrue : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l211_c2_89fb_iffalse : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l211_c2_89fb_return_output : unsigned(11 downto 0);

-- CONST_SR_4[uxn_c_l212_c27_daf2]
signal CONST_SR_4_uxn_c_l212_c27_daf2_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_c_l212_c27_daf2_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_c_l214_c7_3769]
signal BIN_OP_EQ_uxn_c_l214_c7_3769_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l214_c7_3769_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l214_c7_3769_return_output : unsigned(0 downto 0);

-- color3_MUX[uxn_c_l214_c3_6f37]
signal color3_MUX_uxn_c_l214_c3_6f37_cond : unsigned(0 downto 0);
signal color3_MUX_uxn_c_l214_c3_6f37_iftrue : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l214_c3_6f37_iffalse : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l214_c3_6f37_return_output : unsigned(11 downto 0);

-- color1_MUX[uxn_c_l214_c3_6f37]
signal color1_MUX_uxn_c_l214_c3_6f37_cond : unsigned(0 downto 0);
signal color1_MUX_uxn_c_l214_c3_6f37_iftrue : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l214_c3_6f37_iffalse : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l214_c3_6f37_return_output : unsigned(11 downto 0);

-- color2_MUX[uxn_c_l214_c3_6f37]
signal color2_MUX_uxn_c_l214_c3_6f37_cond : unsigned(0 downto 0);
signal color2_MUX_uxn_c_l214_c3_6f37_iftrue : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l214_c3_6f37_iffalse : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l214_c3_6f37_return_output : unsigned(11 downto 0);

-- tmp12_MUX[uxn_c_l214_c3_6f37]
signal tmp12_MUX_uxn_c_l214_c3_6f37_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_c_l214_c3_6f37_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l214_c3_6f37_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l214_c3_6f37_return_output : unsigned(11 downto 0);

-- color0_MUX[uxn_c_l214_c3_6f37]
signal color0_MUX_uxn_c_l214_c3_6f37_cond : unsigned(0 downto 0);
signal color0_MUX_uxn_c_l214_c3_6f37_iftrue : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l214_c3_6f37_iffalse : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l214_c3_6f37_return_output : unsigned(11 downto 0);

-- CONST_SL_8[uxn_c_l216_c4_a2dd]
signal CONST_SL_8_uxn_c_l216_c4_a2dd_x : unsigned(11 downto 0);
signal CONST_SL_8_uxn_c_l216_c4_a2dd_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l217_c4_37a9]
signal BIN_OP_AND_uxn_c_l217_c4_37a9_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l217_c4_37a9_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l217_c4_37a9_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l218_c4_2216]
signal BIN_OP_OR_uxn_c_l218_c4_2216_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l218_c4_2216_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l218_c4_2216_return_output : unsigned(11 downto 0);

-- CONST_SL_8[uxn_c_l221_c4_696c]
signal CONST_SL_8_uxn_c_l221_c4_696c_x : unsigned(11 downto 0);
signal CONST_SL_8_uxn_c_l221_c4_696c_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l222_c4_3c84]
signal BIN_OP_AND_uxn_c_l222_c4_3c84_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l222_c4_3c84_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l222_c4_3c84_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l223_c4_15bc]
signal BIN_OP_OR_uxn_c_l223_c4_15bc_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l223_c4_15bc_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l223_c4_15bc_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l225_c12_cb3f]
signal BIN_OP_EQ_uxn_c_l225_c12_cb3f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l225_c12_cb3f_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l225_c12_cb3f_return_output : unsigned(0 downto 0);

-- color3_MUX[uxn_c_l225_c8_b006]
signal color3_MUX_uxn_c_l225_c8_b006_cond : unsigned(0 downto 0);
signal color3_MUX_uxn_c_l225_c8_b006_iftrue : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l225_c8_b006_iffalse : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l225_c8_b006_return_output : unsigned(11 downto 0);

-- color1_MUX[uxn_c_l225_c8_b006]
signal color1_MUX_uxn_c_l225_c8_b006_cond : unsigned(0 downto 0);
signal color1_MUX_uxn_c_l225_c8_b006_iftrue : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l225_c8_b006_iffalse : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l225_c8_b006_return_output : unsigned(11 downto 0);

-- color2_MUX[uxn_c_l225_c8_b006]
signal color2_MUX_uxn_c_l225_c8_b006_cond : unsigned(0 downto 0);
signal color2_MUX_uxn_c_l225_c8_b006_iftrue : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l225_c8_b006_iffalse : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l225_c8_b006_return_output : unsigned(11 downto 0);

-- tmp12_MUX[uxn_c_l225_c8_b006]
signal tmp12_MUX_uxn_c_l225_c8_b006_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_c_l225_c8_b006_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l225_c8_b006_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l225_c8_b006_return_output : unsigned(11 downto 0);

-- color0_MUX[uxn_c_l225_c8_b006]
signal color0_MUX_uxn_c_l225_c8_b006_cond : unsigned(0 downto 0);
signal color0_MUX_uxn_c_l225_c8_b006_iftrue : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l225_c8_b006_iffalse : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l225_c8_b006_return_output : unsigned(11 downto 0);

-- CONST_SL_8[uxn_c_l227_c4_e8ae]
signal CONST_SL_8_uxn_c_l227_c4_e8ae_x : unsigned(11 downto 0);
signal CONST_SL_8_uxn_c_l227_c4_e8ae_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l228_c4_a278]
signal BIN_OP_AND_uxn_c_l228_c4_a278_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l228_c4_a278_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l228_c4_a278_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l229_c4_c2a7]
signal BIN_OP_OR_uxn_c_l229_c4_c2a7_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l229_c4_c2a7_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l229_c4_c2a7_return_output : unsigned(11 downto 0);

-- CONST_SL_8[uxn_c_l232_c4_2dc1]
signal CONST_SL_8_uxn_c_l232_c4_2dc1_x : unsigned(11 downto 0);
signal CONST_SL_8_uxn_c_l232_c4_2dc1_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l233_c4_f8c2]
signal BIN_OP_AND_uxn_c_l233_c4_f8c2_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l233_c4_f8c2_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l233_c4_f8c2_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l234_c4_670d]
signal BIN_OP_OR_uxn_c_l234_c4_670d_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l234_c4_670d_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l234_c4_670d_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l236_c12_2a8a]
signal BIN_OP_EQ_uxn_c_l236_c12_2a8a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l236_c12_2a8a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l236_c12_2a8a_return_output : unsigned(0 downto 0);

-- color3_MUX[uxn_c_l236_c8_9418]
signal color3_MUX_uxn_c_l236_c8_9418_cond : unsigned(0 downto 0);
signal color3_MUX_uxn_c_l236_c8_9418_iftrue : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l236_c8_9418_iffalse : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l236_c8_9418_return_output : unsigned(11 downto 0);

-- color1_MUX[uxn_c_l236_c8_9418]
signal color1_MUX_uxn_c_l236_c8_9418_cond : unsigned(0 downto 0);
signal color1_MUX_uxn_c_l236_c8_9418_iftrue : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l236_c8_9418_iffalse : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l236_c8_9418_return_output : unsigned(11 downto 0);

-- color2_MUX[uxn_c_l236_c8_9418]
signal color2_MUX_uxn_c_l236_c8_9418_cond : unsigned(0 downto 0);
signal color2_MUX_uxn_c_l236_c8_9418_iftrue : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l236_c8_9418_iffalse : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l236_c8_9418_return_output : unsigned(11 downto 0);

-- tmp12_MUX[uxn_c_l236_c8_9418]
signal tmp12_MUX_uxn_c_l236_c8_9418_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_c_l236_c8_9418_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l236_c8_9418_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l236_c8_9418_return_output : unsigned(11 downto 0);

-- color0_MUX[uxn_c_l236_c8_9418]
signal color0_MUX_uxn_c_l236_c8_9418_cond : unsigned(0 downto 0);
signal color0_MUX_uxn_c_l236_c8_9418_iftrue : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l236_c8_9418_iffalse : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l236_c8_9418_return_output : unsigned(11 downto 0);

-- CONST_SL_4[uxn_c_l238_c4_9c07]
signal CONST_SL_4_uxn_c_l238_c4_9c07_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_c_l238_c4_9c07_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l239_c4_0e8c]
signal BIN_OP_AND_uxn_c_l239_c4_0e8c_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l239_c4_0e8c_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l239_c4_0e8c_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l240_c4_70d6]
signal BIN_OP_OR_uxn_c_l240_c4_70d6_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l240_c4_70d6_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l240_c4_70d6_return_output : unsigned(11 downto 0);

-- CONST_SL_4[uxn_c_l243_c4_ca36]
signal CONST_SL_4_uxn_c_l243_c4_ca36_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_c_l243_c4_ca36_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l244_c4_d70c]
signal BIN_OP_AND_uxn_c_l244_c4_d70c_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l244_c4_d70c_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l244_c4_d70c_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l245_c4_a8af]
signal BIN_OP_OR_uxn_c_l245_c4_a8af_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l245_c4_a8af_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l245_c4_a8af_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l247_c12_895d]
signal BIN_OP_EQ_uxn_c_l247_c12_895d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l247_c12_895d_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l247_c12_895d_return_output : unsigned(0 downto 0);

-- color3_MUX[uxn_c_l247_c8_ab90]
signal color3_MUX_uxn_c_l247_c8_ab90_cond : unsigned(0 downto 0);
signal color3_MUX_uxn_c_l247_c8_ab90_iftrue : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l247_c8_ab90_iffalse : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l247_c8_ab90_return_output : unsigned(11 downto 0);

-- color1_MUX[uxn_c_l247_c8_ab90]
signal color1_MUX_uxn_c_l247_c8_ab90_cond : unsigned(0 downto 0);
signal color1_MUX_uxn_c_l247_c8_ab90_iftrue : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l247_c8_ab90_iffalse : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l247_c8_ab90_return_output : unsigned(11 downto 0);

-- color2_MUX[uxn_c_l247_c8_ab90]
signal color2_MUX_uxn_c_l247_c8_ab90_cond : unsigned(0 downto 0);
signal color2_MUX_uxn_c_l247_c8_ab90_iftrue : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l247_c8_ab90_iffalse : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l247_c8_ab90_return_output : unsigned(11 downto 0);

-- tmp12_MUX[uxn_c_l247_c8_ab90]
signal tmp12_MUX_uxn_c_l247_c8_ab90_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_c_l247_c8_ab90_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l247_c8_ab90_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l247_c8_ab90_return_output : unsigned(11 downto 0);

-- color0_MUX[uxn_c_l247_c8_ab90]
signal color0_MUX_uxn_c_l247_c8_ab90_cond : unsigned(0 downto 0);
signal color0_MUX_uxn_c_l247_c8_ab90_iftrue : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l247_c8_ab90_iffalse : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l247_c8_ab90_return_output : unsigned(11 downto 0);

-- CONST_SL_4[uxn_c_l249_c4_9aac]
signal CONST_SL_4_uxn_c_l249_c4_9aac_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_c_l249_c4_9aac_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l250_c4_1120]
signal BIN_OP_AND_uxn_c_l250_c4_1120_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l250_c4_1120_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l250_c4_1120_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l251_c4_dde2]
signal BIN_OP_OR_uxn_c_l251_c4_dde2_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l251_c4_dde2_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l251_c4_dde2_return_output : unsigned(11 downto 0);

-- CONST_SL_4[uxn_c_l254_c4_c632]
signal CONST_SL_4_uxn_c_l254_c4_c632_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_c_l254_c4_c632_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l255_c4_8c21]
signal BIN_OP_AND_uxn_c_l255_c4_8c21_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l255_c4_8c21_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l255_c4_8c21_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l256_c4_28ff]
signal BIN_OP_OR_uxn_c_l256_c4_28ff_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l256_c4_28ff_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l256_c4_28ff_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l258_c12_66c6]
signal BIN_OP_EQ_uxn_c_l258_c12_66c6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l258_c12_66c6_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l258_c12_66c6_return_output : unsigned(0 downto 0);

-- color3_MUX[uxn_c_l258_c8_7a30]
signal color3_MUX_uxn_c_l258_c8_7a30_cond : unsigned(0 downto 0);
signal color3_MUX_uxn_c_l258_c8_7a30_iftrue : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l258_c8_7a30_iffalse : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l258_c8_7a30_return_output : unsigned(11 downto 0);

-- color1_MUX[uxn_c_l258_c8_7a30]
signal color1_MUX_uxn_c_l258_c8_7a30_cond : unsigned(0 downto 0);
signal color1_MUX_uxn_c_l258_c8_7a30_iftrue : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l258_c8_7a30_iffalse : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l258_c8_7a30_return_output : unsigned(11 downto 0);

-- color2_MUX[uxn_c_l258_c8_7a30]
signal color2_MUX_uxn_c_l258_c8_7a30_cond : unsigned(0 downto 0);
signal color2_MUX_uxn_c_l258_c8_7a30_iftrue : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l258_c8_7a30_iffalse : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l258_c8_7a30_return_output : unsigned(11 downto 0);

-- tmp12_MUX[uxn_c_l258_c8_7a30]
signal tmp12_MUX_uxn_c_l258_c8_7a30_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_c_l258_c8_7a30_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l258_c8_7a30_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l258_c8_7a30_return_output : unsigned(11 downto 0);

-- color0_MUX[uxn_c_l258_c8_7a30]
signal color0_MUX_uxn_c_l258_c8_7a30_cond : unsigned(0 downto 0);
signal color0_MUX_uxn_c_l258_c8_7a30_iftrue : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l258_c8_7a30_iffalse : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l258_c8_7a30_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l260_c4_4d7f]
signal BIN_OP_AND_uxn_c_l260_c4_4d7f_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l260_c4_4d7f_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l260_c4_4d7f_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l261_c4_d827]
signal BIN_OP_OR_uxn_c_l261_c4_d827_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l261_c4_d827_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l261_c4_d827_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l264_c4_3f03]
signal BIN_OP_AND_uxn_c_l264_c4_3f03_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l264_c4_3f03_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l264_c4_3f03_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l265_c4_f53a]
signal BIN_OP_OR_uxn_c_l265_c4_f53a_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l265_c4_f53a_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l265_c4_f53a_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l267_c12_3892]
signal BIN_OP_EQ_uxn_c_l267_c12_3892_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l267_c12_3892_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l267_c12_3892_return_output : unsigned(0 downto 0);

-- color3_MUX[uxn_c_l267_c8_35ec]
signal color3_MUX_uxn_c_l267_c8_35ec_cond : unsigned(0 downto 0);
signal color3_MUX_uxn_c_l267_c8_35ec_iftrue : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l267_c8_35ec_iffalse : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l267_c8_35ec_return_output : unsigned(11 downto 0);

-- color2_MUX[uxn_c_l267_c8_35ec]
signal color2_MUX_uxn_c_l267_c8_35ec_cond : unsigned(0 downto 0);
signal color2_MUX_uxn_c_l267_c8_35ec_iftrue : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l267_c8_35ec_iffalse : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l267_c8_35ec_return_output : unsigned(11 downto 0);

-- tmp12_MUX[uxn_c_l267_c8_35ec]
signal tmp12_MUX_uxn_c_l267_c8_35ec_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_c_l267_c8_35ec_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l267_c8_35ec_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l267_c8_35ec_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l269_c4_ba31]
signal BIN_OP_AND_uxn_c_l269_c4_ba31_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l269_c4_ba31_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l269_c4_ba31_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l270_c4_ff24]
signal BIN_OP_OR_uxn_c_l270_c4_ff24_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l270_c4_ff24_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l270_c4_ff24_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l273_c4_9a6e]
signal BIN_OP_AND_uxn_c_l273_c4_9a6e_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l273_c4_9a6e_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l273_c4_9a6e_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l274_c4_7ced]
signal BIN_OP_OR_uxn_c_l274_c4_7ced_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l274_c4_7ced_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l274_c4_7ced_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l278_c6_1e20]
signal BIN_OP_EQ_uxn_c_l278_c6_1e20_left : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l278_c6_1e20_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l278_c6_1e20_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_c_l278_c2_5ca5]
signal result_MUX_uxn_c_l278_c2_5ca5_cond : unsigned(0 downto 0);
signal result_MUX_uxn_c_l278_c2_5ca5_iftrue : unsigned(15 downto 0);
signal result_MUX_uxn_c_l278_c2_5ca5_iffalse : unsigned(15 downto 0);
signal result_MUX_uxn_c_l278_c2_5ca5_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l280_c13_9585]
signal BIN_OP_EQ_uxn_c_l280_c13_9585_left : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l280_c13_9585_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l280_c13_9585_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_c_l280_c9_e27c]
signal result_MUX_uxn_c_l280_c9_e27c_cond : unsigned(0 downto 0);
signal result_MUX_uxn_c_l280_c9_e27c_iftrue : unsigned(15 downto 0);
signal result_MUX_uxn_c_l280_c9_e27c_iffalse : unsigned(15 downto 0);
signal result_MUX_uxn_c_l280_c9_e27c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l282_c13_1477]
signal BIN_OP_EQ_uxn_c_l282_c13_1477_left : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l282_c13_1477_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l282_c13_1477_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_c_l282_c9_48cd]
signal result_MUX_uxn_c_l282_c9_48cd_cond : unsigned(0 downto 0);
signal result_MUX_uxn_c_l282_c9_48cd_iftrue : unsigned(15 downto 0);
signal result_MUX_uxn_c_l282_c9_48cd_iffalse : unsigned(15 downto 0);
signal result_MUX_uxn_c_l282_c9_48cd_return_output : unsigned(15 downto 0);

function CAST_TO_uint4_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(3 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,4)));
    return return_output;
end function;

function CAST_TO_uint12_t_uint4_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(3 downto 0);
  variable return_output : unsigned(11 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,12)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- color3_MUX_uxn_c_l211_c2_89fb
color3_MUX_uxn_c_l211_c2_89fb : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color3_MUX_uxn_c_l211_c2_89fb_cond,
color3_MUX_uxn_c_l211_c2_89fb_iftrue,
color3_MUX_uxn_c_l211_c2_89fb_iffalse,
color3_MUX_uxn_c_l211_c2_89fb_return_output);

-- color1_MUX_uxn_c_l211_c2_89fb
color1_MUX_uxn_c_l211_c2_89fb : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color1_MUX_uxn_c_l211_c2_89fb_cond,
color1_MUX_uxn_c_l211_c2_89fb_iftrue,
color1_MUX_uxn_c_l211_c2_89fb_iffalse,
color1_MUX_uxn_c_l211_c2_89fb_return_output);

-- color2_MUX_uxn_c_l211_c2_89fb
color2_MUX_uxn_c_l211_c2_89fb : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color2_MUX_uxn_c_l211_c2_89fb_cond,
color2_MUX_uxn_c_l211_c2_89fb_iftrue,
color2_MUX_uxn_c_l211_c2_89fb_iffalse,
color2_MUX_uxn_c_l211_c2_89fb_return_output);

-- tmp12_MUX_uxn_c_l211_c2_89fb
tmp12_MUX_uxn_c_l211_c2_89fb : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_c_l211_c2_89fb_cond,
tmp12_MUX_uxn_c_l211_c2_89fb_iftrue,
tmp12_MUX_uxn_c_l211_c2_89fb_iffalse,
tmp12_MUX_uxn_c_l211_c2_89fb_return_output);

-- color_cmp_1_MUX_uxn_c_l211_c2_89fb
color_cmp_1_MUX_uxn_c_l211_c2_89fb : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_cmp_1_MUX_uxn_c_l211_c2_89fb_cond,
color_cmp_1_MUX_uxn_c_l211_c2_89fb_iftrue,
color_cmp_1_MUX_uxn_c_l211_c2_89fb_iffalse,
color_cmp_1_MUX_uxn_c_l211_c2_89fb_return_output);

-- color_cmp_0_MUX_uxn_c_l211_c2_89fb
color_cmp_0_MUX_uxn_c_l211_c2_89fb : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_cmp_0_MUX_uxn_c_l211_c2_89fb_cond,
color_cmp_0_MUX_uxn_c_l211_c2_89fb_iftrue,
color_cmp_0_MUX_uxn_c_l211_c2_89fb_iffalse,
color_cmp_0_MUX_uxn_c_l211_c2_89fb_return_output);

-- color0_MUX_uxn_c_l211_c2_89fb
color0_MUX_uxn_c_l211_c2_89fb : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color0_MUX_uxn_c_l211_c2_89fb_cond,
color0_MUX_uxn_c_l211_c2_89fb_iftrue,
color0_MUX_uxn_c_l211_c2_89fb_iffalse,
color0_MUX_uxn_c_l211_c2_89fb_return_output);

-- CONST_SR_4_uxn_c_l212_c27_daf2
CONST_SR_4_uxn_c_l212_c27_daf2 : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_c_l212_c27_daf2_x,
CONST_SR_4_uxn_c_l212_c27_daf2_return_output);

-- BIN_OP_EQ_uxn_c_l214_c7_3769
BIN_OP_EQ_uxn_c_l214_c7_3769 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l214_c7_3769_left,
BIN_OP_EQ_uxn_c_l214_c7_3769_right,
BIN_OP_EQ_uxn_c_l214_c7_3769_return_output);

-- color3_MUX_uxn_c_l214_c3_6f37
color3_MUX_uxn_c_l214_c3_6f37 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color3_MUX_uxn_c_l214_c3_6f37_cond,
color3_MUX_uxn_c_l214_c3_6f37_iftrue,
color3_MUX_uxn_c_l214_c3_6f37_iffalse,
color3_MUX_uxn_c_l214_c3_6f37_return_output);

-- color1_MUX_uxn_c_l214_c3_6f37
color1_MUX_uxn_c_l214_c3_6f37 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color1_MUX_uxn_c_l214_c3_6f37_cond,
color1_MUX_uxn_c_l214_c3_6f37_iftrue,
color1_MUX_uxn_c_l214_c3_6f37_iffalse,
color1_MUX_uxn_c_l214_c3_6f37_return_output);

-- color2_MUX_uxn_c_l214_c3_6f37
color2_MUX_uxn_c_l214_c3_6f37 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color2_MUX_uxn_c_l214_c3_6f37_cond,
color2_MUX_uxn_c_l214_c3_6f37_iftrue,
color2_MUX_uxn_c_l214_c3_6f37_iffalse,
color2_MUX_uxn_c_l214_c3_6f37_return_output);

-- tmp12_MUX_uxn_c_l214_c3_6f37
tmp12_MUX_uxn_c_l214_c3_6f37 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_c_l214_c3_6f37_cond,
tmp12_MUX_uxn_c_l214_c3_6f37_iftrue,
tmp12_MUX_uxn_c_l214_c3_6f37_iffalse,
tmp12_MUX_uxn_c_l214_c3_6f37_return_output);

-- color0_MUX_uxn_c_l214_c3_6f37
color0_MUX_uxn_c_l214_c3_6f37 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color0_MUX_uxn_c_l214_c3_6f37_cond,
color0_MUX_uxn_c_l214_c3_6f37_iftrue,
color0_MUX_uxn_c_l214_c3_6f37_iffalse,
color0_MUX_uxn_c_l214_c3_6f37_return_output);

-- CONST_SL_8_uxn_c_l216_c4_a2dd
CONST_SL_8_uxn_c_l216_c4_a2dd : entity work.CONST_SL_8_uint12_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l216_c4_a2dd_x,
CONST_SL_8_uxn_c_l216_c4_a2dd_return_output);

-- BIN_OP_AND_uxn_c_l217_c4_37a9
BIN_OP_AND_uxn_c_l217_c4_37a9 : entity work.BIN_OP_AND_uint12_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l217_c4_37a9_left,
BIN_OP_AND_uxn_c_l217_c4_37a9_right,
BIN_OP_AND_uxn_c_l217_c4_37a9_return_output);

-- BIN_OP_OR_uxn_c_l218_c4_2216
BIN_OP_OR_uxn_c_l218_c4_2216 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l218_c4_2216_left,
BIN_OP_OR_uxn_c_l218_c4_2216_right,
BIN_OP_OR_uxn_c_l218_c4_2216_return_output);

-- CONST_SL_8_uxn_c_l221_c4_696c
CONST_SL_8_uxn_c_l221_c4_696c : entity work.CONST_SL_8_uint12_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l221_c4_696c_x,
CONST_SL_8_uxn_c_l221_c4_696c_return_output);

-- BIN_OP_AND_uxn_c_l222_c4_3c84
BIN_OP_AND_uxn_c_l222_c4_3c84 : entity work.BIN_OP_AND_uint12_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l222_c4_3c84_left,
BIN_OP_AND_uxn_c_l222_c4_3c84_right,
BIN_OP_AND_uxn_c_l222_c4_3c84_return_output);

-- BIN_OP_OR_uxn_c_l223_c4_15bc
BIN_OP_OR_uxn_c_l223_c4_15bc : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l223_c4_15bc_left,
BIN_OP_OR_uxn_c_l223_c4_15bc_right,
BIN_OP_OR_uxn_c_l223_c4_15bc_return_output);

-- BIN_OP_EQ_uxn_c_l225_c12_cb3f
BIN_OP_EQ_uxn_c_l225_c12_cb3f : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l225_c12_cb3f_left,
BIN_OP_EQ_uxn_c_l225_c12_cb3f_right,
BIN_OP_EQ_uxn_c_l225_c12_cb3f_return_output);

-- color3_MUX_uxn_c_l225_c8_b006
color3_MUX_uxn_c_l225_c8_b006 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color3_MUX_uxn_c_l225_c8_b006_cond,
color3_MUX_uxn_c_l225_c8_b006_iftrue,
color3_MUX_uxn_c_l225_c8_b006_iffalse,
color3_MUX_uxn_c_l225_c8_b006_return_output);

-- color1_MUX_uxn_c_l225_c8_b006
color1_MUX_uxn_c_l225_c8_b006 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color1_MUX_uxn_c_l225_c8_b006_cond,
color1_MUX_uxn_c_l225_c8_b006_iftrue,
color1_MUX_uxn_c_l225_c8_b006_iffalse,
color1_MUX_uxn_c_l225_c8_b006_return_output);

-- color2_MUX_uxn_c_l225_c8_b006
color2_MUX_uxn_c_l225_c8_b006 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color2_MUX_uxn_c_l225_c8_b006_cond,
color2_MUX_uxn_c_l225_c8_b006_iftrue,
color2_MUX_uxn_c_l225_c8_b006_iffalse,
color2_MUX_uxn_c_l225_c8_b006_return_output);

-- tmp12_MUX_uxn_c_l225_c8_b006
tmp12_MUX_uxn_c_l225_c8_b006 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_c_l225_c8_b006_cond,
tmp12_MUX_uxn_c_l225_c8_b006_iftrue,
tmp12_MUX_uxn_c_l225_c8_b006_iffalse,
tmp12_MUX_uxn_c_l225_c8_b006_return_output);

-- color0_MUX_uxn_c_l225_c8_b006
color0_MUX_uxn_c_l225_c8_b006 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color0_MUX_uxn_c_l225_c8_b006_cond,
color0_MUX_uxn_c_l225_c8_b006_iftrue,
color0_MUX_uxn_c_l225_c8_b006_iffalse,
color0_MUX_uxn_c_l225_c8_b006_return_output);

-- CONST_SL_8_uxn_c_l227_c4_e8ae
CONST_SL_8_uxn_c_l227_c4_e8ae : entity work.CONST_SL_8_uint12_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l227_c4_e8ae_x,
CONST_SL_8_uxn_c_l227_c4_e8ae_return_output);

-- BIN_OP_AND_uxn_c_l228_c4_a278
BIN_OP_AND_uxn_c_l228_c4_a278 : entity work.BIN_OP_AND_uint12_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l228_c4_a278_left,
BIN_OP_AND_uxn_c_l228_c4_a278_right,
BIN_OP_AND_uxn_c_l228_c4_a278_return_output);

-- BIN_OP_OR_uxn_c_l229_c4_c2a7
BIN_OP_OR_uxn_c_l229_c4_c2a7 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l229_c4_c2a7_left,
BIN_OP_OR_uxn_c_l229_c4_c2a7_right,
BIN_OP_OR_uxn_c_l229_c4_c2a7_return_output);

-- CONST_SL_8_uxn_c_l232_c4_2dc1
CONST_SL_8_uxn_c_l232_c4_2dc1 : entity work.CONST_SL_8_uint12_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l232_c4_2dc1_x,
CONST_SL_8_uxn_c_l232_c4_2dc1_return_output);

-- BIN_OP_AND_uxn_c_l233_c4_f8c2
BIN_OP_AND_uxn_c_l233_c4_f8c2 : entity work.BIN_OP_AND_uint12_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l233_c4_f8c2_left,
BIN_OP_AND_uxn_c_l233_c4_f8c2_right,
BIN_OP_AND_uxn_c_l233_c4_f8c2_return_output);

-- BIN_OP_OR_uxn_c_l234_c4_670d
BIN_OP_OR_uxn_c_l234_c4_670d : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l234_c4_670d_left,
BIN_OP_OR_uxn_c_l234_c4_670d_right,
BIN_OP_OR_uxn_c_l234_c4_670d_return_output);

-- BIN_OP_EQ_uxn_c_l236_c12_2a8a
BIN_OP_EQ_uxn_c_l236_c12_2a8a : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l236_c12_2a8a_left,
BIN_OP_EQ_uxn_c_l236_c12_2a8a_right,
BIN_OP_EQ_uxn_c_l236_c12_2a8a_return_output);

-- color3_MUX_uxn_c_l236_c8_9418
color3_MUX_uxn_c_l236_c8_9418 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color3_MUX_uxn_c_l236_c8_9418_cond,
color3_MUX_uxn_c_l236_c8_9418_iftrue,
color3_MUX_uxn_c_l236_c8_9418_iffalse,
color3_MUX_uxn_c_l236_c8_9418_return_output);

-- color1_MUX_uxn_c_l236_c8_9418
color1_MUX_uxn_c_l236_c8_9418 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color1_MUX_uxn_c_l236_c8_9418_cond,
color1_MUX_uxn_c_l236_c8_9418_iftrue,
color1_MUX_uxn_c_l236_c8_9418_iffalse,
color1_MUX_uxn_c_l236_c8_9418_return_output);

-- color2_MUX_uxn_c_l236_c8_9418
color2_MUX_uxn_c_l236_c8_9418 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color2_MUX_uxn_c_l236_c8_9418_cond,
color2_MUX_uxn_c_l236_c8_9418_iftrue,
color2_MUX_uxn_c_l236_c8_9418_iffalse,
color2_MUX_uxn_c_l236_c8_9418_return_output);

-- tmp12_MUX_uxn_c_l236_c8_9418
tmp12_MUX_uxn_c_l236_c8_9418 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_c_l236_c8_9418_cond,
tmp12_MUX_uxn_c_l236_c8_9418_iftrue,
tmp12_MUX_uxn_c_l236_c8_9418_iffalse,
tmp12_MUX_uxn_c_l236_c8_9418_return_output);

-- color0_MUX_uxn_c_l236_c8_9418
color0_MUX_uxn_c_l236_c8_9418 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color0_MUX_uxn_c_l236_c8_9418_cond,
color0_MUX_uxn_c_l236_c8_9418_iftrue,
color0_MUX_uxn_c_l236_c8_9418_iffalse,
color0_MUX_uxn_c_l236_c8_9418_return_output);

-- CONST_SL_4_uxn_c_l238_c4_9c07
CONST_SL_4_uxn_c_l238_c4_9c07 : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_c_l238_c4_9c07_x,
CONST_SL_4_uxn_c_l238_c4_9c07_return_output);

-- BIN_OP_AND_uxn_c_l239_c4_0e8c
BIN_OP_AND_uxn_c_l239_c4_0e8c : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l239_c4_0e8c_left,
BIN_OP_AND_uxn_c_l239_c4_0e8c_right,
BIN_OP_AND_uxn_c_l239_c4_0e8c_return_output);

-- BIN_OP_OR_uxn_c_l240_c4_70d6
BIN_OP_OR_uxn_c_l240_c4_70d6 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l240_c4_70d6_left,
BIN_OP_OR_uxn_c_l240_c4_70d6_right,
BIN_OP_OR_uxn_c_l240_c4_70d6_return_output);

-- CONST_SL_4_uxn_c_l243_c4_ca36
CONST_SL_4_uxn_c_l243_c4_ca36 : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_c_l243_c4_ca36_x,
CONST_SL_4_uxn_c_l243_c4_ca36_return_output);

-- BIN_OP_AND_uxn_c_l244_c4_d70c
BIN_OP_AND_uxn_c_l244_c4_d70c : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l244_c4_d70c_left,
BIN_OP_AND_uxn_c_l244_c4_d70c_right,
BIN_OP_AND_uxn_c_l244_c4_d70c_return_output);

-- BIN_OP_OR_uxn_c_l245_c4_a8af
BIN_OP_OR_uxn_c_l245_c4_a8af : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l245_c4_a8af_left,
BIN_OP_OR_uxn_c_l245_c4_a8af_right,
BIN_OP_OR_uxn_c_l245_c4_a8af_return_output);

-- BIN_OP_EQ_uxn_c_l247_c12_895d
BIN_OP_EQ_uxn_c_l247_c12_895d : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l247_c12_895d_left,
BIN_OP_EQ_uxn_c_l247_c12_895d_right,
BIN_OP_EQ_uxn_c_l247_c12_895d_return_output);

-- color3_MUX_uxn_c_l247_c8_ab90
color3_MUX_uxn_c_l247_c8_ab90 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color3_MUX_uxn_c_l247_c8_ab90_cond,
color3_MUX_uxn_c_l247_c8_ab90_iftrue,
color3_MUX_uxn_c_l247_c8_ab90_iffalse,
color3_MUX_uxn_c_l247_c8_ab90_return_output);

-- color1_MUX_uxn_c_l247_c8_ab90
color1_MUX_uxn_c_l247_c8_ab90 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color1_MUX_uxn_c_l247_c8_ab90_cond,
color1_MUX_uxn_c_l247_c8_ab90_iftrue,
color1_MUX_uxn_c_l247_c8_ab90_iffalse,
color1_MUX_uxn_c_l247_c8_ab90_return_output);

-- color2_MUX_uxn_c_l247_c8_ab90
color2_MUX_uxn_c_l247_c8_ab90 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color2_MUX_uxn_c_l247_c8_ab90_cond,
color2_MUX_uxn_c_l247_c8_ab90_iftrue,
color2_MUX_uxn_c_l247_c8_ab90_iffalse,
color2_MUX_uxn_c_l247_c8_ab90_return_output);

-- tmp12_MUX_uxn_c_l247_c8_ab90
tmp12_MUX_uxn_c_l247_c8_ab90 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_c_l247_c8_ab90_cond,
tmp12_MUX_uxn_c_l247_c8_ab90_iftrue,
tmp12_MUX_uxn_c_l247_c8_ab90_iffalse,
tmp12_MUX_uxn_c_l247_c8_ab90_return_output);

-- color0_MUX_uxn_c_l247_c8_ab90
color0_MUX_uxn_c_l247_c8_ab90 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color0_MUX_uxn_c_l247_c8_ab90_cond,
color0_MUX_uxn_c_l247_c8_ab90_iftrue,
color0_MUX_uxn_c_l247_c8_ab90_iffalse,
color0_MUX_uxn_c_l247_c8_ab90_return_output);

-- CONST_SL_4_uxn_c_l249_c4_9aac
CONST_SL_4_uxn_c_l249_c4_9aac : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_c_l249_c4_9aac_x,
CONST_SL_4_uxn_c_l249_c4_9aac_return_output);

-- BIN_OP_AND_uxn_c_l250_c4_1120
BIN_OP_AND_uxn_c_l250_c4_1120 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l250_c4_1120_left,
BIN_OP_AND_uxn_c_l250_c4_1120_right,
BIN_OP_AND_uxn_c_l250_c4_1120_return_output);

-- BIN_OP_OR_uxn_c_l251_c4_dde2
BIN_OP_OR_uxn_c_l251_c4_dde2 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l251_c4_dde2_left,
BIN_OP_OR_uxn_c_l251_c4_dde2_right,
BIN_OP_OR_uxn_c_l251_c4_dde2_return_output);

-- CONST_SL_4_uxn_c_l254_c4_c632
CONST_SL_4_uxn_c_l254_c4_c632 : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_c_l254_c4_c632_x,
CONST_SL_4_uxn_c_l254_c4_c632_return_output);

-- BIN_OP_AND_uxn_c_l255_c4_8c21
BIN_OP_AND_uxn_c_l255_c4_8c21 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l255_c4_8c21_left,
BIN_OP_AND_uxn_c_l255_c4_8c21_right,
BIN_OP_AND_uxn_c_l255_c4_8c21_return_output);

-- BIN_OP_OR_uxn_c_l256_c4_28ff
BIN_OP_OR_uxn_c_l256_c4_28ff : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l256_c4_28ff_left,
BIN_OP_OR_uxn_c_l256_c4_28ff_right,
BIN_OP_OR_uxn_c_l256_c4_28ff_return_output);

-- BIN_OP_EQ_uxn_c_l258_c12_66c6
BIN_OP_EQ_uxn_c_l258_c12_66c6 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l258_c12_66c6_left,
BIN_OP_EQ_uxn_c_l258_c12_66c6_right,
BIN_OP_EQ_uxn_c_l258_c12_66c6_return_output);

-- color3_MUX_uxn_c_l258_c8_7a30
color3_MUX_uxn_c_l258_c8_7a30 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color3_MUX_uxn_c_l258_c8_7a30_cond,
color3_MUX_uxn_c_l258_c8_7a30_iftrue,
color3_MUX_uxn_c_l258_c8_7a30_iffalse,
color3_MUX_uxn_c_l258_c8_7a30_return_output);

-- color1_MUX_uxn_c_l258_c8_7a30
color1_MUX_uxn_c_l258_c8_7a30 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color1_MUX_uxn_c_l258_c8_7a30_cond,
color1_MUX_uxn_c_l258_c8_7a30_iftrue,
color1_MUX_uxn_c_l258_c8_7a30_iffalse,
color1_MUX_uxn_c_l258_c8_7a30_return_output);

-- color2_MUX_uxn_c_l258_c8_7a30
color2_MUX_uxn_c_l258_c8_7a30 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color2_MUX_uxn_c_l258_c8_7a30_cond,
color2_MUX_uxn_c_l258_c8_7a30_iftrue,
color2_MUX_uxn_c_l258_c8_7a30_iffalse,
color2_MUX_uxn_c_l258_c8_7a30_return_output);

-- tmp12_MUX_uxn_c_l258_c8_7a30
tmp12_MUX_uxn_c_l258_c8_7a30 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_c_l258_c8_7a30_cond,
tmp12_MUX_uxn_c_l258_c8_7a30_iftrue,
tmp12_MUX_uxn_c_l258_c8_7a30_iffalse,
tmp12_MUX_uxn_c_l258_c8_7a30_return_output);

-- color0_MUX_uxn_c_l258_c8_7a30
color0_MUX_uxn_c_l258_c8_7a30 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color0_MUX_uxn_c_l258_c8_7a30_cond,
color0_MUX_uxn_c_l258_c8_7a30_iftrue,
color0_MUX_uxn_c_l258_c8_7a30_iffalse,
color0_MUX_uxn_c_l258_c8_7a30_return_output);

-- BIN_OP_AND_uxn_c_l260_c4_4d7f
BIN_OP_AND_uxn_c_l260_c4_4d7f : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l260_c4_4d7f_left,
BIN_OP_AND_uxn_c_l260_c4_4d7f_right,
BIN_OP_AND_uxn_c_l260_c4_4d7f_return_output);

-- BIN_OP_OR_uxn_c_l261_c4_d827
BIN_OP_OR_uxn_c_l261_c4_d827 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l261_c4_d827_left,
BIN_OP_OR_uxn_c_l261_c4_d827_right,
BIN_OP_OR_uxn_c_l261_c4_d827_return_output);

-- BIN_OP_AND_uxn_c_l264_c4_3f03
BIN_OP_AND_uxn_c_l264_c4_3f03 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l264_c4_3f03_left,
BIN_OP_AND_uxn_c_l264_c4_3f03_right,
BIN_OP_AND_uxn_c_l264_c4_3f03_return_output);

-- BIN_OP_OR_uxn_c_l265_c4_f53a
BIN_OP_OR_uxn_c_l265_c4_f53a : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l265_c4_f53a_left,
BIN_OP_OR_uxn_c_l265_c4_f53a_right,
BIN_OP_OR_uxn_c_l265_c4_f53a_return_output);

-- BIN_OP_EQ_uxn_c_l267_c12_3892
BIN_OP_EQ_uxn_c_l267_c12_3892 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l267_c12_3892_left,
BIN_OP_EQ_uxn_c_l267_c12_3892_right,
BIN_OP_EQ_uxn_c_l267_c12_3892_return_output);

-- color3_MUX_uxn_c_l267_c8_35ec
color3_MUX_uxn_c_l267_c8_35ec : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color3_MUX_uxn_c_l267_c8_35ec_cond,
color3_MUX_uxn_c_l267_c8_35ec_iftrue,
color3_MUX_uxn_c_l267_c8_35ec_iffalse,
color3_MUX_uxn_c_l267_c8_35ec_return_output);

-- color2_MUX_uxn_c_l267_c8_35ec
color2_MUX_uxn_c_l267_c8_35ec : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color2_MUX_uxn_c_l267_c8_35ec_cond,
color2_MUX_uxn_c_l267_c8_35ec_iftrue,
color2_MUX_uxn_c_l267_c8_35ec_iffalse,
color2_MUX_uxn_c_l267_c8_35ec_return_output);

-- tmp12_MUX_uxn_c_l267_c8_35ec
tmp12_MUX_uxn_c_l267_c8_35ec : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_c_l267_c8_35ec_cond,
tmp12_MUX_uxn_c_l267_c8_35ec_iftrue,
tmp12_MUX_uxn_c_l267_c8_35ec_iffalse,
tmp12_MUX_uxn_c_l267_c8_35ec_return_output);

-- BIN_OP_AND_uxn_c_l269_c4_ba31
BIN_OP_AND_uxn_c_l269_c4_ba31 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l269_c4_ba31_left,
BIN_OP_AND_uxn_c_l269_c4_ba31_right,
BIN_OP_AND_uxn_c_l269_c4_ba31_return_output);

-- BIN_OP_OR_uxn_c_l270_c4_ff24
BIN_OP_OR_uxn_c_l270_c4_ff24 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l270_c4_ff24_left,
BIN_OP_OR_uxn_c_l270_c4_ff24_right,
BIN_OP_OR_uxn_c_l270_c4_ff24_return_output);

-- BIN_OP_AND_uxn_c_l273_c4_9a6e
BIN_OP_AND_uxn_c_l273_c4_9a6e : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l273_c4_9a6e_left,
BIN_OP_AND_uxn_c_l273_c4_9a6e_right,
BIN_OP_AND_uxn_c_l273_c4_9a6e_return_output);

-- BIN_OP_OR_uxn_c_l274_c4_7ced
BIN_OP_OR_uxn_c_l274_c4_7ced : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l274_c4_7ced_left,
BIN_OP_OR_uxn_c_l274_c4_7ced_right,
BIN_OP_OR_uxn_c_l274_c4_7ced_return_output);

-- BIN_OP_EQ_uxn_c_l278_c6_1e20
BIN_OP_EQ_uxn_c_l278_c6_1e20 : entity work.BIN_OP_EQ_uint2_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l278_c6_1e20_left,
BIN_OP_EQ_uxn_c_l278_c6_1e20_right,
BIN_OP_EQ_uxn_c_l278_c6_1e20_return_output);

-- result_MUX_uxn_c_l278_c2_5ca5
result_MUX_uxn_c_l278_c2_5ca5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_MUX_uxn_c_l278_c2_5ca5_cond,
result_MUX_uxn_c_l278_c2_5ca5_iftrue,
result_MUX_uxn_c_l278_c2_5ca5_iffalse,
result_MUX_uxn_c_l278_c2_5ca5_return_output);

-- BIN_OP_EQ_uxn_c_l280_c13_9585
BIN_OP_EQ_uxn_c_l280_c13_9585 : entity work.BIN_OP_EQ_uint2_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l280_c13_9585_left,
BIN_OP_EQ_uxn_c_l280_c13_9585_right,
BIN_OP_EQ_uxn_c_l280_c13_9585_return_output);

-- result_MUX_uxn_c_l280_c9_e27c
result_MUX_uxn_c_l280_c9_e27c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_MUX_uxn_c_l280_c9_e27c_cond,
result_MUX_uxn_c_l280_c9_e27c_iftrue,
result_MUX_uxn_c_l280_c9_e27c_iffalse,
result_MUX_uxn_c_l280_c9_e27c_return_output);

-- BIN_OP_EQ_uxn_c_l282_c13_1477
BIN_OP_EQ_uxn_c_l282_c13_1477 : entity work.BIN_OP_EQ_uint2_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l282_c13_1477_left,
BIN_OP_EQ_uxn_c_l282_c13_1477_right,
BIN_OP_EQ_uxn_c_l282_c13_1477_return_output);

-- result_MUX_uxn_c_l282_c9_48cd
result_MUX_uxn_c_l282_c9_48cd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_MUX_uxn_c_l282_c9_48cd_cond,
result_MUX_uxn_c_l282_c9_48cd_iftrue,
result_MUX_uxn_c_l282_c9_48cd_iffalse,
result_MUX_uxn_c_l282_c9_48cd_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 device_ram_address,
 device_ram_value,
 is_device_ram_write,
 gpu_step_color,
 -- Registers
 color0,
 color1,
 color2,
 color3,
 color_cmp_0,
 color_cmp_1,
 tmp12,
 result,
 -- All submodule outputs
 color3_MUX_uxn_c_l211_c2_89fb_return_output,
 color1_MUX_uxn_c_l211_c2_89fb_return_output,
 color2_MUX_uxn_c_l211_c2_89fb_return_output,
 tmp12_MUX_uxn_c_l211_c2_89fb_return_output,
 color_cmp_1_MUX_uxn_c_l211_c2_89fb_return_output,
 color_cmp_0_MUX_uxn_c_l211_c2_89fb_return_output,
 color0_MUX_uxn_c_l211_c2_89fb_return_output,
 CONST_SR_4_uxn_c_l212_c27_daf2_return_output,
 BIN_OP_EQ_uxn_c_l214_c7_3769_return_output,
 color3_MUX_uxn_c_l214_c3_6f37_return_output,
 color1_MUX_uxn_c_l214_c3_6f37_return_output,
 color2_MUX_uxn_c_l214_c3_6f37_return_output,
 tmp12_MUX_uxn_c_l214_c3_6f37_return_output,
 color0_MUX_uxn_c_l214_c3_6f37_return_output,
 CONST_SL_8_uxn_c_l216_c4_a2dd_return_output,
 BIN_OP_AND_uxn_c_l217_c4_37a9_return_output,
 BIN_OP_OR_uxn_c_l218_c4_2216_return_output,
 CONST_SL_8_uxn_c_l221_c4_696c_return_output,
 BIN_OP_AND_uxn_c_l222_c4_3c84_return_output,
 BIN_OP_OR_uxn_c_l223_c4_15bc_return_output,
 BIN_OP_EQ_uxn_c_l225_c12_cb3f_return_output,
 color3_MUX_uxn_c_l225_c8_b006_return_output,
 color1_MUX_uxn_c_l225_c8_b006_return_output,
 color2_MUX_uxn_c_l225_c8_b006_return_output,
 tmp12_MUX_uxn_c_l225_c8_b006_return_output,
 color0_MUX_uxn_c_l225_c8_b006_return_output,
 CONST_SL_8_uxn_c_l227_c4_e8ae_return_output,
 BIN_OP_AND_uxn_c_l228_c4_a278_return_output,
 BIN_OP_OR_uxn_c_l229_c4_c2a7_return_output,
 CONST_SL_8_uxn_c_l232_c4_2dc1_return_output,
 BIN_OP_AND_uxn_c_l233_c4_f8c2_return_output,
 BIN_OP_OR_uxn_c_l234_c4_670d_return_output,
 BIN_OP_EQ_uxn_c_l236_c12_2a8a_return_output,
 color3_MUX_uxn_c_l236_c8_9418_return_output,
 color1_MUX_uxn_c_l236_c8_9418_return_output,
 color2_MUX_uxn_c_l236_c8_9418_return_output,
 tmp12_MUX_uxn_c_l236_c8_9418_return_output,
 color0_MUX_uxn_c_l236_c8_9418_return_output,
 CONST_SL_4_uxn_c_l238_c4_9c07_return_output,
 BIN_OP_AND_uxn_c_l239_c4_0e8c_return_output,
 BIN_OP_OR_uxn_c_l240_c4_70d6_return_output,
 CONST_SL_4_uxn_c_l243_c4_ca36_return_output,
 BIN_OP_AND_uxn_c_l244_c4_d70c_return_output,
 BIN_OP_OR_uxn_c_l245_c4_a8af_return_output,
 BIN_OP_EQ_uxn_c_l247_c12_895d_return_output,
 color3_MUX_uxn_c_l247_c8_ab90_return_output,
 color1_MUX_uxn_c_l247_c8_ab90_return_output,
 color2_MUX_uxn_c_l247_c8_ab90_return_output,
 tmp12_MUX_uxn_c_l247_c8_ab90_return_output,
 color0_MUX_uxn_c_l247_c8_ab90_return_output,
 CONST_SL_4_uxn_c_l249_c4_9aac_return_output,
 BIN_OP_AND_uxn_c_l250_c4_1120_return_output,
 BIN_OP_OR_uxn_c_l251_c4_dde2_return_output,
 CONST_SL_4_uxn_c_l254_c4_c632_return_output,
 BIN_OP_AND_uxn_c_l255_c4_8c21_return_output,
 BIN_OP_OR_uxn_c_l256_c4_28ff_return_output,
 BIN_OP_EQ_uxn_c_l258_c12_66c6_return_output,
 color3_MUX_uxn_c_l258_c8_7a30_return_output,
 color1_MUX_uxn_c_l258_c8_7a30_return_output,
 color2_MUX_uxn_c_l258_c8_7a30_return_output,
 tmp12_MUX_uxn_c_l258_c8_7a30_return_output,
 color0_MUX_uxn_c_l258_c8_7a30_return_output,
 BIN_OP_AND_uxn_c_l260_c4_4d7f_return_output,
 BIN_OP_OR_uxn_c_l261_c4_d827_return_output,
 BIN_OP_AND_uxn_c_l264_c4_3f03_return_output,
 BIN_OP_OR_uxn_c_l265_c4_f53a_return_output,
 BIN_OP_EQ_uxn_c_l267_c12_3892_return_output,
 color3_MUX_uxn_c_l267_c8_35ec_return_output,
 color2_MUX_uxn_c_l267_c8_35ec_return_output,
 tmp12_MUX_uxn_c_l267_c8_35ec_return_output,
 BIN_OP_AND_uxn_c_l269_c4_ba31_return_output,
 BIN_OP_OR_uxn_c_l270_c4_ff24_return_output,
 BIN_OP_AND_uxn_c_l273_c4_9a6e_return_output,
 BIN_OP_OR_uxn_c_l274_c4_7ced_return_output,
 BIN_OP_EQ_uxn_c_l278_c6_1e20_return_output,
 result_MUX_uxn_c_l278_c2_5ca5_return_output,
 BIN_OP_EQ_uxn_c_l280_c13_9585_return_output,
 result_MUX_uxn_c_l280_c9_e27c_return_output,
 BIN_OP_EQ_uxn_c_l282_c13_1477_return_output,
 result_MUX_uxn_c_l282_c9_48cd_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_device_ram_address : unsigned(7 downto 0);
 variable VAR_device_ram_value : unsigned(7 downto 0);
 variable VAR_is_device_ram_write : unsigned(0 downto 0);
 variable VAR_gpu_step_color : unsigned(1 downto 0);
 variable VAR_color3_MUX_uxn_c_l211_c2_89fb_iftrue : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l214_c3_6f37_return_output : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l211_c2_89fb_iffalse : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l211_c2_89fb_return_output : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l211_c2_89fb_cond : unsigned(0 downto 0);
 variable VAR_color1_MUX_uxn_c_l211_c2_89fb_iftrue : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l214_c3_6f37_return_output : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l211_c2_89fb_iffalse : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l211_c2_89fb_return_output : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l211_c2_89fb_cond : unsigned(0 downto 0);
 variable VAR_color2_MUX_uxn_c_l211_c2_89fb_iftrue : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l214_c3_6f37_return_output : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l211_c2_89fb_iffalse : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l211_c2_89fb_return_output : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l211_c2_89fb_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l211_c2_89fb_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l214_c3_6f37_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l211_c2_89fb_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l211_c2_89fb_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l211_c2_89fb_cond : unsigned(0 downto 0);
 variable VAR_color_cmp_1_MUX_uxn_c_l211_c2_89fb_iftrue : unsigned(3 downto 0);
 variable VAR_color_cmp_1_uxn_c_l213_c3_220a : unsigned(3 downto 0);
 variable VAR_color_cmp_1_MUX_uxn_c_l211_c2_89fb_iffalse : unsigned(3 downto 0);
 variable VAR_color_cmp_1_MUX_uxn_c_l211_c2_89fb_return_output : unsigned(3 downto 0);
 variable VAR_color_cmp_1_MUX_uxn_c_l211_c2_89fb_cond : unsigned(0 downto 0);
 variable VAR_color_cmp_0_MUX_uxn_c_l211_c2_89fb_iftrue : unsigned(3 downto 0);
 variable VAR_color_cmp_0_uxn_c_l212_c3_3185 : unsigned(3 downto 0);
 variable VAR_color_cmp_0_MUX_uxn_c_l211_c2_89fb_iffalse : unsigned(3 downto 0);
 variable VAR_color_cmp_0_MUX_uxn_c_l211_c2_89fb_return_output : unsigned(3 downto 0);
 variable VAR_color_cmp_0_MUX_uxn_c_l211_c2_89fb_cond : unsigned(0 downto 0);
 variable VAR_color0_MUX_uxn_c_l211_c2_89fb_iftrue : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l214_c3_6f37_return_output : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l211_c2_89fb_iffalse : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l211_c2_89fb_return_output : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l211_c2_89fb_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_4_uxn_c_l212_c27_daf2_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_c_l212_c27_daf2_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_c_l212_c17_309d_return_output : unsigned(3 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_c_l213_c17_0904_return_output : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l214_c7_3769_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l214_c7_3769_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l214_c7_3769_return_output : unsigned(0 downto 0);
 variable VAR_color3_MUX_uxn_c_l214_c3_6f37_iftrue : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l214_c3_6f37_iffalse : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l225_c8_b006_return_output : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l214_c3_6f37_cond : unsigned(0 downto 0);
 variable VAR_color1_MUX_uxn_c_l214_c3_6f37_iftrue : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l214_c3_6f37_iffalse : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l225_c8_b006_return_output : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l214_c3_6f37_cond : unsigned(0 downto 0);
 variable VAR_color2_MUX_uxn_c_l214_c3_6f37_iftrue : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l214_c3_6f37_iffalse : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l225_c8_b006_return_output : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l214_c3_6f37_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l214_c3_6f37_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l214_c3_6f37_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l225_c8_b006_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l214_c3_6f37_cond : unsigned(0 downto 0);
 variable VAR_color0_MUX_uxn_c_l214_c3_6f37_iftrue : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l214_c3_6f37_iffalse : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l225_c8_b006_return_output : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l214_c3_6f37_cond : unsigned(0 downto 0);
 variable VAR_tmp12_uxn_c_l215_c4_5983 : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l216_c4_a2dd_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l216_c4_a2dd_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l217_c4_37a9_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l217_c4_37a9_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l217_c4_37a9_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l218_c4_2216_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l218_c4_2216_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l218_c4_2216_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_uxn_c_l220_c4_ff9a : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l221_c4_696c_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l221_c4_696c_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l222_c4_3c84_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l222_c4_3c84_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l222_c4_3c84_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l223_c4_15bc_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l223_c4_15bc_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l223_c4_15bc_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l225_c12_cb3f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l225_c12_cb3f_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l225_c12_cb3f_return_output : unsigned(0 downto 0);
 variable VAR_color3_MUX_uxn_c_l225_c8_b006_iftrue : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l225_c8_b006_iffalse : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l236_c8_9418_return_output : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l225_c8_b006_cond : unsigned(0 downto 0);
 variable VAR_color1_MUX_uxn_c_l225_c8_b006_iftrue : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l225_c8_b006_iffalse : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l236_c8_9418_return_output : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l225_c8_b006_cond : unsigned(0 downto 0);
 variable VAR_color2_MUX_uxn_c_l225_c8_b006_iftrue : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l225_c8_b006_iffalse : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l236_c8_9418_return_output : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l225_c8_b006_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l225_c8_b006_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l225_c8_b006_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l236_c8_9418_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l225_c8_b006_cond : unsigned(0 downto 0);
 variable VAR_color0_MUX_uxn_c_l225_c8_b006_iftrue : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l225_c8_b006_iffalse : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l236_c8_9418_return_output : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l225_c8_b006_cond : unsigned(0 downto 0);
 variable VAR_tmp12_uxn_c_l226_c4_70d5 : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l227_c4_e8ae_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l227_c4_e8ae_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l228_c4_a278_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l228_c4_a278_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l228_c4_a278_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l229_c4_c2a7_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l229_c4_c2a7_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l229_c4_c2a7_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_uxn_c_l231_c4_3eaf : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l232_c4_2dc1_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l232_c4_2dc1_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l233_c4_f8c2_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l233_c4_f8c2_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l233_c4_f8c2_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l234_c4_670d_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l234_c4_670d_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l234_c4_670d_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l236_c12_2a8a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l236_c12_2a8a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l236_c12_2a8a_return_output : unsigned(0 downto 0);
 variable VAR_color3_MUX_uxn_c_l236_c8_9418_iftrue : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l236_c8_9418_iffalse : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l247_c8_ab90_return_output : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l236_c8_9418_cond : unsigned(0 downto 0);
 variable VAR_color1_MUX_uxn_c_l236_c8_9418_iftrue : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l236_c8_9418_iffalse : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l247_c8_ab90_return_output : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l236_c8_9418_cond : unsigned(0 downto 0);
 variable VAR_color2_MUX_uxn_c_l236_c8_9418_iftrue : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l236_c8_9418_iffalse : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l247_c8_ab90_return_output : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l236_c8_9418_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l236_c8_9418_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l236_c8_9418_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l247_c8_ab90_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l236_c8_9418_cond : unsigned(0 downto 0);
 variable VAR_color0_MUX_uxn_c_l236_c8_9418_iftrue : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l236_c8_9418_iffalse : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l247_c8_ab90_return_output : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l236_c8_9418_cond : unsigned(0 downto 0);
 variable VAR_tmp12_uxn_c_l237_c4_5f4a : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l238_c4_9c07_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l238_c4_9c07_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l239_c4_0e8c_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l239_c4_0e8c_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l239_c4_0e8c_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l240_c4_70d6_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l240_c4_70d6_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l240_c4_70d6_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_uxn_c_l242_c4_3e44 : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l243_c4_ca36_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l243_c4_ca36_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l244_c4_d70c_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l244_c4_d70c_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l244_c4_d70c_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l245_c4_a8af_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l245_c4_a8af_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l245_c4_a8af_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l247_c12_895d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l247_c12_895d_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l247_c12_895d_return_output : unsigned(0 downto 0);
 variable VAR_color3_MUX_uxn_c_l247_c8_ab90_iftrue : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l247_c8_ab90_iffalse : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l258_c8_7a30_return_output : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l247_c8_ab90_cond : unsigned(0 downto 0);
 variable VAR_color1_MUX_uxn_c_l247_c8_ab90_iftrue : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l247_c8_ab90_iffalse : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l258_c8_7a30_return_output : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l247_c8_ab90_cond : unsigned(0 downto 0);
 variable VAR_color2_MUX_uxn_c_l247_c8_ab90_iftrue : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l247_c8_ab90_iffalse : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l258_c8_7a30_return_output : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l247_c8_ab90_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l247_c8_ab90_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l247_c8_ab90_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l258_c8_7a30_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l247_c8_ab90_cond : unsigned(0 downto 0);
 variable VAR_color0_MUX_uxn_c_l247_c8_ab90_iftrue : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l247_c8_ab90_iffalse : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l258_c8_7a30_return_output : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l247_c8_ab90_cond : unsigned(0 downto 0);
 variable VAR_tmp12_uxn_c_l248_c4_04d4 : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l249_c4_9aac_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l249_c4_9aac_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l250_c4_1120_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l250_c4_1120_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l250_c4_1120_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l251_c4_dde2_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l251_c4_dde2_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l251_c4_dde2_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_uxn_c_l253_c4_bbe3 : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l254_c4_c632_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l254_c4_c632_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l255_c4_8c21_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l255_c4_8c21_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l255_c4_8c21_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l256_c4_28ff_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l256_c4_28ff_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l256_c4_28ff_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l258_c12_66c6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l258_c12_66c6_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l258_c12_66c6_return_output : unsigned(0 downto 0);
 variable VAR_color3_MUX_uxn_c_l258_c8_7a30_iftrue : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l258_c8_7a30_iffalse : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l267_c8_35ec_return_output : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l258_c8_7a30_cond : unsigned(0 downto 0);
 variable VAR_color1_MUX_uxn_c_l258_c8_7a30_iftrue : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l258_c8_7a30_iffalse : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l258_c8_7a30_cond : unsigned(0 downto 0);
 variable VAR_color2_MUX_uxn_c_l258_c8_7a30_iftrue : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l258_c8_7a30_iffalse : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l267_c8_35ec_return_output : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l258_c8_7a30_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l258_c8_7a30_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l258_c8_7a30_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l267_c8_35ec_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l258_c8_7a30_cond : unsigned(0 downto 0);
 variable VAR_color0_MUX_uxn_c_l258_c8_7a30_iftrue : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l258_c8_7a30_iffalse : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l258_c8_7a30_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l260_c4_4d7f_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l260_c4_4d7f_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l260_c4_4d7f_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l261_c4_d827_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l261_c4_d827_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l261_c4_d827_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l264_c4_3f03_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l264_c4_3f03_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l264_c4_3f03_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l265_c4_f53a_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l265_c4_f53a_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l265_c4_f53a_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l267_c12_3892_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l267_c12_3892_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l267_c12_3892_return_output : unsigned(0 downto 0);
 variable VAR_color3_MUX_uxn_c_l267_c8_35ec_iftrue : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l267_c8_35ec_iffalse : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l267_c8_35ec_cond : unsigned(0 downto 0);
 variable VAR_color2_MUX_uxn_c_l267_c8_35ec_iftrue : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l267_c8_35ec_iffalse : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l267_c8_35ec_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l267_c8_35ec_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l267_c8_35ec_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l267_c8_35ec_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l269_c4_ba31_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l269_c4_ba31_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l269_c4_ba31_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l270_c4_ff24_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l270_c4_ff24_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l270_c4_ff24_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l273_c4_9a6e_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l273_c4_9a6e_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l273_c4_9a6e_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l274_c4_7ced_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l274_c4_7ced_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l274_c4_7ced_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l278_c6_1e20_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l278_c6_1e20_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l278_c6_1e20_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_c_l278_c2_5ca5_iftrue : unsigned(15 downto 0);
 variable VAR_result_uxn_c_l279_c3_d4e6 : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l278_c2_5ca5_iffalse : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l280_c9_e27c_return_output : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l278_c2_5ca5_return_output : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l278_c2_5ca5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l280_c13_9585_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l280_c13_9585_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l280_c13_9585_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_c_l280_c9_e27c_iftrue : unsigned(15 downto 0);
 variable VAR_result_uxn_c_l281_c3_c2cb : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l280_c9_e27c_iffalse : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l282_c9_48cd_return_output : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l280_c9_e27c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l282_c13_1477_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l282_c13_1477_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l282_c13_1477_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_c_l282_c9_48cd_iftrue : unsigned(15 downto 0);
 variable VAR_result_uxn_c_l283_c3_16c8 : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l282_c9_48cd_iffalse : unsigned(15 downto 0);
 variable VAR_result_uxn_c_l285_c3_dedd : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l282_c9_48cd_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l259_l268_DUPLICATE_1f10_return_output : unsigned(11 downto 0);
 variable VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l272_l263_DUPLICATE_dc29_return_output : unsigned(11 downto 0);
 -- State registers comb logic variables
variable REG_VAR_color0 : unsigned(11 downto 0);
variable REG_VAR_color1 : unsigned(11 downto 0);
variable REG_VAR_color2 : unsigned(11 downto 0);
variable REG_VAR_color3 : unsigned(11 downto 0);
variable REG_VAR_color_cmp_0 : unsigned(3 downto 0);
variable REG_VAR_color_cmp_1 : unsigned(3 downto 0);
variable REG_VAR_tmp12 : unsigned(11 downto 0);
variable REG_VAR_result : unsigned(15 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_color0 := color0;
  REG_VAR_color1 := color1;
  REG_VAR_color2 := color2;
  REG_VAR_color3 := color3;
  REG_VAR_color_cmp_0 := color_cmp_0;
  REG_VAR_color_cmp_1 := color_cmp_1;
  REG_VAR_tmp12 := tmp12;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_AND_uxn_c_l244_c4_d70c_right := to_unsigned(3855, 12);
     VAR_BIN_OP_EQ_uxn_c_l282_c13_1477_right := to_unsigned(2, 2);
     VAR_BIN_OP_AND_uxn_c_l228_c4_a278_right := to_unsigned(255, 8);
     VAR_BIN_OP_EQ_uxn_c_l258_c12_66c6_right := to_unsigned(12, 4);
     VAR_BIN_OP_EQ_uxn_c_l225_c12_cb3f_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_c_l247_c12_895d_right := to_unsigned(11, 4);
     VAR_BIN_OP_AND_uxn_c_l239_c4_0e8c_right := to_unsigned(3855, 12);
     VAR_BIN_OP_AND_uxn_c_l260_c4_4d7f_right := to_unsigned(4080, 12);
     VAR_BIN_OP_AND_uxn_c_l273_c4_9a6e_right := to_unsigned(4080, 12);
     VAR_BIN_OP_AND_uxn_c_l264_c4_3f03_right := to_unsigned(4080, 12);
     VAR_BIN_OP_AND_uxn_c_l250_c4_1120_right := to_unsigned(3855, 12);
     VAR_BIN_OP_AND_uxn_c_l233_c4_f8c2_right := to_unsigned(255, 8);
     VAR_BIN_OP_AND_uxn_c_l269_c4_ba31_right := to_unsigned(4080, 12);
     VAR_BIN_OP_EQ_uxn_c_l280_c13_9585_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l267_c12_3892_right := to_unsigned(13, 4);
     VAR_BIN_OP_EQ_uxn_c_l278_c6_1e20_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l236_c12_2a8a_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_c_l214_c7_3769_right := to_unsigned(8, 4);
     VAR_BIN_OP_AND_uxn_c_l222_c4_3c84_right := to_unsigned(255, 8);
     VAR_BIN_OP_AND_uxn_c_l255_c4_8c21_right := to_unsigned(3855, 12);
     VAR_BIN_OP_AND_uxn_c_l217_c4_37a9_right := to_unsigned(255, 8);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_device_ram_address := device_ram_address;
     VAR_device_ram_value := device_ram_value;
     VAR_is_device_ram_write := is_device_ram_write;
     VAR_gpu_step_color := gpu_step_color;

     -- Submodule level 0
     VAR_BIN_OP_AND_uxn_c_l217_c4_37a9_left := color0;
     VAR_BIN_OP_AND_uxn_c_l239_c4_0e8c_left := color0;
     VAR_BIN_OP_AND_uxn_c_l260_c4_4d7f_left := color0;
     VAR_color0_MUX_uxn_c_l211_c2_89fb_iffalse := color0;
     VAR_color0_MUX_uxn_c_l225_c8_b006_iftrue := color0;
     VAR_color0_MUX_uxn_c_l247_c8_ab90_iftrue := color0;
     VAR_color0_MUX_uxn_c_l258_c8_7a30_iffalse := color0;
     VAR_BIN_OP_AND_uxn_c_l222_c4_3c84_left := color1;
     VAR_BIN_OP_AND_uxn_c_l244_c4_d70c_left := color1;
     VAR_BIN_OP_AND_uxn_c_l264_c4_3f03_left := color1;
     VAR_color1_MUX_uxn_c_l211_c2_89fb_iffalse := color1;
     VAR_color1_MUX_uxn_c_l225_c8_b006_iftrue := color1;
     VAR_color1_MUX_uxn_c_l247_c8_ab90_iftrue := color1;
     VAR_color1_MUX_uxn_c_l258_c8_7a30_iffalse := color1;
     VAR_BIN_OP_AND_uxn_c_l228_c4_a278_left := color2;
     VAR_BIN_OP_AND_uxn_c_l250_c4_1120_left := color2;
     VAR_BIN_OP_AND_uxn_c_l269_c4_ba31_left := color2;
     VAR_color2_MUX_uxn_c_l211_c2_89fb_iffalse := color2;
     VAR_color2_MUX_uxn_c_l214_c3_6f37_iftrue := color2;
     VAR_color2_MUX_uxn_c_l236_c8_9418_iftrue := color2;
     VAR_color2_MUX_uxn_c_l258_c8_7a30_iftrue := color2;
     VAR_color2_MUX_uxn_c_l267_c8_35ec_iffalse := color2;
     VAR_BIN_OP_AND_uxn_c_l233_c4_f8c2_left := color3;
     VAR_BIN_OP_AND_uxn_c_l255_c4_8c21_left := color3;
     VAR_BIN_OP_AND_uxn_c_l273_c4_9a6e_left := color3;
     VAR_color3_MUX_uxn_c_l211_c2_89fb_iffalse := color3;
     VAR_color3_MUX_uxn_c_l214_c3_6f37_iftrue := color3;
     VAR_color3_MUX_uxn_c_l236_c8_9418_iftrue := color3;
     VAR_color3_MUX_uxn_c_l258_c8_7a30_iftrue := color3;
     VAR_color3_MUX_uxn_c_l267_c8_35ec_iffalse := color3;
     VAR_color_cmp_0_MUX_uxn_c_l211_c2_89fb_iffalse := color_cmp_0;
     VAR_color_cmp_1_MUX_uxn_c_l211_c2_89fb_iffalse := color_cmp_1;
     VAR_BIN_OP_EQ_uxn_c_l214_c7_3769_left := VAR_device_ram_address;
     VAR_BIN_OP_EQ_uxn_c_l225_c12_cb3f_left := VAR_device_ram_address;
     VAR_BIN_OP_EQ_uxn_c_l236_c12_2a8a_left := VAR_device_ram_address;
     VAR_BIN_OP_EQ_uxn_c_l247_c12_895d_left := VAR_device_ram_address;
     VAR_BIN_OP_EQ_uxn_c_l258_c12_66c6_left := VAR_device_ram_address;
     VAR_BIN_OP_EQ_uxn_c_l267_c12_3892_left := VAR_device_ram_address;
     VAR_CONST_SR_4_uxn_c_l212_c27_daf2_x := VAR_device_ram_value;
     VAR_BIN_OP_EQ_uxn_c_l278_c6_1e20_left := VAR_gpu_step_color;
     VAR_BIN_OP_EQ_uxn_c_l280_c13_9585_left := VAR_gpu_step_color;
     VAR_BIN_OP_EQ_uxn_c_l282_c13_1477_left := VAR_gpu_step_color;
     VAR_color0_MUX_uxn_c_l211_c2_89fb_cond := VAR_is_device_ram_write;
     VAR_color1_MUX_uxn_c_l211_c2_89fb_cond := VAR_is_device_ram_write;
     VAR_color2_MUX_uxn_c_l211_c2_89fb_cond := VAR_is_device_ram_write;
     VAR_color3_MUX_uxn_c_l211_c2_89fb_cond := VAR_is_device_ram_write;
     VAR_color_cmp_0_MUX_uxn_c_l211_c2_89fb_cond := VAR_is_device_ram_write;
     VAR_color_cmp_1_MUX_uxn_c_l211_c2_89fb_cond := VAR_is_device_ram_write;
     VAR_tmp12_MUX_uxn_c_l211_c2_89fb_cond := VAR_is_device_ram_write;
     VAR_tmp12_MUX_uxn_c_l211_c2_89fb_iffalse := tmp12;
     VAR_tmp12_MUX_uxn_c_l267_c8_35ec_iffalse := tmp12;
     -- BIN_OP_AND[uxn_c_l250_c4_1120] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l250_c4_1120_left <= VAR_BIN_OP_AND_uxn_c_l250_c4_1120_left;
     BIN_OP_AND_uxn_c_l250_c4_1120_right <= VAR_BIN_OP_AND_uxn_c_l250_c4_1120_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l250_c4_1120_return_output := BIN_OP_AND_uxn_c_l250_c4_1120_return_output;

     -- BIN_OP_AND[uxn_c_l264_c4_3f03] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l264_c4_3f03_left <= VAR_BIN_OP_AND_uxn_c_l264_c4_3f03_left;
     BIN_OP_AND_uxn_c_l264_c4_3f03_right <= VAR_BIN_OP_AND_uxn_c_l264_c4_3f03_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l264_c4_3f03_return_output := BIN_OP_AND_uxn_c_l264_c4_3f03_return_output;

     -- BIN_OP_EQ[uxn_c_l282_c13_1477] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l282_c13_1477_left <= VAR_BIN_OP_EQ_uxn_c_l282_c13_1477_left;
     BIN_OP_EQ_uxn_c_l282_c13_1477_right <= VAR_BIN_OP_EQ_uxn_c_l282_c13_1477_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l282_c13_1477_return_output := BIN_OP_EQ_uxn_c_l282_c13_1477_return_output;

     -- BIN_OP_AND[uxn_c_l273_c4_9a6e] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l273_c4_9a6e_left <= VAR_BIN_OP_AND_uxn_c_l273_c4_9a6e_left;
     BIN_OP_AND_uxn_c_l273_c4_9a6e_right <= VAR_BIN_OP_AND_uxn_c_l273_c4_9a6e_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l273_c4_9a6e_return_output := BIN_OP_AND_uxn_c_l273_c4_9a6e_return_output;

     -- BIN_OP_AND[uxn_c_l239_c4_0e8c] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l239_c4_0e8c_left <= VAR_BIN_OP_AND_uxn_c_l239_c4_0e8c_left;
     BIN_OP_AND_uxn_c_l239_c4_0e8c_right <= VAR_BIN_OP_AND_uxn_c_l239_c4_0e8c_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l239_c4_0e8c_return_output := BIN_OP_AND_uxn_c_l239_c4_0e8c_return_output;

     -- BIN_OP_AND[uxn_c_l233_c4_f8c2] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l233_c4_f8c2_left <= VAR_BIN_OP_AND_uxn_c_l233_c4_f8c2_left;
     BIN_OP_AND_uxn_c_l233_c4_f8c2_right <= VAR_BIN_OP_AND_uxn_c_l233_c4_f8c2_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l233_c4_f8c2_return_output := BIN_OP_AND_uxn_c_l233_c4_f8c2_return_output;

     -- BIN_OP_EQ[uxn_c_l278_c6_1e20] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l278_c6_1e20_left <= VAR_BIN_OP_EQ_uxn_c_l278_c6_1e20_left;
     BIN_OP_EQ_uxn_c_l278_c6_1e20_right <= VAR_BIN_OP_EQ_uxn_c_l278_c6_1e20_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l278_c6_1e20_return_output := BIN_OP_EQ_uxn_c_l278_c6_1e20_return_output;

     -- BIN_OP_EQ[uxn_c_l236_c12_2a8a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l236_c12_2a8a_left <= VAR_BIN_OP_EQ_uxn_c_l236_c12_2a8a_left;
     BIN_OP_EQ_uxn_c_l236_c12_2a8a_right <= VAR_BIN_OP_EQ_uxn_c_l236_c12_2a8a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l236_c12_2a8a_return_output := BIN_OP_EQ_uxn_c_l236_c12_2a8a_return_output;

     -- BIN_OP_EQ[uxn_c_l225_c12_cb3f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l225_c12_cb3f_left <= VAR_BIN_OP_EQ_uxn_c_l225_c12_cb3f_left;
     BIN_OP_EQ_uxn_c_l225_c12_cb3f_right <= VAR_BIN_OP_EQ_uxn_c_l225_c12_cb3f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l225_c12_cb3f_return_output := BIN_OP_EQ_uxn_c_l225_c12_cb3f_return_output;

     -- BIN_OP_EQ[uxn_c_l267_c12_3892] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l267_c12_3892_left <= VAR_BIN_OP_EQ_uxn_c_l267_c12_3892_left;
     BIN_OP_EQ_uxn_c_l267_c12_3892_right <= VAR_BIN_OP_EQ_uxn_c_l267_c12_3892_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l267_c12_3892_return_output := BIN_OP_EQ_uxn_c_l267_c12_3892_return_output;

     -- BIN_OP_AND[uxn_c_l222_c4_3c84] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l222_c4_3c84_left <= VAR_BIN_OP_AND_uxn_c_l222_c4_3c84_left;
     BIN_OP_AND_uxn_c_l222_c4_3c84_right <= VAR_BIN_OP_AND_uxn_c_l222_c4_3c84_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l222_c4_3c84_return_output := BIN_OP_AND_uxn_c_l222_c4_3c84_return_output;

     -- BIN_OP_AND[uxn_c_l244_c4_d70c] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l244_c4_d70c_left <= VAR_BIN_OP_AND_uxn_c_l244_c4_d70c_left;
     BIN_OP_AND_uxn_c_l244_c4_d70c_right <= VAR_BIN_OP_AND_uxn_c_l244_c4_d70c_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l244_c4_d70c_return_output := BIN_OP_AND_uxn_c_l244_c4_d70c_return_output;

     -- BIN_OP_AND[uxn_c_l260_c4_4d7f] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l260_c4_4d7f_left <= VAR_BIN_OP_AND_uxn_c_l260_c4_4d7f_left;
     BIN_OP_AND_uxn_c_l260_c4_4d7f_right <= VAR_BIN_OP_AND_uxn_c_l260_c4_4d7f_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l260_c4_4d7f_return_output := BIN_OP_AND_uxn_c_l260_c4_4d7f_return_output;

     -- BIN_OP_EQ[uxn_c_l247_c12_895d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l247_c12_895d_left <= VAR_BIN_OP_EQ_uxn_c_l247_c12_895d_left;
     BIN_OP_EQ_uxn_c_l247_c12_895d_right <= VAR_BIN_OP_EQ_uxn_c_l247_c12_895d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l247_c12_895d_return_output := BIN_OP_EQ_uxn_c_l247_c12_895d_return_output;

     -- CAST_TO_uint4_t[uxn_c_l213_c17_0904] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_c_l213_c17_0904_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_device_ram_value);

     -- BIN_OP_EQ[uxn_c_l258_c12_66c6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l258_c12_66c6_left <= VAR_BIN_OP_EQ_uxn_c_l258_c12_66c6_left;
     BIN_OP_EQ_uxn_c_l258_c12_66c6_right <= VAR_BIN_OP_EQ_uxn_c_l258_c12_66c6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l258_c12_66c6_return_output := BIN_OP_EQ_uxn_c_l258_c12_66c6_return_output;

     -- BIN_OP_EQ[uxn_c_l280_c13_9585] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l280_c13_9585_left <= VAR_BIN_OP_EQ_uxn_c_l280_c13_9585_left;
     BIN_OP_EQ_uxn_c_l280_c13_9585_right <= VAR_BIN_OP_EQ_uxn_c_l280_c13_9585_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l280_c13_9585_return_output := BIN_OP_EQ_uxn_c_l280_c13_9585_return_output;

     -- BIN_OP_AND[uxn_c_l269_c4_ba31] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l269_c4_ba31_left <= VAR_BIN_OP_AND_uxn_c_l269_c4_ba31_left;
     BIN_OP_AND_uxn_c_l269_c4_ba31_right <= VAR_BIN_OP_AND_uxn_c_l269_c4_ba31_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l269_c4_ba31_return_output := BIN_OP_AND_uxn_c_l269_c4_ba31_return_output;

     -- CONST_SR_4[uxn_c_l212_c27_daf2] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_c_l212_c27_daf2_x <= VAR_CONST_SR_4_uxn_c_l212_c27_daf2_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_c_l212_c27_daf2_return_output := CONST_SR_4_uxn_c_l212_c27_daf2_return_output;

     -- BIN_OP_AND[uxn_c_l255_c4_8c21] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l255_c4_8c21_left <= VAR_BIN_OP_AND_uxn_c_l255_c4_8c21_left;
     BIN_OP_AND_uxn_c_l255_c4_8c21_right <= VAR_BIN_OP_AND_uxn_c_l255_c4_8c21_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l255_c4_8c21_return_output := BIN_OP_AND_uxn_c_l255_c4_8c21_return_output;

     -- BIN_OP_AND[uxn_c_l228_c4_a278] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l228_c4_a278_left <= VAR_BIN_OP_AND_uxn_c_l228_c4_a278_left;
     BIN_OP_AND_uxn_c_l228_c4_a278_right <= VAR_BIN_OP_AND_uxn_c_l228_c4_a278_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l228_c4_a278_return_output := BIN_OP_AND_uxn_c_l228_c4_a278_return_output;

     -- BIN_OP_AND[uxn_c_l217_c4_37a9] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l217_c4_37a9_left <= VAR_BIN_OP_AND_uxn_c_l217_c4_37a9_left;
     BIN_OP_AND_uxn_c_l217_c4_37a9_right <= VAR_BIN_OP_AND_uxn_c_l217_c4_37a9_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l217_c4_37a9_return_output := BIN_OP_AND_uxn_c_l217_c4_37a9_return_output;

     -- BIN_OP_EQ[uxn_c_l214_c7_3769] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l214_c7_3769_left <= VAR_BIN_OP_EQ_uxn_c_l214_c7_3769_left;
     BIN_OP_EQ_uxn_c_l214_c7_3769_right <= VAR_BIN_OP_EQ_uxn_c_l214_c7_3769_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l214_c7_3769_return_output := BIN_OP_EQ_uxn_c_l214_c7_3769_return_output;

     -- Submodule level 1
     VAR_BIN_OP_OR_uxn_c_l218_c4_2216_left := VAR_BIN_OP_AND_uxn_c_l217_c4_37a9_return_output;
     VAR_BIN_OP_OR_uxn_c_l223_c4_15bc_left := VAR_BIN_OP_AND_uxn_c_l222_c4_3c84_return_output;
     VAR_BIN_OP_OR_uxn_c_l229_c4_c2a7_left := VAR_BIN_OP_AND_uxn_c_l228_c4_a278_return_output;
     VAR_BIN_OP_OR_uxn_c_l234_c4_670d_left := VAR_BIN_OP_AND_uxn_c_l233_c4_f8c2_return_output;
     VAR_BIN_OP_OR_uxn_c_l240_c4_70d6_left := VAR_BIN_OP_AND_uxn_c_l239_c4_0e8c_return_output;
     VAR_BIN_OP_OR_uxn_c_l245_c4_a8af_left := VAR_BIN_OP_AND_uxn_c_l244_c4_d70c_return_output;
     VAR_BIN_OP_OR_uxn_c_l251_c4_dde2_left := VAR_BIN_OP_AND_uxn_c_l250_c4_1120_return_output;
     VAR_BIN_OP_OR_uxn_c_l256_c4_28ff_left := VAR_BIN_OP_AND_uxn_c_l255_c4_8c21_return_output;
     VAR_BIN_OP_OR_uxn_c_l261_c4_d827_left := VAR_BIN_OP_AND_uxn_c_l260_c4_4d7f_return_output;
     VAR_BIN_OP_OR_uxn_c_l265_c4_f53a_left := VAR_BIN_OP_AND_uxn_c_l264_c4_3f03_return_output;
     VAR_BIN_OP_OR_uxn_c_l270_c4_ff24_left := VAR_BIN_OP_AND_uxn_c_l269_c4_ba31_return_output;
     VAR_BIN_OP_OR_uxn_c_l274_c4_7ced_left := VAR_BIN_OP_AND_uxn_c_l273_c4_9a6e_return_output;
     VAR_color0_MUX_uxn_c_l214_c3_6f37_cond := VAR_BIN_OP_EQ_uxn_c_l214_c7_3769_return_output;
     VAR_color1_MUX_uxn_c_l214_c3_6f37_cond := VAR_BIN_OP_EQ_uxn_c_l214_c7_3769_return_output;
     VAR_color2_MUX_uxn_c_l214_c3_6f37_cond := VAR_BIN_OP_EQ_uxn_c_l214_c7_3769_return_output;
     VAR_color3_MUX_uxn_c_l214_c3_6f37_cond := VAR_BIN_OP_EQ_uxn_c_l214_c7_3769_return_output;
     VAR_tmp12_MUX_uxn_c_l214_c3_6f37_cond := VAR_BIN_OP_EQ_uxn_c_l214_c7_3769_return_output;
     VAR_color0_MUX_uxn_c_l225_c8_b006_cond := VAR_BIN_OP_EQ_uxn_c_l225_c12_cb3f_return_output;
     VAR_color1_MUX_uxn_c_l225_c8_b006_cond := VAR_BIN_OP_EQ_uxn_c_l225_c12_cb3f_return_output;
     VAR_color2_MUX_uxn_c_l225_c8_b006_cond := VAR_BIN_OP_EQ_uxn_c_l225_c12_cb3f_return_output;
     VAR_color3_MUX_uxn_c_l225_c8_b006_cond := VAR_BIN_OP_EQ_uxn_c_l225_c12_cb3f_return_output;
     VAR_tmp12_MUX_uxn_c_l225_c8_b006_cond := VAR_BIN_OP_EQ_uxn_c_l225_c12_cb3f_return_output;
     VAR_color0_MUX_uxn_c_l236_c8_9418_cond := VAR_BIN_OP_EQ_uxn_c_l236_c12_2a8a_return_output;
     VAR_color1_MUX_uxn_c_l236_c8_9418_cond := VAR_BIN_OP_EQ_uxn_c_l236_c12_2a8a_return_output;
     VAR_color2_MUX_uxn_c_l236_c8_9418_cond := VAR_BIN_OP_EQ_uxn_c_l236_c12_2a8a_return_output;
     VAR_color3_MUX_uxn_c_l236_c8_9418_cond := VAR_BIN_OP_EQ_uxn_c_l236_c12_2a8a_return_output;
     VAR_tmp12_MUX_uxn_c_l236_c8_9418_cond := VAR_BIN_OP_EQ_uxn_c_l236_c12_2a8a_return_output;
     VAR_color0_MUX_uxn_c_l247_c8_ab90_cond := VAR_BIN_OP_EQ_uxn_c_l247_c12_895d_return_output;
     VAR_color1_MUX_uxn_c_l247_c8_ab90_cond := VAR_BIN_OP_EQ_uxn_c_l247_c12_895d_return_output;
     VAR_color2_MUX_uxn_c_l247_c8_ab90_cond := VAR_BIN_OP_EQ_uxn_c_l247_c12_895d_return_output;
     VAR_color3_MUX_uxn_c_l247_c8_ab90_cond := VAR_BIN_OP_EQ_uxn_c_l247_c12_895d_return_output;
     VAR_tmp12_MUX_uxn_c_l247_c8_ab90_cond := VAR_BIN_OP_EQ_uxn_c_l247_c12_895d_return_output;
     VAR_color0_MUX_uxn_c_l258_c8_7a30_cond := VAR_BIN_OP_EQ_uxn_c_l258_c12_66c6_return_output;
     VAR_color1_MUX_uxn_c_l258_c8_7a30_cond := VAR_BIN_OP_EQ_uxn_c_l258_c12_66c6_return_output;
     VAR_color2_MUX_uxn_c_l258_c8_7a30_cond := VAR_BIN_OP_EQ_uxn_c_l258_c12_66c6_return_output;
     VAR_color3_MUX_uxn_c_l258_c8_7a30_cond := VAR_BIN_OP_EQ_uxn_c_l258_c12_66c6_return_output;
     VAR_tmp12_MUX_uxn_c_l258_c8_7a30_cond := VAR_BIN_OP_EQ_uxn_c_l258_c12_66c6_return_output;
     VAR_color2_MUX_uxn_c_l267_c8_35ec_cond := VAR_BIN_OP_EQ_uxn_c_l267_c12_3892_return_output;
     VAR_color3_MUX_uxn_c_l267_c8_35ec_cond := VAR_BIN_OP_EQ_uxn_c_l267_c12_3892_return_output;
     VAR_tmp12_MUX_uxn_c_l267_c8_35ec_cond := VAR_BIN_OP_EQ_uxn_c_l267_c12_3892_return_output;
     VAR_result_MUX_uxn_c_l278_c2_5ca5_cond := VAR_BIN_OP_EQ_uxn_c_l278_c6_1e20_return_output;
     VAR_result_MUX_uxn_c_l280_c9_e27c_cond := VAR_BIN_OP_EQ_uxn_c_l280_c13_9585_return_output;
     VAR_result_MUX_uxn_c_l282_c9_48cd_cond := VAR_BIN_OP_EQ_uxn_c_l282_c13_1477_return_output;
     VAR_color_cmp_1_uxn_c_l213_c3_220a := VAR_CAST_TO_uint4_t_uxn_c_l213_c17_0904_return_output;
     VAR_color_cmp_1_MUX_uxn_c_l211_c2_89fb_iftrue := VAR_color_cmp_1_uxn_c_l213_c3_220a;
     VAR_tmp12_uxn_c_l220_c4_ff9a := resize(VAR_color_cmp_1_uxn_c_l213_c3_220a, 12);
     VAR_tmp12_uxn_c_l231_c4_3eaf := resize(VAR_color_cmp_1_uxn_c_l213_c3_220a, 12);
     VAR_tmp12_uxn_c_l242_c4_3e44 := resize(VAR_color_cmp_1_uxn_c_l213_c3_220a, 12);
     VAR_tmp12_uxn_c_l253_c4_bbe3 := resize(VAR_color_cmp_1_uxn_c_l213_c3_220a, 12);
     VAR_CONST_SL_8_uxn_c_l221_c4_696c_x := VAR_tmp12_uxn_c_l220_c4_ff9a;
     VAR_CONST_SL_8_uxn_c_l232_c4_2dc1_x := VAR_tmp12_uxn_c_l231_c4_3eaf;
     VAR_CONST_SL_4_uxn_c_l243_c4_ca36_x := VAR_tmp12_uxn_c_l242_c4_3e44;
     VAR_CONST_SL_4_uxn_c_l254_c4_c632_x := VAR_tmp12_uxn_c_l253_c4_bbe3;
     -- CONST_SL_8[uxn_c_l232_c4_2dc1] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l232_c4_2dc1_x <= VAR_CONST_SL_8_uxn_c_l232_c4_2dc1_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l232_c4_2dc1_return_output := CONST_SL_8_uxn_c_l232_c4_2dc1_return_output;

     -- CONST_SL_4[uxn_c_l243_c4_ca36] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_c_l243_c4_ca36_x <= VAR_CONST_SL_4_uxn_c_l243_c4_ca36_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_c_l243_c4_ca36_return_output := CONST_SL_4_uxn_c_l243_c4_ca36_return_output;

     -- CONST_SL_4[uxn_c_l254_c4_c632] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_c_l254_c4_c632_x <= VAR_CONST_SL_4_uxn_c_l254_c4_c632_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_c_l254_c4_c632_return_output := CONST_SL_4_uxn_c_l254_c4_c632_return_output;

     -- CAST_TO_uint12_t_uint4_t_uxn_c_l272_l263_DUPLICATE_dc29 LATENCY=0
     VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l272_l263_DUPLICATE_dc29_return_output := CAST_TO_uint12_t_uint4_t(
     VAR_color_cmp_1_uxn_c_l213_c3_220a);

     -- CAST_TO_uint4_t[uxn_c_l212_c17_309d] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_c_l212_c17_309d_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_CONST_SR_4_uxn_c_l212_c27_daf2_return_output);

     -- color_cmp_1_MUX[uxn_c_l211_c2_89fb] LATENCY=0
     -- Inputs
     color_cmp_1_MUX_uxn_c_l211_c2_89fb_cond <= VAR_color_cmp_1_MUX_uxn_c_l211_c2_89fb_cond;
     color_cmp_1_MUX_uxn_c_l211_c2_89fb_iftrue <= VAR_color_cmp_1_MUX_uxn_c_l211_c2_89fb_iftrue;
     color_cmp_1_MUX_uxn_c_l211_c2_89fb_iffalse <= VAR_color_cmp_1_MUX_uxn_c_l211_c2_89fb_iffalse;
     -- Outputs
     VAR_color_cmp_1_MUX_uxn_c_l211_c2_89fb_return_output := color_cmp_1_MUX_uxn_c_l211_c2_89fb_return_output;

     -- CONST_SL_8[uxn_c_l221_c4_696c] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l221_c4_696c_x <= VAR_CONST_SL_8_uxn_c_l221_c4_696c_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l221_c4_696c_return_output := CONST_SL_8_uxn_c_l221_c4_696c_return_output;

     -- Submodule level 2
     VAR_BIN_OP_OR_uxn_c_l265_c4_f53a_right := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l272_l263_DUPLICATE_dc29_return_output;
     VAR_BIN_OP_OR_uxn_c_l274_c4_7ced_right := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l272_l263_DUPLICATE_dc29_return_output;
     VAR_tmp12_MUX_uxn_c_l258_c8_7a30_iftrue := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l272_l263_DUPLICATE_dc29_return_output;
     VAR_tmp12_MUX_uxn_c_l267_c8_35ec_iftrue := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l272_l263_DUPLICATE_dc29_return_output;
     VAR_color_cmp_0_uxn_c_l212_c3_3185 := VAR_CAST_TO_uint4_t_uxn_c_l212_c17_309d_return_output;
     VAR_BIN_OP_OR_uxn_c_l245_c4_a8af_right := VAR_CONST_SL_4_uxn_c_l243_c4_ca36_return_output;
     VAR_tmp12_MUX_uxn_c_l236_c8_9418_iftrue := VAR_CONST_SL_4_uxn_c_l243_c4_ca36_return_output;
     VAR_BIN_OP_OR_uxn_c_l256_c4_28ff_right := VAR_CONST_SL_4_uxn_c_l254_c4_c632_return_output;
     VAR_tmp12_MUX_uxn_c_l247_c8_ab90_iftrue := VAR_CONST_SL_4_uxn_c_l254_c4_c632_return_output;
     VAR_BIN_OP_OR_uxn_c_l223_c4_15bc_right := VAR_CONST_SL_8_uxn_c_l221_c4_696c_return_output;
     VAR_tmp12_MUX_uxn_c_l214_c3_6f37_iftrue := VAR_CONST_SL_8_uxn_c_l221_c4_696c_return_output;
     VAR_BIN_OP_OR_uxn_c_l234_c4_670d_right := VAR_CONST_SL_8_uxn_c_l232_c4_2dc1_return_output;
     VAR_tmp12_MUX_uxn_c_l225_c8_b006_iftrue := VAR_CONST_SL_8_uxn_c_l232_c4_2dc1_return_output;
     REG_VAR_color_cmp_1 := VAR_color_cmp_1_MUX_uxn_c_l211_c2_89fb_return_output;
     VAR_color_cmp_0_MUX_uxn_c_l211_c2_89fb_iftrue := VAR_color_cmp_0_uxn_c_l212_c3_3185;
     VAR_tmp12_uxn_c_l215_c4_5983 := resize(VAR_color_cmp_0_uxn_c_l212_c3_3185, 12);
     VAR_tmp12_uxn_c_l226_c4_70d5 := resize(VAR_color_cmp_0_uxn_c_l212_c3_3185, 12);
     VAR_tmp12_uxn_c_l237_c4_5f4a := resize(VAR_color_cmp_0_uxn_c_l212_c3_3185, 12);
     VAR_tmp12_uxn_c_l248_c4_04d4 := resize(VAR_color_cmp_0_uxn_c_l212_c3_3185, 12);
     VAR_CONST_SL_8_uxn_c_l216_c4_a2dd_x := VAR_tmp12_uxn_c_l215_c4_5983;
     VAR_CONST_SL_8_uxn_c_l227_c4_e8ae_x := VAR_tmp12_uxn_c_l226_c4_70d5;
     VAR_CONST_SL_4_uxn_c_l238_c4_9c07_x := VAR_tmp12_uxn_c_l237_c4_5f4a;
     VAR_CONST_SL_4_uxn_c_l249_c4_9aac_x := VAR_tmp12_uxn_c_l248_c4_04d4;
     -- CONST_SL_4[uxn_c_l249_c4_9aac] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_c_l249_c4_9aac_x <= VAR_CONST_SL_4_uxn_c_l249_c4_9aac_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_c_l249_c4_9aac_return_output := CONST_SL_4_uxn_c_l249_c4_9aac_return_output;

     -- BIN_OP_OR[uxn_c_l223_c4_15bc] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l223_c4_15bc_left <= VAR_BIN_OP_OR_uxn_c_l223_c4_15bc_left;
     BIN_OP_OR_uxn_c_l223_c4_15bc_right <= VAR_BIN_OP_OR_uxn_c_l223_c4_15bc_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l223_c4_15bc_return_output := BIN_OP_OR_uxn_c_l223_c4_15bc_return_output;

     -- BIN_OP_OR[uxn_c_l234_c4_670d] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l234_c4_670d_left <= VAR_BIN_OP_OR_uxn_c_l234_c4_670d_left;
     BIN_OP_OR_uxn_c_l234_c4_670d_right <= VAR_BIN_OP_OR_uxn_c_l234_c4_670d_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l234_c4_670d_return_output := BIN_OP_OR_uxn_c_l234_c4_670d_return_output;

     -- CONST_SL_4[uxn_c_l238_c4_9c07] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_c_l238_c4_9c07_x <= VAR_CONST_SL_4_uxn_c_l238_c4_9c07_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_c_l238_c4_9c07_return_output := CONST_SL_4_uxn_c_l238_c4_9c07_return_output;

     -- CONST_SL_8[uxn_c_l227_c4_e8ae] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l227_c4_e8ae_x <= VAR_CONST_SL_8_uxn_c_l227_c4_e8ae_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l227_c4_e8ae_return_output := CONST_SL_8_uxn_c_l227_c4_e8ae_return_output;

     -- BIN_OP_OR[uxn_c_l245_c4_a8af] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l245_c4_a8af_left <= VAR_BIN_OP_OR_uxn_c_l245_c4_a8af_left;
     BIN_OP_OR_uxn_c_l245_c4_a8af_right <= VAR_BIN_OP_OR_uxn_c_l245_c4_a8af_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l245_c4_a8af_return_output := BIN_OP_OR_uxn_c_l245_c4_a8af_return_output;

     -- BIN_OP_OR[uxn_c_l265_c4_f53a] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l265_c4_f53a_left <= VAR_BIN_OP_OR_uxn_c_l265_c4_f53a_left;
     BIN_OP_OR_uxn_c_l265_c4_f53a_right <= VAR_BIN_OP_OR_uxn_c_l265_c4_f53a_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l265_c4_f53a_return_output := BIN_OP_OR_uxn_c_l265_c4_f53a_return_output;

     -- BIN_OP_OR[uxn_c_l256_c4_28ff] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l256_c4_28ff_left <= VAR_BIN_OP_OR_uxn_c_l256_c4_28ff_left;
     BIN_OP_OR_uxn_c_l256_c4_28ff_right <= VAR_BIN_OP_OR_uxn_c_l256_c4_28ff_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l256_c4_28ff_return_output := BIN_OP_OR_uxn_c_l256_c4_28ff_return_output;

     -- CONST_SL_8[uxn_c_l216_c4_a2dd] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l216_c4_a2dd_x <= VAR_CONST_SL_8_uxn_c_l216_c4_a2dd_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l216_c4_a2dd_return_output := CONST_SL_8_uxn_c_l216_c4_a2dd_return_output;

     -- color_cmp_0_MUX[uxn_c_l211_c2_89fb] LATENCY=0
     -- Inputs
     color_cmp_0_MUX_uxn_c_l211_c2_89fb_cond <= VAR_color_cmp_0_MUX_uxn_c_l211_c2_89fb_cond;
     color_cmp_0_MUX_uxn_c_l211_c2_89fb_iftrue <= VAR_color_cmp_0_MUX_uxn_c_l211_c2_89fb_iftrue;
     color_cmp_0_MUX_uxn_c_l211_c2_89fb_iffalse <= VAR_color_cmp_0_MUX_uxn_c_l211_c2_89fb_iffalse;
     -- Outputs
     VAR_color_cmp_0_MUX_uxn_c_l211_c2_89fb_return_output := color_cmp_0_MUX_uxn_c_l211_c2_89fb_return_output;

     -- CAST_TO_uint12_t_uint4_t_uxn_c_l259_l268_DUPLICATE_1f10 LATENCY=0
     VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l259_l268_DUPLICATE_1f10_return_output := CAST_TO_uint12_t_uint4_t(
     VAR_color_cmp_0_uxn_c_l212_c3_3185);

     -- tmp12_MUX[uxn_c_l267_c8_35ec] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_c_l267_c8_35ec_cond <= VAR_tmp12_MUX_uxn_c_l267_c8_35ec_cond;
     tmp12_MUX_uxn_c_l267_c8_35ec_iftrue <= VAR_tmp12_MUX_uxn_c_l267_c8_35ec_iftrue;
     tmp12_MUX_uxn_c_l267_c8_35ec_iffalse <= VAR_tmp12_MUX_uxn_c_l267_c8_35ec_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_c_l267_c8_35ec_return_output := tmp12_MUX_uxn_c_l267_c8_35ec_return_output;

     -- BIN_OP_OR[uxn_c_l274_c4_7ced] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l274_c4_7ced_left <= VAR_BIN_OP_OR_uxn_c_l274_c4_7ced_left;
     BIN_OP_OR_uxn_c_l274_c4_7ced_right <= VAR_BIN_OP_OR_uxn_c_l274_c4_7ced_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l274_c4_7ced_return_output := BIN_OP_OR_uxn_c_l274_c4_7ced_return_output;

     -- Submodule level 3
     VAR_color1_MUX_uxn_c_l214_c3_6f37_iftrue := VAR_BIN_OP_OR_uxn_c_l223_c4_15bc_return_output;
     VAR_color3_MUX_uxn_c_l225_c8_b006_iftrue := VAR_BIN_OP_OR_uxn_c_l234_c4_670d_return_output;
     VAR_color1_MUX_uxn_c_l236_c8_9418_iftrue := VAR_BIN_OP_OR_uxn_c_l245_c4_a8af_return_output;
     VAR_color3_MUX_uxn_c_l247_c8_ab90_iftrue := VAR_BIN_OP_OR_uxn_c_l256_c4_28ff_return_output;
     VAR_color1_MUX_uxn_c_l258_c8_7a30_iftrue := VAR_BIN_OP_OR_uxn_c_l265_c4_f53a_return_output;
     VAR_color3_MUX_uxn_c_l267_c8_35ec_iftrue := VAR_BIN_OP_OR_uxn_c_l274_c4_7ced_return_output;
     VAR_BIN_OP_OR_uxn_c_l261_c4_d827_right := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l259_l268_DUPLICATE_1f10_return_output;
     VAR_BIN_OP_OR_uxn_c_l270_c4_ff24_right := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l259_l268_DUPLICATE_1f10_return_output;
     VAR_BIN_OP_OR_uxn_c_l240_c4_70d6_right := VAR_CONST_SL_4_uxn_c_l238_c4_9c07_return_output;
     VAR_BIN_OP_OR_uxn_c_l251_c4_dde2_right := VAR_CONST_SL_4_uxn_c_l249_c4_9aac_return_output;
     VAR_BIN_OP_OR_uxn_c_l218_c4_2216_right := VAR_CONST_SL_8_uxn_c_l216_c4_a2dd_return_output;
     VAR_BIN_OP_OR_uxn_c_l229_c4_c2a7_right := VAR_CONST_SL_8_uxn_c_l227_c4_e8ae_return_output;
     REG_VAR_color_cmp_0 := VAR_color_cmp_0_MUX_uxn_c_l211_c2_89fb_return_output;
     VAR_tmp12_MUX_uxn_c_l258_c8_7a30_iffalse := VAR_tmp12_MUX_uxn_c_l267_c8_35ec_return_output;
     -- BIN_OP_OR[uxn_c_l251_c4_dde2] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l251_c4_dde2_left <= VAR_BIN_OP_OR_uxn_c_l251_c4_dde2_left;
     BIN_OP_OR_uxn_c_l251_c4_dde2_right <= VAR_BIN_OP_OR_uxn_c_l251_c4_dde2_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l251_c4_dde2_return_output := BIN_OP_OR_uxn_c_l251_c4_dde2_return_output;

     -- BIN_OP_OR[uxn_c_l229_c4_c2a7] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l229_c4_c2a7_left <= VAR_BIN_OP_OR_uxn_c_l229_c4_c2a7_left;
     BIN_OP_OR_uxn_c_l229_c4_c2a7_right <= VAR_BIN_OP_OR_uxn_c_l229_c4_c2a7_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l229_c4_c2a7_return_output := BIN_OP_OR_uxn_c_l229_c4_c2a7_return_output;

     -- color1_MUX[uxn_c_l258_c8_7a30] LATENCY=0
     -- Inputs
     color1_MUX_uxn_c_l258_c8_7a30_cond <= VAR_color1_MUX_uxn_c_l258_c8_7a30_cond;
     color1_MUX_uxn_c_l258_c8_7a30_iftrue <= VAR_color1_MUX_uxn_c_l258_c8_7a30_iftrue;
     color1_MUX_uxn_c_l258_c8_7a30_iffalse <= VAR_color1_MUX_uxn_c_l258_c8_7a30_iffalse;
     -- Outputs
     VAR_color1_MUX_uxn_c_l258_c8_7a30_return_output := color1_MUX_uxn_c_l258_c8_7a30_return_output;

     -- BIN_OP_OR[uxn_c_l261_c4_d827] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l261_c4_d827_left <= VAR_BIN_OP_OR_uxn_c_l261_c4_d827_left;
     BIN_OP_OR_uxn_c_l261_c4_d827_right <= VAR_BIN_OP_OR_uxn_c_l261_c4_d827_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l261_c4_d827_return_output := BIN_OP_OR_uxn_c_l261_c4_d827_return_output;

     -- color3_MUX[uxn_c_l267_c8_35ec] LATENCY=0
     -- Inputs
     color3_MUX_uxn_c_l267_c8_35ec_cond <= VAR_color3_MUX_uxn_c_l267_c8_35ec_cond;
     color3_MUX_uxn_c_l267_c8_35ec_iftrue <= VAR_color3_MUX_uxn_c_l267_c8_35ec_iftrue;
     color3_MUX_uxn_c_l267_c8_35ec_iffalse <= VAR_color3_MUX_uxn_c_l267_c8_35ec_iffalse;
     -- Outputs
     VAR_color3_MUX_uxn_c_l267_c8_35ec_return_output := color3_MUX_uxn_c_l267_c8_35ec_return_output;

     -- BIN_OP_OR[uxn_c_l240_c4_70d6] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l240_c4_70d6_left <= VAR_BIN_OP_OR_uxn_c_l240_c4_70d6_left;
     BIN_OP_OR_uxn_c_l240_c4_70d6_right <= VAR_BIN_OP_OR_uxn_c_l240_c4_70d6_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l240_c4_70d6_return_output := BIN_OP_OR_uxn_c_l240_c4_70d6_return_output;

     -- BIN_OP_OR[uxn_c_l218_c4_2216] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l218_c4_2216_left <= VAR_BIN_OP_OR_uxn_c_l218_c4_2216_left;
     BIN_OP_OR_uxn_c_l218_c4_2216_right <= VAR_BIN_OP_OR_uxn_c_l218_c4_2216_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l218_c4_2216_return_output := BIN_OP_OR_uxn_c_l218_c4_2216_return_output;

     -- tmp12_MUX[uxn_c_l258_c8_7a30] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_c_l258_c8_7a30_cond <= VAR_tmp12_MUX_uxn_c_l258_c8_7a30_cond;
     tmp12_MUX_uxn_c_l258_c8_7a30_iftrue <= VAR_tmp12_MUX_uxn_c_l258_c8_7a30_iftrue;
     tmp12_MUX_uxn_c_l258_c8_7a30_iffalse <= VAR_tmp12_MUX_uxn_c_l258_c8_7a30_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_c_l258_c8_7a30_return_output := tmp12_MUX_uxn_c_l258_c8_7a30_return_output;

     -- BIN_OP_OR[uxn_c_l270_c4_ff24] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l270_c4_ff24_left <= VAR_BIN_OP_OR_uxn_c_l270_c4_ff24_left;
     BIN_OP_OR_uxn_c_l270_c4_ff24_right <= VAR_BIN_OP_OR_uxn_c_l270_c4_ff24_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l270_c4_ff24_return_output := BIN_OP_OR_uxn_c_l270_c4_ff24_return_output;

     -- Submodule level 4
     VAR_color0_MUX_uxn_c_l214_c3_6f37_iftrue := VAR_BIN_OP_OR_uxn_c_l218_c4_2216_return_output;
     VAR_color2_MUX_uxn_c_l225_c8_b006_iftrue := VAR_BIN_OP_OR_uxn_c_l229_c4_c2a7_return_output;
     VAR_color0_MUX_uxn_c_l236_c8_9418_iftrue := VAR_BIN_OP_OR_uxn_c_l240_c4_70d6_return_output;
     VAR_color2_MUX_uxn_c_l247_c8_ab90_iftrue := VAR_BIN_OP_OR_uxn_c_l251_c4_dde2_return_output;
     VAR_color0_MUX_uxn_c_l258_c8_7a30_iftrue := VAR_BIN_OP_OR_uxn_c_l261_c4_d827_return_output;
     VAR_color2_MUX_uxn_c_l267_c8_35ec_iftrue := VAR_BIN_OP_OR_uxn_c_l270_c4_ff24_return_output;
     VAR_color1_MUX_uxn_c_l247_c8_ab90_iffalse := VAR_color1_MUX_uxn_c_l258_c8_7a30_return_output;
     VAR_color3_MUX_uxn_c_l258_c8_7a30_iffalse := VAR_color3_MUX_uxn_c_l267_c8_35ec_return_output;
     VAR_tmp12_MUX_uxn_c_l247_c8_ab90_iffalse := VAR_tmp12_MUX_uxn_c_l258_c8_7a30_return_output;
     -- color1_MUX[uxn_c_l247_c8_ab90] LATENCY=0
     -- Inputs
     color1_MUX_uxn_c_l247_c8_ab90_cond <= VAR_color1_MUX_uxn_c_l247_c8_ab90_cond;
     color1_MUX_uxn_c_l247_c8_ab90_iftrue <= VAR_color1_MUX_uxn_c_l247_c8_ab90_iftrue;
     color1_MUX_uxn_c_l247_c8_ab90_iffalse <= VAR_color1_MUX_uxn_c_l247_c8_ab90_iffalse;
     -- Outputs
     VAR_color1_MUX_uxn_c_l247_c8_ab90_return_output := color1_MUX_uxn_c_l247_c8_ab90_return_output;

     -- color0_MUX[uxn_c_l258_c8_7a30] LATENCY=0
     -- Inputs
     color0_MUX_uxn_c_l258_c8_7a30_cond <= VAR_color0_MUX_uxn_c_l258_c8_7a30_cond;
     color0_MUX_uxn_c_l258_c8_7a30_iftrue <= VAR_color0_MUX_uxn_c_l258_c8_7a30_iftrue;
     color0_MUX_uxn_c_l258_c8_7a30_iffalse <= VAR_color0_MUX_uxn_c_l258_c8_7a30_iffalse;
     -- Outputs
     VAR_color0_MUX_uxn_c_l258_c8_7a30_return_output := color0_MUX_uxn_c_l258_c8_7a30_return_output;

     -- color3_MUX[uxn_c_l258_c8_7a30] LATENCY=0
     -- Inputs
     color3_MUX_uxn_c_l258_c8_7a30_cond <= VAR_color3_MUX_uxn_c_l258_c8_7a30_cond;
     color3_MUX_uxn_c_l258_c8_7a30_iftrue <= VAR_color3_MUX_uxn_c_l258_c8_7a30_iftrue;
     color3_MUX_uxn_c_l258_c8_7a30_iffalse <= VAR_color3_MUX_uxn_c_l258_c8_7a30_iffalse;
     -- Outputs
     VAR_color3_MUX_uxn_c_l258_c8_7a30_return_output := color3_MUX_uxn_c_l258_c8_7a30_return_output;

     -- color2_MUX[uxn_c_l267_c8_35ec] LATENCY=0
     -- Inputs
     color2_MUX_uxn_c_l267_c8_35ec_cond <= VAR_color2_MUX_uxn_c_l267_c8_35ec_cond;
     color2_MUX_uxn_c_l267_c8_35ec_iftrue <= VAR_color2_MUX_uxn_c_l267_c8_35ec_iftrue;
     color2_MUX_uxn_c_l267_c8_35ec_iffalse <= VAR_color2_MUX_uxn_c_l267_c8_35ec_iffalse;
     -- Outputs
     VAR_color2_MUX_uxn_c_l267_c8_35ec_return_output := color2_MUX_uxn_c_l267_c8_35ec_return_output;

     -- tmp12_MUX[uxn_c_l247_c8_ab90] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_c_l247_c8_ab90_cond <= VAR_tmp12_MUX_uxn_c_l247_c8_ab90_cond;
     tmp12_MUX_uxn_c_l247_c8_ab90_iftrue <= VAR_tmp12_MUX_uxn_c_l247_c8_ab90_iftrue;
     tmp12_MUX_uxn_c_l247_c8_ab90_iffalse <= VAR_tmp12_MUX_uxn_c_l247_c8_ab90_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_c_l247_c8_ab90_return_output := tmp12_MUX_uxn_c_l247_c8_ab90_return_output;

     -- Submodule level 5
     VAR_color0_MUX_uxn_c_l247_c8_ab90_iffalse := VAR_color0_MUX_uxn_c_l258_c8_7a30_return_output;
     VAR_color1_MUX_uxn_c_l236_c8_9418_iffalse := VAR_color1_MUX_uxn_c_l247_c8_ab90_return_output;
     VAR_color2_MUX_uxn_c_l258_c8_7a30_iffalse := VAR_color2_MUX_uxn_c_l267_c8_35ec_return_output;
     VAR_color3_MUX_uxn_c_l247_c8_ab90_iffalse := VAR_color3_MUX_uxn_c_l258_c8_7a30_return_output;
     VAR_tmp12_MUX_uxn_c_l236_c8_9418_iffalse := VAR_tmp12_MUX_uxn_c_l247_c8_ab90_return_output;
     -- color0_MUX[uxn_c_l247_c8_ab90] LATENCY=0
     -- Inputs
     color0_MUX_uxn_c_l247_c8_ab90_cond <= VAR_color0_MUX_uxn_c_l247_c8_ab90_cond;
     color0_MUX_uxn_c_l247_c8_ab90_iftrue <= VAR_color0_MUX_uxn_c_l247_c8_ab90_iftrue;
     color0_MUX_uxn_c_l247_c8_ab90_iffalse <= VAR_color0_MUX_uxn_c_l247_c8_ab90_iffalse;
     -- Outputs
     VAR_color0_MUX_uxn_c_l247_c8_ab90_return_output := color0_MUX_uxn_c_l247_c8_ab90_return_output;

     -- color2_MUX[uxn_c_l258_c8_7a30] LATENCY=0
     -- Inputs
     color2_MUX_uxn_c_l258_c8_7a30_cond <= VAR_color2_MUX_uxn_c_l258_c8_7a30_cond;
     color2_MUX_uxn_c_l258_c8_7a30_iftrue <= VAR_color2_MUX_uxn_c_l258_c8_7a30_iftrue;
     color2_MUX_uxn_c_l258_c8_7a30_iffalse <= VAR_color2_MUX_uxn_c_l258_c8_7a30_iffalse;
     -- Outputs
     VAR_color2_MUX_uxn_c_l258_c8_7a30_return_output := color2_MUX_uxn_c_l258_c8_7a30_return_output;

     -- color1_MUX[uxn_c_l236_c8_9418] LATENCY=0
     -- Inputs
     color1_MUX_uxn_c_l236_c8_9418_cond <= VAR_color1_MUX_uxn_c_l236_c8_9418_cond;
     color1_MUX_uxn_c_l236_c8_9418_iftrue <= VAR_color1_MUX_uxn_c_l236_c8_9418_iftrue;
     color1_MUX_uxn_c_l236_c8_9418_iffalse <= VAR_color1_MUX_uxn_c_l236_c8_9418_iffalse;
     -- Outputs
     VAR_color1_MUX_uxn_c_l236_c8_9418_return_output := color1_MUX_uxn_c_l236_c8_9418_return_output;

     -- tmp12_MUX[uxn_c_l236_c8_9418] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_c_l236_c8_9418_cond <= VAR_tmp12_MUX_uxn_c_l236_c8_9418_cond;
     tmp12_MUX_uxn_c_l236_c8_9418_iftrue <= VAR_tmp12_MUX_uxn_c_l236_c8_9418_iftrue;
     tmp12_MUX_uxn_c_l236_c8_9418_iffalse <= VAR_tmp12_MUX_uxn_c_l236_c8_9418_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_c_l236_c8_9418_return_output := tmp12_MUX_uxn_c_l236_c8_9418_return_output;

     -- color3_MUX[uxn_c_l247_c8_ab90] LATENCY=0
     -- Inputs
     color3_MUX_uxn_c_l247_c8_ab90_cond <= VAR_color3_MUX_uxn_c_l247_c8_ab90_cond;
     color3_MUX_uxn_c_l247_c8_ab90_iftrue <= VAR_color3_MUX_uxn_c_l247_c8_ab90_iftrue;
     color3_MUX_uxn_c_l247_c8_ab90_iffalse <= VAR_color3_MUX_uxn_c_l247_c8_ab90_iffalse;
     -- Outputs
     VAR_color3_MUX_uxn_c_l247_c8_ab90_return_output := color3_MUX_uxn_c_l247_c8_ab90_return_output;

     -- Submodule level 6
     VAR_color0_MUX_uxn_c_l236_c8_9418_iffalse := VAR_color0_MUX_uxn_c_l247_c8_ab90_return_output;
     VAR_color1_MUX_uxn_c_l225_c8_b006_iffalse := VAR_color1_MUX_uxn_c_l236_c8_9418_return_output;
     VAR_color2_MUX_uxn_c_l247_c8_ab90_iffalse := VAR_color2_MUX_uxn_c_l258_c8_7a30_return_output;
     VAR_color3_MUX_uxn_c_l236_c8_9418_iffalse := VAR_color3_MUX_uxn_c_l247_c8_ab90_return_output;
     VAR_tmp12_MUX_uxn_c_l225_c8_b006_iffalse := VAR_tmp12_MUX_uxn_c_l236_c8_9418_return_output;
     -- tmp12_MUX[uxn_c_l225_c8_b006] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_c_l225_c8_b006_cond <= VAR_tmp12_MUX_uxn_c_l225_c8_b006_cond;
     tmp12_MUX_uxn_c_l225_c8_b006_iftrue <= VAR_tmp12_MUX_uxn_c_l225_c8_b006_iftrue;
     tmp12_MUX_uxn_c_l225_c8_b006_iffalse <= VAR_tmp12_MUX_uxn_c_l225_c8_b006_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_c_l225_c8_b006_return_output := tmp12_MUX_uxn_c_l225_c8_b006_return_output;

     -- color3_MUX[uxn_c_l236_c8_9418] LATENCY=0
     -- Inputs
     color3_MUX_uxn_c_l236_c8_9418_cond <= VAR_color3_MUX_uxn_c_l236_c8_9418_cond;
     color3_MUX_uxn_c_l236_c8_9418_iftrue <= VAR_color3_MUX_uxn_c_l236_c8_9418_iftrue;
     color3_MUX_uxn_c_l236_c8_9418_iffalse <= VAR_color3_MUX_uxn_c_l236_c8_9418_iffalse;
     -- Outputs
     VAR_color3_MUX_uxn_c_l236_c8_9418_return_output := color3_MUX_uxn_c_l236_c8_9418_return_output;

     -- color0_MUX[uxn_c_l236_c8_9418] LATENCY=0
     -- Inputs
     color0_MUX_uxn_c_l236_c8_9418_cond <= VAR_color0_MUX_uxn_c_l236_c8_9418_cond;
     color0_MUX_uxn_c_l236_c8_9418_iftrue <= VAR_color0_MUX_uxn_c_l236_c8_9418_iftrue;
     color0_MUX_uxn_c_l236_c8_9418_iffalse <= VAR_color0_MUX_uxn_c_l236_c8_9418_iffalse;
     -- Outputs
     VAR_color0_MUX_uxn_c_l236_c8_9418_return_output := color0_MUX_uxn_c_l236_c8_9418_return_output;

     -- color2_MUX[uxn_c_l247_c8_ab90] LATENCY=0
     -- Inputs
     color2_MUX_uxn_c_l247_c8_ab90_cond <= VAR_color2_MUX_uxn_c_l247_c8_ab90_cond;
     color2_MUX_uxn_c_l247_c8_ab90_iftrue <= VAR_color2_MUX_uxn_c_l247_c8_ab90_iftrue;
     color2_MUX_uxn_c_l247_c8_ab90_iffalse <= VAR_color2_MUX_uxn_c_l247_c8_ab90_iffalse;
     -- Outputs
     VAR_color2_MUX_uxn_c_l247_c8_ab90_return_output := color2_MUX_uxn_c_l247_c8_ab90_return_output;

     -- color1_MUX[uxn_c_l225_c8_b006] LATENCY=0
     -- Inputs
     color1_MUX_uxn_c_l225_c8_b006_cond <= VAR_color1_MUX_uxn_c_l225_c8_b006_cond;
     color1_MUX_uxn_c_l225_c8_b006_iftrue <= VAR_color1_MUX_uxn_c_l225_c8_b006_iftrue;
     color1_MUX_uxn_c_l225_c8_b006_iffalse <= VAR_color1_MUX_uxn_c_l225_c8_b006_iffalse;
     -- Outputs
     VAR_color1_MUX_uxn_c_l225_c8_b006_return_output := color1_MUX_uxn_c_l225_c8_b006_return_output;

     -- Submodule level 7
     VAR_color0_MUX_uxn_c_l225_c8_b006_iffalse := VAR_color0_MUX_uxn_c_l236_c8_9418_return_output;
     VAR_color1_MUX_uxn_c_l214_c3_6f37_iffalse := VAR_color1_MUX_uxn_c_l225_c8_b006_return_output;
     VAR_color2_MUX_uxn_c_l236_c8_9418_iffalse := VAR_color2_MUX_uxn_c_l247_c8_ab90_return_output;
     VAR_color3_MUX_uxn_c_l225_c8_b006_iffalse := VAR_color3_MUX_uxn_c_l236_c8_9418_return_output;
     VAR_tmp12_MUX_uxn_c_l214_c3_6f37_iffalse := VAR_tmp12_MUX_uxn_c_l225_c8_b006_return_output;
     -- color3_MUX[uxn_c_l225_c8_b006] LATENCY=0
     -- Inputs
     color3_MUX_uxn_c_l225_c8_b006_cond <= VAR_color3_MUX_uxn_c_l225_c8_b006_cond;
     color3_MUX_uxn_c_l225_c8_b006_iftrue <= VAR_color3_MUX_uxn_c_l225_c8_b006_iftrue;
     color3_MUX_uxn_c_l225_c8_b006_iffalse <= VAR_color3_MUX_uxn_c_l225_c8_b006_iffalse;
     -- Outputs
     VAR_color3_MUX_uxn_c_l225_c8_b006_return_output := color3_MUX_uxn_c_l225_c8_b006_return_output;

     -- color2_MUX[uxn_c_l236_c8_9418] LATENCY=0
     -- Inputs
     color2_MUX_uxn_c_l236_c8_9418_cond <= VAR_color2_MUX_uxn_c_l236_c8_9418_cond;
     color2_MUX_uxn_c_l236_c8_9418_iftrue <= VAR_color2_MUX_uxn_c_l236_c8_9418_iftrue;
     color2_MUX_uxn_c_l236_c8_9418_iffalse <= VAR_color2_MUX_uxn_c_l236_c8_9418_iffalse;
     -- Outputs
     VAR_color2_MUX_uxn_c_l236_c8_9418_return_output := color2_MUX_uxn_c_l236_c8_9418_return_output;

     -- color0_MUX[uxn_c_l225_c8_b006] LATENCY=0
     -- Inputs
     color0_MUX_uxn_c_l225_c8_b006_cond <= VAR_color0_MUX_uxn_c_l225_c8_b006_cond;
     color0_MUX_uxn_c_l225_c8_b006_iftrue <= VAR_color0_MUX_uxn_c_l225_c8_b006_iftrue;
     color0_MUX_uxn_c_l225_c8_b006_iffalse <= VAR_color0_MUX_uxn_c_l225_c8_b006_iffalse;
     -- Outputs
     VAR_color0_MUX_uxn_c_l225_c8_b006_return_output := color0_MUX_uxn_c_l225_c8_b006_return_output;

     -- tmp12_MUX[uxn_c_l214_c3_6f37] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_c_l214_c3_6f37_cond <= VAR_tmp12_MUX_uxn_c_l214_c3_6f37_cond;
     tmp12_MUX_uxn_c_l214_c3_6f37_iftrue <= VAR_tmp12_MUX_uxn_c_l214_c3_6f37_iftrue;
     tmp12_MUX_uxn_c_l214_c3_6f37_iffalse <= VAR_tmp12_MUX_uxn_c_l214_c3_6f37_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_c_l214_c3_6f37_return_output := tmp12_MUX_uxn_c_l214_c3_6f37_return_output;

     -- color1_MUX[uxn_c_l214_c3_6f37] LATENCY=0
     -- Inputs
     color1_MUX_uxn_c_l214_c3_6f37_cond <= VAR_color1_MUX_uxn_c_l214_c3_6f37_cond;
     color1_MUX_uxn_c_l214_c3_6f37_iftrue <= VAR_color1_MUX_uxn_c_l214_c3_6f37_iftrue;
     color1_MUX_uxn_c_l214_c3_6f37_iffalse <= VAR_color1_MUX_uxn_c_l214_c3_6f37_iffalse;
     -- Outputs
     VAR_color1_MUX_uxn_c_l214_c3_6f37_return_output := color1_MUX_uxn_c_l214_c3_6f37_return_output;

     -- Submodule level 8
     VAR_color0_MUX_uxn_c_l214_c3_6f37_iffalse := VAR_color0_MUX_uxn_c_l225_c8_b006_return_output;
     VAR_color1_MUX_uxn_c_l211_c2_89fb_iftrue := VAR_color1_MUX_uxn_c_l214_c3_6f37_return_output;
     VAR_color2_MUX_uxn_c_l225_c8_b006_iffalse := VAR_color2_MUX_uxn_c_l236_c8_9418_return_output;
     VAR_color3_MUX_uxn_c_l214_c3_6f37_iffalse := VAR_color3_MUX_uxn_c_l225_c8_b006_return_output;
     VAR_tmp12_MUX_uxn_c_l211_c2_89fb_iftrue := VAR_tmp12_MUX_uxn_c_l214_c3_6f37_return_output;
     -- color2_MUX[uxn_c_l225_c8_b006] LATENCY=0
     -- Inputs
     color2_MUX_uxn_c_l225_c8_b006_cond <= VAR_color2_MUX_uxn_c_l225_c8_b006_cond;
     color2_MUX_uxn_c_l225_c8_b006_iftrue <= VAR_color2_MUX_uxn_c_l225_c8_b006_iftrue;
     color2_MUX_uxn_c_l225_c8_b006_iffalse <= VAR_color2_MUX_uxn_c_l225_c8_b006_iffalse;
     -- Outputs
     VAR_color2_MUX_uxn_c_l225_c8_b006_return_output := color2_MUX_uxn_c_l225_c8_b006_return_output;

     -- color1_MUX[uxn_c_l211_c2_89fb] LATENCY=0
     -- Inputs
     color1_MUX_uxn_c_l211_c2_89fb_cond <= VAR_color1_MUX_uxn_c_l211_c2_89fb_cond;
     color1_MUX_uxn_c_l211_c2_89fb_iftrue <= VAR_color1_MUX_uxn_c_l211_c2_89fb_iftrue;
     color1_MUX_uxn_c_l211_c2_89fb_iffalse <= VAR_color1_MUX_uxn_c_l211_c2_89fb_iffalse;
     -- Outputs
     VAR_color1_MUX_uxn_c_l211_c2_89fb_return_output := color1_MUX_uxn_c_l211_c2_89fb_return_output;

     -- tmp12_MUX[uxn_c_l211_c2_89fb] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_c_l211_c2_89fb_cond <= VAR_tmp12_MUX_uxn_c_l211_c2_89fb_cond;
     tmp12_MUX_uxn_c_l211_c2_89fb_iftrue <= VAR_tmp12_MUX_uxn_c_l211_c2_89fb_iftrue;
     tmp12_MUX_uxn_c_l211_c2_89fb_iffalse <= VAR_tmp12_MUX_uxn_c_l211_c2_89fb_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_c_l211_c2_89fb_return_output := tmp12_MUX_uxn_c_l211_c2_89fb_return_output;

     -- color3_MUX[uxn_c_l214_c3_6f37] LATENCY=0
     -- Inputs
     color3_MUX_uxn_c_l214_c3_6f37_cond <= VAR_color3_MUX_uxn_c_l214_c3_6f37_cond;
     color3_MUX_uxn_c_l214_c3_6f37_iftrue <= VAR_color3_MUX_uxn_c_l214_c3_6f37_iftrue;
     color3_MUX_uxn_c_l214_c3_6f37_iffalse <= VAR_color3_MUX_uxn_c_l214_c3_6f37_iffalse;
     -- Outputs
     VAR_color3_MUX_uxn_c_l214_c3_6f37_return_output := color3_MUX_uxn_c_l214_c3_6f37_return_output;

     -- color0_MUX[uxn_c_l214_c3_6f37] LATENCY=0
     -- Inputs
     color0_MUX_uxn_c_l214_c3_6f37_cond <= VAR_color0_MUX_uxn_c_l214_c3_6f37_cond;
     color0_MUX_uxn_c_l214_c3_6f37_iftrue <= VAR_color0_MUX_uxn_c_l214_c3_6f37_iftrue;
     color0_MUX_uxn_c_l214_c3_6f37_iffalse <= VAR_color0_MUX_uxn_c_l214_c3_6f37_iffalse;
     -- Outputs
     VAR_color0_MUX_uxn_c_l214_c3_6f37_return_output := color0_MUX_uxn_c_l214_c3_6f37_return_output;

     -- Submodule level 9
     VAR_color0_MUX_uxn_c_l211_c2_89fb_iftrue := VAR_color0_MUX_uxn_c_l214_c3_6f37_return_output;
     REG_VAR_color1 := VAR_color1_MUX_uxn_c_l211_c2_89fb_return_output;
     VAR_result_uxn_c_l281_c3_c2cb := resize(VAR_color1_MUX_uxn_c_l211_c2_89fb_return_output, 16);
     VAR_color2_MUX_uxn_c_l214_c3_6f37_iffalse := VAR_color2_MUX_uxn_c_l225_c8_b006_return_output;
     VAR_color3_MUX_uxn_c_l211_c2_89fb_iftrue := VAR_color3_MUX_uxn_c_l214_c3_6f37_return_output;
     REG_VAR_tmp12 := VAR_tmp12_MUX_uxn_c_l211_c2_89fb_return_output;
     VAR_result_MUX_uxn_c_l280_c9_e27c_iftrue := VAR_result_uxn_c_l281_c3_c2cb;
     -- color0_MUX[uxn_c_l211_c2_89fb] LATENCY=0
     -- Inputs
     color0_MUX_uxn_c_l211_c2_89fb_cond <= VAR_color0_MUX_uxn_c_l211_c2_89fb_cond;
     color0_MUX_uxn_c_l211_c2_89fb_iftrue <= VAR_color0_MUX_uxn_c_l211_c2_89fb_iftrue;
     color0_MUX_uxn_c_l211_c2_89fb_iffalse <= VAR_color0_MUX_uxn_c_l211_c2_89fb_iffalse;
     -- Outputs
     VAR_color0_MUX_uxn_c_l211_c2_89fb_return_output := color0_MUX_uxn_c_l211_c2_89fb_return_output;

     -- color3_MUX[uxn_c_l211_c2_89fb] LATENCY=0
     -- Inputs
     color3_MUX_uxn_c_l211_c2_89fb_cond <= VAR_color3_MUX_uxn_c_l211_c2_89fb_cond;
     color3_MUX_uxn_c_l211_c2_89fb_iftrue <= VAR_color3_MUX_uxn_c_l211_c2_89fb_iftrue;
     color3_MUX_uxn_c_l211_c2_89fb_iffalse <= VAR_color3_MUX_uxn_c_l211_c2_89fb_iffalse;
     -- Outputs
     VAR_color3_MUX_uxn_c_l211_c2_89fb_return_output := color3_MUX_uxn_c_l211_c2_89fb_return_output;

     -- color2_MUX[uxn_c_l214_c3_6f37] LATENCY=0
     -- Inputs
     color2_MUX_uxn_c_l214_c3_6f37_cond <= VAR_color2_MUX_uxn_c_l214_c3_6f37_cond;
     color2_MUX_uxn_c_l214_c3_6f37_iftrue <= VAR_color2_MUX_uxn_c_l214_c3_6f37_iftrue;
     color2_MUX_uxn_c_l214_c3_6f37_iffalse <= VAR_color2_MUX_uxn_c_l214_c3_6f37_iffalse;
     -- Outputs
     VAR_color2_MUX_uxn_c_l214_c3_6f37_return_output := color2_MUX_uxn_c_l214_c3_6f37_return_output;

     -- Submodule level 10
     REG_VAR_color0 := VAR_color0_MUX_uxn_c_l211_c2_89fb_return_output;
     VAR_result_uxn_c_l279_c3_d4e6 := resize(VAR_color0_MUX_uxn_c_l211_c2_89fb_return_output, 16);
     VAR_color2_MUX_uxn_c_l211_c2_89fb_iftrue := VAR_color2_MUX_uxn_c_l214_c3_6f37_return_output;
     REG_VAR_color3 := VAR_color3_MUX_uxn_c_l211_c2_89fb_return_output;
     VAR_result_uxn_c_l285_c3_dedd := resize(VAR_color3_MUX_uxn_c_l211_c2_89fb_return_output, 16);
     VAR_result_MUX_uxn_c_l278_c2_5ca5_iftrue := VAR_result_uxn_c_l279_c3_d4e6;
     VAR_result_MUX_uxn_c_l282_c9_48cd_iffalse := VAR_result_uxn_c_l285_c3_dedd;
     -- color2_MUX[uxn_c_l211_c2_89fb] LATENCY=0
     -- Inputs
     color2_MUX_uxn_c_l211_c2_89fb_cond <= VAR_color2_MUX_uxn_c_l211_c2_89fb_cond;
     color2_MUX_uxn_c_l211_c2_89fb_iftrue <= VAR_color2_MUX_uxn_c_l211_c2_89fb_iftrue;
     color2_MUX_uxn_c_l211_c2_89fb_iffalse <= VAR_color2_MUX_uxn_c_l211_c2_89fb_iffalse;
     -- Outputs
     VAR_color2_MUX_uxn_c_l211_c2_89fb_return_output := color2_MUX_uxn_c_l211_c2_89fb_return_output;

     -- Submodule level 11
     REG_VAR_color2 := VAR_color2_MUX_uxn_c_l211_c2_89fb_return_output;
     VAR_result_uxn_c_l283_c3_16c8 := resize(VAR_color2_MUX_uxn_c_l211_c2_89fb_return_output, 16);
     VAR_result_MUX_uxn_c_l282_c9_48cd_iftrue := VAR_result_uxn_c_l283_c3_16c8;
     -- result_MUX[uxn_c_l282_c9_48cd] LATENCY=0
     -- Inputs
     result_MUX_uxn_c_l282_c9_48cd_cond <= VAR_result_MUX_uxn_c_l282_c9_48cd_cond;
     result_MUX_uxn_c_l282_c9_48cd_iftrue <= VAR_result_MUX_uxn_c_l282_c9_48cd_iftrue;
     result_MUX_uxn_c_l282_c9_48cd_iffalse <= VAR_result_MUX_uxn_c_l282_c9_48cd_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_c_l282_c9_48cd_return_output := result_MUX_uxn_c_l282_c9_48cd_return_output;

     -- Submodule level 12
     VAR_result_MUX_uxn_c_l280_c9_e27c_iffalse := VAR_result_MUX_uxn_c_l282_c9_48cd_return_output;
     -- result_MUX[uxn_c_l280_c9_e27c] LATENCY=0
     -- Inputs
     result_MUX_uxn_c_l280_c9_e27c_cond <= VAR_result_MUX_uxn_c_l280_c9_e27c_cond;
     result_MUX_uxn_c_l280_c9_e27c_iftrue <= VAR_result_MUX_uxn_c_l280_c9_e27c_iftrue;
     result_MUX_uxn_c_l280_c9_e27c_iffalse <= VAR_result_MUX_uxn_c_l280_c9_e27c_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_c_l280_c9_e27c_return_output := result_MUX_uxn_c_l280_c9_e27c_return_output;

     -- Submodule level 13
     VAR_result_MUX_uxn_c_l278_c2_5ca5_iffalse := VAR_result_MUX_uxn_c_l280_c9_e27c_return_output;
     -- result_MUX[uxn_c_l278_c2_5ca5] LATENCY=0
     -- Inputs
     result_MUX_uxn_c_l278_c2_5ca5_cond <= VAR_result_MUX_uxn_c_l278_c2_5ca5_cond;
     result_MUX_uxn_c_l278_c2_5ca5_iftrue <= VAR_result_MUX_uxn_c_l278_c2_5ca5_iftrue;
     result_MUX_uxn_c_l278_c2_5ca5_iffalse <= VAR_result_MUX_uxn_c_l278_c2_5ca5_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_c_l278_c2_5ca5_return_output := result_MUX_uxn_c_l278_c2_5ca5_return_output;

     -- Submodule level 14
     REG_VAR_result := VAR_result_MUX_uxn_c_l278_c2_5ca5_return_output;
     VAR_return_output := VAR_result_MUX_uxn_c_l278_c2_5ca5_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_color0 <= REG_VAR_color0;
REG_COMB_color1 <= REG_VAR_color1;
REG_COMB_color2 <= REG_VAR_color2;
REG_COMB_color3 <= REG_VAR_color3;
REG_COMB_color_cmp_0 <= REG_VAR_color_cmp_0;
REG_COMB_color_cmp_1 <= REG_VAR_color_cmp_1;
REG_COMB_tmp12 <= REG_VAR_tmp12;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     color0 <= REG_COMB_color0;
     color1 <= REG_COMB_color1;
     color2 <= REG_COMB_color2;
     color3 <= REG_COMB_color3;
     color_cmp_0 <= REG_COMB_color_cmp_0;
     color_cmp_1 <= REG_COMB_color_cmp_1;
     tmp12 <= REG_COMB_tmp12;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
