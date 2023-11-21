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
-- Submodules: 38
entity equ_0CLK_0d289325 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(15 downto 0);
 return_output : out opcode_result_t);
end equ_0CLK_0d289325;
architecture arch of equ_0CLK_0d289325 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1060_c6_9964]
signal BIN_OP_EQ_uxn_opcodes_h_l1060_c6_9964_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1060_c6_9964_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1060_c6_9964_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1060_c2_920b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c2_920b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c2_920b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c2_920b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c2_920b_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1060_c2_920b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c2_920b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c2_920b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c2_920b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c2_920b_return_output : unsigned(0 downto 0);

-- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l1060_c2_920b]
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1060_c2_920b_cond : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1060_c2_920b_iftrue : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1060_c2_920b_iffalse : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1060_c2_920b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1060_c2_920b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1060_c2_920b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1060_c2_920b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1060_c2_920b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1060_c2_920b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1060_c2_920b]
signal result_u8_value_MUX_uxn_opcodes_h_l1060_c2_920b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1060_c2_920b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1060_c2_920b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1060_c2_920b_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1060_c2_920b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c2_920b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c2_920b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c2_920b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c2_920b_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1060_c2_920b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1060_c2_920b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1060_c2_920b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1060_c2_920b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1060_c2_920b_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1060_c2_920b]
signal t8_MUX_uxn_opcodes_h_l1060_c2_920b_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1060_c2_920b_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1060_c2_920b_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1060_c2_920b_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1060_c2_920b]
signal n8_MUX_uxn_opcodes_h_l1060_c2_920b_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1060_c2_920b_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1060_c2_920b_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1060_c2_920b_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1068_c11_f10b]
signal BIN_OP_EQ_uxn_opcodes_h_l1068_c11_f10b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1068_c11_f10b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1068_c11_f10b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1068_c7_8e49]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1068_c7_8e49_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1068_c7_8e49_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1068_c7_8e49_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1068_c7_8e49_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1068_c7_8e49]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1068_c7_8e49_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1068_c7_8e49_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1068_c7_8e49_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1068_c7_8e49_return_output : unsigned(0 downto 0);

-- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l1068_c7_8e49]
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1068_c7_8e49_cond : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1068_c7_8e49_iftrue : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1068_c7_8e49_iffalse : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1068_c7_8e49_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1068_c7_8e49]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1068_c7_8e49_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1068_c7_8e49_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1068_c7_8e49_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1068_c7_8e49_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1068_c7_8e49]
signal result_u8_value_MUX_uxn_opcodes_h_l1068_c7_8e49_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1068_c7_8e49_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1068_c7_8e49_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1068_c7_8e49_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1068_c7_8e49]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1068_c7_8e49_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1068_c7_8e49_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1068_c7_8e49_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1068_c7_8e49_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1068_c7_8e49]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1068_c7_8e49_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1068_c7_8e49_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1068_c7_8e49_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1068_c7_8e49_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1068_c7_8e49]
signal t8_MUX_uxn_opcodes_h_l1068_c7_8e49_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1068_c7_8e49_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1068_c7_8e49_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1068_c7_8e49_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1068_c7_8e49]
signal n8_MUX_uxn_opcodes_h_l1068_c7_8e49_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1068_c7_8e49_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1068_c7_8e49_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1068_c7_8e49_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1071_c30_a8e4]
signal sp_relative_shift_uxn_opcodes_h_l1071_c30_a8e4_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1071_c30_a8e4_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1071_c30_a8e4_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1071_c30_a8e4_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1073_c11_644e]
signal BIN_OP_EQ_uxn_opcodes_h_l1073_c11_644e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1073_c11_644e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1073_c11_644e_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1073_c7_ca7b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1073_c7_ca7b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1073_c7_ca7b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1073_c7_ca7b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1073_c7_ca7b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1073_c7_ca7b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_ca7b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_ca7b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_ca7b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_ca7b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1073_c7_ca7b]
signal result_u8_value_MUX_uxn_opcodes_h_l1073_c7_ca7b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1073_c7_ca7b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1073_c7_ca7b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1073_c7_ca7b_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1073_c7_ca7b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_ca7b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_ca7b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_ca7b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_ca7b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1073_c7_ca7b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_ca7b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_ca7b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_ca7b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_ca7b_return_output : unsigned(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l1073_c7_ca7b]
signal t8_MUX_uxn_opcodes_h_l1073_c7_ca7b_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1073_c7_ca7b_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1073_c7_ca7b_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1073_c7_ca7b_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1073_c7_ca7b]
signal n8_MUX_uxn_opcodes_h_l1073_c7_ca7b_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1073_c7_ca7b_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1073_c7_ca7b_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1073_c7_ca7b_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1075_c18_f56f]
signal CONST_SR_8_uxn_opcodes_h_l1075_c18_f56f_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1075_c18_f56f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1079_c21_98d0]
signal BIN_OP_EQ_uxn_opcodes_h_l1079_c21_98d0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1079_c21_98d0_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1079_c21_98d0_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1079_c21_375d]
signal MUX_uxn_opcodes_h_l1079_c21_375d_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1079_c21_375d_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1079_c21_375d_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1079_c21_375d_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1081_c11_2d13]
signal BIN_OP_EQ_uxn_opcodes_h_l1081_c11_2d13_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1081_c11_2d13_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1081_c11_2d13_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1081_c7_3aba]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_3aba_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_3aba_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_3aba_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_3aba_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1081_c7_3aba]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_3aba_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_3aba_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_3aba_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_3aba_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l1060_c6_9964
BIN_OP_EQ_uxn_opcodes_h_l1060_c6_9964 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1060_c6_9964_left,
BIN_OP_EQ_uxn_opcodes_h_l1060_c6_9964_right,
BIN_OP_EQ_uxn_opcodes_h_l1060_c6_9964_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c2_920b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c2_920b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c2_920b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c2_920b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c2_920b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c2_920b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c2_920b
result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c2_920b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c2_920b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c2_920b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c2_920b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c2_920b_return_output);

