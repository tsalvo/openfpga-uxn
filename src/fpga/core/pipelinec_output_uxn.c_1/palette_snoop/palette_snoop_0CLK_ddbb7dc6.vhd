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
-- CONST_SR_4[uxn_c_l199_c30_5be7]
signal CONST_SR_4_uxn_c_l199_c30_5be7_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_c_l199_c30_5be7_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_c_l199_c30_4877]
signal BIN_OP_EQ_uxn_c_l199_c30_4877_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l199_c30_4877_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l199_c30_4877_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l199_c30_8d1d]
signal MUX_uxn_c_l199_c30_8d1d_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l199_c30_8d1d_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l199_c30_8d1d_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l199_c30_8d1d_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l201_c6_6ac9]
signal BIN_OP_AND_uxn_c_l201_c6_6ac9_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l201_c6_6ac9_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l201_c6_6ac9_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_c_l201_c2_ad43]
signal color_MUX_uxn_c_l201_c2_ad43_cond : unsigned(0 downto 0);
signal color_MUX_uxn_c_l201_c2_ad43_iftrue : uint12_t_4;
signal color_MUX_uxn_c_l201_c2_ad43_iffalse : uint12_t_4;
signal color_MUX_uxn_c_l201_c2_ad43_return_output : uint12_t_4;

-- CONST_SR_4[uxn_c_l204_c35_3265]
signal CONST_SR_4_uxn_c_l204_c35_3265_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_c_l204_c35_3265_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_c_l207_c7_e463]
signal BIN_OP_EQ_uxn_c_l207_c7_e463_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l207_c7_e463_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l207_c7_e463_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_c_l207_c3_6f0d]
signal color_MUX_uxn_c_l207_c3_6f0d_cond : unsigned(0 downto 0);
signal color_MUX_uxn_c_l207_c3_6f0d_iftrue : uint12_t_4;
signal color_MUX_uxn_c_l207_c3_6f0d_iffalse : uint12_t_4;
signal color_MUX_uxn_c_l207_c3_6f0d_return_output : uint12_t_4;

-- CONST_SL_8[uxn_c_l209_c4_c1de]
signal CONST_SL_8_uxn_c_l209_c4_c1de_x : unsigned(11 downto 0);
signal CONST_SL_8_uxn_c_l209_c4_c1de_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l210_c4_d8d2]
signal BIN_OP_AND_uxn_c_l210_c4_d8d2_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l210_c4_d8d2_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l210_c4_d8d2_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l211_c4_4ded]
signal BIN_OP_OR_uxn_c_l211_c4_4ded_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l211_c4_4ded_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l211_c4_4ded_return_output : unsigned(11 downto 0);

-- CONST_SL_8[uxn_c_l214_c4_6e9e]
signal CONST_SL_8_uxn_c_l214_c4_6e9e_x : unsigned(11 downto 0);
signal CONST_SL_8_uxn_c_l214_c4_6e9e_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l215_c4_342b]
signal BIN_OP_AND_uxn_c_l215_c4_342b_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l215_c4_342b_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l215_c4_342b_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l216_c4_27f0]
signal BIN_OP_OR_uxn_c_l216_c4_27f0_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l216_c4_27f0_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l216_c4_27f0_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l218_c12_2782]
signal BIN_OP_EQ_uxn_c_l218_c12_2782_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l218_c12_2782_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l218_c12_2782_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_c_l218_c8_a7d5]
signal color_MUX_uxn_c_l218_c8_a7d5_cond : unsigned(0 downto 0);
signal color_MUX_uxn_c_l218_c8_a7d5_iftrue : uint12_t_4;
signal color_MUX_uxn_c_l218_c8_a7d5_iffalse : uint12_t_4;
signal color_MUX_uxn_c_l218_c8_a7d5_return_output : uint12_t_4;

-- CONST_SL_8[uxn_c_l220_c4_5b8a]
signal CONST_SL_8_uxn_c_l220_c4_5b8a_x : unsigned(11 downto 0);
signal CONST_SL_8_uxn_c_l220_c4_5b8a_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l221_c4_7e6a]
signal BIN_OP_AND_uxn_c_l221_c4_7e6a_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l221_c4_7e6a_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l221_c4_7e6a_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l222_c4_e1de]
signal BIN_OP_OR_uxn_c_l222_c4_e1de_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l222_c4_e1de_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l222_c4_e1de_return_output : unsigned(11 downto 0);

-- CONST_SL_8[uxn_c_l225_c4_9c6e]
signal CONST_SL_8_uxn_c_l225_c4_9c6e_x : unsigned(11 downto 0);
signal CONST_SL_8_uxn_c_l225_c4_9c6e_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l226_c4_6b20]
signal BIN_OP_AND_uxn_c_l226_c4_6b20_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l226_c4_6b20_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l226_c4_6b20_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l227_c4_84c4]
signal BIN_OP_OR_uxn_c_l227_c4_84c4_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l227_c4_84c4_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l227_c4_84c4_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l229_c12_1ba4]
signal BIN_OP_EQ_uxn_c_l229_c12_1ba4_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l229_c12_1ba4_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l229_c12_1ba4_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_c_l229_c8_c857]
signal color_MUX_uxn_c_l229_c8_c857_cond : unsigned(0 downto 0);
signal color_MUX_uxn_c_l229_c8_c857_iftrue : uint12_t_4;
signal color_MUX_uxn_c_l229_c8_c857_iffalse : uint12_t_4;
signal color_MUX_uxn_c_l229_c8_c857_return_output : uint12_t_4;

-- CONST_SL_4[uxn_c_l231_c4_9af9]
signal CONST_SL_4_uxn_c_l231_c4_9af9_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_c_l231_c4_9af9_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l232_c4_16e1]
signal BIN_OP_AND_uxn_c_l232_c4_16e1_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l232_c4_16e1_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l232_c4_16e1_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l233_c4_aae4]
signal BIN_OP_OR_uxn_c_l233_c4_aae4_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l233_c4_aae4_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l233_c4_aae4_return_output : unsigned(11 downto 0);

-- CONST_SL_4[uxn_c_l236_c4_7c72]
signal CONST_SL_4_uxn_c_l236_c4_7c72_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_c_l236_c4_7c72_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l237_c4_b5da]
signal BIN_OP_AND_uxn_c_l237_c4_b5da_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l237_c4_b5da_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l237_c4_b5da_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l238_c4_d5b5]
signal BIN_OP_OR_uxn_c_l238_c4_d5b5_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l238_c4_d5b5_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l238_c4_d5b5_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l240_c12_6690]
signal BIN_OP_EQ_uxn_c_l240_c12_6690_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l240_c12_6690_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l240_c12_6690_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_c_l240_c8_d4e5]
signal color_MUX_uxn_c_l240_c8_d4e5_cond : unsigned(0 downto 0);
signal color_MUX_uxn_c_l240_c8_d4e5_iftrue : uint12_t_4;
signal color_MUX_uxn_c_l240_c8_d4e5_iffalse : uint12_t_4;
signal color_MUX_uxn_c_l240_c8_d4e5_return_output : uint12_t_4;

-- CONST_SL_4[uxn_c_l242_c4_a9d2]
signal CONST_SL_4_uxn_c_l242_c4_a9d2_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_c_l242_c4_a9d2_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l243_c4_367c]
signal BIN_OP_AND_uxn_c_l243_c4_367c_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l243_c4_367c_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l243_c4_367c_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l244_c4_626a]
signal BIN_OP_OR_uxn_c_l244_c4_626a_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l244_c4_626a_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l244_c4_626a_return_output : unsigned(11 downto 0);

-- CONST_SL_4[uxn_c_l247_c4_2b01]
signal CONST_SL_4_uxn_c_l247_c4_2b01_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_c_l247_c4_2b01_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l248_c4_47b9]
signal BIN_OP_AND_uxn_c_l248_c4_47b9_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l248_c4_47b9_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l248_c4_47b9_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l249_c4_2249]
signal BIN_OP_OR_uxn_c_l249_c4_2249_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l249_c4_2249_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l249_c4_2249_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l251_c12_40da]
signal BIN_OP_EQ_uxn_c_l251_c12_40da_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l251_c12_40da_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l251_c12_40da_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_c_l251_c8_8e18]
signal color_MUX_uxn_c_l251_c8_8e18_cond : unsigned(0 downto 0);
signal color_MUX_uxn_c_l251_c8_8e18_iftrue : uint12_t_4;
signal color_MUX_uxn_c_l251_c8_8e18_iffalse : uint12_t_4;
signal color_MUX_uxn_c_l251_c8_8e18_return_output : uint12_t_4;

-- BIN_OP_AND[uxn_c_l253_c4_6f2d]
signal BIN_OP_AND_uxn_c_l253_c4_6f2d_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l253_c4_6f2d_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l253_c4_6f2d_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l254_c4_6a98]
signal BIN_OP_OR_uxn_c_l254_c4_6a98_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l254_c4_6a98_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l254_c4_6a98_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l257_c4_7ede]
signal BIN_OP_AND_uxn_c_l257_c4_7ede_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l257_c4_7ede_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l257_c4_7ede_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l258_c4_0e3c]
signal BIN_OP_OR_uxn_c_l258_c4_0e3c_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l258_c4_0e3c_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l258_c4_0e3c_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l260_c12_d16e]
signal BIN_OP_EQ_uxn_c_l260_c12_d16e_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l260_c12_d16e_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l260_c12_d16e_return_output : unsigned(0 downto 0);

-- color_3_MUX[uxn_c_l260_c8_93f8]
signal color_3_MUX_uxn_c_l260_c8_93f8_cond : unsigned(0 downto 0);
signal color_3_MUX_uxn_c_l260_c8_93f8_iftrue : unsigned(11 downto 0);
signal color_3_MUX_uxn_c_l260_c8_93f8_iffalse : unsigned(11 downto 0);
signal color_3_MUX_uxn_c_l260_c8_93f8_return_output : unsigned(11 downto 0);

-- color_2_MUX[uxn_c_l260_c8_93f8]
signal color_2_MUX_uxn_c_l260_c8_93f8_cond : unsigned(0 downto 0);
signal color_2_MUX_uxn_c_l260_c8_93f8_iftrue : unsigned(11 downto 0);
signal color_2_MUX_uxn_c_l260_c8_93f8_iffalse : unsigned(11 downto 0);
signal color_2_MUX_uxn_c_l260_c8_93f8_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l262_c4_62ea]
signal BIN_OP_AND_uxn_c_l262_c4_62ea_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l262_c4_62ea_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l262_c4_62ea_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l263_c4_1174]
signal BIN_OP_OR_uxn_c_l263_c4_1174_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l263_c4_1174_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l263_c4_1174_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l266_c4_9b4e]
signal BIN_OP_AND_uxn_c_l266_c4_9b4e_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l266_c4_9b4e_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l266_c4_9b4e_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l267_c4_3a33]
signal BIN_OP_OR_uxn_c_l267_c4_3a33_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l267_c4_3a33_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l267_c4_3a33_return_output : unsigned(11 downto 0);

-- VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d[uxn_c_l271_c20_53e2]
signal VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l271_c20_53e2_ref_toks_0 : uint12_t_4;
signal VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l271_c20_53e2_var_dim_0 : unsigned(1 downto 0);
signal VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l271_c20_53e2_return_output : unsigned(11 downto 0);

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
-- CONST_SR_4_uxn_c_l199_c30_5be7
CONST_SR_4_uxn_c_l199_c30_5be7 : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_c_l199_c30_5be7_x,
CONST_SR_4_uxn_c_l199_c30_5be7_return_output);

-- BIN_OP_EQ_uxn_c_l199_c30_4877
BIN_OP_EQ_uxn_c_l199_c30_4877 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l199_c30_4877_left,
BIN_OP_EQ_uxn_c_l199_c30_4877_right,
BIN_OP_EQ_uxn_c_l199_c30_4877_return_output);

-- MUX_uxn_c_l199_c30_8d1d
MUX_uxn_c_l199_c30_8d1d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l199_c30_8d1d_cond,
MUX_uxn_c_l199_c30_8d1d_iftrue,
MUX_uxn_c_l199_c30_8d1d_iffalse,
MUX_uxn_c_l199_c30_8d1d_return_output);

-- BIN_OP_AND_uxn_c_l201_c6_6ac9
BIN_OP_AND_uxn_c_l201_c6_6ac9 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l201_c6_6ac9_left,
BIN_OP_AND_uxn_c_l201_c6_6ac9_right,
BIN_OP_AND_uxn_c_l201_c6_6ac9_return_output);

-- color_MUX_uxn_c_l201_c2_ad43
color_MUX_uxn_c_l201_c2_ad43 : entity work.MUX_uint1_t_uint12_t_4_uint12_t_4_0CLK_de264c78 port map (
color_MUX_uxn_c_l201_c2_ad43_cond,
color_MUX_uxn_c_l201_c2_ad43_iftrue,
color_MUX_uxn_c_l201_c2_ad43_iffalse,
color_MUX_uxn_c_l201_c2_ad43_return_output);

-- CONST_SR_4_uxn_c_l204_c35_3265
CONST_SR_4_uxn_c_l204_c35_3265 : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_c_l204_c35_3265_x,
CONST_SR_4_uxn_c_l204_c35_3265_return_output);

-- BIN_OP_EQ_uxn_c_l207_c7_e463
BIN_OP_EQ_uxn_c_l207_c7_e463 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l207_c7_e463_left,
BIN_OP_EQ_uxn_c_l207_c7_e463_right,
BIN_OP_EQ_uxn_c_l207_c7_e463_return_output);

-- color_MUX_uxn_c_l207_c3_6f0d
color_MUX_uxn_c_l207_c3_6f0d : entity work.MUX_uint1_t_uint12_t_4_uint12_t_4_0CLK_de264c78 port map (
color_MUX_uxn_c_l207_c3_6f0d_cond,
color_MUX_uxn_c_l207_c3_6f0d_iftrue,
color_MUX_uxn_c_l207_c3_6f0d_iffalse,
color_MUX_uxn_c_l207_c3_6f0d_return_output);

-- CONST_SL_8_uxn_c_l209_c4_c1de
CONST_SL_8_uxn_c_l209_c4_c1de : entity work.CONST_SL_8_uint12_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l209_c4_c1de_x,
CONST_SL_8_uxn_c_l209_c4_c1de_return_output);

-- BIN_OP_AND_uxn_c_l210_c4_d8d2
BIN_OP_AND_uxn_c_l210_c4_d8d2 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l210_c4_d8d2_left,
BIN_OP_AND_uxn_c_l210_c4_d8d2_right,
BIN_OP_AND_uxn_c_l210_c4_d8d2_return_output);

-- BIN_OP_OR_uxn_c_l211_c4_4ded
BIN_OP_OR_uxn_c_l211_c4_4ded : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l211_c4_4ded_left,
BIN_OP_OR_uxn_c_l211_c4_4ded_right,
BIN_OP_OR_uxn_c_l211_c4_4ded_return_output);

-- CONST_SL_8_uxn_c_l214_c4_6e9e
CONST_SL_8_uxn_c_l214_c4_6e9e : entity work.CONST_SL_8_uint12_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l214_c4_6e9e_x,
CONST_SL_8_uxn_c_l214_c4_6e9e_return_output);

-- BIN_OP_AND_uxn_c_l215_c4_342b
BIN_OP_AND_uxn_c_l215_c4_342b : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l215_c4_342b_left,
BIN_OP_AND_uxn_c_l215_c4_342b_right,
BIN_OP_AND_uxn_c_l215_c4_342b_return_output);

-- BIN_OP_OR_uxn_c_l216_c4_27f0
BIN_OP_OR_uxn_c_l216_c4_27f0 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l216_c4_27f0_left,
BIN_OP_OR_uxn_c_l216_c4_27f0_right,
BIN_OP_OR_uxn_c_l216_c4_27f0_return_output);

-- BIN_OP_EQ_uxn_c_l218_c12_2782
BIN_OP_EQ_uxn_c_l218_c12_2782 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l218_c12_2782_left,
BIN_OP_EQ_uxn_c_l218_c12_2782_right,
BIN_OP_EQ_uxn_c_l218_c12_2782_return_output);

-- color_MUX_uxn_c_l218_c8_a7d5
color_MUX_uxn_c_l218_c8_a7d5 : entity work.MUX_uint1_t_uint12_t_4_uint12_t_4_0CLK_de264c78 port map (
color_MUX_uxn_c_l218_c8_a7d5_cond,
color_MUX_uxn_c_l218_c8_a7d5_iftrue,
color_MUX_uxn_c_l218_c8_a7d5_iffalse,
color_MUX_uxn_c_l218_c8_a7d5_return_output);

-- CONST_SL_8_uxn_c_l220_c4_5b8a
CONST_SL_8_uxn_c_l220_c4_5b8a : entity work.CONST_SL_8_uint12_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l220_c4_5b8a_x,
CONST_SL_8_uxn_c_l220_c4_5b8a_return_output);

-- BIN_OP_AND_uxn_c_l221_c4_7e6a
BIN_OP_AND_uxn_c_l221_c4_7e6a : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l221_c4_7e6a_left,
BIN_OP_AND_uxn_c_l221_c4_7e6a_right,
BIN_OP_AND_uxn_c_l221_c4_7e6a_return_output);

-- BIN_OP_OR_uxn_c_l222_c4_e1de
BIN_OP_OR_uxn_c_l222_c4_e1de : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l222_c4_e1de_left,
BIN_OP_OR_uxn_c_l222_c4_e1de_right,
BIN_OP_OR_uxn_c_l222_c4_e1de_return_output);

-- CONST_SL_8_uxn_c_l225_c4_9c6e
CONST_SL_8_uxn_c_l225_c4_9c6e : entity work.CONST_SL_8_uint12_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l225_c4_9c6e_x,
CONST_SL_8_uxn_c_l225_c4_9c6e_return_output);

-- BIN_OP_AND_uxn_c_l226_c4_6b20
BIN_OP_AND_uxn_c_l226_c4_6b20 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l226_c4_6b20_left,
BIN_OP_AND_uxn_c_l226_c4_6b20_right,
BIN_OP_AND_uxn_c_l226_c4_6b20_return_output);

-- BIN_OP_OR_uxn_c_l227_c4_84c4
BIN_OP_OR_uxn_c_l227_c4_84c4 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l227_c4_84c4_left,
BIN_OP_OR_uxn_c_l227_c4_84c4_right,
BIN_OP_OR_uxn_c_l227_c4_84c4_return_output);

-- BIN_OP_EQ_uxn_c_l229_c12_1ba4
BIN_OP_EQ_uxn_c_l229_c12_1ba4 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l229_c12_1ba4_left,
BIN_OP_EQ_uxn_c_l229_c12_1ba4_right,
BIN_OP_EQ_uxn_c_l229_c12_1ba4_return_output);

-- color_MUX_uxn_c_l229_c8_c857
color_MUX_uxn_c_l229_c8_c857 : entity work.MUX_uint1_t_uint12_t_4_uint12_t_4_0CLK_de264c78 port map (
color_MUX_uxn_c_l229_c8_c857_cond,
color_MUX_uxn_c_l229_c8_c857_iftrue,
color_MUX_uxn_c_l229_c8_c857_iffalse,
color_MUX_uxn_c_l229_c8_c857_return_output);

-- CONST_SL_4_uxn_c_l231_c4_9af9
CONST_SL_4_uxn_c_l231_c4_9af9 : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_c_l231_c4_9af9_x,
CONST_SL_4_uxn_c_l231_c4_9af9_return_output);

-- BIN_OP_AND_uxn_c_l232_c4_16e1
BIN_OP_AND_uxn_c_l232_c4_16e1 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l232_c4_16e1_left,
BIN_OP_AND_uxn_c_l232_c4_16e1_right,
BIN_OP_AND_uxn_c_l232_c4_16e1_return_output);

-- BIN_OP_OR_uxn_c_l233_c4_aae4
BIN_OP_OR_uxn_c_l233_c4_aae4 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l233_c4_aae4_left,
BIN_OP_OR_uxn_c_l233_c4_aae4_right,
BIN_OP_OR_uxn_c_l233_c4_aae4_return_output);

-- CONST_SL_4_uxn_c_l236_c4_7c72
CONST_SL_4_uxn_c_l236_c4_7c72 : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_c_l236_c4_7c72_x,
CONST_SL_4_uxn_c_l236_c4_7c72_return_output);

-- BIN_OP_AND_uxn_c_l237_c4_b5da
BIN_OP_AND_uxn_c_l237_c4_b5da : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l237_c4_b5da_left,
BIN_OP_AND_uxn_c_l237_c4_b5da_right,
BIN_OP_AND_uxn_c_l237_c4_b5da_return_output);

-- BIN_OP_OR_uxn_c_l238_c4_d5b5
BIN_OP_OR_uxn_c_l238_c4_d5b5 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l238_c4_d5b5_left,
BIN_OP_OR_uxn_c_l238_c4_d5b5_right,
BIN_OP_OR_uxn_c_l238_c4_d5b5_return_output);

-- BIN_OP_EQ_uxn_c_l240_c12_6690
BIN_OP_EQ_uxn_c_l240_c12_6690 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l240_c12_6690_left,
BIN_OP_EQ_uxn_c_l240_c12_6690_right,
BIN_OP_EQ_uxn_c_l240_c12_6690_return_output);

