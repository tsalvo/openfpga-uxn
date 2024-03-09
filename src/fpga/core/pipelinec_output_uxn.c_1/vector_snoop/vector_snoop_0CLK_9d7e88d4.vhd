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
-- Submodules: 22
entity vector_snoop_0CLK_9d7e88d4 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 device_ram_address : in unsigned(7 downto 0);
 device_ram_value : in unsigned(7 downto 0);
 is_device_ram_write : in unsigned(0 downto 0);
 return_output : out vector_snoop_result_t);
end vector_snoop_0CLK_9d7e88d4;
architecture arch of vector_snoop_0CLK_9d7e88d4 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal vectors : vector_snoop_result_t := (
screen => to_unsigned(0, 16),
controller => to_unsigned(0, 16))
;
signal REG_COMB_vectors : vector_snoop_result_t;

-- Each function instance gets signals
-- vectors_MUX[uxn_c_l250_c2_d8ef]
signal vectors_MUX_uxn_c_l250_c2_d8ef_cond : unsigned(0 downto 0);
signal vectors_MUX_uxn_c_l250_c2_d8ef_iftrue : vector_snoop_result_t;
signal vectors_MUX_uxn_c_l250_c2_d8ef_iffalse : vector_snoop_result_t;
signal vectors_MUX_uxn_c_l250_c2_d8ef_return_output : vector_snoop_result_t;

-- BIN_OP_EQ[uxn_c_l251_c7_bccf]
signal BIN_OP_EQ_uxn_c_l251_c7_bccf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l251_c7_bccf_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l251_c7_bccf_return_output : unsigned(0 downto 0);

-- vectors_MUX[uxn_c_l251_c3_63d1]
signal vectors_MUX_uxn_c_l251_c3_63d1_cond : unsigned(0 downto 0);
signal vectors_MUX_uxn_c_l251_c3_63d1_iftrue : vector_snoop_result_t;
signal vectors_MUX_uxn_c_l251_c3_63d1_iffalse : vector_snoop_result_t;
signal vectors_MUX_uxn_c_l251_c3_63d1_return_output : vector_snoop_result_t;

-- BIN_OP_AND[uxn_c_l252_c4_cdeb]
signal BIN_OP_AND_uxn_c_l252_c4_cdeb_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l252_c4_cdeb_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l252_c4_cdeb_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_c_l253_c4_c2e7]
signal BIN_OP_OR_uxn_c_l253_c4_c2e7_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_c_l253_c4_c2e7_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_c_l253_c4_c2e7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l254_c14_4d64]
signal BIN_OP_EQ_uxn_c_l254_c14_4d64_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l254_c14_4d64_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l254_c14_4d64_return_output : unsigned(0 downto 0);

-- vectors_MUX[uxn_c_l254_c10_1d26]
signal vectors_MUX_uxn_c_l254_c10_1d26_cond : unsigned(0 downto 0);
signal vectors_MUX_uxn_c_l254_c10_1d26_iftrue : vector_snoop_result_t;
signal vectors_MUX_uxn_c_l254_c10_1d26_iffalse : vector_snoop_result_t;
signal vectors_MUX_uxn_c_l254_c10_1d26_return_output : vector_snoop_result_t;

-- BIN_OP_AND[uxn_c_l255_c4_86e1]
signal BIN_OP_AND_uxn_c_l255_c4_86e1_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l255_c4_86e1_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l255_c4_86e1_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_c_l256_c4_4a4c]
signal BIN_OP_OR_uxn_c_l256_c4_4a4c_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_c_l256_c4_4a4c_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_c_l256_c4_4a4c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l257_c14_e61c]
signal BIN_OP_EQ_uxn_c_l257_c14_e61c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l257_c14_e61c_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l257_c14_e61c_return_output : unsigned(0 downto 0);

-- vectors_controller_MUX[uxn_c_l257_c10_addf]
signal vectors_controller_MUX_uxn_c_l257_c10_addf_cond : unsigned(0 downto 0);
signal vectors_controller_MUX_uxn_c_l257_c10_addf_iftrue : unsigned(15 downto 0);
signal vectors_controller_MUX_uxn_c_l257_c10_addf_iffalse : unsigned(15 downto 0);
signal vectors_controller_MUX_uxn_c_l257_c10_addf_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_c_l258_c4_f182]
signal BIN_OP_AND_uxn_c_l258_c4_f182_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l258_c4_f182_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l258_c4_f182_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_c_l259_c4_49ad]
signal BIN_OP_OR_uxn_c_l259_c4_49ad_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_c_l259_c4_49ad_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_c_l259_c4_49ad_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l260_c14_0285]
signal BIN_OP_EQ_uxn_c_l260_c14_0285_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l260_c14_0285_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l260_c14_0285_return_output : unsigned(0 downto 0);

