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
-- CONST_SR_4[uxn_c_l248_c30_cfa6]
signal CONST_SR_4_uxn_c_l248_c30_cfa6_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_c_l248_c30_cfa6_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_c_l248_c30_0176]
signal BIN_OP_EQ_uxn_c_l248_c30_0176_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l248_c30_0176_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l248_c30_0176_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l248_c30_446d]
signal MUX_uxn_c_l248_c30_446d_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l248_c30_446d_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l248_c30_446d_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l248_c30_446d_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l250_c6_43f8]
signal BIN_OP_AND_uxn_c_l250_c6_43f8_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l250_c6_43f8_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l250_c6_43f8_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_c_l250_c2_f61a]
signal color_MUX_uxn_c_l250_c2_f61a_cond : unsigned(0 downto 0);
signal color_MUX_uxn_c_l250_c2_f61a_iftrue : uint12_t_4;
signal color_MUX_uxn_c_l250_c2_f61a_iffalse : uint12_t_4;
signal color_MUX_uxn_c_l250_c2_f61a_return_output : uint12_t_4;

-- CONST_SR_4[uxn_c_l253_c35_b52e]
signal CONST_SR_4_uxn_c_l253_c35_b52e_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_c_l253_c35_b52e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_c_l256_c7_e98e]
signal BIN_OP_EQ_uxn_c_l256_c7_e98e_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l256_c7_e98e_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l256_c7_e98e_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_c_l256_c3_5ab6]
signal color_MUX_uxn_c_l256_c3_5ab6_cond : unsigned(0 downto 0);
signal color_MUX_uxn_c_l256_c3_5ab6_iftrue : uint12_t_4;
signal color_MUX_uxn_c_l256_c3_5ab6_iffalse : uint12_t_4;
signal color_MUX_uxn_c_l256_c3_5ab6_return_output : uint12_t_4;

-- CONST_SL_8[uxn_c_l258_c4_4695]
signal CONST_SL_8_uxn_c_l258_c4_4695_x : unsigned(11 downto 0);
signal CONST_SL_8_uxn_c_l258_c4_4695_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l259_c4_054a]
signal BIN_OP_AND_uxn_c_l259_c4_054a_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l259_c4_054a_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l259_c4_054a_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l260_c4_9971]
signal BIN_OP_OR_uxn_c_l260_c4_9971_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l260_c4_9971_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l260_c4_9971_return_output : unsigned(11 downto 0);

-- CONST_SL_8[uxn_c_l263_c4_e76d]
signal CONST_SL_8_uxn_c_l263_c4_e76d_x : unsigned(11 downto 0);
signal CONST_SL_8_uxn_c_l263_c4_e76d_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l264_c4_f282]
signal BIN_OP_AND_uxn_c_l264_c4_f282_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l264_c4_f282_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l264_c4_f282_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l265_c4_b7df]
signal BIN_OP_OR_uxn_c_l265_c4_b7df_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l265_c4_b7df_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l265_c4_b7df_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l267_c12_0feb]
signal BIN_OP_EQ_uxn_c_l267_c12_0feb_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l267_c12_0feb_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l267_c12_0feb_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_c_l267_c8_1675]
signal color_MUX_uxn_c_l267_c8_1675_cond : unsigned(0 downto 0);
signal color_MUX_uxn_c_l267_c8_1675_iftrue : uint12_t_4;
signal color_MUX_uxn_c_l267_c8_1675_iffalse : uint12_t_4;
signal color_MUX_uxn_c_l267_c8_1675_return_output : uint12_t_4;

-- CONST_SL_8[uxn_c_l269_c4_fa32]
signal CONST_SL_8_uxn_c_l269_c4_fa32_x : unsigned(11 downto 0);
signal CONST_SL_8_uxn_c_l269_c4_fa32_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l270_c4_fba6]
signal BIN_OP_AND_uxn_c_l270_c4_fba6_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l270_c4_fba6_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l270_c4_fba6_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l271_c4_d99c]
signal BIN_OP_OR_uxn_c_l271_c4_d99c_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l271_c4_d99c_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l271_c4_d99c_return_output : unsigned(11 downto 0);

-- CONST_SL_8[uxn_c_l274_c4_556a]
signal CONST_SL_8_uxn_c_l274_c4_556a_x : unsigned(11 downto 0);
signal CONST_SL_8_uxn_c_l274_c4_556a_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l275_c4_4e89]
signal BIN_OP_AND_uxn_c_l275_c4_4e89_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l275_c4_4e89_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l275_c4_4e89_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l276_c4_d7db]
signal BIN_OP_OR_uxn_c_l276_c4_d7db_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l276_c4_d7db_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l276_c4_d7db_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l278_c12_a1b8]
signal BIN_OP_EQ_uxn_c_l278_c12_a1b8_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l278_c12_a1b8_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l278_c12_a1b8_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_c_l278_c8_bf55]
signal color_MUX_uxn_c_l278_c8_bf55_cond : unsigned(0 downto 0);
signal color_MUX_uxn_c_l278_c8_bf55_iftrue : uint12_t_4;
signal color_MUX_uxn_c_l278_c8_bf55_iffalse : uint12_t_4;
signal color_MUX_uxn_c_l278_c8_bf55_return_output : uint12_t_4;

-- CONST_SL_4[uxn_c_l280_c4_78de]
signal CONST_SL_4_uxn_c_l280_c4_78de_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_c_l280_c4_78de_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l281_c4_5b82]
signal BIN_OP_AND_uxn_c_l281_c4_5b82_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l281_c4_5b82_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l281_c4_5b82_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l282_c4_ed70]
signal BIN_OP_OR_uxn_c_l282_c4_ed70_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l282_c4_ed70_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l282_c4_ed70_return_output : unsigned(11 downto 0);

-- CONST_SL_4[uxn_c_l285_c4_95bd]
signal CONST_SL_4_uxn_c_l285_c4_95bd_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_c_l285_c4_95bd_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l286_c4_9ed0]
signal BIN_OP_AND_uxn_c_l286_c4_9ed0_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l286_c4_9ed0_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l286_c4_9ed0_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l287_c4_e676]
signal BIN_OP_OR_uxn_c_l287_c4_e676_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l287_c4_e676_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l287_c4_e676_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l289_c12_af95]
signal BIN_OP_EQ_uxn_c_l289_c12_af95_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l289_c12_af95_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l289_c12_af95_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_c_l289_c8_6b65]
signal color_MUX_uxn_c_l289_c8_6b65_cond : unsigned(0 downto 0);
signal color_MUX_uxn_c_l289_c8_6b65_iftrue : uint12_t_4;
signal color_MUX_uxn_c_l289_c8_6b65_iffalse : uint12_t_4;
signal color_MUX_uxn_c_l289_c8_6b65_return_output : uint12_t_4;

-- CONST_SL_4[uxn_c_l291_c4_060e]
signal CONST_SL_4_uxn_c_l291_c4_060e_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_c_l291_c4_060e_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l292_c4_3280]
signal BIN_OP_AND_uxn_c_l292_c4_3280_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l292_c4_3280_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l292_c4_3280_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l293_c4_47ef]
signal BIN_OP_OR_uxn_c_l293_c4_47ef_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l293_c4_47ef_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l293_c4_47ef_return_output : unsigned(11 downto 0);

-- CONST_SL_4[uxn_c_l296_c4_6a26]
signal CONST_SL_4_uxn_c_l296_c4_6a26_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_c_l296_c4_6a26_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l297_c4_53c2]
signal BIN_OP_AND_uxn_c_l297_c4_53c2_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l297_c4_53c2_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l297_c4_53c2_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l298_c4_e724]
signal BIN_OP_OR_uxn_c_l298_c4_e724_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l298_c4_e724_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l298_c4_e724_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l300_c12_4120]
signal BIN_OP_EQ_uxn_c_l300_c12_4120_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l300_c12_4120_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l300_c12_4120_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_c_l300_c8_9d03]
signal color_MUX_uxn_c_l300_c8_9d03_cond : unsigned(0 downto 0);
signal color_MUX_uxn_c_l300_c8_9d03_iftrue : uint12_t_4;
signal color_MUX_uxn_c_l300_c8_9d03_iffalse : uint12_t_4;
signal color_MUX_uxn_c_l300_c8_9d03_return_output : uint12_t_4;

-- BIN_OP_AND[uxn_c_l302_c4_6022]
signal BIN_OP_AND_uxn_c_l302_c4_6022_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l302_c4_6022_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l302_c4_6022_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l303_c4_a55c]
signal BIN_OP_OR_uxn_c_l303_c4_a55c_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l303_c4_a55c_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l303_c4_a55c_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l306_c4_ede5]
signal BIN_OP_AND_uxn_c_l306_c4_ede5_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l306_c4_ede5_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l306_c4_ede5_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l307_c4_f636]
signal BIN_OP_OR_uxn_c_l307_c4_f636_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l307_c4_f636_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l307_c4_f636_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l309_c12_9449]
signal BIN_OP_EQ_uxn_c_l309_c12_9449_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l309_c12_9449_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l309_c12_9449_return_output : unsigned(0 downto 0);

-- color_2_MUX[uxn_c_l309_c8_9cb3]
signal color_2_MUX_uxn_c_l309_c8_9cb3_cond : unsigned(0 downto 0);
signal color_2_MUX_uxn_c_l309_c8_9cb3_iftrue : unsigned(11 downto 0);
signal color_2_MUX_uxn_c_l309_c8_9cb3_iffalse : unsigned(11 downto 0);
signal color_2_MUX_uxn_c_l309_c8_9cb3_return_output : unsigned(11 downto 0);

-- color_3_MUX[uxn_c_l309_c8_9cb3]
signal color_3_MUX_uxn_c_l309_c8_9cb3_cond : unsigned(0 downto 0);
signal color_3_MUX_uxn_c_l309_c8_9cb3_iftrue : unsigned(11 downto 0);
signal color_3_MUX_uxn_c_l309_c8_9cb3_iffalse : unsigned(11 downto 0);
signal color_3_MUX_uxn_c_l309_c8_9cb3_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l311_c4_08c9]
signal BIN_OP_AND_uxn_c_l311_c4_08c9_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l311_c4_08c9_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l311_c4_08c9_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l312_c4_0ab1]
signal BIN_OP_OR_uxn_c_l312_c4_0ab1_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l312_c4_0ab1_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l312_c4_0ab1_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l315_c4_45a3]
signal BIN_OP_AND_uxn_c_l315_c4_45a3_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l315_c4_45a3_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l315_c4_45a3_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l316_c4_3046]
signal BIN_OP_OR_uxn_c_l316_c4_3046_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l316_c4_3046_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l316_c4_3046_return_output : unsigned(11 downto 0);

-- VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d[uxn_c_l320_c20_3a93]
signal VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l320_c20_3a93_ref_toks_0 : uint12_t_4;
signal VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l320_c20_3a93_var_dim_0 : unsigned(1 downto 0);
signal VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l320_c20_3a93_return_output : unsigned(11 downto 0);

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
-- CONST_SR_4_uxn_c_l248_c30_cfa6
CONST_SR_4_uxn_c_l248_c30_cfa6 : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_c_l248_c30_cfa6_x,
CONST_SR_4_uxn_c_l248_c30_cfa6_return_output);

-- BIN_OP_EQ_uxn_c_l248_c30_0176
BIN_OP_EQ_uxn_c_l248_c30_0176 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l248_c30_0176_left,
BIN_OP_EQ_uxn_c_l248_c30_0176_right,
BIN_OP_EQ_uxn_c_l248_c30_0176_return_output);

-- MUX_uxn_c_l248_c30_446d
MUX_uxn_c_l248_c30_446d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l248_c30_446d_cond,
MUX_uxn_c_l248_c30_446d_iftrue,
MUX_uxn_c_l248_c30_446d_iffalse,
MUX_uxn_c_l248_c30_446d_return_output);

-- BIN_OP_AND_uxn_c_l250_c6_43f8
BIN_OP_AND_uxn_c_l250_c6_43f8 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l250_c6_43f8_left,
BIN_OP_AND_uxn_c_l250_c6_43f8_right,
BIN_OP_AND_uxn_c_l250_c6_43f8_return_output);

-- color_MUX_uxn_c_l250_c2_f61a
color_MUX_uxn_c_l250_c2_f61a : entity work.MUX_uint1_t_uint12_t_4_uint12_t_4_0CLK_de264c78 port map (
color_MUX_uxn_c_l250_c2_f61a_cond,
color_MUX_uxn_c_l250_c2_f61a_iftrue,
color_MUX_uxn_c_l250_c2_f61a_iffalse,
color_MUX_uxn_c_l250_c2_f61a_return_output);

-- CONST_SR_4_uxn_c_l253_c35_b52e
CONST_SR_4_uxn_c_l253_c35_b52e : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_c_l253_c35_b52e_x,
CONST_SR_4_uxn_c_l253_c35_b52e_return_output);

-- BIN_OP_EQ_uxn_c_l256_c7_e98e
BIN_OP_EQ_uxn_c_l256_c7_e98e : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l256_c7_e98e_left,
BIN_OP_EQ_uxn_c_l256_c7_e98e_right,
BIN_OP_EQ_uxn_c_l256_c7_e98e_return_output);

-- color_MUX_uxn_c_l256_c3_5ab6
color_MUX_uxn_c_l256_c3_5ab6 : entity work.MUX_uint1_t_uint12_t_4_uint12_t_4_0CLK_de264c78 port map (
color_MUX_uxn_c_l256_c3_5ab6_cond,
color_MUX_uxn_c_l256_c3_5ab6_iftrue,
color_MUX_uxn_c_l256_c3_5ab6_iffalse,
color_MUX_uxn_c_l256_c3_5ab6_return_output);

-- CONST_SL_8_uxn_c_l258_c4_4695
CONST_SL_8_uxn_c_l258_c4_4695 : entity work.CONST_SL_8_uint12_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l258_c4_4695_x,
CONST_SL_8_uxn_c_l258_c4_4695_return_output);

-- BIN_OP_AND_uxn_c_l259_c4_054a
BIN_OP_AND_uxn_c_l259_c4_054a : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l259_c4_054a_left,
BIN_OP_AND_uxn_c_l259_c4_054a_right,
BIN_OP_AND_uxn_c_l259_c4_054a_return_output);

-- BIN_OP_OR_uxn_c_l260_c4_9971
BIN_OP_OR_uxn_c_l260_c4_9971 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l260_c4_9971_left,
BIN_OP_OR_uxn_c_l260_c4_9971_right,
BIN_OP_OR_uxn_c_l260_c4_9971_return_output);

-- CONST_SL_8_uxn_c_l263_c4_e76d
CONST_SL_8_uxn_c_l263_c4_e76d : entity work.CONST_SL_8_uint12_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l263_c4_e76d_x,
CONST_SL_8_uxn_c_l263_c4_e76d_return_output);

-- BIN_OP_AND_uxn_c_l264_c4_f282
BIN_OP_AND_uxn_c_l264_c4_f282 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l264_c4_f282_left,
BIN_OP_AND_uxn_c_l264_c4_f282_right,
BIN_OP_AND_uxn_c_l264_c4_f282_return_output);

-- BIN_OP_OR_uxn_c_l265_c4_b7df
BIN_OP_OR_uxn_c_l265_c4_b7df : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l265_c4_b7df_left,
BIN_OP_OR_uxn_c_l265_c4_b7df_right,
BIN_OP_OR_uxn_c_l265_c4_b7df_return_output);

-- BIN_OP_EQ_uxn_c_l267_c12_0feb
BIN_OP_EQ_uxn_c_l267_c12_0feb : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l267_c12_0feb_left,
BIN_OP_EQ_uxn_c_l267_c12_0feb_right,
BIN_OP_EQ_uxn_c_l267_c12_0feb_return_output);

-- color_MUX_uxn_c_l267_c8_1675
color_MUX_uxn_c_l267_c8_1675 : entity work.MUX_uint1_t_uint12_t_4_uint12_t_4_0CLK_de264c78 port map (
color_MUX_uxn_c_l267_c8_1675_cond,
color_MUX_uxn_c_l267_c8_1675_iftrue,
color_MUX_uxn_c_l267_c8_1675_iffalse,
color_MUX_uxn_c_l267_c8_1675_return_output);

-- CONST_SL_8_uxn_c_l269_c4_fa32
CONST_SL_8_uxn_c_l269_c4_fa32 : entity work.CONST_SL_8_uint12_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l269_c4_fa32_x,
CONST_SL_8_uxn_c_l269_c4_fa32_return_output);

-- BIN_OP_AND_uxn_c_l270_c4_fba6
BIN_OP_AND_uxn_c_l270_c4_fba6 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l270_c4_fba6_left,
BIN_OP_AND_uxn_c_l270_c4_fba6_right,
BIN_OP_AND_uxn_c_l270_c4_fba6_return_output);

-- BIN_OP_OR_uxn_c_l271_c4_d99c
BIN_OP_OR_uxn_c_l271_c4_d99c : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l271_c4_d99c_left,
BIN_OP_OR_uxn_c_l271_c4_d99c_right,
BIN_OP_OR_uxn_c_l271_c4_d99c_return_output);

-- CONST_SL_8_uxn_c_l274_c4_556a
CONST_SL_8_uxn_c_l274_c4_556a : entity work.CONST_SL_8_uint12_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l274_c4_556a_x,
CONST_SL_8_uxn_c_l274_c4_556a_return_output);

-- BIN_OP_AND_uxn_c_l275_c4_4e89
BIN_OP_AND_uxn_c_l275_c4_4e89 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l275_c4_4e89_left,
BIN_OP_AND_uxn_c_l275_c4_4e89_right,
BIN_OP_AND_uxn_c_l275_c4_4e89_return_output);

-- BIN_OP_OR_uxn_c_l276_c4_d7db
BIN_OP_OR_uxn_c_l276_c4_d7db : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l276_c4_d7db_left,
BIN_OP_OR_uxn_c_l276_c4_d7db_right,
BIN_OP_OR_uxn_c_l276_c4_d7db_return_output);

-- BIN_OP_EQ_uxn_c_l278_c12_a1b8
BIN_OP_EQ_uxn_c_l278_c12_a1b8 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l278_c12_a1b8_left,
BIN_OP_EQ_uxn_c_l278_c12_a1b8_right,
BIN_OP_EQ_uxn_c_l278_c12_a1b8_return_output);

-- color_MUX_uxn_c_l278_c8_bf55
color_MUX_uxn_c_l278_c8_bf55 : entity work.MUX_uint1_t_uint12_t_4_uint12_t_4_0CLK_de264c78 port map (
color_MUX_uxn_c_l278_c8_bf55_cond,
color_MUX_uxn_c_l278_c8_bf55_iftrue,
color_MUX_uxn_c_l278_c8_bf55_iffalse,
color_MUX_uxn_c_l278_c8_bf55_return_output);

-- CONST_SL_4_uxn_c_l280_c4_78de
CONST_SL_4_uxn_c_l280_c4_78de : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_c_l280_c4_78de_x,
CONST_SL_4_uxn_c_l280_c4_78de_return_output);

-- BIN_OP_AND_uxn_c_l281_c4_5b82
BIN_OP_AND_uxn_c_l281_c4_5b82 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l281_c4_5b82_left,
BIN_OP_AND_uxn_c_l281_c4_5b82_right,
BIN_OP_AND_uxn_c_l281_c4_5b82_return_output);

-- BIN_OP_OR_uxn_c_l282_c4_ed70
BIN_OP_OR_uxn_c_l282_c4_ed70 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l282_c4_ed70_left,
BIN_OP_OR_uxn_c_l282_c4_ed70_right,
BIN_OP_OR_uxn_c_l282_c4_ed70_return_output);

-- CONST_SL_4_uxn_c_l285_c4_95bd
CONST_SL_4_uxn_c_l285_c4_95bd : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_c_l285_c4_95bd_x,
CONST_SL_4_uxn_c_l285_c4_95bd_return_output);

-- BIN_OP_AND_uxn_c_l286_c4_9ed0
BIN_OP_AND_uxn_c_l286_c4_9ed0 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l286_c4_9ed0_left,
BIN_OP_AND_uxn_c_l286_c4_9ed0_right,
BIN_OP_AND_uxn_c_l286_c4_9ed0_return_output);

-- BIN_OP_OR_uxn_c_l287_c4_e676
BIN_OP_OR_uxn_c_l287_c4_e676 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l287_c4_e676_left,
BIN_OP_OR_uxn_c_l287_c4_e676_right,
BIN_OP_OR_uxn_c_l287_c4_e676_return_output);

-- BIN_OP_EQ_uxn_c_l289_c12_af95
BIN_OP_EQ_uxn_c_l289_c12_af95 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l289_c12_af95_left,
BIN_OP_EQ_uxn_c_l289_c12_af95_right,
BIN_OP_EQ_uxn_c_l289_c12_af95_return_output);

-- color_MUX_uxn_c_l289_c8_6b65
color_MUX_uxn_c_l289_c8_6b65 : entity work.MUX_uint1_t_uint12_t_4_uint12_t_4_0CLK_de264c78 port map (
color_MUX_uxn_c_l289_c8_6b65_cond,
color_MUX_uxn_c_l289_c8_6b65_iftrue,
color_MUX_uxn_c_l289_c8_6b65_iffalse,
color_MUX_uxn_c_l289_c8_6b65_return_output);

