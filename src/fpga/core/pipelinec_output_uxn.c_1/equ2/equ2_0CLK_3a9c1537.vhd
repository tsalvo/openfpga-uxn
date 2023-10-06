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
-- Submodules: 107
entity equ2_0CLK_3a9c1537 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end equ2_0CLK_3a9c1537;
architecture arch of equ2_0CLK_3a9c1537 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1375_c6_4b16]
signal BIN_OP_EQ_uxn_opcodes_h_l1375_c6_4b16_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1375_c6_4b16_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1375_c6_4b16_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1375_c1_37d1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1375_c1_37d1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1375_c1_37d1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1375_c1_37d1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1375_c1_37d1_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1375_c2_a13e]
signal n16_MUX_uxn_opcodes_h_l1375_c2_a13e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1375_c2_a13e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1375_c2_a13e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1375_c2_a13e_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1375_c2_a13e]
signal t16_MUX_uxn_opcodes_h_l1375_c2_a13e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1375_c2_a13e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1375_c2_a13e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1375_c2_a13e_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1375_c2_a13e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1375_c2_a13e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1375_c2_a13e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1375_c2_a13e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1375_c2_a13e_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1375_c2_a13e]
signal result_stack_value_MUX_uxn_opcodes_h_l1375_c2_a13e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1375_c2_a13e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1375_c2_a13e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1375_c2_a13e_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1375_c2_a13e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1375_c2_a13e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1375_c2_a13e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1375_c2_a13e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1375_c2_a13e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1375_c2_a13e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1375_c2_a13e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1375_c2_a13e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1375_c2_a13e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1375_c2_a13e_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1375_c2_a13e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c2_a13e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c2_a13e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c2_a13e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c2_a13e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1375_c2_a13e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1375_c2_a13e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1375_c2_a13e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1375_c2_a13e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1375_c2_a13e_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1375_c2_a13e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1375_c2_a13e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1375_c2_a13e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1375_c2_a13e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1375_c2_a13e_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l1376_c3_b559[uxn_opcodes_h_l1376_c3_b559]
signal printf_uxn_opcodes_h_l1376_c3_b559_uxn_opcodes_h_l1376_c3_b559_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1381_c11_2572]
signal BIN_OP_EQ_uxn_opcodes_h_l1381_c11_2572_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1381_c11_2572_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1381_c11_2572_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1381_c7_ec8b]
signal n16_MUX_uxn_opcodes_h_l1381_c7_ec8b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1381_c7_ec8b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1381_c7_ec8b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1381_c7_ec8b_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1381_c7_ec8b]
signal t16_MUX_uxn_opcodes_h_l1381_c7_ec8b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1381_c7_ec8b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1381_c7_ec8b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1381_c7_ec8b_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1381_c7_ec8b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_ec8b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_ec8b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_ec8b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_ec8b_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1381_c7_ec8b]
signal result_stack_value_MUX_uxn_opcodes_h_l1381_c7_ec8b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1381_c7_ec8b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1381_c7_ec8b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1381_c7_ec8b_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1381_c7_ec8b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_ec8b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_ec8b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_ec8b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_ec8b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1381_c7_ec8b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_ec8b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_ec8b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_ec8b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_ec8b_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1381_c7_ec8b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_ec8b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_ec8b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_ec8b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_ec8b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1381_c7_ec8b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_ec8b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_ec8b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_ec8b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_ec8b_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1381_c7_ec8b]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1381_c7_ec8b_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1381_c7_ec8b_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1381_c7_ec8b_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1381_c7_ec8b_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1384_c11_0927]
signal BIN_OP_EQ_uxn_opcodes_h_l1384_c11_0927_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1384_c11_0927_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1384_c11_0927_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1384_c7_be5d]
signal n16_MUX_uxn_opcodes_h_l1384_c7_be5d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1384_c7_be5d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1384_c7_be5d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1384_c7_be5d_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1384_c7_be5d]
signal t16_MUX_uxn_opcodes_h_l1384_c7_be5d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1384_c7_be5d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1384_c7_be5d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1384_c7_be5d_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1384_c7_be5d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_be5d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_be5d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_be5d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_be5d_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1384_c7_be5d]
signal result_stack_value_MUX_uxn_opcodes_h_l1384_c7_be5d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1384_c7_be5d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1384_c7_be5d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1384_c7_be5d_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1384_c7_be5d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_be5d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_be5d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_be5d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_be5d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1384_c7_be5d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_be5d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_be5d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_be5d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_be5d_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1384_c7_be5d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_be5d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_be5d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_be5d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_be5d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1384_c7_be5d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_be5d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_be5d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_be5d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_be5d_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1384_c7_be5d]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_be5d_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_be5d_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_be5d_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_be5d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1389_c11_8c17]
signal BIN_OP_EQ_uxn_opcodes_h_l1389_c11_8c17_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1389_c11_8c17_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1389_c11_8c17_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1389_c7_0fc1]
signal n16_MUX_uxn_opcodes_h_l1389_c7_0fc1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1389_c7_0fc1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1389_c7_0fc1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1389_c7_0fc1_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1389_c7_0fc1]
signal t16_MUX_uxn_opcodes_h_l1389_c7_0fc1_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1389_c7_0fc1_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1389_c7_0fc1_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1389_c7_0fc1_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1389_c7_0fc1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_0fc1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_0fc1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_0fc1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_0fc1_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1389_c7_0fc1]
signal result_stack_value_MUX_uxn_opcodes_h_l1389_c7_0fc1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1389_c7_0fc1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1389_c7_0fc1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1389_c7_0fc1_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1389_c7_0fc1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_0fc1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_0fc1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_0fc1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_0fc1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1389_c7_0fc1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1389_c7_0fc1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1389_c7_0fc1_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1389_c7_0fc1_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1389_c7_0fc1_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1389_c7_0fc1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1389_c7_0fc1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1389_c7_0fc1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1389_c7_0fc1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1389_c7_0fc1_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1389_c7_0fc1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_0fc1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_0fc1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_0fc1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_0fc1_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1389_c7_0fc1]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1389_c7_0fc1_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1389_c7_0fc1_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1389_c7_0fc1_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1389_c7_0fc1_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1392_c11_dd4f]
signal BIN_OP_EQ_uxn_opcodes_h_l1392_c11_dd4f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1392_c11_dd4f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1392_c11_dd4f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1392_c7_d01e]
signal n16_MUX_uxn_opcodes_h_l1392_c7_d01e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1392_c7_d01e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1392_c7_d01e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1392_c7_d01e_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1392_c7_d01e]
signal t16_MUX_uxn_opcodes_h_l1392_c7_d01e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1392_c7_d01e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1392_c7_d01e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1392_c7_d01e_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1392_c7_d01e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1392_c7_d01e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1392_c7_d01e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1392_c7_d01e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1392_c7_d01e_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1392_c7_d01e]
signal result_stack_value_MUX_uxn_opcodes_h_l1392_c7_d01e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1392_c7_d01e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1392_c7_d01e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1392_c7_d01e_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1392_c7_d01e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_d01e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_d01e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_d01e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_d01e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1392_c7_d01e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1392_c7_d01e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1392_c7_d01e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1392_c7_d01e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1392_c7_d01e_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1392_c7_d01e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1392_c7_d01e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1392_c7_d01e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1392_c7_d01e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1392_c7_d01e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1392_c7_d01e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_d01e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_d01e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_d01e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_d01e_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1392_c7_d01e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1392_c7_d01e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1392_c7_d01e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1392_c7_d01e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1392_c7_d01e_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1393_c3_388e]
signal BIN_OP_OR_uxn_opcodes_h_l1393_c3_388e_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1393_c3_388e_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1393_c3_388e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1396_c11_ba2c]
signal BIN_OP_EQ_uxn_opcodes_h_l1396_c11_ba2c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1396_c11_ba2c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1396_c11_ba2c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1396_c7_22a1]
signal n16_MUX_uxn_opcodes_h_l1396_c7_22a1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1396_c7_22a1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1396_c7_22a1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1396_c7_22a1_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1396_c7_22a1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1396_c7_22a1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1396_c7_22a1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1396_c7_22a1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1396_c7_22a1_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1396_c7_22a1]
signal result_stack_value_MUX_uxn_opcodes_h_l1396_c7_22a1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1396_c7_22a1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1396_c7_22a1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1396_c7_22a1_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1396_c7_22a1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1396_c7_22a1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1396_c7_22a1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1396_c7_22a1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1396_c7_22a1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1396_c7_22a1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1396_c7_22a1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1396_c7_22a1_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1396_c7_22a1_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1396_c7_22a1_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1396_c7_22a1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1396_c7_22a1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1396_c7_22a1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1396_c7_22a1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1396_c7_22a1_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1396_c7_22a1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1396_c7_22a1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1396_c7_22a1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1396_c7_22a1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1396_c7_22a1_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1396_c7_22a1]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1396_c7_22a1_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1396_c7_22a1_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1396_c7_22a1_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1396_c7_22a1_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1399_c11_4f7c]
signal BIN_OP_EQ_uxn_opcodes_h_l1399_c11_4f7c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1399_c11_4f7c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1399_c11_4f7c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1399_c7_368d]
signal n16_MUX_uxn_opcodes_h_l1399_c7_368d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1399_c7_368d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1399_c7_368d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1399_c7_368d_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1399_c7_368d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_368d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_368d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_368d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_368d_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1399_c7_368d]
signal result_stack_value_MUX_uxn_opcodes_h_l1399_c7_368d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1399_c7_368d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1399_c7_368d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1399_c7_368d_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1399_c7_368d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_368d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_368d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_368d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_368d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1399_c7_368d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_368d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_368d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_368d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_368d_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1399_c7_368d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_368d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_368d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_368d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_368d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1399_c7_368d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_368d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_368d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_368d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_368d_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1399_c7_368d]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1399_c7_368d_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1399_c7_368d_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1399_c7_368d_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1399_c7_368d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1404_c11_7e37]
signal BIN_OP_EQ_uxn_opcodes_h_l1404_c11_7e37_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1404_c11_7e37_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1404_c11_7e37_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1404_c7_5da5]
signal n16_MUX_uxn_opcodes_h_l1404_c7_5da5_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1404_c7_5da5_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1404_c7_5da5_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1404_c7_5da5_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1404_c7_5da5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1404_c7_5da5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1404_c7_5da5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1404_c7_5da5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1404_c7_5da5_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1404_c7_5da5]
signal result_stack_value_MUX_uxn_opcodes_h_l1404_c7_5da5_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1404_c7_5da5_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1404_c7_5da5_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1404_c7_5da5_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1404_c7_5da5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1404_c7_5da5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1404_c7_5da5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1404_c7_5da5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1404_c7_5da5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1404_c7_5da5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1404_c7_5da5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1404_c7_5da5_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1404_c7_5da5_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1404_c7_5da5_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1404_c7_5da5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1404_c7_5da5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1404_c7_5da5_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1404_c7_5da5_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1404_c7_5da5_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1404_c7_5da5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1404_c7_5da5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1404_c7_5da5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1404_c7_5da5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1404_c7_5da5_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1404_c7_5da5]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1404_c7_5da5_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1404_c7_5da5_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1404_c7_5da5_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1404_c7_5da5_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1407_c11_81bc]
signal BIN_OP_EQ_uxn_opcodes_h_l1407_c11_81bc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1407_c11_81bc_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1407_c11_81bc_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1407_c7_e078]
signal n16_MUX_uxn_opcodes_h_l1407_c7_e078_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1407_c7_e078_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1407_c7_e078_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1407_c7_e078_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1407_c7_e078]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_e078_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_e078_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_e078_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_e078_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1407_c7_e078]
signal result_stack_value_MUX_uxn_opcodes_h_l1407_c7_e078_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1407_c7_e078_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1407_c7_e078_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1407_c7_e078_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1407_c7_e078]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_e078_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_e078_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_e078_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_e078_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1407_c7_e078]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_e078_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_e078_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_e078_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_e078_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1407_c7_e078]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_e078_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_e078_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_e078_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_e078_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1407_c7_e078]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_e078_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_e078_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_e078_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_e078_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1407_c7_e078]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1407_c7_e078_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1407_c7_e078_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1407_c7_e078_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1407_c7_e078_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1408_c3_c849]
signal BIN_OP_OR_uxn_opcodes_h_l1408_c3_c849_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1408_c3_c849_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1408_c3_c849_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1411_c32_747e]
signal BIN_OP_AND_uxn_opcodes_h_l1411_c32_747e_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1411_c32_747e_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1411_c32_747e_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1411_c32_b700]
signal BIN_OP_GT_uxn_opcodes_h_l1411_c32_b700_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1411_c32_b700_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1411_c32_b700_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1411_c32_3862]
signal MUX_uxn_opcodes_h_l1411_c32_3862_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1411_c32_3862_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1411_c32_3862_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1411_c32_3862_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1413_c11_e35d]
signal BIN_OP_EQ_uxn_opcodes_h_l1413_c11_e35d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1413_c11_e35d_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1413_c11_e35d_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1413_c7_8cad]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_8cad_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_8cad_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_8cad_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_8cad_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1413_c7_8cad]
signal result_stack_value_MUX_uxn_opcodes_h_l1413_c7_8cad_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1413_c7_8cad_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1413_c7_8cad_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1413_c7_8cad_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1413_c7_8cad]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_8cad_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_8cad_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_8cad_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_8cad_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1413_c7_8cad]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_8cad_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_8cad_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_8cad_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_8cad_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1413_c7_8cad]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_8cad_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_8cad_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_8cad_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_8cad_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1417_c24_4d82]
signal BIN_OP_EQ_uxn_opcodes_h_l1417_c24_4d82_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1417_c24_4d82_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1417_c24_4d82_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1417_c24_6620]
signal MUX_uxn_opcodes_h_l1417_c24_6620_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1417_c24_6620_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1417_c24_6620_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1417_c24_6620_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1419_c11_e1f9]
signal BIN_OP_EQ_uxn_opcodes_h_l1419_c11_e1f9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1419_c11_e1f9_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1419_c11_e1f9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1419_c7_428f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_428f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_428f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_428f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_428f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1419_c7_428f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_428f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_428f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_428f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_428f_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1401_l1386_DUPLICATE_feb8
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1401_l1386_DUPLICATE_feb8_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1401_l1386_DUPLICATE_feb8_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_287e( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : signed;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_sp_shift := ref_toks_1;
      base.stack_value := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.is_stack_read := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1375_c6_4b16
BIN_OP_EQ_uxn_opcodes_h_l1375_c6_4b16 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1375_c6_4b16_left,
BIN_OP_EQ_uxn_opcodes_h_l1375_c6_4b16_right,
BIN_OP_EQ_uxn_opcodes_h_l1375_c6_4b16_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1375_c1_37d1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1375_c1_37d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1375_c1_37d1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1375_c1_37d1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1375_c1_37d1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1375_c1_37d1_return_output);