-- vectors_controller_MUX[uxn_c_l260_c10_608a]
signal vectors_controller_MUX_uxn_c_l260_c10_608a_cond : unsigned(0 downto 0);
signal vectors_controller_MUX_uxn_c_l260_c10_608a_iftrue : unsigned(15 downto 0);
signal vectors_controller_MUX_uxn_c_l260_c10_608a_iffalse : unsigned(15 downto 0);
signal vectors_controller_MUX_uxn_c_l260_c10_608a_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_c_l261_c4_d111]
signal BIN_OP_AND_uxn_c_l261_c4_d111_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l261_c4_d111_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l261_c4_d111_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_c_l262_c4_28bd]
signal BIN_OP_OR_uxn_c_l262_c4_28bd_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_c_l262_c4_28bd_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_c_l262_c4_28bd_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_c_l259_l253_DUPLICATE_5411
signal CONST_SL_8_uint16_t_uxn_c_l259_l253_DUPLICATE_5411_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_c_l259_l253_DUPLICATE_5411_return_output : unsigned(15 downto 0);

function CONST_REF_RD_vector_snoop_result_t_vector_snoop_result_t_9b02( ref_toks_0 : vector_snoop_result_t;
 ref_toks_1 : unsigned) return vector_snoop_result_t is
 
  variable base : vector_snoop_result_t; 
  variable return_output : vector_snoop_result_t;
begin
      base := ref_toks_0;
      base.screen := ref_toks_1;

      return_output := base;
      return return_output; 
end function;

function CONST_REF_RD_vector_snoop_result_t_vector_snoop_result_t_9d05( ref_toks_0 : vector_snoop_result_t;
 ref_toks_1 : unsigned) return vector_snoop_result_t is
 
  variable base : vector_snoop_result_t; 
  variable return_output : vector_snoop_result_t;
begin
      base := ref_toks_0;
      base.controller := ref_toks_1;

      return_output := base;
      return return_output; 
end function;

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- vectors_MUX_uxn_c_l250_c2_d8ef
vectors_MUX_uxn_c_l250_c2_d8ef : entity work.MUX_uint1_t_vector_snoop_result_t_vector_snoop_result_t_0CLK_de264c78 port map (
vectors_MUX_uxn_c_l250_c2_d8ef_cond,
vectors_MUX_uxn_c_l250_c2_d8ef_iftrue,
vectors_MUX_uxn_c_l250_c2_d8ef_iffalse,
vectors_MUX_uxn_c_l250_c2_d8ef_return_output);

-- BIN_OP_EQ_uxn_c_l251_c7_bccf
BIN_OP_EQ_uxn_c_l251_c7_bccf : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l251_c7_bccf_left,
BIN_OP_EQ_uxn_c_l251_c7_bccf_right,
BIN_OP_EQ_uxn_c_l251_c7_bccf_return_output);

-- vectors_MUX_uxn_c_l251_c3_63d1
vectors_MUX_uxn_c_l251_c3_63d1 : entity work.MUX_uint1_t_vector_snoop_result_t_vector_snoop_result_t_0CLK_de264c78 port map (
vectors_MUX_uxn_c_l251_c3_63d1_cond,
vectors_MUX_uxn_c_l251_c3_63d1_iftrue,
vectors_MUX_uxn_c_l251_c3_63d1_iffalse,
vectors_MUX_uxn_c_l251_c3_63d1_return_output);

-- BIN_OP_AND_uxn_c_l252_c4_cdeb
BIN_OP_AND_uxn_c_l252_c4_cdeb : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l252_c4_cdeb_left,
BIN_OP_AND_uxn_c_l252_c4_cdeb_right,
BIN_OP_AND_uxn_c_l252_c4_cdeb_return_output);

-- BIN_OP_OR_uxn_c_l253_c4_c2e7
BIN_OP_OR_uxn_c_l253_c4_c2e7 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l253_c4_c2e7_left,
BIN_OP_OR_uxn_c_l253_c4_c2e7_right,
BIN_OP_OR_uxn_c_l253_c4_c2e7_return_output);

-- BIN_OP_EQ_uxn_c_l254_c14_4d64
BIN_OP_EQ_uxn_c_l254_c14_4d64 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l254_c14_4d64_left,
BIN_OP_EQ_uxn_c_l254_c14_4d64_right,
BIN_OP_EQ_uxn_c_l254_c14_4d64_return_output);

-- vectors_MUX_uxn_c_l254_c10_1d26
vectors_MUX_uxn_c_l254_c10_1d26 : entity work.MUX_uint1_t_vector_snoop_result_t_vector_snoop_result_t_0CLK_de264c78 port map (
vectors_MUX_uxn_c_l254_c10_1d26_cond,
vectors_MUX_uxn_c_l254_c10_1d26_iftrue,
vectors_MUX_uxn_c_l254_c10_1d26_iffalse,
vectors_MUX_uxn_c_l254_c10_1d26_return_output);

-- BIN_OP_AND_uxn_c_l255_c4_86e1
BIN_OP_AND_uxn_c_l255_c4_86e1 : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l255_c4_86e1_left,
BIN_OP_AND_uxn_c_l255_c4_86e1_right,
BIN_OP_AND_uxn_c_l255_c4_86e1_return_output);

