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
-- color_cmp_1_MUX[uxn_c_l190_c2_8d7e]
signal color_cmp_1_MUX_uxn_c_l190_c2_8d7e_cond : unsigned(0 downto 0);
signal color_cmp_1_MUX_uxn_c_l190_c2_8d7e_iftrue : unsigned(3 downto 0);
signal color_cmp_1_MUX_uxn_c_l190_c2_8d7e_iffalse : unsigned(3 downto 0);
signal color_cmp_1_MUX_uxn_c_l190_c2_8d7e_return_output : unsigned(3 downto 0);

-- color1_MUX[uxn_c_l190_c2_8d7e]
signal color1_MUX_uxn_c_l190_c2_8d7e_cond : unsigned(0 downto 0);
signal color1_MUX_uxn_c_l190_c2_8d7e_iftrue : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l190_c2_8d7e_iffalse : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l190_c2_8d7e_return_output : unsigned(11 downto 0);

-- color0_MUX[uxn_c_l190_c2_8d7e]
signal color0_MUX_uxn_c_l190_c2_8d7e_cond : unsigned(0 downto 0);
signal color0_MUX_uxn_c_l190_c2_8d7e_iftrue : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l190_c2_8d7e_iffalse : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l190_c2_8d7e_return_output : unsigned(11 downto 0);

-- color2_MUX[uxn_c_l190_c2_8d7e]
signal color2_MUX_uxn_c_l190_c2_8d7e_cond : unsigned(0 downto 0);
signal color2_MUX_uxn_c_l190_c2_8d7e_iftrue : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l190_c2_8d7e_iffalse : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l190_c2_8d7e_return_output : unsigned(11 downto 0);

-- color_cmp_0_MUX[uxn_c_l190_c2_8d7e]
signal color_cmp_0_MUX_uxn_c_l190_c2_8d7e_cond : unsigned(0 downto 0);
signal color_cmp_0_MUX_uxn_c_l190_c2_8d7e_iftrue : unsigned(3 downto 0);
signal color_cmp_0_MUX_uxn_c_l190_c2_8d7e_iffalse : unsigned(3 downto 0);
signal color_cmp_0_MUX_uxn_c_l190_c2_8d7e_return_output : unsigned(3 downto 0);

-- tmp12_MUX[uxn_c_l190_c2_8d7e]
signal tmp12_MUX_uxn_c_l190_c2_8d7e_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_c_l190_c2_8d7e_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l190_c2_8d7e_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l190_c2_8d7e_return_output : unsigned(11 downto 0);

-- color3_MUX[uxn_c_l190_c2_8d7e]
signal color3_MUX_uxn_c_l190_c2_8d7e_cond : unsigned(0 downto 0);
signal color3_MUX_uxn_c_l190_c2_8d7e_iftrue : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l190_c2_8d7e_iffalse : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l190_c2_8d7e_return_output : unsigned(11 downto 0);

-- CONST_SR_4[uxn_c_l191_c27_d570]
signal CONST_SR_4_uxn_c_l191_c27_d570_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_c_l191_c27_d570_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_c_l193_c7_01ac]
signal BIN_OP_EQ_uxn_c_l193_c7_01ac_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l193_c7_01ac_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l193_c7_01ac_return_output : unsigned(0 downto 0);

-- color1_MUX[uxn_c_l193_c3_e2b4]
signal color1_MUX_uxn_c_l193_c3_e2b4_cond : unsigned(0 downto 0);
signal color1_MUX_uxn_c_l193_c3_e2b4_iftrue : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l193_c3_e2b4_iffalse : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l193_c3_e2b4_return_output : unsigned(11 downto 0);

-- color0_MUX[uxn_c_l193_c3_e2b4]
signal color0_MUX_uxn_c_l193_c3_e2b4_cond : unsigned(0 downto 0);
signal color0_MUX_uxn_c_l193_c3_e2b4_iftrue : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l193_c3_e2b4_iffalse : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l193_c3_e2b4_return_output : unsigned(11 downto 0);

-- color2_MUX[uxn_c_l193_c3_e2b4]
signal color2_MUX_uxn_c_l193_c3_e2b4_cond : unsigned(0 downto 0);
signal color2_MUX_uxn_c_l193_c3_e2b4_iftrue : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l193_c3_e2b4_iffalse : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l193_c3_e2b4_return_output : unsigned(11 downto 0);

-- tmp12_MUX[uxn_c_l193_c3_e2b4]
signal tmp12_MUX_uxn_c_l193_c3_e2b4_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_c_l193_c3_e2b4_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l193_c3_e2b4_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l193_c3_e2b4_return_output : unsigned(11 downto 0);

-- color3_MUX[uxn_c_l193_c3_e2b4]
signal color3_MUX_uxn_c_l193_c3_e2b4_cond : unsigned(0 downto 0);
signal color3_MUX_uxn_c_l193_c3_e2b4_iftrue : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l193_c3_e2b4_iffalse : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l193_c3_e2b4_return_output : unsigned(11 downto 0);

-- CONST_SL_8[uxn_c_l195_c4_bcbe]
signal CONST_SL_8_uxn_c_l195_c4_bcbe_x : unsigned(11 downto 0);
signal CONST_SL_8_uxn_c_l195_c4_bcbe_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l196_c4_d4c9]
signal BIN_OP_AND_uxn_c_l196_c4_d4c9_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l196_c4_d4c9_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l196_c4_d4c9_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l197_c4_c276]
signal BIN_OP_OR_uxn_c_l197_c4_c276_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l197_c4_c276_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l197_c4_c276_return_output : unsigned(11 downto 0);

-- CONST_SL_8[uxn_c_l200_c4_ae00]
signal CONST_SL_8_uxn_c_l200_c4_ae00_x : unsigned(11 downto 0);
signal CONST_SL_8_uxn_c_l200_c4_ae00_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l201_c4_d94b]
signal BIN_OP_AND_uxn_c_l201_c4_d94b_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l201_c4_d94b_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l201_c4_d94b_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l202_c4_9617]
signal BIN_OP_OR_uxn_c_l202_c4_9617_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l202_c4_9617_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l202_c4_9617_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l204_c12_7fb7]
signal BIN_OP_EQ_uxn_c_l204_c12_7fb7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l204_c12_7fb7_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l204_c12_7fb7_return_output : unsigned(0 downto 0);

-- color1_MUX[uxn_c_l204_c8_1f11]
signal color1_MUX_uxn_c_l204_c8_1f11_cond : unsigned(0 downto 0);
signal color1_MUX_uxn_c_l204_c8_1f11_iftrue : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l204_c8_1f11_iffalse : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l204_c8_1f11_return_output : unsigned(11 downto 0);

-- color0_MUX[uxn_c_l204_c8_1f11]
signal color0_MUX_uxn_c_l204_c8_1f11_cond : unsigned(0 downto 0);
signal color0_MUX_uxn_c_l204_c8_1f11_iftrue : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l204_c8_1f11_iffalse : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l204_c8_1f11_return_output : unsigned(11 downto 0);

-- color2_MUX[uxn_c_l204_c8_1f11]
signal color2_MUX_uxn_c_l204_c8_1f11_cond : unsigned(0 downto 0);
signal color2_MUX_uxn_c_l204_c8_1f11_iftrue : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l204_c8_1f11_iffalse : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l204_c8_1f11_return_output : unsigned(11 downto 0);

-- tmp12_MUX[uxn_c_l204_c8_1f11]
signal tmp12_MUX_uxn_c_l204_c8_1f11_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_c_l204_c8_1f11_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l204_c8_1f11_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l204_c8_1f11_return_output : unsigned(11 downto 0);

-- color3_MUX[uxn_c_l204_c8_1f11]
signal color3_MUX_uxn_c_l204_c8_1f11_cond : unsigned(0 downto 0);
signal color3_MUX_uxn_c_l204_c8_1f11_iftrue : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l204_c8_1f11_iffalse : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l204_c8_1f11_return_output : unsigned(11 downto 0);

-- CONST_SL_8[uxn_c_l206_c4_a732]
signal CONST_SL_8_uxn_c_l206_c4_a732_x : unsigned(11 downto 0);
signal CONST_SL_8_uxn_c_l206_c4_a732_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l207_c4_25dd]
signal BIN_OP_AND_uxn_c_l207_c4_25dd_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l207_c4_25dd_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l207_c4_25dd_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l208_c4_c228]
signal BIN_OP_OR_uxn_c_l208_c4_c228_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l208_c4_c228_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l208_c4_c228_return_output : unsigned(11 downto 0);

-- CONST_SL_8[uxn_c_l211_c4_e7ce]
signal CONST_SL_8_uxn_c_l211_c4_e7ce_x : unsigned(11 downto 0);
signal CONST_SL_8_uxn_c_l211_c4_e7ce_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l212_c4_5570]
signal BIN_OP_AND_uxn_c_l212_c4_5570_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l212_c4_5570_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l212_c4_5570_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l213_c4_48c2]
signal BIN_OP_OR_uxn_c_l213_c4_48c2_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l213_c4_48c2_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l213_c4_48c2_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l215_c12_4982]
signal BIN_OP_EQ_uxn_c_l215_c12_4982_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l215_c12_4982_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l215_c12_4982_return_output : unsigned(0 downto 0);

-- color1_MUX[uxn_c_l215_c8_e926]
signal color1_MUX_uxn_c_l215_c8_e926_cond : unsigned(0 downto 0);
signal color1_MUX_uxn_c_l215_c8_e926_iftrue : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l215_c8_e926_iffalse : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l215_c8_e926_return_output : unsigned(11 downto 0);

-- color0_MUX[uxn_c_l215_c8_e926]
signal color0_MUX_uxn_c_l215_c8_e926_cond : unsigned(0 downto 0);
signal color0_MUX_uxn_c_l215_c8_e926_iftrue : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l215_c8_e926_iffalse : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l215_c8_e926_return_output : unsigned(11 downto 0);

-- color2_MUX[uxn_c_l215_c8_e926]
signal color2_MUX_uxn_c_l215_c8_e926_cond : unsigned(0 downto 0);
signal color2_MUX_uxn_c_l215_c8_e926_iftrue : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l215_c8_e926_iffalse : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l215_c8_e926_return_output : unsigned(11 downto 0);

-- tmp12_MUX[uxn_c_l215_c8_e926]
signal tmp12_MUX_uxn_c_l215_c8_e926_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_c_l215_c8_e926_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l215_c8_e926_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l215_c8_e926_return_output : unsigned(11 downto 0);

-- color3_MUX[uxn_c_l215_c8_e926]
signal color3_MUX_uxn_c_l215_c8_e926_cond : unsigned(0 downto 0);
signal color3_MUX_uxn_c_l215_c8_e926_iftrue : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l215_c8_e926_iffalse : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l215_c8_e926_return_output : unsigned(11 downto 0);

-- CONST_SL_4[uxn_c_l217_c4_9e50]
signal CONST_SL_4_uxn_c_l217_c4_9e50_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_c_l217_c4_9e50_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l218_c4_ae60]
signal BIN_OP_AND_uxn_c_l218_c4_ae60_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l218_c4_ae60_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l218_c4_ae60_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l219_c4_f9ca]
signal BIN_OP_OR_uxn_c_l219_c4_f9ca_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l219_c4_f9ca_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l219_c4_f9ca_return_output : unsigned(11 downto 0);

-- CONST_SL_4[uxn_c_l222_c4_1f3b]
signal CONST_SL_4_uxn_c_l222_c4_1f3b_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_c_l222_c4_1f3b_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l223_c4_c301]
signal BIN_OP_AND_uxn_c_l223_c4_c301_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l223_c4_c301_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l223_c4_c301_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l224_c4_c5ac]
signal BIN_OP_OR_uxn_c_l224_c4_c5ac_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l224_c4_c5ac_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l224_c4_c5ac_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l226_c12_2bf1]
signal BIN_OP_EQ_uxn_c_l226_c12_2bf1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l226_c12_2bf1_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l226_c12_2bf1_return_output : unsigned(0 downto 0);

-- color1_MUX[uxn_c_l226_c8_3d96]
signal color1_MUX_uxn_c_l226_c8_3d96_cond : unsigned(0 downto 0);
signal color1_MUX_uxn_c_l226_c8_3d96_iftrue : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l226_c8_3d96_iffalse : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l226_c8_3d96_return_output : unsigned(11 downto 0);

-- color0_MUX[uxn_c_l226_c8_3d96]
signal color0_MUX_uxn_c_l226_c8_3d96_cond : unsigned(0 downto 0);
signal color0_MUX_uxn_c_l226_c8_3d96_iftrue : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l226_c8_3d96_iffalse : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l226_c8_3d96_return_output : unsigned(11 downto 0);

-- color2_MUX[uxn_c_l226_c8_3d96]
signal color2_MUX_uxn_c_l226_c8_3d96_cond : unsigned(0 downto 0);
signal color2_MUX_uxn_c_l226_c8_3d96_iftrue : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l226_c8_3d96_iffalse : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l226_c8_3d96_return_output : unsigned(11 downto 0);

-- tmp12_MUX[uxn_c_l226_c8_3d96]
signal tmp12_MUX_uxn_c_l226_c8_3d96_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_c_l226_c8_3d96_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l226_c8_3d96_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l226_c8_3d96_return_output : unsigned(11 downto 0);

-- color3_MUX[uxn_c_l226_c8_3d96]
signal color3_MUX_uxn_c_l226_c8_3d96_cond : unsigned(0 downto 0);
signal color3_MUX_uxn_c_l226_c8_3d96_iftrue : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l226_c8_3d96_iffalse : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l226_c8_3d96_return_output : unsigned(11 downto 0);

-- CONST_SL_4[uxn_c_l228_c4_fec8]
signal CONST_SL_4_uxn_c_l228_c4_fec8_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_c_l228_c4_fec8_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l229_c4_84cb]
signal BIN_OP_AND_uxn_c_l229_c4_84cb_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l229_c4_84cb_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l229_c4_84cb_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l230_c4_7532]
signal BIN_OP_OR_uxn_c_l230_c4_7532_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l230_c4_7532_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l230_c4_7532_return_output : unsigned(11 downto 0);

-- CONST_SL_4[uxn_c_l233_c4_ae03]
signal CONST_SL_4_uxn_c_l233_c4_ae03_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_c_l233_c4_ae03_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l234_c4_92b9]
signal BIN_OP_AND_uxn_c_l234_c4_92b9_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l234_c4_92b9_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l234_c4_92b9_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l235_c4_da0f]
signal BIN_OP_OR_uxn_c_l235_c4_da0f_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l235_c4_da0f_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l235_c4_da0f_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l237_c12_bd7f]
signal BIN_OP_EQ_uxn_c_l237_c12_bd7f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l237_c12_bd7f_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l237_c12_bd7f_return_output : unsigned(0 downto 0);

-- color1_MUX[uxn_c_l237_c8_6a32]
signal color1_MUX_uxn_c_l237_c8_6a32_cond : unsigned(0 downto 0);
signal color1_MUX_uxn_c_l237_c8_6a32_iftrue : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l237_c8_6a32_iffalse : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l237_c8_6a32_return_output : unsigned(11 downto 0);

-- color0_MUX[uxn_c_l237_c8_6a32]
signal color0_MUX_uxn_c_l237_c8_6a32_cond : unsigned(0 downto 0);
signal color0_MUX_uxn_c_l237_c8_6a32_iftrue : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l237_c8_6a32_iffalse : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l237_c8_6a32_return_output : unsigned(11 downto 0);

-- color2_MUX[uxn_c_l237_c8_6a32]
signal color2_MUX_uxn_c_l237_c8_6a32_cond : unsigned(0 downto 0);
signal color2_MUX_uxn_c_l237_c8_6a32_iftrue : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l237_c8_6a32_iffalse : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l237_c8_6a32_return_output : unsigned(11 downto 0);

-- tmp12_MUX[uxn_c_l237_c8_6a32]
signal tmp12_MUX_uxn_c_l237_c8_6a32_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_c_l237_c8_6a32_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l237_c8_6a32_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l237_c8_6a32_return_output : unsigned(11 downto 0);

-- color3_MUX[uxn_c_l237_c8_6a32]
signal color3_MUX_uxn_c_l237_c8_6a32_cond : unsigned(0 downto 0);
signal color3_MUX_uxn_c_l237_c8_6a32_iftrue : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l237_c8_6a32_iffalse : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l237_c8_6a32_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l239_c4_3ebe]
signal BIN_OP_AND_uxn_c_l239_c4_3ebe_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l239_c4_3ebe_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l239_c4_3ebe_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l240_c4_13f0]
signal BIN_OP_OR_uxn_c_l240_c4_13f0_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l240_c4_13f0_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l240_c4_13f0_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l243_c4_f104]
signal BIN_OP_AND_uxn_c_l243_c4_f104_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l243_c4_f104_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l243_c4_f104_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l244_c4_36f6]
signal BIN_OP_OR_uxn_c_l244_c4_36f6_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l244_c4_36f6_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l244_c4_36f6_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l246_c12_0442]
signal BIN_OP_EQ_uxn_c_l246_c12_0442_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l246_c12_0442_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l246_c12_0442_return_output : unsigned(0 downto 0);

-- color2_MUX[uxn_c_l246_c8_10f9]
signal color2_MUX_uxn_c_l246_c8_10f9_cond : unsigned(0 downto 0);
signal color2_MUX_uxn_c_l246_c8_10f9_iftrue : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l246_c8_10f9_iffalse : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l246_c8_10f9_return_output : unsigned(11 downto 0);

-- tmp12_MUX[uxn_c_l246_c8_10f9]
signal tmp12_MUX_uxn_c_l246_c8_10f9_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_c_l246_c8_10f9_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l246_c8_10f9_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l246_c8_10f9_return_output : unsigned(11 downto 0);

