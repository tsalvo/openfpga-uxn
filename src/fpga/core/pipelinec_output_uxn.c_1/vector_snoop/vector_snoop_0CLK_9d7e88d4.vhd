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
-- vectors_MUX[uxn_c_l249_c2_035f]
signal vectors_MUX_uxn_c_l249_c2_035f_cond : unsigned(0 downto 0);
signal vectors_MUX_uxn_c_l249_c2_035f_iftrue : vector_snoop_result_t;
signal vectors_MUX_uxn_c_l249_c2_035f_iffalse : vector_snoop_result_t;
signal vectors_MUX_uxn_c_l249_c2_035f_return_output : vector_snoop_result_t;

-- BIN_OP_EQ[uxn_c_l250_c7_1c46]
signal BIN_OP_EQ_uxn_c_l250_c7_1c46_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l250_c7_1c46_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l250_c7_1c46_return_output : unsigned(0 downto 0);

-- vectors_MUX[uxn_c_l250_c3_205e]
signal vectors_MUX_uxn_c_l250_c3_205e_cond : unsigned(0 downto 0);
signal vectors_MUX_uxn_c_l250_c3_205e_iftrue : vector_snoop_result_t;
signal vectors_MUX_uxn_c_l250_c3_205e_iffalse : vector_snoop_result_t;
signal vectors_MUX_uxn_c_l250_c3_205e_return_output : vector_snoop_result_t;

-- BIN_OP_AND[uxn_c_l251_c4_86cf]
signal BIN_OP_AND_uxn_c_l251_c4_86cf_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l251_c4_86cf_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l251_c4_86cf_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_c_l252_c4_7063]
signal BIN_OP_OR_uxn_c_l252_c4_7063_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_c_l252_c4_7063_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_c_l252_c4_7063_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l253_c14_459e]
signal BIN_OP_EQ_uxn_c_l253_c14_459e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l253_c14_459e_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l253_c14_459e_return_output : unsigned(0 downto 0);

-- vectors_MUX[uxn_c_l253_c10_097f]
signal vectors_MUX_uxn_c_l253_c10_097f_cond : unsigned(0 downto 0);
signal vectors_MUX_uxn_c_l253_c10_097f_iftrue : vector_snoop_result_t;
signal vectors_MUX_uxn_c_l253_c10_097f_iffalse : vector_snoop_result_t;
signal vectors_MUX_uxn_c_l253_c10_097f_return_output : vector_snoop_result_t;

-- BIN_OP_AND[uxn_c_l254_c4_1b6a]
signal BIN_OP_AND_uxn_c_l254_c4_1b6a_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l254_c4_1b6a_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l254_c4_1b6a_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_c_l255_c4_3cbb]
signal BIN_OP_OR_uxn_c_l255_c4_3cbb_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_c_l255_c4_3cbb_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_c_l255_c4_3cbb_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l256_c14_bb46]
signal BIN_OP_EQ_uxn_c_l256_c14_bb46_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l256_c14_bb46_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l256_c14_bb46_return_output : unsigned(0 downto 0);

-- vectors_controller_MUX[uxn_c_l256_c10_6fb3]
signal vectors_controller_MUX_uxn_c_l256_c10_6fb3_cond : unsigned(0 downto 0);
signal vectors_controller_MUX_uxn_c_l256_c10_6fb3_iftrue : unsigned(15 downto 0);
signal vectors_controller_MUX_uxn_c_l256_c10_6fb3_iffalse : unsigned(15 downto 0);
signal vectors_controller_MUX_uxn_c_l256_c10_6fb3_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_c_l257_c4_d30b]
signal BIN_OP_AND_uxn_c_l257_c4_d30b_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l257_c4_d30b_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l257_c4_d30b_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_c_l258_c4_86ab]
signal BIN_OP_OR_uxn_c_l258_c4_86ab_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_c_l258_c4_86ab_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_c_l258_c4_86ab_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l259_c14_e8fa]
signal BIN_OP_EQ_uxn_c_l259_c14_e8fa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l259_c14_e8fa_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l259_c14_e8fa_return_output : unsigned(0 downto 0);

