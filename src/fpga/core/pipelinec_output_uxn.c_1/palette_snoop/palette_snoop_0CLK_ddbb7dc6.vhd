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
-- CONST_SR_4[uxn_c_l270_c30_c763]
signal CONST_SR_4_uxn_c_l270_c30_c763_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_c_l270_c30_c763_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_c_l270_c30_569a]
signal BIN_OP_EQ_uxn_c_l270_c30_569a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l270_c30_569a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l270_c30_569a_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l270_c30_3802]
signal MUX_uxn_c_l270_c30_3802_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l270_c30_3802_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l270_c30_3802_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l270_c30_3802_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l272_c6_32bc]
signal BIN_OP_AND_uxn_c_l272_c6_32bc_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l272_c6_32bc_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l272_c6_32bc_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_c_l272_c2_dda9]
signal color_MUX_uxn_c_l272_c2_dda9_cond : unsigned(0 downto 0);
signal color_MUX_uxn_c_l272_c2_dda9_iftrue : uint12_t_4;
signal color_MUX_uxn_c_l272_c2_dda9_iffalse : uint12_t_4;
signal color_MUX_uxn_c_l272_c2_dda9_return_output : uint12_t_4;

-- CONST_SR_4[uxn_c_l275_c35_c42f]
signal CONST_SR_4_uxn_c_l275_c35_c42f_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_c_l275_c35_c42f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_c_l278_c7_293e]
signal BIN_OP_EQ_uxn_c_l278_c7_293e_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l278_c7_293e_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l278_c7_293e_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_c_l278_c3_fc29]
signal color_MUX_uxn_c_l278_c3_fc29_cond : unsigned(0 downto 0);
signal color_MUX_uxn_c_l278_c3_fc29_iftrue : uint12_t_4;
signal color_MUX_uxn_c_l278_c3_fc29_iffalse : uint12_t_4;
signal color_MUX_uxn_c_l278_c3_fc29_return_output : uint12_t_4;

-- CONST_SL_8[uxn_c_l280_c4_9e64]
signal CONST_SL_8_uxn_c_l280_c4_9e64_x : unsigned(11 downto 0);
signal CONST_SL_8_uxn_c_l280_c4_9e64_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l281_c4_1d28]
signal BIN_OP_AND_uxn_c_l281_c4_1d28_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l281_c4_1d28_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l281_c4_1d28_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l282_c4_a98f]
signal BIN_OP_OR_uxn_c_l282_c4_a98f_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l282_c4_a98f_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l282_c4_a98f_return_output : unsigned(11 downto 0);

-- CONST_SL_8[uxn_c_l285_c4_1228]
signal CONST_SL_8_uxn_c_l285_c4_1228_x : unsigned(11 downto 0);
signal CONST_SL_8_uxn_c_l285_c4_1228_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l286_c4_a892]
signal BIN_OP_AND_uxn_c_l286_c4_a892_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l286_c4_a892_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l286_c4_a892_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l287_c4_6a78]
signal BIN_OP_OR_uxn_c_l287_c4_6a78_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l287_c4_6a78_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l287_c4_6a78_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l289_c12_0f20]
signal BIN_OP_EQ_uxn_c_l289_c12_0f20_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l289_c12_0f20_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l289_c12_0f20_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_c_l289_c8_6ebc]
signal color_MUX_uxn_c_l289_c8_6ebc_cond : unsigned(0 downto 0);
signal color_MUX_uxn_c_l289_c8_6ebc_iftrue : uint12_t_4;
signal color_MUX_uxn_c_l289_c8_6ebc_iffalse : uint12_t_4;
signal color_MUX_uxn_c_l289_c8_6ebc_return_output : uint12_t_4;

-- CONST_SL_8[uxn_c_l291_c4_8b56]
signal CONST_SL_8_uxn_c_l291_c4_8b56_x : unsigned(11 downto 0);
signal CONST_SL_8_uxn_c_l291_c4_8b56_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l292_c4_9de8]
signal BIN_OP_AND_uxn_c_l292_c4_9de8_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l292_c4_9de8_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l292_c4_9de8_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l293_c4_8318]
signal BIN_OP_OR_uxn_c_l293_c4_8318_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l293_c4_8318_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l293_c4_8318_return_output : unsigned(11 downto 0);

-- CONST_SL_8[uxn_c_l296_c4_5ca0]
signal CONST_SL_8_uxn_c_l296_c4_5ca0_x : unsigned(11 downto 0);
signal CONST_SL_8_uxn_c_l296_c4_5ca0_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l297_c4_27ea]
signal BIN_OP_AND_uxn_c_l297_c4_27ea_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l297_c4_27ea_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l297_c4_27ea_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l298_c4_6630]
signal BIN_OP_OR_uxn_c_l298_c4_6630_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l298_c4_6630_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l298_c4_6630_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l300_c12_5e30]
signal BIN_OP_EQ_uxn_c_l300_c12_5e30_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l300_c12_5e30_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l300_c12_5e30_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_c_l300_c8_8441]
signal color_MUX_uxn_c_l300_c8_8441_cond : unsigned(0 downto 0);
signal color_MUX_uxn_c_l300_c8_8441_iftrue : uint12_t_4;
signal color_MUX_uxn_c_l300_c8_8441_iffalse : uint12_t_4;
signal color_MUX_uxn_c_l300_c8_8441_return_output : uint12_t_4;

-- CONST_SL_4[uxn_c_l302_c4_6d1a]
signal CONST_SL_4_uxn_c_l302_c4_6d1a_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_c_l302_c4_6d1a_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l303_c4_1663]
signal BIN_OP_AND_uxn_c_l303_c4_1663_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l303_c4_1663_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l303_c4_1663_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l304_c4_391f]
signal BIN_OP_OR_uxn_c_l304_c4_391f_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l304_c4_391f_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l304_c4_391f_return_output : unsigned(11 downto 0);

-- CONST_SL_4[uxn_c_l307_c4_c75e]
signal CONST_SL_4_uxn_c_l307_c4_c75e_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_c_l307_c4_c75e_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l308_c4_f6a7]
signal BIN_OP_AND_uxn_c_l308_c4_f6a7_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l308_c4_f6a7_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l308_c4_f6a7_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l309_c4_9d71]
signal BIN_OP_OR_uxn_c_l309_c4_9d71_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l309_c4_9d71_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l309_c4_9d71_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l311_c12_0cf5]
signal BIN_OP_EQ_uxn_c_l311_c12_0cf5_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l311_c12_0cf5_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l311_c12_0cf5_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_c_l311_c8_f32e]
signal color_MUX_uxn_c_l311_c8_f32e_cond : unsigned(0 downto 0);
signal color_MUX_uxn_c_l311_c8_f32e_iftrue : uint12_t_4;
signal color_MUX_uxn_c_l311_c8_f32e_iffalse : uint12_t_4;
signal color_MUX_uxn_c_l311_c8_f32e_return_output : uint12_t_4;

-- CONST_SL_4[uxn_c_l313_c4_de87]
signal CONST_SL_4_uxn_c_l313_c4_de87_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_c_l313_c4_de87_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l314_c4_5115]
signal BIN_OP_AND_uxn_c_l314_c4_5115_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l314_c4_5115_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l314_c4_5115_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l315_c4_5b71]
signal BIN_OP_OR_uxn_c_l315_c4_5b71_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l315_c4_5b71_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l315_c4_5b71_return_output : unsigned(11 downto 0);

-- CONST_SL_4[uxn_c_l318_c4_3ae8]
signal CONST_SL_4_uxn_c_l318_c4_3ae8_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_c_l318_c4_3ae8_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l319_c4_9582]
signal BIN_OP_AND_uxn_c_l319_c4_9582_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l319_c4_9582_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l319_c4_9582_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l320_c4_9783]
signal BIN_OP_OR_uxn_c_l320_c4_9783_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l320_c4_9783_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l320_c4_9783_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l322_c12_702d]
signal BIN_OP_EQ_uxn_c_l322_c12_702d_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l322_c12_702d_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l322_c12_702d_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_c_l322_c8_64dc]
signal color_MUX_uxn_c_l322_c8_64dc_cond : unsigned(0 downto 0);
signal color_MUX_uxn_c_l322_c8_64dc_iftrue : uint12_t_4;
signal color_MUX_uxn_c_l322_c8_64dc_iffalse : uint12_t_4;
signal color_MUX_uxn_c_l322_c8_64dc_return_output : uint12_t_4;

-- BIN_OP_AND[uxn_c_l324_c4_2d60]
signal BIN_OP_AND_uxn_c_l324_c4_2d60_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l324_c4_2d60_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l324_c4_2d60_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l325_c4_2777]
signal BIN_OP_OR_uxn_c_l325_c4_2777_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l325_c4_2777_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l325_c4_2777_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l328_c4_222e]
signal BIN_OP_AND_uxn_c_l328_c4_222e_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l328_c4_222e_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l328_c4_222e_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l329_c4_4621]
signal BIN_OP_OR_uxn_c_l329_c4_4621_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l329_c4_4621_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l329_c4_4621_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l331_c12_3cf9]
signal BIN_OP_EQ_uxn_c_l331_c12_3cf9_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l331_c12_3cf9_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l331_c12_3cf9_return_output : unsigned(0 downto 0);

-- color_3_MUX[uxn_c_l331_c8_4c37]
signal color_3_MUX_uxn_c_l331_c8_4c37_cond : unsigned(0 downto 0);
signal color_3_MUX_uxn_c_l331_c8_4c37_iftrue : unsigned(11 downto 0);
signal color_3_MUX_uxn_c_l331_c8_4c37_iffalse : unsigned(11 downto 0);
signal color_3_MUX_uxn_c_l331_c8_4c37_return_output : unsigned(11 downto 0);

-- color_2_MUX[uxn_c_l331_c8_4c37]
signal color_2_MUX_uxn_c_l331_c8_4c37_cond : unsigned(0 downto 0);
signal color_2_MUX_uxn_c_l331_c8_4c37_iftrue : unsigned(11 downto 0);
signal color_2_MUX_uxn_c_l331_c8_4c37_iffalse : unsigned(11 downto 0);
signal color_2_MUX_uxn_c_l331_c8_4c37_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l333_c4_66b2]
signal BIN_OP_AND_uxn_c_l333_c4_66b2_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l333_c4_66b2_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l333_c4_66b2_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l334_c4_8ce5]
signal BIN_OP_OR_uxn_c_l334_c4_8ce5_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l334_c4_8ce5_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l334_c4_8ce5_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l337_c4_40d1]
signal BIN_OP_AND_uxn_c_l337_c4_40d1_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l337_c4_40d1_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l337_c4_40d1_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l338_c4_bc59]
signal BIN_OP_OR_uxn_c_l338_c4_bc59_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l338_c4_bc59_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l338_c4_bc59_return_output : unsigned(11 downto 0);

-- VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d[uxn_c_l342_c20_9e9f]
signal VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l342_c20_9e9f_ref_toks_0 : uint12_t_4;
signal VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l342_c20_9e9f_var_dim_0 : unsigned(1 downto 0);
signal VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l342_c20_9e9f_return_output : unsigned(11 downto 0);

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
-- CONST_SR_4_uxn_c_l270_c30_c763
CONST_SR_4_uxn_c_l270_c30_c763 : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_c_l270_c30_c763_x,
CONST_SR_4_uxn_c_l270_c30_c763_return_output);

-- BIN_OP_EQ_uxn_c_l270_c30_569a
BIN_OP_EQ_uxn_c_l270_c30_569a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l270_c30_569a_left,
BIN_OP_EQ_uxn_c_l270_c30_569a_right,
BIN_OP_EQ_uxn_c_l270_c30_569a_return_output);

-- MUX_uxn_c_l270_c30_3802
MUX_uxn_c_l270_c30_3802 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l270_c30_3802_cond,
MUX_uxn_c_l270_c30_3802_iftrue,
MUX_uxn_c_l270_c30_3802_iffalse,
MUX_uxn_c_l270_c30_3802_return_output);

-- BIN_OP_AND_uxn_c_l272_c6_32bc
BIN_OP_AND_uxn_c_l272_c6_32bc : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l272_c6_32bc_left,
BIN_OP_AND_uxn_c_l272_c6_32bc_right,
BIN_OP_AND_uxn_c_l272_c6_32bc_return_output);

-- color_MUX_uxn_c_l272_c2_dda9
color_MUX_uxn_c_l272_c2_dda9 : entity work.MUX_uint1_t_uint12_t_4_uint12_t_4_0CLK_de264c78 port map (
color_MUX_uxn_c_l272_c2_dda9_cond,
color_MUX_uxn_c_l272_c2_dda9_iftrue,
color_MUX_uxn_c_l272_c2_dda9_iffalse,
color_MUX_uxn_c_l272_c2_dda9_return_output);

-- CONST_SR_4_uxn_c_l275_c35_c42f
CONST_SR_4_uxn_c_l275_c35_c42f : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_c_l275_c35_c42f_x,
CONST_SR_4_uxn_c_l275_c35_c42f_return_output);

-- BIN_OP_EQ_uxn_c_l278_c7_293e
BIN_OP_EQ_uxn_c_l278_c7_293e : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l278_c7_293e_left,
BIN_OP_EQ_uxn_c_l278_c7_293e_right,
BIN_OP_EQ_uxn_c_l278_c7_293e_return_output);

-- color_MUX_uxn_c_l278_c3_fc29
color_MUX_uxn_c_l278_c3_fc29 : entity work.MUX_uint1_t_uint12_t_4_uint12_t_4_0CLK_de264c78 port map (
color_MUX_uxn_c_l278_c3_fc29_cond,
color_MUX_uxn_c_l278_c3_fc29_iftrue,
color_MUX_uxn_c_l278_c3_fc29_iffalse,
color_MUX_uxn_c_l278_c3_fc29_return_output);

-- CONST_SL_8_uxn_c_l280_c4_9e64
CONST_SL_8_uxn_c_l280_c4_9e64 : entity work.CONST_SL_8_uint12_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l280_c4_9e64_x,
CONST_SL_8_uxn_c_l280_c4_9e64_return_output);

-- BIN_OP_AND_uxn_c_l281_c4_1d28
BIN_OP_AND_uxn_c_l281_c4_1d28 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l281_c4_1d28_left,
BIN_OP_AND_uxn_c_l281_c4_1d28_right,
BIN_OP_AND_uxn_c_l281_c4_1d28_return_output);

-- BIN_OP_OR_uxn_c_l282_c4_a98f
BIN_OP_OR_uxn_c_l282_c4_a98f : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l282_c4_a98f_left,
BIN_OP_OR_uxn_c_l282_c4_a98f_right,
BIN_OP_OR_uxn_c_l282_c4_a98f_return_output);

-- CONST_SL_8_uxn_c_l285_c4_1228
CONST_SL_8_uxn_c_l285_c4_1228 : entity work.CONST_SL_8_uint12_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l285_c4_1228_x,
CONST_SL_8_uxn_c_l285_c4_1228_return_output);

-- BIN_OP_AND_uxn_c_l286_c4_a892
BIN_OP_AND_uxn_c_l286_c4_a892 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l286_c4_a892_left,
BIN_OP_AND_uxn_c_l286_c4_a892_right,
BIN_OP_AND_uxn_c_l286_c4_a892_return_output);

-- BIN_OP_OR_uxn_c_l287_c4_6a78
BIN_OP_OR_uxn_c_l287_c4_6a78 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l287_c4_6a78_left,
BIN_OP_OR_uxn_c_l287_c4_6a78_right,
BIN_OP_OR_uxn_c_l287_c4_6a78_return_output);

-- BIN_OP_EQ_uxn_c_l289_c12_0f20
BIN_OP_EQ_uxn_c_l289_c12_0f20 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l289_c12_0f20_left,
BIN_OP_EQ_uxn_c_l289_c12_0f20_right,
BIN_OP_EQ_uxn_c_l289_c12_0f20_return_output);

-- color_MUX_uxn_c_l289_c8_6ebc
color_MUX_uxn_c_l289_c8_6ebc : entity work.MUX_uint1_t_uint12_t_4_uint12_t_4_0CLK_de264c78 port map (
color_MUX_uxn_c_l289_c8_6ebc_cond,
color_MUX_uxn_c_l289_c8_6ebc_iftrue,
color_MUX_uxn_c_l289_c8_6ebc_iffalse,
color_MUX_uxn_c_l289_c8_6ebc_return_output);

-- CONST_SL_8_uxn_c_l291_c4_8b56
CONST_SL_8_uxn_c_l291_c4_8b56 : entity work.CONST_SL_8_uint12_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l291_c4_8b56_x,
CONST_SL_8_uxn_c_l291_c4_8b56_return_output);

-- BIN_OP_AND_uxn_c_l292_c4_9de8
BIN_OP_AND_uxn_c_l292_c4_9de8 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l292_c4_9de8_left,
BIN_OP_AND_uxn_c_l292_c4_9de8_right,
BIN_OP_AND_uxn_c_l292_c4_9de8_return_output);

-- BIN_OP_OR_uxn_c_l293_c4_8318
BIN_OP_OR_uxn_c_l293_c4_8318 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l293_c4_8318_left,
BIN_OP_OR_uxn_c_l293_c4_8318_right,
BIN_OP_OR_uxn_c_l293_c4_8318_return_output);

-- CONST_SL_8_uxn_c_l296_c4_5ca0
CONST_SL_8_uxn_c_l296_c4_5ca0 : entity work.CONST_SL_8_uint12_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l296_c4_5ca0_x,
CONST_SL_8_uxn_c_l296_c4_5ca0_return_output);

-- BIN_OP_AND_uxn_c_l297_c4_27ea
BIN_OP_AND_uxn_c_l297_c4_27ea : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l297_c4_27ea_left,
BIN_OP_AND_uxn_c_l297_c4_27ea_right,
BIN_OP_AND_uxn_c_l297_c4_27ea_return_output);

-- BIN_OP_OR_uxn_c_l298_c4_6630
BIN_OP_OR_uxn_c_l298_c4_6630 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l298_c4_6630_left,
BIN_OP_OR_uxn_c_l298_c4_6630_right,
BIN_OP_OR_uxn_c_l298_c4_6630_return_output);

-- BIN_OP_EQ_uxn_c_l300_c12_5e30
BIN_OP_EQ_uxn_c_l300_c12_5e30 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l300_c12_5e30_left,
BIN_OP_EQ_uxn_c_l300_c12_5e30_right,
BIN_OP_EQ_uxn_c_l300_c12_5e30_return_output);

-- color_MUX_uxn_c_l300_c8_8441
color_MUX_uxn_c_l300_c8_8441 : entity work.MUX_uint1_t_uint12_t_4_uint12_t_4_0CLK_de264c78 port map (
color_MUX_uxn_c_l300_c8_8441_cond,
color_MUX_uxn_c_l300_c8_8441_iftrue,
color_MUX_uxn_c_l300_c8_8441_iffalse,
color_MUX_uxn_c_l300_c8_8441_return_output);

-- CONST_SL_4_uxn_c_l302_c4_6d1a
CONST_SL_4_uxn_c_l302_c4_6d1a : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_c_l302_c4_6d1a_x,
CONST_SL_4_uxn_c_l302_c4_6d1a_return_output);

-- BIN_OP_AND_uxn_c_l303_c4_1663
BIN_OP_AND_uxn_c_l303_c4_1663 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l303_c4_1663_left,
BIN_OP_AND_uxn_c_l303_c4_1663_right,
BIN_OP_AND_uxn_c_l303_c4_1663_return_output);

-- BIN_OP_OR_uxn_c_l304_c4_391f
BIN_OP_OR_uxn_c_l304_c4_391f : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l304_c4_391f_left,
BIN_OP_OR_uxn_c_l304_c4_391f_right,
BIN_OP_OR_uxn_c_l304_c4_391f_return_output);

-- CONST_SL_4_uxn_c_l307_c4_c75e
CONST_SL_4_uxn_c_l307_c4_c75e : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_c_l307_c4_c75e_x,
CONST_SL_4_uxn_c_l307_c4_c75e_return_output);

-- BIN_OP_AND_uxn_c_l308_c4_f6a7
BIN_OP_AND_uxn_c_l308_c4_f6a7 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l308_c4_f6a7_left,
BIN_OP_AND_uxn_c_l308_c4_f6a7_right,
BIN_OP_AND_uxn_c_l308_c4_f6a7_return_output);

-- BIN_OP_OR_uxn_c_l309_c4_9d71
BIN_OP_OR_uxn_c_l309_c4_9d71 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l309_c4_9d71_left,
BIN_OP_OR_uxn_c_l309_c4_9d71_right,
BIN_OP_OR_uxn_c_l309_c4_9d71_return_output);

-- BIN_OP_EQ_uxn_c_l311_c12_0cf5
BIN_OP_EQ_uxn_c_l311_c12_0cf5 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l311_c12_0cf5_left,
BIN_OP_EQ_uxn_c_l311_c12_0cf5_right,
BIN_OP_EQ_uxn_c_l311_c12_0cf5_return_output);

