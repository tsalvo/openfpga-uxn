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
entity ora_0CLK_7883ef49 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(15 downto 0);
 return_output : out opcode_result_t);
end ora_0CLK_7883ef49;
architecture arch of ora_0CLK_7883ef49 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l920_c6_e329]
signal BIN_OP_EQ_uxn_opcodes_h_l920_c6_e329_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l920_c6_e329_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l920_c6_e329_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l920_c2_f872]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c2_f872_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c2_f872_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c2_f872_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c2_f872_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l920_c2_f872]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l920_c2_f872_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l920_c2_f872_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l920_c2_f872_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l920_c2_f872_return_output : unsigned(0 downto 0);

-- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l920_c2_f872]
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l920_c2_f872_cond : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l920_c2_f872_iftrue : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l920_c2_f872_iffalse : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l920_c2_f872_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l920_c2_f872]
signal result_is_opc_done_MUX_uxn_opcodes_h_l920_c2_f872_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l920_c2_f872_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l920_c2_f872_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l920_c2_f872_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l920_c2_f872]
signal result_u8_value_MUX_uxn_opcodes_h_l920_c2_f872_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l920_c2_f872_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l920_c2_f872_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l920_c2_f872_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l920_c2_f872]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c2_f872_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c2_f872_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c2_f872_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c2_f872_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l920_c2_f872]
signal result_is_stack_write_MUX_uxn_opcodes_h_l920_c2_f872_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l920_c2_f872_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l920_c2_f872_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l920_c2_f872_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l920_c2_f872]
signal t8_MUX_uxn_opcodes_h_l920_c2_f872_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l920_c2_f872_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l920_c2_f872_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l920_c2_f872_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l920_c2_f872]
signal n8_MUX_uxn_opcodes_h_l920_c2_f872_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l920_c2_f872_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l920_c2_f872_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l920_c2_f872_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l928_c11_51b3]
signal BIN_OP_EQ_uxn_opcodes_h_l928_c11_51b3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l928_c11_51b3_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l928_c11_51b3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l928_c7_ea25]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l928_c7_ea25_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l928_c7_ea25_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l928_c7_ea25_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l928_c7_ea25_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l928_c7_ea25]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l928_c7_ea25_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l928_c7_ea25_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l928_c7_ea25_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l928_c7_ea25_return_output : unsigned(0 downto 0);

-- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l928_c7_ea25]
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l928_c7_ea25_cond : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l928_c7_ea25_iftrue : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l928_c7_ea25_iffalse : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l928_c7_ea25_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l928_c7_ea25]
signal result_is_opc_done_MUX_uxn_opcodes_h_l928_c7_ea25_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l928_c7_ea25_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l928_c7_ea25_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l928_c7_ea25_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l928_c7_ea25]
signal result_u8_value_MUX_uxn_opcodes_h_l928_c7_ea25_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l928_c7_ea25_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l928_c7_ea25_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l928_c7_ea25_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l928_c7_ea25]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l928_c7_ea25_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l928_c7_ea25_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l928_c7_ea25_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l928_c7_ea25_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l928_c7_ea25]
signal result_is_stack_write_MUX_uxn_opcodes_h_l928_c7_ea25_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l928_c7_ea25_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l928_c7_ea25_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l928_c7_ea25_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l928_c7_ea25]
signal t8_MUX_uxn_opcodes_h_l928_c7_ea25_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l928_c7_ea25_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l928_c7_ea25_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l928_c7_ea25_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l928_c7_ea25]
signal n8_MUX_uxn_opcodes_h_l928_c7_ea25_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l928_c7_ea25_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l928_c7_ea25_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l928_c7_ea25_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l931_c30_322d]
signal sp_relative_shift_uxn_opcodes_h_l931_c30_322d_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l931_c30_322d_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l931_c30_322d_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l931_c30_322d_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l933_c11_4d4d]
signal BIN_OP_EQ_uxn_opcodes_h_l933_c11_4d4d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l933_c11_4d4d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l933_c11_4d4d_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l933_c7_5f2d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l933_c7_5f2d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l933_c7_5f2d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l933_c7_5f2d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l933_c7_5f2d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l933_c7_5f2d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l933_c7_5f2d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l933_c7_5f2d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l933_c7_5f2d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l933_c7_5f2d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l933_c7_5f2d]
signal result_u8_value_MUX_uxn_opcodes_h_l933_c7_5f2d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l933_c7_5f2d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l933_c7_5f2d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l933_c7_5f2d_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l933_c7_5f2d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l933_c7_5f2d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l933_c7_5f2d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l933_c7_5f2d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l933_c7_5f2d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l933_c7_5f2d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l933_c7_5f2d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l933_c7_5f2d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l933_c7_5f2d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l933_c7_5f2d_return_output : unsigned(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l933_c7_5f2d]
signal t8_MUX_uxn_opcodes_h_l933_c7_5f2d_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l933_c7_5f2d_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l933_c7_5f2d_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l933_c7_5f2d_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l933_c7_5f2d]
signal n8_MUX_uxn_opcodes_h_l933_c7_5f2d_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l933_c7_5f2d_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l933_c7_5f2d_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l933_c7_5f2d_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l935_c18_3d0e]
signal CONST_SR_8_uxn_opcodes_h_l935_c18_3d0e_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l935_c18_3d0e_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l939_c21_655b]
signal BIN_OP_OR_uxn_opcodes_h_l939_c21_655b_left : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l939_c21_655b_right : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l939_c21_655b_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l941_c11_7f8b]
signal BIN_OP_EQ_uxn_opcodes_h_l941_c11_7f8b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l941_c11_7f8b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l941_c11_7f8b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l941_c7_199c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l941_c7_199c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l941_c7_199c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l941_c7_199c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l941_c7_199c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l941_c7_199c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l941_c7_199c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l941_c7_199c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l941_c7_199c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l941_c7_199c_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l920_c6_e329
BIN_OP_EQ_uxn_opcodes_h_l920_c6_e329 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l920_c6_e329_left,
BIN_OP_EQ_uxn_opcodes_h_l920_c6_e329_right,
BIN_OP_EQ_uxn_opcodes_h_l920_c6_e329_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c2_f872
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c2_f872 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c2_f872_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c2_f872_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c2_f872_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c2_f872_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l920_c2_f872
result_is_sp_shift_MUX_uxn_opcodes_h_l920_c2_f872 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l920_c2_f872_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l920_c2_f872_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l920_c2_f872_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l920_c2_f872_return_output);

