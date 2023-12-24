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
-- Submodules: 63
entity palette_snoop_0CLK_ddbb7dc6 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 device_ram_address : in unsigned(7 downto 0);
 device_ram_value : in unsigned(7 downto 0);
 is_device_ram_write : in unsigned(0 downto 0);
 gpu_step_color : in unsigned(1 downto 0);
 return_output : out unsigned(15 downto 0));
end palette_snoop_0CLK_ddbb7dc6;
architecture arch of palette_snoop_0CLK_ddbb7dc6 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal color : uint12_t_4 := (
0 => to_unsigned(4095, 12),
1 => to_unsigned(0, 12),
2 => to_unsigned(2011, 12),
3 => to_unsigned(3938, 12),
others => to_unsigned(0, 12))
;
signal REG_COMB_color : uint12_t_4;

-- Each function instance gets signals
-- CONST_SR_4[uxn_c_l201_c30_f6e6]
signal CONST_SR_4_uxn_c_l201_c30_f6e6_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_c_l201_c30_f6e6_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_c_l201_c30_bb04]
signal BIN_OP_EQ_uxn_c_l201_c30_bb04_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l201_c30_bb04_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l201_c30_bb04_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l201_c30_c5eb]
signal MUX_uxn_c_l201_c30_c5eb_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l201_c30_c5eb_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l201_c30_c5eb_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l201_c30_c5eb_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l203_c6_4351]
signal BIN_OP_AND_uxn_c_l203_c6_4351_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l203_c6_4351_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l203_c6_4351_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_c_l203_c2_c9ac]
signal color_MUX_uxn_c_l203_c2_c9ac_cond : unsigned(0 downto 0);
signal color_MUX_uxn_c_l203_c2_c9ac_iftrue : uint12_t_4;
signal color_MUX_uxn_c_l203_c2_c9ac_iffalse : uint12_t_4;
signal color_MUX_uxn_c_l203_c2_c9ac_return_output : uint12_t_4;

-- CONST_SR_4[uxn_c_l206_c35_c39c]
signal CONST_SR_4_uxn_c_l206_c35_c39c_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_c_l206_c35_c39c_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_c_l209_c7_da82]
signal BIN_OP_EQ_uxn_c_l209_c7_da82_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l209_c7_da82_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l209_c7_da82_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_c_l209_c3_6acd]
signal color_MUX_uxn_c_l209_c3_6acd_cond : unsigned(0 downto 0);
signal color_MUX_uxn_c_l209_c3_6acd_iftrue : uint12_t_4;
signal color_MUX_uxn_c_l209_c3_6acd_iffalse : uint12_t_4;
signal color_MUX_uxn_c_l209_c3_6acd_return_output : uint12_t_4;

-- CONST_SL_8[uxn_c_l211_c4_29d1]
signal CONST_SL_8_uxn_c_l211_c4_29d1_x : unsigned(11 downto 0);
signal CONST_SL_8_uxn_c_l211_c4_29d1_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l212_c4_467b]
signal BIN_OP_AND_uxn_c_l212_c4_467b_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l212_c4_467b_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l212_c4_467b_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l213_c4_2ce4]
signal BIN_OP_OR_uxn_c_l213_c4_2ce4_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l213_c4_2ce4_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l213_c4_2ce4_return_output : unsigned(11 downto 0);

-- CONST_SL_8[uxn_c_l216_c4_b726]
signal CONST_SL_8_uxn_c_l216_c4_b726_x : unsigned(11 downto 0);
signal CONST_SL_8_uxn_c_l216_c4_b726_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l217_c4_b190]
signal BIN_OP_AND_uxn_c_l217_c4_b190_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l217_c4_b190_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l217_c4_b190_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l218_c4_8062]
signal BIN_OP_OR_uxn_c_l218_c4_8062_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l218_c4_8062_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l218_c4_8062_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l220_c12_7d79]
signal BIN_OP_EQ_uxn_c_l220_c12_7d79_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l220_c12_7d79_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l220_c12_7d79_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_c_l220_c8_f1eb]
signal color_MUX_uxn_c_l220_c8_f1eb_cond : unsigned(0 downto 0);
signal color_MUX_uxn_c_l220_c8_f1eb_iftrue : uint12_t_4;
signal color_MUX_uxn_c_l220_c8_f1eb_iffalse : uint12_t_4;
signal color_MUX_uxn_c_l220_c8_f1eb_return_output : uint12_t_4;

-- CONST_SL_8[uxn_c_l222_c4_1755]
signal CONST_SL_8_uxn_c_l222_c4_1755_x : unsigned(11 downto 0);
signal CONST_SL_8_uxn_c_l222_c4_1755_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l223_c4_373b]
signal BIN_OP_AND_uxn_c_l223_c4_373b_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l223_c4_373b_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l223_c4_373b_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l224_c4_b751]
signal BIN_OP_OR_uxn_c_l224_c4_b751_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l224_c4_b751_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l224_c4_b751_return_output : unsigned(11 downto 0);

-- CONST_SL_8[uxn_c_l227_c4_f760]
signal CONST_SL_8_uxn_c_l227_c4_f760_x : unsigned(11 downto 0);
signal CONST_SL_8_uxn_c_l227_c4_f760_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l228_c4_45e5]
signal BIN_OP_AND_uxn_c_l228_c4_45e5_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l228_c4_45e5_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l228_c4_45e5_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l229_c4_80d1]
signal BIN_OP_OR_uxn_c_l229_c4_80d1_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l229_c4_80d1_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l229_c4_80d1_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l231_c12_fecc]
signal BIN_OP_EQ_uxn_c_l231_c12_fecc_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l231_c12_fecc_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l231_c12_fecc_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_c_l231_c8_5ad5]
signal color_MUX_uxn_c_l231_c8_5ad5_cond : unsigned(0 downto 0);
signal color_MUX_uxn_c_l231_c8_5ad5_iftrue : uint12_t_4;
signal color_MUX_uxn_c_l231_c8_5ad5_iffalse : uint12_t_4;
signal color_MUX_uxn_c_l231_c8_5ad5_return_output : uint12_t_4;

-- CONST_SL_4[uxn_c_l233_c4_2f2c]
signal CONST_SL_4_uxn_c_l233_c4_2f2c_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_c_l233_c4_2f2c_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l234_c4_cec9]
signal BIN_OP_AND_uxn_c_l234_c4_cec9_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l234_c4_cec9_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l234_c4_cec9_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l235_c4_c72d]
signal BIN_OP_OR_uxn_c_l235_c4_c72d_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l235_c4_c72d_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l235_c4_c72d_return_output : unsigned(11 downto 0);

-- CONST_SL_4[uxn_c_l238_c4_41e3]
signal CONST_SL_4_uxn_c_l238_c4_41e3_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_c_l238_c4_41e3_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l239_c4_f0d5]
signal BIN_OP_AND_uxn_c_l239_c4_f0d5_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l239_c4_f0d5_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l239_c4_f0d5_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l240_c4_9f4b]
signal BIN_OP_OR_uxn_c_l240_c4_9f4b_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l240_c4_9f4b_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l240_c4_9f4b_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l242_c12_91de]
signal BIN_OP_EQ_uxn_c_l242_c12_91de_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l242_c12_91de_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l242_c12_91de_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_c_l242_c8_d84f]
signal color_MUX_uxn_c_l242_c8_d84f_cond : unsigned(0 downto 0);
signal color_MUX_uxn_c_l242_c8_d84f_iftrue : uint12_t_4;
signal color_MUX_uxn_c_l242_c8_d84f_iffalse : uint12_t_4;
signal color_MUX_uxn_c_l242_c8_d84f_return_output : uint12_t_4;

-- CONST_SL_4[uxn_c_l244_c4_6a7a]
signal CONST_SL_4_uxn_c_l244_c4_6a7a_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_c_l244_c4_6a7a_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l245_c4_c740]
signal BIN_OP_AND_uxn_c_l245_c4_c740_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l245_c4_c740_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l245_c4_c740_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l246_c4_44cf]
signal BIN_OP_OR_uxn_c_l246_c4_44cf_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l246_c4_44cf_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l246_c4_44cf_return_output : unsigned(11 downto 0);

-- CONST_SL_4[uxn_c_l249_c4_375c]
signal CONST_SL_4_uxn_c_l249_c4_375c_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_c_l249_c4_375c_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l250_c4_0e27]
signal BIN_OP_AND_uxn_c_l250_c4_0e27_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l250_c4_0e27_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l250_c4_0e27_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l251_c4_ba0c]
signal BIN_OP_OR_uxn_c_l251_c4_ba0c_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l251_c4_ba0c_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l251_c4_ba0c_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l253_c12_e528]
signal BIN_OP_EQ_uxn_c_l253_c12_e528_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l253_c12_e528_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l253_c12_e528_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_c_l253_c8_956f]
signal color_MUX_uxn_c_l253_c8_956f_cond : unsigned(0 downto 0);
signal color_MUX_uxn_c_l253_c8_956f_iftrue : uint12_t_4;
signal color_MUX_uxn_c_l253_c8_956f_iffalse : uint12_t_4;
signal color_MUX_uxn_c_l253_c8_956f_return_output : uint12_t_4;

-- BIN_OP_AND[uxn_c_l255_c4_f6e6]
signal BIN_OP_AND_uxn_c_l255_c4_f6e6_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l255_c4_f6e6_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l255_c4_f6e6_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l256_c4_62cf]
signal BIN_OP_OR_uxn_c_l256_c4_62cf_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l256_c4_62cf_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l256_c4_62cf_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l259_c4_2c1e]
signal BIN_OP_AND_uxn_c_l259_c4_2c1e_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l259_c4_2c1e_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l259_c4_2c1e_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l260_c4_65f1]
signal BIN_OP_OR_uxn_c_l260_c4_65f1_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l260_c4_65f1_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l260_c4_65f1_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l262_c12_1c66]
signal BIN_OP_EQ_uxn_c_l262_c12_1c66_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l262_c12_1c66_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l262_c12_1c66_return_output : unsigned(0 downto 0);

-- color_2_MUX[uxn_c_l262_c8_28c9]
signal color_2_MUX_uxn_c_l262_c8_28c9_cond : unsigned(0 downto 0);
signal color_2_MUX_uxn_c_l262_c8_28c9_iftrue : unsigned(11 downto 0);
signal color_2_MUX_uxn_c_l262_c8_28c9_iffalse : unsigned(11 downto 0);
signal color_2_MUX_uxn_c_l262_c8_28c9_return_output : unsigned(11 downto 0);

