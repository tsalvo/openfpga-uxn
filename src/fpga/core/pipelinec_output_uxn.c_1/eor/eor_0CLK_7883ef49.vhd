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
entity eor_0CLK_7883ef49 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(15 downto 0);
 return_output : out opcode_result_t);
end eor_0CLK_7883ef49;
architecture arch of eor_0CLK_7883ef49 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l990_c6_c0db]
signal BIN_OP_EQ_uxn_opcodes_h_l990_c6_c0db_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l990_c6_c0db_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l990_c6_c0db_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l990_c2_8c9f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l990_c2_8c9f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l990_c2_8c9f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l990_c2_8c9f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l990_c2_8c9f_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l990_c2_8c9f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l990_c2_8c9f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l990_c2_8c9f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l990_c2_8c9f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l990_c2_8c9f_return_output : unsigned(0 downto 0);

-- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l990_c2_8c9f]
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l990_c2_8c9f_cond : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l990_c2_8c9f_iftrue : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l990_c2_8c9f_iffalse : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l990_c2_8c9f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l990_c2_8c9f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l990_c2_8c9f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l990_c2_8c9f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l990_c2_8c9f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l990_c2_8c9f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l990_c2_8c9f]
signal result_u8_value_MUX_uxn_opcodes_h_l990_c2_8c9f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l990_c2_8c9f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l990_c2_8c9f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l990_c2_8c9f_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l990_c2_8c9f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l990_c2_8c9f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l990_c2_8c9f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l990_c2_8c9f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l990_c2_8c9f_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l990_c2_8c9f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l990_c2_8c9f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l990_c2_8c9f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l990_c2_8c9f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l990_c2_8c9f_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l990_c2_8c9f]
signal t8_MUX_uxn_opcodes_h_l990_c2_8c9f_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l990_c2_8c9f_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l990_c2_8c9f_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l990_c2_8c9f_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l990_c2_8c9f]
signal n8_MUX_uxn_opcodes_h_l990_c2_8c9f_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l990_c2_8c9f_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l990_c2_8c9f_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l990_c2_8c9f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l998_c11_c6d4]
signal BIN_OP_EQ_uxn_opcodes_h_l998_c11_c6d4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l998_c11_c6d4_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l998_c11_c6d4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l998_c7_9725]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l998_c7_9725_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l998_c7_9725_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l998_c7_9725_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l998_c7_9725_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l998_c7_9725]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l998_c7_9725_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l998_c7_9725_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l998_c7_9725_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l998_c7_9725_return_output : unsigned(0 downto 0);

-- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l998_c7_9725]
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l998_c7_9725_cond : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l998_c7_9725_iftrue : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l998_c7_9725_iffalse : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l998_c7_9725_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l998_c7_9725]
signal result_is_opc_done_MUX_uxn_opcodes_h_l998_c7_9725_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l998_c7_9725_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l998_c7_9725_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l998_c7_9725_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l998_c7_9725]
signal result_u8_value_MUX_uxn_opcodes_h_l998_c7_9725_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l998_c7_9725_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l998_c7_9725_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l998_c7_9725_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l998_c7_9725]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l998_c7_9725_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l998_c7_9725_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l998_c7_9725_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l998_c7_9725_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l998_c7_9725]
signal result_is_stack_write_MUX_uxn_opcodes_h_l998_c7_9725_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l998_c7_9725_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l998_c7_9725_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l998_c7_9725_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l998_c7_9725]
signal t8_MUX_uxn_opcodes_h_l998_c7_9725_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l998_c7_9725_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l998_c7_9725_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l998_c7_9725_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l998_c7_9725]
signal n8_MUX_uxn_opcodes_h_l998_c7_9725_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l998_c7_9725_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l998_c7_9725_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l998_c7_9725_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1001_c30_a6bf]
signal sp_relative_shift_uxn_opcodes_h_l1001_c30_a6bf_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1001_c30_a6bf_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1001_c30_a6bf_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1001_c30_a6bf_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1003_c11_266c]
signal BIN_OP_EQ_uxn_opcodes_h_l1003_c11_266c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1003_c11_266c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1003_c11_266c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1003_c7_3dee]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_3dee_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_3dee_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_3dee_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_3dee_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1003_c7_3dee]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_3dee_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_3dee_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_3dee_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_3dee_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1003_c7_3dee]
signal result_u8_value_MUX_uxn_opcodes_h_l1003_c7_3dee_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1003_c7_3dee_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1003_c7_3dee_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1003_c7_3dee_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1003_c7_3dee]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_3dee_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_3dee_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_3dee_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_3dee_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1003_c7_3dee]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_3dee_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_3dee_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_3dee_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_3dee_return_output : unsigned(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l1003_c7_3dee]
signal t8_MUX_uxn_opcodes_h_l1003_c7_3dee_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1003_c7_3dee_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1003_c7_3dee_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1003_c7_3dee_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1003_c7_3dee]
signal n8_MUX_uxn_opcodes_h_l1003_c7_3dee_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1003_c7_3dee_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1003_c7_3dee_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1003_c7_3dee_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1005_c18_e9b5]
signal CONST_SR_8_uxn_opcodes_h_l1005_c18_e9b5_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1005_c18_e9b5_return_output : unsigned(15 downto 0);

