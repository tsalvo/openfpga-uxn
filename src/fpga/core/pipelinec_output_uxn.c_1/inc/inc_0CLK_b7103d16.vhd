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
entity inc_0CLK_b7103d16 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end inc_0CLK_b7103d16;
architecture arch of inc_0CLK_b7103d16 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1402_c6_a673]
signal BIN_OP_EQ_uxn_opcodes_h_l1402_c6_a673_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1402_c6_a673_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1402_c6_a673_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1402_c1_6ef4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1402_c1_6ef4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1402_c1_6ef4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1402_c1_6ef4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1402_c1_6ef4_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1402_c2_e723]
signal t8_MUX_uxn_opcodes_h_l1402_c2_e723_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1402_c2_e723_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1402_c2_e723_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1402_c2_e723_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1402_c2_e723]
signal result_u8_value_MUX_uxn_opcodes_h_l1402_c2_e723_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1402_c2_e723_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1402_c2_e723_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1402_c2_e723_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1402_c2_e723]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1402_c2_e723_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1402_c2_e723_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1402_c2_e723_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1402_c2_e723_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1402_c2_e723]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c2_e723_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c2_e723_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c2_e723_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c2_e723_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1402_c2_e723]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1402_c2_e723_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1402_c2_e723_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1402_c2_e723_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1402_c2_e723_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1402_c2_e723]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c2_e723_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c2_e723_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c2_e723_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c2_e723_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1402_c2_e723]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c2_e723_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c2_e723_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c2_e723_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c2_e723_return_output : unsigned(3 downto 0);

-- printf_uxn_opcodes_h_l1403_c3_8984[uxn_opcodes_h_l1403_c3_8984]
signal printf_uxn_opcodes_h_l1403_c3_8984_uxn_opcodes_h_l1403_c3_8984_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1407_c11_99e6]
signal BIN_OP_EQ_uxn_opcodes_h_l1407_c11_99e6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1407_c11_99e6_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1407_c11_99e6_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1407_c7_44ca]
signal t8_MUX_uxn_opcodes_h_l1407_c7_44ca_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1407_c7_44ca_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1407_c7_44ca_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1407_c7_44ca_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1407_c7_44ca]
signal result_u8_value_MUX_uxn_opcodes_h_l1407_c7_44ca_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1407_c7_44ca_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1407_c7_44ca_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1407_c7_44ca_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1407_c7_44ca]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_44ca_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_44ca_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_44ca_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_44ca_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1407_c7_44ca]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_44ca_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_44ca_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_44ca_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_44ca_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1407_c7_44ca]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_44ca_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_44ca_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_44ca_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_44ca_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1407_c7_44ca]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_44ca_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_44ca_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_44ca_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_44ca_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1407_c7_44ca]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_44ca_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_44ca_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_44ca_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_44ca_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1410_c11_6224]
signal BIN_OP_EQ_uxn_opcodes_h_l1410_c11_6224_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1410_c11_6224_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1410_c11_6224_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1410_c7_5fd6]
signal t8_MUX_uxn_opcodes_h_l1410_c7_5fd6_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1410_c7_5fd6_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1410_c7_5fd6_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1410_c7_5fd6_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1410_c7_5fd6]
signal result_u8_value_MUX_uxn_opcodes_h_l1410_c7_5fd6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1410_c7_5fd6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1410_c7_5fd6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1410_c7_5fd6_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1410_c7_5fd6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_5fd6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_5fd6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_5fd6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_5fd6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1410_c7_5fd6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_5fd6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_5fd6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_5fd6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_5fd6_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1410_c7_5fd6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_5fd6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_5fd6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_5fd6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_5fd6_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1410_c7_5fd6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_5fd6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_5fd6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_5fd6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_5fd6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1410_c7_5fd6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_5fd6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_5fd6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_5fd6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_5fd6_return_output : unsigned(3 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1413_c30_2659]
signal sp_relative_shift_uxn_opcodes_h_l1413_c30_2659_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1413_c30_2659_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1413_c30_2659_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1413_c30_2659_return_output : signed(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1416_c21_2503]
signal BIN_OP_PLUS_uxn_opcodes_h_l1416_c21_2503_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1416_c21_2503_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1416_c21_2503_return_output : unsigned(8 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1418_c11_5133]
signal BIN_OP_EQ_uxn_opcodes_h_l1418_c11_5133_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1418_c11_5133_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1418_c11_5133_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1418_c7_c502]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_c502_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_c502_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_c502_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_c502_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1418_c7_c502]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_c502_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_c502_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_c502_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_c502_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1418_c7_c502]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_c502_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_c502_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_c502_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_c502_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_25e8( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u8_value := ref_toks_1;
      base.is_opc_done := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_sp_shift := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1402_c6_a673
BIN_OP_EQ_uxn_opcodes_h_l1402_c6_a673 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1402_c6_a673_left,
BIN_OP_EQ_uxn_opcodes_h_l1402_c6_a673_right,
BIN_OP_EQ_uxn_opcodes_h_l1402_c6_a673_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1402_c1_6ef4
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1402_c1_6ef4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1402_c1_6ef4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1402_c1_6ef4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1402_c1_6ef4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1402_c1_6ef4_return_output);

