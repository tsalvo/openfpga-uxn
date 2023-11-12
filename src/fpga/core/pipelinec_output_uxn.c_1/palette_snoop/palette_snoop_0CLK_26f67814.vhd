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
-- color_cmp_1_MUX[uxn_c_l211_c2_5060]
signal color_cmp_1_MUX_uxn_c_l211_c2_5060_cond : unsigned(0 downto 0);
signal color_cmp_1_MUX_uxn_c_l211_c2_5060_iftrue : unsigned(3 downto 0);
signal color_cmp_1_MUX_uxn_c_l211_c2_5060_iffalse : unsigned(3 downto 0);
signal color_cmp_1_MUX_uxn_c_l211_c2_5060_return_output : unsigned(3 downto 0);

-- color_cmp_0_MUX[uxn_c_l211_c2_5060]
signal color_cmp_0_MUX_uxn_c_l211_c2_5060_cond : unsigned(0 downto 0);
signal color_cmp_0_MUX_uxn_c_l211_c2_5060_iftrue : unsigned(3 downto 0);
signal color_cmp_0_MUX_uxn_c_l211_c2_5060_iffalse : unsigned(3 downto 0);
signal color_cmp_0_MUX_uxn_c_l211_c2_5060_return_output : unsigned(3 downto 0);

-- color1_MUX[uxn_c_l211_c2_5060]
signal color1_MUX_uxn_c_l211_c2_5060_cond : unsigned(0 downto 0);
signal color1_MUX_uxn_c_l211_c2_5060_iftrue : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l211_c2_5060_iffalse : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l211_c2_5060_return_output : unsigned(11 downto 0);

-- color0_MUX[uxn_c_l211_c2_5060]
signal color0_MUX_uxn_c_l211_c2_5060_cond : unsigned(0 downto 0);
signal color0_MUX_uxn_c_l211_c2_5060_iftrue : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l211_c2_5060_iffalse : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l211_c2_5060_return_output : unsigned(11 downto 0);

-- color2_MUX[uxn_c_l211_c2_5060]
signal color2_MUX_uxn_c_l211_c2_5060_cond : unsigned(0 downto 0);
signal color2_MUX_uxn_c_l211_c2_5060_iftrue : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l211_c2_5060_iffalse : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l211_c2_5060_return_output : unsigned(11 downto 0);

-- color3_MUX[uxn_c_l211_c2_5060]
signal color3_MUX_uxn_c_l211_c2_5060_cond : unsigned(0 downto 0);
signal color3_MUX_uxn_c_l211_c2_5060_iftrue : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l211_c2_5060_iffalse : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l211_c2_5060_return_output : unsigned(11 downto 0);

-- tmp12_MUX[uxn_c_l211_c2_5060]
signal tmp12_MUX_uxn_c_l211_c2_5060_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_c_l211_c2_5060_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l211_c2_5060_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l211_c2_5060_return_output : unsigned(11 downto 0);

-- CONST_SR_4[uxn_c_l212_c27_5bd5]
signal CONST_SR_4_uxn_c_l212_c27_5bd5_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_c_l212_c27_5bd5_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_c_l214_c7_6deb]
signal BIN_OP_EQ_uxn_c_l214_c7_6deb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l214_c7_6deb_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l214_c7_6deb_return_output : unsigned(0 downto 0);

-- color1_MUX[uxn_c_l214_c3_9657]
signal color1_MUX_uxn_c_l214_c3_9657_cond : unsigned(0 downto 0);
signal color1_MUX_uxn_c_l214_c3_9657_iftrue : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l214_c3_9657_iffalse : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l214_c3_9657_return_output : unsigned(11 downto 0);

-- color0_MUX[uxn_c_l214_c3_9657]
signal color0_MUX_uxn_c_l214_c3_9657_cond : unsigned(0 downto 0);
signal color0_MUX_uxn_c_l214_c3_9657_iftrue : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l214_c3_9657_iffalse : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l214_c3_9657_return_output : unsigned(11 downto 0);

-- color2_MUX[uxn_c_l214_c3_9657]
signal color2_MUX_uxn_c_l214_c3_9657_cond : unsigned(0 downto 0);
signal color2_MUX_uxn_c_l214_c3_9657_iftrue : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l214_c3_9657_iffalse : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l214_c3_9657_return_output : unsigned(11 downto 0);

-- color3_MUX[uxn_c_l214_c3_9657]
signal color3_MUX_uxn_c_l214_c3_9657_cond : unsigned(0 downto 0);
signal color3_MUX_uxn_c_l214_c3_9657_iftrue : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l214_c3_9657_iffalse : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l214_c3_9657_return_output : unsigned(11 downto 0);

-- tmp12_MUX[uxn_c_l214_c3_9657]
signal tmp12_MUX_uxn_c_l214_c3_9657_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_c_l214_c3_9657_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l214_c3_9657_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l214_c3_9657_return_output : unsigned(11 downto 0);

-- CONST_SL_8[uxn_c_l216_c4_d5f8]
signal CONST_SL_8_uxn_c_l216_c4_d5f8_x : unsigned(11 downto 0);
signal CONST_SL_8_uxn_c_l216_c4_d5f8_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l217_c4_c421]
signal BIN_OP_AND_uxn_c_l217_c4_c421_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l217_c4_c421_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l217_c4_c421_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l218_c4_84eb]
signal BIN_OP_OR_uxn_c_l218_c4_84eb_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l218_c4_84eb_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l218_c4_84eb_return_output : unsigned(11 downto 0);

-- CONST_SL_8[uxn_c_l221_c4_402e]
signal CONST_SL_8_uxn_c_l221_c4_402e_x : unsigned(11 downto 0);
signal CONST_SL_8_uxn_c_l221_c4_402e_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l222_c4_3be7]
signal BIN_OP_AND_uxn_c_l222_c4_3be7_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l222_c4_3be7_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l222_c4_3be7_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l223_c4_b048]
signal BIN_OP_OR_uxn_c_l223_c4_b048_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l223_c4_b048_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l223_c4_b048_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l225_c12_dfc6]
signal BIN_OP_EQ_uxn_c_l225_c12_dfc6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l225_c12_dfc6_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l225_c12_dfc6_return_output : unsigned(0 downto 0);

-- color1_MUX[uxn_c_l225_c8_ee75]
signal color1_MUX_uxn_c_l225_c8_ee75_cond : unsigned(0 downto 0);
signal color1_MUX_uxn_c_l225_c8_ee75_iftrue : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l225_c8_ee75_iffalse : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l225_c8_ee75_return_output : unsigned(11 downto 0);

-- color0_MUX[uxn_c_l225_c8_ee75]
signal color0_MUX_uxn_c_l225_c8_ee75_cond : unsigned(0 downto 0);
signal color0_MUX_uxn_c_l225_c8_ee75_iftrue : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l225_c8_ee75_iffalse : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l225_c8_ee75_return_output : unsigned(11 downto 0);

-- color2_MUX[uxn_c_l225_c8_ee75]
signal color2_MUX_uxn_c_l225_c8_ee75_cond : unsigned(0 downto 0);
signal color2_MUX_uxn_c_l225_c8_ee75_iftrue : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l225_c8_ee75_iffalse : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l225_c8_ee75_return_output : unsigned(11 downto 0);

-- color3_MUX[uxn_c_l225_c8_ee75]
signal color3_MUX_uxn_c_l225_c8_ee75_cond : unsigned(0 downto 0);
signal color3_MUX_uxn_c_l225_c8_ee75_iftrue : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l225_c8_ee75_iffalse : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l225_c8_ee75_return_output : unsigned(11 downto 0);

-- tmp12_MUX[uxn_c_l225_c8_ee75]
signal tmp12_MUX_uxn_c_l225_c8_ee75_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_c_l225_c8_ee75_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l225_c8_ee75_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l225_c8_ee75_return_output : unsigned(11 downto 0);

-- CONST_SL_8[uxn_c_l227_c4_46ae]
signal CONST_SL_8_uxn_c_l227_c4_46ae_x : unsigned(11 downto 0);
signal CONST_SL_8_uxn_c_l227_c4_46ae_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l228_c4_2542]
signal BIN_OP_AND_uxn_c_l228_c4_2542_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l228_c4_2542_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l228_c4_2542_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l229_c4_8edc]
signal BIN_OP_OR_uxn_c_l229_c4_8edc_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l229_c4_8edc_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l229_c4_8edc_return_output : unsigned(11 downto 0);

-- CONST_SL_8[uxn_c_l232_c4_754a]
signal CONST_SL_8_uxn_c_l232_c4_754a_x : unsigned(11 downto 0);
signal CONST_SL_8_uxn_c_l232_c4_754a_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l233_c4_e9aa]
signal BIN_OP_AND_uxn_c_l233_c4_e9aa_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l233_c4_e9aa_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l233_c4_e9aa_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l234_c4_2a40]
signal BIN_OP_OR_uxn_c_l234_c4_2a40_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l234_c4_2a40_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l234_c4_2a40_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l236_c12_a8b6]
signal BIN_OP_EQ_uxn_c_l236_c12_a8b6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l236_c12_a8b6_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l236_c12_a8b6_return_output : unsigned(0 downto 0);

-- color1_MUX[uxn_c_l236_c8_881b]
signal color1_MUX_uxn_c_l236_c8_881b_cond : unsigned(0 downto 0);
signal color1_MUX_uxn_c_l236_c8_881b_iftrue : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l236_c8_881b_iffalse : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l236_c8_881b_return_output : unsigned(11 downto 0);

-- color0_MUX[uxn_c_l236_c8_881b]
signal color0_MUX_uxn_c_l236_c8_881b_cond : unsigned(0 downto 0);
signal color0_MUX_uxn_c_l236_c8_881b_iftrue : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l236_c8_881b_iffalse : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l236_c8_881b_return_output : unsigned(11 downto 0);

-- color2_MUX[uxn_c_l236_c8_881b]
signal color2_MUX_uxn_c_l236_c8_881b_cond : unsigned(0 downto 0);
signal color2_MUX_uxn_c_l236_c8_881b_iftrue : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l236_c8_881b_iffalse : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l236_c8_881b_return_output : unsigned(11 downto 0);

-- color3_MUX[uxn_c_l236_c8_881b]
signal color3_MUX_uxn_c_l236_c8_881b_cond : unsigned(0 downto 0);
signal color3_MUX_uxn_c_l236_c8_881b_iftrue : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l236_c8_881b_iffalse : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l236_c8_881b_return_output : unsigned(11 downto 0);

-- tmp12_MUX[uxn_c_l236_c8_881b]
signal tmp12_MUX_uxn_c_l236_c8_881b_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_c_l236_c8_881b_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l236_c8_881b_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l236_c8_881b_return_output : unsigned(11 downto 0);

-- CONST_SL_4[uxn_c_l238_c4_ca33]
signal CONST_SL_4_uxn_c_l238_c4_ca33_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_c_l238_c4_ca33_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l239_c4_dbd8]
signal BIN_OP_AND_uxn_c_l239_c4_dbd8_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l239_c4_dbd8_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l239_c4_dbd8_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l240_c4_13d5]
signal BIN_OP_OR_uxn_c_l240_c4_13d5_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l240_c4_13d5_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l240_c4_13d5_return_output : unsigned(11 downto 0);

-- CONST_SL_4[uxn_c_l243_c4_2ac7]
signal CONST_SL_4_uxn_c_l243_c4_2ac7_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_c_l243_c4_2ac7_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l244_c4_fd42]
signal BIN_OP_AND_uxn_c_l244_c4_fd42_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l244_c4_fd42_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l244_c4_fd42_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l245_c4_38d3]
signal BIN_OP_OR_uxn_c_l245_c4_38d3_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l245_c4_38d3_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l245_c4_38d3_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l247_c12_ef26]
signal BIN_OP_EQ_uxn_c_l247_c12_ef26_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l247_c12_ef26_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l247_c12_ef26_return_output : unsigned(0 downto 0);

-- color1_MUX[uxn_c_l247_c8_62db]
signal color1_MUX_uxn_c_l247_c8_62db_cond : unsigned(0 downto 0);
signal color1_MUX_uxn_c_l247_c8_62db_iftrue : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l247_c8_62db_iffalse : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l247_c8_62db_return_output : unsigned(11 downto 0);

-- color0_MUX[uxn_c_l247_c8_62db]
signal color0_MUX_uxn_c_l247_c8_62db_cond : unsigned(0 downto 0);
signal color0_MUX_uxn_c_l247_c8_62db_iftrue : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l247_c8_62db_iffalse : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l247_c8_62db_return_output : unsigned(11 downto 0);

-- color2_MUX[uxn_c_l247_c8_62db]
signal color2_MUX_uxn_c_l247_c8_62db_cond : unsigned(0 downto 0);
signal color2_MUX_uxn_c_l247_c8_62db_iftrue : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l247_c8_62db_iffalse : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l247_c8_62db_return_output : unsigned(11 downto 0);

-- color3_MUX[uxn_c_l247_c8_62db]
signal color3_MUX_uxn_c_l247_c8_62db_cond : unsigned(0 downto 0);
signal color3_MUX_uxn_c_l247_c8_62db_iftrue : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l247_c8_62db_iffalse : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l247_c8_62db_return_output : unsigned(11 downto 0);

-- tmp12_MUX[uxn_c_l247_c8_62db]
signal tmp12_MUX_uxn_c_l247_c8_62db_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_c_l247_c8_62db_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l247_c8_62db_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l247_c8_62db_return_output : unsigned(11 downto 0);

-- CONST_SL_4[uxn_c_l249_c4_4276]
signal CONST_SL_4_uxn_c_l249_c4_4276_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_c_l249_c4_4276_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l250_c4_4b2c]
signal BIN_OP_AND_uxn_c_l250_c4_4b2c_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l250_c4_4b2c_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l250_c4_4b2c_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l251_c4_a0c4]
signal BIN_OP_OR_uxn_c_l251_c4_a0c4_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l251_c4_a0c4_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l251_c4_a0c4_return_output : unsigned(11 downto 0);

-- CONST_SL_4[uxn_c_l254_c4_07aa]
signal CONST_SL_4_uxn_c_l254_c4_07aa_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_c_l254_c4_07aa_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l255_c4_b75b]
signal BIN_OP_AND_uxn_c_l255_c4_b75b_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l255_c4_b75b_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l255_c4_b75b_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l256_c4_2f1a]
signal BIN_OP_OR_uxn_c_l256_c4_2f1a_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l256_c4_2f1a_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l256_c4_2f1a_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l258_c12_765e]
signal BIN_OP_EQ_uxn_c_l258_c12_765e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l258_c12_765e_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l258_c12_765e_return_output : unsigned(0 downto 0);

-- color1_MUX[uxn_c_l258_c8_6771]
signal color1_MUX_uxn_c_l258_c8_6771_cond : unsigned(0 downto 0);
signal color1_MUX_uxn_c_l258_c8_6771_iftrue : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l258_c8_6771_iffalse : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l258_c8_6771_return_output : unsigned(11 downto 0);

-- color0_MUX[uxn_c_l258_c8_6771]
signal color0_MUX_uxn_c_l258_c8_6771_cond : unsigned(0 downto 0);
signal color0_MUX_uxn_c_l258_c8_6771_iftrue : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l258_c8_6771_iffalse : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l258_c8_6771_return_output : unsigned(11 downto 0);

-- color2_MUX[uxn_c_l258_c8_6771]
signal color2_MUX_uxn_c_l258_c8_6771_cond : unsigned(0 downto 0);
signal color2_MUX_uxn_c_l258_c8_6771_iftrue : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l258_c8_6771_iffalse : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l258_c8_6771_return_output : unsigned(11 downto 0);

-- color3_MUX[uxn_c_l258_c8_6771]
signal color3_MUX_uxn_c_l258_c8_6771_cond : unsigned(0 downto 0);
signal color3_MUX_uxn_c_l258_c8_6771_iftrue : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l258_c8_6771_iffalse : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l258_c8_6771_return_output : unsigned(11 downto 0);

-- tmp12_MUX[uxn_c_l258_c8_6771]
signal tmp12_MUX_uxn_c_l258_c8_6771_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_c_l258_c8_6771_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l258_c8_6771_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l258_c8_6771_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l260_c4_5423]
signal BIN_OP_AND_uxn_c_l260_c4_5423_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l260_c4_5423_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l260_c4_5423_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l261_c4_c180]
signal BIN_OP_OR_uxn_c_l261_c4_c180_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l261_c4_c180_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l261_c4_c180_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l264_c4_4ed8]
signal BIN_OP_AND_uxn_c_l264_c4_4ed8_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l264_c4_4ed8_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l264_c4_4ed8_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l265_c4_ef66]
signal BIN_OP_OR_uxn_c_l265_c4_ef66_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l265_c4_ef66_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l265_c4_ef66_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l267_c12_6d62]
signal BIN_OP_EQ_uxn_c_l267_c12_6d62_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l267_c12_6d62_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l267_c12_6d62_return_output : unsigned(0 downto 0);

-- color2_MUX[uxn_c_l267_c8_15e0]
signal color2_MUX_uxn_c_l267_c8_15e0_cond : unsigned(0 downto 0);
signal color2_MUX_uxn_c_l267_c8_15e0_iftrue : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l267_c8_15e0_iffalse : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l267_c8_15e0_return_output : unsigned(11 downto 0);

-- color3_MUX[uxn_c_l267_c8_15e0]
signal color3_MUX_uxn_c_l267_c8_15e0_cond : unsigned(0 downto 0);
signal color3_MUX_uxn_c_l267_c8_15e0_iftrue : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l267_c8_15e0_iffalse : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l267_c8_15e0_return_output : unsigned(11 downto 0);

