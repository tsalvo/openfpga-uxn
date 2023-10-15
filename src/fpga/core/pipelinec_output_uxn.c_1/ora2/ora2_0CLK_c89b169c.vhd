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
-- -- use ieee.float_pkg.all;
use work.c_structs_pkg.all;
-- Submodules: 112
entity ora2_0CLK_c89b169c is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ora2_0CLK_c89b169c;
architecture arch of ora2_0CLK_c89b169c is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1097_c6_2554]
signal BIN_OP_EQ_uxn_opcodes_h_l1097_c6_2554_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1097_c6_2554_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1097_c6_2554_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1097_c2_9688]
signal t16_MUX_uxn_opcodes_h_l1097_c2_9688_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1097_c2_9688_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1097_c2_9688_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1097_c2_9688_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1097_c2_9688]
signal tmp16_MUX_uxn_opcodes_h_l1097_c2_9688_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1097_c2_9688_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1097_c2_9688_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1097_c2_9688_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1097_c2_9688]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1097_c2_9688_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1097_c2_9688_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1097_c2_9688_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1097_c2_9688_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1097_c2_9688]
signal result_stack_value_MUX_uxn_opcodes_h_l1097_c2_9688_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1097_c2_9688_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1097_c2_9688_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1097_c2_9688_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1097_c2_9688]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c2_9688_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c2_9688_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c2_9688_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c2_9688_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1097_c2_9688]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c2_9688_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c2_9688_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c2_9688_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c2_9688_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1097_c2_9688]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1097_c2_9688_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1097_c2_9688_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1097_c2_9688_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1097_c2_9688_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1097_c2_9688]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1097_c2_9688_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1097_c2_9688_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1097_c2_9688_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1097_c2_9688_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1097_c2_9688]
signal n16_MUX_uxn_opcodes_h_l1097_c2_9688_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1097_c2_9688_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1097_c2_9688_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1097_c2_9688_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1102_c11_0297]
signal BIN_OP_EQ_uxn_opcodes_h_l1102_c11_0297_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1102_c11_0297_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1102_c11_0297_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1102_c7_c596]
signal t16_MUX_uxn_opcodes_h_l1102_c7_c596_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1102_c7_c596_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1102_c7_c596_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1102_c7_c596_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1102_c7_c596]
signal tmp16_MUX_uxn_opcodes_h_l1102_c7_c596_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1102_c7_c596_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1102_c7_c596_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1102_c7_c596_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1102_c7_c596]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1102_c7_c596_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1102_c7_c596_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1102_c7_c596_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1102_c7_c596_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1102_c7_c596]
signal result_stack_value_MUX_uxn_opcodes_h_l1102_c7_c596_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1102_c7_c596_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1102_c7_c596_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1102_c7_c596_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1102_c7_c596]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1102_c7_c596_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1102_c7_c596_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1102_c7_c596_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1102_c7_c596_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1102_c7_c596]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1102_c7_c596_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1102_c7_c596_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1102_c7_c596_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1102_c7_c596_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1102_c7_c596]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_c596_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_c596_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_c596_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_c596_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1102_c7_c596]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_c596_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_c596_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_c596_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_c596_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1102_c7_c596]
signal n16_MUX_uxn_opcodes_h_l1102_c7_c596_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1102_c7_c596_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1102_c7_c596_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1102_c7_c596_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1105_c11_7b34]
signal BIN_OP_EQ_uxn_opcodes_h_l1105_c11_7b34_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1105_c11_7b34_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1105_c11_7b34_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1105_c7_f06a]
signal t16_MUX_uxn_opcodes_h_l1105_c7_f06a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1105_c7_f06a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1105_c7_f06a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1105_c7_f06a_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1105_c7_f06a]
signal tmp16_MUX_uxn_opcodes_h_l1105_c7_f06a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1105_c7_f06a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1105_c7_f06a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1105_c7_f06a_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1105_c7_f06a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1105_c7_f06a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1105_c7_f06a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1105_c7_f06a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1105_c7_f06a_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1105_c7_f06a]
signal result_stack_value_MUX_uxn_opcodes_h_l1105_c7_f06a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1105_c7_f06a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1105_c7_f06a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1105_c7_f06a_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1105_c7_f06a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_f06a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_f06a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_f06a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_f06a_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1105_c7_f06a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1105_c7_f06a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1105_c7_f06a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1105_c7_f06a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1105_c7_f06a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1105_c7_f06a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_f06a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_f06a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_f06a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_f06a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1105_c7_f06a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_f06a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_f06a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_f06a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_f06a_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1105_c7_f06a]
signal n16_MUX_uxn_opcodes_h_l1105_c7_f06a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1105_c7_f06a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1105_c7_f06a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1105_c7_f06a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1110_c11_2510]
signal BIN_OP_EQ_uxn_opcodes_h_l1110_c11_2510_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1110_c11_2510_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1110_c11_2510_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1110_c7_094a]
signal t16_MUX_uxn_opcodes_h_l1110_c7_094a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1110_c7_094a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1110_c7_094a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1110_c7_094a_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1110_c7_094a]
signal tmp16_MUX_uxn_opcodes_h_l1110_c7_094a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1110_c7_094a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1110_c7_094a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1110_c7_094a_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1110_c7_094a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_094a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_094a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_094a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_094a_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1110_c7_094a]
signal result_stack_value_MUX_uxn_opcodes_h_l1110_c7_094a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1110_c7_094a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1110_c7_094a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1110_c7_094a_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1110_c7_094a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_094a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_094a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_094a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_094a_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1110_c7_094a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1110_c7_094a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1110_c7_094a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1110_c7_094a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1110_c7_094a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1110_c7_094a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_094a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_094a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_094a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_094a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1110_c7_094a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_094a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_094a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_094a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_094a_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1110_c7_094a]
signal n16_MUX_uxn_opcodes_h_l1110_c7_094a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1110_c7_094a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1110_c7_094a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1110_c7_094a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1113_c11_7dde]
signal BIN_OP_EQ_uxn_opcodes_h_l1113_c11_7dde_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1113_c11_7dde_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1113_c11_7dde_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1113_c7_1e0c]
signal t16_MUX_uxn_opcodes_h_l1113_c7_1e0c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1113_c7_1e0c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1113_c7_1e0c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1113_c7_1e0c_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1113_c7_1e0c]
signal tmp16_MUX_uxn_opcodes_h_l1113_c7_1e0c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1113_c7_1e0c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1113_c7_1e0c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1113_c7_1e0c_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1113_c7_1e0c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_1e0c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_1e0c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_1e0c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_1e0c_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1113_c7_1e0c]
signal result_stack_value_MUX_uxn_opcodes_h_l1113_c7_1e0c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1113_c7_1e0c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1113_c7_1e0c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1113_c7_1e0c_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1113_c7_1e0c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_1e0c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_1e0c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_1e0c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_1e0c_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1113_c7_1e0c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_1e0c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_1e0c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_1e0c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_1e0c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1113_c7_1e0c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_1e0c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_1e0c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_1e0c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_1e0c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1113_c7_1e0c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_1e0c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_1e0c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_1e0c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_1e0c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1113_c7_1e0c]
signal n16_MUX_uxn_opcodes_h_l1113_c7_1e0c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1113_c7_1e0c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1113_c7_1e0c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1113_c7_1e0c_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1114_c3_54c7]
signal BIN_OP_OR_uxn_opcodes_h_l1114_c3_54c7_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1114_c3_54c7_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1114_c3_54c7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1117_c11_de31]
signal BIN_OP_EQ_uxn_opcodes_h_l1117_c11_de31_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1117_c11_de31_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1117_c11_de31_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1117_c7_b9b6]
signal tmp16_MUX_uxn_opcodes_h_l1117_c7_b9b6_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1117_c7_b9b6_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1117_c7_b9b6_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1117_c7_b9b6_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1117_c7_b9b6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1117_c7_b9b6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1117_c7_b9b6_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1117_c7_b9b6_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1117_c7_b9b6_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1117_c7_b9b6]
signal result_stack_value_MUX_uxn_opcodes_h_l1117_c7_b9b6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1117_c7_b9b6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1117_c7_b9b6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1117_c7_b9b6_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1117_c7_b9b6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_b9b6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_b9b6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_b9b6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_b9b6_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1117_c7_b9b6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1117_c7_b9b6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1117_c7_b9b6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1117_c7_b9b6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1117_c7_b9b6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1117_c7_b9b6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_b9b6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_b9b6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_b9b6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_b9b6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1117_c7_b9b6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_b9b6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_b9b6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_b9b6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_b9b6_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1117_c7_b9b6]
signal n16_MUX_uxn_opcodes_h_l1117_c7_b9b6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1117_c7_b9b6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1117_c7_b9b6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1117_c7_b9b6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1120_c11_ca15]
signal BIN_OP_EQ_uxn_opcodes_h_l1120_c11_ca15_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1120_c11_ca15_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1120_c11_ca15_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1120_c7_7e8f]
signal tmp16_MUX_uxn_opcodes_h_l1120_c7_7e8f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1120_c7_7e8f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1120_c7_7e8f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1120_c7_7e8f_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1120_c7_7e8f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1120_c7_7e8f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1120_c7_7e8f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1120_c7_7e8f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1120_c7_7e8f_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1120_c7_7e8f]
signal result_stack_value_MUX_uxn_opcodes_h_l1120_c7_7e8f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1120_c7_7e8f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1120_c7_7e8f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1120_c7_7e8f_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1120_c7_7e8f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1120_c7_7e8f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1120_c7_7e8f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1120_c7_7e8f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1120_c7_7e8f_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1120_c7_7e8f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1120_c7_7e8f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1120_c7_7e8f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1120_c7_7e8f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1120_c7_7e8f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1120_c7_7e8f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_7e8f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_7e8f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_7e8f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_7e8f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1120_c7_7e8f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_7e8f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_7e8f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_7e8f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_7e8f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1120_c7_7e8f]
signal n16_MUX_uxn_opcodes_h_l1120_c7_7e8f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1120_c7_7e8f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1120_c7_7e8f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1120_c7_7e8f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1125_c11_1355]
signal BIN_OP_EQ_uxn_opcodes_h_l1125_c11_1355_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1125_c11_1355_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1125_c11_1355_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1125_c7_7e0a]
signal tmp16_MUX_uxn_opcodes_h_l1125_c7_7e0a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1125_c7_7e0a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1125_c7_7e0a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1125_c7_7e0a_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1125_c7_7e0a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_7e0a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_7e0a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_7e0a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_7e0a_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1125_c7_7e0a]
signal result_stack_value_MUX_uxn_opcodes_h_l1125_c7_7e0a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1125_c7_7e0a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1125_c7_7e0a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1125_c7_7e0a_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1125_c7_7e0a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_7e0a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_7e0a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_7e0a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_7e0a_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1125_c7_7e0a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1125_c7_7e0a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1125_c7_7e0a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1125_c7_7e0a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1125_c7_7e0a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1125_c7_7e0a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_7e0a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_7e0a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_7e0a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_7e0a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1125_c7_7e0a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_7e0a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_7e0a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_7e0a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_7e0a_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1125_c7_7e0a]
signal n16_MUX_uxn_opcodes_h_l1125_c7_7e0a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1125_c7_7e0a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1125_c7_7e0a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1125_c7_7e0a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1128_c11_39a5]
signal BIN_OP_EQ_uxn_opcodes_h_l1128_c11_39a5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1128_c11_39a5_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1128_c11_39a5_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1128_c7_072b]
signal tmp16_MUX_uxn_opcodes_h_l1128_c7_072b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1128_c7_072b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1128_c7_072b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1128_c7_072b_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1128_c7_072b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_072b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_072b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_072b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_072b_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1128_c7_072b]
signal result_stack_value_MUX_uxn_opcodes_h_l1128_c7_072b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1128_c7_072b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1128_c7_072b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1128_c7_072b_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1128_c7_072b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_072b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_072b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_072b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_072b_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1128_c7_072b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1128_c7_072b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1128_c7_072b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1128_c7_072b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1128_c7_072b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1128_c7_072b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_072b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_072b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_072b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_072b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1128_c7_072b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_072b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_072b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_072b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_072b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1128_c7_072b]
signal n16_MUX_uxn_opcodes_h_l1128_c7_072b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1128_c7_072b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1128_c7_072b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1128_c7_072b_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1129_c3_e666]
signal BIN_OP_OR_uxn_opcodes_h_l1129_c3_e666_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1129_c3_e666_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1129_c3_e666_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1130_c11_bcb9]
signal BIN_OP_OR_uxn_opcodes_h_l1130_c11_bcb9_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1130_c11_bcb9_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1130_c11_bcb9_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1132_c32_a0f4]
signal BIN_OP_AND_uxn_opcodes_h_l1132_c32_a0f4_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1132_c32_a0f4_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1132_c32_a0f4_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1132_c32_7be4]
signal BIN_OP_GT_uxn_opcodes_h_l1132_c32_7be4_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1132_c32_7be4_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1132_c32_7be4_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1132_c32_f00a]
signal MUX_uxn_opcodes_h_l1132_c32_f00a_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1132_c32_f00a_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1132_c32_f00a_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1132_c32_f00a_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1134_c11_d329]
signal BIN_OP_EQ_uxn_opcodes_h_l1134_c11_d329_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1134_c11_d329_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1134_c11_d329_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1134_c7_fb6e]
signal result_stack_value_MUX_uxn_opcodes_h_l1134_c7_fb6e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1134_c7_fb6e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1134_c7_fb6e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1134_c7_fb6e_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1134_c7_fb6e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c7_fb6e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c7_fb6e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c7_fb6e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c7_fb6e_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1134_c7_fb6e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1134_c7_fb6e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1134_c7_fb6e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1134_c7_fb6e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1134_c7_fb6e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1134_c7_fb6e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1134_c7_fb6e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1134_c7_fb6e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1134_c7_fb6e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1134_c7_fb6e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1134_c7_fb6e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1134_c7_fb6e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1134_c7_fb6e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1134_c7_fb6e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1134_c7_fb6e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1140_c11_f05d]
signal BIN_OP_EQ_uxn_opcodes_h_l1140_c11_f05d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1140_c11_f05d_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1140_c11_f05d_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1140_c7_b8a8]
signal result_stack_value_MUX_uxn_opcodes_h_l1140_c7_b8a8_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1140_c7_b8a8_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1140_c7_b8a8_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1140_c7_b8a8_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1140_c7_b8a8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_b8a8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_b8a8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_b8a8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_b8a8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1140_c7_b8a8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_b8a8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_b8a8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_b8a8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_b8a8_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1140_c7_b8a8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_b8a8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_b8a8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_b8a8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_b8a8_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1142_c34_371c]
signal CONST_SR_8_uxn_opcodes_h_l1142_c34_371c_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1142_c34_371c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1144_c11_0a8a]
signal BIN_OP_EQ_uxn_opcodes_h_l1144_c11_0a8a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1144_c11_0a8a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1144_c11_0a8a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1144_c7_e7e2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_e7e2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_e7e2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_e7e2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_e7e2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1144_c7_e7e2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_e7e2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_e7e2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_e7e2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_e7e2_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1107_l1122_DUPLICATE_da55
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1107_l1122_DUPLICATE_da55_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1107_l1122_DUPLICATE_da55_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5( ref_toks_0 : opcode_result_t;
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
      base.stack_value := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.is_opc_done := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1097_c6_2554
BIN_OP_EQ_uxn_opcodes_h_l1097_c6_2554 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1097_c6_2554_left,
BIN_OP_EQ_uxn_opcodes_h_l1097_c6_2554_right,
BIN_OP_EQ_uxn_opcodes_h_l1097_c6_2554_return_output);