-- vectors_controller_MUX[uxn_c_l259_c10_d71b]
signal vectors_controller_MUX_uxn_c_l259_c10_d71b_cond : unsigned(0 downto 0);
signal vectors_controller_MUX_uxn_c_l259_c10_d71b_iftrue : unsigned(15 downto 0);
signal vectors_controller_MUX_uxn_c_l259_c10_d71b_iffalse : unsigned(15 downto 0);
signal vectors_controller_MUX_uxn_c_l259_c10_d71b_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_c_l260_c4_dec7]
signal BIN_OP_AND_uxn_c_l260_c4_dec7_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l260_c4_dec7_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l260_c4_dec7_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_c_l261_c4_a63b]
signal BIN_OP_OR_uxn_c_l261_c4_a63b_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_c_l261_c4_a63b_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_c_l261_c4_a63b_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_c_l258_l252_DUPLICATE_1a96
signal CONST_SL_8_uint16_t_uxn_c_l258_l252_DUPLICATE_1a96_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_c_l258_l252_DUPLICATE_1a96_return_output : unsigned(15 downto 0);

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
-- vectors_MUX_uxn_c_l249_c2_035f
vectors_MUX_uxn_c_l249_c2_035f : entity work.MUX_uint1_t_vector_snoop_result_t_vector_snoop_result_t_0CLK_de264c78 port map (
vectors_MUX_uxn_c_l249_c2_035f_cond,
vectors_MUX_uxn_c_l249_c2_035f_iftrue,
vectors_MUX_uxn_c_l249_c2_035f_iffalse,
vectors_MUX_uxn_c_l249_c2_035f_return_output);

-- BIN_OP_EQ_uxn_c_l250_c7_1c46
BIN_OP_EQ_uxn_c_l250_c7_1c46 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l250_c7_1c46_left,
BIN_OP_EQ_uxn_c_l250_c7_1c46_right,
BIN_OP_EQ_uxn_c_l250_c7_1c46_return_output);

-- vectors_MUX_uxn_c_l250_c3_205e
vectors_MUX_uxn_c_l250_c3_205e : entity work.MUX_uint1_t_vector_snoop_result_t_vector_snoop_result_t_0CLK_de264c78 port map (
vectors_MUX_uxn_c_l250_c3_205e_cond,
vectors_MUX_uxn_c_l250_c3_205e_iftrue,
vectors_MUX_uxn_c_l250_c3_205e_iffalse,
vectors_MUX_uxn_c_l250_c3_205e_return_output);

-- BIN_OP_AND_uxn_c_l251_c4_86cf
BIN_OP_AND_uxn_c_l251_c4_86cf : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l251_c4_86cf_left,
BIN_OP_AND_uxn_c_l251_c4_86cf_right,
BIN_OP_AND_uxn_c_l251_c4_86cf_return_output);

-- BIN_OP_OR_uxn_c_l252_c4_7063
BIN_OP_OR_uxn_c_l252_c4_7063 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l252_c4_7063_left,
BIN_OP_OR_uxn_c_l252_c4_7063_right,
BIN_OP_OR_uxn_c_l252_c4_7063_return_output);

-- BIN_OP_EQ_uxn_c_l253_c14_459e
BIN_OP_EQ_uxn_c_l253_c14_459e : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l253_c14_459e_left,
BIN_OP_EQ_uxn_c_l253_c14_459e_right,
BIN_OP_EQ_uxn_c_l253_c14_459e_return_output);

-- vectors_MUX_uxn_c_l253_c10_097f
vectors_MUX_uxn_c_l253_c10_097f : entity work.MUX_uint1_t_vector_snoop_result_t_vector_snoop_result_t_0CLK_de264c78 port map (
vectors_MUX_uxn_c_l253_c10_097f_cond,
vectors_MUX_uxn_c_l253_c10_097f_iftrue,
vectors_MUX_uxn_c_l253_c10_097f_iffalse,
vectors_MUX_uxn_c_l253_c10_097f_return_output);

-- BIN_OP_AND_uxn_c_l254_c4_1b6a
BIN_OP_AND_uxn_c_l254_c4_1b6a : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l254_c4_1b6a_left,
BIN_OP_AND_uxn_c_l254_c4_1b6a_right,
BIN_OP_AND_uxn_c_l254_c4_1b6a_return_output);

-- BIN_OP_OR_uxn_c_l255_c4_3cbb
BIN_OP_OR_uxn_c_l255_c4_3cbb : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l255_c4_3cbb_left,
BIN_OP_OR_uxn_c_l255_c4_3cbb_right,
BIN_OP_OR_uxn_c_l255_c4_3cbb_return_output);

-- BIN_OP_EQ_uxn_c_l256_c14_bb46
BIN_OP_EQ_uxn_c_l256_c14_bb46 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l256_c14_bb46_left,
BIN_OP_EQ_uxn_c_l256_c14_bb46_right,
BIN_OP_EQ_uxn_c_l256_c14_bb46_return_output);

-- vectors_controller_MUX_uxn_c_l256_c10_6fb3
vectors_controller_MUX_uxn_c_l256_c10_6fb3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
vectors_controller_MUX_uxn_c_l256_c10_6fb3_cond,
vectors_controller_MUX_uxn_c_l256_c10_6fb3_iftrue,
vectors_controller_MUX_uxn_c_l256_c10_6fb3_iffalse,
vectors_controller_MUX_uxn_c_l256_c10_6fb3_return_output);

