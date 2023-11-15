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
-- BIN_OP_EQ[uxn_opcodes_h_l578_c6_086a]
signal BIN_OP_EQ_uxn_opcodes_h_l578_c6_086a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l578_c6_086a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l578_c6_086a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l578_c1_1593]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_1593_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_1593_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_1593_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_1593_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l578_c2_ee87]
signal t8_MUX_uxn_opcodes_h_l578_c2_ee87_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l578_c2_ee87_iftrue : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l578_c2_ee87_iffalse : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l578_c2_ee87_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l578_c2_ee87]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c2_ee87_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c2_ee87_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c2_ee87_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c2_ee87_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l578_c2_ee87]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c2_ee87_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c2_ee87_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c2_ee87_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c2_ee87_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l578_c2_ee87]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l578_c2_ee87_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l578_c2_ee87_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l578_c2_ee87_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l578_c2_ee87_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l578_c2_ee87]
signal result_is_opc_done_MUX_uxn_opcodes_h_l578_c2_ee87_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l578_c2_ee87_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l578_c2_ee87_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l578_c2_ee87_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l578_c2_ee87]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l578_c2_ee87_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l578_c2_ee87_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l578_c2_ee87_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l578_c2_ee87_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l578_c2_ee87]
signal result_u16_value_MUX_uxn_opcodes_h_l578_c2_ee87_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l578_c2_ee87_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l578_c2_ee87_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l578_c2_ee87_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l579_c3_b0a7[uxn_opcodes_h_l579_c3_b0a7]
signal printf_uxn_opcodes_h_l579_c3_b0a7_uxn_opcodes_h_l579_c3_b0a7_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l583_c11_d42f]
signal BIN_OP_EQ_uxn_opcodes_h_l583_c11_d42f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l583_c11_d42f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l583_c11_d42f_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l583_c7_b612]
signal t8_MUX_uxn_opcodes_h_l583_c7_b612_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l583_c7_b612_iftrue : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l583_c7_b612_iffalse : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l583_c7_b612_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l583_c7_b612]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l583_c7_b612_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l583_c7_b612_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l583_c7_b612_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l583_c7_b612_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l583_c7_b612]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l583_c7_b612_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l583_c7_b612_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l583_c7_b612_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l583_c7_b612_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l583_c7_b612]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l583_c7_b612_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l583_c7_b612_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l583_c7_b612_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l583_c7_b612_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l583_c7_b612]
signal result_is_opc_done_MUX_uxn_opcodes_h_l583_c7_b612_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l583_c7_b612_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l583_c7_b612_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l583_c7_b612_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l583_c7_b612]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l583_c7_b612_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l583_c7_b612_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l583_c7_b612_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l583_c7_b612_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l583_c7_b612]
signal result_u16_value_MUX_uxn_opcodes_h_l583_c7_b612_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l583_c7_b612_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l583_c7_b612_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l583_c7_b612_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l586_c11_7174]
signal BIN_OP_EQ_uxn_opcodes_h_l586_c11_7174_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l586_c11_7174_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l586_c11_7174_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l586_c7_14c8]
signal t8_MUX_uxn_opcodes_h_l586_c7_14c8_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l586_c7_14c8_iftrue : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l586_c7_14c8_iffalse : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l586_c7_14c8_return_output : signed(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l586_c7_14c8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l586_c7_14c8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l586_c7_14c8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l586_c7_14c8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l586_c7_14c8_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l586_c7_14c8]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l586_c7_14c8_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l586_c7_14c8_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l586_c7_14c8_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l586_c7_14c8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l586_c7_14c8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l586_c7_14c8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l586_c7_14c8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l586_c7_14c8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l586_c7_14c8_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l586_c7_14c8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l586_c7_14c8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l586_c7_14c8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l586_c7_14c8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l586_c7_14c8_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l586_c7_14c8]
signal result_u16_value_MUX_uxn_opcodes_h_l586_c7_14c8_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l586_c7_14c8_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l586_c7_14c8_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l586_c7_14c8_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l589_c30_4a98]
signal sp_relative_shift_uxn_opcodes_h_l589_c30_4a98_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l589_c30_4a98_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l589_c30_4a98_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l589_c30_4a98_return_output : signed(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l591_c22_079b]
signal BIN_OP_PLUS_uxn_opcodes_h_l591_c22_079b_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l591_c22_079b_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l591_c22_079b_return_output : signed(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l593_c11_77aa]
signal BIN_OP_EQ_uxn_opcodes_h_l593_c11_77aa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l593_c11_77aa_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l593_c11_77aa_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l593_c7_6a30]
signal result_is_opc_done_MUX_uxn_opcodes_h_l593_c7_6a30_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l593_c7_6a30_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l593_c7_6a30_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l593_c7_6a30_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l593_c7_6a30]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l593_c7_6a30_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l593_c7_6a30_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l593_c7_6a30_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l593_c7_6a30_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l593_c7_6a30]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l593_c7_6a30_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l593_c7_6a30_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l593_c7_6a30_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l593_c7_6a30_return_output : unsigned(0 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_4c49( ref_toks_0 : opcode_result_t;
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
      base.is_pc_updated := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.is_sp_shift := ref_toks_5;
      base.u16_value := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l578_c6_086a
BIN_OP_EQ_uxn_opcodes_h_l578_c6_086a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l578_c6_086a_left,
BIN_OP_EQ_uxn_opcodes_h_l578_c6_086a_right,
BIN_OP_EQ_uxn_opcodes_h_l578_c6_086a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_1593
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_1593 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_1593_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_1593_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_1593_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_1593_return_output);

-- t8_MUX_uxn_opcodes_h_l578_c2_ee87
t8_MUX_uxn_opcodes_h_l578_c2_ee87 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l578_c2_ee87_cond,
t8_MUX_uxn_opcodes_h_l578_c2_ee87_iftrue,
t8_MUX_uxn_opcodes_h_l578_c2_ee87_iffalse,
t8_MUX_uxn_opcodes_h_l578_c2_ee87_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c2_ee87
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c2_ee87 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c2_ee87_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c2_ee87_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c2_ee87_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c2_ee87_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c2_ee87
result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c2_ee87 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c2_ee87_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c2_ee87_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c2_ee87_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c2_ee87_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l578_c2_ee87
result_is_pc_updated_MUX_uxn_opcodes_h_l578_c2_ee87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l578_c2_ee87_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l578_c2_ee87_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l578_c2_ee87_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l578_c2_ee87_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l578_c2_ee87
result_is_opc_done_MUX_uxn_opcodes_h_l578_c2_ee87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l578_c2_ee87_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l578_c2_ee87_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l578_c2_ee87_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l578_c2_ee87_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l578_c2_ee87
result_is_sp_shift_MUX_uxn_opcodes_h_l578_c2_ee87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l578_c2_ee87_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l578_c2_ee87_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l578_c2_ee87_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l578_c2_ee87_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l578_c2_ee87
result_u16_value_MUX_uxn_opcodes_h_l578_c2_ee87 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l578_c2_ee87_cond,
result_u16_value_MUX_uxn_opcodes_h_l578_c2_ee87_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l578_c2_ee87_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l578_c2_ee87_return_output);