-- tmp12_MUX[uxn_c_l267_c8_15e0]
signal tmp12_MUX_uxn_c_l267_c8_15e0_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_c_l267_c8_15e0_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l267_c8_15e0_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l267_c8_15e0_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l269_c4_a19d]
signal BIN_OP_AND_uxn_c_l269_c4_a19d_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l269_c4_a19d_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l269_c4_a19d_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l270_c4_dbf2]
signal BIN_OP_OR_uxn_c_l270_c4_dbf2_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l270_c4_dbf2_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l270_c4_dbf2_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l273_c4_3426]
signal BIN_OP_AND_uxn_c_l273_c4_3426_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l273_c4_3426_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l273_c4_3426_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l274_c4_41c1]
signal BIN_OP_OR_uxn_c_l274_c4_41c1_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l274_c4_41c1_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l274_c4_41c1_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l278_c6_5f0d]
signal BIN_OP_EQ_uxn_c_l278_c6_5f0d_left : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l278_c6_5f0d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l278_c6_5f0d_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_c_l278_c2_b186]
signal result_MUX_uxn_c_l278_c2_b186_cond : unsigned(0 downto 0);
signal result_MUX_uxn_c_l278_c2_b186_iftrue : unsigned(15 downto 0);
signal result_MUX_uxn_c_l278_c2_b186_iffalse : unsigned(15 downto 0);
signal result_MUX_uxn_c_l278_c2_b186_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l280_c13_0e05]
signal BIN_OP_EQ_uxn_c_l280_c13_0e05_left : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l280_c13_0e05_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l280_c13_0e05_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_c_l280_c9_c97e]
signal result_MUX_uxn_c_l280_c9_c97e_cond : unsigned(0 downto 0);
signal result_MUX_uxn_c_l280_c9_c97e_iftrue : unsigned(15 downto 0);
signal result_MUX_uxn_c_l280_c9_c97e_iffalse : unsigned(15 downto 0);
signal result_MUX_uxn_c_l280_c9_c97e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l282_c13_d660]
signal BIN_OP_EQ_uxn_c_l282_c13_d660_left : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l282_c13_d660_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l282_c13_d660_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_c_l282_c9_09d3]
signal result_MUX_uxn_c_l282_c9_09d3_cond : unsigned(0 downto 0);
signal result_MUX_uxn_c_l282_c9_09d3_iftrue : unsigned(15 downto 0);
signal result_MUX_uxn_c_l282_c9_09d3_iffalse : unsigned(15 downto 0);
signal result_MUX_uxn_c_l282_c9_09d3_return_output : unsigned(15 downto 0);

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
-- color_cmp_1_MUX_uxn_c_l211_c2_5060
color_cmp_1_MUX_uxn_c_l211_c2_5060 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_cmp_1_MUX_uxn_c_l211_c2_5060_cond,
color_cmp_1_MUX_uxn_c_l211_c2_5060_iftrue,
color_cmp_1_MUX_uxn_c_l211_c2_5060_iffalse,
color_cmp_1_MUX_uxn_c_l211_c2_5060_return_output);

-- color_cmp_0_MUX_uxn_c_l211_c2_5060
color_cmp_0_MUX_uxn_c_l211_c2_5060 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_cmp_0_MUX_uxn_c_l211_c2_5060_cond,
color_cmp_0_MUX_uxn_c_l211_c2_5060_iftrue,
color_cmp_0_MUX_uxn_c_l211_c2_5060_iffalse,
color_cmp_0_MUX_uxn_c_l211_c2_5060_return_output);

-- color1_MUX_uxn_c_l211_c2_5060
color1_MUX_uxn_c_l211_c2_5060 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color1_MUX_uxn_c_l211_c2_5060_cond,
color1_MUX_uxn_c_l211_c2_5060_iftrue,
color1_MUX_uxn_c_l211_c2_5060_iffalse,
color1_MUX_uxn_c_l211_c2_5060_return_output);

-- color0_MUX_uxn_c_l211_c2_5060
color0_MUX_uxn_c_l211_c2_5060 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color0_MUX_uxn_c_l211_c2_5060_cond,
color0_MUX_uxn_c_l211_c2_5060_iftrue,
color0_MUX_uxn_c_l211_c2_5060_iffalse,
color0_MUX_uxn_c_l211_c2_5060_return_output);

-- color2_MUX_uxn_c_l211_c2_5060
color2_MUX_uxn_c_l211_c2_5060 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color2_MUX_uxn_c_l211_c2_5060_cond,
color2_MUX_uxn_c_l211_c2_5060_iftrue,
color2_MUX_uxn_c_l211_c2_5060_iffalse,
color2_MUX_uxn_c_l211_c2_5060_return_output);

-- color3_MUX_uxn_c_l211_c2_5060
color3_MUX_uxn_c_l211_c2_5060 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color3_MUX_uxn_c_l211_c2_5060_cond,
color3_MUX_uxn_c_l211_c2_5060_iftrue,
color3_MUX_uxn_c_l211_c2_5060_iffalse,
color3_MUX_uxn_c_l211_c2_5060_return_output);

-- tmp12_MUX_uxn_c_l211_c2_5060
tmp12_MUX_uxn_c_l211_c2_5060 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_c_l211_c2_5060_cond,
tmp12_MUX_uxn_c_l211_c2_5060_iftrue,
tmp12_MUX_uxn_c_l211_c2_5060_iffalse,
tmp12_MUX_uxn_c_l211_c2_5060_return_output);

-- CONST_SR_4_uxn_c_l212_c27_5bd5
CONST_SR_4_uxn_c_l212_c27_5bd5 : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_c_l212_c27_5bd5_x,
CONST_SR_4_uxn_c_l212_c27_5bd5_return_output);

-- BIN_OP_EQ_uxn_c_l214_c7_6deb
BIN_OP_EQ_uxn_c_l214_c7_6deb : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l214_c7_6deb_left,
BIN_OP_EQ_uxn_c_l214_c7_6deb_right,
BIN_OP_EQ_uxn_c_l214_c7_6deb_return_output);

-- color1_MUX_uxn_c_l214_c3_9657
color1_MUX_uxn_c_l214_c3_9657 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color1_MUX_uxn_c_l214_c3_9657_cond,
color1_MUX_uxn_c_l214_c3_9657_iftrue,
color1_MUX_uxn_c_l214_c3_9657_iffalse,
color1_MUX_uxn_c_l214_c3_9657_return_output);

-- color0_MUX_uxn_c_l214_c3_9657
color0_MUX_uxn_c_l214_c3_9657 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color0_MUX_uxn_c_l214_c3_9657_cond,
color0_MUX_uxn_c_l214_c3_9657_iftrue,
color0_MUX_uxn_c_l214_c3_9657_iffalse,
color0_MUX_uxn_c_l214_c3_9657_return_output);

-- color2_MUX_uxn_c_l214_c3_9657
color2_MUX_uxn_c_l214_c3_9657 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color2_MUX_uxn_c_l214_c3_9657_cond,
color2_MUX_uxn_c_l214_c3_9657_iftrue,
color2_MUX_uxn_c_l214_c3_9657_iffalse,
color2_MUX_uxn_c_l214_c3_9657_return_output);

-- color3_MUX_uxn_c_l214_c3_9657
color3_MUX_uxn_c_l214_c3_9657 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color3_MUX_uxn_c_l214_c3_9657_cond,
color3_MUX_uxn_c_l214_c3_9657_iftrue,
color3_MUX_uxn_c_l214_c3_9657_iffalse,
color3_MUX_uxn_c_l214_c3_9657_return_output);

-- tmp12_MUX_uxn_c_l214_c3_9657
tmp12_MUX_uxn_c_l214_c3_9657 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_c_l214_c3_9657_cond,
tmp12_MUX_uxn_c_l214_c3_9657_iftrue,
tmp12_MUX_uxn_c_l214_c3_9657_iffalse,
tmp12_MUX_uxn_c_l214_c3_9657_return_output);

-- CONST_SL_8_uxn_c_l216_c4_d5f8
CONST_SL_8_uxn_c_l216_c4_d5f8 : entity work.CONST_SL_8_uint12_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l216_c4_d5f8_x,
CONST_SL_8_uxn_c_l216_c4_d5f8_return_output);

-- BIN_OP_AND_uxn_c_l217_c4_c421
BIN_OP_AND_uxn_c_l217_c4_c421 : entity work.BIN_OP_AND_uint12_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l217_c4_c421_left,
BIN_OP_AND_uxn_c_l217_c4_c421_right,
BIN_OP_AND_uxn_c_l217_c4_c421_return_output);

-- BIN_OP_OR_uxn_c_l218_c4_84eb
BIN_OP_OR_uxn_c_l218_c4_84eb : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l218_c4_84eb_left,
BIN_OP_OR_uxn_c_l218_c4_84eb_right,
BIN_OP_OR_uxn_c_l218_c4_84eb_return_output);

-- CONST_SL_8_uxn_c_l221_c4_402e
CONST_SL_8_uxn_c_l221_c4_402e : entity work.CONST_SL_8_uint12_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l221_c4_402e_x,
CONST_SL_8_uxn_c_l221_c4_402e_return_output);

-- BIN_OP_AND_uxn_c_l222_c4_3be7
BIN_OP_AND_uxn_c_l222_c4_3be7 : entity work.BIN_OP_AND_uint12_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l222_c4_3be7_left,
BIN_OP_AND_uxn_c_l222_c4_3be7_right,
BIN_OP_AND_uxn_c_l222_c4_3be7_return_output);

-- BIN_OP_OR_uxn_c_l223_c4_b048
BIN_OP_OR_uxn_c_l223_c4_b048 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l223_c4_b048_left,
BIN_OP_OR_uxn_c_l223_c4_b048_right,
BIN_OP_OR_uxn_c_l223_c4_b048_return_output);

-- BIN_OP_EQ_uxn_c_l225_c12_dfc6
BIN_OP_EQ_uxn_c_l225_c12_dfc6 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l225_c12_dfc6_left,
BIN_OP_EQ_uxn_c_l225_c12_dfc6_right,
BIN_OP_EQ_uxn_c_l225_c12_dfc6_return_output);

-- color1_MUX_uxn_c_l225_c8_ee75
color1_MUX_uxn_c_l225_c8_ee75 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color1_MUX_uxn_c_l225_c8_ee75_cond,
color1_MUX_uxn_c_l225_c8_ee75_iftrue,
color1_MUX_uxn_c_l225_c8_ee75_iffalse,
color1_MUX_uxn_c_l225_c8_ee75_return_output);

-- color0_MUX_uxn_c_l225_c8_ee75
color0_MUX_uxn_c_l225_c8_ee75 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color0_MUX_uxn_c_l225_c8_ee75_cond,
color0_MUX_uxn_c_l225_c8_ee75_iftrue,
color0_MUX_uxn_c_l225_c8_ee75_iffalse,
color0_MUX_uxn_c_l225_c8_ee75_return_output);

-- color2_MUX_uxn_c_l225_c8_ee75
color2_MUX_uxn_c_l225_c8_ee75 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color2_MUX_uxn_c_l225_c8_ee75_cond,
color2_MUX_uxn_c_l225_c8_ee75_iftrue,
color2_MUX_uxn_c_l225_c8_ee75_iffalse,
color2_MUX_uxn_c_l225_c8_ee75_return_output);

-- color3_MUX_uxn_c_l225_c8_ee75
color3_MUX_uxn_c_l225_c8_ee75 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color3_MUX_uxn_c_l225_c8_ee75_cond,
color3_MUX_uxn_c_l225_c8_ee75_iftrue,
color3_MUX_uxn_c_l225_c8_ee75_iffalse,
color3_MUX_uxn_c_l225_c8_ee75_return_output);

-- tmp12_MUX_uxn_c_l225_c8_ee75
tmp12_MUX_uxn_c_l225_c8_ee75 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_c_l225_c8_ee75_cond,
tmp12_MUX_uxn_c_l225_c8_ee75_iftrue,
tmp12_MUX_uxn_c_l225_c8_ee75_iffalse,
tmp12_MUX_uxn_c_l225_c8_ee75_return_output);

-- CONST_SL_8_uxn_c_l227_c4_46ae
CONST_SL_8_uxn_c_l227_c4_46ae : entity work.CONST_SL_8_uint12_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l227_c4_46ae_x,
CONST_SL_8_uxn_c_l227_c4_46ae_return_output);

-- BIN_OP_AND_uxn_c_l228_c4_2542
BIN_OP_AND_uxn_c_l228_c4_2542 : entity work.BIN_OP_AND_uint12_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l228_c4_2542_left,
BIN_OP_AND_uxn_c_l228_c4_2542_right,
BIN_OP_AND_uxn_c_l228_c4_2542_return_output);

-- BIN_OP_OR_uxn_c_l229_c4_8edc
BIN_OP_OR_uxn_c_l229_c4_8edc : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l229_c4_8edc_left,
BIN_OP_OR_uxn_c_l229_c4_8edc_right,
BIN_OP_OR_uxn_c_l229_c4_8edc_return_output);

-- CONST_SL_8_uxn_c_l232_c4_754a
CONST_SL_8_uxn_c_l232_c4_754a : entity work.CONST_SL_8_uint12_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l232_c4_754a_x,
CONST_SL_8_uxn_c_l232_c4_754a_return_output);

-- BIN_OP_AND_uxn_c_l233_c4_e9aa
BIN_OP_AND_uxn_c_l233_c4_e9aa : entity work.BIN_OP_AND_uint12_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l233_c4_e9aa_left,
BIN_OP_AND_uxn_c_l233_c4_e9aa_right,
BIN_OP_AND_uxn_c_l233_c4_e9aa_return_output);

-- BIN_OP_OR_uxn_c_l234_c4_2a40
BIN_OP_OR_uxn_c_l234_c4_2a40 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l234_c4_2a40_left,
BIN_OP_OR_uxn_c_l234_c4_2a40_right,
BIN_OP_OR_uxn_c_l234_c4_2a40_return_output);

-- BIN_OP_EQ_uxn_c_l236_c12_a8b6
BIN_OP_EQ_uxn_c_l236_c12_a8b6 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l236_c12_a8b6_left,
BIN_OP_EQ_uxn_c_l236_c12_a8b6_right,
BIN_OP_EQ_uxn_c_l236_c12_a8b6_return_output);

-- color1_MUX_uxn_c_l236_c8_881b
color1_MUX_uxn_c_l236_c8_881b : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color1_MUX_uxn_c_l236_c8_881b_cond,
color1_MUX_uxn_c_l236_c8_881b_iftrue,
color1_MUX_uxn_c_l236_c8_881b_iffalse,
color1_MUX_uxn_c_l236_c8_881b_return_output);

-- color0_MUX_uxn_c_l236_c8_881b
color0_MUX_uxn_c_l236_c8_881b : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color0_MUX_uxn_c_l236_c8_881b_cond,
color0_MUX_uxn_c_l236_c8_881b_iftrue,
color0_MUX_uxn_c_l236_c8_881b_iffalse,
color0_MUX_uxn_c_l236_c8_881b_return_output);

-- color2_MUX_uxn_c_l236_c8_881b
color2_MUX_uxn_c_l236_c8_881b : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color2_MUX_uxn_c_l236_c8_881b_cond,
color2_MUX_uxn_c_l236_c8_881b_iftrue,
color2_MUX_uxn_c_l236_c8_881b_iffalse,
color2_MUX_uxn_c_l236_c8_881b_return_output);

-- color3_MUX_uxn_c_l236_c8_881b
color3_MUX_uxn_c_l236_c8_881b : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color3_MUX_uxn_c_l236_c8_881b_cond,
color3_MUX_uxn_c_l236_c8_881b_iftrue,
color3_MUX_uxn_c_l236_c8_881b_iffalse,
color3_MUX_uxn_c_l236_c8_881b_return_output);

-- tmp12_MUX_uxn_c_l236_c8_881b
tmp12_MUX_uxn_c_l236_c8_881b : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_c_l236_c8_881b_cond,
tmp12_MUX_uxn_c_l236_c8_881b_iftrue,
tmp12_MUX_uxn_c_l236_c8_881b_iffalse,
tmp12_MUX_uxn_c_l236_c8_881b_return_output);

-- CONST_SL_4_uxn_c_l238_c4_ca33
CONST_SL_4_uxn_c_l238_c4_ca33 : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_c_l238_c4_ca33_x,
CONST_SL_4_uxn_c_l238_c4_ca33_return_output);

-- BIN_OP_AND_uxn_c_l239_c4_dbd8
BIN_OP_AND_uxn_c_l239_c4_dbd8 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l239_c4_dbd8_left,
BIN_OP_AND_uxn_c_l239_c4_dbd8_right,
BIN_OP_AND_uxn_c_l239_c4_dbd8_return_output);

-- BIN_OP_OR_uxn_c_l240_c4_13d5
BIN_OP_OR_uxn_c_l240_c4_13d5 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l240_c4_13d5_left,
BIN_OP_OR_uxn_c_l240_c4_13d5_right,
BIN_OP_OR_uxn_c_l240_c4_13d5_return_output);

-- CONST_SL_4_uxn_c_l243_c4_2ac7
CONST_SL_4_uxn_c_l243_c4_2ac7 : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_c_l243_c4_2ac7_x,
CONST_SL_4_uxn_c_l243_c4_2ac7_return_output);

-- BIN_OP_AND_uxn_c_l244_c4_fd42
BIN_OP_AND_uxn_c_l244_c4_fd42 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l244_c4_fd42_left,
BIN_OP_AND_uxn_c_l244_c4_fd42_right,
BIN_OP_AND_uxn_c_l244_c4_fd42_return_output);

