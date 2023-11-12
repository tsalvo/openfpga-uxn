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
-- Submodules: 33
entity jmp_0CLK_b7103d16 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jmp_0CLK_b7103d16;
architecture arch of jmp_0CLK_b7103d16 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l584_c6_77d6]
signal BIN_OP_EQ_uxn_opcodes_h_l584_c6_77d6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l584_c6_77d6_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l584_c6_77d6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l584_c1_3c4e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_3c4e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_3c4e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_3c4e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_3c4e_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l584_c2_92d5]
signal t8_MUX_uxn_opcodes_h_l584_c2_92d5_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l584_c2_92d5_iftrue : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l584_c2_92d5_iffalse : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l584_c2_92d5_return_output : signed(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l584_c2_92d5]
signal result_u16_value_MUX_uxn_opcodes_h_l584_c2_92d5_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l584_c2_92d5_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l584_c2_92d5_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l584_c2_92d5_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l584_c2_92d5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_92d5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_92d5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_92d5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_92d5_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l584_c2_92d5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_92d5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_92d5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_92d5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_92d5_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l584_c2_92d5]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l584_c2_92d5_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l584_c2_92d5_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l584_c2_92d5_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l584_c2_92d5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l584_c2_92d5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_92d5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_92d5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_92d5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_92d5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l584_c2_92d5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_92d5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_92d5_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_92d5_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_92d5_return_output : signed(3 downto 0);

-- printf_uxn_opcodes_h_l585_c3_f54d[uxn_opcodes_h_l585_c3_f54d]
signal printf_uxn_opcodes_h_l585_c3_f54d_uxn_opcodes_h_l585_c3_f54d_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l589_c11_c923]
signal BIN_OP_EQ_uxn_opcodes_h_l589_c11_c923_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l589_c11_c923_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l589_c11_c923_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l589_c7_a3a1]
signal t8_MUX_uxn_opcodes_h_l589_c7_a3a1_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l589_c7_a3a1_iftrue : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l589_c7_a3a1_iffalse : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l589_c7_a3a1_return_output : signed(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l589_c7_a3a1]
signal result_u16_value_MUX_uxn_opcodes_h_l589_c7_a3a1_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l589_c7_a3a1_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l589_c7_a3a1_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l589_c7_a3a1_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l589_c7_a3a1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_a3a1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_a3a1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_a3a1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_a3a1_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l589_c7_a3a1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_a3a1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_a3a1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_a3a1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_a3a1_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l589_c7_a3a1]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_a3a1_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_a3a1_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_a3a1_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_a3a1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l589_c7_a3a1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_a3a1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_a3a1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_a3a1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_a3a1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l589_c7_a3a1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_a3a1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_a3a1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_a3a1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_a3a1_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l592_c11_4f82]
signal BIN_OP_EQ_uxn_opcodes_h_l592_c11_4f82_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l592_c11_4f82_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l592_c11_4f82_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l592_c7_6ffd]
signal t8_MUX_uxn_opcodes_h_l592_c7_6ffd_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l592_c7_6ffd_iftrue : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l592_c7_6ffd_iffalse : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l592_c7_6ffd_return_output : signed(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l592_c7_6ffd]
signal result_u16_value_MUX_uxn_opcodes_h_l592_c7_6ffd_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l592_c7_6ffd_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l592_c7_6ffd_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l592_c7_6ffd_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l592_c7_6ffd]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_6ffd_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_6ffd_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_6ffd_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_6ffd_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l592_c7_6ffd]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l592_c7_6ffd_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l592_c7_6ffd_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l592_c7_6ffd_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l592_c7_6ffd_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l592_c7_6ffd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_6ffd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_6ffd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_6ffd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_6ffd_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l592_c7_6ffd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_6ffd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_6ffd_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_6ffd_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_6ffd_return_output : signed(3 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l595_c30_01f5]
signal sp_relative_shift_uxn_opcodes_h_l595_c30_01f5_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l595_c30_01f5_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l595_c30_01f5_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l595_c30_01f5_return_output : signed(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l597_c22_f277]
signal BIN_OP_PLUS_uxn_opcodes_h_l597_c22_f277_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l597_c22_f277_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l597_c22_f277_return_output : signed(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l599_c11_d577]
signal BIN_OP_EQ_uxn_opcodes_h_l599_c11_d577_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l599_c11_d577_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l599_c11_d577_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l599_c7_b186]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_b186_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_b186_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_b186_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_b186_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l599_c7_b186]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_b186_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_b186_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_b186_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_b186_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l599_c7_b186]
signal result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_b186_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_b186_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_b186_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_b186_return_output : unsigned(0 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_6245( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u16_value := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.is_pc_updated := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l584_c6_77d6
BIN_OP_EQ_uxn_opcodes_h_l584_c6_77d6 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l584_c6_77d6_left,
BIN_OP_EQ_uxn_opcodes_h_l584_c6_77d6_right,
BIN_OP_EQ_uxn_opcodes_h_l584_c6_77d6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_3c4e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_3c4e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_3c4e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_3c4e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_3c4e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_3c4e_return_output);

-- t8_MUX_uxn_opcodes_h_l584_c2_92d5
t8_MUX_uxn_opcodes_h_l584_c2_92d5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l584_c2_92d5_cond,
t8_MUX_uxn_opcodes_h_l584_c2_92d5_iftrue,
t8_MUX_uxn_opcodes_h_l584_c2_92d5_iffalse,
t8_MUX_uxn_opcodes_h_l584_c2_92d5_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l584_c2_92d5
result_u16_value_MUX_uxn_opcodes_h_l584_c2_92d5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l584_c2_92d5_cond,
result_u16_value_MUX_uxn_opcodes_h_l584_c2_92d5_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l584_c2_92d5_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l584_c2_92d5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_92d5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_92d5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_92d5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_92d5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_92d5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_92d5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_92d5
result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_92d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_92d5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_92d5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_92d5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_92d5_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l584_c2_92d5
result_is_pc_updated_MUX_uxn_opcodes_h_l584_c2_92d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l584_c2_92d5_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l584_c2_92d5_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l584_c2_92d5_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l584_c2_92d5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_92d5
result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_92d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_92d5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_92d5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_92d5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_92d5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_92d5
result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_92d5 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_92d5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_92d5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_92d5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_92d5_return_output);

