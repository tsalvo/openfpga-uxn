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
-- Submodules: 77
entity inc2_0CLK_26f67814 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end inc2_0CLK_26f67814;
architecture arch of inc2_0CLK_26f67814 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1063_c6_597a]
signal BIN_OP_EQ_uxn_opcodes_h_l1063_c6_597a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1063_c6_597a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1063_c6_597a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1063_c1_04c2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_04c2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_04c2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_04c2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_04c2_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1063_c2_5754]
signal tmp16_MUX_uxn_opcodes_h_l1063_c2_5754_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1063_c2_5754_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1063_c2_5754_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1063_c2_5754_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1063_c2_5754]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1063_c2_5754_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1063_c2_5754_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1063_c2_5754_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1063_c2_5754_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1063_c2_5754]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c2_5754_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c2_5754_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c2_5754_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c2_5754_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1063_c2_5754]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1063_c2_5754_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1063_c2_5754_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1063_c2_5754_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1063_c2_5754_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1063_c2_5754]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1063_c2_5754_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1063_c2_5754_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1063_c2_5754_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1063_c2_5754_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1063_c2_5754]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c2_5754_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c2_5754_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c2_5754_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c2_5754_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1063_c2_5754]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c2_5754_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c2_5754_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c2_5754_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c2_5754_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1063_c2_5754]
signal result_stack_value_MUX_uxn_opcodes_h_l1063_c2_5754_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1063_c2_5754_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1063_c2_5754_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1063_c2_5754_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1063_c2_5754]
signal t16_MUX_uxn_opcodes_h_l1063_c2_5754_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1063_c2_5754_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1063_c2_5754_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1063_c2_5754_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1064_c3_ea43[uxn_opcodes_h_l1064_c3_ea43]
signal printf_uxn_opcodes_h_l1064_c3_ea43_uxn_opcodes_h_l1064_c3_ea43_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1069_c11_ee82]
signal BIN_OP_EQ_uxn_opcodes_h_l1069_c11_ee82_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1069_c11_ee82_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1069_c11_ee82_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1069_c7_072b]
signal tmp16_MUX_uxn_opcodes_h_l1069_c7_072b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1069_c7_072b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1069_c7_072b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1069_c7_072b_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1069_c7_072b]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1069_c7_072b_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1069_c7_072b_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1069_c7_072b_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1069_c7_072b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1069_c7_072b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1069_c7_072b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1069_c7_072b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1069_c7_072b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1069_c7_072b_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1069_c7_072b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1069_c7_072b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1069_c7_072b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1069_c7_072b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1069_c7_072b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1069_c7_072b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1069_c7_072b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1069_c7_072b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1069_c7_072b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1069_c7_072b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1069_c7_072b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1069_c7_072b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1069_c7_072b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1069_c7_072b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1069_c7_072b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1069_c7_072b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1069_c7_072b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1069_c7_072b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1069_c7_072b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1069_c7_072b_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1069_c7_072b]
signal result_stack_value_MUX_uxn_opcodes_h_l1069_c7_072b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1069_c7_072b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1069_c7_072b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1069_c7_072b_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1069_c7_072b]
signal t16_MUX_uxn_opcodes_h_l1069_c7_072b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1069_c7_072b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1069_c7_072b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1069_c7_072b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1072_c11_b1bc]
signal BIN_OP_EQ_uxn_opcodes_h_l1072_c11_b1bc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1072_c11_b1bc_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1072_c11_b1bc_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1072_c7_ff90]
signal tmp16_MUX_uxn_opcodes_h_l1072_c7_ff90_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1072_c7_ff90_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1072_c7_ff90_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1072_c7_ff90_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1072_c7_ff90]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1072_c7_ff90_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1072_c7_ff90_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1072_c7_ff90_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1072_c7_ff90_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1072_c7_ff90]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_ff90_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_ff90_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_ff90_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_ff90_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1072_c7_ff90]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_ff90_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_ff90_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_ff90_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_ff90_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1072_c7_ff90]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_ff90_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_ff90_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_ff90_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_ff90_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1072_c7_ff90]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_ff90_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_ff90_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_ff90_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_ff90_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1072_c7_ff90]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_ff90_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_ff90_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_ff90_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_ff90_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1072_c7_ff90]
signal result_stack_value_MUX_uxn_opcodes_h_l1072_c7_ff90_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1072_c7_ff90_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1072_c7_ff90_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1072_c7_ff90_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1072_c7_ff90]
signal t16_MUX_uxn_opcodes_h_l1072_c7_ff90_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1072_c7_ff90_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1072_c7_ff90_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1072_c7_ff90_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1074_c3_d6f9]
signal CONST_SL_8_uxn_opcodes_h_l1074_c3_d6f9_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1074_c3_d6f9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1077_c11_6163]
signal BIN_OP_EQ_uxn_opcodes_h_l1077_c11_6163_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1077_c11_6163_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1077_c11_6163_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1077_c7_09b0]
signal tmp16_MUX_uxn_opcodes_h_l1077_c7_09b0_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1077_c7_09b0_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1077_c7_09b0_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1077_c7_09b0_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1077_c7_09b0]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1077_c7_09b0_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1077_c7_09b0_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1077_c7_09b0_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1077_c7_09b0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1077_c7_09b0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1077_c7_09b0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1077_c7_09b0_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1077_c7_09b0_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1077_c7_09b0_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1077_c7_09b0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1077_c7_09b0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1077_c7_09b0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1077_c7_09b0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1077_c7_09b0_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1077_c7_09b0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1077_c7_09b0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1077_c7_09b0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1077_c7_09b0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1077_c7_09b0_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1077_c7_09b0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1077_c7_09b0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1077_c7_09b0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1077_c7_09b0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1077_c7_09b0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1077_c7_09b0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1077_c7_09b0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1077_c7_09b0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1077_c7_09b0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1077_c7_09b0_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1077_c7_09b0]
signal result_stack_value_MUX_uxn_opcodes_h_l1077_c7_09b0_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1077_c7_09b0_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1077_c7_09b0_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1077_c7_09b0_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1077_c7_09b0]
signal t16_MUX_uxn_opcodes_h_l1077_c7_09b0_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1077_c7_09b0_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1077_c7_09b0_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1077_c7_09b0_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1080_c11_4532]
signal BIN_OP_EQ_uxn_opcodes_h_l1080_c11_4532_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1080_c11_4532_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1080_c11_4532_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1080_c7_5aaa]
signal tmp16_MUX_uxn_opcodes_h_l1080_c7_5aaa_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1080_c7_5aaa_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1080_c7_5aaa_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1080_c7_5aaa_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1080_c7_5aaa]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1080_c7_5aaa_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1080_c7_5aaa_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1080_c7_5aaa_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1080_c7_5aaa_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1080_c7_5aaa]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_5aaa_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_5aaa_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_5aaa_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_5aaa_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1080_c7_5aaa]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_5aaa_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_5aaa_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_5aaa_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_5aaa_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1080_c7_5aaa]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_5aaa_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_5aaa_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_5aaa_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_5aaa_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1080_c7_5aaa]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_5aaa_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_5aaa_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_5aaa_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_5aaa_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1080_c7_5aaa]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_5aaa_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_5aaa_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_5aaa_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_5aaa_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1080_c7_5aaa]
signal result_stack_value_MUX_uxn_opcodes_h_l1080_c7_5aaa_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1080_c7_5aaa_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1080_c7_5aaa_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1080_c7_5aaa_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1080_c7_5aaa]
signal t16_MUX_uxn_opcodes_h_l1080_c7_5aaa_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1080_c7_5aaa_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1080_c7_5aaa_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1080_c7_5aaa_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1081_c3_d7dc]
signal BIN_OP_OR_uxn_opcodes_h_l1081_c3_d7dc_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1081_c3_d7dc_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1081_c3_d7dc_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1082_c11_ee0f]
signal BIN_OP_PLUS_uxn_opcodes_h_l1082_c11_ee0f_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1082_c11_ee0f_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1082_c11_ee0f_return_output : unsigned(16 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1085_c32_9cb0]
signal BIN_OP_AND_uxn_opcodes_h_l1085_c32_9cb0_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1085_c32_9cb0_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1085_c32_9cb0_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1085_c32_6641]
signal BIN_OP_GT_uxn_opcodes_h_l1085_c32_6641_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1085_c32_6641_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1085_c32_6641_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1085_c32_4087]
signal MUX_uxn_opcodes_h_l1085_c32_4087_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1085_c32_4087_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1085_c32_4087_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1085_c32_4087_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1087_c11_cf40]
signal BIN_OP_EQ_uxn_opcodes_h_l1087_c11_cf40_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1087_c11_cf40_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1087_c11_cf40_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1087_c7_d0b8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1087_c7_d0b8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1087_c7_d0b8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1087_c7_d0b8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1087_c7_d0b8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1087_c7_d0b8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1087_c7_d0b8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1087_c7_d0b8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1087_c7_d0b8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1087_c7_d0b8_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1087_c7_d0b8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1087_c7_d0b8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1087_c7_d0b8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1087_c7_d0b8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1087_c7_d0b8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1087_c7_d0b8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1087_c7_d0b8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1087_c7_d0b8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1087_c7_d0b8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1087_c7_d0b8_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1087_c7_d0b8]
signal result_stack_value_MUX_uxn_opcodes_h_l1087_c7_d0b8_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1087_c7_d0b8_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1087_c7_d0b8_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1087_c7_d0b8_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1093_c11_5b50]
signal BIN_OP_EQ_uxn_opcodes_h_l1093_c11_5b50_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1093_c11_5b50_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1093_c11_5b50_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1093_c7_3a41]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c7_3a41_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c7_3a41_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c7_3a41_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c7_3a41_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1093_c7_3a41]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1093_c7_3a41_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1093_c7_3a41_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1093_c7_3a41_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1093_c7_3a41_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1093_c7_3a41]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1093_c7_3a41_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1093_c7_3a41_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1093_c7_3a41_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1093_c7_3a41_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1093_c7_3a41]
signal result_stack_value_MUX_uxn_opcodes_h_l1093_c7_3a41_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1093_c7_3a41_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1093_c7_3a41_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1093_c7_3a41_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1095_c34_83fe]
signal CONST_SR_8_uxn_opcodes_h_l1095_c34_83fe_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1095_c34_83fe_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1097_c11_b4f6]
signal BIN_OP_EQ_uxn_opcodes_h_l1097_c11_b4f6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1097_c11_b4f6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1097_c11_b4f6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1097_c7_1934]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_1934_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_1934_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_1934_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_1934_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1097_c7_1934]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_1934_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_1934_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_1934_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_1934_return_output : unsigned(0 downto 0);

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_28d7( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : signed;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_read := ref_toks_1;
      base.sp_relative_shift := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_sp_shift := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.stack_value := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1063_c6_597a
BIN_OP_EQ_uxn_opcodes_h_l1063_c6_597a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1063_c6_597a_left,
BIN_OP_EQ_uxn_opcodes_h_l1063_c6_597a_right,
BIN_OP_EQ_uxn_opcodes_h_l1063_c6_597a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_04c2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_04c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_04c2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_04c2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_04c2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_04c2_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1063_c2_5754
tmp16_MUX_uxn_opcodes_h_l1063_c2_5754 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1063_c2_5754_cond,
tmp16_MUX_uxn_opcodes_h_l1063_c2_5754_iftrue,
tmp16_MUX_uxn_opcodes_h_l1063_c2_5754_iffalse,
tmp16_MUX_uxn_opcodes_h_l1063_c2_5754_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1063_c2_5754
result_is_stack_read_MUX_uxn_opcodes_h_l1063_c2_5754 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1063_c2_5754_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1063_c2_5754_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1063_c2_5754_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1063_c2_5754_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c2_5754
result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c2_5754 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c2_5754_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c2_5754_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c2_5754_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c2_5754_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1063_c2_5754
result_is_opc_done_MUX_uxn_opcodes_h_l1063_c2_5754 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1063_c2_5754_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1063_c2_5754_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1063_c2_5754_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1063_c2_5754_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1063_c2_5754
result_is_stack_write_MUX_uxn_opcodes_h_l1063_c2_5754 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1063_c2_5754_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1063_c2_5754_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1063_c2_5754_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1063_c2_5754_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c2_5754
result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c2_5754 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c2_5754_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c2_5754_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c2_5754_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c2_5754_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c2_5754
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c2_5754 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c2_5754_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c2_5754_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c2_5754_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c2_5754_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1063_c2_5754
result_stack_value_MUX_uxn_opcodes_h_l1063_c2_5754 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1063_c2_5754_cond,
result_stack_value_MUX_uxn_opcodes_h_l1063_c2_5754_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1063_c2_5754_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1063_c2_5754_return_output);

