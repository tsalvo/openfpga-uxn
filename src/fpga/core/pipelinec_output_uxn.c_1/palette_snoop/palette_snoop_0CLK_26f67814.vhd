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
-- tmp12_MUX[uxn_c_l217_c2_0fe0]
signal tmp12_MUX_uxn_c_l217_c2_0fe0_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_c_l217_c2_0fe0_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l217_c2_0fe0_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l217_c2_0fe0_return_output : unsigned(11 downto 0);

-- color_cmp_1_MUX[uxn_c_l217_c2_0fe0]
signal color_cmp_1_MUX_uxn_c_l217_c2_0fe0_cond : unsigned(0 downto 0);
signal color_cmp_1_MUX_uxn_c_l217_c2_0fe0_iftrue : unsigned(3 downto 0);
signal color_cmp_1_MUX_uxn_c_l217_c2_0fe0_iffalse : unsigned(3 downto 0);
signal color_cmp_1_MUX_uxn_c_l217_c2_0fe0_return_output : unsigned(3 downto 0);

-- color3_MUX[uxn_c_l217_c2_0fe0]
signal color3_MUX_uxn_c_l217_c2_0fe0_cond : unsigned(0 downto 0);
signal color3_MUX_uxn_c_l217_c2_0fe0_iftrue : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l217_c2_0fe0_iffalse : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l217_c2_0fe0_return_output : unsigned(11 downto 0);

-- color0_MUX[uxn_c_l217_c2_0fe0]
signal color0_MUX_uxn_c_l217_c2_0fe0_cond : unsigned(0 downto 0);
signal color0_MUX_uxn_c_l217_c2_0fe0_iftrue : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l217_c2_0fe0_iffalse : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l217_c2_0fe0_return_output : unsigned(11 downto 0);

-- color_cmp_0_MUX[uxn_c_l217_c2_0fe0]
signal color_cmp_0_MUX_uxn_c_l217_c2_0fe0_cond : unsigned(0 downto 0);
signal color_cmp_0_MUX_uxn_c_l217_c2_0fe0_iftrue : unsigned(3 downto 0);
signal color_cmp_0_MUX_uxn_c_l217_c2_0fe0_iffalse : unsigned(3 downto 0);
signal color_cmp_0_MUX_uxn_c_l217_c2_0fe0_return_output : unsigned(3 downto 0);

-- color2_MUX[uxn_c_l217_c2_0fe0]
signal color2_MUX_uxn_c_l217_c2_0fe0_cond : unsigned(0 downto 0);
signal color2_MUX_uxn_c_l217_c2_0fe0_iftrue : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l217_c2_0fe0_iffalse : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l217_c2_0fe0_return_output : unsigned(11 downto 0);

-- color1_MUX[uxn_c_l217_c2_0fe0]
signal color1_MUX_uxn_c_l217_c2_0fe0_cond : unsigned(0 downto 0);
signal color1_MUX_uxn_c_l217_c2_0fe0_iftrue : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l217_c2_0fe0_iffalse : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l217_c2_0fe0_return_output : unsigned(11 downto 0);

-- CONST_SR_4[uxn_c_l218_c27_5436]
signal CONST_SR_4_uxn_c_l218_c27_5436_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_c_l218_c27_5436_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_c_l220_c7_27fa]
signal BIN_OP_EQ_uxn_c_l220_c7_27fa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l220_c7_27fa_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l220_c7_27fa_return_output : unsigned(0 downto 0);

-- tmp12_MUX[uxn_c_l220_c3_d10e]
signal tmp12_MUX_uxn_c_l220_c3_d10e_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_c_l220_c3_d10e_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l220_c3_d10e_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l220_c3_d10e_return_output : unsigned(11 downto 0);

-- color3_MUX[uxn_c_l220_c3_d10e]
signal color3_MUX_uxn_c_l220_c3_d10e_cond : unsigned(0 downto 0);
signal color3_MUX_uxn_c_l220_c3_d10e_iftrue : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l220_c3_d10e_iffalse : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l220_c3_d10e_return_output : unsigned(11 downto 0);

-- color0_MUX[uxn_c_l220_c3_d10e]
signal color0_MUX_uxn_c_l220_c3_d10e_cond : unsigned(0 downto 0);
signal color0_MUX_uxn_c_l220_c3_d10e_iftrue : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l220_c3_d10e_iffalse : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l220_c3_d10e_return_output : unsigned(11 downto 0);

-- color2_MUX[uxn_c_l220_c3_d10e]
signal color2_MUX_uxn_c_l220_c3_d10e_cond : unsigned(0 downto 0);
signal color2_MUX_uxn_c_l220_c3_d10e_iftrue : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l220_c3_d10e_iffalse : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l220_c3_d10e_return_output : unsigned(11 downto 0);

-- color1_MUX[uxn_c_l220_c3_d10e]
signal color1_MUX_uxn_c_l220_c3_d10e_cond : unsigned(0 downto 0);
signal color1_MUX_uxn_c_l220_c3_d10e_iftrue : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l220_c3_d10e_iffalse : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l220_c3_d10e_return_output : unsigned(11 downto 0);

-- CONST_SL_8[uxn_c_l222_c4_b1ef]
signal CONST_SL_8_uxn_c_l222_c4_b1ef_x : unsigned(11 downto 0);
signal CONST_SL_8_uxn_c_l222_c4_b1ef_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l223_c4_df67]
signal BIN_OP_AND_uxn_c_l223_c4_df67_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l223_c4_df67_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l223_c4_df67_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l224_c4_84c5]
signal BIN_OP_OR_uxn_c_l224_c4_84c5_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l224_c4_84c5_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l224_c4_84c5_return_output : unsigned(11 downto 0);

-- CONST_SL_8[uxn_c_l227_c4_7e77]
signal CONST_SL_8_uxn_c_l227_c4_7e77_x : unsigned(11 downto 0);
signal CONST_SL_8_uxn_c_l227_c4_7e77_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l228_c4_5117]
signal BIN_OP_AND_uxn_c_l228_c4_5117_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l228_c4_5117_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l228_c4_5117_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l229_c4_25f5]
signal BIN_OP_OR_uxn_c_l229_c4_25f5_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l229_c4_25f5_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l229_c4_25f5_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l231_c12_5585]
signal BIN_OP_EQ_uxn_c_l231_c12_5585_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l231_c12_5585_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l231_c12_5585_return_output : unsigned(0 downto 0);

-- tmp12_MUX[uxn_c_l231_c8_e89c]
signal tmp12_MUX_uxn_c_l231_c8_e89c_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_c_l231_c8_e89c_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l231_c8_e89c_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l231_c8_e89c_return_output : unsigned(11 downto 0);

-- color3_MUX[uxn_c_l231_c8_e89c]
signal color3_MUX_uxn_c_l231_c8_e89c_cond : unsigned(0 downto 0);
signal color3_MUX_uxn_c_l231_c8_e89c_iftrue : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l231_c8_e89c_iffalse : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l231_c8_e89c_return_output : unsigned(11 downto 0);

-- color0_MUX[uxn_c_l231_c8_e89c]
signal color0_MUX_uxn_c_l231_c8_e89c_cond : unsigned(0 downto 0);
signal color0_MUX_uxn_c_l231_c8_e89c_iftrue : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l231_c8_e89c_iffalse : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l231_c8_e89c_return_output : unsigned(11 downto 0);

-- color2_MUX[uxn_c_l231_c8_e89c]
signal color2_MUX_uxn_c_l231_c8_e89c_cond : unsigned(0 downto 0);
signal color2_MUX_uxn_c_l231_c8_e89c_iftrue : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l231_c8_e89c_iffalse : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l231_c8_e89c_return_output : unsigned(11 downto 0);

-- color1_MUX[uxn_c_l231_c8_e89c]
signal color1_MUX_uxn_c_l231_c8_e89c_cond : unsigned(0 downto 0);
signal color1_MUX_uxn_c_l231_c8_e89c_iftrue : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l231_c8_e89c_iffalse : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l231_c8_e89c_return_output : unsigned(11 downto 0);

-- CONST_SL_8[uxn_c_l233_c4_b910]
signal CONST_SL_8_uxn_c_l233_c4_b910_x : unsigned(11 downto 0);
signal CONST_SL_8_uxn_c_l233_c4_b910_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l234_c4_f141]
signal BIN_OP_AND_uxn_c_l234_c4_f141_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l234_c4_f141_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l234_c4_f141_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l235_c4_fbe8]
signal BIN_OP_OR_uxn_c_l235_c4_fbe8_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l235_c4_fbe8_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l235_c4_fbe8_return_output : unsigned(11 downto 0);

-- CONST_SL_8[uxn_c_l238_c4_8a63]
signal CONST_SL_8_uxn_c_l238_c4_8a63_x : unsigned(11 downto 0);
signal CONST_SL_8_uxn_c_l238_c4_8a63_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l239_c4_2149]
signal BIN_OP_AND_uxn_c_l239_c4_2149_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l239_c4_2149_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l239_c4_2149_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l240_c4_b839]
signal BIN_OP_OR_uxn_c_l240_c4_b839_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l240_c4_b839_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l240_c4_b839_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l242_c12_3991]
signal BIN_OP_EQ_uxn_c_l242_c12_3991_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l242_c12_3991_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l242_c12_3991_return_output : unsigned(0 downto 0);

-- tmp12_MUX[uxn_c_l242_c8_4769]
signal tmp12_MUX_uxn_c_l242_c8_4769_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_c_l242_c8_4769_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l242_c8_4769_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l242_c8_4769_return_output : unsigned(11 downto 0);

-- color3_MUX[uxn_c_l242_c8_4769]
signal color3_MUX_uxn_c_l242_c8_4769_cond : unsigned(0 downto 0);
signal color3_MUX_uxn_c_l242_c8_4769_iftrue : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l242_c8_4769_iffalse : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l242_c8_4769_return_output : unsigned(11 downto 0);

-- color0_MUX[uxn_c_l242_c8_4769]
signal color0_MUX_uxn_c_l242_c8_4769_cond : unsigned(0 downto 0);
signal color0_MUX_uxn_c_l242_c8_4769_iftrue : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l242_c8_4769_iffalse : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l242_c8_4769_return_output : unsigned(11 downto 0);

-- color2_MUX[uxn_c_l242_c8_4769]
signal color2_MUX_uxn_c_l242_c8_4769_cond : unsigned(0 downto 0);
signal color2_MUX_uxn_c_l242_c8_4769_iftrue : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l242_c8_4769_iffalse : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l242_c8_4769_return_output : unsigned(11 downto 0);

-- color1_MUX[uxn_c_l242_c8_4769]
signal color1_MUX_uxn_c_l242_c8_4769_cond : unsigned(0 downto 0);
signal color1_MUX_uxn_c_l242_c8_4769_iftrue : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l242_c8_4769_iffalse : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l242_c8_4769_return_output : unsigned(11 downto 0);

-- CONST_SL_4[uxn_c_l244_c4_0aa9]
signal CONST_SL_4_uxn_c_l244_c4_0aa9_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_c_l244_c4_0aa9_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l245_c4_2b2a]
signal BIN_OP_AND_uxn_c_l245_c4_2b2a_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l245_c4_2b2a_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l245_c4_2b2a_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l246_c4_7159]
signal BIN_OP_OR_uxn_c_l246_c4_7159_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l246_c4_7159_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l246_c4_7159_return_output : unsigned(11 downto 0);

-- CONST_SL_4[uxn_c_l249_c4_8100]
signal CONST_SL_4_uxn_c_l249_c4_8100_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_c_l249_c4_8100_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l250_c4_e018]
signal BIN_OP_AND_uxn_c_l250_c4_e018_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l250_c4_e018_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l250_c4_e018_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l251_c4_c626]
signal BIN_OP_OR_uxn_c_l251_c4_c626_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l251_c4_c626_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l251_c4_c626_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l253_c12_2f40]
signal BIN_OP_EQ_uxn_c_l253_c12_2f40_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l253_c12_2f40_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l253_c12_2f40_return_output : unsigned(0 downto 0);

-- tmp12_MUX[uxn_c_l253_c8_cbaf]
signal tmp12_MUX_uxn_c_l253_c8_cbaf_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_c_l253_c8_cbaf_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l253_c8_cbaf_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l253_c8_cbaf_return_output : unsigned(11 downto 0);

-- color3_MUX[uxn_c_l253_c8_cbaf]
signal color3_MUX_uxn_c_l253_c8_cbaf_cond : unsigned(0 downto 0);
signal color3_MUX_uxn_c_l253_c8_cbaf_iftrue : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l253_c8_cbaf_iffalse : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l253_c8_cbaf_return_output : unsigned(11 downto 0);

-- color0_MUX[uxn_c_l253_c8_cbaf]
signal color0_MUX_uxn_c_l253_c8_cbaf_cond : unsigned(0 downto 0);
signal color0_MUX_uxn_c_l253_c8_cbaf_iftrue : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l253_c8_cbaf_iffalse : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l253_c8_cbaf_return_output : unsigned(11 downto 0);

-- color2_MUX[uxn_c_l253_c8_cbaf]
signal color2_MUX_uxn_c_l253_c8_cbaf_cond : unsigned(0 downto 0);
signal color2_MUX_uxn_c_l253_c8_cbaf_iftrue : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l253_c8_cbaf_iffalse : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l253_c8_cbaf_return_output : unsigned(11 downto 0);

-- color1_MUX[uxn_c_l253_c8_cbaf]
signal color1_MUX_uxn_c_l253_c8_cbaf_cond : unsigned(0 downto 0);
signal color1_MUX_uxn_c_l253_c8_cbaf_iftrue : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l253_c8_cbaf_iffalse : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l253_c8_cbaf_return_output : unsigned(11 downto 0);

-- CONST_SL_4[uxn_c_l255_c4_0ca5]
signal CONST_SL_4_uxn_c_l255_c4_0ca5_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_c_l255_c4_0ca5_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l256_c4_e68a]
signal BIN_OP_AND_uxn_c_l256_c4_e68a_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l256_c4_e68a_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l256_c4_e68a_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l257_c4_9275]
signal BIN_OP_OR_uxn_c_l257_c4_9275_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l257_c4_9275_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l257_c4_9275_return_output : unsigned(11 downto 0);

-- CONST_SL_4[uxn_c_l260_c4_83a4]
signal CONST_SL_4_uxn_c_l260_c4_83a4_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_c_l260_c4_83a4_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l261_c4_7118]
signal BIN_OP_AND_uxn_c_l261_c4_7118_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l261_c4_7118_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l261_c4_7118_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l262_c4_5852]
signal BIN_OP_OR_uxn_c_l262_c4_5852_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l262_c4_5852_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l262_c4_5852_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l264_c12_b1ad]
signal BIN_OP_EQ_uxn_c_l264_c12_b1ad_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l264_c12_b1ad_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l264_c12_b1ad_return_output : unsigned(0 downto 0);

-- tmp12_MUX[uxn_c_l264_c8_eaef]
signal tmp12_MUX_uxn_c_l264_c8_eaef_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_c_l264_c8_eaef_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l264_c8_eaef_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l264_c8_eaef_return_output : unsigned(11 downto 0);

-- color3_MUX[uxn_c_l264_c8_eaef]
signal color3_MUX_uxn_c_l264_c8_eaef_cond : unsigned(0 downto 0);
signal color3_MUX_uxn_c_l264_c8_eaef_iftrue : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l264_c8_eaef_iffalse : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l264_c8_eaef_return_output : unsigned(11 downto 0);

-- color0_MUX[uxn_c_l264_c8_eaef]
signal color0_MUX_uxn_c_l264_c8_eaef_cond : unsigned(0 downto 0);
signal color0_MUX_uxn_c_l264_c8_eaef_iftrue : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l264_c8_eaef_iffalse : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l264_c8_eaef_return_output : unsigned(11 downto 0);

-- color2_MUX[uxn_c_l264_c8_eaef]
signal color2_MUX_uxn_c_l264_c8_eaef_cond : unsigned(0 downto 0);
signal color2_MUX_uxn_c_l264_c8_eaef_iftrue : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l264_c8_eaef_iffalse : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l264_c8_eaef_return_output : unsigned(11 downto 0);

-- color1_MUX[uxn_c_l264_c8_eaef]
signal color1_MUX_uxn_c_l264_c8_eaef_cond : unsigned(0 downto 0);
signal color1_MUX_uxn_c_l264_c8_eaef_iftrue : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l264_c8_eaef_iffalse : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l264_c8_eaef_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l266_c4_61ec]
signal BIN_OP_AND_uxn_c_l266_c4_61ec_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l266_c4_61ec_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l266_c4_61ec_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l267_c4_d494]
signal BIN_OP_OR_uxn_c_l267_c4_d494_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l267_c4_d494_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l267_c4_d494_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l270_c4_8e31]
signal BIN_OP_AND_uxn_c_l270_c4_8e31_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l270_c4_8e31_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l270_c4_8e31_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l271_c4_05aa]
signal BIN_OP_OR_uxn_c_l271_c4_05aa_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l271_c4_05aa_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l271_c4_05aa_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l273_c12_4b10]
signal BIN_OP_EQ_uxn_c_l273_c12_4b10_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l273_c12_4b10_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l273_c12_4b10_return_output : unsigned(0 downto 0);

-- tmp12_MUX[uxn_c_l273_c8_9790]
signal tmp12_MUX_uxn_c_l273_c8_9790_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_c_l273_c8_9790_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l273_c8_9790_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l273_c8_9790_return_output : unsigned(11 downto 0);

-- color3_MUX[uxn_c_l273_c8_9790]
signal color3_MUX_uxn_c_l273_c8_9790_cond : unsigned(0 downto 0);
signal color3_MUX_uxn_c_l273_c8_9790_iftrue : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l273_c8_9790_iffalse : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l273_c8_9790_return_output : unsigned(11 downto 0);