-- color_3_MUX[uxn_c_l262_c8_28c9]
signal color_3_MUX_uxn_c_l262_c8_28c9_cond : unsigned(0 downto 0);
signal color_3_MUX_uxn_c_l262_c8_28c9_iftrue : unsigned(11 downto 0);
signal color_3_MUX_uxn_c_l262_c8_28c9_iffalse : unsigned(11 downto 0);
signal color_3_MUX_uxn_c_l262_c8_28c9_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l264_c4_461f]
signal BIN_OP_AND_uxn_c_l264_c4_461f_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l264_c4_461f_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l264_c4_461f_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l265_c4_5a82]
signal BIN_OP_OR_uxn_c_l265_c4_5a82_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l265_c4_5a82_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l265_c4_5a82_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l268_c4_9879]
signal BIN_OP_AND_uxn_c_l268_c4_9879_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l268_c4_9879_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l268_c4_9879_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l269_c4_833e]
signal BIN_OP_OR_uxn_c_l269_c4_833e_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l269_c4_833e_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l269_c4_833e_return_output : unsigned(11 downto 0);

-- VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d[uxn_c_l273_c20_fe9f]
signal VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l273_c20_fe9f_ref_toks_0 : uint12_t_4;
signal VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l273_c20_fe9f_var_dim_0 : unsigned(1 downto 0);
signal VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l273_c20_fe9f_return_output : unsigned(11 downto 0);

function CAST_TO_uint4_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(3 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,4)));
    return return_output;
end function;

function CONST_REF_RD_uint12_t_4_uint12_t_4_90b8( ref_toks_0 : uint12_t_4;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned) return uint12_t_4 is
 
  variable base : uint12_t_4; 
  variable return_output : uint12_t_4;
begin
      base := ref_toks_0;
      base(0) := ref_toks_1;
      base(1) := ref_toks_2;

      return_output := base;
      return return_output; 
end function;

function CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5( ref_toks_0 : uint12_t_4;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned) return uint12_t_4 is
 
  variable base : uint12_t_4; 
  variable return_output : uint12_t_4;
begin
      base := ref_toks_0;
      base(2) := ref_toks_1;
      base(3) := ref_toks_2;

      return_output := base;
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
-- CONST_SR_4_uxn_c_l201_c30_f6e6
CONST_SR_4_uxn_c_l201_c30_f6e6 : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_c_l201_c30_f6e6_x,
CONST_SR_4_uxn_c_l201_c30_f6e6_return_output);

-- BIN_OP_EQ_uxn_c_l201_c30_bb04
BIN_OP_EQ_uxn_c_l201_c30_bb04 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l201_c30_bb04_left,
BIN_OP_EQ_uxn_c_l201_c30_bb04_right,
BIN_OP_EQ_uxn_c_l201_c30_bb04_return_output);

-- MUX_uxn_c_l201_c30_c5eb
MUX_uxn_c_l201_c30_c5eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l201_c30_c5eb_cond,
MUX_uxn_c_l201_c30_c5eb_iftrue,
MUX_uxn_c_l201_c30_c5eb_iffalse,
MUX_uxn_c_l201_c30_c5eb_return_output);

-- BIN_OP_AND_uxn_c_l203_c6_4351
BIN_OP_AND_uxn_c_l203_c6_4351 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l203_c6_4351_left,
BIN_OP_AND_uxn_c_l203_c6_4351_right,
BIN_OP_AND_uxn_c_l203_c6_4351_return_output);

-- color_MUX_uxn_c_l203_c2_c9ac
color_MUX_uxn_c_l203_c2_c9ac : entity work.MUX_uint1_t_uint12_t_4_uint12_t_4_0CLK_de264c78 port map (
color_MUX_uxn_c_l203_c2_c9ac_cond,
color_MUX_uxn_c_l203_c2_c9ac_iftrue,
color_MUX_uxn_c_l203_c2_c9ac_iffalse,
color_MUX_uxn_c_l203_c2_c9ac_return_output);

-- CONST_SR_4_uxn_c_l206_c35_c39c
CONST_SR_4_uxn_c_l206_c35_c39c : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_c_l206_c35_c39c_x,
CONST_SR_4_uxn_c_l206_c35_c39c_return_output);

-- BIN_OP_EQ_uxn_c_l209_c7_da82
BIN_OP_EQ_uxn_c_l209_c7_da82 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l209_c7_da82_left,
BIN_OP_EQ_uxn_c_l209_c7_da82_right,
BIN_OP_EQ_uxn_c_l209_c7_da82_return_output);

-- color_MUX_uxn_c_l209_c3_6acd
color_MUX_uxn_c_l209_c3_6acd : entity work.MUX_uint1_t_uint12_t_4_uint12_t_4_0CLK_de264c78 port map (
color_MUX_uxn_c_l209_c3_6acd_cond,
color_MUX_uxn_c_l209_c3_6acd_iftrue,
color_MUX_uxn_c_l209_c3_6acd_iffalse,
color_MUX_uxn_c_l209_c3_6acd_return_output);

-- CONST_SL_8_uxn_c_l211_c4_29d1
CONST_SL_8_uxn_c_l211_c4_29d1 : entity work.CONST_SL_8_uint12_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l211_c4_29d1_x,
CONST_SL_8_uxn_c_l211_c4_29d1_return_output);

-- BIN_OP_AND_uxn_c_l212_c4_467b
BIN_OP_AND_uxn_c_l212_c4_467b : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l212_c4_467b_left,
BIN_OP_AND_uxn_c_l212_c4_467b_right,
BIN_OP_AND_uxn_c_l212_c4_467b_return_output);

-- BIN_OP_OR_uxn_c_l213_c4_2ce4
BIN_OP_OR_uxn_c_l213_c4_2ce4 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l213_c4_2ce4_left,
BIN_OP_OR_uxn_c_l213_c4_2ce4_right,
BIN_OP_OR_uxn_c_l213_c4_2ce4_return_output);

-- CONST_SL_8_uxn_c_l216_c4_b726
CONST_SL_8_uxn_c_l216_c4_b726 : entity work.CONST_SL_8_uint12_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l216_c4_b726_x,
CONST_SL_8_uxn_c_l216_c4_b726_return_output);

-- BIN_OP_AND_uxn_c_l217_c4_b190
BIN_OP_AND_uxn_c_l217_c4_b190 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l217_c4_b190_left,
BIN_OP_AND_uxn_c_l217_c4_b190_right,
BIN_OP_AND_uxn_c_l217_c4_b190_return_output);

-- BIN_OP_OR_uxn_c_l218_c4_8062
BIN_OP_OR_uxn_c_l218_c4_8062 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l218_c4_8062_left,
BIN_OP_OR_uxn_c_l218_c4_8062_right,
BIN_OP_OR_uxn_c_l218_c4_8062_return_output);

-- BIN_OP_EQ_uxn_c_l220_c12_7d79
BIN_OP_EQ_uxn_c_l220_c12_7d79 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l220_c12_7d79_left,
BIN_OP_EQ_uxn_c_l220_c12_7d79_right,
BIN_OP_EQ_uxn_c_l220_c12_7d79_return_output);

-- color_MUX_uxn_c_l220_c8_f1eb
color_MUX_uxn_c_l220_c8_f1eb : entity work.MUX_uint1_t_uint12_t_4_uint12_t_4_0CLK_de264c78 port map (
color_MUX_uxn_c_l220_c8_f1eb_cond,
color_MUX_uxn_c_l220_c8_f1eb_iftrue,
color_MUX_uxn_c_l220_c8_f1eb_iffalse,
color_MUX_uxn_c_l220_c8_f1eb_return_output);

-- CONST_SL_8_uxn_c_l222_c4_1755
CONST_SL_8_uxn_c_l222_c4_1755 : entity work.CONST_SL_8_uint12_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l222_c4_1755_x,
CONST_SL_8_uxn_c_l222_c4_1755_return_output);

-- BIN_OP_AND_uxn_c_l223_c4_373b
BIN_OP_AND_uxn_c_l223_c4_373b : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l223_c4_373b_left,
BIN_OP_AND_uxn_c_l223_c4_373b_right,
BIN_OP_AND_uxn_c_l223_c4_373b_return_output);

-- BIN_OP_OR_uxn_c_l224_c4_b751
BIN_OP_OR_uxn_c_l224_c4_b751 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l224_c4_b751_left,
BIN_OP_OR_uxn_c_l224_c4_b751_right,
BIN_OP_OR_uxn_c_l224_c4_b751_return_output);

-- CONST_SL_8_uxn_c_l227_c4_f760
CONST_SL_8_uxn_c_l227_c4_f760 : entity work.CONST_SL_8_uint12_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l227_c4_f760_x,
CONST_SL_8_uxn_c_l227_c4_f760_return_output);

-- BIN_OP_AND_uxn_c_l228_c4_45e5
BIN_OP_AND_uxn_c_l228_c4_45e5 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l228_c4_45e5_left,
BIN_OP_AND_uxn_c_l228_c4_45e5_right,
BIN_OP_AND_uxn_c_l228_c4_45e5_return_output);

-- BIN_OP_OR_uxn_c_l229_c4_80d1
BIN_OP_OR_uxn_c_l229_c4_80d1 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l229_c4_80d1_left,
BIN_OP_OR_uxn_c_l229_c4_80d1_right,
BIN_OP_OR_uxn_c_l229_c4_80d1_return_output);

-- BIN_OP_EQ_uxn_c_l231_c12_fecc
BIN_OP_EQ_uxn_c_l231_c12_fecc : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l231_c12_fecc_left,
BIN_OP_EQ_uxn_c_l231_c12_fecc_right,
BIN_OP_EQ_uxn_c_l231_c12_fecc_return_output);

-- color_MUX_uxn_c_l231_c8_5ad5
color_MUX_uxn_c_l231_c8_5ad5 : entity work.MUX_uint1_t_uint12_t_4_uint12_t_4_0CLK_de264c78 port map (
color_MUX_uxn_c_l231_c8_5ad5_cond,
color_MUX_uxn_c_l231_c8_5ad5_iftrue,
color_MUX_uxn_c_l231_c8_5ad5_iffalse,
color_MUX_uxn_c_l231_c8_5ad5_return_output);

-- CONST_SL_4_uxn_c_l233_c4_2f2c
CONST_SL_4_uxn_c_l233_c4_2f2c : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_c_l233_c4_2f2c_x,
CONST_SL_4_uxn_c_l233_c4_2f2c_return_output);

-- BIN_OP_AND_uxn_c_l234_c4_cec9
BIN_OP_AND_uxn_c_l234_c4_cec9 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l234_c4_cec9_left,
BIN_OP_AND_uxn_c_l234_c4_cec9_right,
BIN_OP_AND_uxn_c_l234_c4_cec9_return_output);

-- BIN_OP_OR_uxn_c_l235_c4_c72d
BIN_OP_OR_uxn_c_l235_c4_c72d : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l235_c4_c72d_left,
BIN_OP_OR_uxn_c_l235_c4_c72d_right,
BIN_OP_OR_uxn_c_l235_c4_c72d_return_output);

-- CONST_SL_4_uxn_c_l238_c4_41e3
CONST_SL_4_uxn_c_l238_c4_41e3 : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_c_l238_c4_41e3_x,
CONST_SL_4_uxn_c_l238_c4_41e3_return_output);

