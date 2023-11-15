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
-- color_cmp_1_MUX[uxn_c_l211_c2_de09]
signal color_cmp_1_MUX_uxn_c_l211_c2_de09_cond : unsigned(0 downto 0);
signal color_cmp_1_MUX_uxn_c_l211_c2_de09_iftrue : unsigned(3 downto 0);
signal color_cmp_1_MUX_uxn_c_l211_c2_de09_iffalse : unsigned(3 downto 0);
signal color_cmp_1_MUX_uxn_c_l211_c2_de09_return_output : unsigned(3 downto 0);

-- color0_MUX[uxn_c_l211_c2_de09]
signal color0_MUX_uxn_c_l211_c2_de09_cond : unsigned(0 downto 0);
signal color0_MUX_uxn_c_l211_c2_de09_iftrue : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l211_c2_de09_iffalse : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l211_c2_de09_return_output : unsigned(11 downto 0);

-- color1_MUX[uxn_c_l211_c2_de09]
signal color1_MUX_uxn_c_l211_c2_de09_cond : unsigned(0 downto 0);
signal color1_MUX_uxn_c_l211_c2_de09_iftrue : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l211_c2_de09_iffalse : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l211_c2_de09_return_output : unsigned(11 downto 0);

-- color_cmp_0_MUX[uxn_c_l211_c2_de09]
signal color_cmp_0_MUX_uxn_c_l211_c2_de09_cond : unsigned(0 downto 0);
signal color_cmp_0_MUX_uxn_c_l211_c2_de09_iftrue : unsigned(3 downto 0);
signal color_cmp_0_MUX_uxn_c_l211_c2_de09_iffalse : unsigned(3 downto 0);
signal color_cmp_0_MUX_uxn_c_l211_c2_de09_return_output : unsigned(3 downto 0);

-- tmp12_MUX[uxn_c_l211_c2_de09]
signal tmp12_MUX_uxn_c_l211_c2_de09_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_c_l211_c2_de09_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l211_c2_de09_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l211_c2_de09_return_output : unsigned(11 downto 0);

-- color2_MUX[uxn_c_l211_c2_de09]
signal color2_MUX_uxn_c_l211_c2_de09_cond : unsigned(0 downto 0);
signal color2_MUX_uxn_c_l211_c2_de09_iftrue : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l211_c2_de09_iffalse : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l211_c2_de09_return_output : unsigned(11 downto 0);

-- color3_MUX[uxn_c_l211_c2_de09]
signal color3_MUX_uxn_c_l211_c2_de09_cond : unsigned(0 downto 0);
signal color3_MUX_uxn_c_l211_c2_de09_iftrue : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l211_c2_de09_iffalse : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l211_c2_de09_return_output : unsigned(11 downto 0);

-- CONST_SR_4[uxn_c_l212_c27_a9a6]
signal CONST_SR_4_uxn_c_l212_c27_a9a6_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_c_l212_c27_a9a6_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_c_l214_c7_01be]
signal BIN_OP_EQ_uxn_c_l214_c7_01be_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l214_c7_01be_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l214_c7_01be_return_output : unsigned(0 downto 0);

-- color0_MUX[uxn_c_l214_c3_f4a2]
signal color0_MUX_uxn_c_l214_c3_f4a2_cond : unsigned(0 downto 0);
signal color0_MUX_uxn_c_l214_c3_f4a2_iftrue : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l214_c3_f4a2_iffalse : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l214_c3_f4a2_return_output : unsigned(11 downto 0);

-- color1_MUX[uxn_c_l214_c3_f4a2]
signal color1_MUX_uxn_c_l214_c3_f4a2_cond : unsigned(0 downto 0);
signal color1_MUX_uxn_c_l214_c3_f4a2_iftrue : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l214_c3_f4a2_iffalse : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l214_c3_f4a2_return_output : unsigned(11 downto 0);

-- tmp12_MUX[uxn_c_l214_c3_f4a2]
signal tmp12_MUX_uxn_c_l214_c3_f4a2_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_c_l214_c3_f4a2_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l214_c3_f4a2_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l214_c3_f4a2_return_output : unsigned(11 downto 0);

-- color2_MUX[uxn_c_l214_c3_f4a2]
signal color2_MUX_uxn_c_l214_c3_f4a2_cond : unsigned(0 downto 0);
signal color2_MUX_uxn_c_l214_c3_f4a2_iftrue : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l214_c3_f4a2_iffalse : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l214_c3_f4a2_return_output : unsigned(11 downto 0);

-- color3_MUX[uxn_c_l214_c3_f4a2]
signal color3_MUX_uxn_c_l214_c3_f4a2_cond : unsigned(0 downto 0);
signal color3_MUX_uxn_c_l214_c3_f4a2_iftrue : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l214_c3_f4a2_iffalse : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l214_c3_f4a2_return_output : unsigned(11 downto 0);

-- CONST_SL_8[uxn_c_l216_c4_61ee]
signal CONST_SL_8_uxn_c_l216_c4_61ee_x : unsigned(11 downto 0);
signal CONST_SL_8_uxn_c_l216_c4_61ee_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l217_c4_fe98]
signal BIN_OP_AND_uxn_c_l217_c4_fe98_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l217_c4_fe98_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l217_c4_fe98_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l218_c4_a837]
signal BIN_OP_OR_uxn_c_l218_c4_a837_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l218_c4_a837_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l218_c4_a837_return_output : unsigned(11 downto 0);

-- CONST_SL_8[uxn_c_l221_c4_dea1]
signal CONST_SL_8_uxn_c_l221_c4_dea1_x : unsigned(11 downto 0);
signal CONST_SL_8_uxn_c_l221_c4_dea1_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l222_c4_f224]
signal BIN_OP_AND_uxn_c_l222_c4_f224_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l222_c4_f224_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l222_c4_f224_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l223_c4_9e23]
signal BIN_OP_OR_uxn_c_l223_c4_9e23_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l223_c4_9e23_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l223_c4_9e23_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l225_c12_9332]
signal BIN_OP_EQ_uxn_c_l225_c12_9332_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l225_c12_9332_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l225_c12_9332_return_output : unsigned(0 downto 0);

-- color0_MUX[uxn_c_l225_c8_d86c]
signal color0_MUX_uxn_c_l225_c8_d86c_cond : unsigned(0 downto 0);
signal color0_MUX_uxn_c_l225_c8_d86c_iftrue : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l225_c8_d86c_iffalse : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l225_c8_d86c_return_output : unsigned(11 downto 0);

-- color1_MUX[uxn_c_l225_c8_d86c]
signal color1_MUX_uxn_c_l225_c8_d86c_cond : unsigned(0 downto 0);
signal color1_MUX_uxn_c_l225_c8_d86c_iftrue : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l225_c8_d86c_iffalse : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l225_c8_d86c_return_output : unsigned(11 downto 0);

-- tmp12_MUX[uxn_c_l225_c8_d86c]
signal tmp12_MUX_uxn_c_l225_c8_d86c_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_c_l225_c8_d86c_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l225_c8_d86c_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l225_c8_d86c_return_output : unsigned(11 downto 0);

-- color2_MUX[uxn_c_l225_c8_d86c]
signal color2_MUX_uxn_c_l225_c8_d86c_cond : unsigned(0 downto 0);
signal color2_MUX_uxn_c_l225_c8_d86c_iftrue : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l225_c8_d86c_iffalse : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l225_c8_d86c_return_output : unsigned(11 downto 0);

-- color3_MUX[uxn_c_l225_c8_d86c]
signal color3_MUX_uxn_c_l225_c8_d86c_cond : unsigned(0 downto 0);
signal color3_MUX_uxn_c_l225_c8_d86c_iftrue : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l225_c8_d86c_iffalse : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l225_c8_d86c_return_output : unsigned(11 downto 0);

-- CONST_SL_8[uxn_c_l227_c4_18f6]
signal CONST_SL_8_uxn_c_l227_c4_18f6_x : unsigned(11 downto 0);
signal CONST_SL_8_uxn_c_l227_c4_18f6_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l228_c4_f424]
signal BIN_OP_AND_uxn_c_l228_c4_f424_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l228_c4_f424_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l228_c4_f424_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l229_c4_1824]
signal BIN_OP_OR_uxn_c_l229_c4_1824_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l229_c4_1824_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l229_c4_1824_return_output : unsigned(11 downto 0);

-- CONST_SL_8[uxn_c_l232_c4_cf26]
signal CONST_SL_8_uxn_c_l232_c4_cf26_x : unsigned(11 downto 0);
signal CONST_SL_8_uxn_c_l232_c4_cf26_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l233_c4_4b02]
signal BIN_OP_AND_uxn_c_l233_c4_4b02_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l233_c4_4b02_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l233_c4_4b02_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l234_c4_1287]
signal BIN_OP_OR_uxn_c_l234_c4_1287_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l234_c4_1287_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l234_c4_1287_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l236_c12_63c0]
signal BIN_OP_EQ_uxn_c_l236_c12_63c0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l236_c12_63c0_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l236_c12_63c0_return_output : unsigned(0 downto 0);

-- color0_MUX[uxn_c_l236_c8_aed9]
signal color0_MUX_uxn_c_l236_c8_aed9_cond : unsigned(0 downto 0);
signal color0_MUX_uxn_c_l236_c8_aed9_iftrue : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l236_c8_aed9_iffalse : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l236_c8_aed9_return_output : unsigned(11 downto 0);

-- color1_MUX[uxn_c_l236_c8_aed9]
signal color1_MUX_uxn_c_l236_c8_aed9_cond : unsigned(0 downto 0);
signal color1_MUX_uxn_c_l236_c8_aed9_iftrue : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l236_c8_aed9_iffalse : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l236_c8_aed9_return_output : unsigned(11 downto 0);

-- tmp12_MUX[uxn_c_l236_c8_aed9]
signal tmp12_MUX_uxn_c_l236_c8_aed9_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_c_l236_c8_aed9_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l236_c8_aed9_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l236_c8_aed9_return_output : unsigned(11 downto 0);

-- color2_MUX[uxn_c_l236_c8_aed9]
signal color2_MUX_uxn_c_l236_c8_aed9_cond : unsigned(0 downto 0);
signal color2_MUX_uxn_c_l236_c8_aed9_iftrue : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l236_c8_aed9_iffalse : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l236_c8_aed9_return_output : unsigned(11 downto 0);

-- color3_MUX[uxn_c_l236_c8_aed9]
signal color3_MUX_uxn_c_l236_c8_aed9_cond : unsigned(0 downto 0);
signal color3_MUX_uxn_c_l236_c8_aed9_iftrue : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l236_c8_aed9_iffalse : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l236_c8_aed9_return_output : unsigned(11 downto 0);

-- CONST_SL_4[uxn_c_l238_c4_ac70]
signal CONST_SL_4_uxn_c_l238_c4_ac70_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_c_l238_c4_ac70_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l239_c4_6e62]
signal BIN_OP_AND_uxn_c_l239_c4_6e62_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l239_c4_6e62_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l239_c4_6e62_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l240_c4_d997]
signal BIN_OP_OR_uxn_c_l240_c4_d997_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l240_c4_d997_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l240_c4_d997_return_output : unsigned(11 downto 0);

-- CONST_SL_4[uxn_c_l243_c4_b7b8]
signal CONST_SL_4_uxn_c_l243_c4_b7b8_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_c_l243_c4_b7b8_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l244_c4_d2de]
signal BIN_OP_AND_uxn_c_l244_c4_d2de_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l244_c4_d2de_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l244_c4_d2de_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l245_c4_7154]
signal BIN_OP_OR_uxn_c_l245_c4_7154_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l245_c4_7154_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l245_c4_7154_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l247_c12_4807]
signal BIN_OP_EQ_uxn_c_l247_c12_4807_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l247_c12_4807_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l247_c12_4807_return_output : unsigned(0 downto 0);

-- color0_MUX[uxn_c_l247_c8_37e5]
signal color0_MUX_uxn_c_l247_c8_37e5_cond : unsigned(0 downto 0);
signal color0_MUX_uxn_c_l247_c8_37e5_iftrue : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l247_c8_37e5_iffalse : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l247_c8_37e5_return_output : unsigned(11 downto 0);

-- color1_MUX[uxn_c_l247_c8_37e5]
signal color1_MUX_uxn_c_l247_c8_37e5_cond : unsigned(0 downto 0);
signal color1_MUX_uxn_c_l247_c8_37e5_iftrue : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l247_c8_37e5_iffalse : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l247_c8_37e5_return_output : unsigned(11 downto 0);

-- tmp12_MUX[uxn_c_l247_c8_37e5]
signal tmp12_MUX_uxn_c_l247_c8_37e5_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_c_l247_c8_37e5_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l247_c8_37e5_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l247_c8_37e5_return_output : unsigned(11 downto 0);

-- color2_MUX[uxn_c_l247_c8_37e5]
signal color2_MUX_uxn_c_l247_c8_37e5_cond : unsigned(0 downto 0);
signal color2_MUX_uxn_c_l247_c8_37e5_iftrue : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l247_c8_37e5_iffalse : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l247_c8_37e5_return_output : unsigned(11 downto 0);

-- color3_MUX[uxn_c_l247_c8_37e5]
signal color3_MUX_uxn_c_l247_c8_37e5_cond : unsigned(0 downto 0);
signal color3_MUX_uxn_c_l247_c8_37e5_iftrue : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l247_c8_37e5_iffalse : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l247_c8_37e5_return_output : unsigned(11 downto 0);

-- CONST_SL_4[uxn_c_l249_c4_5a70]
signal CONST_SL_4_uxn_c_l249_c4_5a70_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_c_l249_c4_5a70_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l250_c4_6dc6]
signal BIN_OP_AND_uxn_c_l250_c4_6dc6_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l250_c4_6dc6_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l250_c4_6dc6_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l251_c4_811a]
signal BIN_OP_OR_uxn_c_l251_c4_811a_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l251_c4_811a_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l251_c4_811a_return_output : unsigned(11 downto 0);

-- CONST_SL_4[uxn_c_l254_c4_d230]
signal CONST_SL_4_uxn_c_l254_c4_d230_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_c_l254_c4_d230_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l255_c4_6410]
signal BIN_OP_AND_uxn_c_l255_c4_6410_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l255_c4_6410_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l255_c4_6410_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l256_c4_baa9]
signal BIN_OP_OR_uxn_c_l256_c4_baa9_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l256_c4_baa9_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l256_c4_baa9_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l258_c12_99fd]
signal BIN_OP_EQ_uxn_c_l258_c12_99fd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l258_c12_99fd_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l258_c12_99fd_return_output : unsigned(0 downto 0);

-- color0_MUX[uxn_c_l258_c8_3c5b]
signal color0_MUX_uxn_c_l258_c8_3c5b_cond : unsigned(0 downto 0);
signal color0_MUX_uxn_c_l258_c8_3c5b_iftrue : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l258_c8_3c5b_iffalse : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l258_c8_3c5b_return_output : unsigned(11 downto 0);

-- color1_MUX[uxn_c_l258_c8_3c5b]
signal color1_MUX_uxn_c_l258_c8_3c5b_cond : unsigned(0 downto 0);
signal color1_MUX_uxn_c_l258_c8_3c5b_iftrue : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l258_c8_3c5b_iffalse : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l258_c8_3c5b_return_output : unsigned(11 downto 0);

-- tmp12_MUX[uxn_c_l258_c8_3c5b]
signal tmp12_MUX_uxn_c_l258_c8_3c5b_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_c_l258_c8_3c5b_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l258_c8_3c5b_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l258_c8_3c5b_return_output : unsigned(11 downto 0);

-- color2_MUX[uxn_c_l258_c8_3c5b]
signal color2_MUX_uxn_c_l258_c8_3c5b_cond : unsigned(0 downto 0);
signal color2_MUX_uxn_c_l258_c8_3c5b_iftrue : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l258_c8_3c5b_iffalse : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l258_c8_3c5b_return_output : unsigned(11 downto 0);

-- color3_MUX[uxn_c_l258_c8_3c5b]
signal color3_MUX_uxn_c_l258_c8_3c5b_cond : unsigned(0 downto 0);
signal color3_MUX_uxn_c_l258_c8_3c5b_iftrue : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l258_c8_3c5b_iffalse : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l258_c8_3c5b_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l260_c4_0e97]
signal BIN_OP_AND_uxn_c_l260_c4_0e97_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l260_c4_0e97_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l260_c4_0e97_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l261_c4_1a63]
signal BIN_OP_OR_uxn_c_l261_c4_1a63_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l261_c4_1a63_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l261_c4_1a63_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l264_c4_fc72]
signal BIN_OP_AND_uxn_c_l264_c4_fc72_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l264_c4_fc72_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l264_c4_fc72_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l265_c4_6d8e]
signal BIN_OP_OR_uxn_c_l265_c4_6d8e_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l265_c4_6d8e_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l265_c4_6d8e_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l267_c12_efc8]
signal BIN_OP_EQ_uxn_c_l267_c12_efc8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l267_c12_efc8_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l267_c12_efc8_return_output : unsigned(0 downto 0);

-- tmp12_MUX[uxn_c_l267_c8_4856]
signal tmp12_MUX_uxn_c_l267_c8_4856_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_c_l267_c8_4856_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l267_c8_4856_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l267_c8_4856_return_output : unsigned(11 downto 0);

-- color2_MUX[uxn_c_l267_c8_4856]
signal color2_MUX_uxn_c_l267_c8_4856_cond : unsigned(0 downto 0);
signal color2_MUX_uxn_c_l267_c8_4856_iftrue : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l267_c8_4856_iffalse : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l267_c8_4856_return_output : unsigned(11 downto 0);