-- t16_MUX_uxn_opcodes_h_l1063_c2_5754
t16_MUX_uxn_opcodes_h_l1063_c2_5754 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1063_c2_5754_cond,
t16_MUX_uxn_opcodes_h_l1063_c2_5754_iftrue,
t16_MUX_uxn_opcodes_h_l1063_c2_5754_iffalse,
t16_MUX_uxn_opcodes_h_l1063_c2_5754_return_output);

-- printf_uxn_opcodes_h_l1064_c3_ea43_uxn_opcodes_h_l1064_c3_ea43
printf_uxn_opcodes_h_l1064_c3_ea43_uxn_opcodes_h_l1064_c3_ea43 : entity work.printf_uxn_opcodes_h_l1064_c3_ea43_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1064_c3_ea43_uxn_opcodes_h_l1064_c3_ea43_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1069_c11_ee82
BIN_OP_EQ_uxn_opcodes_h_l1069_c11_ee82 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1069_c11_ee82_left,
BIN_OP_EQ_uxn_opcodes_h_l1069_c11_ee82_right,
BIN_OP_EQ_uxn_opcodes_h_l1069_c11_ee82_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1069_c7_072b
tmp16_MUX_uxn_opcodes_h_l1069_c7_072b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1069_c7_072b_cond,
tmp16_MUX_uxn_opcodes_h_l1069_c7_072b_iftrue,
tmp16_MUX_uxn_opcodes_h_l1069_c7_072b_iffalse,
tmp16_MUX_uxn_opcodes_h_l1069_c7_072b_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1069_c7_072b
result_is_stack_read_MUX_uxn_opcodes_h_l1069_c7_072b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1069_c7_072b_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1069_c7_072b_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1069_c7_072b_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1069_c7_072b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1069_c7_072b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1069_c7_072b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1069_c7_072b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1069_c7_072b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1069_c7_072b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1069_c7_072b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1069_c7_072b
result_is_opc_done_MUX_uxn_opcodes_h_l1069_c7_072b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1069_c7_072b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1069_c7_072b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1069_c7_072b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1069_c7_072b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1069_c7_072b
result_is_stack_write_MUX_uxn_opcodes_h_l1069_c7_072b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1069_c7_072b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1069_c7_072b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1069_c7_072b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1069_c7_072b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1069_c7_072b
result_is_sp_shift_MUX_uxn_opcodes_h_l1069_c7_072b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1069_c7_072b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1069_c7_072b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1069_c7_072b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1069_c7_072b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1069_c7_072b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1069_c7_072b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1069_c7_072b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1069_c7_072b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1069_c7_072b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1069_c7_072b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1069_c7_072b
result_stack_value_MUX_uxn_opcodes_h_l1069_c7_072b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1069_c7_072b_cond,
result_stack_value_MUX_uxn_opcodes_h_l1069_c7_072b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1069_c7_072b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1069_c7_072b_return_output);

-- t16_MUX_uxn_opcodes_h_l1069_c7_072b
t16_MUX_uxn_opcodes_h_l1069_c7_072b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1069_c7_072b_cond,
t16_MUX_uxn_opcodes_h_l1069_c7_072b_iftrue,
t16_MUX_uxn_opcodes_h_l1069_c7_072b_iffalse,
t16_MUX_uxn_opcodes_h_l1069_c7_072b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1072_c11_b1bc
BIN_OP_EQ_uxn_opcodes_h_l1072_c11_b1bc : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1072_c11_b1bc_left,
BIN_OP_EQ_uxn_opcodes_h_l1072_c11_b1bc_right,
BIN_OP_EQ_uxn_opcodes_h_l1072_c11_b1bc_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1072_c7_ff90
tmp16_MUX_uxn_opcodes_h_l1072_c7_ff90 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1072_c7_ff90_cond,
tmp16_MUX_uxn_opcodes_h_l1072_c7_ff90_iftrue,
tmp16_MUX_uxn_opcodes_h_l1072_c7_ff90_iffalse,
tmp16_MUX_uxn_opcodes_h_l1072_c7_ff90_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1072_c7_ff90
result_is_stack_read_MUX_uxn_opcodes_h_l1072_c7_ff90 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1072_c7_ff90_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1072_c7_ff90_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1072_c7_ff90_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1072_c7_ff90_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_ff90
result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_ff90 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_ff90_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_ff90_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_ff90_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_ff90_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_ff90
result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_ff90 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_ff90_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_ff90_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_ff90_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_ff90_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_ff90
result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_ff90 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_ff90_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_ff90_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_ff90_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_ff90_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_ff90
result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_ff90 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_ff90_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_ff90_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_ff90_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_ff90_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_ff90
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_ff90 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_ff90_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_ff90_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_ff90_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_ff90_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1072_c7_ff90
result_stack_value_MUX_uxn_opcodes_h_l1072_c7_ff90 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1072_c7_ff90_cond,
result_stack_value_MUX_uxn_opcodes_h_l1072_c7_ff90_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1072_c7_ff90_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1072_c7_ff90_return_output);

