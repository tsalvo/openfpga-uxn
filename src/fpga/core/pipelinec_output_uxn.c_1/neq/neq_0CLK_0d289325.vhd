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
entity neq_0CLK_0d289325 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(15 downto 0);
 return_output : out opcode_result_t);
end neq_0CLK_0d289325;
architecture arch of neq_0CLK_0d289325 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1129_c6_4b73]
signal BIN_OP_EQ_uxn_opcodes_h_l1129_c6_4b73_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1129_c6_4b73_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1129_c6_4b73_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1129_c2_2295]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1129_c2_2295_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1129_c2_2295_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1129_c2_2295_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1129_c2_2295_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1129_c2_2295]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1129_c2_2295_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1129_c2_2295_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1129_c2_2295_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1129_c2_2295_return_output : unsigned(0 downto 0);

-- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l1129_c2_2295]
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1129_c2_2295_cond : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1129_c2_2295_iftrue : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1129_c2_2295_iffalse : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1129_c2_2295_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1129_c2_2295]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1129_c2_2295_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1129_c2_2295_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1129_c2_2295_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1129_c2_2295_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1129_c2_2295]
signal result_u8_value_MUX_uxn_opcodes_h_l1129_c2_2295_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1129_c2_2295_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1129_c2_2295_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1129_c2_2295_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1129_c2_2295]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1129_c2_2295_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1129_c2_2295_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1129_c2_2295_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1129_c2_2295_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1129_c2_2295]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1129_c2_2295_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1129_c2_2295_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1129_c2_2295_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1129_c2_2295_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1129_c2_2295]
signal t8_MUX_uxn_opcodes_h_l1129_c2_2295_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1129_c2_2295_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1129_c2_2295_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1129_c2_2295_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1129_c2_2295]
signal n8_MUX_uxn_opcodes_h_l1129_c2_2295_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1129_c2_2295_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1129_c2_2295_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1129_c2_2295_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1137_c11_66b7]
signal BIN_OP_EQ_uxn_opcodes_h_l1137_c11_66b7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1137_c11_66b7_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1137_c11_66b7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1137_c7_c44b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_c44b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_c44b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_c44b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_c44b_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1137_c7_c44b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1137_c7_c44b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1137_c7_c44b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1137_c7_c44b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1137_c7_c44b_return_output : unsigned(0 downto 0);

-- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l1137_c7_c44b]
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1137_c7_c44b_cond : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1137_c7_c44b_iftrue : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1137_c7_c44b_iffalse : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1137_c7_c44b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1137_c7_c44b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_c44b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_c44b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_c44b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_c44b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1137_c7_c44b]
signal result_u8_value_MUX_uxn_opcodes_h_l1137_c7_c44b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1137_c7_c44b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1137_c7_c44b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1137_c7_c44b_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1137_c7_c44b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_c44b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_c44b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_c44b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_c44b_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1137_c7_c44b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_c44b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_c44b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_c44b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_c44b_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1137_c7_c44b]
signal t8_MUX_uxn_opcodes_h_l1137_c7_c44b_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1137_c7_c44b_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1137_c7_c44b_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1137_c7_c44b_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1137_c7_c44b]
signal n8_MUX_uxn_opcodes_h_l1137_c7_c44b_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1137_c7_c44b_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1137_c7_c44b_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1137_c7_c44b_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1140_c30_8642]
signal sp_relative_shift_uxn_opcodes_h_l1140_c30_8642_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1140_c30_8642_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1140_c30_8642_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1140_c30_8642_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1142_c11_a498]
signal BIN_OP_EQ_uxn_opcodes_h_l1142_c11_a498_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1142_c11_a498_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1142_c11_a498_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1142_c7_a569]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1142_c7_a569_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1142_c7_a569_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1142_c7_a569_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1142_c7_a569_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1142_c7_a569]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1142_c7_a569_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1142_c7_a569_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1142_c7_a569_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1142_c7_a569_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1142_c7_a569]
signal result_u8_value_MUX_uxn_opcodes_h_l1142_c7_a569_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1142_c7_a569_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1142_c7_a569_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1142_c7_a569_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1142_c7_a569]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1142_c7_a569_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1142_c7_a569_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1142_c7_a569_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1142_c7_a569_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1142_c7_a569]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1142_c7_a569_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1142_c7_a569_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1142_c7_a569_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1142_c7_a569_return_output : unsigned(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l1142_c7_a569]
signal t8_MUX_uxn_opcodes_h_l1142_c7_a569_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1142_c7_a569_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1142_c7_a569_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1142_c7_a569_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1142_c7_a569]
signal n8_MUX_uxn_opcodes_h_l1142_c7_a569_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1142_c7_a569_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1142_c7_a569_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1142_c7_a569_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1144_c18_90be]
signal CONST_SR_8_uxn_opcodes_h_l1144_c18_90be_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1144_c18_90be_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1148_c21_e146]
signal BIN_OP_EQ_uxn_opcodes_h_l1148_c21_e146_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1148_c21_e146_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1148_c21_e146_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1148_c21_3ab5]
signal MUX_uxn_opcodes_h_l1148_c21_3ab5_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1148_c21_3ab5_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1148_c21_3ab5_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1148_c21_3ab5_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1150_c11_c1fc]
signal BIN_OP_EQ_uxn_opcodes_h_l1150_c11_c1fc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1150_c11_c1fc_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1150_c11_c1fc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1150_c7_fb61]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_fb61_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_fb61_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_fb61_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_fb61_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1150_c7_fb61]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_fb61_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_fb61_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_fb61_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_fb61_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l1129_c6_4b73
BIN_OP_EQ_uxn_opcodes_h_l1129_c6_4b73 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1129_c6_4b73_left,
BIN_OP_EQ_uxn_opcodes_h_l1129_c6_4b73_right,
BIN_OP_EQ_uxn_opcodes_h_l1129_c6_4b73_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1129_c2_2295
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1129_c2_2295 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1129_c2_2295_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1129_c2_2295_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1129_c2_2295_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1129_c2_2295_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1129_c2_2295
result_is_sp_shift_MUX_uxn_opcodes_h_l1129_c2_2295 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1129_c2_2295_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1129_c2_2295_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1129_c2_2295_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1129_c2_2295_return_output);

