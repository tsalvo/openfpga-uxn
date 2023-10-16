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
-- BIN_OP_EQ[uxn_opcodes_h_l1402_c6_a90f]
signal BIN_OP_EQ_uxn_opcodes_h_l1402_c6_a90f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1402_c6_a90f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1402_c6_a90f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1402_c1_6c22]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1402_c1_6c22_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1402_c1_6c22_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1402_c1_6c22_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1402_c1_6c22_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1402_c2_ccf6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c2_ccf6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c2_ccf6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c2_ccf6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c2_ccf6_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1402_c2_ccf6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c2_ccf6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c2_ccf6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c2_ccf6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c2_ccf6_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1402_c2_ccf6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c2_ccf6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c2_ccf6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c2_ccf6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c2_ccf6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1402_c2_ccf6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1402_c2_ccf6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1402_c2_ccf6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1402_c2_ccf6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1402_c2_ccf6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1402_c2_ccf6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1402_c2_ccf6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1402_c2_ccf6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1402_c2_ccf6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1402_c2_ccf6_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1402_c2_ccf6]
signal result_u8_value_MUX_uxn_opcodes_h_l1402_c2_ccf6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1402_c2_ccf6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1402_c2_ccf6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1402_c2_ccf6_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1402_c2_ccf6]
signal t8_MUX_uxn_opcodes_h_l1402_c2_ccf6_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1402_c2_ccf6_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1402_c2_ccf6_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1402_c2_ccf6_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l1403_c3_12fa[uxn_opcodes_h_l1403_c3_12fa]
signal printf_uxn_opcodes_h_l1403_c3_12fa_uxn_opcodes_h_l1403_c3_12fa_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1407_c11_b21b]
signal BIN_OP_EQ_uxn_opcodes_h_l1407_c11_b21b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1407_c11_b21b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1407_c11_b21b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1407_c7_0b9b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_0b9b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_0b9b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_0b9b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_0b9b_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1407_c7_0b9b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_0b9b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_0b9b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_0b9b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_0b9b_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1407_c7_0b9b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_0b9b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_0b9b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_0b9b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_0b9b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1407_c7_0b9b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_0b9b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_0b9b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_0b9b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_0b9b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1407_c7_0b9b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_0b9b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_0b9b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_0b9b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_0b9b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1407_c7_0b9b]
signal result_u8_value_MUX_uxn_opcodes_h_l1407_c7_0b9b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1407_c7_0b9b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1407_c7_0b9b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1407_c7_0b9b_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1407_c7_0b9b]
signal t8_MUX_uxn_opcodes_h_l1407_c7_0b9b_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1407_c7_0b9b_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1407_c7_0b9b_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1407_c7_0b9b_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1410_c11_2a5b]
signal BIN_OP_EQ_uxn_opcodes_h_l1410_c11_2a5b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1410_c11_2a5b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1410_c11_2a5b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1410_c7_f602]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_f602_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_f602_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_f602_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_f602_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1410_c7_f602]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_f602_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_f602_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_f602_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_f602_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1410_c7_f602]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_f602_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_f602_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_f602_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_f602_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1410_c7_f602]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_f602_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_f602_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_f602_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_f602_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1410_c7_f602]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_f602_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_f602_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_f602_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_f602_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1410_c7_f602]
signal result_u8_value_MUX_uxn_opcodes_h_l1410_c7_f602_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1410_c7_f602_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1410_c7_f602_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1410_c7_f602_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1410_c7_f602]
signal t8_MUX_uxn_opcodes_h_l1410_c7_f602_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1410_c7_f602_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1410_c7_f602_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1410_c7_f602_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1413_c30_d6fe]
signal sp_relative_shift_uxn_opcodes_h_l1413_c30_d6fe_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1413_c30_d6fe_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1413_c30_d6fe_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1413_c30_d6fe_return_output : signed(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1416_c21_8d20]
signal BIN_OP_PLUS_uxn_opcodes_h_l1416_c21_8d20_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1416_c21_8d20_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1416_c21_8d20_return_output : unsigned(8 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1418_c11_9d8a]
signal BIN_OP_EQ_uxn_opcodes_h_l1418_c11_9d8a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1418_c11_9d8a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1418_c11_9d8a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1418_c7_59b4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_59b4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_59b4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_59b4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_59b4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1418_c7_59b4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_59b4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_59b4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_59b4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_59b4_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1418_c7_59b4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_59b4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_59b4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_59b4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_59b4_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_8cda( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.sp_relative_shift := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.u8_value := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1402_c6_a90f
BIN_OP_EQ_uxn_opcodes_h_l1402_c6_a90f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1402_c6_a90f_left,
BIN_OP_EQ_uxn_opcodes_h_l1402_c6_a90f_right,
BIN_OP_EQ_uxn_opcodes_h_l1402_c6_a90f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1402_c1_6c22
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1402_c1_6c22 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1402_c1_6c22_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1402_c1_6c22_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1402_c1_6c22_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1402_c1_6c22_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c2_ccf6
result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c2_ccf6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c2_ccf6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c2_ccf6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c2_ccf6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c2_ccf6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c2_ccf6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c2_ccf6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c2_ccf6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c2_ccf6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c2_ccf6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c2_ccf6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c2_ccf6
result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c2_ccf6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c2_ccf6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c2_ccf6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c2_ccf6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c2_ccf6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1402_c2_ccf6
result_is_opc_done_MUX_uxn_opcodes_h_l1402_c2_ccf6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1402_c2_ccf6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1402_c2_ccf6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1402_c2_ccf6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1402_c2_ccf6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1402_c2_ccf6
result_is_stack_write_MUX_uxn_opcodes_h_l1402_c2_ccf6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1402_c2_ccf6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1402_c2_ccf6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1402_c2_ccf6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1402_c2_ccf6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1402_c2_ccf6
result_u8_value_MUX_uxn_opcodes_h_l1402_c2_ccf6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1402_c2_ccf6_cond,
result_u8_value_MUX_uxn_opcodes_h_l1402_c2_ccf6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1402_c2_ccf6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1402_c2_ccf6_return_output);

