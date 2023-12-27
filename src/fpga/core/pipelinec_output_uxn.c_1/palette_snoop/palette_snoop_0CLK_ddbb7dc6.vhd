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
-- CONST_SR_4[uxn_c_l199_c30_8026]
signal CONST_SR_4_uxn_c_l199_c30_8026_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_c_l199_c30_8026_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_c_l199_c30_d215]
signal BIN_OP_EQ_uxn_c_l199_c30_d215_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l199_c30_d215_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l199_c30_d215_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l199_c30_5983]
signal MUX_uxn_c_l199_c30_5983_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l199_c30_5983_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l199_c30_5983_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l199_c30_5983_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l201_c6_7154]
signal BIN_OP_AND_uxn_c_l201_c6_7154_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l201_c6_7154_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l201_c6_7154_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_c_l201_c2_f05f]
signal color_MUX_uxn_c_l201_c2_f05f_cond : unsigned(0 downto 0);
signal color_MUX_uxn_c_l201_c2_f05f_iftrue : uint12_t_4;
signal color_MUX_uxn_c_l201_c2_f05f_iffalse : uint12_t_4;
signal color_MUX_uxn_c_l201_c2_f05f_return_output : uint12_t_4;

-- CONST_SR_4[uxn_c_l204_c35_f859]
signal CONST_SR_4_uxn_c_l204_c35_f859_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_c_l204_c35_f859_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_c_l207_c7_fef9]
signal BIN_OP_EQ_uxn_c_l207_c7_fef9_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l207_c7_fef9_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l207_c7_fef9_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_c_l207_c3_b6f2]
signal color_MUX_uxn_c_l207_c3_b6f2_cond : unsigned(0 downto 0);
signal color_MUX_uxn_c_l207_c3_b6f2_iftrue : uint12_t_4;
signal color_MUX_uxn_c_l207_c3_b6f2_iffalse : uint12_t_4;
signal color_MUX_uxn_c_l207_c3_b6f2_return_output : uint12_t_4;

-- CONST_SL_8[uxn_c_l209_c4_5d3f]
signal CONST_SL_8_uxn_c_l209_c4_5d3f_x : unsigned(11 downto 0);
signal CONST_SL_8_uxn_c_l209_c4_5d3f_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l210_c4_e9f3]
signal BIN_OP_AND_uxn_c_l210_c4_e9f3_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l210_c4_e9f3_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l210_c4_e9f3_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l211_c4_e283]
signal BIN_OP_OR_uxn_c_l211_c4_e283_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l211_c4_e283_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l211_c4_e283_return_output : unsigned(11 downto 0);

-- CONST_SL_8[uxn_c_l214_c4_90f3]
signal CONST_SL_8_uxn_c_l214_c4_90f3_x : unsigned(11 downto 0);
signal CONST_SL_8_uxn_c_l214_c4_90f3_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l215_c4_fab1]
signal BIN_OP_AND_uxn_c_l215_c4_fab1_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l215_c4_fab1_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l215_c4_fab1_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l216_c4_a726]
signal BIN_OP_OR_uxn_c_l216_c4_a726_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l216_c4_a726_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l216_c4_a726_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l218_c12_1c9f]
signal BIN_OP_EQ_uxn_c_l218_c12_1c9f_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l218_c12_1c9f_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l218_c12_1c9f_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_c_l218_c8_ca14]
signal color_MUX_uxn_c_l218_c8_ca14_cond : unsigned(0 downto 0);
signal color_MUX_uxn_c_l218_c8_ca14_iftrue : uint12_t_4;
signal color_MUX_uxn_c_l218_c8_ca14_iffalse : uint12_t_4;
signal color_MUX_uxn_c_l218_c8_ca14_return_output : uint12_t_4;

-- CONST_SL_8[uxn_c_l220_c4_2a79]
signal CONST_SL_8_uxn_c_l220_c4_2a79_x : unsigned(11 downto 0);
signal CONST_SL_8_uxn_c_l220_c4_2a79_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l221_c4_2bf5]
signal BIN_OP_AND_uxn_c_l221_c4_2bf5_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l221_c4_2bf5_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l221_c4_2bf5_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l222_c4_bfd0]
signal BIN_OP_OR_uxn_c_l222_c4_bfd0_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l222_c4_bfd0_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l222_c4_bfd0_return_output : unsigned(11 downto 0);

-- CONST_SL_8[uxn_c_l225_c4_2adb]
signal CONST_SL_8_uxn_c_l225_c4_2adb_x : unsigned(11 downto 0);
signal CONST_SL_8_uxn_c_l225_c4_2adb_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l226_c4_9b2a]
signal BIN_OP_AND_uxn_c_l226_c4_9b2a_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l226_c4_9b2a_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l226_c4_9b2a_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l227_c4_03a7]
signal BIN_OP_OR_uxn_c_l227_c4_03a7_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l227_c4_03a7_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l227_c4_03a7_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l229_c12_1ff9]
signal BIN_OP_EQ_uxn_c_l229_c12_1ff9_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l229_c12_1ff9_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l229_c12_1ff9_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_c_l229_c8_5299]
signal color_MUX_uxn_c_l229_c8_5299_cond : unsigned(0 downto 0);
signal color_MUX_uxn_c_l229_c8_5299_iftrue : uint12_t_4;
signal color_MUX_uxn_c_l229_c8_5299_iffalse : uint12_t_4;
signal color_MUX_uxn_c_l229_c8_5299_return_output : uint12_t_4;

-- CONST_SL_4[uxn_c_l231_c4_23d8]
signal CONST_SL_4_uxn_c_l231_c4_23d8_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_c_l231_c4_23d8_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l232_c4_9687]
signal BIN_OP_AND_uxn_c_l232_c4_9687_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l232_c4_9687_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l232_c4_9687_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l233_c4_ddbf]
signal BIN_OP_OR_uxn_c_l233_c4_ddbf_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l233_c4_ddbf_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l233_c4_ddbf_return_output : unsigned(11 downto 0);

-- CONST_SL_4[uxn_c_l236_c4_d607]
signal CONST_SL_4_uxn_c_l236_c4_d607_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_c_l236_c4_d607_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l237_c4_d28b]
signal BIN_OP_AND_uxn_c_l237_c4_d28b_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l237_c4_d28b_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l237_c4_d28b_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l238_c4_1b2b]
signal BIN_OP_OR_uxn_c_l238_c4_1b2b_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l238_c4_1b2b_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l238_c4_1b2b_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l240_c12_8424]
signal BIN_OP_EQ_uxn_c_l240_c12_8424_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l240_c12_8424_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l240_c12_8424_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_c_l240_c8_1304]
signal color_MUX_uxn_c_l240_c8_1304_cond : unsigned(0 downto 0);
signal color_MUX_uxn_c_l240_c8_1304_iftrue : uint12_t_4;
signal color_MUX_uxn_c_l240_c8_1304_iffalse : uint12_t_4;
signal color_MUX_uxn_c_l240_c8_1304_return_output : uint12_t_4;

-- CONST_SL_4[uxn_c_l242_c4_fcb1]
signal CONST_SL_4_uxn_c_l242_c4_fcb1_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_c_l242_c4_fcb1_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l243_c4_f08d]
signal BIN_OP_AND_uxn_c_l243_c4_f08d_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l243_c4_f08d_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l243_c4_f08d_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l244_c4_d86d]
signal BIN_OP_OR_uxn_c_l244_c4_d86d_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l244_c4_d86d_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l244_c4_d86d_return_output : unsigned(11 downto 0);

-- CONST_SL_4[uxn_c_l247_c4_9386]
signal CONST_SL_4_uxn_c_l247_c4_9386_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_c_l247_c4_9386_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l248_c4_5e4c]
signal BIN_OP_AND_uxn_c_l248_c4_5e4c_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l248_c4_5e4c_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l248_c4_5e4c_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l249_c4_f53f]
signal BIN_OP_OR_uxn_c_l249_c4_f53f_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l249_c4_f53f_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l249_c4_f53f_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l251_c12_65f6]
signal BIN_OP_EQ_uxn_c_l251_c12_65f6_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l251_c12_65f6_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l251_c12_65f6_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_c_l251_c8_ac82]
signal color_MUX_uxn_c_l251_c8_ac82_cond : unsigned(0 downto 0);
signal color_MUX_uxn_c_l251_c8_ac82_iftrue : uint12_t_4;
signal color_MUX_uxn_c_l251_c8_ac82_iffalse : uint12_t_4;
signal color_MUX_uxn_c_l251_c8_ac82_return_output : uint12_t_4;

-- BIN_OP_AND[uxn_c_l253_c4_63a8]
signal BIN_OP_AND_uxn_c_l253_c4_63a8_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l253_c4_63a8_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l253_c4_63a8_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l254_c4_8827]
signal BIN_OP_OR_uxn_c_l254_c4_8827_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l254_c4_8827_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l254_c4_8827_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l257_c4_f47c]
signal BIN_OP_AND_uxn_c_l257_c4_f47c_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l257_c4_f47c_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l257_c4_f47c_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l258_c4_7171]
signal BIN_OP_OR_uxn_c_l258_c4_7171_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l258_c4_7171_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l258_c4_7171_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l260_c12_fc67]
signal BIN_OP_EQ_uxn_c_l260_c12_fc67_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l260_c12_fc67_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l260_c12_fc67_return_output : unsigned(0 downto 0);

-- color_3_MUX[uxn_c_l260_c8_8251]
signal color_3_MUX_uxn_c_l260_c8_8251_cond : unsigned(0 downto 0);
signal color_3_MUX_uxn_c_l260_c8_8251_iftrue : unsigned(11 downto 0);
signal color_3_MUX_uxn_c_l260_c8_8251_iffalse : unsigned(11 downto 0);
signal color_3_MUX_uxn_c_l260_c8_8251_return_output : unsigned(11 downto 0);

-- color_2_MUX[uxn_c_l260_c8_8251]
signal color_2_MUX_uxn_c_l260_c8_8251_cond : unsigned(0 downto 0);
signal color_2_MUX_uxn_c_l260_c8_8251_iftrue : unsigned(11 downto 0);
signal color_2_MUX_uxn_c_l260_c8_8251_iffalse : unsigned(11 downto 0);
signal color_2_MUX_uxn_c_l260_c8_8251_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l262_c4_985f]
signal BIN_OP_AND_uxn_c_l262_c4_985f_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l262_c4_985f_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l262_c4_985f_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l263_c4_8b39]
signal BIN_OP_OR_uxn_c_l263_c4_8b39_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l263_c4_8b39_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l263_c4_8b39_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l266_c4_8a66]
signal BIN_OP_AND_uxn_c_l266_c4_8a66_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l266_c4_8a66_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l266_c4_8a66_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l267_c4_10f2]
signal BIN_OP_OR_uxn_c_l267_c4_10f2_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l267_c4_10f2_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l267_c4_10f2_return_output : unsigned(11 downto 0);

-- VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d[uxn_c_l271_c20_57b3]
signal VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l271_c20_57b3_ref_toks_0 : uint12_t_4;
signal VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l271_c20_57b3_var_dim_0 : unsigned(1 downto 0);
signal VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l271_c20_57b3_return_output : unsigned(11 downto 0);

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

function CONST_REF_RD_uint12_t_4_uint12_t_4_3db8( ref_toks_0 : uint12_t_4;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned) return uint12_t_4 is
 
  variable base : uint12_t_4; 
  variable return_output : uint12_t_4;
begin
      base := ref_toks_0;
      base(3) := ref_toks_1;
      base(2) := ref_toks_2;

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
-- CONST_SR_4_uxn_c_l199_c30_8026
CONST_SR_4_uxn_c_l199_c30_8026 : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_c_l199_c30_8026_x,
CONST_SR_4_uxn_c_l199_c30_8026_return_output);

-- BIN_OP_EQ_uxn_c_l199_c30_d215
BIN_OP_EQ_uxn_c_l199_c30_d215 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l199_c30_d215_left,
BIN_OP_EQ_uxn_c_l199_c30_d215_right,
BIN_OP_EQ_uxn_c_l199_c30_d215_return_output);

-- MUX_uxn_c_l199_c30_5983
MUX_uxn_c_l199_c30_5983 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l199_c30_5983_cond,
MUX_uxn_c_l199_c30_5983_iftrue,
MUX_uxn_c_l199_c30_5983_iffalse,
MUX_uxn_c_l199_c30_5983_return_output);

-- BIN_OP_AND_uxn_c_l201_c6_7154
BIN_OP_AND_uxn_c_l201_c6_7154 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l201_c6_7154_left,
BIN_OP_AND_uxn_c_l201_c6_7154_right,
BIN_OP_AND_uxn_c_l201_c6_7154_return_output);

-- color_MUX_uxn_c_l201_c2_f05f
color_MUX_uxn_c_l201_c2_f05f : entity work.MUX_uint1_t_uint12_t_4_uint12_t_4_0CLK_de264c78 port map (
color_MUX_uxn_c_l201_c2_f05f_cond,
color_MUX_uxn_c_l201_c2_f05f_iftrue,
color_MUX_uxn_c_l201_c2_f05f_iffalse,
color_MUX_uxn_c_l201_c2_f05f_return_output);

-- CONST_SR_4_uxn_c_l204_c35_f859
CONST_SR_4_uxn_c_l204_c35_f859 : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_c_l204_c35_f859_x,
CONST_SR_4_uxn_c_l204_c35_f859_return_output);

-- BIN_OP_EQ_uxn_c_l207_c7_fef9
BIN_OP_EQ_uxn_c_l207_c7_fef9 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l207_c7_fef9_left,
BIN_OP_EQ_uxn_c_l207_c7_fef9_right,
BIN_OP_EQ_uxn_c_l207_c7_fef9_return_output);

-- color_MUX_uxn_c_l207_c3_b6f2
color_MUX_uxn_c_l207_c3_b6f2 : entity work.MUX_uint1_t_uint12_t_4_uint12_t_4_0CLK_de264c78 port map (
color_MUX_uxn_c_l207_c3_b6f2_cond,
color_MUX_uxn_c_l207_c3_b6f2_iftrue,
color_MUX_uxn_c_l207_c3_b6f2_iffalse,
color_MUX_uxn_c_l207_c3_b6f2_return_output);

-- CONST_SL_8_uxn_c_l209_c4_5d3f
CONST_SL_8_uxn_c_l209_c4_5d3f : entity work.CONST_SL_8_uint12_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l209_c4_5d3f_x,
CONST_SL_8_uxn_c_l209_c4_5d3f_return_output);

-- BIN_OP_AND_uxn_c_l210_c4_e9f3
BIN_OP_AND_uxn_c_l210_c4_e9f3 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l210_c4_e9f3_left,
BIN_OP_AND_uxn_c_l210_c4_e9f3_right,
BIN_OP_AND_uxn_c_l210_c4_e9f3_return_output);

-- BIN_OP_OR_uxn_c_l211_c4_e283
BIN_OP_OR_uxn_c_l211_c4_e283 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l211_c4_e283_left,
BIN_OP_OR_uxn_c_l211_c4_e283_right,
BIN_OP_OR_uxn_c_l211_c4_e283_return_output);

-- CONST_SL_8_uxn_c_l214_c4_90f3
CONST_SL_8_uxn_c_l214_c4_90f3 : entity work.CONST_SL_8_uint12_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l214_c4_90f3_x,
CONST_SL_8_uxn_c_l214_c4_90f3_return_output);

-- BIN_OP_AND_uxn_c_l215_c4_fab1
BIN_OP_AND_uxn_c_l215_c4_fab1 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l215_c4_fab1_left,
BIN_OP_AND_uxn_c_l215_c4_fab1_right,
BIN_OP_AND_uxn_c_l215_c4_fab1_return_output);

-- BIN_OP_OR_uxn_c_l216_c4_a726
BIN_OP_OR_uxn_c_l216_c4_a726 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l216_c4_a726_left,
BIN_OP_OR_uxn_c_l216_c4_a726_right,
BIN_OP_OR_uxn_c_l216_c4_a726_return_output);

-- BIN_OP_EQ_uxn_c_l218_c12_1c9f
BIN_OP_EQ_uxn_c_l218_c12_1c9f : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l218_c12_1c9f_left,
BIN_OP_EQ_uxn_c_l218_c12_1c9f_right,
BIN_OP_EQ_uxn_c_l218_c12_1c9f_return_output);

-- color_MUX_uxn_c_l218_c8_ca14
color_MUX_uxn_c_l218_c8_ca14 : entity work.MUX_uint1_t_uint12_t_4_uint12_t_4_0CLK_de264c78 port map (
color_MUX_uxn_c_l218_c8_ca14_cond,
color_MUX_uxn_c_l218_c8_ca14_iftrue,
color_MUX_uxn_c_l218_c8_ca14_iffalse,
color_MUX_uxn_c_l218_c8_ca14_return_output);

-- CONST_SL_8_uxn_c_l220_c4_2a79
CONST_SL_8_uxn_c_l220_c4_2a79 : entity work.CONST_SL_8_uint12_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l220_c4_2a79_x,
CONST_SL_8_uxn_c_l220_c4_2a79_return_output);

-- BIN_OP_AND_uxn_c_l221_c4_2bf5
BIN_OP_AND_uxn_c_l221_c4_2bf5 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l221_c4_2bf5_left,
BIN_OP_AND_uxn_c_l221_c4_2bf5_right,
BIN_OP_AND_uxn_c_l221_c4_2bf5_return_output);

-- BIN_OP_OR_uxn_c_l222_c4_bfd0
BIN_OP_OR_uxn_c_l222_c4_bfd0 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l222_c4_bfd0_left,
BIN_OP_OR_uxn_c_l222_c4_bfd0_right,
BIN_OP_OR_uxn_c_l222_c4_bfd0_return_output);

-- CONST_SL_8_uxn_c_l225_c4_2adb
CONST_SL_8_uxn_c_l225_c4_2adb : entity work.CONST_SL_8_uint12_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l225_c4_2adb_x,
CONST_SL_8_uxn_c_l225_c4_2adb_return_output);

-- BIN_OP_AND_uxn_c_l226_c4_9b2a
BIN_OP_AND_uxn_c_l226_c4_9b2a : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l226_c4_9b2a_left,
BIN_OP_AND_uxn_c_l226_c4_9b2a_right,
BIN_OP_AND_uxn_c_l226_c4_9b2a_return_output);

-- BIN_OP_OR_uxn_c_l227_c4_03a7
BIN_OP_OR_uxn_c_l227_c4_03a7 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l227_c4_03a7_left,
BIN_OP_OR_uxn_c_l227_c4_03a7_right,
BIN_OP_OR_uxn_c_l227_c4_03a7_return_output);

-- BIN_OP_EQ_uxn_c_l229_c12_1ff9
BIN_OP_EQ_uxn_c_l229_c12_1ff9 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l229_c12_1ff9_left,
BIN_OP_EQ_uxn_c_l229_c12_1ff9_right,
BIN_OP_EQ_uxn_c_l229_c12_1ff9_return_output);

-- color_MUX_uxn_c_l229_c8_5299
color_MUX_uxn_c_l229_c8_5299 : entity work.MUX_uint1_t_uint12_t_4_uint12_t_4_0CLK_de264c78 port map (
color_MUX_uxn_c_l229_c8_5299_cond,
color_MUX_uxn_c_l229_c8_5299_iftrue,
color_MUX_uxn_c_l229_c8_5299_iffalse,
color_MUX_uxn_c_l229_c8_5299_return_output);

-- CONST_SL_4_uxn_c_l231_c4_23d8
CONST_SL_4_uxn_c_l231_c4_23d8 : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_c_l231_c4_23d8_x,
CONST_SL_4_uxn_c_l231_c4_23d8_return_output);

-- BIN_OP_AND_uxn_c_l232_c4_9687
BIN_OP_AND_uxn_c_l232_c4_9687 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l232_c4_9687_left,
BIN_OP_AND_uxn_c_l232_c4_9687_right,
BIN_OP_AND_uxn_c_l232_c4_9687_return_output);

-- BIN_OP_OR_uxn_c_l233_c4_ddbf
BIN_OP_OR_uxn_c_l233_c4_ddbf : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l233_c4_ddbf_left,
BIN_OP_OR_uxn_c_l233_c4_ddbf_right,
BIN_OP_OR_uxn_c_l233_c4_ddbf_return_output);

-- CONST_SL_4_uxn_c_l236_c4_d607
CONST_SL_4_uxn_c_l236_c4_d607 : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_c_l236_c4_d607_x,
CONST_SL_4_uxn_c_l236_c4_d607_return_output);

-- BIN_OP_AND_uxn_c_l237_c4_d28b
BIN_OP_AND_uxn_c_l237_c4_d28b : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l237_c4_d28b_left,
BIN_OP_AND_uxn_c_l237_c4_d28b_right,
BIN_OP_AND_uxn_c_l237_c4_d28b_return_output);

-- BIN_OP_OR_uxn_c_l238_c4_1b2b
BIN_OP_OR_uxn_c_l238_c4_1b2b : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l238_c4_1b2b_left,
BIN_OP_OR_uxn_c_l238_c4_1b2b_right,
BIN_OP_OR_uxn_c_l238_c4_1b2b_return_output);

-- BIN_OP_EQ_uxn_c_l240_c12_8424
BIN_OP_EQ_uxn_c_l240_c12_8424 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l240_c12_8424_left,
BIN_OP_EQ_uxn_c_l240_c12_8424_right,
BIN_OP_EQ_uxn_c_l240_c12_8424_return_output);