-- color3_MUX[uxn_c_l246_c8_10f9]
signal color3_MUX_uxn_c_l246_c8_10f9_cond : unsigned(0 downto 0);
signal color3_MUX_uxn_c_l246_c8_10f9_iftrue : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l246_c8_10f9_iffalse : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l246_c8_10f9_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l248_c4_702b]
signal BIN_OP_AND_uxn_c_l248_c4_702b_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l248_c4_702b_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l248_c4_702b_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l249_c4_bd0e]
signal BIN_OP_OR_uxn_c_l249_c4_bd0e_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l249_c4_bd0e_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l249_c4_bd0e_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l252_c4_79f5]
signal BIN_OP_AND_uxn_c_l252_c4_79f5_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l252_c4_79f5_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l252_c4_79f5_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l253_c4_2638]
signal BIN_OP_OR_uxn_c_l253_c4_2638_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l253_c4_2638_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l253_c4_2638_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l257_c6_f952]
signal BIN_OP_EQ_uxn_c_l257_c6_f952_left : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l257_c6_f952_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l257_c6_f952_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_c_l257_c2_60f0]
signal result_MUX_uxn_c_l257_c2_60f0_cond : unsigned(0 downto 0);
signal result_MUX_uxn_c_l257_c2_60f0_iftrue : unsigned(15 downto 0);
signal result_MUX_uxn_c_l257_c2_60f0_iffalse : unsigned(15 downto 0);
signal result_MUX_uxn_c_l257_c2_60f0_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l259_c13_d72c]
signal BIN_OP_EQ_uxn_c_l259_c13_d72c_left : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l259_c13_d72c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l259_c13_d72c_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_c_l259_c9_39c4]
signal result_MUX_uxn_c_l259_c9_39c4_cond : unsigned(0 downto 0);
signal result_MUX_uxn_c_l259_c9_39c4_iftrue : unsigned(15 downto 0);
signal result_MUX_uxn_c_l259_c9_39c4_iffalse : unsigned(15 downto 0);
signal result_MUX_uxn_c_l259_c9_39c4_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l261_c13_045a]
signal BIN_OP_EQ_uxn_c_l261_c13_045a_left : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l261_c13_045a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l261_c13_045a_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_c_l261_c9_5f7b]
signal result_MUX_uxn_c_l261_c9_5f7b_cond : unsigned(0 downto 0);
signal result_MUX_uxn_c_l261_c9_5f7b_iftrue : unsigned(15 downto 0);
signal result_MUX_uxn_c_l261_c9_5f7b_iffalse : unsigned(15 downto 0);
signal result_MUX_uxn_c_l261_c9_5f7b_return_output : unsigned(15 downto 0);

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
-- color_cmp_1_MUX_uxn_c_l190_c2_8d7e
color_cmp_1_MUX_uxn_c_l190_c2_8d7e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_cmp_1_MUX_uxn_c_l190_c2_8d7e_cond,
color_cmp_1_MUX_uxn_c_l190_c2_8d7e_iftrue,
color_cmp_1_MUX_uxn_c_l190_c2_8d7e_iffalse,
color_cmp_1_MUX_uxn_c_l190_c2_8d7e_return_output);

-- color1_MUX_uxn_c_l190_c2_8d7e
color1_MUX_uxn_c_l190_c2_8d7e : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color1_MUX_uxn_c_l190_c2_8d7e_cond,
color1_MUX_uxn_c_l190_c2_8d7e_iftrue,
color1_MUX_uxn_c_l190_c2_8d7e_iffalse,
color1_MUX_uxn_c_l190_c2_8d7e_return_output);

-- color0_MUX_uxn_c_l190_c2_8d7e
color0_MUX_uxn_c_l190_c2_8d7e : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color0_MUX_uxn_c_l190_c2_8d7e_cond,
color0_MUX_uxn_c_l190_c2_8d7e_iftrue,
color0_MUX_uxn_c_l190_c2_8d7e_iffalse,
color0_MUX_uxn_c_l190_c2_8d7e_return_output);

-- color2_MUX_uxn_c_l190_c2_8d7e
color2_MUX_uxn_c_l190_c2_8d7e : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color2_MUX_uxn_c_l190_c2_8d7e_cond,
color2_MUX_uxn_c_l190_c2_8d7e_iftrue,
color2_MUX_uxn_c_l190_c2_8d7e_iffalse,
color2_MUX_uxn_c_l190_c2_8d7e_return_output);

-- color_cmp_0_MUX_uxn_c_l190_c2_8d7e
color_cmp_0_MUX_uxn_c_l190_c2_8d7e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_cmp_0_MUX_uxn_c_l190_c2_8d7e_cond,
color_cmp_0_MUX_uxn_c_l190_c2_8d7e_iftrue,
color_cmp_0_MUX_uxn_c_l190_c2_8d7e_iffalse,
color_cmp_0_MUX_uxn_c_l190_c2_8d7e_return_output);

-- tmp12_MUX_uxn_c_l190_c2_8d7e
tmp12_MUX_uxn_c_l190_c2_8d7e : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_c_l190_c2_8d7e_cond,
tmp12_MUX_uxn_c_l190_c2_8d7e_iftrue,
tmp12_MUX_uxn_c_l190_c2_8d7e_iffalse,
tmp12_MUX_uxn_c_l190_c2_8d7e_return_output);

-- color3_MUX_uxn_c_l190_c2_8d7e
color3_MUX_uxn_c_l190_c2_8d7e : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color3_MUX_uxn_c_l190_c2_8d7e_cond,
color3_MUX_uxn_c_l190_c2_8d7e_iftrue,
color3_MUX_uxn_c_l190_c2_8d7e_iffalse,
color3_MUX_uxn_c_l190_c2_8d7e_return_output);

-- CONST_SR_4_uxn_c_l191_c27_d570
CONST_SR_4_uxn_c_l191_c27_d570 : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_c_l191_c27_d570_x,
CONST_SR_4_uxn_c_l191_c27_d570_return_output);

-- BIN_OP_EQ_uxn_c_l193_c7_01ac
BIN_OP_EQ_uxn_c_l193_c7_01ac : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l193_c7_01ac_left,
BIN_OP_EQ_uxn_c_l193_c7_01ac_right,
BIN_OP_EQ_uxn_c_l193_c7_01ac_return_output);

-- color1_MUX_uxn_c_l193_c3_e2b4
color1_MUX_uxn_c_l193_c3_e2b4 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color1_MUX_uxn_c_l193_c3_e2b4_cond,
color1_MUX_uxn_c_l193_c3_e2b4_iftrue,
color1_MUX_uxn_c_l193_c3_e2b4_iffalse,
color1_MUX_uxn_c_l193_c3_e2b4_return_output);

-- color0_MUX_uxn_c_l193_c3_e2b4
color0_MUX_uxn_c_l193_c3_e2b4 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color0_MUX_uxn_c_l193_c3_e2b4_cond,
color0_MUX_uxn_c_l193_c3_e2b4_iftrue,
color0_MUX_uxn_c_l193_c3_e2b4_iffalse,
color0_MUX_uxn_c_l193_c3_e2b4_return_output);

-- color2_MUX_uxn_c_l193_c3_e2b4
color2_MUX_uxn_c_l193_c3_e2b4 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color2_MUX_uxn_c_l193_c3_e2b4_cond,
color2_MUX_uxn_c_l193_c3_e2b4_iftrue,
color2_MUX_uxn_c_l193_c3_e2b4_iffalse,
color2_MUX_uxn_c_l193_c3_e2b4_return_output);

-- tmp12_MUX_uxn_c_l193_c3_e2b4
tmp12_MUX_uxn_c_l193_c3_e2b4 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_c_l193_c3_e2b4_cond,
tmp12_MUX_uxn_c_l193_c3_e2b4_iftrue,
tmp12_MUX_uxn_c_l193_c3_e2b4_iffalse,
tmp12_MUX_uxn_c_l193_c3_e2b4_return_output);

-- color3_MUX_uxn_c_l193_c3_e2b4
color3_MUX_uxn_c_l193_c3_e2b4 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color3_MUX_uxn_c_l193_c3_e2b4_cond,
color3_MUX_uxn_c_l193_c3_e2b4_iftrue,
color3_MUX_uxn_c_l193_c3_e2b4_iffalse,
color3_MUX_uxn_c_l193_c3_e2b4_return_output);

-- CONST_SL_8_uxn_c_l195_c4_bcbe
CONST_SL_8_uxn_c_l195_c4_bcbe : entity work.CONST_SL_8_uint12_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l195_c4_bcbe_x,
CONST_SL_8_uxn_c_l195_c4_bcbe_return_output);

-- BIN_OP_AND_uxn_c_l196_c4_d4c9
BIN_OP_AND_uxn_c_l196_c4_d4c9 : entity work.BIN_OP_AND_uint12_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l196_c4_d4c9_left,
BIN_OP_AND_uxn_c_l196_c4_d4c9_right,
BIN_OP_AND_uxn_c_l196_c4_d4c9_return_output);

-- BIN_OP_OR_uxn_c_l197_c4_c276
BIN_OP_OR_uxn_c_l197_c4_c276 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l197_c4_c276_left,
BIN_OP_OR_uxn_c_l197_c4_c276_right,
BIN_OP_OR_uxn_c_l197_c4_c276_return_output);

-- CONST_SL_8_uxn_c_l200_c4_ae00
CONST_SL_8_uxn_c_l200_c4_ae00 : entity work.CONST_SL_8_uint12_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l200_c4_ae00_x,
CONST_SL_8_uxn_c_l200_c4_ae00_return_output);

-- BIN_OP_AND_uxn_c_l201_c4_d94b
BIN_OP_AND_uxn_c_l201_c4_d94b : entity work.BIN_OP_AND_uint12_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l201_c4_d94b_left,
BIN_OP_AND_uxn_c_l201_c4_d94b_right,
BIN_OP_AND_uxn_c_l201_c4_d94b_return_output);

-- BIN_OP_OR_uxn_c_l202_c4_9617
BIN_OP_OR_uxn_c_l202_c4_9617 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l202_c4_9617_left,
BIN_OP_OR_uxn_c_l202_c4_9617_right,
BIN_OP_OR_uxn_c_l202_c4_9617_return_output);

-- BIN_OP_EQ_uxn_c_l204_c12_7fb7
BIN_OP_EQ_uxn_c_l204_c12_7fb7 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l204_c12_7fb7_left,
BIN_OP_EQ_uxn_c_l204_c12_7fb7_right,
BIN_OP_EQ_uxn_c_l204_c12_7fb7_return_output);

-- color1_MUX_uxn_c_l204_c8_1f11
color1_MUX_uxn_c_l204_c8_1f11 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color1_MUX_uxn_c_l204_c8_1f11_cond,
color1_MUX_uxn_c_l204_c8_1f11_iftrue,
color1_MUX_uxn_c_l204_c8_1f11_iffalse,
color1_MUX_uxn_c_l204_c8_1f11_return_output);

-- color0_MUX_uxn_c_l204_c8_1f11
color0_MUX_uxn_c_l204_c8_1f11 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color0_MUX_uxn_c_l204_c8_1f11_cond,
color0_MUX_uxn_c_l204_c8_1f11_iftrue,
color0_MUX_uxn_c_l204_c8_1f11_iffalse,
color0_MUX_uxn_c_l204_c8_1f11_return_output);

-- color2_MUX_uxn_c_l204_c8_1f11
color2_MUX_uxn_c_l204_c8_1f11 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color2_MUX_uxn_c_l204_c8_1f11_cond,
color2_MUX_uxn_c_l204_c8_1f11_iftrue,
color2_MUX_uxn_c_l204_c8_1f11_iffalse,
color2_MUX_uxn_c_l204_c8_1f11_return_output);

-- tmp12_MUX_uxn_c_l204_c8_1f11
tmp12_MUX_uxn_c_l204_c8_1f11 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_c_l204_c8_1f11_cond,
tmp12_MUX_uxn_c_l204_c8_1f11_iftrue,
tmp12_MUX_uxn_c_l204_c8_1f11_iffalse,
tmp12_MUX_uxn_c_l204_c8_1f11_return_output);

-- color3_MUX_uxn_c_l204_c8_1f11
color3_MUX_uxn_c_l204_c8_1f11 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color3_MUX_uxn_c_l204_c8_1f11_cond,
color3_MUX_uxn_c_l204_c8_1f11_iftrue,
color3_MUX_uxn_c_l204_c8_1f11_iffalse,
color3_MUX_uxn_c_l204_c8_1f11_return_output);

-- CONST_SL_8_uxn_c_l206_c4_a732
CONST_SL_8_uxn_c_l206_c4_a732 : entity work.CONST_SL_8_uint12_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l206_c4_a732_x,
CONST_SL_8_uxn_c_l206_c4_a732_return_output);

-- BIN_OP_AND_uxn_c_l207_c4_25dd
BIN_OP_AND_uxn_c_l207_c4_25dd : entity work.BIN_OP_AND_uint12_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l207_c4_25dd_left,
BIN_OP_AND_uxn_c_l207_c4_25dd_right,
BIN_OP_AND_uxn_c_l207_c4_25dd_return_output);

-- BIN_OP_OR_uxn_c_l208_c4_c228
BIN_OP_OR_uxn_c_l208_c4_c228 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l208_c4_c228_left,
BIN_OP_OR_uxn_c_l208_c4_c228_right,
BIN_OP_OR_uxn_c_l208_c4_c228_return_output);

-- CONST_SL_8_uxn_c_l211_c4_e7ce
CONST_SL_8_uxn_c_l211_c4_e7ce : entity work.CONST_SL_8_uint12_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l211_c4_e7ce_x,
CONST_SL_8_uxn_c_l211_c4_e7ce_return_output);

-- BIN_OP_AND_uxn_c_l212_c4_5570
BIN_OP_AND_uxn_c_l212_c4_5570 : entity work.BIN_OP_AND_uint12_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l212_c4_5570_left,
BIN_OP_AND_uxn_c_l212_c4_5570_right,
BIN_OP_AND_uxn_c_l212_c4_5570_return_output);

-- BIN_OP_OR_uxn_c_l213_c4_48c2
BIN_OP_OR_uxn_c_l213_c4_48c2 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l213_c4_48c2_left,
BIN_OP_OR_uxn_c_l213_c4_48c2_right,
BIN_OP_OR_uxn_c_l213_c4_48c2_return_output);

-- BIN_OP_EQ_uxn_c_l215_c12_4982
BIN_OP_EQ_uxn_c_l215_c12_4982 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l215_c12_4982_left,
BIN_OP_EQ_uxn_c_l215_c12_4982_right,
BIN_OP_EQ_uxn_c_l215_c12_4982_return_output);

-- color1_MUX_uxn_c_l215_c8_e926
color1_MUX_uxn_c_l215_c8_e926 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color1_MUX_uxn_c_l215_c8_e926_cond,
color1_MUX_uxn_c_l215_c8_e926_iftrue,
color1_MUX_uxn_c_l215_c8_e926_iffalse,
color1_MUX_uxn_c_l215_c8_e926_return_output);

-- color0_MUX_uxn_c_l215_c8_e926
color0_MUX_uxn_c_l215_c8_e926 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color0_MUX_uxn_c_l215_c8_e926_cond,
color0_MUX_uxn_c_l215_c8_e926_iftrue,
color0_MUX_uxn_c_l215_c8_e926_iffalse,
color0_MUX_uxn_c_l215_c8_e926_return_output);

-- color2_MUX_uxn_c_l215_c8_e926
color2_MUX_uxn_c_l215_c8_e926 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color2_MUX_uxn_c_l215_c8_e926_cond,
color2_MUX_uxn_c_l215_c8_e926_iftrue,
color2_MUX_uxn_c_l215_c8_e926_iffalse,
color2_MUX_uxn_c_l215_c8_e926_return_output);

-- tmp12_MUX_uxn_c_l215_c8_e926
tmp12_MUX_uxn_c_l215_c8_e926 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_c_l215_c8_e926_cond,
tmp12_MUX_uxn_c_l215_c8_e926_iftrue,
tmp12_MUX_uxn_c_l215_c8_e926_iffalse,
tmp12_MUX_uxn_c_l215_c8_e926_return_output);

-- color3_MUX_uxn_c_l215_c8_e926
color3_MUX_uxn_c_l215_c8_e926 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color3_MUX_uxn_c_l215_c8_e926_cond,
color3_MUX_uxn_c_l215_c8_e926_iftrue,
color3_MUX_uxn_c_l215_c8_e926_iffalse,
color3_MUX_uxn_c_l215_c8_e926_return_output);

-- CONST_SL_4_uxn_c_l217_c4_9e50
CONST_SL_4_uxn_c_l217_c4_9e50 : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_c_l217_c4_9e50_x,
CONST_SL_4_uxn_c_l217_c4_9e50_return_output);

-- BIN_OP_AND_uxn_c_l218_c4_ae60
BIN_OP_AND_uxn_c_l218_c4_ae60 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l218_c4_ae60_left,
BIN_OP_AND_uxn_c_l218_c4_ae60_right,
BIN_OP_AND_uxn_c_l218_c4_ae60_return_output);

-- BIN_OP_OR_uxn_c_l219_c4_f9ca
BIN_OP_OR_uxn_c_l219_c4_f9ca : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l219_c4_f9ca_left,
BIN_OP_OR_uxn_c_l219_c4_f9ca_right,
BIN_OP_OR_uxn_c_l219_c4_f9ca_return_output);

-- CONST_SL_4_uxn_c_l222_c4_1f3b
CONST_SL_4_uxn_c_l222_c4_1f3b : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_c_l222_c4_1f3b_x,
CONST_SL_4_uxn_c_l222_c4_1f3b_return_output);

-- BIN_OP_AND_uxn_c_l223_c4_c301
BIN_OP_AND_uxn_c_l223_c4_c301 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l223_c4_c301_left,
BIN_OP_AND_uxn_c_l223_c4_c301_right,
BIN_OP_AND_uxn_c_l223_c4_c301_return_output);