-- result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1129_c2_2295
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1129_c2_2295 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1129_c2_2295_cond,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1129_c2_2295_iftrue,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1129_c2_2295_iffalse,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1129_c2_2295_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1129_c2_2295
result_is_opc_done_MUX_uxn_opcodes_h_l1129_c2_2295 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1129_c2_2295_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1129_c2_2295_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1129_c2_2295_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1129_c2_2295_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1129_c2_2295
result_u8_value_MUX_uxn_opcodes_h_l1129_c2_2295 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1129_c2_2295_cond,
result_u8_value_MUX_uxn_opcodes_h_l1129_c2_2295_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1129_c2_2295_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1129_c2_2295_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1129_c2_2295
result_sp_relative_shift_MUX_uxn_opcodes_h_l1129_c2_2295 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1129_c2_2295_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1129_c2_2295_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1129_c2_2295_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1129_c2_2295_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1129_c2_2295
result_is_stack_write_MUX_uxn_opcodes_h_l1129_c2_2295 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1129_c2_2295_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1129_c2_2295_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1129_c2_2295_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1129_c2_2295_return_output);

-- t8_MUX_uxn_opcodes_h_l1129_c2_2295
t8_MUX_uxn_opcodes_h_l1129_c2_2295 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1129_c2_2295_cond,
t8_MUX_uxn_opcodes_h_l1129_c2_2295_iftrue,
t8_MUX_uxn_opcodes_h_l1129_c2_2295_iffalse,
t8_MUX_uxn_opcodes_h_l1129_c2_2295_return_output);

-- n8_MUX_uxn_opcodes_h_l1129_c2_2295
n8_MUX_uxn_opcodes_h_l1129_c2_2295 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1129_c2_2295_cond,
n8_MUX_uxn_opcodes_h_l1129_c2_2295_iftrue,
n8_MUX_uxn_opcodes_h_l1129_c2_2295_iffalse,
n8_MUX_uxn_opcodes_h_l1129_c2_2295_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1137_c11_66b7
BIN_OP_EQ_uxn_opcodes_h_l1137_c11_66b7 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1137_c11_66b7_left,
BIN_OP_EQ_uxn_opcodes_h_l1137_c11_66b7_right,
BIN_OP_EQ_uxn_opcodes_h_l1137_c11_66b7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_c44b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_c44b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_c44b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_c44b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_c44b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_c44b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1137_c7_c44b
result_is_sp_shift_MUX_uxn_opcodes_h_l1137_c7_c44b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1137_c7_c44b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1137_c7_c44b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1137_c7_c44b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1137_c7_c44b_return_output);

-- result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1137_c7_c44b
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1137_c7_c44b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1137_c7_c44b_cond,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1137_c7_c44b_iftrue,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1137_c7_c44b_iffalse,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1137_c7_c44b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_c44b
result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_c44b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_c44b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_c44b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_c44b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_c44b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1137_c7_c44b
result_u8_value_MUX_uxn_opcodes_h_l1137_c7_c44b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1137_c7_c44b_cond,
result_u8_value_MUX_uxn_opcodes_h_l1137_c7_c44b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1137_c7_c44b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1137_c7_c44b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_c44b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_c44b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_c44b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_c44b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_c44b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_c44b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_c44b
result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_c44b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_c44b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_c44b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_c44b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_c44b_return_output);