-- result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1060_c2_920b
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1060_c2_920b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1060_c2_920b_cond,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1060_c2_920b_iftrue,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1060_c2_920b_iffalse,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1060_c2_920b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1060_c2_920b
result_is_opc_done_MUX_uxn_opcodes_h_l1060_c2_920b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1060_c2_920b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1060_c2_920b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1060_c2_920b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1060_c2_920b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1060_c2_920b
result_u8_value_MUX_uxn_opcodes_h_l1060_c2_920b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1060_c2_920b_cond,
result_u8_value_MUX_uxn_opcodes_h_l1060_c2_920b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1060_c2_920b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1060_c2_920b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c2_920b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c2_920b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c2_920b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c2_920b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c2_920b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c2_920b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1060_c2_920b
result_is_stack_write_MUX_uxn_opcodes_h_l1060_c2_920b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1060_c2_920b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1060_c2_920b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1060_c2_920b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1060_c2_920b_return_output);

-- t8_MUX_uxn_opcodes_h_l1060_c2_920b
t8_MUX_uxn_opcodes_h_l1060_c2_920b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1060_c2_920b_cond,
t8_MUX_uxn_opcodes_h_l1060_c2_920b_iftrue,
t8_MUX_uxn_opcodes_h_l1060_c2_920b_iffalse,
t8_MUX_uxn_opcodes_h_l1060_c2_920b_return_output);

-- n8_MUX_uxn_opcodes_h_l1060_c2_920b
n8_MUX_uxn_opcodes_h_l1060_c2_920b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1060_c2_920b_cond,
n8_MUX_uxn_opcodes_h_l1060_c2_920b_iftrue,
n8_MUX_uxn_opcodes_h_l1060_c2_920b_iffalse,
n8_MUX_uxn_opcodes_h_l1060_c2_920b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1068_c11_f10b
BIN_OP_EQ_uxn_opcodes_h_l1068_c11_f10b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1068_c11_f10b_left,
BIN_OP_EQ_uxn_opcodes_h_l1068_c11_f10b_right,
BIN_OP_EQ_uxn_opcodes_h_l1068_c11_f10b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1068_c7_8e49
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1068_c7_8e49 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1068_c7_8e49_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1068_c7_8e49_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1068_c7_8e49_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1068_c7_8e49_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1068_c7_8e49
result_is_sp_shift_MUX_uxn_opcodes_h_l1068_c7_8e49 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1068_c7_8e49_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1068_c7_8e49_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1068_c7_8e49_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1068_c7_8e49_return_output);

-- result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1068_c7_8e49
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1068_c7_8e49 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1068_c7_8e49_cond,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1068_c7_8e49_iftrue,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1068_c7_8e49_iffalse,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1068_c7_8e49_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1068_c7_8e49
result_is_opc_done_MUX_uxn_opcodes_h_l1068_c7_8e49 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1068_c7_8e49_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1068_c7_8e49_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1068_c7_8e49_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1068_c7_8e49_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1068_c7_8e49
result_u8_value_MUX_uxn_opcodes_h_l1068_c7_8e49 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1068_c7_8e49_cond,
result_u8_value_MUX_uxn_opcodes_h_l1068_c7_8e49_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1068_c7_8e49_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1068_c7_8e49_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1068_c7_8e49
result_sp_relative_shift_MUX_uxn_opcodes_h_l1068_c7_8e49 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1068_c7_8e49_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1068_c7_8e49_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1068_c7_8e49_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1068_c7_8e49_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1068_c7_8e49
result_is_stack_write_MUX_uxn_opcodes_h_l1068_c7_8e49 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1068_c7_8e49_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1068_c7_8e49_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1068_c7_8e49_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1068_c7_8e49_return_output);