-- printf_uxn_opcodes_h_l579_c3_b0a7_uxn_opcodes_h_l579_c3_b0a7
printf_uxn_opcodes_h_l579_c3_b0a7_uxn_opcodes_h_l579_c3_b0a7 : entity work.printf_uxn_opcodes_h_l579_c3_b0a7_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l579_c3_b0a7_uxn_opcodes_h_l579_c3_b0a7_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l583_c11_d42f
BIN_OP_EQ_uxn_opcodes_h_l583_c11_d42f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l583_c11_d42f_left,
BIN_OP_EQ_uxn_opcodes_h_l583_c11_d42f_right,
BIN_OP_EQ_uxn_opcodes_h_l583_c11_d42f_return_output);

-- t8_MUX_uxn_opcodes_h_l583_c7_b612
t8_MUX_uxn_opcodes_h_l583_c7_b612 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l583_c7_b612_cond,
t8_MUX_uxn_opcodes_h_l583_c7_b612_iftrue,
t8_MUX_uxn_opcodes_h_l583_c7_b612_iffalse,
t8_MUX_uxn_opcodes_h_l583_c7_b612_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l583_c7_b612
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l583_c7_b612 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l583_c7_b612_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l583_c7_b612_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l583_c7_b612_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l583_c7_b612_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l583_c7_b612
result_sp_relative_shift_MUX_uxn_opcodes_h_l583_c7_b612 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l583_c7_b612_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l583_c7_b612_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l583_c7_b612_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l583_c7_b612_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l583_c7_b612
result_is_pc_updated_MUX_uxn_opcodes_h_l583_c7_b612 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l583_c7_b612_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l583_c7_b612_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l583_c7_b612_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l583_c7_b612_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l583_c7_b612
result_is_opc_done_MUX_uxn_opcodes_h_l583_c7_b612 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l583_c7_b612_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l583_c7_b612_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l583_c7_b612_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l583_c7_b612_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l583_c7_b612
result_is_sp_shift_MUX_uxn_opcodes_h_l583_c7_b612 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l583_c7_b612_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l583_c7_b612_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l583_c7_b612_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l583_c7_b612_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l583_c7_b612
result_u16_value_MUX_uxn_opcodes_h_l583_c7_b612 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l583_c7_b612_cond,
result_u16_value_MUX_uxn_opcodes_h_l583_c7_b612_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l583_c7_b612_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l583_c7_b612_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l586_c11_7174
BIN_OP_EQ_uxn_opcodes_h_l586_c11_7174 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l586_c11_7174_left,
BIN_OP_EQ_uxn_opcodes_h_l586_c11_7174_right,
BIN_OP_EQ_uxn_opcodes_h_l586_c11_7174_return_output);