-- color_MUX_uxn_c_l240_c8_1304
color_MUX_uxn_c_l240_c8_1304 : entity work.MUX_uint1_t_uint12_t_4_uint12_t_4_0CLK_de264c78 port map (
color_MUX_uxn_c_l240_c8_1304_cond,
color_MUX_uxn_c_l240_c8_1304_iftrue,
color_MUX_uxn_c_l240_c8_1304_iffalse,
color_MUX_uxn_c_l240_c8_1304_return_output);

-- CONST_SL_4_uxn_c_l242_c4_fcb1
CONST_SL_4_uxn_c_l242_c4_fcb1 : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_c_l242_c4_fcb1_x,
CONST_SL_4_uxn_c_l242_c4_fcb1_return_output);

-- BIN_OP_AND_uxn_c_l243_c4_f08d
BIN_OP_AND_uxn_c_l243_c4_f08d : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l243_c4_f08d_left,
BIN_OP_AND_uxn_c_l243_c4_f08d_right,
BIN_OP_AND_uxn_c_l243_c4_f08d_return_output);

-- BIN_OP_OR_uxn_c_l244_c4_d86d
BIN_OP_OR_uxn_c_l244_c4_d86d : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l244_c4_d86d_left,
BIN_OP_OR_uxn_c_l244_c4_d86d_right,
BIN_OP_OR_uxn_c_l244_c4_d86d_return_output);

-- CONST_SL_4_uxn_c_l247_c4_9386
CONST_SL_4_uxn_c_l247_c4_9386 : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_c_l247_c4_9386_x,
CONST_SL_4_uxn_c_l247_c4_9386_return_output);

-- BIN_OP_AND_uxn_c_l248_c4_5e4c
BIN_OP_AND_uxn_c_l248_c4_5e4c : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l248_c4_5e4c_left,
BIN_OP_AND_uxn_c_l248_c4_5e4c_right,
BIN_OP_AND_uxn_c_l248_c4_5e4c_return_output);

-- BIN_OP_OR_uxn_c_l249_c4_f53f
BIN_OP_OR_uxn_c_l249_c4_f53f : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l249_c4_f53f_left,
BIN_OP_OR_uxn_c_l249_c4_f53f_right,
BIN_OP_OR_uxn_c_l249_c4_f53f_return_output);

-- BIN_OP_EQ_uxn_c_l251_c12_65f6
BIN_OP_EQ_uxn_c_l251_c12_65f6 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l251_c12_65f6_left,
BIN_OP_EQ_uxn_c_l251_c12_65f6_right,
BIN_OP_EQ_uxn_c_l251_c12_65f6_return_output);

-- color_MUX_uxn_c_l251_c8_ac82
color_MUX_uxn_c_l251_c8_ac82 : entity work.MUX_uint1_t_uint12_t_4_uint12_t_4_0CLK_de264c78 port map (
color_MUX_uxn_c_l251_c8_ac82_cond,
color_MUX_uxn_c_l251_c8_ac82_iftrue,
color_MUX_uxn_c_l251_c8_ac82_iffalse,
color_MUX_uxn_c_l251_c8_ac82_return_output);

-- BIN_OP_AND_uxn_c_l253_c4_63a8
BIN_OP_AND_uxn_c_l253_c4_63a8 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l253_c4_63a8_left,
BIN_OP_AND_uxn_c_l253_c4_63a8_right,
BIN_OP_AND_uxn_c_l253_c4_63a8_return_output);

-- BIN_OP_OR_uxn_c_l254_c4_8827
BIN_OP_OR_uxn_c_l254_c4_8827 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l254_c4_8827_left,
BIN_OP_OR_uxn_c_l254_c4_8827_right,
BIN_OP_OR_uxn_c_l254_c4_8827_return_output);

-- BIN_OP_AND_uxn_c_l257_c4_f47c
BIN_OP_AND_uxn_c_l257_c4_f47c : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l257_c4_f47c_left,
BIN_OP_AND_uxn_c_l257_c4_f47c_right,
BIN_OP_AND_uxn_c_l257_c4_f47c_return_output);

-- BIN_OP_OR_uxn_c_l258_c4_7171
BIN_OP_OR_uxn_c_l258_c4_7171 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l258_c4_7171_left,
BIN_OP_OR_uxn_c_l258_c4_7171_right,
BIN_OP_OR_uxn_c_l258_c4_7171_return_output);

-- BIN_OP_EQ_uxn_c_l260_c12_fc67
BIN_OP_EQ_uxn_c_l260_c12_fc67 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l260_c12_fc67_left,
BIN_OP_EQ_uxn_c_l260_c12_fc67_right,
BIN_OP_EQ_uxn_c_l260_c12_fc67_return_output);

-- color_3_MUX_uxn_c_l260_c8_8251
color_3_MUX_uxn_c_l260_c8_8251 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color_3_MUX_uxn_c_l260_c8_8251_cond,
color_3_MUX_uxn_c_l260_c8_8251_iftrue,
color_3_MUX_uxn_c_l260_c8_8251_iffalse,
color_3_MUX_uxn_c_l260_c8_8251_return_output);

-- color_2_MUX_uxn_c_l260_c8_8251
color_2_MUX_uxn_c_l260_c8_8251 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color_2_MUX_uxn_c_l260_c8_8251_cond,
color_2_MUX_uxn_c_l260_c8_8251_iftrue,
color_2_MUX_uxn_c_l260_c8_8251_iffalse,
color_2_MUX_uxn_c_l260_c8_8251_return_output);

-- BIN_OP_AND_uxn_c_l262_c4_985f
BIN_OP_AND_uxn_c_l262_c4_985f : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l262_c4_985f_left,
BIN_OP_AND_uxn_c_l262_c4_985f_right,
BIN_OP_AND_uxn_c_l262_c4_985f_return_output);

-- BIN_OP_OR_uxn_c_l263_c4_8b39
BIN_OP_OR_uxn_c_l263_c4_8b39 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l263_c4_8b39_left,
BIN_OP_OR_uxn_c_l263_c4_8b39_right,
BIN_OP_OR_uxn_c_l263_c4_8b39_return_output);

-- BIN_OP_AND_uxn_c_l266_c4_8a66
BIN_OP_AND_uxn_c_l266_c4_8a66 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l266_c4_8a66_left,
BIN_OP_AND_uxn_c_l266_c4_8a66_right,
BIN_OP_AND_uxn_c_l266_c4_8a66_return_output);

-- BIN_OP_OR_uxn_c_l267_c4_10f2
BIN_OP_OR_uxn_c_l267_c4_10f2 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l267_c4_10f2_left,
BIN_OP_OR_uxn_c_l267_c4_10f2_right,
BIN_OP_OR_uxn_c_l267_c4_10f2_return_output);

-- VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l271_c20_57b3
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l271_c20_57b3 : entity work.VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_0CLK_9e40ec46 port map (
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l271_c20_57b3_ref_toks_0,
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l271_c20_57b3_var_dim_0,
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l271_c20_57b3_return_output);



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
 CONST_SR_4_uxn_c_l199_c30_8026_return_output,
 BIN_OP_EQ_uxn_c_l199_c30_d215_return_output,
 MUX_uxn_c_l199_c30_5983_return_output,
 BIN_OP_AND_uxn_c_l201_c6_7154_return_output,
 color_MUX_uxn_c_l201_c2_f05f_return_output,
 CONST_SR_4_uxn_c_l204_c35_f859_return_output,
 BIN_OP_EQ_uxn_c_l207_c7_fef9_return_output,
 color_MUX_uxn_c_l207_c3_b6f2_return_output,
 CONST_SL_8_uxn_c_l209_c4_5d3f_return_output,
 BIN_OP_AND_uxn_c_l210_c4_e9f3_return_output,
 BIN_OP_OR_uxn_c_l211_c4_e283_return_output,
 CONST_SL_8_uxn_c_l214_c4_90f3_return_output,
 BIN_OP_AND_uxn_c_l215_c4_fab1_return_output,
 BIN_OP_OR_uxn_c_l216_c4_a726_return_output,
 BIN_OP_EQ_uxn_c_l218_c12_1c9f_return_output,
 color_MUX_uxn_c_l218_c8_ca14_return_output,
 CONST_SL_8_uxn_c_l220_c4_2a79_return_output,
 BIN_OP_AND_uxn_c_l221_c4_2bf5_return_output,
 BIN_OP_OR_uxn_c_l222_c4_bfd0_return_output,
 CONST_SL_8_uxn_c_l225_c4_2adb_return_output,
 BIN_OP_AND_uxn_c_l226_c4_9b2a_return_output,
 BIN_OP_OR_uxn_c_l227_c4_03a7_return_output,
 BIN_OP_EQ_uxn_c_l229_c12_1ff9_return_output,
 color_MUX_uxn_c_l229_c8_5299_return_output,
 CONST_SL_4_uxn_c_l231_c4_23d8_return_output,
 BIN_OP_AND_uxn_c_l232_c4_9687_return_output,
 BIN_OP_OR_uxn_c_l233_c4_ddbf_return_output,
 CONST_SL_4_uxn_c_l236_c4_d607_return_output,
 BIN_OP_AND_uxn_c_l237_c4_d28b_return_output,
 BIN_OP_OR_uxn_c_l238_c4_1b2b_return_output,
 BIN_OP_EQ_uxn_c_l240_c12_8424_return_output,
 color_MUX_uxn_c_l240_c8_1304_return_output,
 CONST_SL_4_uxn_c_l242_c4_fcb1_return_output,
 BIN_OP_AND_uxn_c_l243_c4_f08d_return_output,
 BIN_OP_OR_uxn_c_l244_c4_d86d_return_output,
 CONST_SL_4_uxn_c_l247_c4_9386_return_output,
 BIN_OP_AND_uxn_c_l248_c4_5e4c_return_output,
 BIN_OP_OR_uxn_c_l249_c4_f53f_return_output,
 BIN_OP_EQ_uxn_c_l251_c12_65f6_return_output,
 color_MUX_uxn_c_l251_c8_ac82_return_output,
 BIN_OP_AND_uxn_c_l253_c4_63a8_return_output,
 BIN_OP_OR_uxn_c_l254_c4_8827_return_output,
 BIN_OP_AND_uxn_c_l257_c4_f47c_return_output,
 BIN_OP_OR_uxn_c_l258_c4_7171_return_output,
 BIN_OP_EQ_uxn_c_l260_c12_fc67_return_output,
 color_3_MUX_uxn_c_l260_c8_8251_return_output,
 color_2_MUX_uxn_c_l260_c8_8251_return_output,
 BIN_OP_AND_uxn_c_l262_c4_985f_return_output,
 BIN_OP_OR_uxn_c_l263_c4_8b39_return_output,
 BIN_OP_AND_uxn_c_l266_c4_8a66_return_output,
 BIN_OP_OR_uxn_c_l267_c4_10f2_return_output,
 VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l271_c20_57b3_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_device_ram_address : unsigned(7 downto 0);
 variable VAR_device_ram_value : unsigned(7 downto 0);
 variable VAR_is_device_ram_write : unsigned(0 downto 0);
 variable VAR_gpu_step_color : unsigned(1 downto 0);
 variable VAR_is_palette_range : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l199_c30_5983_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_4_uxn_c_l199_c30_8026_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l199_c30_d215_left : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_c_l199_c30_8026_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l199_c30_d215_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l199_c30_d215_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l199_c30_5983_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l199_c30_5983_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l199_c30_5983_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l201_c6_7154_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l201_c6_7154_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l201_c6_7154_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_c_l201_c2_f05f_iftrue : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l207_c3_b6f2_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l201_c2_f05f_iffalse : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l201_c2_f05f_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l201_c2_f05f_cond : unsigned(0 downto 0);
 variable VAR_tmp12 : unsigned(11 downto 0);
 variable VAR_addr_low : unsigned(3 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_c_l203_c22_55cb_return_output : unsigned(3 downto 0);
 variable VAR_color_cmp_0 : unsigned(3 downto 0);
 variable VAR_color_cmp_0_uxn_c_l204_c11_6379_0 : unsigned(3 downto 0);
 variable VAR_CONST_SR_4_uxn_c_l204_c35_f859_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_c_l204_c35_f859_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_c_l204_c25_044b_return_output : unsigned(3 downto 0);
 variable VAR_color_cmp_1 : unsigned(3 downto 0);
 variable VAR_color_cmp_1_uxn_c_l205_c11_4671_0 : unsigned(3 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_c_l205_c25_0ba8_return_output : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l207_c7_fef9_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l207_c7_fef9_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l207_c7_fef9_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_c_l207_c3_b6f2_iftrue : uint12_t_4;
 variable VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l207_c3_b6f2_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l207_c3_b6f2_iffalse : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l218_c8_ca14_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l207_c3_b6f2_cond : unsigned(0 downto 0);
 variable VAR_tmp12_uxn_c_l208_c4_87ca : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l209_c4_5d3f_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l209_c4_5d3f_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l210_c4_e9f3_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l210_c4_e9f3_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l210_c4_e9f3_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l211_c4_e283_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l211_c4_e283_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l211_c4_e283_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_uxn_c_l213_c4_8afc : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l214_c4_90f3_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l214_c4_90f3_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l215_c4_fab1_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l215_c4_fab1_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l215_c4_fab1_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l216_c4_a726_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l216_c4_a726_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l216_c4_a726_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l218_c12_1c9f_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l218_c12_1c9f_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l218_c12_1c9f_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_c_l218_c8_ca14_iftrue : uint12_t_4;
 variable VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l218_c8_ca14_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l218_c8_ca14_iffalse : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l229_c8_5299_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l218_c8_ca14_cond : unsigned(0 downto 0);
 variable VAR_tmp12_uxn_c_l219_c4_7208 : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l220_c4_2a79_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l220_c4_2a79_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l221_c4_2bf5_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l221_c4_2bf5_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l221_c4_2bf5_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l222_c4_bfd0_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l222_c4_bfd0_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l222_c4_bfd0_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_uxn_c_l224_c4_0edc : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l225_c4_2adb_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l225_c4_2adb_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l226_c4_9b2a_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l226_c4_9b2a_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l226_c4_9b2a_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l227_c4_03a7_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l227_c4_03a7_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l227_c4_03a7_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l229_c12_1ff9_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l229_c12_1ff9_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l229_c12_1ff9_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_c_l229_c8_5299_iftrue : uint12_t_4;
 variable VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l229_c8_5299_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l229_c8_5299_iffalse : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l240_c8_1304_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l229_c8_5299_cond : unsigned(0 downto 0);
 variable VAR_tmp12_uxn_c_l230_c4_c91b : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l231_c4_23d8_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l231_c4_23d8_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l232_c4_9687_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l232_c4_9687_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l232_c4_9687_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l233_c4_ddbf_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l233_c4_ddbf_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l233_c4_ddbf_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_uxn_c_l235_c4_c812 : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l236_c4_d607_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l236_c4_d607_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l237_c4_d28b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l237_c4_d28b_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l237_c4_d28b_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l238_c4_1b2b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l238_c4_1b2b_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l238_c4_1b2b_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l240_c12_8424_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l240_c12_8424_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l240_c12_8424_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_c_l240_c8_1304_iftrue : uint12_t_4;
 variable VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l240_c8_1304_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l240_c8_1304_iffalse : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l251_c8_ac82_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l240_c8_1304_cond : unsigned(0 downto 0);
 variable VAR_tmp12_uxn_c_l241_c4_abaf : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l242_c4_fcb1_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l242_c4_fcb1_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l243_c4_f08d_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l243_c4_f08d_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l243_c4_f08d_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l244_c4_d86d_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l244_c4_d86d_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l244_c4_d86d_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_uxn_c_l246_c4_0dde : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l247_c4_9386_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l247_c4_9386_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l248_c4_5e4c_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l248_c4_5e4c_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l248_c4_5e4c_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l249_c4_f53f_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l249_c4_f53f_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l249_c4_f53f_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l251_c12_65f6_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l251_c12_65f6_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l251_c12_65f6_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_c_l251_c8_ac82_iftrue : uint12_t_4;
 variable VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l251_c8_ac82_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l251_c8_ac82_iffalse : uint12_t_4;
 variable VAR_color_FALSE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_3db8_uxn_c_l251_c8_ac82_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l251_c8_ac82_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l253_c4_63a8_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l253_c4_63a8_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l253_c4_63a8_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l254_c4_8827_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l254_c4_8827_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l254_c4_8827_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l257_c4_f47c_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l257_c4_f47c_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l257_c4_f47c_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l258_c4_7171_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l258_c4_7171_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l258_c4_7171_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l260_c12_fc67_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l260_c12_fc67_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l260_c12_fc67_return_output : unsigned(0 downto 0);
 variable VAR_color_3_MUX_uxn_c_l260_c8_8251_iftrue : unsigned(11 downto 0);
 variable VAR_color_3_MUX_uxn_c_l260_c8_8251_iffalse : unsigned(11 downto 0);
 variable VAR_color_3_MUX_uxn_c_l260_c8_8251_return_output : unsigned(11 downto 0);
 variable VAR_color_3_MUX_uxn_c_l260_c8_8251_cond : unsigned(0 downto 0);
 variable VAR_color_2_MUX_uxn_c_l260_c8_8251_iftrue : unsigned(11 downto 0);
 variable VAR_color_2_MUX_uxn_c_l260_c8_8251_iffalse : unsigned(11 downto 0);
 variable VAR_color_2_MUX_uxn_c_l260_c8_8251_return_output : unsigned(11 downto 0);
 variable VAR_color_2_MUX_uxn_c_l260_c8_8251_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l262_c4_985f_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l262_c4_985f_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l262_c4_985f_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l263_c4_8b39_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l263_c4_8b39_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l263_c4_8b39_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l266_c4_8a66_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l266_c4_8a66_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l266_c4_8a66_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l267_c4_10f2_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l267_c4_10f2_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l267_c4_10f2_return_output : unsigned(11 downto 0);
 variable VAR_result : unsigned(15 downto 0);
 variable VAR_result_uxn_c_l271_c11_b3db_0 : unsigned(15 downto 0);
 variable VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l271_c20_57b3_var_dim_0 : unsigned(1 downto 0);
 variable VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l271_c20_57b3_return_output : unsigned(11 downto 0);
 variable VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l271_c20_57b3_ref_toks_0 : uint12_t_4;
 variable VAR_CONST_REF_RD_uint12_t_uint12_t_4_0_d41d_uxn_c_l253_l210_l232_DUPLICATE_0a26_return_output : unsigned(11 downto 0);
 variable VAR_CONST_REF_RD_uint12_t_uint12_t_4_1_d41d_uxn_c_l237_l257_l215_DUPLICATE_3eb8_return_output : unsigned(11 downto 0);
 variable VAR_CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_uxn_c_l260_l221_l262_l243_DUPLICATE_b922_return_output : unsigned(11 downto 0);
 variable VAR_CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_uxn_c_l266_l260_l248_l226_DUPLICATE_a39a_return_output : unsigned(11 downto 0);
 variable VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l252_l261_DUPLICATE_1792_return_output : unsigned(11 downto 0);
 variable VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l265_l256_DUPLICATE_46b8_return_output : unsigned(11 downto 0);
 -- State registers comb logic variables
variable REG_VAR_color : uint12_t_4;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_color := color;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_c_l240_c12_8424_right := to_unsigned(11, 4);
     VAR_BIN_OP_AND_uxn_c_l210_c4_e9f3_right := to_unsigned(255, 12);
     VAR_BIN_OP_AND_uxn_c_l226_c4_9b2a_right := to_unsigned(255, 12);
     VAR_BIN_OP_AND_uxn_c_l215_c4_fab1_right := to_unsigned(255, 12);
     VAR_BIN_OP_AND_uxn_c_l262_c4_985f_right := to_unsigned(4080, 12);
     VAR_BIN_OP_EQ_uxn_c_l207_c7_fef9_right := to_unsigned(8, 4);
     VAR_BIN_OP_AND_uxn_c_l221_c4_2bf5_right := to_unsigned(255, 12);
     VAR_BIN_OP_AND_uxn_c_l248_c4_5e4c_right := to_unsigned(3855, 12);
     VAR_BIN_OP_AND_uxn_c_l257_c4_f47c_right := to_unsigned(4080, 12);
     VAR_BIN_OP_EQ_uxn_c_l229_c12_1ff9_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_c_l199_c30_d215_right := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_c_l232_c4_9687_right := to_unsigned(3855, 12);
     VAR_BIN_OP_AND_uxn_c_l253_c4_63a8_right := to_unsigned(4080, 12);
     VAR_BIN_OP_EQ_uxn_c_l251_c12_65f6_right := to_unsigned(12, 4);
     VAR_BIN_OP_EQ_uxn_c_l218_c12_1c9f_right := to_unsigned(9, 4);
     VAR_MUX_uxn_c_l199_c30_5983_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l199_c30_5983_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_c_l243_c4_f08d_right := to_unsigned(3855, 12);
     VAR_BIN_OP_EQ_uxn_c_l260_c12_fc67_right := to_unsigned(13, 4);
     VAR_BIN_OP_AND_uxn_c_l237_c4_d28b_right := to_unsigned(3855, 12);
     VAR_BIN_OP_AND_uxn_c_l266_c4_8a66_right := to_unsigned(4080, 12);

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
     VAR_color_MUX_uxn_c_l201_c2_f05f_iffalse := color;
     VAR_CONST_SR_4_uxn_c_l199_c30_8026_x := VAR_device_ram_address;
     VAR_CONST_SR_4_uxn_c_l204_c35_f859_x := VAR_device_ram_value;
     VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l271_c20_57b3_var_dim_0 := VAR_gpu_step_color;
     VAR_BIN_OP_AND_uxn_c_l201_c6_7154_left := VAR_is_device_ram_write;
     -- CONST_SR_4[uxn_c_l204_c35_f859] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_c_l204_c35_f859_x <= VAR_CONST_SR_4_uxn_c_l204_c35_f859_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_c_l204_c35_f859_return_output := CONST_SR_4_uxn_c_l204_c35_f859_return_output;

     -- CONST_REF_RD_uint12_t_uint12_t_4_1_d41d_uxn_c_l237_l257_l215_DUPLICATE_3eb8 LATENCY=0
     VAR_CONST_REF_RD_uint12_t_uint12_t_4_1_d41d_uxn_c_l237_l257_l215_DUPLICATE_3eb8_return_output := color(1);

     -- CONST_REF_RD_uint12_t_uint12_t_4_0_d41d_uxn_c_l253_l210_l232_DUPLICATE_0a26 LATENCY=0
     VAR_CONST_REF_RD_uint12_t_uint12_t_4_0_d41d_uxn_c_l253_l210_l232_DUPLICATE_0a26_return_output := color(0);

     -- CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_uxn_c_l266_l260_l248_l226_DUPLICATE_a39a LATENCY=0
     VAR_CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_uxn_c_l266_l260_l248_l226_DUPLICATE_a39a_return_output := color(3);

     -- CAST_TO_uint4_t[uxn_c_l205_c25_0ba8] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_c_l205_c25_0ba8_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_device_ram_value);

     -- CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_uxn_c_l260_l221_l262_l243_DUPLICATE_b922 LATENCY=0
     VAR_CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_uxn_c_l260_l221_l262_l243_DUPLICATE_b922_return_output := color(2);

     -- CONST_SR_4[uxn_c_l199_c30_8026] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_c_l199_c30_8026_x <= VAR_CONST_SR_4_uxn_c_l199_c30_8026_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_c_l199_c30_8026_return_output := CONST_SR_4_uxn_c_l199_c30_8026_return_output;

     -- CAST_TO_uint4_t[uxn_c_l203_c22_55cb] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_c_l203_c22_55cb_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_device_ram_address);

     -- Submodule level 1
     VAR_BIN_OP_EQ_uxn_c_l207_c7_fef9_left := VAR_CAST_TO_uint4_t_uxn_c_l203_c22_55cb_return_output;
     VAR_BIN_OP_EQ_uxn_c_l218_c12_1c9f_left := VAR_CAST_TO_uint4_t_uxn_c_l203_c22_55cb_return_output;
     VAR_BIN_OP_EQ_uxn_c_l229_c12_1ff9_left := VAR_CAST_TO_uint4_t_uxn_c_l203_c22_55cb_return_output;
     VAR_BIN_OP_EQ_uxn_c_l240_c12_8424_left := VAR_CAST_TO_uint4_t_uxn_c_l203_c22_55cb_return_output;
     VAR_BIN_OP_EQ_uxn_c_l251_c12_65f6_left := VAR_CAST_TO_uint4_t_uxn_c_l203_c22_55cb_return_output;
     VAR_BIN_OP_EQ_uxn_c_l260_c12_fc67_left := VAR_CAST_TO_uint4_t_uxn_c_l203_c22_55cb_return_output;
     VAR_color_cmp_1_uxn_c_l205_c11_4671_0 := VAR_CAST_TO_uint4_t_uxn_c_l205_c25_0ba8_return_output;
     VAR_BIN_OP_AND_uxn_c_l210_c4_e9f3_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_0_d41d_uxn_c_l253_l210_l232_DUPLICATE_0a26_return_output;
     VAR_BIN_OP_AND_uxn_c_l232_c4_9687_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_0_d41d_uxn_c_l253_l210_l232_DUPLICATE_0a26_return_output;
     VAR_BIN_OP_AND_uxn_c_l253_c4_63a8_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_0_d41d_uxn_c_l253_l210_l232_DUPLICATE_0a26_return_output;
     VAR_BIN_OP_AND_uxn_c_l215_c4_fab1_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_1_d41d_uxn_c_l237_l257_l215_DUPLICATE_3eb8_return_output;
     VAR_BIN_OP_AND_uxn_c_l237_c4_d28b_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_1_d41d_uxn_c_l237_l257_l215_DUPLICATE_3eb8_return_output;
     VAR_BIN_OP_AND_uxn_c_l257_c4_f47c_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_1_d41d_uxn_c_l237_l257_l215_DUPLICATE_3eb8_return_output;
     VAR_BIN_OP_AND_uxn_c_l221_c4_2bf5_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_uxn_c_l260_l221_l262_l243_DUPLICATE_b922_return_output;
     VAR_BIN_OP_AND_uxn_c_l243_c4_f08d_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_uxn_c_l260_l221_l262_l243_DUPLICATE_b922_return_output;
     VAR_BIN_OP_AND_uxn_c_l262_c4_985f_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_uxn_c_l260_l221_l262_l243_DUPLICATE_b922_return_output;
     VAR_color_2_MUX_uxn_c_l260_c8_8251_iffalse := VAR_CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_uxn_c_l260_l221_l262_l243_DUPLICATE_b922_return_output;
     VAR_BIN_OP_AND_uxn_c_l226_c4_9b2a_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_uxn_c_l266_l260_l248_l226_DUPLICATE_a39a_return_output;
     VAR_BIN_OP_AND_uxn_c_l248_c4_5e4c_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_uxn_c_l266_l260_l248_l226_DUPLICATE_a39a_return_output;
     VAR_BIN_OP_AND_uxn_c_l266_c4_8a66_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_uxn_c_l266_l260_l248_l226_DUPLICATE_a39a_return_output;
     VAR_color_3_MUX_uxn_c_l260_c8_8251_iffalse := VAR_CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_uxn_c_l266_l260_l248_l226_DUPLICATE_a39a_return_output;
     VAR_BIN_OP_EQ_uxn_c_l199_c30_d215_left := VAR_CONST_SR_4_uxn_c_l199_c30_8026_return_output;
     VAR_tmp12_uxn_c_l213_c4_8afc := resize(VAR_color_cmp_1_uxn_c_l205_c11_4671_0, 12);
     VAR_tmp12_uxn_c_l224_c4_0edc := resize(VAR_color_cmp_1_uxn_c_l205_c11_4671_0, 12);
     VAR_tmp12_uxn_c_l235_c4_c812 := resize(VAR_color_cmp_1_uxn_c_l205_c11_4671_0, 12);
     VAR_tmp12_uxn_c_l246_c4_0dde := resize(VAR_color_cmp_1_uxn_c_l205_c11_4671_0, 12);
     VAR_CONST_SL_8_uxn_c_l214_c4_90f3_x := VAR_tmp12_uxn_c_l213_c4_8afc;
     VAR_CONST_SL_8_uxn_c_l225_c4_2adb_x := VAR_tmp12_uxn_c_l224_c4_0edc;
     VAR_CONST_SL_4_uxn_c_l236_c4_d607_x := VAR_tmp12_uxn_c_l235_c4_c812;
     VAR_CONST_SL_4_uxn_c_l247_c4_9386_x := VAR_tmp12_uxn_c_l246_c4_0dde;
     -- BIN_OP_EQ[uxn_c_l260_c12_fc67] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l260_c12_fc67_left <= VAR_BIN_OP_EQ_uxn_c_l260_c12_fc67_left;
     BIN_OP_EQ_uxn_c_l260_c12_fc67_right <= VAR_BIN_OP_EQ_uxn_c_l260_c12_fc67_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l260_c12_fc67_return_output := BIN_OP_EQ_uxn_c_l260_c12_fc67_return_output;

     -- CONST_SL_4[uxn_c_l247_c4_9386] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_c_l247_c4_9386_x <= VAR_CONST_SL_4_uxn_c_l247_c4_9386_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_c_l247_c4_9386_return_output := CONST_SL_4_uxn_c_l247_c4_9386_return_output;

     -- BIN_OP_AND[uxn_c_l210_c4_e9f3] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l210_c4_e9f3_left <= VAR_BIN_OP_AND_uxn_c_l210_c4_e9f3_left;
     BIN_OP_AND_uxn_c_l210_c4_e9f3_right <= VAR_BIN_OP_AND_uxn_c_l210_c4_e9f3_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l210_c4_e9f3_return_output := BIN_OP_AND_uxn_c_l210_c4_e9f3_return_output;

     -- CAST_TO_uint4_t[uxn_c_l204_c25_044b] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_c_l204_c25_044b_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_CONST_SR_4_uxn_c_l204_c35_f859_return_output);

     -- BIN_OP_AND[uxn_c_l253_c4_63a8] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l253_c4_63a8_left <= VAR_BIN_OP_AND_uxn_c_l253_c4_63a8_left;
     BIN_OP_AND_uxn_c_l253_c4_63a8_right <= VAR_BIN_OP_AND_uxn_c_l253_c4_63a8_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l253_c4_63a8_return_output := BIN_OP_AND_uxn_c_l253_c4_63a8_return_output;

     -- BIN_OP_AND[uxn_c_l243_c4_f08d] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l243_c4_f08d_left <= VAR_BIN_OP_AND_uxn_c_l243_c4_f08d_left;
     BIN_OP_AND_uxn_c_l243_c4_f08d_right <= VAR_BIN_OP_AND_uxn_c_l243_c4_f08d_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l243_c4_f08d_return_output := BIN_OP_AND_uxn_c_l243_c4_f08d_return_output;

     -- BIN_OP_EQ[uxn_c_l218_c12_1c9f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l218_c12_1c9f_left <= VAR_BIN_OP_EQ_uxn_c_l218_c12_1c9f_left;
     BIN_OP_EQ_uxn_c_l218_c12_1c9f_right <= VAR_BIN_OP_EQ_uxn_c_l218_c12_1c9f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l218_c12_1c9f_return_output := BIN_OP_EQ_uxn_c_l218_c12_1c9f_return_output;

     -- BIN_OP_EQ[uxn_c_l240_c12_8424] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l240_c12_8424_left <= VAR_BIN_OP_EQ_uxn_c_l240_c12_8424_left;
     BIN_OP_EQ_uxn_c_l240_c12_8424_right <= VAR_BIN_OP_EQ_uxn_c_l240_c12_8424_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l240_c12_8424_return_output := BIN_OP_EQ_uxn_c_l240_c12_8424_return_output;

     -- BIN_OP_AND[uxn_c_l237_c4_d28b] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l237_c4_d28b_left <= VAR_BIN_OP_AND_uxn_c_l237_c4_d28b_left;
     BIN_OP_AND_uxn_c_l237_c4_d28b_right <= VAR_BIN_OP_AND_uxn_c_l237_c4_d28b_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l237_c4_d28b_return_output := BIN_OP_AND_uxn_c_l237_c4_d28b_return_output;

     -- BIN_OP_AND[uxn_c_l226_c4_9b2a] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l226_c4_9b2a_left <= VAR_BIN_OP_AND_uxn_c_l226_c4_9b2a_left;
     BIN_OP_AND_uxn_c_l226_c4_9b2a_right <= VAR_BIN_OP_AND_uxn_c_l226_c4_9b2a_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l226_c4_9b2a_return_output := BIN_OP_AND_uxn_c_l226_c4_9b2a_return_output;

     -- CONST_SL_8[uxn_c_l214_c4_90f3] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l214_c4_90f3_x <= VAR_CONST_SL_8_uxn_c_l214_c4_90f3_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l214_c4_90f3_return_output := CONST_SL_8_uxn_c_l214_c4_90f3_return_output;

     -- BIN_OP_AND[uxn_c_l248_c4_5e4c] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l248_c4_5e4c_left <= VAR_BIN_OP_AND_uxn_c_l248_c4_5e4c_left;
     BIN_OP_AND_uxn_c_l248_c4_5e4c_right <= VAR_BIN_OP_AND_uxn_c_l248_c4_5e4c_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l248_c4_5e4c_return_output := BIN_OP_AND_uxn_c_l248_c4_5e4c_return_output;

     -- BIN_OP_AND[uxn_c_l262_c4_985f] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l262_c4_985f_left <= VAR_BIN_OP_AND_uxn_c_l262_c4_985f_left;
     BIN_OP_AND_uxn_c_l262_c4_985f_right <= VAR_BIN_OP_AND_uxn_c_l262_c4_985f_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l262_c4_985f_return_output := BIN_OP_AND_uxn_c_l262_c4_985f_return_output;

     -- BIN_OP_EQ[uxn_c_l251_c12_65f6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l251_c12_65f6_left <= VAR_BIN_OP_EQ_uxn_c_l251_c12_65f6_left;
     BIN_OP_EQ_uxn_c_l251_c12_65f6_right <= VAR_BIN_OP_EQ_uxn_c_l251_c12_65f6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l251_c12_65f6_return_output := BIN_OP_EQ_uxn_c_l251_c12_65f6_return_output;

     -- BIN_OP_AND[uxn_c_l266_c4_8a66] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l266_c4_8a66_left <= VAR_BIN_OP_AND_uxn_c_l266_c4_8a66_left;
     BIN_OP_AND_uxn_c_l266_c4_8a66_right <= VAR_BIN_OP_AND_uxn_c_l266_c4_8a66_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l266_c4_8a66_return_output := BIN_OP_AND_uxn_c_l266_c4_8a66_return_output;

     -- BIN_OP_AND[uxn_c_l257_c4_f47c] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l257_c4_f47c_left <= VAR_BIN_OP_AND_uxn_c_l257_c4_f47c_left;
     BIN_OP_AND_uxn_c_l257_c4_f47c_right <= VAR_BIN_OP_AND_uxn_c_l257_c4_f47c_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l257_c4_f47c_return_output := BIN_OP_AND_uxn_c_l257_c4_f47c_return_output;

     -- BIN_OP_EQ[uxn_c_l207_c7_fef9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l207_c7_fef9_left <= VAR_BIN_OP_EQ_uxn_c_l207_c7_fef9_left;
     BIN_OP_EQ_uxn_c_l207_c7_fef9_right <= VAR_BIN_OP_EQ_uxn_c_l207_c7_fef9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l207_c7_fef9_return_output := BIN_OP_EQ_uxn_c_l207_c7_fef9_return_output;

     -- BIN_OP_EQ[uxn_c_l199_c30_d215] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l199_c30_d215_left <= VAR_BIN_OP_EQ_uxn_c_l199_c30_d215_left;
     BIN_OP_EQ_uxn_c_l199_c30_d215_right <= VAR_BIN_OP_EQ_uxn_c_l199_c30_d215_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l199_c30_d215_return_output := BIN_OP_EQ_uxn_c_l199_c30_d215_return_output;

     -- BIN_OP_AND[uxn_c_l221_c4_2bf5] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l221_c4_2bf5_left <= VAR_BIN_OP_AND_uxn_c_l221_c4_2bf5_left;
     BIN_OP_AND_uxn_c_l221_c4_2bf5_right <= VAR_BIN_OP_AND_uxn_c_l221_c4_2bf5_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l221_c4_2bf5_return_output := BIN_OP_AND_uxn_c_l221_c4_2bf5_return_output;

     -- BIN_OP_AND[uxn_c_l232_c4_9687] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l232_c4_9687_left <= VAR_BIN_OP_AND_uxn_c_l232_c4_9687_left;
     BIN_OP_AND_uxn_c_l232_c4_9687_right <= VAR_BIN_OP_AND_uxn_c_l232_c4_9687_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l232_c4_9687_return_output := BIN_OP_AND_uxn_c_l232_c4_9687_return_output;

     -- CONST_SL_8[uxn_c_l225_c4_2adb] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l225_c4_2adb_x <= VAR_CONST_SL_8_uxn_c_l225_c4_2adb_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l225_c4_2adb_return_output := CONST_SL_8_uxn_c_l225_c4_2adb_return_output;

     -- CONST_SL_4[uxn_c_l236_c4_d607] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_c_l236_c4_d607_x <= VAR_CONST_SL_4_uxn_c_l236_c4_d607_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_c_l236_c4_d607_return_output := CONST_SL_4_uxn_c_l236_c4_d607_return_output;

     -- BIN_OP_EQ[uxn_c_l229_c12_1ff9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l229_c12_1ff9_left <= VAR_BIN_OP_EQ_uxn_c_l229_c12_1ff9_left;
     BIN_OP_EQ_uxn_c_l229_c12_1ff9_right <= VAR_BIN_OP_EQ_uxn_c_l229_c12_1ff9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l229_c12_1ff9_return_output := BIN_OP_EQ_uxn_c_l229_c12_1ff9_return_output;

     -- CAST_TO_uint12_t_uint4_t_uxn_c_l265_l256_DUPLICATE_46b8 LATENCY=0
     VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l265_l256_DUPLICATE_46b8_return_output := CAST_TO_uint12_t_uint4_t(
     VAR_color_cmp_1_uxn_c_l205_c11_4671_0);

     -- BIN_OP_AND[uxn_c_l215_c4_fab1] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l215_c4_fab1_left <= VAR_BIN_OP_AND_uxn_c_l215_c4_fab1_left;
     BIN_OP_AND_uxn_c_l215_c4_fab1_right <= VAR_BIN_OP_AND_uxn_c_l215_c4_fab1_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l215_c4_fab1_return_output := BIN_OP_AND_uxn_c_l215_c4_fab1_return_output;

     -- Submodule level 2
     VAR_BIN_OP_OR_uxn_c_l211_c4_e283_left := VAR_BIN_OP_AND_uxn_c_l210_c4_e9f3_return_output;
     VAR_BIN_OP_OR_uxn_c_l216_c4_a726_left := VAR_BIN_OP_AND_uxn_c_l215_c4_fab1_return_output;
     VAR_BIN_OP_OR_uxn_c_l222_c4_bfd0_left := VAR_BIN_OP_AND_uxn_c_l221_c4_2bf5_return_output;
     VAR_BIN_OP_OR_uxn_c_l227_c4_03a7_left := VAR_BIN_OP_AND_uxn_c_l226_c4_9b2a_return_output;
     VAR_BIN_OP_OR_uxn_c_l233_c4_ddbf_left := VAR_BIN_OP_AND_uxn_c_l232_c4_9687_return_output;
     VAR_BIN_OP_OR_uxn_c_l238_c4_1b2b_left := VAR_BIN_OP_AND_uxn_c_l237_c4_d28b_return_output;
     VAR_BIN_OP_OR_uxn_c_l244_c4_d86d_left := VAR_BIN_OP_AND_uxn_c_l243_c4_f08d_return_output;
     VAR_BIN_OP_OR_uxn_c_l249_c4_f53f_left := VAR_BIN_OP_AND_uxn_c_l248_c4_5e4c_return_output;
     VAR_BIN_OP_OR_uxn_c_l254_c4_8827_left := VAR_BIN_OP_AND_uxn_c_l253_c4_63a8_return_output;
     VAR_BIN_OP_OR_uxn_c_l258_c4_7171_left := VAR_BIN_OP_AND_uxn_c_l257_c4_f47c_return_output;
     VAR_BIN_OP_OR_uxn_c_l263_c4_8b39_left := VAR_BIN_OP_AND_uxn_c_l262_c4_985f_return_output;
     VAR_BIN_OP_OR_uxn_c_l267_c4_10f2_left := VAR_BIN_OP_AND_uxn_c_l266_c4_8a66_return_output;
     VAR_MUX_uxn_c_l199_c30_5983_cond := VAR_BIN_OP_EQ_uxn_c_l199_c30_d215_return_output;
     VAR_color_MUX_uxn_c_l207_c3_b6f2_cond := VAR_BIN_OP_EQ_uxn_c_l207_c7_fef9_return_output;
     VAR_color_MUX_uxn_c_l218_c8_ca14_cond := VAR_BIN_OP_EQ_uxn_c_l218_c12_1c9f_return_output;
     VAR_color_MUX_uxn_c_l229_c8_5299_cond := VAR_BIN_OP_EQ_uxn_c_l229_c12_1ff9_return_output;
     VAR_color_MUX_uxn_c_l240_c8_1304_cond := VAR_BIN_OP_EQ_uxn_c_l240_c12_8424_return_output;
     VAR_color_MUX_uxn_c_l251_c8_ac82_cond := VAR_BIN_OP_EQ_uxn_c_l251_c12_65f6_return_output;
     VAR_color_2_MUX_uxn_c_l260_c8_8251_cond := VAR_BIN_OP_EQ_uxn_c_l260_c12_fc67_return_output;
     VAR_color_3_MUX_uxn_c_l260_c8_8251_cond := VAR_BIN_OP_EQ_uxn_c_l260_c12_fc67_return_output;
     VAR_BIN_OP_OR_uxn_c_l258_c4_7171_right := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l265_l256_DUPLICATE_46b8_return_output;
     VAR_BIN_OP_OR_uxn_c_l267_c4_10f2_right := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l265_l256_DUPLICATE_46b8_return_output;
     VAR_color_cmp_0_uxn_c_l204_c11_6379_0 := VAR_CAST_TO_uint4_t_uxn_c_l204_c25_044b_return_output;
     VAR_BIN_OP_OR_uxn_c_l238_c4_1b2b_right := VAR_CONST_SL_4_uxn_c_l236_c4_d607_return_output;
     VAR_BIN_OP_OR_uxn_c_l249_c4_f53f_right := VAR_CONST_SL_4_uxn_c_l247_c4_9386_return_output;
     VAR_BIN_OP_OR_uxn_c_l216_c4_a726_right := VAR_CONST_SL_8_uxn_c_l214_c4_90f3_return_output;
     VAR_BIN_OP_OR_uxn_c_l227_c4_03a7_right := VAR_CONST_SL_8_uxn_c_l225_c4_2adb_return_output;
     VAR_tmp12_uxn_c_l208_c4_87ca := resize(VAR_color_cmp_0_uxn_c_l204_c11_6379_0, 12);
     VAR_tmp12_uxn_c_l219_c4_7208 := resize(VAR_color_cmp_0_uxn_c_l204_c11_6379_0, 12);
     VAR_tmp12_uxn_c_l230_c4_c91b := resize(VAR_color_cmp_0_uxn_c_l204_c11_6379_0, 12);
     VAR_tmp12_uxn_c_l241_c4_abaf := resize(VAR_color_cmp_0_uxn_c_l204_c11_6379_0, 12);
     VAR_CONST_SL_8_uxn_c_l209_c4_5d3f_x := VAR_tmp12_uxn_c_l208_c4_87ca;
     VAR_CONST_SL_8_uxn_c_l220_c4_2a79_x := VAR_tmp12_uxn_c_l219_c4_7208;
     VAR_CONST_SL_4_uxn_c_l231_c4_23d8_x := VAR_tmp12_uxn_c_l230_c4_c91b;
     VAR_CONST_SL_4_uxn_c_l242_c4_fcb1_x := VAR_tmp12_uxn_c_l241_c4_abaf;
     -- BIN_OP_OR[uxn_c_l238_c4_1b2b] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l238_c4_1b2b_left <= VAR_BIN_OP_OR_uxn_c_l238_c4_1b2b_left;
     BIN_OP_OR_uxn_c_l238_c4_1b2b_right <= VAR_BIN_OP_OR_uxn_c_l238_c4_1b2b_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l238_c4_1b2b_return_output := BIN_OP_OR_uxn_c_l238_c4_1b2b_return_output;

     -- CONST_SL_4[uxn_c_l231_c4_23d8] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_c_l231_c4_23d8_x <= VAR_CONST_SL_4_uxn_c_l231_c4_23d8_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_c_l231_c4_23d8_return_output := CONST_SL_4_uxn_c_l231_c4_23d8_return_output;

     -- CAST_TO_uint12_t_uint4_t_uxn_c_l252_l261_DUPLICATE_1792 LATENCY=0
     VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l252_l261_DUPLICATE_1792_return_output := CAST_TO_uint12_t_uint4_t(
     VAR_color_cmp_0_uxn_c_l204_c11_6379_0);

     -- BIN_OP_OR[uxn_c_l216_c4_a726] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l216_c4_a726_left <= VAR_BIN_OP_OR_uxn_c_l216_c4_a726_left;
     BIN_OP_OR_uxn_c_l216_c4_a726_right <= VAR_BIN_OP_OR_uxn_c_l216_c4_a726_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l216_c4_a726_return_output := BIN_OP_OR_uxn_c_l216_c4_a726_return_output;

     -- BIN_OP_OR[uxn_c_l227_c4_03a7] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l227_c4_03a7_left <= VAR_BIN_OP_OR_uxn_c_l227_c4_03a7_left;
     BIN_OP_OR_uxn_c_l227_c4_03a7_right <= VAR_BIN_OP_OR_uxn_c_l227_c4_03a7_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l227_c4_03a7_return_output := BIN_OP_OR_uxn_c_l227_c4_03a7_return_output;

     -- CONST_SL_4[uxn_c_l242_c4_fcb1] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_c_l242_c4_fcb1_x <= VAR_CONST_SL_4_uxn_c_l242_c4_fcb1_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_c_l242_c4_fcb1_return_output := CONST_SL_4_uxn_c_l242_c4_fcb1_return_output;

     -- BIN_OP_OR[uxn_c_l249_c4_f53f] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l249_c4_f53f_left <= VAR_BIN_OP_OR_uxn_c_l249_c4_f53f_left;
     BIN_OP_OR_uxn_c_l249_c4_f53f_right <= VAR_BIN_OP_OR_uxn_c_l249_c4_f53f_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l249_c4_f53f_return_output := BIN_OP_OR_uxn_c_l249_c4_f53f_return_output;

     -- CONST_SL_8[uxn_c_l220_c4_2a79] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l220_c4_2a79_x <= VAR_CONST_SL_8_uxn_c_l220_c4_2a79_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l220_c4_2a79_return_output := CONST_SL_8_uxn_c_l220_c4_2a79_return_output;

     -- BIN_OP_OR[uxn_c_l258_c4_7171] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l258_c4_7171_left <= VAR_BIN_OP_OR_uxn_c_l258_c4_7171_left;
     BIN_OP_OR_uxn_c_l258_c4_7171_right <= VAR_BIN_OP_OR_uxn_c_l258_c4_7171_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l258_c4_7171_return_output := BIN_OP_OR_uxn_c_l258_c4_7171_return_output;

     -- BIN_OP_OR[uxn_c_l267_c4_10f2] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l267_c4_10f2_left <= VAR_BIN_OP_OR_uxn_c_l267_c4_10f2_left;
     BIN_OP_OR_uxn_c_l267_c4_10f2_right <= VAR_BIN_OP_OR_uxn_c_l267_c4_10f2_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l267_c4_10f2_return_output := BIN_OP_OR_uxn_c_l267_c4_10f2_return_output;

     -- CONST_SL_8[uxn_c_l209_c4_5d3f] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l209_c4_5d3f_x <= VAR_CONST_SL_8_uxn_c_l209_c4_5d3f_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l209_c4_5d3f_return_output := CONST_SL_8_uxn_c_l209_c4_5d3f_return_output;

     -- MUX[uxn_c_l199_c30_5983] LATENCY=0
     -- Inputs
     MUX_uxn_c_l199_c30_5983_cond <= VAR_MUX_uxn_c_l199_c30_5983_cond;
     MUX_uxn_c_l199_c30_5983_iftrue <= VAR_MUX_uxn_c_l199_c30_5983_iftrue;
     MUX_uxn_c_l199_c30_5983_iffalse <= VAR_MUX_uxn_c_l199_c30_5983_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l199_c30_5983_return_output := MUX_uxn_c_l199_c30_5983_return_output;

     -- Submodule level 3
     VAR_color_3_MUX_uxn_c_l260_c8_8251_iftrue := VAR_BIN_OP_OR_uxn_c_l267_c4_10f2_return_output;
     VAR_BIN_OP_OR_uxn_c_l254_c4_8827_right := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l252_l261_DUPLICATE_1792_return_output;
     VAR_BIN_OP_OR_uxn_c_l263_c4_8b39_right := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l252_l261_DUPLICATE_1792_return_output;
     VAR_BIN_OP_OR_uxn_c_l233_c4_ddbf_right := VAR_CONST_SL_4_uxn_c_l231_c4_23d8_return_output;
     VAR_BIN_OP_OR_uxn_c_l244_c4_d86d_right := VAR_CONST_SL_4_uxn_c_l242_c4_fcb1_return_output;
     VAR_BIN_OP_OR_uxn_c_l211_c4_e283_right := VAR_CONST_SL_8_uxn_c_l209_c4_5d3f_return_output;
     VAR_BIN_OP_OR_uxn_c_l222_c4_bfd0_right := VAR_CONST_SL_8_uxn_c_l220_c4_2a79_return_output;
     VAR_BIN_OP_AND_uxn_c_l201_c6_7154_right := VAR_MUX_uxn_c_l199_c30_5983_return_output;
     -- color_3_MUX[uxn_c_l260_c8_8251] LATENCY=0
     -- Inputs
     color_3_MUX_uxn_c_l260_c8_8251_cond <= VAR_color_3_MUX_uxn_c_l260_c8_8251_cond;
     color_3_MUX_uxn_c_l260_c8_8251_iftrue <= VAR_color_3_MUX_uxn_c_l260_c8_8251_iftrue;
     color_3_MUX_uxn_c_l260_c8_8251_iffalse <= VAR_color_3_MUX_uxn_c_l260_c8_8251_iffalse;
     -- Outputs
     VAR_color_3_MUX_uxn_c_l260_c8_8251_return_output := color_3_MUX_uxn_c_l260_c8_8251_return_output;

     -- BIN_OP_OR[uxn_c_l222_c4_bfd0] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l222_c4_bfd0_left <= VAR_BIN_OP_OR_uxn_c_l222_c4_bfd0_left;
     BIN_OP_OR_uxn_c_l222_c4_bfd0_right <= VAR_BIN_OP_OR_uxn_c_l222_c4_bfd0_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l222_c4_bfd0_return_output := BIN_OP_OR_uxn_c_l222_c4_bfd0_return_output;

     -- BIN_OP_OR[uxn_c_l244_c4_d86d] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l244_c4_d86d_left <= VAR_BIN_OP_OR_uxn_c_l244_c4_d86d_left;
     BIN_OP_OR_uxn_c_l244_c4_d86d_right <= VAR_BIN_OP_OR_uxn_c_l244_c4_d86d_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l244_c4_d86d_return_output := BIN_OP_OR_uxn_c_l244_c4_d86d_return_output;

     -- BIN_OP_AND[uxn_c_l201_c6_7154] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l201_c6_7154_left <= VAR_BIN_OP_AND_uxn_c_l201_c6_7154_left;
     BIN_OP_AND_uxn_c_l201_c6_7154_right <= VAR_BIN_OP_AND_uxn_c_l201_c6_7154_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l201_c6_7154_return_output := BIN_OP_AND_uxn_c_l201_c6_7154_return_output;

     -- BIN_OP_OR[uxn_c_l254_c4_8827] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l254_c4_8827_left <= VAR_BIN_OP_OR_uxn_c_l254_c4_8827_left;
     BIN_OP_OR_uxn_c_l254_c4_8827_right <= VAR_BIN_OP_OR_uxn_c_l254_c4_8827_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l254_c4_8827_return_output := BIN_OP_OR_uxn_c_l254_c4_8827_return_output;

     -- BIN_OP_OR[uxn_c_l263_c4_8b39] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l263_c4_8b39_left <= VAR_BIN_OP_OR_uxn_c_l263_c4_8b39_left;
     BIN_OP_OR_uxn_c_l263_c4_8b39_right <= VAR_BIN_OP_OR_uxn_c_l263_c4_8b39_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l263_c4_8b39_return_output := BIN_OP_OR_uxn_c_l263_c4_8b39_return_output;

     -- BIN_OP_OR[uxn_c_l233_c4_ddbf] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l233_c4_ddbf_left <= VAR_BIN_OP_OR_uxn_c_l233_c4_ddbf_left;
     BIN_OP_OR_uxn_c_l233_c4_ddbf_right <= VAR_BIN_OP_OR_uxn_c_l233_c4_ddbf_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l233_c4_ddbf_return_output := BIN_OP_OR_uxn_c_l233_c4_ddbf_return_output;

     -- BIN_OP_OR[uxn_c_l211_c4_e283] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l211_c4_e283_left <= VAR_BIN_OP_OR_uxn_c_l211_c4_e283_left;
     BIN_OP_OR_uxn_c_l211_c4_e283_right <= VAR_BIN_OP_OR_uxn_c_l211_c4_e283_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l211_c4_e283_return_output := BIN_OP_OR_uxn_c_l211_c4_e283_return_output;

     -- Submodule level 4
     VAR_color_MUX_uxn_c_l201_c2_f05f_cond := VAR_BIN_OP_AND_uxn_c_l201_c6_7154_return_output;
     VAR_color_2_MUX_uxn_c_l260_c8_8251_iftrue := VAR_BIN_OP_OR_uxn_c_l263_c4_8b39_return_output;
     -- color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5[uxn_c_l218_c8_ca14] LATENCY=0
     VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l218_c8_ca14_return_output := CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5(
     color,
     VAR_BIN_OP_OR_uxn_c_l222_c4_bfd0_return_output,
     VAR_BIN_OP_OR_uxn_c_l227_c4_03a7_return_output);

     -- color_2_MUX[uxn_c_l260_c8_8251] LATENCY=0
     -- Inputs
     color_2_MUX_uxn_c_l260_c8_8251_cond <= VAR_color_2_MUX_uxn_c_l260_c8_8251_cond;
     color_2_MUX_uxn_c_l260_c8_8251_iftrue <= VAR_color_2_MUX_uxn_c_l260_c8_8251_iftrue;
     color_2_MUX_uxn_c_l260_c8_8251_iffalse <= VAR_color_2_MUX_uxn_c_l260_c8_8251_iffalse;
     -- Outputs
     VAR_color_2_MUX_uxn_c_l260_c8_8251_return_output := color_2_MUX_uxn_c_l260_c8_8251_return_output;

     -- color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8[uxn_c_l207_c3_b6f2] LATENCY=0
     VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l207_c3_b6f2_return_output := CONST_REF_RD_uint12_t_4_uint12_t_4_90b8(
     color,
     VAR_BIN_OP_OR_uxn_c_l211_c4_e283_return_output,
     VAR_BIN_OP_OR_uxn_c_l216_c4_a726_return_output);

     -- color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8[uxn_c_l251_c8_ac82] LATENCY=0
     VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l251_c8_ac82_return_output := CONST_REF_RD_uint12_t_4_uint12_t_4_90b8(
     color,
     VAR_BIN_OP_OR_uxn_c_l254_c4_8827_return_output,
     VAR_BIN_OP_OR_uxn_c_l258_c4_7171_return_output);

     -- color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5[uxn_c_l240_c8_1304] LATENCY=0
     VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l240_c8_1304_return_output := CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5(
     color,
     VAR_BIN_OP_OR_uxn_c_l244_c4_d86d_return_output,
     VAR_BIN_OP_OR_uxn_c_l249_c4_f53f_return_output);

     -- color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8[uxn_c_l229_c8_5299] LATENCY=0
     VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l229_c8_5299_return_output := CONST_REF_RD_uint12_t_4_uint12_t_4_90b8(
     color,
     VAR_BIN_OP_OR_uxn_c_l233_c4_ddbf_return_output,
     VAR_BIN_OP_OR_uxn_c_l238_c4_1b2b_return_output);

     -- Submodule level 5
     VAR_color_MUX_uxn_c_l207_c3_b6f2_iftrue := VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l207_c3_b6f2_return_output;
     VAR_color_MUX_uxn_c_l229_c8_5299_iftrue := VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l229_c8_5299_return_output;
     VAR_color_MUX_uxn_c_l251_c8_ac82_iftrue := VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l251_c8_ac82_return_output;
     VAR_color_MUX_uxn_c_l218_c8_ca14_iftrue := VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l218_c8_ca14_return_output;
     VAR_color_MUX_uxn_c_l240_c8_1304_iftrue := VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l240_c8_1304_return_output;
     -- color_FALSE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_3db8[uxn_c_l251_c8_ac82] LATENCY=0
     VAR_color_FALSE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_3db8_uxn_c_l251_c8_ac82_return_output := CONST_REF_RD_uint12_t_4_uint12_t_4_3db8(
     color,
     VAR_color_3_MUX_uxn_c_l260_c8_8251_return_output,
     VAR_color_2_MUX_uxn_c_l260_c8_8251_return_output);

     -- Submodule level 6
     VAR_color_MUX_uxn_c_l251_c8_ac82_iffalse := VAR_color_FALSE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_3db8_uxn_c_l251_c8_ac82_return_output;
     -- color_MUX[uxn_c_l251_c8_ac82] LATENCY=0
     -- Inputs
     color_MUX_uxn_c_l251_c8_ac82_cond <= VAR_color_MUX_uxn_c_l251_c8_ac82_cond;
     color_MUX_uxn_c_l251_c8_ac82_iftrue <= VAR_color_MUX_uxn_c_l251_c8_ac82_iftrue;
     color_MUX_uxn_c_l251_c8_ac82_iffalse <= VAR_color_MUX_uxn_c_l251_c8_ac82_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_c_l251_c8_ac82_return_output := color_MUX_uxn_c_l251_c8_ac82_return_output;

     -- Submodule level 7
     VAR_color_MUX_uxn_c_l240_c8_1304_iffalse := VAR_color_MUX_uxn_c_l251_c8_ac82_return_output;
     -- color_MUX[uxn_c_l240_c8_1304] LATENCY=0
     -- Inputs
     color_MUX_uxn_c_l240_c8_1304_cond <= VAR_color_MUX_uxn_c_l240_c8_1304_cond;
     color_MUX_uxn_c_l240_c8_1304_iftrue <= VAR_color_MUX_uxn_c_l240_c8_1304_iftrue;
     color_MUX_uxn_c_l240_c8_1304_iffalse <= VAR_color_MUX_uxn_c_l240_c8_1304_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_c_l240_c8_1304_return_output := color_MUX_uxn_c_l240_c8_1304_return_output;

     -- Submodule level 8
     VAR_color_MUX_uxn_c_l229_c8_5299_iffalse := VAR_color_MUX_uxn_c_l240_c8_1304_return_output;
     -- color_MUX[uxn_c_l229_c8_5299] LATENCY=0
     -- Inputs
     color_MUX_uxn_c_l229_c8_5299_cond <= VAR_color_MUX_uxn_c_l229_c8_5299_cond;
     color_MUX_uxn_c_l229_c8_5299_iftrue <= VAR_color_MUX_uxn_c_l229_c8_5299_iftrue;
     color_MUX_uxn_c_l229_c8_5299_iffalse <= VAR_color_MUX_uxn_c_l229_c8_5299_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_c_l229_c8_5299_return_output := color_MUX_uxn_c_l229_c8_5299_return_output;

     -- Submodule level 9
     VAR_color_MUX_uxn_c_l218_c8_ca14_iffalse := VAR_color_MUX_uxn_c_l229_c8_5299_return_output;
     -- color_MUX[uxn_c_l218_c8_ca14] LATENCY=0
     -- Inputs
     color_MUX_uxn_c_l218_c8_ca14_cond <= VAR_color_MUX_uxn_c_l218_c8_ca14_cond;
     color_MUX_uxn_c_l218_c8_ca14_iftrue <= VAR_color_MUX_uxn_c_l218_c8_ca14_iftrue;
     color_MUX_uxn_c_l218_c8_ca14_iffalse <= VAR_color_MUX_uxn_c_l218_c8_ca14_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_c_l218_c8_ca14_return_output := color_MUX_uxn_c_l218_c8_ca14_return_output;

     -- Submodule level 10
     VAR_color_MUX_uxn_c_l207_c3_b6f2_iffalse := VAR_color_MUX_uxn_c_l218_c8_ca14_return_output;
     -- color_MUX[uxn_c_l207_c3_b6f2] LATENCY=0
     -- Inputs
     color_MUX_uxn_c_l207_c3_b6f2_cond <= VAR_color_MUX_uxn_c_l207_c3_b6f2_cond;
     color_MUX_uxn_c_l207_c3_b6f2_iftrue <= VAR_color_MUX_uxn_c_l207_c3_b6f2_iftrue;
     color_MUX_uxn_c_l207_c3_b6f2_iffalse <= VAR_color_MUX_uxn_c_l207_c3_b6f2_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_c_l207_c3_b6f2_return_output := color_MUX_uxn_c_l207_c3_b6f2_return_output;

     -- Submodule level 11
     VAR_color_MUX_uxn_c_l201_c2_f05f_iftrue := VAR_color_MUX_uxn_c_l207_c3_b6f2_return_output;
     -- color_MUX[uxn_c_l201_c2_f05f] LATENCY=0
     -- Inputs
     color_MUX_uxn_c_l201_c2_f05f_cond <= VAR_color_MUX_uxn_c_l201_c2_f05f_cond;
     color_MUX_uxn_c_l201_c2_f05f_iftrue <= VAR_color_MUX_uxn_c_l201_c2_f05f_iftrue;
     color_MUX_uxn_c_l201_c2_f05f_iffalse <= VAR_color_MUX_uxn_c_l201_c2_f05f_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_c_l201_c2_f05f_return_output := color_MUX_uxn_c_l201_c2_f05f_return_output;

     -- Submodule level 12
     VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l271_c20_57b3_ref_toks_0 := VAR_color_MUX_uxn_c_l201_c2_f05f_return_output;
     REG_VAR_color := VAR_color_MUX_uxn_c_l201_c2_f05f_return_output;
     -- VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d[uxn_c_l271_c20_57b3] LATENCY=0
     -- Inputs
     VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l271_c20_57b3_ref_toks_0 <= VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l271_c20_57b3_ref_toks_0;
     VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l271_c20_57b3_var_dim_0 <= VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l271_c20_57b3_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l271_c20_57b3_return_output := VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l271_c20_57b3_return_output;

     -- Submodule level 13
     VAR_result_uxn_c_l271_c11_b3db_0 := resize(VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l271_c20_57b3_return_output, 16);
     VAR_return_output := VAR_result_uxn_c_l271_c11_b3db_0;
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
