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
-- CONST_SR_4[uxn_c_l199_c30_59d6]
signal CONST_SR_4_uxn_c_l199_c30_59d6_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_c_l199_c30_59d6_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_c_l199_c30_d7aa]
signal BIN_OP_EQ_uxn_c_l199_c30_d7aa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l199_c30_d7aa_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l199_c30_d7aa_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l199_c30_856d]
signal MUX_uxn_c_l199_c30_856d_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l199_c30_856d_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l199_c30_856d_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l199_c30_856d_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l201_c6_d6a3]
signal BIN_OP_AND_uxn_c_l201_c6_d6a3_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l201_c6_d6a3_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l201_c6_d6a3_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_c_l201_c2_11e6]
signal color_MUX_uxn_c_l201_c2_11e6_cond : unsigned(0 downto 0);
signal color_MUX_uxn_c_l201_c2_11e6_iftrue : uint12_t_4;
signal color_MUX_uxn_c_l201_c2_11e6_iffalse : uint12_t_4;
signal color_MUX_uxn_c_l201_c2_11e6_return_output : uint12_t_4;

-- CONST_SR_4[uxn_c_l204_c35_8eb0]
signal CONST_SR_4_uxn_c_l204_c35_8eb0_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_c_l204_c35_8eb0_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_c_l207_c7_05eb]
signal BIN_OP_EQ_uxn_c_l207_c7_05eb_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l207_c7_05eb_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l207_c7_05eb_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_c_l207_c3_7584]
signal color_MUX_uxn_c_l207_c3_7584_cond : unsigned(0 downto 0);
signal color_MUX_uxn_c_l207_c3_7584_iftrue : uint12_t_4;
signal color_MUX_uxn_c_l207_c3_7584_iffalse : uint12_t_4;
signal color_MUX_uxn_c_l207_c3_7584_return_output : uint12_t_4;

-- CONST_SL_8[uxn_c_l209_c4_3e9d]
signal CONST_SL_8_uxn_c_l209_c4_3e9d_x : unsigned(11 downto 0);
signal CONST_SL_8_uxn_c_l209_c4_3e9d_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l210_c4_91a0]
signal BIN_OP_AND_uxn_c_l210_c4_91a0_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l210_c4_91a0_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l210_c4_91a0_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l211_c4_c089]
signal BIN_OP_OR_uxn_c_l211_c4_c089_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l211_c4_c089_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l211_c4_c089_return_output : unsigned(11 downto 0);

-- CONST_SL_8[uxn_c_l214_c4_00a2]
signal CONST_SL_8_uxn_c_l214_c4_00a2_x : unsigned(11 downto 0);
signal CONST_SL_8_uxn_c_l214_c4_00a2_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l215_c4_7ceb]
signal BIN_OP_AND_uxn_c_l215_c4_7ceb_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l215_c4_7ceb_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l215_c4_7ceb_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l216_c4_2653]
signal BIN_OP_OR_uxn_c_l216_c4_2653_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l216_c4_2653_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l216_c4_2653_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l218_c12_e7c1]
signal BIN_OP_EQ_uxn_c_l218_c12_e7c1_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l218_c12_e7c1_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l218_c12_e7c1_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_c_l218_c8_24cb]
signal color_MUX_uxn_c_l218_c8_24cb_cond : unsigned(0 downto 0);
signal color_MUX_uxn_c_l218_c8_24cb_iftrue : uint12_t_4;
signal color_MUX_uxn_c_l218_c8_24cb_iffalse : uint12_t_4;
signal color_MUX_uxn_c_l218_c8_24cb_return_output : uint12_t_4;

-- CONST_SL_8[uxn_c_l220_c4_d100]
signal CONST_SL_8_uxn_c_l220_c4_d100_x : unsigned(11 downto 0);
signal CONST_SL_8_uxn_c_l220_c4_d100_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l221_c4_e012]
signal BIN_OP_AND_uxn_c_l221_c4_e012_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l221_c4_e012_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l221_c4_e012_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l222_c4_9126]
signal BIN_OP_OR_uxn_c_l222_c4_9126_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l222_c4_9126_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l222_c4_9126_return_output : unsigned(11 downto 0);

-- CONST_SL_8[uxn_c_l225_c4_a6e2]
signal CONST_SL_8_uxn_c_l225_c4_a6e2_x : unsigned(11 downto 0);
signal CONST_SL_8_uxn_c_l225_c4_a6e2_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l226_c4_82f7]
signal BIN_OP_AND_uxn_c_l226_c4_82f7_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l226_c4_82f7_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l226_c4_82f7_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l227_c4_4869]
signal BIN_OP_OR_uxn_c_l227_c4_4869_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l227_c4_4869_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l227_c4_4869_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l229_c12_53e8]
signal BIN_OP_EQ_uxn_c_l229_c12_53e8_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l229_c12_53e8_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l229_c12_53e8_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_c_l229_c8_d97f]
signal color_MUX_uxn_c_l229_c8_d97f_cond : unsigned(0 downto 0);
signal color_MUX_uxn_c_l229_c8_d97f_iftrue : uint12_t_4;
signal color_MUX_uxn_c_l229_c8_d97f_iffalse : uint12_t_4;
signal color_MUX_uxn_c_l229_c8_d97f_return_output : uint12_t_4;

-- CONST_SL_4[uxn_c_l231_c4_e76f]
signal CONST_SL_4_uxn_c_l231_c4_e76f_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_c_l231_c4_e76f_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l232_c4_1cc0]
signal BIN_OP_AND_uxn_c_l232_c4_1cc0_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l232_c4_1cc0_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l232_c4_1cc0_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l233_c4_1f74]
signal BIN_OP_OR_uxn_c_l233_c4_1f74_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l233_c4_1f74_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l233_c4_1f74_return_output : unsigned(11 downto 0);

-- CONST_SL_4[uxn_c_l236_c4_7402]
signal CONST_SL_4_uxn_c_l236_c4_7402_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_c_l236_c4_7402_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l237_c4_750e]
signal BIN_OP_AND_uxn_c_l237_c4_750e_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l237_c4_750e_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l237_c4_750e_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l238_c4_025b]
signal BIN_OP_OR_uxn_c_l238_c4_025b_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l238_c4_025b_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l238_c4_025b_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l240_c12_1ef4]
signal BIN_OP_EQ_uxn_c_l240_c12_1ef4_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l240_c12_1ef4_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l240_c12_1ef4_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_c_l240_c8_4f51]
signal color_MUX_uxn_c_l240_c8_4f51_cond : unsigned(0 downto 0);
signal color_MUX_uxn_c_l240_c8_4f51_iftrue : uint12_t_4;
signal color_MUX_uxn_c_l240_c8_4f51_iffalse : uint12_t_4;
signal color_MUX_uxn_c_l240_c8_4f51_return_output : uint12_t_4;

-- CONST_SL_4[uxn_c_l242_c4_00b9]
signal CONST_SL_4_uxn_c_l242_c4_00b9_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_c_l242_c4_00b9_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l243_c4_9b4d]
signal BIN_OP_AND_uxn_c_l243_c4_9b4d_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l243_c4_9b4d_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l243_c4_9b4d_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l244_c4_d1ac]
signal BIN_OP_OR_uxn_c_l244_c4_d1ac_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l244_c4_d1ac_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l244_c4_d1ac_return_output : unsigned(11 downto 0);

-- CONST_SL_4[uxn_c_l247_c4_1c82]
signal CONST_SL_4_uxn_c_l247_c4_1c82_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_c_l247_c4_1c82_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l248_c4_ffe4]
signal BIN_OP_AND_uxn_c_l248_c4_ffe4_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l248_c4_ffe4_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l248_c4_ffe4_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l249_c4_152a]
signal BIN_OP_OR_uxn_c_l249_c4_152a_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l249_c4_152a_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l249_c4_152a_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l251_c12_2a8a]
signal BIN_OP_EQ_uxn_c_l251_c12_2a8a_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l251_c12_2a8a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l251_c12_2a8a_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_c_l251_c8_fab5]
signal color_MUX_uxn_c_l251_c8_fab5_cond : unsigned(0 downto 0);
signal color_MUX_uxn_c_l251_c8_fab5_iftrue : uint12_t_4;
signal color_MUX_uxn_c_l251_c8_fab5_iffalse : uint12_t_4;
signal color_MUX_uxn_c_l251_c8_fab5_return_output : uint12_t_4;

-- BIN_OP_AND[uxn_c_l253_c4_b356]
signal BIN_OP_AND_uxn_c_l253_c4_b356_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l253_c4_b356_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l253_c4_b356_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l254_c4_5dc7]
signal BIN_OP_OR_uxn_c_l254_c4_5dc7_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l254_c4_5dc7_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l254_c4_5dc7_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l257_c4_c15b]
signal BIN_OP_AND_uxn_c_l257_c4_c15b_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l257_c4_c15b_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l257_c4_c15b_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l258_c4_2632]
signal BIN_OP_OR_uxn_c_l258_c4_2632_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l258_c4_2632_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l258_c4_2632_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l260_c12_caf4]
signal BIN_OP_EQ_uxn_c_l260_c12_caf4_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l260_c12_caf4_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l260_c12_caf4_return_output : unsigned(0 downto 0);

-- color_2_MUX[uxn_c_l260_c8_e38e]
signal color_2_MUX_uxn_c_l260_c8_e38e_cond : unsigned(0 downto 0);
signal color_2_MUX_uxn_c_l260_c8_e38e_iftrue : unsigned(11 downto 0);
signal color_2_MUX_uxn_c_l260_c8_e38e_iffalse : unsigned(11 downto 0);
signal color_2_MUX_uxn_c_l260_c8_e38e_return_output : unsigned(11 downto 0);

-- color_3_MUX[uxn_c_l260_c8_e38e]
signal color_3_MUX_uxn_c_l260_c8_e38e_cond : unsigned(0 downto 0);
signal color_3_MUX_uxn_c_l260_c8_e38e_iftrue : unsigned(11 downto 0);
signal color_3_MUX_uxn_c_l260_c8_e38e_iffalse : unsigned(11 downto 0);
signal color_3_MUX_uxn_c_l260_c8_e38e_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l262_c4_5f6e]
signal BIN_OP_AND_uxn_c_l262_c4_5f6e_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l262_c4_5f6e_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l262_c4_5f6e_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l263_c4_7659]
signal BIN_OP_OR_uxn_c_l263_c4_7659_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l263_c4_7659_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l263_c4_7659_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l266_c4_4c95]
signal BIN_OP_AND_uxn_c_l266_c4_4c95_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l266_c4_4c95_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l266_c4_4c95_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l267_c4_6cca]
signal BIN_OP_OR_uxn_c_l267_c4_6cca_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l267_c4_6cca_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l267_c4_6cca_return_output : unsigned(11 downto 0);

-- VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d[uxn_c_l271_c20_a42b]
signal VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l271_c20_a42b_ref_toks_0 : uint12_t_4;
signal VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l271_c20_a42b_var_dim_0 : unsigned(1 downto 0);
signal VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l271_c20_a42b_return_output : unsigned(11 downto 0);

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
-- CONST_SR_4_uxn_c_l199_c30_59d6
CONST_SR_4_uxn_c_l199_c30_59d6 : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_c_l199_c30_59d6_x,
CONST_SR_4_uxn_c_l199_c30_59d6_return_output);

-- BIN_OP_EQ_uxn_c_l199_c30_d7aa
BIN_OP_EQ_uxn_c_l199_c30_d7aa : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l199_c30_d7aa_left,
BIN_OP_EQ_uxn_c_l199_c30_d7aa_right,
BIN_OP_EQ_uxn_c_l199_c30_d7aa_return_output);

-- MUX_uxn_c_l199_c30_856d
MUX_uxn_c_l199_c30_856d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l199_c30_856d_cond,
MUX_uxn_c_l199_c30_856d_iftrue,
MUX_uxn_c_l199_c30_856d_iffalse,
MUX_uxn_c_l199_c30_856d_return_output);

-- BIN_OP_AND_uxn_c_l201_c6_d6a3
BIN_OP_AND_uxn_c_l201_c6_d6a3 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l201_c6_d6a3_left,
BIN_OP_AND_uxn_c_l201_c6_d6a3_right,
BIN_OP_AND_uxn_c_l201_c6_d6a3_return_output);

-- color_MUX_uxn_c_l201_c2_11e6
color_MUX_uxn_c_l201_c2_11e6 : entity work.MUX_uint1_t_uint12_t_4_uint12_t_4_0CLK_de264c78 port map (
color_MUX_uxn_c_l201_c2_11e6_cond,
color_MUX_uxn_c_l201_c2_11e6_iftrue,
color_MUX_uxn_c_l201_c2_11e6_iffalse,
color_MUX_uxn_c_l201_c2_11e6_return_output);

-- CONST_SR_4_uxn_c_l204_c35_8eb0
CONST_SR_4_uxn_c_l204_c35_8eb0 : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_c_l204_c35_8eb0_x,
CONST_SR_4_uxn_c_l204_c35_8eb0_return_output);

-- BIN_OP_EQ_uxn_c_l207_c7_05eb
BIN_OP_EQ_uxn_c_l207_c7_05eb : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l207_c7_05eb_left,
BIN_OP_EQ_uxn_c_l207_c7_05eb_right,
BIN_OP_EQ_uxn_c_l207_c7_05eb_return_output);

-- color_MUX_uxn_c_l207_c3_7584
color_MUX_uxn_c_l207_c3_7584 : entity work.MUX_uint1_t_uint12_t_4_uint12_t_4_0CLK_de264c78 port map (
color_MUX_uxn_c_l207_c3_7584_cond,
color_MUX_uxn_c_l207_c3_7584_iftrue,
color_MUX_uxn_c_l207_c3_7584_iffalse,
color_MUX_uxn_c_l207_c3_7584_return_output);

-- CONST_SL_8_uxn_c_l209_c4_3e9d
CONST_SL_8_uxn_c_l209_c4_3e9d : entity work.CONST_SL_8_uint12_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l209_c4_3e9d_x,
CONST_SL_8_uxn_c_l209_c4_3e9d_return_output);

-- BIN_OP_AND_uxn_c_l210_c4_91a0
BIN_OP_AND_uxn_c_l210_c4_91a0 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l210_c4_91a0_left,
BIN_OP_AND_uxn_c_l210_c4_91a0_right,
BIN_OP_AND_uxn_c_l210_c4_91a0_return_output);

-- BIN_OP_OR_uxn_c_l211_c4_c089
BIN_OP_OR_uxn_c_l211_c4_c089 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l211_c4_c089_left,
BIN_OP_OR_uxn_c_l211_c4_c089_right,
BIN_OP_OR_uxn_c_l211_c4_c089_return_output);

-- CONST_SL_8_uxn_c_l214_c4_00a2
CONST_SL_8_uxn_c_l214_c4_00a2 : entity work.CONST_SL_8_uint12_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l214_c4_00a2_x,
CONST_SL_8_uxn_c_l214_c4_00a2_return_output);

-- BIN_OP_AND_uxn_c_l215_c4_7ceb
BIN_OP_AND_uxn_c_l215_c4_7ceb : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l215_c4_7ceb_left,
BIN_OP_AND_uxn_c_l215_c4_7ceb_right,
BIN_OP_AND_uxn_c_l215_c4_7ceb_return_output);

-- BIN_OP_OR_uxn_c_l216_c4_2653
BIN_OP_OR_uxn_c_l216_c4_2653 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l216_c4_2653_left,
BIN_OP_OR_uxn_c_l216_c4_2653_right,
BIN_OP_OR_uxn_c_l216_c4_2653_return_output);

-- BIN_OP_EQ_uxn_c_l218_c12_e7c1
BIN_OP_EQ_uxn_c_l218_c12_e7c1 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l218_c12_e7c1_left,
BIN_OP_EQ_uxn_c_l218_c12_e7c1_right,
BIN_OP_EQ_uxn_c_l218_c12_e7c1_return_output);

-- color_MUX_uxn_c_l218_c8_24cb
color_MUX_uxn_c_l218_c8_24cb : entity work.MUX_uint1_t_uint12_t_4_uint12_t_4_0CLK_de264c78 port map (
color_MUX_uxn_c_l218_c8_24cb_cond,
color_MUX_uxn_c_l218_c8_24cb_iftrue,
color_MUX_uxn_c_l218_c8_24cb_iffalse,
color_MUX_uxn_c_l218_c8_24cb_return_output);

-- CONST_SL_8_uxn_c_l220_c4_d100
CONST_SL_8_uxn_c_l220_c4_d100 : entity work.CONST_SL_8_uint12_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l220_c4_d100_x,
CONST_SL_8_uxn_c_l220_c4_d100_return_output);

-- BIN_OP_AND_uxn_c_l221_c4_e012
BIN_OP_AND_uxn_c_l221_c4_e012 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l221_c4_e012_left,
BIN_OP_AND_uxn_c_l221_c4_e012_right,
BIN_OP_AND_uxn_c_l221_c4_e012_return_output);

-- BIN_OP_OR_uxn_c_l222_c4_9126
BIN_OP_OR_uxn_c_l222_c4_9126 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l222_c4_9126_left,
BIN_OP_OR_uxn_c_l222_c4_9126_right,
BIN_OP_OR_uxn_c_l222_c4_9126_return_output);

-- CONST_SL_8_uxn_c_l225_c4_a6e2
CONST_SL_8_uxn_c_l225_c4_a6e2 : entity work.CONST_SL_8_uint12_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l225_c4_a6e2_x,
CONST_SL_8_uxn_c_l225_c4_a6e2_return_output);

-- BIN_OP_AND_uxn_c_l226_c4_82f7
BIN_OP_AND_uxn_c_l226_c4_82f7 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l226_c4_82f7_left,
BIN_OP_AND_uxn_c_l226_c4_82f7_right,
BIN_OP_AND_uxn_c_l226_c4_82f7_return_output);

-- BIN_OP_OR_uxn_c_l227_c4_4869
BIN_OP_OR_uxn_c_l227_c4_4869 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l227_c4_4869_left,
BIN_OP_OR_uxn_c_l227_c4_4869_right,
BIN_OP_OR_uxn_c_l227_c4_4869_return_output);

-- BIN_OP_EQ_uxn_c_l229_c12_53e8
BIN_OP_EQ_uxn_c_l229_c12_53e8 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l229_c12_53e8_left,
BIN_OP_EQ_uxn_c_l229_c12_53e8_right,
BIN_OP_EQ_uxn_c_l229_c12_53e8_return_output);

-- color_MUX_uxn_c_l229_c8_d97f
color_MUX_uxn_c_l229_c8_d97f : entity work.MUX_uint1_t_uint12_t_4_uint12_t_4_0CLK_de264c78 port map (
color_MUX_uxn_c_l229_c8_d97f_cond,
color_MUX_uxn_c_l229_c8_d97f_iftrue,
color_MUX_uxn_c_l229_c8_d97f_iffalse,
color_MUX_uxn_c_l229_c8_d97f_return_output);

-- CONST_SL_4_uxn_c_l231_c4_e76f
CONST_SL_4_uxn_c_l231_c4_e76f : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_c_l231_c4_e76f_x,
CONST_SL_4_uxn_c_l231_c4_e76f_return_output);

-- BIN_OP_AND_uxn_c_l232_c4_1cc0
BIN_OP_AND_uxn_c_l232_c4_1cc0 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l232_c4_1cc0_left,
BIN_OP_AND_uxn_c_l232_c4_1cc0_right,
BIN_OP_AND_uxn_c_l232_c4_1cc0_return_output);

-- BIN_OP_OR_uxn_c_l233_c4_1f74
BIN_OP_OR_uxn_c_l233_c4_1f74 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l233_c4_1f74_left,
BIN_OP_OR_uxn_c_l233_c4_1f74_right,
BIN_OP_OR_uxn_c_l233_c4_1f74_return_output);

-- CONST_SL_4_uxn_c_l236_c4_7402
CONST_SL_4_uxn_c_l236_c4_7402 : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_c_l236_c4_7402_x,
CONST_SL_4_uxn_c_l236_c4_7402_return_output);

-- BIN_OP_AND_uxn_c_l237_c4_750e
BIN_OP_AND_uxn_c_l237_c4_750e : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l237_c4_750e_left,
BIN_OP_AND_uxn_c_l237_c4_750e_right,
BIN_OP_AND_uxn_c_l237_c4_750e_return_output);

-- BIN_OP_OR_uxn_c_l238_c4_025b
BIN_OP_OR_uxn_c_l238_c4_025b : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l238_c4_025b_left,
BIN_OP_OR_uxn_c_l238_c4_025b_right,
BIN_OP_OR_uxn_c_l238_c4_025b_return_output);

-- BIN_OP_EQ_uxn_c_l240_c12_1ef4
BIN_OP_EQ_uxn_c_l240_c12_1ef4 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l240_c12_1ef4_left,
BIN_OP_EQ_uxn_c_l240_c12_1ef4_right,
BIN_OP_EQ_uxn_c_l240_c12_1ef4_return_output);

-- color_MUX_uxn_c_l240_c8_4f51
color_MUX_uxn_c_l240_c8_4f51 : entity work.MUX_uint1_t_uint12_t_4_uint12_t_4_0CLK_de264c78 port map (
color_MUX_uxn_c_l240_c8_4f51_cond,
color_MUX_uxn_c_l240_c8_4f51_iftrue,
color_MUX_uxn_c_l240_c8_4f51_iffalse,
color_MUX_uxn_c_l240_c8_4f51_return_output);