-- color2_MUX[uxn_c_l273_c8_9790]
signal color2_MUX_uxn_c_l273_c8_9790_cond : unsigned(0 downto 0);
signal color2_MUX_uxn_c_l273_c8_9790_iftrue : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l273_c8_9790_iffalse : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l273_c8_9790_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l275_c4_4712]
signal BIN_OP_AND_uxn_c_l275_c4_4712_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l275_c4_4712_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l275_c4_4712_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l276_c4_2c8c]
signal BIN_OP_OR_uxn_c_l276_c4_2c8c_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l276_c4_2c8c_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l276_c4_2c8c_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l279_c4_1915]
signal BIN_OP_AND_uxn_c_l279_c4_1915_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l279_c4_1915_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l279_c4_1915_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l280_c4_6d66]
signal BIN_OP_OR_uxn_c_l280_c4_6d66_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l280_c4_6d66_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l280_c4_6d66_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l284_c6_75a7]
signal BIN_OP_EQ_uxn_c_l284_c6_75a7_left : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l284_c6_75a7_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l284_c6_75a7_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_c_l284_c2_b5d3]
signal result_MUX_uxn_c_l284_c2_b5d3_cond : unsigned(0 downto 0);
signal result_MUX_uxn_c_l284_c2_b5d3_iftrue : unsigned(15 downto 0);
signal result_MUX_uxn_c_l284_c2_b5d3_iffalse : unsigned(15 downto 0);
signal result_MUX_uxn_c_l284_c2_b5d3_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l286_c13_70d8]
signal BIN_OP_EQ_uxn_c_l286_c13_70d8_left : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l286_c13_70d8_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l286_c13_70d8_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_c_l286_c9_cb5b]
signal result_MUX_uxn_c_l286_c9_cb5b_cond : unsigned(0 downto 0);
signal result_MUX_uxn_c_l286_c9_cb5b_iftrue : unsigned(15 downto 0);
signal result_MUX_uxn_c_l286_c9_cb5b_iffalse : unsigned(15 downto 0);
signal result_MUX_uxn_c_l286_c9_cb5b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l288_c13_28de]
signal BIN_OP_EQ_uxn_c_l288_c13_28de_left : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l288_c13_28de_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l288_c13_28de_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_c_l288_c9_8501]
signal result_MUX_uxn_c_l288_c9_8501_cond : unsigned(0 downto 0);
signal result_MUX_uxn_c_l288_c9_8501_iftrue : unsigned(15 downto 0);
signal result_MUX_uxn_c_l288_c9_8501_iffalse : unsigned(15 downto 0);
signal result_MUX_uxn_c_l288_c9_8501_return_output : unsigned(15 downto 0);

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
-- tmp12_MUX_uxn_c_l217_c2_0fe0
tmp12_MUX_uxn_c_l217_c2_0fe0 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_c_l217_c2_0fe0_cond,
tmp12_MUX_uxn_c_l217_c2_0fe0_iftrue,
tmp12_MUX_uxn_c_l217_c2_0fe0_iffalse,
tmp12_MUX_uxn_c_l217_c2_0fe0_return_output);

-- color_cmp_1_MUX_uxn_c_l217_c2_0fe0
color_cmp_1_MUX_uxn_c_l217_c2_0fe0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_cmp_1_MUX_uxn_c_l217_c2_0fe0_cond,
color_cmp_1_MUX_uxn_c_l217_c2_0fe0_iftrue,
color_cmp_1_MUX_uxn_c_l217_c2_0fe0_iffalse,
color_cmp_1_MUX_uxn_c_l217_c2_0fe0_return_output);

-- color3_MUX_uxn_c_l217_c2_0fe0
color3_MUX_uxn_c_l217_c2_0fe0 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color3_MUX_uxn_c_l217_c2_0fe0_cond,
color3_MUX_uxn_c_l217_c2_0fe0_iftrue,
color3_MUX_uxn_c_l217_c2_0fe0_iffalse,
color3_MUX_uxn_c_l217_c2_0fe0_return_output);

-- color0_MUX_uxn_c_l217_c2_0fe0
color0_MUX_uxn_c_l217_c2_0fe0 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color0_MUX_uxn_c_l217_c2_0fe0_cond,
color0_MUX_uxn_c_l217_c2_0fe0_iftrue,
color0_MUX_uxn_c_l217_c2_0fe0_iffalse,
color0_MUX_uxn_c_l217_c2_0fe0_return_output);

-- color_cmp_0_MUX_uxn_c_l217_c2_0fe0
color_cmp_0_MUX_uxn_c_l217_c2_0fe0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_cmp_0_MUX_uxn_c_l217_c2_0fe0_cond,
color_cmp_0_MUX_uxn_c_l217_c2_0fe0_iftrue,
color_cmp_0_MUX_uxn_c_l217_c2_0fe0_iffalse,
color_cmp_0_MUX_uxn_c_l217_c2_0fe0_return_output);

-- color2_MUX_uxn_c_l217_c2_0fe0
color2_MUX_uxn_c_l217_c2_0fe0 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color2_MUX_uxn_c_l217_c2_0fe0_cond,
color2_MUX_uxn_c_l217_c2_0fe0_iftrue,
color2_MUX_uxn_c_l217_c2_0fe0_iffalse,
color2_MUX_uxn_c_l217_c2_0fe0_return_output);

-- color1_MUX_uxn_c_l217_c2_0fe0
color1_MUX_uxn_c_l217_c2_0fe0 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color1_MUX_uxn_c_l217_c2_0fe0_cond,
color1_MUX_uxn_c_l217_c2_0fe0_iftrue,
color1_MUX_uxn_c_l217_c2_0fe0_iffalse,
color1_MUX_uxn_c_l217_c2_0fe0_return_output);

-- CONST_SR_4_uxn_c_l218_c27_5436
CONST_SR_4_uxn_c_l218_c27_5436 : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_c_l218_c27_5436_x,
CONST_SR_4_uxn_c_l218_c27_5436_return_output);

-- BIN_OP_EQ_uxn_c_l220_c7_27fa
BIN_OP_EQ_uxn_c_l220_c7_27fa : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l220_c7_27fa_left,
BIN_OP_EQ_uxn_c_l220_c7_27fa_right,
BIN_OP_EQ_uxn_c_l220_c7_27fa_return_output);

-- tmp12_MUX_uxn_c_l220_c3_d10e
tmp12_MUX_uxn_c_l220_c3_d10e : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_c_l220_c3_d10e_cond,
tmp12_MUX_uxn_c_l220_c3_d10e_iftrue,
tmp12_MUX_uxn_c_l220_c3_d10e_iffalse,
tmp12_MUX_uxn_c_l220_c3_d10e_return_output);

-- color3_MUX_uxn_c_l220_c3_d10e
color3_MUX_uxn_c_l220_c3_d10e : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color3_MUX_uxn_c_l220_c3_d10e_cond,
color3_MUX_uxn_c_l220_c3_d10e_iftrue,
color3_MUX_uxn_c_l220_c3_d10e_iffalse,
color3_MUX_uxn_c_l220_c3_d10e_return_output);

-- color0_MUX_uxn_c_l220_c3_d10e
color0_MUX_uxn_c_l220_c3_d10e : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color0_MUX_uxn_c_l220_c3_d10e_cond,
color0_MUX_uxn_c_l220_c3_d10e_iftrue,
color0_MUX_uxn_c_l220_c3_d10e_iffalse,
color0_MUX_uxn_c_l220_c3_d10e_return_output);

-- color2_MUX_uxn_c_l220_c3_d10e
color2_MUX_uxn_c_l220_c3_d10e : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color2_MUX_uxn_c_l220_c3_d10e_cond,
color2_MUX_uxn_c_l220_c3_d10e_iftrue,
color2_MUX_uxn_c_l220_c3_d10e_iffalse,
color2_MUX_uxn_c_l220_c3_d10e_return_output);

-- color1_MUX_uxn_c_l220_c3_d10e
color1_MUX_uxn_c_l220_c3_d10e : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color1_MUX_uxn_c_l220_c3_d10e_cond,
color1_MUX_uxn_c_l220_c3_d10e_iftrue,
color1_MUX_uxn_c_l220_c3_d10e_iffalse,
color1_MUX_uxn_c_l220_c3_d10e_return_output);

-- CONST_SL_8_uxn_c_l222_c4_b1ef
CONST_SL_8_uxn_c_l222_c4_b1ef : entity work.CONST_SL_8_uint12_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l222_c4_b1ef_x,
CONST_SL_8_uxn_c_l222_c4_b1ef_return_output);

-- BIN_OP_AND_uxn_c_l223_c4_df67
BIN_OP_AND_uxn_c_l223_c4_df67 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l223_c4_df67_left,
BIN_OP_AND_uxn_c_l223_c4_df67_right,
BIN_OP_AND_uxn_c_l223_c4_df67_return_output);

-- BIN_OP_OR_uxn_c_l224_c4_84c5
BIN_OP_OR_uxn_c_l224_c4_84c5 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l224_c4_84c5_left,
BIN_OP_OR_uxn_c_l224_c4_84c5_right,
BIN_OP_OR_uxn_c_l224_c4_84c5_return_output);

-- CONST_SL_8_uxn_c_l227_c4_7e77
CONST_SL_8_uxn_c_l227_c4_7e77 : entity work.CONST_SL_8_uint12_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l227_c4_7e77_x,
CONST_SL_8_uxn_c_l227_c4_7e77_return_output);

-- BIN_OP_AND_uxn_c_l228_c4_5117
BIN_OP_AND_uxn_c_l228_c4_5117 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l228_c4_5117_left,
BIN_OP_AND_uxn_c_l228_c4_5117_right,
BIN_OP_AND_uxn_c_l228_c4_5117_return_output);

-- BIN_OP_OR_uxn_c_l229_c4_25f5
BIN_OP_OR_uxn_c_l229_c4_25f5 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l229_c4_25f5_left,
BIN_OP_OR_uxn_c_l229_c4_25f5_right,
BIN_OP_OR_uxn_c_l229_c4_25f5_return_output);

-- BIN_OP_EQ_uxn_c_l231_c12_5585
BIN_OP_EQ_uxn_c_l231_c12_5585 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l231_c12_5585_left,
BIN_OP_EQ_uxn_c_l231_c12_5585_right,
BIN_OP_EQ_uxn_c_l231_c12_5585_return_output);

-- tmp12_MUX_uxn_c_l231_c8_e89c
tmp12_MUX_uxn_c_l231_c8_e89c : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_c_l231_c8_e89c_cond,
tmp12_MUX_uxn_c_l231_c8_e89c_iftrue,
tmp12_MUX_uxn_c_l231_c8_e89c_iffalse,
tmp12_MUX_uxn_c_l231_c8_e89c_return_output);

-- color3_MUX_uxn_c_l231_c8_e89c
color3_MUX_uxn_c_l231_c8_e89c : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color3_MUX_uxn_c_l231_c8_e89c_cond,
color3_MUX_uxn_c_l231_c8_e89c_iftrue,
color3_MUX_uxn_c_l231_c8_e89c_iffalse,
color3_MUX_uxn_c_l231_c8_e89c_return_output);

-- color0_MUX_uxn_c_l231_c8_e89c
color0_MUX_uxn_c_l231_c8_e89c : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color0_MUX_uxn_c_l231_c8_e89c_cond,
color0_MUX_uxn_c_l231_c8_e89c_iftrue,
color0_MUX_uxn_c_l231_c8_e89c_iffalse,
color0_MUX_uxn_c_l231_c8_e89c_return_output);

-- color2_MUX_uxn_c_l231_c8_e89c
color2_MUX_uxn_c_l231_c8_e89c : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color2_MUX_uxn_c_l231_c8_e89c_cond,
color2_MUX_uxn_c_l231_c8_e89c_iftrue,
color2_MUX_uxn_c_l231_c8_e89c_iffalse,
color2_MUX_uxn_c_l231_c8_e89c_return_output);

-- color1_MUX_uxn_c_l231_c8_e89c
color1_MUX_uxn_c_l231_c8_e89c : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color1_MUX_uxn_c_l231_c8_e89c_cond,
color1_MUX_uxn_c_l231_c8_e89c_iftrue,
color1_MUX_uxn_c_l231_c8_e89c_iffalse,
color1_MUX_uxn_c_l231_c8_e89c_return_output);

-- CONST_SL_8_uxn_c_l233_c4_b910
CONST_SL_8_uxn_c_l233_c4_b910 : entity work.CONST_SL_8_uint12_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l233_c4_b910_x,
CONST_SL_8_uxn_c_l233_c4_b910_return_output);

-- BIN_OP_AND_uxn_c_l234_c4_f141
BIN_OP_AND_uxn_c_l234_c4_f141 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l234_c4_f141_left,
BIN_OP_AND_uxn_c_l234_c4_f141_right,
BIN_OP_AND_uxn_c_l234_c4_f141_return_output);

-- BIN_OP_OR_uxn_c_l235_c4_fbe8
BIN_OP_OR_uxn_c_l235_c4_fbe8 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l235_c4_fbe8_left,
BIN_OP_OR_uxn_c_l235_c4_fbe8_right,
BIN_OP_OR_uxn_c_l235_c4_fbe8_return_output);

-- CONST_SL_8_uxn_c_l238_c4_8a63
CONST_SL_8_uxn_c_l238_c4_8a63 : entity work.CONST_SL_8_uint12_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l238_c4_8a63_x,
CONST_SL_8_uxn_c_l238_c4_8a63_return_output);

-- BIN_OP_AND_uxn_c_l239_c4_2149
BIN_OP_AND_uxn_c_l239_c4_2149 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l239_c4_2149_left,
BIN_OP_AND_uxn_c_l239_c4_2149_right,
BIN_OP_AND_uxn_c_l239_c4_2149_return_output);

-- BIN_OP_OR_uxn_c_l240_c4_b839
BIN_OP_OR_uxn_c_l240_c4_b839 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l240_c4_b839_left,
BIN_OP_OR_uxn_c_l240_c4_b839_right,
BIN_OP_OR_uxn_c_l240_c4_b839_return_output);

-- BIN_OP_EQ_uxn_c_l242_c12_3991
BIN_OP_EQ_uxn_c_l242_c12_3991 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l242_c12_3991_left,
BIN_OP_EQ_uxn_c_l242_c12_3991_right,
BIN_OP_EQ_uxn_c_l242_c12_3991_return_output);

-- tmp12_MUX_uxn_c_l242_c8_4769
tmp12_MUX_uxn_c_l242_c8_4769 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_c_l242_c8_4769_cond,
tmp12_MUX_uxn_c_l242_c8_4769_iftrue,
tmp12_MUX_uxn_c_l242_c8_4769_iffalse,
tmp12_MUX_uxn_c_l242_c8_4769_return_output);

-- color3_MUX_uxn_c_l242_c8_4769
color3_MUX_uxn_c_l242_c8_4769 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color3_MUX_uxn_c_l242_c8_4769_cond,
color3_MUX_uxn_c_l242_c8_4769_iftrue,
color3_MUX_uxn_c_l242_c8_4769_iffalse,
color3_MUX_uxn_c_l242_c8_4769_return_output);

-- color0_MUX_uxn_c_l242_c8_4769
color0_MUX_uxn_c_l242_c8_4769 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color0_MUX_uxn_c_l242_c8_4769_cond,
color0_MUX_uxn_c_l242_c8_4769_iftrue,
color0_MUX_uxn_c_l242_c8_4769_iffalse,
color0_MUX_uxn_c_l242_c8_4769_return_output);

-- color2_MUX_uxn_c_l242_c8_4769
color2_MUX_uxn_c_l242_c8_4769 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color2_MUX_uxn_c_l242_c8_4769_cond,
color2_MUX_uxn_c_l242_c8_4769_iftrue,
color2_MUX_uxn_c_l242_c8_4769_iffalse,
color2_MUX_uxn_c_l242_c8_4769_return_output);

-- color1_MUX_uxn_c_l242_c8_4769
color1_MUX_uxn_c_l242_c8_4769 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color1_MUX_uxn_c_l242_c8_4769_cond,
color1_MUX_uxn_c_l242_c8_4769_iftrue,
color1_MUX_uxn_c_l242_c8_4769_iffalse,
color1_MUX_uxn_c_l242_c8_4769_return_output);

-- CONST_SL_4_uxn_c_l244_c4_0aa9
CONST_SL_4_uxn_c_l244_c4_0aa9 : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_c_l244_c4_0aa9_x,
CONST_SL_4_uxn_c_l244_c4_0aa9_return_output);

-- BIN_OP_AND_uxn_c_l245_c4_2b2a
BIN_OP_AND_uxn_c_l245_c4_2b2a : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l245_c4_2b2a_left,
BIN_OP_AND_uxn_c_l245_c4_2b2a_right,
BIN_OP_AND_uxn_c_l245_c4_2b2a_return_output);

-- BIN_OP_OR_uxn_c_l246_c4_7159
BIN_OP_OR_uxn_c_l246_c4_7159 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l246_c4_7159_left,
BIN_OP_OR_uxn_c_l246_c4_7159_right,
BIN_OP_OR_uxn_c_l246_c4_7159_return_output);

-- CONST_SL_4_uxn_c_l249_c4_8100
CONST_SL_4_uxn_c_l249_c4_8100 : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_c_l249_c4_8100_x,
CONST_SL_4_uxn_c_l249_c4_8100_return_output);

-- BIN_OP_AND_uxn_c_l250_c4_e018
BIN_OP_AND_uxn_c_l250_c4_e018 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l250_c4_e018_left,
BIN_OP_AND_uxn_c_l250_c4_e018_right,
BIN_OP_AND_uxn_c_l250_c4_e018_return_output);