-- n16_MUX_uxn_opcodes_h_l1375_c2_a13e
n16_MUX_uxn_opcodes_h_l1375_c2_a13e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1375_c2_a13e_cond,
n16_MUX_uxn_opcodes_h_l1375_c2_a13e_iftrue,
n16_MUX_uxn_opcodes_h_l1375_c2_a13e_iffalse,
n16_MUX_uxn_opcodes_h_l1375_c2_a13e_return_output);

-- t16_MUX_uxn_opcodes_h_l1375_c2_a13e
t16_MUX_uxn_opcodes_h_l1375_c2_a13e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1375_c2_a13e_cond,
t16_MUX_uxn_opcodes_h_l1375_c2_a13e_iftrue,
t16_MUX_uxn_opcodes_h_l1375_c2_a13e_iffalse,
t16_MUX_uxn_opcodes_h_l1375_c2_a13e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1375_c2_a13e
result_is_sp_shift_MUX_uxn_opcodes_h_l1375_c2_a13e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1375_c2_a13e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1375_c2_a13e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1375_c2_a13e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1375_c2_a13e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1375_c2_a13e
result_stack_value_MUX_uxn_opcodes_h_l1375_c2_a13e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1375_c2_a13e_cond,
result_stack_value_MUX_uxn_opcodes_h_l1375_c2_a13e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1375_c2_a13e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1375_c2_a13e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1375_c2_a13e
result_is_stack_write_MUX_uxn_opcodes_h_l1375_c2_a13e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1375_c2_a13e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1375_c2_a13e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1375_c2_a13e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1375_c2_a13e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1375_c2_a13e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1375_c2_a13e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1375_c2_a13e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1375_c2_a13e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1375_c2_a13e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1375_c2_a13e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c2_a13e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c2_a13e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c2_a13e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c2_a13e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c2_a13e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c2_a13e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1375_c2_a13e
result_is_opc_done_MUX_uxn_opcodes_h_l1375_c2_a13e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1375_c2_a13e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1375_c2_a13e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1375_c2_a13e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1375_c2_a13e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1375_c2_a13e
result_is_stack_read_MUX_uxn_opcodes_h_l1375_c2_a13e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1375_c2_a13e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1375_c2_a13e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1375_c2_a13e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1375_c2_a13e_return_output);

-- printf_uxn_opcodes_h_l1376_c3_b559_uxn_opcodes_h_l1376_c3_b559
printf_uxn_opcodes_h_l1376_c3_b559_uxn_opcodes_h_l1376_c3_b559 : entity work.printf_uxn_opcodes_h_l1376_c3_b559_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1376_c3_b559_uxn_opcodes_h_l1376_c3_b559_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1381_c11_2572
BIN_OP_EQ_uxn_opcodes_h_l1381_c11_2572 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1381_c11_2572_left,
BIN_OP_EQ_uxn_opcodes_h_l1381_c11_2572_right,
BIN_OP_EQ_uxn_opcodes_h_l1381_c11_2572_return_output);

-- n16_MUX_uxn_opcodes_h_l1381_c7_ec8b
n16_MUX_uxn_opcodes_h_l1381_c7_ec8b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1381_c7_ec8b_cond,
n16_MUX_uxn_opcodes_h_l1381_c7_ec8b_iftrue,
n16_MUX_uxn_opcodes_h_l1381_c7_ec8b_iffalse,
n16_MUX_uxn_opcodes_h_l1381_c7_ec8b_return_output);

-- t16_MUX_uxn_opcodes_h_l1381_c7_ec8b
t16_MUX_uxn_opcodes_h_l1381_c7_ec8b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1381_c7_ec8b_cond,
t16_MUX_uxn_opcodes_h_l1381_c7_ec8b_iftrue,
t16_MUX_uxn_opcodes_h_l1381_c7_ec8b_iffalse,
t16_MUX_uxn_opcodes_h_l1381_c7_ec8b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_ec8b
result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_ec8b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_ec8b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_ec8b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_ec8b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_ec8b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1381_c7_ec8b
result_stack_value_MUX_uxn_opcodes_h_l1381_c7_ec8b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1381_c7_ec8b_cond,
result_stack_value_MUX_uxn_opcodes_h_l1381_c7_ec8b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1381_c7_ec8b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1381_c7_ec8b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_ec8b
result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_ec8b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_ec8b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_ec8b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_ec8b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_ec8b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_ec8b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_ec8b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_ec8b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_ec8b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_ec8b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_ec8b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_ec8b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_ec8b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_ec8b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_ec8b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_ec8b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_ec8b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_ec8b
result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_ec8b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_ec8b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_ec8b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_ec8b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_ec8b_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1381_c7_ec8b
result_is_stack_read_MUX_uxn_opcodes_h_l1381_c7_ec8b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1381_c7_ec8b_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1381_c7_ec8b_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1381_c7_ec8b_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1381_c7_ec8b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1384_c11_0927
BIN_OP_EQ_uxn_opcodes_h_l1384_c11_0927 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1384_c11_0927_left,
BIN_OP_EQ_uxn_opcodes_h_l1384_c11_0927_right,
BIN_OP_EQ_uxn_opcodes_h_l1384_c11_0927_return_output);

-- n16_MUX_uxn_opcodes_h_l1384_c7_be5d
n16_MUX_uxn_opcodes_h_l1384_c7_be5d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1384_c7_be5d_cond,
n16_MUX_uxn_opcodes_h_l1384_c7_be5d_iftrue,
n16_MUX_uxn_opcodes_h_l1384_c7_be5d_iffalse,
n16_MUX_uxn_opcodes_h_l1384_c7_be5d_return_output);

-- t16_MUX_uxn_opcodes_h_l1384_c7_be5d
t16_MUX_uxn_opcodes_h_l1384_c7_be5d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1384_c7_be5d_cond,
t16_MUX_uxn_opcodes_h_l1384_c7_be5d_iftrue,
t16_MUX_uxn_opcodes_h_l1384_c7_be5d_iffalse,
t16_MUX_uxn_opcodes_h_l1384_c7_be5d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_be5d
result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_be5d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_be5d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_be5d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_be5d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_be5d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1384_c7_be5d
result_stack_value_MUX_uxn_opcodes_h_l1384_c7_be5d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1384_c7_be5d_cond,
result_stack_value_MUX_uxn_opcodes_h_l1384_c7_be5d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1384_c7_be5d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1384_c7_be5d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_be5d
result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_be5d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_be5d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_be5d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_be5d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_be5d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_be5d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_be5d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_be5d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_be5d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_be5d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_be5d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_be5d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_be5d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_be5d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_be5d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_be5d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_be5d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_be5d
result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_be5d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_be5d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_be5d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_be5d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_be5d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_be5d
result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_be5d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_be5d_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_be5d_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_be5d_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_be5d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1389_c11_8c17
BIN_OP_EQ_uxn_opcodes_h_l1389_c11_8c17 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1389_c11_8c17_left,
BIN_OP_EQ_uxn_opcodes_h_l1389_c11_8c17_right,
BIN_OP_EQ_uxn_opcodes_h_l1389_c11_8c17_return_output);

-- n16_MUX_uxn_opcodes_h_l1389_c7_0fc1
n16_MUX_uxn_opcodes_h_l1389_c7_0fc1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1389_c7_0fc1_cond,
n16_MUX_uxn_opcodes_h_l1389_c7_0fc1_iftrue,
n16_MUX_uxn_opcodes_h_l1389_c7_0fc1_iffalse,
n16_MUX_uxn_opcodes_h_l1389_c7_0fc1_return_output);

-- t16_MUX_uxn_opcodes_h_l1389_c7_0fc1
t16_MUX_uxn_opcodes_h_l1389_c7_0fc1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1389_c7_0fc1_cond,
t16_MUX_uxn_opcodes_h_l1389_c7_0fc1_iftrue,
t16_MUX_uxn_opcodes_h_l1389_c7_0fc1_iffalse,
t16_MUX_uxn_opcodes_h_l1389_c7_0fc1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_0fc1
result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_0fc1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_0fc1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_0fc1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_0fc1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_0fc1_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1389_c7_0fc1
result_stack_value_MUX_uxn_opcodes_h_l1389_c7_0fc1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1389_c7_0fc1_cond,
result_stack_value_MUX_uxn_opcodes_h_l1389_c7_0fc1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1389_c7_0fc1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1389_c7_0fc1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_0fc1
result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_0fc1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_0fc1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_0fc1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_0fc1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_0fc1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1389_c7_0fc1
result_sp_relative_shift_MUX_uxn_opcodes_h_l1389_c7_0fc1 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1389_c7_0fc1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1389_c7_0fc1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1389_c7_0fc1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1389_c7_0fc1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1389_c7_0fc1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1389_c7_0fc1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1389_c7_0fc1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1389_c7_0fc1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1389_c7_0fc1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1389_c7_0fc1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_0fc1
result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_0fc1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_0fc1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_0fc1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_0fc1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_0fc1_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1389_c7_0fc1
result_is_stack_read_MUX_uxn_opcodes_h_l1389_c7_0fc1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1389_c7_0fc1_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1389_c7_0fc1_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1389_c7_0fc1_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1389_c7_0fc1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1392_c11_dd4f
BIN_OP_EQ_uxn_opcodes_h_l1392_c11_dd4f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1392_c11_dd4f_left,
BIN_OP_EQ_uxn_opcodes_h_l1392_c11_dd4f_right,
BIN_OP_EQ_uxn_opcodes_h_l1392_c11_dd4f_return_output);