-- t8_MUX_uxn_opcodes_h_l1137_c7_c44b
t8_MUX_uxn_opcodes_h_l1137_c7_c44b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1137_c7_c44b_cond,
t8_MUX_uxn_opcodes_h_l1137_c7_c44b_iftrue,
t8_MUX_uxn_opcodes_h_l1137_c7_c44b_iffalse,
t8_MUX_uxn_opcodes_h_l1137_c7_c44b_return_output);

-- n8_MUX_uxn_opcodes_h_l1137_c7_c44b
n8_MUX_uxn_opcodes_h_l1137_c7_c44b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1137_c7_c44b_cond,
n8_MUX_uxn_opcodes_h_l1137_c7_c44b_iftrue,
n8_MUX_uxn_opcodes_h_l1137_c7_c44b_iffalse,
n8_MUX_uxn_opcodes_h_l1137_c7_c44b_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1140_c30_8642
sp_relative_shift_uxn_opcodes_h_l1140_c30_8642 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1140_c30_8642_ins,
sp_relative_shift_uxn_opcodes_h_l1140_c30_8642_x,
sp_relative_shift_uxn_opcodes_h_l1140_c30_8642_y,
sp_relative_shift_uxn_opcodes_h_l1140_c30_8642_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1142_c11_a498
BIN_OP_EQ_uxn_opcodes_h_l1142_c11_a498 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1142_c11_a498_left,
BIN_OP_EQ_uxn_opcodes_h_l1142_c11_a498_right,
BIN_OP_EQ_uxn_opcodes_h_l1142_c11_a498_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1142_c7_a569
result_is_sp_shift_MUX_uxn_opcodes_h_l1142_c7_a569 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1142_c7_a569_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1142_c7_a569_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1142_c7_a569_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1142_c7_a569_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1142_c7_a569
result_is_opc_done_MUX_uxn_opcodes_h_l1142_c7_a569 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1142_c7_a569_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1142_c7_a569_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1142_c7_a569_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1142_c7_a569_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1142_c7_a569
result_u8_value_MUX_uxn_opcodes_h_l1142_c7_a569 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1142_c7_a569_cond,
result_u8_value_MUX_uxn_opcodes_h_l1142_c7_a569_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1142_c7_a569_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1142_c7_a569_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1142_c7_a569
result_is_stack_write_MUX_uxn_opcodes_h_l1142_c7_a569 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1142_c7_a569_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1142_c7_a569_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1142_c7_a569_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1142_c7_a569_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1142_c7_a569
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1142_c7_a569 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1142_c7_a569_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1142_c7_a569_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1142_c7_a569_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1142_c7_a569_return_output);

-- t8_MUX_uxn_opcodes_h_l1142_c7_a569
t8_MUX_uxn_opcodes_h_l1142_c7_a569 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1142_c7_a569_cond,
t8_MUX_uxn_opcodes_h_l1142_c7_a569_iftrue,
t8_MUX_uxn_opcodes_h_l1142_c7_a569_iffalse,
t8_MUX_uxn_opcodes_h_l1142_c7_a569_return_output);

-- n8_MUX_uxn_opcodes_h_l1142_c7_a569
n8_MUX_uxn_opcodes_h_l1142_c7_a569 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1142_c7_a569_cond,
n8_MUX_uxn_opcodes_h_l1142_c7_a569_iftrue,
n8_MUX_uxn_opcodes_h_l1142_c7_a569_iffalse,
n8_MUX_uxn_opcodes_h_l1142_c7_a569_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1144_c18_90be
CONST_SR_8_uxn_opcodes_h_l1144_c18_90be : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1144_c18_90be_x,
CONST_SR_8_uxn_opcodes_h_l1144_c18_90be_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1148_c21_e146
BIN_OP_EQ_uxn_opcodes_h_l1148_c21_e146 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1148_c21_e146_left,
BIN_OP_EQ_uxn_opcodes_h_l1148_c21_e146_right,
BIN_OP_EQ_uxn_opcodes_h_l1148_c21_e146_return_output);

