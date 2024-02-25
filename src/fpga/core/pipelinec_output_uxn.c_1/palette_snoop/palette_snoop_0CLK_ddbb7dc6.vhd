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
-- CONST_SR_4[uxn_c_l270_c30_3bed]
signal CONST_SR_4_uxn_c_l270_c30_3bed_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_c_l270_c30_3bed_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_c_l270_c30_cc02]
signal BIN_OP_EQ_uxn_c_l270_c30_cc02_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l270_c30_cc02_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l270_c30_cc02_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l270_c30_6bdf]
signal MUX_uxn_c_l270_c30_6bdf_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l270_c30_6bdf_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l270_c30_6bdf_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l270_c30_6bdf_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l272_c6_9361]
signal BIN_OP_AND_uxn_c_l272_c6_9361_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l272_c6_9361_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l272_c6_9361_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_c_l272_c2_f65c]
signal color_MUX_uxn_c_l272_c2_f65c_cond : unsigned(0 downto 0);
signal color_MUX_uxn_c_l272_c2_f65c_iftrue : uint12_t_4;
signal color_MUX_uxn_c_l272_c2_f65c_iffalse : uint12_t_4;
signal color_MUX_uxn_c_l272_c2_f65c_return_output : uint12_t_4;

-- CONST_SR_4[uxn_c_l275_c35_03a6]
signal CONST_SR_4_uxn_c_l275_c35_03a6_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_c_l275_c35_03a6_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_c_l278_c7_83da]
signal BIN_OP_EQ_uxn_c_l278_c7_83da_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l278_c7_83da_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l278_c7_83da_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_c_l278_c3_4b48]
signal color_MUX_uxn_c_l278_c3_4b48_cond : unsigned(0 downto 0);
signal color_MUX_uxn_c_l278_c3_4b48_iftrue : uint12_t_4;
signal color_MUX_uxn_c_l278_c3_4b48_iffalse : uint12_t_4;
signal color_MUX_uxn_c_l278_c3_4b48_return_output : uint12_t_4;

-- CONST_SL_8[uxn_c_l280_c4_7a80]
signal CONST_SL_8_uxn_c_l280_c4_7a80_x : unsigned(11 downto 0);
signal CONST_SL_8_uxn_c_l280_c4_7a80_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l281_c4_161b]
signal BIN_OP_AND_uxn_c_l281_c4_161b_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l281_c4_161b_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l281_c4_161b_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l282_c4_fcfa]
signal BIN_OP_OR_uxn_c_l282_c4_fcfa_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l282_c4_fcfa_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l282_c4_fcfa_return_output : unsigned(11 downto 0);

-- CONST_SL_8[uxn_c_l285_c4_65f6]
signal CONST_SL_8_uxn_c_l285_c4_65f6_x : unsigned(11 downto 0);
signal CONST_SL_8_uxn_c_l285_c4_65f6_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l286_c4_795f]
signal BIN_OP_AND_uxn_c_l286_c4_795f_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l286_c4_795f_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l286_c4_795f_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l287_c4_ef35]
signal BIN_OP_OR_uxn_c_l287_c4_ef35_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l287_c4_ef35_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l287_c4_ef35_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l289_c12_fd5d]
signal BIN_OP_EQ_uxn_c_l289_c12_fd5d_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l289_c12_fd5d_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l289_c12_fd5d_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_c_l289_c8_3374]
signal color_MUX_uxn_c_l289_c8_3374_cond : unsigned(0 downto 0);
signal color_MUX_uxn_c_l289_c8_3374_iftrue : uint12_t_4;
signal color_MUX_uxn_c_l289_c8_3374_iffalse : uint12_t_4;
signal color_MUX_uxn_c_l289_c8_3374_return_output : uint12_t_4;

-- CONST_SL_8[uxn_c_l291_c4_7d9b]
signal CONST_SL_8_uxn_c_l291_c4_7d9b_x : unsigned(11 downto 0);
signal CONST_SL_8_uxn_c_l291_c4_7d9b_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l292_c4_c2c0]
signal BIN_OP_AND_uxn_c_l292_c4_c2c0_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l292_c4_c2c0_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l292_c4_c2c0_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l293_c4_2c46]
signal BIN_OP_OR_uxn_c_l293_c4_2c46_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l293_c4_2c46_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l293_c4_2c46_return_output : unsigned(11 downto 0);

-- CONST_SL_8[uxn_c_l296_c4_5b58]
signal CONST_SL_8_uxn_c_l296_c4_5b58_x : unsigned(11 downto 0);
signal CONST_SL_8_uxn_c_l296_c4_5b58_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l297_c4_e4ff]
signal BIN_OP_AND_uxn_c_l297_c4_e4ff_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l297_c4_e4ff_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l297_c4_e4ff_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l298_c4_4895]
signal BIN_OP_OR_uxn_c_l298_c4_4895_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l298_c4_4895_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l298_c4_4895_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l300_c12_0083]
signal BIN_OP_EQ_uxn_c_l300_c12_0083_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l300_c12_0083_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l300_c12_0083_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_c_l300_c8_33bd]
signal color_MUX_uxn_c_l300_c8_33bd_cond : unsigned(0 downto 0);
signal color_MUX_uxn_c_l300_c8_33bd_iftrue : uint12_t_4;
signal color_MUX_uxn_c_l300_c8_33bd_iffalse : uint12_t_4;
signal color_MUX_uxn_c_l300_c8_33bd_return_output : uint12_t_4;

-- CONST_SL_4[uxn_c_l302_c4_422f]
signal CONST_SL_4_uxn_c_l302_c4_422f_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_c_l302_c4_422f_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l303_c4_2ab7]
signal BIN_OP_AND_uxn_c_l303_c4_2ab7_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l303_c4_2ab7_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l303_c4_2ab7_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l304_c4_0f1b]
signal BIN_OP_OR_uxn_c_l304_c4_0f1b_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l304_c4_0f1b_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l304_c4_0f1b_return_output : unsigned(11 downto 0);

-- CONST_SL_4[uxn_c_l307_c4_c621]
signal CONST_SL_4_uxn_c_l307_c4_c621_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_c_l307_c4_c621_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l308_c4_fb94]
signal BIN_OP_AND_uxn_c_l308_c4_fb94_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l308_c4_fb94_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l308_c4_fb94_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l309_c4_2495]
signal BIN_OP_OR_uxn_c_l309_c4_2495_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l309_c4_2495_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l309_c4_2495_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l311_c12_aa3d]
signal BIN_OP_EQ_uxn_c_l311_c12_aa3d_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l311_c12_aa3d_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l311_c12_aa3d_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_c_l311_c8_90b8]
signal color_MUX_uxn_c_l311_c8_90b8_cond : unsigned(0 downto 0);
signal color_MUX_uxn_c_l311_c8_90b8_iftrue : uint12_t_4;
signal color_MUX_uxn_c_l311_c8_90b8_iffalse : uint12_t_4;
signal color_MUX_uxn_c_l311_c8_90b8_return_output : uint12_t_4;

-- CONST_SL_4[uxn_c_l313_c4_e399]
signal CONST_SL_4_uxn_c_l313_c4_e399_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_c_l313_c4_e399_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l314_c4_a28b]
signal BIN_OP_AND_uxn_c_l314_c4_a28b_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l314_c4_a28b_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l314_c4_a28b_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l315_c4_976c]
signal BIN_OP_OR_uxn_c_l315_c4_976c_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l315_c4_976c_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l315_c4_976c_return_output : unsigned(11 downto 0);

-- CONST_SL_4[uxn_c_l318_c4_e621]
signal CONST_SL_4_uxn_c_l318_c4_e621_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_c_l318_c4_e621_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l319_c4_1697]
signal BIN_OP_AND_uxn_c_l319_c4_1697_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l319_c4_1697_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l319_c4_1697_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l320_c4_e5c7]
signal BIN_OP_OR_uxn_c_l320_c4_e5c7_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l320_c4_e5c7_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l320_c4_e5c7_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l322_c12_9e24]
signal BIN_OP_EQ_uxn_c_l322_c12_9e24_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l322_c12_9e24_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l322_c12_9e24_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_c_l322_c8_836e]
signal color_MUX_uxn_c_l322_c8_836e_cond : unsigned(0 downto 0);
signal color_MUX_uxn_c_l322_c8_836e_iftrue : uint12_t_4;
signal color_MUX_uxn_c_l322_c8_836e_iffalse : uint12_t_4;
signal color_MUX_uxn_c_l322_c8_836e_return_output : uint12_t_4;

-- BIN_OP_AND[uxn_c_l324_c4_1535]
signal BIN_OP_AND_uxn_c_l324_c4_1535_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l324_c4_1535_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l324_c4_1535_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l325_c4_feee]
signal BIN_OP_OR_uxn_c_l325_c4_feee_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l325_c4_feee_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l325_c4_feee_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l328_c4_5a7d]
signal BIN_OP_AND_uxn_c_l328_c4_5a7d_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l328_c4_5a7d_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l328_c4_5a7d_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l329_c4_4431]
signal BIN_OP_OR_uxn_c_l329_c4_4431_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l329_c4_4431_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l329_c4_4431_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l331_c12_cf1a]
signal BIN_OP_EQ_uxn_c_l331_c12_cf1a_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l331_c12_cf1a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l331_c12_cf1a_return_output : unsigned(0 downto 0);

-- color_3_MUX[uxn_c_l331_c8_94a1]
signal color_3_MUX_uxn_c_l331_c8_94a1_cond : unsigned(0 downto 0);
signal color_3_MUX_uxn_c_l331_c8_94a1_iftrue : unsigned(11 downto 0);
signal color_3_MUX_uxn_c_l331_c8_94a1_iffalse : unsigned(11 downto 0);
signal color_3_MUX_uxn_c_l331_c8_94a1_return_output : unsigned(11 downto 0);

-- color_2_MUX[uxn_c_l331_c8_94a1]
signal color_2_MUX_uxn_c_l331_c8_94a1_cond : unsigned(0 downto 0);
signal color_2_MUX_uxn_c_l331_c8_94a1_iftrue : unsigned(11 downto 0);
signal color_2_MUX_uxn_c_l331_c8_94a1_iffalse : unsigned(11 downto 0);
signal color_2_MUX_uxn_c_l331_c8_94a1_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l333_c4_cfc6]
signal BIN_OP_AND_uxn_c_l333_c4_cfc6_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l333_c4_cfc6_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l333_c4_cfc6_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l334_c4_7d26]
signal BIN_OP_OR_uxn_c_l334_c4_7d26_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l334_c4_7d26_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l334_c4_7d26_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l337_c4_ca98]
signal BIN_OP_AND_uxn_c_l337_c4_ca98_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l337_c4_ca98_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l337_c4_ca98_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l338_c4_5b21]
signal BIN_OP_OR_uxn_c_l338_c4_5b21_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l338_c4_5b21_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l338_c4_5b21_return_output : unsigned(11 downto 0);

-- VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d[uxn_c_l342_c20_b0ed]
signal VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l342_c20_b0ed_ref_toks_0 : uint12_t_4;
signal VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l342_c20_b0ed_var_dim_0 : unsigned(1 downto 0);
signal VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l342_c20_b0ed_return_output : unsigned(11 downto 0);

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
-- CONST_SR_4_uxn_c_l270_c30_3bed
CONST_SR_4_uxn_c_l270_c30_3bed : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_c_l270_c30_3bed_x,
CONST_SR_4_uxn_c_l270_c30_3bed_return_output);

-- BIN_OP_EQ_uxn_c_l270_c30_cc02
BIN_OP_EQ_uxn_c_l270_c30_cc02 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l270_c30_cc02_left,
BIN_OP_EQ_uxn_c_l270_c30_cc02_right,
BIN_OP_EQ_uxn_c_l270_c30_cc02_return_output);

-- MUX_uxn_c_l270_c30_6bdf
MUX_uxn_c_l270_c30_6bdf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l270_c30_6bdf_cond,
MUX_uxn_c_l270_c30_6bdf_iftrue,
MUX_uxn_c_l270_c30_6bdf_iffalse,
MUX_uxn_c_l270_c30_6bdf_return_output);

-- BIN_OP_AND_uxn_c_l272_c6_9361
BIN_OP_AND_uxn_c_l272_c6_9361 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l272_c6_9361_left,
BIN_OP_AND_uxn_c_l272_c6_9361_right,
BIN_OP_AND_uxn_c_l272_c6_9361_return_output);

-- color_MUX_uxn_c_l272_c2_f65c
color_MUX_uxn_c_l272_c2_f65c : entity work.MUX_uint1_t_uint12_t_4_uint12_t_4_0CLK_de264c78 port map (
color_MUX_uxn_c_l272_c2_f65c_cond,
color_MUX_uxn_c_l272_c2_f65c_iftrue,
color_MUX_uxn_c_l272_c2_f65c_iffalse,
color_MUX_uxn_c_l272_c2_f65c_return_output);

-- CONST_SR_4_uxn_c_l275_c35_03a6
CONST_SR_4_uxn_c_l275_c35_03a6 : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_c_l275_c35_03a6_x,
CONST_SR_4_uxn_c_l275_c35_03a6_return_output);

-- BIN_OP_EQ_uxn_c_l278_c7_83da
BIN_OP_EQ_uxn_c_l278_c7_83da : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l278_c7_83da_left,
BIN_OP_EQ_uxn_c_l278_c7_83da_right,
BIN_OP_EQ_uxn_c_l278_c7_83da_return_output);

-- color_MUX_uxn_c_l278_c3_4b48
color_MUX_uxn_c_l278_c3_4b48 : entity work.MUX_uint1_t_uint12_t_4_uint12_t_4_0CLK_de264c78 port map (
color_MUX_uxn_c_l278_c3_4b48_cond,
color_MUX_uxn_c_l278_c3_4b48_iftrue,
color_MUX_uxn_c_l278_c3_4b48_iffalse,
color_MUX_uxn_c_l278_c3_4b48_return_output);

-- CONST_SL_8_uxn_c_l280_c4_7a80
CONST_SL_8_uxn_c_l280_c4_7a80 : entity work.CONST_SL_8_uint12_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l280_c4_7a80_x,
CONST_SL_8_uxn_c_l280_c4_7a80_return_output);

-- BIN_OP_AND_uxn_c_l281_c4_161b
BIN_OP_AND_uxn_c_l281_c4_161b : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l281_c4_161b_left,
BIN_OP_AND_uxn_c_l281_c4_161b_right,
BIN_OP_AND_uxn_c_l281_c4_161b_return_output);

-- BIN_OP_OR_uxn_c_l282_c4_fcfa
BIN_OP_OR_uxn_c_l282_c4_fcfa : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l282_c4_fcfa_left,
BIN_OP_OR_uxn_c_l282_c4_fcfa_right,
BIN_OP_OR_uxn_c_l282_c4_fcfa_return_output);

-- CONST_SL_8_uxn_c_l285_c4_65f6
CONST_SL_8_uxn_c_l285_c4_65f6 : entity work.CONST_SL_8_uint12_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l285_c4_65f6_x,
CONST_SL_8_uxn_c_l285_c4_65f6_return_output);

-- BIN_OP_AND_uxn_c_l286_c4_795f
BIN_OP_AND_uxn_c_l286_c4_795f : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l286_c4_795f_left,
BIN_OP_AND_uxn_c_l286_c4_795f_right,
BIN_OP_AND_uxn_c_l286_c4_795f_return_output);

-- BIN_OP_OR_uxn_c_l287_c4_ef35
BIN_OP_OR_uxn_c_l287_c4_ef35 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l287_c4_ef35_left,
BIN_OP_OR_uxn_c_l287_c4_ef35_right,
BIN_OP_OR_uxn_c_l287_c4_ef35_return_output);

-- BIN_OP_EQ_uxn_c_l289_c12_fd5d
BIN_OP_EQ_uxn_c_l289_c12_fd5d : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l289_c12_fd5d_left,
BIN_OP_EQ_uxn_c_l289_c12_fd5d_right,
BIN_OP_EQ_uxn_c_l289_c12_fd5d_return_output);

-- color_MUX_uxn_c_l289_c8_3374
color_MUX_uxn_c_l289_c8_3374 : entity work.MUX_uint1_t_uint12_t_4_uint12_t_4_0CLK_de264c78 port map (
color_MUX_uxn_c_l289_c8_3374_cond,
color_MUX_uxn_c_l289_c8_3374_iftrue,
color_MUX_uxn_c_l289_c8_3374_iffalse,
color_MUX_uxn_c_l289_c8_3374_return_output);

-- CONST_SL_8_uxn_c_l291_c4_7d9b
CONST_SL_8_uxn_c_l291_c4_7d9b : entity work.CONST_SL_8_uint12_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l291_c4_7d9b_x,
CONST_SL_8_uxn_c_l291_c4_7d9b_return_output);

-- BIN_OP_AND_uxn_c_l292_c4_c2c0
BIN_OP_AND_uxn_c_l292_c4_c2c0 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l292_c4_c2c0_left,
BIN_OP_AND_uxn_c_l292_c4_c2c0_right,
BIN_OP_AND_uxn_c_l292_c4_c2c0_return_output);

-- BIN_OP_OR_uxn_c_l293_c4_2c46
BIN_OP_OR_uxn_c_l293_c4_2c46 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l293_c4_2c46_left,
BIN_OP_OR_uxn_c_l293_c4_2c46_right,
BIN_OP_OR_uxn_c_l293_c4_2c46_return_output);

-- CONST_SL_8_uxn_c_l296_c4_5b58
CONST_SL_8_uxn_c_l296_c4_5b58 : entity work.CONST_SL_8_uint12_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l296_c4_5b58_x,
CONST_SL_8_uxn_c_l296_c4_5b58_return_output);

-- BIN_OP_AND_uxn_c_l297_c4_e4ff
BIN_OP_AND_uxn_c_l297_c4_e4ff : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l297_c4_e4ff_left,
BIN_OP_AND_uxn_c_l297_c4_e4ff_right,
BIN_OP_AND_uxn_c_l297_c4_e4ff_return_output);

-- BIN_OP_OR_uxn_c_l298_c4_4895
BIN_OP_OR_uxn_c_l298_c4_4895 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l298_c4_4895_left,
BIN_OP_OR_uxn_c_l298_c4_4895_right,
BIN_OP_OR_uxn_c_l298_c4_4895_return_output);

-- BIN_OP_EQ_uxn_c_l300_c12_0083
BIN_OP_EQ_uxn_c_l300_c12_0083 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l300_c12_0083_left,
BIN_OP_EQ_uxn_c_l300_c12_0083_right,
BIN_OP_EQ_uxn_c_l300_c12_0083_return_output);

-- color_MUX_uxn_c_l300_c8_33bd
color_MUX_uxn_c_l300_c8_33bd : entity work.MUX_uint1_t_uint12_t_4_uint12_t_4_0CLK_de264c78 port map (
color_MUX_uxn_c_l300_c8_33bd_cond,
color_MUX_uxn_c_l300_c8_33bd_iftrue,
color_MUX_uxn_c_l300_c8_33bd_iffalse,
color_MUX_uxn_c_l300_c8_33bd_return_output);

-- CONST_SL_4_uxn_c_l302_c4_422f
CONST_SL_4_uxn_c_l302_c4_422f : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_c_l302_c4_422f_x,
CONST_SL_4_uxn_c_l302_c4_422f_return_output);

-- BIN_OP_AND_uxn_c_l303_c4_2ab7
BIN_OP_AND_uxn_c_l303_c4_2ab7 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l303_c4_2ab7_left,
BIN_OP_AND_uxn_c_l303_c4_2ab7_right,
BIN_OP_AND_uxn_c_l303_c4_2ab7_return_output);

-- BIN_OP_OR_uxn_c_l304_c4_0f1b
BIN_OP_OR_uxn_c_l304_c4_0f1b : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l304_c4_0f1b_left,
BIN_OP_OR_uxn_c_l304_c4_0f1b_right,
BIN_OP_OR_uxn_c_l304_c4_0f1b_return_output);

-- CONST_SL_4_uxn_c_l307_c4_c621
CONST_SL_4_uxn_c_l307_c4_c621 : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_c_l307_c4_c621_x,
CONST_SL_4_uxn_c_l307_c4_c621_return_output);

-- BIN_OP_AND_uxn_c_l308_c4_fb94
BIN_OP_AND_uxn_c_l308_c4_fb94 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l308_c4_fb94_left,
BIN_OP_AND_uxn_c_l308_c4_fb94_right,
BIN_OP_AND_uxn_c_l308_c4_fb94_return_output);

-- BIN_OP_OR_uxn_c_l309_c4_2495
BIN_OP_OR_uxn_c_l309_c4_2495 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l309_c4_2495_left,
BIN_OP_OR_uxn_c_l309_c4_2495_right,
BIN_OP_OR_uxn_c_l309_c4_2495_return_output);

-- BIN_OP_EQ_uxn_c_l311_c12_aa3d
BIN_OP_EQ_uxn_c_l311_c12_aa3d : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l311_c12_aa3d_left,
BIN_OP_EQ_uxn_c_l311_c12_aa3d_right,
BIN_OP_EQ_uxn_c_l311_c12_aa3d_return_output);

