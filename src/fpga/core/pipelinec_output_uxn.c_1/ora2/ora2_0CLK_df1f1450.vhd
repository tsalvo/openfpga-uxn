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
-- Submodules: 114
entity ora2_0CLK_df1f1450 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ora2_0CLK_df1f1450;
architecture arch of ora2_0CLK_df1f1450 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1097_c6_75cc]
signal BIN_OP_EQ_uxn_opcodes_h_l1097_c6_75cc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1097_c6_75cc_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1097_c6_75cc_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1097_c1_c0a3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1097_c1_c0a3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1097_c1_c0a3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1097_c1_c0a3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1097_c1_c0a3_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1097_c2_91b6]
signal tmp16_MUX_uxn_opcodes_h_l1097_c2_91b6_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1097_c2_91b6_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1097_c2_91b6_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1097_c2_91b6_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1097_c2_91b6]
signal t16_MUX_uxn_opcodes_h_l1097_c2_91b6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1097_c2_91b6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1097_c2_91b6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1097_c2_91b6_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1097_c2_91b6]
signal n16_MUX_uxn_opcodes_h_l1097_c2_91b6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1097_c2_91b6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1097_c2_91b6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1097_c2_91b6_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1097_c2_91b6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1097_c2_91b6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1097_c2_91b6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1097_c2_91b6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1097_c2_91b6_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1097_c2_91b6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c2_91b6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c2_91b6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c2_91b6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c2_91b6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1097_c2_91b6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c2_91b6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c2_91b6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c2_91b6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c2_91b6_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1097_c2_91b6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1097_c2_91b6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1097_c2_91b6_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1097_c2_91b6_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1097_c2_91b6_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1097_c2_91b6]
signal result_stack_value_MUX_uxn_opcodes_h_l1097_c2_91b6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1097_c2_91b6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1097_c2_91b6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1097_c2_91b6_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1097_c2_91b6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1097_c2_91b6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1097_c2_91b6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1097_c2_91b6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1097_c2_91b6_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l1098_c3_8de8[uxn_opcodes_h_l1098_c3_8de8]
signal printf_uxn_opcodes_h_l1098_c3_8de8_uxn_opcodes_h_l1098_c3_8de8_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1102_c11_6f69]
signal BIN_OP_EQ_uxn_opcodes_h_l1102_c11_6f69_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1102_c11_6f69_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1102_c11_6f69_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1102_c7_554b]
signal tmp16_MUX_uxn_opcodes_h_l1102_c7_554b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1102_c7_554b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1102_c7_554b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1102_c7_554b_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1102_c7_554b]
signal t16_MUX_uxn_opcodes_h_l1102_c7_554b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1102_c7_554b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1102_c7_554b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1102_c7_554b_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1102_c7_554b]
signal n16_MUX_uxn_opcodes_h_l1102_c7_554b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1102_c7_554b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1102_c7_554b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1102_c7_554b_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1102_c7_554b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_554b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_554b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_554b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_554b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1102_c7_554b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1102_c7_554b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1102_c7_554b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1102_c7_554b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1102_c7_554b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1102_c7_554b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1102_c7_554b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1102_c7_554b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1102_c7_554b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1102_c7_554b_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1102_c7_554b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1102_c7_554b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1102_c7_554b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1102_c7_554b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1102_c7_554b_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1102_c7_554b]
signal result_stack_value_MUX_uxn_opcodes_h_l1102_c7_554b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1102_c7_554b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1102_c7_554b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1102_c7_554b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1102_c7_554b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_554b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_554b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_554b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_554b_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1105_c11_c8fb]
signal BIN_OP_EQ_uxn_opcodes_h_l1105_c11_c8fb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1105_c11_c8fb_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1105_c11_c8fb_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1105_c7_d749]
signal tmp16_MUX_uxn_opcodes_h_l1105_c7_d749_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1105_c7_d749_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1105_c7_d749_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1105_c7_d749_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1105_c7_d749]
signal t16_MUX_uxn_opcodes_h_l1105_c7_d749_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1105_c7_d749_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1105_c7_d749_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1105_c7_d749_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1105_c7_d749]
signal n16_MUX_uxn_opcodes_h_l1105_c7_d749_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1105_c7_d749_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1105_c7_d749_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1105_c7_d749_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1105_c7_d749]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_d749_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_d749_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_d749_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_d749_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1105_c7_d749]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1105_c7_d749_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1105_c7_d749_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1105_c7_d749_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1105_c7_d749_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1105_c7_d749]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_d749_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_d749_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_d749_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_d749_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1105_c7_d749]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1105_c7_d749_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1105_c7_d749_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1105_c7_d749_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1105_c7_d749_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1105_c7_d749]
signal result_stack_value_MUX_uxn_opcodes_h_l1105_c7_d749_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1105_c7_d749_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1105_c7_d749_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1105_c7_d749_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1105_c7_d749]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_d749_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_d749_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_d749_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_d749_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1110_c11_2f39]
signal BIN_OP_EQ_uxn_opcodes_h_l1110_c11_2f39_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1110_c11_2f39_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1110_c11_2f39_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1110_c7_89d7]
signal tmp16_MUX_uxn_opcodes_h_l1110_c7_89d7_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1110_c7_89d7_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1110_c7_89d7_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1110_c7_89d7_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1110_c7_89d7]
signal t16_MUX_uxn_opcodes_h_l1110_c7_89d7_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1110_c7_89d7_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1110_c7_89d7_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1110_c7_89d7_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1110_c7_89d7]
signal n16_MUX_uxn_opcodes_h_l1110_c7_89d7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1110_c7_89d7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1110_c7_89d7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1110_c7_89d7_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1110_c7_89d7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_89d7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_89d7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_89d7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_89d7_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1110_c7_89d7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1110_c7_89d7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1110_c7_89d7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1110_c7_89d7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1110_c7_89d7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1110_c7_89d7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_89d7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_89d7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_89d7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_89d7_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1110_c7_89d7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_89d7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_89d7_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_89d7_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_89d7_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1110_c7_89d7]
signal result_stack_value_MUX_uxn_opcodes_h_l1110_c7_89d7_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1110_c7_89d7_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1110_c7_89d7_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1110_c7_89d7_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1110_c7_89d7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_89d7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_89d7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_89d7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_89d7_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1113_c11_7ee4]
signal BIN_OP_EQ_uxn_opcodes_h_l1113_c11_7ee4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1113_c11_7ee4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1113_c11_7ee4_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1113_c7_c132]
signal tmp16_MUX_uxn_opcodes_h_l1113_c7_c132_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1113_c7_c132_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1113_c7_c132_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1113_c7_c132_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1113_c7_c132]
signal t16_MUX_uxn_opcodes_h_l1113_c7_c132_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1113_c7_c132_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1113_c7_c132_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1113_c7_c132_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1113_c7_c132]
signal n16_MUX_uxn_opcodes_h_l1113_c7_c132_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1113_c7_c132_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1113_c7_c132_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1113_c7_c132_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1113_c7_c132]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_c132_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_c132_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_c132_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_c132_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1113_c7_c132]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_c132_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_c132_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_c132_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_c132_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1113_c7_c132]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_c132_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_c132_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_c132_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_c132_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1113_c7_c132]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_c132_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_c132_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_c132_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_c132_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1113_c7_c132]
signal result_stack_value_MUX_uxn_opcodes_h_l1113_c7_c132_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1113_c7_c132_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1113_c7_c132_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1113_c7_c132_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1113_c7_c132]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_c132_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_c132_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_c132_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_c132_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1114_c3_346a]
signal BIN_OP_OR_uxn_opcodes_h_l1114_c3_346a_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1114_c3_346a_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1114_c3_346a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1117_c11_6838]
signal BIN_OP_EQ_uxn_opcodes_h_l1117_c11_6838_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1117_c11_6838_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1117_c11_6838_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1117_c7_1d97]
signal tmp16_MUX_uxn_opcodes_h_l1117_c7_1d97_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1117_c7_1d97_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1117_c7_1d97_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1117_c7_1d97_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1117_c7_1d97]
signal n16_MUX_uxn_opcodes_h_l1117_c7_1d97_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1117_c7_1d97_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1117_c7_1d97_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1117_c7_1d97_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1117_c7_1d97]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_1d97_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_1d97_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_1d97_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_1d97_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1117_c7_1d97]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1117_c7_1d97_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1117_c7_1d97_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1117_c7_1d97_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1117_c7_1d97_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1117_c7_1d97]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_1d97_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_1d97_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_1d97_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_1d97_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1117_c7_1d97]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1117_c7_1d97_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1117_c7_1d97_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1117_c7_1d97_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1117_c7_1d97_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1117_c7_1d97]
signal result_stack_value_MUX_uxn_opcodes_h_l1117_c7_1d97_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1117_c7_1d97_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1117_c7_1d97_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1117_c7_1d97_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1117_c7_1d97]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_1d97_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_1d97_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_1d97_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_1d97_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1120_c11_9c23]
signal BIN_OP_EQ_uxn_opcodes_h_l1120_c11_9c23_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1120_c11_9c23_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1120_c11_9c23_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1120_c7_59b0]
signal tmp16_MUX_uxn_opcodes_h_l1120_c7_59b0_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1120_c7_59b0_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1120_c7_59b0_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1120_c7_59b0_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1120_c7_59b0]
signal n16_MUX_uxn_opcodes_h_l1120_c7_59b0_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1120_c7_59b0_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1120_c7_59b0_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1120_c7_59b0_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1120_c7_59b0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_59b0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_59b0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_59b0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_59b0_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1120_c7_59b0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1120_c7_59b0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1120_c7_59b0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1120_c7_59b0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1120_c7_59b0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1120_c7_59b0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1120_c7_59b0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1120_c7_59b0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1120_c7_59b0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1120_c7_59b0_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1120_c7_59b0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1120_c7_59b0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1120_c7_59b0_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1120_c7_59b0_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1120_c7_59b0_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1120_c7_59b0]
signal result_stack_value_MUX_uxn_opcodes_h_l1120_c7_59b0_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1120_c7_59b0_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1120_c7_59b0_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1120_c7_59b0_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1120_c7_59b0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_59b0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_59b0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_59b0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_59b0_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1125_c11_b40c]
signal BIN_OP_EQ_uxn_opcodes_h_l1125_c11_b40c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1125_c11_b40c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1125_c11_b40c_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1125_c7_8aa9]
signal tmp16_MUX_uxn_opcodes_h_l1125_c7_8aa9_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1125_c7_8aa9_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1125_c7_8aa9_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1125_c7_8aa9_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1125_c7_8aa9]
signal n16_MUX_uxn_opcodes_h_l1125_c7_8aa9_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1125_c7_8aa9_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1125_c7_8aa9_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1125_c7_8aa9_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1125_c7_8aa9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_8aa9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_8aa9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_8aa9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_8aa9_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1125_c7_8aa9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1125_c7_8aa9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1125_c7_8aa9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1125_c7_8aa9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1125_c7_8aa9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1125_c7_8aa9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_8aa9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_8aa9_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_8aa9_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_8aa9_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1125_c7_8aa9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_8aa9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_8aa9_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_8aa9_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_8aa9_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1125_c7_8aa9]
signal result_stack_value_MUX_uxn_opcodes_h_l1125_c7_8aa9_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1125_c7_8aa9_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1125_c7_8aa9_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1125_c7_8aa9_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1125_c7_8aa9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_8aa9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_8aa9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_8aa9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_8aa9_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1128_c11_cb86]
signal BIN_OP_EQ_uxn_opcodes_h_l1128_c11_cb86_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1128_c11_cb86_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1128_c11_cb86_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1128_c7_6450]
signal tmp16_MUX_uxn_opcodes_h_l1128_c7_6450_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1128_c7_6450_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1128_c7_6450_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1128_c7_6450_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1128_c7_6450]
signal n16_MUX_uxn_opcodes_h_l1128_c7_6450_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1128_c7_6450_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1128_c7_6450_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1128_c7_6450_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1128_c7_6450]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_6450_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_6450_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_6450_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_6450_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1128_c7_6450]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1128_c7_6450_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1128_c7_6450_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1128_c7_6450_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1128_c7_6450_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1128_c7_6450]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_6450_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_6450_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_6450_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_6450_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1128_c7_6450]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_6450_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_6450_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_6450_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_6450_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1128_c7_6450]
signal result_stack_value_MUX_uxn_opcodes_h_l1128_c7_6450_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1128_c7_6450_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1128_c7_6450_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1128_c7_6450_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1128_c7_6450]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_6450_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_6450_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_6450_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_6450_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1129_c3_c5c1]
signal BIN_OP_OR_uxn_opcodes_h_l1129_c3_c5c1_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1129_c3_c5c1_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1129_c3_c5c1_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1130_c11_f9fc]
signal BIN_OP_OR_uxn_opcodes_h_l1130_c11_f9fc_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1130_c11_f9fc_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1130_c11_f9fc_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1132_c32_6d8b]
signal BIN_OP_AND_uxn_opcodes_h_l1132_c32_6d8b_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1132_c32_6d8b_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1132_c32_6d8b_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1132_c32_fc2b]
signal BIN_OP_GT_uxn_opcodes_h_l1132_c32_fc2b_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1132_c32_fc2b_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1132_c32_fc2b_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1132_c32_c53f]
signal MUX_uxn_opcodes_h_l1132_c32_c53f_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1132_c32_c53f_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1132_c32_c53f_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1132_c32_c53f_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1134_c11_b022]
signal BIN_OP_EQ_uxn_opcodes_h_l1134_c11_b022_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1134_c11_b022_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1134_c11_b022_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1134_c7_ba51]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1134_c7_ba51_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1134_c7_ba51_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1134_c7_ba51_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1134_c7_ba51_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1134_c7_ba51]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1134_c7_ba51_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1134_c7_ba51_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1134_c7_ba51_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1134_c7_ba51_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1134_c7_ba51]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c7_ba51_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c7_ba51_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c7_ba51_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c7_ba51_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1134_c7_ba51]
signal result_stack_value_MUX_uxn_opcodes_h_l1134_c7_ba51_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1134_c7_ba51_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1134_c7_ba51_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1134_c7_ba51_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1134_c7_ba51]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1134_c7_ba51_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1134_c7_ba51_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1134_c7_ba51_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1134_c7_ba51_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1140_c11_ecd5]
signal BIN_OP_EQ_uxn_opcodes_h_l1140_c11_ecd5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1140_c11_ecd5_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1140_c11_ecd5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1140_c7_3b60]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_3b60_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_3b60_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_3b60_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_3b60_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1140_c7_3b60]
signal result_stack_value_MUX_uxn_opcodes_h_l1140_c7_3b60_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1140_c7_3b60_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1140_c7_3b60_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1140_c7_3b60_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1140_c7_3b60]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_3b60_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_3b60_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_3b60_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_3b60_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1140_c7_3b60]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_3b60_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_3b60_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_3b60_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_3b60_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1142_c34_ce44]
signal CONST_SR_8_uxn_opcodes_h_l1142_c34_ce44_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1142_c34_ce44_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1144_c11_29f1]
signal BIN_OP_EQ_uxn_opcodes_h_l1144_c11_29f1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1144_c11_29f1_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1144_c11_29f1_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1144_c7_083b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_083b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_083b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_083b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_083b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1144_c7_083b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_083b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_083b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_083b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_083b_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1107_l1122_DUPLICATE_e8fe
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1107_l1122_DUPLICATE_e8fe_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1107_l1122_DUPLICATE_e8fe_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_09c5( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : signed;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_write := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.stack_value := ref_toks_5;
      base.is_opc_done := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1097_c6_75cc
BIN_OP_EQ_uxn_opcodes_h_l1097_c6_75cc : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1097_c6_75cc_left,
BIN_OP_EQ_uxn_opcodes_h_l1097_c6_75cc_right,
BIN_OP_EQ_uxn_opcodes_h_l1097_c6_75cc_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1097_c1_c0a3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1097_c1_c0a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1097_c1_c0a3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1097_c1_c0a3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1097_c1_c0a3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1097_c1_c0a3_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1097_c2_91b6
tmp16_MUX_uxn_opcodes_h_l1097_c2_91b6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1097_c2_91b6_cond,
tmp16_MUX_uxn_opcodes_h_l1097_c2_91b6_iftrue,
tmp16_MUX_uxn_opcodes_h_l1097_c2_91b6_iffalse,
tmp16_MUX_uxn_opcodes_h_l1097_c2_91b6_return_output);

