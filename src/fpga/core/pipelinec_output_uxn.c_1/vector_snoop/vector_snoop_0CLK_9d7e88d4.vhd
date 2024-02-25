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
-- vectors_MUX[uxn_c_l249_c2_7e77]
signal vectors_MUX_uxn_c_l249_c2_7e77_cond : unsigned(0 downto 0);
signal vectors_MUX_uxn_c_l249_c2_7e77_iftrue : vector_snoop_result_t;
signal vectors_MUX_uxn_c_l249_c2_7e77_iffalse : vector_snoop_result_t;
signal vectors_MUX_uxn_c_l249_c2_7e77_return_output : vector_snoop_result_t;

-- BIN_OP_EQ[uxn_c_l250_c7_56e8]
signal BIN_OP_EQ_uxn_c_l250_c7_56e8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l250_c7_56e8_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l250_c7_56e8_return_output : unsigned(0 downto 0);

-- vectors_MUX[uxn_c_l250_c3_3101]
signal vectors_MUX_uxn_c_l250_c3_3101_cond : unsigned(0 downto 0);
signal vectors_MUX_uxn_c_l250_c3_3101_iftrue : vector_snoop_result_t;
signal vectors_MUX_uxn_c_l250_c3_3101_iffalse : vector_snoop_result_t;
signal vectors_MUX_uxn_c_l250_c3_3101_return_output : vector_snoop_result_t;

-- BIN_OP_AND[uxn_c_l251_c4_d399]
signal BIN_OP_AND_uxn_c_l251_c4_d399_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l251_c4_d399_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l251_c4_d399_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_c_l252_c4_db14]
signal BIN_OP_OR_uxn_c_l252_c4_db14_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_c_l252_c4_db14_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_c_l252_c4_db14_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l253_c14_1443]
signal BIN_OP_EQ_uxn_c_l253_c14_1443_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l253_c14_1443_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l253_c14_1443_return_output : unsigned(0 downto 0);

-- vectors_MUX[uxn_c_l253_c10_538b]
signal vectors_MUX_uxn_c_l253_c10_538b_cond : unsigned(0 downto 0);
signal vectors_MUX_uxn_c_l253_c10_538b_iftrue : vector_snoop_result_t;
signal vectors_MUX_uxn_c_l253_c10_538b_iffalse : vector_snoop_result_t;
signal vectors_MUX_uxn_c_l253_c10_538b_return_output : vector_snoop_result_t;

-- BIN_OP_AND[uxn_c_l254_c4_5242]
signal BIN_OP_AND_uxn_c_l254_c4_5242_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l254_c4_5242_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l254_c4_5242_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_c_l255_c4_2ac5]
signal BIN_OP_OR_uxn_c_l255_c4_2ac5_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_c_l255_c4_2ac5_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_c_l255_c4_2ac5_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l256_c14_dad4]
signal BIN_OP_EQ_uxn_c_l256_c14_dad4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l256_c14_dad4_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l256_c14_dad4_return_output : unsigned(0 downto 0);

-- vectors_controller_MUX[uxn_c_l256_c10_4382]
signal vectors_controller_MUX_uxn_c_l256_c10_4382_cond : unsigned(0 downto 0);
signal vectors_controller_MUX_uxn_c_l256_c10_4382_iftrue : unsigned(15 downto 0);
signal vectors_controller_MUX_uxn_c_l256_c10_4382_iffalse : unsigned(15 downto 0);
signal vectors_controller_MUX_uxn_c_l256_c10_4382_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_c_l257_c4_5fb5]
signal BIN_OP_AND_uxn_c_l257_c4_5fb5_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l257_c4_5fb5_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l257_c4_5fb5_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_c_l258_c4_eb54]
signal BIN_OP_OR_uxn_c_l258_c4_eb54_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_c_l258_c4_eb54_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_c_l258_c4_eb54_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l259_c14_e3b2]
signal BIN_OP_EQ_uxn_c_l259_c14_e3b2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l259_c14_e3b2_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l259_c14_e3b2_return_output : unsigned(0 downto 0);