-- BIN_OP_AND_uxn_c_l257_c4_d30b
BIN_OP_AND_uxn_c_l257_c4_d30b : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l257_c4_d30b_left,
BIN_OP_AND_uxn_c_l257_c4_d30b_right,
BIN_OP_AND_uxn_c_l257_c4_d30b_return_output);

-- BIN_OP_OR_uxn_c_l258_c4_86ab
BIN_OP_OR_uxn_c_l258_c4_86ab : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l258_c4_86ab_left,
BIN_OP_OR_uxn_c_l258_c4_86ab_right,
BIN_OP_OR_uxn_c_l258_c4_86ab_return_output);

-- BIN_OP_EQ_uxn_c_l259_c14_e8fa
BIN_OP_EQ_uxn_c_l259_c14_e8fa : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l259_c14_e8fa_left,
BIN_OP_EQ_uxn_c_l259_c14_e8fa_right,
BIN_OP_EQ_uxn_c_l259_c14_e8fa_return_output);

-- vectors_controller_MUX_uxn_c_l259_c10_d71b
vectors_controller_MUX_uxn_c_l259_c10_d71b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
vectors_controller_MUX_uxn_c_l259_c10_d71b_cond,
vectors_controller_MUX_uxn_c_l259_c10_d71b_iftrue,
vectors_controller_MUX_uxn_c_l259_c10_d71b_iffalse,
vectors_controller_MUX_uxn_c_l259_c10_d71b_return_output);

-- BIN_OP_AND_uxn_c_l260_c4_dec7
BIN_OP_AND_uxn_c_l260_c4_dec7 : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l260_c4_dec7_left,
BIN_OP_AND_uxn_c_l260_c4_dec7_right,
BIN_OP_AND_uxn_c_l260_c4_dec7_return_output);

-- BIN_OP_OR_uxn_c_l261_c4_a63b
BIN_OP_OR_uxn_c_l261_c4_a63b : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l261_c4_a63b_left,
BIN_OP_OR_uxn_c_l261_c4_a63b_right,
BIN_OP_OR_uxn_c_l261_c4_a63b_return_output);