-- t8_MUX_uxn_opcodes_h_l1402_c2_e723
t8_MUX_uxn_opcodes_h_l1402_c2_e723 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1402_c2_e723_cond,
t8_MUX_uxn_opcodes_h_l1402_c2_e723_iftrue,
t8_MUX_uxn_opcodes_h_l1402_c2_e723_iffalse,
t8_MUX_uxn_opcodes_h_l1402_c2_e723_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1402_c2_e723
result_u8_value_MUX_uxn_opcodes_h_l1402_c2_e723 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1402_c2_e723_cond,
result_u8_value_MUX_uxn_opcodes_h_l1402_c2_e723_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1402_c2_e723_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1402_c2_e723_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1402_c2_e723
result_is_opc_done_MUX_uxn_opcodes_h_l1402_c2_e723 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1402_c2_e723_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1402_c2_e723_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1402_c2_e723_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1402_c2_e723_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c2_e723
result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c2_e723 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c2_e723_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c2_e723_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c2_e723_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c2_e723_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1402_c2_e723
result_is_stack_write_MUX_uxn_opcodes_h_l1402_c2_e723 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1402_c2_e723_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1402_c2_e723_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1402_c2_e723_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1402_c2_e723_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c2_e723
result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c2_e723 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c2_e723_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c2_e723_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c2_e723_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c2_e723_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c2_e723
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c2_e723 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c2_e723_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c2_e723_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c2_e723_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c2_e723_return_output);

-- printf_uxn_opcodes_h_l1403_c3_8984_uxn_opcodes_h_l1403_c3_8984
printf_uxn_opcodes_h_l1403_c3_8984_uxn_opcodes_h_l1403_c3_8984 : entity work.printf_uxn_opcodes_h_l1403_c3_8984_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1403_c3_8984_uxn_opcodes_h_l1403_c3_8984_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1407_c11_99e6
BIN_OP_EQ_uxn_opcodes_h_l1407_c11_99e6 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1407_c11_99e6_left,
BIN_OP_EQ_uxn_opcodes_h_l1407_c11_99e6_right,
BIN_OP_EQ_uxn_opcodes_h_l1407_c11_99e6_return_output);

