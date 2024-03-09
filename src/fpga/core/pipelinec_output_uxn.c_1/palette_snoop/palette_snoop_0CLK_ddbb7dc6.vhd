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
-- CONST_SR_4[uxn_c_l271_c30_11e1]
signal CONST_SR_4_uxn_c_l271_c30_11e1_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_c_l271_c30_11e1_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_c_l271_c30_df75]
signal BIN_OP_EQ_uxn_c_l271_c30_df75_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l271_c30_df75_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l271_c30_df75_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l271_c30_1be7]
signal MUX_uxn_c_l271_c30_1be7_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l271_c30_1be7_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l271_c30_1be7_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l271_c30_1be7_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l273_c6_ce52]
signal BIN_OP_AND_uxn_c_l273_c6_ce52_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l273_c6_ce52_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l273_c6_ce52_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_c_l273_c2_65b1]
signal color_MUX_uxn_c_l273_c2_65b1_cond : unsigned(0 downto 0);
signal color_MUX_uxn_c_l273_c2_65b1_iftrue : uint12_t_4;
signal color_MUX_uxn_c_l273_c2_65b1_iffalse : uint12_t_4;
signal color_MUX_uxn_c_l273_c2_65b1_return_output : uint12_t_4;

-- CONST_SR_4[uxn_c_l276_c35_0bc1]
signal CONST_SR_4_uxn_c_l276_c35_0bc1_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_c_l276_c35_0bc1_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_c_l279_c7_2e6d]
signal BIN_OP_EQ_uxn_c_l279_c7_2e6d_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l279_c7_2e6d_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l279_c7_2e6d_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_c_l279_c3_a9f5]
signal color_MUX_uxn_c_l279_c3_a9f5_cond : unsigned(0 downto 0);
signal color_MUX_uxn_c_l279_c3_a9f5_iftrue : uint12_t_4;
signal color_MUX_uxn_c_l279_c3_a9f5_iffalse : uint12_t_4;
signal color_MUX_uxn_c_l279_c3_a9f5_return_output : uint12_t_4;

-- CONST_SL_8[uxn_c_l281_c4_2305]
signal CONST_SL_8_uxn_c_l281_c4_2305_x : unsigned(11 downto 0);
signal CONST_SL_8_uxn_c_l281_c4_2305_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l282_c4_3160]
signal BIN_OP_AND_uxn_c_l282_c4_3160_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l282_c4_3160_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l282_c4_3160_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l283_c4_fd61]
signal BIN_OP_OR_uxn_c_l283_c4_fd61_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l283_c4_fd61_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l283_c4_fd61_return_output : unsigned(11 downto 0);

-- CONST_SL_8[uxn_c_l286_c4_dac2]
signal CONST_SL_8_uxn_c_l286_c4_dac2_x : unsigned(11 downto 0);
signal CONST_SL_8_uxn_c_l286_c4_dac2_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l287_c4_e028]
signal BIN_OP_AND_uxn_c_l287_c4_e028_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l287_c4_e028_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l287_c4_e028_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l288_c4_5b4f]
signal BIN_OP_OR_uxn_c_l288_c4_5b4f_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l288_c4_5b4f_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l288_c4_5b4f_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l290_c12_d197]
signal BIN_OP_EQ_uxn_c_l290_c12_d197_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l290_c12_d197_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l290_c12_d197_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_c_l290_c8_033a]
signal color_MUX_uxn_c_l290_c8_033a_cond : unsigned(0 downto 0);
signal color_MUX_uxn_c_l290_c8_033a_iftrue : uint12_t_4;
signal color_MUX_uxn_c_l290_c8_033a_iffalse : uint12_t_4;
signal color_MUX_uxn_c_l290_c8_033a_return_output : uint12_t_4;

-- CONST_SL_8[uxn_c_l292_c4_5e40]
signal CONST_SL_8_uxn_c_l292_c4_5e40_x : unsigned(11 downto 0);
signal CONST_SL_8_uxn_c_l292_c4_5e40_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l293_c4_00b7]
signal BIN_OP_AND_uxn_c_l293_c4_00b7_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l293_c4_00b7_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l293_c4_00b7_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l294_c4_9c8b]
signal BIN_OP_OR_uxn_c_l294_c4_9c8b_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l294_c4_9c8b_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l294_c4_9c8b_return_output : unsigned(11 downto 0);

-- CONST_SL_8[uxn_c_l297_c4_84ff]
signal CONST_SL_8_uxn_c_l297_c4_84ff_x : unsigned(11 downto 0);
signal CONST_SL_8_uxn_c_l297_c4_84ff_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l298_c4_1d23]
signal BIN_OP_AND_uxn_c_l298_c4_1d23_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l298_c4_1d23_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l298_c4_1d23_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l299_c4_1b8b]
signal BIN_OP_OR_uxn_c_l299_c4_1b8b_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l299_c4_1b8b_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l299_c4_1b8b_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l301_c12_54ae]
signal BIN_OP_EQ_uxn_c_l301_c12_54ae_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l301_c12_54ae_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l301_c12_54ae_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_c_l301_c8_5ae9]
signal color_MUX_uxn_c_l301_c8_5ae9_cond : unsigned(0 downto 0);
signal color_MUX_uxn_c_l301_c8_5ae9_iftrue : uint12_t_4;
signal color_MUX_uxn_c_l301_c8_5ae9_iffalse : uint12_t_4;
signal color_MUX_uxn_c_l301_c8_5ae9_return_output : uint12_t_4;

-- CONST_SL_4[uxn_c_l303_c4_60fb]
signal CONST_SL_4_uxn_c_l303_c4_60fb_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_c_l303_c4_60fb_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l304_c4_9f49]
signal BIN_OP_AND_uxn_c_l304_c4_9f49_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l304_c4_9f49_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l304_c4_9f49_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l305_c4_6566]
signal BIN_OP_OR_uxn_c_l305_c4_6566_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l305_c4_6566_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l305_c4_6566_return_output : unsigned(11 downto 0);

-- CONST_SL_4[uxn_c_l308_c4_ba82]
signal CONST_SL_4_uxn_c_l308_c4_ba82_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_c_l308_c4_ba82_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l309_c4_55f9]
signal BIN_OP_AND_uxn_c_l309_c4_55f9_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l309_c4_55f9_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l309_c4_55f9_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l310_c4_26ac]
signal BIN_OP_OR_uxn_c_l310_c4_26ac_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l310_c4_26ac_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l310_c4_26ac_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l312_c12_c3b6]
signal BIN_OP_EQ_uxn_c_l312_c12_c3b6_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l312_c12_c3b6_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l312_c12_c3b6_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_c_l312_c8_aaba]
signal color_MUX_uxn_c_l312_c8_aaba_cond : unsigned(0 downto 0);
signal color_MUX_uxn_c_l312_c8_aaba_iftrue : uint12_t_4;
signal color_MUX_uxn_c_l312_c8_aaba_iffalse : uint12_t_4;
signal color_MUX_uxn_c_l312_c8_aaba_return_output : uint12_t_4;

-- CONST_SL_4[uxn_c_l314_c4_f16c]
signal CONST_SL_4_uxn_c_l314_c4_f16c_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_c_l314_c4_f16c_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l315_c4_a82d]
signal BIN_OP_AND_uxn_c_l315_c4_a82d_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l315_c4_a82d_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l315_c4_a82d_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l316_c4_71de]
signal BIN_OP_OR_uxn_c_l316_c4_71de_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l316_c4_71de_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l316_c4_71de_return_output : unsigned(11 downto 0);

-- CONST_SL_4[uxn_c_l319_c4_d266]
signal CONST_SL_4_uxn_c_l319_c4_d266_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_c_l319_c4_d266_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l320_c4_7544]
signal BIN_OP_AND_uxn_c_l320_c4_7544_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l320_c4_7544_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l320_c4_7544_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l321_c4_9c9e]
signal BIN_OP_OR_uxn_c_l321_c4_9c9e_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l321_c4_9c9e_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l321_c4_9c9e_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l323_c12_4de9]
signal BIN_OP_EQ_uxn_c_l323_c12_4de9_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l323_c12_4de9_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l323_c12_4de9_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_c_l323_c8_dc37]
signal color_MUX_uxn_c_l323_c8_dc37_cond : unsigned(0 downto 0);
signal color_MUX_uxn_c_l323_c8_dc37_iftrue : uint12_t_4;
signal color_MUX_uxn_c_l323_c8_dc37_iffalse : uint12_t_4;
signal color_MUX_uxn_c_l323_c8_dc37_return_output : uint12_t_4;

-- BIN_OP_AND[uxn_c_l325_c4_8eb5]
signal BIN_OP_AND_uxn_c_l325_c4_8eb5_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l325_c4_8eb5_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l325_c4_8eb5_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l326_c4_75bc]
signal BIN_OP_OR_uxn_c_l326_c4_75bc_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l326_c4_75bc_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l326_c4_75bc_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l329_c4_f024]
signal BIN_OP_AND_uxn_c_l329_c4_f024_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l329_c4_f024_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l329_c4_f024_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l330_c4_0d2d]
signal BIN_OP_OR_uxn_c_l330_c4_0d2d_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l330_c4_0d2d_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l330_c4_0d2d_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l332_c12_0bb3]
signal BIN_OP_EQ_uxn_c_l332_c12_0bb3_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l332_c12_0bb3_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l332_c12_0bb3_return_output : unsigned(0 downto 0);

-- color_2_MUX[uxn_c_l332_c8_3490]
signal color_2_MUX_uxn_c_l332_c8_3490_cond : unsigned(0 downto 0);
signal color_2_MUX_uxn_c_l332_c8_3490_iftrue : unsigned(11 downto 0);
signal color_2_MUX_uxn_c_l332_c8_3490_iffalse : unsigned(11 downto 0);
signal color_2_MUX_uxn_c_l332_c8_3490_return_output : unsigned(11 downto 0);

-- color_3_MUX[uxn_c_l332_c8_3490]
signal color_3_MUX_uxn_c_l332_c8_3490_cond : unsigned(0 downto 0);
signal color_3_MUX_uxn_c_l332_c8_3490_iftrue : unsigned(11 downto 0);
signal color_3_MUX_uxn_c_l332_c8_3490_iffalse : unsigned(11 downto 0);
signal color_3_MUX_uxn_c_l332_c8_3490_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l334_c4_ae5f]
signal BIN_OP_AND_uxn_c_l334_c4_ae5f_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l334_c4_ae5f_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l334_c4_ae5f_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l335_c4_7e3e]
signal BIN_OP_OR_uxn_c_l335_c4_7e3e_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l335_c4_7e3e_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l335_c4_7e3e_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l338_c4_bb09]
signal BIN_OP_AND_uxn_c_l338_c4_bb09_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l338_c4_bb09_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l338_c4_bb09_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l339_c4_435a]
signal BIN_OP_OR_uxn_c_l339_c4_435a_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l339_c4_435a_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l339_c4_435a_return_output : unsigned(11 downto 0);

-- VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d[uxn_c_l343_c20_0ed8]
signal VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l343_c20_0ed8_ref_toks_0 : uint12_t_4;
signal VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l343_c20_0ed8_var_dim_0 : unsigned(1 downto 0);
signal VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l343_c20_0ed8_return_output : unsigned(11 downto 0);

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
-- CONST_SR_4_uxn_c_l271_c30_11e1
CONST_SR_4_uxn_c_l271_c30_11e1 : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_c_l271_c30_11e1_x,
CONST_SR_4_uxn_c_l271_c30_11e1_return_output);

-- BIN_OP_EQ_uxn_c_l271_c30_df75
BIN_OP_EQ_uxn_c_l271_c30_df75 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l271_c30_df75_left,
BIN_OP_EQ_uxn_c_l271_c30_df75_right,
BIN_OP_EQ_uxn_c_l271_c30_df75_return_output);

-- MUX_uxn_c_l271_c30_1be7
MUX_uxn_c_l271_c30_1be7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l271_c30_1be7_cond,
MUX_uxn_c_l271_c30_1be7_iftrue,
MUX_uxn_c_l271_c30_1be7_iffalse,
MUX_uxn_c_l271_c30_1be7_return_output);

-- BIN_OP_AND_uxn_c_l273_c6_ce52
BIN_OP_AND_uxn_c_l273_c6_ce52 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l273_c6_ce52_left,
BIN_OP_AND_uxn_c_l273_c6_ce52_right,
BIN_OP_AND_uxn_c_l273_c6_ce52_return_output);

-- color_MUX_uxn_c_l273_c2_65b1
color_MUX_uxn_c_l273_c2_65b1 : entity work.MUX_uint1_t_uint12_t_4_uint12_t_4_0CLK_de264c78 port map (
color_MUX_uxn_c_l273_c2_65b1_cond,
color_MUX_uxn_c_l273_c2_65b1_iftrue,
color_MUX_uxn_c_l273_c2_65b1_iffalse,
color_MUX_uxn_c_l273_c2_65b1_return_output);

-- CONST_SR_4_uxn_c_l276_c35_0bc1
CONST_SR_4_uxn_c_l276_c35_0bc1 : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_c_l276_c35_0bc1_x,
CONST_SR_4_uxn_c_l276_c35_0bc1_return_output);

-- BIN_OP_EQ_uxn_c_l279_c7_2e6d
BIN_OP_EQ_uxn_c_l279_c7_2e6d : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l279_c7_2e6d_left,
BIN_OP_EQ_uxn_c_l279_c7_2e6d_right,
BIN_OP_EQ_uxn_c_l279_c7_2e6d_return_output);

-- color_MUX_uxn_c_l279_c3_a9f5
color_MUX_uxn_c_l279_c3_a9f5 : entity work.MUX_uint1_t_uint12_t_4_uint12_t_4_0CLK_de264c78 port map (
color_MUX_uxn_c_l279_c3_a9f5_cond,
color_MUX_uxn_c_l279_c3_a9f5_iftrue,
color_MUX_uxn_c_l279_c3_a9f5_iffalse,
color_MUX_uxn_c_l279_c3_a9f5_return_output);

-- CONST_SL_8_uxn_c_l281_c4_2305
CONST_SL_8_uxn_c_l281_c4_2305 : entity work.CONST_SL_8_uint12_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l281_c4_2305_x,
CONST_SL_8_uxn_c_l281_c4_2305_return_output);

-- BIN_OP_AND_uxn_c_l282_c4_3160
BIN_OP_AND_uxn_c_l282_c4_3160 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l282_c4_3160_left,
BIN_OP_AND_uxn_c_l282_c4_3160_right,
BIN_OP_AND_uxn_c_l282_c4_3160_return_output);

-- BIN_OP_OR_uxn_c_l283_c4_fd61
BIN_OP_OR_uxn_c_l283_c4_fd61 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l283_c4_fd61_left,
BIN_OP_OR_uxn_c_l283_c4_fd61_right,
BIN_OP_OR_uxn_c_l283_c4_fd61_return_output);

-- CONST_SL_8_uxn_c_l286_c4_dac2
CONST_SL_8_uxn_c_l286_c4_dac2 : entity work.CONST_SL_8_uint12_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l286_c4_dac2_x,
CONST_SL_8_uxn_c_l286_c4_dac2_return_output);

-- BIN_OP_AND_uxn_c_l287_c4_e028
BIN_OP_AND_uxn_c_l287_c4_e028 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l287_c4_e028_left,
BIN_OP_AND_uxn_c_l287_c4_e028_right,
BIN_OP_AND_uxn_c_l287_c4_e028_return_output);

-- BIN_OP_OR_uxn_c_l288_c4_5b4f
BIN_OP_OR_uxn_c_l288_c4_5b4f : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l288_c4_5b4f_left,
BIN_OP_OR_uxn_c_l288_c4_5b4f_right,
BIN_OP_OR_uxn_c_l288_c4_5b4f_return_output);

-- BIN_OP_EQ_uxn_c_l290_c12_d197
BIN_OP_EQ_uxn_c_l290_c12_d197 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l290_c12_d197_left,
BIN_OP_EQ_uxn_c_l290_c12_d197_right,
BIN_OP_EQ_uxn_c_l290_c12_d197_return_output);

-- color_MUX_uxn_c_l290_c8_033a
color_MUX_uxn_c_l290_c8_033a : entity work.MUX_uint1_t_uint12_t_4_uint12_t_4_0CLK_de264c78 port map (
color_MUX_uxn_c_l290_c8_033a_cond,
color_MUX_uxn_c_l290_c8_033a_iftrue,
color_MUX_uxn_c_l290_c8_033a_iffalse,
color_MUX_uxn_c_l290_c8_033a_return_output);

-- CONST_SL_8_uxn_c_l292_c4_5e40
CONST_SL_8_uxn_c_l292_c4_5e40 : entity work.CONST_SL_8_uint12_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l292_c4_5e40_x,
CONST_SL_8_uxn_c_l292_c4_5e40_return_output);

-- BIN_OP_AND_uxn_c_l293_c4_00b7
BIN_OP_AND_uxn_c_l293_c4_00b7 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l293_c4_00b7_left,
BIN_OP_AND_uxn_c_l293_c4_00b7_right,
BIN_OP_AND_uxn_c_l293_c4_00b7_return_output);

-- BIN_OP_OR_uxn_c_l294_c4_9c8b
BIN_OP_OR_uxn_c_l294_c4_9c8b : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l294_c4_9c8b_left,
BIN_OP_OR_uxn_c_l294_c4_9c8b_right,
BIN_OP_OR_uxn_c_l294_c4_9c8b_return_output);

-- CONST_SL_8_uxn_c_l297_c4_84ff
CONST_SL_8_uxn_c_l297_c4_84ff : entity work.CONST_SL_8_uint12_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l297_c4_84ff_x,
CONST_SL_8_uxn_c_l297_c4_84ff_return_output);

-- BIN_OP_AND_uxn_c_l298_c4_1d23
BIN_OP_AND_uxn_c_l298_c4_1d23 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l298_c4_1d23_left,
BIN_OP_AND_uxn_c_l298_c4_1d23_right,
BIN_OP_AND_uxn_c_l298_c4_1d23_return_output);

-- BIN_OP_OR_uxn_c_l299_c4_1b8b
BIN_OP_OR_uxn_c_l299_c4_1b8b : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l299_c4_1b8b_left,
BIN_OP_OR_uxn_c_l299_c4_1b8b_right,
BIN_OP_OR_uxn_c_l299_c4_1b8b_return_output);

-- BIN_OP_EQ_uxn_c_l301_c12_54ae
BIN_OP_EQ_uxn_c_l301_c12_54ae : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l301_c12_54ae_left,
BIN_OP_EQ_uxn_c_l301_c12_54ae_right,
BIN_OP_EQ_uxn_c_l301_c12_54ae_return_output);

-- color_MUX_uxn_c_l301_c8_5ae9
color_MUX_uxn_c_l301_c8_5ae9 : entity work.MUX_uint1_t_uint12_t_4_uint12_t_4_0CLK_de264c78 port map (
color_MUX_uxn_c_l301_c8_5ae9_cond,
color_MUX_uxn_c_l301_c8_5ae9_iftrue,
color_MUX_uxn_c_l301_c8_5ae9_iffalse,
color_MUX_uxn_c_l301_c8_5ae9_return_output);

-- CONST_SL_4_uxn_c_l303_c4_60fb
CONST_SL_4_uxn_c_l303_c4_60fb : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_c_l303_c4_60fb_x,
CONST_SL_4_uxn_c_l303_c4_60fb_return_output);

-- BIN_OP_AND_uxn_c_l304_c4_9f49
BIN_OP_AND_uxn_c_l304_c4_9f49 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l304_c4_9f49_left,
BIN_OP_AND_uxn_c_l304_c4_9f49_right,
BIN_OP_AND_uxn_c_l304_c4_9f49_return_output);

-- BIN_OP_OR_uxn_c_l305_c4_6566
BIN_OP_OR_uxn_c_l305_c4_6566 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l305_c4_6566_left,
BIN_OP_OR_uxn_c_l305_c4_6566_right,
BIN_OP_OR_uxn_c_l305_c4_6566_return_output);

-- CONST_SL_4_uxn_c_l308_c4_ba82
CONST_SL_4_uxn_c_l308_c4_ba82 : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_c_l308_c4_ba82_x,
CONST_SL_4_uxn_c_l308_c4_ba82_return_output);

-- BIN_OP_AND_uxn_c_l309_c4_55f9
BIN_OP_AND_uxn_c_l309_c4_55f9 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l309_c4_55f9_left,
BIN_OP_AND_uxn_c_l309_c4_55f9_right,
BIN_OP_AND_uxn_c_l309_c4_55f9_return_output);

-- BIN_OP_OR_uxn_c_l310_c4_26ac
BIN_OP_OR_uxn_c_l310_c4_26ac : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l310_c4_26ac_left,
BIN_OP_OR_uxn_c_l310_c4_26ac_right,
BIN_OP_OR_uxn_c_l310_c4_26ac_return_output);

-- BIN_OP_EQ_uxn_c_l312_c12_c3b6
BIN_OP_EQ_uxn_c_l312_c12_c3b6 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l312_c12_c3b6_left,
BIN_OP_EQ_uxn_c_l312_c12_c3b6_right,
BIN_OP_EQ_uxn_c_l312_c12_c3b6_return_output);