-- BIN_OP_OR_uxn_c_l251_c4_c626
BIN_OP_OR_uxn_c_l251_c4_c626 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l251_c4_c626_left,
BIN_OP_OR_uxn_c_l251_c4_c626_right,
BIN_OP_OR_uxn_c_l251_c4_c626_return_output);

-- BIN_OP_EQ_uxn_c_l253_c12_2f40
BIN_OP_EQ_uxn_c_l253_c12_2f40 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l253_c12_2f40_left,
BIN_OP_EQ_uxn_c_l253_c12_2f40_right,
BIN_OP_EQ_uxn_c_l253_c12_2f40_return_output);

-- tmp12_MUX_uxn_c_l253_c8_cbaf
tmp12_MUX_uxn_c_l253_c8_cbaf : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_c_l253_c8_cbaf_cond,
tmp12_MUX_uxn_c_l253_c8_cbaf_iftrue,
tmp12_MUX_uxn_c_l253_c8_cbaf_iffalse,
tmp12_MUX_uxn_c_l253_c8_cbaf_return_output);

-- color3_MUX_uxn_c_l253_c8_cbaf
color3_MUX_uxn_c_l253_c8_cbaf : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color3_MUX_uxn_c_l253_c8_cbaf_cond,
color3_MUX_uxn_c_l253_c8_cbaf_iftrue,
color3_MUX_uxn_c_l253_c8_cbaf_iffalse,
color3_MUX_uxn_c_l253_c8_cbaf_return_output);

-- color0_MUX_uxn_c_l253_c8_cbaf
color0_MUX_uxn_c_l253_c8_cbaf : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color0_MUX_uxn_c_l253_c8_cbaf_cond,
color0_MUX_uxn_c_l253_c8_cbaf_iftrue,
color0_MUX_uxn_c_l253_c8_cbaf_iffalse,
color0_MUX_uxn_c_l253_c8_cbaf_return_output);

-- color2_MUX_uxn_c_l253_c8_cbaf
color2_MUX_uxn_c_l253_c8_cbaf : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color2_MUX_uxn_c_l253_c8_cbaf_cond,
color2_MUX_uxn_c_l253_c8_cbaf_iftrue,
color2_MUX_uxn_c_l253_c8_cbaf_iffalse,
color2_MUX_uxn_c_l253_c8_cbaf_return_output);

-- color1_MUX_uxn_c_l253_c8_cbaf
color1_MUX_uxn_c_l253_c8_cbaf : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color1_MUX_uxn_c_l253_c8_cbaf_cond,
color1_MUX_uxn_c_l253_c8_cbaf_iftrue,
color1_MUX_uxn_c_l253_c8_cbaf_iffalse,
color1_MUX_uxn_c_l253_c8_cbaf_return_output);

-- CONST_SL_4_uxn_c_l255_c4_0ca5
CONST_SL_4_uxn_c_l255_c4_0ca5 : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_c_l255_c4_0ca5_x,
CONST_SL_4_uxn_c_l255_c4_0ca5_return_output);

-- BIN_OP_AND_uxn_c_l256_c4_e68a
BIN_OP_AND_uxn_c_l256_c4_e68a : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l256_c4_e68a_left,
BIN_OP_AND_uxn_c_l256_c4_e68a_right,
BIN_OP_AND_uxn_c_l256_c4_e68a_return_output);

-- BIN_OP_OR_uxn_c_l257_c4_9275
BIN_OP_OR_uxn_c_l257_c4_9275 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l257_c4_9275_left,
BIN_OP_OR_uxn_c_l257_c4_9275_right,
BIN_OP_OR_uxn_c_l257_c4_9275_return_output);

-- CONST_SL_4_uxn_c_l260_c4_83a4
CONST_SL_4_uxn_c_l260_c4_83a4 : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_c_l260_c4_83a4_x,
CONST_SL_4_uxn_c_l260_c4_83a4_return_output);

-- BIN_OP_AND_uxn_c_l261_c4_7118
BIN_OP_AND_uxn_c_l261_c4_7118 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l261_c4_7118_left,
BIN_OP_AND_uxn_c_l261_c4_7118_right,
BIN_OP_AND_uxn_c_l261_c4_7118_return_output);

-- BIN_OP_OR_uxn_c_l262_c4_5852
BIN_OP_OR_uxn_c_l262_c4_5852 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l262_c4_5852_left,
BIN_OP_OR_uxn_c_l262_c4_5852_right,
BIN_OP_OR_uxn_c_l262_c4_5852_return_output);

-- BIN_OP_EQ_uxn_c_l264_c12_b1ad
BIN_OP_EQ_uxn_c_l264_c12_b1ad : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l264_c12_b1ad_left,
BIN_OP_EQ_uxn_c_l264_c12_b1ad_right,
BIN_OP_EQ_uxn_c_l264_c12_b1ad_return_output);

-- tmp12_MUX_uxn_c_l264_c8_eaef
tmp12_MUX_uxn_c_l264_c8_eaef : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_c_l264_c8_eaef_cond,
tmp12_MUX_uxn_c_l264_c8_eaef_iftrue,
tmp12_MUX_uxn_c_l264_c8_eaef_iffalse,
tmp12_MUX_uxn_c_l264_c8_eaef_return_output);

-- color3_MUX_uxn_c_l264_c8_eaef
color3_MUX_uxn_c_l264_c8_eaef : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color3_MUX_uxn_c_l264_c8_eaef_cond,
color3_MUX_uxn_c_l264_c8_eaef_iftrue,
color3_MUX_uxn_c_l264_c8_eaef_iffalse,
color3_MUX_uxn_c_l264_c8_eaef_return_output);

-- color0_MUX_uxn_c_l264_c8_eaef
color0_MUX_uxn_c_l264_c8_eaef : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color0_MUX_uxn_c_l264_c8_eaef_cond,
color0_MUX_uxn_c_l264_c8_eaef_iftrue,
color0_MUX_uxn_c_l264_c8_eaef_iffalse,
color0_MUX_uxn_c_l264_c8_eaef_return_output);

-- color2_MUX_uxn_c_l264_c8_eaef
color2_MUX_uxn_c_l264_c8_eaef : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color2_MUX_uxn_c_l264_c8_eaef_cond,
color2_MUX_uxn_c_l264_c8_eaef_iftrue,
color2_MUX_uxn_c_l264_c8_eaef_iffalse,
color2_MUX_uxn_c_l264_c8_eaef_return_output);

-- color1_MUX_uxn_c_l264_c8_eaef
color1_MUX_uxn_c_l264_c8_eaef : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color1_MUX_uxn_c_l264_c8_eaef_cond,
color1_MUX_uxn_c_l264_c8_eaef_iftrue,
color1_MUX_uxn_c_l264_c8_eaef_iffalse,
color1_MUX_uxn_c_l264_c8_eaef_return_output);

-- BIN_OP_AND_uxn_c_l266_c4_61ec
BIN_OP_AND_uxn_c_l266_c4_61ec : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l266_c4_61ec_left,
BIN_OP_AND_uxn_c_l266_c4_61ec_right,
BIN_OP_AND_uxn_c_l266_c4_61ec_return_output);

-- BIN_OP_OR_uxn_c_l267_c4_d494
BIN_OP_OR_uxn_c_l267_c4_d494 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l267_c4_d494_left,
BIN_OP_OR_uxn_c_l267_c4_d494_right,
BIN_OP_OR_uxn_c_l267_c4_d494_return_output);

-- BIN_OP_AND_uxn_c_l270_c4_8e31
BIN_OP_AND_uxn_c_l270_c4_8e31 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l270_c4_8e31_left,
BIN_OP_AND_uxn_c_l270_c4_8e31_right,
BIN_OP_AND_uxn_c_l270_c4_8e31_return_output);

-- BIN_OP_OR_uxn_c_l271_c4_05aa
BIN_OP_OR_uxn_c_l271_c4_05aa : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l271_c4_05aa_left,
BIN_OP_OR_uxn_c_l271_c4_05aa_right,
BIN_OP_OR_uxn_c_l271_c4_05aa_return_output);

-- BIN_OP_EQ_uxn_c_l273_c12_4b10
BIN_OP_EQ_uxn_c_l273_c12_4b10 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l273_c12_4b10_left,
BIN_OP_EQ_uxn_c_l273_c12_4b10_right,
BIN_OP_EQ_uxn_c_l273_c12_4b10_return_output);

-- tmp12_MUX_uxn_c_l273_c8_9790
tmp12_MUX_uxn_c_l273_c8_9790 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_c_l273_c8_9790_cond,
tmp12_MUX_uxn_c_l273_c8_9790_iftrue,
tmp12_MUX_uxn_c_l273_c8_9790_iffalse,
tmp12_MUX_uxn_c_l273_c8_9790_return_output);

-- color3_MUX_uxn_c_l273_c8_9790
color3_MUX_uxn_c_l273_c8_9790 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color3_MUX_uxn_c_l273_c8_9790_cond,
color3_MUX_uxn_c_l273_c8_9790_iftrue,
color3_MUX_uxn_c_l273_c8_9790_iffalse,
color3_MUX_uxn_c_l273_c8_9790_return_output);

-- color2_MUX_uxn_c_l273_c8_9790
color2_MUX_uxn_c_l273_c8_9790 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color2_MUX_uxn_c_l273_c8_9790_cond,
color2_MUX_uxn_c_l273_c8_9790_iftrue,
color2_MUX_uxn_c_l273_c8_9790_iffalse,
color2_MUX_uxn_c_l273_c8_9790_return_output);

-- BIN_OP_AND_uxn_c_l275_c4_4712
BIN_OP_AND_uxn_c_l275_c4_4712 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l275_c4_4712_left,
BIN_OP_AND_uxn_c_l275_c4_4712_right,
BIN_OP_AND_uxn_c_l275_c4_4712_return_output);

-- BIN_OP_OR_uxn_c_l276_c4_2c8c
BIN_OP_OR_uxn_c_l276_c4_2c8c : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l276_c4_2c8c_left,
BIN_OP_OR_uxn_c_l276_c4_2c8c_right,
BIN_OP_OR_uxn_c_l276_c4_2c8c_return_output);

-- BIN_OP_AND_uxn_c_l279_c4_1915
BIN_OP_AND_uxn_c_l279_c4_1915 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l279_c4_1915_left,
BIN_OP_AND_uxn_c_l279_c4_1915_right,
BIN_OP_AND_uxn_c_l279_c4_1915_return_output);

-- BIN_OP_OR_uxn_c_l280_c4_6d66
BIN_OP_OR_uxn_c_l280_c4_6d66 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l280_c4_6d66_left,
BIN_OP_OR_uxn_c_l280_c4_6d66_right,
BIN_OP_OR_uxn_c_l280_c4_6d66_return_output);

-- BIN_OP_EQ_uxn_c_l284_c6_75a7
BIN_OP_EQ_uxn_c_l284_c6_75a7 : entity work.BIN_OP_EQ_uint2_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l284_c6_75a7_left,
BIN_OP_EQ_uxn_c_l284_c6_75a7_right,
BIN_OP_EQ_uxn_c_l284_c6_75a7_return_output);

-- result_MUX_uxn_c_l284_c2_b5d3
result_MUX_uxn_c_l284_c2_b5d3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_MUX_uxn_c_l284_c2_b5d3_cond,
result_MUX_uxn_c_l284_c2_b5d3_iftrue,
result_MUX_uxn_c_l284_c2_b5d3_iffalse,
result_MUX_uxn_c_l284_c2_b5d3_return_output);

-- BIN_OP_EQ_uxn_c_l286_c13_70d8
BIN_OP_EQ_uxn_c_l286_c13_70d8 : entity work.BIN_OP_EQ_uint2_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l286_c13_70d8_left,
BIN_OP_EQ_uxn_c_l286_c13_70d8_right,
BIN_OP_EQ_uxn_c_l286_c13_70d8_return_output);

-- result_MUX_uxn_c_l286_c9_cb5b
result_MUX_uxn_c_l286_c9_cb5b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_MUX_uxn_c_l286_c9_cb5b_cond,
result_MUX_uxn_c_l286_c9_cb5b_iftrue,
result_MUX_uxn_c_l286_c9_cb5b_iffalse,
result_MUX_uxn_c_l286_c9_cb5b_return_output);

-- BIN_OP_EQ_uxn_c_l288_c13_28de
BIN_OP_EQ_uxn_c_l288_c13_28de : entity work.BIN_OP_EQ_uint2_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l288_c13_28de_left,
BIN_OP_EQ_uxn_c_l288_c13_28de_right,
BIN_OP_EQ_uxn_c_l288_c13_28de_return_output);