-- printf_uxn_opcodes_h_l585_c3_f54d_uxn_opcodes_h_l585_c3_f54d
printf_uxn_opcodes_h_l585_c3_f54d_uxn_opcodes_h_l585_c3_f54d : entity work.printf_uxn_opcodes_h_l585_c3_f54d_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l585_c3_f54d_uxn_opcodes_h_l585_c3_f54d_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l589_c11_c923
BIN_OP_EQ_uxn_opcodes_h_l589_c11_c923 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l589_c11_c923_left,
BIN_OP_EQ_uxn_opcodes_h_l589_c11_c923_right,
BIN_OP_EQ_uxn_opcodes_h_l589_c11_c923_return_output);

-- t8_MUX_uxn_opcodes_h_l589_c7_a3a1
t8_MUX_uxn_opcodes_h_l589_c7_a3a1 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l589_c7_a3a1_cond,
t8_MUX_uxn_opcodes_h_l589_c7_a3a1_iftrue,
t8_MUX_uxn_opcodes_h_l589_c7_a3a1_iffalse,
t8_MUX_uxn_opcodes_h_l589_c7_a3a1_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l589_c7_a3a1
result_u16_value_MUX_uxn_opcodes_h_l589_c7_a3a1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l589_c7_a3a1_cond,
result_u16_value_MUX_uxn_opcodes_h_l589_c7_a3a1_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l589_c7_a3a1_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l589_c7_a3a1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_a3a1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_a3a1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_a3a1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_a3a1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_a3a1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_a3a1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_a3a1
result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_a3a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_a3a1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_a3a1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_a3a1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_a3a1_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_a3a1
result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_a3a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_a3a1_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_a3a1_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_a3a1_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_a3a1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_a3a1
result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_a3a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_a3a1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_a3a1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_a3a1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_a3a1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_a3a1
result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_a3a1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_a3a1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_a3a1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_a3a1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_a3a1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l592_c11_4f82
BIN_OP_EQ_uxn_opcodes_h_l592_c11_4f82 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l592_c11_4f82_left,
BIN_OP_EQ_uxn_opcodes_h_l592_c11_4f82_right,
BIN_OP_EQ_uxn_opcodes_h_l592_c11_4f82_return_output);