-- color_MUX_uxn_c_l312_c8_aaba
color_MUX_uxn_c_l312_c8_aaba : entity work.MUX_uint1_t_uint12_t_4_uint12_t_4_0CLK_de264c78 port map (
color_MUX_uxn_c_l312_c8_aaba_cond,
color_MUX_uxn_c_l312_c8_aaba_iftrue,
color_MUX_uxn_c_l312_c8_aaba_iffalse,
color_MUX_uxn_c_l312_c8_aaba_return_output);

-- CONST_SL_4_uxn_c_l314_c4_f16c
CONST_SL_4_uxn_c_l314_c4_f16c : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_c_l314_c4_f16c_x,
CONST_SL_4_uxn_c_l314_c4_f16c_return_output);

-- BIN_OP_AND_uxn_c_l315_c4_a82d
BIN_OP_AND_uxn_c_l315_c4_a82d : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l315_c4_a82d_left,
BIN_OP_AND_uxn_c_l315_c4_a82d_right,
BIN_OP_AND_uxn_c_l315_c4_a82d_return_output);

-- BIN_OP_OR_uxn_c_l316_c4_71de
BIN_OP_OR_uxn_c_l316_c4_71de : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l316_c4_71de_left,
BIN_OP_OR_uxn_c_l316_c4_71de_right,
BIN_OP_OR_uxn_c_l316_c4_71de_return_output);

-- CONST_SL_4_uxn_c_l319_c4_d266
CONST_SL_4_uxn_c_l319_c4_d266 : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_c_l319_c4_d266_x,
CONST_SL_4_uxn_c_l319_c4_d266_return_output);

-- BIN_OP_AND_uxn_c_l320_c4_7544
BIN_OP_AND_uxn_c_l320_c4_7544 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l320_c4_7544_left,
BIN_OP_AND_uxn_c_l320_c4_7544_right,
BIN_OP_AND_uxn_c_l320_c4_7544_return_output);

-- BIN_OP_OR_uxn_c_l321_c4_9c9e
BIN_OP_OR_uxn_c_l321_c4_9c9e : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l321_c4_9c9e_left,
BIN_OP_OR_uxn_c_l321_c4_9c9e_right,
BIN_OP_OR_uxn_c_l321_c4_9c9e_return_output);

-- BIN_OP_EQ_uxn_c_l323_c12_4de9
BIN_OP_EQ_uxn_c_l323_c12_4de9 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l323_c12_4de9_left,
BIN_OP_EQ_uxn_c_l323_c12_4de9_right,
BIN_OP_EQ_uxn_c_l323_c12_4de9_return_output);

-- color_MUX_uxn_c_l323_c8_dc37
color_MUX_uxn_c_l323_c8_dc37 : entity work.MUX_uint1_t_uint12_t_4_uint12_t_4_0CLK_de264c78 port map (
color_MUX_uxn_c_l323_c8_dc37_cond,
color_MUX_uxn_c_l323_c8_dc37_iftrue,
color_MUX_uxn_c_l323_c8_dc37_iffalse,
color_MUX_uxn_c_l323_c8_dc37_return_output);

-- BIN_OP_AND_uxn_c_l325_c4_8eb5
BIN_OP_AND_uxn_c_l325_c4_8eb5 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l325_c4_8eb5_left,
BIN_OP_AND_uxn_c_l325_c4_8eb5_right,
BIN_OP_AND_uxn_c_l325_c4_8eb5_return_output);

-- BIN_OP_OR_uxn_c_l326_c4_75bc
BIN_OP_OR_uxn_c_l326_c4_75bc : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l326_c4_75bc_left,
BIN_OP_OR_uxn_c_l326_c4_75bc_right,
BIN_OP_OR_uxn_c_l326_c4_75bc_return_output);

-- BIN_OP_AND_uxn_c_l329_c4_f024
BIN_OP_AND_uxn_c_l329_c4_f024 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l329_c4_f024_left,
BIN_OP_AND_uxn_c_l329_c4_f024_right,
BIN_OP_AND_uxn_c_l329_c4_f024_return_output);

-- BIN_OP_OR_uxn_c_l330_c4_0d2d
BIN_OP_OR_uxn_c_l330_c4_0d2d : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l330_c4_0d2d_left,
BIN_OP_OR_uxn_c_l330_c4_0d2d_right,
BIN_OP_OR_uxn_c_l330_c4_0d2d_return_output);

-- BIN_OP_EQ_uxn_c_l332_c12_0bb3
BIN_OP_EQ_uxn_c_l332_c12_0bb3 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l332_c12_0bb3_left,
BIN_OP_EQ_uxn_c_l332_c12_0bb3_right,
BIN_OP_EQ_uxn_c_l332_c12_0bb3_return_output);

-- color_2_MUX_uxn_c_l332_c8_3490
color_2_MUX_uxn_c_l332_c8_3490 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color_2_MUX_uxn_c_l332_c8_3490_cond,
color_2_MUX_uxn_c_l332_c8_3490_iftrue,
color_2_MUX_uxn_c_l332_c8_3490_iffalse,
color_2_MUX_uxn_c_l332_c8_3490_return_output);

-- color_3_MUX_uxn_c_l332_c8_3490
color_3_MUX_uxn_c_l332_c8_3490 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color_3_MUX_uxn_c_l332_c8_3490_cond,
color_3_MUX_uxn_c_l332_c8_3490_iftrue,
color_3_MUX_uxn_c_l332_c8_3490_iffalse,
color_3_MUX_uxn_c_l332_c8_3490_return_output);

-- BIN_OP_AND_uxn_c_l334_c4_ae5f
BIN_OP_AND_uxn_c_l334_c4_ae5f : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l334_c4_ae5f_left,
BIN_OP_AND_uxn_c_l334_c4_ae5f_right,
BIN_OP_AND_uxn_c_l334_c4_ae5f_return_output);

-- BIN_OP_OR_uxn_c_l335_c4_7e3e
BIN_OP_OR_uxn_c_l335_c4_7e3e : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l335_c4_7e3e_left,
BIN_OP_OR_uxn_c_l335_c4_7e3e_right,
BIN_OP_OR_uxn_c_l335_c4_7e3e_return_output);

-- BIN_OP_AND_uxn_c_l338_c4_bb09
BIN_OP_AND_uxn_c_l338_c4_bb09 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l338_c4_bb09_left,
BIN_OP_AND_uxn_c_l338_c4_bb09_right,
BIN_OP_AND_uxn_c_l338_c4_bb09_return_output);

-- BIN_OP_OR_uxn_c_l339_c4_435a
BIN_OP_OR_uxn_c_l339_c4_435a : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l339_c4_435a_left,
BIN_OP_OR_uxn_c_l339_c4_435a_right,
BIN_OP_OR_uxn_c_l339_c4_435a_return_output);

-- VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l343_c20_0ed8
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l343_c20_0ed8 : entity work.VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_0CLK_9e40ec46 port map (
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l343_c20_0ed8_ref_toks_0,
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l343_c20_0ed8_var_dim_0,
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l343_c20_0ed8_return_output);



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
 CONST_SR_4_uxn_c_l271_c30_11e1_return_output,
 BIN_OP_EQ_uxn_c_l271_c30_df75_return_output,
 MUX_uxn_c_l271_c30_1be7_return_output,
 BIN_OP_AND_uxn_c_l273_c6_ce52_return_output,
 color_MUX_uxn_c_l273_c2_65b1_return_output,
 CONST_SR_4_uxn_c_l276_c35_0bc1_return_output,
 BIN_OP_EQ_uxn_c_l279_c7_2e6d_return_output,
 color_MUX_uxn_c_l279_c3_a9f5_return_output,
 CONST_SL_8_uxn_c_l281_c4_2305_return_output,
 BIN_OP_AND_uxn_c_l282_c4_3160_return_output,
 BIN_OP_OR_uxn_c_l283_c4_fd61_return_output,
 CONST_SL_8_uxn_c_l286_c4_dac2_return_output,
 BIN_OP_AND_uxn_c_l287_c4_e028_return_output,
 BIN_OP_OR_uxn_c_l288_c4_5b4f_return_output,
 BIN_OP_EQ_uxn_c_l290_c12_d197_return_output,
 color_MUX_uxn_c_l290_c8_033a_return_output,
 CONST_SL_8_uxn_c_l292_c4_5e40_return_output,
 BIN_OP_AND_uxn_c_l293_c4_00b7_return_output,
 BIN_OP_OR_uxn_c_l294_c4_9c8b_return_output,
 CONST_SL_8_uxn_c_l297_c4_84ff_return_output,
 BIN_OP_AND_uxn_c_l298_c4_1d23_return_output,
 BIN_OP_OR_uxn_c_l299_c4_1b8b_return_output,
 BIN_OP_EQ_uxn_c_l301_c12_54ae_return_output,
 color_MUX_uxn_c_l301_c8_5ae9_return_output,
 CONST_SL_4_uxn_c_l303_c4_60fb_return_output,
 BIN_OP_AND_uxn_c_l304_c4_9f49_return_output,
 BIN_OP_OR_uxn_c_l305_c4_6566_return_output,
 CONST_SL_4_uxn_c_l308_c4_ba82_return_output,
 BIN_OP_AND_uxn_c_l309_c4_55f9_return_output,
 BIN_OP_OR_uxn_c_l310_c4_26ac_return_output,
 BIN_OP_EQ_uxn_c_l312_c12_c3b6_return_output,
 color_MUX_uxn_c_l312_c8_aaba_return_output,
 CONST_SL_4_uxn_c_l314_c4_f16c_return_output,
 BIN_OP_AND_uxn_c_l315_c4_a82d_return_output,
 BIN_OP_OR_uxn_c_l316_c4_71de_return_output,
 CONST_SL_4_uxn_c_l319_c4_d266_return_output,
 BIN_OP_AND_uxn_c_l320_c4_7544_return_output,
 BIN_OP_OR_uxn_c_l321_c4_9c9e_return_output,
 BIN_OP_EQ_uxn_c_l323_c12_4de9_return_output,
 color_MUX_uxn_c_l323_c8_dc37_return_output,
 BIN_OP_AND_uxn_c_l325_c4_8eb5_return_output,
 BIN_OP_OR_uxn_c_l326_c4_75bc_return_output,
 BIN_OP_AND_uxn_c_l329_c4_f024_return_output,
 BIN_OP_OR_uxn_c_l330_c4_0d2d_return_output,
 BIN_OP_EQ_uxn_c_l332_c12_0bb3_return_output,
 color_2_MUX_uxn_c_l332_c8_3490_return_output,
 color_3_MUX_uxn_c_l332_c8_3490_return_output,
 BIN_OP_AND_uxn_c_l334_c4_ae5f_return_output,
 BIN_OP_OR_uxn_c_l335_c4_7e3e_return_output,
 BIN_OP_AND_uxn_c_l338_c4_bb09_return_output,
 BIN_OP_OR_uxn_c_l339_c4_435a_return_output,
 VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l343_c20_0ed8_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_device_ram_address : unsigned(7 downto 0);
 variable VAR_device_ram_value : unsigned(7 downto 0);
 variable VAR_is_device_ram_write : unsigned(0 downto 0);
 variable VAR_gpu_step_color : unsigned(1 downto 0);
 variable VAR_is_palette_range : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l271_c30_1be7_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_4_uxn_c_l271_c30_11e1_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l271_c30_df75_left : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_c_l271_c30_11e1_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l271_c30_df75_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l271_c30_df75_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l271_c30_1be7_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l271_c30_1be7_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l271_c30_1be7_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l273_c6_ce52_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l273_c6_ce52_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l273_c6_ce52_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_c_l273_c2_65b1_iftrue : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l279_c3_a9f5_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l273_c2_65b1_iffalse : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l273_c2_65b1_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l273_c2_65b1_cond : unsigned(0 downto 0);
 variable VAR_tmp12 : unsigned(11 downto 0);
 variable VAR_addr_low : unsigned(3 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_c_l275_c22_4ca6_return_output : unsigned(3 downto 0);
 variable VAR_color_cmp_0 : unsigned(3 downto 0);
 variable VAR_color_cmp_0_uxn_c_l276_c11_40e6_0 : unsigned(3 downto 0);
 variable VAR_CONST_SR_4_uxn_c_l276_c35_0bc1_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_c_l276_c35_0bc1_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_c_l276_c25_8b43_return_output : unsigned(3 downto 0);
 variable VAR_color_cmp_1 : unsigned(3 downto 0);
 variable VAR_color_cmp_1_uxn_c_l277_c11_41ea_0 : unsigned(3 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_c_l277_c25_1c76_return_output : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l279_c7_2e6d_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l279_c7_2e6d_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l279_c7_2e6d_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_c_l279_c3_a9f5_iftrue : uint12_t_4;
 variable VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l279_c3_a9f5_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l279_c3_a9f5_iffalse : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l290_c8_033a_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l279_c3_a9f5_cond : unsigned(0 downto 0);
 variable VAR_tmp12_uxn_c_l280_c4_c626 : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l281_c4_2305_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l281_c4_2305_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l282_c4_3160_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l282_c4_3160_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l282_c4_3160_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l283_c4_fd61_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l283_c4_fd61_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l283_c4_fd61_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_uxn_c_l285_c4_ea1f : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l286_c4_dac2_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l286_c4_dac2_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l287_c4_e028_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l287_c4_e028_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l287_c4_e028_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l288_c4_5b4f_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l288_c4_5b4f_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l288_c4_5b4f_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l290_c12_d197_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l290_c12_d197_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l290_c12_d197_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_c_l290_c8_033a_iftrue : uint12_t_4;
 variable VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l290_c8_033a_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l290_c8_033a_iffalse : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l301_c8_5ae9_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l290_c8_033a_cond : unsigned(0 downto 0);
 variable VAR_tmp12_uxn_c_l291_c4_1a8e : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l292_c4_5e40_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l292_c4_5e40_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l293_c4_00b7_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l293_c4_00b7_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l293_c4_00b7_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l294_c4_9c8b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l294_c4_9c8b_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l294_c4_9c8b_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_uxn_c_l296_c4_6b97 : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l297_c4_84ff_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l297_c4_84ff_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l298_c4_1d23_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l298_c4_1d23_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l298_c4_1d23_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l299_c4_1b8b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l299_c4_1b8b_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l299_c4_1b8b_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l301_c12_54ae_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l301_c12_54ae_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l301_c12_54ae_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_c_l301_c8_5ae9_iftrue : uint12_t_4;
 variable VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l301_c8_5ae9_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l301_c8_5ae9_iffalse : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l312_c8_aaba_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l301_c8_5ae9_cond : unsigned(0 downto 0);
 variable VAR_tmp12_uxn_c_l302_c4_61ff : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l303_c4_60fb_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l303_c4_60fb_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l304_c4_9f49_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l304_c4_9f49_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l304_c4_9f49_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l305_c4_6566_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l305_c4_6566_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l305_c4_6566_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_uxn_c_l307_c4_5082 : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l308_c4_ba82_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l308_c4_ba82_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l309_c4_55f9_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l309_c4_55f9_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l309_c4_55f9_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l310_c4_26ac_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l310_c4_26ac_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l310_c4_26ac_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l312_c12_c3b6_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l312_c12_c3b6_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l312_c12_c3b6_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_c_l312_c8_aaba_iftrue : uint12_t_4;
 variable VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l312_c8_aaba_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l312_c8_aaba_iffalse : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l323_c8_dc37_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l312_c8_aaba_cond : unsigned(0 downto 0);
 variable VAR_tmp12_uxn_c_l313_c4_aaa2 : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l314_c4_f16c_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l314_c4_f16c_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l315_c4_a82d_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l315_c4_a82d_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l315_c4_a82d_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l316_c4_71de_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l316_c4_71de_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l316_c4_71de_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_uxn_c_l318_c4_7306 : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l319_c4_d266_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l319_c4_d266_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l320_c4_7544_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l320_c4_7544_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l320_c4_7544_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l321_c4_9c9e_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l321_c4_9c9e_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l321_c4_9c9e_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l323_c12_4de9_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l323_c12_4de9_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l323_c12_4de9_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_c_l323_c8_dc37_iftrue : uint12_t_4;
 variable VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l323_c8_dc37_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l323_c8_dc37_iffalse : uint12_t_4;
 variable VAR_color_FALSE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l323_c8_dc37_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l323_c8_dc37_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l325_c4_8eb5_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l325_c4_8eb5_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l325_c4_8eb5_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l326_c4_75bc_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l326_c4_75bc_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l326_c4_75bc_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l329_c4_f024_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l329_c4_f024_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l329_c4_f024_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l330_c4_0d2d_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l330_c4_0d2d_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l330_c4_0d2d_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l332_c12_0bb3_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l332_c12_0bb3_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l332_c12_0bb3_return_output : unsigned(0 downto 0);
 variable VAR_color_2_MUX_uxn_c_l332_c8_3490_iftrue : unsigned(11 downto 0);
 variable VAR_color_2_MUX_uxn_c_l332_c8_3490_iffalse : unsigned(11 downto 0);
 variable VAR_color_2_MUX_uxn_c_l332_c8_3490_return_output : unsigned(11 downto 0);
 variable VAR_color_2_MUX_uxn_c_l332_c8_3490_cond : unsigned(0 downto 0);
 variable VAR_color_3_MUX_uxn_c_l332_c8_3490_iftrue : unsigned(11 downto 0);
 variable VAR_color_3_MUX_uxn_c_l332_c8_3490_iffalse : unsigned(11 downto 0);
 variable VAR_color_3_MUX_uxn_c_l332_c8_3490_return_output : unsigned(11 downto 0);
 variable VAR_color_3_MUX_uxn_c_l332_c8_3490_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l334_c4_ae5f_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l334_c4_ae5f_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l334_c4_ae5f_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l335_c4_7e3e_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l335_c4_7e3e_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l335_c4_7e3e_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l338_c4_bb09_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l338_c4_bb09_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l338_c4_bb09_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l339_c4_435a_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l339_c4_435a_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l339_c4_435a_return_output : unsigned(11 downto 0);
 variable VAR_result : unsigned(15 downto 0);
 variable VAR_result_uxn_c_l343_c11_05dc_0 : unsigned(15 downto 0);
 variable VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l343_c20_0ed8_var_dim_0 : unsigned(1 downto 0);
 variable VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l343_c20_0ed8_return_output : unsigned(11 downto 0);
 variable VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l343_c20_0ed8_ref_toks_0 : uint12_t_4;
 variable VAR_CONST_REF_RD_uint12_t_uint12_t_4_0_d41d_uxn_c_l282_l304_l325_DUPLICATE_a223_return_output : unsigned(11 downto 0);
 variable VAR_CONST_REF_RD_uint12_t_uint12_t_4_1_d41d_uxn_c_l287_l329_l309_DUPLICATE_e195_return_output : unsigned(11 downto 0);
 variable VAR_CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_uxn_c_l293_l315_l334_l332_DUPLICATE_fb71_return_output : unsigned(11 downto 0);
 variable VAR_CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_uxn_c_l298_l338_l320_l332_DUPLICATE_562b_return_output : unsigned(11 downto 0);
 variable VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l324_l333_DUPLICATE_cab8_return_output : unsigned(11 downto 0);
 variable VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l328_l337_DUPLICATE_1983_return_output : unsigned(11 downto 0);
 -- State registers comb logic variables
variable REG_VAR_color : uint12_t_4;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_color := color;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_c_l332_c12_0bb3_right := to_unsigned(13, 4);
     VAR_BIN_OP_AND_uxn_c_l293_c4_00b7_right := to_unsigned(255, 12);
     VAR_BIN_OP_AND_uxn_c_l282_c4_3160_right := to_unsigned(255, 12);
     VAR_BIN_OP_AND_uxn_c_l309_c4_55f9_right := to_unsigned(3855, 12);
     VAR_BIN_OP_EQ_uxn_c_l279_c7_2e6d_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_c_l323_c12_4de9_right := to_unsigned(12, 4);
     VAR_BIN_OP_EQ_uxn_c_l271_c30_df75_right := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_c_l287_c4_e028_right := to_unsigned(255, 12);
     VAR_MUX_uxn_c_l271_c30_1be7_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_c_l334_c4_ae5f_right := to_unsigned(4080, 12);
     VAR_MUX_uxn_c_l271_c30_1be7_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l290_c12_d197_right := to_unsigned(9, 4);
     VAR_BIN_OP_AND_uxn_c_l338_c4_bb09_right := to_unsigned(4080, 12);
     VAR_BIN_OP_EQ_uxn_c_l312_c12_c3b6_right := to_unsigned(11, 4);
     VAR_BIN_OP_EQ_uxn_c_l301_c12_54ae_right := to_unsigned(10, 4);
     VAR_BIN_OP_AND_uxn_c_l315_c4_a82d_right := to_unsigned(3855, 12);
     VAR_BIN_OP_AND_uxn_c_l304_c4_9f49_right := to_unsigned(3855, 12);
     VAR_BIN_OP_AND_uxn_c_l320_c4_7544_right := to_unsigned(3855, 12);
     VAR_BIN_OP_AND_uxn_c_l329_c4_f024_right := to_unsigned(4080, 12);
     VAR_BIN_OP_AND_uxn_c_l298_c4_1d23_right := to_unsigned(255, 12);
     VAR_BIN_OP_AND_uxn_c_l325_c4_8eb5_right := to_unsigned(4080, 12);

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
     VAR_color_MUX_uxn_c_l273_c2_65b1_iffalse := color;
     VAR_CONST_SR_4_uxn_c_l271_c30_11e1_x := VAR_device_ram_address;
     VAR_CONST_SR_4_uxn_c_l276_c35_0bc1_x := VAR_device_ram_value;
     VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l343_c20_0ed8_var_dim_0 := VAR_gpu_step_color;
     VAR_BIN_OP_AND_uxn_c_l273_c6_ce52_left := VAR_is_device_ram_write;
     -- CONST_REF_RD_uint12_t_uint12_t_4_1_d41d_uxn_c_l287_l329_l309_DUPLICATE_e195 LATENCY=0
     VAR_CONST_REF_RD_uint12_t_uint12_t_4_1_d41d_uxn_c_l287_l329_l309_DUPLICATE_e195_return_output := color(1);

     -- CONST_SR_4[uxn_c_l271_c30_11e1] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_c_l271_c30_11e1_x <= VAR_CONST_SR_4_uxn_c_l271_c30_11e1_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_c_l271_c30_11e1_return_output := CONST_SR_4_uxn_c_l271_c30_11e1_return_output;

     -- CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_uxn_c_l298_l338_l320_l332_DUPLICATE_562b LATENCY=0
     VAR_CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_uxn_c_l298_l338_l320_l332_DUPLICATE_562b_return_output := color(3);

     -- CONST_REF_RD_uint12_t_uint12_t_4_0_d41d_uxn_c_l282_l304_l325_DUPLICATE_a223 LATENCY=0
     VAR_CONST_REF_RD_uint12_t_uint12_t_4_0_d41d_uxn_c_l282_l304_l325_DUPLICATE_a223_return_output := color(0);

     -- CAST_TO_uint4_t[uxn_c_l277_c25_1c76] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_c_l277_c25_1c76_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_device_ram_value);

     -- CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_uxn_c_l293_l315_l334_l332_DUPLICATE_fb71 LATENCY=0
     VAR_CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_uxn_c_l293_l315_l334_l332_DUPLICATE_fb71_return_output := color(2);

     -- CONST_SR_4[uxn_c_l276_c35_0bc1] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_c_l276_c35_0bc1_x <= VAR_CONST_SR_4_uxn_c_l276_c35_0bc1_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_c_l276_c35_0bc1_return_output := CONST_SR_4_uxn_c_l276_c35_0bc1_return_output;

     -- CAST_TO_uint4_t[uxn_c_l275_c22_4ca6] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_c_l275_c22_4ca6_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_device_ram_address);

     -- Submodule level 1
     VAR_BIN_OP_EQ_uxn_c_l279_c7_2e6d_left := VAR_CAST_TO_uint4_t_uxn_c_l275_c22_4ca6_return_output;
     VAR_BIN_OP_EQ_uxn_c_l290_c12_d197_left := VAR_CAST_TO_uint4_t_uxn_c_l275_c22_4ca6_return_output;
     VAR_BIN_OP_EQ_uxn_c_l301_c12_54ae_left := VAR_CAST_TO_uint4_t_uxn_c_l275_c22_4ca6_return_output;
     VAR_BIN_OP_EQ_uxn_c_l312_c12_c3b6_left := VAR_CAST_TO_uint4_t_uxn_c_l275_c22_4ca6_return_output;
     VAR_BIN_OP_EQ_uxn_c_l323_c12_4de9_left := VAR_CAST_TO_uint4_t_uxn_c_l275_c22_4ca6_return_output;
     VAR_BIN_OP_EQ_uxn_c_l332_c12_0bb3_left := VAR_CAST_TO_uint4_t_uxn_c_l275_c22_4ca6_return_output;
     VAR_color_cmp_1_uxn_c_l277_c11_41ea_0 := VAR_CAST_TO_uint4_t_uxn_c_l277_c25_1c76_return_output;
     VAR_BIN_OP_AND_uxn_c_l282_c4_3160_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_0_d41d_uxn_c_l282_l304_l325_DUPLICATE_a223_return_output;
     VAR_BIN_OP_AND_uxn_c_l304_c4_9f49_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_0_d41d_uxn_c_l282_l304_l325_DUPLICATE_a223_return_output;
     VAR_BIN_OP_AND_uxn_c_l325_c4_8eb5_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_0_d41d_uxn_c_l282_l304_l325_DUPLICATE_a223_return_output;
     VAR_BIN_OP_AND_uxn_c_l287_c4_e028_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_1_d41d_uxn_c_l287_l329_l309_DUPLICATE_e195_return_output;
     VAR_BIN_OP_AND_uxn_c_l309_c4_55f9_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_1_d41d_uxn_c_l287_l329_l309_DUPLICATE_e195_return_output;
     VAR_BIN_OP_AND_uxn_c_l329_c4_f024_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_1_d41d_uxn_c_l287_l329_l309_DUPLICATE_e195_return_output;
     VAR_BIN_OP_AND_uxn_c_l293_c4_00b7_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_uxn_c_l293_l315_l334_l332_DUPLICATE_fb71_return_output;
     VAR_BIN_OP_AND_uxn_c_l315_c4_a82d_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_uxn_c_l293_l315_l334_l332_DUPLICATE_fb71_return_output;
     VAR_BIN_OP_AND_uxn_c_l334_c4_ae5f_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_uxn_c_l293_l315_l334_l332_DUPLICATE_fb71_return_output;
     VAR_color_2_MUX_uxn_c_l332_c8_3490_iffalse := VAR_CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_uxn_c_l293_l315_l334_l332_DUPLICATE_fb71_return_output;
     VAR_BIN_OP_AND_uxn_c_l298_c4_1d23_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_uxn_c_l298_l338_l320_l332_DUPLICATE_562b_return_output;
     VAR_BIN_OP_AND_uxn_c_l320_c4_7544_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_uxn_c_l298_l338_l320_l332_DUPLICATE_562b_return_output;
     VAR_BIN_OP_AND_uxn_c_l338_c4_bb09_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_uxn_c_l298_l338_l320_l332_DUPLICATE_562b_return_output;
     VAR_color_3_MUX_uxn_c_l332_c8_3490_iffalse := VAR_CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_uxn_c_l298_l338_l320_l332_DUPLICATE_562b_return_output;
     VAR_BIN_OP_EQ_uxn_c_l271_c30_df75_left := VAR_CONST_SR_4_uxn_c_l271_c30_11e1_return_output;
     VAR_tmp12_uxn_c_l285_c4_ea1f := resize(VAR_color_cmp_1_uxn_c_l277_c11_41ea_0, 12);
     VAR_tmp12_uxn_c_l296_c4_6b97 := resize(VAR_color_cmp_1_uxn_c_l277_c11_41ea_0, 12);
     VAR_tmp12_uxn_c_l307_c4_5082 := resize(VAR_color_cmp_1_uxn_c_l277_c11_41ea_0, 12);
     VAR_tmp12_uxn_c_l318_c4_7306 := resize(VAR_color_cmp_1_uxn_c_l277_c11_41ea_0, 12);
     VAR_CONST_SL_8_uxn_c_l286_c4_dac2_x := VAR_tmp12_uxn_c_l285_c4_ea1f;
     VAR_CONST_SL_8_uxn_c_l297_c4_84ff_x := VAR_tmp12_uxn_c_l296_c4_6b97;
     VAR_CONST_SL_4_uxn_c_l308_c4_ba82_x := VAR_tmp12_uxn_c_l307_c4_5082;
     VAR_CONST_SL_4_uxn_c_l319_c4_d266_x := VAR_tmp12_uxn_c_l318_c4_7306;
     -- CAST_TO_uint4_t[uxn_c_l276_c25_8b43] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_c_l276_c25_8b43_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_CONST_SR_4_uxn_c_l276_c35_0bc1_return_output);

     -- BIN_OP_EQ[uxn_c_l290_c12_d197] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l290_c12_d197_left <= VAR_BIN_OP_EQ_uxn_c_l290_c12_d197_left;
     BIN_OP_EQ_uxn_c_l290_c12_d197_right <= VAR_BIN_OP_EQ_uxn_c_l290_c12_d197_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l290_c12_d197_return_output := BIN_OP_EQ_uxn_c_l290_c12_d197_return_output;

     -- CONST_SL_8[uxn_c_l286_c4_dac2] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l286_c4_dac2_x <= VAR_CONST_SL_8_uxn_c_l286_c4_dac2_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l286_c4_dac2_return_output := CONST_SL_8_uxn_c_l286_c4_dac2_return_output;

     -- BIN_OP_AND[uxn_c_l293_c4_00b7] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l293_c4_00b7_left <= VAR_BIN_OP_AND_uxn_c_l293_c4_00b7_left;
     BIN_OP_AND_uxn_c_l293_c4_00b7_right <= VAR_BIN_OP_AND_uxn_c_l293_c4_00b7_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l293_c4_00b7_return_output := BIN_OP_AND_uxn_c_l293_c4_00b7_return_output;

     -- BIN_OP_AND[uxn_c_l282_c4_3160] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l282_c4_3160_left <= VAR_BIN_OP_AND_uxn_c_l282_c4_3160_left;
     BIN_OP_AND_uxn_c_l282_c4_3160_right <= VAR_BIN_OP_AND_uxn_c_l282_c4_3160_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l282_c4_3160_return_output := BIN_OP_AND_uxn_c_l282_c4_3160_return_output;

     -- BIN_OP_EQ[uxn_c_l271_c30_df75] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l271_c30_df75_left <= VAR_BIN_OP_EQ_uxn_c_l271_c30_df75_left;
     BIN_OP_EQ_uxn_c_l271_c30_df75_right <= VAR_BIN_OP_EQ_uxn_c_l271_c30_df75_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l271_c30_df75_return_output := BIN_OP_EQ_uxn_c_l271_c30_df75_return_output;

     -- BIN_OP_AND[uxn_c_l304_c4_9f49] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l304_c4_9f49_left <= VAR_BIN_OP_AND_uxn_c_l304_c4_9f49_left;
     BIN_OP_AND_uxn_c_l304_c4_9f49_right <= VAR_BIN_OP_AND_uxn_c_l304_c4_9f49_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l304_c4_9f49_return_output := BIN_OP_AND_uxn_c_l304_c4_9f49_return_output;

     -- BIN_OP_AND[uxn_c_l320_c4_7544] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l320_c4_7544_left <= VAR_BIN_OP_AND_uxn_c_l320_c4_7544_left;
     BIN_OP_AND_uxn_c_l320_c4_7544_right <= VAR_BIN_OP_AND_uxn_c_l320_c4_7544_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l320_c4_7544_return_output := BIN_OP_AND_uxn_c_l320_c4_7544_return_output;

     -- CAST_TO_uint12_t_uint4_t_uxn_c_l328_l337_DUPLICATE_1983 LATENCY=0
     VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l328_l337_DUPLICATE_1983_return_output := CAST_TO_uint12_t_uint4_t(
     VAR_color_cmp_1_uxn_c_l277_c11_41ea_0);

     -- BIN_OP_EQ[uxn_c_l323_c12_4de9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l323_c12_4de9_left <= VAR_BIN_OP_EQ_uxn_c_l323_c12_4de9_left;
     BIN_OP_EQ_uxn_c_l323_c12_4de9_right <= VAR_BIN_OP_EQ_uxn_c_l323_c12_4de9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l323_c12_4de9_return_output := BIN_OP_EQ_uxn_c_l323_c12_4de9_return_output;

     -- BIN_OP_AND[uxn_c_l315_c4_a82d] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l315_c4_a82d_left <= VAR_BIN_OP_AND_uxn_c_l315_c4_a82d_left;
     BIN_OP_AND_uxn_c_l315_c4_a82d_right <= VAR_BIN_OP_AND_uxn_c_l315_c4_a82d_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l315_c4_a82d_return_output := BIN_OP_AND_uxn_c_l315_c4_a82d_return_output;

     -- BIN_OP_AND[uxn_c_l325_c4_8eb5] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l325_c4_8eb5_left <= VAR_BIN_OP_AND_uxn_c_l325_c4_8eb5_left;
     BIN_OP_AND_uxn_c_l325_c4_8eb5_right <= VAR_BIN_OP_AND_uxn_c_l325_c4_8eb5_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l325_c4_8eb5_return_output := BIN_OP_AND_uxn_c_l325_c4_8eb5_return_output;

     -- BIN_OP_AND[uxn_c_l329_c4_f024] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l329_c4_f024_left <= VAR_BIN_OP_AND_uxn_c_l329_c4_f024_left;
     BIN_OP_AND_uxn_c_l329_c4_f024_right <= VAR_BIN_OP_AND_uxn_c_l329_c4_f024_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l329_c4_f024_return_output := BIN_OP_AND_uxn_c_l329_c4_f024_return_output;

     -- BIN_OP_AND[uxn_c_l309_c4_55f9] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l309_c4_55f9_left <= VAR_BIN_OP_AND_uxn_c_l309_c4_55f9_left;
     BIN_OP_AND_uxn_c_l309_c4_55f9_right <= VAR_BIN_OP_AND_uxn_c_l309_c4_55f9_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l309_c4_55f9_return_output := BIN_OP_AND_uxn_c_l309_c4_55f9_return_output;

     -- CONST_SL_4[uxn_c_l308_c4_ba82] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_c_l308_c4_ba82_x <= VAR_CONST_SL_4_uxn_c_l308_c4_ba82_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_c_l308_c4_ba82_return_output := CONST_SL_4_uxn_c_l308_c4_ba82_return_output;

     -- BIN_OP_AND[uxn_c_l334_c4_ae5f] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l334_c4_ae5f_left <= VAR_BIN_OP_AND_uxn_c_l334_c4_ae5f_left;
     BIN_OP_AND_uxn_c_l334_c4_ae5f_right <= VAR_BIN_OP_AND_uxn_c_l334_c4_ae5f_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l334_c4_ae5f_return_output := BIN_OP_AND_uxn_c_l334_c4_ae5f_return_output;

     -- BIN_OP_EQ[uxn_c_l279_c7_2e6d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l279_c7_2e6d_left <= VAR_BIN_OP_EQ_uxn_c_l279_c7_2e6d_left;
     BIN_OP_EQ_uxn_c_l279_c7_2e6d_right <= VAR_BIN_OP_EQ_uxn_c_l279_c7_2e6d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l279_c7_2e6d_return_output := BIN_OP_EQ_uxn_c_l279_c7_2e6d_return_output;

     -- CONST_SL_4[uxn_c_l319_c4_d266] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_c_l319_c4_d266_x <= VAR_CONST_SL_4_uxn_c_l319_c4_d266_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_c_l319_c4_d266_return_output := CONST_SL_4_uxn_c_l319_c4_d266_return_output;

     -- BIN_OP_EQ[uxn_c_l332_c12_0bb3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l332_c12_0bb3_left <= VAR_BIN_OP_EQ_uxn_c_l332_c12_0bb3_left;
     BIN_OP_EQ_uxn_c_l332_c12_0bb3_right <= VAR_BIN_OP_EQ_uxn_c_l332_c12_0bb3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l332_c12_0bb3_return_output := BIN_OP_EQ_uxn_c_l332_c12_0bb3_return_output;

     -- BIN_OP_AND[uxn_c_l298_c4_1d23] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l298_c4_1d23_left <= VAR_BIN_OP_AND_uxn_c_l298_c4_1d23_left;
     BIN_OP_AND_uxn_c_l298_c4_1d23_right <= VAR_BIN_OP_AND_uxn_c_l298_c4_1d23_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l298_c4_1d23_return_output := BIN_OP_AND_uxn_c_l298_c4_1d23_return_output;

     -- BIN_OP_AND[uxn_c_l287_c4_e028] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l287_c4_e028_left <= VAR_BIN_OP_AND_uxn_c_l287_c4_e028_left;
     BIN_OP_AND_uxn_c_l287_c4_e028_right <= VAR_BIN_OP_AND_uxn_c_l287_c4_e028_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l287_c4_e028_return_output := BIN_OP_AND_uxn_c_l287_c4_e028_return_output;

     -- BIN_OP_AND[uxn_c_l338_c4_bb09] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l338_c4_bb09_left <= VAR_BIN_OP_AND_uxn_c_l338_c4_bb09_left;
     BIN_OP_AND_uxn_c_l338_c4_bb09_right <= VAR_BIN_OP_AND_uxn_c_l338_c4_bb09_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l338_c4_bb09_return_output := BIN_OP_AND_uxn_c_l338_c4_bb09_return_output;

     -- CONST_SL_8[uxn_c_l297_c4_84ff] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l297_c4_84ff_x <= VAR_CONST_SL_8_uxn_c_l297_c4_84ff_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l297_c4_84ff_return_output := CONST_SL_8_uxn_c_l297_c4_84ff_return_output;

     -- BIN_OP_EQ[uxn_c_l312_c12_c3b6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l312_c12_c3b6_left <= VAR_BIN_OP_EQ_uxn_c_l312_c12_c3b6_left;
     BIN_OP_EQ_uxn_c_l312_c12_c3b6_right <= VAR_BIN_OP_EQ_uxn_c_l312_c12_c3b6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l312_c12_c3b6_return_output := BIN_OP_EQ_uxn_c_l312_c12_c3b6_return_output;

     -- BIN_OP_EQ[uxn_c_l301_c12_54ae] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l301_c12_54ae_left <= VAR_BIN_OP_EQ_uxn_c_l301_c12_54ae_left;
     BIN_OP_EQ_uxn_c_l301_c12_54ae_right <= VAR_BIN_OP_EQ_uxn_c_l301_c12_54ae_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l301_c12_54ae_return_output := BIN_OP_EQ_uxn_c_l301_c12_54ae_return_output;

     -- Submodule level 2
     VAR_BIN_OP_OR_uxn_c_l283_c4_fd61_left := VAR_BIN_OP_AND_uxn_c_l282_c4_3160_return_output;
     VAR_BIN_OP_OR_uxn_c_l288_c4_5b4f_left := VAR_BIN_OP_AND_uxn_c_l287_c4_e028_return_output;
     VAR_BIN_OP_OR_uxn_c_l294_c4_9c8b_left := VAR_BIN_OP_AND_uxn_c_l293_c4_00b7_return_output;
     VAR_BIN_OP_OR_uxn_c_l299_c4_1b8b_left := VAR_BIN_OP_AND_uxn_c_l298_c4_1d23_return_output;
     VAR_BIN_OP_OR_uxn_c_l305_c4_6566_left := VAR_BIN_OP_AND_uxn_c_l304_c4_9f49_return_output;
     VAR_BIN_OP_OR_uxn_c_l310_c4_26ac_left := VAR_BIN_OP_AND_uxn_c_l309_c4_55f9_return_output;
     VAR_BIN_OP_OR_uxn_c_l316_c4_71de_left := VAR_BIN_OP_AND_uxn_c_l315_c4_a82d_return_output;
     VAR_BIN_OP_OR_uxn_c_l321_c4_9c9e_left := VAR_BIN_OP_AND_uxn_c_l320_c4_7544_return_output;
     VAR_BIN_OP_OR_uxn_c_l326_c4_75bc_left := VAR_BIN_OP_AND_uxn_c_l325_c4_8eb5_return_output;
     VAR_BIN_OP_OR_uxn_c_l330_c4_0d2d_left := VAR_BIN_OP_AND_uxn_c_l329_c4_f024_return_output;
     VAR_BIN_OP_OR_uxn_c_l335_c4_7e3e_left := VAR_BIN_OP_AND_uxn_c_l334_c4_ae5f_return_output;
     VAR_BIN_OP_OR_uxn_c_l339_c4_435a_left := VAR_BIN_OP_AND_uxn_c_l338_c4_bb09_return_output;
     VAR_MUX_uxn_c_l271_c30_1be7_cond := VAR_BIN_OP_EQ_uxn_c_l271_c30_df75_return_output;
     VAR_color_MUX_uxn_c_l279_c3_a9f5_cond := VAR_BIN_OP_EQ_uxn_c_l279_c7_2e6d_return_output;
     VAR_color_MUX_uxn_c_l290_c8_033a_cond := VAR_BIN_OP_EQ_uxn_c_l290_c12_d197_return_output;
     VAR_color_MUX_uxn_c_l301_c8_5ae9_cond := VAR_BIN_OP_EQ_uxn_c_l301_c12_54ae_return_output;
     VAR_color_MUX_uxn_c_l312_c8_aaba_cond := VAR_BIN_OP_EQ_uxn_c_l312_c12_c3b6_return_output;
     VAR_color_MUX_uxn_c_l323_c8_dc37_cond := VAR_BIN_OP_EQ_uxn_c_l323_c12_4de9_return_output;
     VAR_color_2_MUX_uxn_c_l332_c8_3490_cond := VAR_BIN_OP_EQ_uxn_c_l332_c12_0bb3_return_output;
     VAR_color_3_MUX_uxn_c_l332_c8_3490_cond := VAR_BIN_OP_EQ_uxn_c_l332_c12_0bb3_return_output;
     VAR_BIN_OP_OR_uxn_c_l330_c4_0d2d_right := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l328_l337_DUPLICATE_1983_return_output;
     VAR_BIN_OP_OR_uxn_c_l339_c4_435a_right := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l328_l337_DUPLICATE_1983_return_output;
     VAR_color_cmp_0_uxn_c_l276_c11_40e6_0 := VAR_CAST_TO_uint4_t_uxn_c_l276_c25_8b43_return_output;
     VAR_BIN_OP_OR_uxn_c_l310_c4_26ac_right := VAR_CONST_SL_4_uxn_c_l308_c4_ba82_return_output;
     VAR_BIN_OP_OR_uxn_c_l321_c4_9c9e_right := VAR_CONST_SL_4_uxn_c_l319_c4_d266_return_output;
     VAR_BIN_OP_OR_uxn_c_l288_c4_5b4f_right := VAR_CONST_SL_8_uxn_c_l286_c4_dac2_return_output;
     VAR_BIN_OP_OR_uxn_c_l299_c4_1b8b_right := VAR_CONST_SL_8_uxn_c_l297_c4_84ff_return_output;
     VAR_tmp12_uxn_c_l280_c4_c626 := resize(VAR_color_cmp_0_uxn_c_l276_c11_40e6_0, 12);
     VAR_tmp12_uxn_c_l291_c4_1a8e := resize(VAR_color_cmp_0_uxn_c_l276_c11_40e6_0, 12);
     VAR_tmp12_uxn_c_l302_c4_61ff := resize(VAR_color_cmp_0_uxn_c_l276_c11_40e6_0, 12);
     VAR_tmp12_uxn_c_l313_c4_aaa2 := resize(VAR_color_cmp_0_uxn_c_l276_c11_40e6_0, 12);
     VAR_CONST_SL_8_uxn_c_l281_c4_2305_x := VAR_tmp12_uxn_c_l280_c4_c626;
     VAR_CONST_SL_8_uxn_c_l292_c4_5e40_x := VAR_tmp12_uxn_c_l291_c4_1a8e;
     VAR_CONST_SL_4_uxn_c_l303_c4_60fb_x := VAR_tmp12_uxn_c_l302_c4_61ff;
     VAR_CONST_SL_4_uxn_c_l314_c4_f16c_x := VAR_tmp12_uxn_c_l313_c4_aaa2;
     -- BIN_OP_OR[uxn_c_l339_c4_435a] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l339_c4_435a_left <= VAR_BIN_OP_OR_uxn_c_l339_c4_435a_left;
     BIN_OP_OR_uxn_c_l339_c4_435a_right <= VAR_BIN_OP_OR_uxn_c_l339_c4_435a_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l339_c4_435a_return_output := BIN_OP_OR_uxn_c_l339_c4_435a_return_output;

     -- CONST_SL_8[uxn_c_l281_c4_2305] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l281_c4_2305_x <= VAR_CONST_SL_8_uxn_c_l281_c4_2305_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l281_c4_2305_return_output := CONST_SL_8_uxn_c_l281_c4_2305_return_output;

     -- BIN_OP_OR[uxn_c_l288_c4_5b4f] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l288_c4_5b4f_left <= VAR_BIN_OP_OR_uxn_c_l288_c4_5b4f_left;
     BIN_OP_OR_uxn_c_l288_c4_5b4f_right <= VAR_BIN_OP_OR_uxn_c_l288_c4_5b4f_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l288_c4_5b4f_return_output := BIN_OP_OR_uxn_c_l288_c4_5b4f_return_output;

     -- BIN_OP_OR[uxn_c_l299_c4_1b8b] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l299_c4_1b8b_left <= VAR_BIN_OP_OR_uxn_c_l299_c4_1b8b_left;
     BIN_OP_OR_uxn_c_l299_c4_1b8b_right <= VAR_BIN_OP_OR_uxn_c_l299_c4_1b8b_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l299_c4_1b8b_return_output := BIN_OP_OR_uxn_c_l299_c4_1b8b_return_output;

     -- CONST_SL_4[uxn_c_l314_c4_f16c] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_c_l314_c4_f16c_x <= VAR_CONST_SL_4_uxn_c_l314_c4_f16c_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_c_l314_c4_f16c_return_output := CONST_SL_4_uxn_c_l314_c4_f16c_return_output;

     -- BIN_OP_OR[uxn_c_l330_c4_0d2d] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l330_c4_0d2d_left <= VAR_BIN_OP_OR_uxn_c_l330_c4_0d2d_left;
     BIN_OP_OR_uxn_c_l330_c4_0d2d_right <= VAR_BIN_OP_OR_uxn_c_l330_c4_0d2d_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l330_c4_0d2d_return_output := BIN_OP_OR_uxn_c_l330_c4_0d2d_return_output;

     -- MUX[uxn_c_l271_c30_1be7] LATENCY=0
     -- Inputs
     MUX_uxn_c_l271_c30_1be7_cond <= VAR_MUX_uxn_c_l271_c30_1be7_cond;
     MUX_uxn_c_l271_c30_1be7_iftrue <= VAR_MUX_uxn_c_l271_c30_1be7_iftrue;
     MUX_uxn_c_l271_c30_1be7_iffalse <= VAR_MUX_uxn_c_l271_c30_1be7_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l271_c30_1be7_return_output := MUX_uxn_c_l271_c30_1be7_return_output;

     -- CONST_SL_4[uxn_c_l303_c4_60fb] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_c_l303_c4_60fb_x <= VAR_CONST_SL_4_uxn_c_l303_c4_60fb_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_c_l303_c4_60fb_return_output := CONST_SL_4_uxn_c_l303_c4_60fb_return_output;

     -- BIN_OP_OR[uxn_c_l321_c4_9c9e] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l321_c4_9c9e_left <= VAR_BIN_OP_OR_uxn_c_l321_c4_9c9e_left;
     BIN_OP_OR_uxn_c_l321_c4_9c9e_right <= VAR_BIN_OP_OR_uxn_c_l321_c4_9c9e_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l321_c4_9c9e_return_output := BIN_OP_OR_uxn_c_l321_c4_9c9e_return_output;

     -- BIN_OP_OR[uxn_c_l310_c4_26ac] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l310_c4_26ac_left <= VAR_BIN_OP_OR_uxn_c_l310_c4_26ac_left;
     BIN_OP_OR_uxn_c_l310_c4_26ac_right <= VAR_BIN_OP_OR_uxn_c_l310_c4_26ac_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l310_c4_26ac_return_output := BIN_OP_OR_uxn_c_l310_c4_26ac_return_output;

     -- CAST_TO_uint12_t_uint4_t_uxn_c_l324_l333_DUPLICATE_cab8 LATENCY=0
     VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l324_l333_DUPLICATE_cab8_return_output := CAST_TO_uint12_t_uint4_t(
     VAR_color_cmp_0_uxn_c_l276_c11_40e6_0);

     -- CONST_SL_8[uxn_c_l292_c4_5e40] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l292_c4_5e40_x <= VAR_CONST_SL_8_uxn_c_l292_c4_5e40_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l292_c4_5e40_return_output := CONST_SL_8_uxn_c_l292_c4_5e40_return_output;

     -- Submodule level 3
     VAR_color_3_MUX_uxn_c_l332_c8_3490_iftrue := VAR_BIN_OP_OR_uxn_c_l339_c4_435a_return_output;
     VAR_BIN_OP_OR_uxn_c_l326_c4_75bc_right := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l324_l333_DUPLICATE_cab8_return_output;
     VAR_BIN_OP_OR_uxn_c_l335_c4_7e3e_right := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l324_l333_DUPLICATE_cab8_return_output;
     VAR_BIN_OP_OR_uxn_c_l305_c4_6566_right := VAR_CONST_SL_4_uxn_c_l303_c4_60fb_return_output;
     VAR_BIN_OP_OR_uxn_c_l316_c4_71de_right := VAR_CONST_SL_4_uxn_c_l314_c4_f16c_return_output;
     VAR_BIN_OP_OR_uxn_c_l283_c4_fd61_right := VAR_CONST_SL_8_uxn_c_l281_c4_2305_return_output;
     VAR_BIN_OP_OR_uxn_c_l294_c4_9c8b_right := VAR_CONST_SL_8_uxn_c_l292_c4_5e40_return_output;
     VAR_BIN_OP_AND_uxn_c_l273_c6_ce52_right := VAR_MUX_uxn_c_l271_c30_1be7_return_output;
     -- BIN_OP_OR[uxn_c_l294_c4_9c8b] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l294_c4_9c8b_left <= VAR_BIN_OP_OR_uxn_c_l294_c4_9c8b_left;
     BIN_OP_OR_uxn_c_l294_c4_9c8b_right <= VAR_BIN_OP_OR_uxn_c_l294_c4_9c8b_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l294_c4_9c8b_return_output := BIN_OP_OR_uxn_c_l294_c4_9c8b_return_output;

     -- BIN_OP_OR[uxn_c_l335_c4_7e3e] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l335_c4_7e3e_left <= VAR_BIN_OP_OR_uxn_c_l335_c4_7e3e_left;
     BIN_OP_OR_uxn_c_l335_c4_7e3e_right <= VAR_BIN_OP_OR_uxn_c_l335_c4_7e3e_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l335_c4_7e3e_return_output := BIN_OP_OR_uxn_c_l335_c4_7e3e_return_output;

     -- BIN_OP_OR[uxn_c_l326_c4_75bc] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l326_c4_75bc_left <= VAR_BIN_OP_OR_uxn_c_l326_c4_75bc_left;
     BIN_OP_OR_uxn_c_l326_c4_75bc_right <= VAR_BIN_OP_OR_uxn_c_l326_c4_75bc_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l326_c4_75bc_return_output := BIN_OP_OR_uxn_c_l326_c4_75bc_return_output;

     -- color_3_MUX[uxn_c_l332_c8_3490] LATENCY=0
     -- Inputs
     color_3_MUX_uxn_c_l332_c8_3490_cond <= VAR_color_3_MUX_uxn_c_l332_c8_3490_cond;
     color_3_MUX_uxn_c_l332_c8_3490_iftrue <= VAR_color_3_MUX_uxn_c_l332_c8_3490_iftrue;
     color_3_MUX_uxn_c_l332_c8_3490_iffalse <= VAR_color_3_MUX_uxn_c_l332_c8_3490_iffalse;
     -- Outputs
     VAR_color_3_MUX_uxn_c_l332_c8_3490_return_output := color_3_MUX_uxn_c_l332_c8_3490_return_output;

     -- BIN_OP_OR[uxn_c_l316_c4_71de] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l316_c4_71de_left <= VAR_BIN_OP_OR_uxn_c_l316_c4_71de_left;
     BIN_OP_OR_uxn_c_l316_c4_71de_right <= VAR_BIN_OP_OR_uxn_c_l316_c4_71de_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l316_c4_71de_return_output := BIN_OP_OR_uxn_c_l316_c4_71de_return_output;

     -- BIN_OP_AND[uxn_c_l273_c6_ce52] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l273_c6_ce52_left <= VAR_BIN_OP_AND_uxn_c_l273_c6_ce52_left;
     BIN_OP_AND_uxn_c_l273_c6_ce52_right <= VAR_BIN_OP_AND_uxn_c_l273_c6_ce52_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l273_c6_ce52_return_output := BIN_OP_AND_uxn_c_l273_c6_ce52_return_output;

     -- BIN_OP_OR[uxn_c_l283_c4_fd61] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l283_c4_fd61_left <= VAR_BIN_OP_OR_uxn_c_l283_c4_fd61_left;
     BIN_OP_OR_uxn_c_l283_c4_fd61_right <= VAR_BIN_OP_OR_uxn_c_l283_c4_fd61_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l283_c4_fd61_return_output := BIN_OP_OR_uxn_c_l283_c4_fd61_return_output;

     -- BIN_OP_OR[uxn_c_l305_c4_6566] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l305_c4_6566_left <= VAR_BIN_OP_OR_uxn_c_l305_c4_6566_left;
     BIN_OP_OR_uxn_c_l305_c4_6566_right <= VAR_BIN_OP_OR_uxn_c_l305_c4_6566_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l305_c4_6566_return_output := BIN_OP_OR_uxn_c_l305_c4_6566_return_output;

     -- Submodule level 4
     VAR_color_MUX_uxn_c_l273_c2_65b1_cond := VAR_BIN_OP_AND_uxn_c_l273_c6_ce52_return_output;
     VAR_color_2_MUX_uxn_c_l332_c8_3490_iftrue := VAR_BIN_OP_OR_uxn_c_l335_c4_7e3e_return_output;
     -- color_2_MUX[uxn_c_l332_c8_3490] LATENCY=0
     -- Inputs
     color_2_MUX_uxn_c_l332_c8_3490_cond <= VAR_color_2_MUX_uxn_c_l332_c8_3490_cond;
     color_2_MUX_uxn_c_l332_c8_3490_iftrue <= VAR_color_2_MUX_uxn_c_l332_c8_3490_iftrue;
     color_2_MUX_uxn_c_l332_c8_3490_iffalse <= VAR_color_2_MUX_uxn_c_l332_c8_3490_iffalse;
     -- Outputs
     VAR_color_2_MUX_uxn_c_l332_c8_3490_return_output := color_2_MUX_uxn_c_l332_c8_3490_return_output;

     -- color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5[uxn_c_l290_c8_033a] LATENCY=0
     VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l290_c8_033a_return_output := CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5(
     color,
     VAR_BIN_OP_OR_uxn_c_l294_c4_9c8b_return_output,
     VAR_BIN_OP_OR_uxn_c_l299_c4_1b8b_return_output);

     -- color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8[uxn_c_l301_c8_5ae9] LATENCY=0
     VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l301_c8_5ae9_return_output := CONST_REF_RD_uint12_t_4_uint12_t_4_90b8(
     color,
     VAR_BIN_OP_OR_uxn_c_l305_c4_6566_return_output,
     VAR_BIN_OP_OR_uxn_c_l310_c4_26ac_return_output);

     -- color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5[uxn_c_l312_c8_aaba] LATENCY=0
     VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l312_c8_aaba_return_output := CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5(
     color,
     VAR_BIN_OP_OR_uxn_c_l316_c4_71de_return_output,
     VAR_BIN_OP_OR_uxn_c_l321_c4_9c9e_return_output);

     -- color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8[uxn_c_l279_c3_a9f5] LATENCY=0
     VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l279_c3_a9f5_return_output := CONST_REF_RD_uint12_t_4_uint12_t_4_90b8(
     color,
     VAR_BIN_OP_OR_uxn_c_l283_c4_fd61_return_output,
     VAR_BIN_OP_OR_uxn_c_l288_c4_5b4f_return_output);

     -- color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8[uxn_c_l323_c8_dc37] LATENCY=0
     VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l323_c8_dc37_return_output := CONST_REF_RD_uint12_t_4_uint12_t_4_90b8(
     color,
     VAR_BIN_OP_OR_uxn_c_l326_c4_75bc_return_output,
     VAR_BIN_OP_OR_uxn_c_l330_c4_0d2d_return_output);

     -- Submodule level 5
     VAR_color_MUX_uxn_c_l279_c3_a9f5_iftrue := VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l279_c3_a9f5_return_output;
     VAR_color_MUX_uxn_c_l301_c8_5ae9_iftrue := VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l301_c8_5ae9_return_output;
     VAR_color_MUX_uxn_c_l323_c8_dc37_iftrue := VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l323_c8_dc37_return_output;
     VAR_color_MUX_uxn_c_l290_c8_033a_iftrue := VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l290_c8_033a_return_output;
     VAR_color_MUX_uxn_c_l312_c8_aaba_iftrue := VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l312_c8_aaba_return_output;
     -- color_FALSE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5[uxn_c_l323_c8_dc37] LATENCY=0
     VAR_color_FALSE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l323_c8_dc37_return_output := CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5(
     color,
     VAR_color_2_MUX_uxn_c_l332_c8_3490_return_output,
     VAR_color_3_MUX_uxn_c_l332_c8_3490_return_output);

     -- Submodule level 6
     VAR_color_MUX_uxn_c_l323_c8_dc37_iffalse := VAR_color_FALSE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l323_c8_dc37_return_output;
     -- color_MUX[uxn_c_l323_c8_dc37] LATENCY=0
     -- Inputs
     color_MUX_uxn_c_l323_c8_dc37_cond <= VAR_color_MUX_uxn_c_l323_c8_dc37_cond;
     color_MUX_uxn_c_l323_c8_dc37_iftrue <= VAR_color_MUX_uxn_c_l323_c8_dc37_iftrue;
     color_MUX_uxn_c_l323_c8_dc37_iffalse <= VAR_color_MUX_uxn_c_l323_c8_dc37_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_c_l323_c8_dc37_return_output := color_MUX_uxn_c_l323_c8_dc37_return_output;

     -- Submodule level 7
     VAR_color_MUX_uxn_c_l312_c8_aaba_iffalse := VAR_color_MUX_uxn_c_l323_c8_dc37_return_output;
     -- color_MUX[uxn_c_l312_c8_aaba] LATENCY=0
     -- Inputs
     color_MUX_uxn_c_l312_c8_aaba_cond <= VAR_color_MUX_uxn_c_l312_c8_aaba_cond;
     color_MUX_uxn_c_l312_c8_aaba_iftrue <= VAR_color_MUX_uxn_c_l312_c8_aaba_iftrue;
     color_MUX_uxn_c_l312_c8_aaba_iffalse <= VAR_color_MUX_uxn_c_l312_c8_aaba_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_c_l312_c8_aaba_return_output := color_MUX_uxn_c_l312_c8_aaba_return_output;

     -- Submodule level 8
     VAR_color_MUX_uxn_c_l301_c8_5ae9_iffalse := VAR_color_MUX_uxn_c_l312_c8_aaba_return_output;
     -- color_MUX[uxn_c_l301_c8_5ae9] LATENCY=0
     -- Inputs
     color_MUX_uxn_c_l301_c8_5ae9_cond <= VAR_color_MUX_uxn_c_l301_c8_5ae9_cond;
     color_MUX_uxn_c_l301_c8_5ae9_iftrue <= VAR_color_MUX_uxn_c_l301_c8_5ae9_iftrue;
     color_MUX_uxn_c_l301_c8_5ae9_iffalse <= VAR_color_MUX_uxn_c_l301_c8_5ae9_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_c_l301_c8_5ae9_return_output := color_MUX_uxn_c_l301_c8_5ae9_return_output;

     -- Submodule level 9
     VAR_color_MUX_uxn_c_l290_c8_033a_iffalse := VAR_color_MUX_uxn_c_l301_c8_5ae9_return_output;
     -- color_MUX[uxn_c_l290_c8_033a] LATENCY=0
     -- Inputs
     color_MUX_uxn_c_l290_c8_033a_cond <= VAR_color_MUX_uxn_c_l290_c8_033a_cond;
     color_MUX_uxn_c_l290_c8_033a_iftrue <= VAR_color_MUX_uxn_c_l290_c8_033a_iftrue;
     color_MUX_uxn_c_l290_c8_033a_iffalse <= VAR_color_MUX_uxn_c_l290_c8_033a_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_c_l290_c8_033a_return_output := color_MUX_uxn_c_l290_c8_033a_return_output;

     -- Submodule level 10
     VAR_color_MUX_uxn_c_l279_c3_a9f5_iffalse := VAR_color_MUX_uxn_c_l290_c8_033a_return_output;
     -- color_MUX[uxn_c_l279_c3_a9f5] LATENCY=0
     -- Inputs
     color_MUX_uxn_c_l279_c3_a9f5_cond <= VAR_color_MUX_uxn_c_l279_c3_a9f5_cond;
     color_MUX_uxn_c_l279_c3_a9f5_iftrue <= VAR_color_MUX_uxn_c_l279_c3_a9f5_iftrue;
     color_MUX_uxn_c_l279_c3_a9f5_iffalse <= VAR_color_MUX_uxn_c_l279_c3_a9f5_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_c_l279_c3_a9f5_return_output := color_MUX_uxn_c_l279_c3_a9f5_return_output;

     -- Submodule level 11
     VAR_color_MUX_uxn_c_l273_c2_65b1_iftrue := VAR_color_MUX_uxn_c_l279_c3_a9f5_return_output;
     -- color_MUX[uxn_c_l273_c2_65b1] LATENCY=0
     -- Inputs
     color_MUX_uxn_c_l273_c2_65b1_cond <= VAR_color_MUX_uxn_c_l273_c2_65b1_cond;
     color_MUX_uxn_c_l273_c2_65b1_iftrue <= VAR_color_MUX_uxn_c_l273_c2_65b1_iftrue;
     color_MUX_uxn_c_l273_c2_65b1_iffalse <= VAR_color_MUX_uxn_c_l273_c2_65b1_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_c_l273_c2_65b1_return_output := color_MUX_uxn_c_l273_c2_65b1_return_output;

     -- Submodule level 12
     VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l343_c20_0ed8_ref_toks_0 := VAR_color_MUX_uxn_c_l273_c2_65b1_return_output;
     REG_VAR_color := VAR_color_MUX_uxn_c_l273_c2_65b1_return_output;
     -- VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d[uxn_c_l343_c20_0ed8] LATENCY=0
     -- Inputs
     VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l343_c20_0ed8_ref_toks_0 <= VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l343_c20_0ed8_ref_toks_0;
     VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l343_c20_0ed8_var_dim_0 <= VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l343_c20_0ed8_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l343_c20_0ed8_return_output := VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l343_c20_0ed8_return_output;

     -- Submodule level 13
     VAR_result_uxn_c_l343_c11_05dc_0 := resize(VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l343_c20_0ed8_return_output, 16);
     VAR_return_output := VAR_result_uxn_c_l343_c11_05dc_0;
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