-- result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l920_c2_f872
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l920_c2_f872 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l920_c2_f872_cond,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l920_c2_f872_iftrue,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l920_c2_f872_iffalse,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l920_c2_f872_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l920_c2_f872
result_is_opc_done_MUX_uxn_opcodes_h_l920_c2_f872 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l920_c2_f872_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l920_c2_f872_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l920_c2_f872_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l920_c2_f872_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l920_c2_f872
result_u8_value_MUX_uxn_opcodes_h_l920_c2_f872 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l920_c2_f872_cond,
result_u8_value_MUX_uxn_opcodes_h_l920_c2_f872_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l920_c2_f872_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l920_c2_f872_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c2_f872
result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c2_f872 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c2_f872_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c2_f872_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c2_f872_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c2_f872_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l920_c2_f872
result_is_stack_write_MUX_uxn_opcodes_h_l920_c2_f872 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l920_c2_f872_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l920_c2_f872_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l920_c2_f872_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l920_c2_f872_return_output);

-- t8_MUX_uxn_opcodes_h_l920_c2_f872
t8_MUX_uxn_opcodes_h_l920_c2_f872 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l920_c2_f872_cond,
t8_MUX_uxn_opcodes_h_l920_c2_f872_iftrue,
t8_MUX_uxn_opcodes_h_l920_c2_f872_iffalse,
t8_MUX_uxn_opcodes_h_l920_c2_f872_return_output);

-- n8_MUX_uxn_opcodes_h_l920_c2_f872
n8_MUX_uxn_opcodes_h_l920_c2_f872 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l920_c2_f872_cond,
n8_MUX_uxn_opcodes_h_l920_c2_f872_iftrue,
n8_MUX_uxn_opcodes_h_l920_c2_f872_iffalse,
n8_MUX_uxn_opcodes_h_l920_c2_f872_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l928_c11_51b3
BIN_OP_EQ_uxn_opcodes_h_l928_c11_51b3 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l928_c11_51b3_left,
BIN_OP_EQ_uxn_opcodes_h_l928_c11_51b3_right,
BIN_OP_EQ_uxn_opcodes_h_l928_c11_51b3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l928_c7_ea25
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l928_c7_ea25 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l928_c7_ea25_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l928_c7_ea25_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l928_c7_ea25_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l928_c7_ea25_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l928_c7_ea25
result_is_sp_shift_MUX_uxn_opcodes_h_l928_c7_ea25 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l928_c7_ea25_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l928_c7_ea25_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l928_c7_ea25_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l928_c7_ea25_return_output);

-- result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l928_c7_ea25
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l928_c7_ea25 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l928_c7_ea25_cond,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l928_c7_ea25_iftrue,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l928_c7_ea25_iffalse,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l928_c7_ea25_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l928_c7_ea25
result_is_opc_done_MUX_uxn_opcodes_h_l928_c7_ea25 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l928_c7_ea25_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l928_c7_ea25_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l928_c7_ea25_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l928_c7_ea25_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l928_c7_ea25
result_u8_value_MUX_uxn_opcodes_h_l928_c7_ea25 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l928_c7_ea25_cond,
result_u8_value_MUX_uxn_opcodes_h_l928_c7_ea25_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l928_c7_ea25_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l928_c7_ea25_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l928_c7_ea25
result_sp_relative_shift_MUX_uxn_opcodes_h_l928_c7_ea25 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l928_c7_ea25_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l928_c7_ea25_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l928_c7_ea25_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l928_c7_ea25_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l928_c7_ea25
result_is_stack_write_MUX_uxn_opcodes_h_l928_c7_ea25 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l928_c7_ea25_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l928_c7_ea25_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l928_c7_ea25_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l928_c7_ea25_return_output);

