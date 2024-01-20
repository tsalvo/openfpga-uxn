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
-- vectors_MUX[uxn_c_l249_c2_088e]
signal vectors_MUX_uxn_c_l249_c2_088e_cond : unsigned(0 downto 0);
signal vectors_MUX_uxn_c_l249_c2_088e_iftrue : vector_snoop_result_t;
signal vectors_MUX_uxn_c_l249_c2_088e_iffalse : vector_snoop_result_t;
signal vectors_MUX_uxn_c_l249_c2_088e_return_output : vector_snoop_result_t;

-- BIN_OP_EQ[uxn_c_l250_c7_fd61]
signal BIN_OP_EQ_uxn_c_l250_c7_fd61_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l250_c7_fd61_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l250_c7_fd61_return_output : unsigned(0 downto 0);

-- vectors_MUX[uxn_c_l250_c3_18aa]
signal vectors_MUX_uxn_c_l250_c3_18aa_cond : unsigned(0 downto 0);
signal vectors_MUX_uxn_c_l250_c3_18aa_iftrue : vector_snoop_result_t;
signal vectors_MUX_uxn_c_l250_c3_18aa_iffalse : vector_snoop_result_t;
signal vectors_MUX_uxn_c_l250_c3_18aa_return_output : vector_snoop_result_t;

-- BIN_OP_AND[uxn_c_l251_c4_b1d9]
signal BIN_OP_AND_uxn_c_l251_c4_b1d9_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l251_c4_b1d9_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l251_c4_b1d9_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_c_l252_c4_44d1]
signal BIN_OP_OR_uxn_c_l252_c4_44d1_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_c_l252_c4_44d1_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_c_l252_c4_44d1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l253_c14_3f4f]
signal BIN_OP_EQ_uxn_c_l253_c14_3f4f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l253_c14_3f4f_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l253_c14_3f4f_return_output : unsigned(0 downto 0);

-- vectors_MUX[uxn_c_l253_c10_c63b]
signal vectors_MUX_uxn_c_l253_c10_c63b_cond : unsigned(0 downto 0);
signal vectors_MUX_uxn_c_l253_c10_c63b_iftrue : vector_snoop_result_t;
signal vectors_MUX_uxn_c_l253_c10_c63b_iffalse : vector_snoop_result_t;
signal vectors_MUX_uxn_c_l253_c10_c63b_return_output : vector_snoop_result_t;

-- BIN_OP_AND[uxn_c_l254_c4_48f4]
signal BIN_OP_AND_uxn_c_l254_c4_48f4_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l254_c4_48f4_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l254_c4_48f4_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_c_l255_c4_a580]
signal BIN_OP_OR_uxn_c_l255_c4_a580_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_c_l255_c4_a580_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_c_l255_c4_a580_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l256_c14_8588]
signal BIN_OP_EQ_uxn_c_l256_c14_8588_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l256_c14_8588_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l256_c14_8588_return_output : unsigned(0 downto 0);

-- vectors_controller_MUX[uxn_c_l256_c10_6e60]
signal vectors_controller_MUX_uxn_c_l256_c10_6e60_cond : unsigned(0 downto 0);
signal vectors_controller_MUX_uxn_c_l256_c10_6e60_iftrue : unsigned(15 downto 0);
signal vectors_controller_MUX_uxn_c_l256_c10_6e60_iffalse : unsigned(15 downto 0);
signal vectors_controller_MUX_uxn_c_l256_c10_6e60_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_c_l257_c4_5426]
signal BIN_OP_AND_uxn_c_l257_c4_5426_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l257_c4_5426_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l257_c4_5426_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_c_l258_c4_c75a]
signal BIN_OP_OR_uxn_c_l258_c4_c75a_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_c_l258_c4_c75a_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_c_l258_c4_c75a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l259_c14_94e1]
signal BIN_OP_EQ_uxn_c_l259_c14_94e1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l259_c14_94e1_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l259_c14_94e1_return_output : unsigned(0 downto 0);