-- BIN_OP_XOR[uxn_opcodes_h_l1009_c21_5f7b]
signal BIN_OP_XOR_uxn_opcodes_h_l1009_c21_5f7b_left : unsigned(7 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l1009_c21_5f7b_right : unsigned(7 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l1009_c21_5f7b_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1011_c11_1bd0]
signal BIN_OP_EQ_uxn_opcodes_h_l1011_c11_1bd0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1011_c11_1bd0_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1011_c11_1bd0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1011_c7_96c9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_96c9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_96c9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_96c9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_96c9_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1011_c7_96c9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_96c9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_96c9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_96c9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_96c9_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l990_c6_c0db
BIN_OP_EQ_uxn_opcodes_h_l990_c6_c0db : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l990_c6_c0db_left,
BIN_OP_EQ_uxn_opcodes_h_l990_c6_c0db_right,
BIN_OP_EQ_uxn_opcodes_h_l990_c6_c0db_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l990_c2_8c9f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l990_c2_8c9f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l990_c2_8c9f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l990_c2_8c9f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l990_c2_8c9f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l990_c2_8c9f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l990_c2_8c9f
result_is_sp_shift_MUX_uxn_opcodes_h_l990_c2_8c9f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l990_c2_8c9f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l990_c2_8c9f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l990_c2_8c9f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l990_c2_8c9f_return_output);

-- result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l990_c2_8c9f
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l990_c2_8c9f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l990_c2_8c9f_cond,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l990_c2_8c9f_iftrue,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l990_c2_8c9f_iffalse,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l990_c2_8c9f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l990_c2_8c9f
result_is_opc_done_MUX_uxn_opcodes_h_l990_c2_8c9f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l990_c2_8c9f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l990_c2_8c9f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l990_c2_8c9f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l990_c2_8c9f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l990_c2_8c9f
result_u8_value_MUX_uxn_opcodes_h_l990_c2_8c9f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l990_c2_8c9f_cond,
result_u8_value_MUX_uxn_opcodes_h_l990_c2_8c9f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l990_c2_8c9f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l990_c2_8c9f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l990_c2_8c9f
result_sp_relative_shift_MUX_uxn_opcodes_h_l990_c2_8c9f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l990_c2_8c9f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l990_c2_8c9f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l990_c2_8c9f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l990_c2_8c9f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l990_c2_8c9f
result_is_stack_write_MUX_uxn_opcodes_h_l990_c2_8c9f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l990_c2_8c9f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l990_c2_8c9f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l990_c2_8c9f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l990_c2_8c9f_return_output);

-- t8_MUX_uxn_opcodes_h_l990_c2_8c9f
t8_MUX_uxn_opcodes_h_l990_c2_8c9f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l990_c2_8c9f_cond,
t8_MUX_uxn_opcodes_h_l990_c2_8c9f_iftrue,
t8_MUX_uxn_opcodes_h_l990_c2_8c9f_iffalse,
t8_MUX_uxn_opcodes_h_l990_c2_8c9f_return_output);

-- n8_MUX_uxn_opcodes_h_l990_c2_8c9f
n8_MUX_uxn_opcodes_h_l990_c2_8c9f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l990_c2_8c9f_cond,
n8_MUX_uxn_opcodes_h_l990_c2_8c9f_iftrue,
n8_MUX_uxn_opcodes_h_l990_c2_8c9f_iffalse,
n8_MUX_uxn_opcodes_h_l990_c2_8c9f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l998_c11_c6d4
BIN_OP_EQ_uxn_opcodes_h_l998_c11_c6d4 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l998_c11_c6d4_left,
BIN_OP_EQ_uxn_opcodes_h_l998_c11_c6d4_right,
BIN_OP_EQ_uxn_opcodes_h_l998_c11_c6d4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l998_c7_9725
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l998_c7_9725 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l998_c7_9725_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l998_c7_9725_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l998_c7_9725_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l998_c7_9725_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l998_c7_9725
result_is_sp_shift_MUX_uxn_opcodes_h_l998_c7_9725 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l998_c7_9725_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l998_c7_9725_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l998_c7_9725_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l998_c7_9725_return_output);