-- BIN_OP_OR_uxn_c_l224_c4_c5ac
BIN_OP_OR_uxn_c_l224_c4_c5ac : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l224_c4_c5ac_left,
BIN_OP_OR_uxn_c_l224_c4_c5ac_right,
BIN_OP_OR_uxn_c_l224_c4_c5ac_return_output);

-- BIN_OP_EQ_uxn_c_l226_c12_2bf1
BIN_OP_EQ_uxn_c_l226_c12_2bf1 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l226_c12_2bf1_left,
BIN_OP_EQ_uxn_c_l226_c12_2bf1_right,
BIN_OP_EQ_uxn_c_l226_c12_2bf1_return_output);

-- color1_MUX_uxn_c_l226_c8_3d96
color1_MUX_uxn_c_l226_c8_3d96 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color1_MUX_uxn_c_l226_c8_3d96_cond,
color1_MUX_uxn_c_l226_c8_3d96_iftrue,
color1_MUX_uxn_c_l226_c8_3d96_iffalse,
color1_MUX_uxn_c_l226_c8_3d96_return_output);

-- color0_MUX_uxn_c_l226_c8_3d96
color0_MUX_uxn_c_l226_c8_3d96 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color0_MUX_uxn_c_l226_c8_3d96_cond,
color0_MUX_uxn_c_l226_c8_3d96_iftrue,
color0_MUX_uxn_c_l226_c8_3d96_iffalse,
color0_MUX_uxn_c_l226_c8_3d96_return_output);

-- color2_MUX_uxn_c_l226_c8_3d96
color2_MUX_uxn_c_l226_c8_3d96 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color2_MUX_uxn_c_l226_c8_3d96_cond,
color2_MUX_uxn_c_l226_c8_3d96_iftrue,
color2_MUX_uxn_c_l226_c8_3d96_iffalse,
color2_MUX_uxn_c_l226_c8_3d96_return_output);

-- tmp12_MUX_uxn_c_l226_c8_3d96
tmp12_MUX_uxn_c_l226_c8_3d96 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_c_l226_c8_3d96_cond,
tmp12_MUX_uxn_c_l226_c8_3d96_iftrue,
tmp12_MUX_uxn_c_l226_c8_3d96_iffalse,
tmp12_MUX_uxn_c_l226_c8_3d96_return_output);

-- color3_MUX_uxn_c_l226_c8_3d96
color3_MUX_uxn_c_l226_c8_3d96 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color3_MUX_uxn_c_l226_c8_3d96_cond,
color3_MUX_uxn_c_l226_c8_3d96_iftrue,
color3_MUX_uxn_c_l226_c8_3d96_iffalse,
color3_MUX_uxn_c_l226_c8_3d96_return_output);

-- CONST_SL_4_uxn_c_l228_c4_fec8
CONST_SL_4_uxn_c_l228_c4_fec8 : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_c_l228_c4_fec8_x,
CONST_SL_4_uxn_c_l228_c4_fec8_return_output);

-- BIN_OP_AND_uxn_c_l229_c4_84cb
BIN_OP_AND_uxn_c_l229_c4_84cb : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l229_c4_84cb_left,
BIN_OP_AND_uxn_c_l229_c4_84cb_right,
BIN_OP_AND_uxn_c_l229_c4_84cb_return_output);

-- BIN_OP_OR_uxn_c_l230_c4_7532
BIN_OP_OR_uxn_c_l230_c4_7532 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l230_c4_7532_left,
BIN_OP_OR_uxn_c_l230_c4_7532_right,
BIN_OP_OR_uxn_c_l230_c4_7532_return_output);

-- CONST_SL_4_uxn_c_l233_c4_ae03
CONST_SL_4_uxn_c_l233_c4_ae03 : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_c_l233_c4_ae03_x,
CONST_SL_4_uxn_c_l233_c4_ae03_return_output);

-- BIN_OP_AND_uxn_c_l234_c4_92b9
BIN_OP_AND_uxn_c_l234_c4_92b9 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l234_c4_92b9_left,
BIN_OP_AND_uxn_c_l234_c4_92b9_right,
BIN_OP_AND_uxn_c_l234_c4_92b9_return_output);

-- BIN_OP_OR_uxn_c_l235_c4_da0f
BIN_OP_OR_uxn_c_l235_c4_da0f : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l235_c4_da0f_left,
BIN_OP_OR_uxn_c_l235_c4_da0f_right,
BIN_OP_OR_uxn_c_l235_c4_da0f_return_output);

-- BIN_OP_EQ_uxn_c_l237_c12_bd7f
BIN_OP_EQ_uxn_c_l237_c12_bd7f : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l237_c12_bd7f_left,
BIN_OP_EQ_uxn_c_l237_c12_bd7f_right,
BIN_OP_EQ_uxn_c_l237_c12_bd7f_return_output);

-- color1_MUX_uxn_c_l237_c8_6a32
color1_MUX_uxn_c_l237_c8_6a32 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color1_MUX_uxn_c_l237_c8_6a32_cond,
color1_MUX_uxn_c_l237_c8_6a32_iftrue,
color1_MUX_uxn_c_l237_c8_6a32_iffalse,
color1_MUX_uxn_c_l237_c8_6a32_return_output);

-- color0_MUX_uxn_c_l237_c8_6a32
color0_MUX_uxn_c_l237_c8_6a32 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color0_MUX_uxn_c_l237_c8_6a32_cond,
color0_MUX_uxn_c_l237_c8_6a32_iftrue,
color0_MUX_uxn_c_l237_c8_6a32_iffalse,
color0_MUX_uxn_c_l237_c8_6a32_return_output);

-- color2_MUX_uxn_c_l237_c8_6a32
color2_MUX_uxn_c_l237_c8_6a32 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color2_MUX_uxn_c_l237_c8_6a32_cond,
color2_MUX_uxn_c_l237_c8_6a32_iftrue,
color2_MUX_uxn_c_l237_c8_6a32_iffalse,
color2_MUX_uxn_c_l237_c8_6a32_return_output);

-- tmp12_MUX_uxn_c_l237_c8_6a32
tmp12_MUX_uxn_c_l237_c8_6a32 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_c_l237_c8_6a32_cond,
tmp12_MUX_uxn_c_l237_c8_6a32_iftrue,
tmp12_MUX_uxn_c_l237_c8_6a32_iffalse,
tmp12_MUX_uxn_c_l237_c8_6a32_return_output);

-- color3_MUX_uxn_c_l237_c8_6a32
color3_MUX_uxn_c_l237_c8_6a32 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color3_MUX_uxn_c_l237_c8_6a32_cond,
color3_MUX_uxn_c_l237_c8_6a32_iftrue,
color3_MUX_uxn_c_l237_c8_6a32_iffalse,
color3_MUX_uxn_c_l237_c8_6a32_return_output);

-- BIN_OP_AND_uxn_c_l239_c4_3ebe
BIN_OP_AND_uxn_c_l239_c4_3ebe : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l239_c4_3ebe_left,
BIN_OP_AND_uxn_c_l239_c4_3ebe_right,
BIN_OP_AND_uxn_c_l239_c4_3ebe_return_output);

-- BIN_OP_OR_uxn_c_l240_c4_13f0
BIN_OP_OR_uxn_c_l240_c4_13f0 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l240_c4_13f0_left,
BIN_OP_OR_uxn_c_l240_c4_13f0_right,
BIN_OP_OR_uxn_c_l240_c4_13f0_return_output);

-- BIN_OP_AND_uxn_c_l243_c4_f104
BIN_OP_AND_uxn_c_l243_c4_f104 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l243_c4_f104_left,
BIN_OP_AND_uxn_c_l243_c4_f104_right,
BIN_OP_AND_uxn_c_l243_c4_f104_return_output);

-- BIN_OP_OR_uxn_c_l244_c4_36f6
BIN_OP_OR_uxn_c_l244_c4_36f6 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l244_c4_36f6_left,
BIN_OP_OR_uxn_c_l244_c4_36f6_right,
BIN_OP_OR_uxn_c_l244_c4_36f6_return_output);

-- BIN_OP_EQ_uxn_c_l246_c12_0442
BIN_OP_EQ_uxn_c_l246_c12_0442 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l246_c12_0442_left,
BIN_OP_EQ_uxn_c_l246_c12_0442_right,
BIN_OP_EQ_uxn_c_l246_c12_0442_return_output);

-- color2_MUX_uxn_c_l246_c8_10f9
color2_MUX_uxn_c_l246_c8_10f9 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color2_MUX_uxn_c_l246_c8_10f9_cond,
color2_MUX_uxn_c_l246_c8_10f9_iftrue,
color2_MUX_uxn_c_l246_c8_10f9_iffalse,
color2_MUX_uxn_c_l246_c8_10f9_return_output);

-- tmp12_MUX_uxn_c_l246_c8_10f9
tmp12_MUX_uxn_c_l246_c8_10f9 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_c_l246_c8_10f9_cond,
tmp12_MUX_uxn_c_l246_c8_10f9_iftrue,
tmp12_MUX_uxn_c_l246_c8_10f9_iffalse,
tmp12_MUX_uxn_c_l246_c8_10f9_return_output);

-- color3_MUX_uxn_c_l246_c8_10f9
color3_MUX_uxn_c_l246_c8_10f9 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color3_MUX_uxn_c_l246_c8_10f9_cond,
color3_MUX_uxn_c_l246_c8_10f9_iftrue,
color3_MUX_uxn_c_l246_c8_10f9_iffalse,
color3_MUX_uxn_c_l246_c8_10f9_return_output);

-- BIN_OP_AND_uxn_c_l248_c4_702b
BIN_OP_AND_uxn_c_l248_c4_702b : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l248_c4_702b_left,
BIN_OP_AND_uxn_c_l248_c4_702b_right,
BIN_OP_AND_uxn_c_l248_c4_702b_return_output);

-- BIN_OP_OR_uxn_c_l249_c4_bd0e
BIN_OP_OR_uxn_c_l249_c4_bd0e : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l249_c4_bd0e_left,
BIN_OP_OR_uxn_c_l249_c4_bd0e_right,
BIN_OP_OR_uxn_c_l249_c4_bd0e_return_output);

-- BIN_OP_AND_uxn_c_l252_c4_79f5
BIN_OP_AND_uxn_c_l252_c4_79f5 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l252_c4_79f5_left,
BIN_OP_AND_uxn_c_l252_c4_79f5_right,
BIN_OP_AND_uxn_c_l252_c4_79f5_return_output);

-- BIN_OP_OR_uxn_c_l253_c4_2638
BIN_OP_OR_uxn_c_l253_c4_2638 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l253_c4_2638_left,
BIN_OP_OR_uxn_c_l253_c4_2638_right,
BIN_OP_OR_uxn_c_l253_c4_2638_return_output);

-- BIN_OP_EQ_uxn_c_l257_c6_f952
BIN_OP_EQ_uxn_c_l257_c6_f952 : entity work.BIN_OP_EQ_uint2_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l257_c6_f952_left,
BIN_OP_EQ_uxn_c_l257_c6_f952_right,
BIN_OP_EQ_uxn_c_l257_c6_f952_return_output);

-- result_MUX_uxn_c_l257_c2_60f0
result_MUX_uxn_c_l257_c2_60f0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_MUX_uxn_c_l257_c2_60f0_cond,
result_MUX_uxn_c_l257_c2_60f0_iftrue,
result_MUX_uxn_c_l257_c2_60f0_iffalse,
result_MUX_uxn_c_l257_c2_60f0_return_output);

-- BIN_OP_EQ_uxn_c_l259_c13_d72c
BIN_OP_EQ_uxn_c_l259_c13_d72c : entity work.BIN_OP_EQ_uint2_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l259_c13_d72c_left,
BIN_OP_EQ_uxn_c_l259_c13_d72c_right,
BIN_OP_EQ_uxn_c_l259_c13_d72c_return_output);

-- result_MUX_uxn_c_l259_c9_39c4
result_MUX_uxn_c_l259_c9_39c4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_MUX_uxn_c_l259_c9_39c4_cond,
result_MUX_uxn_c_l259_c9_39c4_iftrue,
result_MUX_uxn_c_l259_c9_39c4_iffalse,
result_MUX_uxn_c_l259_c9_39c4_return_output);

-- BIN_OP_EQ_uxn_c_l261_c13_045a
BIN_OP_EQ_uxn_c_l261_c13_045a : entity work.BIN_OP_EQ_uint2_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l261_c13_045a_left,
BIN_OP_EQ_uxn_c_l261_c13_045a_right,
BIN_OP_EQ_uxn_c_l261_c13_045a_return_output);