-- t16_MUX_uxn_opcodes_h_l1097_c2_9688
t16_MUX_uxn_opcodes_h_l1097_c2_9688 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1097_c2_9688_cond,
t16_MUX_uxn_opcodes_h_l1097_c2_9688_iftrue,
t16_MUX_uxn_opcodes_h_l1097_c2_9688_iffalse,
t16_MUX_uxn_opcodes_h_l1097_c2_9688_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1097_c2_9688
tmp16_MUX_uxn_opcodes_h_l1097_c2_9688 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1097_c2_9688_cond,
tmp16_MUX_uxn_opcodes_h_l1097_c2_9688_iftrue,
tmp16_MUX_uxn_opcodes_h_l1097_c2_9688_iffalse,
tmp16_MUX_uxn_opcodes_h_l1097_c2_9688_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1097_c2_9688
result_sp_relative_shift_MUX_uxn_opcodes_h_l1097_c2_9688 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1097_c2_9688_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1097_c2_9688_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1097_c2_9688_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1097_c2_9688_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1097_c2_9688
result_stack_value_MUX_uxn_opcodes_h_l1097_c2_9688 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1097_c2_9688_cond,
result_stack_value_MUX_uxn_opcodes_h_l1097_c2_9688_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1097_c2_9688_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1097_c2_9688_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c2_9688
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c2_9688 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c2_9688_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c2_9688_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c2_9688_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c2_9688_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c2_9688
result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c2_9688 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c2_9688_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c2_9688_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c2_9688_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c2_9688_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1097_c2_9688
result_is_stack_write_MUX_uxn_opcodes_h_l1097_c2_9688 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1097_c2_9688_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1097_c2_9688_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1097_c2_9688_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1097_c2_9688_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1097_c2_9688
result_is_opc_done_MUX_uxn_opcodes_h_l1097_c2_9688 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1097_c2_9688_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1097_c2_9688_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1097_c2_9688_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1097_c2_9688_return_output);

-- n16_MUX_uxn_opcodes_h_l1097_c2_9688
n16_MUX_uxn_opcodes_h_l1097_c2_9688 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1097_c2_9688_cond,
n16_MUX_uxn_opcodes_h_l1097_c2_9688_iftrue,
n16_MUX_uxn_opcodes_h_l1097_c2_9688_iffalse,
n16_MUX_uxn_opcodes_h_l1097_c2_9688_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1102_c11_0297
BIN_OP_EQ_uxn_opcodes_h_l1102_c11_0297 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1102_c11_0297_left,
BIN_OP_EQ_uxn_opcodes_h_l1102_c11_0297_right,
BIN_OP_EQ_uxn_opcodes_h_l1102_c11_0297_return_output);

-- t16_MUX_uxn_opcodes_h_l1102_c7_c596
t16_MUX_uxn_opcodes_h_l1102_c7_c596 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1102_c7_c596_cond,
t16_MUX_uxn_opcodes_h_l1102_c7_c596_iftrue,
t16_MUX_uxn_opcodes_h_l1102_c7_c596_iffalse,
t16_MUX_uxn_opcodes_h_l1102_c7_c596_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1102_c7_c596
tmp16_MUX_uxn_opcodes_h_l1102_c7_c596 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1102_c7_c596_cond,
tmp16_MUX_uxn_opcodes_h_l1102_c7_c596_iftrue,
tmp16_MUX_uxn_opcodes_h_l1102_c7_c596_iffalse,
tmp16_MUX_uxn_opcodes_h_l1102_c7_c596_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1102_c7_c596
result_sp_relative_shift_MUX_uxn_opcodes_h_l1102_c7_c596 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1102_c7_c596_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1102_c7_c596_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1102_c7_c596_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1102_c7_c596_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1102_c7_c596
result_stack_value_MUX_uxn_opcodes_h_l1102_c7_c596 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1102_c7_c596_cond,
result_stack_value_MUX_uxn_opcodes_h_l1102_c7_c596_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1102_c7_c596_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1102_c7_c596_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1102_c7_c596
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1102_c7_c596 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1102_c7_c596_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1102_c7_c596_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1102_c7_c596_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1102_c7_c596_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1102_c7_c596
result_is_sp_shift_MUX_uxn_opcodes_h_l1102_c7_c596 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1102_c7_c596_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1102_c7_c596_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1102_c7_c596_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1102_c7_c596_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_c596
result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_c596 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_c596_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_c596_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_c596_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_c596_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_c596
result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_c596 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_c596_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_c596_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_c596_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_c596_return_output);

-- n16_MUX_uxn_opcodes_h_l1102_c7_c596
n16_MUX_uxn_opcodes_h_l1102_c7_c596 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1102_c7_c596_cond,
n16_MUX_uxn_opcodes_h_l1102_c7_c596_iftrue,
n16_MUX_uxn_opcodes_h_l1102_c7_c596_iffalse,
n16_MUX_uxn_opcodes_h_l1102_c7_c596_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1105_c11_7b34
BIN_OP_EQ_uxn_opcodes_h_l1105_c11_7b34 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1105_c11_7b34_left,
BIN_OP_EQ_uxn_opcodes_h_l1105_c11_7b34_right,
BIN_OP_EQ_uxn_opcodes_h_l1105_c11_7b34_return_output);

-- t16_MUX_uxn_opcodes_h_l1105_c7_f06a
t16_MUX_uxn_opcodes_h_l1105_c7_f06a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1105_c7_f06a_cond,
t16_MUX_uxn_opcodes_h_l1105_c7_f06a_iftrue,
t16_MUX_uxn_opcodes_h_l1105_c7_f06a_iffalse,
t16_MUX_uxn_opcodes_h_l1105_c7_f06a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1105_c7_f06a
tmp16_MUX_uxn_opcodes_h_l1105_c7_f06a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1105_c7_f06a_cond,
tmp16_MUX_uxn_opcodes_h_l1105_c7_f06a_iftrue,
tmp16_MUX_uxn_opcodes_h_l1105_c7_f06a_iffalse,
tmp16_MUX_uxn_opcodes_h_l1105_c7_f06a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1105_c7_f06a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1105_c7_f06a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1105_c7_f06a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1105_c7_f06a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1105_c7_f06a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1105_c7_f06a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1105_c7_f06a
result_stack_value_MUX_uxn_opcodes_h_l1105_c7_f06a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1105_c7_f06a_cond,
result_stack_value_MUX_uxn_opcodes_h_l1105_c7_f06a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1105_c7_f06a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1105_c7_f06a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_f06a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_f06a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_f06a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_f06a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_f06a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_f06a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1105_c7_f06a
result_is_sp_shift_MUX_uxn_opcodes_h_l1105_c7_f06a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1105_c7_f06a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1105_c7_f06a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1105_c7_f06a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1105_c7_f06a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_f06a
result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_f06a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_f06a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_f06a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_f06a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_f06a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_f06a
result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_f06a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_f06a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_f06a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_f06a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_f06a_return_output);

-- n16_MUX_uxn_opcodes_h_l1105_c7_f06a
n16_MUX_uxn_opcodes_h_l1105_c7_f06a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1105_c7_f06a_cond,
n16_MUX_uxn_opcodes_h_l1105_c7_f06a_iftrue,
n16_MUX_uxn_opcodes_h_l1105_c7_f06a_iffalse,
n16_MUX_uxn_opcodes_h_l1105_c7_f06a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1110_c11_2510
BIN_OP_EQ_uxn_opcodes_h_l1110_c11_2510 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1110_c11_2510_left,
BIN_OP_EQ_uxn_opcodes_h_l1110_c11_2510_right,
BIN_OP_EQ_uxn_opcodes_h_l1110_c11_2510_return_output);

-- t16_MUX_uxn_opcodes_h_l1110_c7_094a
t16_MUX_uxn_opcodes_h_l1110_c7_094a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1110_c7_094a_cond,
t16_MUX_uxn_opcodes_h_l1110_c7_094a_iftrue,
t16_MUX_uxn_opcodes_h_l1110_c7_094a_iffalse,
t16_MUX_uxn_opcodes_h_l1110_c7_094a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1110_c7_094a
tmp16_MUX_uxn_opcodes_h_l1110_c7_094a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1110_c7_094a_cond,
tmp16_MUX_uxn_opcodes_h_l1110_c7_094a_iftrue,
tmp16_MUX_uxn_opcodes_h_l1110_c7_094a_iffalse,
tmp16_MUX_uxn_opcodes_h_l1110_c7_094a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_094a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_094a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_094a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_094a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_094a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_094a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1110_c7_094a
result_stack_value_MUX_uxn_opcodes_h_l1110_c7_094a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1110_c7_094a_cond,
result_stack_value_MUX_uxn_opcodes_h_l1110_c7_094a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1110_c7_094a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1110_c7_094a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_094a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_094a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_094a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_094a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_094a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_094a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1110_c7_094a
result_is_sp_shift_MUX_uxn_opcodes_h_l1110_c7_094a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1110_c7_094a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1110_c7_094a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1110_c7_094a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1110_c7_094a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_094a
result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_094a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_094a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_094a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_094a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_094a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_094a
result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_094a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_094a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_094a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_094a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_094a_return_output);

-- n16_MUX_uxn_opcodes_h_l1110_c7_094a
n16_MUX_uxn_opcodes_h_l1110_c7_094a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1110_c7_094a_cond,
n16_MUX_uxn_opcodes_h_l1110_c7_094a_iftrue,
n16_MUX_uxn_opcodes_h_l1110_c7_094a_iffalse,
n16_MUX_uxn_opcodes_h_l1110_c7_094a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1113_c11_7dde
BIN_OP_EQ_uxn_opcodes_h_l1113_c11_7dde : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1113_c11_7dde_left,
BIN_OP_EQ_uxn_opcodes_h_l1113_c11_7dde_right,
BIN_OP_EQ_uxn_opcodes_h_l1113_c11_7dde_return_output);