-- t8_MUX_uxn_opcodes_h_l1068_c7_8e49
t8_MUX_uxn_opcodes_h_l1068_c7_8e49 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1068_c7_8e49_cond,
t8_MUX_uxn_opcodes_h_l1068_c7_8e49_iftrue,
t8_MUX_uxn_opcodes_h_l1068_c7_8e49_iffalse,
t8_MUX_uxn_opcodes_h_l1068_c7_8e49_return_output);

-- n8_MUX_uxn_opcodes_h_l1068_c7_8e49
n8_MUX_uxn_opcodes_h_l1068_c7_8e49 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1068_c7_8e49_cond,
n8_MUX_uxn_opcodes_h_l1068_c7_8e49_iftrue,
n8_MUX_uxn_opcodes_h_l1068_c7_8e49_iffalse,
n8_MUX_uxn_opcodes_h_l1068_c7_8e49_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1071_c30_a8e4
sp_relative_shift_uxn_opcodes_h_l1071_c30_a8e4 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1071_c30_a8e4_ins,
sp_relative_shift_uxn_opcodes_h_l1071_c30_a8e4_x,
sp_relative_shift_uxn_opcodes_h_l1071_c30_a8e4_y,
sp_relative_shift_uxn_opcodes_h_l1071_c30_a8e4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1073_c11_644e
BIN_OP_EQ_uxn_opcodes_h_l1073_c11_644e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1073_c11_644e_left,
BIN_OP_EQ_uxn_opcodes_h_l1073_c11_644e_right,
BIN_OP_EQ_uxn_opcodes_h_l1073_c11_644e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1073_c7_ca7b
result_is_sp_shift_MUX_uxn_opcodes_h_l1073_c7_ca7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1073_c7_ca7b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1073_c7_ca7b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1073_c7_ca7b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1073_c7_ca7b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_ca7b
result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_ca7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_ca7b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_ca7b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_ca7b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_ca7b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1073_c7_ca7b
result_u8_value_MUX_uxn_opcodes_h_l1073_c7_ca7b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1073_c7_ca7b_cond,
result_u8_value_MUX_uxn_opcodes_h_l1073_c7_ca7b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1073_c7_ca7b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1073_c7_ca7b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_ca7b
result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_ca7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_ca7b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_ca7b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_ca7b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_ca7b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_ca7b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_ca7b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_ca7b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_ca7b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_ca7b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_ca7b_return_output);

-- t8_MUX_uxn_opcodes_h_l1073_c7_ca7b
t8_MUX_uxn_opcodes_h_l1073_c7_ca7b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1073_c7_ca7b_cond,
t8_MUX_uxn_opcodes_h_l1073_c7_ca7b_iftrue,
t8_MUX_uxn_opcodes_h_l1073_c7_ca7b_iffalse,
t8_MUX_uxn_opcodes_h_l1073_c7_ca7b_return_output);

-- n8_MUX_uxn_opcodes_h_l1073_c7_ca7b
n8_MUX_uxn_opcodes_h_l1073_c7_ca7b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1073_c7_ca7b_cond,
n8_MUX_uxn_opcodes_h_l1073_c7_ca7b_iftrue,
n8_MUX_uxn_opcodes_h_l1073_c7_ca7b_iffalse,
n8_MUX_uxn_opcodes_h_l1073_c7_ca7b_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1075_c18_f56f
CONST_SR_8_uxn_opcodes_h_l1075_c18_f56f : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1075_c18_f56f_x,
CONST_SR_8_uxn_opcodes_h_l1075_c18_f56f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1079_c21_98d0
BIN_OP_EQ_uxn_opcodes_h_l1079_c21_98d0 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1079_c21_98d0_left,
BIN_OP_EQ_uxn_opcodes_h_l1079_c21_98d0_right,
BIN_OP_EQ_uxn_opcodes_h_l1079_c21_98d0_return_output);