-- vectors_controller_MUX[uxn_c_l259_c10_bfae]
signal vectors_controller_MUX_uxn_c_l259_c10_bfae_cond : unsigned(0 downto 0);
signal vectors_controller_MUX_uxn_c_l259_c10_bfae_iftrue : unsigned(15 downto 0);
signal vectors_controller_MUX_uxn_c_l259_c10_bfae_iffalse : unsigned(15 downto 0);
signal vectors_controller_MUX_uxn_c_l259_c10_bfae_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_c_l260_c4_ee5d]
signal BIN_OP_AND_uxn_c_l260_c4_ee5d_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l260_c4_ee5d_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l260_c4_ee5d_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_c_l261_c4_c088]
signal BIN_OP_OR_uxn_c_l261_c4_c088_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_c_l261_c4_c088_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_c_l261_c4_c088_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_c_l258_l252_DUPLICATE_0a26
signal CONST_SL_8_uint16_t_uxn_c_l258_l252_DUPLICATE_0a26_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_c_l258_l252_DUPLICATE_0a26_return_output : unsigned(15 downto 0);

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
-- vectors_MUX_uxn_c_l249_c2_7e77
vectors_MUX_uxn_c_l249_c2_7e77 : entity work.MUX_uint1_t_vector_snoop_result_t_vector_snoop_result_t_0CLK_de264c78 port map (
vectors_MUX_uxn_c_l249_c2_7e77_cond,
vectors_MUX_uxn_c_l249_c2_7e77_iftrue,
vectors_MUX_uxn_c_l249_c2_7e77_iffalse,
vectors_MUX_uxn_c_l249_c2_7e77_return_output);

-- BIN_OP_EQ_uxn_c_l250_c7_56e8
BIN_OP_EQ_uxn_c_l250_c7_56e8 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l250_c7_56e8_left,
BIN_OP_EQ_uxn_c_l250_c7_56e8_right,
BIN_OP_EQ_uxn_c_l250_c7_56e8_return_output);

-- vectors_MUX_uxn_c_l250_c3_3101
vectors_MUX_uxn_c_l250_c3_3101 : entity work.MUX_uint1_t_vector_snoop_result_t_vector_snoop_result_t_0CLK_de264c78 port map (
vectors_MUX_uxn_c_l250_c3_3101_cond,
vectors_MUX_uxn_c_l250_c3_3101_iftrue,
vectors_MUX_uxn_c_l250_c3_3101_iffalse,
vectors_MUX_uxn_c_l250_c3_3101_return_output);

-- BIN_OP_AND_uxn_c_l251_c4_d399
BIN_OP_AND_uxn_c_l251_c4_d399 : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l251_c4_d399_left,
BIN_OP_AND_uxn_c_l251_c4_d399_right,
BIN_OP_AND_uxn_c_l251_c4_d399_return_output);

-- BIN_OP_OR_uxn_c_l252_c4_db14
BIN_OP_OR_uxn_c_l252_c4_db14 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l252_c4_db14_left,
BIN_OP_OR_uxn_c_l252_c4_db14_right,
BIN_OP_OR_uxn_c_l252_c4_db14_return_output);

-- BIN_OP_EQ_uxn_c_l253_c14_1443
BIN_OP_EQ_uxn_c_l253_c14_1443 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l253_c14_1443_left,
BIN_OP_EQ_uxn_c_l253_c14_1443_right,
BIN_OP_EQ_uxn_c_l253_c14_1443_return_output);

-- vectors_MUX_uxn_c_l253_c10_538b
vectors_MUX_uxn_c_l253_c10_538b : entity work.MUX_uint1_t_vector_snoop_result_t_vector_snoop_result_t_0CLK_de264c78 port map (
vectors_MUX_uxn_c_l253_c10_538b_cond,
vectors_MUX_uxn_c_l253_c10_538b_iftrue,
vectors_MUX_uxn_c_l253_c10_538b_iffalse,
vectors_MUX_uxn_c_l253_c10_538b_return_output);

-- BIN_OP_AND_uxn_c_l254_c4_5242
BIN_OP_AND_uxn_c_l254_c4_5242 : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l254_c4_5242_left,
BIN_OP_AND_uxn_c_l254_c4_5242_right,
BIN_OP_AND_uxn_c_l254_c4_5242_return_output);

-- BIN_OP_OR_uxn_c_l255_c4_2ac5
BIN_OP_OR_uxn_c_l255_c4_2ac5 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l255_c4_2ac5_left,
BIN_OP_OR_uxn_c_l255_c4_2ac5_right,
BIN_OP_OR_uxn_c_l255_c4_2ac5_return_output);

-- BIN_OP_EQ_uxn_c_l256_c14_dad4
BIN_OP_EQ_uxn_c_l256_c14_dad4 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l256_c14_dad4_left,
BIN_OP_EQ_uxn_c_l256_c14_dad4_right,
BIN_OP_EQ_uxn_c_l256_c14_dad4_return_output);

-- vectors_controller_MUX_uxn_c_l256_c10_4382
vectors_controller_MUX_uxn_c_l256_c10_4382 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
vectors_controller_MUX_uxn_c_l256_c10_4382_cond,
vectors_controller_MUX_uxn_c_l256_c10_4382_iftrue,
vectors_controller_MUX_uxn_c_l256_c10_4382_iffalse,
vectors_controller_MUX_uxn_c_l256_c10_4382_return_output);