-- CONST_SL_8_uint16_t_uxn_c_l258_l252_DUPLICATE_1a96
CONST_SL_8_uint16_t_uxn_c_l258_l252_DUPLICATE_1a96 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_c_l258_l252_DUPLICATE_1a96_x,
CONST_SL_8_uint16_t_uxn_c_l258_l252_DUPLICATE_1a96_return_output);



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
 vectors_MUX_uxn_c_l249_c2_035f_return_output,
 BIN_OP_EQ_uxn_c_l250_c7_1c46_return_output,
 vectors_MUX_uxn_c_l250_c3_205e_return_output,
 BIN_OP_AND_uxn_c_l251_c4_86cf_return_output,
 BIN_OP_OR_uxn_c_l252_c4_7063_return_output,
 BIN_OP_EQ_uxn_c_l253_c14_459e_return_output,
 vectors_MUX_uxn_c_l253_c10_097f_return_output,
 BIN_OP_AND_uxn_c_l254_c4_1b6a_return_output,
 BIN_OP_OR_uxn_c_l255_c4_3cbb_return_output,
 BIN_OP_EQ_uxn_c_l256_c14_bb46_return_output,
 vectors_controller_MUX_uxn_c_l256_c10_6fb3_return_output,
 BIN_OP_AND_uxn_c_l257_c4_d30b_return_output,
 BIN_OP_OR_uxn_c_l258_c4_86ab_return_output,
 BIN_OP_EQ_uxn_c_l259_c14_e8fa_return_output,
 vectors_controller_MUX_uxn_c_l259_c10_d71b_return_output,
 BIN_OP_AND_uxn_c_l260_c4_dec7_return_output,
 BIN_OP_OR_uxn_c_l261_c4_a63b_return_output,
 CONST_SL_8_uint16_t_uxn_c_l258_l252_DUPLICATE_1a96_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : vector_snoop_result_t;
 variable VAR_device_ram_address : unsigned(7 downto 0);
 variable VAR_device_ram_value : unsigned(7 downto 0);
 variable VAR_is_device_ram_write : unsigned(0 downto 0);
 variable VAR_vectors_MUX_uxn_c_l249_c2_035f_iftrue : vector_snoop_result_t;
 variable VAR_vectors_MUX_uxn_c_l250_c3_205e_return_output : vector_snoop_result_t;
 variable VAR_vectors_MUX_uxn_c_l249_c2_035f_iffalse : vector_snoop_result_t;
 variable VAR_vectors_MUX_uxn_c_l249_c2_035f_return_output : vector_snoop_result_t;
 variable VAR_vectors_MUX_uxn_c_l249_c2_035f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l250_c7_1c46_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l250_c7_1c46_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l250_c7_1c46_return_output : unsigned(0 downto 0);
 variable VAR_vectors_MUX_uxn_c_l250_c3_205e_iftrue : vector_snoop_result_t;
 variable VAR_vectors_TRUE_INPUT_MUX_CONST_REF_RD_vector_snoop_result_t_vector_snoop_result_t_9b02_uxn_c_l250_c3_205e_return_output : vector_snoop_result_t;
 variable VAR_vectors_MUX_uxn_c_l250_c3_205e_iffalse : vector_snoop_result_t;
 variable VAR_vectors_MUX_uxn_c_l253_c10_097f_return_output : vector_snoop_result_t;
 variable VAR_vectors_MUX_uxn_c_l250_c3_205e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l251_c4_86cf_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l251_c4_86cf_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l251_c4_86cf_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l252_c4_7063_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l252_c4_7063_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l252_c4_7063_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l253_c14_459e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l253_c14_459e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l253_c14_459e_return_output : unsigned(0 downto 0);
 variable VAR_vectors_MUX_uxn_c_l253_c10_097f_iftrue : vector_snoop_result_t;
 variable VAR_vectors_TRUE_INPUT_MUX_CONST_REF_RD_vector_snoop_result_t_vector_snoop_result_t_9b02_uxn_c_l253_c10_097f_return_output : vector_snoop_result_t;
 variable VAR_vectors_MUX_uxn_c_l253_c10_097f_iffalse : vector_snoop_result_t;
 variable VAR_vectors_FALSE_INPUT_MUX_CONST_REF_RD_vector_snoop_result_t_vector_snoop_result_t_9d05_uxn_c_l253_c10_097f_return_output : vector_snoop_result_t;
 variable VAR_vectors_MUX_uxn_c_l253_c10_097f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l254_c4_1b6a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l254_c4_1b6a_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l254_c4_1b6a_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l255_c4_3cbb_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l255_c4_3cbb_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l255_c4_3cbb_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l256_c14_bb46_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l256_c14_bb46_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l256_c14_bb46_return_output : unsigned(0 downto 0);
 variable VAR_vectors_controller_MUX_uxn_c_l256_c10_6fb3_iftrue : unsigned(15 downto 0);
 variable VAR_vectors_controller_MUX_uxn_c_l256_c10_6fb3_iffalse : unsigned(15 downto 0);
 variable VAR_vectors_controller_MUX_uxn_c_l259_c10_d71b_return_output : unsigned(15 downto 0);
 variable VAR_vectors_controller_MUX_uxn_c_l256_c10_6fb3_return_output : unsigned(15 downto 0);
 variable VAR_vectors_controller_MUX_uxn_c_l256_c10_6fb3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l257_c4_d30b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l257_c4_d30b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l257_c4_d30b_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l258_c4_86ab_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l258_c4_86ab_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l258_c4_86ab_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l259_c14_e8fa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l259_c14_e8fa_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l259_c14_e8fa_return_output : unsigned(0 downto 0);
 variable VAR_vectors_controller_MUX_uxn_c_l259_c10_d71b_iftrue : unsigned(15 downto 0);
 variable VAR_vectors_controller_MUX_uxn_c_l259_c10_d71b_iffalse : unsigned(15 downto 0);
 variable VAR_vectors_controller_MUX_uxn_c_l259_c10_d71b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l260_c4_dec7_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l260_c4_dec7_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l260_c4_dec7_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l261_c4_a63b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l261_c4_a63b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l261_c4_a63b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_vector_snoop_result_t_screen_d41d_uxn_c_l254_l251_DUPLICATE_028e_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_c_l255_l252_l261_l258_DUPLICATE_a340_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_c_l258_l252_DUPLICATE_1a96_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_c_l258_l252_DUPLICATE_1a96_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_vector_snoop_result_t_controller_d41d_uxn_c_l260_l259_l257_DUPLICATE_1e9a_return_output : unsigned(15 downto 0);
 -- State registers comb logic variables