-- color_MUX_uxn_c_l311_c8_90b8
color_MUX_uxn_c_l311_c8_90b8 : entity work.MUX_uint1_t_uint12_t_4_uint12_t_4_0CLK_de264c78 port map (
color_MUX_uxn_c_l311_c8_90b8_cond,
color_MUX_uxn_c_l311_c8_90b8_iftrue,
color_MUX_uxn_c_l311_c8_90b8_iffalse,
color_MUX_uxn_c_l311_c8_90b8_return_output);

-- CONST_SL_4_uxn_c_l313_c4_e399
CONST_SL_4_uxn_c_l313_c4_e399 : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_c_l313_c4_e399_x,
CONST_SL_4_uxn_c_l313_c4_e399_return_output);

-- BIN_OP_AND_uxn_c_l314_c4_a28b
BIN_OP_AND_uxn_c_l314_c4_a28b : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l314_c4_a28b_left,
BIN_OP_AND_uxn_c_l314_c4_a28b_right,
BIN_OP_AND_uxn_c_l314_c4_a28b_return_output);

-- BIN_OP_OR_uxn_c_l315_c4_976c
BIN_OP_OR_uxn_c_l315_c4_976c : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l315_c4_976c_left,
BIN_OP_OR_uxn_c_l315_c4_976c_right,
BIN_OP_OR_uxn_c_l315_c4_976c_return_output);

-- CONST_SL_4_uxn_c_l318_c4_e621
CONST_SL_4_uxn_c_l318_c4_e621 : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_c_l318_c4_e621_x,
CONST_SL_4_uxn_c_l318_c4_e621_return_output);

-- BIN_OP_AND_uxn_c_l319_c4_1697
BIN_OP_AND_uxn_c_l319_c4_1697 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l319_c4_1697_left,
BIN_OP_AND_uxn_c_l319_c4_1697_right,
BIN_OP_AND_uxn_c_l319_c4_1697_return_output);

-- BIN_OP_OR_uxn_c_l320_c4_e5c7
BIN_OP_OR_uxn_c_l320_c4_e5c7 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l320_c4_e5c7_left,
BIN_OP_OR_uxn_c_l320_c4_e5c7_right,
BIN_OP_OR_uxn_c_l320_c4_e5c7_return_output);

-- BIN_OP_EQ_uxn_c_l322_c12_9e24
BIN_OP_EQ_uxn_c_l322_c12_9e24 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l322_c12_9e24_left,
BIN_OP_EQ_uxn_c_l322_c12_9e24_right,
BIN_OP_EQ_uxn_c_l322_c12_9e24_return_output);

-- color_MUX_uxn_c_l322_c8_836e
color_MUX_uxn_c_l322_c8_836e : entity work.MUX_uint1_t_uint12_t_4_uint12_t_4_0CLK_de264c78 port map (
color_MUX_uxn_c_l322_c8_836e_cond,
color_MUX_uxn_c_l322_c8_836e_iftrue,
color_MUX_uxn_c_l322_c8_836e_iffalse,
color_MUX_uxn_c_l322_c8_836e_return_output);

-- BIN_OP_AND_uxn_c_l324_c4_1535
BIN_OP_AND_uxn_c_l324_c4_1535 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l324_c4_1535_left,
BIN_OP_AND_uxn_c_l324_c4_1535_right,
BIN_OP_AND_uxn_c_l324_c4_1535_return_output);

-- BIN_OP_OR_uxn_c_l325_c4_feee
BIN_OP_OR_uxn_c_l325_c4_feee : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l325_c4_feee_left,
BIN_OP_OR_uxn_c_l325_c4_feee_right,
BIN_OP_OR_uxn_c_l325_c4_feee_return_output);

-- BIN_OP_AND_uxn_c_l328_c4_5a7d
BIN_OP_AND_uxn_c_l328_c4_5a7d : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l328_c4_5a7d_left,
BIN_OP_AND_uxn_c_l328_c4_5a7d_right,
BIN_OP_AND_uxn_c_l328_c4_5a7d_return_output);

-- BIN_OP_OR_uxn_c_l329_c4_4431
BIN_OP_OR_uxn_c_l329_c4_4431 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l329_c4_4431_left,
BIN_OP_OR_uxn_c_l329_c4_4431_right,
BIN_OP_OR_uxn_c_l329_c4_4431_return_output);

-- BIN_OP_EQ_uxn_c_l331_c12_cf1a
BIN_OP_EQ_uxn_c_l331_c12_cf1a : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l331_c12_cf1a_left,
BIN_OP_EQ_uxn_c_l331_c12_cf1a_right,
BIN_OP_EQ_uxn_c_l331_c12_cf1a_return_output);

-- color_3_MUX_uxn_c_l331_c8_94a1
color_3_MUX_uxn_c_l331_c8_94a1 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color_3_MUX_uxn_c_l331_c8_94a1_cond,
color_3_MUX_uxn_c_l331_c8_94a1_iftrue,
color_3_MUX_uxn_c_l331_c8_94a1_iffalse,
color_3_MUX_uxn_c_l331_c8_94a1_return_output);

-- color_2_MUX_uxn_c_l331_c8_94a1
color_2_MUX_uxn_c_l331_c8_94a1 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color_2_MUX_uxn_c_l331_c8_94a1_cond,
color_2_MUX_uxn_c_l331_c8_94a1_iftrue,
color_2_MUX_uxn_c_l331_c8_94a1_iffalse,
color_2_MUX_uxn_c_l331_c8_94a1_return_output);

-- BIN_OP_AND_uxn_c_l333_c4_cfc6
BIN_OP_AND_uxn_c_l333_c4_cfc6 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l333_c4_cfc6_left,
BIN_OP_AND_uxn_c_l333_c4_cfc6_right,
BIN_OP_AND_uxn_c_l333_c4_cfc6_return_output);

-- BIN_OP_OR_uxn_c_l334_c4_7d26
BIN_OP_OR_uxn_c_l334_c4_7d26 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l334_c4_7d26_left,
BIN_OP_OR_uxn_c_l334_c4_7d26_right,
BIN_OP_OR_uxn_c_l334_c4_7d26_return_output);

-- BIN_OP_AND_uxn_c_l337_c4_ca98
BIN_OP_AND_uxn_c_l337_c4_ca98 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l337_c4_ca98_left,
BIN_OP_AND_uxn_c_l337_c4_ca98_right,
BIN_OP_AND_uxn_c_l337_c4_ca98_return_output);

-- BIN_OP_OR_uxn_c_l338_c4_5b21
BIN_OP_OR_uxn_c_l338_c4_5b21 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l338_c4_5b21_left,
BIN_OP_OR_uxn_c_l338_c4_5b21_right,
BIN_OP_OR_uxn_c_l338_c4_5b21_return_output);

-- VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l342_c20_b0ed
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l342_c20_b0ed : entity work.VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_0CLK_9e40ec46 port map (
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l342_c20_b0ed_ref_toks_0,
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l342_c20_b0ed_var_dim_0,
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l342_c20_b0ed_return_output);



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
 CONST_SR_4_uxn_c_l270_c30_3bed_return_output,
 BIN_OP_EQ_uxn_c_l270_c30_cc02_return_output,
 MUX_uxn_c_l270_c30_6bdf_return_output,
 BIN_OP_AND_uxn_c_l272_c6_9361_return_output,
 color_MUX_uxn_c_l272_c2_f65c_return_output,
 CONST_SR_4_uxn_c_l275_c35_03a6_return_output,
 BIN_OP_EQ_uxn_c_l278_c7_83da_return_output,
 color_MUX_uxn_c_l278_c3_4b48_return_output,
 CONST_SL_8_uxn_c_l280_c4_7a80_return_output,
 BIN_OP_AND_uxn_c_l281_c4_161b_return_output,
 BIN_OP_OR_uxn_c_l282_c4_fcfa_return_output,
 CONST_SL_8_uxn_c_l285_c4_65f6_return_output,
 BIN_OP_AND_uxn_c_l286_c4_795f_return_output,
 BIN_OP_OR_uxn_c_l287_c4_ef35_return_output,
 BIN_OP_EQ_uxn_c_l289_c12_fd5d_return_output,
 color_MUX_uxn_c_l289_c8_3374_return_output,
 CONST_SL_8_uxn_c_l291_c4_7d9b_return_output,
 BIN_OP_AND_uxn_c_l292_c4_c2c0_return_output,
 BIN_OP_OR_uxn_c_l293_c4_2c46_return_output,
 CONST_SL_8_uxn_c_l296_c4_5b58_return_output,
 BIN_OP_AND_uxn_c_l297_c4_e4ff_return_output,
 BIN_OP_OR_uxn_c_l298_c4_4895_return_output,
 BIN_OP_EQ_uxn_c_l300_c12_0083_return_output,
 color_MUX_uxn_c_l300_c8_33bd_return_output,
 CONST_SL_4_uxn_c_l302_c4_422f_return_output,
 BIN_OP_AND_uxn_c_l303_c4_2ab7_return_output,
 BIN_OP_OR_uxn_c_l304_c4_0f1b_return_output,
 CONST_SL_4_uxn_c_l307_c4_c621_return_output,
 BIN_OP_AND_uxn_c_l308_c4_fb94_return_output,
 BIN_OP_OR_uxn_c_l309_c4_2495_return_output,
 BIN_OP_EQ_uxn_c_l311_c12_aa3d_return_output,
 color_MUX_uxn_c_l311_c8_90b8_return_output,
 CONST_SL_4_uxn_c_l313_c4_e399_return_output,
 BIN_OP_AND_uxn_c_l314_c4_a28b_return_output,
 BIN_OP_OR_uxn_c_l315_c4_976c_return_output,
 CONST_SL_4_uxn_c_l318_c4_e621_return_output,
 BIN_OP_AND_uxn_c_l319_c4_1697_return_output,
 BIN_OP_OR_uxn_c_l320_c4_e5c7_return_output,
 BIN_OP_EQ_uxn_c_l322_c12_9e24_return_output,
 color_MUX_uxn_c_l322_c8_836e_return_output,
 BIN_OP_AND_uxn_c_l324_c4_1535_return_output,
 BIN_OP_OR_uxn_c_l325_c4_feee_return_output,
 BIN_OP_AND_uxn_c_l328_c4_5a7d_return_output,
 BIN_OP_OR_uxn_c_l329_c4_4431_return_output,
 BIN_OP_EQ_uxn_c_l331_c12_cf1a_return_output,
 color_3_MUX_uxn_c_l331_c8_94a1_return_output,
 color_2_MUX_uxn_c_l331_c8_94a1_return_output,
 BIN_OP_AND_uxn_c_l333_c4_cfc6_return_output,
 BIN_OP_OR_uxn_c_l334_c4_7d26_return_output,
 BIN_OP_AND_uxn_c_l337_c4_ca98_return_output,
 BIN_OP_OR_uxn_c_l338_c4_5b21_return_output,
 VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l342_c20_b0ed_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_device_ram_address : unsigned(7 downto 0);
 variable VAR_device_ram_value : unsigned(7 downto 0);
 variable VAR_is_device_ram_write : unsigned(0 downto 0);
 variable VAR_gpu_step_color : unsigned(1 downto 0);
 variable VAR_is_palette_range : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l270_c30_6bdf_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_4_uxn_c_l270_c30_3bed_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l270_c30_cc02_left : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_c_l270_c30_3bed_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l270_c30_cc02_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l270_c30_cc02_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l270_c30_6bdf_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l270_c30_6bdf_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l270_c30_6bdf_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l272_c6_9361_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l272_c6_9361_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l272_c6_9361_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_c_l272_c2_f65c_iftrue : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l278_c3_4b48_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l272_c2_f65c_iffalse : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l272_c2_f65c_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l272_c2_f65c_cond : unsigned(0 downto 0);
 variable VAR_tmp12 : unsigned(11 downto 0);
 variable VAR_addr_low : unsigned(3 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_c_l274_c22_a467_return_output : unsigned(3 downto 0);
 variable VAR_color_cmp_0 : unsigned(3 downto 0);
 variable VAR_color_cmp_0_uxn_c_l275_c11_898f_0 : unsigned(3 downto 0);
 variable VAR_CONST_SR_4_uxn_c_l275_c35_03a6_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_c_l275_c35_03a6_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_c_l275_c25_4888_return_output : unsigned(3 downto 0);
 variable VAR_color_cmp_1 : unsigned(3 downto 0);
 variable VAR_color_cmp_1_uxn_c_l276_c11_a84b_0 : unsigned(3 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_c_l276_c25_1e06_return_output : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l278_c7_83da_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l278_c7_83da_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l278_c7_83da_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_c_l278_c3_4b48_iftrue : uint12_t_4;
 variable VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l278_c3_4b48_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l278_c3_4b48_iffalse : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l289_c8_3374_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l278_c3_4b48_cond : unsigned(0 downto 0);
 variable VAR_tmp12_uxn_c_l279_c4_c086 : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l280_c4_7a80_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l280_c4_7a80_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l281_c4_161b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l281_c4_161b_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l281_c4_161b_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l282_c4_fcfa_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l282_c4_fcfa_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l282_c4_fcfa_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_uxn_c_l284_c4_9258 : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l285_c4_65f6_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l285_c4_65f6_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l286_c4_795f_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l286_c4_795f_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l286_c4_795f_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l287_c4_ef35_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l287_c4_ef35_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l287_c4_ef35_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l289_c12_fd5d_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l289_c12_fd5d_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l289_c12_fd5d_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_c_l289_c8_3374_iftrue : uint12_t_4;
 variable VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l289_c8_3374_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l289_c8_3374_iffalse : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l300_c8_33bd_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l289_c8_3374_cond : unsigned(0 downto 0);
 variable VAR_tmp12_uxn_c_l290_c4_a10c : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l291_c4_7d9b_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l291_c4_7d9b_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l292_c4_c2c0_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l292_c4_c2c0_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l292_c4_c2c0_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l293_c4_2c46_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l293_c4_2c46_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l293_c4_2c46_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_uxn_c_l295_c4_5bdd : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l296_c4_5b58_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l296_c4_5b58_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l297_c4_e4ff_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l297_c4_e4ff_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l297_c4_e4ff_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l298_c4_4895_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l298_c4_4895_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l298_c4_4895_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l300_c12_0083_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l300_c12_0083_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l300_c12_0083_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_c_l300_c8_33bd_iftrue : uint12_t_4;
 variable VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l300_c8_33bd_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l300_c8_33bd_iffalse : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l311_c8_90b8_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l300_c8_33bd_cond : unsigned(0 downto 0);
 variable VAR_tmp12_uxn_c_l301_c4_d37a : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l302_c4_422f_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l302_c4_422f_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l303_c4_2ab7_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l303_c4_2ab7_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l303_c4_2ab7_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l304_c4_0f1b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l304_c4_0f1b_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l304_c4_0f1b_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_uxn_c_l306_c4_6657 : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l307_c4_c621_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l307_c4_c621_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l308_c4_fb94_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l308_c4_fb94_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l308_c4_fb94_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l309_c4_2495_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l309_c4_2495_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l309_c4_2495_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l311_c12_aa3d_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l311_c12_aa3d_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l311_c12_aa3d_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_c_l311_c8_90b8_iftrue : uint12_t_4;
 variable VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l311_c8_90b8_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l311_c8_90b8_iffalse : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l322_c8_836e_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l311_c8_90b8_cond : unsigned(0 downto 0);
 variable VAR_tmp12_uxn_c_l312_c4_6247 : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l313_c4_e399_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l313_c4_e399_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l314_c4_a28b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l314_c4_a28b_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l314_c4_a28b_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l315_c4_976c_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l315_c4_976c_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l315_c4_976c_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_uxn_c_l317_c4_93da : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l318_c4_e621_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l318_c4_e621_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l319_c4_1697_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l319_c4_1697_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l319_c4_1697_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l320_c4_e5c7_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l320_c4_e5c7_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l320_c4_e5c7_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l322_c12_9e24_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l322_c12_9e24_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l322_c12_9e24_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_c_l322_c8_836e_iftrue : uint12_t_4;
 variable VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l322_c8_836e_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l322_c8_836e_iffalse : uint12_t_4;
 variable VAR_color_FALSE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_3db8_uxn_c_l322_c8_836e_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l322_c8_836e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l324_c4_1535_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l324_c4_1535_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l324_c4_1535_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l325_c4_feee_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l325_c4_feee_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l325_c4_feee_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l328_c4_5a7d_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l328_c4_5a7d_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l328_c4_5a7d_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l329_c4_4431_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l329_c4_4431_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l329_c4_4431_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l331_c12_cf1a_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l331_c12_cf1a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l331_c12_cf1a_return_output : unsigned(0 downto 0);
 variable VAR_color_3_MUX_uxn_c_l331_c8_94a1_iftrue : unsigned(11 downto 0);
 variable VAR_color_3_MUX_uxn_c_l331_c8_94a1_iffalse : unsigned(11 downto 0);
 variable VAR_color_3_MUX_uxn_c_l331_c8_94a1_return_output : unsigned(11 downto 0);
 variable VAR_color_3_MUX_uxn_c_l331_c8_94a1_cond : unsigned(0 downto 0);
 variable VAR_color_2_MUX_uxn_c_l331_c8_94a1_iftrue : unsigned(11 downto 0);
 variable VAR_color_2_MUX_uxn_c_l331_c8_94a1_iffalse : unsigned(11 downto 0);
 variable VAR_color_2_MUX_uxn_c_l331_c8_94a1_return_output : unsigned(11 downto 0);
 variable VAR_color_2_MUX_uxn_c_l331_c8_94a1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l333_c4_cfc6_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l333_c4_cfc6_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l333_c4_cfc6_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l334_c4_7d26_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l334_c4_7d26_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l334_c4_7d26_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l337_c4_ca98_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l337_c4_ca98_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l337_c4_ca98_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l338_c4_5b21_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l338_c4_5b21_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l338_c4_5b21_return_output : unsigned(11 downto 0);
 variable VAR_result : unsigned(15 downto 0);
 variable VAR_result_uxn_c_l342_c11_6a09_0 : unsigned(15 downto 0);
 variable VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l342_c20_b0ed_var_dim_0 : unsigned(1 downto 0);
 variable VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l342_c20_b0ed_return_output : unsigned(11 downto 0);
 variable VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l342_c20_b0ed_ref_toks_0 : uint12_t_4;
 variable VAR_CONST_REF_RD_uint12_t_uint12_t_4_0_d41d_uxn_c_l303_l281_l324_DUPLICATE_7f9a_return_output : unsigned(11 downto 0);
 variable VAR_CONST_REF_RD_uint12_t_uint12_t_4_1_d41d_uxn_c_l308_l286_l328_DUPLICATE_c06f_return_output : unsigned(11 downto 0);
 variable VAR_CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_uxn_c_l292_l333_l314_l331_DUPLICATE_bc1b_return_output : unsigned(11 downto 0);
 variable VAR_CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_uxn_c_l297_l337_l319_l331_DUPLICATE_2c65_return_output : unsigned(11 downto 0);
 variable VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l323_l332_DUPLICATE_7d45_return_output : unsigned(11 downto 0);
 variable VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l327_l336_DUPLICATE_4532_return_output : unsigned(11 downto 0);
 -- State registers comb logic variables
variable REG_VAR_color : uint12_t_4;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_color := color;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_AND_uxn_c_l286_c4_795f_right := to_unsigned(255, 12);
     VAR_BIN_OP_EQ_uxn_c_l311_c12_aa3d_right := to_unsigned(11, 4);
     VAR_BIN_OP_EQ_uxn_c_l289_c12_fd5d_right := to_unsigned(9, 4);
     VAR_BIN_OP_AND_uxn_c_l328_c4_5a7d_right := to_unsigned(4080, 12);
     VAR_BIN_OP_AND_uxn_c_l308_c4_fb94_right := to_unsigned(3855, 12);
     VAR_BIN_OP_AND_uxn_c_l297_c4_e4ff_right := to_unsigned(255, 12);
     VAR_BIN_OP_AND_uxn_c_l324_c4_1535_right := to_unsigned(4080, 12);
     VAR_BIN_OP_AND_uxn_c_l319_c4_1697_right := to_unsigned(3855, 12);
     VAR_MUX_uxn_c_l270_c30_6bdf_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_c_l281_c4_161b_right := to_unsigned(255, 12);
     VAR_BIN_OP_AND_uxn_c_l333_c4_cfc6_right := to_unsigned(4080, 12);
     VAR_BIN_OP_EQ_uxn_c_l322_c12_9e24_right := to_unsigned(12, 4);
     VAR_BIN_OP_AND_uxn_c_l303_c4_2ab7_right := to_unsigned(3855, 12);
     VAR_BIN_OP_AND_uxn_c_l292_c4_c2c0_right := to_unsigned(255, 12);
     VAR_BIN_OP_AND_uxn_c_l337_c4_ca98_right := to_unsigned(4080, 12);
     VAR_BIN_OP_EQ_uxn_c_l278_c7_83da_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_c_l270_c30_cc02_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l331_c12_cf1a_right := to_unsigned(13, 4);
     VAR_BIN_OP_EQ_uxn_c_l300_c12_0083_right := to_unsigned(10, 4);
     VAR_BIN_OP_AND_uxn_c_l314_c4_a28b_right := to_unsigned(3855, 12);
     VAR_MUX_uxn_c_l270_c30_6bdf_iffalse := to_unsigned(0, 1);

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
     VAR_color_MUX_uxn_c_l272_c2_f65c_iffalse := color;
     VAR_CONST_SR_4_uxn_c_l270_c30_3bed_x := VAR_device_ram_address;
     VAR_CONST_SR_4_uxn_c_l275_c35_03a6_x := VAR_device_ram_value;
     VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l342_c20_b0ed_var_dim_0 := VAR_gpu_step_color;
     VAR_BIN_OP_AND_uxn_c_l272_c6_9361_left := VAR_is_device_ram_write;
     -- CONST_SR_4[uxn_c_l270_c30_3bed] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_c_l270_c30_3bed_x <= VAR_CONST_SR_4_uxn_c_l270_c30_3bed_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_c_l270_c30_3bed_return_output := CONST_SR_4_uxn_c_l270_c30_3bed_return_output;

     -- CAST_TO_uint4_t[uxn_c_l276_c25_1e06] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_c_l276_c25_1e06_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_device_ram_value);

     -- CONST_SR_4[uxn_c_l275_c35_03a6] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_c_l275_c35_03a6_x <= VAR_CONST_SR_4_uxn_c_l275_c35_03a6_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_c_l275_c35_03a6_return_output := CONST_SR_4_uxn_c_l275_c35_03a6_return_output;

     -- CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_uxn_c_l292_l333_l314_l331_DUPLICATE_bc1b LATENCY=0
     VAR_CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_uxn_c_l292_l333_l314_l331_DUPLICATE_bc1b_return_output := color(2);

     -- CAST_TO_uint4_t[uxn_c_l274_c22_a467] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_c_l274_c22_a467_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_device_ram_address);

     -- CONST_REF_RD_uint12_t_uint12_t_4_1_d41d_uxn_c_l308_l286_l328_DUPLICATE_c06f LATENCY=0
     VAR_CONST_REF_RD_uint12_t_uint12_t_4_1_d41d_uxn_c_l308_l286_l328_DUPLICATE_c06f_return_output := color(1);

     -- CONST_REF_RD_uint12_t_uint12_t_4_0_d41d_uxn_c_l303_l281_l324_DUPLICATE_7f9a LATENCY=0
     VAR_CONST_REF_RD_uint12_t_uint12_t_4_0_d41d_uxn_c_l303_l281_l324_DUPLICATE_7f9a_return_output := color(0);

     -- CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_uxn_c_l297_l337_l319_l331_DUPLICATE_2c65 LATENCY=0
     VAR_CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_uxn_c_l297_l337_l319_l331_DUPLICATE_2c65_return_output := color(3);

     -- Submodule level 1
     VAR_BIN_OP_EQ_uxn_c_l278_c7_83da_left := VAR_CAST_TO_uint4_t_uxn_c_l274_c22_a467_return_output;
     VAR_BIN_OP_EQ_uxn_c_l289_c12_fd5d_left := VAR_CAST_TO_uint4_t_uxn_c_l274_c22_a467_return_output;
     VAR_BIN_OP_EQ_uxn_c_l300_c12_0083_left := VAR_CAST_TO_uint4_t_uxn_c_l274_c22_a467_return_output;
     VAR_BIN_OP_EQ_uxn_c_l311_c12_aa3d_left := VAR_CAST_TO_uint4_t_uxn_c_l274_c22_a467_return_output;
     VAR_BIN_OP_EQ_uxn_c_l322_c12_9e24_left := VAR_CAST_TO_uint4_t_uxn_c_l274_c22_a467_return_output;
     VAR_BIN_OP_EQ_uxn_c_l331_c12_cf1a_left := VAR_CAST_TO_uint4_t_uxn_c_l274_c22_a467_return_output;
     VAR_color_cmp_1_uxn_c_l276_c11_a84b_0 := VAR_CAST_TO_uint4_t_uxn_c_l276_c25_1e06_return_output;
     VAR_BIN_OP_AND_uxn_c_l281_c4_161b_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_0_d41d_uxn_c_l303_l281_l324_DUPLICATE_7f9a_return_output;
     VAR_BIN_OP_AND_uxn_c_l303_c4_2ab7_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_0_d41d_uxn_c_l303_l281_l324_DUPLICATE_7f9a_return_output;
     VAR_BIN_OP_AND_uxn_c_l324_c4_1535_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_0_d41d_uxn_c_l303_l281_l324_DUPLICATE_7f9a_return_output;
     VAR_BIN_OP_AND_uxn_c_l286_c4_795f_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_1_d41d_uxn_c_l308_l286_l328_DUPLICATE_c06f_return_output;
     VAR_BIN_OP_AND_uxn_c_l308_c4_fb94_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_1_d41d_uxn_c_l308_l286_l328_DUPLICATE_c06f_return_output;
     VAR_BIN_OP_AND_uxn_c_l328_c4_5a7d_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_1_d41d_uxn_c_l308_l286_l328_DUPLICATE_c06f_return_output;
     VAR_BIN_OP_AND_uxn_c_l292_c4_c2c0_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_uxn_c_l292_l333_l314_l331_DUPLICATE_bc1b_return_output;
     VAR_BIN_OP_AND_uxn_c_l314_c4_a28b_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_uxn_c_l292_l333_l314_l331_DUPLICATE_bc1b_return_output;
     VAR_BIN_OP_AND_uxn_c_l333_c4_cfc6_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_uxn_c_l292_l333_l314_l331_DUPLICATE_bc1b_return_output;
     VAR_color_2_MUX_uxn_c_l331_c8_94a1_iffalse := VAR_CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_uxn_c_l292_l333_l314_l331_DUPLICATE_bc1b_return_output;
     VAR_BIN_OP_AND_uxn_c_l297_c4_e4ff_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_uxn_c_l297_l337_l319_l331_DUPLICATE_2c65_return_output;
     VAR_BIN_OP_AND_uxn_c_l319_c4_1697_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_uxn_c_l297_l337_l319_l331_DUPLICATE_2c65_return_output;
     VAR_BIN_OP_AND_uxn_c_l337_c4_ca98_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_uxn_c_l297_l337_l319_l331_DUPLICATE_2c65_return_output;
     VAR_color_3_MUX_uxn_c_l331_c8_94a1_iffalse := VAR_CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_uxn_c_l297_l337_l319_l331_DUPLICATE_2c65_return_output;
     VAR_BIN_OP_EQ_uxn_c_l270_c30_cc02_left := VAR_CONST_SR_4_uxn_c_l270_c30_3bed_return_output;
     VAR_tmp12_uxn_c_l284_c4_9258 := resize(VAR_color_cmp_1_uxn_c_l276_c11_a84b_0, 12);
     VAR_tmp12_uxn_c_l295_c4_5bdd := resize(VAR_color_cmp_1_uxn_c_l276_c11_a84b_0, 12);
     VAR_tmp12_uxn_c_l306_c4_6657 := resize(VAR_color_cmp_1_uxn_c_l276_c11_a84b_0, 12);
     VAR_tmp12_uxn_c_l317_c4_93da := resize(VAR_color_cmp_1_uxn_c_l276_c11_a84b_0, 12);
     VAR_CONST_SL_8_uxn_c_l285_c4_65f6_x := VAR_tmp12_uxn_c_l284_c4_9258;
     VAR_CONST_SL_8_uxn_c_l296_c4_5b58_x := VAR_tmp12_uxn_c_l295_c4_5bdd;
     VAR_CONST_SL_4_uxn_c_l307_c4_c621_x := VAR_tmp12_uxn_c_l306_c4_6657;
     VAR_CONST_SL_4_uxn_c_l318_c4_e621_x := VAR_tmp12_uxn_c_l317_c4_93da;
     -- CONST_SL_8[uxn_c_l296_c4_5b58] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l296_c4_5b58_x <= VAR_CONST_SL_8_uxn_c_l296_c4_5b58_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l296_c4_5b58_return_output := CONST_SL_8_uxn_c_l296_c4_5b58_return_output;

     -- BIN_OP_AND[uxn_c_l308_c4_fb94] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l308_c4_fb94_left <= VAR_BIN_OP_AND_uxn_c_l308_c4_fb94_left;
     BIN_OP_AND_uxn_c_l308_c4_fb94_right <= VAR_BIN_OP_AND_uxn_c_l308_c4_fb94_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l308_c4_fb94_return_output := BIN_OP_AND_uxn_c_l308_c4_fb94_return_output;

     -- CAST_TO_uint12_t_uint4_t_uxn_c_l327_l336_DUPLICATE_4532 LATENCY=0
     VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l327_l336_DUPLICATE_4532_return_output := CAST_TO_uint12_t_uint4_t(
     VAR_color_cmp_1_uxn_c_l276_c11_a84b_0);

     -- BIN_OP_EQ[uxn_c_l278_c7_83da] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l278_c7_83da_left <= VAR_BIN_OP_EQ_uxn_c_l278_c7_83da_left;
     BIN_OP_EQ_uxn_c_l278_c7_83da_right <= VAR_BIN_OP_EQ_uxn_c_l278_c7_83da_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l278_c7_83da_return_output := BIN_OP_EQ_uxn_c_l278_c7_83da_return_output;

     -- BIN_OP_AND[uxn_c_l303_c4_2ab7] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l303_c4_2ab7_left <= VAR_BIN_OP_AND_uxn_c_l303_c4_2ab7_left;
     BIN_OP_AND_uxn_c_l303_c4_2ab7_right <= VAR_BIN_OP_AND_uxn_c_l303_c4_2ab7_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l303_c4_2ab7_return_output := BIN_OP_AND_uxn_c_l303_c4_2ab7_return_output;

     -- BIN_OP_EQ[uxn_c_l311_c12_aa3d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l311_c12_aa3d_left <= VAR_BIN_OP_EQ_uxn_c_l311_c12_aa3d_left;
     BIN_OP_EQ_uxn_c_l311_c12_aa3d_right <= VAR_BIN_OP_EQ_uxn_c_l311_c12_aa3d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l311_c12_aa3d_return_output := BIN_OP_EQ_uxn_c_l311_c12_aa3d_return_output;

     -- BIN_OP_EQ[uxn_c_l289_c12_fd5d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l289_c12_fd5d_left <= VAR_BIN_OP_EQ_uxn_c_l289_c12_fd5d_left;
     BIN_OP_EQ_uxn_c_l289_c12_fd5d_right <= VAR_BIN_OP_EQ_uxn_c_l289_c12_fd5d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l289_c12_fd5d_return_output := BIN_OP_EQ_uxn_c_l289_c12_fd5d_return_output;

     -- BIN_OP_AND[uxn_c_l319_c4_1697] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l319_c4_1697_left <= VAR_BIN_OP_AND_uxn_c_l319_c4_1697_left;
     BIN_OP_AND_uxn_c_l319_c4_1697_right <= VAR_BIN_OP_AND_uxn_c_l319_c4_1697_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l319_c4_1697_return_output := BIN_OP_AND_uxn_c_l319_c4_1697_return_output;

     -- BIN_OP_AND[uxn_c_l292_c4_c2c0] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l292_c4_c2c0_left <= VAR_BIN_OP_AND_uxn_c_l292_c4_c2c0_left;
     BIN_OP_AND_uxn_c_l292_c4_c2c0_right <= VAR_BIN_OP_AND_uxn_c_l292_c4_c2c0_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l292_c4_c2c0_return_output := BIN_OP_AND_uxn_c_l292_c4_c2c0_return_output;

     -- BIN_OP_AND[uxn_c_l297_c4_e4ff] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l297_c4_e4ff_left <= VAR_BIN_OP_AND_uxn_c_l297_c4_e4ff_left;
     BIN_OP_AND_uxn_c_l297_c4_e4ff_right <= VAR_BIN_OP_AND_uxn_c_l297_c4_e4ff_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l297_c4_e4ff_return_output := BIN_OP_AND_uxn_c_l297_c4_e4ff_return_output;

     -- BIN_OP_AND[uxn_c_l314_c4_a28b] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l314_c4_a28b_left <= VAR_BIN_OP_AND_uxn_c_l314_c4_a28b_left;
     BIN_OP_AND_uxn_c_l314_c4_a28b_right <= VAR_BIN_OP_AND_uxn_c_l314_c4_a28b_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l314_c4_a28b_return_output := BIN_OP_AND_uxn_c_l314_c4_a28b_return_output;

     -- BIN_OP_AND[uxn_c_l337_c4_ca98] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l337_c4_ca98_left <= VAR_BIN_OP_AND_uxn_c_l337_c4_ca98_left;
     BIN_OP_AND_uxn_c_l337_c4_ca98_right <= VAR_BIN_OP_AND_uxn_c_l337_c4_ca98_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l337_c4_ca98_return_output := BIN_OP_AND_uxn_c_l337_c4_ca98_return_output;

     -- BIN_OP_AND[uxn_c_l324_c4_1535] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l324_c4_1535_left <= VAR_BIN_OP_AND_uxn_c_l324_c4_1535_left;
     BIN_OP_AND_uxn_c_l324_c4_1535_right <= VAR_BIN_OP_AND_uxn_c_l324_c4_1535_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l324_c4_1535_return_output := BIN_OP_AND_uxn_c_l324_c4_1535_return_output;

     -- CONST_SL_4[uxn_c_l318_c4_e621] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_c_l318_c4_e621_x <= VAR_CONST_SL_4_uxn_c_l318_c4_e621_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_c_l318_c4_e621_return_output := CONST_SL_4_uxn_c_l318_c4_e621_return_output;

     -- CONST_SL_8[uxn_c_l285_c4_65f6] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l285_c4_65f6_x <= VAR_CONST_SL_8_uxn_c_l285_c4_65f6_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l285_c4_65f6_return_output := CONST_SL_8_uxn_c_l285_c4_65f6_return_output;

     -- BIN_OP_EQ[uxn_c_l270_c30_cc02] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l270_c30_cc02_left <= VAR_BIN_OP_EQ_uxn_c_l270_c30_cc02_left;
     BIN_OP_EQ_uxn_c_l270_c30_cc02_right <= VAR_BIN_OP_EQ_uxn_c_l270_c30_cc02_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l270_c30_cc02_return_output := BIN_OP_EQ_uxn_c_l270_c30_cc02_return_output;

     -- BIN_OP_AND[uxn_c_l286_c4_795f] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l286_c4_795f_left <= VAR_BIN_OP_AND_uxn_c_l286_c4_795f_left;
     BIN_OP_AND_uxn_c_l286_c4_795f_right <= VAR_BIN_OP_AND_uxn_c_l286_c4_795f_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l286_c4_795f_return_output := BIN_OP_AND_uxn_c_l286_c4_795f_return_output;

     -- CONST_SL_4[uxn_c_l307_c4_c621] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_c_l307_c4_c621_x <= VAR_CONST_SL_4_uxn_c_l307_c4_c621_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_c_l307_c4_c621_return_output := CONST_SL_4_uxn_c_l307_c4_c621_return_output;

     -- BIN_OP_EQ[uxn_c_l331_c12_cf1a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l331_c12_cf1a_left <= VAR_BIN_OP_EQ_uxn_c_l331_c12_cf1a_left;
     BIN_OP_EQ_uxn_c_l331_c12_cf1a_right <= VAR_BIN_OP_EQ_uxn_c_l331_c12_cf1a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l331_c12_cf1a_return_output := BIN_OP_EQ_uxn_c_l331_c12_cf1a_return_output;

     -- CAST_TO_uint4_t[uxn_c_l275_c25_4888] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_c_l275_c25_4888_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_CONST_SR_4_uxn_c_l275_c35_03a6_return_output);

     -- BIN_OP_EQ[uxn_c_l322_c12_9e24] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l322_c12_9e24_left <= VAR_BIN_OP_EQ_uxn_c_l322_c12_9e24_left;
     BIN_OP_EQ_uxn_c_l322_c12_9e24_right <= VAR_BIN_OP_EQ_uxn_c_l322_c12_9e24_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l322_c12_9e24_return_output := BIN_OP_EQ_uxn_c_l322_c12_9e24_return_output;

     -- BIN_OP_AND[uxn_c_l328_c4_5a7d] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l328_c4_5a7d_left <= VAR_BIN_OP_AND_uxn_c_l328_c4_5a7d_left;
     BIN_OP_AND_uxn_c_l328_c4_5a7d_right <= VAR_BIN_OP_AND_uxn_c_l328_c4_5a7d_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l328_c4_5a7d_return_output := BIN_OP_AND_uxn_c_l328_c4_5a7d_return_output;

     -- BIN_OP_AND[uxn_c_l281_c4_161b] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l281_c4_161b_left <= VAR_BIN_OP_AND_uxn_c_l281_c4_161b_left;
     BIN_OP_AND_uxn_c_l281_c4_161b_right <= VAR_BIN_OP_AND_uxn_c_l281_c4_161b_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l281_c4_161b_return_output := BIN_OP_AND_uxn_c_l281_c4_161b_return_output;

     -- BIN_OP_EQ[uxn_c_l300_c12_0083] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l300_c12_0083_left <= VAR_BIN_OP_EQ_uxn_c_l300_c12_0083_left;
     BIN_OP_EQ_uxn_c_l300_c12_0083_right <= VAR_BIN_OP_EQ_uxn_c_l300_c12_0083_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l300_c12_0083_return_output := BIN_OP_EQ_uxn_c_l300_c12_0083_return_output;

     -- BIN_OP_AND[uxn_c_l333_c4_cfc6] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l333_c4_cfc6_left <= VAR_BIN_OP_AND_uxn_c_l333_c4_cfc6_left;
     BIN_OP_AND_uxn_c_l333_c4_cfc6_right <= VAR_BIN_OP_AND_uxn_c_l333_c4_cfc6_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l333_c4_cfc6_return_output := BIN_OP_AND_uxn_c_l333_c4_cfc6_return_output;

     -- Submodule level 2
     VAR_BIN_OP_OR_uxn_c_l282_c4_fcfa_left := VAR_BIN_OP_AND_uxn_c_l281_c4_161b_return_output;
     VAR_BIN_OP_OR_uxn_c_l287_c4_ef35_left := VAR_BIN_OP_AND_uxn_c_l286_c4_795f_return_output;
     VAR_BIN_OP_OR_uxn_c_l293_c4_2c46_left := VAR_BIN_OP_AND_uxn_c_l292_c4_c2c0_return_output;
     VAR_BIN_OP_OR_uxn_c_l298_c4_4895_left := VAR_BIN_OP_AND_uxn_c_l297_c4_e4ff_return_output;
     VAR_BIN_OP_OR_uxn_c_l304_c4_0f1b_left := VAR_BIN_OP_AND_uxn_c_l303_c4_2ab7_return_output;
     VAR_BIN_OP_OR_uxn_c_l309_c4_2495_left := VAR_BIN_OP_AND_uxn_c_l308_c4_fb94_return_output;
     VAR_BIN_OP_OR_uxn_c_l315_c4_976c_left := VAR_BIN_OP_AND_uxn_c_l314_c4_a28b_return_output;
     VAR_BIN_OP_OR_uxn_c_l320_c4_e5c7_left := VAR_BIN_OP_AND_uxn_c_l319_c4_1697_return_output;
     VAR_BIN_OP_OR_uxn_c_l325_c4_feee_left := VAR_BIN_OP_AND_uxn_c_l324_c4_1535_return_output;
     VAR_BIN_OP_OR_uxn_c_l329_c4_4431_left := VAR_BIN_OP_AND_uxn_c_l328_c4_5a7d_return_output;
     VAR_BIN_OP_OR_uxn_c_l334_c4_7d26_left := VAR_BIN_OP_AND_uxn_c_l333_c4_cfc6_return_output;
     VAR_BIN_OP_OR_uxn_c_l338_c4_5b21_left := VAR_BIN_OP_AND_uxn_c_l337_c4_ca98_return_output;
     VAR_MUX_uxn_c_l270_c30_6bdf_cond := VAR_BIN_OP_EQ_uxn_c_l270_c30_cc02_return_output;
     VAR_color_MUX_uxn_c_l278_c3_4b48_cond := VAR_BIN_OP_EQ_uxn_c_l278_c7_83da_return_output;
     VAR_color_MUX_uxn_c_l289_c8_3374_cond := VAR_BIN_OP_EQ_uxn_c_l289_c12_fd5d_return_output;
     VAR_color_MUX_uxn_c_l300_c8_33bd_cond := VAR_BIN_OP_EQ_uxn_c_l300_c12_0083_return_output;
     VAR_color_MUX_uxn_c_l311_c8_90b8_cond := VAR_BIN_OP_EQ_uxn_c_l311_c12_aa3d_return_output;
     VAR_color_MUX_uxn_c_l322_c8_836e_cond := VAR_BIN_OP_EQ_uxn_c_l322_c12_9e24_return_output;
     VAR_color_2_MUX_uxn_c_l331_c8_94a1_cond := VAR_BIN_OP_EQ_uxn_c_l331_c12_cf1a_return_output;
     VAR_color_3_MUX_uxn_c_l331_c8_94a1_cond := VAR_BIN_OP_EQ_uxn_c_l331_c12_cf1a_return_output;
     VAR_BIN_OP_OR_uxn_c_l329_c4_4431_right := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l327_l336_DUPLICATE_4532_return_output;
     VAR_BIN_OP_OR_uxn_c_l338_c4_5b21_right := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l327_l336_DUPLICATE_4532_return_output;
     VAR_color_cmp_0_uxn_c_l275_c11_898f_0 := VAR_CAST_TO_uint4_t_uxn_c_l275_c25_4888_return_output;
     VAR_BIN_OP_OR_uxn_c_l309_c4_2495_right := VAR_CONST_SL_4_uxn_c_l307_c4_c621_return_output;
     VAR_BIN_OP_OR_uxn_c_l320_c4_e5c7_right := VAR_CONST_SL_4_uxn_c_l318_c4_e621_return_output;
     VAR_BIN_OP_OR_uxn_c_l287_c4_ef35_right := VAR_CONST_SL_8_uxn_c_l285_c4_65f6_return_output;
     VAR_BIN_OP_OR_uxn_c_l298_c4_4895_right := VAR_CONST_SL_8_uxn_c_l296_c4_5b58_return_output;
     VAR_tmp12_uxn_c_l279_c4_c086 := resize(VAR_color_cmp_0_uxn_c_l275_c11_898f_0, 12);
     VAR_tmp12_uxn_c_l290_c4_a10c := resize(VAR_color_cmp_0_uxn_c_l275_c11_898f_0, 12);
     VAR_tmp12_uxn_c_l301_c4_d37a := resize(VAR_color_cmp_0_uxn_c_l275_c11_898f_0, 12);
     VAR_tmp12_uxn_c_l312_c4_6247 := resize(VAR_color_cmp_0_uxn_c_l275_c11_898f_0, 12);
     VAR_CONST_SL_8_uxn_c_l280_c4_7a80_x := VAR_tmp12_uxn_c_l279_c4_c086;
     VAR_CONST_SL_8_uxn_c_l291_c4_7d9b_x := VAR_tmp12_uxn_c_l290_c4_a10c;
     VAR_CONST_SL_4_uxn_c_l302_c4_422f_x := VAR_tmp12_uxn_c_l301_c4_d37a;
     VAR_CONST_SL_4_uxn_c_l313_c4_e399_x := VAR_tmp12_uxn_c_l312_c4_6247;
     -- BIN_OP_OR[uxn_c_l287_c4_ef35] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l287_c4_ef35_left <= VAR_BIN_OP_OR_uxn_c_l287_c4_ef35_left;
     BIN_OP_OR_uxn_c_l287_c4_ef35_right <= VAR_BIN_OP_OR_uxn_c_l287_c4_ef35_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l287_c4_ef35_return_output := BIN_OP_OR_uxn_c_l287_c4_ef35_return_output;

     -- BIN_OP_OR[uxn_c_l320_c4_e5c7] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l320_c4_e5c7_left <= VAR_BIN_OP_OR_uxn_c_l320_c4_e5c7_left;
     BIN_OP_OR_uxn_c_l320_c4_e5c7_right <= VAR_BIN_OP_OR_uxn_c_l320_c4_e5c7_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l320_c4_e5c7_return_output := BIN_OP_OR_uxn_c_l320_c4_e5c7_return_output;

     -- BIN_OP_OR[uxn_c_l298_c4_4895] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l298_c4_4895_left <= VAR_BIN_OP_OR_uxn_c_l298_c4_4895_left;
     BIN_OP_OR_uxn_c_l298_c4_4895_right <= VAR_BIN_OP_OR_uxn_c_l298_c4_4895_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l298_c4_4895_return_output := BIN_OP_OR_uxn_c_l298_c4_4895_return_output;

     -- BIN_OP_OR[uxn_c_l329_c4_4431] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l329_c4_4431_left <= VAR_BIN_OP_OR_uxn_c_l329_c4_4431_left;
     BIN_OP_OR_uxn_c_l329_c4_4431_right <= VAR_BIN_OP_OR_uxn_c_l329_c4_4431_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l329_c4_4431_return_output := BIN_OP_OR_uxn_c_l329_c4_4431_return_output;

     -- CONST_SL_4[uxn_c_l313_c4_e399] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_c_l313_c4_e399_x <= VAR_CONST_SL_4_uxn_c_l313_c4_e399_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_c_l313_c4_e399_return_output := CONST_SL_4_uxn_c_l313_c4_e399_return_output;

     -- BIN_OP_OR[uxn_c_l338_c4_5b21] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l338_c4_5b21_left <= VAR_BIN_OP_OR_uxn_c_l338_c4_5b21_left;
     BIN_OP_OR_uxn_c_l338_c4_5b21_right <= VAR_BIN_OP_OR_uxn_c_l338_c4_5b21_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l338_c4_5b21_return_output := BIN_OP_OR_uxn_c_l338_c4_5b21_return_output;

     -- CAST_TO_uint12_t_uint4_t_uxn_c_l323_l332_DUPLICATE_7d45 LATENCY=0
     VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l323_l332_DUPLICATE_7d45_return_output := CAST_TO_uint12_t_uint4_t(
     VAR_color_cmp_0_uxn_c_l275_c11_898f_0);

     -- CONST_SL_4[uxn_c_l302_c4_422f] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_c_l302_c4_422f_x <= VAR_CONST_SL_4_uxn_c_l302_c4_422f_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_c_l302_c4_422f_return_output := CONST_SL_4_uxn_c_l302_c4_422f_return_output;

     -- CONST_SL_8[uxn_c_l280_c4_7a80] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l280_c4_7a80_x <= VAR_CONST_SL_8_uxn_c_l280_c4_7a80_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l280_c4_7a80_return_output := CONST_SL_8_uxn_c_l280_c4_7a80_return_output;

     -- MUX[uxn_c_l270_c30_6bdf] LATENCY=0
     -- Inputs
     MUX_uxn_c_l270_c30_6bdf_cond <= VAR_MUX_uxn_c_l270_c30_6bdf_cond;
     MUX_uxn_c_l270_c30_6bdf_iftrue <= VAR_MUX_uxn_c_l270_c30_6bdf_iftrue;
     MUX_uxn_c_l270_c30_6bdf_iffalse <= VAR_MUX_uxn_c_l270_c30_6bdf_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l270_c30_6bdf_return_output := MUX_uxn_c_l270_c30_6bdf_return_output;

     -- BIN_OP_OR[uxn_c_l309_c4_2495] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l309_c4_2495_left <= VAR_BIN_OP_OR_uxn_c_l309_c4_2495_left;
     BIN_OP_OR_uxn_c_l309_c4_2495_right <= VAR_BIN_OP_OR_uxn_c_l309_c4_2495_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l309_c4_2495_return_output := BIN_OP_OR_uxn_c_l309_c4_2495_return_output;

     -- CONST_SL_8[uxn_c_l291_c4_7d9b] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l291_c4_7d9b_x <= VAR_CONST_SL_8_uxn_c_l291_c4_7d9b_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l291_c4_7d9b_return_output := CONST_SL_8_uxn_c_l291_c4_7d9b_return_output;

     -- Submodule level 3
     VAR_color_3_MUX_uxn_c_l331_c8_94a1_iftrue := VAR_BIN_OP_OR_uxn_c_l338_c4_5b21_return_output;
     VAR_BIN_OP_OR_uxn_c_l325_c4_feee_right := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l323_l332_DUPLICATE_7d45_return_output;
     VAR_BIN_OP_OR_uxn_c_l334_c4_7d26_right := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l323_l332_DUPLICATE_7d45_return_output;
     VAR_BIN_OP_OR_uxn_c_l304_c4_0f1b_right := VAR_CONST_SL_4_uxn_c_l302_c4_422f_return_output;
     VAR_BIN_OP_OR_uxn_c_l315_c4_976c_right := VAR_CONST_SL_4_uxn_c_l313_c4_e399_return_output;
     VAR_BIN_OP_OR_uxn_c_l282_c4_fcfa_right := VAR_CONST_SL_8_uxn_c_l280_c4_7a80_return_output;
     VAR_BIN_OP_OR_uxn_c_l293_c4_2c46_right := VAR_CONST_SL_8_uxn_c_l291_c4_7d9b_return_output;
     VAR_BIN_OP_AND_uxn_c_l272_c6_9361_right := VAR_MUX_uxn_c_l270_c30_6bdf_return_output;
     -- BIN_OP_AND[uxn_c_l272_c6_9361] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l272_c6_9361_left <= VAR_BIN_OP_AND_uxn_c_l272_c6_9361_left;
     BIN_OP_AND_uxn_c_l272_c6_9361_right <= VAR_BIN_OP_AND_uxn_c_l272_c6_9361_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l272_c6_9361_return_output := BIN_OP_AND_uxn_c_l272_c6_9361_return_output;

     -- BIN_OP_OR[uxn_c_l304_c4_0f1b] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l304_c4_0f1b_left <= VAR_BIN_OP_OR_uxn_c_l304_c4_0f1b_left;
     BIN_OP_OR_uxn_c_l304_c4_0f1b_right <= VAR_BIN_OP_OR_uxn_c_l304_c4_0f1b_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l304_c4_0f1b_return_output := BIN_OP_OR_uxn_c_l304_c4_0f1b_return_output;

     -- BIN_OP_OR[uxn_c_l334_c4_7d26] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l334_c4_7d26_left <= VAR_BIN_OP_OR_uxn_c_l334_c4_7d26_left;
     BIN_OP_OR_uxn_c_l334_c4_7d26_right <= VAR_BIN_OP_OR_uxn_c_l334_c4_7d26_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l334_c4_7d26_return_output := BIN_OP_OR_uxn_c_l334_c4_7d26_return_output;

     -- color_3_MUX[uxn_c_l331_c8_94a1] LATENCY=0
     -- Inputs
     color_3_MUX_uxn_c_l331_c8_94a1_cond <= VAR_color_3_MUX_uxn_c_l331_c8_94a1_cond;
     color_3_MUX_uxn_c_l331_c8_94a1_iftrue <= VAR_color_3_MUX_uxn_c_l331_c8_94a1_iftrue;
     color_3_MUX_uxn_c_l331_c8_94a1_iffalse <= VAR_color_3_MUX_uxn_c_l331_c8_94a1_iffalse;
     -- Outputs
     VAR_color_3_MUX_uxn_c_l331_c8_94a1_return_output := color_3_MUX_uxn_c_l331_c8_94a1_return_output;

     -- BIN_OP_OR[uxn_c_l315_c4_976c] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l315_c4_976c_left <= VAR_BIN_OP_OR_uxn_c_l315_c4_976c_left;
     BIN_OP_OR_uxn_c_l315_c4_976c_right <= VAR_BIN_OP_OR_uxn_c_l315_c4_976c_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l315_c4_976c_return_output := BIN_OP_OR_uxn_c_l315_c4_976c_return_output;

     -- BIN_OP_OR[uxn_c_l282_c4_fcfa] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l282_c4_fcfa_left <= VAR_BIN_OP_OR_uxn_c_l282_c4_fcfa_left;
     BIN_OP_OR_uxn_c_l282_c4_fcfa_right <= VAR_BIN_OP_OR_uxn_c_l282_c4_fcfa_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l282_c4_fcfa_return_output := BIN_OP_OR_uxn_c_l282_c4_fcfa_return_output;

     -- BIN_OP_OR[uxn_c_l325_c4_feee] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l325_c4_feee_left <= VAR_BIN_OP_OR_uxn_c_l325_c4_feee_left;
     BIN_OP_OR_uxn_c_l325_c4_feee_right <= VAR_BIN_OP_OR_uxn_c_l325_c4_feee_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l325_c4_feee_return_output := BIN_OP_OR_uxn_c_l325_c4_feee_return_output;

     -- BIN_OP_OR[uxn_c_l293_c4_2c46] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l293_c4_2c46_left <= VAR_BIN_OP_OR_uxn_c_l293_c4_2c46_left;
     BIN_OP_OR_uxn_c_l293_c4_2c46_right <= VAR_BIN_OP_OR_uxn_c_l293_c4_2c46_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l293_c4_2c46_return_output := BIN_OP_OR_uxn_c_l293_c4_2c46_return_output;

     -- Submodule level 4
     VAR_color_MUX_uxn_c_l272_c2_f65c_cond := VAR_BIN_OP_AND_uxn_c_l272_c6_9361_return_output;
     VAR_color_2_MUX_uxn_c_l331_c8_94a1_iftrue := VAR_BIN_OP_OR_uxn_c_l334_c4_7d26_return_output;
     -- color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5[uxn_c_l289_c8_3374] LATENCY=0
     VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l289_c8_3374_return_output := CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5(
     color,
     VAR_BIN_OP_OR_uxn_c_l293_c4_2c46_return_output,
     VAR_BIN_OP_OR_uxn_c_l298_c4_4895_return_output);

     -- color_2_MUX[uxn_c_l331_c8_94a1] LATENCY=0
     -- Inputs
     color_2_MUX_uxn_c_l331_c8_94a1_cond <= VAR_color_2_MUX_uxn_c_l331_c8_94a1_cond;
     color_2_MUX_uxn_c_l331_c8_94a1_iftrue <= VAR_color_2_MUX_uxn_c_l331_c8_94a1_iftrue;
     color_2_MUX_uxn_c_l331_c8_94a1_iffalse <= VAR_color_2_MUX_uxn_c_l331_c8_94a1_iffalse;
     -- Outputs
     VAR_color_2_MUX_uxn_c_l331_c8_94a1_return_output := color_2_MUX_uxn_c_l331_c8_94a1_return_output;

     -- color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8[uxn_c_l278_c3_4b48] LATENCY=0
     VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l278_c3_4b48_return_output := CONST_REF_RD_uint12_t_4_uint12_t_4_90b8(
     color,
     VAR_BIN_OP_OR_uxn_c_l282_c4_fcfa_return_output,
     VAR_BIN_OP_OR_uxn_c_l287_c4_ef35_return_output);

     -- color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8[uxn_c_l322_c8_836e] LATENCY=0
     VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l322_c8_836e_return_output := CONST_REF_RD_uint12_t_4_uint12_t_4_90b8(
     color,
     VAR_BIN_OP_OR_uxn_c_l325_c4_feee_return_output,
     VAR_BIN_OP_OR_uxn_c_l329_c4_4431_return_output);

     -- color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5[uxn_c_l311_c8_90b8] LATENCY=0
     VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l311_c8_90b8_return_output := CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5(
     color,
     VAR_BIN_OP_OR_uxn_c_l315_c4_976c_return_output,
     VAR_BIN_OP_OR_uxn_c_l320_c4_e5c7_return_output);

     -- color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8[uxn_c_l300_c8_33bd] LATENCY=0
     VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l300_c8_33bd_return_output := CONST_REF_RD_uint12_t_4_uint12_t_4_90b8(
     color,
     VAR_BIN_OP_OR_uxn_c_l304_c4_0f1b_return_output,
     VAR_BIN_OP_OR_uxn_c_l309_c4_2495_return_output);

     -- Submodule level 5
     VAR_color_MUX_uxn_c_l278_c3_4b48_iftrue := VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l278_c3_4b48_return_output;
     VAR_color_MUX_uxn_c_l300_c8_33bd_iftrue := VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l300_c8_33bd_return_output;
     VAR_color_MUX_uxn_c_l322_c8_836e_iftrue := VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l322_c8_836e_return_output;
     VAR_color_MUX_uxn_c_l289_c8_3374_iftrue := VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l289_c8_3374_return_output;
     VAR_color_MUX_uxn_c_l311_c8_90b8_iftrue := VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l311_c8_90b8_return_output;
     -- color_FALSE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_3db8[uxn_c_l322_c8_836e] LATENCY=0
     VAR_color_FALSE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_3db8_uxn_c_l322_c8_836e_return_output := CONST_REF_RD_uint12_t_4_uint12_t_4_3db8(
     color,
     VAR_color_3_MUX_uxn_c_l331_c8_94a1_return_output,
     VAR_color_2_MUX_uxn_c_l331_c8_94a1_return_output);

     -- Submodule level 6
     VAR_color_MUX_uxn_c_l322_c8_836e_iffalse := VAR_color_FALSE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_3db8_uxn_c_l322_c8_836e_return_output;
     -- color_MUX[uxn_c_l322_c8_836e] LATENCY=0
     -- Inputs
     color_MUX_uxn_c_l322_c8_836e_cond <= VAR_color_MUX_uxn_c_l322_c8_836e_cond;
     color_MUX_uxn_c_l322_c8_836e_iftrue <= VAR_color_MUX_uxn_c_l322_c8_836e_iftrue;
     color_MUX_uxn_c_l322_c8_836e_iffalse <= VAR_color_MUX_uxn_c_l322_c8_836e_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_c_l322_c8_836e_return_output := color_MUX_uxn_c_l322_c8_836e_return_output;

     -- Submodule level 7
     VAR_color_MUX_uxn_c_l311_c8_90b8_iffalse := VAR_color_MUX_uxn_c_l322_c8_836e_return_output;
     -- color_MUX[uxn_c_l311_c8_90b8] LATENCY=0
     -- Inputs
     color_MUX_uxn_c_l311_c8_90b8_cond <= VAR_color_MUX_uxn_c_l311_c8_90b8_cond;
     color_MUX_uxn_c_l311_c8_90b8_iftrue <= VAR_color_MUX_uxn_c_l311_c8_90b8_iftrue;
     color_MUX_uxn_c_l311_c8_90b8_iffalse <= VAR_color_MUX_uxn_c_l311_c8_90b8_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_c_l311_c8_90b8_return_output := color_MUX_uxn_c_l311_c8_90b8_return_output;

     -- Submodule level 8
     VAR_color_MUX_uxn_c_l300_c8_33bd_iffalse := VAR_color_MUX_uxn_c_l311_c8_90b8_return_output;
     -- color_MUX[uxn_c_l300_c8_33bd] LATENCY=0
     -- Inputs
     color_MUX_uxn_c_l300_c8_33bd_cond <= VAR_color_MUX_uxn_c_l300_c8_33bd_cond;
     color_MUX_uxn_c_l300_c8_33bd_iftrue <= VAR_color_MUX_uxn_c_l300_c8_33bd_iftrue;
     color_MUX_uxn_c_l300_c8_33bd_iffalse <= VAR_color_MUX_uxn_c_l300_c8_33bd_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_c_l300_c8_33bd_return_output := color_MUX_uxn_c_l300_c8_33bd_return_output;

     -- Submodule level 9
     VAR_color_MUX_uxn_c_l289_c8_3374_iffalse := VAR_color_MUX_uxn_c_l300_c8_33bd_return_output;
     -- color_MUX[uxn_c_l289_c8_3374] LATENCY=0
     -- Inputs
     color_MUX_uxn_c_l289_c8_3374_cond <= VAR_color_MUX_uxn_c_l289_c8_3374_cond;
     color_MUX_uxn_c_l289_c8_3374_iftrue <= VAR_color_MUX_uxn_c_l289_c8_3374_iftrue;
     color_MUX_uxn_c_l289_c8_3374_iffalse <= VAR_color_MUX_uxn_c_l289_c8_3374_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_c_l289_c8_3374_return_output := color_MUX_uxn_c_l289_c8_3374_return_output;

     -- Submodule level 10
     VAR_color_MUX_uxn_c_l278_c3_4b48_iffalse := VAR_color_MUX_uxn_c_l289_c8_3374_return_output;
     -- color_MUX[uxn_c_l278_c3_4b48] LATENCY=0
     -- Inputs
     color_MUX_uxn_c_l278_c3_4b48_cond <= VAR_color_MUX_uxn_c_l278_c3_4b48_cond;
     color_MUX_uxn_c_l278_c3_4b48_iftrue <= VAR_color_MUX_uxn_c_l278_c3_4b48_iftrue;
     color_MUX_uxn_c_l278_c3_4b48_iffalse <= VAR_color_MUX_uxn_c_l278_c3_4b48_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_c_l278_c3_4b48_return_output := color_MUX_uxn_c_l278_c3_4b48_return_output;

     -- Submodule level 11
     VAR_color_MUX_uxn_c_l272_c2_f65c_iftrue := VAR_color_MUX_uxn_c_l278_c3_4b48_return_output;
     -- color_MUX[uxn_c_l272_c2_f65c] LATENCY=0
     -- Inputs
     color_MUX_uxn_c_l272_c2_f65c_cond <= VAR_color_MUX_uxn_c_l272_c2_f65c_cond;
     color_MUX_uxn_c_l272_c2_f65c_iftrue <= VAR_color_MUX_uxn_c_l272_c2_f65c_iftrue;
     color_MUX_uxn_c_l272_c2_f65c_iffalse <= VAR_color_MUX_uxn_c_l272_c2_f65c_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_c_l272_c2_f65c_return_output := color_MUX_uxn_c_l272_c2_f65c_return_output;

     -- Submodule level 12
     VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l342_c20_b0ed_ref_toks_0 := VAR_color_MUX_uxn_c_l272_c2_f65c_return_output;
     REG_VAR_color := VAR_color_MUX_uxn_c_l272_c2_f65c_return_output;
     -- VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d[uxn_c_l342_c20_b0ed] LATENCY=0
     -- Inputs
     VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l342_c20_b0ed_ref_toks_0 <= VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l342_c20_b0ed_ref_toks_0;
     VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l342_c20_b0ed_var_dim_0 <= VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l342_c20_b0ed_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l342_c20_b0ed_return_output := VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l342_c20_b0ed_return_output;

     -- Submodule level 13
     VAR_result_uxn_c_l342_c11_6a09_0 := resize(VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l342_c20_b0ed_return_output, 16);
     VAR_return_output := VAR_result_uxn_c_l342_c11_6a09_0;
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