-- BIN_OP_AND_uxn_c_l257_c4_5fb5
BIN_OP_AND_uxn_c_l257_c4_5fb5 : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l257_c4_5fb5_left,
BIN_OP_AND_uxn_c_l257_c4_5fb5_right,
BIN_OP_AND_uxn_c_l257_c4_5fb5_return_output);

-- BIN_OP_OR_uxn_c_l258_c4_eb54
BIN_OP_OR_uxn_c_l258_c4_eb54 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l258_c4_eb54_left,
BIN_OP_OR_uxn_c_l258_c4_eb54_right,
BIN_OP_OR_uxn_c_l258_c4_eb54_return_output);

-- BIN_OP_EQ_uxn_c_l259_c14_e3b2
BIN_OP_EQ_uxn_c_l259_c14_e3b2 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l259_c14_e3b2_left,
BIN_OP_EQ_uxn_c_l259_c14_e3b2_right,
BIN_OP_EQ_uxn_c_l259_c14_e3b2_return_output);

-- vectors_controller_MUX_uxn_c_l259_c10_bfae
vectors_controller_MUX_uxn_c_l259_c10_bfae : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
vectors_controller_MUX_uxn_c_l259_c10_bfae_cond,
vectors_controller_MUX_uxn_c_l259_c10_bfae_iftrue,
vectors_controller_MUX_uxn_c_l259_c10_bfae_iffalse,
vectors_controller_MUX_uxn_c_l259_c10_bfae_return_output);

-- BIN_OP_AND_uxn_c_l260_c4_ee5d
BIN_OP_AND_uxn_c_l260_c4_ee5d : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l260_c4_ee5d_left,
BIN_OP_AND_uxn_c_l260_c4_ee5d_right,
BIN_OP_AND_uxn_c_l260_c4_ee5d_return_output);

-- BIN_OP_OR_uxn_c_l261_c4_c088
BIN_OP_OR_uxn_c_l261_c4_c088 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l261_c4_c088_left,
BIN_OP_OR_uxn_c_l261_c4_c088_right,
BIN_OP_OR_uxn_c_l261_c4_c088_return_output);