-- t8_MUX_uxn_opcodes_h_l1407_c7_44ca
t8_MUX_uxn_opcodes_h_l1407_c7_44ca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1407_c7_44ca_cond,
t8_MUX_uxn_opcodes_h_l1407_c7_44ca_iftrue,
t8_MUX_uxn_opcodes_h_l1407_c7_44ca_iffalse,
t8_MUX_uxn_opcodes_h_l1407_c7_44ca_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1407_c7_44ca
result_u8_value_MUX_uxn_opcodes_h_l1407_c7_44ca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1407_c7_44ca_cond,
result_u8_value_MUX_uxn_opcodes_h_l1407_c7_44ca_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1407_c7_44ca_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1407_c7_44ca_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_44ca
result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_44ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_44ca_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_44ca_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_44ca_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_44ca_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_44ca
result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_44ca : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_44ca_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_44ca_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_44ca_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_44ca_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_44ca
result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_44ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_44ca_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_44ca_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_44ca_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_44ca_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_44ca
result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_44ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_44ca_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_44ca_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_44ca_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_44ca_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_44ca
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_44ca : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_44ca_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_44ca_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_44ca_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_44ca_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1410_c11_6224
BIN_OP_EQ_uxn_opcodes_h_l1410_c11_6224 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1410_c11_6224_left,
BIN_OP_EQ_uxn_opcodes_h_l1410_c11_6224_right,
BIN_OP_EQ_uxn_opcodes_h_l1410_c11_6224_return_output);