-- MUX_uxn_opcodes_h_l1148_c21_3ab5
MUX_uxn_opcodes_h_l1148_c21_3ab5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1148_c21_3ab5_cond,
MUX_uxn_opcodes_h_l1148_c21_3ab5_iftrue,
MUX_uxn_opcodes_h_l1148_c21_3ab5_iffalse,
MUX_uxn_opcodes_h_l1148_c21_3ab5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1150_c11_c1fc
BIN_OP_EQ_uxn_opcodes_h_l1150_c11_c1fc : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1150_c11_c1fc_left,
BIN_OP_EQ_uxn_opcodes_h_l1150_c11_c1fc_right,
BIN_OP_EQ_uxn_opcodes_h_l1150_c11_c1fc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_fb61
result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_fb61 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_fb61_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_fb61_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_fb61_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_fb61_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_fb61
result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_fb61 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_fb61_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_fb61_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_fb61_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_fb61_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1129_c6_4b73_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1129_c2_2295_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1129_c2_2295_return_output,
 result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1129_c2_2295_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1129_c2_2295_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1129_c2_2295_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1129_c2_2295_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1129_c2_2295_return_output,
 t8_MUX_uxn_opcodes_h_l1129_c2_2295_return_output,
 n8_MUX_uxn_opcodes_h_l1129_c2_2295_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1137_c11_66b7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_c44b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1137_c7_c44b_return_output,
 result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1137_c7_c44b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_c44b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1137_c7_c44b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_c44b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_c44b_return_output,
 t8_MUX_uxn_opcodes_h_l1137_c7_c44b_return_output,
 n8_MUX_uxn_opcodes_h_l1137_c7_c44b_return_output,
 sp_relative_shift_uxn_opcodes_h_l1140_c30_8642_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1142_c11_a498_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1142_c7_a569_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1142_c7_a569_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1142_c7_a569_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1142_c7_a569_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1142_c7_a569_return_output,
 t8_MUX_uxn_opcodes_h_l1142_c7_a569_return_output,
 n8_MUX_uxn_opcodes_h_l1142_c7_a569_return_output,
 CONST_SR_8_uxn_opcodes_h_l1144_c18_90be_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1148_c21_e146_return_output,
 MUX_uxn_opcodes_h_l1148_c21_3ab5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1150_c11_c1fc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_fb61_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_fb61_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1129_c6_4b73_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1129_c6_4b73_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1129_c6_4b73_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1129_c2_2295_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1134_c3_b407 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1129_c2_2295_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_c44b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1129_c2_2295_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1129_c2_2295_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1129_c2_2295_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1129_c2_2295_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1137_c7_c44b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1129_c2_2295_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1129_c2_2295_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1129_c2_2295_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1129_c2_2295_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1137_c7_c44b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1129_c2_2295_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1129_c2_2295_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1129_c2_2295_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1129_c2_2295_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_c44b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1129_c2_2295_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1129_c2_2295_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1129_c2_2295_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1129_c2_2295_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1137_c7_c44b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1129_c2_2295_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1129_c2_2295_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1129_c2_2295_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1129_c2_2295_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_c44b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1129_c2_2295_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1129_c2_2295_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1129_c2_2295_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1129_c2_2295_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_c44b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1129_c2_2295_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1129_c2_2295_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1129_c2_2295_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1129_c2_2295_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1137_c7_c44b_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1129_c2_2295_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1129_c2_2295_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1129_c2_2295_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1129_c2_2295_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1137_c7_c44b_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1129_c2_2295_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1129_c2_2295_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1137_c11_66b7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1137_c11_66b7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1137_c11_66b7_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_c44b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_c44b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1142_c7_a569_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_c44b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1137_c7_c44b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1137_c7_c44b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1142_c7_a569_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1137_c7_c44b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1137_c7_c44b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1137_c7_c44b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l1137_c7_c44b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1137_c7_c44b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_c44b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_c44b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1142_c7_a569_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_c44b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1137_c7_c44b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1137_c7_c44b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1142_c7_a569_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1137_c7_c44b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_c44b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_c44b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_c44b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_c44b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_c44b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1142_c7_a569_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_c44b_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1137_c7_c44b_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1137_c7_c44b_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1142_c7_a569_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1137_c7_c44b_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1137_c7_c44b_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1137_c7_c44b_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1142_c7_a569_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1137_c7_c44b_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1140_c30_8642_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1140_c30_8642_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1140_c30_8642_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1140_c30_8642_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1142_c11_a498_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1142_c11_a498_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1142_c11_a498_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1142_c7_a569_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1142_c7_a569_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1142_c7_a569_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1142_c7_a569_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1142_c7_a569_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_fb61_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1142_c7_a569_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1142_c7_a569_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1142_c7_a569_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1142_c7_a569_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1142_c7_a569_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1142_c7_a569_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_fb61_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1142_c7_a569_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1142_c7_a569_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1147_c3_22b0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1142_c7_a569_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1142_c7_a569_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1142_c7_a569_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1142_c7_a569_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1142_c7_a569_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1142_c7_a569_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1142_c7_a569_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1142_c7_a569_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1143_c8_e840_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1144_c18_90be_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1144_c18_90be_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1144_c8_5f3c_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1148_c21_3ab5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c21_e146_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c21_e146_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c21_e146_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1148_c21_3ab5_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1148_c21_3ab5_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1148_c21_3ab5_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1150_c11_c1fc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1150_c11_c1fc_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1150_c11_c1fc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_fb61_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_fb61_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_fb61_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_fb61_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_fb61_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_fb61_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1129_l1142_DUPLICATE_af3c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1137_l1129_l1142_DUPLICATE_ddfa_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1137_l1129_DUPLICATE_79a1_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1137_l1129_l1150_DUPLICATE_8f4a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1137_l1142_DUPLICATE_3522_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1137_l1142_l1150_DUPLICATE_3939_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9d9a_uxn_opcodes_h_l1155_l1125_DUPLICATE_05c3_return_output : opcode_result_t;
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
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_fb61_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1137_c7_c44b_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1137_c7_c44b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1142_c11_a498_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1137_c11_66b7_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1129_c6_4b73_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1134_c3_b407 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1129_c2_2295_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1134_c3_b407;
     VAR_sp_relative_shift_uxn_opcodes_h_l1140_c30_8642_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_MUX_uxn_opcodes_h_l1148_c21_3ab5_iffalse := resize(to_unsigned(1, 1), 8);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1142_c7_a569_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1147_c3_22b0 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1142_c7_a569_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1147_c3_22b0;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_fb61_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1148_c21_3ab5_iftrue := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1150_c11_c1fc_right := to_unsigned(3, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l1140_c30_8642_y := resize(to_signed(-1, 2), 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1142_c7_a569_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1129_c2_2295_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1129_c2_2295_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1140_c30_8642_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l1129_c2_2295_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1137_c7_c44b_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1142_c7_a569_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1129_c6_4b73_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1137_c11_66b7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1142_c11_a498_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1150_c11_c1fc_left := VAR_phase;
     VAR_CONST_SR_8_uxn_opcodes_h_l1144_c18_90be_x := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1129_c2_2295_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1137_c7_c44b_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1142_c7_a569_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l1142_c11_a498] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1142_c11_a498_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1142_c11_a498_left;
     BIN_OP_EQ_uxn_opcodes_h_l1142_c11_a498_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1142_c11_a498_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1142_c11_a498_return_output := BIN_OP_EQ_uxn_opcodes_h_l1142_c11_a498_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1137_l1129_DUPLICATE_79a1 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1137_l1129_DUPLICATE_79a1_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1137_l1129_l1142_DUPLICATE_ddfa LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1137_l1129_l1142_DUPLICATE_ddfa_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1129_c6_4b73] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1129_c6_4b73_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1129_c6_4b73_left;
     BIN_OP_EQ_uxn_opcodes_h_l1129_c6_4b73_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1129_c6_4b73_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1129_c6_4b73_return_output := BIN_OP_EQ_uxn_opcodes_h_l1129_c6_4b73_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1137_l1142_l1150_DUPLICATE_3939 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1137_l1142_l1150_DUPLICATE_3939_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1150_c11_c1fc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1150_c11_c1fc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1150_c11_c1fc_left;
     BIN_OP_EQ_uxn_opcodes_h_l1150_c11_c1fc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1150_c11_c1fc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1150_c11_c1fc_return_output := BIN_OP_EQ_uxn_opcodes_h_l1150_c11_c1fc_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1137_l1129_l1150_DUPLICATE_8f4a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1137_l1129_l1150_DUPLICATE_8f4a_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1137_l1142_DUPLICATE_3522 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1137_l1142_DUPLICATE_3522_return_output := result.stack_address_sp_offset;

     -- result_is_stack_operation_16bit_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d[uxn_opcodes_h_l1137_c7_c44b] LATENCY=0
     VAR_result_is_stack_operation_16bit_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l1137_c7_c44b_return_output := result.is_stack_operation_16bit;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1143_c8_e840] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1143_c8_e840_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_previous_stack_read);

     -- sp_relative_shift[uxn_opcodes_h_l1140_c30_8642] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1140_c30_8642_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1140_c30_8642_ins;
     sp_relative_shift_uxn_opcodes_h_l1140_c30_8642_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1140_c30_8642_x;
     sp_relative_shift_uxn_opcodes_h_l1140_c30_8642_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1140_c30_8642_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1140_c30_8642_return_output := sp_relative_shift_uxn_opcodes_h_l1140_c30_8642_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1129_l1142_DUPLICATE_af3c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1129_l1142_DUPLICATE_af3c_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1137_c11_66b7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1137_c11_66b7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1137_c11_66b7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1137_c11_66b7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1137_c11_66b7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1137_c11_66b7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1137_c11_66b7_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1144_c18_90be] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1144_c18_90be_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1144_c18_90be_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1144_c18_90be_return_output := CONST_SR_8_uxn_opcodes_h_l1144_c18_90be_return_output;

     -- Submodule level 1
     VAR_n8_MUX_uxn_opcodes_h_l1129_c2_2295_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1129_c6_4b73_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1129_c2_2295_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1129_c6_4b73_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1129_c2_2295_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1129_c6_4b73_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1129_c2_2295_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1129_c6_4b73_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1129_c2_2295_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1129_c6_4b73_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1129_c2_2295_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1129_c6_4b73_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1129_c2_2295_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1129_c6_4b73_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1129_c2_2295_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1129_c6_4b73_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1129_c2_2295_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1129_c6_4b73_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1137_c7_c44b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1137_c11_66b7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_c44b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1137_c11_66b7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1137_c7_c44b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1137_c11_66b7_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1137_c7_c44b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1137_c11_66b7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_c44b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1137_c11_66b7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_c44b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1137_c11_66b7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_c44b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1137_c11_66b7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1137_c7_c44b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1137_c11_66b7_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1137_c7_c44b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1137_c11_66b7_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1142_c7_a569_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1142_c11_a498_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1142_c7_a569_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1142_c11_a498_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1142_c7_a569_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1142_c11_a498_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1142_c7_a569_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1142_c11_a498_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1142_c7_a569_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1142_c11_a498_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1142_c7_a569_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1142_c11_a498_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1142_c7_a569_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1142_c11_a498_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_fb61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1150_c11_c1fc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_fb61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1150_c11_c1fc_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c21_e146_right := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1143_c8_e840_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1142_c7_a569_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1143_c8_e840_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1129_c2_2295_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1137_l1129_DUPLICATE_79a1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_c44b_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1137_l1129_DUPLICATE_79a1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_c44b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1137_l1142_l1150_DUPLICATE_3939_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1142_c7_a569_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1137_l1142_l1150_DUPLICATE_3939_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_fb61_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1137_l1142_l1150_DUPLICATE_3939_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1129_c2_2295_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1129_l1142_DUPLICATE_af3c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1142_c7_a569_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1129_l1142_DUPLICATE_af3c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1129_c2_2295_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1137_l1129_l1150_DUPLICATE_8f4a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_c44b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1137_l1129_l1150_DUPLICATE_8f4a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_fb61_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1137_l1129_l1150_DUPLICATE_8f4a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_c44b_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1137_l1142_DUPLICATE_3522_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1142_c7_a569_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1137_l1142_DUPLICATE_3522_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1129_c2_2295_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1137_l1129_l1142_DUPLICATE_ddfa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1137_c7_c44b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1137_l1129_l1142_DUPLICATE_ddfa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1142_c7_a569_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1137_l1129_l1142_DUPLICATE_ddfa_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1137_c7_c44b_iffalse := VAR_result_is_stack_operation_16bit_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l1137_c7_c44b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_c44b_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1140_c30_8642_return_output;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l1144_c8_5f3c] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1144_c8_5f3c_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1144_c18_90be_return_output);

     -- t8_MUX[uxn_opcodes_h_l1142_c7_a569] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1142_c7_a569_cond <= VAR_t8_MUX_uxn_opcodes_h_l1142_c7_a569_cond;
     t8_MUX_uxn_opcodes_h_l1142_c7_a569_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1142_c7_a569_iftrue;
     t8_MUX_uxn_opcodes_h_l1142_c7_a569_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1142_c7_a569_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1142_c7_a569_return_output := t8_MUX_uxn_opcodes_h_l1142_c7_a569_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1150_c7_fb61] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_fb61_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_fb61_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_fb61_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_fb61_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_fb61_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_fb61_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_fb61_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_fb61_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1137_c7_c44b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_c44b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_c44b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_c44b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_c44b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_c44b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_c44b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_c44b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_c44b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1142_c7_a569] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1142_c7_a569_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1142_c7_a569_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1142_c7_a569_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1142_c7_a569_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1142_c7_a569_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1142_c7_a569_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1142_c7_a569_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1142_c7_a569_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1142_c7_a569] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1142_c7_a569_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1142_c7_a569_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1142_c7_a569_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1142_c7_a569_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1142_c7_a569_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1142_c7_a569_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1142_c7_a569_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1142_c7_a569_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1150_c7_fb61] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_fb61_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_fb61_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_fb61_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_fb61_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_fb61_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_fb61_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_fb61_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_fb61_return_output;

     -- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l1137_c7_c44b] LATENCY=0
     -- Inputs
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1137_c7_c44b_cond <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1137_c7_c44b_cond;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1137_c7_c44b_iftrue <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1137_c7_c44b_iftrue;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1137_c7_c44b_iffalse <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1137_c7_c44b_iffalse;
     -- Outputs
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1137_c7_c44b_return_output := result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1137_c7_c44b_return_output;

     -- Submodule level 2
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c21_e146_left := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1144_c8_5f3c_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1142_c7_a569_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1144_c8_5f3c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1142_c7_a569_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_fb61_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1137_c7_c44b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1142_c7_a569_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1129_c2_2295_iffalse := VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1137_c7_c44b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1142_c7_a569_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_fb61_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1129_c2_2295_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_c44b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_c44b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1142_c7_a569_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1137_c7_c44b_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1142_c7_a569_return_output;
     -- BIN_OP_EQ[uxn_opcodes_h_l1148_c21_e146] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1148_c21_e146_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c21_e146_left;
     BIN_OP_EQ_uxn_opcodes_h_l1148_c21_e146_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c21_e146_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c21_e146_return_output := BIN_OP_EQ_uxn_opcodes_h_l1148_c21_e146_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1142_c7_a569] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1142_c7_a569_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1142_c7_a569_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1142_c7_a569_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1142_c7_a569_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1142_c7_a569_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1142_c7_a569_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1142_c7_a569_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1142_c7_a569_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1129_c2_2295] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1129_c2_2295_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1129_c2_2295_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1129_c2_2295_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1129_c2_2295_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1129_c2_2295_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1129_c2_2295_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1129_c2_2295_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1129_c2_2295_return_output;

     -- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l1129_c2_2295] LATENCY=0
     -- Inputs
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1129_c2_2295_cond <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1129_c2_2295_cond;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1129_c2_2295_iftrue <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1129_c2_2295_iftrue;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1129_c2_2295_iffalse <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1129_c2_2295_iffalse;
     -- Outputs
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1129_c2_2295_return_output := result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1129_c2_2295_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1137_c7_c44b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1137_c7_c44b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1137_c7_c44b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1137_c7_c44b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1137_c7_c44b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1137_c7_c44b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1137_c7_c44b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1137_c7_c44b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1137_c7_c44b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1137_c7_c44b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_c44b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_c44b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_c44b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_c44b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_c44b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_c44b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_c44b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_c44b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1142_c7_a569] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1142_c7_a569_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1142_c7_a569_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1142_c7_a569_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1142_c7_a569_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1142_c7_a569_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1142_c7_a569_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1142_c7_a569_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1142_c7_a569_return_output;

     -- n8_MUX[uxn_opcodes_h_l1142_c7_a569] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1142_c7_a569_cond <= VAR_n8_MUX_uxn_opcodes_h_l1142_c7_a569_cond;
     n8_MUX_uxn_opcodes_h_l1142_c7_a569_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1142_c7_a569_iftrue;
     n8_MUX_uxn_opcodes_h_l1142_c7_a569_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1142_c7_a569_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1142_c7_a569_return_output := n8_MUX_uxn_opcodes_h_l1142_c7_a569_return_output;

     -- t8_MUX[uxn_opcodes_h_l1137_c7_c44b] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1137_c7_c44b_cond <= VAR_t8_MUX_uxn_opcodes_h_l1137_c7_c44b_cond;
     t8_MUX_uxn_opcodes_h_l1137_c7_c44b_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1137_c7_c44b_iftrue;
     t8_MUX_uxn_opcodes_h_l1137_c7_c44b_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1137_c7_c44b_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1137_c7_c44b_return_output := t8_MUX_uxn_opcodes_h_l1137_c7_c44b_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1148_c21_3ab5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c21_e146_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1137_c7_c44b_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1142_c7_a569_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_c44b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1142_c7_a569_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1129_c2_2295_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1137_c7_c44b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_c44b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1142_c7_a569_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1129_c2_2295_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_c44b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1129_c2_2295_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1137_c7_c44b_return_output;
     -- n8_MUX[uxn_opcodes_h_l1137_c7_c44b] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1137_c7_c44b_cond <= VAR_n8_MUX_uxn_opcodes_h_l1137_c7_c44b_cond;
     n8_MUX_uxn_opcodes_h_l1137_c7_c44b_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1137_c7_c44b_iftrue;
     n8_MUX_uxn_opcodes_h_l1137_c7_c44b_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1137_c7_c44b_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1137_c7_c44b_return_output := n8_MUX_uxn_opcodes_h_l1137_c7_c44b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1129_c2_2295] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1129_c2_2295_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1129_c2_2295_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1129_c2_2295_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1129_c2_2295_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1129_c2_2295_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1129_c2_2295_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1129_c2_2295_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1129_c2_2295_return_output;

     -- t8_MUX[uxn_opcodes_h_l1129_c2_2295] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1129_c2_2295_cond <= VAR_t8_MUX_uxn_opcodes_h_l1129_c2_2295_cond;
     t8_MUX_uxn_opcodes_h_l1129_c2_2295_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1129_c2_2295_iftrue;
     t8_MUX_uxn_opcodes_h_l1129_c2_2295_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1129_c2_2295_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1129_c2_2295_return_output := t8_MUX_uxn_opcodes_h_l1129_c2_2295_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1137_c7_c44b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_c44b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_c44b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_c44b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_c44b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_c44b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_c44b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_c44b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_c44b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1129_c2_2295] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1129_c2_2295_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1129_c2_2295_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1129_c2_2295_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1129_c2_2295_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1129_c2_2295_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1129_c2_2295_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1129_c2_2295_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1129_c2_2295_return_output;

     -- MUX[uxn_opcodes_h_l1148_c21_3ab5] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1148_c21_3ab5_cond <= VAR_MUX_uxn_opcodes_h_l1148_c21_3ab5_cond;
     MUX_uxn_opcodes_h_l1148_c21_3ab5_iftrue <= VAR_MUX_uxn_opcodes_h_l1148_c21_3ab5_iftrue;
     MUX_uxn_opcodes_h_l1148_c21_3ab5_iffalse <= VAR_MUX_uxn_opcodes_h_l1148_c21_3ab5_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1148_c21_3ab5_return_output := MUX_uxn_opcodes_h_l1148_c21_3ab5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1137_c7_c44b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_c44b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_c44b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_c44b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_c44b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_c44b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_c44b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_c44b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_c44b_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1142_c7_a569_iftrue := VAR_MUX_uxn_opcodes_h_l1148_c21_3ab5_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1129_c2_2295_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1137_c7_c44b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1129_c2_2295_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_c44b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1129_c2_2295_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_c44b_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1129_c2_2295_return_output;
     -- n8_MUX[uxn_opcodes_h_l1129_c2_2295] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1129_c2_2295_cond <= VAR_n8_MUX_uxn_opcodes_h_l1129_c2_2295_cond;
     n8_MUX_uxn_opcodes_h_l1129_c2_2295_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1129_c2_2295_iftrue;
     n8_MUX_uxn_opcodes_h_l1129_c2_2295_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1129_c2_2295_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1129_c2_2295_return_output := n8_MUX_uxn_opcodes_h_l1129_c2_2295_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1129_c2_2295] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1129_c2_2295_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1129_c2_2295_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1129_c2_2295_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1129_c2_2295_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1129_c2_2295_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1129_c2_2295_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1129_c2_2295_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1129_c2_2295_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1129_c2_2295] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1129_c2_2295_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1129_c2_2295_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1129_c2_2295_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1129_c2_2295_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1129_c2_2295_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1129_c2_2295_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1129_c2_2295_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1129_c2_2295_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1142_c7_a569] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1142_c7_a569_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1142_c7_a569_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1142_c7_a569_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1142_c7_a569_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1142_c7_a569_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1142_c7_a569_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1142_c7_a569_return_output := result_u8_value_MUX_uxn_opcodes_h_l1142_c7_a569_return_output;

     -- Submodule level 5
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l1129_c2_2295_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1137_c7_c44b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1142_c7_a569_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1137_c7_c44b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1137_c7_c44b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1137_c7_c44b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1137_c7_c44b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1137_c7_c44b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1137_c7_c44b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1137_c7_c44b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1137_c7_c44b_return_output := result_u8_value_MUX_uxn_opcodes_h_l1137_c7_c44b_return_output;

     -- Submodule level 6
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1129_c2_2295_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1137_c7_c44b_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1129_c2_2295] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1129_c2_2295_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1129_c2_2295_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1129_c2_2295_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1129_c2_2295_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1129_c2_2295_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1129_c2_2295_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1129_c2_2295_return_output := result_u8_value_MUX_uxn_opcodes_h_l1129_c2_2295_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_9d9a_uxn_opcodes_h_l1155_l1125_DUPLICATE_05c3 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9d9a_uxn_opcodes_h_l1155_l1125_DUPLICATE_05c3_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_9d9a(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1129_c2_2295_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1129_c2_2295_return_output,
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1129_c2_2295_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1129_c2_2295_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1129_c2_2295_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1129_c2_2295_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1129_c2_2295_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9d9a_uxn_opcodes_h_l1155_l1125_DUPLICATE_05c3_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9d9a_uxn_opcodes_h_l1155_l1125_DUPLICATE_05c3_return_output;
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