-- color3_MUX[uxn_c_l267_c8_4856]
signal color3_MUX_uxn_c_l267_c8_4856_cond : unsigned(0 downto 0);
signal color3_MUX_uxn_c_l267_c8_4856_iftrue : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l267_c8_4856_iffalse : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l267_c8_4856_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l269_c4_01ab]
signal BIN_OP_AND_uxn_c_l269_c4_01ab_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l269_c4_01ab_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l269_c4_01ab_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l270_c4_3a6c]
signal BIN_OP_OR_uxn_c_l270_c4_3a6c_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l270_c4_3a6c_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l270_c4_3a6c_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l273_c4_979f]
signal BIN_OP_AND_uxn_c_l273_c4_979f_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l273_c4_979f_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l273_c4_979f_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l274_c4_68cf]
signal BIN_OP_OR_uxn_c_l274_c4_68cf_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l274_c4_68cf_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l274_c4_68cf_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l278_c6_56e7]
signal BIN_OP_EQ_uxn_c_l278_c6_56e7_left : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l278_c6_56e7_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l278_c6_56e7_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_c_l278_c2_508f]
signal result_MUX_uxn_c_l278_c2_508f_cond : unsigned(0 downto 0);
signal result_MUX_uxn_c_l278_c2_508f_iftrue : unsigned(15 downto 0);
signal result_MUX_uxn_c_l278_c2_508f_iffalse : unsigned(15 downto 0);
signal result_MUX_uxn_c_l278_c2_508f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l280_c13_e06f]
signal BIN_OP_EQ_uxn_c_l280_c13_e06f_left : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l280_c13_e06f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l280_c13_e06f_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_c_l280_c9_4116]
signal result_MUX_uxn_c_l280_c9_4116_cond : unsigned(0 downto 0);
signal result_MUX_uxn_c_l280_c9_4116_iftrue : unsigned(15 downto 0);
signal result_MUX_uxn_c_l280_c9_4116_iffalse : unsigned(15 downto 0);
signal result_MUX_uxn_c_l280_c9_4116_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l282_c13_03cf]
signal BIN_OP_EQ_uxn_c_l282_c13_03cf_left : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l282_c13_03cf_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l282_c13_03cf_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_c_l282_c9_87ca]
signal result_MUX_uxn_c_l282_c9_87ca_cond : unsigned(0 downto 0);
signal result_MUX_uxn_c_l282_c9_87ca_iftrue : unsigned(15 downto 0);
signal result_MUX_uxn_c_l282_c9_87ca_iffalse : unsigned(15 downto 0);
signal result_MUX_uxn_c_l282_c9_87ca_return_output : unsigned(15 downto 0);

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
-- color_cmp_1_MUX_uxn_c_l211_c2_de09
color_cmp_1_MUX_uxn_c_l211_c2_de09 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_cmp_1_MUX_uxn_c_l211_c2_de09_cond,
color_cmp_1_MUX_uxn_c_l211_c2_de09_iftrue,
color_cmp_1_MUX_uxn_c_l211_c2_de09_iffalse,
color_cmp_1_MUX_uxn_c_l211_c2_de09_return_output);

-- color0_MUX_uxn_c_l211_c2_de09
color0_MUX_uxn_c_l211_c2_de09 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color0_MUX_uxn_c_l211_c2_de09_cond,
color0_MUX_uxn_c_l211_c2_de09_iftrue,
color0_MUX_uxn_c_l211_c2_de09_iffalse,
color0_MUX_uxn_c_l211_c2_de09_return_output);

-- color1_MUX_uxn_c_l211_c2_de09
color1_MUX_uxn_c_l211_c2_de09 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color1_MUX_uxn_c_l211_c2_de09_cond,
color1_MUX_uxn_c_l211_c2_de09_iftrue,
color1_MUX_uxn_c_l211_c2_de09_iffalse,
color1_MUX_uxn_c_l211_c2_de09_return_output);

-- color_cmp_0_MUX_uxn_c_l211_c2_de09
color_cmp_0_MUX_uxn_c_l211_c2_de09 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_cmp_0_MUX_uxn_c_l211_c2_de09_cond,
color_cmp_0_MUX_uxn_c_l211_c2_de09_iftrue,
color_cmp_0_MUX_uxn_c_l211_c2_de09_iffalse,
color_cmp_0_MUX_uxn_c_l211_c2_de09_return_output);

-- tmp12_MUX_uxn_c_l211_c2_de09
tmp12_MUX_uxn_c_l211_c2_de09 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_c_l211_c2_de09_cond,
tmp12_MUX_uxn_c_l211_c2_de09_iftrue,
tmp12_MUX_uxn_c_l211_c2_de09_iffalse,
tmp12_MUX_uxn_c_l211_c2_de09_return_output);

-- color2_MUX_uxn_c_l211_c2_de09
color2_MUX_uxn_c_l211_c2_de09 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color2_MUX_uxn_c_l211_c2_de09_cond,
color2_MUX_uxn_c_l211_c2_de09_iftrue,
color2_MUX_uxn_c_l211_c2_de09_iffalse,
color2_MUX_uxn_c_l211_c2_de09_return_output);

-- color3_MUX_uxn_c_l211_c2_de09
color3_MUX_uxn_c_l211_c2_de09 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color3_MUX_uxn_c_l211_c2_de09_cond,
color3_MUX_uxn_c_l211_c2_de09_iftrue,
color3_MUX_uxn_c_l211_c2_de09_iffalse,
color3_MUX_uxn_c_l211_c2_de09_return_output);

-- CONST_SR_4_uxn_c_l212_c27_a9a6
CONST_SR_4_uxn_c_l212_c27_a9a6 : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_c_l212_c27_a9a6_x,
CONST_SR_4_uxn_c_l212_c27_a9a6_return_output);

-- BIN_OP_EQ_uxn_c_l214_c7_01be
BIN_OP_EQ_uxn_c_l214_c7_01be : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l214_c7_01be_left,
BIN_OP_EQ_uxn_c_l214_c7_01be_right,
BIN_OP_EQ_uxn_c_l214_c7_01be_return_output);

-- color0_MUX_uxn_c_l214_c3_f4a2
color0_MUX_uxn_c_l214_c3_f4a2 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color0_MUX_uxn_c_l214_c3_f4a2_cond,
color0_MUX_uxn_c_l214_c3_f4a2_iftrue,
color0_MUX_uxn_c_l214_c3_f4a2_iffalse,
color0_MUX_uxn_c_l214_c3_f4a2_return_output);

-- color1_MUX_uxn_c_l214_c3_f4a2
color1_MUX_uxn_c_l214_c3_f4a2 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color1_MUX_uxn_c_l214_c3_f4a2_cond,
color1_MUX_uxn_c_l214_c3_f4a2_iftrue,
color1_MUX_uxn_c_l214_c3_f4a2_iffalse,
color1_MUX_uxn_c_l214_c3_f4a2_return_output);

-- tmp12_MUX_uxn_c_l214_c3_f4a2
tmp12_MUX_uxn_c_l214_c3_f4a2 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_c_l214_c3_f4a2_cond,
tmp12_MUX_uxn_c_l214_c3_f4a2_iftrue,
tmp12_MUX_uxn_c_l214_c3_f4a2_iffalse,
tmp12_MUX_uxn_c_l214_c3_f4a2_return_output);

-- color2_MUX_uxn_c_l214_c3_f4a2
color2_MUX_uxn_c_l214_c3_f4a2 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color2_MUX_uxn_c_l214_c3_f4a2_cond,
color2_MUX_uxn_c_l214_c3_f4a2_iftrue,
color2_MUX_uxn_c_l214_c3_f4a2_iffalse,
color2_MUX_uxn_c_l214_c3_f4a2_return_output);

-- color3_MUX_uxn_c_l214_c3_f4a2
color3_MUX_uxn_c_l214_c3_f4a2 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color3_MUX_uxn_c_l214_c3_f4a2_cond,
color3_MUX_uxn_c_l214_c3_f4a2_iftrue,
color3_MUX_uxn_c_l214_c3_f4a2_iffalse,
color3_MUX_uxn_c_l214_c3_f4a2_return_output);

-- CONST_SL_8_uxn_c_l216_c4_61ee
CONST_SL_8_uxn_c_l216_c4_61ee : entity work.CONST_SL_8_uint12_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l216_c4_61ee_x,
CONST_SL_8_uxn_c_l216_c4_61ee_return_output);

-- BIN_OP_AND_uxn_c_l217_c4_fe98
BIN_OP_AND_uxn_c_l217_c4_fe98 : entity work.BIN_OP_AND_uint12_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l217_c4_fe98_left,
BIN_OP_AND_uxn_c_l217_c4_fe98_right,
BIN_OP_AND_uxn_c_l217_c4_fe98_return_output);

-- BIN_OP_OR_uxn_c_l218_c4_a837
BIN_OP_OR_uxn_c_l218_c4_a837 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l218_c4_a837_left,
BIN_OP_OR_uxn_c_l218_c4_a837_right,
BIN_OP_OR_uxn_c_l218_c4_a837_return_output);

-- CONST_SL_8_uxn_c_l221_c4_dea1
CONST_SL_8_uxn_c_l221_c4_dea1 : entity work.CONST_SL_8_uint12_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l221_c4_dea1_x,
CONST_SL_8_uxn_c_l221_c4_dea1_return_output);

-- BIN_OP_AND_uxn_c_l222_c4_f224
BIN_OP_AND_uxn_c_l222_c4_f224 : entity work.BIN_OP_AND_uint12_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l222_c4_f224_left,
BIN_OP_AND_uxn_c_l222_c4_f224_right,
BIN_OP_AND_uxn_c_l222_c4_f224_return_output);

-- BIN_OP_OR_uxn_c_l223_c4_9e23
BIN_OP_OR_uxn_c_l223_c4_9e23 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l223_c4_9e23_left,
BIN_OP_OR_uxn_c_l223_c4_9e23_right,
BIN_OP_OR_uxn_c_l223_c4_9e23_return_output);

-- BIN_OP_EQ_uxn_c_l225_c12_9332
BIN_OP_EQ_uxn_c_l225_c12_9332 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l225_c12_9332_left,
BIN_OP_EQ_uxn_c_l225_c12_9332_right,
BIN_OP_EQ_uxn_c_l225_c12_9332_return_output);

-- color0_MUX_uxn_c_l225_c8_d86c
color0_MUX_uxn_c_l225_c8_d86c : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color0_MUX_uxn_c_l225_c8_d86c_cond,
color0_MUX_uxn_c_l225_c8_d86c_iftrue,
color0_MUX_uxn_c_l225_c8_d86c_iffalse,
color0_MUX_uxn_c_l225_c8_d86c_return_output);

-- color1_MUX_uxn_c_l225_c8_d86c
color1_MUX_uxn_c_l225_c8_d86c : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color1_MUX_uxn_c_l225_c8_d86c_cond,
color1_MUX_uxn_c_l225_c8_d86c_iftrue,
color1_MUX_uxn_c_l225_c8_d86c_iffalse,
color1_MUX_uxn_c_l225_c8_d86c_return_output);

-- tmp12_MUX_uxn_c_l225_c8_d86c
tmp12_MUX_uxn_c_l225_c8_d86c : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_c_l225_c8_d86c_cond,
tmp12_MUX_uxn_c_l225_c8_d86c_iftrue,
tmp12_MUX_uxn_c_l225_c8_d86c_iffalse,
tmp12_MUX_uxn_c_l225_c8_d86c_return_output);

-- color2_MUX_uxn_c_l225_c8_d86c
color2_MUX_uxn_c_l225_c8_d86c : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color2_MUX_uxn_c_l225_c8_d86c_cond,
color2_MUX_uxn_c_l225_c8_d86c_iftrue,
color2_MUX_uxn_c_l225_c8_d86c_iffalse,
color2_MUX_uxn_c_l225_c8_d86c_return_output);

-- color3_MUX_uxn_c_l225_c8_d86c
color3_MUX_uxn_c_l225_c8_d86c : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color3_MUX_uxn_c_l225_c8_d86c_cond,
color3_MUX_uxn_c_l225_c8_d86c_iftrue,
color3_MUX_uxn_c_l225_c8_d86c_iffalse,
color3_MUX_uxn_c_l225_c8_d86c_return_output);

-- CONST_SL_8_uxn_c_l227_c4_18f6
CONST_SL_8_uxn_c_l227_c4_18f6 : entity work.CONST_SL_8_uint12_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l227_c4_18f6_x,
CONST_SL_8_uxn_c_l227_c4_18f6_return_output);

-- BIN_OP_AND_uxn_c_l228_c4_f424
BIN_OP_AND_uxn_c_l228_c4_f424 : entity work.BIN_OP_AND_uint12_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l228_c4_f424_left,
BIN_OP_AND_uxn_c_l228_c4_f424_right,
BIN_OP_AND_uxn_c_l228_c4_f424_return_output);

-- BIN_OP_OR_uxn_c_l229_c4_1824
BIN_OP_OR_uxn_c_l229_c4_1824 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l229_c4_1824_left,
BIN_OP_OR_uxn_c_l229_c4_1824_right,
BIN_OP_OR_uxn_c_l229_c4_1824_return_output);

-- CONST_SL_8_uxn_c_l232_c4_cf26
CONST_SL_8_uxn_c_l232_c4_cf26 : entity work.CONST_SL_8_uint12_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l232_c4_cf26_x,
CONST_SL_8_uxn_c_l232_c4_cf26_return_output);

-- BIN_OP_AND_uxn_c_l233_c4_4b02
BIN_OP_AND_uxn_c_l233_c4_4b02 : entity work.BIN_OP_AND_uint12_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l233_c4_4b02_left,
BIN_OP_AND_uxn_c_l233_c4_4b02_right,
BIN_OP_AND_uxn_c_l233_c4_4b02_return_output);

-- BIN_OP_OR_uxn_c_l234_c4_1287
BIN_OP_OR_uxn_c_l234_c4_1287 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l234_c4_1287_left,
BIN_OP_OR_uxn_c_l234_c4_1287_right,
BIN_OP_OR_uxn_c_l234_c4_1287_return_output);

-- BIN_OP_EQ_uxn_c_l236_c12_63c0
BIN_OP_EQ_uxn_c_l236_c12_63c0 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l236_c12_63c0_left,
BIN_OP_EQ_uxn_c_l236_c12_63c0_right,
BIN_OP_EQ_uxn_c_l236_c12_63c0_return_output);

-- color0_MUX_uxn_c_l236_c8_aed9
color0_MUX_uxn_c_l236_c8_aed9 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color0_MUX_uxn_c_l236_c8_aed9_cond,
color0_MUX_uxn_c_l236_c8_aed9_iftrue,
color0_MUX_uxn_c_l236_c8_aed9_iffalse,
color0_MUX_uxn_c_l236_c8_aed9_return_output);

-- color1_MUX_uxn_c_l236_c8_aed9
color1_MUX_uxn_c_l236_c8_aed9 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color1_MUX_uxn_c_l236_c8_aed9_cond,
color1_MUX_uxn_c_l236_c8_aed9_iftrue,
color1_MUX_uxn_c_l236_c8_aed9_iffalse,
color1_MUX_uxn_c_l236_c8_aed9_return_output);

-- tmp12_MUX_uxn_c_l236_c8_aed9
tmp12_MUX_uxn_c_l236_c8_aed9 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_c_l236_c8_aed9_cond,
tmp12_MUX_uxn_c_l236_c8_aed9_iftrue,
tmp12_MUX_uxn_c_l236_c8_aed9_iffalse,
tmp12_MUX_uxn_c_l236_c8_aed9_return_output);

-- color2_MUX_uxn_c_l236_c8_aed9
color2_MUX_uxn_c_l236_c8_aed9 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color2_MUX_uxn_c_l236_c8_aed9_cond,
color2_MUX_uxn_c_l236_c8_aed9_iftrue,
color2_MUX_uxn_c_l236_c8_aed9_iffalse,
color2_MUX_uxn_c_l236_c8_aed9_return_output);

-- color3_MUX_uxn_c_l236_c8_aed9
color3_MUX_uxn_c_l236_c8_aed9 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color3_MUX_uxn_c_l236_c8_aed9_cond,
color3_MUX_uxn_c_l236_c8_aed9_iftrue,
color3_MUX_uxn_c_l236_c8_aed9_iffalse,
color3_MUX_uxn_c_l236_c8_aed9_return_output);

-- CONST_SL_4_uxn_c_l238_c4_ac70
CONST_SL_4_uxn_c_l238_c4_ac70 : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_c_l238_c4_ac70_x,
CONST_SL_4_uxn_c_l238_c4_ac70_return_output);

-- BIN_OP_AND_uxn_c_l239_c4_6e62
BIN_OP_AND_uxn_c_l239_c4_6e62 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l239_c4_6e62_left,
BIN_OP_AND_uxn_c_l239_c4_6e62_right,
BIN_OP_AND_uxn_c_l239_c4_6e62_return_output);

-- BIN_OP_OR_uxn_c_l240_c4_d997
BIN_OP_OR_uxn_c_l240_c4_d997 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l240_c4_d997_left,
BIN_OP_OR_uxn_c_l240_c4_d997_right,
BIN_OP_OR_uxn_c_l240_c4_d997_return_output);

-- CONST_SL_4_uxn_c_l243_c4_b7b8
CONST_SL_4_uxn_c_l243_c4_b7b8 : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_c_l243_c4_b7b8_x,
CONST_SL_4_uxn_c_l243_c4_b7b8_return_output);

-- BIN_OP_AND_uxn_c_l244_c4_d2de
BIN_OP_AND_uxn_c_l244_c4_d2de : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l244_c4_d2de_left,
BIN_OP_AND_uxn_c_l244_c4_d2de_right,
BIN_OP_AND_uxn_c_l244_c4_d2de_return_output);