-- CONST_SL_4_uxn_c_l242_c4_00b9
CONST_SL_4_uxn_c_l242_c4_00b9 : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_c_l242_c4_00b9_x,
CONST_SL_4_uxn_c_l242_c4_00b9_return_output);

-- BIN_OP_AND_uxn_c_l243_c4_9b4d
BIN_OP_AND_uxn_c_l243_c4_9b4d : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l243_c4_9b4d_left,
BIN_OP_AND_uxn_c_l243_c4_9b4d_right,
BIN_OP_AND_uxn_c_l243_c4_9b4d_return_output);

-- BIN_OP_OR_uxn_c_l244_c4_d1ac
BIN_OP_OR_uxn_c_l244_c4_d1ac : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l244_c4_d1ac_left,
BIN_OP_OR_uxn_c_l244_c4_d1ac_right,
BIN_OP_OR_uxn_c_l244_c4_d1ac_return_output);

-- CONST_SL_4_uxn_c_l247_c4_1c82
CONST_SL_4_uxn_c_l247_c4_1c82 : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_c_l247_c4_1c82_x,
CONST_SL_4_uxn_c_l247_c4_1c82_return_output);

-- BIN_OP_AND_uxn_c_l248_c4_ffe4
BIN_OP_AND_uxn_c_l248_c4_ffe4 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l248_c4_ffe4_left,
BIN_OP_AND_uxn_c_l248_c4_ffe4_right,
BIN_OP_AND_uxn_c_l248_c4_ffe4_return_output);

-- BIN_OP_OR_uxn_c_l249_c4_152a
BIN_OP_OR_uxn_c_l249_c4_152a : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l249_c4_152a_left,
BIN_OP_OR_uxn_c_l249_c4_152a_right,
BIN_OP_OR_uxn_c_l249_c4_152a_return_output);

-- BIN_OP_EQ_uxn_c_l251_c12_2a8a
BIN_OP_EQ_uxn_c_l251_c12_2a8a : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l251_c12_2a8a_left,
BIN_OP_EQ_uxn_c_l251_c12_2a8a_right,
BIN_OP_EQ_uxn_c_l251_c12_2a8a_return_output);

-- color_MUX_uxn_c_l251_c8_fab5
color_MUX_uxn_c_l251_c8_fab5 : entity work.MUX_uint1_t_uint12_t_4_uint12_t_4_0CLK_de264c78 port map (
color_MUX_uxn_c_l251_c8_fab5_cond,
color_MUX_uxn_c_l251_c8_fab5_iftrue,
color_MUX_uxn_c_l251_c8_fab5_iffalse,
color_MUX_uxn_c_l251_c8_fab5_return_output);

-- BIN_OP_AND_uxn_c_l253_c4_b356
BIN_OP_AND_uxn_c_l253_c4_b356 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l253_c4_b356_left,
BIN_OP_AND_uxn_c_l253_c4_b356_right,
BIN_OP_AND_uxn_c_l253_c4_b356_return_output);

-- BIN_OP_OR_uxn_c_l254_c4_5dc7
BIN_OP_OR_uxn_c_l254_c4_5dc7 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l254_c4_5dc7_left,
BIN_OP_OR_uxn_c_l254_c4_5dc7_right,
BIN_OP_OR_uxn_c_l254_c4_5dc7_return_output);

-- BIN_OP_AND_uxn_c_l257_c4_c15b
BIN_OP_AND_uxn_c_l257_c4_c15b : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l257_c4_c15b_left,
BIN_OP_AND_uxn_c_l257_c4_c15b_right,
BIN_OP_AND_uxn_c_l257_c4_c15b_return_output);

-- BIN_OP_OR_uxn_c_l258_c4_2632
BIN_OP_OR_uxn_c_l258_c4_2632 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l258_c4_2632_left,
BIN_OP_OR_uxn_c_l258_c4_2632_right,
BIN_OP_OR_uxn_c_l258_c4_2632_return_output);

-- BIN_OP_EQ_uxn_c_l260_c12_caf4
BIN_OP_EQ_uxn_c_l260_c12_caf4 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l260_c12_caf4_left,
BIN_OP_EQ_uxn_c_l260_c12_caf4_right,
BIN_OP_EQ_uxn_c_l260_c12_caf4_return_output);

-- color_2_MUX_uxn_c_l260_c8_e38e
color_2_MUX_uxn_c_l260_c8_e38e : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color_2_MUX_uxn_c_l260_c8_e38e_cond,
color_2_MUX_uxn_c_l260_c8_e38e_iftrue,
color_2_MUX_uxn_c_l260_c8_e38e_iffalse,
color_2_MUX_uxn_c_l260_c8_e38e_return_output);

-- color_3_MUX_uxn_c_l260_c8_e38e
color_3_MUX_uxn_c_l260_c8_e38e : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color_3_MUX_uxn_c_l260_c8_e38e_cond,
color_3_MUX_uxn_c_l260_c8_e38e_iftrue,
color_3_MUX_uxn_c_l260_c8_e38e_iffalse,
color_3_MUX_uxn_c_l260_c8_e38e_return_output);

-- BIN_OP_AND_uxn_c_l262_c4_5f6e
BIN_OP_AND_uxn_c_l262_c4_5f6e : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l262_c4_5f6e_left,
BIN_OP_AND_uxn_c_l262_c4_5f6e_right,
BIN_OP_AND_uxn_c_l262_c4_5f6e_return_output);

-- BIN_OP_OR_uxn_c_l263_c4_7659
BIN_OP_OR_uxn_c_l263_c4_7659 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l263_c4_7659_left,
BIN_OP_OR_uxn_c_l263_c4_7659_right,
BIN_OP_OR_uxn_c_l263_c4_7659_return_output);

-- BIN_OP_AND_uxn_c_l266_c4_4c95
BIN_OP_AND_uxn_c_l266_c4_4c95 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l266_c4_4c95_left,
BIN_OP_AND_uxn_c_l266_c4_4c95_right,
BIN_OP_AND_uxn_c_l266_c4_4c95_return_output);

-- BIN_OP_OR_uxn_c_l267_c4_6cca
BIN_OP_OR_uxn_c_l267_c4_6cca : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l267_c4_6cca_left,
BIN_OP_OR_uxn_c_l267_c4_6cca_right,
BIN_OP_OR_uxn_c_l267_c4_6cca_return_output);

-- VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l271_c20_a42b
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l271_c20_a42b : entity work.VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_0CLK_9e40ec46 port map (
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l271_c20_a42b_ref_toks_0,
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l271_c20_a42b_var_dim_0,
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l271_c20_a42b_return_output);



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
 CONST_SR_4_uxn_c_l199_c30_59d6_return_output,
 BIN_OP_EQ_uxn_c_l199_c30_d7aa_return_output,
 MUX_uxn_c_l199_c30_856d_return_output,
 BIN_OP_AND_uxn_c_l201_c6_d6a3_return_output,
 color_MUX_uxn_c_l201_c2_11e6_return_output,
 CONST_SR_4_uxn_c_l204_c35_8eb0_return_output,
 BIN_OP_EQ_uxn_c_l207_c7_05eb_return_output,
 color_MUX_uxn_c_l207_c3_7584_return_output,
 CONST_SL_8_uxn_c_l209_c4_3e9d_return_output,
 BIN_OP_AND_uxn_c_l210_c4_91a0_return_output,
 BIN_OP_OR_uxn_c_l211_c4_c089_return_output,
 CONST_SL_8_uxn_c_l214_c4_00a2_return_output,
 BIN_OP_AND_uxn_c_l215_c4_7ceb_return_output,
 BIN_OP_OR_uxn_c_l216_c4_2653_return_output,
 BIN_OP_EQ_uxn_c_l218_c12_e7c1_return_output,
 color_MUX_uxn_c_l218_c8_24cb_return_output,
 CONST_SL_8_uxn_c_l220_c4_d100_return_output,
 BIN_OP_AND_uxn_c_l221_c4_e012_return_output,
 BIN_OP_OR_uxn_c_l222_c4_9126_return_output,
 CONST_SL_8_uxn_c_l225_c4_a6e2_return_output,
 BIN_OP_AND_uxn_c_l226_c4_82f7_return_output,
 BIN_OP_OR_uxn_c_l227_c4_4869_return_output,
 BIN_OP_EQ_uxn_c_l229_c12_53e8_return_output,
 color_MUX_uxn_c_l229_c8_d97f_return_output,
 CONST_SL_4_uxn_c_l231_c4_e76f_return_output,
 BIN_OP_AND_uxn_c_l232_c4_1cc0_return_output,
 BIN_OP_OR_uxn_c_l233_c4_1f74_return_output,
 CONST_SL_4_uxn_c_l236_c4_7402_return_output,
 BIN_OP_AND_uxn_c_l237_c4_750e_return_output,
 BIN_OP_OR_uxn_c_l238_c4_025b_return_output,
 BIN_OP_EQ_uxn_c_l240_c12_1ef4_return_output,
 color_MUX_uxn_c_l240_c8_4f51_return_output,
 CONST_SL_4_uxn_c_l242_c4_00b9_return_output,
 BIN_OP_AND_uxn_c_l243_c4_9b4d_return_output,
 BIN_OP_OR_uxn_c_l244_c4_d1ac_return_output,
 CONST_SL_4_uxn_c_l247_c4_1c82_return_output,
 BIN_OP_AND_uxn_c_l248_c4_ffe4_return_output,
 BIN_OP_OR_uxn_c_l249_c4_152a_return_output,
 BIN_OP_EQ_uxn_c_l251_c12_2a8a_return_output,
 color_MUX_uxn_c_l251_c8_fab5_return_output,
 BIN_OP_AND_uxn_c_l253_c4_b356_return_output,
 BIN_OP_OR_uxn_c_l254_c4_5dc7_return_output,
 BIN_OP_AND_uxn_c_l257_c4_c15b_return_output,
 BIN_OP_OR_uxn_c_l258_c4_2632_return_output,
 BIN_OP_EQ_uxn_c_l260_c12_caf4_return_output,
 color_2_MUX_uxn_c_l260_c8_e38e_return_output,
 color_3_MUX_uxn_c_l260_c8_e38e_return_output,
 BIN_OP_AND_uxn_c_l262_c4_5f6e_return_output,
 BIN_OP_OR_uxn_c_l263_c4_7659_return_output,
 BIN_OP_AND_uxn_c_l266_c4_4c95_return_output,
 BIN_OP_OR_uxn_c_l267_c4_6cca_return_output,
 VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l271_c20_a42b_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_device_ram_address : unsigned(7 downto 0);
 variable VAR_device_ram_value : unsigned(7 downto 0);
 variable VAR_is_device_ram_write : unsigned(0 downto 0);
 variable VAR_gpu_step_color : unsigned(1 downto 0);
 variable VAR_is_palette_range : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l199_c30_856d_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_4_uxn_c_l199_c30_59d6_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l199_c30_d7aa_left : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_c_l199_c30_59d6_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l199_c30_d7aa_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l199_c30_d7aa_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l199_c30_856d_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l199_c30_856d_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l199_c30_856d_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l201_c6_d6a3_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l201_c6_d6a3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l201_c6_d6a3_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_c_l201_c2_11e6_iftrue : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l207_c3_7584_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l201_c2_11e6_iffalse : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l201_c2_11e6_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l201_c2_11e6_cond : unsigned(0 downto 0);
 variable VAR_tmp12 : unsigned(11 downto 0);
 variable VAR_addr_low : unsigned(3 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_c_l203_c22_546b_return_output : unsigned(3 downto 0);
 variable VAR_color_cmp_0 : unsigned(3 downto 0);
 variable VAR_color_cmp_0_uxn_c_l204_c11_8d6a_0 : unsigned(3 downto 0);
 variable VAR_CONST_SR_4_uxn_c_l204_c35_8eb0_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_c_l204_c35_8eb0_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_c_l204_c25_5ba7_return_output : unsigned(3 downto 0);
 variable VAR_color_cmp_1 : unsigned(3 downto 0);
 variable VAR_color_cmp_1_uxn_c_l205_c11_72e8_0 : unsigned(3 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_c_l205_c25_3485_return_output : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l207_c7_05eb_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l207_c7_05eb_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l207_c7_05eb_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_c_l207_c3_7584_iftrue : uint12_t_4;
 variable VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l207_c3_7584_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l207_c3_7584_iffalse : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l218_c8_24cb_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l207_c3_7584_cond : unsigned(0 downto 0);
 variable VAR_tmp12_uxn_c_l208_c4_8d1b : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l209_c4_3e9d_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l209_c4_3e9d_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l210_c4_91a0_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l210_c4_91a0_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l210_c4_91a0_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l211_c4_c089_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l211_c4_c089_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l211_c4_c089_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_uxn_c_l213_c4_6946 : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l214_c4_00a2_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l214_c4_00a2_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l215_c4_7ceb_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l215_c4_7ceb_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l215_c4_7ceb_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l216_c4_2653_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l216_c4_2653_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l216_c4_2653_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l218_c12_e7c1_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l218_c12_e7c1_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l218_c12_e7c1_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_c_l218_c8_24cb_iftrue : uint12_t_4;
 variable VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l218_c8_24cb_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l218_c8_24cb_iffalse : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l229_c8_d97f_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l218_c8_24cb_cond : unsigned(0 downto 0);
 variable VAR_tmp12_uxn_c_l219_c4_ce32 : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l220_c4_d100_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l220_c4_d100_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l221_c4_e012_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l221_c4_e012_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l221_c4_e012_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l222_c4_9126_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l222_c4_9126_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l222_c4_9126_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_uxn_c_l224_c4_955f : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l225_c4_a6e2_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l225_c4_a6e2_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l226_c4_82f7_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l226_c4_82f7_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l226_c4_82f7_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l227_c4_4869_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l227_c4_4869_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l227_c4_4869_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l229_c12_53e8_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l229_c12_53e8_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l229_c12_53e8_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_c_l229_c8_d97f_iftrue : uint12_t_4;
 variable VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l229_c8_d97f_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l229_c8_d97f_iffalse : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l240_c8_4f51_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l229_c8_d97f_cond : unsigned(0 downto 0);
 variable VAR_tmp12_uxn_c_l230_c4_2afa : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l231_c4_e76f_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l231_c4_e76f_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l232_c4_1cc0_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l232_c4_1cc0_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l232_c4_1cc0_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l233_c4_1f74_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l233_c4_1f74_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l233_c4_1f74_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_uxn_c_l235_c4_d664 : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l236_c4_7402_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l236_c4_7402_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l237_c4_750e_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l237_c4_750e_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l237_c4_750e_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l238_c4_025b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l238_c4_025b_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l238_c4_025b_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l240_c12_1ef4_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l240_c12_1ef4_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l240_c12_1ef4_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_c_l240_c8_4f51_iftrue : uint12_t_4;
 variable VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l240_c8_4f51_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l240_c8_4f51_iffalse : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l251_c8_fab5_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l240_c8_4f51_cond : unsigned(0 downto 0);
 variable VAR_tmp12_uxn_c_l241_c4_f6c5 : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l242_c4_00b9_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l242_c4_00b9_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l243_c4_9b4d_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l243_c4_9b4d_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l243_c4_9b4d_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l244_c4_d1ac_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l244_c4_d1ac_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l244_c4_d1ac_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_uxn_c_l246_c4_e772 : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l247_c4_1c82_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l247_c4_1c82_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l248_c4_ffe4_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l248_c4_ffe4_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l248_c4_ffe4_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l249_c4_152a_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l249_c4_152a_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l249_c4_152a_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l251_c12_2a8a_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l251_c12_2a8a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l251_c12_2a8a_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_c_l251_c8_fab5_iftrue : uint12_t_4;
 variable VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l251_c8_fab5_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l251_c8_fab5_iffalse : uint12_t_4;
 variable VAR_color_FALSE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l251_c8_fab5_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l251_c8_fab5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l253_c4_b356_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l253_c4_b356_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l253_c4_b356_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l254_c4_5dc7_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l254_c4_5dc7_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l254_c4_5dc7_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l257_c4_c15b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l257_c4_c15b_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l257_c4_c15b_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l258_c4_2632_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l258_c4_2632_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l258_c4_2632_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l260_c12_caf4_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l260_c12_caf4_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l260_c12_caf4_return_output : unsigned(0 downto 0);
 variable VAR_color_2_MUX_uxn_c_l260_c8_e38e_iftrue : unsigned(11 downto 0);
 variable VAR_color_2_MUX_uxn_c_l260_c8_e38e_iffalse : unsigned(11 downto 0);
 variable VAR_color_2_MUX_uxn_c_l260_c8_e38e_return_output : unsigned(11 downto 0);
 variable VAR_color_2_MUX_uxn_c_l260_c8_e38e_cond : unsigned(0 downto 0);
 variable VAR_color_3_MUX_uxn_c_l260_c8_e38e_iftrue : unsigned(11 downto 0);
 variable VAR_color_3_MUX_uxn_c_l260_c8_e38e_iffalse : unsigned(11 downto 0);
 variable VAR_color_3_MUX_uxn_c_l260_c8_e38e_return_output : unsigned(11 downto 0);
 variable VAR_color_3_MUX_uxn_c_l260_c8_e38e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l262_c4_5f6e_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l262_c4_5f6e_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l262_c4_5f6e_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l263_c4_7659_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l263_c4_7659_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l263_c4_7659_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l266_c4_4c95_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l266_c4_4c95_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l266_c4_4c95_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l267_c4_6cca_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l267_c4_6cca_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l267_c4_6cca_return_output : unsigned(11 downto 0);
 variable VAR_result : unsigned(15 downto 0);
 variable VAR_result_uxn_c_l271_c11_825c_0 : unsigned(15 downto 0);
 variable VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l271_c20_a42b_var_dim_0 : unsigned(1 downto 0);
 variable VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l271_c20_a42b_return_output : unsigned(11 downto 0);
 variable VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l271_c20_a42b_ref_toks_0 : uint12_t_4;
 variable VAR_CONST_REF_RD_uint12_t_uint12_t_4_0_d41d_uxn_c_l210_l232_l253_DUPLICATE_8079_return_output : unsigned(11 downto 0);
 variable VAR_CONST_REF_RD_uint12_t_uint12_t_4_1_d41d_uxn_c_l257_l237_l215_DUPLICATE_dfa4_return_output : unsigned(11 downto 0);
 variable VAR_CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_uxn_c_l221_l260_l243_l262_DUPLICATE_05c4_return_output : unsigned(11 downto 0);
 variable VAR_CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_uxn_c_l248_l260_l226_l266_DUPLICATE_20bb_return_output : unsigned(11 downto 0);
 variable VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l252_l261_DUPLICATE_0605_return_output : unsigned(11 downto 0);
 variable VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l265_l256_DUPLICATE_1bda_return_output : unsigned(11 downto 0);
 -- State registers comb logic variables
variable REG_VAR_color : uint12_t_4;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_color := color;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_c_l229_c12_53e8_right := to_unsigned(10, 4);
     VAR_BIN_OP_AND_uxn_c_l266_c4_4c95_right := to_unsigned(4080, 12);
     VAR_MUX_uxn_c_l199_c30_856d_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_c_l257_c4_c15b_right := to_unsigned(4080, 12);
     VAR_BIN_OP_EQ_uxn_c_l218_c12_e7c1_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_c_l260_c12_caf4_right := to_unsigned(13, 4);
     VAR_MUX_uxn_c_l199_c30_856d_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_c_l262_c4_5f6e_right := to_unsigned(4080, 12);
     VAR_BIN_OP_AND_uxn_c_l221_c4_e012_right := to_unsigned(255, 12);
     VAR_BIN_OP_AND_uxn_c_l253_c4_b356_right := to_unsigned(4080, 12);
     VAR_BIN_OP_AND_uxn_c_l243_c4_9b4d_right := to_unsigned(3855, 12);
     VAR_BIN_OP_AND_uxn_c_l226_c4_82f7_right := to_unsigned(255, 12);
     VAR_BIN_OP_AND_uxn_c_l237_c4_750e_right := to_unsigned(3855, 12);
     VAR_BIN_OP_EQ_uxn_c_l251_c12_2a8a_right := to_unsigned(12, 4);
     VAR_BIN_OP_EQ_uxn_c_l207_c7_05eb_right := to_unsigned(8, 4);
     VAR_BIN_OP_AND_uxn_c_l210_c4_91a0_right := to_unsigned(255, 12);
     VAR_BIN_OP_AND_uxn_c_l248_c4_ffe4_right := to_unsigned(3855, 12);
     VAR_BIN_OP_EQ_uxn_c_l240_c12_1ef4_right := to_unsigned(11, 4);
     VAR_BIN_OP_AND_uxn_c_l215_c4_7ceb_right := to_unsigned(255, 12);
     VAR_BIN_OP_AND_uxn_c_l232_c4_1cc0_right := to_unsigned(3855, 12);
     VAR_BIN_OP_EQ_uxn_c_l199_c30_d7aa_right := to_unsigned(0, 1);

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
     VAR_color_MUX_uxn_c_l201_c2_11e6_iffalse := color;
     VAR_CONST_SR_4_uxn_c_l199_c30_59d6_x := VAR_device_ram_address;
     VAR_CONST_SR_4_uxn_c_l204_c35_8eb0_x := VAR_device_ram_value;
     VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l271_c20_a42b_var_dim_0 := VAR_gpu_step_color;
     VAR_BIN_OP_AND_uxn_c_l201_c6_d6a3_left := VAR_is_device_ram_write;
     -- CONST_REF_RD_uint12_t_uint12_t_4_1_d41d_uxn_c_l257_l237_l215_DUPLICATE_dfa4 LATENCY=0
     VAR_CONST_REF_RD_uint12_t_uint12_t_4_1_d41d_uxn_c_l257_l237_l215_DUPLICATE_dfa4_return_output := color(1);

     -- CAST_TO_uint4_t[uxn_c_l205_c25_3485] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_c_l205_c25_3485_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_device_ram_value);

     -- CAST_TO_uint4_t[uxn_c_l203_c22_546b] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_c_l203_c22_546b_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_device_ram_address);

     -- CONST_SR_4[uxn_c_l204_c35_8eb0] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_c_l204_c35_8eb0_x <= VAR_CONST_SR_4_uxn_c_l204_c35_8eb0_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_c_l204_c35_8eb0_return_output := CONST_SR_4_uxn_c_l204_c35_8eb0_return_output;

     -- CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_uxn_c_l221_l260_l243_l262_DUPLICATE_05c4 LATENCY=0
     VAR_CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_uxn_c_l221_l260_l243_l262_DUPLICATE_05c4_return_output := color(2);

     -- CONST_SR_4[uxn_c_l199_c30_59d6] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_c_l199_c30_59d6_x <= VAR_CONST_SR_4_uxn_c_l199_c30_59d6_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_c_l199_c30_59d6_return_output := CONST_SR_4_uxn_c_l199_c30_59d6_return_output;

     -- CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_uxn_c_l248_l260_l226_l266_DUPLICATE_20bb LATENCY=0
     VAR_CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_uxn_c_l248_l260_l226_l266_DUPLICATE_20bb_return_output := color(3);

     -- CONST_REF_RD_uint12_t_uint12_t_4_0_d41d_uxn_c_l210_l232_l253_DUPLICATE_8079 LATENCY=0
     VAR_CONST_REF_RD_uint12_t_uint12_t_4_0_d41d_uxn_c_l210_l232_l253_DUPLICATE_8079_return_output := color(0);

     -- Submodule level 1
     VAR_BIN_OP_EQ_uxn_c_l207_c7_05eb_left := VAR_CAST_TO_uint4_t_uxn_c_l203_c22_546b_return_output;
     VAR_BIN_OP_EQ_uxn_c_l218_c12_e7c1_left := VAR_CAST_TO_uint4_t_uxn_c_l203_c22_546b_return_output;
     VAR_BIN_OP_EQ_uxn_c_l229_c12_53e8_left := VAR_CAST_TO_uint4_t_uxn_c_l203_c22_546b_return_output;
     VAR_BIN_OP_EQ_uxn_c_l240_c12_1ef4_left := VAR_CAST_TO_uint4_t_uxn_c_l203_c22_546b_return_output;
     VAR_BIN_OP_EQ_uxn_c_l251_c12_2a8a_left := VAR_CAST_TO_uint4_t_uxn_c_l203_c22_546b_return_output;
     VAR_BIN_OP_EQ_uxn_c_l260_c12_caf4_left := VAR_CAST_TO_uint4_t_uxn_c_l203_c22_546b_return_output;
     VAR_color_cmp_1_uxn_c_l205_c11_72e8_0 := VAR_CAST_TO_uint4_t_uxn_c_l205_c25_3485_return_output;
     VAR_BIN_OP_AND_uxn_c_l210_c4_91a0_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_0_d41d_uxn_c_l210_l232_l253_DUPLICATE_8079_return_output;
     VAR_BIN_OP_AND_uxn_c_l232_c4_1cc0_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_0_d41d_uxn_c_l210_l232_l253_DUPLICATE_8079_return_output;
     VAR_BIN_OP_AND_uxn_c_l253_c4_b356_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_0_d41d_uxn_c_l210_l232_l253_DUPLICATE_8079_return_output;
     VAR_BIN_OP_AND_uxn_c_l215_c4_7ceb_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_1_d41d_uxn_c_l257_l237_l215_DUPLICATE_dfa4_return_output;
     VAR_BIN_OP_AND_uxn_c_l237_c4_750e_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_1_d41d_uxn_c_l257_l237_l215_DUPLICATE_dfa4_return_output;
     VAR_BIN_OP_AND_uxn_c_l257_c4_c15b_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_1_d41d_uxn_c_l257_l237_l215_DUPLICATE_dfa4_return_output;
     VAR_BIN_OP_AND_uxn_c_l221_c4_e012_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_uxn_c_l221_l260_l243_l262_DUPLICATE_05c4_return_output;
     VAR_BIN_OP_AND_uxn_c_l243_c4_9b4d_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_uxn_c_l221_l260_l243_l262_DUPLICATE_05c4_return_output;
     VAR_BIN_OP_AND_uxn_c_l262_c4_5f6e_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_uxn_c_l221_l260_l243_l262_DUPLICATE_05c4_return_output;
     VAR_color_2_MUX_uxn_c_l260_c8_e38e_iffalse := VAR_CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_uxn_c_l221_l260_l243_l262_DUPLICATE_05c4_return_output;
     VAR_BIN_OP_AND_uxn_c_l226_c4_82f7_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_uxn_c_l248_l260_l226_l266_DUPLICATE_20bb_return_output;
     VAR_BIN_OP_AND_uxn_c_l248_c4_ffe4_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_uxn_c_l248_l260_l226_l266_DUPLICATE_20bb_return_output;
     VAR_BIN_OP_AND_uxn_c_l266_c4_4c95_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_uxn_c_l248_l260_l226_l266_DUPLICATE_20bb_return_output;
     VAR_color_3_MUX_uxn_c_l260_c8_e38e_iffalse := VAR_CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_uxn_c_l248_l260_l226_l266_DUPLICATE_20bb_return_output;
     VAR_BIN_OP_EQ_uxn_c_l199_c30_d7aa_left := VAR_CONST_SR_4_uxn_c_l199_c30_59d6_return_output;
     VAR_tmp12_uxn_c_l213_c4_6946 := resize(VAR_color_cmp_1_uxn_c_l205_c11_72e8_0, 12);
     VAR_tmp12_uxn_c_l224_c4_955f := resize(VAR_color_cmp_1_uxn_c_l205_c11_72e8_0, 12);
     VAR_tmp12_uxn_c_l235_c4_d664 := resize(VAR_color_cmp_1_uxn_c_l205_c11_72e8_0, 12);
     VAR_tmp12_uxn_c_l246_c4_e772 := resize(VAR_color_cmp_1_uxn_c_l205_c11_72e8_0, 12);
     VAR_CONST_SL_8_uxn_c_l214_c4_00a2_x := VAR_tmp12_uxn_c_l213_c4_6946;
     VAR_CONST_SL_8_uxn_c_l225_c4_a6e2_x := VAR_tmp12_uxn_c_l224_c4_955f;
     VAR_CONST_SL_4_uxn_c_l236_c4_7402_x := VAR_tmp12_uxn_c_l235_c4_d664;
     VAR_CONST_SL_4_uxn_c_l247_c4_1c82_x := VAR_tmp12_uxn_c_l246_c4_e772;
     -- BIN_OP_AND[uxn_c_l237_c4_750e] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l237_c4_750e_left <= VAR_BIN_OP_AND_uxn_c_l237_c4_750e_left;
     BIN_OP_AND_uxn_c_l237_c4_750e_right <= VAR_BIN_OP_AND_uxn_c_l237_c4_750e_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l237_c4_750e_return_output := BIN_OP_AND_uxn_c_l237_c4_750e_return_output;

     -- BIN_OP_EQ[uxn_c_l229_c12_53e8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l229_c12_53e8_left <= VAR_BIN_OP_EQ_uxn_c_l229_c12_53e8_left;
     BIN_OP_EQ_uxn_c_l229_c12_53e8_right <= VAR_BIN_OP_EQ_uxn_c_l229_c12_53e8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l229_c12_53e8_return_output := BIN_OP_EQ_uxn_c_l229_c12_53e8_return_output;

     -- CAST_TO_uint4_t[uxn_c_l204_c25_5ba7] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_c_l204_c25_5ba7_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_CONST_SR_4_uxn_c_l204_c35_8eb0_return_output);

     -- CONST_SL_8[uxn_c_l225_c4_a6e2] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l225_c4_a6e2_x <= VAR_CONST_SL_8_uxn_c_l225_c4_a6e2_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l225_c4_a6e2_return_output := CONST_SL_8_uxn_c_l225_c4_a6e2_return_output;

     -- BIN_OP_EQ[uxn_c_l207_c7_05eb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l207_c7_05eb_left <= VAR_BIN_OP_EQ_uxn_c_l207_c7_05eb_left;
     BIN_OP_EQ_uxn_c_l207_c7_05eb_right <= VAR_BIN_OP_EQ_uxn_c_l207_c7_05eb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l207_c7_05eb_return_output := BIN_OP_EQ_uxn_c_l207_c7_05eb_return_output;

     -- BIN_OP_AND[uxn_c_l215_c4_7ceb] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l215_c4_7ceb_left <= VAR_BIN_OP_AND_uxn_c_l215_c4_7ceb_left;
     BIN_OP_AND_uxn_c_l215_c4_7ceb_right <= VAR_BIN_OP_AND_uxn_c_l215_c4_7ceb_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l215_c4_7ceb_return_output := BIN_OP_AND_uxn_c_l215_c4_7ceb_return_output;

     -- CONST_SL_4[uxn_c_l247_c4_1c82] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_c_l247_c4_1c82_x <= VAR_CONST_SL_4_uxn_c_l247_c4_1c82_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_c_l247_c4_1c82_return_output := CONST_SL_4_uxn_c_l247_c4_1c82_return_output;

     -- BIN_OP_EQ[uxn_c_l218_c12_e7c1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l218_c12_e7c1_left <= VAR_BIN_OP_EQ_uxn_c_l218_c12_e7c1_left;
     BIN_OP_EQ_uxn_c_l218_c12_e7c1_right <= VAR_BIN_OP_EQ_uxn_c_l218_c12_e7c1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l218_c12_e7c1_return_output := BIN_OP_EQ_uxn_c_l218_c12_e7c1_return_output;

     -- CAST_TO_uint12_t_uint4_t_uxn_c_l265_l256_DUPLICATE_1bda LATENCY=0
     VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l265_l256_DUPLICATE_1bda_return_output := CAST_TO_uint12_t_uint4_t(
     VAR_color_cmp_1_uxn_c_l205_c11_72e8_0);

     -- BIN_OP_AND[uxn_c_l210_c4_91a0] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l210_c4_91a0_left <= VAR_BIN_OP_AND_uxn_c_l210_c4_91a0_left;
     BIN_OP_AND_uxn_c_l210_c4_91a0_right <= VAR_BIN_OP_AND_uxn_c_l210_c4_91a0_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l210_c4_91a0_return_output := BIN_OP_AND_uxn_c_l210_c4_91a0_return_output;

     -- BIN_OP_AND[uxn_c_l266_c4_4c95] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l266_c4_4c95_left <= VAR_BIN_OP_AND_uxn_c_l266_c4_4c95_left;
     BIN_OP_AND_uxn_c_l266_c4_4c95_right <= VAR_BIN_OP_AND_uxn_c_l266_c4_4c95_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l266_c4_4c95_return_output := BIN_OP_AND_uxn_c_l266_c4_4c95_return_output;

     -- BIN_OP_EQ[uxn_c_l260_c12_caf4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l260_c12_caf4_left <= VAR_BIN_OP_EQ_uxn_c_l260_c12_caf4_left;
     BIN_OP_EQ_uxn_c_l260_c12_caf4_right <= VAR_BIN_OP_EQ_uxn_c_l260_c12_caf4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l260_c12_caf4_return_output := BIN_OP_EQ_uxn_c_l260_c12_caf4_return_output;

     -- BIN_OP_AND[uxn_c_l257_c4_c15b] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l257_c4_c15b_left <= VAR_BIN_OP_AND_uxn_c_l257_c4_c15b_left;
     BIN_OP_AND_uxn_c_l257_c4_c15b_right <= VAR_BIN_OP_AND_uxn_c_l257_c4_c15b_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l257_c4_c15b_return_output := BIN_OP_AND_uxn_c_l257_c4_c15b_return_output;

     -- BIN_OP_AND[uxn_c_l232_c4_1cc0] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l232_c4_1cc0_left <= VAR_BIN_OP_AND_uxn_c_l232_c4_1cc0_left;
     BIN_OP_AND_uxn_c_l232_c4_1cc0_right <= VAR_BIN_OP_AND_uxn_c_l232_c4_1cc0_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l232_c4_1cc0_return_output := BIN_OP_AND_uxn_c_l232_c4_1cc0_return_output;

     -- CONST_SL_4[uxn_c_l236_c4_7402] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_c_l236_c4_7402_x <= VAR_CONST_SL_4_uxn_c_l236_c4_7402_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_c_l236_c4_7402_return_output := CONST_SL_4_uxn_c_l236_c4_7402_return_output;

     -- BIN_OP_EQ[uxn_c_l199_c30_d7aa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l199_c30_d7aa_left <= VAR_BIN_OP_EQ_uxn_c_l199_c30_d7aa_left;
     BIN_OP_EQ_uxn_c_l199_c30_d7aa_right <= VAR_BIN_OP_EQ_uxn_c_l199_c30_d7aa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l199_c30_d7aa_return_output := BIN_OP_EQ_uxn_c_l199_c30_d7aa_return_output;

     -- BIN_OP_AND[uxn_c_l221_c4_e012] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l221_c4_e012_left <= VAR_BIN_OP_AND_uxn_c_l221_c4_e012_left;
     BIN_OP_AND_uxn_c_l221_c4_e012_right <= VAR_BIN_OP_AND_uxn_c_l221_c4_e012_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l221_c4_e012_return_output := BIN_OP_AND_uxn_c_l221_c4_e012_return_output;

     -- BIN_OP_AND[uxn_c_l226_c4_82f7] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l226_c4_82f7_left <= VAR_BIN_OP_AND_uxn_c_l226_c4_82f7_left;
     BIN_OP_AND_uxn_c_l226_c4_82f7_right <= VAR_BIN_OP_AND_uxn_c_l226_c4_82f7_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l226_c4_82f7_return_output := BIN_OP_AND_uxn_c_l226_c4_82f7_return_output;

     -- BIN_OP_EQ[uxn_c_l251_c12_2a8a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l251_c12_2a8a_left <= VAR_BIN_OP_EQ_uxn_c_l251_c12_2a8a_left;
     BIN_OP_EQ_uxn_c_l251_c12_2a8a_right <= VAR_BIN_OP_EQ_uxn_c_l251_c12_2a8a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l251_c12_2a8a_return_output := BIN_OP_EQ_uxn_c_l251_c12_2a8a_return_output;

     -- BIN_OP_AND[uxn_c_l262_c4_5f6e] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l262_c4_5f6e_left <= VAR_BIN_OP_AND_uxn_c_l262_c4_5f6e_left;
     BIN_OP_AND_uxn_c_l262_c4_5f6e_right <= VAR_BIN_OP_AND_uxn_c_l262_c4_5f6e_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l262_c4_5f6e_return_output := BIN_OP_AND_uxn_c_l262_c4_5f6e_return_output;

     -- BIN_OP_AND[uxn_c_l248_c4_ffe4] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l248_c4_ffe4_left <= VAR_BIN_OP_AND_uxn_c_l248_c4_ffe4_left;
     BIN_OP_AND_uxn_c_l248_c4_ffe4_right <= VAR_BIN_OP_AND_uxn_c_l248_c4_ffe4_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l248_c4_ffe4_return_output := BIN_OP_AND_uxn_c_l248_c4_ffe4_return_output;

     -- BIN_OP_AND[uxn_c_l253_c4_b356] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l253_c4_b356_left <= VAR_BIN_OP_AND_uxn_c_l253_c4_b356_left;
     BIN_OP_AND_uxn_c_l253_c4_b356_right <= VAR_BIN_OP_AND_uxn_c_l253_c4_b356_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l253_c4_b356_return_output := BIN_OP_AND_uxn_c_l253_c4_b356_return_output;

     -- BIN_OP_AND[uxn_c_l243_c4_9b4d] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l243_c4_9b4d_left <= VAR_BIN_OP_AND_uxn_c_l243_c4_9b4d_left;
     BIN_OP_AND_uxn_c_l243_c4_9b4d_right <= VAR_BIN_OP_AND_uxn_c_l243_c4_9b4d_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l243_c4_9b4d_return_output := BIN_OP_AND_uxn_c_l243_c4_9b4d_return_output;

     -- CONST_SL_8[uxn_c_l214_c4_00a2] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l214_c4_00a2_x <= VAR_CONST_SL_8_uxn_c_l214_c4_00a2_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l214_c4_00a2_return_output := CONST_SL_8_uxn_c_l214_c4_00a2_return_output;

     -- BIN_OP_EQ[uxn_c_l240_c12_1ef4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l240_c12_1ef4_left <= VAR_BIN_OP_EQ_uxn_c_l240_c12_1ef4_left;
     BIN_OP_EQ_uxn_c_l240_c12_1ef4_right <= VAR_BIN_OP_EQ_uxn_c_l240_c12_1ef4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l240_c12_1ef4_return_output := BIN_OP_EQ_uxn_c_l240_c12_1ef4_return_output;

     -- Submodule level 2
     VAR_BIN_OP_OR_uxn_c_l211_c4_c089_left := VAR_BIN_OP_AND_uxn_c_l210_c4_91a0_return_output;
     VAR_BIN_OP_OR_uxn_c_l216_c4_2653_left := VAR_BIN_OP_AND_uxn_c_l215_c4_7ceb_return_output;
     VAR_BIN_OP_OR_uxn_c_l222_c4_9126_left := VAR_BIN_OP_AND_uxn_c_l221_c4_e012_return_output;
     VAR_BIN_OP_OR_uxn_c_l227_c4_4869_left := VAR_BIN_OP_AND_uxn_c_l226_c4_82f7_return_output;
     VAR_BIN_OP_OR_uxn_c_l233_c4_1f74_left := VAR_BIN_OP_AND_uxn_c_l232_c4_1cc0_return_output;
     VAR_BIN_OP_OR_uxn_c_l238_c4_025b_left := VAR_BIN_OP_AND_uxn_c_l237_c4_750e_return_output;
     VAR_BIN_OP_OR_uxn_c_l244_c4_d1ac_left := VAR_BIN_OP_AND_uxn_c_l243_c4_9b4d_return_output;
     VAR_BIN_OP_OR_uxn_c_l249_c4_152a_left := VAR_BIN_OP_AND_uxn_c_l248_c4_ffe4_return_output;
     VAR_BIN_OP_OR_uxn_c_l254_c4_5dc7_left := VAR_BIN_OP_AND_uxn_c_l253_c4_b356_return_output;
     VAR_BIN_OP_OR_uxn_c_l258_c4_2632_left := VAR_BIN_OP_AND_uxn_c_l257_c4_c15b_return_output;
     VAR_BIN_OP_OR_uxn_c_l263_c4_7659_left := VAR_BIN_OP_AND_uxn_c_l262_c4_5f6e_return_output;
     VAR_BIN_OP_OR_uxn_c_l267_c4_6cca_left := VAR_BIN_OP_AND_uxn_c_l266_c4_4c95_return_output;
     VAR_MUX_uxn_c_l199_c30_856d_cond := VAR_BIN_OP_EQ_uxn_c_l199_c30_d7aa_return_output;
     VAR_color_MUX_uxn_c_l207_c3_7584_cond := VAR_BIN_OP_EQ_uxn_c_l207_c7_05eb_return_output;
     VAR_color_MUX_uxn_c_l218_c8_24cb_cond := VAR_BIN_OP_EQ_uxn_c_l218_c12_e7c1_return_output;
     VAR_color_MUX_uxn_c_l229_c8_d97f_cond := VAR_BIN_OP_EQ_uxn_c_l229_c12_53e8_return_output;
     VAR_color_MUX_uxn_c_l240_c8_4f51_cond := VAR_BIN_OP_EQ_uxn_c_l240_c12_1ef4_return_output;
     VAR_color_MUX_uxn_c_l251_c8_fab5_cond := VAR_BIN_OP_EQ_uxn_c_l251_c12_2a8a_return_output;
     VAR_color_2_MUX_uxn_c_l260_c8_e38e_cond := VAR_BIN_OP_EQ_uxn_c_l260_c12_caf4_return_output;
     VAR_color_3_MUX_uxn_c_l260_c8_e38e_cond := VAR_BIN_OP_EQ_uxn_c_l260_c12_caf4_return_output;
     VAR_BIN_OP_OR_uxn_c_l258_c4_2632_right := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l265_l256_DUPLICATE_1bda_return_output;
     VAR_BIN_OP_OR_uxn_c_l267_c4_6cca_right := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l265_l256_DUPLICATE_1bda_return_output;
     VAR_color_cmp_0_uxn_c_l204_c11_8d6a_0 := VAR_CAST_TO_uint4_t_uxn_c_l204_c25_5ba7_return_output;
     VAR_BIN_OP_OR_uxn_c_l238_c4_025b_right := VAR_CONST_SL_4_uxn_c_l236_c4_7402_return_output;
     VAR_BIN_OP_OR_uxn_c_l249_c4_152a_right := VAR_CONST_SL_4_uxn_c_l247_c4_1c82_return_output;
     VAR_BIN_OP_OR_uxn_c_l216_c4_2653_right := VAR_CONST_SL_8_uxn_c_l214_c4_00a2_return_output;
     VAR_BIN_OP_OR_uxn_c_l227_c4_4869_right := VAR_CONST_SL_8_uxn_c_l225_c4_a6e2_return_output;
     VAR_tmp12_uxn_c_l208_c4_8d1b := resize(VAR_color_cmp_0_uxn_c_l204_c11_8d6a_0, 12);
     VAR_tmp12_uxn_c_l219_c4_ce32 := resize(VAR_color_cmp_0_uxn_c_l204_c11_8d6a_0, 12);
     VAR_tmp12_uxn_c_l230_c4_2afa := resize(VAR_color_cmp_0_uxn_c_l204_c11_8d6a_0, 12);
     VAR_tmp12_uxn_c_l241_c4_f6c5 := resize(VAR_color_cmp_0_uxn_c_l204_c11_8d6a_0, 12);
     VAR_CONST_SL_8_uxn_c_l209_c4_3e9d_x := VAR_tmp12_uxn_c_l208_c4_8d1b;
     VAR_CONST_SL_8_uxn_c_l220_c4_d100_x := VAR_tmp12_uxn_c_l219_c4_ce32;
     VAR_CONST_SL_4_uxn_c_l231_c4_e76f_x := VAR_tmp12_uxn_c_l230_c4_2afa;
     VAR_CONST_SL_4_uxn_c_l242_c4_00b9_x := VAR_tmp12_uxn_c_l241_c4_f6c5;
     -- CONST_SL_4[uxn_c_l231_c4_e76f] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_c_l231_c4_e76f_x <= VAR_CONST_SL_4_uxn_c_l231_c4_e76f_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_c_l231_c4_e76f_return_output := CONST_SL_4_uxn_c_l231_c4_e76f_return_output;

     -- CONST_SL_4[uxn_c_l242_c4_00b9] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_c_l242_c4_00b9_x <= VAR_CONST_SL_4_uxn_c_l242_c4_00b9_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_c_l242_c4_00b9_return_output := CONST_SL_4_uxn_c_l242_c4_00b9_return_output;

     -- MUX[uxn_c_l199_c30_856d] LATENCY=0
     -- Inputs
     MUX_uxn_c_l199_c30_856d_cond <= VAR_MUX_uxn_c_l199_c30_856d_cond;
     MUX_uxn_c_l199_c30_856d_iftrue <= VAR_MUX_uxn_c_l199_c30_856d_iftrue;
     MUX_uxn_c_l199_c30_856d_iffalse <= VAR_MUX_uxn_c_l199_c30_856d_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l199_c30_856d_return_output := MUX_uxn_c_l199_c30_856d_return_output;

     -- BIN_OP_OR[uxn_c_l216_c4_2653] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l216_c4_2653_left <= VAR_BIN_OP_OR_uxn_c_l216_c4_2653_left;
     BIN_OP_OR_uxn_c_l216_c4_2653_right <= VAR_BIN_OP_OR_uxn_c_l216_c4_2653_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l216_c4_2653_return_output := BIN_OP_OR_uxn_c_l216_c4_2653_return_output;

     -- CONST_SL_8[uxn_c_l209_c4_3e9d] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l209_c4_3e9d_x <= VAR_CONST_SL_8_uxn_c_l209_c4_3e9d_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l209_c4_3e9d_return_output := CONST_SL_8_uxn_c_l209_c4_3e9d_return_output;

     -- CONST_SL_8[uxn_c_l220_c4_d100] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l220_c4_d100_x <= VAR_CONST_SL_8_uxn_c_l220_c4_d100_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l220_c4_d100_return_output := CONST_SL_8_uxn_c_l220_c4_d100_return_output;

     -- BIN_OP_OR[uxn_c_l227_c4_4869] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l227_c4_4869_left <= VAR_BIN_OP_OR_uxn_c_l227_c4_4869_left;
     BIN_OP_OR_uxn_c_l227_c4_4869_right <= VAR_BIN_OP_OR_uxn_c_l227_c4_4869_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l227_c4_4869_return_output := BIN_OP_OR_uxn_c_l227_c4_4869_return_output;

     -- CAST_TO_uint12_t_uint4_t_uxn_c_l252_l261_DUPLICATE_0605 LATENCY=0
     VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l252_l261_DUPLICATE_0605_return_output := CAST_TO_uint12_t_uint4_t(
     VAR_color_cmp_0_uxn_c_l204_c11_8d6a_0);

     -- BIN_OP_OR[uxn_c_l267_c4_6cca] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l267_c4_6cca_left <= VAR_BIN_OP_OR_uxn_c_l267_c4_6cca_left;
     BIN_OP_OR_uxn_c_l267_c4_6cca_right <= VAR_BIN_OP_OR_uxn_c_l267_c4_6cca_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l267_c4_6cca_return_output := BIN_OP_OR_uxn_c_l267_c4_6cca_return_output;

     -- BIN_OP_OR[uxn_c_l249_c4_152a] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l249_c4_152a_left <= VAR_BIN_OP_OR_uxn_c_l249_c4_152a_left;
     BIN_OP_OR_uxn_c_l249_c4_152a_right <= VAR_BIN_OP_OR_uxn_c_l249_c4_152a_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l249_c4_152a_return_output := BIN_OP_OR_uxn_c_l249_c4_152a_return_output;

     -- BIN_OP_OR[uxn_c_l258_c4_2632] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l258_c4_2632_left <= VAR_BIN_OP_OR_uxn_c_l258_c4_2632_left;
     BIN_OP_OR_uxn_c_l258_c4_2632_right <= VAR_BIN_OP_OR_uxn_c_l258_c4_2632_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l258_c4_2632_return_output := BIN_OP_OR_uxn_c_l258_c4_2632_return_output;

     -- BIN_OP_OR[uxn_c_l238_c4_025b] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l238_c4_025b_left <= VAR_BIN_OP_OR_uxn_c_l238_c4_025b_left;
     BIN_OP_OR_uxn_c_l238_c4_025b_right <= VAR_BIN_OP_OR_uxn_c_l238_c4_025b_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l238_c4_025b_return_output := BIN_OP_OR_uxn_c_l238_c4_025b_return_output;

     -- Submodule level 3
     VAR_color_3_MUX_uxn_c_l260_c8_e38e_iftrue := VAR_BIN_OP_OR_uxn_c_l267_c4_6cca_return_output;
     VAR_BIN_OP_OR_uxn_c_l254_c4_5dc7_right := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l252_l261_DUPLICATE_0605_return_output;
     VAR_BIN_OP_OR_uxn_c_l263_c4_7659_right := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l252_l261_DUPLICATE_0605_return_output;
     VAR_BIN_OP_OR_uxn_c_l233_c4_1f74_right := VAR_CONST_SL_4_uxn_c_l231_c4_e76f_return_output;
     VAR_BIN_OP_OR_uxn_c_l244_c4_d1ac_right := VAR_CONST_SL_4_uxn_c_l242_c4_00b9_return_output;
     VAR_BIN_OP_OR_uxn_c_l211_c4_c089_right := VAR_CONST_SL_8_uxn_c_l209_c4_3e9d_return_output;
     VAR_BIN_OP_OR_uxn_c_l222_c4_9126_right := VAR_CONST_SL_8_uxn_c_l220_c4_d100_return_output;
     VAR_BIN_OP_AND_uxn_c_l201_c6_d6a3_right := VAR_MUX_uxn_c_l199_c30_856d_return_output;
     -- BIN_OP_OR[uxn_c_l254_c4_5dc7] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l254_c4_5dc7_left <= VAR_BIN_OP_OR_uxn_c_l254_c4_5dc7_left;
     BIN_OP_OR_uxn_c_l254_c4_5dc7_right <= VAR_BIN_OP_OR_uxn_c_l254_c4_5dc7_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l254_c4_5dc7_return_output := BIN_OP_OR_uxn_c_l254_c4_5dc7_return_output;

     -- BIN_OP_OR[uxn_c_l222_c4_9126] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l222_c4_9126_left <= VAR_BIN_OP_OR_uxn_c_l222_c4_9126_left;
     BIN_OP_OR_uxn_c_l222_c4_9126_right <= VAR_BIN_OP_OR_uxn_c_l222_c4_9126_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l222_c4_9126_return_output := BIN_OP_OR_uxn_c_l222_c4_9126_return_output;

     -- BIN_OP_OR[uxn_c_l211_c4_c089] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l211_c4_c089_left <= VAR_BIN_OP_OR_uxn_c_l211_c4_c089_left;
     BIN_OP_OR_uxn_c_l211_c4_c089_right <= VAR_BIN_OP_OR_uxn_c_l211_c4_c089_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l211_c4_c089_return_output := BIN_OP_OR_uxn_c_l211_c4_c089_return_output;

     -- BIN_OP_OR[uxn_c_l244_c4_d1ac] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l244_c4_d1ac_left <= VAR_BIN_OP_OR_uxn_c_l244_c4_d1ac_left;
     BIN_OP_OR_uxn_c_l244_c4_d1ac_right <= VAR_BIN_OP_OR_uxn_c_l244_c4_d1ac_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l244_c4_d1ac_return_output := BIN_OP_OR_uxn_c_l244_c4_d1ac_return_output;

     -- BIN_OP_AND[uxn_c_l201_c6_d6a3] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l201_c6_d6a3_left <= VAR_BIN_OP_AND_uxn_c_l201_c6_d6a3_left;
     BIN_OP_AND_uxn_c_l201_c6_d6a3_right <= VAR_BIN_OP_AND_uxn_c_l201_c6_d6a3_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l201_c6_d6a3_return_output := BIN_OP_AND_uxn_c_l201_c6_d6a3_return_output;

     -- color_3_MUX[uxn_c_l260_c8_e38e] LATENCY=0
     -- Inputs
     color_3_MUX_uxn_c_l260_c8_e38e_cond <= VAR_color_3_MUX_uxn_c_l260_c8_e38e_cond;
     color_3_MUX_uxn_c_l260_c8_e38e_iftrue <= VAR_color_3_MUX_uxn_c_l260_c8_e38e_iftrue;
     color_3_MUX_uxn_c_l260_c8_e38e_iffalse <= VAR_color_3_MUX_uxn_c_l260_c8_e38e_iffalse;
     -- Outputs
     VAR_color_3_MUX_uxn_c_l260_c8_e38e_return_output := color_3_MUX_uxn_c_l260_c8_e38e_return_output;

     -- BIN_OP_OR[uxn_c_l233_c4_1f74] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l233_c4_1f74_left <= VAR_BIN_OP_OR_uxn_c_l233_c4_1f74_left;
     BIN_OP_OR_uxn_c_l233_c4_1f74_right <= VAR_BIN_OP_OR_uxn_c_l233_c4_1f74_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l233_c4_1f74_return_output := BIN_OP_OR_uxn_c_l233_c4_1f74_return_output;

     -- BIN_OP_OR[uxn_c_l263_c4_7659] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l263_c4_7659_left <= VAR_BIN_OP_OR_uxn_c_l263_c4_7659_left;
     BIN_OP_OR_uxn_c_l263_c4_7659_right <= VAR_BIN_OP_OR_uxn_c_l263_c4_7659_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l263_c4_7659_return_output := BIN_OP_OR_uxn_c_l263_c4_7659_return_output;

     -- Submodule level 4
     VAR_color_MUX_uxn_c_l201_c2_11e6_cond := VAR_BIN_OP_AND_uxn_c_l201_c6_d6a3_return_output;
     VAR_color_2_MUX_uxn_c_l260_c8_e38e_iftrue := VAR_BIN_OP_OR_uxn_c_l263_c4_7659_return_output;
     -- color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8[uxn_c_l251_c8_fab5] LATENCY=0
     VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l251_c8_fab5_return_output := CONST_REF_RD_uint12_t_4_uint12_t_4_90b8(
     color,
     VAR_BIN_OP_OR_uxn_c_l254_c4_5dc7_return_output,
     VAR_BIN_OP_OR_uxn_c_l258_c4_2632_return_output);

     -- color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8[uxn_c_l229_c8_d97f] LATENCY=0
     VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l229_c8_d97f_return_output := CONST_REF_RD_uint12_t_4_uint12_t_4_90b8(
     color,
     VAR_BIN_OP_OR_uxn_c_l233_c4_1f74_return_output,
     VAR_BIN_OP_OR_uxn_c_l238_c4_025b_return_output);

     -- color_2_MUX[uxn_c_l260_c8_e38e] LATENCY=0
     -- Inputs
     color_2_MUX_uxn_c_l260_c8_e38e_cond <= VAR_color_2_MUX_uxn_c_l260_c8_e38e_cond;
     color_2_MUX_uxn_c_l260_c8_e38e_iftrue <= VAR_color_2_MUX_uxn_c_l260_c8_e38e_iftrue;
     color_2_MUX_uxn_c_l260_c8_e38e_iffalse <= VAR_color_2_MUX_uxn_c_l260_c8_e38e_iffalse;
     -- Outputs
     VAR_color_2_MUX_uxn_c_l260_c8_e38e_return_output := color_2_MUX_uxn_c_l260_c8_e38e_return_output;

     -- color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5[uxn_c_l218_c8_24cb] LATENCY=0
     VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l218_c8_24cb_return_output := CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5(
     color,
     VAR_BIN_OP_OR_uxn_c_l222_c4_9126_return_output,
     VAR_BIN_OP_OR_uxn_c_l227_c4_4869_return_output);

     -- color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8[uxn_c_l207_c3_7584] LATENCY=0
     VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l207_c3_7584_return_output := CONST_REF_RD_uint12_t_4_uint12_t_4_90b8(
     color,
     VAR_BIN_OP_OR_uxn_c_l211_c4_c089_return_output,
     VAR_BIN_OP_OR_uxn_c_l216_c4_2653_return_output);

     -- color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5[uxn_c_l240_c8_4f51] LATENCY=0
     VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l240_c8_4f51_return_output := CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5(
     color,
     VAR_BIN_OP_OR_uxn_c_l244_c4_d1ac_return_output,
     VAR_BIN_OP_OR_uxn_c_l249_c4_152a_return_output);

     -- Submodule level 5
     VAR_color_MUX_uxn_c_l207_c3_7584_iftrue := VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l207_c3_7584_return_output;
     VAR_color_MUX_uxn_c_l229_c8_d97f_iftrue := VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l229_c8_d97f_return_output;
     VAR_color_MUX_uxn_c_l251_c8_fab5_iftrue := VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l251_c8_fab5_return_output;
     VAR_color_MUX_uxn_c_l218_c8_24cb_iftrue := VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l218_c8_24cb_return_output;
     VAR_color_MUX_uxn_c_l240_c8_4f51_iftrue := VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l240_c8_4f51_return_output;
     -- color_FALSE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5[uxn_c_l251_c8_fab5] LATENCY=0
     VAR_color_FALSE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l251_c8_fab5_return_output := CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5(
     color,
     VAR_color_2_MUX_uxn_c_l260_c8_e38e_return_output,
     VAR_color_3_MUX_uxn_c_l260_c8_e38e_return_output);

     -- Submodule level 6
     VAR_color_MUX_uxn_c_l251_c8_fab5_iffalse := VAR_color_FALSE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l251_c8_fab5_return_output;
     -- color_MUX[uxn_c_l251_c8_fab5] LATENCY=0
     -- Inputs
     color_MUX_uxn_c_l251_c8_fab5_cond <= VAR_color_MUX_uxn_c_l251_c8_fab5_cond;
     color_MUX_uxn_c_l251_c8_fab5_iftrue <= VAR_color_MUX_uxn_c_l251_c8_fab5_iftrue;
     color_MUX_uxn_c_l251_c8_fab5_iffalse <= VAR_color_MUX_uxn_c_l251_c8_fab5_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_c_l251_c8_fab5_return_output := color_MUX_uxn_c_l251_c8_fab5_return_output;

     -- Submodule level 7
     VAR_color_MUX_uxn_c_l240_c8_4f51_iffalse := VAR_color_MUX_uxn_c_l251_c8_fab5_return_output;
     -- color_MUX[uxn_c_l240_c8_4f51] LATENCY=0
     -- Inputs
     color_MUX_uxn_c_l240_c8_4f51_cond <= VAR_color_MUX_uxn_c_l240_c8_4f51_cond;
     color_MUX_uxn_c_l240_c8_4f51_iftrue <= VAR_color_MUX_uxn_c_l240_c8_4f51_iftrue;
     color_MUX_uxn_c_l240_c8_4f51_iffalse <= VAR_color_MUX_uxn_c_l240_c8_4f51_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_c_l240_c8_4f51_return_output := color_MUX_uxn_c_l240_c8_4f51_return_output;

     -- Submodule level 8
     VAR_color_MUX_uxn_c_l229_c8_d97f_iffalse := VAR_color_MUX_uxn_c_l240_c8_4f51_return_output;
     -- color_MUX[uxn_c_l229_c8_d97f] LATENCY=0
     -- Inputs
     color_MUX_uxn_c_l229_c8_d97f_cond <= VAR_color_MUX_uxn_c_l229_c8_d97f_cond;
     color_MUX_uxn_c_l229_c8_d97f_iftrue <= VAR_color_MUX_uxn_c_l229_c8_d97f_iftrue;
     color_MUX_uxn_c_l229_c8_d97f_iffalse <= VAR_color_MUX_uxn_c_l229_c8_d97f_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_c_l229_c8_d97f_return_output := color_MUX_uxn_c_l229_c8_d97f_return_output;

     -- Submodule level 9
     VAR_color_MUX_uxn_c_l218_c8_24cb_iffalse := VAR_color_MUX_uxn_c_l229_c8_d97f_return_output;
     -- color_MUX[uxn_c_l218_c8_24cb] LATENCY=0
     -- Inputs
     color_MUX_uxn_c_l218_c8_24cb_cond <= VAR_color_MUX_uxn_c_l218_c8_24cb_cond;
     color_MUX_uxn_c_l218_c8_24cb_iftrue <= VAR_color_MUX_uxn_c_l218_c8_24cb_iftrue;
     color_MUX_uxn_c_l218_c8_24cb_iffalse <= VAR_color_MUX_uxn_c_l218_c8_24cb_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_c_l218_c8_24cb_return_output := color_MUX_uxn_c_l218_c8_24cb_return_output;

     -- Submodule level 10
     VAR_color_MUX_uxn_c_l207_c3_7584_iffalse := VAR_color_MUX_uxn_c_l218_c8_24cb_return_output;
     -- color_MUX[uxn_c_l207_c3_7584] LATENCY=0
     -- Inputs
     color_MUX_uxn_c_l207_c3_7584_cond <= VAR_color_MUX_uxn_c_l207_c3_7584_cond;
     color_MUX_uxn_c_l207_c3_7584_iftrue <= VAR_color_MUX_uxn_c_l207_c3_7584_iftrue;
     color_MUX_uxn_c_l207_c3_7584_iffalse <= VAR_color_MUX_uxn_c_l207_c3_7584_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_c_l207_c3_7584_return_output := color_MUX_uxn_c_l207_c3_7584_return_output;

     -- Submodule level 11
     VAR_color_MUX_uxn_c_l201_c2_11e6_iftrue := VAR_color_MUX_uxn_c_l207_c3_7584_return_output;
     -- color_MUX[uxn_c_l201_c2_11e6] LATENCY=0
     -- Inputs
     color_MUX_uxn_c_l201_c2_11e6_cond <= VAR_color_MUX_uxn_c_l201_c2_11e6_cond;
     color_MUX_uxn_c_l201_c2_11e6_iftrue <= VAR_color_MUX_uxn_c_l201_c2_11e6_iftrue;
     color_MUX_uxn_c_l201_c2_11e6_iffalse <= VAR_color_MUX_uxn_c_l201_c2_11e6_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_c_l201_c2_11e6_return_output := color_MUX_uxn_c_l201_c2_11e6_return_output;

     -- Submodule level 12
     VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l271_c20_a42b_ref_toks_0 := VAR_color_MUX_uxn_c_l201_c2_11e6_return_output;
     REG_VAR_color := VAR_color_MUX_uxn_c_l201_c2_11e6_return_output;
     -- VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d[uxn_c_l271_c20_a42b] LATENCY=0
     -- Inputs
     VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l271_c20_a42b_ref_toks_0 <= VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l271_c20_a42b_ref_toks_0;
     VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l271_c20_a42b_var_dim_0 <= VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l271_c20_a42b_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l271_c20_a42b_return_output := VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l271_c20_a42b_return_output;

     -- Submodule level 13
     VAR_result_uxn_c_l271_c11_825c_0 := resize(VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l271_c20_a42b_return_output, 16);
     VAR_return_output := VAR_result_uxn_c_l271_c11_825c_0;
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