-- t16_MUX_uxn_opcodes_h_l1097_c2_91b6
t16_MUX_uxn_opcodes_h_l1097_c2_91b6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1097_c2_91b6_cond,
t16_MUX_uxn_opcodes_h_l1097_c2_91b6_iftrue,
t16_MUX_uxn_opcodes_h_l1097_c2_91b6_iffalse,
t16_MUX_uxn_opcodes_h_l1097_c2_91b6_return_output);

-- n16_MUX_uxn_opcodes_h_l1097_c2_91b6
n16_MUX_uxn_opcodes_h_l1097_c2_91b6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1097_c2_91b6_cond,
n16_MUX_uxn_opcodes_h_l1097_c2_91b6_iftrue,
n16_MUX_uxn_opcodes_h_l1097_c2_91b6_iffalse,
n16_MUX_uxn_opcodes_h_l1097_c2_91b6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1097_c2_91b6
result_is_stack_write_MUX_uxn_opcodes_h_l1097_c2_91b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1097_c2_91b6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1097_c2_91b6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1097_c2_91b6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1097_c2_91b6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c2_91b6
result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c2_91b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c2_91b6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c2_91b6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c2_91b6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c2_91b6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c2_91b6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c2_91b6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c2_91b6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c2_91b6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c2_91b6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c2_91b6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1097_c2_91b6
result_sp_relative_shift_MUX_uxn_opcodes_h_l1097_c2_91b6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1097_c2_91b6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1097_c2_91b6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1097_c2_91b6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1097_c2_91b6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1097_c2_91b6
result_stack_value_MUX_uxn_opcodes_h_l1097_c2_91b6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1097_c2_91b6_cond,
result_stack_value_MUX_uxn_opcodes_h_l1097_c2_91b6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1097_c2_91b6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1097_c2_91b6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1097_c2_91b6
result_is_opc_done_MUX_uxn_opcodes_h_l1097_c2_91b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1097_c2_91b6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1097_c2_91b6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1097_c2_91b6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1097_c2_91b6_return_output);

-- printf_uxn_opcodes_h_l1098_c3_8de8_uxn_opcodes_h_l1098_c3_8de8
printf_uxn_opcodes_h_l1098_c3_8de8_uxn_opcodes_h_l1098_c3_8de8 : entity work.printf_uxn_opcodes_h_l1098_c3_8de8_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1098_c3_8de8_uxn_opcodes_h_l1098_c3_8de8_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1102_c11_6f69
BIN_OP_EQ_uxn_opcodes_h_l1102_c11_6f69 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1102_c11_6f69_left,
BIN_OP_EQ_uxn_opcodes_h_l1102_c11_6f69_right,
BIN_OP_EQ_uxn_opcodes_h_l1102_c11_6f69_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1102_c7_554b
tmp16_MUX_uxn_opcodes_h_l1102_c7_554b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1102_c7_554b_cond,
tmp16_MUX_uxn_opcodes_h_l1102_c7_554b_iftrue,
tmp16_MUX_uxn_opcodes_h_l1102_c7_554b_iffalse,
tmp16_MUX_uxn_opcodes_h_l1102_c7_554b_return_output);

-- t16_MUX_uxn_opcodes_h_l1102_c7_554b
t16_MUX_uxn_opcodes_h_l1102_c7_554b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1102_c7_554b_cond,
t16_MUX_uxn_opcodes_h_l1102_c7_554b_iftrue,
t16_MUX_uxn_opcodes_h_l1102_c7_554b_iffalse,
t16_MUX_uxn_opcodes_h_l1102_c7_554b_return_output);

-- n16_MUX_uxn_opcodes_h_l1102_c7_554b
n16_MUX_uxn_opcodes_h_l1102_c7_554b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1102_c7_554b_cond,
n16_MUX_uxn_opcodes_h_l1102_c7_554b_iftrue,
n16_MUX_uxn_opcodes_h_l1102_c7_554b_iffalse,
n16_MUX_uxn_opcodes_h_l1102_c7_554b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_554b
result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_554b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_554b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_554b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_554b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_554b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1102_c7_554b
result_is_sp_shift_MUX_uxn_opcodes_h_l1102_c7_554b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1102_c7_554b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1102_c7_554b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1102_c7_554b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1102_c7_554b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1102_c7_554b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1102_c7_554b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1102_c7_554b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1102_c7_554b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1102_c7_554b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1102_c7_554b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1102_c7_554b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1102_c7_554b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1102_c7_554b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1102_c7_554b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1102_c7_554b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1102_c7_554b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1102_c7_554b
result_stack_value_MUX_uxn_opcodes_h_l1102_c7_554b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1102_c7_554b_cond,
result_stack_value_MUX_uxn_opcodes_h_l1102_c7_554b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1102_c7_554b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1102_c7_554b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_554b
result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_554b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_554b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_554b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_554b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_554b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1105_c11_c8fb
BIN_OP_EQ_uxn_opcodes_h_l1105_c11_c8fb : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1105_c11_c8fb_left,
BIN_OP_EQ_uxn_opcodes_h_l1105_c11_c8fb_right,
BIN_OP_EQ_uxn_opcodes_h_l1105_c11_c8fb_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1105_c7_d749
tmp16_MUX_uxn_opcodes_h_l1105_c7_d749 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1105_c7_d749_cond,
tmp16_MUX_uxn_opcodes_h_l1105_c7_d749_iftrue,
tmp16_MUX_uxn_opcodes_h_l1105_c7_d749_iffalse,
tmp16_MUX_uxn_opcodes_h_l1105_c7_d749_return_output);

-- t16_MUX_uxn_opcodes_h_l1105_c7_d749
t16_MUX_uxn_opcodes_h_l1105_c7_d749 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1105_c7_d749_cond,
t16_MUX_uxn_opcodes_h_l1105_c7_d749_iftrue,
t16_MUX_uxn_opcodes_h_l1105_c7_d749_iffalse,
t16_MUX_uxn_opcodes_h_l1105_c7_d749_return_output);

-- n16_MUX_uxn_opcodes_h_l1105_c7_d749
n16_MUX_uxn_opcodes_h_l1105_c7_d749 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1105_c7_d749_cond,
n16_MUX_uxn_opcodes_h_l1105_c7_d749_iftrue,
n16_MUX_uxn_opcodes_h_l1105_c7_d749_iffalse,
n16_MUX_uxn_opcodes_h_l1105_c7_d749_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_d749
result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_d749 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_d749_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_d749_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_d749_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_d749_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1105_c7_d749
result_is_sp_shift_MUX_uxn_opcodes_h_l1105_c7_d749 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1105_c7_d749_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1105_c7_d749_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1105_c7_d749_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1105_c7_d749_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_d749
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_d749 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_d749_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_d749_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_d749_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_d749_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1105_c7_d749
result_sp_relative_shift_MUX_uxn_opcodes_h_l1105_c7_d749 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1105_c7_d749_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1105_c7_d749_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1105_c7_d749_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1105_c7_d749_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1105_c7_d749
result_stack_value_MUX_uxn_opcodes_h_l1105_c7_d749 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1105_c7_d749_cond,
result_stack_value_MUX_uxn_opcodes_h_l1105_c7_d749_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1105_c7_d749_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1105_c7_d749_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_d749
result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_d749 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_d749_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_d749_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_d749_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_d749_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1110_c11_2f39
BIN_OP_EQ_uxn_opcodes_h_l1110_c11_2f39 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1110_c11_2f39_left,
BIN_OP_EQ_uxn_opcodes_h_l1110_c11_2f39_right,
BIN_OP_EQ_uxn_opcodes_h_l1110_c11_2f39_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1110_c7_89d7
tmp16_MUX_uxn_opcodes_h_l1110_c7_89d7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1110_c7_89d7_cond,
tmp16_MUX_uxn_opcodes_h_l1110_c7_89d7_iftrue,
tmp16_MUX_uxn_opcodes_h_l1110_c7_89d7_iffalse,
tmp16_MUX_uxn_opcodes_h_l1110_c7_89d7_return_output);

-- t16_MUX_uxn_opcodes_h_l1110_c7_89d7
t16_MUX_uxn_opcodes_h_l1110_c7_89d7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1110_c7_89d7_cond,
t16_MUX_uxn_opcodes_h_l1110_c7_89d7_iftrue,
t16_MUX_uxn_opcodes_h_l1110_c7_89d7_iffalse,
t16_MUX_uxn_opcodes_h_l1110_c7_89d7_return_output);

-- n16_MUX_uxn_opcodes_h_l1110_c7_89d7
n16_MUX_uxn_opcodes_h_l1110_c7_89d7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1110_c7_89d7_cond,
n16_MUX_uxn_opcodes_h_l1110_c7_89d7_iftrue,
n16_MUX_uxn_opcodes_h_l1110_c7_89d7_iffalse,
n16_MUX_uxn_opcodes_h_l1110_c7_89d7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_89d7
result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_89d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_89d7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_89d7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_89d7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_89d7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1110_c7_89d7
result_is_sp_shift_MUX_uxn_opcodes_h_l1110_c7_89d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1110_c7_89d7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1110_c7_89d7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1110_c7_89d7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1110_c7_89d7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_89d7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_89d7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_89d7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_89d7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_89d7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_89d7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_89d7
result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_89d7 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_89d7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_89d7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_89d7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_89d7_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1110_c7_89d7
result_stack_value_MUX_uxn_opcodes_h_l1110_c7_89d7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1110_c7_89d7_cond,
result_stack_value_MUX_uxn_opcodes_h_l1110_c7_89d7_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1110_c7_89d7_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1110_c7_89d7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_89d7
result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_89d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_89d7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_89d7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_89d7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_89d7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1113_c11_7ee4
BIN_OP_EQ_uxn_opcodes_h_l1113_c11_7ee4 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1113_c11_7ee4_left,
BIN_OP_EQ_uxn_opcodes_h_l1113_c11_7ee4_right,
BIN_OP_EQ_uxn_opcodes_h_l1113_c11_7ee4_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1113_c7_c132
tmp16_MUX_uxn_opcodes_h_l1113_c7_c132 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1113_c7_c132_cond,
tmp16_MUX_uxn_opcodes_h_l1113_c7_c132_iftrue,
tmp16_MUX_uxn_opcodes_h_l1113_c7_c132_iffalse,
tmp16_MUX_uxn_opcodes_h_l1113_c7_c132_return_output);