-- BIN_OP_OR_uxn_c_l245_c4_7154
BIN_OP_OR_uxn_c_l245_c4_7154 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l245_c4_7154_left,
BIN_OP_OR_uxn_c_l245_c4_7154_right,
BIN_OP_OR_uxn_c_l245_c4_7154_return_output);

-- BIN_OP_EQ_uxn_c_l247_c12_4807
BIN_OP_EQ_uxn_c_l247_c12_4807 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l247_c12_4807_left,
BIN_OP_EQ_uxn_c_l247_c12_4807_right,
BIN_OP_EQ_uxn_c_l247_c12_4807_return_output);

-- color0_MUX_uxn_c_l247_c8_37e5
color0_MUX_uxn_c_l247_c8_37e5 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color0_MUX_uxn_c_l247_c8_37e5_cond,
color0_MUX_uxn_c_l247_c8_37e5_iftrue,
color0_MUX_uxn_c_l247_c8_37e5_iffalse,
color0_MUX_uxn_c_l247_c8_37e5_return_output);

-- color1_MUX_uxn_c_l247_c8_37e5
color1_MUX_uxn_c_l247_c8_37e5 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color1_MUX_uxn_c_l247_c8_37e5_cond,
color1_MUX_uxn_c_l247_c8_37e5_iftrue,
color1_MUX_uxn_c_l247_c8_37e5_iffalse,
color1_MUX_uxn_c_l247_c8_37e5_return_output);

-- tmp12_MUX_uxn_c_l247_c8_37e5
tmp12_MUX_uxn_c_l247_c8_37e5 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_c_l247_c8_37e5_cond,
tmp12_MUX_uxn_c_l247_c8_37e5_iftrue,
tmp12_MUX_uxn_c_l247_c8_37e5_iffalse,
tmp12_MUX_uxn_c_l247_c8_37e5_return_output);

-- color2_MUX_uxn_c_l247_c8_37e5
color2_MUX_uxn_c_l247_c8_37e5 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color2_MUX_uxn_c_l247_c8_37e5_cond,
color2_MUX_uxn_c_l247_c8_37e5_iftrue,
color2_MUX_uxn_c_l247_c8_37e5_iffalse,
color2_MUX_uxn_c_l247_c8_37e5_return_output);

-- color3_MUX_uxn_c_l247_c8_37e5
color3_MUX_uxn_c_l247_c8_37e5 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color3_MUX_uxn_c_l247_c8_37e5_cond,
color3_MUX_uxn_c_l247_c8_37e5_iftrue,
color3_MUX_uxn_c_l247_c8_37e5_iffalse,
color3_MUX_uxn_c_l247_c8_37e5_return_output);

-- CONST_SL_4_uxn_c_l249_c4_5a70
CONST_SL_4_uxn_c_l249_c4_5a70 : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_c_l249_c4_5a70_x,
CONST_SL_4_uxn_c_l249_c4_5a70_return_output);

-- BIN_OP_AND_uxn_c_l250_c4_6dc6
BIN_OP_AND_uxn_c_l250_c4_6dc6 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l250_c4_6dc6_left,
BIN_OP_AND_uxn_c_l250_c4_6dc6_right,
BIN_OP_AND_uxn_c_l250_c4_6dc6_return_output);

-- BIN_OP_OR_uxn_c_l251_c4_811a
BIN_OP_OR_uxn_c_l251_c4_811a : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l251_c4_811a_left,
BIN_OP_OR_uxn_c_l251_c4_811a_right,
BIN_OP_OR_uxn_c_l251_c4_811a_return_output);

-- CONST_SL_4_uxn_c_l254_c4_d230
CONST_SL_4_uxn_c_l254_c4_d230 : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_c_l254_c4_d230_x,
CONST_SL_4_uxn_c_l254_c4_d230_return_output);

-- BIN_OP_AND_uxn_c_l255_c4_6410
BIN_OP_AND_uxn_c_l255_c4_6410 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l255_c4_6410_left,
BIN_OP_AND_uxn_c_l255_c4_6410_right,
BIN_OP_AND_uxn_c_l255_c4_6410_return_output);

-- BIN_OP_OR_uxn_c_l256_c4_baa9
BIN_OP_OR_uxn_c_l256_c4_baa9 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l256_c4_baa9_left,
BIN_OP_OR_uxn_c_l256_c4_baa9_right,
BIN_OP_OR_uxn_c_l256_c4_baa9_return_output);

-- BIN_OP_EQ_uxn_c_l258_c12_99fd
BIN_OP_EQ_uxn_c_l258_c12_99fd : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l258_c12_99fd_left,
BIN_OP_EQ_uxn_c_l258_c12_99fd_right,
BIN_OP_EQ_uxn_c_l258_c12_99fd_return_output);

-- color0_MUX_uxn_c_l258_c8_3c5b
color0_MUX_uxn_c_l258_c8_3c5b : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color0_MUX_uxn_c_l258_c8_3c5b_cond,
color0_MUX_uxn_c_l258_c8_3c5b_iftrue,
color0_MUX_uxn_c_l258_c8_3c5b_iffalse,
color0_MUX_uxn_c_l258_c8_3c5b_return_output);

-- color1_MUX_uxn_c_l258_c8_3c5b
color1_MUX_uxn_c_l258_c8_3c5b : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color1_MUX_uxn_c_l258_c8_3c5b_cond,
color1_MUX_uxn_c_l258_c8_3c5b_iftrue,
color1_MUX_uxn_c_l258_c8_3c5b_iffalse,
color1_MUX_uxn_c_l258_c8_3c5b_return_output);

-- tmp12_MUX_uxn_c_l258_c8_3c5b
tmp12_MUX_uxn_c_l258_c8_3c5b : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_c_l258_c8_3c5b_cond,
tmp12_MUX_uxn_c_l258_c8_3c5b_iftrue,
tmp12_MUX_uxn_c_l258_c8_3c5b_iffalse,
tmp12_MUX_uxn_c_l258_c8_3c5b_return_output);

-- color2_MUX_uxn_c_l258_c8_3c5b
color2_MUX_uxn_c_l258_c8_3c5b : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color2_MUX_uxn_c_l258_c8_3c5b_cond,
color2_MUX_uxn_c_l258_c8_3c5b_iftrue,
color2_MUX_uxn_c_l258_c8_3c5b_iffalse,
color2_MUX_uxn_c_l258_c8_3c5b_return_output);

-- color3_MUX_uxn_c_l258_c8_3c5b
color3_MUX_uxn_c_l258_c8_3c5b : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color3_MUX_uxn_c_l258_c8_3c5b_cond,
color3_MUX_uxn_c_l258_c8_3c5b_iftrue,
color3_MUX_uxn_c_l258_c8_3c5b_iffalse,
color3_MUX_uxn_c_l258_c8_3c5b_return_output);

-- BIN_OP_AND_uxn_c_l260_c4_0e97
BIN_OP_AND_uxn_c_l260_c4_0e97 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l260_c4_0e97_left,
BIN_OP_AND_uxn_c_l260_c4_0e97_right,
BIN_OP_AND_uxn_c_l260_c4_0e97_return_output);

-- BIN_OP_OR_uxn_c_l261_c4_1a63
BIN_OP_OR_uxn_c_l261_c4_1a63 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l261_c4_1a63_left,
BIN_OP_OR_uxn_c_l261_c4_1a63_right,
BIN_OP_OR_uxn_c_l261_c4_1a63_return_output);

-- BIN_OP_AND_uxn_c_l264_c4_fc72
BIN_OP_AND_uxn_c_l264_c4_fc72 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l264_c4_fc72_left,
BIN_OP_AND_uxn_c_l264_c4_fc72_right,
BIN_OP_AND_uxn_c_l264_c4_fc72_return_output);

-- BIN_OP_OR_uxn_c_l265_c4_6d8e
BIN_OP_OR_uxn_c_l265_c4_6d8e : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l265_c4_6d8e_left,
BIN_OP_OR_uxn_c_l265_c4_6d8e_right,
BIN_OP_OR_uxn_c_l265_c4_6d8e_return_output);

-- BIN_OP_EQ_uxn_c_l267_c12_efc8
BIN_OP_EQ_uxn_c_l267_c12_efc8 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l267_c12_efc8_left,
BIN_OP_EQ_uxn_c_l267_c12_efc8_right,
BIN_OP_EQ_uxn_c_l267_c12_efc8_return_output);

-- tmp12_MUX_uxn_c_l267_c8_4856
tmp12_MUX_uxn_c_l267_c8_4856 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_c_l267_c8_4856_cond,
tmp12_MUX_uxn_c_l267_c8_4856_iftrue,
tmp12_MUX_uxn_c_l267_c8_4856_iffalse,
tmp12_MUX_uxn_c_l267_c8_4856_return_output);

-- color2_MUX_uxn_c_l267_c8_4856
color2_MUX_uxn_c_l267_c8_4856 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color2_MUX_uxn_c_l267_c8_4856_cond,
color2_MUX_uxn_c_l267_c8_4856_iftrue,
color2_MUX_uxn_c_l267_c8_4856_iffalse,
color2_MUX_uxn_c_l267_c8_4856_return_output);

-- color3_MUX_uxn_c_l267_c8_4856
color3_MUX_uxn_c_l267_c8_4856 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color3_MUX_uxn_c_l267_c8_4856_cond,
color3_MUX_uxn_c_l267_c8_4856_iftrue,
color3_MUX_uxn_c_l267_c8_4856_iffalse,
color3_MUX_uxn_c_l267_c8_4856_return_output);

-- BIN_OP_AND_uxn_c_l269_c4_01ab
BIN_OP_AND_uxn_c_l269_c4_01ab : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l269_c4_01ab_left,
BIN_OP_AND_uxn_c_l269_c4_01ab_right,
BIN_OP_AND_uxn_c_l269_c4_01ab_return_output);

-- BIN_OP_OR_uxn_c_l270_c4_3a6c
BIN_OP_OR_uxn_c_l270_c4_3a6c : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l270_c4_3a6c_left,
BIN_OP_OR_uxn_c_l270_c4_3a6c_right,
BIN_OP_OR_uxn_c_l270_c4_3a6c_return_output);

-- BIN_OP_AND_uxn_c_l273_c4_979f
BIN_OP_AND_uxn_c_l273_c4_979f : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l273_c4_979f_left,
BIN_OP_AND_uxn_c_l273_c4_979f_right,
BIN_OP_AND_uxn_c_l273_c4_979f_return_output);

-- BIN_OP_OR_uxn_c_l274_c4_68cf
BIN_OP_OR_uxn_c_l274_c4_68cf : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l274_c4_68cf_left,
BIN_OP_OR_uxn_c_l274_c4_68cf_right,
BIN_OP_OR_uxn_c_l274_c4_68cf_return_output);

-- BIN_OP_EQ_uxn_c_l278_c6_56e7
BIN_OP_EQ_uxn_c_l278_c6_56e7 : entity work.BIN_OP_EQ_uint2_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l278_c6_56e7_left,
BIN_OP_EQ_uxn_c_l278_c6_56e7_right,
BIN_OP_EQ_uxn_c_l278_c6_56e7_return_output);

-- result_MUX_uxn_c_l278_c2_508f
result_MUX_uxn_c_l278_c2_508f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_MUX_uxn_c_l278_c2_508f_cond,
result_MUX_uxn_c_l278_c2_508f_iftrue,
result_MUX_uxn_c_l278_c2_508f_iffalse,
result_MUX_uxn_c_l278_c2_508f_return_output);

-- BIN_OP_EQ_uxn_c_l280_c13_e06f
BIN_OP_EQ_uxn_c_l280_c13_e06f : entity work.BIN_OP_EQ_uint2_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l280_c13_e06f_left,
BIN_OP_EQ_uxn_c_l280_c13_e06f_right,
BIN_OP_EQ_uxn_c_l280_c13_e06f_return_output);

-- result_MUX_uxn_c_l280_c9_4116
result_MUX_uxn_c_l280_c9_4116 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_MUX_uxn_c_l280_c9_4116_cond,
result_MUX_uxn_c_l280_c9_4116_iftrue,
result_MUX_uxn_c_l280_c9_4116_iffalse,
result_MUX_uxn_c_l280_c9_4116_return_output);

-- BIN_OP_EQ_uxn_c_l282_c13_03cf
BIN_OP_EQ_uxn_c_l282_c13_03cf : entity work.BIN_OP_EQ_uint2_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l282_c13_03cf_left,
BIN_OP_EQ_uxn_c_l282_c13_03cf_right,
BIN_OP_EQ_uxn_c_l282_c13_03cf_return_output);