-- result_MUX_uxn_c_l261_c9_5f7b
result_MUX_uxn_c_l261_c9_5f7b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_MUX_uxn_c_l261_c9_5f7b_cond,
result_MUX_uxn_c_l261_c9_5f7b_iftrue,
result_MUX_uxn_c_l261_c9_5f7b_iffalse,
result_MUX_uxn_c_l261_c9_5f7b_return_output);



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
 color_cmp_1_MUX_uxn_c_l190_c2_8d7e_return_output,
 color1_MUX_uxn_c_l190_c2_8d7e_return_output,
 color0_MUX_uxn_c_l190_c2_8d7e_return_output,
 color2_MUX_uxn_c_l190_c2_8d7e_return_output,
 color_cmp_0_MUX_uxn_c_l190_c2_8d7e_return_output,
 tmp12_MUX_uxn_c_l190_c2_8d7e_return_output,
 color3_MUX_uxn_c_l190_c2_8d7e_return_output,
 CONST_SR_4_uxn_c_l191_c27_d570_return_output,
 BIN_OP_EQ_uxn_c_l193_c7_01ac_return_output,
 color1_MUX_uxn_c_l193_c3_e2b4_return_output,
 color0_MUX_uxn_c_l193_c3_e2b4_return_output,
 color2_MUX_uxn_c_l193_c3_e2b4_return_output,
 tmp12_MUX_uxn_c_l193_c3_e2b4_return_output,
 color3_MUX_uxn_c_l193_c3_e2b4_return_output,
 CONST_SL_8_uxn_c_l195_c4_bcbe_return_output,
 BIN_OP_AND_uxn_c_l196_c4_d4c9_return_output,
 BIN_OP_OR_uxn_c_l197_c4_c276_return_output,
 CONST_SL_8_uxn_c_l200_c4_ae00_return_output,
 BIN_OP_AND_uxn_c_l201_c4_d94b_return_output,
 BIN_OP_OR_uxn_c_l202_c4_9617_return_output,
 BIN_OP_EQ_uxn_c_l204_c12_7fb7_return_output,
 color1_MUX_uxn_c_l204_c8_1f11_return_output,
 color0_MUX_uxn_c_l204_c8_1f11_return_output,
 color2_MUX_uxn_c_l204_c8_1f11_return_output,
 tmp12_MUX_uxn_c_l204_c8_1f11_return_output,
 color3_MUX_uxn_c_l204_c8_1f11_return_output,
 CONST_SL_8_uxn_c_l206_c4_a732_return_output,
 BIN_OP_AND_uxn_c_l207_c4_25dd_return_output,
 BIN_OP_OR_uxn_c_l208_c4_c228_return_output,
 CONST_SL_8_uxn_c_l211_c4_e7ce_return_output,
 BIN_OP_AND_uxn_c_l212_c4_5570_return_output,
 BIN_OP_OR_uxn_c_l213_c4_48c2_return_output,
 BIN_OP_EQ_uxn_c_l215_c12_4982_return_output,
 color1_MUX_uxn_c_l215_c8_e926_return_output,
 color0_MUX_uxn_c_l215_c8_e926_return_output,
 color2_MUX_uxn_c_l215_c8_e926_return_output,
 tmp12_MUX_uxn_c_l215_c8_e926_return_output,
 color3_MUX_uxn_c_l215_c8_e926_return_output,
 CONST_SL_4_uxn_c_l217_c4_9e50_return_output,
 BIN_OP_AND_uxn_c_l218_c4_ae60_return_output,
 BIN_OP_OR_uxn_c_l219_c4_f9ca_return_output,
 CONST_SL_4_uxn_c_l222_c4_1f3b_return_output,
 BIN_OP_AND_uxn_c_l223_c4_c301_return_output,
 BIN_OP_OR_uxn_c_l224_c4_c5ac_return_output,
 BIN_OP_EQ_uxn_c_l226_c12_2bf1_return_output,
 color1_MUX_uxn_c_l226_c8_3d96_return_output,
 color0_MUX_uxn_c_l226_c8_3d96_return_output,
 color2_MUX_uxn_c_l226_c8_3d96_return_output,
 tmp12_MUX_uxn_c_l226_c8_3d96_return_output,
 color3_MUX_uxn_c_l226_c8_3d96_return_output,
 CONST_SL_4_uxn_c_l228_c4_fec8_return_output,
 BIN_OP_AND_uxn_c_l229_c4_84cb_return_output,
 BIN_OP_OR_uxn_c_l230_c4_7532_return_output,
 CONST_SL_4_uxn_c_l233_c4_ae03_return_output,
 BIN_OP_AND_uxn_c_l234_c4_92b9_return_output,
 BIN_OP_OR_uxn_c_l235_c4_da0f_return_output,
 BIN_OP_EQ_uxn_c_l237_c12_bd7f_return_output,
 color1_MUX_uxn_c_l237_c8_6a32_return_output,
 color0_MUX_uxn_c_l237_c8_6a32_return_output,
 color2_MUX_uxn_c_l237_c8_6a32_return_output,
 tmp12_MUX_uxn_c_l237_c8_6a32_return_output,
 color3_MUX_uxn_c_l237_c8_6a32_return_output,
 BIN_OP_AND_uxn_c_l239_c4_3ebe_return_output,
 BIN_OP_OR_uxn_c_l240_c4_13f0_return_output,
 BIN_OP_AND_uxn_c_l243_c4_f104_return_output,
 BIN_OP_OR_uxn_c_l244_c4_36f6_return_output,
 BIN_OP_EQ_uxn_c_l246_c12_0442_return_output,
 color2_MUX_uxn_c_l246_c8_10f9_return_output,
 tmp12_MUX_uxn_c_l246_c8_10f9_return_output,
 color3_MUX_uxn_c_l246_c8_10f9_return_output,
 BIN_OP_AND_uxn_c_l248_c4_702b_return_output,
 BIN_OP_OR_uxn_c_l249_c4_bd0e_return_output,
 BIN_OP_AND_uxn_c_l252_c4_79f5_return_output,
 BIN_OP_OR_uxn_c_l253_c4_2638_return_output,
 BIN_OP_EQ_uxn_c_l257_c6_f952_return_output,
 result_MUX_uxn_c_l257_c2_60f0_return_output,
 BIN_OP_EQ_uxn_c_l259_c13_d72c_return_output,
 result_MUX_uxn_c_l259_c9_39c4_return_output,
 BIN_OP_EQ_uxn_c_l261_c13_045a_return_output,
 result_MUX_uxn_c_l261_c9_5f7b_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_device_ram_address : unsigned(7 downto 0);
 variable VAR_device_ram_value : unsigned(7 downto 0);
 variable VAR_is_device_ram_write : unsigned(0 downto 0);
 variable VAR_gpu_step_color : unsigned(1 downto 0);
 variable VAR_color_cmp_1_MUX_uxn_c_l190_c2_8d7e_iftrue : unsigned(3 downto 0);
 variable VAR_color_cmp_1_uxn_c_l192_c3_1f69 : unsigned(3 downto 0);
 variable VAR_color_cmp_1_MUX_uxn_c_l190_c2_8d7e_iffalse : unsigned(3 downto 0);
 variable VAR_color_cmp_1_MUX_uxn_c_l190_c2_8d7e_return_output : unsigned(3 downto 0);
 variable VAR_color_cmp_1_MUX_uxn_c_l190_c2_8d7e_cond : unsigned(0 downto 0);
 variable VAR_color1_MUX_uxn_c_l190_c2_8d7e_iftrue : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l193_c3_e2b4_return_output : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l190_c2_8d7e_iffalse : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l190_c2_8d7e_return_output : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l190_c2_8d7e_cond : unsigned(0 downto 0);
 variable VAR_color0_MUX_uxn_c_l190_c2_8d7e_iftrue : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l193_c3_e2b4_return_output : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l190_c2_8d7e_iffalse : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l190_c2_8d7e_return_output : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l190_c2_8d7e_cond : unsigned(0 downto 0);
 variable VAR_color2_MUX_uxn_c_l190_c2_8d7e_iftrue : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l193_c3_e2b4_return_output : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l190_c2_8d7e_iffalse : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l190_c2_8d7e_return_output : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l190_c2_8d7e_cond : unsigned(0 downto 0);
 variable VAR_color_cmp_0_MUX_uxn_c_l190_c2_8d7e_iftrue : unsigned(3 downto 0);
 variable VAR_color_cmp_0_uxn_c_l191_c3_3b4d : unsigned(3 downto 0);
 variable VAR_color_cmp_0_MUX_uxn_c_l190_c2_8d7e_iffalse : unsigned(3 downto 0);
 variable VAR_color_cmp_0_MUX_uxn_c_l190_c2_8d7e_return_output : unsigned(3 downto 0);
 variable VAR_color_cmp_0_MUX_uxn_c_l190_c2_8d7e_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l190_c2_8d7e_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l193_c3_e2b4_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l190_c2_8d7e_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l190_c2_8d7e_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l190_c2_8d7e_cond : unsigned(0 downto 0);
 variable VAR_color3_MUX_uxn_c_l190_c2_8d7e_iftrue : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l193_c3_e2b4_return_output : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l190_c2_8d7e_iffalse : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l190_c2_8d7e_return_output : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l190_c2_8d7e_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_4_uxn_c_l191_c27_d570_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_c_l191_c27_d570_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_c_l191_c17_df68_return_output : unsigned(3 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_c_l192_c17_0d4e_return_output : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l193_c7_01ac_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l193_c7_01ac_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l193_c7_01ac_return_output : unsigned(0 downto 0);
 variable VAR_color1_MUX_uxn_c_l193_c3_e2b4_iftrue : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l193_c3_e2b4_iffalse : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l204_c8_1f11_return_output : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l193_c3_e2b4_cond : unsigned(0 downto 0);
 variable VAR_color0_MUX_uxn_c_l193_c3_e2b4_iftrue : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l193_c3_e2b4_iffalse : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l204_c8_1f11_return_output : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l193_c3_e2b4_cond : unsigned(0 downto 0);
 variable VAR_color2_MUX_uxn_c_l193_c3_e2b4_iftrue : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l193_c3_e2b4_iffalse : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l204_c8_1f11_return_output : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l193_c3_e2b4_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l193_c3_e2b4_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l193_c3_e2b4_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l204_c8_1f11_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l193_c3_e2b4_cond : unsigned(0 downto 0);
 variable VAR_color3_MUX_uxn_c_l193_c3_e2b4_iftrue : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l193_c3_e2b4_iffalse : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l204_c8_1f11_return_output : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l193_c3_e2b4_cond : unsigned(0 downto 0);
 variable VAR_tmp12_uxn_c_l194_c4_d99e : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l195_c4_bcbe_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l195_c4_bcbe_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l196_c4_d4c9_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l196_c4_d4c9_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l196_c4_d4c9_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l197_c4_c276_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l197_c4_c276_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l197_c4_c276_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_uxn_c_l199_c4_f9ff : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l200_c4_ae00_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l200_c4_ae00_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l201_c4_d94b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l201_c4_d94b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l201_c4_d94b_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l202_c4_9617_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l202_c4_9617_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l202_c4_9617_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l204_c12_7fb7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l204_c12_7fb7_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l204_c12_7fb7_return_output : unsigned(0 downto 0);
 variable VAR_color1_MUX_uxn_c_l204_c8_1f11_iftrue : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l204_c8_1f11_iffalse : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l215_c8_e926_return_output : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l204_c8_1f11_cond : unsigned(0 downto 0);
 variable VAR_color0_MUX_uxn_c_l204_c8_1f11_iftrue : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l204_c8_1f11_iffalse : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l215_c8_e926_return_output : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l204_c8_1f11_cond : unsigned(0 downto 0);
 variable VAR_color2_MUX_uxn_c_l204_c8_1f11_iftrue : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l204_c8_1f11_iffalse : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l215_c8_e926_return_output : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l204_c8_1f11_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l204_c8_1f11_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l204_c8_1f11_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l215_c8_e926_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l204_c8_1f11_cond : unsigned(0 downto 0);
 variable VAR_color3_MUX_uxn_c_l204_c8_1f11_iftrue : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l204_c8_1f11_iffalse : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l215_c8_e926_return_output : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l204_c8_1f11_cond : unsigned(0 downto 0);
 variable VAR_tmp12_uxn_c_l205_c4_5e73 : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l206_c4_a732_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l206_c4_a732_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l207_c4_25dd_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l207_c4_25dd_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l207_c4_25dd_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l208_c4_c228_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l208_c4_c228_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l208_c4_c228_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_uxn_c_l210_c4_9847 : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l211_c4_e7ce_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l211_c4_e7ce_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l212_c4_5570_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l212_c4_5570_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l212_c4_5570_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l213_c4_48c2_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l213_c4_48c2_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l213_c4_48c2_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l215_c12_4982_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l215_c12_4982_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l215_c12_4982_return_output : unsigned(0 downto 0);
 variable VAR_color1_MUX_uxn_c_l215_c8_e926_iftrue : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l215_c8_e926_iffalse : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l226_c8_3d96_return_output : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l215_c8_e926_cond : unsigned(0 downto 0);
 variable VAR_color0_MUX_uxn_c_l215_c8_e926_iftrue : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l215_c8_e926_iffalse : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l226_c8_3d96_return_output : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l215_c8_e926_cond : unsigned(0 downto 0);
 variable VAR_color2_MUX_uxn_c_l215_c8_e926_iftrue : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l215_c8_e926_iffalse : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l226_c8_3d96_return_output : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l215_c8_e926_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l215_c8_e926_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l215_c8_e926_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l226_c8_3d96_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l215_c8_e926_cond : unsigned(0 downto 0);
 variable VAR_color3_MUX_uxn_c_l215_c8_e926_iftrue : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l215_c8_e926_iffalse : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l226_c8_3d96_return_output : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l215_c8_e926_cond : unsigned(0 downto 0);
 variable VAR_tmp12_uxn_c_l216_c4_c0f5 : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l217_c4_9e50_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l217_c4_9e50_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l218_c4_ae60_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l218_c4_ae60_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l218_c4_ae60_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l219_c4_f9ca_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l219_c4_f9ca_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l219_c4_f9ca_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_uxn_c_l221_c4_8ff9 : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l222_c4_1f3b_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l222_c4_1f3b_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l223_c4_c301_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l223_c4_c301_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l223_c4_c301_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l224_c4_c5ac_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l224_c4_c5ac_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l224_c4_c5ac_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l226_c12_2bf1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l226_c12_2bf1_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l226_c12_2bf1_return_output : unsigned(0 downto 0);
 variable VAR_color1_MUX_uxn_c_l226_c8_3d96_iftrue : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l226_c8_3d96_iffalse : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l237_c8_6a32_return_output : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l226_c8_3d96_cond : unsigned(0 downto 0);
 variable VAR_color0_MUX_uxn_c_l226_c8_3d96_iftrue : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l226_c8_3d96_iffalse : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l237_c8_6a32_return_output : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l226_c8_3d96_cond : unsigned(0 downto 0);
 variable VAR_color2_MUX_uxn_c_l226_c8_3d96_iftrue : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l226_c8_3d96_iffalse : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l237_c8_6a32_return_output : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l226_c8_3d96_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l226_c8_3d96_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l226_c8_3d96_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l237_c8_6a32_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l226_c8_3d96_cond : unsigned(0 downto 0);
 variable VAR_color3_MUX_uxn_c_l226_c8_3d96_iftrue : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l226_c8_3d96_iffalse : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l237_c8_6a32_return_output : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l226_c8_3d96_cond : unsigned(0 downto 0);
 variable VAR_tmp12_uxn_c_l227_c4_3e42 : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l228_c4_fec8_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l228_c4_fec8_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l229_c4_84cb_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l229_c4_84cb_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l229_c4_84cb_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l230_c4_7532_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l230_c4_7532_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l230_c4_7532_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_uxn_c_l232_c4_521c : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l233_c4_ae03_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l233_c4_ae03_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l234_c4_92b9_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l234_c4_92b9_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l234_c4_92b9_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l235_c4_da0f_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l235_c4_da0f_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l235_c4_da0f_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l237_c12_bd7f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l237_c12_bd7f_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l237_c12_bd7f_return_output : unsigned(0 downto 0);
 variable VAR_color1_MUX_uxn_c_l237_c8_6a32_iftrue : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l237_c8_6a32_iffalse : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l237_c8_6a32_cond : unsigned(0 downto 0);
 variable VAR_color0_MUX_uxn_c_l237_c8_6a32_iftrue : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l237_c8_6a32_iffalse : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l237_c8_6a32_cond : unsigned(0 downto 0);
 variable VAR_color2_MUX_uxn_c_l237_c8_6a32_iftrue : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l237_c8_6a32_iffalse : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l246_c8_10f9_return_output : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l237_c8_6a32_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l237_c8_6a32_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l237_c8_6a32_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l246_c8_10f9_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l237_c8_6a32_cond : unsigned(0 downto 0);
 variable VAR_color3_MUX_uxn_c_l237_c8_6a32_iftrue : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l237_c8_6a32_iffalse : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l246_c8_10f9_return_output : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l237_c8_6a32_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l239_c4_3ebe_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l239_c4_3ebe_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l239_c4_3ebe_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l240_c4_13f0_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l240_c4_13f0_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l240_c4_13f0_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l243_c4_f104_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l243_c4_f104_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l243_c4_f104_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l244_c4_36f6_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l244_c4_36f6_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l244_c4_36f6_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l246_c12_0442_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l246_c12_0442_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l246_c12_0442_return_output : unsigned(0 downto 0);
 variable VAR_color2_MUX_uxn_c_l246_c8_10f9_iftrue : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l246_c8_10f9_iffalse : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l246_c8_10f9_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l246_c8_10f9_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l246_c8_10f9_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l246_c8_10f9_cond : unsigned(0 downto 0);
 variable VAR_color3_MUX_uxn_c_l246_c8_10f9_iftrue : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l246_c8_10f9_iffalse : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l246_c8_10f9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l248_c4_702b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l248_c4_702b_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l248_c4_702b_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l249_c4_bd0e_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l249_c4_bd0e_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l249_c4_bd0e_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l252_c4_79f5_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l252_c4_79f5_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l252_c4_79f5_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l253_c4_2638_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l253_c4_2638_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l253_c4_2638_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l257_c6_f952_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l257_c6_f952_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l257_c6_f952_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_c_l257_c2_60f0_iftrue : unsigned(15 downto 0);
 variable VAR_result_uxn_c_l258_c3_a323 : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l257_c2_60f0_iffalse : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l259_c9_39c4_return_output : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l257_c2_60f0_return_output : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l257_c2_60f0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l259_c13_d72c_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l259_c13_d72c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l259_c13_d72c_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_c_l259_c9_39c4_iftrue : unsigned(15 downto 0);
 variable VAR_result_uxn_c_l260_c3_3e92 : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l259_c9_39c4_iffalse : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l261_c9_5f7b_return_output : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l259_c9_39c4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l261_c13_045a_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l261_c13_045a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l261_c13_045a_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_c_l261_c9_5f7b_iftrue : unsigned(15 downto 0);
 variable VAR_result_uxn_c_l262_c3_1ad3 : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l261_c9_5f7b_iffalse : unsigned(15 downto 0);
 variable VAR_result_uxn_c_l264_c3_ea32 : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l261_c9_5f7b_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l247_l238_DUPLICATE_cdba_return_output : unsigned(11 downto 0);
 variable VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l242_l251_DUPLICATE_f438_return_output : unsigned(11 downto 0);
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
     VAR_BIN_OP_EQ_uxn_c_l259_c13_d72c_right := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_c_l243_c4_f104_right := to_unsigned(4080, 12);
     VAR_BIN_OP_EQ_uxn_c_l193_c7_01ac_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_c_l246_c12_0442_right := to_unsigned(13, 4);
     VAR_BIN_OP_EQ_uxn_c_l204_c12_7fb7_right := to_unsigned(9, 4);
     VAR_BIN_OP_AND_uxn_c_l229_c4_84cb_right := to_unsigned(3855, 12);
     VAR_BIN_OP_AND_uxn_c_l234_c4_92b9_right := to_unsigned(3855, 12);
     VAR_BIN_OP_EQ_uxn_c_l215_c12_4982_right := to_unsigned(10, 4);
     VAR_BIN_OP_AND_uxn_c_l252_c4_79f5_right := to_unsigned(4080, 12);
     VAR_BIN_OP_AND_uxn_c_l239_c4_3ebe_right := to_unsigned(4080, 12);
     VAR_BIN_OP_AND_uxn_c_l218_c4_ae60_right := to_unsigned(3855, 12);
     VAR_BIN_OP_AND_uxn_c_l196_c4_d4c9_right := to_unsigned(255, 8);
     VAR_BIN_OP_AND_uxn_c_l201_c4_d94b_right := to_unsigned(255, 8);
     VAR_BIN_OP_AND_uxn_c_l212_c4_5570_right := to_unsigned(255, 8);
     VAR_BIN_OP_AND_uxn_c_l223_c4_c301_right := to_unsigned(3855, 12);
     VAR_BIN_OP_EQ_uxn_c_l226_c12_2bf1_right := to_unsigned(11, 4);
     VAR_BIN_OP_EQ_uxn_c_l261_c13_045a_right := to_unsigned(2, 2);
     VAR_BIN_OP_AND_uxn_c_l207_c4_25dd_right := to_unsigned(255, 8);
     VAR_BIN_OP_AND_uxn_c_l248_c4_702b_right := to_unsigned(4080, 12);
     VAR_BIN_OP_EQ_uxn_c_l257_c6_f952_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l237_c12_bd7f_right := to_unsigned(12, 4);

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
     VAR_BIN_OP_AND_uxn_c_l196_c4_d4c9_left := color0;
     VAR_BIN_OP_AND_uxn_c_l218_c4_ae60_left := color0;
     VAR_BIN_OP_AND_uxn_c_l239_c4_3ebe_left := color0;
     VAR_color0_MUX_uxn_c_l190_c2_8d7e_iffalse := color0;
     VAR_color0_MUX_uxn_c_l204_c8_1f11_iftrue := color0;
     VAR_color0_MUX_uxn_c_l226_c8_3d96_iftrue := color0;
     VAR_color0_MUX_uxn_c_l237_c8_6a32_iffalse := color0;
     VAR_BIN_OP_AND_uxn_c_l201_c4_d94b_left := color1;
     VAR_BIN_OP_AND_uxn_c_l223_c4_c301_left := color1;
     VAR_BIN_OP_AND_uxn_c_l243_c4_f104_left := color1;
     VAR_color1_MUX_uxn_c_l190_c2_8d7e_iffalse := color1;
     VAR_color1_MUX_uxn_c_l204_c8_1f11_iftrue := color1;
     VAR_color1_MUX_uxn_c_l226_c8_3d96_iftrue := color1;
     VAR_color1_MUX_uxn_c_l237_c8_6a32_iffalse := color1;
     VAR_BIN_OP_AND_uxn_c_l207_c4_25dd_left := color2;
     VAR_BIN_OP_AND_uxn_c_l229_c4_84cb_left := color2;
     VAR_BIN_OP_AND_uxn_c_l248_c4_702b_left := color2;
     VAR_color2_MUX_uxn_c_l190_c2_8d7e_iffalse := color2;
     VAR_color2_MUX_uxn_c_l193_c3_e2b4_iftrue := color2;
     VAR_color2_MUX_uxn_c_l215_c8_e926_iftrue := color2;
     VAR_color2_MUX_uxn_c_l237_c8_6a32_iftrue := color2;
     VAR_color2_MUX_uxn_c_l246_c8_10f9_iffalse := color2;
     VAR_BIN_OP_AND_uxn_c_l212_c4_5570_left := color3;
     VAR_BIN_OP_AND_uxn_c_l234_c4_92b9_left := color3;
     VAR_BIN_OP_AND_uxn_c_l252_c4_79f5_left := color3;
     VAR_color3_MUX_uxn_c_l190_c2_8d7e_iffalse := color3;
     VAR_color3_MUX_uxn_c_l193_c3_e2b4_iftrue := color3;
     VAR_color3_MUX_uxn_c_l215_c8_e926_iftrue := color3;
     VAR_color3_MUX_uxn_c_l237_c8_6a32_iftrue := color3;
     VAR_color3_MUX_uxn_c_l246_c8_10f9_iffalse := color3;
     VAR_color_cmp_0_MUX_uxn_c_l190_c2_8d7e_iffalse := color_cmp_0;
     VAR_color_cmp_1_MUX_uxn_c_l190_c2_8d7e_iffalse := color_cmp_1;
     VAR_BIN_OP_EQ_uxn_c_l193_c7_01ac_left := VAR_device_ram_address;
     VAR_BIN_OP_EQ_uxn_c_l204_c12_7fb7_left := VAR_device_ram_address;
     VAR_BIN_OP_EQ_uxn_c_l215_c12_4982_left := VAR_device_ram_address;
     VAR_BIN_OP_EQ_uxn_c_l226_c12_2bf1_left := VAR_device_ram_address;
     VAR_BIN_OP_EQ_uxn_c_l237_c12_bd7f_left := VAR_device_ram_address;
     VAR_BIN_OP_EQ_uxn_c_l246_c12_0442_left := VAR_device_ram_address;
     VAR_CONST_SR_4_uxn_c_l191_c27_d570_x := VAR_device_ram_value;
     VAR_BIN_OP_EQ_uxn_c_l257_c6_f952_left := VAR_gpu_step_color;
     VAR_BIN_OP_EQ_uxn_c_l259_c13_d72c_left := VAR_gpu_step_color;
     VAR_BIN_OP_EQ_uxn_c_l261_c13_045a_left := VAR_gpu_step_color;
     VAR_color0_MUX_uxn_c_l190_c2_8d7e_cond := VAR_is_device_ram_write;
     VAR_color1_MUX_uxn_c_l190_c2_8d7e_cond := VAR_is_device_ram_write;
     VAR_color2_MUX_uxn_c_l190_c2_8d7e_cond := VAR_is_device_ram_write;
     VAR_color3_MUX_uxn_c_l190_c2_8d7e_cond := VAR_is_device_ram_write;
     VAR_color_cmp_0_MUX_uxn_c_l190_c2_8d7e_cond := VAR_is_device_ram_write;
     VAR_color_cmp_1_MUX_uxn_c_l190_c2_8d7e_cond := VAR_is_device_ram_write;
     VAR_tmp12_MUX_uxn_c_l190_c2_8d7e_cond := VAR_is_device_ram_write;
     VAR_tmp12_MUX_uxn_c_l190_c2_8d7e_iffalse := tmp12;
     VAR_tmp12_MUX_uxn_c_l246_c8_10f9_iffalse := tmp12;
     -- BIN_OP_EQ[uxn_c_l237_c12_bd7f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l237_c12_bd7f_left <= VAR_BIN_OP_EQ_uxn_c_l237_c12_bd7f_left;
     BIN_OP_EQ_uxn_c_l237_c12_bd7f_right <= VAR_BIN_OP_EQ_uxn_c_l237_c12_bd7f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l237_c12_bd7f_return_output := BIN_OP_EQ_uxn_c_l237_c12_bd7f_return_output;

     -- CONST_SR_4[uxn_c_l191_c27_d570] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_c_l191_c27_d570_x <= VAR_CONST_SR_4_uxn_c_l191_c27_d570_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_c_l191_c27_d570_return_output := CONST_SR_4_uxn_c_l191_c27_d570_return_output;

     -- BIN_OP_EQ[uxn_c_l261_c13_045a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l261_c13_045a_left <= VAR_BIN_OP_EQ_uxn_c_l261_c13_045a_left;
     BIN_OP_EQ_uxn_c_l261_c13_045a_right <= VAR_BIN_OP_EQ_uxn_c_l261_c13_045a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l261_c13_045a_return_output := BIN_OP_EQ_uxn_c_l261_c13_045a_return_output;

     -- BIN_OP_EQ[uxn_c_l226_c12_2bf1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l226_c12_2bf1_left <= VAR_BIN_OP_EQ_uxn_c_l226_c12_2bf1_left;
     BIN_OP_EQ_uxn_c_l226_c12_2bf1_right <= VAR_BIN_OP_EQ_uxn_c_l226_c12_2bf1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l226_c12_2bf1_return_output := BIN_OP_EQ_uxn_c_l226_c12_2bf1_return_output;

     -- BIN_OP_AND[uxn_c_l234_c4_92b9] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l234_c4_92b9_left <= VAR_BIN_OP_AND_uxn_c_l234_c4_92b9_left;
     BIN_OP_AND_uxn_c_l234_c4_92b9_right <= VAR_BIN_OP_AND_uxn_c_l234_c4_92b9_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l234_c4_92b9_return_output := BIN_OP_AND_uxn_c_l234_c4_92b9_return_output;

     -- BIN_OP_EQ[uxn_c_l215_c12_4982] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l215_c12_4982_left <= VAR_BIN_OP_EQ_uxn_c_l215_c12_4982_left;
     BIN_OP_EQ_uxn_c_l215_c12_4982_right <= VAR_BIN_OP_EQ_uxn_c_l215_c12_4982_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l215_c12_4982_return_output := BIN_OP_EQ_uxn_c_l215_c12_4982_return_output;

     -- BIN_OP_EQ[uxn_c_l246_c12_0442] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l246_c12_0442_left <= VAR_BIN_OP_EQ_uxn_c_l246_c12_0442_left;
     BIN_OP_EQ_uxn_c_l246_c12_0442_right <= VAR_BIN_OP_EQ_uxn_c_l246_c12_0442_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l246_c12_0442_return_output := BIN_OP_EQ_uxn_c_l246_c12_0442_return_output;

     -- BIN_OP_EQ[uxn_c_l257_c6_f952] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l257_c6_f952_left <= VAR_BIN_OP_EQ_uxn_c_l257_c6_f952_left;
     BIN_OP_EQ_uxn_c_l257_c6_f952_right <= VAR_BIN_OP_EQ_uxn_c_l257_c6_f952_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l257_c6_f952_return_output := BIN_OP_EQ_uxn_c_l257_c6_f952_return_output;

     -- BIN_OP_AND[uxn_c_l243_c4_f104] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l243_c4_f104_left <= VAR_BIN_OP_AND_uxn_c_l243_c4_f104_left;
     BIN_OP_AND_uxn_c_l243_c4_f104_right <= VAR_BIN_OP_AND_uxn_c_l243_c4_f104_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l243_c4_f104_return_output := BIN_OP_AND_uxn_c_l243_c4_f104_return_output;

     -- BIN_OP_EQ[uxn_c_l259_c13_d72c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l259_c13_d72c_left <= VAR_BIN_OP_EQ_uxn_c_l259_c13_d72c_left;
     BIN_OP_EQ_uxn_c_l259_c13_d72c_right <= VAR_BIN_OP_EQ_uxn_c_l259_c13_d72c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l259_c13_d72c_return_output := BIN_OP_EQ_uxn_c_l259_c13_d72c_return_output;

     -- BIN_OP_AND[uxn_c_l223_c4_c301] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l223_c4_c301_left <= VAR_BIN_OP_AND_uxn_c_l223_c4_c301_left;
     BIN_OP_AND_uxn_c_l223_c4_c301_right <= VAR_BIN_OP_AND_uxn_c_l223_c4_c301_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l223_c4_c301_return_output := BIN_OP_AND_uxn_c_l223_c4_c301_return_output;

     -- BIN_OP_AND[uxn_c_l218_c4_ae60] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l218_c4_ae60_left <= VAR_BIN_OP_AND_uxn_c_l218_c4_ae60_left;
     BIN_OP_AND_uxn_c_l218_c4_ae60_right <= VAR_BIN_OP_AND_uxn_c_l218_c4_ae60_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l218_c4_ae60_return_output := BIN_OP_AND_uxn_c_l218_c4_ae60_return_output;

     -- BIN_OP_AND[uxn_c_l196_c4_d4c9] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l196_c4_d4c9_left <= VAR_BIN_OP_AND_uxn_c_l196_c4_d4c9_left;
     BIN_OP_AND_uxn_c_l196_c4_d4c9_right <= VAR_BIN_OP_AND_uxn_c_l196_c4_d4c9_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l196_c4_d4c9_return_output := BIN_OP_AND_uxn_c_l196_c4_d4c9_return_output;

     -- BIN_OP_AND[uxn_c_l248_c4_702b] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l248_c4_702b_left <= VAR_BIN_OP_AND_uxn_c_l248_c4_702b_left;
     BIN_OP_AND_uxn_c_l248_c4_702b_right <= VAR_BIN_OP_AND_uxn_c_l248_c4_702b_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l248_c4_702b_return_output := BIN_OP_AND_uxn_c_l248_c4_702b_return_output;

     -- BIN_OP_EQ[uxn_c_l193_c7_01ac] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l193_c7_01ac_left <= VAR_BIN_OP_EQ_uxn_c_l193_c7_01ac_left;
     BIN_OP_EQ_uxn_c_l193_c7_01ac_right <= VAR_BIN_OP_EQ_uxn_c_l193_c7_01ac_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l193_c7_01ac_return_output := BIN_OP_EQ_uxn_c_l193_c7_01ac_return_output;

     -- BIN_OP_AND[uxn_c_l229_c4_84cb] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l229_c4_84cb_left <= VAR_BIN_OP_AND_uxn_c_l229_c4_84cb_left;
     BIN_OP_AND_uxn_c_l229_c4_84cb_right <= VAR_BIN_OP_AND_uxn_c_l229_c4_84cb_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l229_c4_84cb_return_output := BIN_OP_AND_uxn_c_l229_c4_84cb_return_output;

     -- BIN_OP_AND[uxn_c_l207_c4_25dd] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l207_c4_25dd_left <= VAR_BIN_OP_AND_uxn_c_l207_c4_25dd_left;
     BIN_OP_AND_uxn_c_l207_c4_25dd_right <= VAR_BIN_OP_AND_uxn_c_l207_c4_25dd_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l207_c4_25dd_return_output := BIN_OP_AND_uxn_c_l207_c4_25dd_return_output;

     -- BIN_OP_AND[uxn_c_l201_c4_d94b] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l201_c4_d94b_left <= VAR_BIN_OP_AND_uxn_c_l201_c4_d94b_left;
     BIN_OP_AND_uxn_c_l201_c4_d94b_right <= VAR_BIN_OP_AND_uxn_c_l201_c4_d94b_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l201_c4_d94b_return_output := BIN_OP_AND_uxn_c_l201_c4_d94b_return_output;

     -- BIN_OP_AND[uxn_c_l212_c4_5570] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l212_c4_5570_left <= VAR_BIN_OP_AND_uxn_c_l212_c4_5570_left;
     BIN_OP_AND_uxn_c_l212_c4_5570_right <= VAR_BIN_OP_AND_uxn_c_l212_c4_5570_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l212_c4_5570_return_output := BIN_OP_AND_uxn_c_l212_c4_5570_return_output;

     -- CAST_TO_uint4_t[uxn_c_l192_c17_0d4e] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_c_l192_c17_0d4e_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_device_ram_value);

     -- BIN_OP_EQ[uxn_c_l204_c12_7fb7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l204_c12_7fb7_left <= VAR_BIN_OP_EQ_uxn_c_l204_c12_7fb7_left;
     BIN_OP_EQ_uxn_c_l204_c12_7fb7_right <= VAR_BIN_OP_EQ_uxn_c_l204_c12_7fb7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l204_c12_7fb7_return_output := BIN_OP_EQ_uxn_c_l204_c12_7fb7_return_output;

     -- BIN_OP_AND[uxn_c_l239_c4_3ebe] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l239_c4_3ebe_left <= VAR_BIN_OP_AND_uxn_c_l239_c4_3ebe_left;
     BIN_OP_AND_uxn_c_l239_c4_3ebe_right <= VAR_BIN_OP_AND_uxn_c_l239_c4_3ebe_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l239_c4_3ebe_return_output := BIN_OP_AND_uxn_c_l239_c4_3ebe_return_output;

     -- BIN_OP_AND[uxn_c_l252_c4_79f5] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l252_c4_79f5_left <= VAR_BIN_OP_AND_uxn_c_l252_c4_79f5_left;
     BIN_OP_AND_uxn_c_l252_c4_79f5_right <= VAR_BIN_OP_AND_uxn_c_l252_c4_79f5_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l252_c4_79f5_return_output := BIN_OP_AND_uxn_c_l252_c4_79f5_return_output;

     -- Submodule level 1
     VAR_BIN_OP_OR_uxn_c_l197_c4_c276_left := VAR_BIN_OP_AND_uxn_c_l196_c4_d4c9_return_output;
     VAR_BIN_OP_OR_uxn_c_l202_c4_9617_left := VAR_BIN_OP_AND_uxn_c_l201_c4_d94b_return_output;
     VAR_BIN_OP_OR_uxn_c_l208_c4_c228_left := VAR_BIN_OP_AND_uxn_c_l207_c4_25dd_return_output;
     VAR_BIN_OP_OR_uxn_c_l213_c4_48c2_left := VAR_BIN_OP_AND_uxn_c_l212_c4_5570_return_output;
     VAR_BIN_OP_OR_uxn_c_l219_c4_f9ca_left := VAR_BIN_OP_AND_uxn_c_l218_c4_ae60_return_output;
     VAR_BIN_OP_OR_uxn_c_l224_c4_c5ac_left := VAR_BIN_OP_AND_uxn_c_l223_c4_c301_return_output;
     VAR_BIN_OP_OR_uxn_c_l230_c4_7532_left := VAR_BIN_OP_AND_uxn_c_l229_c4_84cb_return_output;
     VAR_BIN_OP_OR_uxn_c_l235_c4_da0f_left := VAR_BIN_OP_AND_uxn_c_l234_c4_92b9_return_output;
     VAR_BIN_OP_OR_uxn_c_l240_c4_13f0_left := VAR_BIN_OP_AND_uxn_c_l239_c4_3ebe_return_output;
     VAR_BIN_OP_OR_uxn_c_l244_c4_36f6_left := VAR_BIN_OP_AND_uxn_c_l243_c4_f104_return_output;
     VAR_BIN_OP_OR_uxn_c_l249_c4_bd0e_left := VAR_BIN_OP_AND_uxn_c_l248_c4_702b_return_output;
     VAR_BIN_OP_OR_uxn_c_l253_c4_2638_left := VAR_BIN_OP_AND_uxn_c_l252_c4_79f5_return_output;
     VAR_color0_MUX_uxn_c_l193_c3_e2b4_cond := VAR_BIN_OP_EQ_uxn_c_l193_c7_01ac_return_output;
     VAR_color1_MUX_uxn_c_l193_c3_e2b4_cond := VAR_BIN_OP_EQ_uxn_c_l193_c7_01ac_return_output;
     VAR_color2_MUX_uxn_c_l193_c3_e2b4_cond := VAR_BIN_OP_EQ_uxn_c_l193_c7_01ac_return_output;
     VAR_color3_MUX_uxn_c_l193_c3_e2b4_cond := VAR_BIN_OP_EQ_uxn_c_l193_c7_01ac_return_output;
     VAR_tmp12_MUX_uxn_c_l193_c3_e2b4_cond := VAR_BIN_OP_EQ_uxn_c_l193_c7_01ac_return_output;
     VAR_color0_MUX_uxn_c_l204_c8_1f11_cond := VAR_BIN_OP_EQ_uxn_c_l204_c12_7fb7_return_output;
     VAR_color1_MUX_uxn_c_l204_c8_1f11_cond := VAR_BIN_OP_EQ_uxn_c_l204_c12_7fb7_return_output;
     VAR_color2_MUX_uxn_c_l204_c8_1f11_cond := VAR_BIN_OP_EQ_uxn_c_l204_c12_7fb7_return_output;
     VAR_color3_MUX_uxn_c_l204_c8_1f11_cond := VAR_BIN_OP_EQ_uxn_c_l204_c12_7fb7_return_output;
     VAR_tmp12_MUX_uxn_c_l204_c8_1f11_cond := VAR_BIN_OP_EQ_uxn_c_l204_c12_7fb7_return_output;
     VAR_color0_MUX_uxn_c_l215_c8_e926_cond := VAR_BIN_OP_EQ_uxn_c_l215_c12_4982_return_output;
     VAR_color1_MUX_uxn_c_l215_c8_e926_cond := VAR_BIN_OP_EQ_uxn_c_l215_c12_4982_return_output;
     VAR_color2_MUX_uxn_c_l215_c8_e926_cond := VAR_BIN_OP_EQ_uxn_c_l215_c12_4982_return_output;
     VAR_color3_MUX_uxn_c_l215_c8_e926_cond := VAR_BIN_OP_EQ_uxn_c_l215_c12_4982_return_output;
     VAR_tmp12_MUX_uxn_c_l215_c8_e926_cond := VAR_BIN_OP_EQ_uxn_c_l215_c12_4982_return_output;
     VAR_color0_MUX_uxn_c_l226_c8_3d96_cond := VAR_BIN_OP_EQ_uxn_c_l226_c12_2bf1_return_output;
     VAR_color1_MUX_uxn_c_l226_c8_3d96_cond := VAR_BIN_OP_EQ_uxn_c_l226_c12_2bf1_return_output;
     VAR_color2_MUX_uxn_c_l226_c8_3d96_cond := VAR_BIN_OP_EQ_uxn_c_l226_c12_2bf1_return_output;
     VAR_color3_MUX_uxn_c_l226_c8_3d96_cond := VAR_BIN_OP_EQ_uxn_c_l226_c12_2bf1_return_output;
     VAR_tmp12_MUX_uxn_c_l226_c8_3d96_cond := VAR_BIN_OP_EQ_uxn_c_l226_c12_2bf1_return_output;
     VAR_color0_MUX_uxn_c_l237_c8_6a32_cond := VAR_BIN_OP_EQ_uxn_c_l237_c12_bd7f_return_output;
     VAR_color1_MUX_uxn_c_l237_c8_6a32_cond := VAR_BIN_OP_EQ_uxn_c_l237_c12_bd7f_return_output;
     VAR_color2_MUX_uxn_c_l237_c8_6a32_cond := VAR_BIN_OP_EQ_uxn_c_l237_c12_bd7f_return_output;
     VAR_color3_MUX_uxn_c_l237_c8_6a32_cond := VAR_BIN_OP_EQ_uxn_c_l237_c12_bd7f_return_output;
     VAR_tmp12_MUX_uxn_c_l237_c8_6a32_cond := VAR_BIN_OP_EQ_uxn_c_l237_c12_bd7f_return_output;
     VAR_color2_MUX_uxn_c_l246_c8_10f9_cond := VAR_BIN_OP_EQ_uxn_c_l246_c12_0442_return_output;
     VAR_color3_MUX_uxn_c_l246_c8_10f9_cond := VAR_BIN_OP_EQ_uxn_c_l246_c12_0442_return_output;
     VAR_tmp12_MUX_uxn_c_l246_c8_10f9_cond := VAR_BIN_OP_EQ_uxn_c_l246_c12_0442_return_output;
     VAR_result_MUX_uxn_c_l257_c2_60f0_cond := VAR_BIN_OP_EQ_uxn_c_l257_c6_f952_return_output;
     VAR_result_MUX_uxn_c_l259_c9_39c4_cond := VAR_BIN_OP_EQ_uxn_c_l259_c13_d72c_return_output;
     VAR_result_MUX_uxn_c_l261_c9_5f7b_cond := VAR_BIN_OP_EQ_uxn_c_l261_c13_045a_return_output;
     VAR_color_cmp_1_uxn_c_l192_c3_1f69 := VAR_CAST_TO_uint4_t_uxn_c_l192_c17_0d4e_return_output;
     VAR_color_cmp_1_MUX_uxn_c_l190_c2_8d7e_iftrue := VAR_color_cmp_1_uxn_c_l192_c3_1f69;
     VAR_tmp12_uxn_c_l199_c4_f9ff := resize(VAR_color_cmp_1_uxn_c_l192_c3_1f69, 12);
     VAR_tmp12_uxn_c_l210_c4_9847 := resize(VAR_color_cmp_1_uxn_c_l192_c3_1f69, 12);
     VAR_tmp12_uxn_c_l221_c4_8ff9 := resize(VAR_color_cmp_1_uxn_c_l192_c3_1f69, 12);
     VAR_tmp12_uxn_c_l232_c4_521c := resize(VAR_color_cmp_1_uxn_c_l192_c3_1f69, 12);
     VAR_CONST_SL_8_uxn_c_l200_c4_ae00_x := VAR_tmp12_uxn_c_l199_c4_f9ff;
     VAR_CONST_SL_8_uxn_c_l211_c4_e7ce_x := VAR_tmp12_uxn_c_l210_c4_9847;
     VAR_CONST_SL_4_uxn_c_l222_c4_1f3b_x := VAR_tmp12_uxn_c_l221_c4_8ff9;
     VAR_CONST_SL_4_uxn_c_l233_c4_ae03_x := VAR_tmp12_uxn_c_l232_c4_521c;
     -- CONST_SL_8[uxn_c_l211_c4_e7ce] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l211_c4_e7ce_x <= VAR_CONST_SL_8_uxn_c_l211_c4_e7ce_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l211_c4_e7ce_return_output := CONST_SL_8_uxn_c_l211_c4_e7ce_return_output;

     -- CONST_SL_4[uxn_c_l233_c4_ae03] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_c_l233_c4_ae03_x <= VAR_CONST_SL_4_uxn_c_l233_c4_ae03_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_c_l233_c4_ae03_return_output := CONST_SL_4_uxn_c_l233_c4_ae03_return_output;

     -- CAST_TO_uint12_t_uint4_t_uxn_c_l242_l251_DUPLICATE_f438 LATENCY=0
     VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l242_l251_DUPLICATE_f438_return_output := CAST_TO_uint12_t_uint4_t(
     VAR_color_cmp_1_uxn_c_l192_c3_1f69);

     -- color_cmp_1_MUX[uxn_c_l190_c2_8d7e] LATENCY=0
     -- Inputs
     color_cmp_1_MUX_uxn_c_l190_c2_8d7e_cond <= VAR_color_cmp_1_MUX_uxn_c_l190_c2_8d7e_cond;
     color_cmp_1_MUX_uxn_c_l190_c2_8d7e_iftrue <= VAR_color_cmp_1_MUX_uxn_c_l190_c2_8d7e_iftrue;
     color_cmp_1_MUX_uxn_c_l190_c2_8d7e_iffalse <= VAR_color_cmp_1_MUX_uxn_c_l190_c2_8d7e_iffalse;
     -- Outputs
     VAR_color_cmp_1_MUX_uxn_c_l190_c2_8d7e_return_output := color_cmp_1_MUX_uxn_c_l190_c2_8d7e_return_output;

     -- CONST_SL_4[uxn_c_l222_c4_1f3b] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_c_l222_c4_1f3b_x <= VAR_CONST_SL_4_uxn_c_l222_c4_1f3b_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_c_l222_c4_1f3b_return_output := CONST_SL_4_uxn_c_l222_c4_1f3b_return_output;

     -- CONST_SL_8[uxn_c_l200_c4_ae00] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l200_c4_ae00_x <= VAR_CONST_SL_8_uxn_c_l200_c4_ae00_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l200_c4_ae00_return_output := CONST_SL_8_uxn_c_l200_c4_ae00_return_output;

     -- CAST_TO_uint4_t[uxn_c_l191_c17_df68] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_c_l191_c17_df68_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_CONST_SR_4_uxn_c_l191_c27_d570_return_output);

     -- Submodule level 2
     VAR_BIN_OP_OR_uxn_c_l244_c4_36f6_right := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l242_l251_DUPLICATE_f438_return_output;
     VAR_BIN_OP_OR_uxn_c_l253_c4_2638_right := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l242_l251_DUPLICATE_f438_return_output;
     VAR_tmp12_MUX_uxn_c_l237_c8_6a32_iftrue := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l242_l251_DUPLICATE_f438_return_output;
     VAR_tmp12_MUX_uxn_c_l246_c8_10f9_iftrue := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l242_l251_DUPLICATE_f438_return_output;
     VAR_color_cmp_0_uxn_c_l191_c3_3b4d := VAR_CAST_TO_uint4_t_uxn_c_l191_c17_df68_return_output;
     VAR_BIN_OP_OR_uxn_c_l224_c4_c5ac_right := VAR_CONST_SL_4_uxn_c_l222_c4_1f3b_return_output;
     VAR_tmp12_MUX_uxn_c_l215_c8_e926_iftrue := VAR_CONST_SL_4_uxn_c_l222_c4_1f3b_return_output;
     VAR_BIN_OP_OR_uxn_c_l235_c4_da0f_right := VAR_CONST_SL_4_uxn_c_l233_c4_ae03_return_output;
     VAR_tmp12_MUX_uxn_c_l226_c8_3d96_iftrue := VAR_CONST_SL_4_uxn_c_l233_c4_ae03_return_output;
     VAR_BIN_OP_OR_uxn_c_l202_c4_9617_right := VAR_CONST_SL_8_uxn_c_l200_c4_ae00_return_output;
     VAR_tmp12_MUX_uxn_c_l193_c3_e2b4_iftrue := VAR_CONST_SL_8_uxn_c_l200_c4_ae00_return_output;
     VAR_BIN_OP_OR_uxn_c_l213_c4_48c2_right := VAR_CONST_SL_8_uxn_c_l211_c4_e7ce_return_output;
     VAR_tmp12_MUX_uxn_c_l204_c8_1f11_iftrue := VAR_CONST_SL_8_uxn_c_l211_c4_e7ce_return_output;
     REG_VAR_color_cmp_1 := VAR_color_cmp_1_MUX_uxn_c_l190_c2_8d7e_return_output;
     VAR_color_cmp_0_MUX_uxn_c_l190_c2_8d7e_iftrue := VAR_color_cmp_0_uxn_c_l191_c3_3b4d;
     VAR_tmp12_uxn_c_l194_c4_d99e := resize(VAR_color_cmp_0_uxn_c_l191_c3_3b4d, 12);
     VAR_tmp12_uxn_c_l205_c4_5e73 := resize(VAR_color_cmp_0_uxn_c_l191_c3_3b4d, 12);
     VAR_tmp12_uxn_c_l216_c4_c0f5 := resize(VAR_color_cmp_0_uxn_c_l191_c3_3b4d, 12);
     VAR_tmp12_uxn_c_l227_c4_3e42 := resize(VAR_color_cmp_0_uxn_c_l191_c3_3b4d, 12);
     VAR_CONST_SL_8_uxn_c_l195_c4_bcbe_x := VAR_tmp12_uxn_c_l194_c4_d99e;
     VAR_CONST_SL_8_uxn_c_l206_c4_a732_x := VAR_tmp12_uxn_c_l205_c4_5e73;
     VAR_CONST_SL_4_uxn_c_l217_c4_9e50_x := VAR_tmp12_uxn_c_l216_c4_c0f5;
     VAR_CONST_SL_4_uxn_c_l228_c4_fec8_x := VAR_tmp12_uxn_c_l227_c4_3e42;
     -- BIN_OP_OR[uxn_c_l244_c4_36f6] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l244_c4_36f6_left <= VAR_BIN_OP_OR_uxn_c_l244_c4_36f6_left;
     BIN_OP_OR_uxn_c_l244_c4_36f6_right <= VAR_BIN_OP_OR_uxn_c_l244_c4_36f6_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l244_c4_36f6_return_output := BIN_OP_OR_uxn_c_l244_c4_36f6_return_output;

     -- CONST_SL_8[uxn_c_l206_c4_a732] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l206_c4_a732_x <= VAR_CONST_SL_8_uxn_c_l206_c4_a732_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l206_c4_a732_return_output := CONST_SL_8_uxn_c_l206_c4_a732_return_output;

     -- CONST_SL_4[uxn_c_l228_c4_fec8] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_c_l228_c4_fec8_x <= VAR_CONST_SL_4_uxn_c_l228_c4_fec8_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_c_l228_c4_fec8_return_output := CONST_SL_4_uxn_c_l228_c4_fec8_return_output;

     -- CONST_SL_8[uxn_c_l195_c4_bcbe] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l195_c4_bcbe_x <= VAR_CONST_SL_8_uxn_c_l195_c4_bcbe_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l195_c4_bcbe_return_output := CONST_SL_8_uxn_c_l195_c4_bcbe_return_output;

     -- BIN_OP_OR[uxn_c_l224_c4_c5ac] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l224_c4_c5ac_left <= VAR_BIN_OP_OR_uxn_c_l224_c4_c5ac_left;
     BIN_OP_OR_uxn_c_l224_c4_c5ac_right <= VAR_BIN_OP_OR_uxn_c_l224_c4_c5ac_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l224_c4_c5ac_return_output := BIN_OP_OR_uxn_c_l224_c4_c5ac_return_output;

     -- BIN_OP_OR[uxn_c_l202_c4_9617] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l202_c4_9617_left <= VAR_BIN_OP_OR_uxn_c_l202_c4_9617_left;
     BIN_OP_OR_uxn_c_l202_c4_9617_right <= VAR_BIN_OP_OR_uxn_c_l202_c4_9617_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l202_c4_9617_return_output := BIN_OP_OR_uxn_c_l202_c4_9617_return_output;

     -- tmp12_MUX[uxn_c_l246_c8_10f9] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_c_l246_c8_10f9_cond <= VAR_tmp12_MUX_uxn_c_l246_c8_10f9_cond;
     tmp12_MUX_uxn_c_l246_c8_10f9_iftrue <= VAR_tmp12_MUX_uxn_c_l246_c8_10f9_iftrue;
     tmp12_MUX_uxn_c_l246_c8_10f9_iffalse <= VAR_tmp12_MUX_uxn_c_l246_c8_10f9_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_c_l246_c8_10f9_return_output := tmp12_MUX_uxn_c_l246_c8_10f9_return_output;

     -- BIN_OP_OR[uxn_c_l213_c4_48c2] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l213_c4_48c2_left <= VAR_BIN_OP_OR_uxn_c_l213_c4_48c2_left;
     BIN_OP_OR_uxn_c_l213_c4_48c2_right <= VAR_BIN_OP_OR_uxn_c_l213_c4_48c2_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l213_c4_48c2_return_output := BIN_OP_OR_uxn_c_l213_c4_48c2_return_output;

     -- BIN_OP_OR[uxn_c_l253_c4_2638] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l253_c4_2638_left <= VAR_BIN_OP_OR_uxn_c_l253_c4_2638_left;
     BIN_OP_OR_uxn_c_l253_c4_2638_right <= VAR_BIN_OP_OR_uxn_c_l253_c4_2638_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l253_c4_2638_return_output := BIN_OP_OR_uxn_c_l253_c4_2638_return_output;

     -- CAST_TO_uint12_t_uint4_t_uxn_c_l247_l238_DUPLICATE_cdba LATENCY=0
     VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l247_l238_DUPLICATE_cdba_return_output := CAST_TO_uint12_t_uint4_t(
     VAR_color_cmp_0_uxn_c_l191_c3_3b4d);

     -- color_cmp_0_MUX[uxn_c_l190_c2_8d7e] LATENCY=0
     -- Inputs
     color_cmp_0_MUX_uxn_c_l190_c2_8d7e_cond <= VAR_color_cmp_0_MUX_uxn_c_l190_c2_8d7e_cond;
     color_cmp_0_MUX_uxn_c_l190_c2_8d7e_iftrue <= VAR_color_cmp_0_MUX_uxn_c_l190_c2_8d7e_iftrue;
     color_cmp_0_MUX_uxn_c_l190_c2_8d7e_iffalse <= VAR_color_cmp_0_MUX_uxn_c_l190_c2_8d7e_iffalse;
     -- Outputs
     VAR_color_cmp_0_MUX_uxn_c_l190_c2_8d7e_return_output := color_cmp_0_MUX_uxn_c_l190_c2_8d7e_return_output;

     -- BIN_OP_OR[uxn_c_l235_c4_da0f] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l235_c4_da0f_left <= VAR_BIN_OP_OR_uxn_c_l235_c4_da0f_left;
     BIN_OP_OR_uxn_c_l235_c4_da0f_right <= VAR_BIN_OP_OR_uxn_c_l235_c4_da0f_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l235_c4_da0f_return_output := BIN_OP_OR_uxn_c_l235_c4_da0f_return_output;

     -- CONST_SL_4[uxn_c_l217_c4_9e50] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_c_l217_c4_9e50_x <= VAR_CONST_SL_4_uxn_c_l217_c4_9e50_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_c_l217_c4_9e50_return_output := CONST_SL_4_uxn_c_l217_c4_9e50_return_output;

     -- Submodule level 3
     VAR_color1_MUX_uxn_c_l193_c3_e2b4_iftrue := VAR_BIN_OP_OR_uxn_c_l202_c4_9617_return_output;
     VAR_color3_MUX_uxn_c_l204_c8_1f11_iftrue := VAR_BIN_OP_OR_uxn_c_l213_c4_48c2_return_output;
     VAR_color1_MUX_uxn_c_l215_c8_e926_iftrue := VAR_BIN_OP_OR_uxn_c_l224_c4_c5ac_return_output;
     VAR_color3_MUX_uxn_c_l226_c8_3d96_iftrue := VAR_BIN_OP_OR_uxn_c_l235_c4_da0f_return_output;
     VAR_color1_MUX_uxn_c_l237_c8_6a32_iftrue := VAR_BIN_OP_OR_uxn_c_l244_c4_36f6_return_output;
     VAR_color3_MUX_uxn_c_l246_c8_10f9_iftrue := VAR_BIN_OP_OR_uxn_c_l253_c4_2638_return_output;
     VAR_BIN_OP_OR_uxn_c_l240_c4_13f0_right := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l247_l238_DUPLICATE_cdba_return_output;
     VAR_BIN_OP_OR_uxn_c_l249_c4_bd0e_right := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l247_l238_DUPLICATE_cdba_return_output;
     VAR_BIN_OP_OR_uxn_c_l219_c4_f9ca_right := VAR_CONST_SL_4_uxn_c_l217_c4_9e50_return_output;
     VAR_BIN_OP_OR_uxn_c_l230_c4_7532_right := VAR_CONST_SL_4_uxn_c_l228_c4_fec8_return_output;
     VAR_BIN_OP_OR_uxn_c_l197_c4_c276_right := VAR_CONST_SL_8_uxn_c_l195_c4_bcbe_return_output;
     VAR_BIN_OP_OR_uxn_c_l208_c4_c228_right := VAR_CONST_SL_8_uxn_c_l206_c4_a732_return_output;
     REG_VAR_color_cmp_0 := VAR_color_cmp_0_MUX_uxn_c_l190_c2_8d7e_return_output;
     VAR_tmp12_MUX_uxn_c_l237_c8_6a32_iffalse := VAR_tmp12_MUX_uxn_c_l246_c8_10f9_return_output;
     -- color3_MUX[uxn_c_l246_c8_10f9] LATENCY=0
     -- Inputs
     color3_MUX_uxn_c_l246_c8_10f9_cond <= VAR_color3_MUX_uxn_c_l246_c8_10f9_cond;
     color3_MUX_uxn_c_l246_c8_10f9_iftrue <= VAR_color3_MUX_uxn_c_l246_c8_10f9_iftrue;
     color3_MUX_uxn_c_l246_c8_10f9_iffalse <= VAR_color3_MUX_uxn_c_l246_c8_10f9_iffalse;
     -- Outputs
     VAR_color3_MUX_uxn_c_l246_c8_10f9_return_output := color3_MUX_uxn_c_l246_c8_10f9_return_output;

     -- BIN_OP_OR[uxn_c_l208_c4_c228] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l208_c4_c228_left <= VAR_BIN_OP_OR_uxn_c_l208_c4_c228_left;
     BIN_OP_OR_uxn_c_l208_c4_c228_right <= VAR_BIN_OP_OR_uxn_c_l208_c4_c228_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l208_c4_c228_return_output := BIN_OP_OR_uxn_c_l208_c4_c228_return_output;

     -- BIN_OP_OR[uxn_c_l230_c4_7532] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l230_c4_7532_left <= VAR_BIN_OP_OR_uxn_c_l230_c4_7532_left;
     BIN_OP_OR_uxn_c_l230_c4_7532_right <= VAR_BIN_OP_OR_uxn_c_l230_c4_7532_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l230_c4_7532_return_output := BIN_OP_OR_uxn_c_l230_c4_7532_return_output;

     -- tmp12_MUX[uxn_c_l237_c8_6a32] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_c_l237_c8_6a32_cond <= VAR_tmp12_MUX_uxn_c_l237_c8_6a32_cond;
     tmp12_MUX_uxn_c_l237_c8_6a32_iftrue <= VAR_tmp12_MUX_uxn_c_l237_c8_6a32_iftrue;
     tmp12_MUX_uxn_c_l237_c8_6a32_iffalse <= VAR_tmp12_MUX_uxn_c_l237_c8_6a32_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_c_l237_c8_6a32_return_output := tmp12_MUX_uxn_c_l237_c8_6a32_return_output;

     -- BIN_OP_OR[uxn_c_l249_c4_bd0e] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l249_c4_bd0e_left <= VAR_BIN_OP_OR_uxn_c_l249_c4_bd0e_left;
     BIN_OP_OR_uxn_c_l249_c4_bd0e_right <= VAR_BIN_OP_OR_uxn_c_l249_c4_bd0e_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l249_c4_bd0e_return_output := BIN_OP_OR_uxn_c_l249_c4_bd0e_return_output;

     -- BIN_OP_OR[uxn_c_l197_c4_c276] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l197_c4_c276_left <= VAR_BIN_OP_OR_uxn_c_l197_c4_c276_left;
     BIN_OP_OR_uxn_c_l197_c4_c276_right <= VAR_BIN_OP_OR_uxn_c_l197_c4_c276_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l197_c4_c276_return_output := BIN_OP_OR_uxn_c_l197_c4_c276_return_output;

     -- BIN_OP_OR[uxn_c_l219_c4_f9ca] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l219_c4_f9ca_left <= VAR_BIN_OP_OR_uxn_c_l219_c4_f9ca_left;
     BIN_OP_OR_uxn_c_l219_c4_f9ca_right <= VAR_BIN_OP_OR_uxn_c_l219_c4_f9ca_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l219_c4_f9ca_return_output := BIN_OP_OR_uxn_c_l219_c4_f9ca_return_output;

     -- color1_MUX[uxn_c_l237_c8_6a32] LATENCY=0
     -- Inputs
     color1_MUX_uxn_c_l237_c8_6a32_cond <= VAR_color1_MUX_uxn_c_l237_c8_6a32_cond;
     color1_MUX_uxn_c_l237_c8_6a32_iftrue <= VAR_color1_MUX_uxn_c_l237_c8_6a32_iftrue;
     color1_MUX_uxn_c_l237_c8_6a32_iffalse <= VAR_color1_MUX_uxn_c_l237_c8_6a32_iffalse;
     -- Outputs
     VAR_color1_MUX_uxn_c_l237_c8_6a32_return_output := color1_MUX_uxn_c_l237_c8_6a32_return_output;

     -- BIN_OP_OR[uxn_c_l240_c4_13f0] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l240_c4_13f0_left <= VAR_BIN_OP_OR_uxn_c_l240_c4_13f0_left;
     BIN_OP_OR_uxn_c_l240_c4_13f0_right <= VAR_BIN_OP_OR_uxn_c_l240_c4_13f0_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l240_c4_13f0_return_output := BIN_OP_OR_uxn_c_l240_c4_13f0_return_output;

     -- Submodule level 4
     VAR_color0_MUX_uxn_c_l193_c3_e2b4_iftrue := VAR_BIN_OP_OR_uxn_c_l197_c4_c276_return_output;
     VAR_color2_MUX_uxn_c_l204_c8_1f11_iftrue := VAR_BIN_OP_OR_uxn_c_l208_c4_c228_return_output;
     VAR_color0_MUX_uxn_c_l215_c8_e926_iftrue := VAR_BIN_OP_OR_uxn_c_l219_c4_f9ca_return_output;
     VAR_color2_MUX_uxn_c_l226_c8_3d96_iftrue := VAR_BIN_OP_OR_uxn_c_l230_c4_7532_return_output;
     VAR_color0_MUX_uxn_c_l237_c8_6a32_iftrue := VAR_BIN_OP_OR_uxn_c_l240_c4_13f0_return_output;
     VAR_color2_MUX_uxn_c_l246_c8_10f9_iftrue := VAR_BIN_OP_OR_uxn_c_l249_c4_bd0e_return_output;
     VAR_color1_MUX_uxn_c_l226_c8_3d96_iffalse := VAR_color1_MUX_uxn_c_l237_c8_6a32_return_output;
     VAR_color3_MUX_uxn_c_l237_c8_6a32_iffalse := VAR_color3_MUX_uxn_c_l246_c8_10f9_return_output;
     VAR_tmp12_MUX_uxn_c_l226_c8_3d96_iffalse := VAR_tmp12_MUX_uxn_c_l237_c8_6a32_return_output;
     -- color0_MUX[uxn_c_l237_c8_6a32] LATENCY=0
     -- Inputs
     color0_MUX_uxn_c_l237_c8_6a32_cond <= VAR_color0_MUX_uxn_c_l237_c8_6a32_cond;
     color0_MUX_uxn_c_l237_c8_6a32_iftrue <= VAR_color0_MUX_uxn_c_l237_c8_6a32_iftrue;
     color0_MUX_uxn_c_l237_c8_6a32_iffalse <= VAR_color0_MUX_uxn_c_l237_c8_6a32_iffalse;
     -- Outputs
     VAR_color0_MUX_uxn_c_l237_c8_6a32_return_output := color0_MUX_uxn_c_l237_c8_6a32_return_output;

     -- color2_MUX[uxn_c_l246_c8_10f9] LATENCY=0
     -- Inputs
     color2_MUX_uxn_c_l246_c8_10f9_cond <= VAR_color2_MUX_uxn_c_l246_c8_10f9_cond;
     color2_MUX_uxn_c_l246_c8_10f9_iftrue <= VAR_color2_MUX_uxn_c_l246_c8_10f9_iftrue;
     color2_MUX_uxn_c_l246_c8_10f9_iffalse <= VAR_color2_MUX_uxn_c_l246_c8_10f9_iffalse;
     -- Outputs
     VAR_color2_MUX_uxn_c_l246_c8_10f9_return_output := color2_MUX_uxn_c_l246_c8_10f9_return_output;

     -- tmp12_MUX[uxn_c_l226_c8_3d96] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_c_l226_c8_3d96_cond <= VAR_tmp12_MUX_uxn_c_l226_c8_3d96_cond;
     tmp12_MUX_uxn_c_l226_c8_3d96_iftrue <= VAR_tmp12_MUX_uxn_c_l226_c8_3d96_iftrue;
     tmp12_MUX_uxn_c_l226_c8_3d96_iffalse <= VAR_tmp12_MUX_uxn_c_l226_c8_3d96_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_c_l226_c8_3d96_return_output := tmp12_MUX_uxn_c_l226_c8_3d96_return_output;

     -- color1_MUX[uxn_c_l226_c8_3d96] LATENCY=0
     -- Inputs
     color1_MUX_uxn_c_l226_c8_3d96_cond <= VAR_color1_MUX_uxn_c_l226_c8_3d96_cond;
     color1_MUX_uxn_c_l226_c8_3d96_iftrue <= VAR_color1_MUX_uxn_c_l226_c8_3d96_iftrue;
     color1_MUX_uxn_c_l226_c8_3d96_iffalse <= VAR_color1_MUX_uxn_c_l226_c8_3d96_iffalse;
     -- Outputs
     VAR_color1_MUX_uxn_c_l226_c8_3d96_return_output := color1_MUX_uxn_c_l226_c8_3d96_return_output;

     -- color3_MUX[uxn_c_l237_c8_6a32] LATENCY=0
     -- Inputs
     color3_MUX_uxn_c_l237_c8_6a32_cond <= VAR_color3_MUX_uxn_c_l237_c8_6a32_cond;
     color3_MUX_uxn_c_l237_c8_6a32_iftrue <= VAR_color3_MUX_uxn_c_l237_c8_6a32_iftrue;
     color3_MUX_uxn_c_l237_c8_6a32_iffalse <= VAR_color3_MUX_uxn_c_l237_c8_6a32_iffalse;
     -- Outputs
     VAR_color3_MUX_uxn_c_l237_c8_6a32_return_output := color3_MUX_uxn_c_l237_c8_6a32_return_output;

     -- Submodule level 5
     VAR_color0_MUX_uxn_c_l226_c8_3d96_iffalse := VAR_color0_MUX_uxn_c_l237_c8_6a32_return_output;
     VAR_color1_MUX_uxn_c_l215_c8_e926_iffalse := VAR_color1_MUX_uxn_c_l226_c8_3d96_return_output;
     VAR_color2_MUX_uxn_c_l237_c8_6a32_iffalse := VAR_color2_MUX_uxn_c_l246_c8_10f9_return_output;
     VAR_color3_MUX_uxn_c_l226_c8_3d96_iffalse := VAR_color3_MUX_uxn_c_l237_c8_6a32_return_output;
     VAR_tmp12_MUX_uxn_c_l215_c8_e926_iffalse := VAR_tmp12_MUX_uxn_c_l226_c8_3d96_return_output;
     -- color1_MUX[uxn_c_l215_c8_e926] LATENCY=0
     -- Inputs
     color1_MUX_uxn_c_l215_c8_e926_cond <= VAR_color1_MUX_uxn_c_l215_c8_e926_cond;
     color1_MUX_uxn_c_l215_c8_e926_iftrue <= VAR_color1_MUX_uxn_c_l215_c8_e926_iftrue;
     color1_MUX_uxn_c_l215_c8_e926_iffalse <= VAR_color1_MUX_uxn_c_l215_c8_e926_iffalse;
     -- Outputs
     VAR_color1_MUX_uxn_c_l215_c8_e926_return_output := color1_MUX_uxn_c_l215_c8_e926_return_output;

     -- color3_MUX[uxn_c_l226_c8_3d96] LATENCY=0
     -- Inputs
     color3_MUX_uxn_c_l226_c8_3d96_cond <= VAR_color3_MUX_uxn_c_l226_c8_3d96_cond;
     color3_MUX_uxn_c_l226_c8_3d96_iftrue <= VAR_color3_MUX_uxn_c_l226_c8_3d96_iftrue;
     color3_MUX_uxn_c_l226_c8_3d96_iffalse <= VAR_color3_MUX_uxn_c_l226_c8_3d96_iffalse;
     -- Outputs
     VAR_color3_MUX_uxn_c_l226_c8_3d96_return_output := color3_MUX_uxn_c_l226_c8_3d96_return_output;

     -- color2_MUX[uxn_c_l237_c8_6a32] LATENCY=0
     -- Inputs
     color2_MUX_uxn_c_l237_c8_6a32_cond <= VAR_color2_MUX_uxn_c_l237_c8_6a32_cond;
     color2_MUX_uxn_c_l237_c8_6a32_iftrue <= VAR_color2_MUX_uxn_c_l237_c8_6a32_iftrue;
     color2_MUX_uxn_c_l237_c8_6a32_iffalse <= VAR_color2_MUX_uxn_c_l237_c8_6a32_iffalse;
     -- Outputs
     VAR_color2_MUX_uxn_c_l237_c8_6a32_return_output := color2_MUX_uxn_c_l237_c8_6a32_return_output;

     -- tmp12_MUX[uxn_c_l215_c8_e926] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_c_l215_c8_e926_cond <= VAR_tmp12_MUX_uxn_c_l215_c8_e926_cond;
     tmp12_MUX_uxn_c_l215_c8_e926_iftrue <= VAR_tmp12_MUX_uxn_c_l215_c8_e926_iftrue;
     tmp12_MUX_uxn_c_l215_c8_e926_iffalse <= VAR_tmp12_MUX_uxn_c_l215_c8_e926_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_c_l215_c8_e926_return_output := tmp12_MUX_uxn_c_l215_c8_e926_return_output;

     -- color0_MUX[uxn_c_l226_c8_3d96] LATENCY=0
     -- Inputs
     color0_MUX_uxn_c_l226_c8_3d96_cond <= VAR_color0_MUX_uxn_c_l226_c8_3d96_cond;
     color0_MUX_uxn_c_l226_c8_3d96_iftrue <= VAR_color0_MUX_uxn_c_l226_c8_3d96_iftrue;
     color0_MUX_uxn_c_l226_c8_3d96_iffalse <= VAR_color0_MUX_uxn_c_l226_c8_3d96_iffalse;
     -- Outputs
     VAR_color0_MUX_uxn_c_l226_c8_3d96_return_output := color0_MUX_uxn_c_l226_c8_3d96_return_output;

     -- Submodule level 6
     VAR_color0_MUX_uxn_c_l215_c8_e926_iffalse := VAR_color0_MUX_uxn_c_l226_c8_3d96_return_output;
     VAR_color1_MUX_uxn_c_l204_c8_1f11_iffalse := VAR_color1_MUX_uxn_c_l215_c8_e926_return_output;
     VAR_color2_MUX_uxn_c_l226_c8_3d96_iffalse := VAR_color2_MUX_uxn_c_l237_c8_6a32_return_output;
     VAR_color3_MUX_uxn_c_l215_c8_e926_iffalse := VAR_color3_MUX_uxn_c_l226_c8_3d96_return_output;
     VAR_tmp12_MUX_uxn_c_l204_c8_1f11_iffalse := VAR_tmp12_MUX_uxn_c_l215_c8_e926_return_output;
     -- color0_MUX[uxn_c_l215_c8_e926] LATENCY=0
     -- Inputs
     color0_MUX_uxn_c_l215_c8_e926_cond <= VAR_color0_MUX_uxn_c_l215_c8_e926_cond;
     color0_MUX_uxn_c_l215_c8_e926_iftrue <= VAR_color0_MUX_uxn_c_l215_c8_e926_iftrue;
     color0_MUX_uxn_c_l215_c8_e926_iffalse <= VAR_color0_MUX_uxn_c_l215_c8_e926_iffalse;
     -- Outputs
     VAR_color0_MUX_uxn_c_l215_c8_e926_return_output := color0_MUX_uxn_c_l215_c8_e926_return_output;

     -- color3_MUX[uxn_c_l215_c8_e926] LATENCY=0
     -- Inputs
     color3_MUX_uxn_c_l215_c8_e926_cond <= VAR_color3_MUX_uxn_c_l215_c8_e926_cond;
     color3_MUX_uxn_c_l215_c8_e926_iftrue <= VAR_color3_MUX_uxn_c_l215_c8_e926_iftrue;
     color3_MUX_uxn_c_l215_c8_e926_iffalse <= VAR_color3_MUX_uxn_c_l215_c8_e926_iffalse;
     -- Outputs
     VAR_color3_MUX_uxn_c_l215_c8_e926_return_output := color3_MUX_uxn_c_l215_c8_e926_return_output;

     -- color2_MUX[uxn_c_l226_c8_3d96] LATENCY=0
     -- Inputs
     color2_MUX_uxn_c_l226_c8_3d96_cond <= VAR_color2_MUX_uxn_c_l226_c8_3d96_cond;
     color2_MUX_uxn_c_l226_c8_3d96_iftrue <= VAR_color2_MUX_uxn_c_l226_c8_3d96_iftrue;
     color2_MUX_uxn_c_l226_c8_3d96_iffalse <= VAR_color2_MUX_uxn_c_l226_c8_3d96_iffalse;
     -- Outputs
     VAR_color2_MUX_uxn_c_l226_c8_3d96_return_output := color2_MUX_uxn_c_l226_c8_3d96_return_output;

     -- color1_MUX[uxn_c_l204_c8_1f11] LATENCY=0
     -- Inputs
     color1_MUX_uxn_c_l204_c8_1f11_cond <= VAR_color1_MUX_uxn_c_l204_c8_1f11_cond;
     color1_MUX_uxn_c_l204_c8_1f11_iftrue <= VAR_color1_MUX_uxn_c_l204_c8_1f11_iftrue;
     color1_MUX_uxn_c_l204_c8_1f11_iffalse <= VAR_color1_MUX_uxn_c_l204_c8_1f11_iffalse;
     -- Outputs
     VAR_color1_MUX_uxn_c_l204_c8_1f11_return_output := color1_MUX_uxn_c_l204_c8_1f11_return_output;

     -- tmp12_MUX[uxn_c_l204_c8_1f11] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_c_l204_c8_1f11_cond <= VAR_tmp12_MUX_uxn_c_l204_c8_1f11_cond;
     tmp12_MUX_uxn_c_l204_c8_1f11_iftrue <= VAR_tmp12_MUX_uxn_c_l204_c8_1f11_iftrue;
     tmp12_MUX_uxn_c_l204_c8_1f11_iffalse <= VAR_tmp12_MUX_uxn_c_l204_c8_1f11_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_c_l204_c8_1f11_return_output := tmp12_MUX_uxn_c_l204_c8_1f11_return_output;

     -- Submodule level 7
     VAR_color0_MUX_uxn_c_l204_c8_1f11_iffalse := VAR_color0_MUX_uxn_c_l215_c8_e926_return_output;
     VAR_color1_MUX_uxn_c_l193_c3_e2b4_iffalse := VAR_color1_MUX_uxn_c_l204_c8_1f11_return_output;
     VAR_color2_MUX_uxn_c_l215_c8_e926_iffalse := VAR_color2_MUX_uxn_c_l226_c8_3d96_return_output;
     VAR_color3_MUX_uxn_c_l204_c8_1f11_iffalse := VAR_color3_MUX_uxn_c_l215_c8_e926_return_output;
     VAR_tmp12_MUX_uxn_c_l193_c3_e2b4_iffalse := VAR_tmp12_MUX_uxn_c_l204_c8_1f11_return_output;
     -- tmp12_MUX[uxn_c_l193_c3_e2b4] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_c_l193_c3_e2b4_cond <= VAR_tmp12_MUX_uxn_c_l193_c3_e2b4_cond;
     tmp12_MUX_uxn_c_l193_c3_e2b4_iftrue <= VAR_tmp12_MUX_uxn_c_l193_c3_e2b4_iftrue;
     tmp12_MUX_uxn_c_l193_c3_e2b4_iffalse <= VAR_tmp12_MUX_uxn_c_l193_c3_e2b4_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_c_l193_c3_e2b4_return_output := tmp12_MUX_uxn_c_l193_c3_e2b4_return_output;

     -- color2_MUX[uxn_c_l215_c8_e926] LATENCY=0
     -- Inputs
     color2_MUX_uxn_c_l215_c8_e926_cond <= VAR_color2_MUX_uxn_c_l215_c8_e926_cond;
     color2_MUX_uxn_c_l215_c8_e926_iftrue <= VAR_color2_MUX_uxn_c_l215_c8_e926_iftrue;
     color2_MUX_uxn_c_l215_c8_e926_iffalse <= VAR_color2_MUX_uxn_c_l215_c8_e926_iffalse;
     -- Outputs
     VAR_color2_MUX_uxn_c_l215_c8_e926_return_output := color2_MUX_uxn_c_l215_c8_e926_return_output;

     -- color3_MUX[uxn_c_l204_c8_1f11] LATENCY=0
     -- Inputs
     color3_MUX_uxn_c_l204_c8_1f11_cond <= VAR_color3_MUX_uxn_c_l204_c8_1f11_cond;
     color3_MUX_uxn_c_l204_c8_1f11_iftrue <= VAR_color3_MUX_uxn_c_l204_c8_1f11_iftrue;
     color3_MUX_uxn_c_l204_c8_1f11_iffalse <= VAR_color3_MUX_uxn_c_l204_c8_1f11_iffalse;
     -- Outputs
     VAR_color3_MUX_uxn_c_l204_c8_1f11_return_output := color3_MUX_uxn_c_l204_c8_1f11_return_output;

     -- color0_MUX[uxn_c_l204_c8_1f11] LATENCY=0
     -- Inputs
     color0_MUX_uxn_c_l204_c8_1f11_cond <= VAR_color0_MUX_uxn_c_l204_c8_1f11_cond;
     color0_MUX_uxn_c_l204_c8_1f11_iftrue <= VAR_color0_MUX_uxn_c_l204_c8_1f11_iftrue;
     color0_MUX_uxn_c_l204_c8_1f11_iffalse <= VAR_color0_MUX_uxn_c_l204_c8_1f11_iffalse;
     -- Outputs
     VAR_color0_MUX_uxn_c_l204_c8_1f11_return_output := color0_MUX_uxn_c_l204_c8_1f11_return_output;

     -- color1_MUX[uxn_c_l193_c3_e2b4] LATENCY=0
     -- Inputs
     color1_MUX_uxn_c_l193_c3_e2b4_cond <= VAR_color1_MUX_uxn_c_l193_c3_e2b4_cond;
     color1_MUX_uxn_c_l193_c3_e2b4_iftrue <= VAR_color1_MUX_uxn_c_l193_c3_e2b4_iftrue;
     color1_MUX_uxn_c_l193_c3_e2b4_iffalse <= VAR_color1_MUX_uxn_c_l193_c3_e2b4_iffalse;
     -- Outputs
     VAR_color1_MUX_uxn_c_l193_c3_e2b4_return_output := color1_MUX_uxn_c_l193_c3_e2b4_return_output;

     -- Submodule level 8
     VAR_color0_MUX_uxn_c_l193_c3_e2b4_iffalse := VAR_color0_MUX_uxn_c_l204_c8_1f11_return_output;
     VAR_color1_MUX_uxn_c_l190_c2_8d7e_iftrue := VAR_color1_MUX_uxn_c_l193_c3_e2b4_return_output;
     VAR_color2_MUX_uxn_c_l204_c8_1f11_iffalse := VAR_color2_MUX_uxn_c_l215_c8_e926_return_output;
     VAR_color3_MUX_uxn_c_l193_c3_e2b4_iffalse := VAR_color3_MUX_uxn_c_l204_c8_1f11_return_output;
     VAR_tmp12_MUX_uxn_c_l190_c2_8d7e_iftrue := VAR_tmp12_MUX_uxn_c_l193_c3_e2b4_return_output;
     -- color1_MUX[uxn_c_l190_c2_8d7e] LATENCY=0
     -- Inputs
     color1_MUX_uxn_c_l190_c2_8d7e_cond <= VAR_color1_MUX_uxn_c_l190_c2_8d7e_cond;
     color1_MUX_uxn_c_l190_c2_8d7e_iftrue <= VAR_color1_MUX_uxn_c_l190_c2_8d7e_iftrue;
     color1_MUX_uxn_c_l190_c2_8d7e_iffalse <= VAR_color1_MUX_uxn_c_l190_c2_8d7e_iffalse;
     -- Outputs
     VAR_color1_MUX_uxn_c_l190_c2_8d7e_return_output := color1_MUX_uxn_c_l190_c2_8d7e_return_output;

     -- color0_MUX[uxn_c_l193_c3_e2b4] LATENCY=0
     -- Inputs
     color0_MUX_uxn_c_l193_c3_e2b4_cond <= VAR_color0_MUX_uxn_c_l193_c3_e2b4_cond;
     color0_MUX_uxn_c_l193_c3_e2b4_iftrue <= VAR_color0_MUX_uxn_c_l193_c3_e2b4_iftrue;
     color0_MUX_uxn_c_l193_c3_e2b4_iffalse <= VAR_color0_MUX_uxn_c_l193_c3_e2b4_iffalse;
     -- Outputs
     VAR_color0_MUX_uxn_c_l193_c3_e2b4_return_output := color0_MUX_uxn_c_l193_c3_e2b4_return_output;

     -- color2_MUX[uxn_c_l204_c8_1f11] LATENCY=0
     -- Inputs
     color2_MUX_uxn_c_l204_c8_1f11_cond <= VAR_color2_MUX_uxn_c_l204_c8_1f11_cond;
     color2_MUX_uxn_c_l204_c8_1f11_iftrue <= VAR_color2_MUX_uxn_c_l204_c8_1f11_iftrue;
     color2_MUX_uxn_c_l204_c8_1f11_iffalse <= VAR_color2_MUX_uxn_c_l204_c8_1f11_iffalse;
     -- Outputs
     VAR_color2_MUX_uxn_c_l204_c8_1f11_return_output := color2_MUX_uxn_c_l204_c8_1f11_return_output;

     -- color3_MUX[uxn_c_l193_c3_e2b4] LATENCY=0
     -- Inputs
     color3_MUX_uxn_c_l193_c3_e2b4_cond <= VAR_color3_MUX_uxn_c_l193_c3_e2b4_cond;
     color3_MUX_uxn_c_l193_c3_e2b4_iftrue <= VAR_color3_MUX_uxn_c_l193_c3_e2b4_iftrue;
     color3_MUX_uxn_c_l193_c3_e2b4_iffalse <= VAR_color3_MUX_uxn_c_l193_c3_e2b4_iffalse;
     -- Outputs
     VAR_color3_MUX_uxn_c_l193_c3_e2b4_return_output := color3_MUX_uxn_c_l193_c3_e2b4_return_output;

     -- tmp12_MUX[uxn_c_l190_c2_8d7e] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_c_l190_c2_8d7e_cond <= VAR_tmp12_MUX_uxn_c_l190_c2_8d7e_cond;
     tmp12_MUX_uxn_c_l190_c2_8d7e_iftrue <= VAR_tmp12_MUX_uxn_c_l190_c2_8d7e_iftrue;
     tmp12_MUX_uxn_c_l190_c2_8d7e_iffalse <= VAR_tmp12_MUX_uxn_c_l190_c2_8d7e_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_c_l190_c2_8d7e_return_output := tmp12_MUX_uxn_c_l190_c2_8d7e_return_output;

     -- Submodule level 9
     VAR_color0_MUX_uxn_c_l190_c2_8d7e_iftrue := VAR_color0_MUX_uxn_c_l193_c3_e2b4_return_output;
     REG_VAR_color1 := VAR_color1_MUX_uxn_c_l190_c2_8d7e_return_output;
     VAR_result_uxn_c_l260_c3_3e92 := resize(VAR_color1_MUX_uxn_c_l190_c2_8d7e_return_output, 16);
     VAR_color2_MUX_uxn_c_l193_c3_e2b4_iffalse := VAR_color2_MUX_uxn_c_l204_c8_1f11_return_output;
     VAR_color3_MUX_uxn_c_l190_c2_8d7e_iftrue := VAR_color3_MUX_uxn_c_l193_c3_e2b4_return_output;
     REG_VAR_tmp12 := VAR_tmp12_MUX_uxn_c_l190_c2_8d7e_return_output;
     VAR_result_MUX_uxn_c_l259_c9_39c4_iftrue := VAR_result_uxn_c_l260_c3_3e92;
     -- color0_MUX[uxn_c_l190_c2_8d7e] LATENCY=0
     -- Inputs
     color0_MUX_uxn_c_l190_c2_8d7e_cond <= VAR_color0_MUX_uxn_c_l190_c2_8d7e_cond;
     color0_MUX_uxn_c_l190_c2_8d7e_iftrue <= VAR_color0_MUX_uxn_c_l190_c2_8d7e_iftrue;
     color0_MUX_uxn_c_l190_c2_8d7e_iffalse <= VAR_color0_MUX_uxn_c_l190_c2_8d7e_iffalse;
     -- Outputs
     VAR_color0_MUX_uxn_c_l190_c2_8d7e_return_output := color0_MUX_uxn_c_l190_c2_8d7e_return_output;

     -- color2_MUX[uxn_c_l193_c3_e2b4] LATENCY=0
     -- Inputs
     color2_MUX_uxn_c_l193_c3_e2b4_cond <= VAR_color2_MUX_uxn_c_l193_c3_e2b4_cond;
     color2_MUX_uxn_c_l193_c3_e2b4_iftrue <= VAR_color2_MUX_uxn_c_l193_c3_e2b4_iftrue;
     color2_MUX_uxn_c_l193_c3_e2b4_iffalse <= VAR_color2_MUX_uxn_c_l193_c3_e2b4_iffalse;
     -- Outputs
     VAR_color2_MUX_uxn_c_l193_c3_e2b4_return_output := color2_MUX_uxn_c_l193_c3_e2b4_return_output;

     -- color3_MUX[uxn_c_l190_c2_8d7e] LATENCY=0
     -- Inputs
     color3_MUX_uxn_c_l190_c2_8d7e_cond <= VAR_color3_MUX_uxn_c_l190_c2_8d7e_cond;
     color3_MUX_uxn_c_l190_c2_8d7e_iftrue <= VAR_color3_MUX_uxn_c_l190_c2_8d7e_iftrue;
     color3_MUX_uxn_c_l190_c2_8d7e_iffalse <= VAR_color3_MUX_uxn_c_l190_c2_8d7e_iffalse;
     -- Outputs
     VAR_color3_MUX_uxn_c_l190_c2_8d7e_return_output := color3_MUX_uxn_c_l190_c2_8d7e_return_output;

     -- Submodule level 10
     REG_VAR_color0 := VAR_color0_MUX_uxn_c_l190_c2_8d7e_return_output;
     VAR_result_uxn_c_l258_c3_a323 := resize(VAR_color0_MUX_uxn_c_l190_c2_8d7e_return_output, 16);
     VAR_color2_MUX_uxn_c_l190_c2_8d7e_iftrue := VAR_color2_MUX_uxn_c_l193_c3_e2b4_return_output;
     REG_VAR_color3 := VAR_color3_MUX_uxn_c_l190_c2_8d7e_return_output;
     VAR_result_uxn_c_l264_c3_ea32 := resize(VAR_color3_MUX_uxn_c_l190_c2_8d7e_return_output, 16);
     VAR_result_MUX_uxn_c_l257_c2_60f0_iftrue := VAR_result_uxn_c_l258_c3_a323;
     VAR_result_MUX_uxn_c_l261_c9_5f7b_iffalse := VAR_result_uxn_c_l264_c3_ea32;
     -- color2_MUX[uxn_c_l190_c2_8d7e] LATENCY=0
     -- Inputs
     color2_MUX_uxn_c_l190_c2_8d7e_cond <= VAR_color2_MUX_uxn_c_l190_c2_8d7e_cond;
     color2_MUX_uxn_c_l190_c2_8d7e_iftrue <= VAR_color2_MUX_uxn_c_l190_c2_8d7e_iftrue;
     color2_MUX_uxn_c_l190_c2_8d7e_iffalse <= VAR_color2_MUX_uxn_c_l190_c2_8d7e_iffalse;
     -- Outputs
     VAR_color2_MUX_uxn_c_l190_c2_8d7e_return_output := color2_MUX_uxn_c_l190_c2_8d7e_return_output;

     -- Submodule level 11
     REG_VAR_color2 := VAR_color2_MUX_uxn_c_l190_c2_8d7e_return_output;
     VAR_result_uxn_c_l262_c3_1ad3 := resize(VAR_color2_MUX_uxn_c_l190_c2_8d7e_return_output, 16);
     VAR_result_MUX_uxn_c_l261_c9_5f7b_iftrue := VAR_result_uxn_c_l262_c3_1ad3;
     -- result_MUX[uxn_c_l261_c9_5f7b] LATENCY=0
     -- Inputs
     result_MUX_uxn_c_l261_c9_5f7b_cond <= VAR_result_MUX_uxn_c_l261_c9_5f7b_cond;
     result_MUX_uxn_c_l261_c9_5f7b_iftrue <= VAR_result_MUX_uxn_c_l261_c9_5f7b_iftrue;
     result_MUX_uxn_c_l261_c9_5f7b_iffalse <= VAR_result_MUX_uxn_c_l261_c9_5f7b_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_c_l261_c9_5f7b_return_output := result_MUX_uxn_c_l261_c9_5f7b_return_output;

     -- Submodule level 12
     VAR_result_MUX_uxn_c_l259_c9_39c4_iffalse := VAR_result_MUX_uxn_c_l261_c9_5f7b_return_output;
     -- result_MUX[uxn_c_l259_c9_39c4] LATENCY=0
     -- Inputs
     result_MUX_uxn_c_l259_c9_39c4_cond <= VAR_result_MUX_uxn_c_l259_c9_39c4_cond;
     result_MUX_uxn_c_l259_c9_39c4_iftrue <= VAR_result_MUX_uxn_c_l259_c9_39c4_iftrue;
     result_MUX_uxn_c_l259_c9_39c4_iffalse <= VAR_result_MUX_uxn_c_l259_c9_39c4_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_c_l259_c9_39c4_return_output := result_MUX_uxn_c_l259_c9_39c4_return_output;

     -- Submodule level 13
     VAR_result_MUX_uxn_c_l257_c2_60f0_iffalse := VAR_result_MUX_uxn_c_l259_c9_39c4_return_output;
     -- result_MUX[uxn_c_l257_c2_60f0] LATENCY=0
     -- Inputs
     result_MUX_uxn_c_l257_c2_60f0_cond <= VAR_result_MUX_uxn_c_l257_c2_60f0_cond;
     result_MUX_uxn_c_l257_c2_60f0_iftrue <= VAR_result_MUX_uxn_c_l257_c2_60f0_iftrue;
     result_MUX_uxn_c_l257_c2_60f0_iffalse <= VAR_result_MUX_uxn_c_l257_c2_60f0_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_c_l257_c2_60f0_return_output := result_MUX_uxn_c_l257_c2_60f0_return_output;

     -- Submodule level 14
     REG_VAR_result := VAR_result_MUX_uxn_c_l257_c2_60f0_return_output;
     VAR_return_output := VAR_result_MUX_uxn_c_l257_c2_60f0_return_output;
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