-- CONST_SL_8_uint16_t_uxn_c_l258_l252_DUPLICATE_0a26
CONST_SL_8_uint16_t_uxn_c_l258_l252_DUPLICATE_0a26 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_c_l258_l252_DUPLICATE_0a26_x,
CONST_SL_8_uint16_t_uxn_c_l258_l252_DUPLICATE_0a26_return_output);



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
 vectors_MUX_uxn_c_l249_c2_7e77_return_output,
 BIN_OP_EQ_uxn_c_l250_c7_56e8_return_output,
 vectors_MUX_uxn_c_l250_c3_3101_return_output,
 BIN_OP_AND_uxn_c_l251_c4_d399_return_output,
 BIN_OP_OR_uxn_c_l252_c4_db14_return_output,
 BIN_OP_EQ_uxn_c_l253_c14_1443_return_output,
 vectors_MUX_uxn_c_l253_c10_538b_return_output,
 BIN_OP_AND_uxn_c_l254_c4_5242_return_output,
 BIN_OP_OR_uxn_c_l255_c4_2ac5_return_output,
 BIN_OP_EQ_uxn_c_l256_c14_dad4_return_output,
 vectors_controller_MUX_uxn_c_l256_c10_4382_return_output,
 BIN_OP_AND_uxn_c_l257_c4_5fb5_return_output,
 BIN_OP_OR_uxn_c_l258_c4_eb54_return_output,
 BIN_OP_EQ_uxn_c_l259_c14_e3b2_return_output,
 vectors_controller_MUX_uxn_c_l259_c10_bfae_return_output,
 BIN_OP_AND_uxn_c_l260_c4_ee5d_return_output,
 BIN_OP_OR_uxn_c_l261_c4_c088_return_output,
 CONST_SL_8_uint16_t_uxn_c_l258_l252_DUPLICATE_0a26_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : vector_snoop_result_t;
 variable VAR_device_ram_address : unsigned(7 downto 0);
 variable VAR_device_ram_value : unsigned(7 downto 0);
 variable VAR_is_device_ram_write : unsigned(0 downto 0);
 variable VAR_vectors_MUX_uxn_c_l249_c2_7e77_iftrue : vector_snoop_result_t;
 variable VAR_vectors_MUX_uxn_c_l250_c3_3101_return_output : vector_snoop_result_t;
 variable VAR_vectors_MUX_uxn_c_l249_c2_7e77_iffalse : vector_snoop_result_t;
 variable VAR_vectors_MUX_uxn_c_l249_c2_7e77_return_output : vector_snoop_result_t;
 variable VAR_vectors_MUX_uxn_c_l249_c2_7e77_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l250_c7_56e8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l250_c7_56e8_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l250_c7_56e8_return_output : unsigned(0 downto 0);
 variable VAR_vectors_MUX_uxn_c_l250_c3_3101_iftrue : vector_snoop_result_t;
 variable VAR_vectors_TRUE_INPUT_MUX_CONST_REF_RD_vector_snoop_result_t_vector_snoop_result_t_9b02_uxn_c_l250_c3_3101_return_output : vector_snoop_result_t;
 variable VAR_vectors_MUX_uxn_c_l250_c3_3101_iffalse : vector_snoop_result_t;
 variable VAR_vectors_MUX_uxn_c_l253_c10_538b_return_output : vector_snoop_result_t;
 variable VAR_vectors_MUX_uxn_c_l250_c3_3101_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l251_c4_d399_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l251_c4_d399_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l251_c4_d399_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l252_c4_db14_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l252_c4_db14_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l252_c4_db14_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l253_c14_1443_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l253_c14_1443_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l253_c14_1443_return_output : unsigned(0 downto 0);
 variable VAR_vectors_MUX_uxn_c_l253_c10_538b_iftrue : vector_snoop_result_t;
 variable VAR_vectors_TRUE_INPUT_MUX_CONST_REF_RD_vector_snoop_result_t_vector_snoop_result_t_9b02_uxn_c_l253_c10_538b_return_output : vector_snoop_result_t;
 variable VAR_vectors_MUX_uxn_c_l253_c10_538b_iffalse : vector_snoop_result_t;
 variable VAR_vectors_FALSE_INPUT_MUX_CONST_REF_RD_vector_snoop_result_t_vector_snoop_result_t_9d05_uxn_c_l253_c10_538b_return_output : vector_snoop_result_t;
 variable VAR_vectors_MUX_uxn_c_l253_c10_538b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l254_c4_5242_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l254_c4_5242_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l254_c4_5242_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l255_c4_2ac5_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l255_c4_2ac5_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l255_c4_2ac5_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l256_c14_dad4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l256_c14_dad4_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l256_c14_dad4_return_output : unsigned(0 downto 0);
 variable VAR_vectors_controller_MUX_uxn_c_l256_c10_4382_iftrue : unsigned(15 downto 0);
 variable VAR_vectors_controller_MUX_uxn_c_l256_c10_4382_iffalse : unsigned(15 downto 0);
 variable VAR_vectors_controller_MUX_uxn_c_l259_c10_bfae_return_output : unsigned(15 downto 0);
 variable VAR_vectors_controller_MUX_uxn_c_l256_c10_4382_return_output : unsigned(15 downto 0);
 variable VAR_vectors_controller_MUX_uxn_c_l256_c10_4382_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l257_c4_5fb5_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l257_c4_5fb5_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l257_c4_5fb5_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l258_c4_eb54_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l258_c4_eb54_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l258_c4_eb54_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l259_c14_e3b2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l259_c14_e3b2_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l259_c14_e3b2_return_output : unsigned(0 downto 0);
 variable VAR_vectors_controller_MUX_uxn_c_l259_c10_bfae_iftrue : unsigned(15 downto 0);
 variable VAR_vectors_controller_MUX_uxn_c_l259_c10_bfae_iffalse : unsigned(15 downto 0);
 variable VAR_vectors_controller_MUX_uxn_c_l259_c10_bfae_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l260_c4_ee5d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l260_c4_ee5d_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l260_c4_ee5d_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l261_c4_c088_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l261_c4_c088_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l261_c4_c088_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_vector_snoop_result_t_screen_d41d_uxn_c_l254_l251_DUPLICATE_63fc_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_c_l255_l252_l261_l258_DUPLICATE_e6ce_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_c_l258_l252_DUPLICATE_0a26_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_c_l258_l252_DUPLICATE_0a26_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_vector_snoop_result_t_controller_d41d_uxn_c_l260_l257_l259_DUPLICATE_2d36_return_output : unsigned(15 downto 0);
 -- State registers comb logic variables
