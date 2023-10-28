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
entity mul2_0CLK_a7b4806f is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end mul2_0CLK_a7b4806f;
architecture arch of mul2_0CLK_a7b4806f is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2133_c6_2331]
signal BIN_OP_EQ_uxn_opcodes_h_l2133_c6_2331_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2133_c6_2331_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2133_c6_2331_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2133_c1_8bf1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_8bf1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_8bf1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_8bf1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_8bf1_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2133_c2_c4d8]
signal t16_MUX_uxn_opcodes_h_l2133_c2_c4d8_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2133_c2_c4d8_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2133_c2_c4d8_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2133_c2_c4d8_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2133_c2_c4d8]
signal tmp16_MUX_uxn_opcodes_h_l2133_c2_c4d8_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2133_c2_c4d8_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2133_c2_c4d8_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2133_c2_c4d8_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2133_c2_c4d8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_c4d8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_c4d8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_c4d8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_c4d8_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2133_c2_c4d8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_c4d8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_c4d8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_c4d8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_c4d8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2133_c2_c4d8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_c4d8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_c4d8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_c4d8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_c4d8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2133_c2_c4d8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_c4d8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_c4d8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_c4d8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_c4d8_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2133_c2_c4d8]
signal result_u8_value_MUX_uxn_opcodes_h_l2133_c2_c4d8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2133_c2_c4d8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2133_c2_c4d8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2133_c2_c4d8_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2133_c2_c4d8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_c4d8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_c4d8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_c4d8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_c4d8_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l2133_c2_c4d8]
signal n16_MUX_uxn_opcodes_h_l2133_c2_c4d8_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2133_c2_c4d8_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2133_c2_c4d8_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2133_c2_c4d8_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2134_c3_8746[uxn_opcodes_h_l2134_c3_8746]
signal printf_uxn_opcodes_h_l2134_c3_8746_uxn_opcodes_h_l2134_c3_8746_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2138_c11_dfd0]
signal BIN_OP_EQ_uxn_opcodes_h_l2138_c11_dfd0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2138_c11_dfd0_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2138_c11_dfd0_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2138_c7_00a7]
signal t16_MUX_uxn_opcodes_h_l2138_c7_00a7_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2138_c7_00a7_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2138_c7_00a7_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2138_c7_00a7_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2138_c7_00a7]
signal tmp16_MUX_uxn_opcodes_h_l2138_c7_00a7_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2138_c7_00a7_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2138_c7_00a7_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2138_c7_00a7_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2138_c7_00a7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_00a7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_00a7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_00a7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_00a7_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2138_c7_00a7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_00a7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_00a7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_00a7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_00a7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2138_c7_00a7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_00a7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_00a7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_00a7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_00a7_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2138_c7_00a7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_00a7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_00a7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_00a7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_00a7_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2138_c7_00a7]
signal result_u8_value_MUX_uxn_opcodes_h_l2138_c7_00a7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2138_c7_00a7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2138_c7_00a7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2138_c7_00a7_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2138_c7_00a7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_00a7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_00a7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_00a7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_00a7_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l2138_c7_00a7]
signal n16_MUX_uxn_opcodes_h_l2138_c7_00a7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2138_c7_00a7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2138_c7_00a7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2138_c7_00a7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2141_c11_19d8]
signal BIN_OP_EQ_uxn_opcodes_h_l2141_c11_19d8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2141_c11_19d8_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2141_c11_19d8_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2141_c7_f179]
signal t16_MUX_uxn_opcodes_h_l2141_c7_f179_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2141_c7_f179_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2141_c7_f179_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2141_c7_f179_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2141_c7_f179]
signal tmp16_MUX_uxn_opcodes_h_l2141_c7_f179_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2141_c7_f179_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2141_c7_f179_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2141_c7_f179_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2141_c7_f179]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_f179_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_f179_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_f179_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_f179_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2141_c7_f179]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_f179_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_f179_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_f179_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_f179_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2141_c7_f179]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_f179_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_f179_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_f179_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_f179_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2141_c7_f179]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_f179_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_f179_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_f179_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_f179_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2141_c7_f179]
signal result_u8_value_MUX_uxn_opcodes_h_l2141_c7_f179_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2141_c7_f179_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2141_c7_f179_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2141_c7_f179_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2141_c7_f179]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_f179_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_f179_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_f179_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_f179_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l2141_c7_f179]
signal n16_MUX_uxn_opcodes_h_l2141_c7_f179_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2141_c7_f179_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2141_c7_f179_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2141_c7_f179_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2146_c11_f974]
signal BIN_OP_EQ_uxn_opcodes_h_l2146_c11_f974_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2146_c11_f974_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2146_c11_f974_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2146_c7_3ea7]
signal t16_MUX_uxn_opcodes_h_l2146_c7_3ea7_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2146_c7_3ea7_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2146_c7_3ea7_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2146_c7_3ea7_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2146_c7_3ea7]
signal tmp16_MUX_uxn_opcodes_h_l2146_c7_3ea7_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2146_c7_3ea7_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2146_c7_3ea7_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2146_c7_3ea7_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2146_c7_3ea7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2146_c7_3ea7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2146_c7_3ea7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2146_c7_3ea7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2146_c7_3ea7_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2146_c7_3ea7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2146_c7_3ea7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2146_c7_3ea7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2146_c7_3ea7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2146_c7_3ea7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2146_c7_3ea7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2146_c7_3ea7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2146_c7_3ea7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2146_c7_3ea7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2146_c7_3ea7_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2146_c7_3ea7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2146_c7_3ea7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2146_c7_3ea7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2146_c7_3ea7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2146_c7_3ea7_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2146_c7_3ea7]
signal result_u8_value_MUX_uxn_opcodes_h_l2146_c7_3ea7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2146_c7_3ea7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2146_c7_3ea7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2146_c7_3ea7_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2146_c7_3ea7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2146_c7_3ea7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2146_c7_3ea7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2146_c7_3ea7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2146_c7_3ea7_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l2146_c7_3ea7]
signal n16_MUX_uxn_opcodes_h_l2146_c7_3ea7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2146_c7_3ea7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2146_c7_3ea7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2146_c7_3ea7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2149_c11_8fd4]
signal BIN_OP_EQ_uxn_opcodes_h_l2149_c11_8fd4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2149_c11_8fd4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2149_c11_8fd4_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2149_c7_1e05]
signal t16_MUX_uxn_opcodes_h_l2149_c7_1e05_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2149_c7_1e05_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2149_c7_1e05_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2149_c7_1e05_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2149_c7_1e05]
signal tmp16_MUX_uxn_opcodes_h_l2149_c7_1e05_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2149_c7_1e05_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2149_c7_1e05_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2149_c7_1e05_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2149_c7_1e05]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_1e05_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_1e05_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_1e05_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_1e05_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2149_c7_1e05]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_1e05_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_1e05_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_1e05_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_1e05_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2149_c7_1e05]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_1e05_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_1e05_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_1e05_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_1e05_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2149_c7_1e05]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_1e05_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_1e05_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_1e05_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_1e05_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2149_c7_1e05]
signal result_u8_value_MUX_uxn_opcodes_h_l2149_c7_1e05_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2149_c7_1e05_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2149_c7_1e05_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2149_c7_1e05_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2149_c7_1e05]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_1e05_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_1e05_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_1e05_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_1e05_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l2149_c7_1e05]
signal n16_MUX_uxn_opcodes_h_l2149_c7_1e05_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2149_c7_1e05_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2149_c7_1e05_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2149_c7_1e05_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2150_c3_7e9b]
signal BIN_OP_OR_uxn_opcodes_h_l2150_c3_7e9b_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2150_c3_7e9b_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2150_c3_7e9b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2153_c11_23f2]
signal BIN_OP_EQ_uxn_opcodes_h_l2153_c11_23f2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2153_c11_23f2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2153_c11_23f2_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2153_c7_6aeb]
signal tmp16_MUX_uxn_opcodes_h_l2153_c7_6aeb_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2153_c7_6aeb_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2153_c7_6aeb_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2153_c7_6aeb_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2153_c7_6aeb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2153_c7_6aeb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2153_c7_6aeb_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2153_c7_6aeb_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2153_c7_6aeb_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2153_c7_6aeb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2153_c7_6aeb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2153_c7_6aeb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2153_c7_6aeb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2153_c7_6aeb_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2153_c7_6aeb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2153_c7_6aeb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2153_c7_6aeb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2153_c7_6aeb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2153_c7_6aeb_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2153_c7_6aeb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2153_c7_6aeb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2153_c7_6aeb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2153_c7_6aeb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2153_c7_6aeb_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2153_c7_6aeb]
signal result_u8_value_MUX_uxn_opcodes_h_l2153_c7_6aeb_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2153_c7_6aeb_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2153_c7_6aeb_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2153_c7_6aeb_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2153_c7_6aeb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2153_c7_6aeb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2153_c7_6aeb_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2153_c7_6aeb_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2153_c7_6aeb_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l2153_c7_6aeb]
signal n16_MUX_uxn_opcodes_h_l2153_c7_6aeb_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2153_c7_6aeb_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2153_c7_6aeb_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2153_c7_6aeb_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2156_c11_a5d7]
signal BIN_OP_EQ_uxn_opcodes_h_l2156_c11_a5d7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2156_c11_a5d7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2156_c11_a5d7_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2156_c7_9ee4]
signal tmp16_MUX_uxn_opcodes_h_l2156_c7_9ee4_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2156_c7_9ee4_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2156_c7_9ee4_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2156_c7_9ee4_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2156_c7_9ee4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2156_c7_9ee4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2156_c7_9ee4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2156_c7_9ee4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2156_c7_9ee4_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2156_c7_9ee4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2156_c7_9ee4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2156_c7_9ee4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2156_c7_9ee4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2156_c7_9ee4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2156_c7_9ee4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2156_c7_9ee4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2156_c7_9ee4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2156_c7_9ee4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2156_c7_9ee4_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2156_c7_9ee4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2156_c7_9ee4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2156_c7_9ee4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2156_c7_9ee4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2156_c7_9ee4_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2156_c7_9ee4]
signal result_u8_value_MUX_uxn_opcodes_h_l2156_c7_9ee4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2156_c7_9ee4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2156_c7_9ee4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2156_c7_9ee4_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2156_c7_9ee4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2156_c7_9ee4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2156_c7_9ee4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2156_c7_9ee4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2156_c7_9ee4_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l2156_c7_9ee4]
signal n16_MUX_uxn_opcodes_h_l2156_c7_9ee4_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2156_c7_9ee4_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2156_c7_9ee4_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2156_c7_9ee4_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2161_c11_efcb]
signal BIN_OP_EQ_uxn_opcodes_h_l2161_c11_efcb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2161_c11_efcb_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2161_c11_efcb_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2161_c7_7ca6]
signal tmp16_MUX_uxn_opcodes_h_l2161_c7_7ca6_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2161_c7_7ca6_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2161_c7_7ca6_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2161_c7_7ca6_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2161_c7_7ca6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2161_c7_7ca6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2161_c7_7ca6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2161_c7_7ca6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2161_c7_7ca6_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2161_c7_7ca6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2161_c7_7ca6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2161_c7_7ca6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2161_c7_7ca6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2161_c7_7ca6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2161_c7_7ca6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2161_c7_7ca6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2161_c7_7ca6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2161_c7_7ca6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2161_c7_7ca6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2161_c7_7ca6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2161_c7_7ca6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2161_c7_7ca6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2161_c7_7ca6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2161_c7_7ca6_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2161_c7_7ca6]
signal result_u8_value_MUX_uxn_opcodes_h_l2161_c7_7ca6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2161_c7_7ca6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2161_c7_7ca6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2161_c7_7ca6_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2161_c7_7ca6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2161_c7_7ca6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2161_c7_7ca6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2161_c7_7ca6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2161_c7_7ca6_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l2161_c7_7ca6]
signal n16_MUX_uxn_opcodes_h_l2161_c7_7ca6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2161_c7_7ca6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2161_c7_7ca6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2161_c7_7ca6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2164_c11_2746]
signal BIN_OP_EQ_uxn_opcodes_h_l2164_c11_2746_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2164_c11_2746_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2164_c11_2746_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2164_c7_69e5]
signal tmp16_MUX_uxn_opcodes_h_l2164_c7_69e5_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2164_c7_69e5_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2164_c7_69e5_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2164_c7_69e5_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2164_c7_69e5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2164_c7_69e5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2164_c7_69e5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2164_c7_69e5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2164_c7_69e5_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2164_c7_69e5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2164_c7_69e5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2164_c7_69e5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2164_c7_69e5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2164_c7_69e5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2164_c7_69e5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2164_c7_69e5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2164_c7_69e5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2164_c7_69e5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2164_c7_69e5_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2164_c7_69e5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2164_c7_69e5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2164_c7_69e5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2164_c7_69e5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2164_c7_69e5_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2164_c7_69e5]
signal result_u8_value_MUX_uxn_opcodes_h_l2164_c7_69e5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2164_c7_69e5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2164_c7_69e5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2164_c7_69e5_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2164_c7_69e5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2164_c7_69e5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2164_c7_69e5_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2164_c7_69e5_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2164_c7_69e5_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l2164_c7_69e5]
signal n16_MUX_uxn_opcodes_h_l2164_c7_69e5_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2164_c7_69e5_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2164_c7_69e5_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2164_c7_69e5_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2165_c3_a371]
signal BIN_OP_OR_uxn_opcodes_h_l2165_c3_a371_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2165_c3_a371_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2165_c3_a371_return_output : unsigned(15 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_opcodes_h_l2166_c11_6723]
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2166_c11_6723_left : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2166_c11_6723_right : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2166_c11_6723_return_output : unsigned(31 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2168_c30_b1ff]
signal sp_relative_shift_uxn_opcodes_h_l2168_c30_b1ff_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2168_c30_b1ff_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2168_c30_b1ff_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2168_c30_b1ff_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2173_c11_55b1]
signal BIN_OP_EQ_uxn_opcodes_h_l2173_c11_55b1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2173_c11_55b1_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2173_c11_55b1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2173_c7_a076]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_a076_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_a076_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_a076_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_a076_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2173_c7_a076]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_a076_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_a076_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_a076_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_a076_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2173_c7_a076]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_a076_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_a076_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_a076_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_a076_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2173_c7_a076]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_a076_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_a076_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_a076_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_a076_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2173_c7_a076]
signal result_u8_value_MUX_uxn_opcodes_h_l2173_c7_a076_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2173_c7_a076_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2173_c7_a076_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2173_c7_a076_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2176_c31_cf15]
signal CONST_SR_8_uxn_opcodes_h_l2176_c31_cf15_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2176_c31_cf15_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2178_c11_b9c5]
signal BIN_OP_EQ_uxn_opcodes_h_l2178_c11_b9c5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2178_c11_b9c5_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2178_c11_b9c5_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2178_c7_29f2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2178_c7_29f2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2178_c7_29f2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2178_c7_29f2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2178_c7_29f2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2178_c7_29f2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2178_c7_29f2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2178_c7_29f2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2178_c7_29f2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2178_c7_29f2_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2158_l2143_DUPLICATE_c87a
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2158_l2143_DUPLICATE_c87a_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2158_l2143_DUPLICATE_c87a_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_641b( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_address_sp_offset := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.u8_value := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2133_c6_2331
BIN_OP_EQ_uxn_opcodes_h_l2133_c6_2331 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2133_c6_2331_left,
BIN_OP_EQ_uxn_opcodes_h_l2133_c6_2331_right,
BIN_OP_EQ_uxn_opcodes_h_l2133_c6_2331_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_8bf1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_8bf1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_8bf1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_8bf1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_8bf1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_8bf1_return_output);