-- n16_MUX_uxn_opcodes_h_l1392_c7_d01e
n16_MUX_uxn_opcodes_h_l1392_c7_d01e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1392_c7_d01e_cond,
n16_MUX_uxn_opcodes_h_l1392_c7_d01e_iftrue,
n16_MUX_uxn_opcodes_h_l1392_c7_d01e_iffalse,
n16_MUX_uxn_opcodes_h_l1392_c7_d01e_return_output);

-- t16_MUX_uxn_opcodes_h_l1392_c7_d01e
t16_MUX_uxn_opcodes_h_l1392_c7_d01e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1392_c7_d01e_cond,
t16_MUX_uxn_opcodes_h_l1392_c7_d01e_iftrue,
t16_MUX_uxn_opcodes_h_l1392_c7_d01e_iffalse,
t16_MUX_uxn_opcodes_h_l1392_c7_d01e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1392_c7_d01e
result_is_sp_shift_MUX_uxn_opcodes_h_l1392_c7_d01e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1392_c7_d01e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1392_c7_d01e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1392_c7_d01e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1392_c7_d01e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1392_c7_d01e
result_stack_value_MUX_uxn_opcodes_h_l1392_c7_d01e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1392_c7_d01e_cond,
result_stack_value_MUX_uxn_opcodes_h_l1392_c7_d01e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1392_c7_d01e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1392_c7_d01e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_d01e
result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_d01e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_d01e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_d01e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_d01e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_d01e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1392_c7_d01e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1392_c7_d01e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1392_c7_d01e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1392_c7_d01e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1392_c7_d01e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1392_c7_d01e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1392_c7_d01e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1392_c7_d01e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1392_c7_d01e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1392_c7_d01e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1392_c7_d01e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1392_c7_d01e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_d01e
result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_d01e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_d01e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_d01e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_d01e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_d01e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1392_c7_d01e
result_is_stack_read_MUX_uxn_opcodes_h_l1392_c7_d01e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1392_c7_d01e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1392_c7_d01e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1392_c7_d01e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1392_c7_d01e_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1393_c3_388e
BIN_OP_OR_uxn_opcodes_h_l1393_c3_388e : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1393_c3_388e_left,
BIN_OP_OR_uxn_opcodes_h_l1393_c3_388e_right,
BIN_OP_OR_uxn_opcodes_h_l1393_c3_388e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1396_c11_ba2c
BIN_OP_EQ_uxn_opcodes_h_l1396_c11_ba2c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1396_c11_ba2c_left,
BIN_OP_EQ_uxn_opcodes_h_l1396_c11_ba2c_right,
BIN_OP_EQ_uxn_opcodes_h_l1396_c11_ba2c_return_output);

-- n16_MUX_uxn_opcodes_h_l1396_c7_22a1
n16_MUX_uxn_opcodes_h_l1396_c7_22a1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1396_c7_22a1_cond,
n16_MUX_uxn_opcodes_h_l1396_c7_22a1_iftrue,
n16_MUX_uxn_opcodes_h_l1396_c7_22a1_iffalse,
n16_MUX_uxn_opcodes_h_l1396_c7_22a1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1396_c7_22a1
result_is_sp_shift_MUX_uxn_opcodes_h_l1396_c7_22a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1396_c7_22a1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1396_c7_22a1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1396_c7_22a1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1396_c7_22a1_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1396_c7_22a1
result_stack_value_MUX_uxn_opcodes_h_l1396_c7_22a1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1396_c7_22a1_cond,
result_stack_value_MUX_uxn_opcodes_h_l1396_c7_22a1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1396_c7_22a1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1396_c7_22a1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1396_c7_22a1
result_is_stack_write_MUX_uxn_opcodes_h_l1396_c7_22a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1396_c7_22a1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1396_c7_22a1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1396_c7_22a1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1396_c7_22a1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1396_c7_22a1
result_sp_relative_shift_MUX_uxn_opcodes_h_l1396_c7_22a1 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1396_c7_22a1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1396_c7_22a1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1396_c7_22a1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1396_c7_22a1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1396_c7_22a1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1396_c7_22a1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1396_c7_22a1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1396_c7_22a1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1396_c7_22a1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1396_c7_22a1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1396_c7_22a1
result_is_opc_done_MUX_uxn_opcodes_h_l1396_c7_22a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1396_c7_22a1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1396_c7_22a1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1396_c7_22a1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1396_c7_22a1_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1396_c7_22a1
result_is_stack_read_MUX_uxn_opcodes_h_l1396_c7_22a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1396_c7_22a1_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1396_c7_22a1_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1396_c7_22a1_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1396_c7_22a1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1399_c11_4f7c
BIN_OP_EQ_uxn_opcodes_h_l1399_c11_4f7c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1399_c11_4f7c_left,
BIN_OP_EQ_uxn_opcodes_h_l1399_c11_4f7c_right,
BIN_OP_EQ_uxn_opcodes_h_l1399_c11_4f7c_return_output);

-- n16_MUX_uxn_opcodes_h_l1399_c7_368d
n16_MUX_uxn_opcodes_h_l1399_c7_368d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1399_c7_368d_cond,
n16_MUX_uxn_opcodes_h_l1399_c7_368d_iftrue,
n16_MUX_uxn_opcodes_h_l1399_c7_368d_iffalse,
n16_MUX_uxn_opcodes_h_l1399_c7_368d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_368d
result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_368d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_368d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_368d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_368d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_368d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1399_c7_368d
result_stack_value_MUX_uxn_opcodes_h_l1399_c7_368d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1399_c7_368d_cond,
result_stack_value_MUX_uxn_opcodes_h_l1399_c7_368d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1399_c7_368d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1399_c7_368d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_368d
result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_368d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_368d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_368d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_368d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_368d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_368d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_368d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_368d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_368d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_368d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_368d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_368d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_368d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_368d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_368d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_368d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_368d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_368d
result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_368d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_368d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_368d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_368d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_368d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1399_c7_368d
result_is_stack_read_MUX_uxn_opcodes_h_l1399_c7_368d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1399_c7_368d_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1399_c7_368d_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1399_c7_368d_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1399_c7_368d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1404_c11_7e37
BIN_OP_EQ_uxn_opcodes_h_l1404_c11_7e37 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1404_c11_7e37_left,
BIN_OP_EQ_uxn_opcodes_h_l1404_c11_7e37_right,
BIN_OP_EQ_uxn_opcodes_h_l1404_c11_7e37_return_output);

-- n16_MUX_uxn_opcodes_h_l1404_c7_5da5
n16_MUX_uxn_opcodes_h_l1404_c7_5da5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1404_c7_5da5_cond,
n16_MUX_uxn_opcodes_h_l1404_c7_5da5_iftrue,
n16_MUX_uxn_opcodes_h_l1404_c7_5da5_iffalse,
n16_MUX_uxn_opcodes_h_l1404_c7_5da5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1404_c7_5da5
result_is_sp_shift_MUX_uxn_opcodes_h_l1404_c7_5da5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1404_c7_5da5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1404_c7_5da5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1404_c7_5da5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1404_c7_5da5_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1404_c7_5da5
result_stack_value_MUX_uxn_opcodes_h_l1404_c7_5da5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1404_c7_5da5_cond,
result_stack_value_MUX_uxn_opcodes_h_l1404_c7_5da5_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1404_c7_5da5_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1404_c7_5da5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1404_c7_5da5
result_is_stack_write_MUX_uxn_opcodes_h_l1404_c7_5da5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1404_c7_5da5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1404_c7_5da5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1404_c7_5da5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1404_c7_5da5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1404_c7_5da5
result_sp_relative_shift_MUX_uxn_opcodes_h_l1404_c7_5da5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1404_c7_5da5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1404_c7_5da5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1404_c7_5da5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1404_c7_5da5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1404_c7_5da5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1404_c7_5da5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1404_c7_5da5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1404_c7_5da5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1404_c7_5da5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1404_c7_5da5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1404_c7_5da5
result_is_opc_done_MUX_uxn_opcodes_h_l1404_c7_5da5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1404_c7_5da5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1404_c7_5da5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1404_c7_5da5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1404_c7_5da5_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1404_c7_5da5
result_is_stack_read_MUX_uxn_opcodes_h_l1404_c7_5da5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1404_c7_5da5_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1404_c7_5da5_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1404_c7_5da5_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1404_c7_5da5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1407_c11_81bc
BIN_OP_EQ_uxn_opcodes_h_l1407_c11_81bc : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1407_c11_81bc_left,
BIN_OP_EQ_uxn_opcodes_h_l1407_c11_81bc_right,
BIN_OP_EQ_uxn_opcodes_h_l1407_c11_81bc_return_output);

-- n16_MUX_uxn_opcodes_h_l1407_c7_e078
n16_MUX_uxn_opcodes_h_l1407_c7_e078 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1407_c7_e078_cond,
n16_MUX_uxn_opcodes_h_l1407_c7_e078_iftrue,
n16_MUX_uxn_opcodes_h_l1407_c7_e078_iffalse,
n16_MUX_uxn_opcodes_h_l1407_c7_e078_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_e078
result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_e078 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_e078_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_e078_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_e078_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_e078_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1407_c7_e078
result_stack_value_MUX_uxn_opcodes_h_l1407_c7_e078 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1407_c7_e078_cond,
result_stack_value_MUX_uxn_opcodes_h_l1407_c7_e078_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1407_c7_e078_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1407_c7_e078_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_e078
result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_e078 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_e078_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_e078_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_e078_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_e078_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_e078
result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_e078 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_e078_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_e078_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_e078_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_e078_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_e078
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_e078 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_e078_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_e078_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_e078_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_e078_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_e078
result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_e078 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_e078_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_e078_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_e078_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_e078_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1407_c7_e078
result_is_stack_read_MUX_uxn_opcodes_h_l1407_c7_e078 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1407_c7_e078_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1407_c7_e078_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1407_c7_e078_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1407_c7_e078_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1408_c3_c849
BIN_OP_OR_uxn_opcodes_h_l1408_c3_c849 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1408_c3_c849_left,
BIN_OP_OR_uxn_opcodes_h_l1408_c3_c849_right,
BIN_OP_OR_uxn_opcodes_h_l1408_c3_c849_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1411_c32_747e
BIN_OP_AND_uxn_opcodes_h_l1411_c32_747e : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1411_c32_747e_left,
BIN_OP_AND_uxn_opcodes_h_l1411_c32_747e_right,
BIN_OP_AND_uxn_opcodes_h_l1411_c32_747e_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1411_c32_b700
BIN_OP_GT_uxn_opcodes_h_l1411_c32_b700 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1411_c32_b700_left,
BIN_OP_GT_uxn_opcodes_h_l1411_c32_b700_right,
BIN_OP_GT_uxn_opcodes_h_l1411_c32_b700_return_output);

-- MUX_uxn_opcodes_h_l1411_c32_3862
MUX_uxn_opcodes_h_l1411_c32_3862 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1411_c32_3862_cond,
MUX_uxn_opcodes_h_l1411_c32_3862_iftrue,
MUX_uxn_opcodes_h_l1411_c32_3862_iffalse,
MUX_uxn_opcodes_h_l1411_c32_3862_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1413_c11_e35d
BIN_OP_EQ_uxn_opcodes_h_l1413_c11_e35d : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1413_c11_e35d_left,
BIN_OP_EQ_uxn_opcodes_h_l1413_c11_e35d_right,
BIN_OP_EQ_uxn_opcodes_h_l1413_c11_e35d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_8cad
result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_8cad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_8cad_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_8cad_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_8cad_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_8cad_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1413_c7_8cad
result_stack_value_MUX_uxn_opcodes_h_l1413_c7_8cad : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1413_c7_8cad_cond,
result_stack_value_MUX_uxn_opcodes_h_l1413_c7_8cad_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1413_c7_8cad_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1413_c7_8cad_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_8cad
result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_8cad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_8cad_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_8cad_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_8cad_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_8cad_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_8cad
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_8cad : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_8cad_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_8cad_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_8cad_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_8cad_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_8cad
result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_8cad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_8cad_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_8cad_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_8cad_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_8cad_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1417_c24_4d82
BIN_OP_EQ_uxn_opcodes_h_l1417_c24_4d82 : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1417_c24_4d82_left,
BIN_OP_EQ_uxn_opcodes_h_l1417_c24_4d82_right,
BIN_OP_EQ_uxn_opcodes_h_l1417_c24_4d82_return_output);

