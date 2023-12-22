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
-- CONST_SR_4[uxn_c_l202_c30_4199]
signal CONST_SR_4_uxn_c_l202_c30_4199_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_c_l202_c30_4199_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_c_l202_c30_ee54]
signal BIN_OP_EQ_uxn_c_l202_c30_ee54_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l202_c30_ee54_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l202_c30_ee54_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l202_c30_837a]
signal MUX_uxn_c_l202_c30_837a_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l202_c30_837a_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l202_c30_837a_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l202_c30_837a_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l204_c6_8853]
signal BIN_OP_AND_uxn_c_l204_c6_8853_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l204_c6_8853_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l204_c6_8853_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_c_l204_c2_f4ec]
signal color_MUX_uxn_c_l204_c2_f4ec_cond : unsigned(0 downto 0);
signal color_MUX_uxn_c_l204_c2_f4ec_iftrue : uint12_t_4;
signal color_MUX_uxn_c_l204_c2_f4ec_iffalse : uint12_t_4;
signal color_MUX_uxn_c_l204_c2_f4ec_return_output : uint12_t_4;

-- CONST_SR_4[uxn_c_l207_c35_5b4e]
signal CONST_SR_4_uxn_c_l207_c35_5b4e_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_c_l207_c35_5b4e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_c_l210_c7_6f7b]
signal BIN_OP_EQ_uxn_c_l210_c7_6f7b_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l210_c7_6f7b_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l210_c7_6f7b_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_c_l210_c3_da8b]
signal color_MUX_uxn_c_l210_c3_da8b_cond : unsigned(0 downto 0);
signal color_MUX_uxn_c_l210_c3_da8b_iftrue : uint12_t_4;
signal color_MUX_uxn_c_l210_c3_da8b_iffalse : uint12_t_4;
signal color_MUX_uxn_c_l210_c3_da8b_return_output : uint12_t_4;

-- CONST_SL_8[uxn_c_l212_c4_ca8c]
signal CONST_SL_8_uxn_c_l212_c4_ca8c_x : unsigned(11 downto 0);
signal CONST_SL_8_uxn_c_l212_c4_ca8c_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l213_c4_67f6]
signal BIN_OP_AND_uxn_c_l213_c4_67f6_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l213_c4_67f6_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l213_c4_67f6_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l214_c4_a25c]
signal BIN_OP_OR_uxn_c_l214_c4_a25c_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l214_c4_a25c_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l214_c4_a25c_return_output : unsigned(11 downto 0);

-- CONST_SL_8[uxn_c_l217_c4_bd57]
signal CONST_SL_8_uxn_c_l217_c4_bd57_x : unsigned(11 downto 0);
signal CONST_SL_8_uxn_c_l217_c4_bd57_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l218_c4_79b2]
signal BIN_OP_AND_uxn_c_l218_c4_79b2_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l218_c4_79b2_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l218_c4_79b2_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l219_c4_212b]
signal BIN_OP_OR_uxn_c_l219_c4_212b_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l219_c4_212b_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l219_c4_212b_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l221_c12_da20]
signal BIN_OP_EQ_uxn_c_l221_c12_da20_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l221_c12_da20_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l221_c12_da20_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_c_l221_c8_5c6e]
signal color_MUX_uxn_c_l221_c8_5c6e_cond : unsigned(0 downto 0);
signal color_MUX_uxn_c_l221_c8_5c6e_iftrue : uint12_t_4;
signal color_MUX_uxn_c_l221_c8_5c6e_iffalse : uint12_t_4;
signal color_MUX_uxn_c_l221_c8_5c6e_return_output : uint12_t_4;

-- CONST_SL_8[uxn_c_l223_c4_c915]
signal CONST_SL_8_uxn_c_l223_c4_c915_x : unsigned(11 downto 0);
signal CONST_SL_8_uxn_c_l223_c4_c915_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l224_c4_6d6b]
signal BIN_OP_AND_uxn_c_l224_c4_6d6b_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l224_c4_6d6b_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l224_c4_6d6b_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l225_c4_cf11]
signal BIN_OP_OR_uxn_c_l225_c4_cf11_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l225_c4_cf11_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l225_c4_cf11_return_output : unsigned(11 downto 0);

-- CONST_SL_8[uxn_c_l228_c4_9868]
signal CONST_SL_8_uxn_c_l228_c4_9868_x : unsigned(11 downto 0);
signal CONST_SL_8_uxn_c_l228_c4_9868_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l229_c4_67d3]
signal BIN_OP_AND_uxn_c_l229_c4_67d3_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l229_c4_67d3_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l229_c4_67d3_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l230_c4_d767]
signal BIN_OP_OR_uxn_c_l230_c4_d767_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l230_c4_d767_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l230_c4_d767_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l232_c12_9205]
signal BIN_OP_EQ_uxn_c_l232_c12_9205_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l232_c12_9205_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l232_c12_9205_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_c_l232_c8_1e04]
signal color_MUX_uxn_c_l232_c8_1e04_cond : unsigned(0 downto 0);
signal color_MUX_uxn_c_l232_c8_1e04_iftrue : uint12_t_4;
signal color_MUX_uxn_c_l232_c8_1e04_iffalse : uint12_t_4;
signal color_MUX_uxn_c_l232_c8_1e04_return_output : uint12_t_4;

-- CONST_SL_4[uxn_c_l234_c4_7571]
signal CONST_SL_4_uxn_c_l234_c4_7571_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_c_l234_c4_7571_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l235_c4_e977]
signal BIN_OP_AND_uxn_c_l235_c4_e977_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l235_c4_e977_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l235_c4_e977_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l236_c4_f7d3]
signal BIN_OP_OR_uxn_c_l236_c4_f7d3_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l236_c4_f7d3_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l236_c4_f7d3_return_output : unsigned(11 downto 0);

-- CONST_SL_4[uxn_c_l239_c4_ae41]
signal CONST_SL_4_uxn_c_l239_c4_ae41_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_c_l239_c4_ae41_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l240_c4_4c03]
signal BIN_OP_AND_uxn_c_l240_c4_4c03_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l240_c4_4c03_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l240_c4_4c03_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l241_c4_62d9]
signal BIN_OP_OR_uxn_c_l241_c4_62d9_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l241_c4_62d9_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l241_c4_62d9_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l243_c12_e094]
signal BIN_OP_EQ_uxn_c_l243_c12_e094_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l243_c12_e094_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l243_c12_e094_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_c_l243_c8_d4e3]
signal color_MUX_uxn_c_l243_c8_d4e3_cond : unsigned(0 downto 0);
signal color_MUX_uxn_c_l243_c8_d4e3_iftrue : uint12_t_4;
signal color_MUX_uxn_c_l243_c8_d4e3_iffalse : uint12_t_4;
signal color_MUX_uxn_c_l243_c8_d4e3_return_output : uint12_t_4;

-- CONST_SL_4[uxn_c_l245_c4_e18e]
signal CONST_SL_4_uxn_c_l245_c4_e18e_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_c_l245_c4_e18e_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l246_c4_4338]
signal BIN_OP_AND_uxn_c_l246_c4_4338_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l246_c4_4338_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l246_c4_4338_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l247_c4_7d9c]
signal BIN_OP_OR_uxn_c_l247_c4_7d9c_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l247_c4_7d9c_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l247_c4_7d9c_return_output : unsigned(11 downto 0);

-- CONST_SL_4[uxn_c_l250_c4_ff9d]
signal CONST_SL_4_uxn_c_l250_c4_ff9d_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_c_l250_c4_ff9d_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l251_c4_3afb]
signal BIN_OP_AND_uxn_c_l251_c4_3afb_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l251_c4_3afb_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l251_c4_3afb_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l252_c4_a2b5]
signal BIN_OP_OR_uxn_c_l252_c4_a2b5_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l252_c4_a2b5_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l252_c4_a2b5_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l254_c12_b7ba]
signal BIN_OP_EQ_uxn_c_l254_c12_b7ba_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l254_c12_b7ba_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l254_c12_b7ba_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_c_l254_c8_4c57]
signal color_MUX_uxn_c_l254_c8_4c57_cond : unsigned(0 downto 0);
signal color_MUX_uxn_c_l254_c8_4c57_iftrue : uint12_t_4;
signal color_MUX_uxn_c_l254_c8_4c57_iffalse : uint12_t_4;
signal color_MUX_uxn_c_l254_c8_4c57_return_output : uint12_t_4;

-- BIN_OP_AND[uxn_c_l256_c4_78cb]
signal BIN_OP_AND_uxn_c_l256_c4_78cb_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l256_c4_78cb_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l256_c4_78cb_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l257_c4_24af]
signal BIN_OP_OR_uxn_c_l257_c4_24af_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l257_c4_24af_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l257_c4_24af_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l260_c4_2fbc]
signal BIN_OP_AND_uxn_c_l260_c4_2fbc_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l260_c4_2fbc_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l260_c4_2fbc_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l261_c4_7b48]
signal BIN_OP_OR_uxn_c_l261_c4_7b48_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l261_c4_7b48_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l261_c4_7b48_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l263_c12_7893]
signal BIN_OP_EQ_uxn_c_l263_c12_7893_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l263_c12_7893_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l263_c12_7893_return_output : unsigned(0 downto 0);

-- color_3_MUX[uxn_c_l263_c8_8929]
signal color_3_MUX_uxn_c_l263_c8_8929_cond : unsigned(0 downto 0);
signal color_3_MUX_uxn_c_l263_c8_8929_iftrue : unsigned(11 downto 0);
signal color_3_MUX_uxn_c_l263_c8_8929_iffalse : unsigned(11 downto 0);
signal color_3_MUX_uxn_c_l263_c8_8929_return_output : unsigned(11 downto 0);

-- color_2_MUX[uxn_c_l263_c8_8929]
signal color_2_MUX_uxn_c_l263_c8_8929_cond : unsigned(0 downto 0);
signal color_2_MUX_uxn_c_l263_c8_8929_iftrue : unsigned(11 downto 0);
signal color_2_MUX_uxn_c_l263_c8_8929_iffalse : unsigned(11 downto 0);
signal color_2_MUX_uxn_c_l263_c8_8929_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l265_c4_5831]
signal BIN_OP_AND_uxn_c_l265_c4_5831_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l265_c4_5831_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l265_c4_5831_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l266_c4_03da]
signal BIN_OP_OR_uxn_c_l266_c4_03da_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l266_c4_03da_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l266_c4_03da_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l269_c4_100c]
signal BIN_OP_AND_uxn_c_l269_c4_100c_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l269_c4_100c_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l269_c4_100c_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l270_c4_8477]
signal BIN_OP_OR_uxn_c_l270_c4_8477_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l270_c4_8477_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l270_c4_8477_return_output : unsigned(11 downto 0);

-- VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d[uxn_c_l274_c20_de92]
signal VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l274_c20_de92_ref_toks_0 : uint12_t_4;
signal VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l274_c20_de92_var_dim_0 : unsigned(1 downto 0);
signal VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l274_c20_de92_return_output : unsigned(11 downto 0);

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
-- CONST_SR_4_uxn_c_l202_c30_4199
CONST_SR_4_uxn_c_l202_c30_4199 : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_c_l202_c30_4199_x,
CONST_SR_4_uxn_c_l202_c30_4199_return_output);

-- BIN_OP_EQ_uxn_c_l202_c30_ee54
BIN_OP_EQ_uxn_c_l202_c30_ee54 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l202_c30_ee54_left,
BIN_OP_EQ_uxn_c_l202_c30_ee54_right,
BIN_OP_EQ_uxn_c_l202_c30_ee54_return_output);

-- MUX_uxn_c_l202_c30_837a
MUX_uxn_c_l202_c30_837a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l202_c30_837a_cond,
MUX_uxn_c_l202_c30_837a_iftrue,
MUX_uxn_c_l202_c30_837a_iffalse,
MUX_uxn_c_l202_c30_837a_return_output);

-- BIN_OP_AND_uxn_c_l204_c6_8853
BIN_OP_AND_uxn_c_l204_c6_8853 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l204_c6_8853_left,
BIN_OP_AND_uxn_c_l204_c6_8853_right,
BIN_OP_AND_uxn_c_l204_c6_8853_return_output);

-- color_MUX_uxn_c_l204_c2_f4ec
color_MUX_uxn_c_l204_c2_f4ec : entity work.MUX_uint1_t_uint12_t_4_uint12_t_4_0CLK_de264c78 port map (
color_MUX_uxn_c_l204_c2_f4ec_cond,
color_MUX_uxn_c_l204_c2_f4ec_iftrue,
color_MUX_uxn_c_l204_c2_f4ec_iffalse,
color_MUX_uxn_c_l204_c2_f4ec_return_output);

-- CONST_SR_4_uxn_c_l207_c35_5b4e
CONST_SR_4_uxn_c_l207_c35_5b4e : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_c_l207_c35_5b4e_x,
CONST_SR_4_uxn_c_l207_c35_5b4e_return_output);

-- BIN_OP_EQ_uxn_c_l210_c7_6f7b
BIN_OP_EQ_uxn_c_l210_c7_6f7b : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l210_c7_6f7b_left,
BIN_OP_EQ_uxn_c_l210_c7_6f7b_right,
BIN_OP_EQ_uxn_c_l210_c7_6f7b_return_output);

-- color_MUX_uxn_c_l210_c3_da8b
color_MUX_uxn_c_l210_c3_da8b : entity work.MUX_uint1_t_uint12_t_4_uint12_t_4_0CLK_de264c78 port map (
color_MUX_uxn_c_l210_c3_da8b_cond,
color_MUX_uxn_c_l210_c3_da8b_iftrue,
color_MUX_uxn_c_l210_c3_da8b_iffalse,
color_MUX_uxn_c_l210_c3_da8b_return_output);

-- CONST_SL_8_uxn_c_l212_c4_ca8c
CONST_SL_8_uxn_c_l212_c4_ca8c : entity work.CONST_SL_8_uint12_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l212_c4_ca8c_x,
CONST_SL_8_uxn_c_l212_c4_ca8c_return_output);

-- BIN_OP_AND_uxn_c_l213_c4_67f6
BIN_OP_AND_uxn_c_l213_c4_67f6 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l213_c4_67f6_left,
BIN_OP_AND_uxn_c_l213_c4_67f6_right,
BIN_OP_AND_uxn_c_l213_c4_67f6_return_output);

-- BIN_OP_OR_uxn_c_l214_c4_a25c
BIN_OP_OR_uxn_c_l214_c4_a25c : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l214_c4_a25c_left,
BIN_OP_OR_uxn_c_l214_c4_a25c_right,
BIN_OP_OR_uxn_c_l214_c4_a25c_return_output);

-- CONST_SL_8_uxn_c_l217_c4_bd57
CONST_SL_8_uxn_c_l217_c4_bd57 : entity work.CONST_SL_8_uint12_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l217_c4_bd57_x,
CONST_SL_8_uxn_c_l217_c4_bd57_return_output);

-- BIN_OP_AND_uxn_c_l218_c4_79b2
BIN_OP_AND_uxn_c_l218_c4_79b2 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l218_c4_79b2_left,
BIN_OP_AND_uxn_c_l218_c4_79b2_right,
BIN_OP_AND_uxn_c_l218_c4_79b2_return_output);

-- BIN_OP_OR_uxn_c_l219_c4_212b
BIN_OP_OR_uxn_c_l219_c4_212b : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l219_c4_212b_left,
BIN_OP_OR_uxn_c_l219_c4_212b_right,
BIN_OP_OR_uxn_c_l219_c4_212b_return_output);

-- BIN_OP_EQ_uxn_c_l221_c12_da20
BIN_OP_EQ_uxn_c_l221_c12_da20 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l221_c12_da20_left,
BIN_OP_EQ_uxn_c_l221_c12_da20_right,
BIN_OP_EQ_uxn_c_l221_c12_da20_return_output);

-- color_MUX_uxn_c_l221_c8_5c6e
color_MUX_uxn_c_l221_c8_5c6e : entity work.MUX_uint1_t_uint12_t_4_uint12_t_4_0CLK_de264c78 port map (
color_MUX_uxn_c_l221_c8_5c6e_cond,
color_MUX_uxn_c_l221_c8_5c6e_iftrue,
color_MUX_uxn_c_l221_c8_5c6e_iffalse,
color_MUX_uxn_c_l221_c8_5c6e_return_output);

-- CONST_SL_8_uxn_c_l223_c4_c915
CONST_SL_8_uxn_c_l223_c4_c915 : entity work.CONST_SL_8_uint12_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l223_c4_c915_x,
CONST_SL_8_uxn_c_l223_c4_c915_return_output);

-- BIN_OP_AND_uxn_c_l224_c4_6d6b
BIN_OP_AND_uxn_c_l224_c4_6d6b : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l224_c4_6d6b_left,
BIN_OP_AND_uxn_c_l224_c4_6d6b_right,
BIN_OP_AND_uxn_c_l224_c4_6d6b_return_output);

-- BIN_OP_OR_uxn_c_l225_c4_cf11
BIN_OP_OR_uxn_c_l225_c4_cf11 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l225_c4_cf11_left,
BIN_OP_OR_uxn_c_l225_c4_cf11_right,
BIN_OP_OR_uxn_c_l225_c4_cf11_return_output);

-- CONST_SL_8_uxn_c_l228_c4_9868
CONST_SL_8_uxn_c_l228_c4_9868 : entity work.CONST_SL_8_uint12_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l228_c4_9868_x,
CONST_SL_8_uxn_c_l228_c4_9868_return_output);

-- BIN_OP_AND_uxn_c_l229_c4_67d3
BIN_OP_AND_uxn_c_l229_c4_67d3 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l229_c4_67d3_left,
BIN_OP_AND_uxn_c_l229_c4_67d3_right,
BIN_OP_AND_uxn_c_l229_c4_67d3_return_output);

-- BIN_OP_OR_uxn_c_l230_c4_d767
BIN_OP_OR_uxn_c_l230_c4_d767 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l230_c4_d767_left,
BIN_OP_OR_uxn_c_l230_c4_d767_right,
BIN_OP_OR_uxn_c_l230_c4_d767_return_output);

-- BIN_OP_EQ_uxn_c_l232_c12_9205
BIN_OP_EQ_uxn_c_l232_c12_9205 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l232_c12_9205_left,
BIN_OP_EQ_uxn_c_l232_c12_9205_right,
BIN_OP_EQ_uxn_c_l232_c12_9205_return_output);

-- color_MUX_uxn_c_l232_c8_1e04
color_MUX_uxn_c_l232_c8_1e04 : entity work.MUX_uint1_t_uint12_t_4_uint12_t_4_0CLK_de264c78 port map (
color_MUX_uxn_c_l232_c8_1e04_cond,
color_MUX_uxn_c_l232_c8_1e04_iftrue,
color_MUX_uxn_c_l232_c8_1e04_iffalse,
color_MUX_uxn_c_l232_c8_1e04_return_output);

-- CONST_SL_4_uxn_c_l234_c4_7571
CONST_SL_4_uxn_c_l234_c4_7571 : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_c_l234_c4_7571_x,
CONST_SL_4_uxn_c_l234_c4_7571_return_output);

-- BIN_OP_AND_uxn_c_l235_c4_e977
BIN_OP_AND_uxn_c_l235_c4_e977 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l235_c4_e977_left,
BIN_OP_AND_uxn_c_l235_c4_e977_right,
BIN_OP_AND_uxn_c_l235_c4_e977_return_output);

-- BIN_OP_OR_uxn_c_l236_c4_f7d3
BIN_OP_OR_uxn_c_l236_c4_f7d3 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l236_c4_f7d3_left,
BIN_OP_OR_uxn_c_l236_c4_f7d3_right,
BIN_OP_OR_uxn_c_l236_c4_f7d3_return_output);

-- CONST_SL_4_uxn_c_l239_c4_ae41
CONST_SL_4_uxn_c_l239_c4_ae41 : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_c_l239_c4_ae41_x,
CONST_SL_4_uxn_c_l239_c4_ae41_return_output);

-- BIN_OP_AND_uxn_c_l240_c4_4c03
BIN_OP_AND_uxn_c_l240_c4_4c03 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l240_c4_4c03_left,
BIN_OP_AND_uxn_c_l240_c4_4c03_right,
BIN_OP_AND_uxn_c_l240_c4_4c03_return_output);

-- BIN_OP_OR_uxn_c_l241_c4_62d9
BIN_OP_OR_uxn_c_l241_c4_62d9 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l241_c4_62d9_left,
BIN_OP_OR_uxn_c_l241_c4_62d9_right,
BIN_OP_OR_uxn_c_l241_c4_62d9_return_output);

-- BIN_OP_EQ_uxn_c_l243_c12_e094
BIN_OP_EQ_uxn_c_l243_c12_e094 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l243_c12_e094_left,
BIN_OP_EQ_uxn_c_l243_c12_e094_right,
BIN_OP_EQ_uxn_c_l243_c12_e094_return_output);

-- color_MUX_uxn_c_l243_c8_d4e3
color_MUX_uxn_c_l243_c8_d4e3 : entity work.MUX_uint1_t_uint12_t_4_uint12_t_4_0CLK_de264c78 port map (
color_MUX_uxn_c_l243_c8_d4e3_cond,
color_MUX_uxn_c_l243_c8_d4e3_iftrue,
color_MUX_uxn_c_l243_c8_d4e3_iffalse,
color_MUX_uxn_c_l243_c8_d4e3_return_output);