-- BIN_OP_AND_uxn_c_l239_c4_f0d5
BIN_OP_AND_uxn_c_l239_c4_f0d5 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l239_c4_f0d5_left,
BIN_OP_AND_uxn_c_l239_c4_f0d5_right,
BIN_OP_AND_uxn_c_l239_c4_f0d5_return_output);

-- BIN_OP_OR_uxn_c_l240_c4_9f4b
BIN_OP_OR_uxn_c_l240_c4_9f4b : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l240_c4_9f4b_left,
BIN_OP_OR_uxn_c_l240_c4_9f4b_right,
BIN_OP_OR_uxn_c_l240_c4_9f4b_return_output);

-- BIN_OP_EQ_uxn_c_l242_c12_91de
BIN_OP_EQ_uxn_c_l242_c12_91de : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l242_c12_91de_left,
BIN_OP_EQ_uxn_c_l242_c12_91de_right,
BIN_OP_EQ_uxn_c_l242_c12_91de_return_output);

-- color_MUX_uxn_c_l242_c8_d84f
color_MUX_uxn_c_l242_c8_d84f : entity work.MUX_uint1_t_uint12_t_4_uint12_t_4_0CLK_de264c78 port map (
color_MUX_uxn_c_l242_c8_d84f_cond,
color_MUX_uxn_c_l242_c8_d84f_iftrue,
color_MUX_uxn_c_l242_c8_d84f_iffalse,
color_MUX_uxn_c_l242_c8_d84f_return_output);

-- CONST_SL_4_uxn_c_l244_c4_6a7a
CONST_SL_4_uxn_c_l244_c4_6a7a : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_c_l244_c4_6a7a_x,
CONST_SL_4_uxn_c_l244_c4_6a7a_return_output);

-- BIN_OP_AND_uxn_c_l245_c4_c740
BIN_OP_AND_uxn_c_l245_c4_c740 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l245_c4_c740_left,
BIN_OP_AND_uxn_c_l245_c4_c740_right,
BIN_OP_AND_uxn_c_l245_c4_c740_return_output);

-- BIN_OP_OR_uxn_c_l246_c4_44cf
BIN_OP_OR_uxn_c_l246_c4_44cf : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l246_c4_44cf_left,
BIN_OP_OR_uxn_c_l246_c4_44cf_right,
BIN_OP_OR_uxn_c_l246_c4_44cf_return_output);

-- CONST_SL_4_uxn_c_l249_c4_375c
CONST_SL_4_uxn_c_l249_c4_375c : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_c_l249_c4_375c_x,
CONST_SL_4_uxn_c_l249_c4_375c_return_output);

-- BIN_OP_AND_uxn_c_l250_c4_0e27
BIN_OP_AND_uxn_c_l250_c4_0e27 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l250_c4_0e27_left,
BIN_OP_AND_uxn_c_l250_c4_0e27_right,
BIN_OP_AND_uxn_c_l250_c4_0e27_return_output);

-- BIN_OP_OR_uxn_c_l251_c4_ba0c
BIN_OP_OR_uxn_c_l251_c4_ba0c : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l251_c4_ba0c_left,
BIN_OP_OR_uxn_c_l251_c4_ba0c_right,
BIN_OP_OR_uxn_c_l251_c4_ba0c_return_output);

-- BIN_OP_EQ_uxn_c_l253_c12_e528
BIN_OP_EQ_uxn_c_l253_c12_e528 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l253_c12_e528_left,
BIN_OP_EQ_uxn_c_l253_c12_e528_right,
BIN_OP_EQ_uxn_c_l253_c12_e528_return_output);

-- color_MUX_uxn_c_l253_c8_956f
color_MUX_uxn_c_l253_c8_956f : entity work.MUX_uint1_t_uint12_t_4_uint12_t_4_0CLK_de264c78 port map (
color_MUX_uxn_c_l253_c8_956f_cond,
color_MUX_uxn_c_l253_c8_956f_iftrue,
color_MUX_uxn_c_l253_c8_956f_iffalse,
color_MUX_uxn_c_l253_c8_956f_return_output);

-- BIN_OP_AND_uxn_c_l255_c4_f6e6
BIN_OP_AND_uxn_c_l255_c4_f6e6 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l255_c4_f6e6_left,
BIN_OP_AND_uxn_c_l255_c4_f6e6_right,
BIN_OP_AND_uxn_c_l255_c4_f6e6_return_output);

-- BIN_OP_OR_uxn_c_l256_c4_62cf
BIN_OP_OR_uxn_c_l256_c4_62cf : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l256_c4_62cf_left,
BIN_OP_OR_uxn_c_l256_c4_62cf_right,
BIN_OP_OR_uxn_c_l256_c4_62cf_return_output);

-- BIN_OP_AND_uxn_c_l259_c4_2c1e
BIN_OP_AND_uxn_c_l259_c4_2c1e : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l259_c4_2c1e_left,
BIN_OP_AND_uxn_c_l259_c4_2c1e_right,
BIN_OP_AND_uxn_c_l259_c4_2c1e_return_output);

-- BIN_OP_OR_uxn_c_l260_c4_65f1
BIN_OP_OR_uxn_c_l260_c4_65f1 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l260_c4_65f1_left,
BIN_OP_OR_uxn_c_l260_c4_65f1_right,
BIN_OP_OR_uxn_c_l260_c4_65f1_return_output);

-- BIN_OP_EQ_uxn_c_l262_c12_1c66
BIN_OP_EQ_uxn_c_l262_c12_1c66 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l262_c12_1c66_left,
BIN_OP_EQ_uxn_c_l262_c12_1c66_right,
BIN_OP_EQ_uxn_c_l262_c12_1c66_return_output);

-- color_2_MUX_uxn_c_l262_c8_28c9
color_2_MUX_uxn_c_l262_c8_28c9 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color_2_MUX_uxn_c_l262_c8_28c9_cond,
color_2_MUX_uxn_c_l262_c8_28c9_iftrue,
color_2_MUX_uxn_c_l262_c8_28c9_iffalse,
color_2_MUX_uxn_c_l262_c8_28c9_return_output);

-- color_3_MUX_uxn_c_l262_c8_28c9
color_3_MUX_uxn_c_l262_c8_28c9 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color_3_MUX_uxn_c_l262_c8_28c9_cond,
color_3_MUX_uxn_c_l262_c8_28c9_iftrue,
color_3_MUX_uxn_c_l262_c8_28c9_iffalse,
color_3_MUX_uxn_c_l262_c8_28c9_return_output);

-- BIN_OP_AND_uxn_c_l264_c4_461f
BIN_OP_AND_uxn_c_l264_c4_461f : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l264_c4_461f_left,
BIN_OP_AND_uxn_c_l264_c4_461f_right,
BIN_OP_AND_uxn_c_l264_c4_461f_return_output);

-- BIN_OP_OR_uxn_c_l265_c4_5a82
BIN_OP_OR_uxn_c_l265_c4_5a82 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l265_c4_5a82_left,
BIN_OP_OR_uxn_c_l265_c4_5a82_right,
BIN_OP_OR_uxn_c_l265_c4_5a82_return_output);

-- BIN_OP_AND_uxn_c_l268_c4_9879
BIN_OP_AND_uxn_c_l268_c4_9879 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l268_c4_9879_left,
BIN_OP_AND_uxn_c_l268_c4_9879_right,
BIN_OP_AND_uxn_c_l268_c4_9879_return_output);

-- BIN_OP_OR_uxn_c_l269_c4_833e
BIN_OP_OR_uxn_c_l269_c4_833e : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l269_c4_833e_left,
BIN_OP_OR_uxn_c_l269_c4_833e_right,
BIN_OP_OR_uxn_c_l269_c4_833e_return_output);

-- VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l273_c20_fe9f
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l273_c20_fe9f : entity work.VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_0CLK_9e40ec46 port map (
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l273_c20_fe9f_ref_toks_0,
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l273_c20_fe9f_var_dim_0,
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l273_c20_fe9f_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 device_ram_address,
 device_ram_value,
 is_device_ram_write,
 gpu_step_color,
 -- Registers
 color,
 -- All submodule outputs
 CONST_SR_4_uxn_c_l201_c30_f6e6_return_output,
 BIN_OP_EQ_uxn_c_l201_c30_bb04_return_output,
 MUX_uxn_c_l201_c30_c5eb_return_output,
 BIN_OP_AND_uxn_c_l203_c6_4351_return_output,
 color_MUX_uxn_c_l203_c2_c9ac_return_output,
 CONST_SR_4_uxn_c_l206_c35_c39c_return_output,
 BIN_OP_EQ_uxn_c_l209_c7_da82_return_output,
 color_MUX_uxn_c_l209_c3_6acd_return_output,
 CONST_SL_8_uxn_c_l211_c4_29d1_return_output,
 BIN_OP_AND_uxn_c_l212_c4_467b_return_output,
 BIN_OP_OR_uxn_c_l213_c4_2ce4_return_output,
 CONST_SL_8_uxn_c_l216_c4_b726_return_output,
 BIN_OP_AND_uxn_c_l217_c4_b190_return_output,
 BIN_OP_OR_uxn_c_l218_c4_8062_return_output,
 BIN_OP_EQ_uxn_c_l220_c12_7d79_return_output,
 color_MUX_uxn_c_l220_c8_f1eb_return_output,
 CONST_SL_8_uxn_c_l222_c4_1755_return_output,
 BIN_OP_AND_uxn_c_l223_c4_373b_return_output,
 BIN_OP_OR_uxn_c_l224_c4_b751_return_output,
 CONST_SL_8_uxn_c_l227_c4_f760_return_output,
 BIN_OP_AND_uxn_c_l228_c4_45e5_return_output,
 BIN_OP_OR_uxn_c_l229_c4_80d1_return_output,
 BIN_OP_EQ_uxn_c_l231_c12_fecc_return_output,
 color_MUX_uxn_c_l231_c8_5ad5_return_output,
 CONST_SL_4_uxn_c_l233_c4_2f2c_return_output,
 BIN_OP_AND_uxn_c_l234_c4_cec9_return_output,
 BIN_OP_OR_uxn_c_l235_c4_c72d_return_output,
 CONST_SL_4_uxn_c_l238_c4_41e3_return_output,
 BIN_OP_AND_uxn_c_l239_c4_f0d5_return_output,
 BIN_OP_OR_uxn_c_l240_c4_9f4b_return_output,
 BIN_OP_EQ_uxn_c_l242_c12_91de_return_output,
 color_MUX_uxn_c_l242_c8_d84f_return_output,
 CONST_SL_4_uxn_c_l244_c4_6a7a_return_output,
 BIN_OP_AND_uxn_c_l245_c4_c740_return_output,
 BIN_OP_OR_uxn_c_l246_c4_44cf_return_output,
 CONST_SL_4_uxn_c_l249_c4_375c_return_output,
 BIN_OP_AND_uxn_c_l250_c4_0e27_return_output,
 BIN_OP_OR_uxn_c_l251_c4_ba0c_return_output,
 BIN_OP_EQ_uxn_c_l253_c12_e528_return_output,
 color_MUX_uxn_c_l253_c8_956f_return_output,
 BIN_OP_AND_uxn_c_l255_c4_f6e6_return_output,
 BIN_OP_OR_uxn_c_l256_c4_62cf_return_output,
 BIN_OP_AND_uxn_c_l259_c4_2c1e_return_output,
 BIN_OP_OR_uxn_c_l260_c4_65f1_return_output,
 BIN_OP_EQ_uxn_c_l262_c12_1c66_return_output,
 color_2_MUX_uxn_c_l262_c8_28c9_return_output,
 color_3_MUX_uxn_c_l262_c8_28c9_return_output,
 BIN_OP_AND_uxn_c_l264_c4_461f_return_output,
 BIN_OP_OR_uxn_c_l265_c4_5a82_return_output,
 BIN_OP_AND_uxn_c_l268_c4_9879_return_output,
 BIN_OP_OR_uxn_c_l269_c4_833e_return_output,
 VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l273_c20_fe9f_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_device_ram_address : unsigned(7 downto 0);
 variable VAR_device_ram_value : unsigned(7 downto 0);
 variable VAR_is_device_ram_write : unsigned(0 downto 0);
 variable VAR_gpu_step_color : unsigned(1 downto 0);
 variable VAR_is_palette_range : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l201_c30_c5eb_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_4_uxn_c_l201_c30_f6e6_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l201_c30_bb04_left : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_c_l201_c30_f6e6_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l201_c30_bb04_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l201_c30_bb04_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l201_c30_c5eb_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l201_c30_c5eb_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l201_c30_c5eb_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l203_c6_4351_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l203_c6_4351_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l203_c6_4351_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_c_l203_c2_c9ac_iftrue : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l209_c3_6acd_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l203_c2_c9ac_iffalse : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l203_c2_c9ac_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l203_c2_c9ac_cond : unsigned(0 downto 0);
 variable VAR_tmp12 : unsigned(11 downto 0);
 variable VAR_addr_low : unsigned(3 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_c_l205_c22_fa52_return_output : unsigned(3 downto 0);
 variable VAR_color_cmp_0 : unsigned(3 downto 0);
 variable VAR_color_cmp_0_uxn_c_l206_c11_14fa_0 : unsigned(3 downto 0);
 variable VAR_CONST_SR_4_uxn_c_l206_c35_c39c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_c_l206_c35_c39c_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_c_l206_c25_f6ea_return_output : unsigned(3 downto 0);
 variable VAR_color_cmp_1 : unsigned(3 downto 0);
 variable VAR_color_cmp_1_uxn_c_l207_c11_88fd_0 : unsigned(3 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_c_l207_c25_78e8_return_output : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l209_c7_da82_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l209_c7_da82_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l209_c7_da82_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_c_l209_c3_6acd_iftrue : uint12_t_4;
 variable VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l209_c3_6acd_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l209_c3_6acd_iffalse : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l220_c8_f1eb_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l209_c3_6acd_cond : unsigned(0 downto 0);
 variable VAR_tmp12_uxn_c_l210_c4_e354 : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l211_c4_29d1_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l211_c4_29d1_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l212_c4_467b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l212_c4_467b_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l212_c4_467b_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l213_c4_2ce4_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l213_c4_2ce4_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l213_c4_2ce4_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_uxn_c_l215_c4_745a : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l216_c4_b726_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l216_c4_b726_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l217_c4_b190_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l217_c4_b190_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l217_c4_b190_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l218_c4_8062_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l218_c4_8062_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l218_c4_8062_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l220_c12_7d79_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l220_c12_7d79_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l220_c12_7d79_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_c_l220_c8_f1eb_iftrue : uint12_t_4;
 variable VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l220_c8_f1eb_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l220_c8_f1eb_iffalse : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l231_c8_5ad5_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l220_c8_f1eb_cond : unsigned(0 downto 0);
 variable VAR_tmp12_uxn_c_l221_c4_d2e7 : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l222_c4_1755_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l222_c4_1755_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l223_c4_373b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l223_c4_373b_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l223_c4_373b_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l224_c4_b751_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l224_c4_b751_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l224_c4_b751_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_uxn_c_l226_c4_b2ae : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l227_c4_f760_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l227_c4_f760_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l228_c4_45e5_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l228_c4_45e5_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l228_c4_45e5_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l229_c4_80d1_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l229_c4_80d1_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l229_c4_80d1_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l231_c12_fecc_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l231_c12_fecc_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l231_c12_fecc_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_c_l231_c8_5ad5_iftrue : uint12_t_4;
 variable VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l231_c8_5ad5_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l231_c8_5ad5_iffalse : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l242_c8_d84f_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l231_c8_5ad5_cond : unsigned(0 downto 0);
 variable VAR_tmp12_uxn_c_l232_c4_bc64 : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l233_c4_2f2c_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l233_c4_2f2c_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l234_c4_cec9_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l234_c4_cec9_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l234_c4_cec9_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l235_c4_c72d_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l235_c4_c72d_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l235_c4_c72d_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_uxn_c_l237_c4_4ad8 : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l238_c4_41e3_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l238_c4_41e3_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l239_c4_f0d5_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l239_c4_f0d5_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l239_c4_f0d5_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l240_c4_9f4b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l240_c4_9f4b_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l240_c4_9f4b_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l242_c12_91de_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l242_c12_91de_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l242_c12_91de_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_c_l242_c8_d84f_iftrue : uint12_t_4;
 variable VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l242_c8_d84f_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l242_c8_d84f_iffalse : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l253_c8_956f_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l242_c8_d84f_cond : unsigned(0 downto 0);
 variable VAR_tmp12_uxn_c_l243_c4_1728 : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l244_c4_6a7a_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l244_c4_6a7a_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l245_c4_c740_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l245_c4_c740_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l245_c4_c740_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l246_c4_44cf_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l246_c4_44cf_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l246_c4_44cf_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_uxn_c_l248_c4_de01 : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l249_c4_375c_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l249_c4_375c_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l250_c4_0e27_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l250_c4_0e27_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l250_c4_0e27_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l251_c4_ba0c_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l251_c4_ba0c_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l251_c4_ba0c_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l253_c12_e528_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l253_c12_e528_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l253_c12_e528_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_c_l253_c8_956f_iftrue : uint12_t_4;
 variable VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l253_c8_956f_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l253_c8_956f_iffalse : uint12_t_4;
 variable VAR_color_FALSE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l253_c8_956f_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l253_c8_956f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l255_c4_f6e6_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l255_c4_f6e6_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l255_c4_f6e6_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l256_c4_62cf_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l256_c4_62cf_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l256_c4_62cf_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l259_c4_2c1e_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l259_c4_2c1e_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l259_c4_2c1e_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l260_c4_65f1_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l260_c4_65f1_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l260_c4_65f1_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l262_c12_1c66_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l262_c12_1c66_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l262_c12_1c66_return_output : unsigned(0 downto 0);
 variable VAR_color_2_MUX_uxn_c_l262_c8_28c9_iftrue : unsigned(11 downto 0);
 variable VAR_color_2_MUX_uxn_c_l262_c8_28c9_iffalse : unsigned(11 downto 0);
 variable VAR_color_2_MUX_uxn_c_l262_c8_28c9_return_output : unsigned(11 downto 0);
 variable VAR_color_2_MUX_uxn_c_l262_c8_28c9_cond : unsigned(0 downto 0);
 variable VAR_color_3_MUX_uxn_c_l262_c8_28c9_iftrue : unsigned(11 downto 0);
 variable VAR_color_3_MUX_uxn_c_l262_c8_28c9_iffalse : unsigned(11 downto 0);
 variable VAR_color_3_MUX_uxn_c_l262_c8_28c9_return_output : unsigned(11 downto 0);
 variable VAR_color_3_MUX_uxn_c_l262_c8_28c9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l264_c4_461f_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l264_c4_461f_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l264_c4_461f_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l265_c4_5a82_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l265_c4_5a82_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l265_c4_5a82_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l268_c4_9879_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l268_c4_9879_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l268_c4_9879_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l269_c4_833e_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l269_c4_833e_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l269_c4_833e_return_output : unsigned(11 downto 0);
 variable VAR_result : unsigned(15 downto 0);
 variable VAR_result_uxn_c_l273_c11_97fb_0 : unsigned(15 downto 0);
 variable VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l273_c20_fe9f_var_dim_0 : unsigned(1 downto 0);
 variable VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l273_c20_fe9f_return_output : unsigned(11 downto 0);
 variable VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l273_c20_fe9f_ref_toks_0 : uint12_t_4;
 variable VAR_CONST_REF_RD_uint12_t_uint12_t_4_0_d41d_uxn_c_l212_l234_l255_DUPLICATE_fc55_return_output : unsigned(11 downto 0);
 variable VAR_CONST_REF_RD_uint12_t_uint12_t_4_1_d41d_uxn_c_l259_l239_l217_DUPLICATE_e3d5_return_output : unsigned(11 downto 0);
 variable VAR_CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_uxn_c_l245_l264_l262_l223_DUPLICATE_d074_return_output : unsigned(11 downto 0);
 variable VAR_CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_uxn_c_l268_l262_l228_l250_DUPLICATE_3819_return_output : unsigned(11 downto 0);
 variable VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l263_l254_DUPLICATE_1cc0_return_output : unsigned(11 downto 0);
 variable VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l267_l258_DUPLICATE_e85a_return_output : unsigned(11 downto 0);
 -- State registers comb logic variables
variable REG_VAR_color : uint12_t_4;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_color := color;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_c_l209_c7_da82_right := to_unsigned(8, 4);
     VAR_BIN_OP_AND_uxn_c_l268_c4_9879_right := to_unsigned(4080, 12);
     VAR_BIN_OP_AND_uxn_c_l264_c4_461f_right := to_unsigned(4080, 12);
     VAR_BIN_OP_EQ_uxn_c_l201_c30_bb04_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l253_c12_e528_right := to_unsigned(12, 4);
     VAR_BIN_OP_AND_uxn_c_l255_c4_f6e6_right := to_unsigned(4080, 12);
     VAR_BIN_OP_EQ_uxn_c_l231_c12_fecc_right := to_unsigned(10, 4);
     VAR_BIN_OP_AND_uxn_c_l217_c4_b190_right := to_unsigned(255, 12);
     VAR_MUX_uxn_c_l201_c30_c5eb_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_c_l259_c4_2c1e_right := to_unsigned(4080, 12);
     VAR_BIN_OP_AND_uxn_c_l245_c4_c740_right := to_unsigned(3855, 12);
     VAR_BIN_OP_AND_uxn_c_l223_c4_373b_right := to_unsigned(255, 12);
     VAR_BIN_OP_AND_uxn_c_l239_c4_f0d5_right := to_unsigned(3855, 12);
     VAR_BIN_OP_AND_uxn_c_l234_c4_cec9_right := to_unsigned(3855, 12);
     VAR_BIN_OP_EQ_uxn_c_l220_c12_7d79_right := to_unsigned(9, 4);
     VAR_BIN_OP_AND_uxn_c_l250_c4_0e27_right := to_unsigned(3855, 12);
     VAR_MUX_uxn_c_l201_c30_c5eb_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_c_l228_c4_45e5_right := to_unsigned(255, 12);
     VAR_BIN_OP_EQ_uxn_c_l262_c12_1c66_right := to_unsigned(13, 4);
     VAR_BIN_OP_EQ_uxn_c_l242_c12_91de_right := to_unsigned(11, 4);
     VAR_BIN_OP_AND_uxn_c_l212_c4_467b_right := to_unsigned(255, 12);

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
     VAR_color_MUX_uxn_c_l203_c2_c9ac_iffalse := color;
     VAR_CONST_SR_4_uxn_c_l201_c30_f6e6_x := VAR_device_ram_address;
     VAR_CONST_SR_4_uxn_c_l206_c35_c39c_x := VAR_device_ram_value;
     VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l273_c20_fe9f_var_dim_0 := VAR_gpu_step_color;
     VAR_BIN_OP_AND_uxn_c_l203_c6_4351_left := VAR_is_device_ram_write;
     -- CONST_SR_4[uxn_c_l206_c35_c39c] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_c_l206_c35_c39c_x <= VAR_CONST_SR_4_uxn_c_l206_c35_c39c_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_c_l206_c35_c39c_return_output := CONST_SR_4_uxn_c_l206_c35_c39c_return_output;

     -- CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_uxn_c_l268_l262_l228_l250_DUPLICATE_3819 LATENCY=0
     VAR_CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_uxn_c_l268_l262_l228_l250_DUPLICATE_3819_return_output := color(3);

     -- CAST_TO_uint4_t[uxn_c_l207_c25_78e8] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_c_l207_c25_78e8_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_device_ram_value);

     -- CONST_SR_4[uxn_c_l201_c30_f6e6] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_c_l201_c30_f6e6_x <= VAR_CONST_SR_4_uxn_c_l201_c30_f6e6_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_c_l201_c30_f6e6_return_output := CONST_SR_4_uxn_c_l201_c30_f6e6_return_output;

     -- CONST_REF_RD_uint12_t_uint12_t_4_1_d41d_uxn_c_l259_l239_l217_DUPLICATE_e3d5 LATENCY=0
     VAR_CONST_REF_RD_uint12_t_uint12_t_4_1_d41d_uxn_c_l259_l239_l217_DUPLICATE_e3d5_return_output := color(1);

     -- CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_uxn_c_l245_l264_l262_l223_DUPLICATE_d074 LATENCY=0
     VAR_CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_uxn_c_l245_l264_l262_l223_DUPLICATE_d074_return_output := color(2);

     -- CONST_REF_RD_uint12_t_uint12_t_4_0_d41d_uxn_c_l212_l234_l255_DUPLICATE_fc55 LATENCY=0
     VAR_CONST_REF_RD_uint12_t_uint12_t_4_0_d41d_uxn_c_l212_l234_l255_DUPLICATE_fc55_return_output := color(0);

     -- CAST_TO_uint4_t[uxn_c_l205_c22_fa52] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_c_l205_c22_fa52_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_device_ram_address);

     -- Submodule level 1
     VAR_BIN_OP_EQ_uxn_c_l209_c7_da82_left := VAR_CAST_TO_uint4_t_uxn_c_l205_c22_fa52_return_output;
     VAR_BIN_OP_EQ_uxn_c_l220_c12_7d79_left := VAR_CAST_TO_uint4_t_uxn_c_l205_c22_fa52_return_output;
     VAR_BIN_OP_EQ_uxn_c_l231_c12_fecc_left := VAR_CAST_TO_uint4_t_uxn_c_l205_c22_fa52_return_output;
     VAR_BIN_OP_EQ_uxn_c_l242_c12_91de_left := VAR_CAST_TO_uint4_t_uxn_c_l205_c22_fa52_return_output;
     VAR_BIN_OP_EQ_uxn_c_l253_c12_e528_left := VAR_CAST_TO_uint4_t_uxn_c_l205_c22_fa52_return_output;
     VAR_BIN_OP_EQ_uxn_c_l262_c12_1c66_left := VAR_CAST_TO_uint4_t_uxn_c_l205_c22_fa52_return_output;
     VAR_color_cmp_1_uxn_c_l207_c11_88fd_0 := VAR_CAST_TO_uint4_t_uxn_c_l207_c25_78e8_return_output;
     VAR_BIN_OP_AND_uxn_c_l212_c4_467b_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_0_d41d_uxn_c_l212_l234_l255_DUPLICATE_fc55_return_output;
     VAR_BIN_OP_AND_uxn_c_l234_c4_cec9_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_0_d41d_uxn_c_l212_l234_l255_DUPLICATE_fc55_return_output;
     VAR_BIN_OP_AND_uxn_c_l255_c4_f6e6_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_0_d41d_uxn_c_l212_l234_l255_DUPLICATE_fc55_return_output;
     VAR_BIN_OP_AND_uxn_c_l217_c4_b190_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_1_d41d_uxn_c_l259_l239_l217_DUPLICATE_e3d5_return_output;
     VAR_BIN_OP_AND_uxn_c_l239_c4_f0d5_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_1_d41d_uxn_c_l259_l239_l217_DUPLICATE_e3d5_return_output;
     VAR_BIN_OP_AND_uxn_c_l259_c4_2c1e_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_1_d41d_uxn_c_l259_l239_l217_DUPLICATE_e3d5_return_output;
     VAR_BIN_OP_AND_uxn_c_l223_c4_373b_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_uxn_c_l245_l264_l262_l223_DUPLICATE_d074_return_output;
     VAR_BIN_OP_AND_uxn_c_l245_c4_c740_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_uxn_c_l245_l264_l262_l223_DUPLICATE_d074_return_output;
     VAR_BIN_OP_AND_uxn_c_l264_c4_461f_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_uxn_c_l245_l264_l262_l223_DUPLICATE_d074_return_output;
     VAR_color_2_MUX_uxn_c_l262_c8_28c9_iffalse := VAR_CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_uxn_c_l245_l264_l262_l223_DUPLICATE_d074_return_output;
     VAR_BIN_OP_AND_uxn_c_l228_c4_45e5_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_uxn_c_l268_l262_l228_l250_DUPLICATE_3819_return_output;
     VAR_BIN_OP_AND_uxn_c_l250_c4_0e27_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_uxn_c_l268_l262_l228_l250_DUPLICATE_3819_return_output;
     VAR_BIN_OP_AND_uxn_c_l268_c4_9879_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_uxn_c_l268_l262_l228_l250_DUPLICATE_3819_return_output;
     VAR_color_3_MUX_uxn_c_l262_c8_28c9_iffalse := VAR_CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_uxn_c_l268_l262_l228_l250_DUPLICATE_3819_return_output;
     VAR_BIN_OP_EQ_uxn_c_l201_c30_bb04_left := VAR_CONST_SR_4_uxn_c_l201_c30_f6e6_return_output;
     VAR_tmp12_uxn_c_l215_c4_745a := resize(VAR_color_cmp_1_uxn_c_l207_c11_88fd_0, 12);
     VAR_tmp12_uxn_c_l226_c4_b2ae := resize(VAR_color_cmp_1_uxn_c_l207_c11_88fd_0, 12);
     VAR_tmp12_uxn_c_l237_c4_4ad8 := resize(VAR_color_cmp_1_uxn_c_l207_c11_88fd_0, 12);
     VAR_tmp12_uxn_c_l248_c4_de01 := resize(VAR_color_cmp_1_uxn_c_l207_c11_88fd_0, 12);
     VAR_CONST_SL_8_uxn_c_l216_c4_b726_x := VAR_tmp12_uxn_c_l215_c4_745a;
     VAR_CONST_SL_8_uxn_c_l227_c4_f760_x := VAR_tmp12_uxn_c_l226_c4_b2ae;
     VAR_CONST_SL_4_uxn_c_l238_c4_41e3_x := VAR_tmp12_uxn_c_l237_c4_4ad8;
     VAR_CONST_SL_4_uxn_c_l249_c4_375c_x := VAR_tmp12_uxn_c_l248_c4_de01;
     -- BIN_OP_AND[uxn_c_l239_c4_f0d5] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l239_c4_f0d5_left <= VAR_BIN_OP_AND_uxn_c_l239_c4_f0d5_left;
     BIN_OP_AND_uxn_c_l239_c4_f0d5_right <= VAR_BIN_OP_AND_uxn_c_l239_c4_f0d5_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l239_c4_f0d5_return_output := BIN_OP_AND_uxn_c_l239_c4_f0d5_return_output;

     -- BIN_OP_AND[uxn_c_l250_c4_0e27] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l250_c4_0e27_left <= VAR_BIN_OP_AND_uxn_c_l250_c4_0e27_left;
     BIN_OP_AND_uxn_c_l250_c4_0e27_right <= VAR_BIN_OP_AND_uxn_c_l250_c4_0e27_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l250_c4_0e27_return_output := BIN_OP_AND_uxn_c_l250_c4_0e27_return_output;

     -- BIN_OP_AND[uxn_c_l217_c4_b190] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l217_c4_b190_left <= VAR_BIN_OP_AND_uxn_c_l217_c4_b190_left;
     BIN_OP_AND_uxn_c_l217_c4_b190_right <= VAR_BIN_OP_AND_uxn_c_l217_c4_b190_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l217_c4_b190_return_output := BIN_OP_AND_uxn_c_l217_c4_b190_return_output;

     -- CONST_SL_4[uxn_c_l238_c4_41e3] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_c_l238_c4_41e3_x <= VAR_CONST_SL_4_uxn_c_l238_c4_41e3_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_c_l238_c4_41e3_return_output := CONST_SL_4_uxn_c_l238_c4_41e3_return_output;

     -- BIN_OP_AND[uxn_c_l268_c4_9879] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l268_c4_9879_left <= VAR_BIN_OP_AND_uxn_c_l268_c4_9879_left;
     BIN_OP_AND_uxn_c_l268_c4_9879_right <= VAR_BIN_OP_AND_uxn_c_l268_c4_9879_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l268_c4_9879_return_output := BIN_OP_AND_uxn_c_l268_c4_9879_return_output;

     -- BIN_OP_EQ[uxn_c_l201_c30_bb04] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l201_c30_bb04_left <= VAR_BIN_OP_EQ_uxn_c_l201_c30_bb04_left;
     BIN_OP_EQ_uxn_c_l201_c30_bb04_right <= VAR_BIN_OP_EQ_uxn_c_l201_c30_bb04_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l201_c30_bb04_return_output := BIN_OP_EQ_uxn_c_l201_c30_bb04_return_output;

     -- CONST_SL_4[uxn_c_l249_c4_375c] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_c_l249_c4_375c_x <= VAR_CONST_SL_4_uxn_c_l249_c4_375c_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_c_l249_c4_375c_return_output := CONST_SL_4_uxn_c_l249_c4_375c_return_output;

     -- BIN_OP_AND[uxn_c_l223_c4_373b] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l223_c4_373b_left <= VAR_BIN_OP_AND_uxn_c_l223_c4_373b_left;
     BIN_OP_AND_uxn_c_l223_c4_373b_right <= VAR_BIN_OP_AND_uxn_c_l223_c4_373b_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l223_c4_373b_return_output := BIN_OP_AND_uxn_c_l223_c4_373b_return_output;

     -- BIN_OP_AND[uxn_c_l259_c4_2c1e] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l259_c4_2c1e_left <= VAR_BIN_OP_AND_uxn_c_l259_c4_2c1e_left;
     BIN_OP_AND_uxn_c_l259_c4_2c1e_right <= VAR_BIN_OP_AND_uxn_c_l259_c4_2c1e_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l259_c4_2c1e_return_output := BIN_OP_AND_uxn_c_l259_c4_2c1e_return_output;

     -- BIN_OP_EQ[uxn_c_l262_c12_1c66] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l262_c12_1c66_left <= VAR_BIN_OP_EQ_uxn_c_l262_c12_1c66_left;
     BIN_OP_EQ_uxn_c_l262_c12_1c66_right <= VAR_BIN_OP_EQ_uxn_c_l262_c12_1c66_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l262_c12_1c66_return_output := BIN_OP_EQ_uxn_c_l262_c12_1c66_return_output;

     -- BIN_OP_AND[uxn_c_l228_c4_45e5] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l228_c4_45e5_left <= VAR_BIN_OP_AND_uxn_c_l228_c4_45e5_left;
     BIN_OP_AND_uxn_c_l228_c4_45e5_right <= VAR_BIN_OP_AND_uxn_c_l228_c4_45e5_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l228_c4_45e5_return_output := BIN_OP_AND_uxn_c_l228_c4_45e5_return_output;

     -- BIN_OP_AND[uxn_c_l264_c4_461f] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l264_c4_461f_left <= VAR_BIN_OP_AND_uxn_c_l264_c4_461f_left;
     BIN_OP_AND_uxn_c_l264_c4_461f_right <= VAR_BIN_OP_AND_uxn_c_l264_c4_461f_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l264_c4_461f_return_output := BIN_OP_AND_uxn_c_l264_c4_461f_return_output;

     -- CAST_TO_uint12_t_uint4_t_uxn_c_l267_l258_DUPLICATE_e85a LATENCY=0
     VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l267_l258_DUPLICATE_e85a_return_output := CAST_TO_uint12_t_uint4_t(
     VAR_color_cmp_1_uxn_c_l207_c11_88fd_0);

     -- CAST_TO_uint4_t[uxn_c_l206_c25_f6ea] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_c_l206_c25_f6ea_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_CONST_SR_4_uxn_c_l206_c35_c39c_return_output);

     -- BIN_OP_EQ[uxn_c_l220_c12_7d79] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l220_c12_7d79_left <= VAR_BIN_OP_EQ_uxn_c_l220_c12_7d79_left;
     BIN_OP_EQ_uxn_c_l220_c12_7d79_right <= VAR_BIN_OP_EQ_uxn_c_l220_c12_7d79_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l220_c12_7d79_return_output := BIN_OP_EQ_uxn_c_l220_c12_7d79_return_output;

     -- BIN_OP_AND[uxn_c_l234_c4_cec9] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l234_c4_cec9_left <= VAR_BIN_OP_AND_uxn_c_l234_c4_cec9_left;
     BIN_OP_AND_uxn_c_l234_c4_cec9_right <= VAR_BIN_OP_AND_uxn_c_l234_c4_cec9_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l234_c4_cec9_return_output := BIN_OP_AND_uxn_c_l234_c4_cec9_return_output;

     -- CONST_SL_8[uxn_c_l216_c4_b726] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l216_c4_b726_x <= VAR_CONST_SL_8_uxn_c_l216_c4_b726_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l216_c4_b726_return_output := CONST_SL_8_uxn_c_l216_c4_b726_return_output;

     -- BIN_OP_EQ[uxn_c_l242_c12_91de] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l242_c12_91de_left <= VAR_BIN_OP_EQ_uxn_c_l242_c12_91de_left;
     BIN_OP_EQ_uxn_c_l242_c12_91de_right <= VAR_BIN_OP_EQ_uxn_c_l242_c12_91de_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l242_c12_91de_return_output := BIN_OP_EQ_uxn_c_l242_c12_91de_return_output;

     -- BIN_OP_AND[uxn_c_l255_c4_f6e6] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l255_c4_f6e6_left <= VAR_BIN_OP_AND_uxn_c_l255_c4_f6e6_left;
     BIN_OP_AND_uxn_c_l255_c4_f6e6_right <= VAR_BIN_OP_AND_uxn_c_l255_c4_f6e6_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l255_c4_f6e6_return_output := BIN_OP_AND_uxn_c_l255_c4_f6e6_return_output;

     -- BIN_OP_AND[uxn_c_l212_c4_467b] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l212_c4_467b_left <= VAR_BIN_OP_AND_uxn_c_l212_c4_467b_left;
     BIN_OP_AND_uxn_c_l212_c4_467b_right <= VAR_BIN_OP_AND_uxn_c_l212_c4_467b_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l212_c4_467b_return_output := BIN_OP_AND_uxn_c_l212_c4_467b_return_output;

     -- CONST_SL_8[uxn_c_l227_c4_f760] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l227_c4_f760_x <= VAR_CONST_SL_8_uxn_c_l227_c4_f760_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l227_c4_f760_return_output := CONST_SL_8_uxn_c_l227_c4_f760_return_output;

     -- BIN_OP_EQ[uxn_c_l253_c12_e528] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l253_c12_e528_left <= VAR_BIN_OP_EQ_uxn_c_l253_c12_e528_left;
     BIN_OP_EQ_uxn_c_l253_c12_e528_right <= VAR_BIN_OP_EQ_uxn_c_l253_c12_e528_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l253_c12_e528_return_output := BIN_OP_EQ_uxn_c_l253_c12_e528_return_output;

     -- BIN_OP_EQ[uxn_c_l209_c7_da82] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l209_c7_da82_left <= VAR_BIN_OP_EQ_uxn_c_l209_c7_da82_left;
     BIN_OP_EQ_uxn_c_l209_c7_da82_right <= VAR_BIN_OP_EQ_uxn_c_l209_c7_da82_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l209_c7_da82_return_output := BIN_OP_EQ_uxn_c_l209_c7_da82_return_output;

     -- BIN_OP_EQ[uxn_c_l231_c12_fecc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l231_c12_fecc_left <= VAR_BIN_OP_EQ_uxn_c_l231_c12_fecc_left;
     BIN_OP_EQ_uxn_c_l231_c12_fecc_right <= VAR_BIN_OP_EQ_uxn_c_l231_c12_fecc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l231_c12_fecc_return_output := BIN_OP_EQ_uxn_c_l231_c12_fecc_return_output;

     -- BIN_OP_AND[uxn_c_l245_c4_c740] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l245_c4_c740_left <= VAR_BIN_OP_AND_uxn_c_l245_c4_c740_left;
     BIN_OP_AND_uxn_c_l245_c4_c740_right <= VAR_BIN_OP_AND_uxn_c_l245_c4_c740_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l245_c4_c740_return_output := BIN_OP_AND_uxn_c_l245_c4_c740_return_output;

     -- Submodule level 2
     VAR_BIN_OP_OR_uxn_c_l213_c4_2ce4_left := VAR_BIN_OP_AND_uxn_c_l212_c4_467b_return_output;
     VAR_BIN_OP_OR_uxn_c_l218_c4_8062_left := VAR_BIN_OP_AND_uxn_c_l217_c4_b190_return_output;
     VAR_BIN_OP_OR_uxn_c_l224_c4_b751_left := VAR_BIN_OP_AND_uxn_c_l223_c4_373b_return_output;
     VAR_BIN_OP_OR_uxn_c_l229_c4_80d1_left := VAR_BIN_OP_AND_uxn_c_l228_c4_45e5_return_output;
     VAR_BIN_OP_OR_uxn_c_l235_c4_c72d_left := VAR_BIN_OP_AND_uxn_c_l234_c4_cec9_return_output;
     VAR_BIN_OP_OR_uxn_c_l240_c4_9f4b_left := VAR_BIN_OP_AND_uxn_c_l239_c4_f0d5_return_output;
     VAR_BIN_OP_OR_uxn_c_l246_c4_44cf_left := VAR_BIN_OP_AND_uxn_c_l245_c4_c740_return_output;
     VAR_BIN_OP_OR_uxn_c_l251_c4_ba0c_left := VAR_BIN_OP_AND_uxn_c_l250_c4_0e27_return_output;
     VAR_BIN_OP_OR_uxn_c_l256_c4_62cf_left := VAR_BIN_OP_AND_uxn_c_l255_c4_f6e6_return_output;
     VAR_BIN_OP_OR_uxn_c_l260_c4_65f1_left := VAR_BIN_OP_AND_uxn_c_l259_c4_2c1e_return_output;
     VAR_BIN_OP_OR_uxn_c_l265_c4_5a82_left := VAR_BIN_OP_AND_uxn_c_l264_c4_461f_return_output;
     VAR_BIN_OP_OR_uxn_c_l269_c4_833e_left := VAR_BIN_OP_AND_uxn_c_l268_c4_9879_return_output;
     VAR_MUX_uxn_c_l201_c30_c5eb_cond := VAR_BIN_OP_EQ_uxn_c_l201_c30_bb04_return_output;
     VAR_color_MUX_uxn_c_l209_c3_6acd_cond := VAR_BIN_OP_EQ_uxn_c_l209_c7_da82_return_output;
     VAR_color_MUX_uxn_c_l220_c8_f1eb_cond := VAR_BIN_OP_EQ_uxn_c_l220_c12_7d79_return_output;
     VAR_color_MUX_uxn_c_l231_c8_5ad5_cond := VAR_BIN_OP_EQ_uxn_c_l231_c12_fecc_return_output;
     VAR_color_MUX_uxn_c_l242_c8_d84f_cond := VAR_BIN_OP_EQ_uxn_c_l242_c12_91de_return_output;
     VAR_color_MUX_uxn_c_l253_c8_956f_cond := VAR_BIN_OP_EQ_uxn_c_l253_c12_e528_return_output;
     VAR_color_2_MUX_uxn_c_l262_c8_28c9_cond := VAR_BIN_OP_EQ_uxn_c_l262_c12_1c66_return_output;
     VAR_color_3_MUX_uxn_c_l262_c8_28c9_cond := VAR_BIN_OP_EQ_uxn_c_l262_c12_1c66_return_output;
     VAR_BIN_OP_OR_uxn_c_l260_c4_65f1_right := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l267_l258_DUPLICATE_e85a_return_output;
     VAR_BIN_OP_OR_uxn_c_l269_c4_833e_right := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l267_l258_DUPLICATE_e85a_return_output;
     VAR_color_cmp_0_uxn_c_l206_c11_14fa_0 := VAR_CAST_TO_uint4_t_uxn_c_l206_c25_f6ea_return_output;
     VAR_BIN_OP_OR_uxn_c_l240_c4_9f4b_right := VAR_CONST_SL_4_uxn_c_l238_c4_41e3_return_output;
     VAR_BIN_OP_OR_uxn_c_l251_c4_ba0c_right := VAR_CONST_SL_4_uxn_c_l249_c4_375c_return_output;
     VAR_BIN_OP_OR_uxn_c_l218_c4_8062_right := VAR_CONST_SL_8_uxn_c_l216_c4_b726_return_output;
     VAR_BIN_OP_OR_uxn_c_l229_c4_80d1_right := VAR_CONST_SL_8_uxn_c_l227_c4_f760_return_output;
     VAR_tmp12_uxn_c_l210_c4_e354 := resize(VAR_color_cmp_0_uxn_c_l206_c11_14fa_0, 12);
     VAR_tmp12_uxn_c_l221_c4_d2e7 := resize(VAR_color_cmp_0_uxn_c_l206_c11_14fa_0, 12);
     VAR_tmp12_uxn_c_l232_c4_bc64 := resize(VAR_color_cmp_0_uxn_c_l206_c11_14fa_0, 12);
     VAR_tmp12_uxn_c_l243_c4_1728 := resize(VAR_color_cmp_0_uxn_c_l206_c11_14fa_0, 12);
     VAR_CONST_SL_8_uxn_c_l211_c4_29d1_x := VAR_tmp12_uxn_c_l210_c4_e354;
     VAR_CONST_SL_8_uxn_c_l222_c4_1755_x := VAR_tmp12_uxn_c_l221_c4_d2e7;
     VAR_CONST_SL_4_uxn_c_l233_c4_2f2c_x := VAR_tmp12_uxn_c_l232_c4_bc64;
     VAR_CONST_SL_4_uxn_c_l244_c4_6a7a_x := VAR_tmp12_uxn_c_l243_c4_1728;
     -- BIN_OP_OR[uxn_c_l218_c4_8062] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l218_c4_8062_left <= VAR_BIN_OP_OR_uxn_c_l218_c4_8062_left;
     BIN_OP_OR_uxn_c_l218_c4_8062_right <= VAR_BIN_OP_OR_uxn_c_l218_c4_8062_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l218_c4_8062_return_output := BIN_OP_OR_uxn_c_l218_c4_8062_return_output;

     -- MUX[uxn_c_l201_c30_c5eb] LATENCY=0
     -- Inputs
     MUX_uxn_c_l201_c30_c5eb_cond <= VAR_MUX_uxn_c_l201_c30_c5eb_cond;
     MUX_uxn_c_l201_c30_c5eb_iftrue <= VAR_MUX_uxn_c_l201_c30_c5eb_iftrue;
     MUX_uxn_c_l201_c30_c5eb_iffalse <= VAR_MUX_uxn_c_l201_c30_c5eb_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l201_c30_c5eb_return_output := MUX_uxn_c_l201_c30_c5eb_return_output;

     -- CONST_SL_8[uxn_c_l211_c4_29d1] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l211_c4_29d1_x <= VAR_CONST_SL_8_uxn_c_l211_c4_29d1_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l211_c4_29d1_return_output := CONST_SL_8_uxn_c_l211_c4_29d1_return_output;

     -- CONST_SL_4[uxn_c_l244_c4_6a7a] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_c_l244_c4_6a7a_x <= VAR_CONST_SL_4_uxn_c_l244_c4_6a7a_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_c_l244_c4_6a7a_return_output := CONST_SL_4_uxn_c_l244_c4_6a7a_return_output;

     -- BIN_OP_OR[uxn_c_l269_c4_833e] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l269_c4_833e_left <= VAR_BIN_OP_OR_uxn_c_l269_c4_833e_left;
     BIN_OP_OR_uxn_c_l269_c4_833e_right <= VAR_BIN_OP_OR_uxn_c_l269_c4_833e_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l269_c4_833e_return_output := BIN_OP_OR_uxn_c_l269_c4_833e_return_output;

     -- BIN_OP_OR[uxn_c_l251_c4_ba0c] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l251_c4_ba0c_left <= VAR_BIN_OP_OR_uxn_c_l251_c4_ba0c_left;
     BIN_OP_OR_uxn_c_l251_c4_ba0c_right <= VAR_BIN_OP_OR_uxn_c_l251_c4_ba0c_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l251_c4_ba0c_return_output := BIN_OP_OR_uxn_c_l251_c4_ba0c_return_output;

     -- CAST_TO_uint12_t_uint4_t_uxn_c_l263_l254_DUPLICATE_1cc0 LATENCY=0
     VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l263_l254_DUPLICATE_1cc0_return_output := CAST_TO_uint12_t_uint4_t(
     VAR_color_cmp_0_uxn_c_l206_c11_14fa_0);

     -- CONST_SL_4[uxn_c_l233_c4_2f2c] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_c_l233_c4_2f2c_x <= VAR_CONST_SL_4_uxn_c_l233_c4_2f2c_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_c_l233_c4_2f2c_return_output := CONST_SL_4_uxn_c_l233_c4_2f2c_return_output;

     -- BIN_OP_OR[uxn_c_l260_c4_65f1] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l260_c4_65f1_left <= VAR_BIN_OP_OR_uxn_c_l260_c4_65f1_left;
     BIN_OP_OR_uxn_c_l260_c4_65f1_right <= VAR_BIN_OP_OR_uxn_c_l260_c4_65f1_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l260_c4_65f1_return_output := BIN_OP_OR_uxn_c_l260_c4_65f1_return_output;

     -- BIN_OP_OR[uxn_c_l240_c4_9f4b] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l240_c4_9f4b_left <= VAR_BIN_OP_OR_uxn_c_l240_c4_9f4b_left;
     BIN_OP_OR_uxn_c_l240_c4_9f4b_right <= VAR_BIN_OP_OR_uxn_c_l240_c4_9f4b_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l240_c4_9f4b_return_output := BIN_OP_OR_uxn_c_l240_c4_9f4b_return_output;

     -- BIN_OP_OR[uxn_c_l229_c4_80d1] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l229_c4_80d1_left <= VAR_BIN_OP_OR_uxn_c_l229_c4_80d1_left;
     BIN_OP_OR_uxn_c_l229_c4_80d1_right <= VAR_BIN_OP_OR_uxn_c_l229_c4_80d1_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l229_c4_80d1_return_output := BIN_OP_OR_uxn_c_l229_c4_80d1_return_output;

     -- CONST_SL_8[uxn_c_l222_c4_1755] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l222_c4_1755_x <= VAR_CONST_SL_8_uxn_c_l222_c4_1755_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l222_c4_1755_return_output := CONST_SL_8_uxn_c_l222_c4_1755_return_output;

     -- Submodule level 3
     VAR_color_3_MUX_uxn_c_l262_c8_28c9_iftrue := VAR_BIN_OP_OR_uxn_c_l269_c4_833e_return_output;
     VAR_BIN_OP_OR_uxn_c_l256_c4_62cf_right := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l263_l254_DUPLICATE_1cc0_return_output;
     VAR_BIN_OP_OR_uxn_c_l265_c4_5a82_right := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l263_l254_DUPLICATE_1cc0_return_output;
     VAR_BIN_OP_OR_uxn_c_l235_c4_c72d_right := VAR_CONST_SL_4_uxn_c_l233_c4_2f2c_return_output;
     VAR_BIN_OP_OR_uxn_c_l246_c4_44cf_right := VAR_CONST_SL_4_uxn_c_l244_c4_6a7a_return_output;
     VAR_BIN_OP_OR_uxn_c_l213_c4_2ce4_right := VAR_CONST_SL_8_uxn_c_l211_c4_29d1_return_output;
     VAR_BIN_OP_OR_uxn_c_l224_c4_b751_right := VAR_CONST_SL_8_uxn_c_l222_c4_1755_return_output;
     VAR_BIN_OP_AND_uxn_c_l203_c6_4351_right := VAR_MUX_uxn_c_l201_c30_c5eb_return_output;
     -- color_3_MUX[uxn_c_l262_c8_28c9] LATENCY=0
     -- Inputs
     color_3_MUX_uxn_c_l262_c8_28c9_cond <= VAR_color_3_MUX_uxn_c_l262_c8_28c9_cond;
     color_3_MUX_uxn_c_l262_c8_28c9_iftrue <= VAR_color_3_MUX_uxn_c_l262_c8_28c9_iftrue;
     color_3_MUX_uxn_c_l262_c8_28c9_iffalse <= VAR_color_3_MUX_uxn_c_l262_c8_28c9_iffalse;
     -- Outputs
     VAR_color_3_MUX_uxn_c_l262_c8_28c9_return_output := color_3_MUX_uxn_c_l262_c8_28c9_return_output;

     -- BIN_OP_OR[uxn_c_l235_c4_c72d] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l235_c4_c72d_left <= VAR_BIN_OP_OR_uxn_c_l235_c4_c72d_left;
     BIN_OP_OR_uxn_c_l235_c4_c72d_right <= VAR_BIN_OP_OR_uxn_c_l235_c4_c72d_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l235_c4_c72d_return_output := BIN_OP_OR_uxn_c_l235_c4_c72d_return_output;

     -- BIN_OP_OR[uxn_c_l224_c4_b751] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l224_c4_b751_left <= VAR_BIN_OP_OR_uxn_c_l224_c4_b751_left;
     BIN_OP_OR_uxn_c_l224_c4_b751_right <= VAR_BIN_OP_OR_uxn_c_l224_c4_b751_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l224_c4_b751_return_output := BIN_OP_OR_uxn_c_l224_c4_b751_return_output;

     -- BIN_OP_OR[uxn_c_l246_c4_44cf] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l246_c4_44cf_left <= VAR_BIN_OP_OR_uxn_c_l246_c4_44cf_left;
     BIN_OP_OR_uxn_c_l246_c4_44cf_right <= VAR_BIN_OP_OR_uxn_c_l246_c4_44cf_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l246_c4_44cf_return_output := BIN_OP_OR_uxn_c_l246_c4_44cf_return_output;

     -- BIN_OP_OR[uxn_c_l265_c4_5a82] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l265_c4_5a82_left <= VAR_BIN_OP_OR_uxn_c_l265_c4_5a82_left;
     BIN_OP_OR_uxn_c_l265_c4_5a82_right <= VAR_BIN_OP_OR_uxn_c_l265_c4_5a82_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l265_c4_5a82_return_output := BIN_OP_OR_uxn_c_l265_c4_5a82_return_output;

     -- BIN_OP_OR[uxn_c_l256_c4_62cf] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l256_c4_62cf_left <= VAR_BIN_OP_OR_uxn_c_l256_c4_62cf_left;
     BIN_OP_OR_uxn_c_l256_c4_62cf_right <= VAR_BIN_OP_OR_uxn_c_l256_c4_62cf_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l256_c4_62cf_return_output := BIN_OP_OR_uxn_c_l256_c4_62cf_return_output;

     -- BIN_OP_OR[uxn_c_l213_c4_2ce4] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l213_c4_2ce4_left <= VAR_BIN_OP_OR_uxn_c_l213_c4_2ce4_left;
     BIN_OP_OR_uxn_c_l213_c4_2ce4_right <= VAR_BIN_OP_OR_uxn_c_l213_c4_2ce4_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l213_c4_2ce4_return_output := BIN_OP_OR_uxn_c_l213_c4_2ce4_return_output;

     -- BIN_OP_AND[uxn_c_l203_c6_4351] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l203_c6_4351_left <= VAR_BIN_OP_AND_uxn_c_l203_c6_4351_left;
     BIN_OP_AND_uxn_c_l203_c6_4351_right <= VAR_BIN_OP_AND_uxn_c_l203_c6_4351_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l203_c6_4351_return_output := BIN_OP_AND_uxn_c_l203_c6_4351_return_output;

     -- Submodule level 4
     VAR_color_MUX_uxn_c_l203_c2_c9ac_cond := VAR_BIN_OP_AND_uxn_c_l203_c6_4351_return_output;
     VAR_color_2_MUX_uxn_c_l262_c8_28c9_iftrue := VAR_BIN_OP_OR_uxn_c_l265_c4_5a82_return_output;
     -- color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8[uxn_c_l209_c3_6acd] LATENCY=0
     VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l209_c3_6acd_return_output := CONST_REF_RD_uint12_t_4_uint12_t_4_90b8(
     color,
     VAR_BIN_OP_OR_uxn_c_l213_c4_2ce4_return_output,
     VAR_BIN_OP_OR_uxn_c_l218_c4_8062_return_output);

     -- color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5[uxn_c_l220_c8_f1eb] LATENCY=0
     VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l220_c8_f1eb_return_output := CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5(
     color,
     VAR_BIN_OP_OR_uxn_c_l224_c4_b751_return_output,
     VAR_BIN_OP_OR_uxn_c_l229_c4_80d1_return_output);

     -- color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8[uxn_c_l231_c8_5ad5] LATENCY=0
     VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l231_c8_5ad5_return_output := CONST_REF_RD_uint12_t_4_uint12_t_4_90b8(
     color,
     VAR_BIN_OP_OR_uxn_c_l235_c4_c72d_return_output,
     VAR_BIN_OP_OR_uxn_c_l240_c4_9f4b_return_output);

     -- color_2_MUX[uxn_c_l262_c8_28c9] LATENCY=0
     -- Inputs
     color_2_MUX_uxn_c_l262_c8_28c9_cond <= VAR_color_2_MUX_uxn_c_l262_c8_28c9_cond;
     color_2_MUX_uxn_c_l262_c8_28c9_iftrue <= VAR_color_2_MUX_uxn_c_l262_c8_28c9_iftrue;
     color_2_MUX_uxn_c_l262_c8_28c9_iffalse <= VAR_color_2_MUX_uxn_c_l262_c8_28c9_iffalse;
     -- Outputs
     VAR_color_2_MUX_uxn_c_l262_c8_28c9_return_output := color_2_MUX_uxn_c_l262_c8_28c9_return_output;

     -- color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8[uxn_c_l253_c8_956f] LATENCY=0
     VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l253_c8_956f_return_output := CONST_REF_RD_uint12_t_4_uint12_t_4_90b8(
     color,
     VAR_BIN_OP_OR_uxn_c_l256_c4_62cf_return_output,
     VAR_BIN_OP_OR_uxn_c_l260_c4_65f1_return_output);

     -- color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5[uxn_c_l242_c8_d84f] LATENCY=0
     VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l242_c8_d84f_return_output := CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5(
     color,
     VAR_BIN_OP_OR_uxn_c_l246_c4_44cf_return_output,
     VAR_BIN_OP_OR_uxn_c_l251_c4_ba0c_return_output);

     -- Submodule level 5
     VAR_color_MUX_uxn_c_l209_c3_6acd_iftrue := VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l209_c3_6acd_return_output;
     VAR_color_MUX_uxn_c_l231_c8_5ad5_iftrue := VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l231_c8_5ad5_return_output;
     VAR_color_MUX_uxn_c_l253_c8_956f_iftrue := VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l253_c8_956f_return_output;
     VAR_color_MUX_uxn_c_l220_c8_f1eb_iftrue := VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l220_c8_f1eb_return_output;
     VAR_color_MUX_uxn_c_l242_c8_d84f_iftrue := VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l242_c8_d84f_return_output;
     -- color_FALSE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5[uxn_c_l253_c8_956f] LATENCY=0
     VAR_color_FALSE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l253_c8_956f_return_output := CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5(
     color,
     VAR_color_2_MUX_uxn_c_l262_c8_28c9_return_output,
     VAR_color_3_MUX_uxn_c_l262_c8_28c9_return_output);

     -- Submodule level 6
     VAR_color_MUX_uxn_c_l253_c8_956f_iffalse := VAR_color_FALSE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l253_c8_956f_return_output;
     -- color_MUX[uxn_c_l253_c8_956f] LATENCY=0
     -- Inputs
     color_MUX_uxn_c_l253_c8_956f_cond <= VAR_color_MUX_uxn_c_l253_c8_956f_cond;
     color_MUX_uxn_c_l253_c8_956f_iftrue <= VAR_color_MUX_uxn_c_l253_c8_956f_iftrue;
     color_MUX_uxn_c_l253_c8_956f_iffalse <= VAR_color_MUX_uxn_c_l253_c8_956f_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_c_l253_c8_956f_return_output := color_MUX_uxn_c_l253_c8_956f_return_output;

     -- Submodule level 7
     VAR_color_MUX_uxn_c_l242_c8_d84f_iffalse := VAR_color_MUX_uxn_c_l253_c8_956f_return_output;
     -- color_MUX[uxn_c_l242_c8_d84f] LATENCY=0
     -- Inputs
     color_MUX_uxn_c_l242_c8_d84f_cond <= VAR_color_MUX_uxn_c_l242_c8_d84f_cond;
     color_MUX_uxn_c_l242_c8_d84f_iftrue <= VAR_color_MUX_uxn_c_l242_c8_d84f_iftrue;
     color_MUX_uxn_c_l242_c8_d84f_iffalse <= VAR_color_MUX_uxn_c_l242_c8_d84f_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_c_l242_c8_d84f_return_output := color_MUX_uxn_c_l242_c8_d84f_return_output;

     -- Submodule level 8
     VAR_color_MUX_uxn_c_l231_c8_5ad5_iffalse := VAR_color_MUX_uxn_c_l242_c8_d84f_return_output;
     -- color_MUX[uxn_c_l231_c8_5ad5] LATENCY=0
     -- Inputs
     color_MUX_uxn_c_l231_c8_5ad5_cond <= VAR_color_MUX_uxn_c_l231_c8_5ad5_cond;
     color_MUX_uxn_c_l231_c8_5ad5_iftrue <= VAR_color_MUX_uxn_c_l231_c8_5ad5_iftrue;
     color_MUX_uxn_c_l231_c8_5ad5_iffalse <= VAR_color_MUX_uxn_c_l231_c8_5ad5_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_c_l231_c8_5ad5_return_output := color_MUX_uxn_c_l231_c8_5ad5_return_output;

     -- Submodule level 9
     VAR_color_MUX_uxn_c_l220_c8_f1eb_iffalse := VAR_color_MUX_uxn_c_l231_c8_5ad5_return_output;
     -- color_MUX[uxn_c_l220_c8_f1eb] LATENCY=0
     -- Inputs
     color_MUX_uxn_c_l220_c8_f1eb_cond <= VAR_color_MUX_uxn_c_l220_c8_f1eb_cond;
     color_MUX_uxn_c_l220_c8_f1eb_iftrue <= VAR_color_MUX_uxn_c_l220_c8_f1eb_iftrue;
     color_MUX_uxn_c_l220_c8_f1eb_iffalse <= VAR_color_MUX_uxn_c_l220_c8_f1eb_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_c_l220_c8_f1eb_return_output := color_MUX_uxn_c_l220_c8_f1eb_return_output;

     -- Submodule level 10
     VAR_color_MUX_uxn_c_l209_c3_6acd_iffalse := VAR_color_MUX_uxn_c_l220_c8_f1eb_return_output;
     -- color_MUX[uxn_c_l209_c3_6acd] LATENCY=0
     -- Inputs
     color_MUX_uxn_c_l209_c3_6acd_cond <= VAR_color_MUX_uxn_c_l209_c3_6acd_cond;
     color_MUX_uxn_c_l209_c3_6acd_iftrue <= VAR_color_MUX_uxn_c_l209_c3_6acd_iftrue;
     color_MUX_uxn_c_l209_c3_6acd_iffalse <= VAR_color_MUX_uxn_c_l209_c3_6acd_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_c_l209_c3_6acd_return_output := color_MUX_uxn_c_l209_c3_6acd_return_output;

     -- Submodule level 11
     VAR_color_MUX_uxn_c_l203_c2_c9ac_iftrue := VAR_color_MUX_uxn_c_l209_c3_6acd_return_output;
     -- color_MUX[uxn_c_l203_c2_c9ac] LATENCY=0
     -- Inputs
     color_MUX_uxn_c_l203_c2_c9ac_cond <= VAR_color_MUX_uxn_c_l203_c2_c9ac_cond;
     color_MUX_uxn_c_l203_c2_c9ac_iftrue <= VAR_color_MUX_uxn_c_l203_c2_c9ac_iftrue;
     color_MUX_uxn_c_l203_c2_c9ac_iffalse <= VAR_color_MUX_uxn_c_l203_c2_c9ac_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_c_l203_c2_c9ac_return_output := color_MUX_uxn_c_l203_c2_c9ac_return_output;

     -- Submodule level 12
     VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l273_c20_fe9f_ref_toks_0 := VAR_color_MUX_uxn_c_l203_c2_c9ac_return_output;
     REG_VAR_color := VAR_color_MUX_uxn_c_l203_c2_c9ac_return_output;
     -- VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d[uxn_c_l273_c20_fe9f] LATENCY=0
     -- Inputs
     VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l273_c20_fe9f_ref_toks_0 <= VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l273_c20_fe9f_ref_toks_0;
     VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l273_c20_fe9f_var_dim_0 <= VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l273_c20_fe9f_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l273_c20_fe9f_return_output := VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l273_c20_fe9f_return_output;

     -- Submodule level 13
     VAR_result_uxn_c_l273_c11_97fb_0 := resize(VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l273_c20_fe9f_return_output, 16);
     VAR_return_output := VAR_result_uxn_c_l273_c11_97fb_0;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_color <= REG_VAR_color;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     color <= REG_COMB_color;
 end if;
 end if;
end process;

end arch;