-- vectors_controller_MUX[uxn_c_l259_c10_498f]
signal vectors_controller_MUX_uxn_c_l259_c10_498f_cond : unsigned(0 downto 0);
signal vectors_controller_MUX_uxn_c_l259_c10_498f_iftrue : unsigned(15 downto 0);
signal vectors_controller_MUX_uxn_c_l259_c10_498f_iffalse : unsigned(15 downto 0);
signal vectors_controller_MUX_uxn_c_l259_c10_498f_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_c_l260_c4_4dd6]
signal BIN_OP_AND_uxn_c_l260_c4_4dd6_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l260_c4_4dd6_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l260_c4_4dd6_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_c_l261_c4_9885]
signal BIN_OP_OR_uxn_c_l261_c4_9885_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_c_l261_c4_9885_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_c_l261_c4_9885_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_c_l258_l252_DUPLICATE_b807
signal CONST_SL_8_uint16_t_uxn_c_l258_l252_DUPLICATE_b807_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_c_l258_l252_DUPLICATE_b807_return_output : unsigned(15 downto 0);

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
-- vectors_MUX_uxn_c_l249_c2_088e
vectors_MUX_uxn_c_l249_c2_088e : entity work.MUX_uint1_t_vector_snoop_result_t_vector_snoop_result_t_0CLK_de264c78 port map (
vectors_MUX_uxn_c_l249_c2_088e_cond,
vectors_MUX_uxn_c_l249_c2_088e_iftrue,
vectors_MUX_uxn_c_l249_c2_088e_iffalse,
vectors_MUX_uxn_c_l249_c2_088e_return_output);

-- BIN_OP_EQ_uxn_c_l250_c7_fd61
BIN_OP_EQ_uxn_c_l250_c7_fd61 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l250_c7_fd61_left,
BIN_OP_EQ_uxn_c_l250_c7_fd61_right,
BIN_OP_EQ_uxn_c_l250_c7_fd61_return_output);

-- vectors_MUX_uxn_c_l250_c3_18aa
vectors_MUX_uxn_c_l250_c3_18aa : entity work.MUX_uint1_t_vector_snoop_result_t_vector_snoop_result_t_0CLK_de264c78 port map (
vectors_MUX_uxn_c_l250_c3_18aa_cond,
vectors_MUX_uxn_c_l250_c3_18aa_iftrue,
vectors_MUX_uxn_c_l250_c3_18aa_iffalse,
vectors_MUX_uxn_c_l250_c3_18aa_return_output);

-- BIN_OP_AND_uxn_c_l251_c4_b1d9
BIN_OP_AND_uxn_c_l251_c4_b1d9 : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l251_c4_b1d9_left,
BIN_OP_AND_uxn_c_l251_c4_b1d9_right,
BIN_OP_AND_uxn_c_l251_c4_b1d9_return_output);

-- BIN_OP_OR_uxn_c_l252_c4_44d1
BIN_OP_OR_uxn_c_l252_c4_44d1 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l252_c4_44d1_left,
BIN_OP_OR_uxn_c_l252_c4_44d1_right,
BIN_OP_OR_uxn_c_l252_c4_44d1_return_output);

-- BIN_OP_EQ_uxn_c_l253_c14_3f4f
BIN_OP_EQ_uxn_c_l253_c14_3f4f : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l253_c14_3f4f_left,
BIN_OP_EQ_uxn_c_l253_c14_3f4f_right,
BIN_OP_EQ_uxn_c_l253_c14_3f4f_return_output);

-- vectors_MUX_uxn_c_l253_c10_c63b
vectors_MUX_uxn_c_l253_c10_c63b : entity work.MUX_uint1_t_vector_snoop_result_t_vector_snoop_result_t_0CLK_de264c78 port map (
vectors_MUX_uxn_c_l253_c10_c63b_cond,
vectors_MUX_uxn_c_l253_c10_c63b_iftrue,
vectors_MUX_uxn_c_l253_c10_c63b_iffalse,
vectors_MUX_uxn_c_l253_c10_c63b_return_output);

-- BIN_OP_AND_uxn_c_l254_c4_48f4
BIN_OP_AND_uxn_c_l254_c4_48f4 : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l254_c4_48f4_left,
BIN_OP_AND_uxn_c_l254_c4_48f4_right,
BIN_OP_AND_uxn_c_l254_c4_48f4_return_output);

-- BIN_OP_OR_uxn_c_l255_c4_a580
BIN_OP_OR_uxn_c_l255_c4_a580 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l255_c4_a580_left,
BIN_OP_OR_uxn_c_l255_c4_a580_right,
BIN_OP_OR_uxn_c_l255_c4_a580_return_output);

-- BIN_OP_EQ_uxn_c_l256_c14_8588
BIN_OP_EQ_uxn_c_l256_c14_8588 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l256_c14_8588_left,
BIN_OP_EQ_uxn_c_l256_c14_8588_right,
BIN_OP_EQ_uxn_c_l256_c14_8588_return_output);

-- vectors_controller_MUX_uxn_c_l256_c10_6e60
vectors_controller_MUX_uxn_c_l256_c10_6e60 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
vectors_controller_MUX_uxn_c_l256_c10_6e60_cond,
vectors_controller_MUX_uxn_c_l256_c10_6e60_iftrue,
vectors_controller_MUX_uxn_c_l256_c10_6e60_iffalse,
vectors_controller_MUX_uxn_c_l256_c10_6e60_return_output);