-- t8_MUX_uxn_opcodes_h_l928_c7_ea25
t8_MUX_uxn_opcodes_h_l928_c7_ea25 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l928_c7_ea25_cond,
t8_MUX_uxn_opcodes_h_l928_c7_ea25_iftrue,
t8_MUX_uxn_opcodes_h_l928_c7_ea25_iffalse,
t8_MUX_uxn_opcodes_h_l928_c7_ea25_return_output);

-- n8_MUX_uxn_opcodes_h_l928_c7_ea25
n8_MUX_uxn_opcodes_h_l928_c7_ea25 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l928_c7_ea25_cond,
n8_MUX_uxn_opcodes_h_l928_c7_ea25_iftrue,
n8_MUX_uxn_opcodes_h_l928_c7_ea25_iffalse,
n8_MUX_uxn_opcodes_h_l928_c7_ea25_return_output);

-- sp_relative_shift_uxn_opcodes_h_l931_c30_322d
sp_relative_shift_uxn_opcodes_h_l931_c30_322d : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l931_c30_322d_ins,
sp_relative_shift_uxn_opcodes_h_l931_c30_322d_x,
sp_relative_shift_uxn_opcodes_h_l931_c30_322d_y,
sp_relative_shift_uxn_opcodes_h_l931_c30_322d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l933_c11_4d4d
BIN_OP_EQ_uxn_opcodes_h_l933_c11_4d4d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l933_c11_4d4d_left,
BIN_OP_EQ_uxn_opcodes_h_l933_c11_4d4d_right,
BIN_OP_EQ_uxn_opcodes_h_l933_c11_4d4d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l933_c7_5f2d
result_is_sp_shift_MUX_uxn_opcodes_h_l933_c7_5f2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l933_c7_5f2d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l933_c7_5f2d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l933_c7_5f2d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l933_c7_5f2d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l933_c7_5f2d
result_is_opc_done_MUX_uxn_opcodes_h_l933_c7_5f2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l933_c7_5f2d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l933_c7_5f2d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l933_c7_5f2d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l933_c7_5f2d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l933_c7_5f2d
result_u8_value_MUX_uxn_opcodes_h_l933_c7_5f2d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l933_c7_5f2d_cond,
result_u8_value_MUX_uxn_opcodes_h_l933_c7_5f2d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l933_c7_5f2d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l933_c7_5f2d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l933_c7_5f2d
result_is_stack_write_MUX_uxn_opcodes_h_l933_c7_5f2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l933_c7_5f2d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l933_c7_5f2d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l933_c7_5f2d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l933_c7_5f2d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l933_c7_5f2d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l933_c7_5f2d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l933_c7_5f2d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l933_c7_5f2d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l933_c7_5f2d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l933_c7_5f2d_return_output);

-- t8_MUX_uxn_opcodes_h_l933_c7_5f2d
t8_MUX_uxn_opcodes_h_l933_c7_5f2d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l933_c7_5f2d_cond,
t8_MUX_uxn_opcodes_h_l933_c7_5f2d_iftrue,
t8_MUX_uxn_opcodes_h_l933_c7_5f2d_iffalse,
t8_MUX_uxn_opcodes_h_l933_c7_5f2d_return_output);

-- n8_MUX_uxn_opcodes_h_l933_c7_5f2d
n8_MUX_uxn_opcodes_h_l933_c7_5f2d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l933_c7_5f2d_cond,
n8_MUX_uxn_opcodes_h_l933_c7_5f2d_iftrue,
n8_MUX_uxn_opcodes_h_l933_c7_5f2d_iffalse,
n8_MUX_uxn_opcodes_h_l933_c7_5f2d_return_output);

