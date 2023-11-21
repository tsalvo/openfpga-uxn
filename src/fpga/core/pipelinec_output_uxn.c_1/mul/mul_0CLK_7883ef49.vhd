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
-- Submodules: 37
entity mul_0CLK_7883ef49 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(15 downto 0);
 return_output : out opcode_result_t);
end mul_0CLK_7883ef49;
architecture arch of mul_0CLK_7883ef49 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1793_c6_3b3c]
signal BIN_OP_EQ_uxn_opcodes_h_l1793_c6_3b3c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1793_c6_3b3c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1793_c6_3b3c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1793_c2_0dfe]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c2_0dfe_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c2_0dfe_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c2_0dfe_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c2_0dfe_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1793_c2_0dfe]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1793_c2_0dfe_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1793_c2_0dfe_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1793_c2_0dfe_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1793_c2_0dfe_return_output : unsigned(0 downto 0);

-- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l1793_c2_0dfe]
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1793_c2_0dfe_cond : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1793_c2_0dfe_iftrue : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1793_c2_0dfe_iffalse : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1793_c2_0dfe_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1793_c2_0dfe]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1793_c2_0dfe_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1793_c2_0dfe_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1793_c2_0dfe_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1793_c2_0dfe_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1793_c2_0dfe]
signal result_u8_value_MUX_uxn_opcodes_h_l1793_c2_0dfe_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1793_c2_0dfe_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1793_c2_0dfe_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1793_c2_0dfe_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1793_c2_0dfe]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1793_c2_0dfe_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1793_c2_0dfe_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1793_c2_0dfe_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1793_c2_0dfe_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1793_c2_0dfe]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1793_c2_0dfe_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1793_c2_0dfe_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1793_c2_0dfe_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1793_c2_0dfe_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1793_c2_0dfe]
signal t8_MUX_uxn_opcodes_h_l1793_c2_0dfe_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1793_c2_0dfe_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1793_c2_0dfe_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1793_c2_0dfe_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1793_c2_0dfe]
signal n8_MUX_uxn_opcodes_h_l1793_c2_0dfe_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1793_c2_0dfe_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1793_c2_0dfe_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1793_c2_0dfe_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1801_c11_d72c]
signal BIN_OP_EQ_uxn_opcodes_h_l1801_c11_d72c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1801_c11_d72c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1801_c11_d72c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1801_c7_8ce7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1801_c7_8ce7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1801_c7_8ce7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1801_c7_8ce7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1801_c7_8ce7_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1801_c7_8ce7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1801_c7_8ce7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1801_c7_8ce7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1801_c7_8ce7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1801_c7_8ce7_return_output : unsigned(0 downto 0);

-- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l1801_c7_8ce7]
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1801_c7_8ce7_cond : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1801_c7_8ce7_iftrue : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1801_c7_8ce7_iffalse : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1801_c7_8ce7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1801_c7_8ce7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_8ce7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_8ce7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_8ce7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_8ce7_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1801_c7_8ce7]
signal result_u8_value_MUX_uxn_opcodes_h_l1801_c7_8ce7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1801_c7_8ce7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1801_c7_8ce7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1801_c7_8ce7_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1801_c7_8ce7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1801_c7_8ce7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1801_c7_8ce7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1801_c7_8ce7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1801_c7_8ce7_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1801_c7_8ce7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_8ce7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_8ce7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_8ce7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_8ce7_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1801_c7_8ce7]
signal t8_MUX_uxn_opcodes_h_l1801_c7_8ce7_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1801_c7_8ce7_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1801_c7_8ce7_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1801_c7_8ce7_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1801_c7_8ce7]
signal n8_MUX_uxn_opcodes_h_l1801_c7_8ce7_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1801_c7_8ce7_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1801_c7_8ce7_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1801_c7_8ce7_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1804_c30_450b]
signal sp_relative_shift_uxn_opcodes_h_l1804_c30_450b_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1804_c30_450b_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1804_c30_450b_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1804_c30_450b_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1806_c11_6dde]
signal BIN_OP_EQ_uxn_opcodes_h_l1806_c11_6dde_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1806_c11_6dde_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1806_c11_6dde_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1806_c7_5ede]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1806_c7_5ede_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1806_c7_5ede_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1806_c7_5ede_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1806_c7_5ede_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1806_c7_5ede]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1806_c7_5ede_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1806_c7_5ede_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1806_c7_5ede_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1806_c7_5ede_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1806_c7_5ede]
signal result_u8_value_MUX_uxn_opcodes_h_l1806_c7_5ede_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1806_c7_5ede_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1806_c7_5ede_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1806_c7_5ede_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1806_c7_5ede]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1806_c7_5ede_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1806_c7_5ede_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1806_c7_5ede_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1806_c7_5ede_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1806_c7_5ede]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1806_c7_5ede_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1806_c7_5ede_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1806_c7_5ede_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1806_c7_5ede_return_output : unsigned(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l1806_c7_5ede]
signal t8_MUX_uxn_opcodes_h_l1806_c7_5ede_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1806_c7_5ede_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1806_c7_5ede_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1806_c7_5ede_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1806_c7_5ede]
signal n8_MUX_uxn_opcodes_h_l1806_c7_5ede_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1806_c7_5ede_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1806_c7_5ede_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1806_c7_5ede_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1808_c18_1637]
signal CONST_SR_8_uxn_opcodes_h_l1808_c18_1637_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1808_c18_1637_return_output : unsigned(15 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_opcodes_h_l1812_c21_9b82]
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1812_c21_9b82_left : unsigned(7 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1812_c21_9b82_right : unsigned(7 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1812_c21_9b82_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1814_c11_de5f]
signal BIN_OP_EQ_uxn_opcodes_h_l1814_c11_de5f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1814_c11_de5f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1814_c11_de5f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1814_c7_f56c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1814_c7_f56c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1814_c7_f56c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1814_c7_f56c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1814_c7_f56c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1814_c7_f56c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1814_c7_f56c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1814_c7_f56c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1814_c7_f56c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1814_c7_f56c_return_output : unsigned(0 downto 0);

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_9d9a( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_address_sp_offset := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.is_stack_operation_16bit := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.u8_value := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_stack_write := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1793_c6_3b3c
BIN_OP_EQ_uxn_opcodes_h_l1793_c6_3b3c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1793_c6_3b3c_left,
BIN_OP_EQ_uxn_opcodes_h_l1793_c6_3b3c_right,
BIN_OP_EQ_uxn_opcodes_h_l1793_c6_3b3c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c2_0dfe
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c2_0dfe : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c2_0dfe_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c2_0dfe_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c2_0dfe_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c2_0dfe_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1793_c2_0dfe
result_is_sp_shift_MUX_uxn_opcodes_h_l1793_c2_0dfe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1793_c2_0dfe_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1793_c2_0dfe_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1793_c2_0dfe_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1793_c2_0dfe_return_output);

-- result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1793_c2_0dfe
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1793_c2_0dfe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1793_c2_0dfe_cond,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1793_c2_0dfe_iftrue,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1793_c2_0dfe_iffalse,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1793_c2_0dfe_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1793_c2_0dfe
result_is_opc_done_MUX_uxn_opcodes_h_l1793_c2_0dfe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1793_c2_0dfe_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1793_c2_0dfe_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1793_c2_0dfe_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1793_c2_0dfe_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1793_c2_0dfe
result_u8_value_MUX_uxn_opcodes_h_l1793_c2_0dfe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1793_c2_0dfe_cond,
result_u8_value_MUX_uxn_opcodes_h_l1793_c2_0dfe_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1793_c2_0dfe_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1793_c2_0dfe_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1793_c2_0dfe
result_sp_relative_shift_MUX_uxn_opcodes_h_l1793_c2_0dfe : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1793_c2_0dfe_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1793_c2_0dfe_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1793_c2_0dfe_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1793_c2_0dfe_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1793_c2_0dfe
result_is_stack_write_MUX_uxn_opcodes_h_l1793_c2_0dfe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1793_c2_0dfe_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1793_c2_0dfe_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1793_c2_0dfe_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1793_c2_0dfe_return_output);

-- t8_MUX_uxn_opcodes_h_l1793_c2_0dfe
t8_MUX_uxn_opcodes_h_l1793_c2_0dfe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1793_c2_0dfe_cond,
t8_MUX_uxn_opcodes_h_l1793_c2_0dfe_iftrue,
t8_MUX_uxn_opcodes_h_l1793_c2_0dfe_iffalse,
t8_MUX_uxn_opcodes_h_l1793_c2_0dfe_return_output);

-- n8_MUX_uxn_opcodes_h_l1793_c2_0dfe
n8_MUX_uxn_opcodes_h_l1793_c2_0dfe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1793_c2_0dfe_cond,
n8_MUX_uxn_opcodes_h_l1793_c2_0dfe_iftrue,
n8_MUX_uxn_opcodes_h_l1793_c2_0dfe_iffalse,
n8_MUX_uxn_opcodes_h_l1793_c2_0dfe_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1801_c11_d72c
BIN_OP_EQ_uxn_opcodes_h_l1801_c11_d72c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1801_c11_d72c_left,
BIN_OP_EQ_uxn_opcodes_h_l1801_c11_d72c_right,
BIN_OP_EQ_uxn_opcodes_h_l1801_c11_d72c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1801_c7_8ce7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1801_c7_8ce7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1801_c7_8ce7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1801_c7_8ce7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1801_c7_8ce7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1801_c7_8ce7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1801_c7_8ce7
result_is_sp_shift_MUX_uxn_opcodes_h_l1801_c7_8ce7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1801_c7_8ce7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1801_c7_8ce7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1801_c7_8ce7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1801_c7_8ce7_return_output);

