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
-- color0_MUX[uxn_c_l212_c2_d7ed]
signal color0_MUX_uxn_c_l212_c2_d7ed_cond : unsigned(0 downto 0);
signal color0_MUX_uxn_c_l212_c2_d7ed_iftrue : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l212_c2_d7ed_iffalse : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l212_c2_d7ed_return_output : unsigned(11 downto 0);

-- color_cmp_0_MUX[uxn_c_l212_c2_d7ed]
signal color_cmp_0_MUX_uxn_c_l212_c2_d7ed_cond : unsigned(0 downto 0);
signal color_cmp_0_MUX_uxn_c_l212_c2_d7ed_iftrue : unsigned(3 downto 0);
signal color_cmp_0_MUX_uxn_c_l212_c2_d7ed_iffalse : unsigned(3 downto 0);
signal color_cmp_0_MUX_uxn_c_l212_c2_d7ed_return_output : unsigned(3 downto 0);

-- color1_MUX[uxn_c_l212_c2_d7ed]
signal color1_MUX_uxn_c_l212_c2_d7ed_cond : unsigned(0 downto 0);
signal color1_MUX_uxn_c_l212_c2_d7ed_iftrue : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l212_c2_d7ed_iffalse : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l212_c2_d7ed_return_output : unsigned(11 downto 0);

-- color_cmp_1_MUX[uxn_c_l212_c2_d7ed]
signal color_cmp_1_MUX_uxn_c_l212_c2_d7ed_cond : unsigned(0 downto 0);
signal color_cmp_1_MUX_uxn_c_l212_c2_d7ed_iftrue : unsigned(3 downto 0);
signal color_cmp_1_MUX_uxn_c_l212_c2_d7ed_iffalse : unsigned(3 downto 0);
signal color_cmp_1_MUX_uxn_c_l212_c2_d7ed_return_output : unsigned(3 downto 0);

-- color2_MUX[uxn_c_l212_c2_d7ed]
signal color2_MUX_uxn_c_l212_c2_d7ed_cond : unsigned(0 downto 0);
signal color2_MUX_uxn_c_l212_c2_d7ed_iftrue : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l212_c2_d7ed_iffalse : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l212_c2_d7ed_return_output : unsigned(11 downto 0);

-- tmp12_MUX[uxn_c_l212_c2_d7ed]
signal tmp12_MUX_uxn_c_l212_c2_d7ed_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_c_l212_c2_d7ed_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l212_c2_d7ed_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l212_c2_d7ed_return_output : unsigned(11 downto 0);

-- color3_MUX[uxn_c_l212_c2_d7ed]
signal color3_MUX_uxn_c_l212_c2_d7ed_cond : unsigned(0 downto 0);
signal color3_MUX_uxn_c_l212_c2_d7ed_iftrue : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l212_c2_d7ed_iffalse : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l212_c2_d7ed_return_output : unsigned(11 downto 0);

-- CONST_SR_4[uxn_c_l213_c27_c713]
signal CONST_SR_4_uxn_c_l213_c27_c713_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_c_l213_c27_c713_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_c_l215_c7_03b4]
signal BIN_OP_EQ_uxn_c_l215_c7_03b4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l215_c7_03b4_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l215_c7_03b4_return_output : unsigned(0 downto 0);

-- color0_MUX[uxn_c_l215_c3_2a42]
signal color0_MUX_uxn_c_l215_c3_2a42_cond : unsigned(0 downto 0);
signal color0_MUX_uxn_c_l215_c3_2a42_iftrue : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l215_c3_2a42_iffalse : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l215_c3_2a42_return_output : unsigned(11 downto 0);

-- color1_MUX[uxn_c_l215_c3_2a42]
signal color1_MUX_uxn_c_l215_c3_2a42_cond : unsigned(0 downto 0);
signal color1_MUX_uxn_c_l215_c3_2a42_iftrue : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l215_c3_2a42_iffalse : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l215_c3_2a42_return_output : unsigned(11 downto 0);

-- color2_MUX[uxn_c_l215_c3_2a42]
signal color2_MUX_uxn_c_l215_c3_2a42_cond : unsigned(0 downto 0);
signal color2_MUX_uxn_c_l215_c3_2a42_iftrue : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l215_c3_2a42_iffalse : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l215_c3_2a42_return_output : unsigned(11 downto 0);

-- tmp12_MUX[uxn_c_l215_c3_2a42]
signal tmp12_MUX_uxn_c_l215_c3_2a42_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_c_l215_c3_2a42_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l215_c3_2a42_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l215_c3_2a42_return_output : unsigned(11 downto 0);

-- color3_MUX[uxn_c_l215_c3_2a42]
signal color3_MUX_uxn_c_l215_c3_2a42_cond : unsigned(0 downto 0);
signal color3_MUX_uxn_c_l215_c3_2a42_iftrue : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l215_c3_2a42_iffalse : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l215_c3_2a42_return_output : unsigned(11 downto 0);

-- CONST_SL_8[uxn_c_l217_c4_9683]
signal CONST_SL_8_uxn_c_l217_c4_9683_x : unsigned(11 downto 0);
signal CONST_SL_8_uxn_c_l217_c4_9683_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l218_c4_0940]
signal BIN_OP_AND_uxn_c_l218_c4_0940_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l218_c4_0940_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l218_c4_0940_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l219_c4_9903]
signal BIN_OP_OR_uxn_c_l219_c4_9903_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l219_c4_9903_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l219_c4_9903_return_output : unsigned(11 downto 0);

-- CONST_SL_8[uxn_c_l222_c4_0275]
signal CONST_SL_8_uxn_c_l222_c4_0275_x : unsigned(11 downto 0);
signal CONST_SL_8_uxn_c_l222_c4_0275_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l223_c4_0213]
signal BIN_OP_AND_uxn_c_l223_c4_0213_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l223_c4_0213_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l223_c4_0213_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l224_c4_65ff]
signal BIN_OP_OR_uxn_c_l224_c4_65ff_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l224_c4_65ff_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l224_c4_65ff_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l226_c12_9f8a]
signal BIN_OP_EQ_uxn_c_l226_c12_9f8a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l226_c12_9f8a_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l226_c12_9f8a_return_output : unsigned(0 downto 0);

-- color0_MUX[uxn_c_l226_c8_cfb4]
signal color0_MUX_uxn_c_l226_c8_cfb4_cond : unsigned(0 downto 0);
signal color0_MUX_uxn_c_l226_c8_cfb4_iftrue : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l226_c8_cfb4_iffalse : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l226_c8_cfb4_return_output : unsigned(11 downto 0);

-- color1_MUX[uxn_c_l226_c8_cfb4]
signal color1_MUX_uxn_c_l226_c8_cfb4_cond : unsigned(0 downto 0);
signal color1_MUX_uxn_c_l226_c8_cfb4_iftrue : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l226_c8_cfb4_iffalse : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l226_c8_cfb4_return_output : unsigned(11 downto 0);

-- color2_MUX[uxn_c_l226_c8_cfb4]
signal color2_MUX_uxn_c_l226_c8_cfb4_cond : unsigned(0 downto 0);
signal color2_MUX_uxn_c_l226_c8_cfb4_iftrue : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l226_c8_cfb4_iffalse : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l226_c8_cfb4_return_output : unsigned(11 downto 0);

-- tmp12_MUX[uxn_c_l226_c8_cfb4]
signal tmp12_MUX_uxn_c_l226_c8_cfb4_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_c_l226_c8_cfb4_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l226_c8_cfb4_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l226_c8_cfb4_return_output : unsigned(11 downto 0);

-- color3_MUX[uxn_c_l226_c8_cfb4]
signal color3_MUX_uxn_c_l226_c8_cfb4_cond : unsigned(0 downto 0);
signal color3_MUX_uxn_c_l226_c8_cfb4_iftrue : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l226_c8_cfb4_iffalse : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l226_c8_cfb4_return_output : unsigned(11 downto 0);

-- CONST_SL_8[uxn_c_l228_c4_b2d6]
signal CONST_SL_8_uxn_c_l228_c4_b2d6_x : unsigned(11 downto 0);
signal CONST_SL_8_uxn_c_l228_c4_b2d6_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l229_c4_1e92]
signal BIN_OP_AND_uxn_c_l229_c4_1e92_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l229_c4_1e92_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l229_c4_1e92_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l230_c4_1552]
signal BIN_OP_OR_uxn_c_l230_c4_1552_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l230_c4_1552_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l230_c4_1552_return_output : unsigned(11 downto 0);

-- CONST_SL_8[uxn_c_l233_c4_f33d]
signal CONST_SL_8_uxn_c_l233_c4_f33d_x : unsigned(11 downto 0);
signal CONST_SL_8_uxn_c_l233_c4_f33d_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l234_c4_0726]
signal BIN_OP_AND_uxn_c_l234_c4_0726_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l234_c4_0726_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l234_c4_0726_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l235_c4_1168]
signal BIN_OP_OR_uxn_c_l235_c4_1168_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l235_c4_1168_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l235_c4_1168_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l237_c12_1f37]
signal BIN_OP_EQ_uxn_c_l237_c12_1f37_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l237_c12_1f37_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l237_c12_1f37_return_output : unsigned(0 downto 0);

-- color0_MUX[uxn_c_l237_c8_7523]
signal color0_MUX_uxn_c_l237_c8_7523_cond : unsigned(0 downto 0);
signal color0_MUX_uxn_c_l237_c8_7523_iftrue : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l237_c8_7523_iffalse : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l237_c8_7523_return_output : unsigned(11 downto 0);

-- color1_MUX[uxn_c_l237_c8_7523]
signal color1_MUX_uxn_c_l237_c8_7523_cond : unsigned(0 downto 0);
signal color1_MUX_uxn_c_l237_c8_7523_iftrue : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l237_c8_7523_iffalse : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l237_c8_7523_return_output : unsigned(11 downto 0);

-- color2_MUX[uxn_c_l237_c8_7523]
signal color2_MUX_uxn_c_l237_c8_7523_cond : unsigned(0 downto 0);
signal color2_MUX_uxn_c_l237_c8_7523_iftrue : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l237_c8_7523_iffalse : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l237_c8_7523_return_output : unsigned(11 downto 0);

-- tmp12_MUX[uxn_c_l237_c8_7523]
signal tmp12_MUX_uxn_c_l237_c8_7523_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_c_l237_c8_7523_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l237_c8_7523_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l237_c8_7523_return_output : unsigned(11 downto 0);

-- color3_MUX[uxn_c_l237_c8_7523]
signal color3_MUX_uxn_c_l237_c8_7523_cond : unsigned(0 downto 0);
signal color3_MUX_uxn_c_l237_c8_7523_iftrue : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l237_c8_7523_iffalse : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l237_c8_7523_return_output : unsigned(11 downto 0);

-- CONST_SL_4[uxn_c_l239_c4_d5d6]
signal CONST_SL_4_uxn_c_l239_c4_d5d6_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_c_l239_c4_d5d6_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l240_c4_f1e8]
signal BIN_OP_AND_uxn_c_l240_c4_f1e8_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l240_c4_f1e8_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l240_c4_f1e8_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l241_c4_3a79]
signal BIN_OP_OR_uxn_c_l241_c4_3a79_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l241_c4_3a79_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l241_c4_3a79_return_output : unsigned(11 downto 0);

-- CONST_SL_4[uxn_c_l244_c4_0740]
signal CONST_SL_4_uxn_c_l244_c4_0740_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_c_l244_c4_0740_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l245_c4_89c6]
signal BIN_OP_AND_uxn_c_l245_c4_89c6_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l245_c4_89c6_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l245_c4_89c6_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l246_c4_bd0e]
signal BIN_OP_OR_uxn_c_l246_c4_bd0e_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l246_c4_bd0e_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l246_c4_bd0e_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l248_c12_5ade]
signal BIN_OP_EQ_uxn_c_l248_c12_5ade_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l248_c12_5ade_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l248_c12_5ade_return_output : unsigned(0 downto 0);

-- color0_MUX[uxn_c_l248_c8_85a9]
signal color0_MUX_uxn_c_l248_c8_85a9_cond : unsigned(0 downto 0);
signal color0_MUX_uxn_c_l248_c8_85a9_iftrue : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l248_c8_85a9_iffalse : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l248_c8_85a9_return_output : unsigned(11 downto 0);

-- color1_MUX[uxn_c_l248_c8_85a9]
signal color1_MUX_uxn_c_l248_c8_85a9_cond : unsigned(0 downto 0);
signal color1_MUX_uxn_c_l248_c8_85a9_iftrue : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l248_c8_85a9_iffalse : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l248_c8_85a9_return_output : unsigned(11 downto 0);

-- color2_MUX[uxn_c_l248_c8_85a9]
signal color2_MUX_uxn_c_l248_c8_85a9_cond : unsigned(0 downto 0);
signal color2_MUX_uxn_c_l248_c8_85a9_iftrue : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l248_c8_85a9_iffalse : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l248_c8_85a9_return_output : unsigned(11 downto 0);

-- tmp12_MUX[uxn_c_l248_c8_85a9]
signal tmp12_MUX_uxn_c_l248_c8_85a9_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_c_l248_c8_85a9_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l248_c8_85a9_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l248_c8_85a9_return_output : unsigned(11 downto 0);

-- color3_MUX[uxn_c_l248_c8_85a9]
signal color3_MUX_uxn_c_l248_c8_85a9_cond : unsigned(0 downto 0);
signal color3_MUX_uxn_c_l248_c8_85a9_iftrue : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l248_c8_85a9_iffalse : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l248_c8_85a9_return_output : unsigned(11 downto 0);

-- CONST_SL_4[uxn_c_l250_c4_91b8]
signal CONST_SL_4_uxn_c_l250_c4_91b8_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_c_l250_c4_91b8_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l251_c4_1f66]
signal BIN_OP_AND_uxn_c_l251_c4_1f66_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l251_c4_1f66_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l251_c4_1f66_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l252_c4_97fd]
signal BIN_OP_OR_uxn_c_l252_c4_97fd_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l252_c4_97fd_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l252_c4_97fd_return_output : unsigned(11 downto 0);

-- CONST_SL_4[uxn_c_l255_c4_661f]
signal CONST_SL_4_uxn_c_l255_c4_661f_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_c_l255_c4_661f_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l256_c4_2ad1]
signal BIN_OP_AND_uxn_c_l256_c4_2ad1_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l256_c4_2ad1_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l256_c4_2ad1_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l257_c4_f361]
signal BIN_OP_OR_uxn_c_l257_c4_f361_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l257_c4_f361_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l257_c4_f361_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l259_c12_0b34]
signal BIN_OP_EQ_uxn_c_l259_c12_0b34_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l259_c12_0b34_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l259_c12_0b34_return_output : unsigned(0 downto 0);

-- color0_MUX[uxn_c_l259_c8_93aa]
signal color0_MUX_uxn_c_l259_c8_93aa_cond : unsigned(0 downto 0);
signal color0_MUX_uxn_c_l259_c8_93aa_iftrue : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l259_c8_93aa_iffalse : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l259_c8_93aa_return_output : unsigned(11 downto 0);

-- color1_MUX[uxn_c_l259_c8_93aa]
signal color1_MUX_uxn_c_l259_c8_93aa_cond : unsigned(0 downto 0);
signal color1_MUX_uxn_c_l259_c8_93aa_iftrue : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l259_c8_93aa_iffalse : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l259_c8_93aa_return_output : unsigned(11 downto 0);

-- color2_MUX[uxn_c_l259_c8_93aa]
signal color2_MUX_uxn_c_l259_c8_93aa_cond : unsigned(0 downto 0);
signal color2_MUX_uxn_c_l259_c8_93aa_iftrue : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l259_c8_93aa_iffalse : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l259_c8_93aa_return_output : unsigned(11 downto 0);

-- tmp12_MUX[uxn_c_l259_c8_93aa]
signal tmp12_MUX_uxn_c_l259_c8_93aa_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_c_l259_c8_93aa_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l259_c8_93aa_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l259_c8_93aa_return_output : unsigned(11 downto 0);

-- color3_MUX[uxn_c_l259_c8_93aa]
signal color3_MUX_uxn_c_l259_c8_93aa_cond : unsigned(0 downto 0);
signal color3_MUX_uxn_c_l259_c8_93aa_iftrue : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l259_c8_93aa_iffalse : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l259_c8_93aa_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l261_c4_cfac]
signal BIN_OP_AND_uxn_c_l261_c4_cfac_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l261_c4_cfac_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l261_c4_cfac_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l262_c4_84e0]
signal BIN_OP_OR_uxn_c_l262_c4_84e0_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l262_c4_84e0_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l262_c4_84e0_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l265_c4_c470]
signal BIN_OP_AND_uxn_c_l265_c4_c470_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l265_c4_c470_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l265_c4_c470_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l266_c4_e62e]
signal BIN_OP_OR_uxn_c_l266_c4_e62e_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l266_c4_e62e_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l266_c4_e62e_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l268_c12_4065]
signal BIN_OP_EQ_uxn_c_l268_c12_4065_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l268_c12_4065_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l268_c12_4065_return_output : unsigned(0 downto 0);

-- color2_MUX[uxn_c_l268_c8_4c88]
signal color2_MUX_uxn_c_l268_c8_4c88_cond : unsigned(0 downto 0);
signal color2_MUX_uxn_c_l268_c8_4c88_iftrue : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l268_c8_4c88_iffalse : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l268_c8_4c88_return_output : unsigned(11 downto 0);

-- tmp12_MUX[uxn_c_l268_c8_4c88]
signal tmp12_MUX_uxn_c_l268_c8_4c88_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_c_l268_c8_4c88_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l268_c8_4c88_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l268_c8_4c88_return_output : unsigned(11 downto 0);