-- BIN_OP_OR_uxn_c_l256_c4_4a4c
BIN_OP_OR_uxn_c_l256_c4_4a4c : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l256_c4_4a4c_left,
BIN_OP_OR_uxn_c_l256_c4_4a4c_right,
BIN_OP_OR_uxn_c_l256_c4_4a4c_return_output);

-- BIN_OP_EQ_uxn_c_l257_c14_e61c
BIN_OP_EQ_uxn_c_l257_c14_e61c : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l257_c14_e61c_left,
BIN_OP_EQ_uxn_c_l257_c14_e61c_right,
BIN_OP_EQ_uxn_c_l257_c14_e61c_return_output);

-- vectors_controller_MUX_uxn_c_l257_c10_addf
vectors_controller_MUX_uxn_c_l257_c10_addf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
vectors_controller_MUX_uxn_c_l257_c10_addf_cond,
vectors_controller_MUX_uxn_c_l257_c10_addf_iftrue,
vectors_controller_MUX_uxn_c_l257_c10_addf_iffalse,
vectors_controller_MUX_uxn_c_l257_c10_addf_return_output);

-- BIN_OP_AND_uxn_c_l258_c4_f182
BIN_OP_AND_uxn_c_l258_c4_f182 : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l258_c4_f182_left,
BIN_OP_AND_uxn_c_l258_c4_f182_right,
BIN_OP_AND_uxn_c_l258_c4_f182_return_output);

-- BIN_OP_OR_uxn_c_l259_c4_49ad
BIN_OP_OR_uxn_c_l259_c4_49ad : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l259_c4_49ad_left,
BIN_OP_OR_uxn_c_l259_c4_49ad_right,
BIN_OP_OR_uxn_c_l259_c4_49ad_return_output);

-- BIN_OP_EQ_uxn_c_l260_c14_0285
BIN_OP_EQ_uxn_c_l260_c14_0285 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l260_c14_0285_left,
BIN_OP_EQ_uxn_c_l260_c14_0285_right,
BIN_OP_EQ_uxn_c_l260_c14_0285_return_output);

-- vectors_controller_MUX_uxn_c_l260_c10_608a
vectors_controller_MUX_uxn_c_l260_c10_608a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
vectors_controller_MUX_uxn_c_l260_c10_608a_cond,
vectors_controller_MUX_uxn_c_l260_c10_608a_iftrue,
vectors_controller_MUX_uxn_c_l260_c10_608a_iffalse,
vectors_controller_MUX_uxn_c_l260_c10_608a_return_output);

-- BIN_OP_AND_uxn_c_l261_c4_d111
BIN_OP_AND_uxn_c_l261_c4_d111 : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l261_c4_d111_left,
BIN_OP_AND_uxn_c_l261_c4_d111_right,
BIN_OP_AND_uxn_c_l261_c4_d111_return_output);

-- BIN_OP_OR_uxn_c_l262_c4_28bd
BIN_OP_OR_uxn_c_l262_c4_28bd : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l262_c4_28bd_left,
BIN_OP_OR_uxn_c_l262_c4_28bd_right,
BIN_OP_OR_uxn_c_l262_c4_28bd_return_output);