-- MUX_uxn_opcodes_h_l1079_c21_375d
MUX_uxn_opcodes_h_l1079_c21_375d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1079_c21_375d_cond,
MUX_uxn_opcodes_h_l1079_c21_375d_iftrue,
MUX_uxn_opcodes_h_l1079_c21_375d_iffalse,
MUX_uxn_opcodes_h_l1079_c21_375d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1081_c11_2d13
BIN_OP_EQ_uxn_opcodes_h_l1081_c11_2d13 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1081_c11_2d13_left,
BIN_OP_EQ_uxn_opcodes_h_l1081_c11_2d13_right,
BIN_OP_EQ_uxn_opcodes_h_l1081_c11_2d13_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_3aba
result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_3aba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_3aba_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_3aba_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_3aba_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_3aba_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_3aba
result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_3aba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_3aba_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_3aba_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_3aba_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_3aba_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1060_c6_9964_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c2_920b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c2_920b_return_output,
 result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1060_c2_920b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1060_c2_920b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1060_c2_920b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c2_920b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1060_c2_920b_return_output,
 t8_MUX_uxn_opcodes_h_l1060_c2_920b_return_output,
 n8_MUX_uxn_opcodes_h_l1060_c2_920b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1068_c11_f10b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1068_c7_8e49_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1068_c7_8e49_return_output,
 result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1068_c7_8e49_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1068_c7_8e49_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1068_c7_8e49_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1068_c7_8e49_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1068_c7_8e49_return_output,
 t8_MUX_uxn_opcodes_h_l1068_c7_8e49_return_output,
 n8_MUX_uxn_opcodes_h_l1068_c7_8e49_return_output,
 sp_relative_shift_uxn_opcodes_h_l1071_c30_a8e4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1073_c11_644e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1073_c7_ca7b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_ca7b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1073_c7_ca7b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_ca7b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_ca7b_return_output,
 t8_MUX_uxn_opcodes_h_l1073_c7_ca7b_return_output,
 n8_MUX_uxn_opcodes_h_l1073_c7_ca7b_return_output,
 CONST_SR_8_uxn_opcodes_h_l1075_c18_f56f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1079_c21_98d0_return_output,
 MUX_uxn_opcodes_h_l1079_c21_375d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1081_c11_2d13_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_3aba_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_3aba_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c6_9964_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c6_9964_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c6_9964_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c2_920b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1065_c3_549b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c2_920b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1068_c7_8e49_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c2_920b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c2_920b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c2_920b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c2_920b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1068_c7_8e49_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c2_920b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c2_920b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1060_c2_920b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1060_c2_920b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1068_c7_8e49_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1060_c2_920b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1060_c2_920b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1060_c2_920b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1060_c2_920b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1068_c7_8e49_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1060_c2_920b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1060_c2_920b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1060_c2_920b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1060_c2_920b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1068_c7_8e49_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1060_c2_920b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1060_c2_920b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c2_920b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c2_920b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1068_c7_8e49_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c2_920b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c2_920b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1060_c2_920b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1060_c2_920b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1068_c7_8e49_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1060_c2_920b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1060_c2_920b_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1060_c2_920b_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1060_c2_920b_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1068_c7_8e49_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1060_c2_920b_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1060_c2_920b_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1060_c2_920b_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1060_c2_920b_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1068_c7_8e49_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1060_c2_920b_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1060_c2_920b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_f10b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_f10b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_f10b_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1068_c7_8e49_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1068_c7_8e49_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_ca7b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1068_c7_8e49_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1068_c7_8e49_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1068_c7_8e49_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1073_c7_ca7b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1068_c7_8e49_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1068_c7_8e49_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1068_c7_8e49_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l1068_c7_8e49_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1068_c7_8e49_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1068_c7_8e49_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1068_c7_8e49_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_ca7b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1068_c7_8e49_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1068_c7_8e49_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1068_c7_8e49_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1073_c7_ca7b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1068_c7_8e49_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1068_c7_8e49_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1068_c7_8e49_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1068_c7_8e49_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1068_c7_8e49_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1068_c7_8e49_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_ca7b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1068_c7_8e49_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1068_c7_8e49_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1068_c7_8e49_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1073_c7_ca7b_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1068_c7_8e49_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1068_c7_8e49_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1068_c7_8e49_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1073_c7_ca7b_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1068_c7_8e49_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1071_c30_a8e4_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1071_c30_a8e4_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1071_c30_a8e4_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1071_c30_a8e4_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1073_c11_644e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1073_c11_644e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1073_c11_644e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1073_c7_ca7b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1073_c7_ca7b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1073_c7_ca7b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_ca7b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_ca7b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_3aba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_ca7b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1073_c7_ca7b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1073_c7_ca7b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1073_c7_ca7b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_ca7b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_ca7b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_3aba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_ca7b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_ca7b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1078_c3_07ee : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_ca7b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_ca7b_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1073_c7_ca7b_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1073_c7_ca7b_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1073_c7_ca7b_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1073_c7_ca7b_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1073_c7_ca7b_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1073_c7_ca7b_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1074_c8_316e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1075_c18_f56f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1075_c18_f56f_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1075_c8_bd22_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1079_c21_375d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c21_98d0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c21_98d0_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c21_98d0_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1079_c21_375d_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1079_c21_375d_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1079_c21_375d_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1081_c11_2d13_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1081_c11_2d13_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1081_c11_2d13_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_3aba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_3aba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_3aba_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_3aba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_3aba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_3aba_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1060_l1073_DUPLICATE_11ab_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1060_l1068_l1073_DUPLICATE_0b97_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1060_l1068_DUPLICATE_56f8_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1060_l1081_l1068_DUPLICATE_5a61_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1068_l1073_DUPLICATE_2ee4_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1081_l1068_l1073_DUPLICATE_b1e3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9d9a_uxn_opcodes_h_l1086_l1056_DUPLICATE_fc5b_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_3aba_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_f10b_right := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1073_c7_ca7b_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1071_c30_a8e4_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1068_c7_8e49_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1079_c21_375d_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1065_c3_549b := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c2_920b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1065_c3_549b;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1068_c7_8e49_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1079_c21_375d_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1060_c2_920b_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1071_c30_a8e4_y := resize(to_signed(-1, 2), 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_3aba_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c6_9964_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1078_c3_07ee := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_ca7b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1078_c3_07ee;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1073_c11_644e_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1060_c2_920b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1081_c11_2d13_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_ca7b_iftrue := to_unsigned(1, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1071_c30_a8e4_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l1060_c2_920b_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1068_c7_8e49_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1073_c7_ca7b_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c6_9964_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_f10b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1073_c11_644e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1081_c11_2d13_left := VAR_phase;
     VAR_CONST_SR_8_uxn_opcodes_h_l1075_c18_f56f_x := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1060_c2_920b_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1068_c7_8e49_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1073_c7_ca7b_iffalse := t8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1081_l1068_l1073_DUPLICATE_b1e3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1081_l1068_l1073_DUPLICATE_b1e3_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1068_c11_f10b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1068_c11_f10b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_f10b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1068_c11_f10b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_f10b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_f10b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1068_c11_f10b_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1075_c18_f56f] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1075_c18_f56f_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1075_c18_f56f_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1075_c18_f56f_return_output := CONST_SR_8_uxn_opcodes_h_l1075_c18_f56f_return_output;

     -- result_is_stack_operation_16bit_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d[uxn_opcodes_h_l1068_c7_8e49] LATENCY=0
     VAR_result_is_stack_operation_16bit_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l1068_c7_8e49_return_output := result.is_stack_operation_16bit;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1074_c8_316e] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1074_c8_316e_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1081_c11_2d13] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1081_c11_2d13_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1081_c11_2d13_left;
     BIN_OP_EQ_uxn_opcodes_h_l1081_c11_2d13_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1081_c11_2d13_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1081_c11_2d13_return_output := BIN_OP_EQ_uxn_opcodes_h_l1081_c11_2d13_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1068_l1073_DUPLICATE_2ee4 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1068_l1073_DUPLICATE_2ee4_return_output := result.stack_address_sp_offset;

     -- sp_relative_shift[uxn_opcodes_h_l1071_c30_a8e4] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1071_c30_a8e4_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1071_c30_a8e4_ins;
     sp_relative_shift_uxn_opcodes_h_l1071_c30_a8e4_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1071_c30_a8e4_x;
     sp_relative_shift_uxn_opcodes_h_l1071_c30_a8e4_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1071_c30_a8e4_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1071_c30_a8e4_return_output := sp_relative_shift_uxn_opcodes_h_l1071_c30_a8e4_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1060_l1068_DUPLICATE_56f8 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1060_l1068_DUPLICATE_56f8_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1060_l1073_DUPLICATE_11ab LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1060_l1073_DUPLICATE_11ab_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1060_l1068_l1073_DUPLICATE_0b97 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1060_l1068_l1073_DUPLICATE_0b97_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1060_l1081_l1068_DUPLICATE_5a61 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1060_l1081_l1068_DUPLICATE_5a61_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1073_c11_644e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1073_c11_644e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1073_c11_644e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1073_c11_644e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1073_c11_644e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1073_c11_644e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1073_c11_644e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1060_c6_9964] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1060_c6_9964_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c6_9964_left;
     BIN_OP_EQ_uxn_opcodes_h_l1060_c6_9964_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c6_9964_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c6_9964_return_output := BIN_OP_EQ_uxn_opcodes_h_l1060_c6_9964_return_output;

     -- Submodule level 1
     VAR_n8_MUX_uxn_opcodes_h_l1060_c2_920b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c6_9964_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1060_c2_920b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c6_9964_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c2_920b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c6_9964_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1060_c2_920b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c6_9964_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1060_c2_920b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c6_9964_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c2_920b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c6_9964_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c2_920b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c6_9964_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1060_c2_920b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c6_9964_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1060_c2_920b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c6_9964_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1068_c7_8e49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_f10b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1068_c7_8e49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_f10b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1068_c7_8e49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_f10b_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1068_c7_8e49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_f10b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1068_c7_8e49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_f10b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1068_c7_8e49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_f10b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1068_c7_8e49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_f10b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1068_c7_8e49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_f10b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1068_c7_8e49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_f10b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1073_c7_ca7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1073_c11_644e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_ca7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1073_c11_644e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1073_c7_ca7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1073_c11_644e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_ca7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1073_c11_644e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_ca7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1073_c11_644e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1073_c7_ca7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1073_c11_644e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1073_c7_ca7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1073_c11_644e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_3aba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1081_c11_2d13_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_3aba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1081_c11_2d13_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c21_98d0_right := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1074_c8_316e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1073_c7_ca7b_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1074_c8_316e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c2_920b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1060_l1068_DUPLICATE_56f8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1068_c7_8e49_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1060_l1068_DUPLICATE_56f8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1068_c7_8e49_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1081_l1068_l1073_DUPLICATE_b1e3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_ca7b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1081_l1068_l1073_DUPLICATE_b1e3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_3aba_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1081_l1068_l1073_DUPLICATE_b1e3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c2_920b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1060_l1073_DUPLICATE_11ab_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1073_c7_ca7b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1060_l1073_DUPLICATE_11ab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1060_c2_920b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1060_l1081_l1068_DUPLICATE_5a61_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1068_c7_8e49_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1060_l1081_l1068_DUPLICATE_5a61_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_3aba_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1060_l1081_l1068_DUPLICATE_5a61_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1068_c7_8e49_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1068_l1073_DUPLICATE_2ee4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_ca7b_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1068_l1073_DUPLICATE_2ee4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1060_c2_920b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1060_l1068_l1073_DUPLICATE_0b97_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1068_c7_8e49_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1060_l1068_l1073_DUPLICATE_0b97_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1073_c7_ca7b_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1060_l1068_l1073_DUPLICATE_0b97_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1068_c7_8e49_iffalse := VAR_result_is_stack_operation_16bit_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l1068_c7_8e49_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1068_c7_8e49_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1071_c30_a8e4_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1073_c7_ca7b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1073_c7_ca7b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1073_c7_ca7b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1073_c7_ca7b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1073_c7_ca7b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1073_c7_ca7b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1073_c7_ca7b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1073_c7_ca7b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1073_c7_ca7b_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1075_c8_bd22] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1075_c8_bd22_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1075_c18_f56f_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1073_c7_ca7b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_ca7b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_ca7b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_ca7b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_ca7b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_ca7b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_ca7b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_ca7b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_ca7b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1081_c7_3aba] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_3aba_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_3aba_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_3aba_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_3aba_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_3aba_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_3aba_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_3aba_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_3aba_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1081_c7_3aba] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_3aba_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_3aba_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_3aba_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_3aba_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_3aba_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_3aba_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_3aba_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_3aba_return_output;

     -- t8_MUX[uxn_opcodes_h_l1073_c7_ca7b] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1073_c7_ca7b_cond <= VAR_t8_MUX_uxn_opcodes_h_l1073_c7_ca7b_cond;
     t8_MUX_uxn_opcodes_h_l1073_c7_ca7b_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1073_c7_ca7b_iftrue;
     t8_MUX_uxn_opcodes_h_l1073_c7_ca7b_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1073_c7_ca7b_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1073_c7_ca7b_return_output := t8_MUX_uxn_opcodes_h_l1073_c7_ca7b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1068_c7_8e49] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1068_c7_8e49_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1068_c7_8e49_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1068_c7_8e49_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1068_c7_8e49_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1068_c7_8e49_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1068_c7_8e49_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1068_c7_8e49_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1068_c7_8e49_return_output;

     -- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l1068_c7_8e49] LATENCY=0
     -- Inputs
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1068_c7_8e49_cond <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1068_c7_8e49_cond;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1068_c7_8e49_iftrue <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1068_c7_8e49_iftrue;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1068_c7_8e49_iffalse <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1068_c7_8e49_iffalse;
     -- Outputs
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1068_c7_8e49_return_output := result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1068_c7_8e49_return_output;

     -- Submodule level 2
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c21_98d0_left := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1075_c8_bd22_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1073_c7_ca7b_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1075_c8_bd22_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_ca7b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_3aba_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1068_c7_8e49_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1073_c7_ca7b_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1060_c2_920b_iffalse := VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1068_c7_8e49_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_ca7b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_3aba_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c2_920b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1068_c7_8e49_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1068_c7_8e49_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_ca7b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1068_c7_8e49_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1073_c7_ca7b_return_output;
     -- n8_MUX[uxn_opcodes_h_l1073_c7_ca7b] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1073_c7_ca7b_cond <= VAR_n8_MUX_uxn_opcodes_h_l1073_c7_ca7b_cond;
     n8_MUX_uxn_opcodes_h_l1073_c7_ca7b_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1073_c7_ca7b_iftrue;
     n8_MUX_uxn_opcodes_h_l1073_c7_ca7b_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1073_c7_ca7b_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1073_c7_ca7b_return_output := n8_MUX_uxn_opcodes_h_l1073_c7_ca7b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1079_c21_98d0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1079_c21_98d0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c21_98d0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1079_c21_98d0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c21_98d0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c21_98d0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1079_c21_98d0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1068_c7_8e49] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1068_c7_8e49_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1068_c7_8e49_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1068_c7_8e49_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1068_c7_8e49_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1068_c7_8e49_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1068_c7_8e49_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1068_c7_8e49_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1068_c7_8e49_return_output;

     -- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l1060_c2_920b] LATENCY=0
     -- Inputs
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1060_c2_920b_cond <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1060_c2_920b_cond;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1060_c2_920b_iftrue <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1060_c2_920b_iftrue;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1060_c2_920b_iffalse <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1060_c2_920b_iffalse;
     -- Outputs
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1060_c2_920b_return_output := result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1060_c2_920b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1073_c7_ca7b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_ca7b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_ca7b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_ca7b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_ca7b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_ca7b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_ca7b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_ca7b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_ca7b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1068_c7_8e49] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1068_c7_8e49_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1068_c7_8e49_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1068_c7_8e49_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1068_c7_8e49_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1068_c7_8e49_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1068_c7_8e49_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1068_c7_8e49_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1068_c7_8e49_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1060_c2_920b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c2_920b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c2_920b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c2_920b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c2_920b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c2_920b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c2_920b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c2_920b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c2_920b_return_output;

     -- t8_MUX[uxn_opcodes_h_l1068_c7_8e49] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1068_c7_8e49_cond <= VAR_t8_MUX_uxn_opcodes_h_l1068_c7_8e49_cond;
     t8_MUX_uxn_opcodes_h_l1068_c7_8e49_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1068_c7_8e49_iftrue;
     t8_MUX_uxn_opcodes_h_l1068_c7_8e49_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1068_c7_8e49_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1068_c7_8e49_return_output := t8_MUX_uxn_opcodes_h_l1068_c7_8e49_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1073_c7_ca7b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_ca7b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_ca7b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_ca7b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_ca7b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_ca7b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_ca7b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_ca7b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_ca7b_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1079_c21_375d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c21_98d0_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1068_c7_8e49_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1073_c7_ca7b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1068_c7_8e49_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_ca7b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c2_920b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1068_c7_8e49_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1068_c7_8e49_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_ca7b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c2_920b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1068_c7_8e49_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1060_c2_920b_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1068_c7_8e49_return_output;
     -- n8_MUX[uxn_opcodes_h_l1068_c7_8e49] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1068_c7_8e49_cond <= VAR_n8_MUX_uxn_opcodes_h_l1068_c7_8e49_cond;
     n8_MUX_uxn_opcodes_h_l1068_c7_8e49_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1068_c7_8e49_iftrue;
     n8_MUX_uxn_opcodes_h_l1068_c7_8e49_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1068_c7_8e49_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1068_c7_8e49_return_output := n8_MUX_uxn_opcodes_h_l1068_c7_8e49_return_output;

     -- MUX[uxn_opcodes_h_l1079_c21_375d] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1079_c21_375d_cond <= VAR_MUX_uxn_opcodes_h_l1079_c21_375d_cond;
     MUX_uxn_opcodes_h_l1079_c21_375d_iftrue <= VAR_MUX_uxn_opcodes_h_l1079_c21_375d_iftrue;
     MUX_uxn_opcodes_h_l1079_c21_375d_iffalse <= VAR_MUX_uxn_opcodes_h_l1079_c21_375d_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1079_c21_375d_return_output := MUX_uxn_opcodes_h_l1079_c21_375d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1068_c7_8e49] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1068_c7_8e49_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1068_c7_8e49_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1068_c7_8e49_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1068_c7_8e49_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1068_c7_8e49_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1068_c7_8e49_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1068_c7_8e49_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1068_c7_8e49_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1068_c7_8e49] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1068_c7_8e49_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1068_c7_8e49_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1068_c7_8e49_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1068_c7_8e49_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1068_c7_8e49_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1068_c7_8e49_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1068_c7_8e49_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1068_c7_8e49_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1060_c2_920b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c2_920b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c2_920b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c2_920b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c2_920b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c2_920b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c2_920b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c2_920b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c2_920b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1060_c2_920b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c2_920b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c2_920b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c2_920b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c2_920b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c2_920b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c2_920b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c2_920b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c2_920b_return_output;

     -- t8_MUX[uxn_opcodes_h_l1060_c2_920b] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1060_c2_920b_cond <= VAR_t8_MUX_uxn_opcodes_h_l1060_c2_920b_cond;
     t8_MUX_uxn_opcodes_h_l1060_c2_920b_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1060_c2_920b_iftrue;
     t8_MUX_uxn_opcodes_h_l1060_c2_920b_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1060_c2_920b_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1060_c2_920b_return_output := t8_MUX_uxn_opcodes_h_l1060_c2_920b_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1073_c7_ca7b_iftrue := VAR_MUX_uxn_opcodes_h_l1079_c21_375d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1060_c2_920b_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1068_c7_8e49_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1060_c2_920b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1068_c7_8e49_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1060_c2_920b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1068_c7_8e49_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1060_c2_920b_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1073_c7_ca7b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1073_c7_ca7b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1073_c7_ca7b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1073_c7_ca7b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1073_c7_ca7b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1073_c7_ca7b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1073_c7_ca7b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1073_c7_ca7b_return_output := result_u8_value_MUX_uxn_opcodes_h_l1073_c7_ca7b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1060_c2_920b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1060_c2_920b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1060_c2_920b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1060_c2_920b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1060_c2_920b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1060_c2_920b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1060_c2_920b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1060_c2_920b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1060_c2_920b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1060_c2_920b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1060_c2_920b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1060_c2_920b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1060_c2_920b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1060_c2_920b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1060_c2_920b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1060_c2_920b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1060_c2_920b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1060_c2_920b_return_output;

     -- n8_MUX[uxn_opcodes_h_l1060_c2_920b] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1060_c2_920b_cond <= VAR_n8_MUX_uxn_opcodes_h_l1060_c2_920b_cond;
     n8_MUX_uxn_opcodes_h_l1060_c2_920b_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1060_c2_920b_iftrue;
     n8_MUX_uxn_opcodes_h_l1060_c2_920b_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1060_c2_920b_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1060_c2_920b_return_output := n8_MUX_uxn_opcodes_h_l1060_c2_920b_return_output;

     -- Submodule level 5
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l1060_c2_920b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1068_c7_8e49_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1073_c7_ca7b_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1068_c7_8e49] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1068_c7_8e49_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1068_c7_8e49_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1068_c7_8e49_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1068_c7_8e49_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1068_c7_8e49_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1068_c7_8e49_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1068_c7_8e49_return_output := result_u8_value_MUX_uxn_opcodes_h_l1068_c7_8e49_return_output;

     -- Submodule level 6
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1060_c2_920b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1068_c7_8e49_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1060_c2_920b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1060_c2_920b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1060_c2_920b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1060_c2_920b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1060_c2_920b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1060_c2_920b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1060_c2_920b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1060_c2_920b_return_output := result_u8_value_MUX_uxn_opcodes_h_l1060_c2_920b_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_9d9a_uxn_opcodes_h_l1086_l1056_DUPLICATE_fc5b LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9d9a_uxn_opcodes_h_l1086_l1056_DUPLICATE_fc5b_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_9d9a(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c2_920b_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c2_920b_return_output,
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1060_c2_920b_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1060_c2_920b_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1060_c2_920b_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c2_920b_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1060_c2_920b_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9d9a_uxn_opcodes_h_l1086_l1056_DUPLICATE_fc5b_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9d9a_uxn_opcodes_h_l1086_l1056_DUPLICATE_fc5b_return_output;
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