-- color3_MUX[uxn_c_l268_c8_4c88]
signal color3_MUX_uxn_c_l268_c8_4c88_cond : unsigned(0 downto 0);
signal color3_MUX_uxn_c_l268_c8_4c88_iftrue : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l268_c8_4c88_iffalse : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l268_c8_4c88_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l270_c4_de7b]
signal BIN_OP_AND_uxn_c_l270_c4_de7b_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l270_c4_de7b_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l270_c4_de7b_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l271_c4_87f2]
signal BIN_OP_OR_uxn_c_l271_c4_87f2_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l271_c4_87f2_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l271_c4_87f2_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l274_c4_71e2]
signal BIN_OP_AND_uxn_c_l274_c4_71e2_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l274_c4_71e2_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l274_c4_71e2_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l275_c4_d954]
signal BIN_OP_OR_uxn_c_l275_c4_d954_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l275_c4_d954_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l275_c4_d954_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l279_c6_a7db]
signal BIN_OP_EQ_uxn_c_l279_c6_a7db_left : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l279_c6_a7db_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l279_c6_a7db_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_c_l279_c2_75e8]
signal result_MUX_uxn_c_l279_c2_75e8_cond : unsigned(0 downto 0);
signal result_MUX_uxn_c_l279_c2_75e8_iftrue : unsigned(15 downto 0);
signal result_MUX_uxn_c_l279_c2_75e8_iffalse : unsigned(15 downto 0);
signal result_MUX_uxn_c_l279_c2_75e8_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l281_c13_2e3f]
signal BIN_OP_EQ_uxn_c_l281_c13_2e3f_left : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l281_c13_2e3f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l281_c13_2e3f_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_c_l281_c9_1a03]
signal result_MUX_uxn_c_l281_c9_1a03_cond : unsigned(0 downto 0);
signal result_MUX_uxn_c_l281_c9_1a03_iftrue : unsigned(15 downto 0);
signal result_MUX_uxn_c_l281_c9_1a03_iffalse : unsigned(15 downto 0);
signal result_MUX_uxn_c_l281_c9_1a03_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l283_c13_4a69]
signal BIN_OP_EQ_uxn_c_l283_c13_4a69_left : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l283_c13_4a69_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l283_c13_4a69_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_c_l283_c9_b3aa]
signal result_MUX_uxn_c_l283_c9_b3aa_cond : unsigned(0 downto 0);
signal result_MUX_uxn_c_l283_c9_b3aa_iftrue : unsigned(15 downto 0);
signal result_MUX_uxn_c_l283_c9_b3aa_iffalse : unsigned(15 downto 0);
signal result_MUX_uxn_c_l283_c9_b3aa_return_output : unsigned(15 downto 0);

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
-- color0_MUX_uxn_c_l212_c2_d7ed
color0_MUX_uxn_c_l212_c2_d7ed : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color0_MUX_uxn_c_l212_c2_d7ed_cond,
color0_MUX_uxn_c_l212_c2_d7ed_iftrue,
color0_MUX_uxn_c_l212_c2_d7ed_iffalse,
color0_MUX_uxn_c_l212_c2_d7ed_return_output);

-- color_cmp_0_MUX_uxn_c_l212_c2_d7ed
color_cmp_0_MUX_uxn_c_l212_c2_d7ed : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_cmp_0_MUX_uxn_c_l212_c2_d7ed_cond,
color_cmp_0_MUX_uxn_c_l212_c2_d7ed_iftrue,
color_cmp_0_MUX_uxn_c_l212_c2_d7ed_iffalse,
color_cmp_0_MUX_uxn_c_l212_c2_d7ed_return_output);

-- color1_MUX_uxn_c_l212_c2_d7ed
color1_MUX_uxn_c_l212_c2_d7ed : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color1_MUX_uxn_c_l212_c2_d7ed_cond,
color1_MUX_uxn_c_l212_c2_d7ed_iftrue,
color1_MUX_uxn_c_l212_c2_d7ed_iffalse,
color1_MUX_uxn_c_l212_c2_d7ed_return_output);

-- color_cmp_1_MUX_uxn_c_l212_c2_d7ed
color_cmp_1_MUX_uxn_c_l212_c2_d7ed : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_cmp_1_MUX_uxn_c_l212_c2_d7ed_cond,
color_cmp_1_MUX_uxn_c_l212_c2_d7ed_iftrue,
color_cmp_1_MUX_uxn_c_l212_c2_d7ed_iffalse,
color_cmp_1_MUX_uxn_c_l212_c2_d7ed_return_output);

-- color2_MUX_uxn_c_l212_c2_d7ed
color2_MUX_uxn_c_l212_c2_d7ed : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color2_MUX_uxn_c_l212_c2_d7ed_cond,
color2_MUX_uxn_c_l212_c2_d7ed_iftrue,
color2_MUX_uxn_c_l212_c2_d7ed_iffalse,
color2_MUX_uxn_c_l212_c2_d7ed_return_output);

-- tmp12_MUX_uxn_c_l212_c2_d7ed
tmp12_MUX_uxn_c_l212_c2_d7ed : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_c_l212_c2_d7ed_cond,
tmp12_MUX_uxn_c_l212_c2_d7ed_iftrue,
tmp12_MUX_uxn_c_l212_c2_d7ed_iffalse,
tmp12_MUX_uxn_c_l212_c2_d7ed_return_output);

-- color3_MUX_uxn_c_l212_c2_d7ed
color3_MUX_uxn_c_l212_c2_d7ed : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color3_MUX_uxn_c_l212_c2_d7ed_cond,
color3_MUX_uxn_c_l212_c2_d7ed_iftrue,
color3_MUX_uxn_c_l212_c2_d7ed_iffalse,
color3_MUX_uxn_c_l212_c2_d7ed_return_output);

-- CONST_SR_4_uxn_c_l213_c27_c713
CONST_SR_4_uxn_c_l213_c27_c713 : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_c_l213_c27_c713_x,
CONST_SR_4_uxn_c_l213_c27_c713_return_output);

-- BIN_OP_EQ_uxn_c_l215_c7_03b4
BIN_OP_EQ_uxn_c_l215_c7_03b4 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l215_c7_03b4_left,
BIN_OP_EQ_uxn_c_l215_c7_03b4_right,
BIN_OP_EQ_uxn_c_l215_c7_03b4_return_output);

-- color0_MUX_uxn_c_l215_c3_2a42
color0_MUX_uxn_c_l215_c3_2a42 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color0_MUX_uxn_c_l215_c3_2a42_cond,
color0_MUX_uxn_c_l215_c3_2a42_iftrue,
color0_MUX_uxn_c_l215_c3_2a42_iffalse,
color0_MUX_uxn_c_l215_c3_2a42_return_output);

-- color1_MUX_uxn_c_l215_c3_2a42
color1_MUX_uxn_c_l215_c3_2a42 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color1_MUX_uxn_c_l215_c3_2a42_cond,
color1_MUX_uxn_c_l215_c3_2a42_iftrue,
color1_MUX_uxn_c_l215_c3_2a42_iffalse,
color1_MUX_uxn_c_l215_c3_2a42_return_output);

-- color2_MUX_uxn_c_l215_c3_2a42
color2_MUX_uxn_c_l215_c3_2a42 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color2_MUX_uxn_c_l215_c3_2a42_cond,
color2_MUX_uxn_c_l215_c3_2a42_iftrue,
color2_MUX_uxn_c_l215_c3_2a42_iffalse,
color2_MUX_uxn_c_l215_c3_2a42_return_output);

-- tmp12_MUX_uxn_c_l215_c3_2a42
tmp12_MUX_uxn_c_l215_c3_2a42 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_c_l215_c3_2a42_cond,
tmp12_MUX_uxn_c_l215_c3_2a42_iftrue,
tmp12_MUX_uxn_c_l215_c3_2a42_iffalse,
tmp12_MUX_uxn_c_l215_c3_2a42_return_output);

-- color3_MUX_uxn_c_l215_c3_2a42
color3_MUX_uxn_c_l215_c3_2a42 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color3_MUX_uxn_c_l215_c3_2a42_cond,
color3_MUX_uxn_c_l215_c3_2a42_iftrue,
color3_MUX_uxn_c_l215_c3_2a42_iffalse,
color3_MUX_uxn_c_l215_c3_2a42_return_output);

-- CONST_SL_8_uxn_c_l217_c4_9683
CONST_SL_8_uxn_c_l217_c4_9683 : entity work.CONST_SL_8_uint12_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l217_c4_9683_x,
CONST_SL_8_uxn_c_l217_c4_9683_return_output);

-- BIN_OP_AND_uxn_c_l218_c4_0940
BIN_OP_AND_uxn_c_l218_c4_0940 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l218_c4_0940_left,
BIN_OP_AND_uxn_c_l218_c4_0940_right,
BIN_OP_AND_uxn_c_l218_c4_0940_return_output);

-- BIN_OP_OR_uxn_c_l219_c4_9903
BIN_OP_OR_uxn_c_l219_c4_9903 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l219_c4_9903_left,
BIN_OP_OR_uxn_c_l219_c4_9903_right,
BIN_OP_OR_uxn_c_l219_c4_9903_return_output);

-- CONST_SL_8_uxn_c_l222_c4_0275
CONST_SL_8_uxn_c_l222_c4_0275 : entity work.CONST_SL_8_uint12_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l222_c4_0275_x,
CONST_SL_8_uxn_c_l222_c4_0275_return_output);

-- BIN_OP_AND_uxn_c_l223_c4_0213
BIN_OP_AND_uxn_c_l223_c4_0213 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l223_c4_0213_left,
BIN_OP_AND_uxn_c_l223_c4_0213_right,
BIN_OP_AND_uxn_c_l223_c4_0213_return_output);

-- BIN_OP_OR_uxn_c_l224_c4_65ff
BIN_OP_OR_uxn_c_l224_c4_65ff : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l224_c4_65ff_left,
BIN_OP_OR_uxn_c_l224_c4_65ff_right,
BIN_OP_OR_uxn_c_l224_c4_65ff_return_output);

-- BIN_OP_EQ_uxn_c_l226_c12_9f8a
BIN_OP_EQ_uxn_c_l226_c12_9f8a : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l226_c12_9f8a_left,
BIN_OP_EQ_uxn_c_l226_c12_9f8a_right,
BIN_OP_EQ_uxn_c_l226_c12_9f8a_return_output);

-- color0_MUX_uxn_c_l226_c8_cfb4
color0_MUX_uxn_c_l226_c8_cfb4 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color0_MUX_uxn_c_l226_c8_cfb4_cond,
color0_MUX_uxn_c_l226_c8_cfb4_iftrue,
color0_MUX_uxn_c_l226_c8_cfb4_iffalse,
color0_MUX_uxn_c_l226_c8_cfb4_return_output);

-- color1_MUX_uxn_c_l226_c8_cfb4
color1_MUX_uxn_c_l226_c8_cfb4 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color1_MUX_uxn_c_l226_c8_cfb4_cond,
color1_MUX_uxn_c_l226_c8_cfb4_iftrue,
color1_MUX_uxn_c_l226_c8_cfb4_iffalse,
color1_MUX_uxn_c_l226_c8_cfb4_return_output);

-- color2_MUX_uxn_c_l226_c8_cfb4
color2_MUX_uxn_c_l226_c8_cfb4 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color2_MUX_uxn_c_l226_c8_cfb4_cond,
color2_MUX_uxn_c_l226_c8_cfb4_iftrue,
color2_MUX_uxn_c_l226_c8_cfb4_iffalse,
color2_MUX_uxn_c_l226_c8_cfb4_return_output);

-- tmp12_MUX_uxn_c_l226_c8_cfb4
tmp12_MUX_uxn_c_l226_c8_cfb4 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_c_l226_c8_cfb4_cond,
tmp12_MUX_uxn_c_l226_c8_cfb4_iftrue,
tmp12_MUX_uxn_c_l226_c8_cfb4_iffalse,
tmp12_MUX_uxn_c_l226_c8_cfb4_return_output);

-- color3_MUX_uxn_c_l226_c8_cfb4
color3_MUX_uxn_c_l226_c8_cfb4 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color3_MUX_uxn_c_l226_c8_cfb4_cond,
color3_MUX_uxn_c_l226_c8_cfb4_iftrue,
color3_MUX_uxn_c_l226_c8_cfb4_iffalse,
color3_MUX_uxn_c_l226_c8_cfb4_return_output);

-- CONST_SL_8_uxn_c_l228_c4_b2d6
CONST_SL_8_uxn_c_l228_c4_b2d6 : entity work.CONST_SL_8_uint12_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l228_c4_b2d6_x,
CONST_SL_8_uxn_c_l228_c4_b2d6_return_output);

-- BIN_OP_AND_uxn_c_l229_c4_1e92
BIN_OP_AND_uxn_c_l229_c4_1e92 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l229_c4_1e92_left,
BIN_OP_AND_uxn_c_l229_c4_1e92_right,
BIN_OP_AND_uxn_c_l229_c4_1e92_return_output);

-- BIN_OP_OR_uxn_c_l230_c4_1552
BIN_OP_OR_uxn_c_l230_c4_1552 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l230_c4_1552_left,
BIN_OP_OR_uxn_c_l230_c4_1552_right,
BIN_OP_OR_uxn_c_l230_c4_1552_return_output);

-- CONST_SL_8_uxn_c_l233_c4_f33d
CONST_SL_8_uxn_c_l233_c4_f33d : entity work.CONST_SL_8_uint12_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l233_c4_f33d_x,
CONST_SL_8_uxn_c_l233_c4_f33d_return_output);

-- BIN_OP_AND_uxn_c_l234_c4_0726
BIN_OP_AND_uxn_c_l234_c4_0726 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l234_c4_0726_left,
BIN_OP_AND_uxn_c_l234_c4_0726_right,
BIN_OP_AND_uxn_c_l234_c4_0726_return_output);

-- BIN_OP_OR_uxn_c_l235_c4_1168
BIN_OP_OR_uxn_c_l235_c4_1168 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l235_c4_1168_left,
BIN_OP_OR_uxn_c_l235_c4_1168_right,
BIN_OP_OR_uxn_c_l235_c4_1168_return_output);

-- BIN_OP_EQ_uxn_c_l237_c12_1f37
BIN_OP_EQ_uxn_c_l237_c12_1f37 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l237_c12_1f37_left,
BIN_OP_EQ_uxn_c_l237_c12_1f37_right,
BIN_OP_EQ_uxn_c_l237_c12_1f37_return_output);

-- color0_MUX_uxn_c_l237_c8_7523
color0_MUX_uxn_c_l237_c8_7523 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color0_MUX_uxn_c_l237_c8_7523_cond,
color0_MUX_uxn_c_l237_c8_7523_iftrue,
color0_MUX_uxn_c_l237_c8_7523_iffalse,
color0_MUX_uxn_c_l237_c8_7523_return_output);

-- color1_MUX_uxn_c_l237_c8_7523
color1_MUX_uxn_c_l237_c8_7523 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color1_MUX_uxn_c_l237_c8_7523_cond,
color1_MUX_uxn_c_l237_c8_7523_iftrue,
color1_MUX_uxn_c_l237_c8_7523_iffalse,
color1_MUX_uxn_c_l237_c8_7523_return_output);

-- color2_MUX_uxn_c_l237_c8_7523
color2_MUX_uxn_c_l237_c8_7523 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color2_MUX_uxn_c_l237_c8_7523_cond,
color2_MUX_uxn_c_l237_c8_7523_iftrue,
color2_MUX_uxn_c_l237_c8_7523_iffalse,
color2_MUX_uxn_c_l237_c8_7523_return_output);

-- tmp12_MUX_uxn_c_l237_c8_7523
tmp12_MUX_uxn_c_l237_c8_7523 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_c_l237_c8_7523_cond,
tmp12_MUX_uxn_c_l237_c8_7523_iftrue,
tmp12_MUX_uxn_c_l237_c8_7523_iffalse,
tmp12_MUX_uxn_c_l237_c8_7523_return_output);

-- color3_MUX_uxn_c_l237_c8_7523
color3_MUX_uxn_c_l237_c8_7523 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color3_MUX_uxn_c_l237_c8_7523_cond,
color3_MUX_uxn_c_l237_c8_7523_iftrue,
color3_MUX_uxn_c_l237_c8_7523_iffalse,
color3_MUX_uxn_c_l237_c8_7523_return_output);

-- CONST_SL_4_uxn_c_l239_c4_d5d6
CONST_SL_4_uxn_c_l239_c4_d5d6 : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_c_l239_c4_d5d6_x,
CONST_SL_4_uxn_c_l239_c4_d5d6_return_output);

-- BIN_OP_AND_uxn_c_l240_c4_f1e8
BIN_OP_AND_uxn_c_l240_c4_f1e8 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l240_c4_f1e8_left,
BIN_OP_AND_uxn_c_l240_c4_f1e8_right,
BIN_OP_AND_uxn_c_l240_c4_f1e8_return_output);

-- BIN_OP_OR_uxn_c_l241_c4_3a79
BIN_OP_OR_uxn_c_l241_c4_3a79 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l241_c4_3a79_left,
BIN_OP_OR_uxn_c_l241_c4_3a79_right,
BIN_OP_OR_uxn_c_l241_c4_3a79_return_output);

-- CONST_SL_4_uxn_c_l244_c4_0740
CONST_SL_4_uxn_c_l244_c4_0740 : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_c_l244_c4_0740_x,
CONST_SL_4_uxn_c_l244_c4_0740_return_output);

-- BIN_OP_AND_uxn_c_l245_c4_89c6
BIN_OP_AND_uxn_c_l245_c4_89c6 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l245_c4_89c6_left,
BIN_OP_AND_uxn_c_l245_c4_89c6_right,
BIN_OP_AND_uxn_c_l245_c4_89c6_return_output);

