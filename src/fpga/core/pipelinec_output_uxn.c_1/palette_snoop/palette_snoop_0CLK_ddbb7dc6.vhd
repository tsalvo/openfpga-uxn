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
-- CONST_SR_4[uxn_c_l270_c30_03d0]
signal CONST_SR_4_uxn_c_l270_c30_03d0_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_c_l270_c30_03d0_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_c_l270_c30_7eb5]
signal BIN_OP_EQ_uxn_c_l270_c30_7eb5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l270_c30_7eb5_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l270_c30_7eb5_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l270_c30_3e67]
signal MUX_uxn_c_l270_c30_3e67_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l270_c30_3e67_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l270_c30_3e67_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l270_c30_3e67_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l272_c6_73e8]
signal BIN_OP_AND_uxn_c_l272_c6_73e8_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l272_c6_73e8_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l272_c6_73e8_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_c_l272_c2_d3f2]
signal color_MUX_uxn_c_l272_c2_d3f2_cond : unsigned(0 downto 0);
signal color_MUX_uxn_c_l272_c2_d3f2_iftrue : uint12_t_4;
signal color_MUX_uxn_c_l272_c2_d3f2_iffalse : uint12_t_4;
signal color_MUX_uxn_c_l272_c2_d3f2_return_output : uint12_t_4;

-- CONST_SR_4[uxn_c_l275_c35_90ae]
signal CONST_SR_4_uxn_c_l275_c35_90ae_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_c_l275_c35_90ae_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_c_l278_c7_1900]
signal BIN_OP_EQ_uxn_c_l278_c7_1900_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l278_c7_1900_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l278_c7_1900_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_c_l278_c3_58c0]
signal color_MUX_uxn_c_l278_c3_58c0_cond : unsigned(0 downto 0);
signal color_MUX_uxn_c_l278_c3_58c0_iftrue : uint12_t_4;
signal color_MUX_uxn_c_l278_c3_58c0_iffalse : uint12_t_4;
signal color_MUX_uxn_c_l278_c3_58c0_return_output : uint12_t_4;

-- CONST_SL_8[uxn_c_l280_c4_31fd]
signal CONST_SL_8_uxn_c_l280_c4_31fd_x : unsigned(11 downto 0);
signal CONST_SL_8_uxn_c_l280_c4_31fd_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l281_c4_b736]
signal BIN_OP_AND_uxn_c_l281_c4_b736_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l281_c4_b736_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l281_c4_b736_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l282_c4_36d9]
signal BIN_OP_OR_uxn_c_l282_c4_36d9_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l282_c4_36d9_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l282_c4_36d9_return_output : unsigned(11 downto 0);

-- CONST_SL_8[uxn_c_l285_c4_9bf4]
signal CONST_SL_8_uxn_c_l285_c4_9bf4_x : unsigned(11 downto 0);
signal CONST_SL_8_uxn_c_l285_c4_9bf4_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l286_c4_1766]
signal BIN_OP_AND_uxn_c_l286_c4_1766_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l286_c4_1766_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l286_c4_1766_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l287_c4_34bb]
signal BIN_OP_OR_uxn_c_l287_c4_34bb_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l287_c4_34bb_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l287_c4_34bb_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l289_c12_7f38]
signal BIN_OP_EQ_uxn_c_l289_c12_7f38_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l289_c12_7f38_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l289_c12_7f38_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_c_l289_c8_3337]
signal color_MUX_uxn_c_l289_c8_3337_cond : unsigned(0 downto 0);
signal color_MUX_uxn_c_l289_c8_3337_iftrue : uint12_t_4;
signal color_MUX_uxn_c_l289_c8_3337_iffalse : uint12_t_4;
signal color_MUX_uxn_c_l289_c8_3337_return_output : uint12_t_4;

-- CONST_SL_8[uxn_c_l291_c4_7bac]
signal CONST_SL_8_uxn_c_l291_c4_7bac_x : unsigned(11 downto 0);
signal CONST_SL_8_uxn_c_l291_c4_7bac_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l292_c4_6094]
signal BIN_OP_AND_uxn_c_l292_c4_6094_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l292_c4_6094_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l292_c4_6094_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l293_c4_4229]
signal BIN_OP_OR_uxn_c_l293_c4_4229_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l293_c4_4229_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l293_c4_4229_return_output : unsigned(11 downto 0);

-- CONST_SL_8[uxn_c_l296_c4_63a8]
signal CONST_SL_8_uxn_c_l296_c4_63a8_x : unsigned(11 downto 0);
signal CONST_SL_8_uxn_c_l296_c4_63a8_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l297_c4_4cd5]
signal BIN_OP_AND_uxn_c_l297_c4_4cd5_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l297_c4_4cd5_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l297_c4_4cd5_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l298_c4_c925]
signal BIN_OP_OR_uxn_c_l298_c4_c925_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l298_c4_c925_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l298_c4_c925_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l300_c12_495a]
signal BIN_OP_EQ_uxn_c_l300_c12_495a_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l300_c12_495a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l300_c12_495a_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_c_l300_c8_a8d4]
signal color_MUX_uxn_c_l300_c8_a8d4_cond : unsigned(0 downto 0);
signal color_MUX_uxn_c_l300_c8_a8d4_iftrue : uint12_t_4;
signal color_MUX_uxn_c_l300_c8_a8d4_iffalse : uint12_t_4;
signal color_MUX_uxn_c_l300_c8_a8d4_return_output : uint12_t_4;

-- CONST_SL_4[uxn_c_l302_c4_f911]
signal CONST_SL_4_uxn_c_l302_c4_f911_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_c_l302_c4_f911_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l303_c4_297a]
signal BIN_OP_AND_uxn_c_l303_c4_297a_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l303_c4_297a_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l303_c4_297a_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l304_c4_2464]
signal BIN_OP_OR_uxn_c_l304_c4_2464_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l304_c4_2464_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l304_c4_2464_return_output : unsigned(11 downto 0);

-- CONST_SL_4[uxn_c_l307_c4_0535]
signal CONST_SL_4_uxn_c_l307_c4_0535_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_c_l307_c4_0535_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l308_c4_edbf]
signal BIN_OP_AND_uxn_c_l308_c4_edbf_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l308_c4_edbf_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l308_c4_edbf_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l309_c4_7f1c]
signal BIN_OP_OR_uxn_c_l309_c4_7f1c_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l309_c4_7f1c_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l309_c4_7f1c_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l311_c12_d6c4]
signal BIN_OP_EQ_uxn_c_l311_c12_d6c4_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l311_c12_d6c4_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l311_c12_d6c4_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_c_l311_c8_2b3a]
signal color_MUX_uxn_c_l311_c8_2b3a_cond : unsigned(0 downto 0);
signal color_MUX_uxn_c_l311_c8_2b3a_iftrue : uint12_t_4;
signal color_MUX_uxn_c_l311_c8_2b3a_iffalse : uint12_t_4;
signal color_MUX_uxn_c_l311_c8_2b3a_return_output : uint12_t_4;

-- CONST_SL_4[uxn_c_l313_c4_bcc4]
signal CONST_SL_4_uxn_c_l313_c4_bcc4_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_c_l313_c4_bcc4_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l314_c4_0d17]
signal BIN_OP_AND_uxn_c_l314_c4_0d17_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l314_c4_0d17_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l314_c4_0d17_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l315_c4_35e0]
signal BIN_OP_OR_uxn_c_l315_c4_35e0_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l315_c4_35e0_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l315_c4_35e0_return_output : unsigned(11 downto 0);

-- CONST_SL_4[uxn_c_l318_c4_cb2e]
signal CONST_SL_4_uxn_c_l318_c4_cb2e_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_c_l318_c4_cb2e_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l319_c4_886a]
signal BIN_OP_AND_uxn_c_l319_c4_886a_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l319_c4_886a_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l319_c4_886a_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l320_c4_7f4f]
signal BIN_OP_OR_uxn_c_l320_c4_7f4f_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l320_c4_7f4f_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l320_c4_7f4f_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l322_c12_1a03]
signal BIN_OP_EQ_uxn_c_l322_c12_1a03_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l322_c12_1a03_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l322_c12_1a03_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_c_l322_c8_587e]
signal color_MUX_uxn_c_l322_c8_587e_cond : unsigned(0 downto 0);
signal color_MUX_uxn_c_l322_c8_587e_iftrue : uint12_t_4;
signal color_MUX_uxn_c_l322_c8_587e_iffalse : uint12_t_4;
signal color_MUX_uxn_c_l322_c8_587e_return_output : uint12_t_4;

-- BIN_OP_AND[uxn_c_l324_c4_f89d]
signal BIN_OP_AND_uxn_c_l324_c4_f89d_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l324_c4_f89d_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l324_c4_f89d_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l325_c4_be3c]
signal BIN_OP_OR_uxn_c_l325_c4_be3c_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l325_c4_be3c_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l325_c4_be3c_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l328_c4_4076]
signal BIN_OP_AND_uxn_c_l328_c4_4076_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l328_c4_4076_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l328_c4_4076_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l329_c4_43c5]
signal BIN_OP_OR_uxn_c_l329_c4_43c5_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l329_c4_43c5_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l329_c4_43c5_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l331_c12_c0d6]
signal BIN_OP_EQ_uxn_c_l331_c12_c0d6_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l331_c12_c0d6_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l331_c12_c0d6_return_output : unsigned(0 downto 0);

-- color_2_MUX[uxn_c_l331_c8_0128]
signal color_2_MUX_uxn_c_l331_c8_0128_cond : unsigned(0 downto 0);
signal color_2_MUX_uxn_c_l331_c8_0128_iftrue : unsigned(11 downto 0);
signal color_2_MUX_uxn_c_l331_c8_0128_iffalse : unsigned(11 downto 0);
signal color_2_MUX_uxn_c_l331_c8_0128_return_output : unsigned(11 downto 0);

-- color_3_MUX[uxn_c_l331_c8_0128]
signal color_3_MUX_uxn_c_l331_c8_0128_cond : unsigned(0 downto 0);
signal color_3_MUX_uxn_c_l331_c8_0128_iftrue : unsigned(11 downto 0);
signal color_3_MUX_uxn_c_l331_c8_0128_iffalse : unsigned(11 downto 0);
signal color_3_MUX_uxn_c_l331_c8_0128_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l333_c4_a1d6]
signal BIN_OP_AND_uxn_c_l333_c4_a1d6_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l333_c4_a1d6_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l333_c4_a1d6_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l334_c4_6864]
signal BIN_OP_OR_uxn_c_l334_c4_6864_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l334_c4_6864_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l334_c4_6864_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l337_c4_b1a0]
signal BIN_OP_AND_uxn_c_l337_c4_b1a0_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l337_c4_b1a0_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l337_c4_b1a0_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l338_c4_5b1c]
signal BIN_OP_OR_uxn_c_l338_c4_5b1c_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l338_c4_5b1c_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l338_c4_5b1c_return_output : unsigned(11 downto 0);

-- VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d[uxn_c_l342_c20_3f70]
signal VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l342_c20_3f70_ref_toks_0 : uint12_t_4;
signal VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l342_c20_3f70_var_dim_0 : unsigned(1 downto 0);
signal VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l342_c20_3f70_return_output : unsigned(11 downto 0);

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
-- CONST_SR_4_uxn_c_l270_c30_03d0
CONST_SR_4_uxn_c_l270_c30_03d0 : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_c_l270_c30_03d0_x,
CONST_SR_4_uxn_c_l270_c30_03d0_return_output);

-- BIN_OP_EQ_uxn_c_l270_c30_7eb5
BIN_OP_EQ_uxn_c_l270_c30_7eb5 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l270_c30_7eb5_left,
BIN_OP_EQ_uxn_c_l270_c30_7eb5_right,
BIN_OP_EQ_uxn_c_l270_c30_7eb5_return_output);

-- MUX_uxn_c_l270_c30_3e67
MUX_uxn_c_l270_c30_3e67 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l270_c30_3e67_cond,
MUX_uxn_c_l270_c30_3e67_iftrue,
MUX_uxn_c_l270_c30_3e67_iffalse,
MUX_uxn_c_l270_c30_3e67_return_output);

-- BIN_OP_AND_uxn_c_l272_c6_73e8
BIN_OP_AND_uxn_c_l272_c6_73e8 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l272_c6_73e8_left,
BIN_OP_AND_uxn_c_l272_c6_73e8_right,
BIN_OP_AND_uxn_c_l272_c6_73e8_return_output);

-- color_MUX_uxn_c_l272_c2_d3f2
color_MUX_uxn_c_l272_c2_d3f2 : entity work.MUX_uint1_t_uint12_t_4_uint12_t_4_0CLK_de264c78 port map (
color_MUX_uxn_c_l272_c2_d3f2_cond,
color_MUX_uxn_c_l272_c2_d3f2_iftrue,
color_MUX_uxn_c_l272_c2_d3f2_iffalse,
color_MUX_uxn_c_l272_c2_d3f2_return_output);

-- CONST_SR_4_uxn_c_l275_c35_90ae
CONST_SR_4_uxn_c_l275_c35_90ae : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_c_l275_c35_90ae_x,
CONST_SR_4_uxn_c_l275_c35_90ae_return_output);

-- BIN_OP_EQ_uxn_c_l278_c7_1900
BIN_OP_EQ_uxn_c_l278_c7_1900 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l278_c7_1900_left,
BIN_OP_EQ_uxn_c_l278_c7_1900_right,
BIN_OP_EQ_uxn_c_l278_c7_1900_return_output);

-- color_MUX_uxn_c_l278_c3_58c0
color_MUX_uxn_c_l278_c3_58c0 : entity work.MUX_uint1_t_uint12_t_4_uint12_t_4_0CLK_de264c78 port map (
color_MUX_uxn_c_l278_c3_58c0_cond,
color_MUX_uxn_c_l278_c3_58c0_iftrue,
color_MUX_uxn_c_l278_c3_58c0_iffalse,
color_MUX_uxn_c_l278_c3_58c0_return_output);

-- CONST_SL_8_uxn_c_l280_c4_31fd
CONST_SL_8_uxn_c_l280_c4_31fd : entity work.CONST_SL_8_uint12_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l280_c4_31fd_x,
CONST_SL_8_uxn_c_l280_c4_31fd_return_output);

-- BIN_OP_AND_uxn_c_l281_c4_b736
BIN_OP_AND_uxn_c_l281_c4_b736 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l281_c4_b736_left,
BIN_OP_AND_uxn_c_l281_c4_b736_right,
BIN_OP_AND_uxn_c_l281_c4_b736_return_output);

-- BIN_OP_OR_uxn_c_l282_c4_36d9
BIN_OP_OR_uxn_c_l282_c4_36d9 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l282_c4_36d9_left,
BIN_OP_OR_uxn_c_l282_c4_36d9_right,
BIN_OP_OR_uxn_c_l282_c4_36d9_return_output);

-- CONST_SL_8_uxn_c_l285_c4_9bf4
CONST_SL_8_uxn_c_l285_c4_9bf4 : entity work.CONST_SL_8_uint12_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l285_c4_9bf4_x,
CONST_SL_8_uxn_c_l285_c4_9bf4_return_output);

-- BIN_OP_AND_uxn_c_l286_c4_1766
BIN_OP_AND_uxn_c_l286_c4_1766 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l286_c4_1766_left,
BIN_OP_AND_uxn_c_l286_c4_1766_right,
BIN_OP_AND_uxn_c_l286_c4_1766_return_output);

-- BIN_OP_OR_uxn_c_l287_c4_34bb
BIN_OP_OR_uxn_c_l287_c4_34bb : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l287_c4_34bb_left,
BIN_OP_OR_uxn_c_l287_c4_34bb_right,
BIN_OP_OR_uxn_c_l287_c4_34bb_return_output);

-- BIN_OP_EQ_uxn_c_l289_c12_7f38
BIN_OP_EQ_uxn_c_l289_c12_7f38 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l289_c12_7f38_left,
BIN_OP_EQ_uxn_c_l289_c12_7f38_right,
BIN_OP_EQ_uxn_c_l289_c12_7f38_return_output);

-- color_MUX_uxn_c_l289_c8_3337
color_MUX_uxn_c_l289_c8_3337 : entity work.MUX_uint1_t_uint12_t_4_uint12_t_4_0CLK_de264c78 port map (
color_MUX_uxn_c_l289_c8_3337_cond,
color_MUX_uxn_c_l289_c8_3337_iftrue,
color_MUX_uxn_c_l289_c8_3337_iffalse,
color_MUX_uxn_c_l289_c8_3337_return_output);

-- CONST_SL_8_uxn_c_l291_c4_7bac
CONST_SL_8_uxn_c_l291_c4_7bac : entity work.CONST_SL_8_uint12_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l291_c4_7bac_x,
CONST_SL_8_uxn_c_l291_c4_7bac_return_output);

-- BIN_OP_AND_uxn_c_l292_c4_6094
BIN_OP_AND_uxn_c_l292_c4_6094 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l292_c4_6094_left,
BIN_OP_AND_uxn_c_l292_c4_6094_right,
BIN_OP_AND_uxn_c_l292_c4_6094_return_output);

-- BIN_OP_OR_uxn_c_l293_c4_4229
BIN_OP_OR_uxn_c_l293_c4_4229 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l293_c4_4229_left,
BIN_OP_OR_uxn_c_l293_c4_4229_right,
BIN_OP_OR_uxn_c_l293_c4_4229_return_output);

-- CONST_SL_8_uxn_c_l296_c4_63a8
CONST_SL_8_uxn_c_l296_c4_63a8 : entity work.CONST_SL_8_uint12_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l296_c4_63a8_x,
CONST_SL_8_uxn_c_l296_c4_63a8_return_output);

-- BIN_OP_AND_uxn_c_l297_c4_4cd5
BIN_OP_AND_uxn_c_l297_c4_4cd5 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l297_c4_4cd5_left,
BIN_OP_AND_uxn_c_l297_c4_4cd5_right,
BIN_OP_AND_uxn_c_l297_c4_4cd5_return_output);

-- BIN_OP_OR_uxn_c_l298_c4_c925
BIN_OP_OR_uxn_c_l298_c4_c925 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l298_c4_c925_left,
BIN_OP_OR_uxn_c_l298_c4_c925_right,
BIN_OP_OR_uxn_c_l298_c4_c925_return_output);

-- BIN_OP_EQ_uxn_c_l300_c12_495a
BIN_OP_EQ_uxn_c_l300_c12_495a : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l300_c12_495a_left,
BIN_OP_EQ_uxn_c_l300_c12_495a_right,
BIN_OP_EQ_uxn_c_l300_c12_495a_return_output);

-- color_MUX_uxn_c_l300_c8_a8d4
color_MUX_uxn_c_l300_c8_a8d4 : entity work.MUX_uint1_t_uint12_t_4_uint12_t_4_0CLK_de264c78 port map (
color_MUX_uxn_c_l300_c8_a8d4_cond,
color_MUX_uxn_c_l300_c8_a8d4_iftrue,
color_MUX_uxn_c_l300_c8_a8d4_iffalse,
color_MUX_uxn_c_l300_c8_a8d4_return_output);

-- CONST_SL_4_uxn_c_l302_c4_f911
CONST_SL_4_uxn_c_l302_c4_f911 : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_c_l302_c4_f911_x,
CONST_SL_4_uxn_c_l302_c4_f911_return_output);

-- BIN_OP_AND_uxn_c_l303_c4_297a
BIN_OP_AND_uxn_c_l303_c4_297a : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l303_c4_297a_left,
BIN_OP_AND_uxn_c_l303_c4_297a_right,
BIN_OP_AND_uxn_c_l303_c4_297a_return_output);

-- BIN_OP_OR_uxn_c_l304_c4_2464
BIN_OP_OR_uxn_c_l304_c4_2464 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l304_c4_2464_left,
BIN_OP_OR_uxn_c_l304_c4_2464_right,
BIN_OP_OR_uxn_c_l304_c4_2464_return_output);

-- CONST_SL_4_uxn_c_l307_c4_0535
CONST_SL_4_uxn_c_l307_c4_0535 : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_c_l307_c4_0535_x,
CONST_SL_4_uxn_c_l307_c4_0535_return_output);

-- BIN_OP_AND_uxn_c_l308_c4_edbf
BIN_OP_AND_uxn_c_l308_c4_edbf : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l308_c4_edbf_left,
BIN_OP_AND_uxn_c_l308_c4_edbf_right,
BIN_OP_AND_uxn_c_l308_c4_edbf_return_output);

-- BIN_OP_OR_uxn_c_l309_c4_7f1c
BIN_OP_OR_uxn_c_l309_c4_7f1c : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l309_c4_7f1c_left,
BIN_OP_OR_uxn_c_l309_c4_7f1c_right,
BIN_OP_OR_uxn_c_l309_c4_7f1c_return_output);

-- BIN_OP_EQ_uxn_c_l311_c12_d6c4
BIN_OP_EQ_uxn_c_l311_c12_d6c4 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l311_c12_d6c4_left,
BIN_OP_EQ_uxn_c_l311_c12_d6c4_right,
BIN_OP_EQ_uxn_c_l311_c12_d6c4_return_output);

