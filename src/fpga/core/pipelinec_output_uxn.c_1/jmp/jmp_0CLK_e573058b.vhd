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
-- Submodules: 35
entity jmp_0CLK_e573058b is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jmp_0CLK_e573058b;
architecture arch of jmp_0CLK_e573058b is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : signed(7 downto 0) := to_signed(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : signed(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l624_c6_a7db]
signal BIN_OP_EQ_uxn_opcodes_h_l624_c6_a7db_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l624_c6_a7db_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l624_c6_a7db_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l624_c1_ecec]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l624_c1_ecec_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l624_c1_ecec_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l624_c1_ecec_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l624_c1_ecec_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l624_c2_06bc]
signal t8_MUX_uxn_opcodes_h_l624_c2_06bc_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l624_c2_06bc_iftrue : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l624_c2_06bc_iffalse : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l624_c2_06bc_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l624_c2_06bc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c2_06bc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c2_06bc_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c2_06bc_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c2_06bc_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l624_c2_06bc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c2_06bc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c2_06bc_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c2_06bc_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c2_06bc_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l624_c2_06bc]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l624_c2_06bc_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l624_c2_06bc_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l624_c2_06bc_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l624_c2_06bc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l624_c2_06bc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l624_c2_06bc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l624_c2_06bc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l624_c2_06bc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l624_c2_06bc_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l624_c2_06bc]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l624_c2_06bc_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l624_c2_06bc_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l624_c2_06bc_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l624_c2_06bc_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l624_c2_06bc]
signal result_pc_MUX_uxn_opcodes_h_l624_c2_06bc_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l624_c2_06bc_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l624_c2_06bc_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l624_c2_06bc_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l625_c3_2286[uxn_opcodes_h_l625_c3_2286]
signal printf_uxn_opcodes_h_l625_c3_2286_uxn_opcodes_h_l625_c3_2286_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l629_c11_49bf]
signal BIN_OP_EQ_uxn_opcodes_h_l629_c11_49bf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l629_c11_49bf_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l629_c11_49bf_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l629_c7_5907]
signal t8_MUX_uxn_opcodes_h_l629_c7_5907_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l629_c7_5907_iftrue : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l629_c7_5907_iffalse : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l629_c7_5907_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l629_c7_5907]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l629_c7_5907_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l629_c7_5907_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l629_c7_5907_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l629_c7_5907_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l629_c7_5907]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_5907_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_5907_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_5907_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_5907_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l629_c7_5907]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_5907_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_5907_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_5907_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_5907_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l629_c7_5907]
signal result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_5907_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_5907_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_5907_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_5907_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l629_c7_5907]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_5907_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_5907_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_5907_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_5907_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l629_c7_5907]
signal result_pc_MUX_uxn_opcodes_h_l629_c7_5907_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l629_c7_5907_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l629_c7_5907_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l629_c7_5907_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l632_c11_3cd2]
signal BIN_OP_EQ_uxn_opcodes_h_l632_c11_3cd2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l632_c11_3cd2_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l632_c11_3cd2_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l632_c7_94f9]
signal t8_MUX_uxn_opcodes_h_l632_c7_94f9_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l632_c7_94f9_iftrue : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l632_c7_94f9_iffalse : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l632_c7_94f9_return_output : signed(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l632_c7_94f9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_94f9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_94f9_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_94f9_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_94f9_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l632_c7_94f9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_94f9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_94f9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_94f9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_94f9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l632_c7_94f9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_94f9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_94f9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_94f9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_94f9_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l632_c7_94f9]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l632_c7_94f9_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l632_c7_94f9_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l632_c7_94f9_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l632_c7_94f9_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l632_c7_94f9]
signal result_pc_MUX_uxn_opcodes_h_l632_c7_94f9_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l632_c7_94f9_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l632_c7_94f9_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l632_c7_94f9_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l635_c32_7df4]
signal BIN_OP_AND_uxn_opcodes_h_l635_c32_7df4_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l635_c32_7df4_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l635_c32_7df4_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l635_c32_5d53]
signal BIN_OP_GT_uxn_opcodes_h_l635_c32_5d53_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l635_c32_5d53_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l635_c32_5d53_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l635_c32_ef20]
signal MUX_uxn_opcodes_h_l635_c32_ef20_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l635_c32_ef20_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l635_c32_ef20_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l635_c32_ef20_return_output : signed(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l637_c15_3e7e]
signal BIN_OP_PLUS_uxn_opcodes_h_l637_c15_3e7e_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l637_c15_3e7e_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l637_c15_3e7e_return_output : signed(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l639_c11_420d]
signal BIN_OP_EQ_uxn_opcodes_h_l639_c11_420d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l639_c11_420d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l639_c11_420d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l639_c7_c38a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_c38a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_c38a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_c38a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_c38a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l639_c7_c38a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_c38a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_c38a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_c38a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_c38a_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l639_c7_c38a]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_c38a_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_c38a_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_c38a_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_c38a_return_output : unsigned(0 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_af99( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : signed;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_address_sp_offset := ref_toks_1;
      base.sp_relative_shift := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.is_pc_updated := ref_toks_5;
      base.pc := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l624_c6_a7db
BIN_OP_EQ_uxn_opcodes_h_l624_c6_a7db : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l624_c6_a7db_left,
BIN_OP_EQ_uxn_opcodes_h_l624_c6_a7db_right,
BIN_OP_EQ_uxn_opcodes_h_l624_c6_a7db_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l624_c1_ecec
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l624_c1_ecec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l624_c1_ecec_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l624_c1_ecec_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l624_c1_ecec_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l624_c1_ecec_return_output);

-- t8_MUX_uxn_opcodes_h_l624_c2_06bc
t8_MUX_uxn_opcodes_h_l624_c2_06bc : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l624_c2_06bc_cond,
t8_MUX_uxn_opcodes_h_l624_c2_06bc_iftrue,
t8_MUX_uxn_opcodes_h_l624_c2_06bc_iffalse,
t8_MUX_uxn_opcodes_h_l624_c2_06bc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c2_06bc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c2_06bc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c2_06bc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c2_06bc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c2_06bc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c2_06bc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c2_06bc
result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c2_06bc : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c2_06bc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c2_06bc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c2_06bc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c2_06bc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l624_c2_06bc
result_is_sp_shift_MUX_uxn_opcodes_h_l624_c2_06bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l624_c2_06bc_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l624_c2_06bc_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l624_c2_06bc_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l624_c2_06bc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l624_c2_06bc
result_is_opc_done_MUX_uxn_opcodes_h_l624_c2_06bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l624_c2_06bc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l624_c2_06bc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l624_c2_06bc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l624_c2_06bc_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l624_c2_06bc
result_is_pc_updated_MUX_uxn_opcodes_h_l624_c2_06bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l624_c2_06bc_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l624_c2_06bc_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l624_c2_06bc_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l624_c2_06bc_return_output);