-- BIN_OP_AND_uxn_c_l257_c4_5426
BIN_OP_AND_uxn_c_l257_c4_5426 : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l257_c4_5426_left,
BIN_OP_AND_uxn_c_l257_c4_5426_right,
BIN_OP_AND_uxn_c_l257_c4_5426_return_output);

-- BIN_OP_OR_uxn_c_l258_c4_c75a
BIN_OP_OR_uxn_c_l258_c4_c75a : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l258_c4_c75a_left,
BIN_OP_OR_uxn_c_l258_c4_c75a_right,
BIN_OP_OR_uxn_c_l258_c4_c75a_return_output);

-- BIN_OP_EQ_uxn_c_l259_c14_94e1
BIN_OP_EQ_uxn_c_l259_c14_94e1 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l259_c14_94e1_left,
BIN_OP_EQ_uxn_c_l259_c14_94e1_right,
BIN_OP_EQ_uxn_c_l259_c14_94e1_return_output);

-- vectors_controller_MUX_uxn_c_l259_c10_498f
vectors_controller_MUX_uxn_c_l259_c10_498f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
vectors_controller_MUX_uxn_c_l259_c10_498f_cond,
vectors_controller_MUX_uxn_c_l259_c10_498f_iftrue,
vectors_controller_MUX_uxn_c_l259_c10_498f_iffalse,
vectors_controller_MUX_uxn_c_l259_c10_498f_return_output);

-- BIN_OP_AND_uxn_c_l260_c4_4dd6
BIN_OP_AND_uxn_c_l260_c4_4dd6 : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l260_c4_4dd6_left,
BIN_OP_AND_uxn_c_l260_c4_4dd6_right,
BIN_OP_AND_uxn_c_l260_c4_4dd6_return_output);

-- BIN_OP_OR_uxn_c_l261_c4_9885
BIN_OP_OR_uxn_c_l261_c4_9885 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l261_c4_9885_left,
BIN_OP_OR_uxn_c_l261_c4_9885_right,
BIN_OP_OR_uxn_c_l261_c4_9885_return_output);