-- CONST_SL_4_uxn_c_l291_c4_060e
CONST_SL_4_uxn_c_l291_c4_060e : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_c_l291_c4_060e_x,
CONST_SL_4_uxn_c_l291_c4_060e_return_output);

-- BIN_OP_AND_uxn_c_l292_c4_3280
BIN_OP_AND_uxn_c_l292_c4_3280 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l292_c4_3280_left,
BIN_OP_AND_uxn_c_l292_c4_3280_right,
BIN_OP_AND_uxn_c_l292_c4_3280_return_output);

-- BIN_OP_OR_uxn_c_l293_c4_47ef
BIN_OP_OR_uxn_c_l293_c4_47ef : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l293_c4_47ef_left,
BIN_OP_OR_uxn_c_l293_c4_47ef_right,
BIN_OP_OR_uxn_c_l293_c4_47ef_return_output);

-- CONST_SL_4_uxn_c_l296_c4_6a26
CONST_SL_4_uxn_c_l296_c4_6a26 : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_c_l296_c4_6a26_x,
CONST_SL_4_uxn_c_l296_c4_6a26_return_output);

-- BIN_OP_AND_uxn_c_l297_c4_53c2
BIN_OP_AND_uxn_c_l297_c4_53c2 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l297_c4_53c2_left,
BIN_OP_AND_uxn_c_l297_c4_53c2_right,
BIN_OP_AND_uxn_c_l297_c4_53c2_return_output);

-- BIN_OP_OR_uxn_c_l298_c4_e724
BIN_OP_OR_uxn_c_l298_c4_e724 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l298_c4_e724_left,
BIN_OP_OR_uxn_c_l298_c4_e724_right,
BIN_OP_OR_uxn_c_l298_c4_e724_return_output);

-- BIN_OP_EQ_uxn_c_l300_c12_4120
BIN_OP_EQ_uxn_c_l300_c12_4120 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l300_c12_4120_left,
BIN_OP_EQ_uxn_c_l300_c12_4120_right,
BIN_OP_EQ_uxn_c_l300_c12_4120_return_output);

-- color_MUX_uxn_c_l300_c8_9d03
color_MUX_uxn_c_l300_c8_9d03 : entity work.MUX_uint1_t_uint12_t_4_uint12_t_4_0CLK_de264c78 port map (
color_MUX_uxn_c_l300_c8_9d03_cond,
color_MUX_uxn_c_l300_c8_9d03_iftrue,
color_MUX_uxn_c_l300_c8_9d03_iffalse,
color_MUX_uxn_c_l300_c8_9d03_return_output);

-- BIN_OP_AND_uxn_c_l302_c4_6022
BIN_OP_AND_uxn_c_l302_c4_6022 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l302_c4_6022_left,
BIN_OP_AND_uxn_c_l302_c4_6022_right,
BIN_OP_AND_uxn_c_l302_c4_6022_return_output);

-- BIN_OP_OR_uxn_c_l303_c4_a55c
BIN_OP_OR_uxn_c_l303_c4_a55c : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l303_c4_a55c_left,
BIN_OP_OR_uxn_c_l303_c4_a55c_right,
BIN_OP_OR_uxn_c_l303_c4_a55c_return_output);

-- BIN_OP_AND_uxn_c_l306_c4_ede5
BIN_OP_AND_uxn_c_l306_c4_ede5 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l306_c4_ede5_left,
BIN_OP_AND_uxn_c_l306_c4_ede5_right,
BIN_OP_AND_uxn_c_l306_c4_ede5_return_output);

-- BIN_OP_OR_uxn_c_l307_c4_f636
BIN_OP_OR_uxn_c_l307_c4_f636 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l307_c4_f636_left,
BIN_OP_OR_uxn_c_l307_c4_f636_right,
BIN_OP_OR_uxn_c_l307_c4_f636_return_output);

-- BIN_OP_EQ_uxn_c_l309_c12_9449
BIN_OP_EQ_uxn_c_l309_c12_9449 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l309_c12_9449_left,
BIN_OP_EQ_uxn_c_l309_c12_9449_right,
BIN_OP_EQ_uxn_c_l309_c12_9449_return_output);

-- color_2_MUX_uxn_c_l309_c8_9cb3
color_2_MUX_uxn_c_l309_c8_9cb3 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color_2_MUX_uxn_c_l309_c8_9cb3_cond,
color_2_MUX_uxn_c_l309_c8_9cb3_iftrue,
color_2_MUX_uxn_c_l309_c8_9cb3_iffalse,
color_2_MUX_uxn_c_l309_c8_9cb3_return_output);

-- color_3_MUX_uxn_c_l309_c8_9cb3
color_3_MUX_uxn_c_l309_c8_9cb3 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color_3_MUX_uxn_c_l309_c8_9cb3_cond,
color_3_MUX_uxn_c_l309_c8_9cb3_iftrue,
color_3_MUX_uxn_c_l309_c8_9cb3_iffalse,
color_3_MUX_uxn_c_l309_c8_9cb3_return_output);

-- BIN_OP_AND_uxn_c_l311_c4_08c9
BIN_OP_AND_uxn_c_l311_c4_08c9 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l311_c4_08c9_left,
BIN_OP_AND_uxn_c_l311_c4_08c9_right,
BIN_OP_AND_uxn_c_l311_c4_08c9_return_output);

-- BIN_OP_OR_uxn_c_l312_c4_0ab1
BIN_OP_OR_uxn_c_l312_c4_0ab1 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l312_c4_0ab1_left,
BIN_OP_OR_uxn_c_l312_c4_0ab1_right,
BIN_OP_OR_uxn_c_l312_c4_0ab1_return_output);

-- BIN_OP_AND_uxn_c_l315_c4_45a3
BIN_OP_AND_uxn_c_l315_c4_45a3 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l315_c4_45a3_left,
BIN_OP_AND_uxn_c_l315_c4_45a3_right,
BIN_OP_AND_uxn_c_l315_c4_45a3_return_output);

-- BIN_OP_OR_uxn_c_l316_c4_3046
BIN_OP_OR_uxn_c_l316_c4_3046 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l316_c4_3046_left,
BIN_OP_OR_uxn_c_l316_c4_3046_right,
BIN_OP_OR_uxn_c_l316_c4_3046_return_output);

-- VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l320_c20_3a93
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l320_c20_3a93 : entity work.VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_0CLK_9e40ec46 port map (
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l320_c20_3a93_ref_toks_0,
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l320_c20_3a93_var_dim_0,
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l320_c20_3a93_return_output);



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
 CONST_SR_4_uxn_c_l248_c30_cfa6_return_output,
 BIN_OP_EQ_uxn_c_l248_c30_0176_return_output,
 MUX_uxn_c_l248_c30_446d_return_output,
 BIN_OP_AND_uxn_c_l250_c6_43f8_return_output,
 color_MUX_uxn_c_l250_c2_f61a_return_output,
 CONST_SR_4_uxn_c_l253_c35_b52e_return_output,
 BIN_OP_EQ_uxn_c_l256_c7_e98e_return_output,
 color_MUX_uxn_c_l256_c3_5ab6_return_output,
 CONST_SL_8_uxn_c_l258_c4_4695_return_output,
 BIN_OP_AND_uxn_c_l259_c4_054a_return_output,
 BIN_OP_OR_uxn_c_l260_c4_9971_return_output,
 CONST_SL_8_uxn_c_l263_c4_e76d_return_output,
 BIN_OP_AND_uxn_c_l264_c4_f282_return_output,
 BIN_OP_OR_uxn_c_l265_c4_b7df_return_output,
 BIN_OP_EQ_uxn_c_l267_c12_0feb_return_output,
 color_MUX_uxn_c_l267_c8_1675_return_output,
 CONST_SL_8_uxn_c_l269_c4_fa32_return_output,
 BIN_OP_AND_uxn_c_l270_c4_fba6_return_output,
 BIN_OP_OR_uxn_c_l271_c4_d99c_return_output,
 CONST_SL_8_uxn_c_l274_c4_556a_return_output,
 BIN_OP_AND_uxn_c_l275_c4_4e89_return_output,
 BIN_OP_OR_uxn_c_l276_c4_d7db_return_output,
 BIN_OP_EQ_uxn_c_l278_c12_a1b8_return_output,
 color_MUX_uxn_c_l278_c8_bf55_return_output,
 CONST_SL_4_uxn_c_l280_c4_78de_return_output,
 BIN_OP_AND_uxn_c_l281_c4_5b82_return_output,
 BIN_OP_OR_uxn_c_l282_c4_ed70_return_output,
 CONST_SL_4_uxn_c_l285_c4_95bd_return_output,
 BIN_OP_AND_uxn_c_l286_c4_9ed0_return_output,
 BIN_OP_OR_uxn_c_l287_c4_e676_return_output,
 BIN_OP_EQ_uxn_c_l289_c12_af95_return_output,
 color_MUX_uxn_c_l289_c8_6b65_return_output,
 CONST_SL_4_uxn_c_l291_c4_060e_return_output,
 BIN_OP_AND_uxn_c_l292_c4_3280_return_output,
 BIN_OP_OR_uxn_c_l293_c4_47ef_return_output,
 CONST_SL_4_uxn_c_l296_c4_6a26_return_output,
 BIN_OP_AND_uxn_c_l297_c4_53c2_return_output,
 BIN_OP_OR_uxn_c_l298_c4_e724_return_output,
 BIN_OP_EQ_uxn_c_l300_c12_4120_return_output,
 color_MUX_uxn_c_l300_c8_9d03_return_output,
 BIN_OP_AND_uxn_c_l302_c4_6022_return_output,
 BIN_OP_OR_uxn_c_l303_c4_a55c_return_output,
 BIN_OP_AND_uxn_c_l306_c4_ede5_return_output,
 BIN_OP_OR_uxn_c_l307_c4_f636_return_output,
 BIN_OP_EQ_uxn_c_l309_c12_9449_return_output,
 color_2_MUX_uxn_c_l309_c8_9cb3_return_output,
 color_3_MUX_uxn_c_l309_c8_9cb3_return_output,
 BIN_OP_AND_uxn_c_l311_c4_08c9_return_output,
 BIN_OP_OR_uxn_c_l312_c4_0ab1_return_output,
 BIN_OP_AND_uxn_c_l315_c4_45a3_return_output,
 BIN_OP_OR_uxn_c_l316_c4_3046_return_output,
 VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l320_c20_3a93_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_device_ram_address : unsigned(7 downto 0);
 variable VAR_device_ram_value : unsigned(7 downto 0);
 variable VAR_is_device_ram_write : unsigned(0 downto 0);
 variable VAR_gpu_step_color : unsigned(1 downto 0);
 variable VAR_is_palette_range : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l248_c30_446d_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_4_uxn_c_l248_c30_cfa6_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l248_c30_0176_left : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_c_l248_c30_cfa6_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l248_c30_0176_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l248_c30_0176_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l248_c30_446d_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l248_c30_446d_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l248_c30_446d_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l250_c6_43f8_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l250_c6_43f8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l250_c6_43f8_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_c_l250_c2_f61a_iftrue : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l256_c3_5ab6_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l250_c2_f61a_iffalse : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l250_c2_f61a_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l250_c2_f61a_cond : unsigned(0 downto 0);
 variable VAR_tmp12 : unsigned(11 downto 0);
 variable VAR_addr_low : unsigned(3 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_c_l252_c22_7bcb_return_output : unsigned(3 downto 0);
 variable VAR_color_cmp_0 : unsigned(3 downto 0);
 variable VAR_color_cmp_0_uxn_c_l253_c11_ab00_0 : unsigned(3 downto 0);
 variable VAR_CONST_SR_4_uxn_c_l253_c35_b52e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_c_l253_c35_b52e_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_c_l253_c25_f201_return_output : unsigned(3 downto 0);
 variable VAR_color_cmp_1 : unsigned(3 downto 0);
 variable VAR_color_cmp_1_uxn_c_l254_c11_e7d8_0 : unsigned(3 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_c_l254_c25_48bc_return_output : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l256_c7_e98e_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l256_c7_e98e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l256_c7_e98e_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_c_l256_c3_5ab6_iftrue : uint12_t_4;
 variable VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l256_c3_5ab6_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l256_c3_5ab6_iffalse : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l267_c8_1675_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l256_c3_5ab6_cond : unsigned(0 downto 0);
 variable VAR_tmp12_uxn_c_l257_c4_ccd6 : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l258_c4_4695_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l258_c4_4695_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l259_c4_054a_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l259_c4_054a_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l259_c4_054a_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l260_c4_9971_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l260_c4_9971_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l260_c4_9971_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_uxn_c_l262_c4_c058 : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l263_c4_e76d_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l263_c4_e76d_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l264_c4_f282_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l264_c4_f282_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l264_c4_f282_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l265_c4_b7df_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l265_c4_b7df_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l265_c4_b7df_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l267_c12_0feb_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l267_c12_0feb_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l267_c12_0feb_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_c_l267_c8_1675_iftrue : uint12_t_4;
 variable VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l267_c8_1675_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l267_c8_1675_iffalse : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l278_c8_bf55_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l267_c8_1675_cond : unsigned(0 downto 0);
 variable VAR_tmp12_uxn_c_l268_c4_435d : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l269_c4_fa32_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l269_c4_fa32_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l270_c4_fba6_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l270_c4_fba6_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l270_c4_fba6_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l271_c4_d99c_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l271_c4_d99c_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l271_c4_d99c_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_uxn_c_l273_c4_be16 : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l274_c4_556a_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l274_c4_556a_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l275_c4_4e89_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l275_c4_4e89_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l275_c4_4e89_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l276_c4_d7db_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l276_c4_d7db_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l276_c4_d7db_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l278_c12_a1b8_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l278_c12_a1b8_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l278_c12_a1b8_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_c_l278_c8_bf55_iftrue : uint12_t_4;
 variable VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l278_c8_bf55_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l278_c8_bf55_iffalse : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l289_c8_6b65_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l278_c8_bf55_cond : unsigned(0 downto 0);
 variable VAR_tmp12_uxn_c_l279_c4_1753 : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l280_c4_78de_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l280_c4_78de_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l281_c4_5b82_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l281_c4_5b82_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l281_c4_5b82_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l282_c4_ed70_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l282_c4_ed70_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l282_c4_ed70_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_uxn_c_l284_c4_8895 : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l285_c4_95bd_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l285_c4_95bd_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l286_c4_9ed0_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l286_c4_9ed0_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l286_c4_9ed0_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l287_c4_e676_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l287_c4_e676_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l287_c4_e676_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l289_c12_af95_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l289_c12_af95_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l289_c12_af95_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_c_l289_c8_6b65_iftrue : uint12_t_4;
 variable VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l289_c8_6b65_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l289_c8_6b65_iffalse : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l300_c8_9d03_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l289_c8_6b65_cond : unsigned(0 downto 0);
 variable VAR_tmp12_uxn_c_l290_c4_ff43 : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l291_c4_060e_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l291_c4_060e_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l292_c4_3280_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l292_c4_3280_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l292_c4_3280_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l293_c4_47ef_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l293_c4_47ef_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l293_c4_47ef_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_uxn_c_l295_c4_83e9 : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l296_c4_6a26_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l296_c4_6a26_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l297_c4_53c2_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l297_c4_53c2_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l297_c4_53c2_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l298_c4_e724_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l298_c4_e724_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l298_c4_e724_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l300_c12_4120_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l300_c12_4120_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l300_c12_4120_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_c_l300_c8_9d03_iftrue : uint12_t_4;
 variable VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l300_c8_9d03_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l300_c8_9d03_iffalse : uint12_t_4;
 variable VAR_color_FALSE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l300_c8_9d03_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l300_c8_9d03_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l302_c4_6022_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l302_c4_6022_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l302_c4_6022_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l303_c4_a55c_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l303_c4_a55c_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l303_c4_a55c_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l306_c4_ede5_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l306_c4_ede5_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l306_c4_ede5_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l307_c4_f636_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l307_c4_f636_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l307_c4_f636_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l309_c12_9449_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l309_c12_9449_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l309_c12_9449_return_output : unsigned(0 downto 0);
 variable VAR_color_2_MUX_uxn_c_l309_c8_9cb3_iftrue : unsigned(11 downto 0);
 variable VAR_color_2_MUX_uxn_c_l309_c8_9cb3_iffalse : unsigned(11 downto 0);
 variable VAR_color_2_MUX_uxn_c_l309_c8_9cb3_return_output : unsigned(11 downto 0);
 variable VAR_color_2_MUX_uxn_c_l309_c8_9cb3_cond : unsigned(0 downto 0);
 variable VAR_color_3_MUX_uxn_c_l309_c8_9cb3_iftrue : unsigned(11 downto 0);
 variable VAR_color_3_MUX_uxn_c_l309_c8_9cb3_iffalse : unsigned(11 downto 0);
 variable VAR_color_3_MUX_uxn_c_l309_c8_9cb3_return_output : unsigned(11 downto 0);
 variable VAR_color_3_MUX_uxn_c_l309_c8_9cb3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l311_c4_08c9_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l311_c4_08c9_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l311_c4_08c9_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l312_c4_0ab1_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l312_c4_0ab1_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l312_c4_0ab1_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l315_c4_45a3_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l315_c4_45a3_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l315_c4_45a3_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l316_c4_3046_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l316_c4_3046_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l316_c4_3046_return_output : unsigned(11 downto 0);
 variable VAR_result : unsigned(15 downto 0);
 variable VAR_result_uxn_c_l320_c11_9980_0 : unsigned(15 downto 0);
 variable VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l320_c20_3a93_var_dim_0 : unsigned(1 downto 0);
 variable VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l320_c20_3a93_return_output : unsigned(11 downto 0);
 variable VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l320_c20_3a93_ref_toks_0 : uint12_t_4;
 variable VAR_CONST_REF_RD_uint12_t_uint12_t_4_0_d41d_uxn_c_l259_l281_l302_DUPLICATE_6f0c_return_output : unsigned(11 downto 0);
 variable VAR_CONST_REF_RD_uint12_t_uint12_t_4_1_d41d_uxn_c_l264_l306_l286_DUPLICATE_8954_return_output : unsigned(11 downto 0);
 variable VAR_CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_uxn_c_l270_l292_l309_l311_DUPLICATE_a26d_return_output : unsigned(11 downto 0);
 variable VAR_CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_uxn_c_l275_l309_l315_l297_DUPLICATE_87d5_return_output : unsigned(11 downto 0);
 variable VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l310_l301_DUPLICATE_7d51_return_output : unsigned(11 downto 0);
 variable VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l314_l305_DUPLICATE_84b8_return_output : unsigned(11 downto 0);
 -- State registers comb logic variables
variable REG_VAR_color : uint12_t_4;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_color := color;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_c_l267_c12_0feb_right := to_unsigned(9, 4);
     VAR_BIN_OP_AND_uxn_c_l302_c4_6022_right := to_unsigned(4080, 12);
     VAR_BIN_OP_AND_uxn_c_l311_c4_08c9_right := to_unsigned(4080, 12);
     VAR_BIN_OP_AND_uxn_c_l292_c4_3280_right := to_unsigned(3855, 12);
     VAR_BIN_OP_AND_uxn_c_l315_c4_45a3_right := to_unsigned(4080, 12);
     VAR_BIN_OP_AND_uxn_c_l286_c4_9ed0_right := to_unsigned(3855, 12);
     VAR_BIN_OP_AND_uxn_c_l259_c4_054a_right := to_unsigned(255, 12);
     VAR_BIN_OP_EQ_uxn_c_l248_c30_0176_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l289_c12_af95_right := to_unsigned(11, 4);
     VAR_BIN_OP_EQ_uxn_c_l256_c7_e98e_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_c_l300_c12_4120_right := to_unsigned(12, 4);
     VAR_BIN_OP_AND_uxn_c_l297_c4_53c2_right := to_unsigned(3855, 12);
     VAR_BIN_OP_AND_uxn_c_l281_c4_5b82_right := to_unsigned(3855, 12);
     VAR_BIN_OP_AND_uxn_c_l270_c4_fba6_right := to_unsigned(255, 12);
     VAR_BIN_OP_EQ_uxn_c_l278_c12_a1b8_right := to_unsigned(10, 4);
     VAR_MUX_uxn_c_l248_c30_446d_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l248_c30_446d_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l309_c12_9449_right := to_unsigned(13, 4);
     VAR_BIN_OP_AND_uxn_c_l264_c4_f282_right := to_unsigned(255, 12);
     VAR_BIN_OP_AND_uxn_c_l275_c4_4e89_right := to_unsigned(255, 12);
     VAR_BIN_OP_AND_uxn_c_l306_c4_ede5_right := to_unsigned(4080, 12);

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
     VAR_color_MUX_uxn_c_l250_c2_f61a_iffalse := color;
     VAR_CONST_SR_4_uxn_c_l248_c30_cfa6_x := VAR_device_ram_address;
     VAR_CONST_SR_4_uxn_c_l253_c35_b52e_x := VAR_device_ram_value;
     VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l320_c20_3a93_var_dim_0 := VAR_gpu_step_color;
     VAR_BIN_OP_AND_uxn_c_l250_c6_43f8_left := VAR_is_device_ram_write;
     -- CONST_REF_RD_uint12_t_uint12_t_4_0_d41d_uxn_c_l259_l281_l302_DUPLICATE_6f0c LATENCY=0
     VAR_CONST_REF_RD_uint12_t_uint12_t_4_0_d41d_uxn_c_l259_l281_l302_DUPLICATE_6f0c_return_output := color(0);

     -- CAST_TO_uint4_t[uxn_c_l254_c25_48bc] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_c_l254_c25_48bc_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_device_ram_value);

     -- CONST_SR_4[uxn_c_l253_c35_b52e] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_c_l253_c35_b52e_x <= VAR_CONST_SR_4_uxn_c_l253_c35_b52e_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_c_l253_c35_b52e_return_output := CONST_SR_4_uxn_c_l253_c35_b52e_return_output;

     -- CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_uxn_c_l275_l309_l315_l297_DUPLICATE_87d5 LATENCY=0
     VAR_CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_uxn_c_l275_l309_l315_l297_DUPLICATE_87d5_return_output := color(3);

     -- CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_uxn_c_l270_l292_l309_l311_DUPLICATE_a26d LATENCY=0
     VAR_CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_uxn_c_l270_l292_l309_l311_DUPLICATE_a26d_return_output := color(2);

     -- CAST_TO_uint4_t[uxn_c_l252_c22_7bcb] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_c_l252_c22_7bcb_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_device_ram_address);

     -- CONST_SR_4[uxn_c_l248_c30_cfa6] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_c_l248_c30_cfa6_x <= VAR_CONST_SR_4_uxn_c_l248_c30_cfa6_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_c_l248_c30_cfa6_return_output := CONST_SR_4_uxn_c_l248_c30_cfa6_return_output;

     -- CONST_REF_RD_uint12_t_uint12_t_4_1_d41d_uxn_c_l264_l306_l286_DUPLICATE_8954 LATENCY=0
     VAR_CONST_REF_RD_uint12_t_uint12_t_4_1_d41d_uxn_c_l264_l306_l286_DUPLICATE_8954_return_output := color(1);

     -- Submodule level 1
     VAR_BIN_OP_EQ_uxn_c_l256_c7_e98e_left := VAR_CAST_TO_uint4_t_uxn_c_l252_c22_7bcb_return_output;
     VAR_BIN_OP_EQ_uxn_c_l267_c12_0feb_left := VAR_CAST_TO_uint4_t_uxn_c_l252_c22_7bcb_return_output;
     VAR_BIN_OP_EQ_uxn_c_l278_c12_a1b8_left := VAR_CAST_TO_uint4_t_uxn_c_l252_c22_7bcb_return_output;
     VAR_BIN_OP_EQ_uxn_c_l289_c12_af95_left := VAR_CAST_TO_uint4_t_uxn_c_l252_c22_7bcb_return_output;
     VAR_BIN_OP_EQ_uxn_c_l300_c12_4120_left := VAR_CAST_TO_uint4_t_uxn_c_l252_c22_7bcb_return_output;
     VAR_BIN_OP_EQ_uxn_c_l309_c12_9449_left := VAR_CAST_TO_uint4_t_uxn_c_l252_c22_7bcb_return_output;
     VAR_color_cmp_1_uxn_c_l254_c11_e7d8_0 := VAR_CAST_TO_uint4_t_uxn_c_l254_c25_48bc_return_output;
     VAR_BIN_OP_AND_uxn_c_l259_c4_054a_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_0_d41d_uxn_c_l259_l281_l302_DUPLICATE_6f0c_return_output;
     VAR_BIN_OP_AND_uxn_c_l281_c4_5b82_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_0_d41d_uxn_c_l259_l281_l302_DUPLICATE_6f0c_return_output;
     VAR_BIN_OP_AND_uxn_c_l302_c4_6022_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_0_d41d_uxn_c_l259_l281_l302_DUPLICATE_6f0c_return_output;
     VAR_BIN_OP_AND_uxn_c_l264_c4_f282_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_1_d41d_uxn_c_l264_l306_l286_DUPLICATE_8954_return_output;
     VAR_BIN_OP_AND_uxn_c_l286_c4_9ed0_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_1_d41d_uxn_c_l264_l306_l286_DUPLICATE_8954_return_output;
     VAR_BIN_OP_AND_uxn_c_l306_c4_ede5_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_1_d41d_uxn_c_l264_l306_l286_DUPLICATE_8954_return_output;
     VAR_BIN_OP_AND_uxn_c_l270_c4_fba6_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_uxn_c_l270_l292_l309_l311_DUPLICATE_a26d_return_output;
     VAR_BIN_OP_AND_uxn_c_l292_c4_3280_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_uxn_c_l270_l292_l309_l311_DUPLICATE_a26d_return_output;
     VAR_BIN_OP_AND_uxn_c_l311_c4_08c9_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_uxn_c_l270_l292_l309_l311_DUPLICATE_a26d_return_output;
     VAR_color_2_MUX_uxn_c_l309_c8_9cb3_iffalse := VAR_CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_uxn_c_l270_l292_l309_l311_DUPLICATE_a26d_return_output;
     VAR_BIN_OP_AND_uxn_c_l275_c4_4e89_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_uxn_c_l275_l309_l315_l297_DUPLICATE_87d5_return_output;
     VAR_BIN_OP_AND_uxn_c_l297_c4_53c2_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_uxn_c_l275_l309_l315_l297_DUPLICATE_87d5_return_output;
     VAR_BIN_OP_AND_uxn_c_l315_c4_45a3_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_uxn_c_l275_l309_l315_l297_DUPLICATE_87d5_return_output;
     VAR_color_3_MUX_uxn_c_l309_c8_9cb3_iffalse := VAR_CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_uxn_c_l275_l309_l315_l297_DUPLICATE_87d5_return_output;
     VAR_BIN_OP_EQ_uxn_c_l248_c30_0176_left := VAR_CONST_SR_4_uxn_c_l248_c30_cfa6_return_output;
     VAR_tmp12_uxn_c_l262_c4_c058 := resize(VAR_color_cmp_1_uxn_c_l254_c11_e7d8_0, 12);
     VAR_tmp12_uxn_c_l273_c4_be16 := resize(VAR_color_cmp_1_uxn_c_l254_c11_e7d8_0, 12);
     VAR_tmp12_uxn_c_l284_c4_8895 := resize(VAR_color_cmp_1_uxn_c_l254_c11_e7d8_0, 12);
     VAR_tmp12_uxn_c_l295_c4_83e9 := resize(VAR_color_cmp_1_uxn_c_l254_c11_e7d8_0, 12);
     VAR_CONST_SL_8_uxn_c_l263_c4_e76d_x := VAR_tmp12_uxn_c_l262_c4_c058;
     VAR_CONST_SL_8_uxn_c_l274_c4_556a_x := VAR_tmp12_uxn_c_l273_c4_be16;
     VAR_CONST_SL_4_uxn_c_l285_c4_95bd_x := VAR_tmp12_uxn_c_l284_c4_8895;
     VAR_CONST_SL_4_uxn_c_l296_c4_6a26_x := VAR_tmp12_uxn_c_l295_c4_83e9;
     -- CAST_TO_uint4_t[uxn_c_l253_c25_f201] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_c_l253_c25_f201_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_CONST_SR_4_uxn_c_l253_c35_b52e_return_output);

     -- BIN_OP_AND[uxn_c_l311_c4_08c9] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l311_c4_08c9_left <= VAR_BIN_OP_AND_uxn_c_l311_c4_08c9_left;
     BIN_OP_AND_uxn_c_l311_c4_08c9_right <= VAR_BIN_OP_AND_uxn_c_l311_c4_08c9_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l311_c4_08c9_return_output := BIN_OP_AND_uxn_c_l311_c4_08c9_return_output;

     -- BIN_OP_EQ[uxn_c_l248_c30_0176] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l248_c30_0176_left <= VAR_BIN_OP_EQ_uxn_c_l248_c30_0176_left;
     BIN_OP_EQ_uxn_c_l248_c30_0176_right <= VAR_BIN_OP_EQ_uxn_c_l248_c30_0176_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l248_c30_0176_return_output := BIN_OP_EQ_uxn_c_l248_c30_0176_return_output;

     -- CONST_SL_8[uxn_c_l274_c4_556a] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l274_c4_556a_x <= VAR_CONST_SL_8_uxn_c_l274_c4_556a_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l274_c4_556a_return_output := CONST_SL_8_uxn_c_l274_c4_556a_return_output;

     -- BIN_OP_EQ[uxn_c_l309_c12_9449] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l309_c12_9449_left <= VAR_BIN_OP_EQ_uxn_c_l309_c12_9449_left;
     BIN_OP_EQ_uxn_c_l309_c12_9449_right <= VAR_BIN_OP_EQ_uxn_c_l309_c12_9449_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l309_c12_9449_return_output := BIN_OP_EQ_uxn_c_l309_c12_9449_return_output;

     -- CONST_SL_4[uxn_c_l285_c4_95bd] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_c_l285_c4_95bd_x <= VAR_CONST_SL_4_uxn_c_l285_c4_95bd_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_c_l285_c4_95bd_return_output := CONST_SL_4_uxn_c_l285_c4_95bd_return_output;

     -- BIN_OP_EQ[uxn_c_l267_c12_0feb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l267_c12_0feb_left <= VAR_BIN_OP_EQ_uxn_c_l267_c12_0feb_left;
     BIN_OP_EQ_uxn_c_l267_c12_0feb_right <= VAR_BIN_OP_EQ_uxn_c_l267_c12_0feb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l267_c12_0feb_return_output := BIN_OP_EQ_uxn_c_l267_c12_0feb_return_output;

     -- BIN_OP_AND[uxn_c_l297_c4_53c2] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l297_c4_53c2_left <= VAR_BIN_OP_AND_uxn_c_l297_c4_53c2_left;
     BIN_OP_AND_uxn_c_l297_c4_53c2_right <= VAR_BIN_OP_AND_uxn_c_l297_c4_53c2_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l297_c4_53c2_return_output := BIN_OP_AND_uxn_c_l297_c4_53c2_return_output;

     -- BIN_OP_AND[uxn_c_l259_c4_054a] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l259_c4_054a_left <= VAR_BIN_OP_AND_uxn_c_l259_c4_054a_left;
     BIN_OP_AND_uxn_c_l259_c4_054a_right <= VAR_BIN_OP_AND_uxn_c_l259_c4_054a_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l259_c4_054a_return_output := BIN_OP_AND_uxn_c_l259_c4_054a_return_output;

     -- BIN_OP_AND[uxn_c_l281_c4_5b82] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l281_c4_5b82_left <= VAR_BIN_OP_AND_uxn_c_l281_c4_5b82_left;
     BIN_OP_AND_uxn_c_l281_c4_5b82_right <= VAR_BIN_OP_AND_uxn_c_l281_c4_5b82_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l281_c4_5b82_return_output := BIN_OP_AND_uxn_c_l281_c4_5b82_return_output;

     -- BIN_OP_AND[uxn_c_l270_c4_fba6] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l270_c4_fba6_left <= VAR_BIN_OP_AND_uxn_c_l270_c4_fba6_left;
     BIN_OP_AND_uxn_c_l270_c4_fba6_right <= VAR_BIN_OP_AND_uxn_c_l270_c4_fba6_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l270_c4_fba6_return_output := BIN_OP_AND_uxn_c_l270_c4_fba6_return_output;

     -- CAST_TO_uint12_t_uint4_t_uxn_c_l314_l305_DUPLICATE_84b8 LATENCY=0
     VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l314_l305_DUPLICATE_84b8_return_output := CAST_TO_uint12_t_uint4_t(
     VAR_color_cmp_1_uxn_c_l254_c11_e7d8_0);

     -- BIN_OP_EQ[uxn_c_l300_c12_4120] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l300_c12_4120_left <= VAR_BIN_OP_EQ_uxn_c_l300_c12_4120_left;
     BIN_OP_EQ_uxn_c_l300_c12_4120_right <= VAR_BIN_OP_EQ_uxn_c_l300_c12_4120_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l300_c12_4120_return_output := BIN_OP_EQ_uxn_c_l300_c12_4120_return_output;

     -- BIN_OP_EQ[uxn_c_l278_c12_a1b8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l278_c12_a1b8_left <= VAR_BIN_OP_EQ_uxn_c_l278_c12_a1b8_left;
     BIN_OP_EQ_uxn_c_l278_c12_a1b8_right <= VAR_BIN_OP_EQ_uxn_c_l278_c12_a1b8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l278_c12_a1b8_return_output := BIN_OP_EQ_uxn_c_l278_c12_a1b8_return_output;

     -- BIN_OP_AND[uxn_c_l292_c4_3280] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l292_c4_3280_left <= VAR_BIN_OP_AND_uxn_c_l292_c4_3280_left;
     BIN_OP_AND_uxn_c_l292_c4_3280_right <= VAR_BIN_OP_AND_uxn_c_l292_c4_3280_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l292_c4_3280_return_output := BIN_OP_AND_uxn_c_l292_c4_3280_return_output;

     -- BIN_OP_EQ[uxn_c_l256_c7_e98e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l256_c7_e98e_left <= VAR_BIN_OP_EQ_uxn_c_l256_c7_e98e_left;
     BIN_OP_EQ_uxn_c_l256_c7_e98e_right <= VAR_BIN_OP_EQ_uxn_c_l256_c7_e98e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l256_c7_e98e_return_output := BIN_OP_EQ_uxn_c_l256_c7_e98e_return_output;

     -- BIN_OP_AND[uxn_c_l275_c4_4e89] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l275_c4_4e89_left <= VAR_BIN_OP_AND_uxn_c_l275_c4_4e89_left;
     BIN_OP_AND_uxn_c_l275_c4_4e89_right <= VAR_BIN_OP_AND_uxn_c_l275_c4_4e89_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l275_c4_4e89_return_output := BIN_OP_AND_uxn_c_l275_c4_4e89_return_output;

     -- BIN_OP_AND[uxn_c_l306_c4_ede5] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l306_c4_ede5_left <= VAR_BIN_OP_AND_uxn_c_l306_c4_ede5_left;
     BIN_OP_AND_uxn_c_l306_c4_ede5_right <= VAR_BIN_OP_AND_uxn_c_l306_c4_ede5_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l306_c4_ede5_return_output := BIN_OP_AND_uxn_c_l306_c4_ede5_return_output;

     -- BIN_OP_AND[uxn_c_l315_c4_45a3] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l315_c4_45a3_left <= VAR_BIN_OP_AND_uxn_c_l315_c4_45a3_left;
     BIN_OP_AND_uxn_c_l315_c4_45a3_right <= VAR_BIN_OP_AND_uxn_c_l315_c4_45a3_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l315_c4_45a3_return_output := BIN_OP_AND_uxn_c_l315_c4_45a3_return_output;

     -- BIN_OP_AND[uxn_c_l302_c4_6022] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l302_c4_6022_left <= VAR_BIN_OP_AND_uxn_c_l302_c4_6022_left;
     BIN_OP_AND_uxn_c_l302_c4_6022_right <= VAR_BIN_OP_AND_uxn_c_l302_c4_6022_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l302_c4_6022_return_output := BIN_OP_AND_uxn_c_l302_c4_6022_return_output;

     -- CONST_SL_8[uxn_c_l263_c4_e76d] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l263_c4_e76d_x <= VAR_CONST_SL_8_uxn_c_l263_c4_e76d_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l263_c4_e76d_return_output := CONST_SL_8_uxn_c_l263_c4_e76d_return_output;

     -- BIN_OP_AND[uxn_c_l264_c4_f282] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l264_c4_f282_left <= VAR_BIN_OP_AND_uxn_c_l264_c4_f282_left;
     BIN_OP_AND_uxn_c_l264_c4_f282_right <= VAR_BIN_OP_AND_uxn_c_l264_c4_f282_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l264_c4_f282_return_output := BIN_OP_AND_uxn_c_l264_c4_f282_return_output;

     -- CONST_SL_4[uxn_c_l296_c4_6a26] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_c_l296_c4_6a26_x <= VAR_CONST_SL_4_uxn_c_l296_c4_6a26_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_c_l296_c4_6a26_return_output := CONST_SL_4_uxn_c_l296_c4_6a26_return_output;

     -- BIN_OP_EQ[uxn_c_l289_c12_af95] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l289_c12_af95_left <= VAR_BIN_OP_EQ_uxn_c_l289_c12_af95_left;
     BIN_OP_EQ_uxn_c_l289_c12_af95_right <= VAR_BIN_OP_EQ_uxn_c_l289_c12_af95_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l289_c12_af95_return_output := BIN_OP_EQ_uxn_c_l289_c12_af95_return_output;

     -- BIN_OP_AND[uxn_c_l286_c4_9ed0] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l286_c4_9ed0_left <= VAR_BIN_OP_AND_uxn_c_l286_c4_9ed0_left;
     BIN_OP_AND_uxn_c_l286_c4_9ed0_right <= VAR_BIN_OP_AND_uxn_c_l286_c4_9ed0_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l286_c4_9ed0_return_output := BIN_OP_AND_uxn_c_l286_c4_9ed0_return_output;

     -- Submodule level 2
     VAR_BIN_OP_OR_uxn_c_l260_c4_9971_left := VAR_BIN_OP_AND_uxn_c_l259_c4_054a_return_output;
     VAR_BIN_OP_OR_uxn_c_l265_c4_b7df_left := VAR_BIN_OP_AND_uxn_c_l264_c4_f282_return_output;
     VAR_BIN_OP_OR_uxn_c_l271_c4_d99c_left := VAR_BIN_OP_AND_uxn_c_l270_c4_fba6_return_output;
     VAR_BIN_OP_OR_uxn_c_l276_c4_d7db_left := VAR_BIN_OP_AND_uxn_c_l275_c4_4e89_return_output;
     VAR_BIN_OP_OR_uxn_c_l282_c4_ed70_left := VAR_BIN_OP_AND_uxn_c_l281_c4_5b82_return_output;
     VAR_BIN_OP_OR_uxn_c_l287_c4_e676_left := VAR_BIN_OP_AND_uxn_c_l286_c4_9ed0_return_output;
     VAR_BIN_OP_OR_uxn_c_l293_c4_47ef_left := VAR_BIN_OP_AND_uxn_c_l292_c4_3280_return_output;
     VAR_BIN_OP_OR_uxn_c_l298_c4_e724_left := VAR_BIN_OP_AND_uxn_c_l297_c4_53c2_return_output;
     VAR_BIN_OP_OR_uxn_c_l303_c4_a55c_left := VAR_BIN_OP_AND_uxn_c_l302_c4_6022_return_output;
     VAR_BIN_OP_OR_uxn_c_l307_c4_f636_left := VAR_BIN_OP_AND_uxn_c_l306_c4_ede5_return_output;
     VAR_BIN_OP_OR_uxn_c_l312_c4_0ab1_left := VAR_BIN_OP_AND_uxn_c_l311_c4_08c9_return_output;
     VAR_BIN_OP_OR_uxn_c_l316_c4_3046_left := VAR_BIN_OP_AND_uxn_c_l315_c4_45a3_return_output;
     VAR_MUX_uxn_c_l248_c30_446d_cond := VAR_BIN_OP_EQ_uxn_c_l248_c30_0176_return_output;
     VAR_color_MUX_uxn_c_l256_c3_5ab6_cond := VAR_BIN_OP_EQ_uxn_c_l256_c7_e98e_return_output;
     VAR_color_MUX_uxn_c_l267_c8_1675_cond := VAR_BIN_OP_EQ_uxn_c_l267_c12_0feb_return_output;
     VAR_color_MUX_uxn_c_l278_c8_bf55_cond := VAR_BIN_OP_EQ_uxn_c_l278_c12_a1b8_return_output;
     VAR_color_MUX_uxn_c_l289_c8_6b65_cond := VAR_BIN_OP_EQ_uxn_c_l289_c12_af95_return_output;
     VAR_color_MUX_uxn_c_l300_c8_9d03_cond := VAR_BIN_OP_EQ_uxn_c_l300_c12_4120_return_output;
     VAR_color_2_MUX_uxn_c_l309_c8_9cb3_cond := VAR_BIN_OP_EQ_uxn_c_l309_c12_9449_return_output;
     VAR_color_3_MUX_uxn_c_l309_c8_9cb3_cond := VAR_BIN_OP_EQ_uxn_c_l309_c12_9449_return_output;
     VAR_BIN_OP_OR_uxn_c_l307_c4_f636_right := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l314_l305_DUPLICATE_84b8_return_output;
     VAR_BIN_OP_OR_uxn_c_l316_c4_3046_right := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l314_l305_DUPLICATE_84b8_return_output;
     VAR_color_cmp_0_uxn_c_l253_c11_ab00_0 := VAR_CAST_TO_uint4_t_uxn_c_l253_c25_f201_return_output;
     VAR_BIN_OP_OR_uxn_c_l287_c4_e676_right := VAR_CONST_SL_4_uxn_c_l285_c4_95bd_return_output;
     VAR_BIN_OP_OR_uxn_c_l298_c4_e724_right := VAR_CONST_SL_4_uxn_c_l296_c4_6a26_return_output;
     VAR_BIN_OP_OR_uxn_c_l265_c4_b7df_right := VAR_CONST_SL_8_uxn_c_l263_c4_e76d_return_output;
     VAR_BIN_OP_OR_uxn_c_l276_c4_d7db_right := VAR_CONST_SL_8_uxn_c_l274_c4_556a_return_output;
     VAR_tmp12_uxn_c_l257_c4_ccd6 := resize(VAR_color_cmp_0_uxn_c_l253_c11_ab00_0, 12);
     VAR_tmp12_uxn_c_l268_c4_435d := resize(VAR_color_cmp_0_uxn_c_l253_c11_ab00_0, 12);
     VAR_tmp12_uxn_c_l279_c4_1753 := resize(VAR_color_cmp_0_uxn_c_l253_c11_ab00_0, 12);
     VAR_tmp12_uxn_c_l290_c4_ff43 := resize(VAR_color_cmp_0_uxn_c_l253_c11_ab00_0, 12);
     VAR_CONST_SL_8_uxn_c_l258_c4_4695_x := VAR_tmp12_uxn_c_l257_c4_ccd6;
     VAR_CONST_SL_8_uxn_c_l269_c4_fa32_x := VAR_tmp12_uxn_c_l268_c4_435d;
     VAR_CONST_SL_4_uxn_c_l280_c4_78de_x := VAR_tmp12_uxn_c_l279_c4_1753;
     VAR_CONST_SL_4_uxn_c_l291_c4_060e_x := VAR_tmp12_uxn_c_l290_c4_ff43;
     -- BIN_OP_OR[uxn_c_l276_c4_d7db] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l276_c4_d7db_left <= VAR_BIN_OP_OR_uxn_c_l276_c4_d7db_left;
     BIN_OP_OR_uxn_c_l276_c4_d7db_right <= VAR_BIN_OP_OR_uxn_c_l276_c4_d7db_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l276_c4_d7db_return_output := BIN_OP_OR_uxn_c_l276_c4_d7db_return_output;

     -- BIN_OP_OR[uxn_c_l287_c4_e676] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l287_c4_e676_left <= VAR_BIN_OP_OR_uxn_c_l287_c4_e676_left;
     BIN_OP_OR_uxn_c_l287_c4_e676_right <= VAR_BIN_OP_OR_uxn_c_l287_c4_e676_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l287_c4_e676_return_output := BIN_OP_OR_uxn_c_l287_c4_e676_return_output;

     -- BIN_OP_OR[uxn_c_l298_c4_e724] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l298_c4_e724_left <= VAR_BIN_OP_OR_uxn_c_l298_c4_e724_left;
     BIN_OP_OR_uxn_c_l298_c4_e724_right <= VAR_BIN_OP_OR_uxn_c_l298_c4_e724_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l298_c4_e724_return_output := BIN_OP_OR_uxn_c_l298_c4_e724_return_output;

     -- BIN_OP_OR[uxn_c_l265_c4_b7df] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l265_c4_b7df_left <= VAR_BIN_OP_OR_uxn_c_l265_c4_b7df_left;
     BIN_OP_OR_uxn_c_l265_c4_b7df_right <= VAR_BIN_OP_OR_uxn_c_l265_c4_b7df_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l265_c4_b7df_return_output := BIN_OP_OR_uxn_c_l265_c4_b7df_return_output;

     -- CONST_SL_4[uxn_c_l291_c4_060e] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_c_l291_c4_060e_x <= VAR_CONST_SL_4_uxn_c_l291_c4_060e_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_c_l291_c4_060e_return_output := CONST_SL_4_uxn_c_l291_c4_060e_return_output;

     -- CONST_SL_8[uxn_c_l269_c4_fa32] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l269_c4_fa32_x <= VAR_CONST_SL_8_uxn_c_l269_c4_fa32_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l269_c4_fa32_return_output := CONST_SL_8_uxn_c_l269_c4_fa32_return_output;

     -- BIN_OP_OR[uxn_c_l307_c4_f636] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l307_c4_f636_left <= VAR_BIN_OP_OR_uxn_c_l307_c4_f636_left;
     BIN_OP_OR_uxn_c_l307_c4_f636_right <= VAR_BIN_OP_OR_uxn_c_l307_c4_f636_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l307_c4_f636_return_output := BIN_OP_OR_uxn_c_l307_c4_f636_return_output;

     -- BIN_OP_OR[uxn_c_l316_c4_3046] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l316_c4_3046_left <= VAR_BIN_OP_OR_uxn_c_l316_c4_3046_left;
     BIN_OP_OR_uxn_c_l316_c4_3046_right <= VAR_BIN_OP_OR_uxn_c_l316_c4_3046_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l316_c4_3046_return_output := BIN_OP_OR_uxn_c_l316_c4_3046_return_output;

     -- CONST_SL_8[uxn_c_l258_c4_4695] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l258_c4_4695_x <= VAR_CONST_SL_8_uxn_c_l258_c4_4695_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l258_c4_4695_return_output := CONST_SL_8_uxn_c_l258_c4_4695_return_output;

     -- CONST_SL_4[uxn_c_l280_c4_78de] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_c_l280_c4_78de_x <= VAR_CONST_SL_4_uxn_c_l280_c4_78de_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_c_l280_c4_78de_return_output := CONST_SL_4_uxn_c_l280_c4_78de_return_output;

     -- MUX[uxn_c_l248_c30_446d] LATENCY=0
     -- Inputs
     MUX_uxn_c_l248_c30_446d_cond <= VAR_MUX_uxn_c_l248_c30_446d_cond;
     MUX_uxn_c_l248_c30_446d_iftrue <= VAR_MUX_uxn_c_l248_c30_446d_iftrue;
     MUX_uxn_c_l248_c30_446d_iffalse <= VAR_MUX_uxn_c_l248_c30_446d_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l248_c30_446d_return_output := MUX_uxn_c_l248_c30_446d_return_output;

     -- CAST_TO_uint12_t_uint4_t_uxn_c_l310_l301_DUPLICATE_7d51 LATENCY=0
     VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l310_l301_DUPLICATE_7d51_return_output := CAST_TO_uint12_t_uint4_t(
     VAR_color_cmp_0_uxn_c_l253_c11_ab00_0);

     -- Submodule level 3
     VAR_color_3_MUX_uxn_c_l309_c8_9cb3_iftrue := VAR_BIN_OP_OR_uxn_c_l316_c4_3046_return_output;
     VAR_BIN_OP_OR_uxn_c_l303_c4_a55c_right := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l310_l301_DUPLICATE_7d51_return_output;
     VAR_BIN_OP_OR_uxn_c_l312_c4_0ab1_right := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l310_l301_DUPLICATE_7d51_return_output;
     VAR_BIN_OP_OR_uxn_c_l282_c4_ed70_right := VAR_CONST_SL_4_uxn_c_l280_c4_78de_return_output;
     VAR_BIN_OP_OR_uxn_c_l293_c4_47ef_right := VAR_CONST_SL_4_uxn_c_l291_c4_060e_return_output;
     VAR_BIN_OP_OR_uxn_c_l260_c4_9971_right := VAR_CONST_SL_8_uxn_c_l258_c4_4695_return_output;
     VAR_BIN_OP_OR_uxn_c_l271_c4_d99c_right := VAR_CONST_SL_8_uxn_c_l269_c4_fa32_return_output;
     VAR_BIN_OP_AND_uxn_c_l250_c6_43f8_right := VAR_MUX_uxn_c_l248_c30_446d_return_output;
     -- BIN_OP_OR[uxn_c_l312_c4_0ab1] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l312_c4_0ab1_left <= VAR_BIN_OP_OR_uxn_c_l312_c4_0ab1_left;
     BIN_OP_OR_uxn_c_l312_c4_0ab1_right <= VAR_BIN_OP_OR_uxn_c_l312_c4_0ab1_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l312_c4_0ab1_return_output := BIN_OP_OR_uxn_c_l312_c4_0ab1_return_output;

     -- BIN_OP_OR[uxn_c_l282_c4_ed70] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l282_c4_ed70_left <= VAR_BIN_OP_OR_uxn_c_l282_c4_ed70_left;
     BIN_OP_OR_uxn_c_l282_c4_ed70_right <= VAR_BIN_OP_OR_uxn_c_l282_c4_ed70_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l282_c4_ed70_return_output := BIN_OP_OR_uxn_c_l282_c4_ed70_return_output;

     -- color_3_MUX[uxn_c_l309_c8_9cb3] LATENCY=0
     -- Inputs
     color_3_MUX_uxn_c_l309_c8_9cb3_cond <= VAR_color_3_MUX_uxn_c_l309_c8_9cb3_cond;
     color_3_MUX_uxn_c_l309_c8_9cb3_iftrue <= VAR_color_3_MUX_uxn_c_l309_c8_9cb3_iftrue;
     color_3_MUX_uxn_c_l309_c8_9cb3_iffalse <= VAR_color_3_MUX_uxn_c_l309_c8_9cb3_iffalse;
     -- Outputs
     VAR_color_3_MUX_uxn_c_l309_c8_9cb3_return_output := color_3_MUX_uxn_c_l309_c8_9cb3_return_output;

     -- BIN_OP_OR[uxn_c_l271_c4_d99c] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l271_c4_d99c_left <= VAR_BIN_OP_OR_uxn_c_l271_c4_d99c_left;
     BIN_OP_OR_uxn_c_l271_c4_d99c_right <= VAR_BIN_OP_OR_uxn_c_l271_c4_d99c_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l271_c4_d99c_return_output := BIN_OP_OR_uxn_c_l271_c4_d99c_return_output;

     -- BIN_OP_AND[uxn_c_l250_c6_43f8] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l250_c6_43f8_left <= VAR_BIN_OP_AND_uxn_c_l250_c6_43f8_left;
     BIN_OP_AND_uxn_c_l250_c6_43f8_right <= VAR_BIN_OP_AND_uxn_c_l250_c6_43f8_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l250_c6_43f8_return_output := BIN_OP_AND_uxn_c_l250_c6_43f8_return_output;

     -- BIN_OP_OR[uxn_c_l260_c4_9971] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l260_c4_9971_left <= VAR_BIN_OP_OR_uxn_c_l260_c4_9971_left;
     BIN_OP_OR_uxn_c_l260_c4_9971_right <= VAR_BIN_OP_OR_uxn_c_l260_c4_9971_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l260_c4_9971_return_output := BIN_OP_OR_uxn_c_l260_c4_9971_return_output;

     -- BIN_OP_OR[uxn_c_l293_c4_47ef] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l293_c4_47ef_left <= VAR_BIN_OP_OR_uxn_c_l293_c4_47ef_left;
     BIN_OP_OR_uxn_c_l293_c4_47ef_right <= VAR_BIN_OP_OR_uxn_c_l293_c4_47ef_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l293_c4_47ef_return_output := BIN_OP_OR_uxn_c_l293_c4_47ef_return_output;

     -- BIN_OP_OR[uxn_c_l303_c4_a55c] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l303_c4_a55c_left <= VAR_BIN_OP_OR_uxn_c_l303_c4_a55c_left;
     BIN_OP_OR_uxn_c_l303_c4_a55c_right <= VAR_BIN_OP_OR_uxn_c_l303_c4_a55c_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l303_c4_a55c_return_output := BIN_OP_OR_uxn_c_l303_c4_a55c_return_output;

     -- Submodule level 4
     VAR_color_MUX_uxn_c_l250_c2_f61a_cond := VAR_BIN_OP_AND_uxn_c_l250_c6_43f8_return_output;
     VAR_color_2_MUX_uxn_c_l309_c8_9cb3_iftrue := VAR_BIN_OP_OR_uxn_c_l312_c4_0ab1_return_output;
     -- color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5[uxn_c_l267_c8_1675] LATENCY=0
     VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l267_c8_1675_return_output := CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5(
     color,
     VAR_BIN_OP_OR_uxn_c_l271_c4_d99c_return_output,
     VAR_BIN_OP_OR_uxn_c_l276_c4_d7db_return_output);

     -- color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8[uxn_c_l256_c3_5ab6] LATENCY=0
     VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l256_c3_5ab6_return_output := CONST_REF_RD_uint12_t_4_uint12_t_4_90b8(
     color,
     VAR_BIN_OP_OR_uxn_c_l260_c4_9971_return_output,
     VAR_BIN_OP_OR_uxn_c_l265_c4_b7df_return_output);

     -- color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5[uxn_c_l289_c8_6b65] LATENCY=0
     VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l289_c8_6b65_return_output := CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5(
     color,
     VAR_BIN_OP_OR_uxn_c_l293_c4_47ef_return_output,
     VAR_BIN_OP_OR_uxn_c_l298_c4_e724_return_output);

     -- color_2_MUX[uxn_c_l309_c8_9cb3] LATENCY=0
     -- Inputs
     color_2_MUX_uxn_c_l309_c8_9cb3_cond <= VAR_color_2_MUX_uxn_c_l309_c8_9cb3_cond;
     color_2_MUX_uxn_c_l309_c8_9cb3_iftrue <= VAR_color_2_MUX_uxn_c_l309_c8_9cb3_iftrue;
     color_2_MUX_uxn_c_l309_c8_9cb3_iffalse <= VAR_color_2_MUX_uxn_c_l309_c8_9cb3_iffalse;
     -- Outputs
     VAR_color_2_MUX_uxn_c_l309_c8_9cb3_return_output := color_2_MUX_uxn_c_l309_c8_9cb3_return_output;

     -- color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8[uxn_c_l278_c8_bf55] LATENCY=0
     VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l278_c8_bf55_return_output := CONST_REF_RD_uint12_t_4_uint12_t_4_90b8(
     color,
     VAR_BIN_OP_OR_uxn_c_l282_c4_ed70_return_output,
     VAR_BIN_OP_OR_uxn_c_l287_c4_e676_return_output);

     -- color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8[uxn_c_l300_c8_9d03] LATENCY=0
     VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l300_c8_9d03_return_output := CONST_REF_RD_uint12_t_4_uint12_t_4_90b8(
     color,
     VAR_BIN_OP_OR_uxn_c_l303_c4_a55c_return_output,
     VAR_BIN_OP_OR_uxn_c_l307_c4_f636_return_output);

     -- Submodule level 5
     VAR_color_MUX_uxn_c_l256_c3_5ab6_iftrue := VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l256_c3_5ab6_return_output;
     VAR_color_MUX_uxn_c_l278_c8_bf55_iftrue := VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l278_c8_bf55_return_output;
     VAR_color_MUX_uxn_c_l300_c8_9d03_iftrue := VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l300_c8_9d03_return_output;
     VAR_color_MUX_uxn_c_l267_c8_1675_iftrue := VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l267_c8_1675_return_output;
     VAR_color_MUX_uxn_c_l289_c8_6b65_iftrue := VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l289_c8_6b65_return_output;
     -- color_FALSE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5[uxn_c_l300_c8_9d03] LATENCY=0
     VAR_color_FALSE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l300_c8_9d03_return_output := CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5(
     color,
     VAR_color_2_MUX_uxn_c_l309_c8_9cb3_return_output,
     VAR_color_3_MUX_uxn_c_l309_c8_9cb3_return_output);

     -- Submodule level 6
     VAR_color_MUX_uxn_c_l300_c8_9d03_iffalse := VAR_color_FALSE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l300_c8_9d03_return_output;
     -- color_MUX[uxn_c_l300_c8_9d03] LATENCY=0
     -- Inputs
     color_MUX_uxn_c_l300_c8_9d03_cond <= VAR_color_MUX_uxn_c_l300_c8_9d03_cond;
     color_MUX_uxn_c_l300_c8_9d03_iftrue <= VAR_color_MUX_uxn_c_l300_c8_9d03_iftrue;
     color_MUX_uxn_c_l300_c8_9d03_iffalse <= VAR_color_MUX_uxn_c_l300_c8_9d03_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_c_l300_c8_9d03_return_output := color_MUX_uxn_c_l300_c8_9d03_return_output;

     -- Submodule level 7
     VAR_color_MUX_uxn_c_l289_c8_6b65_iffalse := VAR_color_MUX_uxn_c_l300_c8_9d03_return_output;
     -- color_MUX[uxn_c_l289_c8_6b65] LATENCY=0
     -- Inputs
     color_MUX_uxn_c_l289_c8_6b65_cond <= VAR_color_MUX_uxn_c_l289_c8_6b65_cond;
     color_MUX_uxn_c_l289_c8_6b65_iftrue <= VAR_color_MUX_uxn_c_l289_c8_6b65_iftrue;
     color_MUX_uxn_c_l289_c8_6b65_iffalse <= VAR_color_MUX_uxn_c_l289_c8_6b65_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_c_l289_c8_6b65_return_output := color_MUX_uxn_c_l289_c8_6b65_return_output;

     -- Submodule level 8
     VAR_color_MUX_uxn_c_l278_c8_bf55_iffalse := VAR_color_MUX_uxn_c_l289_c8_6b65_return_output;
     -- color_MUX[uxn_c_l278_c8_bf55] LATENCY=0
     -- Inputs
     color_MUX_uxn_c_l278_c8_bf55_cond <= VAR_color_MUX_uxn_c_l278_c8_bf55_cond;
     color_MUX_uxn_c_l278_c8_bf55_iftrue <= VAR_color_MUX_uxn_c_l278_c8_bf55_iftrue;
     color_MUX_uxn_c_l278_c8_bf55_iffalse <= VAR_color_MUX_uxn_c_l278_c8_bf55_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_c_l278_c8_bf55_return_output := color_MUX_uxn_c_l278_c8_bf55_return_output;

     -- Submodule level 9
     VAR_color_MUX_uxn_c_l267_c8_1675_iffalse := VAR_color_MUX_uxn_c_l278_c8_bf55_return_output;
     -- color_MUX[uxn_c_l267_c8_1675] LATENCY=0
     -- Inputs
     color_MUX_uxn_c_l267_c8_1675_cond <= VAR_color_MUX_uxn_c_l267_c8_1675_cond;
     color_MUX_uxn_c_l267_c8_1675_iftrue <= VAR_color_MUX_uxn_c_l267_c8_1675_iftrue;
     color_MUX_uxn_c_l267_c8_1675_iffalse <= VAR_color_MUX_uxn_c_l267_c8_1675_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_c_l267_c8_1675_return_output := color_MUX_uxn_c_l267_c8_1675_return_output;

     -- Submodule level 10
     VAR_color_MUX_uxn_c_l256_c3_5ab6_iffalse := VAR_color_MUX_uxn_c_l267_c8_1675_return_output;
     -- color_MUX[uxn_c_l256_c3_5ab6] LATENCY=0
     -- Inputs
     color_MUX_uxn_c_l256_c3_5ab6_cond <= VAR_color_MUX_uxn_c_l256_c3_5ab6_cond;
     color_MUX_uxn_c_l256_c3_5ab6_iftrue <= VAR_color_MUX_uxn_c_l256_c3_5ab6_iftrue;
     color_MUX_uxn_c_l256_c3_5ab6_iffalse <= VAR_color_MUX_uxn_c_l256_c3_5ab6_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_c_l256_c3_5ab6_return_output := color_MUX_uxn_c_l256_c3_5ab6_return_output;

     -- Submodule level 11
     VAR_color_MUX_uxn_c_l250_c2_f61a_iftrue := VAR_color_MUX_uxn_c_l256_c3_5ab6_return_output;
     -- color_MUX[uxn_c_l250_c2_f61a] LATENCY=0
     -- Inputs
     color_MUX_uxn_c_l250_c2_f61a_cond <= VAR_color_MUX_uxn_c_l250_c2_f61a_cond;
     color_MUX_uxn_c_l250_c2_f61a_iftrue <= VAR_color_MUX_uxn_c_l250_c2_f61a_iftrue;
     color_MUX_uxn_c_l250_c2_f61a_iffalse <= VAR_color_MUX_uxn_c_l250_c2_f61a_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_c_l250_c2_f61a_return_output := color_MUX_uxn_c_l250_c2_f61a_return_output;

     -- Submodule level 12
     VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l320_c20_3a93_ref_toks_0 := VAR_color_MUX_uxn_c_l250_c2_f61a_return_output;
     REG_VAR_color := VAR_color_MUX_uxn_c_l250_c2_f61a_return_output;
     -- VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d[uxn_c_l320_c20_3a93] LATENCY=0
     -- Inputs
     VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l320_c20_3a93_ref_toks_0 <= VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l320_c20_3a93_ref_toks_0;
     VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l320_c20_3a93_var_dim_0 <= VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l320_c20_3a93_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l320_c20_3a93_return_output := VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l320_c20_3a93_return_output;

     -- Submodule level 13
     VAR_result_uxn_c_l320_c11_9980_0 := resize(VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l320_c20_3a93_return_output, 16);
     VAR_return_output := VAR_result_uxn_c_l320_c11_9980_0;
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