-- t16_MUX_uxn_opcodes_h_l2133_c2_c4d8
t16_MUX_uxn_opcodes_h_l2133_c2_c4d8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2133_c2_c4d8_cond,
t16_MUX_uxn_opcodes_h_l2133_c2_c4d8_iftrue,
t16_MUX_uxn_opcodes_h_l2133_c2_c4d8_iffalse,
t16_MUX_uxn_opcodes_h_l2133_c2_c4d8_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2133_c2_c4d8
tmp16_MUX_uxn_opcodes_h_l2133_c2_c4d8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2133_c2_c4d8_cond,
tmp16_MUX_uxn_opcodes_h_l2133_c2_c4d8_iftrue,
tmp16_MUX_uxn_opcodes_h_l2133_c2_c4d8_iffalse,
tmp16_MUX_uxn_opcodes_h_l2133_c2_c4d8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_c4d8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_c4d8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_c4d8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_c4d8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_c4d8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_c4d8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_c4d8
result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_c4d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_c4d8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_c4d8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_c4d8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_c4d8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_c4d8
result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_c4d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_c4d8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_c4d8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_c4d8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_c4d8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_c4d8
result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_c4d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_c4d8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_c4d8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_c4d8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_c4d8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2133_c2_c4d8
result_u8_value_MUX_uxn_opcodes_h_l2133_c2_c4d8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2133_c2_c4d8_cond,
result_u8_value_MUX_uxn_opcodes_h_l2133_c2_c4d8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2133_c2_c4d8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2133_c2_c4d8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_c4d8
result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_c4d8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_c4d8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_c4d8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_c4d8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_c4d8_return_output);

-- n16_MUX_uxn_opcodes_h_l2133_c2_c4d8
n16_MUX_uxn_opcodes_h_l2133_c2_c4d8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2133_c2_c4d8_cond,
n16_MUX_uxn_opcodes_h_l2133_c2_c4d8_iftrue,
n16_MUX_uxn_opcodes_h_l2133_c2_c4d8_iffalse,
n16_MUX_uxn_opcodes_h_l2133_c2_c4d8_return_output);

-- printf_uxn_opcodes_h_l2134_c3_8746_uxn_opcodes_h_l2134_c3_8746
printf_uxn_opcodes_h_l2134_c3_8746_uxn_opcodes_h_l2134_c3_8746 : entity work.printf_uxn_opcodes_h_l2134_c3_8746_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2134_c3_8746_uxn_opcodes_h_l2134_c3_8746_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2138_c11_dfd0
BIN_OP_EQ_uxn_opcodes_h_l2138_c11_dfd0 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2138_c11_dfd0_left,
BIN_OP_EQ_uxn_opcodes_h_l2138_c11_dfd0_right,
BIN_OP_EQ_uxn_opcodes_h_l2138_c11_dfd0_return_output);

-- t16_MUX_uxn_opcodes_h_l2138_c7_00a7
t16_MUX_uxn_opcodes_h_l2138_c7_00a7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2138_c7_00a7_cond,
t16_MUX_uxn_opcodes_h_l2138_c7_00a7_iftrue,
t16_MUX_uxn_opcodes_h_l2138_c7_00a7_iffalse,
t16_MUX_uxn_opcodes_h_l2138_c7_00a7_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2138_c7_00a7
tmp16_MUX_uxn_opcodes_h_l2138_c7_00a7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2138_c7_00a7_cond,
tmp16_MUX_uxn_opcodes_h_l2138_c7_00a7_iftrue,
tmp16_MUX_uxn_opcodes_h_l2138_c7_00a7_iffalse,
tmp16_MUX_uxn_opcodes_h_l2138_c7_00a7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_00a7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_00a7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_00a7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_00a7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_00a7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_00a7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_00a7
result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_00a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_00a7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_00a7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_00a7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_00a7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_00a7
result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_00a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_00a7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_00a7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_00a7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_00a7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_00a7
result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_00a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_00a7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_00a7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_00a7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_00a7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2138_c7_00a7
result_u8_value_MUX_uxn_opcodes_h_l2138_c7_00a7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2138_c7_00a7_cond,
result_u8_value_MUX_uxn_opcodes_h_l2138_c7_00a7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2138_c7_00a7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2138_c7_00a7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_00a7
result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_00a7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_00a7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_00a7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_00a7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_00a7_return_output);

-- n16_MUX_uxn_opcodes_h_l2138_c7_00a7
n16_MUX_uxn_opcodes_h_l2138_c7_00a7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2138_c7_00a7_cond,
n16_MUX_uxn_opcodes_h_l2138_c7_00a7_iftrue,
n16_MUX_uxn_opcodes_h_l2138_c7_00a7_iffalse,
n16_MUX_uxn_opcodes_h_l2138_c7_00a7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2141_c11_19d8
BIN_OP_EQ_uxn_opcodes_h_l2141_c11_19d8 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2141_c11_19d8_left,
BIN_OP_EQ_uxn_opcodes_h_l2141_c11_19d8_right,
BIN_OP_EQ_uxn_opcodes_h_l2141_c11_19d8_return_output);

-- t16_MUX_uxn_opcodes_h_l2141_c7_f179
t16_MUX_uxn_opcodes_h_l2141_c7_f179 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2141_c7_f179_cond,
t16_MUX_uxn_opcodes_h_l2141_c7_f179_iftrue,
t16_MUX_uxn_opcodes_h_l2141_c7_f179_iffalse,
t16_MUX_uxn_opcodes_h_l2141_c7_f179_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2141_c7_f179
tmp16_MUX_uxn_opcodes_h_l2141_c7_f179 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2141_c7_f179_cond,
tmp16_MUX_uxn_opcodes_h_l2141_c7_f179_iftrue,
tmp16_MUX_uxn_opcodes_h_l2141_c7_f179_iffalse,
tmp16_MUX_uxn_opcodes_h_l2141_c7_f179_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_f179
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_f179 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_f179_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_f179_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_f179_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_f179_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_f179
result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_f179 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_f179_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_f179_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_f179_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_f179_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_f179
result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_f179 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_f179_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_f179_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_f179_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_f179_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_f179
result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_f179 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_f179_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_f179_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_f179_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_f179_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2141_c7_f179
result_u8_value_MUX_uxn_opcodes_h_l2141_c7_f179 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2141_c7_f179_cond,
result_u8_value_MUX_uxn_opcodes_h_l2141_c7_f179_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2141_c7_f179_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2141_c7_f179_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_f179
result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_f179 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_f179_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_f179_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_f179_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_f179_return_output);

-- n16_MUX_uxn_opcodes_h_l2141_c7_f179
n16_MUX_uxn_opcodes_h_l2141_c7_f179 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2141_c7_f179_cond,
n16_MUX_uxn_opcodes_h_l2141_c7_f179_iftrue,
n16_MUX_uxn_opcodes_h_l2141_c7_f179_iffalse,
n16_MUX_uxn_opcodes_h_l2141_c7_f179_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2146_c11_f974
BIN_OP_EQ_uxn_opcodes_h_l2146_c11_f974 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2146_c11_f974_left,
BIN_OP_EQ_uxn_opcodes_h_l2146_c11_f974_right,
BIN_OP_EQ_uxn_opcodes_h_l2146_c11_f974_return_output);

-- t16_MUX_uxn_opcodes_h_l2146_c7_3ea7
t16_MUX_uxn_opcodes_h_l2146_c7_3ea7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2146_c7_3ea7_cond,
t16_MUX_uxn_opcodes_h_l2146_c7_3ea7_iftrue,
t16_MUX_uxn_opcodes_h_l2146_c7_3ea7_iffalse,
t16_MUX_uxn_opcodes_h_l2146_c7_3ea7_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2146_c7_3ea7
tmp16_MUX_uxn_opcodes_h_l2146_c7_3ea7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2146_c7_3ea7_cond,
tmp16_MUX_uxn_opcodes_h_l2146_c7_3ea7_iftrue,
tmp16_MUX_uxn_opcodes_h_l2146_c7_3ea7_iffalse,
tmp16_MUX_uxn_opcodes_h_l2146_c7_3ea7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2146_c7_3ea7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2146_c7_3ea7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2146_c7_3ea7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2146_c7_3ea7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2146_c7_3ea7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2146_c7_3ea7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2146_c7_3ea7
result_is_sp_shift_MUX_uxn_opcodes_h_l2146_c7_3ea7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2146_c7_3ea7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2146_c7_3ea7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2146_c7_3ea7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2146_c7_3ea7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2146_c7_3ea7
result_is_opc_done_MUX_uxn_opcodes_h_l2146_c7_3ea7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2146_c7_3ea7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2146_c7_3ea7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2146_c7_3ea7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2146_c7_3ea7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2146_c7_3ea7
result_is_stack_write_MUX_uxn_opcodes_h_l2146_c7_3ea7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2146_c7_3ea7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2146_c7_3ea7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2146_c7_3ea7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2146_c7_3ea7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2146_c7_3ea7
result_u8_value_MUX_uxn_opcodes_h_l2146_c7_3ea7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2146_c7_3ea7_cond,
result_u8_value_MUX_uxn_opcodes_h_l2146_c7_3ea7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2146_c7_3ea7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2146_c7_3ea7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2146_c7_3ea7
result_sp_relative_shift_MUX_uxn_opcodes_h_l2146_c7_3ea7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2146_c7_3ea7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2146_c7_3ea7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2146_c7_3ea7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2146_c7_3ea7_return_output);

-- n16_MUX_uxn_opcodes_h_l2146_c7_3ea7
n16_MUX_uxn_opcodes_h_l2146_c7_3ea7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2146_c7_3ea7_cond,
n16_MUX_uxn_opcodes_h_l2146_c7_3ea7_iftrue,
n16_MUX_uxn_opcodes_h_l2146_c7_3ea7_iffalse,
n16_MUX_uxn_opcodes_h_l2146_c7_3ea7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2149_c11_8fd4
BIN_OP_EQ_uxn_opcodes_h_l2149_c11_8fd4 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2149_c11_8fd4_left,
BIN_OP_EQ_uxn_opcodes_h_l2149_c11_8fd4_right,
BIN_OP_EQ_uxn_opcodes_h_l2149_c11_8fd4_return_output);