-- result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l998_c7_9725
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l998_c7_9725 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l998_c7_9725_cond,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l998_c7_9725_iftrue,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l998_c7_9725_iffalse,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l998_c7_9725_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l998_c7_9725
result_is_opc_done_MUX_uxn_opcodes_h_l998_c7_9725 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l998_c7_9725_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l998_c7_9725_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l998_c7_9725_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l998_c7_9725_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l998_c7_9725
result_u8_value_MUX_uxn_opcodes_h_l998_c7_9725 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l998_c7_9725_cond,
result_u8_value_MUX_uxn_opcodes_h_l998_c7_9725_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l998_c7_9725_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l998_c7_9725_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l998_c7_9725
result_sp_relative_shift_MUX_uxn_opcodes_h_l998_c7_9725 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l998_c7_9725_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l998_c7_9725_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l998_c7_9725_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l998_c7_9725_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l998_c7_9725
result_is_stack_write_MUX_uxn_opcodes_h_l998_c7_9725 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l998_c7_9725_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l998_c7_9725_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l998_c7_9725_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l998_c7_9725_return_output);

-- t8_MUX_uxn_opcodes_h_l998_c7_9725
t8_MUX_uxn_opcodes_h_l998_c7_9725 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l998_c7_9725_cond,
t8_MUX_uxn_opcodes_h_l998_c7_9725_iftrue,
t8_MUX_uxn_opcodes_h_l998_c7_9725_iffalse,
t8_MUX_uxn_opcodes_h_l998_c7_9725_return_output);

-- n8_MUX_uxn_opcodes_h_l998_c7_9725
n8_MUX_uxn_opcodes_h_l998_c7_9725 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l998_c7_9725_cond,
n8_MUX_uxn_opcodes_h_l998_c7_9725_iftrue,
n8_MUX_uxn_opcodes_h_l998_c7_9725_iffalse,
n8_MUX_uxn_opcodes_h_l998_c7_9725_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1001_c30_a6bf
sp_relative_shift_uxn_opcodes_h_l1001_c30_a6bf : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1001_c30_a6bf_ins,
sp_relative_shift_uxn_opcodes_h_l1001_c30_a6bf_x,
sp_relative_shift_uxn_opcodes_h_l1001_c30_a6bf_y,
sp_relative_shift_uxn_opcodes_h_l1001_c30_a6bf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1003_c11_266c
BIN_OP_EQ_uxn_opcodes_h_l1003_c11_266c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1003_c11_266c_left,
BIN_OP_EQ_uxn_opcodes_h_l1003_c11_266c_right,
BIN_OP_EQ_uxn_opcodes_h_l1003_c11_266c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_3dee
result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_3dee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_3dee_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_3dee_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_3dee_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_3dee_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_3dee
result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_3dee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_3dee_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_3dee_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_3dee_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_3dee_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1003_c7_3dee
result_u8_value_MUX_uxn_opcodes_h_l1003_c7_3dee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1003_c7_3dee_cond,
result_u8_value_MUX_uxn_opcodes_h_l1003_c7_3dee_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1003_c7_3dee_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1003_c7_3dee_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_3dee
result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_3dee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_3dee_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_3dee_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_3dee_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_3dee_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_3dee
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_3dee : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_3dee_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_3dee_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_3dee_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_3dee_return_output);

-- t8_MUX_uxn_opcodes_h_l1003_c7_3dee
t8_MUX_uxn_opcodes_h_l1003_c7_3dee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1003_c7_3dee_cond,
t8_MUX_uxn_opcodes_h_l1003_c7_3dee_iftrue,
t8_MUX_uxn_opcodes_h_l1003_c7_3dee_iffalse,
t8_MUX_uxn_opcodes_h_l1003_c7_3dee_return_output);

-- n8_MUX_uxn_opcodes_h_l1003_c7_3dee
n8_MUX_uxn_opcodes_h_l1003_c7_3dee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1003_c7_3dee_cond,
n8_MUX_uxn_opcodes_h_l1003_c7_3dee_iftrue,
n8_MUX_uxn_opcodes_h_l1003_c7_3dee_iffalse,
n8_MUX_uxn_opcodes_h_l1003_c7_3dee_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1005_c18_e9b5
CONST_SR_8_uxn_opcodes_h_l1005_c18_e9b5 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1005_c18_e9b5_x,
CONST_SR_8_uxn_opcodes_h_l1005_c18_e9b5_return_output);