-- color_MUX_uxn_c_l311_c8_2b3a
color_MUX_uxn_c_l311_c8_2b3a : entity work.MUX_uint1_t_uint12_t_4_uint12_t_4_0CLK_de264c78 port map (
color_MUX_uxn_c_l311_c8_2b3a_cond,
color_MUX_uxn_c_l311_c8_2b3a_iftrue,
color_MUX_uxn_c_l311_c8_2b3a_iffalse,
color_MUX_uxn_c_l311_c8_2b3a_return_output);

-- CONST_SL_4_uxn_c_l313_c4_bcc4
CONST_SL_4_uxn_c_l313_c4_bcc4 : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_c_l313_c4_bcc4_x,
CONST_SL_4_uxn_c_l313_c4_bcc4_return_output);

-- BIN_OP_AND_uxn_c_l314_c4_0d17
BIN_OP_AND_uxn_c_l314_c4_0d17 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l314_c4_0d17_left,
BIN_OP_AND_uxn_c_l314_c4_0d17_right,
BIN_OP_AND_uxn_c_l314_c4_0d17_return_output);

-- BIN_OP_OR_uxn_c_l315_c4_35e0
BIN_OP_OR_uxn_c_l315_c4_35e0 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l315_c4_35e0_left,
BIN_OP_OR_uxn_c_l315_c4_35e0_right,
BIN_OP_OR_uxn_c_l315_c4_35e0_return_output);

-- CONST_SL_4_uxn_c_l318_c4_cb2e
CONST_SL_4_uxn_c_l318_c4_cb2e : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_c_l318_c4_cb2e_x,
CONST_SL_4_uxn_c_l318_c4_cb2e_return_output);

-- BIN_OP_AND_uxn_c_l319_c4_886a
BIN_OP_AND_uxn_c_l319_c4_886a : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l319_c4_886a_left,
BIN_OP_AND_uxn_c_l319_c4_886a_right,
BIN_OP_AND_uxn_c_l319_c4_886a_return_output);

-- BIN_OP_OR_uxn_c_l320_c4_7f4f
BIN_OP_OR_uxn_c_l320_c4_7f4f : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l320_c4_7f4f_left,
BIN_OP_OR_uxn_c_l320_c4_7f4f_right,
BIN_OP_OR_uxn_c_l320_c4_7f4f_return_output);

-- BIN_OP_EQ_uxn_c_l322_c12_1a03
BIN_OP_EQ_uxn_c_l322_c12_1a03 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l322_c12_1a03_left,
BIN_OP_EQ_uxn_c_l322_c12_1a03_right,
BIN_OP_EQ_uxn_c_l322_c12_1a03_return_output);

-- color_MUX_uxn_c_l322_c8_587e
color_MUX_uxn_c_l322_c8_587e : entity work.MUX_uint1_t_uint12_t_4_uint12_t_4_0CLK_de264c78 port map (
color_MUX_uxn_c_l322_c8_587e_cond,
color_MUX_uxn_c_l322_c8_587e_iftrue,
color_MUX_uxn_c_l322_c8_587e_iffalse,
color_MUX_uxn_c_l322_c8_587e_return_output);

-- BIN_OP_AND_uxn_c_l324_c4_f89d
BIN_OP_AND_uxn_c_l324_c4_f89d : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l324_c4_f89d_left,
BIN_OP_AND_uxn_c_l324_c4_f89d_right,
BIN_OP_AND_uxn_c_l324_c4_f89d_return_output);

-- BIN_OP_OR_uxn_c_l325_c4_be3c
BIN_OP_OR_uxn_c_l325_c4_be3c : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l325_c4_be3c_left,
BIN_OP_OR_uxn_c_l325_c4_be3c_right,
BIN_OP_OR_uxn_c_l325_c4_be3c_return_output);

-- BIN_OP_AND_uxn_c_l328_c4_4076
BIN_OP_AND_uxn_c_l328_c4_4076 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l328_c4_4076_left,
BIN_OP_AND_uxn_c_l328_c4_4076_right,
BIN_OP_AND_uxn_c_l328_c4_4076_return_output);

-- BIN_OP_OR_uxn_c_l329_c4_43c5
BIN_OP_OR_uxn_c_l329_c4_43c5 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l329_c4_43c5_left,
BIN_OP_OR_uxn_c_l329_c4_43c5_right,
BIN_OP_OR_uxn_c_l329_c4_43c5_return_output);

-- BIN_OP_EQ_uxn_c_l331_c12_c0d6
BIN_OP_EQ_uxn_c_l331_c12_c0d6 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l331_c12_c0d6_left,
BIN_OP_EQ_uxn_c_l331_c12_c0d6_right,
BIN_OP_EQ_uxn_c_l331_c12_c0d6_return_output);

-- color_2_MUX_uxn_c_l331_c8_0128
color_2_MUX_uxn_c_l331_c8_0128 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color_2_MUX_uxn_c_l331_c8_0128_cond,
color_2_MUX_uxn_c_l331_c8_0128_iftrue,
color_2_MUX_uxn_c_l331_c8_0128_iffalse,
color_2_MUX_uxn_c_l331_c8_0128_return_output);

-- color_3_MUX_uxn_c_l331_c8_0128
color_3_MUX_uxn_c_l331_c8_0128 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color_3_MUX_uxn_c_l331_c8_0128_cond,
color_3_MUX_uxn_c_l331_c8_0128_iftrue,
color_3_MUX_uxn_c_l331_c8_0128_iffalse,
color_3_MUX_uxn_c_l331_c8_0128_return_output);

-- BIN_OP_AND_uxn_c_l333_c4_a1d6
BIN_OP_AND_uxn_c_l333_c4_a1d6 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l333_c4_a1d6_left,
BIN_OP_AND_uxn_c_l333_c4_a1d6_right,
BIN_OP_AND_uxn_c_l333_c4_a1d6_return_output);

-- BIN_OP_OR_uxn_c_l334_c4_6864
BIN_OP_OR_uxn_c_l334_c4_6864 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l334_c4_6864_left,
BIN_OP_OR_uxn_c_l334_c4_6864_right,
BIN_OP_OR_uxn_c_l334_c4_6864_return_output);

-- BIN_OP_AND_uxn_c_l337_c4_b1a0
BIN_OP_AND_uxn_c_l337_c4_b1a0 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l337_c4_b1a0_left,
BIN_OP_AND_uxn_c_l337_c4_b1a0_right,
BIN_OP_AND_uxn_c_l337_c4_b1a0_return_output);

-- BIN_OP_OR_uxn_c_l338_c4_5b1c
BIN_OP_OR_uxn_c_l338_c4_5b1c : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l338_c4_5b1c_left,
BIN_OP_OR_uxn_c_l338_c4_5b1c_right,
BIN_OP_OR_uxn_c_l338_c4_5b1c_return_output);

-- VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l342_c20_3f70
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l342_c20_3f70 : entity work.VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_0CLK_9e40ec46 port map (
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l342_c20_3f70_ref_toks_0,
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l342_c20_3f70_var_dim_0,
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l342_c20_3f70_return_output);



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
 CONST_SR_4_uxn_c_l270_c30_03d0_return_output,
 BIN_OP_EQ_uxn_c_l270_c30_7eb5_return_output,
 MUX_uxn_c_l270_c30_3e67_return_output,
 BIN_OP_AND_uxn_c_l272_c6_73e8_return_output,
 color_MUX_uxn_c_l272_c2_d3f2_return_output,
 CONST_SR_4_uxn_c_l275_c35_90ae_return_output,
 BIN_OP_EQ_uxn_c_l278_c7_1900_return_output,
 color_MUX_uxn_c_l278_c3_58c0_return_output,
 CONST_SL_8_uxn_c_l280_c4_31fd_return_output,
 BIN_OP_AND_uxn_c_l281_c4_b736_return_output,
 BIN_OP_OR_uxn_c_l282_c4_36d9_return_output,
 CONST_SL_8_uxn_c_l285_c4_9bf4_return_output,
 BIN_OP_AND_uxn_c_l286_c4_1766_return_output,
 BIN_OP_OR_uxn_c_l287_c4_34bb_return_output,
 BIN_OP_EQ_uxn_c_l289_c12_7f38_return_output,
 color_MUX_uxn_c_l289_c8_3337_return_output,
 CONST_SL_8_uxn_c_l291_c4_7bac_return_output,
 BIN_OP_AND_uxn_c_l292_c4_6094_return_output,
 BIN_OP_OR_uxn_c_l293_c4_4229_return_output,
 CONST_SL_8_uxn_c_l296_c4_63a8_return_output,
 BIN_OP_AND_uxn_c_l297_c4_4cd5_return_output,
 BIN_OP_OR_uxn_c_l298_c4_c925_return_output,
 BIN_OP_EQ_uxn_c_l300_c12_495a_return_output,
 color_MUX_uxn_c_l300_c8_a8d4_return_output,
 CONST_SL_4_uxn_c_l302_c4_f911_return_output,
 BIN_OP_AND_uxn_c_l303_c4_297a_return_output,
 BIN_OP_OR_uxn_c_l304_c4_2464_return_output,
 CONST_SL_4_uxn_c_l307_c4_0535_return_output,
 BIN_OP_AND_uxn_c_l308_c4_edbf_return_output,
 BIN_OP_OR_uxn_c_l309_c4_7f1c_return_output,
 BIN_OP_EQ_uxn_c_l311_c12_d6c4_return_output,
 color_MUX_uxn_c_l311_c8_2b3a_return_output,
 CONST_SL_4_uxn_c_l313_c4_bcc4_return_output,
 BIN_OP_AND_uxn_c_l314_c4_0d17_return_output,
 BIN_OP_OR_uxn_c_l315_c4_35e0_return_output,
 CONST_SL_4_uxn_c_l318_c4_cb2e_return_output,
 BIN_OP_AND_uxn_c_l319_c4_886a_return_output,
 BIN_OP_OR_uxn_c_l320_c4_7f4f_return_output,
 BIN_OP_EQ_uxn_c_l322_c12_1a03_return_output,
 color_MUX_uxn_c_l322_c8_587e_return_output,
 BIN_OP_AND_uxn_c_l324_c4_f89d_return_output,
 BIN_OP_OR_uxn_c_l325_c4_be3c_return_output,
 BIN_OP_AND_uxn_c_l328_c4_4076_return_output,
 BIN_OP_OR_uxn_c_l329_c4_43c5_return_output,
 BIN_OP_EQ_uxn_c_l331_c12_c0d6_return_output,
 color_2_MUX_uxn_c_l331_c8_0128_return_output,
 color_3_MUX_uxn_c_l331_c8_0128_return_output,
 BIN_OP_AND_uxn_c_l333_c4_a1d6_return_output,
 BIN_OP_OR_uxn_c_l334_c4_6864_return_output,
 BIN_OP_AND_uxn_c_l337_c4_b1a0_return_output,
 BIN_OP_OR_uxn_c_l338_c4_5b1c_return_output,
 VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l342_c20_3f70_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_device_ram_address : unsigned(7 downto 0);
 variable VAR_device_ram_value : unsigned(7 downto 0);
 variable VAR_is_device_ram_write : unsigned(0 downto 0);
 variable VAR_gpu_step_color : unsigned(1 downto 0);
 variable VAR_is_palette_range : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l270_c30_3e67_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_4_uxn_c_l270_c30_03d0_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l270_c30_7eb5_left : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_c_l270_c30_03d0_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l270_c30_7eb5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l270_c30_7eb5_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l270_c30_3e67_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l270_c30_3e67_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l270_c30_3e67_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l272_c6_73e8_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l272_c6_73e8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l272_c6_73e8_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_c_l272_c2_d3f2_iftrue : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l278_c3_58c0_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l272_c2_d3f2_iffalse : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l272_c2_d3f2_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l272_c2_d3f2_cond : unsigned(0 downto 0);
 variable VAR_tmp12 : unsigned(11 downto 0);
 variable VAR_addr_low : unsigned(3 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_c_l274_c22_1904_return_output : unsigned(3 downto 0);
 variable VAR_color_cmp_0 : unsigned(3 downto 0);
 variable VAR_color_cmp_0_uxn_c_l275_c11_99ea_0 : unsigned(3 downto 0);
 variable VAR_CONST_SR_4_uxn_c_l275_c35_90ae_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_c_l275_c35_90ae_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_c_l275_c25_6015_return_output : unsigned(3 downto 0);
 variable VAR_color_cmp_1 : unsigned(3 downto 0);
 variable VAR_color_cmp_1_uxn_c_l276_c11_df88_0 : unsigned(3 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_c_l276_c25_66aa_return_output : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l278_c7_1900_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l278_c7_1900_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l278_c7_1900_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_c_l278_c3_58c0_iftrue : uint12_t_4;
 variable VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l278_c3_58c0_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l278_c3_58c0_iffalse : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l289_c8_3337_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l278_c3_58c0_cond : unsigned(0 downto 0);
 variable VAR_tmp12_uxn_c_l279_c4_5634 : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l280_c4_31fd_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l280_c4_31fd_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l281_c4_b736_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l281_c4_b736_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l281_c4_b736_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l282_c4_36d9_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l282_c4_36d9_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l282_c4_36d9_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_uxn_c_l284_c4_4428 : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l285_c4_9bf4_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l285_c4_9bf4_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l286_c4_1766_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l286_c4_1766_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l286_c4_1766_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l287_c4_34bb_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l287_c4_34bb_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l287_c4_34bb_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l289_c12_7f38_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l289_c12_7f38_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l289_c12_7f38_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_c_l289_c8_3337_iftrue : uint12_t_4;
 variable VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l289_c8_3337_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l289_c8_3337_iffalse : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l300_c8_a8d4_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l289_c8_3337_cond : unsigned(0 downto 0);
 variable VAR_tmp12_uxn_c_l290_c4_1cdf : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l291_c4_7bac_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l291_c4_7bac_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l292_c4_6094_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l292_c4_6094_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l292_c4_6094_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l293_c4_4229_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l293_c4_4229_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l293_c4_4229_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_uxn_c_l295_c4_1490 : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l296_c4_63a8_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l296_c4_63a8_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l297_c4_4cd5_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l297_c4_4cd5_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l297_c4_4cd5_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l298_c4_c925_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l298_c4_c925_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l298_c4_c925_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l300_c12_495a_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l300_c12_495a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l300_c12_495a_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_c_l300_c8_a8d4_iftrue : uint12_t_4;
 variable VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l300_c8_a8d4_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l300_c8_a8d4_iffalse : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l311_c8_2b3a_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l300_c8_a8d4_cond : unsigned(0 downto 0);
 variable VAR_tmp12_uxn_c_l301_c4_eafc : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l302_c4_f911_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l302_c4_f911_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l303_c4_297a_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l303_c4_297a_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l303_c4_297a_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l304_c4_2464_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l304_c4_2464_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l304_c4_2464_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_uxn_c_l306_c4_043e : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l307_c4_0535_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l307_c4_0535_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l308_c4_edbf_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l308_c4_edbf_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l308_c4_edbf_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l309_c4_7f1c_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l309_c4_7f1c_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l309_c4_7f1c_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l311_c12_d6c4_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l311_c12_d6c4_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l311_c12_d6c4_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_c_l311_c8_2b3a_iftrue : uint12_t_4;
 variable VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l311_c8_2b3a_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l311_c8_2b3a_iffalse : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l322_c8_587e_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l311_c8_2b3a_cond : unsigned(0 downto 0);
 variable VAR_tmp12_uxn_c_l312_c4_7502 : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l313_c4_bcc4_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l313_c4_bcc4_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l314_c4_0d17_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l314_c4_0d17_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l314_c4_0d17_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l315_c4_35e0_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l315_c4_35e0_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l315_c4_35e0_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_uxn_c_l317_c4_adfb : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l318_c4_cb2e_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l318_c4_cb2e_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l319_c4_886a_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l319_c4_886a_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l319_c4_886a_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l320_c4_7f4f_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l320_c4_7f4f_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l320_c4_7f4f_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l322_c12_1a03_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l322_c12_1a03_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l322_c12_1a03_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_c_l322_c8_587e_iftrue : uint12_t_4;
 variable VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l322_c8_587e_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l322_c8_587e_iffalse : uint12_t_4;
 variable VAR_color_FALSE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l322_c8_587e_return_output : uint12_t_4;
 variable VAR_color_MUX_uxn_c_l322_c8_587e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l324_c4_f89d_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l324_c4_f89d_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l324_c4_f89d_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l325_c4_be3c_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l325_c4_be3c_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l325_c4_be3c_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l328_c4_4076_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l328_c4_4076_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l328_c4_4076_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l329_c4_43c5_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l329_c4_43c5_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l329_c4_43c5_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l331_c12_c0d6_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l331_c12_c0d6_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l331_c12_c0d6_return_output : unsigned(0 downto 0);
 variable VAR_color_2_MUX_uxn_c_l331_c8_0128_iftrue : unsigned(11 downto 0);
 variable VAR_color_2_MUX_uxn_c_l331_c8_0128_iffalse : unsigned(11 downto 0);
 variable VAR_color_2_MUX_uxn_c_l331_c8_0128_return_output : unsigned(11 downto 0);
 variable VAR_color_2_MUX_uxn_c_l331_c8_0128_cond : unsigned(0 downto 0);
 variable VAR_color_3_MUX_uxn_c_l331_c8_0128_iftrue : unsigned(11 downto 0);
 variable VAR_color_3_MUX_uxn_c_l331_c8_0128_iffalse : unsigned(11 downto 0);
 variable VAR_color_3_MUX_uxn_c_l331_c8_0128_return_output : unsigned(11 downto 0);
 variable VAR_color_3_MUX_uxn_c_l331_c8_0128_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l333_c4_a1d6_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l333_c4_a1d6_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l333_c4_a1d6_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l334_c4_6864_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l334_c4_6864_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l334_c4_6864_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l337_c4_b1a0_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l337_c4_b1a0_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l337_c4_b1a0_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l338_c4_5b1c_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l338_c4_5b1c_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l338_c4_5b1c_return_output : unsigned(11 downto 0);
 variable VAR_result : unsigned(15 downto 0);
 variable VAR_result_uxn_c_l342_c11_17bd_0 : unsigned(15 downto 0);
 variable VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l342_c20_3f70_var_dim_0 : unsigned(1 downto 0);
 variable VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l342_c20_3f70_return_output : unsigned(11 downto 0);
 variable VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l342_c20_3f70_ref_toks_0 : uint12_t_4;
 variable VAR_CONST_REF_RD_uint12_t_uint12_t_4_0_d41d_uxn_c_l303_l324_l281_DUPLICATE_910a_return_output : unsigned(11 downto 0);
 variable VAR_CONST_REF_RD_uint12_t_uint12_t_4_1_d41d_uxn_c_l308_l328_l286_DUPLICATE_667a_return_output : unsigned(11 downto 0);
 variable VAR_CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_uxn_c_l333_l331_l314_l292_DUPLICATE_651e_return_output : unsigned(11 downto 0);
 variable VAR_CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_uxn_c_l297_l331_l319_l337_DUPLICATE_01e9_return_output : unsigned(11 downto 0);
 variable VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l332_l323_DUPLICATE_d928_return_output : unsigned(11 downto 0);
 variable VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l327_l336_DUPLICATE_b7e0_return_output : unsigned(11 downto 0);
 -- State registers comb logic variables
variable REG_VAR_color : uint12_t_4;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_color := color;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_c_l278_c7_1900_right := to_unsigned(8, 4);
     VAR_MUX_uxn_c_l270_c30_3e67_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_c_l297_c4_4cd5_right := to_unsigned(255, 12);
     VAR_BIN_OP_AND_uxn_c_l324_c4_f89d_right := to_unsigned(4080, 12);
     VAR_BIN_OP_EQ_uxn_c_l270_c30_7eb5_right := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_c_l337_c4_b1a0_right := to_unsigned(4080, 12);
     VAR_BIN_OP_AND_uxn_c_l303_c4_297a_right := to_unsigned(3855, 12);
     VAR_BIN_OP_EQ_uxn_c_l331_c12_c0d6_right := to_unsigned(13, 4);
     VAR_BIN_OP_AND_uxn_c_l308_c4_edbf_right := to_unsigned(3855, 12);
     VAR_BIN_OP_AND_uxn_c_l319_c4_886a_right := to_unsigned(3855, 12);
     VAR_BIN_OP_AND_uxn_c_l328_c4_4076_right := to_unsigned(4080, 12);
     VAR_BIN_OP_AND_uxn_c_l281_c4_b736_right := to_unsigned(255, 12);
     VAR_BIN_OP_EQ_uxn_c_l311_c12_d6c4_right := to_unsigned(11, 4);
     VAR_BIN_OP_EQ_uxn_c_l322_c12_1a03_right := to_unsigned(12, 4);
     VAR_MUX_uxn_c_l270_c30_3e67_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_c_l292_c4_6094_right := to_unsigned(255, 12);
     VAR_BIN_OP_EQ_uxn_c_l289_c12_7f38_right := to_unsigned(9, 4);
     VAR_BIN_OP_AND_uxn_c_l333_c4_a1d6_right := to_unsigned(4080, 12);
     VAR_BIN_OP_AND_uxn_c_l286_c4_1766_right := to_unsigned(255, 12);
     VAR_BIN_OP_AND_uxn_c_l314_c4_0d17_right := to_unsigned(3855, 12);
     VAR_BIN_OP_EQ_uxn_c_l300_c12_495a_right := to_unsigned(10, 4);

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
     VAR_color_MUX_uxn_c_l272_c2_d3f2_iffalse := color;
     VAR_CONST_SR_4_uxn_c_l270_c30_03d0_x := VAR_device_ram_address;
     VAR_CONST_SR_4_uxn_c_l275_c35_90ae_x := VAR_device_ram_value;
     VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l342_c20_3f70_var_dim_0 := VAR_gpu_step_color;
     VAR_BIN_OP_AND_uxn_c_l272_c6_73e8_left := VAR_is_device_ram_write;
     -- CONST_REF_RD_uint12_t_uint12_t_4_0_d41d_uxn_c_l303_l324_l281_DUPLICATE_910a LATENCY=0
     VAR_CONST_REF_RD_uint12_t_uint12_t_4_0_d41d_uxn_c_l303_l324_l281_DUPLICATE_910a_return_output := color(0);

     -- CAST_TO_uint4_t[uxn_c_l276_c25_66aa] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_c_l276_c25_66aa_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_device_ram_value);

     -- CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_uxn_c_l297_l331_l319_l337_DUPLICATE_01e9 LATENCY=0
     VAR_CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_uxn_c_l297_l331_l319_l337_DUPLICATE_01e9_return_output := color(3);

     -- CONST_SR_4[uxn_c_l270_c30_03d0] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_c_l270_c30_03d0_x <= VAR_CONST_SR_4_uxn_c_l270_c30_03d0_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_c_l270_c30_03d0_return_output := CONST_SR_4_uxn_c_l270_c30_03d0_return_output;

     -- CAST_TO_uint4_t[uxn_c_l274_c22_1904] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_c_l274_c22_1904_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_device_ram_address);

     -- CONST_REF_RD_uint12_t_uint12_t_4_1_d41d_uxn_c_l308_l328_l286_DUPLICATE_667a LATENCY=0
     VAR_CONST_REF_RD_uint12_t_uint12_t_4_1_d41d_uxn_c_l308_l328_l286_DUPLICATE_667a_return_output := color(1);

     -- CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_uxn_c_l333_l331_l314_l292_DUPLICATE_651e LATENCY=0
     VAR_CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_uxn_c_l333_l331_l314_l292_DUPLICATE_651e_return_output := color(2);

     -- CONST_SR_4[uxn_c_l275_c35_90ae] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_c_l275_c35_90ae_x <= VAR_CONST_SR_4_uxn_c_l275_c35_90ae_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_c_l275_c35_90ae_return_output := CONST_SR_4_uxn_c_l275_c35_90ae_return_output;

     -- Submodule level 1
     VAR_BIN_OP_EQ_uxn_c_l278_c7_1900_left := VAR_CAST_TO_uint4_t_uxn_c_l274_c22_1904_return_output;
     VAR_BIN_OP_EQ_uxn_c_l289_c12_7f38_left := VAR_CAST_TO_uint4_t_uxn_c_l274_c22_1904_return_output;
     VAR_BIN_OP_EQ_uxn_c_l300_c12_495a_left := VAR_CAST_TO_uint4_t_uxn_c_l274_c22_1904_return_output;
     VAR_BIN_OP_EQ_uxn_c_l311_c12_d6c4_left := VAR_CAST_TO_uint4_t_uxn_c_l274_c22_1904_return_output;
     VAR_BIN_OP_EQ_uxn_c_l322_c12_1a03_left := VAR_CAST_TO_uint4_t_uxn_c_l274_c22_1904_return_output;
     VAR_BIN_OP_EQ_uxn_c_l331_c12_c0d6_left := VAR_CAST_TO_uint4_t_uxn_c_l274_c22_1904_return_output;
     VAR_color_cmp_1_uxn_c_l276_c11_df88_0 := VAR_CAST_TO_uint4_t_uxn_c_l276_c25_66aa_return_output;
     VAR_BIN_OP_AND_uxn_c_l281_c4_b736_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_0_d41d_uxn_c_l303_l324_l281_DUPLICATE_910a_return_output;
     VAR_BIN_OP_AND_uxn_c_l303_c4_297a_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_0_d41d_uxn_c_l303_l324_l281_DUPLICATE_910a_return_output;
     VAR_BIN_OP_AND_uxn_c_l324_c4_f89d_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_0_d41d_uxn_c_l303_l324_l281_DUPLICATE_910a_return_output;
     VAR_BIN_OP_AND_uxn_c_l286_c4_1766_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_1_d41d_uxn_c_l308_l328_l286_DUPLICATE_667a_return_output;
     VAR_BIN_OP_AND_uxn_c_l308_c4_edbf_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_1_d41d_uxn_c_l308_l328_l286_DUPLICATE_667a_return_output;
     VAR_BIN_OP_AND_uxn_c_l328_c4_4076_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_1_d41d_uxn_c_l308_l328_l286_DUPLICATE_667a_return_output;
     VAR_BIN_OP_AND_uxn_c_l292_c4_6094_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_uxn_c_l333_l331_l314_l292_DUPLICATE_651e_return_output;
     VAR_BIN_OP_AND_uxn_c_l314_c4_0d17_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_uxn_c_l333_l331_l314_l292_DUPLICATE_651e_return_output;
     VAR_BIN_OP_AND_uxn_c_l333_c4_a1d6_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_uxn_c_l333_l331_l314_l292_DUPLICATE_651e_return_output;
     VAR_color_2_MUX_uxn_c_l331_c8_0128_iffalse := VAR_CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_uxn_c_l333_l331_l314_l292_DUPLICATE_651e_return_output;
     VAR_BIN_OP_AND_uxn_c_l297_c4_4cd5_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_uxn_c_l297_l331_l319_l337_DUPLICATE_01e9_return_output;
     VAR_BIN_OP_AND_uxn_c_l319_c4_886a_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_uxn_c_l297_l331_l319_l337_DUPLICATE_01e9_return_output;
     VAR_BIN_OP_AND_uxn_c_l337_c4_b1a0_left := VAR_CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_uxn_c_l297_l331_l319_l337_DUPLICATE_01e9_return_output;
     VAR_color_3_MUX_uxn_c_l331_c8_0128_iffalse := VAR_CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_uxn_c_l297_l331_l319_l337_DUPLICATE_01e9_return_output;
     VAR_BIN_OP_EQ_uxn_c_l270_c30_7eb5_left := VAR_CONST_SR_4_uxn_c_l270_c30_03d0_return_output;
     VAR_tmp12_uxn_c_l284_c4_4428 := resize(VAR_color_cmp_1_uxn_c_l276_c11_df88_0, 12);
     VAR_tmp12_uxn_c_l295_c4_1490 := resize(VAR_color_cmp_1_uxn_c_l276_c11_df88_0, 12);
     VAR_tmp12_uxn_c_l306_c4_043e := resize(VAR_color_cmp_1_uxn_c_l276_c11_df88_0, 12);
     VAR_tmp12_uxn_c_l317_c4_adfb := resize(VAR_color_cmp_1_uxn_c_l276_c11_df88_0, 12);
     VAR_CONST_SL_8_uxn_c_l285_c4_9bf4_x := VAR_tmp12_uxn_c_l284_c4_4428;
     VAR_CONST_SL_8_uxn_c_l296_c4_63a8_x := VAR_tmp12_uxn_c_l295_c4_1490;
     VAR_CONST_SL_4_uxn_c_l307_c4_0535_x := VAR_tmp12_uxn_c_l306_c4_043e;
     VAR_CONST_SL_4_uxn_c_l318_c4_cb2e_x := VAR_tmp12_uxn_c_l317_c4_adfb;
     -- BIN_OP_AND[uxn_c_l286_c4_1766] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l286_c4_1766_left <= VAR_BIN_OP_AND_uxn_c_l286_c4_1766_left;
     BIN_OP_AND_uxn_c_l286_c4_1766_right <= VAR_BIN_OP_AND_uxn_c_l286_c4_1766_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l286_c4_1766_return_output := BIN_OP_AND_uxn_c_l286_c4_1766_return_output;

     -- BIN_OP_EQ[uxn_c_l300_c12_495a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l300_c12_495a_left <= VAR_BIN_OP_EQ_uxn_c_l300_c12_495a_left;
     BIN_OP_EQ_uxn_c_l300_c12_495a_right <= VAR_BIN_OP_EQ_uxn_c_l300_c12_495a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l300_c12_495a_return_output := BIN_OP_EQ_uxn_c_l300_c12_495a_return_output;

     -- BIN_OP_EQ[uxn_c_l289_c12_7f38] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l289_c12_7f38_left <= VAR_BIN_OP_EQ_uxn_c_l289_c12_7f38_left;
     BIN_OP_EQ_uxn_c_l289_c12_7f38_right <= VAR_BIN_OP_EQ_uxn_c_l289_c12_7f38_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l289_c12_7f38_return_output := BIN_OP_EQ_uxn_c_l289_c12_7f38_return_output;

     -- BIN_OP_EQ[uxn_c_l278_c7_1900] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l278_c7_1900_left <= VAR_BIN_OP_EQ_uxn_c_l278_c7_1900_left;
     BIN_OP_EQ_uxn_c_l278_c7_1900_right <= VAR_BIN_OP_EQ_uxn_c_l278_c7_1900_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l278_c7_1900_return_output := BIN_OP_EQ_uxn_c_l278_c7_1900_return_output;

     -- BIN_OP_AND[uxn_c_l281_c4_b736] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l281_c4_b736_left <= VAR_BIN_OP_AND_uxn_c_l281_c4_b736_left;
     BIN_OP_AND_uxn_c_l281_c4_b736_right <= VAR_BIN_OP_AND_uxn_c_l281_c4_b736_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l281_c4_b736_return_output := BIN_OP_AND_uxn_c_l281_c4_b736_return_output;

     -- CONST_SL_8[uxn_c_l285_c4_9bf4] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l285_c4_9bf4_x <= VAR_CONST_SL_8_uxn_c_l285_c4_9bf4_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l285_c4_9bf4_return_output := CONST_SL_8_uxn_c_l285_c4_9bf4_return_output;

     -- BIN_OP_AND[uxn_c_l333_c4_a1d6] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l333_c4_a1d6_left <= VAR_BIN_OP_AND_uxn_c_l333_c4_a1d6_left;
     BIN_OP_AND_uxn_c_l333_c4_a1d6_right <= VAR_BIN_OP_AND_uxn_c_l333_c4_a1d6_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l333_c4_a1d6_return_output := BIN_OP_AND_uxn_c_l333_c4_a1d6_return_output;

     -- BIN_OP_EQ[uxn_c_l331_c12_c0d6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l331_c12_c0d6_left <= VAR_BIN_OP_EQ_uxn_c_l331_c12_c0d6_left;
     BIN_OP_EQ_uxn_c_l331_c12_c0d6_right <= VAR_BIN_OP_EQ_uxn_c_l331_c12_c0d6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l331_c12_c0d6_return_output := BIN_OP_EQ_uxn_c_l331_c12_c0d6_return_output;

     -- BIN_OP_EQ[uxn_c_l270_c30_7eb5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l270_c30_7eb5_left <= VAR_BIN_OP_EQ_uxn_c_l270_c30_7eb5_left;
     BIN_OP_EQ_uxn_c_l270_c30_7eb5_right <= VAR_BIN_OP_EQ_uxn_c_l270_c30_7eb5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l270_c30_7eb5_return_output := BIN_OP_EQ_uxn_c_l270_c30_7eb5_return_output;

     -- CAST_TO_uint4_t[uxn_c_l275_c25_6015] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_c_l275_c25_6015_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_CONST_SR_4_uxn_c_l275_c35_90ae_return_output);

     -- BIN_OP_EQ[uxn_c_l311_c12_d6c4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l311_c12_d6c4_left <= VAR_BIN_OP_EQ_uxn_c_l311_c12_d6c4_left;
     BIN_OP_EQ_uxn_c_l311_c12_d6c4_right <= VAR_BIN_OP_EQ_uxn_c_l311_c12_d6c4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l311_c12_d6c4_return_output := BIN_OP_EQ_uxn_c_l311_c12_d6c4_return_output;

     -- BIN_OP_AND[uxn_c_l297_c4_4cd5] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l297_c4_4cd5_left <= VAR_BIN_OP_AND_uxn_c_l297_c4_4cd5_left;
     BIN_OP_AND_uxn_c_l297_c4_4cd5_right <= VAR_BIN_OP_AND_uxn_c_l297_c4_4cd5_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l297_c4_4cd5_return_output := BIN_OP_AND_uxn_c_l297_c4_4cd5_return_output;

     -- BIN_OP_AND[uxn_c_l337_c4_b1a0] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l337_c4_b1a0_left <= VAR_BIN_OP_AND_uxn_c_l337_c4_b1a0_left;
     BIN_OP_AND_uxn_c_l337_c4_b1a0_right <= VAR_BIN_OP_AND_uxn_c_l337_c4_b1a0_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l337_c4_b1a0_return_output := BIN_OP_AND_uxn_c_l337_c4_b1a0_return_output;

     -- BIN_OP_AND[uxn_c_l303_c4_297a] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l303_c4_297a_left <= VAR_BIN_OP_AND_uxn_c_l303_c4_297a_left;
     BIN_OP_AND_uxn_c_l303_c4_297a_right <= VAR_BIN_OP_AND_uxn_c_l303_c4_297a_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l303_c4_297a_return_output := BIN_OP_AND_uxn_c_l303_c4_297a_return_output;

     -- BIN_OP_AND[uxn_c_l314_c4_0d17] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l314_c4_0d17_left <= VAR_BIN_OP_AND_uxn_c_l314_c4_0d17_left;
     BIN_OP_AND_uxn_c_l314_c4_0d17_right <= VAR_BIN_OP_AND_uxn_c_l314_c4_0d17_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l314_c4_0d17_return_output := BIN_OP_AND_uxn_c_l314_c4_0d17_return_output;

     -- BIN_OP_AND[uxn_c_l328_c4_4076] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l328_c4_4076_left <= VAR_BIN_OP_AND_uxn_c_l328_c4_4076_left;
     BIN_OP_AND_uxn_c_l328_c4_4076_right <= VAR_BIN_OP_AND_uxn_c_l328_c4_4076_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l328_c4_4076_return_output := BIN_OP_AND_uxn_c_l328_c4_4076_return_output;

     -- BIN_OP_AND[uxn_c_l292_c4_6094] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l292_c4_6094_left <= VAR_BIN_OP_AND_uxn_c_l292_c4_6094_left;
     BIN_OP_AND_uxn_c_l292_c4_6094_right <= VAR_BIN_OP_AND_uxn_c_l292_c4_6094_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l292_c4_6094_return_output := BIN_OP_AND_uxn_c_l292_c4_6094_return_output;

     -- BIN_OP_AND[uxn_c_l308_c4_edbf] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l308_c4_edbf_left <= VAR_BIN_OP_AND_uxn_c_l308_c4_edbf_left;
     BIN_OP_AND_uxn_c_l308_c4_edbf_right <= VAR_BIN_OP_AND_uxn_c_l308_c4_edbf_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l308_c4_edbf_return_output := BIN_OP_AND_uxn_c_l308_c4_edbf_return_output;

     -- CONST_SL_8[uxn_c_l296_c4_63a8] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l296_c4_63a8_x <= VAR_CONST_SL_8_uxn_c_l296_c4_63a8_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l296_c4_63a8_return_output := CONST_SL_8_uxn_c_l296_c4_63a8_return_output;

     -- BIN_OP_AND[uxn_c_l324_c4_f89d] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l324_c4_f89d_left <= VAR_BIN_OP_AND_uxn_c_l324_c4_f89d_left;
     BIN_OP_AND_uxn_c_l324_c4_f89d_right <= VAR_BIN_OP_AND_uxn_c_l324_c4_f89d_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l324_c4_f89d_return_output := BIN_OP_AND_uxn_c_l324_c4_f89d_return_output;

     -- CONST_SL_4[uxn_c_l307_c4_0535] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_c_l307_c4_0535_x <= VAR_CONST_SL_4_uxn_c_l307_c4_0535_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_c_l307_c4_0535_return_output := CONST_SL_4_uxn_c_l307_c4_0535_return_output;

     -- CONST_SL_4[uxn_c_l318_c4_cb2e] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_c_l318_c4_cb2e_x <= VAR_CONST_SL_4_uxn_c_l318_c4_cb2e_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_c_l318_c4_cb2e_return_output := CONST_SL_4_uxn_c_l318_c4_cb2e_return_output;

     -- BIN_OP_AND[uxn_c_l319_c4_886a] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l319_c4_886a_left <= VAR_BIN_OP_AND_uxn_c_l319_c4_886a_left;
     BIN_OP_AND_uxn_c_l319_c4_886a_right <= VAR_BIN_OP_AND_uxn_c_l319_c4_886a_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l319_c4_886a_return_output := BIN_OP_AND_uxn_c_l319_c4_886a_return_output;

     -- BIN_OP_EQ[uxn_c_l322_c12_1a03] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l322_c12_1a03_left <= VAR_BIN_OP_EQ_uxn_c_l322_c12_1a03_left;
     BIN_OP_EQ_uxn_c_l322_c12_1a03_right <= VAR_BIN_OP_EQ_uxn_c_l322_c12_1a03_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l322_c12_1a03_return_output := BIN_OP_EQ_uxn_c_l322_c12_1a03_return_output;

     -- CAST_TO_uint12_t_uint4_t_uxn_c_l327_l336_DUPLICATE_b7e0 LATENCY=0
     VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l327_l336_DUPLICATE_b7e0_return_output := CAST_TO_uint12_t_uint4_t(
     VAR_color_cmp_1_uxn_c_l276_c11_df88_0);

     -- Submodule level 2
     VAR_BIN_OP_OR_uxn_c_l282_c4_36d9_left := VAR_BIN_OP_AND_uxn_c_l281_c4_b736_return_output;
     VAR_BIN_OP_OR_uxn_c_l287_c4_34bb_left := VAR_BIN_OP_AND_uxn_c_l286_c4_1766_return_output;
     VAR_BIN_OP_OR_uxn_c_l293_c4_4229_left := VAR_BIN_OP_AND_uxn_c_l292_c4_6094_return_output;
     VAR_BIN_OP_OR_uxn_c_l298_c4_c925_left := VAR_BIN_OP_AND_uxn_c_l297_c4_4cd5_return_output;
     VAR_BIN_OP_OR_uxn_c_l304_c4_2464_left := VAR_BIN_OP_AND_uxn_c_l303_c4_297a_return_output;
     VAR_BIN_OP_OR_uxn_c_l309_c4_7f1c_left := VAR_BIN_OP_AND_uxn_c_l308_c4_edbf_return_output;
     VAR_BIN_OP_OR_uxn_c_l315_c4_35e0_left := VAR_BIN_OP_AND_uxn_c_l314_c4_0d17_return_output;
     VAR_BIN_OP_OR_uxn_c_l320_c4_7f4f_left := VAR_BIN_OP_AND_uxn_c_l319_c4_886a_return_output;
     VAR_BIN_OP_OR_uxn_c_l325_c4_be3c_left := VAR_BIN_OP_AND_uxn_c_l324_c4_f89d_return_output;
     VAR_BIN_OP_OR_uxn_c_l329_c4_43c5_left := VAR_BIN_OP_AND_uxn_c_l328_c4_4076_return_output;
     VAR_BIN_OP_OR_uxn_c_l334_c4_6864_left := VAR_BIN_OP_AND_uxn_c_l333_c4_a1d6_return_output;
     VAR_BIN_OP_OR_uxn_c_l338_c4_5b1c_left := VAR_BIN_OP_AND_uxn_c_l337_c4_b1a0_return_output;
     VAR_MUX_uxn_c_l270_c30_3e67_cond := VAR_BIN_OP_EQ_uxn_c_l270_c30_7eb5_return_output;
     VAR_color_MUX_uxn_c_l278_c3_58c0_cond := VAR_BIN_OP_EQ_uxn_c_l278_c7_1900_return_output;
     VAR_color_MUX_uxn_c_l289_c8_3337_cond := VAR_BIN_OP_EQ_uxn_c_l289_c12_7f38_return_output;
     VAR_color_MUX_uxn_c_l300_c8_a8d4_cond := VAR_BIN_OP_EQ_uxn_c_l300_c12_495a_return_output;
     VAR_color_MUX_uxn_c_l311_c8_2b3a_cond := VAR_BIN_OP_EQ_uxn_c_l311_c12_d6c4_return_output;
     VAR_color_MUX_uxn_c_l322_c8_587e_cond := VAR_BIN_OP_EQ_uxn_c_l322_c12_1a03_return_output;
     VAR_color_2_MUX_uxn_c_l331_c8_0128_cond := VAR_BIN_OP_EQ_uxn_c_l331_c12_c0d6_return_output;
     VAR_color_3_MUX_uxn_c_l331_c8_0128_cond := VAR_BIN_OP_EQ_uxn_c_l331_c12_c0d6_return_output;
     VAR_BIN_OP_OR_uxn_c_l329_c4_43c5_right := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l327_l336_DUPLICATE_b7e0_return_output;
     VAR_BIN_OP_OR_uxn_c_l338_c4_5b1c_right := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l327_l336_DUPLICATE_b7e0_return_output;
     VAR_color_cmp_0_uxn_c_l275_c11_99ea_0 := VAR_CAST_TO_uint4_t_uxn_c_l275_c25_6015_return_output;
     VAR_BIN_OP_OR_uxn_c_l309_c4_7f1c_right := VAR_CONST_SL_4_uxn_c_l307_c4_0535_return_output;
     VAR_BIN_OP_OR_uxn_c_l320_c4_7f4f_right := VAR_CONST_SL_4_uxn_c_l318_c4_cb2e_return_output;
     VAR_BIN_OP_OR_uxn_c_l287_c4_34bb_right := VAR_CONST_SL_8_uxn_c_l285_c4_9bf4_return_output;
     VAR_BIN_OP_OR_uxn_c_l298_c4_c925_right := VAR_CONST_SL_8_uxn_c_l296_c4_63a8_return_output;
     VAR_tmp12_uxn_c_l279_c4_5634 := resize(VAR_color_cmp_0_uxn_c_l275_c11_99ea_0, 12);
     VAR_tmp12_uxn_c_l290_c4_1cdf := resize(VAR_color_cmp_0_uxn_c_l275_c11_99ea_0, 12);
     VAR_tmp12_uxn_c_l301_c4_eafc := resize(VAR_color_cmp_0_uxn_c_l275_c11_99ea_0, 12);
     VAR_tmp12_uxn_c_l312_c4_7502 := resize(VAR_color_cmp_0_uxn_c_l275_c11_99ea_0, 12);
     VAR_CONST_SL_8_uxn_c_l280_c4_31fd_x := VAR_tmp12_uxn_c_l279_c4_5634;
     VAR_CONST_SL_8_uxn_c_l291_c4_7bac_x := VAR_tmp12_uxn_c_l290_c4_1cdf;
     VAR_CONST_SL_4_uxn_c_l302_c4_f911_x := VAR_tmp12_uxn_c_l301_c4_eafc;
     VAR_CONST_SL_4_uxn_c_l313_c4_bcc4_x := VAR_tmp12_uxn_c_l312_c4_7502;
     -- BIN_OP_OR[uxn_c_l320_c4_7f4f] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l320_c4_7f4f_left <= VAR_BIN_OP_OR_uxn_c_l320_c4_7f4f_left;
     BIN_OP_OR_uxn_c_l320_c4_7f4f_right <= VAR_BIN_OP_OR_uxn_c_l320_c4_7f4f_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l320_c4_7f4f_return_output := BIN_OP_OR_uxn_c_l320_c4_7f4f_return_output;

     -- BIN_OP_OR[uxn_c_l287_c4_34bb] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l287_c4_34bb_left <= VAR_BIN_OP_OR_uxn_c_l287_c4_34bb_left;
     BIN_OP_OR_uxn_c_l287_c4_34bb_right <= VAR_BIN_OP_OR_uxn_c_l287_c4_34bb_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l287_c4_34bb_return_output := BIN_OP_OR_uxn_c_l287_c4_34bb_return_output;

     -- CONST_SL_4[uxn_c_l313_c4_bcc4] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_c_l313_c4_bcc4_x <= VAR_CONST_SL_4_uxn_c_l313_c4_bcc4_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_c_l313_c4_bcc4_return_output := CONST_SL_4_uxn_c_l313_c4_bcc4_return_output;

     -- BIN_OP_OR[uxn_c_l329_c4_43c5] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l329_c4_43c5_left <= VAR_BIN_OP_OR_uxn_c_l329_c4_43c5_left;
     BIN_OP_OR_uxn_c_l329_c4_43c5_right <= VAR_BIN_OP_OR_uxn_c_l329_c4_43c5_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l329_c4_43c5_return_output := BIN_OP_OR_uxn_c_l329_c4_43c5_return_output;

     -- CONST_SL_8[uxn_c_l291_c4_7bac] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l291_c4_7bac_x <= VAR_CONST_SL_8_uxn_c_l291_c4_7bac_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l291_c4_7bac_return_output := CONST_SL_8_uxn_c_l291_c4_7bac_return_output;

     -- BIN_OP_OR[uxn_c_l338_c4_5b1c] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l338_c4_5b1c_left <= VAR_BIN_OP_OR_uxn_c_l338_c4_5b1c_left;
     BIN_OP_OR_uxn_c_l338_c4_5b1c_right <= VAR_BIN_OP_OR_uxn_c_l338_c4_5b1c_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l338_c4_5b1c_return_output := BIN_OP_OR_uxn_c_l338_c4_5b1c_return_output;

     -- CONST_SL_8[uxn_c_l280_c4_31fd] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l280_c4_31fd_x <= VAR_CONST_SL_8_uxn_c_l280_c4_31fd_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l280_c4_31fd_return_output := CONST_SL_8_uxn_c_l280_c4_31fd_return_output;

     -- CAST_TO_uint12_t_uint4_t_uxn_c_l332_l323_DUPLICATE_d928 LATENCY=0
     VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l332_l323_DUPLICATE_d928_return_output := CAST_TO_uint12_t_uint4_t(
     VAR_color_cmp_0_uxn_c_l275_c11_99ea_0);

     -- MUX[uxn_c_l270_c30_3e67] LATENCY=0
     -- Inputs
     MUX_uxn_c_l270_c30_3e67_cond <= VAR_MUX_uxn_c_l270_c30_3e67_cond;
     MUX_uxn_c_l270_c30_3e67_iftrue <= VAR_MUX_uxn_c_l270_c30_3e67_iftrue;
     MUX_uxn_c_l270_c30_3e67_iffalse <= VAR_MUX_uxn_c_l270_c30_3e67_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l270_c30_3e67_return_output := MUX_uxn_c_l270_c30_3e67_return_output;

     -- BIN_OP_OR[uxn_c_l309_c4_7f1c] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l309_c4_7f1c_left <= VAR_BIN_OP_OR_uxn_c_l309_c4_7f1c_left;
     BIN_OP_OR_uxn_c_l309_c4_7f1c_right <= VAR_BIN_OP_OR_uxn_c_l309_c4_7f1c_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l309_c4_7f1c_return_output := BIN_OP_OR_uxn_c_l309_c4_7f1c_return_output;

     -- BIN_OP_OR[uxn_c_l298_c4_c925] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l298_c4_c925_left <= VAR_BIN_OP_OR_uxn_c_l298_c4_c925_left;
     BIN_OP_OR_uxn_c_l298_c4_c925_right <= VAR_BIN_OP_OR_uxn_c_l298_c4_c925_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l298_c4_c925_return_output := BIN_OP_OR_uxn_c_l298_c4_c925_return_output;

     -- CONST_SL_4[uxn_c_l302_c4_f911] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_c_l302_c4_f911_x <= VAR_CONST_SL_4_uxn_c_l302_c4_f911_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_c_l302_c4_f911_return_output := CONST_SL_4_uxn_c_l302_c4_f911_return_output;

     -- Submodule level 3
     VAR_color_3_MUX_uxn_c_l331_c8_0128_iftrue := VAR_BIN_OP_OR_uxn_c_l338_c4_5b1c_return_output;
     VAR_BIN_OP_OR_uxn_c_l325_c4_be3c_right := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l332_l323_DUPLICATE_d928_return_output;
     VAR_BIN_OP_OR_uxn_c_l334_c4_6864_right := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l332_l323_DUPLICATE_d928_return_output;
     VAR_BIN_OP_OR_uxn_c_l304_c4_2464_right := VAR_CONST_SL_4_uxn_c_l302_c4_f911_return_output;
     VAR_BIN_OP_OR_uxn_c_l315_c4_35e0_right := VAR_CONST_SL_4_uxn_c_l313_c4_bcc4_return_output;
     VAR_BIN_OP_OR_uxn_c_l282_c4_36d9_right := VAR_CONST_SL_8_uxn_c_l280_c4_31fd_return_output;
     VAR_BIN_OP_OR_uxn_c_l293_c4_4229_right := VAR_CONST_SL_8_uxn_c_l291_c4_7bac_return_output;
     VAR_BIN_OP_AND_uxn_c_l272_c6_73e8_right := VAR_MUX_uxn_c_l270_c30_3e67_return_output;
     -- BIN_OP_OR[uxn_c_l304_c4_2464] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l304_c4_2464_left <= VAR_BIN_OP_OR_uxn_c_l304_c4_2464_left;
     BIN_OP_OR_uxn_c_l304_c4_2464_right <= VAR_BIN_OP_OR_uxn_c_l304_c4_2464_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l304_c4_2464_return_output := BIN_OP_OR_uxn_c_l304_c4_2464_return_output;

     -- BIN_OP_OR[uxn_c_l293_c4_4229] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l293_c4_4229_left <= VAR_BIN_OP_OR_uxn_c_l293_c4_4229_left;
     BIN_OP_OR_uxn_c_l293_c4_4229_right <= VAR_BIN_OP_OR_uxn_c_l293_c4_4229_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l293_c4_4229_return_output := BIN_OP_OR_uxn_c_l293_c4_4229_return_output;

     -- BIN_OP_AND[uxn_c_l272_c6_73e8] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l272_c6_73e8_left <= VAR_BIN_OP_AND_uxn_c_l272_c6_73e8_left;
     BIN_OP_AND_uxn_c_l272_c6_73e8_right <= VAR_BIN_OP_AND_uxn_c_l272_c6_73e8_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l272_c6_73e8_return_output := BIN_OP_AND_uxn_c_l272_c6_73e8_return_output;

     -- BIN_OP_OR[uxn_c_l315_c4_35e0] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l315_c4_35e0_left <= VAR_BIN_OP_OR_uxn_c_l315_c4_35e0_left;
     BIN_OP_OR_uxn_c_l315_c4_35e0_right <= VAR_BIN_OP_OR_uxn_c_l315_c4_35e0_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l315_c4_35e0_return_output := BIN_OP_OR_uxn_c_l315_c4_35e0_return_output;

     -- BIN_OP_OR[uxn_c_l282_c4_36d9] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l282_c4_36d9_left <= VAR_BIN_OP_OR_uxn_c_l282_c4_36d9_left;
     BIN_OP_OR_uxn_c_l282_c4_36d9_right <= VAR_BIN_OP_OR_uxn_c_l282_c4_36d9_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l282_c4_36d9_return_output := BIN_OP_OR_uxn_c_l282_c4_36d9_return_output;

     -- color_3_MUX[uxn_c_l331_c8_0128] LATENCY=0
     -- Inputs
     color_3_MUX_uxn_c_l331_c8_0128_cond <= VAR_color_3_MUX_uxn_c_l331_c8_0128_cond;
     color_3_MUX_uxn_c_l331_c8_0128_iftrue <= VAR_color_3_MUX_uxn_c_l331_c8_0128_iftrue;
     color_3_MUX_uxn_c_l331_c8_0128_iffalse <= VAR_color_3_MUX_uxn_c_l331_c8_0128_iffalse;
     -- Outputs
     VAR_color_3_MUX_uxn_c_l331_c8_0128_return_output := color_3_MUX_uxn_c_l331_c8_0128_return_output;

     -- BIN_OP_OR[uxn_c_l334_c4_6864] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l334_c4_6864_left <= VAR_BIN_OP_OR_uxn_c_l334_c4_6864_left;
     BIN_OP_OR_uxn_c_l334_c4_6864_right <= VAR_BIN_OP_OR_uxn_c_l334_c4_6864_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l334_c4_6864_return_output := BIN_OP_OR_uxn_c_l334_c4_6864_return_output;

     -- BIN_OP_OR[uxn_c_l325_c4_be3c] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l325_c4_be3c_left <= VAR_BIN_OP_OR_uxn_c_l325_c4_be3c_left;
     BIN_OP_OR_uxn_c_l325_c4_be3c_right <= VAR_BIN_OP_OR_uxn_c_l325_c4_be3c_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l325_c4_be3c_return_output := BIN_OP_OR_uxn_c_l325_c4_be3c_return_output;

     -- Submodule level 4
     VAR_color_MUX_uxn_c_l272_c2_d3f2_cond := VAR_BIN_OP_AND_uxn_c_l272_c6_73e8_return_output;
     VAR_color_2_MUX_uxn_c_l331_c8_0128_iftrue := VAR_BIN_OP_OR_uxn_c_l334_c4_6864_return_output;
     -- color_2_MUX[uxn_c_l331_c8_0128] LATENCY=0
     -- Inputs
     color_2_MUX_uxn_c_l331_c8_0128_cond <= VAR_color_2_MUX_uxn_c_l331_c8_0128_cond;
     color_2_MUX_uxn_c_l331_c8_0128_iftrue <= VAR_color_2_MUX_uxn_c_l331_c8_0128_iftrue;
     color_2_MUX_uxn_c_l331_c8_0128_iffalse <= VAR_color_2_MUX_uxn_c_l331_c8_0128_iffalse;
     -- Outputs
     VAR_color_2_MUX_uxn_c_l331_c8_0128_return_output := color_2_MUX_uxn_c_l331_c8_0128_return_output;

     -- color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8[uxn_c_l278_c3_58c0] LATENCY=0
     VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l278_c3_58c0_return_output := CONST_REF_RD_uint12_t_4_uint12_t_4_90b8(
     color,
     VAR_BIN_OP_OR_uxn_c_l282_c4_36d9_return_output,
     VAR_BIN_OP_OR_uxn_c_l287_c4_34bb_return_output);

     -- color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8[uxn_c_l322_c8_587e] LATENCY=0
     VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l322_c8_587e_return_output := CONST_REF_RD_uint12_t_4_uint12_t_4_90b8(
     color,
     VAR_BIN_OP_OR_uxn_c_l325_c4_be3c_return_output,
     VAR_BIN_OP_OR_uxn_c_l329_c4_43c5_return_output);

     -- color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5[uxn_c_l311_c8_2b3a] LATENCY=0
     VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l311_c8_2b3a_return_output := CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5(
     color,
     VAR_BIN_OP_OR_uxn_c_l315_c4_35e0_return_output,
     VAR_BIN_OP_OR_uxn_c_l320_c4_7f4f_return_output);

     -- color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8[uxn_c_l300_c8_a8d4] LATENCY=0
     VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l300_c8_a8d4_return_output := CONST_REF_RD_uint12_t_4_uint12_t_4_90b8(
     color,
     VAR_BIN_OP_OR_uxn_c_l304_c4_2464_return_output,
     VAR_BIN_OP_OR_uxn_c_l309_c4_7f1c_return_output);

     -- color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5[uxn_c_l289_c8_3337] LATENCY=0
     VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l289_c8_3337_return_output := CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5(
     color,
     VAR_BIN_OP_OR_uxn_c_l293_c4_4229_return_output,
     VAR_BIN_OP_OR_uxn_c_l298_c4_c925_return_output);

     -- Submodule level 5
     VAR_color_MUX_uxn_c_l278_c3_58c0_iftrue := VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l278_c3_58c0_return_output;
     VAR_color_MUX_uxn_c_l300_c8_a8d4_iftrue := VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l300_c8_a8d4_return_output;
     VAR_color_MUX_uxn_c_l322_c8_587e_iftrue := VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_90b8_uxn_c_l322_c8_587e_return_output;
     VAR_color_MUX_uxn_c_l289_c8_3337_iftrue := VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l289_c8_3337_return_output;
     VAR_color_MUX_uxn_c_l311_c8_2b3a_iftrue := VAR_color_TRUE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l311_c8_2b3a_return_output;
     -- color_FALSE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5[uxn_c_l322_c8_587e] LATENCY=0
     VAR_color_FALSE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l322_c8_587e_return_output := CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5(
     color,
     VAR_color_2_MUX_uxn_c_l331_c8_0128_return_output,
     VAR_color_3_MUX_uxn_c_l331_c8_0128_return_output);

     -- Submodule level 6
     VAR_color_MUX_uxn_c_l322_c8_587e_iffalse := VAR_color_FALSE_INPUT_MUX_CONST_REF_RD_uint12_t_4_uint12_t_4_bdd5_uxn_c_l322_c8_587e_return_output;
     -- color_MUX[uxn_c_l322_c8_587e] LATENCY=0
     -- Inputs
     color_MUX_uxn_c_l322_c8_587e_cond <= VAR_color_MUX_uxn_c_l322_c8_587e_cond;
     color_MUX_uxn_c_l322_c8_587e_iftrue <= VAR_color_MUX_uxn_c_l322_c8_587e_iftrue;
     color_MUX_uxn_c_l322_c8_587e_iffalse <= VAR_color_MUX_uxn_c_l322_c8_587e_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_c_l322_c8_587e_return_output := color_MUX_uxn_c_l322_c8_587e_return_output;

     -- Submodule level 7
     VAR_color_MUX_uxn_c_l311_c8_2b3a_iffalse := VAR_color_MUX_uxn_c_l322_c8_587e_return_output;
     -- color_MUX[uxn_c_l311_c8_2b3a] LATENCY=0
     -- Inputs
     color_MUX_uxn_c_l311_c8_2b3a_cond <= VAR_color_MUX_uxn_c_l311_c8_2b3a_cond;
     color_MUX_uxn_c_l311_c8_2b3a_iftrue <= VAR_color_MUX_uxn_c_l311_c8_2b3a_iftrue;
     color_MUX_uxn_c_l311_c8_2b3a_iffalse <= VAR_color_MUX_uxn_c_l311_c8_2b3a_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_c_l311_c8_2b3a_return_output := color_MUX_uxn_c_l311_c8_2b3a_return_output;

     -- Submodule level 8
     VAR_color_MUX_uxn_c_l300_c8_a8d4_iffalse := VAR_color_MUX_uxn_c_l311_c8_2b3a_return_output;
     -- color_MUX[uxn_c_l300_c8_a8d4] LATENCY=0
     -- Inputs
     color_MUX_uxn_c_l300_c8_a8d4_cond <= VAR_color_MUX_uxn_c_l300_c8_a8d4_cond;
     color_MUX_uxn_c_l300_c8_a8d4_iftrue <= VAR_color_MUX_uxn_c_l300_c8_a8d4_iftrue;
     color_MUX_uxn_c_l300_c8_a8d4_iffalse <= VAR_color_MUX_uxn_c_l300_c8_a8d4_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_c_l300_c8_a8d4_return_output := color_MUX_uxn_c_l300_c8_a8d4_return_output;

     -- Submodule level 9
     VAR_color_MUX_uxn_c_l289_c8_3337_iffalse := VAR_color_MUX_uxn_c_l300_c8_a8d4_return_output;
     -- color_MUX[uxn_c_l289_c8_3337] LATENCY=0
     -- Inputs
     color_MUX_uxn_c_l289_c8_3337_cond <= VAR_color_MUX_uxn_c_l289_c8_3337_cond;
     color_MUX_uxn_c_l289_c8_3337_iftrue <= VAR_color_MUX_uxn_c_l289_c8_3337_iftrue;
     color_MUX_uxn_c_l289_c8_3337_iffalse <= VAR_color_MUX_uxn_c_l289_c8_3337_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_c_l289_c8_3337_return_output := color_MUX_uxn_c_l289_c8_3337_return_output;

     -- Submodule level 10
     VAR_color_MUX_uxn_c_l278_c3_58c0_iffalse := VAR_color_MUX_uxn_c_l289_c8_3337_return_output;
     -- color_MUX[uxn_c_l278_c3_58c0] LATENCY=0
     -- Inputs
     color_MUX_uxn_c_l278_c3_58c0_cond <= VAR_color_MUX_uxn_c_l278_c3_58c0_cond;
     color_MUX_uxn_c_l278_c3_58c0_iftrue <= VAR_color_MUX_uxn_c_l278_c3_58c0_iftrue;
     color_MUX_uxn_c_l278_c3_58c0_iffalse <= VAR_color_MUX_uxn_c_l278_c3_58c0_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_c_l278_c3_58c0_return_output := color_MUX_uxn_c_l278_c3_58c0_return_output;

     -- Submodule level 11
     VAR_color_MUX_uxn_c_l272_c2_d3f2_iftrue := VAR_color_MUX_uxn_c_l278_c3_58c0_return_output;
     -- color_MUX[uxn_c_l272_c2_d3f2] LATENCY=0
     -- Inputs
     color_MUX_uxn_c_l272_c2_d3f2_cond <= VAR_color_MUX_uxn_c_l272_c2_d3f2_cond;
     color_MUX_uxn_c_l272_c2_d3f2_iftrue <= VAR_color_MUX_uxn_c_l272_c2_d3f2_iftrue;
     color_MUX_uxn_c_l272_c2_d3f2_iffalse <= VAR_color_MUX_uxn_c_l272_c2_d3f2_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_c_l272_c2_d3f2_return_output := color_MUX_uxn_c_l272_c2_d3f2_return_output;

     -- Submodule level 12
     VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l342_c20_3f70_ref_toks_0 := VAR_color_MUX_uxn_c_l272_c2_d3f2_return_output;
     REG_VAR_color := VAR_color_MUX_uxn_c_l272_c2_d3f2_return_output;
     -- VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d[uxn_c_l342_c20_3f70] LATENCY=0
     -- Inputs
     VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l342_c20_3f70_ref_toks_0 <= VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l342_c20_3f70_ref_toks_0;
     VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l342_c20_3f70_var_dim_0 <= VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l342_c20_3f70_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l342_c20_3f70_return_output := VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l342_c20_3f70_return_output;

     -- Submodule level 13
     VAR_result_uxn_c_l342_c11_17bd_0 := resize(VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l342_c20_3f70_return_output, 16);
     VAR_return_output := VAR_result_uxn_c_l342_c11_17bd_0;
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
