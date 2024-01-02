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
-- CONST_SR_4[uxn_c_l248_c30_35a3]
signal CONST_SR_4_uxn_c_l248_c30_35a3_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_c_l248_c30_35a3_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_c_l248_c30_1325]
signal BIN_OP_EQ_uxn_c_l248_c30_1325_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l248_c30_1325_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l248_c30_1325_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l248_c30_99e2]
signal MUX_uxn_c_l248_c30_99e2_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l248_c30_99e2_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l248_c30_99e2_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l248_c30_99e2_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l250_c6_d025]
signal BIN_OP_AND_uxn_c_l250_c6_d025_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l250_c6_d025_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l250_c6_d025_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_c_l250_c2_2ee2]
signal color_MUX_uxn_c_l250_c2_2ee2_cond : unsigned(0 downto 0);
signal color_MUX_uxn_c_l250_c2_2ee2_iftrue : uint12_t_4;
signal color_MUX_uxn_c_l250_c2_2ee2_iffalse : uint12_t_4;
signal color_MUX_uxn_c_l250_c2_2ee2_return_output : uint12_t_4;

-- CONST_SR_4[uxn_c_l253_c35_0675]
signal CONST_SR_4_uxn_c_l253_c35_0675_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_c_l253_c35_0675_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_c_l256_c7_1197]
signal BIN_OP_EQ_uxn_c_l256_c7_1197_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l256_c7_1197_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l256_c7_1197_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_c_l256_c3_84cd]
signal color_MUX_uxn_c_l256_c3_84cd_cond : unsigned(0 downto 0);
signal color_MUX_uxn_c_l256_c3_84cd_iftrue : uint12_t_4;
signal color_MUX_uxn_c_l256_c3_84cd_iffalse : uint12_t_4;
signal color_MUX_uxn_c_l256_c3_84cd_return_output : uint12_t_4;

-- CONST_SL_8[uxn_c_l258_c4_43fa]
signal CONST_SL_8_uxn_c_l258_c4_43fa_x : unsigned(11 downto 0);
signal CONST_SL_8_uxn_c_l258_c4_43fa_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l259_c4_61bf]
signal BIN_OP_AND_uxn_c_l259_c4_61bf_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l259_c4_61bf_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l259_c4_61bf_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l260_c4_d72b]
signal BIN_OP_OR_uxn_c_l260_c4_d72b_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l260_c4_d72b_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l260_c4_d72b_return_output : unsigned(11 downto 0);

-- CONST_SL_8[uxn_c_l263_c4_44ab]
signal CONST_SL_8_uxn_c_l263_c4_44ab_x : unsigned(11 downto 0);
signal CONST_SL_8_uxn_c_l263_c4_44ab_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l264_c4_f8ef]
signal BIN_OP_AND_uxn_c_l264_c4_f8ef_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l264_c4_f8ef_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l264_c4_f8ef_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l265_c4_123f]
signal BIN_OP_OR_uxn_c_l265_c4_123f_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l265_c4_123f_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l265_c4_123f_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l267_c12_a760]
signal BIN_OP_EQ_uxn_c_l267_c12_a760_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l267_c12_a760_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l267_c12_a760_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_c_l267_c8_673f]
signal color_MUX_uxn_c_l267_c8_673f_cond : unsigned(0 downto 0);
signal color_MUX_uxn_c_l267_c8_673f_iftrue : uint12_t_4;
signal color_MUX_uxn_c_l267_c8_673f_iffalse : uint12_t_4;
signal color_MUX_uxn_c_l267_c8_673f_return_output : uint12_t_4;

-- CONST_SL_8[uxn_c_l269_c4_3507]
signal CONST_SL_8_uxn_c_l269_c4_3507_x : unsigned(11 downto 0);
signal CONST_SL_8_uxn_c_l269_c4_3507_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l270_c4_8dc9]
signal BIN_OP_AND_uxn_c_l270_c4_8dc9_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l270_c4_8dc9_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l270_c4_8dc9_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l271_c4_f4e9]
signal BIN_OP_OR_uxn_c_l271_c4_f4e9_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l271_c4_f4e9_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l271_c4_f4e9_return_output : unsigned(11 downto 0);

-- CONST_SL_8[uxn_c_l274_c4_982c]
signal CONST_SL_8_uxn_c_l274_c4_982c_x : unsigned(11 downto 0);
signal CONST_SL_8_uxn_c_l274_c4_982c_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l275_c4_124c]
signal BIN_OP_AND_uxn_c_l275_c4_124c_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l275_c4_124c_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l275_c4_124c_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l276_c4_66b4]
signal BIN_OP_OR_uxn_c_l276_c4_66b4_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l276_c4_66b4_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l276_c4_66b4_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l278_c12_c711]
signal BIN_OP_EQ_uxn_c_l278_c12_c711_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l278_c12_c711_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l278_c12_c711_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_c_l278_c8_4ce6]
signal color_MUX_uxn_c_l278_c8_4ce6_cond : unsigned(0 downto 0);
signal color_MUX_uxn_c_l278_c8_4ce6_iftrue : uint12_t_4;
signal color_MUX_uxn_c_l278_c8_4ce6_iffalse : uint12_t_4;
signal color_MUX_uxn_c_l278_c8_4ce6_return_output : uint12_t_4;

-- CONST_SL_4[uxn_c_l280_c4_b084]
signal CONST_SL_4_uxn_c_l280_c4_b084_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_c_l280_c4_b084_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l281_c4_767a]
signal BIN_OP_AND_uxn_c_l281_c4_767a_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l281_c4_767a_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l281_c4_767a_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l282_c4_96f5]
signal BIN_OP_OR_uxn_c_l282_c4_96f5_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l282_c4_96f5_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l282_c4_96f5_return_output : unsigned(11 downto 0);

-- CONST_SL_4[uxn_c_l285_c4_0bb0]
signal CONST_SL_4_uxn_c_l285_c4_0bb0_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_c_l285_c4_0bb0_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l286_c4_2944]
signal BIN_OP_AND_uxn_c_l286_c4_2944_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l286_c4_2944_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l286_c4_2944_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l287_c4_37a4]
signal BIN_OP_OR_uxn_c_l287_c4_37a4_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l287_c4_37a4_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l287_c4_37a4_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l289_c12_5e94]
signal BIN_OP_EQ_uxn_c_l289_c12_5e94_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l289_c12_5e94_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l289_c12_5e94_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_c_l289_c8_1fdc]
signal color_MUX_uxn_c_l289_c8_1fdc_cond : unsigned(0 downto 0);
signal color_MUX_uxn_c_l289_c8_1fdc_iftrue : uint12_t_4;
signal color_MUX_uxn_c_l289_c8_1fdc_iffalse : uint12_t_4;
signal color_MUX_uxn_c_l289_c8_1fdc_return_output : uint12_t_4;

-- CONST_SL_4[uxn_c_l291_c4_a674]
signal CONST_SL_4_uxn_c_l291_c4_a674_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_c_l291_c4_a674_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l292_c4_abe6]
signal BIN_OP_AND_uxn_c_l292_c4_abe6_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l292_c4_abe6_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l292_c4_abe6_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l293_c4_78c0]
signal BIN_OP_OR_uxn_c_l293_c4_78c0_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l293_c4_78c0_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l293_c4_78c0_return_output : unsigned(11 downto 0);

-- CONST_SL_4[uxn_c_l296_c4_d505]
signal CONST_SL_4_uxn_c_l296_c4_d505_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_c_l296_c4_d505_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l297_c4_cd61]
signal BIN_OP_AND_uxn_c_l297_c4_cd61_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l297_c4_cd61_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l297_c4_cd61_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l298_c4_f7bc]
signal BIN_OP_OR_uxn_c_l298_c4_f7bc_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l298_c4_f7bc_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l298_c4_f7bc_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l300_c12_d22b]
signal BIN_OP_EQ_uxn_c_l300_c12_d22b_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l300_c12_d22b_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l300_c12_d22b_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_c_l300_c8_ac26]
signal color_MUX_uxn_c_l300_c8_ac26_cond : unsigned(0 downto 0);
signal color_MUX_uxn_c_l300_c8_ac26_iftrue : uint12_t_4;
signal color_MUX_uxn_c_l300_c8_ac26_iffalse : uint12_t_4;
signal color_MUX_uxn_c_l300_c8_ac26_return_output : uint12_t_4;

-- BIN_OP_AND[uxn_c_l302_c4_5c61]
signal BIN_OP_AND_uxn_c_l302_c4_5c61_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l302_c4_5c61_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l302_c4_5c61_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l303_c4_4030]
signal BIN_OP_OR_uxn_c_l303_c4_4030_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l303_c4_4030_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l303_c4_4030_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l306_c4_b046]
signal BIN_OP_AND_uxn_c_l306_c4_b046_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l306_c4_b046_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l306_c4_b046_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l307_c4_4c2b]
signal BIN_OP_OR_uxn_c_l307_c4_4c2b_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l307_c4_4c2b_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l307_c4_4c2b_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l309_c12_11d4]
signal BIN_OP_EQ_uxn_c_l309_c12_11d4_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l309_c12_11d4_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l309_c12_11d4_return_output : unsigned(0 downto 0);

-- color_2_MUX[uxn_c_l309_c8_532f]
signal color_2_MUX_uxn_c_l309_c8_532f_cond : unsigned(0 downto 0);
signal color_2_MUX_uxn_c_l309_c8_532f_iftrue : unsigned(11 downto 0);
signal color_2_MUX_uxn_c_l309_c8_532f_iffalse : unsigned(11 downto 0);
signal color_2_MUX_uxn_c_l309_c8_532f_return_output : unsigned(11 downto 0);

-- color_3_MUX[uxn_c_l309_c8_532f]
signal color_3_MUX_uxn_c_l309_c8_532f_cond : unsigned(0 downto 0);
signal color_3_MUX_uxn_c_l309_c8_532f_iftrue : unsigned(11 downto 0);
signal color_3_MUX_uxn_c_l309_c8_532f_iffalse : unsigned(11 downto 0);
signal color_3_MUX_uxn_c_l309_c8_532f_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l311_c4_8c44]
signal BIN_OP_AND_uxn_c_l311_c4_8c44_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l311_c4_8c44_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l311_c4_8c44_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l312_c4_58a5]
signal BIN_OP_OR_uxn_c_l312_c4_58a5_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l312_c4_58a5_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l312_c4_58a5_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l315_c4_a781]
signal BIN_OP_AND_uxn_c_l315_c4_a781_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l315_c4_a781_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l315_c4_a781_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l316_c4_8b93]
signal BIN_OP_OR_uxn_c_l316_c4_8b93_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l316_c4_8b93_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l316_c4_8b93_return_output : unsigned(11 downto 0);

-- VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d[uxn_c_l320_c20_29bc]
signal VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l320_c20_29bc_ref_toks_0 : uint12_t_4;
signal VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l320_c20_29bc_var_dim_0 : unsigned(1 downto 0);
signal VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l320_c20_29bc_return_output : unsigned(11 downto 0);

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
-- CONST_SR_4_uxn_c_l248_c30_35a3
CONST_SR_4_uxn_c_l248_c30_35a3 : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_c_l248_c30_35a3_x,
CONST_SR_4_uxn_c_l248_c30_35a3_return_output);

-- BIN_OP_EQ_uxn_c_l248_c30_1325
BIN_OP_EQ_uxn_c_l248_c30_1325 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l248_c30_1325_left,
BIN_OP_EQ_uxn_c_l248_c30_1325_right,
BIN_OP_EQ_uxn_c_l248_c30_1325_return_output);

-- MUX_uxn_c_l248_c30_99e2
MUX_uxn_c_l248_c30_99e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l248_c30_99e2_cond,
MUX_uxn_c_l248_c30_99e2_iftrue,
MUX_uxn_c_l248_c30_99e2_iffalse,
MUX_uxn_c_l248_c30_99e2_return_output);

-- BIN_OP_AND_uxn_c_l250_c6_d025
BIN_OP_AND_uxn_c_l250_c6_d025 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l250_c6_d025_left,
BIN_OP_AND_uxn_c_l250_c6_d025_right,
BIN_OP_AND_uxn_c_l250_c6_d025_return_output);

-- color_MUX_uxn_c_l250_c2_2ee2
color_MUX_uxn_c_l250_c2_2ee2 : entity work.MUX_uint1_t_uint12_t_4_uint12_t_4_0CLK_de264c78 port map (
color_MUX_uxn_c_l250_c2_2ee2_cond,
color_MUX_uxn_c_l250_c2_2ee2_iftrue,
color_MUX_uxn_c_l250_c2_2ee2_iffalse,
color_MUX_uxn_c_l250_c2_2ee2_return_output);

-- CONST_SR_4_uxn_c_l253_c35_0675
CONST_SR_4_uxn_c_l253_c35_0675 : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_c_l253_c35_0675_x,
CONST_SR_4_uxn_c_l253_c35_0675_return_output);

-- BIN_OP_EQ_uxn_c_l256_c7_1197
BIN_OP_EQ_uxn_c_l256_c7_1197 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l256_c7_1197_left,
BIN_OP_EQ_uxn_c_l256_c7_1197_right,
BIN_OP_EQ_uxn_c_l256_c7_1197_return_output);

-- color_MUX_uxn_c_l256_c3_84cd
color_MUX_uxn_c_l256_c3_84cd : entity work.MUX_uint1_t_uint12_t_4_uint12_t_4_0CLK_de264c78 port map (
color_MUX_uxn_c_l256_c3_84cd_cond,
color_MUX_uxn_c_l256_c3_84cd_iftrue,
color_MUX_uxn_c_l256_c3_84cd_iffalse,
color_MUX_uxn_c_l256_c3_84cd_return_output);

-- CONST_SL_8_uxn_c_l258_c4_43fa
CONST_SL_8_uxn_c_l258_c4_43fa : entity work.CONST_SL_8_uint12_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l258_c4_43fa_x,
CONST_SL_8_uxn_c_l258_c4_43fa_return_output);

-- BIN_OP_AND_uxn_c_l259_c4_61bf
BIN_OP_AND_uxn_c_l259_c4_61bf : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l259_c4_61bf_left,
BIN_OP_AND_uxn_c_l259_c4_61bf_right,
BIN_OP_AND_uxn_c_l259_c4_61bf_return_output);

-- BIN_OP_OR_uxn_c_l260_c4_d72b
BIN_OP_OR_uxn_c_l260_c4_d72b : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l260_c4_d72b_left,
BIN_OP_OR_uxn_c_l260_c4_d72b_right,
BIN_OP_OR_uxn_c_l260_c4_d72b_return_output);

-- CONST_SL_8_uxn_c_l263_c4_44ab
CONST_SL_8_uxn_c_l263_c4_44ab : entity work.CONST_SL_8_uint12_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l263_c4_44ab_x,
CONST_SL_8_uxn_c_l263_c4_44ab_return_output);

-- BIN_OP_AND_uxn_c_l264_c4_f8ef
BIN_OP_AND_uxn_c_l264_c4_f8ef : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l264_c4_f8ef_left,
BIN_OP_AND_uxn_c_l264_c4_f8ef_right,
BIN_OP_AND_uxn_c_l264_c4_f8ef_return_output);

-- BIN_OP_OR_uxn_c_l265_c4_123f
BIN_OP_OR_uxn_c_l265_c4_123f : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l265_c4_123f_left,
BIN_OP_OR_uxn_c_l265_c4_123f_right,
BIN_OP_OR_uxn_c_l265_c4_123f_return_output);

-- BIN_OP_EQ_uxn_c_l267_c12_a760
BIN_OP_EQ_uxn_c_l267_c12_a760 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l267_c12_a760_left,
BIN_OP_EQ_uxn_c_l267_c12_a760_right,
BIN_OP_EQ_uxn_c_l267_c12_a760_return_output);

-- color_MUX_uxn_c_l267_c8_673f
color_MUX_uxn_c_l267_c8_673f : entity work.MUX_uint1_t_uint12_t_4_uint12_t_4_0CLK_de264c78 port map (
color_MUX_uxn_c_l267_c8_673f_cond,
color_MUX_uxn_c_l267_c8_673f_iftrue,
color_MUX_uxn_c_l267_c8_673f_iffalse,
color_MUX_uxn_c_l267_c8_673f_return_output);

-- CONST_SL_8_uxn_c_l269_c4_3507
CONST_SL_8_uxn_c_l269_c4_3507 : entity work.CONST_SL_8_uint12_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l269_c4_3507_x,
CONST_SL_8_uxn_c_l269_c4_3507_return_output);

-- BIN_OP_AND_uxn_c_l270_c4_8dc9
BIN_OP_AND_uxn_c_l270_c4_8dc9 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l270_c4_8dc9_left,
BIN_OP_AND_uxn_c_l270_c4_8dc9_right,
BIN_OP_AND_uxn_c_l270_c4_8dc9_return_output);

-- BIN_OP_OR_uxn_c_l271_c4_f4e9
BIN_OP_OR_uxn_c_l271_c4_f4e9 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l271_c4_f4e9_left,
BIN_OP_OR_uxn_c_l271_c4_f4e9_right,
BIN_OP_OR_uxn_c_l271_c4_f4e9_return_output);

-- CONST_SL_8_uxn_c_l274_c4_982c
CONST_SL_8_uxn_c_l274_c4_982c : entity work.CONST_SL_8_uint12_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l274_c4_982c_x,
CONST_SL_8_uxn_c_l274_c4_982c_return_output);

-- BIN_OP_AND_uxn_c_l275_c4_124c
BIN_OP_AND_uxn_c_l275_c4_124c : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l275_c4_124c_left,
BIN_OP_AND_uxn_c_l275_c4_124c_right,
BIN_OP_AND_uxn_c_l275_c4_124c_return_output);

-- BIN_OP_OR_uxn_c_l276_c4_66b4
BIN_OP_OR_uxn_c_l276_c4_66b4 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l276_c4_66b4_left,
BIN_OP_OR_uxn_c_l276_c4_66b4_right,
BIN_OP_OR_uxn_c_l276_c4_66b4_return_output);

-- BIN_OP_EQ_uxn_c_l278_c12_c711
BIN_OP_EQ_uxn_c_l278_c12_c711 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l278_c12_c711_left,
BIN_OP_EQ_uxn_c_l278_c12_c711_right,
BIN_OP_EQ_uxn_c_l278_c12_c711_return_output);

-- color_MUX_uxn_c_l278_c8_4ce6
color_MUX_uxn_c_l278_c8_4ce6 : entity work.MUX_uint1_t_uint12_t_4_uint12_t_4_0CLK_de264c78 port map (
color_MUX_uxn_c_l278_c8_4ce6_cond,
color_MUX_uxn_c_l278_c8_4ce6_iftrue,
color_MUX_uxn_c_l278_c8_4ce6_iffalse,
color_MUX_uxn_c_l278_c8_4ce6_return_output);

-- CONST_SL_4_uxn_c_l280_c4_b084
CONST_SL_4_uxn_c_l280_c4_b084 : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_c_l280_c4_b084_x,
CONST_SL_4_uxn_c_l280_c4_b084_return_output);

-- BIN_OP_AND_uxn_c_l281_c4_767a
BIN_OP_AND_uxn_c_l281_c4_767a : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l281_c4_767a_left,
BIN_OP_AND_uxn_c_l281_c4_767a_right,
BIN_OP_AND_uxn_c_l281_c4_767a_return_output);

-- BIN_OP_OR_uxn_c_l282_c4_96f5
BIN_OP_OR_uxn_c_l282_c4_96f5 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l282_c4_96f5_left,
BIN_OP_OR_uxn_c_l282_c4_96f5_right,
BIN_OP_OR_uxn_c_l282_c4_96f5_return_output);

-- CONST_SL_4_uxn_c_l285_c4_0bb0
CONST_SL_4_uxn_c_l285_c4_0bb0 : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_c_l285_c4_0bb0_x,
CONST_SL_4_uxn_c_l285_c4_0bb0_return_output);

-- BIN_OP_AND_uxn_c_l286_c4_2944
BIN_OP_AND_uxn_c_l286_c4_2944 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l286_c4_2944_left,
BIN_OP_AND_uxn_c_l286_c4_2944_right,
BIN_OP_AND_uxn_c_l286_c4_2944_return_output);

-- BIN_OP_OR_uxn_c_l287_c4_37a4
BIN_OP_OR_uxn_c_l287_c4_37a4 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l287_c4_37a4_left,
BIN_OP_OR_uxn_c_l287_c4_37a4_right,
BIN_OP_OR_uxn_c_l287_c4_37a4_return_output);

-- BIN_OP_EQ_uxn_c_l289_c12_5e94
BIN_OP_EQ_uxn_c_l289_c12_5e94 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l289_c12_5e94_left,
BIN_OP_EQ_uxn_c_l289_c12_5e94_right,
BIN_OP_EQ_uxn_c_l289_c12_5e94_return_output);

-- color_MUX_uxn_c_l289_c8_1fdc
color_MUX_uxn_c_l289_c8_1fdc : entity work.MUX_uint1_t_uint12_t_4_uint12_t_4_0CLK_de264c78 port map (
color_MUX_uxn_c_l289_c8_1fdc_cond,
color_MUX_uxn_c_l289_c8_1fdc_iftrue,
color_MUX_uxn_c_l289_c8_1fdc_iffalse,
color_MUX_uxn_c_l289_c8_1fdc_return_output);