-- BIN_OP_OR_uxn_c_l246_c4_bd0e
BIN_OP_OR_uxn_c_l246_c4_bd0e : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l246_c4_bd0e_left,
BIN_OP_OR_uxn_c_l246_c4_bd0e_right,
BIN_OP_OR_uxn_c_l246_c4_bd0e_return_output);

-- BIN_OP_EQ_uxn_c_l248_c12_5ade
BIN_OP_EQ_uxn_c_l248_c12_5ade : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l248_c12_5ade_left,
BIN_OP_EQ_uxn_c_l248_c12_5ade_right,
BIN_OP_EQ_uxn_c_l248_c12_5ade_return_output);

-- color0_MUX_uxn_c_l248_c8_85a9
color0_MUX_uxn_c_l248_c8_85a9 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color0_MUX_uxn_c_l248_c8_85a9_cond,
color0_MUX_uxn_c_l248_c8_85a9_iftrue,
color0_MUX_uxn_c_l248_c8_85a9_iffalse,
color0_MUX_uxn_c_l248_c8_85a9_return_output);

-- color1_MUX_uxn_c_l248_c8_85a9
color1_MUX_uxn_c_l248_c8_85a9 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color1_MUX_uxn_c_l248_c8_85a9_cond,
color1_MUX_uxn_c_l248_c8_85a9_iftrue,
color1_MUX_uxn_c_l248_c8_85a9_iffalse,
color1_MUX_uxn_c_l248_c8_85a9_return_output);

-- color2_MUX_uxn_c_l248_c8_85a9
color2_MUX_uxn_c_l248_c8_85a9 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color2_MUX_uxn_c_l248_c8_85a9_cond,
color2_MUX_uxn_c_l248_c8_85a9_iftrue,
color2_MUX_uxn_c_l248_c8_85a9_iffalse,
color2_MUX_uxn_c_l248_c8_85a9_return_output);

-- tmp12_MUX_uxn_c_l248_c8_85a9
tmp12_MUX_uxn_c_l248_c8_85a9 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_c_l248_c8_85a9_cond,
tmp12_MUX_uxn_c_l248_c8_85a9_iftrue,
tmp12_MUX_uxn_c_l248_c8_85a9_iffalse,
tmp12_MUX_uxn_c_l248_c8_85a9_return_output);

-- color3_MUX_uxn_c_l248_c8_85a9
color3_MUX_uxn_c_l248_c8_85a9 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color3_MUX_uxn_c_l248_c8_85a9_cond,
color3_MUX_uxn_c_l248_c8_85a9_iftrue,
color3_MUX_uxn_c_l248_c8_85a9_iffalse,
color3_MUX_uxn_c_l248_c8_85a9_return_output);

-- CONST_SL_4_uxn_c_l250_c4_91b8
CONST_SL_4_uxn_c_l250_c4_91b8 : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_c_l250_c4_91b8_x,
CONST_SL_4_uxn_c_l250_c4_91b8_return_output);

-- BIN_OP_AND_uxn_c_l251_c4_1f66
BIN_OP_AND_uxn_c_l251_c4_1f66 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l251_c4_1f66_left,
BIN_OP_AND_uxn_c_l251_c4_1f66_right,
BIN_OP_AND_uxn_c_l251_c4_1f66_return_output);

-- BIN_OP_OR_uxn_c_l252_c4_97fd
BIN_OP_OR_uxn_c_l252_c4_97fd : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l252_c4_97fd_left,
BIN_OP_OR_uxn_c_l252_c4_97fd_right,
BIN_OP_OR_uxn_c_l252_c4_97fd_return_output);

-- CONST_SL_4_uxn_c_l255_c4_661f
CONST_SL_4_uxn_c_l255_c4_661f : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_c_l255_c4_661f_x,
CONST_SL_4_uxn_c_l255_c4_661f_return_output);

-- BIN_OP_AND_uxn_c_l256_c4_2ad1
BIN_OP_AND_uxn_c_l256_c4_2ad1 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l256_c4_2ad1_left,
BIN_OP_AND_uxn_c_l256_c4_2ad1_right,
BIN_OP_AND_uxn_c_l256_c4_2ad1_return_output);

-- BIN_OP_OR_uxn_c_l257_c4_f361
BIN_OP_OR_uxn_c_l257_c4_f361 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l257_c4_f361_left,
BIN_OP_OR_uxn_c_l257_c4_f361_right,
BIN_OP_OR_uxn_c_l257_c4_f361_return_output);

-- BIN_OP_EQ_uxn_c_l259_c12_0b34
BIN_OP_EQ_uxn_c_l259_c12_0b34 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l259_c12_0b34_left,
BIN_OP_EQ_uxn_c_l259_c12_0b34_right,
BIN_OP_EQ_uxn_c_l259_c12_0b34_return_output);

-- color0_MUX_uxn_c_l259_c8_93aa
color0_MUX_uxn_c_l259_c8_93aa : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color0_MUX_uxn_c_l259_c8_93aa_cond,
color0_MUX_uxn_c_l259_c8_93aa_iftrue,
color0_MUX_uxn_c_l259_c8_93aa_iffalse,
color0_MUX_uxn_c_l259_c8_93aa_return_output);

-- color1_MUX_uxn_c_l259_c8_93aa
color1_MUX_uxn_c_l259_c8_93aa : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color1_MUX_uxn_c_l259_c8_93aa_cond,
color1_MUX_uxn_c_l259_c8_93aa_iftrue,
color1_MUX_uxn_c_l259_c8_93aa_iffalse,
color1_MUX_uxn_c_l259_c8_93aa_return_output);

-- color2_MUX_uxn_c_l259_c8_93aa
color2_MUX_uxn_c_l259_c8_93aa : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color2_MUX_uxn_c_l259_c8_93aa_cond,
color2_MUX_uxn_c_l259_c8_93aa_iftrue,
color2_MUX_uxn_c_l259_c8_93aa_iffalse,
color2_MUX_uxn_c_l259_c8_93aa_return_output);

-- tmp12_MUX_uxn_c_l259_c8_93aa
tmp12_MUX_uxn_c_l259_c8_93aa : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_c_l259_c8_93aa_cond,
tmp12_MUX_uxn_c_l259_c8_93aa_iftrue,
tmp12_MUX_uxn_c_l259_c8_93aa_iffalse,
tmp12_MUX_uxn_c_l259_c8_93aa_return_output);

-- color3_MUX_uxn_c_l259_c8_93aa
color3_MUX_uxn_c_l259_c8_93aa : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color3_MUX_uxn_c_l259_c8_93aa_cond,
color3_MUX_uxn_c_l259_c8_93aa_iftrue,
color3_MUX_uxn_c_l259_c8_93aa_iffalse,
color3_MUX_uxn_c_l259_c8_93aa_return_output);

-- BIN_OP_AND_uxn_c_l261_c4_cfac
BIN_OP_AND_uxn_c_l261_c4_cfac : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l261_c4_cfac_left,
BIN_OP_AND_uxn_c_l261_c4_cfac_right,
BIN_OP_AND_uxn_c_l261_c4_cfac_return_output);

-- BIN_OP_OR_uxn_c_l262_c4_84e0
BIN_OP_OR_uxn_c_l262_c4_84e0 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l262_c4_84e0_left,
BIN_OP_OR_uxn_c_l262_c4_84e0_right,
BIN_OP_OR_uxn_c_l262_c4_84e0_return_output);

-- BIN_OP_AND_uxn_c_l265_c4_c470
BIN_OP_AND_uxn_c_l265_c4_c470 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l265_c4_c470_left,
BIN_OP_AND_uxn_c_l265_c4_c470_right,
BIN_OP_AND_uxn_c_l265_c4_c470_return_output);

-- BIN_OP_OR_uxn_c_l266_c4_e62e
BIN_OP_OR_uxn_c_l266_c4_e62e : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l266_c4_e62e_left,
BIN_OP_OR_uxn_c_l266_c4_e62e_right,
BIN_OP_OR_uxn_c_l266_c4_e62e_return_output);

-- BIN_OP_EQ_uxn_c_l268_c12_4065
BIN_OP_EQ_uxn_c_l268_c12_4065 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l268_c12_4065_left,
BIN_OP_EQ_uxn_c_l268_c12_4065_right,
BIN_OP_EQ_uxn_c_l268_c12_4065_return_output);

-- color2_MUX_uxn_c_l268_c8_4c88
color2_MUX_uxn_c_l268_c8_4c88 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color2_MUX_uxn_c_l268_c8_4c88_cond,
color2_MUX_uxn_c_l268_c8_4c88_iftrue,
color2_MUX_uxn_c_l268_c8_4c88_iffalse,
color2_MUX_uxn_c_l268_c8_4c88_return_output);

-- tmp12_MUX_uxn_c_l268_c8_4c88
tmp12_MUX_uxn_c_l268_c8_4c88 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_c_l268_c8_4c88_cond,
tmp12_MUX_uxn_c_l268_c8_4c88_iftrue,
tmp12_MUX_uxn_c_l268_c8_4c88_iffalse,
tmp12_MUX_uxn_c_l268_c8_4c88_return_output);

-- color3_MUX_uxn_c_l268_c8_4c88
color3_MUX_uxn_c_l268_c8_4c88 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color3_MUX_uxn_c_l268_c8_4c88_cond,
color3_MUX_uxn_c_l268_c8_4c88_iftrue,
color3_MUX_uxn_c_l268_c8_4c88_iffalse,
color3_MUX_uxn_c_l268_c8_4c88_return_output);

-- BIN_OP_AND_uxn_c_l270_c4_de7b
BIN_OP_AND_uxn_c_l270_c4_de7b : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l270_c4_de7b_left,
BIN_OP_AND_uxn_c_l270_c4_de7b_right,
BIN_OP_AND_uxn_c_l270_c4_de7b_return_output);

-- BIN_OP_OR_uxn_c_l271_c4_87f2
BIN_OP_OR_uxn_c_l271_c4_87f2 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l271_c4_87f2_left,
BIN_OP_OR_uxn_c_l271_c4_87f2_right,
BIN_OP_OR_uxn_c_l271_c4_87f2_return_output);

-- BIN_OP_AND_uxn_c_l274_c4_71e2
BIN_OP_AND_uxn_c_l274_c4_71e2 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l274_c4_71e2_left,
BIN_OP_AND_uxn_c_l274_c4_71e2_right,
BIN_OP_AND_uxn_c_l274_c4_71e2_return_output);

-- BIN_OP_OR_uxn_c_l275_c4_d954
BIN_OP_OR_uxn_c_l275_c4_d954 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l275_c4_d954_left,
BIN_OP_OR_uxn_c_l275_c4_d954_right,
BIN_OP_OR_uxn_c_l275_c4_d954_return_output);

-- BIN_OP_EQ_uxn_c_l279_c6_a7db
BIN_OP_EQ_uxn_c_l279_c6_a7db : entity work.BIN_OP_EQ_uint2_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l279_c6_a7db_left,
BIN_OP_EQ_uxn_c_l279_c6_a7db_right,
BIN_OP_EQ_uxn_c_l279_c6_a7db_return_output);

-- result_MUX_uxn_c_l279_c2_75e8
result_MUX_uxn_c_l279_c2_75e8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_MUX_uxn_c_l279_c2_75e8_cond,
result_MUX_uxn_c_l279_c2_75e8_iftrue,
result_MUX_uxn_c_l279_c2_75e8_iffalse,
result_MUX_uxn_c_l279_c2_75e8_return_output);

-- BIN_OP_EQ_uxn_c_l281_c13_2e3f
BIN_OP_EQ_uxn_c_l281_c13_2e3f : entity work.BIN_OP_EQ_uint2_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l281_c13_2e3f_left,
BIN_OP_EQ_uxn_c_l281_c13_2e3f_right,
BIN_OP_EQ_uxn_c_l281_c13_2e3f_return_output);

-- result_MUX_uxn_c_l281_c9_1a03
result_MUX_uxn_c_l281_c9_1a03 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_MUX_uxn_c_l281_c9_1a03_cond,
result_MUX_uxn_c_l281_c9_1a03_iftrue,
result_MUX_uxn_c_l281_c9_1a03_iffalse,
result_MUX_uxn_c_l281_c9_1a03_return_output);

-- BIN_OP_EQ_uxn_c_l283_c13_4a69
BIN_OP_EQ_uxn_c_l283_c13_4a69 : entity work.BIN_OP_EQ_uint2_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l283_c13_4a69_left,
BIN_OP_EQ_uxn_c_l283_c13_4a69_right,
BIN_OP_EQ_uxn_c_l283_c13_4a69_return_output);