-- t16_MUX_uxn_opcodes_h_l1113_c7_c132
t16_MUX_uxn_opcodes_h_l1113_c7_c132 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1113_c7_c132_cond,
t16_MUX_uxn_opcodes_h_l1113_c7_c132_iftrue,
t16_MUX_uxn_opcodes_h_l1113_c7_c132_iffalse,
t16_MUX_uxn_opcodes_h_l1113_c7_c132_return_output);

-- n16_MUX_uxn_opcodes_h_l1113_c7_c132
n16_MUX_uxn_opcodes_h_l1113_c7_c132 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1113_c7_c132_cond,
n16_MUX_uxn_opcodes_h_l1113_c7_c132_iftrue,
n16_MUX_uxn_opcodes_h_l1113_c7_c132_iffalse,
n16_MUX_uxn_opcodes_h_l1113_c7_c132_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_c132
result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_c132 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_c132_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_c132_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_c132_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_c132_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_c132
result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_c132 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_c132_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_c132_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_c132_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_c132_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_c132
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_c132 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_c132_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_c132_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_c132_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_c132_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_c132
result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_c132 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_c132_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_c132_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_c132_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_c132_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1113_c7_c132
result_stack_value_MUX_uxn_opcodes_h_l1113_c7_c132 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1113_c7_c132_cond,
result_stack_value_MUX_uxn_opcodes_h_l1113_c7_c132_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1113_c7_c132_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1113_c7_c132_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_c132
result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_c132 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_c132_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_c132_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_c132_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_c132_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1114_c3_346a
BIN_OP_OR_uxn_opcodes_h_l1114_c3_346a : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1114_c3_346a_left,
BIN_OP_OR_uxn_opcodes_h_l1114_c3_346a_right,
BIN_OP_OR_uxn_opcodes_h_l1114_c3_346a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1117_c11_6838
BIN_OP_EQ_uxn_opcodes_h_l1117_c11_6838 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1117_c11_6838_left,
BIN_OP_EQ_uxn_opcodes_h_l1117_c11_6838_right,
BIN_OP_EQ_uxn_opcodes_h_l1117_c11_6838_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1117_c7_1d97
tmp16_MUX_uxn_opcodes_h_l1117_c7_1d97 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1117_c7_1d97_cond,
tmp16_MUX_uxn_opcodes_h_l1117_c7_1d97_iftrue,
tmp16_MUX_uxn_opcodes_h_l1117_c7_1d97_iffalse,
tmp16_MUX_uxn_opcodes_h_l1117_c7_1d97_return_output);

-- n16_MUX_uxn_opcodes_h_l1117_c7_1d97
n16_MUX_uxn_opcodes_h_l1117_c7_1d97 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1117_c7_1d97_cond,
n16_MUX_uxn_opcodes_h_l1117_c7_1d97_iftrue,
n16_MUX_uxn_opcodes_h_l1117_c7_1d97_iffalse,
n16_MUX_uxn_opcodes_h_l1117_c7_1d97_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_1d97
result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_1d97 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_1d97_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_1d97_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_1d97_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_1d97_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1117_c7_1d97
result_is_sp_shift_MUX_uxn_opcodes_h_l1117_c7_1d97 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1117_c7_1d97_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1117_c7_1d97_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1117_c7_1d97_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1117_c7_1d97_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_1d97
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_1d97 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_1d97_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_1d97_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_1d97_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_1d97_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1117_c7_1d97
result_sp_relative_shift_MUX_uxn_opcodes_h_l1117_c7_1d97 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1117_c7_1d97_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1117_c7_1d97_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1117_c7_1d97_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1117_c7_1d97_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1117_c7_1d97
result_stack_value_MUX_uxn_opcodes_h_l1117_c7_1d97 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1117_c7_1d97_cond,
result_stack_value_MUX_uxn_opcodes_h_l1117_c7_1d97_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1117_c7_1d97_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1117_c7_1d97_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_1d97
result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_1d97 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_1d97_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_1d97_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_1d97_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_1d97_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1120_c11_9c23
BIN_OP_EQ_uxn_opcodes_h_l1120_c11_9c23 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1120_c11_9c23_left,
BIN_OP_EQ_uxn_opcodes_h_l1120_c11_9c23_right,
BIN_OP_EQ_uxn_opcodes_h_l1120_c11_9c23_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1120_c7_59b0
tmp16_MUX_uxn_opcodes_h_l1120_c7_59b0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1120_c7_59b0_cond,
tmp16_MUX_uxn_opcodes_h_l1120_c7_59b0_iftrue,
tmp16_MUX_uxn_opcodes_h_l1120_c7_59b0_iffalse,
tmp16_MUX_uxn_opcodes_h_l1120_c7_59b0_return_output);

-- n16_MUX_uxn_opcodes_h_l1120_c7_59b0
n16_MUX_uxn_opcodes_h_l1120_c7_59b0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1120_c7_59b0_cond,
n16_MUX_uxn_opcodes_h_l1120_c7_59b0_iftrue,
n16_MUX_uxn_opcodes_h_l1120_c7_59b0_iffalse,
n16_MUX_uxn_opcodes_h_l1120_c7_59b0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_59b0
result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_59b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_59b0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_59b0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_59b0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_59b0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1120_c7_59b0
result_is_sp_shift_MUX_uxn_opcodes_h_l1120_c7_59b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1120_c7_59b0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1120_c7_59b0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1120_c7_59b0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1120_c7_59b0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1120_c7_59b0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1120_c7_59b0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1120_c7_59b0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1120_c7_59b0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1120_c7_59b0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1120_c7_59b0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1120_c7_59b0
result_sp_relative_shift_MUX_uxn_opcodes_h_l1120_c7_59b0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1120_c7_59b0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1120_c7_59b0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1120_c7_59b0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1120_c7_59b0_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1120_c7_59b0
result_stack_value_MUX_uxn_opcodes_h_l1120_c7_59b0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1120_c7_59b0_cond,
result_stack_value_MUX_uxn_opcodes_h_l1120_c7_59b0_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1120_c7_59b0_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1120_c7_59b0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_59b0
result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_59b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_59b0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_59b0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_59b0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_59b0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1125_c11_b40c
BIN_OP_EQ_uxn_opcodes_h_l1125_c11_b40c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1125_c11_b40c_left,
BIN_OP_EQ_uxn_opcodes_h_l1125_c11_b40c_right,
BIN_OP_EQ_uxn_opcodes_h_l1125_c11_b40c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1125_c7_8aa9
tmp16_MUX_uxn_opcodes_h_l1125_c7_8aa9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1125_c7_8aa9_cond,
tmp16_MUX_uxn_opcodes_h_l1125_c7_8aa9_iftrue,
tmp16_MUX_uxn_opcodes_h_l1125_c7_8aa9_iffalse,
tmp16_MUX_uxn_opcodes_h_l1125_c7_8aa9_return_output);

-- n16_MUX_uxn_opcodes_h_l1125_c7_8aa9
n16_MUX_uxn_opcodes_h_l1125_c7_8aa9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1125_c7_8aa9_cond,
n16_MUX_uxn_opcodes_h_l1125_c7_8aa9_iftrue,
n16_MUX_uxn_opcodes_h_l1125_c7_8aa9_iffalse,
n16_MUX_uxn_opcodes_h_l1125_c7_8aa9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_8aa9
result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_8aa9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_8aa9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_8aa9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_8aa9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_8aa9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1125_c7_8aa9
result_is_sp_shift_MUX_uxn_opcodes_h_l1125_c7_8aa9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1125_c7_8aa9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1125_c7_8aa9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1125_c7_8aa9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1125_c7_8aa9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_8aa9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_8aa9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_8aa9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_8aa9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_8aa9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_8aa9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_8aa9
result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_8aa9 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_8aa9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_8aa9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_8aa9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_8aa9_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1125_c7_8aa9
result_stack_value_MUX_uxn_opcodes_h_l1125_c7_8aa9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1125_c7_8aa9_cond,
result_stack_value_MUX_uxn_opcodes_h_l1125_c7_8aa9_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1125_c7_8aa9_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1125_c7_8aa9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_8aa9
result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_8aa9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_8aa9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_8aa9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_8aa9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_8aa9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1128_c11_cb86
BIN_OP_EQ_uxn_opcodes_h_l1128_c11_cb86 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1128_c11_cb86_left,
BIN_OP_EQ_uxn_opcodes_h_l1128_c11_cb86_right,
BIN_OP_EQ_uxn_opcodes_h_l1128_c11_cb86_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1128_c7_6450
tmp16_MUX_uxn_opcodes_h_l1128_c7_6450 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1128_c7_6450_cond,
tmp16_MUX_uxn_opcodes_h_l1128_c7_6450_iftrue,
tmp16_MUX_uxn_opcodes_h_l1128_c7_6450_iffalse,
tmp16_MUX_uxn_opcodes_h_l1128_c7_6450_return_output);

-- n16_MUX_uxn_opcodes_h_l1128_c7_6450
n16_MUX_uxn_opcodes_h_l1128_c7_6450 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1128_c7_6450_cond,
n16_MUX_uxn_opcodes_h_l1128_c7_6450_iftrue,
n16_MUX_uxn_opcodes_h_l1128_c7_6450_iffalse,
n16_MUX_uxn_opcodes_h_l1128_c7_6450_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_6450
result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_6450 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_6450_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_6450_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_6450_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_6450_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1128_c7_6450
result_is_sp_shift_MUX_uxn_opcodes_h_l1128_c7_6450 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1128_c7_6450_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1128_c7_6450_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1128_c7_6450_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1128_c7_6450_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_6450
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_6450 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_6450_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_6450_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_6450_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_6450_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_6450
result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_6450 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_6450_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_6450_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_6450_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_6450_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1128_c7_6450
result_stack_value_MUX_uxn_opcodes_h_l1128_c7_6450 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1128_c7_6450_cond,
result_stack_value_MUX_uxn_opcodes_h_l1128_c7_6450_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1128_c7_6450_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1128_c7_6450_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_6450
result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_6450 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_6450_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_6450_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_6450_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_6450_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1129_c3_c5c1
BIN_OP_OR_uxn_opcodes_h_l1129_c3_c5c1 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1129_c3_c5c1_left,
BIN_OP_OR_uxn_opcodes_h_l1129_c3_c5c1_right,
BIN_OP_OR_uxn_opcodes_h_l1129_c3_c5c1_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1130_c11_f9fc
BIN_OP_OR_uxn_opcodes_h_l1130_c11_f9fc : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1130_c11_f9fc_left,
BIN_OP_OR_uxn_opcodes_h_l1130_c11_f9fc_right,
BIN_OP_OR_uxn_opcodes_h_l1130_c11_f9fc_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1132_c32_6d8b
BIN_OP_AND_uxn_opcodes_h_l1132_c32_6d8b : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1132_c32_6d8b_left,
BIN_OP_AND_uxn_opcodes_h_l1132_c32_6d8b_right,
BIN_OP_AND_uxn_opcodes_h_l1132_c32_6d8b_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1132_c32_fc2b
BIN_OP_GT_uxn_opcodes_h_l1132_c32_fc2b : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1132_c32_fc2b_left,
BIN_OP_GT_uxn_opcodes_h_l1132_c32_fc2b_right,
BIN_OP_GT_uxn_opcodes_h_l1132_c32_fc2b_return_output);