-- t8_MUX_uxn_opcodes_h_l1402_c2_ccf6
t8_MUX_uxn_opcodes_h_l1402_c2_ccf6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1402_c2_ccf6_cond,
t8_MUX_uxn_opcodes_h_l1402_c2_ccf6_iftrue,
t8_MUX_uxn_opcodes_h_l1402_c2_ccf6_iffalse,
t8_MUX_uxn_opcodes_h_l1402_c2_ccf6_return_output);

-- printf_uxn_opcodes_h_l1403_c3_12fa_uxn_opcodes_h_l1403_c3_12fa
printf_uxn_opcodes_h_l1403_c3_12fa_uxn_opcodes_h_l1403_c3_12fa : entity work.printf_uxn_opcodes_h_l1403_c3_12fa_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1403_c3_12fa_uxn_opcodes_h_l1403_c3_12fa_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1407_c11_b21b
BIN_OP_EQ_uxn_opcodes_h_l1407_c11_b21b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1407_c11_b21b_left,
BIN_OP_EQ_uxn_opcodes_h_l1407_c11_b21b_right,
BIN_OP_EQ_uxn_opcodes_h_l1407_c11_b21b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_0b9b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_0b9b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_0b9b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_0b9b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_0b9b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_0b9b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_0b9b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_0b9b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_0b9b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_0b9b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_0b9b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_0b9b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_0b9b
result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_0b9b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_0b9b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_0b9b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_0b9b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_0b9b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_0b9b
result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_0b9b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_0b9b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_0b9b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_0b9b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_0b9b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_0b9b
result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_0b9b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_0b9b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_0b9b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_0b9b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_0b9b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1407_c7_0b9b
result_u8_value_MUX_uxn_opcodes_h_l1407_c7_0b9b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1407_c7_0b9b_cond,
result_u8_value_MUX_uxn_opcodes_h_l1407_c7_0b9b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1407_c7_0b9b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1407_c7_0b9b_return_output);