-- result_pc_MUX_uxn_opcodes_h_l624_c2_06bc
result_pc_MUX_uxn_opcodes_h_l624_c2_06bc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l624_c2_06bc_cond,
result_pc_MUX_uxn_opcodes_h_l624_c2_06bc_iftrue,
result_pc_MUX_uxn_opcodes_h_l624_c2_06bc_iffalse,
result_pc_MUX_uxn_opcodes_h_l624_c2_06bc_return_output);

-- printf_uxn_opcodes_h_l625_c3_2286_uxn_opcodes_h_l625_c3_2286
printf_uxn_opcodes_h_l625_c3_2286_uxn_opcodes_h_l625_c3_2286 : entity work.printf_uxn_opcodes_h_l625_c3_2286_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l625_c3_2286_uxn_opcodes_h_l625_c3_2286_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l629_c11_49bf
BIN_OP_EQ_uxn_opcodes_h_l629_c11_49bf : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l629_c11_49bf_left,
BIN_OP_EQ_uxn_opcodes_h_l629_c11_49bf_right,
BIN_OP_EQ_uxn_opcodes_h_l629_c11_49bf_return_output);

-- t8_MUX_uxn_opcodes_h_l629_c7_5907
t8_MUX_uxn_opcodes_h_l629_c7_5907 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l629_c7_5907_cond,
t8_MUX_uxn_opcodes_h_l629_c7_5907_iftrue,
t8_MUX_uxn_opcodes_h_l629_c7_5907_iffalse,
t8_MUX_uxn_opcodes_h_l629_c7_5907_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l629_c7_5907
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l629_c7_5907 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l629_c7_5907_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l629_c7_5907_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l629_c7_5907_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l629_c7_5907_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_5907
result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_5907 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_5907_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_5907_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_5907_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_5907_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_5907
result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_5907 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_5907_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_5907_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_5907_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_5907_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_5907
result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_5907 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_5907_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_5907_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_5907_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_5907_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_5907
result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_5907 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_5907_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_5907_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_5907_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_5907_return_output);

