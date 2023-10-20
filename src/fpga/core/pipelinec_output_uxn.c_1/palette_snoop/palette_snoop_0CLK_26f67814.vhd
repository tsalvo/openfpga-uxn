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
-- color0_MUX[uxn_c_l191_c2_23ab]
signal color0_MUX_uxn_c_l191_c2_23ab_cond : unsigned(0 downto 0);
signal color0_MUX_uxn_c_l191_c2_23ab_iftrue : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l191_c2_23ab_iffalse : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l191_c2_23ab_return_output : unsigned(11 downto 0);

-- color3_MUX[uxn_c_l191_c2_23ab]
signal color3_MUX_uxn_c_l191_c2_23ab_cond : unsigned(0 downto 0);
signal color3_MUX_uxn_c_l191_c2_23ab_iftrue : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l191_c2_23ab_iffalse : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l191_c2_23ab_return_output : unsigned(11 downto 0);

-- color1_MUX[uxn_c_l191_c2_23ab]
signal color1_MUX_uxn_c_l191_c2_23ab_cond : unsigned(0 downto 0);
signal color1_MUX_uxn_c_l191_c2_23ab_iftrue : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l191_c2_23ab_iffalse : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l191_c2_23ab_return_output : unsigned(11 downto 0);

-- color_cmp_0_MUX[uxn_c_l191_c2_23ab]
signal color_cmp_0_MUX_uxn_c_l191_c2_23ab_cond : unsigned(0 downto 0);
signal color_cmp_0_MUX_uxn_c_l191_c2_23ab_iftrue : unsigned(3 downto 0);
signal color_cmp_0_MUX_uxn_c_l191_c2_23ab_iffalse : unsigned(3 downto 0);
signal color_cmp_0_MUX_uxn_c_l191_c2_23ab_return_output : unsigned(3 downto 0);

-- tmp12_MUX[uxn_c_l191_c2_23ab]
signal tmp12_MUX_uxn_c_l191_c2_23ab_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_c_l191_c2_23ab_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l191_c2_23ab_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l191_c2_23ab_return_output : unsigned(11 downto 0);

-- color_cmp_1_MUX[uxn_c_l191_c2_23ab]
signal color_cmp_1_MUX_uxn_c_l191_c2_23ab_cond : unsigned(0 downto 0);
signal color_cmp_1_MUX_uxn_c_l191_c2_23ab_iftrue : unsigned(3 downto 0);
signal color_cmp_1_MUX_uxn_c_l191_c2_23ab_iffalse : unsigned(3 downto 0);
signal color_cmp_1_MUX_uxn_c_l191_c2_23ab_return_output : unsigned(3 downto 0);

-- color2_MUX[uxn_c_l191_c2_23ab]
signal color2_MUX_uxn_c_l191_c2_23ab_cond : unsigned(0 downto 0);
signal color2_MUX_uxn_c_l191_c2_23ab_iftrue : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l191_c2_23ab_iffalse : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l191_c2_23ab_return_output : unsigned(11 downto 0);

-- CONST_SR_4[uxn_c_l192_c27_fc5f]
signal CONST_SR_4_uxn_c_l192_c27_fc5f_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_c_l192_c27_fc5f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_c_l194_c7_7696]
signal BIN_OP_EQ_uxn_c_l194_c7_7696_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l194_c7_7696_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l194_c7_7696_return_output : unsigned(0 downto 0);

-- color0_MUX[uxn_c_l194_c3_b2e4]
signal color0_MUX_uxn_c_l194_c3_b2e4_cond : unsigned(0 downto 0);
signal color0_MUX_uxn_c_l194_c3_b2e4_iftrue : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l194_c3_b2e4_iffalse : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l194_c3_b2e4_return_output : unsigned(11 downto 0);

-- color3_MUX[uxn_c_l194_c3_b2e4]
signal color3_MUX_uxn_c_l194_c3_b2e4_cond : unsigned(0 downto 0);
signal color3_MUX_uxn_c_l194_c3_b2e4_iftrue : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l194_c3_b2e4_iffalse : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l194_c3_b2e4_return_output : unsigned(11 downto 0);

-- color1_MUX[uxn_c_l194_c3_b2e4]
signal color1_MUX_uxn_c_l194_c3_b2e4_cond : unsigned(0 downto 0);
signal color1_MUX_uxn_c_l194_c3_b2e4_iftrue : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l194_c3_b2e4_iffalse : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l194_c3_b2e4_return_output : unsigned(11 downto 0);

-- tmp12_MUX[uxn_c_l194_c3_b2e4]
signal tmp12_MUX_uxn_c_l194_c3_b2e4_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_c_l194_c3_b2e4_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l194_c3_b2e4_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l194_c3_b2e4_return_output : unsigned(11 downto 0);

-- color2_MUX[uxn_c_l194_c3_b2e4]
signal color2_MUX_uxn_c_l194_c3_b2e4_cond : unsigned(0 downto 0);
signal color2_MUX_uxn_c_l194_c3_b2e4_iftrue : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l194_c3_b2e4_iffalse : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l194_c3_b2e4_return_output : unsigned(11 downto 0);

-- CONST_SL_8[uxn_c_l196_c4_b60f]
signal CONST_SL_8_uxn_c_l196_c4_b60f_x : unsigned(11 downto 0);
signal CONST_SL_8_uxn_c_l196_c4_b60f_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l197_c4_f591]
signal BIN_OP_AND_uxn_c_l197_c4_f591_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l197_c4_f591_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l197_c4_f591_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l198_c4_5323]
signal BIN_OP_OR_uxn_c_l198_c4_5323_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l198_c4_5323_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l198_c4_5323_return_output : unsigned(11 downto 0);

-- CONST_SL_8[uxn_c_l201_c4_33d7]
signal CONST_SL_8_uxn_c_l201_c4_33d7_x : unsigned(11 downto 0);
signal CONST_SL_8_uxn_c_l201_c4_33d7_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l202_c4_afb3]
signal BIN_OP_AND_uxn_c_l202_c4_afb3_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l202_c4_afb3_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l202_c4_afb3_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l203_c4_afed]
signal BIN_OP_OR_uxn_c_l203_c4_afed_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l203_c4_afed_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l203_c4_afed_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l205_c12_e4e7]
signal BIN_OP_EQ_uxn_c_l205_c12_e4e7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l205_c12_e4e7_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l205_c12_e4e7_return_output : unsigned(0 downto 0);

-- color0_MUX[uxn_c_l205_c8_5ce7]
signal color0_MUX_uxn_c_l205_c8_5ce7_cond : unsigned(0 downto 0);
signal color0_MUX_uxn_c_l205_c8_5ce7_iftrue : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l205_c8_5ce7_iffalse : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l205_c8_5ce7_return_output : unsigned(11 downto 0);

-- color3_MUX[uxn_c_l205_c8_5ce7]
signal color3_MUX_uxn_c_l205_c8_5ce7_cond : unsigned(0 downto 0);
signal color3_MUX_uxn_c_l205_c8_5ce7_iftrue : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l205_c8_5ce7_iffalse : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l205_c8_5ce7_return_output : unsigned(11 downto 0);

-- color1_MUX[uxn_c_l205_c8_5ce7]
signal color1_MUX_uxn_c_l205_c8_5ce7_cond : unsigned(0 downto 0);
signal color1_MUX_uxn_c_l205_c8_5ce7_iftrue : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l205_c8_5ce7_iffalse : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l205_c8_5ce7_return_output : unsigned(11 downto 0);

-- tmp12_MUX[uxn_c_l205_c8_5ce7]
signal tmp12_MUX_uxn_c_l205_c8_5ce7_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_c_l205_c8_5ce7_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l205_c8_5ce7_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l205_c8_5ce7_return_output : unsigned(11 downto 0);

-- color2_MUX[uxn_c_l205_c8_5ce7]
signal color2_MUX_uxn_c_l205_c8_5ce7_cond : unsigned(0 downto 0);
signal color2_MUX_uxn_c_l205_c8_5ce7_iftrue : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l205_c8_5ce7_iffalse : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l205_c8_5ce7_return_output : unsigned(11 downto 0);

-- CONST_SL_8[uxn_c_l207_c4_f9e0]
signal CONST_SL_8_uxn_c_l207_c4_f9e0_x : unsigned(11 downto 0);
signal CONST_SL_8_uxn_c_l207_c4_f9e0_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l208_c4_215b]
signal BIN_OP_AND_uxn_c_l208_c4_215b_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l208_c4_215b_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l208_c4_215b_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l209_c4_cdcb]
signal BIN_OP_OR_uxn_c_l209_c4_cdcb_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l209_c4_cdcb_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l209_c4_cdcb_return_output : unsigned(11 downto 0);

-- CONST_SL_8[uxn_c_l212_c4_af15]
signal CONST_SL_8_uxn_c_l212_c4_af15_x : unsigned(11 downto 0);
signal CONST_SL_8_uxn_c_l212_c4_af15_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l213_c4_feef]
signal BIN_OP_AND_uxn_c_l213_c4_feef_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l213_c4_feef_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l213_c4_feef_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l214_c4_7ae1]
signal BIN_OP_OR_uxn_c_l214_c4_7ae1_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l214_c4_7ae1_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l214_c4_7ae1_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l216_c12_6bce]
signal BIN_OP_EQ_uxn_c_l216_c12_6bce_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l216_c12_6bce_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l216_c12_6bce_return_output : unsigned(0 downto 0);

-- color0_MUX[uxn_c_l216_c8_6e97]
signal color0_MUX_uxn_c_l216_c8_6e97_cond : unsigned(0 downto 0);
signal color0_MUX_uxn_c_l216_c8_6e97_iftrue : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l216_c8_6e97_iffalse : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l216_c8_6e97_return_output : unsigned(11 downto 0);

-- color3_MUX[uxn_c_l216_c8_6e97]
signal color3_MUX_uxn_c_l216_c8_6e97_cond : unsigned(0 downto 0);
signal color3_MUX_uxn_c_l216_c8_6e97_iftrue : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l216_c8_6e97_iffalse : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l216_c8_6e97_return_output : unsigned(11 downto 0);

-- color1_MUX[uxn_c_l216_c8_6e97]
signal color1_MUX_uxn_c_l216_c8_6e97_cond : unsigned(0 downto 0);
signal color1_MUX_uxn_c_l216_c8_6e97_iftrue : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l216_c8_6e97_iffalse : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l216_c8_6e97_return_output : unsigned(11 downto 0);

-- tmp12_MUX[uxn_c_l216_c8_6e97]
signal tmp12_MUX_uxn_c_l216_c8_6e97_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_c_l216_c8_6e97_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l216_c8_6e97_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l216_c8_6e97_return_output : unsigned(11 downto 0);

-- color2_MUX[uxn_c_l216_c8_6e97]
signal color2_MUX_uxn_c_l216_c8_6e97_cond : unsigned(0 downto 0);
signal color2_MUX_uxn_c_l216_c8_6e97_iftrue : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l216_c8_6e97_iffalse : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l216_c8_6e97_return_output : unsigned(11 downto 0);

-- CONST_SL_4[uxn_c_l218_c4_76de]
signal CONST_SL_4_uxn_c_l218_c4_76de_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_c_l218_c4_76de_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l219_c4_f7b0]
signal BIN_OP_AND_uxn_c_l219_c4_f7b0_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l219_c4_f7b0_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l219_c4_f7b0_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l220_c4_d06e]
signal BIN_OP_OR_uxn_c_l220_c4_d06e_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l220_c4_d06e_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l220_c4_d06e_return_output : unsigned(11 downto 0);

-- CONST_SL_4[uxn_c_l223_c4_65cf]
signal CONST_SL_4_uxn_c_l223_c4_65cf_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_c_l223_c4_65cf_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l224_c4_63f9]
signal BIN_OP_AND_uxn_c_l224_c4_63f9_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l224_c4_63f9_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l224_c4_63f9_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l225_c4_2618]
signal BIN_OP_OR_uxn_c_l225_c4_2618_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l225_c4_2618_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l225_c4_2618_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l227_c12_634c]
signal BIN_OP_EQ_uxn_c_l227_c12_634c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l227_c12_634c_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l227_c12_634c_return_output : unsigned(0 downto 0);

-- color0_MUX[uxn_c_l227_c8_54ba]
signal color0_MUX_uxn_c_l227_c8_54ba_cond : unsigned(0 downto 0);
signal color0_MUX_uxn_c_l227_c8_54ba_iftrue : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l227_c8_54ba_iffalse : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l227_c8_54ba_return_output : unsigned(11 downto 0);

-- color3_MUX[uxn_c_l227_c8_54ba]
signal color3_MUX_uxn_c_l227_c8_54ba_cond : unsigned(0 downto 0);
signal color3_MUX_uxn_c_l227_c8_54ba_iftrue : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l227_c8_54ba_iffalse : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l227_c8_54ba_return_output : unsigned(11 downto 0);

-- color1_MUX[uxn_c_l227_c8_54ba]
signal color1_MUX_uxn_c_l227_c8_54ba_cond : unsigned(0 downto 0);
signal color1_MUX_uxn_c_l227_c8_54ba_iftrue : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l227_c8_54ba_iffalse : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l227_c8_54ba_return_output : unsigned(11 downto 0);

-- tmp12_MUX[uxn_c_l227_c8_54ba]
signal tmp12_MUX_uxn_c_l227_c8_54ba_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_c_l227_c8_54ba_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l227_c8_54ba_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l227_c8_54ba_return_output : unsigned(11 downto 0);

-- color2_MUX[uxn_c_l227_c8_54ba]
signal color2_MUX_uxn_c_l227_c8_54ba_cond : unsigned(0 downto 0);
signal color2_MUX_uxn_c_l227_c8_54ba_iftrue : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l227_c8_54ba_iffalse : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l227_c8_54ba_return_output : unsigned(11 downto 0);

-- CONST_SL_4[uxn_c_l229_c4_08cf]
signal CONST_SL_4_uxn_c_l229_c4_08cf_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_c_l229_c4_08cf_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l230_c4_c55c]
signal BIN_OP_AND_uxn_c_l230_c4_c55c_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l230_c4_c55c_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l230_c4_c55c_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l231_c4_a52e]
signal BIN_OP_OR_uxn_c_l231_c4_a52e_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l231_c4_a52e_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l231_c4_a52e_return_output : unsigned(11 downto 0);

-- CONST_SL_4[uxn_c_l234_c4_bdce]
signal CONST_SL_4_uxn_c_l234_c4_bdce_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_c_l234_c4_bdce_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l235_c4_2ff2]
signal BIN_OP_AND_uxn_c_l235_c4_2ff2_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l235_c4_2ff2_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l235_c4_2ff2_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l236_c4_c7ef]
signal BIN_OP_OR_uxn_c_l236_c4_c7ef_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l236_c4_c7ef_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l236_c4_c7ef_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l238_c12_3482]
signal BIN_OP_EQ_uxn_c_l238_c12_3482_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l238_c12_3482_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l238_c12_3482_return_output : unsigned(0 downto 0);

-- color0_MUX[uxn_c_l238_c8_ccac]
signal color0_MUX_uxn_c_l238_c8_ccac_cond : unsigned(0 downto 0);
signal color0_MUX_uxn_c_l238_c8_ccac_iftrue : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l238_c8_ccac_iffalse : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l238_c8_ccac_return_output : unsigned(11 downto 0);

-- color3_MUX[uxn_c_l238_c8_ccac]
signal color3_MUX_uxn_c_l238_c8_ccac_cond : unsigned(0 downto 0);
signal color3_MUX_uxn_c_l238_c8_ccac_iftrue : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l238_c8_ccac_iffalse : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l238_c8_ccac_return_output : unsigned(11 downto 0);

-- color1_MUX[uxn_c_l238_c8_ccac]
signal color1_MUX_uxn_c_l238_c8_ccac_cond : unsigned(0 downto 0);
signal color1_MUX_uxn_c_l238_c8_ccac_iftrue : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l238_c8_ccac_iffalse : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l238_c8_ccac_return_output : unsigned(11 downto 0);

-- tmp12_MUX[uxn_c_l238_c8_ccac]
signal tmp12_MUX_uxn_c_l238_c8_ccac_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_c_l238_c8_ccac_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l238_c8_ccac_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l238_c8_ccac_return_output : unsigned(11 downto 0);

-- color2_MUX[uxn_c_l238_c8_ccac]
signal color2_MUX_uxn_c_l238_c8_ccac_cond : unsigned(0 downto 0);
signal color2_MUX_uxn_c_l238_c8_ccac_iftrue : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l238_c8_ccac_iffalse : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l238_c8_ccac_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l240_c4_b95a]
signal BIN_OP_AND_uxn_c_l240_c4_b95a_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l240_c4_b95a_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l240_c4_b95a_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l241_c4_e4b7]
signal BIN_OP_OR_uxn_c_l241_c4_e4b7_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l241_c4_e4b7_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l241_c4_e4b7_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l244_c4_f703]
signal BIN_OP_AND_uxn_c_l244_c4_f703_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l244_c4_f703_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l244_c4_f703_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l245_c4_a9b9]
signal BIN_OP_OR_uxn_c_l245_c4_a9b9_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l245_c4_a9b9_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l245_c4_a9b9_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l247_c12_ae01]
signal BIN_OP_EQ_uxn_c_l247_c12_ae01_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l247_c12_ae01_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l247_c12_ae01_return_output : unsigned(0 downto 0);

-- color3_MUX[uxn_c_l247_c8_0cec]
signal color3_MUX_uxn_c_l247_c8_0cec_cond : unsigned(0 downto 0);
signal color3_MUX_uxn_c_l247_c8_0cec_iftrue : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l247_c8_0cec_iffalse : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l247_c8_0cec_return_output : unsigned(11 downto 0);