-- BIN_OP_OR_uxn_c_l245_c4_38d3
BIN_OP_OR_uxn_c_l245_c4_38d3 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l245_c4_38d3_left,
BIN_OP_OR_uxn_c_l245_c4_38d3_right,
BIN_OP_OR_uxn_c_l245_c4_38d3_return_output);

-- BIN_OP_EQ_uxn_c_l247_c12_ef26
BIN_OP_EQ_uxn_c_l247_c12_ef26 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l247_c12_ef26_left,
BIN_OP_EQ_uxn_c_l247_c12_ef26_right,
BIN_OP_EQ_uxn_c_l247_c12_ef26_return_output);

-- color1_MUX_uxn_c_l247_c8_62db
color1_MUX_uxn_c_l247_c8_62db : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color1_MUX_uxn_c_l247_c8_62db_cond,
color1_MUX_uxn_c_l247_c8_62db_iftrue,
color1_MUX_uxn_c_l247_c8_62db_iffalse,
color1_MUX_uxn_c_l247_c8_62db_return_output);

-- color0_MUX_uxn_c_l247_c8_62db
color0_MUX_uxn_c_l247_c8_62db : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color0_MUX_uxn_c_l247_c8_62db_cond,
color0_MUX_uxn_c_l247_c8_62db_iftrue,
color0_MUX_uxn_c_l247_c8_62db_iffalse,
color0_MUX_uxn_c_l247_c8_62db_return_output);

-- color2_MUX_uxn_c_l247_c8_62db
color2_MUX_uxn_c_l247_c8_62db : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color2_MUX_uxn_c_l247_c8_62db_cond,
color2_MUX_uxn_c_l247_c8_62db_iftrue,
color2_MUX_uxn_c_l247_c8_62db_iffalse,
color2_MUX_uxn_c_l247_c8_62db_return_output);

-- color3_MUX_uxn_c_l247_c8_62db
color3_MUX_uxn_c_l247_c8_62db : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color3_MUX_uxn_c_l247_c8_62db_cond,
color3_MUX_uxn_c_l247_c8_62db_iftrue,
color3_MUX_uxn_c_l247_c8_62db_iffalse,
color3_MUX_uxn_c_l247_c8_62db_return_output);

-- tmp12_MUX_uxn_c_l247_c8_62db
tmp12_MUX_uxn_c_l247_c8_62db : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_c_l247_c8_62db_cond,
tmp12_MUX_uxn_c_l247_c8_62db_iftrue,
tmp12_MUX_uxn_c_l247_c8_62db_iffalse,
tmp12_MUX_uxn_c_l247_c8_62db_return_output);

-- CONST_SL_4_uxn_c_l249_c4_4276
CONST_SL_4_uxn_c_l249_c4_4276 : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_c_l249_c4_4276_x,
CONST_SL_4_uxn_c_l249_c4_4276_return_output);

-- BIN_OP_AND_uxn_c_l250_c4_4b2c
BIN_OP_AND_uxn_c_l250_c4_4b2c : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l250_c4_4b2c_left,
BIN_OP_AND_uxn_c_l250_c4_4b2c_right,
BIN_OP_AND_uxn_c_l250_c4_4b2c_return_output);

-- BIN_OP_OR_uxn_c_l251_c4_a0c4
BIN_OP_OR_uxn_c_l251_c4_a0c4 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l251_c4_a0c4_left,
BIN_OP_OR_uxn_c_l251_c4_a0c4_right,
BIN_OP_OR_uxn_c_l251_c4_a0c4_return_output);

-- CONST_SL_4_uxn_c_l254_c4_07aa
CONST_SL_4_uxn_c_l254_c4_07aa : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_c_l254_c4_07aa_x,
CONST_SL_4_uxn_c_l254_c4_07aa_return_output);

-- BIN_OP_AND_uxn_c_l255_c4_b75b
BIN_OP_AND_uxn_c_l255_c4_b75b : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l255_c4_b75b_left,
BIN_OP_AND_uxn_c_l255_c4_b75b_right,
BIN_OP_AND_uxn_c_l255_c4_b75b_return_output);

-- BIN_OP_OR_uxn_c_l256_c4_2f1a
BIN_OP_OR_uxn_c_l256_c4_2f1a : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l256_c4_2f1a_left,
BIN_OP_OR_uxn_c_l256_c4_2f1a_right,
BIN_OP_OR_uxn_c_l256_c4_2f1a_return_output);

-- BIN_OP_EQ_uxn_c_l258_c12_765e
BIN_OP_EQ_uxn_c_l258_c12_765e : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l258_c12_765e_left,
BIN_OP_EQ_uxn_c_l258_c12_765e_right,
BIN_OP_EQ_uxn_c_l258_c12_765e_return_output);

-- color1_MUX_uxn_c_l258_c8_6771
color1_MUX_uxn_c_l258_c8_6771 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color1_MUX_uxn_c_l258_c8_6771_cond,
color1_MUX_uxn_c_l258_c8_6771_iftrue,
color1_MUX_uxn_c_l258_c8_6771_iffalse,
color1_MUX_uxn_c_l258_c8_6771_return_output);

-- color0_MUX_uxn_c_l258_c8_6771
color0_MUX_uxn_c_l258_c8_6771 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color0_MUX_uxn_c_l258_c8_6771_cond,
color0_MUX_uxn_c_l258_c8_6771_iftrue,
color0_MUX_uxn_c_l258_c8_6771_iffalse,
color0_MUX_uxn_c_l258_c8_6771_return_output);

-- color2_MUX_uxn_c_l258_c8_6771
color2_MUX_uxn_c_l258_c8_6771 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color2_MUX_uxn_c_l258_c8_6771_cond,
color2_MUX_uxn_c_l258_c8_6771_iftrue,
color2_MUX_uxn_c_l258_c8_6771_iffalse,
color2_MUX_uxn_c_l258_c8_6771_return_output);

-- color3_MUX_uxn_c_l258_c8_6771
color3_MUX_uxn_c_l258_c8_6771 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color3_MUX_uxn_c_l258_c8_6771_cond,
color3_MUX_uxn_c_l258_c8_6771_iftrue,
color3_MUX_uxn_c_l258_c8_6771_iffalse,
color3_MUX_uxn_c_l258_c8_6771_return_output);

-- tmp12_MUX_uxn_c_l258_c8_6771
tmp12_MUX_uxn_c_l258_c8_6771 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_c_l258_c8_6771_cond,
tmp12_MUX_uxn_c_l258_c8_6771_iftrue,
tmp12_MUX_uxn_c_l258_c8_6771_iffalse,
tmp12_MUX_uxn_c_l258_c8_6771_return_output);

-- BIN_OP_AND_uxn_c_l260_c4_5423
BIN_OP_AND_uxn_c_l260_c4_5423 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l260_c4_5423_left,
BIN_OP_AND_uxn_c_l260_c4_5423_right,
BIN_OP_AND_uxn_c_l260_c4_5423_return_output);

-- BIN_OP_OR_uxn_c_l261_c4_c180
BIN_OP_OR_uxn_c_l261_c4_c180 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l261_c4_c180_left,
BIN_OP_OR_uxn_c_l261_c4_c180_right,
BIN_OP_OR_uxn_c_l261_c4_c180_return_output);

-- BIN_OP_AND_uxn_c_l264_c4_4ed8
BIN_OP_AND_uxn_c_l264_c4_4ed8 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l264_c4_4ed8_left,
BIN_OP_AND_uxn_c_l264_c4_4ed8_right,
BIN_OP_AND_uxn_c_l264_c4_4ed8_return_output);

-- BIN_OP_OR_uxn_c_l265_c4_ef66
BIN_OP_OR_uxn_c_l265_c4_ef66 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l265_c4_ef66_left,
BIN_OP_OR_uxn_c_l265_c4_ef66_right,
BIN_OP_OR_uxn_c_l265_c4_ef66_return_output);

-- BIN_OP_EQ_uxn_c_l267_c12_6d62
BIN_OP_EQ_uxn_c_l267_c12_6d62 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l267_c12_6d62_left,
BIN_OP_EQ_uxn_c_l267_c12_6d62_right,
BIN_OP_EQ_uxn_c_l267_c12_6d62_return_output);

-- color2_MUX_uxn_c_l267_c8_15e0
color2_MUX_uxn_c_l267_c8_15e0 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color2_MUX_uxn_c_l267_c8_15e0_cond,
color2_MUX_uxn_c_l267_c8_15e0_iftrue,
color2_MUX_uxn_c_l267_c8_15e0_iffalse,
color2_MUX_uxn_c_l267_c8_15e0_return_output);

-- color3_MUX_uxn_c_l267_c8_15e0
color3_MUX_uxn_c_l267_c8_15e0 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color3_MUX_uxn_c_l267_c8_15e0_cond,
color3_MUX_uxn_c_l267_c8_15e0_iftrue,
color3_MUX_uxn_c_l267_c8_15e0_iffalse,
color3_MUX_uxn_c_l267_c8_15e0_return_output);

-- tmp12_MUX_uxn_c_l267_c8_15e0
tmp12_MUX_uxn_c_l267_c8_15e0 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_c_l267_c8_15e0_cond,
tmp12_MUX_uxn_c_l267_c8_15e0_iftrue,
tmp12_MUX_uxn_c_l267_c8_15e0_iffalse,
tmp12_MUX_uxn_c_l267_c8_15e0_return_output);

-- BIN_OP_AND_uxn_c_l269_c4_a19d
BIN_OP_AND_uxn_c_l269_c4_a19d : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l269_c4_a19d_left,
BIN_OP_AND_uxn_c_l269_c4_a19d_right,
BIN_OP_AND_uxn_c_l269_c4_a19d_return_output);

-- BIN_OP_OR_uxn_c_l270_c4_dbf2
BIN_OP_OR_uxn_c_l270_c4_dbf2 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l270_c4_dbf2_left,
BIN_OP_OR_uxn_c_l270_c4_dbf2_right,
BIN_OP_OR_uxn_c_l270_c4_dbf2_return_output);

-- BIN_OP_AND_uxn_c_l273_c4_3426
BIN_OP_AND_uxn_c_l273_c4_3426 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l273_c4_3426_left,
BIN_OP_AND_uxn_c_l273_c4_3426_right,
BIN_OP_AND_uxn_c_l273_c4_3426_return_output);

-- BIN_OP_OR_uxn_c_l274_c4_41c1
BIN_OP_OR_uxn_c_l274_c4_41c1 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l274_c4_41c1_left,
BIN_OP_OR_uxn_c_l274_c4_41c1_right,
BIN_OP_OR_uxn_c_l274_c4_41c1_return_output);

-- BIN_OP_EQ_uxn_c_l278_c6_5f0d
BIN_OP_EQ_uxn_c_l278_c6_5f0d : entity work.BIN_OP_EQ_uint2_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l278_c6_5f0d_left,
BIN_OP_EQ_uxn_c_l278_c6_5f0d_right,
BIN_OP_EQ_uxn_c_l278_c6_5f0d_return_output);

-- result_MUX_uxn_c_l278_c2_b186
result_MUX_uxn_c_l278_c2_b186 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_MUX_uxn_c_l278_c2_b186_cond,
result_MUX_uxn_c_l278_c2_b186_iftrue,
result_MUX_uxn_c_l278_c2_b186_iffalse,
result_MUX_uxn_c_l278_c2_b186_return_output);

-- BIN_OP_EQ_uxn_c_l280_c13_0e05
BIN_OP_EQ_uxn_c_l280_c13_0e05 : entity work.BIN_OP_EQ_uint2_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l280_c13_0e05_left,
BIN_OP_EQ_uxn_c_l280_c13_0e05_right,
BIN_OP_EQ_uxn_c_l280_c13_0e05_return_output);

-- result_MUX_uxn_c_l280_c9_c97e
result_MUX_uxn_c_l280_c9_c97e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_MUX_uxn_c_l280_c9_c97e_cond,
result_MUX_uxn_c_l280_c9_c97e_iftrue,
result_MUX_uxn_c_l280_c9_c97e_iffalse,
result_MUX_uxn_c_l280_c9_c97e_return_output);

-- BIN_OP_EQ_uxn_c_l282_c13_d660
BIN_OP_EQ_uxn_c_l282_c13_d660 : entity work.BIN_OP_EQ_uint2_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l282_c13_d660_left,
BIN_OP_EQ_uxn_c_l282_c13_d660_right,
BIN_OP_EQ_uxn_c_l282_c13_d660_return_output);