-- result_MUX_uxn_c_l282_c9_87ca
result_MUX_uxn_c_l282_c9_87ca : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_MUX_uxn_c_l282_c9_87ca_cond,
result_MUX_uxn_c_l282_c9_87ca_iftrue,
result_MUX_uxn_c_l282_c9_87ca_iffalse,
result_MUX_uxn_c_l282_c9_87ca_return_output);



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
 color_cmp_1_MUX_uxn_c_l211_c2_de09_return_output,
 color0_MUX_uxn_c_l211_c2_de09_return_output,
 color1_MUX_uxn_c_l211_c2_de09_return_output,
 color_cmp_0_MUX_uxn_c_l211_c2_de09_return_output,
 tmp12_MUX_uxn_c_l211_c2_de09_return_output,
 color2_MUX_uxn_c_l211_c2_de09_return_output,
 color3_MUX_uxn_c_l211_c2_de09_return_output,
 CONST_SR_4_uxn_c_l212_c27_a9a6_return_output,
 BIN_OP_EQ_uxn_c_l214_c7_01be_return_output,
 color0_MUX_uxn_c_l214_c3_f4a2_return_output,
 color1_MUX_uxn_c_l214_c3_f4a2_return_output,
 tmp12_MUX_uxn_c_l214_c3_f4a2_return_output,
 color2_MUX_uxn_c_l214_c3_f4a2_return_output,
 color3_MUX_uxn_c_l214_c3_f4a2_return_output,
 CONST_SL_8_uxn_c_l216_c4_61ee_return_output,
 BIN_OP_AND_uxn_c_l217_c4_fe98_return_output,
 BIN_OP_OR_uxn_c_l218_c4_a837_return_output,
 CONST_SL_8_uxn_c_l221_c4_dea1_return_output,
 BIN_OP_AND_uxn_c_l222_c4_f224_return_output,
 BIN_OP_OR_uxn_c_l223_c4_9e23_return_output,
 BIN_OP_EQ_uxn_c_l225_c12_9332_return_output,
 color0_MUX_uxn_c_l225_c8_d86c_return_output,
 color1_MUX_uxn_c_l225_c8_d86c_return_output,
 tmp12_MUX_uxn_c_l225_c8_d86c_return_output,
 color2_MUX_uxn_c_l225_c8_d86c_return_output,
 color3_MUX_uxn_c_l225_c8_d86c_return_output,
 CONST_SL_8_uxn_c_l227_c4_18f6_return_output,
 BIN_OP_AND_uxn_c_l228_c4_f424_return_output,
 BIN_OP_OR_uxn_c_l229_c4_1824_return_output,
 CONST_SL_8_uxn_c_l232_c4_cf26_return_output,
 BIN_OP_AND_uxn_c_l233_c4_4b02_return_output,
 BIN_OP_OR_uxn_c_l234_c4_1287_return_output,
 BIN_OP_EQ_uxn_c_l236_c12_63c0_return_output,
 color0_MUX_uxn_c_l236_c8_aed9_return_output,
 color1_MUX_uxn_c_l236_c8_aed9_return_output,
 tmp12_MUX_uxn_c_l236_c8_aed9_return_output,
 color2_MUX_uxn_c_l236_c8_aed9_return_output,
 color3_MUX_uxn_c_l236_c8_aed9_return_output,
 CONST_SL_4_uxn_c_l238_c4_ac70_return_output,
 BIN_OP_AND_uxn_c_l239_c4_6e62_return_output,
 BIN_OP_OR_uxn_c_l240_c4_d997_return_output,
 CONST_SL_4_uxn_c_l243_c4_b7b8_return_output,
 BIN_OP_AND_uxn_c_l244_c4_d2de_return_output,
 BIN_OP_OR_uxn_c_l245_c4_7154_return_output,
 BIN_OP_EQ_uxn_c_l247_c12_4807_return_output,
 color0_MUX_uxn_c_l247_c8_37e5_return_output,
 color1_MUX_uxn_c_l247_c8_37e5_return_output,
 tmp12_MUX_uxn_c_l247_c8_37e5_return_output,
 color2_MUX_uxn_c_l247_c8_37e5_return_output,
 color3_MUX_uxn_c_l247_c8_37e5_return_output,
 CONST_SL_4_uxn_c_l249_c4_5a70_return_output,
 BIN_OP_AND_uxn_c_l250_c4_6dc6_return_output,
 BIN_OP_OR_uxn_c_l251_c4_811a_return_output,
 CONST_SL_4_uxn_c_l254_c4_d230_return_output,
 BIN_OP_AND_uxn_c_l255_c4_6410_return_output,
 BIN_OP_OR_uxn_c_l256_c4_baa9_return_output,
 BIN_OP_EQ_uxn_c_l258_c12_99fd_return_output,
 color0_MUX_uxn_c_l258_c8_3c5b_return_output,
 color1_MUX_uxn_c_l258_c8_3c5b_return_output,
 tmp12_MUX_uxn_c_l258_c8_3c5b_return_output,
 color2_MUX_uxn_c_l258_c8_3c5b_return_output,
 color3_MUX_uxn_c_l258_c8_3c5b_return_output,
 BIN_OP_AND_uxn_c_l260_c4_0e97_return_output,
 BIN_OP_OR_uxn_c_l261_c4_1a63_return_output,
 BIN_OP_AND_uxn_c_l264_c4_fc72_return_output,
 BIN_OP_OR_uxn_c_l265_c4_6d8e_return_output,
 BIN_OP_EQ_uxn_c_l267_c12_efc8_return_output,
 tmp12_MUX_uxn_c_l267_c8_4856_return_output,
 color2_MUX_uxn_c_l267_c8_4856_return_output,
 color3_MUX_uxn_c_l267_c8_4856_return_output,
 BIN_OP_AND_uxn_c_l269_c4_01ab_return_output,
 BIN_OP_OR_uxn_c_l270_c4_3a6c_return_output,
 BIN_OP_AND_uxn_c_l273_c4_979f_return_output,
 BIN_OP_OR_uxn_c_l274_c4_68cf_return_output,
 BIN_OP_EQ_uxn_c_l278_c6_56e7_return_output,
 result_MUX_uxn_c_l278_c2_508f_return_output,
 BIN_OP_EQ_uxn_c_l280_c13_e06f_return_output,
 result_MUX_uxn_c_l280_c9_4116_return_output,
 BIN_OP_EQ_uxn_c_l282_c13_03cf_return_output,
 result_MUX_uxn_c_l282_c9_87ca_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_device_ram_address : unsigned(7 downto 0);
 variable VAR_device_ram_value : unsigned(7 downto 0);
 variable VAR_is_device_ram_write : unsigned(0 downto 0);
 variable VAR_gpu_step_color : unsigned(1 downto 0);
 variable VAR_color_cmp_1_MUX_uxn_c_l211_c2_de09_iftrue : unsigned(3 downto 0);
 variable VAR_color_cmp_1_uxn_c_l213_c3_12a5 : unsigned(3 downto 0);
 variable VAR_color_cmp_1_MUX_uxn_c_l211_c2_de09_iffalse : unsigned(3 downto 0);
 variable VAR_color_cmp_1_MUX_uxn_c_l211_c2_de09_return_output : unsigned(3 downto 0);
 variable VAR_color_cmp_1_MUX_uxn_c_l211_c2_de09_cond : unsigned(0 downto 0);
 variable VAR_color0_MUX_uxn_c_l211_c2_de09_iftrue : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l214_c3_f4a2_return_output : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l211_c2_de09_iffalse : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l211_c2_de09_return_output : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l211_c2_de09_cond : unsigned(0 downto 0);
 variable VAR_color1_MUX_uxn_c_l211_c2_de09_iftrue : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l214_c3_f4a2_return_output : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l211_c2_de09_iffalse : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l211_c2_de09_return_output : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l211_c2_de09_cond : unsigned(0 downto 0);
 variable VAR_color_cmp_0_MUX_uxn_c_l211_c2_de09_iftrue : unsigned(3 downto 0);
 variable VAR_color_cmp_0_uxn_c_l212_c3_1f30 : unsigned(3 downto 0);
 variable VAR_color_cmp_0_MUX_uxn_c_l211_c2_de09_iffalse : unsigned(3 downto 0);
 variable VAR_color_cmp_0_MUX_uxn_c_l211_c2_de09_return_output : unsigned(3 downto 0);
 variable VAR_color_cmp_0_MUX_uxn_c_l211_c2_de09_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l211_c2_de09_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l214_c3_f4a2_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l211_c2_de09_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l211_c2_de09_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l211_c2_de09_cond : unsigned(0 downto 0);
 variable VAR_color2_MUX_uxn_c_l211_c2_de09_iftrue : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l214_c3_f4a2_return_output : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l211_c2_de09_iffalse : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l211_c2_de09_return_output : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l211_c2_de09_cond : unsigned(0 downto 0);
 variable VAR_color3_MUX_uxn_c_l211_c2_de09_iftrue : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l214_c3_f4a2_return_output : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l211_c2_de09_iffalse : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l211_c2_de09_return_output : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l211_c2_de09_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_4_uxn_c_l212_c27_a9a6_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_c_l212_c27_a9a6_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_c_l212_c17_eab8_return_output : unsigned(3 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_c_l213_c17_dcba_return_output : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l214_c7_01be_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l214_c7_01be_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l214_c7_01be_return_output : unsigned(0 downto 0);
 variable VAR_color0_MUX_uxn_c_l214_c3_f4a2_iftrue : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l214_c3_f4a2_iffalse : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l225_c8_d86c_return_output : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l214_c3_f4a2_cond : unsigned(0 downto 0);
 variable VAR_color1_MUX_uxn_c_l214_c3_f4a2_iftrue : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l214_c3_f4a2_iffalse : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l225_c8_d86c_return_output : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l214_c3_f4a2_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l214_c3_f4a2_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l214_c3_f4a2_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l225_c8_d86c_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l214_c3_f4a2_cond : unsigned(0 downto 0);
 variable VAR_color2_MUX_uxn_c_l214_c3_f4a2_iftrue : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l214_c3_f4a2_iffalse : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l225_c8_d86c_return_output : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l214_c3_f4a2_cond : unsigned(0 downto 0);
 variable VAR_color3_MUX_uxn_c_l214_c3_f4a2_iftrue : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l214_c3_f4a2_iffalse : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l225_c8_d86c_return_output : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l214_c3_f4a2_cond : unsigned(0 downto 0);
 variable VAR_tmp12_uxn_c_l215_c4_74c0 : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l216_c4_61ee_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l216_c4_61ee_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l217_c4_fe98_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l217_c4_fe98_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l217_c4_fe98_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l218_c4_a837_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l218_c4_a837_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l218_c4_a837_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_uxn_c_l220_c4_25d0 : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l221_c4_dea1_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l221_c4_dea1_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l222_c4_f224_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l222_c4_f224_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l222_c4_f224_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l223_c4_9e23_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l223_c4_9e23_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l223_c4_9e23_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l225_c12_9332_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l225_c12_9332_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l225_c12_9332_return_output : unsigned(0 downto 0);
 variable VAR_color0_MUX_uxn_c_l225_c8_d86c_iftrue : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l225_c8_d86c_iffalse : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l236_c8_aed9_return_output : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l225_c8_d86c_cond : unsigned(0 downto 0);
 variable VAR_color1_MUX_uxn_c_l225_c8_d86c_iftrue : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l225_c8_d86c_iffalse : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l236_c8_aed9_return_output : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l225_c8_d86c_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l225_c8_d86c_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l225_c8_d86c_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l236_c8_aed9_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l225_c8_d86c_cond : unsigned(0 downto 0);
 variable VAR_color2_MUX_uxn_c_l225_c8_d86c_iftrue : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l225_c8_d86c_iffalse : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l236_c8_aed9_return_output : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l225_c8_d86c_cond : unsigned(0 downto 0);
 variable VAR_color3_MUX_uxn_c_l225_c8_d86c_iftrue : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l225_c8_d86c_iffalse : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l236_c8_aed9_return_output : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l225_c8_d86c_cond : unsigned(0 downto 0);
 variable VAR_tmp12_uxn_c_l226_c4_a0d5 : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l227_c4_18f6_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l227_c4_18f6_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l228_c4_f424_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l228_c4_f424_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l228_c4_f424_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l229_c4_1824_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l229_c4_1824_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l229_c4_1824_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_uxn_c_l231_c4_b57c : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l232_c4_cf26_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l232_c4_cf26_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l233_c4_4b02_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l233_c4_4b02_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l233_c4_4b02_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l234_c4_1287_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l234_c4_1287_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l234_c4_1287_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l236_c12_63c0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l236_c12_63c0_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l236_c12_63c0_return_output : unsigned(0 downto 0);
 variable VAR_color0_MUX_uxn_c_l236_c8_aed9_iftrue : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l236_c8_aed9_iffalse : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l247_c8_37e5_return_output : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l236_c8_aed9_cond : unsigned(0 downto 0);
 variable VAR_color1_MUX_uxn_c_l236_c8_aed9_iftrue : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l236_c8_aed9_iffalse : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l247_c8_37e5_return_output : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l236_c8_aed9_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l236_c8_aed9_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l236_c8_aed9_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l247_c8_37e5_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l236_c8_aed9_cond : unsigned(0 downto 0);
 variable VAR_color2_MUX_uxn_c_l236_c8_aed9_iftrue : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l236_c8_aed9_iffalse : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l247_c8_37e5_return_output : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l236_c8_aed9_cond : unsigned(0 downto 0);
 variable VAR_color3_MUX_uxn_c_l236_c8_aed9_iftrue : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l236_c8_aed9_iffalse : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l247_c8_37e5_return_output : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l236_c8_aed9_cond : unsigned(0 downto 0);
 variable VAR_tmp12_uxn_c_l237_c4_fc57 : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l238_c4_ac70_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l238_c4_ac70_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l239_c4_6e62_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l239_c4_6e62_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l239_c4_6e62_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l240_c4_d997_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l240_c4_d997_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l240_c4_d997_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_uxn_c_l242_c4_586e : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l243_c4_b7b8_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l243_c4_b7b8_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l244_c4_d2de_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l244_c4_d2de_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l244_c4_d2de_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l245_c4_7154_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l245_c4_7154_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l245_c4_7154_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l247_c12_4807_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l247_c12_4807_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l247_c12_4807_return_output : unsigned(0 downto 0);
 variable VAR_color0_MUX_uxn_c_l247_c8_37e5_iftrue : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l247_c8_37e5_iffalse : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l258_c8_3c5b_return_output : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l247_c8_37e5_cond : unsigned(0 downto 0);
 variable VAR_color1_MUX_uxn_c_l247_c8_37e5_iftrue : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l247_c8_37e5_iffalse : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l258_c8_3c5b_return_output : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l247_c8_37e5_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l247_c8_37e5_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l247_c8_37e5_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l258_c8_3c5b_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l247_c8_37e5_cond : unsigned(0 downto 0);
 variable VAR_color2_MUX_uxn_c_l247_c8_37e5_iftrue : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l247_c8_37e5_iffalse : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l258_c8_3c5b_return_output : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l247_c8_37e5_cond : unsigned(0 downto 0);
 variable VAR_color3_MUX_uxn_c_l247_c8_37e5_iftrue : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l247_c8_37e5_iffalse : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l258_c8_3c5b_return_output : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l247_c8_37e5_cond : unsigned(0 downto 0);
 variable VAR_tmp12_uxn_c_l248_c4_d956 : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l249_c4_5a70_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l249_c4_5a70_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l250_c4_6dc6_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l250_c4_6dc6_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l250_c4_6dc6_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l251_c4_811a_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l251_c4_811a_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l251_c4_811a_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_uxn_c_l253_c4_1691 : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l254_c4_d230_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l254_c4_d230_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l255_c4_6410_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l255_c4_6410_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l255_c4_6410_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l256_c4_baa9_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l256_c4_baa9_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l256_c4_baa9_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l258_c12_99fd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l258_c12_99fd_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l258_c12_99fd_return_output : unsigned(0 downto 0);
 variable VAR_color0_MUX_uxn_c_l258_c8_3c5b_iftrue : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l258_c8_3c5b_iffalse : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l258_c8_3c5b_cond : unsigned(0 downto 0);
 variable VAR_color1_MUX_uxn_c_l258_c8_3c5b_iftrue : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l258_c8_3c5b_iffalse : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l258_c8_3c5b_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l258_c8_3c5b_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l258_c8_3c5b_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l267_c8_4856_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l258_c8_3c5b_cond : unsigned(0 downto 0);
 variable VAR_color2_MUX_uxn_c_l258_c8_3c5b_iftrue : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l258_c8_3c5b_iffalse : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l267_c8_4856_return_output : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l258_c8_3c5b_cond : unsigned(0 downto 0);
 variable VAR_color3_MUX_uxn_c_l258_c8_3c5b_iftrue : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l258_c8_3c5b_iffalse : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l267_c8_4856_return_output : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l258_c8_3c5b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l260_c4_0e97_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l260_c4_0e97_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l260_c4_0e97_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l261_c4_1a63_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l261_c4_1a63_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l261_c4_1a63_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l264_c4_fc72_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l264_c4_fc72_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l264_c4_fc72_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l265_c4_6d8e_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l265_c4_6d8e_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l265_c4_6d8e_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l267_c12_efc8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l267_c12_efc8_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l267_c12_efc8_return_output : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l267_c8_4856_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l267_c8_4856_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l267_c8_4856_cond : unsigned(0 downto 0);
 variable VAR_color2_MUX_uxn_c_l267_c8_4856_iftrue : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l267_c8_4856_iffalse : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l267_c8_4856_cond : unsigned(0 downto 0);
 variable VAR_color3_MUX_uxn_c_l267_c8_4856_iftrue : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l267_c8_4856_iffalse : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l267_c8_4856_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l269_c4_01ab_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l269_c4_01ab_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l269_c4_01ab_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l270_c4_3a6c_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l270_c4_3a6c_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l270_c4_3a6c_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l273_c4_979f_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l273_c4_979f_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l273_c4_979f_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l274_c4_68cf_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l274_c4_68cf_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l274_c4_68cf_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l278_c6_56e7_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l278_c6_56e7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l278_c6_56e7_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_c_l278_c2_508f_iftrue : unsigned(15 downto 0);
 variable VAR_result_uxn_c_l279_c3_4ffb : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l278_c2_508f_iffalse : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l280_c9_4116_return_output : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l278_c2_508f_return_output : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l278_c2_508f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l280_c13_e06f_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l280_c13_e06f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l280_c13_e06f_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_c_l280_c9_4116_iftrue : unsigned(15 downto 0);
 variable VAR_result_uxn_c_l281_c3_dbdf : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l280_c9_4116_iffalse : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l282_c9_87ca_return_output : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l280_c9_4116_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l282_c13_03cf_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l282_c13_03cf_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l282_c13_03cf_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_c_l282_c9_87ca_iftrue : unsigned(15 downto 0);
 variable VAR_result_uxn_c_l283_c3_6080 : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l282_c9_87ca_iffalse : unsigned(15 downto 0);
 variable VAR_result_uxn_c_l285_c3_eb40 : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l282_c9_87ca_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l259_l268_DUPLICATE_5a1a_return_output : unsigned(11 downto 0);
 variable VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l272_l263_DUPLICATE_cc5c_return_output : unsigned(11 downto 0);
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
     VAR_BIN_OP_EQ_uxn_c_l247_c12_4807_right := to_unsigned(11, 4);
     VAR_BIN_OP_AND_uxn_c_l228_c4_f424_right := to_unsigned(255, 8);
     VAR_BIN_OP_EQ_uxn_c_l225_c12_9332_right := to_unsigned(9, 4);
     VAR_BIN_OP_AND_uxn_c_l264_c4_fc72_right := to_unsigned(4080, 12);
     VAR_BIN_OP_AND_uxn_c_l255_c4_6410_right := to_unsigned(3855, 12);
     VAR_BIN_OP_EQ_uxn_c_l280_c13_e06f_right := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_c_l260_c4_0e97_right := to_unsigned(4080, 12);
     VAR_BIN_OP_AND_uxn_c_l217_c4_fe98_right := to_unsigned(255, 8);
     VAR_BIN_OP_AND_uxn_c_l239_c4_6e62_right := to_unsigned(3855, 12);
     VAR_BIN_OP_EQ_uxn_c_l282_c13_03cf_right := to_unsigned(2, 2);
     VAR_BIN_OP_AND_uxn_c_l222_c4_f224_right := to_unsigned(255, 8);
     VAR_BIN_OP_EQ_uxn_c_l236_c12_63c0_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_c_l214_c7_01be_right := to_unsigned(8, 4);
     VAR_BIN_OP_AND_uxn_c_l250_c4_6dc6_right := to_unsigned(3855, 12);
     VAR_BIN_OP_AND_uxn_c_l244_c4_d2de_right := to_unsigned(3855, 12);
     VAR_BIN_OP_EQ_uxn_c_l258_c12_99fd_right := to_unsigned(12, 4);
     VAR_BIN_OP_EQ_uxn_c_l278_c6_56e7_right := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_c_l233_c4_4b02_right := to_unsigned(255, 8);
     VAR_BIN_OP_AND_uxn_c_l273_c4_979f_right := to_unsigned(4080, 12);
     VAR_BIN_OP_AND_uxn_c_l269_c4_01ab_right := to_unsigned(4080, 12);
     VAR_BIN_OP_EQ_uxn_c_l267_c12_efc8_right := to_unsigned(13, 4);

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
     VAR_BIN_OP_AND_uxn_c_l217_c4_fe98_left := color0;
     VAR_BIN_OP_AND_uxn_c_l239_c4_6e62_left := color0;
     VAR_BIN_OP_AND_uxn_c_l260_c4_0e97_left := color0;
     VAR_color0_MUX_uxn_c_l211_c2_de09_iffalse := color0;
     VAR_color0_MUX_uxn_c_l225_c8_d86c_iftrue := color0;
     VAR_color0_MUX_uxn_c_l247_c8_37e5_iftrue := color0;
     VAR_color0_MUX_uxn_c_l258_c8_3c5b_iffalse := color0;
     VAR_BIN_OP_AND_uxn_c_l222_c4_f224_left := color1;
     VAR_BIN_OP_AND_uxn_c_l244_c4_d2de_left := color1;
     VAR_BIN_OP_AND_uxn_c_l264_c4_fc72_left := color1;
     VAR_color1_MUX_uxn_c_l211_c2_de09_iffalse := color1;
     VAR_color1_MUX_uxn_c_l225_c8_d86c_iftrue := color1;
     VAR_color1_MUX_uxn_c_l247_c8_37e5_iftrue := color1;
     VAR_color1_MUX_uxn_c_l258_c8_3c5b_iffalse := color1;
     VAR_BIN_OP_AND_uxn_c_l228_c4_f424_left := color2;
     VAR_BIN_OP_AND_uxn_c_l250_c4_6dc6_left := color2;
     VAR_BIN_OP_AND_uxn_c_l269_c4_01ab_left := color2;
     VAR_color2_MUX_uxn_c_l211_c2_de09_iffalse := color2;
     VAR_color2_MUX_uxn_c_l214_c3_f4a2_iftrue := color2;
     VAR_color2_MUX_uxn_c_l236_c8_aed9_iftrue := color2;
     VAR_color2_MUX_uxn_c_l258_c8_3c5b_iftrue := color2;
     VAR_color2_MUX_uxn_c_l267_c8_4856_iffalse := color2;
     VAR_BIN_OP_AND_uxn_c_l233_c4_4b02_left := color3;
     VAR_BIN_OP_AND_uxn_c_l255_c4_6410_left := color3;
     VAR_BIN_OP_AND_uxn_c_l273_c4_979f_left := color3;
     VAR_color3_MUX_uxn_c_l211_c2_de09_iffalse := color3;
     VAR_color3_MUX_uxn_c_l214_c3_f4a2_iftrue := color3;
     VAR_color3_MUX_uxn_c_l236_c8_aed9_iftrue := color3;
     VAR_color3_MUX_uxn_c_l258_c8_3c5b_iftrue := color3;
     VAR_color3_MUX_uxn_c_l267_c8_4856_iffalse := color3;
     VAR_color_cmp_0_MUX_uxn_c_l211_c2_de09_iffalse := color_cmp_0;
     VAR_color_cmp_1_MUX_uxn_c_l211_c2_de09_iffalse := color_cmp_1;
     VAR_BIN_OP_EQ_uxn_c_l214_c7_01be_left := VAR_device_ram_address;
     VAR_BIN_OP_EQ_uxn_c_l225_c12_9332_left := VAR_device_ram_address;
     VAR_BIN_OP_EQ_uxn_c_l236_c12_63c0_left := VAR_device_ram_address;
     VAR_BIN_OP_EQ_uxn_c_l247_c12_4807_left := VAR_device_ram_address;
     VAR_BIN_OP_EQ_uxn_c_l258_c12_99fd_left := VAR_device_ram_address;
     VAR_BIN_OP_EQ_uxn_c_l267_c12_efc8_left := VAR_device_ram_address;
     VAR_CONST_SR_4_uxn_c_l212_c27_a9a6_x := VAR_device_ram_value;
     VAR_BIN_OP_EQ_uxn_c_l278_c6_56e7_left := VAR_gpu_step_color;
     VAR_BIN_OP_EQ_uxn_c_l280_c13_e06f_left := VAR_gpu_step_color;
     VAR_BIN_OP_EQ_uxn_c_l282_c13_03cf_left := VAR_gpu_step_color;
     VAR_color0_MUX_uxn_c_l211_c2_de09_cond := VAR_is_device_ram_write;
     VAR_color1_MUX_uxn_c_l211_c2_de09_cond := VAR_is_device_ram_write;
     VAR_color2_MUX_uxn_c_l211_c2_de09_cond := VAR_is_device_ram_write;
     VAR_color3_MUX_uxn_c_l211_c2_de09_cond := VAR_is_device_ram_write;
     VAR_color_cmp_0_MUX_uxn_c_l211_c2_de09_cond := VAR_is_device_ram_write;
     VAR_color_cmp_1_MUX_uxn_c_l211_c2_de09_cond := VAR_is_device_ram_write;
     VAR_tmp12_MUX_uxn_c_l211_c2_de09_cond := VAR_is_device_ram_write;
     VAR_tmp12_MUX_uxn_c_l211_c2_de09_iffalse := tmp12;
     VAR_tmp12_MUX_uxn_c_l267_c8_4856_iffalse := tmp12;
     -- BIN_OP_AND[uxn_c_l239_c4_6e62] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l239_c4_6e62_left <= VAR_BIN_OP_AND_uxn_c_l239_c4_6e62_left;
     BIN_OP_AND_uxn_c_l239_c4_6e62_right <= VAR_BIN_OP_AND_uxn_c_l239_c4_6e62_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l239_c4_6e62_return_output := BIN_OP_AND_uxn_c_l239_c4_6e62_return_output;

     -- BIN_OP_AND[uxn_c_l269_c4_01ab] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l269_c4_01ab_left <= VAR_BIN_OP_AND_uxn_c_l269_c4_01ab_left;
     BIN_OP_AND_uxn_c_l269_c4_01ab_right <= VAR_BIN_OP_AND_uxn_c_l269_c4_01ab_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l269_c4_01ab_return_output := BIN_OP_AND_uxn_c_l269_c4_01ab_return_output;

     -- BIN_OP_EQ[uxn_c_l267_c12_efc8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l267_c12_efc8_left <= VAR_BIN_OP_EQ_uxn_c_l267_c12_efc8_left;
     BIN_OP_EQ_uxn_c_l267_c12_efc8_right <= VAR_BIN_OP_EQ_uxn_c_l267_c12_efc8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l267_c12_efc8_return_output := BIN_OP_EQ_uxn_c_l267_c12_efc8_return_output;

     -- BIN_OP_EQ[uxn_c_l247_c12_4807] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l247_c12_4807_left <= VAR_BIN_OP_EQ_uxn_c_l247_c12_4807_left;
     BIN_OP_EQ_uxn_c_l247_c12_4807_right <= VAR_BIN_OP_EQ_uxn_c_l247_c12_4807_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l247_c12_4807_return_output := BIN_OP_EQ_uxn_c_l247_c12_4807_return_output;

     -- BIN_OP_AND[uxn_c_l228_c4_f424] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l228_c4_f424_left <= VAR_BIN_OP_AND_uxn_c_l228_c4_f424_left;
     BIN_OP_AND_uxn_c_l228_c4_f424_right <= VAR_BIN_OP_AND_uxn_c_l228_c4_f424_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l228_c4_f424_return_output := BIN_OP_AND_uxn_c_l228_c4_f424_return_output;

     -- BIN_OP_EQ[uxn_c_l282_c13_03cf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l282_c13_03cf_left <= VAR_BIN_OP_EQ_uxn_c_l282_c13_03cf_left;
     BIN_OP_EQ_uxn_c_l282_c13_03cf_right <= VAR_BIN_OP_EQ_uxn_c_l282_c13_03cf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l282_c13_03cf_return_output := BIN_OP_EQ_uxn_c_l282_c13_03cf_return_output;

     -- BIN_OP_EQ[uxn_c_l214_c7_01be] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l214_c7_01be_left <= VAR_BIN_OP_EQ_uxn_c_l214_c7_01be_left;
     BIN_OP_EQ_uxn_c_l214_c7_01be_right <= VAR_BIN_OP_EQ_uxn_c_l214_c7_01be_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l214_c7_01be_return_output := BIN_OP_EQ_uxn_c_l214_c7_01be_return_output;

     -- BIN_OP_EQ[uxn_c_l278_c6_56e7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l278_c6_56e7_left <= VAR_BIN_OP_EQ_uxn_c_l278_c6_56e7_left;
     BIN_OP_EQ_uxn_c_l278_c6_56e7_right <= VAR_BIN_OP_EQ_uxn_c_l278_c6_56e7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l278_c6_56e7_return_output := BIN_OP_EQ_uxn_c_l278_c6_56e7_return_output;

     -- BIN_OP_AND[uxn_c_l264_c4_fc72] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l264_c4_fc72_left <= VAR_BIN_OP_AND_uxn_c_l264_c4_fc72_left;
     BIN_OP_AND_uxn_c_l264_c4_fc72_right <= VAR_BIN_OP_AND_uxn_c_l264_c4_fc72_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l264_c4_fc72_return_output := BIN_OP_AND_uxn_c_l264_c4_fc72_return_output;

     -- CONST_SR_4[uxn_c_l212_c27_a9a6] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_c_l212_c27_a9a6_x <= VAR_CONST_SR_4_uxn_c_l212_c27_a9a6_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_c_l212_c27_a9a6_return_output := CONST_SR_4_uxn_c_l212_c27_a9a6_return_output;

     -- BIN_OP_AND[uxn_c_l250_c4_6dc6] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l250_c4_6dc6_left <= VAR_BIN_OP_AND_uxn_c_l250_c4_6dc6_left;
     BIN_OP_AND_uxn_c_l250_c4_6dc6_right <= VAR_BIN_OP_AND_uxn_c_l250_c4_6dc6_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l250_c4_6dc6_return_output := BIN_OP_AND_uxn_c_l250_c4_6dc6_return_output;

     -- BIN_OP_AND[uxn_c_l222_c4_f224] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l222_c4_f224_left <= VAR_BIN_OP_AND_uxn_c_l222_c4_f224_left;
     BIN_OP_AND_uxn_c_l222_c4_f224_right <= VAR_BIN_OP_AND_uxn_c_l222_c4_f224_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l222_c4_f224_return_output := BIN_OP_AND_uxn_c_l222_c4_f224_return_output;

     -- BIN_OP_AND[uxn_c_l244_c4_d2de] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l244_c4_d2de_left <= VAR_BIN_OP_AND_uxn_c_l244_c4_d2de_left;
     BIN_OP_AND_uxn_c_l244_c4_d2de_right <= VAR_BIN_OP_AND_uxn_c_l244_c4_d2de_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l244_c4_d2de_return_output := BIN_OP_AND_uxn_c_l244_c4_d2de_return_output;

     -- BIN_OP_EQ[uxn_c_l225_c12_9332] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l225_c12_9332_left <= VAR_BIN_OP_EQ_uxn_c_l225_c12_9332_left;
     BIN_OP_EQ_uxn_c_l225_c12_9332_right <= VAR_BIN_OP_EQ_uxn_c_l225_c12_9332_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l225_c12_9332_return_output := BIN_OP_EQ_uxn_c_l225_c12_9332_return_output;

     -- BIN_OP_EQ[uxn_c_l280_c13_e06f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l280_c13_e06f_left <= VAR_BIN_OP_EQ_uxn_c_l280_c13_e06f_left;
     BIN_OP_EQ_uxn_c_l280_c13_e06f_right <= VAR_BIN_OP_EQ_uxn_c_l280_c13_e06f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l280_c13_e06f_return_output := BIN_OP_EQ_uxn_c_l280_c13_e06f_return_output;

     -- BIN_OP_EQ[uxn_c_l236_c12_63c0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l236_c12_63c0_left <= VAR_BIN_OP_EQ_uxn_c_l236_c12_63c0_left;
     BIN_OP_EQ_uxn_c_l236_c12_63c0_right <= VAR_BIN_OP_EQ_uxn_c_l236_c12_63c0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l236_c12_63c0_return_output := BIN_OP_EQ_uxn_c_l236_c12_63c0_return_output;

     -- BIN_OP_AND[uxn_c_l260_c4_0e97] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l260_c4_0e97_left <= VAR_BIN_OP_AND_uxn_c_l260_c4_0e97_left;
     BIN_OP_AND_uxn_c_l260_c4_0e97_right <= VAR_BIN_OP_AND_uxn_c_l260_c4_0e97_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l260_c4_0e97_return_output := BIN_OP_AND_uxn_c_l260_c4_0e97_return_output;

     -- BIN_OP_AND[uxn_c_l255_c4_6410] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l255_c4_6410_left <= VAR_BIN_OP_AND_uxn_c_l255_c4_6410_left;
     BIN_OP_AND_uxn_c_l255_c4_6410_right <= VAR_BIN_OP_AND_uxn_c_l255_c4_6410_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l255_c4_6410_return_output := BIN_OP_AND_uxn_c_l255_c4_6410_return_output;

     -- BIN_OP_AND[uxn_c_l217_c4_fe98] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l217_c4_fe98_left <= VAR_BIN_OP_AND_uxn_c_l217_c4_fe98_left;
     BIN_OP_AND_uxn_c_l217_c4_fe98_right <= VAR_BIN_OP_AND_uxn_c_l217_c4_fe98_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l217_c4_fe98_return_output := BIN_OP_AND_uxn_c_l217_c4_fe98_return_output;

     -- BIN_OP_EQ[uxn_c_l258_c12_99fd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l258_c12_99fd_left <= VAR_BIN_OP_EQ_uxn_c_l258_c12_99fd_left;
     BIN_OP_EQ_uxn_c_l258_c12_99fd_right <= VAR_BIN_OP_EQ_uxn_c_l258_c12_99fd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l258_c12_99fd_return_output := BIN_OP_EQ_uxn_c_l258_c12_99fd_return_output;

     -- BIN_OP_AND[uxn_c_l233_c4_4b02] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l233_c4_4b02_left <= VAR_BIN_OP_AND_uxn_c_l233_c4_4b02_left;
     BIN_OP_AND_uxn_c_l233_c4_4b02_right <= VAR_BIN_OP_AND_uxn_c_l233_c4_4b02_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l233_c4_4b02_return_output := BIN_OP_AND_uxn_c_l233_c4_4b02_return_output;

     -- BIN_OP_AND[uxn_c_l273_c4_979f] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l273_c4_979f_left <= VAR_BIN_OP_AND_uxn_c_l273_c4_979f_left;
     BIN_OP_AND_uxn_c_l273_c4_979f_right <= VAR_BIN_OP_AND_uxn_c_l273_c4_979f_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l273_c4_979f_return_output := BIN_OP_AND_uxn_c_l273_c4_979f_return_output;

     -- CAST_TO_uint4_t[uxn_c_l213_c17_dcba] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_c_l213_c17_dcba_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_device_ram_value);

     -- Submodule level 1
     VAR_BIN_OP_OR_uxn_c_l218_c4_a837_left := VAR_BIN_OP_AND_uxn_c_l217_c4_fe98_return_output;
     VAR_BIN_OP_OR_uxn_c_l223_c4_9e23_left := VAR_BIN_OP_AND_uxn_c_l222_c4_f224_return_output;
     VAR_BIN_OP_OR_uxn_c_l229_c4_1824_left := VAR_BIN_OP_AND_uxn_c_l228_c4_f424_return_output;
     VAR_BIN_OP_OR_uxn_c_l234_c4_1287_left := VAR_BIN_OP_AND_uxn_c_l233_c4_4b02_return_output;
     VAR_BIN_OP_OR_uxn_c_l240_c4_d997_left := VAR_BIN_OP_AND_uxn_c_l239_c4_6e62_return_output;
     VAR_BIN_OP_OR_uxn_c_l245_c4_7154_left := VAR_BIN_OP_AND_uxn_c_l244_c4_d2de_return_output;
     VAR_BIN_OP_OR_uxn_c_l251_c4_811a_left := VAR_BIN_OP_AND_uxn_c_l250_c4_6dc6_return_output;
     VAR_BIN_OP_OR_uxn_c_l256_c4_baa9_left := VAR_BIN_OP_AND_uxn_c_l255_c4_6410_return_output;
     VAR_BIN_OP_OR_uxn_c_l261_c4_1a63_left := VAR_BIN_OP_AND_uxn_c_l260_c4_0e97_return_output;
     VAR_BIN_OP_OR_uxn_c_l265_c4_6d8e_left := VAR_BIN_OP_AND_uxn_c_l264_c4_fc72_return_output;
     VAR_BIN_OP_OR_uxn_c_l270_c4_3a6c_left := VAR_BIN_OP_AND_uxn_c_l269_c4_01ab_return_output;
     VAR_BIN_OP_OR_uxn_c_l274_c4_68cf_left := VAR_BIN_OP_AND_uxn_c_l273_c4_979f_return_output;
     VAR_color0_MUX_uxn_c_l214_c3_f4a2_cond := VAR_BIN_OP_EQ_uxn_c_l214_c7_01be_return_output;
     VAR_color1_MUX_uxn_c_l214_c3_f4a2_cond := VAR_BIN_OP_EQ_uxn_c_l214_c7_01be_return_output;
     VAR_color2_MUX_uxn_c_l214_c3_f4a2_cond := VAR_BIN_OP_EQ_uxn_c_l214_c7_01be_return_output;
     VAR_color3_MUX_uxn_c_l214_c3_f4a2_cond := VAR_BIN_OP_EQ_uxn_c_l214_c7_01be_return_output;
     VAR_tmp12_MUX_uxn_c_l214_c3_f4a2_cond := VAR_BIN_OP_EQ_uxn_c_l214_c7_01be_return_output;
     VAR_color0_MUX_uxn_c_l225_c8_d86c_cond := VAR_BIN_OP_EQ_uxn_c_l225_c12_9332_return_output;
     VAR_color1_MUX_uxn_c_l225_c8_d86c_cond := VAR_BIN_OP_EQ_uxn_c_l225_c12_9332_return_output;
     VAR_color2_MUX_uxn_c_l225_c8_d86c_cond := VAR_BIN_OP_EQ_uxn_c_l225_c12_9332_return_output;
     VAR_color3_MUX_uxn_c_l225_c8_d86c_cond := VAR_BIN_OP_EQ_uxn_c_l225_c12_9332_return_output;
     VAR_tmp12_MUX_uxn_c_l225_c8_d86c_cond := VAR_BIN_OP_EQ_uxn_c_l225_c12_9332_return_output;
     VAR_color0_MUX_uxn_c_l236_c8_aed9_cond := VAR_BIN_OP_EQ_uxn_c_l236_c12_63c0_return_output;
     VAR_color1_MUX_uxn_c_l236_c8_aed9_cond := VAR_BIN_OP_EQ_uxn_c_l236_c12_63c0_return_output;
     VAR_color2_MUX_uxn_c_l236_c8_aed9_cond := VAR_BIN_OP_EQ_uxn_c_l236_c12_63c0_return_output;
     VAR_color3_MUX_uxn_c_l236_c8_aed9_cond := VAR_BIN_OP_EQ_uxn_c_l236_c12_63c0_return_output;
     VAR_tmp12_MUX_uxn_c_l236_c8_aed9_cond := VAR_BIN_OP_EQ_uxn_c_l236_c12_63c0_return_output;
     VAR_color0_MUX_uxn_c_l247_c8_37e5_cond := VAR_BIN_OP_EQ_uxn_c_l247_c12_4807_return_output;
     VAR_color1_MUX_uxn_c_l247_c8_37e5_cond := VAR_BIN_OP_EQ_uxn_c_l247_c12_4807_return_output;
     VAR_color2_MUX_uxn_c_l247_c8_37e5_cond := VAR_BIN_OP_EQ_uxn_c_l247_c12_4807_return_output;
     VAR_color3_MUX_uxn_c_l247_c8_37e5_cond := VAR_BIN_OP_EQ_uxn_c_l247_c12_4807_return_output;
     VAR_tmp12_MUX_uxn_c_l247_c8_37e5_cond := VAR_BIN_OP_EQ_uxn_c_l247_c12_4807_return_output;
     VAR_color0_MUX_uxn_c_l258_c8_3c5b_cond := VAR_BIN_OP_EQ_uxn_c_l258_c12_99fd_return_output;
     VAR_color1_MUX_uxn_c_l258_c8_3c5b_cond := VAR_BIN_OP_EQ_uxn_c_l258_c12_99fd_return_output;
     VAR_color2_MUX_uxn_c_l258_c8_3c5b_cond := VAR_BIN_OP_EQ_uxn_c_l258_c12_99fd_return_output;
     VAR_color3_MUX_uxn_c_l258_c8_3c5b_cond := VAR_BIN_OP_EQ_uxn_c_l258_c12_99fd_return_output;
     VAR_tmp12_MUX_uxn_c_l258_c8_3c5b_cond := VAR_BIN_OP_EQ_uxn_c_l258_c12_99fd_return_output;
     VAR_color2_MUX_uxn_c_l267_c8_4856_cond := VAR_BIN_OP_EQ_uxn_c_l267_c12_efc8_return_output;
     VAR_color3_MUX_uxn_c_l267_c8_4856_cond := VAR_BIN_OP_EQ_uxn_c_l267_c12_efc8_return_output;
     VAR_tmp12_MUX_uxn_c_l267_c8_4856_cond := VAR_BIN_OP_EQ_uxn_c_l267_c12_efc8_return_output;
     VAR_result_MUX_uxn_c_l278_c2_508f_cond := VAR_BIN_OP_EQ_uxn_c_l278_c6_56e7_return_output;
     VAR_result_MUX_uxn_c_l280_c9_4116_cond := VAR_BIN_OP_EQ_uxn_c_l280_c13_e06f_return_output;
     VAR_result_MUX_uxn_c_l282_c9_87ca_cond := VAR_BIN_OP_EQ_uxn_c_l282_c13_03cf_return_output;
     VAR_color_cmp_1_uxn_c_l213_c3_12a5 := VAR_CAST_TO_uint4_t_uxn_c_l213_c17_dcba_return_output;
     VAR_color_cmp_1_MUX_uxn_c_l211_c2_de09_iftrue := VAR_color_cmp_1_uxn_c_l213_c3_12a5;
     VAR_tmp12_uxn_c_l220_c4_25d0 := resize(VAR_color_cmp_1_uxn_c_l213_c3_12a5, 12);
     VAR_tmp12_uxn_c_l231_c4_b57c := resize(VAR_color_cmp_1_uxn_c_l213_c3_12a5, 12);
     VAR_tmp12_uxn_c_l242_c4_586e := resize(VAR_color_cmp_1_uxn_c_l213_c3_12a5, 12);
     VAR_tmp12_uxn_c_l253_c4_1691 := resize(VAR_color_cmp_1_uxn_c_l213_c3_12a5, 12);
     VAR_CONST_SL_8_uxn_c_l221_c4_dea1_x := VAR_tmp12_uxn_c_l220_c4_25d0;
     VAR_CONST_SL_8_uxn_c_l232_c4_cf26_x := VAR_tmp12_uxn_c_l231_c4_b57c;
     VAR_CONST_SL_4_uxn_c_l243_c4_b7b8_x := VAR_tmp12_uxn_c_l242_c4_586e;
     VAR_CONST_SL_4_uxn_c_l254_c4_d230_x := VAR_tmp12_uxn_c_l253_c4_1691;
     -- CONST_SL_8[uxn_c_l232_c4_cf26] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l232_c4_cf26_x <= VAR_CONST_SL_8_uxn_c_l232_c4_cf26_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l232_c4_cf26_return_output := CONST_SL_8_uxn_c_l232_c4_cf26_return_output;

     -- CONST_SL_8[uxn_c_l221_c4_dea1] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l221_c4_dea1_x <= VAR_CONST_SL_8_uxn_c_l221_c4_dea1_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l221_c4_dea1_return_output := CONST_SL_8_uxn_c_l221_c4_dea1_return_output;

     -- CAST_TO_uint4_t[uxn_c_l212_c17_eab8] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_c_l212_c17_eab8_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_CONST_SR_4_uxn_c_l212_c27_a9a6_return_output);

     -- CONST_SL_4[uxn_c_l243_c4_b7b8] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_c_l243_c4_b7b8_x <= VAR_CONST_SL_4_uxn_c_l243_c4_b7b8_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_c_l243_c4_b7b8_return_output := CONST_SL_4_uxn_c_l243_c4_b7b8_return_output;

     -- CAST_TO_uint12_t_uint4_t_uxn_c_l272_l263_DUPLICATE_cc5c LATENCY=0
     VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l272_l263_DUPLICATE_cc5c_return_output := CAST_TO_uint12_t_uint4_t(
     VAR_color_cmp_1_uxn_c_l213_c3_12a5);

     -- color_cmp_1_MUX[uxn_c_l211_c2_de09] LATENCY=0
     -- Inputs
     color_cmp_1_MUX_uxn_c_l211_c2_de09_cond <= VAR_color_cmp_1_MUX_uxn_c_l211_c2_de09_cond;
     color_cmp_1_MUX_uxn_c_l211_c2_de09_iftrue <= VAR_color_cmp_1_MUX_uxn_c_l211_c2_de09_iftrue;
     color_cmp_1_MUX_uxn_c_l211_c2_de09_iffalse <= VAR_color_cmp_1_MUX_uxn_c_l211_c2_de09_iffalse;
     -- Outputs
     VAR_color_cmp_1_MUX_uxn_c_l211_c2_de09_return_output := color_cmp_1_MUX_uxn_c_l211_c2_de09_return_output;

     -- CONST_SL_4[uxn_c_l254_c4_d230] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_c_l254_c4_d230_x <= VAR_CONST_SL_4_uxn_c_l254_c4_d230_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_c_l254_c4_d230_return_output := CONST_SL_4_uxn_c_l254_c4_d230_return_output;

     -- Submodule level 2
     VAR_BIN_OP_OR_uxn_c_l265_c4_6d8e_right := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l272_l263_DUPLICATE_cc5c_return_output;
     VAR_BIN_OP_OR_uxn_c_l274_c4_68cf_right := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l272_l263_DUPLICATE_cc5c_return_output;
     VAR_tmp12_MUX_uxn_c_l258_c8_3c5b_iftrue := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l272_l263_DUPLICATE_cc5c_return_output;
     VAR_tmp12_MUX_uxn_c_l267_c8_4856_iftrue := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l272_l263_DUPLICATE_cc5c_return_output;
     VAR_color_cmp_0_uxn_c_l212_c3_1f30 := VAR_CAST_TO_uint4_t_uxn_c_l212_c17_eab8_return_output;
     VAR_BIN_OP_OR_uxn_c_l245_c4_7154_right := VAR_CONST_SL_4_uxn_c_l243_c4_b7b8_return_output;
     VAR_tmp12_MUX_uxn_c_l236_c8_aed9_iftrue := VAR_CONST_SL_4_uxn_c_l243_c4_b7b8_return_output;
     VAR_BIN_OP_OR_uxn_c_l256_c4_baa9_right := VAR_CONST_SL_4_uxn_c_l254_c4_d230_return_output;
     VAR_tmp12_MUX_uxn_c_l247_c8_37e5_iftrue := VAR_CONST_SL_4_uxn_c_l254_c4_d230_return_output;
     VAR_BIN_OP_OR_uxn_c_l223_c4_9e23_right := VAR_CONST_SL_8_uxn_c_l221_c4_dea1_return_output;
     VAR_tmp12_MUX_uxn_c_l214_c3_f4a2_iftrue := VAR_CONST_SL_8_uxn_c_l221_c4_dea1_return_output;
     VAR_BIN_OP_OR_uxn_c_l234_c4_1287_right := VAR_CONST_SL_8_uxn_c_l232_c4_cf26_return_output;
     VAR_tmp12_MUX_uxn_c_l225_c8_d86c_iftrue := VAR_CONST_SL_8_uxn_c_l232_c4_cf26_return_output;
     REG_VAR_color_cmp_1 := VAR_color_cmp_1_MUX_uxn_c_l211_c2_de09_return_output;
     VAR_color_cmp_0_MUX_uxn_c_l211_c2_de09_iftrue := VAR_color_cmp_0_uxn_c_l212_c3_1f30;
     VAR_tmp12_uxn_c_l215_c4_74c0 := resize(VAR_color_cmp_0_uxn_c_l212_c3_1f30, 12);
     VAR_tmp12_uxn_c_l226_c4_a0d5 := resize(VAR_color_cmp_0_uxn_c_l212_c3_1f30, 12);
     VAR_tmp12_uxn_c_l237_c4_fc57 := resize(VAR_color_cmp_0_uxn_c_l212_c3_1f30, 12);
     VAR_tmp12_uxn_c_l248_c4_d956 := resize(VAR_color_cmp_0_uxn_c_l212_c3_1f30, 12);
     VAR_CONST_SL_8_uxn_c_l216_c4_61ee_x := VAR_tmp12_uxn_c_l215_c4_74c0;
     VAR_CONST_SL_8_uxn_c_l227_c4_18f6_x := VAR_tmp12_uxn_c_l226_c4_a0d5;
     VAR_CONST_SL_4_uxn_c_l238_c4_ac70_x := VAR_tmp12_uxn_c_l237_c4_fc57;
     VAR_CONST_SL_4_uxn_c_l249_c4_5a70_x := VAR_tmp12_uxn_c_l248_c4_d956;
     -- BIN_OP_OR[uxn_c_l265_c4_6d8e] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l265_c4_6d8e_left <= VAR_BIN_OP_OR_uxn_c_l265_c4_6d8e_left;
     BIN_OP_OR_uxn_c_l265_c4_6d8e_right <= VAR_BIN_OP_OR_uxn_c_l265_c4_6d8e_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l265_c4_6d8e_return_output := BIN_OP_OR_uxn_c_l265_c4_6d8e_return_output;

     -- BIN_OP_OR[uxn_c_l256_c4_baa9] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l256_c4_baa9_left <= VAR_BIN_OP_OR_uxn_c_l256_c4_baa9_left;
     BIN_OP_OR_uxn_c_l256_c4_baa9_right <= VAR_BIN_OP_OR_uxn_c_l256_c4_baa9_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l256_c4_baa9_return_output := BIN_OP_OR_uxn_c_l256_c4_baa9_return_output;

     -- BIN_OP_OR[uxn_c_l245_c4_7154] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l245_c4_7154_left <= VAR_BIN_OP_OR_uxn_c_l245_c4_7154_left;
     BIN_OP_OR_uxn_c_l245_c4_7154_right <= VAR_BIN_OP_OR_uxn_c_l245_c4_7154_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l245_c4_7154_return_output := BIN_OP_OR_uxn_c_l245_c4_7154_return_output;

     -- color_cmp_0_MUX[uxn_c_l211_c2_de09] LATENCY=0
     -- Inputs
     color_cmp_0_MUX_uxn_c_l211_c2_de09_cond <= VAR_color_cmp_0_MUX_uxn_c_l211_c2_de09_cond;
     color_cmp_0_MUX_uxn_c_l211_c2_de09_iftrue <= VAR_color_cmp_0_MUX_uxn_c_l211_c2_de09_iftrue;
     color_cmp_0_MUX_uxn_c_l211_c2_de09_iffalse <= VAR_color_cmp_0_MUX_uxn_c_l211_c2_de09_iffalse;
     -- Outputs
     VAR_color_cmp_0_MUX_uxn_c_l211_c2_de09_return_output := color_cmp_0_MUX_uxn_c_l211_c2_de09_return_output;

     -- BIN_OP_OR[uxn_c_l274_c4_68cf] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l274_c4_68cf_left <= VAR_BIN_OP_OR_uxn_c_l274_c4_68cf_left;
     BIN_OP_OR_uxn_c_l274_c4_68cf_right <= VAR_BIN_OP_OR_uxn_c_l274_c4_68cf_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l274_c4_68cf_return_output := BIN_OP_OR_uxn_c_l274_c4_68cf_return_output;

     -- CONST_SL_8[uxn_c_l216_c4_61ee] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l216_c4_61ee_x <= VAR_CONST_SL_8_uxn_c_l216_c4_61ee_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l216_c4_61ee_return_output := CONST_SL_8_uxn_c_l216_c4_61ee_return_output;

     -- CAST_TO_uint12_t_uint4_t_uxn_c_l259_l268_DUPLICATE_5a1a LATENCY=0
     VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l259_l268_DUPLICATE_5a1a_return_output := CAST_TO_uint12_t_uint4_t(
     VAR_color_cmp_0_uxn_c_l212_c3_1f30);

     -- CONST_SL_4[uxn_c_l249_c4_5a70] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_c_l249_c4_5a70_x <= VAR_CONST_SL_4_uxn_c_l249_c4_5a70_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_c_l249_c4_5a70_return_output := CONST_SL_4_uxn_c_l249_c4_5a70_return_output;

     -- BIN_OP_OR[uxn_c_l234_c4_1287] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l234_c4_1287_left <= VAR_BIN_OP_OR_uxn_c_l234_c4_1287_left;
     BIN_OP_OR_uxn_c_l234_c4_1287_right <= VAR_BIN_OP_OR_uxn_c_l234_c4_1287_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l234_c4_1287_return_output := BIN_OP_OR_uxn_c_l234_c4_1287_return_output;

     -- tmp12_MUX[uxn_c_l267_c8_4856] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_c_l267_c8_4856_cond <= VAR_tmp12_MUX_uxn_c_l267_c8_4856_cond;
     tmp12_MUX_uxn_c_l267_c8_4856_iftrue <= VAR_tmp12_MUX_uxn_c_l267_c8_4856_iftrue;
     tmp12_MUX_uxn_c_l267_c8_4856_iffalse <= VAR_tmp12_MUX_uxn_c_l267_c8_4856_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_c_l267_c8_4856_return_output := tmp12_MUX_uxn_c_l267_c8_4856_return_output;

     -- CONST_SL_8[uxn_c_l227_c4_18f6] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l227_c4_18f6_x <= VAR_CONST_SL_8_uxn_c_l227_c4_18f6_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l227_c4_18f6_return_output := CONST_SL_8_uxn_c_l227_c4_18f6_return_output;

     -- CONST_SL_4[uxn_c_l238_c4_ac70] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_c_l238_c4_ac70_x <= VAR_CONST_SL_4_uxn_c_l238_c4_ac70_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_c_l238_c4_ac70_return_output := CONST_SL_4_uxn_c_l238_c4_ac70_return_output;

     -- BIN_OP_OR[uxn_c_l223_c4_9e23] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l223_c4_9e23_left <= VAR_BIN_OP_OR_uxn_c_l223_c4_9e23_left;
     BIN_OP_OR_uxn_c_l223_c4_9e23_right <= VAR_BIN_OP_OR_uxn_c_l223_c4_9e23_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l223_c4_9e23_return_output := BIN_OP_OR_uxn_c_l223_c4_9e23_return_output;

     -- Submodule level 3
     VAR_color1_MUX_uxn_c_l214_c3_f4a2_iftrue := VAR_BIN_OP_OR_uxn_c_l223_c4_9e23_return_output;
     VAR_color3_MUX_uxn_c_l225_c8_d86c_iftrue := VAR_BIN_OP_OR_uxn_c_l234_c4_1287_return_output;
     VAR_color1_MUX_uxn_c_l236_c8_aed9_iftrue := VAR_BIN_OP_OR_uxn_c_l245_c4_7154_return_output;
     VAR_color3_MUX_uxn_c_l247_c8_37e5_iftrue := VAR_BIN_OP_OR_uxn_c_l256_c4_baa9_return_output;
     VAR_color1_MUX_uxn_c_l258_c8_3c5b_iftrue := VAR_BIN_OP_OR_uxn_c_l265_c4_6d8e_return_output;
     VAR_color3_MUX_uxn_c_l267_c8_4856_iftrue := VAR_BIN_OP_OR_uxn_c_l274_c4_68cf_return_output;
     VAR_BIN_OP_OR_uxn_c_l261_c4_1a63_right := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l259_l268_DUPLICATE_5a1a_return_output;
     VAR_BIN_OP_OR_uxn_c_l270_c4_3a6c_right := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l259_l268_DUPLICATE_5a1a_return_output;
     VAR_BIN_OP_OR_uxn_c_l240_c4_d997_right := VAR_CONST_SL_4_uxn_c_l238_c4_ac70_return_output;
     VAR_BIN_OP_OR_uxn_c_l251_c4_811a_right := VAR_CONST_SL_4_uxn_c_l249_c4_5a70_return_output;
     VAR_BIN_OP_OR_uxn_c_l218_c4_a837_right := VAR_CONST_SL_8_uxn_c_l216_c4_61ee_return_output;
     VAR_BIN_OP_OR_uxn_c_l229_c4_1824_right := VAR_CONST_SL_8_uxn_c_l227_c4_18f6_return_output;
     REG_VAR_color_cmp_0 := VAR_color_cmp_0_MUX_uxn_c_l211_c2_de09_return_output;
     VAR_tmp12_MUX_uxn_c_l258_c8_3c5b_iffalse := VAR_tmp12_MUX_uxn_c_l267_c8_4856_return_output;
     -- BIN_OP_OR[uxn_c_l251_c4_811a] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l251_c4_811a_left <= VAR_BIN_OP_OR_uxn_c_l251_c4_811a_left;
     BIN_OP_OR_uxn_c_l251_c4_811a_right <= VAR_BIN_OP_OR_uxn_c_l251_c4_811a_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l251_c4_811a_return_output := BIN_OP_OR_uxn_c_l251_c4_811a_return_output;

     -- BIN_OP_OR[uxn_c_l270_c4_3a6c] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l270_c4_3a6c_left <= VAR_BIN_OP_OR_uxn_c_l270_c4_3a6c_left;
     BIN_OP_OR_uxn_c_l270_c4_3a6c_right <= VAR_BIN_OP_OR_uxn_c_l270_c4_3a6c_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l270_c4_3a6c_return_output := BIN_OP_OR_uxn_c_l270_c4_3a6c_return_output;

     -- BIN_OP_OR[uxn_c_l229_c4_1824] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l229_c4_1824_left <= VAR_BIN_OP_OR_uxn_c_l229_c4_1824_left;
     BIN_OP_OR_uxn_c_l229_c4_1824_right <= VAR_BIN_OP_OR_uxn_c_l229_c4_1824_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l229_c4_1824_return_output := BIN_OP_OR_uxn_c_l229_c4_1824_return_output;

     -- color3_MUX[uxn_c_l267_c8_4856] LATENCY=0
     -- Inputs
     color3_MUX_uxn_c_l267_c8_4856_cond <= VAR_color3_MUX_uxn_c_l267_c8_4856_cond;
     color3_MUX_uxn_c_l267_c8_4856_iftrue <= VAR_color3_MUX_uxn_c_l267_c8_4856_iftrue;
     color3_MUX_uxn_c_l267_c8_4856_iffalse <= VAR_color3_MUX_uxn_c_l267_c8_4856_iffalse;
     -- Outputs
     VAR_color3_MUX_uxn_c_l267_c8_4856_return_output := color3_MUX_uxn_c_l267_c8_4856_return_output;

     -- color1_MUX[uxn_c_l258_c8_3c5b] LATENCY=0
     -- Inputs
     color1_MUX_uxn_c_l258_c8_3c5b_cond <= VAR_color1_MUX_uxn_c_l258_c8_3c5b_cond;
     color1_MUX_uxn_c_l258_c8_3c5b_iftrue <= VAR_color1_MUX_uxn_c_l258_c8_3c5b_iftrue;
     color1_MUX_uxn_c_l258_c8_3c5b_iffalse <= VAR_color1_MUX_uxn_c_l258_c8_3c5b_iffalse;
     -- Outputs
     VAR_color1_MUX_uxn_c_l258_c8_3c5b_return_output := color1_MUX_uxn_c_l258_c8_3c5b_return_output;

     -- tmp12_MUX[uxn_c_l258_c8_3c5b] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_c_l258_c8_3c5b_cond <= VAR_tmp12_MUX_uxn_c_l258_c8_3c5b_cond;
     tmp12_MUX_uxn_c_l258_c8_3c5b_iftrue <= VAR_tmp12_MUX_uxn_c_l258_c8_3c5b_iftrue;
     tmp12_MUX_uxn_c_l258_c8_3c5b_iffalse <= VAR_tmp12_MUX_uxn_c_l258_c8_3c5b_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_c_l258_c8_3c5b_return_output := tmp12_MUX_uxn_c_l258_c8_3c5b_return_output;

     -- BIN_OP_OR[uxn_c_l240_c4_d997] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l240_c4_d997_left <= VAR_BIN_OP_OR_uxn_c_l240_c4_d997_left;
     BIN_OP_OR_uxn_c_l240_c4_d997_right <= VAR_BIN_OP_OR_uxn_c_l240_c4_d997_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l240_c4_d997_return_output := BIN_OP_OR_uxn_c_l240_c4_d997_return_output;

     -- BIN_OP_OR[uxn_c_l218_c4_a837] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l218_c4_a837_left <= VAR_BIN_OP_OR_uxn_c_l218_c4_a837_left;
     BIN_OP_OR_uxn_c_l218_c4_a837_right <= VAR_BIN_OP_OR_uxn_c_l218_c4_a837_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l218_c4_a837_return_output := BIN_OP_OR_uxn_c_l218_c4_a837_return_output;

     -- BIN_OP_OR[uxn_c_l261_c4_1a63] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l261_c4_1a63_left <= VAR_BIN_OP_OR_uxn_c_l261_c4_1a63_left;
     BIN_OP_OR_uxn_c_l261_c4_1a63_right <= VAR_BIN_OP_OR_uxn_c_l261_c4_1a63_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l261_c4_1a63_return_output := BIN_OP_OR_uxn_c_l261_c4_1a63_return_output;

     -- Submodule level 4
     VAR_color0_MUX_uxn_c_l214_c3_f4a2_iftrue := VAR_BIN_OP_OR_uxn_c_l218_c4_a837_return_output;
     VAR_color2_MUX_uxn_c_l225_c8_d86c_iftrue := VAR_BIN_OP_OR_uxn_c_l229_c4_1824_return_output;
     VAR_color0_MUX_uxn_c_l236_c8_aed9_iftrue := VAR_BIN_OP_OR_uxn_c_l240_c4_d997_return_output;
     VAR_color2_MUX_uxn_c_l247_c8_37e5_iftrue := VAR_BIN_OP_OR_uxn_c_l251_c4_811a_return_output;
     VAR_color0_MUX_uxn_c_l258_c8_3c5b_iftrue := VAR_BIN_OP_OR_uxn_c_l261_c4_1a63_return_output;
     VAR_color2_MUX_uxn_c_l267_c8_4856_iftrue := VAR_BIN_OP_OR_uxn_c_l270_c4_3a6c_return_output;
     VAR_color1_MUX_uxn_c_l247_c8_37e5_iffalse := VAR_color1_MUX_uxn_c_l258_c8_3c5b_return_output;
     VAR_color3_MUX_uxn_c_l258_c8_3c5b_iffalse := VAR_color3_MUX_uxn_c_l267_c8_4856_return_output;
     VAR_tmp12_MUX_uxn_c_l247_c8_37e5_iffalse := VAR_tmp12_MUX_uxn_c_l258_c8_3c5b_return_output;
     -- color0_MUX[uxn_c_l258_c8_3c5b] LATENCY=0
     -- Inputs
     color0_MUX_uxn_c_l258_c8_3c5b_cond <= VAR_color0_MUX_uxn_c_l258_c8_3c5b_cond;
     color0_MUX_uxn_c_l258_c8_3c5b_iftrue <= VAR_color0_MUX_uxn_c_l258_c8_3c5b_iftrue;
     color0_MUX_uxn_c_l258_c8_3c5b_iffalse <= VAR_color0_MUX_uxn_c_l258_c8_3c5b_iffalse;
     -- Outputs
     VAR_color0_MUX_uxn_c_l258_c8_3c5b_return_output := color0_MUX_uxn_c_l258_c8_3c5b_return_output;

     -- tmp12_MUX[uxn_c_l247_c8_37e5] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_c_l247_c8_37e5_cond <= VAR_tmp12_MUX_uxn_c_l247_c8_37e5_cond;
     tmp12_MUX_uxn_c_l247_c8_37e5_iftrue <= VAR_tmp12_MUX_uxn_c_l247_c8_37e5_iftrue;
     tmp12_MUX_uxn_c_l247_c8_37e5_iffalse <= VAR_tmp12_MUX_uxn_c_l247_c8_37e5_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_c_l247_c8_37e5_return_output := tmp12_MUX_uxn_c_l247_c8_37e5_return_output;

     -- color1_MUX[uxn_c_l247_c8_37e5] LATENCY=0
     -- Inputs
     color1_MUX_uxn_c_l247_c8_37e5_cond <= VAR_color1_MUX_uxn_c_l247_c8_37e5_cond;
     color1_MUX_uxn_c_l247_c8_37e5_iftrue <= VAR_color1_MUX_uxn_c_l247_c8_37e5_iftrue;
     color1_MUX_uxn_c_l247_c8_37e5_iffalse <= VAR_color1_MUX_uxn_c_l247_c8_37e5_iffalse;
     -- Outputs
     VAR_color1_MUX_uxn_c_l247_c8_37e5_return_output := color1_MUX_uxn_c_l247_c8_37e5_return_output;

     -- color3_MUX[uxn_c_l258_c8_3c5b] LATENCY=0
     -- Inputs
     color3_MUX_uxn_c_l258_c8_3c5b_cond <= VAR_color3_MUX_uxn_c_l258_c8_3c5b_cond;
     color3_MUX_uxn_c_l258_c8_3c5b_iftrue <= VAR_color3_MUX_uxn_c_l258_c8_3c5b_iftrue;
     color3_MUX_uxn_c_l258_c8_3c5b_iffalse <= VAR_color3_MUX_uxn_c_l258_c8_3c5b_iffalse;
     -- Outputs
     VAR_color3_MUX_uxn_c_l258_c8_3c5b_return_output := color3_MUX_uxn_c_l258_c8_3c5b_return_output;

     -- color2_MUX[uxn_c_l267_c8_4856] LATENCY=0
     -- Inputs
     color2_MUX_uxn_c_l267_c8_4856_cond <= VAR_color2_MUX_uxn_c_l267_c8_4856_cond;
     color2_MUX_uxn_c_l267_c8_4856_iftrue <= VAR_color2_MUX_uxn_c_l267_c8_4856_iftrue;
     color2_MUX_uxn_c_l267_c8_4856_iffalse <= VAR_color2_MUX_uxn_c_l267_c8_4856_iffalse;
     -- Outputs
     VAR_color2_MUX_uxn_c_l267_c8_4856_return_output := color2_MUX_uxn_c_l267_c8_4856_return_output;

     -- Submodule level 5
     VAR_color0_MUX_uxn_c_l247_c8_37e5_iffalse := VAR_color0_MUX_uxn_c_l258_c8_3c5b_return_output;
     VAR_color1_MUX_uxn_c_l236_c8_aed9_iffalse := VAR_color1_MUX_uxn_c_l247_c8_37e5_return_output;
     VAR_color2_MUX_uxn_c_l258_c8_3c5b_iffalse := VAR_color2_MUX_uxn_c_l267_c8_4856_return_output;
     VAR_color3_MUX_uxn_c_l247_c8_37e5_iffalse := VAR_color3_MUX_uxn_c_l258_c8_3c5b_return_output;
     VAR_tmp12_MUX_uxn_c_l236_c8_aed9_iffalse := VAR_tmp12_MUX_uxn_c_l247_c8_37e5_return_output;
     -- color0_MUX[uxn_c_l247_c8_37e5] LATENCY=0
     -- Inputs
     color0_MUX_uxn_c_l247_c8_37e5_cond <= VAR_color0_MUX_uxn_c_l247_c8_37e5_cond;
     color0_MUX_uxn_c_l247_c8_37e5_iftrue <= VAR_color0_MUX_uxn_c_l247_c8_37e5_iftrue;
     color0_MUX_uxn_c_l247_c8_37e5_iffalse <= VAR_color0_MUX_uxn_c_l247_c8_37e5_iffalse;
     -- Outputs
     VAR_color0_MUX_uxn_c_l247_c8_37e5_return_output := color0_MUX_uxn_c_l247_c8_37e5_return_output;

     -- color3_MUX[uxn_c_l247_c8_37e5] LATENCY=0
     -- Inputs
     color3_MUX_uxn_c_l247_c8_37e5_cond <= VAR_color3_MUX_uxn_c_l247_c8_37e5_cond;
     color3_MUX_uxn_c_l247_c8_37e5_iftrue <= VAR_color3_MUX_uxn_c_l247_c8_37e5_iftrue;
     color3_MUX_uxn_c_l247_c8_37e5_iffalse <= VAR_color3_MUX_uxn_c_l247_c8_37e5_iffalse;
     -- Outputs
     VAR_color3_MUX_uxn_c_l247_c8_37e5_return_output := color3_MUX_uxn_c_l247_c8_37e5_return_output;

     -- color1_MUX[uxn_c_l236_c8_aed9] LATENCY=0
     -- Inputs
     color1_MUX_uxn_c_l236_c8_aed9_cond <= VAR_color1_MUX_uxn_c_l236_c8_aed9_cond;
     color1_MUX_uxn_c_l236_c8_aed9_iftrue <= VAR_color1_MUX_uxn_c_l236_c8_aed9_iftrue;
     color1_MUX_uxn_c_l236_c8_aed9_iffalse <= VAR_color1_MUX_uxn_c_l236_c8_aed9_iffalse;
     -- Outputs
     VAR_color1_MUX_uxn_c_l236_c8_aed9_return_output := color1_MUX_uxn_c_l236_c8_aed9_return_output;

     -- color2_MUX[uxn_c_l258_c8_3c5b] LATENCY=0
     -- Inputs
     color2_MUX_uxn_c_l258_c8_3c5b_cond <= VAR_color2_MUX_uxn_c_l258_c8_3c5b_cond;
     color2_MUX_uxn_c_l258_c8_3c5b_iftrue <= VAR_color2_MUX_uxn_c_l258_c8_3c5b_iftrue;
     color2_MUX_uxn_c_l258_c8_3c5b_iffalse <= VAR_color2_MUX_uxn_c_l258_c8_3c5b_iffalse;
     -- Outputs
     VAR_color2_MUX_uxn_c_l258_c8_3c5b_return_output := color2_MUX_uxn_c_l258_c8_3c5b_return_output;

     -- tmp12_MUX[uxn_c_l236_c8_aed9] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_c_l236_c8_aed9_cond <= VAR_tmp12_MUX_uxn_c_l236_c8_aed9_cond;
     tmp12_MUX_uxn_c_l236_c8_aed9_iftrue <= VAR_tmp12_MUX_uxn_c_l236_c8_aed9_iftrue;
     tmp12_MUX_uxn_c_l236_c8_aed9_iffalse <= VAR_tmp12_MUX_uxn_c_l236_c8_aed9_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_c_l236_c8_aed9_return_output := tmp12_MUX_uxn_c_l236_c8_aed9_return_output;

     -- Submodule level 6
     VAR_color0_MUX_uxn_c_l236_c8_aed9_iffalse := VAR_color0_MUX_uxn_c_l247_c8_37e5_return_output;
     VAR_color1_MUX_uxn_c_l225_c8_d86c_iffalse := VAR_color1_MUX_uxn_c_l236_c8_aed9_return_output;
     VAR_color2_MUX_uxn_c_l247_c8_37e5_iffalse := VAR_color2_MUX_uxn_c_l258_c8_3c5b_return_output;
     VAR_color3_MUX_uxn_c_l236_c8_aed9_iffalse := VAR_color3_MUX_uxn_c_l247_c8_37e5_return_output;
     VAR_tmp12_MUX_uxn_c_l225_c8_d86c_iffalse := VAR_tmp12_MUX_uxn_c_l236_c8_aed9_return_output;
     -- color0_MUX[uxn_c_l236_c8_aed9] LATENCY=0
     -- Inputs
     color0_MUX_uxn_c_l236_c8_aed9_cond <= VAR_color0_MUX_uxn_c_l236_c8_aed9_cond;
     color0_MUX_uxn_c_l236_c8_aed9_iftrue <= VAR_color0_MUX_uxn_c_l236_c8_aed9_iftrue;
     color0_MUX_uxn_c_l236_c8_aed9_iffalse <= VAR_color0_MUX_uxn_c_l236_c8_aed9_iffalse;
     -- Outputs
     VAR_color0_MUX_uxn_c_l236_c8_aed9_return_output := color0_MUX_uxn_c_l236_c8_aed9_return_output;

     -- tmp12_MUX[uxn_c_l225_c8_d86c] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_c_l225_c8_d86c_cond <= VAR_tmp12_MUX_uxn_c_l225_c8_d86c_cond;
     tmp12_MUX_uxn_c_l225_c8_d86c_iftrue <= VAR_tmp12_MUX_uxn_c_l225_c8_d86c_iftrue;
     tmp12_MUX_uxn_c_l225_c8_d86c_iffalse <= VAR_tmp12_MUX_uxn_c_l225_c8_d86c_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_c_l225_c8_d86c_return_output := tmp12_MUX_uxn_c_l225_c8_d86c_return_output;

     -- color1_MUX[uxn_c_l225_c8_d86c] LATENCY=0
     -- Inputs
     color1_MUX_uxn_c_l225_c8_d86c_cond <= VAR_color1_MUX_uxn_c_l225_c8_d86c_cond;
     color1_MUX_uxn_c_l225_c8_d86c_iftrue <= VAR_color1_MUX_uxn_c_l225_c8_d86c_iftrue;
     color1_MUX_uxn_c_l225_c8_d86c_iffalse <= VAR_color1_MUX_uxn_c_l225_c8_d86c_iffalse;
     -- Outputs
     VAR_color1_MUX_uxn_c_l225_c8_d86c_return_output := color1_MUX_uxn_c_l225_c8_d86c_return_output;

     -- color3_MUX[uxn_c_l236_c8_aed9] LATENCY=0
     -- Inputs
     color3_MUX_uxn_c_l236_c8_aed9_cond <= VAR_color3_MUX_uxn_c_l236_c8_aed9_cond;
     color3_MUX_uxn_c_l236_c8_aed9_iftrue <= VAR_color3_MUX_uxn_c_l236_c8_aed9_iftrue;
     color3_MUX_uxn_c_l236_c8_aed9_iffalse <= VAR_color3_MUX_uxn_c_l236_c8_aed9_iffalse;
     -- Outputs
     VAR_color3_MUX_uxn_c_l236_c8_aed9_return_output := color3_MUX_uxn_c_l236_c8_aed9_return_output;

     -- color2_MUX[uxn_c_l247_c8_37e5] LATENCY=0
     -- Inputs
     color2_MUX_uxn_c_l247_c8_37e5_cond <= VAR_color2_MUX_uxn_c_l247_c8_37e5_cond;
     color2_MUX_uxn_c_l247_c8_37e5_iftrue <= VAR_color2_MUX_uxn_c_l247_c8_37e5_iftrue;
     color2_MUX_uxn_c_l247_c8_37e5_iffalse <= VAR_color2_MUX_uxn_c_l247_c8_37e5_iffalse;
     -- Outputs
     VAR_color2_MUX_uxn_c_l247_c8_37e5_return_output := color2_MUX_uxn_c_l247_c8_37e5_return_output;

     -- Submodule level 7
     VAR_color0_MUX_uxn_c_l225_c8_d86c_iffalse := VAR_color0_MUX_uxn_c_l236_c8_aed9_return_output;
     VAR_color1_MUX_uxn_c_l214_c3_f4a2_iffalse := VAR_color1_MUX_uxn_c_l225_c8_d86c_return_output;
     VAR_color2_MUX_uxn_c_l236_c8_aed9_iffalse := VAR_color2_MUX_uxn_c_l247_c8_37e5_return_output;
     VAR_color3_MUX_uxn_c_l225_c8_d86c_iffalse := VAR_color3_MUX_uxn_c_l236_c8_aed9_return_output;
     VAR_tmp12_MUX_uxn_c_l214_c3_f4a2_iffalse := VAR_tmp12_MUX_uxn_c_l225_c8_d86c_return_output;
     -- color1_MUX[uxn_c_l214_c3_f4a2] LATENCY=0
     -- Inputs
     color1_MUX_uxn_c_l214_c3_f4a2_cond <= VAR_color1_MUX_uxn_c_l214_c3_f4a2_cond;
     color1_MUX_uxn_c_l214_c3_f4a2_iftrue <= VAR_color1_MUX_uxn_c_l214_c3_f4a2_iftrue;
     color1_MUX_uxn_c_l214_c3_f4a2_iffalse <= VAR_color1_MUX_uxn_c_l214_c3_f4a2_iffalse;
     -- Outputs
     VAR_color1_MUX_uxn_c_l214_c3_f4a2_return_output := color1_MUX_uxn_c_l214_c3_f4a2_return_output;

     -- color2_MUX[uxn_c_l236_c8_aed9] LATENCY=0
     -- Inputs
     color2_MUX_uxn_c_l236_c8_aed9_cond <= VAR_color2_MUX_uxn_c_l236_c8_aed9_cond;
     color2_MUX_uxn_c_l236_c8_aed9_iftrue <= VAR_color2_MUX_uxn_c_l236_c8_aed9_iftrue;
     color2_MUX_uxn_c_l236_c8_aed9_iffalse <= VAR_color2_MUX_uxn_c_l236_c8_aed9_iffalse;
     -- Outputs
     VAR_color2_MUX_uxn_c_l236_c8_aed9_return_output := color2_MUX_uxn_c_l236_c8_aed9_return_output;

     -- color0_MUX[uxn_c_l225_c8_d86c] LATENCY=0
     -- Inputs
     color0_MUX_uxn_c_l225_c8_d86c_cond <= VAR_color0_MUX_uxn_c_l225_c8_d86c_cond;
     color0_MUX_uxn_c_l225_c8_d86c_iftrue <= VAR_color0_MUX_uxn_c_l225_c8_d86c_iftrue;
     color0_MUX_uxn_c_l225_c8_d86c_iffalse <= VAR_color0_MUX_uxn_c_l225_c8_d86c_iffalse;
     -- Outputs
     VAR_color0_MUX_uxn_c_l225_c8_d86c_return_output := color0_MUX_uxn_c_l225_c8_d86c_return_output;

     -- color3_MUX[uxn_c_l225_c8_d86c] LATENCY=0
     -- Inputs
     color3_MUX_uxn_c_l225_c8_d86c_cond <= VAR_color3_MUX_uxn_c_l225_c8_d86c_cond;
     color3_MUX_uxn_c_l225_c8_d86c_iftrue <= VAR_color3_MUX_uxn_c_l225_c8_d86c_iftrue;
     color3_MUX_uxn_c_l225_c8_d86c_iffalse <= VAR_color3_MUX_uxn_c_l225_c8_d86c_iffalse;
     -- Outputs
     VAR_color3_MUX_uxn_c_l225_c8_d86c_return_output := color3_MUX_uxn_c_l225_c8_d86c_return_output;

     -- tmp12_MUX[uxn_c_l214_c3_f4a2] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_c_l214_c3_f4a2_cond <= VAR_tmp12_MUX_uxn_c_l214_c3_f4a2_cond;
     tmp12_MUX_uxn_c_l214_c3_f4a2_iftrue <= VAR_tmp12_MUX_uxn_c_l214_c3_f4a2_iftrue;
     tmp12_MUX_uxn_c_l214_c3_f4a2_iffalse <= VAR_tmp12_MUX_uxn_c_l214_c3_f4a2_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_c_l214_c3_f4a2_return_output := tmp12_MUX_uxn_c_l214_c3_f4a2_return_output;

     -- Submodule level 8
     VAR_color0_MUX_uxn_c_l214_c3_f4a2_iffalse := VAR_color0_MUX_uxn_c_l225_c8_d86c_return_output;
     VAR_color1_MUX_uxn_c_l211_c2_de09_iftrue := VAR_color1_MUX_uxn_c_l214_c3_f4a2_return_output;
     VAR_color2_MUX_uxn_c_l225_c8_d86c_iffalse := VAR_color2_MUX_uxn_c_l236_c8_aed9_return_output;
     VAR_color3_MUX_uxn_c_l214_c3_f4a2_iffalse := VAR_color3_MUX_uxn_c_l225_c8_d86c_return_output;
     VAR_tmp12_MUX_uxn_c_l211_c2_de09_iftrue := VAR_tmp12_MUX_uxn_c_l214_c3_f4a2_return_output;
     -- color2_MUX[uxn_c_l225_c8_d86c] LATENCY=0
     -- Inputs
     color2_MUX_uxn_c_l225_c8_d86c_cond <= VAR_color2_MUX_uxn_c_l225_c8_d86c_cond;
     color2_MUX_uxn_c_l225_c8_d86c_iftrue <= VAR_color2_MUX_uxn_c_l225_c8_d86c_iftrue;
     color2_MUX_uxn_c_l225_c8_d86c_iffalse <= VAR_color2_MUX_uxn_c_l225_c8_d86c_iffalse;
     -- Outputs
     VAR_color2_MUX_uxn_c_l225_c8_d86c_return_output := color2_MUX_uxn_c_l225_c8_d86c_return_output;

     -- color1_MUX[uxn_c_l211_c2_de09] LATENCY=0
     -- Inputs
     color1_MUX_uxn_c_l211_c2_de09_cond <= VAR_color1_MUX_uxn_c_l211_c2_de09_cond;
     color1_MUX_uxn_c_l211_c2_de09_iftrue <= VAR_color1_MUX_uxn_c_l211_c2_de09_iftrue;
     color1_MUX_uxn_c_l211_c2_de09_iffalse <= VAR_color1_MUX_uxn_c_l211_c2_de09_iffalse;
     -- Outputs
     VAR_color1_MUX_uxn_c_l211_c2_de09_return_output := color1_MUX_uxn_c_l211_c2_de09_return_output;

     -- color3_MUX[uxn_c_l214_c3_f4a2] LATENCY=0
     -- Inputs
     color3_MUX_uxn_c_l214_c3_f4a2_cond <= VAR_color3_MUX_uxn_c_l214_c3_f4a2_cond;
     color3_MUX_uxn_c_l214_c3_f4a2_iftrue <= VAR_color3_MUX_uxn_c_l214_c3_f4a2_iftrue;
     color3_MUX_uxn_c_l214_c3_f4a2_iffalse <= VAR_color3_MUX_uxn_c_l214_c3_f4a2_iffalse;
     -- Outputs
     VAR_color3_MUX_uxn_c_l214_c3_f4a2_return_output := color3_MUX_uxn_c_l214_c3_f4a2_return_output;

     -- color0_MUX[uxn_c_l214_c3_f4a2] LATENCY=0
     -- Inputs
     color0_MUX_uxn_c_l214_c3_f4a2_cond <= VAR_color0_MUX_uxn_c_l214_c3_f4a2_cond;
     color0_MUX_uxn_c_l214_c3_f4a2_iftrue <= VAR_color0_MUX_uxn_c_l214_c3_f4a2_iftrue;
     color0_MUX_uxn_c_l214_c3_f4a2_iffalse <= VAR_color0_MUX_uxn_c_l214_c3_f4a2_iffalse;
     -- Outputs
     VAR_color0_MUX_uxn_c_l214_c3_f4a2_return_output := color0_MUX_uxn_c_l214_c3_f4a2_return_output;

     -- tmp12_MUX[uxn_c_l211_c2_de09] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_c_l211_c2_de09_cond <= VAR_tmp12_MUX_uxn_c_l211_c2_de09_cond;
     tmp12_MUX_uxn_c_l211_c2_de09_iftrue <= VAR_tmp12_MUX_uxn_c_l211_c2_de09_iftrue;
     tmp12_MUX_uxn_c_l211_c2_de09_iffalse <= VAR_tmp12_MUX_uxn_c_l211_c2_de09_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_c_l211_c2_de09_return_output := tmp12_MUX_uxn_c_l211_c2_de09_return_output;

     -- Submodule level 9
     VAR_color0_MUX_uxn_c_l211_c2_de09_iftrue := VAR_color0_MUX_uxn_c_l214_c3_f4a2_return_output;
     REG_VAR_color1 := VAR_color1_MUX_uxn_c_l211_c2_de09_return_output;
     VAR_result_uxn_c_l281_c3_dbdf := resize(VAR_color1_MUX_uxn_c_l211_c2_de09_return_output, 16);
     VAR_color2_MUX_uxn_c_l214_c3_f4a2_iffalse := VAR_color2_MUX_uxn_c_l225_c8_d86c_return_output;
     VAR_color3_MUX_uxn_c_l211_c2_de09_iftrue := VAR_color3_MUX_uxn_c_l214_c3_f4a2_return_output;
     REG_VAR_tmp12 := VAR_tmp12_MUX_uxn_c_l211_c2_de09_return_output;
     VAR_result_MUX_uxn_c_l280_c9_4116_iftrue := VAR_result_uxn_c_l281_c3_dbdf;
     -- color2_MUX[uxn_c_l214_c3_f4a2] LATENCY=0
     -- Inputs
     color2_MUX_uxn_c_l214_c3_f4a2_cond <= VAR_color2_MUX_uxn_c_l214_c3_f4a2_cond;
     color2_MUX_uxn_c_l214_c3_f4a2_iftrue <= VAR_color2_MUX_uxn_c_l214_c3_f4a2_iftrue;
     color2_MUX_uxn_c_l214_c3_f4a2_iffalse <= VAR_color2_MUX_uxn_c_l214_c3_f4a2_iffalse;
     -- Outputs
     VAR_color2_MUX_uxn_c_l214_c3_f4a2_return_output := color2_MUX_uxn_c_l214_c3_f4a2_return_output;

     -- color3_MUX[uxn_c_l211_c2_de09] LATENCY=0
     -- Inputs
     color3_MUX_uxn_c_l211_c2_de09_cond <= VAR_color3_MUX_uxn_c_l211_c2_de09_cond;
     color3_MUX_uxn_c_l211_c2_de09_iftrue <= VAR_color3_MUX_uxn_c_l211_c2_de09_iftrue;
     color3_MUX_uxn_c_l211_c2_de09_iffalse <= VAR_color3_MUX_uxn_c_l211_c2_de09_iffalse;
     -- Outputs
     VAR_color3_MUX_uxn_c_l211_c2_de09_return_output := color3_MUX_uxn_c_l211_c2_de09_return_output;

     -- color0_MUX[uxn_c_l211_c2_de09] LATENCY=0
     -- Inputs
     color0_MUX_uxn_c_l211_c2_de09_cond <= VAR_color0_MUX_uxn_c_l211_c2_de09_cond;
     color0_MUX_uxn_c_l211_c2_de09_iftrue <= VAR_color0_MUX_uxn_c_l211_c2_de09_iftrue;
     color0_MUX_uxn_c_l211_c2_de09_iffalse <= VAR_color0_MUX_uxn_c_l211_c2_de09_iffalse;
     -- Outputs
     VAR_color0_MUX_uxn_c_l211_c2_de09_return_output := color0_MUX_uxn_c_l211_c2_de09_return_output;

     -- Submodule level 10
     REG_VAR_color0 := VAR_color0_MUX_uxn_c_l211_c2_de09_return_output;
     VAR_result_uxn_c_l279_c3_4ffb := resize(VAR_color0_MUX_uxn_c_l211_c2_de09_return_output, 16);
     VAR_color2_MUX_uxn_c_l211_c2_de09_iftrue := VAR_color2_MUX_uxn_c_l214_c3_f4a2_return_output;
     REG_VAR_color3 := VAR_color3_MUX_uxn_c_l211_c2_de09_return_output;
     VAR_result_uxn_c_l285_c3_eb40 := resize(VAR_color3_MUX_uxn_c_l211_c2_de09_return_output, 16);
     VAR_result_MUX_uxn_c_l278_c2_508f_iftrue := VAR_result_uxn_c_l279_c3_4ffb;
     VAR_result_MUX_uxn_c_l282_c9_87ca_iffalse := VAR_result_uxn_c_l285_c3_eb40;
     -- color2_MUX[uxn_c_l211_c2_de09] LATENCY=0
     -- Inputs
     color2_MUX_uxn_c_l211_c2_de09_cond <= VAR_color2_MUX_uxn_c_l211_c2_de09_cond;
     color2_MUX_uxn_c_l211_c2_de09_iftrue <= VAR_color2_MUX_uxn_c_l211_c2_de09_iftrue;
     color2_MUX_uxn_c_l211_c2_de09_iffalse <= VAR_color2_MUX_uxn_c_l211_c2_de09_iffalse;
     -- Outputs
     VAR_color2_MUX_uxn_c_l211_c2_de09_return_output := color2_MUX_uxn_c_l211_c2_de09_return_output;

     -- Submodule level 11
     REG_VAR_color2 := VAR_color2_MUX_uxn_c_l211_c2_de09_return_output;
     VAR_result_uxn_c_l283_c3_6080 := resize(VAR_color2_MUX_uxn_c_l211_c2_de09_return_output, 16);
     VAR_result_MUX_uxn_c_l282_c9_87ca_iftrue := VAR_result_uxn_c_l283_c3_6080;
     -- result_MUX[uxn_c_l282_c9_87ca] LATENCY=0
     -- Inputs
     result_MUX_uxn_c_l282_c9_87ca_cond <= VAR_result_MUX_uxn_c_l282_c9_87ca_cond;
     result_MUX_uxn_c_l282_c9_87ca_iftrue <= VAR_result_MUX_uxn_c_l282_c9_87ca_iftrue;
     result_MUX_uxn_c_l282_c9_87ca_iffalse <= VAR_result_MUX_uxn_c_l282_c9_87ca_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_c_l282_c9_87ca_return_output := result_MUX_uxn_c_l282_c9_87ca_return_output;

     -- Submodule level 12
     VAR_result_MUX_uxn_c_l280_c9_4116_iffalse := VAR_result_MUX_uxn_c_l282_c9_87ca_return_output;
     -- result_MUX[uxn_c_l280_c9_4116] LATENCY=0
     -- Inputs
     result_MUX_uxn_c_l280_c9_4116_cond <= VAR_result_MUX_uxn_c_l280_c9_4116_cond;
     result_MUX_uxn_c_l280_c9_4116_iftrue <= VAR_result_MUX_uxn_c_l280_c9_4116_iftrue;
     result_MUX_uxn_c_l280_c9_4116_iffalse <= VAR_result_MUX_uxn_c_l280_c9_4116_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_c_l280_c9_4116_return_output := result_MUX_uxn_c_l280_c9_4116_return_output;

     -- Submodule level 13
     VAR_result_MUX_uxn_c_l278_c2_508f_iffalse := VAR_result_MUX_uxn_c_l280_c9_4116_return_output;
     -- result_MUX[uxn_c_l278_c2_508f] LATENCY=0
     -- Inputs
     result_MUX_uxn_c_l278_c2_508f_cond <= VAR_result_MUX_uxn_c_l278_c2_508f_cond;
     result_MUX_uxn_c_l278_c2_508f_iftrue <= VAR_result_MUX_uxn_c_l278_c2_508f_iftrue;
     result_MUX_uxn_c_l278_c2_508f_iffalse <= VAR_result_MUX_uxn_c_l278_c2_508f_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_c_l278_c2_508f_return_output := result_MUX_uxn_c_l278_c2_508f_return_output;

     -- Submodule level 14
     REG_VAR_result := VAR_result_MUX_uxn_c_l278_c2_508f_return_output;
     VAR_return_output := VAR_result_MUX_uxn_c_l278_c2_508f_return_output;
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