-- t8_MUX_uxn_opcodes_h_l1407_c7_0b9b
t8_MUX_uxn_opcodes_h_l1407_c7_0b9b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1407_c7_0b9b_cond,
t8_MUX_uxn_opcodes_h_l1407_c7_0b9b_iftrue,
t8_MUX_uxn_opcodes_h_l1407_c7_0b9b_iffalse,
t8_MUX_uxn_opcodes_h_l1407_c7_0b9b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1410_c11_2a5b
BIN_OP_EQ_uxn_opcodes_h_l1410_c11_2a5b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1410_c11_2a5b_left,
BIN_OP_EQ_uxn_opcodes_h_l1410_c11_2a5b_right,
BIN_OP_EQ_uxn_opcodes_h_l1410_c11_2a5b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_f602
result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_f602 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_f602_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_f602_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_f602_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_f602_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_f602
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_f602 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_f602_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_f602_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_f602_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_f602_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_f602
result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_f602 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_f602_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_f602_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_f602_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_f602_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_f602
result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_f602 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_f602_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_f602_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_f602_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_f602_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_f602
result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_f602 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_f602_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_f602_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_f602_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_f602_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1410_c7_f602
result_u8_value_MUX_uxn_opcodes_h_l1410_c7_f602 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1410_c7_f602_cond,
result_u8_value_MUX_uxn_opcodes_h_l1410_c7_f602_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1410_c7_f602_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1410_c7_f602_return_output);