-- CONST_SL_4_uxn_c_l245_c4_e18e
CONST_SL_4_uxn_c_l245_c4_e18e : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_c_l245_c4_e18e_x,
CONST_SL_4_uxn_c_l245_c4_e18e_return_output);

-- BIN_OP_AND_uxn_c_l246_c4_4338
BIN_OP_AND_uxn_c_l246_c4_4338 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l246_c4_4338_left,
BIN_OP_AND_uxn_c_l246_c4_4338_right,
BIN_OP_AND_uxn_c_l246_c4_4338_return_output);

-- BIN_OP_OR_uxn_c_l247_c4_7d9c
BIN_OP_OR_uxn_c_l247_c4_7d9c : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l247_c4_7d9c_left,
BIN_OP_OR_uxn_c_l247_c4_7d9c_right,
BIN_OP_OR_uxn_c_l247_c4_7d9c_return_output);

-- CONST_SL_4_uxn_c_l250_c4_ff9d
CONST_SL_4_uxn_c_l250_c4_ff9d : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_c_l250_c4_ff9d_x,
CONST_SL_4_uxn_c_l250_c4_ff9d_return_output);

-- BIN_OP_AND_uxn_c_l251_c4_3afb
BIN_OP_AND_uxn_c_l251_c4_3afb : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l251_c4_3afb_left,
BIN_OP_AND_uxn_c_l251_c4_3afb_right,
BIN_OP_AND_uxn_c_l251_c4_3afb_return_output);

-- BIN_OP_OR_uxn_c_l252_c4_a2b5
BIN_OP_OR_uxn_c_l252_c4_a2b5 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l252_c4_a2b5_left,
BIN_OP_OR_uxn_c_l252_c4_a2b5_right,
BIN_OP_OR_uxn_c_l252_c4_a2b5_return_output);

-- BIN_OP_EQ_uxn_c_l254_c12_b7ba
BIN_OP_EQ_uxn_c_l254_c12_b7ba : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l254_c12_b7ba_left,
BIN_OP_EQ_uxn_c_l254_c12_b7ba_right,
BIN_OP_EQ_uxn_c_l254_c12_b7ba_return_output);

-- color_MUX_uxn_c_l254_c8_4c57
color_MUX_uxn_c_l254_c8_4c57 : entity work.MUX_uint1_t_uint12_t_4_uint12_t_4_0CLK_de264c78 port map (
color_MUX_uxn_c_l254_c8_4c57_cond,
color_MUX_uxn_c_l254_c8_4c57_iftrue,
color_MUX_uxn_c_l254_c8_4c57_iffalse,
color_MUX_uxn_c_l254_c8_4c57_return_output);

-- BIN_OP_AND_uxn_c_l256_c4_78cb
BIN_OP_AND_uxn_c_l256_c4_78cb : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l256_c4_78cb_left,
BIN_OP_AND_uxn_c_l256_c4_78cb_right,
BIN_OP_AND_uxn_c_l256_c4_78cb_return_output);

-- BIN_OP_OR_uxn_c_l257_c4_24af
BIN_OP_OR_uxn_c_l257_c4_24af : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l257_c4_24af_left,
BIN_OP_OR_uxn_c_l257_c4_24af_right,
BIN_OP_OR_uxn_c_l257_c4_24af_return_output);

-- BIN_OP_AND_uxn_c_l260_c4_2fbc
BIN_OP_AND_uxn_c_l260_c4_2fbc : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l260_c4_2fbc_left,
BIN_OP_AND_uxn_c_l260_c4_2fbc_right,
BIN_OP_AND_uxn_c_l260_c4_2fbc_return_output);

-- BIN_OP_OR_uxn_c_l261_c4_7b48
BIN_OP_OR_uxn_c_l261_c4_7b48 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l261_c4_7b48_left,
BIN_OP_OR_uxn_c_l261_c4_7b48_right,
BIN_OP_OR_uxn_c_l261_c4_7b48_return_output);

-- BIN_OP_EQ_uxn_c_l263_c12_7893
BIN_OP_EQ_uxn_c_l263_c12_7893 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l263_c12_7893_left,
BIN_OP_EQ_uxn_c_l263_c12_7893_right,
BIN_OP_EQ_uxn_c_l263_c12_7893_return_output);

-- color_3_MUX_uxn_c_l263_c8_8929
color_3_MUX_uxn_c_l263_c8_8929 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color_3_MUX_uxn_c_l263_c8_8929_cond,
color_3_MUX_uxn_c_l263_c8_8929_iftrue,
color_3_MUX_uxn_c_l263_c8_8929_iffalse,
color_3_MUX_uxn_c_l263_c8_8929_return_output);

-- color_2_MUX_uxn_c_l263_c8_8929
color_2_MUX_uxn_c_l263_c8_8929 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color_2_MUX_uxn_c_l263_c8_8929_cond,
color_2_MUX_uxn_c_l263_c8_8929_iftrue,
color_2_MUX_uxn_c_l263_c8_8929_iffalse,
color_2_MUX_uxn_c_l263_c8_8929_return_output);

-- BIN_OP_AND_uxn_c_l265_c4_5831
BIN_OP_AND_uxn_c_l265_c4_5831 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l265_c4_5831_left,
BIN_OP_AND_uxn_c_l265_c4_5831_right,
BIN_OP_AND_uxn_c_l265_c4_5831_return_output);

-- BIN_OP_OR_uxn_c_l266_c4_03da
BIN_OP_OR_uxn_c_l266_c4_03da : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l266_c4_03da_left,
BIN_OP_OR_uxn_c_l266_c4_03da_right,
BIN_OP_OR_uxn_c_l266_c4_03da_return_output);

-- BIN_OP_AND_uxn_c_l269_c4_100c
BIN_OP_AND_uxn_c_l269_c4_100c : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l269_c4_100c_left,
BIN_OP_AND_uxn_c_l269_c4_100c_right,
BIN_OP_AND_uxn_c_l269_c4_100c_return_output);

-- BIN_OP_OR_uxn_c_l270_c4_8477
BIN_OP_OR_uxn_c_l270_c4_8477 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l270_c4_8477_left,
BIN_OP_OR_uxn_c_l270_c4_8477_right,
BIN_OP_OR_uxn_c_l270_c4_8477_return_output);

-- VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l274_c20_de92
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l274_c20_de92 : entity work.VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_0CLK_9e40ec46 port map (
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l274_c20_de92_ref_toks_0,
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l274_c20_de92_var_dim_0,
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l274_c20_de92_return_output);



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
 CONST_SR_4_uxn_c_l202_c30_4199_return_output,
 BIN_OP_EQ_uxn_c_l202_c30_ee54_return_output,
 MUX_uxn_c_l202_c30_837a_return_output,
 BIN_OP_AND_uxn_c_l204_c6_8853_return_output,
 color_MUX_uxn_c_l204_c2_f4ec_return_output,
 CONST_SR_4_uxn_c_l207_c35_5b4e_return_output,
 BIN_OP_EQ_uxn_c_l210_c7_6f7b_return_output,
 color_MUX_uxn_c_l210_c3_da8b_return_output,
 CONST_SL_8_uxn_c_l212_c4_ca8c_return_output,
 BIN_OP_AND_uxn_c_l213_c4_67f6_return_output,
 BIN_OP_OR_uxn_c_l214_c4_a25c_return_output,
 CONST_SL_8_uxn_c_l217_c4_bd57_return_output,
 BIN_OP_AND_uxn_c_l218_c4_79b2_return_output,
 BIN_OP_OR_uxn_c_l219_c4_212b_return_output,
 BIN_OP_EQ_uxn_c_l221_c12_da20_return_output,
 color_MUX_uxn_c_l221_c8_5c6e_return_output,
 CONST_SL_8_uxn_c_l223_c4_c915_return_output,
 BIN_OP_AND_uxn_c_l224_c4_6d6b_return_output,
 BIN_OP_OR_uxn_c_l225_c4_cf11_return_output,
 CONST_SL_8_uxn_c_l228_c4_9868_return_output,
 BIN_OP_AND_uxn_c_l229_c4_67d3_return_output,
 BIN_OP_OR_uxn_c_l230_c4_d767_return_output,
 BIN_OP_EQ_uxn_c_l232_c12_9205_return_output,
 color_MUX_uxn_c_l232_c8_1e04_return_output,
 CONST_SL_4_uxn_c_l234_c4_7571_return_output,
 BIN_OP_AND_uxn_c_l235_c4_e977_return_output,
 BIN_OP_OR_uxn_c_l236_c4_f7d3_return_output,
 CONST_SL_4_uxn_c_l239_c4_ae41_return_output,
 BIN_OP_AND_uxn_c_l240_c4_4c03_return_output,
 BIN_OP_OR_uxn_c_l241_c4_62d9_return_output,
 BIN_OP_EQ_uxn_c_l243_c12_e094_return_output,
 color_MUX_uxn_c_l243_c8_d4e3_return_output,
 CONST_SL_4_uxn_c_l245_c4_e18e_return_output,
 BIN_OP_AND_uxn_c_l246_c4_4338_return_output,
 BIN_OP_OR_uxn_c_l247_c4_7d9c_return_output,
 CONST_SL_4_uxn_c_l250_c4_ff9d_return_output,
 BIN_OP_AND_uxn_c_l251_c4_3afb_return_output,
 BIN_OP_OR_uxn_c_l252_c4_a2b5_return_output,
 BIN_OP_EQ_uxn_c_l254_c12_b7ba_return_output,
 color_MUX_uxn_c_l254_c8_4c57_return_output,
 BIN_OP_AND_uxn_c_l256_c4_78cb_return_output,
 BIN_OP_OR_uxn_c_l257_c4_24af_return_output,
 BIN_OP_AND_uxn_c_l260_c4_2fbc_return_output,
 BIN_OP_OR_uxn_c_l261_c4_7b48_return_output,
 BIN_OP_EQ_uxn_c_l263_c12_7893_return_output,
 color_3_MUX_uxn_c_l263_c8_8929_return_output,
 color_2_MUX_uxn_c_l263_c8_8929_return_output,
 BIN_OP_AND_uxn_c_l265_c4_5831_return_output,
 BIN_OP_OR_uxn_c_l266_c4_03da_return_output,
 BIN_OP_AND_uxn_c_l269_c4_100c_return_output,
 BIN_OP_OR_uxn_c_l270_c4_8477_return_output,
 VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l274_c20_de92_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_device_ram_address : unsigned(7 downto 0);
 variable VAR_device_ram_value : unsigned(7 downto 0);
 variable VAR_is_device_ram_write : unsigned(0 downto 0);
 variable VAR_gpu_step_color : unsigned(1 downto 0);
 variable VAR_is_palette_range : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l202_c30_837a_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_4_uxn_c_l202_c30_4199_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l202_c30_ee54_left : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_c_l202_c30_4199_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l202_c30_ee54_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l202_c30_ee54_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l202_c30_837a_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l202_c30_837a_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l202_c30_837a_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l204_c6_8853_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l204_c6_8853_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l204_c6_8853_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_c_l204_c2_f4ec_iftrue : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l210_c3_da8b_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l204_c2_f4ec_iffalse : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l204_c2_f4ec_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l204_c2_f4ec_cond : unsigned(0 downto 0);
 variable VAR_tmp12 : unsigned(11 downto 0);
 variable VAR_addr_low : unsigned(3 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_c_l206_c22_444c_return_output : unsigned(3 downto 0);
 variable VAR_color_cmp_0 : unsigned(3 downto 0);
 variable VAR_color_cmp_0_uxn_c_l207_c11_52f4_0 : unsigned(3 downto 0);
 variable VAR_CONST_SR_4_uxn_c_l207_c35_5b4e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_c_l207_c35_5b4e_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_c_l207_c25_bb80_return_output : unsigned(3 downto 0);
 variable VAR_color_cmp_1 : unsigned(3 downto 0);
 variable VAR_color_cmp_1_uxn_c_l208_c11_9311_0 : unsigned(3 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_c_l208_c25_6415_return_output : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l210_c7_6f7b_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l210_c7_6f7b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l210_c7_6f7b_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_c_l210_c3_da8b_iftrue : uint12_t_4;
 variable VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l210_c3_da8b_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l210_c3_da8b_iffalse : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l221_c8_5c6e_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l210_c3_da8b_cond : unsigned(0 downto 0);
 variable VAR_tmp12_uxn_c_l211_c4_f2fe : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l212_c4_ca8c_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l212_c4_ca8c_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l213_c4_67f6_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l213_c4_67f6_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l213_c4_67f6_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l214_c4_a25c_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l214_c4_a25c_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l214_c4_a25c_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_uxn_c_l216_c4_817a : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l217_c4_bd57_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l217_c4_bd57_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l218_c4_79b2_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l218_c4_79b2_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l218_c4_79b2_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l219_c4_212b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l219_c4_212b_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l219_c4_212b_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l221_c12_da20_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l221_c12_da20_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l221_c12_da20_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_c_l221_c8_5c6e_iftrue : uint12_t_4;
 variable VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l221_c8_5c6e_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l221_c8_5c6e_iffalse : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l232_c8_1e04_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l221_c8_5c6e_cond : unsigned(0 downto 0);
 variable VAR_tmp12_uxn_c_l222_c4_d646 : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l223_c4_c915_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l223_c4_c915_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l224_c4_6d6b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l224_c4_6d6b_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l224_c4_6d6b_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l225_c4_cf11_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l225_c4_cf11_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l225_c4_cf11_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_uxn_c_l227_c4_b306 : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l228_c4_9868_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l228_c4_9868_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l229_c4_67d3_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l229_c4_67d3_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l229_c4_67d3_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l230_c4_d767_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l230_c4_d767_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l230_c4_d767_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l232_c12_9205_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l232_c12_9205_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l232_c12_9205_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_c_l232_c8_1e04_iftrue : uint12_t_4;
 variable VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l232_c8_1e04_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l232_c8_1e04_iffalse : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l243_c8_d4e3_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l232_c8_1e04_cond : unsigned(0 downto 0);
 variable VAR_tmp12_uxn_c_l233_c4_debb : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l234_c4_7571_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l234_c4_7571_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l235_c4_e977_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l235_c4_e977_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l235_c4_e977_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l236_c4_f7d3_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l236_c4_f7d3_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l236_c4_f7d3_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_uxn_c_l238_c4_030c : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l239_c4_ae41_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l239_c4_ae41_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l240_c4_4c03_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l240_c4_4c03_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l240_c4_4c03_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l241_c4_62d9_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l241_c4_62d9_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l241_c4_62d9_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l243_c12_e094_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l243_c12_e094_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l243_c12_e094_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_c_l243_c8_d4e3_iftrue : uint12_t_4;
 variable VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l243_c8_d4e3_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l243_c8_d4e3_iffalse : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l254_c8_4c57_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l243_c8_d4e3_cond : unsigned(0 downto 0);
 variable VAR_tmp12_uxn_c_l244_c4_7069 : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l245_c4_e18e_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l245_c4_e18e_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l246_c4_4338_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l246_c4_4338_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l246_c4_4338_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l247_c4_7d9c_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l247_c4_7d9c_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l247_c4_7d9c_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_uxn_c_l249_c4_fe47 : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l250_c4_ff9d_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l250_c4_ff9d_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l251_c4_3afb_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l251_c4_3afb_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l251_c4_3afb_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l252_c4_a2b5_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l252_c4_a2b5_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l252_c4_a2b5_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l254_c12_b7ba_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l254_c12_b7ba_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l254_c12_b7ba_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_c_l254_c8_4c57_iftrue : uint12_t_4;
 variable VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l254_c8_4c57_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l254_c8_4c57_iffalse : uint12_t_4;
 variable VAR_color_FALSE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_3db8_uxn_c_l254_c8_4c57_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l254_c8_4c57_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l256_c4_78cb_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l256_c4_78cb_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l256_c4_78cb_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l257_c4_24af_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l257_c4_24af_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l257_c4_24af_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l260_c4_2fbc_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l260_c4_2fbc_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l260_c4_2fbc_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l261_c4_7b48_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l261_c4_7b48_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l261_c4_7b48_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l263_c12_7893_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l263_c12_7893_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l263_c12_7893_return_output : unsigned(0 downto 0);
 variable VAR_color_3_MUX_uxn_c_l263_c8_8929_iftrue : unsigned(11 downto 0);
 variable VAR_color_3_MUX_uxn_c_l263_c8_8929_iffalse : unsigned(11 downto 0);
 variable VAR_color_3_MUX_uxn_c_l263_c8_8929_return_output : unsigned(11 downto 0);
 variable VAR_color_3_MUX_uxn_c_l263_c8_8929_cond : unsigned(0 downto 0);
 variable VAR_color_2_MUX_uxn_c_l263_c8_8929_iftrue : unsigned(11 downto 0);
 variable VAR_color_2_MUX_uxn_c_l263_c8_8929_iffalse : unsigned(11 downto 0);
 variable VAR_color_2_MUX_uxn_c_l263_c8_8929_return_output : unsigned(11 downto 0);
 variable VAR_color_2_MUX_uxn_c_l263_c8_8929_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l265_c4_5831_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l265_c4_5831_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l265_c4_5831_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l266_c4_03da_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l266_c4_03da_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l266_c4_03da_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l269_c4_100c_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l269_c4_100c_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l269_c4_100c_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l270_c4_8477_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l270_c4_8477_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l270_c4_8477_return_output : unsigned(11 downto 0);
 variable VAR_result : unsigned(15 downto 0);
 variable VAR_result_uxn_c_l274_c11_21ee_0 : unsigned(15 downto 0);
 variable VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l274_c20_de92_var_dim_0 : unsigned(1 downto 0);
 variable VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l274_c20_de92_return_output : unsigned(11 downto 0);
 variable VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l274_c20_de92_ref_toks_0 : uint12_t_4;
 variable VAR_CONST_REF_RD_uint12_t_uint12_t_4_0_d41d_uxn_c_l213_l256_l235_DUPLICATE_a656_return_output : unsigned(11 downto 0);
 variable VAR_CONST_REF_RD_uint12_t_uint12_t_4_1_d41d_uxn_c_l218_l260_l240_DUPLICATE_1159_return_output : unsigned(11 downto 0);
 variable VAR_CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_uxn_c_l263_l265_l246_l224_DUPLICATE_871b_return_output : unsigned(11 downto 0);
 variable VAR_CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_uxn_c_l229_l263_l269_l251_DUPLICATE_d0bd_return_output : unsigned(11 downto 0);
 variable VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l255_l264_DUPLICATE_15d4_return_output : unsigned(11 downto 0);
 variable VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l259_l268_DUPLICATE_6e5f_return_output : unsigned(11 downto 0);
 -- State registers comb logic variables
variable REG_VAR_color : uint12_t_4;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_color := color;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_MUX_uxn_c_l202_c30_837a_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_c_l235_c4_e977_right := to_unsigned(3855, 12);
     VAR_BIN_OP_AND_uxn_c_l251_c4_3afb_right := to_unsigned(3855, 12);
     VAR_BIN_OP_EQ_uxn_c_l221_c12_da20_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_c_l263_c12_7893_right := to_unsigned(13, 4);
     VAR_BIN_OP_AND_uxn_c_l224_c4_6d6b_right := to_unsigned(255, 12);
     VAR_BIN_OP_AND_uxn_c_l218_c4_79b2_right := to_unsigned(255, 12);
     VAR_BIN_OP_EQ_uxn_c_l232_c12_9205_right := to_unsigned(10, 4);
     VAR_BIN_OP_AND_uxn_c_l213_c4_67f6_right := to_unsigned(255, 12);
     VAR_BIN_OP_AND_uxn_c_l265_c4_5831_right := to_unsigned(4080, 12);
     VAR_BIN_OP_AND_uxn_c_l246_c4_4338_right := to_unsigned(3855, 12);
     VAR_BIN_OP_AND_uxn_c_l229_c4_67d3_right := to_unsigned(255, 12);
     VAR_BIN_OP_EQ_uxn_c_l202_c30_ee54_right := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_c_l240_c4_4c03_right := to_unsigned(3855, 12);
     VAR_BIN_OP_EQ_uxn_c_l210_c7_6f7b_right := to_unsigned(8, 4);
     VAR_BIN_OP_AND_uxn_c_l256_c4_78cb_right := to_unsigned(4080, 12);
     VAR_MUX_uxn_c_l202_c30_837a_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_c_l269_c4_100c_right := to_unsigned(4080, 12);
     VAR_BIN_OP_EQ_uxn_c_l254_c12_b7ba_right := to_unsigned(12, 4);
     VAR_BIN_OP_AND_uxn_c_l260_c4_2fbc_right := to_unsigned(4080, 12);
     VAR_BIN_OP_EQ_uxn_c_l243_c12_e094_right := to_unsigned(11, 4);

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
     VAR_color_MUX_uxn_c_l204_c2_f4ec_iffalse := color;
     VAR_CONST_SR_4_uxn_c_l202_c30_4199_x := VAR_device_ram_address;
     VAR_CONST_SR_4_uxn_c_l207_c35_5b4e_x := VAR_device_ram_value;
     VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l274_c20_de92_var_dim_0 := VAR_gpu_step_color;
     VAR_BIN_OP_AND_uxn_c_l204_c6_8853_left := VAR_is_device_ram_write;
     -- CONST_REF_RD_uint12_t_uint12_t_4_0_d41d_uxn_c_l213_l256_l235_DUPLICATE_a656 LATENCY=0
     VAR_CONST_REF_RD_uint12_t_uint12_t_4_0_d41d_uxn_c_l213_l256_l235_DUPLICATE_a656_return_output := color(0);

     -- CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_uxn_c_l229_l263_l269_l251_DUPLICATE_d0bd LATENCY=0
     VAR_CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_uxn_c_l229_l263_l269_l251_DUPLICATE_d0bd_return_output := color(3);

     -- CAST_TO_uint4_t[uxn_c_l208_c25_6415] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_c_l208_c25_6415_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_device_ram_value);

     -- CONST_SR_4[uxn_c_l202_c30_4199] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_c_l202_c30_4199_x <= VAR_CONST_SR_4_uxn_c_l202_c30_4199_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_c_l202_c30_4199_return_output := CONST_SR_4_uxn_c_l202_c30_4199_return_output;

     -- CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_uxn_c_l263_l265_l246_l224_DUPLICATE_871b LATENCY=0
     VAR_CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_uxn_c_l263_l265_l246_l224_DUPLICATE_871b_return_output := color(2);

     -- CONST_SR_4[uxn_c_l207_c35_5b4e] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_c_l207_c35_5b4e_x <= VAR_CONST_SR_4_uxn_c_l207_c35_5b4e_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_c_l207_c35_5b4e_return_output := CONST_SR_4_uxn_c_l207_c35_5b4e_return_output;

     -- CAST_TO_uint4_t[uxn_c_l206_c22_444c] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_c_l206_c22_444c_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_device_ram_address);

     -- CONST_REF_RD_uint12_t_uint12_t_4_1_d41d_uxn_c_l218_l260_l240_DUPLICATE_1159 LATENCY=0
     VAR_CONST_REF_RD_uint12_t_uint12_t_4_1_d41d_uxn_c_l218_l260_l240_DUPLICATE_1159_return_output := color(1);

     -- Submodule level 1
     VAR_BIN_OP_EQ_uxn_c_l210_c7_6f7b_left := VAR_CAST_TO_uint4_t_uxn_c_l206_c22_444c_return_output;
     VAR_BIN_OP_EQ_uxn_c_l221_c12_da20_left := VAR_CAST_TO_uint4_t_uxn_c_l206_c22_444c_return_output;
     VAR_BIN_OP_EQ_uxn_c_l232_c12_9205_left := VAR_CAST_TO_uint4_t_uxn_c_l206_c22_444c_return_output;
     VAR_BIN_OP_EQ_uxn_c_l243_c12_e094_left := VAR_CAST_TO_uint4_t_uxn_c_l206_c22_444c_return_output;
     VAR_BIN_OP_EQ_uxn_c_l254_c12_b7ba_left := VAR_CAST_TO_uint4_t_uxn_c_l206_c22_444c_return_output;
     VAR_BIN_OP_EQ_uxn_c_l263_c12_7893_left := VAR_CAST_TO_uint4_t_uxn_c_l206_c22_444c_return_output;
     VAR_color_cmp_1_uxn_c_l208_c11_9311_0 := VAR_CAST_TO_uint4_t_uxn_c_l208_c25_6415_return_output;
     VAR_BIN_OP_AND_uxn_c_l213_c4_67f6_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_0_d41d_uxn_c_l213_l256_l235_DUPLICATE_a656_return_output;
     VAR_BIN_OP_AND_uxn_c_l235_c4_e977_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_0_d41d_uxn_c_l213_l256_l235_DUPLICATE_a656_return_output;
     VAR_BIN_OP_AND_uxn_c_l256_c4_78cb_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_0_d41d_uxn_c_l213_l256_l235_DUPLICATE_a656_return_output;
     VAR_BIN_OP_AND_uxn_c_l218_c4_79b2_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_1_d41d_uxn_c_l218_l260_l240_DUPLICATE_1159_return_output;
     VAR_BIN_OP_AND_uxn_c_l240_c4_4c03_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_1_d41d_uxn_c_l218_l260_l240_DUPLICATE_1159_return_output;
     VAR_BIN_OP_AND_uxn_c_l260_c4_2fbc_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_1_d41d_uxn_c_l218_l260_l240_DUPLICATE_1159_return_output;
     VAR_BIN_OP_AND_uxn_c_l224_c4_6d6b_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_uxn_c_l263_l265_l246_l224_DUPLICATE_871b_return_output;
     VAR_BIN_OP_AND_uxn_c_l246_c4_4338_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_uxn_c_l263_l265_l246_l224_DUPLICATE_871b_return_output;
     VAR_BIN_OP_AND_uxn_c_l265_c4_5831_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_uxn_c_l263_l265_l246_l224_DUPLICATE_871b_return_output;
     VAR_color_2_MUX_uxn_c_l263_c8_8929_iffalse := VAR_CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_uxn_c_l263_l265_l246_l224_DUPLICATE_871b_return_output;
     VAR_BIN_OP_AND_uxn_c_l229_c4_67d3_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_uxn_c_l229_l263_l269_l251_DUPLICATE_d0bd_return_output;
     VAR_BIN_OP_AND_uxn_c_l251_c4_3afb_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_uxn_c_l229_l263_l269_l251_DUPLICATE_d0bd_return_output;
     VAR_BIN_OP_AND_uxn_c_l269_c4_100c_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_uxn_c_l229_l263_l269_l251_DUPLICATE_d0bd_return_output;
     VAR_color_3_MUX_uxn_c_l263_c8_8929_iffalse := VAR_CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_uxn_c_l229_l263_l269_l251_DUPLICATE_d0bd_return_output;
     VAR_BIN_OP_EQ_uxn_c_l202_c30_ee54_left := VAR_CONST_SR_4_uxn_c_l202_c30_4199_return_output;
     VAR_tmp12_uxn_c_l216_c4_817a := resize(VAR_color_cmp_1_uxn_c_l208_c11_9311_0, 12);
     VAR_tmp12_uxn_c_l227_c4_b306 := resize(VAR_color_cmp_1_uxn_c_l208_c11_9311_0, 12);
     VAR_tmp12_uxn_c_l238_c4_030c := resize(VAR_color_cmp_1_uxn_c_l208_c11_9311_0, 12);
     VAR_tmp12_uxn_c_l249_c4_fe47 := resize(VAR_color_cmp_1_uxn_c_l208_c11_9311_0, 12);
     VAR_CONST_SL_8_uxn_c_l217_c4_bd57_x := VAR_tmp12_uxn_c_l216_c4_817a;
     VAR_CONST_SL_8_uxn_c_l228_c4_9868_x := VAR_tmp12_uxn_c_l227_c4_b306;
     VAR_CONST_SL_4_uxn_c_l239_c4_ae41_x := VAR_tmp12_uxn_c_l238_c4_030c;
     VAR_CONST_SL_4_uxn_c_l250_c4_ff9d_x := VAR_tmp12_uxn_c_l249_c4_fe47;
     -- BIN_OP_AND[uxn_c_l224_c4_6d6b] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l224_c4_6d6b_left <= VAR_BIN_OP_AND_uxn_c_l224_c4_6d6b_left;
     BIN_OP_AND_uxn_c_l224_c4_6d6b_right <= VAR_BIN_OP_AND_uxn_c_l224_c4_6d6b_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l224_c4_6d6b_return_output := BIN_OP_AND_uxn_c_l224_c4_6d6b_return_output;

     -- CONST_SL_8[uxn_c_l217_c4_bd57] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l217_c4_bd57_x <= VAR_CONST_SL_8_uxn_c_l217_c4_bd57_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l217_c4_bd57_return_output := CONST_SL_8_uxn_c_l217_c4_bd57_return_output;

     -- BIN_OP_EQ[uxn_c_l232_c12_9205] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l232_c12_9205_left <= VAR_BIN_OP_EQ_uxn_c_l232_c12_9205_left;
     BIN_OP_EQ_uxn_c_l232_c12_9205_right <= VAR_BIN_OP_EQ_uxn_c_l232_c12_9205_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l232_c12_9205_return_output := BIN_OP_EQ_uxn_c_l232_c12_9205_return_output;

     -- CAST_TO_uint4_t[uxn_c_l207_c25_bb80] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_c_l207_c25_bb80_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_CONST_SR_4_uxn_c_l207_c35_5b4e_return_output);

     -- CONST_SL_4[uxn_c_l250_c4_ff9d] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_c_l250_c4_ff9d_x <= VAR_CONST_SL_4_uxn_c_l250_c4_ff9d_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_c_l250_c4_ff9d_return_output := CONST_SL_4_uxn_c_l250_c4_ff9d_return_output;

     -- BIN_OP_AND[uxn_c_l251_c4_3afb] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l251_c4_3afb_left <= VAR_BIN_OP_AND_uxn_c_l251_c4_3afb_left;
     BIN_OP_AND_uxn_c_l251_c4_3afb_right <= VAR_BIN_OP_AND_uxn_c_l251_c4_3afb_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l251_c4_3afb_return_output := BIN_OP_AND_uxn_c_l251_c4_3afb_return_output;

     -- CAST_TO_uint12_t_uint4_t_uxn_c_l259_l268_DUPLICATE_6e5f LATENCY=0
     VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l259_l268_DUPLICATE_6e5f_return_output := CAST_TO_uint12_t_uint4_t(
     VAR_color_cmp_1_uxn_c_l208_c11_9311_0);

     -- BIN_OP_AND[uxn_c_l256_c4_78cb] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l256_c4_78cb_left <= VAR_BIN_OP_AND_uxn_c_l256_c4_78cb_left;
     BIN_OP_AND_uxn_c_l256_c4_78cb_right <= VAR_BIN_OP_AND_uxn_c_l256_c4_78cb_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l256_c4_78cb_return_output := BIN_OP_AND_uxn_c_l256_c4_78cb_return_output;

     -- BIN_OP_AND[uxn_c_l213_c4_67f6] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l213_c4_67f6_left <= VAR_BIN_OP_AND_uxn_c_l213_c4_67f6_left;
     BIN_OP_AND_uxn_c_l213_c4_67f6_right <= VAR_BIN_OP_AND_uxn_c_l213_c4_67f6_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l213_c4_67f6_return_output := BIN_OP_AND_uxn_c_l213_c4_67f6_return_output;

     -- BIN_OP_EQ[uxn_c_l210_c7_6f7b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l210_c7_6f7b_left <= VAR_BIN_OP_EQ_uxn_c_l210_c7_6f7b_left;
     BIN_OP_EQ_uxn_c_l210_c7_6f7b_right <= VAR_BIN_OP_EQ_uxn_c_l210_c7_6f7b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l210_c7_6f7b_return_output := BIN_OP_EQ_uxn_c_l210_c7_6f7b_return_output;

     -- BIN_OP_EQ[uxn_c_l243_c12_e094] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l243_c12_e094_left <= VAR_BIN_OP_EQ_uxn_c_l243_c12_e094_left;
     BIN_OP_EQ_uxn_c_l243_c12_e094_right <= VAR_BIN_OP_EQ_uxn_c_l243_c12_e094_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l243_c12_e094_return_output := BIN_OP_EQ_uxn_c_l243_c12_e094_return_output;

     -- BIN_OP_AND[uxn_c_l235_c4_e977] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l235_c4_e977_left <= VAR_BIN_OP_AND_uxn_c_l235_c4_e977_left;
     BIN_OP_AND_uxn_c_l235_c4_e977_right <= VAR_BIN_OP_AND_uxn_c_l235_c4_e977_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l235_c4_e977_return_output := BIN_OP_AND_uxn_c_l235_c4_e977_return_output;

     -- BIN_OP_AND[uxn_c_l218_c4_79b2] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l218_c4_79b2_left <= VAR_BIN_OP_AND_uxn_c_l218_c4_79b2_left;
     BIN_OP_AND_uxn_c_l218_c4_79b2_right <= VAR_BIN_OP_AND_uxn_c_l218_c4_79b2_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l218_c4_79b2_return_output := BIN_OP_AND_uxn_c_l218_c4_79b2_return_output;

     -- BIN_OP_EQ[uxn_c_l202_c30_ee54] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l202_c30_ee54_left <= VAR_BIN_OP_EQ_uxn_c_l202_c30_ee54_left;
     BIN_OP_EQ_uxn_c_l202_c30_ee54_right <= VAR_BIN_OP_EQ_uxn_c_l202_c30_ee54_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l202_c30_ee54_return_output := BIN_OP_EQ_uxn_c_l202_c30_ee54_return_output;

     -- BIN_OP_AND[uxn_c_l229_c4_67d3] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l229_c4_67d3_left <= VAR_BIN_OP_AND_uxn_c_l229_c4_67d3_left;
     BIN_OP_AND_uxn_c_l229_c4_67d3_right <= VAR_BIN_OP_AND_uxn_c_l229_c4_67d3_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l229_c4_67d3_return_output := BIN_OP_AND_uxn_c_l229_c4_67d3_return_output;

     -- BIN_OP_AND[uxn_c_l240_c4_4c03] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l240_c4_4c03_left <= VAR_BIN_OP_AND_uxn_c_l240_c4_4c03_left;
     BIN_OP_AND_uxn_c_l240_c4_4c03_right <= VAR_BIN_OP_AND_uxn_c_l240_c4_4c03_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l240_c4_4c03_return_output := BIN_OP_AND_uxn_c_l240_c4_4c03_return_output;

     -- BIN_OP_EQ[uxn_c_l221_c12_da20] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l221_c12_da20_left <= VAR_BIN_OP_EQ_uxn_c_l221_c12_da20_left;
     BIN_OP_EQ_uxn_c_l221_c12_da20_right <= VAR_BIN_OP_EQ_uxn_c_l221_c12_da20_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l221_c12_da20_return_output := BIN_OP_EQ_uxn_c_l221_c12_da20_return_output;

     -- BIN_OP_EQ[uxn_c_l254_c12_b7ba] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l254_c12_b7ba_left <= VAR_BIN_OP_EQ_uxn_c_l254_c12_b7ba_left;
     BIN_OP_EQ_uxn_c_l254_c12_b7ba_right <= VAR_BIN_OP_EQ_uxn_c_l254_c12_b7ba_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l254_c12_b7ba_return_output := BIN_OP_EQ_uxn_c_l254_c12_b7ba_return_output;

     -- BIN_OP_AND[uxn_c_l265_c4_5831] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l265_c4_5831_left <= VAR_BIN_OP_AND_uxn_c_l265_c4_5831_left;
     BIN_OP_AND_uxn_c_l265_c4_5831_right <= VAR_BIN_OP_AND_uxn_c_l265_c4_5831_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l265_c4_5831_return_output := BIN_OP_AND_uxn_c_l265_c4_5831_return_output;

     -- CONST_SL_4[uxn_c_l239_c4_ae41] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_c_l239_c4_ae41_x <= VAR_CONST_SL_4_uxn_c_l239_c4_ae41_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_c_l239_c4_ae41_return_output := CONST_SL_4_uxn_c_l239_c4_ae41_return_output;

     -- BIN_OP_EQ[uxn_c_l263_c12_7893] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l263_c12_7893_left <= VAR_BIN_OP_EQ_uxn_c_l263_c12_7893_left;
     BIN_OP_EQ_uxn_c_l263_c12_7893_right <= VAR_BIN_OP_EQ_uxn_c_l263_c12_7893_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l263_c12_7893_return_output := BIN_OP_EQ_uxn_c_l263_c12_7893_return_output;

     -- BIN_OP_AND[uxn_c_l246_c4_4338] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l246_c4_4338_left <= VAR_BIN_OP_AND_uxn_c_l246_c4_4338_left;
     BIN_OP_AND_uxn_c_l246_c4_4338_right <= VAR_BIN_OP_AND_uxn_c_l246_c4_4338_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l246_c4_4338_return_output := BIN_OP_AND_uxn_c_l246_c4_4338_return_output;

     -- BIN_OP_AND[uxn_c_l269_c4_100c] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l269_c4_100c_left <= VAR_BIN_OP_AND_uxn_c_l269_c4_100c_left;
     BIN_OP_AND_uxn_c_l269_c4_100c_right <= VAR_BIN_OP_AND_uxn_c_l269_c4_100c_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l269_c4_100c_return_output := BIN_OP_AND_uxn_c_l269_c4_100c_return_output;

     -- BIN_OP_AND[uxn_c_l260_c4_2fbc] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l260_c4_2fbc_left <= VAR_BIN_OP_AND_uxn_c_l260_c4_2fbc_left;
     BIN_OP_AND_uxn_c_l260_c4_2fbc_right <= VAR_BIN_OP_AND_uxn_c_l260_c4_2fbc_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l260_c4_2fbc_return_output := BIN_OP_AND_uxn_c_l260_c4_2fbc_return_output;

     -- CONST_SL_8[uxn_c_l228_c4_9868] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l228_c4_9868_x <= VAR_CONST_SL_8_uxn_c_l228_c4_9868_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l228_c4_9868_return_output := CONST_SL_8_uxn_c_l228_c4_9868_return_output;

     -- Submodule level 2
     VAR_BIN_OP_OR_uxn_c_l214_c4_a25c_left := VAR_BIN_OP_AND_uxn_c_l213_c4_67f6_return_output;
     VAR_BIN_OP_OR_uxn_c_l219_c4_212b_left := VAR_BIN_OP_AND_uxn_c_l218_c4_79b2_return_output;
     VAR_BIN_OP_OR_uxn_c_l225_c4_cf11_left := VAR_BIN_OP_AND_uxn_c_l224_c4_6d6b_return_output;
     VAR_BIN_OP_OR_uxn_c_l230_c4_d767_left := VAR_BIN_OP_AND_uxn_c_l229_c4_67d3_return_output;
     VAR_BIN_OP_OR_uxn_c_l236_c4_f7d3_left := VAR_BIN_OP_AND_uxn_c_l235_c4_e977_return_output;
     VAR_BIN_OP_OR_uxn_c_l241_c4_62d9_left := VAR_BIN_OP_AND_uxn_c_l240_c4_4c03_return_output;
     VAR_BIN_OP_OR_uxn_c_l247_c4_7d9c_left := VAR_BIN_OP_AND_uxn_c_l246_c4_4338_return_output;
     VAR_BIN_OP_OR_uxn_c_l252_c4_a2b5_left := VAR_BIN_OP_AND_uxn_c_l251_c4_3afb_return_output;
     VAR_BIN_OP_OR_uxn_c_l257_c4_24af_left := VAR_BIN_OP_AND_uxn_c_l256_c4_78cb_return_output;
     VAR_BIN_OP_OR_uxn_c_l261_c4_7b48_left := VAR_BIN_OP_AND_uxn_c_l260_c4_2fbc_return_output;
     VAR_BIN_OP_OR_uxn_c_l266_c4_03da_left := VAR_BIN_OP_AND_uxn_c_l265_c4_5831_return_output;
     VAR_BIN_OP_OR_uxn_c_l270_c4_8477_left := VAR_BIN_OP_AND_uxn_c_l269_c4_100c_return_output;
     VAR_MUX_uxn_c_l202_c30_837a_cond := VAR_BIN_OP_EQ_uxn_c_l202_c30_ee54_return_output;
     VAR_color_MUX_uxn_c_l210_c3_da8b_cond := VAR_BIN_OP_EQ_uxn_c_l210_c7_6f7b_return_output;
     VAR_color_MUX_uxn_c_l221_c8_5c6e_cond := VAR_BIN_OP_EQ_uxn_c_l221_c12_da20_return_output;
     VAR_color_MUX_uxn_c_l232_c8_1e04_cond := VAR_BIN_OP_EQ_uxn_c_l232_c12_9205_return_output;
     VAR_color_MUX_uxn_c_l243_c8_d4e3_cond := VAR_BIN_OP_EQ_uxn_c_l243_c12_e094_return_output;
     VAR_color_MUX_uxn_c_l254_c8_4c57_cond := VAR_BIN_OP_EQ_uxn_c_l254_c12_b7ba_return_output;
     VAR_color_2_MUX_uxn_c_l263_c8_8929_cond := VAR_BIN_OP_EQ_uxn_c_l263_c12_7893_return_output;
     VAR_color_3_MUX_uxn_c_l263_c8_8929_cond := VAR_BIN_OP_EQ_uxn_c_l263_c12_7893_return_output;
     VAR_BIN_OP_OR_uxn_c_l261_c4_7b48_right := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l259_l268_DUPLICATE_6e5f_return_output;
     VAR_BIN_OP_OR_uxn_c_l270_c4_8477_right := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l259_l268_DUPLICATE_6e5f_return_output;
     VAR_color_cmp_0_uxn_c_l207_c11_52f4_0 := VAR_CAST_TO_uint4_t_uxn_c_l207_c25_bb80_return_output;
     VAR_BIN_OP_OR_uxn_c_l241_c4_62d9_right := VAR_CONST_SL_4_uxn_c_l239_c4_ae41_return_output;
     VAR_BIN_OP_OR_uxn_c_l252_c4_a2b5_right := VAR_CONST_SL_4_uxn_c_l250_c4_ff9d_return_output;
     VAR_BIN_OP_OR_uxn_c_l219_c4_212b_right := VAR_CONST_SL_8_uxn_c_l217_c4_bd57_return_output;
     VAR_BIN_OP_OR_uxn_c_l230_c4_d767_right := VAR_CONST_SL_8_uxn_c_l228_c4_9868_return_output;
     VAR_tmp12_uxn_c_l211_c4_f2fe := resize(VAR_color_cmp_0_uxn_c_l207_c11_52f4_0, 12);
     VAR_tmp12_uxn_c_l222_c4_d646 := resize(VAR_color_cmp_0_uxn_c_l207_c11_52f4_0, 12);
     VAR_tmp12_uxn_c_l233_c4_debb := resize(VAR_color_cmp_0_uxn_c_l207_c11_52f4_0, 12);
     VAR_tmp12_uxn_c_l244_c4_7069 := resize(VAR_color_cmp_0_uxn_c_l207_c11_52f4_0, 12);
     VAR_CONST_SL_8_uxn_c_l212_c4_ca8c_x := VAR_tmp12_uxn_c_l211_c4_f2fe;
     VAR_CONST_SL_8_uxn_c_l223_c4_c915_x := VAR_tmp12_uxn_c_l222_c4_d646;
     VAR_CONST_SL_4_uxn_c_l234_c4_7571_x := VAR_tmp12_uxn_c_l233_c4_debb;
     VAR_CONST_SL_4_uxn_c_l245_c4_e18e_x := VAR_tmp12_uxn_c_l244_c4_7069;
     -- BIN_OP_OR[uxn_c_l270_c4_8477] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l270_c4_8477_left <= VAR_BIN_OP_OR_uxn_c_l270_c4_8477_left;
     BIN_OP_OR_uxn_c_l270_c4_8477_right <= VAR_BIN_OP_OR_uxn_c_l270_c4_8477_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l270_c4_8477_return_output := BIN_OP_OR_uxn_c_l270_c4_8477_return_output;

     -- CONST_SL_8[uxn_c_l212_c4_ca8c] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l212_c4_ca8c_x <= VAR_CONST_SL_8_uxn_c_l212_c4_ca8c_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l212_c4_ca8c_return_output := CONST_SL_8_uxn_c_l212_c4_ca8c_return_output;

     -- MUX[uxn_c_l202_c30_837a] LATENCY=0
     -- Inputs
     MUX_uxn_c_l202_c30_837a_cond <= VAR_MUX_uxn_c_l202_c30_837a_cond;
     MUX_uxn_c_l202_c30_837a_iftrue <= VAR_MUX_uxn_c_l202_c30_837a_iftrue;
     MUX_uxn_c_l202_c30_837a_iffalse <= VAR_MUX_uxn_c_l202_c30_837a_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l202_c30_837a_return_output := MUX_uxn_c_l202_c30_837a_return_output;

     -- CAST_TO_uint12_t_uint4_t_uxn_c_l255_l264_DUPLICATE_15d4 LATENCY=0
     VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l255_l264_DUPLICATE_15d4_return_output := CAST_TO_uint12_t_uint4_t(
     VAR_color_cmp_0_uxn_c_l207_c11_52f4_0);

     -- CONST_SL_8[uxn_c_l223_c4_c915] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l223_c4_c915_x <= VAR_CONST_SL_8_uxn_c_l223_c4_c915_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l223_c4_c915_return_output := CONST_SL_8_uxn_c_l223_c4_c915_return_output;

     -- CONST_SL_4[uxn_c_l245_c4_e18e] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_c_l245_c4_e18e_x <= VAR_CONST_SL_4_uxn_c_l245_c4_e18e_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_c_l245_c4_e18e_return_output := CONST_SL_4_uxn_c_l245_c4_e18e_return_output;

     -- BIN_OP_OR[uxn_c_l230_c4_d767] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l230_c4_d767_left <= VAR_BIN_OP_OR_uxn_c_l230_c4_d767_left;
     BIN_OP_OR_uxn_c_l230_c4_d767_right <= VAR_BIN_OP_OR_uxn_c_l230_c4_d767_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l230_c4_d767_return_output := BIN_OP_OR_uxn_c_l230_c4_d767_return_output;

     -- CONST_SL_4[uxn_c_l234_c4_7571] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_c_l234_c4_7571_x <= VAR_CONST_SL_4_uxn_c_l234_c4_7571_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_c_l234_c4_7571_return_output := CONST_SL_4_uxn_c_l234_c4_7571_return_output;

     -- BIN_OP_OR[uxn_c_l241_c4_62d9] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l241_c4_62d9_left <= VAR_BIN_OP_OR_uxn_c_l241_c4_62d9_left;
     BIN_OP_OR_uxn_c_l241_c4_62d9_right <= VAR_BIN_OP_OR_uxn_c_l241_c4_62d9_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l241_c4_62d9_return_output := BIN_OP_OR_uxn_c_l241_c4_62d9_return_output;

     -- BIN_OP_OR[uxn_c_l261_c4_7b48] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l261_c4_7b48_left <= VAR_BIN_OP_OR_uxn_c_l261_c4_7b48_left;
     BIN_OP_OR_uxn_c_l261_c4_7b48_right <= VAR_BIN_OP_OR_uxn_c_l261_c4_7b48_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l261_c4_7b48_return_output := BIN_OP_OR_uxn_c_l261_c4_7b48_return_output;

     -- BIN_OP_OR[uxn_c_l219_c4_212b] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l219_c4_212b_left <= VAR_BIN_OP_OR_uxn_c_l219_c4_212b_left;
     BIN_OP_OR_uxn_c_l219_c4_212b_right <= VAR_BIN_OP_OR_uxn_c_l219_c4_212b_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l219_c4_212b_return_output := BIN_OP_OR_uxn_c_l219_c4_212b_return_output;

     -- BIN_OP_OR[uxn_c_l252_c4_a2b5] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l252_c4_a2b5_left <= VAR_BIN_OP_OR_uxn_c_l252_c4_a2b5_left;
     BIN_OP_OR_uxn_c_l252_c4_a2b5_right <= VAR_BIN_OP_OR_uxn_c_l252_c4_a2b5_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l252_c4_a2b5_return_output := BIN_OP_OR_uxn_c_l252_c4_a2b5_return_output;

     -- Submodule level 3
     VAR_color_3_MUX_uxn_c_l263_c8_8929_iftrue := VAR_BIN_OP_OR_uxn_c_l270_c4_8477_return_output;
     VAR_BIN_OP_OR_uxn_c_l257_c4_24af_right := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l255_l264_DUPLICATE_15d4_return_output;
     VAR_BIN_OP_OR_uxn_c_l266_c4_03da_right := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l255_l264_DUPLICATE_15d4_return_output;
     VAR_BIN_OP_OR_uxn_c_l236_c4_f7d3_right := VAR_CONST_SL_4_uxn_c_l234_c4_7571_return_output;
     VAR_BIN_OP_OR_uxn_c_l247_c4_7d9c_right := VAR_CONST_SL_4_uxn_c_l245_c4_e18e_return_output;
     VAR_BIN_OP_OR_uxn_c_l214_c4_a25c_right := VAR_CONST_SL_8_uxn_c_l212_c4_ca8c_return_output;
     VAR_BIN_OP_OR_uxn_c_l225_c4_cf11_right := VAR_CONST_SL_8_uxn_c_l223_c4_c915_return_output;
     VAR_BIN_OP_AND_uxn_c_l204_c6_8853_right := VAR_MUX_uxn_c_l202_c30_837a_return_output;
     -- BIN_OP_OR[uxn_c_l214_c4_a25c] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l214_c4_a25c_left <= VAR_BIN_OP_OR_uxn_c_l214_c4_a25c_left;
     BIN_OP_OR_uxn_c_l214_c4_a25c_right <= VAR_BIN_OP_OR_uxn_c_l214_c4_a25c_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l214_c4_a25c_return_output := BIN_OP_OR_uxn_c_l214_c4_a25c_return_output;

     -- BIN_OP_AND[uxn_c_l204_c6_8853] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l204_c6_8853_left <= VAR_BIN_OP_AND_uxn_c_l204_c6_8853_left;
     BIN_OP_AND_uxn_c_l204_c6_8853_right <= VAR_BIN_OP_AND_uxn_c_l204_c6_8853_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l204_c6_8853_return_output := BIN_OP_AND_uxn_c_l204_c6_8853_return_output;

     -- BIN_OP_OR[uxn_c_l236_c4_f7d3] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l236_c4_f7d3_left <= VAR_BIN_OP_OR_uxn_c_l236_c4_f7d3_left;
     BIN_OP_OR_uxn_c_l236_c4_f7d3_right <= VAR_BIN_OP_OR_uxn_c_l236_c4_f7d3_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l236_c4_f7d3_return_output := BIN_OP_OR_uxn_c_l236_c4_f7d3_return_output;

     -- color_3_MUX[uxn_c_l263_c8_8929] LATENCY=0
     -- Inputs
     color_3_MUX_uxn_c_l263_c8_8929_cond <= VAR_color_3_MUX_uxn_c_l263_c8_8929_cond;
     color_3_MUX_uxn_c_l263_c8_8929_iftrue <= VAR_color_3_MUX_uxn_c_l263_c8_8929_iftrue;
     color_3_MUX_uxn_c_l263_c8_8929_iffalse <= VAR_color_3_MUX_uxn_c_l263_c8_8929_iffalse;
     -- Outputs
     VAR_color_3_MUX_uxn_c_l263_c8_8929_return_output := color_3_MUX_uxn_c_l263_c8_8929_return_output;

     -- BIN_OP_OR[uxn_c_l225_c4_cf11] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l225_c4_cf11_left <= VAR_BIN_OP_OR_uxn_c_l225_c4_cf11_left;
     BIN_OP_OR_uxn_c_l225_c4_cf11_right <= VAR_BIN_OP_OR_uxn_c_l225_c4_cf11_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l225_c4_cf11_return_output := BIN_OP_OR_uxn_c_l225_c4_cf11_return_output;

     -- BIN_OP_OR[uxn_c_l247_c4_7d9c] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l247_c4_7d9c_left <= VAR_BIN_OP_OR_uxn_c_l247_c4_7d9c_left;
     BIN_OP_OR_uxn_c_l247_c4_7d9c_right <= VAR_BIN_OP_OR_uxn_c_l247_c4_7d9c_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l247_c4_7d9c_return_output := BIN_OP_OR_uxn_c_l247_c4_7d9c_return_output;

     -- BIN_OP_OR[uxn_c_l266_c4_03da] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l266_c4_03da_left <= VAR_BIN_OP_OR_uxn_c_l266_c4_03da_left;
     BIN_OP_OR_uxn_c_l266_c4_03da_right <= VAR_BIN_OP_OR_uxn_c_l266_c4_03da_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l266_c4_03da_return_output := BIN_OP_OR_uxn_c_l266_c4_03da_return_output;

     -- BIN_OP_OR[uxn_c_l257_c4_24af] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l257_c4_24af_left <= VAR_BIN_OP_OR_uxn_c_l257_c4_24af_left;
     BIN_OP_OR_uxn_c_l257_c4_24af_right <= VAR_BIN_OP_OR_uxn_c_l257_c4_24af_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l257_c4_24af_return_output := BIN_OP_OR_uxn_c_l257_c4_24af_return_output;

     -- Submodule level 4
     VAR_color_MUX_uxn_c_l204_c2_f4ec_cond := VAR_BIN_OP_AND_uxn_c_l204_c6_8853_return_output;
     VAR_color_2_MUX_uxn_c_l263_c8_8929_iftrue := VAR_BIN_OP_OR_uxn_c_l266_c4_03da_return_output;
     -- color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8[uxn_c_l232_c8_1e04] LATENCY=0
     VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l232_c8_1e04_return_output := CONST_REF_RD_uint12_t_4_uint12_t_4_90b8(
     color,
     VAR_BIN_OP_OR_uxn_c_l236_c4_f7d3_return_output,
     VAR_BIN_OP_OR_uxn_c_l241_c4_62d9_return_output);

     -- color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8[uxn_c_l254_c8_4c57] LATENCY=0
     VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l254_c8_4c57_return_output := CONST_REF_RD_uint12_t_4_uint12_t_4_90b8(
     color,
     VAR_BIN_OP_OR_uxn_c_l257_c4_24af_return_output,
     VAR_BIN_OP_OR_uxn_c_l261_c4_7b48_return_output);

     -- color_2_MUX[uxn_c_l263_c8_8929] LATENCY=0
     -- Inputs
     color_2_MUX_uxn_c_l263_c8_8929_cond <= VAR_color_2_MUX_uxn_c_l263_c8_8929_cond;
     color_2_MUX_uxn_c_l263_c8_8929_iftrue <= VAR_color_2_MUX_uxn_c_l263_c8_8929_iftrue;
     color_2_MUX_uxn_c_l263_c8_8929_iffalse <= VAR_color_2_MUX_uxn_c_l263_c8_8929_iffalse;
     -- Outputs
     VAR_color_2_MUX_uxn_c_l263_c8_8929_return_output := color_2_MUX_uxn_c_l263_c8_8929_return_output;

     -- color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5[uxn_c_l221_c8_5c6e] LATENCY=0
     VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l221_c8_5c6e_return_output := CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5(
     color,
     VAR_BIN_OP_OR_uxn_c_l225_c4_cf11_return_output,
     VAR_BIN_OP_OR_uxn_c_l230_c4_d767_return_output);

     -- color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5[uxn_c_l243_c8_d4e3] LATENCY=0
     VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l243_c8_d4e3_return_output := CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5(
     color,
     VAR_BIN_OP_OR_uxn_c_l247_c4_7d9c_return_output,
     VAR_BIN_OP_OR_uxn_c_l252_c4_a2b5_return_output);

     -- color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8[uxn_c_l210_c3_da8b] LATENCY=0
     VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l210_c3_da8b_return_output := CONST_REF_RD_uint12_t_4_uint12_t_4_90b8(
     color,
     VAR_BIN_OP_OR_uxn_c_l214_c4_a25c_return_output,
     VAR_BIN_OP_OR_uxn_c_l219_c4_212b_return_output);

     -- Submodule level 5
     VAR_color_MUX_uxn_c_l210_c3_da8b_iftrue := VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l210_c3_da8b_return_output;
     VAR_color_MUX_uxn_c_l232_c8_1e04_iftrue := VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l232_c8_1e04_return_output;
     VAR_color_MUX_uxn_c_l254_c8_4c57_iftrue := VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l254_c8_4c57_return_output;
     VAR_color_MUX_uxn_c_l221_c8_5c6e_iftrue := VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l221_c8_5c6e_return_output;
     VAR_color_MUX_uxn_c_l243_c8_d4e3_iftrue := VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l243_c8_d4e3_return_output;
     -- color_FALSE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_3db8[uxn_c_l254_c8_4c57] LATENCY=0
     VAR_color_FALSE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_3db8_uxn_c_l254_c8_4c57_return_output := CONST_REF_RD_uint12_t_4_uint12_t_4_3db8(
     color,
     VAR_color_3_MUX_uxn_c_l263_c8_8929_return_output,
     VAR_color_2_MUX_uxn_c_l263_c8_8929_return_output);

     -- Submodule level 6
     VAR_color_MUX_uxn_c_l254_c8_4c57_iffalse := VAR_color_FALSE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_3db8_uxn_c_l254_c8_4c57_return_output;
     -- color_MUX[uxn_c_l254_c8_4c57] LATENCY=0
     -- Inputs
     color_MUX_uxn_c_l254_c8_4c57_cond <= VAR_color_MUX_uxn_c_l254_c8_4c57_cond;
     color_MUX_uxn_c_l254_c8_4c57_iftrue <= VAR_color_MUX_uxn_c_l254_c8_4c57_iftrue;
     color_MUX_uxn_c_l254_c8_4c57_iffalse <= VAR_color_MUX_uxn_c_l254_c8_4c57_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_c_l254_c8_4c57_return_output := color_MUX_uxn_c_l254_c8_4c57_return_output;

     -- Submodule level 7
     VAR_color_MUX_uxn_c_l243_c8_d4e3_iffalse := VAR_color_MUX_uxn_c_l254_c8_4c57_return_output;
     -- color_MUX[uxn_c_l243_c8_d4e3] LATENCY=0
     -- Inputs
     color_MUX_uxn_c_l243_c8_d4e3_cond <= VAR_color_MUX_uxn_c_l243_c8_d4e3_cond;
     color_MUX_uxn_c_l243_c8_d4e3_iftrue <= VAR_color_MUX_uxn_c_l243_c8_d4e3_iftrue;
     color_MUX_uxn_c_l243_c8_d4e3_iffalse <= VAR_color_MUX_uxn_c_l243_c8_d4e3_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_c_l243_c8_d4e3_return_output := color_MUX_uxn_c_l243_c8_d4e3_return_output;

     -- Submodule level 8
     VAR_color_MUX_uxn_c_l232_c8_1e04_iffalse := VAR_color_MUX_uxn_c_l243_c8_d4e3_return_output;
     -- color_MUX[uxn_c_l232_c8_1e04] LATENCY=0
     -- Inputs
     color_MUX_uxn_c_l232_c8_1e04_cond <= VAR_color_MUX_uxn_c_l232_c8_1e04_cond;
     color_MUX_uxn_c_l232_c8_1e04_iftrue <= VAR_color_MUX_uxn_c_l232_c8_1e04_iftrue;
     color_MUX_uxn_c_l232_c8_1e04_iffalse <= VAR_color_MUX_uxn_c_l232_c8_1e04_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_c_l232_c8_1e04_return_output := color_MUX_uxn_c_l232_c8_1e04_return_output;

     -- Submodule level 9
     VAR_color_MUX_uxn_c_l221_c8_5c6e_iffalse := VAR_color_MUX_uxn_c_l232_c8_1e04_return_output;
     -- color_MUX[uxn_c_l221_c8_5c6e] LATENCY=0
     -- Inputs
     color_MUX_uxn_c_l221_c8_5c6e_cond <= VAR_color_MUX_uxn_c_l221_c8_5c6e_cond;
     color_MUX_uxn_c_l221_c8_5c6e_iftrue <= VAR_color_MUX_uxn_c_l221_c8_5c6e_iftrue;
     color_MUX_uxn_c_l221_c8_5c6e_iffalse <= VAR_color_MUX_uxn_c_l221_c8_5c6e_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_c_l221_c8_5c6e_return_output := color_MUX_uxn_c_l221_c8_5c6e_return_output;

     -- Submodule level 10
     VAR_color_MUX_uxn_c_l210_c3_da8b_iffalse := VAR_color_MUX_uxn_c_l221_c8_5c6e_return_output;
     -- color_MUX[uxn_c_l210_c3_da8b] LATENCY=0
     -- Inputs
     color_MUX_uxn_c_l210_c3_da8b_cond <= VAR_color_MUX_uxn_c_l210_c3_da8b_cond;
     color_MUX_uxn_c_l210_c3_da8b_iftrue <= VAR_color_MUX_uxn_c_l210_c3_da8b_iftrue;
     color_MUX_uxn_c_l210_c3_da8b_iffalse <= VAR_color_MUX_uxn_c_l210_c3_da8b_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_c_l210_c3_da8b_return_output := color_MUX_uxn_c_l210_c3_da8b_return_output;

     -- Submodule level 11
     VAR_color_MUX_uxn_c_l204_c2_f4ec_iftrue := VAR_color_MUX_uxn_c_l210_c3_da8b_return_output;
     -- color_MUX[uxn_c_l204_c2_f4ec] LATENCY=0
     -- Inputs
     color_MUX_uxn_c_l204_c2_f4ec_cond <= VAR_color_MUX_uxn_c_l204_c2_f4ec_cond;
     color_MUX_uxn_c_l204_c2_f4ec_iftrue <= VAR_color_MUX_uxn_c_l204_c2_f4ec_iftrue;
     color_MUX_uxn_c_l204_c2_f4ec_iffalse <= VAR_color_MUX_uxn_c_l204_c2_f4ec_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_c_l204_c2_f4ec_return_output := color_MUX_uxn_c_l204_c2_f4ec_return_output;

     -- Submodule level 12
     VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l274_c20_de92_ref_toks_0 := VAR_color_MUX_uxn_c_l204_c2_f4ec_return_output;
     REG_VAR_color := VAR_color_MUX_uxn_c_l204_c2_f4ec_return_output;
     -- VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d[uxn_c_l274_c20_de92] LATENCY=0
     -- Inputs
     VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l274_c20_de92_ref_toks_0 <= VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l274_c20_de92_ref_toks_0;
     VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l274_c20_de92_var_dim_0 <= VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l274_c20_de92_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l274_c20_de92_return_output := VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l274_c20_de92_return_output;

     -- Submodule level 13
     VAR_result_uxn_c_l274_c11_21ee_0 := resize(VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l274_c20_de92_return_output, 16);
     VAR_return_output := VAR_result_uxn_c_l274_c11_21ee_0;
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