-- t8_MUX_uxn_opcodes_h_l586_c7_14c8
t8_MUX_uxn_opcodes_h_l586_c7_14c8 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l586_c7_14c8_cond,
t8_MUX_uxn_opcodes_h_l586_c7_14c8_iftrue,
t8_MUX_uxn_opcodes_h_l586_c7_14c8_iffalse,
t8_MUX_uxn_opcodes_h_l586_c7_14c8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l586_c7_14c8
result_sp_relative_shift_MUX_uxn_opcodes_h_l586_c7_14c8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l586_c7_14c8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l586_c7_14c8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l586_c7_14c8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l586_c7_14c8_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l586_c7_14c8
result_is_pc_updated_MUX_uxn_opcodes_h_l586_c7_14c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l586_c7_14c8_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l586_c7_14c8_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l586_c7_14c8_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l586_c7_14c8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l586_c7_14c8
result_is_opc_done_MUX_uxn_opcodes_h_l586_c7_14c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l586_c7_14c8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l586_c7_14c8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l586_c7_14c8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l586_c7_14c8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l586_c7_14c8
result_is_sp_shift_MUX_uxn_opcodes_h_l586_c7_14c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l586_c7_14c8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l586_c7_14c8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l586_c7_14c8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l586_c7_14c8_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l586_c7_14c8
result_u16_value_MUX_uxn_opcodes_h_l586_c7_14c8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l586_c7_14c8_cond,
result_u16_value_MUX_uxn_opcodes_h_l586_c7_14c8_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l586_c7_14c8_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l586_c7_14c8_return_output);