-- MUX_uxn_opcodes_h_l1132_c32_c53f
MUX_uxn_opcodes_h_l1132_c32_c53f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1132_c32_c53f_cond,
MUX_uxn_opcodes_h_l1132_c32_c53f_iftrue,
MUX_uxn_opcodes_h_l1132_c32_c53f_iffalse,
MUX_uxn_opcodes_h_l1132_c32_c53f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1134_c11_b022
BIN_OP_EQ_uxn_opcodes_h_l1134_c11_b022 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1134_c11_b022_left,
BIN_OP_EQ_uxn_opcodes_h_l1134_c11_b022_right,
BIN_OP_EQ_uxn_opcodes_h_l1134_c11_b022_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1134_c7_ba51
result_is_stack_write_MUX_uxn_opcodes_h_l1134_c7_ba51 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1134_c7_ba51_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1134_c7_ba51_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1134_c7_ba51_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1134_c7_ba51_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1134_c7_ba51
result_is_sp_shift_MUX_uxn_opcodes_h_l1134_c7_ba51 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1134_c7_ba51_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1134_c7_ba51_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1134_c7_ba51_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1134_c7_ba51_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c7_ba51
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c7_ba51 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c7_ba51_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c7_ba51_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c7_ba51_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c7_ba51_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1134_c7_ba51
result_stack_value_MUX_uxn_opcodes_h_l1134_c7_ba51 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1134_c7_ba51_cond,
result_stack_value_MUX_uxn_opcodes_h_l1134_c7_ba51_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1134_c7_ba51_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1134_c7_ba51_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1134_c7_ba51
result_is_opc_done_MUX_uxn_opcodes_h_l1134_c7_ba51 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1134_c7_ba51_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1134_c7_ba51_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1134_c7_ba51_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1134_c7_ba51_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1140_c11_ecd5
BIN_OP_EQ_uxn_opcodes_h_l1140_c11_ecd5 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1140_c11_ecd5_left,
BIN_OP_EQ_uxn_opcodes_h_l1140_c11_ecd5_right,
BIN_OP_EQ_uxn_opcodes_h_l1140_c11_ecd5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_3b60
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_3b60 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_3b60_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_3b60_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_3b60_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_3b60_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1140_c7_3b60
result_stack_value_MUX_uxn_opcodes_h_l1140_c7_3b60 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1140_c7_3b60_cond,
result_stack_value_MUX_uxn_opcodes_h_l1140_c7_3b60_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1140_c7_3b60_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1140_c7_3b60_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_3b60
result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_3b60 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_3b60_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_3b60_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_3b60_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_3b60_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_3b60
result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_3b60 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_3b60_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_3b60_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_3b60_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_3b60_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1142_c34_ce44
CONST_SR_8_uxn_opcodes_h_l1142_c34_ce44 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1142_c34_ce44_x,
CONST_SR_8_uxn_opcodes_h_l1142_c34_ce44_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1144_c11_29f1
BIN_OP_EQ_uxn_opcodes_h_l1144_c11_29f1 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1144_c11_29f1_left,
BIN_OP_EQ_uxn_opcodes_h_l1144_c11_29f1_right,
BIN_OP_EQ_uxn_opcodes_h_l1144_c11_29f1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_083b
result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_083b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_083b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_083b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_083b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_083b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_083b
result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_083b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_083b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_083b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_083b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_083b_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1107_l1122_DUPLICATE_e8fe
CONST_SL_8_uint16_t_uxn_opcodes_h_l1107_l1122_DUPLICATE_e8fe : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1107_l1122_DUPLICATE_e8fe_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1107_l1122_DUPLICATE_e8fe_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16,
 n16,
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1097_c6_75cc_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1097_c1_c0a3_return_output,
 tmp16_MUX_uxn_opcodes_h_l1097_c2_91b6_return_output,
 t16_MUX_uxn_opcodes_h_l1097_c2_91b6_return_output,
 n16_MUX_uxn_opcodes_h_l1097_c2_91b6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1097_c2_91b6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c2_91b6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c2_91b6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1097_c2_91b6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1097_c2_91b6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1097_c2_91b6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1102_c11_6f69_return_output,
 tmp16_MUX_uxn_opcodes_h_l1102_c7_554b_return_output,
 t16_MUX_uxn_opcodes_h_l1102_c7_554b_return_output,
 n16_MUX_uxn_opcodes_h_l1102_c7_554b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_554b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1102_c7_554b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1102_c7_554b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1102_c7_554b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1102_c7_554b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_554b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1105_c11_c8fb_return_output,
 tmp16_MUX_uxn_opcodes_h_l1105_c7_d749_return_output,
 t16_MUX_uxn_opcodes_h_l1105_c7_d749_return_output,
 n16_MUX_uxn_opcodes_h_l1105_c7_d749_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_d749_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1105_c7_d749_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_d749_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1105_c7_d749_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1105_c7_d749_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_d749_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1110_c11_2f39_return_output,
 tmp16_MUX_uxn_opcodes_h_l1110_c7_89d7_return_output,
 t16_MUX_uxn_opcodes_h_l1110_c7_89d7_return_output,
 n16_MUX_uxn_opcodes_h_l1110_c7_89d7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_89d7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1110_c7_89d7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_89d7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_89d7_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1110_c7_89d7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_89d7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1113_c11_7ee4_return_output,
 tmp16_MUX_uxn_opcodes_h_l1113_c7_c132_return_output,
 t16_MUX_uxn_opcodes_h_l1113_c7_c132_return_output,
 n16_MUX_uxn_opcodes_h_l1113_c7_c132_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_c132_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_c132_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_c132_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_c132_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1113_c7_c132_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_c132_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1114_c3_346a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1117_c11_6838_return_output,
 tmp16_MUX_uxn_opcodes_h_l1117_c7_1d97_return_output,
 n16_MUX_uxn_opcodes_h_l1117_c7_1d97_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_1d97_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1117_c7_1d97_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_1d97_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1117_c7_1d97_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1117_c7_1d97_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_1d97_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1120_c11_9c23_return_output,
 tmp16_MUX_uxn_opcodes_h_l1120_c7_59b0_return_output,
 n16_MUX_uxn_opcodes_h_l1120_c7_59b0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_59b0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1120_c7_59b0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1120_c7_59b0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1120_c7_59b0_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1120_c7_59b0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_59b0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1125_c11_b40c_return_output,
 tmp16_MUX_uxn_opcodes_h_l1125_c7_8aa9_return_output,
 n16_MUX_uxn_opcodes_h_l1125_c7_8aa9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_8aa9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1125_c7_8aa9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_8aa9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_8aa9_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1125_c7_8aa9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_8aa9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1128_c11_cb86_return_output,
 tmp16_MUX_uxn_opcodes_h_l1128_c7_6450_return_output,
 n16_MUX_uxn_opcodes_h_l1128_c7_6450_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_6450_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1128_c7_6450_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_6450_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_6450_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1128_c7_6450_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_6450_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1129_c3_c5c1_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1130_c11_f9fc_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1132_c32_6d8b_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1132_c32_fc2b_return_output,
 MUX_uxn_opcodes_h_l1132_c32_c53f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1134_c11_b022_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1134_c7_ba51_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1134_c7_ba51_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c7_ba51_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1134_c7_ba51_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1134_c7_ba51_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1140_c11_ecd5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_3b60_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1140_c7_3b60_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_3b60_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_3b60_return_output,
 CONST_SR_8_uxn_opcodes_h_l1142_c34_ce44_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1144_c11_29f1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_083b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_083b_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1107_l1122_DUPLICATE_e8fe_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c6_75cc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c6_75cc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c6_75cc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1097_c1_c0a3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1097_c1_c0a3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1097_c1_c0a3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1097_c1_c0a3_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1097_c2_91b6_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1097_c2_91b6_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1102_c7_554b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1097_c2_91b6_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1097_c2_91b6_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1097_c2_91b6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1097_c2_91b6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1102_c7_554b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1097_c2_91b6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1097_c2_91b6_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1097_c2_91b6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1097_c2_91b6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1102_c7_554b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1097_c2_91b6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1097_c2_91b6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1097_c2_91b6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1097_c2_91b6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_554b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1097_c2_91b6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1097_c2_91b6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c2_91b6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c2_91b6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1102_c7_554b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c2_91b6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c2_91b6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c2_91b6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1099_c3_6d6e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c2_91b6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1102_c7_554b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c2_91b6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c2_91b6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1097_c2_91b6_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1097_c2_91b6_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1102_c7_554b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1097_c2_91b6_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1097_c2_91b6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1097_c2_91b6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1097_c2_91b6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1102_c7_554b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1097_c2_91b6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1097_c2_91b6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1097_c2_91b6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1097_c2_91b6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_554b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1097_c2_91b6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1097_c2_91b6_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1098_c3_8de8_uxn_opcodes_h_l1098_c3_8de8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1102_c11_6f69_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1102_c11_6f69_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1102_c11_6f69_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1102_c7_554b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1102_c7_554b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1105_c7_d749_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1102_c7_554b_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1102_c7_554b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1102_c7_554b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1105_c7_d749_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1102_c7_554b_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1102_c7_554b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1102_c7_554b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1105_c7_d749_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1102_c7_554b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_554b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_554b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_d749_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_554b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1102_c7_554b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1102_c7_554b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1105_c7_d749_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1102_c7_554b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1102_c7_554b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1103_c3_6d95 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1102_c7_554b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_d749_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1102_c7_554b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1102_c7_554b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1102_c7_554b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1105_c7_d749_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1102_c7_554b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1102_c7_554b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1102_c7_554b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1105_c7_d749_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1102_c7_554b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_554b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_554b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_d749_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_554b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1105_c11_c8fb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1105_c11_c8fb_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1105_c11_c8fb_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1105_c7_d749_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1105_c7_d749_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1110_c7_89d7_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1105_c7_d749_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1105_c7_d749_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1105_c7_d749_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1110_c7_89d7_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1105_c7_d749_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1105_c7_d749_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1105_c7_d749_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1110_c7_89d7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1105_c7_d749_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_d749_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_d749_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_89d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_d749_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1105_c7_d749_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1105_c7_d749_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1110_c7_89d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1105_c7_d749_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_d749_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1108_c3_b783 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_d749_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_89d7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_d749_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1105_c7_d749_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1105_c7_d749_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_89d7_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1105_c7_d749_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1105_c7_d749_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1105_c7_d749_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1110_c7_89d7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1105_c7_d749_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_d749_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_d749_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_89d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_d749_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1110_c11_2f39_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1110_c11_2f39_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1110_c11_2f39_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1110_c7_89d7_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1110_c7_89d7_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1113_c7_c132_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1110_c7_89d7_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1110_c7_89d7_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1110_c7_89d7_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1113_c7_c132_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1110_c7_89d7_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1110_c7_89d7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1110_c7_89d7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1113_c7_c132_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1110_c7_89d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_89d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_89d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_c132_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_89d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1110_c7_89d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1110_c7_89d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_c132_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1110_c7_89d7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_89d7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1111_c3_9334 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_89d7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_c132_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_89d7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_89d7_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_89d7_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_c132_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_89d7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1110_c7_89d7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1110_c7_89d7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1113_c7_c132_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1110_c7_89d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_89d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_89d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_c132_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_89d7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1113_c11_7ee4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1113_c11_7ee4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1113_c11_7ee4_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1113_c7_c132_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1113_c7_c132_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1117_c7_1d97_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1113_c7_c132_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1113_c7_c132_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1113_c7_c132_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1113_c7_c132_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1113_c7_c132_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1113_c7_c132_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1117_c7_1d97_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1113_c7_c132_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_c132_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_c132_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_1d97_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_c132_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_c132_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_c132_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1117_c7_1d97_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_c132_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_c132_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1115_c3_4d4d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_c132_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_1d97_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_c132_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_c132_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_c132_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1117_c7_1d97_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_c132_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1113_c7_c132_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1113_c7_c132_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1117_c7_1d97_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1113_c7_c132_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_c132_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_c132_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_1d97_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_c132_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1114_c3_346a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1114_c3_346a_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1114_c3_346a_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1117_c11_6838_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1117_c11_6838_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1117_c11_6838_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1117_c7_1d97_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1117_c7_1d97_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1120_c7_59b0_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1117_c7_1d97_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1117_c7_1d97_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1117_c7_1d97_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1120_c7_59b0_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1117_c7_1d97_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_1d97_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_1d97_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_59b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_1d97_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1117_c7_1d97_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1117_c7_1d97_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1120_c7_59b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1117_c7_1d97_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_1d97_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1118_c3_ce20 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_1d97_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1120_c7_59b0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_1d97_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1117_c7_1d97_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1117_c7_1d97_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1120_c7_59b0_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1117_c7_1d97_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1117_c7_1d97_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1117_c7_1d97_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1120_c7_59b0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1117_c7_1d97_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_1d97_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_1d97_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_59b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_1d97_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1120_c11_9c23_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1120_c11_9c23_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1120_c11_9c23_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1120_c7_59b0_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1120_c7_59b0_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1125_c7_8aa9_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1120_c7_59b0_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1120_c7_59b0_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1120_c7_59b0_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1125_c7_8aa9_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1120_c7_59b0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_59b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_59b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_8aa9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_59b0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1120_c7_59b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1120_c7_59b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1125_c7_8aa9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1120_c7_59b0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1120_c7_59b0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1123_c3_0d02 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1120_c7_59b0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_8aa9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1120_c7_59b0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1120_c7_59b0_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1120_c7_59b0_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_8aa9_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1120_c7_59b0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1120_c7_59b0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1120_c7_59b0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1125_c7_8aa9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1120_c7_59b0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_59b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_59b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_8aa9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_59b0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1125_c11_b40c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1125_c11_b40c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1125_c11_b40c_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1125_c7_8aa9_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1125_c7_8aa9_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1128_c7_6450_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1125_c7_8aa9_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1125_c7_8aa9_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1125_c7_8aa9_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1128_c7_6450_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1125_c7_8aa9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_8aa9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_8aa9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_6450_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_8aa9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1125_c7_8aa9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1125_c7_8aa9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1128_c7_6450_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1125_c7_8aa9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_8aa9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1126_c3_5352 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_8aa9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_6450_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_8aa9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_8aa9_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_8aa9_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_6450_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_8aa9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1125_c7_8aa9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1125_c7_8aa9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1128_c7_6450_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1125_c7_8aa9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_8aa9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_8aa9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_6450_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_8aa9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_cb86_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_cb86_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_cb86_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1128_c7_6450_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1128_c7_6450_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1128_c7_6450_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1128_c7_6450_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1128_c7_6450_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1128_c7_6450_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_6450_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_6450_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1134_c7_ba51_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_6450_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1128_c7_6450_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1128_c7_6450_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1134_c7_ba51_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1128_c7_6450_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_6450_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_6450_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c7_ba51_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_6450_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_6450_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_6450_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_6450_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1128_c7_6450_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1128_c7_6450_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1134_c7_ba51_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1128_c7_6450_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_6450_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_6450_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1134_c7_ba51_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_6450_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1129_c3_c5c1_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1129_c3_c5c1_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1129_c3_c5c1_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1130_c11_f9fc_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1130_c11_f9fc_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1130_c11_f9fc_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1132_c32_c53f_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1132_c32_c53f_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1132_c32_c53f_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1132_c32_6d8b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1132_c32_6d8b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1132_c32_6d8b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1132_c32_fc2b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1132_c32_fc2b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1132_c32_fc2b_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1132_c32_c53f_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1134_c11_b022_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1134_c11_b022_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1134_c11_b022_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1134_c7_ba51_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1134_c7_ba51_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_3b60_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1134_c7_ba51_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1134_c7_ba51_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1134_c7_ba51_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1134_c7_ba51_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c7_ba51_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1137_c3_2985 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c7_ba51_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_3b60_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c7_ba51_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1134_c7_ba51_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1134_c7_ba51_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1140_c7_3b60_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1134_c7_ba51_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1134_c7_ba51_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1134_c7_ba51_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_3b60_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1134_c7_ba51_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1138_c24_e4d3_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_ecd5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_ecd5_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_ecd5_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_3b60_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1141_c3_2ed2 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_3b60_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_3b60_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1140_c7_3b60_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1140_c7_3b60_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1140_c7_3b60_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_3b60_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_3b60_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_083b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_3b60_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_3b60_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_3b60_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_083b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_3b60_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1142_c34_ce44_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1142_c34_ce44_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1142_c24_7784_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1144_c11_29f1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1144_c11_29f1_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1144_c11_29f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_083b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_083b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_083b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_083b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_083b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_083b_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1117_l1144_l1113_l1140_l1110_l1105_l1128_l1102_l1125_l1097_l1120_DUPLICATE_5f3c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1117_l1113_l1110_l1134_l1105_l1102_l1125_l1097_l1120_DUPLICATE_9b18_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1117_l1113_l1110_l1105_l1128_l1102_l1125_l1097_l1120_DUPLICATE_f4a4_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1117_l1113_l1140_l1110_l1105_l1128_l1102_l1125_l1097_l1120_DUPLICATE_ba34_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1117_l1144_l1113_l1140_l1110_l1134_l1105_l1128_l1102_l1125_l1120_DUPLICATE_0a99_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1114_l1129_l1106_l1121_DUPLICATE_3e50_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1107_l1122_DUPLICATE_e8fe_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1107_l1122_DUPLICATE_e8fe_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1140_l1128_DUPLICATE_2392_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l1093_l1149_DUPLICATE_4cee_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1144_c11_29f1_right := to_unsigned(11, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1120_c11_9c23_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1111_c3_9334 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_89d7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1111_c3_9334;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1115_c3_4d4d := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_c132_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1115_c3_4d4d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1105_c11_c8fb_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c6_75cc_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1102_c11_6f69_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1097_c2_91b6_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_083b_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_ecd5_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1113_c11_7ee4_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1110_c11_2f39_right := to_unsigned(3, 2);
     VAR_MUX_uxn_opcodes_h_l1132_c32_c53f_iffalse := resize(to_signed(-2, 3), 8);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1134_c7_ba51_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1108_c3_b783 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_d749_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1108_c3_b783;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1137_c3_2985 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c7_ba51_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1137_c3_2985;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1126_c3_5352 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_8aa9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1126_c3_5352;
     VAR_MUX_uxn_opcodes_h_l1132_c32_c53f_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1099_c3_6d6e := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c2_91b6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1099_c3_6d6e;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_083b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1132_c32_fc2b_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1134_c7_ba51_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1118_c3_ce20 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_1d97_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1118_c3_ce20;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1134_c11_b022_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1141_c3_2ed2 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_3b60_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1141_c3_2ed2;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1123_c3_0d02 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1120_c7_59b0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1123_c3_0d02;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_cb86_right := to_unsigned(8, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1097_c1_c0a3_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1132_c32_6d8b_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1103_c3_6d95 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1102_c7_554b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1103_c3_6d95;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1125_c11_b40c_right := to_unsigned(7, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1128_c7_6450_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1117_c11_6838_right := to_unsigned(5, 3);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1097_c1_c0a3_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1132_c32_6d8b_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1129_c3_c5c1_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1097_c2_91b6_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1102_c7_554b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1105_c7_d749_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1110_c7_89d7_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1113_c7_c132_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1117_c7_1d97_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1125_c7_8aa9_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1128_c7_6450_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c6_75cc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1102_c11_6f69_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1105_c11_c8fb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1110_c11_2f39_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1113_c11_7ee4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1117_c11_6838_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1120_c11_9c23_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1125_c11_b40c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_cb86_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1134_c11_b022_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_ecd5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1144_c11_29f1_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1114_c3_346a_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1130_c11_f9fc_right := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1097_c2_91b6_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1102_c7_554b_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1110_c7_89d7_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1113_c7_c132_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1142_c34_ce44_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1097_c2_91b6_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1102_c7_554b_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1105_c7_d749_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1110_c7_89d7_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1113_c7_c132_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1117_c7_1d97_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1120_c7_59b0_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1125_c7_8aa9_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1128_c7_6450_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1102_c11_6f69] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1102_c11_6f69_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1102_c11_6f69_left;
     BIN_OP_EQ_uxn_opcodes_h_l1102_c11_6f69_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1102_c11_6f69_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1102_c11_6f69_return_output := BIN_OP_EQ_uxn_opcodes_h_l1102_c11_6f69_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1117_l1113_l1110_l1105_l1128_l1102_l1125_l1097_l1120_DUPLICATE_f4a4 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1117_l1113_l1110_l1105_l1128_l1102_l1125_l1097_l1120_DUPLICATE_f4a4_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1117_l1144_l1113_l1140_l1110_l1134_l1105_l1128_l1102_l1125_l1120_DUPLICATE_0a99 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1117_l1144_l1113_l1140_l1110_l1134_l1105_l1128_l1102_l1125_l1120_DUPLICATE_0a99_return_output := result.is_opc_done;

     -- BIN_OP_AND[uxn_opcodes_h_l1132_c32_6d8b] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1132_c32_6d8b_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1132_c32_6d8b_left;
     BIN_OP_AND_uxn_opcodes_h_l1132_c32_6d8b_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1132_c32_6d8b_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1132_c32_6d8b_return_output := BIN_OP_AND_uxn_opcodes_h_l1132_c32_6d8b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1125_c11_b40c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1125_c11_b40c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1125_c11_b40c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1125_c11_b40c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1125_c11_b40c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1125_c11_b40c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1125_c11_b40c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1113_c11_7ee4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1113_c11_7ee4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1113_c11_7ee4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1113_c11_7ee4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1113_c11_7ee4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1113_c11_7ee4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1113_c11_7ee4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1120_c11_9c23] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1120_c11_9c23_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1120_c11_9c23_left;
     BIN_OP_EQ_uxn_opcodes_h_l1120_c11_9c23_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1120_c11_9c23_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1120_c11_9c23_return_output := BIN_OP_EQ_uxn_opcodes_h_l1120_c11_9c23_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1140_c11_ecd5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1140_c11_ecd5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_ecd5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1140_c11_ecd5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_ecd5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_ecd5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1140_c11_ecd5_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1117_l1144_l1113_l1140_l1110_l1105_l1128_l1102_l1125_l1097_l1120_DUPLICATE_5f3c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1117_l1144_l1113_l1140_l1110_l1105_l1128_l1102_l1125_l1097_l1120_DUPLICATE_5f3c_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1134_c11_b022] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1134_c11_b022_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1134_c11_b022_left;
     BIN_OP_EQ_uxn_opcodes_h_l1134_c11_b022_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1134_c11_b022_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1134_c11_b022_return_output := BIN_OP_EQ_uxn_opcodes_h_l1134_c11_b022_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1144_c11_29f1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1144_c11_29f1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1144_c11_29f1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1144_c11_29f1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1144_c11_29f1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1144_c11_29f1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1144_c11_29f1_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1114_l1129_l1106_l1121_DUPLICATE_3e50 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1114_l1129_l1106_l1121_DUPLICATE_3e50_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1117_l1113_l1110_l1134_l1105_l1102_l1125_l1097_l1120_DUPLICATE_9b18 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1117_l1113_l1110_l1134_l1105_l1102_l1125_l1097_l1120_DUPLICATE_9b18_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1105_c11_c8fb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1105_c11_c8fb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1105_c11_c8fb_left;
     BIN_OP_EQ_uxn_opcodes_h_l1105_c11_c8fb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1105_c11_c8fb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1105_c11_c8fb_return_output := BIN_OP_EQ_uxn_opcodes_h_l1105_c11_c8fb_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1142_c34_ce44] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1142_c34_ce44_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1142_c34_ce44_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1142_c34_ce44_return_output := CONST_SR_8_uxn_opcodes_h_l1142_c34_ce44_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1117_l1113_l1140_l1110_l1105_l1128_l1102_l1125_l1097_l1120_DUPLICATE_ba34 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1117_l1113_l1140_l1110_l1105_l1128_l1102_l1125_l1097_l1120_DUPLICATE_ba34_return_output := result.stack_value;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1140_l1128_DUPLICATE_2392 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1140_l1128_DUPLICATE_2392_return_output := result.stack_address_sp_offset;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1138_c24_e4d3] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1138_c24_e4d3_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- BIN_OP_EQ[uxn_opcodes_h_l1097_c6_75cc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1097_c6_75cc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c6_75cc_left;
     BIN_OP_EQ_uxn_opcodes_h_l1097_c6_75cc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c6_75cc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c6_75cc_return_output := BIN_OP_EQ_uxn_opcodes_h_l1097_c6_75cc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1128_c11_cb86] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1128_c11_cb86_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_cb86_left;
     BIN_OP_EQ_uxn_opcodes_h_l1128_c11_cb86_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_cb86_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_cb86_return_output := BIN_OP_EQ_uxn_opcodes_h_l1128_c11_cb86_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1117_c11_6838] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1117_c11_6838_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1117_c11_6838_left;
     BIN_OP_EQ_uxn_opcodes_h_l1117_c11_6838_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1117_c11_6838_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1117_c11_6838_return_output := BIN_OP_EQ_uxn_opcodes_h_l1117_c11_6838_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1110_c11_2f39] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1110_c11_2f39_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1110_c11_2f39_left;
     BIN_OP_EQ_uxn_opcodes_h_l1110_c11_2f39_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1110_c11_2f39_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1110_c11_2f39_return_output := BIN_OP_EQ_uxn_opcodes_h_l1110_c11_2f39_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1132_c32_fc2b_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1132_c32_6d8b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1097_c1_c0a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c6_75cc_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1097_c2_91b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c6_75cc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1097_c2_91b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c6_75cc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c2_91b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c6_75cc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1097_c2_91b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c6_75cc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1097_c2_91b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c6_75cc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c2_91b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c6_75cc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1097_c2_91b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c6_75cc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1097_c2_91b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c6_75cc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1097_c2_91b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c6_75cc_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1102_c7_554b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1102_c11_6f69_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_554b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1102_c11_6f69_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1102_c7_554b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1102_c11_6f69_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_554b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1102_c11_6f69_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1102_c7_554b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1102_c11_6f69_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1102_c7_554b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1102_c11_6f69_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1102_c7_554b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1102_c11_6f69_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1102_c7_554b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1102_c11_6f69_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1102_c7_554b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1102_c11_6f69_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1105_c7_d749_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1105_c11_c8fb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_d749_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1105_c11_c8fb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1105_c7_d749_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1105_c11_c8fb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_d749_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1105_c11_c8fb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1105_c7_d749_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1105_c11_c8fb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_d749_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1105_c11_c8fb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1105_c7_d749_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1105_c11_c8fb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1105_c7_d749_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1105_c11_c8fb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1105_c7_d749_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1105_c11_c8fb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1110_c7_89d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1110_c11_2f39_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_89d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1110_c11_2f39_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1110_c7_89d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1110_c11_2f39_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_89d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1110_c11_2f39_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_89d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1110_c11_2f39_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_89d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1110_c11_2f39_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1110_c7_89d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1110_c11_2f39_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1110_c7_89d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1110_c11_2f39_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1110_c7_89d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1110_c11_2f39_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1113_c7_c132_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1113_c11_7ee4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_c132_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1113_c11_7ee4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_c132_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1113_c11_7ee4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_c132_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1113_c11_7ee4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_c132_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1113_c11_7ee4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_c132_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1113_c11_7ee4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1113_c7_c132_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1113_c11_7ee4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1113_c7_c132_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1113_c11_7ee4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1113_c7_c132_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1113_c11_7ee4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1117_c7_1d97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1117_c11_6838_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_1d97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1117_c11_6838_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1117_c7_1d97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1117_c11_6838_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_1d97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1117_c11_6838_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1117_c7_1d97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1117_c11_6838_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_1d97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1117_c11_6838_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1117_c7_1d97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1117_c11_6838_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1117_c7_1d97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1117_c11_6838_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1120_c7_59b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1120_c11_9c23_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_59b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1120_c11_9c23_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1120_c7_59b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1120_c11_9c23_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_59b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1120_c11_9c23_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1120_c7_59b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1120_c11_9c23_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1120_c7_59b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1120_c11_9c23_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1120_c7_59b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1120_c11_9c23_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1120_c7_59b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1120_c11_9c23_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1125_c7_8aa9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1125_c11_b40c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_8aa9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1125_c11_b40c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1125_c7_8aa9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1125_c11_b40c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_8aa9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1125_c11_b40c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_8aa9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1125_c11_b40c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_8aa9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1125_c11_b40c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1125_c7_8aa9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1125_c11_b40c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1125_c7_8aa9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1125_c11_b40c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1128_c7_6450_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_cb86_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_6450_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_cb86_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1128_c7_6450_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_cb86_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_6450_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_cb86_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_6450_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_cb86_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_6450_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_cb86_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1128_c7_6450_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_cb86_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1128_c7_6450_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_cb86_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1134_c7_ba51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1134_c11_b022_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1134_c7_ba51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1134_c11_b022_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1134_c7_ba51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1134_c11_b022_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c7_ba51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1134_c11_b022_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1134_c7_ba51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1134_c11_b022_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_3b60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_ecd5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_3b60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_ecd5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_3b60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_ecd5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1140_c7_3b60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_ecd5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_083b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1144_c11_29f1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_083b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1144_c11_29f1_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1114_c3_346a_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1114_l1129_l1106_l1121_DUPLICATE_3e50_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1129_c3_c5c1_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1114_l1129_l1106_l1121_DUPLICATE_3e50_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1107_l1122_DUPLICATE_e8fe_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1114_l1129_l1106_l1121_DUPLICATE_3e50_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1134_c7_ba51_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1138_c24_e4d3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1097_c2_91b6_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1117_l1113_l1110_l1105_l1128_l1102_l1125_l1097_l1120_DUPLICATE_f4a4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1102_c7_554b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1117_l1113_l1110_l1105_l1128_l1102_l1125_l1097_l1120_DUPLICATE_f4a4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1105_c7_d749_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1117_l1113_l1110_l1105_l1128_l1102_l1125_l1097_l1120_DUPLICATE_f4a4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_89d7_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1117_l1113_l1110_l1105_l1128_l1102_l1125_l1097_l1120_DUPLICATE_f4a4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_c132_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1117_l1113_l1110_l1105_l1128_l1102_l1125_l1097_l1120_DUPLICATE_f4a4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1117_c7_1d97_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1117_l1113_l1110_l1105_l1128_l1102_l1125_l1097_l1120_DUPLICATE_f4a4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1120_c7_59b0_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1117_l1113_l1110_l1105_l1128_l1102_l1125_l1097_l1120_DUPLICATE_f4a4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_8aa9_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1117_l1113_l1110_l1105_l1128_l1102_l1125_l1097_l1120_DUPLICATE_f4a4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_6450_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1117_l1113_l1110_l1105_l1128_l1102_l1125_l1097_l1120_DUPLICATE_f4a4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_554b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1117_l1144_l1113_l1140_l1110_l1134_l1105_l1128_l1102_l1125_l1120_DUPLICATE_0a99_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_d749_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1117_l1144_l1113_l1140_l1110_l1134_l1105_l1128_l1102_l1125_l1120_DUPLICATE_0a99_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_89d7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1117_l1144_l1113_l1140_l1110_l1134_l1105_l1128_l1102_l1125_l1120_DUPLICATE_0a99_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_c132_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1117_l1144_l1113_l1140_l1110_l1134_l1105_l1128_l1102_l1125_l1120_DUPLICATE_0a99_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_1d97_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1117_l1144_l1113_l1140_l1110_l1134_l1105_l1128_l1102_l1125_l1120_DUPLICATE_0a99_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_59b0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1117_l1144_l1113_l1140_l1110_l1134_l1105_l1128_l1102_l1125_l1120_DUPLICATE_0a99_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_8aa9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1117_l1144_l1113_l1140_l1110_l1134_l1105_l1128_l1102_l1125_l1120_DUPLICATE_0a99_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_6450_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1117_l1144_l1113_l1140_l1110_l1134_l1105_l1128_l1102_l1125_l1120_DUPLICATE_0a99_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1134_c7_ba51_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1117_l1144_l1113_l1140_l1110_l1134_l1105_l1128_l1102_l1125_l1120_DUPLICATE_0a99_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_3b60_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1117_l1144_l1113_l1140_l1110_l1134_l1105_l1128_l1102_l1125_l1120_DUPLICATE_0a99_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_083b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1117_l1144_l1113_l1140_l1110_l1134_l1105_l1128_l1102_l1125_l1120_DUPLICATE_0a99_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c2_91b6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1117_l1113_l1110_l1134_l1105_l1102_l1125_l1097_l1120_DUPLICATE_9b18_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1102_c7_554b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1117_l1113_l1110_l1134_l1105_l1102_l1125_l1097_l1120_DUPLICATE_9b18_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1105_c7_d749_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1117_l1113_l1110_l1134_l1105_l1102_l1125_l1097_l1120_DUPLICATE_9b18_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1110_c7_89d7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1117_l1113_l1110_l1134_l1105_l1102_l1125_l1097_l1120_DUPLICATE_9b18_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_c132_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1117_l1113_l1110_l1134_l1105_l1102_l1125_l1097_l1120_DUPLICATE_9b18_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1117_c7_1d97_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1117_l1113_l1110_l1134_l1105_l1102_l1125_l1097_l1120_DUPLICATE_9b18_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1120_c7_59b0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1117_l1113_l1110_l1134_l1105_l1102_l1125_l1097_l1120_DUPLICATE_9b18_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1125_c7_8aa9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1117_l1113_l1110_l1134_l1105_l1102_l1125_l1097_l1120_DUPLICATE_9b18_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1134_c7_ba51_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1117_l1113_l1110_l1134_l1105_l1102_l1125_l1097_l1120_DUPLICATE_9b18_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1097_c2_91b6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1117_l1144_l1113_l1140_l1110_l1105_l1128_l1102_l1125_l1097_l1120_DUPLICATE_5f3c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_554b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1117_l1144_l1113_l1140_l1110_l1105_l1128_l1102_l1125_l1097_l1120_DUPLICATE_5f3c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_d749_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1117_l1144_l1113_l1140_l1110_l1105_l1128_l1102_l1125_l1097_l1120_DUPLICATE_5f3c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_89d7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1117_l1144_l1113_l1140_l1110_l1105_l1128_l1102_l1125_l1097_l1120_DUPLICATE_5f3c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_c132_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1117_l1144_l1113_l1140_l1110_l1105_l1128_l1102_l1125_l1097_l1120_DUPLICATE_5f3c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_1d97_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1117_l1144_l1113_l1140_l1110_l1105_l1128_l1102_l1125_l1097_l1120_DUPLICATE_5f3c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_59b0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1117_l1144_l1113_l1140_l1110_l1105_l1128_l1102_l1125_l1097_l1120_DUPLICATE_5f3c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_8aa9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1117_l1144_l1113_l1140_l1110_l1105_l1128_l1102_l1125_l1097_l1120_DUPLICATE_5f3c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_6450_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1117_l1144_l1113_l1140_l1110_l1105_l1128_l1102_l1125_l1097_l1120_DUPLICATE_5f3c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_3b60_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1117_l1144_l1113_l1140_l1110_l1105_l1128_l1102_l1125_l1097_l1120_DUPLICATE_5f3c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_083b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1117_l1144_l1113_l1140_l1110_l1105_l1128_l1102_l1125_l1097_l1120_DUPLICATE_5f3c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_6450_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1140_l1128_DUPLICATE_2392_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_3b60_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1140_l1128_DUPLICATE_2392_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1097_c2_91b6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1117_l1113_l1140_l1110_l1105_l1128_l1102_l1125_l1097_l1120_DUPLICATE_ba34_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1102_c7_554b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1117_l1113_l1140_l1110_l1105_l1128_l1102_l1125_l1097_l1120_DUPLICATE_ba34_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1105_c7_d749_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1117_l1113_l1140_l1110_l1105_l1128_l1102_l1125_l1097_l1120_DUPLICATE_ba34_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1110_c7_89d7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1117_l1113_l1140_l1110_l1105_l1128_l1102_l1125_l1097_l1120_DUPLICATE_ba34_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1113_c7_c132_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1117_l1113_l1140_l1110_l1105_l1128_l1102_l1125_l1097_l1120_DUPLICATE_ba34_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1117_c7_1d97_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1117_l1113_l1140_l1110_l1105_l1128_l1102_l1125_l1097_l1120_DUPLICATE_ba34_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1120_c7_59b0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1117_l1113_l1140_l1110_l1105_l1128_l1102_l1125_l1097_l1120_DUPLICATE_ba34_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1125_c7_8aa9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1117_l1113_l1140_l1110_l1105_l1128_l1102_l1125_l1097_l1120_DUPLICATE_ba34_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1128_c7_6450_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1117_l1113_l1140_l1110_l1105_l1128_l1102_l1125_l1097_l1120_DUPLICATE_ba34_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1140_c7_3b60_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1117_l1113_l1140_l1110_l1105_l1128_l1102_l1125_l1097_l1120_DUPLICATE_ba34_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1144_c7_083b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_083b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_083b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_083b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_083b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_083b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_083b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_083b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_083b_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1129_c3_c5c1] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1129_c3_c5c1_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1129_c3_c5c1_left;
     BIN_OP_OR_uxn_opcodes_h_l1129_c3_c5c1_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1129_c3_c5c1_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1129_c3_c5c1_return_output := BIN_OP_OR_uxn_opcodes_h_l1129_c3_c5c1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1144_c7_083b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_083b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_083b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_083b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_083b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_083b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_083b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_083b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_083b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1140_c7_3b60] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_3b60_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_3b60_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_3b60_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_3b60_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_3b60_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_3b60_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_3b60_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_3b60_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1097_c1_c0a3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1097_c1_c0a3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1097_c1_c0a3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1097_c1_c0a3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1097_c1_c0a3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1097_c1_c0a3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1097_c1_c0a3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1097_c1_c0a3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1097_c1_c0a3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1134_c7_ba51] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1134_c7_ba51_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1134_c7_ba51_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1134_c7_ba51_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1134_c7_ba51_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1134_c7_ba51_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1134_c7_ba51_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1134_c7_ba51_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1134_c7_ba51_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1114_c3_346a] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1114_c3_346a_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1114_c3_346a_left;
     BIN_OP_OR_uxn_opcodes_h_l1114_c3_346a_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1114_c3_346a_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1114_c3_346a_return_output := BIN_OP_OR_uxn_opcodes_h_l1114_c3_346a_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1107_l1122_DUPLICATE_e8fe LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1107_l1122_DUPLICATE_e8fe_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1107_l1122_DUPLICATE_e8fe_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1107_l1122_DUPLICATE_e8fe_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1107_l1122_DUPLICATE_e8fe_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1132_c32_fc2b] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1132_c32_fc2b_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1132_c32_fc2b_left;
     BIN_OP_GT_uxn_opcodes_h_l1132_c32_fc2b_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1132_c32_fc2b_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1132_c32_fc2b_return_output := BIN_OP_GT_uxn_opcodes_h_l1132_c32_fc2b_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1142_c24_7784] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1142_c24_7784_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1142_c34_ce44_return_output);

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1132_c32_c53f_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1132_c32_fc2b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1113_c7_c132_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1114_c3_346a_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1130_c11_f9fc_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1129_c3_c5c1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1128_c7_6450_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1129_c3_c5c1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1140_c7_3b60_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1142_c24_7784_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1120_c7_59b0_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1107_l1122_DUPLICATE_e8fe_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1105_c7_d749_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1107_l1122_DUPLICATE_e8fe_return_output;
     VAR_printf_uxn_opcodes_h_l1098_c3_8de8_uxn_opcodes_h_l1098_c3_8de8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1097_c1_c0a3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_3b60_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_083b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1128_c7_6450_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1134_c7_ba51_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_3b60_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_083b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c7_ba51_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_3b60_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1140_c7_3b60] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_3b60_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_3b60_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_3b60_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_3b60_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_3b60_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_3b60_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_3b60_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_3b60_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1128_c7_6450] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1128_c7_6450_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1128_c7_6450_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1128_c7_6450_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1128_c7_6450_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1128_c7_6450_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1128_c7_6450_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1128_c7_6450_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1128_c7_6450_return_output;

     -- printf_uxn_opcodes_h_l1098_c3_8de8[uxn_opcodes_h_l1098_c3_8de8] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1098_c3_8de8_uxn_opcodes_h_l1098_c3_8de8_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1098_c3_8de8_uxn_opcodes_h_l1098_c3_8de8_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- MUX[uxn_opcodes_h_l1132_c32_c53f] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1132_c32_c53f_cond <= VAR_MUX_uxn_opcodes_h_l1132_c32_c53f_cond;
     MUX_uxn_opcodes_h_l1132_c32_c53f_iftrue <= VAR_MUX_uxn_opcodes_h_l1132_c32_c53f_iftrue;
     MUX_uxn_opcodes_h_l1132_c32_c53f_iffalse <= VAR_MUX_uxn_opcodes_h_l1132_c32_c53f_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1132_c32_c53f_return_output := MUX_uxn_opcodes_h_l1132_c32_c53f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1134_c7_ba51] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c7_ba51_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c7_ba51_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c7_ba51_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c7_ba51_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c7_ba51_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c7_ba51_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c7_ba51_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c7_ba51_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1140_c7_3b60] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1140_c7_3b60_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1140_c7_3b60_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1140_c7_3b60_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1140_c7_3b60_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1140_c7_3b60_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1140_c7_3b60_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1140_c7_3b60_return_output := result_stack_value_MUX_uxn_opcodes_h_l1140_c7_3b60_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1140_c7_3b60] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_3b60_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_3b60_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_3b60_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_3b60_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_3b60_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_3b60_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_3b60_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_3b60_return_output;

     -- n16_MUX[uxn_opcodes_h_l1128_c7_6450] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1128_c7_6450_cond <= VAR_n16_MUX_uxn_opcodes_h_l1128_c7_6450_cond;
     n16_MUX_uxn_opcodes_h_l1128_c7_6450_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1128_c7_6450_iftrue;
     n16_MUX_uxn_opcodes_h_l1128_c7_6450_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1128_c7_6450_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1128_c7_6450_return_output := n16_MUX_uxn_opcodes_h_l1128_c7_6450_return_output;

     -- t16_MUX[uxn_opcodes_h_l1113_c7_c132] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1113_c7_c132_cond <= VAR_t16_MUX_uxn_opcodes_h_l1113_c7_c132_cond;
     t16_MUX_uxn_opcodes_h_l1113_c7_c132_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1113_c7_c132_iftrue;
     t16_MUX_uxn_opcodes_h_l1113_c7_c132_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1113_c7_c132_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1113_c7_c132_return_output := t16_MUX_uxn_opcodes_h_l1113_c7_c132_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1130_c11_f9fc] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1130_c11_f9fc_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1130_c11_f9fc_left;
     BIN_OP_OR_uxn_opcodes_h_l1130_c11_f9fc_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1130_c11_f9fc_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1130_c11_f9fc_return_output := BIN_OP_OR_uxn_opcodes_h_l1130_c11_f9fc_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l1128_c7_6450_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1130_c11_f9fc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_6450_iftrue := VAR_MUX_uxn_opcodes_h_l1132_c32_c53f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1125_c7_8aa9_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1128_c7_6450_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1134_c7_ba51_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_3b60_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1125_c7_8aa9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1128_c7_6450_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1134_c7_ba51_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_3b60_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_6450_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c7_ba51_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1134_c7_ba51_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1140_c7_3b60_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1110_c7_89d7_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1113_c7_c132_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1125_c7_8aa9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1125_c7_8aa9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1125_c7_8aa9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1125_c7_8aa9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1125_c7_8aa9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1125_c7_8aa9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1125_c7_8aa9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1125_c7_8aa9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1125_c7_8aa9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1128_c7_6450] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_6450_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_6450_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_6450_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_6450_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_6450_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_6450_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_6450_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_6450_return_output;

     -- n16_MUX[uxn_opcodes_h_l1125_c7_8aa9] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1125_c7_8aa9_cond <= VAR_n16_MUX_uxn_opcodes_h_l1125_c7_8aa9_cond;
     n16_MUX_uxn_opcodes_h_l1125_c7_8aa9_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1125_c7_8aa9_iftrue;
     n16_MUX_uxn_opcodes_h_l1125_c7_8aa9_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1125_c7_8aa9_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1125_c7_8aa9_return_output := n16_MUX_uxn_opcodes_h_l1125_c7_8aa9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1128_c7_6450] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_6450_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_6450_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_6450_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_6450_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_6450_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_6450_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_6450_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_6450_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1134_c7_ba51] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1134_c7_ba51_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1134_c7_ba51_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1134_c7_ba51_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1134_c7_ba51_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1134_c7_ba51_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1134_c7_ba51_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1134_c7_ba51_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1134_c7_ba51_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1134_c7_ba51] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1134_c7_ba51_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1134_c7_ba51_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1134_c7_ba51_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1134_c7_ba51_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1134_c7_ba51_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1134_c7_ba51_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1134_c7_ba51_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1134_c7_ba51_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1128_c7_6450] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1128_c7_6450_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1128_c7_6450_cond;
     tmp16_MUX_uxn_opcodes_h_l1128_c7_6450_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1128_c7_6450_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1128_c7_6450_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1128_c7_6450_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1128_c7_6450_return_output := tmp16_MUX_uxn_opcodes_h_l1128_c7_6450_return_output;

     -- t16_MUX[uxn_opcodes_h_l1110_c7_89d7] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1110_c7_89d7_cond <= VAR_t16_MUX_uxn_opcodes_h_l1110_c7_89d7_cond;
     t16_MUX_uxn_opcodes_h_l1110_c7_89d7_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1110_c7_89d7_iftrue;
     t16_MUX_uxn_opcodes_h_l1110_c7_89d7_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1110_c7_89d7_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1110_c7_89d7_return_output := t16_MUX_uxn_opcodes_h_l1110_c7_89d7_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1134_c7_ba51] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1134_c7_ba51_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1134_c7_ba51_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1134_c7_ba51_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1134_c7_ba51_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1134_c7_ba51_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1134_c7_ba51_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1134_c7_ba51_return_output := result_stack_value_MUX_uxn_opcodes_h_l1134_c7_ba51_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l1120_c7_59b0_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1125_c7_8aa9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_6450_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1134_c7_ba51_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1120_c7_59b0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1125_c7_8aa9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_6450_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1134_c7_ba51_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_8aa9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_6450_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_8aa9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_6450_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1128_c7_6450_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1134_c7_ba51_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1105_c7_d749_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1110_c7_89d7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1125_c7_8aa9_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1128_c7_6450_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1120_c7_59b0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1120_c7_59b0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1120_c7_59b0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1120_c7_59b0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1120_c7_59b0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1120_c7_59b0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1120_c7_59b0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1120_c7_59b0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1120_c7_59b0_return_output;

     -- n16_MUX[uxn_opcodes_h_l1120_c7_59b0] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1120_c7_59b0_cond <= VAR_n16_MUX_uxn_opcodes_h_l1120_c7_59b0_cond;
     n16_MUX_uxn_opcodes_h_l1120_c7_59b0_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1120_c7_59b0_iftrue;
     n16_MUX_uxn_opcodes_h_l1120_c7_59b0_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1120_c7_59b0_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1120_c7_59b0_return_output := n16_MUX_uxn_opcodes_h_l1120_c7_59b0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1128_c7_6450] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_6450_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_6450_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_6450_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_6450_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_6450_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_6450_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_6450_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_6450_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1128_c7_6450] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1128_c7_6450_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1128_c7_6450_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1128_c7_6450_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1128_c7_6450_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1128_c7_6450_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1128_c7_6450_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1128_c7_6450_return_output := result_stack_value_MUX_uxn_opcodes_h_l1128_c7_6450_return_output;

     -- t16_MUX[uxn_opcodes_h_l1105_c7_d749] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1105_c7_d749_cond <= VAR_t16_MUX_uxn_opcodes_h_l1105_c7_d749_cond;
     t16_MUX_uxn_opcodes_h_l1105_c7_d749_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1105_c7_d749_iftrue;
     t16_MUX_uxn_opcodes_h_l1105_c7_d749_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1105_c7_d749_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1105_c7_d749_return_output := t16_MUX_uxn_opcodes_h_l1105_c7_d749_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1125_c7_8aa9] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1125_c7_8aa9_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1125_c7_8aa9_cond;
     tmp16_MUX_uxn_opcodes_h_l1125_c7_8aa9_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1125_c7_8aa9_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1125_c7_8aa9_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1125_c7_8aa9_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1125_c7_8aa9_return_output := tmp16_MUX_uxn_opcodes_h_l1125_c7_8aa9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1125_c7_8aa9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_8aa9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_8aa9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_8aa9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_8aa9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_8aa9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_8aa9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_8aa9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_8aa9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1128_c7_6450] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_6450_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_6450_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_6450_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_6450_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_6450_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_6450_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_6450_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_6450_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1125_c7_8aa9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_8aa9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_8aa9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_8aa9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_8aa9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_8aa9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_8aa9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_8aa9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_8aa9_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1117_c7_1d97_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1120_c7_59b0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_8aa9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_6450_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1117_c7_1d97_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1120_c7_59b0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_8aa9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_6450_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1120_c7_59b0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_8aa9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1120_c7_59b0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_8aa9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1125_c7_8aa9_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1128_c7_6450_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1102_c7_554b_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1105_c7_d749_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1120_c7_59b0_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1125_c7_8aa9_return_output;
     -- t16_MUX[uxn_opcodes_h_l1102_c7_554b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1102_c7_554b_cond <= VAR_t16_MUX_uxn_opcodes_h_l1102_c7_554b_cond;
     t16_MUX_uxn_opcodes_h_l1102_c7_554b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1102_c7_554b_iftrue;
     t16_MUX_uxn_opcodes_h_l1102_c7_554b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1102_c7_554b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1102_c7_554b_return_output := t16_MUX_uxn_opcodes_h_l1102_c7_554b_return_output;

     -- n16_MUX[uxn_opcodes_h_l1117_c7_1d97] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1117_c7_1d97_cond <= VAR_n16_MUX_uxn_opcodes_h_l1117_c7_1d97_cond;
     n16_MUX_uxn_opcodes_h_l1117_c7_1d97_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1117_c7_1d97_iftrue;
     n16_MUX_uxn_opcodes_h_l1117_c7_1d97_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1117_c7_1d97_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1117_c7_1d97_return_output := n16_MUX_uxn_opcodes_h_l1117_c7_1d97_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1125_c7_8aa9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_8aa9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_8aa9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_8aa9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_8aa9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_8aa9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_8aa9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_8aa9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_8aa9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1117_c7_1d97] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1117_c7_1d97_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1117_c7_1d97_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1117_c7_1d97_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1117_c7_1d97_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1117_c7_1d97_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1117_c7_1d97_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1117_c7_1d97_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1117_c7_1d97_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1125_c7_8aa9] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1125_c7_8aa9_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1125_c7_8aa9_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1125_c7_8aa9_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1125_c7_8aa9_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1125_c7_8aa9_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1125_c7_8aa9_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1125_c7_8aa9_return_output := result_stack_value_MUX_uxn_opcodes_h_l1125_c7_8aa9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1120_c7_59b0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1120_c7_59b0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1120_c7_59b0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1120_c7_59b0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1120_c7_59b0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1120_c7_59b0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1120_c7_59b0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1120_c7_59b0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1120_c7_59b0_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1120_c7_59b0] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1120_c7_59b0_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1120_c7_59b0_cond;
     tmp16_MUX_uxn_opcodes_h_l1120_c7_59b0_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1120_c7_59b0_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1120_c7_59b0_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1120_c7_59b0_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1120_c7_59b0_return_output := tmp16_MUX_uxn_opcodes_h_l1120_c7_59b0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1120_c7_59b0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1120_c7_59b0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1120_c7_59b0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1120_c7_59b0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1120_c7_59b0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1120_c7_59b0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1120_c7_59b0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1120_c7_59b0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1120_c7_59b0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1125_c7_8aa9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_8aa9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_8aa9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_8aa9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_8aa9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_8aa9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_8aa9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_8aa9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_8aa9_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1113_c7_c132_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1117_c7_1d97_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_59b0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_8aa9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_c132_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1117_c7_1d97_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_59b0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_8aa9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1117_c7_1d97_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1120_c7_59b0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_1d97_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1120_c7_59b0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1120_c7_59b0_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1125_c7_8aa9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1097_c2_91b6_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1102_c7_554b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1117_c7_1d97_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1120_c7_59b0_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1117_c7_1d97] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_1d97_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_1d97_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_1d97_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_1d97_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_1d97_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_1d97_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_1d97_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_1d97_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1120_c7_59b0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_59b0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_59b0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_59b0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_59b0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_59b0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_59b0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_59b0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_59b0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1113_c7_c132] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_c132_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_c132_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_c132_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_c132_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_c132_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_c132_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_c132_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_c132_return_output;

     -- n16_MUX[uxn_opcodes_h_l1113_c7_c132] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1113_c7_c132_cond <= VAR_n16_MUX_uxn_opcodes_h_l1113_c7_c132_cond;
     n16_MUX_uxn_opcodes_h_l1113_c7_c132_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1113_c7_c132_iftrue;
     n16_MUX_uxn_opcodes_h_l1113_c7_c132_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1113_c7_c132_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1113_c7_c132_return_output := n16_MUX_uxn_opcodes_h_l1113_c7_c132_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1120_c7_59b0] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1120_c7_59b0_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1120_c7_59b0_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1120_c7_59b0_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1120_c7_59b0_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1120_c7_59b0_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1120_c7_59b0_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1120_c7_59b0_return_output := result_stack_value_MUX_uxn_opcodes_h_l1120_c7_59b0_return_output;

     -- t16_MUX[uxn_opcodes_h_l1097_c2_91b6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1097_c2_91b6_cond <= VAR_t16_MUX_uxn_opcodes_h_l1097_c2_91b6_cond;
     t16_MUX_uxn_opcodes_h_l1097_c2_91b6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1097_c2_91b6_iftrue;
     t16_MUX_uxn_opcodes_h_l1097_c2_91b6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1097_c2_91b6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1097_c2_91b6_return_output := t16_MUX_uxn_opcodes_h_l1097_c2_91b6_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1117_c7_1d97] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1117_c7_1d97_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1117_c7_1d97_cond;
     tmp16_MUX_uxn_opcodes_h_l1117_c7_1d97_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1117_c7_1d97_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1117_c7_1d97_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1117_c7_1d97_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1117_c7_1d97_return_output := tmp16_MUX_uxn_opcodes_h_l1117_c7_1d97_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1120_c7_59b0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_59b0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_59b0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_59b0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_59b0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_59b0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_59b0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_59b0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_59b0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1117_c7_1d97] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1117_c7_1d97_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1117_c7_1d97_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1117_c7_1d97_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1117_c7_1d97_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1117_c7_1d97_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1117_c7_1d97_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1117_c7_1d97_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1117_c7_1d97_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1110_c7_89d7_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1113_c7_c132_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_1d97_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_59b0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1110_c7_89d7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_c132_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_1d97_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_59b0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_c132_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1117_c7_1d97_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_c132_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_1d97_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1117_c7_1d97_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1120_c7_59b0_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1097_c2_91b6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1113_c7_c132_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1117_c7_1d97_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1117_c7_1d97] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_1d97_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_1d97_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_1d97_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_1d97_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_1d97_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_1d97_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_1d97_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_1d97_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1117_c7_1d97] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_1d97_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_1d97_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_1d97_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_1d97_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_1d97_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_1d97_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_1d97_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_1d97_return_output;

     -- n16_MUX[uxn_opcodes_h_l1110_c7_89d7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1110_c7_89d7_cond <= VAR_n16_MUX_uxn_opcodes_h_l1110_c7_89d7_cond;
     n16_MUX_uxn_opcodes_h_l1110_c7_89d7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1110_c7_89d7_iftrue;
     n16_MUX_uxn_opcodes_h_l1110_c7_89d7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1110_c7_89d7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1110_c7_89d7_return_output := n16_MUX_uxn_opcodes_h_l1110_c7_89d7_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1113_c7_c132] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1113_c7_c132_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1113_c7_c132_cond;
     tmp16_MUX_uxn_opcodes_h_l1113_c7_c132_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1113_c7_c132_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1113_c7_c132_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1113_c7_c132_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1113_c7_c132_return_output := tmp16_MUX_uxn_opcodes_h_l1113_c7_c132_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1110_c7_89d7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1110_c7_89d7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1110_c7_89d7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1110_c7_89d7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1110_c7_89d7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1110_c7_89d7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1110_c7_89d7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1110_c7_89d7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1110_c7_89d7_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1117_c7_1d97] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1117_c7_1d97_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1117_c7_1d97_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1117_c7_1d97_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1117_c7_1d97_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1117_c7_1d97_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1117_c7_1d97_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1117_c7_1d97_return_output := result_stack_value_MUX_uxn_opcodes_h_l1117_c7_1d97_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1113_c7_c132] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_c132_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_c132_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_c132_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_c132_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_c132_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_c132_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_c132_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_c132_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1113_c7_c132] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_c132_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_c132_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_c132_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_c132_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_c132_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_c132_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_c132_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_c132_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1105_c7_d749_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1110_c7_89d7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_c132_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_1d97_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1105_c7_d749_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1110_c7_89d7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_c132_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_1d97_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_89d7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_c132_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_89d7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_c132_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1113_c7_c132_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1117_c7_1d97_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1110_c7_89d7_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1113_c7_c132_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1113_c7_c132] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_c132_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_c132_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_c132_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_c132_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_c132_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_c132_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_c132_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_c132_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1110_c7_89d7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_89d7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_89d7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_89d7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_89d7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_89d7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_89d7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_89d7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_89d7_return_output;

     -- n16_MUX[uxn_opcodes_h_l1105_c7_d749] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1105_c7_d749_cond <= VAR_n16_MUX_uxn_opcodes_h_l1105_c7_d749_cond;
     n16_MUX_uxn_opcodes_h_l1105_c7_d749_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1105_c7_d749_iftrue;
     n16_MUX_uxn_opcodes_h_l1105_c7_d749_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1105_c7_d749_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1105_c7_d749_return_output := n16_MUX_uxn_opcodes_h_l1105_c7_d749_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1113_c7_c132] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_c132_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_c132_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_c132_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_c132_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_c132_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_c132_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_c132_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_c132_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1110_c7_89d7] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1110_c7_89d7_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1110_c7_89d7_cond;
     tmp16_MUX_uxn_opcodes_h_l1110_c7_89d7_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1110_c7_89d7_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1110_c7_89d7_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1110_c7_89d7_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1110_c7_89d7_return_output := tmp16_MUX_uxn_opcodes_h_l1110_c7_89d7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1105_c7_d749] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1105_c7_d749_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1105_c7_d749_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1105_c7_d749_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1105_c7_d749_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1105_c7_d749_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1105_c7_d749_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1105_c7_d749_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1105_c7_d749_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1110_c7_89d7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_89d7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_89d7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_89d7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_89d7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_89d7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_89d7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_89d7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_89d7_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1113_c7_c132] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1113_c7_c132_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1113_c7_c132_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1113_c7_c132_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1113_c7_c132_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1113_c7_c132_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1113_c7_c132_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1113_c7_c132_return_output := result_stack_value_MUX_uxn_opcodes_h_l1113_c7_c132_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l1102_c7_554b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1105_c7_d749_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_89d7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_c132_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1102_c7_554b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1105_c7_d749_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_89d7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_c132_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1105_c7_d749_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_89d7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_d749_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_89d7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1110_c7_89d7_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1113_c7_c132_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1105_c7_d749_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1110_c7_89d7_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1105_c7_d749] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1105_c7_d749_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1105_c7_d749_cond;
     tmp16_MUX_uxn_opcodes_h_l1105_c7_d749_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1105_c7_d749_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1105_c7_d749_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1105_c7_d749_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1105_c7_d749_return_output := tmp16_MUX_uxn_opcodes_h_l1105_c7_d749_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1110_c7_89d7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_89d7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_89d7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_89d7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_89d7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_89d7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_89d7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_89d7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_89d7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1105_c7_d749] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1105_c7_d749_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1105_c7_d749_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1105_c7_d749_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1105_c7_d749_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1105_c7_d749_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1105_c7_d749_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1105_c7_d749_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1105_c7_d749_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1110_c7_89d7] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1110_c7_89d7_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1110_c7_89d7_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1110_c7_89d7_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1110_c7_89d7_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1110_c7_89d7_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1110_c7_89d7_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1110_c7_89d7_return_output := result_stack_value_MUX_uxn_opcodes_h_l1110_c7_89d7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1102_c7_554b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1102_c7_554b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1102_c7_554b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1102_c7_554b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1102_c7_554b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1102_c7_554b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1102_c7_554b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1102_c7_554b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1102_c7_554b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1105_c7_d749] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_d749_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_d749_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_d749_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_d749_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_d749_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_d749_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_d749_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_d749_return_output;

     -- n16_MUX[uxn_opcodes_h_l1102_c7_554b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1102_c7_554b_cond <= VAR_n16_MUX_uxn_opcodes_h_l1102_c7_554b_cond;
     n16_MUX_uxn_opcodes_h_l1102_c7_554b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1102_c7_554b_iftrue;
     n16_MUX_uxn_opcodes_h_l1102_c7_554b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1102_c7_554b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1102_c7_554b_return_output := n16_MUX_uxn_opcodes_h_l1102_c7_554b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1110_c7_89d7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_89d7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_89d7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_89d7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_89d7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_89d7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_89d7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_89d7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_89d7_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l1097_c2_91b6_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1102_c7_554b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_d749_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_89d7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c2_91b6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1102_c7_554b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_d749_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_89d7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1102_c7_554b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1105_c7_d749_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1102_c7_554b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_d749_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1105_c7_d749_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1110_c7_89d7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1102_c7_554b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1105_c7_d749_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1105_c7_d749] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_d749_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_d749_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_d749_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_d749_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_d749_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_d749_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_d749_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_d749_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1105_c7_d749] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_d749_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_d749_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_d749_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_d749_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_d749_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_d749_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_d749_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_d749_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1102_c7_554b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1102_c7_554b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1102_c7_554b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1102_c7_554b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1102_c7_554b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1102_c7_554b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1102_c7_554b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1102_c7_554b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1102_c7_554b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1097_c2_91b6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c2_91b6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c2_91b6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c2_91b6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c2_91b6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c2_91b6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c2_91b6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c2_91b6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c2_91b6_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1102_c7_554b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1102_c7_554b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1102_c7_554b_cond;
     tmp16_MUX_uxn_opcodes_h_l1102_c7_554b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1102_c7_554b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1102_c7_554b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1102_c7_554b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1102_c7_554b_return_output := tmp16_MUX_uxn_opcodes_h_l1102_c7_554b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1102_c7_554b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1102_c7_554b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1102_c7_554b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1102_c7_554b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1102_c7_554b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1102_c7_554b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1102_c7_554b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1102_c7_554b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1102_c7_554b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1105_c7_d749] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1105_c7_d749_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1105_c7_d749_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1105_c7_d749_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1105_c7_d749_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1105_c7_d749_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1105_c7_d749_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1105_c7_d749_return_output := result_stack_value_MUX_uxn_opcodes_h_l1105_c7_d749_return_output;

     -- n16_MUX[uxn_opcodes_h_l1097_c2_91b6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1097_c2_91b6_cond <= VAR_n16_MUX_uxn_opcodes_h_l1097_c2_91b6_cond;
     n16_MUX_uxn_opcodes_h_l1097_c2_91b6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1097_c2_91b6_iftrue;
     n16_MUX_uxn_opcodes_h_l1097_c2_91b6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1097_c2_91b6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1097_c2_91b6_return_output := n16_MUX_uxn_opcodes_h_l1097_c2_91b6_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1097_c2_91b6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_554b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_d749_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_554b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_d749_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1097_c2_91b6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1102_c7_554b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c2_91b6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1102_c7_554b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1102_c7_554b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1105_c7_d749_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1097_c2_91b6_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1102_c7_554b_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1097_c2_91b6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c2_91b6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c2_91b6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c2_91b6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c2_91b6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c2_91b6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c2_91b6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c2_91b6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c2_91b6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1097_c2_91b6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1097_c2_91b6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1097_c2_91b6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1097_c2_91b6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1097_c2_91b6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1097_c2_91b6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1097_c2_91b6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1097_c2_91b6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1097_c2_91b6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1102_c7_554b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_554b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_554b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_554b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_554b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_554b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_554b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_554b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_554b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1102_c7_554b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_554b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_554b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_554b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_554b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_554b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_554b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_554b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_554b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1097_c2_91b6] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1097_c2_91b6_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1097_c2_91b6_cond;
     tmp16_MUX_uxn_opcodes_h_l1097_c2_91b6_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1097_c2_91b6_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1097_c2_91b6_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1097_c2_91b6_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1097_c2_91b6_return_output := tmp16_MUX_uxn_opcodes_h_l1097_c2_91b6_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1102_c7_554b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1102_c7_554b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1102_c7_554b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1102_c7_554b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1102_c7_554b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1102_c7_554b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1102_c7_554b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1102_c7_554b_return_output := result_stack_value_MUX_uxn_opcodes_h_l1102_c7_554b_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1097_c2_91b6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_554b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1097_c2_91b6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_554b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1097_c2_91b6_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1102_c7_554b_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1097_c2_91b6_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1097_c2_91b6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1097_c2_91b6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1097_c2_91b6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1097_c2_91b6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1097_c2_91b6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1097_c2_91b6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1097_c2_91b6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1097_c2_91b6_return_output := result_stack_value_MUX_uxn_opcodes_h_l1097_c2_91b6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1097_c2_91b6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1097_c2_91b6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1097_c2_91b6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1097_c2_91b6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1097_c2_91b6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1097_c2_91b6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1097_c2_91b6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1097_c2_91b6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1097_c2_91b6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1097_c2_91b6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1097_c2_91b6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1097_c2_91b6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1097_c2_91b6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1097_c2_91b6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1097_c2_91b6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1097_c2_91b6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1097_c2_91b6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1097_c2_91b6_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l1093_l1149_DUPLICATE_4cee LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l1093_l1149_DUPLICATE_4cee_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_09c5(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1097_c2_91b6_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c2_91b6_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c2_91b6_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1097_c2_91b6_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1097_c2_91b6_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1097_c2_91b6_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l1093_l1149_DUPLICATE_4cee_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l1093_l1149_DUPLICATE_4cee_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