-- BIN_OP_XOR_uxn_opcodes_h_l1009_c21_5f7b
BIN_OP_XOR_uxn_opcodes_h_l1009_c21_5f7b : entity work.BIN_OP_XOR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_opcodes_h_l1009_c21_5f7b_left,
BIN_OP_XOR_uxn_opcodes_h_l1009_c21_5f7b_right,
BIN_OP_XOR_uxn_opcodes_h_l1009_c21_5f7b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1011_c11_1bd0
BIN_OP_EQ_uxn_opcodes_h_l1011_c11_1bd0 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1011_c11_1bd0_left,
BIN_OP_EQ_uxn_opcodes_h_l1011_c11_1bd0_right,
BIN_OP_EQ_uxn_opcodes_h_l1011_c11_1bd0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_96c9
result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_96c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_96c9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_96c9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_96c9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_96c9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_96c9
result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_96c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_96c9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_96c9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_96c9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_96c9_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l990_c6_c0db_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l990_c2_8c9f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l990_c2_8c9f_return_output,
 result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l990_c2_8c9f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l990_c2_8c9f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l990_c2_8c9f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l990_c2_8c9f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l990_c2_8c9f_return_output,
 t8_MUX_uxn_opcodes_h_l990_c2_8c9f_return_output,
 n8_MUX_uxn_opcodes_h_l990_c2_8c9f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l998_c11_c6d4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l998_c7_9725_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l998_c7_9725_return_output,
 result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l998_c7_9725_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l998_c7_9725_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l998_c7_9725_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l998_c7_9725_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l998_c7_9725_return_output,
 t8_MUX_uxn_opcodes_h_l998_c7_9725_return_output,
 n8_MUX_uxn_opcodes_h_l998_c7_9725_return_output,
 sp_relative_shift_uxn_opcodes_h_l1001_c30_a6bf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1003_c11_266c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_3dee_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_3dee_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1003_c7_3dee_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_3dee_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_3dee_return_output,
 t8_MUX_uxn_opcodes_h_l1003_c7_3dee_return_output,
 n8_MUX_uxn_opcodes_h_l1003_c7_3dee_return_output,
 CONST_SR_8_uxn_opcodes_h_l1005_c18_e9b5_return_output,
 BIN_OP_XOR_uxn_opcodes_h_l1009_c21_5f7b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1011_c11_1bd0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_96c9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_96c9_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l990_c6_c0db_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l990_c6_c0db_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l990_c6_c0db_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l990_c2_8c9f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l995_c3_7f24 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l990_c2_8c9f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l998_c7_9725_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l990_c2_8c9f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l990_c2_8c9f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l990_c2_8c9f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l990_c2_8c9f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l998_c7_9725_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l990_c2_8c9f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l990_c2_8c9f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l990_c2_8c9f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l990_c2_8c9f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l998_c7_9725_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l990_c2_8c9f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l990_c2_8c9f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l990_c2_8c9f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l990_c2_8c9f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l998_c7_9725_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l990_c2_8c9f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l990_c2_8c9f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l990_c2_8c9f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l990_c2_8c9f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l998_c7_9725_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l990_c2_8c9f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l990_c2_8c9f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l990_c2_8c9f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l990_c2_8c9f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l998_c7_9725_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l990_c2_8c9f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l990_c2_8c9f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l990_c2_8c9f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l990_c2_8c9f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l998_c7_9725_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l990_c2_8c9f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l990_c2_8c9f_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l990_c2_8c9f_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l990_c2_8c9f_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l998_c7_9725_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l990_c2_8c9f_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l990_c2_8c9f_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l990_c2_8c9f_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l990_c2_8c9f_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l998_c7_9725_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l990_c2_8c9f_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l990_c2_8c9f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l998_c11_c6d4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l998_c11_c6d4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l998_c11_c6d4_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l998_c7_9725_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l998_c7_9725_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_3dee_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l998_c7_9725_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l998_c7_9725_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l998_c7_9725_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_3dee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l998_c7_9725_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l998_c7_9725_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l998_c7_9725_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l998_c7_9725_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l998_c7_9725_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l998_c7_9725_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l998_c7_9725_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_3dee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l998_c7_9725_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l998_c7_9725_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l998_c7_9725_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1003_c7_3dee_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l998_c7_9725_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l998_c7_9725_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l998_c7_9725_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l998_c7_9725_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l998_c7_9725_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l998_c7_9725_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_3dee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l998_c7_9725_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l998_c7_9725_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l998_c7_9725_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1003_c7_3dee_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l998_c7_9725_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l998_c7_9725_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l998_c7_9725_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1003_c7_3dee_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l998_c7_9725_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1001_c30_a6bf_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1001_c30_a6bf_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1001_c30_a6bf_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1001_c30_a6bf_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_266c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_266c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_266c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_3dee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_3dee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_3dee_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_3dee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_3dee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_96c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_3dee_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1003_c7_3dee_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1003_c7_3dee_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1003_c7_3dee_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_3dee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_3dee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_96c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_3dee_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_3dee_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1008_c3_644a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_3dee_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_3dee_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1003_c7_3dee_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1003_c7_3dee_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1003_c7_3dee_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1003_c7_3dee_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1003_c7_3dee_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1003_c7_3dee_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1004_c8_3685_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1005_c18_e9b5_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1005_c18_e9b5_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1005_c8_9c11_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1009_c21_5f7b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1009_c21_5f7b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1009_c21_5f7b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_1bd0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_1bd0_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_1bd0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_96c9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_96c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_96c9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_96c9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_96c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_96c9_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1003_l990_DUPLICATE_ef56_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1003_l990_l998_DUPLICATE_8ec4_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l990_l998_DUPLICATE_dd5e_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l990_l1011_l998_DUPLICATE_d1e7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1003_l998_DUPLICATE_3208_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1003_l1011_l998_DUPLICATE_b0c1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9d9a_uxn_opcodes_h_l986_l1016_DUPLICATE_0fbc_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l990_c6_c0db_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_96c9_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l998_c7_9725_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_3dee_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l998_c11_c6d4_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1001_c30_a6bf_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1008_c3_644a := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_3dee_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1008_c3_644a;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l998_c7_9725_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1001_c30_a6bf_y := resize(to_signed(-1, 2), 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_3dee_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_1bd0_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_266c_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l995_c3_7f24 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l990_c2_8c9f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l995_c3_7f24;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l990_c2_8c9f_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l990_c2_8c9f_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_96c9_iftrue := to_unsigned(1, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1001_c30_a6bf_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l1003_c7_3dee_iffalse := n8;
     VAR_n8_MUX_uxn_opcodes_h_l990_c2_8c9f_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l998_c7_9725_iftrue := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_266c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_1bd0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l990_c6_c0db_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l998_c11_c6d4_left := VAR_phase;
     VAR_CONST_SR_8_uxn_opcodes_h_l1005_c18_e9b5_x := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1003_c7_3dee_iffalse := t8;
     VAR_t8_MUX_uxn_opcodes_h_l990_c2_8c9f_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l998_c7_9725_iftrue := t8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1003_l990_DUPLICATE_ef56 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1003_l990_DUPLICATE_ef56_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1003_l990_l998_DUPLICATE_8ec4 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1003_l990_l998_DUPLICATE_8ec4_return_output := result.u8_value;

     -- CONST_SR_8[uxn_opcodes_h_l1005_c18_e9b5] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1005_c18_e9b5_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1005_c18_e9b5_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1005_c18_e9b5_return_output := CONST_SR_8_uxn_opcodes_h_l1005_c18_e9b5_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1003_l1011_l998_DUPLICATE_b0c1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1003_l1011_l998_DUPLICATE_b0c1_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1003_l998_DUPLICATE_3208 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1003_l998_DUPLICATE_3208_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l998_c11_c6d4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l998_c11_c6d4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l998_c11_c6d4_left;
     BIN_OP_EQ_uxn_opcodes_h_l998_c11_c6d4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l998_c11_c6d4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l998_c11_c6d4_return_output := BIN_OP_EQ_uxn_opcodes_h_l998_c11_c6d4_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1001_c30_a6bf] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1001_c30_a6bf_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1001_c30_a6bf_ins;
     sp_relative_shift_uxn_opcodes_h_l1001_c30_a6bf_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1001_c30_a6bf_x;
     sp_relative_shift_uxn_opcodes_h_l1001_c30_a6bf_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1001_c30_a6bf_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1001_c30_a6bf_return_output := sp_relative_shift_uxn_opcodes_h_l1001_c30_a6bf_return_output;

     -- result_is_stack_operation_16bit_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d[uxn_opcodes_h_l998_c7_9725] LATENCY=0
     VAR_result_is_stack_operation_16bit_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l998_c7_9725_return_output := result.is_stack_operation_16bit;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l990_l998_DUPLICATE_dd5e LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l990_l998_DUPLICATE_dd5e_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l990_l1011_l998_DUPLICATE_d1e7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l990_l1011_l998_DUPLICATE_d1e7_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1003_c11_266c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1003_c11_266c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_266c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1003_c11_266c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_266c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_266c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1003_c11_266c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1011_c11_1bd0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1011_c11_1bd0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_1bd0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1011_c11_1bd0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_1bd0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_1bd0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1011_c11_1bd0_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1004_c8_3685] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1004_c8_3685_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l990_c6_c0db] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l990_c6_c0db_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l990_c6_c0db_left;
     BIN_OP_EQ_uxn_opcodes_h_l990_c6_c0db_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l990_c6_c0db_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l990_c6_c0db_return_output := BIN_OP_EQ_uxn_opcodes_h_l990_c6_c0db_return_output;

     -- Submodule level 1
     VAR_n8_MUX_uxn_opcodes_h_l1003_c7_3dee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_266c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_3dee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_266c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_3dee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_266c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_3dee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_266c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_3dee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_266c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1003_c7_3dee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_266c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1003_c7_3dee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_266c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_96c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_1bd0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_96c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_1bd0_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l990_c2_8c9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l990_c6_c0db_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l990_c2_8c9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l990_c6_c0db_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l990_c2_8c9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l990_c6_c0db_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l990_c2_8c9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l990_c6_c0db_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l990_c2_8c9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l990_c6_c0db_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l990_c2_8c9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l990_c6_c0db_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l990_c2_8c9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l990_c6_c0db_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l990_c2_8c9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l990_c6_c0db_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l990_c2_8c9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l990_c6_c0db_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l998_c7_9725_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l998_c11_c6d4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l998_c7_9725_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l998_c11_c6d4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l998_c7_9725_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l998_c11_c6d4_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l998_c7_9725_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l998_c11_c6d4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l998_c7_9725_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l998_c11_c6d4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l998_c7_9725_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l998_c11_c6d4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l998_c7_9725_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l998_c11_c6d4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l998_c7_9725_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l998_c11_c6d4_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l998_c7_9725_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l998_c11_c6d4_return_output;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1009_c21_5f7b_right := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1004_c8_3685_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1003_c7_3dee_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1004_c8_3685_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l990_c2_8c9f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l990_l998_DUPLICATE_dd5e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l998_c7_9725_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l990_l998_DUPLICATE_dd5e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_3dee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1003_l1011_l998_DUPLICATE_b0c1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_96c9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1003_l1011_l998_DUPLICATE_b0c1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l998_c7_9725_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1003_l1011_l998_DUPLICATE_b0c1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_3dee_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1003_l990_DUPLICATE_ef56_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l990_c2_8c9f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1003_l990_DUPLICATE_ef56_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_96c9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l990_l1011_l998_DUPLICATE_d1e7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l990_c2_8c9f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l990_l1011_l998_DUPLICATE_d1e7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l998_c7_9725_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l990_l1011_l998_DUPLICATE_d1e7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_3dee_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1003_l998_DUPLICATE_3208_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l998_c7_9725_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1003_l998_DUPLICATE_3208_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1003_c7_3dee_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1003_l990_l998_DUPLICATE_8ec4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l990_c2_8c9f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1003_l990_l998_DUPLICATE_8ec4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l998_c7_9725_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1003_l990_l998_DUPLICATE_8ec4_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l998_c7_9725_iffalse := VAR_result_is_stack_operation_16bit_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l998_c7_9725_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l998_c7_9725_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1001_c30_a6bf_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1011_c7_96c9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_96c9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_96c9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_96c9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_96c9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_96c9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_96c9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_96c9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_96c9_return_output;

     -- t8_MUX[uxn_opcodes_h_l1003_c7_3dee] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1003_c7_3dee_cond <= VAR_t8_MUX_uxn_opcodes_h_l1003_c7_3dee_cond;
     t8_MUX_uxn_opcodes_h_l1003_c7_3dee_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1003_c7_3dee_iftrue;
     t8_MUX_uxn_opcodes_h_l1003_c7_3dee_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1003_c7_3dee_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1003_c7_3dee_return_output := t8_MUX_uxn_opcodes_h_l1003_c7_3dee_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l998_c7_9725] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l998_c7_9725_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l998_c7_9725_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l998_c7_9725_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l998_c7_9725_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l998_c7_9725_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l998_c7_9725_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l998_c7_9725_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l998_c7_9725_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1005_c8_9c11] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1005_c8_9c11_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1005_c18_e9b5_return_output);

     -- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l998_c7_9725] LATENCY=0
     -- Inputs
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l998_c7_9725_cond <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l998_c7_9725_cond;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l998_c7_9725_iftrue <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l998_c7_9725_iftrue;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l998_c7_9725_iffalse <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l998_c7_9725_iffalse;
     -- Outputs
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l998_c7_9725_return_output := result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l998_c7_9725_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1003_c7_3dee] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_3dee_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_3dee_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_3dee_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_3dee_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_3dee_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_3dee_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_3dee_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_3dee_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1003_c7_3dee] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_3dee_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_3dee_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_3dee_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_3dee_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_3dee_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_3dee_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_3dee_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_3dee_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1011_c7_96c9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_96c9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_96c9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_96c9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_96c9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_96c9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_96c9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_96c9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_96c9_return_output;

     -- Submodule level 2
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1009_c21_5f7b_left := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1005_c8_9c11_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1003_c7_3dee_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1005_c8_9c11_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_3dee_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_96c9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l998_c7_9725_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_3dee_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l990_c2_8c9f_iffalse := VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l998_c7_9725_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_3dee_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_96c9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l990_c2_8c9f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l998_c7_9725_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l998_c7_9725_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_3dee_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l998_c7_9725_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1003_c7_3dee_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l990_c2_8c9f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l990_c2_8c9f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l990_c2_8c9f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l990_c2_8c9f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l990_c2_8c9f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l990_c2_8c9f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l990_c2_8c9f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l990_c2_8c9f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l990_c2_8c9f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1003_c7_3dee] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_3dee_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_3dee_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_3dee_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_3dee_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_3dee_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_3dee_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_3dee_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_3dee_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1003_c7_3dee] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_3dee_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_3dee_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_3dee_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_3dee_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_3dee_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_3dee_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_3dee_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_3dee_return_output;

     -- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l990_c2_8c9f] LATENCY=0
     -- Inputs
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l990_c2_8c9f_cond <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l990_c2_8c9f_cond;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l990_c2_8c9f_iftrue <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l990_c2_8c9f_iftrue;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l990_c2_8c9f_iffalse <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l990_c2_8c9f_iffalse;
     -- Outputs
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l990_c2_8c9f_return_output := result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l990_c2_8c9f_return_output;

     -- t8_MUX[uxn_opcodes_h_l998_c7_9725] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l998_c7_9725_cond <= VAR_t8_MUX_uxn_opcodes_h_l998_c7_9725_cond;
     t8_MUX_uxn_opcodes_h_l998_c7_9725_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l998_c7_9725_iftrue;
     t8_MUX_uxn_opcodes_h_l998_c7_9725_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l998_c7_9725_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l998_c7_9725_return_output := t8_MUX_uxn_opcodes_h_l998_c7_9725_return_output;

     -- n8_MUX[uxn_opcodes_h_l1003_c7_3dee] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1003_c7_3dee_cond <= VAR_n8_MUX_uxn_opcodes_h_l1003_c7_3dee_cond;
     n8_MUX_uxn_opcodes_h_l1003_c7_3dee_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1003_c7_3dee_iftrue;
     n8_MUX_uxn_opcodes_h_l1003_c7_3dee_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1003_c7_3dee_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1003_c7_3dee_return_output := n8_MUX_uxn_opcodes_h_l1003_c7_3dee_return_output;

     -- BIN_OP_XOR[uxn_opcodes_h_l1009_c21_5f7b] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_opcodes_h_l1009_c21_5f7b_left <= VAR_BIN_OP_XOR_uxn_opcodes_h_l1009_c21_5f7b_left;
     BIN_OP_XOR_uxn_opcodes_h_l1009_c21_5f7b_right <= VAR_BIN_OP_XOR_uxn_opcodes_h_l1009_c21_5f7b_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1009_c21_5f7b_return_output := BIN_OP_XOR_uxn_opcodes_h_l1009_c21_5f7b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l998_c7_9725] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l998_c7_9725_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l998_c7_9725_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l998_c7_9725_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l998_c7_9725_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l998_c7_9725_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l998_c7_9725_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l998_c7_9725_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l998_c7_9725_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l998_c7_9725] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l998_c7_9725_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l998_c7_9725_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l998_c7_9725_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l998_c7_9725_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l998_c7_9725_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l998_c7_9725_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l998_c7_9725_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l998_c7_9725_return_output;

     -- Submodule level 3
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1003_c7_3dee_iftrue := VAR_BIN_OP_XOR_uxn_opcodes_h_l1009_c21_5f7b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l998_c7_9725_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1003_c7_3dee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l998_c7_9725_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_3dee_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l990_c2_8c9f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l998_c7_9725_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l998_c7_9725_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_3dee_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l990_c2_8c9f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l998_c7_9725_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l990_c2_8c9f_iffalse := VAR_t8_MUX_uxn_opcodes_h_l998_c7_9725_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l990_c2_8c9f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l990_c2_8c9f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l990_c2_8c9f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l990_c2_8c9f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l990_c2_8c9f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l990_c2_8c9f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l990_c2_8c9f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l990_c2_8c9f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l990_c2_8c9f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l998_c7_9725] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l998_c7_9725_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l998_c7_9725_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l998_c7_9725_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l998_c7_9725_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l998_c7_9725_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l998_c7_9725_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l998_c7_9725_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l998_c7_9725_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l990_c2_8c9f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l990_c2_8c9f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l990_c2_8c9f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l990_c2_8c9f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l990_c2_8c9f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l990_c2_8c9f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l990_c2_8c9f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l990_c2_8c9f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l990_c2_8c9f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1003_c7_3dee] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1003_c7_3dee_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1003_c7_3dee_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1003_c7_3dee_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1003_c7_3dee_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1003_c7_3dee_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1003_c7_3dee_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1003_c7_3dee_return_output := result_u8_value_MUX_uxn_opcodes_h_l1003_c7_3dee_return_output;

     -- n8_MUX[uxn_opcodes_h_l998_c7_9725] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l998_c7_9725_cond <= VAR_n8_MUX_uxn_opcodes_h_l998_c7_9725_cond;
     n8_MUX_uxn_opcodes_h_l998_c7_9725_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l998_c7_9725_iftrue;
     n8_MUX_uxn_opcodes_h_l998_c7_9725_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l998_c7_9725_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l998_c7_9725_return_output := n8_MUX_uxn_opcodes_h_l998_c7_9725_return_output;

     -- t8_MUX[uxn_opcodes_h_l990_c2_8c9f] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l990_c2_8c9f_cond <= VAR_t8_MUX_uxn_opcodes_h_l990_c2_8c9f_cond;
     t8_MUX_uxn_opcodes_h_l990_c2_8c9f_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l990_c2_8c9f_iftrue;
     t8_MUX_uxn_opcodes_h_l990_c2_8c9f_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l990_c2_8c9f_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l990_c2_8c9f_return_output := t8_MUX_uxn_opcodes_h_l990_c2_8c9f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l998_c7_9725] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l998_c7_9725_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l998_c7_9725_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l998_c7_9725_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l998_c7_9725_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l998_c7_9725_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l998_c7_9725_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l998_c7_9725_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l998_c7_9725_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l990_c2_8c9f_iffalse := VAR_n8_MUX_uxn_opcodes_h_l998_c7_9725_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l990_c2_8c9f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l998_c7_9725_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l990_c2_8c9f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l998_c7_9725_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l998_c7_9725_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1003_c7_3dee_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l990_c2_8c9f_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l990_c2_8c9f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l990_c2_8c9f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l990_c2_8c9f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l990_c2_8c9f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l990_c2_8c9f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l990_c2_8c9f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l990_c2_8c9f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l990_c2_8c9f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l990_c2_8c9f_return_output;

     -- n8_MUX[uxn_opcodes_h_l990_c2_8c9f] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l990_c2_8c9f_cond <= VAR_n8_MUX_uxn_opcodes_h_l990_c2_8c9f_cond;
     n8_MUX_uxn_opcodes_h_l990_c2_8c9f_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l990_c2_8c9f_iftrue;
     n8_MUX_uxn_opcodes_h_l990_c2_8c9f_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l990_c2_8c9f_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l990_c2_8c9f_return_output := n8_MUX_uxn_opcodes_h_l990_c2_8c9f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l998_c7_9725] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l998_c7_9725_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l998_c7_9725_cond;
     result_u8_value_MUX_uxn_opcodes_h_l998_c7_9725_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l998_c7_9725_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l998_c7_9725_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l998_c7_9725_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l998_c7_9725_return_output := result_u8_value_MUX_uxn_opcodes_h_l998_c7_9725_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l990_c2_8c9f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l990_c2_8c9f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l990_c2_8c9f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l990_c2_8c9f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l990_c2_8c9f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l990_c2_8c9f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l990_c2_8c9f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l990_c2_8c9f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l990_c2_8c9f_return_output;

     -- Submodule level 5
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l990_c2_8c9f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l990_c2_8c9f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l998_c7_9725_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l990_c2_8c9f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l990_c2_8c9f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l990_c2_8c9f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l990_c2_8c9f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l990_c2_8c9f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l990_c2_8c9f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l990_c2_8c9f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l990_c2_8c9f_return_output := result_u8_value_MUX_uxn_opcodes_h_l990_c2_8c9f_return_output;

     -- Submodule level 6
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_9d9a_uxn_opcodes_h_l986_l1016_DUPLICATE_0fbc LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9d9a_uxn_opcodes_h_l986_l1016_DUPLICATE_0fbc_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_9d9a(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l990_c2_8c9f_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l990_c2_8c9f_return_output,
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l990_c2_8c9f_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l990_c2_8c9f_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l990_c2_8c9f_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l990_c2_8c9f_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l990_c2_8c9f_return_output);

     -- Submodule level 7
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9d9a_uxn_opcodes_h_l986_l1016_DUPLICATE_0fbc_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9d9a_uxn_opcodes_h_l986_l1016_DUPLICATE_0fbc_return_output;
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