-- CONST_SL_8_uint16_t_uxn_c_l258_l252_DUPLICATE_b807
CONST_SL_8_uint16_t_uxn_c_l258_l252_DUPLICATE_b807 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_c_l258_l252_DUPLICATE_b807_x,
CONST_SL_8_uint16_t_uxn_c_l258_l252_DUPLICATE_b807_return_output);



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
 vectors_MUX_uxn_c_l249_c2_088e_return_output,
 BIN_OP_EQ_uxn_c_l250_c7_fd61_return_output,
 vectors_MUX_uxn_c_l250_c3_18aa_return_output,
 BIN_OP_AND_uxn_c_l251_c4_b1d9_return_output,
 BIN_OP_OR_uxn_c_l252_c4_44d1_return_output,
 BIN_OP_EQ_uxn_c_l253_c14_3f4f_return_output,
 vectors_MUX_uxn_c_l253_c10_c63b_return_output,
 BIN_OP_AND_uxn_c_l254_c4_48f4_return_output,
 BIN_OP_OR_uxn_c_l255_c4_a580_return_output,
 BIN_OP_EQ_uxn_c_l256_c14_8588_return_output,
 vectors_controller_MUX_uxn_c_l256_c10_6e60_return_output,
 BIN_OP_AND_uxn_c_l257_c4_5426_return_output,
 BIN_OP_OR_uxn_c_l258_c4_c75a_return_output,
 BIN_OP_EQ_uxn_c_l259_c14_94e1_return_output,
 vectors_controller_MUX_uxn_c_l259_c10_498f_return_output,
 BIN_OP_AND_uxn_c_l260_c4_4dd6_return_output,
 BIN_OP_OR_uxn_c_l261_c4_9885_return_output,
 CONST_SL_8_uint16_t_uxn_c_l258_l252_DUPLICATE_b807_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : vector_snoop_result_t;
 variable VAR_device_ram_address : unsigned(7 downto 0);
 variable VAR_device_ram_value : unsigned(7 downto 0);
 variable VAR_is_device_ram_write : unsigned(0 downto 0);
 variable VAR_vectors_MUX_uxn_c_l249_c2_088e_iftrue : vector_snoop_result_t;
 variable VAR_vectors_MUX_uxn_c_l250_c3_18aa_return_output : vector_snoop_result_t;
 variable VAR_vectors_MUX_uxn_c_l249_c2_088e_iffalse : vector_snoop_result_t;
 variable VAR_vectors_MUX_uxn_c_l249_c2_088e_return_output : vector_snoop_result_t;
 variable VAR_vectors_MUX_uxn_c_l249_c2_088e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l250_c7_fd61_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l250_c7_fd61_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l250_c7_fd61_return_output : unsigned(0 downto 0);
 variable VAR_vectors_MUX_uxn_c_l250_c3_18aa_iftrue : vector_snoop_result_t;
 variable VAR_vectors_TRUE_INPUT_MUX_CONST_REF_RD_vector_snoop_result_t_vector_snoop_result_t_9b02_uxn_c_l250_c3_18aa_return_output : vector_snoop_result_t;
 variable VAR_vectors_MUX_uxn_c_l250_c3_18aa_iffalse : vector_snoop_result_t;
 variable VAR_vectors_MUX_uxn_c_l253_c10_c63b_return_output : vector_snoop_result_t;
 variable VAR_vectors_MUX_uxn_c_l250_c3_18aa_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l251_c4_b1d9_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l251_c4_b1d9_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l251_c4_b1d9_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l252_c4_44d1_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l252_c4_44d1_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l252_c4_44d1_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l253_c14_3f4f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l253_c14_3f4f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l253_c14_3f4f_return_output : unsigned(0 downto 0);
 variable VAR_vectors_MUX_uxn_c_l253_c10_c63b_iftrue : vector_snoop_result_t;
 variable VAR_vectors_TRUE_INPUT_MUX_CONST_REF_RD_vector_snoop_result_t_vector_snoop_result_t_9b02_uxn_c_l253_c10_c63b_return_output : vector_snoop_result_t;
 variable VAR_vectors_MUX_uxn_c_l253_c10_c63b_iffalse : vector_snoop_result_t;
 variable VAR_vectors_FALSE_INPUT_MUX_CONST_REF_RD_vector_snoop_result_t_vector_snoop_result_t_9d05_uxn_c_l253_c10_c63b_return_output : vector_snoop_result_t;
 variable VAR_vectors_MUX_uxn_c_l253_c10_c63b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l254_c4_48f4_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l254_c4_48f4_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l254_c4_48f4_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l255_c4_a580_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l255_c4_a580_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l255_c4_a580_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l256_c14_8588_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l256_c14_8588_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l256_c14_8588_return_output : unsigned(0 downto 0);
 variable VAR_vectors_controller_MUX_uxn_c_l256_c10_6e60_iftrue : unsigned(15 downto 0);
 variable VAR_vectors_controller_MUX_uxn_c_l256_c10_6e60_iffalse : unsigned(15 downto 0);
 variable VAR_vectors_controller_MUX_uxn_c_l259_c10_498f_return_output : unsigned(15 downto 0);
 variable VAR_vectors_controller_MUX_uxn_c_l256_c10_6e60_return_output : unsigned(15 downto 0);
 variable VAR_vectors_controller_MUX_uxn_c_l256_c10_6e60_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l257_c4_5426_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l257_c4_5426_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l257_c4_5426_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l258_c4_c75a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l258_c4_c75a_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l258_c4_c75a_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l259_c14_94e1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l259_c14_94e1_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l259_c14_94e1_return_output : unsigned(0 downto 0);
 variable VAR_vectors_controller_MUX_uxn_c_l259_c10_498f_iftrue : unsigned(15 downto 0);
 variable VAR_vectors_controller_MUX_uxn_c_l259_c10_498f_iffalse : unsigned(15 downto 0);
 variable VAR_vectors_controller_MUX_uxn_c_l259_c10_498f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l260_c4_4dd6_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l260_c4_4dd6_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l260_c4_4dd6_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l261_c4_9885_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l261_c4_9885_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l261_c4_9885_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_vector_snoop_result_t_screen_d41d_uxn_c_l251_l254_DUPLICATE_7f3b_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_c_l255_l258_l261_l252_DUPLICATE_05fa_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_c_l258_l252_DUPLICATE_b807_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_c_l258_l252_DUPLICATE_b807_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_vector_snoop_result_t_controller_d41d_uxn_c_l260_l259_l257_DUPLICATE_9638_return_output : unsigned(15 downto 0);
 -- State registers comb logic variables