variable REG_VAR_vectors : vector_snoop_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_vectors := vectors;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_AND_uxn_c_l251_c4_86cf_right := to_unsigned(255, 16);
     VAR_BIN_OP_EQ_uxn_c_l253_c14_459e_right := to_unsigned(33, 8);
     VAR_BIN_OP_EQ_uxn_c_l250_c7_1c46_right := to_unsigned(32, 8);
     VAR_BIN_OP_AND_uxn_c_l257_c4_d30b_right := to_unsigned(255, 16);
     VAR_BIN_OP_EQ_uxn_c_l259_c14_e8fa_right := to_unsigned(129, 8);
     VAR_BIN_OP_AND_uxn_c_l254_c4_1b6a_right := to_unsigned(65280, 16);
     VAR_BIN_OP_AND_uxn_c_l260_c4_dec7_right := to_unsigned(65280, 16);
     VAR_BIN_OP_EQ_uxn_c_l256_c14_bb46_right := to_unsigned(128, 8);

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
     VAR_BIN_OP_EQ_uxn_c_l250_c7_1c46_left := VAR_device_ram_address;
     VAR_BIN_OP_EQ_uxn_c_l253_c14_459e_left := VAR_device_ram_address;
     VAR_BIN_OP_EQ_uxn_c_l256_c14_bb46_left := VAR_device_ram_address;
     VAR_BIN_OP_EQ_uxn_c_l259_c14_e8fa_left := VAR_device_ram_address;
     VAR_vectors_MUX_uxn_c_l249_c2_035f_cond := VAR_is_device_ram_write;
     VAR_vectors_MUX_uxn_c_l249_c2_035f_iffalse := vectors;
     -- CONST_REF_RD_uint16_t_vector_snoop_result_t_screen_d41d_uxn_c_l254_l251_DUPLICATE_028e LATENCY=0
     VAR_CONST_REF_RD_uint16_t_vector_snoop_result_t_screen_d41d_uxn_c_l254_l251_DUPLICATE_028e_return_output := vectors.screen;

     -- BIN_OP_EQ[uxn_c_l259_c14_e8fa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l259_c14_e8fa_left <= VAR_BIN_OP_EQ_uxn_c_l259_c14_e8fa_left;
     BIN_OP_EQ_uxn_c_l259_c14_e8fa_right <= VAR_BIN_OP_EQ_uxn_c_l259_c14_e8fa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l259_c14_e8fa_return_output := BIN_OP_EQ_uxn_c_l259_c14_e8fa_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_c_l255_l252_l261_l258_DUPLICATE_a340 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_c_l255_l252_l261_l258_DUPLICATE_a340_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_device_ram_value);

     -- CONST_REF_RD_uint16_t_vector_snoop_result_t_controller_d41d_uxn_c_l260_l259_l257_DUPLICATE_1e9a LATENCY=0
     VAR_CONST_REF_RD_uint16_t_vector_snoop_result_t_controller_d41d_uxn_c_l260_l259_l257_DUPLICATE_1e9a_return_output := vectors.controller;

     -- BIN_OP_EQ[uxn_c_l256_c14_bb46] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l256_c14_bb46_left <= VAR_BIN_OP_EQ_uxn_c_l256_c14_bb46_left;
     BIN_OP_EQ_uxn_c_l256_c14_bb46_right <= VAR_BIN_OP_EQ_uxn_c_l256_c14_bb46_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l256_c14_bb46_return_output := BIN_OP_EQ_uxn_c_l256_c14_bb46_return_output;

     -- BIN_OP_EQ[uxn_c_l253_c14_459e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l253_c14_459e_left <= VAR_BIN_OP_EQ_uxn_c_l253_c14_459e_left;
     BIN_OP_EQ_uxn_c_l253_c14_459e_right <= VAR_BIN_OP_EQ_uxn_c_l253_c14_459e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l253_c14_459e_return_output := BIN_OP_EQ_uxn_c_l253_c14_459e_return_output;

     -- BIN_OP_EQ[uxn_c_l250_c7_1c46] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l250_c7_1c46_left <= VAR_BIN_OP_EQ_uxn_c_l250_c7_1c46_left;
     BIN_OP_EQ_uxn_c_l250_c7_1c46_right <= VAR_BIN_OP_EQ_uxn_c_l250_c7_1c46_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l250_c7_1c46_return_output := BIN_OP_EQ_uxn_c_l250_c7_1c46_return_output;

     -- Submodule level 1
     VAR_vectors_MUX_uxn_c_l250_c3_205e_cond := VAR_BIN_OP_EQ_uxn_c_l250_c7_1c46_return_output;
     VAR_vectors_MUX_uxn_c_l253_c10_097f_cond := VAR_BIN_OP_EQ_uxn_c_l253_c14_459e_return_output;
     VAR_vectors_controller_MUX_uxn_c_l256_c10_6fb3_cond := VAR_BIN_OP_EQ_uxn_c_l256_c14_bb46_return_output;
     VAR_vectors_controller_MUX_uxn_c_l259_c10_d71b_cond := VAR_BIN_OP_EQ_uxn_c_l259_c14_e8fa_return_output;
     VAR_BIN_OP_OR_uxn_c_l255_c4_3cbb_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_c_l255_l252_l261_l258_DUPLICATE_a340_return_output;
     VAR_BIN_OP_OR_uxn_c_l261_c4_a63b_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_c_l255_l252_l261_l258_DUPLICATE_a340_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_c_l258_l252_DUPLICATE_1a96_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_c_l255_l252_l261_l258_DUPLICATE_a340_return_output;
     VAR_BIN_OP_AND_uxn_c_l257_c4_d30b_left := VAR_CONST_REF_RD_uint16_t_vector_snoop_result_t_controller_d41d_uxn_c_l260_l259_l257_DUPLICATE_1e9a_return_output;
     VAR_BIN_OP_AND_uxn_c_l260_c4_dec7_left := VAR_CONST_REF_RD_uint16_t_vector_snoop_result_t_controller_d41d_uxn_c_l260_l259_l257_DUPLICATE_1e9a_return_output;
     VAR_vectors_controller_MUX_uxn_c_l259_c10_d71b_iffalse := VAR_CONST_REF_RD_uint16_t_vector_snoop_result_t_controller_d41d_uxn_c_l260_l259_l257_DUPLICATE_1e9a_return_output;
     VAR_BIN_OP_AND_uxn_c_l251_c4_86cf_left := VAR_CONST_REF_RD_uint16_t_vector_snoop_result_t_screen_d41d_uxn_c_l254_l251_DUPLICATE_028e_return_output;
     VAR_BIN_OP_AND_uxn_c_l254_c4_1b6a_left := VAR_CONST_REF_RD_uint16_t_vector_snoop_result_t_screen_d41d_uxn_c_l254_l251_DUPLICATE_028e_return_output;
     -- BIN_OP_AND[uxn_c_l251_c4_86cf] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l251_c4_86cf_left <= VAR_BIN_OP_AND_uxn_c_l251_c4_86cf_left;
     BIN_OP_AND_uxn_c_l251_c4_86cf_right <= VAR_BIN_OP_AND_uxn_c_l251_c4_86cf_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l251_c4_86cf_return_output := BIN_OP_AND_uxn_c_l251_c4_86cf_return_output;

     -- BIN_OP_AND[uxn_c_l254_c4_1b6a] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l254_c4_1b6a_left <= VAR_BIN_OP_AND_uxn_c_l254_c4_1b6a_left;
     BIN_OP_AND_uxn_c_l254_c4_1b6a_right <= VAR_BIN_OP_AND_uxn_c_l254_c4_1b6a_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l254_c4_1b6a_return_output := BIN_OP_AND_uxn_c_l254_c4_1b6a_return_output;

     -- CONST_SL_8_uint16_t_uxn_c_l258_l252_DUPLICATE_1a96 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_c_l258_l252_DUPLICATE_1a96_x <= VAR_CONST_SL_8_uint16_t_uxn_c_l258_l252_DUPLICATE_1a96_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_c_l258_l252_DUPLICATE_1a96_return_output := CONST_SL_8_uint16_t_uxn_c_l258_l252_DUPLICATE_1a96_return_output;

     -- BIN_OP_AND[uxn_c_l260_c4_dec7] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l260_c4_dec7_left <= VAR_BIN_OP_AND_uxn_c_l260_c4_dec7_left;
     BIN_OP_AND_uxn_c_l260_c4_dec7_right <= VAR_BIN_OP_AND_uxn_c_l260_c4_dec7_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l260_c4_dec7_return_output := BIN_OP_AND_uxn_c_l260_c4_dec7_return_output;

     -- BIN_OP_AND[uxn_c_l257_c4_d30b] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l257_c4_d30b_left <= VAR_BIN_OP_AND_uxn_c_l257_c4_d30b_left;
     BIN_OP_AND_uxn_c_l257_c4_d30b_right <= VAR_BIN_OP_AND_uxn_c_l257_c4_d30b_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l257_c4_d30b_return_output := BIN_OP_AND_uxn_c_l257_c4_d30b_return_output;

     -- Submodule level 2
     VAR_BIN_OP_OR_uxn_c_l252_c4_7063_left := VAR_BIN_OP_AND_uxn_c_l251_c4_86cf_return_output;
     VAR_BIN_OP_OR_uxn_c_l255_c4_3cbb_left := VAR_BIN_OP_AND_uxn_c_l254_c4_1b6a_return_output;
     VAR_BIN_OP_OR_uxn_c_l258_c4_86ab_left := VAR_BIN_OP_AND_uxn_c_l257_c4_d30b_return_output;
     VAR_BIN_OP_OR_uxn_c_l261_c4_a63b_left := VAR_BIN_OP_AND_uxn_c_l260_c4_dec7_return_output;
     VAR_BIN_OP_OR_uxn_c_l252_c4_7063_right := VAR_CONST_SL_8_uint16_t_uxn_c_l258_l252_DUPLICATE_1a96_return_output;
     VAR_BIN_OP_OR_uxn_c_l258_c4_86ab_right := VAR_CONST_SL_8_uint16_t_uxn_c_l258_l252_DUPLICATE_1a96_return_output;
     -- BIN_OP_OR[uxn_c_l252_c4_7063] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l252_c4_7063_left <= VAR_BIN_OP_OR_uxn_c_l252_c4_7063_left;
     BIN_OP_OR_uxn_c_l252_c4_7063_right <= VAR_BIN_OP_OR_uxn_c_l252_c4_7063_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l252_c4_7063_return_output := BIN_OP_OR_uxn_c_l252_c4_7063_return_output;

     -- BIN_OP_OR[uxn_c_l255_c4_3cbb] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l255_c4_3cbb_left <= VAR_BIN_OP_OR_uxn_c_l255_c4_3cbb_left;
     BIN_OP_OR_uxn_c_l255_c4_3cbb_right <= VAR_BIN_OP_OR_uxn_c_l255_c4_3cbb_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l255_c4_3cbb_return_output := BIN_OP_OR_uxn_c_l255_c4_3cbb_return_output;

     -- BIN_OP_OR[uxn_c_l261_c4_a63b] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l261_c4_a63b_left <= VAR_BIN_OP_OR_uxn_c_l261_c4_a63b_left;
     BIN_OP_OR_uxn_c_l261_c4_a63b_right <= VAR_BIN_OP_OR_uxn_c_l261_c4_a63b_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l261_c4_a63b_return_output := BIN_OP_OR_uxn_c_l261_c4_a63b_return_output;

     -- BIN_OP_OR[uxn_c_l258_c4_86ab] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l258_c4_86ab_left <= VAR_BIN_OP_OR_uxn_c_l258_c4_86ab_left;
     BIN_OP_OR_uxn_c_l258_c4_86ab_right <= VAR_BIN_OP_OR_uxn_c_l258_c4_86ab_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l258_c4_86ab_return_output := BIN_OP_OR_uxn_c_l258_c4_86ab_return_output;

     -- Submodule level 3
     VAR_vectors_controller_MUX_uxn_c_l256_c10_6fb3_iftrue := VAR_BIN_OP_OR_uxn_c_l258_c4_86ab_return_output;
     VAR_vectors_controller_MUX_uxn_c_l259_c10_d71b_iftrue := VAR_BIN_OP_OR_uxn_c_l261_c4_a63b_return_output;
     -- vectors_TRUE_INPUT_MUX_CONST_REF_RD_vector_snoop_result_t_vector_snoop_result_t_9b02[uxn_c_l253_c10_097f] LATENCY=0
     VAR_vectors_TRUE_INPUT_MUX_CONST_REF_RD_vector_snoop_result_t_vector_snoop_result_t_9b02_uxn_c_l253_c10_097f_return_output := CONST_REF_RD_vector_snoop_result_t_vector_snoop_result_t_9b02(
     vectors,
     VAR_BIN_OP_OR_uxn_c_l255_c4_3cbb_return_output);

     -- vectors_TRUE_INPUT_MUX_CONST_REF_RD_vector_snoop_result_t_vector_snoop_result_t_9b02[uxn_c_l250_c3_205e] LATENCY=0
     VAR_vectors_TRUE_INPUT_MUX_CONST_REF_RD_vector_snoop_result_t_vector_snoop_result_t_9b02_uxn_c_l250_c3_205e_return_output := CONST_REF_RD_vector_snoop_result_t_vector_snoop_result_t_9b02(
     vectors,
     VAR_BIN_OP_OR_uxn_c_l252_c4_7063_return_output);

     -- vectors_controller_MUX[uxn_c_l259_c10_d71b] LATENCY=0
     -- Inputs
     vectors_controller_MUX_uxn_c_l259_c10_d71b_cond <= VAR_vectors_controller_MUX_uxn_c_l259_c10_d71b_cond;
     vectors_controller_MUX_uxn_c_l259_c10_d71b_iftrue <= VAR_vectors_controller_MUX_uxn_c_l259_c10_d71b_iftrue;
     vectors_controller_MUX_uxn_c_l259_c10_d71b_iffalse <= VAR_vectors_controller_MUX_uxn_c_l259_c10_d71b_iffalse;
     -- Outputs
     VAR_vectors_controller_MUX_uxn_c_l259_c10_d71b_return_output := vectors_controller_MUX_uxn_c_l259_c10_d71b_return_output;

     -- Submodule level 4
     VAR_vectors_MUX_uxn_c_l250_c3_205e_iftrue := VAR_vectors_TRUE_INPUT_MUX_CONST_REF_RD_vector_snoop_result_t_vector_snoop_result_t_9b02_uxn_c_l250_c3_205e_return_output;
     VAR_vectors_MUX_uxn_c_l253_c10_097f_iftrue := VAR_vectors_TRUE_INPUT_MUX_CONST_REF_RD_vector_snoop_result_t_vector_snoop_result_t_9b02_uxn_c_l253_c10_097f_return_output;
     VAR_vectors_controller_MUX_uxn_c_l256_c10_6fb3_iffalse := VAR_vectors_controller_MUX_uxn_c_l259_c10_d71b_return_output;
     -- vectors_controller_MUX[uxn_c_l256_c10_6fb3] LATENCY=0
     -- Inputs
     vectors_controller_MUX_uxn_c_l256_c10_6fb3_cond <= VAR_vectors_controller_MUX_uxn_c_l256_c10_6fb3_cond;
     vectors_controller_MUX_uxn_c_l256_c10_6fb3_iftrue <= VAR_vectors_controller_MUX_uxn_c_l256_c10_6fb3_iftrue;
     vectors_controller_MUX_uxn_c_l256_c10_6fb3_iffalse <= VAR_vectors_controller_MUX_uxn_c_l256_c10_6fb3_iffalse;
     -- Outputs
     VAR_vectors_controller_MUX_uxn_c_l256_c10_6fb3_return_output := vectors_controller_MUX_uxn_c_l256_c10_6fb3_return_output;

     -- Submodule level 5
     -- vectors_FALSE_INPUT_MUX_CONST_REF_RD_vector_snoop_result_t_vector_snoop_result_t_9d05[uxn_c_l253_c10_097f] LATENCY=0
     VAR_vectors_FALSE_INPUT_MUX_CONST_REF_RD_vector_snoop_result_t_vector_snoop_result_t_9d05_uxn_c_l253_c10_097f_return_output := CONST_REF_RD_vector_snoop_result_t_vector_snoop_result_t_9d05(
     vectors,
     VAR_vectors_controller_MUX_uxn_c_l256_c10_6fb3_return_output);

     -- Submodule level 6
     VAR_vectors_MUX_uxn_c_l253_c10_097f_iffalse := VAR_vectors_FALSE_INPUT_MUX_CONST_REF_RD_vector_snoop_result_t_vector_snoop_result_t_9d05_uxn_c_l253_c10_097f_return_output;
     -- vectors_MUX[uxn_c_l253_c10_097f] LATENCY=0
     -- Inputs
     vectors_MUX_uxn_c_l253_c10_097f_cond <= VAR_vectors_MUX_uxn_c_l253_c10_097f_cond;
     vectors_MUX_uxn_c_l253_c10_097f_iftrue <= VAR_vectors_MUX_uxn_c_l253_c10_097f_iftrue;
     vectors_MUX_uxn_c_l253_c10_097f_iffalse <= VAR_vectors_MUX_uxn_c_l253_c10_097f_iffalse;
     -- Outputs
     VAR_vectors_MUX_uxn_c_l253_c10_097f_return_output := vectors_MUX_uxn_c_l253_c10_097f_return_output;

     -- Submodule level 7
     VAR_vectors_MUX_uxn_c_l250_c3_205e_iffalse := VAR_vectors_MUX_uxn_c_l253_c10_097f_return_output;
     -- vectors_MUX[uxn_c_l250_c3_205e] LATENCY=0
     -- Inputs
     vectors_MUX_uxn_c_l250_c3_205e_cond <= VAR_vectors_MUX_uxn_c_l250_c3_205e_cond;
     vectors_MUX_uxn_c_l250_c3_205e_iftrue <= VAR_vectors_MUX_uxn_c_l250_c3_205e_iftrue;
     vectors_MUX_uxn_c_l250_c3_205e_iffalse <= VAR_vectors_MUX_uxn_c_l250_c3_205e_iffalse;
     -- Outputs
     VAR_vectors_MUX_uxn_c_l250_c3_205e_return_output := vectors_MUX_uxn_c_l250_c3_205e_return_output;

     -- Submodule level 8
     VAR_vectors_MUX_uxn_c_l249_c2_035f_iftrue := VAR_vectors_MUX_uxn_c_l250_c3_205e_return_output;
     -- vectors_MUX[uxn_c_l249_c2_035f] LATENCY=0
     -- Inputs
     vectors_MUX_uxn_c_l249_c2_035f_cond <= VAR_vectors_MUX_uxn_c_l249_c2_035f_cond;
     vectors_MUX_uxn_c_l249_c2_035f_iftrue <= VAR_vectors_MUX_uxn_c_l249_c2_035f_iftrue;
     vectors_MUX_uxn_c_l249_c2_035f_iffalse <= VAR_vectors_MUX_uxn_c_l249_c2_035f_iffalse;
     -- Outputs
     VAR_vectors_MUX_uxn_c_l249_c2_035f_return_output := vectors_MUX_uxn_c_l249_c2_035f_return_output;

     -- Submodule level 9
     VAR_return_output := VAR_vectors_MUX_uxn_c_l249_c2_035f_return_output;
     REG_VAR_vectors := VAR_vectors_MUX_uxn_c_l249_c2_035f_return_output;
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