-- result_pc_MUX_uxn_opcodes_h_l629_c7_5907
result_pc_MUX_uxn_opcodes_h_l629_c7_5907 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l629_c7_5907_cond,
result_pc_MUX_uxn_opcodes_h_l629_c7_5907_iftrue,
result_pc_MUX_uxn_opcodes_h_l629_c7_5907_iffalse,
result_pc_MUX_uxn_opcodes_h_l629_c7_5907_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l632_c11_3cd2
BIN_OP_EQ_uxn_opcodes_h_l632_c11_3cd2 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l632_c11_3cd2_left,
BIN_OP_EQ_uxn_opcodes_h_l632_c11_3cd2_right,
BIN_OP_EQ_uxn_opcodes_h_l632_c11_3cd2_return_output);

-- t8_MUX_uxn_opcodes_h_l632_c7_94f9
t8_MUX_uxn_opcodes_h_l632_c7_94f9 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l632_c7_94f9_cond,
t8_MUX_uxn_opcodes_h_l632_c7_94f9_iftrue,
t8_MUX_uxn_opcodes_h_l632_c7_94f9_iffalse,
t8_MUX_uxn_opcodes_h_l632_c7_94f9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_94f9
result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_94f9 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_94f9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_94f9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_94f9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_94f9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_94f9
result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_94f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_94f9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_94f9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_94f9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_94f9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_94f9
result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_94f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_94f9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_94f9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_94f9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_94f9_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l632_c7_94f9
result_is_pc_updated_MUX_uxn_opcodes_h_l632_c7_94f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l632_c7_94f9_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l632_c7_94f9_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l632_c7_94f9_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l632_c7_94f9_return_output);

-- result_pc_MUX_uxn_opcodes_h_l632_c7_94f9
result_pc_MUX_uxn_opcodes_h_l632_c7_94f9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l632_c7_94f9_cond,
result_pc_MUX_uxn_opcodes_h_l632_c7_94f9_iftrue,
result_pc_MUX_uxn_opcodes_h_l632_c7_94f9_iffalse,
result_pc_MUX_uxn_opcodes_h_l632_c7_94f9_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l635_c32_7df4
BIN_OP_AND_uxn_opcodes_h_l635_c32_7df4 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l635_c32_7df4_left,
BIN_OP_AND_uxn_opcodes_h_l635_c32_7df4_right,
BIN_OP_AND_uxn_opcodes_h_l635_c32_7df4_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l635_c32_5d53
BIN_OP_GT_uxn_opcodes_h_l635_c32_5d53 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l635_c32_5d53_left,
BIN_OP_GT_uxn_opcodes_h_l635_c32_5d53_right,
BIN_OP_GT_uxn_opcodes_h_l635_c32_5d53_return_output);