-- color_MUX_uxn_c_l240_c8_d4e5
color_MUX_uxn_c_l240_c8_d4e5 : entity work.MUX_uint1_t_uint12_t_4_uint12_t_4_0CLK_de264c78 port map (
color_MUX_uxn_c_l240_c8_d4e5_cond,
color_MUX_uxn_c_l240_c8_d4e5_iftrue,
color_MUX_uxn_c_l240_c8_d4e5_iffalse,
color_MUX_uxn_c_l240_c8_d4e5_return_output);

-- CONST_SL_4_uxn_c_l242_c4_a9d2
CONST_SL_4_uxn_c_l242_c4_a9d2 : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_c_l242_c4_a9d2_x,
CONST_SL_4_uxn_c_l242_c4_a9d2_return_output);

-- BIN_OP_AND_uxn_c_l243_c4_367c
BIN_OP_AND_uxn_c_l243_c4_367c : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l243_c4_367c_left,
BIN_OP_AND_uxn_c_l243_c4_367c_right,
BIN_OP_AND_uxn_c_l243_c4_367c_return_output);

-- BIN_OP_OR_uxn_c_l244_c4_626a
BIN_OP_OR_uxn_c_l244_c4_626a : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l244_c4_626a_left,
BIN_OP_OR_uxn_c_l244_c4_626a_right,
BIN_OP_OR_uxn_c_l244_c4_626a_return_output);

-- CONST_SL_4_uxn_c_l247_c4_2b01
CONST_SL_4_uxn_c_l247_c4_2b01 : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_c_l247_c4_2b01_x,
CONST_SL_4_uxn_c_l247_c4_2b01_return_output);

-- BIN_OP_AND_uxn_c_l248_c4_47b9
BIN_OP_AND_uxn_c_l248_c4_47b9 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l248_c4_47b9_left,
BIN_OP_AND_uxn_c_l248_c4_47b9_right,
BIN_OP_AND_uxn_c_l248_c4_47b9_return_output);

-- BIN_OP_OR_uxn_c_l249_c4_2249
BIN_OP_OR_uxn_c_l249_c4_2249 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l249_c4_2249_left,
BIN_OP_OR_uxn_c_l249_c4_2249_right,
BIN_OP_OR_uxn_c_l249_c4_2249_return_output);

-- BIN_OP_EQ_uxn_c_l251_c12_40da
BIN_OP_EQ_uxn_c_l251_c12_40da : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l251_c12_40da_left,
BIN_OP_EQ_uxn_c_l251_c12_40da_right,
BIN_OP_EQ_uxn_c_l251_c12_40da_return_output);

-- color_MUX_uxn_c_l251_c8_8e18
color_MUX_uxn_c_l251_c8_8e18 : entity work.MUX_uint1_t_uint12_t_4_uint12_t_4_0CLK_de264c78 port map (
color_MUX_uxn_c_l251_c8_8e18_cond,
color_MUX_uxn_c_l251_c8_8e18_iftrue,
color_MUX_uxn_c_l251_c8_8e18_iffalse,
color_MUX_uxn_c_l251_c8_8e18_return_output);

-- BIN_OP_AND_uxn_c_l253_c4_6f2d
BIN_OP_AND_uxn_c_l253_c4_6f2d : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l253_c4_6f2d_left,
BIN_OP_AND_uxn_c_l253_c4_6f2d_right,
BIN_OP_AND_uxn_c_l253_c4_6f2d_return_output);

-- BIN_OP_OR_uxn_c_l254_c4_6a98
BIN_OP_OR_uxn_c_l254_c4_6a98 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l254_c4_6a98_left,
BIN_OP_OR_uxn_c_l254_c4_6a98_right,
BIN_OP_OR_uxn_c_l254_c4_6a98_return_output);

-- BIN_OP_AND_uxn_c_l257_c4_7ede
BIN_OP_AND_uxn_c_l257_c4_7ede : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l257_c4_7ede_left,
BIN_OP_AND_uxn_c_l257_c4_7ede_right,
BIN_OP_AND_uxn_c_l257_c4_7ede_return_output);

-- BIN_OP_OR_uxn_c_l258_c4_0e3c
BIN_OP_OR_uxn_c_l258_c4_0e3c : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l258_c4_0e3c_left,
BIN_OP_OR_uxn_c_l258_c4_0e3c_right,
BIN_OP_OR_uxn_c_l258_c4_0e3c_return_output);

-- BIN_OP_EQ_uxn_c_l260_c12_d16e
BIN_OP_EQ_uxn_c_l260_c12_d16e : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l260_c12_d16e_left,
BIN_OP_EQ_uxn_c_l260_c12_d16e_right,
BIN_OP_EQ_uxn_c_l260_c12_d16e_return_output);

-- color_3_MUX_uxn_c_l260_c8_93f8
color_3_MUX_uxn_c_l260_c8_93f8 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color_3_MUX_uxn_c_l260_c8_93f8_cond,
color_3_MUX_uxn_c_l260_c8_93f8_iftrue,
color_3_MUX_uxn_c_l260_c8_93f8_iffalse,
color_3_MUX_uxn_c_l260_c8_93f8_return_output);

-- color_2_MUX_uxn_c_l260_c8_93f8
color_2_MUX_uxn_c_l260_c8_93f8 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color_2_MUX_uxn_c_l260_c8_93f8_cond,
color_2_MUX_uxn_c_l260_c8_93f8_iftrue,
color_2_MUX_uxn_c_l260_c8_93f8_iffalse,
color_2_MUX_uxn_c_l260_c8_93f8_return_output);

-- BIN_OP_AND_uxn_c_l262_c4_62ea
BIN_OP_AND_uxn_c_l262_c4_62ea : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l262_c4_62ea_left,
BIN_OP_AND_uxn_c_l262_c4_62ea_right,
BIN_OP_AND_uxn_c_l262_c4_62ea_return_output);

-- BIN_OP_OR_uxn_c_l263_c4_1174
BIN_OP_OR_uxn_c_l263_c4_1174 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l263_c4_1174_left,
BIN_OP_OR_uxn_c_l263_c4_1174_right,
BIN_OP_OR_uxn_c_l263_c4_1174_return_output);

-- BIN_OP_AND_uxn_c_l266_c4_9b4e
BIN_OP_AND_uxn_c_l266_c4_9b4e : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l266_c4_9b4e_left,
BIN_OP_AND_uxn_c_l266_c4_9b4e_right,
BIN_OP_AND_uxn_c_l266_c4_9b4e_return_output);

-- BIN_OP_OR_uxn_c_l267_c4_3a33
BIN_OP_OR_uxn_c_l267_c4_3a33 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l267_c4_3a33_left,
BIN_OP_OR_uxn_c_l267_c4_3a33_right,
BIN_OP_OR_uxn_c_l267_c4_3a33_return_output);

-- VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l271_c20_53e2
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l271_c20_53e2 : entity work.VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_0CLK_9e40ec46 port map (
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l271_c20_53e2_ref_toks_0,
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l271_c20_53e2_var_dim_0,
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l271_c20_53e2_return_output);



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
 CONST_SR_4_uxn_c_l199_c30_5be7_return_output,
 BIN_OP_EQ_uxn_c_l199_c30_4877_return_output,
 MUX_uxn_c_l199_c30_8d1d_return_output,
 BIN_OP_AND_uxn_c_l201_c6_6ac9_return_output,
 color_MUX_uxn_c_l201_c2_ad43_return_output,
 CONST_SR_4_uxn_c_l204_c35_3265_return_output,
 BIN_OP_EQ_uxn_c_l207_c7_e463_return_output,
 color_MUX_uxn_c_l207_c3_6f0d_return_output,
 CONST_SL_8_uxn_c_l209_c4_c1de_return_output,
 BIN_OP_AND_uxn_c_l210_c4_d8d2_return_output,
 BIN_OP_OR_uxn_c_l211_c4_4ded_return_output,
 CONST_SL_8_uxn_c_l214_c4_6e9e_return_output,
 BIN_OP_AND_uxn_c_l215_c4_342b_return_output,
 BIN_OP_OR_uxn_c_l216_c4_27f0_return_output,
 BIN_OP_EQ_uxn_c_l218_c12_2782_return_output,
 color_MUX_uxn_c_l218_c8_a7d5_return_output,
 CONST_SL_8_uxn_c_l220_c4_5b8a_return_output,
 BIN_OP_AND_uxn_c_l221_c4_7e6a_return_output,
 BIN_OP_OR_uxn_c_l222_c4_e1de_return_output,
 CONST_SL_8_uxn_c_l225_c4_9c6e_return_output,
 BIN_OP_AND_uxn_c_l226_c4_6b20_return_output,
 BIN_OP_OR_uxn_c_l227_c4_84c4_return_output,
 BIN_OP_EQ_uxn_c_l229_c12_1ba4_return_output,
 color_MUX_uxn_c_l229_c8_c857_return_output,
 CONST_SL_4_uxn_c_l231_c4_9af9_return_output,
 BIN_OP_AND_uxn_c_l232_c4_16e1_return_output,
 BIN_OP_OR_uxn_c_l233_c4_aae4_return_output,
 CONST_SL_4_uxn_c_l236_c4_7c72_return_output,
 BIN_OP_AND_uxn_c_l237_c4_b5da_return_output,
 BIN_OP_OR_uxn_c_l238_c4_d5b5_return_output,
 BIN_OP_EQ_uxn_c_l240_c12_6690_return_output,
 color_MUX_uxn_c_l240_c8_d4e5_return_output,
 CONST_SL_4_uxn_c_l242_c4_a9d2_return_output,
 BIN_OP_AND_uxn_c_l243_c4_367c_return_output,
 BIN_OP_OR_uxn_c_l244_c4_626a_return_output,
 CONST_SL_4_uxn_c_l247_c4_2b01_return_output,
 BIN_OP_AND_uxn_c_l248_c4_47b9_return_output,
 BIN_OP_OR_uxn_c_l249_c4_2249_return_output,
 BIN_OP_EQ_uxn_c_l251_c12_40da_return_output,
 color_MUX_uxn_c_l251_c8_8e18_return_output,
 BIN_OP_AND_uxn_c_l253_c4_6f2d_return_output,
 BIN_OP_OR_uxn_c_l254_c4_6a98_return_output,
 BIN_OP_AND_uxn_c_l257_c4_7ede_return_output,
 BIN_OP_OR_uxn_c_l258_c4_0e3c_return_output,
 BIN_OP_EQ_uxn_c_l260_c12_d16e_return_output,
 color_3_MUX_uxn_c_l260_c8_93f8_return_output,
 color_2_MUX_uxn_c_l260_c8_93f8_return_output,
 BIN_OP_AND_uxn_c_l262_c4_62ea_return_output,
 BIN_OP_OR_uxn_c_l263_c4_1174_return_output,
 BIN_OP_AND_uxn_c_l266_c4_9b4e_return_output,
 BIN_OP_OR_uxn_c_l267_c4_3a33_return_output,
 VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l271_c20_53e2_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_device_ram_address : unsigned(7 downto 0);
 variable VAR_device_ram_value : unsigned(7 downto 0);
 variable VAR_is_device_ram_write : unsigned(0 downto 0);
 variable VAR_gpu_step_color : unsigned(1 downto 0);
 variable VAR_is_palette_range : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l199_c30_8d1d_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_4_uxn_c_l199_c30_5be7_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l199_c30_4877_left : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_c_l199_c30_5be7_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l199_c30_4877_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l199_c30_4877_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l199_c30_8d1d_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l199_c30_8d1d_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l199_c30_8d1d_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l201_c6_6ac9_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l201_c6_6ac9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l201_c6_6ac9_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_c_l201_c2_ad43_iftrue : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l207_c3_6f0d_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l201_c2_ad43_iffalse : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l201_c2_ad43_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l201_c2_ad43_cond : unsigned(0 downto 0);
 variable VAR_tmp12 : unsigned(11 downto 0);
 variable VAR_addr_low : unsigned(3 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_c_l203_c22_b790_return_output : unsigned(3 downto 0);
 variable VAR_color_cmp_0 : unsigned(3 downto 0);
 variable VAR_color_cmp_0_uxn_c_l204_c11_50c2_0 : unsigned(3 downto 0);
 variable VAR_CONST_SR_4_uxn_c_l204_c35_3265_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_c_l204_c35_3265_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_c_l204_c25_a876_return_output : unsigned(3 downto 0);
 variable VAR_color_cmp_1 : unsigned(3 downto 0);
 variable VAR_color_cmp_1_uxn_c_l205_c11_72fd_0 : unsigned(3 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_c_l205_c25_bf8a_return_output : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l207_c7_e463_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l207_c7_e463_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l207_c7_e463_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_c_l207_c3_6f0d_iftrue : uint12_t_4;
 variable VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l207_c3_6f0d_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l207_c3_6f0d_iffalse : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l218_c8_a7d5_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l207_c3_6f0d_cond : unsigned(0 downto 0);
 variable VAR_tmp12_uxn_c_l208_c4_7abf : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l209_c4_c1de_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l209_c4_c1de_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l210_c4_d8d2_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l210_c4_d8d2_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l210_c4_d8d2_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l211_c4_4ded_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l211_c4_4ded_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l211_c4_4ded_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_uxn_c_l213_c4_1844 : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l214_c4_6e9e_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l214_c4_6e9e_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l215_c4_342b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l215_c4_342b_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l215_c4_342b_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l216_c4_27f0_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l216_c4_27f0_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l216_c4_27f0_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l218_c12_2782_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l218_c12_2782_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l218_c12_2782_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_c_l218_c8_a7d5_iftrue : uint12_t_4;
 variable VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l218_c8_a7d5_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l218_c8_a7d5_iffalse : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l229_c8_c857_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l218_c8_a7d5_cond : unsigned(0 downto 0);
 variable VAR_tmp12_uxn_c_l219_c4_65cd : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l220_c4_5b8a_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l220_c4_5b8a_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l221_c4_7e6a_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l221_c4_7e6a_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l221_c4_7e6a_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l222_c4_e1de_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l222_c4_e1de_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l222_c4_e1de_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_uxn_c_l224_c4_35b9 : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l225_c4_9c6e_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l225_c4_9c6e_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l226_c4_6b20_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l226_c4_6b20_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l226_c4_6b20_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l227_c4_84c4_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l227_c4_84c4_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l227_c4_84c4_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l229_c12_1ba4_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l229_c12_1ba4_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l229_c12_1ba4_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_c_l229_c8_c857_iftrue : uint12_t_4;
 variable VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l229_c8_c857_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l229_c8_c857_iffalse : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l240_c8_d4e5_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l229_c8_c857_cond : unsigned(0 downto 0);
 variable VAR_tmp12_uxn_c_l230_c4_c4bb : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l231_c4_9af9_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l231_c4_9af9_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l232_c4_16e1_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l232_c4_16e1_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l232_c4_16e1_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l233_c4_aae4_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l233_c4_aae4_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l233_c4_aae4_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_uxn_c_l235_c4_daf0 : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l236_c4_7c72_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l236_c4_7c72_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l237_c4_b5da_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l237_c4_b5da_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l237_c4_b5da_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l238_c4_d5b5_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l238_c4_d5b5_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l238_c4_d5b5_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l240_c12_6690_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l240_c12_6690_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l240_c12_6690_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_c_l240_c8_d4e5_iftrue : uint12_t_4;
 variable VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l240_c8_d4e5_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l240_c8_d4e5_iffalse : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l251_c8_8e18_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l240_c8_d4e5_cond : unsigned(0 downto 0);
 variable VAR_tmp12_uxn_c_l241_c4_d827 : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l242_c4_a9d2_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l242_c4_a9d2_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l243_c4_367c_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l243_c4_367c_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l243_c4_367c_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l244_c4_626a_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l244_c4_626a_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l244_c4_626a_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_uxn_c_l246_c4_d3c6 : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l247_c4_2b01_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l247_c4_2b01_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l248_c4_47b9_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l248_c4_47b9_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l248_c4_47b9_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l249_c4_2249_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l249_c4_2249_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l249_c4_2249_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l251_c12_40da_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l251_c12_40da_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l251_c12_40da_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_c_l251_c8_8e18_iftrue : uint12_t_4;
 variable VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l251_c8_8e18_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l251_c8_8e18_iffalse : uint12_t_4;
 variable VAR_color_FALSE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_3db8_uxn_c_l251_c8_8e18_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l251_c8_8e18_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l253_c4_6f2d_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l253_c4_6f2d_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l253_c4_6f2d_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l254_c4_6a98_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l254_c4_6a98_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l254_c4_6a98_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l257_c4_7ede_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l257_c4_7ede_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l257_c4_7ede_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l258_c4_0e3c_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l258_c4_0e3c_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l258_c4_0e3c_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l260_c12_d16e_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l260_c12_d16e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l260_c12_d16e_return_output : unsigned(0 downto 0);
 variable VAR_color_3_MUX_uxn_c_l260_c8_93f8_iftrue : unsigned(11 downto 0);
 variable VAR_color_3_MUX_uxn_c_l260_c8_93f8_iffalse : unsigned(11 downto 0);
 variable VAR_color_3_MUX_uxn_c_l260_c8_93f8_return_output : unsigned(11 downto 0);
 variable VAR_color_3_MUX_uxn_c_l260_c8_93f8_cond : unsigned(0 downto 0);
 variable VAR_color_2_MUX_uxn_c_l260_c8_93f8_iftrue : unsigned(11 downto 0);
 variable VAR_color_2_MUX_uxn_c_l260_c8_93f8_iffalse : unsigned(11 downto 0);
 variable VAR_color_2_MUX_uxn_c_l260_c8_93f8_return_output : unsigned(11 downto 0);
 variable VAR_color_2_MUX_uxn_c_l260_c8_93f8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l262_c4_62ea_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l262_c4_62ea_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l262_c4_62ea_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l263_c4_1174_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l263_c4_1174_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l263_c4_1174_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l266_c4_9b4e_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l266_c4_9b4e_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l266_c4_9b4e_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l267_c4_3a33_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l267_c4_3a33_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l267_c4_3a33_return_output : unsigned(11 downto 0);
 variable VAR_result : unsigned(15 downto 0);
 variable VAR_result_uxn_c_l271_c11_71df_0 : unsigned(15 downto 0);
 variable VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l271_c20_53e2_var_dim_0 : unsigned(1 downto 0);
 variable VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l271_c20_53e2_return_output : unsigned(11 downto 0);
 variable VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l271_c20_53e2_ref_toks_0 : uint12_t_4;
 variable VAR_CONST_REF_RD_uint12_t_uint12_t_4_0_d41d_uxn_c_l253_l232_l210_DUPLICATE_e406_return_output : unsigned(11 downto 0);
 variable VAR_CONST_REF_RD_uint12_t_uint12_t_4_1_d41d_uxn_c_l257_l215_l237_DUPLICATE_674e_return_output : unsigned(11 downto 0);
 variable VAR_CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_uxn_c_l260_l221_l243_l262_DUPLICATE_dfe5_return_output : unsigned(11 downto 0);
 variable VAR_CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_uxn_c_l266_l248_l260_l226_DUPLICATE_e6d1_return_output : unsigned(11 downto 0);
 variable VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l261_l252_DUPLICATE_1801_return_output : unsigned(11 downto 0);
 variable VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l256_l265_DUPLICATE_eeca_return_output : unsigned(11 downto 0);
 -- State registers comb logic variables
variable REG_VAR_color : uint12_t_4;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_color := color;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_c_l251_c12_40da_right := to_unsigned(12, 4);
     VAR_BIN_OP_EQ_uxn_c_l199_c30_4877_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l218_c12_2782_right := to_unsigned(9, 4);
     VAR_BIN_OP_AND_uxn_c_l237_c4_b5da_right := to_unsigned(3855, 12);
     VAR_BIN_OP_EQ_uxn_c_l207_c7_e463_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_c_l240_c12_6690_right := to_unsigned(11, 4);
     VAR_BIN_OP_AND_uxn_c_l226_c4_6b20_right := to_unsigned(255, 12);
     VAR_BIN_OP_AND_uxn_c_l215_c4_342b_right := to_unsigned(255, 12);
     VAR_BIN_OP_AND_uxn_c_l248_c4_47b9_right := to_unsigned(3855, 12);
     VAR_BIN_OP_AND_uxn_c_l221_c4_7e6a_right := to_unsigned(255, 12);
     VAR_BIN_OP_AND_uxn_c_l253_c4_6f2d_right := to_unsigned(4080, 12);
     VAR_BIN_OP_AND_uxn_c_l243_c4_367c_right := to_unsigned(3855, 12);
     VAR_MUX_uxn_c_l199_c30_8d1d_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_c_l257_c4_7ede_right := to_unsigned(4080, 12);
     VAR_BIN_OP_AND_uxn_c_l210_c4_d8d2_right := to_unsigned(255, 12);
     VAR_BIN_OP_EQ_uxn_c_l260_c12_d16e_right := to_unsigned(13, 4);
     VAR_BIN_OP_AND_uxn_c_l266_c4_9b4e_right := to_unsigned(4080, 12);
     VAR_BIN_OP_EQ_uxn_c_l229_c12_1ba4_right := to_unsigned(10, 4);
     VAR_BIN_OP_AND_uxn_c_l232_c4_16e1_right := to_unsigned(3855, 12);
     VAR_BIN_OP_AND_uxn_c_l262_c4_62ea_right := to_unsigned(4080, 12);
     VAR_MUX_uxn_c_l199_c30_8d1d_iffalse := to_unsigned(0, 1);

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
     VAR_color_MUX_uxn_c_l201_c2_ad43_iffalse := color;
     VAR_CONST_SR_4_uxn_c_l199_c30_5be7_x := VAR_device_ram_address;
     VAR_CONST_SR_4_uxn_c_l204_c35_3265_x := VAR_device_ram_value;
     VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l271_c20_53e2_var_dim_0 := VAR_gpu_step_color;
     VAR_BIN_OP_AND_uxn_c_l201_c6_6ac9_left := VAR_is_device_ram_write;
     -- CAST_TO_uint4_t[uxn_c_l203_c22_b790] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_c_l203_c22_b790_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_device_ram_address);

     -- CONST_SR_4[uxn_c_l199_c30_5be7] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_c_l199_c30_5be7_x <= VAR_CONST_SR_4_uxn_c_l199_c30_5be7_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_c_l199_c30_5be7_return_output := CONST_SR_4_uxn_c_l199_c30_5be7_return_output;

     -- CAST_TO_uint4_t[uxn_c_l205_c25_bf8a] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_c_l205_c25_bf8a_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_device_ram_value);

     -- CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_uxn_c_l266_l248_l260_l226_DUPLICATE_e6d1 LATENCY=0
     VAR_CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_uxn_c_l266_l248_l260_l226_DUPLICATE_e6d1_return_output := color(3);

     -- CONST_REF_RD_uint12_t_uint12_t_4_1_d41d_uxn_c_l257_l215_l237_DUPLICATE_674e LATENCY=0
     VAR_CONST_REF_RD_uint12_t_uint12_t_4_1_d41d_uxn_c_l257_l215_l237_DUPLICATE_674e_return_output := color(1);

     -- CONST_REF_RD_uint12_t_uint12_t_4_0_d41d_uxn_c_l253_l232_l210_DUPLICATE_e406 LATENCY=0
     VAR_CONST_REF_RD_uint12_t_uint12_t_4_0_d41d_uxn_c_l253_l232_l210_DUPLICATE_e406_return_output := color(0);

     -- CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_uxn_c_l260_l221_l243_l262_DUPLICATE_dfe5 LATENCY=0
     VAR_CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_uxn_c_l260_l221_l243_l262_DUPLICATE_dfe5_return_output := color(2);

     -- CONST_SR_4[uxn_c_l204_c35_3265] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_c_l204_c35_3265_x <= VAR_CONST_SR_4_uxn_c_l204_c35_3265_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_c_l204_c35_3265_return_output := CONST_SR_4_uxn_c_l204_c35_3265_return_output;

     -- Submodule level 1
     VAR_BIN_OP_EQ_uxn_c_l207_c7_e463_left := VAR_CAST_TO_uint4_t_uxn_c_l203_c22_b790_return_output;
     VAR_BIN_OP_EQ_uxn_c_l218_c12_2782_left := VAR_CAST_TO_uint4_t_uxn_c_l203_c22_b790_return_output;
     VAR_BIN_OP_EQ_uxn_c_l229_c12_1ba4_left := VAR_CAST_TO_uint4_t_uxn_c_l203_c22_b790_return_output;
     VAR_BIN_OP_EQ_uxn_c_l240_c12_6690_left := VAR_CAST_TO_uint4_t_uxn_c_l203_c22_b790_return_output;
     VAR_BIN_OP_EQ_uxn_c_l251_c12_40da_left := VAR_CAST_TO_uint4_t_uxn_c_l203_c22_b790_return_output;
     VAR_BIN_OP_EQ_uxn_c_l260_c12_d16e_left := VAR_CAST_TO_uint4_t_uxn_c_l203_c22_b790_return_output;
     VAR_color_cmp_1_uxn_c_l205_c11_72fd_0 := VAR_CAST_TO_uint4_t_uxn_c_l205_c25_bf8a_return_output;
     VAR_BIN_OP_AND_uxn_c_l210_c4_d8d2_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_0_d41d_uxn_c_l253_l232_l210_DUPLICATE_e406_return_output;
     VAR_BIN_OP_AND_uxn_c_l232_c4_16e1_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_0_d41d_uxn_c_l253_l232_l210_DUPLICATE_e406_return_output;
     VAR_BIN_OP_AND_uxn_c_l253_c4_6f2d_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_0_d41d_uxn_c_l253_l232_l210_DUPLICATE_e406_return_output;
     VAR_BIN_OP_AND_uxn_c_l215_c4_342b_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_1_d41d_uxn_c_l257_l215_l237_DUPLICATE_674e_return_output;
     VAR_BIN_OP_AND_uxn_c_l237_c4_b5da_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_1_d41d_uxn_c_l257_l215_l237_DUPLICATE_674e_return_output;
     VAR_BIN_OP_AND_uxn_c_l257_c4_7ede_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_1_d41d_uxn_c_l257_l215_l237_DUPLICATE_674e_return_output;
     VAR_BIN_OP_AND_uxn_c_l221_c4_7e6a_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_uxn_c_l260_l221_l243_l262_DUPLICATE_dfe5_return_output;
     VAR_BIN_OP_AND_uxn_c_l243_c4_367c_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_uxn_c_l260_l221_l243_l262_DUPLICATE_dfe5_return_output;
     VAR_BIN_OP_AND_uxn_c_l262_c4_62ea_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_uxn_c_l260_l221_l243_l262_DUPLICATE_dfe5_return_output;
     VAR_color_2_MUX_uxn_c_l260_c8_93f8_iffalse := VAR_CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_uxn_c_l260_l221_l243_l262_DUPLICATE_dfe5_return_output;
     VAR_BIN_OP_AND_uxn_c_l226_c4_6b20_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_uxn_c_l266_l248_l260_l226_DUPLICATE_e6d1_return_output;
     VAR_BIN_OP_AND_uxn_c_l248_c4_47b9_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_uxn_c_l266_l248_l260_l226_DUPLICATE_e6d1_return_output;
     VAR_BIN_OP_AND_uxn_c_l266_c4_9b4e_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_uxn_c_l266_l248_l260_l226_DUPLICATE_e6d1_return_output;
     VAR_color_3_MUX_uxn_c_l260_c8_93f8_iffalse := VAR_CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_uxn_c_l266_l248_l260_l226_DUPLICATE_e6d1_return_output;
     VAR_BIN_OP_EQ_uxn_c_l199_c30_4877_left := VAR_CONST_SR_4_uxn_c_l199_c30_5be7_return_output;
     VAR_tmp12_uxn_c_l213_c4_1844 := resize(VAR_color_cmp_1_uxn_c_l205_c11_72fd_0, 12);
     VAR_tmp12_uxn_c_l224_c4_35b9 := resize(VAR_color_cmp_1_uxn_c_l205_c11_72fd_0, 12);
     VAR_tmp12_uxn_c_l235_c4_daf0 := resize(VAR_color_cmp_1_uxn_c_l205_c11_72fd_0, 12);
     VAR_tmp12_uxn_c_l246_c4_d3c6 := resize(VAR_color_cmp_1_uxn_c_l205_c11_72fd_0, 12);
     VAR_CONST_SL_8_uxn_c_l214_c4_6e9e_x := VAR_tmp12_uxn_c_l213_c4_1844;
     VAR_CONST_SL_8_uxn_c_l225_c4_9c6e_x := VAR_tmp12_uxn_c_l224_c4_35b9;
     VAR_CONST_SL_4_uxn_c_l236_c4_7c72_x := VAR_tmp12_uxn_c_l235_c4_daf0;
     VAR_CONST_SL_4_uxn_c_l247_c4_2b01_x := VAR_tmp12_uxn_c_l246_c4_d3c6;
     -- CONST_SL_4[uxn_c_l247_c4_2b01] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_c_l247_c4_2b01_x <= VAR_CONST_SL_4_uxn_c_l247_c4_2b01_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_c_l247_c4_2b01_return_output := CONST_SL_4_uxn_c_l247_c4_2b01_return_output;

     -- BIN_OP_EQ[uxn_c_l207_c7_e463] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l207_c7_e463_left <= VAR_BIN_OP_EQ_uxn_c_l207_c7_e463_left;
     BIN_OP_EQ_uxn_c_l207_c7_e463_right <= VAR_BIN_OP_EQ_uxn_c_l207_c7_e463_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l207_c7_e463_return_output := BIN_OP_EQ_uxn_c_l207_c7_e463_return_output;

     -- BIN_OP_EQ[uxn_c_l229_c12_1ba4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l229_c12_1ba4_left <= VAR_BIN_OP_EQ_uxn_c_l229_c12_1ba4_left;
     BIN_OP_EQ_uxn_c_l229_c12_1ba4_right <= VAR_BIN_OP_EQ_uxn_c_l229_c12_1ba4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l229_c12_1ba4_return_output := BIN_OP_EQ_uxn_c_l229_c12_1ba4_return_output;

     -- BIN_OP_AND[uxn_c_l221_c4_7e6a] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l221_c4_7e6a_left <= VAR_BIN_OP_AND_uxn_c_l221_c4_7e6a_left;
     BIN_OP_AND_uxn_c_l221_c4_7e6a_right <= VAR_BIN_OP_AND_uxn_c_l221_c4_7e6a_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l221_c4_7e6a_return_output := BIN_OP_AND_uxn_c_l221_c4_7e6a_return_output;

     -- BIN_OP_AND[uxn_c_l226_c4_6b20] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l226_c4_6b20_left <= VAR_BIN_OP_AND_uxn_c_l226_c4_6b20_left;
     BIN_OP_AND_uxn_c_l226_c4_6b20_right <= VAR_BIN_OP_AND_uxn_c_l226_c4_6b20_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l226_c4_6b20_return_output := BIN_OP_AND_uxn_c_l226_c4_6b20_return_output;

     -- BIN_OP_AND[uxn_c_l243_c4_367c] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l243_c4_367c_left <= VAR_BIN_OP_AND_uxn_c_l243_c4_367c_left;
     BIN_OP_AND_uxn_c_l243_c4_367c_right <= VAR_BIN_OP_AND_uxn_c_l243_c4_367c_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l243_c4_367c_return_output := BIN_OP_AND_uxn_c_l243_c4_367c_return_output;

     -- CAST_TO_uint4_t[uxn_c_l204_c25_a876] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_c_l204_c25_a876_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_CONST_SR_4_uxn_c_l204_c35_3265_return_output);

     -- BIN_OP_AND[uxn_c_l237_c4_b5da] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l237_c4_b5da_left <= VAR_BIN_OP_AND_uxn_c_l237_c4_b5da_left;
     BIN_OP_AND_uxn_c_l237_c4_b5da_right <= VAR_BIN_OP_AND_uxn_c_l237_c4_b5da_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l237_c4_b5da_return_output := BIN_OP_AND_uxn_c_l237_c4_b5da_return_output;

     -- BIN_OP_EQ[uxn_c_l251_c12_40da] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l251_c12_40da_left <= VAR_BIN_OP_EQ_uxn_c_l251_c12_40da_left;
     BIN_OP_EQ_uxn_c_l251_c12_40da_right <= VAR_BIN_OP_EQ_uxn_c_l251_c12_40da_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l251_c12_40da_return_output := BIN_OP_EQ_uxn_c_l251_c12_40da_return_output;

     -- CONST_SL_4[uxn_c_l236_c4_7c72] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_c_l236_c4_7c72_x <= VAR_CONST_SL_4_uxn_c_l236_c4_7c72_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_c_l236_c4_7c72_return_output := CONST_SL_4_uxn_c_l236_c4_7c72_return_output;

     -- BIN_OP_EQ[uxn_c_l240_c12_6690] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l240_c12_6690_left <= VAR_BIN_OP_EQ_uxn_c_l240_c12_6690_left;
     BIN_OP_EQ_uxn_c_l240_c12_6690_right <= VAR_BIN_OP_EQ_uxn_c_l240_c12_6690_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l240_c12_6690_return_output := BIN_OP_EQ_uxn_c_l240_c12_6690_return_output;

     -- BIN_OP_EQ[uxn_c_l218_c12_2782] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l218_c12_2782_left <= VAR_BIN_OP_EQ_uxn_c_l218_c12_2782_left;
     BIN_OP_EQ_uxn_c_l218_c12_2782_right <= VAR_BIN_OP_EQ_uxn_c_l218_c12_2782_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l218_c12_2782_return_output := BIN_OP_EQ_uxn_c_l218_c12_2782_return_output;

     -- BIN_OP_AND[uxn_c_l257_c4_7ede] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l257_c4_7ede_left <= VAR_BIN_OP_AND_uxn_c_l257_c4_7ede_left;
     BIN_OP_AND_uxn_c_l257_c4_7ede_right <= VAR_BIN_OP_AND_uxn_c_l257_c4_7ede_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l257_c4_7ede_return_output := BIN_OP_AND_uxn_c_l257_c4_7ede_return_output;

     -- BIN_OP_AND[uxn_c_l266_c4_9b4e] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l266_c4_9b4e_left <= VAR_BIN_OP_AND_uxn_c_l266_c4_9b4e_left;
     BIN_OP_AND_uxn_c_l266_c4_9b4e_right <= VAR_BIN_OP_AND_uxn_c_l266_c4_9b4e_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l266_c4_9b4e_return_output := BIN_OP_AND_uxn_c_l266_c4_9b4e_return_output;

     -- BIN_OP_EQ[uxn_c_l260_c12_d16e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l260_c12_d16e_left <= VAR_BIN_OP_EQ_uxn_c_l260_c12_d16e_left;
     BIN_OP_EQ_uxn_c_l260_c12_d16e_right <= VAR_BIN_OP_EQ_uxn_c_l260_c12_d16e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l260_c12_d16e_return_output := BIN_OP_EQ_uxn_c_l260_c12_d16e_return_output;

     -- BIN_OP_AND[uxn_c_l262_c4_62ea] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l262_c4_62ea_left <= VAR_BIN_OP_AND_uxn_c_l262_c4_62ea_left;
     BIN_OP_AND_uxn_c_l262_c4_62ea_right <= VAR_BIN_OP_AND_uxn_c_l262_c4_62ea_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l262_c4_62ea_return_output := BIN_OP_AND_uxn_c_l262_c4_62ea_return_output;

     -- BIN_OP_AND[uxn_c_l215_c4_342b] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l215_c4_342b_left <= VAR_BIN_OP_AND_uxn_c_l215_c4_342b_left;
     BIN_OP_AND_uxn_c_l215_c4_342b_right <= VAR_BIN_OP_AND_uxn_c_l215_c4_342b_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l215_c4_342b_return_output := BIN_OP_AND_uxn_c_l215_c4_342b_return_output;

     -- CONST_SL_8[uxn_c_l214_c4_6e9e] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l214_c4_6e9e_x <= VAR_CONST_SL_8_uxn_c_l214_c4_6e9e_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l214_c4_6e9e_return_output := CONST_SL_8_uxn_c_l214_c4_6e9e_return_output;

     -- BIN_OP_AND[uxn_c_l232_c4_16e1] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l232_c4_16e1_left <= VAR_BIN_OP_AND_uxn_c_l232_c4_16e1_left;
     BIN_OP_AND_uxn_c_l232_c4_16e1_right <= VAR_BIN_OP_AND_uxn_c_l232_c4_16e1_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l232_c4_16e1_return_output := BIN_OP_AND_uxn_c_l232_c4_16e1_return_output;

     -- BIN_OP_AND[uxn_c_l248_c4_47b9] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l248_c4_47b9_left <= VAR_BIN_OP_AND_uxn_c_l248_c4_47b9_left;
     BIN_OP_AND_uxn_c_l248_c4_47b9_right <= VAR_BIN_OP_AND_uxn_c_l248_c4_47b9_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l248_c4_47b9_return_output := BIN_OP_AND_uxn_c_l248_c4_47b9_return_output;

     -- CAST_TO_uint12_t_uint4_t_uxn_c_l256_l265_DUPLICATE_eeca LATENCY=0
     VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l256_l265_DUPLICATE_eeca_return_output := CAST_TO_uint12_t_uint4_t(
     VAR_color_cmp_1_uxn_c_l205_c11_72fd_0);

     -- BIN_OP_AND[uxn_c_l210_c4_d8d2] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l210_c4_d8d2_left <= VAR_BIN_OP_AND_uxn_c_l210_c4_d8d2_left;
     BIN_OP_AND_uxn_c_l210_c4_d8d2_right <= VAR_BIN_OP_AND_uxn_c_l210_c4_d8d2_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l210_c4_d8d2_return_output := BIN_OP_AND_uxn_c_l210_c4_d8d2_return_output;

     -- CONST_SL_8[uxn_c_l225_c4_9c6e] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l225_c4_9c6e_x <= VAR_CONST_SL_8_uxn_c_l225_c4_9c6e_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l225_c4_9c6e_return_output := CONST_SL_8_uxn_c_l225_c4_9c6e_return_output;

     -- BIN_OP_AND[uxn_c_l253_c4_6f2d] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l253_c4_6f2d_left <= VAR_BIN_OP_AND_uxn_c_l253_c4_6f2d_left;
     BIN_OP_AND_uxn_c_l253_c4_6f2d_right <= VAR_BIN_OP_AND_uxn_c_l253_c4_6f2d_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l253_c4_6f2d_return_output := BIN_OP_AND_uxn_c_l253_c4_6f2d_return_output;

     -- BIN_OP_EQ[uxn_c_l199_c30_4877] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l199_c30_4877_left <= VAR_BIN_OP_EQ_uxn_c_l199_c30_4877_left;
     BIN_OP_EQ_uxn_c_l199_c30_4877_right <= VAR_BIN_OP_EQ_uxn_c_l199_c30_4877_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l199_c30_4877_return_output := BIN_OP_EQ_uxn_c_l199_c30_4877_return_output;

     -- Submodule level 2
     VAR_BIN_OP_OR_uxn_c_l211_c4_4ded_left := VAR_BIN_OP_AND_uxn_c_l210_c4_d8d2_return_output;
     VAR_BIN_OP_OR_uxn_c_l216_c4_27f0_left := VAR_BIN_OP_AND_uxn_c_l215_c4_342b_return_output;
     VAR_BIN_OP_OR_uxn_c_l222_c4_e1de_left := VAR_BIN_OP_AND_uxn_c_l221_c4_7e6a_return_output;
     VAR_BIN_OP_OR_uxn_c_l227_c4_84c4_left := VAR_BIN_OP_AND_uxn_c_l226_c4_6b20_return_output;
     VAR_BIN_OP_OR_uxn_c_l233_c4_aae4_left := VAR_BIN_OP_AND_uxn_c_l232_c4_16e1_return_output;
     VAR_BIN_OP_OR_uxn_c_l238_c4_d5b5_left := VAR_BIN_OP_AND_uxn_c_l237_c4_b5da_return_output;
     VAR_BIN_OP_OR_uxn_c_l244_c4_626a_left := VAR_BIN_OP_AND_uxn_c_l243_c4_367c_return_output;
     VAR_BIN_OP_OR_uxn_c_l249_c4_2249_left := VAR_BIN_OP_AND_uxn_c_l248_c4_47b9_return_output;
     VAR_BIN_OP_OR_uxn_c_l254_c4_6a98_left := VAR_BIN_OP_AND_uxn_c_l253_c4_6f2d_return_output;
     VAR_BIN_OP_OR_uxn_c_l258_c4_0e3c_left := VAR_BIN_OP_AND_uxn_c_l257_c4_7ede_return_output;
     VAR_BIN_OP_OR_uxn_c_l263_c4_1174_left := VAR_BIN_OP_AND_uxn_c_l262_c4_62ea_return_output;
     VAR_BIN_OP_OR_uxn_c_l267_c4_3a33_left := VAR_BIN_OP_AND_uxn_c_l266_c4_9b4e_return_output;
     VAR_MUX_uxn_c_l199_c30_8d1d_cond := VAR_BIN_OP_EQ_uxn_c_l199_c30_4877_return_output;
     VAR_color_MUX_uxn_c_l207_c3_6f0d_cond := VAR_BIN_OP_EQ_uxn_c_l207_c7_e463_return_output;
     VAR_color_MUX_uxn_c_l218_c8_a7d5_cond := VAR_BIN_OP_EQ_uxn_c_l218_c12_2782_return_output;
     VAR_color_MUX_uxn_c_l229_c8_c857_cond := VAR_BIN_OP_EQ_uxn_c_l229_c12_1ba4_return_output;
     VAR_color_MUX_uxn_c_l240_c8_d4e5_cond := VAR_BIN_OP_EQ_uxn_c_l240_c12_6690_return_output;
     VAR_color_MUX_uxn_c_l251_c8_8e18_cond := VAR_BIN_OP_EQ_uxn_c_l251_c12_40da_return_output;
     VAR_color_2_MUX_uxn_c_l260_c8_93f8_cond := VAR_BIN_OP_EQ_uxn_c_l260_c12_d16e_return_output;
     VAR_color_3_MUX_uxn_c_l260_c8_93f8_cond := VAR_BIN_OP_EQ_uxn_c_l260_c12_d16e_return_output;
     VAR_BIN_OP_OR_uxn_c_l258_c4_0e3c_right := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l256_l265_DUPLICATE_eeca_return_output;
     VAR_BIN_OP_OR_uxn_c_l267_c4_3a33_right := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l256_l265_DUPLICATE_eeca_return_output;
     VAR_color_cmp_0_uxn_c_l204_c11_50c2_0 := VAR_CAST_TO_uint4_t_uxn_c_l204_c25_a876_return_output;
     VAR_BIN_OP_OR_uxn_c_l238_c4_d5b5_right := VAR_CONST_SL_4_uxn_c_l236_c4_7c72_return_output;
     VAR_BIN_OP_OR_uxn_c_l249_c4_2249_right := VAR_CONST_SL_4_uxn_c_l247_c4_2b01_return_output;
     VAR_BIN_OP_OR_uxn_c_l216_c4_27f0_right := VAR_CONST_SL_8_uxn_c_l214_c4_6e9e_return_output;
     VAR_BIN_OP_OR_uxn_c_l227_c4_84c4_right := VAR_CONST_SL_8_uxn_c_l225_c4_9c6e_return_output;
     VAR_tmp12_uxn_c_l208_c4_7abf := resize(VAR_color_cmp_0_uxn_c_l204_c11_50c2_0, 12);
     VAR_tmp12_uxn_c_l219_c4_65cd := resize(VAR_color_cmp_0_uxn_c_l204_c11_50c2_0, 12);
     VAR_tmp12_uxn_c_l230_c4_c4bb := resize(VAR_color_cmp_0_uxn_c_l204_c11_50c2_0, 12);
     VAR_tmp12_uxn_c_l241_c4_d827 := resize(VAR_color_cmp_0_uxn_c_l204_c11_50c2_0, 12);
     VAR_CONST_SL_8_uxn_c_l209_c4_c1de_x := VAR_tmp12_uxn_c_l208_c4_7abf;
     VAR_CONST_SL_8_uxn_c_l220_c4_5b8a_x := VAR_tmp12_uxn_c_l219_c4_65cd;
     VAR_CONST_SL_4_uxn_c_l231_c4_9af9_x := VAR_tmp12_uxn_c_l230_c4_c4bb;
     VAR_CONST_SL_4_uxn_c_l242_c4_a9d2_x := VAR_tmp12_uxn_c_l241_c4_d827;
     -- BIN_OP_OR[uxn_c_l249_c4_2249] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l249_c4_2249_left <= VAR_BIN_OP_OR_uxn_c_l249_c4_2249_left;
     BIN_OP_OR_uxn_c_l249_c4_2249_right <= VAR_BIN_OP_OR_uxn_c_l249_c4_2249_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l249_c4_2249_return_output := BIN_OP_OR_uxn_c_l249_c4_2249_return_output;

     -- CONST_SL_8[uxn_c_l209_c4_c1de] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l209_c4_c1de_x <= VAR_CONST_SL_8_uxn_c_l209_c4_c1de_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l209_c4_c1de_return_output := CONST_SL_8_uxn_c_l209_c4_c1de_return_output;

     -- BIN_OP_OR[uxn_c_l258_c4_0e3c] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l258_c4_0e3c_left <= VAR_BIN_OP_OR_uxn_c_l258_c4_0e3c_left;
     BIN_OP_OR_uxn_c_l258_c4_0e3c_right <= VAR_BIN_OP_OR_uxn_c_l258_c4_0e3c_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l258_c4_0e3c_return_output := BIN_OP_OR_uxn_c_l258_c4_0e3c_return_output;

     -- BIN_OP_OR[uxn_c_l267_c4_3a33] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l267_c4_3a33_left <= VAR_BIN_OP_OR_uxn_c_l267_c4_3a33_left;
     BIN_OP_OR_uxn_c_l267_c4_3a33_right <= VAR_BIN_OP_OR_uxn_c_l267_c4_3a33_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l267_c4_3a33_return_output := BIN_OP_OR_uxn_c_l267_c4_3a33_return_output;

     -- BIN_OP_OR[uxn_c_l227_c4_84c4] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l227_c4_84c4_left <= VAR_BIN_OP_OR_uxn_c_l227_c4_84c4_left;
     BIN_OP_OR_uxn_c_l227_c4_84c4_right <= VAR_BIN_OP_OR_uxn_c_l227_c4_84c4_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l227_c4_84c4_return_output := BIN_OP_OR_uxn_c_l227_c4_84c4_return_output;

     -- CONST_SL_4[uxn_c_l242_c4_a9d2] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_c_l242_c4_a9d2_x <= VAR_CONST_SL_4_uxn_c_l242_c4_a9d2_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_c_l242_c4_a9d2_return_output := CONST_SL_4_uxn_c_l242_c4_a9d2_return_output;

     -- MUX[uxn_c_l199_c30_8d1d] LATENCY=0
     -- Inputs
     MUX_uxn_c_l199_c30_8d1d_cond <= VAR_MUX_uxn_c_l199_c30_8d1d_cond;
     MUX_uxn_c_l199_c30_8d1d_iftrue <= VAR_MUX_uxn_c_l199_c30_8d1d_iftrue;
     MUX_uxn_c_l199_c30_8d1d_iffalse <= VAR_MUX_uxn_c_l199_c30_8d1d_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l199_c30_8d1d_return_output := MUX_uxn_c_l199_c30_8d1d_return_output;

     -- CONST_SL_4[uxn_c_l231_c4_9af9] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_c_l231_c4_9af9_x <= VAR_CONST_SL_4_uxn_c_l231_c4_9af9_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_c_l231_c4_9af9_return_output := CONST_SL_4_uxn_c_l231_c4_9af9_return_output;

     -- BIN_OP_OR[uxn_c_l238_c4_d5b5] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l238_c4_d5b5_left <= VAR_BIN_OP_OR_uxn_c_l238_c4_d5b5_left;
     BIN_OP_OR_uxn_c_l238_c4_d5b5_right <= VAR_BIN_OP_OR_uxn_c_l238_c4_d5b5_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l238_c4_d5b5_return_output := BIN_OP_OR_uxn_c_l238_c4_d5b5_return_output;

     -- BIN_OP_OR[uxn_c_l216_c4_27f0] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l216_c4_27f0_left <= VAR_BIN_OP_OR_uxn_c_l216_c4_27f0_left;
     BIN_OP_OR_uxn_c_l216_c4_27f0_right <= VAR_BIN_OP_OR_uxn_c_l216_c4_27f0_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l216_c4_27f0_return_output := BIN_OP_OR_uxn_c_l216_c4_27f0_return_output;

     -- CONST_SL_8[uxn_c_l220_c4_5b8a] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l220_c4_5b8a_x <= VAR_CONST_SL_8_uxn_c_l220_c4_5b8a_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l220_c4_5b8a_return_output := CONST_SL_8_uxn_c_l220_c4_5b8a_return_output;

     -- CAST_TO_uint12_t_uint4_t_uxn_c_l261_l252_DUPLICATE_1801 LATENCY=0
     VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l261_l252_DUPLICATE_1801_return_output := CAST_TO_uint12_t_uint4_t(
     VAR_color_cmp_0_uxn_c_l204_c11_50c2_0);

     -- Submodule level 3
     VAR_color_3_MUX_uxn_c_l260_c8_93f8_iftrue := VAR_BIN_OP_OR_uxn_c_l267_c4_3a33_return_output;
     VAR_BIN_OP_OR_uxn_c_l254_c4_6a98_right := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l261_l252_DUPLICATE_1801_return_output;
     VAR_BIN_OP_OR_uxn_c_l263_c4_1174_right := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l261_l252_DUPLICATE_1801_return_output;
     VAR_BIN_OP_OR_uxn_c_l233_c4_aae4_right := VAR_CONST_SL_4_uxn_c_l231_c4_9af9_return_output;
     VAR_BIN_OP_OR_uxn_c_l244_c4_626a_right := VAR_CONST_SL_4_uxn_c_l242_c4_a9d2_return_output;
     VAR_BIN_OP_OR_uxn_c_l211_c4_4ded_right := VAR_CONST_SL_8_uxn_c_l209_c4_c1de_return_output;
     VAR_BIN_OP_OR_uxn_c_l222_c4_e1de_right := VAR_CONST_SL_8_uxn_c_l220_c4_5b8a_return_output;
     VAR_BIN_OP_AND_uxn_c_l201_c6_6ac9_right := VAR_MUX_uxn_c_l199_c30_8d1d_return_output;
     -- BIN_OP_OR[uxn_c_l233_c4_aae4] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l233_c4_aae4_left <= VAR_BIN_OP_OR_uxn_c_l233_c4_aae4_left;
     BIN_OP_OR_uxn_c_l233_c4_aae4_right <= VAR_BIN_OP_OR_uxn_c_l233_c4_aae4_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l233_c4_aae4_return_output := BIN_OP_OR_uxn_c_l233_c4_aae4_return_output;

     -- BIN_OP_AND[uxn_c_l201_c6_6ac9] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l201_c6_6ac9_left <= VAR_BIN_OP_AND_uxn_c_l201_c6_6ac9_left;
     BIN_OP_AND_uxn_c_l201_c6_6ac9_right <= VAR_BIN_OP_AND_uxn_c_l201_c6_6ac9_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l201_c6_6ac9_return_output := BIN_OP_AND_uxn_c_l201_c6_6ac9_return_output;

     -- BIN_OP_OR[uxn_c_l211_c4_4ded] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l211_c4_4ded_left <= VAR_BIN_OP_OR_uxn_c_l211_c4_4ded_left;
     BIN_OP_OR_uxn_c_l211_c4_4ded_right <= VAR_BIN_OP_OR_uxn_c_l211_c4_4ded_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l211_c4_4ded_return_output := BIN_OP_OR_uxn_c_l211_c4_4ded_return_output;

     -- BIN_OP_OR[uxn_c_l222_c4_e1de] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l222_c4_e1de_left <= VAR_BIN_OP_OR_uxn_c_l222_c4_e1de_left;
     BIN_OP_OR_uxn_c_l222_c4_e1de_right <= VAR_BIN_OP_OR_uxn_c_l222_c4_e1de_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l222_c4_e1de_return_output := BIN_OP_OR_uxn_c_l222_c4_e1de_return_output;

     -- BIN_OP_OR[uxn_c_l254_c4_6a98] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l254_c4_6a98_left <= VAR_BIN_OP_OR_uxn_c_l254_c4_6a98_left;
     BIN_OP_OR_uxn_c_l254_c4_6a98_right <= VAR_BIN_OP_OR_uxn_c_l254_c4_6a98_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l254_c4_6a98_return_output := BIN_OP_OR_uxn_c_l254_c4_6a98_return_output;

     -- color_3_MUX[uxn_c_l260_c8_93f8] LATENCY=0
     -- Inputs
     color_3_MUX_uxn_c_l260_c8_93f8_cond <= VAR_color_3_MUX_uxn_c_l260_c8_93f8_cond;
     color_3_MUX_uxn_c_l260_c8_93f8_iftrue <= VAR_color_3_MUX_uxn_c_l260_c8_93f8_iftrue;
     color_3_MUX_uxn_c_l260_c8_93f8_iffalse <= VAR_color_3_MUX_uxn_c_l260_c8_93f8_iffalse;
     -- Outputs
     VAR_color_3_MUX_uxn_c_l260_c8_93f8_return_output := color_3_MUX_uxn_c_l260_c8_93f8_return_output;

     -- BIN_OP_OR[uxn_c_l263_c4_1174] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l263_c4_1174_left <= VAR_BIN_OP_OR_uxn_c_l263_c4_1174_left;
     BIN_OP_OR_uxn_c_l263_c4_1174_right <= VAR_BIN_OP_OR_uxn_c_l263_c4_1174_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l263_c4_1174_return_output := BIN_OP_OR_uxn_c_l263_c4_1174_return_output;

     -- BIN_OP_OR[uxn_c_l244_c4_626a] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l244_c4_626a_left <= VAR_BIN_OP_OR_uxn_c_l244_c4_626a_left;
     BIN_OP_OR_uxn_c_l244_c4_626a_right <= VAR_BIN_OP_OR_uxn_c_l244_c4_626a_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l244_c4_626a_return_output := BIN_OP_OR_uxn_c_l244_c4_626a_return_output;

     -- Submodule level 4
     VAR_color_MUX_uxn_c_l201_c2_ad43_cond := VAR_BIN_OP_AND_uxn_c_l201_c6_6ac9_return_output;
     VAR_color_2_MUX_uxn_c_l260_c8_93f8_iftrue := VAR_BIN_OP_OR_uxn_c_l263_c4_1174_return_output;
     -- color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8[uxn_c_l207_c3_6f0d] LATENCY=0
     VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l207_c3_6f0d_return_output := CONST_REF_RD_uint12_t_4_uint12_t_4_90b8(
     color,
     VAR_BIN_OP_OR_uxn_c_l211_c4_4ded_return_output,
     VAR_BIN_OP_OR_uxn_c_l216_c4_27f0_return_output);

     -- color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5[uxn_c_l218_c8_a7d5] LATENCY=0
     VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l218_c8_a7d5_return_output := CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5(
     color,
     VAR_BIN_OP_OR_uxn_c_l222_c4_e1de_return_output,
     VAR_BIN_OP_OR_uxn_c_l227_c4_84c4_return_output);

     -- color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8[uxn_c_l229_c8_c857] LATENCY=0
     VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l229_c8_c857_return_output := CONST_REF_RD_uint12_t_4_uint12_t_4_90b8(
     color,
     VAR_BIN_OP_OR_uxn_c_l233_c4_aae4_return_output,
     VAR_BIN_OP_OR_uxn_c_l238_c4_d5b5_return_output);

     -- color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8[uxn_c_l251_c8_8e18] LATENCY=0
     VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l251_c8_8e18_return_output := CONST_REF_RD_uint12_t_4_uint12_t_4_90b8(
     color,
     VAR_BIN_OP_OR_uxn_c_l254_c4_6a98_return_output,
     VAR_BIN_OP_OR_uxn_c_l258_c4_0e3c_return_output);

     -- color_2_MUX[uxn_c_l260_c8_93f8] LATENCY=0
     -- Inputs
     color_2_MUX_uxn_c_l260_c8_93f8_cond <= VAR_color_2_MUX_uxn_c_l260_c8_93f8_cond;
     color_2_MUX_uxn_c_l260_c8_93f8_iftrue <= VAR_color_2_MUX_uxn_c_l260_c8_93f8_iftrue;
     color_2_MUX_uxn_c_l260_c8_93f8_iffalse <= VAR_color_2_MUX_uxn_c_l260_c8_93f8_iffalse;
     -- Outputs
     VAR_color_2_MUX_uxn_c_l260_c8_93f8_return_output := color_2_MUX_uxn_c_l260_c8_93f8_return_output;

     -- color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5[uxn_c_l240_c8_d4e5] LATENCY=0
     VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l240_c8_d4e5_return_output := CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5(
     color,
     VAR_BIN_OP_OR_uxn_c_l244_c4_626a_return_output,
     VAR_BIN_OP_OR_uxn_c_l249_c4_2249_return_output);

     -- Submodule level 5
     VAR_color_MUX_uxn_c_l207_c3_6f0d_iftrue := VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l207_c3_6f0d_return_output;
     VAR_color_MUX_uxn_c_l229_c8_c857_iftrue := VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l229_c8_c857_return_output;
     VAR_color_MUX_uxn_c_l251_c8_8e18_iftrue := VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l251_c8_8e18_return_output;
     VAR_color_MUX_uxn_c_l218_c8_a7d5_iftrue := VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l218_c8_a7d5_return_output;
     VAR_color_MUX_uxn_c_l240_c8_d4e5_iftrue := VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l240_c8_d4e5_return_output;
     -- color_FALSE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_3db8[uxn_c_l251_c8_8e18] LATENCY=0
     VAR_color_FALSE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_3db8_uxn_c_l251_c8_8e18_return_output := CONST_REF_RD_uint12_t_4_uint12_t_4_3db8(
     color,
     VAR_color_3_MUX_uxn_c_l260_c8_93f8_return_output,
     VAR_color_2_MUX_uxn_c_l260_c8_93f8_return_output);

     -- Submodule level 6
     VAR_color_MUX_uxn_c_l251_c8_8e18_iffalse := VAR_color_FALSE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_3db8_uxn_c_l251_c8_8e18_return_output;
     -- color_MUX[uxn_c_l251_c8_8e18] LATENCY=0
     -- Inputs
     color_MUX_uxn_c_l251_c8_8e18_cond <= VAR_color_MUX_uxn_c_l251_c8_8e18_cond;
     color_MUX_uxn_c_l251_c8_8e18_iftrue <= VAR_color_MUX_uxn_c_l251_c8_8e18_iftrue;
     color_MUX_uxn_c_l251_c8_8e18_iffalse <= VAR_color_MUX_uxn_c_l251_c8_8e18_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_c_l251_c8_8e18_return_output := color_MUX_uxn_c_l251_c8_8e18_return_output;

     -- Submodule level 7
     VAR_color_MUX_uxn_c_l240_c8_d4e5_iffalse := VAR_color_MUX_uxn_c_l251_c8_8e18_return_output;
     -- color_MUX[uxn_c_l240_c8_d4e5] LATENCY=0
     -- Inputs
     color_MUX_uxn_c_l240_c8_d4e5_cond <= VAR_color_MUX_uxn_c_l240_c8_d4e5_cond;
     color_MUX_uxn_c_l240_c8_d4e5_iftrue <= VAR_color_MUX_uxn_c_l240_c8_d4e5_iftrue;
     color_MUX_uxn_c_l240_c8_d4e5_iffalse <= VAR_color_MUX_uxn_c_l240_c8_d4e5_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_c_l240_c8_d4e5_return_output := color_MUX_uxn_c_l240_c8_d4e5_return_output;

     -- Submodule level 8
     VAR_color_MUX_uxn_c_l229_c8_c857_iffalse := VAR_color_MUX_uxn_c_l240_c8_d4e5_return_output;
     -- color_MUX[uxn_c_l229_c8_c857] LATENCY=0
     -- Inputs
     color_MUX_uxn_c_l229_c8_c857_cond <= VAR_color_MUX_uxn_c_l229_c8_c857_cond;
     color_MUX_uxn_c_l229_c8_c857_iftrue <= VAR_color_MUX_uxn_c_l229_c8_c857_iftrue;
     color_MUX_uxn_c_l229_c8_c857_iffalse <= VAR_color_MUX_uxn_c_l229_c8_c857_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_c_l229_c8_c857_return_output := color_MUX_uxn_c_l229_c8_c857_return_output;

     -- Submodule level 9
     VAR_color_MUX_uxn_c_l218_c8_a7d5_iffalse := VAR_color_MUX_uxn_c_l229_c8_c857_return_output;
     -- color_MUX[uxn_c_l218_c8_a7d5] LATENCY=0
     -- Inputs
     color_MUX_uxn_c_l218_c8_a7d5_cond <= VAR_color_MUX_uxn_c_l218_c8_a7d5_cond;
     color_MUX_uxn_c_l218_c8_a7d5_iftrue <= VAR_color_MUX_uxn_c_l218_c8_a7d5_iftrue;
     color_MUX_uxn_c_l218_c8_a7d5_iffalse <= VAR_color_MUX_uxn_c_l218_c8_a7d5_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_c_l218_c8_a7d5_return_output := color_MUX_uxn_c_l218_c8_a7d5_return_output;

     -- Submodule level 10
     VAR_color_MUX_uxn_c_l207_c3_6f0d_iffalse := VAR_color_MUX_uxn_c_l218_c8_a7d5_return_output;
     -- color_MUX[uxn_c_l207_c3_6f0d] LATENCY=0
     -- Inputs
     color_MUX_uxn_c_l207_c3_6f0d_cond <= VAR_color_MUX_uxn_c_l207_c3_6f0d_cond;
     color_MUX_uxn_c_l207_c3_6f0d_iftrue <= VAR_color_MUX_uxn_c_l207_c3_6f0d_iftrue;
     color_MUX_uxn_c_l207_c3_6f0d_iffalse <= VAR_color_MUX_uxn_c_l207_c3_6f0d_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_c_l207_c3_6f0d_return_output := color_MUX_uxn_c_l207_c3_6f0d_return_output;

     -- Submodule level 11
     VAR_color_MUX_uxn_c_l201_c2_ad43_iftrue := VAR_color_MUX_uxn_c_l207_c3_6f0d_return_output;
     -- color_MUX[uxn_c_l201_c2_ad43] LATENCY=0
     -- Inputs
     color_MUX_uxn_c_l201_c2_ad43_cond <= VAR_color_MUX_uxn_c_l201_c2_ad43_cond;
     color_MUX_uxn_c_l201_c2_ad43_iftrue <= VAR_color_MUX_uxn_c_l201_c2_ad43_iftrue;
     color_MUX_uxn_c_l201_c2_ad43_iffalse <= VAR_color_MUX_uxn_c_l201_c2_ad43_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_c_l201_c2_ad43_return_output := color_MUX_uxn_c_l201_c2_ad43_return_output;

     -- Submodule level 12
     VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l271_c20_53e2_ref_toks_0 := VAR_color_MUX_uxn_c_l201_c2_ad43_return_output;
     REG_VAR_color := VAR_color_MUX_uxn_c_l201_c2_ad43_return_output;
     -- VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d[uxn_c_l271_c20_53e2] LATENCY=0
     -- Inputs
     VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l271_c20_53e2_ref_toks_0 <= VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l271_c20_53e2_ref_toks_0;
     VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l271_c20_53e2_var_dim_0 <= VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l271_c20_53e2_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l271_c20_53e2_return_output := VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l271_c20_53e2_return_output;

     -- Submodule level 13
     VAR_result_uxn_c_l271_c11_71df_0 := resize(VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l271_c20_53e2_return_output, 16);
     VAR_return_output := VAR_result_uxn_c_l271_c11_71df_0;
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