-- t16_MUX_uxn_opcodes_h_l1072_c7_ff90
t16_MUX_uxn_opcodes_h_l1072_c7_ff90 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1072_c7_ff90_cond,
t16_MUX_uxn_opcodes_h_l1072_c7_ff90_iftrue,
t16_MUX_uxn_opcodes_h_l1072_c7_ff90_iffalse,
t16_MUX_uxn_opcodes_h_l1072_c7_ff90_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1074_c3_d6f9
CONST_SL_8_uxn_opcodes_h_l1074_c3_d6f9 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1074_c3_d6f9_x,
CONST_SL_8_uxn_opcodes_h_l1074_c3_d6f9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1077_c11_6163
BIN_OP_EQ_uxn_opcodes_h_l1077_c11_6163 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1077_c11_6163_left,
BIN_OP_EQ_uxn_opcodes_h_l1077_c11_6163_right,
BIN_OP_EQ_uxn_opcodes_h_l1077_c11_6163_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1077_c7_09b0
tmp16_MUX_uxn_opcodes_h_l1077_c7_09b0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1077_c7_09b0_cond,
tmp16_MUX_uxn_opcodes_h_l1077_c7_09b0_iftrue,
tmp16_MUX_uxn_opcodes_h_l1077_c7_09b0_iffalse,
tmp16_MUX_uxn_opcodes_h_l1077_c7_09b0_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1077_c7_09b0
result_is_stack_read_MUX_uxn_opcodes_h_l1077_c7_09b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1077_c7_09b0_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1077_c7_09b0_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1077_c7_09b0_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1077_c7_09b0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1077_c7_09b0
result_sp_relative_shift_MUX_uxn_opcodes_h_l1077_c7_09b0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1077_c7_09b0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1077_c7_09b0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1077_c7_09b0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1077_c7_09b0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1077_c7_09b0
result_is_opc_done_MUX_uxn_opcodes_h_l1077_c7_09b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1077_c7_09b0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1077_c7_09b0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1077_c7_09b0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1077_c7_09b0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1077_c7_09b0
result_is_stack_write_MUX_uxn_opcodes_h_l1077_c7_09b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1077_c7_09b0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1077_c7_09b0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1077_c7_09b0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1077_c7_09b0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1077_c7_09b0
result_is_sp_shift_MUX_uxn_opcodes_h_l1077_c7_09b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1077_c7_09b0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1077_c7_09b0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1077_c7_09b0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1077_c7_09b0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1077_c7_09b0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1077_c7_09b0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1077_c7_09b0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1077_c7_09b0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1077_c7_09b0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1077_c7_09b0_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1077_c7_09b0
result_stack_value_MUX_uxn_opcodes_h_l1077_c7_09b0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1077_c7_09b0_cond,
result_stack_value_MUX_uxn_opcodes_h_l1077_c7_09b0_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1077_c7_09b0_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1077_c7_09b0_return_output);

-- t16_MUX_uxn_opcodes_h_l1077_c7_09b0
t16_MUX_uxn_opcodes_h_l1077_c7_09b0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1077_c7_09b0_cond,
t16_MUX_uxn_opcodes_h_l1077_c7_09b0_iftrue,
t16_MUX_uxn_opcodes_h_l1077_c7_09b0_iffalse,
t16_MUX_uxn_opcodes_h_l1077_c7_09b0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1080_c11_4532
BIN_OP_EQ_uxn_opcodes_h_l1080_c11_4532 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1080_c11_4532_left,
BIN_OP_EQ_uxn_opcodes_h_l1080_c11_4532_right,
BIN_OP_EQ_uxn_opcodes_h_l1080_c11_4532_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1080_c7_5aaa
tmp16_MUX_uxn_opcodes_h_l1080_c7_5aaa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1080_c7_5aaa_cond,
tmp16_MUX_uxn_opcodes_h_l1080_c7_5aaa_iftrue,
tmp16_MUX_uxn_opcodes_h_l1080_c7_5aaa_iffalse,
tmp16_MUX_uxn_opcodes_h_l1080_c7_5aaa_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1080_c7_5aaa
result_is_stack_read_MUX_uxn_opcodes_h_l1080_c7_5aaa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1080_c7_5aaa_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1080_c7_5aaa_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1080_c7_5aaa_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1080_c7_5aaa_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_5aaa
result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_5aaa : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_5aaa_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_5aaa_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_5aaa_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_5aaa_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_5aaa
result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_5aaa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_5aaa_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_5aaa_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_5aaa_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_5aaa_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_5aaa
result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_5aaa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_5aaa_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_5aaa_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_5aaa_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_5aaa_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_5aaa
result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_5aaa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_5aaa_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_5aaa_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_5aaa_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_5aaa_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_5aaa
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_5aaa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_5aaa_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_5aaa_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_5aaa_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_5aaa_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1080_c7_5aaa
result_stack_value_MUX_uxn_opcodes_h_l1080_c7_5aaa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1080_c7_5aaa_cond,
result_stack_value_MUX_uxn_opcodes_h_l1080_c7_5aaa_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1080_c7_5aaa_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1080_c7_5aaa_return_output);

-- t16_MUX_uxn_opcodes_h_l1080_c7_5aaa
t16_MUX_uxn_opcodes_h_l1080_c7_5aaa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1080_c7_5aaa_cond,
t16_MUX_uxn_opcodes_h_l1080_c7_5aaa_iftrue,
t16_MUX_uxn_opcodes_h_l1080_c7_5aaa_iffalse,
t16_MUX_uxn_opcodes_h_l1080_c7_5aaa_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1081_c3_d7dc
BIN_OP_OR_uxn_opcodes_h_l1081_c3_d7dc : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1081_c3_d7dc_left,
BIN_OP_OR_uxn_opcodes_h_l1081_c3_d7dc_right,
BIN_OP_OR_uxn_opcodes_h_l1081_c3_d7dc_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1082_c11_ee0f
BIN_OP_PLUS_uxn_opcodes_h_l1082_c11_ee0f : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1082_c11_ee0f_left,
BIN_OP_PLUS_uxn_opcodes_h_l1082_c11_ee0f_right,
BIN_OP_PLUS_uxn_opcodes_h_l1082_c11_ee0f_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1085_c32_9cb0
BIN_OP_AND_uxn_opcodes_h_l1085_c32_9cb0 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1085_c32_9cb0_left,
BIN_OP_AND_uxn_opcodes_h_l1085_c32_9cb0_right,
BIN_OP_AND_uxn_opcodes_h_l1085_c32_9cb0_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1085_c32_6641
BIN_OP_GT_uxn_opcodes_h_l1085_c32_6641 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1085_c32_6641_left,
BIN_OP_GT_uxn_opcodes_h_l1085_c32_6641_right,
BIN_OP_GT_uxn_opcodes_h_l1085_c32_6641_return_output);