-- MUX_uxn_opcodes_h_l1417_c24_6620
MUX_uxn_opcodes_h_l1417_c24_6620 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1417_c24_6620_cond,
MUX_uxn_opcodes_h_l1417_c24_6620_iftrue,
MUX_uxn_opcodes_h_l1417_c24_6620_iffalse,
MUX_uxn_opcodes_h_l1417_c24_6620_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1419_c11_e1f9
BIN_OP_EQ_uxn_opcodes_h_l1419_c11_e1f9 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1419_c11_e1f9_left,
BIN_OP_EQ_uxn_opcodes_h_l1419_c11_e1f9_right,
BIN_OP_EQ_uxn_opcodes_h_l1419_c11_e1f9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_428f
result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_428f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_428f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_428f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_428f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_428f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_428f
result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_428f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_428f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_428f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_428f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_428f_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1401_l1386_DUPLICATE_feb8
CONST_SL_8_uint16_t_uxn_opcodes_h_l1401_l1386_DUPLICATE_feb8 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1401_l1386_DUPLICATE_feb8_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1401_l1386_DUPLICATE_feb8_return_output);



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
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1375_c6_4b16_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1375_c1_37d1_return_output,
 n16_MUX_uxn_opcodes_h_l1375_c2_a13e_return_output,
 t16_MUX_uxn_opcodes_h_l1375_c2_a13e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1375_c2_a13e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1375_c2_a13e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1375_c2_a13e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1375_c2_a13e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c2_a13e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1375_c2_a13e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1375_c2_a13e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1381_c11_2572_return_output,
 n16_MUX_uxn_opcodes_h_l1381_c7_ec8b_return_output,
 t16_MUX_uxn_opcodes_h_l1381_c7_ec8b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_ec8b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1381_c7_ec8b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_ec8b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_ec8b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_ec8b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_ec8b_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1381_c7_ec8b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1384_c11_0927_return_output,
 n16_MUX_uxn_opcodes_h_l1384_c7_be5d_return_output,
 t16_MUX_uxn_opcodes_h_l1384_c7_be5d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_be5d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1384_c7_be5d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_be5d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_be5d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_be5d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_be5d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_be5d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1389_c11_8c17_return_output,
 n16_MUX_uxn_opcodes_h_l1389_c7_0fc1_return_output,
 t16_MUX_uxn_opcodes_h_l1389_c7_0fc1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_0fc1_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1389_c7_0fc1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_0fc1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1389_c7_0fc1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1389_c7_0fc1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_0fc1_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1389_c7_0fc1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1392_c11_dd4f_return_output,
 n16_MUX_uxn_opcodes_h_l1392_c7_d01e_return_output,
 t16_MUX_uxn_opcodes_h_l1392_c7_d01e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1392_c7_d01e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1392_c7_d01e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_d01e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1392_c7_d01e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1392_c7_d01e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_d01e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1392_c7_d01e_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1393_c3_388e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1396_c11_ba2c_return_output,
 n16_MUX_uxn_opcodes_h_l1396_c7_22a1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1396_c7_22a1_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1396_c7_22a1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1396_c7_22a1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1396_c7_22a1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1396_c7_22a1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1396_c7_22a1_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1396_c7_22a1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1399_c11_4f7c_return_output,
 n16_MUX_uxn_opcodes_h_l1399_c7_368d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_368d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1399_c7_368d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_368d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_368d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_368d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_368d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1399_c7_368d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1404_c11_7e37_return_output,
 n16_MUX_uxn_opcodes_h_l1404_c7_5da5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1404_c7_5da5_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1404_c7_5da5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1404_c7_5da5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1404_c7_5da5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1404_c7_5da5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1404_c7_5da5_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1404_c7_5da5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1407_c11_81bc_return_output,
 n16_MUX_uxn_opcodes_h_l1407_c7_e078_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_e078_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1407_c7_e078_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_e078_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_e078_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_e078_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_e078_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1407_c7_e078_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1408_c3_c849_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1411_c32_747e_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1411_c32_b700_return_output,
 MUX_uxn_opcodes_h_l1411_c32_3862_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1413_c11_e35d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_8cad_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1413_c7_8cad_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_8cad_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_8cad_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_8cad_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1417_c24_4d82_return_output,
 MUX_uxn_opcodes_h_l1417_c24_6620_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1419_c11_e1f9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_428f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_428f_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1401_l1386_DUPLICATE_feb8_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1375_c6_4b16_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1375_c6_4b16_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1375_c6_4b16_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1375_c1_37d1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1375_c1_37d1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1375_c1_37d1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1375_c1_37d1_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1375_c2_a13e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1375_c2_a13e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1381_c7_ec8b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1375_c2_a13e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1375_c2_a13e_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1375_c2_a13e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1375_c2_a13e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1381_c7_ec8b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1375_c2_a13e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1375_c2_a13e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1375_c2_a13e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1375_c2_a13e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_ec8b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1375_c2_a13e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1375_c2_a13e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1375_c2_a13e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1375_c2_a13e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1381_c7_ec8b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1375_c2_a13e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1375_c2_a13e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1375_c2_a13e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1375_c2_a13e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_ec8b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1375_c2_a13e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1375_c2_a13e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1375_c2_a13e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1375_c2_a13e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_ec8b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1375_c2_a13e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1375_c2_a13e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c2_a13e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1378_c3_249e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c2_a13e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_ec8b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c2_a13e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c2_a13e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1375_c2_a13e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1375_c2_a13e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_ec8b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1375_c2_a13e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1375_c2_a13e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1375_c2_a13e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1375_c2_a13e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1381_c7_ec8b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1375_c2_a13e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1375_c2_a13e_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1376_c3_b559_uxn_opcodes_h_l1376_c3_b559_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_2572_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_2572_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_2572_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1381_c7_ec8b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1381_c7_ec8b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1384_c7_be5d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1381_c7_ec8b_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1381_c7_ec8b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1381_c7_ec8b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1384_c7_be5d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1381_c7_ec8b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_ec8b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_ec8b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_be5d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_ec8b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1381_c7_ec8b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1381_c7_ec8b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1384_c7_be5d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1381_c7_ec8b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_ec8b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_ec8b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_be5d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_ec8b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_ec8b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_ec8b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_be5d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_ec8b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_ec8b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1382_c3_7462 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_ec8b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_be5d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_ec8b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_ec8b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_ec8b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_be5d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_ec8b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1381_c7_ec8b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1381_c7_ec8b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_be5d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1381_c7_ec8b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_0927_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_0927_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_0927_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1384_c7_be5d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1384_c7_be5d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1389_c7_0fc1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1384_c7_be5d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1384_c7_be5d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1384_c7_be5d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1389_c7_0fc1_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1384_c7_be5d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_be5d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_be5d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_0fc1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_be5d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1384_c7_be5d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1384_c7_be5d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1389_c7_0fc1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1384_c7_be5d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_be5d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_be5d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_0fc1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_be5d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_be5d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_be5d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1389_c7_0fc1_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_be5d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_be5d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1387_c3_792c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_be5d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1389_c7_0fc1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_be5d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_be5d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_be5d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_0fc1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_be5d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_be5d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_be5d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1389_c7_0fc1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_be5d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1389_c11_8c17_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1389_c11_8c17_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1389_c11_8c17_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1389_c7_0fc1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1389_c7_0fc1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1392_c7_d01e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1389_c7_0fc1_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1389_c7_0fc1_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1389_c7_0fc1_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1392_c7_d01e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1389_c7_0fc1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_0fc1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_0fc1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1392_c7_d01e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_0fc1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1389_c7_0fc1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1389_c7_0fc1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1392_c7_d01e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1389_c7_0fc1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_0fc1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_0fc1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_d01e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_0fc1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1389_c7_0fc1_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1389_c7_0fc1_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1392_c7_d01e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1389_c7_0fc1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1389_c7_0fc1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1390_c3_5fa8 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1389_c7_0fc1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1392_c7_d01e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1389_c7_0fc1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_0fc1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_0fc1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_d01e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_0fc1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1389_c7_0fc1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1389_c7_0fc1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1392_c7_d01e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1389_c7_0fc1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1392_c11_dd4f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1392_c11_dd4f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1392_c11_dd4f_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1392_c7_d01e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1392_c7_d01e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1396_c7_22a1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1392_c7_d01e_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1392_c7_d01e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1392_c7_d01e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1392_c7_d01e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1392_c7_d01e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1392_c7_d01e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1396_c7_22a1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1392_c7_d01e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1392_c7_d01e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1392_c7_d01e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1396_c7_22a1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1392_c7_d01e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_d01e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_d01e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1396_c7_22a1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_d01e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1392_c7_d01e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1392_c7_d01e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1396_c7_22a1_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1392_c7_d01e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1392_c7_d01e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1394_c3_545b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1392_c7_d01e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1396_c7_22a1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1392_c7_d01e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_d01e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_d01e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1396_c7_22a1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_d01e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1392_c7_d01e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1392_c7_d01e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1396_c7_22a1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1392_c7_d01e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1393_c3_388e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1393_c3_388e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1393_c3_388e_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1396_c11_ba2c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1396_c11_ba2c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1396_c11_ba2c_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1396_c7_22a1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1396_c7_22a1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1399_c7_368d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1396_c7_22a1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1396_c7_22a1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1396_c7_22a1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_368d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1396_c7_22a1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1396_c7_22a1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1396_c7_22a1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1399_c7_368d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1396_c7_22a1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1396_c7_22a1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1396_c7_22a1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_368d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1396_c7_22a1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1396_c7_22a1_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1396_c7_22a1_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_368d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1396_c7_22a1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1396_c7_22a1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1397_c3_fc01 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1396_c7_22a1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_368d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1396_c7_22a1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1396_c7_22a1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1396_c7_22a1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_368d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1396_c7_22a1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1396_c7_22a1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1396_c7_22a1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1399_c7_368d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1396_c7_22a1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_4f7c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_4f7c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_4f7c_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1399_c7_368d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1399_c7_368d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1404_c7_5da5_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1399_c7_368d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_368d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_368d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1404_c7_5da5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_368d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1399_c7_368d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1399_c7_368d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1404_c7_5da5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1399_c7_368d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_368d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_368d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1404_c7_5da5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_368d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_368d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_368d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1404_c7_5da5_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_368d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_368d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1402_c3_7da1 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_368d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1404_c7_5da5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_368d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_368d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_368d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1404_c7_5da5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_368d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1399_c7_368d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1399_c7_368d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1404_c7_5da5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1399_c7_368d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1404_c11_7e37_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1404_c11_7e37_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1404_c11_7e37_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1404_c7_5da5_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1404_c7_5da5_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1407_c7_e078_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1404_c7_5da5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1404_c7_5da5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1404_c7_5da5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_e078_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1404_c7_5da5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1404_c7_5da5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1404_c7_5da5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1407_c7_e078_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1404_c7_5da5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1404_c7_5da5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1404_c7_5da5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_e078_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1404_c7_5da5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1404_c7_5da5_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1404_c7_5da5_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_e078_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1404_c7_5da5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1404_c7_5da5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1405_c3_9e35 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1404_c7_5da5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_e078_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1404_c7_5da5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1404_c7_5da5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1404_c7_5da5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_e078_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1404_c7_5da5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1404_c7_5da5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1404_c7_5da5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1407_c7_e078_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1404_c7_5da5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_81bc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_81bc_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_81bc_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1407_c7_e078_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1407_c7_e078_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1407_c7_e078_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_e078_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_e078_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_8cad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_e078_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1407_c7_e078_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1407_c7_e078_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1413_c7_8cad_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1407_c7_e078_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_e078_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_e078_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_8cad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_e078_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_e078_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_e078_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_e078_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_e078_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_e078_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_8cad_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_e078_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_e078_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_e078_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_8cad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_e078_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1407_c7_e078_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1407_c7_e078_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1407_c7_e078_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1408_c3_c849_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1408_c3_c849_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1408_c3_c849_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1411_c32_3862_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1411_c32_3862_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1411_c32_3862_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1411_c32_747e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1411_c32_747e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1411_c32_747e_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1411_c32_b700_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1411_c32_b700_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1411_c32_b700_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1411_c32_3862_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1413_c11_e35d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1413_c11_e35d_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1413_c11_e35d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_8cad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_8cad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_8cad_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1413_c7_8cad_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1413_c7_8cad_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1413_c7_8cad_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_8cad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_8cad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_428f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_8cad_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_8cad_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1416_c3_0c2c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_8cad_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_8cad_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_8cad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_8cad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_428f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_8cad_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1417_c24_6620_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1417_c24_6620_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1417_c24_6620_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1417_c24_4d82_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1417_c24_4d82_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1417_c24_4d82_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1417_c24_6620_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_e1f9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_e1f9_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_e1f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_428f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_428f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_428f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_428f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_428f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_428f_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1384_l1381_l1404_l1375_l1399_l1396_l1392_l1389_l1413_DUPLICATE_17ae_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1384_l1407_l1381_l1404_l1375_l1399_l1396_l1392_l1389_l1413_DUPLICATE_2114_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1384_l1407_l1381_l1404_l1375_l1399_l1396_l1392_l1419_l1389_DUPLICATE_efba_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1384_l1407_l1381_l1404_l1375_l1399_l1396_l1392_l1389_DUPLICATE_120e_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1384_l1407_l1381_l1404_l1399_l1396_l1392_l1419_l1389_l1413_DUPLICATE_88ca_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1384_l1407_l1381_l1404_l1399_l1396_l1392_l1389_DUPLICATE_381b_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1393_l1408_l1385_l1400_DUPLICATE_9e5c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1401_l1386_DUPLICATE_feb8_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1401_l1386_DUPLICATE_feb8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1407_l1413_DUPLICATE_ef5f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l1371_l1424_DUPLICATE_92ef_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_81bc_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1394_c3_545b := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1392_c7_d01e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1394_c3_545b;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1375_c2_a13e_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1402_c3_7da1 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_368d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1402_c3_7da1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_2572_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_0927_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1397_c3_fc01 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1396_c7_22a1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1397_c3_fc01;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_428f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1404_c11_7e37_right := to_unsigned(7, 3);
     VAR_MUX_uxn_opcodes_h_l1417_c24_6620_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1387_c3_792c := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_be5d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1387_c3_792c;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1390_c3_5fa8 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1389_c7_0fc1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1390_c3_5fa8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1389_c11_8c17_right := to_unsigned(3, 2);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1375_c2_a13e_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1396_c11_ba2c_right := to_unsigned(5, 3);
     VAR_MUX_uxn_opcodes_h_l1411_c32_3862_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1405_c3_9e35 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1404_c7_5da5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1405_c3_9e35;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1392_c11_dd4f_right := to_unsigned(4, 3);
     VAR_MUX_uxn_opcodes_h_l1417_c24_6620_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1382_c3_7462 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_ec8b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1382_c3_7462;
     VAR_MUX_uxn_opcodes_h_l1411_c32_3862_iffalse := resize(to_signed(-3, 3), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_e1f9_right := to_unsigned(10, 4);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1411_c32_b700_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_4f7c_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1378_c3_249e := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c2_a13e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1378_c3_249e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1413_c11_e35d_right := to_unsigned(9, 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_428f_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_8cad_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1416_c3_0c2c := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_8cad_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1416_c3_0c2c;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_e078_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1411_c32_747e_right := to_unsigned(128, 8);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_8cad_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1407_c7_e078_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1375_c6_4b16_right := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1375_c1_37d1_iffalse := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1375_c1_37d1_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1411_c32_747e_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1417_c24_4d82_left := n16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1408_c3_c849_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1375_c2_a13e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1381_c7_ec8b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1384_c7_be5d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1389_c7_0fc1_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1392_c7_d01e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1396_c7_22a1_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1404_c7_5da5_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1407_c7_e078_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1375_c6_4b16_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_2572_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_0927_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1389_c11_8c17_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1392_c11_dd4f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1396_c11_ba2c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_4f7c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1404_c11_7e37_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_81bc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1413_c11_e35d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_e1f9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1417_c24_4d82_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1393_c3_388e_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1375_c2_a13e_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1381_c7_ec8b_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1389_c7_0fc1_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1392_c7_d01e_iffalse := t16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1384_l1407_l1381_l1404_l1399_l1396_l1392_l1389_DUPLICATE_381b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1384_l1407_l1381_l1404_l1399_l1396_l1392_l1389_DUPLICATE_381b_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1407_l1413_DUPLICATE_ef5f LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1407_l1413_DUPLICATE_ef5f_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1407_c11_81bc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1407_c11_81bc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_81bc_left;
     BIN_OP_EQ_uxn_opcodes_h_l1407_c11_81bc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_81bc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_81bc_return_output := BIN_OP_EQ_uxn_opcodes_h_l1407_c11_81bc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1399_c11_4f7c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1399_c11_4f7c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_4f7c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1399_c11_4f7c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_4f7c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_4f7c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1399_c11_4f7c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1384_l1407_l1381_l1404_l1375_l1399_l1396_l1392_l1419_l1389_DUPLICATE_efba LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1384_l1407_l1381_l1404_l1375_l1399_l1396_l1392_l1419_l1389_DUPLICATE_efba_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1396_c11_ba2c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1396_c11_ba2c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1396_c11_ba2c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1396_c11_ba2c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1396_c11_ba2c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1396_c11_ba2c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1396_c11_ba2c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1413_c11_e35d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1413_c11_e35d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1413_c11_e35d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1413_c11_e35d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1413_c11_e35d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1413_c11_e35d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1413_c11_e35d_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1384_l1407_l1381_l1404_l1375_l1399_l1396_l1392_l1389_l1413_DUPLICATE_2114 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1384_l1407_l1381_l1404_l1375_l1399_l1396_l1392_l1389_l1413_DUPLICATE_2114_return_output := result.stack_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1384_l1407_l1381_l1404_l1399_l1396_l1392_l1419_l1389_l1413_DUPLICATE_88ca LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1384_l1407_l1381_l1404_l1399_l1396_l1392_l1419_l1389_l1413_DUPLICATE_88ca_return_output := result.is_opc_done;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1384_l1407_l1381_l1404_l1375_l1399_l1396_l1392_l1389_DUPLICATE_120e LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1384_l1407_l1381_l1404_l1375_l1399_l1396_l1392_l1389_DUPLICATE_120e_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1404_c11_7e37] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1404_c11_7e37_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1404_c11_7e37_left;
     BIN_OP_EQ_uxn_opcodes_h_l1404_c11_7e37_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1404_c11_7e37_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1404_c11_7e37_return_output := BIN_OP_EQ_uxn_opcodes_h_l1404_c11_7e37_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1417_c24_4d82] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1417_c24_4d82_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1417_c24_4d82_left;
     BIN_OP_EQ_uxn_opcodes_h_l1417_c24_4d82_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1417_c24_4d82_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1417_c24_4d82_return_output := BIN_OP_EQ_uxn_opcodes_h_l1417_c24_4d82_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1375_c6_4b16] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1375_c6_4b16_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1375_c6_4b16_left;
     BIN_OP_EQ_uxn_opcodes_h_l1375_c6_4b16_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1375_c6_4b16_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1375_c6_4b16_return_output := BIN_OP_EQ_uxn_opcodes_h_l1375_c6_4b16_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1389_c11_8c17] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1389_c11_8c17_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1389_c11_8c17_left;
     BIN_OP_EQ_uxn_opcodes_h_l1389_c11_8c17_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1389_c11_8c17_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1389_c11_8c17_return_output := BIN_OP_EQ_uxn_opcodes_h_l1389_c11_8c17_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1392_c11_dd4f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1392_c11_dd4f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1392_c11_dd4f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1392_c11_dd4f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1392_c11_dd4f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1392_c11_dd4f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1392_c11_dd4f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1384_l1381_l1404_l1375_l1399_l1396_l1392_l1389_l1413_DUPLICATE_17ae LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1384_l1381_l1404_l1375_l1399_l1396_l1392_l1389_l1413_DUPLICATE_17ae_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1384_c11_0927] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1384_c11_0927_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_0927_left;
     BIN_OP_EQ_uxn_opcodes_h_l1384_c11_0927_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_0927_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_0927_return_output := BIN_OP_EQ_uxn_opcodes_h_l1384_c11_0927_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1411_c32_747e] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1411_c32_747e_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1411_c32_747e_left;
     BIN_OP_AND_uxn_opcodes_h_l1411_c32_747e_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1411_c32_747e_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1411_c32_747e_return_output := BIN_OP_AND_uxn_opcodes_h_l1411_c32_747e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1419_c11_e1f9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1419_c11_e1f9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_e1f9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1419_c11_e1f9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_e1f9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_e1f9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1419_c11_e1f9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1381_c11_2572] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1381_c11_2572_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_2572_left;
     BIN_OP_EQ_uxn_opcodes_h_l1381_c11_2572_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_2572_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_2572_return_output := BIN_OP_EQ_uxn_opcodes_h_l1381_c11_2572_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1393_l1408_l1385_l1400_DUPLICATE_9e5c LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1393_l1408_l1385_l1400_DUPLICATE_9e5c_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1411_c32_b700_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1411_c32_747e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1375_c1_37d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1375_c6_4b16_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1375_c2_a13e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1375_c6_4b16_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1375_c2_a13e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1375_c6_4b16_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1375_c2_a13e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1375_c6_4b16_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1375_c2_a13e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1375_c6_4b16_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1375_c2_a13e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1375_c6_4b16_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1375_c2_a13e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1375_c6_4b16_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c2_a13e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1375_c6_4b16_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1375_c2_a13e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1375_c6_4b16_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1375_c2_a13e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1375_c6_4b16_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1381_c7_ec8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_2572_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_ec8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_2572_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_ec8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_2572_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1381_c7_ec8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_2572_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_ec8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_2572_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_ec8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_2572_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_ec8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_2572_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1381_c7_ec8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_2572_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1381_c7_ec8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_2572_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1384_c7_be5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_0927_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_be5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_0927_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_be5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_0927_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_be5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_0927_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_be5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_0927_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_be5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_0927_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_be5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_0927_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1384_c7_be5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_0927_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1384_c7_be5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_0927_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1389_c7_0fc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1389_c11_8c17_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_0fc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1389_c11_8c17_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_0fc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1389_c11_8c17_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1389_c7_0fc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1389_c11_8c17_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_0fc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1389_c11_8c17_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1389_c7_0fc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1389_c11_8c17_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1389_c7_0fc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1389_c11_8c17_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1389_c7_0fc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1389_c11_8c17_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1389_c7_0fc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1389_c11_8c17_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1392_c7_d01e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1392_c11_dd4f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_d01e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1392_c11_dd4f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1392_c7_d01e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1392_c11_dd4f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1392_c7_d01e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1392_c11_dd4f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_d01e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1392_c11_dd4f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1392_c7_d01e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1392_c11_dd4f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1392_c7_d01e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1392_c11_dd4f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1392_c7_d01e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1392_c11_dd4f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1392_c7_d01e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1392_c11_dd4f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1396_c7_22a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1396_c11_ba2c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1396_c7_22a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1396_c11_ba2c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1396_c7_22a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1396_c11_ba2c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1396_c7_22a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1396_c11_ba2c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1396_c7_22a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1396_c11_ba2c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1396_c7_22a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1396_c11_ba2c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1396_c7_22a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1396_c11_ba2c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1396_c7_22a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1396_c11_ba2c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1399_c7_368d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_4f7c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_368d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_4f7c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_368d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_4f7c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1399_c7_368d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_4f7c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_368d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_4f7c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_368d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_4f7c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_368d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_4f7c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1399_c7_368d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_4f7c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1404_c7_5da5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1404_c11_7e37_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1404_c7_5da5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1404_c11_7e37_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1404_c7_5da5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1404_c11_7e37_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1404_c7_5da5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1404_c11_7e37_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1404_c7_5da5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1404_c11_7e37_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1404_c7_5da5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1404_c11_7e37_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1404_c7_5da5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1404_c11_7e37_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1404_c7_5da5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1404_c11_7e37_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1407_c7_e078_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_81bc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_e078_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_81bc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_e078_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_81bc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1407_c7_e078_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_81bc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_e078_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_81bc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_e078_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_81bc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_e078_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_81bc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1407_c7_e078_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_81bc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_8cad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1413_c11_e35d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_8cad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1413_c11_e35d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_8cad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1413_c11_e35d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_8cad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1413_c11_e35d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1413_c7_8cad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1413_c11_e35d_return_output;
     VAR_MUX_uxn_opcodes_h_l1417_c24_6620_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1417_c24_4d82_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_428f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_e1f9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_428f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_e1f9_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1393_c3_388e_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1393_l1408_l1385_l1400_DUPLICATE_9e5c_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1408_c3_c849_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1393_l1408_l1385_l1400_DUPLICATE_9e5c_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1401_l1386_DUPLICATE_feb8_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1393_l1408_l1385_l1400_DUPLICATE_9e5c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1375_c2_a13e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1384_l1407_l1381_l1404_l1375_l1399_l1396_l1392_l1389_DUPLICATE_120e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_ec8b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1384_l1407_l1381_l1404_l1375_l1399_l1396_l1392_l1389_DUPLICATE_120e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_be5d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1384_l1407_l1381_l1404_l1375_l1399_l1396_l1392_l1389_DUPLICATE_120e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1389_c7_0fc1_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1384_l1407_l1381_l1404_l1375_l1399_l1396_l1392_l1389_DUPLICATE_120e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1392_c7_d01e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1384_l1407_l1381_l1404_l1375_l1399_l1396_l1392_l1389_DUPLICATE_120e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1396_c7_22a1_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1384_l1407_l1381_l1404_l1375_l1399_l1396_l1392_l1389_DUPLICATE_120e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_368d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1384_l1407_l1381_l1404_l1375_l1399_l1396_l1392_l1389_DUPLICATE_120e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1404_c7_5da5_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1384_l1407_l1381_l1404_l1375_l1399_l1396_l1392_l1389_DUPLICATE_120e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_e078_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1384_l1407_l1381_l1404_l1375_l1399_l1396_l1392_l1389_DUPLICATE_120e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_ec8b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1384_l1407_l1381_l1404_l1399_l1396_l1392_l1419_l1389_l1413_DUPLICATE_88ca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_be5d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1384_l1407_l1381_l1404_l1399_l1396_l1392_l1419_l1389_l1413_DUPLICATE_88ca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_0fc1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1384_l1407_l1381_l1404_l1399_l1396_l1392_l1419_l1389_l1413_DUPLICATE_88ca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_d01e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1384_l1407_l1381_l1404_l1399_l1396_l1392_l1419_l1389_l1413_DUPLICATE_88ca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1396_c7_22a1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1384_l1407_l1381_l1404_l1399_l1396_l1392_l1419_l1389_l1413_DUPLICATE_88ca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_368d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1384_l1407_l1381_l1404_l1399_l1396_l1392_l1419_l1389_l1413_DUPLICATE_88ca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1404_c7_5da5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1384_l1407_l1381_l1404_l1399_l1396_l1392_l1419_l1389_l1413_DUPLICATE_88ca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_e078_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1384_l1407_l1381_l1404_l1399_l1396_l1392_l1419_l1389_l1413_DUPLICATE_88ca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_8cad_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1384_l1407_l1381_l1404_l1399_l1396_l1392_l1419_l1389_l1413_DUPLICATE_88ca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_428f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1384_l1407_l1381_l1404_l1399_l1396_l1392_l1419_l1389_l1413_DUPLICATE_88ca_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1375_c2_a13e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1384_l1381_l1404_l1375_l1399_l1396_l1392_l1389_l1413_DUPLICATE_17ae_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_ec8b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1384_l1381_l1404_l1375_l1399_l1396_l1392_l1389_l1413_DUPLICATE_17ae_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_be5d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1384_l1381_l1404_l1375_l1399_l1396_l1392_l1389_l1413_DUPLICATE_17ae_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_0fc1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1384_l1381_l1404_l1375_l1399_l1396_l1392_l1389_l1413_DUPLICATE_17ae_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1392_c7_d01e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1384_l1381_l1404_l1375_l1399_l1396_l1392_l1389_l1413_DUPLICATE_17ae_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1396_c7_22a1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1384_l1381_l1404_l1375_l1399_l1396_l1392_l1389_l1413_DUPLICATE_17ae_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_368d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1384_l1381_l1404_l1375_l1399_l1396_l1392_l1389_l1413_DUPLICATE_17ae_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1404_c7_5da5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1384_l1381_l1404_l1375_l1399_l1396_l1392_l1389_l1413_DUPLICATE_17ae_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_8cad_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1384_l1381_l1404_l1375_l1399_l1396_l1392_l1389_l1413_DUPLICATE_17ae_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1381_c7_ec8b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1384_l1407_l1381_l1404_l1399_l1396_l1392_l1389_DUPLICATE_381b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_be5d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1384_l1407_l1381_l1404_l1399_l1396_l1392_l1389_DUPLICATE_381b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1389_c7_0fc1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1384_l1407_l1381_l1404_l1399_l1396_l1392_l1389_DUPLICATE_381b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1392_c7_d01e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1384_l1407_l1381_l1404_l1399_l1396_l1392_l1389_DUPLICATE_381b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1396_c7_22a1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1384_l1407_l1381_l1404_l1399_l1396_l1392_l1389_DUPLICATE_381b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1399_c7_368d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1384_l1407_l1381_l1404_l1399_l1396_l1392_l1389_DUPLICATE_381b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1404_c7_5da5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1384_l1407_l1381_l1404_l1399_l1396_l1392_l1389_DUPLICATE_381b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1407_c7_e078_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1384_l1407_l1381_l1404_l1399_l1396_l1392_l1389_DUPLICATE_381b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1375_c2_a13e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1384_l1407_l1381_l1404_l1375_l1399_l1396_l1392_l1419_l1389_DUPLICATE_efba_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_ec8b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1384_l1407_l1381_l1404_l1375_l1399_l1396_l1392_l1419_l1389_DUPLICATE_efba_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_be5d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1384_l1407_l1381_l1404_l1375_l1399_l1396_l1392_l1419_l1389_DUPLICATE_efba_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_0fc1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1384_l1407_l1381_l1404_l1375_l1399_l1396_l1392_l1419_l1389_DUPLICATE_efba_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_d01e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1384_l1407_l1381_l1404_l1375_l1399_l1396_l1392_l1419_l1389_DUPLICATE_efba_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1396_c7_22a1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1384_l1407_l1381_l1404_l1375_l1399_l1396_l1392_l1419_l1389_DUPLICATE_efba_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_368d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1384_l1407_l1381_l1404_l1375_l1399_l1396_l1392_l1419_l1389_DUPLICATE_efba_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1404_c7_5da5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1384_l1407_l1381_l1404_l1375_l1399_l1396_l1392_l1419_l1389_DUPLICATE_efba_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_e078_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1384_l1407_l1381_l1404_l1375_l1399_l1396_l1392_l1419_l1389_DUPLICATE_efba_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_428f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1384_l1407_l1381_l1404_l1375_l1399_l1396_l1392_l1419_l1389_DUPLICATE_efba_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_e078_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1407_l1413_DUPLICATE_ef5f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_8cad_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1407_l1413_DUPLICATE_ef5f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1375_c2_a13e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1384_l1407_l1381_l1404_l1375_l1399_l1396_l1392_l1389_l1413_DUPLICATE_2114_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1381_c7_ec8b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1384_l1407_l1381_l1404_l1375_l1399_l1396_l1392_l1389_l1413_DUPLICATE_2114_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1384_c7_be5d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1384_l1407_l1381_l1404_l1375_l1399_l1396_l1392_l1389_l1413_DUPLICATE_2114_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1389_c7_0fc1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1384_l1407_l1381_l1404_l1375_l1399_l1396_l1392_l1389_l1413_DUPLICATE_2114_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1392_c7_d01e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1384_l1407_l1381_l1404_l1375_l1399_l1396_l1392_l1389_l1413_DUPLICATE_2114_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1396_c7_22a1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1384_l1407_l1381_l1404_l1375_l1399_l1396_l1392_l1389_l1413_DUPLICATE_2114_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1399_c7_368d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1384_l1407_l1381_l1404_l1375_l1399_l1396_l1392_l1389_l1413_DUPLICATE_2114_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1404_c7_5da5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1384_l1407_l1381_l1404_l1375_l1399_l1396_l1392_l1389_l1413_DUPLICATE_2114_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1407_c7_e078_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1384_l1407_l1381_l1404_l1375_l1399_l1396_l1392_l1389_l1413_DUPLICATE_2114_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1413_c7_8cad_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1384_l1407_l1381_l1404_l1375_l1399_l1396_l1392_l1389_l1413_DUPLICATE_2114_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1419_c7_428f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_428f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_428f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_428f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_428f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_428f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_428f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_428f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_428f_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1408_c3_c849] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1408_c3_c849_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1408_c3_c849_left;
     BIN_OP_OR_uxn_opcodes_h_l1408_c3_c849_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1408_c3_c849_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1408_c3_c849_return_output := BIN_OP_OR_uxn_opcodes_h_l1408_c3_c849_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1407_c7_e078] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1407_c7_e078_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1407_c7_e078_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1407_c7_e078_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1407_c7_e078_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1407_c7_e078_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1407_c7_e078_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1407_c7_e078_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1407_c7_e078_return_output;

     -- MUX[uxn_opcodes_h_l1417_c24_6620] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1417_c24_6620_cond <= VAR_MUX_uxn_opcodes_h_l1417_c24_6620_cond;
     MUX_uxn_opcodes_h_l1417_c24_6620_iftrue <= VAR_MUX_uxn_opcodes_h_l1417_c24_6620_iftrue;
     MUX_uxn_opcodes_h_l1417_c24_6620_iffalse <= VAR_MUX_uxn_opcodes_h_l1417_c24_6620_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1417_c24_6620_return_output := MUX_uxn_opcodes_h_l1417_c24_6620_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1411_c32_b700] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1411_c32_b700_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1411_c32_b700_left;
     BIN_OP_GT_uxn_opcodes_h_l1411_c32_b700_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1411_c32_b700_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1411_c32_b700_return_output := BIN_OP_GT_uxn_opcodes_h_l1411_c32_b700_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1413_c7_8cad] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_8cad_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_8cad_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_8cad_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_8cad_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_8cad_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_8cad_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_8cad_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_8cad_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1393_c3_388e] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1393_c3_388e_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1393_c3_388e_left;
     BIN_OP_OR_uxn_opcodes_h_l1393_c3_388e_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1393_c3_388e_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1393_c3_388e_return_output := BIN_OP_OR_uxn_opcodes_h_l1393_c3_388e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1375_c1_37d1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1375_c1_37d1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1375_c1_37d1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1375_c1_37d1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1375_c1_37d1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1375_c1_37d1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1375_c1_37d1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1375_c1_37d1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1375_c1_37d1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1419_c7_428f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_428f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_428f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_428f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_428f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_428f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_428f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_428f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_428f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1413_c7_8cad] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_8cad_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_8cad_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_8cad_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_8cad_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_8cad_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_8cad_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_8cad_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_8cad_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1401_l1386_DUPLICATE_feb8 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1401_l1386_DUPLICATE_feb8_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1401_l1386_DUPLICATE_feb8_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1401_l1386_DUPLICATE_feb8_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1401_l1386_DUPLICATE_feb8_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1411_c32_3862_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1411_c32_b700_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1392_c7_d01e_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1393_c3_388e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1407_c7_e078_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1408_c3_c849_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1399_c7_368d_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1401_l1386_DUPLICATE_feb8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1384_c7_be5d_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1401_l1386_DUPLICATE_feb8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1413_c7_8cad_iftrue := VAR_MUX_uxn_opcodes_h_l1417_c24_6620_return_output;
     VAR_printf_uxn_opcodes_h_l1376_c3_b559_uxn_opcodes_h_l1376_c3_b559_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1375_c1_37d1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_8cad_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_428f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_e078_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_8cad_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1404_c7_5da5_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1407_c7_e078_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_8cad_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_428f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_e078_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_8cad_return_output;
     -- t16_MUX[uxn_opcodes_h_l1392_c7_d01e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1392_c7_d01e_cond <= VAR_t16_MUX_uxn_opcodes_h_l1392_c7_d01e_cond;
     t16_MUX_uxn_opcodes_h_l1392_c7_d01e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1392_c7_d01e_iftrue;
     t16_MUX_uxn_opcodes_h_l1392_c7_d01e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1392_c7_d01e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1392_c7_d01e_return_output := t16_MUX_uxn_opcodes_h_l1392_c7_d01e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1407_c7_e078] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_e078_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_e078_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_e078_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_e078_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_e078_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_e078_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_e078_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_e078_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1413_c7_8cad] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_8cad_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_8cad_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_8cad_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_8cad_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_8cad_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_8cad_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_8cad_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_8cad_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1413_c7_8cad] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_8cad_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_8cad_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_8cad_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_8cad_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_8cad_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_8cad_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_8cad_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_8cad_return_output;

     -- MUX[uxn_opcodes_h_l1411_c32_3862] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1411_c32_3862_cond <= VAR_MUX_uxn_opcodes_h_l1411_c32_3862_cond;
     MUX_uxn_opcodes_h_l1411_c32_3862_iftrue <= VAR_MUX_uxn_opcodes_h_l1411_c32_3862_iftrue;
     MUX_uxn_opcodes_h_l1411_c32_3862_iffalse <= VAR_MUX_uxn_opcodes_h_l1411_c32_3862_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1411_c32_3862_return_output := MUX_uxn_opcodes_h_l1411_c32_3862_return_output;

     -- printf_uxn_opcodes_h_l1376_c3_b559[uxn_opcodes_h_l1376_c3_b559] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1376_c3_b559_uxn_opcodes_h_l1376_c3_b559_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1376_c3_b559_uxn_opcodes_h_l1376_c3_b559_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_value_MUX[uxn_opcodes_h_l1413_c7_8cad] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1413_c7_8cad_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1413_c7_8cad_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1413_c7_8cad_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1413_c7_8cad_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1413_c7_8cad_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1413_c7_8cad_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1413_c7_8cad_return_output := result_stack_value_MUX_uxn_opcodes_h_l1413_c7_8cad_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1404_c7_5da5] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1404_c7_5da5_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1404_c7_5da5_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1404_c7_5da5_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1404_c7_5da5_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1404_c7_5da5_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1404_c7_5da5_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1404_c7_5da5_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1404_c7_5da5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1407_c7_e078] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_e078_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_e078_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_e078_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_e078_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_e078_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_e078_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_e078_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_e078_return_output;

     -- n16_MUX[uxn_opcodes_h_l1407_c7_e078] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1407_c7_e078_cond <= VAR_n16_MUX_uxn_opcodes_h_l1407_c7_e078_cond;
     n16_MUX_uxn_opcodes_h_l1407_c7_e078_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1407_c7_e078_iftrue;
     n16_MUX_uxn_opcodes_h_l1407_c7_e078_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1407_c7_e078_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1407_c7_e078_return_output := n16_MUX_uxn_opcodes_h_l1407_c7_e078_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_e078_iftrue := VAR_MUX_uxn_opcodes_h_l1411_c32_3862_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1404_c7_5da5_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1407_c7_e078_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_e078_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_8cad_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1404_c7_5da5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_e078_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1399_c7_368d_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1404_c7_5da5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_e078_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_8cad_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1404_c7_5da5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_e078_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1407_c7_e078_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1413_c7_8cad_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1389_c7_0fc1_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1392_c7_d01e_return_output;
     -- n16_MUX[uxn_opcodes_h_l1404_c7_5da5] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1404_c7_5da5_cond <= VAR_n16_MUX_uxn_opcodes_h_l1404_c7_5da5_cond;
     n16_MUX_uxn_opcodes_h_l1404_c7_5da5_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1404_c7_5da5_iftrue;
     n16_MUX_uxn_opcodes_h_l1404_c7_5da5_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1404_c7_5da5_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1404_c7_5da5_return_output := n16_MUX_uxn_opcodes_h_l1404_c7_5da5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1407_c7_e078] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_e078_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_e078_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_e078_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_e078_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_e078_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_e078_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_e078_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_e078_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1404_c7_5da5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1404_c7_5da5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1404_c7_5da5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1404_c7_5da5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1404_c7_5da5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1404_c7_5da5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1404_c7_5da5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1404_c7_5da5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1404_c7_5da5_return_output;

     -- t16_MUX[uxn_opcodes_h_l1389_c7_0fc1] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1389_c7_0fc1_cond <= VAR_t16_MUX_uxn_opcodes_h_l1389_c7_0fc1_cond;
     t16_MUX_uxn_opcodes_h_l1389_c7_0fc1_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1389_c7_0fc1_iftrue;
     t16_MUX_uxn_opcodes_h_l1389_c7_0fc1_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1389_c7_0fc1_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1389_c7_0fc1_return_output := t16_MUX_uxn_opcodes_h_l1389_c7_0fc1_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1399_c7_368d] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1399_c7_368d_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1399_c7_368d_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1399_c7_368d_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1399_c7_368d_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1399_c7_368d_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1399_c7_368d_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1399_c7_368d_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1399_c7_368d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1407_c7_e078] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_e078_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_e078_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_e078_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_e078_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_e078_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_e078_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_e078_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_e078_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1407_c7_e078] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_e078_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_e078_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_e078_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_e078_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_e078_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_e078_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_e078_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_e078_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1404_c7_5da5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1404_c7_5da5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1404_c7_5da5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1404_c7_5da5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1404_c7_5da5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1404_c7_5da5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1404_c7_5da5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1404_c7_5da5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1404_c7_5da5_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1407_c7_e078] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1407_c7_e078_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1407_c7_e078_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1407_c7_e078_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1407_c7_e078_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1407_c7_e078_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1407_c7_e078_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1407_c7_e078_return_output := result_stack_value_MUX_uxn_opcodes_h_l1407_c7_e078_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l1399_c7_368d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1404_c7_5da5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1404_c7_5da5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_e078_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_368d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1404_c7_5da5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1396_c7_22a1_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1399_c7_368d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1404_c7_5da5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_e078_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1404_c7_5da5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_e078_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_368d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1404_c7_5da5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1404_c7_5da5_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1407_c7_e078_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1384_c7_be5d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1389_c7_0fc1_return_output;
     -- n16_MUX[uxn_opcodes_h_l1399_c7_368d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1399_c7_368d_cond <= VAR_n16_MUX_uxn_opcodes_h_l1399_c7_368d_cond;
     n16_MUX_uxn_opcodes_h_l1399_c7_368d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1399_c7_368d_iftrue;
     n16_MUX_uxn_opcodes_h_l1399_c7_368d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1399_c7_368d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1399_c7_368d_return_output := n16_MUX_uxn_opcodes_h_l1399_c7_368d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1399_c7_368d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_368d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_368d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_368d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_368d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_368d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_368d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_368d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_368d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1404_c7_5da5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1404_c7_5da5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1404_c7_5da5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1404_c7_5da5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1404_c7_5da5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1404_c7_5da5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1404_c7_5da5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1404_c7_5da5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1404_c7_5da5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1404_c7_5da5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1404_c7_5da5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1404_c7_5da5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1404_c7_5da5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1404_c7_5da5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1404_c7_5da5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1404_c7_5da5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1404_c7_5da5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1404_c7_5da5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1404_c7_5da5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1404_c7_5da5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1404_c7_5da5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1404_c7_5da5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1404_c7_5da5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1404_c7_5da5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1404_c7_5da5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1404_c7_5da5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1404_c7_5da5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1399_c7_368d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_368d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_368d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_368d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_368d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_368d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_368d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_368d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_368d_return_output;

     -- t16_MUX[uxn_opcodes_h_l1384_c7_be5d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1384_c7_be5d_cond <= VAR_t16_MUX_uxn_opcodes_h_l1384_c7_be5d_cond;
     t16_MUX_uxn_opcodes_h_l1384_c7_be5d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1384_c7_be5d_iftrue;
     t16_MUX_uxn_opcodes_h_l1384_c7_be5d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1384_c7_be5d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1384_c7_be5d_return_output := t16_MUX_uxn_opcodes_h_l1384_c7_be5d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1404_c7_5da5] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1404_c7_5da5_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1404_c7_5da5_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1404_c7_5da5_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1404_c7_5da5_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1404_c7_5da5_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1404_c7_5da5_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1404_c7_5da5_return_output := result_stack_value_MUX_uxn_opcodes_h_l1404_c7_5da5_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1396_c7_22a1] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1396_c7_22a1_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1396_c7_22a1_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1396_c7_22a1_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1396_c7_22a1_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1396_c7_22a1_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1396_c7_22a1_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1396_c7_22a1_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1396_c7_22a1_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1396_c7_22a1_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1399_c7_368d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_368d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1404_c7_5da5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1396_c7_22a1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_368d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1392_c7_d01e_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1396_c7_22a1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_368d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1404_c7_5da5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_368d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1404_c7_5da5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1396_c7_22a1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_368d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1399_c7_368d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1404_c7_5da5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1381_c7_ec8b_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1384_c7_be5d_return_output;
     -- t16_MUX[uxn_opcodes_h_l1381_c7_ec8b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1381_c7_ec8b_cond <= VAR_t16_MUX_uxn_opcodes_h_l1381_c7_ec8b_cond;
     t16_MUX_uxn_opcodes_h_l1381_c7_ec8b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1381_c7_ec8b_iftrue;
     t16_MUX_uxn_opcodes_h_l1381_c7_ec8b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1381_c7_ec8b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1381_c7_ec8b_return_output := t16_MUX_uxn_opcodes_h_l1381_c7_ec8b_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1392_c7_d01e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1392_c7_d01e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1392_c7_d01e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1392_c7_d01e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1392_c7_d01e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1392_c7_d01e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1392_c7_d01e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1392_c7_d01e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1392_c7_d01e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1396_c7_22a1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1396_c7_22a1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1396_c7_22a1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1396_c7_22a1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1396_c7_22a1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1396_c7_22a1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1396_c7_22a1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1396_c7_22a1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1396_c7_22a1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1399_c7_368d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_368d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_368d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_368d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_368d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_368d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_368d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_368d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_368d_return_output;

     -- n16_MUX[uxn_opcodes_h_l1396_c7_22a1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1396_c7_22a1_cond <= VAR_n16_MUX_uxn_opcodes_h_l1396_c7_22a1_cond;
     n16_MUX_uxn_opcodes_h_l1396_c7_22a1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1396_c7_22a1_iftrue;
     n16_MUX_uxn_opcodes_h_l1396_c7_22a1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1396_c7_22a1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1396_c7_22a1_return_output := n16_MUX_uxn_opcodes_h_l1396_c7_22a1_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1399_c7_368d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1399_c7_368d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1399_c7_368d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1399_c7_368d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1399_c7_368d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1399_c7_368d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1399_c7_368d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1399_c7_368d_return_output := result_stack_value_MUX_uxn_opcodes_h_l1399_c7_368d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1396_c7_22a1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1396_c7_22a1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1396_c7_22a1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1396_c7_22a1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1396_c7_22a1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1396_c7_22a1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1396_c7_22a1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1396_c7_22a1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1396_c7_22a1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1399_c7_368d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_368d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_368d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_368d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_368d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_368d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_368d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_368d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_368d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1399_c7_368d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_368d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_368d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_368d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_368d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_368d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_368d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_368d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_368d_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1392_c7_d01e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1396_c7_22a1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1396_c7_22a1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_368d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1392_c7_d01e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1396_c7_22a1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1389_c7_0fc1_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1392_c7_d01e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1396_c7_22a1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_368d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1396_c7_22a1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_368d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1392_c7_d01e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1396_c7_22a1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1396_c7_22a1_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1399_c7_368d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1375_c2_a13e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1381_c7_ec8b_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1389_c7_0fc1] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1389_c7_0fc1_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1389_c7_0fc1_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1389_c7_0fc1_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1389_c7_0fc1_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1389_c7_0fc1_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1389_c7_0fc1_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1389_c7_0fc1_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1389_c7_0fc1_return_output;

     -- n16_MUX[uxn_opcodes_h_l1392_c7_d01e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1392_c7_d01e_cond <= VAR_n16_MUX_uxn_opcodes_h_l1392_c7_d01e_cond;
     n16_MUX_uxn_opcodes_h_l1392_c7_d01e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1392_c7_d01e_iftrue;
     n16_MUX_uxn_opcodes_h_l1392_c7_d01e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1392_c7_d01e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1392_c7_d01e_return_output := n16_MUX_uxn_opcodes_h_l1392_c7_d01e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1396_c7_22a1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1396_c7_22a1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1396_c7_22a1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1396_c7_22a1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1396_c7_22a1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1396_c7_22a1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1396_c7_22a1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1396_c7_22a1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1396_c7_22a1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1396_c7_22a1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1396_c7_22a1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1396_c7_22a1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1396_c7_22a1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1396_c7_22a1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1396_c7_22a1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1396_c7_22a1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1396_c7_22a1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1396_c7_22a1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1392_c7_d01e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1392_c7_d01e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1392_c7_d01e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1392_c7_d01e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1392_c7_d01e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1392_c7_d01e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1392_c7_d01e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1392_c7_d01e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1392_c7_d01e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1396_c7_22a1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1396_c7_22a1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1396_c7_22a1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1396_c7_22a1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1396_c7_22a1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1396_c7_22a1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1396_c7_22a1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1396_c7_22a1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1396_c7_22a1_return_output;

     -- t16_MUX[uxn_opcodes_h_l1375_c2_a13e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1375_c2_a13e_cond <= VAR_t16_MUX_uxn_opcodes_h_l1375_c2_a13e_cond;
     t16_MUX_uxn_opcodes_h_l1375_c2_a13e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1375_c2_a13e_iftrue;
     t16_MUX_uxn_opcodes_h_l1375_c2_a13e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1375_c2_a13e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1375_c2_a13e_return_output := t16_MUX_uxn_opcodes_h_l1375_c2_a13e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1392_c7_d01e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1392_c7_d01e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1392_c7_d01e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1392_c7_d01e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1392_c7_d01e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1392_c7_d01e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1392_c7_d01e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1392_c7_d01e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1392_c7_d01e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1396_c7_22a1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1396_c7_22a1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1396_c7_22a1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1396_c7_22a1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1396_c7_22a1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1396_c7_22a1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1396_c7_22a1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1396_c7_22a1_return_output := result_stack_value_MUX_uxn_opcodes_h_l1396_c7_22a1_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1389_c7_0fc1_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1392_c7_d01e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_d01e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1396_c7_22a1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_0fc1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1392_c7_d01e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_be5d_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1389_c7_0fc1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_d01e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1396_c7_22a1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1392_c7_d01e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1396_c7_22a1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1389_c7_0fc1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1392_c7_d01e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1392_c7_d01e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1396_c7_22a1_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1375_c2_a13e_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1392_c7_d01e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1392_c7_d01e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1392_c7_d01e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1392_c7_d01e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1392_c7_d01e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1392_c7_d01e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1392_c7_d01e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1392_c7_d01e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1392_c7_d01e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1392_c7_d01e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_d01e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_d01e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_d01e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_d01e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_d01e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_d01e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_d01e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_d01e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1392_c7_d01e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_d01e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_d01e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_d01e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_d01e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_d01e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_d01e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_d01e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_d01e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1392_c7_d01e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1392_c7_d01e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1392_c7_d01e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1392_c7_d01e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1392_c7_d01e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1392_c7_d01e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1392_c7_d01e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1392_c7_d01e_return_output := result_stack_value_MUX_uxn_opcodes_h_l1392_c7_d01e_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1384_c7_be5d] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_be5d_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_be5d_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_be5d_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_be5d_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_be5d_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_be5d_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_be5d_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_be5d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1389_c7_0fc1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1389_c7_0fc1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1389_c7_0fc1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1389_c7_0fc1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1389_c7_0fc1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1389_c7_0fc1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1389_c7_0fc1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1389_c7_0fc1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1389_c7_0fc1_return_output;

     -- n16_MUX[uxn_opcodes_h_l1389_c7_0fc1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1389_c7_0fc1_cond <= VAR_n16_MUX_uxn_opcodes_h_l1389_c7_0fc1_cond;
     n16_MUX_uxn_opcodes_h_l1389_c7_0fc1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1389_c7_0fc1_iftrue;
     n16_MUX_uxn_opcodes_h_l1389_c7_0fc1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1389_c7_0fc1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1389_c7_0fc1_return_output := n16_MUX_uxn_opcodes_h_l1389_c7_0fc1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1389_c7_0fc1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_0fc1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_0fc1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_0fc1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_0fc1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_0fc1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_0fc1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_0fc1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_0fc1_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1384_c7_be5d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1389_c7_0fc1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_0fc1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_d01e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_be5d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_0fc1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1381_c7_ec8b_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_be5d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_0fc1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_d01e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1389_c7_0fc1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1392_c7_d01e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_be5d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1389_c7_0fc1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1389_c7_0fc1_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1392_c7_d01e_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1389_c7_0fc1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1389_c7_0fc1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1389_c7_0fc1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1389_c7_0fc1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1389_c7_0fc1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1389_c7_0fc1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1389_c7_0fc1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1389_c7_0fc1_return_output := result_stack_value_MUX_uxn_opcodes_h_l1389_c7_0fc1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1384_c7_be5d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_be5d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_be5d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_be5d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_be5d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_be5d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_be5d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_be5d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_be5d_return_output;

     -- n16_MUX[uxn_opcodes_h_l1384_c7_be5d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1384_c7_be5d_cond <= VAR_n16_MUX_uxn_opcodes_h_l1384_c7_be5d_cond;
     n16_MUX_uxn_opcodes_h_l1384_c7_be5d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1384_c7_be5d_iftrue;
     n16_MUX_uxn_opcodes_h_l1384_c7_be5d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1384_c7_be5d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1384_c7_be5d_return_output := n16_MUX_uxn_opcodes_h_l1384_c7_be5d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1389_c7_0fc1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1389_c7_0fc1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1389_c7_0fc1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1389_c7_0fc1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1389_c7_0fc1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1389_c7_0fc1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1389_c7_0fc1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1389_c7_0fc1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1389_c7_0fc1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1384_c7_be5d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_be5d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_be5d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_be5d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_be5d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_be5d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_be5d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_be5d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_be5d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1389_c7_0fc1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_0fc1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_0fc1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_0fc1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_0fc1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_0fc1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_0fc1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_0fc1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_0fc1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1389_c7_0fc1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_0fc1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_0fc1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_0fc1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_0fc1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_0fc1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_0fc1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_0fc1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_0fc1_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1381_c7_ec8b] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1381_c7_ec8b_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1381_c7_ec8b_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1381_c7_ec8b_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1381_c7_ec8b_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1381_c7_ec8b_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1381_c7_ec8b_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1381_c7_ec8b_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1381_c7_ec8b_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l1381_c7_ec8b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1384_c7_be5d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_be5d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_0fc1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_ec8b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_be5d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1375_c2_a13e_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1381_c7_ec8b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_be5d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_0fc1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_be5d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1389_c7_0fc1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_ec8b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_be5d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1384_c7_be5d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1389_c7_0fc1_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1381_c7_ec8b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_ec8b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_ec8b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_ec8b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_ec8b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_ec8b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_ec8b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_ec8b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_ec8b_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1375_c2_a13e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1375_c2_a13e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1375_c2_a13e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1375_c2_a13e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1375_c2_a13e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1375_c2_a13e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1375_c2_a13e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1375_c2_a13e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1375_c2_a13e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1384_c7_be5d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_be5d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_be5d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_be5d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_be5d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_be5d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_be5d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_be5d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_be5d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1384_c7_be5d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1384_c7_be5d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1384_c7_be5d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1384_c7_be5d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1384_c7_be5d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1384_c7_be5d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1384_c7_be5d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1384_c7_be5d_return_output := result_stack_value_MUX_uxn_opcodes_h_l1384_c7_be5d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1384_c7_be5d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_be5d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_be5d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_be5d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_be5d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_be5d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_be5d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_be5d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_be5d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1381_c7_ec8b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_ec8b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_ec8b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_ec8b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_ec8b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_ec8b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_ec8b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_ec8b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_ec8b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1384_c7_be5d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_be5d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_be5d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_be5d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_be5d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_be5d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_be5d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_be5d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_be5d_return_output;

     -- n16_MUX[uxn_opcodes_h_l1381_c7_ec8b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1381_c7_ec8b_cond <= VAR_n16_MUX_uxn_opcodes_h_l1381_c7_ec8b_cond;
     n16_MUX_uxn_opcodes_h_l1381_c7_ec8b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1381_c7_ec8b_iftrue;
     n16_MUX_uxn_opcodes_h_l1381_c7_ec8b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1381_c7_ec8b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1381_c7_ec8b_return_output := n16_MUX_uxn_opcodes_h_l1381_c7_ec8b_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l1375_c2_a13e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1381_c7_ec8b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_ec8b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_be5d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1375_c2_a13e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_ec8b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_ec8b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_be5d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_ec8b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_be5d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c2_a13e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_ec8b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1381_c7_ec8b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1384_c7_be5d_return_output;
     -- n16_MUX[uxn_opcodes_h_l1375_c2_a13e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1375_c2_a13e_cond <= VAR_n16_MUX_uxn_opcodes_h_l1375_c2_a13e_cond;
     n16_MUX_uxn_opcodes_h_l1375_c2_a13e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1375_c2_a13e_iftrue;
     n16_MUX_uxn_opcodes_h_l1375_c2_a13e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1375_c2_a13e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1375_c2_a13e_return_output := n16_MUX_uxn_opcodes_h_l1375_c2_a13e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1375_c2_a13e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c2_a13e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c2_a13e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c2_a13e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c2_a13e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c2_a13e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c2_a13e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c2_a13e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c2_a13e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1381_c7_ec8b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_ec8b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_ec8b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_ec8b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_ec8b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_ec8b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_ec8b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_ec8b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_ec8b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1381_c7_ec8b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_ec8b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_ec8b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_ec8b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_ec8b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_ec8b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_ec8b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_ec8b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_ec8b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1381_c7_ec8b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1381_c7_ec8b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1381_c7_ec8b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1381_c7_ec8b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1381_c7_ec8b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1381_c7_ec8b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1381_c7_ec8b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1381_c7_ec8b_return_output := result_stack_value_MUX_uxn_opcodes_h_l1381_c7_ec8b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1375_c2_a13e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1375_c2_a13e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1375_c2_a13e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1375_c2_a13e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1375_c2_a13e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1375_c2_a13e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1375_c2_a13e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1375_c2_a13e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1375_c2_a13e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1381_c7_ec8b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_ec8b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_ec8b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_ec8b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_ec8b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_ec8b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_ec8b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_ec8b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_ec8b_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1375_c2_a13e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1375_c2_a13e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_ec8b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1375_c2_a13e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_ec8b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1375_c2_a13e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_ec8b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1375_c2_a13e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1381_c7_ec8b_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1375_c2_a13e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1375_c2_a13e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1375_c2_a13e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1375_c2_a13e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1375_c2_a13e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1375_c2_a13e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1375_c2_a13e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1375_c2_a13e_return_output := result_stack_value_MUX_uxn_opcodes_h_l1375_c2_a13e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1375_c2_a13e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1375_c2_a13e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1375_c2_a13e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1375_c2_a13e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1375_c2_a13e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1375_c2_a13e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1375_c2_a13e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1375_c2_a13e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1375_c2_a13e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1375_c2_a13e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1375_c2_a13e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1375_c2_a13e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1375_c2_a13e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1375_c2_a13e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1375_c2_a13e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1375_c2_a13e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1375_c2_a13e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1375_c2_a13e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1375_c2_a13e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1375_c2_a13e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1375_c2_a13e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1375_c2_a13e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1375_c2_a13e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1375_c2_a13e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1375_c2_a13e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1375_c2_a13e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1375_c2_a13e_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l1371_l1424_DUPLICATE_92ef LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l1371_l1424_DUPLICATE_92ef_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_287e(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1375_c2_a13e_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1375_c2_a13e_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1375_c2_a13e_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1375_c2_a13e_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c2_a13e_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1375_c2_a13e_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1375_c2_a13e_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l1371_l1424_DUPLICATE_92ef_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l1371_l1424_DUPLICATE_92ef_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