-- CONST_SR_8_uxn_opcodes_h_l935_c18_3d0e
CONST_SR_8_uxn_opcodes_h_l935_c18_3d0e : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l935_c18_3d0e_x,
CONST_SR_8_uxn_opcodes_h_l935_c18_3d0e_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l939_c21_655b
BIN_OP_OR_uxn_opcodes_h_l939_c21_655b : entity work.BIN_OP_OR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l939_c21_655b_left,
BIN_OP_OR_uxn_opcodes_h_l939_c21_655b_right,
BIN_OP_OR_uxn_opcodes_h_l939_c21_655b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l941_c11_7f8b
BIN_OP_EQ_uxn_opcodes_h_l941_c11_7f8b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l941_c11_7f8b_left,
BIN_OP_EQ_uxn_opcodes_h_l941_c11_7f8b_right,
BIN_OP_EQ_uxn_opcodes_h_l941_c11_7f8b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l941_c7_199c
result_is_opc_done_MUX_uxn_opcodes_h_l941_c7_199c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l941_c7_199c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l941_c7_199c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l941_c7_199c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l941_c7_199c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l941_c7_199c
result_is_stack_write_MUX_uxn_opcodes_h_l941_c7_199c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l941_c7_199c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l941_c7_199c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l941_c7_199c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l941_c7_199c_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l920_c6_e329_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c2_f872_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l920_c2_f872_return_output,
 result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l920_c2_f872_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l920_c2_f872_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l920_c2_f872_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c2_f872_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l920_c2_f872_return_output,
 t8_MUX_uxn_opcodes_h_l920_c2_f872_return_output,
 n8_MUX_uxn_opcodes_h_l920_c2_f872_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l928_c11_51b3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l928_c7_ea25_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l928_c7_ea25_return_output,
 result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l928_c7_ea25_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l928_c7_ea25_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l928_c7_ea25_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l928_c7_ea25_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l928_c7_ea25_return_output,
 t8_MUX_uxn_opcodes_h_l928_c7_ea25_return_output,
 n8_MUX_uxn_opcodes_h_l928_c7_ea25_return_output,
 sp_relative_shift_uxn_opcodes_h_l931_c30_322d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l933_c11_4d4d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l933_c7_5f2d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l933_c7_5f2d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l933_c7_5f2d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l933_c7_5f2d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l933_c7_5f2d_return_output,
 t8_MUX_uxn_opcodes_h_l933_c7_5f2d_return_output,
 n8_MUX_uxn_opcodes_h_l933_c7_5f2d_return_output,
 CONST_SR_8_uxn_opcodes_h_l935_c18_3d0e_return_output,
 BIN_OP_OR_uxn_opcodes_h_l939_c21_655b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l941_c11_7f8b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l941_c7_199c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l941_c7_199c_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c6_e329_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c6_e329_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c6_e329_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c2_f872_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l925_c3_0121 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c2_f872_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l928_c7_ea25_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c2_f872_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c2_f872_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l920_c2_f872_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l920_c2_f872_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l928_c7_ea25_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l920_c2_f872_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l920_c2_f872_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l920_c2_f872_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l920_c2_f872_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l928_c7_ea25_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l920_c2_f872_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l920_c2_f872_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l920_c2_f872_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l920_c2_f872_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l928_c7_ea25_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l920_c2_f872_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l920_c2_f872_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l920_c2_f872_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l920_c2_f872_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l928_c7_ea25_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l920_c2_f872_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l920_c2_f872_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c2_f872_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c2_f872_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l928_c7_ea25_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c2_f872_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c2_f872_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l920_c2_f872_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l920_c2_f872_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l928_c7_ea25_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l920_c2_f872_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l920_c2_f872_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l920_c2_f872_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l920_c2_f872_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l928_c7_ea25_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l920_c2_f872_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l920_c2_f872_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l920_c2_f872_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l920_c2_f872_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l928_c7_ea25_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l920_c2_f872_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l920_c2_f872_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l928_c11_51b3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l928_c11_51b3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l928_c11_51b3_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l928_c7_ea25_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l928_c7_ea25_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l933_c7_5f2d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l928_c7_ea25_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l928_c7_ea25_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l928_c7_ea25_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l933_c7_5f2d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l928_c7_ea25_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l928_c7_ea25_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l928_c7_ea25_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l928_c7_ea25_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l928_c7_ea25_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l928_c7_ea25_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l928_c7_ea25_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l933_c7_5f2d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l928_c7_ea25_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l928_c7_ea25_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l928_c7_ea25_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l933_c7_5f2d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l928_c7_ea25_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l928_c7_ea25_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l928_c7_ea25_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l928_c7_ea25_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l928_c7_ea25_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l928_c7_ea25_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l933_c7_5f2d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l928_c7_ea25_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l928_c7_ea25_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l928_c7_ea25_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l933_c7_5f2d_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l928_c7_ea25_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l928_c7_ea25_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l928_c7_ea25_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l933_c7_5f2d_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l928_c7_ea25_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l931_c30_322d_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l931_c30_322d_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l931_c30_322d_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l931_c30_322d_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l933_c11_4d4d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l933_c11_4d4d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l933_c11_4d4d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l933_c7_5f2d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l933_c7_5f2d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l933_c7_5f2d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l933_c7_5f2d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l933_c7_5f2d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l941_c7_199c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l933_c7_5f2d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l933_c7_5f2d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l933_c7_5f2d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l933_c7_5f2d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l933_c7_5f2d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l933_c7_5f2d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l941_c7_199c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l933_c7_5f2d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l933_c7_5f2d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l938_c3_487c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l933_c7_5f2d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l933_c7_5f2d_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l933_c7_5f2d_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l933_c7_5f2d_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l933_c7_5f2d_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l933_c7_5f2d_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l933_c7_5f2d_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l933_c7_5f2d_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l934_c8_ae3d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l935_c18_3d0e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l935_c18_3d0e_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l935_c8_42e3_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l939_c21_655b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l939_c21_655b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l939_c21_655b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l941_c11_7f8b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l941_c11_7f8b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l941_c11_7f8b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l941_c7_199c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l941_c7_199c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l941_c7_199c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l941_c7_199c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l941_c7_199c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l941_c7_199c_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l933_l920_DUPLICATE_90ee_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l933_l928_l920_DUPLICATE_b0de_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l928_l920_DUPLICATE_efcf_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l941_l928_l920_DUPLICATE_2a8b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l933_l928_DUPLICATE_7156_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l933_l928_l941_DUPLICATE_2570_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9d9a_uxn_opcodes_h_l946_l916_DUPLICATE_0811_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l920_c2_f872_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l931_c30_322d_y := resize(to_signed(-1, 2), 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l941_c7_199c_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l928_c7_ea25_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l925_c3_0121 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c2_f872_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l925_c3_0121;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l941_c7_199c_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l933_c7_5f2d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c6_e329_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l928_c11_51b3_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l931_c30_322d_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l941_c11_7f8b_right := to_unsigned(3, 2);
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l928_c7_ea25_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l933_c11_4d4d_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l938_c3_487c := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l933_c7_5f2d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l938_c3_487c;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l920_c2_f872_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l933_c7_5f2d_iftrue := to_unsigned(1, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l931_c30_322d_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l920_c2_f872_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l928_c7_ea25_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l933_c7_5f2d_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c6_e329_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l928_c11_51b3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l933_c11_4d4d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l941_c11_7f8b_left := VAR_phase;
     VAR_CONST_SR_8_uxn_opcodes_h_l935_c18_3d0e_x := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l920_c2_f872_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l928_c7_ea25_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l933_c7_5f2d_iffalse := t8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l933_l928_l941_DUPLICATE_2570 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l933_l928_l941_DUPLICATE_2570_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l933_l928_DUPLICATE_7156 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l933_l928_DUPLICATE_7156_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l928_l920_DUPLICATE_efcf LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l928_l920_DUPLICATE_efcf_return_output := result.sp_relative_shift;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l934_c8_ae3d] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l934_c8_ae3d_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_previous_stack_read);

     -- result_is_stack_operation_16bit_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d[uxn_opcodes_h_l928_c7_ea25] LATENCY=0
     VAR_result_is_stack_operation_16bit_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l928_c7_ea25_return_output := result.is_stack_operation_16bit;

     -- BIN_OP_EQ[uxn_opcodes_h_l941_c11_7f8b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l941_c11_7f8b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l941_c11_7f8b_left;
     BIN_OP_EQ_uxn_opcodes_h_l941_c11_7f8b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l941_c11_7f8b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l941_c11_7f8b_return_output := BIN_OP_EQ_uxn_opcodes_h_l941_c11_7f8b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l933_l920_DUPLICATE_90ee LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l933_l920_DUPLICATE_90ee_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l920_c6_e329] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l920_c6_e329_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c6_e329_left;
     BIN_OP_EQ_uxn_opcodes_h_l920_c6_e329_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c6_e329_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c6_e329_return_output := BIN_OP_EQ_uxn_opcodes_h_l920_c6_e329_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l928_c11_51b3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l928_c11_51b3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l928_c11_51b3_left;
     BIN_OP_EQ_uxn_opcodes_h_l928_c11_51b3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l928_c11_51b3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l928_c11_51b3_return_output := BIN_OP_EQ_uxn_opcodes_h_l928_c11_51b3_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l935_c18_3d0e] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l935_c18_3d0e_x <= VAR_CONST_SR_8_uxn_opcodes_h_l935_c18_3d0e_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l935_c18_3d0e_return_output := CONST_SR_8_uxn_opcodes_h_l935_c18_3d0e_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l931_c30_322d] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l931_c30_322d_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l931_c30_322d_ins;
     sp_relative_shift_uxn_opcodes_h_l931_c30_322d_x <= VAR_sp_relative_shift_uxn_opcodes_h_l931_c30_322d_x;
     sp_relative_shift_uxn_opcodes_h_l931_c30_322d_y <= VAR_sp_relative_shift_uxn_opcodes_h_l931_c30_322d_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l931_c30_322d_return_output := sp_relative_shift_uxn_opcodes_h_l931_c30_322d_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l933_l928_l920_DUPLICATE_b0de LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l933_l928_l920_DUPLICATE_b0de_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l933_c11_4d4d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l933_c11_4d4d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l933_c11_4d4d_left;
     BIN_OP_EQ_uxn_opcodes_h_l933_c11_4d4d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l933_c11_4d4d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l933_c11_4d4d_return_output := BIN_OP_EQ_uxn_opcodes_h_l933_c11_4d4d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l941_l928_l920_DUPLICATE_2a8b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l941_l928_l920_DUPLICATE_2a8b_return_output := result.is_stack_write;

     -- Submodule level 1
     VAR_n8_MUX_uxn_opcodes_h_l920_c2_f872_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c6_e329_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l920_c2_f872_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c6_e329_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l920_c2_f872_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c6_e329_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l920_c2_f872_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c6_e329_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l920_c2_f872_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c6_e329_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c2_f872_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c6_e329_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c2_f872_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c6_e329_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l920_c2_f872_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c6_e329_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l920_c2_f872_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c6_e329_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l928_c7_ea25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l928_c11_51b3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l928_c7_ea25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l928_c11_51b3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l928_c7_ea25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l928_c11_51b3_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l928_c7_ea25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l928_c11_51b3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l928_c7_ea25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l928_c11_51b3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l928_c7_ea25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l928_c11_51b3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l928_c7_ea25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l928_c11_51b3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l928_c7_ea25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l928_c11_51b3_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l928_c7_ea25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l928_c11_51b3_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l933_c7_5f2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l933_c11_4d4d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l933_c7_5f2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l933_c11_4d4d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l933_c7_5f2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l933_c11_4d4d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l933_c7_5f2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l933_c11_4d4d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l933_c7_5f2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l933_c11_4d4d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l933_c7_5f2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l933_c11_4d4d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l933_c7_5f2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l933_c11_4d4d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l941_c7_199c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l941_c11_7f8b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l941_c7_199c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l941_c11_7f8b_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l939_c21_655b_right := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l934_c8_ae3d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l933_c7_5f2d_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l934_c8_ae3d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c2_f872_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l928_l920_DUPLICATE_efcf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l928_c7_ea25_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l928_l920_DUPLICATE_efcf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l928_c7_ea25_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l933_l928_l941_DUPLICATE_2570_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l933_c7_5f2d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l933_l928_l941_DUPLICATE_2570_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l941_c7_199c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l933_l928_l941_DUPLICATE_2570_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l920_c2_f872_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l933_l920_DUPLICATE_90ee_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l933_c7_5f2d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l933_l920_DUPLICATE_90ee_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l920_c2_f872_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l941_l928_l920_DUPLICATE_2a8b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l928_c7_ea25_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l941_l928_l920_DUPLICATE_2a8b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l941_c7_199c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l941_l928_l920_DUPLICATE_2a8b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l928_c7_ea25_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l933_l928_DUPLICATE_7156_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l933_c7_5f2d_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l933_l928_DUPLICATE_7156_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l920_c2_f872_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l933_l928_l920_DUPLICATE_b0de_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l928_c7_ea25_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l933_l928_l920_DUPLICATE_b0de_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l933_c7_5f2d_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l933_l928_l920_DUPLICATE_b0de_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l928_c7_ea25_iffalse := VAR_result_is_stack_operation_16bit_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l928_c7_ea25_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l928_c7_ea25_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l931_c30_322d_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l933_c7_5f2d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l933_c7_5f2d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l933_c7_5f2d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l933_c7_5f2d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l933_c7_5f2d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l933_c7_5f2d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l933_c7_5f2d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l933_c7_5f2d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l933_c7_5f2d_return_output;

     -- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l928_c7_ea25] LATENCY=0
     -- Inputs
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l928_c7_ea25_cond <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l928_c7_ea25_cond;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l928_c7_ea25_iftrue <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l928_c7_ea25_iftrue;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l928_c7_ea25_iffalse <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l928_c7_ea25_iffalse;
     -- Outputs
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l928_c7_ea25_return_output := result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l928_c7_ea25_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l941_c7_199c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l941_c7_199c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l941_c7_199c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l941_c7_199c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l941_c7_199c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l941_c7_199c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l941_c7_199c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l941_c7_199c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l941_c7_199c_return_output;

     -- t8_MUX[uxn_opcodes_h_l933_c7_5f2d] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l933_c7_5f2d_cond <= VAR_t8_MUX_uxn_opcodes_h_l933_c7_5f2d_cond;
     t8_MUX_uxn_opcodes_h_l933_c7_5f2d_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l933_c7_5f2d_iftrue;
     t8_MUX_uxn_opcodes_h_l933_c7_5f2d_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l933_c7_5f2d_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l933_c7_5f2d_return_output := t8_MUX_uxn_opcodes_h_l933_c7_5f2d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l928_c7_ea25] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l928_c7_ea25_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l928_c7_ea25_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l928_c7_ea25_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l928_c7_ea25_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l928_c7_ea25_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l928_c7_ea25_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l928_c7_ea25_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l928_c7_ea25_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l935_c8_42e3] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l935_c8_42e3_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l935_c18_3d0e_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l941_c7_199c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l941_c7_199c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l941_c7_199c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l941_c7_199c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l941_c7_199c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l941_c7_199c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l941_c7_199c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l941_c7_199c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l941_c7_199c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l933_c7_5f2d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l933_c7_5f2d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l933_c7_5f2d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l933_c7_5f2d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l933_c7_5f2d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l933_c7_5f2d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l933_c7_5f2d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l933_c7_5f2d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l933_c7_5f2d_return_output;

     -- Submodule level 2
     VAR_BIN_OP_OR_uxn_opcodes_h_l939_c21_655b_left := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l935_c8_42e3_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l933_c7_5f2d_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l935_c8_42e3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l933_c7_5f2d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l941_c7_199c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l928_c7_ea25_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l933_c7_5f2d_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l920_c2_f872_iffalse := VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l928_c7_ea25_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l933_c7_5f2d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l941_c7_199c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c2_f872_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l928_c7_ea25_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l928_c7_ea25_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l933_c7_5f2d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l928_c7_ea25_iffalse := VAR_t8_MUX_uxn_opcodes_h_l933_c7_5f2d_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l928_c7_ea25] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l928_c7_ea25_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l928_c7_ea25_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l928_c7_ea25_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l928_c7_ea25_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l928_c7_ea25_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l928_c7_ea25_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l928_c7_ea25_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l928_c7_ea25_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l933_c7_5f2d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l933_c7_5f2d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l933_c7_5f2d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l933_c7_5f2d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l933_c7_5f2d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l933_c7_5f2d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l933_c7_5f2d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l933_c7_5f2d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l933_c7_5f2d_return_output;

     -- n8_MUX[uxn_opcodes_h_l933_c7_5f2d] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l933_c7_5f2d_cond <= VAR_n8_MUX_uxn_opcodes_h_l933_c7_5f2d_cond;
     n8_MUX_uxn_opcodes_h_l933_c7_5f2d_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l933_c7_5f2d_iftrue;
     n8_MUX_uxn_opcodes_h_l933_c7_5f2d_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l933_c7_5f2d_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l933_c7_5f2d_return_output := n8_MUX_uxn_opcodes_h_l933_c7_5f2d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l933_c7_5f2d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l933_c7_5f2d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l933_c7_5f2d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l933_c7_5f2d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l933_c7_5f2d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l933_c7_5f2d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l933_c7_5f2d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l933_c7_5f2d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l933_c7_5f2d_return_output;

     -- t8_MUX[uxn_opcodes_h_l928_c7_ea25] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l928_c7_ea25_cond <= VAR_t8_MUX_uxn_opcodes_h_l928_c7_ea25_cond;
     t8_MUX_uxn_opcodes_h_l928_c7_ea25_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l928_c7_ea25_iftrue;
     t8_MUX_uxn_opcodes_h_l928_c7_ea25_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l928_c7_ea25_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l928_c7_ea25_return_output := t8_MUX_uxn_opcodes_h_l928_c7_ea25_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l928_c7_ea25] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l928_c7_ea25_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l928_c7_ea25_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l928_c7_ea25_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l928_c7_ea25_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l928_c7_ea25_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l928_c7_ea25_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l928_c7_ea25_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l928_c7_ea25_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l920_c2_f872] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c2_f872_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c2_f872_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c2_f872_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c2_f872_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c2_f872_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c2_f872_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c2_f872_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c2_f872_return_output;

     -- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l920_c2_f872] LATENCY=0
     -- Inputs
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l920_c2_f872_cond <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l920_c2_f872_cond;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l920_c2_f872_iftrue <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l920_c2_f872_iftrue;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l920_c2_f872_iffalse <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l920_c2_f872_iffalse;
     -- Outputs
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l920_c2_f872_return_output := result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l920_c2_f872_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l939_c21_655b] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l939_c21_655b_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l939_c21_655b_left;
     BIN_OP_OR_uxn_opcodes_h_l939_c21_655b_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l939_c21_655b_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l939_c21_655b_return_output := BIN_OP_OR_uxn_opcodes_h_l939_c21_655b_return_output;

     -- Submodule level 3
     VAR_result_u8_value_MUX_uxn_opcodes_h_l933_c7_5f2d_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l939_c21_655b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l928_c7_ea25_iffalse := VAR_n8_MUX_uxn_opcodes_h_l933_c7_5f2d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l928_c7_ea25_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l933_c7_5f2d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l920_c2_f872_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l928_c7_ea25_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l928_c7_ea25_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l933_c7_5f2d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c2_f872_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l928_c7_ea25_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l920_c2_f872_iffalse := VAR_t8_MUX_uxn_opcodes_h_l928_c7_ea25_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l933_c7_5f2d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l933_c7_5f2d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l933_c7_5f2d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l933_c7_5f2d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l933_c7_5f2d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l933_c7_5f2d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l933_c7_5f2d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l933_c7_5f2d_return_output := result_u8_value_MUX_uxn_opcodes_h_l933_c7_5f2d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l928_c7_ea25] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l928_c7_ea25_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l928_c7_ea25_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l928_c7_ea25_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l928_c7_ea25_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l928_c7_ea25_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l928_c7_ea25_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l928_c7_ea25_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l928_c7_ea25_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l920_c2_f872] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c2_f872_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c2_f872_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c2_f872_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c2_f872_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c2_f872_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c2_f872_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c2_f872_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c2_f872_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l928_c7_ea25] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l928_c7_ea25_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l928_c7_ea25_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l928_c7_ea25_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l928_c7_ea25_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l928_c7_ea25_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l928_c7_ea25_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l928_c7_ea25_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l928_c7_ea25_return_output;

     -- t8_MUX[uxn_opcodes_h_l920_c2_f872] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l920_c2_f872_cond <= VAR_t8_MUX_uxn_opcodes_h_l920_c2_f872_cond;
     t8_MUX_uxn_opcodes_h_l920_c2_f872_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l920_c2_f872_iftrue;
     t8_MUX_uxn_opcodes_h_l920_c2_f872_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l920_c2_f872_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l920_c2_f872_return_output := t8_MUX_uxn_opcodes_h_l920_c2_f872_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l920_c2_f872] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l920_c2_f872_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l920_c2_f872_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l920_c2_f872_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l920_c2_f872_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l920_c2_f872_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l920_c2_f872_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l920_c2_f872_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l920_c2_f872_return_output;

     -- n8_MUX[uxn_opcodes_h_l928_c7_ea25] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l928_c7_ea25_cond <= VAR_n8_MUX_uxn_opcodes_h_l928_c7_ea25_cond;
     n8_MUX_uxn_opcodes_h_l928_c7_ea25_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l928_c7_ea25_iftrue;
     n8_MUX_uxn_opcodes_h_l928_c7_ea25_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l928_c7_ea25_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l928_c7_ea25_return_output := n8_MUX_uxn_opcodes_h_l928_c7_ea25_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l920_c2_f872_iffalse := VAR_n8_MUX_uxn_opcodes_h_l928_c7_ea25_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l920_c2_f872_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l928_c7_ea25_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l920_c2_f872_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l928_c7_ea25_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l928_c7_ea25_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l933_c7_5f2d_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l920_c2_f872_return_output;
     -- n8_MUX[uxn_opcodes_h_l920_c2_f872] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l920_c2_f872_cond <= VAR_n8_MUX_uxn_opcodes_h_l920_c2_f872_cond;
     n8_MUX_uxn_opcodes_h_l920_c2_f872_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l920_c2_f872_iftrue;
     n8_MUX_uxn_opcodes_h_l920_c2_f872_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l920_c2_f872_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l920_c2_f872_return_output := n8_MUX_uxn_opcodes_h_l920_c2_f872_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l928_c7_ea25] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l928_c7_ea25_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l928_c7_ea25_cond;
     result_u8_value_MUX_uxn_opcodes_h_l928_c7_ea25_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l928_c7_ea25_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l928_c7_ea25_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l928_c7_ea25_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l928_c7_ea25_return_output := result_u8_value_MUX_uxn_opcodes_h_l928_c7_ea25_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l920_c2_f872] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l920_c2_f872_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l920_c2_f872_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l920_c2_f872_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l920_c2_f872_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l920_c2_f872_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l920_c2_f872_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l920_c2_f872_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l920_c2_f872_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l920_c2_f872] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l920_c2_f872_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l920_c2_f872_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l920_c2_f872_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l920_c2_f872_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l920_c2_f872_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l920_c2_f872_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l920_c2_f872_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l920_c2_f872_return_output;

     -- Submodule level 5
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l920_c2_f872_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l920_c2_f872_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l928_c7_ea25_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l920_c2_f872] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l920_c2_f872_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l920_c2_f872_cond;
     result_u8_value_MUX_uxn_opcodes_h_l920_c2_f872_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l920_c2_f872_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l920_c2_f872_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l920_c2_f872_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l920_c2_f872_return_output := result_u8_value_MUX_uxn_opcodes_h_l920_c2_f872_return_output;

     -- Submodule level 6
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_9d9a_uxn_opcodes_h_l946_l916_DUPLICATE_0811 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9d9a_uxn_opcodes_h_l946_l916_DUPLICATE_0811_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_9d9a(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c2_f872_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l920_c2_f872_return_output,
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l920_c2_f872_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l920_c2_f872_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l920_c2_f872_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c2_f872_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l920_c2_f872_return_output);

     -- Submodule level 7
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9d9a_uxn_opcodes_h_l946_l916_DUPLICATE_0811_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9d9a_uxn_opcodes_h_l946_l916_DUPLICATE_0811_return_output;
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