variable REG_VAR_vectors : vector_snoop_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_vectors := vectors;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_c_l259_c14_94e1_right := to_unsigned(129, 8);
     VAR_BIN_OP_AND_uxn_c_l251_c4_b1d9_right := to_unsigned(255, 16);
     VAR_BIN_OP_EQ_uxn_c_l256_c14_8588_right := to_unsigned(128, 8);
     VAR_BIN_OP_AND_uxn_c_l260_c4_4dd6_right := to_unsigned(65280, 16);
     VAR_BIN_OP_AND_uxn_c_l257_c4_5426_right := to_unsigned(255, 16);
     VAR_BIN_OP_EQ_uxn_c_l253_c14_3f4f_right := to_unsigned(33, 8);
     VAR_BIN_OP_EQ_uxn_c_l250_c7_fd61_right := to_unsigned(32, 8);
     VAR_BIN_OP_AND_uxn_c_l254_c4_48f4_right := to_unsigned(65280, 16);

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
     VAR_BIN_OP_EQ_uxn_c_l250_c7_fd61_left := VAR_device_ram_address;
     VAR_BIN_OP_EQ_uxn_c_l253_c14_3f4f_left := VAR_device_ram_address;
     VAR_BIN_OP_EQ_uxn_c_l256_c14_8588_left := VAR_device_ram_address;
     VAR_BIN_OP_EQ_uxn_c_l259_c14_94e1_left := VAR_device_ram_address;
     VAR_vectors_MUX_uxn_c_l249_c2_088e_cond := VAR_is_device_ram_write;
     VAR_vectors_MUX_uxn_c_l249_c2_088e_iffalse := vectors;
     -- BIN_OP_EQ[uxn_c_l253_c14_3f4f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l253_c14_3f4f_left <= VAR_BIN_OP_EQ_uxn_c_l253_c14_3f4f_left;
     BIN_OP_EQ_uxn_c_l253_c14_3f4f_right <= VAR_BIN_OP_EQ_uxn_c_l253_c14_3f4f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l253_c14_3f4f_return_output := BIN_OP_EQ_uxn_c_l253_c14_3f4f_return_output;

     -- BIN_OP_EQ[uxn_c_l256_c14_8588] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l256_c14_8588_left <= VAR_BIN_OP_EQ_uxn_c_l256_c14_8588_left;
     BIN_OP_EQ_uxn_c_l256_c14_8588_right <= VAR_BIN_OP_EQ_uxn_c_l256_c14_8588_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l256_c14_8588_return_output := BIN_OP_EQ_uxn_c_l256_c14_8588_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_c_l255_l258_l261_l252_DUPLICATE_05fa LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_c_l255_l258_l261_l252_DUPLICATE_05fa_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_device_ram_value);

     -- CONST_REF_RD_uint16_t_vector_snoop_result_t_screen_d41d_uxn_c_l251_l254_DUPLICATE_7f3b LATENCY=0
     VAR_CONST_REF_RD_uint16_t_vector_snoop_result_t_screen_d41d_uxn_c_l251_l254_DUPLICATE_7f3b_return_output := vectors.screen;

     -- BIN_OP_EQ[uxn_c_l259_c14_94e1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l259_c14_94e1_left <= VAR_BIN_OP_EQ_uxn_c_l259_c14_94e1_left;
     BIN_OP_EQ_uxn_c_l259_c14_94e1_right <= VAR_BIN_OP_EQ_uxn_c_l259_c14_94e1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l259_c14_94e1_return_output := BIN_OP_EQ_uxn_c_l259_c14_94e1_return_output;

     -- BIN_OP_EQ[uxn_c_l250_c7_fd61] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l250_c7_fd61_left <= VAR_BIN_OP_EQ_uxn_c_l250_c7_fd61_left;
     BIN_OP_EQ_uxn_c_l250_c7_fd61_right <= VAR_BIN_OP_EQ_uxn_c_l250_c7_fd61_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l250_c7_fd61_return_output := BIN_OP_EQ_uxn_c_l250_c7_fd61_return_output;

     -- CONST_REF_RD_uint16_t_vector_snoop_result_t_controller_d41d_uxn_c_l260_l259_l257_DUPLICATE_9638 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_vector_snoop_result_t_controller_d41d_uxn_c_l260_l259_l257_DUPLICATE_9638_return_output := vectors.controller;

     -- Submodule level 1
     VAR_vectors_MUX_uxn_c_l250_c3_18aa_cond := VAR_BIN_OP_EQ_uxn_c_l250_c7_fd61_return_output;
     VAR_vectors_MUX_uxn_c_l253_c10_c63b_cond := VAR_BIN_OP_EQ_uxn_c_l253_c14_3f4f_return_output;
     VAR_vectors_controller_MUX_uxn_c_l256_c10_6e60_cond := VAR_BIN_OP_EQ_uxn_c_l256_c14_8588_return_output;
     VAR_vectors_controller_MUX_uxn_c_l259_c10_498f_cond := VAR_BIN_OP_EQ_uxn_c_l259_c14_94e1_return_output;
     VAR_BIN_OP_OR_uxn_c_l255_c4_a580_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_c_l255_l258_l261_l252_DUPLICATE_05fa_return_output;
     VAR_BIN_OP_OR_uxn_c_l261_c4_9885_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_c_l255_l258_l261_l252_DUPLICATE_05fa_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_c_l258_l252_DUPLICATE_b807_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_c_l255_l258_l261_l252_DUPLICATE_05fa_return_output;
     VAR_BIN_OP_AND_uxn_c_l257_c4_5426_left := VAR_CONST_REF_RD_uint16_t_vector_snoop_result_t_controller_d41d_uxn_c_l260_l259_l257_DUPLICATE_9638_return_output;
     VAR_BIN_OP_AND_uxn_c_l260_c4_4dd6_left := VAR_CONST_REF_RD_uint16_t_vector_snoop_result_t_controller_d41d_uxn_c_l260_l259_l257_DUPLICATE_9638_return_output;
     VAR_vectors_controller_MUX_uxn_c_l259_c10_498f_iffalse := VAR_CONST_REF_RD_uint16_t_vector_snoop_result_t_controller_d41d_uxn_c_l260_l259_l257_DUPLICATE_9638_return_output;
     VAR_BIN_OP_AND_uxn_c_l251_c4_b1d9_left := VAR_CONST_REF_RD_uint16_t_vector_snoop_result_t_screen_d41d_uxn_c_l251_l254_DUPLICATE_7f3b_return_output;
     VAR_BIN_OP_AND_uxn_c_l254_c4_48f4_left := VAR_CONST_REF_RD_uint16_t_vector_snoop_result_t_screen_d41d_uxn_c_l251_l254_DUPLICATE_7f3b_return_output;
     -- CONST_SL_8_uint16_t_uxn_c_l258_l252_DUPLICATE_b807 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_c_l258_l252_DUPLICATE_b807_x <= VAR_CONST_SL_8_uint16_t_uxn_c_l258_l252_DUPLICATE_b807_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_c_l258_l252_DUPLICATE_b807_return_output := CONST_SL_8_uint16_t_uxn_c_l258_l252_DUPLICATE_b807_return_output;

     -- BIN_OP_AND[uxn_c_l257_c4_5426] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l257_c4_5426_left <= VAR_BIN_OP_AND_uxn_c_l257_c4_5426_left;
     BIN_OP_AND_uxn_c_l257_c4_5426_right <= VAR_BIN_OP_AND_uxn_c_l257_c4_5426_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l257_c4_5426_return_output := BIN_OP_AND_uxn_c_l257_c4_5426_return_output;

     -- BIN_OP_AND[uxn_c_l260_c4_4dd6] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l260_c4_4dd6_left <= VAR_BIN_OP_AND_uxn_c_l260_c4_4dd6_left;
     BIN_OP_AND_uxn_c_l260_c4_4dd6_right <= VAR_BIN_OP_AND_uxn_c_l260_c4_4dd6_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l260_c4_4dd6_return_output := BIN_OP_AND_uxn_c_l260_c4_4dd6_return_output;

     -- BIN_OP_AND[uxn_c_l251_c4_b1d9] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l251_c4_b1d9_left <= VAR_BIN_OP_AND_uxn_c_l251_c4_b1d9_left;
     BIN_OP_AND_uxn_c_l251_c4_b1d9_right <= VAR_BIN_OP_AND_uxn_c_l251_c4_b1d9_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l251_c4_b1d9_return_output := BIN_OP_AND_uxn_c_l251_c4_b1d9_return_output;

     -- BIN_OP_AND[uxn_c_l254_c4_48f4] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l254_c4_48f4_left <= VAR_BIN_OP_AND_uxn_c_l254_c4_48f4_left;
     BIN_OP_AND_uxn_c_l254_c4_48f4_right <= VAR_BIN_OP_AND_uxn_c_l254_c4_48f4_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l254_c4_48f4_return_output := BIN_OP_AND_uxn_c_l254_c4_48f4_return_output;

     -- Submodule level 2
     VAR_BIN_OP_OR_uxn_c_l252_c4_44d1_left := VAR_BIN_OP_AND_uxn_c_l251_c4_b1d9_return_output;
     VAR_BIN_OP_OR_uxn_c_l255_c4_a580_left := VAR_BIN_OP_AND_uxn_c_l254_c4_48f4_return_output;
     VAR_BIN_OP_OR_uxn_c_l258_c4_c75a_left := VAR_BIN_OP_AND_uxn_c_l257_c4_5426_return_output;
     VAR_BIN_OP_OR_uxn_c_l261_c4_9885_left := VAR_BIN_OP_AND_uxn_c_l260_c4_4dd6_return_output;
     VAR_BIN_OP_OR_uxn_c_l252_c4_44d1_right := VAR_CONST_SL_8_uint16_t_uxn_c_l258_l252_DUPLICATE_b807_return_output;
     VAR_BIN_OP_OR_uxn_c_l258_c4_c75a_right := VAR_CONST_SL_8_uint16_t_uxn_c_l258_l252_DUPLICATE_b807_return_output;
     -- BIN_OP_OR[uxn_c_l261_c4_9885] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l261_c4_9885_left <= VAR_BIN_OP_OR_uxn_c_l261_c4_9885_left;
     BIN_OP_OR_uxn_c_l261_c4_9885_right <= VAR_BIN_OP_OR_uxn_c_l261_c4_9885_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l261_c4_9885_return_output := BIN_OP_OR_uxn_c_l261_c4_9885_return_output;

     -- BIN_OP_OR[uxn_c_l255_c4_a580] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l255_c4_a580_left <= VAR_BIN_OP_OR_uxn_c_l255_c4_a580_left;
     BIN_OP_OR_uxn_c_l255_c4_a580_right <= VAR_BIN_OP_OR_uxn_c_l255_c4_a580_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l255_c4_a580_return_output := BIN_OP_OR_uxn_c_l255_c4_a580_return_output;

     -- BIN_OP_OR[uxn_c_l258_c4_c75a] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l258_c4_c75a_left <= VAR_BIN_OP_OR_uxn_c_l258_c4_c75a_left;
     BIN_OP_OR_uxn_c_l258_c4_c75a_right <= VAR_BIN_OP_OR_uxn_c_l258_c4_c75a_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l258_c4_c75a_return_output := BIN_OP_OR_uxn_c_l258_c4_c75a_return_output;

     -- BIN_OP_OR[uxn_c_l252_c4_44d1] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l252_c4_44d1_left <= VAR_BIN_OP_OR_uxn_c_l252_c4_44d1_left;
     BIN_OP_OR_uxn_c_l252_c4_44d1_right <= VAR_BIN_OP_OR_uxn_c_l252_c4_44d1_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l252_c4_44d1_return_output := BIN_OP_OR_uxn_c_l252_c4_44d1_return_output;

     -- Submodule level 3
     VAR_vectors_controller_MUX_uxn_c_l256_c10_6e60_iftrue := VAR_BIN_OP_OR_uxn_c_l258_c4_c75a_return_output;
     VAR_vectors_controller_MUX_uxn_c_l259_c10_498f_iftrue := VAR_BIN_OP_OR_uxn_c_l261_c4_9885_return_output;
     -- vectors_TRUE_INPUT_MUX_CONST_REF_RD_vector_snoop_result_t_vector_snoop_result_t_9b02[uxn_c_l253_c10_c63b] LATENCY=0
     VAR_vectors_TRUE_INPUT_MUX_CONST_REF_RD_vector_snoop_result_t_vector_snoop_result_t_9b02_uxn_c_l253_c10_c63b_return_output := CONST_REF_RD_vector_snoop_result_t_vector_snoop_result_t_9b02(
     vectors,
     VAR_BIN_OP_OR_uxn_c_l255_c4_a580_return_output);

     -- vectors_TRUE_INPUT_MUX_CONST_REF_RD_vector_snoop_result_t_vector_snoop_result_t_9b02[uxn_c_l250_c3_18aa] LATENCY=0
     VAR_vectors_TRUE_INPUT_MUX_CONST_REF_RD_vector_snoop_result_t_vector_snoop_result_t_9b02_uxn_c_l250_c3_18aa_return_output := CONST_REF_RD_vector_snoop_result_t_vector_snoop_result_t_9b02(
     vectors,
     VAR_BIN_OP_OR_uxn_c_l252_c4_44d1_return_output);

     -- vectors_controller_MUX[uxn_c_l259_c10_498f] LATENCY=0
     -- Inputs
     vectors_controller_MUX_uxn_c_l259_c10_498f_cond <= VAR_vectors_controller_MUX_uxn_c_l259_c10_498f_cond;
     vectors_controller_MUX_uxn_c_l259_c10_498f_iftrue <= VAR_vectors_controller_MUX_uxn_c_l259_c10_498f_iftrue;
     vectors_controller_MUX_uxn_c_l259_c10_498f_iffalse <= VAR_vectors_controller_MUX_uxn_c_l259_c10_498f_iffalse;
     -- Outputs
     VAR_vectors_controller_MUX_uxn_c_l259_c10_498f_return_output := vectors_controller_MUX_uxn_c_l259_c10_498f_return_output;

     -- Submodule level 4
     VAR_vectors_MUX_uxn_c_l250_c3_18aa_iftrue := VAR_vectors_TRUE_INPUT_MUX_CONST_REF_RD_vector_snoop_result_t_vector_snoop_result_t_9b02_uxn_c_l250_c3_18aa_return_output;
     VAR_vectors_MUX_uxn_c_l253_c10_c63b_iftrue := VAR_vectors_TRUE_INPUT_MUX_CONST_REF_RD_vector_snoop_result_t_vector_snoop_result_t_9b02_uxn_c_l253_c10_c63b_return_output;
     VAR_vectors_controller_MUX_uxn_c_l256_c10_6e60_iffalse := VAR_vectors_controller_MUX_uxn_c_l259_c10_498f_return_output;
     -- vectors_controller_MUX[uxn_c_l256_c10_6e60] LATENCY=0
     -- Inputs
     vectors_controller_MUX_uxn_c_l256_c10_6e60_cond <= VAR_vectors_controller_MUX_uxn_c_l256_c10_6e60_cond;
     vectors_controller_MUX_uxn_c_l256_c10_6e60_iftrue <= VAR_vectors_controller_MUX_uxn_c_l256_c10_6e60_iftrue;
     vectors_controller_MUX_uxn_c_l256_c10_6e60_iffalse <= VAR_vectors_controller_MUX_uxn_c_l256_c10_6e60_iffalse;
     -- Outputs
     VAR_vectors_controller_MUX_uxn_c_l256_c10_6e60_return_output := vectors_controller_MUX_uxn_c_l256_c10_6e60_return_output;

     -- Submodule level 5
     -- vectors_FALSE_INPUT_MUX_CONST_REF_RD_vector_snoop_result_t_vector_snoop_result_t_9d05[uxn_c_l253_c10_c63b] LATENCY=0
     VAR_vectors_FALSE_INPUT_MUX_CONST_REF_RD_vector_snoop_result_t_vector_snoop_result_t_9d05_uxn_c_l253_c10_c63b_return_output := CONST_REF_RD_vector_snoop_result_t_vector_snoop_result_t_9d05(
     vectors,
     VAR_vectors_controller_MUX_uxn_c_l256_c10_6e60_return_output);

     -- Submodule level 6
     VAR_vectors_MUX_uxn_c_l253_c10_c63b_iffalse := VAR_vectors_FALSE_INPUT_MUX_CONST_REF_RD_vector_snoop_result_t_vector_snoop_result_t_9d05_uxn_c_l253_c10_c63b_return_output;
     -- vectors_MUX[uxn_c_l253_c10_c63b] LATENCY=0
     -- Inputs
     vectors_MUX_uxn_c_l253_c10_c63b_cond <= VAR_vectors_MUX_uxn_c_l253_c10_c63b_cond;
     vectors_MUX_uxn_c_l253_c10_c63b_iftrue <= VAR_vectors_MUX_uxn_c_l253_c10_c63b_iftrue;
     vectors_MUX_uxn_c_l253_c10_c63b_iffalse <= VAR_vectors_MUX_uxn_c_l253_c10_c63b_iffalse;
     -- Outputs
     VAR_vectors_MUX_uxn_c_l253_c10_c63b_return_output := vectors_MUX_uxn_c_l253_c10_c63b_return_output;

     -- Submodule level 7
     VAR_vectors_MUX_uxn_c_l250_c3_18aa_iffalse := VAR_vectors_MUX_uxn_c_l253_c10_c63b_return_output;
     -- vectors_MUX[uxn_c_l250_c3_18aa] LATENCY=0
     -- Inputs
     vectors_MUX_uxn_c_l250_c3_18aa_cond <= VAR_vectors_MUX_uxn_c_l250_c3_18aa_cond;
     vectors_MUX_uxn_c_l250_c3_18aa_iftrue <= VAR_vectors_MUX_uxn_c_l250_c3_18aa_iftrue;
     vectors_MUX_uxn_c_l250_c3_18aa_iffalse <= VAR_vectors_MUX_uxn_c_l250_c3_18aa_iffalse;
     -- Outputs
     VAR_vectors_MUX_uxn_c_l250_c3_18aa_return_output := vectors_MUX_uxn_c_l250_c3_18aa_return_output;

     -- Submodule level 8
     VAR_vectors_MUX_uxn_c_l249_c2_088e_iftrue := VAR_vectors_MUX_uxn_c_l250_c3_18aa_return_output;
     -- vectors_MUX[uxn_c_l249_c2_088e] LATENCY=0
     -- Inputs
     vectors_MUX_uxn_c_l249_c2_088e_cond <= VAR_vectors_MUX_uxn_c_l249_c2_088e_cond;
     vectors_MUX_uxn_c_l249_c2_088e_iftrue <= VAR_vectors_MUX_uxn_c_l249_c2_088e_iftrue;
     vectors_MUX_uxn_c_l249_c2_088e_iffalse <= VAR_vectors_MUX_uxn_c_l249_c2_088e_iffalse;
     -- Outputs
     VAR_vectors_MUX_uxn_c_l249_c2_088e_return_output := vectors_MUX_uxn_c_l249_c2_088e_return_output;

     -- Submodule level 9
     VAR_return_output := VAR_vectors_MUX_uxn_c_l249_c2_088e_return_output;
     REG_VAR_vectors := VAR_vectors_MUX_uxn_c_l249_c2_088e_return_output;
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