-- CONST_SL_8_uint16_t_uxn_c_l259_l253_DUPLICATE_5411
CONST_SL_8_uint16_t_uxn_c_l259_l253_DUPLICATE_5411 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_c_l259_l253_DUPLICATE_5411_x,
CONST_SL_8_uint16_t_uxn_c_l259_l253_DUPLICATE_5411_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 device_ram_address,
 device_ram_value,
 is_device_ram_write,
 -- Registers
 vectors,
 -- All submodule outputs
 vectors_MUX_uxn_c_l250_c2_d8ef_return_output,
 BIN_OP_EQ_uxn_c_l251_c7_bccf_return_output,
 vectors_MUX_uxn_c_l251_c3_63d1_return_output,
 BIN_OP_AND_uxn_c_l252_c4_cdeb_return_output,
 BIN_OP_OR_uxn_c_l253_c4_c2e7_return_output,
 BIN_OP_EQ_uxn_c_l254_c14_4d64_return_output,
 vectors_MUX_uxn_c_l254_c10_1d26_return_output,
 BIN_OP_AND_uxn_c_l255_c4_86e1_return_output,
 BIN_OP_OR_uxn_c_l256_c4_4a4c_return_output,
 BIN_OP_EQ_uxn_c_l257_c14_e61c_return_output,
 vectors_controller_MUX_uxn_c_l257_c10_addf_return_output,
 BIN_OP_AND_uxn_c_l258_c4_f182_return_output,
 BIN_OP_OR_uxn_c_l259_c4_49ad_return_output,
 BIN_OP_EQ_uxn_c_l260_c14_0285_return_output,
 vectors_controller_MUX_uxn_c_l260_c10_608a_return_output,
 BIN_OP_AND_uxn_c_l261_c4_d111_return_output,
 BIN_OP_OR_uxn_c_l262_c4_28bd_return_output,
 CONST_SL_8_uint16_t_uxn_c_l259_l253_DUPLICATE_5411_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : vector_snoop_result_t;
 variable VAR_device_ram_address : unsigned(7 downto 0);
 variable VAR_device_ram_value : unsigned(7 downto 0);
 variable VAR_is_device_ram_write : unsigned(0 downto 0);
 variable VAR_vectors_MUX_uxn_c_l250_c2_d8ef_iftrue : vector_snoop_result_t;
 variable VAR_vectors_MUX_uxn_c_l251_c3_63d1_return_output : vector_snoop_result_t;
 variable VAR_vectors_MUX_uxn_c_l250_c2_d8ef_iffalse : vector_snoop_result_t;
 variable VAR_vectors_MUX_uxn_c_l250_c2_d8ef_return_output : vector_snoop_result_t;
 variable VAR_vectors_MUX_uxn_c_l250_c2_d8ef_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l251_c7_bccf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l251_c7_bccf_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l251_c7_bccf_return_output : unsigned(0 downto 0);
 variable VAR_vectors_MUX_uxn_c_l251_c3_63d1_iftrue : vector_snoop_result_t;
 variable VAR_vectors_TRUE_INPUT_MUX_CONST_REF_RD_vector_snoop_result_t_vector_snoop_result_t_9b02_uxn_c_l251_c3_63d1_return_output : vector_snoop_result_t;
 variable VAR_vectors_MUX_uxn_c_l251_c3_63d1_iffalse : vector_snoop_result_t;
 variable VAR_vectors_MUX_uxn_c_l254_c10_1d26_return_output : vector_snoop_result_t;
 variable VAR_vectors_MUX_uxn_c_l251_c3_63d1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l252_c4_cdeb_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l252_c4_cdeb_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l252_c4_cdeb_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l253_c4_c2e7_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l253_c4_c2e7_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l253_c4_c2e7_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l254_c14_4d64_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l254_c14_4d64_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l254_c14_4d64_return_output : unsigned(0 downto 0);
 variable VAR_vectors_MUX_uxn_c_l254_c10_1d26_iftrue : vector_snoop_result_t;
 variable VAR_vectors_TRUE_INPUT_MUX_CONST_REF_RD_vector_snoop_result_t_vector_snoop_result_t_9b02_uxn_c_l254_c10_1d26_return_output : vector_snoop_result_t;
 variable VAR_vectors_MUX_uxn_c_l254_c10_1d26_iffalse : vector_snoop_result_t;
 variable VAR_vectors_FALSE_INPUT_MUX_CONST_REF_RD_vector_snoop_result_t_vector_snoop_result_t_9d05_uxn_c_l254_c10_1d26_return_output : vector_snoop_result_t;
 variable VAR_vectors_MUX_uxn_c_l254_c10_1d26_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l255_c4_86e1_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l255_c4_86e1_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l255_c4_86e1_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l256_c4_4a4c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l256_c4_4a4c_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l256_c4_4a4c_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l257_c14_e61c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l257_c14_e61c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l257_c14_e61c_return_output : unsigned(0 downto 0);
 variable VAR_vectors_controller_MUX_uxn_c_l257_c10_addf_iftrue : unsigned(15 downto 0);
 variable VAR_vectors_controller_MUX_uxn_c_l257_c10_addf_iffalse : unsigned(15 downto 0);
 variable VAR_vectors_controller_MUX_uxn_c_l260_c10_608a_return_output : unsigned(15 downto 0);
 variable VAR_vectors_controller_MUX_uxn_c_l257_c10_addf_return_output : unsigned(15 downto 0);
 variable VAR_vectors_controller_MUX_uxn_c_l257_c10_addf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l258_c4_f182_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l258_c4_f182_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l258_c4_f182_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l259_c4_49ad_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l259_c4_49ad_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l259_c4_49ad_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l260_c14_0285_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l260_c14_0285_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l260_c14_0285_return_output : unsigned(0 downto 0);
 variable VAR_vectors_controller_MUX_uxn_c_l260_c10_608a_iftrue : unsigned(15 downto 0);
 variable VAR_vectors_controller_MUX_uxn_c_l260_c10_608a_iffalse : unsigned(15 downto 0);
 variable VAR_vectors_controller_MUX_uxn_c_l260_c10_608a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l261_c4_d111_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l261_c4_d111_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l261_c4_d111_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l262_c4_28bd_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l262_c4_28bd_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l262_c4_28bd_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_vector_snoop_result_t_screen_d41d_uxn_c_l255_l252_DUPLICATE_ed45_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_c_l253_l259_l262_l256_DUPLICATE_e004_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_c_l259_l253_DUPLICATE_5411_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_c_l259_l253_DUPLICATE_5411_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_vector_snoop_result_t_controller_d41d_uxn_c_l260_l258_l261_DUPLICATE_2f9a_return_output : unsigned(15 downto 0);
 -- State registers comb logic variables