-- t16_MUX_uxn_opcodes_h_l1113_c7_1e0c
t16_MUX_uxn_opcodes_h_l1113_c7_1e0c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1113_c7_1e0c_cond,
t16_MUX_uxn_opcodes_h_l1113_c7_1e0c_iftrue,
t16_MUX_uxn_opcodes_h_l1113_c7_1e0c_iffalse,
t16_MUX_uxn_opcodes_h_l1113_c7_1e0c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1113_c7_1e0c
tmp16_MUX_uxn_opcodes_h_l1113_c7_1e0c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1113_c7_1e0c_cond,
tmp16_MUX_uxn_opcodes_h_l1113_c7_1e0c_iftrue,
tmp16_MUX_uxn_opcodes_h_l1113_c7_1e0c_iffalse,
tmp16_MUX_uxn_opcodes_h_l1113_c7_1e0c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_1e0c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_1e0c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_1e0c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_1e0c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_1e0c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_1e0c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1113_c7_1e0c
result_stack_value_MUX_uxn_opcodes_h_l1113_c7_1e0c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1113_c7_1e0c_cond,
result_stack_value_MUX_uxn_opcodes_h_l1113_c7_1e0c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1113_c7_1e0c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1113_c7_1e0c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_1e0c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_1e0c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_1e0c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_1e0c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_1e0c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_1e0c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_1e0c
result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_1e0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_1e0c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_1e0c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_1e0c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_1e0c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_1e0c
result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_1e0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_1e0c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_1e0c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_1e0c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_1e0c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_1e0c
result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_1e0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_1e0c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_1e0c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_1e0c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_1e0c_return_output);

-- n16_MUX_uxn_opcodes_h_l1113_c7_1e0c
n16_MUX_uxn_opcodes_h_l1113_c7_1e0c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1113_c7_1e0c_cond,
n16_MUX_uxn_opcodes_h_l1113_c7_1e0c_iftrue,
n16_MUX_uxn_opcodes_h_l1113_c7_1e0c_iffalse,
n16_MUX_uxn_opcodes_h_l1113_c7_1e0c_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1114_c3_54c7
BIN_OP_OR_uxn_opcodes_h_l1114_c3_54c7 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1114_c3_54c7_left,
BIN_OP_OR_uxn_opcodes_h_l1114_c3_54c7_right,
BIN_OP_OR_uxn_opcodes_h_l1114_c3_54c7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1117_c11_de31
BIN_OP_EQ_uxn_opcodes_h_l1117_c11_de31 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1117_c11_de31_left,
BIN_OP_EQ_uxn_opcodes_h_l1117_c11_de31_right,
BIN_OP_EQ_uxn_opcodes_h_l1117_c11_de31_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1117_c7_b9b6
tmp16_MUX_uxn_opcodes_h_l1117_c7_b9b6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1117_c7_b9b6_cond,
tmp16_MUX_uxn_opcodes_h_l1117_c7_b9b6_iftrue,
tmp16_MUX_uxn_opcodes_h_l1117_c7_b9b6_iffalse,
tmp16_MUX_uxn_opcodes_h_l1117_c7_b9b6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1117_c7_b9b6
result_sp_relative_shift_MUX_uxn_opcodes_h_l1117_c7_b9b6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1117_c7_b9b6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1117_c7_b9b6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1117_c7_b9b6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1117_c7_b9b6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1117_c7_b9b6
result_stack_value_MUX_uxn_opcodes_h_l1117_c7_b9b6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1117_c7_b9b6_cond,
result_stack_value_MUX_uxn_opcodes_h_l1117_c7_b9b6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1117_c7_b9b6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1117_c7_b9b6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_b9b6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_b9b6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_b9b6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_b9b6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_b9b6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_b9b6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1117_c7_b9b6
result_is_sp_shift_MUX_uxn_opcodes_h_l1117_c7_b9b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1117_c7_b9b6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1117_c7_b9b6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1117_c7_b9b6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1117_c7_b9b6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_b9b6
result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_b9b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_b9b6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_b9b6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_b9b6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_b9b6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_b9b6
result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_b9b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_b9b6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_b9b6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_b9b6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_b9b6_return_output);

-- n16_MUX_uxn_opcodes_h_l1117_c7_b9b6
n16_MUX_uxn_opcodes_h_l1117_c7_b9b6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1117_c7_b9b6_cond,
n16_MUX_uxn_opcodes_h_l1117_c7_b9b6_iftrue,
n16_MUX_uxn_opcodes_h_l1117_c7_b9b6_iffalse,
n16_MUX_uxn_opcodes_h_l1117_c7_b9b6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1120_c11_ca15
BIN_OP_EQ_uxn_opcodes_h_l1120_c11_ca15 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1120_c11_ca15_left,
BIN_OP_EQ_uxn_opcodes_h_l1120_c11_ca15_right,
BIN_OP_EQ_uxn_opcodes_h_l1120_c11_ca15_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1120_c7_7e8f
tmp16_MUX_uxn_opcodes_h_l1120_c7_7e8f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1120_c7_7e8f_cond,
tmp16_MUX_uxn_opcodes_h_l1120_c7_7e8f_iftrue,
tmp16_MUX_uxn_opcodes_h_l1120_c7_7e8f_iffalse,
tmp16_MUX_uxn_opcodes_h_l1120_c7_7e8f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1120_c7_7e8f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1120_c7_7e8f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1120_c7_7e8f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1120_c7_7e8f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1120_c7_7e8f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1120_c7_7e8f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1120_c7_7e8f
result_stack_value_MUX_uxn_opcodes_h_l1120_c7_7e8f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1120_c7_7e8f_cond,
result_stack_value_MUX_uxn_opcodes_h_l1120_c7_7e8f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1120_c7_7e8f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1120_c7_7e8f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1120_c7_7e8f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1120_c7_7e8f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1120_c7_7e8f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1120_c7_7e8f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1120_c7_7e8f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1120_c7_7e8f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1120_c7_7e8f
result_is_sp_shift_MUX_uxn_opcodes_h_l1120_c7_7e8f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1120_c7_7e8f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1120_c7_7e8f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1120_c7_7e8f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1120_c7_7e8f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_7e8f
result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_7e8f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_7e8f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_7e8f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_7e8f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_7e8f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_7e8f
result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_7e8f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_7e8f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_7e8f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_7e8f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_7e8f_return_output);

-- n16_MUX_uxn_opcodes_h_l1120_c7_7e8f
n16_MUX_uxn_opcodes_h_l1120_c7_7e8f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1120_c7_7e8f_cond,
n16_MUX_uxn_opcodes_h_l1120_c7_7e8f_iftrue,
n16_MUX_uxn_opcodes_h_l1120_c7_7e8f_iffalse,
n16_MUX_uxn_opcodes_h_l1120_c7_7e8f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1125_c11_1355
BIN_OP_EQ_uxn_opcodes_h_l1125_c11_1355 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1125_c11_1355_left,
BIN_OP_EQ_uxn_opcodes_h_l1125_c11_1355_right,
BIN_OP_EQ_uxn_opcodes_h_l1125_c11_1355_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1125_c7_7e0a
tmp16_MUX_uxn_opcodes_h_l1125_c7_7e0a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1125_c7_7e0a_cond,
tmp16_MUX_uxn_opcodes_h_l1125_c7_7e0a_iftrue,
tmp16_MUX_uxn_opcodes_h_l1125_c7_7e0a_iffalse,
tmp16_MUX_uxn_opcodes_h_l1125_c7_7e0a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_7e0a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_7e0a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_7e0a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_7e0a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_7e0a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_7e0a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1125_c7_7e0a
result_stack_value_MUX_uxn_opcodes_h_l1125_c7_7e0a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1125_c7_7e0a_cond,
result_stack_value_MUX_uxn_opcodes_h_l1125_c7_7e0a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1125_c7_7e0a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1125_c7_7e0a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_7e0a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_7e0a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_7e0a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_7e0a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_7e0a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_7e0a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1125_c7_7e0a
result_is_sp_shift_MUX_uxn_opcodes_h_l1125_c7_7e0a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1125_c7_7e0a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1125_c7_7e0a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1125_c7_7e0a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1125_c7_7e0a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_7e0a
result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_7e0a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_7e0a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_7e0a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_7e0a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_7e0a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_7e0a
result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_7e0a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_7e0a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_7e0a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_7e0a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_7e0a_return_output);

-- n16_MUX_uxn_opcodes_h_l1125_c7_7e0a
n16_MUX_uxn_opcodes_h_l1125_c7_7e0a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1125_c7_7e0a_cond,
n16_MUX_uxn_opcodes_h_l1125_c7_7e0a_iftrue,
n16_MUX_uxn_opcodes_h_l1125_c7_7e0a_iffalse,
n16_MUX_uxn_opcodes_h_l1125_c7_7e0a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1128_c11_39a5
BIN_OP_EQ_uxn_opcodes_h_l1128_c11_39a5 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1128_c11_39a5_left,
BIN_OP_EQ_uxn_opcodes_h_l1128_c11_39a5_right,
BIN_OP_EQ_uxn_opcodes_h_l1128_c11_39a5_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1128_c7_072b
tmp16_MUX_uxn_opcodes_h_l1128_c7_072b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1128_c7_072b_cond,
tmp16_MUX_uxn_opcodes_h_l1128_c7_072b_iftrue,
tmp16_MUX_uxn_opcodes_h_l1128_c7_072b_iffalse,
tmp16_MUX_uxn_opcodes_h_l1128_c7_072b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_072b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_072b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_072b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_072b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_072b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_072b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1128_c7_072b
result_stack_value_MUX_uxn_opcodes_h_l1128_c7_072b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1128_c7_072b_cond,
result_stack_value_MUX_uxn_opcodes_h_l1128_c7_072b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1128_c7_072b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1128_c7_072b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_072b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_072b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_072b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_072b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_072b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_072b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1128_c7_072b
result_is_sp_shift_MUX_uxn_opcodes_h_l1128_c7_072b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1128_c7_072b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1128_c7_072b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1128_c7_072b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1128_c7_072b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_072b
result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_072b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_072b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_072b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_072b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_072b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_072b
result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_072b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_072b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_072b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_072b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_072b_return_output);

-- n16_MUX_uxn_opcodes_h_l1128_c7_072b
n16_MUX_uxn_opcodes_h_l1128_c7_072b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1128_c7_072b_cond,
n16_MUX_uxn_opcodes_h_l1128_c7_072b_iftrue,
n16_MUX_uxn_opcodes_h_l1128_c7_072b_iffalse,
n16_MUX_uxn_opcodes_h_l1128_c7_072b_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1129_c3_e666
BIN_OP_OR_uxn_opcodes_h_l1129_c3_e666 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1129_c3_e666_left,
BIN_OP_OR_uxn_opcodes_h_l1129_c3_e666_right,
BIN_OP_OR_uxn_opcodes_h_l1129_c3_e666_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1130_c11_bcb9
BIN_OP_OR_uxn_opcodes_h_l1130_c11_bcb9 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1130_c11_bcb9_left,
BIN_OP_OR_uxn_opcodes_h_l1130_c11_bcb9_right,
BIN_OP_OR_uxn_opcodes_h_l1130_c11_bcb9_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1132_c32_a0f4
BIN_OP_AND_uxn_opcodes_h_l1132_c32_a0f4 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1132_c32_a0f4_left,
BIN_OP_AND_uxn_opcodes_h_l1132_c32_a0f4_right,
BIN_OP_AND_uxn_opcodes_h_l1132_c32_a0f4_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1132_c32_7be4
BIN_OP_GT_uxn_opcodes_h_l1132_c32_7be4 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1132_c32_7be4_left,
BIN_OP_GT_uxn_opcodes_h_l1132_c32_7be4_right,
BIN_OP_GT_uxn_opcodes_h_l1132_c32_7be4_return_output);