-- result_MUX_uxn_c_l283_c9_b3aa
result_MUX_uxn_c_l283_c9_b3aa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_MUX_uxn_c_l283_c9_b3aa_cond,
result_MUX_uxn_c_l283_c9_b3aa_iftrue,
result_MUX_uxn_c_l283_c9_b3aa_iffalse,
result_MUX_uxn_c_l283_c9_b3aa_return_output);



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
 color0_MUX_uxn_c_l212_c2_d7ed_return_output,
 color_cmp_0_MUX_uxn_c_l212_c2_d7ed_return_output,
 color1_MUX_uxn_c_l212_c2_d7ed_return_output,
 color_cmp_1_MUX_uxn_c_l212_c2_d7ed_return_output,
 color2_MUX_uxn_c_l212_c2_d7ed_return_output,
 tmp12_MUX_uxn_c_l212_c2_d7ed_return_output,
 color3_MUX_uxn_c_l212_c2_d7ed_return_output,
 CONST_SR_4_uxn_c_l213_c27_c713_return_output,
 BIN_OP_EQ_uxn_c_l215_c7_03b4_return_output,
 color0_MUX_uxn_c_l215_c3_2a42_return_output,
 color1_MUX_uxn_c_l215_c3_2a42_return_output,
 color2_MUX_uxn_c_l215_c3_2a42_return_output,
 tmp12_MUX_uxn_c_l215_c3_2a42_return_output,
 color3_MUX_uxn_c_l215_c3_2a42_return_output,
 CONST_SL_8_uxn_c_l217_c4_9683_return_output,
 BIN_OP_AND_uxn_c_l218_c4_0940_return_output,
 BIN_OP_OR_uxn_c_l219_c4_9903_return_output,
 CONST_SL_8_uxn_c_l222_c4_0275_return_output,
 BIN_OP_AND_uxn_c_l223_c4_0213_return_output,
 BIN_OP_OR_uxn_c_l224_c4_65ff_return_output,
 BIN_OP_EQ_uxn_c_l226_c12_9f8a_return_output,
 color0_MUX_uxn_c_l226_c8_cfb4_return_output,
 color1_MUX_uxn_c_l226_c8_cfb4_return_output,
 color2_MUX_uxn_c_l226_c8_cfb4_return_output,
 tmp12_MUX_uxn_c_l226_c8_cfb4_return_output,
 color3_MUX_uxn_c_l226_c8_cfb4_return_output,
 CONST_SL_8_uxn_c_l228_c4_b2d6_return_output,
 BIN_OP_AND_uxn_c_l229_c4_1e92_return_output,
 BIN_OP_OR_uxn_c_l230_c4_1552_return_output,
 CONST_SL_8_uxn_c_l233_c4_f33d_return_output,
 BIN_OP_AND_uxn_c_l234_c4_0726_return_output,
 BIN_OP_OR_uxn_c_l235_c4_1168_return_output,
 BIN_OP_EQ_uxn_c_l237_c12_1f37_return_output,
 color0_MUX_uxn_c_l237_c8_7523_return_output,
 color1_MUX_uxn_c_l237_c8_7523_return_output,
 color2_MUX_uxn_c_l237_c8_7523_return_output,
 tmp12_MUX_uxn_c_l237_c8_7523_return_output,
 color3_MUX_uxn_c_l237_c8_7523_return_output,
 CONST_SL_4_uxn_c_l239_c4_d5d6_return_output,
 BIN_OP_AND_uxn_c_l240_c4_f1e8_return_output,
 BIN_OP_OR_uxn_c_l241_c4_3a79_return_output,
 CONST_SL_4_uxn_c_l244_c4_0740_return_output,
 BIN_OP_AND_uxn_c_l245_c4_89c6_return_output,
 BIN_OP_OR_uxn_c_l246_c4_bd0e_return_output,
 BIN_OP_EQ_uxn_c_l248_c12_5ade_return_output,
 color0_MUX_uxn_c_l248_c8_85a9_return_output,
 color1_MUX_uxn_c_l248_c8_85a9_return_output,
 color2_MUX_uxn_c_l248_c8_85a9_return_output,
 tmp12_MUX_uxn_c_l248_c8_85a9_return_output,
 color3_MUX_uxn_c_l248_c8_85a9_return_output,
 CONST_SL_4_uxn_c_l250_c4_91b8_return_output,
 BIN_OP_AND_uxn_c_l251_c4_1f66_return_output,
 BIN_OP_OR_uxn_c_l252_c4_97fd_return_output,
 CONST_SL_4_uxn_c_l255_c4_661f_return_output,
 BIN_OP_AND_uxn_c_l256_c4_2ad1_return_output,
 BIN_OP_OR_uxn_c_l257_c4_f361_return_output,
 BIN_OP_EQ_uxn_c_l259_c12_0b34_return_output,
 color0_MUX_uxn_c_l259_c8_93aa_return_output,
 color1_MUX_uxn_c_l259_c8_93aa_return_output,
 color2_MUX_uxn_c_l259_c8_93aa_return_output,
 tmp12_MUX_uxn_c_l259_c8_93aa_return_output,
 color3_MUX_uxn_c_l259_c8_93aa_return_output,
 BIN_OP_AND_uxn_c_l261_c4_cfac_return_output,
 BIN_OP_OR_uxn_c_l262_c4_84e0_return_output,
 BIN_OP_AND_uxn_c_l265_c4_c470_return_output,
 BIN_OP_OR_uxn_c_l266_c4_e62e_return_output,
 BIN_OP_EQ_uxn_c_l268_c12_4065_return_output,
 color2_MUX_uxn_c_l268_c8_4c88_return_output,
 tmp12_MUX_uxn_c_l268_c8_4c88_return_output,
 color3_MUX_uxn_c_l268_c8_4c88_return_output,
 BIN_OP_AND_uxn_c_l270_c4_de7b_return_output,
 BIN_OP_OR_uxn_c_l271_c4_87f2_return_output,
 BIN_OP_AND_uxn_c_l274_c4_71e2_return_output,
 BIN_OP_OR_uxn_c_l275_c4_d954_return_output,
 BIN_OP_EQ_uxn_c_l279_c6_a7db_return_output,
 result_MUX_uxn_c_l279_c2_75e8_return_output,
 BIN_OP_EQ_uxn_c_l281_c13_2e3f_return_output,
 result_MUX_uxn_c_l281_c9_1a03_return_output,
 BIN_OP_EQ_uxn_c_l283_c13_4a69_return_output,
 result_MUX_uxn_c_l283_c9_b3aa_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_device_ram_address : unsigned(7 downto 0);
 variable VAR_device_ram_value : unsigned(7 downto 0);
 variable VAR_is_device_ram_write : unsigned(0 downto 0);
 variable VAR_gpu_step_color : unsigned(1 downto 0);
 variable VAR_color0_MUX_uxn_c_l212_c2_d7ed_iftrue : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l215_c3_2a42_return_output : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l212_c2_d7ed_iffalse : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l212_c2_d7ed_return_output : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l212_c2_d7ed_cond : unsigned(0 downto 0);
 variable VAR_color_cmp_0_MUX_uxn_c_l212_c2_d7ed_iftrue : unsigned(3 downto 0);
 variable VAR_color_cmp_0_uxn_c_l213_c3_d593 : unsigned(3 downto 0);
 variable VAR_color_cmp_0_MUX_uxn_c_l212_c2_d7ed_iffalse : unsigned(3 downto 0);
 variable VAR_color_cmp_0_MUX_uxn_c_l212_c2_d7ed_return_output : unsigned(3 downto 0);
 variable VAR_color_cmp_0_MUX_uxn_c_l212_c2_d7ed_cond : unsigned(0 downto 0);
 variable VAR_color1_MUX_uxn_c_l212_c2_d7ed_iftrue : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l215_c3_2a42_return_output : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l212_c2_d7ed_iffalse : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l212_c2_d7ed_return_output : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l212_c2_d7ed_cond : unsigned(0 downto 0);
 variable VAR_color_cmp_1_MUX_uxn_c_l212_c2_d7ed_iftrue : unsigned(3 downto 0);
 variable VAR_color_cmp_1_uxn_c_l214_c3_16a4 : unsigned(3 downto 0);
 variable VAR_color_cmp_1_MUX_uxn_c_l212_c2_d7ed_iffalse : unsigned(3 downto 0);
 variable VAR_color_cmp_1_MUX_uxn_c_l212_c2_d7ed_return_output : unsigned(3 downto 0);
 variable VAR_color_cmp_1_MUX_uxn_c_l212_c2_d7ed_cond : unsigned(0 downto 0);
 variable VAR_color2_MUX_uxn_c_l212_c2_d7ed_iftrue : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l215_c3_2a42_return_output : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l212_c2_d7ed_iffalse : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l212_c2_d7ed_return_output : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l212_c2_d7ed_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l212_c2_d7ed_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l215_c3_2a42_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l212_c2_d7ed_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l212_c2_d7ed_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l212_c2_d7ed_cond : unsigned(0 downto 0);
 variable VAR_color3_MUX_uxn_c_l212_c2_d7ed_iftrue : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l215_c3_2a42_return_output : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l212_c2_d7ed_iffalse : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l212_c2_d7ed_return_output : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l212_c2_d7ed_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_4_uxn_c_l213_c27_c713_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_c_l213_c27_c713_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_c_l213_c17_5051_return_output : unsigned(3 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_c_l214_c17_4875_return_output : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l215_c7_03b4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l215_c7_03b4_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l215_c7_03b4_return_output : unsigned(0 downto 0);
 variable VAR_color0_MUX_uxn_c_l215_c3_2a42_iftrue : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l215_c3_2a42_iffalse : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l226_c8_cfb4_return_output : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l215_c3_2a42_cond : unsigned(0 downto 0);
 variable VAR_color1_MUX_uxn_c_l215_c3_2a42_iftrue : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l215_c3_2a42_iffalse : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l226_c8_cfb4_return_output : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l215_c3_2a42_cond : unsigned(0 downto 0);
 variable VAR_color2_MUX_uxn_c_l215_c3_2a42_iftrue : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l215_c3_2a42_iffalse : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l226_c8_cfb4_return_output : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l215_c3_2a42_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l215_c3_2a42_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l215_c3_2a42_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l226_c8_cfb4_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l215_c3_2a42_cond : unsigned(0 downto 0);
 variable VAR_color3_MUX_uxn_c_l215_c3_2a42_iftrue : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l215_c3_2a42_iffalse : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l226_c8_cfb4_return_output : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l215_c3_2a42_cond : unsigned(0 downto 0);
 variable VAR_tmp12_uxn_c_l216_c4_eb8b : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l217_c4_9683_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l217_c4_9683_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l218_c4_0940_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l218_c4_0940_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l218_c4_0940_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l219_c4_9903_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l219_c4_9903_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l219_c4_9903_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_uxn_c_l221_c4_b4c2 : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l222_c4_0275_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l222_c4_0275_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l223_c4_0213_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l223_c4_0213_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l223_c4_0213_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l224_c4_65ff_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l224_c4_65ff_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l224_c4_65ff_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l226_c12_9f8a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l226_c12_9f8a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l226_c12_9f8a_return_output : unsigned(0 downto 0);
 variable VAR_color0_MUX_uxn_c_l226_c8_cfb4_iftrue : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l226_c8_cfb4_iffalse : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l237_c8_7523_return_output : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l226_c8_cfb4_cond : unsigned(0 downto 0);
 variable VAR_color1_MUX_uxn_c_l226_c8_cfb4_iftrue : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l226_c8_cfb4_iffalse : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l237_c8_7523_return_output : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l226_c8_cfb4_cond : unsigned(0 downto 0);
 variable VAR_color2_MUX_uxn_c_l226_c8_cfb4_iftrue : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l226_c8_cfb4_iffalse : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l237_c8_7523_return_output : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l226_c8_cfb4_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l226_c8_cfb4_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l226_c8_cfb4_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l237_c8_7523_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l226_c8_cfb4_cond : unsigned(0 downto 0);
 variable VAR_color3_MUX_uxn_c_l226_c8_cfb4_iftrue : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l226_c8_cfb4_iffalse : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l237_c8_7523_return_output : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l226_c8_cfb4_cond : unsigned(0 downto 0);
 variable VAR_tmp12_uxn_c_l227_c4_6ff5 : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l228_c4_b2d6_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l228_c4_b2d6_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l229_c4_1e92_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l229_c4_1e92_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l229_c4_1e92_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l230_c4_1552_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l230_c4_1552_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l230_c4_1552_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_uxn_c_l232_c4_54ae : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l233_c4_f33d_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l233_c4_f33d_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l234_c4_0726_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l234_c4_0726_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l234_c4_0726_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l235_c4_1168_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l235_c4_1168_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l235_c4_1168_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l237_c12_1f37_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l237_c12_1f37_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l237_c12_1f37_return_output : unsigned(0 downto 0);
 variable VAR_color0_MUX_uxn_c_l237_c8_7523_iftrue : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l237_c8_7523_iffalse : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l248_c8_85a9_return_output : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l237_c8_7523_cond : unsigned(0 downto 0);
 variable VAR_color1_MUX_uxn_c_l237_c8_7523_iftrue : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l237_c8_7523_iffalse : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l248_c8_85a9_return_output : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l237_c8_7523_cond : unsigned(0 downto 0);
 variable VAR_color2_MUX_uxn_c_l237_c8_7523_iftrue : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l237_c8_7523_iffalse : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l248_c8_85a9_return_output : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l237_c8_7523_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l237_c8_7523_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l237_c8_7523_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l248_c8_85a9_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l237_c8_7523_cond : unsigned(0 downto 0);
 variable VAR_color3_MUX_uxn_c_l237_c8_7523_iftrue : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l237_c8_7523_iffalse : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l248_c8_85a9_return_output : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l237_c8_7523_cond : unsigned(0 downto 0);
 variable VAR_tmp12_uxn_c_l238_c4_b48a : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l239_c4_d5d6_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l239_c4_d5d6_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l240_c4_f1e8_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l240_c4_f1e8_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l240_c4_f1e8_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l241_c4_3a79_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l241_c4_3a79_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l241_c4_3a79_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_uxn_c_l243_c4_8f22 : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l244_c4_0740_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l244_c4_0740_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l245_c4_89c6_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l245_c4_89c6_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l245_c4_89c6_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l246_c4_bd0e_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l246_c4_bd0e_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l246_c4_bd0e_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l248_c12_5ade_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l248_c12_5ade_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l248_c12_5ade_return_output : unsigned(0 downto 0);
 variable VAR_color0_MUX_uxn_c_l248_c8_85a9_iftrue : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l248_c8_85a9_iffalse : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l259_c8_93aa_return_output : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l248_c8_85a9_cond : unsigned(0 downto 0);
 variable VAR_color1_MUX_uxn_c_l248_c8_85a9_iftrue : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l248_c8_85a9_iffalse : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l259_c8_93aa_return_output : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l248_c8_85a9_cond : unsigned(0 downto 0);
 variable VAR_color2_MUX_uxn_c_l248_c8_85a9_iftrue : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l248_c8_85a9_iffalse : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l259_c8_93aa_return_output : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l248_c8_85a9_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l248_c8_85a9_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l248_c8_85a9_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l259_c8_93aa_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l248_c8_85a9_cond : unsigned(0 downto 0);
 variable VAR_color3_MUX_uxn_c_l248_c8_85a9_iftrue : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l248_c8_85a9_iffalse : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l259_c8_93aa_return_output : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l248_c8_85a9_cond : unsigned(0 downto 0);
 variable VAR_tmp12_uxn_c_l249_c4_1c0f : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l250_c4_91b8_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l250_c4_91b8_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l251_c4_1f66_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l251_c4_1f66_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l251_c4_1f66_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l252_c4_97fd_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l252_c4_97fd_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l252_c4_97fd_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_uxn_c_l254_c4_9843 : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l255_c4_661f_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l255_c4_661f_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l256_c4_2ad1_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l256_c4_2ad1_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l256_c4_2ad1_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l257_c4_f361_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l257_c4_f361_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l257_c4_f361_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l259_c12_0b34_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l259_c12_0b34_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l259_c12_0b34_return_output : unsigned(0 downto 0);
 variable VAR_color0_MUX_uxn_c_l259_c8_93aa_iftrue : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l259_c8_93aa_iffalse : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l259_c8_93aa_cond : unsigned(0 downto 0);
 variable VAR_color1_MUX_uxn_c_l259_c8_93aa_iftrue : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l259_c8_93aa_iffalse : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l259_c8_93aa_cond : unsigned(0 downto 0);
 variable VAR_color2_MUX_uxn_c_l259_c8_93aa_iftrue : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l259_c8_93aa_iffalse : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l268_c8_4c88_return_output : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l259_c8_93aa_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l259_c8_93aa_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l259_c8_93aa_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l268_c8_4c88_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l259_c8_93aa_cond : unsigned(0 downto 0);
 variable VAR_color3_MUX_uxn_c_l259_c8_93aa_iftrue : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l259_c8_93aa_iffalse : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l268_c8_4c88_return_output : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l259_c8_93aa_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l261_c4_cfac_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l261_c4_cfac_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l261_c4_cfac_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l262_c4_84e0_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l262_c4_84e0_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l262_c4_84e0_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l265_c4_c470_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l265_c4_c470_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l265_c4_c470_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l266_c4_e62e_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l266_c4_e62e_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l266_c4_e62e_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l268_c12_4065_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l268_c12_4065_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l268_c12_4065_return_output : unsigned(0 downto 0);
 variable VAR_color2_MUX_uxn_c_l268_c8_4c88_iftrue : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l268_c8_4c88_iffalse : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l268_c8_4c88_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l268_c8_4c88_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l268_c8_4c88_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l268_c8_4c88_cond : unsigned(0 downto 0);
 variable VAR_color3_MUX_uxn_c_l268_c8_4c88_iftrue : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l268_c8_4c88_iffalse : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l268_c8_4c88_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l270_c4_de7b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l270_c4_de7b_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l270_c4_de7b_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l271_c4_87f2_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l271_c4_87f2_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l271_c4_87f2_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l274_c4_71e2_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l274_c4_71e2_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l274_c4_71e2_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l275_c4_d954_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l275_c4_d954_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l275_c4_d954_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l279_c6_a7db_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l279_c6_a7db_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l279_c6_a7db_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_c_l279_c2_75e8_iftrue : unsigned(15 downto 0);
 variable VAR_result_uxn_c_l280_c3_8294 : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l279_c2_75e8_iffalse : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l281_c9_1a03_return_output : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l279_c2_75e8_return_output : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l279_c2_75e8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l281_c13_2e3f_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l281_c13_2e3f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l281_c13_2e3f_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_c_l281_c9_1a03_iftrue : unsigned(15 downto 0);
 variable VAR_result_uxn_c_l282_c3_0d44 : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l281_c9_1a03_iffalse : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l283_c9_b3aa_return_output : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l281_c9_1a03_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l283_c13_4a69_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l283_c13_4a69_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l283_c13_4a69_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_c_l283_c9_b3aa_iftrue : unsigned(15 downto 0);
 variable VAR_result_uxn_c_l284_c3_2243 : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l283_c9_b3aa_iffalse : unsigned(15 downto 0);
 variable VAR_result_uxn_c_l286_c3_0ec0 : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l283_c9_b3aa_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l260_l269_DUPLICATE_d031_return_output : unsigned(11 downto 0);
 variable VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l264_l273_DUPLICATE_84ee_return_output : unsigned(11 downto 0);
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
     VAR_BIN_OP_AND_uxn_c_l251_c4_1f66_right := to_unsigned(3855, 12);
     VAR_BIN_OP_AND_uxn_c_l234_c4_0726_right := to_unsigned(255, 12);
     VAR_BIN_OP_AND_uxn_c_l240_c4_f1e8_right := to_unsigned(3855, 12);
     VAR_BIN_OP_EQ_uxn_c_l281_c13_2e3f_right := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_c_l229_c4_1e92_right := to_unsigned(255, 12);
     VAR_BIN_OP_EQ_uxn_c_l279_c6_a7db_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l268_c12_4065_right := to_unsigned(13, 8);
     VAR_BIN_OP_AND_uxn_c_l218_c4_0940_right := to_unsigned(255, 12);
     VAR_BIN_OP_EQ_uxn_c_l237_c12_1f37_right := to_unsigned(10, 8);
     VAR_BIN_OP_AND_uxn_c_l245_c4_89c6_right := to_unsigned(3855, 12);
     VAR_BIN_OP_EQ_uxn_c_l283_c13_4a69_right := to_unsigned(2, 2);
     VAR_BIN_OP_AND_uxn_c_l261_c4_cfac_right := to_unsigned(4080, 12);
     VAR_BIN_OP_AND_uxn_c_l265_c4_c470_right := to_unsigned(4080, 12);
     VAR_BIN_OP_EQ_uxn_c_l259_c12_0b34_right := to_unsigned(12, 8);
     VAR_BIN_OP_AND_uxn_c_l270_c4_de7b_right := to_unsigned(4080, 12);
     VAR_BIN_OP_EQ_uxn_c_l215_c7_03b4_right := to_unsigned(8, 8);
     VAR_BIN_OP_EQ_uxn_c_l248_c12_5ade_right := to_unsigned(11, 8);
     VAR_BIN_OP_EQ_uxn_c_l226_c12_9f8a_right := to_unsigned(9, 8);
     VAR_BIN_OP_AND_uxn_c_l274_c4_71e2_right := to_unsigned(4080, 12);
     VAR_BIN_OP_AND_uxn_c_l256_c4_2ad1_right := to_unsigned(3855, 12);
     VAR_BIN_OP_AND_uxn_c_l223_c4_0213_right := to_unsigned(255, 12);

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
     VAR_BIN_OP_AND_uxn_c_l218_c4_0940_left := color0;
     VAR_BIN_OP_AND_uxn_c_l240_c4_f1e8_left := color0;
     VAR_BIN_OP_AND_uxn_c_l261_c4_cfac_left := color0;
     VAR_color0_MUX_uxn_c_l212_c2_d7ed_iffalse := color0;
     VAR_color0_MUX_uxn_c_l226_c8_cfb4_iftrue := color0;
     VAR_color0_MUX_uxn_c_l248_c8_85a9_iftrue := color0;
     VAR_color0_MUX_uxn_c_l259_c8_93aa_iffalse := color0;
     VAR_BIN_OP_AND_uxn_c_l223_c4_0213_left := color1;
     VAR_BIN_OP_AND_uxn_c_l245_c4_89c6_left := color1;
     VAR_BIN_OP_AND_uxn_c_l265_c4_c470_left := color1;
     VAR_color1_MUX_uxn_c_l212_c2_d7ed_iffalse := color1;
     VAR_color1_MUX_uxn_c_l226_c8_cfb4_iftrue := color1;
     VAR_color1_MUX_uxn_c_l248_c8_85a9_iftrue := color1;
     VAR_color1_MUX_uxn_c_l259_c8_93aa_iffalse := color1;
     VAR_BIN_OP_AND_uxn_c_l229_c4_1e92_left := color2;
     VAR_BIN_OP_AND_uxn_c_l251_c4_1f66_left := color2;
     VAR_BIN_OP_AND_uxn_c_l270_c4_de7b_left := color2;
     VAR_color2_MUX_uxn_c_l212_c2_d7ed_iffalse := color2;
     VAR_color2_MUX_uxn_c_l215_c3_2a42_iftrue := color2;
     VAR_color2_MUX_uxn_c_l237_c8_7523_iftrue := color2;
     VAR_color2_MUX_uxn_c_l259_c8_93aa_iftrue := color2;
     VAR_color2_MUX_uxn_c_l268_c8_4c88_iffalse := color2;
     VAR_BIN_OP_AND_uxn_c_l234_c4_0726_left := color3;
     VAR_BIN_OP_AND_uxn_c_l256_c4_2ad1_left := color3;
     VAR_BIN_OP_AND_uxn_c_l274_c4_71e2_left := color3;
     VAR_color3_MUX_uxn_c_l212_c2_d7ed_iffalse := color3;
     VAR_color3_MUX_uxn_c_l215_c3_2a42_iftrue := color3;
     VAR_color3_MUX_uxn_c_l237_c8_7523_iftrue := color3;
     VAR_color3_MUX_uxn_c_l259_c8_93aa_iftrue := color3;
     VAR_color3_MUX_uxn_c_l268_c8_4c88_iffalse := color3;
     VAR_color_cmp_0_MUX_uxn_c_l212_c2_d7ed_iffalse := color_cmp_0;
     VAR_color_cmp_1_MUX_uxn_c_l212_c2_d7ed_iffalse := color_cmp_1;
     VAR_BIN_OP_EQ_uxn_c_l215_c7_03b4_left := VAR_device_ram_address;
     VAR_BIN_OP_EQ_uxn_c_l226_c12_9f8a_left := VAR_device_ram_address;
     VAR_BIN_OP_EQ_uxn_c_l237_c12_1f37_left := VAR_device_ram_address;
     VAR_BIN_OP_EQ_uxn_c_l248_c12_5ade_left := VAR_device_ram_address;
     VAR_BIN_OP_EQ_uxn_c_l259_c12_0b34_left := VAR_device_ram_address;
     VAR_BIN_OP_EQ_uxn_c_l268_c12_4065_left := VAR_device_ram_address;
     VAR_CONST_SR_4_uxn_c_l213_c27_c713_x := VAR_device_ram_value;
     VAR_BIN_OP_EQ_uxn_c_l279_c6_a7db_left := VAR_gpu_step_color;
     VAR_BIN_OP_EQ_uxn_c_l281_c13_2e3f_left := VAR_gpu_step_color;
     VAR_BIN_OP_EQ_uxn_c_l283_c13_4a69_left := VAR_gpu_step_color;
     VAR_color0_MUX_uxn_c_l212_c2_d7ed_cond := VAR_is_device_ram_write;
     VAR_color1_MUX_uxn_c_l212_c2_d7ed_cond := VAR_is_device_ram_write;
     VAR_color2_MUX_uxn_c_l212_c2_d7ed_cond := VAR_is_device_ram_write;
     VAR_color3_MUX_uxn_c_l212_c2_d7ed_cond := VAR_is_device_ram_write;
     VAR_color_cmp_0_MUX_uxn_c_l212_c2_d7ed_cond := VAR_is_device_ram_write;
     VAR_color_cmp_1_MUX_uxn_c_l212_c2_d7ed_cond := VAR_is_device_ram_write;
     VAR_tmp12_MUX_uxn_c_l212_c2_d7ed_cond := VAR_is_device_ram_write;
     VAR_tmp12_MUX_uxn_c_l212_c2_d7ed_iffalse := tmp12;
     VAR_tmp12_MUX_uxn_c_l268_c8_4c88_iffalse := tmp12;
     -- BIN_OP_AND[uxn_c_l256_c4_2ad1] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l256_c4_2ad1_left <= VAR_BIN_OP_AND_uxn_c_l256_c4_2ad1_left;
     BIN_OP_AND_uxn_c_l256_c4_2ad1_right <= VAR_BIN_OP_AND_uxn_c_l256_c4_2ad1_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l256_c4_2ad1_return_output := BIN_OP_AND_uxn_c_l256_c4_2ad1_return_output;

     -- BIN_OP_AND[uxn_c_l265_c4_c470] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l265_c4_c470_left <= VAR_BIN_OP_AND_uxn_c_l265_c4_c470_left;
     BIN_OP_AND_uxn_c_l265_c4_c470_right <= VAR_BIN_OP_AND_uxn_c_l265_c4_c470_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l265_c4_c470_return_output := BIN_OP_AND_uxn_c_l265_c4_c470_return_output;

     -- BIN_OP_AND[uxn_c_l274_c4_71e2] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l274_c4_71e2_left <= VAR_BIN_OP_AND_uxn_c_l274_c4_71e2_left;
     BIN_OP_AND_uxn_c_l274_c4_71e2_right <= VAR_BIN_OP_AND_uxn_c_l274_c4_71e2_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l274_c4_71e2_return_output := BIN_OP_AND_uxn_c_l274_c4_71e2_return_output;

     -- BIN_OP_AND[uxn_c_l223_c4_0213] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l223_c4_0213_left <= VAR_BIN_OP_AND_uxn_c_l223_c4_0213_left;
     BIN_OP_AND_uxn_c_l223_c4_0213_right <= VAR_BIN_OP_AND_uxn_c_l223_c4_0213_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l223_c4_0213_return_output := BIN_OP_AND_uxn_c_l223_c4_0213_return_output;

     -- BIN_OP_EQ[uxn_c_l259_c12_0b34] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l259_c12_0b34_left <= VAR_BIN_OP_EQ_uxn_c_l259_c12_0b34_left;
     BIN_OP_EQ_uxn_c_l259_c12_0b34_right <= VAR_BIN_OP_EQ_uxn_c_l259_c12_0b34_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l259_c12_0b34_return_output := BIN_OP_EQ_uxn_c_l259_c12_0b34_return_output;

     -- BIN_OP_EQ[uxn_c_l215_c7_03b4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l215_c7_03b4_left <= VAR_BIN_OP_EQ_uxn_c_l215_c7_03b4_left;
     BIN_OP_EQ_uxn_c_l215_c7_03b4_right <= VAR_BIN_OP_EQ_uxn_c_l215_c7_03b4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l215_c7_03b4_return_output := BIN_OP_EQ_uxn_c_l215_c7_03b4_return_output;

     -- BIN_OP_EQ[uxn_c_l279_c6_a7db] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l279_c6_a7db_left <= VAR_BIN_OP_EQ_uxn_c_l279_c6_a7db_left;
     BIN_OP_EQ_uxn_c_l279_c6_a7db_right <= VAR_BIN_OP_EQ_uxn_c_l279_c6_a7db_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l279_c6_a7db_return_output := BIN_OP_EQ_uxn_c_l279_c6_a7db_return_output;

     -- BIN_OP_AND[uxn_c_l240_c4_f1e8] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l240_c4_f1e8_left <= VAR_BIN_OP_AND_uxn_c_l240_c4_f1e8_left;
     BIN_OP_AND_uxn_c_l240_c4_f1e8_right <= VAR_BIN_OP_AND_uxn_c_l240_c4_f1e8_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l240_c4_f1e8_return_output := BIN_OP_AND_uxn_c_l240_c4_f1e8_return_output;

     -- BIN_OP_AND[uxn_c_l270_c4_de7b] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l270_c4_de7b_left <= VAR_BIN_OP_AND_uxn_c_l270_c4_de7b_left;
     BIN_OP_AND_uxn_c_l270_c4_de7b_right <= VAR_BIN_OP_AND_uxn_c_l270_c4_de7b_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l270_c4_de7b_return_output := BIN_OP_AND_uxn_c_l270_c4_de7b_return_output;

     -- BIN_OP_EQ[uxn_c_l226_c12_9f8a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l226_c12_9f8a_left <= VAR_BIN_OP_EQ_uxn_c_l226_c12_9f8a_left;
     BIN_OP_EQ_uxn_c_l226_c12_9f8a_right <= VAR_BIN_OP_EQ_uxn_c_l226_c12_9f8a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l226_c12_9f8a_return_output := BIN_OP_EQ_uxn_c_l226_c12_9f8a_return_output;

     -- BIN_OP_AND[uxn_c_l251_c4_1f66] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l251_c4_1f66_left <= VAR_BIN_OP_AND_uxn_c_l251_c4_1f66_left;
     BIN_OP_AND_uxn_c_l251_c4_1f66_right <= VAR_BIN_OP_AND_uxn_c_l251_c4_1f66_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l251_c4_1f66_return_output := BIN_OP_AND_uxn_c_l251_c4_1f66_return_output;

     -- BIN_OP_AND[uxn_c_l229_c4_1e92] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l229_c4_1e92_left <= VAR_BIN_OP_AND_uxn_c_l229_c4_1e92_left;
     BIN_OP_AND_uxn_c_l229_c4_1e92_right <= VAR_BIN_OP_AND_uxn_c_l229_c4_1e92_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l229_c4_1e92_return_output := BIN_OP_AND_uxn_c_l229_c4_1e92_return_output;

     -- BIN_OP_EQ[uxn_c_l237_c12_1f37] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l237_c12_1f37_left <= VAR_BIN_OP_EQ_uxn_c_l237_c12_1f37_left;
     BIN_OP_EQ_uxn_c_l237_c12_1f37_right <= VAR_BIN_OP_EQ_uxn_c_l237_c12_1f37_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l237_c12_1f37_return_output := BIN_OP_EQ_uxn_c_l237_c12_1f37_return_output;

     -- CAST_TO_uint4_t[uxn_c_l214_c17_4875] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_c_l214_c17_4875_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_device_ram_value);

     -- BIN_OP_AND[uxn_c_l245_c4_89c6] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l245_c4_89c6_left <= VAR_BIN_OP_AND_uxn_c_l245_c4_89c6_left;
     BIN_OP_AND_uxn_c_l245_c4_89c6_right <= VAR_BIN_OP_AND_uxn_c_l245_c4_89c6_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l245_c4_89c6_return_output := BIN_OP_AND_uxn_c_l245_c4_89c6_return_output;

     -- BIN_OP_EQ[uxn_c_l281_c13_2e3f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l281_c13_2e3f_left <= VAR_BIN_OP_EQ_uxn_c_l281_c13_2e3f_left;
     BIN_OP_EQ_uxn_c_l281_c13_2e3f_right <= VAR_BIN_OP_EQ_uxn_c_l281_c13_2e3f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l281_c13_2e3f_return_output := BIN_OP_EQ_uxn_c_l281_c13_2e3f_return_output;

     -- BIN_OP_AND[uxn_c_l261_c4_cfac] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l261_c4_cfac_left <= VAR_BIN_OP_AND_uxn_c_l261_c4_cfac_left;
     BIN_OP_AND_uxn_c_l261_c4_cfac_right <= VAR_BIN_OP_AND_uxn_c_l261_c4_cfac_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l261_c4_cfac_return_output := BIN_OP_AND_uxn_c_l261_c4_cfac_return_output;

     -- BIN_OP_AND[uxn_c_l218_c4_0940] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l218_c4_0940_left <= VAR_BIN_OP_AND_uxn_c_l218_c4_0940_left;
     BIN_OP_AND_uxn_c_l218_c4_0940_right <= VAR_BIN_OP_AND_uxn_c_l218_c4_0940_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l218_c4_0940_return_output := BIN_OP_AND_uxn_c_l218_c4_0940_return_output;

     -- BIN_OP_AND[uxn_c_l234_c4_0726] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l234_c4_0726_left <= VAR_BIN_OP_AND_uxn_c_l234_c4_0726_left;
     BIN_OP_AND_uxn_c_l234_c4_0726_right <= VAR_BIN_OP_AND_uxn_c_l234_c4_0726_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l234_c4_0726_return_output := BIN_OP_AND_uxn_c_l234_c4_0726_return_output;

     -- BIN_OP_EQ[uxn_c_l268_c12_4065] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l268_c12_4065_left <= VAR_BIN_OP_EQ_uxn_c_l268_c12_4065_left;
     BIN_OP_EQ_uxn_c_l268_c12_4065_right <= VAR_BIN_OP_EQ_uxn_c_l268_c12_4065_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l268_c12_4065_return_output := BIN_OP_EQ_uxn_c_l268_c12_4065_return_output;

     -- BIN_OP_EQ[uxn_c_l283_c13_4a69] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l283_c13_4a69_left <= VAR_BIN_OP_EQ_uxn_c_l283_c13_4a69_left;
     BIN_OP_EQ_uxn_c_l283_c13_4a69_right <= VAR_BIN_OP_EQ_uxn_c_l283_c13_4a69_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l283_c13_4a69_return_output := BIN_OP_EQ_uxn_c_l283_c13_4a69_return_output;

     -- CONST_SR_4[uxn_c_l213_c27_c713] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_c_l213_c27_c713_x <= VAR_CONST_SR_4_uxn_c_l213_c27_c713_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_c_l213_c27_c713_return_output := CONST_SR_4_uxn_c_l213_c27_c713_return_output;

     -- BIN_OP_EQ[uxn_c_l248_c12_5ade] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l248_c12_5ade_left <= VAR_BIN_OP_EQ_uxn_c_l248_c12_5ade_left;
     BIN_OP_EQ_uxn_c_l248_c12_5ade_right <= VAR_BIN_OP_EQ_uxn_c_l248_c12_5ade_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l248_c12_5ade_return_output := BIN_OP_EQ_uxn_c_l248_c12_5ade_return_output;

     -- Submodule level 1
     VAR_BIN_OP_OR_uxn_c_l219_c4_9903_left := VAR_BIN_OP_AND_uxn_c_l218_c4_0940_return_output;
     VAR_BIN_OP_OR_uxn_c_l224_c4_65ff_left := VAR_BIN_OP_AND_uxn_c_l223_c4_0213_return_output;
     VAR_BIN_OP_OR_uxn_c_l230_c4_1552_left := VAR_BIN_OP_AND_uxn_c_l229_c4_1e92_return_output;
     VAR_BIN_OP_OR_uxn_c_l235_c4_1168_left := VAR_BIN_OP_AND_uxn_c_l234_c4_0726_return_output;
     VAR_BIN_OP_OR_uxn_c_l241_c4_3a79_left := VAR_BIN_OP_AND_uxn_c_l240_c4_f1e8_return_output;
     VAR_BIN_OP_OR_uxn_c_l246_c4_bd0e_left := VAR_BIN_OP_AND_uxn_c_l245_c4_89c6_return_output;
     VAR_BIN_OP_OR_uxn_c_l252_c4_97fd_left := VAR_BIN_OP_AND_uxn_c_l251_c4_1f66_return_output;
     VAR_BIN_OP_OR_uxn_c_l257_c4_f361_left := VAR_BIN_OP_AND_uxn_c_l256_c4_2ad1_return_output;
     VAR_BIN_OP_OR_uxn_c_l262_c4_84e0_left := VAR_BIN_OP_AND_uxn_c_l261_c4_cfac_return_output;
     VAR_BIN_OP_OR_uxn_c_l266_c4_e62e_left := VAR_BIN_OP_AND_uxn_c_l265_c4_c470_return_output;
     VAR_BIN_OP_OR_uxn_c_l271_c4_87f2_left := VAR_BIN_OP_AND_uxn_c_l270_c4_de7b_return_output;
     VAR_BIN_OP_OR_uxn_c_l275_c4_d954_left := VAR_BIN_OP_AND_uxn_c_l274_c4_71e2_return_output;
     VAR_color0_MUX_uxn_c_l215_c3_2a42_cond := VAR_BIN_OP_EQ_uxn_c_l215_c7_03b4_return_output;
     VAR_color1_MUX_uxn_c_l215_c3_2a42_cond := VAR_BIN_OP_EQ_uxn_c_l215_c7_03b4_return_output;
     VAR_color2_MUX_uxn_c_l215_c3_2a42_cond := VAR_BIN_OP_EQ_uxn_c_l215_c7_03b4_return_output;
     VAR_color3_MUX_uxn_c_l215_c3_2a42_cond := VAR_BIN_OP_EQ_uxn_c_l215_c7_03b4_return_output;
     VAR_tmp12_MUX_uxn_c_l215_c3_2a42_cond := VAR_BIN_OP_EQ_uxn_c_l215_c7_03b4_return_output;
     VAR_color0_MUX_uxn_c_l226_c8_cfb4_cond := VAR_BIN_OP_EQ_uxn_c_l226_c12_9f8a_return_output;
     VAR_color1_MUX_uxn_c_l226_c8_cfb4_cond := VAR_BIN_OP_EQ_uxn_c_l226_c12_9f8a_return_output;
     VAR_color2_MUX_uxn_c_l226_c8_cfb4_cond := VAR_BIN_OP_EQ_uxn_c_l226_c12_9f8a_return_output;
     VAR_color3_MUX_uxn_c_l226_c8_cfb4_cond := VAR_BIN_OP_EQ_uxn_c_l226_c12_9f8a_return_output;
     VAR_tmp12_MUX_uxn_c_l226_c8_cfb4_cond := VAR_BIN_OP_EQ_uxn_c_l226_c12_9f8a_return_output;
     VAR_color0_MUX_uxn_c_l237_c8_7523_cond := VAR_BIN_OP_EQ_uxn_c_l237_c12_1f37_return_output;
     VAR_color1_MUX_uxn_c_l237_c8_7523_cond := VAR_BIN_OP_EQ_uxn_c_l237_c12_1f37_return_output;
     VAR_color2_MUX_uxn_c_l237_c8_7523_cond := VAR_BIN_OP_EQ_uxn_c_l237_c12_1f37_return_output;
     VAR_color3_MUX_uxn_c_l237_c8_7523_cond := VAR_BIN_OP_EQ_uxn_c_l237_c12_1f37_return_output;
     VAR_tmp12_MUX_uxn_c_l237_c8_7523_cond := VAR_BIN_OP_EQ_uxn_c_l237_c12_1f37_return_output;
     VAR_color0_MUX_uxn_c_l248_c8_85a9_cond := VAR_BIN_OP_EQ_uxn_c_l248_c12_5ade_return_output;
     VAR_color1_MUX_uxn_c_l248_c8_85a9_cond := VAR_BIN_OP_EQ_uxn_c_l248_c12_5ade_return_output;
     VAR_color2_MUX_uxn_c_l248_c8_85a9_cond := VAR_BIN_OP_EQ_uxn_c_l248_c12_5ade_return_output;
     VAR_color3_MUX_uxn_c_l248_c8_85a9_cond := VAR_BIN_OP_EQ_uxn_c_l248_c12_5ade_return_output;
     VAR_tmp12_MUX_uxn_c_l248_c8_85a9_cond := VAR_BIN_OP_EQ_uxn_c_l248_c12_5ade_return_output;
     VAR_color0_MUX_uxn_c_l259_c8_93aa_cond := VAR_BIN_OP_EQ_uxn_c_l259_c12_0b34_return_output;
     VAR_color1_MUX_uxn_c_l259_c8_93aa_cond := VAR_BIN_OP_EQ_uxn_c_l259_c12_0b34_return_output;
     VAR_color2_MUX_uxn_c_l259_c8_93aa_cond := VAR_BIN_OP_EQ_uxn_c_l259_c12_0b34_return_output;
     VAR_color3_MUX_uxn_c_l259_c8_93aa_cond := VAR_BIN_OP_EQ_uxn_c_l259_c12_0b34_return_output;
     VAR_tmp12_MUX_uxn_c_l259_c8_93aa_cond := VAR_BIN_OP_EQ_uxn_c_l259_c12_0b34_return_output;
     VAR_color2_MUX_uxn_c_l268_c8_4c88_cond := VAR_BIN_OP_EQ_uxn_c_l268_c12_4065_return_output;
     VAR_color3_MUX_uxn_c_l268_c8_4c88_cond := VAR_BIN_OP_EQ_uxn_c_l268_c12_4065_return_output;
     VAR_tmp12_MUX_uxn_c_l268_c8_4c88_cond := VAR_BIN_OP_EQ_uxn_c_l268_c12_4065_return_output;
     VAR_result_MUX_uxn_c_l279_c2_75e8_cond := VAR_BIN_OP_EQ_uxn_c_l279_c6_a7db_return_output;
     VAR_result_MUX_uxn_c_l281_c9_1a03_cond := VAR_BIN_OP_EQ_uxn_c_l281_c13_2e3f_return_output;
     VAR_result_MUX_uxn_c_l283_c9_b3aa_cond := VAR_BIN_OP_EQ_uxn_c_l283_c13_4a69_return_output;
     VAR_color_cmp_1_uxn_c_l214_c3_16a4 := VAR_CAST_TO_uint4_t_uxn_c_l214_c17_4875_return_output;
     VAR_color_cmp_1_MUX_uxn_c_l212_c2_d7ed_iftrue := VAR_color_cmp_1_uxn_c_l214_c3_16a4;
     VAR_tmp12_uxn_c_l221_c4_b4c2 := resize(VAR_color_cmp_1_uxn_c_l214_c3_16a4, 12);
     VAR_tmp12_uxn_c_l232_c4_54ae := resize(VAR_color_cmp_1_uxn_c_l214_c3_16a4, 12);
     VAR_tmp12_uxn_c_l243_c4_8f22 := resize(VAR_color_cmp_1_uxn_c_l214_c3_16a4, 12);
     VAR_tmp12_uxn_c_l254_c4_9843 := resize(VAR_color_cmp_1_uxn_c_l214_c3_16a4, 12);
     VAR_CONST_SL_8_uxn_c_l222_c4_0275_x := VAR_tmp12_uxn_c_l221_c4_b4c2;
     VAR_CONST_SL_8_uxn_c_l233_c4_f33d_x := VAR_tmp12_uxn_c_l232_c4_54ae;
     VAR_CONST_SL_4_uxn_c_l244_c4_0740_x := VAR_tmp12_uxn_c_l243_c4_8f22;
     VAR_CONST_SL_4_uxn_c_l255_c4_661f_x := VAR_tmp12_uxn_c_l254_c4_9843;
     -- CONST_SL_8[uxn_c_l222_c4_0275] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l222_c4_0275_x <= VAR_CONST_SL_8_uxn_c_l222_c4_0275_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l222_c4_0275_return_output := CONST_SL_8_uxn_c_l222_c4_0275_return_output;

     -- CAST_TO_uint12_t_uint4_t_uxn_c_l264_l273_DUPLICATE_84ee LATENCY=0
     VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l264_l273_DUPLICATE_84ee_return_output := CAST_TO_uint12_t_uint4_t(
     VAR_color_cmp_1_uxn_c_l214_c3_16a4);

     -- color_cmp_1_MUX[uxn_c_l212_c2_d7ed] LATENCY=0
     -- Inputs
     color_cmp_1_MUX_uxn_c_l212_c2_d7ed_cond <= VAR_color_cmp_1_MUX_uxn_c_l212_c2_d7ed_cond;
     color_cmp_1_MUX_uxn_c_l212_c2_d7ed_iftrue <= VAR_color_cmp_1_MUX_uxn_c_l212_c2_d7ed_iftrue;
     color_cmp_1_MUX_uxn_c_l212_c2_d7ed_iffalse <= VAR_color_cmp_1_MUX_uxn_c_l212_c2_d7ed_iffalse;
     -- Outputs
     VAR_color_cmp_1_MUX_uxn_c_l212_c2_d7ed_return_output := color_cmp_1_MUX_uxn_c_l212_c2_d7ed_return_output;

     -- CONST_SL_4[uxn_c_l255_c4_661f] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_c_l255_c4_661f_x <= VAR_CONST_SL_4_uxn_c_l255_c4_661f_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_c_l255_c4_661f_return_output := CONST_SL_4_uxn_c_l255_c4_661f_return_output;

     -- CAST_TO_uint4_t[uxn_c_l213_c17_5051] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_c_l213_c17_5051_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_CONST_SR_4_uxn_c_l213_c27_c713_return_output);

     -- CONST_SL_4[uxn_c_l244_c4_0740] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_c_l244_c4_0740_x <= VAR_CONST_SL_4_uxn_c_l244_c4_0740_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_c_l244_c4_0740_return_output := CONST_SL_4_uxn_c_l244_c4_0740_return_output;

     -- CONST_SL_8[uxn_c_l233_c4_f33d] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l233_c4_f33d_x <= VAR_CONST_SL_8_uxn_c_l233_c4_f33d_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l233_c4_f33d_return_output := CONST_SL_8_uxn_c_l233_c4_f33d_return_output;

     -- Submodule level 2
     VAR_BIN_OP_OR_uxn_c_l266_c4_e62e_right := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l264_l273_DUPLICATE_84ee_return_output;
     VAR_BIN_OP_OR_uxn_c_l275_c4_d954_right := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l264_l273_DUPLICATE_84ee_return_output;
     VAR_tmp12_MUX_uxn_c_l259_c8_93aa_iftrue := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l264_l273_DUPLICATE_84ee_return_output;
     VAR_tmp12_MUX_uxn_c_l268_c8_4c88_iftrue := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l264_l273_DUPLICATE_84ee_return_output;
     VAR_color_cmp_0_uxn_c_l213_c3_d593 := VAR_CAST_TO_uint4_t_uxn_c_l213_c17_5051_return_output;
     VAR_BIN_OP_OR_uxn_c_l246_c4_bd0e_right := VAR_CONST_SL_4_uxn_c_l244_c4_0740_return_output;
     VAR_tmp12_MUX_uxn_c_l237_c8_7523_iftrue := VAR_CONST_SL_4_uxn_c_l244_c4_0740_return_output;
     VAR_BIN_OP_OR_uxn_c_l257_c4_f361_right := VAR_CONST_SL_4_uxn_c_l255_c4_661f_return_output;
     VAR_tmp12_MUX_uxn_c_l248_c8_85a9_iftrue := VAR_CONST_SL_4_uxn_c_l255_c4_661f_return_output;
     VAR_BIN_OP_OR_uxn_c_l224_c4_65ff_right := VAR_CONST_SL_8_uxn_c_l222_c4_0275_return_output;
     VAR_tmp12_MUX_uxn_c_l215_c3_2a42_iftrue := VAR_CONST_SL_8_uxn_c_l222_c4_0275_return_output;
     VAR_BIN_OP_OR_uxn_c_l235_c4_1168_right := VAR_CONST_SL_8_uxn_c_l233_c4_f33d_return_output;
     VAR_tmp12_MUX_uxn_c_l226_c8_cfb4_iftrue := VAR_CONST_SL_8_uxn_c_l233_c4_f33d_return_output;
     REG_VAR_color_cmp_1 := VAR_color_cmp_1_MUX_uxn_c_l212_c2_d7ed_return_output;
     VAR_color_cmp_0_MUX_uxn_c_l212_c2_d7ed_iftrue := VAR_color_cmp_0_uxn_c_l213_c3_d593;
     VAR_tmp12_uxn_c_l216_c4_eb8b := resize(VAR_color_cmp_0_uxn_c_l213_c3_d593, 12);
     VAR_tmp12_uxn_c_l227_c4_6ff5 := resize(VAR_color_cmp_0_uxn_c_l213_c3_d593, 12);
     VAR_tmp12_uxn_c_l238_c4_b48a := resize(VAR_color_cmp_0_uxn_c_l213_c3_d593, 12);
     VAR_tmp12_uxn_c_l249_c4_1c0f := resize(VAR_color_cmp_0_uxn_c_l213_c3_d593, 12);
     VAR_CONST_SL_8_uxn_c_l217_c4_9683_x := VAR_tmp12_uxn_c_l216_c4_eb8b;
     VAR_CONST_SL_8_uxn_c_l228_c4_b2d6_x := VAR_tmp12_uxn_c_l227_c4_6ff5;
     VAR_CONST_SL_4_uxn_c_l239_c4_d5d6_x := VAR_tmp12_uxn_c_l238_c4_b48a;
     VAR_CONST_SL_4_uxn_c_l250_c4_91b8_x := VAR_tmp12_uxn_c_l249_c4_1c0f;
     -- BIN_OP_OR[uxn_c_l257_c4_f361] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l257_c4_f361_left <= VAR_BIN_OP_OR_uxn_c_l257_c4_f361_left;
     BIN_OP_OR_uxn_c_l257_c4_f361_right <= VAR_BIN_OP_OR_uxn_c_l257_c4_f361_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l257_c4_f361_return_output := BIN_OP_OR_uxn_c_l257_c4_f361_return_output;

     -- BIN_OP_OR[uxn_c_l275_c4_d954] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l275_c4_d954_left <= VAR_BIN_OP_OR_uxn_c_l275_c4_d954_left;
     BIN_OP_OR_uxn_c_l275_c4_d954_right <= VAR_BIN_OP_OR_uxn_c_l275_c4_d954_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l275_c4_d954_return_output := BIN_OP_OR_uxn_c_l275_c4_d954_return_output;

     -- CONST_SL_4[uxn_c_l239_c4_d5d6] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_c_l239_c4_d5d6_x <= VAR_CONST_SL_4_uxn_c_l239_c4_d5d6_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_c_l239_c4_d5d6_return_output := CONST_SL_4_uxn_c_l239_c4_d5d6_return_output;

     -- CONST_SL_8[uxn_c_l228_c4_b2d6] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l228_c4_b2d6_x <= VAR_CONST_SL_8_uxn_c_l228_c4_b2d6_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l228_c4_b2d6_return_output := CONST_SL_8_uxn_c_l228_c4_b2d6_return_output;

     -- BIN_OP_OR[uxn_c_l266_c4_e62e] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l266_c4_e62e_left <= VAR_BIN_OP_OR_uxn_c_l266_c4_e62e_left;
     BIN_OP_OR_uxn_c_l266_c4_e62e_right <= VAR_BIN_OP_OR_uxn_c_l266_c4_e62e_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l266_c4_e62e_return_output := BIN_OP_OR_uxn_c_l266_c4_e62e_return_output;

     -- BIN_OP_OR[uxn_c_l246_c4_bd0e] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l246_c4_bd0e_left <= VAR_BIN_OP_OR_uxn_c_l246_c4_bd0e_left;
     BIN_OP_OR_uxn_c_l246_c4_bd0e_right <= VAR_BIN_OP_OR_uxn_c_l246_c4_bd0e_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l246_c4_bd0e_return_output := BIN_OP_OR_uxn_c_l246_c4_bd0e_return_output;

     -- BIN_OP_OR[uxn_c_l224_c4_65ff] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l224_c4_65ff_left <= VAR_BIN_OP_OR_uxn_c_l224_c4_65ff_left;
     BIN_OP_OR_uxn_c_l224_c4_65ff_right <= VAR_BIN_OP_OR_uxn_c_l224_c4_65ff_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l224_c4_65ff_return_output := BIN_OP_OR_uxn_c_l224_c4_65ff_return_output;

     -- CONST_SL_8[uxn_c_l217_c4_9683] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l217_c4_9683_x <= VAR_CONST_SL_8_uxn_c_l217_c4_9683_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l217_c4_9683_return_output := CONST_SL_8_uxn_c_l217_c4_9683_return_output;

     -- color_cmp_0_MUX[uxn_c_l212_c2_d7ed] LATENCY=0
     -- Inputs
     color_cmp_0_MUX_uxn_c_l212_c2_d7ed_cond <= VAR_color_cmp_0_MUX_uxn_c_l212_c2_d7ed_cond;
     color_cmp_0_MUX_uxn_c_l212_c2_d7ed_iftrue <= VAR_color_cmp_0_MUX_uxn_c_l212_c2_d7ed_iftrue;
     color_cmp_0_MUX_uxn_c_l212_c2_d7ed_iffalse <= VAR_color_cmp_0_MUX_uxn_c_l212_c2_d7ed_iffalse;
     -- Outputs
     VAR_color_cmp_0_MUX_uxn_c_l212_c2_d7ed_return_output := color_cmp_0_MUX_uxn_c_l212_c2_d7ed_return_output;

     -- tmp12_MUX[uxn_c_l268_c8_4c88] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_c_l268_c8_4c88_cond <= VAR_tmp12_MUX_uxn_c_l268_c8_4c88_cond;
     tmp12_MUX_uxn_c_l268_c8_4c88_iftrue <= VAR_tmp12_MUX_uxn_c_l268_c8_4c88_iftrue;
     tmp12_MUX_uxn_c_l268_c8_4c88_iffalse <= VAR_tmp12_MUX_uxn_c_l268_c8_4c88_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_c_l268_c8_4c88_return_output := tmp12_MUX_uxn_c_l268_c8_4c88_return_output;

     -- CAST_TO_uint12_t_uint4_t_uxn_c_l260_l269_DUPLICATE_d031 LATENCY=0
     VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l260_l269_DUPLICATE_d031_return_output := CAST_TO_uint12_t_uint4_t(
     VAR_color_cmp_0_uxn_c_l213_c3_d593);

     -- BIN_OP_OR[uxn_c_l235_c4_1168] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l235_c4_1168_left <= VAR_BIN_OP_OR_uxn_c_l235_c4_1168_left;
     BIN_OP_OR_uxn_c_l235_c4_1168_right <= VAR_BIN_OP_OR_uxn_c_l235_c4_1168_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l235_c4_1168_return_output := BIN_OP_OR_uxn_c_l235_c4_1168_return_output;

     -- CONST_SL_4[uxn_c_l250_c4_91b8] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_c_l250_c4_91b8_x <= VAR_CONST_SL_4_uxn_c_l250_c4_91b8_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_c_l250_c4_91b8_return_output := CONST_SL_4_uxn_c_l250_c4_91b8_return_output;

     -- Submodule level 3
     VAR_color1_MUX_uxn_c_l215_c3_2a42_iftrue := VAR_BIN_OP_OR_uxn_c_l224_c4_65ff_return_output;
     VAR_color3_MUX_uxn_c_l226_c8_cfb4_iftrue := VAR_BIN_OP_OR_uxn_c_l235_c4_1168_return_output;
     VAR_color1_MUX_uxn_c_l237_c8_7523_iftrue := VAR_BIN_OP_OR_uxn_c_l246_c4_bd0e_return_output;
     VAR_color3_MUX_uxn_c_l248_c8_85a9_iftrue := VAR_BIN_OP_OR_uxn_c_l257_c4_f361_return_output;
     VAR_color1_MUX_uxn_c_l259_c8_93aa_iftrue := VAR_BIN_OP_OR_uxn_c_l266_c4_e62e_return_output;
     VAR_color3_MUX_uxn_c_l268_c8_4c88_iftrue := VAR_BIN_OP_OR_uxn_c_l275_c4_d954_return_output;
     VAR_BIN_OP_OR_uxn_c_l262_c4_84e0_right := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l260_l269_DUPLICATE_d031_return_output;
     VAR_BIN_OP_OR_uxn_c_l271_c4_87f2_right := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l260_l269_DUPLICATE_d031_return_output;
     VAR_BIN_OP_OR_uxn_c_l241_c4_3a79_right := VAR_CONST_SL_4_uxn_c_l239_c4_d5d6_return_output;
     VAR_BIN_OP_OR_uxn_c_l252_c4_97fd_right := VAR_CONST_SL_4_uxn_c_l250_c4_91b8_return_output;
     VAR_BIN_OP_OR_uxn_c_l219_c4_9903_right := VAR_CONST_SL_8_uxn_c_l217_c4_9683_return_output;
     VAR_BIN_OP_OR_uxn_c_l230_c4_1552_right := VAR_CONST_SL_8_uxn_c_l228_c4_b2d6_return_output;
     REG_VAR_color_cmp_0 := VAR_color_cmp_0_MUX_uxn_c_l212_c2_d7ed_return_output;
     VAR_tmp12_MUX_uxn_c_l259_c8_93aa_iffalse := VAR_tmp12_MUX_uxn_c_l268_c8_4c88_return_output;
     -- color1_MUX[uxn_c_l259_c8_93aa] LATENCY=0
     -- Inputs
     color1_MUX_uxn_c_l259_c8_93aa_cond <= VAR_color1_MUX_uxn_c_l259_c8_93aa_cond;
     color1_MUX_uxn_c_l259_c8_93aa_iftrue <= VAR_color1_MUX_uxn_c_l259_c8_93aa_iftrue;
     color1_MUX_uxn_c_l259_c8_93aa_iffalse <= VAR_color1_MUX_uxn_c_l259_c8_93aa_iffalse;
     -- Outputs
     VAR_color1_MUX_uxn_c_l259_c8_93aa_return_output := color1_MUX_uxn_c_l259_c8_93aa_return_output;

     -- BIN_OP_OR[uxn_c_l241_c4_3a79] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l241_c4_3a79_left <= VAR_BIN_OP_OR_uxn_c_l241_c4_3a79_left;
     BIN_OP_OR_uxn_c_l241_c4_3a79_right <= VAR_BIN_OP_OR_uxn_c_l241_c4_3a79_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l241_c4_3a79_return_output := BIN_OP_OR_uxn_c_l241_c4_3a79_return_output;

     -- BIN_OP_OR[uxn_c_l262_c4_84e0] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l262_c4_84e0_left <= VAR_BIN_OP_OR_uxn_c_l262_c4_84e0_left;
     BIN_OP_OR_uxn_c_l262_c4_84e0_right <= VAR_BIN_OP_OR_uxn_c_l262_c4_84e0_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l262_c4_84e0_return_output := BIN_OP_OR_uxn_c_l262_c4_84e0_return_output;

     -- BIN_OP_OR[uxn_c_l252_c4_97fd] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l252_c4_97fd_left <= VAR_BIN_OP_OR_uxn_c_l252_c4_97fd_left;
     BIN_OP_OR_uxn_c_l252_c4_97fd_right <= VAR_BIN_OP_OR_uxn_c_l252_c4_97fd_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l252_c4_97fd_return_output := BIN_OP_OR_uxn_c_l252_c4_97fd_return_output;

     -- BIN_OP_OR[uxn_c_l230_c4_1552] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l230_c4_1552_left <= VAR_BIN_OP_OR_uxn_c_l230_c4_1552_left;
     BIN_OP_OR_uxn_c_l230_c4_1552_right <= VAR_BIN_OP_OR_uxn_c_l230_c4_1552_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l230_c4_1552_return_output := BIN_OP_OR_uxn_c_l230_c4_1552_return_output;

     -- tmp12_MUX[uxn_c_l259_c8_93aa] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_c_l259_c8_93aa_cond <= VAR_tmp12_MUX_uxn_c_l259_c8_93aa_cond;
     tmp12_MUX_uxn_c_l259_c8_93aa_iftrue <= VAR_tmp12_MUX_uxn_c_l259_c8_93aa_iftrue;
     tmp12_MUX_uxn_c_l259_c8_93aa_iffalse <= VAR_tmp12_MUX_uxn_c_l259_c8_93aa_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_c_l259_c8_93aa_return_output := tmp12_MUX_uxn_c_l259_c8_93aa_return_output;

     -- BIN_OP_OR[uxn_c_l219_c4_9903] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l219_c4_9903_left <= VAR_BIN_OP_OR_uxn_c_l219_c4_9903_left;
     BIN_OP_OR_uxn_c_l219_c4_9903_right <= VAR_BIN_OP_OR_uxn_c_l219_c4_9903_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l219_c4_9903_return_output := BIN_OP_OR_uxn_c_l219_c4_9903_return_output;

     -- BIN_OP_OR[uxn_c_l271_c4_87f2] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l271_c4_87f2_left <= VAR_BIN_OP_OR_uxn_c_l271_c4_87f2_left;
     BIN_OP_OR_uxn_c_l271_c4_87f2_right <= VAR_BIN_OP_OR_uxn_c_l271_c4_87f2_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l271_c4_87f2_return_output := BIN_OP_OR_uxn_c_l271_c4_87f2_return_output;

     -- color3_MUX[uxn_c_l268_c8_4c88] LATENCY=0
     -- Inputs
     color3_MUX_uxn_c_l268_c8_4c88_cond <= VAR_color3_MUX_uxn_c_l268_c8_4c88_cond;
     color3_MUX_uxn_c_l268_c8_4c88_iftrue <= VAR_color3_MUX_uxn_c_l268_c8_4c88_iftrue;
     color3_MUX_uxn_c_l268_c8_4c88_iffalse <= VAR_color3_MUX_uxn_c_l268_c8_4c88_iffalse;
     -- Outputs
     VAR_color3_MUX_uxn_c_l268_c8_4c88_return_output := color3_MUX_uxn_c_l268_c8_4c88_return_output;

     -- Submodule level 4
     VAR_color0_MUX_uxn_c_l215_c3_2a42_iftrue := VAR_BIN_OP_OR_uxn_c_l219_c4_9903_return_output;
     VAR_color2_MUX_uxn_c_l226_c8_cfb4_iftrue := VAR_BIN_OP_OR_uxn_c_l230_c4_1552_return_output;
     VAR_color0_MUX_uxn_c_l237_c8_7523_iftrue := VAR_BIN_OP_OR_uxn_c_l241_c4_3a79_return_output;
     VAR_color2_MUX_uxn_c_l248_c8_85a9_iftrue := VAR_BIN_OP_OR_uxn_c_l252_c4_97fd_return_output;
     VAR_color0_MUX_uxn_c_l259_c8_93aa_iftrue := VAR_BIN_OP_OR_uxn_c_l262_c4_84e0_return_output;
     VAR_color2_MUX_uxn_c_l268_c8_4c88_iftrue := VAR_BIN_OP_OR_uxn_c_l271_c4_87f2_return_output;
     VAR_color1_MUX_uxn_c_l248_c8_85a9_iffalse := VAR_color1_MUX_uxn_c_l259_c8_93aa_return_output;
     VAR_color3_MUX_uxn_c_l259_c8_93aa_iffalse := VAR_color3_MUX_uxn_c_l268_c8_4c88_return_output;
     VAR_tmp12_MUX_uxn_c_l248_c8_85a9_iffalse := VAR_tmp12_MUX_uxn_c_l259_c8_93aa_return_output;
     -- tmp12_MUX[uxn_c_l248_c8_85a9] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_c_l248_c8_85a9_cond <= VAR_tmp12_MUX_uxn_c_l248_c8_85a9_cond;
     tmp12_MUX_uxn_c_l248_c8_85a9_iftrue <= VAR_tmp12_MUX_uxn_c_l248_c8_85a9_iftrue;
     tmp12_MUX_uxn_c_l248_c8_85a9_iffalse <= VAR_tmp12_MUX_uxn_c_l248_c8_85a9_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_c_l248_c8_85a9_return_output := tmp12_MUX_uxn_c_l248_c8_85a9_return_output;

     -- color0_MUX[uxn_c_l259_c8_93aa] LATENCY=0
     -- Inputs
     color0_MUX_uxn_c_l259_c8_93aa_cond <= VAR_color0_MUX_uxn_c_l259_c8_93aa_cond;
     color0_MUX_uxn_c_l259_c8_93aa_iftrue <= VAR_color0_MUX_uxn_c_l259_c8_93aa_iftrue;
     color0_MUX_uxn_c_l259_c8_93aa_iffalse <= VAR_color0_MUX_uxn_c_l259_c8_93aa_iffalse;
     -- Outputs
     VAR_color0_MUX_uxn_c_l259_c8_93aa_return_output := color0_MUX_uxn_c_l259_c8_93aa_return_output;

     -- color2_MUX[uxn_c_l268_c8_4c88] LATENCY=0
     -- Inputs
     color2_MUX_uxn_c_l268_c8_4c88_cond <= VAR_color2_MUX_uxn_c_l268_c8_4c88_cond;
     color2_MUX_uxn_c_l268_c8_4c88_iftrue <= VAR_color2_MUX_uxn_c_l268_c8_4c88_iftrue;
     color2_MUX_uxn_c_l268_c8_4c88_iffalse <= VAR_color2_MUX_uxn_c_l268_c8_4c88_iffalse;
     -- Outputs
     VAR_color2_MUX_uxn_c_l268_c8_4c88_return_output := color2_MUX_uxn_c_l268_c8_4c88_return_output;

     -- color1_MUX[uxn_c_l248_c8_85a9] LATENCY=0
     -- Inputs
     color1_MUX_uxn_c_l248_c8_85a9_cond <= VAR_color1_MUX_uxn_c_l248_c8_85a9_cond;
     color1_MUX_uxn_c_l248_c8_85a9_iftrue <= VAR_color1_MUX_uxn_c_l248_c8_85a9_iftrue;
     color1_MUX_uxn_c_l248_c8_85a9_iffalse <= VAR_color1_MUX_uxn_c_l248_c8_85a9_iffalse;
     -- Outputs
     VAR_color1_MUX_uxn_c_l248_c8_85a9_return_output := color1_MUX_uxn_c_l248_c8_85a9_return_output;

     -- color3_MUX[uxn_c_l259_c8_93aa] LATENCY=0
     -- Inputs
     color3_MUX_uxn_c_l259_c8_93aa_cond <= VAR_color3_MUX_uxn_c_l259_c8_93aa_cond;
     color3_MUX_uxn_c_l259_c8_93aa_iftrue <= VAR_color3_MUX_uxn_c_l259_c8_93aa_iftrue;
     color3_MUX_uxn_c_l259_c8_93aa_iffalse <= VAR_color3_MUX_uxn_c_l259_c8_93aa_iffalse;
     -- Outputs
     VAR_color3_MUX_uxn_c_l259_c8_93aa_return_output := color3_MUX_uxn_c_l259_c8_93aa_return_output;

     -- Submodule level 5
     VAR_color0_MUX_uxn_c_l248_c8_85a9_iffalse := VAR_color0_MUX_uxn_c_l259_c8_93aa_return_output;
     VAR_color1_MUX_uxn_c_l237_c8_7523_iffalse := VAR_color1_MUX_uxn_c_l248_c8_85a9_return_output;
     VAR_color2_MUX_uxn_c_l259_c8_93aa_iffalse := VAR_color2_MUX_uxn_c_l268_c8_4c88_return_output;
     VAR_color3_MUX_uxn_c_l248_c8_85a9_iffalse := VAR_color3_MUX_uxn_c_l259_c8_93aa_return_output;
     VAR_tmp12_MUX_uxn_c_l237_c8_7523_iffalse := VAR_tmp12_MUX_uxn_c_l248_c8_85a9_return_output;
     -- color2_MUX[uxn_c_l259_c8_93aa] LATENCY=0
     -- Inputs
     color2_MUX_uxn_c_l259_c8_93aa_cond <= VAR_color2_MUX_uxn_c_l259_c8_93aa_cond;
     color2_MUX_uxn_c_l259_c8_93aa_iftrue <= VAR_color2_MUX_uxn_c_l259_c8_93aa_iftrue;
     color2_MUX_uxn_c_l259_c8_93aa_iffalse <= VAR_color2_MUX_uxn_c_l259_c8_93aa_iffalse;
     -- Outputs
     VAR_color2_MUX_uxn_c_l259_c8_93aa_return_output := color2_MUX_uxn_c_l259_c8_93aa_return_output;

     -- color1_MUX[uxn_c_l237_c8_7523] LATENCY=0
     -- Inputs
     color1_MUX_uxn_c_l237_c8_7523_cond <= VAR_color1_MUX_uxn_c_l237_c8_7523_cond;
     color1_MUX_uxn_c_l237_c8_7523_iftrue <= VAR_color1_MUX_uxn_c_l237_c8_7523_iftrue;
     color1_MUX_uxn_c_l237_c8_7523_iffalse <= VAR_color1_MUX_uxn_c_l237_c8_7523_iffalse;
     -- Outputs
     VAR_color1_MUX_uxn_c_l237_c8_7523_return_output := color1_MUX_uxn_c_l237_c8_7523_return_output;

     -- color3_MUX[uxn_c_l248_c8_85a9] LATENCY=0
     -- Inputs
     color3_MUX_uxn_c_l248_c8_85a9_cond <= VAR_color3_MUX_uxn_c_l248_c8_85a9_cond;
     color3_MUX_uxn_c_l248_c8_85a9_iftrue <= VAR_color3_MUX_uxn_c_l248_c8_85a9_iftrue;
     color3_MUX_uxn_c_l248_c8_85a9_iffalse <= VAR_color3_MUX_uxn_c_l248_c8_85a9_iffalse;
     -- Outputs
     VAR_color3_MUX_uxn_c_l248_c8_85a9_return_output := color3_MUX_uxn_c_l248_c8_85a9_return_output;

     -- tmp12_MUX[uxn_c_l237_c8_7523] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_c_l237_c8_7523_cond <= VAR_tmp12_MUX_uxn_c_l237_c8_7523_cond;
     tmp12_MUX_uxn_c_l237_c8_7523_iftrue <= VAR_tmp12_MUX_uxn_c_l237_c8_7523_iftrue;
     tmp12_MUX_uxn_c_l237_c8_7523_iffalse <= VAR_tmp12_MUX_uxn_c_l237_c8_7523_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_c_l237_c8_7523_return_output := tmp12_MUX_uxn_c_l237_c8_7523_return_output;

     -- color0_MUX[uxn_c_l248_c8_85a9] LATENCY=0
     -- Inputs
     color0_MUX_uxn_c_l248_c8_85a9_cond <= VAR_color0_MUX_uxn_c_l248_c8_85a9_cond;
     color0_MUX_uxn_c_l248_c8_85a9_iftrue <= VAR_color0_MUX_uxn_c_l248_c8_85a9_iftrue;
     color0_MUX_uxn_c_l248_c8_85a9_iffalse <= VAR_color0_MUX_uxn_c_l248_c8_85a9_iffalse;
     -- Outputs
     VAR_color0_MUX_uxn_c_l248_c8_85a9_return_output := color0_MUX_uxn_c_l248_c8_85a9_return_output;

     -- Submodule level 6
     VAR_color0_MUX_uxn_c_l237_c8_7523_iffalse := VAR_color0_MUX_uxn_c_l248_c8_85a9_return_output;
     VAR_color1_MUX_uxn_c_l226_c8_cfb4_iffalse := VAR_color1_MUX_uxn_c_l237_c8_7523_return_output;
     VAR_color2_MUX_uxn_c_l248_c8_85a9_iffalse := VAR_color2_MUX_uxn_c_l259_c8_93aa_return_output;
     VAR_color3_MUX_uxn_c_l237_c8_7523_iffalse := VAR_color3_MUX_uxn_c_l248_c8_85a9_return_output;
     VAR_tmp12_MUX_uxn_c_l226_c8_cfb4_iffalse := VAR_tmp12_MUX_uxn_c_l237_c8_7523_return_output;
     -- color2_MUX[uxn_c_l248_c8_85a9] LATENCY=0
     -- Inputs
     color2_MUX_uxn_c_l248_c8_85a9_cond <= VAR_color2_MUX_uxn_c_l248_c8_85a9_cond;
     color2_MUX_uxn_c_l248_c8_85a9_iftrue <= VAR_color2_MUX_uxn_c_l248_c8_85a9_iftrue;
     color2_MUX_uxn_c_l248_c8_85a9_iffalse <= VAR_color2_MUX_uxn_c_l248_c8_85a9_iffalse;
     -- Outputs
     VAR_color2_MUX_uxn_c_l248_c8_85a9_return_output := color2_MUX_uxn_c_l248_c8_85a9_return_output;

     -- color3_MUX[uxn_c_l237_c8_7523] LATENCY=0
     -- Inputs
     color3_MUX_uxn_c_l237_c8_7523_cond <= VAR_color3_MUX_uxn_c_l237_c8_7523_cond;
     color3_MUX_uxn_c_l237_c8_7523_iftrue <= VAR_color3_MUX_uxn_c_l237_c8_7523_iftrue;
     color3_MUX_uxn_c_l237_c8_7523_iffalse <= VAR_color3_MUX_uxn_c_l237_c8_7523_iffalse;
     -- Outputs
     VAR_color3_MUX_uxn_c_l237_c8_7523_return_output := color3_MUX_uxn_c_l237_c8_7523_return_output;

     -- tmp12_MUX[uxn_c_l226_c8_cfb4] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_c_l226_c8_cfb4_cond <= VAR_tmp12_MUX_uxn_c_l226_c8_cfb4_cond;
     tmp12_MUX_uxn_c_l226_c8_cfb4_iftrue <= VAR_tmp12_MUX_uxn_c_l226_c8_cfb4_iftrue;
     tmp12_MUX_uxn_c_l226_c8_cfb4_iffalse <= VAR_tmp12_MUX_uxn_c_l226_c8_cfb4_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_c_l226_c8_cfb4_return_output := tmp12_MUX_uxn_c_l226_c8_cfb4_return_output;

     -- color0_MUX[uxn_c_l237_c8_7523] LATENCY=0
     -- Inputs
     color0_MUX_uxn_c_l237_c8_7523_cond <= VAR_color0_MUX_uxn_c_l237_c8_7523_cond;
     color0_MUX_uxn_c_l237_c8_7523_iftrue <= VAR_color0_MUX_uxn_c_l237_c8_7523_iftrue;
     color0_MUX_uxn_c_l237_c8_7523_iffalse <= VAR_color0_MUX_uxn_c_l237_c8_7523_iffalse;
     -- Outputs
     VAR_color0_MUX_uxn_c_l237_c8_7523_return_output := color0_MUX_uxn_c_l237_c8_7523_return_output;

     -- color1_MUX[uxn_c_l226_c8_cfb4] LATENCY=0
     -- Inputs
     color1_MUX_uxn_c_l226_c8_cfb4_cond <= VAR_color1_MUX_uxn_c_l226_c8_cfb4_cond;
     color1_MUX_uxn_c_l226_c8_cfb4_iftrue <= VAR_color1_MUX_uxn_c_l226_c8_cfb4_iftrue;
     color1_MUX_uxn_c_l226_c8_cfb4_iffalse <= VAR_color1_MUX_uxn_c_l226_c8_cfb4_iffalse;
     -- Outputs
     VAR_color1_MUX_uxn_c_l226_c8_cfb4_return_output := color1_MUX_uxn_c_l226_c8_cfb4_return_output;

     -- Submodule level 7
     VAR_color0_MUX_uxn_c_l226_c8_cfb4_iffalse := VAR_color0_MUX_uxn_c_l237_c8_7523_return_output;
     VAR_color1_MUX_uxn_c_l215_c3_2a42_iffalse := VAR_color1_MUX_uxn_c_l226_c8_cfb4_return_output;
     VAR_color2_MUX_uxn_c_l237_c8_7523_iffalse := VAR_color2_MUX_uxn_c_l248_c8_85a9_return_output;
     VAR_color3_MUX_uxn_c_l226_c8_cfb4_iffalse := VAR_color3_MUX_uxn_c_l237_c8_7523_return_output;
     VAR_tmp12_MUX_uxn_c_l215_c3_2a42_iffalse := VAR_tmp12_MUX_uxn_c_l226_c8_cfb4_return_output;
     -- color2_MUX[uxn_c_l237_c8_7523] LATENCY=0
     -- Inputs
     color2_MUX_uxn_c_l237_c8_7523_cond <= VAR_color2_MUX_uxn_c_l237_c8_7523_cond;
     color2_MUX_uxn_c_l237_c8_7523_iftrue <= VAR_color2_MUX_uxn_c_l237_c8_7523_iftrue;
     color2_MUX_uxn_c_l237_c8_7523_iffalse <= VAR_color2_MUX_uxn_c_l237_c8_7523_iffalse;
     -- Outputs
     VAR_color2_MUX_uxn_c_l237_c8_7523_return_output := color2_MUX_uxn_c_l237_c8_7523_return_output;

     -- color0_MUX[uxn_c_l226_c8_cfb4] LATENCY=0
     -- Inputs
     color0_MUX_uxn_c_l226_c8_cfb4_cond <= VAR_color0_MUX_uxn_c_l226_c8_cfb4_cond;
     color0_MUX_uxn_c_l226_c8_cfb4_iftrue <= VAR_color0_MUX_uxn_c_l226_c8_cfb4_iftrue;
     color0_MUX_uxn_c_l226_c8_cfb4_iffalse <= VAR_color0_MUX_uxn_c_l226_c8_cfb4_iffalse;
     -- Outputs
     VAR_color0_MUX_uxn_c_l226_c8_cfb4_return_output := color0_MUX_uxn_c_l226_c8_cfb4_return_output;

     -- color3_MUX[uxn_c_l226_c8_cfb4] LATENCY=0
     -- Inputs
     color3_MUX_uxn_c_l226_c8_cfb4_cond <= VAR_color3_MUX_uxn_c_l226_c8_cfb4_cond;
     color3_MUX_uxn_c_l226_c8_cfb4_iftrue <= VAR_color3_MUX_uxn_c_l226_c8_cfb4_iftrue;
     color3_MUX_uxn_c_l226_c8_cfb4_iffalse <= VAR_color3_MUX_uxn_c_l226_c8_cfb4_iffalse;
     -- Outputs
     VAR_color3_MUX_uxn_c_l226_c8_cfb4_return_output := color3_MUX_uxn_c_l226_c8_cfb4_return_output;

     -- color1_MUX[uxn_c_l215_c3_2a42] LATENCY=0
     -- Inputs
     color1_MUX_uxn_c_l215_c3_2a42_cond <= VAR_color1_MUX_uxn_c_l215_c3_2a42_cond;
     color1_MUX_uxn_c_l215_c3_2a42_iftrue <= VAR_color1_MUX_uxn_c_l215_c3_2a42_iftrue;
     color1_MUX_uxn_c_l215_c3_2a42_iffalse <= VAR_color1_MUX_uxn_c_l215_c3_2a42_iffalse;
     -- Outputs
     VAR_color1_MUX_uxn_c_l215_c3_2a42_return_output := color1_MUX_uxn_c_l215_c3_2a42_return_output;

     -- tmp12_MUX[uxn_c_l215_c3_2a42] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_c_l215_c3_2a42_cond <= VAR_tmp12_MUX_uxn_c_l215_c3_2a42_cond;
     tmp12_MUX_uxn_c_l215_c3_2a42_iftrue <= VAR_tmp12_MUX_uxn_c_l215_c3_2a42_iftrue;
     tmp12_MUX_uxn_c_l215_c3_2a42_iffalse <= VAR_tmp12_MUX_uxn_c_l215_c3_2a42_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_c_l215_c3_2a42_return_output := tmp12_MUX_uxn_c_l215_c3_2a42_return_output;

     -- Submodule level 8
     VAR_color0_MUX_uxn_c_l215_c3_2a42_iffalse := VAR_color0_MUX_uxn_c_l226_c8_cfb4_return_output;
     VAR_color1_MUX_uxn_c_l212_c2_d7ed_iftrue := VAR_color1_MUX_uxn_c_l215_c3_2a42_return_output;
     VAR_color2_MUX_uxn_c_l226_c8_cfb4_iffalse := VAR_color2_MUX_uxn_c_l237_c8_7523_return_output;
     VAR_color3_MUX_uxn_c_l215_c3_2a42_iffalse := VAR_color3_MUX_uxn_c_l226_c8_cfb4_return_output;
     VAR_tmp12_MUX_uxn_c_l212_c2_d7ed_iftrue := VAR_tmp12_MUX_uxn_c_l215_c3_2a42_return_output;
     -- color0_MUX[uxn_c_l215_c3_2a42] LATENCY=0
     -- Inputs
     color0_MUX_uxn_c_l215_c3_2a42_cond <= VAR_color0_MUX_uxn_c_l215_c3_2a42_cond;
     color0_MUX_uxn_c_l215_c3_2a42_iftrue <= VAR_color0_MUX_uxn_c_l215_c3_2a42_iftrue;
     color0_MUX_uxn_c_l215_c3_2a42_iffalse <= VAR_color0_MUX_uxn_c_l215_c3_2a42_iffalse;
     -- Outputs
     VAR_color0_MUX_uxn_c_l215_c3_2a42_return_output := color0_MUX_uxn_c_l215_c3_2a42_return_output;

     -- color3_MUX[uxn_c_l215_c3_2a42] LATENCY=0
     -- Inputs
     color3_MUX_uxn_c_l215_c3_2a42_cond <= VAR_color3_MUX_uxn_c_l215_c3_2a42_cond;
     color3_MUX_uxn_c_l215_c3_2a42_iftrue <= VAR_color3_MUX_uxn_c_l215_c3_2a42_iftrue;
     color3_MUX_uxn_c_l215_c3_2a42_iffalse <= VAR_color3_MUX_uxn_c_l215_c3_2a42_iffalse;
     -- Outputs
     VAR_color3_MUX_uxn_c_l215_c3_2a42_return_output := color3_MUX_uxn_c_l215_c3_2a42_return_output;

     -- color2_MUX[uxn_c_l226_c8_cfb4] LATENCY=0
     -- Inputs
     color2_MUX_uxn_c_l226_c8_cfb4_cond <= VAR_color2_MUX_uxn_c_l226_c8_cfb4_cond;
     color2_MUX_uxn_c_l226_c8_cfb4_iftrue <= VAR_color2_MUX_uxn_c_l226_c8_cfb4_iftrue;
     color2_MUX_uxn_c_l226_c8_cfb4_iffalse <= VAR_color2_MUX_uxn_c_l226_c8_cfb4_iffalse;
     -- Outputs
     VAR_color2_MUX_uxn_c_l226_c8_cfb4_return_output := color2_MUX_uxn_c_l226_c8_cfb4_return_output;

     -- tmp12_MUX[uxn_c_l212_c2_d7ed] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_c_l212_c2_d7ed_cond <= VAR_tmp12_MUX_uxn_c_l212_c2_d7ed_cond;
     tmp12_MUX_uxn_c_l212_c2_d7ed_iftrue <= VAR_tmp12_MUX_uxn_c_l212_c2_d7ed_iftrue;
     tmp12_MUX_uxn_c_l212_c2_d7ed_iffalse <= VAR_tmp12_MUX_uxn_c_l212_c2_d7ed_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_c_l212_c2_d7ed_return_output := tmp12_MUX_uxn_c_l212_c2_d7ed_return_output;

     -- color1_MUX[uxn_c_l212_c2_d7ed] LATENCY=0
     -- Inputs
     color1_MUX_uxn_c_l212_c2_d7ed_cond <= VAR_color1_MUX_uxn_c_l212_c2_d7ed_cond;
     color1_MUX_uxn_c_l212_c2_d7ed_iftrue <= VAR_color1_MUX_uxn_c_l212_c2_d7ed_iftrue;
     color1_MUX_uxn_c_l212_c2_d7ed_iffalse <= VAR_color1_MUX_uxn_c_l212_c2_d7ed_iffalse;
     -- Outputs
     VAR_color1_MUX_uxn_c_l212_c2_d7ed_return_output := color1_MUX_uxn_c_l212_c2_d7ed_return_output;

     -- Submodule level 9
     VAR_color0_MUX_uxn_c_l212_c2_d7ed_iftrue := VAR_color0_MUX_uxn_c_l215_c3_2a42_return_output;
     REG_VAR_color1 := VAR_color1_MUX_uxn_c_l212_c2_d7ed_return_output;
     VAR_result_uxn_c_l282_c3_0d44 := resize(VAR_color1_MUX_uxn_c_l212_c2_d7ed_return_output, 16);
     VAR_color2_MUX_uxn_c_l215_c3_2a42_iffalse := VAR_color2_MUX_uxn_c_l226_c8_cfb4_return_output;
     VAR_color3_MUX_uxn_c_l212_c2_d7ed_iftrue := VAR_color3_MUX_uxn_c_l215_c3_2a42_return_output;
     REG_VAR_tmp12 := VAR_tmp12_MUX_uxn_c_l212_c2_d7ed_return_output;
     VAR_result_MUX_uxn_c_l281_c9_1a03_iftrue := VAR_result_uxn_c_l282_c3_0d44;
     -- color0_MUX[uxn_c_l212_c2_d7ed] LATENCY=0
     -- Inputs
     color0_MUX_uxn_c_l212_c2_d7ed_cond <= VAR_color0_MUX_uxn_c_l212_c2_d7ed_cond;
     color0_MUX_uxn_c_l212_c2_d7ed_iftrue <= VAR_color0_MUX_uxn_c_l212_c2_d7ed_iftrue;
     color0_MUX_uxn_c_l212_c2_d7ed_iffalse <= VAR_color0_MUX_uxn_c_l212_c2_d7ed_iffalse;
     -- Outputs
     VAR_color0_MUX_uxn_c_l212_c2_d7ed_return_output := color0_MUX_uxn_c_l212_c2_d7ed_return_output;

     -- color3_MUX[uxn_c_l212_c2_d7ed] LATENCY=0
     -- Inputs
     color3_MUX_uxn_c_l212_c2_d7ed_cond <= VAR_color3_MUX_uxn_c_l212_c2_d7ed_cond;
     color3_MUX_uxn_c_l212_c2_d7ed_iftrue <= VAR_color3_MUX_uxn_c_l212_c2_d7ed_iftrue;
     color3_MUX_uxn_c_l212_c2_d7ed_iffalse <= VAR_color3_MUX_uxn_c_l212_c2_d7ed_iffalse;
     -- Outputs
     VAR_color3_MUX_uxn_c_l212_c2_d7ed_return_output := color3_MUX_uxn_c_l212_c2_d7ed_return_output;

     -- color2_MUX[uxn_c_l215_c3_2a42] LATENCY=0
     -- Inputs
     color2_MUX_uxn_c_l215_c3_2a42_cond <= VAR_color2_MUX_uxn_c_l215_c3_2a42_cond;
     color2_MUX_uxn_c_l215_c3_2a42_iftrue <= VAR_color2_MUX_uxn_c_l215_c3_2a42_iftrue;
     color2_MUX_uxn_c_l215_c3_2a42_iffalse <= VAR_color2_MUX_uxn_c_l215_c3_2a42_iffalse;
     -- Outputs
     VAR_color2_MUX_uxn_c_l215_c3_2a42_return_output := color2_MUX_uxn_c_l215_c3_2a42_return_output;

     -- Submodule level 10
     REG_VAR_color0 := VAR_color0_MUX_uxn_c_l212_c2_d7ed_return_output;
     VAR_result_uxn_c_l280_c3_8294 := resize(VAR_color0_MUX_uxn_c_l212_c2_d7ed_return_output, 16);
     VAR_color2_MUX_uxn_c_l212_c2_d7ed_iftrue := VAR_color2_MUX_uxn_c_l215_c3_2a42_return_output;
     REG_VAR_color3 := VAR_color3_MUX_uxn_c_l212_c2_d7ed_return_output;
     VAR_result_uxn_c_l286_c3_0ec0 := resize(VAR_color3_MUX_uxn_c_l212_c2_d7ed_return_output, 16);
     VAR_result_MUX_uxn_c_l279_c2_75e8_iftrue := VAR_result_uxn_c_l280_c3_8294;
     VAR_result_MUX_uxn_c_l283_c9_b3aa_iffalse := VAR_result_uxn_c_l286_c3_0ec0;
     -- color2_MUX[uxn_c_l212_c2_d7ed] LATENCY=0
     -- Inputs
     color2_MUX_uxn_c_l212_c2_d7ed_cond <= VAR_color2_MUX_uxn_c_l212_c2_d7ed_cond;
     color2_MUX_uxn_c_l212_c2_d7ed_iftrue <= VAR_color2_MUX_uxn_c_l212_c2_d7ed_iftrue;
     color2_MUX_uxn_c_l212_c2_d7ed_iffalse <= VAR_color2_MUX_uxn_c_l212_c2_d7ed_iffalse;
     -- Outputs
     VAR_color2_MUX_uxn_c_l212_c2_d7ed_return_output := color2_MUX_uxn_c_l212_c2_d7ed_return_output;

     -- Submodule level 11
     REG_VAR_color2 := VAR_color2_MUX_uxn_c_l212_c2_d7ed_return_output;
     VAR_result_uxn_c_l284_c3_2243 := resize(VAR_color2_MUX_uxn_c_l212_c2_d7ed_return_output, 16);
     VAR_result_MUX_uxn_c_l283_c9_b3aa_iftrue := VAR_result_uxn_c_l284_c3_2243;
     -- result_MUX[uxn_c_l283_c9_b3aa] LATENCY=0
     -- Inputs
     result_MUX_uxn_c_l283_c9_b3aa_cond <= VAR_result_MUX_uxn_c_l283_c9_b3aa_cond;
     result_MUX_uxn_c_l283_c9_b3aa_iftrue <= VAR_result_MUX_uxn_c_l283_c9_b3aa_iftrue;
     result_MUX_uxn_c_l283_c9_b3aa_iffalse <= VAR_result_MUX_uxn_c_l283_c9_b3aa_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_c_l283_c9_b3aa_return_output := result_MUX_uxn_c_l283_c9_b3aa_return_output;

     -- Submodule level 12
     VAR_result_MUX_uxn_c_l281_c9_1a03_iffalse := VAR_result_MUX_uxn_c_l283_c9_b3aa_return_output;
     -- result_MUX[uxn_c_l281_c9_1a03] LATENCY=0
     -- Inputs
     result_MUX_uxn_c_l281_c9_1a03_cond <= VAR_result_MUX_uxn_c_l281_c9_1a03_cond;
     result_MUX_uxn_c_l281_c9_1a03_iftrue <= VAR_result_MUX_uxn_c_l281_c9_1a03_iftrue;
     result_MUX_uxn_c_l281_c9_1a03_iffalse <= VAR_result_MUX_uxn_c_l281_c9_1a03_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_c_l281_c9_1a03_return_output := result_MUX_uxn_c_l281_c9_1a03_return_output;

     -- Submodule level 13
     VAR_result_MUX_uxn_c_l279_c2_75e8_iffalse := VAR_result_MUX_uxn_c_l281_c9_1a03_return_output;
     -- result_MUX[uxn_c_l279_c2_75e8] LATENCY=0
     -- Inputs
     result_MUX_uxn_c_l279_c2_75e8_cond <= VAR_result_MUX_uxn_c_l279_c2_75e8_cond;
     result_MUX_uxn_c_l279_c2_75e8_iftrue <= VAR_result_MUX_uxn_c_l279_c2_75e8_iftrue;
     result_MUX_uxn_c_l279_c2_75e8_iffalse <= VAR_result_MUX_uxn_c_l279_c2_75e8_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_c_l279_c2_75e8_return_output := result_MUX_uxn_c_l279_c2_75e8_return_output;

     -- Submodule level 14
     REG_VAR_result := VAR_result_MUX_uxn_c_l279_c2_75e8_return_output;
     VAR_return_output := VAR_result_MUX_uxn_c_l279_c2_75e8_return_output;
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