-- MUX_uxn_opcodes_h_l1085_c32_4087
MUX_uxn_opcodes_h_l1085_c32_4087 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1085_c32_4087_cond,
MUX_uxn_opcodes_h_l1085_c32_4087_iftrue,
MUX_uxn_opcodes_h_l1085_c32_4087_iffalse,
MUX_uxn_opcodes_h_l1085_c32_4087_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1087_c11_cf40
BIN_OP_EQ_uxn_opcodes_h_l1087_c11_cf40 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1087_c11_cf40_left,
BIN_OP_EQ_uxn_opcodes_h_l1087_c11_cf40_right,
BIN_OP_EQ_uxn_opcodes_h_l1087_c11_cf40_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1087_c7_d0b8
result_is_stack_write_MUX_uxn_opcodes_h_l1087_c7_d0b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1087_c7_d0b8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1087_c7_d0b8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1087_c7_d0b8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1087_c7_d0b8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1087_c7_d0b8
result_is_opc_done_MUX_uxn_opcodes_h_l1087_c7_d0b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1087_c7_d0b8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1087_c7_d0b8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1087_c7_d0b8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1087_c7_d0b8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1087_c7_d0b8
result_is_sp_shift_MUX_uxn_opcodes_h_l1087_c7_d0b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1087_c7_d0b8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1087_c7_d0b8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1087_c7_d0b8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1087_c7_d0b8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1087_c7_d0b8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1087_c7_d0b8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1087_c7_d0b8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1087_c7_d0b8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1087_c7_d0b8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1087_c7_d0b8_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1087_c7_d0b8
result_stack_value_MUX_uxn_opcodes_h_l1087_c7_d0b8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1087_c7_d0b8_cond,
result_stack_value_MUX_uxn_opcodes_h_l1087_c7_d0b8_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1087_c7_d0b8_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1087_c7_d0b8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1093_c11_5b50
BIN_OP_EQ_uxn_opcodes_h_l1093_c11_5b50 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1093_c11_5b50_left,
BIN_OP_EQ_uxn_opcodes_h_l1093_c11_5b50_right,
BIN_OP_EQ_uxn_opcodes_h_l1093_c11_5b50_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c7_3a41
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c7_3a41 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c7_3a41_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c7_3a41_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c7_3a41_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c7_3a41_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1093_c7_3a41
result_is_stack_write_MUX_uxn_opcodes_h_l1093_c7_3a41 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1093_c7_3a41_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1093_c7_3a41_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1093_c7_3a41_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1093_c7_3a41_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1093_c7_3a41
result_is_opc_done_MUX_uxn_opcodes_h_l1093_c7_3a41 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1093_c7_3a41_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1093_c7_3a41_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1093_c7_3a41_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1093_c7_3a41_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1093_c7_3a41
result_stack_value_MUX_uxn_opcodes_h_l1093_c7_3a41 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1093_c7_3a41_cond,
result_stack_value_MUX_uxn_opcodes_h_l1093_c7_3a41_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1093_c7_3a41_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1093_c7_3a41_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1095_c34_83fe
CONST_SR_8_uxn_opcodes_h_l1095_c34_83fe : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1095_c34_83fe_x,
CONST_SR_8_uxn_opcodes_h_l1095_c34_83fe_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1097_c11_b4f6
BIN_OP_EQ_uxn_opcodes_h_l1097_c11_b4f6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1097_c11_b4f6_left,
BIN_OP_EQ_uxn_opcodes_h_l1097_c11_b4f6_right,
BIN_OP_EQ_uxn_opcodes_h_l1097_c11_b4f6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_1934
result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_1934 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_1934_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_1934_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_1934_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_1934_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_1934
result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_1934 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_1934_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_1934_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_1934_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_1934_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 pc,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 t16,
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1063_c6_597a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_04c2_return_output,
 tmp16_MUX_uxn_opcodes_h_l1063_c2_5754_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1063_c2_5754_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c2_5754_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1063_c2_5754_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1063_c2_5754_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c2_5754_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c2_5754_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1063_c2_5754_return_output,
 t16_MUX_uxn_opcodes_h_l1063_c2_5754_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1069_c11_ee82_return_output,
 tmp16_MUX_uxn_opcodes_h_l1069_c7_072b_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1069_c7_072b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1069_c7_072b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1069_c7_072b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1069_c7_072b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1069_c7_072b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1069_c7_072b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1069_c7_072b_return_output,
 t16_MUX_uxn_opcodes_h_l1069_c7_072b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1072_c11_b1bc_return_output,
 tmp16_MUX_uxn_opcodes_h_l1072_c7_ff90_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1072_c7_ff90_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_ff90_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_ff90_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_ff90_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_ff90_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_ff90_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1072_c7_ff90_return_output,
 t16_MUX_uxn_opcodes_h_l1072_c7_ff90_return_output,
 CONST_SL_8_uxn_opcodes_h_l1074_c3_d6f9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1077_c11_6163_return_output,
 tmp16_MUX_uxn_opcodes_h_l1077_c7_09b0_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1077_c7_09b0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1077_c7_09b0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1077_c7_09b0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1077_c7_09b0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1077_c7_09b0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1077_c7_09b0_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1077_c7_09b0_return_output,
 t16_MUX_uxn_opcodes_h_l1077_c7_09b0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1080_c11_4532_return_output,
 tmp16_MUX_uxn_opcodes_h_l1080_c7_5aaa_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1080_c7_5aaa_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_5aaa_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_5aaa_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_5aaa_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_5aaa_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_5aaa_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1080_c7_5aaa_return_output,
 t16_MUX_uxn_opcodes_h_l1080_c7_5aaa_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1081_c3_d7dc_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1082_c11_ee0f_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1085_c32_9cb0_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1085_c32_6641_return_output,
 MUX_uxn_opcodes_h_l1085_c32_4087_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1087_c11_cf40_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1087_c7_d0b8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1087_c7_d0b8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1087_c7_d0b8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1087_c7_d0b8_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1087_c7_d0b8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1093_c11_5b50_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c7_3a41_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1093_c7_3a41_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1093_c7_3a41_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1093_c7_3a41_return_output,
 CONST_SR_8_uxn_opcodes_h_l1095_c34_83fe_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1097_c11_b4f6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_1934_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_1934_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c6_597a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c6_597a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c6_597a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_04c2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_04c2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_04c2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_04c2_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1063_c2_5754_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1063_c2_5754_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1069_c7_072b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1063_c2_5754_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1063_c2_5754_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1063_c2_5754_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1063_c2_5754_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1069_c7_072b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1063_c2_5754_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1063_c2_5754_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c2_5754_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c2_5754_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1069_c7_072b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c2_5754_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c2_5754_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c2_5754_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c2_5754_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1069_c7_072b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c2_5754_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c2_5754_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1063_c2_5754_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1063_c2_5754_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1069_c7_072b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1063_c2_5754_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1063_c2_5754_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c2_5754_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c2_5754_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1069_c7_072b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c2_5754_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c2_5754_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c2_5754_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1066_c3_55b8 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c2_5754_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1069_c7_072b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c2_5754_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c2_5754_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1063_c2_5754_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1063_c2_5754_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1069_c7_072b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1063_c2_5754_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1063_c2_5754_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1063_c2_5754_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1063_c2_5754_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1069_c7_072b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1063_c2_5754_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1063_c2_5754_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1064_c3_ea43_uxn_opcodes_h_l1064_c3_ea43_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_ee82_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_ee82_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_ee82_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1069_c7_072b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1069_c7_072b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1072_c7_ff90_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1069_c7_072b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1069_c7_072b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1069_c7_072b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1072_c7_ff90_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1069_c7_072b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1069_c7_072b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1069_c7_072b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_ff90_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1069_c7_072b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1069_c7_072b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1069_c7_072b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_ff90_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1069_c7_072b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1069_c7_072b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1069_c7_072b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_ff90_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1069_c7_072b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1069_c7_072b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1069_c7_072b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_ff90_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1069_c7_072b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1069_c7_072b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1070_c3_9ee1 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1069_c7_072b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_ff90_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1069_c7_072b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1069_c7_072b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1069_c7_072b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1072_c7_ff90_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1069_c7_072b_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1069_c7_072b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1069_c7_072b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1072_c7_ff90_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1069_c7_072b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_b1bc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_b1bc_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_b1bc_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1072_c7_ff90_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1072_c7_ff90_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1077_c7_09b0_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1072_c7_ff90_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1072_c7_ff90_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1072_c7_ff90_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1077_c7_09b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1072_c7_ff90_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_ff90_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_ff90_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1077_c7_09b0_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_ff90_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_ff90_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_ff90_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1077_c7_09b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_ff90_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_ff90_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_ff90_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1077_c7_09b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_ff90_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_ff90_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_ff90_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1077_c7_09b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_ff90_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_ff90_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1075_c3_d4de : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_ff90_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1077_c7_09b0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_ff90_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1072_c7_ff90_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1072_c7_ff90_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1077_c7_09b0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1072_c7_ff90_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1072_c7_ff90_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1072_c7_ff90_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1077_c7_09b0_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1072_c7_ff90_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1074_c3_d6f9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1074_c3_d6f9_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1077_c11_6163_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1077_c11_6163_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1077_c11_6163_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1077_c7_09b0_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1077_c7_09b0_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1080_c7_5aaa_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1077_c7_09b0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1077_c7_09b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1077_c7_09b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1080_c7_5aaa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1077_c7_09b0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1077_c7_09b0_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1077_c7_09b0_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_5aaa_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1077_c7_09b0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1077_c7_09b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1077_c7_09b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_5aaa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1077_c7_09b0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1077_c7_09b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1077_c7_09b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_5aaa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1077_c7_09b0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1077_c7_09b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1077_c7_09b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_5aaa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1077_c7_09b0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1077_c7_09b0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1078_c3_87d4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1077_c7_09b0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_5aaa_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1077_c7_09b0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1077_c7_09b0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1077_c7_09b0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1080_c7_5aaa_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1077_c7_09b0_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1077_c7_09b0_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1077_c7_09b0_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1080_c7_5aaa_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1077_c7_09b0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_4532_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_4532_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_4532_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1080_c7_5aaa_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l1082_c3_c633 : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1080_c7_5aaa_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1080_c7_5aaa_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1080_c7_5aaa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1080_c7_5aaa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1080_c7_5aaa_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_5aaa_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_5aaa_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_5aaa_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_5aaa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_5aaa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1087_c7_d0b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_5aaa_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_5aaa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_5aaa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1087_c7_d0b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_5aaa_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_5aaa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_5aaa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1087_c7_d0b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_5aaa_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_5aaa_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_5aaa_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1087_c7_d0b8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_5aaa_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1080_c7_5aaa_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1080_c7_5aaa_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1087_c7_d0b8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1080_c7_5aaa_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1080_c7_5aaa_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1080_c7_5aaa_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1080_c7_5aaa_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1081_c3_d7dc_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1081_c3_d7dc_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1081_c3_d7dc_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1082_c11_ee0f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1082_c11_ee0f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1082_c11_ee0f_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1085_c32_4087_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1085_c32_4087_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1085_c32_4087_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1085_c32_9cb0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1085_c32_9cb0_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1085_c32_9cb0_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1085_c32_6641_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1085_c32_6641_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1085_c32_6641_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1085_c32_4087_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1087_c11_cf40_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1087_c11_cf40_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1087_c11_cf40_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1087_c7_d0b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1087_c7_d0b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1093_c7_3a41_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1087_c7_d0b8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1087_c7_d0b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1087_c7_d0b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1093_c7_3a41_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1087_c7_d0b8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1087_c7_d0b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1087_c7_d0b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1087_c7_d0b8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1087_c7_d0b8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1090_c3_e129 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1087_c7_d0b8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c7_3a41_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1087_c7_d0b8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1087_c7_d0b8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1087_c7_d0b8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1093_c7_3a41_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1087_c7_d0b8_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1091_c24_9241_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1093_c11_5b50_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1093_c11_5b50_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1093_c11_5b50_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c7_3a41_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1094_c3_1bcb : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c7_3a41_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c7_3a41_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1093_c7_3a41_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1093_c7_3a41_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_1934_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1093_c7_3a41_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1093_c7_3a41_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1093_c7_3a41_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_1934_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1093_c7_3a41_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1093_c7_3a41_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1093_c7_3a41_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1093_c7_3a41_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1095_c34_83fe_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1095_c34_83fe_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1095_c24_be5a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c11_b4f6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c11_b4f6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c11_b4f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_1934_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_1934_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_1934_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_1934_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_1934_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_1934_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1080_l1077_l1072_l1069_l1063_DUPLICATE_017c_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1080_l1077_l1072_l1069_l1097_l1063_l1093_DUPLICATE_86cc_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1087_l1077_l1072_l1069_l1063_DUPLICATE_3863_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1080_l1077_l1072_l1069_l1063_l1093_DUPLICATE_9a0f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1072_l1077_l1069_l1080_DUPLICATE_f644_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1087_l1080_l1077_l1072_l1069_l1097_l1093_DUPLICATE_3abb_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1081_l1073_DUPLICATE_9660_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1093_l1080_DUPLICATE_de56_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l1102_l1059_DUPLICATE_92b0_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1077_c11_6163_right := to_unsigned(3, 2);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1085_c32_6641_right := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_04c2_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1093_c11_5b50_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_ee82_right := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1085_c32_9cb0_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c11_b4f6_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1070_c3_9ee1 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1069_c7_072b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1070_c3_9ee1;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_1934_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c2_5754_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_5aaa_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1085_c32_4087_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_MUX_uxn_opcodes_h_l1085_c32_4087_iffalse := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1080_c7_5aaa_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1090_c3_e129 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1087_c7_d0b8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1090_c3_e129;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1078_c3_87d4 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1077_c7_09b0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1078_c3_87d4;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1082_c11_ee0f_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_4532_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1094_c3_1bcb := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c7_3a41_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1094_c3_1bcb;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1066_c3_55b8 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c2_5754_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1066_c3_55b8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_b1bc_right := to_unsigned(2, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1087_c7_d0b8_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1087_c7_d0b8_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1075_c3_d4de := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_ff90_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1075_c3_d4de;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c6_597a_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_1934_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1063_c2_5754_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1087_c11_cf40_right := to_unsigned(5, 3);

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
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_04c2_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1085_c32_9cb0_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c6_597a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_ee82_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_b1bc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1077_c11_6163_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_4532_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1087_c11_cf40_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1093_c11_5b50_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c11_b4f6_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1081_c3_d7dc_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1063_c2_5754_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1069_c7_072b_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1077_c7_09b0_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1080_c7_5aaa_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1095_c34_83fe_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1063_c2_5754_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1069_c7_072b_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1072_c7_ff90_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1077_c7_09b0_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1080_c7_5aaa_iffalse := tmp16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1080_l1077_l1072_l1069_l1097_l1063_l1093_DUPLICATE_86cc LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1080_l1077_l1072_l1069_l1097_l1063_l1093_DUPLICATE_86cc_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1072_c11_b1bc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1072_c11_b1bc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_b1bc_left;
     BIN_OP_EQ_uxn_opcodes_h_l1072_c11_b1bc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_b1bc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_b1bc_return_output := BIN_OP_EQ_uxn_opcodes_h_l1072_c11_b1bc_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1085_c32_9cb0] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1085_c32_9cb0_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1085_c32_9cb0_left;
     BIN_OP_AND_uxn_opcodes_h_l1085_c32_9cb0_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1085_c32_9cb0_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1085_c32_9cb0_return_output := BIN_OP_AND_uxn_opcodes_h_l1085_c32_9cb0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1063_c6_597a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1063_c6_597a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c6_597a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1063_c6_597a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c6_597a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c6_597a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1063_c6_597a_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1080_l1077_l1072_l1069_l1063_DUPLICATE_017c LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1080_l1077_l1072_l1069_l1063_DUPLICATE_017c_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1087_l1080_l1077_l1072_l1069_l1097_l1093_DUPLICATE_3abb LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1087_l1080_l1077_l1072_l1069_l1097_l1093_DUPLICATE_3abb_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1080_l1077_l1072_l1069_l1063_l1093_DUPLICATE_9a0f LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1080_l1077_l1072_l1069_l1063_l1093_DUPLICATE_9a0f_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1077_c11_6163] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1077_c11_6163_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1077_c11_6163_left;
     BIN_OP_EQ_uxn_opcodes_h_l1077_c11_6163_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1077_c11_6163_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1077_c11_6163_return_output := BIN_OP_EQ_uxn_opcodes_h_l1077_c11_6163_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1091_c24_9241] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1091_c24_9241_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- BIN_OP_EQ[uxn_opcodes_h_l1097_c11_b4f6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1097_c11_b4f6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c11_b4f6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1097_c11_b4f6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c11_b4f6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c11_b4f6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1097_c11_b4f6_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1072_l1077_l1069_l1080_DUPLICATE_f644 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1072_l1077_l1069_l1080_DUPLICATE_f644_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l1087_c11_cf40] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1087_c11_cf40_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1087_c11_cf40_left;
     BIN_OP_EQ_uxn_opcodes_h_l1087_c11_cf40_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1087_c11_cf40_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1087_c11_cf40_return_output := BIN_OP_EQ_uxn_opcodes_h_l1087_c11_cf40_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1093_l1080_DUPLICATE_de56 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1093_l1080_DUPLICATE_de56_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1087_l1077_l1072_l1069_l1063_DUPLICATE_3863 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1087_l1077_l1072_l1069_l1063_DUPLICATE_3863_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1069_c11_ee82] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1069_c11_ee82_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_ee82_left;
     BIN_OP_EQ_uxn_opcodes_h_l1069_c11_ee82_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_ee82_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_ee82_return_output := BIN_OP_EQ_uxn_opcodes_h_l1069_c11_ee82_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1080_c11_4532] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1080_c11_4532_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_4532_left;
     BIN_OP_EQ_uxn_opcodes_h_l1080_c11_4532_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_4532_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_4532_return_output := BIN_OP_EQ_uxn_opcodes_h_l1080_c11_4532_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1093_c11_5b50] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1093_c11_5b50_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1093_c11_5b50_left;
     BIN_OP_EQ_uxn_opcodes_h_l1093_c11_5b50_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1093_c11_5b50_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1093_c11_5b50_return_output := BIN_OP_EQ_uxn_opcodes_h_l1093_c11_5b50_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1095_c34_83fe] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1095_c34_83fe_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1095_c34_83fe_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1095_c34_83fe_return_output := CONST_SR_8_uxn_opcodes_h_l1095_c34_83fe_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1081_l1073_DUPLICATE_9660 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1081_l1073_DUPLICATE_9660_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1085_c32_6641_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1085_c32_9cb0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_04c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c6_597a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c2_5754_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c6_597a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c2_5754_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c6_597a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1063_c2_5754_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c6_597a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1063_c2_5754_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c6_597a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c2_5754_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c6_597a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c2_5754_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c6_597a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1063_c2_5754_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c6_597a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1063_c2_5754_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c6_597a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1063_c2_5754_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c6_597a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1069_c7_072b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_ee82_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1069_c7_072b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_ee82_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1069_c7_072b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_ee82_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1069_c7_072b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_ee82_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1069_c7_072b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_ee82_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1069_c7_072b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_ee82_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1069_c7_072b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_ee82_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1069_c7_072b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_ee82_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1069_c7_072b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_ee82_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_ff90_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_b1bc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_ff90_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_b1bc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1072_c7_ff90_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_b1bc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_ff90_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_b1bc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_ff90_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_b1bc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_ff90_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_b1bc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1072_c7_ff90_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_b1bc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1072_c7_ff90_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_b1bc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1072_c7_ff90_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_b1bc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1077_c7_09b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1077_c11_6163_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1077_c7_09b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1077_c11_6163_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1077_c7_09b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1077_c11_6163_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1077_c7_09b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1077_c11_6163_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1077_c7_09b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1077_c11_6163_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1077_c7_09b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1077_c11_6163_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1077_c7_09b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1077_c11_6163_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1077_c7_09b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1077_c11_6163_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1077_c7_09b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1077_c11_6163_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_5aaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_4532_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_5aaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_4532_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1080_c7_5aaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_4532_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_5aaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_4532_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_5aaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_4532_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_5aaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_4532_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1080_c7_5aaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_4532_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1080_c7_5aaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_4532_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1080_c7_5aaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_4532_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1087_c7_d0b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1087_c11_cf40_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1087_c7_d0b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1087_c11_cf40_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1087_c7_d0b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1087_c11_cf40_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1087_c7_d0b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1087_c11_cf40_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1087_c7_d0b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1087_c11_cf40_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1093_c7_3a41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1093_c11_5b50_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1093_c7_3a41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1093_c11_5b50_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c7_3a41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1093_c11_5b50_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1093_c7_3a41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1093_c11_5b50_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_1934_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c11_b4f6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_1934_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c11_b4f6_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1081_c3_d7dc_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1081_l1073_DUPLICATE_9660_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1074_c3_d6f9_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1081_l1073_DUPLICATE_9660_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1087_c7_d0b8_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1091_c24_9241_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c2_5754_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1080_l1077_l1072_l1069_l1063_DUPLICATE_017c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1069_c7_072b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1080_l1077_l1072_l1069_l1063_DUPLICATE_017c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_ff90_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1080_l1077_l1072_l1069_l1063_DUPLICATE_017c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1077_c7_09b0_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1080_l1077_l1072_l1069_l1063_DUPLICATE_017c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_5aaa_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1080_l1077_l1072_l1069_l1063_DUPLICATE_017c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1069_c7_072b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1087_l1080_l1077_l1072_l1069_l1097_l1093_DUPLICATE_3abb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_ff90_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1087_l1080_l1077_l1072_l1069_l1097_l1093_DUPLICATE_3abb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1077_c7_09b0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1087_l1080_l1077_l1072_l1069_l1097_l1093_DUPLICATE_3abb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_5aaa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1087_l1080_l1077_l1072_l1069_l1097_l1093_DUPLICATE_3abb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1087_c7_d0b8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1087_l1080_l1077_l1072_l1069_l1097_l1093_DUPLICATE_3abb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1093_c7_3a41_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1087_l1080_l1077_l1072_l1069_l1097_l1093_DUPLICATE_3abb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_1934_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1087_l1080_l1077_l1072_l1069_l1097_l1093_DUPLICATE_3abb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c2_5754_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1087_l1077_l1072_l1069_l1063_DUPLICATE_3863_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1069_c7_072b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1087_l1077_l1072_l1069_l1063_DUPLICATE_3863_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_ff90_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1087_l1077_l1072_l1069_l1063_DUPLICATE_3863_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1077_c7_09b0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1087_l1077_l1072_l1069_l1063_DUPLICATE_3863_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1087_c7_d0b8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1087_l1077_l1072_l1069_l1063_DUPLICATE_3863_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1069_c7_072b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1072_l1077_l1069_l1080_DUPLICATE_f644_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1072_c7_ff90_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1072_l1077_l1069_l1080_DUPLICATE_f644_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1077_c7_09b0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1072_l1077_l1069_l1080_DUPLICATE_f644_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1080_c7_5aaa_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1072_l1077_l1069_l1080_DUPLICATE_f644_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1063_c2_5754_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1080_l1077_l1072_l1069_l1097_l1063_l1093_DUPLICATE_86cc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1069_c7_072b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1080_l1077_l1072_l1069_l1097_l1063_l1093_DUPLICATE_86cc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_ff90_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1080_l1077_l1072_l1069_l1097_l1063_l1093_DUPLICATE_86cc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1077_c7_09b0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1080_l1077_l1072_l1069_l1097_l1063_l1093_DUPLICATE_86cc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_5aaa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1080_l1077_l1072_l1069_l1097_l1063_l1093_DUPLICATE_86cc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1093_c7_3a41_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1080_l1077_l1072_l1069_l1097_l1063_l1093_DUPLICATE_86cc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_1934_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1080_l1077_l1072_l1069_l1097_l1063_l1093_DUPLICATE_86cc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_5aaa_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1093_l1080_DUPLICATE_de56_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c7_3a41_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1093_l1080_DUPLICATE_de56_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1063_c2_5754_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1080_l1077_l1072_l1069_l1063_l1093_DUPLICATE_9a0f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1069_c7_072b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1080_l1077_l1072_l1069_l1063_l1093_DUPLICATE_9a0f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1072_c7_ff90_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1080_l1077_l1072_l1069_l1063_l1093_DUPLICATE_9a0f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1077_c7_09b0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1080_l1077_l1072_l1069_l1063_l1093_DUPLICATE_9a0f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1080_c7_5aaa_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1080_l1077_l1072_l1069_l1063_l1093_DUPLICATE_9a0f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1093_c7_3a41_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1080_l1077_l1072_l1069_l1063_l1093_DUPLICATE_9a0f_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1093_c7_3a41] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c7_3a41_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c7_3a41_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c7_3a41_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c7_3a41_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c7_3a41_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c7_3a41_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c7_3a41_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c7_3a41_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1074_c3_d6f9] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1074_c3_d6f9_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1074_c3_d6f9_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1074_c3_d6f9_return_output := CONST_SL_8_uxn_opcodes_h_l1074_c3_d6f9_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1095_c24_be5a] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1095_c24_be5a_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1095_c34_83fe_return_output);

     -- BIN_OP_OR[uxn_opcodes_h_l1081_c3_d7dc] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1081_c3_d7dc_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1081_c3_d7dc_left;
     BIN_OP_OR_uxn_opcodes_h_l1081_c3_d7dc_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1081_c3_d7dc_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1081_c3_d7dc_return_output := BIN_OP_OR_uxn_opcodes_h_l1081_c3_d7dc_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1063_c1_04c2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_04c2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_04c2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_04c2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_04c2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_04c2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_04c2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_04c2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_04c2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1097_c7_1934] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_1934_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_1934_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_1934_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_1934_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_1934_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_1934_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_1934_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_1934_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1087_c7_d0b8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1087_c7_d0b8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1087_c7_d0b8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1087_c7_d0b8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1087_c7_d0b8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1087_c7_d0b8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1087_c7_d0b8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1087_c7_d0b8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1087_c7_d0b8_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1080_c7_5aaa] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1080_c7_5aaa_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1080_c7_5aaa_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1080_c7_5aaa_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1080_c7_5aaa_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1080_c7_5aaa_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1080_c7_5aaa_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1080_c7_5aaa_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1080_c7_5aaa_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1085_c32_6641] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1085_c32_6641_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1085_c32_6641_left;
     BIN_OP_GT_uxn_opcodes_h_l1085_c32_6641_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1085_c32_6641_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1085_c32_6641_return_output := BIN_OP_GT_uxn_opcodes_h_l1085_c32_6641_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1097_c7_1934] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_1934_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_1934_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_1934_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_1934_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_1934_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_1934_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_1934_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_1934_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1085_c32_4087_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1085_c32_6641_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1082_c11_ee0f_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1081_c3_d7dc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1080_c7_5aaa_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1081_c3_d7dc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1093_c7_3a41_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1095_c24_be5a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1072_c7_ff90_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1074_c3_d6f9_return_output;
     VAR_printf_uxn_opcodes_h_l1064_c3_ea43_uxn_opcodes_h_l1064_c3_ea43_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_04c2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1093_c7_3a41_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_1934_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_5aaa_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1087_c7_d0b8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1077_c7_09b0_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1080_c7_5aaa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1093_c7_3a41_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_1934_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1087_c7_d0b8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c7_3a41_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1093_c7_3a41] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1093_c7_3a41_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1093_c7_3a41_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1093_c7_3a41_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1093_c7_3a41_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1093_c7_3a41_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1093_c7_3a41_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1093_c7_3a41_return_output := result_stack_value_MUX_uxn_opcodes_h_l1093_c7_3a41_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1080_c7_5aaa] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_5aaa_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_5aaa_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_5aaa_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_5aaa_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_5aaa_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_5aaa_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_5aaa_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_5aaa_return_output;

     -- printf_uxn_opcodes_h_l1064_c3_ea43[uxn_opcodes_h_l1064_c3_ea43] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1064_c3_ea43_uxn_opcodes_h_l1064_c3_ea43_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1064_c3_ea43_uxn_opcodes_h_l1064_c3_ea43_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1093_c7_3a41] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1093_c7_3a41_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1093_c7_3a41_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1093_c7_3a41_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1093_c7_3a41_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1093_c7_3a41_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1093_c7_3a41_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1093_c7_3a41_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1093_c7_3a41_return_output;

     -- MUX[uxn_opcodes_h_l1085_c32_4087] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1085_c32_4087_cond <= VAR_MUX_uxn_opcodes_h_l1085_c32_4087_cond;
     MUX_uxn_opcodes_h_l1085_c32_4087_iftrue <= VAR_MUX_uxn_opcodes_h_l1085_c32_4087_iftrue;
     MUX_uxn_opcodes_h_l1085_c32_4087_iffalse <= VAR_MUX_uxn_opcodes_h_l1085_c32_4087_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1085_c32_4087_return_output := MUX_uxn_opcodes_h_l1085_c32_4087_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1077_c7_09b0] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1077_c7_09b0_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1077_c7_09b0_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1077_c7_09b0_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1077_c7_09b0_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1077_c7_09b0_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1077_c7_09b0_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1077_c7_09b0_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1077_c7_09b0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1087_c7_d0b8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1087_c7_d0b8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1087_c7_d0b8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1087_c7_d0b8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1087_c7_d0b8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1087_c7_d0b8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1087_c7_d0b8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1087_c7_d0b8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1087_c7_d0b8_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1082_c11_ee0f] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1082_c11_ee0f_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1082_c11_ee0f_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1082_c11_ee0f_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1082_c11_ee0f_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1082_c11_ee0f_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1082_c11_ee0f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1093_c7_3a41] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1093_c7_3a41_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1093_c7_3a41_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1093_c7_3a41_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1093_c7_3a41_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1093_c7_3a41_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1093_c7_3a41_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1093_c7_3a41_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1093_c7_3a41_return_output;

     -- t16_MUX[uxn_opcodes_h_l1080_c7_5aaa] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1080_c7_5aaa_cond <= VAR_t16_MUX_uxn_opcodes_h_l1080_c7_5aaa_cond;
     t16_MUX_uxn_opcodes_h_l1080_c7_5aaa_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1080_c7_5aaa_iftrue;
     t16_MUX_uxn_opcodes_h_l1080_c7_5aaa_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1080_c7_5aaa_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1080_c7_5aaa_return_output := t16_MUX_uxn_opcodes_h_l1080_c7_5aaa_return_output;

     -- Submodule level 3
     VAR_tmp16_uxn_opcodes_h_l1082_c3_c633 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1082_c11_ee0f_return_output, 16);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_5aaa_iftrue := VAR_MUX_uxn_opcodes_h_l1085_c32_4087_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1087_c7_d0b8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1093_c7_3a41_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1077_c7_09b0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_5aaa_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1072_c7_ff90_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1077_c7_09b0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1087_c7_d0b8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1093_c7_3a41_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_5aaa_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1087_c7_d0b8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1087_c7_d0b8_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1093_c7_3a41_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1077_c7_09b0_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1080_c7_5aaa_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1080_c7_5aaa_iftrue := VAR_tmp16_uxn_opcodes_h_l1082_c3_c633;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1087_c7_d0b8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1087_c7_d0b8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1087_c7_d0b8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1087_c7_d0b8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1087_c7_d0b8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1087_c7_d0b8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1087_c7_d0b8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1087_c7_d0b8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1087_c7_d0b8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1087_c7_d0b8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1087_c7_d0b8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1087_c7_d0b8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1087_c7_d0b8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1087_c7_d0b8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1087_c7_d0b8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1087_c7_d0b8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1087_c7_d0b8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1087_c7_d0b8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1080_c7_5aaa] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_5aaa_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_5aaa_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_5aaa_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_5aaa_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_5aaa_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_5aaa_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_5aaa_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_5aaa_return_output;

     -- t16_MUX[uxn_opcodes_h_l1077_c7_09b0] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1077_c7_09b0_cond <= VAR_t16_MUX_uxn_opcodes_h_l1077_c7_09b0_cond;
     t16_MUX_uxn_opcodes_h_l1077_c7_09b0_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1077_c7_09b0_iftrue;
     t16_MUX_uxn_opcodes_h_l1077_c7_09b0_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1077_c7_09b0_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1077_c7_09b0_return_output := t16_MUX_uxn_opcodes_h_l1077_c7_09b0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1080_c7_5aaa] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_5aaa_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_5aaa_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_5aaa_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_5aaa_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_5aaa_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_5aaa_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_5aaa_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_5aaa_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1072_c7_ff90] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1072_c7_ff90_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1072_c7_ff90_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1072_c7_ff90_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1072_c7_ff90_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1072_c7_ff90_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1072_c7_ff90_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1072_c7_ff90_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1072_c7_ff90_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1087_c7_d0b8] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1087_c7_d0b8_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1087_c7_d0b8_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1087_c7_d0b8_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1087_c7_d0b8_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1087_c7_d0b8_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1087_c7_d0b8_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1087_c7_d0b8_return_output := result_stack_value_MUX_uxn_opcodes_h_l1087_c7_d0b8_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1080_c7_5aaa] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1080_c7_5aaa_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1080_c7_5aaa_cond;
     tmp16_MUX_uxn_opcodes_h_l1080_c7_5aaa_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1080_c7_5aaa_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1080_c7_5aaa_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1080_c7_5aaa_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1080_c7_5aaa_return_output := tmp16_MUX_uxn_opcodes_h_l1080_c7_5aaa_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1077_c7_09b0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1077_c7_09b0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1077_c7_09b0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1077_c7_09b0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1077_c7_09b0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1077_c7_09b0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1077_c7_09b0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1077_c7_09b0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1077_c7_09b0_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_5aaa_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1087_c7_d0b8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_ff90_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1077_c7_09b0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1069_c7_072b_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1072_c7_ff90_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_5aaa_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1087_c7_d0b8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1077_c7_09b0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_5aaa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1077_c7_09b0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_5aaa_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1080_c7_5aaa_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1087_c7_d0b8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1072_c7_ff90_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1077_c7_09b0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1077_c7_09b0_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1080_c7_5aaa_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1072_c7_ff90] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_ff90_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_ff90_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_ff90_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_ff90_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_ff90_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_ff90_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_ff90_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_ff90_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1077_c7_09b0] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1077_c7_09b0_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1077_c7_09b0_cond;
     tmp16_MUX_uxn_opcodes_h_l1077_c7_09b0_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1077_c7_09b0_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1077_c7_09b0_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1077_c7_09b0_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1077_c7_09b0_return_output := tmp16_MUX_uxn_opcodes_h_l1077_c7_09b0_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1069_c7_072b] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1069_c7_072b_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1069_c7_072b_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1069_c7_072b_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1069_c7_072b_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1069_c7_072b_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1069_c7_072b_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1069_c7_072b_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1069_c7_072b_return_output;

     -- t16_MUX[uxn_opcodes_h_l1072_c7_ff90] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1072_c7_ff90_cond <= VAR_t16_MUX_uxn_opcodes_h_l1072_c7_ff90_cond;
     t16_MUX_uxn_opcodes_h_l1072_c7_ff90_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1072_c7_ff90_iftrue;
     t16_MUX_uxn_opcodes_h_l1072_c7_ff90_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1072_c7_ff90_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1072_c7_ff90_return_output := t16_MUX_uxn_opcodes_h_l1072_c7_ff90_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1077_c7_09b0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1077_c7_09b0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1077_c7_09b0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1077_c7_09b0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1077_c7_09b0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1077_c7_09b0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1077_c7_09b0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1077_c7_09b0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1077_c7_09b0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1080_c7_5aaa] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_5aaa_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_5aaa_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_5aaa_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_5aaa_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_5aaa_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_5aaa_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_5aaa_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_5aaa_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1080_c7_5aaa] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1080_c7_5aaa_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1080_c7_5aaa_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1080_c7_5aaa_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1080_c7_5aaa_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1080_c7_5aaa_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1080_c7_5aaa_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1080_c7_5aaa_return_output := result_stack_value_MUX_uxn_opcodes_h_l1080_c7_5aaa_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1077_c7_09b0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1077_c7_09b0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1077_c7_09b0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1077_c7_09b0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1077_c7_09b0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1077_c7_09b0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1077_c7_09b0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1077_c7_09b0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1077_c7_09b0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1080_c7_5aaa] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_5aaa_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_5aaa_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_5aaa_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_5aaa_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_5aaa_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_5aaa_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_5aaa_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_5aaa_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1077_c7_09b0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_5aaa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1069_c7_072b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_ff90_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1063_c2_5754_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1069_c7_072b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1077_c7_09b0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_5aaa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_ff90_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1077_c7_09b0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_ff90_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1077_c7_09b0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1077_c7_09b0_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1080_c7_5aaa_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1069_c7_072b_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1072_c7_ff90_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1072_c7_ff90_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1077_c7_09b0_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1063_c2_5754] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1063_c2_5754_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1063_c2_5754_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1063_c2_5754_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1063_c2_5754_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1063_c2_5754_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1063_c2_5754_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1063_c2_5754_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1063_c2_5754_return_output;

     -- t16_MUX[uxn_opcodes_h_l1069_c7_072b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1069_c7_072b_cond <= VAR_t16_MUX_uxn_opcodes_h_l1069_c7_072b_cond;
     t16_MUX_uxn_opcodes_h_l1069_c7_072b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1069_c7_072b_iftrue;
     t16_MUX_uxn_opcodes_h_l1069_c7_072b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1069_c7_072b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1069_c7_072b_return_output := t16_MUX_uxn_opcodes_h_l1069_c7_072b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1072_c7_ff90] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_ff90_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_ff90_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_ff90_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_ff90_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_ff90_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_ff90_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_ff90_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_ff90_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1077_c7_09b0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1077_c7_09b0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1077_c7_09b0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1077_c7_09b0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1077_c7_09b0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1077_c7_09b0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1077_c7_09b0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1077_c7_09b0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1077_c7_09b0_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1072_c7_ff90] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1072_c7_ff90_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1072_c7_ff90_cond;
     tmp16_MUX_uxn_opcodes_h_l1072_c7_ff90_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1072_c7_ff90_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1072_c7_ff90_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1072_c7_ff90_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1072_c7_ff90_return_output := tmp16_MUX_uxn_opcodes_h_l1072_c7_ff90_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1072_c7_ff90] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_ff90_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_ff90_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_ff90_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_ff90_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_ff90_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_ff90_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_ff90_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_ff90_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1069_c7_072b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1069_c7_072b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1069_c7_072b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1069_c7_072b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1069_c7_072b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1069_c7_072b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1069_c7_072b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1069_c7_072b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1069_c7_072b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1077_c7_09b0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1077_c7_09b0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1077_c7_09b0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1077_c7_09b0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1077_c7_09b0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1077_c7_09b0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1077_c7_09b0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1077_c7_09b0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1077_c7_09b0_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1077_c7_09b0] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1077_c7_09b0_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1077_c7_09b0_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1077_c7_09b0_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1077_c7_09b0_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1077_c7_09b0_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1077_c7_09b0_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1077_c7_09b0_return_output := result_stack_value_MUX_uxn_opcodes_h_l1077_c7_09b0_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_ff90_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1077_c7_09b0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c2_5754_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1069_c7_072b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_ff90_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1077_c7_09b0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1069_c7_072b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_ff90_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1069_c7_072b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_ff90_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1072_c7_ff90_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1077_c7_09b0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1063_c2_5754_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1069_c7_072b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1069_c7_072b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1072_c7_ff90_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1072_c7_ff90] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1072_c7_ff90_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1072_c7_ff90_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1072_c7_ff90_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1072_c7_ff90_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1072_c7_ff90_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1072_c7_ff90_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1072_c7_ff90_return_output := result_stack_value_MUX_uxn_opcodes_h_l1072_c7_ff90_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1069_c7_072b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1069_c7_072b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1069_c7_072b_cond;
     tmp16_MUX_uxn_opcodes_h_l1069_c7_072b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1069_c7_072b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1069_c7_072b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1069_c7_072b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1069_c7_072b_return_output := tmp16_MUX_uxn_opcodes_h_l1069_c7_072b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1063_c2_5754] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c2_5754_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c2_5754_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c2_5754_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c2_5754_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c2_5754_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c2_5754_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c2_5754_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c2_5754_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1069_c7_072b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1069_c7_072b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1069_c7_072b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1069_c7_072b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1069_c7_072b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1069_c7_072b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1069_c7_072b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1069_c7_072b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1069_c7_072b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1072_c7_ff90] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_ff90_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_ff90_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_ff90_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_ff90_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_ff90_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_ff90_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_ff90_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_ff90_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1069_c7_072b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1069_c7_072b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1069_c7_072b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1069_c7_072b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1069_c7_072b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1069_c7_072b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1069_c7_072b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1069_c7_072b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1069_c7_072b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1072_c7_ff90] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_ff90_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_ff90_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_ff90_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_ff90_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_ff90_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_ff90_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_ff90_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_ff90_return_output;

     -- t16_MUX[uxn_opcodes_h_l1063_c2_5754] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1063_c2_5754_cond <= VAR_t16_MUX_uxn_opcodes_h_l1063_c2_5754_cond;
     t16_MUX_uxn_opcodes_h_l1063_c2_5754_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1063_c2_5754_iftrue;
     t16_MUX_uxn_opcodes_h_l1063_c2_5754_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1063_c2_5754_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1063_c2_5754_return_output := t16_MUX_uxn_opcodes_h_l1063_c2_5754_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1069_c7_072b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_ff90_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1069_c7_072b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_ff90_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c2_5754_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1069_c7_072b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c2_5754_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1069_c7_072b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1069_c7_072b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1072_c7_ff90_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1063_c2_5754_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1063_c2_5754_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1069_c7_072b_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1069_c7_072b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1069_c7_072b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1069_c7_072b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1069_c7_072b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1069_c7_072b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1069_c7_072b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1069_c7_072b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1069_c7_072b_return_output := result_stack_value_MUX_uxn_opcodes_h_l1069_c7_072b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1063_c2_5754] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c2_5754_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c2_5754_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c2_5754_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c2_5754_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c2_5754_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c2_5754_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c2_5754_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c2_5754_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1069_c7_072b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1069_c7_072b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1069_c7_072b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1069_c7_072b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1069_c7_072b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1069_c7_072b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1069_c7_072b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1069_c7_072b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1069_c7_072b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1069_c7_072b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1069_c7_072b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1069_c7_072b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1069_c7_072b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1069_c7_072b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1069_c7_072b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1069_c7_072b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1069_c7_072b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1069_c7_072b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1063_c2_5754] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1063_c2_5754_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1063_c2_5754_cond;
     tmp16_MUX_uxn_opcodes_h_l1063_c2_5754_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1063_c2_5754_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1063_c2_5754_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1063_c2_5754_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1063_c2_5754_return_output := tmp16_MUX_uxn_opcodes_h_l1063_c2_5754_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1063_c2_5754] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c2_5754_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c2_5754_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c2_5754_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c2_5754_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c2_5754_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c2_5754_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c2_5754_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c2_5754_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c2_5754_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1069_c7_072b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1063_c2_5754_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1069_c7_072b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1063_c2_5754_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1069_c7_072b_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1063_c2_5754_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1063_c2_5754] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1063_c2_5754_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1063_c2_5754_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1063_c2_5754_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1063_c2_5754_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1063_c2_5754_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1063_c2_5754_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1063_c2_5754_return_output := result_stack_value_MUX_uxn_opcodes_h_l1063_c2_5754_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1063_c2_5754] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1063_c2_5754_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c2_5754_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1063_c2_5754_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c2_5754_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1063_c2_5754_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c2_5754_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c2_5754_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1063_c2_5754_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1063_c2_5754] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1063_c2_5754_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1063_c2_5754_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1063_c2_5754_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1063_c2_5754_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1063_c2_5754_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1063_c2_5754_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1063_c2_5754_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1063_c2_5754_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l1102_l1059_DUPLICATE_92b0 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l1102_l1059_DUPLICATE_92b0_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_28d7(
     result,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1063_c2_5754_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c2_5754_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c2_5754_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1063_c2_5754_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c2_5754_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c2_5754_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1063_c2_5754_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l1102_l1059_DUPLICATE_92b0_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l1102_l1059_DUPLICATE_92b0_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