-- tmp12_MUX[uxn_c_l247_c8_0cec]
signal tmp12_MUX_uxn_c_l247_c8_0cec_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_c_l247_c8_0cec_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l247_c8_0cec_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l247_c8_0cec_return_output : unsigned(11 downto 0);

-- color2_MUX[uxn_c_l247_c8_0cec]
signal color2_MUX_uxn_c_l247_c8_0cec_cond : unsigned(0 downto 0);
signal color2_MUX_uxn_c_l247_c8_0cec_iftrue : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l247_c8_0cec_iffalse : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l247_c8_0cec_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l249_c4_8e91]
signal BIN_OP_AND_uxn_c_l249_c4_8e91_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l249_c4_8e91_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l249_c4_8e91_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l250_c4_d98e]
signal BIN_OP_OR_uxn_c_l250_c4_d98e_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l250_c4_d98e_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l250_c4_d98e_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l253_c4_63ad]
signal BIN_OP_AND_uxn_c_l253_c4_63ad_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l253_c4_63ad_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l253_c4_63ad_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l254_c4_169b]
signal BIN_OP_OR_uxn_c_l254_c4_169b_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l254_c4_169b_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l254_c4_169b_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l260_c6_aa2e]
signal BIN_OP_EQ_uxn_c_l260_c6_aa2e_left : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l260_c6_aa2e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l260_c6_aa2e_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_c_l260_c2_32f9]
signal result_MUX_uxn_c_l260_c2_32f9_cond : unsigned(0 downto 0);
signal result_MUX_uxn_c_l260_c2_32f9_iftrue : unsigned(15 downto 0);
signal result_MUX_uxn_c_l260_c2_32f9_iffalse : unsigned(15 downto 0);
signal result_MUX_uxn_c_l260_c2_32f9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l262_c13_d97b]
signal BIN_OP_EQ_uxn_c_l262_c13_d97b_left : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l262_c13_d97b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l262_c13_d97b_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_c_l262_c9_9504]
signal result_MUX_uxn_c_l262_c9_9504_cond : unsigned(0 downto 0);
signal result_MUX_uxn_c_l262_c9_9504_iftrue : unsigned(15 downto 0);
signal result_MUX_uxn_c_l262_c9_9504_iffalse : unsigned(15 downto 0);
signal result_MUX_uxn_c_l262_c9_9504_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l264_c13_2860]
signal BIN_OP_EQ_uxn_c_l264_c13_2860_left : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l264_c13_2860_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l264_c13_2860_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_c_l264_c9_cb41]
signal result_MUX_uxn_c_l264_c9_cb41_cond : unsigned(0 downto 0);
signal result_MUX_uxn_c_l264_c9_cb41_iftrue : unsigned(15 downto 0);
signal result_MUX_uxn_c_l264_c9_cb41_iffalse : unsigned(15 downto 0);
signal result_MUX_uxn_c_l264_c9_cb41_return_output : unsigned(15 downto 0);

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
-- color0_MUX_uxn_c_l191_c2_23ab
color0_MUX_uxn_c_l191_c2_23ab : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color0_MUX_uxn_c_l191_c2_23ab_cond,
color0_MUX_uxn_c_l191_c2_23ab_iftrue,
color0_MUX_uxn_c_l191_c2_23ab_iffalse,
color0_MUX_uxn_c_l191_c2_23ab_return_output);

-- color3_MUX_uxn_c_l191_c2_23ab
color3_MUX_uxn_c_l191_c2_23ab : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color3_MUX_uxn_c_l191_c2_23ab_cond,
color3_MUX_uxn_c_l191_c2_23ab_iftrue,
color3_MUX_uxn_c_l191_c2_23ab_iffalse,
color3_MUX_uxn_c_l191_c2_23ab_return_output);

-- color1_MUX_uxn_c_l191_c2_23ab
color1_MUX_uxn_c_l191_c2_23ab : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color1_MUX_uxn_c_l191_c2_23ab_cond,
color1_MUX_uxn_c_l191_c2_23ab_iftrue,
color1_MUX_uxn_c_l191_c2_23ab_iffalse,
color1_MUX_uxn_c_l191_c2_23ab_return_output);

-- color_cmp_0_MUX_uxn_c_l191_c2_23ab
color_cmp_0_MUX_uxn_c_l191_c2_23ab : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_cmp_0_MUX_uxn_c_l191_c2_23ab_cond,
color_cmp_0_MUX_uxn_c_l191_c2_23ab_iftrue,
color_cmp_0_MUX_uxn_c_l191_c2_23ab_iffalse,
color_cmp_0_MUX_uxn_c_l191_c2_23ab_return_output);

-- tmp12_MUX_uxn_c_l191_c2_23ab
tmp12_MUX_uxn_c_l191_c2_23ab : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_c_l191_c2_23ab_cond,
tmp12_MUX_uxn_c_l191_c2_23ab_iftrue,
tmp12_MUX_uxn_c_l191_c2_23ab_iffalse,
tmp12_MUX_uxn_c_l191_c2_23ab_return_output);

-- color_cmp_1_MUX_uxn_c_l191_c2_23ab
color_cmp_1_MUX_uxn_c_l191_c2_23ab : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_cmp_1_MUX_uxn_c_l191_c2_23ab_cond,
color_cmp_1_MUX_uxn_c_l191_c2_23ab_iftrue,
color_cmp_1_MUX_uxn_c_l191_c2_23ab_iffalse,
color_cmp_1_MUX_uxn_c_l191_c2_23ab_return_output);

-- color2_MUX_uxn_c_l191_c2_23ab
color2_MUX_uxn_c_l191_c2_23ab : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color2_MUX_uxn_c_l191_c2_23ab_cond,
color2_MUX_uxn_c_l191_c2_23ab_iftrue,
color2_MUX_uxn_c_l191_c2_23ab_iffalse,
color2_MUX_uxn_c_l191_c2_23ab_return_output);

-- CONST_SR_4_uxn_c_l192_c27_fc5f
CONST_SR_4_uxn_c_l192_c27_fc5f : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_c_l192_c27_fc5f_x,
CONST_SR_4_uxn_c_l192_c27_fc5f_return_output);

-- BIN_OP_EQ_uxn_c_l194_c7_7696
BIN_OP_EQ_uxn_c_l194_c7_7696 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l194_c7_7696_left,
BIN_OP_EQ_uxn_c_l194_c7_7696_right,
BIN_OP_EQ_uxn_c_l194_c7_7696_return_output);

-- color0_MUX_uxn_c_l194_c3_b2e4
color0_MUX_uxn_c_l194_c3_b2e4 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color0_MUX_uxn_c_l194_c3_b2e4_cond,
color0_MUX_uxn_c_l194_c3_b2e4_iftrue,
color0_MUX_uxn_c_l194_c3_b2e4_iffalse,
color0_MUX_uxn_c_l194_c3_b2e4_return_output);

-- color3_MUX_uxn_c_l194_c3_b2e4
color3_MUX_uxn_c_l194_c3_b2e4 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color3_MUX_uxn_c_l194_c3_b2e4_cond,
color3_MUX_uxn_c_l194_c3_b2e4_iftrue,
color3_MUX_uxn_c_l194_c3_b2e4_iffalse,
color3_MUX_uxn_c_l194_c3_b2e4_return_output);

-- color1_MUX_uxn_c_l194_c3_b2e4
color1_MUX_uxn_c_l194_c3_b2e4 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color1_MUX_uxn_c_l194_c3_b2e4_cond,
color1_MUX_uxn_c_l194_c3_b2e4_iftrue,
color1_MUX_uxn_c_l194_c3_b2e4_iffalse,
color1_MUX_uxn_c_l194_c3_b2e4_return_output);

-- tmp12_MUX_uxn_c_l194_c3_b2e4
tmp12_MUX_uxn_c_l194_c3_b2e4 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_c_l194_c3_b2e4_cond,
tmp12_MUX_uxn_c_l194_c3_b2e4_iftrue,
tmp12_MUX_uxn_c_l194_c3_b2e4_iffalse,
tmp12_MUX_uxn_c_l194_c3_b2e4_return_output);

-- color2_MUX_uxn_c_l194_c3_b2e4
color2_MUX_uxn_c_l194_c3_b2e4 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color2_MUX_uxn_c_l194_c3_b2e4_cond,
color2_MUX_uxn_c_l194_c3_b2e4_iftrue,
color2_MUX_uxn_c_l194_c3_b2e4_iffalse,
color2_MUX_uxn_c_l194_c3_b2e4_return_output);

-- CONST_SL_8_uxn_c_l196_c4_b60f
CONST_SL_8_uxn_c_l196_c4_b60f : entity work.CONST_SL_8_uint12_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l196_c4_b60f_x,
CONST_SL_8_uxn_c_l196_c4_b60f_return_output);

-- BIN_OP_AND_uxn_c_l197_c4_f591
BIN_OP_AND_uxn_c_l197_c4_f591 : entity work.BIN_OP_AND_uint12_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l197_c4_f591_left,
BIN_OP_AND_uxn_c_l197_c4_f591_right,
BIN_OP_AND_uxn_c_l197_c4_f591_return_output);

-- BIN_OP_OR_uxn_c_l198_c4_5323
BIN_OP_OR_uxn_c_l198_c4_5323 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l198_c4_5323_left,
BIN_OP_OR_uxn_c_l198_c4_5323_right,
BIN_OP_OR_uxn_c_l198_c4_5323_return_output);

-- CONST_SL_8_uxn_c_l201_c4_33d7
CONST_SL_8_uxn_c_l201_c4_33d7 : entity work.CONST_SL_8_uint12_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l201_c4_33d7_x,
CONST_SL_8_uxn_c_l201_c4_33d7_return_output);

-- BIN_OP_AND_uxn_c_l202_c4_afb3
BIN_OP_AND_uxn_c_l202_c4_afb3 : entity work.BIN_OP_AND_uint12_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l202_c4_afb3_left,
BIN_OP_AND_uxn_c_l202_c4_afb3_right,
BIN_OP_AND_uxn_c_l202_c4_afb3_return_output);

-- BIN_OP_OR_uxn_c_l203_c4_afed
BIN_OP_OR_uxn_c_l203_c4_afed : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l203_c4_afed_left,
BIN_OP_OR_uxn_c_l203_c4_afed_right,
BIN_OP_OR_uxn_c_l203_c4_afed_return_output);

-- BIN_OP_EQ_uxn_c_l205_c12_e4e7
BIN_OP_EQ_uxn_c_l205_c12_e4e7 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l205_c12_e4e7_left,
BIN_OP_EQ_uxn_c_l205_c12_e4e7_right,
BIN_OP_EQ_uxn_c_l205_c12_e4e7_return_output);

-- color0_MUX_uxn_c_l205_c8_5ce7
color0_MUX_uxn_c_l205_c8_5ce7 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color0_MUX_uxn_c_l205_c8_5ce7_cond,
color0_MUX_uxn_c_l205_c8_5ce7_iftrue,
color0_MUX_uxn_c_l205_c8_5ce7_iffalse,
color0_MUX_uxn_c_l205_c8_5ce7_return_output);

-- color3_MUX_uxn_c_l205_c8_5ce7
color3_MUX_uxn_c_l205_c8_5ce7 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color3_MUX_uxn_c_l205_c8_5ce7_cond,
color3_MUX_uxn_c_l205_c8_5ce7_iftrue,
color3_MUX_uxn_c_l205_c8_5ce7_iffalse,
color3_MUX_uxn_c_l205_c8_5ce7_return_output);

-- color1_MUX_uxn_c_l205_c8_5ce7
color1_MUX_uxn_c_l205_c8_5ce7 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color1_MUX_uxn_c_l205_c8_5ce7_cond,
color1_MUX_uxn_c_l205_c8_5ce7_iftrue,
color1_MUX_uxn_c_l205_c8_5ce7_iffalse,
color1_MUX_uxn_c_l205_c8_5ce7_return_output);

-- tmp12_MUX_uxn_c_l205_c8_5ce7
tmp12_MUX_uxn_c_l205_c8_5ce7 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_c_l205_c8_5ce7_cond,
tmp12_MUX_uxn_c_l205_c8_5ce7_iftrue,
tmp12_MUX_uxn_c_l205_c8_5ce7_iffalse,
tmp12_MUX_uxn_c_l205_c8_5ce7_return_output);

-- color2_MUX_uxn_c_l205_c8_5ce7
color2_MUX_uxn_c_l205_c8_5ce7 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color2_MUX_uxn_c_l205_c8_5ce7_cond,
color2_MUX_uxn_c_l205_c8_5ce7_iftrue,
color2_MUX_uxn_c_l205_c8_5ce7_iffalse,
color2_MUX_uxn_c_l205_c8_5ce7_return_output);

-- CONST_SL_8_uxn_c_l207_c4_f9e0
CONST_SL_8_uxn_c_l207_c4_f9e0 : entity work.CONST_SL_8_uint12_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l207_c4_f9e0_x,
CONST_SL_8_uxn_c_l207_c4_f9e0_return_output);

-- BIN_OP_AND_uxn_c_l208_c4_215b
BIN_OP_AND_uxn_c_l208_c4_215b : entity work.BIN_OP_AND_uint12_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l208_c4_215b_left,
BIN_OP_AND_uxn_c_l208_c4_215b_right,
BIN_OP_AND_uxn_c_l208_c4_215b_return_output);

-- BIN_OP_OR_uxn_c_l209_c4_cdcb
BIN_OP_OR_uxn_c_l209_c4_cdcb : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l209_c4_cdcb_left,
BIN_OP_OR_uxn_c_l209_c4_cdcb_right,
BIN_OP_OR_uxn_c_l209_c4_cdcb_return_output);

-- CONST_SL_8_uxn_c_l212_c4_af15
CONST_SL_8_uxn_c_l212_c4_af15 : entity work.CONST_SL_8_uint12_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l212_c4_af15_x,
CONST_SL_8_uxn_c_l212_c4_af15_return_output);

-- BIN_OP_AND_uxn_c_l213_c4_feef
BIN_OP_AND_uxn_c_l213_c4_feef : entity work.BIN_OP_AND_uint12_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l213_c4_feef_left,
BIN_OP_AND_uxn_c_l213_c4_feef_right,
BIN_OP_AND_uxn_c_l213_c4_feef_return_output);

-- BIN_OP_OR_uxn_c_l214_c4_7ae1
BIN_OP_OR_uxn_c_l214_c4_7ae1 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l214_c4_7ae1_left,
BIN_OP_OR_uxn_c_l214_c4_7ae1_right,
BIN_OP_OR_uxn_c_l214_c4_7ae1_return_output);

-- BIN_OP_EQ_uxn_c_l216_c12_6bce
BIN_OP_EQ_uxn_c_l216_c12_6bce : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l216_c12_6bce_left,
BIN_OP_EQ_uxn_c_l216_c12_6bce_right,
BIN_OP_EQ_uxn_c_l216_c12_6bce_return_output);

-- color0_MUX_uxn_c_l216_c8_6e97
color0_MUX_uxn_c_l216_c8_6e97 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color0_MUX_uxn_c_l216_c8_6e97_cond,
color0_MUX_uxn_c_l216_c8_6e97_iftrue,
color0_MUX_uxn_c_l216_c8_6e97_iffalse,
color0_MUX_uxn_c_l216_c8_6e97_return_output);

-- color3_MUX_uxn_c_l216_c8_6e97
color3_MUX_uxn_c_l216_c8_6e97 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color3_MUX_uxn_c_l216_c8_6e97_cond,
color3_MUX_uxn_c_l216_c8_6e97_iftrue,
color3_MUX_uxn_c_l216_c8_6e97_iffalse,
color3_MUX_uxn_c_l216_c8_6e97_return_output);

-- color1_MUX_uxn_c_l216_c8_6e97
color1_MUX_uxn_c_l216_c8_6e97 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color1_MUX_uxn_c_l216_c8_6e97_cond,
color1_MUX_uxn_c_l216_c8_6e97_iftrue,
color1_MUX_uxn_c_l216_c8_6e97_iffalse,
color1_MUX_uxn_c_l216_c8_6e97_return_output);

-- tmp12_MUX_uxn_c_l216_c8_6e97
tmp12_MUX_uxn_c_l216_c8_6e97 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_c_l216_c8_6e97_cond,
tmp12_MUX_uxn_c_l216_c8_6e97_iftrue,
tmp12_MUX_uxn_c_l216_c8_6e97_iffalse,
tmp12_MUX_uxn_c_l216_c8_6e97_return_output);

-- color2_MUX_uxn_c_l216_c8_6e97
color2_MUX_uxn_c_l216_c8_6e97 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color2_MUX_uxn_c_l216_c8_6e97_cond,
color2_MUX_uxn_c_l216_c8_6e97_iftrue,
color2_MUX_uxn_c_l216_c8_6e97_iffalse,
color2_MUX_uxn_c_l216_c8_6e97_return_output);

-- CONST_SL_4_uxn_c_l218_c4_76de
CONST_SL_4_uxn_c_l218_c4_76de : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_c_l218_c4_76de_x,
CONST_SL_4_uxn_c_l218_c4_76de_return_output);

-- BIN_OP_AND_uxn_c_l219_c4_f7b0
BIN_OP_AND_uxn_c_l219_c4_f7b0 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l219_c4_f7b0_left,
BIN_OP_AND_uxn_c_l219_c4_f7b0_right,
BIN_OP_AND_uxn_c_l219_c4_f7b0_return_output);

-- BIN_OP_OR_uxn_c_l220_c4_d06e
BIN_OP_OR_uxn_c_l220_c4_d06e : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l220_c4_d06e_left,
BIN_OP_OR_uxn_c_l220_c4_d06e_right,
BIN_OP_OR_uxn_c_l220_c4_d06e_return_output);

-- CONST_SL_4_uxn_c_l223_c4_65cf
CONST_SL_4_uxn_c_l223_c4_65cf : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_c_l223_c4_65cf_x,
CONST_SL_4_uxn_c_l223_c4_65cf_return_output);