variable REG_VAR_vectors : vector_snoop_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_vectors := vectors;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_AND_uxn_c_l251_c4_d399_right := to_unsigned(255, 16);
     VAR_BIN_OP_AND_uxn_c_l254_c4_5242_right := to_unsigned(65280, 16);
     VAR_BIN_OP_EQ_uxn_c_l250_c7_56e8_right := to_unsigned(32, 8);
     VAR_BIN_OP_EQ_uxn_c_l259_c14_e3b2_right := to_unsigned(129, 8);
     VAR_BIN_OP_EQ_uxn_c_l253_c14_1443_right := to_unsigned(33, 8);
     VAR_BIN_OP_AND_uxn_c_l257_c4_5fb5_right := to_unsigned(255, 16);
     VAR_BIN_OP_EQ_uxn_c_l256_c14_dad4_right := to_unsigned(128, 8);
     VAR_BIN_OP_AND_uxn_c_l260_c4_ee5d_right := to_unsigned(65280, 16);

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
     VAR_BIN_OP_EQ_uxn_c_l250_c7_56e8_left := VAR_device_ram_address;
     VAR_BIN_OP_EQ_uxn_c_l253_c14_1443_left := VAR_device_ram_address;
     VAR_BIN_OP_EQ_uxn_c_l256_c14_dad4_left := VAR_device_ram_address;
     VAR_BIN_OP_EQ_uxn_c_l259_c14_e3b2_left := VAR_device_ram_address;
     VAR_vectors_MUX_uxn_c_l249_c2_7e77_cond := VAR_is_device_ram_write;
     VAR_vectors_MUX_uxn_c_l249_c2_7e77_iffalse := vectors;
     -- CONST_REF_RD_uint16_t_vector_snoop_result_t_controller_d41d_uxn_c_l260_l257_l259_DUPLICATE_2d36 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_vector_snoop_result_t_controller_d41d_uxn_c_l260_l257_l259_DUPLICATE_2d36_return_output := vectors.controller;

     -- CAST_TO_uint16_t_uint8_t_uxn_c_l255_l252_l261_l258_DUPLICATE_e6ce LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_c_l255_l252_l261_l258_DUPLICATE_e6ce_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_device_ram_value);

     -- CONST_REF_RD_uint16_t_vector_snoop_result_t_screen_d41d_uxn_c_l254_l251_DUPLICATE_63fc LATENCY=0
     VAR_CONST_REF_RD_uint16_t_vector_snoop_result_t_screen_d41d_uxn_c_l254_l251_DUPLICATE_63fc_return_output := vectors.screen;

     -- BIN_OP_EQ[uxn_c_l259_c14_e3b2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l259_c14_e3b2_left <= VAR_BIN_OP_EQ_uxn_c_l259_c14_e3b2_left;
     BIN_OP_EQ_uxn_c_l259_c14_e3b2_right <= VAR_BIN_OP_EQ_uxn_c_l259_c14_e3b2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l259_c14_e3b2_return_output := BIN_OP_EQ_uxn_c_l259_c14_e3b2_return_output;

     -- BIN_OP_EQ[uxn_c_l250_c7_56e8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l250_c7_56e8_left <= VAR_BIN_OP_EQ_uxn_c_l250_c7_56e8_left;
     BIN_OP_EQ_uxn_c_l250_c7_56e8_right <= VAR_BIN_OP_EQ_uxn_c_l250_c7_56e8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l250_c7_56e8_return_output := BIN_OP_EQ_uxn_c_l250_c7_56e8_return_output;

     -- BIN_OP_EQ[uxn_c_l253_c14_1443] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l253_c14_1443_left <= VAR_BIN_OP_EQ_uxn_c_l253_c14_1443_left;
     BIN_OP_EQ_uxn_c_l253_c14_1443_right <= VAR_BIN_OP_EQ_uxn_c_l253_c14_1443_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l253_c14_1443_return_output := BIN_OP_EQ_uxn_c_l253_c14_1443_return_output;

     -- BIN_OP_EQ[uxn_c_l256_c14_dad4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l256_c14_dad4_left <= VAR_BIN_OP_EQ_uxn_c_l256_c14_dad4_left;
     BIN_OP_EQ_uxn_c_l256_c14_dad4_right <= VAR_BIN_OP_EQ_uxn_c_l256_c14_dad4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l256_c14_dad4_return_output := BIN_OP_EQ_uxn_c_l256_c14_dad4_return_output;

     -- Submodule level 1
     VAR_vectors_MUX_uxn_c_l250_c3_3101_cond := VAR_BIN_OP_EQ_uxn_c_l250_c7_56e8_return_output;
     VAR_vectors_MUX_uxn_c_l253_c10_538b_cond := VAR_BIN_OP_EQ_uxn_c_l253_c14_1443_return_output;
     VAR_vectors_controller_MUX_uxn_c_l256_c10_4382_cond := VAR_BIN_OP_EQ_uxn_c_l256_c14_dad4_return_output;
     VAR_vectors_controller_MUX_uxn_c_l259_c10_bfae_cond := VAR_BIN_OP_EQ_uxn_c_l259_c14_e3b2_return_output;
     VAR_BIN_OP_OR_uxn_c_l255_c4_2ac5_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_c_l255_l252_l261_l258_DUPLICATE_e6ce_return_output;
     VAR_BIN_OP_OR_uxn_c_l261_c4_c088_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_c_l255_l252_l261_l258_DUPLICATE_e6ce_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_c_l258_l252_DUPLICATE_0a26_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_c_l255_l252_l261_l258_DUPLICATE_e6ce_return_output;
     VAR_BIN_OP_AND_uxn_c_l257_c4_5fb5_left := VAR_CONST_REF_RD_uint16_t_vector_snoop_result_t_controller_d41d_uxn_c_l260_l257_l259_DUPLICATE_2d36_return_output;
     VAR_BIN_OP_AND_uxn_c_l260_c4_ee5d_left := VAR_CONST_REF_RD_uint16_t_vector_snoop_result_t_controller_d41d_uxn_c_l260_l257_l259_DUPLICATE_2d36_return_output;
     VAR_vectors_controller_MUX_uxn_c_l259_c10_bfae_iffalse := VAR_CONST_REF_RD_uint16_t_vector_snoop_result_t_controller_d41d_uxn_c_l260_l257_l259_DUPLICATE_2d36_return_output;
     VAR_BIN_OP_AND_uxn_c_l251_c4_d399_left := VAR_CONST_REF_RD_uint16_t_vector_snoop_result_t_screen_d41d_uxn_c_l254_l251_DUPLICATE_63fc_return_output;
     VAR_BIN_OP_AND_uxn_c_l254_c4_5242_left := VAR_CONST_REF_RD_uint16_t_vector_snoop_result_t_screen_d41d_uxn_c_l254_l251_DUPLICATE_63fc_return_output;
     -- BIN_OP_AND[uxn_c_l251_c4_d399] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l251_c4_d399_left <= VAR_BIN_OP_AND_uxn_c_l251_c4_d399_left;
     BIN_OP_AND_uxn_c_l251_c4_d399_right <= VAR_BIN_OP_AND_uxn_c_l251_c4_d399_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l251_c4_d399_return_output := BIN_OP_AND_uxn_c_l251_c4_d399_return_output;

     -- BIN_OP_AND[uxn_c_l254_c4_5242] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l254_c4_5242_left <= VAR_BIN_OP_AND_uxn_c_l254_c4_5242_left;
     BIN_OP_AND_uxn_c_l254_c4_5242_right <= VAR_BIN_OP_AND_uxn_c_l254_c4_5242_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l254_c4_5242_return_output := BIN_OP_AND_uxn_c_l254_c4_5242_return_output;

     -- BIN_OP_AND[uxn_c_l257_c4_5fb5] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l257_c4_5fb5_left <= VAR_BIN_OP_AND_uxn_c_l257_c4_5fb5_left;
     BIN_OP_AND_uxn_c_l257_c4_5fb5_right <= VAR_BIN_OP_AND_uxn_c_l257_c4_5fb5_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l257_c4_5fb5_return_output := BIN_OP_AND_uxn_c_l257_c4_5fb5_return_output;

     -- CONST_SL_8_uint16_t_uxn_c_l258_l252_DUPLICATE_0a26 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_c_l258_l252_DUPLICATE_0a26_x <= VAR_CONST_SL_8_uint16_t_uxn_c_l258_l252_DUPLICATE_0a26_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_c_l258_l252_DUPLICATE_0a26_return_output := CONST_SL_8_uint16_t_uxn_c_l258_l252_DUPLICATE_0a26_return_output;

     -- BIN_OP_AND[uxn_c_l260_c4_ee5d] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l260_c4_ee5d_left <= VAR_BIN_OP_AND_uxn_c_l260_c4_ee5d_left;
     BIN_OP_AND_uxn_c_l260_c4_ee5d_right <= VAR_BIN_OP_AND_uxn_c_l260_c4_ee5d_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l260_c4_ee5d_return_output := BIN_OP_AND_uxn_c_l260_c4_ee5d_return_output;

     -- Submodule level 2
     VAR_BIN_OP_OR_uxn_c_l252_c4_db14_left := VAR_BIN_OP_AND_uxn_c_l251_c4_d399_return_output;
     VAR_BIN_OP_OR_uxn_c_l255_c4_2ac5_left := VAR_BIN_OP_AND_uxn_c_l254_c4_5242_return_output;
     VAR_BIN_OP_OR_uxn_c_l258_c4_eb54_left := VAR_BIN_OP_AND_uxn_c_l257_c4_5fb5_return_output;
     VAR_BIN_OP_OR_uxn_c_l261_c4_c088_left := VAR_BIN_OP_AND_uxn_c_l260_c4_ee5d_return_output;
     VAR_BIN_OP_OR_uxn_c_l252_c4_db14_right := VAR_CONST_SL_8_uint16_t_uxn_c_l258_l252_DUPLICATE_0a26_return_output;
     VAR_BIN_OP_OR_uxn_c_l258_c4_eb54_right := VAR_CONST_SL_8_uint16_t_uxn_c_l258_l252_DUPLICATE_0a26_return_output;
     -- BIN_OP_OR[uxn_c_l252_c4_db14] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l252_c4_db14_left <= VAR_BIN_OP_OR_uxn_c_l252_c4_db14_left;
     BIN_OP_OR_uxn_c_l252_c4_db14_right <= VAR_BIN_OP_OR_uxn_c_l252_c4_db14_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l252_c4_db14_return_output := BIN_OP_OR_uxn_c_l252_c4_db14_return_output;

     -- BIN_OP_OR[uxn_c_l258_c4_eb54] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l258_c4_eb54_left <= VAR_BIN_OP_OR_uxn_c_l258_c4_eb54_left;
     BIN_OP_OR_uxn_c_l258_c4_eb54_right <= VAR_BIN_OP_OR_uxn_c_l258_c4_eb54_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l258_c4_eb54_return_output := BIN_OP_OR_uxn_c_l258_c4_eb54_return_output;

     -- BIN_OP_OR[uxn_c_l261_c4_c088] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l261_c4_c088_left <= VAR_BIN_OP_OR_uxn_c_l261_c4_c088_left;
     BIN_OP_OR_uxn_c_l261_c4_c088_right <= VAR_BIN_OP_OR_uxn_c_l261_c4_c088_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l261_c4_c088_return_output := BIN_OP_OR_uxn_c_l261_c4_c088_return_output;

     -- BIN_OP_OR[uxn_c_l255_c4_2ac5] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l255_c4_2ac5_left <= VAR_BIN_OP_OR_uxn_c_l255_c4_2ac5_left;
     BIN_OP_OR_uxn_c_l255_c4_2ac5_right <= VAR_BIN_OP_OR_uxn_c_l255_c4_2ac5_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l255_c4_2ac5_return_output := BIN_OP_OR_uxn_c_l255_c4_2ac5_return_output;

     -- Submodule level 3
     VAR_vectors_controller_MUX_uxn_c_l256_c10_4382_iftrue := VAR_BIN_OP_OR_uxn_c_l258_c4_eb54_return_output;
     VAR_vectors_controller_MUX_uxn_c_l259_c10_bfae_iftrue := VAR_BIN_OP_OR_uxn_c_l261_c4_c088_return_output;
     -- vectors_TRUE_INPUT_MUX_CONST_REF_RD_vector_snoop_result_t_vector_snoop_result_t_9b02[uxn_c_l250_c3_3101] LATENCY=0
     VAR_vectors_TRUE_INPUT_MUX_CONST_REF_RD_vector_snoop_result_t_vector_snoop_result_t_9b02_uxn_c_l250_c3_3101_return_output := CONST_REF_RD_vector_snoop_result_t_vector_snoop_result_t_9b02(
     vectors,
     VAR_BIN_OP_OR_uxn_c_l252_c4_db14_return_output);

     -- vectors_TRUE_INPUT_MUX_CONST_REF_RD_vector_snoop_result_t_vector_snoop_result_t_9b02[uxn_c_l253_c10_538b] LATENCY=0
     VAR_vectors_TRUE_INPUT_MUX_CONST_REF_RD_vector_snoop_result_t_vector_snoop_result_t_9b02_uxn_c_l253_c10_538b_return_output := CONST_REF_RD_vector_snoop_result_t_vector_snoop_result_t_9b02(
     vectors,
     VAR_BIN_OP_OR_uxn_c_l255_c4_2ac5_return_output);

     -- vectors_controller_MUX[uxn_c_l259_c10_bfae] LATENCY=0
     -- Inputs
     vectors_controller_MUX_uxn_c_l259_c10_bfae_cond <= VAR_vectors_controller_MUX_uxn_c_l259_c10_bfae_cond;
     vectors_controller_MUX_uxn_c_l259_c10_bfae_iftrue <= VAR_vectors_controller_MUX_uxn_c_l259_c10_bfae_iftrue;
     vectors_controller_MUX_uxn_c_l259_c10_bfae_iffalse <= VAR_vectors_controller_MUX_uxn_c_l259_c10_bfae_iffalse;
     -- Outputs
     VAR_vectors_controller_MUX_uxn_c_l259_c10_bfae_return_output := vectors_controller_MUX_uxn_c_l259_c10_bfae_return_output;

     -- Submodule level 4
     VAR_vectors_MUX_uxn_c_l250_c3_3101_iftrue := VAR_vectors_TRUE_INPUT_MUX_CONST_REF_RD_vector_snoop_result_t_vector_snoop_result_t_9b02_uxn_c_l250_c3_3101_return_output;
     VAR_vectors_MUX_uxn_c_l253_c10_538b_iftrue := VAR_vectors_TRUE_INPUT_MUX_CONST_REF_RD_vector_snoop_result_t_vector_snoop_result_t_9b02_uxn_c_l253_c10_538b_return_output;
     VAR_vectors_controller_MUX_uxn_c_l256_c10_4382_iffalse := VAR_vectors_controller_MUX_uxn_c_l259_c10_bfae_return_output;
     -- vectors_controller_MUX[uxn_c_l256_c10_4382] LATENCY=0
     -- Inputs
     vectors_controller_MUX_uxn_c_l256_c10_4382_cond <= VAR_vectors_controller_MUX_uxn_c_l256_c10_4382_cond;
     vectors_controller_MUX_uxn_c_l256_c10_4382_iftrue <= VAR_vectors_controller_MUX_uxn_c_l256_c10_4382_iftrue;
     vectors_controller_MUX_uxn_c_l256_c10_4382_iffalse <= VAR_vectors_controller_MUX_uxn_c_l256_c10_4382_iffalse;
     -- Outputs
     VAR_vectors_controller_MUX_uxn_c_l256_c10_4382_return_output := vectors_controller_MUX_uxn_c_l256_c10_4382_return_output;

     -- Submodule level 5
     -- vectors_FALSE_INPUT_MUX_CONST_REF_RD_vector_snoop_result_t_vector_snoop_result_t_9d05[uxn_c_l253_c10_538b] LATENCY=0
     VAR_vectors_FALSE_INPUT_MUX_CONST_REF_RD_vector_snoop_result_t_vector_snoop_result_t_9d05_uxn_c_l253_c10_538b_return_output := CONST_REF_RD_vector_snoop_result_t_vector_snoop_result_t_9d05(
     vectors,
     VAR_vectors_controller_MUX_uxn_c_l256_c10_4382_return_output);

     -- Submodule level 6
     VAR_vectors_MUX_uxn_c_l253_c10_538b_iffalse := VAR_vectors_FALSE_INPUT_MUX_CONST_REF_RD_vector_snoop_result_t_vector_snoop_result_t_9d05_uxn_c_l253_c10_538b_return_output;
     -- vectors_MUX[uxn_c_l253_c10_538b] LATENCY=0
     -- Inputs
     vectors_MUX_uxn_c_l253_c10_538b_cond <= VAR_vectors_MUX_uxn_c_l253_c10_538b_cond;
     vectors_MUX_uxn_c_l253_c10_538b_iftrue <= VAR_vectors_MUX_uxn_c_l253_c10_538b_iftrue;
     vectors_MUX_uxn_c_l253_c10_538b_iffalse <= VAR_vectors_MUX_uxn_c_l253_c10_538b_iffalse;
     -- Outputs
     VAR_vectors_MUX_uxn_c_l253_c10_538b_return_output := vectors_MUX_uxn_c_l253_c10_538b_return_output;

     -- Submodule level 7
     VAR_vectors_MUX_uxn_c_l250_c3_3101_iffalse := VAR_vectors_MUX_uxn_c_l253_c10_538b_return_output;
     -- vectors_MUX[uxn_c_l250_c3_3101] LATENCY=0
     -- Inputs
     vectors_MUX_uxn_c_l250_c3_3101_cond <= VAR_vectors_MUX_uxn_c_l250_c3_3101_cond;
     vectors_MUX_uxn_c_l250_c3_3101_iftrue <= VAR_vectors_MUX_uxn_c_l250_c3_3101_iftrue;
     vectors_MUX_uxn_c_l250_c3_3101_iffalse <= VAR_vectors_MUX_uxn_c_l250_c3_3101_iffalse;
     -- Outputs
     VAR_vectors_MUX_uxn_c_l250_c3_3101_return_output := vectors_MUX_uxn_c_l250_c3_3101_return_output;

     -- Submodule level 8
     VAR_vectors_MUX_uxn_c_l249_c2_7e77_iftrue := VAR_vectors_MUX_uxn_c_l250_c3_3101_return_output;
     -- vectors_MUX[uxn_c_l249_c2_7e77] LATENCY=0
     -- Inputs
     vectors_MUX_uxn_c_l249_c2_7e77_cond <= VAR_vectors_MUX_uxn_c_l249_c2_7e77_cond;
     vectors_MUX_uxn_c_l249_c2_7e77_iftrue <= VAR_vectors_MUX_uxn_c_l249_c2_7e77_iftrue;
     vectors_MUX_uxn_c_l249_c2_7e77_iffalse <= VAR_vectors_MUX_uxn_c_l249_c2_7e77_iffalse;
     -- Outputs
     VAR_vectors_MUX_uxn_c_l249_c2_7e77_return_output := vectors_MUX_uxn_c_l249_c2_7e77_return_output;

     -- Submodule level 9
     VAR_return_output := VAR_vectors_MUX_uxn_c_l249_c2_7e77_return_output;
     REG_VAR_vectors := VAR_vectors_MUX_uxn_c_l249_c2_7e77_return_output;
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