variable REG_VAR_vectors : vector_snoop_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_vectors := vectors;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_c_l257_c14_e61c_right := to_unsigned(128, 8);
     VAR_BIN_OP_AND_uxn_c_l255_c4_86e1_right := to_unsigned(65280, 16);
     VAR_BIN_OP_AND_uxn_c_l261_c4_d111_right := to_unsigned(65280, 16);
     VAR_BIN_OP_EQ_uxn_c_l260_c14_0285_right := to_unsigned(129, 8);
     VAR_BIN_OP_AND_uxn_c_l252_c4_cdeb_right := to_unsigned(255, 16);
     VAR_BIN_OP_EQ_uxn_c_l251_c7_bccf_right := to_unsigned(32, 8);
     VAR_BIN_OP_EQ_uxn_c_l254_c14_4d64_right := to_unsigned(33, 8);
     VAR_BIN_OP_AND_uxn_c_l258_c4_f182_right := to_unsigned(255, 16);

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

     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_c_l251_c7_bccf_left := VAR_device_ram_address;
     VAR_BIN_OP_EQ_uxn_c_l254_c14_4d64_left := VAR_device_ram_address;
     VAR_BIN_OP_EQ_uxn_c_l257_c14_e61c_left := VAR_device_ram_address;
     VAR_BIN_OP_EQ_uxn_c_l260_c14_0285_left := VAR_device_ram_address;
     VAR_vectors_MUX_uxn_c_l250_c2_d8ef_cond := VAR_is_device_ram_write;
     VAR_vectors_MUX_uxn_c_l250_c2_d8ef_iffalse := vectors;
     -- CAST_TO_uint16_t_uint8_t_uxn_c_l253_l259_l262_l256_DUPLICATE_e004 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_c_l253_l259_l262_l256_DUPLICATE_e004_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_device_ram_value);

     -- BIN_OP_EQ[uxn_c_l254_c14_4d64] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l254_c14_4d64_left <= VAR_BIN_OP_EQ_uxn_c_l254_c14_4d64_left;
     BIN_OP_EQ_uxn_c_l254_c14_4d64_right <= VAR_BIN_OP_EQ_uxn_c_l254_c14_4d64_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l254_c14_4d64_return_output := BIN_OP_EQ_uxn_c_l254_c14_4d64_return_output;

     -- BIN_OP_EQ[uxn_c_l257_c14_e61c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l257_c14_e61c_left <= VAR_BIN_OP_EQ_uxn_c_l257_c14_e61c_left;
     BIN_OP_EQ_uxn_c_l257_c14_e61c_right <= VAR_BIN_OP_EQ_uxn_c_l257_c14_e61c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l257_c14_e61c_return_output := BIN_OP_EQ_uxn_c_l257_c14_e61c_return_output;

     -- CONST_REF_RD_uint16_t_vector_snoop_result_t_controller_d41d_uxn_c_l260_l258_l261_DUPLICATE_2f9a LATENCY=0
     VAR_CONST_REF_RD_uint16_t_vector_snoop_result_t_controller_d41d_uxn_c_l260_l258_l261_DUPLICATE_2f9a_return_output := vectors.controller;

     -- BIN_OP_EQ[uxn_c_l251_c7_bccf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l251_c7_bccf_left <= VAR_BIN_OP_EQ_uxn_c_l251_c7_bccf_left;
     BIN_OP_EQ_uxn_c_l251_c7_bccf_right <= VAR_BIN_OP_EQ_uxn_c_l251_c7_bccf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l251_c7_bccf_return_output := BIN_OP_EQ_uxn_c_l251_c7_bccf_return_output;

     -- BIN_OP_EQ[uxn_c_l260_c14_0285] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l260_c14_0285_left <= VAR_BIN_OP_EQ_uxn_c_l260_c14_0285_left;
     BIN_OP_EQ_uxn_c_l260_c14_0285_right <= VAR_BIN_OP_EQ_uxn_c_l260_c14_0285_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l260_c14_0285_return_output := BIN_OP_EQ_uxn_c_l260_c14_0285_return_output;

     -- CONST_REF_RD_uint16_t_vector_snoop_result_t_screen_d41d_uxn_c_l255_l252_DUPLICATE_ed45 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_vector_snoop_result_t_screen_d41d_uxn_c_l255_l252_DUPLICATE_ed45_return_output := vectors.screen;

     -- Submodule level 1
     VAR_vectors_MUX_uxn_c_l251_c3_63d1_cond := VAR_BIN_OP_EQ_uxn_c_l251_c7_bccf_return_output;
     VAR_vectors_MUX_uxn_c_l254_c10_1d26_cond := VAR_BIN_OP_EQ_uxn_c_l254_c14_4d64_return_output;
     VAR_vectors_controller_MUX_uxn_c_l257_c10_addf_cond := VAR_BIN_OP_EQ_uxn_c_l257_c14_e61c_return_output;
     VAR_vectors_controller_MUX_uxn_c_l260_c10_608a_cond := VAR_BIN_OP_EQ_uxn_c_l260_c14_0285_return_output;
     VAR_BIN_OP_OR_uxn_c_l256_c4_4a4c_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_c_l253_l259_l262_l256_DUPLICATE_e004_return_output;
     VAR_BIN_OP_OR_uxn_c_l262_c4_28bd_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_c_l253_l259_l262_l256_DUPLICATE_e004_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_c_l259_l253_DUPLICATE_5411_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_c_l253_l259_l262_l256_DUPLICATE_e004_return_output;
     VAR_BIN_OP_AND_uxn_c_l258_c4_f182_left := VAR_CONST_REF_RD_uint16_t_vector_snoop_result_t_controller_d41d_uxn_c_l260_l258_l261_DUPLICATE_2f9a_return_output;
     VAR_BIN_OP_AND_uxn_c_l261_c4_d111_left := VAR_CONST_REF_RD_uint16_t_vector_snoop_result_t_controller_d41d_uxn_c_l260_l258_l261_DUPLICATE_2f9a_return_output;
     VAR_vectors_controller_MUX_uxn_c_l260_c10_608a_iffalse := VAR_CONST_REF_RD_uint16_t_vector_snoop_result_t_controller_d41d_uxn_c_l260_l258_l261_DUPLICATE_2f9a_return_output;
     VAR_BIN_OP_AND_uxn_c_l252_c4_cdeb_left := VAR_CONST_REF_RD_uint16_t_vector_snoop_result_t_screen_d41d_uxn_c_l255_l252_DUPLICATE_ed45_return_output;
     VAR_BIN_OP_AND_uxn_c_l255_c4_86e1_left := VAR_CONST_REF_RD_uint16_t_vector_snoop_result_t_screen_d41d_uxn_c_l255_l252_DUPLICATE_ed45_return_output;
     -- BIN_OP_AND[uxn_c_l255_c4_86e1] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l255_c4_86e1_left <= VAR_BIN_OP_AND_uxn_c_l255_c4_86e1_left;
     BIN_OP_AND_uxn_c_l255_c4_86e1_right <= VAR_BIN_OP_AND_uxn_c_l255_c4_86e1_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l255_c4_86e1_return_output := BIN_OP_AND_uxn_c_l255_c4_86e1_return_output;

     -- CONST_SL_8_uint16_t_uxn_c_l259_l253_DUPLICATE_5411 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_c_l259_l253_DUPLICATE_5411_x <= VAR_CONST_SL_8_uint16_t_uxn_c_l259_l253_DUPLICATE_5411_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_c_l259_l253_DUPLICATE_5411_return_output := CONST_SL_8_uint16_t_uxn_c_l259_l253_DUPLICATE_5411_return_output;

     -- BIN_OP_AND[uxn_c_l258_c4_f182] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l258_c4_f182_left <= VAR_BIN_OP_AND_uxn_c_l258_c4_f182_left;
     BIN_OP_AND_uxn_c_l258_c4_f182_right <= VAR_BIN_OP_AND_uxn_c_l258_c4_f182_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l258_c4_f182_return_output := BIN_OP_AND_uxn_c_l258_c4_f182_return_output;

     -- BIN_OP_AND[uxn_c_l252_c4_cdeb] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l252_c4_cdeb_left <= VAR_BIN_OP_AND_uxn_c_l252_c4_cdeb_left;
     BIN_OP_AND_uxn_c_l252_c4_cdeb_right <= VAR_BIN_OP_AND_uxn_c_l252_c4_cdeb_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l252_c4_cdeb_return_output := BIN_OP_AND_uxn_c_l252_c4_cdeb_return_output;

     -- BIN_OP_AND[uxn_c_l261_c4_d111] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l261_c4_d111_left <= VAR_BIN_OP_AND_uxn_c_l261_c4_d111_left;
     BIN_OP_AND_uxn_c_l261_c4_d111_right <= VAR_BIN_OP_AND_uxn_c_l261_c4_d111_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l261_c4_d111_return_output := BIN_OP_AND_uxn_c_l261_c4_d111_return_output;

     -- Submodule level 2
     VAR_BIN_OP_OR_uxn_c_l253_c4_c2e7_left := VAR_BIN_OP_AND_uxn_c_l252_c4_cdeb_return_output;
     VAR_BIN_OP_OR_uxn_c_l256_c4_4a4c_left := VAR_BIN_OP_AND_uxn_c_l255_c4_86e1_return_output;
     VAR_BIN_OP_OR_uxn_c_l259_c4_49ad_left := VAR_BIN_OP_AND_uxn_c_l258_c4_f182_return_output;
     VAR_BIN_OP_OR_uxn_c_l262_c4_28bd_left := VAR_BIN_OP_AND_uxn_c_l261_c4_d111_return_output;
     VAR_BIN_OP_OR_uxn_c_l253_c4_c2e7_right := VAR_CONST_SL_8_uint16_t_uxn_c_l259_l253_DUPLICATE_5411_return_output;
     VAR_BIN_OP_OR_uxn_c_l259_c4_49ad_right := VAR_CONST_SL_8_uint16_t_uxn_c_l259_l253_DUPLICATE_5411_return_output;
     -- BIN_OP_OR[uxn_c_l253_c4_c2e7] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l253_c4_c2e7_left <= VAR_BIN_OP_OR_uxn_c_l253_c4_c2e7_left;
     BIN_OP_OR_uxn_c_l253_c4_c2e7_right <= VAR_BIN_OP_OR_uxn_c_l253_c4_c2e7_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l253_c4_c2e7_return_output := BIN_OP_OR_uxn_c_l253_c4_c2e7_return_output;

     -- BIN_OP_OR[uxn_c_l259_c4_49ad] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l259_c4_49ad_left <= VAR_BIN_OP_OR_uxn_c_l259_c4_49ad_left;
     BIN_OP_OR_uxn_c_l259_c4_49ad_right <= VAR_BIN_OP_OR_uxn_c_l259_c4_49ad_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l259_c4_49ad_return_output := BIN_OP_OR_uxn_c_l259_c4_49ad_return_output;

     -- BIN_OP_OR[uxn_c_l262_c4_28bd] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l262_c4_28bd_left <= VAR_BIN_OP_OR_uxn_c_l262_c4_28bd_left;
     BIN_OP_OR_uxn_c_l262_c4_28bd_right <= VAR_BIN_OP_OR_uxn_c_l262_c4_28bd_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l262_c4_28bd_return_output := BIN_OP_OR_uxn_c_l262_c4_28bd_return_output;

     -- BIN_OP_OR[uxn_c_l256_c4_4a4c] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l256_c4_4a4c_left <= VAR_BIN_OP_OR_uxn_c_l256_c4_4a4c_left;
     BIN_OP_OR_uxn_c_l256_c4_4a4c_right <= VAR_BIN_OP_OR_uxn_c_l256_c4_4a4c_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l256_c4_4a4c_return_output := BIN_OP_OR_uxn_c_l256_c4_4a4c_return_output;

     -- Submodule level 3
     VAR_vectors_controller_MUX_uxn_c_l257_c10_addf_iftrue := VAR_BIN_OP_OR_uxn_c_l259_c4_49ad_return_output;
     VAR_vectors_controller_MUX_uxn_c_l260_c10_608a_iftrue := VAR_BIN_OP_OR_uxn_c_l262_c4_28bd_return_output;
     -- vectors_TRUE_INPUT_MUX_CONST_REF_RD_vector_snoop_result_t_vector_snoop_result_t_9b02[uxn_c_l251_c3_63d1] LATENCY=0
     VAR_vectors_TRUE_INPUT_MUX_CONST_REF_RD_vector_snoop_result_t_vector_snoop_result_t_9b02_uxn_c_l251_c3_63d1_return_output := CONST_REF_RD_vector_snoop_result_t_vector_snoop_result_t_9b02(
     vectors,
     VAR_BIN_OP_OR_uxn_c_l253_c4_c2e7_return_output);

     -- vectors_controller_MUX[uxn_c_l260_c10_608a] LATENCY=0
     -- Inputs
     vectors_controller_MUX_uxn_c_l260_c10_608a_cond <= VAR_vectors_controller_MUX_uxn_c_l260_c10_608a_cond;
     vectors_controller_MUX_uxn_c_l260_c10_608a_iftrue <= VAR_vectors_controller_MUX_uxn_c_l260_c10_608a_iftrue;
     vectors_controller_MUX_uxn_c_l260_c10_608a_iffalse <= VAR_vectors_controller_MUX_uxn_c_l260_c10_608a_iffalse;
     -- Outputs
     VAR_vectors_controller_MUX_uxn_c_l260_c10_608a_return_output := vectors_controller_MUX_uxn_c_l260_c10_608a_return_output;

     -- vectors_TRUE_INPUT_MUX_CONST_REF_RD_vector_snoop_result_t_vector_snoop_result_t_9b02[uxn_c_l254_c10_1d26] LATENCY=0
     VAR_vectors_TRUE_INPUT_MUX_CONST_REF_RD_vector_snoop_result_t_vector_snoop_result_t_9b02_uxn_c_l254_c10_1d26_return_output := CONST_REF_RD_vector_snoop_result_t_vector_snoop_result_t_9b02(
     vectors,
     VAR_BIN_OP_OR_uxn_c_l256_c4_4a4c_return_output);

     -- Submodule level 4
     VAR_vectors_MUX_uxn_c_l251_c3_63d1_iftrue := VAR_vectors_TRUE_INPUT_MUX_CONST_REF_RD_vector_snoop_result_t_vector_snoop_result_t_9b02_uxn_c_l251_c3_63d1_return_output;
     VAR_vectors_MUX_uxn_c_l254_c10_1d26_iftrue := VAR_vectors_TRUE_INPUT_MUX_CONST_REF_RD_vector_snoop_result_t_vector_snoop_result_t_9b02_uxn_c_l254_c10_1d26_return_output;
     VAR_vectors_controller_MUX_uxn_c_l257_c10_addf_iffalse := VAR_vectors_controller_MUX_uxn_c_l260_c10_608a_return_output;
     -- vectors_controller_MUX[uxn_c_l257_c10_addf] LATENCY=0
     -- Inputs
     vectors_controller_MUX_uxn_c_l257_c10_addf_cond <= VAR_vectors_controller_MUX_uxn_c_l257_c10_addf_cond;
     vectors_controller_MUX_uxn_c_l257_c10_addf_iftrue <= VAR_vectors_controller_MUX_uxn_c_l257_c10_addf_iftrue;
     vectors_controller_MUX_uxn_c_l257_c10_addf_iffalse <= VAR_vectors_controller_MUX_uxn_c_l257_c10_addf_iffalse;
     -- Outputs
     VAR_vectors_controller_MUX_uxn_c_l257_c10_addf_return_output := vectors_controller_MUX_uxn_c_l257_c10_addf_return_output;

     -- Submodule level 5
     -- vectors_FALSE_INPUT_MUX_CONST_REF_RD_vector_snoop_result_t_vector_snoop_result_t_9d05[uxn_c_l254_c10_1d26] LATENCY=0
     VAR_vectors_FALSE_INPUT_MUX_CONST_REF_RD_vector_snoop_result_t_vector_snoop_result_t_9d05_uxn_c_l254_c10_1d26_return_output := CONST_REF_RD_vector_snoop_result_t_vector_snoop_result_t_9d05(
     vectors,
     VAR_vectors_controller_MUX_uxn_c_l257_c10_addf_return_output);

     -- Submodule level 6
     VAR_vectors_MUX_uxn_c_l254_c10_1d26_iffalse := VAR_vectors_FALSE_INPUT_MUX_CONST_REF_RD_vector_snoop_result_t_vector_snoop_result_t_9d05_uxn_c_l254_c10_1d26_return_output;
     -- vectors_MUX[uxn_c_l254_c10_1d26] LATENCY=0
     -- Inputs
     vectors_MUX_uxn_c_l254_c10_1d26_cond <= VAR_vectors_MUX_uxn_c_l254_c10_1d26_cond;
     vectors_MUX_uxn_c_l254_c10_1d26_iftrue <= VAR_vectors_MUX_uxn_c_l254_c10_1d26_iftrue;
     vectors_MUX_uxn_c_l254_c10_1d26_iffalse <= VAR_vectors_MUX_uxn_c_l254_c10_1d26_iffalse;
     -- Outputs
     VAR_vectors_MUX_uxn_c_l254_c10_1d26_return_output := vectors_MUX_uxn_c_l254_c10_1d26_return_output;

     -- Submodule level 7
     VAR_vectors_MUX_uxn_c_l251_c3_63d1_iffalse := VAR_vectors_MUX_uxn_c_l254_c10_1d26_return_output;
     -- vectors_MUX[uxn_c_l251_c3_63d1] LATENCY=0
     -- Inputs
     vectors_MUX_uxn_c_l251_c3_63d1_cond <= VAR_vectors_MUX_uxn_c_l251_c3_63d1_cond;
     vectors_MUX_uxn_c_l251_c3_63d1_iftrue <= VAR_vectors_MUX_uxn_c_l251_c3_63d1_iftrue;
     vectors_MUX_uxn_c_l251_c3_63d1_iffalse <= VAR_vectors_MUX_uxn_c_l251_c3_63d1_iffalse;
     -- Outputs
     VAR_vectors_MUX_uxn_c_l251_c3_63d1_return_output := vectors_MUX_uxn_c_l251_c3_63d1_return_output;

     -- Submodule level 8
     VAR_vectors_MUX_uxn_c_l250_c2_d8ef_iftrue := VAR_vectors_MUX_uxn_c_l251_c3_63d1_return_output;
     -- vectors_MUX[uxn_c_l250_c2_d8ef] LATENCY=0
     -- Inputs
     vectors_MUX_uxn_c_l250_c2_d8ef_cond <= VAR_vectors_MUX_uxn_c_l250_c2_d8ef_cond;
     vectors_MUX_uxn_c_l250_c2_d8ef_iftrue <= VAR_vectors_MUX_uxn_c_l250_c2_d8ef_iftrue;
     vectors_MUX_uxn_c_l250_c2_d8ef_iffalse <= VAR_vectors_MUX_uxn_c_l250_c2_d8ef_iffalse;
     -- Outputs
     VAR_vectors_MUX_uxn_c_l250_c2_d8ef_return_output := vectors_MUX_uxn_c_l250_c2_d8ef_return_output;

     -- Submodule level 9
     VAR_return_output := VAR_vectors_MUX_uxn_c_l250_c2_d8ef_return_output;
     REG_VAR_vectors := VAR_vectors_MUX_uxn_c_l250_c2_d8ef_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_vectors <= REG_VAR_vectors;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     vectors <= REG_COMB_vectors;
 end if;
 end if;
end process;

end arch;