-- BIN_OP_AND_uxn_c_l224_c4_63f9
BIN_OP_AND_uxn_c_l224_c4_63f9 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l224_c4_63f9_left,
BIN_OP_AND_uxn_c_l224_c4_63f9_right,
BIN_OP_AND_uxn_c_l224_c4_63f9_return_output);

-- BIN_OP_OR_uxn_c_l225_c4_2618
BIN_OP_OR_uxn_c_l225_c4_2618 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l225_c4_2618_left,
BIN_OP_OR_uxn_c_l225_c4_2618_right,
BIN_OP_OR_uxn_c_l225_c4_2618_return_output);

-- BIN_OP_EQ_uxn_c_l227_c12_634c
BIN_OP_EQ_uxn_c_l227_c12_634c : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l227_c12_634c_left,
BIN_OP_EQ_uxn_c_l227_c12_634c_right,
BIN_OP_EQ_uxn_c_l227_c12_634c_return_output);

-- color0_MUX_uxn_c_l227_c8_54ba
color0_MUX_uxn_c_l227_c8_54ba : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color0_MUX_uxn_c_l227_c8_54ba_cond,
color0_MUX_uxn_c_l227_c8_54ba_iftrue,
color0_MUX_uxn_c_l227_c8_54ba_iffalse,
color0_MUX_uxn_c_l227_c8_54ba_return_output);

-- color3_MUX_uxn_c_l227_c8_54ba
color3_MUX_uxn_c_l227_c8_54ba : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color3_MUX_uxn_c_l227_c8_54ba_cond,
color3_MUX_uxn_c_l227_c8_54ba_iftrue,
color3_MUX_uxn_c_l227_c8_54ba_iffalse,
color3_MUX_uxn_c_l227_c8_54ba_return_output);

-- color1_MUX_uxn_c_l227_c8_54ba
color1_MUX_uxn_c_l227_c8_54ba : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color1_MUX_uxn_c_l227_c8_54ba_cond,
color1_MUX_uxn_c_l227_c8_54ba_iftrue,
color1_MUX_uxn_c_l227_c8_54ba_iffalse,
color1_MUX_uxn_c_l227_c8_54ba_return_output);

-- tmp12_MUX_uxn_c_l227_c8_54ba
tmp12_MUX_uxn_c_l227_c8_54ba : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_c_l227_c8_54ba_cond,
tmp12_MUX_uxn_c_l227_c8_54ba_iftrue,
tmp12_MUX_uxn_c_l227_c8_54ba_iffalse,
tmp12_MUX_uxn_c_l227_c8_54ba_return_output);

-- color2_MUX_uxn_c_l227_c8_54ba
color2_MUX_uxn_c_l227_c8_54ba : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color2_MUX_uxn_c_l227_c8_54ba_cond,
color2_MUX_uxn_c_l227_c8_54ba_iftrue,
color2_MUX_uxn_c_l227_c8_54ba_iffalse,
color2_MUX_uxn_c_l227_c8_54ba_return_output);

-- CONST_SL_4_uxn_c_l229_c4_08cf
CONST_SL_4_uxn_c_l229_c4_08cf : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_c_l229_c4_08cf_x,
CONST_SL_4_uxn_c_l229_c4_08cf_return_output);

-- BIN_OP_AND_uxn_c_l230_c4_c55c
BIN_OP_AND_uxn_c_l230_c4_c55c : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l230_c4_c55c_left,
BIN_OP_AND_uxn_c_l230_c4_c55c_right,
BIN_OP_AND_uxn_c_l230_c4_c55c_return_output);

-- BIN_OP_OR_uxn_c_l231_c4_a52e
BIN_OP_OR_uxn_c_l231_c4_a52e : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l231_c4_a52e_left,
BIN_OP_OR_uxn_c_l231_c4_a52e_right,
BIN_OP_OR_uxn_c_l231_c4_a52e_return_output);

-- CONST_SL_4_uxn_c_l234_c4_bdce
CONST_SL_4_uxn_c_l234_c4_bdce : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_c_l234_c4_bdce_x,
CONST_SL_4_uxn_c_l234_c4_bdce_return_output);

-- BIN_OP_AND_uxn_c_l235_c4_2ff2
BIN_OP_AND_uxn_c_l235_c4_2ff2 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l235_c4_2ff2_left,
BIN_OP_AND_uxn_c_l235_c4_2ff2_right,
BIN_OP_AND_uxn_c_l235_c4_2ff2_return_output);

-- BIN_OP_OR_uxn_c_l236_c4_c7ef
BIN_OP_OR_uxn_c_l236_c4_c7ef : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l236_c4_c7ef_left,
BIN_OP_OR_uxn_c_l236_c4_c7ef_right,
BIN_OP_OR_uxn_c_l236_c4_c7ef_return_output);

-- BIN_OP_EQ_uxn_c_l238_c12_3482
BIN_OP_EQ_uxn_c_l238_c12_3482 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l238_c12_3482_left,
BIN_OP_EQ_uxn_c_l238_c12_3482_right,
BIN_OP_EQ_uxn_c_l238_c12_3482_return_output);

-- color0_MUX_uxn_c_l238_c8_ccac
color0_MUX_uxn_c_l238_c8_ccac : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color0_MUX_uxn_c_l238_c8_ccac_cond,
color0_MUX_uxn_c_l238_c8_ccac_iftrue,
color0_MUX_uxn_c_l238_c8_ccac_iffalse,
color0_MUX_uxn_c_l238_c8_ccac_return_output);

-- color3_MUX_uxn_c_l238_c8_ccac
color3_MUX_uxn_c_l238_c8_ccac : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color3_MUX_uxn_c_l238_c8_ccac_cond,
color3_MUX_uxn_c_l238_c8_ccac_iftrue,
color3_MUX_uxn_c_l238_c8_ccac_iffalse,
color3_MUX_uxn_c_l238_c8_ccac_return_output);

-- color1_MUX_uxn_c_l238_c8_ccac
color1_MUX_uxn_c_l238_c8_ccac : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color1_MUX_uxn_c_l238_c8_ccac_cond,
color1_MUX_uxn_c_l238_c8_ccac_iftrue,
color1_MUX_uxn_c_l238_c8_ccac_iffalse,
color1_MUX_uxn_c_l238_c8_ccac_return_output);

-- tmp12_MUX_uxn_c_l238_c8_ccac
tmp12_MUX_uxn_c_l238_c8_ccac : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_c_l238_c8_ccac_cond,
tmp12_MUX_uxn_c_l238_c8_ccac_iftrue,
tmp12_MUX_uxn_c_l238_c8_ccac_iffalse,
tmp12_MUX_uxn_c_l238_c8_ccac_return_output);

-- color2_MUX_uxn_c_l238_c8_ccac
color2_MUX_uxn_c_l238_c8_ccac : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color2_MUX_uxn_c_l238_c8_ccac_cond,
color2_MUX_uxn_c_l238_c8_ccac_iftrue,
color2_MUX_uxn_c_l238_c8_ccac_iffalse,
color2_MUX_uxn_c_l238_c8_ccac_return_output);

-- BIN_OP_AND_uxn_c_l240_c4_b95a
BIN_OP_AND_uxn_c_l240_c4_b95a : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l240_c4_b95a_left,
BIN_OP_AND_uxn_c_l240_c4_b95a_right,
BIN_OP_AND_uxn_c_l240_c4_b95a_return_output);

-- BIN_OP_OR_uxn_c_l241_c4_e4b7
BIN_OP_OR_uxn_c_l241_c4_e4b7 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l241_c4_e4b7_left,
BIN_OP_OR_uxn_c_l241_c4_e4b7_right,
BIN_OP_OR_uxn_c_l241_c4_e4b7_return_output);

-- BIN_OP_AND_uxn_c_l244_c4_f703
BIN_OP_AND_uxn_c_l244_c4_f703 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l244_c4_f703_left,
BIN_OP_AND_uxn_c_l244_c4_f703_right,
BIN_OP_AND_uxn_c_l244_c4_f703_return_output);

-- BIN_OP_OR_uxn_c_l245_c4_a9b9
BIN_OP_OR_uxn_c_l245_c4_a9b9 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l245_c4_a9b9_left,
BIN_OP_OR_uxn_c_l245_c4_a9b9_right,
BIN_OP_OR_uxn_c_l245_c4_a9b9_return_output);

-- BIN_OP_EQ_uxn_c_l247_c12_ae01
BIN_OP_EQ_uxn_c_l247_c12_ae01 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l247_c12_ae01_left,
BIN_OP_EQ_uxn_c_l247_c12_ae01_right,
BIN_OP_EQ_uxn_c_l247_c12_ae01_return_output);

-- color3_MUX_uxn_c_l247_c8_0cec
color3_MUX_uxn_c_l247_c8_0cec : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color3_MUX_uxn_c_l247_c8_0cec_cond,
color3_MUX_uxn_c_l247_c8_0cec_iftrue,
color3_MUX_uxn_c_l247_c8_0cec_iffalse,
color3_MUX_uxn_c_l247_c8_0cec_return_output);

-- tmp12_MUX_uxn_c_l247_c8_0cec
tmp12_MUX_uxn_c_l247_c8_0cec : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_c_l247_c8_0cec_cond,
tmp12_MUX_uxn_c_l247_c8_0cec_iftrue,
tmp12_MUX_uxn_c_l247_c8_0cec_iffalse,
tmp12_MUX_uxn_c_l247_c8_0cec_return_output);

-- color2_MUX_uxn_c_l247_c8_0cec
color2_MUX_uxn_c_l247_c8_0cec : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color2_MUX_uxn_c_l247_c8_0cec_cond,
color2_MUX_uxn_c_l247_c8_0cec_iftrue,
color2_MUX_uxn_c_l247_c8_0cec_iffalse,
color2_MUX_uxn_c_l247_c8_0cec_return_output);

-- BIN_OP_AND_uxn_c_l249_c4_8e91
BIN_OP_AND_uxn_c_l249_c4_8e91 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l249_c4_8e91_left,
BIN_OP_AND_uxn_c_l249_c4_8e91_right,
BIN_OP_AND_uxn_c_l249_c4_8e91_return_output);

-- BIN_OP_OR_uxn_c_l250_c4_d98e
BIN_OP_OR_uxn_c_l250_c4_d98e : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l250_c4_d98e_left,
BIN_OP_OR_uxn_c_l250_c4_d98e_right,
BIN_OP_OR_uxn_c_l250_c4_d98e_return_output);

-- BIN_OP_AND_uxn_c_l253_c4_63ad
BIN_OP_AND_uxn_c_l253_c4_63ad : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l253_c4_63ad_left,
BIN_OP_AND_uxn_c_l253_c4_63ad_right,
BIN_OP_AND_uxn_c_l253_c4_63ad_return_output);

-- BIN_OP_OR_uxn_c_l254_c4_169b
BIN_OP_OR_uxn_c_l254_c4_169b : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l254_c4_169b_left,
BIN_OP_OR_uxn_c_l254_c4_169b_right,
BIN_OP_OR_uxn_c_l254_c4_169b_return_output);

-- BIN_OP_EQ_uxn_c_l260_c6_aa2e
BIN_OP_EQ_uxn_c_l260_c6_aa2e : entity work.BIN_OP_EQ_uint2_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l260_c6_aa2e_left,
BIN_OP_EQ_uxn_c_l260_c6_aa2e_right,
BIN_OP_EQ_uxn_c_l260_c6_aa2e_return_output);

-- result_MUX_uxn_c_l260_c2_32f9
result_MUX_uxn_c_l260_c2_32f9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_MUX_uxn_c_l260_c2_32f9_cond,
result_MUX_uxn_c_l260_c2_32f9_iftrue,
result_MUX_uxn_c_l260_c2_32f9_iffalse,
result_MUX_uxn_c_l260_c2_32f9_return_output);

-- BIN_OP_EQ_uxn_c_l262_c13_d97b
BIN_OP_EQ_uxn_c_l262_c13_d97b : entity work.BIN_OP_EQ_uint2_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l262_c13_d97b_left,
BIN_OP_EQ_uxn_c_l262_c13_d97b_right,
BIN_OP_EQ_uxn_c_l262_c13_d97b_return_output);

-- result_MUX_uxn_c_l262_c9_9504
result_MUX_uxn_c_l262_c9_9504 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_MUX_uxn_c_l262_c9_9504_cond,
result_MUX_uxn_c_l262_c9_9504_iftrue,
result_MUX_uxn_c_l262_c9_9504_iffalse,
result_MUX_uxn_c_l262_c9_9504_return_output);

-- BIN_OP_EQ_uxn_c_l264_c13_2860
BIN_OP_EQ_uxn_c_l264_c13_2860 : entity work.BIN_OP_EQ_uint2_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l264_c13_2860_left,
BIN_OP_EQ_uxn_c_l264_c13_2860_right,
BIN_OP_EQ_uxn_c_l264_c13_2860_return_output);