-- CONST_SL_4_uxn_c_l291_c4_a674
CONST_SL_4_uxn_c_l291_c4_a674 : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_c_l291_c4_a674_x,
CONST_SL_4_uxn_c_l291_c4_a674_return_output);

-- BIN_OP_AND_uxn_c_l292_c4_abe6
BIN_OP_AND_uxn_c_l292_c4_abe6 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l292_c4_abe6_left,
BIN_OP_AND_uxn_c_l292_c4_abe6_right,
BIN_OP_AND_uxn_c_l292_c4_abe6_return_output);

-- BIN_OP_OR_uxn_c_l293_c4_78c0
BIN_OP_OR_uxn_c_l293_c4_78c0 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l293_c4_78c0_left,
BIN_OP_OR_uxn_c_l293_c4_78c0_right,
BIN_OP_OR_uxn_c_l293_c4_78c0_return_output);

-- CONST_SL_4_uxn_c_l296_c4_d505
CONST_SL_4_uxn_c_l296_c4_d505 : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_c_l296_c4_d505_x,
CONST_SL_4_uxn_c_l296_c4_d505_return_output);

-- BIN_OP_AND_uxn_c_l297_c4_cd61
BIN_OP_AND_uxn_c_l297_c4_cd61 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l297_c4_cd61_left,
BIN_OP_AND_uxn_c_l297_c4_cd61_right,
BIN_OP_AND_uxn_c_l297_c4_cd61_return_output);

-- BIN_OP_OR_uxn_c_l298_c4_f7bc
BIN_OP_OR_uxn_c_l298_c4_f7bc : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l298_c4_f7bc_left,
BIN_OP_OR_uxn_c_l298_c4_f7bc_right,
BIN_OP_OR_uxn_c_l298_c4_f7bc_return_output);

-- BIN_OP_EQ_uxn_c_l300_c12_d22b
BIN_OP_EQ_uxn_c_l300_c12_d22b : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l300_c12_d22b_left,
BIN_OP_EQ_uxn_c_l300_c12_d22b_right,
BIN_OP_EQ_uxn_c_l300_c12_d22b_return_output);

-- color_MUX_uxn_c_l300_c8_ac26
color_MUX_uxn_c_l300_c8_ac26 : entity work.MUX_uint1_t_uint12_t_4_uint12_t_4_0CLK_de264c78 port map (
color_MUX_uxn_c_l300_c8_ac26_cond,
color_MUX_uxn_c_l300_c8_ac26_iftrue,
color_MUX_uxn_c_l300_c8_ac26_iffalse,
color_MUX_uxn_c_l300_c8_ac26_return_output);

-- BIN_OP_AND_uxn_c_l302_c4_5c61
BIN_OP_AND_uxn_c_l302_c4_5c61 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l302_c4_5c61_left,
BIN_OP_AND_uxn_c_l302_c4_5c61_right,
BIN_OP_AND_uxn_c_l302_c4_5c61_return_output);

-- BIN_OP_OR_uxn_c_l303_c4_4030
BIN_OP_OR_uxn_c_l303_c4_4030 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l303_c4_4030_left,
BIN_OP_OR_uxn_c_l303_c4_4030_right,
BIN_OP_OR_uxn_c_l303_c4_4030_return_output);

-- BIN_OP_AND_uxn_c_l306_c4_b046
BIN_OP_AND_uxn_c_l306_c4_b046 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l306_c4_b046_left,
BIN_OP_AND_uxn_c_l306_c4_b046_right,
BIN_OP_AND_uxn_c_l306_c4_b046_return_output);

-- BIN_OP_OR_uxn_c_l307_c4_4c2b
BIN_OP_OR_uxn_c_l307_c4_4c2b : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l307_c4_4c2b_left,
BIN_OP_OR_uxn_c_l307_c4_4c2b_right,
BIN_OP_OR_uxn_c_l307_c4_4c2b_return_output);

-- BIN_OP_EQ_uxn_c_l309_c12_11d4
BIN_OP_EQ_uxn_c_l309_c12_11d4 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l309_c12_11d4_left,
BIN_OP_EQ_uxn_c_l309_c12_11d4_right,
BIN_OP_EQ_uxn_c_l309_c12_11d4_return_output);

-- color_2_MUX_uxn_c_l309_c8_532f
color_2_MUX_uxn_c_l309_c8_532f : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color_2_MUX_uxn_c_l309_c8_532f_cond,
color_2_MUX_uxn_c_l309_c8_532f_iftrue,
color_2_MUX_uxn_c_l309_c8_532f_iffalse,
color_2_MUX_uxn_c_l309_c8_532f_return_output);

-- color_3_MUX_uxn_c_l309_c8_532f
color_3_MUX_uxn_c_l309_c8_532f : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color_3_MUX_uxn_c_l309_c8_532f_cond,
color_3_MUX_uxn_c_l309_c8_532f_iftrue,
color_3_MUX_uxn_c_l309_c8_532f_iffalse,
color_3_MUX_uxn_c_l309_c8_532f_return_output);

-- BIN_OP_AND_uxn_c_l311_c4_8c44
BIN_OP_AND_uxn_c_l311_c4_8c44 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l311_c4_8c44_left,
BIN_OP_AND_uxn_c_l311_c4_8c44_right,
BIN_OP_AND_uxn_c_l311_c4_8c44_return_output);

-- BIN_OP_OR_uxn_c_l312_c4_58a5
BIN_OP_OR_uxn_c_l312_c4_58a5 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l312_c4_58a5_left,
BIN_OP_OR_uxn_c_l312_c4_58a5_right,
BIN_OP_OR_uxn_c_l312_c4_58a5_return_output);

-- BIN_OP_AND_uxn_c_l315_c4_a781
BIN_OP_AND_uxn_c_l315_c4_a781 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l315_c4_a781_left,
BIN_OP_AND_uxn_c_l315_c4_a781_right,
BIN_OP_AND_uxn_c_l315_c4_a781_return_output);

-- BIN_OP_OR_uxn_c_l316_c4_8b93
BIN_OP_OR_uxn_c_l316_c4_8b93 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l316_c4_8b93_left,
BIN_OP_OR_uxn_c_l316_c4_8b93_right,
BIN_OP_OR_uxn_c_l316_c4_8b93_return_output);

-- VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l320_c20_29bc
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l320_c20_29bc : entity work.VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_0CLK_9e40ec46 port map (
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l320_c20_29bc_ref_toks_0,
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l320_c20_29bc_var_dim_0,
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l320_c20_29bc_return_output);



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
 CONST_SR_4_uxn_c_l248_c30_35a3_return_output,
 BIN_OP_EQ_uxn_c_l248_c30_1325_return_output,
 MUX_uxn_c_l248_c30_99e2_return_output,
 BIN_OP_AND_uxn_c_l250_c6_d025_return_output,
 color_MUX_uxn_c_l250_c2_2ee2_return_output,
 CONST_SR_4_uxn_c_l253_c35_0675_return_output,
 BIN_OP_EQ_uxn_c_l256_c7_1197_return_output,
 color_MUX_uxn_c_l256_c3_84cd_return_output,
 CONST_SL_8_uxn_c_l258_c4_43fa_return_output,
 BIN_OP_AND_uxn_c_l259_c4_61bf_return_output,
 BIN_OP_OR_uxn_c_l260_c4_d72b_return_output,
 CONST_SL_8_uxn_c_l263_c4_44ab_return_output,
 BIN_OP_AND_uxn_c_l264_c4_f8ef_return_output,
 BIN_OP_OR_uxn_c_l265_c4_123f_return_output,
 BIN_OP_EQ_uxn_c_l267_c12_a760_return_output,
 color_MUX_uxn_c_l267_c8_673f_return_output,
 CONST_SL_8_uxn_c_l269_c4_3507_return_output,
 BIN_OP_AND_uxn_c_l270_c4_8dc9_return_output,
 BIN_OP_OR_uxn_c_l271_c4_f4e9_return_output,
 CONST_SL_8_uxn_c_l274_c4_982c_return_output,
 BIN_OP_AND_uxn_c_l275_c4_124c_return_output,
 BIN_OP_OR_uxn_c_l276_c4_66b4_return_output,
 BIN_OP_EQ_uxn_c_l278_c12_c711_return_output,
 color_MUX_uxn_c_l278_c8_4ce6_return_output,
 CONST_SL_4_uxn_c_l280_c4_b084_return_output,
 BIN_OP_AND_uxn_c_l281_c4_767a_return_output,
 BIN_OP_OR_uxn_c_l282_c4_96f5_return_output,
 CONST_SL_4_uxn_c_l285_c4_0bb0_return_output,
 BIN_OP_AND_uxn_c_l286_c4_2944_return_output,
 BIN_OP_OR_uxn_c_l287_c4_37a4_return_output,
 BIN_OP_EQ_uxn_c_l289_c12_5e94_return_output,
 color_MUX_uxn_c_l289_c8_1fdc_return_output,
 CONST_SL_4_uxn_c_l291_c4_a674_return_output,
 BIN_OP_AND_uxn_c_l292_c4_abe6_return_output,
 BIN_OP_OR_uxn_c_l293_c4_78c0_return_output,
 CONST_SL_4_uxn_c_l296_c4_d505_return_output,
 BIN_OP_AND_uxn_c_l297_c4_cd61_return_output,
 BIN_OP_OR_uxn_c_l298_c4_f7bc_return_output,
 BIN_OP_EQ_uxn_c_l300_c12_d22b_return_output,
 color_MUX_uxn_c_l300_c8_ac26_return_output,
 BIN_OP_AND_uxn_c_l302_c4_5c61_return_output,
 BIN_OP_OR_uxn_c_l303_c4_4030_return_output,
 BIN_OP_AND_uxn_c_l306_c4_b046_return_output,
 BIN_OP_OR_uxn_c_l307_c4_4c2b_return_output,
 BIN_OP_EQ_uxn_c_l309_c12_11d4_return_output,
 color_2_MUX_uxn_c_l309_c8_532f_return_output,
 color_3_MUX_uxn_c_l309_c8_532f_return_output,
 BIN_OP_AND_uxn_c_l311_c4_8c44_return_output,
 BIN_OP_OR_uxn_c_l312_c4_58a5_return_output,
 BIN_OP_AND_uxn_c_l315_c4_a781_return_output,
 BIN_OP_OR_uxn_c_l316_c4_8b93_return_output,
 VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l320_c20_29bc_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_device_ram_address : unsigned(7 downto 0);
 variable VAR_device_ram_value : unsigned(7 downto 0);
 variable VAR_is_device_ram_write : unsigned(0 downto 0);
 variable VAR_gpu_step_color : unsigned(1 downto 0);
 variable VAR_is_palette_range : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l248_c30_99e2_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_4_uxn_c_l248_c30_35a3_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l248_c30_1325_left : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_c_l248_c30_35a3_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l248_c30_1325_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l248_c30_1325_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l248_c30_99e2_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l248_c30_99e2_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l248_c30_99e2_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l250_c6_d025_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l250_c6_d025_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l250_c6_d025_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_c_l250_c2_2ee2_iftrue : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l256_c3_84cd_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l250_c2_2ee2_iffalse : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l250_c2_2ee2_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l250_c2_2ee2_cond : unsigned(0 downto 0);
 variable VAR_tmp12 : unsigned(11 downto 0);
 variable VAR_addr_low : unsigned(3 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_c_l252_c22_f24a_return_output : unsigned(3 downto 0);
 variable VAR_color_cmp_0 : unsigned(3 downto 0);
 variable VAR_color_cmp_0_uxn_c_l253_c11_7a28_0 : unsigned(3 downto 0);
 variable VAR_CONST_SR_4_uxn_c_l253_c35_0675_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_c_l253_c35_0675_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_c_l253_c25_bb3d_return_output : unsigned(3 downto 0);
 variable VAR_color_cmp_1 : unsigned(3 downto 0);
 variable VAR_color_cmp_1_uxn_c_l254_c11_6fad_0 : unsigned(3 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_c_l254_c25_3462_return_output : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l256_c7_1197_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l256_c7_1197_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l256_c7_1197_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_c_l256_c3_84cd_iftrue : uint12_t_4;
 variable VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l256_c3_84cd_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l256_c3_84cd_iffalse : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l267_c8_673f_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l256_c3_84cd_cond : unsigned(0 downto 0);
 variable VAR_tmp12_uxn_c_l257_c4_7440 : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l258_c4_43fa_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l258_c4_43fa_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l259_c4_61bf_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l259_c4_61bf_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l259_c4_61bf_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l260_c4_d72b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l260_c4_d72b_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l260_c4_d72b_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_uxn_c_l262_c4_39e4 : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l263_c4_44ab_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l263_c4_44ab_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l264_c4_f8ef_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l264_c4_f8ef_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l264_c4_f8ef_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l265_c4_123f_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l265_c4_123f_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l265_c4_123f_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l267_c12_a760_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l267_c12_a760_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l267_c12_a760_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_c_l267_c8_673f_iftrue : uint12_t_4;
 variable VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l267_c8_673f_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l267_c8_673f_iffalse : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l278_c8_4ce6_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l267_c8_673f_cond : unsigned(0 downto 0);
 variable VAR_tmp12_uxn_c_l268_c4_5bb6 : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l269_c4_3507_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l269_c4_3507_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l270_c4_8dc9_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l270_c4_8dc9_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l270_c4_8dc9_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l271_c4_f4e9_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l271_c4_f4e9_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l271_c4_f4e9_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_uxn_c_l273_c4_3195 : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l274_c4_982c_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l274_c4_982c_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l275_c4_124c_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l275_c4_124c_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l275_c4_124c_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l276_c4_66b4_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l276_c4_66b4_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l276_c4_66b4_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l278_c12_c711_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l278_c12_c711_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l278_c12_c711_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_c_l278_c8_4ce6_iftrue : uint12_t_4;
 variable VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l278_c8_4ce6_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l278_c8_4ce6_iffalse : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l289_c8_1fdc_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l278_c8_4ce6_cond : unsigned(0 downto 0);
 variable VAR_tmp12_uxn_c_l279_c4_918f : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l280_c4_b084_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l280_c4_b084_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l281_c4_767a_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l281_c4_767a_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l281_c4_767a_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l282_c4_96f5_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l282_c4_96f5_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l282_c4_96f5_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_uxn_c_l284_c4_b038 : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l285_c4_0bb0_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l285_c4_0bb0_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l286_c4_2944_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l286_c4_2944_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l286_c4_2944_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l287_c4_37a4_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l287_c4_37a4_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l287_c4_37a4_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l289_c12_5e94_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l289_c12_5e94_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l289_c12_5e94_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_c_l289_c8_1fdc_iftrue : uint12_t_4;
 variable VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l289_c8_1fdc_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l289_c8_1fdc_iffalse : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l300_c8_ac26_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l289_c8_1fdc_cond : unsigned(0 downto 0);
 variable VAR_tmp12_uxn_c_l290_c4_e102 : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l291_c4_a674_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l291_c4_a674_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l292_c4_abe6_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l292_c4_abe6_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l292_c4_abe6_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l293_c4_78c0_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l293_c4_78c0_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l293_c4_78c0_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_uxn_c_l295_c4_febb : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l296_c4_d505_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l296_c4_d505_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l297_c4_cd61_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l297_c4_cd61_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l297_c4_cd61_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l298_c4_f7bc_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l298_c4_f7bc_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l298_c4_f7bc_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l300_c12_d22b_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l300_c12_d22b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l300_c12_d22b_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_c_l300_c8_ac26_iftrue : uint12_t_4;
 variable VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l300_c8_ac26_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l300_c8_ac26_iffalse : uint12_t_4;
 variable VAR_color_FALSE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l300_c8_ac26_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l300_c8_ac26_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l302_c4_5c61_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l302_c4_5c61_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l302_c4_5c61_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l303_c4_4030_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l303_c4_4030_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l303_c4_4030_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l306_c4_b046_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l306_c4_b046_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l306_c4_b046_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l307_c4_4c2b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l307_c4_4c2b_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l307_c4_4c2b_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l309_c12_11d4_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l309_c12_11d4_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l309_c12_11d4_return_output : unsigned(0 downto 0);
 variable VAR_color_2_MUX_uxn_c_l309_c8_532f_iftrue : unsigned(11 downto 0);
 variable VAR_color_2_MUX_uxn_c_l309_c8_532f_iffalse : unsigned(11 downto 0);
 variable VAR_color_2_MUX_uxn_c_l309_c8_532f_return_output : unsigned(11 downto 0);
 variable VAR_color_2_MUX_uxn_c_l309_c8_532f_cond : unsigned(0 downto 0);
 variable VAR_color_3_MUX_uxn_c_l309_c8_532f_iftrue : unsigned(11 downto 0);
 variable VAR_color_3_MUX_uxn_c_l309_c8_532f_iffalse : unsigned(11 downto 0);
 variable VAR_color_3_MUX_uxn_c_l309_c8_532f_return_output : unsigned(11 downto 0);
 variable VAR_color_3_MUX_uxn_c_l309_c8_532f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l311_c4_8c44_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l311_c4_8c44_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l311_c4_8c44_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l312_c4_58a5_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l312_c4_58a5_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l312_c4_58a5_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l315_c4_a781_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l315_c4_a781_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l315_c4_a781_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l316_c4_8b93_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l316_c4_8b93_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l316_c4_8b93_return_output : unsigned(11 downto 0);
 variable VAR_result : unsigned(15 downto 0);
 variable VAR_result_uxn_c_l320_c11_9598_0 : unsigned(15 downto 0);
 variable VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l320_c20_29bc_var_dim_0 : unsigned(1 downto 0);
 variable VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l320_c20_29bc_return_output : unsigned(11 downto 0);
 variable VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l320_c20_29bc_ref_toks_0 : uint12_t_4;
 variable VAR_CONST_REF_RD_uint12_t_uint12_t_4_0_d41d_uxn_c_l281_l259_l302_DUPLICATE_6e7f_return_output : unsigned(11 downto 0);
 variable VAR_CONST_REF_RD_uint12_t_uint12_t_4_1_d41d_uxn_c_l286_l264_l306_DUPLICATE_6873_return_output : unsigned(11 downto 0);
 variable VAR_CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_uxn_c_l270_l309_l311_l292_DUPLICATE_32b8_return_output : unsigned(11 downto 0);
 variable VAR_CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_uxn_c_l275_l309_l297_l315_DUPLICATE_baac_return_output : unsigned(11 downto 0);
 variable VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l310_l301_DUPLICATE_e2d3_return_output : unsigned(11 downto 0);
 variable VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l314_l305_DUPLICATE_cea5_return_output : unsigned(11 downto 0);
 -- State registers comb logic variables
variable REG_VAR_color : uint12_t_4;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_color := color;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_AND_uxn_c_l281_c4_767a_right := to_unsigned(3855, 12);
     VAR_BIN_OP_AND_uxn_c_l292_c4_abe6_right := to_unsigned(3855, 12);
     VAR_MUX_uxn_c_l248_c30_99e2_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_c_l286_c4_2944_right := to_unsigned(3855, 12);
     VAR_BIN_OP_AND_uxn_c_l270_c4_8dc9_right := to_unsigned(255, 12);
     VAR_BIN_OP_EQ_uxn_c_l256_c7_1197_right := to_unsigned(8, 4);
     VAR_BIN_OP_AND_uxn_c_l302_c4_5c61_right := to_unsigned(4080, 12);
     VAR_MUX_uxn_c_l248_c30_99e2_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l267_c12_a760_right := to_unsigned(9, 4);
     VAR_BIN_OP_AND_uxn_c_l275_c4_124c_right := to_unsigned(255, 12);
     VAR_BIN_OP_AND_uxn_c_l297_c4_cd61_right := to_unsigned(3855, 12);
     VAR_BIN_OP_EQ_uxn_c_l300_c12_d22b_right := to_unsigned(12, 4);
     VAR_BIN_OP_AND_uxn_c_l259_c4_61bf_right := to_unsigned(255, 12);
     VAR_BIN_OP_AND_uxn_c_l306_c4_b046_right := to_unsigned(4080, 12);
     VAR_BIN_OP_EQ_uxn_c_l248_c30_1325_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l309_c12_11d4_right := to_unsigned(13, 4);
     VAR_BIN_OP_AND_uxn_c_l311_c4_8c44_right := to_unsigned(4080, 12);
     VAR_BIN_OP_EQ_uxn_c_l278_c12_c711_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_c_l289_c12_5e94_right := to_unsigned(11, 4);
     VAR_BIN_OP_AND_uxn_c_l315_c4_a781_right := to_unsigned(4080, 12);
     VAR_BIN_OP_AND_uxn_c_l264_c4_f8ef_right := to_unsigned(255, 12);

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
     VAR_color_MUX_uxn_c_l250_c2_2ee2_iffalse := color;
     VAR_CONST_SR_4_uxn_c_l248_c30_35a3_x := VAR_device_ram_address;
     VAR_CONST_SR_4_uxn_c_l253_c35_0675_x := VAR_device_ram_value;
     VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l320_c20_29bc_var_dim_0 := VAR_gpu_step_color;
     VAR_BIN_OP_AND_uxn_c_l250_c6_d025_left := VAR_is_device_ram_write;
     -- CONST_SR_4[uxn_c_l248_c30_35a3] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_c_l248_c30_35a3_x <= VAR_CONST_SR_4_uxn_c_l248_c30_35a3_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_c_l248_c30_35a3_return_output := CONST_SR_4_uxn_c_l248_c30_35a3_return_output;

     -- CONST_SR_4[uxn_c_l253_c35_0675] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_c_l253_c35_0675_x <= VAR_CONST_SR_4_uxn_c_l253_c35_0675_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_c_l253_c35_0675_return_output := CONST_SR_4_uxn_c_l253_c35_0675_return_output;

     -- CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_uxn_c_l270_l309_l311_l292_DUPLICATE_32b8 LATENCY=0
     VAR_CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_uxn_c_l270_l309_l311_l292_DUPLICATE_32b8_return_output := color(2);

     -- CAST_TO_uint4_t[uxn_c_l252_c22_f24a] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_c_l252_c22_f24a_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_device_ram_address);

     -- CAST_TO_uint4_t[uxn_c_l254_c25_3462] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_c_l254_c25_3462_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_device_ram_value);

     -- CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_uxn_c_l275_l309_l297_l315_DUPLICATE_baac LATENCY=0
     VAR_CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_uxn_c_l275_l309_l297_l315_DUPLICATE_baac_return_output := color(3);

     -- CONST_REF_RD_uint12_t_uint12_t_4_1_d41d_uxn_c_l286_l264_l306_DUPLICATE_6873 LATENCY=0
     VAR_CONST_REF_RD_uint12_t_uint12_t_4_1_d41d_uxn_c_l286_l264_l306_DUPLICATE_6873_return_output := color(1);

     -- CONST_REF_RD_uint12_t_uint12_t_4_0_d41d_uxn_c_l281_l259_l302_DUPLICATE_6e7f LATENCY=0
     VAR_CONST_REF_RD_uint12_t_uint12_t_4_0_d41d_uxn_c_l281_l259_l302_DUPLICATE_6e7f_return_output := color(0);

     -- Submodule level 1
     VAR_BIN_OP_EQ_uxn_c_l256_c7_1197_left := VAR_CAST_TO_uint4_t_uxn_c_l252_c22_f24a_return_output;
     VAR_BIN_OP_EQ_uxn_c_l267_c12_a760_left := VAR_CAST_TO_uint4_t_uxn_c_l252_c22_f24a_return_output;
     VAR_BIN_OP_EQ_uxn_c_l278_c12_c711_left := VAR_CAST_TO_uint4_t_uxn_c_l252_c22_f24a_return_output;
     VAR_BIN_OP_EQ_uxn_c_l289_c12_5e94_left := VAR_CAST_TO_uint4_t_uxn_c_l252_c22_f24a_return_output;
     VAR_BIN_OP_EQ_uxn_c_l300_c12_d22b_left := VAR_CAST_TO_uint4_t_uxn_c_l252_c22_f24a_return_output;
     VAR_BIN_OP_EQ_uxn_c_l309_c12_11d4_left := VAR_CAST_TO_uint4_t_uxn_c_l252_c22_f24a_return_output;
     VAR_color_cmp_1_uxn_c_l254_c11_6fad_0 := VAR_CAST_TO_uint4_t_uxn_c_l254_c25_3462_return_output;
     VAR_BIN_OP_AND_uxn_c_l259_c4_61bf_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_0_d41d_uxn_c_l281_l259_l302_DUPLICATE_6e7f_return_output;
     VAR_BIN_OP_AND_uxn_c_l281_c4_767a_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_0_d41d_uxn_c_l281_l259_l302_DUPLICATE_6e7f_return_output;
     VAR_BIN_OP_AND_uxn_c_l302_c4_5c61_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_0_d41d_uxn_c_l281_l259_l302_DUPLICATE_6e7f_return_output;
     VAR_BIN_OP_AND_uxn_c_l264_c4_f8ef_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_1_d41d_uxn_c_l286_l264_l306_DUPLICATE_6873_return_output;
     VAR_BIN_OP_AND_uxn_c_l286_c4_2944_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_1_d41d_uxn_c_l286_l264_l306_DUPLICATE_6873_return_output;
     VAR_BIN_OP_AND_uxn_c_l306_c4_b046_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_1_d41d_uxn_c_l286_l264_l306_DUPLICATE_6873_return_output;
     VAR_BIN_OP_AND_uxn_c_l270_c4_8dc9_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_uxn_c_l270_l309_l311_l292_DUPLICATE_32b8_return_output;
     VAR_BIN_OP_AND_uxn_c_l292_c4_abe6_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_uxn_c_l270_l309_l311_l292_DUPLICATE_32b8_return_output;
     VAR_BIN_OP_AND_uxn_c_l311_c4_8c44_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_uxn_c_l270_l309_l311_l292_DUPLICATE_32b8_return_output;
     VAR_color_2_MUX_uxn_c_l309_c8_532f_iffalse := VAR_CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_uxn_c_l270_l309_l311_l292_DUPLICATE_32b8_return_output;
     VAR_BIN_OP_AND_uxn_c_l275_c4_124c_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_uxn_c_l275_l309_l297_l315_DUPLICATE_baac_return_output;
     VAR_BIN_OP_AND_uxn_c_l297_c4_cd61_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_uxn_c_l275_l309_l297_l315_DUPLICATE_baac_return_output;
     VAR_BIN_OP_AND_uxn_c_l315_c4_a781_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_uxn_c_l275_l309_l297_l315_DUPLICATE_baac_return_output;
     VAR_color_3_MUX_uxn_c_l309_c8_532f_iffalse := VAR_CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_uxn_c_l275_l309_l297_l315_DUPLICATE_baac_return_output;
     VAR_BIN_OP_EQ_uxn_c_l248_c30_1325_left := VAR_CONST_SR_4_uxn_c_l248_c30_35a3_return_output;
     VAR_tmp12_uxn_c_l262_c4_39e4 := resize(VAR_color_cmp_1_uxn_c_l254_c11_6fad_0, 12);
     VAR_tmp12_uxn_c_l273_c4_3195 := resize(VAR_color_cmp_1_uxn_c_l254_c11_6fad_0, 12);
     VAR_tmp12_uxn_c_l284_c4_b038 := resize(VAR_color_cmp_1_uxn_c_l254_c11_6fad_0, 12);
     VAR_tmp12_uxn_c_l295_c4_febb := resize(VAR_color_cmp_1_uxn_c_l254_c11_6fad_0, 12);
     VAR_CONST_SL_8_uxn_c_l263_c4_44ab_x := VAR_tmp12_uxn_c_l262_c4_39e4;
     VAR_CONST_SL_8_uxn_c_l274_c4_982c_x := VAR_tmp12_uxn_c_l273_c4_3195;
     VAR_CONST_SL_4_uxn_c_l285_c4_0bb0_x := VAR_tmp12_uxn_c_l284_c4_b038;
     VAR_CONST_SL_4_uxn_c_l296_c4_d505_x := VAR_tmp12_uxn_c_l295_c4_febb;
     -- CAST_TO_uint4_t[uxn_c_l253_c25_bb3d] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_c_l253_c25_bb3d_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_CONST_SR_4_uxn_c_l253_c35_0675_return_output);

     -- BIN_OP_AND[uxn_c_l306_c4_b046] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l306_c4_b046_left <= VAR_BIN_OP_AND_uxn_c_l306_c4_b046_left;
     BIN_OP_AND_uxn_c_l306_c4_b046_right <= VAR_BIN_OP_AND_uxn_c_l306_c4_b046_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l306_c4_b046_return_output := BIN_OP_AND_uxn_c_l306_c4_b046_return_output;

     -- BIN_OP_EQ[uxn_c_l289_c12_5e94] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l289_c12_5e94_left <= VAR_BIN_OP_EQ_uxn_c_l289_c12_5e94_left;
     BIN_OP_EQ_uxn_c_l289_c12_5e94_right <= VAR_BIN_OP_EQ_uxn_c_l289_c12_5e94_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l289_c12_5e94_return_output := BIN_OP_EQ_uxn_c_l289_c12_5e94_return_output;

     -- BIN_OP_EQ[uxn_c_l300_c12_d22b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l300_c12_d22b_left <= VAR_BIN_OP_EQ_uxn_c_l300_c12_d22b_left;
     BIN_OP_EQ_uxn_c_l300_c12_d22b_right <= VAR_BIN_OP_EQ_uxn_c_l300_c12_d22b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l300_c12_d22b_return_output := BIN_OP_EQ_uxn_c_l300_c12_d22b_return_output;

     -- BIN_OP_EQ[uxn_c_l248_c30_1325] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l248_c30_1325_left <= VAR_BIN_OP_EQ_uxn_c_l248_c30_1325_left;
     BIN_OP_EQ_uxn_c_l248_c30_1325_right <= VAR_BIN_OP_EQ_uxn_c_l248_c30_1325_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l248_c30_1325_return_output := BIN_OP_EQ_uxn_c_l248_c30_1325_return_output;

     -- BIN_OP_AND[uxn_c_l292_c4_abe6] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l292_c4_abe6_left <= VAR_BIN_OP_AND_uxn_c_l292_c4_abe6_left;
     BIN_OP_AND_uxn_c_l292_c4_abe6_right <= VAR_BIN_OP_AND_uxn_c_l292_c4_abe6_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l292_c4_abe6_return_output := BIN_OP_AND_uxn_c_l292_c4_abe6_return_output;

     -- BIN_OP_EQ[uxn_c_l256_c7_1197] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l256_c7_1197_left <= VAR_BIN_OP_EQ_uxn_c_l256_c7_1197_left;
     BIN_OP_EQ_uxn_c_l256_c7_1197_right <= VAR_BIN_OP_EQ_uxn_c_l256_c7_1197_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l256_c7_1197_return_output := BIN_OP_EQ_uxn_c_l256_c7_1197_return_output;

     -- BIN_OP_AND[uxn_c_l264_c4_f8ef] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l264_c4_f8ef_left <= VAR_BIN_OP_AND_uxn_c_l264_c4_f8ef_left;
     BIN_OP_AND_uxn_c_l264_c4_f8ef_right <= VAR_BIN_OP_AND_uxn_c_l264_c4_f8ef_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l264_c4_f8ef_return_output := BIN_OP_AND_uxn_c_l264_c4_f8ef_return_output;

     -- BIN_OP_EQ[uxn_c_l278_c12_c711] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l278_c12_c711_left <= VAR_BIN_OP_EQ_uxn_c_l278_c12_c711_left;
     BIN_OP_EQ_uxn_c_l278_c12_c711_right <= VAR_BIN_OP_EQ_uxn_c_l278_c12_c711_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l278_c12_c711_return_output := BIN_OP_EQ_uxn_c_l278_c12_c711_return_output;

     -- CONST_SL_4[uxn_c_l285_c4_0bb0] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_c_l285_c4_0bb0_x <= VAR_CONST_SL_4_uxn_c_l285_c4_0bb0_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_c_l285_c4_0bb0_return_output := CONST_SL_4_uxn_c_l285_c4_0bb0_return_output;

     -- BIN_OP_AND[uxn_c_l281_c4_767a] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l281_c4_767a_left <= VAR_BIN_OP_AND_uxn_c_l281_c4_767a_left;
     BIN_OP_AND_uxn_c_l281_c4_767a_right <= VAR_BIN_OP_AND_uxn_c_l281_c4_767a_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l281_c4_767a_return_output := BIN_OP_AND_uxn_c_l281_c4_767a_return_output;

     -- BIN_OP_AND[uxn_c_l270_c4_8dc9] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l270_c4_8dc9_left <= VAR_BIN_OP_AND_uxn_c_l270_c4_8dc9_left;
     BIN_OP_AND_uxn_c_l270_c4_8dc9_right <= VAR_BIN_OP_AND_uxn_c_l270_c4_8dc9_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l270_c4_8dc9_return_output := BIN_OP_AND_uxn_c_l270_c4_8dc9_return_output;

     -- BIN_OP_EQ[uxn_c_l267_c12_a760] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l267_c12_a760_left <= VAR_BIN_OP_EQ_uxn_c_l267_c12_a760_left;
     BIN_OP_EQ_uxn_c_l267_c12_a760_right <= VAR_BIN_OP_EQ_uxn_c_l267_c12_a760_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l267_c12_a760_return_output := BIN_OP_EQ_uxn_c_l267_c12_a760_return_output;

     -- BIN_OP_AND[uxn_c_l302_c4_5c61] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l302_c4_5c61_left <= VAR_BIN_OP_AND_uxn_c_l302_c4_5c61_left;
     BIN_OP_AND_uxn_c_l302_c4_5c61_right <= VAR_BIN_OP_AND_uxn_c_l302_c4_5c61_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l302_c4_5c61_return_output := BIN_OP_AND_uxn_c_l302_c4_5c61_return_output;

     -- CONST_SL_8[uxn_c_l274_c4_982c] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l274_c4_982c_x <= VAR_CONST_SL_8_uxn_c_l274_c4_982c_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l274_c4_982c_return_output := CONST_SL_8_uxn_c_l274_c4_982c_return_output;

     -- CAST_TO_uint12_t_uint4_t_uxn_c_l314_l305_DUPLICATE_cea5 LATENCY=0
     VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l314_l305_DUPLICATE_cea5_return_output := CAST_TO_uint12_t_uint4_t(
     VAR_color_cmp_1_uxn_c_l254_c11_6fad_0);

     -- BIN_OP_AND[uxn_c_l259_c4_61bf] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l259_c4_61bf_left <= VAR_BIN_OP_AND_uxn_c_l259_c4_61bf_left;
     BIN_OP_AND_uxn_c_l259_c4_61bf_right <= VAR_BIN_OP_AND_uxn_c_l259_c4_61bf_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l259_c4_61bf_return_output := BIN_OP_AND_uxn_c_l259_c4_61bf_return_output;

     -- BIN_OP_EQ[uxn_c_l309_c12_11d4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l309_c12_11d4_left <= VAR_BIN_OP_EQ_uxn_c_l309_c12_11d4_left;
     BIN_OP_EQ_uxn_c_l309_c12_11d4_right <= VAR_BIN_OP_EQ_uxn_c_l309_c12_11d4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l309_c12_11d4_return_output := BIN_OP_EQ_uxn_c_l309_c12_11d4_return_output;

     -- BIN_OP_AND[uxn_c_l286_c4_2944] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l286_c4_2944_left <= VAR_BIN_OP_AND_uxn_c_l286_c4_2944_left;
     BIN_OP_AND_uxn_c_l286_c4_2944_right <= VAR_BIN_OP_AND_uxn_c_l286_c4_2944_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l286_c4_2944_return_output := BIN_OP_AND_uxn_c_l286_c4_2944_return_output;

     -- CONST_SL_8[uxn_c_l263_c4_44ab] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l263_c4_44ab_x <= VAR_CONST_SL_8_uxn_c_l263_c4_44ab_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l263_c4_44ab_return_output := CONST_SL_8_uxn_c_l263_c4_44ab_return_output;

     -- BIN_OP_AND[uxn_c_l311_c4_8c44] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l311_c4_8c44_left <= VAR_BIN_OP_AND_uxn_c_l311_c4_8c44_left;
     BIN_OP_AND_uxn_c_l311_c4_8c44_right <= VAR_BIN_OP_AND_uxn_c_l311_c4_8c44_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l311_c4_8c44_return_output := BIN_OP_AND_uxn_c_l311_c4_8c44_return_output;

     -- BIN_OP_AND[uxn_c_l297_c4_cd61] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l297_c4_cd61_left <= VAR_BIN_OP_AND_uxn_c_l297_c4_cd61_left;
     BIN_OP_AND_uxn_c_l297_c4_cd61_right <= VAR_BIN_OP_AND_uxn_c_l297_c4_cd61_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l297_c4_cd61_return_output := BIN_OP_AND_uxn_c_l297_c4_cd61_return_output;

     -- BIN_OP_AND[uxn_c_l315_c4_a781] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l315_c4_a781_left <= VAR_BIN_OP_AND_uxn_c_l315_c4_a781_left;
     BIN_OP_AND_uxn_c_l315_c4_a781_right <= VAR_BIN_OP_AND_uxn_c_l315_c4_a781_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l315_c4_a781_return_output := BIN_OP_AND_uxn_c_l315_c4_a781_return_output;

     -- BIN_OP_AND[uxn_c_l275_c4_124c] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l275_c4_124c_left <= VAR_BIN_OP_AND_uxn_c_l275_c4_124c_left;
     BIN_OP_AND_uxn_c_l275_c4_124c_right <= VAR_BIN_OP_AND_uxn_c_l275_c4_124c_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l275_c4_124c_return_output := BIN_OP_AND_uxn_c_l275_c4_124c_return_output;

     -- CONST_SL_4[uxn_c_l296_c4_d505] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_c_l296_c4_d505_x <= VAR_CONST_SL_4_uxn_c_l296_c4_d505_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_c_l296_c4_d505_return_output := CONST_SL_4_uxn_c_l296_c4_d505_return_output;

     -- Submodule level 2
     VAR_BIN_OP_OR_uxn_c_l260_c4_d72b_left := VAR_BIN_OP_AND_uxn_c_l259_c4_61bf_return_output;
     VAR_BIN_OP_OR_uxn_c_l265_c4_123f_left := VAR_BIN_OP_AND_uxn_c_l264_c4_f8ef_return_output;
     VAR_BIN_OP_OR_uxn_c_l271_c4_f4e9_left := VAR_BIN_OP_AND_uxn_c_l270_c4_8dc9_return_output;
     VAR_BIN_OP_OR_uxn_c_l276_c4_66b4_left := VAR_BIN_OP_AND_uxn_c_l275_c4_124c_return_output;
     VAR_BIN_OP_OR_uxn_c_l282_c4_96f5_left := VAR_BIN_OP_AND_uxn_c_l281_c4_767a_return_output;
     VAR_BIN_OP_OR_uxn_c_l287_c4_37a4_left := VAR_BIN_OP_AND_uxn_c_l286_c4_2944_return_output;
     VAR_BIN_OP_OR_uxn_c_l293_c4_78c0_left := VAR_BIN_OP_AND_uxn_c_l292_c4_abe6_return_output;
     VAR_BIN_OP_OR_uxn_c_l298_c4_f7bc_left := VAR_BIN_OP_AND_uxn_c_l297_c4_cd61_return_output;
     VAR_BIN_OP_OR_uxn_c_l303_c4_4030_left := VAR_BIN_OP_AND_uxn_c_l302_c4_5c61_return_output;
     VAR_BIN_OP_OR_uxn_c_l307_c4_4c2b_left := VAR_BIN_OP_AND_uxn_c_l306_c4_b046_return_output;
     VAR_BIN_OP_OR_uxn_c_l312_c4_58a5_left := VAR_BIN_OP_AND_uxn_c_l311_c4_8c44_return_output;
     VAR_BIN_OP_OR_uxn_c_l316_c4_8b93_left := VAR_BIN_OP_AND_uxn_c_l315_c4_a781_return_output;
     VAR_MUX_uxn_c_l248_c30_99e2_cond := VAR_BIN_OP_EQ_uxn_c_l248_c30_1325_return_output;
     VAR_color_MUX_uxn_c_l256_c3_84cd_cond := VAR_BIN_OP_EQ_uxn_c_l256_c7_1197_return_output;
     VAR_color_MUX_uxn_c_l267_c8_673f_cond := VAR_BIN_OP_EQ_uxn_c_l267_c12_a760_return_output;
     VAR_color_MUX_uxn_c_l278_c8_4ce6_cond := VAR_BIN_OP_EQ_uxn_c_l278_c12_c711_return_output;
     VAR_color_MUX_uxn_c_l289_c8_1fdc_cond := VAR_BIN_OP_EQ_uxn_c_l289_c12_5e94_return_output;
     VAR_color_MUX_uxn_c_l300_c8_ac26_cond := VAR_BIN_OP_EQ_uxn_c_l300_c12_d22b_return_output;
     VAR_color_2_MUX_uxn_c_l309_c8_532f_cond := VAR_BIN_OP_EQ_uxn_c_l309_c12_11d4_return_output;
     VAR_color_3_MUX_uxn_c_l309_c8_532f_cond := VAR_BIN_OP_EQ_uxn_c_l309_c12_11d4_return_output;
     VAR_BIN_OP_OR_uxn_c_l307_c4_4c2b_right := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l314_l305_DUPLICATE_cea5_return_output;
     VAR_BIN_OP_OR_uxn_c_l316_c4_8b93_right := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l314_l305_DUPLICATE_cea5_return_output;
     VAR_color_cmp_0_uxn_c_l253_c11_7a28_0 := VAR_CAST_TO_uint4_t_uxn_c_l253_c25_bb3d_return_output;
     VAR_BIN_OP_OR_uxn_c_l287_c4_37a4_right := VAR_CONST_SL_4_uxn_c_l285_c4_0bb0_return_output;
     VAR_BIN_OP_OR_uxn_c_l298_c4_f7bc_right := VAR_CONST_SL_4_uxn_c_l296_c4_d505_return_output;
     VAR_BIN_OP_OR_uxn_c_l265_c4_123f_right := VAR_CONST_SL_8_uxn_c_l263_c4_44ab_return_output;
     VAR_BIN_OP_OR_uxn_c_l276_c4_66b4_right := VAR_CONST_SL_8_uxn_c_l274_c4_982c_return_output;
     VAR_tmp12_uxn_c_l257_c4_7440 := resize(VAR_color_cmp_0_uxn_c_l253_c11_7a28_0, 12);
     VAR_tmp12_uxn_c_l268_c4_5bb6 := resize(VAR_color_cmp_0_uxn_c_l253_c11_7a28_0, 12);
     VAR_tmp12_uxn_c_l279_c4_918f := resize(VAR_color_cmp_0_uxn_c_l253_c11_7a28_0, 12);
     VAR_tmp12_uxn_c_l290_c4_e102 := resize(VAR_color_cmp_0_uxn_c_l253_c11_7a28_0, 12);
     VAR_CONST_SL_8_uxn_c_l258_c4_43fa_x := VAR_tmp12_uxn_c_l257_c4_7440;
     VAR_CONST_SL_8_uxn_c_l269_c4_3507_x := VAR_tmp12_uxn_c_l268_c4_5bb6;
     VAR_CONST_SL_4_uxn_c_l280_c4_b084_x := VAR_tmp12_uxn_c_l279_c4_918f;
     VAR_CONST_SL_4_uxn_c_l291_c4_a674_x := VAR_tmp12_uxn_c_l290_c4_e102;
     -- BIN_OP_OR[uxn_c_l298_c4_f7bc] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l298_c4_f7bc_left <= VAR_BIN_OP_OR_uxn_c_l298_c4_f7bc_left;
     BIN_OP_OR_uxn_c_l298_c4_f7bc_right <= VAR_BIN_OP_OR_uxn_c_l298_c4_f7bc_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l298_c4_f7bc_return_output := BIN_OP_OR_uxn_c_l298_c4_f7bc_return_output;

     -- BIN_OP_OR[uxn_c_l307_c4_4c2b] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l307_c4_4c2b_left <= VAR_BIN_OP_OR_uxn_c_l307_c4_4c2b_left;
     BIN_OP_OR_uxn_c_l307_c4_4c2b_right <= VAR_BIN_OP_OR_uxn_c_l307_c4_4c2b_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l307_c4_4c2b_return_output := BIN_OP_OR_uxn_c_l307_c4_4c2b_return_output;

     -- BIN_OP_OR[uxn_c_l276_c4_66b4] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l276_c4_66b4_left <= VAR_BIN_OP_OR_uxn_c_l276_c4_66b4_left;
     BIN_OP_OR_uxn_c_l276_c4_66b4_right <= VAR_BIN_OP_OR_uxn_c_l276_c4_66b4_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l276_c4_66b4_return_output := BIN_OP_OR_uxn_c_l276_c4_66b4_return_output;

     -- BIN_OP_OR[uxn_c_l316_c4_8b93] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l316_c4_8b93_left <= VAR_BIN_OP_OR_uxn_c_l316_c4_8b93_left;
     BIN_OP_OR_uxn_c_l316_c4_8b93_right <= VAR_BIN_OP_OR_uxn_c_l316_c4_8b93_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l316_c4_8b93_return_output := BIN_OP_OR_uxn_c_l316_c4_8b93_return_output;

     -- CONST_SL_8[uxn_c_l269_c4_3507] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l269_c4_3507_x <= VAR_CONST_SL_8_uxn_c_l269_c4_3507_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l269_c4_3507_return_output := CONST_SL_8_uxn_c_l269_c4_3507_return_output;

     -- CONST_SL_4[uxn_c_l280_c4_b084] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_c_l280_c4_b084_x <= VAR_CONST_SL_4_uxn_c_l280_c4_b084_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_c_l280_c4_b084_return_output := CONST_SL_4_uxn_c_l280_c4_b084_return_output;

     -- CAST_TO_uint12_t_uint4_t_uxn_c_l310_l301_DUPLICATE_e2d3 LATENCY=0
     VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l310_l301_DUPLICATE_e2d3_return_output := CAST_TO_uint12_t_uint4_t(
     VAR_color_cmp_0_uxn_c_l253_c11_7a28_0);

     -- BIN_OP_OR[uxn_c_l287_c4_37a4] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l287_c4_37a4_left <= VAR_BIN_OP_OR_uxn_c_l287_c4_37a4_left;
     BIN_OP_OR_uxn_c_l287_c4_37a4_right <= VAR_BIN_OP_OR_uxn_c_l287_c4_37a4_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l287_c4_37a4_return_output := BIN_OP_OR_uxn_c_l287_c4_37a4_return_output;

     -- BIN_OP_OR[uxn_c_l265_c4_123f] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l265_c4_123f_left <= VAR_BIN_OP_OR_uxn_c_l265_c4_123f_left;
     BIN_OP_OR_uxn_c_l265_c4_123f_right <= VAR_BIN_OP_OR_uxn_c_l265_c4_123f_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l265_c4_123f_return_output := BIN_OP_OR_uxn_c_l265_c4_123f_return_output;

     -- CONST_SL_8[uxn_c_l258_c4_43fa] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l258_c4_43fa_x <= VAR_CONST_SL_8_uxn_c_l258_c4_43fa_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l258_c4_43fa_return_output := CONST_SL_8_uxn_c_l258_c4_43fa_return_output;

     -- MUX[uxn_c_l248_c30_99e2] LATENCY=0
     -- Inputs
     MUX_uxn_c_l248_c30_99e2_cond <= VAR_MUX_uxn_c_l248_c30_99e2_cond;
     MUX_uxn_c_l248_c30_99e2_iftrue <= VAR_MUX_uxn_c_l248_c30_99e2_iftrue;
     MUX_uxn_c_l248_c30_99e2_iffalse <= VAR_MUX_uxn_c_l248_c30_99e2_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l248_c30_99e2_return_output := MUX_uxn_c_l248_c30_99e2_return_output;

     -- CONST_SL_4[uxn_c_l291_c4_a674] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_c_l291_c4_a674_x <= VAR_CONST_SL_4_uxn_c_l291_c4_a674_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_c_l291_c4_a674_return_output := CONST_SL_4_uxn_c_l291_c4_a674_return_output;

     -- Submodule level 3
     VAR_color_3_MUX_uxn_c_l309_c8_532f_iftrue := VAR_BIN_OP_OR_uxn_c_l316_c4_8b93_return_output;
     VAR_BIN_OP_OR_uxn_c_l303_c4_4030_right := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l310_l301_DUPLICATE_e2d3_return_output;
     VAR_BIN_OP_OR_uxn_c_l312_c4_58a5_right := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l310_l301_DUPLICATE_e2d3_return_output;
     VAR_BIN_OP_OR_uxn_c_l282_c4_96f5_right := VAR_CONST_SL_4_uxn_c_l280_c4_b084_return_output;
     VAR_BIN_OP_OR_uxn_c_l293_c4_78c0_right := VAR_CONST_SL_4_uxn_c_l291_c4_a674_return_output;
     VAR_BIN_OP_OR_uxn_c_l260_c4_d72b_right := VAR_CONST_SL_8_uxn_c_l258_c4_43fa_return_output;
     VAR_BIN_OP_OR_uxn_c_l271_c4_f4e9_right := VAR_CONST_SL_8_uxn_c_l269_c4_3507_return_output;
     VAR_BIN_OP_AND_uxn_c_l250_c6_d025_right := VAR_MUX_uxn_c_l248_c30_99e2_return_output;
     -- BIN_OP_OR[uxn_c_l282_c4_96f5] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l282_c4_96f5_left <= VAR_BIN_OP_OR_uxn_c_l282_c4_96f5_left;
     BIN_OP_OR_uxn_c_l282_c4_96f5_right <= VAR_BIN_OP_OR_uxn_c_l282_c4_96f5_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l282_c4_96f5_return_output := BIN_OP_OR_uxn_c_l282_c4_96f5_return_output;

     -- BIN_OP_OR[uxn_c_l293_c4_78c0] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l293_c4_78c0_left <= VAR_BIN_OP_OR_uxn_c_l293_c4_78c0_left;
     BIN_OP_OR_uxn_c_l293_c4_78c0_right <= VAR_BIN_OP_OR_uxn_c_l293_c4_78c0_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l293_c4_78c0_return_output := BIN_OP_OR_uxn_c_l293_c4_78c0_return_output;

     -- color_3_MUX[uxn_c_l309_c8_532f] LATENCY=0
     -- Inputs
     color_3_MUX_uxn_c_l309_c8_532f_cond <= VAR_color_3_MUX_uxn_c_l309_c8_532f_cond;
     color_3_MUX_uxn_c_l309_c8_532f_iftrue <= VAR_color_3_MUX_uxn_c_l309_c8_532f_iftrue;
     color_3_MUX_uxn_c_l309_c8_532f_iffalse <= VAR_color_3_MUX_uxn_c_l309_c8_532f_iffalse;
     -- Outputs
     VAR_color_3_MUX_uxn_c_l309_c8_532f_return_output := color_3_MUX_uxn_c_l309_c8_532f_return_output;

     -- BIN_OP_OR[uxn_c_l271_c4_f4e9] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l271_c4_f4e9_left <= VAR_BIN_OP_OR_uxn_c_l271_c4_f4e9_left;
     BIN_OP_OR_uxn_c_l271_c4_f4e9_right <= VAR_BIN_OP_OR_uxn_c_l271_c4_f4e9_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l271_c4_f4e9_return_output := BIN_OP_OR_uxn_c_l271_c4_f4e9_return_output;

     -- BIN_OP_OR[uxn_c_l303_c4_4030] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l303_c4_4030_left <= VAR_BIN_OP_OR_uxn_c_l303_c4_4030_left;
     BIN_OP_OR_uxn_c_l303_c4_4030_right <= VAR_BIN_OP_OR_uxn_c_l303_c4_4030_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l303_c4_4030_return_output := BIN_OP_OR_uxn_c_l303_c4_4030_return_output;

     -- BIN_OP_OR[uxn_c_l260_c4_d72b] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l260_c4_d72b_left <= VAR_BIN_OP_OR_uxn_c_l260_c4_d72b_left;
     BIN_OP_OR_uxn_c_l260_c4_d72b_right <= VAR_BIN_OP_OR_uxn_c_l260_c4_d72b_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l260_c4_d72b_return_output := BIN_OP_OR_uxn_c_l260_c4_d72b_return_output;

     -- BIN_OP_AND[uxn_c_l250_c6_d025] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l250_c6_d025_left <= VAR_BIN_OP_AND_uxn_c_l250_c6_d025_left;
     BIN_OP_AND_uxn_c_l250_c6_d025_right <= VAR_BIN_OP_AND_uxn_c_l250_c6_d025_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l250_c6_d025_return_output := BIN_OP_AND_uxn_c_l250_c6_d025_return_output;

     -- BIN_OP_OR[uxn_c_l312_c4_58a5] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l312_c4_58a5_left <= VAR_BIN_OP_OR_uxn_c_l312_c4_58a5_left;
     BIN_OP_OR_uxn_c_l312_c4_58a5_right <= VAR_BIN_OP_OR_uxn_c_l312_c4_58a5_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l312_c4_58a5_return_output := BIN_OP_OR_uxn_c_l312_c4_58a5_return_output;

     -- Submodule level 4
     VAR_color_MUX_uxn_c_l250_c2_2ee2_cond := VAR_BIN_OP_AND_uxn_c_l250_c6_d025_return_output;
     VAR_color_2_MUX_uxn_c_l309_c8_532f_iftrue := VAR_BIN_OP_OR_uxn_c_l312_c4_58a5_return_output;
     -- color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8[uxn_c_l300_c8_ac26] LATENCY=0
     VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l300_c8_ac26_return_output := CONST_REF_RD_uint12_t_4_uint12_t_4_90b8(
     color,
     VAR_BIN_OP_OR_uxn_c_l303_c4_4030_return_output,
     VAR_BIN_OP_OR_uxn_c_l307_c4_4c2b_return_output);

     -- color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8[uxn_c_l278_c8_4ce6] LATENCY=0
     VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l278_c8_4ce6_return_output := CONST_REF_RD_uint12_t_4_uint12_t_4_90b8(
     color,
     VAR_BIN_OP_OR_uxn_c_l282_c4_96f5_return_output,
     VAR_BIN_OP_OR_uxn_c_l287_c4_37a4_return_output);

     -- color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8[uxn_c_l256_c3_84cd] LATENCY=0
     VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l256_c3_84cd_return_output := CONST_REF_RD_uint12_t_4_uint12_t_4_90b8(
     color,
     VAR_BIN_OP_OR_uxn_c_l260_c4_d72b_return_output,
     VAR_BIN_OP_OR_uxn_c_l265_c4_123f_return_output);

     -- color_2_MUX[uxn_c_l309_c8_532f] LATENCY=0
     -- Inputs
     color_2_MUX_uxn_c_l309_c8_532f_cond <= VAR_color_2_MUX_uxn_c_l309_c8_532f_cond;
     color_2_MUX_uxn_c_l309_c8_532f_iftrue <= VAR_color_2_MUX_uxn_c_l309_c8_532f_iftrue;
     color_2_MUX_uxn_c_l309_c8_532f_iffalse <= VAR_color_2_MUX_uxn_c_l309_c8_532f_iffalse;
     -- Outputs
     VAR_color_2_MUX_uxn_c_l309_c8_532f_return_output := color_2_MUX_uxn_c_l309_c8_532f_return_output;

     -- color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5[uxn_c_l267_c8_673f] LATENCY=0
     VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l267_c8_673f_return_output := CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5(
     color,
     VAR_BIN_OP_OR_uxn_c_l271_c4_f4e9_return_output,
     VAR_BIN_OP_OR_uxn_c_l276_c4_66b4_return_output);

     -- color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5[uxn_c_l289_c8_1fdc] LATENCY=0
     VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l289_c8_1fdc_return_output := CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5(
     color,
     VAR_BIN_OP_OR_uxn_c_l293_c4_78c0_return_output,
     VAR_BIN_OP_OR_uxn_c_l298_c4_f7bc_return_output);

     -- Submodule level 5
     VAR_color_MUX_uxn_c_l256_c3_84cd_iftrue := VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l256_c3_84cd_return_output;
     VAR_color_MUX_uxn_c_l278_c8_4ce6_iftrue := VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l278_c8_4ce6_return_output;
     VAR_color_MUX_uxn_c_l300_c8_ac26_iftrue := VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l300_c8_ac26_return_output;
     VAR_color_MUX_uxn_c_l267_c8_673f_iftrue := VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l267_c8_673f_return_output;
     VAR_color_MUX_uxn_c_l289_c8_1fdc_iftrue := VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l289_c8_1fdc_return_output;
     -- color_FALSE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5[uxn_c_l300_c8_ac26] LATENCY=0
     VAR_color_FALSE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l300_c8_ac26_return_output := CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5(
     color,
     VAR_color_2_MUX_uxn_c_l309_c8_532f_return_output,
     VAR_color_3_MUX_uxn_c_l309_c8_532f_return_output);

     -- Submodule level 6
     VAR_color_MUX_uxn_c_l300_c8_ac26_iffalse := VAR_color_FALSE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l300_c8_ac26_return_output;
     -- color_MUX[uxn_c_l300_c8_ac26] LATENCY=0
     -- Inputs
     color_MUX_uxn_c_l300_c8_ac26_cond <= VAR_color_MUX_uxn_c_l300_c8_ac26_cond;
     color_MUX_uxn_c_l300_c8_ac26_iftrue <= VAR_color_MUX_uxn_c_l300_c8_ac26_iftrue;
     color_MUX_uxn_c_l300_c8_ac26_iffalse <= VAR_color_MUX_uxn_c_l300_c8_ac26_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_c_l300_c8_ac26_return_output := color_MUX_uxn_c_l300_c8_ac26_return_output;

     -- Submodule level 7
     VAR_color_MUX_uxn_c_l289_c8_1fdc_iffalse := VAR_color_MUX_uxn_c_l300_c8_ac26_return_output;
     -- color_MUX[uxn_c_l289_c8_1fdc] LATENCY=0
     -- Inputs
     color_MUX_uxn_c_l289_c8_1fdc_cond <= VAR_color_MUX_uxn_c_l289_c8_1fdc_cond;
     color_MUX_uxn_c_l289_c8_1fdc_iftrue <= VAR_color_MUX_uxn_c_l289_c8_1fdc_iftrue;
     color_MUX_uxn_c_l289_c8_1fdc_iffalse <= VAR_color_MUX_uxn_c_l289_c8_1fdc_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_c_l289_c8_1fdc_return_output := color_MUX_uxn_c_l289_c8_1fdc_return_output;

     -- Submodule level 8
     VAR_color_MUX_uxn_c_l278_c8_4ce6_iffalse := VAR_color_MUX_uxn_c_l289_c8_1fdc_return_output;
     -- color_MUX[uxn_c_l278_c8_4ce6] LATENCY=0
     -- Inputs
     color_MUX_uxn_c_l278_c8_4ce6_cond <= VAR_color_MUX_uxn_c_l278_c8_4ce6_cond;
     color_MUX_uxn_c_l278_c8_4ce6_iftrue <= VAR_color_MUX_uxn_c_l278_c8_4ce6_iftrue;
     color_MUX_uxn_c_l278_c8_4ce6_iffalse <= VAR_color_MUX_uxn_c_l278_c8_4ce6_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_c_l278_c8_4ce6_return_output := color_MUX_uxn_c_l278_c8_4ce6_return_output;

     -- Submodule level 9
     VAR_color_MUX_uxn_c_l267_c8_673f_iffalse := VAR_color_MUX_uxn_c_l278_c8_4ce6_return_output;
     -- color_MUX[uxn_c_l267_c8_673f] LATENCY=0
     -- Inputs
     color_MUX_uxn_c_l267_c8_673f_cond <= VAR_color_MUX_uxn_c_l267_c8_673f_cond;
     color_MUX_uxn_c_l267_c8_673f_iftrue <= VAR_color_MUX_uxn_c_l267_c8_673f_iftrue;
     color_MUX_uxn_c_l267_c8_673f_iffalse <= VAR_color_MUX_uxn_c_l267_c8_673f_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_c_l267_c8_673f_return_output := color_MUX_uxn_c_l267_c8_673f_return_output;

     -- Submodule level 10
     VAR_color_MUX_uxn_c_l256_c3_84cd_iffalse := VAR_color_MUX_uxn_c_l267_c8_673f_return_output;
     -- color_MUX[uxn_c_l256_c3_84cd] LATENCY=0
     -- Inputs
     color_MUX_uxn_c_l256_c3_84cd_cond <= VAR_color_MUX_uxn_c_l256_c3_84cd_cond;
     color_MUX_uxn_c_l256_c3_84cd_iftrue <= VAR_color_MUX_uxn_c_l256_c3_84cd_iftrue;
     color_MUX_uxn_c_l256_c3_84cd_iffalse <= VAR_color_MUX_uxn_c_l256_c3_84cd_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_c_l256_c3_84cd_return_output := color_MUX_uxn_c_l256_c3_84cd_return_output;

     -- Submodule level 11
     VAR_color_MUX_uxn_c_l250_c2_2ee2_iftrue := VAR_color_MUX_uxn_c_l256_c3_84cd_return_output;
     -- color_MUX[uxn_c_l250_c2_2ee2] LATENCY=0
     -- Inputs
     color_MUX_uxn_c_l250_c2_2ee2_cond <= VAR_color_MUX_uxn_c_l250_c2_2ee2_cond;
     color_MUX_uxn_c_l250_c2_2ee2_iftrue <= VAR_color_MUX_uxn_c_l250_c2_2ee2_iftrue;
     color_MUX_uxn_c_l250_c2_2ee2_iffalse <= VAR_color_MUX_uxn_c_l250_c2_2ee2_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_c_l250_c2_2ee2_return_output := color_MUX_uxn_c_l250_c2_2ee2_return_output;

     -- Submodule level 12
     VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l320_c20_29bc_ref_toks_0 := VAR_color_MUX_uxn_c_l250_c2_2ee2_return_output;
     REG_VAR_color := VAR_color_MUX_uxn_c_l250_c2_2ee2_return_output;
     -- VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d[uxn_c_l320_c20_29bc] LATENCY=0
     -- Inputs
     VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l320_c20_29bc_ref_toks_0 <= VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l320_c20_29bc_ref_toks_0;
     VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l320_c20_29bc_var_dim_0 <= VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l320_c20_29bc_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l320_c20_29bc_return_output := VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l320_c20_29bc_return_output;

     -- Submodule level 13
     VAR_result_uxn_c_l320_c11_9598_0 := resize(VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l320_c20_29bc_return_output, 16);
     VAR_return_output := VAR_result_uxn_c_l320_c11_9598_0;
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