-- result_MUX_uxn_c_l282_c9_09d3
result_MUX_uxn_c_l282_c9_09d3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_MUX_uxn_c_l282_c9_09d3_cond,
result_MUX_uxn_c_l282_c9_09d3_iftrue,
result_MUX_uxn_c_l282_c9_09d3_iffalse,
result_MUX_uxn_c_l282_c9_09d3_return_output);



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
 color_cmp_1_MUX_uxn_c_l211_c2_5060_return_output,
 color_cmp_0_MUX_uxn_c_l211_c2_5060_return_output,
 color1_MUX_uxn_c_l211_c2_5060_return_output,
 color0_MUX_uxn_c_l211_c2_5060_return_output,
 color2_MUX_uxn_c_l211_c2_5060_return_output,
 color3_MUX_uxn_c_l211_c2_5060_return_output,
 tmp12_MUX_uxn_c_l211_c2_5060_return_output,
 CONST_SR_4_uxn_c_l212_c27_5bd5_return_output,
 BIN_OP_EQ_uxn_c_l214_c7_6deb_return_output,
 color1_MUX_uxn_c_l214_c3_9657_return_output,
 color0_MUX_uxn_c_l214_c3_9657_return_output,
 color2_MUX_uxn_c_l214_c3_9657_return_output,
 color3_MUX_uxn_c_l214_c3_9657_return_output,
 tmp12_MUX_uxn_c_l214_c3_9657_return_output,
 CONST_SL_8_uxn_c_l216_c4_d5f8_return_output,
 BIN_OP_AND_uxn_c_l217_c4_c421_return_output,
 BIN_OP_OR_uxn_c_l218_c4_84eb_return_output,
 CONST_SL_8_uxn_c_l221_c4_402e_return_output,
 BIN_OP_AND_uxn_c_l222_c4_3be7_return_output,
 BIN_OP_OR_uxn_c_l223_c4_b048_return_output,
 BIN_OP_EQ_uxn_c_l225_c12_dfc6_return_output,
 color1_MUX_uxn_c_l225_c8_ee75_return_output,
 color0_MUX_uxn_c_l225_c8_ee75_return_output,
 color2_MUX_uxn_c_l225_c8_ee75_return_output,
 color3_MUX_uxn_c_l225_c8_ee75_return_output,
 tmp12_MUX_uxn_c_l225_c8_ee75_return_output,
 CONST_SL_8_uxn_c_l227_c4_46ae_return_output,
 BIN_OP_AND_uxn_c_l228_c4_2542_return_output,
 BIN_OP_OR_uxn_c_l229_c4_8edc_return_output,
 CONST_SL_8_uxn_c_l232_c4_754a_return_output,
 BIN_OP_AND_uxn_c_l233_c4_e9aa_return_output,
 BIN_OP_OR_uxn_c_l234_c4_2a40_return_output,
 BIN_OP_EQ_uxn_c_l236_c12_a8b6_return_output,
 color1_MUX_uxn_c_l236_c8_881b_return_output,
 color0_MUX_uxn_c_l236_c8_881b_return_output,
 color2_MUX_uxn_c_l236_c8_881b_return_output,
 color3_MUX_uxn_c_l236_c8_881b_return_output,
 tmp12_MUX_uxn_c_l236_c8_881b_return_output,
 CONST_SL_4_uxn_c_l238_c4_ca33_return_output,
 BIN_OP_AND_uxn_c_l239_c4_dbd8_return_output,
 BIN_OP_OR_uxn_c_l240_c4_13d5_return_output,
 CONST_SL_4_uxn_c_l243_c4_2ac7_return_output,
 BIN_OP_AND_uxn_c_l244_c4_fd42_return_output,
 BIN_OP_OR_uxn_c_l245_c4_38d3_return_output,
 BIN_OP_EQ_uxn_c_l247_c12_ef26_return_output,
 color1_MUX_uxn_c_l247_c8_62db_return_output,
 color0_MUX_uxn_c_l247_c8_62db_return_output,
 color2_MUX_uxn_c_l247_c8_62db_return_output,
 color3_MUX_uxn_c_l247_c8_62db_return_output,
 tmp12_MUX_uxn_c_l247_c8_62db_return_output,
 CONST_SL_4_uxn_c_l249_c4_4276_return_output,
 BIN_OP_AND_uxn_c_l250_c4_4b2c_return_output,
 BIN_OP_OR_uxn_c_l251_c4_a0c4_return_output,
 CONST_SL_4_uxn_c_l254_c4_07aa_return_output,
 BIN_OP_AND_uxn_c_l255_c4_b75b_return_output,
 BIN_OP_OR_uxn_c_l256_c4_2f1a_return_output,
 BIN_OP_EQ_uxn_c_l258_c12_765e_return_output,
 color1_MUX_uxn_c_l258_c8_6771_return_output,
 color0_MUX_uxn_c_l258_c8_6771_return_output,
 color2_MUX_uxn_c_l258_c8_6771_return_output,
 color3_MUX_uxn_c_l258_c8_6771_return_output,
 tmp12_MUX_uxn_c_l258_c8_6771_return_output,
 BIN_OP_AND_uxn_c_l260_c4_5423_return_output,
 BIN_OP_OR_uxn_c_l261_c4_c180_return_output,
 BIN_OP_AND_uxn_c_l264_c4_4ed8_return_output,
 BIN_OP_OR_uxn_c_l265_c4_ef66_return_output,
 BIN_OP_EQ_uxn_c_l267_c12_6d62_return_output,
 color2_MUX_uxn_c_l267_c8_15e0_return_output,
 color3_MUX_uxn_c_l267_c8_15e0_return_output,
 tmp12_MUX_uxn_c_l267_c8_15e0_return_output,
 BIN_OP_AND_uxn_c_l269_c4_a19d_return_output,
 BIN_OP_OR_uxn_c_l270_c4_dbf2_return_output,
 BIN_OP_AND_uxn_c_l273_c4_3426_return_output,
 BIN_OP_OR_uxn_c_l274_c4_41c1_return_output,
 BIN_OP_EQ_uxn_c_l278_c6_5f0d_return_output,
 result_MUX_uxn_c_l278_c2_b186_return_output,
 BIN_OP_EQ_uxn_c_l280_c13_0e05_return_output,
 result_MUX_uxn_c_l280_c9_c97e_return_output,
 BIN_OP_EQ_uxn_c_l282_c13_d660_return_output,
 result_MUX_uxn_c_l282_c9_09d3_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_device_ram_address : unsigned(7 downto 0);
 variable VAR_device_ram_value : unsigned(7 downto 0);
 variable VAR_is_device_ram_write : unsigned(0 downto 0);
 variable VAR_gpu_step_color : unsigned(1 downto 0);
 variable VAR_color_cmp_1_MUX_uxn_c_l211_c2_5060_iftrue : unsigned(3 downto 0);
 variable VAR_color_cmp_1_uxn_c_l213_c3_e75e : unsigned(3 downto 0);
 variable VAR_color_cmp_1_MUX_uxn_c_l211_c2_5060_iffalse : unsigned(3 downto 0);
 variable VAR_color_cmp_1_MUX_uxn_c_l211_c2_5060_return_output : unsigned(3 downto 0);
 variable VAR_color_cmp_1_MUX_uxn_c_l211_c2_5060_cond : unsigned(0 downto 0);
 variable VAR_color_cmp_0_MUX_uxn_c_l211_c2_5060_iftrue : unsigned(3 downto 0);
 variable VAR_color_cmp_0_uxn_c_l212_c3_089d : unsigned(3 downto 0);
 variable VAR_color_cmp_0_MUX_uxn_c_l211_c2_5060_iffalse : unsigned(3 downto 0);
 variable VAR_color_cmp_0_MUX_uxn_c_l211_c2_5060_return_output : unsigned(3 downto 0);
 variable VAR_color_cmp_0_MUX_uxn_c_l211_c2_5060_cond : unsigned(0 downto 0);
 variable VAR_color1_MUX_uxn_c_l211_c2_5060_iftrue : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l214_c3_9657_return_output : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l211_c2_5060_iffalse : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l211_c2_5060_return_output : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l211_c2_5060_cond : unsigned(0 downto 0);
 variable VAR_color0_MUX_uxn_c_l211_c2_5060_iftrue : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l214_c3_9657_return_output : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l211_c2_5060_iffalse : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l211_c2_5060_return_output : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l211_c2_5060_cond : unsigned(0 downto 0);
 variable VAR_color2_MUX_uxn_c_l211_c2_5060_iftrue : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l214_c3_9657_return_output : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l211_c2_5060_iffalse : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l211_c2_5060_return_output : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l211_c2_5060_cond : unsigned(0 downto 0);
 variable VAR_color3_MUX_uxn_c_l211_c2_5060_iftrue : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l214_c3_9657_return_output : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l211_c2_5060_iffalse : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l211_c2_5060_return_output : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l211_c2_5060_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l211_c2_5060_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l214_c3_9657_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l211_c2_5060_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l211_c2_5060_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l211_c2_5060_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_4_uxn_c_l212_c27_5bd5_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_c_l212_c27_5bd5_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_c_l212_c17_4050_return_output : unsigned(3 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_c_l213_c17_083a_return_output : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l214_c7_6deb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l214_c7_6deb_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l214_c7_6deb_return_output : unsigned(0 downto 0);
 variable VAR_color1_MUX_uxn_c_l214_c3_9657_iftrue : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l214_c3_9657_iffalse : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l225_c8_ee75_return_output : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l214_c3_9657_cond : unsigned(0 downto 0);
 variable VAR_color0_MUX_uxn_c_l214_c3_9657_iftrue : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l214_c3_9657_iffalse : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l225_c8_ee75_return_output : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l214_c3_9657_cond : unsigned(0 downto 0);
 variable VAR_color2_MUX_uxn_c_l214_c3_9657_iftrue : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l214_c3_9657_iffalse : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l225_c8_ee75_return_output : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l214_c3_9657_cond : unsigned(0 downto 0);
 variable VAR_color3_MUX_uxn_c_l214_c3_9657_iftrue : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l214_c3_9657_iffalse : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l225_c8_ee75_return_output : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l214_c3_9657_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l214_c3_9657_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l214_c3_9657_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l225_c8_ee75_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l214_c3_9657_cond : unsigned(0 downto 0);
 variable VAR_tmp12_uxn_c_l215_c4_cbe7 : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l216_c4_d5f8_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l216_c4_d5f8_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l217_c4_c421_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l217_c4_c421_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l217_c4_c421_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l218_c4_84eb_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l218_c4_84eb_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l218_c4_84eb_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_uxn_c_l220_c4_80ed : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l221_c4_402e_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l221_c4_402e_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l222_c4_3be7_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l222_c4_3be7_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l222_c4_3be7_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l223_c4_b048_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l223_c4_b048_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l223_c4_b048_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l225_c12_dfc6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l225_c12_dfc6_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l225_c12_dfc6_return_output : unsigned(0 downto 0);
 variable VAR_color1_MUX_uxn_c_l225_c8_ee75_iftrue : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l225_c8_ee75_iffalse : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l236_c8_881b_return_output : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l225_c8_ee75_cond : unsigned(0 downto 0);
 variable VAR_color0_MUX_uxn_c_l225_c8_ee75_iftrue : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l225_c8_ee75_iffalse : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l236_c8_881b_return_output : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l225_c8_ee75_cond : unsigned(0 downto 0);
 variable VAR_color2_MUX_uxn_c_l225_c8_ee75_iftrue : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l225_c8_ee75_iffalse : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l236_c8_881b_return_output : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l225_c8_ee75_cond : unsigned(0 downto 0);
 variable VAR_color3_MUX_uxn_c_l225_c8_ee75_iftrue : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l225_c8_ee75_iffalse : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l236_c8_881b_return_output : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l225_c8_ee75_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l225_c8_ee75_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l225_c8_ee75_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l236_c8_881b_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l225_c8_ee75_cond : unsigned(0 downto 0);
 variable VAR_tmp12_uxn_c_l226_c4_8bbc : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l227_c4_46ae_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l227_c4_46ae_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l228_c4_2542_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l228_c4_2542_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l228_c4_2542_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l229_c4_8edc_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l229_c4_8edc_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l229_c4_8edc_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_uxn_c_l231_c4_4c40 : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l232_c4_754a_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l232_c4_754a_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l233_c4_e9aa_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l233_c4_e9aa_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l233_c4_e9aa_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l234_c4_2a40_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l234_c4_2a40_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l234_c4_2a40_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l236_c12_a8b6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l236_c12_a8b6_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l236_c12_a8b6_return_output : unsigned(0 downto 0);
 variable VAR_color1_MUX_uxn_c_l236_c8_881b_iftrue : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l236_c8_881b_iffalse : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l247_c8_62db_return_output : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l236_c8_881b_cond : unsigned(0 downto 0);
 variable VAR_color0_MUX_uxn_c_l236_c8_881b_iftrue : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l236_c8_881b_iffalse : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l247_c8_62db_return_output : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l236_c8_881b_cond : unsigned(0 downto 0);
 variable VAR_color2_MUX_uxn_c_l236_c8_881b_iftrue : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l236_c8_881b_iffalse : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l247_c8_62db_return_output : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l236_c8_881b_cond : unsigned(0 downto 0);
 variable VAR_color3_MUX_uxn_c_l236_c8_881b_iftrue : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l236_c8_881b_iffalse : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l247_c8_62db_return_output : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l236_c8_881b_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l236_c8_881b_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l236_c8_881b_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l247_c8_62db_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l236_c8_881b_cond : unsigned(0 downto 0);
 variable VAR_tmp12_uxn_c_l237_c4_2f7c : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l238_c4_ca33_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l238_c4_ca33_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l239_c4_dbd8_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l239_c4_dbd8_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l239_c4_dbd8_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l240_c4_13d5_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l240_c4_13d5_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l240_c4_13d5_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_uxn_c_l242_c4_c595 : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l243_c4_2ac7_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l243_c4_2ac7_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l244_c4_fd42_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l244_c4_fd42_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l244_c4_fd42_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l245_c4_38d3_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l245_c4_38d3_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l245_c4_38d3_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l247_c12_ef26_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l247_c12_ef26_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l247_c12_ef26_return_output : unsigned(0 downto 0);
 variable VAR_color1_MUX_uxn_c_l247_c8_62db_iftrue : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l247_c8_62db_iffalse : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l258_c8_6771_return_output : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l247_c8_62db_cond : unsigned(0 downto 0);
 variable VAR_color0_MUX_uxn_c_l247_c8_62db_iftrue : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l247_c8_62db_iffalse : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l258_c8_6771_return_output : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l247_c8_62db_cond : unsigned(0 downto 0);
 variable VAR_color2_MUX_uxn_c_l247_c8_62db_iftrue : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l247_c8_62db_iffalse : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l258_c8_6771_return_output : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l247_c8_62db_cond : unsigned(0 downto 0);
 variable VAR_color3_MUX_uxn_c_l247_c8_62db_iftrue : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l247_c8_62db_iffalse : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l258_c8_6771_return_output : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l247_c8_62db_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l247_c8_62db_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l247_c8_62db_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l258_c8_6771_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l247_c8_62db_cond : unsigned(0 downto 0);
 variable VAR_tmp12_uxn_c_l248_c4_0d67 : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l249_c4_4276_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l249_c4_4276_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l250_c4_4b2c_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l250_c4_4b2c_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l250_c4_4b2c_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l251_c4_a0c4_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l251_c4_a0c4_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l251_c4_a0c4_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_uxn_c_l253_c4_7a09 : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l254_c4_07aa_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l254_c4_07aa_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l255_c4_b75b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l255_c4_b75b_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l255_c4_b75b_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l256_c4_2f1a_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l256_c4_2f1a_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l256_c4_2f1a_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l258_c12_765e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l258_c12_765e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l258_c12_765e_return_output : unsigned(0 downto 0);
 variable VAR_color1_MUX_uxn_c_l258_c8_6771_iftrue : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l258_c8_6771_iffalse : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l258_c8_6771_cond : unsigned(0 downto 0);
 variable VAR_color0_MUX_uxn_c_l258_c8_6771_iftrue : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l258_c8_6771_iffalse : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l258_c8_6771_cond : unsigned(0 downto 0);
 variable VAR_color2_MUX_uxn_c_l258_c8_6771_iftrue : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l258_c8_6771_iffalse : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l267_c8_15e0_return_output : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l258_c8_6771_cond : unsigned(0 downto 0);
 variable VAR_color3_MUX_uxn_c_l258_c8_6771_iftrue : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l258_c8_6771_iffalse : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l267_c8_15e0_return_output : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l258_c8_6771_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l258_c8_6771_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l258_c8_6771_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l267_c8_15e0_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l258_c8_6771_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l260_c4_5423_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l260_c4_5423_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l260_c4_5423_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l261_c4_c180_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l261_c4_c180_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l261_c4_c180_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l264_c4_4ed8_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l264_c4_4ed8_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l264_c4_4ed8_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l265_c4_ef66_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l265_c4_ef66_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l265_c4_ef66_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l267_c12_6d62_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l267_c12_6d62_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l267_c12_6d62_return_output : unsigned(0 downto 0);
 variable VAR_color2_MUX_uxn_c_l267_c8_15e0_iftrue : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l267_c8_15e0_iffalse : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l267_c8_15e0_cond : unsigned(0 downto 0);
 variable VAR_color3_MUX_uxn_c_l267_c8_15e0_iftrue : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l267_c8_15e0_iffalse : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l267_c8_15e0_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l267_c8_15e0_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l267_c8_15e0_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l267_c8_15e0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l269_c4_a19d_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l269_c4_a19d_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l269_c4_a19d_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l270_c4_dbf2_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l270_c4_dbf2_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l270_c4_dbf2_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l273_c4_3426_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l273_c4_3426_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l273_c4_3426_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l274_c4_41c1_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l274_c4_41c1_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l274_c4_41c1_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l278_c6_5f0d_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l278_c6_5f0d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l278_c6_5f0d_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_c_l278_c2_b186_iftrue : unsigned(15 downto 0);
 variable VAR_result_uxn_c_l279_c3_07c9 : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l278_c2_b186_iffalse : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l280_c9_c97e_return_output : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l278_c2_b186_return_output : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l278_c2_b186_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l280_c13_0e05_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l280_c13_0e05_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l280_c13_0e05_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_c_l280_c9_c97e_iftrue : unsigned(15 downto 0);
 variable VAR_result_uxn_c_l281_c3_26ee : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l280_c9_c97e_iffalse : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l282_c9_09d3_return_output : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l280_c9_c97e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l282_c13_d660_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l282_c13_d660_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l282_c13_d660_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_c_l282_c9_09d3_iftrue : unsigned(15 downto 0);
 variable VAR_result_uxn_c_l283_c3_b694 : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l282_c9_09d3_iffalse : unsigned(15 downto 0);
 variable VAR_result_uxn_c_l285_c3_ce38 : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l282_c9_09d3_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l259_l268_DUPLICATE_c0c3_return_output : unsigned(11 downto 0);
 variable VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l263_l272_DUPLICATE_0de8_return_output : unsigned(11 downto 0);
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
     VAR_BIN_OP_AND_uxn_c_l239_c4_dbd8_right := to_unsigned(3855, 12);
     VAR_BIN_OP_AND_uxn_c_l222_c4_3be7_right := to_unsigned(255, 8);
     VAR_BIN_OP_AND_uxn_c_l255_c4_b75b_right := to_unsigned(3855, 12);
     VAR_BIN_OP_AND_uxn_c_l228_c4_2542_right := to_unsigned(255, 8);
     VAR_BIN_OP_EQ_uxn_c_l267_c12_6d62_right := to_unsigned(13, 4);
     VAR_BIN_OP_EQ_uxn_c_l225_c12_dfc6_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_c_l280_c13_0e05_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l282_c13_d660_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_c_l236_c12_a8b6_right := to_unsigned(10, 4);
     VAR_BIN_OP_AND_uxn_c_l217_c4_c421_right := to_unsigned(255, 8);
     VAR_BIN_OP_AND_uxn_c_l269_c4_a19d_right := to_unsigned(4080, 12);
     VAR_BIN_OP_AND_uxn_c_l273_c4_3426_right := to_unsigned(4080, 12);
     VAR_BIN_OP_EQ_uxn_c_l258_c12_765e_right := to_unsigned(12, 4);
     VAR_BIN_OP_EQ_uxn_c_l214_c7_6deb_right := to_unsigned(8, 4);
     VAR_BIN_OP_AND_uxn_c_l244_c4_fd42_right := to_unsigned(3855, 12);
     VAR_BIN_OP_AND_uxn_c_l233_c4_e9aa_right := to_unsigned(255, 8);
     VAR_BIN_OP_EQ_uxn_c_l278_c6_5f0d_right := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_c_l260_c4_5423_right := to_unsigned(4080, 12);
     VAR_BIN_OP_EQ_uxn_c_l247_c12_ef26_right := to_unsigned(11, 4);
     VAR_BIN_OP_AND_uxn_c_l264_c4_4ed8_right := to_unsigned(4080, 12);
     VAR_BIN_OP_AND_uxn_c_l250_c4_4b2c_right := to_unsigned(3855, 12);

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
     VAR_BIN_OP_AND_uxn_c_l217_c4_c421_left := color0;
     VAR_BIN_OP_AND_uxn_c_l239_c4_dbd8_left := color0;
     VAR_BIN_OP_AND_uxn_c_l260_c4_5423_left := color0;
     VAR_color0_MUX_uxn_c_l211_c2_5060_iffalse := color0;
     VAR_color0_MUX_uxn_c_l225_c8_ee75_iftrue := color0;
     VAR_color0_MUX_uxn_c_l247_c8_62db_iftrue := color0;
     VAR_color0_MUX_uxn_c_l258_c8_6771_iffalse := color0;
     VAR_BIN_OP_AND_uxn_c_l222_c4_3be7_left := color1;
     VAR_BIN_OP_AND_uxn_c_l244_c4_fd42_left := color1;
     VAR_BIN_OP_AND_uxn_c_l264_c4_4ed8_left := color1;
     VAR_color1_MUX_uxn_c_l211_c2_5060_iffalse := color1;
     VAR_color1_MUX_uxn_c_l225_c8_ee75_iftrue := color1;
     VAR_color1_MUX_uxn_c_l247_c8_62db_iftrue := color1;
     VAR_color1_MUX_uxn_c_l258_c8_6771_iffalse := color1;
     VAR_BIN_OP_AND_uxn_c_l228_c4_2542_left := color2;
     VAR_BIN_OP_AND_uxn_c_l250_c4_4b2c_left := color2;
     VAR_BIN_OP_AND_uxn_c_l269_c4_a19d_left := color2;
     VAR_color2_MUX_uxn_c_l211_c2_5060_iffalse := color2;
     VAR_color2_MUX_uxn_c_l214_c3_9657_iftrue := color2;
     VAR_color2_MUX_uxn_c_l236_c8_881b_iftrue := color2;
     VAR_color2_MUX_uxn_c_l258_c8_6771_iftrue := color2;
     VAR_color2_MUX_uxn_c_l267_c8_15e0_iffalse := color2;
     VAR_BIN_OP_AND_uxn_c_l233_c4_e9aa_left := color3;
     VAR_BIN_OP_AND_uxn_c_l255_c4_b75b_left := color3;
     VAR_BIN_OP_AND_uxn_c_l273_c4_3426_left := color3;
     VAR_color3_MUX_uxn_c_l211_c2_5060_iffalse := color3;
     VAR_color3_MUX_uxn_c_l214_c3_9657_iftrue := color3;
     VAR_color3_MUX_uxn_c_l236_c8_881b_iftrue := color3;
     VAR_color3_MUX_uxn_c_l258_c8_6771_iftrue := color3;
     VAR_color3_MUX_uxn_c_l267_c8_15e0_iffalse := color3;
     VAR_color_cmp_0_MUX_uxn_c_l211_c2_5060_iffalse := color_cmp_0;
     VAR_color_cmp_1_MUX_uxn_c_l211_c2_5060_iffalse := color_cmp_1;
     VAR_BIN_OP_EQ_uxn_c_l214_c7_6deb_left := VAR_device_ram_address;
     VAR_BIN_OP_EQ_uxn_c_l225_c12_dfc6_left := VAR_device_ram_address;
     VAR_BIN_OP_EQ_uxn_c_l236_c12_a8b6_left := VAR_device_ram_address;
     VAR_BIN_OP_EQ_uxn_c_l247_c12_ef26_left := VAR_device_ram_address;
     VAR_BIN_OP_EQ_uxn_c_l258_c12_765e_left := VAR_device_ram_address;
     VAR_BIN_OP_EQ_uxn_c_l267_c12_6d62_left := VAR_device_ram_address;
     VAR_CONST_SR_4_uxn_c_l212_c27_5bd5_x := VAR_device_ram_value;
     VAR_BIN_OP_EQ_uxn_c_l278_c6_5f0d_left := VAR_gpu_step_color;
     VAR_BIN_OP_EQ_uxn_c_l280_c13_0e05_left := VAR_gpu_step_color;
     VAR_BIN_OP_EQ_uxn_c_l282_c13_d660_left := VAR_gpu_step_color;
     VAR_color0_MUX_uxn_c_l211_c2_5060_cond := VAR_is_device_ram_write;
     VAR_color1_MUX_uxn_c_l211_c2_5060_cond := VAR_is_device_ram_write;
     VAR_color2_MUX_uxn_c_l211_c2_5060_cond := VAR_is_device_ram_write;
     VAR_color3_MUX_uxn_c_l211_c2_5060_cond := VAR_is_device_ram_write;
     VAR_color_cmp_0_MUX_uxn_c_l211_c2_5060_cond := VAR_is_device_ram_write;
     VAR_color_cmp_1_MUX_uxn_c_l211_c2_5060_cond := VAR_is_device_ram_write;
     VAR_tmp12_MUX_uxn_c_l211_c2_5060_cond := VAR_is_device_ram_write;
     VAR_tmp12_MUX_uxn_c_l211_c2_5060_iffalse := tmp12;
     VAR_tmp12_MUX_uxn_c_l267_c8_15e0_iffalse := tmp12;
     -- BIN_OP_AND[uxn_c_l250_c4_4b2c] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l250_c4_4b2c_left <= VAR_BIN_OP_AND_uxn_c_l250_c4_4b2c_left;
     BIN_OP_AND_uxn_c_l250_c4_4b2c_right <= VAR_BIN_OP_AND_uxn_c_l250_c4_4b2c_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l250_c4_4b2c_return_output := BIN_OP_AND_uxn_c_l250_c4_4b2c_return_output;

     -- BIN_OP_EQ[uxn_c_l280_c13_0e05] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l280_c13_0e05_left <= VAR_BIN_OP_EQ_uxn_c_l280_c13_0e05_left;
     BIN_OP_EQ_uxn_c_l280_c13_0e05_right <= VAR_BIN_OP_EQ_uxn_c_l280_c13_0e05_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l280_c13_0e05_return_output := BIN_OP_EQ_uxn_c_l280_c13_0e05_return_output;

     -- BIN_OP_EQ[uxn_c_l236_c12_a8b6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l236_c12_a8b6_left <= VAR_BIN_OP_EQ_uxn_c_l236_c12_a8b6_left;
     BIN_OP_EQ_uxn_c_l236_c12_a8b6_right <= VAR_BIN_OP_EQ_uxn_c_l236_c12_a8b6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l236_c12_a8b6_return_output := BIN_OP_EQ_uxn_c_l236_c12_a8b6_return_output;

     -- BIN_OP_AND[uxn_c_l264_c4_4ed8] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l264_c4_4ed8_left <= VAR_BIN_OP_AND_uxn_c_l264_c4_4ed8_left;
     BIN_OP_AND_uxn_c_l264_c4_4ed8_right <= VAR_BIN_OP_AND_uxn_c_l264_c4_4ed8_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l264_c4_4ed8_return_output := BIN_OP_AND_uxn_c_l264_c4_4ed8_return_output;

     -- BIN_OP_AND[uxn_c_l244_c4_fd42] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l244_c4_fd42_left <= VAR_BIN_OP_AND_uxn_c_l244_c4_fd42_left;
     BIN_OP_AND_uxn_c_l244_c4_fd42_right <= VAR_BIN_OP_AND_uxn_c_l244_c4_fd42_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l244_c4_fd42_return_output := BIN_OP_AND_uxn_c_l244_c4_fd42_return_output;

     -- BIN_OP_AND[uxn_c_l239_c4_dbd8] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l239_c4_dbd8_left <= VAR_BIN_OP_AND_uxn_c_l239_c4_dbd8_left;
     BIN_OP_AND_uxn_c_l239_c4_dbd8_right <= VAR_BIN_OP_AND_uxn_c_l239_c4_dbd8_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l239_c4_dbd8_return_output := BIN_OP_AND_uxn_c_l239_c4_dbd8_return_output;

     -- BIN_OP_EQ[uxn_c_l258_c12_765e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l258_c12_765e_left <= VAR_BIN_OP_EQ_uxn_c_l258_c12_765e_left;
     BIN_OP_EQ_uxn_c_l258_c12_765e_right <= VAR_BIN_OP_EQ_uxn_c_l258_c12_765e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l258_c12_765e_return_output := BIN_OP_EQ_uxn_c_l258_c12_765e_return_output;

     -- BIN_OP_EQ[uxn_c_l278_c6_5f0d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l278_c6_5f0d_left <= VAR_BIN_OP_EQ_uxn_c_l278_c6_5f0d_left;
     BIN_OP_EQ_uxn_c_l278_c6_5f0d_right <= VAR_BIN_OP_EQ_uxn_c_l278_c6_5f0d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l278_c6_5f0d_return_output := BIN_OP_EQ_uxn_c_l278_c6_5f0d_return_output;

     -- BIN_OP_EQ[uxn_c_l267_c12_6d62] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l267_c12_6d62_left <= VAR_BIN_OP_EQ_uxn_c_l267_c12_6d62_left;
     BIN_OP_EQ_uxn_c_l267_c12_6d62_right <= VAR_BIN_OP_EQ_uxn_c_l267_c12_6d62_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l267_c12_6d62_return_output := BIN_OP_EQ_uxn_c_l267_c12_6d62_return_output;

     -- BIN_OP_EQ[uxn_c_l214_c7_6deb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l214_c7_6deb_left <= VAR_BIN_OP_EQ_uxn_c_l214_c7_6deb_left;
     BIN_OP_EQ_uxn_c_l214_c7_6deb_right <= VAR_BIN_OP_EQ_uxn_c_l214_c7_6deb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l214_c7_6deb_return_output := BIN_OP_EQ_uxn_c_l214_c7_6deb_return_output;

     -- BIN_OP_AND[uxn_c_l222_c4_3be7] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l222_c4_3be7_left <= VAR_BIN_OP_AND_uxn_c_l222_c4_3be7_left;
     BIN_OP_AND_uxn_c_l222_c4_3be7_right <= VAR_BIN_OP_AND_uxn_c_l222_c4_3be7_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l222_c4_3be7_return_output := BIN_OP_AND_uxn_c_l222_c4_3be7_return_output;

     -- BIN_OP_AND[uxn_c_l273_c4_3426] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l273_c4_3426_left <= VAR_BIN_OP_AND_uxn_c_l273_c4_3426_left;
     BIN_OP_AND_uxn_c_l273_c4_3426_right <= VAR_BIN_OP_AND_uxn_c_l273_c4_3426_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l273_c4_3426_return_output := BIN_OP_AND_uxn_c_l273_c4_3426_return_output;

     -- BIN_OP_EQ[uxn_c_l225_c12_dfc6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l225_c12_dfc6_left <= VAR_BIN_OP_EQ_uxn_c_l225_c12_dfc6_left;
     BIN_OP_EQ_uxn_c_l225_c12_dfc6_right <= VAR_BIN_OP_EQ_uxn_c_l225_c12_dfc6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l225_c12_dfc6_return_output := BIN_OP_EQ_uxn_c_l225_c12_dfc6_return_output;

     -- BIN_OP_EQ[uxn_c_l247_c12_ef26] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l247_c12_ef26_left <= VAR_BIN_OP_EQ_uxn_c_l247_c12_ef26_left;
     BIN_OP_EQ_uxn_c_l247_c12_ef26_right <= VAR_BIN_OP_EQ_uxn_c_l247_c12_ef26_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l247_c12_ef26_return_output := BIN_OP_EQ_uxn_c_l247_c12_ef26_return_output;

     -- BIN_OP_AND[uxn_c_l260_c4_5423] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l260_c4_5423_left <= VAR_BIN_OP_AND_uxn_c_l260_c4_5423_left;
     BIN_OP_AND_uxn_c_l260_c4_5423_right <= VAR_BIN_OP_AND_uxn_c_l260_c4_5423_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l260_c4_5423_return_output := BIN_OP_AND_uxn_c_l260_c4_5423_return_output;

     -- BIN_OP_AND[uxn_c_l269_c4_a19d] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l269_c4_a19d_left <= VAR_BIN_OP_AND_uxn_c_l269_c4_a19d_left;
     BIN_OP_AND_uxn_c_l269_c4_a19d_right <= VAR_BIN_OP_AND_uxn_c_l269_c4_a19d_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l269_c4_a19d_return_output := BIN_OP_AND_uxn_c_l269_c4_a19d_return_output;

     -- BIN_OP_EQ[uxn_c_l282_c13_d660] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l282_c13_d660_left <= VAR_BIN_OP_EQ_uxn_c_l282_c13_d660_left;
     BIN_OP_EQ_uxn_c_l282_c13_d660_right <= VAR_BIN_OP_EQ_uxn_c_l282_c13_d660_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l282_c13_d660_return_output := BIN_OP_EQ_uxn_c_l282_c13_d660_return_output;

     -- CAST_TO_uint4_t[uxn_c_l213_c17_083a] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_c_l213_c17_083a_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_device_ram_value);

     -- BIN_OP_AND[uxn_c_l255_c4_b75b] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l255_c4_b75b_left <= VAR_BIN_OP_AND_uxn_c_l255_c4_b75b_left;
     BIN_OP_AND_uxn_c_l255_c4_b75b_right <= VAR_BIN_OP_AND_uxn_c_l255_c4_b75b_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l255_c4_b75b_return_output := BIN_OP_AND_uxn_c_l255_c4_b75b_return_output;

     -- BIN_OP_AND[uxn_c_l228_c4_2542] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l228_c4_2542_left <= VAR_BIN_OP_AND_uxn_c_l228_c4_2542_left;
     BIN_OP_AND_uxn_c_l228_c4_2542_right <= VAR_BIN_OP_AND_uxn_c_l228_c4_2542_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l228_c4_2542_return_output := BIN_OP_AND_uxn_c_l228_c4_2542_return_output;

     -- CONST_SR_4[uxn_c_l212_c27_5bd5] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_c_l212_c27_5bd5_x <= VAR_CONST_SR_4_uxn_c_l212_c27_5bd5_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_c_l212_c27_5bd5_return_output := CONST_SR_4_uxn_c_l212_c27_5bd5_return_output;

     -- BIN_OP_AND[uxn_c_l233_c4_e9aa] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l233_c4_e9aa_left <= VAR_BIN_OP_AND_uxn_c_l233_c4_e9aa_left;
     BIN_OP_AND_uxn_c_l233_c4_e9aa_right <= VAR_BIN_OP_AND_uxn_c_l233_c4_e9aa_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l233_c4_e9aa_return_output := BIN_OP_AND_uxn_c_l233_c4_e9aa_return_output;

     -- BIN_OP_AND[uxn_c_l217_c4_c421] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l217_c4_c421_left <= VAR_BIN_OP_AND_uxn_c_l217_c4_c421_left;
     BIN_OP_AND_uxn_c_l217_c4_c421_right <= VAR_BIN_OP_AND_uxn_c_l217_c4_c421_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l217_c4_c421_return_output := BIN_OP_AND_uxn_c_l217_c4_c421_return_output;

     -- Submodule level 1
     VAR_BIN_OP_OR_uxn_c_l218_c4_84eb_left := VAR_BIN_OP_AND_uxn_c_l217_c4_c421_return_output;
     VAR_BIN_OP_OR_uxn_c_l223_c4_b048_left := VAR_BIN_OP_AND_uxn_c_l222_c4_3be7_return_output;
     VAR_BIN_OP_OR_uxn_c_l229_c4_8edc_left := VAR_BIN_OP_AND_uxn_c_l228_c4_2542_return_output;
     VAR_BIN_OP_OR_uxn_c_l234_c4_2a40_left := VAR_BIN_OP_AND_uxn_c_l233_c4_e9aa_return_output;
     VAR_BIN_OP_OR_uxn_c_l240_c4_13d5_left := VAR_BIN_OP_AND_uxn_c_l239_c4_dbd8_return_output;
     VAR_BIN_OP_OR_uxn_c_l245_c4_38d3_left := VAR_BIN_OP_AND_uxn_c_l244_c4_fd42_return_output;
     VAR_BIN_OP_OR_uxn_c_l251_c4_a0c4_left := VAR_BIN_OP_AND_uxn_c_l250_c4_4b2c_return_output;
     VAR_BIN_OP_OR_uxn_c_l256_c4_2f1a_left := VAR_BIN_OP_AND_uxn_c_l255_c4_b75b_return_output;
     VAR_BIN_OP_OR_uxn_c_l261_c4_c180_left := VAR_BIN_OP_AND_uxn_c_l260_c4_5423_return_output;
     VAR_BIN_OP_OR_uxn_c_l265_c4_ef66_left := VAR_BIN_OP_AND_uxn_c_l264_c4_4ed8_return_output;
     VAR_BIN_OP_OR_uxn_c_l270_c4_dbf2_left := VAR_BIN_OP_AND_uxn_c_l269_c4_a19d_return_output;
     VAR_BIN_OP_OR_uxn_c_l274_c4_41c1_left := VAR_BIN_OP_AND_uxn_c_l273_c4_3426_return_output;
     VAR_color0_MUX_uxn_c_l214_c3_9657_cond := VAR_BIN_OP_EQ_uxn_c_l214_c7_6deb_return_output;
     VAR_color1_MUX_uxn_c_l214_c3_9657_cond := VAR_BIN_OP_EQ_uxn_c_l214_c7_6deb_return_output;
     VAR_color2_MUX_uxn_c_l214_c3_9657_cond := VAR_BIN_OP_EQ_uxn_c_l214_c7_6deb_return_output;
     VAR_color3_MUX_uxn_c_l214_c3_9657_cond := VAR_BIN_OP_EQ_uxn_c_l214_c7_6deb_return_output;
     VAR_tmp12_MUX_uxn_c_l214_c3_9657_cond := VAR_BIN_OP_EQ_uxn_c_l214_c7_6deb_return_output;
     VAR_color0_MUX_uxn_c_l225_c8_ee75_cond := VAR_BIN_OP_EQ_uxn_c_l225_c12_dfc6_return_output;
     VAR_color1_MUX_uxn_c_l225_c8_ee75_cond := VAR_BIN_OP_EQ_uxn_c_l225_c12_dfc6_return_output;
     VAR_color2_MUX_uxn_c_l225_c8_ee75_cond := VAR_BIN_OP_EQ_uxn_c_l225_c12_dfc6_return_output;
     VAR_color3_MUX_uxn_c_l225_c8_ee75_cond := VAR_BIN_OP_EQ_uxn_c_l225_c12_dfc6_return_output;
     VAR_tmp12_MUX_uxn_c_l225_c8_ee75_cond := VAR_BIN_OP_EQ_uxn_c_l225_c12_dfc6_return_output;
     VAR_color0_MUX_uxn_c_l236_c8_881b_cond := VAR_BIN_OP_EQ_uxn_c_l236_c12_a8b6_return_output;
     VAR_color1_MUX_uxn_c_l236_c8_881b_cond := VAR_BIN_OP_EQ_uxn_c_l236_c12_a8b6_return_output;
     VAR_color2_MUX_uxn_c_l236_c8_881b_cond := VAR_BIN_OP_EQ_uxn_c_l236_c12_a8b6_return_output;
     VAR_color3_MUX_uxn_c_l236_c8_881b_cond := VAR_BIN_OP_EQ_uxn_c_l236_c12_a8b6_return_output;
     VAR_tmp12_MUX_uxn_c_l236_c8_881b_cond := VAR_BIN_OP_EQ_uxn_c_l236_c12_a8b6_return_output;
     VAR_color0_MUX_uxn_c_l247_c8_62db_cond := VAR_BIN_OP_EQ_uxn_c_l247_c12_ef26_return_output;
     VAR_color1_MUX_uxn_c_l247_c8_62db_cond := VAR_BIN_OP_EQ_uxn_c_l247_c12_ef26_return_output;
     VAR_color2_MUX_uxn_c_l247_c8_62db_cond := VAR_BIN_OP_EQ_uxn_c_l247_c12_ef26_return_output;
     VAR_color3_MUX_uxn_c_l247_c8_62db_cond := VAR_BIN_OP_EQ_uxn_c_l247_c12_ef26_return_output;
     VAR_tmp12_MUX_uxn_c_l247_c8_62db_cond := VAR_BIN_OP_EQ_uxn_c_l247_c12_ef26_return_output;
     VAR_color0_MUX_uxn_c_l258_c8_6771_cond := VAR_BIN_OP_EQ_uxn_c_l258_c12_765e_return_output;
     VAR_color1_MUX_uxn_c_l258_c8_6771_cond := VAR_BIN_OP_EQ_uxn_c_l258_c12_765e_return_output;
     VAR_color2_MUX_uxn_c_l258_c8_6771_cond := VAR_BIN_OP_EQ_uxn_c_l258_c12_765e_return_output;
     VAR_color3_MUX_uxn_c_l258_c8_6771_cond := VAR_BIN_OP_EQ_uxn_c_l258_c12_765e_return_output;
     VAR_tmp12_MUX_uxn_c_l258_c8_6771_cond := VAR_BIN_OP_EQ_uxn_c_l258_c12_765e_return_output;
     VAR_color2_MUX_uxn_c_l267_c8_15e0_cond := VAR_BIN_OP_EQ_uxn_c_l267_c12_6d62_return_output;
     VAR_color3_MUX_uxn_c_l267_c8_15e0_cond := VAR_BIN_OP_EQ_uxn_c_l267_c12_6d62_return_output;
     VAR_tmp12_MUX_uxn_c_l267_c8_15e0_cond := VAR_BIN_OP_EQ_uxn_c_l267_c12_6d62_return_output;
     VAR_result_MUX_uxn_c_l278_c2_b186_cond := VAR_BIN_OP_EQ_uxn_c_l278_c6_5f0d_return_output;
     VAR_result_MUX_uxn_c_l280_c9_c97e_cond := VAR_BIN_OP_EQ_uxn_c_l280_c13_0e05_return_output;
     VAR_result_MUX_uxn_c_l282_c9_09d3_cond := VAR_BIN_OP_EQ_uxn_c_l282_c13_d660_return_output;
     VAR_color_cmp_1_uxn_c_l213_c3_e75e := VAR_CAST_TO_uint4_t_uxn_c_l213_c17_083a_return_output;
     VAR_color_cmp_1_MUX_uxn_c_l211_c2_5060_iftrue := VAR_color_cmp_1_uxn_c_l213_c3_e75e;
     VAR_tmp12_uxn_c_l220_c4_80ed := resize(VAR_color_cmp_1_uxn_c_l213_c3_e75e, 12);
     VAR_tmp12_uxn_c_l231_c4_4c40 := resize(VAR_color_cmp_1_uxn_c_l213_c3_e75e, 12);
     VAR_tmp12_uxn_c_l242_c4_c595 := resize(VAR_color_cmp_1_uxn_c_l213_c3_e75e, 12);
     VAR_tmp12_uxn_c_l253_c4_7a09 := resize(VAR_color_cmp_1_uxn_c_l213_c3_e75e, 12);
     VAR_CONST_SL_8_uxn_c_l221_c4_402e_x := VAR_tmp12_uxn_c_l220_c4_80ed;
     VAR_CONST_SL_8_uxn_c_l232_c4_754a_x := VAR_tmp12_uxn_c_l231_c4_4c40;
     VAR_CONST_SL_4_uxn_c_l243_c4_2ac7_x := VAR_tmp12_uxn_c_l242_c4_c595;
     VAR_CONST_SL_4_uxn_c_l254_c4_07aa_x := VAR_tmp12_uxn_c_l253_c4_7a09;
     -- CONST_SL_4[uxn_c_l243_c4_2ac7] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_c_l243_c4_2ac7_x <= VAR_CONST_SL_4_uxn_c_l243_c4_2ac7_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_c_l243_c4_2ac7_return_output := CONST_SL_4_uxn_c_l243_c4_2ac7_return_output;

     -- CONST_SL_8[uxn_c_l232_c4_754a] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l232_c4_754a_x <= VAR_CONST_SL_8_uxn_c_l232_c4_754a_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l232_c4_754a_return_output := CONST_SL_8_uxn_c_l232_c4_754a_return_output;

     -- CONST_SL_4[uxn_c_l254_c4_07aa] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_c_l254_c4_07aa_x <= VAR_CONST_SL_4_uxn_c_l254_c4_07aa_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_c_l254_c4_07aa_return_output := CONST_SL_4_uxn_c_l254_c4_07aa_return_output;

     -- CONST_SL_8[uxn_c_l221_c4_402e] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l221_c4_402e_x <= VAR_CONST_SL_8_uxn_c_l221_c4_402e_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l221_c4_402e_return_output := CONST_SL_8_uxn_c_l221_c4_402e_return_output;

     -- color_cmp_1_MUX[uxn_c_l211_c2_5060] LATENCY=0
     -- Inputs
     color_cmp_1_MUX_uxn_c_l211_c2_5060_cond <= VAR_color_cmp_1_MUX_uxn_c_l211_c2_5060_cond;
     color_cmp_1_MUX_uxn_c_l211_c2_5060_iftrue <= VAR_color_cmp_1_MUX_uxn_c_l211_c2_5060_iftrue;
     color_cmp_1_MUX_uxn_c_l211_c2_5060_iffalse <= VAR_color_cmp_1_MUX_uxn_c_l211_c2_5060_iffalse;
     -- Outputs
     VAR_color_cmp_1_MUX_uxn_c_l211_c2_5060_return_output := color_cmp_1_MUX_uxn_c_l211_c2_5060_return_output;

     -- CAST_TO_uint12_t_uint4_t_uxn_c_l263_l272_DUPLICATE_0de8 LATENCY=0
     VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l263_l272_DUPLICATE_0de8_return_output := CAST_TO_uint12_t_uint4_t(
     VAR_color_cmp_1_uxn_c_l213_c3_e75e);

     -- CAST_TO_uint4_t[uxn_c_l212_c17_4050] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_c_l212_c17_4050_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_CONST_SR_4_uxn_c_l212_c27_5bd5_return_output);

     -- Submodule level 2
     VAR_BIN_OP_OR_uxn_c_l265_c4_ef66_right := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l263_l272_DUPLICATE_0de8_return_output;
     VAR_BIN_OP_OR_uxn_c_l274_c4_41c1_right := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l263_l272_DUPLICATE_0de8_return_output;
     VAR_tmp12_MUX_uxn_c_l258_c8_6771_iftrue := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l263_l272_DUPLICATE_0de8_return_output;
     VAR_tmp12_MUX_uxn_c_l267_c8_15e0_iftrue := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l263_l272_DUPLICATE_0de8_return_output;
     VAR_color_cmp_0_uxn_c_l212_c3_089d := VAR_CAST_TO_uint4_t_uxn_c_l212_c17_4050_return_output;
     VAR_BIN_OP_OR_uxn_c_l245_c4_38d3_right := VAR_CONST_SL_4_uxn_c_l243_c4_2ac7_return_output;
     VAR_tmp12_MUX_uxn_c_l236_c8_881b_iftrue := VAR_CONST_SL_4_uxn_c_l243_c4_2ac7_return_output;
     VAR_BIN_OP_OR_uxn_c_l256_c4_2f1a_right := VAR_CONST_SL_4_uxn_c_l254_c4_07aa_return_output;
     VAR_tmp12_MUX_uxn_c_l247_c8_62db_iftrue := VAR_CONST_SL_4_uxn_c_l254_c4_07aa_return_output;
     VAR_BIN_OP_OR_uxn_c_l223_c4_b048_right := VAR_CONST_SL_8_uxn_c_l221_c4_402e_return_output;
     VAR_tmp12_MUX_uxn_c_l214_c3_9657_iftrue := VAR_CONST_SL_8_uxn_c_l221_c4_402e_return_output;
     VAR_BIN_OP_OR_uxn_c_l234_c4_2a40_right := VAR_CONST_SL_8_uxn_c_l232_c4_754a_return_output;
     VAR_tmp12_MUX_uxn_c_l225_c8_ee75_iftrue := VAR_CONST_SL_8_uxn_c_l232_c4_754a_return_output;
     REG_VAR_color_cmp_1 := VAR_color_cmp_1_MUX_uxn_c_l211_c2_5060_return_output;
     VAR_color_cmp_0_MUX_uxn_c_l211_c2_5060_iftrue := VAR_color_cmp_0_uxn_c_l212_c3_089d;
     VAR_tmp12_uxn_c_l215_c4_cbe7 := resize(VAR_color_cmp_0_uxn_c_l212_c3_089d, 12);
     VAR_tmp12_uxn_c_l226_c4_8bbc := resize(VAR_color_cmp_0_uxn_c_l212_c3_089d, 12);
     VAR_tmp12_uxn_c_l237_c4_2f7c := resize(VAR_color_cmp_0_uxn_c_l212_c3_089d, 12);
     VAR_tmp12_uxn_c_l248_c4_0d67 := resize(VAR_color_cmp_0_uxn_c_l212_c3_089d, 12);
     VAR_CONST_SL_8_uxn_c_l216_c4_d5f8_x := VAR_tmp12_uxn_c_l215_c4_cbe7;
     VAR_CONST_SL_8_uxn_c_l227_c4_46ae_x := VAR_tmp12_uxn_c_l226_c4_8bbc;
     VAR_CONST_SL_4_uxn_c_l238_c4_ca33_x := VAR_tmp12_uxn_c_l237_c4_2f7c;
     VAR_CONST_SL_4_uxn_c_l249_c4_4276_x := VAR_tmp12_uxn_c_l248_c4_0d67;
     -- tmp12_MUX[uxn_c_l267_c8_15e0] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_c_l267_c8_15e0_cond <= VAR_tmp12_MUX_uxn_c_l267_c8_15e0_cond;
     tmp12_MUX_uxn_c_l267_c8_15e0_iftrue <= VAR_tmp12_MUX_uxn_c_l267_c8_15e0_iftrue;
     tmp12_MUX_uxn_c_l267_c8_15e0_iffalse <= VAR_tmp12_MUX_uxn_c_l267_c8_15e0_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_c_l267_c8_15e0_return_output := tmp12_MUX_uxn_c_l267_c8_15e0_return_output;

     -- color_cmp_0_MUX[uxn_c_l211_c2_5060] LATENCY=0
     -- Inputs
     color_cmp_0_MUX_uxn_c_l211_c2_5060_cond <= VAR_color_cmp_0_MUX_uxn_c_l211_c2_5060_cond;
     color_cmp_0_MUX_uxn_c_l211_c2_5060_iftrue <= VAR_color_cmp_0_MUX_uxn_c_l211_c2_5060_iftrue;
     color_cmp_0_MUX_uxn_c_l211_c2_5060_iffalse <= VAR_color_cmp_0_MUX_uxn_c_l211_c2_5060_iffalse;
     -- Outputs
     VAR_color_cmp_0_MUX_uxn_c_l211_c2_5060_return_output := color_cmp_0_MUX_uxn_c_l211_c2_5060_return_output;

     -- CONST_SL_4[uxn_c_l249_c4_4276] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_c_l249_c4_4276_x <= VAR_CONST_SL_4_uxn_c_l249_c4_4276_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_c_l249_c4_4276_return_output := CONST_SL_4_uxn_c_l249_c4_4276_return_output;

     -- BIN_OP_OR[uxn_c_l245_c4_38d3] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l245_c4_38d3_left <= VAR_BIN_OP_OR_uxn_c_l245_c4_38d3_left;
     BIN_OP_OR_uxn_c_l245_c4_38d3_right <= VAR_BIN_OP_OR_uxn_c_l245_c4_38d3_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l245_c4_38d3_return_output := BIN_OP_OR_uxn_c_l245_c4_38d3_return_output;

     -- CONST_SL_4[uxn_c_l238_c4_ca33] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_c_l238_c4_ca33_x <= VAR_CONST_SL_4_uxn_c_l238_c4_ca33_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_c_l238_c4_ca33_return_output := CONST_SL_4_uxn_c_l238_c4_ca33_return_output;

     -- CAST_TO_uint12_t_uint4_t_uxn_c_l259_l268_DUPLICATE_c0c3 LATENCY=0
     VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l259_l268_DUPLICATE_c0c3_return_output := CAST_TO_uint12_t_uint4_t(
     VAR_color_cmp_0_uxn_c_l212_c3_089d);

     -- BIN_OP_OR[uxn_c_l234_c4_2a40] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l234_c4_2a40_left <= VAR_BIN_OP_OR_uxn_c_l234_c4_2a40_left;
     BIN_OP_OR_uxn_c_l234_c4_2a40_right <= VAR_BIN_OP_OR_uxn_c_l234_c4_2a40_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l234_c4_2a40_return_output := BIN_OP_OR_uxn_c_l234_c4_2a40_return_output;

     -- BIN_OP_OR[uxn_c_l274_c4_41c1] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l274_c4_41c1_left <= VAR_BIN_OP_OR_uxn_c_l274_c4_41c1_left;
     BIN_OP_OR_uxn_c_l274_c4_41c1_right <= VAR_BIN_OP_OR_uxn_c_l274_c4_41c1_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l274_c4_41c1_return_output := BIN_OP_OR_uxn_c_l274_c4_41c1_return_output;

     -- CONST_SL_8[uxn_c_l216_c4_d5f8] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l216_c4_d5f8_x <= VAR_CONST_SL_8_uxn_c_l216_c4_d5f8_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l216_c4_d5f8_return_output := CONST_SL_8_uxn_c_l216_c4_d5f8_return_output;

     -- BIN_OP_OR[uxn_c_l223_c4_b048] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l223_c4_b048_left <= VAR_BIN_OP_OR_uxn_c_l223_c4_b048_left;
     BIN_OP_OR_uxn_c_l223_c4_b048_right <= VAR_BIN_OP_OR_uxn_c_l223_c4_b048_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l223_c4_b048_return_output := BIN_OP_OR_uxn_c_l223_c4_b048_return_output;

     -- CONST_SL_8[uxn_c_l227_c4_46ae] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l227_c4_46ae_x <= VAR_CONST_SL_8_uxn_c_l227_c4_46ae_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l227_c4_46ae_return_output := CONST_SL_8_uxn_c_l227_c4_46ae_return_output;

     -- BIN_OP_OR[uxn_c_l265_c4_ef66] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l265_c4_ef66_left <= VAR_BIN_OP_OR_uxn_c_l265_c4_ef66_left;
     BIN_OP_OR_uxn_c_l265_c4_ef66_right <= VAR_BIN_OP_OR_uxn_c_l265_c4_ef66_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l265_c4_ef66_return_output := BIN_OP_OR_uxn_c_l265_c4_ef66_return_output;

     -- BIN_OP_OR[uxn_c_l256_c4_2f1a] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l256_c4_2f1a_left <= VAR_BIN_OP_OR_uxn_c_l256_c4_2f1a_left;
     BIN_OP_OR_uxn_c_l256_c4_2f1a_right <= VAR_BIN_OP_OR_uxn_c_l256_c4_2f1a_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l256_c4_2f1a_return_output := BIN_OP_OR_uxn_c_l256_c4_2f1a_return_output;

     -- Submodule level 3
     VAR_color1_MUX_uxn_c_l214_c3_9657_iftrue := VAR_BIN_OP_OR_uxn_c_l223_c4_b048_return_output;
     VAR_color3_MUX_uxn_c_l225_c8_ee75_iftrue := VAR_BIN_OP_OR_uxn_c_l234_c4_2a40_return_output;
     VAR_color1_MUX_uxn_c_l236_c8_881b_iftrue := VAR_BIN_OP_OR_uxn_c_l245_c4_38d3_return_output;
     VAR_color3_MUX_uxn_c_l247_c8_62db_iftrue := VAR_BIN_OP_OR_uxn_c_l256_c4_2f1a_return_output;
     VAR_color1_MUX_uxn_c_l258_c8_6771_iftrue := VAR_BIN_OP_OR_uxn_c_l265_c4_ef66_return_output;
     VAR_color3_MUX_uxn_c_l267_c8_15e0_iftrue := VAR_BIN_OP_OR_uxn_c_l274_c4_41c1_return_output;
     VAR_BIN_OP_OR_uxn_c_l261_c4_c180_right := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l259_l268_DUPLICATE_c0c3_return_output;
     VAR_BIN_OP_OR_uxn_c_l270_c4_dbf2_right := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l259_l268_DUPLICATE_c0c3_return_output;
     VAR_BIN_OP_OR_uxn_c_l240_c4_13d5_right := VAR_CONST_SL_4_uxn_c_l238_c4_ca33_return_output;
     VAR_BIN_OP_OR_uxn_c_l251_c4_a0c4_right := VAR_CONST_SL_4_uxn_c_l249_c4_4276_return_output;
     VAR_BIN_OP_OR_uxn_c_l218_c4_84eb_right := VAR_CONST_SL_8_uxn_c_l216_c4_d5f8_return_output;
     VAR_BIN_OP_OR_uxn_c_l229_c4_8edc_right := VAR_CONST_SL_8_uxn_c_l227_c4_46ae_return_output;
     REG_VAR_color_cmp_0 := VAR_color_cmp_0_MUX_uxn_c_l211_c2_5060_return_output;
     VAR_tmp12_MUX_uxn_c_l258_c8_6771_iffalse := VAR_tmp12_MUX_uxn_c_l267_c8_15e0_return_output;
     -- BIN_OP_OR[uxn_c_l261_c4_c180] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l261_c4_c180_left <= VAR_BIN_OP_OR_uxn_c_l261_c4_c180_left;
     BIN_OP_OR_uxn_c_l261_c4_c180_right <= VAR_BIN_OP_OR_uxn_c_l261_c4_c180_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l261_c4_c180_return_output := BIN_OP_OR_uxn_c_l261_c4_c180_return_output;

     -- BIN_OP_OR[uxn_c_l218_c4_84eb] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l218_c4_84eb_left <= VAR_BIN_OP_OR_uxn_c_l218_c4_84eb_left;
     BIN_OP_OR_uxn_c_l218_c4_84eb_right <= VAR_BIN_OP_OR_uxn_c_l218_c4_84eb_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l218_c4_84eb_return_output := BIN_OP_OR_uxn_c_l218_c4_84eb_return_output;

     -- color1_MUX[uxn_c_l258_c8_6771] LATENCY=0
     -- Inputs
     color1_MUX_uxn_c_l258_c8_6771_cond <= VAR_color1_MUX_uxn_c_l258_c8_6771_cond;
     color1_MUX_uxn_c_l258_c8_6771_iftrue <= VAR_color1_MUX_uxn_c_l258_c8_6771_iftrue;
     color1_MUX_uxn_c_l258_c8_6771_iffalse <= VAR_color1_MUX_uxn_c_l258_c8_6771_iffalse;
     -- Outputs
     VAR_color1_MUX_uxn_c_l258_c8_6771_return_output := color1_MUX_uxn_c_l258_c8_6771_return_output;

     -- color3_MUX[uxn_c_l267_c8_15e0] LATENCY=0
     -- Inputs
     color3_MUX_uxn_c_l267_c8_15e0_cond <= VAR_color3_MUX_uxn_c_l267_c8_15e0_cond;
     color3_MUX_uxn_c_l267_c8_15e0_iftrue <= VAR_color3_MUX_uxn_c_l267_c8_15e0_iftrue;
     color3_MUX_uxn_c_l267_c8_15e0_iffalse <= VAR_color3_MUX_uxn_c_l267_c8_15e0_iffalse;
     -- Outputs
     VAR_color3_MUX_uxn_c_l267_c8_15e0_return_output := color3_MUX_uxn_c_l267_c8_15e0_return_output;

     -- BIN_OP_OR[uxn_c_l270_c4_dbf2] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l270_c4_dbf2_left <= VAR_BIN_OP_OR_uxn_c_l270_c4_dbf2_left;
     BIN_OP_OR_uxn_c_l270_c4_dbf2_right <= VAR_BIN_OP_OR_uxn_c_l270_c4_dbf2_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l270_c4_dbf2_return_output := BIN_OP_OR_uxn_c_l270_c4_dbf2_return_output;

     -- BIN_OP_OR[uxn_c_l240_c4_13d5] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l240_c4_13d5_left <= VAR_BIN_OP_OR_uxn_c_l240_c4_13d5_left;
     BIN_OP_OR_uxn_c_l240_c4_13d5_right <= VAR_BIN_OP_OR_uxn_c_l240_c4_13d5_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l240_c4_13d5_return_output := BIN_OP_OR_uxn_c_l240_c4_13d5_return_output;

     -- BIN_OP_OR[uxn_c_l229_c4_8edc] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l229_c4_8edc_left <= VAR_BIN_OP_OR_uxn_c_l229_c4_8edc_left;
     BIN_OP_OR_uxn_c_l229_c4_8edc_right <= VAR_BIN_OP_OR_uxn_c_l229_c4_8edc_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l229_c4_8edc_return_output := BIN_OP_OR_uxn_c_l229_c4_8edc_return_output;

     -- BIN_OP_OR[uxn_c_l251_c4_a0c4] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l251_c4_a0c4_left <= VAR_BIN_OP_OR_uxn_c_l251_c4_a0c4_left;
     BIN_OP_OR_uxn_c_l251_c4_a0c4_right <= VAR_BIN_OP_OR_uxn_c_l251_c4_a0c4_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l251_c4_a0c4_return_output := BIN_OP_OR_uxn_c_l251_c4_a0c4_return_output;

     -- tmp12_MUX[uxn_c_l258_c8_6771] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_c_l258_c8_6771_cond <= VAR_tmp12_MUX_uxn_c_l258_c8_6771_cond;
     tmp12_MUX_uxn_c_l258_c8_6771_iftrue <= VAR_tmp12_MUX_uxn_c_l258_c8_6771_iftrue;
     tmp12_MUX_uxn_c_l258_c8_6771_iffalse <= VAR_tmp12_MUX_uxn_c_l258_c8_6771_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_c_l258_c8_6771_return_output := tmp12_MUX_uxn_c_l258_c8_6771_return_output;

     -- Submodule level 4
     VAR_color0_MUX_uxn_c_l214_c3_9657_iftrue := VAR_BIN_OP_OR_uxn_c_l218_c4_84eb_return_output;
     VAR_color2_MUX_uxn_c_l225_c8_ee75_iftrue := VAR_BIN_OP_OR_uxn_c_l229_c4_8edc_return_output;
     VAR_color0_MUX_uxn_c_l236_c8_881b_iftrue := VAR_BIN_OP_OR_uxn_c_l240_c4_13d5_return_output;
     VAR_color2_MUX_uxn_c_l247_c8_62db_iftrue := VAR_BIN_OP_OR_uxn_c_l251_c4_a0c4_return_output;
     VAR_color0_MUX_uxn_c_l258_c8_6771_iftrue := VAR_BIN_OP_OR_uxn_c_l261_c4_c180_return_output;
     VAR_color2_MUX_uxn_c_l267_c8_15e0_iftrue := VAR_BIN_OP_OR_uxn_c_l270_c4_dbf2_return_output;
     VAR_color1_MUX_uxn_c_l247_c8_62db_iffalse := VAR_color1_MUX_uxn_c_l258_c8_6771_return_output;
     VAR_color3_MUX_uxn_c_l258_c8_6771_iffalse := VAR_color3_MUX_uxn_c_l267_c8_15e0_return_output;
     VAR_tmp12_MUX_uxn_c_l247_c8_62db_iffalse := VAR_tmp12_MUX_uxn_c_l258_c8_6771_return_output;
     -- color0_MUX[uxn_c_l258_c8_6771] LATENCY=0
     -- Inputs
     color0_MUX_uxn_c_l258_c8_6771_cond <= VAR_color0_MUX_uxn_c_l258_c8_6771_cond;
     color0_MUX_uxn_c_l258_c8_6771_iftrue <= VAR_color0_MUX_uxn_c_l258_c8_6771_iftrue;
     color0_MUX_uxn_c_l258_c8_6771_iffalse <= VAR_color0_MUX_uxn_c_l258_c8_6771_iffalse;
     -- Outputs
     VAR_color0_MUX_uxn_c_l258_c8_6771_return_output := color0_MUX_uxn_c_l258_c8_6771_return_output;

     -- color3_MUX[uxn_c_l258_c8_6771] LATENCY=0
     -- Inputs
     color3_MUX_uxn_c_l258_c8_6771_cond <= VAR_color3_MUX_uxn_c_l258_c8_6771_cond;
     color3_MUX_uxn_c_l258_c8_6771_iftrue <= VAR_color3_MUX_uxn_c_l258_c8_6771_iftrue;
     color3_MUX_uxn_c_l258_c8_6771_iffalse <= VAR_color3_MUX_uxn_c_l258_c8_6771_iffalse;
     -- Outputs
     VAR_color3_MUX_uxn_c_l258_c8_6771_return_output := color3_MUX_uxn_c_l258_c8_6771_return_output;

     -- color1_MUX[uxn_c_l247_c8_62db] LATENCY=0
     -- Inputs
     color1_MUX_uxn_c_l247_c8_62db_cond <= VAR_color1_MUX_uxn_c_l247_c8_62db_cond;
     color1_MUX_uxn_c_l247_c8_62db_iftrue <= VAR_color1_MUX_uxn_c_l247_c8_62db_iftrue;
     color1_MUX_uxn_c_l247_c8_62db_iffalse <= VAR_color1_MUX_uxn_c_l247_c8_62db_iffalse;
     -- Outputs
     VAR_color1_MUX_uxn_c_l247_c8_62db_return_output := color1_MUX_uxn_c_l247_c8_62db_return_output;

     -- color2_MUX[uxn_c_l267_c8_15e0] LATENCY=0
     -- Inputs
     color2_MUX_uxn_c_l267_c8_15e0_cond <= VAR_color2_MUX_uxn_c_l267_c8_15e0_cond;
     color2_MUX_uxn_c_l267_c8_15e0_iftrue <= VAR_color2_MUX_uxn_c_l267_c8_15e0_iftrue;
     color2_MUX_uxn_c_l267_c8_15e0_iffalse <= VAR_color2_MUX_uxn_c_l267_c8_15e0_iffalse;
     -- Outputs
     VAR_color2_MUX_uxn_c_l267_c8_15e0_return_output := color2_MUX_uxn_c_l267_c8_15e0_return_output;

     -- tmp12_MUX[uxn_c_l247_c8_62db] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_c_l247_c8_62db_cond <= VAR_tmp12_MUX_uxn_c_l247_c8_62db_cond;
     tmp12_MUX_uxn_c_l247_c8_62db_iftrue <= VAR_tmp12_MUX_uxn_c_l247_c8_62db_iftrue;
     tmp12_MUX_uxn_c_l247_c8_62db_iffalse <= VAR_tmp12_MUX_uxn_c_l247_c8_62db_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_c_l247_c8_62db_return_output := tmp12_MUX_uxn_c_l247_c8_62db_return_output;

     -- Submodule level 5
     VAR_color0_MUX_uxn_c_l247_c8_62db_iffalse := VAR_color0_MUX_uxn_c_l258_c8_6771_return_output;
     VAR_color1_MUX_uxn_c_l236_c8_881b_iffalse := VAR_color1_MUX_uxn_c_l247_c8_62db_return_output;
     VAR_color2_MUX_uxn_c_l258_c8_6771_iffalse := VAR_color2_MUX_uxn_c_l267_c8_15e0_return_output;
     VAR_color3_MUX_uxn_c_l247_c8_62db_iffalse := VAR_color3_MUX_uxn_c_l258_c8_6771_return_output;
     VAR_tmp12_MUX_uxn_c_l236_c8_881b_iffalse := VAR_tmp12_MUX_uxn_c_l247_c8_62db_return_output;
     -- color1_MUX[uxn_c_l236_c8_881b] LATENCY=0
     -- Inputs
     color1_MUX_uxn_c_l236_c8_881b_cond <= VAR_color1_MUX_uxn_c_l236_c8_881b_cond;
     color1_MUX_uxn_c_l236_c8_881b_iftrue <= VAR_color1_MUX_uxn_c_l236_c8_881b_iftrue;
     color1_MUX_uxn_c_l236_c8_881b_iffalse <= VAR_color1_MUX_uxn_c_l236_c8_881b_iffalse;
     -- Outputs
     VAR_color1_MUX_uxn_c_l236_c8_881b_return_output := color1_MUX_uxn_c_l236_c8_881b_return_output;

     -- color0_MUX[uxn_c_l247_c8_62db] LATENCY=0
     -- Inputs
     color0_MUX_uxn_c_l247_c8_62db_cond <= VAR_color0_MUX_uxn_c_l247_c8_62db_cond;
     color0_MUX_uxn_c_l247_c8_62db_iftrue <= VAR_color0_MUX_uxn_c_l247_c8_62db_iftrue;
     color0_MUX_uxn_c_l247_c8_62db_iffalse <= VAR_color0_MUX_uxn_c_l247_c8_62db_iffalse;
     -- Outputs
     VAR_color0_MUX_uxn_c_l247_c8_62db_return_output := color0_MUX_uxn_c_l247_c8_62db_return_output;

     -- color2_MUX[uxn_c_l258_c8_6771] LATENCY=0
     -- Inputs
     color2_MUX_uxn_c_l258_c8_6771_cond <= VAR_color2_MUX_uxn_c_l258_c8_6771_cond;
     color2_MUX_uxn_c_l258_c8_6771_iftrue <= VAR_color2_MUX_uxn_c_l258_c8_6771_iftrue;
     color2_MUX_uxn_c_l258_c8_6771_iffalse <= VAR_color2_MUX_uxn_c_l258_c8_6771_iffalse;
     -- Outputs
     VAR_color2_MUX_uxn_c_l258_c8_6771_return_output := color2_MUX_uxn_c_l258_c8_6771_return_output;

     -- tmp12_MUX[uxn_c_l236_c8_881b] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_c_l236_c8_881b_cond <= VAR_tmp12_MUX_uxn_c_l236_c8_881b_cond;
     tmp12_MUX_uxn_c_l236_c8_881b_iftrue <= VAR_tmp12_MUX_uxn_c_l236_c8_881b_iftrue;
     tmp12_MUX_uxn_c_l236_c8_881b_iffalse <= VAR_tmp12_MUX_uxn_c_l236_c8_881b_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_c_l236_c8_881b_return_output := tmp12_MUX_uxn_c_l236_c8_881b_return_output;

     -- color3_MUX[uxn_c_l247_c8_62db] LATENCY=0
     -- Inputs
     color3_MUX_uxn_c_l247_c8_62db_cond <= VAR_color3_MUX_uxn_c_l247_c8_62db_cond;
     color3_MUX_uxn_c_l247_c8_62db_iftrue <= VAR_color3_MUX_uxn_c_l247_c8_62db_iftrue;
     color3_MUX_uxn_c_l247_c8_62db_iffalse <= VAR_color3_MUX_uxn_c_l247_c8_62db_iffalse;
     -- Outputs
     VAR_color3_MUX_uxn_c_l247_c8_62db_return_output := color3_MUX_uxn_c_l247_c8_62db_return_output;

     -- Submodule level 6
     VAR_color0_MUX_uxn_c_l236_c8_881b_iffalse := VAR_color0_MUX_uxn_c_l247_c8_62db_return_output;
     VAR_color1_MUX_uxn_c_l225_c8_ee75_iffalse := VAR_color1_MUX_uxn_c_l236_c8_881b_return_output;
     VAR_color2_MUX_uxn_c_l247_c8_62db_iffalse := VAR_color2_MUX_uxn_c_l258_c8_6771_return_output;
     VAR_color3_MUX_uxn_c_l236_c8_881b_iffalse := VAR_color3_MUX_uxn_c_l247_c8_62db_return_output;
     VAR_tmp12_MUX_uxn_c_l225_c8_ee75_iffalse := VAR_tmp12_MUX_uxn_c_l236_c8_881b_return_output;
     -- tmp12_MUX[uxn_c_l225_c8_ee75] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_c_l225_c8_ee75_cond <= VAR_tmp12_MUX_uxn_c_l225_c8_ee75_cond;
     tmp12_MUX_uxn_c_l225_c8_ee75_iftrue <= VAR_tmp12_MUX_uxn_c_l225_c8_ee75_iftrue;
     tmp12_MUX_uxn_c_l225_c8_ee75_iffalse <= VAR_tmp12_MUX_uxn_c_l225_c8_ee75_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_c_l225_c8_ee75_return_output := tmp12_MUX_uxn_c_l225_c8_ee75_return_output;

     -- color1_MUX[uxn_c_l225_c8_ee75] LATENCY=0
     -- Inputs
     color1_MUX_uxn_c_l225_c8_ee75_cond <= VAR_color1_MUX_uxn_c_l225_c8_ee75_cond;
     color1_MUX_uxn_c_l225_c8_ee75_iftrue <= VAR_color1_MUX_uxn_c_l225_c8_ee75_iftrue;
     color1_MUX_uxn_c_l225_c8_ee75_iffalse <= VAR_color1_MUX_uxn_c_l225_c8_ee75_iffalse;
     -- Outputs
     VAR_color1_MUX_uxn_c_l225_c8_ee75_return_output := color1_MUX_uxn_c_l225_c8_ee75_return_output;

     -- color3_MUX[uxn_c_l236_c8_881b] LATENCY=0
     -- Inputs
     color3_MUX_uxn_c_l236_c8_881b_cond <= VAR_color3_MUX_uxn_c_l236_c8_881b_cond;
     color3_MUX_uxn_c_l236_c8_881b_iftrue <= VAR_color3_MUX_uxn_c_l236_c8_881b_iftrue;
     color3_MUX_uxn_c_l236_c8_881b_iffalse <= VAR_color3_MUX_uxn_c_l236_c8_881b_iffalse;
     -- Outputs
     VAR_color3_MUX_uxn_c_l236_c8_881b_return_output := color3_MUX_uxn_c_l236_c8_881b_return_output;

     -- color2_MUX[uxn_c_l247_c8_62db] LATENCY=0
     -- Inputs
     color2_MUX_uxn_c_l247_c8_62db_cond <= VAR_color2_MUX_uxn_c_l247_c8_62db_cond;
     color2_MUX_uxn_c_l247_c8_62db_iftrue <= VAR_color2_MUX_uxn_c_l247_c8_62db_iftrue;
     color2_MUX_uxn_c_l247_c8_62db_iffalse <= VAR_color2_MUX_uxn_c_l247_c8_62db_iffalse;
     -- Outputs
     VAR_color2_MUX_uxn_c_l247_c8_62db_return_output := color2_MUX_uxn_c_l247_c8_62db_return_output;

     -- color0_MUX[uxn_c_l236_c8_881b] LATENCY=0
     -- Inputs
     color0_MUX_uxn_c_l236_c8_881b_cond <= VAR_color0_MUX_uxn_c_l236_c8_881b_cond;
     color0_MUX_uxn_c_l236_c8_881b_iftrue <= VAR_color0_MUX_uxn_c_l236_c8_881b_iftrue;
     color0_MUX_uxn_c_l236_c8_881b_iffalse <= VAR_color0_MUX_uxn_c_l236_c8_881b_iffalse;
     -- Outputs
     VAR_color0_MUX_uxn_c_l236_c8_881b_return_output := color0_MUX_uxn_c_l236_c8_881b_return_output;

     -- Submodule level 7
     VAR_color0_MUX_uxn_c_l225_c8_ee75_iffalse := VAR_color0_MUX_uxn_c_l236_c8_881b_return_output;
     VAR_color1_MUX_uxn_c_l214_c3_9657_iffalse := VAR_color1_MUX_uxn_c_l225_c8_ee75_return_output;
     VAR_color2_MUX_uxn_c_l236_c8_881b_iffalse := VAR_color2_MUX_uxn_c_l247_c8_62db_return_output;
     VAR_color3_MUX_uxn_c_l225_c8_ee75_iffalse := VAR_color3_MUX_uxn_c_l236_c8_881b_return_output;
     VAR_tmp12_MUX_uxn_c_l214_c3_9657_iffalse := VAR_tmp12_MUX_uxn_c_l225_c8_ee75_return_output;
     -- tmp12_MUX[uxn_c_l214_c3_9657] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_c_l214_c3_9657_cond <= VAR_tmp12_MUX_uxn_c_l214_c3_9657_cond;
     tmp12_MUX_uxn_c_l214_c3_9657_iftrue <= VAR_tmp12_MUX_uxn_c_l214_c3_9657_iftrue;
     tmp12_MUX_uxn_c_l214_c3_9657_iffalse <= VAR_tmp12_MUX_uxn_c_l214_c3_9657_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_c_l214_c3_9657_return_output := tmp12_MUX_uxn_c_l214_c3_9657_return_output;

     -- color1_MUX[uxn_c_l214_c3_9657] LATENCY=0
     -- Inputs
     color1_MUX_uxn_c_l214_c3_9657_cond <= VAR_color1_MUX_uxn_c_l214_c3_9657_cond;
     color1_MUX_uxn_c_l214_c3_9657_iftrue <= VAR_color1_MUX_uxn_c_l214_c3_9657_iftrue;
     color1_MUX_uxn_c_l214_c3_9657_iffalse <= VAR_color1_MUX_uxn_c_l214_c3_9657_iffalse;
     -- Outputs
     VAR_color1_MUX_uxn_c_l214_c3_9657_return_output := color1_MUX_uxn_c_l214_c3_9657_return_output;

     -- color0_MUX[uxn_c_l225_c8_ee75] LATENCY=0
     -- Inputs
     color0_MUX_uxn_c_l225_c8_ee75_cond <= VAR_color0_MUX_uxn_c_l225_c8_ee75_cond;
     color0_MUX_uxn_c_l225_c8_ee75_iftrue <= VAR_color0_MUX_uxn_c_l225_c8_ee75_iftrue;
     color0_MUX_uxn_c_l225_c8_ee75_iffalse <= VAR_color0_MUX_uxn_c_l225_c8_ee75_iffalse;
     -- Outputs
     VAR_color0_MUX_uxn_c_l225_c8_ee75_return_output := color0_MUX_uxn_c_l225_c8_ee75_return_output;

     -- color2_MUX[uxn_c_l236_c8_881b] LATENCY=0
     -- Inputs
     color2_MUX_uxn_c_l236_c8_881b_cond <= VAR_color2_MUX_uxn_c_l236_c8_881b_cond;
     color2_MUX_uxn_c_l236_c8_881b_iftrue <= VAR_color2_MUX_uxn_c_l236_c8_881b_iftrue;
     color2_MUX_uxn_c_l236_c8_881b_iffalse <= VAR_color2_MUX_uxn_c_l236_c8_881b_iffalse;
     -- Outputs
     VAR_color2_MUX_uxn_c_l236_c8_881b_return_output := color2_MUX_uxn_c_l236_c8_881b_return_output;

     -- color3_MUX[uxn_c_l225_c8_ee75] LATENCY=0
     -- Inputs
     color3_MUX_uxn_c_l225_c8_ee75_cond <= VAR_color3_MUX_uxn_c_l225_c8_ee75_cond;
     color3_MUX_uxn_c_l225_c8_ee75_iftrue <= VAR_color3_MUX_uxn_c_l225_c8_ee75_iftrue;
     color3_MUX_uxn_c_l225_c8_ee75_iffalse <= VAR_color3_MUX_uxn_c_l225_c8_ee75_iffalse;
     -- Outputs
     VAR_color3_MUX_uxn_c_l225_c8_ee75_return_output := color3_MUX_uxn_c_l225_c8_ee75_return_output;

     -- Submodule level 8
     VAR_color0_MUX_uxn_c_l214_c3_9657_iffalse := VAR_color0_MUX_uxn_c_l225_c8_ee75_return_output;
     VAR_color1_MUX_uxn_c_l211_c2_5060_iftrue := VAR_color1_MUX_uxn_c_l214_c3_9657_return_output;
     VAR_color2_MUX_uxn_c_l225_c8_ee75_iffalse := VAR_color2_MUX_uxn_c_l236_c8_881b_return_output;
     VAR_color3_MUX_uxn_c_l214_c3_9657_iffalse := VAR_color3_MUX_uxn_c_l225_c8_ee75_return_output;
     VAR_tmp12_MUX_uxn_c_l211_c2_5060_iftrue := VAR_tmp12_MUX_uxn_c_l214_c3_9657_return_output;
     -- color0_MUX[uxn_c_l214_c3_9657] LATENCY=0
     -- Inputs
     color0_MUX_uxn_c_l214_c3_9657_cond <= VAR_color0_MUX_uxn_c_l214_c3_9657_cond;
     color0_MUX_uxn_c_l214_c3_9657_iftrue <= VAR_color0_MUX_uxn_c_l214_c3_9657_iftrue;
     color0_MUX_uxn_c_l214_c3_9657_iffalse <= VAR_color0_MUX_uxn_c_l214_c3_9657_iffalse;
     -- Outputs
     VAR_color0_MUX_uxn_c_l214_c3_9657_return_output := color0_MUX_uxn_c_l214_c3_9657_return_output;

     -- tmp12_MUX[uxn_c_l211_c2_5060] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_c_l211_c2_5060_cond <= VAR_tmp12_MUX_uxn_c_l211_c2_5060_cond;
     tmp12_MUX_uxn_c_l211_c2_5060_iftrue <= VAR_tmp12_MUX_uxn_c_l211_c2_5060_iftrue;
     tmp12_MUX_uxn_c_l211_c2_5060_iffalse <= VAR_tmp12_MUX_uxn_c_l211_c2_5060_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_c_l211_c2_5060_return_output := tmp12_MUX_uxn_c_l211_c2_5060_return_output;

     -- color3_MUX[uxn_c_l214_c3_9657] LATENCY=0
     -- Inputs
     color3_MUX_uxn_c_l214_c3_9657_cond <= VAR_color3_MUX_uxn_c_l214_c3_9657_cond;
     color3_MUX_uxn_c_l214_c3_9657_iftrue <= VAR_color3_MUX_uxn_c_l214_c3_9657_iftrue;
     color3_MUX_uxn_c_l214_c3_9657_iffalse <= VAR_color3_MUX_uxn_c_l214_c3_9657_iffalse;
     -- Outputs
     VAR_color3_MUX_uxn_c_l214_c3_9657_return_output := color3_MUX_uxn_c_l214_c3_9657_return_output;

     -- color1_MUX[uxn_c_l211_c2_5060] LATENCY=0
     -- Inputs
     color1_MUX_uxn_c_l211_c2_5060_cond <= VAR_color1_MUX_uxn_c_l211_c2_5060_cond;
     color1_MUX_uxn_c_l211_c2_5060_iftrue <= VAR_color1_MUX_uxn_c_l211_c2_5060_iftrue;
     color1_MUX_uxn_c_l211_c2_5060_iffalse <= VAR_color1_MUX_uxn_c_l211_c2_5060_iffalse;
     -- Outputs
     VAR_color1_MUX_uxn_c_l211_c2_5060_return_output := color1_MUX_uxn_c_l211_c2_5060_return_output;

     -- color2_MUX[uxn_c_l225_c8_ee75] LATENCY=0
     -- Inputs
     color2_MUX_uxn_c_l225_c8_ee75_cond <= VAR_color2_MUX_uxn_c_l225_c8_ee75_cond;
     color2_MUX_uxn_c_l225_c8_ee75_iftrue <= VAR_color2_MUX_uxn_c_l225_c8_ee75_iftrue;
     color2_MUX_uxn_c_l225_c8_ee75_iffalse <= VAR_color2_MUX_uxn_c_l225_c8_ee75_iffalse;
     -- Outputs
     VAR_color2_MUX_uxn_c_l225_c8_ee75_return_output := color2_MUX_uxn_c_l225_c8_ee75_return_output;

     -- Submodule level 9
     VAR_color0_MUX_uxn_c_l211_c2_5060_iftrue := VAR_color0_MUX_uxn_c_l214_c3_9657_return_output;
     REG_VAR_color1 := VAR_color1_MUX_uxn_c_l211_c2_5060_return_output;
     VAR_result_uxn_c_l281_c3_26ee := resize(VAR_color1_MUX_uxn_c_l211_c2_5060_return_output, 16);
     VAR_color2_MUX_uxn_c_l214_c3_9657_iffalse := VAR_color2_MUX_uxn_c_l225_c8_ee75_return_output;
     VAR_color3_MUX_uxn_c_l211_c2_5060_iftrue := VAR_color3_MUX_uxn_c_l214_c3_9657_return_output;
     REG_VAR_tmp12 := VAR_tmp12_MUX_uxn_c_l211_c2_5060_return_output;
     VAR_result_MUX_uxn_c_l280_c9_c97e_iftrue := VAR_result_uxn_c_l281_c3_26ee;
     -- color0_MUX[uxn_c_l211_c2_5060] LATENCY=0
     -- Inputs
     color0_MUX_uxn_c_l211_c2_5060_cond <= VAR_color0_MUX_uxn_c_l211_c2_5060_cond;
     color0_MUX_uxn_c_l211_c2_5060_iftrue <= VAR_color0_MUX_uxn_c_l211_c2_5060_iftrue;
     color0_MUX_uxn_c_l211_c2_5060_iffalse <= VAR_color0_MUX_uxn_c_l211_c2_5060_iffalse;
     -- Outputs
     VAR_color0_MUX_uxn_c_l211_c2_5060_return_output := color0_MUX_uxn_c_l211_c2_5060_return_output;

     -- color2_MUX[uxn_c_l214_c3_9657] LATENCY=0
     -- Inputs
     color2_MUX_uxn_c_l214_c3_9657_cond <= VAR_color2_MUX_uxn_c_l214_c3_9657_cond;
     color2_MUX_uxn_c_l214_c3_9657_iftrue <= VAR_color2_MUX_uxn_c_l214_c3_9657_iftrue;
     color2_MUX_uxn_c_l214_c3_9657_iffalse <= VAR_color2_MUX_uxn_c_l214_c3_9657_iffalse;
     -- Outputs
     VAR_color2_MUX_uxn_c_l214_c3_9657_return_output := color2_MUX_uxn_c_l214_c3_9657_return_output;

     -- color3_MUX[uxn_c_l211_c2_5060] LATENCY=0
     -- Inputs
     color3_MUX_uxn_c_l211_c2_5060_cond <= VAR_color3_MUX_uxn_c_l211_c2_5060_cond;
     color3_MUX_uxn_c_l211_c2_5060_iftrue <= VAR_color3_MUX_uxn_c_l211_c2_5060_iftrue;
     color3_MUX_uxn_c_l211_c2_5060_iffalse <= VAR_color3_MUX_uxn_c_l211_c2_5060_iffalse;
     -- Outputs
     VAR_color3_MUX_uxn_c_l211_c2_5060_return_output := color3_MUX_uxn_c_l211_c2_5060_return_output;

     -- Submodule level 10
     REG_VAR_color0 := VAR_color0_MUX_uxn_c_l211_c2_5060_return_output;
     VAR_result_uxn_c_l279_c3_07c9 := resize(VAR_color0_MUX_uxn_c_l211_c2_5060_return_output, 16);
     VAR_color2_MUX_uxn_c_l211_c2_5060_iftrue := VAR_color2_MUX_uxn_c_l214_c3_9657_return_output;
     REG_VAR_color3 := VAR_color3_MUX_uxn_c_l211_c2_5060_return_output;
     VAR_result_uxn_c_l285_c3_ce38 := resize(VAR_color3_MUX_uxn_c_l211_c2_5060_return_output, 16);
     VAR_result_MUX_uxn_c_l278_c2_b186_iftrue := VAR_result_uxn_c_l279_c3_07c9;
     VAR_result_MUX_uxn_c_l282_c9_09d3_iffalse := VAR_result_uxn_c_l285_c3_ce38;
     -- color2_MUX[uxn_c_l211_c2_5060] LATENCY=0
     -- Inputs
     color2_MUX_uxn_c_l211_c2_5060_cond <= VAR_color2_MUX_uxn_c_l211_c2_5060_cond;
     color2_MUX_uxn_c_l211_c2_5060_iftrue <= VAR_color2_MUX_uxn_c_l211_c2_5060_iftrue;
     color2_MUX_uxn_c_l211_c2_5060_iffalse <= VAR_color2_MUX_uxn_c_l211_c2_5060_iffalse;
     -- Outputs
     VAR_color2_MUX_uxn_c_l211_c2_5060_return_output := color2_MUX_uxn_c_l211_c2_5060_return_output;

     -- Submodule level 11
     REG_VAR_color2 := VAR_color2_MUX_uxn_c_l211_c2_5060_return_output;
     VAR_result_uxn_c_l283_c3_b694 := resize(VAR_color2_MUX_uxn_c_l211_c2_5060_return_output, 16);
     VAR_result_MUX_uxn_c_l282_c9_09d3_iftrue := VAR_result_uxn_c_l283_c3_b694;
     -- result_MUX[uxn_c_l282_c9_09d3] LATENCY=0
     -- Inputs
     result_MUX_uxn_c_l282_c9_09d3_cond <= VAR_result_MUX_uxn_c_l282_c9_09d3_cond;
     result_MUX_uxn_c_l282_c9_09d3_iftrue <= VAR_result_MUX_uxn_c_l282_c9_09d3_iftrue;
     result_MUX_uxn_c_l282_c9_09d3_iffalse <= VAR_result_MUX_uxn_c_l282_c9_09d3_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_c_l282_c9_09d3_return_output := result_MUX_uxn_c_l282_c9_09d3_return_output;

     -- Submodule level 12
     VAR_result_MUX_uxn_c_l280_c9_c97e_iffalse := VAR_result_MUX_uxn_c_l282_c9_09d3_return_output;
     -- result_MUX[uxn_c_l280_c9_c97e] LATENCY=0
     -- Inputs
     result_MUX_uxn_c_l280_c9_c97e_cond <= VAR_result_MUX_uxn_c_l280_c9_c97e_cond;
     result_MUX_uxn_c_l280_c9_c97e_iftrue <= VAR_result_MUX_uxn_c_l280_c9_c97e_iftrue;
     result_MUX_uxn_c_l280_c9_c97e_iffalse <= VAR_result_MUX_uxn_c_l280_c9_c97e_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_c_l280_c9_c97e_return_output := result_MUX_uxn_c_l280_c9_c97e_return_output;

     -- Submodule level 13
     VAR_result_MUX_uxn_c_l278_c2_b186_iffalse := VAR_result_MUX_uxn_c_l280_c9_c97e_return_output;
     -- result_MUX[uxn_c_l278_c2_b186] LATENCY=0
     -- Inputs
     result_MUX_uxn_c_l278_c2_b186_cond <= VAR_result_MUX_uxn_c_l278_c2_b186_cond;
     result_MUX_uxn_c_l278_c2_b186_iftrue <= VAR_result_MUX_uxn_c_l278_c2_b186_iftrue;
     result_MUX_uxn_c_l278_c2_b186_iffalse <= VAR_result_MUX_uxn_c_l278_c2_b186_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_c_l278_c2_b186_return_output := result_MUX_uxn_c_l278_c2_b186_return_output;

     -- Submodule level 14
     REG_VAR_result := VAR_result_MUX_uxn_c_l278_c2_b186_return_output;
     VAR_return_output := VAR_result_MUX_uxn_c_l278_c2_b186_return_output;
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