-- MUX_uxn_opcodes_h_l1132_c32_f00a
MUX_uxn_opcodes_h_l1132_c32_f00a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1132_c32_f00a_cond,
MUX_uxn_opcodes_h_l1132_c32_f00a_iftrue,
MUX_uxn_opcodes_h_l1132_c32_f00a_iffalse,
MUX_uxn_opcodes_h_l1132_c32_f00a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1134_c11_d329
BIN_OP_EQ_uxn_opcodes_h_l1134_c11_d329 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1134_c11_d329_left,
BIN_OP_EQ_uxn_opcodes_h_l1134_c11_d329_right,
BIN_OP_EQ_uxn_opcodes_h_l1134_c11_d329_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1134_c7_fb6e
result_stack_value_MUX_uxn_opcodes_h_l1134_c7_fb6e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1134_c7_fb6e_cond,
result_stack_value_MUX_uxn_opcodes_h_l1134_c7_fb6e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1134_c7_fb6e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1134_c7_fb6e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c7_fb6e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c7_fb6e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c7_fb6e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c7_fb6e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c7_fb6e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c7_fb6e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1134_c7_fb6e
result_is_sp_shift_MUX_uxn_opcodes_h_l1134_c7_fb6e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1134_c7_fb6e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1134_c7_fb6e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1134_c7_fb6e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1134_c7_fb6e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1134_c7_fb6e
result_is_stack_write_MUX_uxn_opcodes_h_l1134_c7_fb6e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1134_c7_fb6e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1134_c7_fb6e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1134_c7_fb6e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1134_c7_fb6e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1134_c7_fb6e
result_is_opc_done_MUX_uxn_opcodes_h_l1134_c7_fb6e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1134_c7_fb6e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1134_c7_fb6e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1134_c7_fb6e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1134_c7_fb6e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1140_c11_f05d
BIN_OP_EQ_uxn_opcodes_h_l1140_c11_f05d : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1140_c11_f05d_left,
BIN_OP_EQ_uxn_opcodes_h_l1140_c11_f05d_right,
BIN_OP_EQ_uxn_opcodes_h_l1140_c11_f05d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1140_c7_b8a8
result_stack_value_MUX_uxn_opcodes_h_l1140_c7_b8a8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1140_c7_b8a8_cond,
result_stack_value_MUX_uxn_opcodes_h_l1140_c7_b8a8_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1140_c7_b8a8_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1140_c7_b8a8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_b8a8
result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_b8a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_b8a8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_b8a8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_b8a8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_b8a8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_b8a8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_b8a8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_b8a8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_b8a8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_b8a8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_b8a8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_b8a8
result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_b8a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_b8a8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_b8a8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_b8a8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_b8a8_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1142_c34_371c
CONST_SR_8_uxn_opcodes_h_l1142_c34_371c : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1142_c34_371c_x,
CONST_SR_8_uxn_opcodes_h_l1142_c34_371c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1144_c11_0a8a
BIN_OP_EQ_uxn_opcodes_h_l1144_c11_0a8a : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1144_c11_0a8a_left,
BIN_OP_EQ_uxn_opcodes_h_l1144_c11_0a8a_right,
BIN_OP_EQ_uxn_opcodes_h_l1144_c11_0a8a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_e7e2
result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_e7e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_e7e2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_e7e2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_e7e2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_e7e2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_e7e2
result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_e7e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_e7e2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_e7e2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_e7e2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_e7e2_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1107_l1122_DUPLICATE_da55
CONST_SL_8_uint16_t_uxn_opcodes_h_l1107_l1122_DUPLICATE_da55 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1107_l1122_DUPLICATE_da55_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1107_l1122_DUPLICATE_da55_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1097_c6_2554_return_output,
 t16_MUX_uxn_opcodes_h_l1097_c2_9688_return_output,
 tmp16_MUX_uxn_opcodes_h_l1097_c2_9688_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1097_c2_9688_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1097_c2_9688_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c2_9688_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c2_9688_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1097_c2_9688_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1097_c2_9688_return_output,
 n16_MUX_uxn_opcodes_h_l1097_c2_9688_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1102_c11_0297_return_output,
 t16_MUX_uxn_opcodes_h_l1102_c7_c596_return_output,
 tmp16_MUX_uxn_opcodes_h_l1102_c7_c596_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1102_c7_c596_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1102_c7_c596_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1102_c7_c596_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1102_c7_c596_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_c596_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_c596_return_output,
 n16_MUX_uxn_opcodes_h_l1102_c7_c596_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1105_c11_7b34_return_output,
 t16_MUX_uxn_opcodes_h_l1105_c7_f06a_return_output,
 tmp16_MUX_uxn_opcodes_h_l1105_c7_f06a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1105_c7_f06a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1105_c7_f06a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_f06a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1105_c7_f06a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_f06a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_f06a_return_output,
 n16_MUX_uxn_opcodes_h_l1105_c7_f06a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1110_c11_2510_return_output,
 t16_MUX_uxn_opcodes_h_l1110_c7_094a_return_output,
 tmp16_MUX_uxn_opcodes_h_l1110_c7_094a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_094a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1110_c7_094a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_094a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1110_c7_094a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_094a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_094a_return_output,
 n16_MUX_uxn_opcodes_h_l1110_c7_094a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1113_c11_7dde_return_output,
 t16_MUX_uxn_opcodes_h_l1113_c7_1e0c_return_output,
 tmp16_MUX_uxn_opcodes_h_l1113_c7_1e0c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_1e0c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1113_c7_1e0c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_1e0c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_1e0c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_1e0c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_1e0c_return_output,
 n16_MUX_uxn_opcodes_h_l1113_c7_1e0c_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1114_c3_54c7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1117_c11_de31_return_output,
 tmp16_MUX_uxn_opcodes_h_l1117_c7_b9b6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1117_c7_b9b6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1117_c7_b9b6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_b9b6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1117_c7_b9b6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_b9b6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_b9b6_return_output,
 n16_MUX_uxn_opcodes_h_l1117_c7_b9b6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1120_c11_ca15_return_output,
 tmp16_MUX_uxn_opcodes_h_l1120_c7_7e8f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1120_c7_7e8f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1120_c7_7e8f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1120_c7_7e8f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1120_c7_7e8f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_7e8f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_7e8f_return_output,
 n16_MUX_uxn_opcodes_h_l1120_c7_7e8f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1125_c11_1355_return_output,
 tmp16_MUX_uxn_opcodes_h_l1125_c7_7e0a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_7e0a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1125_c7_7e0a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_7e0a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1125_c7_7e0a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_7e0a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_7e0a_return_output,
 n16_MUX_uxn_opcodes_h_l1125_c7_7e0a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1128_c11_39a5_return_output,
 tmp16_MUX_uxn_opcodes_h_l1128_c7_072b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_072b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1128_c7_072b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_072b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1128_c7_072b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_072b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_072b_return_output,
 n16_MUX_uxn_opcodes_h_l1128_c7_072b_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1129_c3_e666_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1130_c11_bcb9_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1132_c32_a0f4_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1132_c32_7be4_return_output,
 MUX_uxn_opcodes_h_l1132_c32_f00a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1134_c11_d329_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1134_c7_fb6e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c7_fb6e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1134_c7_fb6e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1134_c7_fb6e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1134_c7_fb6e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1140_c11_f05d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1140_c7_b8a8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_b8a8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_b8a8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_b8a8_return_output,
 CONST_SR_8_uxn_opcodes_h_l1142_c34_371c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1144_c11_0a8a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_e7e2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_e7e2_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1107_l1122_DUPLICATE_da55_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c6_2554_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c6_2554_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c6_2554_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1097_c2_9688_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1097_c2_9688_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1102_c7_c596_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1097_c2_9688_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1097_c2_9688_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1097_c2_9688_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1097_c2_9688_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1102_c7_c596_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1097_c2_9688_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1097_c2_9688_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1097_c2_9688_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1097_c2_9688_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1102_c7_c596_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1097_c2_9688_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1097_c2_9688_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1097_c2_9688_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1097_c2_9688_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1102_c7_c596_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1097_c2_9688_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1097_c2_9688_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c2_9688_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1099_c3_ece4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c2_9688_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1102_c7_c596_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c2_9688_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c2_9688_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c2_9688_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c2_9688_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1102_c7_c596_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c2_9688_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c2_9688_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1097_c2_9688_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1097_c2_9688_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_c596_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1097_c2_9688_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1097_c2_9688_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1097_c2_9688_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1097_c2_9688_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_c596_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1097_c2_9688_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1097_c2_9688_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1097_c2_9688_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1097_c2_9688_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1102_c7_c596_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1097_c2_9688_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1097_c2_9688_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1102_c11_0297_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1102_c11_0297_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1102_c11_0297_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1102_c7_c596_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1102_c7_c596_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1105_c7_f06a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1102_c7_c596_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1102_c7_c596_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1102_c7_c596_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1105_c7_f06a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1102_c7_c596_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1102_c7_c596_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1102_c7_c596_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1105_c7_f06a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1102_c7_c596_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1102_c7_c596_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1102_c7_c596_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1105_c7_f06a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1102_c7_c596_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1102_c7_c596_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1103_c3_0bf7 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1102_c7_c596_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_f06a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1102_c7_c596_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1102_c7_c596_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1102_c7_c596_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1105_c7_f06a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1102_c7_c596_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_c596_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_c596_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_f06a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_c596_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_c596_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_c596_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_f06a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_c596_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1102_c7_c596_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1102_c7_c596_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1105_c7_f06a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1102_c7_c596_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1105_c11_7b34_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1105_c11_7b34_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1105_c11_7b34_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1105_c7_f06a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1105_c7_f06a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1110_c7_094a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1105_c7_f06a_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1105_c7_f06a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1105_c7_f06a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1110_c7_094a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1105_c7_f06a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1105_c7_f06a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1105_c7_f06a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_094a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1105_c7_f06a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1105_c7_f06a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1105_c7_f06a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1110_c7_094a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1105_c7_f06a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_f06a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1108_c3_8d8a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_f06a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_094a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_f06a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1105_c7_f06a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1105_c7_f06a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1110_c7_094a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1105_c7_f06a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_f06a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_f06a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_094a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_f06a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_f06a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_f06a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_094a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_f06a_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1105_c7_f06a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1105_c7_f06a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1110_c7_094a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1105_c7_f06a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1110_c11_2510_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1110_c11_2510_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1110_c11_2510_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1110_c7_094a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1110_c7_094a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1113_c7_1e0c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1110_c7_094a_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1110_c7_094a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1110_c7_094a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1113_c7_1e0c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1110_c7_094a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_094a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_094a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_1e0c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_094a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1110_c7_094a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1110_c7_094a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1113_c7_1e0c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1110_c7_094a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_094a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1111_c3_abfd : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_094a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_1e0c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_094a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1110_c7_094a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1110_c7_094a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_1e0c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1110_c7_094a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_094a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_094a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_1e0c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_094a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_094a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_094a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_1e0c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_094a_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1110_c7_094a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1110_c7_094a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1113_c7_1e0c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1110_c7_094a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1113_c11_7dde_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1113_c11_7dde_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1113_c11_7dde_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1113_c7_1e0c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1113_c7_1e0c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1113_c7_1e0c_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1113_c7_1e0c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1113_c7_1e0c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1117_c7_b9b6_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1113_c7_1e0c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_1e0c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_1e0c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1117_c7_b9b6_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_1e0c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1113_c7_1e0c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1113_c7_1e0c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1117_c7_b9b6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1113_c7_1e0c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_1e0c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1115_c3_a2c3 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_1e0c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_b9b6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_1e0c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_1e0c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_1e0c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1117_c7_b9b6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_1e0c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_1e0c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_1e0c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_b9b6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_1e0c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_1e0c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_1e0c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_b9b6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_1e0c_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1113_c7_1e0c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1113_c7_1e0c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1117_c7_b9b6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1113_c7_1e0c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1114_c3_54c7_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1114_c3_54c7_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1114_c3_54c7_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1117_c11_de31_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1117_c11_de31_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1117_c11_de31_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1117_c7_b9b6_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1117_c7_b9b6_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1120_c7_7e8f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1117_c7_b9b6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1117_c7_b9b6_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1117_c7_b9b6_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1120_c7_7e8f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1117_c7_b9b6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1117_c7_b9b6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1117_c7_b9b6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1120_c7_7e8f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1117_c7_b9b6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_b9b6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1118_c3_371f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_b9b6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1120_c7_7e8f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_b9b6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1117_c7_b9b6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1117_c7_b9b6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1120_c7_7e8f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1117_c7_b9b6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_b9b6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_b9b6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_7e8f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_b9b6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_b9b6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_b9b6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_7e8f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_b9b6_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1117_c7_b9b6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1117_c7_b9b6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1120_c7_7e8f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1117_c7_b9b6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1120_c11_ca15_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1120_c11_ca15_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1120_c11_ca15_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1120_c7_7e8f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1120_c7_7e8f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1125_c7_7e0a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1120_c7_7e8f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1120_c7_7e8f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1120_c7_7e8f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_7e0a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1120_c7_7e8f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1120_c7_7e8f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1120_c7_7e8f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1125_c7_7e0a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1120_c7_7e8f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1120_c7_7e8f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1123_c3_62ca : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1120_c7_7e8f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_7e0a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1120_c7_7e8f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1120_c7_7e8f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1120_c7_7e8f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1125_c7_7e0a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1120_c7_7e8f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_7e8f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_7e8f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_7e0a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_7e8f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_7e8f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_7e8f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_7e0a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_7e8f_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1120_c7_7e8f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1120_c7_7e8f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1125_c7_7e0a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1120_c7_7e8f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1125_c11_1355_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1125_c11_1355_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1125_c11_1355_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1125_c7_7e0a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1125_c7_7e0a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1128_c7_072b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1125_c7_7e0a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_7e0a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_7e0a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_072b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_7e0a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1125_c7_7e0a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1125_c7_7e0a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1128_c7_072b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1125_c7_7e0a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_7e0a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1126_c3_b9cf : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_7e0a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_072b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_7e0a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1125_c7_7e0a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1125_c7_7e0a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1128_c7_072b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1125_c7_7e0a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_7e0a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_7e0a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_072b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_7e0a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_7e0a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_7e0a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_072b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_7e0a_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1125_c7_7e0a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1125_c7_7e0a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1128_c7_072b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1125_c7_7e0a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_39a5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_39a5_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_39a5_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1128_c7_072b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1128_c7_072b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1128_c7_072b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_072b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_072b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_072b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1128_c7_072b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1128_c7_072b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1134_c7_fb6e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1128_c7_072b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_072b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_072b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c7_fb6e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_072b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1128_c7_072b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1128_c7_072b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1134_c7_fb6e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1128_c7_072b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_072b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_072b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1134_c7_fb6e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_072b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_072b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_072b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1134_c7_fb6e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_072b_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1128_c7_072b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1128_c7_072b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1128_c7_072b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1129_c3_e666_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1129_c3_e666_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1129_c3_e666_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1130_c11_bcb9_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1130_c11_bcb9_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1130_c11_bcb9_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1132_c32_f00a_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1132_c32_f00a_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1132_c32_f00a_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1132_c32_a0f4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1132_c32_a0f4_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1132_c32_a0f4_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1132_c32_7be4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1132_c32_7be4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1132_c32_7be4_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1132_c32_f00a_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1134_c11_d329_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1134_c11_d329_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1134_c11_d329_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1134_c7_fb6e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1134_c7_fb6e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1140_c7_b8a8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1134_c7_fb6e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c7_fb6e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1137_c3_00d0 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c7_fb6e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_b8a8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c7_fb6e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1134_c7_fb6e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1134_c7_fb6e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1134_c7_fb6e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1134_c7_fb6e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1134_c7_fb6e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_b8a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1134_c7_fb6e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1134_c7_fb6e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1134_c7_fb6e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_b8a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1134_c7_fb6e_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1138_c24_352e_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_f05d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_f05d_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_f05d_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1140_c7_b8a8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1140_c7_b8a8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1140_c7_b8a8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_b8a8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_b8a8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_e7e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_b8a8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_b8a8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1141_c3_0a59 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_b8a8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_b8a8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_b8a8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_b8a8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_e7e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_b8a8_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1142_c34_371c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1142_c34_371c_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1142_c24_09d7_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1144_c11_0a8a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1144_c11_0a8a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1144_c11_0a8a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_e7e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_e7e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_e7e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_e7e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_e7e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_e7e2_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1105_l1128_l1102_l1125_l1097_l1120_l1117_l1113_l1110_DUPLICATE_f069_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1105_l1128_l1102_l1125_l1097_l1120_l1117_l1113_l1140_l1110_DUPLICATE_3d1e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1105_l1102_l1125_l1097_l1120_l1117_l1113_l1110_l1134_DUPLICATE_9fcd_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1105_l1128_l1102_l1125_l1097_l1120_l1117_l1144_l1113_l1140_l1110_DUPLICATE_6643_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1105_l1128_l1102_l1125_l1120_l1117_l1144_l1113_l1140_l1110_l1134_DUPLICATE_1d48_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1106_l1129_l1114_l1121_DUPLICATE_5bf0_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1107_l1122_DUPLICATE_da55_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1107_l1122_DUPLICATE_da55_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1140_l1128_DUPLICATE_350c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l1149_l1093_DUPLICATE_52c1_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1126_c3_b9cf := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_7e0a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1126_c3_b9cf;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1134_c7_fb6e_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1120_c11_ca15_right := to_unsigned(6, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_e7e2_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1141_c3_0a59 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_b8a8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1141_c3_0a59;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1132_c32_a0f4_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1102_c11_0297_right := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1132_c32_f00a_iffalse := resize(to_signed(-2, 3), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1099_c3_ece4 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c2_9688_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1099_c3_ece4;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1123_c3_62ca := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1120_c7_7e8f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1123_c3_62ca;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_f05d_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1125_c11_1355_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c6_2554_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1103_c3_0bf7 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1102_c7_c596_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1103_c3_0bf7;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1117_c11_de31_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_39a5_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1105_c11_7b34_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1110_c11_2510_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1097_c2_9688_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1134_c7_fb6e_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1132_c32_f00a_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1128_c7_072b_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1113_c11_7dde_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1118_c3_371f := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_b9b6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1118_c3_371f;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1137_c3_00d0 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c7_fb6e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1137_c3_00d0;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1111_c3_abfd := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_094a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1111_c3_abfd;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1115_c3_a2c3 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_1e0c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1115_c3_a2c3;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1144_c11_0a8a_right := to_unsigned(11, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1108_c3_8d8a := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_f06a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1108_c3_8d8a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1134_c11_d329_right := to_unsigned(9, 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_e7e2_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1132_c32_7be4_right := to_unsigned(0, 1);

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
     VAR_BIN_OP_AND_uxn_opcodes_h_l1132_c32_a0f4_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1129_c3_e666_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1097_c2_9688_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1102_c7_c596_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1105_c7_f06a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1110_c7_094a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1113_c7_1e0c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1117_c7_b9b6_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1125_c7_7e0a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1128_c7_072b_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c6_2554_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1102_c11_0297_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1105_c11_7b34_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1110_c11_2510_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1113_c11_7dde_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1117_c11_de31_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1120_c11_ca15_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1125_c11_1355_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_39a5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1134_c11_d329_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_f05d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1144_c11_0a8a_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1114_c3_54c7_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1130_c11_bcb9_right := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1097_c2_9688_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1102_c7_c596_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1110_c7_094a_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1113_c7_1e0c_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1142_c34_371c_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1097_c2_9688_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1102_c7_c596_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1105_c7_f06a_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1110_c7_094a_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1113_c7_1e0c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1117_c7_b9b6_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1120_c7_7e8f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1125_c7_7e0a_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1128_c7_072b_iffalse := tmp16;
     -- CONST_SR_8[uxn_opcodes_h_l1142_c34_371c] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1142_c34_371c_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1142_c34_371c_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1142_c34_371c_return_output := CONST_SR_8_uxn_opcodes_h_l1142_c34_371c_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1105_l1128_l1102_l1125_l1097_l1120_l1117_l1113_l1110_DUPLICATE_f069 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1105_l1128_l1102_l1125_l1097_l1120_l1117_l1113_l1110_DUPLICATE_f069_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1128_c11_39a5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1128_c11_39a5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_39a5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1128_c11_39a5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_39a5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_39a5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1128_c11_39a5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1117_c11_de31] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1117_c11_de31_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1117_c11_de31_left;
     BIN_OP_EQ_uxn_opcodes_h_l1117_c11_de31_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1117_c11_de31_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1117_c11_de31_return_output := BIN_OP_EQ_uxn_opcodes_h_l1117_c11_de31_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1105_l1128_l1102_l1125_l1097_l1120_l1117_l1144_l1113_l1140_l1110_DUPLICATE_6643 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1105_l1128_l1102_l1125_l1097_l1120_l1117_l1144_l1113_l1140_l1110_DUPLICATE_6643_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1113_c11_7dde] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1113_c11_7dde_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1113_c11_7dde_left;
     BIN_OP_EQ_uxn_opcodes_h_l1113_c11_7dde_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1113_c11_7dde_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1113_c11_7dde_return_output := BIN_OP_EQ_uxn_opcodes_h_l1113_c11_7dde_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1105_l1102_l1125_l1097_l1120_l1117_l1113_l1110_l1134_DUPLICATE_9fcd LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1105_l1102_l1125_l1097_l1120_l1117_l1113_l1110_l1134_DUPLICATE_9fcd_return_output := result.is_sp_shift;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1138_c24_352e] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1138_c24_352e_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1106_l1129_l1114_l1121_DUPLICATE_5bf0 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1106_l1129_l1114_l1121_DUPLICATE_5bf0_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1140_c11_f05d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1140_c11_f05d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_f05d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1140_c11_f05d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_f05d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_f05d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1140_c11_f05d_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1105_l1128_l1102_l1125_l1097_l1120_l1117_l1113_l1140_l1110_DUPLICATE_3d1e LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1105_l1128_l1102_l1125_l1097_l1120_l1117_l1113_l1140_l1110_DUPLICATE_3d1e_return_output := result.stack_value;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1140_l1128_DUPLICATE_350c LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1140_l1128_DUPLICATE_350c_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1134_c11_d329] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1134_c11_d329_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1134_c11_d329_left;
     BIN_OP_EQ_uxn_opcodes_h_l1134_c11_d329_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1134_c11_d329_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1134_c11_d329_return_output := BIN_OP_EQ_uxn_opcodes_h_l1134_c11_d329_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1097_c6_2554] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1097_c6_2554_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c6_2554_left;
     BIN_OP_EQ_uxn_opcodes_h_l1097_c6_2554_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c6_2554_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c6_2554_return_output := BIN_OP_EQ_uxn_opcodes_h_l1097_c6_2554_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1105_l1128_l1102_l1125_l1120_l1117_l1144_l1113_l1140_l1110_l1134_DUPLICATE_1d48 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1105_l1128_l1102_l1125_l1120_l1117_l1144_l1113_l1140_l1110_l1134_DUPLICATE_1d48_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1125_c11_1355] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1125_c11_1355_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1125_c11_1355_left;
     BIN_OP_EQ_uxn_opcodes_h_l1125_c11_1355_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1125_c11_1355_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1125_c11_1355_return_output := BIN_OP_EQ_uxn_opcodes_h_l1125_c11_1355_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1102_c11_0297] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1102_c11_0297_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1102_c11_0297_left;
     BIN_OP_EQ_uxn_opcodes_h_l1102_c11_0297_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1102_c11_0297_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1102_c11_0297_return_output := BIN_OP_EQ_uxn_opcodes_h_l1102_c11_0297_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1105_c11_7b34] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1105_c11_7b34_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1105_c11_7b34_left;
     BIN_OP_EQ_uxn_opcodes_h_l1105_c11_7b34_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1105_c11_7b34_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1105_c11_7b34_return_output := BIN_OP_EQ_uxn_opcodes_h_l1105_c11_7b34_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1132_c32_a0f4] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1132_c32_a0f4_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1132_c32_a0f4_left;
     BIN_OP_AND_uxn_opcodes_h_l1132_c32_a0f4_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1132_c32_a0f4_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1132_c32_a0f4_return_output := BIN_OP_AND_uxn_opcodes_h_l1132_c32_a0f4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1110_c11_2510] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1110_c11_2510_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1110_c11_2510_left;
     BIN_OP_EQ_uxn_opcodes_h_l1110_c11_2510_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1110_c11_2510_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1110_c11_2510_return_output := BIN_OP_EQ_uxn_opcodes_h_l1110_c11_2510_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1144_c11_0a8a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1144_c11_0a8a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1144_c11_0a8a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1144_c11_0a8a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1144_c11_0a8a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1144_c11_0a8a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1144_c11_0a8a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1120_c11_ca15] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1120_c11_ca15_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1120_c11_ca15_left;
     BIN_OP_EQ_uxn_opcodes_h_l1120_c11_ca15_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1120_c11_ca15_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1120_c11_ca15_return_output := BIN_OP_EQ_uxn_opcodes_h_l1120_c11_ca15_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1132_c32_7be4_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1132_c32_a0f4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1097_c2_9688_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c6_2554_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1097_c2_9688_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c6_2554_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c2_9688_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c6_2554_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1097_c2_9688_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c6_2554_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1097_c2_9688_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c6_2554_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c2_9688_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c6_2554_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1097_c2_9688_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c6_2554_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1097_c2_9688_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c6_2554_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1097_c2_9688_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c6_2554_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1102_c7_c596_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1102_c11_0297_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_c596_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1102_c11_0297_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1102_c7_c596_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1102_c11_0297_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_c596_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1102_c11_0297_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1102_c7_c596_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1102_c11_0297_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1102_c7_c596_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1102_c11_0297_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1102_c7_c596_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1102_c11_0297_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1102_c7_c596_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1102_c11_0297_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1102_c7_c596_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1102_c11_0297_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1105_c7_f06a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1105_c11_7b34_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_f06a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1105_c11_7b34_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1105_c7_f06a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1105_c11_7b34_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_f06a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1105_c11_7b34_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1105_c7_f06a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1105_c11_7b34_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_f06a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1105_c11_7b34_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1105_c7_f06a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1105_c11_7b34_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1105_c7_f06a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1105_c11_7b34_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1105_c7_f06a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1105_c11_7b34_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1110_c7_094a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1110_c11_2510_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_094a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1110_c11_2510_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1110_c7_094a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1110_c11_2510_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_094a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1110_c11_2510_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_094a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1110_c11_2510_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_094a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1110_c11_2510_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1110_c7_094a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1110_c11_2510_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1110_c7_094a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1110_c11_2510_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1110_c7_094a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1110_c11_2510_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1113_c7_1e0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1113_c11_7dde_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_1e0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1113_c11_7dde_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_1e0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1113_c11_7dde_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_1e0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1113_c11_7dde_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_1e0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1113_c11_7dde_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_1e0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1113_c11_7dde_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1113_c7_1e0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1113_c11_7dde_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1113_c7_1e0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1113_c11_7dde_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1113_c7_1e0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1113_c11_7dde_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1117_c7_b9b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1117_c11_de31_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_b9b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1117_c11_de31_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1117_c7_b9b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1117_c11_de31_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_b9b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1117_c11_de31_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1117_c7_b9b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1117_c11_de31_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_b9b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1117_c11_de31_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1117_c7_b9b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1117_c11_de31_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1117_c7_b9b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1117_c11_de31_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1120_c7_7e8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1120_c11_ca15_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_7e8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1120_c11_ca15_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1120_c7_7e8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1120_c11_ca15_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_7e8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1120_c11_ca15_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1120_c7_7e8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1120_c11_ca15_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1120_c7_7e8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1120_c11_ca15_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1120_c7_7e8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1120_c11_ca15_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1120_c7_7e8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1120_c11_ca15_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1125_c7_7e0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1125_c11_1355_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_7e0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1125_c11_1355_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1125_c7_7e0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1125_c11_1355_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_7e0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1125_c11_1355_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_7e0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1125_c11_1355_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_7e0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1125_c11_1355_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1125_c7_7e0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1125_c11_1355_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1125_c7_7e0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1125_c11_1355_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1128_c7_072b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_39a5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_072b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_39a5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1128_c7_072b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_39a5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_072b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_39a5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_072b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_39a5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_072b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_39a5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1128_c7_072b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_39a5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1128_c7_072b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_39a5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1134_c7_fb6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1134_c11_d329_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1134_c7_fb6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1134_c11_d329_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1134_c7_fb6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1134_c11_d329_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c7_fb6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1134_c11_d329_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1134_c7_fb6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1134_c11_d329_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_b8a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_f05d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_b8a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_f05d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_b8a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_f05d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1140_c7_b8a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_f05d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_e7e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1144_c11_0a8a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_e7e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1144_c11_0a8a_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1114_c3_54c7_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1106_l1129_l1114_l1121_DUPLICATE_5bf0_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1129_c3_e666_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1106_l1129_l1114_l1121_DUPLICATE_5bf0_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1107_l1122_DUPLICATE_da55_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1106_l1129_l1114_l1121_DUPLICATE_5bf0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1134_c7_fb6e_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1138_c24_352e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1097_c2_9688_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1105_l1128_l1102_l1125_l1097_l1120_l1117_l1113_l1110_DUPLICATE_f069_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1102_c7_c596_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1105_l1128_l1102_l1125_l1097_l1120_l1117_l1113_l1110_DUPLICATE_f069_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1105_c7_f06a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1105_l1128_l1102_l1125_l1097_l1120_l1117_l1113_l1110_DUPLICATE_f069_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_094a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1105_l1128_l1102_l1125_l1097_l1120_l1117_l1113_l1110_DUPLICATE_f069_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_1e0c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1105_l1128_l1102_l1125_l1097_l1120_l1117_l1113_l1110_DUPLICATE_f069_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1117_c7_b9b6_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1105_l1128_l1102_l1125_l1097_l1120_l1117_l1113_l1110_DUPLICATE_f069_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1120_c7_7e8f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1105_l1128_l1102_l1125_l1097_l1120_l1117_l1113_l1110_DUPLICATE_f069_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_7e0a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1105_l1128_l1102_l1125_l1097_l1120_l1117_l1113_l1110_DUPLICATE_f069_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_072b_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1105_l1128_l1102_l1125_l1097_l1120_l1117_l1113_l1110_DUPLICATE_f069_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_c596_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1105_l1128_l1102_l1125_l1120_l1117_l1144_l1113_l1140_l1110_l1134_DUPLICATE_1d48_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_f06a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1105_l1128_l1102_l1125_l1120_l1117_l1144_l1113_l1140_l1110_l1134_DUPLICATE_1d48_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_094a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1105_l1128_l1102_l1125_l1120_l1117_l1144_l1113_l1140_l1110_l1134_DUPLICATE_1d48_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_1e0c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1105_l1128_l1102_l1125_l1120_l1117_l1144_l1113_l1140_l1110_l1134_DUPLICATE_1d48_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_b9b6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1105_l1128_l1102_l1125_l1120_l1117_l1144_l1113_l1140_l1110_l1134_DUPLICATE_1d48_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_7e8f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1105_l1128_l1102_l1125_l1120_l1117_l1144_l1113_l1140_l1110_l1134_DUPLICATE_1d48_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_7e0a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1105_l1128_l1102_l1125_l1120_l1117_l1144_l1113_l1140_l1110_l1134_DUPLICATE_1d48_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_072b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1105_l1128_l1102_l1125_l1120_l1117_l1144_l1113_l1140_l1110_l1134_DUPLICATE_1d48_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1134_c7_fb6e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1105_l1128_l1102_l1125_l1120_l1117_l1144_l1113_l1140_l1110_l1134_DUPLICATE_1d48_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_b8a8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1105_l1128_l1102_l1125_l1120_l1117_l1144_l1113_l1140_l1110_l1134_DUPLICATE_1d48_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_e7e2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1105_l1128_l1102_l1125_l1120_l1117_l1144_l1113_l1140_l1110_l1134_DUPLICATE_1d48_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c2_9688_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1105_l1102_l1125_l1097_l1120_l1117_l1113_l1110_l1134_DUPLICATE_9fcd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1102_c7_c596_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1105_l1102_l1125_l1097_l1120_l1117_l1113_l1110_l1134_DUPLICATE_9fcd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1105_c7_f06a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1105_l1102_l1125_l1097_l1120_l1117_l1113_l1110_l1134_DUPLICATE_9fcd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1110_c7_094a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1105_l1102_l1125_l1097_l1120_l1117_l1113_l1110_l1134_DUPLICATE_9fcd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_1e0c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1105_l1102_l1125_l1097_l1120_l1117_l1113_l1110_l1134_DUPLICATE_9fcd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1117_c7_b9b6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1105_l1102_l1125_l1097_l1120_l1117_l1113_l1110_l1134_DUPLICATE_9fcd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1120_c7_7e8f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1105_l1102_l1125_l1097_l1120_l1117_l1113_l1110_l1134_DUPLICATE_9fcd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1125_c7_7e0a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1105_l1102_l1125_l1097_l1120_l1117_l1113_l1110_l1134_DUPLICATE_9fcd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1134_c7_fb6e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1105_l1102_l1125_l1097_l1120_l1117_l1113_l1110_l1134_DUPLICATE_9fcd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1097_c2_9688_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1105_l1128_l1102_l1125_l1097_l1120_l1117_l1144_l1113_l1140_l1110_DUPLICATE_6643_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_c596_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1105_l1128_l1102_l1125_l1097_l1120_l1117_l1144_l1113_l1140_l1110_DUPLICATE_6643_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_f06a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1105_l1128_l1102_l1125_l1097_l1120_l1117_l1144_l1113_l1140_l1110_DUPLICATE_6643_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_094a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1105_l1128_l1102_l1125_l1097_l1120_l1117_l1144_l1113_l1140_l1110_DUPLICATE_6643_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_1e0c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1105_l1128_l1102_l1125_l1097_l1120_l1117_l1144_l1113_l1140_l1110_DUPLICATE_6643_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_b9b6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1105_l1128_l1102_l1125_l1097_l1120_l1117_l1144_l1113_l1140_l1110_DUPLICATE_6643_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_7e8f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1105_l1128_l1102_l1125_l1097_l1120_l1117_l1144_l1113_l1140_l1110_DUPLICATE_6643_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_7e0a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1105_l1128_l1102_l1125_l1097_l1120_l1117_l1144_l1113_l1140_l1110_DUPLICATE_6643_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_072b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1105_l1128_l1102_l1125_l1097_l1120_l1117_l1144_l1113_l1140_l1110_DUPLICATE_6643_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_b8a8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1105_l1128_l1102_l1125_l1097_l1120_l1117_l1144_l1113_l1140_l1110_DUPLICATE_6643_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_e7e2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1105_l1128_l1102_l1125_l1097_l1120_l1117_l1144_l1113_l1140_l1110_DUPLICATE_6643_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_072b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1140_l1128_DUPLICATE_350c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_b8a8_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1140_l1128_DUPLICATE_350c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1097_c2_9688_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1105_l1128_l1102_l1125_l1097_l1120_l1117_l1113_l1140_l1110_DUPLICATE_3d1e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1102_c7_c596_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1105_l1128_l1102_l1125_l1097_l1120_l1117_l1113_l1140_l1110_DUPLICATE_3d1e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1105_c7_f06a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1105_l1128_l1102_l1125_l1097_l1120_l1117_l1113_l1140_l1110_DUPLICATE_3d1e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1110_c7_094a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1105_l1128_l1102_l1125_l1097_l1120_l1117_l1113_l1140_l1110_DUPLICATE_3d1e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1113_c7_1e0c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1105_l1128_l1102_l1125_l1097_l1120_l1117_l1113_l1140_l1110_DUPLICATE_3d1e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1117_c7_b9b6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1105_l1128_l1102_l1125_l1097_l1120_l1117_l1113_l1140_l1110_DUPLICATE_3d1e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1120_c7_7e8f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1105_l1128_l1102_l1125_l1097_l1120_l1117_l1113_l1140_l1110_DUPLICATE_3d1e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1125_c7_7e0a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1105_l1128_l1102_l1125_l1097_l1120_l1117_l1113_l1140_l1110_DUPLICATE_3d1e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1128_c7_072b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1105_l1128_l1102_l1125_l1097_l1120_l1117_l1113_l1140_l1110_DUPLICATE_3d1e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1140_c7_b8a8_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1105_l1128_l1102_l1125_l1097_l1120_l1117_l1113_l1140_l1110_DUPLICATE_3d1e_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l1114_c3_54c7] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1114_c3_54c7_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1114_c3_54c7_left;
     BIN_OP_OR_uxn_opcodes_h_l1114_c3_54c7_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1114_c3_54c7_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1114_c3_54c7_return_output := BIN_OP_OR_uxn_opcodes_h_l1114_c3_54c7_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1107_l1122_DUPLICATE_da55 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1107_l1122_DUPLICATE_da55_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1107_l1122_DUPLICATE_da55_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1107_l1122_DUPLICATE_da55_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1107_l1122_DUPLICATE_da55_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1140_c7_b8a8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_b8a8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_b8a8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_b8a8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_b8a8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_b8a8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_b8a8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_b8a8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_b8a8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1134_c7_fb6e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1134_c7_fb6e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1134_c7_fb6e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1134_c7_fb6e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1134_c7_fb6e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1134_c7_fb6e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1134_c7_fb6e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1134_c7_fb6e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1134_c7_fb6e_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1132_c32_7be4] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1132_c32_7be4_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1132_c32_7be4_left;
     BIN_OP_GT_uxn_opcodes_h_l1132_c32_7be4_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1132_c32_7be4_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1132_c32_7be4_return_output := BIN_OP_GT_uxn_opcodes_h_l1132_c32_7be4_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1129_c3_e666] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1129_c3_e666_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1129_c3_e666_left;
     BIN_OP_OR_uxn_opcodes_h_l1129_c3_e666_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1129_c3_e666_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1129_c3_e666_return_output := BIN_OP_OR_uxn_opcodes_h_l1129_c3_e666_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1144_c7_e7e2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_e7e2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_e7e2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_e7e2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_e7e2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_e7e2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_e7e2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_e7e2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_e7e2_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1142_c24_09d7] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1142_c24_09d7_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1142_c34_371c_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1144_c7_e7e2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_e7e2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_e7e2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_e7e2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_e7e2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_e7e2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_e7e2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_e7e2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_e7e2_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1132_c32_f00a_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1132_c32_7be4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1113_c7_1e0c_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1114_c3_54c7_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1130_c11_bcb9_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1129_c3_e666_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1128_c7_072b_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1129_c3_e666_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1140_c7_b8a8_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1142_c24_09d7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1120_c7_7e8f_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1107_l1122_DUPLICATE_da55_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1105_c7_f06a_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1107_l1122_DUPLICATE_da55_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_b8a8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_e7e2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1128_c7_072b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1134_c7_fb6e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_b8a8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_e7e2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c7_fb6e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_b8a8_return_output;
     -- MUX[uxn_opcodes_h_l1132_c32_f00a] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1132_c32_f00a_cond <= VAR_MUX_uxn_opcodes_h_l1132_c32_f00a_cond;
     MUX_uxn_opcodes_h_l1132_c32_f00a_iftrue <= VAR_MUX_uxn_opcodes_h_l1132_c32_f00a_iftrue;
     MUX_uxn_opcodes_h_l1132_c32_f00a_iffalse <= VAR_MUX_uxn_opcodes_h_l1132_c32_f00a_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1132_c32_f00a_return_output := MUX_uxn_opcodes_h_l1132_c32_f00a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1140_c7_b8a8] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1140_c7_b8a8_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1140_c7_b8a8_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1140_c7_b8a8_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1140_c7_b8a8_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1140_c7_b8a8_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1140_c7_b8a8_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1140_c7_b8a8_return_output := result_stack_value_MUX_uxn_opcodes_h_l1140_c7_b8a8_return_output;

     -- n16_MUX[uxn_opcodes_h_l1128_c7_072b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1128_c7_072b_cond <= VAR_n16_MUX_uxn_opcodes_h_l1128_c7_072b_cond;
     n16_MUX_uxn_opcodes_h_l1128_c7_072b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1128_c7_072b_iftrue;
     n16_MUX_uxn_opcodes_h_l1128_c7_072b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1128_c7_072b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1128_c7_072b_return_output := n16_MUX_uxn_opcodes_h_l1128_c7_072b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1128_c7_072b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1128_c7_072b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1128_c7_072b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1128_c7_072b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1128_c7_072b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1128_c7_072b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1128_c7_072b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1128_c7_072b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1128_c7_072b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1140_c7_b8a8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_b8a8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_b8a8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_b8a8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_b8a8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_b8a8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_b8a8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_b8a8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_b8a8_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1130_c11_bcb9] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1130_c11_bcb9_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1130_c11_bcb9_left;
     BIN_OP_OR_uxn_opcodes_h_l1130_c11_bcb9_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1130_c11_bcb9_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1130_c11_bcb9_return_output := BIN_OP_OR_uxn_opcodes_h_l1130_c11_bcb9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1140_c7_b8a8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_b8a8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_b8a8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_b8a8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_b8a8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_b8a8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_b8a8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_b8a8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_b8a8_return_output;

     -- t16_MUX[uxn_opcodes_h_l1113_c7_1e0c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1113_c7_1e0c_cond <= VAR_t16_MUX_uxn_opcodes_h_l1113_c7_1e0c_cond;
     t16_MUX_uxn_opcodes_h_l1113_c7_1e0c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1113_c7_1e0c_iftrue;
     t16_MUX_uxn_opcodes_h_l1113_c7_1e0c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1113_c7_1e0c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1113_c7_1e0c_return_output := t16_MUX_uxn_opcodes_h_l1113_c7_1e0c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1134_c7_fb6e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c7_fb6e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c7_fb6e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c7_fb6e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c7_fb6e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c7_fb6e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c7_fb6e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c7_fb6e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c7_fb6e_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l1128_c7_072b_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1130_c11_bcb9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_072b_iftrue := VAR_MUX_uxn_opcodes_h_l1132_c32_f00a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1125_c7_7e0a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1128_c7_072b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1134_c7_fb6e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_b8a8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1125_c7_7e0a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1128_c7_072b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1134_c7_fb6e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_b8a8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_072b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c7_fb6e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1134_c7_fb6e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1140_c7_b8a8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1110_c7_094a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1113_c7_1e0c_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1134_c7_fb6e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1134_c7_fb6e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1134_c7_fb6e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1134_c7_fb6e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1134_c7_fb6e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1134_c7_fb6e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1134_c7_fb6e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1134_c7_fb6e_return_output := result_stack_value_MUX_uxn_opcodes_h_l1134_c7_fb6e_return_output;

     -- t16_MUX[uxn_opcodes_h_l1110_c7_094a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1110_c7_094a_cond <= VAR_t16_MUX_uxn_opcodes_h_l1110_c7_094a_cond;
     t16_MUX_uxn_opcodes_h_l1110_c7_094a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1110_c7_094a_iftrue;
     t16_MUX_uxn_opcodes_h_l1110_c7_094a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1110_c7_094a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1110_c7_094a_return_output := t16_MUX_uxn_opcodes_h_l1110_c7_094a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1125_c7_7e0a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1125_c7_7e0a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1125_c7_7e0a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1125_c7_7e0a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1125_c7_7e0a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1125_c7_7e0a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1125_c7_7e0a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1125_c7_7e0a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1125_c7_7e0a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1128_c7_072b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_072b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_072b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_072b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_072b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_072b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_072b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_072b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_072b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1134_c7_fb6e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1134_c7_fb6e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1134_c7_fb6e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1134_c7_fb6e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1134_c7_fb6e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1134_c7_fb6e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1134_c7_fb6e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1134_c7_fb6e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1134_c7_fb6e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1128_c7_072b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_072b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_072b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_072b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_072b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_072b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_072b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_072b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_072b_return_output;

     -- n16_MUX[uxn_opcodes_h_l1125_c7_7e0a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1125_c7_7e0a_cond <= VAR_n16_MUX_uxn_opcodes_h_l1125_c7_7e0a_cond;
     n16_MUX_uxn_opcodes_h_l1125_c7_7e0a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1125_c7_7e0a_iftrue;
     n16_MUX_uxn_opcodes_h_l1125_c7_7e0a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1125_c7_7e0a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1125_c7_7e0a_return_output := n16_MUX_uxn_opcodes_h_l1125_c7_7e0a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1134_c7_fb6e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1134_c7_fb6e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1134_c7_fb6e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1134_c7_fb6e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1134_c7_fb6e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1134_c7_fb6e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1134_c7_fb6e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1134_c7_fb6e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1134_c7_fb6e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1128_c7_072b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1128_c7_072b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1128_c7_072b_cond;
     tmp16_MUX_uxn_opcodes_h_l1128_c7_072b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1128_c7_072b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1128_c7_072b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1128_c7_072b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1128_c7_072b_return_output := tmp16_MUX_uxn_opcodes_h_l1128_c7_072b_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l1120_c7_7e8f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1125_c7_7e0a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_072b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1134_c7_fb6e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1120_c7_7e8f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1125_c7_7e0a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_072b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1134_c7_fb6e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_7e0a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_072b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_7e0a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_072b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1128_c7_072b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1134_c7_fb6e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1105_c7_f06a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1110_c7_094a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1125_c7_7e0a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1128_c7_072b_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1125_c7_7e0a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_7e0a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_7e0a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_7e0a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_7e0a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_7e0a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_7e0a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_7e0a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_7e0a_return_output;

     -- t16_MUX[uxn_opcodes_h_l1105_c7_f06a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1105_c7_f06a_cond <= VAR_t16_MUX_uxn_opcodes_h_l1105_c7_f06a_cond;
     t16_MUX_uxn_opcodes_h_l1105_c7_f06a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1105_c7_f06a_iftrue;
     t16_MUX_uxn_opcodes_h_l1105_c7_f06a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1105_c7_f06a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1105_c7_f06a_return_output := t16_MUX_uxn_opcodes_h_l1105_c7_f06a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1128_c7_072b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_072b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_072b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_072b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_072b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_072b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_072b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_072b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_072b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1125_c7_7e0a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1125_c7_7e0a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1125_c7_7e0a_cond;
     tmp16_MUX_uxn_opcodes_h_l1125_c7_7e0a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1125_c7_7e0a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1125_c7_7e0a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1125_c7_7e0a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1125_c7_7e0a_return_output := tmp16_MUX_uxn_opcodes_h_l1125_c7_7e0a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1125_c7_7e0a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_7e0a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_7e0a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_7e0a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_7e0a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_7e0a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_7e0a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_7e0a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_7e0a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1128_c7_072b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_072b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_072b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_072b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_072b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_072b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_072b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_072b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_072b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1128_c7_072b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1128_c7_072b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1128_c7_072b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1128_c7_072b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1128_c7_072b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1128_c7_072b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1128_c7_072b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1128_c7_072b_return_output := result_stack_value_MUX_uxn_opcodes_h_l1128_c7_072b_return_output;

     -- n16_MUX[uxn_opcodes_h_l1120_c7_7e8f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1120_c7_7e8f_cond <= VAR_n16_MUX_uxn_opcodes_h_l1120_c7_7e8f_cond;
     n16_MUX_uxn_opcodes_h_l1120_c7_7e8f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1120_c7_7e8f_iftrue;
     n16_MUX_uxn_opcodes_h_l1120_c7_7e8f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1120_c7_7e8f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1120_c7_7e8f_return_output := n16_MUX_uxn_opcodes_h_l1120_c7_7e8f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1120_c7_7e8f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1120_c7_7e8f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1120_c7_7e8f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1120_c7_7e8f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1120_c7_7e8f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1120_c7_7e8f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1120_c7_7e8f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1120_c7_7e8f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1120_c7_7e8f_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1117_c7_b9b6_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1120_c7_7e8f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_7e0a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_072b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1117_c7_b9b6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1120_c7_7e8f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_7e0a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_072b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1120_c7_7e8f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_7e0a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1120_c7_7e8f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_7e0a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1125_c7_7e0a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1128_c7_072b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1102_c7_c596_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1105_c7_f06a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1120_c7_7e8f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1125_c7_7e0a_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1120_c7_7e8f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1120_c7_7e8f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1120_c7_7e8f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1120_c7_7e8f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1120_c7_7e8f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1120_c7_7e8f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1120_c7_7e8f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1120_c7_7e8f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1120_c7_7e8f_return_output;

     -- t16_MUX[uxn_opcodes_h_l1102_c7_c596] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1102_c7_c596_cond <= VAR_t16_MUX_uxn_opcodes_h_l1102_c7_c596_cond;
     t16_MUX_uxn_opcodes_h_l1102_c7_c596_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1102_c7_c596_iftrue;
     t16_MUX_uxn_opcodes_h_l1102_c7_c596_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1102_c7_c596_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1102_c7_c596_return_output := t16_MUX_uxn_opcodes_h_l1102_c7_c596_return_output;

     -- n16_MUX[uxn_opcodes_h_l1117_c7_b9b6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1117_c7_b9b6_cond <= VAR_n16_MUX_uxn_opcodes_h_l1117_c7_b9b6_cond;
     n16_MUX_uxn_opcodes_h_l1117_c7_b9b6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1117_c7_b9b6_iftrue;
     n16_MUX_uxn_opcodes_h_l1117_c7_b9b6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1117_c7_b9b6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1117_c7_b9b6_return_output := n16_MUX_uxn_opcodes_h_l1117_c7_b9b6_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1125_c7_7e0a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1125_c7_7e0a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1125_c7_7e0a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1125_c7_7e0a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1125_c7_7e0a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1125_c7_7e0a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1125_c7_7e0a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1125_c7_7e0a_return_output := result_stack_value_MUX_uxn_opcodes_h_l1125_c7_7e0a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1125_c7_7e0a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_7e0a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_7e0a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_7e0a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_7e0a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_7e0a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_7e0a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_7e0a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_7e0a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1117_c7_b9b6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1117_c7_b9b6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1117_c7_b9b6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1117_c7_b9b6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1117_c7_b9b6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1117_c7_b9b6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1117_c7_b9b6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1117_c7_b9b6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1117_c7_b9b6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1125_c7_7e0a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_7e0a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_7e0a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_7e0a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_7e0a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_7e0a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_7e0a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_7e0a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_7e0a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1120_c7_7e8f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1120_c7_7e8f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1120_c7_7e8f_cond;
     tmp16_MUX_uxn_opcodes_h_l1120_c7_7e8f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1120_c7_7e8f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1120_c7_7e8f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1120_c7_7e8f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1120_c7_7e8f_return_output := tmp16_MUX_uxn_opcodes_h_l1120_c7_7e8f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1120_c7_7e8f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1120_c7_7e8f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1120_c7_7e8f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1120_c7_7e8f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1120_c7_7e8f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1120_c7_7e8f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1120_c7_7e8f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1120_c7_7e8f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1120_c7_7e8f_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1113_c7_1e0c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1117_c7_b9b6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_7e8f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_7e0a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_1e0c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1117_c7_b9b6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_7e8f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_7e0a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1117_c7_b9b6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1120_c7_7e8f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_b9b6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1120_c7_7e8f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1120_c7_7e8f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1125_c7_7e0a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1097_c2_9688_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1102_c7_c596_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1117_c7_b9b6_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1120_c7_7e8f_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1120_c7_7e8f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_7e8f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_7e8f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_7e8f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_7e8f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_7e8f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_7e8f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_7e8f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_7e8f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1117_c7_b9b6] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1117_c7_b9b6_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1117_c7_b9b6_cond;
     tmp16_MUX_uxn_opcodes_h_l1117_c7_b9b6_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1117_c7_b9b6_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1117_c7_b9b6_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1117_c7_b9b6_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1117_c7_b9b6_return_output := tmp16_MUX_uxn_opcodes_h_l1117_c7_b9b6_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1120_c7_7e8f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1120_c7_7e8f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1120_c7_7e8f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1120_c7_7e8f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1120_c7_7e8f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1120_c7_7e8f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1120_c7_7e8f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1120_c7_7e8f_return_output := result_stack_value_MUX_uxn_opcodes_h_l1120_c7_7e8f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1117_c7_b9b6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1117_c7_b9b6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1117_c7_b9b6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1117_c7_b9b6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1117_c7_b9b6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1117_c7_b9b6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1117_c7_b9b6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1117_c7_b9b6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1117_c7_b9b6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1117_c7_b9b6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_b9b6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_b9b6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_b9b6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_b9b6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_b9b6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_b9b6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_b9b6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_b9b6_return_output;

     -- t16_MUX[uxn_opcodes_h_l1097_c2_9688] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1097_c2_9688_cond <= VAR_t16_MUX_uxn_opcodes_h_l1097_c2_9688_cond;
     t16_MUX_uxn_opcodes_h_l1097_c2_9688_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1097_c2_9688_iftrue;
     t16_MUX_uxn_opcodes_h_l1097_c2_9688_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1097_c2_9688_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1097_c2_9688_return_output := t16_MUX_uxn_opcodes_h_l1097_c2_9688_return_output;

     -- n16_MUX[uxn_opcodes_h_l1113_c7_1e0c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1113_c7_1e0c_cond <= VAR_n16_MUX_uxn_opcodes_h_l1113_c7_1e0c_cond;
     n16_MUX_uxn_opcodes_h_l1113_c7_1e0c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1113_c7_1e0c_iftrue;
     n16_MUX_uxn_opcodes_h_l1113_c7_1e0c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1113_c7_1e0c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1113_c7_1e0c_return_output := n16_MUX_uxn_opcodes_h_l1113_c7_1e0c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1120_c7_7e8f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_7e8f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_7e8f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_7e8f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_7e8f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_7e8f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_7e8f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_7e8f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_7e8f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1113_c7_1e0c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_1e0c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_1e0c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_1e0c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_1e0c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_1e0c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_1e0c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_1e0c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_1e0c_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1110_c7_094a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1113_c7_1e0c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_b9b6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_7e8f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1110_c7_094a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_1e0c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_b9b6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_7e8f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_1e0c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1117_c7_b9b6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_1e0c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_b9b6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1117_c7_b9b6_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1120_c7_7e8f_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1097_c2_9688_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1113_c7_1e0c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1117_c7_b9b6_return_output;
     -- n16_MUX[uxn_opcodes_h_l1110_c7_094a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1110_c7_094a_cond <= VAR_n16_MUX_uxn_opcodes_h_l1110_c7_094a_cond;
     n16_MUX_uxn_opcodes_h_l1110_c7_094a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1110_c7_094a_iftrue;
     n16_MUX_uxn_opcodes_h_l1110_c7_094a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1110_c7_094a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1110_c7_094a_return_output := n16_MUX_uxn_opcodes_h_l1110_c7_094a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1117_c7_b9b6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1117_c7_b9b6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1117_c7_b9b6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1117_c7_b9b6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1117_c7_b9b6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1117_c7_b9b6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1117_c7_b9b6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1117_c7_b9b6_return_output := result_stack_value_MUX_uxn_opcodes_h_l1117_c7_b9b6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1113_c7_1e0c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_1e0c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_1e0c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_1e0c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_1e0c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_1e0c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_1e0c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_1e0c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_1e0c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1117_c7_b9b6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_b9b6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_b9b6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_b9b6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_b9b6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_b9b6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_b9b6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_b9b6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_b9b6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1117_c7_b9b6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_b9b6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_b9b6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_b9b6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_b9b6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_b9b6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_b9b6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_b9b6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_b9b6_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1113_c7_1e0c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1113_c7_1e0c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1113_c7_1e0c_cond;
     tmp16_MUX_uxn_opcodes_h_l1113_c7_1e0c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1113_c7_1e0c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1113_c7_1e0c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1113_c7_1e0c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1113_c7_1e0c_return_output := tmp16_MUX_uxn_opcodes_h_l1113_c7_1e0c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1113_c7_1e0c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_1e0c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_1e0c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_1e0c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_1e0c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_1e0c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_1e0c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_1e0c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_1e0c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1110_c7_094a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1110_c7_094a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1110_c7_094a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1110_c7_094a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1110_c7_094a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1110_c7_094a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1110_c7_094a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1110_c7_094a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1110_c7_094a_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1105_c7_f06a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1110_c7_094a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_1e0c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_b9b6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1105_c7_f06a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1110_c7_094a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_1e0c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_b9b6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_094a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_1e0c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_094a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_1e0c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1113_c7_1e0c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1117_c7_b9b6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1110_c7_094a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1113_c7_1e0c_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1113_c7_1e0c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_1e0c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_1e0c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_1e0c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_1e0c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_1e0c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_1e0c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_1e0c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_1e0c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1110_c7_094a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_094a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_094a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_094a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_094a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_094a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_094a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_094a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_094a_return_output;

     -- n16_MUX[uxn_opcodes_h_l1105_c7_f06a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1105_c7_f06a_cond <= VAR_n16_MUX_uxn_opcodes_h_l1105_c7_f06a_cond;
     n16_MUX_uxn_opcodes_h_l1105_c7_f06a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1105_c7_f06a_iftrue;
     n16_MUX_uxn_opcodes_h_l1105_c7_f06a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1105_c7_f06a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1105_c7_f06a_return_output := n16_MUX_uxn_opcodes_h_l1105_c7_f06a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1113_c7_1e0c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1113_c7_1e0c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1113_c7_1e0c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1113_c7_1e0c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1113_c7_1e0c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1113_c7_1e0c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1113_c7_1e0c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1113_c7_1e0c_return_output := result_stack_value_MUX_uxn_opcodes_h_l1113_c7_1e0c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1110_c7_094a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_094a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_094a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_094a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_094a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_094a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_094a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_094a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_094a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1110_c7_094a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1110_c7_094a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1110_c7_094a_cond;
     tmp16_MUX_uxn_opcodes_h_l1110_c7_094a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1110_c7_094a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1110_c7_094a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1110_c7_094a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1110_c7_094a_return_output := tmp16_MUX_uxn_opcodes_h_l1110_c7_094a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1113_c7_1e0c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_1e0c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_1e0c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_1e0c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_1e0c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_1e0c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_1e0c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_1e0c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_1e0c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1105_c7_f06a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1105_c7_f06a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1105_c7_f06a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1105_c7_f06a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1105_c7_f06a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1105_c7_f06a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1105_c7_f06a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1105_c7_f06a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1105_c7_f06a_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l1102_c7_c596_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1105_c7_f06a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_094a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_1e0c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1102_c7_c596_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1105_c7_f06a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_094a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_1e0c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1105_c7_f06a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_094a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_f06a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_094a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1110_c7_094a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1113_c7_1e0c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1105_c7_f06a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1110_c7_094a_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1102_c7_c596] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1102_c7_c596_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1102_c7_c596_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1102_c7_c596_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1102_c7_c596_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1102_c7_c596_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1102_c7_c596_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1102_c7_c596_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1102_c7_c596_return_output;

     -- n16_MUX[uxn_opcodes_h_l1102_c7_c596] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1102_c7_c596_cond <= VAR_n16_MUX_uxn_opcodes_h_l1102_c7_c596_cond;
     n16_MUX_uxn_opcodes_h_l1102_c7_c596_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1102_c7_c596_iftrue;
     n16_MUX_uxn_opcodes_h_l1102_c7_c596_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1102_c7_c596_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1102_c7_c596_return_output := n16_MUX_uxn_opcodes_h_l1102_c7_c596_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1110_c7_094a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_094a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_094a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_094a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_094a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_094a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_094a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_094a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_094a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1105_c7_f06a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1105_c7_f06a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1105_c7_f06a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1105_c7_f06a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1105_c7_f06a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1105_c7_f06a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1105_c7_f06a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1105_c7_f06a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1105_c7_f06a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1105_c7_f06a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_f06a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_f06a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_f06a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_f06a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_f06a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_f06a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_f06a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_f06a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1110_c7_094a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1110_c7_094a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1110_c7_094a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1110_c7_094a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1110_c7_094a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1110_c7_094a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1110_c7_094a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1110_c7_094a_return_output := result_stack_value_MUX_uxn_opcodes_h_l1110_c7_094a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1105_c7_f06a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1105_c7_f06a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1105_c7_f06a_cond;
     tmp16_MUX_uxn_opcodes_h_l1105_c7_f06a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1105_c7_f06a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1105_c7_f06a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1105_c7_f06a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1105_c7_f06a_return_output := tmp16_MUX_uxn_opcodes_h_l1105_c7_f06a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1110_c7_094a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_094a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_094a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_094a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_094a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_094a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_094a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_094a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_094a_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l1097_c2_9688_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1102_c7_c596_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_f06a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_094a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c2_9688_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1102_c7_c596_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_f06a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_094a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1102_c7_c596_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1105_c7_f06a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1102_c7_c596_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_f06a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1105_c7_f06a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1110_c7_094a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1102_c7_c596_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1105_c7_f06a_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1105_c7_f06a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_f06a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_f06a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_f06a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_f06a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_f06a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_f06a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_f06a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_f06a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1105_c7_f06a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1105_c7_f06a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1105_c7_f06a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1105_c7_f06a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1105_c7_f06a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1105_c7_f06a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1105_c7_f06a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1105_c7_f06a_return_output := result_stack_value_MUX_uxn_opcodes_h_l1105_c7_f06a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1102_c7_c596] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1102_c7_c596_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1102_c7_c596_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1102_c7_c596_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1102_c7_c596_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1102_c7_c596_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1102_c7_c596_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1102_c7_c596_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1102_c7_c596_return_output;

     -- n16_MUX[uxn_opcodes_h_l1097_c2_9688] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1097_c2_9688_cond <= VAR_n16_MUX_uxn_opcodes_h_l1097_c2_9688_cond;
     n16_MUX_uxn_opcodes_h_l1097_c2_9688_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1097_c2_9688_iftrue;
     n16_MUX_uxn_opcodes_h_l1097_c2_9688_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1097_c2_9688_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1097_c2_9688_return_output := n16_MUX_uxn_opcodes_h_l1097_c2_9688_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1102_c7_c596] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1102_c7_c596_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1102_c7_c596_cond;
     tmp16_MUX_uxn_opcodes_h_l1102_c7_c596_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1102_c7_c596_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1102_c7_c596_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1102_c7_c596_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1102_c7_c596_return_output := tmp16_MUX_uxn_opcodes_h_l1102_c7_c596_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1097_c2_9688] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c2_9688_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c2_9688_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c2_9688_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c2_9688_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c2_9688_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c2_9688_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c2_9688_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c2_9688_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1105_c7_f06a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_f06a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_f06a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_f06a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_f06a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_f06a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_f06a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_f06a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_f06a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1102_c7_c596] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1102_c7_c596_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1102_c7_c596_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1102_c7_c596_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1102_c7_c596_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1102_c7_c596_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1102_c7_c596_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1102_c7_c596_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1102_c7_c596_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1097_c2_9688_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_c596_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_f06a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_c596_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_f06a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1097_c2_9688_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1102_c7_c596_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c2_9688_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1102_c7_c596_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1102_c7_c596_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1105_c7_f06a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1097_c2_9688_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1102_c7_c596_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1102_c7_c596] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1102_c7_c596_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1102_c7_c596_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1102_c7_c596_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1102_c7_c596_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1102_c7_c596_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1102_c7_c596_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1102_c7_c596_return_output := result_stack_value_MUX_uxn_opcodes_h_l1102_c7_c596_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1102_c7_c596] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_c596_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_c596_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_c596_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_c596_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_c596_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_c596_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_c596_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_c596_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1097_c2_9688] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1097_c2_9688_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1097_c2_9688_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1097_c2_9688_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1097_c2_9688_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1097_c2_9688_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1097_c2_9688_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1097_c2_9688_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1097_c2_9688_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1102_c7_c596] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_c596_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_c596_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_c596_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_c596_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_c596_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_c596_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_c596_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_c596_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1097_c2_9688] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1097_c2_9688_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1097_c2_9688_cond;
     tmp16_MUX_uxn_opcodes_h_l1097_c2_9688_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1097_c2_9688_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1097_c2_9688_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1097_c2_9688_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1097_c2_9688_return_output := tmp16_MUX_uxn_opcodes_h_l1097_c2_9688_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1097_c2_9688] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c2_9688_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c2_9688_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c2_9688_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c2_9688_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c2_9688_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c2_9688_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c2_9688_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c2_9688_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1097_c2_9688_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_c596_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1097_c2_9688_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_c596_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1097_c2_9688_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1102_c7_c596_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1097_c2_9688_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1097_c2_9688] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1097_c2_9688_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1097_c2_9688_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1097_c2_9688_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1097_c2_9688_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1097_c2_9688_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1097_c2_9688_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1097_c2_9688_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1097_c2_9688_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1097_c2_9688] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1097_c2_9688_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1097_c2_9688_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1097_c2_9688_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1097_c2_9688_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1097_c2_9688_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1097_c2_9688_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1097_c2_9688_return_output := result_stack_value_MUX_uxn_opcodes_h_l1097_c2_9688_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1097_c2_9688] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1097_c2_9688_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1097_c2_9688_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1097_c2_9688_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1097_c2_9688_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1097_c2_9688_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1097_c2_9688_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1097_c2_9688_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1097_c2_9688_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l1149_l1093_DUPLICATE_52c1 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l1149_l1093_DUPLICATE_52c1_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1097_c2_9688_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1097_c2_9688_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c2_9688_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c2_9688_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1097_c2_9688_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1097_c2_9688_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l1149_l1093_DUPLICATE_52c1_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l1149_l1093_DUPLICATE_52c1_return_output;
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