-- sp_relative_shift_uxn_opcodes_h_l589_c30_4a98
sp_relative_shift_uxn_opcodes_h_l589_c30_4a98 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l589_c30_4a98_ins,
sp_relative_shift_uxn_opcodes_h_l589_c30_4a98_x,
sp_relative_shift_uxn_opcodes_h_l589_c30_4a98_y,
sp_relative_shift_uxn_opcodes_h_l589_c30_4a98_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l591_c22_079b
BIN_OP_PLUS_uxn_opcodes_h_l591_c22_079b : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l591_c22_079b_left,
BIN_OP_PLUS_uxn_opcodes_h_l591_c22_079b_right,
BIN_OP_PLUS_uxn_opcodes_h_l591_c22_079b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l593_c11_77aa
BIN_OP_EQ_uxn_opcodes_h_l593_c11_77aa : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l593_c11_77aa_left,
BIN_OP_EQ_uxn_opcodes_h_l593_c11_77aa_right,
BIN_OP_EQ_uxn_opcodes_h_l593_c11_77aa_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l593_c7_6a30
result_is_opc_done_MUX_uxn_opcodes_h_l593_c7_6a30 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l593_c7_6a30_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l593_c7_6a30_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l593_c7_6a30_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l593_c7_6a30_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l593_c7_6a30
result_is_sp_shift_MUX_uxn_opcodes_h_l593_c7_6a30 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l593_c7_6a30_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l593_c7_6a30_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l593_c7_6a30_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l593_c7_6a30_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l593_c7_6a30
result_is_pc_updated_MUX_uxn_opcodes_h_l593_c7_6a30 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l593_c7_6a30_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l593_c7_6a30_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l593_c7_6a30_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l593_c7_6a30_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l578_c6_086a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_1593_return_output,
 t8_MUX_uxn_opcodes_h_l578_c2_ee87_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c2_ee87_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c2_ee87_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l578_c2_ee87_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l578_c2_ee87_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l578_c2_ee87_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l578_c2_ee87_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l583_c11_d42f_return_output,
 t8_MUX_uxn_opcodes_h_l583_c7_b612_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l583_c7_b612_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l583_c7_b612_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l583_c7_b612_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l583_c7_b612_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l583_c7_b612_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l583_c7_b612_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l586_c11_7174_return_output,
 t8_MUX_uxn_opcodes_h_l586_c7_14c8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l586_c7_14c8_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l586_c7_14c8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l586_c7_14c8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l586_c7_14c8_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l586_c7_14c8_return_output,
 sp_relative_shift_uxn_opcodes_h_l589_c30_4a98_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l591_c22_079b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l593_c11_77aa_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l593_c7_6a30_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l593_c7_6a30_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l593_c7_6a30_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c6_086a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c6_086a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c6_086a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_1593_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_1593_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_1593_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_1593_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l578_c2_ee87_iftrue : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l578_c2_ee87_iffalse : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l583_c7_b612_return_output : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l578_c2_ee87_return_output : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l578_c2_ee87_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c2_ee87_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l580_c3_5d11 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c2_ee87_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l583_c7_b612_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c2_ee87_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c2_ee87_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c2_ee87_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c2_ee87_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l583_c7_b612_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c2_ee87_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c2_ee87_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l578_c2_ee87_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l578_c2_ee87_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l583_c7_b612_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l578_c2_ee87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l578_c2_ee87_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l578_c2_ee87_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l578_c2_ee87_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l583_c7_b612_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l578_c2_ee87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l578_c2_ee87_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l578_c2_ee87_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l578_c2_ee87_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l583_c7_b612_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l578_c2_ee87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l578_c2_ee87_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l578_c2_ee87_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l578_c2_ee87_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l583_c7_b612_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l578_c2_ee87_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l578_c2_ee87_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l579_c3_b0a7_uxn_opcodes_h_l579_c3_b0a7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l583_c11_d42f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l583_c11_d42f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l583_c11_d42f_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l583_c7_b612_iftrue : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l583_c7_b612_iffalse : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l586_c7_14c8_return_output : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l583_c7_b612_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l583_c7_b612_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l584_c3_caad : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l583_c7_b612_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l583_c7_b612_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l583_c7_b612_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l583_c7_b612_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l583_c7_b612_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l586_c7_14c8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l583_c7_b612_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l583_c7_b612_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l583_c7_b612_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l586_c7_14c8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l583_c7_b612_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l583_c7_b612_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l583_c7_b612_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l586_c7_14c8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l583_c7_b612_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l583_c7_b612_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l583_c7_b612_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l586_c7_14c8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l583_c7_b612_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l583_c7_b612_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l583_c7_b612_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l586_c7_14c8_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l583_c7_b612_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l586_c11_7174_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l586_c11_7174_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l586_c11_7174_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l586_c7_14c8_iftrue : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l586_c7_14c8_iffalse : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l586_c7_14c8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l586_c7_14c8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l586_c7_14c8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l586_c7_14c8_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l586_c7_14c8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l586_c7_14c8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l593_c7_6a30_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l586_c7_14c8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l586_c7_14c8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l586_c7_14c8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l593_c7_6a30_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l586_c7_14c8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l586_c7_14c8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l586_c7_14c8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l593_c7_6a30_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l586_c7_14c8_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l586_c7_14c8_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l591_c3_fe10 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l586_c7_14c8_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l586_c7_14c8_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l587_c8_1370_return_output : signed(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l589_c30_4a98_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l589_c30_4a98_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l589_c30_4a98_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l589_c30_4a98_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l591_c22_079b_left : signed(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l591_c22_079b_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l591_c22_079b_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l593_c11_77aa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l593_c11_77aa_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l593_c11_77aa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l593_c7_6a30_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l593_c7_6a30_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l593_c7_6a30_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l593_c7_6a30_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l593_c7_6a30_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l593_c7_6a30_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l593_c7_6a30_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l593_c7_6a30_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l593_c7_6a30_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l586_l578_l583_DUPLICATE_003a_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l578_l593_l583_DUPLICATE_6138_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l578_l593_l583_DUPLICATE_2a3f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l586_l578_l583_DUPLICATE_1a8c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l586_l593_l583_DUPLICATE_ebb2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4c49_uxn_opcodes_h_l599_l574_DUPLICATE_5730_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l583_c11_d42f_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l586_c11_7174_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l593_c7_6a30_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l593_c7_6a30_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l578_c2_ee87_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_1593_iffalse := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l593_c7_6a30_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l584_c3_caad := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l583_c7_b612_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l584_c3_caad;
     VAR_sp_relative_shift_uxn_opcodes_h_l589_c30_4a98_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l580_c3_5d11 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c2_ee87_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l580_c3_5d11;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l593_c11_77aa_right := to_unsigned(3, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l586_c7_14c8_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l586_c7_14c8_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c6_086a_right := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l589_c30_4a98_y := resize(to_signed(-1, 2), 4);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_1593_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l589_c30_4a98_ins := VAR_ins;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l591_c22_079b_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c6_086a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l583_c11_d42f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l586_c11_7174_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l593_c11_77aa_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l578_c2_ee87_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l583_c7_b612_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l586_c7_14c8_iffalse := t8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l586_l593_l583_DUPLICATE_ebb2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l586_l593_l583_DUPLICATE_ebb2_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l578_l593_l583_DUPLICATE_6138 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l578_l593_l583_DUPLICATE_6138_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l593_c11_77aa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l593_c11_77aa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l593_c11_77aa_left;
     BIN_OP_EQ_uxn_opcodes_h_l593_c11_77aa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l593_c11_77aa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l593_c11_77aa_return_output := BIN_OP_EQ_uxn_opcodes_h_l593_c11_77aa_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l583_c7_b612] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l583_c7_b612_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l583_c11_d42f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l583_c11_d42f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l583_c11_d42f_left;
     BIN_OP_EQ_uxn_opcodes_h_l583_c11_d42f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l583_c11_d42f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l583_c11_d42f_return_output := BIN_OP_EQ_uxn_opcodes_h_l583_c11_d42f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l586_c11_7174] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l586_c11_7174_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l586_c11_7174_left;
     BIN_OP_EQ_uxn_opcodes_h_l586_c11_7174_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l586_c11_7174_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l586_c11_7174_return_output := BIN_OP_EQ_uxn_opcodes_h_l586_c11_7174_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l578_c6_086a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l578_c6_086a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c6_086a_left;
     BIN_OP_EQ_uxn_opcodes_h_l578_c6_086a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c6_086a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c6_086a_return_output := BIN_OP_EQ_uxn_opcodes_h_l578_c6_086a_return_output;

     -- CAST_TO_int8_t[uxn_opcodes_h_l587_c8_1370] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l587_c8_1370_return_output := CAST_TO_int8_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l586_l578_l583_DUPLICATE_003a LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l586_l578_l583_DUPLICATE_003a_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l578_l593_l583_DUPLICATE_2a3f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l578_l593_l583_DUPLICATE_2a3f_return_output := result.is_sp_shift;

     -- sp_relative_shift[uxn_opcodes_h_l589_c30_4a98] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l589_c30_4a98_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l589_c30_4a98_ins;
     sp_relative_shift_uxn_opcodes_h_l589_c30_4a98_x <= VAR_sp_relative_shift_uxn_opcodes_h_l589_c30_4a98_x;
     sp_relative_shift_uxn_opcodes_h_l589_c30_4a98_y <= VAR_sp_relative_shift_uxn_opcodes_h_l589_c30_4a98_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l589_c30_4a98_return_output := sp_relative_shift_uxn_opcodes_h_l589_c30_4a98_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l586_l578_l583_DUPLICATE_1a8c LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l586_l578_l583_DUPLICATE_1a8c_return_output := result.u16_value;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_1593_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c6_086a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l578_c2_ee87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c6_086a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l578_c2_ee87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c6_086a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l578_c2_ee87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c6_086a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c2_ee87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c6_086a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c2_ee87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c6_086a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l578_c2_ee87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c6_086a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l578_c2_ee87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c6_086a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l583_c7_b612_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l583_c11_d42f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l583_c7_b612_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l583_c11_d42f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l583_c7_b612_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l583_c11_d42f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l583_c7_b612_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l583_c11_d42f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l583_c7_b612_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l583_c11_d42f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l583_c7_b612_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l583_c11_d42f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l583_c7_b612_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l583_c11_d42f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l586_c7_14c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l586_c11_7174_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l586_c7_14c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l586_c11_7174_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l586_c7_14c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l586_c11_7174_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l586_c7_14c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l586_c11_7174_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l586_c7_14c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l586_c11_7174_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l586_c7_14c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l586_c11_7174_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l593_c7_6a30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l593_c11_77aa_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l593_c7_6a30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l593_c11_77aa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l593_c7_6a30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l593_c11_77aa_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l591_c22_079b_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l587_c8_1370_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l586_c7_14c8_iftrue := VAR_CAST_TO_int8_t_uxn_opcodes_h_l587_c8_1370_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c2_ee87_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l586_l578_l583_DUPLICATE_003a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l583_c7_b612_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l586_l578_l583_DUPLICATE_003a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l586_c7_14c8_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l586_l578_l583_DUPLICATE_003a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l578_c2_ee87_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l586_l578_l583_DUPLICATE_1a8c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l583_c7_b612_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l586_l578_l583_DUPLICATE_1a8c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l586_c7_14c8_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l586_l578_l583_DUPLICATE_1a8c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l583_c7_b612_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l586_l593_l583_DUPLICATE_ebb2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l586_c7_14c8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l586_l593_l583_DUPLICATE_ebb2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l593_c7_6a30_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l586_l593_l583_DUPLICATE_ebb2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l578_c2_ee87_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l578_l593_l583_DUPLICATE_6138_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l583_c7_b612_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l578_l593_l583_DUPLICATE_6138_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l593_c7_6a30_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l578_l593_l583_DUPLICATE_6138_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l578_c2_ee87_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l578_l593_l583_DUPLICATE_2a3f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l583_c7_b612_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l578_l593_l583_DUPLICATE_2a3f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l593_c7_6a30_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l578_l593_l583_DUPLICATE_2a3f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l583_c7_b612_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l583_c7_b612_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l586_c7_14c8_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l589_c30_4a98_return_output;
     -- t8_MUX[uxn_opcodes_h_l586_c7_14c8] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l586_c7_14c8_cond <= VAR_t8_MUX_uxn_opcodes_h_l586_c7_14c8_cond;
     t8_MUX_uxn_opcodes_h_l586_c7_14c8_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l586_c7_14c8_iftrue;
     t8_MUX_uxn_opcodes_h_l586_c7_14c8_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l586_c7_14c8_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l586_c7_14c8_return_output := t8_MUX_uxn_opcodes_h_l586_c7_14c8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l593_c7_6a30] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l593_c7_6a30_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l593_c7_6a30_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l593_c7_6a30_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l593_c7_6a30_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l593_c7_6a30_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l593_c7_6a30_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l593_c7_6a30_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l593_c7_6a30_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l591_c22_079b] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l591_c22_079b_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l591_c22_079b_left;
     BIN_OP_PLUS_uxn_opcodes_h_l591_c22_079b_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l591_c22_079b_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l591_c22_079b_return_output := BIN_OP_PLUS_uxn_opcodes_h_l591_c22_079b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l593_c7_6a30] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l593_c7_6a30_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l593_c7_6a30_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l593_c7_6a30_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l593_c7_6a30_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l593_c7_6a30_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l593_c7_6a30_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l593_c7_6a30_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l593_c7_6a30_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l578_c1_1593] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_1593_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_1593_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_1593_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_1593_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_1593_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_1593_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_1593_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_1593_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l586_c7_14c8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l586_c7_14c8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l586_c7_14c8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l586_c7_14c8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l586_c7_14c8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l586_c7_14c8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l586_c7_14c8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l586_c7_14c8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l586_c7_14c8_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l593_c7_6a30] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l593_c7_6a30_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l593_c7_6a30_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l593_c7_6a30_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l593_c7_6a30_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l593_c7_6a30_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l593_c7_6a30_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l593_c7_6a30_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l593_c7_6a30_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l583_c7_b612] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l583_c7_b612_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l583_c7_b612_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l583_c7_b612_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l583_c7_b612_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l583_c7_b612_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l583_c7_b612_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l583_c7_b612_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l583_c7_b612_return_output;

     -- Submodule level 2
     VAR_result_u16_value_uxn_opcodes_h_l591_c3_fe10 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l591_c22_079b_return_output)),16);
     VAR_printf_uxn_opcodes_h_l579_c3_b0a7_uxn_opcodes_h_l579_c3_b0a7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_1593_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l586_c7_14c8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l593_c7_6a30_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l586_c7_14c8_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l593_c7_6a30_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l586_c7_14c8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l593_c7_6a30_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l583_c7_b612_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l586_c7_14c8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c2_ee87_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l583_c7_b612_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l583_c7_b612_iffalse := VAR_t8_MUX_uxn_opcodes_h_l586_c7_14c8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l586_c7_14c8_iftrue := VAR_result_u16_value_uxn_opcodes_h_l591_c3_fe10;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l586_c7_14c8] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l586_c7_14c8_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l586_c7_14c8_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l586_c7_14c8_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l586_c7_14c8_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l586_c7_14c8_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l586_c7_14c8_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l586_c7_14c8_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l586_c7_14c8_return_output;

     -- printf_uxn_opcodes_h_l579_c3_b0a7[uxn_opcodes_h_l579_c3_b0a7] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l579_c3_b0a7_uxn_opcodes_h_l579_c3_b0a7_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l579_c3_b0a7_uxn_opcodes_h_l579_c3_b0a7_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l586_c7_14c8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l586_c7_14c8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l586_c7_14c8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l586_c7_14c8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l586_c7_14c8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l586_c7_14c8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l586_c7_14c8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l586_c7_14c8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l586_c7_14c8_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l586_c7_14c8] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l586_c7_14c8_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l586_c7_14c8_cond;
     result_u16_value_MUX_uxn_opcodes_h_l586_c7_14c8_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l586_c7_14c8_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l586_c7_14c8_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l586_c7_14c8_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l586_c7_14c8_return_output := result_u16_value_MUX_uxn_opcodes_h_l586_c7_14c8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l578_c2_ee87] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c2_ee87_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c2_ee87_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c2_ee87_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c2_ee87_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c2_ee87_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c2_ee87_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c2_ee87_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c2_ee87_return_output;

     -- t8_MUX[uxn_opcodes_h_l583_c7_b612] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l583_c7_b612_cond <= VAR_t8_MUX_uxn_opcodes_h_l583_c7_b612_cond;
     t8_MUX_uxn_opcodes_h_l583_c7_b612_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l583_c7_b612_iftrue;
     t8_MUX_uxn_opcodes_h_l583_c7_b612_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l583_c7_b612_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l583_c7_b612_return_output := t8_MUX_uxn_opcodes_h_l583_c7_b612_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l583_c7_b612] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l583_c7_b612_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l583_c7_b612_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l583_c7_b612_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l583_c7_b612_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l583_c7_b612_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l583_c7_b612_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l583_c7_b612_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l583_c7_b612_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l586_c7_14c8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l586_c7_14c8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l586_c7_14c8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l586_c7_14c8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l586_c7_14c8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l586_c7_14c8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l586_c7_14c8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l586_c7_14c8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l586_c7_14c8_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l583_c7_b612_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l586_c7_14c8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l583_c7_b612_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l586_c7_14c8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l583_c7_b612_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l586_c7_14c8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c2_ee87_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l583_c7_b612_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l583_c7_b612_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l586_c7_14c8_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l578_c2_ee87_iffalse := VAR_t8_MUX_uxn_opcodes_h_l583_c7_b612_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l583_c7_b612] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l583_c7_b612_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l583_c7_b612_cond;
     result_u16_value_MUX_uxn_opcodes_h_l583_c7_b612_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l583_c7_b612_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l583_c7_b612_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l583_c7_b612_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l583_c7_b612_return_output := result_u16_value_MUX_uxn_opcodes_h_l583_c7_b612_return_output;

     -- t8_MUX[uxn_opcodes_h_l578_c2_ee87] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l578_c2_ee87_cond <= VAR_t8_MUX_uxn_opcodes_h_l578_c2_ee87_cond;
     t8_MUX_uxn_opcodes_h_l578_c2_ee87_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l578_c2_ee87_iftrue;
     t8_MUX_uxn_opcodes_h_l578_c2_ee87_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l578_c2_ee87_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l578_c2_ee87_return_output := t8_MUX_uxn_opcodes_h_l578_c2_ee87_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l583_c7_b612] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l583_c7_b612_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l583_c7_b612_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l583_c7_b612_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l583_c7_b612_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l583_c7_b612_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l583_c7_b612_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l583_c7_b612_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l583_c7_b612_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l583_c7_b612] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l583_c7_b612_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l583_c7_b612_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l583_c7_b612_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l583_c7_b612_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l583_c7_b612_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l583_c7_b612_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l583_c7_b612_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l583_c7_b612_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l578_c2_ee87] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c2_ee87_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c2_ee87_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c2_ee87_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c2_ee87_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c2_ee87_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c2_ee87_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c2_ee87_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c2_ee87_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l583_c7_b612] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l583_c7_b612_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l583_c7_b612_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l583_c7_b612_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l583_c7_b612_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l583_c7_b612_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l583_c7_b612_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l583_c7_b612_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l583_c7_b612_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l578_c2_ee87_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l583_c7_b612_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l578_c2_ee87_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l583_c7_b612_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l578_c2_ee87_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l583_c7_b612_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l578_c2_ee87_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l583_c7_b612_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l578_c2_ee87_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l578_c2_ee87] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l578_c2_ee87_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l578_c2_ee87_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l578_c2_ee87_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l578_c2_ee87_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l578_c2_ee87_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l578_c2_ee87_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l578_c2_ee87_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l578_c2_ee87_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l578_c2_ee87] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l578_c2_ee87_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l578_c2_ee87_cond;
     result_u16_value_MUX_uxn_opcodes_h_l578_c2_ee87_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l578_c2_ee87_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l578_c2_ee87_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l578_c2_ee87_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l578_c2_ee87_return_output := result_u16_value_MUX_uxn_opcodes_h_l578_c2_ee87_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l578_c2_ee87] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l578_c2_ee87_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l578_c2_ee87_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l578_c2_ee87_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l578_c2_ee87_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l578_c2_ee87_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l578_c2_ee87_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l578_c2_ee87_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l578_c2_ee87_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l578_c2_ee87] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l578_c2_ee87_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l578_c2_ee87_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l578_c2_ee87_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l578_c2_ee87_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l578_c2_ee87_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l578_c2_ee87_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l578_c2_ee87_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l578_c2_ee87_return_output;

     -- Submodule level 5
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_4c49_uxn_opcodes_h_l599_l574_DUPLICATE_5730 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4c49_uxn_opcodes_h_l599_l574_DUPLICATE_5730_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_4c49(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c2_ee87_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c2_ee87_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l578_c2_ee87_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l578_c2_ee87_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l578_c2_ee87_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l578_c2_ee87_return_output);

     -- Submodule level 6
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4c49_uxn_opcodes_h_l599_l574_DUPLICATE_5730_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4c49_uxn_opcodes_h_l599_l574_DUPLICATE_5730_return_output;
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