-- t8_MUX_uxn_opcodes_h_l1410_c7_f602
t8_MUX_uxn_opcodes_h_l1410_c7_f602 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1410_c7_f602_cond,
t8_MUX_uxn_opcodes_h_l1410_c7_f602_iftrue,
t8_MUX_uxn_opcodes_h_l1410_c7_f602_iffalse,
t8_MUX_uxn_opcodes_h_l1410_c7_f602_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1413_c30_d6fe
sp_relative_shift_uxn_opcodes_h_l1413_c30_d6fe : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1413_c30_d6fe_ins,
sp_relative_shift_uxn_opcodes_h_l1413_c30_d6fe_x,
sp_relative_shift_uxn_opcodes_h_l1413_c30_d6fe_y,
sp_relative_shift_uxn_opcodes_h_l1413_c30_d6fe_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1416_c21_8d20
BIN_OP_PLUS_uxn_opcodes_h_l1416_c21_8d20 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1416_c21_8d20_left,
BIN_OP_PLUS_uxn_opcodes_h_l1416_c21_8d20_right,
BIN_OP_PLUS_uxn_opcodes_h_l1416_c21_8d20_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1418_c11_9d8a
BIN_OP_EQ_uxn_opcodes_h_l1418_c11_9d8a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1418_c11_9d8a_left,
BIN_OP_EQ_uxn_opcodes_h_l1418_c11_9d8a_right,
BIN_OP_EQ_uxn_opcodes_h_l1418_c11_9d8a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_59b4
result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_59b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_59b4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_59b4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_59b4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_59b4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_59b4
result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_59b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_59b4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_59b4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_59b4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_59b4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_59b4
result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_59b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_59b4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_59b4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_59b4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_59b4_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1402_c6_a90f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1402_c1_6c22_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c2_ccf6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c2_ccf6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c2_ccf6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1402_c2_ccf6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1402_c2_ccf6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1402_c2_ccf6_return_output,
 t8_MUX_uxn_opcodes_h_l1402_c2_ccf6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1407_c11_b21b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_0b9b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_0b9b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_0b9b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_0b9b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_0b9b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1407_c7_0b9b_return_output,
 t8_MUX_uxn_opcodes_h_l1407_c7_0b9b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1410_c11_2a5b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_f602_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_f602_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_f602_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_f602_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_f602_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1410_c7_f602_return_output,
 t8_MUX_uxn_opcodes_h_l1410_c7_f602_return_output,
 sp_relative_shift_uxn_opcodes_h_l1413_c30_d6fe_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1416_c21_8d20_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1418_c11_9d8a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_59b4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_59b4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_59b4_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1402_c6_a90f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1402_c6_a90f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1402_c6_a90f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1402_c1_6c22_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1402_c1_6c22_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1402_c1_6c22_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1402_c1_6c22_iffalse : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c2_ccf6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c2_ccf6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_0b9b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c2_ccf6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c2_ccf6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c2_ccf6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1404_c3_c747 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c2_ccf6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_0b9b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c2_ccf6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c2_ccf6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c2_ccf6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c2_ccf6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_0b9b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c2_ccf6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c2_ccf6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1402_c2_ccf6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1402_c2_ccf6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_0b9b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1402_c2_ccf6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1402_c2_ccf6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1402_c2_ccf6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1402_c2_ccf6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_0b9b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1402_c2_ccf6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1402_c2_ccf6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1402_c2_ccf6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1402_c2_ccf6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_0b9b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1402_c2_ccf6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1402_c2_ccf6_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1402_c2_ccf6_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1402_c2_ccf6_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1407_c7_0b9b_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1402_c2_ccf6_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1402_c2_ccf6_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1403_c3_12fa_uxn_opcodes_h_l1403_c3_12fa_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_b21b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_b21b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_b21b_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_0b9b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_0b9b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_f602_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_0b9b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_0b9b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1408_c3_edc8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_0b9b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_f602_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_0b9b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_0b9b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_0b9b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_f602_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_0b9b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_0b9b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_0b9b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_f602_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_0b9b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_0b9b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_0b9b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_f602_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_0b9b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_0b9b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_0b9b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_f602_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_0b9b_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1407_c7_0b9b_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1407_c7_0b9b_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1410_c7_f602_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1407_c7_0b9b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_2a5b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_2a5b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_2a5b_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_f602_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_f602_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_f602_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_f602_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1415_c3_9d5d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_f602_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1410_c7_f602_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_f602_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_f602_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_f602_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_59b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_f602_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_f602_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_f602_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_59b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_f602_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_f602_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_f602_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_59b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_f602_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_f602_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_uxn_opcodes_h_l1416_c3_e387 : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_f602_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_f602_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1410_c7_f602_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1410_c7_f602_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1410_c7_f602_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1413_c30_d6fe_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1413_c30_d6fe_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1413_c30_d6fe_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1413_c30_d6fe_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1416_c21_8d20_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1416_c21_8d20_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1416_c21_8d20_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1418_c11_9d8a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1418_c11_9d8a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1418_c11_9d8a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_59b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_59b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_59b4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_59b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_59b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_59b4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_59b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_59b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_59b4_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1407_l1410_l1402_DUPLICATE_a8e7_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1407_l1402_l1418_DUPLICATE_3b89_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1407_l1402_l1418_DUPLICATE_3b61_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1407_l1410_l1402_DUPLICATE_26d9_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1407_l1410_l1418_DUPLICATE_31a9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l1424_l1398_DUPLICATE_d531_return_output : opcode_result_t;
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
     VAR_sp_relative_shift_uxn_opcodes_h_l1413_c30_d6fe_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_f602_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1408_c3_edc8 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_0b9b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1408_c3_edc8;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_59b4_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_2a5b_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1415_c3_9d5d := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_f602_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1415_c3_9d5d;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1416_c21_8d20_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_b21b_right := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_f602_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1402_c2_ccf6_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_59b4_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1402_c6_a90f_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1418_c11_9d8a_right := to_unsigned(3, 2);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1402_c1_6c22_iffalse := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1413_c30_d6fe_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_59b4_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1404_c3_c747 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c2_ccf6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1404_c3_c747;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1402_c1_6c22_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1413_c30_d6fe_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1402_c6_a90f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_b21b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_2a5b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1418_c11_9d8a_left := VAR_phase;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1416_c21_8d20_left := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1410_c7_f602_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1402_c2_ccf6_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1407_c7_0b9b_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1410_c7_f602_iffalse := t8;
     -- BIN_OP_PLUS[uxn_opcodes_h_l1416_c21_8d20] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1416_c21_8d20_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1416_c21_8d20_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1416_c21_8d20_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1416_c21_8d20_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1416_c21_8d20_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1416_c21_8d20_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1407_l1410_l1402_DUPLICATE_a8e7 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1407_l1410_l1402_DUPLICATE_a8e7_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1402_c6_a90f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1402_c6_a90f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1402_c6_a90f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1402_c6_a90f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1402_c6_a90f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1402_c6_a90f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1402_c6_a90f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1407_l1410_l1418_DUPLICATE_31a9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1407_l1410_l1418_DUPLICATE_31a9_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1407_c11_b21b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1407_c11_b21b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_b21b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1407_c11_b21b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_b21b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_b21b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1407_c11_b21b_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1413_c30_d6fe] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1413_c30_d6fe_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1413_c30_d6fe_ins;
     sp_relative_shift_uxn_opcodes_h_l1413_c30_d6fe_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1413_c30_d6fe_x;
     sp_relative_shift_uxn_opcodes_h_l1413_c30_d6fe_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1413_c30_d6fe_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1413_c30_d6fe_return_output := sp_relative_shift_uxn_opcodes_h_l1413_c30_d6fe_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1407_l1402_l1418_DUPLICATE_3b89 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1407_l1402_l1418_DUPLICATE_3b89_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1418_c11_9d8a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1418_c11_9d8a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1418_c11_9d8a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1418_c11_9d8a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1418_c11_9d8a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1418_c11_9d8a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1418_c11_9d8a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1410_c11_2a5b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1410_c11_2a5b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_2a5b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1410_c11_2a5b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_2a5b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_2a5b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1410_c11_2a5b_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1407_l1410_l1402_DUPLICATE_26d9 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1407_l1410_l1402_DUPLICATE_26d9_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1407_l1402_l1418_DUPLICATE_3b61 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1407_l1402_l1418_DUPLICATE_3b61_return_output := result.is_stack_write;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1410_c7_f602] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1410_c7_f602_return_output := result.stack_address_sp_offset;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1402_c1_6c22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1402_c6_a90f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1402_c2_ccf6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1402_c6_a90f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c2_ccf6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1402_c6_a90f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1402_c2_ccf6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1402_c6_a90f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c2_ccf6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1402_c6_a90f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c2_ccf6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1402_c6_a90f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1402_c2_ccf6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1402_c6_a90f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1402_c2_ccf6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1402_c6_a90f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_0b9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_b21b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_0b9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_b21b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_0b9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_b21b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_0b9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_b21b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_0b9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_b21b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_0b9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_b21b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1407_c7_0b9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_b21b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_f602_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_2a5b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_f602_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_2a5b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_f602_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_2a5b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_f602_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_2a5b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_f602_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_2a5b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_f602_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_2a5b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1410_c7_f602_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_2a5b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_59b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1418_c11_9d8a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_59b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1418_c11_9d8a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_59b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1418_c11_9d8a_return_output;
     VAR_result_u8_value_uxn_opcodes_h_l1416_c3_e387 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1416_c21_8d20_return_output, 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c2_ccf6_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1407_l1410_l1402_DUPLICATE_a8e7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_0b9b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1407_l1410_l1402_DUPLICATE_a8e7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_f602_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1407_l1410_l1402_DUPLICATE_a8e7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_0b9b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1407_l1410_l1418_DUPLICATE_31a9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_f602_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1407_l1410_l1418_DUPLICATE_31a9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_59b4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1407_l1410_l1418_DUPLICATE_31a9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c2_ccf6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1407_l1402_l1418_DUPLICATE_3b89_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_0b9b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1407_l1402_l1418_DUPLICATE_3b89_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_59b4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1407_l1402_l1418_DUPLICATE_3b89_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1402_c2_ccf6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1407_l1402_l1418_DUPLICATE_3b61_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_0b9b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1407_l1402_l1418_DUPLICATE_3b61_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_59b4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1407_l1402_l1418_DUPLICATE_3b61_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1402_c2_ccf6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1407_l1410_l1402_DUPLICATE_26d9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_0b9b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1407_l1410_l1402_DUPLICATE_26d9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_f602_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1407_l1410_l1402_DUPLICATE_26d9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_f602_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1410_c7_f602_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_f602_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1413_c30_d6fe_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_f602_iftrue := VAR_result_u8_value_uxn_opcodes_h_l1416_c3_e387;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1410_c7_f602] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_f602_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_f602_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_f602_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_f602_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_f602_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_f602_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_f602_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_f602_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1418_c7_59b4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_59b4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_59b4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_59b4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_59b4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_59b4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_59b4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_59b4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_59b4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1418_c7_59b4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_59b4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_59b4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_59b4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_59b4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_59b4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_59b4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_59b4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_59b4_return_output;

     -- t8_MUX[uxn_opcodes_h_l1410_c7_f602] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1410_c7_f602_cond <= VAR_t8_MUX_uxn_opcodes_h_l1410_c7_f602_cond;
     t8_MUX_uxn_opcodes_h_l1410_c7_f602_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1410_c7_f602_iftrue;
     t8_MUX_uxn_opcodes_h_l1410_c7_f602_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1410_c7_f602_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1410_c7_f602_return_output := t8_MUX_uxn_opcodes_h_l1410_c7_f602_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1418_c7_59b4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_59b4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_59b4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_59b4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_59b4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_59b4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_59b4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_59b4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_59b4_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1402_c1_6c22] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1402_c1_6c22_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1402_c1_6c22_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1402_c1_6c22_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1402_c1_6c22_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1402_c1_6c22_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1402_c1_6c22_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1402_c1_6c22_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1402_c1_6c22_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1410_c7_f602] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1410_c7_f602_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_f602_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1410_c7_f602_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_f602_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1410_c7_f602_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_f602_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_f602_return_output := result_u8_value_MUX_uxn_opcodes_h_l1410_c7_f602_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1410_c7_f602] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_f602_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_f602_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_f602_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_f602_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_f602_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_f602_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_f602_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_f602_return_output;

     -- Submodule level 2
     VAR_printf_uxn_opcodes_h_l1403_c3_12fa_uxn_opcodes_h_l1403_c3_12fa_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1402_c1_6c22_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_f602_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_59b4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_f602_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_59b4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_f602_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_59b4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_0b9b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_f602_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_0b9b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_f602_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_0b9b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_f602_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1407_c7_0b9b_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1410_c7_f602_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1407_c7_0b9b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1407_c7_0b9b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_0b9b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1407_c7_0b9b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_0b9b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1407_c7_0b9b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_0b9b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_0b9b_return_output := result_u8_value_MUX_uxn_opcodes_h_l1407_c7_0b9b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1407_c7_0b9b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_0b9b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_0b9b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_0b9b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_0b9b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_0b9b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_0b9b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_0b9b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_0b9b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1410_c7_f602] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_f602_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_f602_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_f602_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_f602_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_f602_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_f602_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_f602_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_f602_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1410_c7_f602] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_f602_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_f602_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_f602_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_f602_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_f602_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_f602_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_f602_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_f602_return_output;

     -- printf_uxn_opcodes_h_l1403_c3_12fa[uxn_opcodes_h_l1403_c3_12fa] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1403_c3_12fa_uxn_opcodes_h_l1403_c3_12fa_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1403_c3_12fa_uxn_opcodes_h_l1403_c3_12fa_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- t8_MUX[uxn_opcodes_h_l1407_c7_0b9b] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1407_c7_0b9b_cond <= VAR_t8_MUX_uxn_opcodes_h_l1407_c7_0b9b_cond;
     t8_MUX_uxn_opcodes_h_l1407_c7_0b9b_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1407_c7_0b9b_iftrue;
     t8_MUX_uxn_opcodes_h_l1407_c7_0b9b_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1407_c7_0b9b_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1407_c7_0b9b_return_output := t8_MUX_uxn_opcodes_h_l1407_c7_0b9b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1407_c7_0b9b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_0b9b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_0b9b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_0b9b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_0b9b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_0b9b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_0b9b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_0b9b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_0b9b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1410_c7_f602] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_f602_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_f602_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_f602_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_f602_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_f602_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_f602_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_f602_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_f602_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_0b9b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_f602_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_0b9b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_f602_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_0b9b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_f602_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c2_ccf6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_0b9b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c2_ccf6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_0b9b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1402_c2_ccf6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_0b9b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1402_c2_ccf6_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1407_c7_0b9b_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1402_c2_ccf6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c2_ccf6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c2_ccf6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c2_ccf6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c2_ccf6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c2_ccf6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c2_ccf6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c2_ccf6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c2_ccf6_return_output;

     -- t8_MUX[uxn_opcodes_h_l1402_c2_ccf6] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1402_c2_ccf6_cond <= VAR_t8_MUX_uxn_opcodes_h_l1402_c2_ccf6_cond;
     t8_MUX_uxn_opcodes_h_l1402_c2_ccf6_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1402_c2_ccf6_iftrue;
     t8_MUX_uxn_opcodes_h_l1402_c2_ccf6_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1402_c2_ccf6_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1402_c2_ccf6_return_output := t8_MUX_uxn_opcodes_h_l1402_c2_ccf6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1407_c7_0b9b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_0b9b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_0b9b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_0b9b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_0b9b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_0b9b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_0b9b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_0b9b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_0b9b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1407_c7_0b9b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_0b9b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_0b9b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_0b9b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_0b9b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_0b9b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_0b9b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_0b9b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_0b9b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1407_c7_0b9b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_0b9b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_0b9b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_0b9b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_0b9b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_0b9b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_0b9b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_0b9b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_0b9b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1402_c2_ccf6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c2_ccf6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c2_ccf6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c2_ccf6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c2_ccf6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c2_ccf6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c2_ccf6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c2_ccf6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c2_ccf6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1402_c2_ccf6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1402_c2_ccf6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1402_c2_ccf6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1402_c2_ccf6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1402_c2_ccf6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1402_c2_ccf6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1402_c2_ccf6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1402_c2_ccf6_return_output := result_u8_value_MUX_uxn_opcodes_h_l1402_c2_ccf6_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1402_c2_ccf6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_0b9b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c2_ccf6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_0b9b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1402_c2_ccf6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_0b9b_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1402_c2_ccf6_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1402_c2_ccf6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1402_c2_ccf6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1402_c2_ccf6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1402_c2_ccf6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1402_c2_ccf6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1402_c2_ccf6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1402_c2_ccf6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1402_c2_ccf6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1402_c2_ccf6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1402_c2_ccf6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c2_ccf6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c2_ccf6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c2_ccf6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c2_ccf6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c2_ccf6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c2_ccf6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c2_ccf6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c2_ccf6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1402_c2_ccf6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1402_c2_ccf6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1402_c2_ccf6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1402_c2_ccf6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1402_c2_ccf6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1402_c2_ccf6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1402_c2_ccf6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1402_c2_ccf6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1402_c2_ccf6_return_output;

     -- Submodule level 5
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l1424_l1398_DUPLICATE_d531 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l1424_l1398_DUPLICATE_d531_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_8cda(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c2_ccf6_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c2_ccf6_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c2_ccf6_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1402_c2_ccf6_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1402_c2_ccf6_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1402_c2_ccf6_return_output);

     -- Submodule level 6
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l1424_l1398_DUPLICATE_d531_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l1424_l1398_DUPLICATE_d531_return_output;
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