-- t8_MUX_uxn_opcodes_h_l592_c7_6ffd
t8_MUX_uxn_opcodes_h_l592_c7_6ffd : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l592_c7_6ffd_cond,
t8_MUX_uxn_opcodes_h_l592_c7_6ffd_iftrue,
t8_MUX_uxn_opcodes_h_l592_c7_6ffd_iffalse,
t8_MUX_uxn_opcodes_h_l592_c7_6ffd_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l592_c7_6ffd
result_u16_value_MUX_uxn_opcodes_h_l592_c7_6ffd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l592_c7_6ffd_cond,
result_u16_value_MUX_uxn_opcodes_h_l592_c7_6ffd_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l592_c7_6ffd_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l592_c7_6ffd_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_6ffd
result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_6ffd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_6ffd_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_6ffd_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_6ffd_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_6ffd_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l592_c7_6ffd
result_is_pc_updated_MUX_uxn_opcodes_h_l592_c7_6ffd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l592_c7_6ffd_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l592_c7_6ffd_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l592_c7_6ffd_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l592_c7_6ffd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_6ffd
result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_6ffd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_6ffd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_6ffd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_6ffd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_6ffd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_6ffd
result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_6ffd : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_6ffd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_6ffd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_6ffd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_6ffd_return_output);

-- sp_relative_shift_uxn_opcodes_h_l595_c30_01f5
sp_relative_shift_uxn_opcodes_h_l595_c30_01f5 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l595_c30_01f5_ins,
sp_relative_shift_uxn_opcodes_h_l595_c30_01f5_x,
sp_relative_shift_uxn_opcodes_h_l595_c30_01f5_y,
sp_relative_shift_uxn_opcodes_h_l595_c30_01f5_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l597_c22_f277
BIN_OP_PLUS_uxn_opcodes_h_l597_c22_f277 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l597_c22_f277_left,
BIN_OP_PLUS_uxn_opcodes_h_l597_c22_f277_right,
BIN_OP_PLUS_uxn_opcodes_h_l597_c22_f277_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l599_c11_d577
BIN_OP_EQ_uxn_opcodes_h_l599_c11_d577 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l599_c11_d577_left,
BIN_OP_EQ_uxn_opcodes_h_l599_c11_d577_right,
BIN_OP_EQ_uxn_opcodes_h_l599_c11_d577_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_b186
result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_b186 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_b186_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_b186_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_b186_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_b186_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_b186
result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_b186 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_b186_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_b186_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_b186_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_b186_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_b186
result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_b186 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_b186_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_b186_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_b186_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_b186_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l584_c6_77d6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_3c4e_return_output,
 t8_MUX_uxn_opcodes_h_l584_c2_92d5_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l584_c2_92d5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_92d5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_92d5_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l584_c2_92d5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_92d5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_92d5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l589_c11_c923_return_output,
 t8_MUX_uxn_opcodes_h_l589_c7_a3a1_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l589_c7_a3a1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_a3a1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_a3a1_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_a3a1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_a3a1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_a3a1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l592_c11_4f82_return_output,
 t8_MUX_uxn_opcodes_h_l592_c7_6ffd_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l592_c7_6ffd_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_6ffd_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l592_c7_6ffd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_6ffd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_6ffd_return_output,
 sp_relative_shift_uxn_opcodes_h_l595_c30_01f5_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l597_c22_f277_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l599_c11_d577_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_b186_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_b186_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_b186_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c6_77d6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c6_77d6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c6_77d6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_3c4e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_3c4e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_3c4e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_3c4e_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l584_c2_92d5_iftrue : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l584_c2_92d5_iffalse : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l589_c7_a3a1_return_output : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l584_c2_92d5_return_output : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l584_c2_92d5_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l584_c2_92d5_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l584_c2_92d5_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l589_c7_a3a1_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l584_c2_92d5_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l584_c2_92d5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_92d5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l586_c3_24ef : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_92d5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_a3a1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_92d5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_92d5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_92d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_92d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_a3a1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_92d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_92d5_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l584_c2_92d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l584_c2_92d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_a3a1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l584_c2_92d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l584_c2_92d5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_92d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_92d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_a3a1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_92d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_92d5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_92d5_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_92d5_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_a3a1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_92d5_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_92d5_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l585_c3_f54d_uxn_opcodes_h_l585_c3_f54d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l589_c11_c923_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l589_c11_c923_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l589_c11_c923_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l589_c7_a3a1_iftrue : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l589_c7_a3a1_iffalse : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l592_c7_6ffd_return_output : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l589_c7_a3a1_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l589_c7_a3a1_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l589_c7_a3a1_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l592_c7_6ffd_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l589_c7_a3a1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_a3a1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l590_c3_a018 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_a3a1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l589_c7_a3a1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_a3a1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_a3a1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_a3a1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_6ffd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_a3a1_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_a3a1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_a3a1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l592_c7_6ffd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_a3a1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_a3a1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_a3a1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_6ffd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_a3a1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_a3a1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_a3a1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_6ffd_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_a3a1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c11_4f82_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c11_4f82_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c11_4f82_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l592_c7_6ffd_iftrue : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l592_c7_6ffd_iffalse : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l592_c7_6ffd_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l592_c7_6ffd_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l597_c3_cba1 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l592_c7_6ffd_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l592_c7_6ffd_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_6ffd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_6ffd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_b186_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_6ffd_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l592_c7_6ffd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l592_c7_6ffd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_b186_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l592_c7_6ffd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_6ffd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_6ffd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_b186_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_6ffd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_6ffd_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_6ffd_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_6ffd_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l593_c8_fcdd_return_output : signed(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l595_c30_01f5_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l595_c30_01f5_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l595_c30_01f5_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l595_c30_01f5_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l597_c22_f277_left : signed(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l597_c22_f277_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l597_c22_f277_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_d577_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_d577_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_d577_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_b186_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_b186_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_b186_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_b186_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_b186_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_b186_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_b186_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_b186_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_b186_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l592_l584_l589_DUPLICATE_1db0_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l584_l599_l589_DUPLICATE_fb9f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l584_l599_l589_DUPLICATE_ed73_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l592_l584_l589_DUPLICATE_e193_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l592_l599_l589_DUPLICATE_5958_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6245_uxn_opcodes_h_l580_l605_DUPLICATE_6878_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_b186_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l590_c3_a018 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_a3a1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l590_c3_a018;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l586_c3_24ef := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_92d5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l586_c3_24ef;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_92d5_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_d577_right := to_unsigned(3, 2);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_3c4e_iffalse := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l595_c30_01f5_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l592_c7_6ffd_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l589_c11_c923_right := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_b186_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_6ffd_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l595_c30_01f5_y := resize(to_signed(-1, 2), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c11_4f82_right := to_unsigned(2, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_b186_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c6_77d6_right := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_3c4e_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l595_c30_01f5_ins := VAR_ins;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l597_c22_f277_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c6_77d6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l589_c11_c923_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c11_4f82_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_d577_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l584_c2_92d5_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l589_c7_a3a1_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l592_c7_6ffd_iffalse := t8;
     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l589_c7_a3a1] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l589_c7_a3a1_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l592_l599_l589_DUPLICATE_5958 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l592_l599_l589_DUPLICATE_5958_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l584_l599_l589_DUPLICATE_fb9f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l584_l599_l589_DUPLICATE_fb9f_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l592_l584_l589_DUPLICATE_1db0 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l592_l584_l589_DUPLICATE_1db0_return_output := result.u16_value;

     -- sp_relative_shift[uxn_opcodes_h_l595_c30_01f5] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l595_c30_01f5_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l595_c30_01f5_ins;
     sp_relative_shift_uxn_opcodes_h_l595_c30_01f5_x <= VAR_sp_relative_shift_uxn_opcodes_h_l595_c30_01f5_x;
     sp_relative_shift_uxn_opcodes_h_l595_c30_01f5_y <= VAR_sp_relative_shift_uxn_opcodes_h_l595_c30_01f5_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l595_c30_01f5_return_output := sp_relative_shift_uxn_opcodes_h_l595_c30_01f5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l592_c11_4f82] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l592_c11_4f82_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c11_4f82_left;
     BIN_OP_EQ_uxn_opcodes_h_l592_c11_4f82_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c11_4f82_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c11_4f82_return_output := BIN_OP_EQ_uxn_opcodes_h_l592_c11_4f82_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l599_c11_d577] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l599_c11_d577_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_d577_left;
     BIN_OP_EQ_uxn_opcodes_h_l599_c11_d577_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_d577_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_d577_return_output := BIN_OP_EQ_uxn_opcodes_h_l599_c11_d577_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l584_l599_l589_DUPLICATE_ed73 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l584_l599_l589_DUPLICATE_ed73_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l584_c6_77d6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l584_c6_77d6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c6_77d6_left;
     BIN_OP_EQ_uxn_opcodes_h_l584_c6_77d6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c6_77d6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c6_77d6_return_output := BIN_OP_EQ_uxn_opcodes_h_l584_c6_77d6_return_output;

     -- CAST_TO_int8_t[uxn_opcodes_h_l593_c8_fcdd] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l593_c8_fcdd_return_output := CAST_TO_int8_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l592_l584_l589_DUPLICATE_e193 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l592_l584_l589_DUPLICATE_e193_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l589_c11_c923] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l589_c11_c923_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l589_c11_c923_left;
     BIN_OP_EQ_uxn_opcodes_h_l589_c11_c923_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l589_c11_c923_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l589_c11_c923_return_output := BIN_OP_EQ_uxn_opcodes_h_l589_c11_c923_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_3c4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c6_77d6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_92d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c6_77d6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l584_c2_92d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c6_77d6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_92d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c6_77d6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_92d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c6_77d6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_92d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c6_77d6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l584_c2_92d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c6_77d6_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l584_c2_92d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c6_77d6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_a3a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l589_c11_c923_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_a3a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l589_c11_c923_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_a3a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l589_c11_c923_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_a3a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l589_c11_c923_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_a3a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l589_c11_c923_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l589_c7_a3a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l589_c11_c923_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l589_c7_a3a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l589_c11_c923_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_6ffd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c11_4f82_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l592_c7_6ffd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c11_4f82_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_6ffd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c11_4f82_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_6ffd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c11_4f82_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l592_c7_6ffd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c11_4f82_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l592_c7_6ffd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c11_4f82_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_b186_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_d577_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_b186_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_d577_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_b186_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_d577_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l597_c22_f277_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l593_c8_fcdd_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l592_c7_6ffd_iftrue := VAR_CAST_TO_int8_t_uxn_opcodes_h_l593_c8_fcdd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_92d5_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l592_l584_l589_DUPLICATE_e193_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_a3a1_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l592_l584_l589_DUPLICATE_e193_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_6ffd_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l592_l584_l589_DUPLICATE_e193_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l584_c2_92d5_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l592_l584_l589_DUPLICATE_1db0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l589_c7_a3a1_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l592_l584_l589_DUPLICATE_1db0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l592_c7_6ffd_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l592_l584_l589_DUPLICATE_1db0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_a3a1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l592_l599_l589_DUPLICATE_5958_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_6ffd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l592_l599_l589_DUPLICATE_5958_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_b186_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l592_l599_l589_DUPLICATE_5958_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l584_c2_92d5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l584_l599_l589_DUPLICATE_ed73_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_a3a1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l584_l599_l589_DUPLICATE_ed73_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_b186_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l584_l599_l589_DUPLICATE_ed73_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_92d5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l584_l599_l589_DUPLICATE_fb9f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_a3a1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l584_l599_l589_DUPLICATE_fb9f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_b186_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l584_l599_l589_DUPLICATE_fb9f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_a3a1_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l589_c7_a3a1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_6ffd_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l595_c30_01f5_return_output;
     -- t8_MUX[uxn_opcodes_h_l592_c7_6ffd] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l592_c7_6ffd_cond <= VAR_t8_MUX_uxn_opcodes_h_l592_c7_6ffd_cond;
     t8_MUX_uxn_opcodes_h_l592_c7_6ffd_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l592_c7_6ffd_iftrue;
     t8_MUX_uxn_opcodes_h_l592_c7_6ffd_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l592_c7_6ffd_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l592_c7_6ffd_return_output := t8_MUX_uxn_opcodes_h_l592_c7_6ffd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l589_c7_a3a1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_a3a1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_a3a1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_a3a1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_a3a1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_a3a1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_a3a1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_a3a1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_a3a1_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l597_c22_f277] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l597_c22_f277_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l597_c22_f277_left;
     BIN_OP_PLUS_uxn_opcodes_h_l597_c22_f277_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l597_c22_f277_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l597_c22_f277_return_output := BIN_OP_PLUS_uxn_opcodes_h_l597_c22_f277_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l599_c7_b186] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_b186_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_b186_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_b186_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_b186_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_b186_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_b186_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_b186_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_b186_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l599_c7_b186] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_b186_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_b186_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_b186_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_b186_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_b186_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_b186_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_b186_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_b186_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l599_c7_b186] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_b186_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_b186_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_b186_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_b186_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_b186_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_b186_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_b186_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_b186_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l584_c1_3c4e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_3c4e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_3c4e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_3c4e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_3c4e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_3c4e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_3c4e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_3c4e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_3c4e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l592_c7_6ffd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_6ffd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_6ffd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_6ffd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_6ffd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_6ffd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_6ffd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_6ffd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_6ffd_return_output;

     -- Submodule level 2
     VAR_result_u16_value_uxn_opcodes_h_l597_c3_cba1 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l597_c22_f277_return_output)),16);
     VAR_printf_uxn_opcodes_h_l585_c3_f54d_uxn_opcodes_h_l585_c3_f54d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_3c4e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_6ffd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_b186_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l592_c7_6ffd_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_b186_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_6ffd_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_b186_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_a3a1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_6ffd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_92d5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_a3a1_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l589_c7_a3a1_iffalse := VAR_t8_MUX_uxn_opcodes_h_l592_c7_6ffd_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l592_c7_6ffd_iftrue := VAR_result_u16_value_uxn_opcodes_h_l597_c3_cba1;
     -- result_u16_value_MUX[uxn_opcodes_h_l592_c7_6ffd] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l592_c7_6ffd_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l592_c7_6ffd_cond;
     result_u16_value_MUX_uxn_opcodes_h_l592_c7_6ffd_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l592_c7_6ffd_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l592_c7_6ffd_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l592_c7_6ffd_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l592_c7_6ffd_return_output := result_u16_value_MUX_uxn_opcodes_h_l592_c7_6ffd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l589_c7_a3a1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_a3a1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_a3a1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_a3a1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_a3a1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_a3a1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_a3a1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_a3a1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_a3a1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l592_c7_6ffd] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_6ffd_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_6ffd_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_6ffd_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_6ffd_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_6ffd_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_6ffd_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_6ffd_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_6ffd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l592_c7_6ffd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_6ffd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_6ffd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_6ffd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_6ffd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_6ffd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_6ffd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_6ffd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_6ffd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l584_c2_92d5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_92d5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_92d5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_92d5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_92d5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_92d5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_92d5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_92d5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_92d5_return_output;

     -- t8_MUX[uxn_opcodes_h_l589_c7_a3a1] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l589_c7_a3a1_cond <= VAR_t8_MUX_uxn_opcodes_h_l589_c7_a3a1_cond;
     t8_MUX_uxn_opcodes_h_l589_c7_a3a1_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l589_c7_a3a1_iftrue;
     t8_MUX_uxn_opcodes_h_l589_c7_a3a1_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l589_c7_a3a1_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l589_c7_a3a1_return_output := t8_MUX_uxn_opcodes_h_l589_c7_a3a1_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l592_c7_6ffd] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l592_c7_6ffd_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l592_c7_6ffd_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l592_c7_6ffd_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l592_c7_6ffd_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l592_c7_6ffd_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l592_c7_6ffd_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l592_c7_6ffd_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l592_c7_6ffd_return_output;

     -- printf_uxn_opcodes_h_l585_c3_f54d[uxn_opcodes_h_l585_c3_f54d] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l585_c3_f54d_uxn_opcodes_h_l585_c3_f54d_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l585_c3_f54d_uxn_opcodes_h_l585_c3_f54d_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_a3a1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_6ffd_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_a3a1_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l592_c7_6ffd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_a3a1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_6ffd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_92d5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_a3a1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l589_c7_a3a1_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l592_c7_6ffd_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l584_c2_92d5_iffalse := VAR_t8_MUX_uxn_opcodes_h_l589_c7_a3a1_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l589_c7_a3a1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_a3a1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_a3a1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_a3a1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_a3a1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_a3a1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_a3a1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_a3a1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_a3a1_return_output;

     -- t8_MUX[uxn_opcodes_h_l584_c2_92d5] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l584_c2_92d5_cond <= VAR_t8_MUX_uxn_opcodes_h_l584_c2_92d5_cond;
     t8_MUX_uxn_opcodes_h_l584_c2_92d5_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l584_c2_92d5_iftrue;
     t8_MUX_uxn_opcodes_h_l584_c2_92d5_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l584_c2_92d5_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l584_c2_92d5_return_output := t8_MUX_uxn_opcodes_h_l584_c2_92d5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l584_c2_92d5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_92d5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_92d5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_92d5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_92d5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_92d5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_92d5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_92d5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_92d5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l589_c7_a3a1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_a3a1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_a3a1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_a3a1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_a3a1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_a3a1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_a3a1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_a3a1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_a3a1_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l589_c7_a3a1] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_a3a1_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_a3a1_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_a3a1_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_a3a1_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_a3a1_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_a3a1_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_a3a1_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_a3a1_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l589_c7_a3a1] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l589_c7_a3a1_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l589_c7_a3a1_cond;
     result_u16_value_MUX_uxn_opcodes_h_l589_c7_a3a1_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l589_c7_a3a1_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l589_c7_a3a1_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l589_c7_a3a1_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l589_c7_a3a1_return_output := result_u16_value_MUX_uxn_opcodes_h_l589_c7_a3a1_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_92d5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_a3a1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l584_c2_92d5_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_a3a1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_92d5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_a3a1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l584_c2_92d5_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l589_c7_a3a1_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l584_c2_92d5_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l584_c2_92d5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_92d5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_92d5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_92d5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_92d5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_92d5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_92d5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_92d5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_92d5_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l584_c2_92d5] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l584_c2_92d5_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l584_c2_92d5_cond;
     result_u16_value_MUX_uxn_opcodes_h_l584_c2_92d5_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l584_c2_92d5_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l584_c2_92d5_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l584_c2_92d5_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l584_c2_92d5_return_output := result_u16_value_MUX_uxn_opcodes_h_l584_c2_92d5_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l584_c2_92d5] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l584_c2_92d5_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l584_c2_92d5_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l584_c2_92d5_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l584_c2_92d5_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l584_c2_92d5_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l584_c2_92d5_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l584_c2_92d5_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l584_c2_92d5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l584_c2_92d5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_92d5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_92d5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_92d5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_92d5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_92d5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_92d5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_92d5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_92d5_return_output;

     -- Submodule level 5
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_6245_uxn_opcodes_h_l580_l605_DUPLICATE_6878 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6245_uxn_opcodes_h_l580_l605_DUPLICATE_6878_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_6245(
     result,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l584_c2_92d5_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_92d5_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_92d5_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l584_c2_92d5_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_92d5_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_92d5_return_output);

     -- Submodule level 6
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6245_uxn_opcodes_h_l580_l605_DUPLICATE_6878_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6245_uxn_opcodes_h_l580_l605_DUPLICATE_6878_return_output;
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