-- color_MUX_uxn_c_l311_c8_f32e
color_MUX_uxn_c_l311_c8_f32e : entity work.MUX_uint1_t_uint12_t_4_uint12_t_4_0CLK_de264c78 port map (
color_MUX_uxn_c_l311_c8_f32e_cond,
color_MUX_uxn_c_l311_c8_f32e_iftrue,
color_MUX_uxn_c_l311_c8_f32e_iffalse,
color_MUX_uxn_c_l311_c8_f32e_return_output);

-- CONST_SL_4_uxn_c_l313_c4_de87
CONST_SL_4_uxn_c_l313_c4_de87 : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_c_l313_c4_de87_x,
CONST_SL_4_uxn_c_l313_c4_de87_return_output);

-- BIN_OP_AND_uxn_c_l314_c4_5115
BIN_OP_AND_uxn_c_l314_c4_5115 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l314_c4_5115_left,
BIN_OP_AND_uxn_c_l314_c4_5115_right,
BIN_OP_AND_uxn_c_l314_c4_5115_return_output);

-- BIN_OP_OR_uxn_c_l315_c4_5b71
BIN_OP_OR_uxn_c_l315_c4_5b71 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l315_c4_5b71_left,
BIN_OP_OR_uxn_c_l315_c4_5b71_right,
BIN_OP_OR_uxn_c_l315_c4_5b71_return_output);

-- CONST_SL_4_uxn_c_l318_c4_3ae8
CONST_SL_4_uxn_c_l318_c4_3ae8 : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_c_l318_c4_3ae8_x,
CONST_SL_4_uxn_c_l318_c4_3ae8_return_output);

-- BIN_OP_AND_uxn_c_l319_c4_9582
BIN_OP_AND_uxn_c_l319_c4_9582 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l319_c4_9582_left,
BIN_OP_AND_uxn_c_l319_c4_9582_right,
BIN_OP_AND_uxn_c_l319_c4_9582_return_output);

-- BIN_OP_OR_uxn_c_l320_c4_9783
BIN_OP_OR_uxn_c_l320_c4_9783 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l320_c4_9783_left,
BIN_OP_OR_uxn_c_l320_c4_9783_right,
BIN_OP_OR_uxn_c_l320_c4_9783_return_output);

-- BIN_OP_EQ_uxn_c_l322_c12_702d
BIN_OP_EQ_uxn_c_l322_c12_702d : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l322_c12_702d_left,
BIN_OP_EQ_uxn_c_l322_c12_702d_right,
BIN_OP_EQ_uxn_c_l322_c12_702d_return_output);

-- color_MUX_uxn_c_l322_c8_64dc
color_MUX_uxn_c_l322_c8_64dc : entity work.MUX_uint1_t_uint12_t_4_uint12_t_4_0CLK_de264c78 port map (
color_MUX_uxn_c_l322_c8_64dc_cond,
color_MUX_uxn_c_l322_c8_64dc_iftrue,
color_MUX_uxn_c_l322_c8_64dc_iffalse,
color_MUX_uxn_c_l322_c8_64dc_return_output);

-- BIN_OP_AND_uxn_c_l324_c4_2d60
BIN_OP_AND_uxn_c_l324_c4_2d60 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l324_c4_2d60_left,
BIN_OP_AND_uxn_c_l324_c4_2d60_right,
BIN_OP_AND_uxn_c_l324_c4_2d60_return_output);

-- BIN_OP_OR_uxn_c_l325_c4_2777
BIN_OP_OR_uxn_c_l325_c4_2777 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l325_c4_2777_left,
BIN_OP_OR_uxn_c_l325_c4_2777_right,
BIN_OP_OR_uxn_c_l325_c4_2777_return_output);

-- BIN_OP_AND_uxn_c_l328_c4_222e
BIN_OP_AND_uxn_c_l328_c4_222e : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l328_c4_222e_left,
BIN_OP_AND_uxn_c_l328_c4_222e_right,
BIN_OP_AND_uxn_c_l328_c4_222e_return_output);

-- BIN_OP_OR_uxn_c_l329_c4_4621
BIN_OP_OR_uxn_c_l329_c4_4621 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l329_c4_4621_left,
BIN_OP_OR_uxn_c_l329_c4_4621_right,
BIN_OP_OR_uxn_c_l329_c4_4621_return_output);

-- BIN_OP_EQ_uxn_c_l331_c12_3cf9
BIN_OP_EQ_uxn_c_l331_c12_3cf9 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l331_c12_3cf9_left,
BIN_OP_EQ_uxn_c_l331_c12_3cf9_right,
BIN_OP_EQ_uxn_c_l331_c12_3cf9_return_output);

-- color_3_MUX_uxn_c_l331_c8_4c37
color_3_MUX_uxn_c_l331_c8_4c37 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color_3_MUX_uxn_c_l331_c8_4c37_cond,
color_3_MUX_uxn_c_l331_c8_4c37_iftrue,
color_3_MUX_uxn_c_l331_c8_4c37_iffalse,
color_3_MUX_uxn_c_l331_c8_4c37_return_output);

-- color_2_MUX_uxn_c_l331_c8_4c37
color_2_MUX_uxn_c_l331_c8_4c37 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color_2_MUX_uxn_c_l331_c8_4c37_cond,
color_2_MUX_uxn_c_l331_c8_4c37_iftrue,
color_2_MUX_uxn_c_l331_c8_4c37_iffalse,
color_2_MUX_uxn_c_l331_c8_4c37_return_output);

-- BIN_OP_AND_uxn_c_l333_c4_66b2
BIN_OP_AND_uxn_c_l333_c4_66b2 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l333_c4_66b2_left,
BIN_OP_AND_uxn_c_l333_c4_66b2_right,
BIN_OP_AND_uxn_c_l333_c4_66b2_return_output);

-- BIN_OP_OR_uxn_c_l334_c4_8ce5
BIN_OP_OR_uxn_c_l334_c4_8ce5 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l334_c4_8ce5_left,
BIN_OP_OR_uxn_c_l334_c4_8ce5_right,
BIN_OP_OR_uxn_c_l334_c4_8ce5_return_output);

-- BIN_OP_AND_uxn_c_l337_c4_40d1
BIN_OP_AND_uxn_c_l337_c4_40d1 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l337_c4_40d1_left,
BIN_OP_AND_uxn_c_l337_c4_40d1_right,
BIN_OP_AND_uxn_c_l337_c4_40d1_return_output);

-- BIN_OP_OR_uxn_c_l338_c4_bc59
BIN_OP_OR_uxn_c_l338_c4_bc59 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l338_c4_bc59_left,
BIN_OP_OR_uxn_c_l338_c4_bc59_right,
BIN_OP_OR_uxn_c_l338_c4_bc59_return_output);

-- VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l342_c20_9e9f
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l342_c20_9e9f : entity work.VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_0CLK_9e40ec46 port map (
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l342_c20_9e9f_ref_toks_0,
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l342_c20_9e9f_var_dim_0,
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l342_c20_9e9f_return_output);



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
 CONST_SR_4_uxn_c_l270_c30_c763_return_output,
 BIN_OP_EQ_uxn_c_l270_c30_569a_return_output,
 MUX_uxn_c_l270_c30_3802_return_output,
 BIN_OP_AND_uxn_c_l272_c6_32bc_return_output,
 color_MUX_uxn_c_l272_c2_dda9_return_output,
 CONST_SR_4_uxn_c_l275_c35_c42f_return_output,
 BIN_OP_EQ_uxn_c_l278_c7_293e_return_output,
 color_MUX_uxn_c_l278_c3_fc29_return_output,
 CONST_SL_8_uxn_c_l280_c4_9e64_return_output,
 BIN_OP_AND_uxn_c_l281_c4_1d28_return_output,
 BIN_OP_OR_uxn_c_l282_c4_a98f_return_output,
 CONST_SL_8_uxn_c_l285_c4_1228_return_output,
 BIN_OP_AND_uxn_c_l286_c4_a892_return_output,
 BIN_OP_OR_uxn_c_l287_c4_6a78_return_output,
 BIN_OP_EQ_uxn_c_l289_c12_0f20_return_output,
 color_MUX_uxn_c_l289_c8_6ebc_return_output,
 CONST_SL_8_uxn_c_l291_c4_8b56_return_output,
 BIN_OP_AND_uxn_c_l292_c4_9de8_return_output,
 BIN_OP_OR_uxn_c_l293_c4_8318_return_output,
 CONST_SL_8_uxn_c_l296_c4_5ca0_return_output,
 BIN_OP_AND_uxn_c_l297_c4_27ea_return_output,
 BIN_OP_OR_uxn_c_l298_c4_6630_return_output,
 BIN_OP_EQ_uxn_c_l300_c12_5e30_return_output,
 color_MUX_uxn_c_l300_c8_8441_return_output,
 CONST_SL_4_uxn_c_l302_c4_6d1a_return_output,
 BIN_OP_AND_uxn_c_l303_c4_1663_return_output,
 BIN_OP_OR_uxn_c_l304_c4_391f_return_output,
 CONST_SL_4_uxn_c_l307_c4_c75e_return_output,
 BIN_OP_AND_uxn_c_l308_c4_f6a7_return_output,
 BIN_OP_OR_uxn_c_l309_c4_9d71_return_output,
 BIN_OP_EQ_uxn_c_l311_c12_0cf5_return_output,
 color_MUX_uxn_c_l311_c8_f32e_return_output,
 CONST_SL_4_uxn_c_l313_c4_de87_return_output,
 BIN_OP_AND_uxn_c_l314_c4_5115_return_output,
 BIN_OP_OR_uxn_c_l315_c4_5b71_return_output,
 CONST_SL_4_uxn_c_l318_c4_3ae8_return_output,
 BIN_OP_AND_uxn_c_l319_c4_9582_return_output,
 BIN_OP_OR_uxn_c_l320_c4_9783_return_output,
 BIN_OP_EQ_uxn_c_l322_c12_702d_return_output,
 color_MUX_uxn_c_l322_c8_64dc_return_output,
 BIN_OP_AND_uxn_c_l324_c4_2d60_return_output,
 BIN_OP_OR_uxn_c_l325_c4_2777_return_output,
 BIN_OP_AND_uxn_c_l328_c4_222e_return_output,
 BIN_OP_OR_uxn_c_l329_c4_4621_return_output,
 BIN_OP_EQ_uxn_c_l331_c12_3cf9_return_output,
 color_3_MUX_uxn_c_l331_c8_4c37_return_output,
 color_2_MUX_uxn_c_l331_c8_4c37_return_output,
 BIN_OP_AND_uxn_c_l333_c4_66b2_return_output,
 BIN_OP_OR_uxn_c_l334_c4_8ce5_return_output,
 BIN_OP_AND_uxn_c_l337_c4_40d1_return_output,
 BIN_OP_OR_uxn_c_l338_c4_bc59_return_output,
 VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l342_c20_9e9f_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_device_ram_address : unsigned(7 downto 0);
 variable VAR_device_ram_value : unsigned(7 downto 0);
 variable VAR_is_device_ram_write : unsigned(0 downto 0);
 variable VAR_gpu_step_color : unsigned(1 downto 0);
 variable VAR_is_palette_range : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l270_c30_3802_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_4_uxn_c_l270_c30_c763_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l270_c30_569a_left : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_c_l270_c30_c763_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l270_c30_569a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l270_c30_569a_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l270_c30_3802_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l270_c30_3802_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l270_c30_3802_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l272_c6_32bc_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l272_c6_32bc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l272_c6_32bc_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_c_l272_c2_dda9_iftrue : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l278_c3_fc29_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l272_c2_dda9_iffalse : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l272_c2_dda9_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l272_c2_dda9_cond : unsigned(0 downto 0);
 variable VAR_tmp12 : unsigned(11 downto 0);
 variable VAR_addr_low : unsigned(3 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_c_l274_c22_bc24_return_output : unsigned(3 downto 0);
 variable VAR_color_cmp_0 : unsigned(3 downto 0);
 variable VAR_color_cmp_0_uxn_c_l275_c11_551b_0 : unsigned(3 downto 0);
 variable VAR_CONST_SR_4_uxn_c_l275_c35_c42f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_c_l275_c35_c42f_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_c_l275_c25_3af7_return_output : unsigned(3 downto 0);
 variable VAR_color_cmp_1 : unsigned(3 downto 0);
 variable VAR_color_cmp_1_uxn_c_l276_c11_67c2_0 : unsigned(3 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_c_l276_c25_0c54_return_output : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l278_c7_293e_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l278_c7_293e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l278_c7_293e_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_c_l278_c3_fc29_iftrue : uint12_t_4;
 variable VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l278_c3_fc29_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l278_c3_fc29_iffalse : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l289_c8_6ebc_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l278_c3_fc29_cond : unsigned(0 downto 0);
 variable VAR_tmp12_uxn_c_l279_c4_0cdd : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l280_c4_9e64_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l280_c4_9e64_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l281_c4_1d28_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l281_c4_1d28_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l281_c4_1d28_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l282_c4_a98f_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l282_c4_a98f_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l282_c4_a98f_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_uxn_c_l284_c4_1f7a : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l285_c4_1228_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l285_c4_1228_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l286_c4_a892_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l286_c4_a892_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l286_c4_a892_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l287_c4_6a78_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l287_c4_6a78_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l287_c4_6a78_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l289_c12_0f20_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l289_c12_0f20_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l289_c12_0f20_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_c_l289_c8_6ebc_iftrue : uint12_t_4;
 variable VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l289_c8_6ebc_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l289_c8_6ebc_iffalse : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l300_c8_8441_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l289_c8_6ebc_cond : unsigned(0 downto 0);
 variable VAR_tmp12_uxn_c_l290_c4_0dfa : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l291_c4_8b56_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l291_c4_8b56_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l292_c4_9de8_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l292_c4_9de8_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l292_c4_9de8_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l293_c4_8318_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l293_c4_8318_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l293_c4_8318_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_uxn_c_l295_c4_cd47 : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l296_c4_5ca0_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l296_c4_5ca0_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l297_c4_27ea_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l297_c4_27ea_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l297_c4_27ea_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l298_c4_6630_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l298_c4_6630_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l298_c4_6630_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l300_c12_5e30_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l300_c12_5e30_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l300_c12_5e30_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_c_l300_c8_8441_iftrue : uint12_t_4;
 variable VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l300_c8_8441_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l300_c8_8441_iffalse : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l311_c8_f32e_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l300_c8_8441_cond : unsigned(0 downto 0);
 variable VAR_tmp12_uxn_c_l301_c4_4273 : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l302_c4_6d1a_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l302_c4_6d1a_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l303_c4_1663_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l303_c4_1663_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l303_c4_1663_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l304_c4_391f_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l304_c4_391f_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l304_c4_391f_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_uxn_c_l306_c4_22b1 : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l307_c4_c75e_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l307_c4_c75e_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l308_c4_f6a7_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l308_c4_f6a7_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l308_c4_f6a7_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l309_c4_9d71_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l309_c4_9d71_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l309_c4_9d71_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l311_c12_0cf5_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l311_c12_0cf5_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l311_c12_0cf5_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_c_l311_c8_f32e_iftrue : uint12_t_4;
 variable VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l311_c8_f32e_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l311_c8_f32e_iffalse : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l322_c8_64dc_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l311_c8_f32e_cond : unsigned(0 downto 0);
 variable VAR_tmp12_uxn_c_l312_c4_dcfd : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l313_c4_de87_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l313_c4_de87_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l314_c4_5115_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l314_c4_5115_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l314_c4_5115_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l315_c4_5b71_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l315_c4_5b71_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l315_c4_5b71_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_uxn_c_l317_c4_90da : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l318_c4_3ae8_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l318_c4_3ae8_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l319_c4_9582_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l319_c4_9582_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l319_c4_9582_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l320_c4_9783_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l320_c4_9783_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l320_c4_9783_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l322_c12_702d_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l322_c12_702d_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l322_c12_702d_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_c_l322_c8_64dc_iftrue : uint12_t_4;
 variable VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l322_c8_64dc_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l322_c8_64dc_iffalse : uint12_t_4;
 variable VAR_color_FALSE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_3db8_uxn_c_l322_c8_64dc_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l322_c8_64dc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l324_c4_2d60_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l324_c4_2d60_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l324_c4_2d60_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l325_c4_2777_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l325_c4_2777_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l325_c4_2777_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l328_c4_222e_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l328_c4_222e_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l328_c4_222e_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l329_c4_4621_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l329_c4_4621_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l329_c4_4621_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l331_c12_3cf9_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l331_c12_3cf9_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l331_c12_3cf9_return_output : unsigned(0 downto 0);
 variable VAR_color_3_MUX_uxn_c_l331_c8_4c37_iftrue : unsigned(11 downto 0);
 variable VAR_color_3_MUX_uxn_c_l331_c8_4c37_iffalse : unsigned(11 downto 0);
 variable VAR_color_3_MUX_uxn_c_l331_c8_4c37_return_output : unsigned(11 downto 0);
 variable VAR_color_3_MUX_uxn_c_l331_c8_4c37_cond : unsigned(0 downto 0);
 variable VAR_color_2_MUX_uxn_c_l331_c8_4c37_iftrue : unsigned(11 downto 0);
 variable VAR_color_2_MUX_uxn_c_l331_c8_4c37_iffalse : unsigned(11 downto 0);
 variable VAR_color_2_MUX_uxn_c_l331_c8_4c37_return_output : unsigned(11 downto 0);
 variable VAR_color_2_MUX_uxn_c_l331_c8_4c37_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l333_c4_66b2_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l333_c4_66b2_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l333_c4_66b2_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l334_c4_8ce5_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l334_c4_8ce5_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l334_c4_8ce5_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l337_c4_40d1_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l337_c4_40d1_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l337_c4_40d1_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l338_c4_bc59_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l338_c4_bc59_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l338_c4_bc59_return_output : unsigned(11 downto 0);
 variable VAR_result : unsigned(15 downto 0);
 variable VAR_result_uxn_c_l342_c11_9292_0 : unsigned(15 downto 0);
 variable VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l342_c20_9e9f_var_dim_0 : unsigned(1 downto 0);
 variable VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l342_c20_9e9f_return_output : unsigned(11 downto 0);
 variable VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l342_c20_9e9f_ref_toks_0 : uint12_t_4;
 variable VAR_CONST_REF_RD_uint12_t_uint12_t_4_0_d41d_uxn_c_l303_l324_l281_DUPLICATE_f999_return_output : unsigned(11 downto 0);
 variable VAR_CONST_REF_RD_uint12_t_uint12_t_4_1_d41d_uxn_c_l308_l328_l286_DUPLICATE_f312_return_output : unsigned(11 downto 0);
 variable VAR_CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_uxn_c_l292_l333_l314_l331_DUPLICATE_2bd4_return_output : unsigned(11 downto 0);
 variable VAR_CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_uxn_c_l297_l337_l319_l331_DUPLICATE_b752_return_output : unsigned(11 downto 0);
 variable VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l323_l332_DUPLICATE_b990_return_output : unsigned(11 downto 0);
 variable VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l327_l336_DUPLICATE_e9fe_return_output : unsigned(11 downto 0);
 -- State registers comb logic variables
variable REG_VAR_color : uint12_t_4;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_color := color;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_MUX_uxn_c_l270_c30_3802_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l300_c12_5e30_right := to_unsigned(10, 4);
     VAR_BIN_OP_AND_uxn_c_l303_c4_1663_right := to_unsigned(3855, 12);
     VAR_BIN_OP_AND_uxn_c_l328_c4_222e_right := to_unsigned(4080, 12);
     VAR_MUX_uxn_c_l270_c30_3802_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l322_c12_702d_right := to_unsigned(12, 4);
     VAR_BIN_OP_EQ_uxn_c_l311_c12_0cf5_right := to_unsigned(11, 4);
     VAR_BIN_OP_AND_uxn_c_l324_c4_2d60_right := to_unsigned(4080, 12);
     VAR_BIN_OP_EQ_uxn_c_l278_c7_293e_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_c_l270_c30_569a_right := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_c_l333_c4_66b2_right := to_unsigned(4080, 12);
     VAR_BIN_OP_AND_uxn_c_l314_c4_5115_right := to_unsigned(3855, 12);
     VAR_BIN_OP_AND_uxn_c_l308_c4_f6a7_right := to_unsigned(3855, 12);
     VAR_BIN_OP_AND_uxn_c_l281_c4_1d28_right := to_unsigned(255, 12);
     VAR_BIN_OP_AND_uxn_c_l286_c4_a892_right := to_unsigned(255, 12);
     VAR_BIN_OP_AND_uxn_c_l319_c4_9582_right := to_unsigned(3855, 12);
     VAR_BIN_OP_EQ_uxn_c_l331_c12_3cf9_right := to_unsigned(13, 4);
     VAR_BIN_OP_AND_uxn_c_l292_c4_9de8_right := to_unsigned(255, 12);
     VAR_BIN_OP_EQ_uxn_c_l289_c12_0f20_right := to_unsigned(9, 4);
     VAR_BIN_OP_AND_uxn_c_l297_c4_27ea_right := to_unsigned(255, 12);
     VAR_BIN_OP_AND_uxn_c_l337_c4_40d1_right := to_unsigned(4080, 12);

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
     VAR_color_MUX_uxn_c_l272_c2_dda9_iffalse := color;
     VAR_CONST_SR_4_uxn_c_l270_c30_c763_x := VAR_device_ram_address;
     VAR_CONST_SR_4_uxn_c_l275_c35_c42f_x := VAR_device_ram_value;
     VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l342_c20_9e9f_var_dim_0 := VAR_gpu_step_color;
     VAR_BIN_OP_AND_uxn_c_l272_c6_32bc_left := VAR_is_device_ram_write;
     -- CAST_TO_uint4_t[uxn_c_l274_c22_bc24] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_c_l274_c22_bc24_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_device_ram_address);

     -- CONST_REF_RD_uint12_t_uint12_t_4_1_d41d_uxn_c_l308_l328_l286_DUPLICATE_f312 LATENCY=0
     VAR_CONST_REF_RD_uint12_t_uint12_t_4_1_d41d_uxn_c_l308_l328_l286_DUPLICATE_f312_return_output := color(1);

     -- CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_uxn_c_l292_l333_l314_l331_DUPLICATE_2bd4 LATENCY=0
     VAR_CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_uxn_c_l292_l333_l314_l331_DUPLICATE_2bd4_return_output := color(2);

     -- CAST_TO_uint4_t[uxn_c_l276_c25_0c54] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_c_l276_c25_0c54_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_device_ram_value);

     -- CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_uxn_c_l297_l337_l319_l331_DUPLICATE_b752 LATENCY=0
     VAR_CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_uxn_c_l297_l337_l319_l331_DUPLICATE_b752_return_output := color(3);

     -- CONST_REF_RD_uint12_t_uint12_t_4_0_d41d_uxn_c_l303_l324_l281_DUPLICATE_f999 LATENCY=0
     VAR_CONST_REF_RD_uint12_t_uint12_t_4_0_d41d_uxn_c_l303_l324_l281_DUPLICATE_f999_return_output := color(0);

     -- CONST_SR_4[uxn_c_l270_c30_c763] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_c_l270_c30_c763_x <= VAR_CONST_SR_4_uxn_c_l270_c30_c763_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_c_l270_c30_c763_return_output := CONST_SR_4_uxn_c_l270_c30_c763_return_output;

     -- CONST_SR_4[uxn_c_l275_c35_c42f] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_c_l275_c35_c42f_x <= VAR_CONST_SR_4_uxn_c_l275_c35_c42f_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_c_l275_c35_c42f_return_output := CONST_SR_4_uxn_c_l275_c35_c42f_return_output;

     -- Submodule level 1
     VAR_BIN_OP_EQ_uxn_c_l278_c7_293e_left := VAR_CAST_TO_uint4_t_uxn_c_l274_c22_bc24_return_output;
     VAR_BIN_OP_EQ_uxn_c_l289_c12_0f20_left := VAR_CAST_TO_uint4_t_uxn_c_l274_c22_bc24_return_output;
     VAR_BIN_OP_EQ_uxn_c_l300_c12_5e30_left := VAR_CAST_TO_uint4_t_uxn_c_l274_c22_bc24_return_output;
     VAR_BIN_OP_EQ_uxn_c_l311_c12_0cf5_left := VAR_CAST_TO_uint4_t_uxn_c_l274_c22_bc24_return_output;
     VAR_BIN_OP_EQ_uxn_c_l322_c12_702d_left := VAR_CAST_TO_uint4_t_uxn_c_l274_c22_bc24_return_output;
     VAR_BIN_OP_EQ_uxn_c_l331_c12_3cf9_left := VAR_CAST_TO_uint4_t_uxn_c_l274_c22_bc24_return_output;
     VAR_color_cmp_1_uxn_c_l276_c11_67c2_0 := VAR_CAST_TO_uint4_t_uxn_c_l276_c25_0c54_return_output;
     VAR_BIN_OP_AND_uxn_c_l281_c4_1d28_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_0_d41d_uxn_c_l303_l324_l281_DUPLICATE_f999_return_output;
     VAR_BIN_OP_AND_uxn_c_l303_c4_1663_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_0_d41d_uxn_c_l303_l324_l281_DUPLICATE_f999_return_output;
     VAR_BIN_OP_AND_uxn_c_l324_c4_2d60_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_0_d41d_uxn_c_l303_l324_l281_DUPLICATE_f999_return_output;
     VAR_BIN_OP_AND_uxn_c_l286_c4_a892_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_1_d41d_uxn_c_l308_l328_l286_DUPLICATE_f312_return_output;
     VAR_BIN_OP_AND_uxn_c_l308_c4_f6a7_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_1_d41d_uxn_c_l308_l328_l286_DUPLICATE_f312_return_output;
     VAR_BIN_OP_AND_uxn_c_l328_c4_222e_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_1_d41d_uxn_c_l308_l328_l286_DUPLICATE_f312_return_output;
     VAR_BIN_OP_AND_uxn_c_l292_c4_9de8_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_uxn_c_l292_l333_l314_l331_DUPLICATE_2bd4_return_output;
     VAR_BIN_OP_AND_uxn_c_l314_c4_5115_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_uxn_c_l292_l333_l314_l331_DUPLICATE_2bd4_return_output;
     VAR_BIN_OP_AND_uxn_c_l333_c4_66b2_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_uxn_c_l292_l333_l314_l331_DUPLICATE_2bd4_return_output;
     VAR_color_2_MUX_uxn_c_l331_c8_4c37_iffalse := VAR_CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_uxn_c_l292_l333_l314_l331_DUPLICATE_2bd4_return_output;
     VAR_BIN_OP_AND_uxn_c_l297_c4_27ea_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_uxn_c_l297_l337_l319_l331_DUPLICATE_b752_return_output;
     VAR_BIN_OP_AND_uxn_c_l319_c4_9582_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_uxn_c_l297_l337_l319_l331_DUPLICATE_b752_return_output;
     VAR_BIN_OP_AND_uxn_c_l337_c4_40d1_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_uxn_c_l297_l337_l319_l331_DUPLICATE_b752_return_output;
     VAR_color_3_MUX_uxn_c_l331_c8_4c37_iffalse := VAR_CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_uxn_c_l297_l337_l319_l331_DUPLICATE_b752_return_output;
     VAR_BIN_OP_EQ_uxn_c_l270_c30_569a_left := VAR_CONST_SR_4_uxn_c_l270_c30_c763_return_output;
     VAR_tmp12_uxn_c_l284_c4_1f7a := resize(VAR_color_cmp_1_uxn_c_l276_c11_67c2_0, 12);
     VAR_tmp12_uxn_c_l295_c4_cd47 := resize(VAR_color_cmp_1_uxn_c_l276_c11_67c2_0, 12);
     VAR_tmp12_uxn_c_l306_c4_22b1 := resize(VAR_color_cmp_1_uxn_c_l276_c11_67c2_0, 12);
     VAR_tmp12_uxn_c_l317_c4_90da := resize(VAR_color_cmp_1_uxn_c_l276_c11_67c2_0, 12);
     VAR_CONST_SL_8_uxn_c_l285_c4_1228_x := VAR_tmp12_uxn_c_l284_c4_1f7a;
     VAR_CONST_SL_8_uxn_c_l296_c4_5ca0_x := VAR_tmp12_uxn_c_l295_c4_cd47;
     VAR_CONST_SL_4_uxn_c_l307_c4_c75e_x := VAR_tmp12_uxn_c_l306_c4_22b1;
     VAR_CONST_SL_4_uxn_c_l318_c4_3ae8_x := VAR_tmp12_uxn_c_l317_c4_90da;
     -- CAST_TO_uint12_t_uint4_t_uxn_c_l327_l336_DUPLICATE_e9fe LATENCY=0
     VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l327_l336_DUPLICATE_e9fe_return_output := CAST_TO_uint12_t_uint4_t(
     VAR_color_cmp_1_uxn_c_l276_c11_67c2_0);

     -- BIN_OP_EQ[uxn_c_l311_c12_0cf5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l311_c12_0cf5_left <= VAR_BIN_OP_EQ_uxn_c_l311_c12_0cf5_left;
     BIN_OP_EQ_uxn_c_l311_c12_0cf5_right <= VAR_BIN_OP_EQ_uxn_c_l311_c12_0cf5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l311_c12_0cf5_return_output := BIN_OP_EQ_uxn_c_l311_c12_0cf5_return_output;

     -- BIN_OP_AND[uxn_c_l281_c4_1d28] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l281_c4_1d28_left <= VAR_BIN_OP_AND_uxn_c_l281_c4_1d28_left;
     BIN_OP_AND_uxn_c_l281_c4_1d28_right <= VAR_BIN_OP_AND_uxn_c_l281_c4_1d28_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l281_c4_1d28_return_output := BIN_OP_AND_uxn_c_l281_c4_1d28_return_output;

     -- BIN_OP_AND[uxn_c_l286_c4_a892] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l286_c4_a892_left <= VAR_BIN_OP_AND_uxn_c_l286_c4_a892_left;
     BIN_OP_AND_uxn_c_l286_c4_a892_right <= VAR_BIN_OP_AND_uxn_c_l286_c4_a892_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l286_c4_a892_return_output := BIN_OP_AND_uxn_c_l286_c4_a892_return_output;

     -- BIN_OP_EQ[uxn_c_l331_c12_3cf9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l331_c12_3cf9_left <= VAR_BIN_OP_EQ_uxn_c_l331_c12_3cf9_left;
     BIN_OP_EQ_uxn_c_l331_c12_3cf9_right <= VAR_BIN_OP_EQ_uxn_c_l331_c12_3cf9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l331_c12_3cf9_return_output := BIN_OP_EQ_uxn_c_l331_c12_3cf9_return_output;

     -- BIN_OP_AND[uxn_c_l308_c4_f6a7] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l308_c4_f6a7_left <= VAR_BIN_OP_AND_uxn_c_l308_c4_f6a7_left;
     BIN_OP_AND_uxn_c_l308_c4_f6a7_right <= VAR_BIN_OP_AND_uxn_c_l308_c4_f6a7_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l308_c4_f6a7_return_output := BIN_OP_AND_uxn_c_l308_c4_f6a7_return_output;

     -- BIN_OP_EQ[uxn_c_l322_c12_702d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l322_c12_702d_left <= VAR_BIN_OP_EQ_uxn_c_l322_c12_702d_left;
     BIN_OP_EQ_uxn_c_l322_c12_702d_right <= VAR_BIN_OP_EQ_uxn_c_l322_c12_702d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l322_c12_702d_return_output := BIN_OP_EQ_uxn_c_l322_c12_702d_return_output;

     -- BIN_OP_AND[uxn_c_l314_c4_5115] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l314_c4_5115_left <= VAR_BIN_OP_AND_uxn_c_l314_c4_5115_left;
     BIN_OP_AND_uxn_c_l314_c4_5115_right <= VAR_BIN_OP_AND_uxn_c_l314_c4_5115_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l314_c4_5115_return_output := BIN_OP_AND_uxn_c_l314_c4_5115_return_output;

     -- BIN_OP_EQ[uxn_c_l278_c7_293e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l278_c7_293e_left <= VAR_BIN_OP_EQ_uxn_c_l278_c7_293e_left;
     BIN_OP_EQ_uxn_c_l278_c7_293e_right <= VAR_BIN_OP_EQ_uxn_c_l278_c7_293e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l278_c7_293e_return_output := BIN_OP_EQ_uxn_c_l278_c7_293e_return_output;

     -- BIN_OP_EQ[uxn_c_l289_c12_0f20] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l289_c12_0f20_left <= VAR_BIN_OP_EQ_uxn_c_l289_c12_0f20_left;
     BIN_OP_EQ_uxn_c_l289_c12_0f20_right <= VAR_BIN_OP_EQ_uxn_c_l289_c12_0f20_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l289_c12_0f20_return_output := BIN_OP_EQ_uxn_c_l289_c12_0f20_return_output;

     -- BIN_OP_AND[uxn_c_l333_c4_66b2] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l333_c4_66b2_left <= VAR_BIN_OP_AND_uxn_c_l333_c4_66b2_left;
     BIN_OP_AND_uxn_c_l333_c4_66b2_right <= VAR_BIN_OP_AND_uxn_c_l333_c4_66b2_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l333_c4_66b2_return_output := BIN_OP_AND_uxn_c_l333_c4_66b2_return_output;

     -- BIN_OP_EQ[uxn_c_l270_c30_569a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l270_c30_569a_left <= VAR_BIN_OP_EQ_uxn_c_l270_c30_569a_left;
     BIN_OP_EQ_uxn_c_l270_c30_569a_right <= VAR_BIN_OP_EQ_uxn_c_l270_c30_569a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l270_c30_569a_return_output := BIN_OP_EQ_uxn_c_l270_c30_569a_return_output;

     -- CONST_SL_4[uxn_c_l318_c4_3ae8] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_c_l318_c4_3ae8_x <= VAR_CONST_SL_4_uxn_c_l318_c4_3ae8_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_c_l318_c4_3ae8_return_output := CONST_SL_4_uxn_c_l318_c4_3ae8_return_output;

     -- CONST_SL_4[uxn_c_l307_c4_c75e] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_c_l307_c4_c75e_x <= VAR_CONST_SL_4_uxn_c_l307_c4_c75e_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_c_l307_c4_c75e_return_output := CONST_SL_4_uxn_c_l307_c4_c75e_return_output;

     -- BIN_OP_AND[uxn_c_l319_c4_9582] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l319_c4_9582_left <= VAR_BIN_OP_AND_uxn_c_l319_c4_9582_left;
     BIN_OP_AND_uxn_c_l319_c4_9582_right <= VAR_BIN_OP_AND_uxn_c_l319_c4_9582_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l319_c4_9582_return_output := BIN_OP_AND_uxn_c_l319_c4_9582_return_output;

     -- BIN_OP_AND[uxn_c_l303_c4_1663] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l303_c4_1663_left <= VAR_BIN_OP_AND_uxn_c_l303_c4_1663_left;
     BIN_OP_AND_uxn_c_l303_c4_1663_right <= VAR_BIN_OP_AND_uxn_c_l303_c4_1663_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l303_c4_1663_return_output := BIN_OP_AND_uxn_c_l303_c4_1663_return_output;

     -- CONST_SL_8[uxn_c_l285_c4_1228] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l285_c4_1228_x <= VAR_CONST_SL_8_uxn_c_l285_c4_1228_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l285_c4_1228_return_output := CONST_SL_8_uxn_c_l285_c4_1228_return_output;

     -- BIN_OP_AND[uxn_c_l297_c4_27ea] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l297_c4_27ea_left <= VAR_BIN_OP_AND_uxn_c_l297_c4_27ea_left;
     BIN_OP_AND_uxn_c_l297_c4_27ea_right <= VAR_BIN_OP_AND_uxn_c_l297_c4_27ea_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l297_c4_27ea_return_output := BIN_OP_AND_uxn_c_l297_c4_27ea_return_output;

     -- BIN_OP_AND[uxn_c_l324_c4_2d60] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l324_c4_2d60_left <= VAR_BIN_OP_AND_uxn_c_l324_c4_2d60_left;
     BIN_OP_AND_uxn_c_l324_c4_2d60_right <= VAR_BIN_OP_AND_uxn_c_l324_c4_2d60_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l324_c4_2d60_return_output := BIN_OP_AND_uxn_c_l324_c4_2d60_return_output;

     -- BIN_OP_AND[uxn_c_l337_c4_40d1] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l337_c4_40d1_left <= VAR_BIN_OP_AND_uxn_c_l337_c4_40d1_left;
     BIN_OP_AND_uxn_c_l337_c4_40d1_right <= VAR_BIN_OP_AND_uxn_c_l337_c4_40d1_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l337_c4_40d1_return_output := BIN_OP_AND_uxn_c_l337_c4_40d1_return_output;

     -- BIN_OP_AND[uxn_c_l328_c4_222e] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l328_c4_222e_left <= VAR_BIN_OP_AND_uxn_c_l328_c4_222e_left;
     BIN_OP_AND_uxn_c_l328_c4_222e_right <= VAR_BIN_OP_AND_uxn_c_l328_c4_222e_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l328_c4_222e_return_output := BIN_OP_AND_uxn_c_l328_c4_222e_return_output;

     -- CAST_TO_uint4_t[uxn_c_l275_c25_3af7] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_c_l275_c25_3af7_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_CONST_SR_4_uxn_c_l275_c35_c42f_return_output);

     -- BIN_OP_AND[uxn_c_l292_c4_9de8] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l292_c4_9de8_left <= VAR_BIN_OP_AND_uxn_c_l292_c4_9de8_left;
     BIN_OP_AND_uxn_c_l292_c4_9de8_right <= VAR_BIN_OP_AND_uxn_c_l292_c4_9de8_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l292_c4_9de8_return_output := BIN_OP_AND_uxn_c_l292_c4_9de8_return_output;

     -- CONST_SL_8[uxn_c_l296_c4_5ca0] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l296_c4_5ca0_x <= VAR_CONST_SL_8_uxn_c_l296_c4_5ca0_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l296_c4_5ca0_return_output := CONST_SL_8_uxn_c_l296_c4_5ca0_return_output;

     -- BIN_OP_EQ[uxn_c_l300_c12_5e30] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l300_c12_5e30_left <= VAR_BIN_OP_EQ_uxn_c_l300_c12_5e30_left;
     BIN_OP_EQ_uxn_c_l300_c12_5e30_right <= VAR_BIN_OP_EQ_uxn_c_l300_c12_5e30_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l300_c12_5e30_return_output := BIN_OP_EQ_uxn_c_l300_c12_5e30_return_output;

     -- Submodule level 2
     VAR_BIN_OP_OR_uxn_c_l282_c4_a98f_left := VAR_BIN_OP_AND_uxn_c_l281_c4_1d28_return_output;
     VAR_BIN_OP_OR_uxn_c_l287_c4_6a78_left := VAR_BIN_OP_AND_uxn_c_l286_c4_a892_return_output;
     VAR_BIN_OP_OR_uxn_c_l293_c4_8318_left := VAR_BIN_OP_AND_uxn_c_l292_c4_9de8_return_output;
     VAR_BIN_OP_OR_uxn_c_l298_c4_6630_left := VAR_BIN_OP_AND_uxn_c_l297_c4_27ea_return_output;
     VAR_BIN_OP_OR_uxn_c_l304_c4_391f_left := VAR_BIN_OP_AND_uxn_c_l303_c4_1663_return_output;
     VAR_BIN_OP_OR_uxn_c_l309_c4_9d71_left := VAR_BIN_OP_AND_uxn_c_l308_c4_f6a7_return_output;
     VAR_BIN_OP_OR_uxn_c_l315_c4_5b71_left := VAR_BIN_OP_AND_uxn_c_l314_c4_5115_return_output;
     VAR_BIN_OP_OR_uxn_c_l320_c4_9783_left := VAR_BIN_OP_AND_uxn_c_l319_c4_9582_return_output;
     VAR_BIN_OP_OR_uxn_c_l325_c4_2777_left := VAR_BIN_OP_AND_uxn_c_l324_c4_2d60_return_output;
     VAR_BIN_OP_OR_uxn_c_l329_c4_4621_left := VAR_BIN_OP_AND_uxn_c_l328_c4_222e_return_output;
     VAR_BIN_OP_OR_uxn_c_l334_c4_8ce5_left := VAR_BIN_OP_AND_uxn_c_l333_c4_66b2_return_output;
     VAR_BIN_OP_OR_uxn_c_l338_c4_bc59_left := VAR_BIN_OP_AND_uxn_c_l337_c4_40d1_return_output;
     VAR_MUX_uxn_c_l270_c30_3802_cond := VAR_BIN_OP_EQ_uxn_c_l270_c30_569a_return_output;
     VAR_color_MUX_uxn_c_l278_c3_fc29_cond := VAR_BIN_OP_EQ_uxn_c_l278_c7_293e_return_output;
     VAR_color_MUX_uxn_c_l289_c8_6ebc_cond := VAR_BIN_OP_EQ_uxn_c_l289_c12_0f20_return_output;
     VAR_color_MUX_uxn_c_l300_c8_8441_cond := VAR_BIN_OP_EQ_uxn_c_l300_c12_5e30_return_output;
     VAR_color_MUX_uxn_c_l311_c8_f32e_cond := VAR_BIN_OP_EQ_uxn_c_l311_c12_0cf5_return_output;
     VAR_color_MUX_uxn_c_l322_c8_64dc_cond := VAR_BIN_OP_EQ_uxn_c_l322_c12_702d_return_output;
     VAR_color_2_MUX_uxn_c_l331_c8_4c37_cond := VAR_BIN_OP_EQ_uxn_c_l331_c12_3cf9_return_output;
     VAR_color_3_MUX_uxn_c_l331_c8_4c37_cond := VAR_BIN_OP_EQ_uxn_c_l331_c12_3cf9_return_output;
     VAR_BIN_OP_OR_uxn_c_l329_c4_4621_right := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l327_l336_DUPLICATE_e9fe_return_output;
     VAR_BIN_OP_OR_uxn_c_l338_c4_bc59_right := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l327_l336_DUPLICATE_e9fe_return_output;
     VAR_color_cmp_0_uxn_c_l275_c11_551b_0 := VAR_CAST_TO_uint4_t_uxn_c_l275_c25_3af7_return_output;
     VAR_BIN_OP_OR_uxn_c_l309_c4_9d71_right := VAR_CONST_SL_4_uxn_c_l307_c4_c75e_return_output;
     VAR_BIN_OP_OR_uxn_c_l320_c4_9783_right := VAR_CONST_SL_4_uxn_c_l318_c4_3ae8_return_output;
     VAR_BIN_OP_OR_uxn_c_l287_c4_6a78_right := VAR_CONST_SL_8_uxn_c_l285_c4_1228_return_output;
     VAR_BIN_OP_OR_uxn_c_l298_c4_6630_right := VAR_CONST_SL_8_uxn_c_l296_c4_5ca0_return_output;
     VAR_tmp12_uxn_c_l279_c4_0cdd := resize(VAR_color_cmp_0_uxn_c_l275_c11_551b_0, 12);
     VAR_tmp12_uxn_c_l290_c4_0dfa := resize(VAR_color_cmp_0_uxn_c_l275_c11_551b_0, 12);
     VAR_tmp12_uxn_c_l301_c4_4273 := resize(VAR_color_cmp_0_uxn_c_l275_c11_551b_0, 12);
     VAR_tmp12_uxn_c_l312_c4_dcfd := resize(VAR_color_cmp_0_uxn_c_l275_c11_551b_0, 12);
     VAR_CONST_SL_8_uxn_c_l280_c4_9e64_x := VAR_tmp12_uxn_c_l279_c4_0cdd;
     VAR_CONST_SL_8_uxn_c_l291_c4_8b56_x := VAR_tmp12_uxn_c_l290_c4_0dfa;
     VAR_CONST_SL_4_uxn_c_l302_c4_6d1a_x := VAR_tmp12_uxn_c_l301_c4_4273;
     VAR_CONST_SL_4_uxn_c_l313_c4_de87_x := VAR_tmp12_uxn_c_l312_c4_dcfd;
     -- CAST_TO_uint12_t_uint4_t_uxn_c_l323_l332_DUPLICATE_b990 LATENCY=0
     VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l323_l332_DUPLICATE_b990_return_output := CAST_TO_uint12_t_uint4_t(
     VAR_color_cmp_0_uxn_c_l275_c11_551b_0);

     -- BIN_OP_OR[uxn_c_l338_c4_bc59] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l338_c4_bc59_left <= VAR_BIN_OP_OR_uxn_c_l338_c4_bc59_left;
     BIN_OP_OR_uxn_c_l338_c4_bc59_right <= VAR_BIN_OP_OR_uxn_c_l338_c4_bc59_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l338_c4_bc59_return_output := BIN_OP_OR_uxn_c_l338_c4_bc59_return_output;

     -- CONST_SL_8[uxn_c_l291_c4_8b56] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l291_c4_8b56_x <= VAR_CONST_SL_8_uxn_c_l291_c4_8b56_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l291_c4_8b56_return_output := CONST_SL_8_uxn_c_l291_c4_8b56_return_output;

     -- MUX[uxn_c_l270_c30_3802] LATENCY=0
     -- Inputs
     MUX_uxn_c_l270_c30_3802_cond <= VAR_MUX_uxn_c_l270_c30_3802_cond;
     MUX_uxn_c_l270_c30_3802_iftrue <= VAR_MUX_uxn_c_l270_c30_3802_iftrue;
     MUX_uxn_c_l270_c30_3802_iffalse <= VAR_MUX_uxn_c_l270_c30_3802_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l270_c30_3802_return_output := MUX_uxn_c_l270_c30_3802_return_output;

     -- CONST_SL_8[uxn_c_l280_c4_9e64] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l280_c4_9e64_x <= VAR_CONST_SL_8_uxn_c_l280_c4_9e64_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l280_c4_9e64_return_output := CONST_SL_8_uxn_c_l280_c4_9e64_return_output;

     -- CONST_SL_4[uxn_c_l302_c4_6d1a] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_c_l302_c4_6d1a_x <= VAR_CONST_SL_4_uxn_c_l302_c4_6d1a_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_c_l302_c4_6d1a_return_output := CONST_SL_4_uxn_c_l302_c4_6d1a_return_output;

     -- BIN_OP_OR[uxn_c_l329_c4_4621] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l329_c4_4621_left <= VAR_BIN_OP_OR_uxn_c_l329_c4_4621_left;
     BIN_OP_OR_uxn_c_l329_c4_4621_right <= VAR_BIN_OP_OR_uxn_c_l329_c4_4621_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l329_c4_4621_return_output := BIN_OP_OR_uxn_c_l329_c4_4621_return_output;

     -- BIN_OP_OR[uxn_c_l309_c4_9d71] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l309_c4_9d71_left <= VAR_BIN_OP_OR_uxn_c_l309_c4_9d71_left;
     BIN_OP_OR_uxn_c_l309_c4_9d71_right <= VAR_BIN_OP_OR_uxn_c_l309_c4_9d71_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l309_c4_9d71_return_output := BIN_OP_OR_uxn_c_l309_c4_9d71_return_output;

     -- CONST_SL_4[uxn_c_l313_c4_de87] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_c_l313_c4_de87_x <= VAR_CONST_SL_4_uxn_c_l313_c4_de87_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_c_l313_c4_de87_return_output := CONST_SL_4_uxn_c_l313_c4_de87_return_output;

     -- BIN_OP_OR[uxn_c_l287_c4_6a78] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l287_c4_6a78_left <= VAR_BIN_OP_OR_uxn_c_l287_c4_6a78_left;
     BIN_OP_OR_uxn_c_l287_c4_6a78_right <= VAR_BIN_OP_OR_uxn_c_l287_c4_6a78_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l287_c4_6a78_return_output := BIN_OP_OR_uxn_c_l287_c4_6a78_return_output;

     -- BIN_OP_OR[uxn_c_l320_c4_9783] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l320_c4_9783_left <= VAR_BIN_OP_OR_uxn_c_l320_c4_9783_left;
     BIN_OP_OR_uxn_c_l320_c4_9783_right <= VAR_BIN_OP_OR_uxn_c_l320_c4_9783_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l320_c4_9783_return_output := BIN_OP_OR_uxn_c_l320_c4_9783_return_output;

     -- BIN_OP_OR[uxn_c_l298_c4_6630] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l298_c4_6630_left <= VAR_BIN_OP_OR_uxn_c_l298_c4_6630_left;
     BIN_OP_OR_uxn_c_l298_c4_6630_right <= VAR_BIN_OP_OR_uxn_c_l298_c4_6630_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l298_c4_6630_return_output := BIN_OP_OR_uxn_c_l298_c4_6630_return_output;

     -- Submodule level 3
     VAR_color_3_MUX_uxn_c_l331_c8_4c37_iftrue := VAR_BIN_OP_OR_uxn_c_l338_c4_bc59_return_output;
     VAR_BIN_OP_OR_uxn_c_l325_c4_2777_right := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l323_l332_DUPLICATE_b990_return_output;
     VAR_BIN_OP_OR_uxn_c_l334_c4_8ce5_right := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l323_l332_DUPLICATE_b990_return_output;
     VAR_BIN_OP_OR_uxn_c_l304_c4_391f_right := VAR_CONST_SL_4_uxn_c_l302_c4_6d1a_return_output;
     VAR_BIN_OP_OR_uxn_c_l315_c4_5b71_right := VAR_CONST_SL_4_uxn_c_l313_c4_de87_return_output;
     VAR_BIN_OP_OR_uxn_c_l282_c4_a98f_right := VAR_CONST_SL_8_uxn_c_l280_c4_9e64_return_output;
     VAR_BIN_OP_OR_uxn_c_l293_c4_8318_right := VAR_CONST_SL_8_uxn_c_l291_c4_8b56_return_output;
     VAR_BIN_OP_AND_uxn_c_l272_c6_32bc_right := VAR_MUX_uxn_c_l270_c30_3802_return_output;
     -- BIN_OP_OR[uxn_c_l304_c4_391f] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l304_c4_391f_left <= VAR_BIN_OP_OR_uxn_c_l304_c4_391f_left;
     BIN_OP_OR_uxn_c_l304_c4_391f_right <= VAR_BIN_OP_OR_uxn_c_l304_c4_391f_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l304_c4_391f_return_output := BIN_OP_OR_uxn_c_l304_c4_391f_return_output;

     -- BIN_OP_OR[uxn_c_l282_c4_a98f] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l282_c4_a98f_left <= VAR_BIN_OP_OR_uxn_c_l282_c4_a98f_left;
     BIN_OP_OR_uxn_c_l282_c4_a98f_right <= VAR_BIN_OP_OR_uxn_c_l282_c4_a98f_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l282_c4_a98f_return_output := BIN_OP_OR_uxn_c_l282_c4_a98f_return_output;

     -- BIN_OP_OR[uxn_c_l325_c4_2777] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l325_c4_2777_left <= VAR_BIN_OP_OR_uxn_c_l325_c4_2777_left;
     BIN_OP_OR_uxn_c_l325_c4_2777_right <= VAR_BIN_OP_OR_uxn_c_l325_c4_2777_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l325_c4_2777_return_output := BIN_OP_OR_uxn_c_l325_c4_2777_return_output;

     -- BIN_OP_OR[uxn_c_l293_c4_8318] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l293_c4_8318_left <= VAR_BIN_OP_OR_uxn_c_l293_c4_8318_left;
     BIN_OP_OR_uxn_c_l293_c4_8318_right <= VAR_BIN_OP_OR_uxn_c_l293_c4_8318_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l293_c4_8318_return_output := BIN_OP_OR_uxn_c_l293_c4_8318_return_output;

     -- BIN_OP_OR[uxn_c_l315_c4_5b71] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l315_c4_5b71_left <= VAR_BIN_OP_OR_uxn_c_l315_c4_5b71_left;
     BIN_OP_OR_uxn_c_l315_c4_5b71_right <= VAR_BIN_OP_OR_uxn_c_l315_c4_5b71_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l315_c4_5b71_return_output := BIN_OP_OR_uxn_c_l315_c4_5b71_return_output;

     -- color_3_MUX[uxn_c_l331_c8_4c37] LATENCY=0
     -- Inputs
     color_3_MUX_uxn_c_l331_c8_4c37_cond <= VAR_color_3_MUX_uxn_c_l331_c8_4c37_cond;
     color_3_MUX_uxn_c_l331_c8_4c37_iftrue <= VAR_color_3_MUX_uxn_c_l331_c8_4c37_iftrue;
     color_3_MUX_uxn_c_l331_c8_4c37_iffalse <= VAR_color_3_MUX_uxn_c_l331_c8_4c37_iffalse;
     -- Outputs
     VAR_color_3_MUX_uxn_c_l331_c8_4c37_return_output := color_3_MUX_uxn_c_l331_c8_4c37_return_output;

     -- BIN_OP_OR[uxn_c_l334_c4_8ce5] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l334_c4_8ce5_left <= VAR_BIN_OP_OR_uxn_c_l334_c4_8ce5_left;
     BIN_OP_OR_uxn_c_l334_c4_8ce5_right <= VAR_BIN_OP_OR_uxn_c_l334_c4_8ce5_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l334_c4_8ce5_return_output := BIN_OP_OR_uxn_c_l334_c4_8ce5_return_output;

     -- BIN_OP_AND[uxn_c_l272_c6_32bc] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l272_c6_32bc_left <= VAR_BIN_OP_AND_uxn_c_l272_c6_32bc_left;
     BIN_OP_AND_uxn_c_l272_c6_32bc_right <= VAR_BIN_OP_AND_uxn_c_l272_c6_32bc_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l272_c6_32bc_return_output := BIN_OP_AND_uxn_c_l272_c6_32bc_return_output;

     -- Submodule level 4
     VAR_color_MUX_uxn_c_l272_c2_dda9_cond := VAR_BIN_OP_AND_uxn_c_l272_c6_32bc_return_output;
     VAR_color_2_MUX_uxn_c_l331_c8_4c37_iftrue := VAR_BIN_OP_OR_uxn_c_l334_c4_8ce5_return_output;
     -- color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8[uxn_c_l300_c8_8441] LATENCY=0
     VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l300_c8_8441_return_output := CONST_REF_RD_uint12_t_4_uint12_t_4_90b8(
     color,
     VAR_BIN_OP_OR_uxn_c_l304_c4_391f_return_output,
     VAR_BIN_OP_OR_uxn_c_l309_c4_9d71_return_output);

     -- color_2_MUX[uxn_c_l331_c8_4c37] LATENCY=0
     -- Inputs
     color_2_MUX_uxn_c_l331_c8_4c37_cond <= VAR_color_2_MUX_uxn_c_l331_c8_4c37_cond;
     color_2_MUX_uxn_c_l331_c8_4c37_iftrue <= VAR_color_2_MUX_uxn_c_l331_c8_4c37_iftrue;
     color_2_MUX_uxn_c_l331_c8_4c37_iffalse <= VAR_color_2_MUX_uxn_c_l331_c8_4c37_iffalse;
     -- Outputs
     VAR_color_2_MUX_uxn_c_l331_c8_4c37_return_output := color_2_MUX_uxn_c_l331_c8_4c37_return_output;

     -- color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5[uxn_c_l289_c8_6ebc] LATENCY=0
     VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l289_c8_6ebc_return_output := CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5(
     color,
     VAR_BIN_OP_OR_uxn_c_l293_c4_8318_return_output,
     VAR_BIN_OP_OR_uxn_c_l298_c4_6630_return_output);

     -- color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8[uxn_c_l278_c3_fc29] LATENCY=0
     VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l278_c3_fc29_return_output := CONST_REF_RD_uint12_t_4_uint12_t_4_90b8(
     color,
     VAR_BIN_OP_OR_uxn_c_l282_c4_a98f_return_output,
     VAR_BIN_OP_OR_uxn_c_l287_c4_6a78_return_output);

     -- color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8[uxn_c_l322_c8_64dc] LATENCY=0
     VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l322_c8_64dc_return_output := CONST_REF_RD_uint12_t_4_uint12_t_4_90b8(
     color,
     VAR_BIN_OP_OR_uxn_c_l325_c4_2777_return_output,
     VAR_BIN_OP_OR_uxn_c_l329_c4_4621_return_output);

     -- color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5[uxn_c_l311_c8_f32e] LATENCY=0
     VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l311_c8_f32e_return_output := CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5(
     color,
     VAR_BIN_OP_OR_uxn_c_l315_c4_5b71_return_output,
     VAR_BIN_OP_OR_uxn_c_l320_c4_9783_return_output);

     -- Submodule level 5
     VAR_color_MUX_uxn_c_l278_c3_fc29_iftrue := VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l278_c3_fc29_return_output;
     VAR_color_MUX_uxn_c_l300_c8_8441_iftrue := VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l300_c8_8441_return_output;
     VAR_color_MUX_uxn_c_l322_c8_64dc_iftrue := VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l322_c8_64dc_return_output;
     VAR_color_MUX_uxn_c_l289_c8_6ebc_iftrue := VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l289_c8_6ebc_return_output;
     VAR_color_MUX_uxn_c_l311_c8_f32e_iftrue := VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l311_c8_f32e_return_output;
     -- color_FALSE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_3db8[uxn_c_l322_c8_64dc] LATENCY=0
     VAR_color_FALSE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_3db8_uxn_c_l322_c8_64dc_return_output := CONST_REF_RD_uint12_t_4_uint12_t_4_3db8(
     color,
     VAR_color_3_MUX_uxn_c_l331_c8_4c37_return_output,
     VAR_color_2_MUX_uxn_c_l331_c8_4c37_return_output);

     -- Submodule level 6
     VAR_color_MUX_uxn_c_l322_c8_64dc_iffalse := VAR_color_FALSE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_3db8_uxn_c_l322_c8_64dc_return_output;
     -- color_MUX[uxn_c_l322_c8_64dc] LATENCY=0
     -- Inputs
     color_MUX_uxn_c_l322_c8_64dc_cond <= VAR_color_MUX_uxn_c_l322_c8_64dc_cond;
     color_MUX_uxn_c_l322_c8_64dc_iftrue <= VAR_color_MUX_uxn_c_l322_c8_64dc_iftrue;
     color_MUX_uxn_c_l322_c8_64dc_iffalse <= VAR_color_MUX_uxn_c_l322_c8_64dc_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_c_l322_c8_64dc_return_output := color_MUX_uxn_c_l322_c8_64dc_return_output;

     -- Submodule level 7
     VAR_color_MUX_uxn_c_l311_c8_f32e_iffalse := VAR_color_MUX_uxn_c_l322_c8_64dc_return_output;
     -- color_MUX[uxn_c_l311_c8_f32e] LATENCY=0
     -- Inputs
     color_MUX_uxn_c_l311_c8_f32e_cond <= VAR_color_MUX_uxn_c_l311_c8_f32e_cond;
     color_MUX_uxn_c_l311_c8_f32e_iftrue <= VAR_color_MUX_uxn_c_l311_c8_f32e_iftrue;
     color_MUX_uxn_c_l311_c8_f32e_iffalse <= VAR_color_MUX_uxn_c_l311_c8_f32e_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_c_l311_c8_f32e_return_output := color_MUX_uxn_c_l311_c8_f32e_return_output;

     -- Submodule level 8
     VAR_color_MUX_uxn_c_l300_c8_8441_iffalse := VAR_color_MUX_uxn_c_l311_c8_f32e_return_output;
     -- color_MUX[uxn_c_l300_c8_8441] LATENCY=0
     -- Inputs
     color_MUX_uxn_c_l300_c8_8441_cond <= VAR_color_MUX_uxn_c_l300_c8_8441_cond;
     color_MUX_uxn_c_l300_c8_8441_iftrue <= VAR_color_MUX_uxn_c_l300_c8_8441_iftrue;
     color_MUX_uxn_c_l300_c8_8441_iffalse <= VAR_color_MUX_uxn_c_l300_c8_8441_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_c_l300_c8_8441_return_output := color_MUX_uxn_c_l300_c8_8441_return_output;

     -- Submodule level 9
     VAR_color_MUX_uxn_c_l289_c8_6ebc_iffalse := VAR_color_MUX_uxn_c_l300_c8_8441_return_output;
     -- color_MUX[uxn_c_l289_c8_6ebc] LATENCY=0
     -- Inputs
     color_MUX_uxn_c_l289_c8_6ebc_cond <= VAR_color_MUX_uxn_c_l289_c8_6ebc_cond;
     color_MUX_uxn_c_l289_c8_6ebc_iftrue <= VAR_color_MUX_uxn_c_l289_c8_6ebc_iftrue;
     color_MUX_uxn_c_l289_c8_6ebc_iffalse <= VAR_color_MUX_uxn_c_l289_c8_6ebc_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_c_l289_c8_6ebc_return_output := color_MUX_uxn_c_l289_c8_6ebc_return_output;

     -- Submodule level 10
     VAR_color_MUX_uxn_c_l278_c3_fc29_iffalse := VAR_color_MUX_uxn_c_l289_c8_6ebc_return_output;
     -- color_MUX[uxn_c_l278_c3_fc29] LATENCY=0
     -- Inputs
     color_MUX_uxn_c_l278_c3_fc29_cond <= VAR_color_MUX_uxn_c_l278_c3_fc29_cond;
     color_MUX_uxn_c_l278_c3_fc29_iftrue <= VAR_color_MUX_uxn_c_l278_c3_fc29_iftrue;
     color_MUX_uxn_c_l278_c3_fc29_iffalse <= VAR_color_MUX_uxn_c_l278_c3_fc29_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_c_l278_c3_fc29_return_output := color_MUX_uxn_c_l278_c3_fc29_return_output;

     -- Submodule level 11
     VAR_color_MUX_uxn_c_l272_c2_dda9_iftrue := VAR_color_MUX_uxn_c_l278_c3_fc29_return_output;
     -- color_MUX[uxn_c_l272_c2_dda9] LATENCY=0
     -- Inputs
     color_MUX_uxn_c_l272_c2_dda9_cond <= VAR_color_MUX_uxn_c_l272_c2_dda9_cond;
     color_MUX_uxn_c_l272_c2_dda9_iftrue <= VAR_color_MUX_uxn_c_l272_c2_dda9_iftrue;
     color_MUX_uxn_c_l272_c2_dda9_iffalse <= VAR_color_MUX_uxn_c_l272_c2_dda9_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_c_l272_c2_dda9_return_output := color_MUX_uxn_c_l272_c2_dda9_return_output;

     -- Submodule level 12
     VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l342_c20_9e9f_ref_toks_0 := VAR_color_MUX_uxn_c_l272_c2_dda9_return_output;
     REG_VAR_color := VAR_color_MUX_uxn_c_l272_c2_dda9_return_output;
     -- VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d[uxn_c_l342_c20_9e9f] LATENCY=0
     -- Inputs
     VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l342_c20_9e9f_ref_toks_0 <= VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l342_c20_9e9f_ref_toks_0;
     VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l342_c20_9e9f_var_dim_0 <= VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l342_c20_9e9f_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l342_c20_9e9f_return_output := VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l342_c20_9e9f_return_output;

     -- Submodule level 13
     VAR_result_uxn_c_l342_c11_9292_0 := resize(VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l342_c20_9e9f_return_output, 16);
     VAR_return_output := VAR_result_uxn_c_l342_c11_9292_0;
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