-- result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1801_c7_8ce7
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1801_c7_8ce7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1801_c7_8ce7_cond,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1801_c7_8ce7_iftrue,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1801_c7_8ce7_iffalse,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1801_c7_8ce7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_8ce7
result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_8ce7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_8ce7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_8ce7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_8ce7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_8ce7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1801_c7_8ce7
result_u8_value_MUX_uxn_opcodes_h_l1801_c7_8ce7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1801_c7_8ce7_cond,
result_u8_value_MUX_uxn_opcodes_h_l1801_c7_8ce7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1801_c7_8ce7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1801_c7_8ce7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1801_c7_8ce7
result_sp_relative_shift_MUX_uxn_opcodes_h_l1801_c7_8ce7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1801_c7_8ce7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1801_c7_8ce7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1801_c7_8ce7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1801_c7_8ce7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_8ce7
result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_8ce7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_8ce7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_8ce7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_8ce7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_8ce7_return_output);

-- t8_MUX_uxn_opcodes_h_l1801_c7_8ce7
t8_MUX_uxn_opcodes_h_l1801_c7_8ce7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1801_c7_8ce7_cond,
t8_MUX_uxn_opcodes_h_l1801_c7_8ce7_iftrue,
t8_MUX_uxn_opcodes_h_l1801_c7_8ce7_iffalse,
t8_MUX_uxn_opcodes_h_l1801_c7_8ce7_return_output);

-- n8_MUX_uxn_opcodes_h_l1801_c7_8ce7
n8_MUX_uxn_opcodes_h_l1801_c7_8ce7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1801_c7_8ce7_cond,
n8_MUX_uxn_opcodes_h_l1801_c7_8ce7_iftrue,
n8_MUX_uxn_opcodes_h_l1801_c7_8ce7_iffalse,
n8_MUX_uxn_opcodes_h_l1801_c7_8ce7_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1804_c30_450b
sp_relative_shift_uxn_opcodes_h_l1804_c30_450b : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1804_c30_450b_ins,
sp_relative_shift_uxn_opcodes_h_l1804_c30_450b_x,
sp_relative_shift_uxn_opcodes_h_l1804_c30_450b_y,
sp_relative_shift_uxn_opcodes_h_l1804_c30_450b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1806_c11_6dde
BIN_OP_EQ_uxn_opcodes_h_l1806_c11_6dde : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1806_c11_6dde_left,
BIN_OP_EQ_uxn_opcodes_h_l1806_c11_6dde_right,
BIN_OP_EQ_uxn_opcodes_h_l1806_c11_6dde_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1806_c7_5ede
result_is_sp_shift_MUX_uxn_opcodes_h_l1806_c7_5ede : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1806_c7_5ede_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1806_c7_5ede_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1806_c7_5ede_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1806_c7_5ede_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1806_c7_5ede
result_is_opc_done_MUX_uxn_opcodes_h_l1806_c7_5ede : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1806_c7_5ede_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1806_c7_5ede_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1806_c7_5ede_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1806_c7_5ede_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1806_c7_5ede
result_u8_value_MUX_uxn_opcodes_h_l1806_c7_5ede : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1806_c7_5ede_cond,
result_u8_value_MUX_uxn_opcodes_h_l1806_c7_5ede_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1806_c7_5ede_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1806_c7_5ede_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1806_c7_5ede
result_is_stack_write_MUX_uxn_opcodes_h_l1806_c7_5ede : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1806_c7_5ede_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1806_c7_5ede_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1806_c7_5ede_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1806_c7_5ede_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1806_c7_5ede
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1806_c7_5ede : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1806_c7_5ede_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1806_c7_5ede_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1806_c7_5ede_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1806_c7_5ede_return_output);

-- t8_MUX_uxn_opcodes_h_l1806_c7_5ede
t8_MUX_uxn_opcodes_h_l1806_c7_5ede : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1806_c7_5ede_cond,
t8_MUX_uxn_opcodes_h_l1806_c7_5ede_iftrue,
t8_MUX_uxn_opcodes_h_l1806_c7_5ede_iffalse,
t8_MUX_uxn_opcodes_h_l1806_c7_5ede_return_output);

-- n8_MUX_uxn_opcodes_h_l1806_c7_5ede
n8_MUX_uxn_opcodes_h_l1806_c7_5ede : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1806_c7_5ede_cond,
n8_MUX_uxn_opcodes_h_l1806_c7_5ede_iftrue,
n8_MUX_uxn_opcodes_h_l1806_c7_5ede_iffalse,
n8_MUX_uxn_opcodes_h_l1806_c7_5ede_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1808_c18_1637
CONST_SR_8_uxn_opcodes_h_l1808_c18_1637 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1808_c18_1637_x,
CONST_SR_8_uxn_opcodes_h_l1808_c18_1637_return_output);

-- BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1812_c21_9b82
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1812_c21_9b82 : entity work.BIN_OP_INFERRED_MULT_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1812_c21_9b82_left,
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1812_c21_9b82_right,
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1812_c21_9b82_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1814_c11_de5f
BIN_OP_EQ_uxn_opcodes_h_l1814_c11_de5f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1814_c11_de5f_left,
BIN_OP_EQ_uxn_opcodes_h_l1814_c11_de5f_right,
BIN_OP_EQ_uxn_opcodes_h_l1814_c11_de5f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1814_c7_f56c
result_is_opc_done_MUX_uxn_opcodes_h_l1814_c7_f56c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1814_c7_f56c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1814_c7_f56c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1814_c7_f56c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1814_c7_f56c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1814_c7_f56c
result_is_stack_write_MUX_uxn_opcodes_h_l1814_c7_f56c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1814_c7_f56c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1814_c7_f56c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1814_c7_f56c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1814_c7_f56c_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t8,
 n8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1793_c6_3b3c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c2_0dfe_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1793_c2_0dfe_return_output,
 result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1793_c2_0dfe_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1793_c2_0dfe_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1793_c2_0dfe_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1793_c2_0dfe_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1793_c2_0dfe_return_output,
 t8_MUX_uxn_opcodes_h_l1793_c2_0dfe_return_output,
 n8_MUX_uxn_opcodes_h_l1793_c2_0dfe_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1801_c11_d72c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1801_c7_8ce7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1801_c7_8ce7_return_output,
 result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1801_c7_8ce7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_8ce7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1801_c7_8ce7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1801_c7_8ce7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_8ce7_return_output,
 t8_MUX_uxn_opcodes_h_l1801_c7_8ce7_return_output,
 n8_MUX_uxn_opcodes_h_l1801_c7_8ce7_return_output,
 sp_relative_shift_uxn_opcodes_h_l1804_c30_450b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1806_c11_6dde_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1806_c7_5ede_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1806_c7_5ede_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1806_c7_5ede_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1806_c7_5ede_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1806_c7_5ede_return_output,
 t8_MUX_uxn_opcodes_h_l1806_c7_5ede_return_output,
 n8_MUX_uxn_opcodes_h_l1806_c7_5ede_return_output,
 CONST_SR_8_uxn_opcodes_h_l1808_c18_1637_return_output,
 BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1812_c21_9b82_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1814_c11_de5f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1814_c7_f56c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1814_c7_f56c_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1793_c6_3b3c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1793_c6_3b3c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1793_c6_3b3c_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c2_0dfe_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1798_c3_b86c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c2_0dfe_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1801_c7_8ce7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c2_0dfe_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c2_0dfe_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1793_c2_0dfe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1793_c2_0dfe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1801_c7_8ce7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1793_c2_0dfe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1793_c2_0dfe_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1793_c2_0dfe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1793_c2_0dfe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1801_c7_8ce7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1793_c2_0dfe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1793_c2_0dfe_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1793_c2_0dfe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1793_c2_0dfe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_8ce7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1793_c2_0dfe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1793_c2_0dfe_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1793_c2_0dfe_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1793_c2_0dfe_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1801_c7_8ce7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1793_c2_0dfe_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1793_c2_0dfe_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1793_c2_0dfe_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1793_c2_0dfe_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1801_c7_8ce7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1793_c2_0dfe_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1793_c2_0dfe_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1793_c2_0dfe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1793_c2_0dfe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_8ce7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1793_c2_0dfe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1793_c2_0dfe_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1793_c2_0dfe_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1793_c2_0dfe_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1801_c7_8ce7_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1793_c2_0dfe_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1793_c2_0dfe_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1793_c2_0dfe_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1793_c2_0dfe_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1801_c7_8ce7_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1793_c2_0dfe_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1793_c2_0dfe_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1801_c11_d72c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1801_c11_d72c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1801_c11_d72c_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1801_c7_8ce7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1801_c7_8ce7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1806_c7_5ede_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1801_c7_8ce7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1801_c7_8ce7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1801_c7_8ce7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1806_c7_5ede_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1801_c7_8ce7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1801_c7_8ce7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1801_c7_8ce7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l1801_c7_8ce7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1801_c7_8ce7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_8ce7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_8ce7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1806_c7_5ede_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_8ce7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1801_c7_8ce7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1801_c7_8ce7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1806_c7_5ede_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1801_c7_8ce7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1801_c7_8ce7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1801_c7_8ce7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1801_c7_8ce7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_8ce7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_8ce7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1806_c7_5ede_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_8ce7_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1801_c7_8ce7_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1801_c7_8ce7_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1806_c7_5ede_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1801_c7_8ce7_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1801_c7_8ce7_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1801_c7_8ce7_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1806_c7_5ede_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1801_c7_8ce7_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1804_c30_450b_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1804_c30_450b_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1804_c30_450b_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1804_c30_450b_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1806_c11_6dde_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1806_c11_6dde_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1806_c11_6dde_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1806_c7_5ede_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1806_c7_5ede_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1806_c7_5ede_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1806_c7_5ede_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1806_c7_5ede_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1814_c7_f56c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1806_c7_5ede_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1806_c7_5ede_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_uxn_opcodes_h_l1812_c3_efb0 : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1806_c7_5ede_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1806_c7_5ede_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1806_c7_5ede_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1806_c7_5ede_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1814_c7_f56c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1806_c7_5ede_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1806_c7_5ede_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1811_c3_9065 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1806_c7_5ede_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1806_c7_5ede_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1806_c7_5ede_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1806_c7_5ede_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1806_c7_5ede_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1806_c7_5ede_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1806_c7_5ede_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1806_c7_5ede_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1807_c8_df21_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1808_c18_1637_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1808_c18_1637_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1808_c8_80b6_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1812_c21_9b82_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1812_c21_9b82_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1812_c21_9b82_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1814_c11_de5f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1814_c11_de5f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1814_c11_de5f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1814_c7_f56c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1814_c7_f56c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1814_c7_f56c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1814_c7_f56c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1814_c7_f56c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1814_c7_f56c_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1806_l1793_DUPLICATE_be2d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1806_l1793_l1801_DUPLICATE_eb86_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1793_l1801_DUPLICATE_6d32_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1793_l1814_l1801_DUPLICATE_2168_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1806_l1801_DUPLICATE_80db_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1806_l1814_l1801_DUPLICATE_624b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9d9a_uxn_opcodes_h_l1789_l1819_DUPLICATE_2d90_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n8 := n8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_sp_relative_shift_uxn_opcodes_h_l1804_c30_450b_y := resize(to_signed(-1, 2), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1801_c11_d72c_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1814_c7_f56c_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1804_c30_450b_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1801_c7_8ce7_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1793_c2_0dfe_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1814_c11_de5f_right := to_unsigned(3, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1806_c7_5ede_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1811_c3_9065 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1806_c7_5ede_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1811_c3_9065;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1793_c6_3b3c_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1798_c3_b86c := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c2_0dfe_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1798_c3_b86c;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1814_c7_f56c_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1793_c2_0dfe_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1806_c11_6dde_right := to_unsigned(2, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1801_c7_8ce7_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1806_c7_5ede_iftrue := to_unsigned(1, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_previous_stack_read := previous_stack_read;

     -- Submodule level 0
     VAR_sp_relative_shift_uxn_opcodes_h_l1804_c30_450b_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l1793_c2_0dfe_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1801_c7_8ce7_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1806_c7_5ede_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1793_c6_3b3c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1801_c11_d72c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1806_c11_6dde_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1814_c11_de5f_left := VAR_phase;
     VAR_CONST_SR_8_uxn_opcodes_h_l1808_c18_1637_x := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1793_c2_0dfe_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1801_c7_8ce7_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1806_c7_5ede_iffalse := t8;
     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1806_l1793_l1801_DUPLICATE_eb86 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1806_l1793_l1801_DUPLICATE_eb86_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1801_c11_d72c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1801_c11_d72c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1801_c11_d72c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1801_c11_d72c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1801_c11_d72c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1801_c11_d72c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1801_c11_d72c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1806_c11_6dde] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1806_c11_6dde_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1806_c11_6dde_left;
     BIN_OP_EQ_uxn_opcodes_h_l1806_c11_6dde_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1806_c11_6dde_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1806_c11_6dde_return_output := BIN_OP_EQ_uxn_opcodes_h_l1806_c11_6dde_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1793_c6_3b3c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1793_c6_3b3c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1793_c6_3b3c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1793_c6_3b3c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1793_c6_3b3c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1793_c6_3b3c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1793_c6_3b3c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1814_c11_de5f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1814_c11_de5f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1814_c11_de5f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1814_c11_de5f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1814_c11_de5f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1814_c11_de5f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1814_c11_de5f_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1806_l1801_DUPLICATE_80db LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1806_l1801_DUPLICATE_80db_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1806_l1793_DUPLICATE_be2d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1806_l1793_DUPLICATE_be2d_return_output := result.is_sp_shift;

     -- sp_relative_shift[uxn_opcodes_h_l1804_c30_450b] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1804_c30_450b_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1804_c30_450b_ins;
     sp_relative_shift_uxn_opcodes_h_l1804_c30_450b_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1804_c30_450b_x;
     sp_relative_shift_uxn_opcodes_h_l1804_c30_450b_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1804_c30_450b_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1804_c30_450b_return_output := sp_relative_shift_uxn_opcodes_h_l1804_c30_450b_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1807_c8_df21] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1807_c8_df21_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1793_l1801_DUPLICATE_6d32 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1793_l1801_DUPLICATE_6d32_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1793_l1814_l1801_DUPLICATE_2168 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1793_l1814_l1801_DUPLICATE_2168_return_output := result.is_stack_write;

     -- result_is_stack_operation_16bit_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d[uxn_opcodes_h_l1801_c7_8ce7] LATENCY=0
     VAR_result_is_stack_operation_16bit_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l1801_c7_8ce7_return_output := result.is_stack_operation_16bit;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1806_l1814_l1801_DUPLICATE_624b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1806_l1814_l1801_DUPLICATE_624b_return_output := result.is_opc_done;

     -- CONST_SR_8[uxn_opcodes_h_l1808_c18_1637] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1808_c18_1637_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1808_c18_1637_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1808_c18_1637_return_output := CONST_SR_8_uxn_opcodes_h_l1808_c18_1637_return_output;

     -- Submodule level 1
     VAR_n8_MUX_uxn_opcodes_h_l1793_c2_0dfe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1793_c6_3b3c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1793_c2_0dfe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1793_c6_3b3c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1793_c2_0dfe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1793_c6_3b3c_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1793_c2_0dfe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1793_c6_3b3c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1793_c2_0dfe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1793_c6_3b3c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1793_c2_0dfe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1793_c6_3b3c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c2_0dfe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1793_c6_3b3c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1793_c2_0dfe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1793_c6_3b3c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1793_c2_0dfe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1793_c6_3b3c_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1801_c7_8ce7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1801_c11_d72c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_8ce7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1801_c11_d72c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1801_c7_8ce7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1801_c11_d72c_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1801_c7_8ce7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1801_c11_d72c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_8ce7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1801_c11_d72c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1801_c7_8ce7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1801_c11_d72c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1801_c7_8ce7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1801_c11_d72c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1801_c7_8ce7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1801_c11_d72c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1801_c7_8ce7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1801_c11_d72c_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1806_c7_5ede_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1806_c11_6dde_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1806_c7_5ede_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1806_c11_6dde_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1806_c7_5ede_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1806_c11_6dde_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1806_c7_5ede_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1806_c11_6dde_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1806_c7_5ede_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1806_c11_6dde_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1806_c7_5ede_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1806_c11_6dde_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1806_c7_5ede_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1806_c11_6dde_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1814_c7_f56c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1814_c11_de5f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1814_c7_f56c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1814_c11_de5f_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1812_c21_9b82_right := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1807_c8_df21_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1806_c7_5ede_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1807_c8_df21_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1793_c2_0dfe_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1793_l1801_DUPLICATE_6d32_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1801_c7_8ce7_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1793_l1801_DUPLICATE_6d32_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_8ce7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1806_l1814_l1801_DUPLICATE_624b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1806_c7_5ede_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1806_l1814_l1801_DUPLICATE_624b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1814_c7_f56c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1806_l1814_l1801_DUPLICATE_624b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1793_c2_0dfe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1806_l1793_DUPLICATE_be2d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1806_c7_5ede_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1806_l1793_DUPLICATE_be2d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1793_c2_0dfe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1793_l1814_l1801_DUPLICATE_2168_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_8ce7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1793_l1814_l1801_DUPLICATE_2168_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1814_c7_f56c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1793_l1814_l1801_DUPLICATE_2168_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1801_c7_8ce7_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1806_l1801_DUPLICATE_80db_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1806_c7_5ede_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1806_l1801_DUPLICATE_80db_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1793_c2_0dfe_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1806_l1793_l1801_DUPLICATE_eb86_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1801_c7_8ce7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1806_l1793_l1801_DUPLICATE_eb86_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1806_c7_5ede_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1806_l1793_l1801_DUPLICATE_eb86_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1801_c7_8ce7_iffalse := VAR_result_is_stack_operation_16bit_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l1801_c7_8ce7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1801_c7_8ce7_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1804_c30_450b_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1814_c7_f56c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1814_c7_f56c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1814_c7_f56c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1814_c7_f56c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1814_c7_f56c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1814_c7_f56c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1814_c7_f56c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1814_c7_f56c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1814_c7_f56c_return_output;

     -- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l1801_c7_8ce7] LATENCY=0
     -- Inputs
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1801_c7_8ce7_cond <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1801_c7_8ce7_cond;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1801_c7_8ce7_iftrue <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1801_c7_8ce7_iftrue;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1801_c7_8ce7_iffalse <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1801_c7_8ce7_iffalse;
     -- Outputs
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1801_c7_8ce7_return_output := result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1801_c7_8ce7_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1808_c8_80b6] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1808_c8_80b6_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1808_c18_1637_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1806_c7_5ede] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1806_c7_5ede_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1806_c7_5ede_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1806_c7_5ede_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1806_c7_5ede_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1806_c7_5ede_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1806_c7_5ede_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1806_c7_5ede_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1806_c7_5ede_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1814_c7_f56c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1814_c7_f56c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1814_c7_f56c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1814_c7_f56c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1814_c7_f56c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1814_c7_f56c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1814_c7_f56c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1814_c7_f56c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1814_c7_f56c_return_output;

     -- t8_MUX[uxn_opcodes_h_l1806_c7_5ede] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1806_c7_5ede_cond <= VAR_t8_MUX_uxn_opcodes_h_l1806_c7_5ede_cond;
     t8_MUX_uxn_opcodes_h_l1806_c7_5ede_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1806_c7_5ede_iftrue;
     t8_MUX_uxn_opcodes_h_l1806_c7_5ede_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1806_c7_5ede_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1806_c7_5ede_return_output := t8_MUX_uxn_opcodes_h_l1806_c7_5ede_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1801_c7_8ce7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1801_c7_8ce7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1801_c7_8ce7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1801_c7_8ce7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1801_c7_8ce7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1801_c7_8ce7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1801_c7_8ce7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1801_c7_8ce7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1801_c7_8ce7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1806_c7_5ede] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1806_c7_5ede_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1806_c7_5ede_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1806_c7_5ede_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1806_c7_5ede_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1806_c7_5ede_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1806_c7_5ede_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1806_c7_5ede_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1806_c7_5ede_return_output;

     -- Submodule level 2
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1812_c21_9b82_left := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1808_c8_80b6_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1806_c7_5ede_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1808_c8_80b6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1806_c7_5ede_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1814_c7_f56c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1801_c7_8ce7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1806_c7_5ede_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1793_c2_0dfe_iffalse := VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1801_c7_8ce7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1806_c7_5ede_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1814_c7_f56c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1793_c2_0dfe_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1801_c7_8ce7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1801_c7_8ce7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1806_c7_5ede_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1801_c7_8ce7_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1806_c7_5ede_return_output;
     -- BIN_OP_INFERRED_MULT[uxn_opcodes_h_l1812_c21_9b82] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1812_c21_9b82_left <= VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1812_c21_9b82_left;
     BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1812_c21_9b82_right <= VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1812_c21_9b82_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1812_c21_9b82_return_output := BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1812_c21_9b82_return_output;

     -- t8_MUX[uxn_opcodes_h_l1801_c7_8ce7] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1801_c7_8ce7_cond <= VAR_t8_MUX_uxn_opcodes_h_l1801_c7_8ce7_cond;
     t8_MUX_uxn_opcodes_h_l1801_c7_8ce7_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1801_c7_8ce7_iftrue;
     t8_MUX_uxn_opcodes_h_l1801_c7_8ce7_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1801_c7_8ce7_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1801_c7_8ce7_return_output := t8_MUX_uxn_opcodes_h_l1801_c7_8ce7_return_output;

     -- n8_MUX[uxn_opcodes_h_l1806_c7_5ede] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1806_c7_5ede_cond <= VAR_n8_MUX_uxn_opcodes_h_l1806_c7_5ede_cond;
     n8_MUX_uxn_opcodes_h_l1806_c7_5ede_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1806_c7_5ede_iftrue;
     n8_MUX_uxn_opcodes_h_l1806_c7_5ede_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1806_c7_5ede_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1806_c7_5ede_return_output := n8_MUX_uxn_opcodes_h_l1806_c7_5ede_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1806_c7_5ede] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1806_c7_5ede_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1806_c7_5ede_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1806_c7_5ede_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1806_c7_5ede_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1806_c7_5ede_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1806_c7_5ede_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1806_c7_5ede_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1806_c7_5ede_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1793_c2_0dfe] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1793_c2_0dfe_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1793_c2_0dfe_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1793_c2_0dfe_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1793_c2_0dfe_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1793_c2_0dfe_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1793_c2_0dfe_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1793_c2_0dfe_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1793_c2_0dfe_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1806_c7_5ede] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1806_c7_5ede_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1806_c7_5ede_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1806_c7_5ede_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1806_c7_5ede_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1806_c7_5ede_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1806_c7_5ede_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1806_c7_5ede_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1806_c7_5ede_return_output;

     -- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l1793_c2_0dfe] LATENCY=0
     -- Inputs
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1793_c2_0dfe_cond <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1793_c2_0dfe_cond;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1793_c2_0dfe_iftrue <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1793_c2_0dfe_iftrue;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1793_c2_0dfe_iffalse <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1793_c2_0dfe_iffalse;
     -- Outputs
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1793_c2_0dfe_return_output := result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1793_c2_0dfe_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1801_c7_8ce7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1801_c7_8ce7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1801_c7_8ce7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1801_c7_8ce7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1801_c7_8ce7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1801_c7_8ce7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1801_c7_8ce7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1801_c7_8ce7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1801_c7_8ce7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1801_c7_8ce7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1801_c7_8ce7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1801_c7_8ce7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1801_c7_8ce7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1801_c7_8ce7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1801_c7_8ce7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1801_c7_8ce7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1801_c7_8ce7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1801_c7_8ce7_return_output;

     -- Submodule level 3
     VAR_result_u8_value_uxn_opcodes_h_l1812_c3_efb0 := resize(VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1812_c21_9b82_return_output, 8);
     VAR_n8_MUX_uxn_opcodes_h_l1801_c7_8ce7_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1806_c7_5ede_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_8ce7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1806_c7_5ede_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1793_c2_0dfe_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1801_c7_8ce7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_8ce7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1806_c7_5ede_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c2_0dfe_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1801_c7_8ce7_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1793_c2_0dfe_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1801_c7_8ce7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1806_c7_5ede_iftrue := VAR_result_u8_value_uxn_opcodes_h_l1812_c3_efb0;
     -- result_u8_value_MUX[uxn_opcodes_h_l1806_c7_5ede] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1806_c7_5ede_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1806_c7_5ede_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1806_c7_5ede_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1806_c7_5ede_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1806_c7_5ede_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1806_c7_5ede_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1806_c7_5ede_return_output := result_u8_value_MUX_uxn_opcodes_h_l1806_c7_5ede_return_output;

     -- t8_MUX[uxn_opcodes_h_l1793_c2_0dfe] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1793_c2_0dfe_cond <= VAR_t8_MUX_uxn_opcodes_h_l1793_c2_0dfe_cond;
     t8_MUX_uxn_opcodes_h_l1793_c2_0dfe_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1793_c2_0dfe_iftrue;
     t8_MUX_uxn_opcodes_h_l1793_c2_0dfe_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1793_c2_0dfe_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1793_c2_0dfe_return_output := t8_MUX_uxn_opcodes_h_l1793_c2_0dfe_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1801_c7_8ce7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_8ce7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_8ce7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_8ce7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_8ce7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_8ce7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_8ce7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_8ce7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_8ce7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1793_c2_0dfe] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1793_c2_0dfe_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1793_c2_0dfe_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1793_c2_0dfe_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1793_c2_0dfe_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1793_c2_0dfe_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1793_c2_0dfe_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1793_c2_0dfe_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1793_c2_0dfe_return_output;

     -- n8_MUX[uxn_opcodes_h_l1801_c7_8ce7] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1801_c7_8ce7_cond <= VAR_n8_MUX_uxn_opcodes_h_l1801_c7_8ce7_cond;
     n8_MUX_uxn_opcodes_h_l1801_c7_8ce7_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1801_c7_8ce7_iftrue;
     n8_MUX_uxn_opcodes_h_l1801_c7_8ce7_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1801_c7_8ce7_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1801_c7_8ce7_return_output := n8_MUX_uxn_opcodes_h_l1801_c7_8ce7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1801_c7_8ce7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_8ce7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_8ce7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_8ce7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_8ce7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_8ce7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_8ce7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_8ce7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_8ce7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1793_c2_0dfe] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c2_0dfe_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c2_0dfe_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c2_0dfe_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c2_0dfe_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c2_0dfe_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c2_0dfe_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c2_0dfe_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c2_0dfe_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l1793_c2_0dfe_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1801_c7_8ce7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1793_c2_0dfe_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_8ce7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1793_c2_0dfe_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_8ce7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1801_c7_8ce7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1806_c7_5ede_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1793_c2_0dfe_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1793_c2_0dfe] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1793_c2_0dfe_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1793_c2_0dfe_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1793_c2_0dfe_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1793_c2_0dfe_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1793_c2_0dfe_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1793_c2_0dfe_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1793_c2_0dfe_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1793_c2_0dfe_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1801_c7_8ce7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1801_c7_8ce7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1801_c7_8ce7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1801_c7_8ce7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1801_c7_8ce7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1801_c7_8ce7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1801_c7_8ce7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1801_c7_8ce7_return_output := result_u8_value_MUX_uxn_opcodes_h_l1801_c7_8ce7_return_output;

     -- n8_MUX[uxn_opcodes_h_l1793_c2_0dfe] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1793_c2_0dfe_cond <= VAR_n8_MUX_uxn_opcodes_h_l1793_c2_0dfe_cond;
     n8_MUX_uxn_opcodes_h_l1793_c2_0dfe_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1793_c2_0dfe_iftrue;
     n8_MUX_uxn_opcodes_h_l1793_c2_0dfe_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1793_c2_0dfe_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1793_c2_0dfe_return_output := n8_MUX_uxn_opcodes_h_l1793_c2_0dfe_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1793_c2_0dfe] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1793_c2_0dfe_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1793_c2_0dfe_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1793_c2_0dfe_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1793_c2_0dfe_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1793_c2_0dfe_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1793_c2_0dfe_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1793_c2_0dfe_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1793_c2_0dfe_return_output;

     -- Submodule level 5
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l1793_c2_0dfe_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1793_c2_0dfe_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1801_c7_8ce7_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1793_c2_0dfe] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1793_c2_0dfe_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1793_c2_0dfe_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1793_c2_0dfe_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1793_c2_0dfe_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1793_c2_0dfe_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1793_c2_0dfe_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1793_c2_0dfe_return_output := result_u8_value_MUX_uxn_opcodes_h_l1793_c2_0dfe_return_output;

     -- Submodule level 6
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_9d9a_uxn_opcodes_h_l1789_l1819_DUPLICATE_2d90 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9d9a_uxn_opcodes_h_l1789_l1819_DUPLICATE_2d90_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_9d9a(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c2_0dfe_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1793_c2_0dfe_return_output,
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1793_c2_0dfe_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1793_c2_0dfe_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1793_c2_0dfe_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1793_c2_0dfe_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1793_c2_0dfe_return_output);

     -- Submodule level 7
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9d9a_uxn_opcodes_h_l1789_l1819_DUPLICATE_2d90_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9d9a_uxn_opcodes_h_l1789_l1819_DUPLICATE_2d90_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n8 <= REG_COMB_n8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