-- result_MUX_uxn_c_l288_c9_8501
result_MUX_uxn_c_l288_c9_8501 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_MUX_uxn_c_l288_c9_8501_cond,
result_MUX_uxn_c_l288_c9_8501_iftrue,
result_MUX_uxn_c_l288_c9_8501_iffalse,
result_MUX_uxn_c_l288_c9_8501_return_output);



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
 tmp12_MUX_uxn_c_l217_c2_0fe0_return_output,
 color_cmp_1_MUX_uxn_c_l217_c2_0fe0_return_output,
 color3_MUX_uxn_c_l217_c2_0fe0_return_output,
 color0_MUX_uxn_c_l217_c2_0fe0_return_output,
 color_cmp_0_MUX_uxn_c_l217_c2_0fe0_return_output,
 color2_MUX_uxn_c_l217_c2_0fe0_return_output,
 color1_MUX_uxn_c_l217_c2_0fe0_return_output,
 CONST_SR_4_uxn_c_l218_c27_5436_return_output,
 BIN_OP_EQ_uxn_c_l220_c7_27fa_return_output,
 tmp12_MUX_uxn_c_l220_c3_d10e_return_output,
 color3_MUX_uxn_c_l220_c3_d10e_return_output,
 color0_MUX_uxn_c_l220_c3_d10e_return_output,
 color2_MUX_uxn_c_l220_c3_d10e_return_output,
 color1_MUX_uxn_c_l220_c3_d10e_return_output,
 CONST_SL_8_uxn_c_l222_c4_b1ef_return_output,
 BIN_OP_AND_uxn_c_l223_c4_df67_return_output,
 BIN_OP_OR_uxn_c_l224_c4_84c5_return_output,
 CONST_SL_8_uxn_c_l227_c4_7e77_return_output,
 BIN_OP_AND_uxn_c_l228_c4_5117_return_output,
 BIN_OP_OR_uxn_c_l229_c4_25f5_return_output,
 BIN_OP_EQ_uxn_c_l231_c12_5585_return_output,
 tmp12_MUX_uxn_c_l231_c8_e89c_return_output,
 color3_MUX_uxn_c_l231_c8_e89c_return_output,
 color0_MUX_uxn_c_l231_c8_e89c_return_output,
 color2_MUX_uxn_c_l231_c8_e89c_return_output,
 color1_MUX_uxn_c_l231_c8_e89c_return_output,
 CONST_SL_8_uxn_c_l233_c4_b910_return_output,
 BIN_OP_AND_uxn_c_l234_c4_f141_return_output,
 BIN_OP_OR_uxn_c_l235_c4_fbe8_return_output,
 CONST_SL_8_uxn_c_l238_c4_8a63_return_output,
 BIN_OP_AND_uxn_c_l239_c4_2149_return_output,
 BIN_OP_OR_uxn_c_l240_c4_b839_return_output,
 BIN_OP_EQ_uxn_c_l242_c12_3991_return_output,
 tmp12_MUX_uxn_c_l242_c8_4769_return_output,
 color3_MUX_uxn_c_l242_c8_4769_return_output,
 color0_MUX_uxn_c_l242_c8_4769_return_output,
 color2_MUX_uxn_c_l242_c8_4769_return_output,
 color1_MUX_uxn_c_l242_c8_4769_return_output,
 CONST_SL_4_uxn_c_l244_c4_0aa9_return_output,
 BIN_OP_AND_uxn_c_l245_c4_2b2a_return_output,
 BIN_OP_OR_uxn_c_l246_c4_7159_return_output,
 CONST_SL_4_uxn_c_l249_c4_8100_return_output,
 BIN_OP_AND_uxn_c_l250_c4_e018_return_output,
 BIN_OP_OR_uxn_c_l251_c4_c626_return_output,
 BIN_OP_EQ_uxn_c_l253_c12_2f40_return_output,
 tmp12_MUX_uxn_c_l253_c8_cbaf_return_output,
 color3_MUX_uxn_c_l253_c8_cbaf_return_output,
 color0_MUX_uxn_c_l253_c8_cbaf_return_output,
 color2_MUX_uxn_c_l253_c8_cbaf_return_output,
 color1_MUX_uxn_c_l253_c8_cbaf_return_output,
 CONST_SL_4_uxn_c_l255_c4_0ca5_return_output,
 BIN_OP_AND_uxn_c_l256_c4_e68a_return_output,
 BIN_OP_OR_uxn_c_l257_c4_9275_return_output,
 CONST_SL_4_uxn_c_l260_c4_83a4_return_output,
 BIN_OP_AND_uxn_c_l261_c4_7118_return_output,
 BIN_OP_OR_uxn_c_l262_c4_5852_return_output,
 BIN_OP_EQ_uxn_c_l264_c12_b1ad_return_output,
 tmp12_MUX_uxn_c_l264_c8_eaef_return_output,
 color3_MUX_uxn_c_l264_c8_eaef_return_output,
 color0_MUX_uxn_c_l264_c8_eaef_return_output,
 color2_MUX_uxn_c_l264_c8_eaef_return_output,
 color1_MUX_uxn_c_l264_c8_eaef_return_output,
 BIN_OP_AND_uxn_c_l266_c4_61ec_return_output,
 BIN_OP_OR_uxn_c_l267_c4_d494_return_output,
 BIN_OP_AND_uxn_c_l270_c4_8e31_return_output,
 BIN_OP_OR_uxn_c_l271_c4_05aa_return_output,
 BIN_OP_EQ_uxn_c_l273_c12_4b10_return_output,
 tmp12_MUX_uxn_c_l273_c8_9790_return_output,
 color3_MUX_uxn_c_l273_c8_9790_return_output,
 color2_MUX_uxn_c_l273_c8_9790_return_output,
 BIN_OP_AND_uxn_c_l275_c4_4712_return_output,
 BIN_OP_OR_uxn_c_l276_c4_2c8c_return_output,
 BIN_OP_AND_uxn_c_l279_c4_1915_return_output,
 BIN_OP_OR_uxn_c_l280_c4_6d66_return_output,
 BIN_OP_EQ_uxn_c_l284_c6_75a7_return_output,
 result_MUX_uxn_c_l284_c2_b5d3_return_output,
 BIN_OP_EQ_uxn_c_l286_c13_70d8_return_output,
 result_MUX_uxn_c_l286_c9_cb5b_return_output,
 BIN_OP_EQ_uxn_c_l288_c13_28de_return_output,
 result_MUX_uxn_c_l288_c9_8501_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_device_ram_address : unsigned(7 downto 0);
 variable VAR_device_ram_value : unsigned(7 downto 0);
 variable VAR_is_device_ram_write : unsigned(0 downto 0);
 variable VAR_gpu_step_color : unsigned(1 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l217_c2_0fe0_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l220_c3_d10e_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l217_c2_0fe0_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l217_c2_0fe0_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l217_c2_0fe0_cond : unsigned(0 downto 0);
 variable VAR_color_cmp_1_MUX_uxn_c_l217_c2_0fe0_iftrue : unsigned(3 downto 0);
 variable VAR_color_cmp_1_uxn_c_l219_c3_6495 : unsigned(3 downto 0);
 variable VAR_color_cmp_1_MUX_uxn_c_l217_c2_0fe0_iffalse : unsigned(3 downto 0);
 variable VAR_color_cmp_1_MUX_uxn_c_l217_c2_0fe0_return_output : unsigned(3 downto 0);
 variable VAR_color_cmp_1_MUX_uxn_c_l217_c2_0fe0_cond : unsigned(0 downto 0);
 variable VAR_color3_MUX_uxn_c_l217_c2_0fe0_iftrue : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l220_c3_d10e_return_output : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l217_c2_0fe0_iffalse : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l217_c2_0fe0_return_output : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l217_c2_0fe0_cond : unsigned(0 downto 0);
 variable VAR_color0_MUX_uxn_c_l217_c2_0fe0_iftrue : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l220_c3_d10e_return_output : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l217_c2_0fe0_iffalse : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l217_c2_0fe0_return_output : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l217_c2_0fe0_cond : unsigned(0 downto 0);
 variable VAR_color_cmp_0_MUX_uxn_c_l217_c2_0fe0_iftrue : unsigned(3 downto 0);
 variable VAR_color_cmp_0_uxn_c_l218_c3_afe1 : unsigned(3 downto 0);
 variable VAR_color_cmp_0_MUX_uxn_c_l217_c2_0fe0_iffalse : unsigned(3 downto 0);
 variable VAR_color_cmp_0_MUX_uxn_c_l217_c2_0fe0_return_output : unsigned(3 downto 0);
 variable VAR_color_cmp_0_MUX_uxn_c_l217_c2_0fe0_cond : unsigned(0 downto 0);
 variable VAR_color2_MUX_uxn_c_l217_c2_0fe0_iftrue : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l220_c3_d10e_return_output : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l217_c2_0fe0_iffalse : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l217_c2_0fe0_return_output : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l217_c2_0fe0_cond : unsigned(0 downto 0);
 variable VAR_color1_MUX_uxn_c_l217_c2_0fe0_iftrue : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l220_c3_d10e_return_output : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l217_c2_0fe0_iffalse : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l217_c2_0fe0_return_output : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l217_c2_0fe0_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_4_uxn_c_l218_c27_5436_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_c_l218_c27_5436_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_c_l218_c17_f25a_return_output : unsigned(3 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_c_l219_c17_c734_return_output : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l220_c7_27fa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l220_c7_27fa_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l220_c7_27fa_return_output : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l220_c3_d10e_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l220_c3_d10e_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l231_c8_e89c_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l220_c3_d10e_cond : unsigned(0 downto 0);
 variable VAR_color3_MUX_uxn_c_l220_c3_d10e_iftrue : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l220_c3_d10e_iffalse : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l231_c8_e89c_return_output : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l220_c3_d10e_cond : unsigned(0 downto 0);
 variable VAR_color0_MUX_uxn_c_l220_c3_d10e_iftrue : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l220_c3_d10e_iffalse : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l231_c8_e89c_return_output : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l220_c3_d10e_cond : unsigned(0 downto 0);
 variable VAR_color2_MUX_uxn_c_l220_c3_d10e_iftrue : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l220_c3_d10e_iffalse : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l231_c8_e89c_return_output : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l220_c3_d10e_cond : unsigned(0 downto 0);
 variable VAR_color1_MUX_uxn_c_l220_c3_d10e_iftrue : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l220_c3_d10e_iffalse : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l231_c8_e89c_return_output : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l220_c3_d10e_cond : unsigned(0 downto 0);
 variable VAR_tmp12_uxn_c_l221_c4_3d62 : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l222_c4_b1ef_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l222_c4_b1ef_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l223_c4_df67_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l223_c4_df67_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l223_c4_df67_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l224_c4_84c5_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l224_c4_84c5_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l224_c4_84c5_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_uxn_c_l226_c4_95fa : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l227_c4_7e77_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l227_c4_7e77_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l228_c4_5117_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l228_c4_5117_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l228_c4_5117_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l229_c4_25f5_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l229_c4_25f5_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l229_c4_25f5_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l231_c12_5585_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l231_c12_5585_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l231_c12_5585_return_output : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l231_c8_e89c_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l231_c8_e89c_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l242_c8_4769_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l231_c8_e89c_cond : unsigned(0 downto 0);
 variable VAR_color3_MUX_uxn_c_l231_c8_e89c_iftrue : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l231_c8_e89c_iffalse : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l242_c8_4769_return_output : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l231_c8_e89c_cond : unsigned(0 downto 0);
 variable VAR_color0_MUX_uxn_c_l231_c8_e89c_iftrue : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l231_c8_e89c_iffalse : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l242_c8_4769_return_output : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l231_c8_e89c_cond : unsigned(0 downto 0);
 variable VAR_color2_MUX_uxn_c_l231_c8_e89c_iftrue : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l231_c8_e89c_iffalse : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l242_c8_4769_return_output : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l231_c8_e89c_cond : unsigned(0 downto 0);
 variable VAR_color1_MUX_uxn_c_l231_c8_e89c_iftrue : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l231_c8_e89c_iffalse : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l242_c8_4769_return_output : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l231_c8_e89c_cond : unsigned(0 downto 0);
 variable VAR_tmp12_uxn_c_l232_c4_9640 : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l233_c4_b910_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l233_c4_b910_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l234_c4_f141_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l234_c4_f141_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l234_c4_f141_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l235_c4_fbe8_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l235_c4_fbe8_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l235_c4_fbe8_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_uxn_c_l237_c4_5681 : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l238_c4_8a63_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l238_c4_8a63_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l239_c4_2149_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l239_c4_2149_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l239_c4_2149_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l240_c4_b839_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l240_c4_b839_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l240_c4_b839_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l242_c12_3991_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l242_c12_3991_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l242_c12_3991_return_output : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l242_c8_4769_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l242_c8_4769_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l253_c8_cbaf_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l242_c8_4769_cond : unsigned(0 downto 0);
 variable VAR_color3_MUX_uxn_c_l242_c8_4769_iftrue : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l242_c8_4769_iffalse : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l253_c8_cbaf_return_output : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l242_c8_4769_cond : unsigned(0 downto 0);
 variable VAR_color0_MUX_uxn_c_l242_c8_4769_iftrue : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l242_c8_4769_iffalse : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l253_c8_cbaf_return_output : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l242_c8_4769_cond : unsigned(0 downto 0);
 variable VAR_color2_MUX_uxn_c_l242_c8_4769_iftrue : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l242_c8_4769_iffalse : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l253_c8_cbaf_return_output : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l242_c8_4769_cond : unsigned(0 downto 0);
 variable VAR_color1_MUX_uxn_c_l242_c8_4769_iftrue : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l242_c8_4769_iffalse : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l253_c8_cbaf_return_output : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l242_c8_4769_cond : unsigned(0 downto 0);
 variable VAR_tmp12_uxn_c_l243_c4_bda9 : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l244_c4_0aa9_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l244_c4_0aa9_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l245_c4_2b2a_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l245_c4_2b2a_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l245_c4_2b2a_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l246_c4_7159_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l246_c4_7159_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l246_c4_7159_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_uxn_c_l248_c4_78f7 : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l249_c4_8100_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l249_c4_8100_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l250_c4_e018_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l250_c4_e018_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l250_c4_e018_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l251_c4_c626_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l251_c4_c626_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l251_c4_c626_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l253_c12_2f40_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l253_c12_2f40_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l253_c12_2f40_return_output : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l253_c8_cbaf_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l253_c8_cbaf_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l264_c8_eaef_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l253_c8_cbaf_cond : unsigned(0 downto 0);
 variable VAR_color3_MUX_uxn_c_l253_c8_cbaf_iftrue : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l253_c8_cbaf_iffalse : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l264_c8_eaef_return_output : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l253_c8_cbaf_cond : unsigned(0 downto 0);
 variable VAR_color0_MUX_uxn_c_l253_c8_cbaf_iftrue : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l253_c8_cbaf_iffalse : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l264_c8_eaef_return_output : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l253_c8_cbaf_cond : unsigned(0 downto 0);
 variable VAR_color2_MUX_uxn_c_l253_c8_cbaf_iftrue : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l253_c8_cbaf_iffalse : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l264_c8_eaef_return_output : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l253_c8_cbaf_cond : unsigned(0 downto 0);
 variable VAR_color1_MUX_uxn_c_l253_c8_cbaf_iftrue : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l253_c8_cbaf_iffalse : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l264_c8_eaef_return_output : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l253_c8_cbaf_cond : unsigned(0 downto 0);
 variable VAR_tmp12_uxn_c_l254_c4_bbd0 : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l255_c4_0ca5_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l255_c4_0ca5_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l256_c4_e68a_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l256_c4_e68a_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l256_c4_e68a_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l257_c4_9275_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l257_c4_9275_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l257_c4_9275_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_uxn_c_l259_c4_a5f4 : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l260_c4_83a4_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l260_c4_83a4_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l261_c4_7118_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l261_c4_7118_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l261_c4_7118_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l262_c4_5852_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l262_c4_5852_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l262_c4_5852_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l264_c12_b1ad_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l264_c12_b1ad_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l264_c12_b1ad_return_output : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l264_c8_eaef_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l264_c8_eaef_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l273_c8_9790_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l264_c8_eaef_cond : unsigned(0 downto 0);
 variable VAR_color3_MUX_uxn_c_l264_c8_eaef_iftrue : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l264_c8_eaef_iffalse : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l273_c8_9790_return_output : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l264_c8_eaef_cond : unsigned(0 downto 0);
 variable VAR_color0_MUX_uxn_c_l264_c8_eaef_iftrue : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l264_c8_eaef_iffalse : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l264_c8_eaef_cond : unsigned(0 downto 0);
 variable VAR_color2_MUX_uxn_c_l264_c8_eaef_iftrue : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l264_c8_eaef_iffalse : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l273_c8_9790_return_output : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l264_c8_eaef_cond : unsigned(0 downto 0);
 variable VAR_color1_MUX_uxn_c_l264_c8_eaef_iftrue : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l264_c8_eaef_iffalse : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l264_c8_eaef_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l266_c4_61ec_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l266_c4_61ec_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l266_c4_61ec_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l267_c4_d494_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l267_c4_d494_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l267_c4_d494_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l270_c4_8e31_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l270_c4_8e31_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l270_c4_8e31_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l271_c4_05aa_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l271_c4_05aa_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l271_c4_05aa_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l273_c12_4b10_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l273_c12_4b10_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l273_c12_4b10_return_output : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l273_c8_9790_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l273_c8_9790_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l273_c8_9790_cond : unsigned(0 downto 0);
 variable VAR_color3_MUX_uxn_c_l273_c8_9790_iftrue : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l273_c8_9790_iffalse : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l273_c8_9790_cond : unsigned(0 downto 0);
 variable VAR_color2_MUX_uxn_c_l273_c8_9790_iftrue : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l273_c8_9790_iffalse : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l273_c8_9790_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l275_c4_4712_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l275_c4_4712_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l275_c4_4712_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l276_c4_2c8c_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l276_c4_2c8c_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l276_c4_2c8c_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l279_c4_1915_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l279_c4_1915_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l279_c4_1915_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l280_c4_6d66_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l280_c4_6d66_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l280_c4_6d66_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l284_c6_75a7_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l284_c6_75a7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l284_c6_75a7_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_c_l284_c2_b5d3_iftrue : unsigned(15 downto 0);
 variable VAR_result_uxn_c_l285_c3_9bcd : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l284_c2_b5d3_iffalse : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l286_c9_cb5b_return_output : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l284_c2_b5d3_return_output : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l284_c2_b5d3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l286_c13_70d8_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l286_c13_70d8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l286_c13_70d8_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_c_l286_c9_cb5b_iftrue : unsigned(15 downto 0);
 variable VAR_result_uxn_c_l287_c3_cda9 : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l286_c9_cb5b_iffalse : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l288_c9_8501_return_output : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l286_c9_cb5b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l288_c13_28de_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l288_c13_28de_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l288_c13_28de_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_c_l288_c9_8501_iftrue : unsigned(15 downto 0);
 variable VAR_result_uxn_c_l289_c3_f139 : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l288_c9_8501_iffalse : unsigned(15 downto 0);
 variable VAR_result_uxn_c_l291_c3_d226 : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l288_c9_8501_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l274_l265_DUPLICATE_d0c5_return_output : unsigned(11 downto 0);
 variable VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l269_l278_DUPLICATE_3b8b_return_output : unsigned(11 downto 0);
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
     VAR_BIN_OP_AND_uxn_c_l239_c4_2149_right := to_unsigned(255, 12);
     VAR_BIN_OP_AND_uxn_c_l261_c4_7118_right := to_unsigned(3855, 12);
     VAR_BIN_OP_AND_uxn_c_l275_c4_4712_right := to_unsigned(4080, 12);
     VAR_BIN_OP_EQ_uxn_c_l273_c12_4b10_right := to_unsigned(13, 8);
     VAR_BIN_OP_AND_uxn_c_l270_c4_8e31_right := to_unsigned(4080, 12);
     VAR_BIN_OP_EQ_uxn_c_l284_c6_75a7_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l242_c12_3991_right := to_unsigned(10, 8);
     VAR_BIN_OP_EQ_uxn_c_l253_c12_2f40_right := to_unsigned(11, 8);
     VAR_BIN_OP_EQ_uxn_c_l288_c13_28de_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_c_l286_c13_70d8_right := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_c_l250_c4_e018_right := to_unsigned(3855, 12);
     VAR_BIN_OP_AND_uxn_c_l245_c4_2b2a_right := to_unsigned(3855, 12);
     VAR_BIN_OP_AND_uxn_c_l223_c4_df67_right := to_unsigned(255, 12);
     VAR_BIN_OP_AND_uxn_c_l279_c4_1915_right := to_unsigned(4080, 12);
     VAR_BIN_OP_EQ_uxn_c_l264_c12_b1ad_right := to_unsigned(12, 8);
     VAR_BIN_OP_AND_uxn_c_l228_c4_5117_right := to_unsigned(255, 12);
     VAR_BIN_OP_AND_uxn_c_l256_c4_e68a_right := to_unsigned(3855, 12);
     VAR_BIN_OP_EQ_uxn_c_l231_c12_5585_right := to_unsigned(9, 8);
     VAR_BIN_OP_AND_uxn_c_l266_c4_61ec_right := to_unsigned(4080, 12);
     VAR_BIN_OP_AND_uxn_c_l234_c4_f141_right := to_unsigned(255, 12);
     VAR_BIN_OP_EQ_uxn_c_l220_c7_27fa_right := to_unsigned(8, 8);

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
     VAR_BIN_OP_AND_uxn_c_l223_c4_df67_left := color0;
     VAR_BIN_OP_AND_uxn_c_l245_c4_2b2a_left := color0;
     VAR_BIN_OP_AND_uxn_c_l266_c4_61ec_left := color0;
     VAR_color0_MUX_uxn_c_l217_c2_0fe0_iffalse := color0;
     VAR_color0_MUX_uxn_c_l231_c8_e89c_iftrue := color0;
     VAR_color0_MUX_uxn_c_l253_c8_cbaf_iftrue := color0;
     VAR_color0_MUX_uxn_c_l264_c8_eaef_iffalse := color0;
     VAR_BIN_OP_AND_uxn_c_l228_c4_5117_left := color1;
     VAR_BIN_OP_AND_uxn_c_l250_c4_e018_left := color1;
     VAR_BIN_OP_AND_uxn_c_l270_c4_8e31_left := color1;
     VAR_color1_MUX_uxn_c_l217_c2_0fe0_iffalse := color1;
     VAR_color1_MUX_uxn_c_l231_c8_e89c_iftrue := color1;
     VAR_color1_MUX_uxn_c_l253_c8_cbaf_iftrue := color1;
     VAR_color1_MUX_uxn_c_l264_c8_eaef_iffalse := color1;
     VAR_BIN_OP_AND_uxn_c_l234_c4_f141_left := color2;
     VAR_BIN_OP_AND_uxn_c_l256_c4_e68a_left := color2;
     VAR_BIN_OP_AND_uxn_c_l275_c4_4712_left := color2;
     VAR_color2_MUX_uxn_c_l217_c2_0fe0_iffalse := color2;
     VAR_color2_MUX_uxn_c_l220_c3_d10e_iftrue := color2;
     VAR_color2_MUX_uxn_c_l242_c8_4769_iftrue := color2;
     VAR_color2_MUX_uxn_c_l264_c8_eaef_iftrue := color2;
     VAR_color2_MUX_uxn_c_l273_c8_9790_iffalse := color2;
     VAR_BIN_OP_AND_uxn_c_l239_c4_2149_left := color3;
     VAR_BIN_OP_AND_uxn_c_l261_c4_7118_left := color3;
     VAR_BIN_OP_AND_uxn_c_l279_c4_1915_left := color3;
     VAR_color3_MUX_uxn_c_l217_c2_0fe0_iffalse := color3;
     VAR_color3_MUX_uxn_c_l220_c3_d10e_iftrue := color3;
     VAR_color3_MUX_uxn_c_l242_c8_4769_iftrue := color3;
     VAR_color3_MUX_uxn_c_l264_c8_eaef_iftrue := color3;
     VAR_color3_MUX_uxn_c_l273_c8_9790_iffalse := color3;
     VAR_color_cmp_0_MUX_uxn_c_l217_c2_0fe0_iffalse := color_cmp_0;
     VAR_color_cmp_1_MUX_uxn_c_l217_c2_0fe0_iffalse := color_cmp_1;
     VAR_BIN_OP_EQ_uxn_c_l220_c7_27fa_left := VAR_device_ram_address;
     VAR_BIN_OP_EQ_uxn_c_l231_c12_5585_left := VAR_device_ram_address;
     VAR_BIN_OP_EQ_uxn_c_l242_c12_3991_left := VAR_device_ram_address;
     VAR_BIN_OP_EQ_uxn_c_l253_c12_2f40_left := VAR_device_ram_address;
     VAR_BIN_OP_EQ_uxn_c_l264_c12_b1ad_left := VAR_device_ram_address;
     VAR_BIN_OP_EQ_uxn_c_l273_c12_4b10_left := VAR_device_ram_address;
     VAR_CONST_SR_4_uxn_c_l218_c27_5436_x := VAR_device_ram_value;
     VAR_BIN_OP_EQ_uxn_c_l284_c6_75a7_left := VAR_gpu_step_color;
     VAR_BIN_OP_EQ_uxn_c_l286_c13_70d8_left := VAR_gpu_step_color;
     VAR_BIN_OP_EQ_uxn_c_l288_c13_28de_left := VAR_gpu_step_color;
     VAR_color0_MUX_uxn_c_l217_c2_0fe0_cond := VAR_is_device_ram_write;
     VAR_color1_MUX_uxn_c_l217_c2_0fe0_cond := VAR_is_device_ram_write;
     VAR_color2_MUX_uxn_c_l217_c2_0fe0_cond := VAR_is_device_ram_write;
     VAR_color3_MUX_uxn_c_l217_c2_0fe0_cond := VAR_is_device_ram_write;
     VAR_color_cmp_0_MUX_uxn_c_l217_c2_0fe0_cond := VAR_is_device_ram_write;
     VAR_color_cmp_1_MUX_uxn_c_l217_c2_0fe0_cond := VAR_is_device_ram_write;
     VAR_tmp12_MUX_uxn_c_l217_c2_0fe0_cond := VAR_is_device_ram_write;
     VAR_tmp12_MUX_uxn_c_l217_c2_0fe0_iffalse := tmp12;
     VAR_tmp12_MUX_uxn_c_l273_c8_9790_iffalse := tmp12;
     -- BIN_OP_EQ[uxn_c_l220_c7_27fa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l220_c7_27fa_left <= VAR_BIN_OP_EQ_uxn_c_l220_c7_27fa_left;
     BIN_OP_EQ_uxn_c_l220_c7_27fa_right <= VAR_BIN_OP_EQ_uxn_c_l220_c7_27fa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l220_c7_27fa_return_output := BIN_OP_EQ_uxn_c_l220_c7_27fa_return_output;

     -- BIN_OP_EQ[uxn_c_l253_c12_2f40] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l253_c12_2f40_left <= VAR_BIN_OP_EQ_uxn_c_l253_c12_2f40_left;
     BIN_OP_EQ_uxn_c_l253_c12_2f40_right <= VAR_BIN_OP_EQ_uxn_c_l253_c12_2f40_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l253_c12_2f40_return_output := BIN_OP_EQ_uxn_c_l253_c12_2f40_return_output;

     -- BIN_OP_AND[uxn_c_l234_c4_f141] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l234_c4_f141_left <= VAR_BIN_OP_AND_uxn_c_l234_c4_f141_left;
     BIN_OP_AND_uxn_c_l234_c4_f141_right <= VAR_BIN_OP_AND_uxn_c_l234_c4_f141_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l234_c4_f141_return_output := BIN_OP_AND_uxn_c_l234_c4_f141_return_output;

     -- BIN_OP_AND[uxn_c_l275_c4_4712] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l275_c4_4712_left <= VAR_BIN_OP_AND_uxn_c_l275_c4_4712_left;
     BIN_OP_AND_uxn_c_l275_c4_4712_right <= VAR_BIN_OP_AND_uxn_c_l275_c4_4712_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l275_c4_4712_return_output := BIN_OP_AND_uxn_c_l275_c4_4712_return_output;

     -- BIN_OP_AND[uxn_c_l250_c4_e018] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l250_c4_e018_left <= VAR_BIN_OP_AND_uxn_c_l250_c4_e018_left;
     BIN_OP_AND_uxn_c_l250_c4_e018_right <= VAR_BIN_OP_AND_uxn_c_l250_c4_e018_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l250_c4_e018_return_output := BIN_OP_AND_uxn_c_l250_c4_e018_return_output;

     -- BIN_OP_AND[uxn_c_l239_c4_2149] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l239_c4_2149_left <= VAR_BIN_OP_AND_uxn_c_l239_c4_2149_left;
     BIN_OP_AND_uxn_c_l239_c4_2149_right <= VAR_BIN_OP_AND_uxn_c_l239_c4_2149_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l239_c4_2149_return_output := BIN_OP_AND_uxn_c_l239_c4_2149_return_output;

     -- BIN_OP_AND[uxn_c_l270_c4_8e31] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l270_c4_8e31_left <= VAR_BIN_OP_AND_uxn_c_l270_c4_8e31_left;
     BIN_OP_AND_uxn_c_l270_c4_8e31_right <= VAR_BIN_OP_AND_uxn_c_l270_c4_8e31_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l270_c4_8e31_return_output := BIN_OP_AND_uxn_c_l270_c4_8e31_return_output;

     -- BIN_OP_EQ[uxn_c_l242_c12_3991] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l242_c12_3991_left <= VAR_BIN_OP_EQ_uxn_c_l242_c12_3991_left;
     BIN_OP_EQ_uxn_c_l242_c12_3991_right <= VAR_BIN_OP_EQ_uxn_c_l242_c12_3991_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l242_c12_3991_return_output := BIN_OP_EQ_uxn_c_l242_c12_3991_return_output;

     -- BIN_OP_AND[uxn_c_l223_c4_df67] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l223_c4_df67_left <= VAR_BIN_OP_AND_uxn_c_l223_c4_df67_left;
     BIN_OP_AND_uxn_c_l223_c4_df67_right <= VAR_BIN_OP_AND_uxn_c_l223_c4_df67_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l223_c4_df67_return_output := BIN_OP_AND_uxn_c_l223_c4_df67_return_output;

     -- BIN_OP_EQ[uxn_c_l264_c12_b1ad] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l264_c12_b1ad_left <= VAR_BIN_OP_EQ_uxn_c_l264_c12_b1ad_left;
     BIN_OP_EQ_uxn_c_l264_c12_b1ad_right <= VAR_BIN_OP_EQ_uxn_c_l264_c12_b1ad_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l264_c12_b1ad_return_output := BIN_OP_EQ_uxn_c_l264_c12_b1ad_return_output;

     -- BIN_OP_AND[uxn_c_l279_c4_1915] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l279_c4_1915_left <= VAR_BIN_OP_AND_uxn_c_l279_c4_1915_left;
     BIN_OP_AND_uxn_c_l279_c4_1915_right <= VAR_BIN_OP_AND_uxn_c_l279_c4_1915_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l279_c4_1915_return_output := BIN_OP_AND_uxn_c_l279_c4_1915_return_output;

     -- BIN_OP_EQ[uxn_c_l273_c12_4b10] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l273_c12_4b10_left <= VAR_BIN_OP_EQ_uxn_c_l273_c12_4b10_left;
     BIN_OP_EQ_uxn_c_l273_c12_4b10_right <= VAR_BIN_OP_EQ_uxn_c_l273_c12_4b10_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l273_c12_4b10_return_output := BIN_OP_EQ_uxn_c_l273_c12_4b10_return_output;

     -- BIN_OP_EQ[uxn_c_l286_c13_70d8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l286_c13_70d8_left <= VAR_BIN_OP_EQ_uxn_c_l286_c13_70d8_left;
     BIN_OP_EQ_uxn_c_l286_c13_70d8_right <= VAR_BIN_OP_EQ_uxn_c_l286_c13_70d8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l286_c13_70d8_return_output := BIN_OP_EQ_uxn_c_l286_c13_70d8_return_output;

     -- CAST_TO_uint4_t[uxn_c_l219_c17_c734] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_c_l219_c17_c734_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_device_ram_value);

     -- BIN_OP_AND[uxn_c_l261_c4_7118] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l261_c4_7118_left <= VAR_BIN_OP_AND_uxn_c_l261_c4_7118_left;
     BIN_OP_AND_uxn_c_l261_c4_7118_right <= VAR_BIN_OP_AND_uxn_c_l261_c4_7118_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l261_c4_7118_return_output := BIN_OP_AND_uxn_c_l261_c4_7118_return_output;

     -- BIN_OP_AND[uxn_c_l266_c4_61ec] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l266_c4_61ec_left <= VAR_BIN_OP_AND_uxn_c_l266_c4_61ec_left;
     BIN_OP_AND_uxn_c_l266_c4_61ec_right <= VAR_BIN_OP_AND_uxn_c_l266_c4_61ec_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l266_c4_61ec_return_output := BIN_OP_AND_uxn_c_l266_c4_61ec_return_output;

     -- BIN_OP_AND[uxn_c_l245_c4_2b2a] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l245_c4_2b2a_left <= VAR_BIN_OP_AND_uxn_c_l245_c4_2b2a_left;
     BIN_OP_AND_uxn_c_l245_c4_2b2a_right <= VAR_BIN_OP_AND_uxn_c_l245_c4_2b2a_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l245_c4_2b2a_return_output := BIN_OP_AND_uxn_c_l245_c4_2b2a_return_output;

     -- BIN_OP_EQ[uxn_c_l288_c13_28de] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l288_c13_28de_left <= VAR_BIN_OP_EQ_uxn_c_l288_c13_28de_left;
     BIN_OP_EQ_uxn_c_l288_c13_28de_right <= VAR_BIN_OP_EQ_uxn_c_l288_c13_28de_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l288_c13_28de_return_output := BIN_OP_EQ_uxn_c_l288_c13_28de_return_output;

     -- BIN_OP_EQ[uxn_c_l231_c12_5585] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l231_c12_5585_left <= VAR_BIN_OP_EQ_uxn_c_l231_c12_5585_left;
     BIN_OP_EQ_uxn_c_l231_c12_5585_right <= VAR_BIN_OP_EQ_uxn_c_l231_c12_5585_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l231_c12_5585_return_output := BIN_OP_EQ_uxn_c_l231_c12_5585_return_output;

     -- BIN_OP_AND[uxn_c_l256_c4_e68a] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l256_c4_e68a_left <= VAR_BIN_OP_AND_uxn_c_l256_c4_e68a_left;
     BIN_OP_AND_uxn_c_l256_c4_e68a_right <= VAR_BIN_OP_AND_uxn_c_l256_c4_e68a_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l256_c4_e68a_return_output := BIN_OP_AND_uxn_c_l256_c4_e68a_return_output;

     -- CONST_SR_4[uxn_c_l218_c27_5436] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_c_l218_c27_5436_x <= VAR_CONST_SR_4_uxn_c_l218_c27_5436_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_c_l218_c27_5436_return_output := CONST_SR_4_uxn_c_l218_c27_5436_return_output;

     -- BIN_OP_AND[uxn_c_l228_c4_5117] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l228_c4_5117_left <= VAR_BIN_OP_AND_uxn_c_l228_c4_5117_left;
     BIN_OP_AND_uxn_c_l228_c4_5117_right <= VAR_BIN_OP_AND_uxn_c_l228_c4_5117_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l228_c4_5117_return_output := BIN_OP_AND_uxn_c_l228_c4_5117_return_output;

     -- BIN_OP_EQ[uxn_c_l284_c6_75a7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l284_c6_75a7_left <= VAR_BIN_OP_EQ_uxn_c_l284_c6_75a7_left;
     BIN_OP_EQ_uxn_c_l284_c6_75a7_right <= VAR_BIN_OP_EQ_uxn_c_l284_c6_75a7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l284_c6_75a7_return_output := BIN_OP_EQ_uxn_c_l284_c6_75a7_return_output;

     -- Submodule level 1
     VAR_BIN_OP_OR_uxn_c_l224_c4_84c5_left := VAR_BIN_OP_AND_uxn_c_l223_c4_df67_return_output;
     VAR_BIN_OP_OR_uxn_c_l229_c4_25f5_left := VAR_BIN_OP_AND_uxn_c_l228_c4_5117_return_output;
     VAR_BIN_OP_OR_uxn_c_l235_c4_fbe8_left := VAR_BIN_OP_AND_uxn_c_l234_c4_f141_return_output;
     VAR_BIN_OP_OR_uxn_c_l240_c4_b839_left := VAR_BIN_OP_AND_uxn_c_l239_c4_2149_return_output;
     VAR_BIN_OP_OR_uxn_c_l246_c4_7159_left := VAR_BIN_OP_AND_uxn_c_l245_c4_2b2a_return_output;
     VAR_BIN_OP_OR_uxn_c_l251_c4_c626_left := VAR_BIN_OP_AND_uxn_c_l250_c4_e018_return_output;
     VAR_BIN_OP_OR_uxn_c_l257_c4_9275_left := VAR_BIN_OP_AND_uxn_c_l256_c4_e68a_return_output;
     VAR_BIN_OP_OR_uxn_c_l262_c4_5852_left := VAR_BIN_OP_AND_uxn_c_l261_c4_7118_return_output;
     VAR_BIN_OP_OR_uxn_c_l267_c4_d494_left := VAR_BIN_OP_AND_uxn_c_l266_c4_61ec_return_output;
     VAR_BIN_OP_OR_uxn_c_l271_c4_05aa_left := VAR_BIN_OP_AND_uxn_c_l270_c4_8e31_return_output;
     VAR_BIN_OP_OR_uxn_c_l276_c4_2c8c_left := VAR_BIN_OP_AND_uxn_c_l275_c4_4712_return_output;
     VAR_BIN_OP_OR_uxn_c_l280_c4_6d66_left := VAR_BIN_OP_AND_uxn_c_l279_c4_1915_return_output;
     VAR_color0_MUX_uxn_c_l220_c3_d10e_cond := VAR_BIN_OP_EQ_uxn_c_l220_c7_27fa_return_output;
     VAR_color1_MUX_uxn_c_l220_c3_d10e_cond := VAR_BIN_OP_EQ_uxn_c_l220_c7_27fa_return_output;
     VAR_color2_MUX_uxn_c_l220_c3_d10e_cond := VAR_BIN_OP_EQ_uxn_c_l220_c7_27fa_return_output;
     VAR_color3_MUX_uxn_c_l220_c3_d10e_cond := VAR_BIN_OP_EQ_uxn_c_l220_c7_27fa_return_output;
     VAR_tmp12_MUX_uxn_c_l220_c3_d10e_cond := VAR_BIN_OP_EQ_uxn_c_l220_c7_27fa_return_output;
     VAR_color0_MUX_uxn_c_l231_c8_e89c_cond := VAR_BIN_OP_EQ_uxn_c_l231_c12_5585_return_output;
     VAR_color1_MUX_uxn_c_l231_c8_e89c_cond := VAR_BIN_OP_EQ_uxn_c_l231_c12_5585_return_output;
     VAR_color2_MUX_uxn_c_l231_c8_e89c_cond := VAR_BIN_OP_EQ_uxn_c_l231_c12_5585_return_output;
     VAR_color3_MUX_uxn_c_l231_c8_e89c_cond := VAR_BIN_OP_EQ_uxn_c_l231_c12_5585_return_output;
     VAR_tmp12_MUX_uxn_c_l231_c8_e89c_cond := VAR_BIN_OP_EQ_uxn_c_l231_c12_5585_return_output;
     VAR_color0_MUX_uxn_c_l242_c8_4769_cond := VAR_BIN_OP_EQ_uxn_c_l242_c12_3991_return_output;
     VAR_color1_MUX_uxn_c_l242_c8_4769_cond := VAR_BIN_OP_EQ_uxn_c_l242_c12_3991_return_output;
     VAR_color2_MUX_uxn_c_l242_c8_4769_cond := VAR_BIN_OP_EQ_uxn_c_l242_c12_3991_return_output;
     VAR_color3_MUX_uxn_c_l242_c8_4769_cond := VAR_BIN_OP_EQ_uxn_c_l242_c12_3991_return_output;
     VAR_tmp12_MUX_uxn_c_l242_c8_4769_cond := VAR_BIN_OP_EQ_uxn_c_l242_c12_3991_return_output;
     VAR_color0_MUX_uxn_c_l253_c8_cbaf_cond := VAR_BIN_OP_EQ_uxn_c_l253_c12_2f40_return_output;
     VAR_color1_MUX_uxn_c_l253_c8_cbaf_cond := VAR_BIN_OP_EQ_uxn_c_l253_c12_2f40_return_output;
     VAR_color2_MUX_uxn_c_l253_c8_cbaf_cond := VAR_BIN_OP_EQ_uxn_c_l253_c12_2f40_return_output;
     VAR_color3_MUX_uxn_c_l253_c8_cbaf_cond := VAR_BIN_OP_EQ_uxn_c_l253_c12_2f40_return_output;
     VAR_tmp12_MUX_uxn_c_l253_c8_cbaf_cond := VAR_BIN_OP_EQ_uxn_c_l253_c12_2f40_return_output;
     VAR_color0_MUX_uxn_c_l264_c8_eaef_cond := VAR_BIN_OP_EQ_uxn_c_l264_c12_b1ad_return_output;
     VAR_color1_MUX_uxn_c_l264_c8_eaef_cond := VAR_BIN_OP_EQ_uxn_c_l264_c12_b1ad_return_output;
     VAR_color2_MUX_uxn_c_l264_c8_eaef_cond := VAR_BIN_OP_EQ_uxn_c_l264_c12_b1ad_return_output;
     VAR_color3_MUX_uxn_c_l264_c8_eaef_cond := VAR_BIN_OP_EQ_uxn_c_l264_c12_b1ad_return_output;
     VAR_tmp12_MUX_uxn_c_l264_c8_eaef_cond := VAR_BIN_OP_EQ_uxn_c_l264_c12_b1ad_return_output;
     VAR_color2_MUX_uxn_c_l273_c8_9790_cond := VAR_BIN_OP_EQ_uxn_c_l273_c12_4b10_return_output;
     VAR_color3_MUX_uxn_c_l273_c8_9790_cond := VAR_BIN_OP_EQ_uxn_c_l273_c12_4b10_return_output;
     VAR_tmp12_MUX_uxn_c_l273_c8_9790_cond := VAR_BIN_OP_EQ_uxn_c_l273_c12_4b10_return_output;
     VAR_result_MUX_uxn_c_l284_c2_b5d3_cond := VAR_BIN_OP_EQ_uxn_c_l284_c6_75a7_return_output;
     VAR_result_MUX_uxn_c_l286_c9_cb5b_cond := VAR_BIN_OP_EQ_uxn_c_l286_c13_70d8_return_output;
     VAR_result_MUX_uxn_c_l288_c9_8501_cond := VAR_BIN_OP_EQ_uxn_c_l288_c13_28de_return_output;
     VAR_color_cmp_1_uxn_c_l219_c3_6495 := VAR_CAST_TO_uint4_t_uxn_c_l219_c17_c734_return_output;
     VAR_color_cmp_1_MUX_uxn_c_l217_c2_0fe0_iftrue := VAR_color_cmp_1_uxn_c_l219_c3_6495;
     VAR_tmp12_uxn_c_l226_c4_95fa := resize(VAR_color_cmp_1_uxn_c_l219_c3_6495, 12);
     VAR_tmp12_uxn_c_l237_c4_5681 := resize(VAR_color_cmp_1_uxn_c_l219_c3_6495, 12);
     VAR_tmp12_uxn_c_l248_c4_78f7 := resize(VAR_color_cmp_1_uxn_c_l219_c3_6495, 12);
     VAR_tmp12_uxn_c_l259_c4_a5f4 := resize(VAR_color_cmp_1_uxn_c_l219_c3_6495, 12);
     VAR_CONST_SL_8_uxn_c_l227_c4_7e77_x := VAR_tmp12_uxn_c_l226_c4_95fa;
     VAR_CONST_SL_8_uxn_c_l238_c4_8a63_x := VAR_tmp12_uxn_c_l237_c4_5681;
     VAR_CONST_SL_4_uxn_c_l249_c4_8100_x := VAR_tmp12_uxn_c_l248_c4_78f7;
     VAR_CONST_SL_4_uxn_c_l260_c4_83a4_x := VAR_tmp12_uxn_c_l259_c4_a5f4;
     -- CONST_SL_8[uxn_c_l227_c4_7e77] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l227_c4_7e77_x <= VAR_CONST_SL_8_uxn_c_l227_c4_7e77_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l227_c4_7e77_return_output := CONST_SL_8_uxn_c_l227_c4_7e77_return_output;

     -- CAST_TO_uint12_t_uint4_t_uxn_c_l269_l278_DUPLICATE_3b8b LATENCY=0
     VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l269_l278_DUPLICATE_3b8b_return_output := CAST_TO_uint12_t_uint4_t(
     VAR_color_cmp_1_uxn_c_l219_c3_6495);

     -- CONST_SL_4[uxn_c_l260_c4_83a4] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_c_l260_c4_83a4_x <= VAR_CONST_SL_4_uxn_c_l260_c4_83a4_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_c_l260_c4_83a4_return_output := CONST_SL_4_uxn_c_l260_c4_83a4_return_output;

     -- CONST_SL_4[uxn_c_l249_c4_8100] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_c_l249_c4_8100_x <= VAR_CONST_SL_4_uxn_c_l249_c4_8100_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_c_l249_c4_8100_return_output := CONST_SL_4_uxn_c_l249_c4_8100_return_output;

     -- CAST_TO_uint4_t[uxn_c_l218_c17_f25a] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_c_l218_c17_f25a_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_CONST_SR_4_uxn_c_l218_c27_5436_return_output);

     -- CONST_SL_8[uxn_c_l238_c4_8a63] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l238_c4_8a63_x <= VAR_CONST_SL_8_uxn_c_l238_c4_8a63_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l238_c4_8a63_return_output := CONST_SL_8_uxn_c_l238_c4_8a63_return_output;

     -- color_cmp_1_MUX[uxn_c_l217_c2_0fe0] LATENCY=0
     -- Inputs
     color_cmp_1_MUX_uxn_c_l217_c2_0fe0_cond <= VAR_color_cmp_1_MUX_uxn_c_l217_c2_0fe0_cond;
     color_cmp_1_MUX_uxn_c_l217_c2_0fe0_iftrue <= VAR_color_cmp_1_MUX_uxn_c_l217_c2_0fe0_iftrue;
     color_cmp_1_MUX_uxn_c_l217_c2_0fe0_iffalse <= VAR_color_cmp_1_MUX_uxn_c_l217_c2_0fe0_iffalse;
     -- Outputs
     VAR_color_cmp_1_MUX_uxn_c_l217_c2_0fe0_return_output := color_cmp_1_MUX_uxn_c_l217_c2_0fe0_return_output;

     -- Submodule level 2
     VAR_BIN_OP_OR_uxn_c_l271_c4_05aa_right := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l269_l278_DUPLICATE_3b8b_return_output;
     VAR_BIN_OP_OR_uxn_c_l280_c4_6d66_right := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l269_l278_DUPLICATE_3b8b_return_output;
     VAR_tmp12_MUX_uxn_c_l264_c8_eaef_iftrue := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l269_l278_DUPLICATE_3b8b_return_output;
     VAR_tmp12_MUX_uxn_c_l273_c8_9790_iftrue := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l269_l278_DUPLICATE_3b8b_return_output;
     VAR_color_cmp_0_uxn_c_l218_c3_afe1 := VAR_CAST_TO_uint4_t_uxn_c_l218_c17_f25a_return_output;
     VAR_BIN_OP_OR_uxn_c_l251_c4_c626_right := VAR_CONST_SL_4_uxn_c_l249_c4_8100_return_output;
     VAR_tmp12_MUX_uxn_c_l242_c8_4769_iftrue := VAR_CONST_SL_4_uxn_c_l249_c4_8100_return_output;
     VAR_BIN_OP_OR_uxn_c_l262_c4_5852_right := VAR_CONST_SL_4_uxn_c_l260_c4_83a4_return_output;
     VAR_tmp12_MUX_uxn_c_l253_c8_cbaf_iftrue := VAR_CONST_SL_4_uxn_c_l260_c4_83a4_return_output;
     VAR_BIN_OP_OR_uxn_c_l229_c4_25f5_right := VAR_CONST_SL_8_uxn_c_l227_c4_7e77_return_output;
     VAR_tmp12_MUX_uxn_c_l220_c3_d10e_iftrue := VAR_CONST_SL_8_uxn_c_l227_c4_7e77_return_output;
     VAR_BIN_OP_OR_uxn_c_l240_c4_b839_right := VAR_CONST_SL_8_uxn_c_l238_c4_8a63_return_output;
     VAR_tmp12_MUX_uxn_c_l231_c8_e89c_iftrue := VAR_CONST_SL_8_uxn_c_l238_c4_8a63_return_output;
     REG_VAR_color_cmp_1 := VAR_color_cmp_1_MUX_uxn_c_l217_c2_0fe0_return_output;
     VAR_color_cmp_0_MUX_uxn_c_l217_c2_0fe0_iftrue := VAR_color_cmp_0_uxn_c_l218_c3_afe1;
     VAR_tmp12_uxn_c_l221_c4_3d62 := resize(VAR_color_cmp_0_uxn_c_l218_c3_afe1, 12);
     VAR_tmp12_uxn_c_l232_c4_9640 := resize(VAR_color_cmp_0_uxn_c_l218_c3_afe1, 12);
     VAR_tmp12_uxn_c_l243_c4_bda9 := resize(VAR_color_cmp_0_uxn_c_l218_c3_afe1, 12);
     VAR_tmp12_uxn_c_l254_c4_bbd0 := resize(VAR_color_cmp_0_uxn_c_l218_c3_afe1, 12);
     VAR_CONST_SL_8_uxn_c_l222_c4_b1ef_x := VAR_tmp12_uxn_c_l221_c4_3d62;
     VAR_CONST_SL_8_uxn_c_l233_c4_b910_x := VAR_tmp12_uxn_c_l232_c4_9640;
     VAR_CONST_SL_4_uxn_c_l244_c4_0aa9_x := VAR_tmp12_uxn_c_l243_c4_bda9;
     VAR_CONST_SL_4_uxn_c_l255_c4_0ca5_x := VAR_tmp12_uxn_c_l254_c4_bbd0;
     -- tmp12_MUX[uxn_c_l273_c8_9790] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_c_l273_c8_9790_cond <= VAR_tmp12_MUX_uxn_c_l273_c8_9790_cond;
     tmp12_MUX_uxn_c_l273_c8_9790_iftrue <= VAR_tmp12_MUX_uxn_c_l273_c8_9790_iftrue;
     tmp12_MUX_uxn_c_l273_c8_9790_iffalse <= VAR_tmp12_MUX_uxn_c_l273_c8_9790_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_c_l273_c8_9790_return_output := tmp12_MUX_uxn_c_l273_c8_9790_return_output;

     -- BIN_OP_OR[uxn_c_l240_c4_b839] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l240_c4_b839_left <= VAR_BIN_OP_OR_uxn_c_l240_c4_b839_left;
     BIN_OP_OR_uxn_c_l240_c4_b839_right <= VAR_BIN_OP_OR_uxn_c_l240_c4_b839_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l240_c4_b839_return_output := BIN_OP_OR_uxn_c_l240_c4_b839_return_output;

     -- BIN_OP_OR[uxn_c_l262_c4_5852] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l262_c4_5852_left <= VAR_BIN_OP_OR_uxn_c_l262_c4_5852_left;
     BIN_OP_OR_uxn_c_l262_c4_5852_right <= VAR_BIN_OP_OR_uxn_c_l262_c4_5852_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l262_c4_5852_return_output := BIN_OP_OR_uxn_c_l262_c4_5852_return_output;

     -- BIN_OP_OR[uxn_c_l280_c4_6d66] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l280_c4_6d66_left <= VAR_BIN_OP_OR_uxn_c_l280_c4_6d66_left;
     BIN_OP_OR_uxn_c_l280_c4_6d66_right <= VAR_BIN_OP_OR_uxn_c_l280_c4_6d66_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l280_c4_6d66_return_output := BIN_OP_OR_uxn_c_l280_c4_6d66_return_output;

     -- CONST_SL_8[uxn_c_l222_c4_b1ef] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l222_c4_b1ef_x <= VAR_CONST_SL_8_uxn_c_l222_c4_b1ef_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l222_c4_b1ef_return_output := CONST_SL_8_uxn_c_l222_c4_b1ef_return_output;

     -- BIN_OP_OR[uxn_c_l271_c4_05aa] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l271_c4_05aa_left <= VAR_BIN_OP_OR_uxn_c_l271_c4_05aa_left;
     BIN_OP_OR_uxn_c_l271_c4_05aa_right <= VAR_BIN_OP_OR_uxn_c_l271_c4_05aa_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l271_c4_05aa_return_output := BIN_OP_OR_uxn_c_l271_c4_05aa_return_output;

     -- BIN_OP_OR[uxn_c_l251_c4_c626] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l251_c4_c626_left <= VAR_BIN_OP_OR_uxn_c_l251_c4_c626_left;
     BIN_OP_OR_uxn_c_l251_c4_c626_right <= VAR_BIN_OP_OR_uxn_c_l251_c4_c626_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l251_c4_c626_return_output := BIN_OP_OR_uxn_c_l251_c4_c626_return_output;

     -- BIN_OP_OR[uxn_c_l229_c4_25f5] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l229_c4_25f5_left <= VAR_BIN_OP_OR_uxn_c_l229_c4_25f5_left;
     BIN_OP_OR_uxn_c_l229_c4_25f5_right <= VAR_BIN_OP_OR_uxn_c_l229_c4_25f5_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l229_c4_25f5_return_output := BIN_OP_OR_uxn_c_l229_c4_25f5_return_output;

     -- CONST_SL_8[uxn_c_l233_c4_b910] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l233_c4_b910_x <= VAR_CONST_SL_8_uxn_c_l233_c4_b910_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l233_c4_b910_return_output := CONST_SL_8_uxn_c_l233_c4_b910_return_output;

     -- CONST_SL_4[uxn_c_l255_c4_0ca5] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_c_l255_c4_0ca5_x <= VAR_CONST_SL_4_uxn_c_l255_c4_0ca5_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_c_l255_c4_0ca5_return_output := CONST_SL_4_uxn_c_l255_c4_0ca5_return_output;

     -- CONST_SL_4[uxn_c_l244_c4_0aa9] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_c_l244_c4_0aa9_x <= VAR_CONST_SL_4_uxn_c_l244_c4_0aa9_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_c_l244_c4_0aa9_return_output := CONST_SL_4_uxn_c_l244_c4_0aa9_return_output;

     -- CAST_TO_uint12_t_uint4_t_uxn_c_l274_l265_DUPLICATE_d0c5 LATENCY=0
     VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l274_l265_DUPLICATE_d0c5_return_output := CAST_TO_uint12_t_uint4_t(
     VAR_color_cmp_0_uxn_c_l218_c3_afe1);

     -- color_cmp_0_MUX[uxn_c_l217_c2_0fe0] LATENCY=0
     -- Inputs
     color_cmp_0_MUX_uxn_c_l217_c2_0fe0_cond <= VAR_color_cmp_0_MUX_uxn_c_l217_c2_0fe0_cond;
     color_cmp_0_MUX_uxn_c_l217_c2_0fe0_iftrue <= VAR_color_cmp_0_MUX_uxn_c_l217_c2_0fe0_iftrue;
     color_cmp_0_MUX_uxn_c_l217_c2_0fe0_iffalse <= VAR_color_cmp_0_MUX_uxn_c_l217_c2_0fe0_iffalse;
     -- Outputs
     VAR_color_cmp_0_MUX_uxn_c_l217_c2_0fe0_return_output := color_cmp_0_MUX_uxn_c_l217_c2_0fe0_return_output;

     -- Submodule level 3
     VAR_color1_MUX_uxn_c_l220_c3_d10e_iftrue := VAR_BIN_OP_OR_uxn_c_l229_c4_25f5_return_output;
     VAR_color3_MUX_uxn_c_l231_c8_e89c_iftrue := VAR_BIN_OP_OR_uxn_c_l240_c4_b839_return_output;
     VAR_color1_MUX_uxn_c_l242_c8_4769_iftrue := VAR_BIN_OP_OR_uxn_c_l251_c4_c626_return_output;
     VAR_color3_MUX_uxn_c_l253_c8_cbaf_iftrue := VAR_BIN_OP_OR_uxn_c_l262_c4_5852_return_output;
     VAR_color1_MUX_uxn_c_l264_c8_eaef_iftrue := VAR_BIN_OP_OR_uxn_c_l271_c4_05aa_return_output;
     VAR_color3_MUX_uxn_c_l273_c8_9790_iftrue := VAR_BIN_OP_OR_uxn_c_l280_c4_6d66_return_output;
     VAR_BIN_OP_OR_uxn_c_l267_c4_d494_right := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l274_l265_DUPLICATE_d0c5_return_output;
     VAR_BIN_OP_OR_uxn_c_l276_c4_2c8c_right := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l274_l265_DUPLICATE_d0c5_return_output;
     VAR_BIN_OP_OR_uxn_c_l246_c4_7159_right := VAR_CONST_SL_4_uxn_c_l244_c4_0aa9_return_output;
     VAR_BIN_OP_OR_uxn_c_l257_c4_9275_right := VAR_CONST_SL_4_uxn_c_l255_c4_0ca5_return_output;
     VAR_BIN_OP_OR_uxn_c_l224_c4_84c5_right := VAR_CONST_SL_8_uxn_c_l222_c4_b1ef_return_output;
     VAR_BIN_OP_OR_uxn_c_l235_c4_fbe8_right := VAR_CONST_SL_8_uxn_c_l233_c4_b910_return_output;
     REG_VAR_color_cmp_0 := VAR_color_cmp_0_MUX_uxn_c_l217_c2_0fe0_return_output;
     VAR_tmp12_MUX_uxn_c_l264_c8_eaef_iffalse := VAR_tmp12_MUX_uxn_c_l273_c8_9790_return_output;
     -- BIN_OP_OR[uxn_c_l235_c4_fbe8] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l235_c4_fbe8_left <= VAR_BIN_OP_OR_uxn_c_l235_c4_fbe8_left;
     BIN_OP_OR_uxn_c_l235_c4_fbe8_right <= VAR_BIN_OP_OR_uxn_c_l235_c4_fbe8_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l235_c4_fbe8_return_output := BIN_OP_OR_uxn_c_l235_c4_fbe8_return_output;

     -- BIN_OP_OR[uxn_c_l257_c4_9275] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l257_c4_9275_left <= VAR_BIN_OP_OR_uxn_c_l257_c4_9275_left;
     BIN_OP_OR_uxn_c_l257_c4_9275_right <= VAR_BIN_OP_OR_uxn_c_l257_c4_9275_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l257_c4_9275_return_output := BIN_OP_OR_uxn_c_l257_c4_9275_return_output;

     -- BIN_OP_OR[uxn_c_l246_c4_7159] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l246_c4_7159_left <= VAR_BIN_OP_OR_uxn_c_l246_c4_7159_left;
     BIN_OP_OR_uxn_c_l246_c4_7159_right <= VAR_BIN_OP_OR_uxn_c_l246_c4_7159_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l246_c4_7159_return_output := BIN_OP_OR_uxn_c_l246_c4_7159_return_output;

     -- tmp12_MUX[uxn_c_l264_c8_eaef] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_c_l264_c8_eaef_cond <= VAR_tmp12_MUX_uxn_c_l264_c8_eaef_cond;
     tmp12_MUX_uxn_c_l264_c8_eaef_iftrue <= VAR_tmp12_MUX_uxn_c_l264_c8_eaef_iftrue;
     tmp12_MUX_uxn_c_l264_c8_eaef_iffalse <= VAR_tmp12_MUX_uxn_c_l264_c8_eaef_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_c_l264_c8_eaef_return_output := tmp12_MUX_uxn_c_l264_c8_eaef_return_output;

     -- color3_MUX[uxn_c_l273_c8_9790] LATENCY=0
     -- Inputs
     color3_MUX_uxn_c_l273_c8_9790_cond <= VAR_color3_MUX_uxn_c_l273_c8_9790_cond;
     color3_MUX_uxn_c_l273_c8_9790_iftrue <= VAR_color3_MUX_uxn_c_l273_c8_9790_iftrue;
     color3_MUX_uxn_c_l273_c8_9790_iffalse <= VAR_color3_MUX_uxn_c_l273_c8_9790_iffalse;
     -- Outputs
     VAR_color3_MUX_uxn_c_l273_c8_9790_return_output := color3_MUX_uxn_c_l273_c8_9790_return_output;

     -- color1_MUX[uxn_c_l264_c8_eaef] LATENCY=0
     -- Inputs
     color1_MUX_uxn_c_l264_c8_eaef_cond <= VAR_color1_MUX_uxn_c_l264_c8_eaef_cond;
     color1_MUX_uxn_c_l264_c8_eaef_iftrue <= VAR_color1_MUX_uxn_c_l264_c8_eaef_iftrue;
     color1_MUX_uxn_c_l264_c8_eaef_iffalse <= VAR_color1_MUX_uxn_c_l264_c8_eaef_iffalse;
     -- Outputs
     VAR_color1_MUX_uxn_c_l264_c8_eaef_return_output := color1_MUX_uxn_c_l264_c8_eaef_return_output;

     -- BIN_OP_OR[uxn_c_l224_c4_84c5] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l224_c4_84c5_left <= VAR_BIN_OP_OR_uxn_c_l224_c4_84c5_left;
     BIN_OP_OR_uxn_c_l224_c4_84c5_right <= VAR_BIN_OP_OR_uxn_c_l224_c4_84c5_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l224_c4_84c5_return_output := BIN_OP_OR_uxn_c_l224_c4_84c5_return_output;

     -- BIN_OP_OR[uxn_c_l276_c4_2c8c] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l276_c4_2c8c_left <= VAR_BIN_OP_OR_uxn_c_l276_c4_2c8c_left;
     BIN_OP_OR_uxn_c_l276_c4_2c8c_right <= VAR_BIN_OP_OR_uxn_c_l276_c4_2c8c_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l276_c4_2c8c_return_output := BIN_OP_OR_uxn_c_l276_c4_2c8c_return_output;

     -- BIN_OP_OR[uxn_c_l267_c4_d494] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l267_c4_d494_left <= VAR_BIN_OP_OR_uxn_c_l267_c4_d494_left;
     BIN_OP_OR_uxn_c_l267_c4_d494_right <= VAR_BIN_OP_OR_uxn_c_l267_c4_d494_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l267_c4_d494_return_output := BIN_OP_OR_uxn_c_l267_c4_d494_return_output;

     -- Submodule level 4
     VAR_color0_MUX_uxn_c_l220_c3_d10e_iftrue := VAR_BIN_OP_OR_uxn_c_l224_c4_84c5_return_output;
     VAR_color2_MUX_uxn_c_l231_c8_e89c_iftrue := VAR_BIN_OP_OR_uxn_c_l235_c4_fbe8_return_output;
     VAR_color0_MUX_uxn_c_l242_c8_4769_iftrue := VAR_BIN_OP_OR_uxn_c_l246_c4_7159_return_output;
     VAR_color2_MUX_uxn_c_l253_c8_cbaf_iftrue := VAR_BIN_OP_OR_uxn_c_l257_c4_9275_return_output;
     VAR_color0_MUX_uxn_c_l264_c8_eaef_iftrue := VAR_BIN_OP_OR_uxn_c_l267_c4_d494_return_output;
     VAR_color2_MUX_uxn_c_l273_c8_9790_iftrue := VAR_BIN_OP_OR_uxn_c_l276_c4_2c8c_return_output;
     VAR_color1_MUX_uxn_c_l253_c8_cbaf_iffalse := VAR_color1_MUX_uxn_c_l264_c8_eaef_return_output;
     VAR_color3_MUX_uxn_c_l264_c8_eaef_iffalse := VAR_color3_MUX_uxn_c_l273_c8_9790_return_output;
     VAR_tmp12_MUX_uxn_c_l253_c8_cbaf_iffalse := VAR_tmp12_MUX_uxn_c_l264_c8_eaef_return_output;
     -- color3_MUX[uxn_c_l264_c8_eaef] LATENCY=0
     -- Inputs
     color3_MUX_uxn_c_l264_c8_eaef_cond <= VAR_color3_MUX_uxn_c_l264_c8_eaef_cond;
     color3_MUX_uxn_c_l264_c8_eaef_iftrue <= VAR_color3_MUX_uxn_c_l264_c8_eaef_iftrue;
     color3_MUX_uxn_c_l264_c8_eaef_iffalse <= VAR_color3_MUX_uxn_c_l264_c8_eaef_iffalse;
     -- Outputs
     VAR_color3_MUX_uxn_c_l264_c8_eaef_return_output := color3_MUX_uxn_c_l264_c8_eaef_return_output;

     -- color0_MUX[uxn_c_l264_c8_eaef] LATENCY=0
     -- Inputs
     color0_MUX_uxn_c_l264_c8_eaef_cond <= VAR_color0_MUX_uxn_c_l264_c8_eaef_cond;
     color0_MUX_uxn_c_l264_c8_eaef_iftrue <= VAR_color0_MUX_uxn_c_l264_c8_eaef_iftrue;
     color0_MUX_uxn_c_l264_c8_eaef_iffalse <= VAR_color0_MUX_uxn_c_l264_c8_eaef_iffalse;
     -- Outputs
     VAR_color0_MUX_uxn_c_l264_c8_eaef_return_output := color0_MUX_uxn_c_l264_c8_eaef_return_output;

     -- color1_MUX[uxn_c_l253_c8_cbaf] LATENCY=0
     -- Inputs
     color1_MUX_uxn_c_l253_c8_cbaf_cond <= VAR_color1_MUX_uxn_c_l253_c8_cbaf_cond;
     color1_MUX_uxn_c_l253_c8_cbaf_iftrue <= VAR_color1_MUX_uxn_c_l253_c8_cbaf_iftrue;
     color1_MUX_uxn_c_l253_c8_cbaf_iffalse <= VAR_color1_MUX_uxn_c_l253_c8_cbaf_iffalse;
     -- Outputs
     VAR_color1_MUX_uxn_c_l253_c8_cbaf_return_output := color1_MUX_uxn_c_l253_c8_cbaf_return_output;

     -- color2_MUX[uxn_c_l273_c8_9790] LATENCY=0
     -- Inputs
     color2_MUX_uxn_c_l273_c8_9790_cond <= VAR_color2_MUX_uxn_c_l273_c8_9790_cond;
     color2_MUX_uxn_c_l273_c8_9790_iftrue <= VAR_color2_MUX_uxn_c_l273_c8_9790_iftrue;
     color2_MUX_uxn_c_l273_c8_9790_iffalse <= VAR_color2_MUX_uxn_c_l273_c8_9790_iffalse;
     -- Outputs
     VAR_color2_MUX_uxn_c_l273_c8_9790_return_output := color2_MUX_uxn_c_l273_c8_9790_return_output;

     -- tmp12_MUX[uxn_c_l253_c8_cbaf] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_c_l253_c8_cbaf_cond <= VAR_tmp12_MUX_uxn_c_l253_c8_cbaf_cond;
     tmp12_MUX_uxn_c_l253_c8_cbaf_iftrue <= VAR_tmp12_MUX_uxn_c_l253_c8_cbaf_iftrue;
     tmp12_MUX_uxn_c_l253_c8_cbaf_iffalse <= VAR_tmp12_MUX_uxn_c_l253_c8_cbaf_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_c_l253_c8_cbaf_return_output := tmp12_MUX_uxn_c_l253_c8_cbaf_return_output;

     -- Submodule level 5
     VAR_color0_MUX_uxn_c_l253_c8_cbaf_iffalse := VAR_color0_MUX_uxn_c_l264_c8_eaef_return_output;
     VAR_color1_MUX_uxn_c_l242_c8_4769_iffalse := VAR_color1_MUX_uxn_c_l253_c8_cbaf_return_output;
     VAR_color2_MUX_uxn_c_l264_c8_eaef_iffalse := VAR_color2_MUX_uxn_c_l273_c8_9790_return_output;
     VAR_color3_MUX_uxn_c_l253_c8_cbaf_iffalse := VAR_color3_MUX_uxn_c_l264_c8_eaef_return_output;
     VAR_tmp12_MUX_uxn_c_l242_c8_4769_iffalse := VAR_tmp12_MUX_uxn_c_l253_c8_cbaf_return_output;
     -- color2_MUX[uxn_c_l264_c8_eaef] LATENCY=0
     -- Inputs
     color2_MUX_uxn_c_l264_c8_eaef_cond <= VAR_color2_MUX_uxn_c_l264_c8_eaef_cond;
     color2_MUX_uxn_c_l264_c8_eaef_iftrue <= VAR_color2_MUX_uxn_c_l264_c8_eaef_iftrue;
     color2_MUX_uxn_c_l264_c8_eaef_iffalse <= VAR_color2_MUX_uxn_c_l264_c8_eaef_iffalse;
     -- Outputs
     VAR_color2_MUX_uxn_c_l264_c8_eaef_return_output := color2_MUX_uxn_c_l264_c8_eaef_return_output;

     -- color3_MUX[uxn_c_l253_c8_cbaf] LATENCY=0
     -- Inputs
     color3_MUX_uxn_c_l253_c8_cbaf_cond <= VAR_color3_MUX_uxn_c_l253_c8_cbaf_cond;
     color3_MUX_uxn_c_l253_c8_cbaf_iftrue <= VAR_color3_MUX_uxn_c_l253_c8_cbaf_iftrue;
     color3_MUX_uxn_c_l253_c8_cbaf_iffalse <= VAR_color3_MUX_uxn_c_l253_c8_cbaf_iffalse;
     -- Outputs
     VAR_color3_MUX_uxn_c_l253_c8_cbaf_return_output := color3_MUX_uxn_c_l253_c8_cbaf_return_output;

     -- color0_MUX[uxn_c_l253_c8_cbaf] LATENCY=0
     -- Inputs
     color0_MUX_uxn_c_l253_c8_cbaf_cond <= VAR_color0_MUX_uxn_c_l253_c8_cbaf_cond;
     color0_MUX_uxn_c_l253_c8_cbaf_iftrue <= VAR_color0_MUX_uxn_c_l253_c8_cbaf_iftrue;
     color0_MUX_uxn_c_l253_c8_cbaf_iffalse <= VAR_color0_MUX_uxn_c_l253_c8_cbaf_iffalse;
     -- Outputs
     VAR_color0_MUX_uxn_c_l253_c8_cbaf_return_output := color0_MUX_uxn_c_l253_c8_cbaf_return_output;

     -- tmp12_MUX[uxn_c_l242_c8_4769] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_c_l242_c8_4769_cond <= VAR_tmp12_MUX_uxn_c_l242_c8_4769_cond;
     tmp12_MUX_uxn_c_l242_c8_4769_iftrue <= VAR_tmp12_MUX_uxn_c_l242_c8_4769_iftrue;
     tmp12_MUX_uxn_c_l242_c8_4769_iffalse <= VAR_tmp12_MUX_uxn_c_l242_c8_4769_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_c_l242_c8_4769_return_output := tmp12_MUX_uxn_c_l242_c8_4769_return_output;

     -- color1_MUX[uxn_c_l242_c8_4769] LATENCY=0
     -- Inputs
     color1_MUX_uxn_c_l242_c8_4769_cond <= VAR_color1_MUX_uxn_c_l242_c8_4769_cond;
     color1_MUX_uxn_c_l242_c8_4769_iftrue <= VAR_color1_MUX_uxn_c_l242_c8_4769_iftrue;
     color1_MUX_uxn_c_l242_c8_4769_iffalse <= VAR_color1_MUX_uxn_c_l242_c8_4769_iffalse;
     -- Outputs
     VAR_color1_MUX_uxn_c_l242_c8_4769_return_output := color1_MUX_uxn_c_l242_c8_4769_return_output;

     -- Submodule level 6
     VAR_color0_MUX_uxn_c_l242_c8_4769_iffalse := VAR_color0_MUX_uxn_c_l253_c8_cbaf_return_output;
     VAR_color1_MUX_uxn_c_l231_c8_e89c_iffalse := VAR_color1_MUX_uxn_c_l242_c8_4769_return_output;
     VAR_color2_MUX_uxn_c_l253_c8_cbaf_iffalse := VAR_color2_MUX_uxn_c_l264_c8_eaef_return_output;
     VAR_color3_MUX_uxn_c_l242_c8_4769_iffalse := VAR_color3_MUX_uxn_c_l253_c8_cbaf_return_output;
     VAR_tmp12_MUX_uxn_c_l231_c8_e89c_iffalse := VAR_tmp12_MUX_uxn_c_l242_c8_4769_return_output;
     -- tmp12_MUX[uxn_c_l231_c8_e89c] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_c_l231_c8_e89c_cond <= VAR_tmp12_MUX_uxn_c_l231_c8_e89c_cond;
     tmp12_MUX_uxn_c_l231_c8_e89c_iftrue <= VAR_tmp12_MUX_uxn_c_l231_c8_e89c_iftrue;
     tmp12_MUX_uxn_c_l231_c8_e89c_iffalse <= VAR_tmp12_MUX_uxn_c_l231_c8_e89c_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_c_l231_c8_e89c_return_output := tmp12_MUX_uxn_c_l231_c8_e89c_return_output;

     -- color3_MUX[uxn_c_l242_c8_4769] LATENCY=0
     -- Inputs
     color3_MUX_uxn_c_l242_c8_4769_cond <= VAR_color3_MUX_uxn_c_l242_c8_4769_cond;
     color3_MUX_uxn_c_l242_c8_4769_iftrue <= VAR_color3_MUX_uxn_c_l242_c8_4769_iftrue;
     color3_MUX_uxn_c_l242_c8_4769_iffalse <= VAR_color3_MUX_uxn_c_l242_c8_4769_iffalse;
     -- Outputs
     VAR_color3_MUX_uxn_c_l242_c8_4769_return_output := color3_MUX_uxn_c_l242_c8_4769_return_output;

     -- color0_MUX[uxn_c_l242_c8_4769] LATENCY=0
     -- Inputs
     color0_MUX_uxn_c_l242_c8_4769_cond <= VAR_color0_MUX_uxn_c_l242_c8_4769_cond;
     color0_MUX_uxn_c_l242_c8_4769_iftrue <= VAR_color0_MUX_uxn_c_l242_c8_4769_iftrue;
     color0_MUX_uxn_c_l242_c8_4769_iffalse <= VAR_color0_MUX_uxn_c_l242_c8_4769_iffalse;
     -- Outputs
     VAR_color0_MUX_uxn_c_l242_c8_4769_return_output := color0_MUX_uxn_c_l242_c8_4769_return_output;

     -- color1_MUX[uxn_c_l231_c8_e89c] LATENCY=0
     -- Inputs
     color1_MUX_uxn_c_l231_c8_e89c_cond <= VAR_color1_MUX_uxn_c_l231_c8_e89c_cond;
     color1_MUX_uxn_c_l231_c8_e89c_iftrue <= VAR_color1_MUX_uxn_c_l231_c8_e89c_iftrue;
     color1_MUX_uxn_c_l231_c8_e89c_iffalse <= VAR_color1_MUX_uxn_c_l231_c8_e89c_iffalse;
     -- Outputs
     VAR_color1_MUX_uxn_c_l231_c8_e89c_return_output := color1_MUX_uxn_c_l231_c8_e89c_return_output;

     -- color2_MUX[uxn_c_l253_c8_cbaf] LATENCY=0
     -- Inputs
     color2_MUX_uxn_c_l253_c8_cbaf_cond <= VAR_color2_MUX_uxn_c_l253_c8_cbaf_cond;
     color2_MUX_uxn_c_l253_c8_cbaf_iftrue <= VAR_color2_MUX_uxn_c_l253_c8_cbaf_iftrue;
     color2_MUX_uxn_c_l253_c8_cbaf_iffalse <= VAR_color2_MUX_uxn_c_l253_c8_cbaf_iffalse;
     -- Outputs
     VAR_color2_MUX_uxn_c_l253_c8_cbaf_return_output := color2_MUX_uxn_c_l253_c8_cbaf_return_output;

     -- Submodule level 7
     VAR_color0_MUX_uxn_c_l231_c8_e89c_iffalse := VAR_color0_MUX_uxn_c_l242_c8_4769_return_output;
     VAR_color1_MUX_uxn_c_l220_c3_d10e_iffalse := VAR_color1_MUX_uxn_c_l231_c8_e89c_return_output;
     VAR_color2_MUX_uxn_c_l242_c8_4769_iffalse := VAR_color2_MUX_uxn_c_l253_c8_cbaf_return_output;
     VAR_color3_MUX_uxn_c_l231_c8_e89c_iffalse := VAR_color3_MUX_uxn_c_l242_c8_4769_return_output;
     VAR_tmp12_MUX_uxn_c_l220_c3_d10e_iffalse := VAR_tmp12_MUX_uxn_c_l231_c8_e89c_return_output;
     -- color1_MUX[uxn_c_l220_c3_d10e] LATENCY=0
     -- Inputs
     color1_MUX_uxn_c_l220_c3_d10e_cond <= VAR_color1_MUX_uxn_c_l220_c3_d10e_cond;
     color1_MUX_uxn_c_l220_c3_d10e_iftrue <= VAR_color1_MUX_uxn_c_l220_c3_d10e_iftrue;
     color1_MUX_uxn_c_l220_c3_d10e_iffalse <= VAR_color1_MUX_uxn_c_l220_c3_d10e_iffalse;
     -- Outputs
     VAR_color1_MUX_uxn_c_l220_c3_d10e_return_output := color1_MUX_uxn_c_l220_c3_d10e_return_output;

     -- color3_MUX[uxn_c_l231_c8_e89c] LATENCY=0
     -- Inputs
     color3_MUX_uxn_c_l231_c8_e89c_cond <= VAR_color3_MUX_uxn_c_l231_c8_e89c_cond;
     color3_MUX_uxn_c_l231_c8_e89c_iftrue <= VAR_color3_MUX_uxn_c_l231_c8_e89c_iftrue;
     color3_MUX_uxn_c_l231_c8_e89c_iffalse <= VAR_color3_MUX_uxn_c_l231_c8_e89c_iffalse;
     -- Outputs
     VAR_color3_MUX_uxn_c_l231_c8_e89c_return_output := color3_MUX_uxn_c_l231_c8_e89c_return_output;

     -- color2_MUX[uxn_c_l242_c8_4769] LATENCY=0
     -- Inputs
     color2_MUX_uxn_c_l242_c8_4769_cond <= VAR_color2_MUX_uxn_c_l242_c8_4769_cond;
     color2_MUX_uxn_c_l242_c8_4769_iftrue <= VAR_color2_MUX_uxn_c_l242_c8_4769_iftrue;
     color2_MUX_uxn_c_l242_c8_4769_iffalse <= VAR_color2_MUX_uxn_c_l242_c8_4769_iffalse;
     -- Outputs
     VAR_color2_MUX_uxn_c_l242_c8_4769_return_output := color2_MUX_uxn_c_l242_c8_4769_return_output;

     -- color0_MUX[uxn_c_l231_c8_e89c] LATENCY=0
     -- Inputs
     color0_MUX_uxn_c_l231_c8_e89c_cond <= VAR_color0_MUX_uxn_c_l231_c8_e89c_cond;
     color0_MUX_uxn_c_l231_c8_e89c_iftrue <= VAR_color0_MUX_uxn_c_l231_c8_e89c_iftrue;
     color0_MUX_uxn_c_l231_c8_e89c_iffalse <= VAR_color0_MUX_uxn_c_l231_c8_e89c_iffalse;
     -- Outputs
     VAR_color0_MUX_uxn_c_l231_c8_e89c_return_output := color0_MUX_uxn_c_l231_c8_e89c_return_output;

     -- tmp12_MUX[uxn_c_l220_c3_d10e] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_c_l220_c3_d10e_cond <= VAR_tmp12_MUX_uxn_c_l220_c3_d10e_cond;
     tmp12_MUX_uxn_c_l220_c3_d10e_iftrue <= VAR_tmp12_MUX_uxn_c_l220_c3_d10e_iftrue;
     tmp12_MUX_uxn_c_l220_c3_d10e_iffalse <= VAR_tmp12_MUX_uxn_c_l220_c3_d10e_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_c_l220_c3_d10e_return_output := tmp12_MUX_uxn_c_l220_c3_d10e_return_output;

     -- Submodule level 8
     VAR_color0_MUX_uxn_c_l220_c3_d10e_iffalse := VAR_color0_MUX_uxn_c_l231_c8_e89c_return_output;
     VAR_color1_MUX_uxn_c_l217_c2_0fe0_iftrue := VAR_color1_MUX_uxn_c_l220_c3_d10e_return_output;
     VAR_color2_MUX_uxn_c_l231_c8_e89c_iffalse := VAR_color2_MUX_uxn_c_l242_c8_4769_return_output;
     VAR_color3_MUX_uxn_c_l220_c3_d10e_iffalse := VAR_color3_MUX_uxn_c_l231_c8_e89c_return_output;
     VAR_tmp12_MUX_uxn_c_l217_c2_0fe0_iftrue := VAR_tmp12_MUX_uxn_c_l220_c3_d10e_return_output;
     -- tmp12_MUX[uxn_c_l217_c2_0fe0] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_c_l217_c2_0fe0_cond <= VAR_tmp12_MUX_uxn_c_l217_c2_0fe0_cond;
     tmp12_MUX_uxn_c_l217_c2_0fe0_iftrue <= VAR_tmp12_MUX_uxn_c_l217_c2_0fe0_iftrue;
     tmp12_MUX_uxn_c_l217_c2_0fe0_iffalse <= VAR_tmp12_MUX_uxn_c_l217_c2_0fe0_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_c_l217_c2_0fe0_return_output := tmp12_MUX_uxn_c_l217_c2_0fe0_return_output;

     -- color0_MUX[uxn_c_l220_c3_d10e] LATENCY=0
     -- Inputs
     color0_MUX_uxn_c_l220_c3_d10e_cond <= VAR_color0_MUX_uxn_c_l220_c3_d10e_cond;
     color0_MUX_uxn_c_l220_c3_d10e_iftrue <= VAR_color0_MUX_uxn_c_l220_c3_d10e_iftrue;
     color0_MUX_uxn_c_l220_c3_d10e_iffalse <= VAR_color0_MUX_uxn_c_l220_c3_d10e_iffalse;
     -- Outputs
     VAR_color0_MUX_uxn_c_l220_c3_d10e_return_output := color0_MUX_uxn_c_l220_c3_d10e_return_output;

     -- color1_MUX[uxn_c_l217_c2_0fe0] LATENCY=0
     -- Inputs
     color1_MUX_uxn_c_l217_c2_0fe0_cond <= VAR_color1_MUX_uxn_c_l217_c2_0fe0_cond;
     color1_MUX_uxn_c_l217_c2_0fe0_iftrue <= VAR_color1_MUX_uxn_c_l217_c2_0fe0_iftrue;
     color1_MUX_uxn_c_l217_c2_0fe0_iffalse <= VAR_color1_MUX_uxn_c_l217_c2_0fe0_iffalse;
     -- Outputs
     VAR_color1_MUX_uxn_c_l217_c2_0fe0_return_output := color1_MUX_uxn_c_l217_c2_0fe0_return_output;

     -- color3_MUX[uxn_c_l220_c3_d10e] LATENCY=0
     -- Inputs
     color3_MUX_uxn_c_l220_c3_d10e_cond <= VAR_color3_MUX_uxn_c_l220_c3_d10e_cond;
     color3_MUX_uxn_c_l220_c3_d10e_iftrue <= VAR_color3_MUX_uxn_c_l220_c3_d10e_iftrue;
     color3_MUX_uxn_c_l220_c3_d10e_iffalse <= VAR_color3_MUX_uxn_c_l220_c3_d10e_iffalse;
     -- Outputs
     VAR_color3_MUX_uxn_c_l220_c3_d10e_return_output := color3_MUX_uxn_c_l220_c3_d10e_return_output;

     -- color2_MUX[uxn_c_l231_c8_e89c] LATENCY=0
     -- Inputs
     color2_MUX_uxn_c_l231_c8_e89c_cond <= VAR_color2_MUX_uxn_c_l231_c8_e89c_cond;
     color2_MUX_uxn_c_l231_c8_e89c_iftrue <= VAR_color2_MUX_uxn_c_l231_c8_e89c_iftrue;
     color2_MUX_uxn_c_l231_c8_e89c_iffalse <= VAR_color2_MUX_uxn_c_l231_c8_e89c_iffalse;
     -- Outputs
     VAR_color2_MUX_uxn_c_l231_c8_e89c_return_output := color2_MUX_uxn_c_l231_c8_e89c_return_output;

     -- Submodule level 9
     VAR_color0_MUX_uxn_c_l217_c2_0fe0_iftrue := VAR_color0_MUX_uxn_c_l220_c3_d10e_return_output;
     REG_VAR_color1 := VAR_color1_MUX_uxn_c_l217_c2_0fe0_return_output;
     VAR_result_uxn_c_l287_c3_cda9 := resize(VAR_color1_MUX_uxn_c_l217_c2_0fe0_return_output, 16);
     VAR_color2_MUX_uxn_c_l220_c3_d10e_iffalse := VAR_color2_MUX_uxn_c_l231_c8_e89c_return_output;
     VAR_color3_MUX_uxn_c_l217_c2_0fe0_iftrue := VAR_color3_MUX_uxn_c_l220_c3_d10e_return_output;
     REG_VAR_tmp12 := VAR_tmp12_MUX_uxn_c_l217_c2_0fe0_return_output;
     VAR_result_MUX_uxn_c_l286_c9_cb5b_iftrue := VAR_result_uxn_c_l287_c3_cda9;
     -- color2_MUX[uxn_c_l220_c3_d10e] LATENCY=0
     -- Inputs
     color2_MUX_uxn_c_l220_c3_d10e_cond <= VAR_color2_MUX_uxn_c_l220_c3_d10e_cond;
     color2_MUX_uxn_c_l220_c3_d10e_iftrue <= VAR_color2_MUX_uxn_c_l220_c3_d10e_iftrue;
     color2_MUX_uxn_c_l220_c3_d10e_iffalse <= VAR_color2_MUX_uxn_c_l220_c3_d10e_iffalse;
     -- Outputs
     VAR_color2_MUX_uxn_c_l220_c3_d10e_return_output := color2_MUX_uxn_c_l220_c3_d10e_return_output;

     -- color0_MUX[uxn_c_l217_c2_0fe0] LATENCY=0
     -- Inputs
     color0_MUX_uxn_c_l217_c2_0fe0_cond <= VAR_color0_MUX_uxn_c_l217_c2_0fe0_cond;
     color0_MUX_uxn_c_l217_c2_0fe0_iftrue <= VAR_color0_MUX_uxn_c_l217_c2_0fe0_iftrue;
     color0_MUX_uxn_c_l217_c2_0fe0_iffalse <= VAR_color0_MUX_uxn_c_l217_c2_0fe0_iffalse;
     -- Outputs
     VAR_color0_MUX_uxn_c_l217_c2_0fe0_return_output := color0_MUX_uxn_c_l217_c2_0fe0_return_output;

     -- color3_MUX[uxn_c_l217_c2_0fe0] LATENCY=0
     -- Inputs
     color3_MUX_uxn_c_l217_c2_0fe0_cond <= VAR_color3_MUX_uxn_c_l217_c2_0fe0_cond;
     color3_MUX_uxn_c_l217_c2_0fe0_iftrue <= VAR_color3_MUX_uxn_c_l217_c2_0fe0_iftrue;
     color3_MUX_uxn_c_l217_c2_0fe0_iffalse <= VAR_color3_MUX_uxn_c_l217_c2_0fe0_iffalse;
     -- Outputs
     VAR_color3_MUX_uxn_c_l217_c2_0fe0_return_output := color3_MUX_uxn_c_l217_c2_0fe0_return_output;

     -- Submodule level 10
     REG_VAR_color0 := VAR_color0_MUX_uxn_c_l217_c2_0fe0_return_output;
     VAR_result_uxn_c_l285_c3_9bcd := resize(VAR_color0_MUX_uxn_c_l217_c2_0fe0_return_output, 16);
     VAR_color2_MUX_uxn_c_l217_c2_0fe0_iftrue := VAR_color2_MUX_uxn_c_l220_c3_d10e_return_output;
     REG_VAR_color3 := VAR_color3_MUX_uxn_c_l217_c2_0fe0_return_output;
     VAR_result_uxn_c_l291_c3_d226 := resize(VAR_color3_MUX_uxn_c_l217_c2_0fe0_return_output, 16);
     VAR_result_MUX_uxn_c_l284_c2_b5d3_iftrue := VAR_result_uxn_c_l285_c3_9bcd;
     VAR_result_MUX_uxn_c_l288_c9_8501_iffalse := VAR_result_uxn_c_l291_c3_d226;
     -- color2_MUX[uxn_c_l217_c2_0fe0] LATENCY=0
     -- Inputs
     color2_MUX_uxn_c_l217_c2_0fe0_cond <= VAR_color2_MUX_uxn_c_l217_c2_0fe0_cond;
     color2_MUX_uxn_c_l217_c2_0fe0_iftrue <= VAR_color2_MUX_uxn_c_l217_c2_0fe0_iftrue;
     color2_MUX_uxn_c_l217_c2_0fe0_iffalse <= VAR_color2_MUX_uxn_c_l217_c2_0fe0_iffalse;
     -- Outputs
     VAR_color2_MUX_uxn_c_l217_c2_0fe0_return_output := color2_MUX_uxn_c_l217_c2_0fe0_return_output;

     -- Submodule level 11
     REG_VAR_color2 := VAR_color2_MUX_uxn_c_l217_c2_0fe0_return_output;
     VAR_result_uxn_c_l289_c3_f139 := resize(VAR_color2_MUX_uxn_c_l217_c2_0fe0_return_output, 16);
     VAR_result_MUX_uxn_c_l288_c9_8501_iftrue := VAR_result_uxn_c_l289_c3_f139;
     -- result_MUX[uxn_c_l288_c9_8501] LATENCY=0
     -- Inputs
     result_MUX_uxn_c_l288_c9_8501_cond <= VAR_result_MUX_uxn_c_l288_c9_8501_cond;
     result_MUX_uxn_c_l288_c9_8501_iftrue <= VAR_result_MUX_uxn_c_l288_c9_8501_iftrue;
     result_MUX_uxn_c_l288_c9_8501_iffalse <= VAR_result_MUX_uxn_c_l288_c9_8501_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_c_l288_c9_8501_return_output := result_MUX_uxn_c_l288_c9_8501_return_output;

     -- Submodule level 12
     VAR_result_MUX_uxn_c_l286_c9_cb5b_iffalse := VAR_result_MUX_uxn_c_l288_c9_8501_return_output;
     -- result_MUX[uxn_c_l286_c9_cb5b] LATENCY=0
     -- Inputs
     result_MUX_uxn_c_l286_c9_cb5b_cond <= VAR_result_MUX_uxn_c_l286_c9_cb5b_cond;
     result_MUX_uxn_c_l286_c9_cb5b_iftrue <= VAR_result_MUX_uxn_c_l286_c9_cb5b_iftrue;
     result_MUX_uxn_c_l286_c9_cb5b_iffalse <= VAR_result_MUX_uxn_c_l286_c9_cb5b_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_c_l286_c9_cb5b_return_output := result_MUX_uxn_c_l286_c9_cb5b_return_output;

     -- Submodule level 13
     VAR_result_MUX_uxn_c_l284_c2_b5d3_iffalse := VAR_result_MUX_uxn_c_l286_c9_cb5b_return_output;
     -- result_MUX[uxn_c_l284_c2_b5d3] LATENCY=0
     -- Inputs
     result_MUX_uxn_c_l284_c2_b5d3_cond <= VAR_result_MUX_uxn_c_l284_c2_b5d3_cond;
     result_MUX_uxn_c_l284_c2_b5d3_iftrue <= VAR_result_MUX_uxn_c_l284_c2_b5d3_iftrue;
     result_MUX_uxn_c_l284_c2_b5d3_iffalse <= VAR_result_MUX_uxn_c_l284_c2_b5d3_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_c_l284_c2_b5d3_return_output := result_MUX_uxn_c_l284_c2_b5d3_return_output;

     -- Submodule level 14
     REG_VAR_result := VAR_result_MUX_uxn_c_l284_c2_b5d3_return_output;
     VAR_return_output := VAR_result_MUX_uxn_c_l284_c2_b5d3_return_output;
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