-- t8_MUX_uxn_opcodes_h_l1410_c7_5fd6
t8_MUX_uxn_opcodes_h_l1410_c7_5fd6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1410_c7_5fd6_cond,
t8_MUX_uxn_opcodes_h_l1410_c7_5fd6_iftrue,
t8_MUX_uxn_opcodes_h_l1410_c7_5fd6_iffalse,
t8_MUX_uxn_opcodes_h_l1410_c7_5fd6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1410_c7_5fd6
result_u8_value_MUX_uxn_opcodes_h_l1410_c7_5fd6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1410_c7_5fd6_cond,
result_u8_value_MUX_uxn_opcodes_h_l1410_c7_5fd6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1410_c7_5fd6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1410_c7_5fd6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_5fd6
result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_5fd6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_5fd6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_5fd6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_5fd6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_5fd6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_5fd6
result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_5fd6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_5fd6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_5fd6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_5fd6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_5fd6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_5fd6
result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_5fd6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_5fd6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_5fd6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_5fd6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_5fd6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_5fd6
result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_5fd6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_5fd6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_5fd6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_5fd6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_5fd6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_5fd6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_5fd6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_5fd6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_5fd6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_5fd6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_5fd6_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1413_c30_2659
sp_relative_shift_uxn_opcodes_h_l1413_c30_2659 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1413_c30_2659_ins,
sp_relative_shift_uxn_opcodes_h_l1413_c30_2659_x,
sp_relative_shift_uxn_opcodes_h_l1413_c30_2659_y,
sp_relative_shift_uxn_opcodes_h_l1413_c30_2659_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1416_c21_2503
BIN_OP_PLUS_uxn_opcodes_h_l1416_c21_2503 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1416_c21_2503_left,
BIN_OP_PLUS_uxn_opcodes_h_l1416_c21_2503_right,
BIN_OP_PLUS_uxn_opcodes_h_l1416_c21_2503_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1418_c11_5133
BIN_OP_EQ_uxn_opcodes_h_l1418_c11_5133 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1418_c11_5133_left,
BIN_OP_EQ_uxn_opcodes_h_l1418_c11_5133_right,
BIN_OP_EQ_uxn_opcodes_h_l1418_c11_5133_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_c502
result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_c502 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_c502_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_c502_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_c502_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_c502_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_c502
result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_c502 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_c502_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_c502_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_c502_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_c502_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_c502
result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_c502 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_c502_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_c502_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_c502_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_c502_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1402_c6_a673_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1402_c1_6ef4_return_output,
 t8_MUX_uxn_opcodes_h_l1402_c2_e723_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1402_c2_e723_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1402_c2_e723_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c2_e723_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1402_c2_e723_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c2_e723_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c2_e723_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1407_c11_99e6_return_output,
 t8_MUX_uxn_opcodes_h_l1407_c7_44ca_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1407_c7_44ca_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_44ca_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_44ca_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_44ca_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_44ca_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_44ca_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1410_c11_6224_return_output,
 t8_MUX_uxn_opcodes_h_l1410_c7_5fd6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1410_c7_5fd6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_5fd6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_5fd6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_5fd6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_5fd6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_5fd6_return_output,
 sp_relative_shift_uxn_opcodes_h_l1413_c30_2659_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1416_c21_2503_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1418_c11_5133_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_c502_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_c502_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_c502_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1402_c6_a673_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1402_c6_a673_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1402_c6_a673_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1402_c1_6ef4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1402_c1_6ef4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1402_c1_6ef4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1402_c1_6ef4_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1402_c2_e723_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1402_c2_e723_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1407_c7_44ca_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1402_c2_e723_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1402_c2_e723_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1402_c2_e723_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1402_c2_e723_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_44ca_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1402_c2_e723_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1402_c2_e723_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1402_c2_e723_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1402_c2_e723_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_44ca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1402_c2_e723_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1402_c2_e723_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c2_e723_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c2_e723_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_44ca_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c2_e723_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c2_e723_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1402_c2_e723_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1402_c2_e723_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_44ca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1402_c2_e723_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1402_c2_e723_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c2_e723_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c2_e723_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_44ca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c2_e723_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c2_e723_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c2_e723_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1404_c3_08d3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c2_e723_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_44ca_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c2_e723_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c2_e723_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1403_c3_8984_uxn_opcodes_h_l1403_c3_8984_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_99e6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_99e6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_99e6_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1407_c7_44ca_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1407_c7_44ca_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1410_c7_5fd6_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1407_c7_44ca_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_44ca_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_44ca_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_5fd6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_44ca_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_44ca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_44ca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_5fd6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_44ca_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_44ca_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_44ca_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_5fd6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_44ca_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_44ca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_44ca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_5fd6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_44ca_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_44ca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_44ca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_5fd6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_44ca_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_44ca_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1408_c3_c8c6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_44ca_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_5fd6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_44ca_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_6224_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_6224_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_6224_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1410_c7_5fd6_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1410_c7_5fd6_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1410_c7_5fd6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_5fd6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_uxn_opcodes_h_l1416_c3_ac4f : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_5fd6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_5fd6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_5fd6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_5fd6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_c502_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_5fd6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_5fd6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_5fd6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_5fd6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_5fd6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_5fd6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_c502_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_5fd6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_5fd6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_5fd6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_c502_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_5fd6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_5fd6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1415_c3_0b4f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_5fd6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1410_c7_5fd6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_5fd6_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1413_c30_2659_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1413_c30_2659_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1413_c30_2659_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1413_c30_2659_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1416_c21_2503_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1416_c21_2503_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1416_c21_2503_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1418_c11_5133_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1418_c11_5133_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1418_c11_5133_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_c502_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_c502_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_c502_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_c502_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_c502_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_c502_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_c502_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_c502_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_c502_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1407_l1410_l1402_DUPLICATE_8f35_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1407_l1410_l1402_DUPLICATE_f40f_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1418_l1407_l1402_DUPLICATE_f59c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1418_l1407_l1402_DUPLICATE_6584_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1418_l1407_l1410_DUPLICATE_3994_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l1398_l1424_DUPLICATE_8c7e_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1408_c3_c8c6 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_44ca_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1408_c3_c8c6;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1415_c3_0b4f := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_5fd6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1415_c3_0b4f;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1416_c21_2503_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_c502_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_6224_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1402_c6_a673_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_5fd6_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1402_c1_6ef4_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1418_c11_5133_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_99e6_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1404_c3_08d3 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c2_e723_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1404_c3_08d3;
     VAR_sp_relative_shift_uxn_opcodes_h_l1413_c30_2659_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_c502_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1402_c2_e723_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1413_c30_2659_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_c502_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_5fd6_iftrue := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1402_c1_6ef4_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1413_c30_2659_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1402_c6_a673_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_99e6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_6224_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1418_c11_5133_left := VAR_phase;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1416_c21_2503_left := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1410_c7_5fd6_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1402_c2_e723_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1407_c7_44ca_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1410_c7_5fd6_iffalse := t8;
     -- BIN_OP_PLUS[uxn_opcodes_h_l1416_c21_2503] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1416_c21_2503_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1416_c21_2503_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1416_c21_2503_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1416_c21_2503_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1416_c21_2503_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1416_c21_2503_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1407_l1410_l1402_DUPLICATE_8f35 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1407_l1410_l1402_DUPLICATE_8f35_return_output := result.u8_value;

     -- sp_relative_shift[uxn_opcodes_h_l1413_c30_2659] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1413_c30_2659_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1413_c30_2659_ins;
     sp_relative_shift_uxn_opcodes_h_l1413_c30_2659_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1413_c30_2659_x;
     sp_relative_shift_uxn_opcodes_h_l1413_c30_2659_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1413_c30_2659_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1413_c30_2659_return_output := sp_relative_shift_uxn_opcodes_h_l1413_c30_2659_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1418_l1407_l1402_DUPLICATE_6584 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1418_l1407_l1402_DUPLICATE_6584_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1410_c11_6224] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1410_c11_6224_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_6224_left;
     BIN_OP_EQ_uxn_opcodes_h_l1410_c11_6224_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_6224_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_6224_return_output := BIN_OP_EQ_uxn_opcodes_h_l1410_c11_6224_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1418_l1407_l1402_DUPLICATE_f59c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1418_l1407_l1402_DUPLICATE_f59c_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1402_c6_a673] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1402_c6_a673_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1402_c6_a673_left;
     BIN_OP_EQ_uxn_opcodes_h_l1402_c6_a673_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1402_c6_a673_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1402_c6_a673_return_output := BIN_OP_EQ_uxn_opcodes_h_l1402_c6_a673_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1410_c7_5fd6] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1410_c7_5fd6_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1407_c11_99e6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1407_c11_99e6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_99e6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1407_c11_99e6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_99e6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_99e6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1407_c11_99e6_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1407_l1410_l1402_DUPLICATE_f40f LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1407_l1410_l1402_DUPLICATE_f40f_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1418_l1407_l1410_DUPLICATE_3994 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1418_l1407_l1410_DUPLICATE_3994_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1418_c11_5133] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1418_c11_5133_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1418_c11_5133_left;
     BIN_OP_EQ_uxn_opcodes_h_l1418_c11_5133_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1418_c11_5133_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1418_c11_5133_return_output := BIN_OP_EQ_uxn_opcodes_h_l1418_c11_5133_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1402_c1_6ef4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1402_c6_a673_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1402_c2_e723_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1402_c6_a673_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c2_e723_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1402_c6_a673_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1402_c2_e723_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1402_c6_a673_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c2_e723_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1402_c6_a673_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c2_e723_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1402_c6_a673_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1402_c2_e723_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1402_c6_a673_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1402_c2_e723_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1402_c6_a673_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_44ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_99e6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_44ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_99e6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_44ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_99e6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_44ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_99e6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_44ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_99e6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_44ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_99e6_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1407_c7_44ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_99e6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_5fd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_6224_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_5fd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_6224_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_5fd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_6224_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_5fd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_6224_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_5fd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_6224_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_5fd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_6224_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1410_c7_5fd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_6224_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_c502_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1418_c11_5133_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_c502_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1418_c11_5133_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_c502_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1418_c11_5133_return_output;
     VAR_result_u8_value_uxn_opcodes_h_l1416_c3_ac4f := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1416_c21_2503_return_output, 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c2_e723_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1407_l1410_l1402_DUPLICATE_f40f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_44ca_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1407_l1410_l1402_DUPLICATE_f40f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_5fd6_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1407_l1410_l1402_DUPLICATE_f40f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_44ca_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1418_l1407_l1410_DUPLICATE_3994_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_5fd6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1418_l1407_l1410_DUPLICATE_3994_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_c502_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1418_l1407_l1410_DUPLICATE_3994_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c2_e723_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1418_l1407_l1402_DUPLICATE_6584_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_44ca_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1418_l1407_l1402_DUPLICATE_6584_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_c502_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1418_l1407_l1402_DUPLICATE_6584_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1402_c2_e723_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1418_l1407_l1402_DUPLICATE_f59c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_44ca_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1418_l1407_l1402_DUPLICATE_f59c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_c502_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1418_l1407_l1402_DUPLICATE_f59c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1402_c2_e723_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1407_l1410_l1402_DUPLICATE_8f35_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_44ca_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1407_l1410_l1402_DUPLICATE_8f35_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_5fd6_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1407_l1410_l1402_DUPLICATE_8f35_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_5fd6_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1410_c7_5fd6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_5fd6_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1413_c30_2659_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_5fd6_iftrue := VAR_result_u8_value_uxn_opcodes_h_l1416_c3_ac4f;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1410_c7_5fd6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_5fd6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_5fd6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_5fd6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_5fd6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_5fd6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_5fd6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_5fd6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_5fd6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1410_c7_5fd6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_5fd6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_5fd6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_5fd6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_5fd6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_5fd6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_5fd6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_5fd6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_5fd6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1418_c7_c502] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_c502_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_c502_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_c502_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_c502_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_c502_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_c502_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_c502_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_c502_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1402_c1_6ef4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1402_c1_6ef4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1402_c1_6ef4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1402_c1_6ef4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1402_c1_6ef4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1402_c1_6ef4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1402_c1_6ef4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1402_c1_6ef4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1402_c1_6ef4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1418_c7_c502] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_c502_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_c502_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_c502_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_c502_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_c502_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_c502_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_c502_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_c502_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1418_c7_c502] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_c502_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_c502_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_c502_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_c502_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_c502_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_c502_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_c502_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_c502_return_output;

     -- t8_MUX[uxn_opcodes_h_l1410_c7_5fd6] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1410_c7_5fd6_cond <= VAR_t8_MUX_uxn_opcodes_h_l1410_c7_5fd6_cond;
     t8_MUX_uxn_opcodes_h_l1410_c7_5fd6_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1410_c7_5fd6_iftrue;
     t8_MUX_uxn_opcodes_h_l1410_c7_5fd6_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1410_c7_5fd6_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1410_c7_5fd6_return_output := t8_MUX_uxn_opcodes_h_l1410_c7_5fd6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1410_c7_5fd6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1410_c7_5fd6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_5fd6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1410_c7_5fd6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_5fd6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1410_c7_5fd6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_5fd6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_5fd6_return_output := result_u8_value_MUX_uxn_opcodes_h_l1410_c7_5fd6_return_output;

     -- Submodule level 2
     VAR_printf_uxn_opcodes_h_l1403_c3_8984_uxn_opcodes_h_l1403_c3_8984_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1402_c1_6ef4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_5fd6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_c502_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_5fd6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_c502_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_5fd6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_c502_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_44ca_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_5fd6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_44ca_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_5fd6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_44ca_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_5fd6_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1407_c7_44ca_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1410_c7_5fd6_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1407_c7_44ca] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_44ca_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_44ca_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_44ca_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_44ca_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_44ca_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_44ca_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_44ca_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_44ca_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1407_c7_44ca] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_44ca_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_44ca_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_44ca_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_44ca_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_44ca_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_44ca_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_44ca_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_44ca_return_output;

     -- t8_MUX[uxn_opcodes_h_l1407_c7_44ca] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1407_c7_44ca_cond <= VAR_t8_MUX_uxn_opcodes_h_l1407_c7_44ca_cond;
     t8_MUX_uxn_opcodes_h_l1407_c7_44ca_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1407_c7_44ca_iftrue;
     t8_MUX_uxn_opcodes_h_l1407_c7_44ca_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1407_c7_44ca_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1407_c7_44ca_return_output := t8_MUX_uxn_opcodes_h_l1407_c7_44ca_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1410_c7_5fd6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_5fd6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_5fd6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_5fd6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_5fd6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_5fd6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_5fd6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_5fd6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_5fd6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1407_c7_44ca] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1407_c7_44ca_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_44ca_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1407_c7_44ca_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_44ca_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1407_c7_44ca_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_44ca_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_44ca_return_output := result_u8_value_MUX_uxn_opcodes_h_l1407_c7_44ca_return_output;

     -- printf_uxn_opcodes_h_l1403_c3_8984[uxn_opcodes_h_l1403_c3_8984] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1403_c3_8984_uxn_opcodes_h_l1403_c3_8984_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1403_c3_8984_uxn_opcodes_h_l1403_c3_8984_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1410_c7_5fd6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_5fd6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_5fd6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_5fd6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_5fd6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_5fd6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_5fd6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_5fd6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_5fd6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1410_c7_5fd6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_5fd6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_5fd6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_5fd6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_5fd6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_5fd6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_5fd6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_5fd6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_5fd6_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_44ca_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_5fd6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_44ca_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_5fd6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_44ca_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_5fd6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c2_e723_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_44ca_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c2_e723_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_44ca_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1402_c2_e723_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_44ca_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1402_c2_e723_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1407_c7_44ca_return_output;
     -- t8_MUX[uxn_opcodes_h_l1402_c2_e723] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1402_c2_e723_cond <= VAR_t8_MUX_uxn_opcodes_h_l1402_c2_e723_cond;
     t8_MUX_uxn_opcodes_h_l1402_c2_e723_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1402_c2_e723_iftrue;
     t8_MUX_uxn_opcodes_h_l1402_c2_e723_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1402_c2_e723_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1402_c2_e723_return_output := t8_MUX_uxn_opcodes_h_l1402_c2_e723_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1402_c2_e723] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1402_c2_e723_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1402_c2_e723_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1402_c2_e723_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1402_c2_e723_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1402_c2_e723_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1402_c2_e723_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1402_c2_e723_return_output := result_u8_value_MUX_uxn_opcodes_h_l1402_c2_e723_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1407_c7_44ca] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_44ca_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_44ca_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_44ca_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_44ca_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_44ca_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_44ca_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_44ca_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_44ca_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1402_c2_e723] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c2_e723_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c2_e723_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c2_e723_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c2_e723_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c2_e723_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c2_e723_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c2_e723_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c2_e723_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1407_c7_44ca] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_44ca_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_44ca_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_44ca_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_44ca_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_44ca_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_44ca_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_44ca_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_44ca_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1407_c7_44ca] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_44ca_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_44ca_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_44ca_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_44ca_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_44ca_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_44ca_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_44ca_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_44ca_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1402_c2_e723] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c2_e723_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c2_e723_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c2_e723_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c2_e723_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c2_e723_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c2_e723_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c2_e723_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c2_e723_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1402_c2_e723_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_44ca_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c2_e723_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_44ca_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1402_c2_e723_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_44ca_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1402_c2_e723_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1402_c2_e723] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1402_c2_e723_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1402_c2_e723_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1402_c2_e723_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1402_c2_e723_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1402_c2_e723_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1402_c2_e723_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1402_c2_e723_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1402_c2_e723_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1402_c2_e723] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1402_c2_e723_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1402_c2_e723_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1402_c2_e723_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1402_c2_e723_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1402_c2_e723_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1402_c2_e723_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1402_c2_e723_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1402_c2_e723_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1402_c2_e723] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c2_e723_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c2_e723_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c2_e723_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c2_e723_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c2_e723_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c2_e723_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c2_e723_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c2_e723_return_output;

     -- Submodule level 5
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l1398_l1424_DUPLICATE_8c7e LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l1398_l1424_DUPLICATE_8c7e_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_25e8(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1402_c2_e723_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1402_c2_e723_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c2_e723_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1402_c2_e723_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c2_e723_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c2_e723_return_output);

     -- Submodule level 6
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l1398_l1424_DUPLICATE_8c7e_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l1398_l1424_DUPLICATE_8c7e_return_output;
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