-- result_MUX_uxn_c_l264_c9_cb41
result_MUX_uxn_c_l264_c9_cb41 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_MUX_uxn_c_l264_c9_cb41_cond,
result_MUX_uxn_c_l264_c9_cb41_iftrue,
result_MUX_uxn_c_l264_c9_cb41_iffalse,
result_MUX_uxn_c_l264_c9_cb41_return_output);



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
 color0_MUX_uxn_c_l191_c2_23ab_return_output,
 color3_MUX_uxn_c_l191_c2_23ab_return_output,
 color1_MUX_uxn_c_l191_c2_23ab_return_output,
 color_cmp_0_MUX_uxn_c_l191_c2_23ab_return_output,
 tmp12_MUX_uxn_c_l191_c2_23ab_return_output,
 color_cmp_1_MUX_uxn_c_l191_c2_23ab_return_output,
 color2_MUX_uxn_c_l191_c2_23ab_return_output,
 CONST_SR_4_uxn_c_l192_c27_fc5f_return_output,
 BIN_OP_EQ_uxn_c_l194_c7_7696_return_output,
 color0_MUX_uxn_c_l194_c3_b2e4_return_output,
 color3_MUX_uxn_c_l194_c3_b2e4_return_output,
 color1_MUX_uxn_c_l194_c3_b2e4_return_output,
 tmp12_MUX_uxn_c_l194_c3_b2e4_return_output,
 color2_MUX_uxn_c_l194_c3_b2e4_return_output,
 CONST_SL_8_uxn_c_l196_c4_b60f_return_output,
 BIN_OP_AND_uxn_c_l197_c4_f591_return_output,
 BIN_OP_OR_uxn_c_l198_c4_5323_return_output,
 CONST_SL_8_uxn_c_l201_c4_33d7_return_output,
 BIN_OP_AND_uxn_c_l202_c4_afb3_return_output,
 BIN_OP_OR_uxn_c_l203_c4_afed_return_output,
 BIN_OP_EQ_uxn_c_l205_c12_e4e7_return_output,
 color0_MUX_uxn_c_l205_c8_5ce7_return_output,
 color3_MUX_uxn_c_l205_c8_5ce7_return_output,
 color1_MUX_uxn_c_l205_c8_5ce7_return_output,
 tmp12_MUX_uxn_c_l205_c8_5ce7_return_output,
 color2_MUX_uxn_c_l205_c8_5ce7_return_output,
 CONST_SL_8_uxn_c_l207_c4_f9e0_return_output,
 BIN_OP_AND_uxn_c_l208_c4_215b_return_output,
 BIN_OP_OR_uxn_c_l209_c4_cdcb_return_output,
 CONST_SL_8_uxn_c_l212_c4_af15_return_output,
 BIN_OP_AND_uxn_c_l213_c4_feef_return_output,
 BIN_OP_OR_uxn_c_l214_c4_7ae1_return_output,
 BIN_OP_EQ_uxn_c_l216_c12_6bce_return_output,
 color0_MUX_uxn_c_l216_c8_6e97_return_output,
 color3_MUX_uxn_c_l216_c8_6e97_return_output,
 color1_MUX_uxn_c_l216_c8_6e97_return_output,
 tmp12_MUX_uxn_c_l216_c8_6e97_return_output,
 color2_MUX_uxn_c_l216_c8_6e97_return_output,
 CONST_SL_4_uxn_c_l218_c4_76de_return_output,
 BIN_OP_AND_uxn_c_l219_c4_f7b0_return_output,
 BIN_OP_OR_uxn_c_l220_c4_d06e_return_output,
 CONST_SL_4_uxn_c_l223_c4_65cf_return_output,
 BIN_OP_AND_uxn_c_l224_c4_63f9_return_output,
 BIN_OP_OR_uxn_c_l225_c4_2618_return_output,
 BIN_OP_EQ_uxn_c_l227_c12_634c_return_output,
 color0_MUX_uxn_c_l227_c8_54ba_return_output,
 color3_MUX_uxn_c_l227_c8_54ba_return_output,
 color1_MUX_uxn_c_l227_c8_54ba_return_output,
 tmp12_MUX_uxn_c_l227_c8_54ba_return_output,
 color2_MUX_uxn_c_l227_c8_54ba_return_output,
 CONST_SL_4_uxn_c_l229_c4_08cf_return_output,
 BIN_OP_AND_uxn_c_l230_c4_c55c_return_output,
 BIN_OP_OR_uxn_c_l231_c4_a52e_return_output,
 CONST_SL_4_uxn_c_l234_c4_bdce_return_output,
 BIN_OP_AND_uxn_c_l235_c4_2ff2_return_output,
 BIN_OP_OR_uxn_c_l236_c4_c7ef_return_output,
 BIN_OP_EQ_uxn_c_l238_c12_3482_return_output,
 color0_MUX_uxn_c_l238_c8_ccac_return_output,
 color3_MUX_uxn_c_l238_c8_ccac_return_output,
 color1_MUX_uxn_c_l238_c8_ccac_return_output,
 tmp12_MUX_uxn_c_l238_c8_ccac_return_output,
 color2_MUX_uxn_c_l238_c8_ccac_return_output,
 BIN_OP_AND_uxn_c_l240_c4_b95a_return_output,
 BIN_OP_OR_uxn_c_l241_c4_e4b7_return_output,
 BIN_OP_AND_uxn_c_l244_c4_f703_return_output,
 BIN_OP_OR_uxn_c_l245_c4_a9b9_return_output,
 BIN_OP_EQ_uxn_c_l247_c12_ae01_return_output,
 color3_MUX_uxn_c_l247_c8_0cec_return_output,
 tmp12_MUX_uxn_c_l247_c8_0cec_return_output,
 color2_MUX_uxn_c_l247_c8_0cec_return_output,
 BIN_OP_AND_uxn_c_l249_c4_8e91_return_output,
 BIN_OP_OR_uxn_c_l250_c4_d98e_return_output,
 BIN_OP_AND_uxn_c_l253_c4_63ad_return_output,
 BIN_OP_OR_uxn_c_l254_c4_169b_return_output,
 BIN_OP_EQ_uxn_c_l260_c6_aa2e_return_output,
 result_MUX_uxn_c_l260_c2_32f9_return_output,
 BIN_OP_EQ_uxn_c_l262_c13_d97b_return_output,
 result_MUX_uxn_c_l262_c9_9504_return_output,
 BIN_OP_EQ_uxn_c_l264_c13_2860_return_output,
 result_MUX_uxn_c_l264_c9_cb41_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_device_ram_address : unsigned(7 downto 0);
 variable VAR_device_ram_value : unsigned(7 downto 0);
 variable VAR_is_device_ram_write : unsigned(0 downto 0);
 variable VAR_gpu_step_color : unsigned(1 downto 0);
 variable VAR_color0_MUX_uxn_c_l191_c2_23ab_iftrue : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l194_c3_b2e4_return_output : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l191_c2_23ab_iffalse : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l191_c2_23ab_return_output : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l191_c2_23ab_cond : unsigned(0 downto 0);
 variable VAR_color3_MUX_uxn_c_l191_c2_23ab_iftrue : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l194_c3_b2e4_return_output : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l191_c2_23ab_iffalse : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l191_c2_23ab_return_output : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l191_c2_23ab_cond : unsigned(0 downto 0);
 variable VAR_color1_MUX_uxn_c_l191_c2_23ab_iftrue : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l194_c3_b2e4_return_output : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l191_c2_23ab_iffalse : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l191_c2_23ab_return_output : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l191_c2_23ab_cond : unsigned(0 downto 0);
 variable VAR_color_cmp_0_MUX_uxn_c_l191_c2_23ab_iftrue : unsigned(3 downto 0);
 variable VAR_color_cmp_0_uxn_c_l192_c3_c755 : unsigned(3 downto 0);
 variable VAR_color_cmp_0_MUX_uxn_c_l191_c2_23ab_iffalse : unsigned(3 downto 0);
 variable VAR_color_cmp_0_MUX_uxn_c_l191_c2_23ab_return_output : unsigned(3 downto 0);
 variable VAR_color_cmp_0_MUX_uxn_c_l191_c2_23ab_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l191_c2_23ab_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l194_c3_b2e4_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l191_c2_23ab_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l191_c2_23ab_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l191_c2_23ab_cond : unsigned(0 downto 0);
 variable VAR_color_cmp_1_MUX_uxn_c_l191_c2_23ab_iftrue : unsigned(3 downto 0);
 variable VAR_color_cmp_1_uxn_c_l193_c3_83ad : unsigned(3 downto 0);
 variable VAR_color_cmp_1_MUX_uxn_c_l191_c2_23ab_iffalse : unsigned(3 downto 0);
 variable VAR_color_cmp_1_MUX_uxn_c_l191_c2_23ab_return_output : unsigned(3 downto 0);
 variable VAR_color_cmp_1_MUX_uxn_c_l191_c2_23ab_cond : unsigned(0 downto 0);
 variable VAR_color2_MUX_uxn_c_l191_c2_23ab_iftrue : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l194_c3_b2e4_return_output : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l191_c2_23ab_iffalse : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l191_c2_23ab_return_output : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l191_c2_23ab_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_4_uxn_c_l192_c27_fc5f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_c_l192_c27_fc5f_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_c_l192_c17_51d3_return_output : unsigned(3 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_c_l193_c17_8e04_return_output : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l194_c7_7696_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l194_c7_7696_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l194_c7_7696_return_output : unsigned(0 downto 0);
 variable VAR_color0_MUX_uxn_c_l194_c3_b2e4_iftrue : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l194_c3_b2e4_iffalse : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l205_c8_5ce7_return_output : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l194_c3_b2e4_cond : unsigned(0 downto 0);
 variable VAR_color3_MUX_uxn_c_l194_c3_b2e4_iftrue : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l194_c3_b2e4_iffalse : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l205_c8_5ce7_return_output : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l194_c3_b2e4_cond : unsigned(0 downto 0);
 variable VAR_color1_MUX_uxn_c_l194_c3_b2e4_iftrue : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l194_c3_b2e4_iffalse : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l205_c8_5ce7_return_output : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l194_c3_b2e4_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l194_c3_b2e4_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l194_c3_b2e4_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l205_c8_5ce7_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l194_c3_b2e4_cond : unsigned(0 downto 0);
 variable VAR_color2_MUX_uxn_c_l194_c3_b2e4_iftrue : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l194_c3_b2e4_iffalse : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l205_c8_5ce7_return_output : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l194_c3_b2e4_cond : unsigned(0 downto 0);
 variable VAR_tmp12_uxn_c_l195_c4_894c : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l196_c4_b60f_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l196_c4_b60f_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l197_c4_f591_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l197_c4_f591_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l197_c4_f591_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l198_c4_5323_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l198_c4_5323_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l198_c4_5323_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_uxn_c_l200_c4_3e2c : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l201_c4_33d7_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l201_c4_33d7_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l202_c4_afb3_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l202_c4_afb3_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l202_c4_afb3_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l203_c4_afed_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l203_c4_afed_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l203_c4_afed_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l205_c12_e4e7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l205_c12_e4e7_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l205_c12_e4e7_return_output : unsigned(0 downto 0);
 variable VAR_color0_MUX_uxn_c_l205_c8_5ce7_iftrue : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l205_c8_5ce7_iffalse : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l216_c8_6e97_return_output : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l205_c8_5ce7_cond : unsigned(0 downto 0);
 variable VAR_color3_MUX_uxn_c_l205_c8_5ce7_iftrue : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l205_c8_5ce7_iffalse : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l216_c8_6e97_return_output : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l205_c8_5ce7_cond : unsigned(0 downto 0);
 variable VAR_color1_MUX_uxn_c_l205_c8_5ce7_iftrue : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l205_c8_5ce7_iffalse : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l216_c8_6e97_return_output : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l205_c8_5ce7_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l205_c8_5ce7_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l205_c8_5ce7_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l216_c8_6e97_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l205_c8_5ce7_cond : unsigned(0 downto 0);
 variable VAR_color2_MUX_uxn_c_l205_c8_5ce7_iftrue : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l205_c8_5ce7_iffalse : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l216_c8_6e97_return_output : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l205_c8_5ce7_cond : unsigned(0 downto 0);
 variable VAR_tmp12_uxn_c_l206_c4_509f : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l207_c4_f9e0_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l207_c4_f9e0_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l208_c4_215b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l208_c4_215b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l208_c4_215b_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l209_c4_cdcb_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l209_c4_cdcb_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l209_c4_cdcb_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_uxn_c_l211_c4_4836 : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l212_c4_af15_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l212_c4_af15_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l213_c4_feef_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l213_c4_feef_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l213_c4_feef_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l214_c4_7ae1_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l214_c4_7ae1_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l214_c4_7ae1_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l216_c12_6bce_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l216_c12_6bce_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l216_c12_6bce_return_output : unsigned(0 downto 0);
 variable VAR_color0_MUX_uxn_c_l216_c8_6e97_iftrue : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l216_c8_6e97_iffalse : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l227_c8_54ba_return_output : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l216_c8_6e97_cond : unsigned(0 downto 0);
 variable VAR_color3_MUX_uxn_c_l216_c8_6e97_iftrue : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l216_c8_6e97_iffalse : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l227_c8_54ba_return_output : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l216_c8_6e97_cond : unsigned(0 downto 0);
 variable VAR_color1_MUX_uxn_c_l216_c8_6e97_iftrue : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l216_c8_6e97_iffalse : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l227_c8_54ba_return_output : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l216_c8_6e97_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l216_c8_6e97_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l216_c8_6e97_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l227_c8_54ba_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l216_c8_6e97_cond : unsigned(0 downto 0);
 variable VAR_color2_MUX_uxn_c_l216_c8_6e97_iftrue : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l216_c8_6e97_iffalse : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l227_c8_54ba_return_output : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l216_c8_6e97_cond : unsigned(0 downto 0);
 variable VAR_tmp12_uxn_c_l217_c4_2374 : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l218_c4_76de_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l218_c4_76de_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l219_c4_f7b0_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l219_c4_f7b0_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l219_c4_f7b0_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l220_c4_d06e_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l220_c4_d06e_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l220_c4_d06e_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_uxn_c_l222_c4_b2d4 : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l223_c4_65cf_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l223_c4_65cf_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l224_c4_63f9_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l224_c4_63f9_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l224_c4_63f9_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l225_c4_2618_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l225_c4_2618_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l225_c4_2618_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l227_c12_634c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l227_c12_634c_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l227_c12_634c_return_output : unsigned(0 downto 0);
 variable VAR_color0_MUX_uxn_c_l227_c8_54ba_iftrue : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l227_c8_54ba_iffalse : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l238_c8_ccac_return_output : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l227_c8_54ba_cond : unsigned(0 downto 0);
 variable VAR_color3_MUX_uxn_c_l227_c8_54ba_iftrue : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l227_c8_54ba_iffalse : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l238_c8_ccac_return_output : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l227_c8_54ba_cond : unsigned(0 downto 0);
 variable VAR_color1_MUX_uxn_c_l227_c8_54ba_iftrue : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l227_c8_54ba_iffalse : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l238_c8_ccac_return_output : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l227_c8_54ba_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l227_c8_54ba_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l227_c8_54ba_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l238_c8_ccac_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l227_c8_54ba_cond : unsigned(0 downto 0);
 variable VAR_color2_MUX_uxn_c_l227_c8_54ba_iftrue : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l227_c8_54ba_iffalse : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l238_c8_ccac_return_output : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l227_c8_54ba_cond : unsigned(0 downto 0);
 variable VAR_tmp12_uxn_c_l228_c4_2850 : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l229_c4_08cf_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l229_c4_08cf_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l230_c4_c55c_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l230_c4_c55c_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l230_c4_c55c_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l231_c4_a52e_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l231_c4_a52e_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l231_c4_a52e_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_uxn_c_l233_c4_d354 : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l234_c4_bdce_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l234_c4_bdce_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l235_c4_2ff2_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l235_c4_2ff2_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l235_c4_2ff2_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l236_c4_c7ef_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l236_c4_c7ef_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l236_c4_c7ef_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l238_c12_3482_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l238_c12_3482_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l238_c12_3482_return_output : unsigned(0 downto 0);
 variable VAR_color0_MUX_uxn_c_l238_c8_ccac_iftrue : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l238_c8_ccac_iffalse : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l238_c8_ccac_cond : unsigned(0 downto 0);
 variable VAR_color3_MUX_uxn_c_l238_c8_ccac_iftrue : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l238_c8_ccac_iffalse : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l247_c8_0cec_return_output : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l238_c8_ccac_cond : unsigned(0 downto 0);
 variable VAR_color1_MUX_uxn_c_l238_c8_ccac_iftrue : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l238_c8_ccac_iffalse : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l238_c8_ccac_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l238_c8_ccac_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l238_c8_ccac_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l247_c8_0cec_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l238_c8_ccac_cond : unsigned(0 downto 0);
 variable VAR_color2_MUX_uxn_c_l238_c8_ccac_iftrue : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l238_c8_ccac_iffalse : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l247_c8_0cec_return_output : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l238_c8_ccac_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l240_c4_b95a_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l240_c4_b95a_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l240_c4_b95a_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l241_c4_e4b7_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l241_c4_e4b7_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l241_c4_e4b7_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l244_c4_f703_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l244_c4_f703_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l244_c4_f703_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l245_c4_a9b9_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l245_c4_a9b9_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l245_c4_a9b9_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l247_c12_ae01_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l247_c12_ae01_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l247_c12_ae01_return_output : unsigned(0 downto 0);
 variable VAR_color3_MUX_uxn_c_l247_c8_0cec_iftrue : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l247_c8_0cec_iffalse : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l247_c8_0cec_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l247_c8_0cec_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l247_c8_0cec_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l247_c8_0cec_cond : unsigned(0 downto 0);
 variable VAR_color2_MUX_uxn_c_l247_c8_0cec_iftrue : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l247_c8_0cec_iffalse : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l247_c8_0cec_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l249_c4_8e91_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l249_c4_8e91_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l249_c4_8e91_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l250_c4_d98e_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l250_c4_d98e_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l250_c4_d98e_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l253_c4_63ad_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l253_c4_63ad_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l253_c4_63ad_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l254_c4_169b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l254_c4_169b_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l254_c4_169b_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l260_c6_aa2e_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l260_c6_aa2e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l260_c6_aa2e_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_c_l260_c2_32f9_iftrue : unsigned(15 downto 0);
 variable VAR_result_uxn_c_l261_c3_b99a : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l260_c2_32f9_iffalse : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l262_c9_9504_return_output : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l260_c2_32f9_return_output : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l260_c2_32f9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l262_c13_d97b_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l262_c13_d97b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l262_c13_d97b_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_c_l262_c9_9504_iftrue : unsigned(15 downto 0);
 variable VAR_result_uxn_c_l263_c3_fd28 : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l262_c9_9504_iffalse : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l264_c9_cb41_return_output : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l262_c9_9504_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l264_c13_2860_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l264_c13_2860_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l264_c13_2860_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_c_l264_c9_cb41_iftrue : unsigned(15 downto 0);
 variable VAR_result_uxn_c_l265_c3_d6e5 : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l264_c9_cb41_iffalse : unsigned(15 downto 0);
 variable VAR_result_uxn_c_l267_c3_c68b : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l264_c9_cb41_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l248_l239_DUPLICATE_5139_return_output : unsigned(11 downto 0);
 variable VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l243_l252_DUPLICATE_4932_return_output : unsigned(11 downto 0);
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
     VAR_BIN_OP_EQ_uxn_c_l262_c13_d97b_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l194_c7_7696_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_c_l227_c12_634c_right := to_unsigned(11, 4);
     VAR_BIN_OP_AND_uxn_c_l219_c4_f7b0_right := to_unsigned(3855, 12);
     VAR_BIN_OP_AND_uxn_c_l253_c4_63ad_right := to_unsigned(4080, 12);
     VAR_BIN_OP_AND_uxn_c_l244_c4_f703_right := to_unsigned(4080, 12);
     VAR_BIN_OP_EQ_uxn_c_l260_c6_aa2e_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l216_c12_6bce_right := to_unsigned(10, 4);
     VAR_BIN_OP_AND_uxn_c_l208_c4_215b_right := to_unsigned(255, 8);
     VAR_BIN_OP_AND_uxn_c_l197_c4_f591_right := to_unsigned(255, 8);
     VAR_BIN_OP_AND_uxn_c_l213_c4_feef_right := to_unsigned(255, 8);
     VAR_BIN_OP_EQ_uxn_c_l247_c12_ae01_right := to_unsigned(13, 4);
     VAR_BIN_OP_AND_uxn_c_l240_c4_b95a_right := to_unsigned(4080, 12);
     VAR_BIN_OP_EQ_uxn_c_l264_c13_2860_right := to_unsigned(2, 2);
     VAR_BIN_OP_AND_uxn_c_l230_c4_c55c_right := to_unsigned(3855, 12);
     VAR_BIN_OP_AND_uxn_c_l235_c4_2ff2_right := to_unsigned(3855, 12);
     VAR_BIN_OP_EQ_uxn_c_l238_c12_3482_right := to_unsigned(12, 4);
     VAR_BIN_OP_EQ_uxn_c_l205_c12_e4e7_right := to_unsigned(9, 4);
     VAR_BIN_OP_AND_uxn_c_l224_c4_63f9_right := to_unsigned(3855, 12);
     VAR_BIN_OP_AND_uxn_c_l249_c4_8e91_right := to_unsigned(4080, 12);
     VAR_BIN_OP_AND_uxn_c_l202_c4_afb3_right := to_unsigned(255, 8);

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
     VAR_BIN_OP_AND_uxn_c_l197_c4_f591_left := color0;
     VAR_BIN_OP_AND_uxn_c_l219_c4_f7b0_left := color0;
     VAR_BIN_OP_AND_uxn_c_l240_c4_b95a_left := color0;
     VAR_color0_MUX_uxn_c_l191_c2_23ab_iffalse := color0;
     VAR_color0_MUX_uxn_c_l205_c8_5ce7_iftrue := color0;
     VAR_color0_MUX_uxn_c_l227_c8_54ba_iftrue := color0;
     VAR_color0_MUX_uxn_c_l238_c8_ccac_iffalse := color0;
     VAR_BIN_OP_AND_uxn_c_l202_c4_afb3_left := color1;
     VAR_BIN_OP_AND_uxn_c_l224_c4_63f9_left := color1;
     VAR_BIN_OP_AND_uxn_c_l244_c4_f703_left := color1;
     VAR_color1_MUX_uxn_c_l191_c2_23ab_iffalse := color1;
     VAR_color1_MUX_uxn_c_l205_c8_5ce7_iftrue := color1;
     VAR_color1_MUX_uxn_c_l227_c8_54ba_iftrue := color1;
     VAR_color1_MUX_uxn_c_l238_c8_ccac_iffalse := color1;
     VAR_BIN_OP_AND_uxn_c_l208_c4_215b_left := color2;
     VAR_BIN_OP_AND_uxn_c_l230_c4_c55c_left := color2;
     VAR_BIN_OP_AND_uxn_c_l249_c4_8e91_left := color2;
     VAR_color2_MUX_uxn_c_l191_c2_23ab_iffalse := color2;
     VAR_color2_MUX_uxn_c_l194_c3_b2e4_iftrue := color2;
     VAR_color2_MUX_uxn_c_l216_c8_6e97_iftrue := color2;
     VAR_color2_MUX_uxn_c_l238_c8_ccac_iftrue := color2;
     VAR_color2_MUX_uxn_c_l247_c8_0cec_iffalse := color2;
     VAR_BIN_OP_AND_uxn_c_l213_c4_feef_left := color3;
     VAR_BIN_OP_AND_uxn_c_l235_c4_2ff2_left := color3;
     VAR_BIN_OP_AND_uxn_c_l253_c4_63ad_left := color3;
     VAR_color3_MUX_uxn_c_l191_c2_23ab_iffalse := color3;
     VAR_color3_MUX_uxn_c_l194_c3_b2e4_iftrue := color3;
     VAR_color3_MUX_uxn_c_l216_c8_6e97_iftrue := color3;
     VAR_color3_MUX_uxn_c_l238_c8_ccac_iftrue := color3;
     VAR_color3_MUX_uxn_c_l247_c8_0cec_iffalse := color3;
     VAR_color_cmp_0_MUX_uxn_c_l191_c2_23ab_iffalse := color_cmp_0;
     VAR_color_cmp_1_MUX_uxn_c_l191_c2_23ab_iffalse := color_cmp_1;
     VAR_BIN_OP_EQ_uxn_c_l194_c7_7696_left := VAR_device_ram_address;
     VAR_BIN_OP_EQ_uxn_c_l205_c12_e4e7_left := VAR_device_ram_address;
     VAR_BIN_OP_EQ_uxn_c_l216_c12_6bce_left := VAR_device_ram_address;
     VAR_BIN_OP_EQ_uxn_c_l227_c12_634c_left := VAR_device_ram_address;
     VAR_BIN_OP_EQ_uxn_c_l238_c12_3482_left := VAR_device_ram_address;
     VAR_BIN_OP_EQ_uxn_c_l247_c12_ae01_left := VAR_device_ram_address;
     VAR_CONST_SR_4_uxn_c_l192_c27_fc5f_x := VAR_device_ram_value;
     VAR_BIN_OP_EQ_uxn_c_l260_c6_aa2e_left := VAR_gpu_step_color;
     VAR_BIN_OP_EQ_uxn_c_l262_c13_d97b_left := VAR_gpu_step_color;
     VAR_BIN_OP_EQ_uxn_c_l264_c13_2860_left := VAR_gpu_step_color;
     VAR_color0_MUX_uxn_c_l191_c2_23ab_cond := VAR_is_device_ram_write;
     VAR_color1_MUX_uxn_c_l191_c2_23ab_cond := VAR_is_device_ram_write;
     VAR_color2_MUX_uxn_c_l191_c2_23ab_cond := VAR_is_device_ram_write;
     VAR_color3_MUX_uxn_c_l191_c2_23ab_cond := VAR_is_device_ram_write;
     VAR_color_cmp_0_MUX_uxn_c_l191_c2_23ab_cond := VAR_is_device_ram_write;
     VAR_color_cmp_1_MUX_uxn_c_l191_c2_23ab_cond := VAR_is_device_ram_write;
     VAR_tmp12_MUX_uxn_c_l191_c2_23ab_cond := VAR_is_device_ram_write;
     VAR_tmp12_MUX_uxn_c_l191_c2_23ab_iffalse := tmp12;
     VAR_tmp12_MUX_uxn_c_l247_c8_0cec_iffalse := tmp12;
     -- BIN_OP_EQ[uxn_c_l238_c12_3482] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l238_c12_3482_left <= VAR_BIN_OP_EQ_uxn_c_l238_c12_3482_left;
     BIN_OP_EQ_uxn_c_l238_c12_3482_right <= VAR_BIN_OP_EQ_uxn_c_l238_c12_3482_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l238_c12_3482_return_output := BIN_OP_EQ_uxn_c_l238_c12_3482_return_output;

     -- BIN_OP_EQ[uxn_c_l262_c13_d97b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l262_c13_d97b_left <= VAR_BIN_OP_EQ_uxn_c_l262_c13_d97b_left;
     BIN_OP_EQ_uxn_c_l262_c13_d97b_right <= VAR_BIN_OP_EQ_uxn_c_l262_c13_d97b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l262_c13_d97b_return_output := BIN_OP_EQ_uxn_c_l262_c13_d97b_return_output;

     -- BIN_OP_AND[uxn_c_l240_c4_b95a] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l240_c4_b95a_left <= VAR_BIN_OP_AND_uxn_c_l240_c4_b95a_left;
     BIN_OP_AND_uxn_c_l240_c4_b95a_right <= VAR_BIN_OP_AND_uxn_c_l240_c4_b95a_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l240_c4_b95a_return_output := BIN_OP_AND_uxn_c_l240_c4_b95a_return_output;

     -- BIN_OP_EQ[uxn_c_l205_c12_e4e7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l205_c12_e4e7_left <= VAR_BIN_OP_EQ_uxn_c_l205_c12_e4e7_left;
     BIN_OP_EQ_uxn_c_l205_c12_e4e7_right <= VAR_BIN_OP_EQ_uxn_c_l205_c12_e4e7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l205_c12_e4e7_return_output := BIN_OP_EQ_uxn_c_l205_c12_e4e7_return_output;

     -- BIN_OP_AND[uxn_c_l253_c4_63ad] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l253_c4_63ad_left <= VAR_BIN_OP_AND_uxn_c_l253_c4_63ad_left;
     BIN_OP_AND_uxn_c_l253_c4_63ad_right <= VAR_BIN_OP_AND_uxn_c_l253_c4_63ad_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l253_c4_63ad_return_output := BIN_OP_AND_uxn_c_l253_c4_63ad_return_output;

     -- BIN_OP_AND[uxn_c_l235_c4_2ff2] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l235_c4_2ff2_left <= VAR_BIN_OP_AND_uxn_c_l235_c4_2ff2_left;
     BIN_OP_AND_uxn_c_l235_c4_2ff2_right <= VAR_BIN_OP_AND_uxn_c_l235_c4_2ff2_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l235_c4_2ff2_return_output := BIN_OP_AND_uxn_c_l235_c4_2ff2_return_output;

     -- BIN_OP_AND[uxn_c_l230_c4_c55c] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l230_c4_c55c_left <= VAR_BIN_OP_AND_uxn_c_l230_c4_c55c_left;
     BIN_OP_AND_uxn_c_l230_c4_c55c_right <= VAR_BIN_OP_AND_uxn_c_l230_c4_c55c_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l230_c4_c55c_return_output := BIN_OP_AND_uxn_c_l230_c4_c55c_return_output;

     -- BIN_OP_AND[uxn_c_l224_c4_63f9] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l224_c4_63f9_left <= VAR_BIN_OP_AND_uxn_c_l224_c4_63f9_left;
     BIN_OP_AND_uxn_c_l224_c4_63f9_right <= VAR_BIN_OP_AND_uxn_c_l224_c4_63f9_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l224_c4_63f9_return_output := BIN_OP_AND_uxn_c_l224_c4_63f9_return_output;

     -- BIN_OP_AND[uxn_c_l219_c4_f7b0] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l219_c4_f7b0_left <= VAR_BIN_OP_AND_uxn_c_l219_c4_f7b0_left;
     BIN_OP_AND_uxn_c_l219_c4_f7b0_right <= VAR_BIN_OP_AND_uxn_c_l219_c4_f7b0_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l219_c4_f7b0_return_output := BIN_OP_AND_uxn_c_l219_c4_f7b0_return_output;

     -- BIN_OP_AND[uxn_c_l244_c4_f703] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l244_c4_f703_left <= VAR_BIN_OP_AND_uxn_c_l244_c4_f703_left;
     BIN_OP_AND_uxn_c_l244_c4_f703_right <= VAR_BIN_OP_AND_uxn_c_l244_c4_f703_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l244_c4_f703_return_output := BIN_OP_AND_uxn_c_l244_c4_f703_return_output;

     -- BIN_OP_EQ[uxn_c_l227_c12_634c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l227_c12_634c_left <= VAR_BIN_OP_EQ_uxn_c_l227_c12_634c_left;
     BIN_OP_EQ_uxn_c_l227_c12_634c_right <= VAR_BIN_OP_EQ_uxn_c_l227_c12_634c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l227_c12_634c_return_output := BIN_OP_EQ_uxn_c_l227_c12_634c_return_output;

     -- BIN_OP_EQ[uxn_c_l216_c12_6bce] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l216_c12_6bce_left <= VAR_BIN_OP_EQ_uxn_c_l216_c12_6bce_left;
     BIN_OP_EQ_uxn_c_l216_c12_6bce_right <= VAR_BIN_OP_EQ_uxn_c_l216_c12_6bce_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l216_c12_6bce_return_output := BIN_OP_EQ_uxn_c_l216_c12_6bce_return_output;

     -- BIN_OP_AND[uxn_c_l213_c4_feef] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l213_c4_feef_left <= VAR_BIN_OP_AND_uxn_c_l213_c4_feef_left;
     BIN_OP_AND_uxn_c_l213_c4_feef_right <= VAR_BIN_OP_AND_uxn_c_l213_c4_feef_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l213_c4_feef_return_output := BIN_OP_AND_uxn_c_l213_c4_feef_return_output;

     -- CAST_TO_uint4_t[uxn_c_l193_c17_8e04] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_c_l193_c17_8e04_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_device_ram_value);

     -- BIN_OP_AND[uxn_c_l197_c4_f591] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l197_c4_f591_left <= VAR_BIN_OP_AND_uxn_c_l197_c4_f591_left;
     BIN_OP_AND_uxn_c_l197_c4_f591_right <= VAR_BIN_OP_AND_uxn_c_l197_c4_f591_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l197_c4_f591_return_output := BIN_OP_AND_uxn_c_l197_c4_f591_return_output;

     -- BIN_OP_EQ[uxn_c_l247_c12_ae01] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l247_c12_ae01_left <= VAR_BIN_OP_EQ_uxn_c_l247_c12_ae01_left;
     BIN_OP_EQ_uxn_c_l247_c12_ae01_right <= VAR_BIN_OP_EQ_uxn_c_l247_c12_ae01_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l247_c12_ae01_return_output := BIN_OP_EQ_uxn_c_l247_c12_ae01_return_output;

     -- BIN_OP_EQ[uxn_c_l264_c13_2860] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l264_c13_2860_left <= VAR_BIN_OP_EQ_uxn_c_l264_c13_2860_left;
     BIN_OP_EQ_uxn_c_l264_c13_2860_right <= VAR_BIN_OP_EQ_uxn_c_l264_c13_2860_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l264_c13_2860_return_output := BIN_OP_EQ_uxn_c_l264_c13_2860_return_output;

     -- CONST_SR_4[uxn_c_l192_c27_fc5f] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_c_l192_c27_fc5f_x <= VAR_CONST_SR_4_uxn_c_l192_c27_fc5f_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_c_l192_c27_fc5f_return_output := CONST_SR_4_uxn_c_l192_c27_fc5f_return_output;

     -- BIN_OP_EQ[uxn_c_l260_c6_aa2e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l260_c6_aa2e_left <= VAR_BIN_OP_EQ_uxn_c_l260_c6_aa2e_left;
     BIN_OP_EQ_uxn_c_l260_c6_aa2e_right <= VAR_BIN_OP_EQ_uxn_c_l260_c6_aa2e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l260_c6_aa2e_return_output := BIN_OP_EQ_uxn_c_l260_c6_aa2e_return_output;

     -- BIN_OP_AND[uxn_c_l249_c4_8e91] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l249_c4_8e91_left <= VAR_BIN_OP_AND_uxn_c_l249_c4_8e91_left;
     BIN_OP_AND_uxn_c_l249_c4_8e91_right <= VAR_BIN_OP_AND_uxn_c_l249_c4_8e91_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l249_c4_8e91_return_output := BIN_OP_AND_uxn_c_l249_c4_8e91_return_output;

     -- BIN_OP_AND[uxn_c_l202_c4_afb3] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l202_c4_afb3_left <= VAR_BIN_OP_AND_uxn_c_l202_c4_afb3_left;
     BIN_OP_AND_uxn_c_l202_c4_afb3_right <= VAR_BIN_OP_AND_uxn_c_l202_c4_afb3_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l202_c4_afb3_return_output := BIN_OP_AND_uxn_c_l202_c4_afb3_return_output;

     -- BIN_OP_EQ[uxn_c_l194_c7_7696] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l194_c7_7696_left <= VAR_BIN_OP_EQ_uxn_c_l194_c7_7696_left;
     BIN_OP_EQ_uxn_c_l194_c7_7696_right <= VAR_BIN_OP_EQ_uxn_c_l194_c7_7696_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l194_c7_7696_return_output := BIN_OP_EQ_uxn_c_l194_c7_7696_return_output;

     -- BIN_OP_AND[uxn_c_l208_c4_215b] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l208_c4_215b_left <= VAR_BIN_OP_AND_uxn_c_l208_c4_215b_left;
     BIN_OP_AND_uxn_c_l208_c4_215b_right <= VAR_BIN_OP_AND_uxn_c_l208_c4_215b_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l208_c4_215b_return_output := BIN_OP_AND_uxn_c_l208_c4_215b_return_output;

     -- Submodule level 1
     VAR_BIN_OP_OR_uxn_c_l198_c4_5323_left := VAR_BIN_OP_AND_uxn_c_l197_c4_f591_return_output;
     VAR_BIN_OP_OR_uxn_c_l203_c4_afed_left := VAR_BIN_OP_AND_uxn_c_l202_c4_afb3_return_output;
     VAR_BIN_OP_OR_uxn_c_l209_c4_cdcb_left := VAR_BIN_OP_AND_uxn_c_l208_c4_215b_return_output;
     VAR_BIN_OP_OR_uxn_c_l214_c4_7ae1_left := VAR_BIN_OP_AND_uxn_c_l213_c4_feef_return_output;
     VAR_BIN_OP_OR_uxn_c_l220_c4_d06e_left := VAR_BIN_OP_AND_uxn_c_l219_c4_f7b0_return_output;
     VAR_BIN_OP_OR_uxn_c_l225_c4_2618_left := VAR_BIN_OP_AND_uxn_c_l224_c4_63f9_return_output;
     VAR_BIN_OP_OR_uxn_c_l231_c4_a52e_left := VAR_BIN_OP_AND_uxn_c_l230_c4_c55c_return_output;
     VAR_BIN_OP_OR_uxn_c_l236_c4_c7ef_left := VAR_BIN_OP_AND_uxn_c_l235_c4_2ff2_return_output;
     VAR_BIN_OP_OR_uxn_c_l241_c4_e4b7_left := VAR_BIN_OP_AND_uxn_c_l240_c4_b95a_return_output;
     VAR_BIN_OP_OR_uxn_c_l245_c4_a9b9_left := VAR_BIN_OP_AND_uxn_c_l244_c4_f703_return_output;
     VAR_BIN_OP_OR_uxn_c_l250_c4_d98e_left := VAR_BIN_OP_AND_uxn_c_l249_c4_8e91_return_output;
     VAR_BIN_OP_OR_uxn_c_l254_c4_169b_left := VAR_BIN_OP_AND_uxn_c_l253_c4_63ad_return_output;
     VAR_color0_MUX_uxn_c_l194_c3_b2e4_cond := VAR_BIN_OP_EQ_uxn_c_l194_c7_7696_return_output;
     VAR_color1_MUX_uxn_c_l194_c3_b2e4_cond := VAR_BIN_OP_EQ_uxn_c_l194_c7_7696_return_output;
     VAR_color2_MUX_uxn_c_l194_c3_b2e4_cond := VAR_BIN_OP_EQ_uxn_c_l194_c7_7696_return_output;
     VAR_color3_MUX_uxn_c_l194_c3_b2e4_cond := VAR_BIN_OP_EQ_uxn_c_l194_c7_7696_return_output;
     VAR_tmp12_MUX_uxn_c_l194_c3_b2e4_cond := VAR_BIN_OP_EQ_uxn_c_l194_c7_7696_return_output;
     VAR_color0_MUX_uxn_c_l205_c8_5ce7_cond := VAR_BIN_OP_EQ_uxn_c_l205_c12_e4e7_return_output;
     VAR_color1_MUX_uxn_c_l205_c8_5ce7_cond := VAR_BIN_OP_EQ_uxn_c_l205_c12_e4e7_return_output;
     VAR_color2_MUX_uxn_c_l205_c8_5ce7_cond := VAR_BIN_OP_EQ_uxn_c_l205_c12_e4e7_return_output;
     VAR_color3_MUX_uxn_c_l205_c8_5ce7_cond := VAR_BIN_OP_EQ_uxn_c_l205_c12_e4e7_return_output;
     VAR_tmp12_MUX_uxn_c_l205_c8_5ce7_cond := VAR_BIN_OP_EQ_uxn_c_l205_c12_e4e7_return_output;
     VAR_color0_MUX_uxn_c_l216_c8_6e97_cond := VAR_BIN_OP_EQ_uxn_c_l216_c12_6bce_return_output;
     VAR_color1_MUX_uxn_c_l216_c8_6e97_cond := VAR_BIN_OP_EQ_uxn_c_l216_c12_6bce_return_output;
     VAR_color2_MUX_uxn_c_l216_c8_6e97_cond := VAR_BIN_OP_EQ_uxn_c_l216_c12_6bce_return_output;
     VAR_color3_MUX_uxn_c_l216_c8_6e97_cond := VAR_BIN_OP_EQ_uxn_c_l216_c12_6bce_return_output;
     VAR_tmp12_MUX_uxn_c_l216_c8_6e97_cond := VAR_BIN_OP_EQ_uxn_c_l216_c12_6bce_return_output;
     VAR_color0_MUX_uxn_c_l227_c8_54ba_cond := VAR_BIN_OP_EQ_uxn_c_l227_c12_634c_return_output;
     VAR_color1_MUX_uxn_c_l227_c8_54ba_cond := VAR_BIN_OP_EQ_uxn_c_l227_c12_634c_return_output;
     VAR_color2_MUX_uxn_c_l227_c8_54ba_cond := VAR_BIN_OP_EQ_uxn_c_l227_c12_634c_return_output;
     VAR_color3_MUX_uxn_c_l227_c8_54ba_cond := VAR_BIN_OP_EQ_uxn_c_l227_c12_634c_return_output;
     VAR_tmp12_MUX_uxn_c_l227_c8_54ba_cond := VAR_BIN_OP_EQ_uxn_c_l227_c12_634c_return_output;
     VAR_color0_MUX_uxn_c_l238_c8_ccac_cond := VAR_BIN_OP_EQ_uxn_c_l238_c12_3482_return_output;
     VAR_color1_MUX_uxn_c_l238_c8_ccac_cond := VAR_BIN_OP_EQ_uxn_c_l238_c12_3482_return_output;
     VAR_color2_MUX_uxn_c_l238_c8_ccac_cond := VAR_BIN_OP_EQ_uxn_c_l238_c12_3482_return_output;
     VAR_color3_MUX_uxn_c_l238_c8_ccac_cond := VAR_BIN_OP_EQ_uxn_c_l238_c12_3482_return_output;
     VAR_tmp12_MUX_uxn_c_l238_c8_ccac_cond := VAR_BIN_OP_EQ_uxn_c_l238_c12_3482_return_output;
     VAR_color2_MUX_uxn_c_l247_c8_0cec_cond := VAR_BIN_OP_EQ_uxn_c_l247_c12_ae01_return_output;
     VAR_color3_MUX_uxn_c_l247_c8_0cec_cond := VAR_BIN_OP_EQ_uxn_c_l247_c12_ae01_return_output;
     VAR_tmp12_MUX_uxn_c_l247_c8_0cec_cond := VAR_BIN_OP_EQ_uxn_c_l247_c12_ae01_return_output;
     VAR_result_MUX_uxn_c_l260_c2_32f9_cond := VAR_BIN_OP_EQ_uxn_c_l260_c6_aa2e_return_output;
     VAR_result_MUX_uxn_c_l262_c9_9504_cond := VAR_BIN_OP_EQ_uxn_c_l262_c13_d97b_return_output;
     VAR_result_MUX_uxn_c_l264_c9_cb41_cond := VAR_BIN_OP_EQ_uxn_c_l264_c13_2860_return_output;
     VAR_color_cmp_1_uxn_c_l193_c3_83ad := VAR_CAST_TO_uint4_t_uxn_c_l193_c17_8e04_return_output;
     VAR_color_cmp_1_MUX_uxn_c_l191_c2_23ab_iftrue := VAR_color_cmp_1_uxn_c_l193_c3_83ad;
     VAR_tmp12_uxn_c_l200_c4_3e2c := resize(VAR_color_cmp_1_uxn_c_l193_c3_83ad, 12);
     VAR_tmp12_uxn_c_l211_c4_4836 := resize(VAR_color_cmp_1_uxn_c_l193_c3_83ad, 12);
     VAR_tmp12_uxn_c_l222_c4_b2d4 := resize(VAR_color_cmp_1_uxn_c_l193_c3_83ad, 12);
     VAR_tmp12_uxn_c_l233_c4_d354 := resize(VAR_color_cmp_1_uxn_c_l193_c3_83ad, 12);
     VAR_CONST_SL_8_uxn_c_l201_c4_33d7_x := VAR_tmp12_uxn_c_l200_c4_3e2c;
     VAR_CONST_SL_8_uxn_c_l212_c4_af15_x := VAR_tmp12_uxn_c_l211_c4_4836;
     VAR_CONST_SL_4_uxn_c_l223_c4_65cf_x := VAR_tmp12_uxn_c_l222_c4_b2d4;
     VAR_CONST_SL_4_uxn_c_l234_c4_bdce_x := VAR_tmp12_uxn_c_l233_c4_d354;
     -- CONST_SL_4[uxn_c_l223_c4_65cf] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_c_l223_c4_65cf_x <= VAR_CONST_SL_4_uxn_c_l223_c4_65cf_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_c_l223_c4_65cf_return_output := CONST_SL_4_uxn_c_l223_c4_65cf_return_output;

     -- CONST_SL_8[uxn_c_l212_c4_af15] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l212_c4_af15_x <= VAR_CONST_SL_8_uxn_c_l212_c4_af15_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l212_c4_af15_return_output := CONST_SL_8_uxn_c_l212_c4_af15_return_output;

     -- CONST_SL_8[uxn_c_l201_c4_33d7] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l201_c4_33d7_x <= VAR_CONST_SL_8_uxn_c_l201_c4_33d7_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l201_c4_33d7_return_output := CONST_SL_8_uxn_c_l201_c4_33d7_return_output;

     -- CONST_SL_4[uxn_c_l234_c4_bdce] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_c_l234_c4_bdce_x <= VAR_CONST_SL_4_uxn_c_l234_c4_bdce_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_c_l234_c4_bdce_return_output := CONST_SL_4_uxn_c_l234_c4_bdce_return_output;

     -- color_cmp_1_MUX[uxn_c_l191_c2_23ab] LATENCY=0
     -- Inputs
     color_cmp_1_MUX_uxn_c_l191_c2_23ab_cond <= VAR_color_cmp_1_MUX_uxn_c_l191_c2_23ab_cond;
     color_cmp_1_MUX_uxn_c_l191_c2_23ab_iftrue <= VAR_color_cmp_1_MUX_uxn_c_l191_c2_23ab_iftrue;
     color_cmp_1_MUX_uxn_c_l191_c2_23ab_iffalse <= VAR_color_cmp_1_MUX_uxn_c_l191_c2_23ab_iffalse;
     -- Outputs
     VAR_color_cmp_1_MUX_uxn_c_l191_c2_23ab_return_output := color_cmp_1_MUX_uxn_c_l191_c2_23ab_return_output;

     -- CAST_TO_uint4_t[uxn_c_l192_c17_51d3] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_c_l192_c17_51d3_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_CONST_SR_4_uxn_c_l192_c27_fc5f_return_output);

     -- CAST_TO_uint12_t_uint4_t_uxn_c_l243_l252_DUPLICATE_4932 LATENCY=0
     VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l243_l252_DUPLICATE_4932_return_output := CAST_TO_uint12_t_uint4_t(
     VAR_color_cmp_1_uxn_c_l193_c3_83ad);

     -- Submodule level 2
     VAR_BIN_OP_OR_uxn_c_l245_c4_a9b9_right := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l243_l252_DUPLICATE_4932_return_output;
     VAR_BIN_OP_OR_uxn_c_l254_c4_169b_right := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l243_l252_DUPLICATE_4932_return_output;
     VAR_tmp12_MUX_uxn_c_l238_c8_ccac_iftrue := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l243_l252_DUPLICATE_4932_return_output;
     VAR_tmp12_MUX_uxn_c_l247_c8_0cec_iftrue := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l243_l252_DUPLICATE_4932_return_output;
     VAR_color_cmp_0_uxn_c_l192_c3_c755 := VAR_CAST_TO_uint4_t_uxn_c_l192_c17_51d3_return_output;
     VAR_BIN_OP_OR_uxn_c_l225_c4_2618_right := VAR_CONST_SL_4_uxn_c_l223_c4_65cf_return_output;
     VAR_tmp12_MUX_uxn_c_l216_c8_6e97_iftrue := VAR_CONST_SL_4_uxn_c_l223_c4_65cf_return_output;
     VAR_BIN_OP_OR_uxn_c_l236_c4_c7ef_right := VAR_CONST_SL_4_uxn_c_l234_c4_bdce_return_output;
     VAR_tmp12_MUX_uxn_c_l227_c8_54ba_iftrue := VAR_CONST_SL_4_uxn_c_l234_c4_bdce_return_output;
     VAR_BIN_OP_OR_uxn_c_l203_c4_afed_right := VAR_CONST_SL_8_uxn_c_l201_c4_33d7_return_output;
     VAR_tmp12_MUX_uxn_c_l194_c3_b2e4_iftrue := VAR_CONST_SL_8_uxn_c_l201_c4_33d7_return_output;
     VAR_BIN_OP_OR_uxn_c_l214_c4_7ae1_right := VAR_CONST_SL_8_uxn_c_l212_c4_af15_return_output;
     VAR_tmp12_MUX_uxn_c_l205_c8_5ce7_iftrue := VAR_CONST_SL_8_uxn_c_l212_c4_af15_return_output;
     REG_VAR_color_cmp_1 := VAR_color_cmp_1_MUX_uxn_c_l191_c2_23ab_return_output;
     VAR_color_cmp_0_MUX_uxn_c_l191_c2_23ab_iftrue := VAR_color_cmp_0_uxn_c_l192_c3_c755;
     VAR_tmp12_uxn_c_l195_c4_894c := resize(VAR_color_cmp_0_uxn_c_l192_c3_c755, 12);
     VAR_tmp12_uxn_c_l206_c4_509f := resize(VAR_color_cmp_0_uxn_c_l192_c3_c755, 12);
     VAR_tmp12_uxn_c_l217_c4_2374 := resize(VAR_color_cmp_0_uxn_c_l192_c3_c755, 12);
     VAR_tmp12_uxn_c_l228_c4_2850 := resize(VAR_color_cmp_0_uxn_c_l192_c3_c755, 12);
     VAR_CONST_SL_8_uxn_c_l196_c4_b60f_x := VAR_tmp12_uxn_c_l195_c4_894c;
     VAR_CONST_SL_8_uxn_c_l207_c4_f9e0_x := VAR_tmp12_uxn_c_l206_c4_509f;
     VAR_CONST_SL_4_uxn_c_l218_c4_76de_x := VAR_tmp12_uxn_c_l217_c4_2374;
     VAR_CONST_SL_4_uxn_c_l229_c4_08cf_x := VAR_tmp12_uxn_c_l228_c4_2850;
     -- BIN_OP_OR[uxn_c_l214_c4_7ae1] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l214_c4_7ae1_left <= VAR_BIN_OP_OR_uxn_c_l214_c4_7ae1_left;
     BIN_OP_OR_uxn_c_l214_c4_7ae1_right <= VAR_BIN_OP_OR_uxn_c_l214_c4_7ae1_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l214_c4_7ae1_return_output := BIN_OP_OR_uxn_c_l214_c4_7ae1_return_output;

     -- BIN_OP_OR[uxn_c_l254_c4_169b] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l254_c4_169b_left <= VAR_BIN_OP_OR_uxn_c_l254_c4_169b_left;
     BIN_OP_OR_uxn_c_l254_c4_169b_right <= VAR_BIN_OP_OR_uxn_c_l254_c4_169b_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l254_c4_169b_return_output := BIN_OP_OR_uxn_c_l254_c4_169b_return_output;

     -- color_cmp_0_MUX[uxn_c_l191_c2_23ab] LATENCY=0
     -- Inputs
     color_cmp_0_MUX_uxn_c_l191_c2_23ab_cond <= VAR_color_cmp_0_MUX_uxn_c_l191_c2_23ab_cond;
     color_cmp_0_MUX_uxn_c_l191_c2_23ab_iftrue <= VAR_color_cmp_0_MUX_uxn_c_l191_c2_23ab_iftrue;
     color_cmp_0_MUX_uxn_c_l191_c2_23ab_iffalse <= VAR_color_cmp_0_MUX_uxn_c_l191_c2_23ab_iffalse;
     -- Outputs
     VAR_color_cmp_0_MUX_uxn_c_l191_c2_23ab_return_output := color_cmp_0_MUX_uxn_c_l191_c2_23ab_return_output;

     -- tmp12_MUX[uxn_c_l247_c8_0cec] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_c_l247_c8_0cec_cond <= VAR_tmp12_MUX_uxn_c_l247_c8_0cec_cond;
     tmp12_MUX_uxn_c_l247_c8_0cec_iftrue <= VAR_tmp12_MUX_uxn_c_l247_c8_0cec_iftrue;
     tmp12_MUX_uxn_c_l247_c8_0cec_iffalse <= VAR_tmp12_MUX_uxn_c_l247_c8_0cec_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_c_l247_c8_0cec_return_output := tmp12_MUX_uxn_c_l247_c8_0cec_return_output;

     -- CONST_SL_4[uxn_c_l229_c4_08cf] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_c_l229_c4_08cf_x <= VAR_CONST_SL_4_uxn_c_l229_c4_08cf_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_c_l229_c4_08cf_return_output := CONST_SL_4_uxn_c_l229_c4_08cf_return_output;

     -- CAST_TO_uint12_t_uint4_t_uxn_c_l248_l239_DUPLICATE_5139 LATENCY=0
     VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l248_l239_DUPLICATE_5139_return_output := CAST_TO_uint12_t_uint4_t(
     VAR_color_cmp_0_uxn_c_l192_c3_c755);

     -- CONST_SL_8[uxn_c_l196_c4_b60f] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l196_c4_b60f_x <= VAR_CONST_SL_8_uxn_c_l196_c4_b60f_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l196_c4_b60f_return_output := CONST_SL_8_uxn_c_l196_c4_b60f_return_output;

     -- BIN_OP_OR[uxn_c_l245_c4_a9b9] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l245_c4_a9b9_left <= VAR_BIN_OP_OR_uxn_c_l245_c4_a9b9_left;
     BIN_OP_OR_uxn_c_l245_c4_a9b9_right <= VAR_BIN_OP_OR_uxn_c_l245_c4_a9b9_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l245_c4_a9b9_return_output := BIN_OP_OR_uxn_c_l245_c4_a9b9_return_output;

     -- BIN_OP_OR[uxn_c_l203_c4_afed] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l203_c4_afed_left <= VAR_BIN_OP_OR_uxn_c_l203_c4_afed_left;
     BIN_OP_OR_uxn_c_l203_c4_afed_right <= VAR_BIN_OP_OR_uxn_c_l203_c4_afed_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l203_c4_afed_return_output := BIN_OP_OR_uxn_c_l203_c4_afed_return_output;

     -- CONST_SL_4[uxn_c_l218_c4_76de] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_c_l218_c4_76de_x <= VAR_CONST_SL_4_uxn_c_l218_c4_76de_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_c_l218_c4_76de_return_output := CONST_SL_4_uxn_c_l218_c4_76de_return_output;

     -- CONST_SL_8[uxn_c_l207_c4_f9e0] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l207_c4_f9e0_x <= VAR_CONST_SL_8_uxn_c_l207_c4_f9e0_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l207_c4_f9e0_return_output := CONST_SL_8_uxn_c_l207_c4_f9e0_return_output;

     -- BIN_OP_OR[uxn_c_l236_c4_c7ef] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l236_c4_c7ef_left <= VAR_BIN_OP_OR_uxn_c_l236_c4_c7ef_left;
     BIN_OP_OR_uxn_c_l236_c4_c7ef_right <= VAR_BIN_OP_OR_uxn_c_l236_c4_c7ef_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l236_c4_c7ef_return_output := BIN_OP_OR_uxn_c_l236_c4_c7ef_return_output;

     -- BIN_OP_OR[uxn_c_l225_c4_2618] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l225_c4_2618_left <= VAR_BIN_OP_OR_uxn_c_l225_c4_2618_left;
     BIN_OP_OR_uxn_c_l225_c4_2618_right <= VAR_BIN_OP_OR_uxn_c_l225_c4_2618_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l225_c4_2618_return_output := BIN_OP_OR_uxn_c_l225_c4_2618_return_output;

     -- Submodule level 3
     VAR_color1_MUX_uxn_c_l194_c3_b2e4_iftrue := VAR_BIN_OP_OR_uxn_c_l203_c4_afed_return_output;
     VAR_color3_MUX_uxn_c_l205_c8_5ce7_iftrue := VAR_BIN_OP_OR_uxn_c_l214_c4_7ae1_return_output;
     VAR_color1_MUX_uxn_c_l216_c8_6e97_iftrue := VAR_BIN_OP_OR_uxn_c_l225_c4_2618_return_output;
     VAR_color3_MUX_uxn_c_l227_c8_54ba_iftrue := VAR_BIN_OP_OR_uxn_c_l236_c4_c7ef_return_output;
     VAR_color1_MUX_uxn_c_l238_c8_ccac_iftrue := VAR_BIN_OP_OR_uxn_c_l245_c4_a9b9_return_output;
     VAR_color3_MUX_uxn_c_l247_c8_0cec_iftrue := VAR_BIN_OP_OR_uxn_c_l254_c4_169b_return_output;
     VAR_BIN_OP_OR_uxn_c_l241_c4_e4b7_right := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l248_l239_DUPLICATE_5139_return_output;
     VAR_BIN_OP_OR_uxn_c_l250_c4_d98e_right := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l248_l239_DUPLICATE_5139_return_output;
     VAR_BIN_OP_OR_uxn_c_l220_c4_d06e_right := VAR_CONST_SL_4_uxn_c_l218_c4_76de_return_output;
     VAR_BIN_OP_OR_uxn_c_l231_c4_a52e_right := VAR_CONST_SL_4_uxn_c_l229_c4_08cf_return_output;
     VAR_BIN_OP_OR_uxn_c_l198_c4_5323_right := VAR_CONST_SL_8_uxn_c_l196_c4_b60f_return_output;
     VAR_BIN_OP_OR_uxn_c_l209_c4_cdcb_right := VAR_CONST_SL_8_uxn_c_l207_c4_f9e0_return_output;
     REG_VAR_color_cmp_0 := VAR_color_cmp_0_MUX_uxn_c_l191_c2_23ab_return_output;
     VAR_tmp12_MUX_uxn_c_l238_c8_ccac_iffalse := VAR_tmp12_MUX_uxn_c_l247_c8_0cec_return_output;
     -- BIN_OP_OR[uxn_c_l231_c4_a52e] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l231_c4_a52e_left <= VAR_BIN_OP_OR_uxn_c_l231_c4_a52e_left;
     BIN_OP_OR_uxn_c_l231_c4_a52e_right <= VAR_BIN_OP_OR_uxn_c_l231_c4_a52e_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l231_c4_a52e_return_output := BIN_OP_OR_uxn_c_l231_c4_a52e_return_output;

     -- color3_MUX[uxn_c_l247_c8_0cec] LATENCY=0
     -- Inputs
     color3_MUX_uxn_c_l247_c8_0cec_cond <= VAR_color3_MUX_uxn_c_l247_c8_0cec_cond;
     color3_MUX_uxn_c_l247_c8_0cec_iftrue <= VAR_color3_MUX_uxn_c_l247_c8_0cec_iftrue;
     color3_MUX_uxn_c_l247_c8_0cec_iffalse <= VAR_color3_MUX_uxn_c_l247_c8_0cec_iffalse;
     -- Outputs
     VAR_color3_MUX_uxn_c_l247_c8_0cec_return_output := color3_MUX_uxn_c_l247_c8_0cec_return_output;

     -- color1_MUX[uxn_c_l238_c8_ccac] LATENCY=0
     -- Inputs
     color1_MUX_uxn_c_l238_c8_ccac_cond <= VAR_color1_MUX_uxn_c_l238_c8_ccac_cond;
     color1_MUX_uxn_c_l238_c8_ccac_iftrue <= VAR_color1_MUX_uxn_c_l238_c8_ccac_iftrue;
     color1_MUX_uxn_c_l238_c8_ccac_iffalse <= VAR_color1_MUX_uxn_c_l238_c8_ccac_iffalse;
     -- Outputs
     VAR_color1_MUX_uxn_c_l238_c8_ccac_return_output := color1_MUX_uxn_c_l238_c8_ccac_return_output;

     -- BIN_OP_OR[uxn_c_l198_c4_5323] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l198_c4_5323_left <= VAR_BIN_OP_OR_uxn_c_l198_c4_5323_left;
     BIN_OP_OR_uxn_c_l198_c4_5323_right <= VAR_BIN_OP_OR_uxn_c_l198_c4_5323_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l198_c4_5323_return_output := BIN_OP_OR_uxn_c_l198_c4_5323_return_output;

     -- tmp12_MUX[uxn_c_l238_c8_ccac] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_c_l238_c8_ccac_cond <= VAR_tmp12_MUX_uxn_c_l238_c8_ccac_cond;
     tmp12_MUX_uxn_c_l238_c8_ccac_iftrue <= VAR_tmp12_MUX_uxn_c_l238_c8_ccac_iftrue;
     tmp12_MUX_uxn_c_l238_c8_ccac_iffalse <= VAR_tmp12_MUX_uxn_c_l238_c8_ccac_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_c_l238_c8_ccac_return_output := tmp12_MUX_uxn_c_l238_c8_ccac_return_output;

     -- BIN_OP_OR[uxn_c_l209_c4_cdcb] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l209_c4_cdcb_left <= VAR_BIN_OP_OR_uxn_c_l209_c4_cdcb_left;
     BIN_OP_OR_uxn_c_l209_c4_cdcb_right <= VAR_BIN_OP_OR_uxn_c_l209_c4_cdcb_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l209_c4_cdcb_return_output := BIN_OP_OR_uxn_c_l209_c4_cdcb_return_output;

     -- BIN_OP_OR[uxn_c_l220_c4_d06e] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l220_c4_d06e_left <= VAR_BIN_OP_OR_uxn_c_l220_c4_d06e_left;
     BIN_OP_OR_uxn_c_l220_c4_d06e_right <= VAR_BIN_OP_OR_uxn_c_l220_c4_d06e_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l220_c4_d06e_return_output := BIN_OP_OR_uxn_c_l220_c4_d06e_return_output;

     -- BIN_OP_OR[uxn_c_l241_c4_e4b7] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l241_c4_e4b7_left <= VAR_BIN_OP_OR_uxn_c_l241_c4_e4b7_left;
     BIN_OP_OR_uxn_c_l241_c4_e4b7_right <= VAR_BIN_OP_OR_uxn_c_l241_c4_e4b7_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l241_c4_e4b7_return_output := BIN_OP_OR_uxn_c_l241_c4_e4b7_return_output;

     -- BIN_OP_OR[uxn_c_l250_c4_d98e] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l250_c4_d98e_left <= VAR_BIN_OP_OR_uxn_c_l250_c4_d98e_left;
     BIN_OP_OR_uxn_c_l250_c4_d98e_right <= VAR_BIN_OP_OR_uxn_c_l250_c4_d98e_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l250_c4_d98e_return_output := BIN_OP_OR_uxn_c_l250_c4_d98e_return_output;

     -- Submodule level 4
     VAR_color0_MUX_uxn_c_l194_c3_b2e4_iftrue := VAR_BIN_OP_OR_uxn_c_l198_c4_5323_return_output;
     VAR_color2_MUX_uxn_c_l205_c8_5ce7_iftrue := VAR_BIN_OP_OR_uxn_c_l209_c4_cdcb_return_output;
     VAR_color0_MUX_uxn_c_l216_c8_6e97_iftrue := VAR_BIN_OP_OR_uxn_c_l220_c4_d06e_return_output;
     VAR_color2_MUX_uxn_c_l227_c8_54ba_iftrue := VAR_BIN_OP_OR_uxn_c_l231_c4_a52e_return_output;
     VAR_color0_MUX_uxn_c_l238_c8_ccac_iftrue := VAR_BIN_OP_OR_uxn_c_l241_c4_e4b7_return_output;
     VAR_color2_MUX_uxn_c_l247_c8_0cec_iftrue := VAR_BIN_OP_OR_uxn_c_l250_c4_d98e_return_output;
     VAR_color1_MUX_uxn_c_l227_c8_54ba_iffalse := VAR_color1_MUX_uxn_c_l238_c8_ccac_return_output;
     VAR_color3_MUX_uxn_c_l238_c8_ccac_iffalse := VAR_color3_MUX_uxn_c_l247_c8_0cec_return_output;
     VAR_tmp12_MUX_uxn_c_l227_c8_54ba_iffalse := VAR_tmp12_MUX_uxn_c_l238_c8_ccac_return_output;
     -- color3_MUX[uxn_c_l238_c8_ccac] LATENCY=0
     -- Inputs
     color3_MUX_uxn_c_l238_c8_ccac_cond <= VAR_color3_MUX_uxn_c_l238_c8_ccac_cond;
     color3_MUX_uxn_c_l238_c8_ccac_iftrue <= VAR_color3_MUX_uxn_c_l238_c8_ccac_iftrue;
     color3_MUX_uxn_c_l238_c8_ccac_iffalse <= VAR_color3_MUX_uxn_c_l238_c8_ccac_iffalse;
     -- Outputs
     VAR_color3_MUX_uxn_c_l238_c8_ccac_return_output := color3_MUX_uxn_c_l238_c8_ccac_return_output;

     -- color0_MUX[uxn_c_l238_c8_ccac] LATENCY=0
     -- Inputs
     color0_MUX_uxn_c_l238_c8_ccac_cond <= VAR_color0_MUX_uxn_c_l238_c8_ccac_cond;
     color0_MUX_uxn_c_l238_c8_ccac_iftrue <= VAR_color0_MUX_uxn_c_l238_c8_ccac_iftrue;
     color0_MUX_uxn_c_l238_c8_ccac_iffalse <= VAR_color0_MUX_uxn_c_l238_c8_ccac_iffalse;
     -- Outputs
     VAR_color0_MUX_uxn_c_l238_c8_ccac_return_output := color0_MUX_uxn_c_l238_c8_ccac_return_output;

     -- color2_MUX[uxn_c_l247_c8_0cec] LATENCY=0
     -- Inputs
     color2_MUX_uxn_c_l247_c8_0cec_cond <= VAR_color2_MUX_uxn_c_l247_c8_0cec_cond;
     color2_MUX_uxn_c_l247_c8_0cec_iftrue <= VAR_color2_MUX_uxn_c_l247_c8_0cec_iftrue;
     color2_MUX_uxn_c_l247_c8_0cec_iffalse <= VAR_color2_MUX_uxn_c_l247_c8_0cec_iffalse;
     -- Outputs
     VAR_color2_MUX_uxn_c_l247_c8_0cec_return_output := color2_MUX_uxn_c_l247_c8_0cec_return_output;

     -- tmp12_MUX[uxn_c_l227_c8_54ba] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_c_l227_c8_54ba_cond <= VAR_tmp12_MUX_uxn_c_l227_c8_54ba_cond;
     tmp12_MUX_uxn_c_l227_c8_54ba_iftrue <= VAR_tmp12_MUX_uxn_c_l227_c8_54ba_iftrue;
     tmp12_MUX_uxn_c_l227_c8_54ba_iffalse <= VAR_tmp12_MUX_uxn_c_l227_c8_54ba_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_c_l227_c8_54ba_return_output := tmp12_MUX_uxn_c_l227_c8_54ba_return_output;

     -- color1_MUX[uxn_c_l227_c8_54ba] LATENCY=0
     -- Inputs
     color1_MUX_uxn_c_l227_c8_54ba_cond <= VAR_color1_MUX_uxn_c_l227_c8_54ba_cond;
     color1_MUX_uxn_c_l227_c8_54ba_iftrue <= VAR_color1_MUX_uxn_c_l227_c8_54ba_iftrue;
     color1_MUX_uxn_c_l227_c8_54ba_iffalse <= VAR_color1_MUX_uxn_c_l227_c8_54ba_iffalse;
     -- Outputs
     VAR_color1_MUX_uxn_c_l227_c8_54ba_return_output := color1_MUX_uxn_c_l227_c8_54ba_return_output;

     -- Submodule level 5
     VAR_color0_MUX_uxn_c_l227_c8_54ba_iffalse := VAR_color0_MUX_uxn_c_l238_c8_ccac_return_output;
     VAR_color1_MUX_uxn_c_l216_c8_6e97_iffalse := VAR_color1_MUX_uxn_c_l227_c8_54ba_return_output;
     VAR_color2_MUX_uxn_c_l238_c8_ccac_iffalse := VAR_color2_MUX_uxn_c_l247_c8_0cec_return_output;
     VAR_color3_MUX_uxn_c_l227_c8_54ba_iffalse := VAR_color3_MUX_uxn_c_l238_c8_ccac_return_output;
     VAR_tmp12_MUX_uxn_c_l216_c8_6e97_iffalse := VAR_tmp12_MUX_uxn_c_l227_c8_54ba_return_output;
     -- color2_MUX[uxn_c_l238_c8_ccac] LATENCY=0
     -- Inputs
     color2_MUX_uxn_c_l238_c8_ccac_cond <= VAR_color2_MUX_uxn_c_l238_c8_ccac_cond;
     color2_MUX_uxn_c_l238_c8_ccac_iftrue <= VAR_color2_MUX_uxn_c_l238_c8_ccac_iftrue;
     color2_MUX_uxn_c_l238_c8_ccac_iffalse <= VAR_color2_MUX_uxn_c_l238_c8_ccac_iffalse;
     -- Outputs
     VAR_color2_MUX_uxn_c_l238_c8_ccac_return_output := color2_MUX_uxn_c_l238_c8_ccac_return_output;

     -- color3_MUX[uxn_c_l227_c8_54ba] LATENCY=0
     -- Inputs
     color3_MUX_uxn_c_l227_c8_54ba_cond <= VAR_color3_MUX_uxn_c_l227_c8_54ba_cond;
     color3_MUX_uxn_c_l227_c8_54ba_iftrue <= VAR_color3_MUX_uxn_c_l227_c8_54ba_iftrue;
     color3_MUX_uxn_c_l227_c8_54ba_iffalse <= VAR_color3_MUX_uxn_c_l227_c8_54ba_iffalse;
     -- Outputs
     VAR_color3_MUX_uxn_c_l227_c8_54ba_return_output := color3_MUX_uxn_c_l227_c8_54ba_return_output;

     -- color1_MUX[uxn_c_l216_c8_6e97] LATENCY=0
     -- Inputs
     color1_MUX_uxn_c_l216_c8_6e97_cond <= VAR_color1_MUX_uxn_c_l216_c8_6e97_cond;
     color1_MUX_uxn_c_l216_c8_6e97_iftrue <= VAR_color1_MUX_uxn_c_l216_c8_6e97_iftrue;
     color1_MUX_uxn_c_l216_c8_6e97_iffalse <= VAR_color1_MUX_uxn_c_l216_c8_6e97_iffalse;
     -- Outputs
     VAR_color1_MUX_uxn_c_l216_c8_6e97_return_output := color1_MUX_uxn_c_l216_c8_6e97_return_output;

     -- tmp12_MUX[uxn_c_l216_c8_6e97] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_c_l216_c8_6e97_cond <= VAR_tmp12_MUX_uxn_c_l216_c8_6e97_cond;
     tmp12_MUX_uxn_c_l216_c8_6e97_iftrue <= VAR_tmp12_MUX_uxn_c_l216_c8_6e97_iftrue;
     tmp12_MUX_uxn_c_l216_c8_6e97_iffalse <= VAR_tmp12_MUX_uxn_c_l216_c8_6e97_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_c_l216_c8_6e97_return_output := tmp12_MUX_uxn_c_l216_c8_6e97_return_output;

     -- color0_MUX[uxn_c_l227_c8_54ba] LATENCY=0
     -- Inputs
     color0_MUX_uxn_c_l227_c8_54ba_cond <= VAR_color0_MUX_uxn_c_l227_c8_54ba_cond;
     color0_MUX_uxn_c_l227_c8_54ba_iftrue <= VAR_color0_MUX_uxn_c_l227_c8_54ba_iftrue;
     color0_MUX_uxn_c_l227_c8_54ba_iffalse <= VAR_color0_MUX_uxn_c_l227_c8_54ba_iffalse;
     -- Outputs
     VAR_color0_MUX_uxn_c_l227_c8_54ba_return_output := color0_MUX_uxn_c_l227_c8_54ba_return_output;

     -- Submodule level 6
     VAR_color0_MUX_uxn_c_l216_c8_6e97_iffalse := VAR_color0_MUX_uxn_c_l227_c8_54ba_return_output;
     VAR_color1_MUX_uxn_c_l205_c8_5ce7_iffalse := VAR_color1_MUX_uxn_c_l216_c8_6e97_return_output;
     VAR_color2_MUX_uxn_c_l227_c8_54ba_iffalse := VAR_color2_MUX_uxn_c_l238_c8_ccac_return_output;
     VAR_color3_MUX_uxn_c_l216_c8_6e97_iffalse := VAR_color3_MUX_uxn_c_l227_c8_54ba_return_output;
     VAR_tmp12_MUX_uxn_c_l205_c8_5ce7_iffalse := VAR_tmp12_MUX_uxn_c_l216_c8_6e97_return_output;
     -- color1_MUX[uxn_c_l205_c8_5ce7] LATENCY=0
     -- Inputs
     color1_MUX_uxn_c_l205_c8_5ce7_cond <= VAR_color1_MUX_uxn_c_l205_c8_5ce7_cond;
     color1_MUX_uxn_c_l205_c8_5ce7_iftrue <= VAR_color1_MUX_uxn_c_l205_c8_5ce7_iftrue;
     color1_MUX_uxn_c_l205_c8_5ce7_iffalse <= VAR_color1_MUX_uxn_c_l205_c8_5ce7_iffalse;
     -- Outputs
     VAR_color1_MUX_uxn_c_l205_c8_5ce7_return_output := color1_MUX_uxn_c_l205_c8_5ce7_return_output;

     -- color2_MUX[uxn_c_l227_c8_54ba] LATENCY=0
     -- Inputs
     color2_MUX_uxn_c_l227_c8_54ba_cond <= VAR_color2_MUX_uxn_c_l227_c8_54ba_cond;
     color2_MUX_uxn_c_l227_c8_54ba_iftrue <= VAR_color2_MUX_uxn_c_l227_c8_54ba_iftrue;
     color2_MUX_uxn_c_l227_c8_54ba_iffalse <= VAR_color2_MUX_uxn_c_l227_c8_54ba_iffalse;
     -- Outputs
     VAR_color2_MUX_uxn_c_l227_c8_54ba_return_output := color2_MUX_uxn_c_l227_c8_54ba_return_output;

     -- color3_MUX[uxn_c_l216_c8_6e97] LATENCY=0
     -- Inputs
     color3_MUX_uxn_c_l216_c8_6e97_cond <= VAR_color3_MUX_uxn_c_l216_c8_6e97_cond;
     color3_MUX_uxn_c_l216_c8_6e97_iftrue <= VAR_color3_MUX_uxn_c_l216_c8_6e97_iftrue;
     color3_MUX_uxn_c_l216_c8_6e97_iffalse <= VAR_color3_MUX_uxn_c_l216_c8_6e97_iffalse;
     -- Outputs
     VAR_color3_MUX_uxn_c_l216_c8_6e97_return_output := color3_MUX_uxn_c_l216_c8_6e97_return_output;

     -- color0_MUX[uxn_c_l216_c8_6e97] LATENCY=0
     -- Inputs
     color0_MUX_uxn_c_l216_c8_6e97_cond <= VAR_color0_MUX_uxn_c_l216_c8_6e97_cond;
     color0_MUX_uxn_c_l216_c8_6e97_iftrue <= VAR_color0_MUX_uxn_c_l216_c8_6e97_iftrue;
     color0_MUX_uxn_c_l216_c8_6e97_iffalse <= VAR_color0_MUX_uxn_c_l216_c8_6e97_iffalse;
     -- Outputs
     VAR_color0_MUX_uxn_c_l216_c8_6e97_return_output := color0_MUX_uxn_c_l216_c8_6e97_return_output;

     -- tmp12_MUX[uxn_c_l205_c8_5ce7] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_c_l205_c8_5ce7_cond <= VAR_tmp12_MUX_uxn_c_l205_c8_5ce7_cond;
     tmp12_MUX_uxn_c_l205_c8_5ce7_iftrue <= VAR_tmp12_MUX_uxn_c_l205_c8_5ce7_iftrue;
     tmp12_MUX_uxn_c_l205_c8_5ce7_iffalse <= VAR_tmp12_MUX_uxn_c_l205_c8_5ce7_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_c_l205_c8_5ce7_return_output := tmp12_MUX_uxn_c_l205_c8_5ce7_return_output;

     -- Submodule level 7
     VAR_color0_MUX_uxn_c_l205_c8_5ce7_iffalse := VAR_color0_MUX_uxn_c_l216_c8_6e97_return_output;
     VAR_color1_MUX_uxn_c_l194_c3_b2e4_iffalse := VAR_color1_MUX_uxn_c_l205_c8_5ce7_return_output;
     VAR_color2_MUX_uxn_c_l216_c8_6e97_iffalse := VAR_color2_MUX_uxn_c_l227_c8_54ba_return_output;
     VAR_color3_MUX_uxn_c_l205_c8_5ce7_iffalse := VAR_color3_MUX_uxn_c_l216_c8_6e97_return_output;
     VAR_tmp12_MUX_uxn_c_l194_c3_b2e4_iffalse := VAR_tmp12_MUX_uxn_c_l205_c8_5ce7_return_output;
     -- color3_MUX[uxn_c_l205_c8_5ce7] LATENCY=0
     -- Inputs
     color3_MUX_uxn_c_l205_c8_5ce7_cond <= VAR_color3_MUX_uxn_c_l205_c8_5ce7_cond;
     color3_MUX_uxn_c_l205_c8_5ce7_iftrue <= VAR_color3_MUX_uxn_c_l205_c8_5ce7_iftrue;
     color3_MUX_uxn_c_l205_c8_5ce7_iffalse <= VAR_color3_MUX_uxn_c_l205_c8_5ce7_iffalse;
     -- Outputs
     VAR_color3_MUX_uxn_c_l205_c8_5ce7_return_output := color3_MUX_uxn_c_l205_c8_5ce7_return_output;

     -- color1_MUX[uxn_c_l194_c3_b2e4] LATENCY=0
     -- Inputs
     color1_MUX_uxn_c_l194_c3_b2e4_cond <= VAR_color1_MUX_uxn_c_l194_c3_b2e4_cond;
     color1_MUX_uxn_c_l194_c3_b2e4_iftrue <= VAR_color1_MUX_uxn_c_l194_c3_b2e4_iftrue;
     color1_MUX_uxn_c_l194_c3_b2e4_iffalse <= VAR_color1_MUX_uxn_c_l194_c3_b2e4_iffalse;
     -- Outputs
     VAR_color1_MUX_uxn_c_l194_c3_b2e4_return_output := color1_MUX_uxn_c_l194_c3_b2e4_return_output;

     -- color2_MUX[uxn_c_l216_c8_6e97] LATENCY=0
     -- Inputs
     color2_MUX_uxn_c_l216_c8_6e97_cond <= VAR_color2_MUX_uxn_c_l216_c8_6e97_cond;
     color2_MUX_uxn_c_l216_c8_6e97_iftrue <= VAR_color2_MUX_uxn_c_l216_c8_6e97_iftrue;
     color2_MUX_uxn_c_l216_c8_6e97_iffalse <= VAR_color2_MUX_uxn_c_l216_c8_6e97_iffalse;
     -- Outputs
     VAR_color2_MUX_uxn_c_l216_c8_6e97_return_output := color2_MUX_uxn_c_l216_c8_6e97_return_output;

     -- color0_MUX[uxn_c_l205_c8_5ce7] LATENCY=0
     -- Inputs
     color0_MUX_uxn_c_l205_c8_5ce7_cond <= VAR_color0_MUX_uxn_c_l205_c8_5ce7_cond;
     color0_MUX_uxn_c_l205_c8_5ce7_iftrue <= VAR_color0_MUX_uxn_c_l205_c8_5ce7_iftrue;
     color0_MUX_uxn_c_l205_c8_5ce7_iffalse <= VAR_color0_MUX_uxn_c_l205_c8_5ce7_iffalse;
     -- Outputs
     VAR_color0_MUX_uxn_c_l205_c8_5ce7_return_output := color0_MUX_uxn_c_l205_c8_5ce7_return_output;

     -- tmp12_MUX[uxn_c_l194_c3_b2e4] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_c_l194_c3_b2e4_cond <= VAR_tmp12_MUX_uxn_c_l194_c3_b2e4_cond;
     tmp12_MUX_uxn_c_l194_c3_b2e4_iftrue <= VAR_tmp12_MUX_uxn_c_l194_c3_b2e4_iftrue;
     tmp12_MUX_uxn_c_l194_c3_b2e4_iffalse <= VAR_tmp12_MUX_uxn_c_l194_c3_b2e4_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_c_l194_c3_b2e4_return_output := tmp12_MUX_uxn_c_l194_c3_b2e4_return_output;

     -- Submodule level 8
     VAR_color0_MUX_uxn_c_l194_c3_b2e4_iffalse := VAR_color0_MUX_uxn_c_l205_c8_5ce7_return_output;
     VAR_color1_MUX_uxn_c_l191_c2_23ab_iftrue := VAR_color1_MUX_uxn_c_l194_c3_b2e4_return_output;
     VAR_color2_MUX_uxn_c_l205_c8_5ce7_iffalse := VAR_color2_MUX_uxn_c_l216_c8_6e97_return_output;
     VAR_color3_MUX_uxn_c_l194_c3_b2e4_iffalse := VAR_color3_MUX_uxn_c_l205_c8_5ce7_return_output;
     VAR_tmp12_MUX_uxn_c_l191_c2_23ab_iftrue := VAR_tmp12_MUX_uxn_c_l194_c3_b2e4_return_output;
     -- color2_MUX[uxn_c_l205_c8_5ce7] LATENCY=0
     -- Inputs
     color2_MUX_uxn_c_l205_c8_5ce7_cond <= VAR_color2_MUX_uxn_c_l205_c8_5ce7_cond;
     color2_MUX_uxn_c_l205_c8_5ce7_iftrue <= VAR_color2_MUX_uxn_c_l205_c8_5ce7_iftrue;
     color2_MUX_uxn_c_l205_c8_5ce7_iffalse <= VAR_color2_MUX_uxn_c_l205_c8_5ce7_iffalse;
     -- Outputs
     VAR_color2_MUX_uxn_c_l205_c8_5ce7_return_output := color2_MUX_uxn_c_l205_c8_5ce7_return_output;

     -- color0_MUX[uxn_c_l194_c3_b2e4] LATENCY=0
     -- Inputs
     color0_MUX_uxn_c_l194_c3_b2e4_cond <= VAR_color0_MUX_uxn_c_l194_c3_b2e4_cond;
     color0_MUX_uxn_c_l194_c3_b2e4_iftrue <= VAR_color0_MUX_uxn_c_l194_c3_b2e4_iftrue;
     color0_MUX_uxn_c_l194_c3_b2e4_iffalse <= VAR_color0_MUX_uxn_c_l194_c3_b2e4_iffalse;
     -- Outputs
     VAR_color0_MUX_uxn_c_l194_c3_b2e4_return_output := color0_MUX_uxn_c_l194_c3_b2e4_return_output;

     -- tmp12_MUX[uxn_c_l191_c2_23ab] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_c_l191_c2_23ab_cond <= VAR_tmp12_MUX_uxn_c_l191_c2_23ab_cond;
     tmp12_MUX_uxn_c_l191_c2_23ab_iftrue <= VAR_tmp12_MUX_uxn_c_l191_c2_23ab_iftrue;
     tmp12_MUX_uxn_c_l191_c2_23ab_iffalse <= VAR_tmp12_MUX_uxn_c_l191_c2_23ab_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_c_l191_c2_23ab_return_output := tmp12_MUX_uxn_c_l191_c2_23ab_return_output;

     -- color3_MUX[uxn_c_l194_c3_b2e4] LATENCY=0
     -- Inputs
     color3_MUX_uxn_c_l194_c3_b2e4_cond <= VAR_color3_MUX_uxn_c_l194_c3_b2e4_cond;
     color3_MUX_uxn_c_l194_c3_b2e4_iftrue <= VAR_color3_MUX_uxn_c_l194_c3_b2e4_iftrue;
     color3_MUX_uxn_c_l194_c3_b2e4_iffalse <= VAR_color3_MUX_uxn_c_l194_c3_b2e4_iffalse;
     -- Outputs
     VAR_color3_MUX_uxn_c_l194_c3_b2e4_return_output := color3_MUX_uxn_c_l194_c3_b2e4_return_output;

     -- color1_MUX[uxn_c_l191_c2_23ab] LATENCY=0
     -- Inputs
     color1_MUX_uxn_c_l191_c2_23ab_cond <= VAR_color1_MUX_uxn_c_l191_c2_23ab_cond;
     color1_MUX_uxn_c_l191_c2_23ab_iftrue <= VAR_color1_MUX_uxn_c_l191_c2_23ab_iftrue;
     color1_MUX_uxn_c_l191_c2_23ab_iffalse <= VAR_color1_MUX_uxn_c_l191_c2_23ab_iffalse;
     -- Outputs
     VAR_color1_MUX_uxn_c_l191_c2_23ab_return_output := color1_MUX_uxn_c_l191_c2_23ab_return_output;

     -- Submodule level 9
     VAR_color0_MUX_uxn_c_l191_c2_23ab_iftrue := VAR_color0_MUX_uxn_c_l194_c3_b2e4_return_output;
     REG_VAR_color1 := VAR_color1_MUX_uxn_c_l191_c2_23ab_return_output;
     VAR_result_uxn_c_l263_c3_fd28 := resize(VAR_color1_MUX_uxn_c_l191_c2_23ab_return_output, 16);
     VAR_color2_MUX_uxn_c_l194_c3_b2e4_iffalse := VAR_color2_MUX_uxn_c_l205_c8_5ce7_return_output;
     VAR_color3_MUX_uxn_c_l191_c2_23ab_iftrue := VAR_color3_MUX_uxn_c_l194_c3_b2e4_return_output;
     REG_VAR_tmp12 := VAR_tmp12_MUX_uxn_c_l191_c2_23ab_return_output;
     VAR_result_MUX_uxn_c_l262_c9_9504_iftrue := VAR_result_uxn_c_l263_c3_fd28;
     -- color2_MUX[uxn_c_l194_c3_b2e4] LATENCY=0
     -- Inputs
     color2_MUX_uxn_c_l194_c3_b2e4_cond <= VAR_color2_MUX_uxn_c_l194_c3_b2e4_cond;
     color2_MUX_uxn_c_l194_c3_b2e4_iftrue <= VAR_color2_MUX_uxn_c_l194_c3_b2e4_iftrue;
     color2_MUX_uxn_c_l194_c3_b2e4_iffalse <= VAR_color2_MUX_uxn_c_l194_c3_b2e4_iffalse;
     -- Outputs
     VAR_color2_MUX_uxn_c_l194_c3_b2e4_return_output := color2_MUX_uxn_c_l194_c3_b2e4_return_output;

     -- color3_MUX[uxn_c_l191_c2_23ab] LATENCY=0
     -- Inputs
     color3_MUX_uxn_c_l191_c2_23ab_cond <= VAR_color3_MUX_uxn_c_l191_c2_23ab_cond;
     color3_MUX_uxn_c_l191_c2_23ab_iftrue <= VAR_color3_MUX_uxn_c_l191_c2_23ab_iftrue;
     color3_MUX_uxn_c_l191_c2_23ab_iffalse <= VAR_color3_MUX_uxn_c_l191_c2_23ab_iffalse;
     -- Outputs
     VAR_color3_MUX_uxn_c_l191_c2_23ab_return_output := color3_MUX_uxn_c_l191_c2_23ab_return_output;

     -- color0_MUX[uxn_c_l191_c2_23ab] LATENCY=0
     -- Inputs
     color0_MUX_uxn_c_l191_c2_23ab_cond <= VAR_color0_MUX_uxn_c_l191_c2_23ab_cond;
     color0_MUX_uxn_c_l191_c2_23ab_iftrue <= VAR_color0_MUX_uxn_c_l191_c2_23ab_iftrue;
     color0_MUX_uxn_c_l191_c2_23ab_iffalse <= VAR_color0_MUX_uxn_c_l191_c2_23ab_iffalse;
     -- Outputs
     VAR_color0_MUX_uxn_c_l191_c2_23ab_return_output := color0_MUX_uxn_c_l191_c2_23ab_return_output;

     -- Submodule level 10
     REG_VAR_color0 := VAR_color0_MUX_uxn_c_l191_c2_23ab_return_output;
     VAR_result_uxn_c_l261_c3_b99a := resize(VAR_color0_MUX_uxn_c_l191_c2_23ab_return_output, 16);
     VAR_color2_MUX_uxn_c_l191_c2_23ab_iftrue := VAR_color2_MUX_uxn_c_l194_c3_b2e4_return_output;
     REG_VAR_color3 := VAR_color3_MUX_uxn_c_l191_c2_23ab_return_output;
     VAR_result_uxn_c_l267_c3_c68b := resize(VAR_color3_MUX_uxn_c_l191_c2_23ab_return_output, 16);
     VAR_result_MUX_uxn_c_l260_c2_32f9_iftrue := VAR_result_uxn_c_l261_c3_b99a;
     VAR_result_MUX_uxn_c_l264_c9_cb41_iffalse := VAR_result_uxn_c_l267_c3_c68b;
     -- color2_MUX[uxn_c_l191_c2_23ab] LATENCY=0
     -- Inputs
     color2_MUX_uxn_c_l191_c2_23ab_cond <= VAR_color2_MUX_uxn_c_l191_c2_23ab_cond;
     color2_MUX_uxn_c_l191_c2_23ab_iftrue <= VAR_color2_MUX_uxn_c_l191_c2_23ab_iftrue;
     color2_MUX_uxn_c_l191_c2_23ab_iffalse <= VAR_color2_MUX_uxn_c_l191_c2_23ab_iffalse;
     -- Outputs
     VAR_color2_MUX_uxn_c_l191_c2_23ab_return_output := color2_MUX_uxn_c_l191_c2_23ab_return_output;

     -- Submodule level 11
     REG_VAR_color2 := VAR_color2_MUX_uxn_c_l191_c2_23ab_return_output;
     VAR_result_uxn_c_l265_c3_d6e5 := resize(VAR_color2_MUX_uxn_c_l191_c2_23ab_return_output, 16);
     VAR_result_MUX_uxn_c_l264_c9_cb41_iftrue := VAR_result_uxn_c_l265_c3_d6e5;
     -- result_MUX[uxn_c_l264_c9_cb41] LATENCY=0
     -- Inputs
     result_MUX_uxn_c_l264_c9_cb41_cond <= VAR_result_MUX_uxn_c_l264_c9_cb41_cond;
     result_MUX_uxn_c_l264_c9_cb41_iftrue <= VAR_result_MUX_uxn_c_l264_c9_cb41_iftrue;
     result_MUX_uxn_c_l264_c9_cb41_iffalse <= VAR_result_MUX_uxn_c_l264_c9_cb41_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_c_l264_c9_cb41_return_output := result_MUX_uxn_c_l264_c9_cb41_return_output;

     -- Submodule level 12
     VAR_result_MUX_uxn_c_l262_c9_9504_iffalse := VAR_result_MUX_uxn_c_l264_c9_cb41_return_output;
     -- result_MUX[uxn_c_l262_c9_9504] LATENCY=0
     -- Inputs
     result_MUX_uxn_c_l262_c9_9504_cond <= VAR_result_MUX_uxn_c_l262_c9_9504_cond;
     result_MUX_uxn_c_l262_c9_9504_iftrue <= VAR_result_MUX_uxn_c_l262_c9_9504_iftrue;
     result_MUX_uxn_c_l262_c9_9504_iffalse <= VAR_result_MUX_uxn_c_l262_c9_9504_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_c_l262_c9_9504_return_output := result_MUX_uxn_c_l262_c9_9504_return_output;

     -- Submodule level 13
     VAR_result_MUX_uxn_c_l260_c2_32f9_iffalse := VAR_result_MUX_uxn_c_l262_c9_9504_return_output;
     -- result_MUX[uxn_c_l260_c2_32f9] LATENCY=0
     -- Inputs
     result_MUX_uxn_c_l260_c2_32f9_cond <= VAR_result_MUX_uxn_c_l260_c2_32f9_cond;
     result_MUX_uxn_c_l260_c2_32f9_iftrue <= VAR_result_MUX_uxn_c_l260_c2_32f9_iftrue;
     result_MUX_uxn_c_l260_c2_32f9_iffalse <= VAR_result_MUX_uxn_c_l260_c2_32f9_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_c_l260_c2_32f9_return_output := result_MUX_uxn_c_l260_c2_32f9_return_output;

     -- Submodule level 14
     REG_VAR_result := VAR_result_MUX_uxn_c_l260_c2_32f9_return_output;
     VAR_return_output := VAR_result_MUX_uxn_c_l260_c2_32f9_return_output;
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