-- MUX_uxn_opcodes_h_l635_c32_ef20
MUX_uxn_opcodes_h_l635_c32_ef20 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l635_c32_ef20_cond,
MUX_uxn_opcodes_h_l635_c32_ef20_iftrue,
MUX_uxn_opcodes_h_l635_c32_ef20_iffalse,
MUX_uxn_opcodes_h_l635_c32_ef20_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l637_c15_3e7e
BIN_OP_PLUS_uxn_opcodes_h_l637_c15_3e7e : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l637_c15_3e7e_left,
BIN_OP_PLUS_uxn_opcodes_h_l637_c15_3e7e_right,
BIN_OP_PLUS_uxn_opcodes_h_l637_c15_3e7e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l639_c11_420d
BIN_OP_EQ_uxn_opcodes_h_l639_c11_420d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l639_c11_420d_left,
BIN_OP_EQ_uxn_opcodes_h_l639_c11_420d_right,
BIN_OP_EQ_uxn_opcodes_h_l639_c11_420d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_c38a
result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_c38a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_c38a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_c38a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_c38a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_c38a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_c38a
result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_c38a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_c38a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_c38a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_c38a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_c38a_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_c38a
result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_c38a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_c38a_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_c38a_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_c38a_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_c38a_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 pc,
 previous_stack_read,
 -- Registers
 t8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l624_c6_a7db_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l624_c1_ecec_return_output,
 t8_MUX_uxn_opcodes_h_l624_c2_06bc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c2_06bc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c2_06bc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l624_c2_06bc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l624_c2_06bc_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l624_c2_06bc_return_output,
 result_pc_MUX_uxn_opcodes_h_l624_c2_06bc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l629_c11_49bf_return_output,
 t8_MUX_uxn_opcodes_h_l629_c7_5907_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l629_c7_5907_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_5907_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_5907_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_5907_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_5907_return_output,
 result_pc_MUX_uxn_opcodes_h_l629_c7_5907_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l632_c11_3cd2_return_output,
 t8_MUX_uxn_opcodes_h_l632_c7_94f9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_94f9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_94f9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_94f9_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l632_c7_94f9_return_output,
 result_pc_MUX_uxn_opcodes_h_l632_c7_94f9_return_output,
 BIN_OP_AND_uxn_opcodes_h_l635_c32_7df4_return_output,
 BIN_OP_GT_uxn_opcodes_h_l635_c32_5d53_return_output,
 MUX_uxn_opcodes_h_l635_c32_ef20_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l637_c15_3e7e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l639_c11_420d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_c38a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_c38a_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_c38a_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c6_a7db_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c6_a7db_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c6_a7db_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l624_c1_ecec_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l624_c1_ecec_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l624_c1_ecec_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l624_c1_ecec_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l624_c2_06bc_iftrue : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l624_c2_06bc_iffalse : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l629_c7_5907_return_output : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l624_c2_06bc_return_output : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l624_c2_06bc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c2_06bc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l626_c3_fe39 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c2_06bc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l629_c7_5907_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c2_06bc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c2_06bc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c2_06bc_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c2_06bc_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_5907_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c2_06bc_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c2_06bc_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l624_c2_06bc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l624_c2_06bc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_5907_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l624_c2_06bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l624_c2_06bc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l624_c2_06bc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l624_c2_06bc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_5907_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l624_c2_06bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l624_c2_06bc_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l624_c2_06bc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l624_c2_06bc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_5907_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l624_c2_06bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l624_c2_06bc_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l624_c2_06bc_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l624_c2_06bc_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l629_c7_5907_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l624_c2_06bc_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l624_c2_06bc_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l625_c3_2286_uxn_opcodes_h_l625_c3_2286_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_49bf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_49bf_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_49bf_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l629_c7_5907_iftrue : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l629_c7_5907_iffalse : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l632_c7_94f9_return_output : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l629_c7_5907_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l629_c7_5907_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l630_c3_2f19 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l629_c7_5907_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l629_c7_5907_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l629_c7_5907_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_5907_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_5907_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_94f9_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_5907_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_5907_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_5907_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_94f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_5907_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_5907_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_5907_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_94f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_5907_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_5907_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_5907_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l632_c7_94f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_5907_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l629_c7_5907_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l629_c7_5907_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l632_c7_94f9_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l629_c7_5907_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c11_3cd2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c11_3cd2_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c11_3cd2_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l632_c7_94f9_iftrue : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l632_c7_94f9_iffalse : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l632_c7_94f9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_94f9_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_94f9_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_94f9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_94f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_94f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_c38a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_94f9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_94f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_94f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_c38a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_94f9_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l632_c7_94f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l632_c7_94f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_c38a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l632_c7_94f9_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l632_c7_94f9_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_uxn_opcodes_h_l637_c3_1d1b : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l632_c7_94f9_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l632_c7_94f9_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l633_c8_11d8_return_output : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l635_c32_ef20_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l635_c32_ef20_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l635_c32_ef20_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l635_c32_7df4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l635_c32_7df4_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l635_c32_7df4_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l635_c32_5d53_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l635_c32_5d53_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l635_c32_5d53_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l635_c32_ef20_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l637_c15_3e7e_left : signed(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l637_c15_3e7e_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l637_c15_3e7e_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l639_c11_420d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l639_c11_420d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l639_c11_420d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_c38a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_c38a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_c38a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_c38a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_c38a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_c38a_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_c38a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_c38a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_c38a_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l632_l624_l629_DUPLICATE_001e_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l639_l624_l629_DUPLICATE_4821_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l639_l624_l629_DUPLICATE_dd8c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l632_l624_l629_DUPLICATE_394c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l639_l632_l629_DUPLICATE_6ebe_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_af99_uxn_opcodes_h_l645_l620_DUPLICATE_875c_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : signed(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_GT_uxn_opcodes_h_l635_c32_5d53_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_c38a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c6_a7db_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_94f9_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l635_c32_7df4_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_49bf_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l624_c2_06bc_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l639_c11_420d_right := to_unsigned(3, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_c38a_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l626_c3_fe39 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c2_06bc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l626_c3_fe39;
     VAR_MUX_uxn_opcodes_h_l635_c32_ef20_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_c38a_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c11_3cd2_right := to_unsigned(2, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l632_c7_94f9_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l624_c1_ecec_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l635_c32_ef20_iffalse := resize(to_signed(-1, 2), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l630_c3_2f19 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l629_c7_5907_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l630_c3_2f19;

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_pc := pc;
     VAR_previous_stack_read := previous_stack_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l624_c1_ecec_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l635_c32_7df4_left := VAR_ins;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l637_c15_3e7e_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c6_a7db_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_49bf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c11_3cd2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l639_c11_420d_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l624_c2_06bc_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l629_c7_5907_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l632_c7_94f9_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l639_c11_420d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l639_c11_420d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l639_c11_420d_left;
     BIN_OP_EQ_uxn_opcodes_h_l639_c11_420d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l639_c11_420d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l639_c11_420d_return_output := BIN_OP_EQ_uxn_opcodes_h_l639_c11_420d_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l632_l624_l629_DUPLICATE_394c LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l632_l624_l629_DUPLICATE_394c_return_output := result.pc;

     -- BIN_OP_EQ[uxn_opcodes_h_l624_c6_a7db] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l624_c6_a7db_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c6_a7db_left;
     BIN_OP_EQ_uxn_opcodes_h_l624_c6_a7db_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c6_a7db_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c6_a7db_return_output := BIN_OP_EQ_uxn_opcodes_h_l624_c6_a7db_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l629_c11_49bf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l629_c11_49bf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_49bf_left;
     BIN_OP_EQ_uxn_opcodes_h_l629_c11_49bf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_49bf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_49bf_return_output := BIN_OP_EQ_uxn_opcodes_h_l629_c11_49bf_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l639_l624_l629_DUPLICATE_dd8c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l639_l624_l629_DUPLICATE_dd8c_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l639_l624_l629_DUPLICATE_4821 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l639_l624_l629_DUPLICATE_4821_return_output := result.is_sp_shift;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l629_c7_5907] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l629_c7_5907_return_output := result.stack_address_sp_offset;

     -- BIN_OP_AND[uxn_opcodes_h_l635_c32_7df4] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l635_c32_7df4_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l635_c32_7df4_left;
     BIN_OP_AND_uxn_opcodes_h_l635_c32_7df4_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l635_c32_7df4_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l635_c32_7df4_return_output := BIN_OP_AND_uxn_opcodes_h_l635_c32_7df4_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l632_l624_l629_DUPLICATE_001e LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l632_l624_l629_DUPLICATE_001e_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l632_c11_3cd2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l632_c11_3cd2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c11_3cd2_left;
     BIN_OP_EQ_uxn_opcodes_h_l632_c11_3cd2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c11_3cd2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c11_3cd2_return_output := BIN_OP_EQ_uxn_opcodes_h_l632_c11_3cd2_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l639_l632_l629_DUPLICATE_6ebe LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l639_l632_l629_DUPLICATE_6ebe_return_output := result.is_opc_done;

     -- CAST_TO_int8_t[uxn_opcodes_h_l633_c8_11d8] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l633_c8_11d8_return_output := CAST_TO_int8_t_uint8_t(
     VAR_previous_stack_read);

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l635_c32_5d53_left := VAR_BIN_OP_AND_uxn_opcodes_h_l635_c32_7df4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l624_c1_ecec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c6_a7db_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l624_c2_06bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c6_a7db_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l624_c2_06bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c6_a7db_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l624_c2_06bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c6_a7db_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l624_c2_06bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c6_a7db_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c2_06bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c6_a7db_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c2_06bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c6_a7db_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l624_c2_06bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c6_a7db_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_5907_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_49bf_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_5907_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_49bf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_5907_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_49bf_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l629_c7_5907_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_49bf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_5907_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_49bf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l629_c7_5907_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_49bf_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l629_c7_5907_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_49bf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_94f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c11_3cd2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l632_c7_94f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c11_3cd2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_94f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c11_3cd2_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l632_c7_94f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c11_3cd2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_94f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c11_3cd2_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l632_c7_94f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c11_3cd2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_c38a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l639_c11_420d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_c38a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l639_c11_420d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_c38a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l639_c11_420d_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l637_c15_3e7e_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l633_c8_11d8_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l632_c7_94f9_iftrue := VAR_CAST_TO_int8_t_uxn_opcodes_h_l633_c8_11d8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c2_06bc_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l632_l624_l629_DUPLICATE_001e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_5907_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l632_l624_l629_DUPLICATE_001e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_94f9_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l632_l624_l629_DUPLICATE_001e_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l624_c2_06bc_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l632_l624_l629_DUPLICATE_394c_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l629_c7_5907_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l632_l624_l629_DUPLICATE_394c_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l632_c7_94f9_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l632_l624_l629_DUPLICATE_394c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_5907_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l639_l632_l629_DUPLICATE_6ebe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_94f9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l639_l632_l629_DUPLICATE_6ebe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_c38a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l639_l632_l629_DUPLICATE_6ebe_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l624_c2_06bc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l639_l624_l629_DUPLICATE_dd8c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_5907_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l639_l624_l629_DUPLICATE_dd8c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_c38a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l639_l624_l629_DUPLICATE_dd8c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l624_c2_06bc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l639_l624_l629_DUPLICATE_4821_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_5907_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l639_l624_l629_DUPLICATE_4821_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_c38a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l639_l624_l629_DUPLICATE_4821_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l629_c7_5907_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l629_c7_5907_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l635_c32_5d53] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l635_c32_5d53_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l635_c32_5d53_left;
     BIN_OP_GT_uxn_opcodes_h_l635_c32_5d53_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l635_c32_5d53_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l635_c32_5d53_return_output := BIN_OP_GT_uxn_opcodes_h_l635_c32_5d53_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l639_c7_c38a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_c38a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_c38a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_c38a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_c38a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_c38a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_c38a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_c38a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_c38a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l629_c7_5907] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l629_c7_5907_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l629_c7_5907_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l629_c7_5907_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l629_c7_5907_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l629_c7_5907_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l629_c7_5907_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l629_c7_5907_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l629_c7_5907_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l637_c15_3e7e] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l637_c15_3e7e_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l637_c15_3e7e_left;
     BIN_OP_PLUS_uxn_opcodes_h_l637_c15_3e7e_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l637_c15_3e7e_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l637_c15_3e7e_return_output := BIN_OP_PLUS_uxn_opcodes_h_l637_c15_3e7e_return_output;

     -- t8_MUX[uxn_opcodes_h_l632_c7_94f9] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l632_c7_94f9_cond <= VAR_t8_MUX_uxn_opcodes_h_l632_c7_94f9_cond;
     t8_MUX_uxn_opcodes_h_l632_c7_94f9_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l632_c7_94f9_iftrue;
     t8_MUX_uxn_opcodes_h_l632_c7_94f9_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l632_c7_94f9_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l632_c7_94f9_return_output := t8_MUX_uxn_opcodes_h_l632_c7_94f9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l639_c7_c38a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_c38a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_c38a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_c38a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_c38a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_c38a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_c38a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_c38a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_c38a_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l639_c7_c38a] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_c38a_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_c38a_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_c38a_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_c38a_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_c38a_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_c38a_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_c38a_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_c38a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l624_c1_ecec] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l624_c1_ecec_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l624_c1_ecec_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l624_c1_ecec_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l624_c1_ecec_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l624_c1_ecec_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l624_c1_ecec_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l624_c1_ecec_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l624_c1_ecec_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l635_c32_ef20_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l635_c32_5d53_return_output;
     VAR_result_pc_uxn_opcodes_h_l637_c3_1d1b := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l637_c15_3e7e_return_output)),16);
     VAR_printf_uxn_opcodes_h_l625_c3_2286_uxn_opcodes_h_l625_c3_2286_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l624_c1_ecec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_94f9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_c38a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l632_c7_94f9_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_c38a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_94f9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_c38a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c2_06bc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l629_c7_5907_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l629_c7_5907_iffalse := VAR_t8_MUX_uxn_opcodes_h_l632_c7_94f9_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l632_c7_94f9_iftrue := VAR_result_pc_uxn_opcodes_h_l637_c3_1d1b;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l632_c7_94f9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_94f9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_94f9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_94f9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_94f9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_94f9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_94f9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_94f9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_94f9_return_output;

     -- printf_uxn_opcodes_h_l625_c3_2286[uxn_opcodes_h_l625_c3_2286] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l625_c3_2286_uxn_opcodes_h_l625_c3_2286_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l625_c3_2286_uxn_opcodes_h_l625_c3_2286_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- t8_MUX[uxn_opcodes_h_l629_c7_5907] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l629_c7_5907_cond <= VAR_t8_MUX_uxn_opcodes_h_l629_c7_5907_cond;
     t8_MUX_uxn_opcodes_h_l629_c7_5907_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l629_c7_5907_iftrue;
     t8_MUX_uxn_opcodes_h_l629_c7_5907_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l629_c7_5907_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l629_c7_5907_return_output := t8_MUX_uxn_opcodes_h_l629_c7_5907_return_output;

     -- MUX[uxn_opcodes_h_l635_c32_ef20] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l635_c32_ef20_cond <= VAR_MUX_uxn_opcodes_h_l635_c32_ef20_cond;
     MUX_uxn_opcodes_h_l635_c32_ef20_iftrue <= VAR_MUX_uxn_opcodes_h_l635_c32_ef20_iftrue;
     MUX_uxn_opcodes_h_l635_c32_ef20_iffalse <= VAR_MUX_uxn_opcodes_h_l635_c32_ef20_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l635_c32_ef20_return_output := MUX_uxn_opcodes_h_l635_c32_ef20_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l632_c7_94f9] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l632_c7_94f9_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l632_c7_94f9_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l632_c7_94f9_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l632_c7_94f9_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l632_c7_94f9_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l632_c7_94f9_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l632_c7_94f9_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l632_c7_94f9_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l632_c7_94f9] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l632_c7_94f9_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l632_c7_94f9_cond;
     result_pc_MUX_uxn_opcodes_h_l632_c7_94f9_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l632_c7_94f9_iftrue;
     result_pc_MUX_uxn_opcodes_h_l632_c7_94f9_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l632_c7_94f9_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l632_c7_94f9_return_output := result_pc_MUX_uxn_opcodes_h_l632_c7_94f9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l632_c7_94f9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_94f9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_94f9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_94f9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_94f9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_94f9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_94f9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_94f9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_94f9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l624_c2_06bc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c2_06bc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c2_06bc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c2_06bc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c2_06bc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c2_06bc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c2_06bc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c2_06bc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c2_06bc_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_94f9_iftrue := VAR_MUX_uxn_opcodes_h_l635_c32_ef20_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_5907_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_94f9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_5907_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l632_c7_94f9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_5907_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_94f9_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l629_c7_5907_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l632_c7_94f9_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l624_c2_06bc_iffalse := VAR_t8_MUX_uxn_opcodes_h_l629_c7_5907_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l632_c7_94f9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_94f9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_94f9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_94f9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_94f9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_94f9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_94f9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_94f9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_94f9_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l629_c7_5907] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_5907_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_5907_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_5907_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_5907_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_5907_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_5907_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_5907_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_5907_return_output;

     -- t8_MUX[uxn_opcodes_h_l624_c2_06bc] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l624_c2_06bc_cond <= VAR_t8_MUX_uxn_opcodes_h_l624_c2_06bc_cond;
     t8_MUX_uxn_opcodes_h_l624_c2_06bc_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l624_c2_06bc_iftrue;
     t8_MUX_uxn_opcodes_h_l624_c2_06bc_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l624_c2_06bc_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l624_c2_06bc_return_output := t8_MUX_uxn_opcodes_h_l624_c2_06bc_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l629_c7_5907] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_5907_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_5907_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_5907_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_5907_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_5907_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_5907_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_5907_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_5907_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l629_c7_5907] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l629_c7_5907_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l629_c7_5907_cond;
     result_pc_MUX_uxn_opcodes_h_l629_c7_5907_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l629_c7_5907_iftrue;
     result_pc_MUX_uxn_opcodes_h_l629_c7_5907_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l629_c7_5907_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l629_c7_5907_return_output := result_pc_MUX_uxn_opcodes_h_l629_c7_5907_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l629_c7_5907] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_5907_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_5907_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_5907_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_5907_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_5907_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_5907_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_5907_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_5907_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l624_c2_06bc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_5907_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l624_c2_06bc_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_5907_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l624_c2_06bc_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_5907_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l624_c2_06bc_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l629_c7_5907_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_5907_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_94f9_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l624_c2_06bc_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l624_c2_06bc] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l624_c2_06bc_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l624_c2_06bc_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l624_c2_06bc_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l624_c2_06bc_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l624_c2_06bc_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l624_c2_06bc_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l624_c2_06bc_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l624_c2_06bc_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l624_c2_06bc] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l624_c2_06bc_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l624_c2_06bc_cond;
     result_pc_MUX_uxn_opcodes_h_l624_c2_06bc_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l624_c2_06bc_iftrue;
     result_pc_MUX_uxn_opcodes_h_l624_c2_06bc_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l624_c2_06bc_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l624_c2_06bc_return_output := result_pc_MUX_uxn_opcodes_h_l624_c2_06bc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l629_c7_5907] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_5907_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_5907_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_5907_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_5907_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_5907_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_5907_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_5907_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_5907_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l624_c2_06bc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l624_c2_06bc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l624_c2_06bc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l624_c2_06bc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l624_c2_06bc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l624_c2_06bc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l624_c2_06bc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l624_c2_06bc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l624_c2_06bc_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l624_c2_06bc] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l624_c2_06bc_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l624_c2_06bc_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l624_c2_06bc_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l624_c2_06bc_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l624_c2_06bc_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l624_c2_06bc_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l624_c2_06bc_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l624_c2_06bc_return_output;

     -- Submodule level 5
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c2_06bc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_5907_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l624_c2_06bc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c2_06bc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c2_06bc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c2_06bc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c2_06bc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c2_06bc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c2_06bc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c2_06bc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c2_06bc_return_output;

     -- Submodule level 6
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_af99_uxn_opcodes_h_l645_l620_DUPLICATE_875c LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_af99_uxn_opcodes_h_l645_l620_DUPLICATE_875c_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_af99(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c2_06bc_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c2_06bc_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l624_c2_06bc_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l624_c2_06bc_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l624_c2_06bc_return_output,
     VAR_result_pc_MUX_uxn_opcodes_h_l624_c2_06bc_return_output);

     -- Submodule level 7
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_af99_uxn_opcodes_h_l645_l620_DUPLICATE_875c_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_af99_uxn_opcodes_h_l645_l620_DUPLICATE_875c_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