-- t16_MUX_uxn_opcodes_h_l2149_c7_1e05
t16_MUX_uxn_opcodes_h_l2149_c7_1e05 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2149_c7_1e05_cond,
t16_MUX_uxn_opcodes_h_l2149_c7_1e05_iftrue,
t16_MUX_uxn_opcodes_h_l2149_c7_1e05_iffalse,
t16_MUX_uxn_opcodes_h_l2149_c7_1e05_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2149_c7_1e05
tmp16_MUX_uxn_opcodes_h_l2149_c7_1e05 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2149_c7_1e05_cond,
tmp16_MUX_uxn_opcodes_h_l2149_c7_1e05_iftrue,
tmp16_MUX_uxn_opcodes_h_l2149_c7_1e05_iffalse,
tmp16_MUX_uxn_opcodes_h_l2149_c7_1e05_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_1e05
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_1e05 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_1e05_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_1e05_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_1e05_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_1e05_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_1e05
result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_1e05 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_1e05_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_1e05_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_1e05_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_1e05_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_1e05
result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_1e05 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_1e05_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_1e05_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_1e05_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_1e05_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_1e05
result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_1e05 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_1e05_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_1e05_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_1e05_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_1e05_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2149_c7_1e05
result_u8_value_MUX_uxn_opcodes_h_l2149_c7_1e05 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2149_c7_1e05_cond,
result_u8_value_MUX_uxn_opcodes_h_l2149_c7_1e05_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2149_c7_1e05_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2149_c7_1e05_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_1e05
result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_1e05 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_1e05_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_1e05_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_1e05_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_1e05_return_output);

-- n16_MUX_uxn_opcodes_h_l2149_c7_1e05
n16_MUX_uxn_opcodes_h_l2149_c7_1e05 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2149_c7_1e05_cond,
n16_MUX_uxn_opcodes_h_l2149_c7_1e05_iftrue,
n16_MUX_uxn_opcodes_h_l2149_c7_1e05_iffalse,
n16_MUX_uxn_opcodes_h_l2149_c7_1e05_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2150_c3_7e9b
BIN_OP_OR_uxn_opcodes_h_l2150_c3_7e9b : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2150_c3_7e9b_left,
BIN_OP_OR_uxn_opcodes_h_l2150_c3_7e9b_right,
BIN_OP_OR_uxn_opcodes_h_l2150_c3_7e9b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2153_c11_23f2
BIN_OP_EQ_uxn_opcodes_h_l2153_c11_23f2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2153_c11_23f2_left,
BIN_OP_EQ_uxn_opcodes_h_l2153_c11_23f2_right,
BIN_OP_EQ_uxn_opcodes_h_l2153_c11_23f2_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2153_c7_6aeb
tmp16_MUX_uxn_opcodes_h_l2153_c7_6aeb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2153_c7_6aeb_cond,
tmp16_MUX_uxn_opcodes_h_l2153_c7_6aeb_iftrue,
tmp16_MUX_uxn_opcodes_h_l2153_c7_6aeb_iffalse,
tmp16_MUX_uxn_opcodes_h_l2153_c7_6aeb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2153_c7_6aeb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2153_c7_6aeb : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2153_c7_6aeb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2153_c7_6aeb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2153_c7_6aeb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2153_c7_6aeb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2153_c7_6aeb
result_is_sp_shift_MUX_uxn_opcodes_h_l2153_c7_6aeb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2153_c7_6aeb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2153_c7_6aeb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2153_c7_6aeb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2153_c7_6aeb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2153_c7_6aeb
result_is_opc_done_MUX_uxn_opcodes_h_l2153_c7_6aeb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2153_c7_6aeb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2153_c7_6aeb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2153_c7_6aeb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2153_c7_6aeb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2153_c7_6aeb
result_is_stack_write_MUX_uxn_opcodes_h_l2153_c7_6aeb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2153_c7_6aeb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2153_c7_6aeb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2153_c7_6aeb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2153_c7_6aeb_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2153_c7_6aeb
result_u8_value_MUX_uxn_opcodes_h_l2153_c7_6aeb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2153_c7_6aeb_cond,
result_u8_value_MUX_uxn_opcodes_h_l2153_c7_6aeb_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2153_c7_6aeb_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2153_c7_6aeb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2153_c7_6aeb
result_sp_relative_shift_MUX_uxn_opcodes_h_l2153_c7_6aeb : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2153_c7_6aeb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2153_c7_6aeb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2153_c7_6aeb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2153_c7_6aeb_return_output);

-- n16_MUX_uxn_opcodes_h_l2153_c7_6aeb
n16_MUX_uxn_opcodes_h_l2153_c7_6aeb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2153_c7_6aeb_cond,
n16_MUX_uxn_opcodes_h_l2153_c7_6aeb_iftrue,
n16_MUX_uxn_opcodes_h_l2153_c7_6aeb_iffalse,
n16_MUX_uxn_opcodes_h_l2153_c7_6aeb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2156_c11_a5d7
BIN_OP_EQ_uxn_opcodes_h_l2156_c11_a5d7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2156_c11_a5d7_left,
BIN_OP_EQ_uxn_opcodes_h_l2156_c11_a5d7_right,
BIN_OP_EQ_uxn_opcodes_h_l2156_c11_a5d7_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2156_c7_9ee4
tmp16_MUX_uxn_opcodes_h_l2156_c7_9ee4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2156_c7_9ee4_cond,
tmp16_MUX_uxn_opcodes_h_l2156_c7_9ee4_iftrue,
tmp16_MUX_uxn_opcodes_h_l2156_c7_9ee4_iffalse,
tmp16_MUX_uxn_opcodes_h_l2156_c7_9ee4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2156_c7_9ee4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2156_c7_9ee4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2156_c7_9ee4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2156_c7_9ee4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2156_c7_9ee4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2156_c7_9ee4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2156_c7_9ee4
result_is_sp_shift_MUX_uxn_opcodes_h_l2156_c7_9ee4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2156_c7_9ee4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2156_c7_9ee4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2156_c7_9ee4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2156_c7_9ee4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2156_c7_9ee4
result_is_opc_done_MUX_uxn_opcodes_h_l2156_c7_9ee4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2156_c7_9ee4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2156_c7_9ee4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2156_c7_9ee4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2156_c7_9ee4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2156_c7_9ee4
result_is_stack_write_MUX_uxn_opcodes_h_l2156_c7_9ee4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2156_c7_9ee4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2156_c7_9ee4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2156_c7_9ee4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2156_c7_9ee4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2156_c7_9ee4
result_u8_value_MUX_uxn_opcodes_h_l2156_c7_9ee4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2156_c7_9ee4_cond,
result_u8_value_MUX_uxn_opcodes_h_l2156_c7_9ee4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2156_c7_9ee4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2156_c7_9ee4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2156_c7_9ee4
result_sp_relative_shift_MUX_uxn_opcodes_h_l2156_c7_9ee4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2156_c7_9ee4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2156_c7_9ee4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2156_c7_9ee4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2156_c7_9ee4_return_output);

-- n16_MUX_uxn_opcodes_h_l2156_c7_9ee4
n16_MUX_uxn_opcodes_h_l2156_c7_9ee4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2156_c7_9ee4_cond,
n16_MUX_uxn_opcodes_h_l2156_c7_9ee4_iftrue,
n16_MUX_uxn_opcodes_h_l2156_c7_9ee4_iffalse,
n16_MUX_uxn_opcodes_h_l2156_c7_9ee4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2161_c11_efcb
BIN_OP_EQ_uxn_opcodes_h_l2161_c11_efcb : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2161_c11_efcb_left,
BIN_OP_EQ_uxn_opcodes_h_l2161_c11_efcb_right,
BIN_OP_EQ_uxn_opcodes_h_l2161_c11_efcb_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2161_c7_7ca6
tmp16_MUX_uxn_opcodes_h_l2161_c7_7ca6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2161_c7_7ca6_cond,
tmp16_MUX_uxn_opcodes_h_l2161_c7_7ca6_iftrue,
tmp16_MUX_uxn_opcodes_h_l2161_c7_7ca6_iffalse,
tmp16_MUX_uxn_opcodes_h_l2161_c7_7ca6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2161_c7_7ca6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2161_c7_7ca6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2161_c7_7ca6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2161_c7_7ca6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2161_c7_7ca6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2161_c7_7ca6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2161_c7_7ca6
result_is_sp_shift_MUX_uxn_opcodes_h_l2161_c7_7ca6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2161_c7_7ca6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2161_c7_7ca6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2161_c7_7ca6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2161_c7_7ca6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2161_c7_7ca6
result_is_opc_done_MUX_uxn_opcodes_h_l2161_c7_7ca6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2161_c7_7ca6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2161_c7_7ca6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2161_c7_7ca6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2161_c7_7ca6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2161_c7_7ca6
result_is_stack_write_MUX_uxn_opcodes_h_l2161_c7_7ca6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2161_c7_7ca6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2161_c7_7ca6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2161_c7_7ca6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2161_c7_7ca6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2161_c7_7ca6
result_u8_value_MUX_uxn_opcodes_h_l2161_c7_7ca6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2161_c7_7ca6_cond,
result_u8_value_MUX_uxn_opcodes_h_l2161_c7_7ca6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2161_c7_7ca6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2161_c7_7ca6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2161_c7_7ca6
result_sp_relative_shift_MUX_uxn_opcodes_h_l2161_c7_7ca6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2161_c7_7ca6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2161_c7_7ca6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2161_c7_7ca6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2161_c7_7ca6_return_output);

-- n16_MUX_uxn_opcodes_h_l2161_c7_7ca6
n16_MUX_uxn_opcodes_h_l2161_c7_7ca6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2161_c7_7ca6_cond,
n16_MUX_uxn_opcodes_h_l2161_c7_7ca6_iftrue,
n16_MUX_uxn_opcodes_h_l2161_c7_7ca6_iffalse,
n16_MUX_uxn_opcodes_h_l2161_c7_7ca6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2164_c11_2746
BIN_OP_EQ_uxn_opcodes_h_l2164_c11_2746 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2164_c11_2746_left,
BIN_OP_EQ_uxn_opcodes_h_l2164_c11_2746_right,
BIN_OP_EQ_uxn_opcodes_h_l2164_c11_2746_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2164_c7_69e5
tmp16_MUX_uxn_opcodes_h_l2164_c7_69e5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2164_c7_69e5_cond,
tmp16_MUX_uxn_opcodes_h_l2164_c7_69e5_iftrue,
tmp16_MUX_uxn_opcodes_h_l2164_c7_69e5_iffalse,
tmp16_MUX_uxn_opcodes_h_l2164_c7_69e5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2164_c7_69e5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2164_c7_69e5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2164_c7_69e5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2164_c7_69e5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2164_c7_69e5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2164_c7_69e5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2164_c7_69e5
result_is_sp_shift_MUX_uxn_opcodes_h_l2164_c7_69e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2164_c7_69e5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2164_c7_69e5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2164_c7_69e5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2164_c7_69e5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2164_c7_69e5
result_is_opc_done_MUX_uxn_opcodes_h_l2164_c7_69e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2164_c7_69e5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2164_c7_69e5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2164_c7_69e5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2164_c7_69e5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2164_c7_69e5
result_is_stack_write_MUX_uxn_opcodes_h_l2164_c7_69e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2164_c7_69e5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2164_c7_69e5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2164_c7_69e5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2164_c7_69e5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2164_c7_69e5
result_u8_value_MUX_uxn_opcodes_h_l2164_c7_69e5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2164_c7_69e5_cond,
result_u8_value_MUX_uxn_opcodes_h_l2164_c7_69e5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2164_c7_69e5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2164_c7_69e5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2164_c7_69e5
result_sp_relative_shift_MUX_uxn_opcodes_h_l2164_c7_69e5 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2164_c7_69e5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2164_c7_69e5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2164_c7_69e5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2164_c7_69e5_return_output);

-- n16_MUX_uxn_opcodes_h_l2164_c7_69e5
n16_MUX_uxn_opcodes_h_l2164_c7_69e5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2164_c7_69e5_cond,
n16_MUX_uxn_opcodes_h_l2164_c7_69e5_iftrue,
n16_MUX_uxn_opcodes_h_l2164_c7_69e5_iffalse,
n16_MUX_uxn_opcodes_h_l2164_c7_69e5_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2165_c3_a371
BIN_OP_OR_uxn_opcodes_h_l2165_c3_a371 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2165_c3_a371_left,
BIN_OP_OR_uxn_opcodes_h_l2165_c3_a371_right,
BIN_OP_OR_uxn_opcodes_h_l2165_c3_a371_return_output);

-- BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2166_c11_6723
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2166_c11_6723 : entity work.BIN_OP_INFERRED_MULT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2166_c11_6723_left,
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2166_c11_6723_right,
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2166_c11_6723_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2168_c30_b1ff
sp_relative_shift_uxn_opcodes_h_l2168_c30_b1ff : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2168_c30_b1ff_ins,
sp_relative_shift_uxn_opcodes_h_l2168_c30_b1ff_x,
sp_relative_shift_uxn_opcodes_h_l2168_c30_b1ff_y,
sp_relative_shift_uxn_opcodes_h_l2168_c30_b1ff_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2173_c11_55b1
BIN_OP_EQ_uxn_opcodes_h_l2173_c11_55b1 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2173_c11_55b1_left,
BIN_OP_EQ_uxn_opcodes_h_l2173_c11_55b1_right,
BIN_OP_EQ_uxn_opcodes_h_l2173_c11_55b1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_a076
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_a076 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_a076_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_a076_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_a076_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_a076_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_a076
result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_a076 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_a076_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_a076_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_a076_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_a076_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_a076
result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_a076 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_a076_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_a076_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_a076_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_a076_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_a076
result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_a076 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_a076_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_a076_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_a076_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_a076_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2173_c7_a076
result_u8_value_MUX_uxn_opcodes_h_l2173_c7_a076 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2173_c7_a076_cond,
result_u8_value_MUX_uxn_opcodes_h_l2173_c7_a076_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2173_c7_a076_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2173_c7_a076_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2176_c31_cf15
CONST_SR_8_uxn_opcodes_h_l2176_c31_cf15 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2176_c31_cf15_x,
CONST_SR_8_uxn_opcodes_h_l2176_c31_cf15_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2178_c11_b9c5
BIN_OP_EQ_uxn_opcodes_h_l2178_c11_b9c5 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2178_c11_b9c5_left,
BIN_OP_EQ_uxn_opcodes_h_l2178_c11_b9c5_right,
BIN_OP_EQ_uxn_opcodes_h_l2178_c11_b9c5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2178_c7_29f2
result_is_stack_write_MUX_uxn_opcodes_h_l2178_c7_29f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2178_c7_29f2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2178_c7_29f2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2178_c7_29f2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2178_c7_29f2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2178_c7_29f2
result_is_opc_done_MUX_uxn_opcodes_h_l2178_c7_29f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2178_c7_29f2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2178_c7_29f2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2178_c7_29f2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2178_c7_29f2_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2158_l2143_DUPLICATE_c87a
CONST_SL_8_uint16_t_uxn_opcodes_h_l2158_l2143_DUPLICATE_c87a : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2158_l2143_DUPLICATE_c87a_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2158_l2143_DUPLICATE_c87a_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2133_c6_2331_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_8bf1_return_output,
 t16_MUX_uxn_opcodes_h_l2133_c2_c4d8_return_output,
 tmp16_MUX_uxn_opcodes_h_l2133_c2_c4d8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_c4d8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_c4d8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_c4d8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_c4d8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2133_c2_c4d8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_c4d8_return_output,
 n16_MUX_uxn_opcodes_h_l2133_c2_c4d8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2138_c11_dfd0_return_output,
 t16_MUX_uxn_opcodes_h_l2138_c7_00a7_return_output,
 tmp16_MUX_uxn_opcodes_h_l2138_c7_00a7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_00a7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_00a7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_00a7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_00a7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2138_c7_00a7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_00a7_return_output,
 n16_MUX_uxn_opcodes_h_l2138_c7_00a7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2141_c11_19d8_return_output,
 t16_MUX_uxn_opcodes_h_l2141_c7_f179_return_output,
 tmp16_MUX_uxn_opcodes_h_l2141_c7_f179_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_f179_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_f179_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_f179_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_f179_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2141_c7_f179_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_f179_return_output,
 n16_MUX_uxn_opcodes_h_l2141_c7_f179_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2146_c11_f974_return_output,
 t16_MUX_uxn_opcodes_h_l2146_c7_3ea7_return_output,
 tmp16_MUX_uxn_opcodes_h_l2146_c7_3ea7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2146_c7_3ea7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2146_c7_3ea7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2146_c7_3ea7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2146_c7_3ea7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2146_c7_3ea7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2146_c7_3ea7_return_output,
 n16_MUX_uxn_opcodes_h_l2146_c7_3ea7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2149_c11_8fd4_return_output,
 t16_MUX_uxn_opcodes_h_l2149_c7_1e05_return_output,
 tmp16_MUX_uxn_opcodes_h_l2149_c7_1e05_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_1e05_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_1e05_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_1e05_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_1e05_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2149_c7_1e05_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_1e05_return_output,
 n16_MUX_uxn_opcodes_h_l2149_c7_1e05_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2150_c3_7e9b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2153_c11_23f2_return_output,
 tmp16_MUX_uxn_opcodes_h_l2153_c7_6aeb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2153_c7_6aeb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2153_c7_6aeb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2153_c7_6aeb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2153_c7_6aeb_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2153_c7_6aeb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2153_c7_6aeb_return_output,
 n16_MUX_uxn_opcodes_h_l2153_c7_6aeb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2156_c11_a5d7_return_output,
 tmp16_MUX_uxn_opcodes_h_l2156_c7_9ee4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2156_c7_9ee4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2156_c7_9ee4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2156_c7_9ee4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2156_c7_9ee4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2156_c7_9ee4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2156_c7_9ee4_return_output,
 n16_MUX_uxn_opcodes_h_l2156_c7_9ee4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2161_c11_efcb_return_output,
 tmp16_MUX_uxn_opcodes_h_l2161_c7_7ca6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2161_c7_7ca6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2161_c7_7ca6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2161_c7_7ca6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2161_c7_7ca6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2161_c7_7ca6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2161_c7_7ca6_return_output,
 n16_MUX_uxn_opcodes_h_l2161_c7_7ca6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2164_c11_2746_return_output,
 tmp16_MUX_uxn_opcodes_h_l2164_c7_69e5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2164_c7_69e5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2164_c7_69e5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2164_c7_69e5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2164_c7_69e5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2164_c7_69e5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2164_c7_69e5_return_output,
 n16_MUX_uxn_opcodes_h_l2164_c7_69e5_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2165_c3_a371_return_output,
 BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2166_c11_6723_return_output,
 sp_relative_shift_uxn_opcodes_h_l2168_c30_b1ff_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2173_c11_55b1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_a076_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_a076_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_a076_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_a076_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2173_c7_a076_return_output,
 CONST_SR_8_uxn_opcodes_h_l2176_c31_cf15_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2178_c11_b9c5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2178_c7_29f2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2178_c7_29f2_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2158_l2143_DUPLICATE_c87a_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c6_2331_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c6_2331_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c6_2331_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_8bf1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_8bf1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_8bf1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_8bf1_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2133_c2_c4d8_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2133_c2_c4d8_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2138_c7_00a7_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2133_c2_c4d8_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2133_c2_c4d8_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2133_c2_c4d8_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2133_c2_c4d8_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2138_c7_00a7_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2133_c2_c4d8_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2133_c2_c4d8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_c4d8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2135_c3_b25f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_c4d8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_00a7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_c4d8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_c4d8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_c4d8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_c4d8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_00a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_c4d8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_c4d8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_c4d8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_c4d8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_00a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_c4d8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_c4d8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_c4d8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_c4d8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_00a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_c4d8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_c4d8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c2_c4d8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c2_c4d8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2138_c7_00a7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c2_c4d8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c2_c4d8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_c4d8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_c4d8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_00a7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_c4d8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_c4d8_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2133_c2_c4d8_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2133_c2_c4d8_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2138_c7_00a7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2133_c2_c4d8_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2133_c2_c4d8_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2134_c3_8746_uxn_opcodes_h_l2134_c3_8746_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_dfd0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_dfd0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_dfd0_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2138_c7_00a7_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2138_c7_00a7_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2141_c7_f179_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2138_c7_00a7_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2138_c7_00a7_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2138_c7_00a7_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2141_c7_f179_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2138_c7_00a7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_00a7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2139_c3_b6ab : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_00a7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_f179_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_00a7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_00a7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_00a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_f179_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_00a7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_00a7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_00a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_f179_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_00a7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_00a7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_00a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_f179_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_00a7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2138_c7_00a7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2138_c7_00a7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c7_f179_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2138_c7_00a7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_00a7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_00a7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_f179_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_00a7_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2138_c7_00a7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2138_c7_00a7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2141_c7_f179_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2138_c7_00a7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_19d8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_19d8_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_19d8_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2141_c7_f179_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2141_c7_f179_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2146_c7_3ea7_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2141_c7_f179_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2141_c7_f179_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2141_c7_f179_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2146_c7_3ea7_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2141_c7_f179_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_f179_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2144_c3_fbe5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_f179_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2146_c7_3ea7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_f179_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_f179_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_f179_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2146_c7_3ea7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_f179_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_f179_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_f179_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2146_c7_3ea7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_f179_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_f179_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_f179_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2146_c7_3ea7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_f179_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c7_f179_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c7_f179_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2146_c7_3ea7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c7_f179_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_f179_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_f179_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2146_c7_3ea7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_f179_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2141_c7_f179_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2141_c7_f179_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2146_c7_3ea7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2141_c7_f179_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2146_c11_f974_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2146_c11_f974_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2146_c11_f974_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2146_c7_3ea7_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2146_c7_3ea7_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2149_c7_1e05_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2146_c7_3ea7_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2146_c7_3ea7_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2146_c7_3ea7_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2149_c7_1e05_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2146_c7_3ea7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2146_c7_3ea7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2147_c3_017a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2146_c7_3ea7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_1e05_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2146_c7_3ea7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2146_c7_3ea7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2146_c7_3ea7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_1e05_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2146_c7_3ea7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2146_c7_3ea7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2146_c7_3ea7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_1e05_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2146_c7_3ea7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2146_c7_3ea7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2146_c7_3ea7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_1e05_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2146_c7_3ea7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2146_c7_3ea7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2146_c7_3ea7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2149_c7_1e05_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2146_c7_3ea7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2146_c7_3ea7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2146_c7_3ea7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_1e05_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2146_c7_3ea7_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2146_c7_3ea7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2146_c7_3ea7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2149_c7_1e05_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2146_c7_3ea7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_8fd4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_8fd4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_8fd4_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2149_c7_1e05_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2149_c7_1e05_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2149_c7_1e05_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2149_c7_1e05_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2149_c7_1e05_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2153_c7_6aeb_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2149_c7_1e05_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_1e05_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2151_c3_1e93 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_1e05_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2153_c7_6aeb_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_1e05_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_1e05_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_1e05_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2153_c7_6aeb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_1e05_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_1e05_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_1e05_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2153_c7_6aeb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_1e05_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_1e05_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_1e05_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2153_c7_6aeb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_1e05_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2149_c7_1e05_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2149_c7_1e05_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2153_c7_6aeb_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2149_c7_1e05_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_1e05_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_1e05_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2153_c7_6aeb_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_1e05_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2149_c7_1e05_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2149_c7_1e05_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2153_c7_6aeb_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2149_c7_1e05_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2150_c3_7e9b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2150_c3_7e9b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2150_c3_7e9b_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2153_c11_23f2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2153_c11_23f2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2153_c11_23f2_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2153_c7_6aeb_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2153_c7_6aeb_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2156_c7_9ee4_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2153_c7_6aeb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2153_c7_6aeb_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2154_c3_7a6b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2153_c7_6aeb_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2156_c7_9ee4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2153_c7_6aeb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2153_c7_6aeb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2153_c7_6aeb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2156_c7_9ee4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2153_c7_6aeb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2153_c7_6aeb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2153_c7_6aeb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2156_c7_9ee4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2153_c7_6aeb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2153_c7_6aeb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2153_c7_6aeb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2156_c7_9ee4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2153_c7_6aeb_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2153_c7_6aeb_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2153_c7_6aeb_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2156_c7_9ee4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2153_c7_6aeb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2153_c7_6aeb_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2153_c7_6aeb_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2156_c7_9ee4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2153_c7_6aeb_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2153_c7_6aeb_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2153_c7_6aeb_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2156_c7_9ee4_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2153_c7_6aeb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2156_c11_a5d7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2156_c11_a5d7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2156_c11_a5d7_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2156_c7_9ee4_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2156_c7_9ee4_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2161_c7_7ca6_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2156_c7_9ee4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2156_c7_9ee4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2159_c3_ab1f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2156_c7_9ee4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2161_c7_7ca6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2156_c7_9ee4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2156_c7_9ee4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2156_c7_9ee4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2161_c7_7ca6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2156_c7_9ee4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2156_c7_9ee4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2156_c7_9ee4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2161_c7_7ca6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2156_c7_9ee4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2156_c7_9ee4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2156_c7_9ee4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2161_c7_7ca6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2156_c7_9ee4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2156_c7_9ee4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2156_c7_9ee4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2161_c7_7ca6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2156_c7_9ee4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2156_c7_9ee4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2156_c7_9ee4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2161_c7_7ca6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2156_c7_9ee4_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2156_c7_9ee4_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2156_c7_9ee4_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2161_c7_7ca6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2156_c7_9ee4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2161_c11_efcb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2161_c11_efcb_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2161_c11_efcb_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2161_c7_7ca6_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2161_c7_7ca6_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2164_c7_69e5_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2161_c7_7ca6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2161_c7_7ca6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2162_c3_19c4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2161_c7_7ca6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2164_c7_69e5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2161_c7_7ca6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2161_c7_7ca6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2161_c7_7ca6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2164_c7_69e5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2161_c7_7ca6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2161_c7_7ca6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2161_c7_7ca6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2164_c7_69e5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2161_c7_7ca6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2161_c7_7ca6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2161_c7_7ca6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2164_c7_69e5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2161_c7_7ca6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2161_c7_7ca6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2161_c7_7ca6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2164_c7_69e5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2161_c7_7ca6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2161_c7_7ca6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2161_c7_7ca6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2164_c7_69e5_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2161_c7_7ca6_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2161_c7_7ca6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2161_c7_7ca6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2164_c7_69e5_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2161_c7_7ca6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2164_c11_2746_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2164_c11_2746_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2164_c11_2746_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2164_c7_69e5_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l2166_c3_85ca : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2164_c7_69e5_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2164_c7_69e5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2164_c7_69e5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2170_c3_529d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2164_c7_69e5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_a076_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2164_c7_69e5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2164_c7_69e5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2164_c7_69e5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_a076_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2164_c7_69e5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2164_c7_69e5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2164_c7_69e5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_a076_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2164_c7_69e5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2164_c7_69e5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2164_c7_69e5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_a076_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2164_c7_69e5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2164_c7_69e5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2164_c7_69e5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2173_c7_a076_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2164_c7_69e5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2164_c7_69e5_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2164_c7_69e5_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2164_c7_69e5_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2164_c7_69e5_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2164_c7_69e5_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2164_c7_69e5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2165_c3_a371_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2165_c3_a371_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2165_c3_a371_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2166_c11_6723_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2166_c11_6723_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2166_c11_6723_return_output : unsigned(31 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2168_c30_b1ff_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2168_c30_b1ff_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2168_c30_b1ff_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2168_c30_b1ff_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2171_c21_d285_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c11_55b1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c11_55b1_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c11_55b1_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_a076_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2175_c3_7c59 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_a076_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2173_c7_a076_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_a076_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_a076_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_a076_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_a076_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_a076_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_a076_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2178_c7_29f2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_a076_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_a076_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_a076_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2178_c7_29f2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_a076_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2173_c7_a076_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2173_c7_a076_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2173_c7_a076_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2176_c31_cf15_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2176_c31_cf15_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2176_c21_8228_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2178_c11_b9c5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2178_c11_b9c5_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2178_c11_b9c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2178_c7_29f2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2178_c7_29f2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2178_c7_29f2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2178_c7_29f2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2178_c7_29f2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2178_c7_29f2_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2161_l2133_l2156_l2153_l2149_l2146_l2173_l2141_l2138_DUPLICATE_ec8a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2161_l2133_l2156_l2153_l2149_l2178_l2146_l2173_l2141_l2138_DUPLICATE_5f9d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2161_l2133_l2156_l2153_l2149_l2146_l2173_l2141_l2138_DUPLICATE_087b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2161_l2133_l2156_l2153_l2149_l2146_l2141_l2164_l2138_DUPLICATE_feb4_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2161_l2156_l2153_l2149_l2178_l2146_l2173_l2141_l2164_l2138_DUPLICATE_226c_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2157_l2150_l2142_l2165_DUPLICATE_d6c9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2158_l2143_DUPLICATE_c87a_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2158_l2143_DUPLICATE_c87a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l2183_l2129_DUPLICATE_5039_return_output : opcode_result_t;
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
     VAR_sp_relative_shift_uxn_opcodes_h_l2168_c30_b1ff_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2153_c11_23f2_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2135_c3_b25f := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_c4d8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2135_c3_b25f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c11_55b1_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c6_2331_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2156_c11_a5d7_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2147_c3_017a := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2146_c7_3ea7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2147_c3_017a;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2159_c3_ab1f := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2156_c7_9ee4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2159_c3_ab1f;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2178_c7_29f2_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_dfd0_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2168_c30_b1ff_y := resize(to_signed(-2, 3), 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2178_c7_29f2_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2146_c11_f974_right := to_unsigned(3, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_a076_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2170_c3_529d := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2164_c7_69e5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2170_c3_529d;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2139_c3_b6ab := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_00a7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2139_c3_b6ab;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_19d8_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_c4d8_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2175_c3_7c59 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_a076_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2175_c3_7c59;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2154_c3_7a6b := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2153_c7_6aeb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2154_c3_7a6b;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2162_c3_19c4 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2161_c7_7ca6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2162_c3_19c4;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2151_c3_1e93 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_1e05_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2151_c3_1e93;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2164_c7_69e5_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_8fd4_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2164_c11_2746_right := to_unsigned(8, 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2164_c7_69e5_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2178_c11_b9c5_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2161_c11_efcb_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2144_c3_fbe5 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_f179_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2144_c3_fbe5;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_8bf1_iffalse := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_8bf1_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l2168_c30_b1ff_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2165_c3_a371_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2133_c2_c4d8_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2138_c7_00a7_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2141_c7_f179_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2146_c7_3ea7_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2149_c7_1e05_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2153_c7_6aeb_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2161_c7_7ca6_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2164_c7_69e5_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c6_2331_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_dfd0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_19d8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2146_c11_f974_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_8fd4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2153_c11_23f2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2156_c11_a5d7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2161_c11_efcb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2164_c11_2746_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c11_55b1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2178_c11_b9c5_left := VAR_phase;
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2166_c11_6723_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2150_c3_7e9b_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2133_c2_c4d8_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2138_c7_00a7_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2146_c7_3ea7_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2149_c7_1e05_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2176_c31_cf15_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2133_c2_c4d8_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2138_c7_00a7_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2141_c7_f179_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2146_c7_3ea7_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2149_c7_1e05_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2153_c7_6aeb_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2156_c7_9ee4_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2161_c7_7ca6_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2164_c7_69e5_iffalse := tmp16;
     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2173_c7_a076] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2173_c7_a076_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2161_c11_efcb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2161_c11_efcb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2161_c11_efcb_left;
     BIN_OP_EQ_uxn_opcodes_h_l2161_c11_efcb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2161_c11_efcb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2161_c11_efcb_return_output := BIN_OP_EQ_uxn_opcodes_h_l2161_c11_efcb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2156_c11_a5d7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2156_c11_a5d7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2156_c11_a5d7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2156_c11_a5d7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2156_c11_a5d7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2156_c11_a5d7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2156_c11_a5d7_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2161_l2133_l2156_l2153_l2149_l2146_l2173_l2141_l2138_DUPLICATE_ec8a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2161_l2133_l2156_l2153_l2149_l2146_l2173_l2141_l2138_DUPLICATE_ec8a_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2161_l2133_l2156_l2153_l2149_l2146_l2173_l2141_l2138_DUPLICATE_087b LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2161_l2133_l2156_l2153_l2149_l2146_l2173_l2141_l2138_DUPLICATE_087b_return_output := result.u8_value;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2157_l2150_l2142_l2165_DUPLICATE_d6c9 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2157_l2150_l2142_l2165_DUPLICATE_d6c9_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2153_c11_23f2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2153_c11_23f2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2153_c11_23f2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2153_c11_23f2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2153_c11_23f2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2153_c11_23f2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2153_c11_23f2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2173_c11_55b1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2173_c11_55b1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c11_55b1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2173_c11_55b1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c11_55b1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c11_55b1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2173_c11_55b1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2141_c11_19d8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2141_c11_19d8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_19d8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2141_c11_19d8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_19d8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_19d8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2141_c11_19d8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2138_c11_dfd0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2138_c11_dfd0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_dfd0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2138_c11_dfd0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_dfd0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_dfd0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2138_c11_dfd0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2146_c11_f974] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2146_c11_f974_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2146_c11_f974_left;
     BIN_OP_EQ_uxn_opcodes_h_l2146_c11_f974_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2146_c11_f974_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2146_c11_f974_return_output := BIN_OP_EQ_uxn_opcodes_h_l2146_c11_f974_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2178_c11_b9c5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2178_c11_b9c5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2178_c11_b9c5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2178_c11_b9c5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2178_c11_b9c5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2178_c11_b9c5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2178_c11_b9c5_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2168_c30_b1ff] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2168_c30_b1ff_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2168_c30_b1ff_ins;
     sp_relative_shift_uxn_opcodes_h_l2168_c30_b1ff_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2168_c30_b1ff_x;
     sp_relative_shift_uxn_opcodes_h_l2168_c30_b1ff_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2168_c30_b1ff_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2168_c30_b1ff_return_output := sp_relative_shift_uxn_opcodes_h_l2168_c30_b1ff_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2176_c31_cf15] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2176_c31_cf15_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2176_c31_cf15_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2176_c31_cf15_return_output := CONST_SR_8_uxn_opcodes_h_l2176_c31_cf15_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2149_c11_8fd4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2149_c11_8fd4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_8fd4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2149_c11_8fd4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_8fd4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_8fd4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2149_c11_8fd4_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2161_l2156_l2153_l2149_l2178_l2146_l2173_l2141_l2164_l2138_DUPLICATE_226c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2161_l2156_l2153_l2149_l2178_l2146_l2173_l2141_l2164_l2138_DUPLICATE_226c_return_output := result.is_opc_done;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2161_l2133_l2156_l2153_l2149_l2146_l2141_l2164_l2138_DUPLICATE_feb4 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2161_l2133_l2156_l2153_l2149_l2146_l2141_l2164_l2138_DUPLICATE_feb4_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2164_c11_2746] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2164_c11_2746_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2164_c11_2746_left;
     BIN_OP_EQ_uxn_opcodes_h_l2164_c11_2746_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2164_c11_2746_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2164_c11_2746_return_output := BIN_OP_EQ_uxn_opcodes_h_l2164_c11_2746_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2133_c6_2331] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2133_c6_2331_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c6_2331_left;
     BIN_OP_EQ_uxn_opcodes_h_l2133_c6_2331_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c6_2331_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c6_2331_return_output := BIN_OP_EQ_uxn_opcodes_h_l2133_c6_2331_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2161_l2133_l2156_l2153_l2149_l2178_l2146_l2173_l2141_l2138_DUPLICATE_5f9d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2161_l2133_l2156_l2153_l2149_l2178_l2146_l2173_l2141_l2138_DUPLICATE_5f9d_return_output := result.is_stack_write;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_8bf1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c6_2331_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2133_c2_c4d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c6_2331_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_c4d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c6_2331_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_c4d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c6_2331_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_c4d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c6_2331_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_c4d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c6_2331_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_c4d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c6_2331_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c2_c4d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c6_2331_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2133_c2_c4d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c6_2331_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2133_c2_c4d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c6_2331_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2138_c7_00a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_dfd0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_00a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_dfd0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_00a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_dfd0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_00a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_dfd0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_00a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_dfd0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_00a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_dfd0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2138_c7_00a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_dfd0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2138_c7_00a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_dfd0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2138_c7_00a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_dfd0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2141_c7_f179_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_19d8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_f179_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_19d8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_f179_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_19d8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_f179_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_19d8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_f179_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_19d8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_f179_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_19d8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c7_f179_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_19d8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2141_c7_f179_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_19d8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2141_c7_f179_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_19d8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2146_c7_3ea7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2146_c11_f974_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2146_c7_3ea7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2146_c11_f974_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2146_c7_3ea7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2146_c11_f974_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2146_c7_3ea7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2146_c11_f974_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2146_c7_3ea7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2146_c11_f974_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2146_c7_3ea7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2146_c11_f974_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2146_c7_3ea7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2146_c11_f974_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2146_c7_3ea7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2146_c11_f974_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2146_c7_3ea7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2146_c11_f974_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2149_c7_1e05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_8fd4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_1e05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_8fd4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_1e05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_8fd4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_1e05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_8fd4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_1e05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_8fd4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_1e05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_8fd4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2149_c7_1e05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_8fd4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2149_c7_1e05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_8fd4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2149_c7_1e05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_8fd4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2153_c7_6aeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2153_c11_23f2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2153_c7_6aeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2153_c11_23f2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2153_c7_6aeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2153_c11_23f2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2153_c7_6aeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2153_c11_23f2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2153_c7_6aeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2153_c11_23f2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2153_c7_6aeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2153_c11_23f2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2153_c7_6aeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2153_c11_23f2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2153_c7_6aeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2153_c11_23f2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2156_c7_9ee4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2156_c11_a5d7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2156_c7_9ee4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2156_c11_a5d7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2156_c7_9ee4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2156_c11_a5d7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2156_c7_9ee4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2156_c11_a5d7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2156_c7_9ee4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2156_c11_a5d7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2156_c7_9ee4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2156_c11_a5d7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2156_c7_9ee4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2156_c11_a5d7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2156_c7_9ee4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2156_c11_a5d7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2161_c7_7ca6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2161_c11_efcb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2161_c7_7ca6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2161_c11_efcb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2161_c7_7ca6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2161_c11_efcb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2161_c7_7ca6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2161_c11_efcb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2161_c7_7ca6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2161_c11_efcb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2161_c7_7ca6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2161_c11_efcb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2161_c7_7ca6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2161_c11_efcb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2161_c7_7ca6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2161_c11_efcb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2164_c7_69e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2164_c11_2746_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2164_c7_69e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2164_c11_2746_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2164_c7_69e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2164_c11_2746_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2164_c7_69e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2164_c11_2746_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2164_c7_69e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2164_c11_2746_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2164_c7_69e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2164_c11_2746_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2164_c7_69e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2164_c11_2746_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2164_c7_69e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2164_c11_2746_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_a076_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c11_55b1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_a076_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c11_55b1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_a076_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c11_55b1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_a076_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c11_55b1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2173_c7_a076_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c11_55b1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2178_c7_29f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2178_c11_b9c5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2178_c7_29f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2178_c11_b9c5_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2150_c3_7e9b_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2157_l2150_l2142_l2165_DUPLICATE_d6c9_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2165_c3_a371_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2157_l2150_l2142_l2165_DUPLICATE_d6c9_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2158_l2143_DUPLICATE_c87a_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2157_l2150_l2142_l2165_DUPLICATE_d6c9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_c4d8_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2161_l2133_l2156_l2153_l2149_l2146_l2141_l2164_l2138_DUPLICATE_feb4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_00a7_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2161_l2133_l2156_l2153_l2149_l2146_l2141_l2164_l2138_DUPLICATE_feb4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_f179_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2161_l2133_l2156_l2153_l2149_l2146_l2141_l2164_l2138_DUPLICATE_feb4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2146_c7_3ea7_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2161_l2133_l2156_l2153_l2149_l2146_l2141_l2164_l2138_DUPLICATE_feb4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_1e05_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2161_l2133_l2156_l2153_l2149_l2146_l2141_l2164_l2138_DUPLICATE_feb4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2153_c7_6aeb_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2161_l2133_l2156_l2153_l2149_l2146_l2141_l2164_l2138_DUPLICATE_feb4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2156_c7_9ee4_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2161_l2133_l2156_l2153_l2149_l2146_l2141_l2164_l2138_DUPLICATE_feb4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2161_c7_7ca6_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2161_l2133_l2156_l2153_l2149_l2146_l2141_l2164_l2138_DUPLICATE_feb4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2164_c7_69e5_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2161_l2133_l2156_l2153_l2149_l2146_l2141_l2164_l2138_DUPLICATE_feb4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_00a7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2161_l2156_l2153_l2149_l2178_l2146_l2173_l2141_l2164_l2138_DUPLICATE_226c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_f179_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2161_l2156_l2153_l2149_l2178_l2146_l2173_l2141_l2164_l2138_DUPLICATE_226c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2146_c7_3ea7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2161_l2156_l2153_l2149_l2178_l2146_l2173_l2141_l2164_l2138_DUPLICATE_226c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_1e05_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2161_l2156_l2153_l2149_l2178_l2146_l2173_l2141_l2164_l2138_DUPLICATE_226c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2153_c7_6aeb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2161_l2156_l2153_l2149_l2178_l2146_l2173_l2141_l2164_l2138_DUPLICATE_226c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2156_c7_9ee4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2161_l2156_l2153_l2149_l2178_l2146_l2173_l2141_l2164_l2138_DUPLICATE_226c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2161_c7_7ca6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2161_l2156_l2153_l2149_l2178_l2146_l2173_l2141_l2164_l2138_DUPLICATE_226c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2164_c7_69e5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2161_l2156_l2153_l2149_l2178_l2146_l2173_l2141_l2164_l2138_DUPLICATE_226c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_a076_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2161_l2156_l2153_l2149_l2178_l2146_l2173_l2141_l2164_l2138_DUPLICATE_226c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2178_c7_29f2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2161_l2156_l2153_l2149_l2178_l2146_l2173_l2141_l2164_l2138_DUPLICATE_226c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_c4d8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2161_l2133_l2156_l2153_l2149_l2146_l2173_l2141_l2138_DUPLICATE_ec8a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_00a7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2161_l2133_l2156_l2153_l2149_l2146_l2173_l2141_l2138_DUPLICATE_ec8a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_f179_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2161_l2133_l2156_l2153_l2149_l2146_l2173_l2141_l2138_DUPLICATE_ec8a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2146_c7_3ea7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2161_l2133_l2156_l2153_l2149_l2146_l2173_l2141_l2138_DUPLICATE_ec8a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_1e05_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2161_l2133_l2156_l2153_l2149_l2146_l2173_l2141_l2138_DUPLICATE_ec8a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2153_c7_6aeb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2161_l2133_l2156_l2153_l2149_l2146_l2173_l2141_l2138_DUPLICATE_ec8a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2156_c7_9ee4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2161_l2133_l2156_l2153_l2149_l2146_l2173_l2141_l2138_DUPLICATE_ec8a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2161_c7_7ca6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2161_l2133_l2156_l2153_l2149_l2146_l2173_l2141_l2138_DUPLICATE_ec8a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_a076_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2161_l2133_l2156_l2153_l2149_l2146_l2173_l2141_l2138_DUPLICATE_ec8a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_c4d8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2161_l2133_l2156_l2153_l2149_l2178_l2146_l2173_l2141_l2138_DUPLICATE_5f9d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_00a7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2161_l2133_l2156_l2153_l2149_l2178_l2146_l2173_l2141_l2138_DUPLICATE_5f9d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_f179_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2161_l2133_l2156_l2153_l2149_l2178_l2146_l2173_l2141_l2138_DUPLICATE_5f9d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2146_c7_3ea7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2161_l2133_l2156_l2153_l2149_l2178_l2146_l2173_l2141_l2138_DUPLICATE_5f9d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_1e05_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2161_l2133_l2156_l2153_l2149_l2178_l2146_l2173_l2141_l2138_DUPLICATE_5f9d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2153_c7_6aeb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2161_l2133_l2156_l2153_l2149_l2178_l2146_l2173_l2141_l2138_DUPLICATE_5f9d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2156_c7_9ee4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2161_l2133_l2156_l2153_l2149_l2178_l2146_l2173_l2141_l2138_DUPLICATE_5f9d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2161_c7_7ca6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2161_l2133_l2156_l2153_l2149_l2178_l2146_l2173_l2141_l2138_DUPLICATE_5f9d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_a076_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2161_l2133_l2156_l2153_l2149_l2178_l2146_l2173_l2141_l2138_DUPLICATE_5f9d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2178_c7_29f2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2161_l2133_l2156_l2153_l2149_l2178_l2146_l2173_l2141_l2138_DUPLICATE_5f9d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c2_c4d8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2161_l2133_l2156_l2153_l2149_l2146_l2173_l2141_l2138_DUPLICATE_087b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2138_c7_00a7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2161_l2133_l2156_l2153_l2149_l2146_l2173_l2141_l2138_DUPLICATE_087b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c7_f179_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2161_l2133_l2156_l2153_l2149_l2146_l2173_l2141_l2138_DUPLICATE_087b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2146_c7_3ea7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2161_l2133_l2156_l2153_l2149_l2146_l2173_l2141_l2138_DUPLICATE_087b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2149_c7_1e05_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2161_l2133_l2156_l2153_l2149_l2146_l2173_l2141_l2138_DUPLICATE_087b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2153_c7_6aeb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2161_l2133_l2156_l2153_l2149_l2146_l2173_l2141_l2138_DUPLICATE_087b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2156_c7_9ee4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2161_l2133_l2156_l2153_l2149_l2146_l2173_l2141_l2138_DUPLICATE_087b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2161_c7_7ca6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2161_l2133_l2156_l2153_l2149_l2146_l2173_l2141_l2138_DUPLICATE_087b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2173_c7_a076_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2161_l2133_l2156_l2153_l2149_l2146_l2173_l2141_l2138_DUPLICATE_087b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_a076_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2173_c7_a076_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2164_c7_69e5_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2168_c30_b1ff_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l2150_c3_7e9b] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2150_c3_7e9b_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2150_c3_7e9b_left;
     BIN_OP_OR_uxn_opcodes_h_l2150_c3_7e9b_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2150_c3_7e9b_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2150_c3_7e9b_return_output := BIN_OP_OR_uxn_opcodes_h_l2150_c3_7e9b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2173_c7_a076] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_a076_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_a076_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_a076_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_a076_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_a076_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_a076_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_a076_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_a076_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2178_c7_29f2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2178_c7_29f2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2178_c7_29f2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2178_c7_29f2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2178_c7_29f2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2178_c7_29f2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2178_c7_29f2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2178_c7_29f2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2178_c7_29f2_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2176_c21_8228] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2176_c21_8228_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2176_c31_cf15_return_output);

     -- BIN_OP_OR[uxn_opcodes_h_l2165_c3_a371] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2165_c3_a371_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2165_c3_a371_left;
     BIN_OP_OR_uxn_opcodes_h_l2165_c3_a371_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2165_c3_a371_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2165_c3_a371_return_output := BIN_OP_OR_uxn_opcodes_h_l2165_c3_a371_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2133_c1_8bf1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_8bf1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_8bf1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_8bf1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_8bf1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_8bf1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_8bf1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_8bf1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_8bf1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2164_c7_69e5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2164_c7_69e5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2164_c7_69e5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2164_c7_69e5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2164_c7_69e5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2164_c7_69e5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2164_c7_69e5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2164_c7_69e5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2164_c7_69e5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2178_c7_29f2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2178_c7_29f2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2178_c7_29f2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2178_c7_29f2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2178_c7_29f2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2178_c7_29f2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2178_c7_29f2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2178_c7_29f2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2178_c7_29f2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2173_c7_a076] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_a076_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_a076_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_a076_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_a076_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_a076_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_a076_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_a076_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_a076_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2158_l2143_DUPLICATE_c87a LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2158_l2143_DUPLICATE_c87a_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2158_l2143_DUPLICATE_c87a_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2158_l2143_DUPLICATE_c87a_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2158_l2143_DUPLICATE_c87a_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2149_c7_1e05_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2150_c3_7e9b_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2166_c11_6723_right := VAR_BIN_OP_OR_uxn_opcodes_h_l2165_c3_a371_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2164_c7_69e5_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2165_c3_a371_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2173_c7_a076_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2176_c21_8228_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2156_c7_9ee4_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2158_l2143_DUPLICATE_c87a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2141_c7_f179_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2158_l2143_DUPLICATE_c87a_return_output;
     VAR_printf_uxn_opcodes_h_l2134_c3_8746_uxn_opcodes_h_l2134_c3_8746_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_8bf1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_a076_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2178_c7_29f2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2164_c7_69e5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_a076_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_a076_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2178_c7_29f2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2161_c7_7ca6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2164_c7_69e5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2164_c7_69e5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_a076_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2164_c7_69e5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2164_c7_69e5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2164_c7_69e5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2164_c7_69e5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2164_c7_69e5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2164_c7_69e5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2164_c7_69e5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2164_c7_69e5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2164_c7_69e5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2161_c7_7ca6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2161_c7_7ca6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2161_c7_7ca6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2161_c7_7ca6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2161_c7_7ca6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2161_c7_7ca6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2161_c7_7ca6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2161_c7_7ca6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2161_c7_7ca6_return_output;

     -- t16_MUX[uxn_opcodes_h_l2149_c7_1e05] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2149_c7_1e05_cond <= VAR_t16_MUX_uxn_opcodes_h_l2149_c7_1e05_cond;
     t16_MUX_uxn_opcodes_h_l2149_c7_1e05_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2149_c7_1e05_iftrue;
     t16_MUX_uxn_opcodes_h_l2149_c7_1e05_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2149_c7_1e05_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2149_c7_1e05_return_output := t16_MUX_uxn_opcodes_h_l2149_c7_1e05_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_opcodes_h_l2166_c11_6723] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2166_c11_6723_left <= VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2166_c11_6723_left;
     BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2166_c11_6723_right <= VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2166_c11_6723_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2166_c11_6723_return_output := BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2166_c11_6723_return_output;

     -- n16_MUX[uxn_opcodes_h_l2164_c7_69e5] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2164_c7_69e5_cond <= VAR_n16_MUX_uxn_opcodes_h_l2164_c7_69e5_cond;
     n16_MUX_uxn_opcodes_h_l2164_c7_69e5_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2164_c7_69e5_iftrue;
     n16_MUX_uxn_opcodes_h_l2164_c7_69e5_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2164_c7_69e5_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2164_c7_69e5_return_output := n16_MUX_uxn_opcodes_h_l2164_c7_69e5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2173_c7_a076] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_a076_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_a076_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_a076_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_a076_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_a076_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_a076_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_a076_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_a076_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2173_c7_a076] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2173_c7_a076_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2173_c7_a076_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2173_c7_a076_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2173_c7_a076_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2173_c7_a076_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2173_c7_a076_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2173_c7_a076_return_output := result_u8_value_MUX_uxn_opcodes_h_l2173_c7_a076_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2173_c7_a076] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_a076_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_a076_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_a076_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_a076_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_a076_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_a076_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_a076_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_a076_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2164_c7_69e5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2164_c7_69e5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2164_c7_69e5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2164_c7_69e5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2164_c7_69e5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2164_c7_69e5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2164_c7_69e5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2164_c7_69e5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2164_c7_69e5_return_output;

     -- printf_uxn_opcodes_h_l2134_c3_8746[uxn_opcodes_h_l2134_c3_8746] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2134_c3_8746_uxn_opcodes_h_l2134_c3_8746_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2134_c3_8746_uxn_opcodes_h_l2134_c3_8746_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- Submodule level 3
     VAR_tmp16_uxn_opcodes_h_l2166_c3_85ca := resize(VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2166_c11_6723_return_output, 16);
     VAR_n16_MUX_uxn_opcodes_h_l2161_c7_7ca6_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2164_c7_69e5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2164_c7_69e5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_a076_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2161_c7_7ca6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2164_c7_69e5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2164_c7_69e5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_a076_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2156_c7_9ee4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2161_c7_7ca6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2161_c7_7ca6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2164_c7_69e5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2164_c7_69e5_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2173_c7_a076_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2146_c7_3ea7_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2149_c7_1e05_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2164_c7_69e5_iftrue := VAR_tmp16_uxn_opcodes_h_l2166_c3_85ca;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2164_c7_69e5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2164_c7_69e5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2164_c7_69e5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2164_c7_69e5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2164_c7_69e5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2164_c7_69e5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2164_c7_69e5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2164_c7_69e5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2164_c7_69e5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2156_c7_9ee4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2156_c7_9ee4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2156_c7_9ee4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2156_c7_9ee4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2156_c7_9ee4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2156_c7_9ee4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2156_c7_9ee4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2156_c7_9ee4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2156_c7_9ee4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2161_c7_7ca6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2161_c7_7ca6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2161_c7_7ca6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2161_c7_7ca6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2161_c7_7ca6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2161_c7_7ca6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2161_c7_7ca6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2161_c7_7ca6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2161_c7_7ca6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2161_c7_7ca6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2161_c7_7ca6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2161_c7_7ca6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2161_c7_7ca6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2161_c7_7ca6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2161_c7_7ca6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2161_c7_7ca6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2161_c7_7ca6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2161_c7_7ca6_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2171_c21_d285] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2171_c21_d285_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_tmp16_uxn_opcodes_h_l2166_c3_85ca);

     -- t16_MUX[uxn_opcodes_h_l2146_c7_3ea7] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2146_c7_3ea7_cond <= VAR_t16_MUX_uxn_opcodes_h_l2146_c7_3ea7_cond;
     t16_MUX_uxn_opcodes_h_l2146_c7_3ea7_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2146_c7_3ea7_iftrue;
     t16_MUX_uxn_opcodes_h_l2146_c7_3ea7_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2146_c7_3ea7_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2146_c7_3ea7_return_output := t16_MUX_uxn_opcodes_h_l2146_c7_3ea7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2164_c7_69e5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2164_c7_69e5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2164_c7_69e5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2164_c7_69e5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2164_c7_69e5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2164_c7_69e5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2164_c7_69e5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2164_c7_69e5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2164_c7_69e5_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2164_c7_69e5] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2164_c7_69e5_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2164_c7_69e5_cond;
     tmp16_MUX_uxn_opcodes_h_l2164_c7_69e5_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2164_c7_69e5_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2164_c7_69e5_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2164_c7_69e5_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2164_c7_69e5_return_output := tmp16_MUX_uxn_opcodes_h_l2164_c7_69e5_return_output;

     -- n16_MUX[uxn_opcodes_h_l2161_c7_7ca6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2161_c7_7ca6_cond <= VAR_n16_MUX_uxn_opcodes_h_l2161_c7_7ca6_cond;
     n16_MUX_uxn_opcodes_h_l2161_c7_7ca6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2161_c7_7ca6_iftrue;
     n16_MUX_uxn_opcodes_h_l2161_c7_7ca6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2161_c7_7ca6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2161_c7_7ca6_return_output := n16_MUX_uxn_opcodes_h_l2161_c7_7ca6_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2164_c7_69e5_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2171_c21_d285_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2156_c7_9ee4_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2161_c7_7ca6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2161_c7_7ca6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2164_c7_69e5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2156_c7_9ee4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2161_c7_7ca6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2161_c7_7ca6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2164_c7_69e5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2153_c7_6aeb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2156_c7_9ee4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2156_c7_9ee4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2161_c7_7ca6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2141_c7_f179_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2146_c7_3ea7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2161_c7_7ca6_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2164_c7_69e5_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2164_c7_69e5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2164_c7_69e5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2164_c7_69e5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2164_c7_69e5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2164_c7_69e5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2164_c7_69e5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2164_c7_69e5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2164_c7_69e5_return_output := result_u8_value_MUX_uxn_opcodes_h_l2164_c7_69e5_return_output;

     -- n16_MUX[uxn_opcodes_h_l2156_c7_9ee4] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2156_c7_9ee4_cond <= VAR_n16_MUX_uxn_opcodes_h_l2156_c7_9ee4_cond;
     n16_MUX_uxn_opcodes_h_l2156_c7_9ee4_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2156_c7_9ee4_iftrue;
     n16_MUX_uxn_opcodes_h_l2156_c7_9ee4_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2156_c7_9ee4_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2156_c7_9ee4_return_output := n16_MUX_uxn_opcodes_h_l2156_c7_9ee4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2156_c7_9ee4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2156_c7_9ee4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2156_c7_9ee4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2156_c7_9ee4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2156_c7_9ee4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2156_c7_9ee4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2156_c7_9ee4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2156_c7_9ee4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2156_c7_9ee4_return_output;

     -- t16_MUX[uxn_opcodes_h_l2141_c7_f179] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2141_c7_f179_cond <= VAR_t16_MUX_uxn_opcodes_h_l2141_c7_f179_cond;
     t16_MUX_uxn_opcodes_h_l2141_c7_f179_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2141_c7_f179_iftrue;
     t16_MUX_uxn_opcodes_h_l2141_c7_f179_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2141_c7_f179_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2141_c7_f179_return_output := t16_MUX_uxn_opcodes_h_l2141_c7_f179_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2161_c7_7ca6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2161_c7_7ca6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2161_c7_7ca6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2161_c7_7ca6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2161_c7_7ca6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2161_c7_7ca6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2161_c7_7ca6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2161_c7_7ca6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2161_c7_7ca6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2156_c7_9ee4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2156_c7_9ee4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2156_c7_9ee4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2156_c7_9ee4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2156_c7_9ee4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2156_c7_9ee4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2156_c7_9ee4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2156_c7_9ee4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2156_c7_9ee4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2161_c7_7ca6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2161_c7_7ca6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2161_c7_7ca6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2161_c7_7ca6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2161_c7_7ca6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2161_c7_7ca6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2161_c7_7ca6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2161_c7_7ca6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2161_c7_7ca6_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2161_c7_7ca6] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2161_c7_7ca6_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2161_c7_7ca6_cond;
     tmp16_MUX_uxn_opcodes_h_l2161_c7_7ca6_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2161_c7_7ca6_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2161_c7_7ca6_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2161_c7_7ca6_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2161_c7_7ca6_return_output := tmp16_MUX_uxn_opcodes_h_l2161_c7_7ca6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2153_c7_6aeb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2153_c7_6aeb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2153_c7_6aeb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2153_c7_6aeb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2153_c7_6aeb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2153_c7_6aeb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2153_c7_6aeb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2153_c7_6aeb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2153_c7_6aeb_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2153_c7_6aeb_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2156_c7_9ee4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2156_c7_9ee4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2161_c7_7ca6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2153_c7_6aeb_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2156_c7_9ee4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2156_c7_9ee4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2161_c7_7ca6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_1e05_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2153_c7_6aeb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2153_c7_6aeb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2156_c7_9ee4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2161_c7_7ca6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2164_c7_69e5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2138_c7_00a7_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2141_c7_f179_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2156_c7_9ee4_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2161_c7_7ca6_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2156_c7_9ee4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2156_c7_9ee4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2156_c7_9ee4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2156_c7_9ee4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2156_c7_9ee4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2156_c7_9ee4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2156_c7_9ee4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2156_c7_9ee4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2156_c7_9ee4_return_output;

     -- t16_MUX[uxn_opcodes_h_l2138_c7_00a7] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2138_c7_00a7_cond <= VAR_t16_MUX_uxn_opcodes_h_l2138_c7_00a7_cond;
     t16_MUX_uxn_opcodes_h_l2138_c7_00a7_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2138_c7_00a7_iftrue;
     t16_MUX_uxn_opcodes_h_l2138_c7_00a7_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2138_c7_00a7_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2138_c7_00a7_return_output := t16_MUX_uxn_opcodes_h_l2138_c7_00a7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2156_c7_9ee4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2156_c7_9ee4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2156_c7_9ee4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2156_c7_9ee4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2156_c7_9ee4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2156_c7_9ee4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2156_c7_9ee4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2156_c7_9ee4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2156_c7_9ee4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2161_c7_7ca6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2161_c7_7ca6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2161_c7_7ca6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2161_c7_7ca6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2161_c7_7ca6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2161_c7_7ca6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2161_c7_7ca6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2161_c7_7ca6_return_output := result_u8_value_MUX_uxn_opcodes_h_l2161_c7_7ca6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2153_c7_6aeb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2153_c7_6aeb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2153_c7_6aeb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2153_c7_6aeb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2153_c7_6aeb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2153_c7_6aeb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2153_c7_6aeb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2153_c7_6aeb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2153_c7_6aeb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2153_c7_6aeb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2153_c7_6aeb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2153_c7_6aeb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2153_c7_6aeb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2153_c7_6aeb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2153_c7_6aeb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2153_c7_6aeb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2153_c7_6aeb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2153_c7_6aeb_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2156_c7_9ee4] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2156_c7_9ee4_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2156_c7_9ee4_cond;
     tmp16_MUX_uxn_opcodes_h_l2156_c7_9ee4_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2156_c7_9ee4_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2156_c7_9ee4_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2156_c7_9ee4_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2156_c7_9ee4_return_output := tmp16_MUX_uxn_opcodes_h_l2156_c7_9ee4_return_output;

     -- n16_MUX[uxn_opcodes_h_l2153_c7_6aeb] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2153_c7_6aeb_cond <= VAR_n16_MUX_uxn_opcodes_h_l2153_c7_6aeb_cond;
     n16_MUX_uxn_opcodes_h_l2153_c7_6aeb_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2153_c7_6aeb_iftrue;
     n16_MUX_uxn_opcodes_h_l2153_c7_6aeb_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2153_c7_6aeb_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2153_c7_6aeb_return_output := n16_MUX_uxn_opcodes_h_l2153_c7_6aeb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2149_c7_1e05] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_1e05_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_1e05_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_1e05_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_1e05_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_1e05_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_1e05_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_1e05_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_1e05_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2149_c7_1e05_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2153_c7_6aeb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2153_c7_6aeb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2156_c7_9ee4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_1e05_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2153_c7_6aeb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2153_c7_6aeb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2156_c7_9ee4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2146_c7_3ea7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_1e05_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_1e05_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2153_c7_6aeb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2156_c7_9ee4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2161_c7_7ca6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2133_c2_c4d8_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2138_c7_00a7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2153_c7_6aeb_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2156_c7_9ee4_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2153_c7_6aeb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2153_c7_6aeb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2153_c7_6aeb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2153_c7_6aeb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2153_c7_6aeb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2153_c7_6aeb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2153_c7_6aeb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2153_c7_6aeb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2153_c7_6aeb_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2149_c7_1e05] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_1e05_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_1e05_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_1e05_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_1e05_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_1e05_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_1e05_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_1e05_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_1e05_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2149_c7_1e05] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_1e05_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_1e05_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_1e05_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_1e05_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_1e05_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_1e05_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_1e05_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_1e05_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2153_c7_6aeb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2153_c7_6aeb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2153_c7_6aeb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2153_c7_6aeb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2153_c7_6aeb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2153_c7_6aeb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2153_c7_6aeb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2153_c7_6aeb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2153_c7_6aeb_return_output;

     -- n16_MUX[uxn_opcodes_h_l2149_c7_1e05] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2149_c7_1e05_cond <= VAR_n16_MUX_uxn_opcodes_h_l2149_c7_1e05_cond;
     n16_MUX_uxn_opcodes_h_l2149_c7_1e05_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2149_c7_1e05_iftrue;
     n16_MUX_uxn_opcodes_h_l2149_c7_1e05_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2149_c7_1e05_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2149_c7_1e05_return_output := n16_MUX_uxn_opcodes_h_l2149_c7_1e05_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2153_c7_6aeb] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2153_c7_6aeb_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2153_c7_6aeb_cond;
     tmp16_MUX_uxn_opcodes_h_l2153_c7_6aeb_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2153_c7_6aeb_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2153_c7_6aeb_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2153_c7_6aeb_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2153_c7_6aeb_return_output := tmp16_MUX_uxn_opcodes_h_l2153_c7_6aeb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2146_c7_3ea7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2146_c7_3ea7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2146_c7_3ea7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2146_c7_3ea7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2146_c7_3ea7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2146_c7_3ea7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2146_c7_3ea7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2146_c7_3ea7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2146_c7_3ea7_return_output;

     -- t16_MUX[uxn_opcodes_h_l2133_c2_c4d8] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2133_c2_c4d8_cond <= VAR_t16_MUX_uxn_opcodes_h_l2133_c2_c4d8_cond;
     t16_MUX_uxn_opcodes_h_l2133_c2_c4d8_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2133_c2_c4d8_iftrue;
     t16_MUX_uxn_opcodes_h_l2133_c2_c4d8_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2133_c2_c4d8_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2133_c2_c4d8_return_output := t16_MUX_uxn_opcodes_h_l2133_c2_c4d8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2156_c7_9ee4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2156_c7_9ee4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2156_c7_9ee4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2156_c7_9ee4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2156_c7_9ee4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2156_c7_9ee4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2156_c7_9ee4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2156_c7_9ee4_return_output := result_u8_value_MUX_uxn_opcodes_h_l2156_c7_9ee4_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2146_c7_3ea7_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2149_c7_1e05_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_1e05_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2153_c7_6aeb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2146_c7_3ea7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_1e05_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_1e05_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2153_c7_6aeb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_f179_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2146_c7_3ea7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2146_c7_3ea7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_1e05_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2153_c7_6aeb_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2156_c7_9ee4_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2133_c2_c4d8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2149_c7_1e05_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2153_c7_6aeb_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2146_c7_3ea7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2146_c7_3ea7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2146_c7_3ea7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2146_c7_3ea7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2146_c7_3ea7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2146_c7_3ea7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2146_c7_3ea7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2146_c7_3ea7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2146_c7_3ea7_return_output;

     -- n16_MUX[uxn_opcodes_h_l2146_c7_3ea7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2146_c7_3ea7_cond <= VAR_n16_MUX_uxn_opcodes_h_l2146_c7_3ea7_cond;
     n16_MUX_uxn_opcodes_h_l2146_c7_3ea7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2146_c7_3ea7_iftrue;
     n16_MUX_uxn_opcodes_h_l2146_c7_3ea7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2146_c7_3ea7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2146_c7_3ea7_return_output := n16_MUX_uxn_opcodes_h_l2146_c7_3ea7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2141_c7_f179] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_f179_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_f179_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_f179_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_f179_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_f179_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_f179_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_f179_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_f179_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2149_c7_1e05] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2149_c7_1e05_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2149_c7_1e05_cond;
     tmp16_MUX_uxn_opcodes_h_l2149_c7_1e05_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2149_c7_1e05_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2149_c7_1e05_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2149_c7_1e05_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2149_c7_1e05_return_output := tmp16_MUX_uxn_opcodes_h_l2149_c7_1e05_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2153_c7_6aeb] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2153_c7_6aeb_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2153_c7_6aeb_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2153_c7_6aeb_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2153_c7_6aeb_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2153_c7_6aeb_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2153_c7_6aeb_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2153_c7_6aeb_return_output := result_u8_value_MUX_uxn_opcodes_h_l2153_c7_6aeb_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2146_c7_3ea7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2146_c7_3ea7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2146_c7_3ea7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2146_c7_3ea7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2146_c7_3ea7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2146_c7_3ea7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2146_c7_3ea7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2146_c7_3ea7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2146_c7_3ea7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2149_c7_1e05] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_1e05_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_1e05_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_1e05_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_1e05_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_1e05_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_1e05_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_1e05_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_1e05_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2149_c7_1e05] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_1e05_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_1e05_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_1e05_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_1e05_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_1e05_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_1e05_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_1e05_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_1e05_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l2141_c7_f179_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2146_c7_3ea7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2146_c7_3ea7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_1e05_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_f179_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2146_c7_3ea7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2146_c7_3ea7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_1e05_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_00a7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_f179_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_f179_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2146_c7_3ea7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2149_c7_1e05_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2153_c7_6aeb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2146_c7_3ea7_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2149_c7_1e05_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2146_c7_3ea7] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2146_c7_3ea7_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2146_c7_3ea7_cond;
     tmp16_MUX_uxn_opcodes_h_l2146_c7_3ea7_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2146_c7_3ea7_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2146_c7_3ea7_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2146_c7_3ea7_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2146_c7_3ea7_return_output := tmp16_MUX_uxn_opcodes_h_l2146_c7_3ea7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2141_c7_f179] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_f179_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_f179_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_f179_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_f179_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_f179_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_f179_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_f179_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_f179_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2146_c7_3ea7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2146_c7_3ea7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2146_c7_3ea7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2146_c7_3ea7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2146_c7_3ea7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2146_c7_3ea7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2146_c7_3ea7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2146_c7_3ea7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2146_c7_3ea7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2146_c7_3ea7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2146_c7_3ea7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2146_c7_3ea7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2146_c7_3ea7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2146_c7_3ea7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2146_c7_3ea7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2146_c7_3ea7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2146_c7_3ea7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2146_c7_3ea7_return_output;

     -- n16_MUX[uxn_opcodes_h_l2141_c7_f179] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2141_c7_f179_cond <= VAR_n16_MUX_uxn_opcodes_h_l2141_c7_f179_cond;
     n16_MUX_uxn_opcodes_h_l2141_c7_f179_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2141_c7_f179_iftrue;
     n16_MUX_uxn_opcodes_h_l2141_c7_f179_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2141_c7_f179_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2141_c7_f179_return_output := n16_MUX_uxn_opcodes_h_l2141_c7_f179_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2141_c7_f179] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_f179_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_f179_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_f179_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_f179_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_f179_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_f179_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_f179_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_f179_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2149_c7_1e05] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2149_c7_1e05_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2149_c7_1e05_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2149_c7_1e05_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2149_c7_1e05_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2149_c7_1e05_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2149_c7_1e05_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2149_c7_1e05_return_output := result_u8_value_MUX_uxn_opcodes_h_l2149_c7_1e05_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2138_c7_00a7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_00a7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_00a7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_00a7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_00a7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_00a7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_00a7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_00a7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_00a7_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l2138_c7_00a7_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2141_c7_f179_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_f179_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2146_c7_3ea7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_00a7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_f179_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_f179_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2146_c7_3ea7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_c4d8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_00a7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_00a7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_f179_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2146_c7_3ea7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2149_c7_1e05_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2141_c7_f179_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2146_c7_3ea7_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2146_c7_3ea7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2146_c7_3ea7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2146_c7_3ea7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2146_c7_3ea7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2146_c7_3ea7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2146_c7_3ea7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2146_c7_3ea7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2146_c7_3ea7_return_output := result_u8_value_MUX_uxn_opcodes_h_l2146_c7_3ea7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2141_c7_f179] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_f179_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_f179_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_f179_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_f179_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_f179_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_f179_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_f179_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_f179_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2141_c7_f179] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_f179_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_f179_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_f179_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_f179_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_f179_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_f179_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_f179_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_f179_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2133_c2_c4d8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_c4d8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_c4d8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_c4d8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_c4d8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_c4d8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_c4d8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_c4d8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_c4d8_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2141_c7_f179] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2141_c7_f179_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2141_c7_f179_cond;
     tmp16_MUX_uxn_opcodes_h_l2141_c7_f179_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2141_c7_f179_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2141_c7_f179_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2141_c7_f179_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2141_c7_f179_return_output := tmp16_MUX_uxn_opcodes_h_l2141_c7_f179_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2138_c7_00a7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_00a7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_00a7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_00a7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_00a7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_00a7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_00a7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_00a7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_00a7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2138_c7_00a7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_00a7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_00a7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_00a7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_00a7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_00a7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_00a7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_00a7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_00a7_return_output;

     -- n16_MUX[uxn_opcodes_h_l2138_c7_00a7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2138_c7_00a7_cond <= VAR_n16_MUX_uxn_opcodes_h_l2138_c7_00a7_cond;
     n16_MUX_uxn_opcodes_h_l2138_c7_00a7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2138_c7_00a7_iftrue;
     n16_MUX_uxn_opcodes_h_l2138_c7_00a7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2138_c7_00a7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2138_c7_00a7_return_output := n16_MUX_uxn_opcodes_h_l2138_c7_00a7_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l2133_c2_c4d8_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2138_c7_00a7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_00a7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_f179_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_c4d8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_00a7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_00a7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_f179_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_c4d8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_00a7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c7_f179_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2146_c7_3ea7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2138_c7_00a7_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2141_c7_f179_return_output;
     -- n16_MUX[uxn_opcodes_h_l2133_c2_c4d8] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2133_c2_c4d8_cond <= VAR_n16_MUX_uxn_opcodes_h_l2133_c2_c4d8_cond;
     n16_MUX_uxn_opcodes_h_l2133_c2_c4d8_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2133_c2_c4d8_iftrue;
     n16_MUX_uxn_opcodes_h_l2133_c2_c4d8_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2133_c2_c4d8_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2133_c2_c4d8_return_output := n16_MUX_uxn_opcodes_h_l2133_c2_c4d8_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2138_c7_00a7] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2138_c7_00a7_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2138_c7_00a7_cond;
     tmp16_MUX_uxn_opcodes_h_l2138_c7_00a7_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2138_c7_00a7_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2138_c7_00a7_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2138_c7_00a7_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2138_c7_00a7_return_output := tmp16_MUX_uxn_opcodes_h_l2138_c7_00a7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2138_c7_00a7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_00a7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_00a7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_00a7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_00a7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_00a7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_00a7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_00a7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_00a7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2138_c7_00a7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_00a7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_00a7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_00a7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_00a7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_00a7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_00a7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_00a7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_00a7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2141_c7_f179] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2141_c7_f179_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c7_f179_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2141_c7_f179_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c7_f179_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2141_c7_f179_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c7_f179_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c7_f179_return_output := result_u8_value_MUX_uxn_opcodes_h_l2141_c7_f179_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2133_c2_c4d8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_c4d8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_c4d8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_c4d8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_c4d8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_c4d8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_c4d8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_c4d8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_c4d8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2133_c2_c4d8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_c4d8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_c4d8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_c4d8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_c4d8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_c4d8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_c4d8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_c4d8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_c4d8_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2133_c2_c4d8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_c4d8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_00a7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_c4d8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_00a7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2138_c7_00a7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c7_f179_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2133_c2_c4d8_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2138_c7_00a7_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2138_c7_00a7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2138_c7_00a7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2138_c7_00a7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2138_c7_00a7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2138_c7_00a7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2138_c7_00a7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2138_c7_00a7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2138_c7_00a7_return_output := result_u8_value_MUX_uxn_opcodes_h_l2138_c7_00a7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2133_c2_c4d8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_c4d8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_c4d8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_c4d8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_c4d8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_c4d8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_c4d8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_c4d8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_c4d8_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2133_c2_c4d8] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2133_c2_c4d8_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2133_c2_c4d8_cond;
     tmp16_MUX_uxn_opcodes_h_l2133_c2_c4d8_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2133_c2_c4d8_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2133_c2_c4d8_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2133_c2_c4d8_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2133_c2_c4d8_return_output := tmp16_MUX_uxn_opcodes_h_l2133_c2_c4d8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2133_c2_c4d8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_c4d8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_c4d8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_c4d8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_c4d8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_c4d8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_c4d8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_c4d8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_c4d8_return_output;

     -- Submodule level 12
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c2_c4d8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2138_c7_00a7_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2133_c2_c4d8_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2133_c2_c4d8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2133_c2_c4d8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c2_c4d8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2133_c2_c4d8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c2_c4d8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2133_c2_c4d8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c2_c4d8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c2_c4d8_return_output := result_u8_value_MUX_uxn_opcodes_h_l2133_c2_c4d8_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l2183_l2129_DUPLICATE_5039 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l2183_l2129_DUPLICATE_5039_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_641b(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_c4d8_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_c4d8_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_c4d8_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_c4d8_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c2_c4d8_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_c4d8_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l2183_l2129_DUPLICATE_5039_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l2183_l2129_DUPLICATE_5039_return_output;
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
